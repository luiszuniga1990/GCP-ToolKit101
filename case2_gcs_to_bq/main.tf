###############################################################################
# Case 2 - GCS to BigQuery Pipeline
# Automates loading CSV data from a bucket to a BigQuery table.
###############################################################################

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.credentials_file != null ? file(var.credentials_file) : null
}

# ---------------------------------------------------------------------------
# Enable Required APIs
# ---------------------------------------------------------------------------
resource "google_project_service" "apis" {
  for_each = toset([
    "bigquerydatatransfer.googleapis.com",
    "storage.googleapis.com",
    "bigquery.googleapis.com"
  ])
  project = var.project_id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy         = false
}

# ---------------------------------------------------------------------------
# 1. Storage Bucket
# ---------------------------------------------------------------------------
resource "google_storage_bucket" "data_sink" {
  name                        = "${var.project_id}-${var.bucket_name_suffix}"
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true

  depends_on = [google_project_service.apis]
}

# ---------------------------------------------------------------------------
# 2. BigQuery Dataset
# ---------------------------------------------------------------------------
resource "google_bigquery_dataset" "ingestion" {
  dataset_id = var.dataset_id
  location   = var.location

  depends_on = [google_project_service.apis]
}

# ---------------------------------------------------------------------------
# 3. BigQuery Data Transfer Configuration
# ---------------------------------------------------------------------------
resource "google_bigquery_data_transfer_config" "gcs_to_bq" {
  display_name           = "GCS to BigQuery Transfer"
  destination_dataset_id = google_bigquery_dataset.ingestion.dataset_id
  data_source_id         = "google_cloud_storage"
  schedule               = var.transfer_schedule
  
  params = {
    data_path_template              = "gs://${google_storage_bucket.data_sink.name}/*.csv"
    destination_table_name_template = var.table_name_template
    format                          = "CSV"
    write_disposition               = "APPEND"
    skip_leading_rows               = "1"
  }

  depends_on = [google_project_service.apis]
}
