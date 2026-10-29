# Agent Delegation

## Purpose

Define tool-independent roles and delegation principles for AI-assisted development.

An Agent is a reusable role with a responsibility, operating boundaries, required
inputs, and an output contract. A Subagent is a temporary execution of one of those
roles for a bounded assignment.

Agents coordinate or perform bounded work. Skills define specialized procedures. A
role may use an applicable Skill, but it must not duplicate the Skill's instructions.

Multi-agent Workflows follow `orchestration-protocol.md`: a stateful, fail-closed
Workflow Orchestrator delegates bounded assignments to Specialist Agents and keeps
human approval gates explicit.

The primary conversation Agent is the Orchestrator. It also executes prescribed
deterministic scripts directly; operational automation needs no separate role.

## Portability

Canonical Agent definitions must not name provider-specific models, reasoning levels,
service tiers, concurrency controls, or invocation syntax.

Use these task profiles:

- `routine`: deterministic, narrow, low-risk work with established evidence or a
  complete procedure;
- `analytical`: local interpretation, comparison, or review requiring judgment;
- `critical`: cross-layer, architectural, security-sensitive, fiscal, persistence,
  or otherwise difficult-to-reverse decisions.

Task profiles describe the nature of work. Execution requirements are defined
separately in `execution-profiles.md` through the `fast-routine`,
`balanced-work`, and `quality-critical` presets.

Tool adapters map execution profiles to available models, reasoning effort, cost,
and subagent mechanisms. When a Workflow requires role separation and the active
tool lacks delegation support, use supervised manual mode: the Orchestrator emits
the next assignment, stops, and waits for the developer to return that role's
result.

## Delegation Criteria

Delegate only when the assignment:

- has explicit scope, inputs, and expected output;
- can proceed without continuous decisions from the Workflow Orchestrator;
- has non-overlapping file ownership when writes are allowed;
- receives all context required to perform its role;
- produces evidence that the Workflow Orchestrator can validate against the
  assignment contract and register;
- provides a meaningful benefit in independence, context isolation, latency, or cost.

Do not delegate merely because a tool supports subagents.

Developer-requested tasks may be delegated directly to these roles without a Skill
or full feature Workflow. Planning is needed when material decisions remain open.

## Authority

Delegation never expands the user's request, the approved feature plan, or an
authorization boundary.

During an orchestrated Workflow, the Workflow Orchestrator retains responsibility
for:

- communication with the developer;
- routing conceptual and architectural analysis to the appropriate Specialist
  Agent and presenting material decisions to the developer;
- human approval gates;
- assignment scope and file ownership;
- registration and integration of structured specialist results;
- prescribed canonical operational scripts and explicitly authorized runners;
- resolution of conflicts or material uncertainty;
- final state and status based on independent validation evidence.

The Orchestrator does not research, plan, implement, correct, or review in place of
a Specialist Agent. It may collect validation by executing an authorized canonical
runner; Specialists retain technical evaluation. Specialist Agents must stop and
return `material-change-required` when their assignment requires a material design
or scope decision.

## Shared Workspace Safety

Do not assign concurrent writers to the same or overlapping files. Read-only roles
may work in parallel when their research questions are independent.

The Workflow Orchestrator must reconcile current workspace state and the returned
assignment contract before accepting the result. Technical correctness is evaluated
by the independent reviewer rather than by the Orchestrator.

## Available Roles

- `execution-profiles.md` — portable capability, deliberation, latency, and cost
  requirements;
- `orchestration-protocol.md` — persistent state, assignment/result contracts,
  fail-closed behavior, manual mode, evaluation, and concurrency;
- `workflow-orchestrator.md` — primary conversation role for state, routing, gates,
  delegation, canonical operational automation, and developer communication;
- `repository-researcher.md` — read-only discovery and repository evidence;
- `feature-planner.md` — approval-ready feature planning and post-approval technical
  design, with direct writing of explicitly assigned planning documents;
- `increment-implementer.md` — bounded coding for an approved increment;
- `increment-reviewer.md` — independent read-only review of an increment or the
  integrated feature.
