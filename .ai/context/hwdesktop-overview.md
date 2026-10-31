---
name: hwdesktop-overview
description: Identify HWDESKTOP's desktop ERP boundaries, compiler and database constraints, and the distinction between legacy and Modern.
---

# HWDESKTOP Technical Overview

HWDESKTOP is a VCL desktop ERP. Its main application and BPL packages, including
pkModern, target Delphi 2006/Win32. Selected DLL work uses Delphi Rio 10.3.3;
hw.nfe.dx consumes units shared with Modern. Determine each affected project's
compiler and each shared source boundary before changing language or dependencies.

The operational ERP database is Firebird 2.5. The existing pkReestrutura package
applies migration history from scripts/versoes/. General demand SQL and the
identified schema reference live in scripts/database/. See the root database Rule
and migration Skill when those responsibilities are relevant.

Modern has documented hexagonal boundaries and project-specific application,
domain, adapter, composition and UI conventions. The remaining ERP has no verified
uniform architecture. Follow the implementation and guidance of the affected area;
do not apply Modern's conventions globally.

This checkout also contains projects that may not belong to the ERP. Their
presence does not establish a common compiler, database or architecture.
