---
name: database-migration
description: Create and maintain ERP database migration commands for the custom pkReestrutura migration system.
---

# Database Migration

## Purpose

Use this Skill when creating or modifying database migration commands for the ERP.

The ERP does not use one migration file per feature or release.

Database updates are managed by the custom `pkReestrutura` package, which interprets versioned SQL files, tracks executed commands, handles execution failures, and applies only the commands required by each installation.

Follow .ai/rules/database-safety.md and the owning area's conventions.
Modern/.ai/rules/database.md applies only when Modern contracts are affected.

## Select the Requested Activity

Choose the activity from the current request or assignment before applying a
procedure below.

- During feature implementation, prepare or evolve migration SQL under
  scripts/database/changes/<demand-id>/. This is the development path and needs
  the approved physical change, baseline and scope.
- Incorporate finished SQL into scripts/versoes/ only when the developer's request
  explicitly covers that activity. Use Task Inputs and Standalone Incorporation
  and the Procedure for a Production Migration Change. The paired source removal
  belongs to this incorporation path.
- Execute SQL only under its own execution authority and identified environment.

Loading this Skill, completing implementation, or refreshing the schema does not
advance from preparation to incorporation or execution. A request covering more
than one activity must establish the scope and authority for each.

## Task Inputs and Standalone Incorporation

For an incorporation request, establish the following from the developer's request
and current repository evidence:

- selected checkout, branch and task scope;
- demand identifier and exact delivery SQL files;
- preferred existing destination version file;
- required command order, dependencies and available validation/application evidence;
- authority for the paired file changes and, when granted, their local commit.

A new conversation can invoke this Skill directly with these inputs. Ask only for
missing information that affects safe incorporation. Use the task's result or
handoff to record the outcome.

A coordinating profile delegates the bounded work under .ai/agents/README.md and
the common assignment contract. A standalone task uses its own context and marks
Workflow/run/increment fields as not applicable. This also covers a separate task
for the same demand as an earlier implementation run. That run's unfinished state
does not block the task, establish SQL readiness or require automatic resumption.
When a precise evidence gap requires an identified historical artifact, apply
repository-safety.md's bounded consultation rules.

A request to resume a Workflow follows that Workflow's run and lifecycle contracts.
Preserve its history and state while performing a separate task.

## Execution Profile

Default execution profile: `fast-routine` when the approved physical schema change,
target development or production stage, and required SQL operation are complete and
the task is a direct translation into the documented `pkReestrutura` syntax.

Escalate to `balanced-work` when compatibility or interpreter behavior requires
local analysis. Schema design, destructive persistence decisions, production-data
risk, and changes to released history require `quality-critical` handling and the
applicable human approval. No execution profile grants permission to modify a
production migration file, advance its version, update CRCs, build, or execute SQL.

---

## Production Migration Files

Production version scripts are located at:

```text
scripts/versoes/
```

The active version is determined by:

```text
Ativos/dpk/manifest.txt
```

Example:

```text
027.sql=6E166B92
028.sql=689F781D
029.sql=4FEC09B0
build=72
last=029
manifest.txt=4E98B952
```

The `last` entry identifies the current migration file.

In this example:

```text
last=029
```

means the active production migration script is:

```text
scripts/versoes/029.sql
```

Read `manifest.txt` to identify the active version context. The developer may
assign different existing version files to different programmers. For an
incorporation request, obtain the preferred destination from the developer and
respect those assignments. The `last` entry supplies context rather than silently
overriding that destination.

Check the prerequisites of the delivery commands in the version scripts. If a
prerequisite is in a higher file, the affected delivery sequence must go into the
highest applicable existing version authorized for the integration. Explain the
dependency and destination. Ask only when the request leaves the destination or
another programmer's file ownership unresolved. A filename alone does not prove
the version is active, authorized or applied in a database.

---

## Version File Lifecycle

A migration file is incremental and may contain commands from multiple features and releases.

A new numbered file is NOT created for every feature or release.

The developer decides when to advance to the next numbered file. This normally happens when processing the accumulated migration history begins to noticeably increase ERP startup time.

A build process:

* discovers the version files;
* updates their CRC entries in `manifest.txt`;
* increments `build`;
* updates `last`;
* calculates the CRC of `manifest.txt`;
* embeds the resulting manifest information into `pkReestrutura.bpl`.

Creating a new numbered migration file is therefore a release/build decision and MUST NOT be done automatically by an agent unless explicitly requested.

---

## How `pkReestrutura` Processes Migrations

At ERP startup, `pkReestrutura` compares the CRCs of the packaged migration scripts with the migration state recorded in the database.

When a script CRC differs, or when the script has not previously been recorded:

1. the complete file is read;
2. the custom interpreter converts the file into individual executable commands;
3. the package compares those commands with the execution history stored in the database;
4. only commands requiring execution are processed;
5. success or failure is recorded for each command.

Previously processed commands are therefore normally ignored when additional commands are appended to the same version file.

`pkReestrutura` also handles common migration problems such as duplicate-object conditions and other recoverable execution issues.

Migration SQL SHOULD describe the intended schema change directly rather than implementing defensive existence checks that duplicate behavior already handled by `pkReestrutura`.

