# Contributing to LQ Skills

## Philosophy

LQ skills are built by practitioners, for practitioners. A good LQ skill:

1. **Solves a real problem** — Not a demo, not a toy. Something you'd actually use in legal work.
2. **Works across harnesses** — No OpenClaw-specific tooling unless necessary.
3. **Is transparent** — The skill logic should be readable and auditable.
4. **Is tested** — Ships with evals so others can verify it works.

## Process

1. **Fork the repo** and create a branch from `main`
2. **Add your skill** under `skills/<your-skill-name>/`
3. **Clear the Quality Gate** (below)
4. **Open a PR** using the PR template, filling in every checkbox
5. PR requires at least one approval from an LQ member

## The Quality Gate

This applies to **every** skill — named-author and AnonLQ alike. The gate has a
**hard floor** (blocking — CI and review enforce it) and a **gold tier**
(encouraged, not blocking).

### Hard floor — required to merge

1. **Package structure.** Your `skills/<name>/` contains:
   - `SKILL.md` — the skill definition (YAML frontmatter + markdown, ideally < 500 lines)
   - `README.md` — usage, installation, examples
   - `LICENSE` — MIT or Apache 2.0
   - `evals/evals.json` — evals in the Anthropic `skill-creator` format (see below).
     Required for skills with **objectively verifiable** outputs (file transforms,
     extraction, classification, citation/registry checks, fixed workflows).
     Skills with purely **subjective** outputs (writing style, drafting tone) may
     omit evals — state why in the PR.

2. **skills-qa pass.** Run the skill through the `skills-qa` skill
   (`legal-builder-hub:skills-qa`) and record the **verdict band** in the PR:
   - **Ready** — merge-eligible.
   - **Some Concern** — merge-eligible only if you list the findings and your
     remediation/justification in the PR.
   - **Material Concerns** — not merge-eligible; fix and re-run first.

3. **Structure check passes.** CI runs `scripts/check-skill-structure.sh`, which
   fails the PR if required files are missing.

### Gold tier — encouraged, not blocking

- **Corpus-grade eval.** Beyond the 2–3 representative test cases Anthropic's
  format calls for, run the skill against a **real document corpus** from your
  own practice and record pass/fail + notes in `evals/RESULTS.md`. This is an LQ
  raise-the-bar, *not* the Anthropic baseline — flag it as a strength in the PR,
  but its absence does not block a merge.

## Eval format

We follow Anthropic's `skill-creator` convention. Evals live at
`skills/<name>/evals/evals.json`:

```json
{
  "skill_name": "your-skill-name",
  "evals": [
    {
      "id": 1,
      "prompt": "The kind of thing a real user would actually say",
      "expected_output": "Description of the expected result",
      "files": []
    }
  ]
}
```

Write **2–3 realistic prompts**, run the skill with vs. without it, and confirm
the output matches `expected_output`. Optionally record a human-readable summary
in `evals/RESULTS.md`. See [evals/README.md](evals/README.md) for the full
authoring guide.

> Note: the older AnonLQ skills ship `evals.yaml` at the skill root. That format
> is being normalised to `evals/evals.json`; new skills must use the JSON layout.

## Skill Format

```markdown
---
name: my-skill
description: What this skill does and when to use it.
author: Your Name
jurisdiction: e.g., US, UK, EU, SG, MULTI, Agnostic
tags: [contract-review, statutory-analysis, research]
---

# My Skill

## When to Use

## How It Works

## Examples

## Limitations
```

## Questions?

Ask in the LQClaw group.
