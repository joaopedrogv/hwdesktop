unit CBSTotalUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, TipoComunsUnit;

type
  CBSTotal = record
  private
    FInstance: RecordInstance;
    FVDif: Currency;
    FVDevTrib: Currency;
    FVCBS: Currency;
    FVCredPres: Currency;
    FVCredPresCondSus: Currency;
  public
    class function CreateVazio: CBSTotal; static;
    class function Create(
      VDif: Currency;
      VDevTrib: Currency;
      VCBS: Currency;
      VCredPres: Currency;
      VCredPresCondSus: Currency
    ): CBSTotal; static;

    class function FromObjetos(const Detalhes: ROCItens): CBSTotal; static;

    function IsNull(): Boolean;

    property VDif: Currency read FVDif;
    property VDevTrib: Currency read FVDevTrib;
    property VCBS: Currency read FVCBS;
    property VCredPres: Currency read FVCredPres;
    property VCredPresCondSus: Currency read FVCredPresCondSus;
  end;

implementation

uses
  CbsModelUnit, IBSCBSCreditoPresumidoModelUnit;

{ CBSTotal }

class function CBSTotal.CreateVazio: CBSTotal;
begin
  Result.FInstance := riNull;
  Result.FVDif := 0.00;
  Result.FVDevTrib := 0.00;
  Result.FVCBS := 0.00;
  Result.FVCredPres := 0.00;
  Result.FVCredPresCondSus := 0.00;
end;

class function CBSTotal.Create(
  VDif: Currency;
  VDevTrib: Currency;
  VCBS: Currency;
  VCredPres: Currency;
  VCredPresCondSus: Currency
): CBSTotal;
begin
  Result.FInstance := riNotNull;
  Result.FVDif := VDif;
  Result.FVDevTrib := VDevTrib;
  Result.FVCBS := VCBS;
  Result.FVCredPres := VCredPres;
  Result.FVCredPresCondSus := VCredPresCondSus;
end;

class function CBSTotal.FromObjetos(const Detalhes: ROCItens): CBSTotal;
var
  I: Integer;
  Obj: ROCItemDomain;
  CBSItem: CbsModel;
  CredPres: IBSCBSCreditoPresumidoModel;
begin
  Result := CBSTotal.CreateVazio();
  Result.FInstance := riNotNull;

  if Length(Detalhes) = 0 then
    Exit;

  for I := 0 to High(Detalhes) do
  begin
    Obj := Detalhes[I];
    if (Obj.TribCalc <> nil) and (Obj.PossuiCbs or Obj.PossuiCredPresCbs) then
    begin
      if Obj.PossuiCbs then
      begin
        CBSItem := Obj.GCBS;
        Result.FVDif := Result.FVDif + CBSItem.GDif.VDif;
        Result.FVDevTrib := Result.FVDevTrib + CBSItem.GDevTrib.VDevTrib;
        Result.FVCBS := Result.FVCBS + CBSItem.VCBS;
      end;

      if Obj.PossuiCredPresCbs then
      begin
        CredPres := Obj.TribCalc.IBSCBS.GCredPresOper.GCbsCredPres;
        Result.FVCredPres := Result.FVCredPres + CredPres.VCredPres;
        Result.FVCredPresCondSus := Result.FVCredPresCondSus + CredPres.VCredPresCondSus;
      end;
    end;
  end;
end;

function CBSTotal.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
