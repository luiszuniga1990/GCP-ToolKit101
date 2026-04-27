terraform {
  required_version = ">= 1.6.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  # OPTIONAL BEST PRACTICE: Uncomment below and configure to use GCS for remote state management
  # backend "gcs" {
  #   bucket = "YOUR_TERRAFORM_STATE_BUCKET"
  #   prefix = "terraform/vpc/state"
  # }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
