# ChatGPT Codex Hermes Harness

A project-local harness that gives ChatGPT Codex a persistent collaboration style,
file-backed memory, repository skills, self-improvement rules, and a decentralized
team of user-visible specialist tasks.

It does **not** install Hermes, call a separate agent runtime, or modify global
Codex configuration.

## Architecture

```text
AGENTS.md                         native project instruction entry point
.agents/skills/                  project-local Codex skills
.hermes/SOUL.md                  collaboration character
.hermes/memory/                  curated project memory
.hermes/team/PROTOCOL.md         direct cross-task message contract
.hermes/team/roles/              specialist behavior and ownership
.hermes/team/ROSTER.md           local native task address book (not committed)
.hermes/threads/REGISTRY.md      local live task registry (not committed)
```

The standing team consists of an Orchestrator plus Researcher, Analyst, Architect,
Executor, Reviewer, and Verifier. Specialist tasks use `gpt-5.6-luna` with
reasoning effort `high` and communicate directly through native Codex task
messages using `HERMES-MSG v1`.

## Install in a Codex project

Clone or copy this repository into the folder that should own the harness. Keep
the root `AGENTS.md` and `.agents/skills/` inside that project; do not install them
globally.

Create local runtime state from the sanitized templates:

```powershell
Copy-Item .hermes/team/ROSTER.example.md .hermes/team/ROSTER.md
Copy-Item .hermes/threads/REGISTRY.example.md .hermes/threads/REGISTRY.md
```

Then create the six native Codex tasks, place their exact IDs in `ROSTER.md`, and
run the handshake and validation described in `.hermes/team/PROTOCOL.md`.

## Safety and portability

- Generated exports, temporary files, secrets, and runtime task IDs are ignored.
- Only Executor may edit product files during distributed work.
- Other roles are read-only for product files and may evolve only their own
  project-local harness state.
- `.hermes` is instruction-driven file state, not a background daemon or native
  Codex memory engine.

See [HARNESS.md](HARNESS.md) for the capability boundary and operating guide.
