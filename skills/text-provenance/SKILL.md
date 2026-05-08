---
name: text-provenance
description: Use when you need to identify the likely source of a text passage, attribute text to documents in a RAG system, detect plagiarism, or match contract clauses to their origin.
author: Yu Chou Teo
jurisdiction: SG
tags: [text-analysis, rag, citation, provenance, similarity, attribution]
---

# text-provenance

## When to Use

- RAG citation highlighting — show which source document a generated text came from
- Contract playbook matching — find which standard clause a contract clause derives from
- Plagiarism detection
- Source attribution for AI-generated legal text
- Any text provenance task where you need to trace text back to its origin

## How It Works

### Core Approach

Lightweight text similarity metrics — no embeddings or API calls at runtime. Fast, deterministic string matching that works in-browser or server-side.

### Comparison Methods

- **Surface similarity** — character-level comparison
- **N-gram overlap** — phrase-level matching
- **Fingerprint matching** — exact phrase detection

### Usage

```javascript
import { findProvenance } from 'text-provenance';

const sources = await findProvenance(
  "the quick brown fox jumps over the lazy dog",
  corpusDocuments
);
// Returns ranked list of potential sources with confidence scores
```

### Edge Cases

Works where embeddings fail:
- Short text snippets
- Exact phrase matching
- High-precision attribution tasks
- Privacy-sensitive contexts (no data leaves the machine)

## Limitations

- Cannot handle semantically similar but lexically different text
- Works best with longer source documents
- Not a substitute for embedding-based retrieval in all contexts