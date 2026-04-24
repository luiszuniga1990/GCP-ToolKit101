# 101 ToolKit GCP - Basic Project Guide

This repository is a modular toolkit for **Google Cloud Platform (GCP)**, offering ready-to-deploy **Terraform** templates and **SecOps** configurations. It aims to bridge the gap between basic infrastructure automation and advanced security operations, providing independent, functional cases for data, observability, and governance.

**Current Focus:**
*   🛠️ **Infrastructure as Code (IaC):** Automated data pipelines, centralized logging, and observability dashboards.
*   🛡️ **Security Operations (SecOps):** An emerging collection of YARA-L rules and Security Command Center (SCC) configurations.

**What's Next?**
Soon, we will expand the toolkit with advanced threat detection patterns, automated compliance scanning, and complex network security architectures.

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

