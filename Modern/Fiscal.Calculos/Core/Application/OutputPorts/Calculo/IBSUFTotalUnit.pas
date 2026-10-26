unit IBSUFTotalUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, TipoComunsUnit;

type
  IBSUFTotal = record
  private
    FInstance: RecordInstance;
    FVDif: Currency;
    FVDevTrib: Currency;
    FVIBSUF: Currency;
  public
    class function CreateVazio(): IBSUFTotal; static;
    class function Create(
      VDif: Currency;
      VDevTrib: Currency;
      VIBSUF: Currency
    ): IBSUFTotal; static;

    class function FromObjetos(const Detalhes: ROCItens): IBSUFTotal; static;

    function IsNull(): Boolean;

    property VDif: Currency read FVDif;
    property VDevTrib: Currency read FVDevTrib;
    property VIBSUF: Currency read FVIBSUF;
  end;

implementation

uses IbsUfModelUnit;

{ IBSUFTotal }

class function IBSUFTotal.CreateVazio: IBSUFTotal;
begin
  Result.FInstance := riNull;
  Result.FVDif := 0.00;
  Result.FVDevTrib := 0.00;
  Result.FVIBSUF := 0.00;
end;

class function IBSUFTotal.Create(
  VDif: Currency;
  VDevTrib: Currency;
  VIBSUF: Currency
): IBSUFTotal;
begin
  Result.FInstance := riNotNull;
  Result.FVDif := VDif;
  Result.FVDevTrib := VDevTrib;
  Result.FVIBSUF := VIBSUF;
end;

class function IBSUFTotal.FromObjetos(const Detalhes: ROCItens): IBSUFTotal;
var
  I: Integer;
  Item: ROCItemDomain;
begin
  Result := IBSUFTotal.CreateVazio();
  Result.FInstance := riNotNull;

  if Length(Detalhes) = 0 then
    Exit;

  for I := 0 to High(Detalhes) do
  begin
    Item := Detalhes[I];
    if (Item.TribCalc <> nil) and Item.PossuiIBSUF then
    begin
      Result.FVDif := Result.FVDif + Item.GIBSUF.GDif.VDif;
      Result.FVDevTrib := Result.FVDevTrib + Item.GIBSUF.GDevTrib.VDevTrib;
      Result.FVIBSUF := Result.FVIBSUF + Item.GIBSUF.VIBSUF;
    end;
  end;
end;

function IBSUFTotal.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
