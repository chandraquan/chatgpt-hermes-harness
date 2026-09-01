# GPT Hermes harness for Codex

This repository turns the Codex experience for this project into a
Hermes-inspired, evolving agent harness. It does not install Hermes, call a
separate model API, or change global Codex configuration.

## How it works

Codex automatically loads the root `AGENTS.md` for tasks opened in this project.
That file directs Codex to load a local soul and memory, use repository-scoped
skills, and coordinate a standing team of user-visible Codex tasks.

```text
AGENTS.md                         always-loaded project contract
.hermes/SOUL.md                   personality and collaboration style
.hermes/memory/                   durable, layered project memory
.hermes/threads/REGISTRY.md       compact cross-task coordination index
.hermes/team/                     team roster, protocol, roles, and role state
.hermes/EVOLUTION.md              audited self-improvement history
.agents/skills/                   Codex-discoverable repository skills
```

All of these paths are inside this project. There is intentionally no
`~/.codex/config.toml`, global `AGENTS.md`, global skill installation, daemon,
database, API key, or separate agent runtime.

## What is native and what is harness convention

| Layer | Status in Codex | What that means |
| --- | --- | --- |
| `AGENTS.md` | Native discovery | Codex reads it once when a run/task starts from this project. |
| `.agents/skills/*/SKILL.md` | Native discovery | Skills appear in Codex and load by explicit or matching invocation. |
| Codex tasks | Native, tool dependent | Creation, reading, messaging, waiting, and handoff require the corresponding app tools. |
| `.hermes/SOUL.md` | Instruction-driven file | Codex follows it because `AGENTS.md` says to read it; it is not a native personality slot. |
| `.hermes/memory/` | Instruction-driven files | Persistence comes from files surviving across tasks; this is separate from `/memories`. |
| Self-improvement | Instruction-driven workflow | Reflection and edits occur during an active task when evidence clears the policy threshold; there is no background learning daemon. |

The native entry points are reliable platform mechanisms. The `.hermes` layers are
best-effort agent behavior made inspectable and persistent through project files.
They can be audited and versioned, but they are not deterministic lifecycle hooks.

## Capabilities

- Soul: a distinct but safety-bounded personality requested on every task by
  `AGENTS.md`.
- Skills: reusable procedures discovered by Codex from `.agents/skills`.
- Memory: curated file-backed facts, decisions, preferences, and lessons across
  project tasks, separate from native Codex memories.
- Orchestration: six persistent specialist tasks with native direct task messages,
  selective dispatch, bounded conflict resolution, and Orchestrator synthesis.
- Self-improvement: conservative, logged in-task updates to memory, skills, and
  soul—not unattended background learning.
- Task coordination: native Codex task creation, reading, messaging, waiting,
  forking, handoff, and organization when the user places those tasks in scope.

## How to use it

Open a new Codex task in this project after these files exist. The new task will
load `AGENTS.md` at startup. Because project instructions are assembled once per
run, a new turn in an already-running task is not a reliable reload mechanism;
start a new task or restart the run after changing `AGENTS.md`. Skill edits are
usually detected automatically, but restart Codex if they do not appear.

Useful requests include:

- “Use the Hermes team to research, design, implement, review, and verify this.”
- “Remember this architectural decision for future tasks.”
- “Turn the workflow we just proved into a reusable local skill.”
- “Create a separate Codex task for the migration and coordinate with it.”
- “Review what the other task accomplished and continue from there.”
- “Refine your soul based on my last three corrections.”

## Standing team

The current primary task is the Orchestrator. The persistent specialist tasks are
Researcher, Analyst, Architect, Executor, Reviewer, and Verifier. Every specialist
uses `gpt-5.6-luna` with reasoning effort `high` and reads its task ID and peers
from `.hermes/team/ROSTER.md`.

Specialists communicate directly using native task messages. These messages are
user-visible and auditable; they are not hidden chain-of-thought. A task is not a
background daemon: it becomes active when a message starts or resumes a turn.

Because this local project is not a Git repository and all tasks share its folder,
only Executor owns product edits. Other roles are read-only for product files.
Each role may evolve only its own harness namespace; the Orchestrator remains the
single writer for shared contracts and registries.

## Evolution policy

The harness improves only from evidence. Memory can update after a durable fact or
decision. Skills can update after an explicit request, a proven repeatable
workflow, or a clearly diagnosed failure. Soul changes require explicit feedback
or a repeated stable preference. Every self-change is appended to
`.hermes/EVOLUTION.md`, including its evidence and validation.