---

## Failure Handling

Migration commands do not need to implement the package's failure-recovery behavior.

When execution fails, `pkReestrutura` attempts to resolve the problem.

If the failure cannot be resolved:

* the failure is recorded;
* processing continues with subsequent migration commands;
* failures are logged;
* the ERP informs the user that technical support must review the migration failures.

Do not add custom SQL error-recovery logic merely to reproduce behavior already provided by `pkReestrutura`.

---

## Migration History Integrity

Commands already released to production are historical migration records.

For released commands:

* NEVER delete them;
* NEVER reorder them;
* NEVER rewrite them merely to improve formatting or naming;
* NEVER replace them with a different equivalent SQL statement.

New production commands MUST be appended after the existing released history.

If an old command must no longer execute, use the interpreter's inactive-command mechanism instead of deleting it.

Do not apply current coding or SQL formatting conventions retroactively to released migration history.

---

## Development-Time Scripts

Developers normally prepare and test migration SQL outside:

```text
scripts/versoes/
```

Development SQL is prepared and validated against an identified development/test
database under the applicable execution authority. Incorporation into version
scripts is a separately requested delivery step.

The requested task establishes the checkout, branch, source scripts and preferred
destination. Apply repository-preservation rules within that context. Prepare
the incorporation independently of any delivery sequence used by the team.

Do NOT place unfinished migration commands into the active production version file unless explicitly instructed.

### General Demand Scripts

Prepare general development migration SQL outside Modern at:

```text
scripts/database/changes/<demand-id>/
```

Read scripts/database/README.md. Verify the physical starting state against the generated
reference at scripts/database/schema/schema.sql and its provenance in
scripts/database/schema/README.md. Search only the relevant objects and dependencies;
keep already approved pending migrations distinct from that baseline. If required
schema evidence is unavailable, report the specific gap instead of inventing DDL.

Start with one migration file. Use ordered names such as 001-condicoes.sql and
002-complemento.sql when distinct increments need an explicit application order;
do not create a file per Agent message. Record the baseline, order, delivery
commands and actual validation/application status in the task's result or existing
demand notes. Keep diagnostic queries and test fixtures distinguishable from
delivery migration commands.

An unexecuted draft may be revised. SQL already applied to a shared database needs
an identifiable subsequent change; editing an old file does not update that database.
Do not execute SQL, refresh the schema snapshot, or incorporate commands into
scripts/versoes/ implicitly during implementation.

This directory contains pending incorporation work. In a requested incorporation,
append the final commands and remove their fully incorporated delivery files as
one paired change in the same commit. Check source coverage, command order,
interpreter boundaries and any test/automation consumers before removing files.
Resolve consumer references within the authorized scope or report the dependency
before completing incorporation.

The commit and Git history retain the source paths, prior content and destination.
Keep unfinished, partially incorporated or unrelated files explicit and preserved.
Apply this cleanup only to the requested general demand scripts. Specialized
development-artifact exceptions retain their own contracts.

The schema snapshot remains the primary physical reference at its extraction.
Track relevant commands that postdate that baseline, including commands already
in version files but not yet applied to the reference database. Incorporation,
database application and schema refresh are separate recorded events.

Prepare commands with the documented pkReestrutura interpreter in mind. A DDL
extraction or a script containing client directives is not automatically valid input
for that interpreter; review the statement boundaries at incorporation time.

### Fiscal.Calculos version-range scripts

The `fiscal-calculos-update` Workflow has an explicit exception to that otherwise
open location. Its approved database changes MUST be prepared in one range-scoped
development file:

```text
Modern/Scripts/SQL/rtc-<source-tag>-<target-tag>.sql
```

Preserve both exact tags, including their `v` prefix. Example:

```text
Modern/Scripts/SQL/rtc-v0029-v0039.sql
```

Use one file for the complete approved interval; do not reproduce the official
Flyway one-file-per-version naming scheme. Consult the exact tagged Java snapshots
under `source/flyway/sql/criacao/` and `source/flyway/sql/manutencao/` as directed
by the Workflow, then translate only the database changes that Modern owns.

For tables that mirror official calculator data:

- include required Firebird schema creation or alteration;
- do not include `INSERT`, `UPDATE`, or `DELETE` for mirrored rows;
- leave row population and maintenance to the external synchronization flow.

An approved data change to an ERP-owned, non-mirror table may be included when the
plan identifies and justifies it explicitly. This range file remains a development
artifact. Incorporation into `scripts/versoes/`, version selection, manifest and
CRC updates, build, and SQL execution remain outside the Workflow unless separately
authorized.

---

## Interpreter Syntax

The custom interpreter supports individual commands and explicit multi-line blocks.

### Single-Line Commands

A non-empty line outside a block is interpreted as one executable command.

Example:

```sql
ALTER TABLE CLIENTE ADD STATUS CHAR(1);
```

Empty lines are ignored.

Use single-line form when the SQL command does not require multiple lines.

---

## Multi-Line Blocks

Commands that must be executed as a single multi-line unit MUST use block markers.

Accepted opening markers:

```text
--|BLOCO|
|BLOCO|
```

