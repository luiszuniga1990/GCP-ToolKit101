output "dashboard_id" {
  description = "The ID of the created monitoring dashboard"
  value       = google_monitoring_dashboard.health_dashboard.id
}

output "dashboard_name" {
  description = "The display name of the dashboard"
  value       = var.dashboard_name
}
