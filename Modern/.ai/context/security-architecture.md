---
name: security-architecture
description: Understand Modern's legacy authentication boundary, read-only session context, company isolation, credential retrieval, and certificate handling.
---

# Security Architecture

## Scope

This context explains how `Modern` participates in the legacy ERP security model.
Mandatory security constraints remain in `.ai/rules/security.md`.

## Authentication Boundary

`Modern` does not authenticate users or select the active company. It always runs
after the legacy ERP has completed those responsibilities.

The legacy bootstrap and login flow populate `ISessionContext` with the active
environment, company, user, and financial context. Although the interface exposes
setters for integration purposes, feature code must treat the populated session as
read-only. It must not replace the authenticated user or active company.

The session identity is the established source for application behavior and
persistence that needs the current user or company. Authentication must not be
reimplemented inside a Modern Use Case, form, or adapter.

## Authorization Boundary

User authorization is enforced at the legacy ERP presentation or calling boundary,
primarily through `TAudit_OOP`. Modern Use Cases do not repeat user-permission
checks.

Calls into the Delphi Rio DLL normally exist because the Delphi 2006 application
cannot execute the required technology directly. The authorized legacy UI remains
responsible for checking permission before the call and recording the audit outcome
after it.

Do not infer from the absence of a Use Case permission check that an operation is
public. When adding a new caller or entry point that does not pass through an
established authorized UI flow, stop and ask the developer where authorization and
auditing must occur.

See `.ai/context/authorization-auditing.md` for the process-code and audit model.

## Company Data Scope

`COD_EMPRESA` is required for data representing a movement created or owned by a
company, such as invoices, sales, and returns.

Some catalogs are intentionally global and visible to every company. When a global
catalog must be restricted, the established model is a separate association table
that identifies which companies may use each catalog record.

Do not assume that a table is global or company-owned from its name alone. Verify
the established model. Do not remove a company filter or bypass an association
table as a query simplification.

## Credentials and Configuration

Existing credentials are encoded by the legacy ERP and obtained through
`IConfiguracoesRepository`. `GetEmailConfig` supplies email configuration, while
`GetLegacy` supplies legacy NFSe, web-service, and certificate configuration.

There is no single approved storage model for new kinds of credentials. Before
designing or implementing one, ask the developer how it must be stored, encoded,
retrieved, and scoped.

Technical ACBr options may come from `Config.ini`; this does not make that file an
approved general-purpose secret store.

## Certificates

The ERP supports A1 and A3 digital certificates. Modern obtains their configured
parameters and passes them to ACBr; it does not implement certificate handling
outside that integration.

Do not add certificate material to the repository or introduce an alternative
certificate lifecycle without an explicit architectural decision.
