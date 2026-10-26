---
name: rtc-source-snapshots
description: Prepare or verify immutable read-only source snapshots for a validated RTC implementation package and its two exact official tags.
---

# RTC Source Snapshots

## Purpose

Make the two official Java versions required by a `Fiscal.Calculos` update
available inside one operational Workflow run without changing the external mirror.

Use only the canonical automation:

`Scripts/Fiscal.Calculos/Prepare-RTCSourceSnapshots.ps1`

## Inputs

Require:

- the acquired `calculadora-rtc-mirror` root declared by
  `.ai-runs/<run-id>/rtc-inputs/manifest.json`;
- the acquired primary `implementation-evidence.json` contract;
- the acquired matched `implementation-guide.md`;
- the exact source and target tags;
- the current Workflow run identifier.

The evidence contract and guide must describe the same interval and exact commits.
Validate them through `rtc-implementation-evidence` before using the snapshots.

## Read-Only Boundary

The acquired mirror is an operational input created by `rtc-update-inputs`. After
acquisition it is strictly read-only. Do not run `checkout`, `switch`, `worktree`,
`fetch`, `pull`, `reset`, `clean`, `commit`, or any command that changes its files,
refs, index, configuration, or working tree.

The script may query Git metadata and use `git archive` to write copies under:

`.ai-runs/<run-id>/rtc-sources/`

Agents inspect the resulting copies as read-only evidence. They never edit the
mirror or the snapshots.

## Procedure

For a normal authorized Workflow assignment, run only `Prepare`. It validates the
inputs, prepares atomically when absent, verifies the final snapshot state, and is
idempotent when compatible output already exists.

```powershell
& .\Scripts\Fiscal.Calculos\Prepare-RTCSourceSnapshots.ps1 `
  -Action Prepare `
  -MirrorPath '<mirror-root>' `
  -EvidencePath '<implementation-evidence.json>' `
  -GuidePath '<implementation-guide.md>' `
  -FromTag '<source-tag>' `
  -ToTag '<target-tag>' `
  -RunId '<run-id>'
```

Use `Plan` only for an explicitly requested preview or supervised manual diagnosis:

```powershell
& .\Scripts\Fiscal.Calculos\Prepare-RTCSourceSnapshots.ps1 `
  -Action Plan `
  -MirrorPath '<mirror-root>' `
  -EvidencePath '<implementation-evidence.json>' `
  -GuidePath '<implementation-guide.md>' `
  -FromTag '<source-tag>' `
  -ToTag '<target-tag>' `
  -RunId '<run-id>'
```

Use `Check` only when resuming or when explicitly requested. Never combine actions
inside one operator assignment. Present any schema, coverage, hash, tag, commit,
interval, ordering, or path mismatch instead of guessing. Record the generated
manifest path, tags, commit SHAs, evidence and guide SHA-256 values, schema versions,
pipeline version, and generator commit in the Workflow state.

Preparation is idempotent for the same manifest. Existing divergent output is a
failure; do not overwrite or repair it silently.

## Handoff

Report the exact command, action, run identifier, source and target tags, commit
SHAs, package hashes and versions, snapshot root, and any failure. Preparing sources
does not approve implementation and does not authorize build or test execution.
