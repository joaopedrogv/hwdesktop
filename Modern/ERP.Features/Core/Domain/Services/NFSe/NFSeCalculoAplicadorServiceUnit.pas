unit NFSeCalculoAplicadorServiceUnit;

interface

uses
  INFSeCalculoAplicadorServiceUnit, NFSeModelUnit, CalculoTributosNFSeOutputUnit;

type
  NFSeCalculoAplicadorService = class(TInterfacedObject, INFSeCalculoAplicadorService)
  public
    procedure AplicarCalculo(
      var Nota: NFSeModel; const Calculo: CalculoTributosNFSeOutput; ATributosRTC, ATributosLegados: Boolean
    );
  end;

implementation

uses
  NFSeEtdUnit, CurrencyNullableUnit;

{ NFSeCalculoAplicadorService }

procedure NFSeCalculoAplicadorService.AplicarCalculo(var Nota: NFSeModel; const Calculo: CalculoTributosNFSeOutput;
  ATributosRTC, ATributosLegados: Boolean);
var
  FNFSe: NFSeEtd;
begin
  FNFSe := Nota.NFSe;

  FNFSe.VLiq := CurrencyNullable.CreateOrNull( Calculo.TotaisNFSe.ValorLiquido );
  FNFSe.VTotNf := CurrencyNullable.CreateOrNull( Calculo.TotaisNFSe.ValorTotalNF );
  FNFSe.VTotalRet := CurrencyNullable.CreateOrNull( Calculo.TotaisNFSe.TotalRetencoes );

  if ATributosLegados then
  begin
    FNFSe.TribIssQn := Calculo.ISSQN.TipoTributacao;
    FNFSe.TpRetIssQn := Calculo.ISSQN.TipoRetencao;
    FNFSe.IssPAliq := Calculo.ISSQN.Aliquota;
    FNFSe.IssVBC := Calculo.ISSQN.BaseCalculo;
    FNFSe.VIss := Calculo.ISSQN.ValorISSQN;

    FNFSe.VRetIrrf := Calculo.RetenFederal.ValorIRRF;
    FNFSe.VRetCsll := Calculo.RetenFederal.ValorCSLL;
    FNFSe.VRetCP := Calculo.RetenFederal.ValorCP;
    FNFSe.VRetPis := Calculo.RetenFederal.ValorPIS;
    FNFSe.VRetCofins := Calculo.RetenFederal.ValorCOFINS;

    FNFSe.TpRetPisCofins := Calculo.PISCOFINS.TipoRetencao;

    FNFSe.PCCst := Calculo.PISCOFINS.CST;
    FNFSe.PCVBcPisCofins := Calculo.PISCOFINS.BaseCalculo;
    FNFSe.PCPAliqPis := Calculo.PISCOFINS.PPis;
    FNFSe.PCPAliqCofins := Calculo.PISCOFINS.PCofins;
    FNFSe.PCVPis := Calculo.PISCOFINS.VPis;
    FNFSe.PCVCofins := Calculo.PISCOFINS.VCofins;

    // Ficou setando tudo, o usuario ve e pode decidir alterar o IndTotTrib
    FNFSe.PTotTribFed.SetValue( Calculo.TribAprox.PTotTribFed );
    FNFSe.PTotTribEst.SetValue( Calculo.TribAprox.PTotTribEst );
    FNFSe.PTotTribMun.SetValue( Calculo.TribAprox.PTotTribMun );
    FNFSe.PTotTribSN.SetValue( Calculo.TribAprox.PTotTribSN );
  end;

  if ATributosRTC then
    Nota.Tributo := Calculo.TributoDFe.Clone();
end;

end.
