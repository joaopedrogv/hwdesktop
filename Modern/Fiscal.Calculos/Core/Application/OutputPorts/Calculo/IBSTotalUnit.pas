unit IBSTotalUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, IBSUFTotalUnit, IBSMunTotalUnit, TipoComunsUnit;

type
  IBSTotal = record
  private
    FInstance: RecordInstance;
    FGIBSUF: IBSUFTotal;
    FGIBSMun: IBSMunTotal;
    FVIBS: Currency;
    FVCredPres: Currency;
    FVCredPresCondSus: Currency;
  public
    class function CreateVazio: IBSTotal; static;
    class function Create(
      const GIBSUF: IBSUFTotal;
      const GIBSMun: IBSMunTotal;
      VIBS: Currency;
      VCredPres: Currency;
      VCredPresCondSus: Currency
    ): IBSTotal; static;

    class function FromObjetos(const Detalhes: ROCItens): IBSTotal; static;

    function IsNull(): Boolean;

    property GIBSUF: IBSUFTotal read FGIBSUF;
    property GIBSMun: IBSMunTotal read FGIBSMun;
    property VIBS: Currency read FVIBS;
    property VCredPres: Currency read FVCredPres;
    property VCredPresCondSus: Currency read FVCredPresCondSus;
  end;

implementation

{ IBSTotal }

class function IBSTotal.CreateVazio: IBSTotal;
begin
  Result.FInstance := riNull;
  Result.FGIBSUF := IBSUFTotal.CreateVazio;
  Result.FGIBSMun := IBSMunTotal.CreateVazio;
  Result.FVIBS := 0.00;
  Result.FVCredPres := 0.00;
  Result.FVCredPresCondSus := 0.00;
end;

class function IBSTotal.Create(
  const GIBSUF: IBSUFTotal;
  const GIBSMun: IBSMunTotal;
  VIBS: Currency;
  VCredPres: Currency;
  VCredPresCondSus: Currency
): IBSTotal;
begin
  Result.FInstance := riNotNull;
  Result.FGIBSUF := GIBSUF;
  Result.FGIBSMun := GIBSMun;
  Result.FVIBS := VIBS;
  Result.FVCredPres := VCredPres;
  Result.FVCredPresCondSus := VCredPresCondSus;
end;

class function IBSTotal.FromObjetos(const Detalhes: ROCItens): IBSTotal;
var
  I: Integer;
  Obj: ROCItemDomain;
  VIBSUF, VIBSMun: Currency;
begin
  Result := IBSTotal.CreateVazio;
  Result.FInstance := riNotNull;

  if Length(Detalhes) = 0 then
    Exit;

  // Calcula totais UF e Município
  Result.FGIBSUF := IBSUFTotal.FromObjetos(Detalhes);
  Result.FGIBSMun := IBSMunTotal.FromObjetos(Detalhes);

  // Soma IBS UF + IBS Município
  VIBSUF := Result.FGIBSUF.VIBSUF;
  VIBSMun := Result.FGIBSMun.VIBSMun;
  Result.FVIBS := VIBSUF + VIBSMun;

  // Calcula créditos presumidos
  Result.FVCredPres := 0.00;
  Result.FVCredPresCondSus := 0.00;

  for I := 0 to High(Detalhes) do
  begin
    Obj := Detalhes[I];
    if (Obj.TribCalc <> nil) and Obj.PossuiCredPresIbs then
      Result.FVCredPres := Result.FVCredPres + Obj.VCredPresIbs;
    if (Obj.TribCalc <> nil) and Obj.PossuiCredPresCondSusIbs then
      Result.FVCredPresCondSus := Result.FVCredPresCondSus + Obj.VCredPresCondSusIbs;
  end;
end;

function IBSTotal.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
