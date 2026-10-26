unit DateAndTimeNullableUnit;

interface

uses
  TipoComunsUnit;

type
  DateTimeNullable = record
  private
    FValue: TDateTime;
    FInstance: RecordInstance;
    function GetHasValue: Boolean;
    function GetIsNull: Boolean;
  public
    class function NullInstance(): DateTimeNullable; static;
    class function Create(Value: TDateTime; ASetNull: Boolean = False): DateTimeNullable; static;
    class function CreateOrNull(Value: TDateTime): DateTimeNullable; static;

    procedure SetValue(NewValue: TDateTime);
    procedure SetNull();
    function IsEqualTo(const Other: DateTimeNullable): Boolean;

    property Value: TDateTime read FValue;
    property IsNull: Boolean read GetIsNull;  
    property HasValue: Boolean read GetHasValue;
  end;

  DateNullable = record
  private
    FValue: TDate;
    FInstance: RecordInstance;
    function GetHasValue: Boolean;
    function GetIsNull: Boolean;
  public
    class function NullInstance(): DateNullable; static;
    class function Create(Value: TDate): DateNullable; static;
    class function CreateOrNull(Value: TDate): DateNullable; static;

    procedure SetValue(NewValue: TDate);
    procedure SetNull();
    function IsEqualTo(const Other: DateNullable): Boolean;

    property Value: TDate read FValue;
    property IsNull: Boolean read GetIsNull;
    property HasValue: Boolean read GetHasValue;
  end;

implementation

{ DateTimeNullable }

class function DateTimeNullable.Create(Value: TDateTime; ASetNull: Boolean): DateTimeNullable;
begin
  Result.FValue := Value;
  if ASetNull then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

class function DateTimeNullable.CreateOrNull(Value: TDateTime): DateTimeNullable;
begin
  Result.FValue := Value;
  if Value <= 0 then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

function DateTimeNullable.GetHasValue: Boolean;
begin
  Result := not GetIsNull();
end;

function DateTimeNullable.GetIsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function DateTimeNullable.IsEqualTo(const Other: DateTimeNullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

class function DateTimeNullable.NullInstance: DateTimeNullable;
begin
  Result.FValue := 0;
  Result.FInstance := riNull;
end;

procedure DateTimeNullable.SetNull;
begin
  FValue := 0;
  FInstance := riNull;
end;

procedure DateTimeNullable.SetValue(NewValue: TDateTime);
begin
  FValue := NewValue;
  FInstance := riNotNull;
end;

{ DateNullable }

class function DateNullable.Create(Value: TDate): DateNullable;
begin
  Result.FValue := Value;
  Result.FInstance := riNotNull;
end;

class function DateNullable.CreateOrNull(Value: TDate): DateNullable;
begin
  Result.FValue := Value;
  if Value <= 0 then
    Result.FInstance := riNull
  else
    Result.FInstance := riNotNull;
end;

function DateNullable.GetHasValue: Boolean;
begin
  Result := not GetIsNull();
end;

function DateNullable.GetIsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function DateNullable.IsEqualTo(const Other: DateNullable): Boolean;
begin
  if Self.IsNull or Other.IsNull then
    Result := Self.IsNull and Other.IsNull
  else
    Result := Self.Value = Other.Value;
end;

class function DateNullable.NullInstance: DateNullable;
begin
  Result.FValue := 0;
  Result.FInstance := riNull;
end;

procedure DateNullable.SetNull;
begin
  FValue := 0;
  FInstance := riNull;
end;

procedure DateNullable.SetValue(NewValue: TDate);
begin
  FValue := NewValue;
  FInstance := riNotNull;
end;

end.
