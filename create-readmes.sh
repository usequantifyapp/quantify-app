#!/bin/bash

# Script to create README.md files in each major folder of the Quantify project

echo "📄 Creating README.md files..."

# app/
mkdir -p app && cat > app/README.md <<EOF
# app/

This directory contains all application-level source code for the Quantify platform.

Structure:
- \`api/\` – FastAPI routes and app logic
- \`scoring_engine/\` – Proprietary scoring algorithm (do not expose)
- \`models/\` – Pydantic schemas or ORM models
- \`migrations/\` – Database schema change tracking

This code is packaged into a container and deployed via ECS.
EOF

# infra/
mkdir -p infra && cat > infra/README.md <<EOF
# infra/

This directory contains all Infrastructure as Code (IaC) for the Quantify platform.

Structure:
- \`modules/\` – Reusable Terraform modules (e.g., VPC, ECS, DB)
- \`envs/\` – Environment-specific configuration (dev, prod)
- \`monitoring/\` – Optional modules for logs, alerts, metrics

We use Terraform to provision and manage all AWS resources.
EOF

# infra/modules/
mkdir -p infra/modules && cat > infra/modules/README.md <<EOF
# modules/

This folder contains reusable Terraform modules that are shared between environments.

Examples:
- \`vpc/\` – Networking setup
- \`ecs/\` – Fargate service definition
- \`rds/\` – Optional PostgreSQL database

Each module is self-contained and follows Terraform best practices.
EOF

# infra/envs/dev/
mkdir -p infra/envs/dev && cat > infra/envs/dev/README.md <<EOF
# dev/

This folder contains the Terraform configuration for the development environment.

Usage:
- Configure backend state (S3 + DynamoDB)
- Apply using the shared Terraform modules
- Store secrets in SSM or Secrets Manager (never hardcoded)

This environment mirrors production but uses smaller resources to save cost.
EOF

# infra/envs/prod/
mkdir -p infra/envs/prod && cat > infra/envs/prod/README.md <<EOF
# prod/

This folder contains the Terraform configuration for the production environment.

Usage:
- Production-grade resources
- Real domains, HTTPS, and backups
- Secure secrets via SSM or Secrets Manager

This environment is the live system used by customers.
EOF

# scripts/
mkdir -p scripts && cat > scripts/README.md <<EOF
# scripts/

Automation scripts for local development and deployment.

Examples:
- \`local_setup.sh\` – Prepares local Python environment
- \`deploy.sh\` – Push infrastructure or app code
- \`lint.sh\` – Run formatting/linting tools

This folder helps standardise tasks across environments.
EOF

# secrets/
mkdir -p secrets && cat > secrets/README.md <<EOF
# secrets/

Contains example environment variable files for local development.

- \`.env.example\` – Template for developers
- Real secrets should be stored in AWS SSM Parameter Store or Secrets Manager
- This folder is \`.gitignore\`-protected to avoid leaks
EOF

# tests/
mkdir -p tests && cat > tests/README.md <<EOF
# tests/

This folder contains test suites for the Quantify platform.

Structure:
- \`unit/\` – Unit tests for app logic and scoring engine
- \`integration/\` – Integration tests with infra or external APIs

Tests are run using \`pytest\` and included in CI/CD.
EOF

# logs/
mkdir -p logs && cat > logs/README.md <<EOF
# logs/

Local development logs (e.g., API or scoring outputs).

- This folder is \`.gitignore\`-protected
- Logs are for debugging and should not be committed
EOF

echo "✅ All README.md files created successfully!"