# Hermes social profile map

| Source | Codex role | Exact task title | Role file | Specialist skill |
| --- | --- | --- | --- | --- |
| `smorchestrator` | SM Orchestrator | `Hermes SM · Orchestrator` | `roles/sm-orchestrator.md` | `hermes-sm-orchestrator` |
| `smstrategist` | Strategist | `Hermes SM · Strategist` | `roles/strategist.md` | `hermes-sm-strategist` |
| `smplanner` | Planner | `Hermes SM · Planner` | `roles/planner.md` | `hermes-sm-planner` |
| `smproducer` | Producer | `Hermes SM · Producer` | `roles/producer.md` | `hermes-sm-producer` |
| `smreviewer` | Reviewer | `Hermes SM · Reviewer` | `roles/reviewer.md` | `hermes-sm-reviewer` |
| `smpublisher` | Publisher | `Hermes SM · Publisher` | `roles/publisher.md` | `hermes-sm-publisher` |
| `smanalyst` | Analyst | `Hermes SM · Analyst` | `roles/analyst.md` | `hermes-sm-analyst` |

Task title plus the live ID in ignored `ROSTER.md` selects the role. A repository
file cannot inspect or change the current native task identity by itself.

Each task reads root `AGENTS.md`, this map, `PROTOCOL.md`, its own role file,
its own memory file, and every matching project skill. All tasks share the same
working directory; distinct native transcripts are not profile filesystem
isolation.
