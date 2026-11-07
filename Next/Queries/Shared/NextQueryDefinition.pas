unit NextQueryDefinition;

interface

uses
  ParameterValueUnit;

type
  // Alinhamento de apresentacao da coluna. qcaDefault preserva o padrao da grade.
  TNextQueryColumnAlignment = (qcaDefault, qcaLeft, qcaCenter, qcaRight);

  // Metadados de apresentacao de uma coluna. Width igual a zero preserva a
  // largura padrao da grade.
  TNextQueryColumn = record
    FieldName: string;
    Title: string;
    Width: Integer;
    Alignment: TNextQueryColumnAlignment;
  end;

  TNextQueryColumns = TArray<TNextQueryColumn>;

  // Definicao de leitura independente de driver. Contem apenas SQL, parametros
  // e metadados de colunas; nao executa consulta nem conhece conexao.
  TNextQueryDefinition = record
    Sql: string;
    Parameters: ParametersValues;
    Columns: TNextQueryColumns;
  end;

function QueryColumn(const AFieldName, ATitle: string;
  AWidth: Integer = 0;
  AAlignment: TNextQueryColumnAlignment = qcaDefault): TNextQueryColumn;
function QueryColumns(const AItems: array of TNextQueryColumn): TNextQueryColumns;

implementation

function QueryColumn(const AFieldName, ATitle: string;
  AWidth: Integer; AAlignment: TNextQueryColumnAlignment): TNextQueryColumn;
begin
  Result.FieldName := AFieldName;
  Result.Title := ATitle;
  Result.Width := AWidth;
  Result.Alignment := AAlignment;
end;

function QueryColumns(const AItems: array of TNextQueryColumn): TNextQueryColumns;
var
  I: Integer;
begin
  SetLength(Result, Length(AItems));
  for I := 0 to High(AItems) do
    Result[I] := AItems[I];
end;

end.
