unit NFSeConverterUnit;

interface

uses
  SysUtils, Classes,
  INFSeConverterUnit,
  ACBrNFSeXInterface,
  ACBrNFSeXNotasFiscais,
  NFSeModelUnit,
  TributoDFeContextEtdUnit,
  DpsEmitirModelUnit;

type
  NFSeConverter = class(TInterfacedObject, INFSeConverter)
  private
    FDpsEmitir: DpsEmitirModel;
    FNota: TNotaFiscal;
    procedure EvitarRejeicoesPadraoNacional();
    function DevePreencherPAliq(): Boolean;
  public
    procedure ConverterParaACBr(
      const DpsEmitir: DpsEmitirModel;
      const Nota: TNotaFiscal
    );
    function ConververParaTributoDFe(
      const NotaERP: NFSeModel;
      const NotaWS: TNotaFiscal
    ): TributoDFeContextEtd;
  end;

implementation

uses
  MaskUtils,
  ACBrNFSeXClass, ACBrNFSeXConversao, ACBrDFe.Conversao,
  NFSeTypesUnit, TipoComunsUnit, NFSeEtdUnit, DFeTypesUnit, DpsEmitirIbsCbsNacionalModelUnit, TributoDFeIbsCbsEtdUnit,
  TributoDFeOrigemEnumUnit, StringNullableUnit, StringServiceUnit, CurrencyNullableUnit, DoubleNullableUnit,
  TributoDFeGrupoIbsCbsEtdUnit, TributoDFeCredPresOpIbsCbsEtdUnit, NumberServiceUnit, TributoDFeIbsCbsTribRegEtdUnit,
  TributoDFeIbsCbsCompraGovEtdUnit, EstadosServiceUnit;

{ NFSeConverter }

procedure NFSeConverter.ConverterParaACBr(
  const DpsEmitir: DpsEmitirModel;
  const Nota: TNotaFiscal
);
var
  NFSe: TNFSe;
  DPS: NFSeEtd;
  TribDfe: DpsEmitirIbsCbsNacionalModel;
  ok: Boolean;
  sChv: string;
