unit ResolverRegraFiscalIbsCbsTypesUnit;

interface

uses
  TipoComunsUnit;

type
  ResolverRegraFiscalIbsCbsInput = record
  private
    FOperacaoInternaId: string;
    FGrupoFiscalId: string;
    FEmpresaId: Integer;
    FData: TDate;
  public
    class function Create(
      const OperacaoInternaId: string;
      const GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate
    ):ResolverRegraFiscalIbsCbsInput; static;

    property OperacaoInternaId: string read FOperacaoInternaId;
    property GrupoFiscalId: string read FGrupoFiscalId;
    property EmpresaId: Integer read FEmpresaId write FEmpresaId;
    property Data: TDate read FData write FData;
    //Condicionais ou criterios
  end;

implementation

{ ResolverRegraFiscalIbsCbsInput }

class function ResolverRegraFiscalIbsCbsInput.Create(
  const OperacaoInternaId: string;
  const GrupoFiscalId: string;
  EmpresaId: Integer;
  Data: TDate
): ResolverRegraFiscalIbsCbsInput;
begin
  Result.FOperacaoInternaId := OperacaoInternaId;
  Result.FGrupoFiscalId := GrupoFiscalId;
  Result.FEmpresaId := EmpresaId;
  Result.FData := Data;
end;

end.
