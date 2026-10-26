unit ArrayServiceUnit;

interface

uses
  TipoComunsUnit,
  TypInfo,
  Types;

type
  ArrayService = class
  public
    class function IntArrayToStringArray(const Ints: TArrayInteger): TArrayString; static;
    class function GetEnumValuesAsArray(TypeInfo: PTypeInfo): TArrayInteger; static;
    class function MakeArrayInt(StartAt, EndsAt: Integer): TArrayInteger; overload; static;
    class function MakeArrayInt(Value: Integer): TArrayInteger; overload; static;
    class function Contains(const Arr: TArrayInteger; Value: Integer): Boolean;
    class function QuoteArrayString(const Arr: array of string): TStringDynArray; static;
  end;

implementation

uses
  SysUtils;

{ ArrayService }

class function ArrayService.Contains(const Arr: TArrayInteger; Value: Integer): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(Arr) do
  begin
    if Arr[I] = Value then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

class function ArrayService.GetEnumValuesAsArray(
  TypeInfo: PTypeInfo): TArrayInteger;
var
  TypeData: PTypeData;
  MinValue: Integer;
  MaxValue: Integer;
  i: Integer;
begin
  if Assigned(TypeInfo) and (TypeInfo.Kind = tkEnumeration) then
  begin
    TypeData := GetTypeData(TypeInfo);
    MinValue := TypeData^.MinValue;
    MaxValue := TypeData^.MaxValue;

    SetLength(Result, MaxValue - MinValue + 1);

    for i := MinValue to MaxValue do
      Result[i - MinValue] := i;

  end
  else
    SetLength(Result, 0);
end;

class function ArrayService.IntArrayToStringArray(const Ints: TArrayInteger): TArrayString;
var
  i: Integer;
begin
  SetLength(Result, Length(Ints));
  for i := 0 to High(Ints) do
    Result[i] := IntToStr(Ints[i]);
end;

class function ArrayService.MakeArrayInt(Value: Integer): TArrayInteger;
begin
  Result := ArrayService.MakeArrayInt(Value, Value);
end;

class function ArrayService.QuoteArrayString(const Arr: array of string): TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result, Length(Arr));
  for I := 0 to High(Arr) do
    Result[I] := QuotedStr(Arr[I]);
end;

class function ArrayService.MakeArrayInt(StartAt,
  EndsAt: Integer): TArrayInteger;
var
  I, Value: Integer;
begin
  if StartAt > EndsAt then
    raise Exception.CreateFmt('Make array int invalid parameters. Start %d End %d', [StartAt, EndsAt]);

  Value := StartAt;
  SetLength(Result, EndsAt - StartAt + 1);
  for I := Low(Result) to High(Result) do
  begin
    Result[I] := Value;
    Inc(Value);
  end;
end;

end.
