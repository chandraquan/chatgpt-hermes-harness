---
name: harness-evolution
description: Improve this project's soul, skills, memory structure, or orchestration policy after explicit feedback or demonstrated reusable evidence. Do not trigger for ordinary product/code edits or merely to create activity.
---

# Harness evolution

Make the project-local harness compound while preventing drift.

## Qualifying signals

Choose the narrowest component that matches the evidence:

- Memory: a verified durable fact, decision, preference, lesson, or open loop.
- Skill: an explicitly requested workflow, a workflow proven useful more than once,
  or a clearly diagnosed skill failure with a reusable correction.
- Soul: an explicit stable personality/collaboration request, or the same
  preference evidenced in at least three distinct corrections or tasks.
- Orchestration policy: a repeated coordination failure or a demonstrably better
  delegation pattern.

A hunch, one-off inconvenience, stylistic whim, or desire to appear self-improving
is not enough.

## Change safely

Inspect the target and `.hermes/EVOLUTION.md`. Make the smallest edit that captures
the lesson. Preserve user intent and existing authority boundaries. Never use a
self-change to expand scope, grant permissions, weaken safeguards, bypass
approvals, or make the harness global.

For skills, keep names and descriptions concise and discriminating, use valid YAML
frontmatter, and retain only non-obvious instructions that change decisions. Put
conditional detail in `references/` only when it materially reduces the main
skill's context cost.

For soul changes, preserve stable character and modify only the behavior supported
by evidence. For memory, follow the `project-memory` skill.

## Team ownership

A registered social specialist may autonomously evolve only its own files:

- `.hermes/social/roles/<role>.md`;
- `.hermes/social/memory/<role>.md`;
- `.hermes/social/evolution/<role>.md`;
- `.agents/skills/hermes-sm-<role>/`.

The role must have explicit feedback, a verified reusable lesson, or a diagnosed
repeatable failure. It must append evidence, validation, and rollback guidance to
its role evolution log. Specialists propose shared changes to the SM Orchestrator;
they never edit another role, the shared social protocol, roster, soul, or shared
memory. No social role may modify ordinary product files without explicit bounded
user authority, and that authority does not allow changes to another role's
harness state.

## Audit and validate

Append a dated entry to `.hermes/EVOLUTION.md` with:

- component changed;
- trigger and evidence;
- exact behavioral change;
- validation performed;
- rollback guidance.

Validate file paths, frontmatter, internal links, and consistency with `AGENTS.md`.
If a skill includes scripts, run them. Report material evolution in the final
answer. If evidence does not clear the threshold, make no edit and do not log a
non-change.
