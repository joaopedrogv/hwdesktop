---
name: technology-stack
description: Understand Modern's Delphi compiler boundaries, Win32 runtime, Firebird 2.5 operational database, and calculator API integration.
---

# Technology Stack

## Scope

This context records technology choices that constrain implementation decisions.
It is not a catalog of every package or third-party library referenced by a project.

Load specialized context for details about testing, UI integration, fiscal modules,
or other bounded concerns.

## Delphi and Runtime

The legacy ERP is composed of 47 packages, including `pkModern`. All ERP packages
are compiled with Delphi 2006 for Win32.

Production units are therefore Delphi 2006-compatible by default, as defined in
`.ai/rules/delphi-compatibility.md`.

The `hw.nfe.dx` DLL is compiled with Delphi Rio 10.3.3 and reuses source units from
`Modern`. A unit being consumed by the Rio DLL does not by itself permit Rio-only
language features or dependencies. Rio-specific code must remain inside the
explicit compatibility boundaries defined by the rule.

The presentation layer uses VCL and integrates with the legacy ERP. See
`.ai/context/ui-integration.md` for its project-specific boundary.

## Operational Database

Firebird 2.5 is the only supported version and the only supported operational
database for the ERP.

Firebird access uses IBX behind the project's `IDatabaseConnection` and
`ITransaction` abstractions. Business, domain, and application code must depend on
those abstractions rather than on IBX components.

SQL and persistence constraints are defined in `.ai/rules/database.md`.

## Calculator API and Former SQLite Integration

The calculator's fiscal data is synchronized through the API using
`CalculadoraApiReader`. The developer confirmed on 2026-10-28 that this flow
replaced the former `CalculadoraReader` / SQLite `calculadora.db` import.

The file synchronization Use Case ignores a residual `calculadora.db` entry in
the distribution manifest; its presence does not reactivate the database import.
The operational ERP database remains Firebird 2.5.

Remaining SQLite or ZeosLib adapters are not evidence that the former flow is
still active, nor approval to use SQLite as an alternative ERP database. Any
proposed SQLite use or reactivation requires developer consultation and explicit
approval before design or implementation proceeds. No adapter removal is implied
by this documentation update.

## Evolution of the Stack

New features are expected to fit the established stack. A requirement that cannot
be met within it does not implicitly authorize a new technology, database,
platform, or a broader Delphi Rio compatibility boundary.

When such a constraint is encountered, the agent must present:

- the unmet requirement and why the current stack does not satisfy it;
- feasible alternatives within and outside the current stack;
- compatibility, deployment, maintenance, and migration impacts.

The developer decides whether to preserve the current approach, use the Rio DLL as
an integration boundary, or approve an explicit evolution of the stack.
