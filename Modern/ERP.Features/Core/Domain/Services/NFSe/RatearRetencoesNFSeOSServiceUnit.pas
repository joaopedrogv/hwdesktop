unit RatearRetencoesNFSeOSServiceUnit;

interface

uses
  IRatearRetencoesNFSeOSServiceUnit, NFSeEtdUnit, NFSeOSEtdUnit;

type
  RatearRetencoesNFSeOSService = class(TInterfacedObject, IRatearRetencoesNFSeOSService)
  public
    procedure Executar(const NFSe: NFSeEtd; NFOsList: NFSeOSEtdList; out HouveRateio: Boolean);
  end;

implementation

uses
  SysUtils, Math, NFSeTypesUnit, NumberServiceUnit;

type
  RetCampo = (rcIRRF, rcCSLL, rcCP, rcPIS, rcCOFINS, rcISS );

procedure ApplyRetencao(ItemNFOS: NFSeOSEtd; Campo: RetCampo; ValorRetencao: Currency);
begin
  case Campo of
    rcIRRF  : ItemNFOS.VRetIrrf := ValorRetencao;
    rcCSLL  : ItemNFOS.VRetCsll := ValorRetencao;
    rcCP    : ItemNFOS.VRetCP := ValorRetencao;
    rcPIS   : ItemNFOS.VRetPis := ValorRetencao;
    rcCOFINS: ItemNFOS.VRetCofins := ValorRetencao;
    rcISS   : ItemNFOS.VRetIss := ValorRetencao;
  end;
end;

{ RatearRetencoesNFSeOSService }

procedure RatearRetencoesNFSeOSService.Executar(const NFSe: NFSeEtd; NFOsList: NFSeOSEtdList; out HouveRateio: Boolean);
var
  nfOS: NFSeOSEtd;
  vtot, vitem, vmax, vretencao, vratret: Currency;
  I, iRet: Integer;
  E: RetCampo;
begin
  if not Assigned(NFSe) or not Assigned(NFOsList) or (NFOsList.Count = 0)
    or ((NFSe.VRetIrrf.Value = 0) and (NFSe.VRetCsll.Value = 0) and (NFSe.VRetCP.Value = 0)
      and (NFSe.VRetPis.Value = 0) and (NFSe.VRetCofins.Value > 0)
      and ((NFSe.VIss.Value = 0) and (NFSe.TpRetIssQn in [trRetidoPeloTomador, trRetidoPeloIntermediario]))
    ) then
  begin
    HouveRateio := False;
    Exit;
  end;

  // Somanto totais e definindo ID do item com maior valor para receber o valor da ultima retencao
  vtot := 0;
  iRet := -1;
  vmax := 0;
  for I := 0 to NFOsList.Count - 1 do
  begin
    nfOS := NFOsList.Items[I];
    vitem := nfOS.VServicos - nfOS.VDescontos;
    vtot := vtot + vitem;
    if vitem > vmax then
    begin
      iRet := I;
      vmax := vitem;
    end;
  end;

  if vtot <= 0 then
  begin
    HouveRateio := False;
    Exit;
  end;

  HouveRateio := True;

  for E := Low(RetCampo) to High(RetCampo) do
  begin
    case E of
      rcIRRF  : vretencao := NFSe.VRetIrrf.Value;
      rcCSLL  : vretencao := NFSe.VRetCsll.Value;
      rcCP    : vretencao := NFSe.VRetCP.Value;
      rcPIS   : vretencao := NFSe.VRetPis.Value;
      rcCOFINS: vretencao := NFSe.VRetCofins.Value;
      rcISS   : vretencao := NumberService.IfThenCurr(
                  NFSe.TpRetIssQn in [trRetidoPeloTomador, trRetidoPeloIntermediario], NFSe.VIss.Value
                );
    end;

    if vretencao <= 0 then
    begin
      for I := 0 to NFOsList.Count - 1 do
        ApplyRetencao(NFOsList.Items[I], E, 0 );

      Continue;
    end;

    for I := 0 to NFOsList.Count - 1 do
      if I <> iRet then
      begin
        nfOS := NFOsList.Items[I];

        if (nfOS.VServicos - nfOS.VDescontos) > 0 then
        begin
          vitem := nfOS.VServicos - nfOS.VDescontos;

          vratret := RoundTo(vitem / vtot * vretencao, -2);

          ApplyRetencao( nfOS, E, vratret);

          vretencao := vretencao - vratret;
        end;
      end;

    if iRet <> -1 then
      ApplyRetencao(NFOsList.Items[iRet], E, vretencao ); // recebe o que sobra
  end;
  {
  for I := 0 to NFSeOSs.Count - 1 do
    if I <> iRet then
    begin
      nfOS := NFSeOSs.Items[I];

      if (nfOS.VServicos - nfOS.VDescontos) > 0 then
      begin
        vitem := nfOS.VServicos - nfOS.VDescontos;

        nfOS.VTotRet := RoundTo(vitem / vtot * ValorRetencoes, -2);
        ValorRetencoes := ValorRetencoes - nfOS.VTotRet;
      end;
    end;

  if iRet <> -1 then
    NFSeOSs.Items[iRet].VTotRet := ValorRetencoes; // recebe o que sobra
  }
end;

end.
