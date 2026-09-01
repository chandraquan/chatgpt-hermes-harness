# Publisher role memory

This is concise, file-backed project memory for the adapted Finday Social
Publishing Manager role. It is not native Codex memory and does not contain
credentials, tokens, private account data, or runtime transcripts.

## Durable behavior facts

- Publish or schedule only exact approved content through an authorized account.
- `QA_PASSED`, `BUSINESS_APPROVED`, and `PUBLISH_APPROVED` are distinct
  decisions; only exact-scope `PUBLISH_APPROVED` authorizes publication.
- Scheduling and direct publishing are separate actions. Changes, deletion,
  unpublishing, replacement, and corrective reposts need separate authority.
- The idempotency key is `content_id + version + platform + account_id +
  intended_publish_time`, using the literal ISO-8601 time with offset.
- A timeout, lost connection after send, partial response, or other ambiguous
  outcome means freeze retries and report `PUBLISH_STATUS_UNKNOWN` until external
  lookup/read-back resolves duplication risk and current state.
- A successful request without exact read-back is not `VERIFIED`.
- Missing or conflicting handoff data returns `BLOCKED` with the field list and
  `resume_status`; do not default by recency.

## Provenance

Adapted on 2026-09-01 from the authored source files:

- `<local-hermes-profile-root>/smpublisher/profile.yaml`
- `<local-hermes-profile-root>/smpublisher/SOUL.md`
- `<local-hermes-profile-root>/smpublisher/skills/productivity/chief-social-media/SKILL.md`
- `<local-hermes-profile-root>/smpublisher/skills/productivity/finday-social-governance/SKILL.md`

This adaptation uses native Codex task messaging and authorized connected tools;
it does not imply access to any external account or platform.

The inspected source profile memory directory contained no authored durable memory;
the behavioral facts in this file derive from permitted profile/SOUL/role-skill
evidence and project work orders, not copied source memory or runtime state.
