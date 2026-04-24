variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "dashboard_name" {
  description = "Display name of the Monitoring Dashboard"
  type        = string
  default     = "101 ToolKit - Global Health Dashboard"
}
