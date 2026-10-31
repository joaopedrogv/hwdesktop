---
name: fiscal-calculos-update
description: Update Fiscal.Calculos from a structured RTC implementation package through Delphi mapping, human disposition, incremental implementation, conformance tests, and independent review up to Ready for Release.
---

# Fiscal.Calculos Update

## Purpose

Guide a complete update of the Delphi calculator between two official RTC versions
to **Ready for Release** while preserving behavioral conformity with the official
Java implementation.

Execute this Workflow through `../.ai/agents/orchestration-protocol.md`. The
primary Agent assumes `workflow-orchestrator` and owns state, assignments, gates,
canonical operational automation, and developer communication. Specialist Agents
own research, planning, implementation, and evaluation.

## Orchestrator Context Boundary

While the run is in `RECEIVED` or `PREPARING_SOURCES`, the Orchestrator loads only
`AGENTS.md`, this Workflow, its Command, its own role, the orchestration protocol,
execution profiles, the shared repository-safety Rule, the Modern always-applicable `architecture` and `security` Rules,
and the operational Skill and script required by the current direct operation.

It must not enumerate `.ai/`, inspect metadata or category indexes, read another
Rule or Context, or open unrelated Skills or scripts. Rules and Context
for production, database, Delphi, or tests are loaded later only by the Specialist
whose bounded assignment touches them.

## Scope Boundary

This Workflow may acquire the exact tags and matched implementation package from
the two canonical GitHub repositories, selectively read the acquired
`implementation-evidence.json`, use its matched `implementation-guide.md` for human
review or narrative clarification, prepare immutable tagged copies, and modify
approved Modern production files, Delphi test files, and the range-scoped
development migration file required by approved database changes.

It must not:

- push to, update, checkout, or otherwise operate mutably on external repositories;
- access a repository other than the two exact canonical URLs embedded in
  `Acquire-RTCUpdateInputs.ps1` during input acquisition;
- execute or reproduce the conformity pipeline or require its auxiliary reports;
- recalculate the Java diff, triage, semantic grouping, deep analysis, functional
  changes, or official-test associations already delivered by the evidence contract;
- treat the pipeline's GitHub Issue as Workflow state;
- execute Java tests;
- publish, deploy, release, tag, or update an external tracker.

The matched guide and evidence contract are the pipeline's consumer package. The
JSON is the primary structured source for Agents; the guide is the human-readable
representation. Pipeline impact classifications remain advisory until the developer
approves the Modern disposition of each `change_id`.

## Inputs

Require before source preparation:

- exact source and target tags.

For a new run, derive
`rtc-<source-tag>-<target-tag>-<yyyyMMddTHHmmssZ>` from the interval and current
UTC time. Default the delivery objective to updating `Fiscal.Calculos` across the
interval. A developer may supply another objective, known constraints, or an
existing run identifier when resuming.

Derive the repositories, `reports/<source-tag>-<target-tag>/` directory,
`implementation-evidence.json`, and `implementation-guide.md` through
`rtc-update-inputs`. Never request developer-machine paths for the normal flow.

The current mirror checkout may be ahead of either tag. Never use it as a substitute
for the two exact versions.

## Operational Artifacts and States

Use `.ai-runs/<run-id>/` at the HWDESKTOP checkout root and extend the canonical lifecycle with:

- `PREPARING_SOURCES` between `RECEIVED` and `DISCOVERING`;
- `AWAITING_DISPOSITION_APPROVAL` as the specialized plan approval state.

Recommended artifacts are:

```text
.ai-runs/<run-id>/
├── state.json
├── rtc-inputs/
│   ├── manifest.json
│   ├── calculadora-rtc-mirror/
│   ├── calculadora-rtc-conformidade/
│   └── package/
│       ├── implementation-evidence.json
│       └── implementation-guide.md
├── rtc-sources/
│   ├── manifest.json
│   ├── from/<source-tag>/
│   └── to/<target-tag>/
├── evidence-summary.json
├── discovery.md
├── conformity-inventory.md
├── feature-plan.md
├── technical-design.md
├── increments/<increment-id>/
├── final-review.md
├── validation.md
└── handoff.md
```

Only the Orchestrator updates `state.json`. Snapshots are evidence and remain
read-only after preparation.

