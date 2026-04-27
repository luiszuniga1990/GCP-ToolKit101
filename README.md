# 101 ToolKit GCP - Basic Project Guide

## 📖 About This Repository
This repository is a comprehensive **GCP Toolkit** designed for Cloud Engineers, Data Engineers, and SecOps professionals. It provides modular, production-ready **Terraform** templates and **Security Operations** configurations to automate infrastructure, data pipelines, and threat detection on Google Cloud Platform.

### 🌟 Key Features
- **Modular Infrastructure**: Deploy independent cases for networking, billing, and observability.
- **Security-First Approach**: Native integration of GCP security best practices (IAP, VPC Flow Logs, etc.).
- **SecOps Ready**: Emerging resources for YARA-L threat detection and SCC governance.

---

This repository is a modular toolkit for **Google Cloud Platform (GCP)**, offering ready-to-deploy **Terraform** templates and **SecOps** configurations.
 It aims to bridge the gap between basic infrastructure automation and advanced security operations, providing independent, functional cases for data, observability, and governance.

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
│   ├── case4_monitoring_dashboard/ # Health metrics visualization
│   └── caso5/                      # Secure VPC Network architecture
└── secops/                     # Security Operations resources
    └── secops-preview/             # YARA-L rules and SCC snippets (Coming Soon)


```

