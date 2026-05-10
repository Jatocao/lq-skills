---
name: ClassifyCCP
description: Classifies the treatment of Competition Compliance Programmes (CCPs) in competition law enforcement documents. Converts PDF input, detects language, analyzes the full document, produces a scratchpad, and populates Output.xlsx. Use when classifying how a CCP is treated as an offence, defence, remedy, or irrelevant in a policy document or case/judgment.
---
# CCP Classification

Structured workflow for classifying how Competition Compliance Programmes (CCPs) are treated in competition enforcement documents (policy documents and cases/judgments).

## Workflow Overview

1. **Convert** — PDF → Markdown using PyMuPDF
2. **Translate** — If not English, translate to English
3. **Analyse** — Read entire document, identify all CCP-relevant paragraphs
4. **Classify** — Assign category based on full understanding
5. **Scratchpad** — Save working notes and classification to file
6. **Excel** — Ask permission, then populate Output.xlsx

---

## Phase 1: Convert PDF to Markdown

When the user provides a PDF file path:

1. Run the following Python snippet via Bash to extract text:
   ```python
   import fitz, sys
   doc = fitz.open(sys.argv[1])
   md = "\n\n".join(page.get_text("text") for page in doc)
   with open("_tmp_converted.md", "w", encoding="utf-8") as f:
       f.write(md)
   print("Converted successfully.")
   ```
   Example: `python3 -c "..." path/to/document.pdf`

2. Read `_tmp_converted.md` to confirm content loaded correctly.

3. Inform user: "PDF converted. Beginning analysis..."

---

## Phase 2: Language Check & Translation

1. Read `_tmp_converted.md`.
2. Determine the language of the document.
3. **If NOT English**: translate the entire content into fluent English, preserving all structure and formatting. Overwrite `_tmp_converted.md` with the translated content.
4. **If English**: proceed directly.

---

## Phase 3: Full Document Analysis

Read the **entire** converted markdown. Do not skim — classification must be based on a full understanding of the document.

**3a. Extract document metadata** (needed for Excel if a new row must be created):
- **Name of Document** (Col A): PDF basename without extension (e.g., `Case_EU_1`)
- **Country / Authority** (Col B): the jurisdiction or authority the document relates to (e.g., `EU`, `UK`, `France`, `Canada Competition Bureau`)
- **Document Type** (Col C): one of `Policy Document`, `Case`, `Judgment`, `Decision`, `Guidelines`, or similar
- **Title** (Col D): the official title of the document as found in its header/cover
- **Date** (Col E): the date of publication, decision, or last modification as stated in the document; if not found, use the PDF file's modification date

**3b. Identify CCP-relevant content**: Identify all paragraphs that mention any of the following (and variations):
- compliance programme / compliance program
- compliance system / compliance framework
- compliance measures / compliance culture
- internal compliance / corporate compliance

**Critical rule for cases and judgments**: The document may contain arguments made by the parties (company, authority, opposing counsel). These arguments do NOT determine the classification. Only the **court's or authority's own decision, ruling, or finding** is what counts.

Consult `assets/examples.md` for calibration on edge cases. Note whether CCP treatment is explicit or only implied.

---

## Phase 4: Classify

Assign one of the following categories based on the authority's/court's treatment:

| Category | When to use |
|----------|-------------|
| `as an offence` | CCP existence treated as aggravating factor — CCP deemed a façade, ineffective, or its violation increases penalty |
| `as a defence (allowed)` | CCP raised as mitigating factor AND the authority/court accepted it, reducing the fine/penalty — **cases/judgments only** |
| `as a defence (rejected)` | CCP raised as mitigating factor BUT the authority/court rejected it — **cases/judgments only** |
| `as a defence` | CCP treated as a mitigating factor; outcome not further distinguished — **policy documents only** |
| `as a remedy` | CCP imposed or mandated as a corrective/remedial measure (e.g., condition of settlement) |
| `as offence and remedy` | Both offence and remedy roles present in the same document |
| `as defence and remedy` | Both defence and remedy roles present in the same document |
| `irrelevant` | CCP mentioned but not treated under any enforcement role (e.g., merely referenced in passing) |
| `unsure` | CCP referenced but how it was treated is genuinely ambiguous — state reason clearly |
| `neutral` | Authority acknowledges CCP existence but neither accepts nor rejects it as relevant to the outcome |

**Document type rule:**
- **Case or judgment** → use `as a defence (allowed)` or `as a defence (rejected)` sub-categories
- **Policy document** by a competition authority → use plain `as a defence`

If uncertain: do not guess. Use `unsure` and explain why.

---

## Phase 5: Create Scratchpad

1. Derive the scratchpad filename from the input PDF basename:
   - Input: `Case_EU_1.pdf` → Output: `scratchpad_Case_EU_1.md`
2. Copy the structure from `assets/ScratchpadTemplate.md`.
3. Fill in:
   - **Category**: the assigned category
   - **Explanation/Note**: one precise, concise sentence explaining the classification. If anything is unclear, weird, or not mentioned, state that explicitly.
   - **Reference**: the full verbatim paragraph(s) from the source document on which the classification is based
   - **Uncertainty Flags**: check any that apply
   - **Relevant CCP Paragraphs**: list all CCP-mentioning paragraphs with brief annotations
4. Save to the current working directory.
5. Clean up: delete `_tmp_converted.md`.

---

## Phase 6: Ask Permission Before Excel Update

Report to the user:
```
Scratchpad saved: scratchpad_[name].md

Classification summary:
- Category: [category]
- Explanation: [one sentence]
- Reference: "[excerpt...]"

Proceed to update Output.xlsx? (yes/no)
```

Wait for explicit user confirmation before proceeding.

---

## Phase 7: Update Output.xlsx

1. Locate `Output.xlsx` in the current working directory.
2. Search **all sheets** (AgencyDoc, UK, Canada, USA, EU, France, Sweden, Italy, Spain) for a row where **Column A** matches the input PDF basename (without extension, case-insensitive).

**If a matching row is found:**
- Fill in only:
  - **Column F** (`Category`)
  - **Column G** (`Explanation/Note`)
  - **Column H** (`Reference`)
- Save and report: "Updated existing row for [document name] in sheet [sheet name]."

**If no matching row is found:**
- Determine the correct sheet:
  - Document type is **Policy Document / Guidelines / Agency publication** → `AgencyDoc` sheet
  - Document type is **Case / Judgment / Decision** → the sheet matching the country (e.g., `UK`, `EU`, `France`, `Canada`, `USA`, `Sweden`, `Italy`, `Spain`)
  - If the country does not match any sheet, default to `AgencyDoc` and flag to the user
- Append a new row at the bottom of the correct sheet, filling in **all columns**:
  - **Column A** (`Name of Document`): PDF basename without extension
  - **Column B** (`Country / Authority`): extracted in Phase 3a
  - **Column C** (`Document Type`): extracted in Phase 3a
  - **Column D** (`Title`): extracted in Phase 3a
  - **Column E** (`Date`): extracted in Phase 3a
  - **Column F** (`Category`): the assigned category
  - **Column G** (`Explanation/Note`): the one-sentence explanation
  - **Column H** (`Reference`): the verbatim reference paragraph(s)
- Save and report: "No existing row found — created new row for [document name] in sheet [sheet name]."

Use openpyxl via Bash to perform the read and write. When appending, use `ws.append([...])` to add the new row after the last populated row.

---

## Assets

- `assets/examples.md` — Annotated classification examples for calibration
- `assets/ScratchpadTemplate.md` — Template for scratchpad output files
