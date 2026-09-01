---
name: finday-social-plan-artifact-validation
description: Validate a Finday social plan and its downstream artifacts against exact campaign, content, version, status, visual-direction, dependency, approval, and handoff evidence before production proceeds.
---

# Finday social plan and artifact validation

Load these four portable canonical sources before inspecting or changing a plan:

- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\README.md`
- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\governance.md`
- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\references\transition-matrix.md`
- `<finday-shared-root>\Finday Ads\finday-social-design-system.md`

Also load the immutable predecessor workbook and handoff, exact strategy approval
record and stated checksum, and materialized registry records when provided. If
any canonical source is missing, stale, unreadable, or conflicting, return
`BLOCKED`; never reconstruct it from memory.

Preserve the predecessor artifact and checksum. Every material change creates a
new immutable path/version with a field-level change log and explicit approval-
invalidation effect. Never silently overwrite or repair the predecessor.

## Validation sequence

1. Reconcile `campaign_id`, `content_id`, `version`, current status, required
   action, owner, and evidence across the canonical record, calendar row,
   production packet, and handoff.
2. Require exact `STRATEGY_APPROVED` evidence before a plan is production-ready.
   QA, business, and publish approvals are different later gates.
3. Check platform, account dependency, visibility, intended ISO-8601 timestamp
   with offset, timezone, format, cadence, owners, dependencies, deadlines,
   checkpoints, acceptance criteria, and measurement window.
4. Validate every static/carousel `visual-direction` entry and every video
   first-frame entry. The proof brief and complete generation prompt remain
   separate. A carousel with N slides needs N independent complete prompts.
5. Reconcile dimensions, identity provenance, source facts, copy/claim/link/
   disclaimer fields, checksums, and file references. Inspect the actual rendered
   artifact when one is claimed. For a static post or carousel slide, require
   evidence that `finday-native-raster-production` was followed: `gpt-image-2`,
   approved logo and avatar/model inputs, preserved raw/final pair, direct
   raster-resize operation without crop, final `1080x1350`, and checksums.
6. Detect duplicates, stale versions, conflicts, defaults, missing fields, and
   approval scope changes. A material change routes to a new immutable version.
7. Repeat `INTERNAL_DRY_RUN`, `NOT_PUBLISHED`, and
   `NOT_APPLICABLE_INTERNAL_TEST` wherever applicable. They are explicit
   non-public boundaries, never external-action authority.
8. Require approval coverage for every workbook content ID and an exact strategy
   approval checksum. Reconcile format mix in a dedicated sheet; an unresolved
   mismatch stays `UNRESOLVED` and blocks the affected handoff.

## Version and workbook evidence

The version/change-log records predecessor path/checksum, new version, change
reason, approval evidence, and invalidated approvals. Each row materializes
`campaign_id`, `content_id`, `version`, `current_status`, platform, account,
visibility, schedule date, intended time with timezone/offset, owner,
dependencies, approval gates, measurement window, evidence, and external-action
authorization. Preserve existing rows/prompts unless a material change is
explicitly evidenced.

After saving, read the actual workbook back and compute—not merely declare:

- predecessor existence and unchanged checksum;
- exact version on every row, row count, continuous date range, status counts,
  and approved format counts;
- valid row-specific Visual Direction JSON and exact prompt count, including one
  independent prompt per carousel slide and the video first-frame gate;
- exact dimensions, scene, product proof, overlay copy, approved identity input,
  Style Block, and exclusions in every prompt;
- exact strategy checksum and approval coverage for every content ID;
- complete handoff identity/status/action/evidence and absence of external
  scheduling/publication state.

Report actual paths, counts, checksums, sheet/column evidence, and failures. A
workbook-wide value in an adjacent field does not satisfy a missing required
row field.

## Exact handoff

Each handoff includes `handoff_id`, `from_role`, `to_role`, `campaign_id`,
`content_id`, `version`, `current_status`, `required_action`, `owner`, `evidence`,
and `created_at`, plus platform, account, visibility, internal/public scope,
timezone, dependencies, approval gates, acceptance criteria, blockers,
deviations, and `resume_status`. An authorized internal pilot moves `PLANNED` to
`DRAFTED` through `produce_internal_draft`; external action remains false.

Return a structured `PASS` or `BLOCKED` report with each checked artifact,
evidence, deviation, exact required fix, next owner, and `resume_status`. A
calendar or checklist alone never proves production, approval, publication, or
verification.
