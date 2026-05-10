# LQ Skills

Legal Quants — agent skills for legal work.

A curated collection of skills built by the [Legal Quants](https://legalquants.com) community (~100 lawyer-builders across 17+ jurisdictions). These skills are harness-agnostic: install once, use across Claude Code, Codex CLI, Gemini CLI, OpenCode, Cursor, and OpenClaw.

## Why

Most legal AI tools are black boxes. LQ skills are transparent, version-controlled, and practitioner-built — by lawyers who actually use them in production.

## Skills

| Skill | Author | Jurisdiction | Description |
|-------|--------|--------------|-------------|
| [statutory-analysis](skills/statutory-analysis/) | Rafal Stanislaw Fryc | US | Guide for reading, interpreting, and applying statutes |
| [customs-trade-law](skills/customs-trade-law/) | M. Onur Kafkas | US | HTS classification, CROSS ruling research, CIT/CAFC case mapping |
| [cite-checker](skills/cite-checker/) | Rebecca Fordon | US | Verify legal citations against CourtListener API |
| [us-state-privacy-navigator](skills/us-state-privacy-navigator/) | Zachary Brenner | US | Cross-jurisdictional analysis of the US state consumer privacy patchwork. Applicability triage, gap analysis, DSAR routing, conflict-of-laws synthesis, and federal sectoral overlay analysis across all 20 comprehensive state privacy laws. Includes structured precedent corpus (82 enforcement actions), per-state AG enforcement priorities, citation discipline auditor, and DOCX deliverable generation. |
| [sgcite](skills/sgcite/) | Yu Chou Teo | SG | Verify Singapore court citations and detect hallucinated cases |
| [license-comply](skills/license-comply/) | Sam Clearwater | US | Audit open-source dependency licenses in Python projects |
| [redlines](skills/redlines/) | Hou Fu Ang | SG | Generate tracked changes in Word documents from diff output |
| [text-provenance](skills/text-provenance/) | Yu Chou Teo | SG | Identify text sources, attribute clauses, detect plagiarism |
| [office-word-diff](skills/office-word-diff/) | Yu Chou Teo | SG | Word-level tracked changes via Office.js |
| [superdoc-redlines](skills/superdoc-redlines/) | Yu Chou Teo | SG | Multi-agent DOCX redlining with conflict resolution |
| [nzbn-word-addin](skills/nzbn-word-addin/) | Joshua Wong | NZ | Validate NZ companies via NZBN register from Word |
| [bart-statutory-reference-checker](skills/bart-statutory-reference-checker/) | Kevan Wee | SG | Check statutory citations against Singapore statutes |
| [nda-review](skills/nda-review/) | Jamie Tso | Agnostic | One-way commercial NDA review with clause-by-clause issue logs |
| [vibe-legal-batch-redliner](skills/vibe-legal-batch-redliner/) | Artur Serov | UK | Batch contract redlining with playbook-driven AI |
| [lq-board-document-review](skills/lq-board-document-review/) | Legal Quants | MULTI | Four-category governance review: defined terms, cross-refs, matrix consistency, red flags |
| [lq-governance-playbook-benchmark](skills/lq-governance-playbook-benchmark/) | Legal Quants | MULTI | Benchmark governance docs against LQ Playbook with five-tier classification |
| [classify-ccp](skills/classify-ccp/) | Leona Zhang | Agnostic | Classify treatment of Competition Compliance Programmes (CCPs) in competition-law enforcement documents — offence, defence, remedy, or irrelevant |
| [adversarial-qc](skills/adversarial-qc/) | Alexios vdSK | Agnostic | Adversarial quality control for AI deliverables — two-agent parallel verification with checklist, agreements/disagreements flagged for human review |
| [collating-reviewer-feedback](skills/collating-reviewer-feedback/) | AnonLQ | Agnostic | Compile DOCX comments and tracked changes into a lawyer-controlled resolution checklist |
| [uk-citation-verification](skills/uk-citation-verification/) | AnonLQ | UK | Verify UK citations against public authority sources and flag hallucinated or mismatched authorities |
| [proposition-checking](skills/proposition-checking/) | AnonLQ | Agnostic | Check whether cited materials actually support legal and factual propositions |
| [building-chronologies](skills/building-chronologies/) | AnonLQ | Agnostic | Build sourced chronologies from legal documents, correspondence, disclosure, and pleadings |
| [uk-witness-statement-review](skills/uk-witness-statement-review/) | AnonLQ | England and Wales | Review witness statements for source support, CPR compliance, and evidential risk |
| [uk-particulars-of-claim-review](skills/uk-particulars-of-claim-review/) | AnonLQ | England and Wales | Review draft Particulars of Claim for pleaded elements, CPR/PD16 structure, remedies, and gaps |
| [uk-disclosure-list-review](skills/uk-disclosure-list-review/) | AnonLQ | England and Wales | Review disclosure lists for document coverage, inspection objections, privilege flags, and adverse documents |
| [uk-court-of-appeal-judicial-preference-check](skills/uk-court-of-appeal-judicial-preference-check/) | AnonLQ | England and Wales | Check appellate drafts against public-source Court of Appeal judicial preference signals |
| [local-first-legal-workspace](skills/local-first-legal-workspace/) | AnonLQ | Agnostic | Audit privacy boundaries for local-first legal AI workspaces and BYOK workflows |
| [legal-claim-economics](skills/legal-claim-economics/) | AnonLQ | Agnostic | Model claim economics, funding structures, fee arrangements, and recovery waterfalls |
| [corporate-registry-investigation](skills/corporate-registry-investigation/) | AnonLQ | UK | Investigate UK companies using Companies House officers, PSCs, charges, and filings |

See [ACCESS-MODES.md](ACCESS-MODES.md) for source-handling conventions and [PR-READINESS.md](PR-READINESS.md) for the AnonLQ-attributed contribution checklist.

## Installation

### OpenClaw
```bash
clawhub install lq-skills --registry https://github.com/LegalQuants/lq-skills
```

### Claude Code / Codex CLI
```bash
git clone https://github.com/LegalQuants/lq-skills.git
```

### Gemini CLI
```bash
gemini extensions install https://github.com/LegalQuants/lq-skills
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Apache License 2.0 for the project and AnonLQ-attributed skills (see [LICENSE](LICENSE)).

Two community skills imported from their authors' own GitHub repos retain their original MIT licenses, which are compatible with Apache 2.0:

- `skills/classify-ccp/` — MIT, Copyright Leona Zhang
- `skills/adversarial-qc/` — MIT, Copyright Alexios van der Slikke-Kirillov

Other community skills inherit the project-level Apache 2.0 license unless they include their own `LICENSE` file.
