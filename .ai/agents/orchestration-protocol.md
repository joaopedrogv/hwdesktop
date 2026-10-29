# Agent Orchestration Protocol

## Purpose

Define the tool-independent operating protocol shared by multi-agent Workflows.
This is a supporting specification, not a directly routable Agent.

The protocol combines a persistent workflow state, a manager/worker topology, and
independent evaluation. It does not expand the developer's request or authorization.

## Actors

- **Developer** — supplies the request, material decisions, approvals, and explicit
  execution authorizations.
- **Workflow Orchestrator** — the primary conversation Agent; owns workflow state,
  routing, assignments, gates, deterministic Workflow automation, result
  registration, and developer communication.
- **Specialist Agent** — performs one bounded assignment under a canonical role and
  returns a structured result.
- **Active Tool** — provides the concrete model, permissions, delegation mechanism,
  and adapter mapping without redefining canonical responsibilities.

Only the Workflow Orchestrator may delegate during an orchestrated run. Specialist
Agents must not create nested Subagents.

The primary Agent assumes this role directly. Do not delegate orchestration to an
intermediate Subagent. Technical permissions must support the Workflow and its
delegated work; they do not expand the role's ownership or developer authorization.

## Execution Modes

### Orchestrated mode

Use when the active tool can invoke the required canonical roles. The Workflow
Orchestrator delegates every specialist responsibility and waits for its result.

Delegation is an explicit tool action, not an instruction for the Orchestrator to
adopt another role. For each assignment attempt, the Orchestrator MUST invoke the
named configured Agent exactly once through the active tool's native delegation
mechanism and then wait for that invocation's result. Merely naming a role, loading
its prompt or Skill, or performing its procedure in the Orchestrator's own context
does not satisfy delegation.

The tool adapter translates this requirement into its concrete invocation syntax.
If the native invocation is unavailable, rejected, not observably issued, or does
not run the named Agent, fail closed and use supervised manual mode. Do not retry
implicitly or execute the assignment in the Orchestrator context.

### Supervised manual mode

Use when the active tool cannot invoke the required role. The Workflow Orchestrator
produces the complete next assignment and stops. The developer invokes that role in
another session or compatible tool and returns its result before the run resumes.

Lack of delegation support never authorizes the Workflow Orchestrator to perform a
specialist responsibility itself.

### Direct operational automation

The Orchestrator executes deterministic operations explicitly prescribed by the
Workflow through their canonical Skills and scripts. Source acquisition, evidence
selection, and snapshot preparation do not require a separate operational Agent.
Read the selected Skill completely, execute one canonical script action at a time,
and register its command, exit code, output paths, and required evidence before
continuing. Keep external inputs read-only and effects within the procedure's
declared boundaries. Do not replace the script with ad hoc commands or probe
permissions with unrelated commands.

An authorized build or test run may also be executed directly through its canonical
runner Skill. Preserve all separate authorization and test-infrastructure gates;
technical interpretation or correction of failures still belongs to a Specialist.

If an operational command is unavailable, persist the blocker and provide its exact
invocation for supervised manual execution. Resume only after accepting its result.

## Persistent Run State

Operational run data belongs under `.ai-runs/<run-id>/`, separate from canonical
instructions under `.ai/`. `.ai-runs/` is ignored by version control by default.

Recommended layout:

```text
.ai-runs/<run-id>/
├── state.json
├── discovery.md
├── feature-plan.md
├── technical-design.md
├── increments/
│   └── <increment-id>/
│       ├── assignment.md
│       ├── implementation-result.md
│       └── review.md
├── final-review.md
├── validation.md
└── handoff.md
```

Only the Workflow Orchestrator updates the global `state.json`. A Specialist Agent
may write only the run artifacts and project files explicitly owned by its
assignment. A durable project document is promoted to an approved project location
only when the developer or Workflow explicitly requires it.

The `feature-planner` writes its assigned plan and technical-design artifacts
directly. Each assignment names exact writable paths under the current run, excludes
`state.json`, and requires the planner to verify the saved content before returning
the artifact paths and result. Read-only access to production files does not imply
read-only access to these assigned planning documents. If the tool cannot provide
the required write access, report the assignment as blocked instead of routinely
transferring planning-document persistence to the Orchestrator.

