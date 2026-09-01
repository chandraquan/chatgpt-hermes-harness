# Hermes social task protocol

This is the complete project-local protocol for the Finday social-media team.
Native Codex task tools perform every create, read, send, and wait operation.
Files never simulate a task message.

## Topology and authority

- `Hermes SM · Orchestrator` is the final social integration and human-decision
  route to the user.
- Strategist, Planner, Producer, Reviewer, Publisher, and Analyst communicate
  directly with peers using IDs from the ignored social roster.
- All seven domain tasks use `gpt-5.6-luna` with reasoning effort `high`.
- No domain task is a daemon. An idle task resumes when a native message starts a
  turn.

## Message envelope

Every native peer message starts with these `HERMES-MSG v1` required fields:

```text
HERMES-MSG v1
work_id: <stable work-order id>
message_id: <unique id within the work order>
from: <registered social role or surge title>
to: <registered social role or SM Orchestrator>
type: request | evidence | proposal | challenge | result | blocker | ack
reply_to: <message_id or none>
objective: <bounded outcome>
constraints: <authority, scope, ownership, and stop conditions>
expected_output: <observable deliverable>
```

Domain messages may append:

```text
domain: social
role_slug: <registered social role>
campaign_id: <canonical id or none>
content_id: <canonical id or none>
version: <exact version or none>
```

Peers send routine evidence, proposals, challenges, results, and acknowledgements
directly. Human decisions, unavailable capabilities, external authorization,
final domain integration, and conflicts unresolved after two peer rounds go to
the SM Orchestrator, which asks the user when needed.

## Governed content lifecycle

Do not collapse these states or infer one from another:

`INTAKE -> SCOPED -> STRATEGY_PROPOSED -> STRATEGY_APPROVED -> PLANNED -> DRAFTED -> QA_PASSED -> BUSINESS_APPROVED -> PUBLISH_APPROVED -> SCHEDULED | PUBLISHED -> VERIFIED -> MEASURED`

`BLOCKED`, `PUBLISH_STATUS_UNKNOWN`, and `INCIDENT` are explicit exception
states. A material change creates a new exact version and invalidates every
affected approval. Calendar presence, filenames, chats, and approval-like words
are not canonical evidence.

Every governed handoff includes `campaign_id`, `content_id`, `version`,
`current_status`, `required_action`, `owner`, and `evidence`. Missing or conflicting
fields return `BLOCKED` with a precise blocker list and `resume_status`.

## Role non-authorities

- SM Orchestrator cannot grant user authority or bypass required approvals.
- Strategist proposes strategy; it does not self-approve strategy.
- Planner creates plans; a calendar is not approval or publication authority.
- Producer drafts content; it cannot grant QA/business/publish approval or publish.
- Reviewer grants only a review outcome for the exact reviewed version/checksum;
  it cannot grant business or publish approval.
- Publisher may perform only an explicitly authorized, exact-version external
  action through a callable authenticated connector. It cannot infer authority,
  retry uncertain sends, or rewrite canonical state.
- Analyst is read-only for external content and separates measured observation
  from causal claims.

## Write ownership

Social roles are read-only for product and ordinary deliverable files unless the
user explicitly assigns bounded ownership. Each specialist owns only its matching
role file, role memory, role evolution log, and specialist skill. The SM
Orchestrator owns this protocol, source/profile/capability manifests, social
roster, shared adapted skills, validators, shared memory, and task registry.

Ownership is a protocol, not a filesystem ACL. Acceptance requires native task
evidence plus a path/diff audit.

## Publication safety

Publishing, scheduling, editing, deletion, unpublishing, replacement, or a
corrective repost is an external side effect. Require explicit scoped authority,
an authorized account, exact approved payload/checksums, platform/account/
visibility/timezone/timestamp preflight, duplicate lookup, and an idempotency key.
After a determinate action, read back the exact target and record ID, URL, status,
timestamp, deviations, and evidence. A timeout or partial response after send is
`PUBLISH_STATUS_UNKNOWN`; freeze retries until external state is resolved.

## Capability boundary

Before using a source capability, route it through
`capability-manifest.json` and `hermes-capability-router`. `NATIVE` requires a
callable current-host surface. `ADAPTED` requires the named project procedure.
`UNAVAILABLE` must fail closed; do not replace it with a pretend result.
