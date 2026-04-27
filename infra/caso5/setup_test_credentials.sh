#!/bin/bash

# Ensure a project ID is provided
if [ -z "$1" ]; then
  echo "Usage: ./setup_test_credentials.sh <YOUR_GCP_PROJECT_ID>"
  exit 1
fi

PROJECT_ID=$1
SA_NAME="terraform-vpc-tester"
SA_EMAIL="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
KEY_FILE="terraform-test-key.json"

echo "=========================================================="
echo " Setting up Test Credentials for Project : $PROJECT_ID"
echo "=========================================================="

# 1. Create the Service Account
echo "1️⃣  Creating Service Account: $SA_NAME..."
gcloud iam service-accounts create $SA_NAME \
  --display-name="Terraform VPC Tester Service Account" \
  --project=$PROJECT_ID

# 2. Assign necessary IAM roles
# Network Admin is the exact least-privilege role required to create VPCs, Subnets, Routers, NATs, and Firewalls
echo "2️⃣  Assigning 'Compute Network Admin' role to the Service Account..."
gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:$SA_EMAIL" \
  --role="roles/compute.networkAdmin" \
  --condition=None > /dev/null

# 3. Create JSON Key
echo "3️⃣  Generating JSON key file ($KEY_FILE)..."
gcloud iam service-accounts keys create $KEY_FILE \
  --iam-account=$SA_EMAIL \
  --project=$PROJECT_ID

echo ""
echo "✅ Credentials configured successfully!"
echo "⚠️  Important: Do NOT commit '$KEY_FILE' to GitHub. (It's already in your .gitignore)"
echo ""
echo "To use these credentials for testing, export them in your terminal by running:"
echo "export GOOGLE_APPLICATION_CREDENTIALS=\"\$(pwd)/$KEY_FILE\""
echo "=========================================================="