begin
  // Precisa setar antes ou depois
  // NotasFiscais.NumeroLote:='1';
  // NotasFiscais.Transacao := True;

  FNota := Nota;
  FDpsEmitir := DpsEmitir;

  NFSe := Nota.NFSe;
  DPS := DpsEmitir.DPS.NFSe;
  TribDfe := DpsEmitir.DPS.IbsCbsNacional;

  // =============== 1. REGIME TRIBUTARIO ===============
  if DpsEmitir.IncentivoCultural then
    NFSe.IncentivadorCultural := TnfseSimNao.snSim
  else
    NFSe.IncentivadorCultural := TnfseSimNao.snNao;

  case DpsEmitir.OpSimpNac of
    osnOptanteMEI,
    osnOptanteMEEPP:
      NFSe.OptanteSimplesNacional := TnfseSimNao.snSim;
    else
      NFSe.OptanteSimplesNacional := TnfseSimNao.snNao;
  end;

  case DpsEmitir.OpSimpNac of
    osnNaoOptante:
      NFSe.OptanteSN := TOptanteSN.osnNaoOptante;

    osnOptanteMEI:
      NFSe.OptanteSN := TOptanteSN.osnOptanteMEI;

    osnOptanteMEEPP:
      NFSe.OptanteSN := TOptanteSN.osnOptanteMEEPP;

    else
      NFSe.OptanteSN := TOptanteSN.osnNaoOptante;
  end;

  case DpsEmitir.RegApTribSN of
    raNaoDefinido            : ;
    raFederaisMunicipalpeloSN: NFSe.RegimeApuracaoSN := TRegimeApuracaoSN.raFederaisMunicipalpeloSN;
    raFederaisSN             : NFSe.RegimeApuracaoSN := TRegimeApuracaoSN.raFederaisSN;
    raFederaisMunicipalforaSN: NFSe.RegimeApuracaoSN := TRegimeApuracaoSN.raFederaisMunicipalforaSN;
  end;

  // =============== 2. EMITENTE (PRESTADOR) ===============
  NFSe.Prestador.Endereco.CodigoMunicipio                  := DpsEmitir.CLocEmi.ToString();
  NFSe.Prestador.IdentificacaoPrestador.Cnpj               := DpsEmitir.PrestCpfCnpj;
  NFSe.Prestador.IdentificacaoPrestador.InscricaoMunicipal := DpsEmitir.PrestIm.Value;
  if DPS.LayoutNFSe = lytPrefeitura  then
    NFSe.Prestador.RazaoSocial := DpsEmitir.PrestRazao;

  // =============== 3. TOMADOR ===============
  if Assigned(DPS.ParticipantePrincipal) then
  begin
    NFSe.Tomador.IdentificacaoTomador.CpfCnpj := DPS.ParticipantePrincipal.Cpfcnpj.Value;
    NFSe.Tomador.IdentificacaoTomador.InscricaoMunicipal := DPS.ParticipantePrincipal.Im.Value;

    NFSe.Tomador.RazaoSocial := DPS.ParticipantePrincipal.Xnome;

    NFSe.Tomador.Endereco.Endereco := DPS.ParticipantePrincipal.Xlgr.Value;
    NFSe.Tomador.Endereco.Numero := DPS.ParticipantePrincipal.Nro.Value;
    NFSe.Tomador.Endereco.Complemento := DPS.ParticipantePrincipal.Xcpl.Value;
    NFSe.Tomador.Endereco.Bairro := DPS.ParticipantePrincipal.Xbairro.Value;
    NFSe.Tomador.Endereco.CodigoMunicipio := DPS.ParticipantePrincipal.Cmun.Value.ToString();
    NFSe.Tomador.Endereco.CEP := DPS.ParticipantePrincipal.Cep.Value;

    if DPS.LayoutNFSe = lytPrefeitura  then
    begin
      NFSe.Tomador.Endereco.CodigoPais := 1058;
      NFSe.Tomador.Endereco.UF := EstadosService.MunicipioIbgeToUF(DPS.ParticipantePrincipal.Cmun.Value);
    end;

    NFSe.Tomador.Contato.Telefone := DPS.ParticipantePrincipal.Fone.Value;
    NFSe.Tomador.Contato.Email := DPS.ParticipantePrincipal.Email.Value;
  end;

  // =============== 4. INTERMEDIÁRIO (opcional) ===============
  if Assigned(DPS.Intermediario) then
  begin
    NFSe.Intermediario.Identificacao.CpfCnpj := DPS.Intermediario.Cpfcnpj.Value;
    NFSe.Intermediario.Identificacao.InscricaoMunicipal := DPS.Intermediario.Im.Value;

    NFSe.Intermediario.RazaoSocial := DPS.Intermediario.Xnome;

    NFSe.Intermediario.Endereco.Endereco := DPS.Intermediario.Xlgr.Value;
    NFSe.Intermediario.Endereco.Numero := DPS.Intermediario.Nro.Value;
    NFSe.Intermediario.Endereco.Complemento := DPS.Intermediario.Xcpl.Value;
    NFSe.Intermediario.Endereco.Bairro := DPS.Intermediario.Xbairro.Value;
    NFSe.Intermediario.Endereco.CodigoMunicipio := DPS.Intermediario.Cmun.Value.ToString();
    NFSe.Intermediario.Endereco.CEP := DPS.Intermediario.Cep.Value;

    NFSe.Intermediario.Contato.Telefone := DPS.Intermediario.Fone.Value;
    NFSe.Intermediario.Contato.Email := DPS.Intermediario.Email.Value;
  end;

  // =============== 5. SERVIÇO ===============
  NFSe.Servico.Discriminacao := DPS.XDescServ.Value;
  NFSe.Servico.CodigoCnae    := DPS.CCNAE.Value;
  NFSe.Servico.CodigoNBS     := DPS.CNBS.Value;

  if not DPS.CTribNac.IsNullOrWhiteSpace() then
    NFSe.Servico.CodigoServicoNacional := FormatMaskText('99.99.99;0', DPS.CTribNac.Value);

  if DPS.IsPadraoNacional() then
  begin
    NFSe.Servico.ItemListaServico := DPS.CTribNac.Value;
    NFSe.Servico.CodigoTributacaoMunicipio := DPS.CTribMun.Value;
  end
  else
  begin
    NFSe.Servico.ItemListaServico := DPS.CLC116.Value;
    NFSe.Servico.CodigoTributacaoMunicipio := DPS.CTribMun.Value;
  end;

  NFSe.Servico.CodigoMunicipio     := DPS.CLocPrestacao.Value.ToString();
  NFSe.Servico.CodigoPais          := 1058; // fixo
  NFSe.Servico.MunicipioIncidencia := DPS.CLocPrestacao.Value;

  NFSe.Servico.ExigibilidadeISS := exiExigivel; // fixo

  case DPS.TpRetIssQn of
    trNaoDefinido,
    trNaoRetido: ;   // Sem correpondencia no compoente
    trRetidoPeloTomador      : NFSe.Servico.ResponsavelRetencao := TnfseResponsavelRetencao.rtTomador;
    trRetidoPeloIntermediario: NFSe.Servico.ResponsavelRetencao := TnfseResponsavelRetencao.rtIntermediario;
  end;

  // =============== 6. VALORES ===============
  with NFSe.Servico.Valores do
  begin
    if DPS.IsPadraoNacional() then
    begin
      ValorServicos := DPS.VServ.Value;
      DescontoIncondicionado := DPS.VDescIncond.Value;
      DescontoCondicionado := 0.00;                // fixo
      ValorDeducoes := 0.00;                       // fixo

      // ISS
      case DPS.TribIssQn of
        tiNaoDefinido,      // tributado
        tiOperacaoTributavel: tribMun.tribISSQN := TtribISSQN.tiOperacaoTributavel;
        tiImunidade         : tribMun.tribISSQN := TtribISSQN.tiImunidade;
        tiExportacao        : tribMun.tribISSQN := TtribISSQN.tiExportacao;
        tiNaoIncidencia     : tribMun.tribISSQN := TtribISSQN.tiNaoIncidencia;
      end;

      case DPS.TpRetIssQn of
        trRetidoPeloTomador      : tribMun.tpRetISSQN := TtpRetISSQN.trRetidoPeloTomador;
        trRetidoPeloIntermediario: tribMun.tpRetISSQN := TtpRetISSQN.trRetidoPeloIntermediario;
        else
          tribMun.tpRetISSQN := TtpRetISSQN.trNaoRetido;
      end;

      tribMun.pAliq := DPS.IssPAliq.Value;

      // Retenções federais
      tribFed.vRetIRRF := DPS.VRetIrrf.Value;
      tribFed.vRetCSLL := DPS.VRetCsll.Value + DPS.VRetPis.Value + DPS.VRetCofins.Value;
      tribFed.vRetCP := DPS.VRetCP.Value;

      if DPS.PCCst.HasValue then
      begin
        tribFed.CST := StrToCST( ok, DPS.PCCst.Value );
        tribFed.vBCPisCofins := DPS.PCVBcPisCofins.Value;
        tribFed.pAliqPis := DPS.PCPAliqPis.Value;
        tribFed.pAliqCofins := DPS.PCPAliqCofins.Value;
        tribFed.vPis := DPS.PCVPis.Value;
        tribFed.vCofins := DPS.PCVCofins.Value;

        case Dps.TpRetPisCofins of
          trpiscofinscsllNaoRetido       : tribFed.tpRetPisCofins := TtpRetPisCofins.trpiscofinscsllNaoRetido;
          trpcRetido                     : tribFed.tpRetPisCofins := TtpRetPisCofins.trpcRetido;
          trpcNaoRetido                  : tribFed.tpRetPisCofins := TtpRetPisCofins.trpcNaoRetido;
          trpiscofinscsllRetido          : tribFed.tpRetPisCofins := TtpRetPisCofins.trpiscofinscsllRetido;
          trpiscofinsRetidocsllNaoRetido : tribFed.tpRetPisCofins := TtpRetPisCofins.trpiscofinsRetidocsllNaoRetido;
          trPisRetidoCofinsCsllNaoRetido : tribFed.tpRetPisCofins := TtpRetPisCofins.trPisRetidoCofinsCsllNaoRetido;
          trCofinsRetidoPisCsllNaoRetido : tribFed.tpRetPisCofins := TtpRetPisCofins.trCofinsRetidoPisCsllNaoRetido;
          trCofinsCsllRetidoPisNaoRetido : tribFed.tpRetPisCofins := TtpRetPisCofins.trCofinsCsllRetidoPisNaoRetido;
          trCsllRetidoPisCofinsNaoRetido : tribFed.tpRetPisCofins := TtpRetPisCofins.trCsllRetidoPisCofinsNaoRetido;
          trPisCsllRetidoCofinsNaoRetido : tribFed.tpRetPisCofins := TtpRetPisCofins.trPisCsllRetidoCofinsNaoRetido;
        end;
      end;

      if DpsEmitir.PreferirAliqSNaoIbpt then
        totTrib.pTotTribSN := DPS.PTotTribSN.Value
      else
      begin
        totTrib.pTotTribFed := DPS.PTotTribFed.Value;
        totTrib.pTotTribEst := DPS.PTotTribEst.Value;
        totTrib.pTotTribMun := DPS.PTotTribMun.Value;
      end;

      // Valores aproximados dos tributos
      if DPS.IndTotTrib = YesNoEnum.ynYes then
      begin
        totTrib.indTotTrib := TindTotTrib.indSim;
        if totTrib.pTotTribSN = 0 then
          totTrib.pTotTribSN := totTrib.pTotTribSN + 0.001;// Exites o testes no ACBr desse campo > 0, isso força a geracao
      end
      else
        totTrib.indTotTrib := TindTotTrib.indNao;

      // Tributacao municipal
      case dps.TpRetIssQn of
        trNaoDefinido,
        trNaoRetido              : tribMun.tpRetISSQN := TtpRetISSQN.trNaoRetido;
        trRetidoPeloTomador      : tribMun.tpRetISSQN := TtpRetISSQN.trRetidoPeloTomador;
        trRetidoPeloIntermediario: tribMun.tpRetISSQN := TtpRetISSQN.trRetidoPeloIntermediario;
      end;
    end
    else
    begin
      ValorServicos := DPS.VServ.Value;
      DescontoIncondicionado := DPS.VDescIncond.Value;
      DescontoCondicionado := 0.00;                // fixo
      ValorDeducoes := 0.00;                       // fixo

      // ISS
      ValorIss    := DPS.VIss.Value;
      Aliquota    := DPS.IssPAliq.Value;
      BaseCalculo := DPS.IssVBC.Value;

      // Situação do ISS retido
      case DPS.TpRetIssQn of
        trRetidoPeloTomador,
        trRetidoPeloIntermediario: // O intermediario seria = TnfseSituacaoTributaria.stSubstituicao?
          IssRetido := TnfseSituacaoTributaria.stRetencao;
        else
          IssRetido := TnfseSituacaoTributaria.stNormal;
      end;

      if IssRetido = stRetencao then
        ValorIssRetido := DPS.VIss.Value;

      // Retenções federais
      ValorIr := DPS.VRetIrrf.Value;
      ValorCsll := DPS.VRetCsll.Value;
      ValorInss := DPS.VRetCP.Value;
      ValorPis := DPS.VRetPis.Value;
      ValorCofins := DPS.VRetCofins.Value;
      OutrasRetencoes := 0.00;
    end;
  end;

  // =============== 7. IBSCBS ===============

  if DPS.IsPadraoNacional and DPS.LayoutNFSeComIbsCbs then
  begin
    NFSe.IBSCBS.finNFSe := TfinNFSe(DPS.FinNFSe);
    NFSe.IBSCBS.indFinal := TindFinal.ifSim;
    NFSe.IBSCBS.cIndOp := DPS.CIndOp.Value;
    NFSe.IBSCBS.tpOper := TtpOperGovNFSe(Ord(DPS.TpOper)); // Temos os mesmos valores no enumerado
    NFSe.IBSCBS.tpEnteGov := TtpEnteGov(Ord(DPS.TpEnteGov));

    // Destinatario
    NFSe.IBSCBS.indDest := TindDest(DPS.IndDest);
    if (NFSe.IBSCBS.indDest = TindDest.idTomadorAdquirenteDestinatarioIguais)
      and Assigned(DPS.DestIbsCbs)
    then
    begin
      with NFSe.IBSCBS.dest do
      begin
        CNPJCPF := DPS.DestIbsCbs.Cpfcnpj.Value;
        NIF := DPS.DestIbsCbs.Nif.Value;
        cNaoNIF := TNaoNIF(DPS.DestIbsCbs.Cnaonif.Value);
        xNome := DPS.DestIbsCbs.Xnome;
        ender.endNac.cMun := DPS.DestIbsCbs.Cmun.Value;
        ender.endNac.CEP := DPS.DestIbsCbs.Cep.Value;
        ender.xLgr := DPS.DestIbsCbs.Xlgr.Value;
        ender.nro := DPS.DestIbsCbs.Nro.Value;
        ender.xCpl := DPS.DestIbsCbs.Xcpl.Value;
        ender.xBairro := DPS.DestIbsCbs.Xbairro.Value;
      end;
    end;

    // Chaves referenciadas
    for sChv in DPS.RefNFSe do
      with NFSe.IBSCBS.gRefNFSe.New do
        refNFSe := sChv;

    // Tributos do IBSCBS
    with NFSe.IBSCBS.valores.trib.gIBSCBS do
    begin
      CST := StrToCSTIBSCBS( TribDfe.CST );
      cClassTrib := TribDfe.CClassTrib;
      if TribDfe.CCredPres.HasValue then
        cCredPres := StrTocCredPres( TribDfe.CCredPres.Value );

      if TribDfe.CClassRribReg.HasValue then
      begin
        gTribRegular.CSTReg := StrToCSTIBSCBS( TribDfe.CSTReg.Value );
        gTribRegular.cClassTribReg := TribDfe.CClassRribReg.Value;
      end;

      if not TribDfe.PDifUF.IsNullOrZero //DPS.IbsCbs.PDifUF.IsNullOrZero
        or not TribDfe.PDifMun.IsNullOrZero // DPS.IbsCbs.PDifMun.IsNullOrZero
        or not TribDfe.PDifCBS.IsNull // DPS.IbsCbs.PDifCBS.IsNullOrZero
      then
      begin
        gDif.pDifUF := TribDfe.PDifUF.Value;
        gDif.pDifMun := TribDfe.PDifMun.Value;
        gDif.pDifCBS := TribDfe.PDifCBS.Value;
      end;
    end;
  end;

  // =============== 8. SUBSTITUICAO RPS/DPS ===============
  if Assigned(DPS.Substituida) then
  begin
    if DPS.IsPadraoNacional() then
    begin
      NFSe.subst.chSubstda := DPS.Substituida.Chave.Value;
      NFSe.subst.xMotivo := DPS.Substituida.XMotivo.Value;
      case StrToIntDef( DPS.Substituida.CMotivo.Value, -1 ) of
        1: NFSe.subst.cMotivo := TcMotivo.cmDesenquadramento;
        2: NFSe.subst.cMotivo := TcMotivo.cmEnquadramento;
        3: NFSe.subst.cMotivo := TcMotivo.cmInclusao;
        4: NFSe.subst.cMotivo := TcMotivo.cmExclusao;
        5: NFSe.subst.cMotivo := TcMotivo.cmRejeicao;
        else
          NFSe.subst.cMotivo := TcMotivo.cmOutros;
      end;
    end
    else
    begin
      if DPS.Substituida.Ndps.HasValue then
        NFSe.RpsSubstituido.Numero := DPS.Substituida.Ndps.Value.ToString();

      NFSe.RpsSubstituido.Serie := DPS.Substituida.Serie.Value;
      NFSe.RpsSubstituido.Tipo := trRPS;
      NFSe.NfseSubstituida := DPS.Substituida.NNFSe.Value.ToString();
    end;
  end;

  // =============== 9. INFORMAÇÕES GERAIS DO DPS ===============
  NFSe.IdentificacaoRps.Numero := DPS.Ndps.Value.ToString();
  NFSe.IdentificacaoRps.Serie  := DPS.Serie.Value.Trim();
  NFSe.IdentificacaoRps.Tipo   := trRPS;            // fixo
  NFSe.StatusRps               := srNormal;         // fixo
  NFSe.DataEmissao             := DPS.DhEmi.Value;
  NFSe.Competencia             := DPS.DCompet.Value;
  NFSe.NaturezaOperacao        := no1;              // fixo ?
  //NFSe.OutrasInformacoes       := DPS>O'Pagamento a Vista';

  NFSe.verAplic := DPS.VerAplic.Value; //Versão da aplicação

  case DPS.TpAmb of
    tpaProducao:
      NFSe.Producao := TnfseSimNao.snSim;
    else
      NFSe.Producao := TnfseSimNao.snNao;
  end;

  if not DpsEmitir.ProviderUsaApiPropria then
  begin
    case DPS.LayoutNFSe of
      lytNacionalSemIbsCbs,
      lytNacionalComIbsCbs:
        EvitarRejeicoesPadraoNacional();
    end;
  end;
