unit CurrencyNullableUnit;

interface

uses
  TipoComunsUnit;

type
  CurrencyNullable = record
  private
    FValue: Currency;
    FInstance: RecordInstance;
    function GetHasValue: Boolean;
    function GetIsNullOrZero: Boolean;
    function GetIsNull: Boolean;
  public
		class function NullInstance(): CurrencyNullable; static;
		class function Create(Value: Currency; ASetNull: Boolean = False): CurrencyNullable; static;
		class function CreateOrNull(Value: Currency; NullValueToCompare: Currency = 0.0): CurrencyNullable; static;

    procedure SetValue(NewValue: Currency);
    procedure AddValue(Amount: Currency);
    procedure SubtractValue(Amount: Currency);
    procedure SetNull();
    function IsEqualTo(const Other: CurrencyNullable): Boolean;

    property Value: Currency read FValue;
    property IsNull: Boolean read GetIsNull;
    property IsNullOrZero: Boolean read GetIsNullOrZero;
    property HasValue: Boolean read GetHasValue;
  end;

implementation

{ CurrencyNullable }

procedure CurrencyNullable.AddValue(Amount: Currency);
begin
  if GetIsNull then
    SetValue(Amount)
  else
    FValue := FValue + Amount;
end;

class function CurrencyNullable.Create(Value: Currency; ASetNull: Boolean = False): CurrencyNullable;
begin
  if ASetNull then
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

class function CurrencyNullable.CreateOrNull(Value, NullValueToCompare: Currency): CurrencyNullable;
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

function CurrencyNullable.GetHasValue: Boolean;
begin
  Result := not GetIsNull();
end;

function CurrencyNullable.GetIsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function CurrencyNullable.GetIsNullOrZero: Boolean;
begin
  Result := GetIsNull() or (FValue = 0); 
end;

function CurrencyNullable.IsEqualTo(const Other: CurrencyNullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

class function CurrencyNullable.NullInstance: CurrencyNullable;
begin
  Result.FValue := 0;
  Result.FInstance := riNull;
end;

procedure CurrencyNullable.SetNull;
begin
  FValue := 0;
  FInstance := riNull;
end;

procedure CurrencyNullable.SetValue(NewValue: Currency);
begin
  FValue := NewValue;
  FInstance := riNotNull;
end;

procedure CurrencyNullable.SubtractValue(Amount: Currency);
begin
  if GetIsNull then
    SetValue(0 - Amount)
  else
    FValue := FValue - Amount;
end;

end.
