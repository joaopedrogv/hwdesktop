unit EnumServiceUnit;

interface     

uses
  TipoComunsUnit,
  TypInfo;

type
  EnumService = class
  public
    class function EnumValueAsArray(TypeInfo: PTypeInfo): TArrayInteger; static;
    class function SetAsArrayInt(ASetTypeInfo: PTypeInfo; const ASet): TArrayInteger; static;
    class function SetAsArrayString(ASetTypeInfo: PTypeInfo; const ASet): TArrayString; static;
  end;

implementation

uses
  SysUtils;

{ EnumService }

class function EnumService.SetAsArrayInt(ASetTypeInfo: PTypeInfo;
  const ASet): TArrayInteger;
var
  SetTypeData: PTypeData;
  EnumType: PTypeInfo;
  MinOrd, MaxOrd, I: Integer;
  SetBuf: PByteArray;
  InSet: Boolean;
begin
  if (ASetTypeInfo = nil) or (ASetTypeInfo^.Kind <> tkSet) then
    raise Exception.Create('Tipo informado não é um set.');

  // Obter os dados do tipo conjunto
  SetTypeData := GetTypeData(ASetTypeInfo);
  EnumType := SetTypeData^.CompType^; // Tipo base do set (o enumerado)

  if EnumType^.Kind <> tkEnumeration then
    raise Exception.Create('Tipo base do set não é um enumerado.');

  // Obter faixa válida do enumerado
  MinOrd := GetTypeData(EnumType)^.MinValue;
  MaxOrd := GetTypeData(EnumType)^.MaxValue;

  SetBuf := @ASet;
  SetLength(Result, 0);

  for I := MinOrd to MaxOrd do
  begin
    // Verifica se o bit correspondente ao ordinal I está ativo
    InSet := (SetBuf^[I div 8] and (1 shl (I mod 8))) <> 0;
    if InSet then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := I;
    end;
  end;
end;

class function EnumService.SetAsArrayString(ASetTypeInfo: PTypeInfo;
  const ASet): TArrayString;
var
  i: Integer;
  Ints: TArrayInteger;
begin
  Ints := EnumService.SetAsArrayInt(ASetTypeInfo, ASet);
  SetLength(Result, Length(Ints));
  for i := 0 to High(Ints) do
    Result[i] := IntToStr(Ints[i]);
end;

class function EnumService.EnumValueAsArray(
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

end.
