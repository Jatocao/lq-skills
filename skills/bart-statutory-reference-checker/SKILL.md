---
name: bart-statutory-reference-checker
description: Use when checking statutory citations in Singapore legal documents, verifying references against Singapore statutes, or auditing Word documents for citation accuracy.
author: Kevan Wee
jurisdiction: SG
tags: [singapore, statutory-citation, legal-research, word-addin, compliance]
---

# BART: Statutory Reference Checker

## When to Use

- Auditing Singapore legal documents for statutory citation accuracy
- Verifying that cited Singapore statutes exist and are properly referenced
- Checking if statutory references have been amended or repealed
- Academic work on Singapore legislation
- Pre-filing review of submissions

## How It Works

### Backend (Python + Next.js frontend)

1. **Semantic search** over Singapore statute text using Legal-BERT/GEMMA
2. **BM25 + reranker** for precise citation matching
3. **ChromaDB** vector store for fast retrieval
4. **Word Add-in** integration for in-document checking

### Word Add-in Features

- Scan entire document for statutory references
- Validate against live Singapore statute database
- Flag missing amendments or repealed provisions
- Suggest correct chapter/section references
- Hover tooltips with current text of cited provisions

### Output

Report showing:
- All statutory references found
- Validation status (valid, amended, repealed, not found)
- Suggested corrections where needed

## Limitations

- Currently private (access may be restricted)
- Requires internet connection for live statute lookup
- Singapore statutes only