variable "project_id" {
  description = "GCP Project ID where the BigQuery dataset will be created"
  type        = string
}

variable "region" {
  description = "GCP region for the provider"
  type        = string
  default     = "us-central1"
}

variable "dataset_id" {
  description = "BigQuery dataset ID for billing export"
  type        = string
  default     = "billing_export_data"
}

variable "dataset_location" {
  description = "Location for the BigQuery dataset (US, EU, etc.)"
  type        = string
  default     = "US"
}

variable "dataset_description" {
  description = "Description for the billing export dataset"
  type        = string
  default     = "Dataset to receive automatic GCP billing export data"
}

variable "default_table_expiration_ms" {
  description = "Default table expiration in milliseconds. Null means tables never expire."
  type        = number
  default     = null
}

variable "labels" {
  description = "Labels to apply to the BigQuery dataset"
  type        = map(string)
  default = {
    environment = "production"
    managed_by  = "terraform"
    purpose     = "billing-export"
  }
}
