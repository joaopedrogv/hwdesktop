---
name: repository-safety
description: Preserve HWDESKTOP work, authorization, credentials, sensitive data and existing security controls across the checkout.
always_apply: true
---

# Repository Safety

## Authorization and preservation

- Preserve the developer's task scope, approved behavior and existing contracts.
- Preserve unrelated changes, personal configuration, ignored dependencies, file
  encoding and line endings. Do not perform incidental cleanup or normalization.
- Planning, implementation, test creation, build/test execution, SQL execution,
  setup changes and publication have distinct authorization boundaries. The
  standing ERP.UnitTests validation grant below is the explicit limited exception.
- Preserve existing authentication, authorization, company isolation and audit.
  Never weaken a control to simplify a task or bypass an error.
- Do not infer a uniform architecture or stack from this checkout's directory tree.

## Legacy References and Local Changes

- Use existing legacy code to establish behavior, contracts, integration points,
  compiler constraints and local conventions. A nearby example is evidence to
  evaluate; its presence alone does not make it an approved quality standard.
- Assess candidate references for concrete correctness, failure handling, resource
  ownership and security. Prefer clear, compatible implementations and established
  reusable mechanisms. Do not propagate unjustified duplication, swallowed errors
  or other demonstrated defects merely to resemble existing code. Distinguish
  such risks from personal style preferences.
- Write clear, maintainable code within the assigned change. Local improvements
  that preserve approved behavior and contracts do not require a separate gate.
  Preserve the area's architecture; do not introduce Modern infrastructure or
  perform unrelated cleanup or broad refactoring under this rule.
- Report relevant existing defects and bounded alternatives in the existing
  assignment/result artifacts when needed. Ask for a decision only when a needed
  correction changes approved behavior, contracts or scope, or leaves a material
  ambiguity. Do not silently change business behavior or expand the demand.

## Local Implementation Quality

- Prefer existing mechanisms and the simplest correct representation within the
  assigned scope. Before adding persistent fields, check which values can be
  derived from existing data or held locally for the current operation.
- Retain cross-call state only when its lifetime is needed. For new caches or
  recalculation flags, establish their identity, invalidation and update points,
  including failure and retry behavior. Use a cohesive representation for fields
  that describe one concept when it improves clarity. Review state necessity as
  well as field count, preserving compiler compatibility and existing contracts.
- Write new or substantively revised source comments in Brazilian Portuguese.
  Preserve the established spelling of technical identifiers, compiler
  directives and tool-recognized markers.
- Write source comments that remain understandable without the current Workflow
  run. Explain a business rule, ownership, compatibility constraint or a
  non-obvious reason. Keep run-local decision IDs, increment IDs, approval
  narratives and review history in run artifacts. Stable domain codes and
  specification references can remain when they explain the source contract.
- When a user must locate a record, use its recognizable business labels. Compose
  enough identifying data to distinguish the records involved. Keep internal
  identifiers in diagnostic evidence when needed for traceability.
- State a finding's practical consequence and appropriate action in the user's
  vocabulary. Describe the data actually checked, including current edits versus
  saved data, company and date when relevant. Match severity and success claims to
  the evidence. Respect valid precedence and intentional broad conditions when
  describing overlaps or observations.

## Source Encoding Verification

- Establish the expected encoding and line endings before editing or creating a
  source file, using the target area's compiler, explicit configuration and actual
  neighboring files. Apply the area's compatibility Rules where present.
- Configure the writer explicitly. Use strict encoding that reports characters
  which cannot be represented. Preserve unrelated bytes and existing file format.
- Before handing off created or modified Delphi 2006 sources, verify their bytes
  against the intended single-byte encoding, including accented literals,
  messages, captions and metadata. Include affected PAS, DFM, DPR, DPK and INC files.
- Record the expected encoding and the byte-level check in validation evidence.
  ASCII-only content does not establish a code page, and successful UTF-8 decoding
  or correct display in an editor does not establish Delphi 2006 compatibility.
- When application validation is authorized, also inspect affected rendered text.
  Limit encoding checks and corrections to the assigned changes.

## Run Context and Repository Searches

- Operational runs are task-local evidence, not canonical project context. Use the
  exact current run path and only the artifacts needed for the assignment.
- Exclude .ai-runs/ and historical locations such as Modern/.ai-runs/ from routine
  source-code searches, including searches that bypass ignore settings. Read the
  current run through its explicit path, not by searching all runs.
- Do not enumerate runs to select the newest or infer which task to resume. For a
  new run, check only its candidate path; if a resumed run is unidentified, ask for
  its path instead of scanning the history. A task without a run does not require
  loading operational history.
- Consult another run only for an identified relevant reference or research need.
  Bound the read to its exact artifact/path and record the purpose in the existing
  assignment or result. Treat it as historical evidence to verify, not authority
  over current source or approved decisions. A narrower Workflow restriction still
  applies.
- Read access does not grant write ownership over another run. Preserve its state
  and artifacts.

## Secrets, certificates and sensitive data

- Never hardcode or commit credentials, tokens, private keys or real secret files.
  Use the component's established configuration and secret mechanism.
- Never copy discovered secrets into code, comments, documentation, fixtures,
  prompts, reports, logs or diagnostic output. Redact values when needed.
- Never commit certificates containing private keys, including .pfx and .p12.
  Do not disable certificate or TLS validation to work around an integration error.
- Minimize personal, financial and authentication data exposure. Log only necessary
  information with appropriate masking; user-facing errors must not disclose it.

## Input and failures

- Treat user input, external files, databases and services as untrusted. Validate
  according to the operation's business and technical constraints.
- Use parameterized runtime SQL and trusted/validated dynamic identifiers through
  the data-access mechanism established for the affected component.
- Do not suppress security failures or convert them into successful operations.

## Standing ERP Unit-Test Validation

- During an authorized implementation, building and running the isolated project
  Modern/Tests/ERP.UnitTests/ERPUnitTests.dproj through
  Modern/Tests/Automation/Invoke-ERPUnitTests.ps1 is already authorized.
  Use Modern/.ai/skills/delphi-test-runner/SKILL.md and run when relevant changes
  need validation, including correction reruns. A narrower developer instruction
  takes precedence.
- This grant covers the existing local Delphi environment and compiler/test
  outputs. ERP.UnitTests must remain isolated from real databases, application
  initialization, credentials and uncontrolled external services.
- Record this standing authority and its scope in implementation assignments.
  The Orchestrator may execute the canonical runner directly. Serialize runs and
  writes that share the test sources or output locations, and reuse valid results
  until a change or failure justifies another run.
- Research, planning, standalone review and documentation requests use their own
  stated authority. Other builds, ERP.IntegrationTests, Fiscal.Calculos.Tests,
  database operations, infrastructure setup and publication retain their separate
  authorization requirements.
- Report the actual invocation, build/test outcome and available result artifacts.
  Preserve runner or environment failure evidence and route technical diagnosis
  within the authorized scope. A successful compile alone is build evidence.

## Validation and local tooling

- Do not write to production data from automated tests. Execution needs verified
  infrastructure and the developer's authorization.
- Generated tool files do not expand a role's ownership or grant permission for
  build, tests, database operations, release or publication.
- Do not reset, stash, discard work, rewrite published history or publish as an
  implicit part of an investigation. Keep SVN integration separate from feature work.
