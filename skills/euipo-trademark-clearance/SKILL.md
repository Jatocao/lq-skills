---
name: euipo-trademark-clearance
description: Use when a user needs to check whether a proposed trademark is available for registration before the European Union Intellectual Property Office (EUIPO). Searches the official EUIPO trademark database in real time, identifies conflicting earlier marks, and produces a likelihood-of-confusion analysis under Art. 8.1.b EUTMR applying CJEU case law (SABEL, Lloyd Schuhfabrik, Canon). Outputs a risk report with a traffic-light rating (High / Medium / Low). Requires the EUIPO MCP connector.
author: Jatocao
jurisdiction: EU
tags: [trademark, euipo, clearance, likelihood-of-confusion, ip, eu-trademark, nice-classification]
version: 1.0.0
last_reviewed: 2026-06
lq_ai:
  title: EUIPO Trademark Clearance
  version: 1.0.0
  author: Jatocao
  tags: [trademark, euipo, clearance, likelihood-of-confusion, eu-trademark]
  jurisdiction: EU
  trigger_examples:
    - "Check if this trademark is available in the EU"
    - "Search for conflicts before we file at the EUIPO"
    - "Is there a risk of opposition for this mark?"
    - "Run a clearance search for this brand name"
    - "Check anterioridades for this trademark"
  inputs:
    required:
      - name: mark_name
        type: text
        description: The proposed trademark to be cleared (word mark or the verbal element of a mixed mark)
      - name: nice_classes
        type: text
        description: One or more Nice Classification class numbers (e.g., "25, 35") covering the goods/services
    optional:
      - name: goods_services_description
        type: text
        description: Description of the goods/services — helps assess identity or similarity with earlier marks
      - name: report_mode
        type: text
        description: "internal (default) or client — controls technical depth and language of the output"
  output_format: markdown
  self_improvement: false
---

# EUIPO Trademark Clearance

This skill performs a pre-filing clearance search against the official EUIPO trademark register and produces a likelihood-of-confusion (LoC) analysis under Art. 8.1.b of the EU Trade Mark Regulation (EUTMR 2017/1001). It applies the multi-factor test established by CJEU case law to assess the risk that an earlier mark would form the basis of a successful opposition.

All outputs are first-line analysis for attorney review. They do not constitute a registration opinion or legal advice.

> **Scope and Legal Use**
> This skill processes information that may relate to client matters and pending commercial decisions. Treat all outputs as privileged work product unless the supervising attorney has decided otherwise. The report is a draft for qualified-counsel review — it does not constitute a legal opinion, a guarantee of registrability, or advice to file or not file. Do not share with a client or counterparty until a named responsible attorney has reviewed and approved it.

---

## When this skill applies

Apply this skill when:
- A client wants to file an EUTM and needs a conflict check before investing in registration
- An attorney needs a rapid first-screen of the register before advising on filing risk
- A business is rebranding and wants to verify EU availability of the new name
- Pre-litigation clearance is needed to assess exposure to third-party claims

This skill covers the **EUTM register only** (EU-wide marks). It does not search national registers (OEPM Spain, UKIPO, INPI France, etc.). For comprehensive clearance, complement with national searches.

---

## Inputs

**Required:**
- `mark_name` — the proposed trademark. For word marks, provide the exact string. For mixed marks, provide the verbal element.
- `nice_classes` — the Nice Classification classes for the goods/services (e.g., "9, 42"). If the user has not specified classes, ask before searching.

**Optional:**
- `goods_services_description` — a description of the goods/services in plain language. Improves the similarity-of-goods analysis. If not provided, the analysis will rely on class headings.
- `report_mode` — `internal` (default) or `client`. Internal mode includes full legal citations, all conflicts found, and attorney-facing language. Client mode uses plain language, limits the conflict list to the 5-6 most relevant marks, and omits citation strings.

If `nice_classes` is missing, ask: *"Which Nice Classification classes cover the goods/services for this mark? If you are not sure, I can help classify them first."*

---

