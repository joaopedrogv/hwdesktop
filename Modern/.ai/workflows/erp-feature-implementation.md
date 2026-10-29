---
name: erp-feature-implementation
description: Plan and implement an ERP feature from an informal request or a prepared plan, preserving approval, incremental Use Case delivery, and validation up to Ready for Release.
---

# ERP Feature Implementation

## Purpose

Guide an ERP feature from an informal request or a prepared plan to **Ready for Release**.

This Workflow owns orchestration: sequence, approval gates, branches, Skill routing,
and handoffs. Project constraints, knowledge, and specialized procedures remain in
the applicable `.ai/rules/`, `.ai/context/`, and `.ai/skills/` sources.

Execute it through the stateful manager/worker model in
`.ai/agents/orchestration-protocol.md`. The `workflow-orchestrator` owns state,
routing, gates, canonical operational automation, and developer communication;
the primary conversation Agent assumes this role. Specialist Agents own research,
planning, implementation, and independent evaluation.

Keep internal AI instructions in English. Communicate plans and handoffs in the
developer's language, and preserve Brazilian Portuguese domain terminology as
required by the coding standards.

## Flow

```text
Informal request                    Prepared plan
      ↓                                   ↓
Repository research                Planner checks coverage,
      ↓                            evidence, and prior approval
Feature planning                          ↓
      ↓                            Only missing decisions return
HUMAN APPROVAL                     to HUMAN APPROVAL
      ↓                                   ↓
Technical design ←────────────────────────┘
      ↓
Incremental implementation by Use Case
      ├── production behavior
      ├── tests for the increment
      └── independent review
      ↓
Optional UI branch
      ↓
Final independent review and feature validation
      ↓
Ready for Release
```

At run start, create or resume `.ai-runs/<run-id>/state.json`. Use the states and
assignment/result contracts defined by `orchestration-protocol.md`.

## 0. Select the Entry

The Orchestrator records either an informal request or a prepared plan. A plan may
come from prior work with the developer, another conversation, or an external file;
its origin does not require repeating accepted planning.

For a prepared plan, follow the intake contract in
`.ai/agents/orchestration-protocol.md`. Assign `feature-planner` ownership of
`.ai-runs/<run-id>/feature-plan.md` to preserve the supplied plan, identify its
source version and approval evidence, and check it against section 2. Preserve
approved functional decisions; do not rewrite the plan to impose a preferred format
or reopen settled policy. Mark genuinely inapplicable items with a brief reason.

- Reuse relevant verified evidence; delegate only missing or stale repository
  questions to `repository-researcher` before repository-specific design.
- When the plan is complete for the requested scope and its explicit approval is
  established, adopt it as the run's feature plan and proceed to technical design.
  Intake may be the opening part of the same planner assignment that produces the
  technical design; no separate full planning round or repeated approval is required.
- When information is missing, preserve the approved baseline and identify only the
  gaps. Factual supplements may be recorded separately without changing approval;
  new decisions, missing approval, or material deviations return to section 3.
  A functional description alone does not establish all required planning coverage.
- The source remains read-only. Preserve the adopted version in the run; later edits
  to the source do not silently change the approved scope.

If approval is absent or ambiguous, retain the prepared work and ask only for the
approval or decisions still required. Never infer approval from the document's
presence, an Agent's assertion, or the request to start this Workflow. Routine
technical choices within the approved scope remain part of technical design and
do not reopen plan approval.

## 1. Discovery

For an informal request, perform this discovery before planning. For a prepared
plan, use the same research responsibility only for the evidence gaps identified
during intake; do not repeat accepted research.

Accept the request at the level provided; a complete technical specification is not
required. The Workflow Orchestrator assigns bounded, read-only questions to one or
more `repository-researcher` executions before any architecture, names, contracts,
schema, or procedures are proposed.

Identify:

