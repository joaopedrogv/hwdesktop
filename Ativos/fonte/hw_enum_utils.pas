unit hw_enum_utils;

interface

uses
  SysUtils, TypInfo, Types;

  function EnumToArrayInteger(TypeInfo: PTypeInfo): TIntegerDynArray;
  function EnumToArrayString(TypeInfo: PTypeInfo): TStringDynArray;

implementation

function EnumToArrayInteger(TypeInfo: PTypeInfo): TIntegerDynArray;
var
  Count, I: Integer;
  TypeData: PTypeData;
begin
  // Obtém os dados do tipo enumerado
  TypeData := GetTypeData(TypeInfo);

  // Calcula a quantidade de elementos (Maior valor - Menor valor + 1)
  Count := TypeData^.MaxValue - TypeData^.MinValue + 1;

  // Redimensiona o array de retorno
  SetLength(Result, Count);

  // Preenche o array com os valores ordinais em formato string
  for I := 0 to Count - 1 do
  begin
    Result[I] := TypeData^.MinValue + I;
  end;
end;

function EnumToArrayString(TypeInfo: PTypeInfo): TStringDynArray;
var
  Count, I: Integer;
  TypeData: PTypeData;
begin
  // Obtém os dados do tipo enumerado
  TypeData := GetTypeData(TypeInfo);

  // Calcula a quantidade de elementos (Maior valor - Menor valor + 1)
  Count := TypeData^.MaxValue - TypeData^.MinValue + 1;

  // Redimensiona o array de retorno
  SetLength(Result, Count);

  // Preenche o array com os valores ordinais em formato string
  for I := 0 to Count - 1 do
  begin
    Result[I] := IntToStr(TypeData^.MinValue + I);
  end;
end;


end.