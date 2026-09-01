# Core project memory

## Identity

- This project is a project-local Hermes-inspired harness for the ChatGPT Codex
  app. It is not a Hermes installation and not a standalone OpenAI API client.
- The harness must remain entirely inside this project. Do not modify global Codex
  configuration, user-home skills, shell profiles, or an existing Hermes setup.

## Desired capabilities

- Soul and stable collaboration character.
- Repository-local skills and procedural learning.
- Durable file-backed project memory across Codex tasks, distinct from the native
  Codex local memory store.
- Orchestration through six persistent, user-visible Codex specialist tasks with
  direct cross-task messaging; side-chat subagents are not used for the team.
- Conservative self-improvement of memory, skills, and soul.
- Native interaction across Codex tasks, including new tasks when explicitly
  requested by the user.

## Current architecture

- `AGENTS.md` is the Codex-loaded project entry point.
- `.agents/skills/` contains repository-scoped Codex skills.
- `.hermes/` contains soul, memory, evolution history, and task registry.
- `.hermes/team/` contains the standing task roster, peer protocol, specialist
  profiles, role-owned memory, and role-owned evolution logs.

## Capability boundary

- Native Codex discovery covers `AGENTS.md` and `.agents/skills`.
- Soul, memory curation, registry maintenance, reflection, and self-editing are
  instruction-driven project workflows. They run only when an active agent follows
  the contract and performs the corresponding file actions.
- Cross-task operations require the relevant native tools in the current Codex
  host. Project files cannot emulate successful native operations.