Accepted closing markers:

```text
--|/BLOCO|
|/BLOCO|
```

Everything between the opening and closing marker is interpreted as one command.

Example:

```sql
--|BLOCO|
EXECUTE BLOCK AS
BEGIN
  /* multi-line command */
END;
--|/BLOCO|
```

Use blocks for constructs such as:

* `EXECUTE BLOCK`;
* triggers;
* procedures;
* other SQL that requires multiple lines to remain one executable command.

---

## `CREATE TABLE`

`CREATE TABLE` is a special interpreter case.

It does NOT require explicit `BLOCO` markers.

When the interpreter finds `CREATE TABLE`, it automatically treats the statement as one block until the closing:

```text
);
```

Example:

```sql
CREATE TABLE DFE_ALERTAS (
  ID         CHAR(36) NOT NULL,
  CHAVE_DFE  VARCHAR(44) NOT NULL,
  CMSG       SMALLINT,
  XMSG       VARCHAR(255) NOT NULL,
  CONSTRAINT PK_DFE_ALERTAS PRIMARY KEY (ID)
);
```

Primary-key and foreign-key constraints SHOULD be declared inside the `CREATE TABLE` statement when the table is created.

---

## Inactivating Historical Commands

Never delete a released command solely because it should no longer execute.

### Single-Line Command

Prefix the existing command with:

```text
CMD:INATIVO|
```

Example:

```text
CMD:INATIVO|ALTER TABLE CLIENTES ADD DATA_NASC TIMESTAMP;
```

### Block Command

Add `CMD:INATIVO|` immediately after the block opening marker.

Example:

```text
|BLOCO|CMD:INATIVO|
```

Preserve the remaining historical command content.

---

## Database Object Naming

New objects follow the applicable area conventions and .ai/rules/database-safety.md. Modern naming and UUID helpers are not imposed on unrelated legacy objects.

Additional migration naming conventions:

* Primary-key constraints: `PK_<TABLE>`
* Foreign-key constraints: `FK_<TABLE>_<REFERENCE>`

Firebird 2.5 database identifiers MUST NOT exceed **31 characters**.

When a generated constraint or object name would exceed that limit:

* shorten the semantic components while preserving recognizability;
* keep the required prefix (`PK_`, `FK_`, etc.);
* inspect existing names in the affected module and follow an established abbreviation when available;
* do not silently truncate a name into an ambiguous identifier.

When multiple foreign keys from one table reference the same target table, derive a distinct concise name from the relationship or referencing column while remaining within the identifier limit.

---

## SQL Generation Principles

When generating new migration SQL:

* assume the requested object/change does not yet exist in the source schema unless repository evidence indicates otherwise;
* write the clean schema change required to reach the desired state;
* do not add `IF NOT EXISTS`, system-table checks, or duplicate-handling logic by default;
* rely on `pkReestrutura` for its established migration execution and recovery behavior;
* use Firebird 2.5-compatible SQL;
* follow database naming and safety rules applicable to the affected component.

Use explicit defensive SQL only when the requested migration has a specific compatibility scenario that requires it.

---

## Procedure for a Production Migration Change

When explicitly asked to incorporate a finished migration into version scripts:

1. Confirm the checkout, branch, demand and current changes for the requested task.
   Use the Task Inputs and Standalone Incorporation section to resolve its scope.
2. Identify the final delivery commands, their order and validation evidence under
   scripts/database/changes/<demand-id>/. Separate diagnostic SQL and fixtures.
3. Obtain the preferred existing destination and read Ativos/dpk/manifest.txt for
   version context. Ask for a missing destination instead of assuming file ownership.
4. Trace affected-object prerequisites in the schema baseline, version files and
   relevant pending demand SQL. A prerequisite still present only in pending SQL
   must be incorporated in the approved order or reported as unresolved.
   If a prerequisite is above the preferred file, resolve the authorized higher
   destination and explain the dependency before writing.
5. Check for commands already incorporated. Preserve released commands and append
   new commands after their prerequisites without reordering historical content.
6. Adapt each delivery command to the interpreter's single-line, explicit block or
   CREATE TABLE handling. Preserve its intended behavior, Firebird 2.5 compatibility,
   identifier limits and the destination file's encoding and line endings.
7. Verify that the destination contains the complete final delivery sequence.
   Check references from tests and automation before deleting the source scripts.
   Unresolved consumers or partial incorporation remain explicit pending work.
8. Remove only the fully incorporated delivery files under the requested demand.
   Review additions and removals together. Avoid a second archive copy in changes.
9. When a commit is authorized, include the destination additions and source
   removals in that same commit. Otherwise hand off the paired diff for the
   developer to commit together. Record demand, source paths, destinations and
   reasons in the commit/handoff without creating a parallel permanent SQL copy.
10. Report incorporation and actual SQL validation separately. Runtime validation
    uses an authorized test database and the pkReestrutura path when its interpreter
    behavior is under verification. Preserve the identity of the starting state.

The build process owns manifest and CRC updates. Version advancement, compilation,
SQL execution, schema extraction and publication use their respective authorization.
Record only the incorporation and validation actually performed in this task.
