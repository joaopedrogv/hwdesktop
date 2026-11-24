unit DatasetColumnDefinition;

interface

uses
  FilterDefinition, GridColumnDefinition;

type
  // Declaracao unica de uma coluna da consulta: a grade e os filtros saem desta mesma lista.
  TDatasetColumnDefinition = record
    FieldName: string;
    Title: string;
    ValueType: TFilterFieldType;
    Width: Integer;
    Alignment: TGridColumnDefinitionAlignment;
    Behavior: TGridColumnBehavior;
    DisplayFormat: string;
    FilterEnabled: Boolean;
    FilterOperators: TFilterOperatorSet;
  end;

  TDatasetColumnDefinitions = TArray<TDatasetColumnDefinition>;

function QueryColumn(const AFieldName, ATitle: string; AValueType: TFilterFieldType; AWidth: Integer = 0;
  AAlignment: TGridColumnDefinitionAlignment = qcaDefault; ABehavior: TGridColumnBehavior = gcbConfigurableVisible;
  const ADisplayFormat: string = ''; AFilterEnabled: Boolean = True;
  const AFilterOperators: TFilterOperatorSet = []): TDatasetColumnDefinition;
function QueryColumns(const AItems: array of TDatasetColumnDefinition): TDatasetColumnDefinitions;

// Metadados de apresentacao da grade, na ordem das declaracoes recebidas.
function BuildGridColumns(const AColumns: TDatasetColumnDefinitions): TGridColumnDefinitions;

// Campos de filtro das declaracoes elegiveis: ficam de fora o que o usuario nunca ve (gcbAlwaysHidden) e o que a
// funcionalidade marca como nao filtravel.
function BuildFilterDefinition(const AColumns: TDatasetColumnDefinitions; AAllowAll: Boolean = True): TFilterDefinition;

implementation

function QueryColumn(const AFieldName, ATitle: string; AValueType: TFilterFieldType; AWidth: Integer;
  AAlignment: TGridColumnDefinitionAlignment; ABehavior: TGridColumnBehavior;
  const ADisplayFormat: string; AFilterEnabled: Boolean;
  const AFilterOperators: TFilterOperatorSet): TDatasetColumnDefinition;
begin
  Result.FieldName := AFieldName;
  Result.Title := ATitle;
  Result.ValueType := AValueType;
  Result.Width := AWidth;
  Result.Alignment := AAlignment;
  Result.Behavior := ABehavior;
  Result.DisplayFormat := ADisplayFormat;
  Result.FilterEnabled := AFilterEnabled;
  Result.FilterOperators := AFilterOperators;
end;

function QueryColumns(const AItems: array of TDatasetColumnDefinition): TDatasetColumnDefinitions;
var
  Index: Integer;
begin
  SetLength(Result, Length(AItems));
  for Index := 0 to High(AItems) do
    Result[Index] := AItems[Index];
end;

function FilterEligible(const AColumn: TDatasetColumnDefinition): Boolean;
begin
  Result := AColumn.FilterEnabled and (AColumn.Behavior in
    [gcbConfigurableVisible, gcbAlwaysVisible, gcbConfigurableHidden]);
end;

function BuildGridColumns(const AColumns: TDatasetColumnDefinitions): TGridColumnDefinitions;
var
  Index: Integer;
begin
  SetLength(Result, Length(AColumns));
  for Index := 0 to High(AColumns) do
    Result[Index] := GridColumn(AColumns[Index].FieldName,
      AColumns[Index].Title, AColumns[Index].Width, AColumns[Index].Alignment,
      AColumns[Index].Behavior, AColumns[Index].DisplayFormat);
end;

function BuildFilterDefinition(const AColumns: TDatasetColumnDefinitions; AAllowAll: Boolean): TFilterDefinition;
var
  Column: TDatasetColumnDefinition;
  Fields: TFilterFieldDefinitions;
  FieldCount: Integer;
  Operators: TFilterOperatorSet;
begin
  // Conjunto vazio de operadores significa o padrao do tipo.
  SetLength(Fields, Length(AColumns));
  FieldCount := 0;
  for Column in AColumns do
    if FilterEligible(Column) then
    begin
      if Column.FilterOperators <> [] then
        Operators := Column.FilterOperators
      else
        Operators := FilterDefaultOperators(Column.ValueType);

      Fields[FieldCount] := FilterField(Column.FieldName, Column.Title, Column.ValueType, Operators);
      Inc(FieldCount);
    end;

  SetLength(Fields, FieldCount);
  Result := FilterDefinitionOf(Fields, AAllowAll);
end;

end.
