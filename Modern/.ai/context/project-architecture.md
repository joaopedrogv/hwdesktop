---
name: project-architecture
description: Understand Modern's hexagonal boundaries, adapter classification, composition boundary, and the Fiscal.Calculos architectural exception.
---

# Project Architecture

## Overview

`Modern` is the modern and decoupled ecosystem of the legacy ERP.

The codebase primarily follows Hexagonal Architecture (Ports and Adapters),
with principles from Clean Architecture and Domain-Driven Design (DDD).

The architectural goal is to isolate business rules from external libraries,
infrastructure concerns, UI components, and the legacy ERP.

## Adapter Classification in the Current Codebase

For new code, classify adapters by dependency direction rather than by the external
technology involved:

- a primary adapter receives a request from an external actor and invokes an
  application input port or use case;
- a secondary adapter implements a dependency that the application invokes, such
  as a repository, database connection, file reader, external service, email
  sender, or fiscal integration.

The existing `Adapters/Secondary/`, `ERP.Features/Adapters/Secondary/`, and
`Fiscal.Sinc.*/Adapters/Secondary/` directories follow the secondary definition.
Their implementations satisfy application or domain dependencies for persistence,
reading, writing, execution, and external services.

Two representative integrations are:

- `ERP.Features/Adapters/Secondary/ACBr/`, which implements email delivery and
  NFSe transmission through ACBr;
- `ERP.Features/Adapters/Secondary/DFeDLL/`, which provides facades and import
  declarations for operations exported by the legacy `hw.nfe.dx.dll` and invoked
  by the ERP.

Both are secondary because the application invokes them as external dependencies.
The fact that another executable or DLL exports the called operation does not make
the importing adapter primary.

For a new outbound integration, prefer an application-owned port and a
`Secondary` implementation.

`Infrastructure/` remains the composition boundary where concrete adapters are
normally created and connected to application contracts.

## Architectural Exceptions

`Fiscal.Calculos/` intentionally differs from the predominant architecture
because fidelity to the official government implementation takes precedence.

See `.ai/context/fiscal-calculos-context.md` for module-specific context.
