---
name: security
description: Security rules for secrets, sensitive data, untrusted input, authorization, auditability, and security-preserving changes in Modern.
always_apply: true
---

# Security Rules

## Security Preservation

- Preserve existing security controls.
- NEVER weaken, bypass, disable, or remove security controls merely to simplify an implementation or work around a failure.
- Preserve existing behavior when the security impact of a change is unclear.
- Security-related changes MUST remain focused on the requested task.

## Secrets and Credentials

- NEVER hardcode credentials, API keys, tokens, private keys, certificate passwords, or other secrets.
- Secrets MUST use the configuration or secret-management mechanism established by the target application/environment.
- Files containing real secrets MUST NOT be committed to version control.
- NEVER copy secrets discovered in code, configuration, environment variables, logs, or tool output into generated code, comments, documentation, tests, examples, prompts, reports, or diagnostic output.
- Redact secret values when they must be referenced diagnostically.

## Certificates

- Certificate files containing private keys (`.pfx`, `.p12`, or equivalent) MUST NOT be committed to the repository.
- Private keys and certificate passwords MUST be treated as secrets.
- Do not copy real certificate material into source code, tests, fixtures, documentation, or examples.
- NEVER disable certificate or TLS validation merely to bypass an integration error.

## Sensitive Data

- Minimize exposure of personal, financial, authentication, and other sensitive data.
- Do not log sensitive data merely for debugging convenience.
- When sensitive data is legitimately required in logs, expose only the minimum necessary and apply appropriate masking or redaction.
- Do not expose secrets or unnecessary sensitive data in exception messages, temporary files, or diagnostic output.

## Untrusted Input

- Treat user input, external files, APIs/services, imported data, barcode readers, synchronization sources, and other external systems as untrusted.
- Validate untrusted input according to the business and technical constraints of the operation.
- Do not use generic sanitization as a substitute for context-appropriate validation.
- SQL safety and parameterization MUST follow `.ai/rules/database.md`.

## Authentication and Authorization

- Preserve existing authentication, authorization, and permission checks.
- Do not bypass or weaken permission checks to simplify an implementation.
- New access to protected operations or data MUST use the mechanisms established by the application.
- Authentication MUST NOT be treated as authorization.

## Company Data Isolation

- Preserve the established company scope of business data.
- Company-owned movement data MUST remain constrained by `COD_EMPRESA`.
- Do not remove company filters or bypass established company-association tables.
- Verify whether a catalog is global, company-owned, or restricted through an
  association table before changing its access model.

## Auditability

- Preserve existing audit mechanisms for security-sensitive and business-critical operations.
- Do not bypass, suppress, or disable required audit logging.
- Preserve required user identification and existing audit behavior unless the task explicitly changes the audit contract.

## Error Handling

- User-facing and diagnostic errors MUST NOT disclose credentials, tokens, private keys, certificate passwords, or unnecessary sensitive information.
- Do not suppress security failures merely to allow processing to continue.
- Do not convert failed security validation into successful execution unless explicitly required.
