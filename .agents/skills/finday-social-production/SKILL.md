---
name: finday-social-production
description: Produce auditable Finday social content packets and media handoffs from an exact approved plan, enforcing native-raster identity, dimensions, first-frame video approval, provenance, and lifecycle separation.
---

# Finday social production adaptation

Before production, load the canonical package from these portable project-relative
locations:

- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\README.md`
- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\governance.md`
- `<finday-shared-root>\Finday Ads\social-media-orchestration-system\references\transition-matrix.md`
- `<finday-shared-root>\Finday Ads\finday-social-design-system.md`

Resolve `<finday-shared-root>` only from a user-scoped accessible project or
authorized connector. If any canonical source is missing, inaccessible, stale,
or conflicts with another source, return `BLOCKED` with the missing/conflicting
evidence and a valid `resume_status`. Do not invent a substitute lifecycle.

Use only an exact, evidence-backed upstream approval for the same campaign ID,
content ID, and version. Planning artifacts are inputs, not proof of production
or approval. Any version change invalidates downstream approval until the new
exact version passes the canonical transition again.

## End-to-end production contract

Confirm month/year, platform, audience, funnel, CTA, requested content count,
deliverable type, and whether production covers copy packets, native raster art,
or both. If the user asks to create content, continue beyond planning unless the
scope explicitly says plan-only. A source workbook that cannot be read is a
blocker; never invent rows, claims, identity, or historical performance.

For a monthly calendar, the durable artifacts are an Excel workbook with at
least `Overview`, `30-Day Plan`, `Production Tracker`, and `KPI Tracker`, plus a
per-day folder containing `brief.md`, `caption.md`, `visual-spec.md`,
`provenance.md`, and `QA.md`; video items also require `script.md`. The tracker
records packet paths and exact states. A social role that is read-only must send
the decision-complete artifact specification to the project Executor; it must
not bypass project write ownership or claim files exist before read-back.

## Packet contract

For each content item prepare a self-contained packet with brief, caption,
visual specification, provenance, QA record, and a script for video. The handoff
must include, without conditional omission: `campaign_id`, `content_id`, exact
`version`, `current_status`, `required_action`, `owner`, `evidence`, `created_at`,
platform, format, owners, dependencies, source facts, claims/disclaimers, CTA,
approved identity references, requested and observed dimensions, asset paths,
checksums, and required next action.

- Static post and every carousel slide: load and follow
  `finday-native-raster-production` as the authoritative procedure. It requires
  only native `gpt-image-2`, approved Finday logo plus brand avatar/model input,
  a 4:5 request, preserved raw output, mandatory direct raster resize without
  crop to final `1080x1350`, and complete raw/final operation evidence. No
  alternate production route is valid.
- Video: 9:16, final `1080x1920`.
- Video sequence: generate first-frame image, review it, obtain explicit approval
  for that exact frame/version, then generate video from the approved frame.
- Do not recreate logos or mascot identity, face-swap them, or substitute guessed
  assets. Missing approved identity evidence is `BLOCKED`.
- Do not compose the final Finday social art with HTML, SVG, Pillow, screenshots,
  or vector overlays when the governed brief requires native raster generation.

## Pilot, steering, and pause behavior

For a large monthly run, produce a pilot batch first—normally Day 01–10—and do
not scale to later days until that exact pilot is reviewed and accepted. Stop
scaling when the pilot is unsatisfactory. A user pause or stop halts production,
review, approval, and publishing immediately; do not begin another batch in the
same turn. If work began before a steering message arrived, disclose the exact
range produced, preserve it as unreviewed evidence, and never silently delete it
or claim review.

Keep raw provider output distinct from accepted final artifacts. Record the
evidence required by `finday-native-raster-production`, plus deviations and QA
evidence. The only valid Producer outcomes are `DRAFTED` with complete asset and
checksum evidence, or `BLOCKED` with specific missing evidence and
`resume_status`. Production proves only the drafted state; Reviewer, business
authority, Publisher, and read-back prove later states separately. Producer must
never publish or claim review/business/publish approval.

## Exact status meanings

- `Produced`: requested files or payloads actually exist and were read back.
- `Reviewed`: the relevant copy, visual, and technical checks actually ran.
- `Approved`: an authorized human approved the exact version.
- `Published/Scheduled`: the authorized external platform write occurred.
- `Verified`: the exact external target was read back successfully.

A dry run may end at `Produced` or `Reviewed with artifact blockers`; it never
implies approval, publication, or verification.

## Completion checklist

Before reporting completion, prove the requested record count, every required
raster/first-frame asset, exact canvas dimensions, all packet files, video
first-frame approval ordering, pilot acceptance before scaling, separate status
reporting, and absence of unauthorized external publication. Report paths,
checksums, blockers, and deviations from actual read-back—not declared totals.
