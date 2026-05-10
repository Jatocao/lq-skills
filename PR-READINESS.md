# PR Readiness Checklist (AnonLQ Skills)

Scope: this checklist applies to the AnonLQ-banner skills in this repo (`building-chronologies`, `collating-reviewer-feedback`, `corporate-registry-investigation`, `legal-claim-economics`, `local-first-legal-workspace`, `proposition-checking`, `uk-citation-verification`, `uk-court-of-appeal-judicial-preference-check`, `uk-disclosure-list-review`, `uk-particulars-of-claim-review`, `uk-witness-statement-review`). Named-author community skills follow their own attribution model — see the top-level `README.md`.

Use this before opening a pull request that adds or changes AnonLQ skills.

## Content Checks

- [ ] AnonLQ skill directories contain only AnonLQ-authored contribution materials.
- [ ] No private app, firm, client, project, or personal-name references inside AnonLQ skill directories.
- [ ] Each skill has:
  - `SKILL.md`
  - `README.md`
  - `LICENSE`
  - `examples/output.md`
  - at least one `references/*.md`
- [ ] Each `SKILL.md` links to its local example and reference file.
- [ ] Each skill has explicit access modes and no-source fallback behaviour.
- [ ] Externally sourced examples cite public sources or clearly mark source absence.
- [ ] No skill verifies from model memory.

## Behaviour Checks

Run each relevant skill's local `evals.yaml` manually in the target harness. For each eval:

- [ ] Claude selects or can be directed to the right skill.
- [ ] Response includes source/access state.
- [ ] Response uses the local example shape where appropriate.
- [ ] Response preserves uncertainty when sources are absent.
- [ ] Response avoids prohibited outputs.

## Install Checks

Test at least one clean installation route:

- [ ] Clone repo into a fresh directory.
- [ ] Expose `skills/` to Claude Code or another Agent Skills-compatible harness.
- [ ] Invoke one skill directly or by trigger phrase.
- [ ] Confirm supporting files in `examples/` and `references/` are loadable.

## Suggested PR Summary

```markdown
## Summary

- Adds 11 AnonLQ legal workflow skills covering UK litigation review, citation/proposition checking, reviewer markup collation, claim economics, local-first legal AI audit, and Companies House investigation.
- Each skill is self-contained with local examples, reference models, access-mode fallbacks, and source-status guardrails.
- Adds shared access-mode guidance and prompt evals for live-source, user-supplied-source, and no-source scenarios.

## Testing

- Validated clean AnonLQ skill structure and AnonLQ-only content inside AnonLQ skill directories.
- Checked every AnonLQ skill has SKILL.md, README.md, LICENSE, examples/output.md, and references/*.md.
- Ran forbidden-reference scans inside AnonLQ skill directories for private app/project/identity labels.
```
