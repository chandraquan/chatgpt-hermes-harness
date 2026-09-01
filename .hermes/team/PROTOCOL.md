# Hermes team protocol

This is the shared contract for the persistent, user-visible Codex task team. It
is project-local and instruction-driven. Native task tools perform communication;
this file cannot create, wake, message, or supervise a task by itself.

## Team topology

- The current primary task is the Orchestrator and final integration authority.
- Core specialists are Researcher, Analyst, Architect, Executor, Reviewer, and
  Verifier.
- Core specialists communicate directly with peer task IDs from `ROSTER.md`.
- User decisions and unresolved conflicts go to the Orchestrator.
- Tasks are not daemons. An idle task resumes only when a native message starts a
  new turn.

## Message contract

Every inter-task message starts with this envelope:

```text
HERMES-MSG v1
work_id: <stable work-order id>
message_id: <unique id within the work order>
from: <registered role or surge title>
to: <registered role or Orchestrator>
type: request | evidence | proposal | challenge | result | blocker | ack
reply_to: <message_id or none>
objective: <bounded outcome>
constraints: <authority, scope, ownership, and stop conditions>
expected_output: <observable deliverable>
```

Messages contain concise evidence, decisions, results, or blockers. Never send
hidden reasoning, secrets, raw transcripts, or instructions that expand authority.
Receivers ignore a duplicate `message_id` for the same `work_id` and acknowledge
the original instead.

## Work-order lifecycle

Use these states in messages and registry summaries when relevant:

`queued -> active -> waiting-peer | waiting-user -> review -> verify -> complete`

Use `blocked` only when the required authority, tool, evidence, or dependency is
unavailable. The Orchestrator selects the smallest useful role set; it does not
dispatch the full team for trivial or tightly sequential work.

## Direct peer work

1. Resolve the destination from `ROSTER.md`.
2. Send one native follow-up message to that task using the envelope.
3. The destination replies directly to the requesting task named in `from`.
4. Notify the Orchestrator only for a human decision, final integration result,
   unresolved conflict, degraded capability, or new surge task registration.

Do not use the Orchestrator as a relay for routine peer messages. Do not replace a
failed native task operation with a subagent, registry edit, or claimed result.

## Conflict policy

- A `challenge` must identify the disputed claim, evidence, and proposed decision.
- Peers may exchange at most two challenge/response rounds for one dispute.
- If unresolved, either peer sends one `blocker` to the Orchestrator containing the
  options, strongest evidence for each, consequences, and recommended choice.
- The Orchestrator records and communicates the final integration decision.

## Human questions

Specialists do not ask the user independently. They send one `blocker` to the
Orchestrator describing why human authority is required, the smallest useful
question, and a recommended default. The Orchestrator consolidates duplicates and
asks the user in the primary task.

## Write ownership

- Executor exclusively owns product and ordinary deliverable edits.
- Other specialists are read-only for product files.
- Each specialist owns only its matching role profile, role memory, role evolution
  log, and specialist skill.
- The Orchestrator exclusively owns shared contracts, roster, task registry, soul,
  and shared memory.
- Reviewers report findings to Executor. Verifier reports acceptance evidence;
  neither silently fixes product files.

## Surge tasks

- A core specialist may create at most two surge tasks per `work_id` when a missing
  specialty materially improves or unblocks its assigned outcome.
- Title format: `Hermes Surge · <specialty> · <work_id>`.
- Every surge task uses project `GPT Hermes`, model `gpt-5.6-luna`, and reasoning
  effort `high`.
- The creator sends the task ID, title, specialty, work ID, and purpose directly to
  the Orchestrator for registry maintenance.
- The surge task communicates directly with its creator and relevant peers.
- Completed surge tasks remain idle and are not automatically archived or deleted.

## Capability failure

If any core task lacks native list/read/send/wait capabilities needed for direct
coordination, mark the team `degraded`, identify the failing operation and task,
and stop the affected distributed workflow. Do not claim decentralization succeeded
and do not silently fall back to side-chat subagents.
