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
  setup changes and publication have distinct authorization boundaries.
- Preserve existing authentication, authorization, company isolation and audit.
  Never weaken a control to simplify a task or bypass an error.
- Do not infer a uniform architecture or stack from this checkout's directory tree.

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

## Validation and local tooling

- Do not write to production data from automated tests. Execution needs verified
  infrastructure and the developer's authorization.
- Generated tool files do not expand a role's ownership or grant permission for
  build, tests, database operations, release or publication.
- Do not reset, stash, discard work, rewrite published history or publish as an
  implicit part of an investigation. Keep SVN integration separate from feature work.
