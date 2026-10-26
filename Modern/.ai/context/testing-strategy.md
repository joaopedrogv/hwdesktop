---
name: testing-strategy
description: Select the appropriate Modern test project and scope, including ERP unit and integration tests and the specialized Fiscal.Calculos strategy.
---

# Testing Context

## Purpose

This document describes the testing architecture and strategy used by `Modern`.

It provides project-specific context for deciding which kind of test should be
created and how automated tests relate to production code.

Detailed procedures for implementing test doubles or individual test fixtures
belong to specialized Skills and are not duplicated here.

## Test Projects

Automated tests are implemented with DUnitX under:

`Tests/`

Files inside `Tests/` target Delphi Rio 10.3.3 according to
`.ai/rules/delphi-compatibility.md`.

Production units consumed by test projects retain their own compatibility target.
A Delphi 2006-compatible production unit does not become Delphi Rio-only because
it is referenced by a Delphi Rio test project.

The test architecture is divided into three projects with different responsibilities:

```text
Tests/
├── TestsModernGroup.groupproj
├── Common/
├── ERP.UnitTests/
├── ERP.IntegrationTests/
└── Fiscal.Calculos.Tests/
```

### `ERP.UnitTests`

Contains isolated unit tests for ERP behavior.

Typical targets include:

- Use Cases;
- Validation Factories;
- Domain/Application Services;
- other behavior that can be isolated from infrastructure.

This project SHOULD remain independent from:

- a real database;
- `SetupTestUnit`;
- `test-config.json`;
- `ModernInitialize`;
- the application Container;
- VCL forms;
- uncontrolled external services.

### `ERP.IntegrationTests`

Contains ERP tests that require real project infrastructure.

Typical targets include:

- repository SQL and mapping;
- synchronization flows;
- infrastructure adapters;
- integration behavior that depends on Firebird or application setup.

This project MAY use:

- `SetupTestUnit`;
- the application Container;
- `ModernInitialize`;
- `test-config.json`;
- a Firebird test database;
- real infrastructure implementations.

### `Fiscal.Calculos.Tests`

Contains the complete specialized test strategy for `Fiscal.Calculos`.

It may contain:

- unit tests;
- integration tests;
- regression/conformance tests based on official calculator scenarios and known
  input resources.

This project is organized by the responsibility being tested rather than by a
single test level.

Its specialized regression/conformance strategy MUST remain independent from the
default ERP feature-testing strategy.

### `Common`

`Tests/Common/` is reserved for test-support code that is genuinely shared by
multiple test projects.

Place an artifact in `Common/` only when:

- at least two test projects consume it; and
- it does not semantically belong to one specific test project.

Do not use `Common/` as a generic utility directory.

Project-specific test models, builders, fixtures, resources, and helpers SHOULD
remain inside the project that owns them.

## Testing Strategy

Prefer the smallest test scope that can reliably verify the behavior being changed.

The default strategy for new ERP features is:

| Component | Default Test Type |
|---|---|
| Validation Factory | Unit |
| Domain/Application Service | Unit |
| Use Case | Unit |
| Repository | Integration |
| Synchronization / infrastructure flow | Integration |
| `TDataSetGrid` | Integration when query/filter behavior justifies it |
| Forms / UI | Manual smoke testing initially |

These are defaults, not absolute classifications.

A component MAY require another test level when its value depends primarily on
integration behavior.

`Fiscal.Calculos` follows its own specialized test strategy.

## Unit Tests

Unit tests SHOULD isolate the behavior under test from infrastructure.

Dependencies SHOULD be provided directly to the tested class through its existing
constructor or other established dependency boundary.

Use Cases SHOULD be unit-tested by default when their orchestration can be
isolated through their dependency abstractions.

When creating or extending an isolated ERP Use Case test, follow:

`.ai/skills/delphi-usecase-testing/SKILL.md`

Typical Use Case tests verify:

- returned result;
- validation failure;
- important dependency calls;
- parameters passed to dependencies;
- transaction outcome;
- behavior when a dependency fails.

Test observable behavior rather than internal implementation details.

## Test Doubles

Use simple project-owned test doubles when infrastructure must be isolated.

Common roles include:

- Fake: provides a small functional implementation;
- Stub: returns configured values;
- Spy State: records calls or state that must remain observable.

Do not require a mocking framework or dependency-injection container merely to
create unit tests.

Some project types use an `I` prefix but are abstract classes rather than Delphi
interfaces. Inspect the actual declaration before implementing a test double.

Unexpected calls in a test double SHOULD fail the test when practical. This helps
detect new unintended infrastructure coupling.

## Object Ownership

Delphi object ownership MUST be considered when designing tests and test doubles.

Before creating Setup/TearDown logic:

- inspect who owns injected dependencies;
- inspect who owns objects returned by repositories/services;
- inspect whether production code frees a dependency;
- avoid freeing the same object from both production code and the test.

When production code destroys a dependency before assertions can inspect it,
use an external Spy State or equivalent object whose lifetime is controlled by
the test.

## Integration Tests

Integration tests verify behavior that depends on real infrastructure.

Repository tests SHOULD prefer real Firebird-compatible execution when the
important behavior is SQL, mapping, persistence, or transaction integration.

Avoid replacing repository SQL with mocks when doing so removes the behavior the
test is intended to verify.

Both `ERP.IntegrationTests` and `Fiscal.Calculos.Tests` MAY require database or
application setup when their integration scenarios depend on it.

