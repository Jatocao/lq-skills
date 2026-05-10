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
| [sgcite](skills/sgcite/) | Yu Chou Teo | SG | Verify Singapore court citations, detect hallucinated cases |
| [license-comply](skills/license-comply/) | Sam Clearwater | US | Audit open-source dependency licenses in Python projects |
| [redlines](skills/redlines/) | Hou Fu Ang | SG | Generate tracked changes in Word documents from diff output |
| [text-provenance](skills/text-provenance/) | Yu Chou Teo | SG | Identify text sources, attribute clauses, detect plagiarism |
| [office-word-diff](skills/office-word-diff/) | Yu Chou Teo | SG | Word-level tracked changes via Office.js |
| [superdoc-redlines](skills/superdoc-redlines/) | Yu Chou Teo | SG | Multi-agent DOCX redlining with conflict resolution |
| [nzbn-word-addin](skills/nzbn-word-addin/) | Joshua Wong | NZ | Validate NZ companies via NZBN register from Word |
| [bart-statutory-reference-checker](skills/bart-statutory-reference-checker/) | Kevan Wee | SG | Check statutory citations against Singapore statutes |
| [nda-review](skills/nda-review/) | Jamie Tso | AG | One-way commercial NDA review with clause-by-clause issue logs |
| [vibe-legal-batch-redliner](skills/vibe-legal-batch-redliner/) | Artur Serov | UK | Batch contract redlining with playbook-driven AI |

## Installation

### OpenClaw
```bash
clawhub install lq-skills --registry https://github.com/LegalQuants/lq-skills
```

### Claude Code / Codex CLI
```bash
# Via Superpowers marketplace or direct git clone
git clone https://github.com/LegalQuants/lq-skills.git
```

### Gemini CLI
```bash
gemini extensions install https://github.com/LegalQuants/lq-skills
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see individual skill licenses.
