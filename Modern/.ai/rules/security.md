---
name: security
description: Preserve Modern's session, company scope, authorization and audit integration under the shared repository safety rules.
always_apply: true
---

# Modern Security

Shared credential, certificate, sensitive-data, input and control-preservation
rules are in ../.ai/rules/repository-safety.md. Load them through the root entry.

## Session and authorization

- Preserve the established login and active-company identity supplied by the legacy
  ERP. Do not reimplement authentication or replace session identity in a feature.
- Enforce user authorization at the established UI or legacy calling boundary.
  A Rio DLL call does not remove the caller's responsibility.
- Do not duplicate permission checks in Use Cases or treat a missing Use Case
  permission check as public access.
- A new entry point outside the authorized flow requires a developer decision
  about where authorization and audit belong.
- Follow .ai/context/security-architecture.md and
  .ai/context/authorization-auditing.md when these boundaries are relevant.

## Company isolation

- Preserve company-owned movement scope through COD_EMPRESA.
- Determine whether a catalog is global, company-owned or restricted by an
  association table. Do not infer that from its name.
- Do not remove company filters or bypass association tables as a query shortcut.

## Audit and failures

- Preserve identification of the user, company, process and audit outcome for
  protected operations, including the established success or failure record.
- Never invent a final process family, numeric identifier or registration decision.
- Use the established integration and preserve manager-approval behavior.
- Do not suppress a security failure or convert it into successful execution.
