---
name: nda-review
description: Use when reviewing one-way (unilateral) commercial NDAs, analyzing key clauses for risk, producing clause-by-clause issue logs with preferred redlines, fallbacks, and negotiation guidance.
author: Jamie Tso
jurisdiction: AG (jurisdiction-agnostic)
tags: [nda, contract-review, redlines, negotiation, legal-analysis]
---

# NDA Review Playbook (Commercial, Jurisdiction-Agnostic)

Version 1.0 — December 2025

> This skill is a structured review playbook. It is not legal advice. When the NDA is high-risk, high-value, cross-border, or otherwise sensitive, escalate to qualified counsel.

## Overview

| What this skill does | What it does not do |
|---|---|
| Reviews an NDA and outputs issues, risks, and suggested redlines | Provide jurisdiction-specific legal conclusions |
| Supports *Recipient* or *Discloser* perspectives (user-chosen) | Guarantee enforceability |
| Produces an executive summary + clause-by-clause markup guidance | Replace counsel for complex deals |

**Scope:** supports **one-way (unilateral) commercial NDAs only**. If mutual, this playbook is out of scope.

> **Variation callouts** appear throughout: M&A/Due diligence, Employment/contractor, Investor/VC

## Inputs to Collect (Ask Before Reviewing)

### A. Role and deal context (required)
- Are we reviewing as **Recipient** (we receive confidential info) or **Discloser** (we disclose confidential info)?
- Confirm the NDA is **one-way (unilateral)** — if mutual, stop: out of scope
- What is the **purpose** / permitted use?
- What are the **parties** (legal names) and any **affiliates**?
- What information types are expected (tech, pricing, customer data, product roadmap, source code)?
- Desired **timeline**: when do we need to sign?

### B. Practical constraints (recommended)
- Do we need to share with affiliates, advisors, contractors, auditors, or potential acquirers?
- Will we **export** data across borders or store in cloud tools?
- Will any **personal data** be shared?

> **Jurisdiction-agnostic note:** avoid asserting "this clause is invalid" without governing law; focus on *commercial risk*, *operational feasibility*, and *market norms*.

## Deliverables

### A. Executive Summary (1 page)
- Party role (Recipient or Discloser) and confirmation it is one-way
- Top 5 negotiation points (ranked)
- "Sign as-is" / "Sign with changes" / "Escalate" recommendation

### B. Clause-by-Clause Issue Log

| Clause | Issue (1 line) | Risk (H/M/L) | Preferred redline | Fallback | Rationale (1-2 sentences) | Owner | Deadline |
|---|---|---:|---|---|---|---|---|---|
| Definition | Overbroad; includes unmarked info with no reasonableness | | | | | | |
| Term & survival | Perpetual confidentiality for all information | | | | | | |
| Use restriction | Purpose too broad; blocks internal evaluation | | | | | | |
| Disclosures | Representatives undefined; strict liability | | | | | | |
| Return/destruction | No backup carve-out | | | | | | |
| Remedies | One-way fees + automatic injunction | | | | | | |
| Liability | Indemnity + unlimited consequential damages | | | | | | |
| Boilerplate | Assignment prohibits change of control | | | | | | |

## 5-Step Workflow

### Step 1 — Identify Stance (Recipient vs Discloser)
- Confirm which side we are on for *this specific NDA* (titles are often misleading)
- Confirm the NDA is **one-way (unilateral)**. If mutual, stop: out of scope.

**Quick heuristic:**
- If asked to keep *their* info secret → **Recipient**
- If sharing *our* sensitive info → **Discloser**

### Step 2 — Triage the NDA (Fast Risk Scan)
Flag immediately:
- [ ] **Perpetual** confidentiality for *all* information (no trade secret distinction)
- [ ] **Residuals clause** allowing use of "memory" or generalized knowledge
- [ ] **Injunctive relief** + **attorneys' fees** one-way against Recipient
- [ ] **Indemnity** for breach or broad third-party claims
- [ ] **No carve-outs** for compelled disclosure or prior knowledge
- [ ] **Overbroad definition**: "all information, whether marked or not" with no reasonableness
- [ ] **Affiliate coverage** missing when we must share internally

### Step 3 — Clause-by-Clause Review
Use reference modules:
- `references/KEY_CLAUSES.md` — Common NDA clauses and implications
- `references/PARTY_OBLIGATIONS.md` — Analysis of party obligations
- `references/DURATION_SCOPE.md` — Duration and scope considerations
- `references/REMEDIES_LIABILITY.md` — Remedies and liability provisions
- `references/STANDARD_EXCEPTIONS.md` — Standard exceptions

### Step 4 — Draft Redlines and Negotiation Positions
For each issue:
- **Preferred redline** (best risk outcome)
- **Fallback position** (acceptable compromise)
- **Rationale** (1-2 sentences: business + operational feasibility)
- **Owner** (Legal, Sales, Security, Product)
- **Deadline**

> **Negotiation discipline:** do not propose 20 changes. Focus on 5-10 that materially change risk.

### Step 5 — Finalize the Package
- [ ] Ensure consistency across definitions
- [ ] Confirm operational feasibility
- [ ] Re-scan Step 2 triage list; ensure each flagged item is in the issue log
- [ ] Provide "what we changed and why" summary

## Perspective-Specific Checklists

### A. Recipient Checklist (Incoming NDA)

| Topic | Red Flags | Typical Ask |
|---|---|---|
| Definition of Confidential Information | Overbroad; includes independently developed info; no marking standard | Add reasonableness + identification standard |
| Purpose / Permitted Use | Any use restriction beyond evaluation; bans on internal sharing | Tie to stated purpose; allow internal need-to-know |
| Representatives | Liable for any representative breach without control | Limit to written confidentiality; commercially reasonable care |
| Term & survival | Perpetual for everything; unclear start date | Fixed term; longer only for trade secrets |
| Return / destruction | Requires immediate deletion of backups | Add backup carve-out |
| Remedies | One-way fees + broad injunction language | Mutuality or reasonableness |
| Liability / indemnity | Indemnity; unlimited damages; consequential damages | Cap or exclude categories; remove indemnity |
| Residuals | Allows use of "retained in memory" | Delete or narrow heavily |

> **M&A / Due diligence:** ensure diligence sharing (advisors, financing, affiliates) is permitted and data room exports/notes are covered.

### B. Discloser Checklist (When Sharing Sensitive Info)

| Topic | Red Flags | Typical Ask |
|---|---|---|
| Definition | Too narrow; requires marking only; excludes oral disclosures | Add oral confirmation mechanism |
| Security standard | Only "reasonable" with no baseline | Add minimum safeguards |
| Exclusions | Too broad (e.g., "independently developed" with no proof) | Require written evidence |
| Term & survival | Too short | Extend for sensitive categories |
| Remedies | No equitable relief, no fees | Add equitable relief carefully |

> **Investor / VC:** watch for standstill, solicitation, and "no contact" provisions.

## Limitations

- This skill provides a structured framework, not legal advice
- Jurisdiction-specific law not covered; always verify with qualified counsel
- High-risk, high-value, or cross-border deals require escalation
- Does not cover mutual NDAs — those require separate review approach
- All outputs must be reviewed by a qualified legal professional before use