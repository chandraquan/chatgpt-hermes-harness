# Learnings

## 2026-09-01 — “GPT with a Hermes-like harness” means Codex customization here

- Evidence: the user clarified they are working in the ChatGPT Codex app and do
  not want Hermes or a separate API application installed.
- Lesson: when the workspace is empty and “this project” refers to a Codex project,
  prefer `AGENTS.md`, repository skills, memory files, and native task tools over
  scaffolding a standalone agent runtime.
- Reuse: confirm the intended host/runtime before introducing an SDK, daemon, CLI,
  or provider configuration.

## 2026-09-01 — Separate discovery guarantees from behavioral conventions

- Evidence: recursive review against official OpenAI documentation and live app
  capability inspection.
- Lesson: `AGENTS.md` and `.agents/skills` have native discovery, while project
  soul, curated memory files, evolution, and task registry depend on the agent
  following instructions and making explicit file/tool calls.
- Reuse: document capability layers honestly and require observable tool/file
  evidence before claiming that memory, delegation, task coordination, or
  self-improvement occurred.

## 2026-09-01 — Preserve network payload truth in Glints exports

- Evidence: live inspection of `members[].contact` in the Glints `channel` response showed only `type` and a server-masked `number` value (`+62****`).
- Lesson: a Glints applicant export must capture response bodies page by page, deduplicate repeated pagination requests by `page`, and copy masked contact values verbatim; never reconstruct them from UI or another source.
- Reuse: apply the `glints-job-applicant-extractor` skill whenever this workflow is requested.

## 2026-09-01 — Enrich only flagged Glints rows from CV text

- Evidence: the workbook's `Get phone Number` flag selected 59 of 186 rows; CV
  processing yielded 51 normalized `628...` values, 7 no-phone cases, and 1
  access error.
- Lesson: keep the flag as the gate, append `whatsapp` without touching false
  rows, force a non-scientific display format, and leave unreadable or inaccessible
  CVs blank rather than guessing.
- Reuse: use the CV phone enrichment mode in
  `.agents/skills/glints-job-applicant-extractor/SKILL.md`.
