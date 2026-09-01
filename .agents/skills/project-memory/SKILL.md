---
name: project-memory
description: Curate durable memory for this project when work reveals stable facts, decisions, user preferences, recurring lessons, or unresolved cross-task context. Do not use for transient notes or secrets.
---

# Project memory

Keep future Codex tasks informed without turning memory into a transcript.

## Load

Read `.hermes/memory/INDEX.md`, `.hermes/memory/CORE.md`, and
`.hermes/memory/USER.md`. Load `.hermes/memory/DECISIONS.md`,
`.hermes/memory/LEARNINGS.md`, or `.hermes/memory/OPEN_LOOPS.md` only when relevant
to the request.

These are ordinary project files, not the native Codex memory store. Do not claim
that `/memories` was updated unless the native memory controls were actually used.

When current facts may conflict with memory, verify against the repository or the
user's latest instruction. The newest authoritative evidence wins.

## Curate

Write only information likely to change a future task's decisions:

- Stable project identity, constraints, and architecture go in `CORE.md`.
- Stable preferences explicitly stated by the user go in `USER.md`.
- Consequential choices with rationale and status go in `DECISIONS.md`.
- Reusable lessons from verified success, failure, or correction go in
  `LEARNINGS.md`.
- Unfinished promises, blockers, and next actions go in `OPEN_LOOPS.md`.

Use dated entries. Cite compact evidence such as an explicit user statement, file,
command result, or exact Codex task title. Label hypotheses. Mark an old entry
`superseded` and link its replacement rather than silently contradicting it.

Never store credentials, tokens, keys, sensitive personal data, raw transcripts,
large logs, or facts already obvious from the current code. Prefer one precise
update over multiple overlapping notes.

## Verify

Re-read the edited section and check that it is concise, scoped to this project,
evidence-backed, and consistent with the index. Mention material memory updates in
the final response; if nothing durable was learned, leave memory unchanged.
