# Case 1: Billing Export Dataset

This module deploys a BigQuery dataset prepared to receive GCP billing data.

## Component Diagram

```text
   +-------------------------+          +-------------------------+
   |  GCP Billing Account   |--------->|  BigQuery Dataset       |
   |  (Manual Configuration) |  Export  |  (billing_export_data)  |
   +-------------------------+          +-------------------------+
```

## Description
Automatic billing export is the first step for a **FinOps** strategy. This resource creates the immutable container where Google Cloud will deposit detailed daily usage data.

## Deployment & Destruction

### Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and authenticated (`gcloud auth application-default login`).
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (v1.5.0+).

### Steps to Deploy
1. Navigate to the project folder:
   ```bash
   cd case1_billing_dataset
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Create a `terraform.tfvars` file based on `terraform.tfvars.example` and fill in your values.
4. Preview the changes:
   ```bash
   terraform plan
   ```
5. Apply the configuration:
   ```bash
   terraform apply
   ```

### Steps to Destroy
To remove all resources created by this module, run:
```bash
terraform destroy
```

## Post-Deployment Steps
Once deployed, you must manually point your billing export to this dataset:
1. Go to GCP Console -> Billing -> Billing Export.
2. Select "BigQuery Export" and point to the dataset created by this module.
