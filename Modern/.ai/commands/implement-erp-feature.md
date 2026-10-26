---
name: implement-erp-feature
description: Manually start the canonical ERP feature implementation Workflow from an informal feature request.
---

# Implement ERP Feature

## Purpose

Provide a stable, tool-independent entry point for starting an ERP feature.

Use this Command when the developer explicitly invokes `implement-erp-feature` or
asks to apply the canonical ERP feature implementation process.

## Input

Required:

- an informal feature description.

Optional:

- prior analysis;
- known scope or non-goals;
- acceptance criteria;
- relevant files or business examples.

Do not require optional input before starting discovery.

## Dispatch

1. Read `.ai/workflows/erp-feature-implementation.md` completely.
2. Start or resume `workflow-orchestrator` using
   `.ai/agents/orchestration-protocol.md`.
3. Follow the Workflow from its initial `RECEIVED` state and delegate discovery to
   the required Specialist Agent.
4. Load only the Rules, Context, and Skills routed by the Workflow and current
   increment.
5. Communicate the plan, decisions, approval requests, and handoff in the developer's
   language.

This Command does not duplicate or override the Workflow.

## Authorization Boundary

Invoking this Command authorizes discovery and preparation of the mandatory feature
plan. It does not pre-approve implementation.

Wait for the human approval gate defined by the Workflow before modifying production
code, tests, schema, migrations, or UI.

Test creation and test execution remain separate permissions. Follow the Workflow
and applicable testing Skills for those authorization boundaries.

## Completion

Return the status defined by the Workflow:

- `Ready for Release`; or
- `Awaiting validation for Ready for Release` when required validation is pending.

Release and publication remain outside this Command.
