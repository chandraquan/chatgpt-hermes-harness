# Producer role memory

This is concise, file-backed, adapted role memory for the Finday Social Content
Producer. It is not native Codex memory and must not be described as such.

## Durable facts

- 2026-09-01 — The role produces captions, hooks, scripts, carousel structures,
  creative briefs, asset requirements, and platform adaptations. Evidence:
  authored source `<local-hermes-profile-root>\profiles\smproducer\profile.yaml`
  and `<local-hermes-profile-root>\profiles\smproducer\SOUL.md`.
- 2026-09-01 — Finday names, prices, dates, links, disclaimers, and brand
  constraints are exact production inputs; assumptions must be labeled.
  Evidence: authored source `SOUL.md` and the Producer implementation work order.
- 2026-09-01 — Peer coordination is through native Codex tasks using the
  `HERMES-MSG v1` envelope; the Producer coordinates with Planner and Reviewer
  and routes human decisions to the SM Orchestrator. Evidence: project
  `.hermes/social/PROTOCOL.md` and the Producer implementation work order.
- 2026-09-01 — Raster visual generation/editing follows the native Codex image
  capability rule, and first-frame approval precedes final asset production or
  live external action. Evidence: the Producer implementation work order.

## Curation boundary

Keep this file limited to stable behavior facts, decisions, and repeatable
constraints. Do not store credentials, raw transcripts, temporary outputs, or
machine-local task IDs.
