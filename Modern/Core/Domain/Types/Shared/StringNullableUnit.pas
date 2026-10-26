unit StringNullableUnit;

interface

uses
  TipoComunsUnit;

type
  StringNullable = record
  private
    FValue: string;
    FInstance: RecordInstance;
    function GetIsNull: Boolean;
    function GetHasValue: Boolean;
  public
    class function NullInstance(): StringNullable; static;
    class function Create(const Value: string; ASetNull: Boolean = False): StringNullable; static;
    class function CreateOrNull(const Value: string; const NullValueToCompare: string = ''): StringNullable; static;

    procedure SetValue(const NewValue: string); overload;
    procedure SetValue(const NewValue: string; LimitSize: Integer); overload;
    procedure SetNull();
    function IsEqualTo(const Other: StringNullable): Boolean;
    function ToText(const NullValue: string = ''): string;
    function IsNullOrWhiteSpace(): Boolean;

    property Value: string read FValue;
    property IsNull: Boolean read GetIsNull;
    property HasValue: Boolean read GetHasValue;
  end;

implementation

uses
  SysUtils;

{ StringNullable }

class function StringNullable.Create(const Value: string; ASetNull: Boolean): StringNullable;
begin
  if ASetNull then
  begin
    Result.FValue := '';
    Result.FInstance := riNull;
  end
  else
  begin
    Result.FValue := Value;
    Result.FInstance := riNotNull;
  end;
end;

class function StringNullable.CreateOrNull(const Value, NullValueToCompare: string): StringNullable;
begin
  Result.FValue := Value;
  if Value = NullValueToCompare then
  begin
    Result.FValue := '';
    Result.FInstance := riNull;
  end
  else
  begin
    Result.FValue := Value;
    Result.FInstance := riNotNull;
  end;
end;

function StringNullable.GetHasValue: Boolean;
begin
  Result := not GetIsNull();
end;

function StringNullable.GetIsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function StringNullable.IsEqualTo(const Other: StringNullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

function StringNullable.IsNullOrWhiteSpace: Boolean;
begin
  Result := GetIsNull() or (Trim(FValue) = ''); 
end;

class function StringNullable.NullInstance: StringNullable;
begin
  Result.FValue := '';
  Result.FInstance := riNull;
end;

procedure StringNullable.SetNull;
begin
  FValue := '';
  FInstance := riNull;
end;

procedure StringNullable.SetValue(const NewValue: string; LimitSize: Integer);
begin
  Self.SetValue(Copy(NewValue, 1, LimitSize));
end;

procedure StringNullable.SetValue(const NewValue: string);
begin
  FValue := NewValue;
  FInstance := riNotNull;
end;

function StringNullable.ToText(const NullValue: string): string;
begin
  if GetIsNull() then
    Result := NullValue
  else
    Result := FValue;  
end;

end.

