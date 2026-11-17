unit OperacoesFiscaisIbsCbsComposition;

interface

uses
  Winapi.Windows, NextBaseForm;

function CreateOperacoesFiscaisIbsCbsView(AParent: HWND): TfrmNextBase;

implementation

uses
  Vcl.Controls, OperacoesFiscaisIbsCbsForm, LocalPreferences,
  OperacoesFiscaisIbsCbsQueryDefinition, NextQueryDefinition,
  OperacoesFiscaisIbsCbsPresenter, OperacoesFiscaisSelecoesBuilder,
  OperacaoFiscalIbsCbsCadastroFrame, EditorCadastro, SelecaoEntidadeOption,
  RegraFiscalSelecaoOption, EmpresaOption,
  IDataSetReaderUnit, QueryResultOperations, ColumnLayoutPreferences,
  AuthorizationService, NextSetup, EmpresaOptionsBuilder,
  ListarOperacoesInternasUseCaseUnit, ListarGruposFiscaisUseCaseUnit,
  ListarRegrasFiscaisUseCaseUnit, ListarEmpresasUseCaseUnit,
  ISessionContextUnit, SalvarOperacaoFiscalIbsCbsUseCaseUnit,
  ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit;

function CreateOperacoesFiscaisIbsCbsView(AParent: HWND): TfrmNextBase;
var
  View: TfrmOperacoesFiscaisIbsCbs;
  Preferences: ILocalPreferences;
  Definition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
  Presenter: TOperacoesFiscaisIbsCbsPresenter;
  ListarOperacoesInternas: ListarOperacoesInternasUseCase;
  ListarGruposFiscais: IListarAtualeTodosGruposFiscaisUseCase;
  ListarRegrasFiscais: ListarRegrasFiscaisUseCase;
  ListarEmpresas: ListarEmpresasUseCase;
  Sessao: ISessionContext;
  Salvar: SalvarOperacaoFiscalIbsCbsUseCase;
  Obter: ObterOperacaoFiscalIbsCbsPorIdUseCase;
  CarregarOperacaoInterna: TCarregarSelecaoEntidade;
  CarregarGrupoFiscal: TCarregarSelecaoEntidade;
  CarregarRegraFiscal: TCarregarRegraFiscalSelecao;
  CarregarEmpresas: TCarregarOpcoesEmpresas;
  CriarEditor: TCriarEditorCadastro;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmOperacoesFiscaisIbsCbs.CreateParented(AParent);
  try
    // A definicao pertence a esta tela e recebe as preferencias de colunas e o
    // metodo que le a opcao do checkbox: o estado e consultado a cada pesquisa,
    // nao na abertura.
    Definition := TOperacoesFiscaisIbsCbsQueryDefinition.Create(
      NextSetupInstance.Resolve<ISqlDataSetReaderFactory>,
      NextSetupInstance.Resolve<IQueryResultOperations>,
      NextSetupInstance.Resolve<IColumnLayoutPreferences>,
      View.IsLixeiraSearch);

    // Os casos de uso e a sessao sao resolvidos uma unica vez: cada carga
    // consulta o registro atual e o login continua sendo lido a cada chamada.
    ListarOperacoesInternas := NextSetupInstance.Resolve<ListarOperacoesInternasUseCase>;
    ListarGruposFiscais := NextSetupInstance.Resolve<IListarAtualeTodosGruposFiscaisUseCase>;
    ListarRegrasFiscais := NextSetupInstance.Resolve<ListarRegrasFiscaisUseCase>;
    ListarEmpresas := NextSetupInstance.Resolve<ListarEmpresasUseCase>;
    Sessao := NextSetupInstance.SessionContext;
    Salvar := NextSetupInstance.Resolve<SalvarOperacaoFiscalIbsCbsUseCase>;
    Obter := NextSetupInstance.Resolve<ObterOperacaoFiscalIbsCbsPorIdUseCase>;

    CarregarOperacaoInterna := CriarCarregadorOperacoesInternas(ListarOperacoesInternas);
    CarregarGrupoFiscal := CriarCarregadorGruposFiscais(ListarGruposFiscais);
    CarregarRegraFiscal := CriarCarregadorRegrasFiscais(ListarRegrasFiscais);
    CarregarEmpresas := CriarCarregadorEmpresas(ListarEmpresas, Sessao);

    // Cada aba recebe um editor novo, dono do proprio rascunho e dos proprios
    // seletores. A funcao nao guarda a aba nem o frame.
    CriarEditor :=
      function(const AChave: string; AControlePai: TWinControl): TWinControl
      var
        Frame: TfrmOperacaoFiscalIbsCbsCadastroFrame;
      begin
        Frame := TfrmOperacaoFiscalIbsCbsCadastroFrame.Create(AControlePai);
        // Somente o Grupo Fiscal aceita a opcao vazia, que representa o vinculo
        // nulo no rascunho.
        Frame.fraOperacaoInterna.ConfigurarCarregamento(CarregarOperacaoInterna, False);
        Frame.fraGrupoFiscal.ConfigurarCarregamento(CarregarGrupoFiscal, True);
        Frame.fraRegraFiscal.ConfigurarCarregamento(CarregarRegraFiscal);
        Frame.fraEmpresas.ConfigurarCarregamento(CarregarEmpresas);
        Result := Frame;
      end;

    Presenter := TOperacoesFiscaisIbsCbsPresenter.Create(View, Definition,
      NextSetupInstance.Resolve<IAuthorizationService>, Salvar, Obter);
    try
      // A tela configura a criacao do editor, associa a definicao, configura os
      // filtros e so entao assume a posse do apresentador; uma falha antes disso
      // mantem a posse aqui.
      View.ConfigurarTela(Definition, Presenter, Preferences, CriarEditor);
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

end.
