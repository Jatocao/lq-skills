---
name: Stateless Case File Analyzer (Ralph Loop Edition)
triggers:
  - "scan case files"
---

# 🏛️ Agent: Stateless Case File Analyzer

⚠️ **Proof of concept.** This is an open-source demo showing how far agentic case file revision can be implemented efficiently. It is not a finished ready-to-use product.

| Attribute | Value |
| :--- | :--- |
| **Description** | Stateless, autonomous AI agent utilizing the R.A.L.P.H. pattern for adversarial and structured case file analysis. Runs parallel verification for factual claims, logic, and completeness across massive document directories. |
| **Author** | Attorney Dennis G. Jansen / J-Law.de |
| **Version** | 3.1.0 |
| **Jurisdiction** | Agnostic |
| **Last Reviewed** | 2026-05 |
| **Last Reviewed By** | - |
| **Tags** | legal-analysis, quality-control, multi-agent, verification, adversarial, certificate, ralph-loop |

## 🎯 What it does & What it doesn't do

**What it does:**
* **Granular Extraction:** Scans case files one by one in isolated executions, extracting facts, claims, and legal views into standardized XML metadata.
* **Context Preservation:** Uses the R.A.L.P.H. pattern (stateless disk-I/O loops) to prevent "Lost in the Middle" context degradation on massive case files.
* **Adversarial Synthesis:** Acts as a quality gate, reviewing fully prepared metadata across all files to synthesize a cohesive legal perspective and timeline.

**What it doesn't do:**
* **No Memory:** It does not remember past conversational context. If it is not written to `PRD.md` or a state file, it does not exist.
* **No Legal Advice:** It does not replace licensed human counsel. It is a structural decomposition and synthesis tool.
* **No Conversational Filler:** It does not chat. It reads instructions, executes a single task, writes to disk, and terminates.

## 📋 The 3-Step Execution Process

When triggered via `"scan case files"`, the agent orchestrator must execute the following sequence via the R.A.L.P.H. loop:

1. **Step 1: Granular Review & Metadata Extraction**
   Review each file individually. Create metadata, tags, and review results via the [Ralphing Skill](references/ralphing_skill.md), *unless* the existing review on the disk is already complete and sufficient. Output using the Individual Summary Template.
2. **Step 2: Perspective Analysis**
   Review the fully prepared review results and metadata from Step 1 across *all* files under a specific, user-defined legal perspective (e.g., procedural errors, substantive validity, evidentiary contradictions).
3. **Step 3: Holistic Synthesis**
   Synthesize the conclusion and results across all relevant files into a final case report, utilizing the Synthesis Template.

## 🗂️ System References

Initialize the workspace with the following reference modules:
* **[Configuration](references/configuration.md):** Model settings and workspace initialization.
* **[Definitions](references/definitions.md):** Strict guidelines for example for classifying Facts vs. Opinions.
* **[Ralphing Skill](references/ralphing_skill.md):** The bash orchestrator and execution loop mechanics.
* **[Templates](references/templates.md):** XML disk-write schemas for metadata and synthesis.
