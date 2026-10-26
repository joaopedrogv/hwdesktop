unit PeriodoEmpresaVOUnit;

interface

uses
  TipoComunsUnit;

type
  PeriodoEmpresaVO = record
  private
    FDataInicial: TDate;
    FDataFinal: TDate;
    FEmpresaId: Integer;
  public
    class function Create(
      ADataInicial, ADataFinal: TDate; AEmpresaId: Integer
    ): PeriodoEmpresaVO; static;

    property DataInicial: TDate read FDataInicial;
    property DataFinal: TDate read FDataFinal;
    property EmpresaId: Integer read FEmpresaId;
  end;

implementation

{ PeriodoEmpresaVO }

class function PeriodoEmpresaVO.Create(
  ADataInicial, ADataFinal: TDate; AEmpresaId: Integer
): PeriodoEmpresaVO;
begin
  Result.FDataInicial := ADataInicial;
  Result.FDataFinal := ADataFinal;
  Result.FEmpresaId := AEmpresaId;
end;

end.
