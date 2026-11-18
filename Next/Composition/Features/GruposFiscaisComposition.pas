unit GruposFiscaisComposition;

interface

uses
  Winapi.Windows, Vcl.Controls, NextBaseForm, EditorCadastro;

type
  // Composicao da tela e do editor de Grupos Fiscais.
  TGruposFiscaisComposition = class
  public
    class function CriarConsulta(AParent: HWND): TfrmNextBase; static;
    class function CriarEditor(const AChave: string; AParent: TWinControl;
      const AHost: IEditorCadastroHost): TWinControl; static;
  end;

implementation

uses
  GruposFiscaisForm, LocalPreferences, GruposFiscaisQueryDefinition,
  NextQueryDefinition, GruposFiscaisPresenter, GruposFiscaisCadastroPresenter,
  GrupoFiscalCadastroFrame, EmpresaOption, NextSetup, EmpresaOptionsBuilder,
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit,
  SalvarGrupoFiscalUseCaseUnit, ObterGruposFiscaisUseCaseUnit,
  ListarEmpresasUseCaseUnit;

class function TGruposFiscaisComposition.CriarConsulta(
  AParent: HWND): TfrmNextBase;
var
  View: TfrmGruposFiscais;
  Preferences: ILocalPreferences;
  Definition: INextQueryDefinition<TGrupoSelecionado>;
  Presenter: TGruposFiscaisPresenter;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmGruposFiscais.CreateParented(AParent);
  try
    Definition := NextSetupInstance.Resolve<INextQueryDefinition<TGrupoSelecionado>>;

    Presenter := TGruposFiscaisPresenter.Create(View, Definition,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IRemoverGrupoFiscalUseCase>);
    try
      // A tela configura a criacao do editor, associa a definicao, configura os
      // filtros e so entao assume a posse do apresentador; uma falha antes disso
      // mantem a posse aqui.
      View.ConfigurarTela(Definition, Presenter, Preferences,
        TGruposFiscaisComposition.CriarEditor);
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

class function TGruposFiscaisComposition.CriarEditor(const AChave: string;
  AParent: TWinControl; const AHost: IEditorCadastroHost): TWinControl;
var
  Frame: TfrmGrupoFiscalCadastroFrame;
  Presenter: TGruposFiscaisCadastroPresenter;
  CarregarEmpresas: TCarregarOpcoesEmpresas;
begin
  // A leitura das empresas e da sessao pertence a composicao; o login e lido a
  // cada carga.
  CarregarEmpresas := CriarCarregadorEmpresas(
    NextSetupInstance.Resolve<ListarEmpresasUseCase>,
    NextSetupInstance.SessionContext);

  Frame := TfrmGrupoFiscalCadastroFrame.Create(AParent, AHost);
  try
    Frame.fraEmpresas.ConfigurarCarregamento(CarregarEmpresas);

    Presenter := TGruposFiscaisCadastroPresenter.Create(Frame,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<ObterGrupoFiscalPorIdUseCase>,
      NextSetupInstance.Resolve<ISalvarGrupoFiscalUseCase>);
    Frame.ConfigurarPresenter(Presenter);
    Result := Frame;
  except
    Frame.Free;
    raise;
  end;
end;

end.
