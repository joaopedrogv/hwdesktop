unit MonofasiaTotalUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, TipoComunsUnit;

type
  MonofasiaTotal = record
  private
    FInstance: RecordInstance;
    FVIBSMono: Currency;
    FVCBSMono: Currency;
    FVIBSMonoReten: Currency;
    FVCBSMonoReten: Currency;
    FVIBSMonoRet: Currency;
    FVCBSMonoRet: Currency;
  public
    class function CreateVazio: MonofasiaTotal; static;
    class function Create(
      VIBSMono: Currency;
      VCBSMono: Currency;
      VIBSMonoReten: Currency;
      VCBSMonoReten: Currency;
      VIBSMonoRet: Currency;
      VCBSMonoRet: Currency
    ): MonofasiaTotal; static;

    class function FromObjetos(const Detalhes: ROCItens): MonofasiaTotal; static;

    function IsNull(): Boolean;

    property VIBSMono: Currency read FVIBSMono;
    property VCBSMono: Currency read FVCBSMono;
    property VIBSMonoReten: Currency read FVIBSMonoReten;
    property VCBSMonoReten: Currency read FVCBSMonoReten;
    property VIBSMonoRet: Currency read FVIBSMonoRet;
    property VCBSMonoRet: Currency read FVCBSMonoRet;
  end;

implementation

uses
  MonofasiaModelUnit;

{ MonofasiaTotal }

class function MonofasiaTotal.CreateVazio: MonofasiaTotal;
begin
  Result.FInstance := riNull;
  Result.FVIBSMono := 0.00;
  Result.FVCBSMono := 0.00;
  Result.FVIBSMonoReten := 0.00;
  Result.FVCBSMonoReten := 0.00;
  Result.FVIBSMonoRet := 0.00;
  Result.FVCBSMonoRet := 0.00;
end;

class function MonofasiaTotal.Create(
  VIBSMono: Currency;
  VCBSMono: Currency;
  VIBSMonoReten: Currency;
  VCBSMonoReten: Currency;
  VIBSMonoRet: Currency;
  VCBSMonoRet: Currency
): MonofasiaTotal;
begin
  Result.FInstance := riNotNull;
  Result.FVIBSMono := VIBSMono;
  Result.FVCBSMono := VCBSMono;
  Result.FVIBSMonoReten := VIBSMonoReten;
  Result.FVCBSMonoReten := VCBSMonoReten;
  Result.FVIBSMonoRet := VIBSMonoRet;
  Result.FVCBSMonoRet := VCBSMonoRet;
end;

class function MonofasiaTotal.FromObjetos(const Detalhes: ROCItens): MonofasiaTotal;
var
  I: Integer;
  Item: ROCItemDomain;
  Mono: MonofasiaModel;
begin
  Result := MonofasiaTotal.CreateVazio;
  Result.FInstance := riNotNull;

  if Length(Detalhes) = 0 then
    Exit;

  for I := 0 to High(Detalhes) do
  begin
    Item := Detalhes[I];
    if (Item.TribCalc <> nil) and Item.PossuiMonofasia then
    begin
      Mono := Item.GIBSCBSMono;
      Result.FVIBSMono := Result.FVIBSMono + Mono.GMonoPadrao.VIBSMono;
      Result.FVCBSMono := Result.FVCBSMono + Mono.GMonoPadrao.VCBSMono;
      Result.FVIBSMonoReten := Result.FVIBSMonoReten + Mono.GMonoReten.VIBSMonoReten;
      Result.FVCBSMonoReten := Result.FVCBSMonoReten + Mono.GMonoReten.VCBSMonoReten;
      Result.FVIBSMonoRet := Result.FVIBSMonoRet + Mono.GMonoRet.VIBSMonoRet;
      Result.FVCBSMonoRet := Result.FVCBSMonoRet + Mono.GMonoRet.VCBSMonoRet;
    end;
  end;
end;

function MonofasiaTotal.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
