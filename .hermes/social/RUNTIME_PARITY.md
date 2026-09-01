# Non-skill runtime parity

The 67-row capability manifest accounts for logical `SKILL.md` capabilities. This
table accounts for the remaining observed profile surfaces so that runtime
features do not disappear outside the skill count.

| Source surface | Codex class | Project implementation or proof | Irreducible difference |
| --- | --- | --- | --- |
| Seven `profile.yaml` identities | ADAPTED | `PROFILE_MAP.md`, live roster, exact native task titles | Codex has tasks, not managed Hermes profiles. |
| Seven `SOUL.md` identities | ADAPTED | Role files and `hermes-sm-*` skills loaded by `AGENTS.md` | Instruction-driven; no native task soul slot. |
| Profile avatars | UNAVAILABLE | Source presence recorded; no avatar copied | Codex task avatar customization is not exposed. |
| Luna model selection | NATIVE | All seven tasks created with `gpt-5.6-luna`/`high` | Provider URL and profile-local provider config are host-managed. |
| Per-profile configuration | UNAVAILABLE | Shared project protocol only | No independent `HERMES_HOME` or per-task config file. |
| Durable memory | ADAPTED | Seven role memory files; sanitized source behavior seeded asymmetrically | File-backed convention, not Hermes memory tool/provider or native Codex memory. |
| Sessions and messages | NATIVE | Distinct native Codex task transcripts | No cloned Hermes state/message database or profile session store. |
| Async delegation | ADAPTED | Native create/read/send/wait task tools plus `HERMES-MSG v1` | No Hermes `delegate_task` or durable Kanban semantics. |
| Direct peer communication | NATIVE | Corrected seven-role ring with native task-message evidence | Tool exposure is task/host dependent; failed tasks are replaced or marked degraded. |
| Cron execution store | UNAVAILABLE | Zero source execution rows recorded; no schedule imported | No Hermes gateway/ticker/database semantics. Codex automation is separate and user-requested. |
| Plugins/connectors | NATIVE/UNAVAILABLE per host | Manifest routes exposed plugins and fails closed on missing ones | Source declared no enabled plugins; credentials/account mappings are not migrated. |
| Browser/computer/file tools | NATIVE/ADAPTED per host | Callable Codex surfaces plus runtime probes | Hermes backend/session/provider behavior is not reproduced. |
| Security and permissions | ADAPTED | Codex runtime policy plus role ownership and diff audits | Role ownership is protocol, not a per-role filesystem ACL. |
| Checkpoints/rollback | ADAPTED | Git history and reviewable patches | No Hermes shadow checkpoint or context rewind manager. |
| Profile lifecycle | ADAPTED | Native task create/rename/archive/fork/handoff/share tools | No Hermes create/use/alias/export/import/update profile operation. |
| Self-improvement | ADAPTED | Evidence-gated role memory/skill/evolution files | No background or automatic learning daemon was observed or claimed. |
| Logs/health/usage | ADAPTED | Native task status, history, command/test evidence, Git audit | Hermes logs, health doctor, usage DB, and gateway heartbeat are excluded. |
| Voice/media/dashboard/channel UI | UNAVAILABLE unless separately exposed | Use only an actually callable Codex skill/app for a scoped request | No Hermes dashboard/profile switcher/channel delivery parity. |
| External Finday canonical package and identity assets | UNAVAILABLE until resolved | Portable `<finday-shared-root>` dependency with fail-closed role rules | Referenced source data/assets are not inside this repository and are not fabricated. |

An entry may move from `UNAVAILABLE` to `NATIVE` or `ADAPTED` only after a real
host/tool probe and an evidence-gated manifest/evolution update. Credentials and
private runtime state never move into the repository.
