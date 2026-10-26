unit QueryResultUnit;

interface

uses
  DB,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit,
  DoubleNullableUnit,
  CurrencyNullableUnit,
  ScalarResultUnit;

type
  QueryResult = class
  private
    FDataSet: TDataSet;
    FOwnsDataSet: Boolean;
    FCharSet: string;
    function GetQueryIsEmpty(): Boolean;
    function GetEof(): Boolean;
  public
    constructor Create(DataSetAccess: TDataSet; CharSet: string; OwnsDataSet: Boolean = True);
    destructor Destroy; override;

    // Eu nao posso usar essa classe para criar SQL, isso mistura com a finalidade da classe
    // Se necessario eu preciso de outra classe ou record builder

    //Metodos da query
    procedure Next();

    //Acessos aos dados da query
    function FieldAsString(const FieldName: string; TrimSpace: Boolean = True): string;
    function FieldAsStringNullable(const FieldName: string; TrimSpace: Boolean = True): StringNullable;
    function FieldAsInteger(const FieldName: string): Integer;
    function FieldAsInt64(const FieldName: string): Int64;
    function FieldAsIntNullable(const FieldName: string): IntegerNullable;
    function FieldAsInt64Nullable(const FieldName: string): Int64Nullable;
    function FieldAsCurrency(const FieldName: string): Currency;
    function FieldAsCurrencyNullable(const FieldName: string): CurrencyNullable;
    function FieldAsDate(const FieldName: string): TDate;
    function FieldAsDateNullable(const FieldName: string): DateNullable;
    function FieldAsDateTimeNullable(const FieldName: string): DateTimeNullable;
    function FieldAsDateTime(const FieldName: string): TDateTime;
    function FieldAsDouble(const FieldName: string): Double;
    function FieldAsDoubleNullable(const FieldName: string): DoubleNullable;
    function FieldAsFloat(const FieldName: string): Double;
    function FieldAsScalar(const FieldName: string): ScalarResult;

    //Testes
    function FieldIsNull(const FieldName: string): Boolean;
    function FieldIsNullOrWhiteSpace(const FieldName: string): Boolean;
    function FieldAreEquals(const FieldName, Value: string; TrimSpace: Boolean = True): Boolean; overload;
    function FieldAreEquals(const FieldName: string; Value: Integer): Boolean; overload;

    // Iteracoes no Dataset
    function GetArrayIntFrom(const FieldName: string): TArrayInteger;
    function FieldAsStringToArrayInt(const FieldName, Separator: string): TArrayInteger;
    function FieldAsStringToArrayString(const FieldName, Separator: string): TArrayString;

    procedure FreeQueryResult();

    property DataSet: TDataSet read FDataSet;
    property IsEmpty: Boolean read GetQueryIsEmpty;
    property Eof: Boolean read GetEof;
  end;

implementation

uses
  SysUtils;

{ DataSetWrapper }

constructor QueryResult.Create(DataSetAccess: TDataSet; CharSet: string; OwnsDataSet: Boolean);
begin
  inherited Create;
  FDataSet := DataSetAccess;
  FOwnsDataSet := OwnsDataSet;
  FCharSet := CharSet;
end;

destructor QueryResult.Destroy;
begin
  if FOwnsDataSet and Assigned(FDataSet) then
    FDataSet.Free;
  inherited;
end;

function QueryResult.FieldAreEquals(const FieldName, Value: string; TrimSpace: Boolean): Boolean;
begin
  Result := FieldAsString(FieldName, TrimSpace) = Value;
end;

function QueryResult.FieldAreEquals(const FieldName: string; Value: Integer): Boolean;
begin
  Result := FieldAsInteger(FieldName) = Value;
end;

function QueryResult.FieldAsCurrency(const FieldName: string): Currency;
begin
  Result := FDataSet.FieldByName(FieldName).AsCurrency;
end;

