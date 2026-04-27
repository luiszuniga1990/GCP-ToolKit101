# This file uses Terraform's Native testing Framework (Requires Terraform v1.6.0+)
# We will use the 'plan' command to validate structure and assertions without physically applying

variables {
  project_id   = "test-mock-project-id" 
  region       = "us-central1"
  network_name = "test-secure-vpc"
  subnets = [
    {
      name                     = "test-private-subnet"
      ip_cidr_range            = "10.0.1.0/24"
      region                   = "us-central1"
      private_ip_google_access = true
    }
  ]
}

run "enforce_vpc_best_practices" {
  command = plan

  # 1. Ensure custom subnet mode is enforced
  assert {
    condition     = google_compute_network.vpc.auto_create_subnetworks == false
    error_message = "SECURITY WARNING: VPC must have auto_create_subnetworks set to false to prevent overly permissive environments."
  }

  # 2. Ensure Private Google Access is enabled
  assert {
    condition     = google_compute_subnetwork.subnet[0].private_ip_google_access == true
    error_message = "SECURITY WARNING: Subnets must enable private_ip_google_access."
  }

  # 3. Ensure SSH goes strictly through IAP
  assert {
    condition     = google_compute_firewall.allow_iap_ssh.source_ranges[0] == "35.235.240.0/20"
    error_message = "FIREWALL WARNING: SSH Firewalls must strictly limit inbound ranges to the IAP Proxy range (35.235.240.0/20)."
  }

  # 4. Check that Cloud NAT is properly mapped
  assert {
    condition     = google_compute_router_nat.nat.source_subnetwork_ip_ranges_to_nat == "ALL_SUBNETWORKS_ALL_IP_RANGES"
    error_message = "CLOUDNAT WARNING: All subnets should be funneled through Cloud NAT to maintain private egress."
  }
}
