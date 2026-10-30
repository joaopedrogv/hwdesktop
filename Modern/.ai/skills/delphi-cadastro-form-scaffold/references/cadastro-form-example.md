# Cadastro Form Scaffold Reference

This is schematic guidance for a compatible cadastro using the shared Modern
base and supervising MVP. It is not a complete unit or a source-copy template.

## Existing Reference

Consult the relevant parts of the RedBenefPC pilot:

- UI/Forms/RedBenefPC/UCadAjustesRedBenefPC.pas and its DFM;
- UI/Forms/RedBenefPC/AjustesRedBenefPcPresenter.pas;
- UI/Forms/RedBenefPC/AjustesRedBenefPcView.pas;
- UI/Infrastructure/Components/ModernCadastroFormUnit.pas and its DFM;
- UI/Infrastructure/Interfaces/IViewFeedbackUnit.pas;
- package/PackageSetuptUnit.pas: ShowAjustesRedBenefPC.

Read .ai/context/ui-integration.md for responsibilities, scope, and ownership.
Inspect current source before reuse; a reference is not proof that every caller
handles preparation failures correctly.

## Division of Work

The concrete form inherits TModernCadastroForm. When the Presenter only needs
shared feedback, both can use IViewFeedback directly. A feature View is introduced
only for additional presentation capabilities, as in the RedBenefPC lookup flow.
Do not create an empty interface or redeclare FFormValidator, FAuditor, FiltroGrid,
or the shared validation/error/information/attention methods provided by the base.

The Presenter receives application dependencies and a View contract. The existing
opening entry point assembles it and gives ownership to the form. Do not obtain
Use Cases through Container in event handlers or inside the Presenter.

## Initialization Shape

```text
create the grid dataset
-> obtain its borrowed auditor reference
-> SetupDataSetGrid(dataset)
-> configure dataset with fields/metadata
-> fill FiltroGrid after the dataset has opened/configured its fields
-> connect a filter callback only when custom conditions are required
-> configure the inherited UI validator with concrete controls
-> apply grid field configuration
```

Preserve the ordering and inherited initialization required by the actual screen.
SetupDataSetGrid does not replace dataset Setup or transfer dataset ownership.

## Preparation and Mapping

```delphi
function TFrmCadExemplo.PrepararCamposCadastro: Boolean;
begin
  Result := FPresenter.CarregarOpcoes(FState);
  if Result then
    MapStateToForm();
end;
```

The names above are placeholders for the approved feature contracts, not new
framework APIs. A caller opens the edit view only after successful preparation.
MapStateToForm projects values to controls; it does not fetch the same lookups
again. Apply the same failure handling to alternate callers, including actions
that unlock or change an existing edit state.

## Protected Save Shape

```text
map controls to edit state
-> check the approved save process at the existing UI boundary
-> ask the Presenter to save
-> invalid/failure: show the appropriate feedback and stay in the edit flow
-> success: record the established audit, complete inherited UI behavior, refresh
```

Business validation and persistence remain in the Use Case/core. Do not invent
process identifiers or omit existing success audit when moving a call.

## Minimal Inherited DFM

```text
inherited FrmCadExemplo: TFrmCadExemplo
  Caption = 'Exemplo'
end
```

Use the actual ancestor resources and parent containers. The base FormShow already
hides the replaced legacy filter controls after its inherited call. Preserve the
initialization chain; do not repeat those visibility assignments in the child.
Add only the controls already identified by the task. The shared base already supplies its filter frame
and inherited grid/actions. Final positions, tab order, captions, and unusual
interactions remain feature work.

Existing direct TfrmCadPadraoM forms and specialized dialogs remain valid choices
where the shared pattern is not appropriate or adaptation was not requested.
