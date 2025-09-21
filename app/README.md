# app/

This directory contains all application-level source code for the Quantify platform.

Structure:
- `api/` – FastAPI routes and app logic
- `scoring_engine/` – Proprietary scoring algorithm (do not expose)
- `models/` – Pydantic schemas or ORM models
- `migrations/` – Database schema change tracking

This code is packaged into a container and deployed via ECS.
