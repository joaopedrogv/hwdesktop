unit EventosDFeComposition;

interface

uses
  Winapi.Windows, Vcl.Controls, NextBaseForm, EditorCadastro;

type
  TEventosDFeComposition = class
  public
    class function CriarConsulta(AParent: HWND): TfrmNextBase; static;
    class function CriarEditor(const AChave: string; AParent: TWinControl;
      const AHost: IEditorCadastroHost): TWinControl; static;
  end;

implementation

uses
  System.SysUtils, EventosDFeForm, LocalPreferences, EventosDFeQueryDefinition,
  NextQueryDefinition, EventosDFePresenter, AuthorizationService, NextSetup,
  IDataSetReaderUnit, QueryResultOperations, ColumnLayoutPreferences,
  RemoverEventoDFeUseCaseUnit, TipoEventoDFeUnit, EventoDFe112150CadastroFrame,
  EventoDFe112150CadastroPresenter, ObterEventoDFe112150PorIdUseCaseUnit,
  SalvarEventoDFe112150UseCaseUnit, ObterProximoSeqIdEventoDFeUseCaseUnit;

// A chave de inclusão é o código do tipo; a de registro acrescenta o Id após os dois pontos.
function TipoDaChave(const AChave: string): TipoEventoDFe;
var
  Texto: string;
  Separador: Integer;
  Codigo: Integer;
begin
  Texto := Trim(AChave);
  Separador := Pos(':', Texto);
  if Separador > 0 then
    Texto := Copy(Texto, 1, Separador - 1);

  Codigo := StrToIntDef(Texto, 0);
  if not TipoEventoDFeSuportado(Codigo) then
    raise Exception.Create('Tipo de evento DF-e não suportado: ' + AChave);

  Result := TipoEventoDFeFromCodigo(Codigo);
end;

class function TEventosDFeComposition.CriarConsulta(AParent: HWND): TfrmNextBase;
var
  View: TfrmEventosDFe;
  Preferences: ILocalPreferences;
  Definition: INextQueryDefinition<TEventoDFeSelecionado>;
  Presenter: TEventosDFePresenter;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmEventosDFe.CreateParented(AParent);
  try
    // A definição pertence à tela; a empresa e a lixeira são lidas a cada pesquisa, não na abertura.
    Definition := TEventosDFeQueryDefinition.Create(NextSetupInstance.Resolve<ISqlDataSetReaderFactory>,
      NextSetupInstance.Resolve<IQueryResultOperations>, NextSetupInstance.Resolve<IColumnLayoutPreferences>,
      NextSetupInstance.SessionContext, View.IsLixeiraSearch);

    Presenter := TEventosDFePresenter.Create(View, Definition, NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IRemoverEventoDFeUseCase>);
    try
      // A tela só assume a posse do apresentador no fim de ConfigurarTela; uma falha anterior mantém a posse aqui.
      View.ConfigurarTela(Definition, Presenter, Preferences, TEventosDFeComposition.CriarEditor);
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

class function TEventosDFeComposition.CriarEditor(const AChave: string; AParent: TWinControl;
  const AHost: IEditorCadastroHost): TWinControl;
var
  Frame: TfrmEventoDFe112150CadastroFrame;
  Presenter: TEventoDFe112150CadastroPresenter;
  Tipo: TipoEventoDFe;
begin
  Tipo := TipoDaChave(AChave);
  if Tipo <> teAtualizacaoPrevisaoEntrega then
    raise Exception.CreateFmt('O editor do evento %d ainda não está disponível.',
      [TipoEventoDFeCodigo(Tipo)]);

  Frame := TfrmEventoDFe112150CadastroFrame.Create(AParent, AHost);
  try
    Presenter := TEventoDFe112150CadastroPresenter.Create(Frame,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<ObterEventoDFe112150PorIdUseCase>,
      NextSetupInstance.Resolve<ISalvarEventoDFe112150UseCase>,
      NextSetupInstance.Resolve<IObterProximoSeqIdEventoDFeUseCase>);
    Frame.ConfigurarPresenter(Presenter);
    Result := Frame;
  except
    Frame.Free;
    raise;
  end;
end;

end.
