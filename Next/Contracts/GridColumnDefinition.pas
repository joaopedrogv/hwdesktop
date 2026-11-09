unit GridColumnDefinition;

interface

type
  // Alinhamento de apresentacao da coluna. qcaDefault preserva o padrao da grade.
  TGridColumnDefinitionAlignment = (qcaDefault, qcaLeft, qcaCenter, qcaRight);

  // Metadados de apresentacao de uma coluna. Width igual a zero preserva a
  // largura padrao da grade.
  TGridColumnDefinition = record
    FieldName: string;
    Title: string;
    Width: Integer;
    Alignment: TGridColumnDefinitionAlignment;
  end;

  TGridColumnDefinitions = TArray<TGridColumnDefinition>;

function GridColumn(const AFieldName, ATitle: string;
  AWidth: Integer = 0;
  AAlignment: TGridColumnDefinitionAlignment = qcaDefault): TGridColumnDefinition;
function GridColumns(const AItems: array of TGridColumnDefinition): TGridColumnDefinitions;

implementation

function GridColumn(const AFieldName, ATitle: string;
  AWidth: Integer; AAlignment: TGridColumnDefinitionAlignment): TGridColumnDefinition;
begin
  Result.FieldName := AFieldName;
  Result.Title := ATitle;
  Result.Width := AWidth;
  Result.Alignment := AAlignment;
end;

function GridColumns(const AItems: array of TGridColumnDefinition): TGridColumnDefinitions;
var
  I: Integer;
begin
  SetLength(Result, Length(AItems));
  for I := 0 to High(AItems) do
    Result[I] := AItems[I];
end;

end.
