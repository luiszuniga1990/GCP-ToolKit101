variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

provider "google" {
  project = var.project_id
}

# Dataset para Logs
resource "google_bigquery_dataset" "log_archive_dataset" {
  dataset_id = "security_log_archive"
  location   = "US"
}

# Sink de Logs a nivel de Proyecto
resource "google_logging_project_sink" "bq_log_sink" {
  name        = "critical_activity_sink"
  destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.log_archive_dataset.dataset_id}"
  
  # Filtro para capturar Auditoría y Cambios de IAM
  filter = "logName:\"logs/cloudaudit.googleapis.com%2Factivity\" OR logName:\"logs/cloudaudit.googleapis.com%2Fpolicy\""

  unique_writer_identity = true
}

# Permisos para que el Sink pueda escribir en BigQuery
resource "google_project_iam_member" "log_sink_writer" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = google_logging_project_sink.bq_log_sink.writer_identity
}
