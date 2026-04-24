###############################################################################
# Case 1 - Billing Export Dataset
# Creates a BigQuery dataset to receive GCP Billing export data.
# After applying, manually configure Billing Export in the GCP Console.
###############################################################################

provider "google" {
  project = var.project_id
  region  = var.region
}

# ---------------------------------------------------------------------------
# Enable required APIs
# ---------------------------------------------------------------------------
resource "google_project_service" "bigquery_api" {
  project = var.project_id
  service = "bigquery.googleapis.com"

  disable_dependent_services = false
  disable_on_destroy         = false
}

# ---------------------------------------------------------------------------
# BigQuery Dataset for Billing Export
# ---------------------------------------------------------------------------
resource "google_bigquery_dataset" "billing_export" {
  dataset_id                  = var.dataset_id
  friendly_name               = "Billing Export Dataset"
  description                 = var.dataset_description
  location                    = var.dataset_location
  delete_contents_on_destroy  = false
  default_table_expiration_ms = var.default_table_expiration_ms
  labels                      = var.labels

  depends_on = [google_project_service.bigquery_api]
}
