---
name: vibe-legal-batch-redliner
description: Use when you need to batch redline multiple contracts against a negotiation playbook, apply tracked changes to Word documents programmatically, or run contract review workflows with AI assistance.
author: Artur Serov
jurisdiction: UK
tags: [contract-review, batch-processing, redlines, tracked-changes, word, python, fastapi]
---

# Vibe Legal Server — Batch Contract Redlining

## When to Use

- Reviewing multiple contracts against a standardized playbook
- Batch processing contracts for due diligence or portfolio review
- Applying negotiation positions consistently across many documents
- Generating tracked changes programmatically (not just single-doc interactive review)
- Running "bring your own key" AI workflows on sensitive documents

## What It Is

**Part 2 of the Vibe Legal project** — a batch processing server for contract redlining.

- **Word Add-in (Part 1)** → Interactive negotiation, single contract at a time
- **Server (This)** → Batch review, pile of contracts marked up against your playbook

## How It Works

### Architecture

```
Upload DOCX → Extract structure → Send to AI with playbook → 
AI returns operations (AMEND/INSERT/DELETE) → 
Apply as tracked changes → Download redlined document
```

### Key Design Decisions

- **Surgical changes, not rewrites** — AI applies targeted operations, not wholesale replacement
- **Proper tracked changes** — Output is native Word tracked changes (strikethrough/underline), not comments or inline text
- **Playbook-driven** — Define your negotiation position in Markdown; AI applies it consistently
- **Bring your own key** — Your Gemini API key stays in browser; documents don't persist on server
- **Batch mode** — Up to 5 documents at once, processed sequentially

### Example Playbooks

```markdown
# NDA Review (Recipient)
## Priority Issues
1. Term length — push for 2-3 years, not perpetual
2. Carve-outs — ensure public info exclusion
3. Residuals — delete or narrow heavily

## Watch For
- Perpetual confidentiality obligations
- Broad injunctive relief language
- Unilateral fee provisions
```

## Usage

### Single Document Review
1. Upload contract (DOCX)
2. Select playbook
3. Process → download redlined document

### Batch Mode
1. Upload up to 5 documents
2. Select playbook
3. Process sequentially
4. Download individually or as ZIP

### Playbook Creation
Write negotiation positions in Markdown:

```markdown
# SELLER'S PLAYBOOK
## Priority Issues
1. Payment terms — require payment on delivery
2. Liability cap — maintain full purchase price cap

## Watch For
- Unlimited liability language
- Buyer-friendly termination rights
```

## Known Limitations

- Tables — behavior unpredictable
- Complex nested numbering schemes
- Heavy formatting (columns, text boxes, footnotes)
- Non-English documents
- **No deterministic validation** — AI output not verified before applying
- **No rollback** — malformed AI response can corrupt document structure

> **Critical:** Always review every change. Work on copies. This is research software, not production-ready.

## Tech Stack

- **FastAPI** (Python backend)
- **python-docx + lxml** (Word manipulation)
- **React + Vite** (Frontend)
- **Google Gemini** (AI)
- **Tailwind CSS** (Styling)

## Setup

```bash
git clone https://github.com/sarturko-maker/vibe-legal-server
cd VibeLegalPython

# Backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python main.py

# Frontend (new terminal)
cd vibelegal-frontend
npm install
npm run dev
```

## Limitations

- AI makes mistakes — may remove liability caps while "fixing typos", miss obvious issues, hallucinate clauses
- Always review every change before relying on output
- For high-risk or high-value contracts, escalate to qualified counsel
- Tables and complex formatting not fully supported