When the approved interval contains database changes, the repository output uses
one development migration artifact outside the run directory:

```text
Scripts/SQL/rtc-<source-tag>-<target-tag>.sql
```

This file does not incorporate the change into production migration history.

## Flow

```text
Exact source and target tags
              ↓
Canonical GitHub acquisition fixed by commits and hashes
              ↓
Validated package + verified immutable snapshots
              ↓
change_id-to-Delphi mapping
  └── bounded Java Flyway database-impact mapping
              ↓
Complete conformity inventory and dependency-aware plan
              ↓
HUMAN DISPOSITION AND PLAN APPROVAL
              ↓
Technical design
              ↓
Semantic implementation increments
  ├── Delphi behavior
  ├── faithful Delphi reproduction of official tests
  └── independent review
              ↓
Final review and authorized Delphi validation
              ↓
Ready for Release
```

## 1. Prepare Exact Sources

Transition to `PREPARING_SOURCES`. The primary Orchestrator executes these three
canonical operations sequentially, reading each selected Skill completely first:

1. `rtc-update-inputs`, only `-Action Acquire`: register the self-verified
   acquisition manifest and pinned remote commits;
2. `rtc-implementation-evidence`, only `-Action Summary -AsJson`: validate the
   acquired package and persist the compact summary as `evidence-summary.json`;
3. `rtc-source-snapshots`, only `-Action Prepare`: register the self-verified
   snapshot manifest.

Execute one script action at a time and record its result before starting the next.
`Plan` is a manual diagnostic action; `Check` is used only for an explicit
verification or resumption. Invoke the canonical script directly without auxiliary
permission probes or ad hoc substitutes.

Network reads during `Acquire` are restricted to the two canonical GitHub URLs
embedded in its script. Use existing Git authentication; never request or expose a
token. The evidence validation must confirm supported schemas, matching guide
metadata, complete coverage, empty production `unclassified`, internally
consistent changes, dependencies, evidence references, and official-test links.
The snapshot preparation uses only the acquired mirror, evidence, and guide paths
and records tags, commit SHAs, package hashes and versions, generator commit, and
manifest path.

Every operational step recorded in `state.json` identifies the Orchestrator as its
executor, the Skill, script, action, command, result, and evidence. During
`rtc-update-inputs`, it may perform read-only Git network operations against the
two embedded canonical URLs. It writes only declared artifacts under
`.ai-runs/<run-id>/`; only the Orchestrator updates `state.json`. These operations
do not authorize unrelated source inspection, coding, build, or tests.

If the canonical command is unavailable, persist the blocker, emit its exact
invocation for supervised manual execution, and wait for the result. Do not
continue without validated artifacts.

Fail closed on an authentication or network failure, unavailable canonical
repository, missing interval package, unsupported schema, incomplete coverage,
unclassified production artifact, mismatched package, missing or reversed tag,
commit mismatch, divergent existing acquisition or snapshot, unavailable Git
evidence, or attempted remote mutation. Do not repair or reconstruct pipeline
output, infer a nearby version, or use another checkout.

## 2. Consumer Discovery and Delphi Mapping

Transition to `DISCOVERING`. Before each mapping assignment, the Orchestrator uses
`rtc-implementation-evidence` directly to select only the assigned case or
`change_id`. Record that bounded selection under `.ai-runs/<run-id>/` and supply it
to `repository-researcher`; neither role loads the complete JSON into its context.

Then explicitly invoke `repository-researcher` with `quality-critical` for the
bounded read-only mapping assignment. The researcher inspects the supplied selection,
the current Delphi implementation, and only the referenced snapshot paths needed by
that change. It does not run the evidence script or repeat pipeline work.

For every reported `change_id`:

- preserve the pipeline's old behavior, new behavior, behavioral contracts,
  dependencies, evidence references, and official-test associations;
- locate the corresponding current Delphi production behavior and tests;
- determine whether Delphi behavior is absent, partial, equivalent, or not consumed;
- map every associated official test and fixture to an existing or required Delphi
  conformance scenario;
- deduplicate tests shared by several `change_id`s while preserving their complete
  traceability;
- distinguish package evidence, Delphi repository evidence, inference, uncertainty,
  and dependency;
- propose observable acceptance evidence, fiscal risk, and Modern disposition.

