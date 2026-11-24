unit EventosDFeComposition;

interface

uses
  Winapi.Windows, Vcl.Controls, NextBaseForm, EditorCadastro, Spring.Container;

type
  TEventosDFeComposition = class
  private
    class function CriarEditor112150(AParent: TWinControl;
      const AHost: IEditorCadastroHost): TWinControl; static;
    class function CriarEditor211130(AParent: TWinControl;
      const AHost: IEditorCadastroHost): TWinControl; static;
  public
    class procedure Registrar(const AContainer: TContainer); static;
    class function CriarConsulta(AParent: HWND): TfrmNextBase; static;
    class function CriarEditor(const AChave: string; AParent: TWinControl;
      const AHost: IEditorCadastroHost): TWinControl; static;
  end;

implementation

uses
  System.SysUtils, EventosDFeForm, LocalPreferences, EventosDFeQueryDefinition,
  NextDatasetDefinition, EventosDFePresenter, AuthorizationService, NextSetup,
  IDataSetReaderUnit, DatasetResultOperations, ColumnLayoutPreferences,
  IEventoDFeFiscalGatewayUnit, AcbrNFeEventoFiscalGatewayUnit,
  RemoverEventoDFeUseCaseUnit, TransmitirEventoDFeUseCaseUnit,
  ConsultarSituacaoEventoDFeUseCaseUnit, TipoEventoDFeUnit,
  EventoDFe112150CadastroFrame, EventoDFe112150CadastroPresenter,
  ObterEventoDFe112150PorIdUseCaseUnit,
  SalvarEventoDFe112150UseCaseUnit, ObterProximoSeqIdEventoDFeUseCaseUnit,
  EventoDFe211130CadastroFrame, EventoDFe211130CadastroPresenter,
  ObterEventoDFe211130PorIdUseCaseUnit, SalvarEventoDFe211130UseCaseUnit,
  EventoDFe211130ColecaoDefinition, EventoDFe211130ItemEtdUnit,
  EventoDFe211130ItemEditorFactory, EventosDFeItemEditorFactory,
  NextMemoryDatasetDefinition, FireDACMemoryDataSetReaderUnit,
  ValidadorItemEventoDFe211130Unit;

class procedure TEventosDFeComposition.Registrar(const AContainer: TContainer);
begin
  AContainer.RegisterType<IEventoDFeFiscalGateway, TAcbrNFeEventoFiscalGateway>.AsSingleton;
end;

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
  Definition: INextDatasetDefinition<TEventoDFeSelecionado>;
  Presenter: TEventosDFePresenter;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmEventosDFe.CreateParented(AParent);
  try
    // A definição pertence à tela; a empresa e a lixeira são lidas a cada pesquisa, não na abertura.
    Definition := TEventosDFeQueryDefinition.Create(NextSetupInstance.Resolve<ISqlDataSetReaderFactory>,
      NextSetupInstance.Resolve<IDataSetResultOperations>, NextSetupInstance.Resolve<IColumnLayoutPreferences>,
      NextSetupInstance.SessionContext, View.IsLixeiraSearch);

    Presenter := TEventosDFePresenter.Create(View, Definition, NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IRemoverEventoDFeUseCase>,
      NextSetupInstance.Resolve<TransmitirEventoDFeUseCase>,
      NextSetupInstance.Resolve<ConsultarSituacaoEventoDFeUseCase>);
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
begin
  if TipoDaChave(AChave) = teImobilizacaoItem then
    Result := CriarEditor211130(AParent, AHost)
  else
    Result := CriarEditor112150(AParent, AHost);
end;

class function TEventosDFeComposition.CriarEditor112150(AParent: TWinControl;
  const AHost: IEditorCadastroHost): TWinControl;
var
  Frame: TfrmEventoDFe112150CadastroFrame;
  Presenter: TEventoDFe112150CadastroPresenter;
begin
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

class function TEventosDFeComposition.CriarEditor211130(AParent: TWinControl;
  const AHost: IEditorCadastroHost): TWinControl;
var
  Frame: TfrmEventoDFe211130CadastroFrame;
  Presenter: TEventoDFe211130CadastroPresenter;
  Reader: IDataSetReader;
  Colecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
  EditorFactory: IEventoDFe211130ItemEditorFactory;
begin
  Frame := TfrmEventoDFe211130CadastroFrame.Create(AParent, AHost);
  try
    Reader := TFireDACMemoryDataSetReader.Create(TEventoDFe211130ColecaoDefinition.Campos);
    Colecao := TEventoDFe211130ColecaoDefinition.Create(Reader,
      NextSetupInstance.Resolve<IDataSetResultOperations>,
      NextSetupInstance.Resolve<IColumnLayoutPreferences>);
    EditorFactory := TEventoDFe211130ItemEditorFactory.Create(
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IValidadorItemEventoDFe211130>);
    Frame.ConfigurarColecao(Colecao, EditorFactory);

    Presenter := TEventoDFe211130CadastroPresenter.Create(Frame,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<ObterEventoDFe211130PorIdUseCase>,
      NextSetupInstance.Resolve<ISalvarEventoDFe211130UseCase>,
      NextSetupInstance.Resolve<IObterProximoSeqIdEventoDFeUseCase>);
    Frame.ConfigurarPresenter(Presenter);
    Result := Frame;
  except
    Frame.Free;
    raise;
  end;
end;

end.