- the problem, actor, expected outcome, scope, and known acceptance criteria;
- the owning microcontext and nearest established patterns;
- reusable components across domain, application, adapters, infrastructure, and UI;
- related schema, metadata, validation, composition, integrations, and tests;
- compatibility, transaction, ownership, security, authorization, and audit constraints;
- material uncertainties and risks.

Load only the Rules and Context applicable under `AGENTS.md`. Resolve questions from
the repository when possible. Ask the developer only for a decision that cannot be
established safely and would materially change the result.

Do not implement during discovery. Each researcher returns verified evidence,
inferences, relevant paths, reusable components, gaps, constraints, risks, and open
questions. The Workflow Orchestrator registers these results without performing
missing research itself and passes them to `feature-planner`.

## 2. Required Feature Plan

Every run needs a feature plan, created from the request or adopted through section
0. For new planning, assign `feature-planner` to synthesize the request and repository
evidence, with ownership of exactly `.ai-runs/<run-id>/feature-plan.md` for direct
writing and revision. For a prepared plan, the planner checks coverage and preserves
the accepted content instead of recreating it. Require the saved artifact and
verification of its content in either path. The plan contains, when applicable:

1. objective, scope, non-goals, and observable acceptance criteria;
2. discovery evidence and reusable components;
3. conceptual model;
4. Use Cases with important alternate and failure flows;
5. responsibilities and dependency boundaries;
6. persistence and integration needs at a conceptual level;
7. validation strategy;
8. UI branch, explicitly applicable or not applicable;
9. authorization and audit plan, explicitly applicable or not applicable;
10. test plan by component, scenario, and owning project;
11. ordered functional increments;
12. risks, open decisions, and manual validation needs.

### Authorization and audit planning

When the feature exposes protected user actions, load
`.ai/context/security-architecture.md` and
`.ai/context/authorization-auditing.md`.

Present a process inventory containing each protected action, its purpose, audit
coverage, expected manager-approval behavior, proposed process family, and open
registration decision. Never invent the final process code or sequence. The
developer approves the inventory and supplies or approves the identifiers and
registration mechanism.

### Conceptual model before physical schema

Define business concepts, entities, Models, Value Objects, identifiers,
relationships, invariants, states, transitions, and Use Case data needs first.

Only after the conceptual model is understood and included in the plan may technical
design define tables, columns, SQL types, indexes, constraints, or migrations.

### Test planning

Use `.ai/context/testing-strategy.md` to select the smallest reliable test scope. Associate
each planned test with the increment that introduces its behavior. Distinguish test
creation from execution capability, and keep the specialized `Fiscal.Calculos`
strategy outside the default ERP feature path.

## 3. Human Approval Gate

The Workflow Orchestrator presents the complete planner result and waits for explicit
developer approval when that approval has not already been established for the
adopted plan and requested scope. Record approval of the exact plan version under
the intake contract. A verified prior approval satisfies this gate for the unchanged
scope; request approval only for unresolved decisions or material changes.

Before approval, do not modify production code, tests, schema, migrations, or UI,
and do not build or execute tests.

Partial approval authorizes only the approved scope. If later evidence materially
changes scope, conceptual model, public contract, physical schema, or risk, revise
the affected plan and obtain approval before continuing that change.

## 4. Technical Design

Once the plan's approval is established, assign `feature-planner` to translate the
approved conceptual model into the minimum repository-specific design required for
the feature. This may continue the prepared-plan intake assignment after its checks
succeed. Give it ownership of `.ai-runs/<run-id>/technical-design.md` as well when
combining the tasks; otherwise this is the assignment's only writable artifact.
It writes and verifies the document directly. Include:

- types, Ports, Use Case inputs/outputs, and Services;
- validation, transaction, and ownership boundaries;
- repositories, adapters, integrations, composition, and factories;
- physical persistence and development migration strategy, identifying the schema
  reference and pending changes; route general development SQL through
  ../scripts/database/changes/<demand-id>/ under database-migration, preserving explicit
  specialized exceptions;
