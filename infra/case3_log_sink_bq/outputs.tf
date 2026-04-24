output "sink_writer_identity" {
  description = "The service account identity used by the log sink to write to the destination"
  value       = google_logging_project_sink.bq_log_sink.writer_identity
}

output "dataset_id" {
  description = "The ID of the BigQuery dataset where logs are stored"
  value       = google_bigquery_dataset.log_archive.dataset_id
}

output "sink_id" {
  description = "The ID of the logging sink"
  value       = google_logging_project_sink.bq_log_sink.id
}
