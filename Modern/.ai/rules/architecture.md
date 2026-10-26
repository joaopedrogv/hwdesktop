---
name: architecture
description: Architectural dependency, responsibility, and boundary rules for the Modern project.
always_apply: true
---

# Architecture Rules

## Business Logic and Responsibilities

- Business rules, calculations, validations, and domain decisions MUST NOT reside in UI components or event handlers.
- UI code MUST delegate business behavior to the appropriate application or domain components.
- Use-case orchestration belongs in the application layer.
- External-system and persistence implementation details belong in infrastructure/adapters.
- Do not duplicate business behavior across layers when an existing component already owns that responsibility.

## Dependency Boundaries

- Domain and application code MUST NOT depend on UI or presentation components.
- Business and application code MUST NOT depend on concrete infrastructure implementations when an established abstraction exists.
- Infrastructure implementations MAY depend on the abstractions they implement.
- UI and external entry points MAY depend on application-level components required to execute use cases.
- Do not bypass an existing abstraction merely to simplify an implementation.

When introducing a dependency, preserve the established dependency direction and avoid coupling business logic to UI or infrastructure.

## Architectural Preservation

- Preserve existing architectural boundaries unless the task explicitly requires an architectural change.
- Do not introduce new architectural patterns, reorganize layers, or perform broad structural refactoring as part of an unrelated task.
- Prefer focused changes that fit the existing architecture.
- When an implementation conflicts with an established architectural boundary, adapt the implementation rather than bypassing the boundary.

## Specialized Rules

- Database access MUST follow `.ai/rules/database.md`.
- Delphi compatibility MUST follow `.ai/rules/delphi-compatibility.md`.
- Code conventions MUST follow `.ai/rules/coding-standards.md`.
- Security-sensitive changes MUST follow `.ai/rules/security.md`.

## `Fiscal.Calculos/` Exception

`Fiscal.Calculos/` prioritizes fidelity to the official government Java implementation.

- It is not required to strictly follow the project's hexagonal architecture.
- Do not refactor it solely to conform to architectural patterns used by other modules.
- Preserve structural similarity with the official implementation when relevant for synchronization, comparison, or maintenance.
- This exception applies only to architectural conformity; other project rules still apply.