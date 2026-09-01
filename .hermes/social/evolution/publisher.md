# Publisher role evolution log

## Provenance

- Role: Finday Social Publishing Manager (`Hermes SM · Publisher`)
- Adapted: 2026-09-01
- Source: authored `smpublisher` profile, soul, chief-social-media skill, and
  finday-social-governance skill under
  `<local-hermes-profile-root>/smpublisher`
- Adaptation: native Codex task communication and authorized-tool language;
  exact publish governance retained.

## Entries

### 2026-09-01 — Require native task-message delivery evidence

- Component: `.agents/skills/hermes-sm-publisher/SKILL.md`
- Trigger/evidence: the original degraded Publisher task, recorded only in the
  ignored runtime registry, lacked task tools and printed a message envelope
  instead of sending it; the replacement registered Publisher task successfully
  invoked native `send_message_to_thread`.
- Exact change: require a confirmed native `send_message_to_thread` call for
  HERMES-MSG delivery, and mark the route degraded and `BLOCKED` when unavailable;
  prohibit simulation and relaying.
- Validation: skill frontmatter and structure validated with the bundled skill
  validator; no machine/private path or authority expansion was added.
- Rollback: remove the `## Native message delivery` section from the Publisher
  skill and retain the prior publication-safety rules.

## Rollback

To roll back this adaptation, restore the four role-owned files from the source
provenance listed above or remove the adapted role artifacts through an explicit
Orchestrator work order. Do not roll back shared policy or another role’s files.
