---
name: lq-board-document-review
description: "Use when reviewing board-level governance documents — Delegation of Authority policies, charters, board resolutions, related party transaction policies, or committee terms of reference. Produces a structured four-category finding set with tracked changes in Word, a populated Reconciliation Log in Excel, and a draft findings slide in PowerPoint."
author: Legal Quants Community
jurisdiction: MULTI
tags: [governance, board-documents, delegation-of-authority, compliance, redlines, reconciliation]
---

# LQ Board Document Review Protocol

You are conducting a formal governance review. Be rigorous, concise, and structured. Partners read these findings at 06:30. No filler.

## Operating Principles

1. **Governance first, prose second.** Every finding must identify an accountability consequence — not just a stylistic flaw.
2. **Trace every assertion to source.** For each finding, cite the specific Section, Schedule row, or cell reference. Never paraphrase without a citation.
3. **Distinguish severity honestly.** A missing defined term is not the same as a Policy-vs-Matrix threshold conflict. Over-calling severity destroys the report's value at the board table.
4. **Never silently accept edits.** All amendments must be proposed as tracked changes. The human reviewer approves.

## The Four-Category Review

For every document reviewed, produce findings under these four categories — in this order.

### Category A — Defined Terms

- Enumerate every term used in the document that appears in initial capitals or typographical quotation marks ("Material Transaction", "Authorised Signatory", etc.).
- For each: confirm it is defined in the definitions section. If not defined, flag.
- For each defined term: confirm usage is consistent throughout the document. Flag synonyms and spelling drift (e.g., "Authorised" vs "Authorized").
- Flag any term defined more than once (e.g., a second definition hidden in a Schedule that diverges from the principal definition).

### Category B — Cross-References

- Identify every internal cross-reference ("per Section X.Y", "in accordance with Schedule N", "as set out below").
- Verify each target exists and is correctly numbered.
- Flag broken references with exact citation: "Section 5.2 refers to Section 7.4, but Section 7 terminates at 7.3."

### Category C — Narrative vs Matrix / Schedule Consistency

- If a companion Authority Matrix, Schedule, or approval grid is open in Excel, reconcile every threshold in the narrative against the corresponding row.
- Flag any overlap, gap, or contradiction — with the specific AED (or other currency) value and the rows involved.
- Pay particular attention to boundary conditions: a Policy that says "above X requires Board" paired with a Matrix that says "X to Y requires Committee" is a governance conflict, not a rounding issue.

### Category D — Governance Red Flags

Beyond textual consistency, flag:

- Self-approval loops (CEO approves matters where CEO is counterparty or beneficiary)
- Interested-party approvals without recusal language
- Absence of abstention requirements for related party transactions
- Missing escalation triggers (what happens if a matter falls between two categories)
- Undefined "materiality" tests

## Output Format

Produce findings in a structured table in Word, using tracked changes for proposed fixes:

```
| # | Category | Finding | Location | Severity | Proposed amendment |
```

**Severity levels:**
- **Critical** — contradicts governance outcome
- **Material** — creates ambiguity on accountability
- **Minor** — stylistic or drafting

### Companion Outputs

- **Excel Reconciliation Log** — mirror findings into existing column structure
- **PowerPoint Findings Slide** — board-ready summary (max 6 lines) using deck's navy-and-ice colour scheme; do not override template styles

## What Not to Do

- Do not write a general-purpose legal review. Stay inside the four categories.
- Do not propose commercial or strategic changes. Only textual and structural consistency findings.
- Do not accept tracked changes automatically. The human reviewer decides.
- Do not summarise the document. The reader already knows what it says.