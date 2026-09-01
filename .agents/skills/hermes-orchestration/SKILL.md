---
name: hermes-orchestration
description: Coordinate complex project work through the persistent user-visible Hermes specialist tasks when two or more independent roles materially improve quality or speed. Do not use side-chat subagents.
---

# Hermes thread orchestration

Coordinate the persistent Codex task team without turning the Orchestrator into a
message relay. Read `.hermes/team/ROSTER.md` and `.hermes/team/PROTOCOL.md` first.

## Decide whether to delegate

Use the smallest useful set of roles. Stay single-task for small, sequential work.
Typical routing is Researcher for external evidence, Analyst for synthesis,
Architect for decision-complete design, Executor for edits, Reviewer for
independent findings, and Verifier for acceptance evidence.

Use native Codex task tools only. If direct task messaging is unavailable, mark
the team degraded and report it. Never substitute a side-chat subagent or pretend
a registry edit contacted a specialist.

## Dispatch

Send a `HERMES-MSG v1` work order containing a unique work and message ID,
objective, constraints, and expected output. Reuse core role tasks. Tell peers to
communicate directly using roster IDs and to return decisions or evidence rather
than hidden reasoning.

Only Executor may own product changes. Give it explicit file ownership and an
accepted brief. Reviewer reports findings without fixing them; Verifier tests the
result without taking over implementation.

A core specialist may create at most two Luna-high surge tasks for one work order.
It must send the created task ID to the Orchestrator for registration, but the
surge result returns directly to its requesting specialist.

## Integrate

Wait with bounded native task waits and inspect only the history needed for the
handoff. Allow two direct peer disagreement rounds; unresolved disagreement is a
`blocker` for the Orchestrator to decide. Human questions also route to the
Orchestrator.

The Orchestrator integrates evidence, decisions, implementation, review, and
verification. Do not report completion while a required lane is incomplete.
Record compact continuity in the registry, never full transcripts.
