# Sanitized Hermes source inventory

Snapshot date: 2026-09-01

The local source root was inspected read-only. Its machine-specific absolute path
is intentionally not committed here.

## Authored profiles

| Source profile | Identity files | Durable memory observed | Unique logical skills |
| --- | --- | --- | --- |
| `smorchestrator` | `profile.yaml`, `SOUL.md`, avatar | `MEMORY.md`, `USER.md` | 4 |
| `smstrategist` | `profile.yaml`, `SOUL.md`, avatar | none | 0 |
| `smplanner` | `profile.yaml`, `SOUL.md`, avatar | `USER.md` | 2 |
| `smproducer` | `profile.yaml`, `SOUL.md`, avatar | `MEMORY.md` | 1 |
| `smreviewer` | `profile.yaml`, `SOUL.md`, avatar | none | 0 |
| `smpublisher` | `profile.yaml`, `SOUL.md`, avatar | none | 0 |
| `smanalyst` | `profile.yaml`, `SOUL.md`, avatar | none | 0 |

All seven profiles declare `gpt-5.6-luna` through the Hermes Codex provider. Six
explicitly set high reasoning; Reviewer inherits an unspecified runtime default.
The Codex compatibility team intentionally provisions all seven at high effort.

## Logical skill accounting

- Common logical skills: 60.
- Physical common copies across seven profiles: 420.
- Orchestrator-only logical skills: 4.
- Planner-only logical skills: 2.
- Producer-only logical skills: 1.
- Total logical capabilities: 67.

`chief-social-media` and `finday-social-governance` are part of the common 60 but
have role-specific policy variants. They are represented by the shared protocol
and role overlays rather than counted again.

## Runtime findings

All seven profiles had cron execution stores, but every executions table had zero
rows at inspection. No schedule is imported. Source runtime slots are not proof of
an active job, connector, authenticated account, browser session, or permission.

## Excluded artifact classes

Credentials, `.env`, auth locks, raw memory, messages, sessions, DB/WAL/SHM,
logs, caches, locks, process metadata, temporary/helper scripts, generated
snapshots, and external identity assets are excluded from this repository.
