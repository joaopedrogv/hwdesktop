unit ParameterValueUnit;

interface

uses
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit,
  DoubleNullableUnit,
  CurrencyNullableUnit;

type
  ParameterType = (ptNull, ptInteger, ptInt64, ptCurrency, ptDouble, ptString, ptDate, ptDateTime, ptMemo, ptMemoUTF8);

  ParameterValue = record
  private
    FType: ParameterType;
    FIntegerValue: Integer;
    FInt64Value: Int64;
    FDoubleValue: Double;
    FCurrencyValue: Currency;
    FStringValue: string;
    FDateTimeValue: TDateTime;
    FName: string;
  public
    class function GetNull: ParameterValue; static;
    class function GetInt(Value: Integer): ParameterValue; static;
    class function GetInt64(Value: Int64): ParameterValue; static;
    class function GetIntOrNull(Value: Integer; NullValue: Integer = 0): ParameterValue; static;
    class function GetInt64OrNull(Value: Int64; NullValue: Int64 = 0): ParameterValue; static;
    class function GetDouble(Value: Double): ParameterValue; static;
    class function GetCurrency(Value: Currency): ParameterValue; static;
    class function GetString(const Value: string; Size: SmallInt = 0): ParameterValue; static;
    class function GetStringOrNull(const Value: string; const NullValue: string = ''): ParameterValue; static;
    class function GetMemo(const Value: string; ConvertToUTF8: Boolean = False): ParameterValue; static;
    class function GetDate(Value: TDateTime): ParameterValue; static;
    class function GetDateTime(Value: TDateTime): ParameterValue; static;

    property ParamType: ParameterType read FType;
    property AsInteger: Integer read FIntegerValue;
    property AsInt64: Int64 read FInt64Value;
    property AsDouble: Double read FDoubleValue;
    property AsCurrency: Currency read FCurrencyValue;
    property AsString: string read FStringValue;
    property AsDateTime: TDateTime read FDateTimeValue;
    property Name: string read FName;
  end;

  ParametersValues = array of ParameterValue;

  IParametersBuilder = interface
    ['{1140DC90-70A9-4D64-BC39-4B407596BB13}']
    procedure Reset(NewSize: Integer);
    function Add(const Value: ParameterValue): IParametersBuilder; overload;
    function Add(Value: Integer): IParametersBuilder; overload;
    function Add(Value: Int64): IParametersBuilder; overload;
    function Add(const Value: string; Size: SmallInt = 0): IParametersBuilder; overload;
    function Add(const Value: DateNullable): IParametersBuilder; overload;
    function Add(const Value: DateTimeNullable): IParametersBuilder; overload;
    function Add(const Value: IntegerNullable): IParametersBuilder; overload;
    function Add(const Value: Int64Nullable): IParametersBuilder; overload;
    function Add(const Value: StringNullable; Size: SmallInt = 0): IParametersBuilder; overload;
    function Add(const Value: DoubleNullable): IParametersBuilder; overload;
    function Add(const Value: CurrencyNullable): IParametersBuilder; overload;
    function AddFloat(Value: Double): IParametersBuilder;
    function AddCurr(Value: Currency): IParametersBuilder;
    function AddDate(Value: TDateTime): IParametersBuilder;
    function AddDateTime(Value: TDateTime): IParametersBuilder; overload;
    function AddMemo(const Value: string; ConvertToUTF8: Boolean = False): IParametersBuilder;
    function ByName(const Name: string; Value: Integer): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: string; Size: SmallInt = 0): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: StringNullable; Size: SmallInt = 0): IParametersBuilder; overload;
    function ByName(const Name: string; Value: TDateTime): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: CurrencyNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: DoubleNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: IntegerNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: Int64Nullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: DateNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: DateTimeNullable): IParametersBuilder; overload;
    function ByNameC(const Name: string; Value: Currency): IParametersBuilder;
    function ByNameF(const Name: string; Value: Double): IParametersBuilder;
    function ByNameI64(const Name: string; Value: Int64): IParametersBuilder;
    function Build(): ParametersValues;
  end;

  ParametersBuilder = class(TInterfacedObject, IParametersBuilder)
  private
    FParameters: ParametersValues;
    FCount: Integer;
    constructor CreateInternal(Size: Integer = 0);
  public
    class function Create(Size: Integer = 0): IParametersBuilder; static;
    procedure Reset(NewSize: Integer);
    function Add(const Value: ParameterValue): IParametersBuilder; overload;
    function Add(Value: Integer): IParametersBuilder; overload;
    function Add(Value: Int64): IParametersBuilder; overload;
    function Add(const Value: string; Size: SmallInt = 0): IParametersBuilder; overload;
    function Add(const Value: DateNullable): IParametersBuilder; overload;
    function Add(const Value: DateTimeNullable): IParametersBuilder; overload;
    function Add(const Value: IntegerNullable): IParametersBuilder; overload;
    function Add(const Value: Int64Nullable): IParametersBuilder; overload;
    function Add(const Value: StringNullable; Size: SmallInt = 0): IParametersBuilder; overload;
    function Add(const Value: DoubleNullable): IParametersBuilder; overload;
    function Add(const Value: CurrencyNullable): IParametersBuilder; overload;
    function AddFloat(Value: Double): IParametersBuilder;
    function AddCurr(Value: Currency): IParametersBuilder;
    function AddMemo(const Value: string; ConvertToUTF8: Boolean = False): IParametersBuilder;
    function AddDate(Value: TDateTime): IParametersBuilder;
    function AddDateTime(Value: TDateTime): IParametersBuilder; overload;
    function ByName(const Name: string; Value: Integer): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: string; Size: SmallInt = 0): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: StringNullable; Size: SmallInt = 0): IParametersBuilder; overload;
    function ByName(const Name: string; Value: TDateTime): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: CurrencyNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: DoubleNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: IntegerNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: Int64Nullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: DateNullable): IParametersBuilder; overload;
    function ByName(const Name: string; const Value: DateTimeNullable): IParametersBuilder; overload;
    function ByNameC(const Name: string; Value: Currency): IParametersBuilder;
    function ByNameF(const Name: string; Value: Double): IParametersBuilder;
    function ByNameI64(const Name: string; Value: Int64): IParametersBuilder;
    function Build(): ParametersValues;
  end;

