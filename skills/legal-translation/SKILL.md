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
---

# Legal Translation Skill

**Beyond literal. Beyond generic. This is legal translation that thinks like a lawyer.**

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