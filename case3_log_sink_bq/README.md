# Case 3: Log Sink to BigQuery

Configuration of a critical log pipeline for security auditing and compliance.

## Component Diagram

```text
   +-------------------+       +-------------------+       +-------------------+
   | Resource (VM, IAM)| ----> |   Cloud Logging   | ----> |  BigQuery Dataset |
   | Generates Event   |       | (Sink Filter)     | Router| (log_archive)     |
   +-------------------+       +-------------------+       +-------------------+
                                         |
                                         V
                                 [Writer Identity]
                                 (IAM Permissions)
```

## Deployment & Destruction

### Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) authenticated.
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (v1.5.0+).

### Steps to Deploy
1. Navigate to the folder:
   ```bash
   cd case3_log_sink_bq
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

## Log Filter Details
By default, this sink captures:
- **Administrative Activity**: Logs for operations that modify the configuration or metadata of resources.
- **Policy Metadata**: Logs for operations that modify IAM policies.

You can customize the `log_filter` variable in `variables.tf` to capture different events (e.g., Data Access logs).
