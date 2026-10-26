---
name: project-structure
description: Locate Modern's top-level modules, shared foundations, business microcontexts, adapters, infrastructure, UI, and test projects.
---

# Project Structure

## Top-Level Structure

| Directory | Responsibility |
|---|---|
| `Core/` | Shared foundation used across multiple Modern contexts, including common application, domain, and infrastructure components. |
| `Adapters/` | Shared adapter implementations used across multiple Modern contexts, including database, file, repository, and service adapters. |
| `ERP.Features/` | ERP business features grouped within the monolithic application and internally organized into business microcontexts. |
| `Fiscal.Calculos/` | Brazilian Tax Reform calculation engine for CBS, IBS, and Imposto Seletivo. |
| `Fiscal.Sinc.GovNFSe/` | Synchronization with the national NFS-e standard tables. |
| `Fiscal.Sinc.IBPT/` | IBPT table synchronization. |
| `Fiscal.Sinc.SERPRO/` | Integration with the Brazilian government's SERPRO tax calculator. |
| `Fiscal.Sinc.SICOMEX/` | SICOMEX NCM synchronization. |
| `UI/` | VCL presentation components, forms, and screens. |
| `Tests/` | DUnitX unit and integration test suite. |
| `package/` | Delphi package project containing the `pkModern.dpk` project definition; it contains no application source units. |

## Shared and Context-Specific Code

`Core/` and `Adapters/` at the repository root contain components intended for reuse
across multiple Modern contexts.

A `Shared/` subdirectory is commonly used to explicitly identify cross-context
components. Some root-level infrastructure is inherently shared by its placement
and does not use a `Shared/` subdirectory.

Business contexts such as `ERP.Features/`, `Fiscal.Calculos/`, and `Fiscal.Sinc.*`
have their own `Core/` and `Adapters/` directories for context-specific behavior
and integrations.

Prefer context-specific components unless the responsibility is genuinely shared
across multiple contexts.

## Common Context Structure

Business contexts generally follow this structure:

```text
<Context>/
├── Core/
│   ├── Application/
│   └── Domain/
├── Adapters/
│   ├── Primary/
│   └── Secondary/
└── Infrastructure/
```

The exact structure varies by context and only directories required by that context
need to exist.

### `Core/Application/`

Contains application-level orchestration and contracts, commonly organized into:

* `InputPorts/`
* `OutputPorts/`
* `Services/`
* `UseCases/`

### `Core/Domain/`

Contains business concepts and domain behavior, commonly organized into:

* `Entities/`
* `Metadata/`
* `Models/`
* `Ports/`
* `Services/`
* `Types/`
* `ValueObjects/`

### `Adapters/`

Contains implementations that connect a business context to external actors
and infrastructure.

- `Primary/` contains adapters through which external actors invoke the
  application.
- `Secondary/` contains implementations of dependencies used by the
  application, such as repositories, external services, database access,
  email delivery, and fiscal-service integrations.

ACBr and DFeDLL are examples of secondary adapters: the application invokes them
to reach external implementations. See `.ai/context/project-architecture.md` for the
project-specific classification and dependency direction.

### `Infrastructure/`

Contains context-level composition and infrastructure support such as factories,
dependency containers, and setup components.

## `ERP.Features/`

`ERP.Features/` groups multiple ERP business microcontexts inside the monolithic
application.

Business areas are separated internally by functional responsibility rather than
being promoted to independent top-level modules or independently deployed services.

This organization preserves conceptual separation between business areas while
avoiding unnecessary deployment and structural complexity for the monolithic ERP.

When locating or adding functionality, use the relevant business microcontext
inside the appropriate architectural area rather than creating a new top-level
module solely for organizational separation.

## Specialized Contexts

`Fiscal.Calculos/` has maintenance and architectural characteristics that differ
from the predominant project structure because fidelity to the official government
implementation takes precedence.

See `.ai/context/fiscal-calculos.md` for module-specific context.
