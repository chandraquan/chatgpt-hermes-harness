# Social harness acceptance

Date: 2026-09-01

## Accepted scope

- Seven authored social profiles map to seven persistent Codex social tasks.
- All tasks use `gpt-5.6-luna` with reasoning effort `high`.
- The manifest accounts for 67 logical capabilities: 60 common capabilities
  represented by 420 source copies and seven profile-specific capabilities.
- Runtime claims are classified as `NATIVE`, `ADAPTED`, or `UNAVAILABLE`; an
  unavailable or uncallable route fails closed.

## Executed checks

- Source-aware validator against `<local-hermes-profile-root>`: PASS.
- Live ignored roster validation: PASS for exact seven role/title rows, unique
  IDs, model, effort, read-only product access, and ready status.
- Project skill validation: PASS for all 15 social specialist/shared skills.
- Manifest accounting: PASS; 67 unique capability IDs, names, and test IDs;
  exact common coverage and 4/2/1 unique profile mapping.
- Final class totals: 49 `ADAPTED`, 7 `NATIVE`, 11 `UNAVAILABLE`.
- Direct native task ring: PASS after replacing a degraded Publisher task that
  lacked native cross-task messaging; the degraded task remains idle and is not
  used for work.
- Role non-authority drills: PASS for all seven roles.
- Unique capability dry-runs C061-C067: PASS/fail-closed with no product or
  external side effects.
- Independent Reviewer and Analyst audits: PASS after correcting the Reviewer
  design-system path and the stale authenticated-`gh` claim.
- Git-candidate hygiene scan: PASS across 90 candidate files; no live task ID,
  machine-specific source root, legacy shared-drive root, credential pattern, or
  forbidden Hermes runtime/private file.
- `git diff --check`: PASS.
- Project-local SSH remote authentication: PASS via read-only remote HEAD lookup.

## Deliberate divergence

The source Producer procedure allowed raster normalization only when explicitly
authorized. A later explicit user instruction supersedes that detail: static and
carousel production uses only native `gpt-image-2`, approved logo/avatar/prompt
inputs, a 4:5 request, mandatory direct resize without crop to `1080x1350`, and
separate raw/final evidence. This is recorded as a user-directed evolution, not
as literal source parity.

## Honest runtime boundary

This is a Codex-native compatibility harness, not a Hermes runtime clone. It does
not claim isolated `HERMES_HOME` profiles, Hermes gateway/cron/Kanban/session DB,
profile credentials, plugin state, avatar runtime customization, or background
daemon behavior. GitHub repository fetch/push is adapted through project-local
SSH; GitHub CLI/API operations fail closed until a callable authenticated surface
exists.
