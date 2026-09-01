# Hermes social profile compatibility layer

This namespace adapts the seven authored social-media profiles found under the
user's local Hermes profile root to persistent, user-visible Codex tasks in this
project. It does not install, launch, or call Hermes.

## Compatibility promise

The target is **complete capability accounting with maximum observable parity**:

- every one of the 67 logical source skills has one manifest entry;
- an entry is `NATIVE`, `ADAPTED`, or `UNAVAILABLE` based on observable Codex
  behavior in this host;
- no source capability disappears silently;
- declarative skill presence never proves authentication or execution;
- unsupported Hermes runtime behavior is kept as an explicit negative test.

This is not a byte-for-byte runtime clone. Codex tasks share one repository and
host. They do not receive independent `HERMES_HOME` directories, provider
credentials, state databases, gateway processes, cron stores, or rollback
managers.

## Source boundary

Only authored identity and procedure artifacts were used: `profile.yaml`,
`SOUL.md`, non-secret durable behavior facts, and role-specific skills. The
compatibility layer intentionally excludes `.env`, authentication material,
messages, sessions, databases and WAL/SHM files, logs, caches, locks, process
state, temporary helpers, generated snapshots, and raw private memory.

See `SOURCE_INVENTORY.md`, `PROFILE_MAP.md`, `PROTOCOL.md`,
`RUNTIME_PARITY.md`, and `capability-manifest.json` for the auditable contract.
