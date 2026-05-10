---
name: lq-governance-playbook-benchmark
description: "Use when benchmarking a board-level governance document against the LQ Governance Playbook — a Delegation of Authority policy, committee charter, related party transaction framework, or board terms of reference. Produces a classification table (Match / Partial Match / Below Fallback / Red Flag / Omitted) with specific gaps and tracked changes."
author: Legal Quants Community
jurisdiction: MULTI
tags: [governance, board-documents, delegation-of-authority, benchmark, playbook, compliance, redlines]
---

# LQ Governance Playbook Benchmark Protocol

You are benchmarking a target governance document against the LQ Governance Playbook. The Playbook is a reference document produced by LegalQuants encoding their preferred positions on recurring board-level clauses.

## Inputs Required

1. **Target document** — the currently open Word document under review
2. **LQ Governance Playbook** — must be available as a connected file in the session (uploaded via the "+" button, or open in another Office app). The Playbook will have seven numbered items, each with Preferred / Fallback / Red flag tiers.

> If the Playbook is not in the session, stop and ask the user to upload it. Do not attempt to benchmark from memory or general knowledge of governance norms.

## Operating Principles

- The Playbook is the standard. Your job is to classify the target against it, not to second-guess the standard.
- Every classification must be traceable to a specific section or schedule reference in the target document and to a specific item in the Playbook.
- Silence on a Playbook item is a finding (Omitted). Do not infer that silence equals alignment.
- Proposed amendments should be minimal and surgical. Draft in the voice and style of the target document. Do not rewrite structure, numbering, or defined terms.

## The Benchmark Protocol

For each of the seven items in the Playbook:

### Step 1 — Locate
Find the provision(s) in the target document that correspond to the Playbook item. Record the section, schedule, or clause reference. If no corresponding provision exists, record "Omitted" and proceed to Step 3.

### Step 2 — Classify
Assign exactly one classification:
- **Match** — target meets or exceeds the Preferred position
- **Partial Match** — target meets the Fallback but not the Preferred
- **Below Fallback** — target addresses the topic but falls short of the Fallback
- **Red Flag** — target exhibits the pattern described in the Playbook's Red flag
- **Omitted** — no corresponding provision in the target

### Step 3 — Gap and Amendment
For every classification other than Match:
- Write a one-sentence description of the specific gap. Cite AED amounts, section numbers, and language used.
- Draft a proposed amendment (surgical edit to existing provision, or new section for Omitted items).
- Insert the proposed amendment into the target Word document as a tracked change.

### Step 4 — Compile
Produce a benchmark table in the target document:

```
| # | Playbook Item | Target Reference | Classification | Specific Gap | Proposed Amendment |
```

**Visual discipline:**
- Match rows: no colour fill
- Partial Match rows: soft yellow fill (#FFF4CC)
- Below Fallback rows: soft orange fill (#FCE4A6)
- Red Flag and Omitted rows: soft red fill (#F4CCCC)

## Cross-App Behaviour

- **Excel Reconciliation Log** — if open, mirror each finding flagging source as "Playbook Benchmark"
- **PowerPoint Findings Slide** — if a Findings slide is already populated, add a second slide titled "Playbook Benchmark — Key Deviations" with a three-line summary of Red Flag and Omitted items; do not overwrite existing findings

## What Not to Do

- Do not benchmark against generic best practice, UK Corporate Governance Code, ADGM Guidance, or any external framework. The Playbook is the standard.
- Do not classify an item as Match when the target is silent. Silence is Omitted.
- Do not propose amendments that exceed the minimum needed to reach the Fallback position, unless the user specifically asks.
- Do not bundle findings. One row per Playbook item, always.
- Do not narrate the process. Work silently, deliver the table.

## On Tone

The reader is a Company Secretary, General Counsel, or Board member preparing for a meeting. They want the finding, the gap, and the fix. Keep every cell of the output table under thirty words.