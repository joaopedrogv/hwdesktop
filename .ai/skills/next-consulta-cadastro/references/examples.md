# Choosing the reference

Use this map to open the smallest relevant part of the live implementation.
Paths below resolve to the working checkout; inspect current source rather than
copying a frozen template. Business rules, identifiers, comments and incidental
wrappers in an example require their own assessment under the canonical Rules.

## Grupos Fiscais: small consultation and editor

- [Composition](../../../../Next/Composition/Features/GruposFiscaisComposition.pas):
  static consultation/editor factories and the company-loading callback.
- [Consultation form](../../../../Next/UI/Forms/Features/GruposFiscais/GruposFiscaisForm.pas)
  and [Presenter](../../../../Next/UI/Presenters/Features/GruposFiscais/GruposFiscaisPresenter.pas):
  action association, typed selection and tab activation/opening.
- [Editor PAS](../../../../Next/UI/Frames/Features/GruposFiscais/GrupoFiscalCadastroFrame.pas)
  and [DFM](../../../../Next/UI/Frames/Features/GruposFiscais/GrupoFiscalCadastroFrame.dfm):
  inherited fields area, independent draft, company selection and Bind(Control).
- [Editor Presenter](../../../../Next/UI/Presenters/Features/GruposFiscais/GruposFiscaisCadastroPresenter.pas)
  and [View](../../../../Next/Contracts/Features/GruposFiscais/GruposFiscaisCadastroView.pas):
  preparation, typed save and validation through ICadastroEditorView.
- [SQL dataset definition](../../../../Next/Queries/Features/GruposFiscais/GruposFiscaisQueryDefinition.pas):
  TGrupoSelecionado and QueryResult mapping. Its explicit equality-only filter
  declaration is feature-local; use the next example for deriving new filters.

## Operacoes Fiscais IBS/CBS: selectors and multiple pages

- [SQL dataset definition](../../../../Next/Queries/Features/OperacoesFiscaisIbsCbs/OperacoesFiscaisIbsCbsQueryDefinition.pas):
  BuildColumns, BuildGridColumns, BuildFilterDefinition, nullable row mapping and
  a checkbox read for a new search. Refresh keeps the last executed parameters.
- [Composition](../../../../Next/Composition/Features/OperacoesFiscaisIbsCbsComposition.pas):
  reusable entity, fiscal-rule and company loaders configured on child frames.
- [Editor PAS](../../../../Next/UI/Frames/Features/OperacoesFiscaisIbsCbs/OperacaoFiscalIbsCbsCadastroFrame.pas)
  and [DFM](../../../../Next/UI/Frames/Features/OperacoesFiscaisIbsCbs/OperacaoFiscalIbsCbsCadastroFrame.dfm):
  Cadastro/Condicoes pages under pnCampos and explicit binds to selector controls.
- [Editor Presenter](../../../../Next/UI/Presenters/Features/OperacoesFiscaisIbsCbs/OperacoesFiscaisIbsCbsCadastroPresenter.pas)
  and [View](../../../../Next/Contracts/Features/OperacoesFiscaisIbsCbs/OperacoesFiscaisIbsCbsCadastroView.pas):
  loading, save/validation, restoration preparation and analysis feedback.
  Restoration and analysis apply only when the requested feature includes them.

## Shared mechanisms to inspect before adapting

- [Dataset base](../../../../Next/Queries/Shared/NextDatasetDefinition.pas):
  TNextDatasetDefinitionBase, common interfaces, reader lifecycle, DatasetId and
  default/saved column layouts.
- [SQL specialization](../../../../Next/Queries/Shared/NextQueryDefinition.pas):
  TNextQueryDefinition, CreateQueryDefinition, TNextSegmentQueryDefinition and the
  SQL reader factory.
- [In-memory specialization](../../../../Next/Queries/Shared/NextMemoryDatasetDefinition.pas)
  and [211130 item collection](../../../../Next/Queries/Features/EventosDFe/EventoDFe211130ColecaoDefinition.pas):
  TNextMemoryDatasetDefinitionBase<T>, INextMemoryDefinition<T>, ModelToDataSet /
  DataSetToModel and Load/Add/Update/Remove/SelectAll. Collection mapping stays
  separate from business validation.
- [Dataset operations](../../../../Next/Queries/Shared/DatasetResultOperations.pas):
  IDataSetResultOperations / TDataSetResultOperations for marking, quick filters,
  sorting and summaries over the current dataset.
- [Column/filter declaration](../../../../Next/Queries/Shared/DatasetColumnDefinition.pas):
  grid columns and filters derived from the same definitions.
- [Consultation base](../../../../Next/UI/Forms/Base/ConsultaBaseForm.pas):
  command state, tabs, deferred close and RefreshResult.
- [Editor base PAS](../../../../Next/UI/Frames/Shared/Cadastro/CadastroEditorFrame.pas)
  and [DFM](../../../../Next/UI/Frames/Shared/Cadastro/CadastroEditorFrame.dfm):
  preparation entry points, Presenter ownership, inherited layout and commands.
- [Validation panel](../../../../Next/UI/Frames/Shared/Validation/ValidationPanelFrame.pas):
  binding, message display and generic container/focus navigation.
- [Company loader builder](../../../../Next/Composition/Shared/Seletores/EmpresaOptionsBuilder.pas)
  and [entity/fiscal-rule builders](../../../../Next/Composition/Shared/Seletores/OperacoesFiscaisSelecoesBuilder.pas):
  reusable callbacks supplied by composition.
