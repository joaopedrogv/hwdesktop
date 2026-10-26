unit IntegerNullableUnit;

interface

uses
  SysUtils,
  TipoComunsUnit;

type
  IntegerNullable = record
  private
    FValue: Integer;
    FInstance: RecordInstance;
    function GetIsNull: Boolean;
    function GetHasValue: Boolean;
  public
    class function NullInstance(): IntegerNullable; static;
    class function Create(Value: Integer; ASetNull: Boolean = False): IntegerNullable; static;
    class function CreateOrNull(Value: Integer; NullValueToCompare: Integer = 0): IntegerNullable; static;

    procedure SetValue(NewValue: Integer);
    procedure SetNull();
    function IsEqualTo(const Other: IntegerNullable): Boolean;
    function ToText(): string;

    property Value: Integer read FValue;
    property IsNull: Boolean read GetIsNull;
    property HasValue: Boolean read GetHasValue;
  end;

  Int64Nullable = record
  private
    FValue: Int64;
    FInstance: RecordInstance;
    function GetIsNull: Boolean;
    function GetHasValue: Boolean;
  public
    class function NullInstance(): Int64Nullable; static;
    class function Create(Value: Int64; ASetNull: Boolean = False): Int64Nullable; static;
    class function CreateOrNull(Value: Int64; NullValueToCompare: Int64 = 0): Int64Nullable; static;

    procedure SetValue(NewValue: Int64);
    procedure SetNull();
    function IsEqualTo(const Other: Int64Nullable): Boolean;

    property Value: Int64 read FValue;
    property IsNull: Boolean read GetIsNull;
    property HasValue: Boolean read GetHasValue;
  end;

implementation

{ IntegerNullable }

class function IntegerNullable.Create(Value: Integer; ASetNull: Boolean): IntegerNullable;
begin
  Result.FValue := Value;
  if ASetNull then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

class function IntegerNullable.CreateOrNull(Value, NullValueToCompare: Integer): IntegerNullable;
begin
  Result.FValue := Value;
  if Value = NullValueToCompare then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

function IntegerNullable.GetHasValue: Boolean;
begin
  Result := not GetIsNull();
end;

function IntegerNullable.GetIsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function IntegerNullable.IsEqualTo(const Other: IntegerNullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

class function IntegerNullable.NullInstance: IntegerNullable;
begin
  Result.FValue := 0;
  Result.FInstance := riNull;
end;

procedure IntegerNullable.SetNull;
begin
  FValue := 0;
  FInstance := riNull;
end;

procedure IntegerNullable.SetValue(NewValue: Integer);
begin
  FValue := NewValue;
  FInstance := riNotNull;
end;

function IntegerNullable.ToText: string;
begin
  if GetIsNull() then
    Result := ''
  else
    Result := IntToStr(FValue);
end;

{ Int64Nullable }

class function Int64Nullable.Create(Value: Int64; ASetNull: Boolean): Int64Nullable;
begin
  Result.FValue := Value;
  if ASetNull then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

class function Int64Nullable.CreateOrNull(Value, NullValueToCompare: Int64): Int64Nullable;
begin
  Result.FValue := Value;
  if Value = NullValueToCompare then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

function Int64Nullable.GetHasValue: Boolean;
begin
  Result := not GetIsNull();
end;

function Int64Nullable.GetIsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function Int64Nullable.IsEqualTo(const Other: Int64Nullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

class function Int64Nullable.NullInstance: Int64Nullable;
begin
  Result.FValue := 0;
  Result.FInstance := riNull;
end;

procedure Int64Nullable.SetNull;
begin
  FValue := 0;
  FInstance := riNull;
end;

procedure Int64Nullable.SetValue(NewValue: Int64);
begin
  FValue := NewValue;
  FInstance := riNotNull;
end;

end.

