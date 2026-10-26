unit AplicarRegrasTributosNFSeServiceUnit;

interface

uses
  IAplicarRegrasTributosNFSeServiceUnit, CalculoRetenFederalResultUnit, TipoRetencaoFederalPJEnumUnit, NFSeTypesUnit,
  CalculoPisCofinsResultUnit;

type
  AplicarRegrasTributosNFSeService = class(TInterfacedObject, IAplicarRegrasTributosNFSeService)
  private
  public
    function AplicarRetencoesFederais(
      const Calculo: CalculoRetenFederalResult; IsSimplesNacional: Boolean; Retencoes: TipoRetencaoFederalPJEnumSet
    ): CalculoRetenFederalResult;

    function AplicarPisCofins(
      const Calculo: CalculoPisCofinsResult; IsSimplesNacional: Boolean
    ): CalculoPisCofinsResult;

    function AjustarPisCofinsCST(
      const Retencao: CalculoRetenFederalResult; IsSimplesNacional: Boolean; const CstAtualPC: string
    ): string;

    function ObterTipoRetencaoPC(const Calculo: CalculoRetenFederalResult): TipoRetencaoPisCofinsEnum;
  end;

implementation

uses
  SysUtils,
  NumberServiceUnit;

{ AplicarRegrasTributosNFSeService }

function AplicarRegrasTributosNFSeService.AjustarPisCofinsCST(const Retencao: CalculoRetenFederalResult;
  IsSimplesNacional: Boolean; const CstAtualPC: string): string;
var
  iCstPC: Integer;
begin
  // Se for necessario informar CST quando ter valor retencao do PISCOFINS use esse metodo
  Result := CstAtualPC;

  if (Retencao.VRetPIS > 0) or (Retencao.VRetCOFINS > 0) then
  begin
    iCstPC := StrToIntDef(Trim(CstAtualPC), -1);
    case iCstPC of
      1,2,3,5: ;// CST OK com calculo de PIS
    else
      Result := '01'; // Default tributavel com aliquota basica
    end;
  end;
end;

function AplicarRegrasTributosNFSeService.AplicarPisCofins(const Calculo: CalculoPisCofinsResult;
  IsSimplesNacional: Boolean): CalculoPisCofinsResult;
var
  iCstPC: Integer;
begin
  if IsSimplesNacional then
    Result := CalculoPisCofinsResult.Create( '', 0, 0, 0, 0, 0 )
  else
  begin
    iCstPC := StrToIntDef(Trim(Calculo.CSTPisCofins), -1);

    case iCstPC of
      4, 6..9, 70..75:
        Result := CalculoPisCofinsResult.Create( Calculo.CSTPisCofins, 0, 0, 0, 0, 0 );
      //else
      1,2,3,5, 50..67:
        Result := CalculoPisCofinsResult.Create(
          Calculo.CSTPisCofins,
          Calculo.VBcOuQtde,
          Calculo.PPisOuReais,
          Calculo.ValorPis,
          Calculo.PCofinsOuReais,
          Calculo.ValorCofins
        );

      else
        Result := CalculoPisCofinsResult.Create( Calculo.CSTPisCofins, 0, 0, 0, 0, 0 );
    end;
  end;
end;

function AplicarRegrasTributosNFSeService.AplicarRetencoesFederais(
  const Calculo: CalculoRetenFederalResult;
  IsSimplesNacional: Boolean;
  Retencoes: TipoRetencaoFederalPJEnumSet
): CalculoRetenFederalResult;
begin               // TipoRetencaoFederalPJEnum = (trfIRRF, trfPIS, trfCOFINS, trfCSLL, trfCP);
  if IsSimplesNacional then
    Result := CalculoRetenFederalResult.Create( 0, 0, 0, 0, 0 )
  else
    Result := CalculoRetenFederalResult.Create(
      NumberService.IfThenCurr( (trfPIS in Retencoes)
        and ((Calculo.VRetPIS + Calculo.VRetCOFINS + Calculo.VRetCSLL) > 10.0), Calculo.VRetPIS
      ),
      NumberService.IfThenCurr( (trfCOFINS in Retencoes)
        and ((Calculo.VRetPIS + Calculo.VRetCOFINS + Calculo.VRetCSLL) > 10.0), Calculo.VRetCOFINS
      ),
      NumberService.IfThenCurr( (trfIRRF in Retencoes)
        and (Calculo.VRetIRRF > 10.0), Calculo.VRetIRRF
      ),
      NumberService.IfThenCurr( (trfCSLL in Retencoes)
        and ((Calculo.VRetPIS + Calculo.VRetCOFINS + Calculo.VRetCSLL) > 10.0), Calculo.VRetCSLL
      ),
      NumberService.IfThenCurr( (trfCP in Retencoes)
        and (Calculo.VRetCP > 10.0), Calculo.VRetCP
      )
    );
end;

function AplicarRegrasTributosNFSeService.ObterTipoRetencaoPC(
  const Calculo: CalculoRetenFederalResult
): TipoRetencaoPisCofinsEnum;
begin
  if (Calculo.VRetPIS = 0) and (Calculo.VRetCOFINS = 0) and (Calculo.VRetCSLL = 0) then
    Result := trpiscofinscsllNaoRetido

  else if (Calculo.VRetPIS > 0) and (Calculo.VRetCOFINS > 0) and (Calculo.VRetCSLL > 0) then
    Result := trpiscofinscsllRetido

  else if (Calculo.VRetPIS > 0) and (Calculo.VRetCOFINS > 0) and (Calculo.VRetCSLL <= 0) then
    Result := trpiscofinsRetidocsllNaoRetido

  else if (Calculo.VRetPIS > 0) and (Calculo.VRetCOFINS <= 0) and (Calculo.VRetCSLL <= 0) then
    Result := trPisRetidoCofinsCsllNaoRetido

  else if (Calculo.VRetPIS <= 0) and (Calculo.VRetCOFINS > 0) and (Calculo.VRetCSLL <= 0) then
    Result := trCofinsRetidoPisCsllNaoRetido

  else if (Calculo.VRetPIS <= 0) and (Calculo.VRetCOFINS > 0) and (Calculo.VRetCSLL > 0) then
    Result := trCofinsCsllRetidoPisNaoRetido

  else if (Calculo.VRetPIS <= 0) and (Calculo.VRetCOFINS <= 0) and (Calculo.VRetCSLL > 0) then
    Result := trCsllRetidoPisCofinsNaoRetido

  else if (Calculo.VRetPIS > 0) and (Calculo.VRetCOFINS <= 0) and (Calculo.VRetCSLL > 0) then
    Result := trPisCsllRetidoCofinsNaoRetido

  else
    Result := trpiscofinscsllNaoRetido;
end;

end.
