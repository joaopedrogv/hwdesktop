unit DoubleNullableUnit;

interface

uses
  TipoComunsUnit;

type
  DoubleNullable = record
  private
    FValue: Double;
    FInstance: RecordInstance;
    function GetIsNullOrZero: Boolean;
    function GetIsNull: Boolean;
  public
    class function NullInstance(): DoubleNullable; static;
    class function Create(Value: Double; ASetNull: Boolean = False): DoubleNullable; static;
		class function CreateOrNull(Value: Double; NullValueToCompare: Double = 0.0): DoubleNullable; static;

    procedure SetValue(NewValue: Double);
    procedure SetNull();
    function IsEqualTo(const Other: DoubleNullable): Boolean;

    property Value: Double read FValue;
    property IsNull: Boolean read GetIsNull;
    property IsNullOrZero: Boolean read GetIsNullOrZero;
  end;

implementation

{ DoubleNullable }

class function DoubleNullable.Create(Value: Double; ASetNull: Boolean = False): DoubleNullable;
begin
  Result.FValue := Value;
  if ASetNull then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

class function DoubleNullable.CreateOrNull(Value, NullValueToCompare: Double): DoubleNullable;
begin
	if Value = NullValueToCompare then
  begin
    Result.FValue := 0;
		Result.FInstance := riNull
  end
	else
  begin
    Result.FValue := Value;
		Result.FInstance := riNotNull;
  end;
end;

function DoubleNullable.GetIsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function DoubleNullable.GetIsNullOrZero: Boolean;
begin
  Result := GetIsNull() or (FValue = 0); 
end;

function DoubleNullable.IsEqualTo(const Other: DoubleNullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

class function DoubleNullable.NullInstance: DoubleNullable;
begin
  Result.FValue := 0;
  Result.FInstance := riNull;
end;

procedure DoubleNullable.SetNull;
begin
  FValue := 0;
  FInstance := riNull;
end;

procedure DoubleNullable.SetValue(NewValue: Double);
begin
  FValue := NewValue;
  FInstance := riNotNull;
end;

end.
