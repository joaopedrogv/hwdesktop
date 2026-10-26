unit DataSetGrid;

interface

uses
  uDataSet_OOP, DB,
  hw_audit_utils,
  IObjectCacheUnit,
  TipoComunsUnit,
  FieldsConfigUnit,
  DataMatrixUnit;

type
  TDataSetGrid = class(TDataSet_OOP)
  private
    FSelectionField: TField;
    FSQLText: string;
    FCacheObjs: IObjectCache;
    function GetEmpresaId: Integer;
  protected
    function GetIsRowSelected(): Boolean;
    procedure CreateSelectionField(const FieldName: string);
    procedure CreateFieldsBySQL(const SQLNoReturn: string);
    procedure AddToCache(const Key: string; TTLMinutes: Integer = 0);
    function TryGetFromCache(const Key: string): Boolean;
    function GetSavedGrid(): IFieldsConfigBuilder;

    property SelectionField: TField read FSelectionField;
    property SQLText: string read FSQLText write FSQLText;
  public
    constructor Create(); overload; virtual;
    constructor Create(const AComponentName: string; const ATableName: string = ''); overload; virtual;
    destructor Destroy; override;

    //function GetColumnAsArray(const FielName: string): TArrayString; overload;
    function GetDataMatrix(
      const FieldNames: string;
      UseSelection: Boolean = True;
      ReturnCurrentAsDefault: Boolean = True
    ): TDataMatrix; overload;
    function GetDataMatrix(
      const FieldNames: TArrayString;
      UseSelection: Boolean = True;
      ReturnCurrentAsDefault: Boolean = True
    ): TDataMatrix; overload;

    function GetAuditorFill(const AProcesso: string; const Additional: string = ''): TAudit_OOP; virtual; abstract;

    property EmpresaId: Integer read GetEmpresaId;
  end;

implementation

uses
  uDtmAtivo,
  SysUtils,
  StrUtils,
  Math,
  Variants,
  DBClient,
  ObjectCacheUnit, StringServiceUnit;

type
  TFieldTypeKind = (ftkInteger, ftkString, ftkDouble, ftkDateTime);

  TFieldDefInfo = record
    Name: string;
    Kind: TFieldTypeKind;
    Size: Integer;
  end;

  TFieldValue = record
    Kind: TFieldTypeKind;
    IsNull: Boolean;
    AsInteger: Integer;
    AsString: string;
    AsDouble: Double;
    AsDateTime: TDateTime;
  end;

  TFieldValues = array of TFieldValue;

  TDataSetCacheItem = class(RecordWrapper)
  private
    FFieldDefs: array of TFieldDefInfo; // mantém nome, tipo lógico
    FRecords: array of TFieldValues;     // <<<<< agora é array de records
    FParamValues: string;
    procedure ApplyToDataSet(DataSet: TClientDataSet);
  public
    constructor Create(DataSet: TClientDataSet);
  end;

{ TDataSetCacheItem }

constructor TDataSetCacheItem.Create(DataSet: TClientDataSet);
var
  i, j: Integer;
  Field: TField;
  Value: TFieldValue;