- UI integration;
- approved process codes, permission checks, manager approval, and audit outcomes;
- affected test projects and support code.

Follow the applicable Rules and Context. A schema change may prepare development
migration SQL, but incorporation into production migration history is outside this
Workflow. If technical design requires a material change to the approved scope,
conceptual model, public contract, physical-schema intent, or risk, return to the
human approval gate.

## 5. Incremental Implementation by Use Case

Use a Use Case, or equivalent executable behavior when no Use Case applies, as the
primary unit of progress. The Workflow Orchestrator assigns each approved increment
to `increment-implementer` and then assigns its completed scope to an independent
`increment-reviewer`:

1. confirm its acceptance criteria and scenarios;
2. implement the minimum concepts, contracts, and application orchestration;
3. add only the validation, Services, repositories, adapters, and composition needed;
4. create or update the planned tests for that same increment;
5. end the writing assignment and return its structured result;
6. review the increment independently against applicable Rules and Context;
7. record completed behavior, review findings, validation evidence, and remaining
   work.

When review returns `changes-required`, create a separate correction assignment for
the implementer and review it again. After two unsuccessful correction cycles, stop
and present the unresolved findings to the developer unless the approved plan sets a
stricter limit. A `material-change-required` result returns to the human approval
gate.

The developer may correct or implement the affected scope manually and then resume
the run. Record the intervention and assign the resulting changes to
`increment-reviewer` before accepting the increment. If the intervention changes a
material approved decision, return to the human approval gate instead.

Do not build every layer horizontally before completing usable behavior. Introduce
shared infrastructure when the first approved increment needs it, not speculatively.

## 6. Skill Routing

Before a specialized activity, read its `SKILL.md` completely. Load only Skills
applicable to the current increment.

| Activity | Skill | Starting execution profile |
|---|---|---|
| Migration commands from an approved physical change | `database-migration` | `fast-routine` |
| Entity from an approved `CREATE TABLE` | `sql-table-to-delphi-entity` | `fast-routine` |
| Metadata for an existing entity and table | `sql-table-to-delphi-metadata` | `fast-routine` |
| Encapsulate an existing record | `delphi-record-encapsulation` | `fast-routine` |
| Implement already-defined entity validation | `delphi-entity-validation` | `fast-routine` |
| Isolated ERP Use Case unit tests | `delphi-usecase-testing` | `balanced-work` |
| Implement an already-defined grid dataset | `delphi-dataset-grid` | `fast-routine` |
| Suitable and already-defined `TfrmCadPadraoM` cadastro scaffold | `delphi-cadastro-form-scaffold` | `fast-routine` |
| Established Use Case validation onto a form | `delphi-ui-form-validation` | `fast-routine` |
| Authorized ERP unit-test build or run | `delphi-test-runner` | `balanced-work` |

The starting profile applies only when the Skill's input and execution-profile
conditions are satisfied. Escalate according to the selected Skill and
`.ai/agents/execution-profiles.md`; never reduce the profile merely because the
Skill appears in this table.

A Skill does not replace discovery, planning, approval, or project Rules. Do not use
one outside its declared scope.

## 7. Required Agent Orchestration

Follow `.ai/agents/README.md`, `.ai/agents/orchestration-protocol.md`, and
`.ai/agents/execution-profiles.md`.

Use these canonical responsibilities:

- `workflow-orchestrator` — persistent state, routing, assignments, gates,
  ownership, canonical operations, result registration, developer communication,
  and final status, performed by the primary conversation Agent;
- `repository-researcher` — bounded read-only repository evidence;
- `feature-planner` — new planning or prepared-plan intake, and post-approval
  technical design;
- `increment-implementer` — one approved writing assignment with explicit
  ownership and authorization boundaries;
- `increment-reviewer` — independent read-only review of each increment and the
  integrated feature.

