unit ValoresTotaisDomainUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, TributosTotaisUnit, TipoComunsUnit;

type
  ValoresTotaisDomain = record
  private
    FInstance: RecordInstance;
    FTribCalc: TributosTotais;
  public
    class function CreateVazio: ValoresTotaisDomain; static;
    class function Create(const TribCalc: TributosTotais): ValoresTotaisDomain; static;

    class function FromObjetos(const Detalhes: ROCItens): ValoresTotaisDomain; static;

    function IsNull(): Boolean;

    property TribCalc: TributosTotais read FTribCalc;
  end;

implementation

{ ValoresTotaisDomain }

class function ValoresTotaisDomain.CreateVazio: ValoresTotaisDomain;
begin
  Result.FInstance := riNull;
  Result.FTribCalc := TributosTotais.CreateVazio;
end;

class function ValoresTotaisDomain.Create(const TribCalc: TributosTotais): ValoresTotaisDomain;
begin
  Result.FInstance := riNotNull;
  Result.FTribCalc := TribCalc;
end;

class function ValoresTotaisDomain.FromObjetos(const Detalhes: ROCItens): ValoresTotaisDomain;
begin
  Result := ValoresTotaisDomain.CreateVazio;
  Result.FInstance := riNotNull;
  Result.FTribCalc := TributosTotais.FromObjetos(Detalhes);
end;

function ValoresTotaisDomain.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