begin
  // Definições dos campos
  SetLength(FFieldDefs, DataSet.FieldCount);
  for i := 0 to DataSet.FieldCount - 1 do
  begin
    Field := DataSet.Fields[i];
    FFieldDefs[i].Name := Field.FieldName;
    case Field.DataType of
      ftInteger, ftSmallint, ftWord, ftAutoInc:
        FFieldDefs[i].Kind := ftkInteger;
      ftString, ftFixedChar, ftWideString:
        FFieldDefs[i].Kind := ftkString;
      ftFloat, ftCurrency, ftBCD:
        FFieldDefs[i].Kind := ftkDouble;
      ftDate, ftTime, ftDateTime:
        FFieldDefs[i].Kind := ftkDateTime;
      else
        raise Exception.Create('Tipo de campo não suportado: ' + Field.FieldName);
    end;
  end;

  // Dados
  if DataSet.IsEmpty then
  begin
    SetLength(FRecords, 0);
    Exit;
  end;

  SetLength(FRecords, DataSet.RecordCount);
  DataSet.DisableControls;
  try
    DataSet.First;
    i := 0;
    while not DataSet.Eof do
    begin
      SetLength(FRecords[i], DataSet.FieldCount);
      for j := 0 to DataSet.FieldCount - 1 do
      begin
        Field := DataSet.Fields[j];

        FRecords[i][j].IsNull := Field.IsNull;

        case FFieldDefs[j].Kind of
          ftkInteger:
            FRecords[i][j].AsInteger := Field.AsInteger;
          ftkString:
            FRecords[i][j].AsString := Field.AsString;
          ftkDouble:
            FRecords[i][j].AsDouble := Field.AsFloat; // ou AsCurrency
          ftkDateTime:
            FRecords[i][j].AsDateTime := Field.AsDateTime;
        end;
        FRecords[i][j].Kind := FFieldDefs[j].Kind;
      end;
      DataSet.Next;
      Inc(i);
    end;
    DataSet.First;
  finally
    DataSet.EnableControls;
  end;
end;

procedure TDataSetCacheItem.ApplyToDataSet(DataSet: TClientDataSet);
var
  i, j: Integer;
  FieldDef: TFieldDefInfo;
begin
  DataSet.Close;
//  DataSet.FieldDefs.Clear;
//
//  // Recria a estrutura
//  for i := 0 to High(FFieldDefs) do
//  begin
//    FieldDef := FFieldDefs[i];
//    case FieldDef.Kind of
//      ftkInteger:   DataSet.FieldDefs.Add(FieldDef.Name, ftInteger, 0);
//      ftkString:    DataSet.FieldDefs.Add(FieldDef.Name, ftString, 255); // ajuste tamanho se necessário
//      ftkDouble:    DataSet.FieldDefs.Add(FieldDef.Name, ftFloat, 0);
//      ftkDateTime:  DataSet.FieldDefs.Add(FieldDef.Name, ftDateTime, 0);
//    end;
//  end;

  DataSet.CreateDataSet;
  DataSet.DisableControls;
  try
    for i := 0 to High(FRecords) do
    begin
      DataSet.Append;
      for j := 0 to DataSet.FieldCount - 1 do
      begin
        if not FRecords[i][j].IsNull then        
          case FRecords[i][j].Kind of
            ftkInteger:   DataSet.Fields[j].AsInteger := FRecords[i][j].AsInteger;
            ftkString:    DataSet.Fields[j].AsString := FRecords[i][j].AsString;
            ftkDouble:    DataSet.Fields[j].AsFloat := FRecords[i][j].AsDouble;
            ftkDateTime:  DataSet.Fields[j].AsDateTime := FRecords[i][j].AsDateTime;
          end;
      end;
      DataSet.Post;
    end;
    DataSet.First();
  finally
    DataSet.EnableControls;
  end;
end;

{ TDataSetGrid }

procedure TDataSetGrid.AddToCache(const Key: string; TTLMinutes: Integer);
begin
  FCacheObjs.Add( Key, TDataSetCacheItem.Create( dataSet ), TTLMinutes );
end;

constructor TDataSetGrid.Create(const AComponentName, ATableName: string);
begin
  FCacheObjs := ObjectCache.Create();
  TableName  := IfThen( ATableName <> '', ATableName, AComponentName );

  inherited Create(dtmAtivo.bancoHw, nil, True, AComponentName);
end;

function TDataSetGrid.GetDataMatrix(
  const FieldNames: TArrayString; UseSelection, ReturnCurrentAsDefault: Boolean
): TDataMatrix;
var
  Headers, Values, CurrentValues: TArrayString;
  I: Integer;
