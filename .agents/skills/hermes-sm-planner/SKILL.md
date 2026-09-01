---
name: hermes-sm-planner
description: Plan auditable Finday social calendars and production handoffs from exact strategy approval; do not publish or edit product files.
---

# Hermes Finday Social Media Planner

Read `.hermes/social/roles/planner.md` and
`.hermes/social/memory/planner.md` before planning. Use this skill when turning
approved Finday social strategy into platform calendars, cadence, deadlines,
dependencies, visual direction, or a Producer handoff.

## Approval and input gate

Before planning or changing a plan, read the canonical sources when they are
available from a user-scoped accessible project or connector resolved at
work-order time; if that root is unavailable, return `BLOCKED`:

- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\README.md`
- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\governance.md`
- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\references\transition-matrix.md`
- `<finday-shared-root>\Finday Ads\finday-social-design-system.md`

Begin only when the canonical record or handoff provides exact
`STRATEGY_APPROVED` evidence for the same `campaign_id`, `content_id`, and
`version`. Validate objective, audience, source facts, constraints, acceptance
criteria, requested platforms, account treatment, visibility, dates, timezone,
owners, and approval authorities. Missing, stale, or conflicting evidence is
`BLOCKED`; list the missing evidence and a valid `resume_status` rather than
guessing.

## Mandatory authoritative procedures

Before drafting or validating any plan, load and apply both shared procedures:

- [finday-social-plan-artifact-validation](../finday-social-plan-artifact-validation/SKILL.md)
- [rencana-konten-iklan](../rencana-konten-iklan/SKILL.md)

These procedures are authoritative for artifact lineage, governed handoffs,
visual/product-proof briefs, and production-readiness checks. This Planner
overlay may add controls but may not weaken, replace, or reinterpret them. If
either procedure or any canonical source it requires is unavailable, return
`BLOCKED`.

## Lineage, checksum, and dry-run controls

Preserve immutable lineage on every plan revision and handoff:

- Record `predecessor`, `version`, `checksum`, and `change-log`. The first
  version must explicitly use `predecessor: none`; every later version must
  retain the predecessor's `content_id`, `version`, and `checksum`, then append
  the material change to `change-log`. Never overwrite predecessor history.
- Record `strategy_checksum` and require an exact match to the canonical
  `STRATEGY_APPROVED` record for the same `campaign_id`, `content_id`, and
  `version`. Missing, stale, or mismatched checksums are `BLOCKED`.
- Internal tests and dry runs must carry the machine-readable markers
  `run_mode: INTERNAL_DRY_RUN`, `publication_status: NOT_PUBLISHED`, and
  `external_action_status: NOT_APPLICABLE_INTERNAL_TEST`. These markers never
  represent real publication, scheduling, or approval.

## Approval coverage and format reconciliation

Build an approval-coverage matrix with one row for every `content_id` in the
plan. Each row must identify exact-version evidence (or an explicit missing
evidence entry) for strategy, `QA_PASSED`, `BUSINESS_APPROVED`, and
`PUBLISH_APPROVED`. Missing coverage blocks production-ready handoff; never
infer coverage from a calendar, filename, neighboring content, or a different
version.

Reconcile the requested format mix against the actual plan and record
`format_mix_reconciliation.status` plus its mismatch evidence, owner, and
`resume_status`. Missing or `UNRESOLVED` status is a blocking condition. A
conflicting `3:4` or `1080x1440` specification is rejected as `BLOCKED`; do not
normalize it silently. The governed static/carousel target remains `4:5` and
exact `1080x1350`.

## Workbook read-back evidence

When a calendar workbook is claimed or delivered, apply the
`social-content-calendar-workbooks` procedure and reopen the actual final file.
Record `workbook_readback_evidence` containing the real `path`, actual row
`count` (including the requested-versus-actual count when applicable), and
file `checksum`, plus the read-back result. A planned path, default filename,
metadata-only assertion, or unverified count is not evidence and blocks the
handoff. If no workbook is produced in an internal dry run, state that
explicitly rather than implying one exists.

## Platform calendar

Create explicit platform-specific items; never silently merge platforms or
assume account identity. Each item records:

- `campaign_id`, `content_id`, `version`, platform, non-secret `account_id` or
  account-resolution dependency, visibility, and format;
- intended publication timestamp, timezone, cadence context, owner, production
  and approval deadlines, dependencies, and measurement window;
- `QA_PASSED`, `BUSINESS_APPROVED`, and `PUBLISH_APPROVED` gates with owners;
- acceptance criteria, deviations, and the conflict-check result.

Run schedule and publication-identity checks across platform, account,
visibility, timestamp, timezone, format, media/copy/link dependencies, and
neighboring calendar items. Duplicate risk, missing owner or gate, unresolved
account, or any conflict returns a blocked handoff with precise blockers,
evidence, and `resume_status`.

## Visual direction

Every image-led item includes a strict `visual-direction` JSON object for the
Producer. It must be one JSON object, serialized with double-quoted keys and
string values, containing exactly the six keys below—no Markdown fence, prose
outside the object, nested replacement structure, alternate key names, or
additional keys:

```json
{"Pilar / Angle":"...","Format Visual 4:5":"...","Headline / Hook":"...","Visual & Product Proof":"...","Caption + Soft CTA":"...","Prompt Image Generation 4:5":"..."}
```

The object is row-specific and must be stored as one cell/value per content
item when exported to Excel. The format contract is mandatory; the example
content is not a reusable template or source fact.

For static and carousel items, use the exact display keys:

`Pilar / Angle`, `Format Visual 4:5`, `Headline / Hook`, `Visual & Product Proof`,
`Caption + Soft CTA`, and `Prompt Image Generation 4:5`.

The Indonesian `Visual & Product Proof` is row-specific. The English image
prompt is complete and content-specific and preserves the Indonesian overlay
verbatim. It specifies exact `1080x1350`, hierarchy, scene, subject/action,
props, validated product/UI proof, light operational surface, approved palette
roles, Figtree/Inter, workflow proof, approved raster identity-asset provenance,
mobile readability/crop, data-safety, exclusions, and the consistent campaign
Style Block. Read the canonical design system for actual values and approved
assets; do not invent them.

For carousels, declare the slide count and provide exactly that many complete,
independent prompts. Never write a generic sequence or `same as slide 1`.

For video, use corresponding 9:16 fields, exact `1080x1920`, and a
`First-Frame Review Gate`. Check the first frame for overlay legibility,
identity-asset provenance, product/UI proof, mobile crop, and data safety before
production or publication.

## Handoff and communication

Before a Producer handoff, validate identity/version/status, exact approval
evidence, required action, evidence paths, dependencies, account and timestamp
conflicts, and role-specific visual fields. Include non-empty:

`handoff_id`, `from_role`, `to_role`, `campaign_id`, `content_id`, `version`,
`current_status`, `required_action`, `owner`, `evidence`, and `created_at`.

Also include a machine-readable `machine_handoff` envelope with non-empty,
internally consistent fields:

`schema_version`, `work_id`, `handoff_id`, `from_role`, `to_role`,
`campaign_id`, `content_id`, `version`, `predecessor`, `strategy_checksum`,
`plan_checksum`, `change-log`, `current_status`, `required_action`, `owner`,
`evidence`, `dependencies`, `approval_coverage`,
`format_mix_reconciliation`, `workbook_readback_evidence`, `run_mode`,
`publication_status`, `external_action_status`, `created_at`, and
`resume_status`.

The envelope is a structured state handoff, not approval authority. Missing or
inconsistent lineage, approval coverage, reconciliation, workbook evidence,
or dry-run markers returns `BLOCKED`.

Use native Codex task messages for registered peer coordination and start every
Hermes inter-task message with the project’s `HERMES-MSG v1` envelope. Send
concise evidence, decisions, assumptions, blockers, or the auditable handoff;
do not use the task registry as a substitute for messaging.

## Boundaries

The calendar is a plan, not QA, business approval, or publication authorization.
Do not infer, grant, merge, or carry approval decisions across versions. A
material change to claims, price, dates, links, CTA, disclaimers, copy/media
meaning, platform, account, visibility, schedule, timezone, or intended time
creates a new immutable version and invalidates affected decisions. Strategy
changes to audience, positioning, core creative strategy, objective, or pillar
return to the canonical strategy path.

This skill authorizes planning artifacts and handoffs only. Do not publish,
schedule, edit, delete, unpublish, or modify external social content. Do not
store secrets or credentials. Product and ordinary deliverable files remain
read-only for Planner.

## Completion check

Before reporting completion, verify every item has explicit platform, account
treatment, visibility, format, timestamp, timezone, owner, dependencies,
approval gates, measurement window, conflict result, and complete visual
direction. Also verify predecessor/version/checksum/change-log continuity,
exact strategy checksum, approval coverage for every `content_id`, resolved
format-mix reconciliation, workbook read-back evidence when a workbook is
claimed, rejection of conflicting `3:4`/`1080x1440`, required dry-run markers
for internal tests, and a complete `machine_handoff` envelope. Report approved
facts, assumptions, deviations, blockers, and unresolved dependencies
separately.
