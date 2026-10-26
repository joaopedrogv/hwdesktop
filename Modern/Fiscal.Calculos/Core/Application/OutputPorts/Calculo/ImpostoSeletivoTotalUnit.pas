unit ImpostoSeletivoTotalUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, TipoComunsUnit;

type
  ImpostoSeletivoTotal = record
  private
    FInstance: RecordInstance;
    FVIS: Currency;
  public
    class function CreateVazio: ImpostoSeletivoTotal; static;
    class function Create(VIS: Currency): ImpostoSeletivoTotal; static;

    class function FromObjetos(const Detalhes: ROCItens): ImpostoSeletivoTotal; static;

    function IsNull(): Boolean;

    property VIS: Currency read FVIS;
  end;

implementation

{ ImpostoSeletivoTotal }

class function ImpostoSeletivoTotal.CreateVazio: ImpostoSeletivoTotal;
begin
  Result.FVIS := 0.00;
  Result.FInstance := riNull;
end;

class function ImpostoSeletivoTotal.Create(VIS: Currency): ImpostoSeletivoTotal;
begin
  Result.FVIS := VIS;
  Result.FInstance := riNotNull;
end;

class function ImpostoSeletivoTotal.FromObjetos(const Detalhes: ROCItens): ImpostoSeletivoTotal;
var
  I: Integer;
  Item: ROCItemDomain;
begin
  Result := ImpostoSeletivoTotal.CreateVazio;
  Result.FInstance := riNotNull;

  if Length(Detalhes) = 0 then
    Exit;

  for I := 0 to High(Detalhes) do
  begin
    Item := Detalhes[I];
    if (Item.TribCalc <> nil) and Item.PossuiImpostoSeletivo then
      Result.FVIS := Result.FVIS + Item.ValorImpostoSeletivo;
  end;
end;

function ImpostoSeletivoTotal.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
