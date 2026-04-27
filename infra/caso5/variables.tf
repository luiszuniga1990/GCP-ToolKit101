variable "project_id" {
  description = "The GCP Project ID where resources will be deployed"
  type        = string
}

variable "region" {
  description = "The GCP default region"
  type        = string
  default     = "us-central1"
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "secure-vpc"
}

variable "subnets" {
  description = "A list of objects specifying the subnets to create"
  type = list(object({
    name                     = string
    ip_cidr_range            = string
    region                   = string
    private_ip_google_access = bool
  }))
  default = [
    {
      name                     = "subnet-private-us-central1"
      ip_cidr_range            = "10.0.1.0/24"
      region                   = "us-central1"
      private_ip_google_access = true
    }
  ]
}
