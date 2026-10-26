---
name: rtc-implementation-evidence
description: Validate and selectively read the structured RTC implementation package when planning or implementing a Fiscal.Calculos update without repeating the conformity pipeline.
---

# RTC Implementation Evidence

## Purpose

Consume `implementation-evidence.json` as the primary structured contract for a
`Fiscal.Calculos` update. Use `implementation-guide.md` for developer review and
narrative clarification.

Do not repeat the pipeline's version diff, triage, semantic grouping, deep analysis,
functional-change discovery, or association of official tests.

Use only:

`Scripts/Fiscal.Calculos/Read-RTCImplementationEvidence.ps1`

## Validate the Package

For normal Workflow source preparation, use one `Summary -AsJson` assignment. The
reader performs all package validation before returning the compact summary, so a
separate `Check` assignment is unnecessary.

Use `Check` only for a validation-only request or explicit resumption check:

```powershell
& .\Scripts\Fiscal.Calculos\Read-RTCImplementationEvidence.ps1 `
  -Action Check `
  -EvidencePath '<implementation-evidence.json>' `
  -GuidePath '<implementation-guide.md>' `
  -ExpectedFromTag '<source-tag>' `
  -ExpectedToTag '<target-tag>'
```

The check validates the supported schema, matching guide metadata, complete
coverage, empty production `unclassified`, unique cases and changes, dependencies,
evidence references, official-test associations, and package hashes. A failure is a
package or compatibility blocker; do not reconstruct missing analysis locally.

## Read Selectively

Do not load the complete JSON into an Agent context by default.

Start with `-Action Summary -AsJson` to obtain the package identity, coverage,
cases, and compact `change_id` inventory. Then read only the assigned case or change:

```powershell
& .\Scripts\Fiscal.Calculos\Read-RTCImplementationEvidence.ps1 `
  -Action Change `
  -Id 'C01-01' `
  -EvidencePath '<implementation-evidence.json>' `
  -GuidePath '<implementation-guide.md>' `
  -AsJson
```

Patches are omitted by default. Add `-IncludePatches` only when the structured
behavior, contracts, file metadata, and hunk coordinates are insufficient for the
current bounded assignment.

## Consumer Boundary

Treat every reported `change_id` as a candidate requiring a developer disposition
in the Modern Workflow. Map it to the current Delphi implementation and tests;
do not accept `implementation_impact` as the final Modern disposition.

Use associated `official_tests` as the authoritative scenarios for Delphi
conformance. Interpret their status explicitly: add new scenarios, update modified
ones, evaluate removed scenarios for deletion or obsolete coverage, and preserve or
establish equivalent coverage for unchanged scenarios. Deduplicate a shared
official test across `change_id`s while preserving every association. Keep
`suggested_regression_tests` explicitly separate. Do not reassociate the package's
`unassociated_artifacts` or turn them into implementation work unless the developer
requests a new conformity investigation.

Prepared Java snapshots may be consulted at the exact paths and hunks referenced by
the selected change. Do not perform an exhaustive source comparison or search for
additional unreported changes when package coverage is complete.

## Handoff

Report package tags and commits, hashes, schema versions, coverage status, selected
`case_id` or `change_id`, and any contract failure. Reading the package does not
approve implementation and does not authorize build or test execution.
