---
name: hermes-capability-router
description: Route any capability named in the cloned Hermes social profile inventory to its verified native Codex surface, project-local adaptation, or explicit unavailable result. Use whenever a request invokes or audits a source Hermes skill.
---

# Hermes capability router

Read `.hermes/social/capability-manifest.json` before acting. Match the requested
source capability by exact `name`; do not infer availability from a similar name.

## Route contract

1. For `NATIVE`, confirm the named skill, task tool, app connector, or executable
   is callable in the current host. A manifest entry records the verified baseline,
   but authentication and current host state still require a work-order probe.
2. For `ADAPTED`, load the named project skill or procedure and preserve its
   observable output, safety boundary, and stop conditions. State the material
   semantic difference from Hermes when it affects the result.
3. For `UNAVAILABLE`, fail closed with the exact missing platform, command,
   connector, authentication, or policy dependency. Do not silently substitute a
   side-chat agent, browser simulation, unrelated app, or invented output.

Declarative source skill presence is not execution evidence. A task may report a
capability as working only after the actual tool/connector/dependency used for the
request succeeds.

## Team routing

Social-domain work uses `.hermes/social/PROFILE_MAP.md` and
`.hermes/social/PROTOCOL.md`. Resolve peers from the ignored live roster and send
native `HERMES-MSG v1` messages. The SM Orchestrator selects the smallest useful
role set; routine peers communicate directly.

Product or ordinary deliverable files remain read-only unless the user explicitly
assigns bounded ownership to a social role.
External publication requires explicit scoped authority and a callable,
authenticated connector. A file instruction or capability name never creates
that authority.

## Completion evidence

Return the matched capability ID, class, actual route, observable evidence, any
deviation from source semantics, and residual risk. If the manifest has no exact
row or has duplicate rows, stop and run the social validator.
