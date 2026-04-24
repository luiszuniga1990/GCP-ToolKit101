###############################################################################
# Case 3 - Log Sink to BigQuery
# Captures critical audit logs and archives them in BigQuery for compliance.
###############################################################################

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.credentials_file != null ? file(var.credentials_file) : null
}

# ---------------------------------------------------------------------------
# Enable Required APIs
# ---------------------------------------------------------------------------
resource "google_project_service" "logging_apis" {
  for_each = toset([
    "logging.googleapis.com",
    "bigquery.googleapis.com"
  ])
  project = var.project_id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy         = false
}

# ---------------------------------------------------------------------------
# 1. BigQuery Dataset for Logs
# ---------------------------------------------------------------------------
resource "google_bigquery_dataset" "log_archive" {
  dataset_id = var.dataset_id
  location   = var.location

  depends_on = [google_project_service.logging_apis]
}

# ---------------------------------------------------------------------------
# 2. Project-Level Log Sink
# ---------------------------------------------------------------------------
resource "google_logging_project_sink" "bq_log_sink" {
  name        = var.sink_name
  destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.log_archive.dataset_id}"
  filter      = var.log_filter

  unique_writer_identity = true

  depends_on = [google_project_service.logging_apis]
}

# ---------------------------------------------------------------------------
# 3. IAM Permissions for Log Sink
# ---------------------------------------------------------------------------
resource "google_project_iam_member" "log_sink_writer" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = google_logging_project_sink.bq_log_sink.writer_identity
}
