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

## 2026-09-01 — Use a persistent decentralized task team

- Status: active
- Decision: the current task is Orchestrator; Researcher, Analyst, Architect,
  Executor, Reviewer, and Verifier are persistent user-visible Codex tasks using
  `gpt-5.6-luna` at `high`. They communicate directly with native task messages.
- Rationale: the user explicitly rejected side-chat orchestration and requested
  auditable, decentralized cross-thread collaboration.
- Guardrails: Executor exclusively owns product edits; each role may evolve only
  its own harness namespace; shared state remains Orchestrator-owned; disputes
  escalate after two peer rounds; each core role may create at most two surge tasks
  per work order.
- Supersedes: the subagent-first orchestration policy in the initial harness.

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
