# Case 4: Health Monitoring Dashboard

Centralized visual dashboard for project resource observability.

## Component Diagram

```text
   +-------------------+
   | Compute Engine VM | --+
   +-------------------+   |    +-------------------+       +-------------------+
                           +--> |  Cloud Monitoring | ----> |  Custom Dashboard |
   +-------------------+   |    |  (Metrics)        |       |  (Visualization)  |
   | Cloud SQL (DB)    | --+    +-------------------+       +-------------------+
   +-------------------+
```

## Description
Deploys an Infrastructure Operations dashboard that allows viewing CPU utilization and active database connections. It is the foundation for detecting bottlenecks or oversized resources.

## Included Charts
- **CPU Utilization**: Average usage of all virtual machines.
- **Active Connections**: Health status of database instances.
