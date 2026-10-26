unit IBSCBSTotalUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, IBSTotalUnit, CBSTotalUnit, MonofasiaTotalUnit, TipoComunsUnit;

type
  IBSCBSTotal = record
  private
    FInstance: RecordInstance;
    FVBCIBSCBS: Currency;
    FGIBS: IBSTotal;
    FGCBS: CBSTotal;
    FGMono: MonofasiaTotal;
  public
    class function CreateVazio: IBSCBSTotal; static;
    class function Create(
      VBCIBSCBS: Currency;
      const GIBS: IBSTotal;
      const GCBS: CBSTotal;
      const GMono: MonofasiaTotal
    ): IBSCBSTotal; static;

    class function FromObjetos(const Detalhes: ROCItens): IBSCBSTotal; static;

    function IsNull(): Boolean;

    property VBCIBSCBS: Currency read FVBCIBSCBS;
    property GIBS: IBSTotal read FGIBS;
    property GCBS: CBSTotal read FGCBS;
    property GMono: MonofasiaTotal read FGMono;
  end;

implementation

{ IBSCBSTotal }

class function IBSCBSTotal.CreateVazio: IBSCBSTotal;
begin
  Result.FInstance := riNull;
  Result.FVBCIBSCBS := 0.00;
  Result.FGIBS := IBSTotal.CreateVazio;
  Result.FGCBS := CBSTotal.CreateVazio;
  Result.FGMono := MonofasiaTotal.CreateVazio;
end;

class function IBSCBSTotal.Create(
  VBCIBSCBS: Currency;
  const GIBS: IBSTotal;
  const GCBS: CBSTotal;
  const GMono: MonofasiaTotal
): IBSCBSTotal;
begin
  Result.FInstance := riNotNull;
  Result.FVBCIBSCBS := VBCIBSCBS;
  Result.FGIBS := GIBS;
  Result.FGCBS := GCBS;
  Result.FGMono := GMono;
end;

class function IBSCBSTotal.FromObjetos(const Detalhes: ROCItens): IBSCBSTotal;
var
  I: Integer;
  Item: ROCItemDomain;
begin
  Result := IBSCBSTotal.CreateVazio;
  Result.FInstance := riNotNull;

  if Length(Detalhes) = 0 then
    Exit;

  // Calcula base de cálculo total
  Result.FVBCIBSCBS := 0.00;

  for I := 0 to High(Detalhes) do
  begin
    Item := Detalhes[I];
    if (Item.TribCalc <> nil) and Item.PossuiBaseCalculoIBSCBS then
      Result.FVBCIBSCBS := Result.FVBCIBSCBS + Item.ValorBaseCalculoIBSCBS;
  end;

  // Calcula totais
  Result.FGIBS := IBSTotal.FromObjetos(Detalhes);
  Result.FGCBS := CBSTotal.FromObjetos(Detalhes);
  Result.FGMono := MonofasiaTotal.FromObjetos(Detalhes);
end;

function IBSCBSTotal.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
