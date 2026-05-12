---
name: coquill-transcriber
description: "Transcript generator for CoQuill. Reads an interview_log.json and manifest.yaml,
  then writes a human-readable transcript.md to the job folder. Called by the coquill
  orchestrator — not triggered directly by the user."
author: Ang Hou Fu
version: 0.1.0
last_reviewed: 2026-05
last_reviewed_by: LegalQuants (QA remediation)
---

# CoQuill — Transcript Generator

You generate a transcript from a completed interview session. The heavy lifting
is handled by `scripts/transcribe.py`; your job is to invoke it and relay the result.

> **Note on script location:** `scripts/transcribe.py` is **not bundled** in this
> sub-skill folder. The transcription logic lives upstream at `houfu/coquill` (the
> parent skill package). If the agent invokes this skill and the script is not
> present on the resolved path, **halt and return a failure** to the orchestrator
> rather than producing partial or fabricated transcripts.

## Inputs from Orchestrator

- **`interview_log_path`** — path to `interview_log.json` in the job folder
- **`manifest_path`** — path to `manifest.yaml` in the template directory
- **`job_folder`** — path to the job output folder
- **`output_files`** — comma-separated output file basenames (e.g., `agreement.docx, agreement.pdf`)
- **`ended_at`** — ISO 8601 timestamp for when the document was rendered

## Key Principle

The interview log records the *substance* of each exchange, not a literal word-for-word
transcript of every micro-turn. When a user answered multiple questions at once, the log
records the net result. The `clarification` entry handles the exceptional case where
the user asked a substantive question about the document before answering.

## Run the Script

Resolve the script path relative to the project root and invoke it:

```bash
python scripts/transcribe.py \
  --interview-log <interview_log_path> \
  --manifest <manifest_path> \
  --job-folder <job_folder> \
  --output-files "<output_files>" \
  --ended-at "<ended_at>"
```

The script reads both files, builds the four transcript sections (header, interview,
confirmed values, footer), writes `transcript.md` to the job folder, and prints a
JSON result to stdout.

## Interpret Results

The script prints JSON: `{"transcript_path": "...", "success": true}` on success,
or `{"transcript_path": null, "success": false, "error": "..."}` on failure.

- On **success**: report the transcript path back to the Orchestrator.
- On **failure**: relay the error message. Document delivery always takes priority
  over transcript generation — a transcript failure should not block the user.

## QA Remediation (LegalQuants, 2026-05)

QA verdict on 2026-05-11: SOME CONCERN. The substantive functionality and bounded
transactional shape are sound; the gap was that `scripts/transcribe.py` is
referenced in the invocation block above but is not shipped inside this sub-skill
folder, so reviewers could not inspect file-write scope, error handling, or side
effects from the skill alone.

LegalQuants remediation applied here (no rewrite of technical content):

- Added an explicit note at the top of this file that `scripts/transcribe.py` is
  not bundled and lives upstream at `houfu/coquill`. If the script is missing at
  invocation time, the skill must halt and return a failure rather than emit a
  partial or fabricated transcript.
- Added `version`, `last_reviewed`, and `last_reviewed_by` to the frontmatter for
  traceability. Authorship remains with Ang Hou Fu.

Items intentionally left to the upstream maintainer (`houfu/coquill`):

- Shipping `scripts/transcribe.py` inside this sub-skill folder, or formally
  documenting its canonical location and file-write scope.
- A standalone "out of scope / does not do" block (does not modify
  `interview_log.json`, does not edit or re-render the document, does not retry,
  does not call any network).
- The one-line legal-mode disclaimer (transcript is an audit log, not legal
  advice; privilege and accountability sit with the parent `coquill` orchestrator
  and the supervising lawyer).

These are noted so a downstream consumer knows what was and was not fixed by the
LegalQuants QA pass.
