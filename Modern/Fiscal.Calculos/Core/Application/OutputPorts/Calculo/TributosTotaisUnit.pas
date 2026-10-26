unit TributosTotaisUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, ImpostoSeletivoTotalUnit, IBSCBSTotalUnit, TipoComunsUnit;

type
  TributosTotais = record
  private
    FInstance: RecordInstance;
    FISTot: ImpostoSeletivoTotal;
    FIBSCBSTot: IBSCBSTotal;
  public
    class function CreateVazio: TributosTotais; static;
    class function Create(
      const ISTot: ImpostoSeletivoTotal;
      const IBSCBSTot: IBSCBSTotal
    ): TributosTotais; static;

    class function FromObjetos(const Detalhes: ROCItens): TributosTotais; static;

    function IsNull(): Boolean;

    property ISTot: ImpostoSeletivoTotal read FISTot;
    property IBSCBSTot: IBSCBSTotal read FIBSCBSTot;
  end;

implementation

{ TributosTotais }

class function TributosTotais.CreateVazio: TributosTotais;
begin
  Result.FISTot := ImpostoSeletivoTotal.CreateVazio;
  Result.FIBSCBSTot := IBSCBSTotal.CreateVazio;
  Result.FInstance := riNull;
end;

class function TributosTotais.Create(
  const ISTot: ImpostoSeletivoTotal;
  const IBSCBSTot: IBSCBSTotal
): TributosTotais;
begin
  Result.FInstance := riNotNull;
  Result.FISTot := ISTot;
  Result.FIBSCBSTot := IBSCBSTot;
end;

class function TributosTotais.FromObjetos(const Detalhes: ROCItens): TributosTotais;
begin
  Result := TributosTotais.CreateVazio;
  Result.FISTot := ImpostoSeletivoTotal.FromObjetos(Detalhes);
  Result.FIBSCBSTot := IBSCBSTotal.FromObjetos(Detalhes);
  Result.FInstance := riNotNull;
end;

function TributosTotais.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;;
end;

end.
