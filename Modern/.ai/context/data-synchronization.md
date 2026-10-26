---
name: data-synchronization
description: Understand Modern's established Reader-Service-Writer pattern, external identifier ownership, and transaction boundaries for data synchronization and import.
---

# Data Synchronization and Import

## Scope

This context describes the established Modern pattern for importing data maintained
by external authoritative sources. Mandatory persistence, connection, identifier,
and transaction constraints remain in `.ai/rules/database.md`.

## Established Flow

The current fiscal-data synchronization composes the following responsibilities:

```text
External source
      ↓
Specialized Reader
      ↓
Synchronization Service
      ↓
ERP Writer
      ↓
Firebird under the Use Case transaction
```

The Reader adapts the external representation. The synchronization Service
coordinates source-to-domain transfer. The Writer persists the resulting data in
the ERP without taking ownership of the application transaction.

Reader and Writer Ports are preferred for new synchronization or import flows, but
they are not mandatory ceremony for a small operation whose approved design does
not benefit from separate Ports.

## Current Sources and Adapters

The fiscal synchronization currently uses:

- `CalculadoraReader` for the SERPRO SQLite `calculadora.db`;
- `NCMJsonReader` for SICOMEX JSON data;
- `IbptCsvReader` for IBPT CSV data;
- `TabelasFiscaisNFSeCsvReader` for GovNFSe CSV data;
- `ERPWriter` as the Firebird Writer for the corresponding ERP tables.

The SQLite source receives a separate `IDatabaseConnection` created through
`IDatabaseConnectionFactory`. JSON and CSV sources use format-specific adapters and
do not require a database connection.

The application Use Case coordinates download, temporary-file cleanup, manifest
hashes, and the operational Firebird transaction. Concrete Readers and Writers are
composed at the infrastructure boundary.

## External Identifier Ownership

SERPRO, SICOMEX, IBPT, GovNFSe, and similar providers own the meaning and lifecycle
of the identifiers in the data they publish. Their identifiers are preserved by
default, including integer, natural, or domain identifiers that differ from
Modern-generated UUID primary keys.

Do not infer that an externally synchronized table should receive a generated UUID
merely because new Modern-owned UUID primary keys use `CHAR(36)`. Before changing a
source identifier or mapping, investigate update semantics, references, deletion
behavior, and compatibility with future source versions.

## Source Version Compatibility

The current synchronization records downloaded-file hashes, but the canonical
strategy for handling incompatible schema or format versions published by an
external source is still unresolved. Until that strategy is defined, a detected
source-contract change must be raised to the developer before adapting or importing
the new version.

This open issue is non-blocking for the current AI architecture. Raise it to the
developer only when a task encounters source-contract versioning or incompatibility.