Researcher and reviewer roles remain read-only. When their assignment requires a
run artifact, they may return its complete content for the Orchestrator to persist
literally. Any correction or synthesis returns to the responsible Specialist.

Each state update records at least the run identifier, Workflow, current state,
approved scope, completed and active assignments, pending gate or authorization,
known blockers, and next permitted transition.

The persisted state is the source of truth for developer-visible run status. Before
reporting a transition, blocker, failure, resumption, or completion, the Workflow
Orchestrator MUST persist that same status in `state.json`. It must never report a
current state that differs from the persisted current state.

## Prepared-Plan Intake

A Workflow may accept a plan prepared outside the run. The Orchestrator registers
its source and the developer's approval evidence; `feature-planner` checks coverage
and writes the adopted `feature-plan.md`. The Orchestrator does not synthesize,
approve, or rewrite the plan in place of the planner.

The Orchestrator records in `state.json`, referencing details in the planner's
saved artifact:

- entry type, source path(s), and an immutable source identity (revision or content
  digest), plus the identity of the adopted run artifact;
- the developer's explicit approval statement or a traceable approval reference,
  including which version and scope it covers and any partial approval;
- the planner's coverage result, accepted evidence, supplements, unresolved
  decisions, and any proposed deviation.

The supplied content is the baseline. Preserve its approved decisions and separate
factual supplements from new proposals. Store the adopted plan within the run so
future source edits cannot silently alter it. Do not modify the external source or
treat an Agent's claim of approval as human approval. If approval evidence does not
identify the supplied version or scope, ask the developer to clarify that point.

Use existing lifecycle states: intake starts in `PLANNING`; missing repository
evidence uses `DISCOVERING`; absent approval or new decisions use
`AWAITING_PLAN_APPROVAL`. The planner may combine intake with technical design
when coverage, evidence, and prior approval are sufficient. The Orchestrator then
records the accepted intake and transition to `TECHNICAL_DESIGN` before accepting
the design result or reporting that transition. No additional state or human gate
is required solely because the plan originated elsewhere.

A prior approval satisfies only the unchanged scope it explicitly covers. A
material deviation returns to the human approval gate; build, test, database,
release, and publication authorizations remain separate.

## Canonical Lifecycle States

Multi-agent feature delivery uses these states unless a more specialized Workflow
defines an explicit compatible extension:

- `RECEIVED` — request registered, no specialist work accepted yet;
- `DISCOVERING` — one or more read-only research assignments are active;
- `PLANNING` — a feature plan is being created or a prepared plan is being checked
  and adopted;
- `AWAITING_PLAN_APPROVAL` — required plan approval, uncovered decisions, or material
  changes await explicit developer approval; implementation of that scope is prohibited;
- `TECHNICAL_DESIGN` — the approved conceptual model is being translated into
  repository-specific design;
- `READY_FOR_INCREMENT` — the next approved increment may be assigned;
- `IMPLEMENTING_INCREMENT` — one bounded writing assignment is active;
- `REVIEWING_INCREMENT` — independent review is active after writing ended;
- `CHANGES_REQUIRED` — bounded corrections must be assigned and reviewed again;
- `FINAL_REVIEW` — the integrated feature is under independent review;
- `FEATURE_VALIDATION` — approved runtime or manual validation is being collected;
- `AWAITING_VALIDATION` — required validation lacks authorization or evidence;
- `READY_FOR_RELEASE` — all Workflow completion evidence is satisfied.

Exceptional states are:

- `BLOCKED` — developer input, external state, or a safe compatible role is required;
- `FAILED` — a required operation failed and the Workflow cannot advance from its
  last valid state;
- `CANCELLED` — the developer explicitly ended the run.

`BLOCKED` and `FAILED` preserve the last valid state and its next permitted
transition. Explicit developer input, a recorded developer intervention, or a
successful replacement assignment may resume them. `CANCELLED` is terminal.

## Assignment Contract

Every specialist assignment must identify:

