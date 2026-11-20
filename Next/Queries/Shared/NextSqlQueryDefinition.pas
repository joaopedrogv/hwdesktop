unit NextSqlQueryDefinition;

interface

uses
  IDataSetReaderUnit, FilterCriterion, QueryResultOperations,
  ColumnLayoutPreferences, ParameterValueUnit, NextQueryDefinition;

type
  // Definicao de leitura independente de driver. Contem apenas SQL, parametros e metadados de colunas; nao executa
  // consulta nem conhece conexao.
  TNextQueryDefinition = record
    Sql: string;
    Parameters: ParametersValues;
  end;

  TNextSqlQueryDefinitionBase = class(TNextQueryDefinitionBase)
  protected
    FReaderFactory: ISqlDataSetReaderFactory;
    function CreateQueryDefinition(const ACriteria: TFilterCriteria): TNextQueryDefinition; virtual; abstract;
    function CreateReader(const ACriteria: TFilterCriteria): IDataSetReader; override;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory; AOperation: IQueryResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences);
  end;

implementation

uses
  System.SysUtils;

constructor TNextSqlQueryDefinitionBase.Create(AReaderFactory: ISqlDataSetReaderFactory;
  AOperation: IQueryResultOperations; ALayoutPreferences: IColumnLayoutPreferences);
begin
  inherited Create(AOperation, ALayoutPreferences);
  if AReaderFactory = nil then
    raise Exception.Create('A fabrica de leitores da consulta nao foi informada.');

  FReaderFactory := AReaderFactory;
end;

function TNextSqlQueryDefinitionBase.CreateReader(const ACriteria: TFilterCriteria): IDataSetReader;
var
  QueryDefinition: TNextQueryDefinition;
begin
  QueryDefinition := CreateQueryDefinition(ACriteria);
  Result := FReaderFactory.CreateReader(QueryDefinition.Sql, QueryDefinition.Parameters);
end;

end.