# LQ Skills

Legal Quants — agent skills for legal work.

A curated collection of skills built by the [Legal Quants](https://legalquants.com) community (~100 lawyer-builders across 17+ jurisdictions). These skills are harness-agnostic: install once, use across Claude Code, Codex CLI, Gemini CLI, OpenCode, Cursor, and OpenClaw.

## Why

Most legal AI tools are black boxes. LQ skills are transparent, version-controlled, and practitioner-built — by lawyers who actually use them in production.

## Skills

| Skill | Author | Description |
|-------|--------|-------------|
| [Statutory Analysis](skills/statutory-analysis/) | Rafal Stanislaw Fryc | Guide for reading, interpreting, and applying statutes |
| [Customs Trade Law](skills/customs-trade-law/) | Onur Kafkas | HTS classification, CROSS ruling research, CIT/CAFC case mapping |
| [Contract Redliner](skills/contract-redliner/) | — | Contract redlining with track changes |
| [Cite Checker](skills/cite-checker/) | — | Verify legal citations against CourtListener API |
| [Competition Compliance](skills/competition-compliance/) | Leona Zhang | Classifies CCP treatment in competition law enforcement docs |
| [Sara Associate](skills/sara-associate/) | David Rubenstein | AI senior associate for tech transactions |

## Installation

### OpenClaw
```bash
clawhub install lq-skills --registry https://github.com/lq-jamie/lq-skills
```

### Claude Code / Codex CLI
```bash
# Via Superpowers marketplace or direct git install
```

### Gemini CLI
```bash
gemini extensions install https://github.com/lq-jamie/lq-skills
```

See individual skill READMEs for harness-specific instructions.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see individual skill licenses.
