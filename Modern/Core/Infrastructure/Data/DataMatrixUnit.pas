unit DataMatrixUnit;

interface

uses
  Classes, SysUtils, TipoComunsUnit;

type
  TStringMatrix = array of TArrayString;

  {
    TDataMatrix:
    - Armazena cabeçalhos (nomes dos campos) e dados (matriz de strings).
    - Possui um cursor interno para iteração (First, Next, EOF).
    - Permite acesso direto por índice ou nome do campo.
  }
  TDataMatrix = class
  private
    FHeaders: TArrayString;      // Nomes das colunas
    FRows: TStringMatrix;        // Dados (Linhas)
    FCurrentRow: Integer;        // Cursor para iteração interna
    FCapacity: Integer;          // Quantas linhas cabem sem realocar
    FCount: Integer;             // Quantas linhas estão realmente usadas  
    FIterationStarted: Boolean;  // Flag para controle inteligente do First
    const
      DEFAULT_DELTA = 100;       // Cresce de 100 em 100 linhas

    function GetRowCount: Integer;
    function GetColCount: Integer;
    function GetEOF: Boolean;
    procedure EnsureCapacity();
    procedure EnsureIterationStarted();
  public
    constructor Create;
    destructor Destroy; override;

    { Configuração }
    procedure SetHeaders(const AHeaders: TArrayString);

    { Inserção de Dados }
    procedure AddRow(const AValues: TArrayString);

    { Acesso Direto (Sem iteração) }
    function GetCell(const AFieldName: string; ARowIndex: Integer): string;
    function GetColumnArray(const AFieldName: string): TArrayString;
    function GetColIndex(const AFieldName: string): Integer;

    { Iteração Interna (Cursor) }
    procedure First;
    procedure Next;
    function CurrentRowValues: TArrayString;
    function CurrentFieldValue(const AFieldName: string): string; overload;
    function CurrentFieldValue(const AColumnIndex: Integer): string; overload;

    { Utilitario }
    procedure Clear;
    procedure ResetIteration; // Permite reler os dados sem criar nova instância

    { Propriedades }
    property RowCount: Integer read GetRowCount;
    property ColCount: Integer read GetColCount;
    property Headers: TArrayString read FHeaders;
    property EOF: Boolean read GetEOF;
  end;

  {
    TDataMatrixLoader:
    - Helper estático para popular o TDataMatrix a partir de um Dataset.

  TDataMatrixLoader = class
  public
    class function CreateFromDataset(ADataset: TDataset;
      const AFieldNames: array of string): TDataMatrix;
  end;
  }

implementation

{ TDataMatrix }

procedure TDataMatrix.Clear;
begin
  FHeaders := nil;
  FRows := nil;
  FCount := 0;
  FCapacity := 0;
  ResetIteration;
end;

constructor TDataMatrix.Create;
begin
  inherited Create;
  FCount := 0;
  FCapacity := 0;
  FCurrentRow := -1;
  FIterationStarted := False;
  SetLength(FHeaders, 0);
  SetLength(FRows, 0);
end;

destructor TDataMatrix.Destroy;
begin
  Clear();
  inherited Destroy;
end;

