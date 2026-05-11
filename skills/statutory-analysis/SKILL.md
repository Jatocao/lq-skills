---
name: statutory-analysis
description: Guide for reading, interpreting, and applying statutes, regulations, and rules in legal and compliance contexts.
author: Rafal Stanislaw Fryc
jurisdiction: US
version: 1.0.0
last_reviewed: 2026-05
last_reviewed_by: LegalQuants (QA remediation)
tags: [statutory-analysis, legal-research, compliance]
---

# Statutory Analysis Skill

## When to Use

- Analyzing a new statute or regulation for the first time
- Determining which jurisdiction's laws apply to a given set of facts
- Mapping statutory obligations to client activities
- Tracing amendments through multiple versions of a statute
- Preparing compliance checklists from regulatory text

## Audience and Work Shape

Audience: Junior associates, compliance analysts, and paralegals conducting first-pass statutory reading under attorney supervision. Outputs must be reviewed by a qualified lawyer in the relevant jurisdiction before any client-facing use, filing, or reliance.

Work shape: Accretive Judgment. Claude structures the read of the statute (elements, definitions, obligations, exceptions, enforcement) so the lawyer can interpret faster. The lawyer owns the interpretation, the choice between competing readings, and the final conclusion. The skill produces *framework support*, not the interpretation itself.

## Scope and Legal Use

Statutory interpretation is jurisdiction-specific and is core legal-advice territory. This skill provides legal *support*, not legal advice. A populated framework means "the text has been parsed into elements, definitions, obligations, exceptions, and enforcement hooks" — not "this is what the statute means," not "this is how a court will read it," and not "this is the controlling rule for your facts."

**Current-rule verification required before reliance.** Statutes change. Definitions are amended, provisions are repealed, agencies issue new interpretive guidance, and courts gloss operative terms. Before any output of this skill is relied on, the lawyer must confirm the statutory text is current as of the relevant decision date, in the relevant jurisdiction, and that no superseding regulation, agency interpretation, or case-law construction displaces the text-based reading.

**Three legal failure modes this skill is structured against:**

1. **Framework confused with advice.** The structured output (mandatory / prohibited / permissive / enforcement) reads like a conclusion. It is not. It is a parsed reading of the text. The lawyer must verify the text is current, apply the canons appropriate to the jurisdiction, weigh ambiguities, and produce the actual interpretation. Do not present this skill's output to a client as a legal position.
2. **Privilege and work-product treatment.** Outputs of this skill, where prepared in anticipation of litigation or to advise a client, may be protected work product or privileged. They may equally fail to be privileged if produced outside attorney direction. Treat outputs as draft material under attorney supervision; do not circulate as a standalone memo, do not paste into shared channels, and do not attach to client deliverables without the supervising lawyer's review of privilege posture.
3. **Accountability gap.** A named, qualified lawyer in the relevant jurisdiction must own the final statutory interpretation, sign the memo or advice that results, and bear professional responsibility for the conclusion. The skill does not provide that ownership and must not be cited as the source of the interpretation.

## Confidence Bands

- **High** — operative text is unambiguous, defined terms are exhaustively defined within the statute, no cross-references to undefined external terms, no apparent conflict with other provisions in the same act, effective date and current version verified.
- **Medium** — text is workable but contains cross-references to terms defined elsewhere, includes inclusive ("includes") rather than exclusive ("means") definitions, has interpretive gaps that prior agency guidance or case law would normally fill, or the version date could not be independently verified. Flag for lawyer review before any reliance.
- **Low / Review** — operative terms are undefined or contested, two provisions appear to conflict, the provision is silent on the user's fact pattern, an applicable canon of construction is itself contested, the question implicates constitutional or treaty interpretation, or the statute has been recently amended and the operative version is uncertain. Do not present a framework reading as if it resolved the question; route to the lawyer.

## How It Works

### Step 1: Identify the Governing Statute

Start by identifying the primary statute. Determine:
- Jurisdiction (federal, state, territory)
- Enabling legislation or parent statute
- Delegated authority (regulations, rules, guidance)

### Step 2: Extract Key Elements

For each relevant provision, extract:
- **Who** is subject to the obligation (defined terms)
- **What** is required or prohibited (operative language)
- **When** does it take effect (effective date, grace periods)
- **Where** does it apply (geographic scope, extraterritorial reach)
- **Why** does it exist (stated purpose, legislative history if relevant)

