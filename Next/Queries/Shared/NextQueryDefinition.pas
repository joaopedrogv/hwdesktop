unit NextQueryDefinition;

interface

uses
  Data.DB, IDataSetReaderUnit, FilterCriterion, QueryResultOperations,
  GridColumnDefinition, FilterDefinition, ParameterValueUnit,
  ColumnLayoutPreferences, QueryColumnLayout;

type
  // Definicao de leitura independente de driver. Contem apenas SQL, parametros
  // e metadados de colunas; nao executa consulta nem conhece conexao.
  TNextQueryDefinition = record
    Sql: string;
    Parameters: ParametersValues;
  end;

  // Ciclo da consulta: a base cria, abre, limpa e libera o leitor e associa as
  // operacoes ao leitor vigente. GetResultOperation apenas devolve a instancia.
  INextQueryDefinitionBase = interface
    ['{D1A2B3C4-D5E6-F7A8-B9C0-D1E2F3A4B5C6}']
    function GetResultOperation(): IQueryResultOperations;
    function GetColumnsDef: TGridColumnDefinitions;
    function GetFiltersDef(): TFilterDefinition;
    function GetQueryId: string;
    function GetDataSet: TDataSet;
    procedure Search(const ACriteria: TFilterCriteria);
    // Atualiza o resultado da pesquisa corrente sem recriar o leitor nem
    // reaplicar os criterios da tela.
    procedure Refresh;
    procedure Clear;
    // Layout de colunas: a definicao e a unica origem das colunas padrao e das
    // preferencias persistidas para o QueryId corrente.
    function LoadColumnLayout: TQueryColumnLayout;
    procedure SaveColumnLayout(const AEntries: TColumnLayoutEntries);
    procedure ResetColumnLayout;

    property FiltersDef: TFilterDefinition read GetFiltersDef;
    property ColumnsDef: TGridColumnDefinitions read GetColumnsDef;
    property QueryId: string read GetQueryId;
  end;

  INextQueryDefinition<T> = interface(INextQueryDefinitionBase)
    ['{bb78610f-7934-4bdc-b859-cf0f9b052e69}']
    // Le a linha corrente do leitor; a funcionalidade decide o que identifica
    // um registro selecionado. Nao cria nem libera objetos de apresentacao.
    function TryGetSelected(out ASelected: T): Boolean;
  end;

  TNextQueryDefinitionBase = class(TInterfacedObject, INextQueryDefinitionBase)
  protected
    FOperation: IQueryResultOperations;
    FReader: IDataSetReader;
    FReaderFactory: ISqlDataSetReaderFactory;
    FLayoutPreferences: IColumnLayoutPreferences;
    // Identidade do layout em CONFIG_COLUNAS. Cada definicao atribui na primeira
    // linha de Configure, que roda na construcao da base e nao pode depender de
    // campos da classe derivada.
    FQueryId: string;
    FFiltersDef: TFilterDefinition;
    FColumnsDef: TGridColumnDefinitions;
    // Preenche colunas e filtros da funcionalidade.
    procedure Configure(); virtual;
    // A funcionalidade informa SQL e parametros; a base executa o ciclo.
    function CreateQueryDefinition(
      const ACriteria: TFilterCriteria): TNextQueryDefinition; virtual; abstract;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory;
      AOperation: IQueryResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences);
    procedure Search(const ACriteria: TFilterCriteria);
    procedure Refresh;
    procedure Clear;
    function GetResultOperation(): IQueryResultOperations;
    function GetColumnsDef: TGridColumnDefinitions;
    function GetFiltersDef(): TFilterDefinition;
    function GetQueryId(): string;
    function GetDataSet: TDataSet;
    function LoadColumnLayout: TQueryColumnLayout;
    procedure SaveColumnLayout(const AEntries: TColumnLayoutEntries);
    procedure ResetColumnLayout;
  end;

implementation

uses
  System.SysUtils;

const
  MissingReaderFactoryMessage =
    'A fabrica de leitores da consulta nao foi informada.';
  MissingOperationMessage =
    'As operacoes do resultado da consulta nao foram informadas.';
  MissingReaderMessage = 'O leitor de dados da consulta nao foi informado.';
  MissingLayoutPreferencesMessage =
    'As preferencias de colunas nao foram informadas.';
  MissingQueryIdMessage =
    'A identidade do layout de colunas da consulta nao foi informada.';
  ConfigureNotImplementedMessage =
    'Configuração da consulta não implementada';

{ TNextQueryDefinitionBase }

