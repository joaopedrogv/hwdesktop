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

- `CalculadoraApiReader` for calculator fiscal data obtained through the API;
- `NCMJsonReader` for SICOMEX JSON data;
- `IbptCsvReader` for IBPT CSV data;
- `TabelasFiscaisNFSeCsvReader` for GovNFSe CSV data;
- `ERPWriter` as the Firebird Writer for the corresponding ERP tables.

The developer confirmed on 2026-10-28 that the calculator API replaced the former
`CalculadoraReader` / SQLite `calculadora.db` flow. The file synchronization Use
Case ignores a residual `calculadora.db` manifest entry without downloading,
hashing, or scheduling removal of that file. Do not infer an active SQLite import
from remaining adapters or old distribution manifests.

API, JSON, and CSV sources use protocol- or format-specific adapters and do not
require an external database connection. An approved external-database source
would require a separate connection through `IDatabaseConnectionFactory`.

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

File-based synchronization records downloaded-file hashes. The presence of API
version-control components does not by itself establish the canonical strategy for
handling incompatible external schema or format versions; that strategy remains
unresolved. Until it is defined, a detected
source-contract change must be raised to the developer before adapting or importing
the new version.

This open issue is non-blocking for the current AI architecture. Raise it to the
developer only when a task encounters source-contract versioning or incompatibility.
