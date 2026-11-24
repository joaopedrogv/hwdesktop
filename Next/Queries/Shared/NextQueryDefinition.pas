unit NextQueryDefinition;

interface

uses
  IDataSetReaderUnit, FilterCriterion, DatasetResultOperations,
  ColumnLayoutPreferences, ParameterValueUnit, NextDatasetDefinition;

type
  // Definicao de leitura independente de driver. Contem apenas SQL, parametros e metadados de colunas; nao executa
  // consulta nem conhece conexao.
  TNextSegmentQueryDefinition = record
    Sql: string;
    Parameters: ParametersValues;
  end;

  TNextQueryDefinition = class(TNextDatasetDefinitionBase)
  protected
    FReaderFactory: ISqlDataSetReaderFactory;
    function CreateQueryDefinition(const ACriteria: TFilterCriteria): TNextSegmentQueryDefinition; virtual; abstract;
    function CreateReader(const ACriteria: TFilterCriteria): IDataSetReader; override;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory; AOperation: IDataSetResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences);
  end;

implementation

uses
  System.SysUtils;

constructor TNextQueryDefinition.Create(AReaderFactory: ISqlDataSetReaderFactory;
  AOperation: IDataSetResultOperations; ALayoutPreferences: IColumnLayoutPreferences);
begin
  inherited Create(AOperation, ALayoutPreferences);
  if AReaderFactory = nil then
    raise Exception.Create('A fabrica de leitores da consulta nao foi informada.');

  FReaderFactory := AReaderFactory;
end;

function TNextQueryDefinition.CreateReader(const ACriteria: TFilterCriteria): IDataSetReader;
var
  QueryDefinition: TNextSegmentQueryDefinition;
begin
  QueryDefinition := CreateQueryDefinition(ACriteria);
  Result := FReaderFactory.CreateReader(QueryDefinition.Sql, QueryDefinition.Parameters);
end;

end.