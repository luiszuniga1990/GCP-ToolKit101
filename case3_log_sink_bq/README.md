# Case 3: Log Sink to BigQuery

Configuration of a critical log pipeline for security auditing and compliance.

## Component Diagram

```text
   +-------------------+       +-------------------+       +-------------------+
   | Resource (VM, IAM)| ----> |   Cloud Logging   | ----> |  BigQuery Dataset |
   | Generates Event   |       | (Sink Filter)     | Router| (log_archive)     |
   +-------------------+       +-------------------+       +-------------------+
                                         |
                                         V
                                 [Writer Identity]
                                 (IAM Permissions)
```

## Description
This module captures audit events (who created a VM, who deleted a permission) and sends them to BigQuery. Unlike standard log storage, in BigQuery you can keep information for years economically and perform complex SQL searches.

## Applied Filter
Captures administrative activity logs and changes in security policies (IAM).
