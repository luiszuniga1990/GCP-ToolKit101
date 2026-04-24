output "dataset_id" {
  description = "The ID of the BigQuery dataset created for billing export"
  value       = google_bigquery_dataset.billing_export.dataset_id
}

output "dataset_self_link" {
  description = "The URI of the BigQuery dataset"
  value       = google_bigquery_dataset.billing_export.self_link
}

output "dataset_project" {
  description = "The project where the dataset was created"
  value       = google_bigquery_dataset.billing_export.project
}
