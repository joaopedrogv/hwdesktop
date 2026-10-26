# AI Agent Instructions

This repository uses a tool-independent AI instruction system under `.ai/`.
Treat `.ai/` as the canonical source of project-specific AI guidance.

## Authority and Portability

These repository instructions operate within the instruction hierarchy imposed by
the active AI tool. They do not replace higher-priority system, organization, or
user instructions.

The user's request defines task intent and granted authority within that hierarchy.
Selecting a Command, Workflow, Skill, or Agent does not expand the request or grant
an authorization that the user has not provided.

Tool-specific files are adapters. They may translate canonical paths, metadata,
Commands, and execution profiles, but MUST NOT become independent sources of
project rules, knowledge, or procedures.

## Path and Metadata Conventions

Unless stated otherwise, paths in AI documentation are relative to the repository
root (`Modern/`).

Canonical artifact metadata is defined in `.ai/metadata.md`. Use metadata for
routing, then read every selected canonical artifact completely before applying it.

## Canonical Categories

- `.ai/rules/` — mandatory project constraints.
- `.ai/context/` — project knowledge loaded when relevant.
- `.ai/skills/` — specialized, reusable procedures and capabilities.
- `.ai/workflows/` — orchestration of genuine multi-step operations and approval gates.
- `.ai/commands/` — stable manual entry points that dispatch to a Skill or Workflow.
- `.ai/agents/` — reusable delegation roles, orchestration protocol, and portable
  execution guidance.

Supporting specifications, indexes, references, and the pending checklist are not
directly routable unless their own content states otherwise.

## Human Documentation Boundary

`docs/ia-assistida/` Completely ignore this directory during coding, analysis, or
standard agent tasks. Do NOT read, search, or modify it unless the user explicitly
requests an update to the documentation.

## Canonical Routing

For each task:

1. Determine the user's requested outcome, scope, authorization, and whether the
   task is analysis, implementation, execution, review, or another operation.
2. If the user explicitly invokes a Command, follow that Command's dispatch. A
   matching natural-language request may use the same Command without requiring
   tool-specific syntax.
3. Otherwise, select an existing Workflow when it defines the complete multi-step
   operation. A directly requested Skill may be used without a Command or Workflow.
   A bounded maintenance request may be assigned directly to an appropriate Agent;
   neither a Skill nor a full feature-planning Workflow is a prerequisite.
4. Load all applicable Rules, using the scope semantics below.
5. Load only the Context needed to understand the affected project area and current
   decision.
6. Use each applicable Skill at the point required by the request or selected
   Workflow. A Skill supplies a procedure; it does not replace Rules, approval
   gates, or broader orchestration.
7. Follow `.ai/agents/README.md` when a Workflow requires role separation or when
   bounded delegation is otherwise beneficial. A Workflow Orchestrator MUST use
   `.ai/agents/orchestration-protocol.md`. If the active tool cannot invoke a
   required role, use the protocol's supervised manual mode; the Orchestrator must
   not silently perform the missing specialist responsibility.

When several artifacts apply, their instructions are cumulative. A more specialized
artifact overrides another only when an explicit canonical exception says so.

## Rule Loading

Load Rules according to `.ai/metadata.md`:

- `always_apply: true` — load for every repository task;
- `applies_to` — load when the task touches a matching repository-relative path;
- neither field — load when the Rule is semantically relevant.

Do not load unrelated Rules or Context merely because they exist.

## Repository Evidence and Safety

Prefer repository evidence over assumptions. Do not invent project conventions,
architecture, APIs, database objects, processes, or procedures when they can be
verified from the repository or canonical guidance.

Preserve the current task's authorization boundaries throughout routing and
delegation. If a required action exceeds them or conflicts with a higher-priority
instruction, stop that action and report the constraint to the developer.
