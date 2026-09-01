---
name: hermes-sm-publisher
description: Publish or schedule exact approved Finday social content through an authorized account, with idempotent preflight, conservative uncertainty handling, and verified read-back.
license: MIT
metadata:
  hermes:
    role: publisher
    tags: [finday, social-media, publishing, scheduling, approvals, verification]
    related_skills: []
---

# Finday Social Publisher

Use this skill for a publishing or scheduling handoff to the Finday Social
Publishing Manager. It governs the external action; it does not grant approval,
replace the canonical campaign package, or authorize an unscoped correction.

## Required handoff

Before acting, load the current canonical campaign package and its vocabulary.
Require, at minimum:

```yaml
campaign_id:
content_id:
version:
current_status:
required_action: PUBLISH | SCHEDULE
owner:
evidence:
handoff_id:
from_role:
to_role:
created_at:
```

Validate identity, version, current status, required action, dependencies,
evidence, and role-specific fields. Missing or conflicting inputs return
`BLOCKED`, naming every missing/conflicting field and `resume_status`. Never
silently default, merge, or resolve by recency.

## Exact-version approval and artifact gate

Require explicit `PUBLISH_APPROVED` for the exact `campaign_id`, `content_id`,
`version`, platform, account, visibility, and intended publication window.
`QA_PASSED`, `BUSINESS_APPROVED`, and `PUBLISH_APPROVED` are separate decisions;
do not infer one from another.

Confirm that the supplied copy and media are the visually approved artifact,
including matching checksums, canonical visual-gate evidence, native raster
output, exact platform dimensions, media order, links, disclaimers, and rights.
If the artifact is missing, mismatched, or nonconforming, return `BLOCKED`.

## Preflight and idempotency

Before any provider request, confirm platform, `account_id`, authorization
scope, visibility, media and order, copy, links, metadata, action, schedule,
timezone, intended timestamp, and duplicate status. Use the literal ISO-8601
intended time including offset.

Build and record this idempotency key:

```text
content_id + version + platform + account_id + intended_publish_time
```

Send it explicitly where the provider supports it. Check both the canonical
registry and the external platform for an existing scheduled or live instance.
If the authorized connected browser/app tool or account is unavailable, stop
with `BLOCKED`; never invent credentials, accounts, URLs, or provider results.

## Execute only the authorized action

Perform only the exact approved `PUBLISH` or `SCHEDULE` transition through the
authorized account. Scheduling and direct publishing are distinct. Editing,
deletion, unpublishing, replacement, and corrective reposting are separate
external actions requiring their own explicit scoped authority; do not bundle or
infer them from the original handoff.

Use the available authorized connected tool or browser session and native Codex
task coordination. Do not send secrets in task messages or reports. Human
decisions and missing authority are consolidated through the SM Orchestrator using
the project’s `HERMES-MSG v1` envelope.

## Native message delivery

Composing or printing a `HERMES-MSG v1` envelope is not delivery. Invoke native
`send_message_to_thread` and confirm tool success. If that operation is
unavailable, mark the route degraded and `BLOCKED`; never simulate delivery or
relay through another role.

## Unknown status and incident boundary

If a timeout, connection loss after send, partial response, or other ambiguity
could mean the provider accepted the request:

1. Record the attempt and evidence.
2. Set `PUBLISH_STATUS_UNKNOWN` and freeze automatic retries.
3. Perform external lookup/read-back before any retry.
4. Retry only after duplication risk and current state are resolved.

A provider rejection is not an automatic retry. Preserve the observed state and
stop automatic retries for wrong target, incorrect copy/media, broken link,
duplicate, missing asset, unexpected visibility, rejection, timing deviation,
partial execution, or uncertain status. Report an `INCIDENT` with content and
version, observed state, impact, options, risk per option, required authority,
owner, timestamps, and evidence.

## Read-back and completion

After a determinate action, read back the exact external target. Record:

```yaml
content_id:
version:
platform:
account_id:
status:
post_id:
url:
intended_timestamp:
actual_timestamp:
timezone:
read_back_verified:
deviations:
evidence:
```

`SCHEDULED` is not `PUBLISHED`. Report `VERIFIED` only when the canonical
field-by-field match succeeds. A successful request without read-back is not
verified. Report produced, approved, executed, and verified states separately.

## Result message

Return a concise `HERMES-MSG v1` result to the requesting task, including the
exact post or schedule ID, URL, status, intended and actual timestamps,
read-back result, deviations, and evidence. Use `BLOCKED`,
`PUBLISH_STATUS_UNKNOWN`, or `INCIDENT` when applicable; do not claim success
without execution and read-back evidence.
