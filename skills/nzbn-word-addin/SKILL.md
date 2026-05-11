---
name: nzbn-word-addin
description: Use when validating party names against the New Zealand Business Number register and checking director and registration status from within Word.
author: Joshua Wong
jurisdiction: NZ
version: 1.0.0
last_reviewed: 2026-05
last_reviewed_by: LegalQuants (QA remediation)
tags: [new-zealand, company-validation, word-addin, regex, compliance]
---

# NZBN Word Add-In

## When to Use

- Drafting or reviewing contracts with NZ counterparty references
- Validating that company names in documents match the NZBN register
- Checking the registration status and current directors of a NZ company
- Lightweight counterparty identity due diligence on NZ-incorporated entities

## How It Works

### Input

A company name or NZBN number in a Word document.

### Process

1. Regex extraction of potential company names or NZBN numbers
2. Query against NZBN register API
3. Return legal entity name, current directors, and registration status from the NZBN register

### Word Integration

- Select company name → right-click → "Validate NZBN"
- Side panel shows validation results in document context
- Optional AI-enhanced smart search via Google Gemini (off by default; see warning below)

### Output

```
✓ XYZ Limited (NZBN 9429034567890)
  - NZBN status: Registered (active / removed / inactive)
  - Directors: John Smith, Jane Doe
  - Note: NZBN status reflects registration only — solvency requires separate analysis
```

## Setup Required

- NZBN API key (user provides their own)
- Gemini API key (optional, for smart search — disabled by default)

## Privilege and Confidentiality Warning

This skill can route document text to **Google Gemini** for smart search. Gemini is a third-party LLM operated by Google.

**Do not invoke smart search on privileged or confidential material unless your firm has approved external AI processing of legal documents.** The basic NZBN lookup path only sends the extracted company name or NZBN number to the NZBN register; the smart-search path sends a broader text selection to Gemini.

**Disabling smart search.** Smart search is opt-in and off by default. To disable explicitly, leave the Gemini API key field empty in settings, or set `smart_search_enabled = false` in the add-in configuration. With smart search disabled, the skill performs NZBN-register lookups only and no document text leaves your environment beyond the lookup parameter.

## Audience and Work Shape

Audience: NZ-qualified solicitors, in-house counsel, and paralegals performing counterparty identity checks on NZ-incorporated companies from inside Word. Not designed for unsupervised drafting, AML/KYC sign-off, or non-NZ entity diligence.

Work shape: Bounded Transactional register lookup. The skill returns NZBN register fields verbatim; it does not perform substantive financial, legal, or regulatory analysis.

## Scope and Legal Use

This skill provides legal *support*, not legal advice or a diligence conclusion. A "Registered" status means the entity is on the NZBN register at lookup time — not that it is solvent, not that the named directors hold signing authority, and not that the entity is appropriate to contract with.

**Three legal failure modes addressed.**

1. *Legal advice vs. legal support.* The output is a register snapshot, not a legal opinion. It does not confirm signing authority, board approval, beneficial ownership, or solvency. A "Registered" line is not a green light to sign.
2. *Privilege and confidentiality.* The Gemini smart-search path sends document text to a third-party LLM. On privileged or confidential matters this is a confidentiality exposure that may risk privilege; the basic NZBN-only path sends only the extracted entity name or number.
3. *Accountability.* The lawyer remains accountable for entity verification, signing-authority confirmation, AML/KYC where required, and any onward contractual reliance. The skill does not sign off on counterparty diligence.

## Confidence Bands

- **High** — exact NZBN-number match returned by the NZBN register.
- **Medium** — exact registered-name string match returned by the NZBN register (no fuzzy logic).
- **Low / Review** — fuzzy match, Gemini-inferred match, multiple candidates, or partial match. Route to the lawyer for manual confirmation. Do not present as verified.

## Out of Scope

- Does not provide a solvency opinion. The NZBN register does not adjudicate solvency; a "Registered" status is not a solvency confirmation.
- Does not confirm signing authority, director powers, or board approval.
- Does not perform AML/KYC, sanctions, or PEP screening.
- Does not cover NZ Limited Partnerships, trusts, incorporated societies, or overseas-company branches sitting outside the NZBN register, except where they appear there with limited fields.
- Does not replace deeper Companies Office searches where richer director or shareholder data is needed.
- Does not validate non-NZ entities.

## Escalation

Stop and route to manual Companies Office check or external counsel when:

- the counterparty is anything other than a NZ-incorporated company (LP, trust, incorporated society, overseas branch);
- NZBN status is anything other than "Registered" (e.g., removed, in liquidation, struck off, in voluntary administration);
- the entity has recently changed name or NZBN, or there is no exact match in the register;
- the matter requires AML/KYC, beneficial-ownership, or sanctions screening — NZBN alone is not sufficient;
- the user is relying on the output to confirm solvency or signing authority (the skill does not do either).

## Limitations

- NZ companies only.
- Requires the user to provide their own NZBN API credentials.
- Smart search requires a Gemini API key and is off by default; see Privilege and Confidentiality Warning above.
- Register data may be stale relative to real-world status changes; the skill returns what the register holds at lookup time.

## QA Remediation (LegalQuants, 2026-05)

Original author Joshua Wong. LegalQuants applied QA remediation in 2026-05 based on the Legal Skill Design Framework QA. Specific changes:

- **Solvency overclaim fixed.** The previous "Solvency: Solvent" output line was reframed as an NZBN registration-status line ("NZBN status: active / removed / inactive") with an explicit note that the NZBN register does not adjudicate solvency and that solvency requires separate analysis.
- **Gemini smart-search confidentiality stance added.** Added a prominent Privilege and Confidentiality Warning describing that smart search routes document text to Google Gemini, and stating that the skill must not be invoked on privileged or confidential material unless the firm has approved external AI processing of legal documents.
- **Gemini smart-search disable option documented.** Smart search is now declared opt-in and off by default; users can disable by leaving the Gemini API key empty or setting `smart_search_enabled = false`.
- **Structural sections added** per the framework: frontmatter `version`, `last_reviewed`, `last_reviewed_by`; Audience and Work Shape; Scope and Legal Use (with the three legal failure modes called out); Confidence Bands; Out of Scope; Escalation.
- Technical content (input, process, Word integration, output format, setup, NZ-only scope) preserved.
