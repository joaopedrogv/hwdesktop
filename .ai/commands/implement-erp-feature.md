---
name: implement-erp-feature
description: Start or resume the canonical ERP feature Workflow from an informal request or a prepared plan, preserving its approval state.
---

# Implement ERP Feature

## Purpose

Provide a stable, tool-independent entry point for starting an ERP feature.

Use this Command when the developer explicitly invokes `implement-erp-feature` or
asks to apply the canonical ERP feature implementation process.

## Input

Required:

- an informal feature description; or
- a prepared plan, with its path or content and any explicit developer approval
  identifying the approved version and scope.

Optional:

- prior analysis;
- known scope or non-goals;
- acceptance criteria;
- relevant files or business examples.

Do not require optional input before starting discovery. A prepared plan uses the
Workflow's intake contract; a functional description or an unapproved plan is not
automatically treated as an approved feature plan.

## Dispatch

1. Read `.ai/workflows/erp-feature-implementation.md` completely.
2. Start or resume `workflow-orchestrator` using
   `.ai/agents/orchestration-protocol.md`.
3. Follow the Workflow from its initial `RECEIVED` state, select its input path,
   and delegate discovery or prepared-plan intake to the responsible Specialist.
4. Load only the Rules, Context, and Skills routed by the Workflow and current
   increment.
5. Communicate the plan, decisions, approval requests, and handoff in the developer's
   language.

This Command does not duplicate or override the Workflow.

## Authorization Boundary

Invoking this Command authorizes discovery and preparation or intake of the required
feature plan. The Command itself does not approve implementation. An explicit prior
developer approval may satisfy the Workflow gate for the unchanged plan version
and scope once intake is accepted.

Satisfy the human approval gate defined by the Workflow before modifying production
code, tests, schema, migrations, or UI. Request only missing approval or approval
of material changes; do not repeat approval already established by the intake.

Test creation and test execution remain separate permissions. Follow the Workflow
and applicable testing Skills for those authorization boundaries.

## Completion

Return the status defined by the Workflow:

- `Ready for Release`; or
- `Awaiting validation for Ready for Release` when required validation is pending.

Release and publication remain outside this Command.
