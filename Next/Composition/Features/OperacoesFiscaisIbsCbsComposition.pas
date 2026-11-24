unit OperacoesFiscaisIbsCbsComposition;

interface

uses
  Winapi.Windows, Vcl.Controls, NextBaseForm, EditorCadastro;

type
  TOperacoesFiscaisIbsCbsComposition = class
  public
    class function CriarConsulta(AParent: HWND): TfrmNextBase; static;
    class function CriarEditor(const AChave: string; AParent: TWinControl;
      const AHost: IEditorCadastroHost): TWinControl; static;
  end;

implementation

uses
  OperacoesFiscaisIbsCbsForm, LocalPreferences,
  OperacoesFiscaisIbsCbsQueryDefinition, NextDatasetDefinition,
  OperacoesFiscaisIbsCbsPresenter, OperacoesFiscaisSelecoesBuilder,
  OperacaoFiscalIbsCbsCadastroFrame, OperacoesFiscaisIbsCbsCadastroPresenter,
  SelecaoEntidadeOption, RegraFiscalSelecaoOption, EmpresaOption,
  IDataSetReaderUnit, DatasetResultOperations, ColumnLayoutPreferences,
  AuthorizationService, NextSetup, EmpresaOptionsBuilder,
  ListarOperacoesInternasUseCaseUnit, ListarGruposFiscaisUseCaseUnit,
  ListarRegrasFiscaisUseCaseUnit, ListarEmpresasUseCaseUnit,
  SalvarOperacaoFiscalIbsCbsUseCaseUnit,
  ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit,
  RemoverOperacaoFiscalIbsCbsUseCaseUnit, ResolverRegraFiscalIbsCbsUseCaseUnit;

class function TOperacoesFiscaisIbsCbsComposition.CriarConsulta(AParent: HWND): TfrmNextBase;
var
  View: TfrmOperacoesFiscaisIbsCbs;
  Preferences: ILocalPreferences;
  Definition: INextDatasetDefinition<TOperacaoFiscalSelecionada>;
  Presenter: TOperacoesFiscaisIbsCbsPresenter;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmOperacoesFiscaisIbsCbs.CreateParented(AParent);
  try
    // A definicao pertence a tela; o estado do checkbox e lido a cada pesquisa, nao na abertura.
    Definition := TOperacoesFiscaisIbsCbsQueryDefinition.Create(NextSetupInstance.Resolve<ISqlDataSetReaderFactory>,
      NextSetupInstance.Resolve<IDataSetResultOperations>, NextSetupInstance.Resolve<IColumnLayoutPreferences>,
      View.IsLixeiraSearch);

    Presenter := TOperacoesFiscaisIbsCbsPresenter.Create(View, Definition,
      NextSetupInstance.Resolve<IAuthorizationService>, NextSetupInstance.Resolve<RemoverOperacaoFiscalIbsCbsUseCase>);
    try
      // A tela so assume a posse do apresentador no fim de ConfigurarTela; uma falha anterior mantem a posse aqui.
      View.ConfigurarTela(Definition, Presenter, Preferences, TOperacoesFiscaisIbsCbsComposition.CriarEditor);
    except
      Presenter.Free;
      raise;
    end;

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

class function TOperacoesFiscaisIbsCbsComposition.CriarEditor(const AChave: string; AParent: TWinControl;
  const AHost: IEditorCadastroHost): TWinControl;
var
  Frame: TfrmOperacaoFiscalIbsCbsCadastroFrame;
  Presenter: TOperacoesFiscaisIbsCbsCadastroPresenter;
  CarregarOperacaoInterna: TCarregarSelecaoEntidade;
  CarregarGrupoFiscal: TCarregarSelecaoEntidade;
  CarregarRegraFiscal: TCarregarRegraFiscalSelecao;
  CarregarEmpresas: TCarregarOpcoesEmpresas;
begin
  CarregarOperacaoInterna := CriarCarregadorOperacoesInternas(
    NextSetupInstance.Resolve<ListarOperacoesInternasUseCase>);
  CarregarGrupoFiscal := CriarCarregadorGruposFiscais(
    NextSetupInstance.Resolve<IListarAtualeTodosGruposFiscaisUseCase>);
  CarregarRegraFiscal := CriarCarregadorRegrasFiscais(NextSetupInstance.Resolve<ListarRegrasFiscaisUseCase>);
  CarregarEmpresas := CriarCarregadorEmpresas(NextSetupInstance.Resolve<ListarEmpresasUseCase>,
    NextSetupInstance.SessionContext);

  Frame := TfrmOperacaoFiscalIbsCbsCadastroFrame.Create(AParent, AHost);
  try
    // Somente o Grupo Fiscal aceita a opcao vazia, que representa o vinculo nulo no rascunho.
    Frame.fraOperacaoInterna.ConfigurarCarregamento(CarregarOperacaoInterna, False);
    Frame.fraGrupoFiscal.ConfigurarCarregamento(CarregarGrupoFiscal, True);
    Frame.fraRegraFiscal.ConfigurarCarregamento(CarregarRegraFiscal);
    Frame.fraEmpresas.ConfigurarCarregamento(CarregarEmpresas);

    Presenter := TOperacoesFiscaisIbsCbsCadastroPresenter.Create(Frame,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<ObterOperacaoFiscalIbsCbsPorIdUseCase>,
      NextSetupInstance.Resolve<SalvarOperacaoFiscalIbsCbsUseCase>,
      NextSetupInstance.Resolve<ResolverRegraFiscalIbsCbsUseCase>);
    Frame.ConfigurarPresenter(Presenter);
    Result := Frame;
  except
    Frame.Free;
    raise;
  end;
end;

end.
