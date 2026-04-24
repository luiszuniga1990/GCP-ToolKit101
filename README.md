# 101 ToolKit GCP - Basic Project Guide

This repository is a collection of **Terraform** templates designed to deploy basic and functional infrastructures in Google Cloud Platform. Each case is independent and focused on automating common data and observability tasks.

## Project Structure

```text
101ToolKitGCP/
├── infra/                      # Infrastructure implementation cases
│   ├── case1_billing_dataset/      # Preparation for Billing export
│   ├── case2_gcs_to_bq/           # CSV/JSON file ingestion pipeline
│   ├── case3_log_sink_bq/         # Auditing and centralization of critical logs
│   └── case4_monitoring_dashboard/ # Health metrics visualization
└── secops/                     # Security Operations resources
    └── secops-preview/             # YARA-L rules and SCC snippets (Coming Soon)
```