function TDataMatrix.GetColIndex(const AFieldName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(FHeaders) do
  begin
    if CompareText(FHeaders[I], AFieldName) = 0 then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

function TDataMatrix.GetRowCount: Integer;
begin
  Result := FCount;
end;

function TDataMatrix.GetColCount: Integer;
begin
  Result := Length(FHeaders);
end;

procedure TDataMatrix.SetHeaders(const AHeaders: TArrayString);
begin
  Clear; // Reseta dados anteriores
  FHeaders := Copy(AHeaders, 0, Length(AHeaders));
end;

procedure TDataMatrix.AddRow(const AValues: TArrayString);
begin
  EnsureCapacity;

  FRows[FCount] := Copy(AValues, 0, Length(AValues));
  Inc(FCount);
end;

function TDataMatrix.GetCell(const AFieldName: string; ARowIndex: Integer): string;
var
  ColIdx: Integer;
begin
  Result := '';
  ColIdx := GetColIndex(AFieldName);
  if (ColIdx >= 0) and (ARowIndex >= 0) and (ARowIndex < FCount) then
    Result := FRows[ARowIndex][ColIdx];
end;

function TDataMatrix.GetColumnArray(const AFieldName: string): TArrayString;
var
  I, ColIdx: Integer;
begin
  ColIdx := GetColIndex(AFieldName);
  SetLength(Result, 0);

  if ColIdx < 0 then Exit;

  SetLength(Result, FCount);
  for I := 0 to FCount - 1 do
    Result[I] := FRows[I][ColIdx];
end;

procedure TDataMatrix.First;
begin
  if FCount > 0 then
    FCurrentRow := 0
  else
    FCurrentRow := -1;
  
  FIterationStarted := True;
end;

procedure TDataMatrix.Next;
begin
  EnsureIterationStarted();

  if FCurrentRow < FCount - 1 then
    Inc(FCurrentRow)
  else
    FCurrentRow := FCount; // Marca como GetEOF
end;

procedure TDataMatrix.ResetIteration;
begin
  FCurrentRow := -1;
  FIterationStarted := False;
end;

procedure TDataMatrix.EnsureCapacity;
var
  NewCapacity: Integer;
begin
  if FCount >= FCapacity then
  begin
    if FCapacity = 0 then
      NewCapacity := DEFAULT_DELTA
    else
      NewCapacity := FCapacity + DEFAULT_DELTA;
    
    SetLength(FRows, NewCapacity);
    FCapacity := NewCapacity;
  end;
end;

procedure TDataMatrix.EnsureIterationStarted;
begin
  if not FIterationStarted then
    First;
end;

function TDataMatrix.GetEOF: Boolean;
begin
  Result := (FCurrentRow < 0) or (FCurrentRow >= RowCount);
end;

function TDataMatrix.CurrentRowValues: TArrayString;
begin
  EnsureIterationStarted();

  if not GetEOF and (FCurrentRow >= 0) then
    Result := Copy(FRows[FCurrentRow], 0, Length(FRows[FCurrentRow]))
  else
    SetLength(Result, 0);
end;

function TDataMatrix.CurrentFieldValue(const AColumnIndex: Integer): string;
begin
  EnsureIterationStarted();

  Result := '';
  if (AColumnIndex >= 0) and (FCurrentRow >= 0) and (FCurrentRow < RowCount) then
    Result := FRows[FCurrentRow][AColumnIndex];
end;

function TDataMatrix.CurrentFieldValue(const AFieldName: string): string;
begin
  EnsureIterationStarted();
  
  Result := GetCell(AFieldName, FCurrentRow);
end;

{ TDataMatrixLoader }
{
class function TDataMatrixLoader.CreateFromDataset(ADataset: TDataset; 
  const AFieldNames: array of string): TDataMatrix;
var
  I: Integer;
  LValues: TArrayString;
  LBookmark: TBookmark;
begin
  Result := TDataMatrix.Create;

  if ADataset = nil then Exit;
  
  // 1. Definir Cabeçalhos
  SetLength(LValues, Length(AFieldNames));
  for I := 0 to High(AFieldNames) do
    LValues[I] := AFieldNames[I];
  Result.SetHeaders(LValues);
  
  // 2. Verificar se campos existem
  for I := 0 to High(AFieldNames) do
  begin
    if ADataset.FindField(AFieldNames[I]) = nil then
      raise Exception.CreateFmt('Campo %s não encontrado no Dataset.', [AFieldNames[I]]);
  end;

  // 3. Iterar no Dataset
  // Salvamos a posição atual para retornar depois
  LBookmark := ADataset.GetBookmark;
  try
    ADataset.DisableControls;
    try
      ADataset.First;
      while not ADataset.GetEOF do
      begin
        // Pega apenas os campos definidos no modelo
        SetLength(LValues, Length(AFieldNames));
        for I := 0 to High(AFieldNames) do
          LValues[I] := ADataset.FieldByName(AFieldNames[I]).AsString;
        
        Result.AddRow(LValues);
        ADataset.Next;
      end;
    finally
      ADataset.EnableControls;
    end;
  finally
    ADataset.GotoBookmark(LBookmark);
    ADataset.FreeBookmark(LBookmark);
  end;
end;
}

end.
