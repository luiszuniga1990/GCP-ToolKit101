###############################################################################
# Case 4 - Health Monitoring Dashboard
# Creates a centralized dashboard for VM and Database observability.
###############################################################################

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.credentials_file != null ? file(var.credentials_file) : null
}

# ---------------------------------------------------------------------------
# Enable Required APIs
# ---------------------------------------------------------------------------
resource "google_project_service" "monitoring_api" {
  project = var.project_id
  service = "monitoring.googleapis.com"

  disable_dependent_services = false
  disable_on_destroy         = false
}

# ---------------------------------------------------------------------------
# Monitoring Dashboard
# ---------------------------------------------------------------------------
resource "google_monitoring_dashboard" "health_dashboard" {
  dashboard_json = <<EOF
{
  "displayName": "${var.dashboard_name}",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "CPU Usage (All VMs)",
        "xyChart": {
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/cpu/utilization\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_MEAN"
                }
              }
            }
          }]
        }
      },
      {
        "title": "Cloud SQL Connections",
        "xyChart": {
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"cloudsql.googleapis.com/database/network/active_connections\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_MEAN"
                }
              }
            }
          }]
        }
      }
    ]
  }
}
EOF

  depends_on = [google_project_service.monitoring_api]
}
