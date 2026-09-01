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

## 2026-09-01 — Seven-profile Hermes social compatibility layer

- Component: social task protocol, role identities, role memory/evolution,
  capability router and manifest, seven adapted source skills, project bootstrap,
  documentation, validation, runtime roster, and task registry.
- Trigger: explicit user request to replicate every agent under the local Hermes
  profile root and preserve its capabilities in the ChatGPT Codex way.
- Evidence: read-only inventory found seven authored profiles, 60 common logical
  skills, four Orchestrator-only skills, two Planner-only skills, one Producer-only
  skill, role-specific governance variants, and zero cron execution rows. The
  compatibility mapping classified runtime semantics as native, adapted, or
  unavailable Codex surfaces.
- Change: added seven Luna/high persistent social tasks, exact role behavior and
  non-authorities, decentralized native task messaging, governed social lifecycle,
  a 67-row compatibility manifest, fail-closed capability routing, sanitized
  source boundaries, and project-only validation.
- Safety: no Hermes installation/runtime call, global Codex edit, credential,
  raw memory, message, session, database, log, cache, lock, temporary helper,
  generated snapshot, or live task ID is committed.
- Validation: direct native ring, seven role non-authority drills, C061-C067
  capability dry-runs, source-aware 67-capability validator, all social skill
  validators, independent Reviewer/Analyst audits, and sanitized Git-candidate
  audit passed. GitHub push evidence is recorded in repository history.
- Rollback: stop messaging or archive the seven social tasks, remove
  `.hermes/social/` and the social/adapted project skills, and revert the matching
  `AGENTS.md`, documentation, memory, and registry entries. Do not modify global
  Codex or Hermes configuration.

## 2026-09-01 — Finday social-media-only harness

- Component: repository task topology, documentation, memory, skills, protocols,
  role ownership, and live-task registry.
- Trigger: explicit user instruction and confirmation to retain only the Finday
  social-media team in this repository.
- Change: removed non-social team artifacts and routes; made the social protocol
  self-contained; designated the SM Orchestrator as the social integration and
  user-decision route; retained fail-closed product-file and external-publication
  boundaries.
- Validation: recursive path/reference audit, skill validation, and repository
  diff review after the change.
- Rollback: restore the removed paths and matching references from the preceding
  Git revision only if the user explicitly reauthorizes a broader team.

## 2026-09-01 — Mandatory GPT Image 2 static/carousel raster route

- Component: shared native-raster, production, plan validation, planning, and
  orchestration procedures; SM Orchestrator role skill; durable decision record.
- Trigger: explicit user instruction, relayed through the primary work order, to
  supersede the adapted source's optional-resize detail for static and carousel
  production.
- Change: made native `gpt-image-2` the only static/carousel route; required a
  Finday logo, approved avatar/model, and approved prompt; required a 4:5 request,
  preserved raw output, direct raster resize without crop to `1080x1350`, and
  raw/final path, dimension, operation, and checksum evidence. Shared consumers
  now enforce the canonical procedure instead of creating alternate routes.
- Source-parity note: this is an intentional user override of source-derived
  behavior, recorded separately from claims of faithful source adaptation.
- Validation: skill syntax validation and source-aware social validator after the
  change; no product or external action.
- Rollback: restore the prior shared procedures and decision entry only with
  explicit user direction; doing so restores optional normalization behavior.
