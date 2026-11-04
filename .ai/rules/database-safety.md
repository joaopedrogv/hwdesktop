---
name: database-safety
description: Preserve Firebird compatibility, identified schema evidence, migration history and execution boundaries for the HWDESKTOP operational database.
---

# HWDESKTOP Database Safety

## Scope and compatibility

These rules concern HWDESKTOP's operational database and migration process. They
do not assert that every unrelated project in the checkout uses the same engine.

- ERP operational SQL must remain compatible with Firebird 2.5. Verify uncertain
  features; do not introduce features available only in later versions.
- Preserve the engine established for the affected component. New technology or
  SQLite introduction/reactivation requires explicit developer approval.
- Follow the owning area's naming and data-access conventions. Modern's
  IDatabaseConnection, ITransaction and repository contracts remain in Modern.

## Physical reference

- Read scripts/database/schema/README.md for provenance, then search the affected
  objects and dependencies in scripts/database/schema/schema.sql.
- Do not load the entire snapshot by default or edit it to simulate unapplied DDL.
- Code, historical migrations and a source-control revision do not prove the
  current physical schema. Identify missing or stale evidence before relying on it.
- A schema reference does not require customer records, a physical database copy
  or unrestricted live access for the Agent.

## Changes and execution

- Do not invent tables, columns or database capabilities.
- Create, alter, rename or drop objects only within the requested change.
  Consider existing data and deployed installations for destructive operations.
- Prepare general demand SQL under scripts/database/changes/<demand-id>/, separate
  from the generated schema and released history. This area contains migrations
  pending incorporation. A refreshed schema alone does not authorize their removal.
- Do not execute SQL, extract a new schema, or run integration tests implicitly.
- Runtime values must be parameterized; preserve existing query semantics and
  company isolation unless the approved change explicitly modifies them.

## Released migration history

- Released commands must not be deleted, reordered or rewritten for modernization.
- Production incorporation is separately requested. Use
  .ai/skills/database-migration/SKILL.md to select the developer's preferred
  existing version file and verify prerequisites in higher files before appending.
  A required higher destination must respect the team's file assignments.
- Incorporation and removal of fully incorporated delivery scripts from the
  requested changes/<demand-id>/ scope form one change and one commit. Verify
  delivery coverage and consumer references before removal. Git history preserves
  the preparation artifacts. Keep pending or partially incorporated work explicit.
- Record incorporation separately from actual database application. Schema
  provenance determines which incorporated commands still postdate the snapshot.
- Do not advance migration versions, change manifest/CRC data or build packaging
  merely because a development migration was prepared.
- Preserve explicit specialized development-artifact exceptions, including the
  Fiscal.Calculos version-range procedure under Modern/.ai/.
