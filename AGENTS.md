# HWDESKTOP — AI working instructions

These instructions apply to this checkout and its subdirectories. They provide a small common entry point; they do not establish a uniform architecture for the legacy ERP.

## Start with the requested task

- Confirm the checkout, active branch, existing changes and the requested phase before editing. Use the working clone and demand branch selected by the developer.
- Read the functional design and relevant product context supplied for the task. Distinguish observed behavior, proposed policy, approved decisions and unverified assumptions.
- Keep investigation limited to the affected flow and its immediate dependencies. Consult the developer before starting or expanding extensive processing.
- A planning or documentation request does not authorize feature implementation, database execution, deployment or publication.

## Route by affected area

- For any work inside Modern/, read Modern/AGENTS.md and follow its selective routing through Modern/.ai/. That system remains the canonical technical guidance for Modern.
- Do not copy Modern rules here or impose its architecture on legacy code.
- Modern/docs/ia-assistida/ is human documentation, with the reading boundary defined by Modern/AGENTS.md. Do not load it automatically for ordinary coding or analysis.
- For legacy work, inspect the existing implementation and nearby examples. Establish the actual responsibilities and compiler boundary before proposing a change.
- Shared planning context and the reasons for decisions live in the separate Contexto e decisões repository. Use the locations and references supplied with the task; consult only the relevant theme and demand.

## Compatibility and preservation

- Much of the ERP is Delphi 2006/Win32; selected DLL projects use Delphi Rio 10.3.3. Identify the target from the affected projects and units. A Rio consumer does not make shared code Rio-only.
- Preserve file encoding and line endings. Do not assume all legacy files are UTF-8 or normalize directories as a side effect.
- Preserve the existing UI, configuration, permission and audit boundaries. Reuse the responsible components before creating parallel behavior.
- Keep changes within the requested scope. Do not reorganize projects or refactor unrelated legacy code to make it resemble Modern.
- Preserve unrelated local changes, ignored dependencies and personal configuration. Do not include credentials in code, documentation, tests or output.

## Database work

- Verify the relevant physical schema from a trustworthy, identified source. Entities, query text and historical migration scripts are useful evidence but do not alone establish the complete current database structure.
- If the required schema evidence is unavailable, state precisely which objects or definitions are missing; do not invent columns, constraints or database capabilities.
- Read scripts/database/schema/README.md for provenance, then search scripts/database/schema/schema.sql for the relevant objects and dependencies. Do not load the full snapshot by default or edit it to simulate an unapplied change. If the snapshot is absent or unsuitable, identify the missing evidence.
- Prepare general development SQL under scripts/database/changes/<demand-id>/; see scripts/database/README.md. Do not write scripts/versoes as part of ordinary feature implementation. Incorporation is a separately requested operation; preserve documented specialized workflow exceptions.
- The ERP uses the existing pkReestrutura migration mechanism. Its procedure is documented in Modern/.ai/skills/database-migration/SKILL.md; consult it when a task requires migration SQL.
- Development SQL, incorporation into released migration history and execution against a database are different operations. Follow the developer's task scope and the applicable migration guidance.

## Commands and version control

- Existing automation starts at _automation/README.md. Build parameters are documented in _automation/build/README.md; the SVN/Git workflow is documented in _automation/workflow/GUIA-OPERACIONAL.md.
- Choose verification appropriate to the affected code and use confirmed commands. Documentation-only preparation does not require a Delphi build or a full test run.
- Keep feature work in the working clone. SVN synchronization and delivery belong to the configured integration, under the agreed workflow.
- Do not reset, stash, discard changes, rewrite published history, switch branches or publish as an implicit part of an investigation. Respect the authorization of the current task and workflow.
