---
description: Plan and implement an ERP feature through the canonical workflow.
---

Read `AGENTS.md` and `.ai/commands/implement-erp-feature.md` completely. Follow the
canonical Command and every artifact it selects.

Run this Command only with `coordinator` selected as the primary
Agent. The orchestrator must own Workflow state, routing, human gates, and
Specialist Agent assignments; it must not perform their work itself. For every
assignment attempt, invoke the exact named worker through the native Task tool
exactly once and wait for its result. If that invocation is unavailable or not
observably issued, use the canonical supervised manual mode.

Treat the developer's feature request in the current conversation as the informal
request. If it has not been provided, ask for it before starting discovery.

Preserve every canonical approval and authorization gate. Invoking this Command
does not approve implementation or authorize build and test execution.