## Workflow

### Step 1 — Search the EUIPO register

Using the EUIPO MCP connector (`search_trademarks`), run the following searches against the EUIPO database:

1. **Identical search** — exact string match for `mark_name` in all requested classes
2. **Phonetic/visual similarity search** — partial string, prefix, and fuzzy matches to catch near-identical marks
3. **Filter by status** — include marks with status: `REGISTERED`, `APPLICATION_PUBLISHED`, `UNDER_EXAMINATION`, `OPPOSITION_PENDING`, `REGISTRATION_PENDING`. Exclude `EXPIRED`, `WITHDRAWN`, `CANCELLED`.

For each hit, collect: mark name, owner, filing date, registration date (if applicable), status, Nice classes, and goods/services description.

### Step 2 — Assess similarity of signs

For each potentially conflicting mark identified in Step 1, apply the three-part sign similarity assessment from SABEL v Puma (C-251/95):

**Visual similarity**
- Compare overall visual impression: length, structure, number of words, common letters/syllables
- Note dominant and distinctive elements; disregard purely descriptive or generic elements (Lloyd Schuhfabrik, C-342/97)

**Phonetic similarity**
- Compare pronunciation: stressed syllables, rhythm, endings
- Where the mark has no obvious phonetic rendering, note this

**Conceptual similarity**
- Does each mark carry a meaning? Are those meanings the same, similar, opposite, or unrelated?
- If one or both marks have no clear meaning, conceptual comparison is neutral

Rate each dimension: **high / medium / low / none**. An overall sign similarity rating is the weighted result — a high on any one dimension is rarely offset by a low on another (SABEL interdependence principle).

### Step 3 — Assess similarity of goods/services

For each conflict candidate, compare the goods/services in the conflicting mark against those in the proposed mark, applying the Canon factors (C-39/97):

- Nature and purpose of the goods/services
- Distribution channels and sales outlets
- Relevant consumer base
- Complementarity or competition between the goods/services
- Whether they are commonly produced or provided by the same undertaking

Rate each goods/services pair: **identical / highly similar / similar / low similarity / dissimilar**.

Marks in different Nice classes can still have similar goods/services — class numbers are not conclusive (Canon).

### Step 4 — Assess distinctiveness of the earlier mark

For each shortlisted conflict candidate:
- Is the earlier mark inherently distinctive (invented word, arbitrary) or weak (descriptive, laudatory, common in the trade)?
- Is there evidence of enhanced distinctiveness through use (market recognition, EUIPO decisions)?
- A mark with enhanced distinctiveness has wider protection — a more distant mark may still infringe (Lloyd Schuhfabrik enhanced distinctiveness principle)

Where distinctiveness cannot be determined from the register, note it as unknown and flag for further investigation.

### Step 5 — Global assessment

Apply the global assessment of likelihood of confusion, taking into account all relevant factors interdependently (SABEL, para. 22):

- A low degree of sign similarity can be offset by a high degree of goods/services similarity, and vice versa — but only to a point
- Enhanced distinctiveness of the earlier mark expands the scope of protection
- The relevant public's level of attention: higher for specialist/professional goods, lower for everyday consumer goods (Lloyd Schuhfabrik imperfect recollection test)
- In EU trademark law, the average consumer is deemed reasonably well-informed, attentive, and circumspect

For each conflict candidate, assign an overall LoC rating:
- 🔴 **High** — likelihood of confusion probable; opposition risk is real; filing not recommended without clearance strategy
- 🟡 **Medium** — likelihood of confusion possible; filing may proceed but monitor and prepare coexistence arguments
- 🟢 **Low** — likelihood of confusion unlikely; filing can proceed with standard due diligence

### Step 6 — Draft the report

Produce the report in the format specified in the **Output** section below. Use `internal` mode unless the user specified `client`.

---

## Output

### Internal mode (default)

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  EUIPO TRADEMARK CLEARANCE REPORT
  Mark: [MARK NAME]
  Classes: [NICE CLASSES]
  Date: [DATE]
  DRAFT — qualified counsel review required before use
  Reviewing attorney: ___________________________
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

