variable "credentials_file" {
  description = "Path to the GCP Service Account JSON credentials file"
  type        = string
  default     = null
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "bucket_name_suffix" {
  description = "Suffix for the Cloud Storage bucket name"
  type        = string
  default     = "data-ingestion"
}

variable "dataset_id" {
  description = "BigQuery dataset ID"
  type        = string
  default     = "raw_data_ingestion"
}

variable "location" {
  description = "Location for GCS and BigQuery"
  type        = string
  default     = "US"
}

variable "transfer_schedule" {
  description = "Schedule for the BigQuery Data Transfer"
  type        = string
  default     = "every 24 hours"
}

variable "table_name_template" {
  description = "Destination table name"
  type        = string
  default     = "daily_sales"
}

variable "labels" {
  description = "Labels to apply to resources"
  type        = map(string)
  default = {
    environment = "production"
    managed_by  = "terraform"
    security    = "hardened"
  }
}
