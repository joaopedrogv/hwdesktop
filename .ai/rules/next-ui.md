---
name: next-ui
description: Next consultation, editor, feedback and host window/session lifecycle rules.
applies_to:
  - "Next/UI/**/*"
  - "Next/Interop/**/*"
  - "Next/Contracts/**/*View.pas"
  - "Next/Contracts/**/ViewFeedback.pas"
  - "Next/Contracts/**/EditorCadastro.pas"
---

# Next UI

Apply to Next presentation and host window/session integration. Preserve the
approved behavior and existing common contracts.

## Forms, editors and feedback

- Keep common consultation controls, tab management and editor coordination in
  the existing base and shared contracts. Feature forms provide typed editor
  preparation and feature behavior. Reuse established mechanisms before creating
  helpers or another form inheritance level.
- Presenters orchestrate feature authorization and Use Cases and communicate
  through their View contracts. Keep business rules in their owning Modern code.
- Each editor keeps its own draft. Preserve independent inclusion/editing tabs,
  reuse of an already open tab and validation delivery to the editor that started
  the save. Preserve the existing save/cancel and deferred-close flow.
- Use TfrmNextBase to present information, warnings and errors in Rio forms.
  Write dialog titles and messages in Brazilian Portuguese. Use
  Application.MessageBox for standard buttons in the Windows UI language;
  avoid MessageDlg with VCL-supplied button captions.
- Smaller reusable frames report feedback to their host form. Cadastro editors
  present feedback through their View and the shared base frame. Keep VCL dialog
  creation in the UI, outside business code. Keep Modern UIUtilsUnit and its
  setup and validation dependencies outside Next's dialog implementation.
- Preserve default buttons, focus and cancellation semantics. Confirmations
  require an explicit affirmative action; make the negative answer the default
  when discarding pending edits.

## Windows and sessions

- Open forms through the shared bridge API and stable textual identifiers.
  Register a creation function in the DLL catalog; it composes a new instance.
- Editable forms report pending edits through HasPendingChanges. The base
  confirms individual closes and the host applies each instance's close policy.
  User changes and ERP shutdown use the host's collective-close flow.
- Keep MDI/modal presentation, single/multiple instances and hide/destroy-on-close
  policies distinct. Queries default to a reusable single instance with hiding.
  Modal openings use their own instance, normally destroyed when closed, without
  converting an existing MDI instance into a modal.
- Common window management coordinates the Delphi 2006 host wrapper and Rio
  content. It finds reusable instances before construction; descendants reuse
  the Next base's integration.
- The database stays the same across logins; company and ERP user can change.
  Apply the identity supplied by the ERP even when windows remain open or hidden.
  Reset their old results and drafts through the existing session-change flow.
  Cleanup failure does not undo the accepted identity; disable the affected view
  and preserve the module's incomplete-cleanup protection.
- Hidden instances still own resources. Do not unload the DLL merely because no
  windows are visible. Preserve safe callback/message lifetimes and release
  windows and readers before the shared adapter and module.
