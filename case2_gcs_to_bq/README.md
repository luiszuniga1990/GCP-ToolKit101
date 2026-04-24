# Case 2: GCS to BigQuery Pipeline

Automation of flat file ingestion into a data warehouse using BigQuery Data Transfer Service (DTS).

## Component Diagram

```text
   +-------------------+       +-------------------+       +-------------------+
   | External Files    | ----> |   Cloud Storage   | ----> |  BigQuery Dataset |
   | (CSV / JSON)      | Upload|   (Bucket Sink)   | DTS   | (raw_data_ingest) |
   +-------------------+       +-------------------+       +-------------------+
```

## Description
This flow allows centralizing operational data (sales, inventory, etc.) generated as files. The DTS service monitors the bucket and automatically loads new files into BigQuery every 24 hours.

## Terraform Components
- `google_storage_bucket`: Temporary file storage.
- `google_bigquery_dataset`: Final analytical storage.
- `google_bigquery_data_transfer_config`: The "engine" that moves the data.