end;

function NFSeConverter.ConververParaTributoDFe(const NotaERP: NFSeModel; const NotaWS: TNotaFiscal): TributoDFeContextEtd;
var
  IbsCbs: TributoDFeIbsCbsEtd;
  GIbsCbs: TributoDFeGrupoIbsCbsEtd;
  CredPresOp: TributoDFeCredPresOpIbsCbsEtd;
  TribRegular: TributoDFeIbsCbsTribRegEtd;
  CompraGov: TributoDFeIbsCbsCompraGovEtd;
  DPS: NFSeEtd;
  nfWS: TNFSe;
  nfERP: NFSeEtd;
  RegraFiscalId: StringNullable;
  dNull: DoubleNullable;
  vBcCredPres: DoubleNullable;
begin
  if not NotaERP.NFSe.LayoutNFSeComIbsCbs()           // Teste de nao existencia do IBSCBS
    or (NotaWS.NFSe.infNFSe.cLocIncid = 0) then
    Exit(nil);

  nfWS := NotaWS.NFSe;
  nfERP := NotaERP.NFSe;
  dNull := DoubleNullable.NullInstance();

  // Tributacao Regula
  if NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.vTribRegIBSUF, 0)
    and NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.vTribRegIBSMun, 0)
    and NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.vTribRegCBS, 0)
  then
    TribRegular := nil
  else
    TribRegular := TributoDFeIbsCbsTribRegEtd.Create(
      nfERP.Id,
      StringService.Default(
        CSTIBSCBSToStr(nfWS.IBSCBS.valores.trib.gIBSCBS.gTribRegular.CSTReg),
        NotaERP.IbsCbsNacional.CSTReg.Value
      ),
      StringService.Default(
        nfWS.IBSCBS.valores.trib.gIBSCBS.gTribRegular.cClassTribReg,
        NotaERP.IbsCbsNacional.CClassRribReg.Value
      ),
      nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.pAliqEfeRegIBSUF,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.vTribRegIBSUF,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.pAliqEfeRegIBSMun,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.vTribRegIBSMun,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.pAliqEfeRegCBS,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribRegular.vTribRegCBS
    );

  // Compra Governamental
  if NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.vIBSUF, 0)
    and NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.vIBSMun, 0)
    and NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.vCBS, 0)
  then
    CompraGov := nil
  else
    CompraGov := TributoDFeIbsCbsCompraGovEtd.Create(
      nfERP.Id,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.pIBSUF,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.vIBSUF,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.pIBSMun,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.vIBSMun,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.pCBS,
      nfWS.infNFSe.IBSCBS.totCIBS.gTribCompraGov.vCBS
    );

  // Grupo Ibs Cbs
  GIbsCbs := TributoDFeGrupoIbsCbsEtd.Create(
    nfERP.Id,
    nfws.infNFSe.IBSCBS.valores.vBC,
    nfws.infNFSe.IBSCBS.valores.uf.pIBSUF,
    DoubleNullable.Create( NumberService.Default(
      nfWS.IBSCBS.valores.trib.GIbsCbs.gDif.pDifUF,
      NotaERP.IbsCbsNacional.PDifUF.Value
    )),
    DoubleNullable.Create(nfWS.infNFSe.IBSCBS.totCIBS.gIBS.gIBSUFTot.vDifUF),
    dNull,
    DoubleNullable.CreateOrNull(nfws.infNFSe.IBSCBS.valores.uf.pRedAliqUF),
    DoubleNullable.CreateOrNull(nfws.infNFSe.IBSCBS.valores.uf.pAliqEfetUF),
    nfWS.infNFSe.IBSCBS.totCIBS.gIBS.gIBSUFTot.vIBSUF,
    nfws.infNFSe.IBSCBS.valores.mun.pIBSMun,
    DoubleNullable.Create( NumberService.Default(
      nfWS.IBSCBS.valores.trib.GIbsCbs.gDif.pDifMun,
      NotaERP.IbsCbsNacional.PDifMun.Value
    )),
    DoubleNullable.Create(nfWS.infNFSe.IBSCBS.totCIBS.gIBS.gIBSMunTot.vDifMun),
    dNull,
    DoubleNullable.CreateOrNull(nfws.infNFSe.IBSCBS.valores.mun.pRedAliqMun),
    DoubleNullable.CreateOrNull(nfws.infNFSe.IBSCBS.valores.mun.pAliqEfetMun),
    nfWS.infNFSe.IBSCBS.totCIBS.gIBS.gIBSMunTot.vIBSMun,
    nfWS.infNFSe.IBSCBS.totCIBS.gIBS.vIBSTot,
    nfws.infNFSe.IBSCBS.valores.fed.pCBS,
    DoubleNullable.Create( NumberService.Default(
      nfWS.IBSCBS.valores.trib.GIbsCbs.gDif.pDifCBS,
      NotaERP.IbsCbsNacional.pDifCBS.Value
    )),
    DoubleNullable.Create(nfWS.infNFSe.IBSCBS.totCIBS.gCBS.vDifCBS),
    dNull,
    DoubleNullable.CreateOrNull(nfws.infNFSe.IBSCBS.valores.fed.pRedAliqCBS),
    DoubleNullable.CreateOrNull(nfws.infNFSe.IBSCBS.valores.fed.pAliqEfetCBS),
    nfWS.infNFSe.IBSCBS.totCIBS.gCBS.vCBS,
    TribRegular,
    CompraGov
  );

  // Creditor Presumidor Operacao
  if NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gCBS.gCBSCredPres.vCredPresCBS, 0)
    and NumberService.SameMonetaryDouble(nfWS.infNFSe.IBSCBS.totCIBS.gIBS.gIBSCredPres.vCredPresIBS, 0)
  then
    CredPresOp := nil
  else
  begin
    vBcCredPres := DoubleNullable.NullInstance();//? Nao tem, fica como

    CredPresOp := TributoDFeCredPresOpIbsCbsEtd.Create(
      nfERP.Id,
      vBcCredPres.Value,
      StringService.Default(
        cCredPresToStr(nfWS.IBSCBS.valores.trib.gIBSCBS.cCredPres),
        NotaERP.IbsCbsNacional.CCredPres.Value
      ),
      DoubleNullable.Create(nfWS.infNFSe.IBSCBS.totCIBS.gIBS.gIBSCredPres.pCredPresIBS),
      DoubleNullable.Create(nfWS.infNFSe.IBSCBS.totCIBS.gIBS.gIBSCredPres.vCredPresIBS),
      dNull,
      DoubleNullable.Create(nfWS.infNFSe.IBSCBS.totCIBS.gCBS.gCBSCredPres.pCredPresCBS),
      DoubleNullable.Create(nfWS.infNFSe.IBSCBS.totCIBS.gCBS.gCBSCredPres.vCredPresCBS),
      dNull
    );
  end;

  // IbsCbs
  IbsCbs := TributoDFeIbsCbsEtd.Create(
    nfERP.Id,
    NotaERP.IbsCbsNacional.RegraFiscalId,
    NotaERP.IbsCbsNacional.TipoRegra,
    StringService.Default(
      CSTIBSCBSToStr(nfws.IBSCBS.valores.trib.gIBSCBS.CST),
      NotaERP.IbsCbsNacional.CST
    ),
    StringService.Default(
      nfws.IBSCBS.valores.trib.gIBSCBS.cClassTrib,
      NotaERP.IbsCbsNacional.CClassTrib
    ),
    {IndDoacao} False,
    {VCbsEstCred} dNull,
    {VIbsEstCred} dNull,
    GIbsCbs,
    {Monofasia} nil,
    {TransfCred} nil,
    {AjusteCompet} nil,
    CredPresOp,
    {CredPresZFM} nil
  );

  // Root
  Result := TributoDFeContextEtd.Create(
    nfERP.Id,
    tdfoNFSe,
    {ImpostoSeletivo} nil,
    IbsCbs
  );
