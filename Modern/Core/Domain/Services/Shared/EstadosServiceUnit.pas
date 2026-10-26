unit EstadosServiceUnit;

interface

type
  EstadosService = class
  public
    class function MunicipioIbgeToUF(Codigo: Integer): string;
    class function UfToCodigoIBGE(const UF: string): Integer;
  end;

implementation

uses
  SysUtils, StrUtils;

const
  IBGE_UF  : array[1..28] of Integer = ( 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 32, 33, 35, 41, 42, 43, 50, 51, 52, 53, 99);
  SIGLAS_UF: array[1..28] of string  = (
    'RO', 'AC', 'AM', 'RR', 'PA', 'AP', 'TO', 'MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA', 'MG', 'ES', 'RJ', 'SP', 'PR', 'SC', 'RS', 'MS', 'MT', 'GO', 'DF', 'EX'
  );

{ EstadosService }

class function EstadosService.MunicipioIbgeToUF(Codigo: Integer): string;
var
  I, ibge: Integer;
begin
  ibge := StrToIntDef(Copy(IntToStr(Codigo), 1, 2), -1);

  if ibge > -1 then
    for I := Low(IBGE_UF) to High(IBGE_UF) do
      if IBGE_UF[I] = ibge then
      begin
        Result := SIGLAS_UF[I];
        Exit;
      end;

  Result := '';                                         
end;

class function EstadosService.UfToCodigoIBGE(const UF: string): Integer;
begin
  Result := IndexText(UF, SIGLAS_UF);
end;

end.