implementation

uses
  SysUtils;

{ ParameterValue }

class function ParameterValue.GetCurrency(Value: Currency): ParameterValue;
begin
  Result.FType := ptCurrency;
  Result.FCurrencyValue := Value;
end;

class function ParameterValue.GetDate(Value: TDateTime): ParameterValue;
begin
  Result.FType := ptDate;
  Result.FDateTimeValue := Value;
end;

class function ParameterValue.GetDateTime(Value: TDateTime): ParameterValue;
begin
  Result.FType := ptDateTime;
  Result.FDateTimeValue := Value;
end;

class function ParameterValue.GetDouble(Value: Double): ParameterValue;
begin
  Result.FType := ptDouble;
  Result.FDoubleValue := Value;
end;

class function ParameterValue.GetInt(Value: Integer): ParameterValue;
begin
  Result.FType := ptInteger;
  Result.FIntegerValue := Value;
end;

class function ParameterValue.GetInt64(Value: Int64): ParameterValue;
begin
  Result.FType := ptInt64;
  Result.FInt64Value := Value;
end;

class function ParameterValue.GetInt64OrNull(Value, NullValue: Int64): ParameterValue;
begin
  if Value = NullValue then
    Result := ParameterValue.GetNull()
  else
    Result := ParameterValue.GetInt64(Value);
end;

class function ParameterValue.GetIntOrNull(Value, NullValue: Integer): ParameterValue;
begin
  if Value = NullValue then
    Result := ParameterValue.GetNull()
  else
    Result := ParameterValue.GetInt(Value);
end;

class function ParameterValue.GetMemo(const Value: string;
  ConvertToUTF8: Boolean): ParameterValue;
begin
  if ConvertToUTF8 then
    Result.FType := ptMemoUTF8
  else
    Result.FType := ptMemo;
  Result.FStringValue := Value;
