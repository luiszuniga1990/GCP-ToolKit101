variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

provider "google" {
  project = var.project_id
}

# Dashboard de Monitoreo Genérico
resource "google_monitoring_dashboard" "health_dashboard" {
  dashboard_json = <<EOF
{
  "displayName": "101 ToolKit - Global Health Dashboard",
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
}
