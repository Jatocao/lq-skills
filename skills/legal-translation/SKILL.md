---
name: legal-translation
description: >
  Expert-level legal document translation — understands law, not just language. Use
  whenever a user wants to translate any legal document or legal text between any
  languages. Triggers: "translate this contract/agreement/order/affidavit/MoU/lease/
  notice/petition", any legal document upload with a target language, or any request
  to make legal content readable in another language. Also trigger for transliteration
  of legal names/entities, bilingual legal document creation, and legal terminology
  lookups. Covers ALL language pairs globally — contracts, MoUs, affidavits, court
  orders, power of attorney, wills, leases, legal notices, petitions, appeals,
  corporate filings, immigration docs, IP agreements, employment contracts, and any
  other legal instrument. ALWAYS use this skill when both law and language are involved.
author: Arjun Singh Chouhan
version: 1.0.0
last_reviewed: 2026-05
last_reviewed_by: LegalQuants (QA remediation)
---

# Legal Translation Skill

**Beyond literal. Beyond generic. This is legal translation that thinks like a lawyer.**

## Audience and Work Shape

Audience: Bilingual lawyers, qualified legal translators, and in-house counsel reviewing AI-assisted draft translations of legal instruments before client, counterparty, or court use. Not for end-clients or business users self-serving translations of binding instruments without lawyer oversight.

Work shape: Accretive Judgment. The output is a draft translation accompanied by translator's notes, jurisdictional flags, and a confidence-banded glossary — it is a starting point for a bilingual reviewer, not a final-form instrument. Every output must carry a "DRAFT — bilingual lawyer review required before execution" header.

## Scope and Legal Use

This skill provides legal *translation support*, not legal advice or a certified/sworn translation. Three legal failure modes are addressed head-on:

1. **Legal advice vs. legal support.** The skill produces a draft translation. Interpretation of legal effect in the target jurisdiction — whether the translated operative clause carries the same enforceability, whether a term of art has the same scope, whether the document is fit for its intended use — is the local lawyer's call. The skill never opines on whether a translation is "good enough" to sign, file, or rely on.

2. **Privilege implications.** Legal translations frequently involve privileged communications, executed contracts, work-product material, and court filings. Routing privileged or work-product material through a translation tool may break privilege if the translator (or the AI service) sits outside the privilege circle. Before invoking this skill on privileged material, the responsible lawyer must confirm that (a) the AI service is within the engagement letter's permitted-disclosure scope, and (b) the bilingual reviewer is named within privilege. If either is unclear — stop and escalate.

3. **Accountability gap.** This skill does not produce a certified or sworn translation, and does not constitute a signed translator's affidavit for purposes of court filing, apostille, or any official submission. Accountability for the final translation — including legal effect, terminology accuracy, and fitness for use — rests with the named bilingual lawyer or sworn translator in the engagement, not with the skill or its output.

## Confidence Bands

Every translation output must mark each clause or section H/M/L for terminology certainty:

- **High (H)** — standard term with a direct, well-attested equivalent in the target legal system (e.g., "purchase price" → standard contract-law term). Safe for lawyer sign-off after routine review.
- **Medium (M)** — term-of-art with a documented equivalent but with jurisdictional drift possible (e.g., "indemnity" across common-law and civil-law systems; "force majeure" between French and English drafting conventions). Flag for the bilingual reviewer to confirm legal effect in the target jurisdiction.
- **Low (L)** — no direct equivalent; explanatory translation only (e.g., "stamp duty" into US-law context; "tort" into civil-law systems; certain Sharia-finance constructs into Anglo-common-law). Must be expressly flagged in translator's notes as requiring local-counsel input before reliance.

When a clause contains an L-band term that carries material legal effect, the output must halt translation of that clause and route to escalation rather than silently substituting an approximation.

## Out of Scope

This skill does NOT cover:

- **Certified, sworn, or official translations** for court filing, apostille, immigration submission, or any official use that requires a credentialed translator's affidavit. Route to a sworn/official translator in the relevant jurisdiction.
- **Apostilled documents** where the translation must itself be re-apostilled or where the apostille's integrity depends on translation provenance.
- **Jurisdictions with statutory restrictions on AI-translated legal instruments**, including any jurisdiction that bars machine-assisted translation of court filings or notarial instruments. The user must confirm the target jurisdiction does not impose such restrictions.
- **Any document where the user cannot identify a bilingual reviewer** in the target jurisdiction. Without an accountable reviewer, the skill should not produce a final-form output.
- **Substantive legal advice** on the enforceability, validity, or interpretation of the source or translated document.

