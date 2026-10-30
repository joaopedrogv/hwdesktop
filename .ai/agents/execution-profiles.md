# Execution Profiles

Execution profiles are portable guidance for choosing an Agent's capability,
deliberation, response-time priority, and cost. Tool adapters map them to concrete
models and settings; role definitions provide their defaults.

| Profile | Capability | Deliberation | Latency priority | Cost priority |
|---|---|---|---|---|
| `fast-routine` | Focused work with clear requirements | Light | Interactive | Cost sensitive |
| `balanced-work` | General implementation and analysis | Standard | Balanced | Balanced |
| `quality-critical` | Complex or high-impact work | Deep | Flexible | Quality first |

## Selection

- Honor the developer's explicit Agent or profile choice. Otherwise use the role's
  default and the actual assignment's complexity, uncertainty, and impact.
- A Skill is not a prerequisite for any profile. Use applicable Skills as
  procedures, without treating their existence as a task-admission requirement.
- If the requested Agent cannot complete the assignment, report the concrete
  difficulty or unavailable capability and the next action needed. Do not infer
  inability solely from a module name, a previous profile, or a missing Skill.
- Profiles do not add planning stages, approval gates, or permissions. Scope,
  ownership, independent review, and execution authorization remain defined by
  the developer request, role, and applicable Workflow.


## Routine Implementation Routing

Classify each bounded assignment rather than inheriting the whole feature's profile.
Prefer fast-routine for implementation when inputs and contracts are verified, the
procedure is established, material decisions are settled, the change is bounded
and its outcome can be checked against explicit criteria. A suitable Skill with
complete inputs is a strong signal; it is neither required nor proof of low risk.

Use balanced-work or quality-critical when the actual assignment still requires
significant interpretation or architectural, fiscal, security, persistence or
other high-impact judgment. A module name alone does not determine that choice.
Use the existing discovery/design evidence and Workflow routing guidance; do not
repeat research merely to select a profile. Honor explicit developer choices,
preserve review/authorization gates and follow the result/failure contract when
a selected Agent reports concrete difficulty; do not silently substitute profiles.

## Adapter Mapping

Keep concrete models and tool settings in adapters. Use these presets as defaults
to calibrate against observed quality, latency, and cost; latency is a priority,
not a guarantee. Do not silently substitute a different Agent or execution profile.
