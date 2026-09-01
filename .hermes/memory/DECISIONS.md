# Decisions

## 2026-09-01 — Use native Codex project mechanisms

- Status: active
- Decision: implement the harness with root `AGENTS.md`, `.agents/skills`, and
  `.hermes` state files.
- Rationale: Codex natively discovers project instructions and repository skills;
  this keeps behavior local without a second runtime or global configuration.
- Supersedes: the discarded standalone Python/API agent scaffold.

## 2026-09-01 — Gate self-improvement by evidence

- Status: active
- Decision: memory may update from durable facts; skills require a proven workflow,
  explicit request, or diagnosed failure; soul changes require explicit feedback
  or three consistent signals.
- Rationale: preserve compounding value without drift, noisy self-edits, or silent
  permission expansion.

## 2026-09-01 — Distinguish native features from instruction-driven layers

- Status: active
- Decision: describe `AGENTS.md`, repository skill discovery, available subagents,
  and available task tools as native Codex mechanisms; describe soul, `.hermes`
  memory, registry maintenance, reflection, and evolution as instruction-driven
  file workflows.
- Rationale: the latter persist and can work well, but they are not deterministic
  platform hooks or the native Codex memory engine.

## 2026-09-01 — Add a network-first Glints applicant extractor skill

- Status: active
- Decision: reuse `.agents/skills/glints-job-applicant-extractor` for Glints applicant exports; treat the authenticated browser's paginated `channel` response bodies as the sole source of truth and preserve masked values exactly.
- Rationale: the verified workflow captured four pages from network fetches and prevented local folder data or guessed phone digits from entering the workbook.
- Evidence: explicit user request in the Glints extraction task and successful `quick_validate.py` validation of the new skill.

## 2026-09-01 — Publish a sanitized public harness over project-local SSH

- Status: active
- Decision: use `chandraquan/chatgpt-hermes-harness` as the public GitHub remote,
  preserve its initial commit, and push through an SSH command configured only in
  this repository.
- Rationale: the user explicitly requested GitHub deployment through SSH at the
  project level; repository-local configuration avoids changing the default SSH
  identity, which belongs to a different GitHub account.
- Privacy boundary: ignore `.tmp/`, `outputs/`, live `ROSTER.md`, and live
  `REGISTRY.md`; publish sanitized templates instead. Staged scans must contain no
  runtime task IDs or credentials before push.
- Evidence: SSH authenticated as `chandraquan`, commit `4bf538d` was pushed to
  `origin/main`, and GitHub exposes the repository publicly.

## 2026-09-01 — Use only the Finday social-media team with complete capability accounting

- Status: active
- Decision: operate solely through seven user-visible social tasks mapped from
  `smorchestrator`, `smstrategist`, `smplanner`, `smproducer`, `smreviewer`,
  `smpublisher`, and `smanalyst`.
- Model: every social task uses `gpt-5.6-luna` at reasoning effort `high`.
- Capability contract: account for all 67 logical source skills as `NATIVE`,
  `ADAPTED`, or `UNAVAILABLE`; never omit a capability or claim unsupported
  Hermes runtime parity.
- Boundary: tasks share one project root and are collaborators, not independent
  `HERMES_HOME` profiles. Do not reproduce profile credentials, state/session
  databases, gateway/cron storage, Kanban, plugins, or rollback semantics.
- Privacy: migrate only authored role behavior and sanitized durable Finday
  preferences; exclude `.env`, auth, raw memory, messages, sessions, DB/WAL/SHM,
  logs, caches, locks, process state, temporary helpers, and generated snapshots.
- Evidence: read-only source inventory found 7 profiles, 60 common logical skills
  physically copied 420 times, plus 4/2/1 unique skills; all cron execution tables
  contained zero rows.

## 2026-09-01 — Require native GPT Image 2 for static and carousel production

- Status: active
- Decision: every Finday static post and carousel slide uses only native
  `gpt-image-2` with a readable Finday logo, approved brand avatar/model, and
  approved text-to-image prompt. Request 4:5, preserve raw output, and directly
  resize raster-to-raster without crop to final `1080x1350`.
- Rationale: explicit user override of the adapted source procedure's former
  optional-normalization detail. It is a deliberate product workflow decision,
  not a claim of source-profile parity.
- Evidence: explicit user instruction relayed in work order
  `reconcile-shared-raster-and-audit-fixes-v1`.
- Guardrails: preserve raw/final paths, dimensions, resize operation, checksums,
  and identity provenance; no alternate model, composition, or production path.