## Escalation

Stop and ask the user (or route to the responsible lawyer) when:

- Document type cannot be identified from the source.
- Source jurisdiction OR target jurisdiction is unclear or unstated. Do not proceed with assumed jurisdiction.
- The document contains untranslatable terms of art with material legal effect (L-band clauses).
- The request is for a certified/sworn output, an apostilled translation, or a translation intended for court filing in a jurisdiction with AI-translation restrictions.
- The source material appears privileged or work-product and the user has not confirmed the AI service and bilingual reviewer sit within the privilege circle.
- There is a conflict between the source jurisdiction in the document header and the parties' addresses or the governing-law clause.
- The user cannot name the bilingual reviewer who will sign off on the final translation.

This skill is the international extension of **Modern Jurist** — a legal translation
app originally built for the Indian legal ecosystem (English ↔ Hindi, Marathi, Gujarati,
Kannada), which reached an advanced stage of development and was recognised for its
approach of translating legal *intent and effect*, not just words. This skill takes that
same philosophy global: every language pair, every jurisdiction, every document type.


The goal is not to produce a translation. The goal is to produce a document that
has the same legal effect, the same intent, the same enforceability, and the same
professional authority as the original — in a different language.

---

## The Four Layers of Legal Translation

Every legal translation must work at all four layers simultaneously:

1. **Linguistic** — correct grammar, syntax, vocabulary in target language
2. **Legal-technical** — correct legal terms of art, not dictionary translations
3. **Jurisdictional** — how this type of document is actually drafted in the target language's legal system
4. **Pragmatic** — does this read like it was drafted natively? Would a lawyer in the target jurisdiction trust this document?

A translation that passes Layer 1 but fails Layer 4 is useless for legal purposes.

---

## Step-by-Step Workflow

### Step 1 — Intake and Analysis

Before translating a single word, analyze the document:

**Identify:**
- Source language and jurisdiction (e.g., English/Indian law vs English/UK law — different conventions)
- Target language and jurisdiction
- Document type (see Document Type Library below)
- Parties and their roles
- All defined terms (these must be translated consistently throughout)
- Special clauses: arbitration, governing law, force majeure, indemnity, liability caps
- Dates, reference numbers, amounts — note all of these; they must not change

**Read the right reference file:**
- For target language conventions → `references/legal-language-conventions.md`
- For document-type patterns → `references/document-type-library.md`
- For legal terms across languages → `references/legal-glossary.md`

**State your intake findings** briefly before translating, e.g.:
> *"Detected: English lease agreement (Indian jurisdiction) → Hindi. Parties: Landlord / Tenant. Defined terms: 8. Special clauses: arbitration, notice period."*

### Step 2 — Pre-Translation Glossary Build

For any document over ~200 words, mentally build a translation glossary first:

1. List all defined terms in the source document
2. Assign their target-language equivalents (consistently)
3. Note any terms with no direct equivalent in the target legal system
4. Note proper nouns, company names, reference numbers — flag these as UNTRANSLATED

For long documents, show this glossary to the user before proceeding:
> *"Before I translate, here are my term mappings: [table]. Does this look right?"*

This is the single most important quality step. Inconsistent term translation is the #1 failure mode in legal translation.

### Step 3 — Translate with Legal-Jurisdictional Awareness

**The golden rule:** Translate legal *effect*, not legal *words*.

Apply these rules without exception:

#### Structure
- Preserve ALL structural elements: clause numbering (1.1, 1.1.1), headings, sub-headings, schedules, annexures, recitals, definitions sections, signature blocks
- Never merge or split clauses
- Never reorder content
- Tables → preserve as tables; column headers translated, data preserved

#### Legal Language Conventions
- Use the traditional formal opening for this document type in the target language (see `references/document-type-library.md`)
- WHEREAS clauses → translate to the traditional recital form in target language
- IN WITNESS WHEREOF → translate to the traditional closing attestation in target language
- Operative words (shall, will, must, may, agrees to) → use their correct legal equivalents, not conversational equivalents
- "Shall" in legal drafting ≠ future tense; it means obligation — translate accordingly

#### Defined Terms
- Once a term is defined (e.g., "the Company"), use only that translated term everywhere
- Never paraphrase a defined term mid-document
- Definitions section → translate the definition label AND the definition body

