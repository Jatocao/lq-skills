---
name: coquill-analyzer
description: "Template analyzer for CoQuill (v2). Parses docx/HTML templates, extracts variables including conditionals and loops, merges config.yaml overrides, infers types, and generates a v2 manifest.yaml. Called by the coquill orchestrator — not triggered directly by the user."
author: Hou Fu Ang
version: 0.1.0
last_reviewed: 2026-05
last_reviewed_by: LegalQuants (QA remediation)
---

# CoQuill — Template Analyzer v2

You are running the CoQuill template analyzer. You receive a **template directory path** from the Orchestrator (e.g., `templates/_examples/Bonterms_Mutual_NDA/`).

## Step 1 — Resolve Script Path and Run

```python
import os
script = os.path.join(
    os.environ.get("CLAUDE_PLUGIN_ROOT", ""),
    "scripts", "analyze.py"
)
```

If `CLAUDE_PLUGIN_ROOT` is not set, the path resolves to `scripts/analyze.py` relative to the project root.

**Note (script availability):** `scripts/analyze.py` is **not bundled** in this skill folder, and is also absent from the parent `coquill/` bundle as shipped. Before running, the agent **must verify the resolved script path actually exists on disk** (e.g., `os.path.isfile(script)`). If the script is missing:

- **Do not silently skip** the analysis step.
- Either (a) **halt and escalate to the user** with the resolved path and a request to ship the script, or (b) **fall back to an inline template-parsing routine** that performs the equivalent extraction (variables, conditionals, loops, config merge) and reports the fallback explicitly to the Orchestrator.

Never proceed downstream as if analysis succeeded when the script was not actually invoked.

Run the script:

```bash
python <script_path> <template_dir> [--force]
```

Pass `--force` if the Orchestrator requests re-analysis (skips the cache check).

The script handles: format detection, caching, text extraction (including docx XML merge), two-pass analysis, type inference, condition parsing, loop sub-variable extraction, dependency graph construction, config.yaml merge, and manifest save.

### Interpret Script Output

- **Exit 0** with `"Manifest is up to date"` — cached manifest is valid; load it from `<template_dir>/manifest.yaml`.
- **Exit 0** with `"Manifest written"` — fresh analysis complete; proceed to Step 2.
- **Exit 1** — error (e.g., no template file found, corrupt docx). Report the stderr/stdout message to the Orchestrator.

## Step 2 — Validate the Manifest

After a fresh analysis (not a cache hit), load `manifest.yaml` and check for issues the script cannot catch. Each warning carries a **severity band** (H = High, M = Medium, L = Low):

1. **[H] Zero variables** — if `variable_count` is 0, the template has no placeholders. The template is almost certainly the wrong file or unreadable.
2. **[H] Orphaned gate variables** — every variable listed in `dependencies` keys must appear in `variables`. If one is missing, the interview will fail to collect the gate value and downstream rendering will produce incorrect output.
3. **[M] Conditional variables shadowing unconditional** — if the same variable name appears in both `variables` and a conditional's `if_variables`/`else_variables`, flag it. The script deduplicates these, but a config.yaml merge could reintroduce duplicates.
4. **[M] Loop sub-variables with no names** — if a loop's `variables` list is empty, the loop collects nothing. This may be intentional (iteration-only) or a sign the template uses a non-standard loop variable pattern; human review needed.
5. **[L] Config.yaml drift** — if `config.yaml` exists, quickly scan it for variable names that don't appear anywhere in the manifest. These are config entries for variables the template no longer uses. Cleanup hint only.

### Halt rule

- **Any High-severity warning (H) → STOP. Do not return a green manifest to the Orchestrator. Escalate to the user** with the specific warning, the resolved template path, and the manifest excerpt that triggered the halt. Do not silently continue rendering.
- **Medium-severity warnings (M) → return the manifest with the warning attached and require Orchestrator-side human acknowledgement before render.**
- **Low-severity warnings (L) → pass through to the Orchestrator as FYI; safe to proceed.**

Report all warnings (with severity tags) alongside the manifest contents when returning to the Orchestrator. Never collapse High and Low into a flat list.

## Step 3 — Return to Orchestrator

Return the full `manifest.yaml` contents to the Orchestrator, along with any warnings from Step 2.

## QA Remediation (LegalQuants, 2026-05)

This skill was reviewed against the Legal Skill Design Framework on 2026-05-11 and received a **SOME CONCERN** verdict. The remediation applied here is targeted at the two specific gaps called out in the QA report; the technical content of Steps 1–3 is unchanged.

Changes applied:

- **Severity bands (H / M / L) added to Step 2 warnings.** Step 2 previously listed five validation checks as a flat list with no priority signal; the Orchestrator could not distinguish "manifest is broken, stop" from "FYI cleanup hint." Each check is now tagged: zero variables and orphaned gates are High (halt); shadowing and empty loops are Medium (human ack required); config.yaml drift is Low (pass-through).
- **Explicit halt rule added to Step 2.** High-severity warnings now require the analyzer to stop and escalate to the user rather than return a manifest the Orchestrator might silently render against. This closes the accountability gap flagged in the QA report (warnings could previously be silently treated as advisory).
- **`scripts/analyze.py` availability note added to Step 1.** The QA scan confirmed that `scripts/analyze.py` is not present in this skill folder and is also absent from the parent `coquill/` bundle. The skill now instructs the agent to verify the script exists at the resolved path before running, and to either halt and escalate or fall back to inline template parsing — never to silently skip analysis.
- **Frontmatter expanded** with `author: Hou Fu Ang` (preserved), `version: 0.1.0`, `last_reviewed: 2026-05`, and `last_reviewed_by: LegalQuants (QA remediation)`. Authorship of the underlying technical content remains with Hou Fu Ang; LegalQuants is recorded only as the QA reviewer.

Gaps deliberately **not** addressed in this pass (deferred to upstream owner Hou Fu Ang / parent `coquill/` bundle):

- Shipping the actual `scripts/analyze.py` file inside the bundle.
- Audience block, work-shape declaration, input-requirements contract, scope-boundaries section, and the broader parameter-evaluation fixes from the QA report.

These were left for the parent skill owner because they affect the design contract between `coquill` (orchestrator) and `coquill-analyzer` (this sub-skill), and unilateral edits by a downstream reviewer would risk drifting the sub-skill out of sync with the parent.
