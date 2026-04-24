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

## Usage
1. Run `terraform apply`.
2. Go to GCP Console -> Billing -> Billing Export.
3. Select "BigQuery Export" and point to the dataset created by this module.
