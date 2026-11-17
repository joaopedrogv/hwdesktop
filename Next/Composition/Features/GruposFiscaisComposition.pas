unit GruposFiscaisComposition;

interface

uses
  Winapi.Windows, NextBaseForm;

function CreateGruposFiscaisView(AParent: HWND): TfrmNextBase;

implementation

uses
  Vcl.Controls, GruposFiscaisForm, LocalPreferences, GruposFiscaisPresenter, NextQueryDefinition,
  ListarEmpresasUseCaseUnit, GruposFiscaisQueryDefinition, ISessionContextUnit, EmpresaOption, EditorCadastro,
  NextSetup, EmpresaOptionsBuilder, GrupoFiscalCadastroFrame, AuthorizationService, RemoverGrupoFiscalUseCaseUnit,
  SalvarGrupoFiscalUseCaseUnit, ObterGruposFiscaisUseCaseUnit;

function CreateGruposFiscaisView(AParent: HWND): TfrmNextBase;
var
  View: TfrmGruposFiscais;
  Preferences: ILocalPreferences;
  Presenter: TGruposFiscaisPresenter;
  Definitions: INextQueryDefinition<TGrupoSelecionado>;
  ListarEmpresas: ListarEmpresasUseCase;
  Sessao: ISessionContext;
  CarregarOpcoes: TCarregarOpcoesEmpresas;
  CriarEditor: TCriarEditorCadastro;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmGruposFiscais.CreateParented(AParent);
  try
    Definitions := NextSetupInstance.Resolve<INextQueryDefinition<TGrupoSelecionado>>;

    // A leitura das empresas e da sessao pertence a composicao: as duas
    // dependencias sao resolvidas uma unica vez e o login e lido a cada carga.
    ListarEmpresas := NextSetupInstance.Resolve<ListarEmpresasUseCase>;
    Sessao := NextSetupInstance.SessionContext;

    CarregarOpcoes := CriarCarregadorEmpresas(ListarEmpresas, Sessao);

    // Cada aba recebe um editor novo, dono do proprio rascunho e da propria
    // lista. A funcao nao guarda a aba nem o frame.
    CriarEditor :=
      function(const AChave: string; AControlePai: TWinControl): TWinControl
      begin
        Result := TfrmGrupoFiscalCadastroFrame.Create(AControlePai);
        TfrmGrupoFiscalCadastroFrame(Result).ConfigurarCarregamentoEmpresas(
          CarregarOpcoes);
      end;

    // A tela precisa do editor antes do apresentador: a primeira abertura de aba
    // usa a funcao ja configurada.
    View.ConfigurarCriacaoEditor(CriarEditor);

    Presenter := TGruposFiscaisPresenter.Create(View, Definitions,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IRemoverGrupoFiscalUseCase>,
      NextSetupInstance.Resolve<ISalvarGrupoFiscalUseCase>,
      NextSetupInstance.Resolve<ObterGrupoFiscalPorIdUseCase>);
    try
      View.AttachPresenter(Presenter, Definitions, 'Grupos Fiscais');
    except
      // Associacao recusada: a tela nao assumiu a posse.
      Presenter.Free;
      raise;
    end;

    View.ConfigureFilters(Definitions.FiltersDef, Preferences,
      Definitions.QueryId);

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

end.