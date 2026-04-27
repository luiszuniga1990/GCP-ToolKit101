# GCP Secure VPC Terraform Structure

This repository contains a simple layout for deploying a Virtual Private Cloud (VPC) in Google Cloud Platform (GCP) natively adhering to strong security and cloud engineering best practices.

## Built-In Best Practices included ⚙️

- **Custom Subnet Mode**: Prevents over-provisioning default subnets that GCP creates by default.
- **Private Google Access enabled**: Virtual Machines without public internet IP addresses can still talk to Google Services (like Cloud Storage or BigQuery) over Google's private network.
- **VPC Flow Logs enabled**: Allows logging the network flows on your subnets (useful for telemetry, debugging, and security forensics).
- **Cloud NAT and Cloud Router configurations**: Provisions managed NAT outbound services so your highly secure infrastructure bounds can still pull package updates seamlessly.
- **Identity-Aware Proxy (IAP) Firewall Rules**: Safely tunnels SSH access through GCP’s internal systems (`35.235.240.0/20`) completely averting the need for standard port `22` vulnerability exposure.

## Setup Instructions

**Prerequisites:** You need [Terraform](https://developer.hashicorp.com/terraform/downloads) installed and the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) authenticated.

1. **Authenticate to Google Cloud**
   ```bash
   gcloud auth application-default login
   ```
2. **Review your Variables**
   The `.gitignore` has been built to intentionally ignore `terraform.tfvars`.
   Create a `terraform.tfvars` file locally copying the contents out of the codebase's existing structures (if you haven't already edited the generated one) to specify your `project_id`.
   ```hcl
   project_id = "your-gcp-project-id"
   ```
3. **Initialize the Project**
   Initializes Terraform and downloads the official GCP provider:
   ```bash
   terraform init
   ```
4. **Plan Execution**
   See exactly what GCP resources Terraform intends to spin up:
   ```bash
   terraform plan
   ```
5. **Apply**
   Deploy the resources to GCP:
   ```bash
   terraform apply
   ```

## Production Ready Notice
If you are running this alongside a team, be sure to un-comment the `backend` functionality located inside `provider.tf`. That way you can use Google Cloud Storage buckets to centrally lock and manage your `terraform.tfstate`.