- run identifier and Workflow phase;
- canonical role;
- objective and approved scope;
- inputs, evidence, and artifact paths;
- applicable canonical sources already known to be required;
- owned files or directories and allowed related changes;
- requested execution profile;
- build or test-execution authorization, explicitly present or absent;
- expected output;
- stop conditions.

A direct operational step identifies exactly one canonical script action. Record
its result before starting a dependent operation or issuing a Specialist assignment.

An assignment that lacks the context or authority required for safe execution must
not be inferred or silently broadened. Return it as blocked.

## Result Contract

Every Specialist Agent returns:

- status;
- completed responsibility;
- evidence and files inspected;
- files changed, when writing was authorized;
- validation performed;
- findings and bounded local decisions;
- deviations, unresolved questions, and risks;
- required next action.

Permitted status values are:

- `completed`;
- `changes-required`;
- `blocked`;
- `failed`;
- `material-change-required`.

Specialist Agents do not change the global state, approve material deviations, or
declare `Ready for Release`.

## Fail-Closed Behavior

When a role or required command is unavailable, a delegation is rejected, the
selected execution profile cannot be met, or an assignment or operational step
fails, the Workflow Orchestrator must:

1. preserve the last valid state;
2. persist `BLOCKED` or `FAILED` as the current state and record the last valid
   state;
3. move the affected assignment or operational step out of an active or `issued`
   status and record its terminal `blocked` or `failed` result;
4. record the exact failure in known blockers without exposing secrets;
5. record the safe retry or next permitted transition;
6. stop the affected phase;
7. only then report the persisted blocker and available safe next actions to the
   developer.

It must not impersonate the unavailable role, silently select a weaker execution
profile, continue from incomplete evidence, or leave a failed assignment recorded
as active or merely `issued`.

## Developer Intervention and Resumption

When resuming a run recorded under an earlier role topology, preserve completed
assignments and evidence. Record the topology change and route remaining
deterministic operations to the primary Orchestrator; do not repeat accepted work
or rewrite historical role records.

The developer may intervene at any state, including `BLOCKED` and `FAILED`, to
correct tool configuration, environment, data, documentation, or project files, or
to implement a missing change manually. Developer authority is not constrained by
an Agent role, but the Workflow must not treat an intervention as implicitly
reviewed or validated.

Before resuming, the Workflow Orchestrator records:

- the last valid state and failed or blocked assignment;
- the developer-reported intervention and affected files or environment;
- evidence or validation supplied by the developer;
- whether scope, design, authorization, or acceptance criteria changed;
- the next safe transition.

Resume according to the intervention type:

- tool or model configuration fixed — retry the same assignment;
- environment or test infrastructure fixed — retry only the previously authorized
  execution;
- new evidence or clarified requirement — route it to the appropriate research or
  planning role;
- production code, tests, schema, migration, or UI changed manually — assign an
  independent review of the changed scope before accepting it;
- material scope, conceptual-model, public-contract, schema-intent, or risk change —
  return to the human approval gate before implementation continues.

Manual intervention does not grant a new build, test, integration, release, or
publication authorization. The developer may explicitly grant such authorization
when resuming.

## Evaluation Loop

Implementation and evaluation are independent assignments:

```text
implementer -> reviewer -> approved
                    |
                    +-> changes-required -> implementer -> reviewer
                    +-> material-change-required -> human approval gate
```

Correction cycles must be bounded by the Workflow. Repeated unresolved findings,
conflicting evidence, or a material design change return control to the developer.

## Concurrency and Ownership

- Independent read-only research may run in parallel.
- Writing is sequential by default.
- Concurrent writers require explicit dependency analysis and non-overlapping file
  ownership in the approved plan.
- A reviewer starts only after the implementer's writing assignment has ended.
- The Workflow Orchestrator reconciles current workspace state before issuing the
  next writing assignment.

## Execution-Profile Routing

Select the minimum profile that safely satisfies the assignment. The orchestration
mechanics themselves normally use `fast-routine`; conceptual design and other
high-impact decisions normally use `quality-critical`. Actual risk, ambiguity, and
verification difficulty override role defaults according to `execution-profiles.md`.
