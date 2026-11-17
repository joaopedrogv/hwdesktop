unit OperacoesFiscaisIbsCbsComposition;

interface

uses
  Winapi.Windows, NextBaseForm;

function CreateOperacoesFiscaisIbsCbsView(AParent: HWND): TfrmNextBase;

implementation

uses
  OperacoesFiscaisIbsCbsForm, LocalPreferences,
  OperacoesFiscaisIbsCbsQueryDefinition, NextQueryDefinition,
  IDataSetReaderUnit, QueryResultOperations, ColumnLayoutPreferences,
  PresenterConsultaBase, AuthorizationService, NextSetup;

function CreateOperacoesFiscaisIbsCbsView(AParent: HWND): TfrmNextBase;
var
  View: TfrmOperacoesFiscaisIbsCbs;
  Preferences: ILocalPreferences;
  Definition: INextQueryDefinitionBase;
  Presenter: TPresenterConsultaBase;
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

    // A tela e somente leitura: a pesquisa e autorizada pela consulta padrao,
    // sem acoes de cadastro associadas.
    Presenter := TPresenterConsultaBase.Create(
      NextSetupInstance.Resolve<IAuthorizationService>, 'MOD020',
      'OP_FISCAIS_IBSCBS');
    try
      // A tela configura a definicao, os filtros e, por ultimo, assume a posse
      // do apresentador; uma falha antes disso mantem a posse aqui.
      View.ConfigurarTela(Definition, Presenter, Preferences);
    except
      // Associacao recusada: a tela nao assumiu a posse.
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