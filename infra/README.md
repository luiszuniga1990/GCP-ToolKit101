# Infrastructure Cases (infra)

This directory contains modular Terraform templates for deploying essential infrastructure components on Google Cloud Platform. These cases are designed to be reusable and follow GCP best practices for automation.

## Project Cases Overview

1.  **Case 1: Billing Dataset**
    *   **Goal**: Create and configure a BigQuery dataset ready to receive Cloud Billing export data.
    *   **Use Case**: Essential for cost analysis and custom FinOps dashboards.

2.  **Case 2: GCS to BigQuery Pipeline**
    *   **Goal**: Set up a BigQuery Data Transfer Service (DTS) to automatically ingest CSV or JSON files from Cloud Storage.
    *   **Use Case**: Standard data ingestion pattern for analytics.

3.  **Case 3: Log Sink to BigQuery**
    *   **Goal**: Create a centralized Log Sink that routes critical audit or system logs to BigQuery.
    *   **Use Case**: Compliance, security auditing, and long-term log retention.

4.  **Case 4: Monitoring Dashboard**
    *   **Goal**: Deploy a Cloud Monitoring Dashboard with pre-configured widgets for infrastructure health.
    *   **Use Case**: Real-time visibility into resource performance and status.

5.  **Case 5: Secure VPC**
    *   **Goal**: Deploy a Virtual Private Cloud (VPC) following security best practices (Private Google Access, Cloud NAT, IAP).
    *   **Use Case**: Foundation for secure network architectures in GCP.


## Folder Distribution & Cases

```text
infra/
│
├── 📂 case1_billing_dataset/
│   └── 🎯 Goal: Deploy a BigQuery dataset for Cost Management.
│       └── 🛠️ Components: BigQuery Dataset, Access Controls.
│
├── 📂 case2_gcs_to_bq/
│   └── 🎯 Goal: Automate CSV/JSON ingestion from GCS.
│       └── 🛠️ Components: Cloud Storage, BQ Data Transfer Service.
│
├── 📂 case3_log_sink_bq/
│   └── 🎯 Goal: Centralize critical audit logs for analysis.
│       └── 🛠️ Components: Cloud Logging Sink, BigQuery Storage.
│
├── 📂 case4_monitoring_dashboard/
│   └── 🎯 Goal: Visualize infrastructure health & metrics.
│       └── 🛠️ Components: Cloud Monitoring, Custom Dashboards.
│
└── 📂 caso5/
    └── 🎯 Goal: Deploy a highly secure VPC network.
        └── 🛠️ Components: VPC, Subnets, Cloud NAT, IAP, Flow Logs.
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

## How to Use
Each sub-folder contains its own `main.tf` and README with specific instructions. You can deploy them independently by running:
```bash
terraform init
terraform plan
terraform apply
```
