# redfern-schedule

Build and maintain a **Redfern Schedule** (the request-to-produce table used to organise document production in international arbitration) for the **requesting party**, the **producing party**, or the **tribunal**, from one shared artefact.

Author: **Alexios vdSK**, Member, LegalQuants. Jurisdiction: regime-aware (multi).

## When to use

- Draft requests to produce and run them against the IBA Rules (2020) Article 3.3 admissibility test.
- Respond to the other side's requests by mapping objections to the Article 9.2 grounds.
- Reply to objections entered against your requests.
- Prepare a clean, decision-ready schedule for the tribunal.
- Merge a returned schedule from the other side without losing column discipline.

Do **not** use it for court-disclosure litigation (CPR / US discovery), for a full document review over a corpus, or to predict whether an objection will win. It enforces form and flags weakness, and the legal calls stay with counsel.

## How it works

1. **Privilege gate.** It opens with a hard confidentiality warning and will not read schedule content until you confirm.
2. **Intake.** It asks for role, regime, round, whether any party is a State or state-owned, and the pleaded-issues list.
3. **Pipeline.** It runs each request through Article 3.3 (Gate A identification, Gate B relevance and materiality, Gate C possession), maps objections to Article 9.2, and surfaces a content-based Article 9.2(f) sensitivity prompt for State or state-owned parties (by what a document is, not by who owns the party).
4. **Output.** A Markdown schedule table plus an internal flags memo naming your own weak requests or non-colourable objections. The memo is privileged and never served.

Regimes supported: IBA 2020 (default), Prague 2018, ICC, LCIA, ICSID. See `reference/regimes.md`.

## Files

- `SKILL.md`: the skill.
- `reference/`: the Article 3.3 checklist, the Article 9.2 objection map, the regime guide, the schedule format and ID rules, the intake script, a separable issue matcher, and `CITATIONS.md` (every legal citation byte-verified against its official source).
- `examples/`: worked examples for the requesting, producing, and tribunal roles on one shared fact pattern (`gold-fact-pattern.md`).

## Limitations

- Output is a Markdown table. It does not generate Word or Excel files.
- It does not decide materiality or whether an objection will succeed, and it does not give enforceability or privilege opinions.
- It does not invent facts, issues, or citations beyond your inputs and the reference files.
- It is not a substitute for review by qualified arbitration counsel.

## Tested

Run end to end in a chat harness on a fictional investor-State dispute across all three roles: the privilege gate fires first, weak requests (a fishing-expedition sweep, a document the requesting party already holds, a non-party document routed to Article 3.9) are correctly flagged, and the Article 9.2(f) prompt fires only on genuinely governmental content, not on a state-owned party's ordinary commercial documents.

## Quality assurance

Run past Anthropic's `claude-for-legal` **skills-qa** framework (the thirteen-parameter Legal Skill Design Framework, the prompt-injection heuristic scan, and the three legal failure modes). Trust surface is clean (prompt-only: no hooks, no MCP, no network, no out-of-directory writes), and all three legal failure modes (legal advice versus support, privilege, accountability gap) are addressed. The QA findings were applied: the four freshness fields are declared in the frontmatter, and the audience, work shape, and confidence handling are stated above.
