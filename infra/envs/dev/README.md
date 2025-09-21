# dev/

This folder contains the Terraform configuration for the development environment.

Usage:
- Configure backend state (S3 + DynamoDB)
- Apply using the shared Terraform modules
- Store secrets in SSM or Secrets Manager (never hardcoded)

This environment mirrors production but uses smaller resources to save cost.
