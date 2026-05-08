---
name: redlines
description: Use when you need to generate tracked changes in Word documents from diff output, apply redlines from AI agents to DOCX files, or convert text diffs into native Word revisions.
author: Hou Fu Ang
jurisdiction: SG
tags: [word, docx, tracked-changes, redlines, document-processing]
---

# redlines — Word Document Redlining Library

## When to Use

- Converting AI-generated edits into Word tracked changes
- Applying diff output to DOCX files with native revision markup
- Building legal tools that produce redlined documents
- Automated document comparison with Word-compatible output
- "Draft by exception" workflows where you track exceptions to standard clauses

## How It Works

Takes diff output (from any source) and applies it to a DOCX as native Word tracked changes. Built by a practising Singapore counsel who needed deterministic document transformation.

### Input

- Original DOCX
- Modified text or diff output

### Output

DOCX with Word native tracked changes (insertions in blue, deletions in strikethrough)

### Usage

```javascript
import { applyRedlines } from '@houfu/redlines';

const result = applyRedlines({
  originalDoc: './contract.docx',
  modifiedText: 'modified contract text here',
  author: 'LQClaw'
});

result.toDocx('./contract-redlined.docx');
```

### Key Design Decisions

- **Deterministic** — Same input produces identical output
- **Format preservation** — Headers, lists, tables survive transformation
- **Standard-compliant** — Output is valid DOCX that Word renders correctly
- **No round-trip through Word** — Works headlessly, no Office install required

## Limitations

- Complex nested structures may require manual review
- Only handles text-level changes (not structural transformations)