end;

class function ParameterValue.GetNull: ParameterValue;
begin
  Result.FType := ptNull;
end;

class function ParameterValue.GetString(const Value: string; Size: SmallInt): ParameterValue;
begin
  Result.FType := ptString;
  if Size > 0 then
    Result.FStringValue := Copy(Value, 1, Size)
  else
    Result.FStringValue := Value;
end;

class function ParameterValue.GetStringOrNull(const Value, NullValue: string): ParameterValue;
begin
  if Value = NullValue then
    Result := ParameterValue.GetNull()
  else
    Result := ParameterValue.GetString(Value);
end;

{ ParametersBuilder }

function ParametersBuilder.Add(const Value: ParameterValue): IParametersBuilder;
begin
  if FCount <= Length(FParameters) then
    SetLength( FParameters, FCount + 10);

  FParameters[FCount] := Value;

  Inc(FCount);

  Result := Self;
end;

function ParametersBuilder.Add(Value: Integer): IParametersBuilder;
begin
  Add( ParameterValue.GetInt( Value ));

  Result := Self;
end;

function ParametersBuilder.Add(const Value: DateNullable): IParametersBuilder;
begin
  if Value.IsNull then
    Add( ParameterValue.GetNull() )
  else
    Add( ParameterValue.GetDate( Value.Value ));

  Result := Self;
end;

function ParametersBuilder.Add(const Value: string; Size: SmallInt): IParametersBuilder;
begin
  Add( ParameterValue.GetString( Value, Size ));

  Result := Self;
end;

function ParametersBuilder.AddDate(Value: TDateTime): IParametersBuilder;
begin
  Add( ParameterValue.GetDate( Value ));

  Result := Self;
end;

function ParametersBuilder.AddFloat(Value: Double): IParametersBuilder;
begin
  Add( ParameterValue.GetDouble( Value ));

  Result := Self;
end;

function ParametersBuilder.AddMemo(const Value: string;
  ConvertToUTF8: Boolean): IParametersBuilder;
begin
  Add( ParameterValue.GetMemo( Value, ConvertToUTF8 ));

  Result := Self;
end;

function ParametersBuilder.Build: ParametersValues;
begin
  SetLength( FParameters, FCount );
  Result := FParameters;
end;

function ParametersBuilder.ByName(const Name: string; Value: Integer): IParametersBuilder;
var
  prm: ParameterValue;
begin
  prm := ParameterValue.GetInt( Value );
  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByName(const Name, Value: string; Size: SmallInt): IParametersBuilder;
var
  prm: ParameterValue;
begin
  prm := ParameterValue.GetString( Value, Size );
  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;


function ParametersBuilder.ByName(const Name: string; Value: TDateTime): IParametersBuilder;
var
  prm: ParameterValue;
begin
  prm := ParameterValue.GetDateTime( Value );
  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByNameF(const Name: string; Value: Double): IParametersBuilder;
var
  prm: ParameterValue;
begin
  prm := ParameterValue.GetDouble( Value );
  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

constructor ParametersBuilder.CreateInternal(Size: Integer);
begin
  Reset( Size );
end;

procedure ParametersBuilder.Reset(NewSize: Integer);
begin
  FCount := 0;
  if NewSize > 0 then
    SetLength( FParameters, NewSize )
  else
    SetLength( FParameters, 10 );
end;

class function ParametersBuilder.Create(Size: Integer): IParametersBuilder;
begin
  Result := ParametersBuilder.CreateInternal(Size);
end;

function ParametersBuilder.Add(
  const Value: IntegerNullable): IParametersBuilder;
begin
  if Value.IsNull then
    Add( ParameterValue.GetNull() )
  else
    Add( ParameterValue.GetInt( Value.Value ));

  Result := Self;
end;

function ParametersBuilder.Add(const Value: StringNullable; Size: SmallInt): IParametersBuilder;
begin
  if Value.IsNull then
    Add( ParameterValue.GetNull() )
  else
    Add( ParameterValue.GetString( Value.Value, Size ));

  Result := Self;
