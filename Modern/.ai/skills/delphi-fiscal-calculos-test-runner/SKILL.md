---
name: delphi-fiscal-calculos-test-runner
description: Build or run the specialized Fiscal.Calculos.Tests suite through its canonical CLI automation with explicit infrastructure authorization.
---

# Delphi Fiscal.Calculos Test Runner

## Purpose

Build or execute the Delphi regression and conformance suite owned by:

`Tests/Fiscal.Calculos.Tests/FiscalCalculosTests.dproj`

Use only:

`Tests/Automation/Invoke-FiscalCalculosTests.ps1`

Do not run the official Java tests. Their added or changed scenarios are reproduced
in Delphi and validated through `Fiscal.Calculos.Tests`.

## Authorization and Safety

Creating or updating tests does not authorize their build or execution.

Building requires explicit developer authorization because it reads the local
Delphi environment and writes compiler output. Executing requires separate explicit
authorization plus confirmation that the database, calculator files, configuration,
and any other infrastructure used by the complete suite are safe test resources.

Never use production data, credentials, certificates, or services. Do not infer
that the suite is isolated merely because it is a test project.

## Commands

Build without running tests:

```powershell
& .\Tests\Automation\Invoke-FiscalCalculosTests.ps1 -BuildOnly
```

Build and run only after the developer confirms safe test infrastructure:

```powershell
& .\Tests\Automation\Invoke-FiscalCalculosTests.ps1 -ConfirmTestInfrastructure
```

When Delphi discovery is unavailable, accept a developer-provided directory that
contains `rsvars.bat` through `-DelphiBin`. Never hardcode that local path.

## Interpret the Outcome

The script uses `CI/Win32` and preserves its process exit code:

- `0` means the build succeeded and, for a run, all executed tests passed;
- a nonzero code before execution indicates environment or build failure;
- a nonzero code after execution indicates test or runner failure.

For a run, inspect the NUnit XML reported under `Tests/TestResults/`. Report totals,
failed tests and concise messages, relevant memory-leak output, the exact invocation,
and whether the failure occurred during build, startup, or execution.

Do not weaken an assertion, change production behavior, or repair a failure unless
the developer separately authorizes diagnosis or correction through the Workflow.

