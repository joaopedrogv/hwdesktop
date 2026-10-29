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
- Read .ai/rules/repository-safety.md for every task. For database work, also read
  .ai/rules/database-safety.md.

## Canonical guidance and routing

The shared instruction system is under .ai/. Modern-specific guidance remains in
Modern/.ai/. Metadata is defined once in .ai/metadata.md. Read each selected
canonical artifact completely before applying it.

- .ai/agents/ — shared roles, execution profiles and orchestration protocol.
- .ai/commands/ and .ai/workflows/ — shared entry points and multi-step procedures.
- .ai/skills/ — procedures shared by the ERP.
- .ai/rules/ and .ai/context/ — shared constraints and execution knowledge.
- Modern/.ai/ — additional Rules, Context, Skills, Commands and Workflows for Modern.

Start from an explicitly invoked Command; otherwise select a matching Workflow or
Skill. A bounded maintenance task does not automatically require a full feature
Workflow. Agents may handle explicit bounded assignments under their role contracts.
When a Workflow requires role separation, follow .ai/agents/README.md and
.ai/agents/orchestration-protocol.md; do not impersonate an unavailable Specialist.

For any scope in Modern/, also read Modern/AGENTS.md. Load its applicable Rules and
only the Context and Skills needed by that scope. Do not load Modern's architecture,
naming, Use Case, persistence, UI or testing conventions for exclusively legacy work.
For legacy work, inspect the existing implementation and nearby examples before
proposing changes. A cross-area task uses each area's guidance for its own files.

Read the supplied functional design and relevant product context. Distinguish
observed behavior, proposals, approved decisions and unverified assumptions.
Context and reasons for decisions live in the separate Contexto e decisões
repository; consult the relevant theme and demand through the supplied references.

## Paths and Rule scope

Paths in shared .ai/ documents are relative to this checkout root. Paths in
Modern/.ai/ documents remain relative to Modern/ unless explicitly qualified.
A path beginning Modern/ is checkout-relative. Paths beginning .ai-runs/ always
refer to the checkout-root operational area, including in Modern documents.

Run shell commands from the checkout root and qualify Modern scripts accordingly.
Skill-local references resolve from their own Skill directory.

Apply Rule globs relative to the owning instruction root. An always_apply Rule
applies within that root's scope: root Rules cover the checkout, while Modern
Rules are loaded only for work involving Modern. Specialized constraints are
cumulative; exceptions must be explicit.

Tool directories (.kilo/, .agents/ and other generated adapters) are discovery
bridges, not independent sources of project rules or procedures.

## Compatibility and preservation

Much of HWDESKTOP targets Delphi 2006/Win32; selected DLLs use Delphi Rio 10.3.3.
Identify the compiler from the affected project and source boundary. A Rio consumer
does not make shared code Rio-only. Modern has its own precise compatibility rule;
do not assume its file-marker or Tests/ convention describes every legacy project.

Preserve established UI, configuration, authorization, audit and database boundaries.
Do not reorganize projects or introduce broad architecture changes incidentally.
Do not infer that unrelated projects in this polluted checkout share the ERP stack.
Use .ai/context/hwdesktop-overview.md when that product boundary matters.

## Database work

Identify the physical starting state. Read scripts/database/schema/README.md, then
search only the required definitions in scripts/database/schema/schema.sql.
Prepare general demand SQL in scripts/database/changes/<demand-id>/.
Do not edit scripts/versoes implicitly; production incorporation is separately
requested. Read .ai/skills/database-migration/SKILL.md when preparing migration SQL.
Schema extraction, SQL execution and integration tests require their own authority.

## Human documentation and operations

docs/ia-assistida/ and Modern/docs/ia-assistida/ are human documentation. Do not read,
search or use them for ordinary coding, analysis or Workflow execution unless the
developer explicitly requests documentation maintenance. Setup automation may read
its technical sources in _automation/ai/tool-setup/ without loading human guides.

Automation starts at _automation/README.md. Setup entry point:
_automation/ai/Sync-AIProfiles.ps1. Build parameters are in _automation/build/README.md;
SVN/Git operations are in _automation/workflow/GUIA-OPERACIONAL.md.

Use checks appropriate to the change. Build, test execution, SQL, deployment and
publication are separate authorizations. Keep feature work in the working clone.
Do not reset, stash, discard work, rewrite history, switch branches or publish as an
implicit investigation step.

New Workflow runs use .ai-runs/<run-id>/ at the checkout root, ignored by Git.
Preserve historical run directories and evidence. When resuming an older run,
identify its actual path explicitly; do not relocate it or replace its history
automatically.
