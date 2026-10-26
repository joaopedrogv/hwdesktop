---
name: delphi-usecase-testing
description: Create or extend isolated DUnitX unit tests for Modern Delphi Use Cases under Tests/ERP.UnitTests, including project-owned test doubles, ownership-safe fixtures, transaction assertions, and project registration. Do not use for repositories, real infrastructure, UI, or Fiscal.Calculos-specific tests.
---

# Delphi Use Case Testing

## Purpose

Use this Skill to create or extend isolated unit tests for ERP Use Cases in:

`Tests/ERP.UnitTests/Application/UseCases/`

Project Rules remain authoritative, especially:

- `.ai/rules/testing.md`;
- `.ai/rules/delphi-compatibility.md`;
- `.ai/rules/coding-standards.md`.

Use integration tests instead when the behavior under test depends materially on SQL, database mapping, application setup, the Container, UI, or another real infrastructure boundary. Tests specific to `Fiscal.Calculos` belong to its specialized project and strategy.

## Inspect Before Designing

Read the complete production Use Case and the actual declarations of every injected dependency. Follow repository evidence rather than names or assumptions.

Determine:

- the constructor and public operation being tested;
- validation and branching behavior;
- returned values and important dependency interactions;
- transaction creation, commit, rollback, and destruction paths;
- ownership of injected dependencies and returned objects;
- whether a dependency named with an `I` prefix is a Delphi interface or an abstract class;
- whether an existing test double can be reused without broadening its responsibility.

Do not change production ownership, validation, or transaction behavior merely to simplify a test.

## Choose Test Doubles

Create only the doubles required to isolate the Use Case:

- use a Stub for configured return values;
- use a Fake for a small functional dependency implementation;
- use a Spy or external Spy State for calls and state that must be asserted;
- combine roles only when the resulting type remains simple and explicit.

Store project-specific doubles under:

`Tests/ERP.UnitTests/Support/Fakes/`

Do not move them to `Tests/Common/` unless at least two test projects genuinely consume the same abstraction.

Implement the real dependency contract. When inheriting from a broad abstract class, implement every required abstract member. Supported members should expose only the configuration and observations needed by the fixture. Unsupported infrastructure calls should raise an exception that identifies the double and method when practical.

Do not reproduce production business logic inside a double and do not introduce a mocking or dependency-injection framework solely for the test.

## Preserve Ownership

Before writing `Setup` and `TearDown`, trace who frees each object.

- Do not free an object after ownership has transferred to production code.
- When returning an owned object from a Stub, clear the Stub field after returning it if the caller assumes ownership.
- Release reference-counted interfaces by assigning `nil`; do not call `Free` on them.
- Release interface references before freeing concrete dependencies they may reference.
- If the Use Case destroys a transaction before assertions run, keep observations in an external Spy State owned by the fixture.

## Design the Fixture

Use DUnitX attributes and register the fixture through its unit initialization:

```pascal
initialization
  TDUnitX.RegisterTestFixture(TTestNomeDoUseCase);
```

Keep each test independent. Configure only the state relevant to its scenario and assert observable behavior.

For a transactional Use Case, consider the applicable scenarios:

- required input or entity is absent;
- a business precondition is invalid;
- an important alternate branch is rejected or handled;
- a dependency fails;
- the dependency returns an invalid postcondition;
- the successful flow returns the expected result;
- relevant identifiers or models reach the expected dependencies;
- failures roll back and do not commit;
- success commits and does not roll back.

Do not add scenarios that the current production contract does not support. Name test methods as expected behavior in Brazilian Portuguese, for example:

```text
DeveFalharQuandoNFSeNaoEstaAutorizada
DeveExecutarRollbackQuandoServiceFalha
DeveReverterAutorizacaoRealizadaNoPortal
```

## Project Registration

Add the fixture and new test-double units to both:

- `Tests/ERP.UnitTests/ERPUnitTests.dpr`;
- `Tests/ERP.UnitTests/ERPUnitTests.dproj`.

Use paths relative to `Tests/ERP.UnitTests/`. Keep this project free from references to integration fixtures, `SetupTestUnit`, `test-config.json`, application Container units, real database adapters, UI units, and `Fiscal.Calculos` tests.

Do not add developer-specific absolute paths. Tool or library paths configured in the developer's Delphi environment do not need to be duplicated in the project.

## Validation and Handoff

Inspect the resulting files for:

- fixture registration;
- ownership and cleanup order;
- accidental real-infrastructure dependencies;
- stale or unrelated project references;
- assertions for the intended scenarios and transaction outcome;
- Delphi Rio 10.3.3 compatibility.

Compile or execute the test project only when the user requests or authorizes it. Otherwise, state clearly that runtime validation remains with the developer and provide the fixture name and scenarios to execute.