OVERALL RISK: 🔴 HIGH / 🟡 MEDIUM / 🟢 LOW

EXECUTIVE SUMMARY
[2-3 sentences: number of conflicts found, overall risk level, key risk driver,
and recommendation]

CONFLICTS IDENTIFIED
[Table: Mark | Owner | Classes | Status | Sign similarity | G/S similarity | LoC rating]

DETAILED ANALYSIS — TOP CONFLICTS

[For each High/Medium conflict:]
## [Conflict Mark Name] — [Owner] — [Registration/Application number]
- Status: [status]
- Classes: [classes]
- Goods/services: [description]

**Sign similarity**
- Visual: [rating] — [reasoning]
- Phonetic: [rating] — [reasoning]
- Conceptual: [rating] — [reasoning]
- Overall: [rating]

**Goods/services similarity:** [rating] — [reasoning]

**Distinctiveness of earlier mark:** [inherent / enhanced / weak] — [reasoning]

**Likelihood of confusion:** [🔴/🟡/🟢] [rating]
[1-2 sentences applying the global assessment]

APPLICABLE CASE LAW
- SABEL v Puma (C-251/95) — global assessment; interdependence principle
- Lloyd Schuhfabrik Meyer (C-342/97) — imperfect recollection; enhanced distinctiveness
- Canon (C-39/97) — similarity of goods/services factors

RECOMMENDATION
[Clear recommendation: file / file with monitoring / do not file / seek coexistence]
[If filing risk exists: suggested mitigations — class limitation, design-around, letter of consent]

LIMITATIONS
This report searches the EUTM register only. National registers (OEPM, UKIPO, INPI, DPMA, etc.)
are not covered. For comprehensive clearance, national searches are required.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Client mode

Same structure but:
- Replace legal citations with plain-language equivalents
- Limit conflicts table to top 5-6 most relevant marks
- Replace technical LoC language with accessible risk descriptions
- Replace "Likelihood of confusion" with "Risk that this mark conflicts"
- Retain the DRAFT header and reviewer-of-record line

---

## Edge cases and refusals

- **No EUIPO connector available:** If the EUIPO MCP connector is not configured, explain that a live register search is not possible and offer to perform a conceptual analysis based on user-provided data only. Clearly mark the output as "no live search performed."
- **Mark is a device/figurative mark with no verbal element:** Explain that this skill analyses the verbal element. For pure figurative marks, a visual comparison requires the image — flag this to the user and proceed if an image description is provided.
- **Classes not specified:** Do not run the search. Ask for the classes first. A clearance search without defined classes has no analytical value.
- **Very broad goods/services (e.g., "all goods in class 9"):** Narrow the analysis to the core goods/services described. Flag that overbroad specifications increase conflict risk.
- **User asks for a filing opinion:** This skill assesses conflict risk. It does not give a filing opinion — that requires qualified counsel. Redirect accordingly.
- **Non-EU jurisdictions:** This skill covers EUTM only. For UK (post-Brexit), US, or other jurisdictions, a different search is required. Flag this clearly.

---

## Scope and Legal Use

This skill is intended for use by qualified IP professionals (trademark attorneys, patent attorneys, legal professionals) as a first-line clearance tool. All outputs are privileged work product unless the supervising attorney decides otherwise.

- Outputs should be treated as confidential and matter-specific
- The reviewer-of-record line must be completed by a named qualified attorney before any output is shared with a client or counterparty
- This skill does not constitute legal advice and does not create an attorney-client relationship
- Filing decisions must be made by a qualified attorney taking into account all relevant factors
- EUIPO database coverage: marks with status REGISTERED, APPLICATION_PUBLISHED, UNDER_EXAMINATION, OPPOSITION_PENDING, REGISTRATION_PENDING. Expired, withdrawn, and cancelled marks are excluded from the default search but may be relevant for cancellation proceedings — flag this if the user raises prior use claims.
