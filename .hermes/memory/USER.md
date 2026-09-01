# Project user memory

## Stable preferences

- 2026-09-01 — The user wants Hermes-like behavior inside the ChatGPT Codex app,
  scoped only to this project. They explicitly do not want Hermes installed, do
  not want an existing Hermes configuration reused, and do not want global Codex
  configuration changed. Evidence: direct user clarification in the originating
  task.
- 2026-09-01 — The user wants the current task to act as Orchestrator with six
  persistent specialist Codex tasks. Specialists must use `gpt-5.6-luna` at
  `high`, communicate directly across user-visible tasks rather than side chats,
  and may create at most two bounded surge tasks per work order. Evidence: explicit
  team-design choices and implementation request in the originating task.
- 2026-09-01 — Human questions should be consolidated through the Orchestrator;
  peer communication remains decentralized. Completed surge tasks should remain
  idle rather than being automatically archived. Evidence: explicit user choices
  during team design.
