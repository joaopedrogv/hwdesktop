---
name: fiscal-calculos
description: Preserve behavioral conformity with the official SERPRO Java implementation when maintaining the Delphi Fiscal.Calculos module.
---

# Fiscal.Calculos Context

## Purpose

`Fiscal.Calculos/` is the Delphi implementation of a Java calculation engine
maintained by SERPRO (Serviço Federal de Processamento de Dados) for the
Brazilian Federal Government.

The module was converted from the official Java implementation to Delphi.

Its primary objective is behavioral conformity with the government
implementation: for equivalent inputs, the Delphi implementation should
produce the same calculation results as the official Java code.

## Source of Truth

The official Java implementation is the reference for the calculation behavior
implemented in `Fiscal.Calculos/`.

Structural similarity with the Java source may be intentionally preserved when
it facilitates comparison, synchronization, or validation against the official
implementation.

Official versions are identified by exact tags in the canonical GitHub
`calculadora-rtc-mirror` repository. The update Workflow acquires only the required
tags into its operational run and keeps immutable tagged copies available for
bounded evidence consultation. It does not depend on a developer-machine checkout
and never mutates the remote repository.

The canonical GitHub `calculadora-rtc-conformidade` repository publishes the
pipeline's matched implementation package under
`reports/<source-tag>-<target-tag>/`:

- `implementation-evidence.json` is the primary structured contract consumed by
  the Modern update Workflow;
- `implementation-guide.md` is the human-readable guide for review and tracking.

The structured contract already contains complete delta coverage, consolidated
functional changes, behavioral contracts, dependencies, file hunks, and associated
official tests. The Modern Workflow maps each reported `change_id` to the current
Delphi implementation. It does not repeat the official-version diff, triage,
grouping, deep analysis, functional-change discovery, or test association.

Tagged Java snapshots remain available for bounded consultation of source paths and
hunks referenced by the selected change. They are not used for a second exhaustive
comparison. Other pipeline reports and its GitHub Issue are not required by the
Modern update process.

## Official Database Migration Evidence

The tagged Java snapshots contain the calculator's official Flyway SQL under:

```text
source/flyway/sql/criacao/
source/flyway/sql/manutencao/
```

For a version-range update, these directories are the authoritative supporting
evidence for the calculator database shape and its maintenance semantics:

- use the target tag's `criacao/` scripts only when the resulting definition of an
  affected object must be understood;
- inspect the `manutencao/` scripts whose version is after the source tag and up to
  and including the target tag for database changes in the approved interval;
- keep the consultation bounded to affected objects and approved changes rather
  than performing another repository-wide comparison;
- classify each relevant statement before translating it to Modern as schema,
  externally synchronized mirror data, or ERP-owned data.

The Java Flyway scripts are evidence, not files to copy mechanically. Their SQL
dialect, migration engine, schema layout, and data-delivery responsibilities may
differ from Modern.

## Mirror Table Population

Rows in ERP tables that mirror official calculator data are supplied by the
external calculator synchronization flow, currently from the distributed
`calculadora.db` through `CalculadoraReader` and `ERPWriter`. They are not seeded or
maintained by ERP migration `INSERT`, `UPDATE`, or `DELETE` commands.

An RTC update may still require migration SQL to create or alter the Firebird
schema of a mirror table. Data-manipulation statements from the Java migrations
describe the source data that synchronization must eventually reproduce; they do
not authorize equivalent DML in the ERP migration script.

Data changes for ERP-owned, non-mirror tables remain a separate case. When they are
required for behavioral conformity, the plan must identify them explicitly and
justify their translation into an ERP development migration.

## Conformance Tests

`Fiscal.Calculos.Tests` reproduces the applicable official Java calculator tests in
Delphi. When an official version adds or changes a relevant test, its scenario,
input, expected output, and observable semantics should be reproduced in the Delphi
suite. The Java tests are not executed as part of the Modern update process.

## Architecture

`Fiscal.Calculos/` is not intended to strictly conform to the predominant
hexagonal architecture used by other Modern contexts.

Although the module contains `Core/` and `Adapters/` directories, their presence
does not imply that the Java implementation should be reorganized to fit the
project's architectural conventions.

The current structure exists primarily to integrate the converted calculation
engine with Modern. In particular, the Java implementation uses controllers,
which influenced how the Delphi module exposes and invokes its functionality.

Behavioral conformity with the official implementation takes precedence over
architectural conformity within this module.
