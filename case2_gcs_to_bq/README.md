# Case 2: GCS to BigQuery Pipeline

Automation of flat file ingestion into a data warehouse using BigQuery Data Transfer Service (DTS).

## Component Diagram

```text
   +-------------------+       +-------------------+       +-------------------+
   | External Files    | ----> |   Cloud Storage   | ----> |  BigQuery Dataset |
   | (CSV / JSON)      | Upload|   (Bucket Sink)   | DTS   | (raw_data_ingest) |
   +-------------------+       +-------------------+       +-------------------+
```

## Deployment & Destruction

### Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) authenticated.
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (v1.5.0+).

### Steps to Deploy
1. Navigate to the folder:
   ```bash
   cd case2_gcs_to_bq
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

## How to use
1. Upload a CSV file (with headers) to the bucket: `gs://<project_id>-data-ingestion/data.csv`.
2. The transfer will run according to the schedule (default: every 24h).
3. You can also manually trigger the transfer in the GCP Console under **BigQuery > Data Transfers**.
