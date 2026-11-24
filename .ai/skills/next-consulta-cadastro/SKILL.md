---
name: next-consulta-cadastro
description: Create or refactor Next consultation screens and cadastro editors using the existing dataset, Presenter, View and visual-base contracts. Use for new Next screens or migration of existing screens to Next.
---

# Next Consultation and Cadastro

Use the assigned functional scope to assemble a Next screen from the existing
mechanisms. A consultation-only delivery needs only the consultation path below.
For migrations, preserve the source screen's behavior and component dimensions.

Start with [Next/AGENTS.md](../../../Next/AGENTS.md), the
[architecture](../../rules/next-architecture.md) and [UI](../../rules/next-ui.md)
Rules. Shared coding and implementation-quality Rules remain authoritative;
examples illustrate mechanisms, not an alternative coding standard.
For Modern-owned changes, also follow Modern/AGENTS.md and its applicable guidance.

Read [the example map](references/examples.md) and select the source files needed
for the current step. Use Grupos Fiscais for the small editor and Operacoes Fiscais
IBS/CBS for derived filters, selectors and nested pages. Read each relevant base
contract before adapting its descendant. Treat feature-specific decisions as
inputs to verify, not defaults to copy.

## Establish the feature's behavior

Identify the existing Use Cases and their inputs, outputs and validation metadata.
Map the actions included in the delivery, authorization processes/actions/tables,
company or user restrictions, editable fields, nullable links and pending-edit
behavior. When migrating a visual screen, inspect its DFM for the actual layout.
Resolve missing business decisions through the assignment's existing process;
this Skill does not define permissions, schema or fiscal behavior.

Compare the required processes with existing definitions using the
[process registration Rule](../../rules/next-architecture.md#authorization-and-process-registration).
Identify reused processes and missing registrations in the plan. Deliver approved
new registrations together with the protected actions.

## Assemble the consultation

1. Choose the dataset definition's base by its data source: TNextQueryDefinition
   for SQL or TNextMemoryDatasetDefinitionBase<T> for in-memory collections. Both
   reuse TNextDatasetDefinitionBase. When actions need a current item, use
   INextDatasetDefinition<T> with a copied, feature-specific selection record. Map
   the row in TryGetSelected through QueryResult, including nullable values; keep
   aliases in that mapping.
2. Define the stable DatasetId and default columns in Configure. Prefer
   DatasetColumnDefinition's BuildGridColumns and BuildFilterDefinition to derive
   grid and query filters from the same declaration; inspect its supported
   overrides for actual field restrictions. For SQL definitions, keep predicates
   and parameters in CreateQueryDefinition, returning TNextSegmentQueryDefinition.
   The dataset definition coordinates the reader, IDataSetResultOperations and
   column preferences through its existing base.
3. Inherit TfrmConsultaBase and the feature consultation View from
   IConsultaBaseView. Expose ConfigurarTela as the composition entry point, register
   the required controls with RegistrarAcao there, and call AssociarPresenter last.
   The inherited TemRegistroCorrente checks current-row availability; use
   TryGetSelected to obtain typed action data. Additional search controls belong
   in the existing search area and supply values when a new search is requested.
4. Put consultation actions in a Presenter derived from TPresenterConsultaBase.
   Keep current-item confirmation and Use Case orchestration there, communicating
   through the injected View. Reuse RefreshResult after mutations: it refreshes
   the executed search instead of reading a new set of filter controls.

## Add a cadastro when included in the assignment

1. Define the feature editor View from ICadastroEditorView and its Presenter from
   TPresenterCadastroBase. Implement PrepararInclusao and PrepararAlteracao with
   the authorized preparation and existing Use Cases. The Presenter receives the
   View in its constructor; it delivers messages and structured validation there.
2. Create a visual descendant of TfrmCadastroEditor, with an inherited DFM. Put
   feature controls under pnCampos and set its content height. Reuse the inherited
   sbCampos, fraValidacao and fixed Salvar/Cancelar footer. Keep the draft in the
   editor and clone loaded data, including mutable nested values, as needed for
   independent edits. Salvar applies the controls to that typed draft and calls
   the editor Presenter.
3. Bind controls to validation attributes on the inherited fraValidacao. Use
   Bind(Control) where the name resolves to the actual metadata attribute; use
   the explicit overload for selectors or nested attributes. Verify panel links
   reveal the containing pages, scroll and focus through the shared implementation.
4. Configure reusable selectors with loading callbacks in composition; let the
   selector load during editor preparation. Prefer the existing company checklist
   and selector builders to loading and forwarding the same lists through each
   form and Presenter. Preserve null selections and linked disabled items.
5. Open editors through the consultation base's tab/factory contracts. Reuse
   PrepararAbaInclusao/PrepararAbaAlteracao inherited from the editor base and
   associate its concrete Presenter with ConfigurarPresenter. The consultation
   Presenter first tries to reactivate the existing inclusion or record tab;
   preparation runs only for a new editor.
6. Let the inherited editor commands notify IEditorCadastroHost. The host handles
   deferred close, then refreshes only after a confirmed save. Validation or a
   failed save keeps that editor's draft; Cancelar closes without refreshing.
   Reuse the existing token and session-reset paths rather than another callback
   or tab-lifetime mechanism.

## Compose and validate

Create the feature composition class with static CriarConsulta and, when needed,
CriarEditor. Resolve dependencies and configure selector loaders there; pass each
instance its View. Use ConfigurarTela and register CriarConsulta in
NextViewCatalog. Add the required dependency registrations and project entries
using the locations in the architecture Rule. Preserve the association's ownership
boundary on failure; reference examples for construction and cleanup order.

Validate the assigned behavior: search and its filters; empty selection and
permission denial; first access without an earlier search; independent new/edit
tabs and reactivation; validation links across pages; save, cancel and failed
refresh; company restrictions, pending edits and session replacement when relevant.
Check inherited DFM consistency, original dimensions and designer opening for
visual changes. Distinguish checks executed from the developer's runtime checks.
For new process registrations, include first initialization and repeated
initialization for the company in validation, preserving existing process settings.

During authorized implementation, compile with
`pwsh -NoProfile -File ./_automation/build/build-next.ps1` as required by
Next/AGENTS.md. Report the actual build result, remaining runtime/designer checks
and the files changed. Use the owning area's validation procedure for any
additional Modern implementation.
