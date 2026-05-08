---
name: sgcite
description: Use when verifying Singapore court citations in legal submissions, checking for hallucinated cases in AI-generated text, or validating citations against eLitigation.
author: Yu Chou Teo
jurisdiction: SG
tags: [citation, singapore, legal-research, hallucination-detection, elitigation]
---

# sgcite — Singapore Court Citation Checker

## When to Use

- Reviewing legal submissions before filing
- Checking AI-generated legal text for hallucinated citations
- Verifying that cited Singapore cases actually exist in eLitigation
- Detecting fabricated case names, paragraph references, or distorted quotations
- Routine citation audit for Singapore law documents

## How It Works

### Input

A legal text (submission, memo, brief, AI-generated draft) containing Singapore court citations.

### Process

1. **Extract** — Parse all case citations from the text
2. **Validate** — Query eLitigation (Singapore's case law database) for each citation
3. **Check** — Detect:
   - Hallucinated authorities (case doesn't exist)
   - Mismatched case names (case exists but different party names)
   - Fabricated paragraph references
   - Distorted quotations
4. **Report** — Flag each issue with specific location and explanation

### Output

```
✓ 5 citations verified
✗ 2 issues found:
  - [Para 23] "ABC v DEF [2023] SGHC 45" — Case not found in eLitigation
  - [Para 41] Quotation distorted — actual text differs from cited passage
```

## Example

```bash
npx sgcite check ./my-submission.docx
```

Or import as a library in your legal workflow tools.

## Limitations

- Only covers Singapore court decisions in eLitigation
- Does not verify substantive accuracy of cited holdings
- Some unreported decisions may not be available