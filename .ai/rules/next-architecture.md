---
name: next-architecture
description: Responsibilities, composition, read abstractions and source organization for Next and its Modern integration.
applies_to:
  - "Next/**/*"
---

# Next Architecture

Apply to Next work, including a Modern source explicitly identified with a Next
header. Modern-owned sources also retain Modern guidance. Paths below are
checkout-relative.

## Responsibilities and composition

- Follow Hexagonal Architecture and SOLID. Keep business domains, Use Cases,
  validations, Ports and reusable adapters in their owning Modern contexts.
- Next owns presentation, internal service contracts, runtime composition and host
  integration. Build independent visual/read components. Do not inherit
  uCadPadraoModal, uDataSet_OOP or legacy-backed Modern bases, or import the legacy
  global singleton as Next's context.
- The current stack is Delphi Rio 10.3.3/Win32, native VCL/TDBGrid and FireDAC.
  Keep driver details behind adapters selected by composition.
- Use Spring4D only in composition and supply dependencies to consumers. Forms,
  Presenters and Use Cases must not resolve from a global container.
- Composition can configure a concrete editor's public child frames through their
  own APIs. An editor-level method is appropriate when it adds coordination,
  validation or a distinct contract. Supply loading callbacks during composition;
  execute them during editor preparation.
- Choose lifetimes by ownership and sharing. Prefer AsTransient for Presenters
  and lightweight queries or Use Cases following a Presenter. Retain injected
  reference-counted dependencies as interfaces. For class references, establish
  who frees each transient. Use AsSingleton for deliberately shared instances
  living with the container, such as the connection. Statelessness permits
  sharing without requiring it.
- Preserve the established ownership: the consultation form owns its Presenter,
  the tab owns its editor and the editor owns its draft. Apply
  .ai/rules/implementation-quality.md before adding source explanations of ownership.

## Authorization and process registration

- Map protected actions to their processes, authorization actions and audited
  tables. Reuse processes representing the required permission. Present new
  definitions and unresolved security settings in the plan for review; another
  feature or an example does not establish those decisions.
- Keep Next process definitions in
  [ProcessosProviderUnit.pas](../../Next/Composition/Processos/ProcessosProviderUnit.pas).
  Include approved codes, descriptions, levels, manager-approval and auditing
  settings in new integer version blocks. Preserve applied blocks and existing
  process settings; do not add new Next registrations to the legacy setup.
- Registration runs through Next initialization and the existing
  [RegistrarProcessosUseCase](../../Modern/ERP.Features/Core/Application/UseCases/Processos/RegistrarProcessosUseCaseUnit.pas)
  before protected actions. Preserve the per-company version and construction of
  only pending blocks. Reuse the process and configuration repositories; forms
  and Presenters do not seed processes or maintain a parallel setup.
- The definitions in source are authoritative. Do not maintain duplicate process
  catalogs in documentation or Skills.

## Reads and host boundary

- Dataset definitions supply columns, filters, DatasetId and the result lifecycle
  through TNextDatasetDefinitionBase and INextDatasetDefinitionBase /
  INextDatasetDefinition<T>. Keep these contracts independent of the data source
  and reuse their reader/operations coordination.
- Query identifies the SQL specialization: TNextQueryDefinition owns SQL query
  construction and ISqlDataSetReaderFactory. In-memory collections use
  TNextMemoryDatasetDefinitionBase<T> and INextMemoryDefinition<T>, with typed
  model/dataset mapping. Keep SQL dependencies out of the common dataset base.
- IDataSetResultOperations and TDataSetResultOperations operate on the loaded
  dataset: marking, quick filters, sorting and summaries are not SQL execution.
- Forms request searches and present native TDataSet results. Reads use the
  driver-independent contract; the adapter executes them. Composition selects
  the adapter and owns the connection lifecycle.
- Use the existing QueryResult wrapper to map known result fields into records or
  objects, including in-memory datasets. Preserve its current name and API. Use
  typed and nullable accessors when NULL differs from an empty/default value.
  For a dataset supplied by IDataSetReader, pass OwnsDataSet = False and free the
  wrapper after copying the values.
- Direct TDataSet/TField use belongs in VCL binding and generic grid operations
  needing metadata or native dataset behavior.
- The ERP supplies session and connection data. The host targets Delphi 2006 and
  the module targets Rio; cross that boundary through the explicit ABI, never
  Delphi objects, datasets or containers. Shared source does not share objects
  between runtimes.

## Source organization

Use these locations for new assignments and agreed relocations. Preserve
locations already agreed for ongoing work; create folders only when they contain
source files. Use the same feature name under queries, Presenters, forms and frames.

| Location under Next/ | Responsibility |
| --- | --- |
| Contracts/Shared/Views/ | Common consultation/editor View contracts and feedback |
| Contracts/Shared/Cadastro/ | Editor/host coordination and editor creation contracts |
| Contracts/Shared/Seletores/ | Reusable selector options and loading callbacks |
| Contracts/Shared/Grid/ | Shared grid presentation contracts and column metadata |
| Contracts/Shared/Authorization/ | Internal authorization service contracts |
| Contracts/Features/<Feature>/ | Feature-specific consultation/editor Views and exchange contracts |
| Composition/Features/ | Feature view factories registered by NextViewCatalog |
| Composition/Shared/Seletores/ | Factories creating selector loaders from injected Use Cases |
| Infrastructure/ | Database, authorization, auditing and preferences integration |
| Queries/Shared/ and Queries/Features/<Feature>/ | Dataset definitions, SQL queries/filters and dataset result operations |
| UI/Presenters/Shared/ and UI/Presenters/Features/<Feature>/ | Presenter bases and feature Presenters |
| UI/Forms/Base/ and UI/Forms/Features/<Feature>/ | Consultation base and concrete forms |
| UI/Frames/Shared/ and UI/Frames/Features/<Feature>/ | Shared visual components and feature editors |
| UI/Components/ | UI components |
| Interop/Contracts/, Interop/Host/ and Interop/Module/ | ABI, Delphi 2006 host and Rio module integration |
| Projects/ and Tests/ | Projects and test support |

Contracts may contain interfaces, records, enums, callbacks and small helpers
for constructing their values. Group shared contracts by responsibility; keep
feature-specific contracts under the matching feature name. Selector contracts
remain shared when the component is reusable, including EmpresaOption,
SelecaoEntidadeOption and RegraFiscalSelecaoOption.

Keep implementation algorithms in the area that owns their behavior.
DatasetColumnLayout belongs under Queries/Shared/: it resolves the grid layout
from default columns and persisted preferences. Its relocation does not require
splitting its types and functions into additional units. Host ABI contracts stay
under Interop/Contracts/; Modern business Ports stay in their owning contexts.

Within Queries/Shared/, place filter definitions and criteria in Filters/.
Within shared frames, group filters, grids, selectors and companies by their
responsibility. The host-integrated form base belongs in Interop/Module/.
