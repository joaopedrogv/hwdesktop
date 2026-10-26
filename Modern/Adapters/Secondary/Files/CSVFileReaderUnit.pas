unit CSVFileReaderUnit;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.IOUtils,
  ICSVReaderUnit;

type
  CSVRow = class(TInterfacedObject, ICSVRow)
  private
    FValues: TArray<string>;
    FHeaderMap: TDictionary<string, Integer>;
    FHasHeaders: Boolean;
  public
    constructor Create(const Values: TArray<string>;
                      const HeaderMap: TDictionary<string, Integer>;
                      HasHeaders: Boolean);
    destructor Destroy; override;

    function GetFieldByIndex(const Index: Integer): string;
    function GetFieldByName(const Name: string): string;
    function TryGetFieldByName(const Name: string; out Value: string): Boolean;
    function GetColumnCount: Integer;

    property Fields[const Index: Integer]: string read GetFieldByIndex; default;
    property FieldByName[const Name: string]: string read GetFieldByName;
  end;

  /// <summary>
  /// Adaptador de Leitura de Arquivo CSV
  /// Implementa a infraestrutura de acesso a dados
  /// </summary>
  CSVFileReader = class(TInterfacedObject, ICSVReader)
  private
    FReader: TStreamReader;
    FConfig: CSVConfig;
    FHeaderMap: TDictionary<string, Integer>;
    FColumnNames: TArray<string>;
    FCurrentLineNumber: Integer;
    FDataLineNumber: Integer;
    FIsOpen: Boolean;
    FEndOfFile: Boolean;
    FNextLine: string;
    FFileName: string;
    FHasNextLine: Boolean;

    procedure ReadNextLine;
    function ParseLine(const Line: string): TArray<string>;
    function ProcessField(const Field: string): string;
    procedure LoadHeaders;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Open(const FileName: string; const Config: CSVConfig);
    procedure Close;
    function HasNext: Boolean;
    function Next: ICSVRow;
    function GetCurrentLineNumber: Integer;
    procedure Reset;
    function GetColumnNames: TArray<string>;
    function GetColumnCount: Integer;

    property ColumnNames: TArray<string> read GetColumnNames;
    property ColumnCount: Integer read GetColumnCount;
  end;

implementation

{ CSVRow }

constructor CSVRow.Create(const Values: TArray<string>;
                          const HeaderMap: TDictionary<string, Integer>;
                          HasHeaders: Boolean);
begin
  inherited Create;
  FValues := Copy(Values);
  FHeaderMap := HeaderMap;
  FHasHeaders := HasHeaders;
end;

destructor CSVRow.Destroy;
begin
  // FHeaderMap é gerenciado pelo CSVFileReader
  inherited Destroy;
end;

function CSVRow.GetFieldByIndex(const Index: Integer): string;
begin
  if (Index >= 0) and (Index < Length(FValues)) then
    Result := FValues[Index]
  else
    Result := '';
end;

function CSVRow.GetFieldByName(const Name: string): string;
begin
  if not TryGetFieldByName(Name, Result) then
    Result := '';
end;

function CSVRow.TryGetFieldByName(const Name: string; out Value: string): Boolean;
var
  Index: Integer;
begin
  Result := False;
  Value := '';

  if FHasHeaders and Assigned(FHeaderMap) then
  begin
    if FHeaderMap.TryGetValue(Name, Index) then
    begin
      Value := GetFieldByIndex(Index);
      Result := True;
    end;
  end;
end;

function CSVRow.GetColumnCount: Integer;
begin
  Result := Length(FValues);
end;

{ CSVFileReader }

constructor CSVFileReader.Create;
begin
  inherited Create;
  FHeaderMap := TDictionary<string, Integer>.Create;
  FIsOpen := False;
  FEndOfFile := False;
  FHasNextLine := False;
  FCurrentLineNumber := 0;
  FDataLineNumber := 0;
end;

destructor CSVFileReader.Destroy;
begin
  Close;
  FHeaderMap.Free;
  inherited Destroy;
end;

procedure CSVFileReader.Close;
begin
  if Assigned(FReader) then
  begin
    FReader.Free;
    FReader := nil;
  end;

  FHeaderMap.Clear;
  FColumnNames := nil;
  FIsOpen := False;
  FEndOfFile := False;
  FHasNextLine := False;
  FCurrentLineNumber := 0;
  FDataLineNumber := 0;
  FNextLine := '';
end;

