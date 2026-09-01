---
name: rencana-konten-iklan
description: Create a governed Finday advertising content plan with complete row-specific visual and product-proof briefs, native-raster prompts, platform dimensions, approvals, dependencies, and exact-version handoffs.
---

# Rencana konten iklan Finday

Use for Finday advertising/content planning after exact strategy approval. Load
the four portable canonical sources under
`<finday-shared-root>\Finday Ads\social-media-orchestration-system` (`README.md`,
`governance.md`, and `references\transition-matrix.md`) plus
`<finday-shared-root>\Finday Ads\finday-social-design-system.md`. Missing, stale,
unreadable, or conflicting sources block the plan rather than permitting an
invented substitute.

For each static or carousel item use these exact display keys:

- `Pilar / Angle`
- `Format Visual 4:5`
- `Headline / Hook`
- `Visual & Product Proof`
- `Caption + Soft CTA`
- `Prompt Image Generation 4:5`

`Visual & Product Proof` is a concise Indonesian, row-specific scene and product-
evidence brief. `Prompt Image Generation 4:5` is a complete content-specific
English generation instruction that preserves Indonesian overlay copy verbatim
and includes exact `1080x1350`, hierarchy, scene, subject/action, props, validated
product/UI proof, approved palette/type/surface/workflow treatment, approved
raster identity provenance, mobile crop/readability, data safety, exclusions, and
the campaign style block. A carousel with N slides has N complete prompts; never
write “same as slide 1”.

Every static/carousel row must also identify the approved Finday logo and brand
avatar/model inputs. Its eventual production is governed solely by
`finday-native-raster-production`: native `gpt-image-2`, 4:5 request, preserved
raw raster, mandatory direct resize without crop to `1080x1350`, and raw/final
operation evidence. Planning this requirement never proves that production ran.

For video use matching 9:16 fields, exact `1080x1920`, and the mandatory
first-frame review and explicit approval gate before video generation.

Reject a conflicting `3:4` or `1080x1440` rule. It remains `BLOCKED` unless the
user explicitly authorizes a recorded canonical exception for the exact version.

The handoff includes identity/version/status/action/owner/evidence, platform,
account/visibility/timing/timezone, dependencies, approvals, KPIs, blockers,
deviations, and acceptance criteria. The plan does not grant QA, business,
publish, or external-action authority.

For machine-to-machine handoff, emit a parseable envelope containing at least
`handoff_id`, `from_role`, `to_role`, `campaign_id`, `content_id`, `version`,
`current_status`, `required_action`, `owner`, `evidence`, `created_at`, platform,
account/visibility/timing/timezone, source and strategy checksums, predecessor
path/checksum, change log, format-mix reconciliation, per-content approval
coverage, dependencies, acceptance criteria, blockers/deviations,
`external_action_authorized`, and `resume_status`. Do not replace the exact
user-facing Visual Direction display keys with this snake_case envelope.
