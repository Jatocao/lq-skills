---
name: superdoc-redlines
description: Use when you need to apply tracked changes and comments to DOCX files programmatically, merge multi-agent edits with conflict resolution, or produce native Word revisions from AI agent output.
author: Yu Chou Teo
jurisdiction: SG
tags: [docx, redlines, multi-agent, conflict-resolution, document-processing]
---

# superdoc-redlines — Multi-Agent DOCX Redlining

## When to Use

- Multi-agent legal workflows where different agents produce edits to the same document
- Applying AI-generated tracked changes to DOCX files
- Merging edits from multiple reviewers with conflict resolution
- Headless document transformation (no Word installation required)
- Deterministic document edits with stable block IDs

## How It Works

### Core Innovation

Uses **stable block IDs** instead of fragile text matching. Unlike approaches that try to find text by content (and fail when formatting changes), Superdoc assigns stable IDs to document blocks and applies changes by reference.

### Architecture

```
AI Agent output → Conflict resolution → Block ID mapping → Native Word revisions
```

### Process

1. **Parse** — Extract document blocks with stable IDs
2. **Receive edits** — AI agent produces change instructions
3. **Conflict resolution** — If multiple agents edit same block, resolve conflicts
4. **Apply** — Insert Word tracked changes using block IDs (not text matching)
5. **Output** — Native DOCX with Word revision marks

### Usage

```javascript
import { applyRedlines } from 'superdoc-redlines';

const result = await applyRedlines({
  input: './contract.docx',
  edits: agentEdits,
  agentName: 'Claude'
});
```

### Key Features

- **Multi-agent merging** — Multiple agents can edit; conflicts are flagged
- **Conflict resolution** — Human review for overlapping edits
- **Deterministic** — Same edits → same output (unlike text-matching approaches)
- **Native Word revisions** — Output is valid DOCX, not a proprietary format
- **Works headlessly** — No Word installation needed

## Limitations

- Complex nested tables may need manual review
- Requires well-structured input from AI agents
- Conflict resolution UI is basic