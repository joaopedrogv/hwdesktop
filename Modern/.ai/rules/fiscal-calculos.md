---
name: fiscal-calculos
description: Preserve direct Java correspondence, Delphi 2006 compatibility, and package registration for production code in Fiscal.Calculos.
applies_to:
  - "Fiscal.Calculos/**"
---

# Fiscal.Calculos Rules

## Scope and Precedence

These rules apply only to production artifacts in `Fiscal.Calculos/` and take precedence
over other rules.

## Direct Java Correspondence

- A new Delphi file that corresponds directly to an official Java class or interface
MUST preserve the exact simple name of the Java type and add only the suffix `Unit`
to both the filename and the Delphi unit name.
- Its primary Delphi type MUST have the identical name as the Java type.
- Preserve Java suffixes and terminology—such as `Domain`, `Service`, `Repository`,
`Input`, `Output`, `DTO`, among others—when they are part of the corresponding Java
type name.

Example:

```text
CompraGovernamentalDomain.java
-> CompraGovernamentalDomainUnit.pas
-> unit CompraGovernamentalDomainUnit
-> CompraGovernamentalDomain = class
```

## Exceptional Name Adaptation

Adapt the Java-derived name only when exact correspondence is technically
impossible, for example because of a Delphi unit-name collision, reserved
identifier, incompatible public contract, several Java types represented by one
Delphi unit, or absence of a one-to-one mapping.

ONLY when a Delphi filename cannot correspond to the Java filename + `Unit`, add one
concise `// Java:` comment for each corresponding source file. Use the RTC-relative path
without a repository URL or extended explanation:

```pascal
// Java: source/src/main/java/.../CompraGovernamentalDomain.java
```

## Existing Units and Renames

- Do not rename an existing unit solely to apply the direct-correspondence
  convention retroactively.
- Any proposed rename or move MUST be identified individually in the approved
  technical design.
- An approved rename or move MUST update the unit declaration, all affected
  `uses` references, and every affected project registration.

## pkModern Registration

- Every new production unit under `Fiscal.Calculos/` MUST be registered in both
  `package/pkModern.dpk` and `package/pkModern.bdsproj` in the same
  implementation increment.
- Preserve the existing path syntax and project-file organization.
- A rename or move of a registered unit MUST update both package files in the same
  change.
- Registration in one package file does not substitute registration in the other.