end;

function NFSeConverter.DevePreencherPAliq: Boolean;
begin
  // Regra 501: Alíquota não pode ser superior a 5%
  // (Verifique isso separadamente antes de decidir preencher)

  // Regra 502: MEI nunca preenche pAliq
  if FNota.NFSe.OptanteSN = TOptanteSN.osnOptanteMEI then
    Result := False

  // Regra 503: Imune/exportação/não incidência nunca preenchem
  else if FNota.NFSe.Servico.Valores.tribMun.tribISSQN
    in [ TtribISSQN.tiImunidade, TtribISSQN.tiExportacao, TtribISSQN.tiNaoIncidencia ] then
    Result := False

  // Regra 504: Regimes especiais nunca preenchem
  else if FNota.NFSe.RegimeEspecialTributacao <> TnfseRegimeEspecialTributacao.retNenhum then
    Result := False

  // Regra 505: Benefícios municipais específicos nunca preenchem
  //else if (beneficioMunicipal = 'Isenção') or (beneficioMunicipal = 'Alíquota Diferenciada') then
    //Result := False

  // Regra 506/507: Não optantes do Simples
  else if FNota.NFSe.OptanteSN = TOptanteSN.osnNaoOptante then
    Result := not FDpsEmitir.ConvenioAtivo // Preenche apenas se convênio NÃO está ativo

  // Regra 508-513: Optantes do Simples ME/EPP
  else if FNota.NFSe.OptanteSN = TOptanteSN.osnOptanteMEEPP then
  begin
    if FNota.NFSe.RegimeApuracaoSN = TRegimeApuracaoSN.raFederaisMunicipalpeloSN then  // Apuração pelo Simples Nacional
    begin
      if FDpsEmitir.ConvenioAtivo then
        Result := (FNota.NFSe.Servico.Valores.tribMun.tpRetISSQN
          in [ TtpRetISSQN.trRetidoPeloTomador, TtpRetISSQN.trRetidoPeloIntermediario ]) //and (beneficioMunicipal = 'Nenhum')
      else
        Result := (FNota.NFSe.Servico.Valores.tribMun.tpRetISSQN
          in [ TtpRetISSQN.trRetidoPeloTomador, TtpRetISSQN.trRetidoPeloIntermediario ]);
    end
    else  // Apuração fora do Simples Nacional
    begin
      Result := not FDpsEmitir.ConvenioAtivo
    end;
  end
  else
    Result := False;  // Caso padrão
end;

procedure NFSeConverter.EvitarRejeicoesPadraoNacional();
begin
  // Evitar rejeicoes de pAliq
  if not DevePreencherPAliq() then
    FNota.NFSe.Servico.Valores.tribMun.pAliq := 0;
end;

end.