procedure CSVFileReader.Open(const FileName: string; const Config: CSVConfig);
begin
  Close;

  if not TFile.Exists(FileName) then
    raise ECsvException.CreateFmt('Arquivo não encontrado: %s', [FileName]);

  FFileName := FileName;
  FConfig := Config;
  FReader := TStreamReader.Create(FileName, FConfig.GetEncoding);
  FIsOpen := True;
  FCurrentLineNumber := 0;
  FDataLineNumber := 0;

  // Lê a primeira linha para inicializar o buffer
  ReadNextLine;

  // Processa header se necessário
  if FConfig.HasHeader and FHasNextLine then
    LoadHeaders;
end;

procedure CSVFileReader.ReadNextLine;
begin
  if Assigned(FReader) and not FReader.EndOfStream then
  begin
    FNextLine := FReader.ReadLine;
    Inc(FCurrentLineNumber);
    FHasNextLine := True;
  end
  else
  begin
    FNextLine := '';
    FHasNextLine := False;
    FEndOfFile := True;
  end;
end;

procedure CSVFileReader.LoadHeaders;
var
  HeaderFields: TArray<string>;
  i: Integer;
  FieldName: string;
begin
  if not FHasNextLine then
    Exit;

  HeaderFields := ParseLine(FNextLine);
  SetLength(FColumnNames, Length(HeaderFields));

  FHeaderMap.Clear;
  for i := 0 to Length(HeaderFields) - 1 do
  begin
    FieldName := HeaderFields[i];
    FColumnNames[i] := FieldName;

    // Evita duplicatas no header
    if not FHeaderMap.ContainsKey(FieldName) then
      FHeaderMap.Add(FieldName, i);
  end;

  // Lê próxima linha após o header
  ReadNextLine;
end;

function CSVFileReader.ParseLine(const Line: string): TArray<string>;
var
  Fields: TList<string>;
  CurrentField: string;
  i: Integer;
  InQuotes: Boolean;
  CurrentChar: Char;
  LineLength: Integer;
begin
  Fields := TList<string>.Create;
  try
    CurrentField := '';
    InQuotes := False;
    i := 1;
    LineLength := Length(Line);

    while i <= LineLength do
    begin
      CurrentChar := Line[i];

      if CurrentChar = FConfig.QuoteChar then
      begin
        if InQuotes and (i < LineLength) and (Line[i + 1] = FConfig.QuoteChar) then
        begin
          // Quote escaped (ex: "")
          CurrentField := CurrentField + FConfig.QuoteChar;
          Inc(i, 2); // Avança 2 posições para pular as duas aspas
          Continue;
        end
        else
        begin
          // Toggle quote state
          InQuotes := not InQuotes;
          Inc(i);
          Continue;
        end;
      end
      else if (CurrentChar = FConfig.Separator) and not InQuotes then
      begin
        // Fim do campo
        Fields.Add(ProcessField(CurrentField));
        CurrentField := '';
        Inc(i);
        Continue;
      end
      else
      begin
        CurrentField := CurrentField + CurrentChar;
        Inc(i);
      end;
    end;

    // Adiciona último campo
    Fields.Add(ProcessField(CurrentField));

    Result := Fields.ToArray;
  finally
    Fields.Free;
  end;
end;

function CSVFileReader.ProcessField(const Field: string): string;
begin
  Result := Field;
  if FConfig.TrimFields then
    Result := Result.Trim;
end;

function CSVFileReader.HasNext: Boolean;
begin
  Result := FIsOpen and FHasNextLine;

  // Se configurado para pular linhas vazias, verifica
  if Result and FConfig.SkipEmptyLines then
  begin
    while FHasNextLine and (FNextLine.Trim.IsEmpty) do
    begin
      ReadNextLine;
    end;

    Result := FHasNextLine;
  end;
end;

function CSVFileReader.Next: ICSVRow;
var
  Fields: TArray<string>;
begin
  Result := nil;

  if not HasNext then
    Exit;

  Fields := ParseLine(FNextLine);
  Inc(FDataLineNumber);

  Result := CSVRow.Create(Fields, FHeaderMap, FConfig.HasHeader);

  // Lê próxima linha
  ReadNextLine;
end;

function CSVFileReader.GetCurrentLineNumber: Integer;
begin
  Result := FDataLineNumber;
end;

procedure CSVFileReader.Reset;
var
  FileName: string;
begin
  if not FIsOpen then
    Exit;

  // Precisa fechar e reabrir para resetar o stream
  FileName := FFileName;
  Close;
  Open(FileName, FConfig);
end;

function CSVFileReader.GetColumnNames: TArray<string>;
begin
  Result := Copy(FColumnNames);
end;

function CSVFileReader.GetColumnCount: Integer;
begin
  Result := Length(FColumnNames);
end;

end.