Do not assume that both projects require identical setup. Keep project-specific
setup local unless repeated shared behavior justifies extraction to `Common/`.

## Test Database

Integration tests that write data SHOULD use a database intended for testing.

Tests MUST NOT rely on the safety of a database merely because its local path or
environment happens to be used by a developer.

The test database and configuration should be safe to reset or modify without
risk to production data.

Local test configuration may contain environment-specific values and should be
treated according to `.ai/rules/security.md`.

## Test Setup

`SetupTestUnit` and equivalent application initialization belong to
integration-oriented test projects.

Do not use integration setup automatically in `ERP.UnitTests`.

A test that requires full application initialization should be considered an
integration test unless there is a specific reason otherwise.

Project-specific setup MAY exist independently in `ERP.IntegrationTests` and
`Fiscal.Calculos.Tests`.

Extract setup into `Common/` only after genuinely shared behavior is established.

## Test Structure

The target structure is:

```text
Tests/
├── TestsModernGroup.groupproj
├── Common/
│
├── ERP.UnitTests/
│   ├── ERPUnitTests.dpr
│   ├── ERPUnitTests.dproj
│   ├── Application/
│   │   └── UseCases/
│   ├── Domain/
│   │   ├── Services/
│   │   └── Validation/
│   └── Support/
│       └── Fakes/
│
├── ERP.IntegrationTests/
│   ├── ERPIntegrationTests.dpr
│   ├── ERPIntegrationTests.dproj
│   ├── Repositories/
│   ├── Synchronization/
│   ├── Infrastructure/
│   ├── resources/
│   └── SetupTestUnit.pas
│
└── Fiscal.Calculos.Tests/
    ├── FiscalCalculosTests.dpr
    ├── FiscalCalculosTests.dproj
    ├── UnitTests/
    ├── IntegrationTests/
    └── resources/
```

This is a target organization, not a requirement to rewrite existing tests
immediately.

New tests SHOULD be placed according to this structure.

Do not reorganize unrelated existing tests merely to enforce directory symmetry.

Promote repeated setup, builders, Fakes, or helpers into reusable support only
after repetition demonstrates that the abstraction is useful.

## Test Naming

Test names SHOULD describe expected behavior or scenario.

Prefer names such as:

```text
DeveFalharQuandoNFSeNaoEstaAutorizada
DeveExecutarRollbackQuandoDependenciaFalha
```

Avoid generic names such as:

```text
Test1
TestExecutar
TestMetodoX
```

## Feature Development

Testing should be planned together with the feature rather than postponed until
the end.

A feature plan SHOULD identify, when applicable:

- Use Case unit tests;
- validation unit tests;
- Service unit tests;
- repository integration tests;
- infrastructure integration tests;
- manual UI smoke scenarios.

During incremental feature implementation, tests should be created or updated
alongside the corresponding functional increment.

The feature workflow may revisit the testing plan when implementation reveals new
Services, repositories, validations, or integration boundaries.

## UI Testing

Automated VCL form testing is not a current default strategy.

Forms may depend on legacy inheritance, `.dfm` structure, events, visual
components, and runtime behavior that make generic automation expensive.

For now:

- keep business logic outside forms;
- unit-test the underlying Use Cases, Services, and validations;
- integration-test dataset/query behavior when valuable;
- perform manual smoke validation of the UI.

This strategy may be revisited when a stable and cost-effective UI test pattern
is established.

## `Fiscal.Calculos`

`Fiscal.Calculos.Tests` preserves the specialized testing strategy of the official
calculator implementation.

Known-input regression/conformance tests and their resources belong to this
project, together with any unit or integration tests specific to the calculator.

During an official-version update, `implementation-evidence.json` supplies the
official tests associated with each `change_id`, including status, fixtures, input,
expected result, and proven behavior. Treat added, modified, removed, and unchanged
official tests according to their status. Keep pipeline-suggested regression tests
separate from official scenarios.

Do not move calculator-specific test models or resources into `Common/` merely
because another test project could technically reference them.

Do not require unrelated ERP features to adopt the same input/resource model
unless it is appropriate for their behavior.

## Test Execution

Each test project SHOULD be independently buildable and executable.

Command-line build and execution are available for `ERP.UnitTests` through:

`Tests/Automation/Invoke-ERPUnitTests.ps1`

Agents should follow `.ai/skills/delphi-test-runner/SKILL.md` when the developer
requests or authorizes build or execution.

The automation uses the `CI` configuration, preserves the process exit code, and
writes NUnit XML results under `Tests/TestResults/`.

Command-line automation is intentionally project-specific.
`Fiscal.Calculos.Tests` is available through:

`Tests/Automation/Invoke-FiscalCalculosTests.ps1`

Follow `.ai/skills/delphi-fiscal-calculos-test-runner/SKILL.md`. Building requires
explicit authorization. Executing the complete suite additionally requires explicit
authorization and confirmation of safe test infrastructure because it includes
integration behavior. `ERP.IntegrationTests` has no canonical CLI automation and
must not be executed implicitly.

The broader target direction remains command-line execution without the IDE, with:

- command-line build;
- command-line test execution;
- reliable process exit code;
- machine-readable test output.

`TestsModernGroup.groupproj` MAY be used to build the test projects together, but
each project should preserve an independent responsibility and executable test
scope.

Local automation should be established before relying on CI as the only way to
execute tests.

Tooling details for building/running tests belong to a dedicated procedure,
script, or Skill rather than this context file.