Prepared Java snapshots may be consulted only at source paths, tests, fixtures, and
hunks referenced by the selected change when the structured contract is
insufficient for mapping or implementation. Do not perform a repository-wide diff,
search for additional unreported changes, reassociate `unassociated_artifacts`, or
repeat pipeline classification while coverage is complete.

When an approved case affects persistence, schema, reference data, or a repository
contract, the researcher must also consult the relevant official migration evidence
in the exact tagged snapshots:

```text
source/flyway/sql/criacao/
source/flyway/sql/manutencao/
```

Use the target tag's `criacao/` definition only as needed to understand the
resulting affected objects. In `manutencao/`, inspect the versioned files after the
source tag through the target tag that affect those objects or behaviors. This is a
bounded evidence consultation, not a new exhaustive diff.

Classify every relevant SQL effect as:

- schema required by Modern;
- externally synchronized mirror data;
- ERP-owned data requiring an explicit Modern migration decision; or
- not applicable to Modern.

Official Java `INSERT`, `UPDATE`, and `DELETE` statements for calculator mirror
tables are evidence of source-data evolution, not ERP migration commands. The ERP
schema may be migrated, but mirror rows must come from the external synchronization
flow.

Classifications such as `OBRIGATORIO`, `PROVAVEL`, `VERIFICAR`, or `SEM_ACAO` are
inputs, not final Modern dispositions. Do not mechanically translate Java structure
when an equivalent Delphi behavior is clearer; preserve structural similarity when
it materially improves future conformity work.

## 3. Complete Plan and Human Gate

Transition to `PLANNING` and explicitly invoke `feature-planner` with
`quality-critical`, owning exactly `.ai-runs/<run-id>/feature-plan.md` for direct
creation and revision. Require the saved artifact and its verification in the
result. Produce one plan for the complete version interval, including:

- objective, interval, evidence manifest, scope, and non-goals;
- a complete `change_id` inventory with dependencies and risks;
- proposed disposition for every item;
- required Delphi production changes;
- database impact, including the ownership classification of every relevant
  official Flyway change and any required synchronization adaptation;
- the required range-scoped development migration artifact, when database changes
  apply, without DML that populates or maintains calculator mirror rows;
- already-associated official Java tests/resources to reproduce or update in Delphi;
- ordered semantic increments and acceptance criteria;
- validation, infrastructure, and authorization needs;
- open questions and material uncertainties.

Every inventory item must receive one developer-approved disposition:

- `implement`;
- `already-satisfied`;
- `not-applicable`;
- `deferred`;
- `needs-investigation`.

Enter `AWAITING_DISPOSITION_APPROVAL`. No production or test file may be changed
before explicit approval. `needs-investigation` items return to bounded discovery;
`deferred` items require recorded consequence and owner. Partial approval authorizes
only the selected items.

A material change to interval, public behavior, disposition, scope, risk, or test
strategy returns to this gate.

## 4. Technical Design

After approval, transition to `TECHNICAL_DESIGN` and explicitly invoke
`feature-planner` again with `quality-critical`, owning exactly
`.ai-runs/<run-id>/technical-design.md` for direct creation and revision. The
planner writes and verifies the document; the Orchestrator registers its result.

Translate the approved dispositions into repository-specific changes and a
dependency-safe increment order. Group or split semantic cases when required by a
shared dependency, but keep each increment bounded and independently reviewable.
Associate each production behavior with its `change_id`, official evidence, and
Delphi tests.

Follow `.ai/context/fiscal-calculos-context.md` and `.ai/context/testing-strategy.md`.
Behavioral conformity takes precedence over applying the normal ERP feature
architecture mechanically.

For every approved database effect, the technical design must map the relevant
official Flyway evidence to one of these Modern outcomes: Firebird schema command,
external synchronization responsibility, justified ERP-owned data command, or no
Modern change. It must also identify any synchronization code or tests that must
change so newly created or altered mirror tables receive the official data.

When at least one Modern-owned database command is required, define exactly one
development script for the interval:

```text
Scripts/SQL/rtc-<source-tag>-<target-tag>.sql
```

Preserve the exact tag text, including `v`; for example,
`Scripts/SQL/rtc-v0029-v0039.sql`. The script aggregates the approved interval and
does not mirror the Java file-per-version convention. Apply the `database-migration`
Skill and Firebird 2.5 rules. Production migration incorporation remains outside
this Workflow.

