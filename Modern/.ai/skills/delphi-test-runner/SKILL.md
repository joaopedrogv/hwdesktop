---
name: delphi-test-runner
description: Build or run Modern Delphi automated tests through the repository CLI automation and interpret exit codes and NUnit results. Use only supported test projects; do not run integration tests or real infrastructure implicitly.
---

# Delphi Test Runner

## Purpose

Use the repository automation to build or execute supported Delphi test projects without opening the IDE.

Project Rules remain authoritative, especially:

- `.ai/rules/testing.md`;
- `.ai/rules/security.md`.

## Supported Scope

The currently automated project is:

`Tests/ERP.UnitTests/ERPUnitTests.dproj`

Run it through:

`Tests/Automation/Invoke-ERPUnitTests.ps1`

Do not substitute an ad hoc MSBuild or compiler command when this script supports the requested operation.

`ERP.IntegrationTests` and `Fiscal.Calculos.Tests` are outside this Skill. Use
`delphi-fiscal-calculos-test-runner` for the latter. Do not infer permission to
access a database, application configuration, credentials, external services, or
other real infrastructure.

## Authorization

During authorized implementation, compilation and execution of ERP.UnitTests through
this runner have standing authority under
../.ai/rules/repository-safety.md#standing-erp-unit-test-validation.
Run when relevant changes need validation and record that authority in the
assignment. A narrower developer instruction takes precedence. Standalone execution
uses the developer's explicit request.

The grant covers the existing local Delphi environment and compiler/test outputs.
Keep the unit-test isolation defined in .ai/rules/testing.md. Schedule stable sources
and serialize shared build/results locations before running.

If the execution environment requires approval to access the Delphi installation or user profile, request that approval for the exact script invocation. Do not bypass the environment setup.

## Commands

From the repository root, build without executing:

```powershell
& .\Modern\Tests\Automation\Invoke-ERPUnitTests.ps1 -BuildOnly
```

Build and execute:

```powershell
& .\Modern\Tests\Automation\Invoke-ERPUnitTests.ps1
```

When automatic Delphi discovery is unavailable, accept a developer-provided path to the directory containing `rsvars.bat`:

```powershell
& .\Modern\Tests\Automation\Invoke-ERPUnitTests.ps1 -DelphiBin '<delphi-bin-directory>'
```

Do not hardcode that local path in a project, script, rule, context file, or Skill.

## Interpret the Outcome

Treat the script exit code as authoritative:

- `0`: build succeeded and, unless `-BuildOnly` was used, all executed tests passed;
- nonzero before test execution: build or environment setup failed;
- nonzero after test execution: at least one test failed or the runner failed.

For a test run, read the NUnit XML path printed by the script under `Tests/TestResults/`. Report:

- project and configuration;
- total, passed, failed, and ignored tests when present in the XML;
- failing fixture/test names and concise failure messages;
- whether the failure occurred during build, runner startup, or test execution.

Preserve failure evidence and route diagnosis or correction to the appropriate
implementation assignment within its approved scope. Report environment/runner
blockers with the actual command and exit code. Keep assertions and expected
production behavior intact.

## Handoff

State the authority used, exact invocation and whether it was build-only or
build-and-run. Record actual test totals when execution completes. If authority or
execution capability is unavailable, describe the pending validation and its cause.
