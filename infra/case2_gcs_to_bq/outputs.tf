output "bucket_url" {
  description = "The URL of the Cloud Storage bucket"
  value       = google_storage_bucket.data_sink.url
}

output "dataset_id" {
  description = "The ID of the BigQuery dataset"
  value       = google_bigquery_dataset.ingestion.dataset_id
}

output "transfer_config_id" {
  description = "The ID of the Data Transfer configuration"
  value       = google_bigquery_data_transfer_config.gcs_to_bq.name
}
