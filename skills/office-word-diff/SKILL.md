---
name: office-word-diff
description: Use when you need to apply word-level tracked changes to Microsoft Word documents programmatically, preserve formatting through diffs, or integrate with Office.js for document transformation.
author: Yu Chou Teo
jurisdiction: SG
tags: [word, office-js, tracked-changes, docx, diff, document-processing]
---

# office-word-diff

## When to Use

- You need to apply AI-generated edits as tracked changes in Word documents
- You're building a legal tool that produces DOCX output with redlines
- You need deterministic, word-level text comparison (not just line-level diff)
- You want to preserve formatting through document transformations
- You're integrating with Claude Code, Cursor, or other agents that produce document changes

## How It Works

### Core Problem

Most diff tools operate at the line or paragraph level. Word documents have structural complexity — nested lists, tables, headers, formatting runs — that line-based diffs destroy. `office-word-diff` solves the kernel-level problem: applying word-level tracked changes to DOCX while preserving formatting.

### Architecture

1. **Parse** — Read DOCX via Office.js API, extract text runs with formatting metadata
2. **Diff** — Compute word-level differences between old and new text
3. **Transform** — Insert Word-compatible tracked changes (insertions/deletions) preserving formatting
4. **Output** — Return valid DOCX with native Word tracked changes

### Usage

```javascript
import { diffWords } from 'office-word-diff';

const result = await diffWords(oldDoc, newDoc, {
  trackChanges: true,
  author: 'LQClaw'
});
```

### Key Features

- **Granular tracked changes** — Word-level, not paragraph-level
- **Format preservation** — Bold, italic, underlines survive transformation
- **Nested structures** — Handles tables, lists, headers correctly
- **Agent-compatible** — Works with Claude Code, Gemini CLI, Codex as backend
- **Deterministic** — Same input produces same output (unlike fragile text-matching approaches)

## Limitations

- Requires Office.js (needs to run in Word context or headless Word)
- Windows/macOS only (no Linux for Word)
- Very complex nested tables may have edge cases