## 5. Incremental Implementation and Evaluation

For each approved increment:

1. transition to `IMPLEMENTING_INCREMENT`;
2. explicitly invoke `increment-implementer` with `quality-critical` and exclusive
   ownership of the listed files;
3. implement the minimum approved Delphi behavior;
4. when the increment owns database changes, create or update only the canonical
   range-scoped development script through `database-migration`; include required
   schema and explicitly approved ERP-owned data changes, but never DML for
   calculator mirror rows;
5. when a mirror schema changes, implement or update the external synchronization
   path and its applicable tests so it can populate the resulting schema;
6. handle official Java tests already associated with the assigned `change_id`
   according to their status: add, update, evaluate removal, or preserve equivalent
   Delphi coverage, including fixtures, inputs, expected results, and proven
   behavior in `Fiscal.Calculos.Tests`;
7. preserve numeric precision, rounding, null/absence semantics, ordering, error
   behavior, and other observable fiscal behavior shown by the evidence;
8. end writing and return the structured result without executing tests unless the
   assignment explicitly authorizes it;
9. transition to `REVIEWING_INCREMENT` and explicitly invoke an independent
   `increment-reviewer` with `quality-critical`;
10. accept the increment only when the reviewer reconciles code, migration,
    synchronization, and tests with the
   selected evidence contract, any referenced tagged sources consulted, the
   approved plan, and applicable Rules.

For `already-satisfied`, `not-applicable`, or `deferred` items, preserve the approved
evidence and rationale without inventing a code change.

Use at most one bounded correction cycles per increment. Then stop for developer
direction. A material finding returns to the human gate.

## 6. Test Creation and Execution

`Fiscal.Calculos.Tests` owns the specialized unit, integration, regression, and
conformance strategy. Official tests associated by the evidence contract are
reproduced in Delphi according to their status, fixtures, inputs, expected results,
and proven behavior. Suggested regression tests remain a separate planning input.
The Java suite is not executed by this Workflow.

Test creation is part of an approved implementation increment. Build and execution
are separate permissions. The primary Orchestrator may execute the authorized
canonical runner directly, record its evidence, and send technical findings to the
appropriate Specialist:

- without authorization, perform static review and enter `AWAITING_VALIDATION`;
- with build-only authorization, use `delphi-fiscal-calculos-test-runner -BuildOnly`;
- with execution authorization, also require the developer's confirmation that all
  database, calculator files, configuration, and services are safe test resources,
  then use `-ConfirmTestInfrastructure`.

Do not substitute ad hoc compiler or runner commands. Preserve exit code, NUnit XML,
and failure evidence. An environment fix permits only the previously authorized
retry; code changes require implementation and independent review again.

## 7. Final Review, Validation, and Status

After all increments are accepted, transition to `FINAL_REVIEW` and explicitly
invoke `increment-reviewer` with `quality-critical` for the integrated interval.
Confirm:

- every reported `change_id` has its approved final disposition and evidence;
- implemented Delphi behavior matches the relevant official tagged behavior;
- required official test changes were faithfully reproduced in Delphi;
- every relevant official Flyway change has an explicit Modern outcome;
- the range-scoped development migration exists when required, uses the canonical
  name, and contains no DML that seeds or maintains calculator mirror rows;
- required synchronization changes and evidence cover population of affected
  mirror tables;
- no unrelated behavior or architecture was changed;
- all required authorized validation results are recorded;
- deferred risks and manual prerequisites are explicit.

The Orchestrator may declare `READY_FOR_RELEASE` only when the final independent
review passes, every required validation is complete, and no blocking item remains.
Otherwise report `Awaiting validation for Ready for Release`, `BLOCKED`, or `FAILED`
according to the protocol.

The handoff records the interval and SHAs, evidence and guide hashes, schema and
pipeline versions, disposition table keyed by `change_id`, increments, files
changed, the range-scoped development migration and excluded mirror-data DML,
synchronization changes, Delphi tests created or updated, validation evidence,
residual risks, and final status.

## Stop Boundary

Stop at **Ready for Release**. Release, deployment, packaging, version changes,
branches, tags, upstream mirror or conformity changes, and GitHub Issue updates
require separate authorization and process.
