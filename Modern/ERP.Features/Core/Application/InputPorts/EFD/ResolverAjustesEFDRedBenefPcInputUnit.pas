unit ResolverAjustesEFDRedBenefPcInputUnit;

interface

type
  ResolverAjustesEFDRedBenefPcInput = record
  private
    FDataInicial: TDate;
    FDataFinal: TDate;
    FEmpresaId: Integer;
    FRecalcularPC: Boolean;
  public
    class function Create(
      ADataInicial, ADataFinal: TDate; AEmpresaId: Integer; ARecalcularPC: Boolean
    ): ResolverAjustesEFDRedBenefPcInput; static;

    property DataInicial: TDate read FDataInicial;
    property DataFinal: TDate read FDataFinal;
    property EmpresaId: Integer read FEmpresaId;
    property RecalcularPC: Boolean read FRecalcularPC;
  end;

implementation

{ ResolverAjustesEFDRedBenefPcInput }

class function ResolverAjustesEFDRedBenefPcInput.Create(ADataInicial, ADataFinal: TDate; AEmpresaId: Integer;
  ARecalcularPC: Boolean): ResolverAjustesEFDRedBenefPcInput;
begin
  Result.FDataInicial := ADataInicial;
  Result.FDataFinal := ADataFinal;
  Result.FEmpresaId := AEmpresaId;
  Result.FRecalcularPC := ARecalcularPC;
end;

end.
