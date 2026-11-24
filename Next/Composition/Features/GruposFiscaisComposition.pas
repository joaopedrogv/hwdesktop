unit GruposFiscaisComposition;

interface

uses
  Winapi.Windows, Vcl.Controls, NextBaseForm, EditorCadastro;

type
  TGruposFiscaisComposition = class
  public
    class function CriarConsulta(AParent: HWND): TfrmNextBase; static;
    class function CriarEditor(const AChave: string; AParent: TWinControl;
      const AHost: IEditorCadastroHost): TWinControl; static;
  end;

implementation

uses
  GruposFiscaisForm, LocalPreferences, GruposFiscaisQueryDefinition,
  NextDatasetDefinition, GruposFiscaisPresenter, GruposFiscaisCadastroPresenter,
  GrupoFiscalCadastroFrame, EmpresaOption, NextSetup, EmpresaOptionsBuilder,
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit,
  SalvarGrupoFiscalUseCaseUnit, ObterGruposFiscaisUseCaseUnit,
  ListarEmpresasUseCaseUnit;

class function TGruposFiscaisComposition.CriarConsulta(AParent: HWND): TfrmNextBase;
var
  View: TfrmGruposFiscais;
  Preferences: ILocalPreferences;
  Definition: INextDatasetDefinition<TGrupoSelecionado>;
  Presenter: TGruposFiscaisPresenter;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmGruposFiscais.CreateParented(AParent);
  try
    Definition := NextSetupInstance.Resolve<INextDatasetDefinition<TGrupoSelecionado>>;

    Presenter := TGruposFiscaisPresenter.Create(View, Definition, NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IRemoverGrupoFiscalUseCase>);
    try
      // A tela so assume a posse do apresentador no fim de ConfigurarTela; uma falha anterior mantem a posse aqui.
      View.ConfigurarTela(Definition, Presenter, Preferences, TGruposFiscaisComposition.CriarEditor);
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
  // A leitura das empresas pertence a composicao; o login e lido a cada carga.
  CarregarEmpresas := CriarCarregadorEmpresas(NextSetupInstance.Resolve<ListarEmpresasUseCase>,
    NextSetupInstance.SessionContext);

  Frame := TfrmGrupoFiscalCadastroFrame.Create(AParent, AHost);
  try
    Frame.fraEmpresas.ConfigurarCarregamento(CarregarEmpresas);

    Presenter := TGruposFiscaisCadastroPresenter.Create(Frame, NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<ObterGrupoFiscalPorIdUseCase>, NextSetupInstance.Resolve<ISalvarGrupoFiscalUseCase>);
    Frame.ConfigurarPresenter(Presenter);
    Result := Frame;
  except
    Frame.Free;
    raise;
  end;
end;

end.
