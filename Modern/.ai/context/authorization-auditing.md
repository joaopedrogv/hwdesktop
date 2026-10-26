---
name: authorization-auditing
description: Understand Modern's TAudit_OOP process-code, authorization, manager-approval, and auditing conventions at the legacy UI boundary.
---

# Authorization and Auditing

## Established Mechanism

The Modern UI reuses the legacy `TAudit_OOP` implementation from:

`../Ativos/fonte/hw_audit_utils.pas`

It combines permission checks and user-action auditing. Depending on the compilation
boundary, it delegates to the in-process legacy ERP services or the established
audit DLL. Do not introduce a parallel Modern authorization or audit mechanism.

The authenticated user and company originate from the legacy ERP security context,
as described in `.ai/context/security-architecture.md`.

## Process Codes and Actions

A protected user action is associated with a process code and an action such as
view, search, insert, edit, save, print, delete, cancel, reverse, validate, success,
or failure.

`MODxxx` is the usual family for new Modern cadastro processes. A microcontext may
instead use an established semantic family such as `NFSxxx`, `NFCxxx`, or `CLIxxx`.

An agent must never invent a final process code, prefix, or numeric sequence. During
feature planning, present the complete proposed process inventory and ask the
developer to decide:

- the process family or semantic prefix;
- the latest valid sequence or the final identifiers;
- whether registration belongs in the legacy
  `../Ativos/fonte/ProcessosSetupUnit.pas` or another developer-approved mechanism.

The legacy setup unit is the preferred known registration point, but version scripts
also exist in current practice. Verify the selected mechanism for the feature and
perform a final duplicate/sequence consistency check before handoff.

## Manager Approval

The established defaults are:

- delete, cancel, and reverse operations require manager approval;
- edit, insert, save, search, view, and print operations do not require manager
  approval;
- an unclassified action with material operational risk requires a developer
  decision during planning.

The feature plan must make manager approval explicit for every proposed process so
the developer can review exceptions before implementation.

## Audit Coverage

Auditing applies to user-visible and business-relevant actions, including:

- inserts, edits, saves, and deletes;
- searches and screen views;
- cancellations and reversals;
- printing;
- feature-specific actions.

Permission validation occurs before the protected action at the UI or legacy caller
boundary. After execution, preserve the established success or failure audit record
with the relevant process, action, message, table, business key, user, authorizing
manager when applicable, and company.

Use stable business identifiers and concise, useful descriptions. Do not place
credentials, certificate passwords, unnecessary personal data, or other secrets in
audit messages.

## UI Integration

Reuse the `TAudit_OOP` instance exposed by a `TDataSetGrid` descendant when
applicable. A dataset may override `GetAuditorFill` to provide stable record labels
and keys. When no dataset owns the interaction, use the established legacy
integration already used by nearby Modern forms.

Authorization and audit remain presentation-bound responsibilities. Do not move
them into Use Cases merely for structural symmetry.

## No Skill Yet

This knowledge is Context rather than a Skill because process registration still
has more than one active mechanism and requires developer decisions about families
and sequences. A specialized Skill may be introduced later if provisioning becomes
stable and repeatable.
