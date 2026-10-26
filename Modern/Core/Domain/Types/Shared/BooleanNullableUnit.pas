unit BooleanNullableUnit;

interface

type
  BooleanNullable = record
  private
    FValue: Boolean;
    FIsNull: Boolean;
  public
    class function NullInstance(): BooleanNullable; static;
    class function Create(Value: Boolean): BooleanNullable; static;
    class function CreateFromString(const Value, TrueValue: string; const NullValue: string = ''): BooleanNullable; static;

    procedure SetValue(NewValue: Boolean);
    procedure SetNull();
    function IsEqualTo(const Other: BooleanNullable): Boolean;
    function ToText(const NullValue: string = ''): string;

    property Value: Boolean read FValue;
    property IsNull: Boolean read FIsNull;
  end;

implementation

{ BooleanNullable }

class function BooleanNullable.Create(Value: Boolean): BooleanNullable;
begin
  Result.FValue := Value;
  Result.FIsNull := False;
end;

class function BooleanNullable.CreateFromString(const Value, TrueValue, NullValue: string): BooleanNullable;
begin
  Result.FIsNull := Value = NullValue;
  if not Result.FIsNull then
    Result.FValue := Value = TrueValue;
end;

function BooleanNullable.IsEqualTo(const Other: BooleanNullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

class function BooleanNullable.NullInstance: BooleanNullable;
begin
  Result.FValue := False;
  Result.FIsNull := True;
end;

procedure BooleanNullable.SetNull;
begin
  FValue := False;
  FIsNull := True;
end;

procedure BooleanNullable.SetValue(NewValue: Boolean);
begin
  FValue := NewValue;
  FIsNull := False;
end;

function BooleanNullable.ToText(const NullValue: string): string;
begin
  if FIsNull then
    Result := NullValue
  else if FValue then
    Result := 'Sim'
  else
    Result := 'Não';
end;

end.

