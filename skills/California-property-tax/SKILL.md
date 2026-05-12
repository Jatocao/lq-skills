---
name: ca-prop-tax-research
description: California property tax research workflow using BOE Property Tax Rules (especially 462.* change in ownership, including 462.180 legal entities) and BOE published Property Tax Annotations (PTLG, commonly 220.*). Use when the user needs rule/annotation identification, synthesis, and application to a factual scenario involving change in ownership, trusts, or legal entities.
---

# California Property Tax Research (BOE Rules + PTLG Annotations)

## Scope
This skill produces a research-backed analysis for California property tax change-in-ownership issues by:
1) locating the relevant BOE Property Tax Rule(s), typically in the 462.* series;
2) locating and synthesizing relevant BOE published Property Tax Annotations (PTLG), often in the 220.* range; and
3) applying those authorities to the user’s facts via structured comparison.

Primary sources for this workflow:
- BOE Property Tax Rules (Title 18 CCR rules hosted as PDFs). Start point: https://boe.ca.gov/proptaxes/prop-tax-rules.htm
- BOE Property Taxes Law Guide (PTLG) Annotations index/table of contents. Start point: https://boe.ca.gov/lawguides/property/current/ptlg/annt/220-0000.html (for 220.* Change in Ownership)
- BOE links found in /references/boe-navigation-cheatsheet.md

## Operating principles
- Treat BOE Rules PDFs as the controlling articulation for this workflow; treat annotations as interpretive guidance and fact-pattern applications.
- Always capture the exact rule number, rule title, and a pinpoint reference (section/subdivision) when relying on a rule.
- For each annotation relied upon, extract: (a) key facts, (b) issue, (c) conclusion/result, (d) reasoning, and (e) what fact differences would plausibly change the outcome.
- Provide direct URLs for every rule PDF and every annotation page used.
- Do not invent rule text or annotation content. If source access fails, state “source unavailable” and proceed only with what is accessible.

## Inputs expected from the user
- Transaction / ownership structure (before and after), including entity types and ownership percentages.
- Property type and location (county is often relevant operationally even if BOE sources are statewide).
- Dates of transfers/events.
- Any trust terms relevant to control/beneficial ownership (if trust scenario).
- What outcome is being assessed (e.g., change in ownership, change in control, proportional interests, exclusions).

If inputs are missing, proceed by explicitly listing assumptions used to run the research and isolate the minimum additional facts that control the outcome.

## Step-by-step workflow

### Step 1 — Frame the research issue
Produce a one-paragraph “Issue framing” that identifies:
- suspected change-in-ownership trigger (e.g., transfer of fee interest, transfer to/from entity, change in control, cumulative transfers),
- likely rule family (e.g., 462.*),
- likely annotation family (often 220.*).

### Step 2 — Navigate to BOE Property Tax Rules and identify candidate rules
Primary navigation path:
1) Go to BOE Property Tax Rules landing page:
   - https://boe.ca.gov/proptaxes/prop-tax-rules.htm
2) Locate the 462.* series entries (Change in Ownership and New Construction) and shortlist rules by topic.

If the specific target is known (example: Rule 462.180):
- Open the rule PDF directly when available:
  - Example: https://boe.ca.gov/proptaxes/pdf/rules/Rule462_180.pdf

For each candidate rule:
- Record: rule number + title.
- Skim headings/subdivisions for the scenario match.
- Identify the smallest set of subdivisions that do the work (definitions, general rule, examples, special rules).

Deliverable after Step 2:
- A short list of candidate rules (usually 1–3) with URLs and the subdivisions likely controlling.

### Step 3 — Read the controlling rule(s) and extract “decision logic”
For each controlling rule:
- Extract a structured summary:
  - Rule purpose (1 sentence).
  - Operative test(s): the conditions that trigger change in ownership/change in control.
  - Key definitions used in the test.
  - Any explicit exceptions/exclusions described inside the rule.
  - Any examples inside the rule that resemble the facts.

Convert the above into a checklist or decision tree phrased in neutral, operational terms.

### Step 4 — Navigate to PTLG Annotations and identify relevant annotations
Primary navigation path:
1) Use the BOE “Laws, Regulations & Annotations” portal:
   - https://boe.ca.gov/lawguides/
2) Enter the Property Taxes Law Guide (PTLG) annotations section and navigate by number/topic.
3) For change in ownership, start with:
   - https://boe.ca.gov/lawguides/property/current/ptlg/annt/220-0000.html
   - Use “View entire section” when helpful for scanning.

Selection method:
- Prioritize annotations that:
  - cite the same rule number as the controlling rule (e.g., 462.180), or
  - address the same trigger mechanism (change in control, proportional interests, trusts, tiered entities), or
  - match a distinctive fact pattern (e.g., manager-managed conversion without ownership interest, tiered ownership, original co-owner concepts).

Deliverable after Step 4:
- A list of the most relevant annotations (target 3–8), each with a one-line reason for inclusion and URL.

### Step 5 — Extract each annotation into a reusable case-brief block
For every selected annotation, create a block with:
- Citation: annotation number + title (as shown on BOE page) + URL.
- Key facts (bullet list, only the legally salient facts).
- Issue question (1 sentence).
- Result (1 sentence).
- Reasoning (3–8 bullets, no filler).
- “Fact sensitivity”: list the 2–5 facts most likely to change the result.

### Step 6 — Apply to the user’s facts by comparison table
Create a comparison matrix:
- Columns: User facts | Annotation facts | Same/Different | Why it matters under the rule | Impact on likely outcome.
- Only include facts that map to the rule’s operative test.

Then synthesize:
- The best-fit annotation(s) and why.
- The limiting distinctions and how they likely move the outcome.

### Step 7 — Produce the final work product
Output format (default): refer to /references/output-template.md
1) Question Presented
2) Material Facts (as provided + stated assumptions)
3) Authorities
   - BOE Property Tax Rules: list rule number/title + URL + pinpoint subdivisions relied upon
   - PTLG Annotations: list annotation numbers + URLs
4) Analysis
   - Rule-based decision logic
   - Annotation synthesis
   - Application to facts
5) Conclusion (with confidence level and what fact(s) would flip it)
6) Sources (URLs only)

Quality control before finalizing:
- Confirm every authority used has a working URL.
- Confirm the rule PDF is the intended rule number (matches filename and header).
- Confirm annotation numbers are correct and not adjacent/near-miss.

## Notes on common targets
- Rule 462.* is the primary “change in ownership” cluster.
- Rule 462.180 is the primary “legal entities / change in control” rule and is often paired with 220.* change-in-ownership annotations when applying to factual patterns involving entities.