### Step 3: Map Definitions

Statutes rely heavily on defined terms. Extract all definitions early:
- Look for "means" vs "includes" distinction (exclusive vs inclusive definitions)
- Check for cross-references to other definitions
- Note defined terms used outside the definitions section

### Step 4: Identify Obligations

Classify each obligation as:
- **Mandatory** ("shall", "must", "is required to")
- **Prohibited** ("shall not", "must not", "may not")
- **Permissive** ("may", "is permitted to")
- **Administrative** ("shall prescribe", "may by regulation")

### Step 5: Check for Exceptions

- Explicit exceptions (carve-outs in the statute)
- Defenses and safe harbors
- Exemptions by category
- Grandfathering provisions

### Step 6: Analyze Enforcement

- Civil penalties vs criminal sanctions
- Enforcement agency authority
- Private right of action
- Statute of limitations

## Examples

**Input:** A statute excerpt requiring data breach notification within 72 hours.

**Output:**
- Mandatory obligation ("shall notify")
- 72-hour window starts from discovery, not occurrence
- Applies to "covered entities" as defined elsewhere
- Exception for law enforcement requests
- Enforcement by [Agency]

## Out of Scope

- Case-law interpretation, judicial construction of statutory terms, and weighing of competing precedents.
- Constitutional interpretation, treaty interpretation, and supremacy/preemption analysis.
- Choice-of-law and conflict-of-laws disputes across jurisdictions.
- Agency rulemaking, notice-and-comment drafting, regulatory negotiation, or lobbying analysis.
- Drafting statutory or regulatory language for legislators or rulemakers.
- Multi-jurisdictional harmonization, comparative-law conclusions, and forum selection.
- Final compliance sign-off, regulatory filings, or any output presented to a client as legal advice.

## Escalation

Stop and route to the responsible lawyer when:

- the statute is silent on the user's fact pattern and resolution requires inference beyond the text;
- two provisions of the same act, or of a parent act and its regulations, appear to conflict;
- jurisdiction is unclear, contested, or implicates more than one sovereign;
- an operative term is undefined in the statute and is defined (or contested) in case law, agency interpretation, or industry practice;
- the effective date or operative version of the statute cannot be verified, or the statute has been amended within a period that may affect current rule status;
- the question turns on an interpretive canon that is itself contested (e.g., major-questions doctrine, rule of lenity, Chevron-style deference where doctrine is unsettled);
- the question implicates a constitutional issue, treaty obligation, preemption analysis, or supremacy question;
- the statute is criminal or quasi-criminal and the analysis would bear on liability;
- the user appears to be relying on the output as a legal conclusion rather than as a framework for the supervising lawyer.

## Limitations

- This skill provides a framework for analysis, not legal advice
- Statutory text alone may not capture agency interpretation
- Legislative history should be consulted for ambiguous provisions
- Always verify current version — statutes are frequently amended

## QA Remediation (LegalQuants, 2026-05)

Original skill by Rafal Stanislaw Fryc. LegalQuants ran this skill through the Legal Skill Design Framework QA (`legal-builder-hub:qa`) on 2026-05-11 (verdict: MATERIAL CONCERNS) and applied structural remediation only — technical content (the six-step framework, examples, and the author's analytical approach) is unchanged.

Changes:

- Added `version`, `last_reviewed`, and `last_reviewed_by` to frontmatter; preserved original `author`.
- Added **Audience and Work Shape** — names the audience (junior associates / compliance analysts / paralegals under supervision) and declares Accretive Judgment as the work shape.
- Added **Scope and Legal Use** — addresses the three legal failure modes (framework-vs-advice, privilege/work-product, accountability) structurally rather than as a one-line disclaimer; declares current-rule verification as a precondition to reliance.
- Added **Confidence Bands** — High / Medium / Low calibration tied to text unambiguity, definitional self-containment, version verification, and cross-reference posture.
- Added **Out of Scope** — case-law interpretation, constitutional/treaty interpretation, choice-of-law, agency rulemaking, drafting, multi-jurisdictional harmonization, and final compliance sign-off are excluded.
- Added **Escalation** — explicit halt-and-route triggers for silent provisions, conflicting provisions, undefined operative terms, version uncertainty, contested canons, constitutional/treaty implications, criminal exposure, and user reliance posture.

Original `## Limitations` retained verbatim. The six-step framework (Steps 1–6) and the Examples block are unchanged.
