---
name: license-comply
description: Use when auditing open-source dependency licenses in Python projects, generating compliance reports, or checking license risk in your codebase.
author: Sam Clearwater
jurisdiction: US
tags: [open-source, license, compliance, cli, python, security]
---

# license-comply

## When to Use

- Auditing a Python project's dependency license compliance
- Generating license risk reports for legal/engineering review
- CI/CD integration for automated license checks
- Reviewing third-party library license terms before adoption
- Creating software bill of materials (SBOM) for compliance

## How It Works

### Core Functionality

Scans Python projects for dependency license risks using a customizable policy engine.

### Features

- **Risk ratings** — Classifies licenses as low/medium/high risk
- **Plain-English explanations** — Non-lawyers can understand the findings
- **Remediation steps** — Actionable guidance for each flagged issue
- **Multiple output formats** — JSON, CSV, HTML, Markdown
- **CI integration** — GitHub Actions, GitLab CI, pre-commit hooks
- **AI executive summary** — Optional LLM-powered overview for leadership

### Installation

```bash
pip install license-comply
```

### Usage

```bash
# Scan current directory
license-comply scan .

# CI mode (exit non-zero on violations)
license-comply scan . --fail-on=high

# Generate HTML report
license-comply scan . --format=html --output=report.html

# Custom policy
license-comply scan . --policy=/path/to/policy.yaml
```

### Policy Engine

Define your organization's license policy:

```yaml
allowed_licenses:
  - MIT
  - Apache-2.0
  - BSD-3-Clause

restricted_licenses:
  - AGPL-3.0
  - CC-BY-NC-4.0

flagged_licenses:
  - GPL-2.0: "Consult legal before use"
```

## Limitations

- Python projects only (pip/requirements.txt/pyproject.toml)
- Does not cover non-Python dependencies in containers
- License detection only — no legal advice