constructor TNextQueryDefinitionBase.Create(
  AReaderFactory: ISqlDataSetReaderFactory;
  AOperation: IQueryResultOperations;
  ALayoutPreferences: IColumnLayoutPreferences);
begin
  inherited Create;
  if AReaderFactory = nil then
    raise Exception.Create(MissingReaderFactoryMessage);
  if AOperation = nil then
    raise Exception.Create(MissingOperationMessage);
  if ALayoutPreferences = nil then
    raise Exception.Create(MissingLayoutPreferencesMessage);

  FReaderFactory := AReaderFactory;
  FOperation := AOperation;
  FLayoutPreferences := ALayoutPreferences;
  Configure();

  // Sem identidade nenhuma preferencia pode ser lida ou gravada; a falha de
  // composicao aparece na abertura, nao como layout padrao silencioso.
  if Trim(FQueryId) = '' then
    raise Exception.Create(MissingQueryIdMessage);
end;

function TNextQueryDefinitionBase.GetQueryId(): string;
begin
  Result := FQueryId;
end;

function TNextQueryDefinitionBase.LoadColumnLayout: TQueryColumnLayout;
var
  Entries: TColumnLayoutEntries;
  MarkingFieldName: string;
begin
  MarkingFieldName := FOperation.MarkingColumnName();

  // Sem coluna participante nao existe preferencia a aplicar e a leitura do
  // banco e dispensavel.
  if not QueryColumnLayoutAvailable(FColumnsDef, MarkingFieldName) then
    Exit(ResolveQueryColumnLayout(FColumnsDef, nil, MarkingFieldName));

  try
    Entries := FLayoutPreferences.Load(FQueryId);
  except
    // Abrir a consulta nunca depende da preferencia gravada: uma falha de
    // leitura mantem as colunas padrao da definicao. A falha real continua
    // visivel em Save/Reset, que reportam ao host.
    Entries := nil;
  end;

  Result := ResolveQueryColumnLayout(FColumnsDef, Entries, MarkingFieldName);
end;

procedure TNextQueryDefinitionBase.SaveColumnLayout(
  const AEntries: TColumnLayoutEntries);
begin
  // A falha de validacao ou de banco pertence ao chamador, que decide a
  // apresentacao.
  FLayoutPreferences.Save(FQueryId, AEntries);
end;

procedure TNextQueryDefinitionBase.ResetColumnLayout;
begin
  FLayoutPreferences.Reset(FQueryId);
end;

procedure TNextQueryDefinitionBase.Configure();
begin
  raise Exception.Create(ConfigureNotImplementedMessage);
end;

procedure TNextQueryDefinitionBase.Search(
  const ACriteria: TFilterCriteria);
var
  QueryDefinition: TNextQueryDefinition;
begin
  // Uma pesquisa substitui a anterior: nenhum leitor antigo permanece ativo
  // nem associado as operacoes.
  Clear;
  QueryDefinition := CreateQueryDefinition(ACriteria);
  FReader := FReaderFactory.CreateReader(QueryDefinition.Sql,
    QueryDefinition.Parameters);
  try
    if FReader = nil then
      raise Exception.Create(MissingReaderMessage);
    FReader.Search;
    FOperation.SetReader(FReader);
  except
    Clear;
    raise;
  end;
end;

procedure TNextQueryDefinitionBase.Refresh;
begin
  // Sem leitor nao existe resultado aberto a reler; a base nao cria um novo
  // leitor nesta chamada.
  if FReader = nil then
    raise Exception.Create(MissingReaderMessage);

  FReader.Refresh;
end;

procedure TNextQueryDefinitionBase.Clear;
begin
  // Desassociar antes de fechar impede que as operacoes alcancem um leitor
  // liberado ou uma linha do resultado anterior.
  FOperation.SetReader(nil);
  if FReader <> nil then
  begin
    FReader.Clear;
    FReader := nil;
  end;
end;

function TNextQueryDefinitionBase.GetResultOperation(): IQueryResultOperations;
begin
  Result := FOperation;
end;

function TNextQueryDefinitionBase.GetColumnsDef(): TGridColumnDefinitions;
begin
  Result := FColumnsDef;
end;

function TNextQueryDefinitionBase.GetFiltersDef(): TFilterDefinition;
begin
  Result := FFiltersDef;
end;

function TNextQueryDefinitionBase.GetDataSet: TDataSet;
begin
  if FReader = nil then
    Result := nil
  else
    Result := FReader.GetDataSet;
end;

end.