function QueryResult.FieldAsCurrencyNullable(
  const FieldName: string): CurrencyNullable;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);
  if Field.IsNull then
    Result := CurrencyNullable.NullInstance()
  else
    Result := CurrencyNullable.Create(Field.AsCurrency);
end;

function QueryResult.FieldAsDate(const FieldName: string): TDate;
begin
  Result := FDataSet.FieldByName(FieldName).AsDateTime;
end;

function QueryResult.FieldAsDateNullable(const FieldName: string): DateNullable;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);
  if Field.IsNull then
    Result := DateNullable.NullInstance()
  else
    Result := DateNullable.Create(Field.AsDateTime);
end;

function QueryResult.FieldAsDateTime(const FieldName: string): TDateTime;
begin
  Result := FDataSet.FieldByName(FieldName).AsDateTime;
end;

function QueryResult.FieldAsDateTimeNullable(
  const FieldName: string): DateTimeNullable;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);
  if Field.IsNull then
    Result := DateTimeNullable.NullInstance()
  else
    Result := DateTimeNullable.Create(Field.AsDateTime);
end;

function QueryResult.FieldAsDouble(const FieldName: string): Double;
begin
  Result := FDataSet.FieldByName(FieldName).AsFloat;
end;

function QueryResult.FieldAsDoubleNullable(
  const FieldName: string): DoubleNullable;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);
  if Field.IsNull then
    Result := DoubleNullable.NullInstance()
  else
    Result := DoubleNullable.Create(Field.AsFloat);
end;

function QueryResult.FieldAsFloat(const FieldName: string): Double;
begin
  Result := FieldAsDouble(FieldName);
end;

function QueryResult.FieldAsInt64(const FieldName: string): Int64;
begin
  {$IFNDEF VER180}
  Result := FDataSet.FieldByName(FieldName).AsLargeInt;
  {$ELSE}
  Result := FDataSet.FieldByName(FieldName).AsInteger;
  {$ENDIF}
end;

function QueryResult.FieldAsInt64Nullable(const FieldName: string): Int64Nullable;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);
  if Field.IsNull then
    Result := Int64Nullable.NullInstance()
  else
    Result := Int64Nullable.Create(
      {$IFNDEF VER180}
      Field.AsLargeInt
      {$ELSE}
      TLargeintField(Field).Value
      {$ENDIF}
    );
end;

function QueryResult.FieldAsInteger(const FieldName: string): Integer;
begin
  Result := FDataSet.FieldByName(FieldName).AsInteger;
end;

function QueryResult.FieldAsIntNullable(const FieldName: string): IntegerNullable;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);
  if Field.IsNull then
    Result := IntegerNullable.NullInstance()
  else
    Result := IntegerNullable.Create(Field.AsInteger);
end;

function QueryResult.FieldAsScalar(const FieldName: string): ScalarResult;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);

  if Field.IsNull then
    Result := ScalarResult.Null()
  else
  begin
    case Field.DataType of
      ftDate, ftTime, ftDateTime, ftTimeStamp:
        Result := ScalarResult.FromDateTime( Field.AsDateTime );

      ftFloat, ftCurrency{$IFNDEF VER180}, ftExtended{$ENDIF}:
        Result := ScalarResult.FromDouble( Field.AsFloat );

      {$IFNDEF VER180} ftObject, ftConnection, ftParams, ftStream, {$ENDIF}
      ftInterface, ftIDispatch,
      ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftGraphic:
        raise Exception.Create('QueryResult.FieldAsScalar Formato de campo não implementado');

      ftBoolean:
        Result := ScalarResult.FromBool( Field.AsBoolean )

      else
        Result := ScalarResult.FromString( Field.AsString );
    end;
  end;
end;

function QueryResult.FieldAsString(const FieldName: string; TrimSpace: Boolean): string;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);

  if Field.IsNull then
    Result := ''

  {$IFDEF VER180}
  else if (Field.DataType = ftMemo) and (FCharSet = 'UTF8') then
    Result := UTF8ToAnsi(Field.Value)
  {$ENDIF}

  else
    Result := Field.AsString;

  if TrimSpace then
    Result := Trim(Result);
