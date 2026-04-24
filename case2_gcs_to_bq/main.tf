variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

provider "google" {
  project = var.project_id
}

# 1. Bucket de Storage para recibir archivos CSV/JSON
resource "google_storage_bucket" "data_sink_bucket" {
  name                        = "${var.project_id}-data-ingestion"
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
}

# 2. Dataset de BigQuery de destino
resource "google_bigquery_dataset" "ingestion_dataset" {
  dataset_id = "raw_data_ingestion"
  location   = "US"
}

# 3. Configuración del Data Transfer Service (Ejemplo genérico)
# Nota: Requiere haber habilitado la API de BigQuery Data Transfer
resource "google_bigquery_data_transfer_config" "gcs_to_bq" {
  display_name           = "GCS to BigQuery Transfer"
  destination_dataset_id = google_bigquery_dataset.ingestion_dataset.dataset_id
  data_source_id         = "google_cloud_storage"
  schedule               = "every 24 hours"
  
  params = {
    data_path_template              = "gs://${google_storage_bucket.data_sink_bucket.name}/*.csv"
    destination_table_name_template = "daily_sales"
    format                          = "CSV"
    write_disposition               = "APPEND"
    skip_leading_rows               = "1"
  }
}
