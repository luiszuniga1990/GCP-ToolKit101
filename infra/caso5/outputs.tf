output "network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.vpc.id
}

output "network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.vpc.name
}

output "subnet_names" {
  description = "The names of the created subnets"
  value       = google_compute_subnetwork.subnet[*].name
}

output "subnet_cidrs" {
  description = "The CIDR blocks of the created subnets"
  value       = google_compute_subnetwork.subnet[*].ip_cidr_range
}
