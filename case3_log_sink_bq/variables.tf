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

variable "dataset_id" {
  description = "BigQuery dataset ID for log archiving"
  type        = string
  default     = "security_log_archive"
}

variable "location" {
  description = "Location for BigQuery dataset"
  type        = string
  default     = "US"
}

variable "sink_name" {
  description = "Name of the logging project sink"
  type        = string
  default     = "critical_activity_sink"
}

variable "log_filter" {
  description = "Filter for the log sink"
  type        = string
  default     = "logName:\"logs/cloudaudit.googleapis.com%2Factivity\" OR logName:\"logs/cloudaudit.googleapis.com%2Fpolicy\""
}

variable "labels" {
  description = "Labels to apply to resources"
  type        = map(string)
  default = {
    environment = "production"
    managed_by  = "terraform"
    purpose     = "security-auditing"
  }
}