begin
  Headers := Copy(FieldNames, 0, Length(FieldNames));

  Result := TDataMatrix.Create;
  Result.SetHeaders( Headers );

  if ReturnCurrentAsDefault then
  begin
    SetLength(CurrentValues, Length(Headers));
    for I := 0 to High(Headers) do
      CurrentValues[I] := fstr(Headers[I]);
  end;

  Self.prepare_loop();
  try
    while not Self.Eof do
    begin
      // Caso o grid nao tenha o campo de selecao, entao tudo para criar
      if not UseSelection or GetIsRowSelected() then
      begin
        SetLength(Values, Length(Headers));
        for I := 0 to High(Headers) do
          Values[I] := fstr(Headers[I]);

        Result.AddRow( Values );
      end;

      Self.Next;
    end;
  finally
    Self.prepare_loop_done();
  end;

  if (Result.RowCount = 0) and ReturnCurrentAsDefault then
    Result.AddRow( CurrentValues );
end;

function TDataSetGrid.GetDataMatrix(const FieldNames: string; UseSelection, ReturnCurrentAsDefault: Boolean): TDataMatrix;
begin
  Result := Self.GetDataMatrix(
    StringService.Split([';'], StringReplace(FieldNames, ',', ';', [rfReplaceAll])),
    UseSelection,
    ReturnCurrentAsDefault
  );
end;

function TDataSetGrid.GetEmpresaId: Integer;
begin
  Result := vDadosIni.cod_empresa;
end;

function TDataSetGrid.GetIsRowSelected: Boolean;
begin
  Result := False;
  if Assigned(FSelectionField) then
    case FSelectionField.DataType of
      ftBoolean:
        Result := FSelectionField.AsBoolean;

      ftSmallint, ftInteger:
        Result := FSelectionField.AsInteger = 1;

      ftString, ftWideString:
        Result := FSelectionField.AsString <> '';
    end;
end;

function TDataSetGrid.GetSavedGrid: IFieldsConfigBuilder;
var
  I: Integer;
begin
  queryCons.SQL(
    'select * from config_colunas ' +
    ' where usuario = ''%s'' ' +
    ' and componente = ''%s'' ' +
    ' order by ordem',
    [ vDadosIni.vNomeUsuario, dataSet.Name ]
  ).Open;
  try
    I := Length(dataSet.Name) + 1;
    Result := FieldsConfigFactory.Create();
    while not queryCons.Eof do
    begin
      Result.Add(
        queryCons.fcopy('campos', I, 64),
        FieldConfigVisibilidade(IfThen(queryCons.fequals('visivel', '0'), Ord(fvInvisivel), Ord(fvSempreVisivel)))
      ).Width( queryCons.fint('largura_exibicao') );

      queryCons.Next();
    end;
  finally
    queryCons.Close()
  end;
end;

function TDataSetGrid.TryGetFromCache(const Key: string): Boolean;
var
  CachedDataset: TDataSetCacheItem;
begin
  Result := FCacheObjs.TryGetValue(Key, TObject(CachedDataset));
  if Result then
    CachedDataset.ApplyToDataSet( dataSet );
end;

constructor TDataSetGrid.Create;
begin
  Self.Create( Self.ClassName, 'CDS_' + Self.ClassName );
end;

procedure TDataSetGrid.CreateFieldsBySQL(const SQLNoReturn: string);
begin
  with queryCons.SQL(SQLNoReturn).Open() do
  try
    AssignAndCreateFieldsFrom( query );
  finally
    Close();
  end;
end;

procedure TDataSetGrid.CreateSelectionField(const FieldName: string);
begin
  if FieldName <> '' then
  begin
    AddFieldInternalCalc(FieldName, ftBoolean);
    FSelectionField := dataSet.FindField(FieldName);
  end
  else
    FSelectionField := nil;
end;

destructor TDataSetGrid.Destroy;
begin
  {$IFDEF INTF_ON}
  FCacheObjs := nil;
  {$ELSE}
  FreeAndNil(FCacheObjs);
  {$ENDIF}

  inherited;
end;

end.
