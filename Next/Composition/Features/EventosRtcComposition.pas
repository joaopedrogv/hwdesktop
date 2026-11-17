unit EventosRtcComposition;

interface

uses
  Winapi.Windows, NextBaseForm;

function CreateEventosRtcView(AParent: HWND): TfrmNextBase;

implementation

uses
  EventosRtcForm, LocalPreferences, EventosRtcQueryDefinition,
  NextQueryDefinition, IDataSetReaderUnit, QueryResultOperations,
  ColumnLayoutPreferences, NextSetup;

function CreateEventosRtcView(AParent: HWND): TfrmNextBase;
var
  View: TfrmEventosRtc;
  Preferences: ILocalPreferences;
  Definition: INextQueryDefinitionBase;
begin
  Preferences := NextSetupInstance.Resolve<ILocalPreferences>;

  View := TfrmEventosRtc.CreateParented(AParent);
  try
    // A definicao pertence a esta tela: recebe a fabrica, as operacoes e as
    // preferencias de colunas da composicao, a sessao vigente e o metodo que le
    // a opcao do checkbox. A empresa e a opcao sao consultadas a cada pesquisa,
    // nao na abertura.
    Definition := TEventosRtcQueryDefinition.Create(
      NextSetupInstance.Resolve<ISqlDataSetReaderFactory>,
      NextSetupInstance.Resolve<IQueryResultOperations>,
      NextSetupInstance.Resolve<IColumnLayoutPreferences>,
      NextSetupInstance.SessionContext,
      View.IsOnlyAuthorizedNFe);
    View.ConfigurarTela(Definition, Preferences);

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

end.