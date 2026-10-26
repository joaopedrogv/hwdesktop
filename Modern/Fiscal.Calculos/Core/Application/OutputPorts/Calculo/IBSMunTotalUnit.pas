unit IBSMunTotalUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, TipoComunsUnit;

type
  IBSMunTotal = record
  private
    FInstance: RecordInstance;
    FVDif: Currency;
    FVDevTrib: Currency;
    FVIBSMun: Currency;
  public
    class function CreateVazio: IBSMunTotal; static;
    class function Create(
      VDif: Currency;
      VDevTrib: Currency;
      VIBSMun: Currency
    ): IBSMunTotal; static;

    class function FromObjetos(const Detalhes: ROCItens): IBSMunTotal; static;

    function IsNull(): Boolean;

    property VDif: Currency read FVDif;
    property VDevTrib: Currency read FVDevTrib;
    property VIBSMun: Currency read FVIBSMun;
  end;

implementation

{ IBSMunTotal }

class function IBSMunTotal.CreateVazio: IBSMunTotal;
begin
  Result.FInstance := riNull;
  Result.FVDif := 0.00;
  Result.FVDevTrib := 0.00;
  Result.FVIBSMun := 0.00;
end;

class function IBSMunTotal.Create(
  VDif: Currency;
  VDevTrib: Currency;
  VIBSMun: Currency
): IBSMunTotal;
begin
  Result.FInstance := riNotNull;
  Result.FVDif := VDif;
  Result.FVDevTrib := VDevTrib;
  Result.FVIBSMun := VIBSMun;
end;

class function IBSMunTotal.FromObjetos(const Detalhes: ROCItens): IBSMunTotal;
var
  I: Integer;
  Obj: ROCItemDomain;
begin
  Result := IBSMunTotal.CreateVazio;
  Result.FInstance := riNotNull;

  if Length(Detalhes) = 0 then
    Exit;

  for I := 0 to High(Detalhes) do
  begin
    Obj := Detalhes[I];
    if (Obj.TribCalc <> nil) and Obj.PossuiIBSMun then
    begin
      Result.FVDif := Result.FVDif + Obj.GIBSMun.GDif.VDif;
      Result.FVDevTrib := Result.FVDevTrib + Obj.GIBSMun.GDevTrib.VDevTrib;
      Result.FVIBSMun := Result.FVIBSMun + Obj.GIBSMun.VIBSMun;
    end;
  end;
end;

function IBSMunTotal.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
