---
name: testing
description: Mandatory safety, isolation, compatibility, and ownership rules for automated tests in Modern.
applies_to:
  - "Tests/**/*.pas"
  - "Tests/**/*.dpr"
  - "Tests/**/*.dproj"
  - "Tests/**/*.groupproj"
---

# Testing Rules

## Test Compatibility

- Test source files MUST follow `.ai/rules/delphi-compatibility.md`.
- Files under `Tests/` target Delphi Rio 10.3.3.
- Production units consumed by tests MUST NOT be modified to use Delphi Rio-only features merely because a test project uses Delphi Rio.

## Project Boundaries

- ERP unit tests MUST belong to `Tests/ERP.UnitTests/`.
- ERP integration tests MUST belong to `Tests/ERP.IntegrationTests/`.
- Tests specific to `Fiscal.Calculos` MUST belong to `Tests/Fiscal.Calculos.Tests/`.
- `Tests/Common/` MUST contain only support code genuinely shared by multiple test projects and MUST NOT become a generic dumping ground for project-specific test code.

## Unit Test Isolation

Tests under `ERP.UnitTests` MUST NOT depend on:

- a real database;
- `test-config.json`;
- `SetupTestUnit`;
- `ModernInitialize`;
- the application Container;
- VCL forms or other UI runtime infrastructure;
- uncontrolled external services.

Dependencies required by a unit test MUST be supplied through the existing dependency boundaries using test doubles or simple test-specific implementations.

Do not introduce a dependency-injection or mocking framework solely to make a unit test possible unless the task explicitly requires that architectural change.

## Integration Test Safety

- Integration tests MAY use real project infrastructure when the integration itself is under test.
- Tests that write to a database MUST use a database intended for testing.
- Automated tests MUST NOT write to, modify, reset, or depend on production data.
- Test configuration and fixtures MUST follow `.ai/rules/security.md`.
- Real secrets, credentials, private certificates, or unnecessary personal data MUST NOT be committed in test configuration, fixtures, examples, or expected outputs.
- Setup and configuration SHOULD remain local to the owning test project unless shared behavior is genuinely established across projects.

## Test Doubles

- Inspect the actual dependency declaration before implementing a test double. Do not infer that a type is a Delphi `interface` only because its name starts with `I`.
- Test doubles SHOULD fail on unexpected infrastructure calls when practical.
- Do not reproduce substantial production logic inside a test double merely to make a test pass.

## Object Ownership

- Tests MUST preserve the ownership semantics of production code.
- Before creating or destroying objects in Setup/TearDown, determine which component owns each dependency and returned object.
- The test MUST NOT free an object that production code has already taken ownership of or destroyed.
- When an object is destroyed before its effects can be asserted, use an external observable state or equivalent test mechanism rather than changing production ownership solely for the test.

## Test Behavior

- Tests SHOULD verify observable behavior and relevant interactions rather than private implementation details.
- A test MUST NOT depend on execution order, shared mutable state, or data left behind by another test unless it is explicitly designed as part of an integration sequence.
- Do not weaken production validation, transaction handling, security, or architectural boundaries merely to make code easier to test.

## DUnitX Conventions

- Test fixtures MUST use the `[TestFixture]` attribute.
- Test methods MUST use the `[Test]` attribute.
- Each fixture MUST be registered with `TDUnitX.RegisterTestFixture` in its unit initialization section.
- Tests MUST remain independently executable and MUST NOT depend on fixture or method execution order.

## Existing and Specialized Tests

- Preserve existing regression and conformance behavior in `Fiscal.Calculos.Tests`.
- Do not move `Fiscal.Calculos`-specific fixtures, models, or resources into shared test infrastructure merely for structural symmetry.
- Do not reorganize or rewrite unrelated existing tests merely to conform to the newer test-project structure.
