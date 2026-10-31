# Modern — AI working instructions

These instructions supplement ../AGENTS.md for work involving Modern/. The shared
roles, process and metadata are maintained at the HWDESKTOP root; Modern/.ai/
remains the canonical source of module-specific constraints and knowledge.

## Authority and routing

Follow the developer's requested phase, scope and authorization. A planning or
documentation task does not authorize feature implementation, build, tests, SQL
execution, setup application or publication.

Start with the root routing. Use ../.ai/metadata.md when routing or maintaining
artifacts, and read each selected artifact completely. Preserve any explicit
minimal-context exception defined by a selected specialized Workflow. Shared categories, role contracts and approval
gates are not duplicated here.

For Modern work, load Rules from .ai/rules/ under the shared metadata semantics:
always_apply applies within Modern; applies_to patterns are relative to Modern;
Rules without those fields are selected by relevance. Load only the Context and
Skills needed by the affected flow. Do not broaden their scope to legacy files
merely because a Modern feature calls the legacy ERP.

Architecture and security Rules apply to every Modern task. Delphi compatibility,
coding standards, database and testing Rules apply according to their scope.
Fiscal.Calculos has an explicit architectural and naming exception; load its
specialized guidance when that module is affected.

## Paths

Paths in Modern/.ai/ are relative to Modern/ unless otherwise stated.
Shared canonical sources are referenced through ../.ai/. A path starting Modern/
is relative to the HWDESKTOP root.

Operational paths beginning .ai-runs/ are always relative to the HWDESKTOP root.
Shell commands run from that root: Scripts/... in a Modern document therefore
means Modern/Scripts/... at invocation time. Resolve Skill-local references from
the Skill directory. Do not change working directories merely to redefine a run
or installation target.

## Boundaries and preservation

Preserve the module's compiler boundaries, dependency direction, ownership,
transactions, authorization and audit integration. Modern's conventions do not
automatically apply to the rest of the ERP.

Use repository evidence; do not invent APIs, schema, types or conventions.
Keep investigation local and consult before expanding extensive processing.
Preserve encoding, line endings and unrelated developer work.

## Human documentation

docs/ia-assistida/ and ../docs/ia-assistida/ are human-facing support. Completely
ignore them during ordinary coding, analysis and Workflow execution unless the
developer explicitly requests documentation maintenance. Technical setup sources
live outside those guides, under ../_automation/ai/tool-setup/.