#### Proper Nouns — STRICT RULE
- Party names (people, companies) → NEVER translate, NEVER transliterate unless specifically requested
- Place names → keep in original, add transliteration in parentheses on first use if target uses a different script
- Reference numbers, case numbers, registration numbers → NEVER change

#### Dates and Numbers — STRICT RULE
- Dates: preserve in original format; optionally add local format in parentheses
- Currency: preserve symbol and amount exactly (₹50,000 stays ₹50,000)
- Percentages, fractions, measurements → never change

#### Operative vs Recital Language
- Recitals (WHEREAS) → descriptive, past/present tense, translate naturally
- Operative provisions (the actual obligations) → precise, use "shall/will/must" equivalents, no ambiguity
- Definitions → match the formality and precision of the source

### Step 4 — Transliteration (when requested or needed)

Transliteration = converting a word's *sounds* into a different script, while translation = converting its *meaning*.

**When to transliterate vs translate:**

| Scenario | Approach |
|----------|----------|
| Party name in a different script | Transliterate (e.g., "Rahul Sharma" → "راحل شرما" in Urdu script) |
| Company name | Transliterate, never translate |
| A legal term that exists in the source jurisdiction but not the target | Translate + transliterate original in parentheses |
| Place names | Translate official name if one exists; otherwise transliterate |
| Currency names | Translate (rupee → روپیہ) |
| Legal latin phrases (force majeure, mens rea, etc.) | Keep in Latin; add translated meaning in parentheses |

**Transliteration quality rules:**
- Use the most widely accepted romanization/script convention for the language pair
- For Devanagari ↔ Latin: use IAST standard for formal/academic; simplified phonetic for legal
- For Arabic ↔ Latin: use simplified ALA-LC for legal documents
- For Cyrillic ↔ Latin: use BGN/PCGN romanization
- For Chinese ↔ Latin: use Hanyu Pinyin with tone marks
- For Japanese ↔ Latin: use Modified Hepburn

Always mark transliterations clearly: *[transliteration]* or in italics

### Step 5 — Format and Present Output

**For inline text (pasted content, short extracts):**
Show the full translated text in a clean block. Follow with a brief notes section.

**For full documents:**
Present in this structure:
```
---
[DOCUMENT HEADER - translated]
---
[Full translated document body]
---
TRANSLATOR'S NOTES:
• [Any term with no direct equivalent and what was chosen]
• [Any ambiguity in source text]
• [Any cultural/legal concepts that may need local counsel's review]
• [Transliteration choices made]
---
```

**For file inputs (PDF/DOCX) → file outputs:**
- Read source file using pdf-reading skill or docx skill as appropriate
- Produce translated DOCX using the docx skill
- Preserve formatting: fonts, spacing, heading styles, tables
- For RTL languages (Arabic, Hebrew, Urdu, Persian): note to user that paragraph direction must be set RTL in Word

**For bilingual documents (side-by-side):**
Present in a two-column table: Original | Translation, clause by clause.
This is ideal for contracts where both parties want to see both languages.

### Step 6 — Translator's Notes

Always end with a short notes section covering:

1. **Untranslatable terms** — legal concepts that exist in one jurisdiction but not another (e.g., "stamp duty" has no equivalent in US law; "force majeure" has different scope under French vs English law)
2. **Jurisdictional gaps** — where the legal effect in the target jurisdiction may differ from the source
3. **Recommended review** — flag sections that a local lawyer in the target jurisdiction should review
4. **Transliteration key** — if any names/terms were transliterated, list them
5. **Certification note** — always include: *"This translation is a working legal draft. For court filing, official submission, or certified use, obtain certification from a sworn/official translator in the relevant jurisdiction."*

---

## File Handling

| Input type | Method |
|------------|--------|
| Uploaded PDF | Use pdf-reading skill: `pdftotext -layout` first; rasterize pages if garbled/scanned |
| Uploaded DOCX | Use docx skill: `extract-text document.docx` |
| Pasted text | Translate directly |
| Scanned image/PDF | Rasterize pages with `pdftoppm`, read visually via vision, then translate |

| Output type | Method |
|-------------|--------|
| Chat (default) | Present translated text in clean formatted block |
| DOCX output | Use docx skill to produce formatted Word document |
| Bilingual DOCX | Two-column table in DOCX via docx skill |
| PDF output | Use pdf skill |

---

## Document Type Library

Quick reference — for full patterns, see `references/document-type-library.md`.

