---
name: rtc-update-inputs
description: Acquire the exact RTC tags and matched conformity package from the canonical GitHub repositories for a Fiscal.Calculos Workflow run.
---

# RTC Update Inputs

## Purpose

Acquire the two official calculator versions and the matched implementation
package without depending on developer-machine repository paths.

Use only:

`Scripts/Fiscal.Calculos/Acquire-RTCUpdateInputs.ps1`

## Inputs

Require only:

- exact source and target tags;
- current Workflow run identifier.

The script owns the canonical GitHub repository URLs and derives the interval path
as `reports/<source-tag>-<target-tag>/`. Do not accept, infer, or substitute another
repository, report directory, evidence filename, or guide filename during a normal
run.

## Procedure

For a normal authorized Workflow assignment, run exactly one action:

```powershell
& .\Scripts\Fiscal.Calculos\Acquire-RTCUpdateInputs.ps1 `
  -Action Acquire `
  -FromTag '<source-tag>' `
  -ToTag '<target-tag>' `
  -RunId '<run-id>'
```

`Acquire` validates its inputs, acquires into a temporary operational directory,
validates the matched package and commits, moves the complete result atomically,
and verifies the final manifest before returning.

Use `Plan` only when the developer explicitly requests a preview or when supervised
manual diagnosis needs the derived paths without network or filesystem changes:

```powershell
& .\Scripts\Fiscal.Calculos\Acquire-RTCUpdateInputs.ps1 `
  -Action Plan `
  -FromTag '<source-tag>' `
  -ToTag '<target-tag>' `
  -RunId '<run-id>'
```

Use `Check` only when resuming or when an explicit verification is requested.
Never place more than one action in the same operator assignment. Record the
acquisition manifest, repository URLs, conformity commit, exact tag commits,
package hashes, and derived local paths.

## Boundaries

- Network access is read-only and limited to the two repository URLs embedded in
  the canonical script.
- Use the environment's existing Git authentication. Never request, expose, store,
  document, or pass a token in a URL or command argument.
- Never push, create remote refs, update a remote repository, or use a developer's
  existing checkout.
- All local Git metadata and downloaded files belong under
  `.ai-runs/<run-id>/rtc-inputs/`.
- Acquisition is idempotent for the same manifest. Divergent existing output is a
  blocker and must not be overwritten or repaired silently.
- A missing tag, missing interval package, authentication failure, network failure,
  package mismatch, or commit mismatch is reported distinctly. Do not search for a
  nearby interval or reconstruct pipeline output.

Acquisition authorizes no discovery, production change, test creation, build, test
execution, release, or publication.

## Handoff

Return the exact command and action, run identifier, source and target tags,
repository URLs, conformity and tag commit SHAs, local input paths, hashes,
manifest path, exit code, and any blocker.
