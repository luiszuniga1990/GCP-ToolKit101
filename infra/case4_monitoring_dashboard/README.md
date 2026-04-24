# Case 4: Health Monitoring Dashboard

Centralized visual dashboard for project resource observability.

## Component Diagram

```text
   +-------------------+
   | Compute Engine VM | --+
   +-------------------+   |    +-------------------+       +-------------------+
                           +--> |  Cloud Monitoring | ----> |  Custom Dashboard |
   +-------------------+   |    |  (Metrics)        |       |  (Visualization)  |
   | Cloud SQL (DB)    | --+    +-------------------+       +-------------------+
   +-------------------+
```

## Deployment & Destruction

### Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) authenticated.
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (v1.5.0+).

### Steps to Deploy
1. Navigate to the folder:
   ```bash
   cd case4_monitoring_dashboard
   ```
2. Initialize and Apply:
   ```bash
   terraform init
   terraform apply
   ```

### Steps to Destroy
```bash
terraform destroy
```

## Included Charts
- **CPU Utilization**: Aggregated CPU percentage for all Compute Engine instances.
- **Active Connections**: Real-time connection count for all Cloud SQL databases.

You can view the dashboard in the GCP Console under **Monitoring > Dashboards**.
