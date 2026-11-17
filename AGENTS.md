# HWDESKTOP — AI working instructions

These instructions apply to this checkout and its subdirectories. They are the
common entry point for work opened from the HWDESKTOP root. They do not establish
a uniform architecture for the legacy ERP.

## Authority and scope

- The developer's request defines the task, phase, scope and authorization.
  Selecting a Command, Workflow, Skill or Agent does not expand that authority.
- Confirm the checkout, branch and existing changes before editing. Use the working
  clone and demand branch selected by the developer.
- Preserve unrelated work, ignored dependencies, personal configuration, encoding
  and line endings. Do not normalize legacy directories as a side effect.
- Keep investigation bounded to the affected flow. Consult the developer before
  starting or expanding extensive processing.
- Read .ai/rules/repository-safety.md and .ai/rules/implementation-quality.md for
  every task. For database work, also read .ai/rules/database-safety.md.

## Canonical guidance and routing

The shared instruction system is under .ai/. Modern-specific guidance remains in
Modern/.ai/. Metadata and Rule scope semantics are defined in .ai/metadata.md.
Read each selected canonical artifact completely before applying it.

- .ai/agents/ — shared roles, execution profiles and orchestration protocol.
- .ai/commands/ and .ai/workflows/ — entry points and multi-step procedures.
- .ai/skills/ — procedures shared by the ERP.
- .ai/rules/ and .ai/context/ — constraints and execution knowledge.
- Modern/.ai/ — additional guidance owned by Modern.

Start from an explicitly invoked Command; otherwise select a matching Workflow or
Skill. A bounded maintenance task does not automatically require a full feature
Workflow. Agents may handle explicit bounded assignments under their role contracts.
When a Workflow requires role separation, follow .ai/agents/README.md and
.ai/agents/orchestration-protocol.md; do not impersonate an unavailable Specialist.

For Modern/ work, read Modern/AGENTS.md. For Next/ work or a Modern source marked
with a Next compatibility header, read Next/AGENTS.md. For Modern and Next Delphi
sources, load .ai/rules/delphi-coding-standards.md according to its path scope.
A Next header does not relocate a source or replace the owning area's guidance.

For exclusively legacy work, inspect the implementation and nearby examples.
Evaluate them under repository-safety.md's Legacy References and Local Changes
and implementation-quality.md. Preserve local conventions; do not load Modern or
Next architecture, naming, Use Case, UI or testing rules for unrelated legacy work.
A cross-area task uses each area's guidance for its own files.

Read the supplied functional design and relevant product context. Distinguish
observed behavior, proposals, approved decisions and unverified assumptions.
Context and reasons for decisions live in the separate Contexto e decisões
repository; consult the relevant theme and demand through supplied references.

## Paths and Rule scope

Paths in shared .ai/ documents are checkout-relative. Paths in Modern/.ai/
documents remain relative to Modern/ unless explicitly qualified. A path beginning
Modern/ is checkout-relative. Paths beginning .ai-runs/ always refer to the
checkout-root operational area, including in Modern documents.

Run shell commands from the checkout root and qualify Modern scripts accordingly.
Skill-local references resolve from their own Skill directory. Apply Rule globs
relative to the owning instruction root; specialized constraints are cumulative
and exceptions must be explicit. An always_apply Modern Rule stays within Modern.

Tool directories (.kilo/, .opencode/, .agents/ and other generated adapters) are
discovery bridges, not independent sources of project rules or procedures.

## Compatibility and operations

Much of HWDESKTOP targets Delphi 2006/Win32; selected DLLs use Rio 10.3.3. Identify
each affected project's compiler and source boundary. A Rio consumer does not make
shared code Rio-only. Preserve existing UI, configuration, authorization, audit
and database boundaries. Use .ai/context/hwdesktop-overview.md when the product
boundary matters.

For database work, read .ai/rules/database-safety.md and
scripts/database/schema/README.md, then search only the required schema definitions.
For migration preparation or requested production incorporation, also read
.ai/skills/database-migration/SKILL.md. Incorporation and SQL execution retain
their separate authorization boundaries.

Automation starts at _automation/README.md. Setup entry point:
_automation/ai/Sync-AIProfiles.ps1. Build parameters are in _automation/build/README.md;
SVN/Git operations are in _automation/workflow/GUIA-OPERACIONAL.md.
Follow the standing validation grants in repository-safety.md during authorized
implementation; other execution and publication need their own authority.

docs/ia-assistida/ and Modern/docs/ia-assistida/ are human documentation. Do not
load them for ordinary tasks unless documentation maintenance is requested.
Setup automation may read its technical sources in _automation/ai/tool-setup/.

New Workflow runs use .ai-runs/<run-id>/ at the checkout root, ignored by Git.
For resumed work, use its explicitly identified path and preserve its history.
Apply repository-safety.md's run isolation and search boundaries.
