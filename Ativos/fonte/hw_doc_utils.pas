unit hw_doc_utils;

interface   

uses
  SysUtils,
  Variants,
  Classes;

type

  HelperIE = class
  private
    class function ValidaRO(IE: string): Boolean;
  public
    class function Valida(UF, IE: string): Boolean;
  end;

  HelperCNPJ = class
  private
    class var FEditMask: string;
    class var FDateStart: TDateTime;
    class function GetEditMask(): string; static;
    class function IsAlphaNumirc(): Boolean; static;
    class function ValidarCNPJ(const AInput: string): Boolean;
  public
    class function Valida(const AInput: string): Boolean; static;
    class function CNPJTratado(const ACNPJ: string): string; static;
    class property EditMask: string read GetEditMask;
  end;

  HelperDocumento = class
  public
    class function CnpjOuCpfTratado(const AInput: string): string; static;
  end;

implementation

uses
  hw_utils, DateUtils;

{ HelperIE }

class function HelperIE.ValidaRO(IE: string): Boolean;
const
  pessos: array[1..13] of Integer = (6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
var
  numeros: array[1..13] of Integer;
  produto: array[1..13] of Integer;
  digito: Integer;
  I: Integer;
  soma: Integer;
  resto: Integer;
  digitoCalculado: Integer;
begin
  if Length(OnlyNumber(IE)) > 14 then
    Exit;

  IE := PadL(OnlyNumber(IE), 14, '0');
  digito := StrToInt(IE[14]);
  IE := Copy(IE, 1, 13);

  for I := 1 to 13 do
    numeros[I] := StrToInt(IE[I]);

  for I := 1 to 13 do
    produto[I] := numeros[I] * pessos[I];

  soma := 0;
  for I := 1 to 13 do
    soma := soma + produto[I];

  resto := 11 - (soma mod 11);
  if resto in [10, 11] then
    digitoCalculado :=  resto - 10
  else
    digitoCalculado := resto;

  Result := digito = digitoCalculado;
end;

class function HelperIE.Valida(UF, IE: string): Boolean;
begin
  if Trim(UpperCase(IE)) = 'ISENTO' then
  begin
    Result := True;
    Exit;
  end;

  UF := UpperCase(Trim(UF));
  if UF <> 'RO' then
    raise Exception.Create('HelperIE.Valida UF inválida para classe');

  Result := HelperIE.ValidaRO(IE);
end;

{ HelperCNPJ }

class function HelperCNPJ.CNPJTratado(const ACNPJ: string): string;
begin
  if HelperCNPJ.IsAlphaNumirc() then
    Result := UpperCase( OnlyNumberAndLetters( ACNPJ , '') )

  else
    Result := OnlyNumber( ACNPJ );
end;

class function HelperCNPJ.GetEditMask(): string;
begin
  if FEditMask = '' then
  begin
    if HelperCNPJ.IsAlphaNumirc() then
      FEditMask := 'AA.AAA.AAA/AAAA-99;0;'
    else
      FEditMask := '99.999.999/9999-99;0;';
  end;

  Result := FEditMask;
end;

class function HelperCNPJ.IsAlphaNumirc: Boolean;
begin
  if FDateStart = 0 then
    FDateStart := EncodeDate(2026, 7, 1);

  Result := Date() >= FDateStart;
end;

class function HelperCNPJ.Valida(const AInput: string): Boolean;
var
  ACNPJ: string;
begin
  if HelperCNPJ.IsAlphaNumirc() then
  begin
    ACNPJ := OnlyNumberAndLetters( UpperCase(AInput) , '');

    if ACNPJ <> AInput then // Caso Ainput tenha letras minusculas
      ACNPJ := '';
  end
  else
    ACNPJ := OnlyNumber( AInput );

  Result := ValidarCNPJ( ACNPJ );
end;

class function HelperCNPJ.ValidarCNPJ(const AInput: string): Boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  if Length(AInput) <> 14 then
  begin
    Result := False;
    Exit;
  end;

  try
    n1 := Ord(AInput[1]) - 48;
    n2 := Ord(AInput[2]) - 48;
    n3 := Ord(AInput[3]) - 48;
    n4 := Ord(AInput[4]) - 48;
    n5 := Ord(AInput[5]) - 48;
    n6 := Ord(AInput[6]) - 48;
    n7 := Ord(AInput[7]) - 48;
    n8 := Ord(AInput[8]) - 48;
    n9 := Ord(AInput[9]) - 48;
    n10 := Ord(AInput[10]) - 48;
    n11 := Ord(AInput[11]) - 48;
    n12 := Ord(AInput[12]) - 48;

    d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3
      + n2 * 4 + n1 * 5;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3
      + n3 * 4 + n2 * 5 + n1 * 6;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    Calculado := IntToStr(d1) + IntToStr(d2);
    digitado := AInput[13] + AInput[14];
    if calculado = digitado then
      Result := True
    else
      Result := False;
  except
    Result := False;
  end;
end;

{ HelperDocumento }

class function HelperDocumento.CnpjOuCpfTratado(const AInput: string): string;
begin
  if Length(AInput) = 14 then
    Result := HelperCNPJ.CNPJTratado( AInput )

  else
    Result := AInput;
end;

end.
