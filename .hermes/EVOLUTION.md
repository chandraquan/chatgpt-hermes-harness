# Harness evolution log

Every self-directed change to soul, memory structure, skill instructions, or
orchestration policy is recorded here. Ordinary project facts added to memory may
be grouped in the final response; structural or behavioral changes require a log
entry.

## 2026-09-01 — Initial project-local harness

- Component: whole harness
- Trigger: explicit user request for a Codex-local Hermes-like harness with soul,
  skills, memory, orchestration, self-improvement, and task interaction.
- Change: created the root instruction contract, soul, layered memory, evolution
  ledger, task registry, and repository-scoped skills.
- Evidence: originating user request and clarification.
- Validation: all paths are under this project; Codex-native discovery paths are
  `AGENTS.md` and `.agents/skills/*/SKILL.md`; no global Codex or Hermes config is
  used.
- Rollback: remove `AGENTS.md`, `.agents/`, `.hermes/`, and `HARNESS.md` from this
  project.

## 2026-09-01 — Capability-boundary hardening after recursive audit

- Component: root contract, harness documentation, memory model, orchestration and
  task-coordination skills.
- Trigger: explicit user request to verify whether the harness truly runs in the
  ChatGPT Codex app.
- Evidence: official OpenAI documentation confirms native discovery for
  `AGENTS.md` and `.agents/skills`, plus native subagent support; live app
  inspection confirms this folder is a saved local project, the four repository
  skills are discovered, and task-management tools are available. Documentation
  also shows native Codex memories are a separate store.
- Change: removed overclaims that soul, `.hermes` memory, and self-improvement are
  native or deterministic; clarified that they are instruction-driven file
  workflows; added tool-availability fallbacks; fixed ambiguous memory paths; and
  corrected restart guidance for `AGENTS.md` changes.
- Validation: rerun skill validation, recursive path checks, and instruction-budget
  checks after this edit.
- Rollback: revert this entry and the matching capability-boundary paragraphs, but
  doing so would restore misleading guarantees.

## 2026-09-01 — Persistent decentralized Codex task team

- Component: orchestration contract, task coordinator, team protocol, specialist
  roles and skills, role-owned memory/evolution, shared roster, and registry.
- Trigger: explicit user request to replace side-chat delegation with a persistent
  Orchestrator plus Researcher, Analyst, Architect, Executor, Reviewer, and
  Verifier tasks that communicate directly across Codex tasks.
- Evidence: six native local-project tasks were created with `gpt-5.6-luna` and
  effort `high`; every task acknowledged its exact roster and native task tools;
  the complete peer ring reached the Orchestrator; Researcher and Analyst completed
  two direct conflict rounds and escalated one blocker; the read-only work-order
  simulation returned a Verifier PASS.
- Change: superseded subagent-first team policy with selective persistent-task
  routing, `HERMES-MSG v1`, two-round conflict limits, Orchestrator human-decision
  routing, Executor-only product writes, role-local autonomous evolution, and at
  most two surge tasks per core role and work order.
- Validation: all ten project skills passed the skill validator; team validation
  passed with six unique registered task IDs; output metadata and NDJSON SHA-256
  remained unchanged during the work simulation; relevant global Codex config
  hashes were checked before and after.
- Rollback: stop messaging and archive the six core tasks if desired, restore the
  prior orchestration/task-coordinator instructions, and remove `.hermes/team/`
  plus the six `hermes-<role>` skills. Do not modify global Codex configuration.

## 2026-09-01 — Extend Glints extractor with CV phone enrichment

- Component: `.agents/skills/glints-job-applicant-extractor/SKILL.md`
- Trigger and evidence: explicit user workflow request; the verified workbook had
  59 `Get phone Number=true` rows, 51 extracted mobile numbers, 7 CVs without a
  readable number, and 1 CV access error.
- Change: added a reusable CV-enrichment mode that filters the flag, reads each
  `key` CV URL, normalizes mobile numbers to `628...`, preserves false rows, and
  leaves missing/error cases blank without guessing.
- Validation: final workbook verification confirmed 186 total rows, 59 true, 127
  false, 51 nonblank WhatsApp values, zero nonblank false rows, `AD` table range,
  and no formula errors; skill validator passed before this extension.
- Rollback: remove the `## CV phone enrichment` section from the skill; the
  network-only extraction behavior remains intact.
