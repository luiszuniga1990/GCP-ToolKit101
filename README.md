# 101 ToolKit GCP - Basic Project Guide

This repository is a collection of **Terraform** templates designed to deploy basic and functional infrastructures in Google Cloud Platform. Each case is independent and focused on automating common data and observability tasks.

## Project Structure

```text
101ToolKitGCP/
├── case1_billing_dataset/      # Preparation for Billing export
├── case2_gcs_to_bq/           # CSV/JSON file ingestion pipeline
├── case3_log_sink_bq/         # Auditing and centralization of critical logs
└── case4_monitoring_dashboard/ # Health metrics visualization
```

## Base Cost Table (Estimated)

| Service | Concept | Estimated Cost (Free Tier available) |
| :--- | :--- | :--- |
| **BigQuery** | Storage | $0.02 per GB / month (First 10GB free) |
| **BigQuery** | Analysis (Queries) | $5 per TB (First 1TB per month free) |
| **Cloud Storage** | Storage | ~$0.02 per GB (First 5GB free in certain regions) |
| **Cloud Logging** | Log Ingestion | $0.50 per GiB (First 50GB per project/month free) |
| **Monitoring** | Dashboards | **Free** |
| **BigQuery DTS** | GCS Transfer | **Free** (Only pay for BQ storage/queries) |

---
*For more details on each component, please refer to the README inside each folder.*
