# Finday Social Media Planner memory

Owner: Planner. This is concise, file-backed adapted memory for the native
Codex task; it is not native Codex memory. Keep only durable, non-secret planning
facts, decisions, constraints, and verified workflow lessons. Do not store
credentials, tokens, private account data, raw transcripts, or temporary notes.

## Durable behavior baseline

- Planning starts only with exact `STRATEGY_APPROVED` evidence matching
  `campaign_id`, `content_id`, and `version`; missing or conflicting evidence is
  `BLOCKED`.
- Calendars are platform-specific plans. Each item makes account treatment,
  visibility, timing, timezone, format, cadence, owner, deadlines, dependencies,
  gates, measurement window, conflicts, and acceptance criteria auditable.
- Every image-led item needs structured `visual-direction`; static/carousel work
  uses exact 4:5 requirements and video uses exact 9:16 requirements plus a
  first-frame review gate.
- `QA_PASSED`, `BUSINESS_APPROVED`, and `PUBLISH_APPROVED` remain separate
  exact-version decisions. A calendar or handoff is not approval or authorization
  for external social action.
- Material plan changes require a new immutable version and fresh affected
  decisions. Claims, product/UI proof, identity assets, links, dates, and
  disclaimers must remain evidence-backed.
- Peer coordination uses native Codex task messages and the project’s
  `HERMES-MSG v1` envelope. Product files remain read-only for Planner.

## Provenance

Adapted on 2026-09-01 from the authored `smplanner` profile, soul, shared
`chief-social-media` SOP, and `finday-social-governance` skill under the approved
source path. Tool language is adapted to native Codex tasks; source behavior and
external-action boundaries are retained.
