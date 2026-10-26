---
description: Update Fiscal.Calculos between exact official RTC tags through the canonical workflow.
---

Read `AGENTS.md` and `.ai/commands/update-fiscal-calculos.md` completely. Follow the
canonical Command and every artifact it selects.

Run this Command only with `modern-workflow-orchestrator` selected as the primary
Agent. For every assignment attempt, invoke the exact named worker through the
native Task tool exactly once and wait for its result. If that invocation is
unavailable or not observably issued, use the canonical supervised manual mode.

Treat only the exact source and target tags as mandatory developer input. If one or
both are absent, remain in `RECEIVED`, ask only for the missing tags in Brazilian
Portuguese, and show:

```text
/update-fiscal-calculos v0029 v0039
```

When a third argument is present, treat it as the exact existing run identifier,
read only `.ai-runs/<run-id>/state.json`, and resume it instead of deriving a new
run. Example:

```text
/update-fiscal-calculos v0029 v0039 rtc-v0029-v0039-20260828T150603Z
```

Do not search the repository, enumerate `.ai-runs`, probe local or external paths,
or guess a tag. Derive the canonical repositories, matched package paths, new run
identifier, and default objective exactly as the canonical Command and Workflow
specify. All developer-visible progress, questions, gates, blockers, errors, and
handoffs MUST be in Brazilian Portuguese unless the developer explicitly requests
another language.

Invoking this Command authorizes only canonical read-only GitHub acquisition and
discovery preparation; preserve the human disposition gate and the separate
authorizations for implementation, build, and test execution.
