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

Do NOT infer the active file only from the highest filename. Read `manifest.txt`.

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

During development, SQL is tested against the developer's database before it is incorporated into the production version script during the release process.

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
commands, and actual validation/application status in the demand's existing plan
or notes. Keep diagnostic queries and test fixtures distinguishable from delivery
migration commands.

An unexecuted draft may be revised. SQL already applied to a shared database needs
an identifiable subsequent change; editing an old file does not update that database.
Do not execute SQL, refresh the schema snapshot, or incorporate commands into
scripts/versoes/ implicitly during implementation. Preserve the source link when
commands are incorporated so that completed scripts are not treated as pending.

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

When explicitly asked to incorporate a finished migration into the production version script:

1. Read `Ativos/dpk/manifest.txt`.
2. Resolve the value of `last`.
3. Open the corresponding file under `scripts/versoes/`.
4. Treat the existing released migration history as immutable.
5. Determine whether the new command is:

   * single-line;
   * explicit multi-line block;
   * `CREATE TABLE`.
6. Generate Firebird 2.5-compatible SQL.
7. Apply current database naming conventions to new objects.
8. Respect the 31-character identifier limit.
9. Append the new migration command without reorganizing existing commands.
10. Do not create a new numbered version file unless explicitly instructed by the developer.

The build process is responsible for updating `manifest.txt` and CRC information.