end;

function ParametersBuilder.AddDateTime(Value: TDateTime): IParametersBuilder;
begin
  Add( ParameterValue.GetDate( Value ));

  Result := Self;
end;

function ParametersBuilder.ByName(const Name: string;
  const Value: CurrencyNullable): IParametersBuilder;
var
  prm: ParameterValue;
begin
  if Value.IsNull then
    prm := ParameterValue.GetNull()
  else
    prm := ParameterValue.GetCurrency( Value.Value );

  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByName(const Name: string;
  const Value: IntegerNullable): IParametersBuilder;
var
  prm: ParameterValue;
begin
  if Value.IsNull then
    prm := ParameterValue.GetNull()
  else
    prm := ParameterValue.GetInt( Value.Value );

  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByName(const Name: string;
  const Value: DateNullable): IParametersBuilder;
var
  prm: ParameterValue;
begin
  if Value.IsNull then
    prm := ParameterValue.GetNull()
  else
    prm := ParameterValue.GetDate( Value.Value );

  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByName(const Name: string; const Value: StringNullable; Size: SmallInt): IParametersBuilder;
var
  prm: ParameterValue;
begin
  if Value.IsNull then
    prm := ParameterValue.GetNull()
  else
    prm := ParameterValue.GetString( Value.Value, Size );

  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;      

function ParametersBuilder.Add(const Value: DoubleNullable): IParametersBuilder;
begin
  if Value.IsNull then
    Add( ParameterValue.GetNull() )
  else
    Add( ParameterValue.GetDouble( Value.Value ));

  Result := Self;
end;

function ParametersBuilder.Add(const Value: CurrencyNullable): IParametersBuilder;
begin
  if Value.IsNull then
    Add( ParameterValue.GetNull() )
  else
    Add( ParameterValue.GetCurrency( Value.Value ));

  Result := Self;
end;

function ParametersBuilder.Add(const Value: Int64Nullable): IParametersBuilder;
begin
  if Value.IsNull then
    Add( ParameterValue.GetNull() )
  else
    Add( ParameterValue.GetInt64( Value.Value ));

  Result := Self;
end;

function ParametersBuilder.Add(Value: Int64): IParametersBuilder;
begin
  Add( ParameterValue.GetInt64( Value ));

  Result := Self;
end;

function ParametersBuilder.AddCurr(Value: Currency): IParametersBuilder;
begin
  Add( ParameterValue.GetCurrency( Value ));

  Result := Self;
end;

function ParametersBuilder.Add(
  const Value: DateTimeNullable): IParametersBuilder;
begin
  if Value.IsNull then
    Add( ParameterValue.GetNull() )
  else
    Add( ParameterValue.GetDateTime( Value.Value ));

  Result := Self;
end;

function ParametersBuilder.ByName(const Name: string; const Value: DateTimeNullable): IParametersBuilder;
var
  prm: ParameterValue;
begin
  if Value.IsNull then
    prm := ParameterValue.GetNull()
  else
    prm := ParameterValue.GetDateTime( Value.Value );

  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByName(const Name: string; const Value: DoubleNullable): IParametersBuilder;
var
  prm: ParameterValue;
begin
  if Value.IsNull then
    prm := ParameterValue.GetNull()
  else
    prm := ParameterValue.GetDouble( Value.Value );

  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByName(const Name: string; const Value: Int64Nullable): IParametersBuilder;
var
  prm: ParameterValue;
begin
  if Value.IsNull then
    prm := ParameterValue.GetNull()
  else
    prm := ParameterValue.GetInt64( Value.Value );

  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByNameI64(const Name: string; Value: Int64): IParametersBuilder;
var
  prm: ParameterValue;
begin
  prm := ParameterValue.GetInt64( Value );
  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

function ParametersBuilder.ByNameC(const Name: string; Value: Currency): IParametersBuilder;
var
  prm: ParameterValue;
begin
  prm := ParameterValue.GetCurrency( Value );
  prm.FName := Trim(Name);

  Add( prm );

  Result := Self;
end;

end.
