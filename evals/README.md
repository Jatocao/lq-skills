# Evals

Every skill with objectively verifiable output ships evals so others can confirm
it works. We follow Anthropic's `skill-creator` convention.

## Canonical format (new skills)

Evals live at `skills/<name>/evals/evals.json`:

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

**How to author them:**

1. Write **2–3 realistic prompts** — what a real user would actually type, not
   idealised demo inputs.
2. Run the skill **with** vs. **without** it (baseline) on each prompt.
3. Confirm the output matches `expected_output`. During evaluation, add
   `assertions` entries (`text`, `passed`, `evidence`) to capture what you checked.
4. Optionally record a human-readable summary in `evals/RESULTS.md`.

**Gold tier (encouraged):** run the skill against a real document corpus from
your own practice and record pass/fail + notes in `evals/RESULTS.md`. This goes
beyond the Anthropic baseline of 2–3 cases — flag it as a strength in your PR.

When in doubt about whether your skill needs evals: skills with objectively
verifiable outputs (file transforms, extraction, classification, citation/
registry checks, fixed workflows) need them; purely subjective skills (writing
style, tone) may omit them — say why in the PR.

---

## Legacy AnonLQ evals (`evals.yaml`)

The notes below cover the older AnonLQ skills, which ship `evals.yaml` at the
skill root. That format is being normalised to `evals/evals.json`; the guidance
remains valid for running the existing files.

These evals are lightweight behavioural tests for the AnonLQ skills. They are not automated benchmarks. Run them in Claude or another Agent Skills-compatible harness after installing the skills.

Each skill is self-contained and has its own local `evals.yaml` file inside the skill directory. Use those local files when testing a single-skill installation.

Each eval checks whether the skill:

- invokes for the right user prompt,
- uses live or user-supplied sources when available,
- falls back to a verification queue when sources are missing,
- avoids model-memory verification,
- preserves source status and legal-safety limits.

## How To Run

1. Install or expose this repository's `skills/` directory to the target harness.
2. Start a fresh session.
3. Open the relevant `skills/{skill-name}/evals.yaml`.
4. Paste one eval prompt at a time.
5. Compare the response against `must_include` and `must_not_include`.
6. Record pass/fail in the PR description.

## Expected Source Modes

- `live_source` or equivalent when web/browser/MCP/API access is available and used.
- `user_supplied_source` when the prompt supplies documents, exports, or text.
- `no_source`, `source_missing`, or `unverified-source-unavailable` when no verification-grade source is available.

## Evaluation Standard

A skill fails if it:

- verifies from model memory,
- predicts a legal outcome,
- treats search snippets as verification-grade sources,
- states registry facts without registry material,
- certifies court-rule compliance without current rule/order source,
- omits source status for material findings.