Select the implementation profile using `execution-profiles.md` and the developer's
request. A Skill is not required to use `fast-routine`. Report concrete execution
limitations without silently replacing the requested Agent.

Independent read-only research may run in parallel. Writing is sequential by
default. Concurrent writers require explicit dependency analysis and non-overlapping
ownership in the approved plan. Nested delegation is not allowed.

If the active tool cannot invoke a required role, use supervised manual mode: the
Workflow Orchestrator emits the complete assignment, stops, and waits for the
developer to return that role's result. It must not perform specialist work as a
fallback.

## 8. Optional UI Branch

Run this branch only when approved presentation behavior exists. Stabilize the Use
Case contracts used by the increment, inspect nearby Modern UI code, and follow
`.ai/context/ui-integration.md` plus the applicable UI Skills.

Keep business rules, entity validation, and persistence out of form event handlers.
Keep user authorization and audit at the established UI or legacy calling boundary;
do not duplicate those checks in Use Cases. Apply the approved process inventory and
record the established success or failure outcome after protected operations.
Plan manual UI smoke scenarios unless an established, more appropriate test strategy
applies.

## 9. Tests and Execution Authorization

Create tests alongside the corresponding functional increment. Use
`delphi-usecase-testing` for isolated ERP Use Cases only; repositories, real
infrastructure, UI, the application Container, and `Fiscal.Calculos` are outside
that Skill.

Creating tests under an approved plan does not authorize building or running them.
The primary Orchestrator may run explicitly authorized canonical automation and
record its results; technical diagnosis or correction is assigned to a Specialist.

### `ERP.UnitTests`

Only when explicitly requested or authorized, use `delphi-test-runner` and:

`Tests/Automation/Invoke-ERPUnitTests.ps1`

Do not replace the canonical script with ad hoc commands. Report its exact invocation,
mode, exit code, and NUnit result when applicable. Without authorization, perform
static review and record runtime validation as pending.

### Integration tests

Integration tests may be created when included in the approved plan. Execution
requires separate explicit authorization and project-specific configuration,
including verified test infrastructure and isolation from production.

Do not use `delphi-test-runner` for `ERP.IntegrationTests` or
`Fiscal.Calculos.Tests`. The latter belongs to the specialized
`fiscal-calculos-update` Workflow and `delphi-fiscal-calculos-test-runner` Skill.
Do not run integration tests implicitly or invent generic automation where none is
established.

When an authorized execution fails, preserve its evidence. The developer may fix
the environment or project and resume. Retry only the previously authorized scope;
manually changed project files require independent review before their results are
accepted.

## 10. Validation and Status

After all increments pass their independent reviews, assign `increment-reviewer` a
final integrated review. Validate the feature against the approved plan and
applicable canonical guidance. Confirm acceptance criteria, architectural boundaries,
compatibility, security, transactions, ownership, persistence, composition, planned
tests, authorized test results, and required integration or manual UI validation.

Report failures rather than weakening production behavior or assertions. A material
corrective design change returns to the approval gate.

The Workflow Orchestrator declares **Ready for Release** administratively only when
the final independent review and recorded evidence establish that:

- the approved scope and acceptance criteria are complete;
- planned tests exist or an exception was explicitly accepted;
- required validations are complete and recorded;
- no known blocking failure remains;
- required migration artifacts are prepared at the agreed development stage;
- non-blocking risks and manual release prerequisites are documented.

If required validation was not authorized or remains incomplete, report
**Awaiting validation for Ready for Release** instead.

The final handoff must summarize scope by Use Case, main components changed, tests
and validation results, manual validation, development migration artifacts, residual
risks, pending items, and final status.

## Stop Boundary

Stop at **Ready for Release**. This Workflow does not authorize release, publication,
deployment, packaging, version/build changes, release branches or tags, production
migration incorporation, manifest/CRC updates, or distribution. Those activities
require their own workflow and authorization.