end;

function QueryResult.FieldAsStringNullable(const FieldName: string; TrimSpace: Boolean): StringNullable;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);
  if Field.IsNull then
    Result := StringNullable.NullInstance()

  else if TrimSpace then
    Result := StringNullable.Create( Trim(Field.AsString) )
  else
    Result := StringNullable.Create( Field.AsString );
end;

function QueryResult.FieldAsStringToArrayInt(const FieldName, Separator: string): TArrayInteger;
var
  S, SValue: string;
  I, Count: Integer;

  {$REGION 'Adicionando, convertendo string e lidando com Array'}
  procedure _Add(const AValue: string);
  begin
    if Length(Result) >= (Count + 1) then
      SetLength( Result, Length(Result) + 10 );

    Result[Count] := StrToInt64(AValue);
    Inc(Count);
  end;
  {$ENDREGION}

begin
  S :=  FieldAsString(FieldName);

  if S = '' then
  begin
    SetLength(Result, 0);
    Exit;
  end;
  SetLength(Result, 10);

  Count := 0;
  repeat
    I := Pos(Separator, S);

    if I = 0 then
      SValue := S
    else
    begin
      SValue := Copy(S, 1, I - 1);
      S := Copy(S, I + Length(Separator), Length(S));
    end;

    _Add(SValue);
  until
    I = 0;

  SetLength(Result, Count);
end;

function QueryResult.FieldAsStringToArrayString(const FieldName, Separator: string): TArrayString;
var
  S, SValue: string;
  I, Count: Integer;

  {$REGION 'Adicionando, lidando com Array'}
  procedure _Add(const AValue: string);
  begin
    if Length(Result) >= (Count + 1) then
      SetLength( Result, Length(Result) + 10 );

    Result[Count] := AValue;
    Inc(Count);
  end;
  {$ENDREGION}

begin
  S :=  FieldAsString(FieldName);

  if S = '' then
  begin
    SetLength(Result, 0);
    Exit;
  end;
  SetLength(Result, 10);

  Count := 0;
  repeat
    I := Pos(Separator, S);

    if I = 0 then
      SValue := S
    else
    begin
      SValue := Copy(S, 1, I - 1);
      S := Copy(S, I + Length(Separator), Length(S));
    end;

    _Add(SValue);
  until
    I = 0;

  SetLength(Result, Count);
end;

function QueryResult.FieldIsNull(const FieldName: string): Boolean;
begin
  Result := FDataSet.FieldByName(FieldName).IsNull;
end;

function QueryResult.FieldIsNullOrWhiteSpace(const FieldName: string): Boolean;
var
  Field: TField;
begin
  Field := FDataSet.FieldByName(FieldName);

  if Field.IsNull then
    Result := True

  else
    Result := Trim(Field.AsString) = '';
end;

procedure QueryResult.FreeQueryResult;
begin
  Self.Free();
end;

function QueryResult.GetArrayIntFrom(const FieldName: string): TArrayInteger;
var
  Count: Integer;
  Field: TField;
begin
  Count := 0;
  try

    if DataSet.IsEmpty then
      Exit;

    Field := FDataSet.FieldByName(FieldName);

    SetLength(Result, 10);
    DataSet.First();
    while not DataSet.Eof do
    begin
      if Count >= Length(Result) then
        SetLength(Result, Length(Result) * 2);      

      Result[Count] := Field.AsInteger;

      Inc(Count);
      DataSet.Next();
    end;

  finally
    SetLength(Result, Count);
  end;
end;

function QueryResult.GetEof: Boolean;
begin
  Result := FDataSet.Eof;
end;

function QueryResult.GetQueryIsEmpty: Boolean;
begin
  Result := FDataSet.IsEmpty();
end;

procedure QueryResult.Next;
begin
  FDataSet.Next();
end;

end.
