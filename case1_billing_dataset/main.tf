variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región de GCP"
  type        = string
  default     = "us-central1"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Creación del Dataset para hospedar la exportación de Billing
resource "google_bigquery_dataset" "billing_export_dataset" {
  dataset_id                  = "billing_export_data"
  friendly_name               = "Billing Export Dataset"
  description                 = "Dataset para recibir la exportación automática de facturación de GCP"
  location                    = "US"
  delete_contents_on_destroy = false
}

output "dataset_id" {
  value = google_bigquery_dataset.billing_export_dataset.dataset_id
}