| Document Type | Key Features to Preserve |
|---------------|--------------------------|
| Contract / Agreement | Definitions section, operative clauses, representations & warranties, governing law, dispute resolution |
| MoU / LoI | Non-binding language, intent clauses, exclusivity provisions |
| Affidavit | Solemn declaration language, deponent identity, court reference, jurat |
| Power of Attorney | Scope of authority, revocation terms, principal/agent designations |
| Will / Testament | Testator identity, beneficiary designations, executor appointment, revocation of prior wills |
| Lease / Tenancy Agreement | Property description, rental amounts, term, renewal, termination clauses |
| Court Order | Court identity, case reference, operative orders, compliance timelines, judge's authority |
| Legal Notice | Notice period, demand/action requested, consequences of non-compliance |
| Petition / Application | Court/authority addressed, relief sought, grounds, prayer clause |
| Corporate Resolution | Entity identity, quorum, resolution operative language, authorization |
| IP Assignment | IP description, consideration, warranty of ownership, assignment operative clause |
| Employment Contract | Designation, compensation, IP assignment, non-compete, termination |
| Arbitration Clause | Seat, rules, language, number of arbitrators |
| Immigration Document | Personal data fields, authority stamps, reference numbers |

---

## Supported Language Pairs

This skill handles **all language pairs**. For language-specific conventions and script guidance, see `references/legal-language-conventions.md`.

**Priority legal languages** (most common in international legal work):
- English ↔ Spanish, French, German, Portuguese, Italian, Dutch
- English ↔ Hindi, Marathi, Gujarati, Bengali, Tamil, Telugu, Urdu
- English ↔ Arabic (MSA), Hebrew, Turkish, Persian
- English ↔ Mandarin Chinese, Japanese, Korean
- English ↔ Russian, Ukrainian, Polish
- Any ↔ Any (not just English-based)

**Script awareness:**
- RTL scripts (Arabic, Hebrew, Urdu, Persian, Sindhi) → flag layout direction in output
- Devanagari (Hindi, Marathi, Sanskrit) → always native script unless user requests romanization
- CJK (Chinese, Japanese, Korean) → use appropriate character set; never mix Simplified/Traditional Chinese
- Latin-script languages with diacritics (French, German, Spanish, Polish, Vietnamese) → never drop accent marks

---

## Quality Checklist

Run this before presenting any translation:

- [ ] Document type correctly identified
- [ ] Source jurisdiction noted
- [ ] Target jurisdiction noted
- [ ] All defined terms translated consistently
- [ ] Proper nouns, names, company names untouched (or transliterated if requested)
- [ ] All dates, amounts, reference numbers unchanged
- [ ] Clause numbering and structure preserved
- [ ] Traditional document opening used for target language
- [ ] Traditional closing (attestation/witness clause) used for target language
- [ ] Operative words (shall/must/may) correctly rendered
- [ ] Transliterations marked clearly
- [ ] Translator's notes included
- [ ] Certification disclaimer included

---

## Reference Files

Read these when needed — do not load all at once:

- `references/legal-glossary.md` — ~80 core legal terms translated across 12 languages. Read for any specific term lookup or to verify your translation choices.
- `references/legal-language-conventions.md` — Document conventions, formal openings/closings, script rules, and jurisdiction notes for major legal languages.
- `references/document-type-library.md` — Full templates and structural patterns for 12 document types across languages.

---

## QA Remediation (LegalQuants, 2026-05)

This skill was QA-reviewed against the Legal Skill Design Framework on 2026-05-11. The original author (Arjun Singh Chouhan) retains attribution for the underlying skill, its four-layer model, the pre-translation glossary workflow, the document-type library, and the language-convention references. LegalQuants applied the following remediations without altering the substantive translation methodology:

- Added Audience and Work Shape (Accretive Judgment) — output framed as a draft for a bilingual reviewer, not a final-form instrument.
- Added Scope and Legal Use addressing the three mandatory legal failure modes: (i) legal advice vs. legal support, (ii) privilege implications for translations of privileged/work-product material, (iii) accountability gap (this skill does not produce certified or sworn translations).
- Added Confidence Bands (H/M/L) tied to terminology certainty in the target legal system, with explicit handling for L-band material-effect clauses.
- Added Out of Scope block carving out certified/sworn translations, apostilled documents, restricted jurisdictions, and any document without an identified bilingual reviewer.
- Added Escalation triggers as explicit halt-and-ask rules rather than buried in the translator's-notes step.
- Added version, last_reviewed, and last_reviewed_by frontmatter fields.

The technical workflow (Steps 1–6), document-type library, language-pair coverage, file handling, and reference-file structure are unchanged.