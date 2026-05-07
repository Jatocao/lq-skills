# Contributing to LQ Skills

## Philosophy

LQ skills are built by practitioners, for practitioners. A good LQ skill:

1. **Solves a real problem** — Not a demo, not a toy. Something you'd actually use in legal work.
2. **Works across harnesses** — No OpenClaw-specific tooling unless necessary.
3. **Is transparent** — The skill logic should be readable and auditable.
4. **Is tested** — Document how you tested it and what worked.

## Process

1. **Fork the repo** and create a branch from `main`
2. **Add your skill** under `skills/<your-skill-name>/`
3. **Include**:
   - `SKILL.md` — the skill definition
   - `README.md` — usage, installation, examples
   - `LICENSE` — must be MIT or Apache 2.0
4. **Open a PR** with a clear description of what the skill does and how it was tested
5. PR requires at least one approval from an LQ member

## Skill Format

```markdown
---
name: my-skill
description: What this skill does and when to use it.
author: Your Name
jurisdiction: e.g., US, UK, EU, Singapore
tags: [contract-review, statutory-analysis, research]
---

# My Skill

## When to Use

## How It Works

## Examples

## Limitations
```

## Quality Bar

- Does it solve a problem that lawyers actually face?
- Is the skill readable by someone who doesn't know your codebase?
- Does it work with at least 2 harnesses (e.g., Claude Code + OpenClaw)?
- Have you used it yourself in real work?

## Questions?

Ask in the LQClaw group.
