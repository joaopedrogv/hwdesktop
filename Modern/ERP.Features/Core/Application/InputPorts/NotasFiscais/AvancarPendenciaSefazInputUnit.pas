unit AvancarPendenciaSefazInputUnit;

interface

uses
  SituacaoNFeEnumUnit;

type
  AvancarPendenciaSefazInput = record
  private
    FNfContigenciaId: Integer;
    FNfPendenteId: Integer;
    FEmpresaId: Integer;
    FSituacaoNfContingencia: SituacaoNFeEnum;
    FSituacaoNfPendente: SituacaoNFeEnum;
  public
    class function Create(
      ANfContigenciaId: Integer;
      ANfPendenteId: Integer;
      AEmpresaId: Integer;
      ASituacaoNfContingencia: SituacaoNFeEnum;
      ASituacaoNfPendente: SituacaoNFeEnum
    ): AvancarPendenciaSefazInput; static;

    property NfContigenciaId: Integer read FNfContigenciaId;
    property NfPendenteId: Integer read FNfPendenteId;
    property EmpresaId: Integer read FEmpresaId;
    property SituacaoNfContingencia: SituacaoNFeEnum read FSituacaoNfContingencia;
    property SituacaoNfPendente: SituacaoNFeEnum read FSituacaoNfPendente;
  end;

implementation

{ AvancarPendenciaSefazInput }

class function AvancarPendenciaSefazInput.Create(
  ANfContigenciaId: Integer;
  ANfPendenteId: Integer;
  AEmpresaId: Integer;
  ASituacaoNfContingencia: SituacaoNFeEnum;
  ASituacaoNfPendente: SituacaoNFeEnum
): AvancarPendenciaSefazInput;
begin
  Result.FNfContigenciaId := ANfContigenciaId;
  Result.FNfPendenteId := ANfPendenteId;
  Result.FEmpresaId := AEmpresaId;
  Result.FSituacaoNfContingencia := ASituacaoNfContingencia;
  Result.FSituacaoNfPendente := ASituacaoNfPendente;
end;

end.
