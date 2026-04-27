# ------------------------------------------------------------------------------
# VPC NETWORK
# ------------------------------------------------------------------------------
resource "google_compute_network" "vpc" {
  name                            = var.network_name
  # Best Practice: Use custom subnet mode instead of auto to strictly control IP ranges
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = false
}

# ------------------------------------------------------------------------------
# SUBNETS
# ------------------------------------------------------------------------------
resource "google_compute_subnetwork" "subnet" {
  count = length(var.subnets)

  name                     = var.subnets[count.index].name
  ip_cidr_range            = var.subnets[count.index].ip_cidr_range
  region                   = var.subnets[count.index].region
  network                  = google_compute_network.vpc.id
  
  # Best Practice: Enable Private Google Access to reach Google APIs without public IPs
  private_ip_google_access = var.subnets[count.index].private_ip_google_access

  # Best Practice: Enable VPC Flow Logs for network monitoring and forensics
  log_config {
    aggregation_interval = "INTERVAL_5_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# ------------------------------------------------------------------------------
# CLOUD ROUTER & NAT
# ------------------------------------------------------------------------------
# Best Practice: Enables outbound internet access for instances with only private IPs
resource "google_compute_router" "router" {
  name    = "${var.network_name}-router"
  region  = var.region
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.network_name}-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  # Recommended: Enable logging for NAT to troubleshoot egress traffic
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

# ------------------------------------------------------------------------------
# FIREWALL RULES
# ------------------------------------------------------------------------------
# Best Practice: Allow identity-aware proxy (IAP) to tunnel SSH instead of exposing port 22 directly
resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "${var.network_name}-allow-iap-ssh"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # 35.235.240.0/20 is the specific IP range used by Google's Identity-Aware Proxy (IAP)
  source_ranges = ["35.235.240.0/20"]
}
