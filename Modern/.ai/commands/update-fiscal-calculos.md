---
name: update-fiscal-calculos
description: Manually start or resume the canonical Fiscal.Calculos update Workflow for an official RTC version interval.
---

# Update Fiscal.Calculos

## Purpose

Provide a stable tool-independent entry point for the complete update of the Delphi
calculator from one official RTC tag to another.

## Required Input

- exact source and target tags;
- optional update objective or delivery constraint; default to updating
  `Fiscal.Calculos` across the supplied interval;
- run identifier only when resuming an existing run. For a new run, derive
  `rtc-<source-tag>-<target-tag>-<yyyyMMddTHHmmssZ>` from the interval and current
  UTC time.

The canonical GitHub repositories, report directory, evidence filename, and guide
filename are fixed by `rtc-update-inputs`; they are not developer input.

If either tag is missing, remain in `RECEIVED` and immediately ask only for the
missing value in Brazilian Portuguese. Show this compact usage example:

```text
/update-fiscal-calculos v0029 v0039
```

To resume an exact existing run, accept its identifier as the third argument and
read only that run's persisted state:

```text
/update-fiscal-calculos v0029 v0039 rtc-v0029-v0039-20260828T150603Z
```

Do not search the repository, enumerate `.ai-runs`, probe likely paths, infer a
nearby interval, or invent a missing tag. When resuming, read only the exact
`.ai-runs/<run-id>/state.json` derived from the supplied run identifier.

## Dispatch

1. Read `.ai/workflows/fiscal-calculos-update.md` completely.
2. Start or resume `workflow-orchestrator` through
   `../.ai/agents/orchestration-protocol.md`.
3. Follow the Workflow from `RECEIVED` and explicitly invoke each named Specialist
   Agent through the active tool's native delegation mechanism.
4. Use supervised manual mode when a required role cannot be invoked.
5. Communicate all developer-visible progress, questions, gates, blockers, errors,
   and handoffs in Brazilian Portuguese unless the developer explicitly requests
   another language.

## Authorization Boundary

Invoking this Command authorizes read-only network acquisition from the two exact
GitHub repositories embedded in the canonical `rtc-update-inputs` script,
validation and selective reading of the acquired implementation package, creation
of immutable source snapshots under the run, and discovery planning. It does not
authorize another remote, a push or remote mutation, production or test changes.

Implementation begins only after the developer approves the complete disposition
and increment plan. Test creation follows that approved scope. Building and running
`Fiscal.Calculos.Tests` require their own explicit authorizations.

## Completion

Return `Ready for Release` only under the Workflow's completion criteria. Release,
publication, deployment, tagging, upstream repository changes, and issue management
remain outside this Command.
