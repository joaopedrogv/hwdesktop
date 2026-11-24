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
- Apply coding, comment and encoding standards within the assigned change.
  Do not use them as a standing assignment to clean up existing code.
  Report broader cleanup or refactoring as a separate demand.
- Planning, implementation, test creation, build/test execution, SQL execution,
  setup changes and publication have distinct authorization boundaries. The
  standing validation grants below cover isolated ERP.UnitTests and the local
  Next DLL build.
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
- Write clear, maintainable code within the assigned change. Preserve the area's
  architecture; do not introduce Modern infrastructure or perform unrelated
  cleanup or broad refactoring under this rule.
- Report relevant existing defects and bounded alternatives in the existing
  assignment/result artifacts when needed. Ask for a decision only when a needed
  correction changes approved behavior, contracts or scope, or leaves a material
  ambiguity. Do not silently change business behavior or expand the demand.

## Source Encoding Verification

- Use ISO-8859-1 (Latin-1), without a BOM, as the default encoding for `.pas`,
  `.dpr`, `.dpk`, `.dfm` and `.inc` files in both Delphi 2006 and Delphi Rio.
- Read and write explicitly in the file's encoding from the first edit, preserving
  existing line endings and format.
- In `.pas` files, write accented messages and labels as readable literals, such
  as `'Autorização'`; reserve numeric escapes such as `#231` for technical needs.
  In textual `.dfm` files, preserve the Delphi designer's serialized form.
- Review changed text as part of normal diff review. Investigate encoding
  separately only when corruption, incompatibility or a concrete doubt appears;
  routine changes do not require byte-level evidence or encoding reports.

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
  stated authority. Builds outside the standing grants, ERP.IntegrationTests,
  Fiscal.Calculos.Tests, database operations, infrastructure setup and publication
  retain their separate authorization requirements.
- Report the actual invocation, build/test outcome and available result artifacts.
  Preserve runner or environment failure evidence and route technical diagnosis
  within the authorized scope. A successful compile alone is build evidence.

## Standing Next DLL Build Validation

- During authorized implementation that affects hw.next.dll, compile it with
  Delphi Rio/Win32 from the working clone using
  `pwsh -NoProfile -File ./_automation/build/build-next.ps1`. This includes changes
  to shared Modern sources used by that DLL. The script writes compiler outputs
  in the working clone.
- Run the build before handing off the affected implementation. Intermediate
  builds and reruns are authorized. Fix compiler errors caused by the assignment
  and rerun on the corrected sources. Reuse a successful build while the relevant
  inputs are unchanged.
- The implementer or the Orchestrator may run the script. In a Workflow, record
  the scope in the assignment and serialize builds with other builds and writes
  that share the DLL's sources or outputs. Report the command, result and any
  concrete blocker.
- A narrower developer instruction takes precedence. Legacy BPL builds, ERP
  execution, database operations, deployment and publication require their own
  authorization. A successful DLL build is compilation evidence.

## Validation and local tooling

- Do not write to production data from automated tests. Execution needs verified
  infrastructure and the developer's authorization.
- Generated tool files do not expand a role's ownership or grant permission for
  build, tests, database operations, release or publication.
- Do not reset, stash, discard work, rewrite published history or publish as an
  implicit part of an investigation. Keep SVN integration separate from feature work.
