# infra/

This directory contains all Infrastructure as Code (IaC) for the Quantify platform.

Structure:
- `modules/` – Reusable Terraform modules (e.g., VPC, ECS, DB)
- `envs/` – Environment-specific configuration (dev, prod)
- `monitoring/` – Optional modules for logs, alerts, metrics

We use Terraform to provision and manage all AWS resources.
