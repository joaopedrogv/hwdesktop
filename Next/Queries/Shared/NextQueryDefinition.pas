unit NextQueryDefinition;

interface

uses
  IDataSetReaderUnit, FilterCriterion, QueryResultOperations, GridColumnDefinition, FilterDefinition, ParameterValueUnit;

type
  // Alinhamento de apresentacao da coluna. qcaDefault preserva o padrao da grade.
  TNextQueryColumnAlignment = (qcaDefault, qcaLeft, qcaCenter, qcaRight);
  // Definicao de leitura independente de driver. Contem apenas SQL, parametros
  // e metadados de colunas; nao executa consulta nem conhece conexao.
  TNextQueryDefinition = record
    Sql: string;
    Parameters: ParametersValues;
    //Columns: TNextQueryColumns;
  end;
  //
  INextQueryDefinitionBase = interface
    ['{D1A2B3C4-D5E6-F7A8-B9C0-D1E2F3A4B5C6}']
    function CreateReader(const ACriteria: TFilterCriteria): IDataSetReader;

    function GetResultOperation(): IQueryResultOperations;
    function GetColumnsDef: TGridColumnDefinitions;

    function GetFiltersDef(): TFilterDefinition;

    property FiltersDef: TFilterDefinition read GetFiltersDef;
    property ColumnsDef: TGridColumnDefinitions read GetColumnsDef;
  end;

  INextQueryDefinition<T> = interface(INextQueryDefinitionBase)
    ['{bb78610f-7934-4bdc-b859-cf0f9b052e69}']
    function GetSelected(): T;
  end;

  TNextQueryDefinitionBase = class(TInterfacedObject)
  protected
    FOperation: IQueryResultOperations;
    FReader: IDataSetReader;
    FReaderFactory: ISqlDataSetReaderFactory;
    FFiltersDef: TFilterDefinition;
    FColumnsDef: TGridColumnDefinitions;
    //function GetReader(): IDataSetReader;
    procedure Configure(); virtual;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory; AOperation: IQueryResultOperations);
    function GetResultOperation(): IQueryResultOperations;
    function GetColumnsDef: TGridColumnDefinitions;
    function GetFiltersDef(): TFilterDefinition;
  end;

implementation

uses
  SysUtils;

{ TNextQueryDefinitionBase }

constructor TNextQueryDefinitionBase.Create(AReaderFactory: ISqlDataSetReaderFactory; AOperation: IQueryResultOperations);
begin
  FOperation := AOperation;
  FReaderFactory := AReaderFactory;
  Configure();
end;

procedure TNextQueryDefinitionBase.Configure();
begin
  raise Exception.Create('Configuração da consulta não implementada');
end;
{
function TNextQueryDefinitionBase.GetReader: IDataSetReader;
begin
  if not Assigned(FReader) then
    raise Exception.Create('Reader não inicializado');
end;
}

function TNextQueryDefinitionBase.GetResultOperation(): IQueryResultOperations;
begin
  FOperation.SetReader(FReader);

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

end.