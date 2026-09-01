# ChatGPT Codex Hermes Harness

A project-local harness that gives ChatGPT Codex a persistent collaboration style,
file-backed memory, repository skills, self-improvement rules, and a seven-profile
Finday social-media team.

It does **not** install Hermes, call a separate agent runtime, or modify global
Codex configuration.

## Architecture

```text
AGENTS.md                         native project instruction entry point
.agents/skills/                  project-local Codex skills
.hermes/SOUL.md                  collaboration character
.hermes/memory/                  curated project memory
.hermes/social/                  social role, protocol, memory, capability parity
.hermes/social/ROSTER.md         local social task address book (not committed)
.hermes/threads/REGISTRY.md      local live task registry (not committed)
```

The standing team consists of SM Orchestrator, Strategist, Planner, Producer,
Reviewer, Publisher, and Analyst. Tasks use `gpt-5.6-luna` with reasoning effort
`high` and communicate directly through native Codex task messages using
`HERMES-MSG v1`.

## Install in a Codex project

Clone or copy this repository into the folder that should own the harness. Keep
the root `AGENTS.md` and `.agents/skills/` inside that project; do not install them
globally.

Create local runtime state from the sanitized templates:

```powershell
Copy-Item .hermes/social/ROSTER.example.md .hermes/social/ROSTER.md
Copy-Item .hermes/threads/REGISTRY.example.md .hermes/threads/REGISTRY.md
```

For the social team, copy `.hermes/social/ROSTER.example.md` to the ignored
`ROSTER.md`, provision the seven exact titles from `PROFILE_MAP.md` with
`gpt-5.6-luna`/`high`, and run:

```powershell
& .hermes/social/validate-social-team.ps1 -RequireLiveRoster
```

The social compatibility manifest accounts for all 67 logical source
capabilities. Unsupported macOS apps, missing connectors/CLIs, and Hermes-only
runtime semantics remain explicit `UNAVAILABLE` entries instead of pretend
implementations.

## Safety and portability

- Generated exports, temporary files, secrets, and runtime task IDs are ignored.
- Social roles are read-only for product files unless the user assigns bounded
  ownership, and may evolve only their own
  project-local harness state.
- `.hermes` is instruction-driven file state, not a background daemon or native
  Codex memory engine.

See [HARNESS.md](HARNESS.md) for the capability boundary and operating guide.
