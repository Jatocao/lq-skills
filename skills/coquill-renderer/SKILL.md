---
name: coquill-renderer
description: "Document renderer for CoQuill. Takes a template, variable values, and produces rendered documents (docx or html+pdf). Validates output for unfilled placeholders. Called by the coquill orchestrator — not triggered directly by the user."
author: Hou Fu Ang
version: 0.1.0
last_reviewed: 2026-05
last_reviewed_by: LegalQuants (QA remediation)
---

> **Note — missing render script.** The `scripts/render.py` referenced below is **not bundled in this skill directory**. The canonical rendering, boolean coercion, validation, and PDF-conversion logic lives in the upstream `houfu/coquill` repository. Before invoking this skill, the agent MUST verify that `scripts/render.py` is resolvable at `$CLAUDE_PLUGIN_ROOT/scripts/render.py` (or an equivalent project-root path). If the script cannot be located, **halt and return an error to the orchestrator — do not silently produce unverified output**.
>
> **Validation requirement.** Rendered output MUST be verified for unfilled placeholders (`{{ var }}`) and unprocessed control tags (`{% %}`) before being treated as complete. A document that has not been validated, or that fails validation, must NOT be delivered to the user.

# CoQuill — Document Renderer (v2)

You are running the CoQuill document renderer. Your job is to render a completed document from a template and a set of variable values, then validate the output.

## Inputs

This skill is called by the CoQuill orchestrator. You receive:
- **Template path** — e.g., `templates/_examples/Bonterms_Mutual_NDA/Bonterms-Mutual-NDA.docx`
- **Format** — `docx`, `html`, or `markdown`
- **Variable dictionary** — all collected values: flat key-value pairs, booleans as Python `True`/`False`, and loop collections as lists of dicts
- **Output directory** — e.g., `output/`

## Step 1 — Output Structure

Each rendering job gets its own folder inside the output directory:

```
output/
└── {template_name}_{key_variable}_{date}/
    ├── {template_name}_{key_variable}_{date}.docx
    └── {template_name}_{key_variable}_{date}.pdf   ← when tooling available
```

- `key_variable`: the most identifying variable (typically a person/company name) — slugified (lowercase, underscores, no special characters).
- `date`: today's date in `YYYY-MM-DD` format.
- Job folders deduplicate by appending `_2`, `_3`, etc. if the folder already exists.

## Step 2 — Write Context and Run Render Script

### 2a — Write context.json

Serialize the full variable dictionary as a JSON file to a temporary path. The render script reads this file.

### 2b — Resolve script path

The render script lives at `scripts/render.py` relative to the project root. If the `CLAUDE_PLUGIN_ROOT` environment variable is set, resolve the script as `$CLAUDE_PLUGIN_ROOT/scripts/render.py`.

### 2c — Run the render script

```bash
python <script_path> \
  --template <template_path> \
  --format <docx|html|markdown> \
  --context <context_file> \
  --output-dir <output_dir> \
  --job-name <job_name> \
  [--pdf]
```

The script handles boolean coercion, job folder creation, template rendering (`docxtpl` for docx, `jinja2` for html/markdown), PDF conversion, and output validation. It prints a JSON result to stdout containing `job_dir`, `files`, `pdf_produced`, `pdf_warning`, and `validation`.

### 2d — Cowork DOCX to PDF fallback

The render script does **not** handle Cowork-specific docx-to-PDF conversion. If you are running inside Cowork (check for `/home/user/.claude/` or the `COWORK` environment variable) and the format is `docx` with PDF requested:

1. Run the render script **without** `--pdf` to produce the `.docx`.
2. Use the Cowork built-in `docx` skill to read the rendered `.docx` file.
3. Use the Cowork built-in `pdf` skill to produce a `.pdf` from it.
4. Save the resulting PDF to the job folder as `{job_name}.pdf`.

Do NOT attempt `docx2pdf` or `soffice` in Cowork — they fail due to sandbox restrictions.

## Step 3 — Interpret Validation Results

The script's JSON output includes a `validation` object:

- **`validation.passed == true`**: All placeholders and control tags were processed. The document is ready.
- **`validation.unfilled_variables`** (non-empty): Variable names that remain as `{{ var }}` in the rendered output. Check whether those variables exist in the manifest — if they do, something went wrong in rendering; if they don't, the template may have placeholders the Analyzer missed.
- **`validation.unprocessed_tags`** (non-empty): Remaining `{% %}` control tags indicate a rendering failure. Common causes: boolean value passed as a string, missing loop collection, or malformed template syntax.

If validation fails, report the issue back to the orchestrator so it can inform the user and offer to re-collect and re-render. Do NOT deliver a document with unfilled placeholders or unprocessed control tags.

## Step 4 — Report Results

Return to the orchestrator:
- The `job_dir` and `files` list from the script output
- Whether validation passed or failed (with details if failed)
- Whether PDF was produced (`pdf_produced`); if not, include `pdf_warning`

**Soft-fail semantics for PDF:** Always deliver the primary document (`.docx`, `.html`, or `.md`). Warn if PDF was not produced — never hard-fail because of missing PDF tooling.

## Important Notes

- **For docx templates**, always use `docxtpl` — not raw python-docx with string replacement. `docxtpl` preserves formatting around placeholders and natively supports Jinja2 control tags.
- **PDF output is soft-fail** — always deliver the primary format even if PDF conversion fails.

## QA Remediation (LegalQuants, 2026-05)

Reviewed by LegalQuants against the Legal Skill Design Framework on 2026-05-11; verdict: SOME CONCERN. The load-bearing `scripts/render.py` is absent from this skill directory and lives in the upstream `houfu/coquill` repo, so the rendering, boolean coercion, validation, and PDF-conversion logic could not be inspected at the LegalQuants registry layer.

Remediation applied in this file:
- Added a frontmatter note flagging that `scripts/render.py` is not bundled; on invocation, the agent must verify the script is available and halt rather than silently producing unverified output.
- Added an explicit validation requirement: rendered output must be checked for unfilled placeholders and unprocessed control tags before being treated as complete.
- Added `version: 0.1.0`, `last_reviewed: 2026-05`, and `last_reviewed_by: LegalQuants (QA remediation)` to frontmatter. Hou Fu Ang retained as author.

Not remediated here (defers to upstream / orchestrator):
- Shipping `scripts/render.py` alongside the skill so its behaviour can be reviewed at this layer — this is an upstream decision for `houfu/coquill`.
- Legal-advice / privilege / accountability concerns — these sit at the parent `coquill` orchestrator and the requesting user, not this rendering layer.
- Explicit "not in scope" enumeration (variable correctness, legal sufficiency, e-signature, delivery, persistence beyond the job folder) — left to upstream copy edits; the structural-completion-only posture is now stated via the validation-requirement note above.

Technical content of the renderer (inputs, output structure, render-script invocation, Cowork fallback, validation interpretation, reporting, soft-fail PDF semantics) is unchanged.
