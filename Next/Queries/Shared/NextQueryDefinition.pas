unit NextQueryDefinition;

interface

uses
  Data.DB, IDataSetReaderUnit, FilterCriterion, QueryResultOperations,
  GridColumnDefinition, FilterDefinition, ParameterValueUnit;

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
    function GetDataSet: TDataSet;
    procedure Pesquisar(const ACriteria: TFilterCriteria);
    // Atualiza o resultado da pesquisa corrente sem recriar o leitor nem
    // reaplicar os criterios da tela.
    procedure Atualizar;
    procedure Limpar;

    property FiltersDef: TFilterDefinition read GetFiltersDef;
    property ColumnsDef: TGridColumnDefinitions read GetColumnsDef;
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
    FFiltersDef: TFilterDefinition;
    FColumnsDef: TGridColumnDefinitions;
    // Preenche colunas e filtros da funcionalidade.
    procedure Configure(); virtual;
    // A funcionalidade informa SQL e parametros; a base executa o ciclo.
    function CreateQueryDefinition(
      const ACriteria: TFilterCriteria): TNextQueryDefinition; virtual; abstract;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory;
      AOperation: IQueryResultOperations);
    procedure Pesquisar(const ACriteria: TFilterCriteria);
    procedure Atualizar;
    procedure Limpar;
    function GetResultOperation(): IQueryResultOperations;
    function GetColumnsDef: TGridColumnDefinitions;
    function GetFiltersDef(): TFilterDefinition;
    function GetDataSet: TDataSet;
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
  ConfigureNotImplementedMessage =
    'Configuração da consulta não implementada';

{ TNextQueryDefinitionBase }

constructor TNextQueryDefinitionBase.Create(
  AReaderFactory: ISqlDataSetReaderFactory;
  AOperation: IQueryResultOperations);
begin
  inherited Create;
  if AReaderFactory = nil then
    raise Exception.Create(MissingReaderFactoryMessage);
  if AOperation = nil then
    raise Exception.Create(MissingOperationMessage);

  FReaderFactory := AReaderFactory;
  FOperation := AOperation;
  Configure();
end;

procedure TNextQueryDefinitionBase.Configure();
begin
  raise Exception.Create(ConfigureNotImplementedMessage);
end;

procedure TNextQueryDefinitionBase.Pesquisar(
  const ACriteria: TFilterCriteria);
var
  QueryDefinition: TNextQueryDefinition;
begin
  // Uma pesquisa substitui a anterior: nenhum leitor antigo permanece ativo
  // nem associado as operacoes.
  Limpar;
  QueryDefinition := CreateQueryDefinition(ACriteria);
  FReader := FReaderFactory.CreateReader(QueryDefinition.Sql,
    QueryDefinition.Parameters);
  try
    if FReader = nil then
      raise Exception.Create(MissingReaderMessage);
    FReader.Pesquisar;
    FOperation.SetReader(FReader);
  except
    Limpar;
    raise;
  end;
end;

procedure TNextQueryDefinitionBase.Atualizar;
begin
  // Sem leitor nao existe resultado aberto a reler; a base nao cria um novo
  // leitor nesta chamada.
  if FReader = nil then
    raise Exception.Create(MissingReaderMessage);

  FReader.Atualizar;
end;

procedure TNextQueryDefinitionBase.Limpar;
begin
  // Desassociar antes de fechar impede que as operacoes alcancem um leitor
  // liberado ou uma linha do resultado anterior.
  FOperation.SetReader(nil);
  if FReader <> nil then
  begin
    FReader.Limpar;
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
    Result := FReader.DataSet;
end;

end.
