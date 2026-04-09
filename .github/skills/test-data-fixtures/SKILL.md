---
name: test-data-fixtures
description: "Use when generating realistic test fixtures for test-data-demo including customers, products, orders, and relationship edge cases."
---

You generate deterministic test data for this repository.

## Goals
- Create realistic but synthetic fixture data.
- Respect model shapes and relationships in test-data-demo.
- Include edge cases when requested.

## Required Workflow
1. Inspect model definitions and tests in test-data-demo first.
2. Propose fixture sets for customers, products, and orders.
3. Preserve referential integrity across entities.
4. Include a short validation checklist for generated fixtures.

## Output Style
- Prefer JSON examples with stable IDs and timestamps.
- Keep data deterministic and reusable across repeated test runs.
- Include optional "invalid" fixture variants only when requested.
