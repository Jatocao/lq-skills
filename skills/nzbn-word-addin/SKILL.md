---
name: nzbn-word-addin
description: Use when validating party names against the New Zealand Business Number register, checking company directors and solvency status from within Word.
author: Joshua Wong
jurisdiction: NZ
tags: [new-zealand, company-validation, word-addin, regex, compliance]
---

# NZBN Word Add-In

## When to Use

- Drafting or reviewing contracts with NZ counterparty references
- Validating that company names in documents match the NZBN register
- Checking director status and company solvency before signing
- Due diligence on NZ entities

## How It Works

### Input

A company name or NZBN number in a Word document.

### Process

1. Regex extraction of potential company names or NZBN numbers
2. Query against NZBN register API
3. Return legal entity name, current directors, solvency status

### Word Integration

- Select company name → right-click → "Validate NZBN"
- Side panel shows validation results in document context
- Optional AI-enhanced smart search (Gemini API key required for that feature)

### Output

```
✓ XYZ Limited (NZBN 9429034567890)
  - Status: Registered
  - Directors: John Smith, Jane Doe
  - Solvency: Solvent
```

## Setup Required

- NZBN API key (user provides their own)
- Gemini API key (optional, for smart search)

## Limitations

- NZ companies only
- Requires user to have NZBN API credentials
- Smart search requires Gemini API key