unit NotaFiscalEtdUnit;

interface

uses
  Contnrs,
  Classes,
  SysUtils,
  EntityBaseUnit,
  StatusRegistroEnumUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  DoubleNullableUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit;

type
  NotaFiscalEtd = class(EntityBase)
  private
    FCodNf: Integer;
    FCodEmpresa: Integer;
    FNaturezaNf: string;
    FTipoNf: string;
    FNumNf: Integer;
    FSerie: string;
    FCodigoNop: DoubleNullable;
    FDescNatop: StringNullable;
    FCodigoTr: IntegerNullable;
    FCodCliente: Integer;
    FCodCondPag: IntegerNullable;
    FCodVendedor: Integer;
    FNumNfem: IntegerNullable;
    FDataContabil: DateTimeNullable;
    FDataLanc: DateTimeNullable;
    FDataEntSaida: DateTimeNullable;
    FHoraEntSaida: DateTimeNullable;
    FValorTotal: DoubleNullable;
    FValorProd: DoubleNullable;
    FValorServ: DoubleNullable;
    FAliqIcm: DoubleNullable;
    FBaseIcm: DoubleNullable;
    FValorIcm: DoubleNullable;
    FValorDesc: DoubleNullable;
    FValorDescP: DoubleNullable;
    FValorDescS: DoubleNullable;
    FAliqIrrf: DoubleNullable;
    FAliqIss: DoubleNullable;
    FBaseIss: DoubleNullable;
    FValorIss: DoubleNullable;
    FBaseIcmsub: DoubleNullable;
    FValorIcmsub: DoubleNullable;
    FBaseIpi: DoubleNullable;
    FValorIpi: DoubleNullable;
    FValorFrete: DoubleNullable;
    FValorSeguro: DoubleNullable;
    FValorOutDesp: DoubleNullable;
    FValorDespPf: DoubleNullable;
    FValorAcresFin: DoubleNullable;
    FValorPis: DoubleNullable;
    FValorPisSt: DoubleNullable;
    FValorCofins: DoubleNullable;
    FValorCofinsSt: DoubleNullable;
    FBaseIrrf: DoubleNullable;
    FValorIrrf: DoubleNullable;
    FStatus: StringNullable;
    FObs: StringNullable;
    FFreteBaseIpi: StringNullable;
    FFreteFNfe: StringNullable;
    FFreteBaseIcm: StringNullable;
    FFretecontaTr: StringNullable;
    FPlacaTr: StringNullable;
    FUfPlacaTr: StringNullable;
    FQtdeVolumesTr: IntegerNullable;
    FEspecieTr: StringNullable;
    FMarcaTr: StringNullable;
    FNumeroTr: StringNullable;
    FCrt: StringNullable;
    FResultadoEnvio: StringNullable;
    FDataAutorizacao: DateTimeNullable;
    FSituacaoNfe: StringNullable;
    FDigest: StringNullable;
    FProtocolo: StringNullable;
    FCodigoerro: StringNullable;
    FDescricaoerro: StringNullable;
    FTemporesposta: IntegerNullable;
    FHoraEnvio: StringNullable;
    FTiponfe: StringNullable;
    FDanfeimpresso: StringNullable;
    FDatahoraEnvio: DateTimeNullable;
    FChaveNfe: StringNullable;
    FSelNfe: IntegerNullable;
    FNFormSeguranca: IntegerNullable;
    FNumNfVndant: IntegerNullable;
    FSubSerieant: IntegerNullable;
    FJustCancelamento: StringNullable;
    FModeloNf: StringNullable;
    FSubserie: StringNullable;
    FComProd: StringNullable;
    FComServ: StringNullable;
    FInutilnfant: StringNullable;
    FEmissaoPropria: StringNullable;
    FNumPed: IntegerNullable;
    FAntecTrib: StringNullable;
    FDevolucao: StringNullable;
    FBenefFiscal: StringNullable;
    FConfEnt: StringNullable;
    FTpNf: StringNullable;
    FDa: StringNullable;
    FMnf: StringNullable;
    FCodUsuario: IntegerNullable;
    FExtemporaneo: StringNullable;
    FTipoEmissao: StringNullable;
    FNumNfEmt: IntegerNullable;
    FSerieEmt: StringNullable;
    FCodNfRef: IntegerNullable;
    FNumNfCompl: IntegerNullable;
    FSerieCompl: StringNullable;
    FTipoDesconto: StringNullable;
    FPesoB: DoubleNullable;
    FPesoL: DoubleNullable;
    FNComando: IntegerNullable;
    FAtivo: StatusRegistroEnum;
    FCodCons: StringNullable;
    FVlForn: DoubleNullable;
    FVlTerc: DoubleNullable;
    FTpLigacao: IntegerNullable;
    FCodGrupoTensao: StringNullable;
    FCstDespesa: StringNullable;
    FVlServ: DoubleNullable;
    FVlServNt: DoubleNullable;
    FTpAssinante: StringNullable;
    FDadosInteresseFisco: StringNullable;
    FDadosLancamentoFiscal: StringNullable;
    FNfeCmsg: IntegerNullable;
    FNfeXmsg: StringNullable;
    FNfeDhcont: DateTimeNullable;
    FNfeXjust: StringNullable;
    FNfeDpecCstat: IntegerNullable;
    FNfeDpecXmotivo: StringNullable;
    FNfeDpecNregdpec: StringNullable;
    FAliqIcmSimples: DoubleNullable;
    FBaseIcmSimples: DoubleNullable;
    FValorIcmSimples: DoubleNullable;
    FInscricaoSubstituto: StringNullable;
    FCnaeFiscal: StringNullable;
    FImEmp: StringNullable;
    FNumGerado: StringNullable;
    FNCaixa: IntegerNullable;
    FInfCorpoV: StringNullable;
    FNped: IntegerNullable;
    FTipoPed: StringNullable;
    FLoteNfe: IntegerNullable;
    FIpiBaseIcm: StringNullable;
    FConfPiscofins: StringNullable;
    FComplementarEnt: StringNullable;
    FTemPiscofinsSt: StringNullable;
    FAddPiscofinsStTotalnf: StringNullable;
    FValorIi: DoubleNullable;
    FPathXmlImport: StringNullable;
    FCodCarga: IntegerNullable;
    FCodDevolucao: IntegerNullable;
    FCodNfRemVfe: IntegerNullable;
    FNfeRecibo: StringNullable;
    FStatNferecibo: StringNullable;
    FUfembarq: StringNullable;
    FXlocembarq: StringNullable;
    FSemSerie: StringNullable;
    FConsumidorFinal: StringNullable;
    FVerificarMudCfop: StringNullable;
    FVtottrib: DoubleNullable;
    FCodNfTransf: IntegerNullable;
    FCodEmpTransf: IntegerNullable;
    FDupXmlEntrada: StringNullable;
    FCodProducaoMp: IntegerNullable;
    FSomenserv: StringNullable;
    FModDesBh: StringNullable;
    FChaveNfse: StringNullable;
    FMotivoNaoRetencao: StringNullable;
    FTipoRecIssqn: StringNullable;
    FLocalIncidencia: IntegerNullable;
    FIdModelo21: StringNullable;
    FLoteConferencia: IntegerNullable;
    FHoraEmissao: StringNullable;
    FNfeIndpres: StringNullable;
    FNfeIddest: StringNullable;
    FXlocdespacho: StringNullable;
    FDataEstoque: DateTimeNullable;
    FVfcpufdest: DoubleNullable;
    FVicmsufdest: DoubleNullable;
    FVicmsufremet: DoubleNullable;
    FNfeIndiedest: IntegerNullable;
    FXmlNfe: StringNullable;
    FCnfe: IntegerNullable;
    FFcpVfcp: DoubleNullable;
    FFcpVfcpst: DoubleNullable;
    FFcpVfcpstret: DoubleNullable;
    FIpiVipidevol: DoubleNullable;
    FNomeCliente: StringNullable;
    FRazao: StringNullable;
    FCpfcgc: StringNullable;
    FDestIdestrangeiro: StringNullable;
    FDestIsuf: StringNullable;
    FDestIm: StringNullable;
    FDestEmail: StringNullable;
    FDestXlgr: StringNullable;
    FDestNro: StringNullable;
    FDestXcpl: StringNullable;
    FDestXbairro: StringNullable;
    FDestCmun: IntegerNullable;
    FDestXmun: StringNullable;
    FDestUf: StringNullable;
    FDestCep: StringNullable;
    FDestCpais: IntegerNullable;
    FDestXpais: StringNullable;
    FDestFone: StringNullable;
    FInscEst: StringNullable;
    FDestSeqid: IntegerNullable;
    FPagVtroco: DoubleNullable;
    FFatNfat: StringNullable;
    FFatVorig: DoubleNullable;
    FFatVdesc: DoubleNullable;
    FFatVliq: DoubleNullable;
    FNfeVersao: StringNullable;
    FNfeTpemis: StringNullable;
    FNfeTpamb: StringNullable;
    FTrRntc: StringNullable;
    FNfeCstat: IntegerNullable;
    FObsBol1: StringNullable;
    FClClultimacompra: StringNullable;
    FClStatusF: StringNullable;
    FLoteFat: IntegerNullable;
    FIdAjuste: IntegerNullable;
    FVicmdeson: DoubleNullable;
    FFinalidadeid: IntegerNullable;
    FTipoSeguro: StringNullable;
    FTipoOutdesp: StringNullable;
    FTipoFrete: StringNullable;
    FClGerarPontos: StringNullable;
    FTotaisComDeson: StringNullable;
    FImportXml: StringNullable;
    FEfdrestcomplicmsId: IntegerNullable;
    FIndintermed: StringNullable;
    FInfintermedCnpj: StringNullable;
    FInfintermedIdcadinttran: StringNullable;
    FConfBc: StringNullable;
    FVpisdeson: DoubleNullable;
    FVcofinsdeson: DoubleNullable;
    FConfIsuf: StringNullable;
    FCompraXnemp: StringNullable;
    FCompraXped: StringNullable;
    FCompraXcont: StringNullable;
    FTipoDesppf: StringNullable;
    FVretcofins: DoubleNullable;
    FVretpis: DoubleNullable;
    FVretcsll: DoubleNullable;
    FVbcretprev: DoubleNullable;
    FVretprev: DoubleNullable;
    FQbcmono: DoubleNullable;
    FVicmsmono: DoubleNullable;
    FQbcmonoreten: DoubleNullable;
    FVicmsmonoreten: DoubleNullable;
    FQbcmonoret: DoubleNullable;
    FVicmsmonoret: DoubleNullable;
    FGuidt: StringNullable;
    FRetFed: IntegerNullable;
    FCodCliPed: IntegerNullable;
    FDpreventrega: DateTimeNullable;
    FCmunfg: IntegerNullable;
    FCmunfgibs: IntegerNullable;
    FTpnfdebito: IntegerNullable;
    FTpnfcredito: IntegerNullable;
    FVnftot: CurrencyNullable;
    FVbcibscbs: CurrencyNullable;
    FIbsufVdif: CurrencyNullable;
    FIbsufVdevtrib: CurrencyNullable;
    FVibsuf: CurrencyNullable;
    FIbsmunVdif: CurrencyNullable;
    FIbsmunVdevtrib: CurrencyNullable;
    FVibsmun: CurrencyNullable;
    FVibs: CurrencyNullable;
    FIbsVcredpres: CurrencyNullable;
    FIbsVcredprescondsus: CurrencyNullable;
    FCbsVdif: CurrencyNullable;
    FCbsVdevtrib: CurrencyNullable;
    FVcbs: CurrencyNullable;
    FCbsVcredpres: CurrencyNullable;
    FCbsVcredprescondsus: CurrencyNullable;
    FVibsmono: CurrencyNullable;
    FVcbsmono: CurrencyNullable;
    FVibsmonoreten: CurrencyNullable;
    FVcbsmonoreten: CurrencyNullable;
    FVibsmonoret: CurrencyNullable;
    FVcbsmonoret: CurrencyNullable;
    FVibsestcred: CurrencyNullable;
    FVcbsestcred: CurrencyNullable;
    FVis: CurrencyNullable;
    FOpInternaId: StringNullable;
    FDfeTribIgnorar: IntegerNullable;
    FRedbenefpcCalc: IntegerNullable;
    FTpimp: IntegerNullable;
  public
    constructor Create(); overload;
    constructor Create(
      ACodNf: Integer;
      ACodEmpresa: Integer;
      const ANaturezaNf: string;
      const ATipoNf: string;
      ANumNf: Integer;
      const ASerie: string;
      const ACodigoNop: DoubleNullable;
      const ADescNatop: StringNullable;
      const ACodigoTr: IntegerNullable;
      ACodCliente: Integer;
      const ACodCondPag: IntegerNullable;
      ACodVendedor: Integer;
      const ANumNfem: IntegerNullable;
      const ADataContabil: DateTimeNullable;
      const ADataLanc: DateTimeNullable;
      const ADataEntSaida: DateTimeNullable;
      const AHoraEntSaida: DateTimeNullable;
      const AValorTotal: DoubleNullable;
      const AValorProd: DoubleNullable;
      const AValorServ: DoubleNullable;
      const AAliqIcm: DoubleNullable;
      const ABaseIcm: DoubleNullable;
      const AValorIcm: DoubleNullable;
      const AValorDesc: DoubleNullable;
      const AValorDescP: DoubleNullable;
      const AValorDescS: DoubleNullable;
      const AAliqIrrf: DoubleNullable;
      const AAliqIss: DoubleNullable;
      const ABaseIss: DoubleNullable;
      const AValorIss: DoubleNullable;
      const ABaseIcmsub: DoubleNullable;
      const AValorIcmsub: DoubleNullable;
      const ABaseIpi: DoubleNullable;
      const AValorIpi: DoubleNullable;
      const AValorFrete: DoubleNullable;
      const AValorSeguro: DoubleNullable;
      const AValorOutDesp: DoubleNullable;
      const AValorDespPf: DoubleNullable;
      const AValorAcresFin: DoubleNullable;
      const AValorPis: DoubleNullable;
      const AValorPisSt: DoubleNullable;
      const AValorCofins: DoubleNullable;
      const AValorCofinsSt: DoubleNullable;
      const ABaseIrrf: DoubleNullable;
      const AValorIrrf: DoubleNullable;
      const AStatus: StringNullable;
      const AObs: StringNullable;
      const AFreteBaseIpi: StringNullable;
      const AFreteFNfe: StringNullable;
      const AFreteBaseIcm: StringNullable;
      const AFretecontaTr: StringNullable;
      const APlacaTr: StringNullable;
      const AUfPlacaTr: StringNullable;
      const AQtdeVolumesTr: IntegerNullable;
      const AEspecieTr: StringNullable;
      const AMarcaTr: StringNullable;
      const ANumeroTr: StringNullable;
      const ACrt: StringNullable;
      const AResultadoEnvio: StringNullable;
      const ADataAutorizacao: DateTimeNullable;
      const ASituacaoNfe: StringNullable;
      const ADigest: StringNullable;
      const AProtocolo: StringNullable;
      const ACodigoerro: StringNullable;
      const ADescricaoerro: StringNullable;
      const ATemporesposta: IntegerNullable;
      const AHoraEnvio: StringNullable;
      const ATiponfe: StringNullable;
      const ADanfeimpresso: StringNullable;
      const ADatahoraEnvio: DateTimeNullable;
      const AChaveNfe: StringNullable;
      const ASelNfe: IntegerNullable;
      const ANFormSeguranca: IntegerNullable;
      const ANumNfVndant: IntegerNullable;
      const ASubSerieant: IntegerNullable;
      const AJustCancelamento: StringNullable;
      const AModeloNf: StringNullable;
      const ASubserie: StringNullable;
      const AComProd: StringNullable;
      const AComServ: StringNullable;
      const AInutilnfant: StringNullable;
      const AEmissaoPropria: StringNullable;
      const ANumPed: IntegerNullable;
      const AAntecTrib: StringNullable;
      const ADevolucao: StringNullable;
      const ABenefFiscal: StringNullable;
      const AConfEnt: StringNullable;
      const ATpNf: StringNullable;
      const ADa: StringNullable;
      const AMnf: StringNullable;
      const ACodUsuario: IntegerNullable;
      const AExtemporaneo: StringNullable;
      const ATipoEmissao: StringNullable;
      const ANumNfEmt: IntegerNullable;
      const ASerieEmt: StringNullable;
      const ACodNfRef: IntegerNullable;
      const ANumNfCompl: IntegerNullable;
      const ASerieCompl: StringNullable;
      const ATipoDesconto: StringNullable;
      const APesoB: DoubleNullable;
      const APesoL: DoubleNullable;
      const ANComando: IntegerNullable;
      AAtivo: StatusRegistroEnum;
      const ACodCons: StringNullable;
      const AVlForn: DoubleNullable;
      const AVlTerc: DoubleNullable;
      const ATpLigacao: IntegerNullable;
      const ACodGrupoTensao: StringNullable;
      const ACstDespesa: StringNullable;
      const AVlServ: DoubleNullable;
      const AVlServNt: DoubleNullable;
      const ATpAssinante: StringNullable;
      const ADadosInteresseFisco: StringNullable;
      const ADadosLancamentoFiscal: StringNullable;
      const ANfeCmsg: IntegerNullable;
      const ANfeXmsg: StringNullable;
      const ANfeDhcont: DateTimeNullable;
      const ANfeXjust: StringNullable;
      const ANfeDpecCstat: IntegerNullable;
      const ANfeDpecXmotivo: StringNullable;
      const ANfeDpecNregdpec: StringNullable;
      const AAliqIcmSimples: DoubleNullable;
      const ABaseIcmSimples: DoubleNullable;
      const AValorIcmSimples: DoubleNullable;
      const AInscricaoSubstituto: StringNullable;
      const ACnaeFiscal: StringNullable;
      const AImEmp: StringNullable;
      const ANumGerado: StringNullable;
      const ANCaixa: IntegerNullable;
      const AInfCorpoV: StringNullable;
      const ANped: IntegerNullable;
      const ATipoPed: StringNullable;
      const ALoteNfe: IntegerNullable;
      const AIpiBaseIcm: StringNullable;
      const AConfPiscofins: StringNullable;
      const AComplementarEnt: StringNullable;
      const ATemPiscofinsSt: StringNullable;
      const AAddPiscofinsStTotalnf: StringNullable;
      const AValorIi: DoubleNullable;
      const APathXmlImport: StringNullable;
      const ACodCarga: IntegerNullable;
      const ACodDevolucao: IntegerNullable;
      const ACodNfRemVfe: IntegerNullable;
      const ANfeRecibo: StringNullable;
      const AStatNferecibo: StringNullable;
      const AUfembarq: StringNullable;
      const AXlocembarq: StringNullable;
      const ASemSerie: StringNullable;
      const AConsumidorFinal: StringNullable;
      const AVerificarMudCfop: StringNullable;
      const AVtottrib: DoubleNullable;
      const ACodNfTransf: IntegerNullable;
      const ACodEmpTransf: IntegerNullable;
      const ADupXmlEntrada: StringNullable;
      const ACodProducaoMp: IntegerNullable;
      const ASomenserv: StringNullable;
      const AModDesBh: StringNullable;
      const AChaveNfse: StringNullable;
      const AMotivoNaoRetencao: StringNullable;
      const ATipoRecIssqn: StringNullable;
      const ALocalIncidencia: IntegerNullable;
      const AIdModelo21: StringNullable;
      const ALoteConferencia: IntegerNullable;
      const AHoraEmissao: StringNullable;
      const ANfeIndpres: StringNullable;
      const ANfeIddest: StringNullable;
      const AXlocdespacho: StringNullable;
      const ADataEstoque: DateTimeNullable;
      const AVfcpufdest: DoubleNullable;
      const AVicmsufdest: DoubleNullable;
      const AVicmsufremet: DoubleNullable;
      const ANfeIndiedest: IntegerNullable;
      const AXmlNfe: StringNullable;
      const ACnfe: IntegerNullable;
      const AFcpVfcp: DoubleNullable;
      const AFcpVfcpst: DoubleNullable;
      const AFcpVfcpstret: DoubleNullable;
      const AIpiVipidevol: DoubleNullable;
      const ANomeCliente: StringNullable;
      const ARazao: StringNullable;
      const ACpfcgc: StringNullable;
      const ADestIdestrangeiro: StringNullable;
      const ADestIsuf: StringNullable;
      const ADestIm: StringNullable;
      const ADestEmail: StringNullable;
      const ADestXlgr: StringNullable;
      const ADestNro: StringNullable;
      const ADestXcpl: StringNullable;
      const ADestXbairro: StringNullable;
      const ADestCmun: IntegerNullable;
      const ADestXmun: StringNullable;
      const ADestUf: StringNullable;
      const ADestCep: StringNullable;
      const ADestCpais: IntegerNullable;
      const ADestXpais: StringNullable;
      const ADestFone: StringNullable;
      const AInscEst: StringNullable;
      const ADestSeqid: IntegerNullable;
      const APagVtroco: DoubleNullable;
      const AFatNfat: StringNullable;
      const AFatVorig: DoubleNullable;
      const AFatVdesc: DoubleNullable;
      const AFatVliq: DoubleNullable;
      const ANfeVersao: StringNullable;
      const ANfeTpemis: StringNullable;
      const ANfeTpamb: StringNullable;
      const ATrRntc: StringNullable;
      const ANfeCstat: IntegerNullable;
      const AObsBol1: StringNullable;
      const AClClultimacompra: StringNullable;
      const AClStatusF: StringNullable;
      const ALoteFat: IntegerNullable;
      const AIdAjuste: IntegerNullable;
      const AVicmdeson: DoubleNullable;
      const AFinalidadeid: IntegerNullable;
      const ATipoSeguro: StringNullable;
      const ATipoOutdesp: StringNullable;
      const ATipoFrete: StringNullable;
      const AClGerarPontos: StringNullable;
      const ATotaisComDeson: StringNullable;
      const AImportXml: StringNullable;
      const AEfdrestcomplicmsId: IntegerNullable;
      const AIndintermed: StringNullable;
      const AInfintermedCnpj: StringNullable;
      const AInfintermedIdcadinttran: StringNullable;
      const AConfBc: StringNullable;
      const AVpisdeson: DoubleNullable;
      const AVcofinsdeson: DoubleNullable;
      const AConfIsuf: StringNullable;
      const ACompraXnemp: StringNullable;
      const ACompraXped: StringNullable;
      const ACompraXcont: StringNullable;
      const ATipoDesppf: StringNullable;
      const AVretcofins: DoubleNullable;
      const AVretpis: DoubleNullable;
      const AVretcsll: DoubleNullable;
      const AVbcretprev: DoubleNullable;
      const AVretprev: DoubleNullable;
      const AQbcmono: DoubleNullable;
      const AVicmsmono: DoubleNullable;
      const AQbcmonoreten: DoubleNullable;
      const AVicmsmonoreten: DoubleNullable;
      const AQbcmonoret: DoubleNullable;
      const AVicmsmonoret: DoubleNullable;
      const AGuidt: StringNullable;
      const ARetFed: IntegerNullable;
      const ACodCliPed: IntegerNullable;
      const ADpreventrega: DateTimeNullable;
      const ACmunfg: IntegerNullable;
      const ACmunfgibs: IntegerNullable;
      const ATpnfdebito: IntegerNullable;
      const ATpnfcredito: IntegerNullable;
      const AVnftot: CurrencyNullable;
      const AVbcibscbs: CurrencyNullable;
      const AIbsufVdif: CurrencyNullable;
      const AIbsufVdevtrib: CurrencyNullable;
      const AVibsuf: CurrencyNullable;
      const AIbsmunVdif: CurrencyNullable;
      const AIbsmunVdevtrib: CurrencyNullable;
      const AVibsmun: CurrencyNullable;
      const AVibs: CurrencyNullable;
      const AIbsVcredpres: CurrencyNullable;
      const AIbsVcredprescondsus: CurrencyNullable;
      const ACbsVdif: CurrencyNullable;
      const ACbsVdevtrib: CurrencyNullable;
      const AVcbs: CurrencyNullable;
      const ACbsVcredpres: CurrencyNullable;
      const ACbsVcredprescondsus: CurrencyNullable;
      const AVibsmono: CurrencyNullable;
      const AVcbsmono: CurrencyNullable;
      const AVibsmonoreten: CurrencyNullable;
      const AVcbsmonoreten: CurrencyNullable;
      const AVibsmonoret: CurrencyNullable;
      const AVcbsmonoret: CurrencyNullable;
      const AVibsestcred: CurrencyNullable;
      const AVcbsestcred: CurrencyNullable;
      const AVis: CurrencyNullable;
      const AOpInternaId: StringNullable;
      const ADfeTribIgnorar: IntegerNullable;
      const ARedbenefpcCalc: IntegerNullable;
      const ATpimp: IntegerNullable
    ); overload;

    function Clone(): EntityBase; override;

    property CodNf: Integer read FCodNf;
    property CodEmpresa: Integer read FCodEmpresa;
    property NaturezaNf: string read FNaturezaNf;
    property TipoNf: string read FTipoNf;
    property NumNf: Integer read FNumNf;
    property Serie: string read FSerie;
    property CodigoNop: DoubleNullable read FCodigoNop;
    property DescNatop: StringNullable read FDescNatop;
    property CodigoTr: IntegerNullable read FCodigoTr;
    property CodCliente: Integer read FCodCliente;
    property CodCondPag: IntegerNullable read FCodCondPag;
    property CodVendedor: Integer read FCodVendedor;
    property NumNfem: IntegerNullable read FNumNfem;
    property DataContabil: DateTimeNullable read FDataContabil;
    property DataLanc: DateTimeNullable read FDataLanc;
    property DataEntSaida: DateTimeNullable read FDataEntSaida;
    property HoraEntSaida: DateTimeNullable read FHoraEntSaida;
    property ValorTotal: DoubleNullable read FValorTotal;
    property ValorProd: DoubleNullable read FValorProd;
    property ValorServ: DoubleNullable read FValorServ;
    property AliqIcm: DoubleNullable read FAliqIcm;
    property BaseIcm: DoubleNullable read FBaseIcm;
    property ValorIcm: DoubleNullable read FValorIcm;
    property ValorDesc: DoubleNullable read FValorDesc;
    property ValorDescP: DoubleNullable read FValorDescP;
    property ValorDescS: DoubleNullable read FValorDescS;
    property AliqIrrf: DoubleNullable read FAliqIrrf;
    property AliqIss: DoubleNullable read FAliqIss;
    property BaseIss: DoubleNullable read FBaseIss;
    property ValorIss: DoubleNullable read FValorIss;
    property BaseIcmsub: DoubleNullable read FBaseIcmsub;
    property ValorIcmsub: DoubleNullable read FValorIcmsub;
    property BaseIpi: DoubleNullable read FBaseIpi;
    property ValorIpi: DoubleNullable read FValorIpi;
    property ValorFrete: DoubleNullable read FValorFrete;
    property ValorSeguro: DoubleNullable read FValorSeguro;
    property ValorOutDesp: DoubleNullable read FValorOutDesp;
    property ValorDespPf: DoubleNullable read FValorDespPf;
    property ValorAcresFin: DoubleNullable read FValorAcresFin;
    property ValorPis: DoubleNullable read FValorPis;
    property ValorPisSt: DoubleNullable read FValorPisSt;
    property ValorCofins: DoubleNullable read FValorCofins;
    property ValorCofinsSt: DoubleNullable read FValorCofinsSt;
    property BaseIrrf: DoubleNullable read FBaseIrrf;
    property ValorIrrf: DoubleNullable read FValorIrrf;
    property Status: StringNullable read FStatus;
    property Obs: StringNullable read FObs;
    property FreteBaseIpi: StringNullable read FFreteBaseIpi;
    property FreteFNfe: StringNullable read FFreteFNfe;
    property FreteBaseIcm: StringNullable read FFreteBaseIcm;
    property FretecontaTr: StringNullable read FFretecontaTr;
    property PlacaTr: StringNullable read FPlacaTr;
    property UfPlacaTr: StringNullable read FUfPlacaTr;
    property QtdeVolumesTr: IntegerNullable read FQtdeVolumesTr;
    property EspecieTr: StringNullable read FEspecieTr;
    property MarcaTr: StringNullable read FMarcaTr;
    property NumeroTr: StringNullable read FNumeroTr;
    property Crt: StringNullable read FCrt;
    property ResultadoEnvio: StringNullable read FResultadoEnvio;
    property DataAutorizacao: DateTimeNullable read FDataAutorizacao;
    property SituacaoNfe: StringNullable read FSituacaoNfe;
    property Digest: StringNullable read FDigest;
    property Protocolo: StringNullable read FProtocolo;
    property Codigoerro: StringNullable read FCodigoerro;
    property Descricaoerro: StringNullable read FDescricaoerro;
    property Temporesposta: IntegerNullable read FTemporesposta;
    property HoraEnvio: StringNullable read FHoraEnvio;
    property Tiponfe: StringNullable read FTiponfe;
    property Danfeimpresso: StringNullable read FDanfeimpresso;
    property DatahoraEnvio: DateTimeNullable read FDatahoraEnvio;
    property ChaveNfe: StringNullable read FChaveNfe;
    property SelNfe: IntegerNullable read FSelNfe;
    property NFormSeguranca: IntegerNullable read FNFormSeguranca;
    property NumNfVndant: IntegerNullable read FNumNfVndant;
    property SubSerieant: IntegerNullable read FSubSerieant;
    property JustCancelamento: StringNullable read FJustCancelamento;
    property ModeloNf: StringNullable read FModeloNf;
    property Subserie: StringNullable read FSubserie;
    property ComProd: StringNullable read FComProd;
    property ComServ: StringNullable read FComServ;
    property Inutilnfant: StringNullable read FInutilnfant;
    property EmissaoPropria: StringNullable read FEmissaoPropria;
    property NumPed: IntegerNullable read FNumPed;
    property AntecTrib: StringNullable read FAntecTrib;
    property Devolucao: StringNullable read FDevolucao;
    property BenefFiscal: StringNullable read FBenefFiscal;
    property ConfEnt: StringNullable read FConfEnt;
    property TpNf: StringNullable read FTpNf;
    property Da: StringNullable read FDa;
    property Mnf: StringNullable read FMnf;
    property CodUsuario: IntegerNullable read FCodUsuario;
    property Extemporaneo: StringNullable read FExtemporaneo;
    property TipoEmissao: StringNullable read FTipoEmissao;
    property NumNfEmt: IntegerNullable read FNumNfEmt;
    property SerieEmt: StringNullable read FSerieEmt;
    property CodNfRef: IntegerNullable read FCodNfRef;
    property NumNfCompl: IntegerNullable read FNumNfCompl;
    property SerieCompl: StringNullable read FSerieCompl;
    property TipoDesconto: StringNullable read FTipoDesconto;
    property PesoB: DoubleNullable read FPesoB;
    property PesoL: DoubleNullable read FPesoL;
    property NComando: IntegerNullable read FNComando;
    property Ativo: StatusRegistroEnum read FAtivo;
    property CodCons: StringNullable read FCodCons;
    property VlForn: DoubleNullable read FVlForn;
    property VlTerc: DoubleNullable read FVlTerc;
    property TpLigacao: IntegerNullable read FTpLigacao;
    property CodGrupoTensao: StringNullable read FCodGrupoTensao;
    property CstDespesa: StringNullable read FCstDespesa;
    property VlServ: DoubleNullable read FVlServ;
    property VlServNt: DoubleNullable read FVlServNt;
    property TpAssinante: StringNullable read FTpAssinante;
    property DadosInteresseFisco: StringNullable read FDadosInteresseFisco;
    property DadosLancamentoFiscal: StringNullable read FDadosLancamentoFiscal;
    property NfeCmsg: IntegerNullable read FNfeCmsg;
    property NfeXmsg: StringNullable read FNfeXmsg;
    property NfeDhcont: DateTimeNullable read FNfeDhcont;
    property NfeXjust: StringNullable read FNfeXjust;
    property NfeDpecCstat: IntegerNullable read FNfeDpecCstat;
    property NfeDpecXmotivo: StringNullable read FNfeDpecXmotivo;
    property NfeDpecNregdpec: StringNullable read FNfeDpecNregdpec;
    property AliqIcmSimples: DoubleNullable read FAliqIcmSimples;
    property BaseIcmSimples: DoubleNullable read FBaseIcmSimples;
    property ValorIcmSimples: DoubleNullable read FValorIcmSimples;
    property InscricaoSubstituto: StringNullable read FInscricaoSubstituto;
    property CnaeFiscal: StringNullable read FCnaeFiscal;
    property ImEmp: StringNullable read FImEmp;
    property NumGerado: StringNullable read FNumGerado;
    property NCaixa: IntegerNullable read FNCaixa;
    property InfCorpoV: StringNullable read FInfCorpoV;
    property Nped: IntegerNullable read FNped;
    property TipoPed: StringNullable read FTipoPed;
    property LoteNfe: IntegerNullable read FLoteNfe;
    property IpiBaseIcm: StringNullable read FIpiBaseIcm;
    property ConfPiscofins: StringNullable read FConfPiscofins;
    property ComplementarEnt: StringNullable read FComplementarEnt;
    property TemPiscofinsSt: StringNullable read FTemPiscofinsSt;
    property AddPiscofinsStTotalnf: StringNullable read FAddPiscofinsStTotalnf;
    property ValorIi: DoubleNullable read FValorIi;
    property PathXmlImport: StringNullable read FPathXmlImport;
    property CodCarga: IntegerNullable read FCodCarga;
    property CodDevolucao: IntegerNullable read FCodDevolucao;
    property CodNfRemVfe: IntegerNullable read FCodNfRemVfe;
    property NfeRecibo: StringNullable read FNfeRecibo;
    property StatNferecibo: StringNullable read FStatNferecibo;
    property Ufembarq: StringNullable read FUfembarq;
    property Xlocembarq: StringNullable read FXlocembarq;
    property SemSerie: StringNullable read FSemSerie;
    property ConsumidorFinal: StringNullable read FConsumidorFinal;
    property VerificarMudCfop: StringNullable read FVerificarMudCfop;
    property Vtottrib: DoubleNullable read FVtottrib;
    property CodNfTransf: IntegerNullable read FCodNfTransf;
    property CodEmpTransf: IntegerNullable read FCodEmpTransf;
    property DupXmlEntrada: StringNullable read FDupXmlEntrada;
    property CodProducaoMp: IntegerNullable read FCodProducaoMp;
    property Somenserv: StringNullable read FSomenserv;
    property ModDesBh: StringNullable read FModDesBh;
    property ChaveNfse: StringNullable read FChaveNfse;
    property MotivoNaoRetencao: StringNullable read FMotivoNaoRetencao;
    property TipoRecIssqn: StringNullable read FTipoRecIssqn;
    property LocalIncidencia: IntegerNullable read FLocalIncidencia;
    property IdModelo21: StringNullable read FIdModelo21;
    property LoteConferencia: IntegerNullable read FLoteConferencia;
    property HoraEmissao: StringNullable read FHoraEmissao;
    property NfeIndpres: StringNullable read FNfeIndpres;
    property NfeIddest: StringNullable read FNfeIddest;
    property Xlocdespacho: StringNullable read FXlocdespacho;
    property DataEstoque: DateTimeNullable read FDataEstoque;
    property Vfcpufdest: DoubleNullable read FVfcpufdest;
    property Vicmsufdest: DoubleNullable read FVicmsufdest;
    property Vicmsufremet: DoubleNullable read FVicmsufremet;
    property NfeIndiedest: IntegerNullable read FNfeIndiedest;
    property XmlNfe: StringNullable read FXmlNfe;
    property Cnfe: IntegerNullable read FCnfe;
    property FcpVfcp: DoubleNullable read FFcpVfcp;
    property FcpVfcpst: DoubleNullable read FFcpVfcpst;
    property FcpVfcpstret: DoubleNullable read FFcpVfcpstret;
    property IpiVipidevol: DoubleNullable read FIpiVipidevol;
    property NomeCliente: StringNullable read FNomeCliente;
    property Razao: StringNullable read FRazao;
    property Cpfcgc: StringNullable read FCpfcgc;
    property DestIdestrangeiro: StringNullable read FDestIdestrangeiro;
    property DestIsuf: StringNullable read FDestIsuf;
    property DestIm: StringNullable read FDestIm;
    property DestEmail: StringNullable read FDestEmail;
    property DestXlgr: StringNullable read FDestXlgr;
    property DestNro: StringNullable read FDestNro;
    property DestXcpl: StringNullable read FDestXcpl;
    property DestXbairro: StringNullable read FDestXbairro;
    property DestCmun: IntegerNullable read FDestCmun;
    property DestXmun: StringNullable read FDestXmun;
    property DestUf: StringNullable read FDestUf;
    property DestCep: StringNullable read FDestCep;
    property DestCpais: IntegerNullable read FDestCpais;
    property DestXpais: StringNullable read FDestXpais;
    property DestFone: StringNullable read FDestFone;
    property InscEst: StringNullable read FInscEst;
    property DestSeqid: IntegerNullable read FDestSeqid;
    property PagVtroco: DoubleNullable read FPagVtroco;
    property FatNfat: StringNullable read FFatNfat;
    property FatVorig: DoubleNullable read FFatVorig;
    property FatVdesc: DoubleNullable read FFatVdesc;
    property FatVliq: DoubleNullable read FFatVliq;
    property NfeVersao: StringNullable read FNfeVersao;
    property NfeTpemis: StringNullable read FNfeTpemis;
    property NfeTpamb: StringNullable read FNfeTpamb;
    property TrRntc: StringNullable read FTrRntc;
    property NfeCstat: IntegerNullable read FNfeCstat;
    property ObsBol1: StringNullable read FObsBol1;
    property ClClultimacompra: StringNullable read FClClultimacompra;
    property ClStatusF: StringNullable read FClStatusF;
    property LoteFat: IntegerNullable read FLoteFat;
    property IdAjuste: IntegerNullable read FIdAjuste;
    property Vicmdeson: DoubleNullable read FVicmdeson;
    property Finalidadeid: IntegerNullable read FFinalidadeid;
    property TipoSeguro: StringNullable read FTipoSeguro;
    property TipoOutdesp: StringNullable read FTipoOutdesp;
    property TipoFrete: StringNullable read FTipoFrete;
    property ClGerarPontos: StringNullable read FClGerarPontos;
    property TotaisComDeson: StringNullable read FTotaisComDeson;
    property ImportXml: StringNullable read FImportXml;
    property EfdrestcomplicmsId: IntegerNullable read FEfdrestcomplicmsId;
    property Indintermed: StringNullable read FIndintermed;
    property InfintermedCnpj: StringNullable read FInfintermedCnpj;
    property InfintermedIdcadinttran: StringNullable read FInfintermedIdcadinttran;
    property ConfBc: StringNullable read FConfBc;
    property Vpisdeson: DoubleNullable read FVpisdeson;
    property Vcofinsdeson: DoubleNullable read FVcofinsdeson;
    property ConfIsuf: StringNullable read FConfIsuf;
    property CompraXnemp: StringNullable read FCompraXnemp;
    property CompraXped: StringNullable read FCompraXped;
    property CompraXcont: StringNullable read FCompraXcont;
    property TipoDesppf: StringNullable read FTipoDesppf;
    property Vretcofins: DoubleNullable read FVretcofins;
    property Vretpis: DoubleNullable read FVretpis;
    property Vretcsll: DoubleNullable read FVretcsll;
    property Vbcretprev: DoubleNullable read FVbcretprev;
    property Vretprev: DoubleNullable read FVretprev;
    property Qbcmono: DoubleNullable read FQbcmono;
    property Vicmsmono: DoubleNullable read FVicmsmono;
    property Qbcmonoreten: DoubleNullable read FQbcmonoreten;
    property Vicmsmonoreten: DoubleNullable read FVicmsmonoreten;
    property Qbcmonoret: DoubleNullable read FQbcmonoret;
    property Vicmsmonoret: DoubleNullable read FVicmsmonoret;
    property Guidt: StringNullable read FGuidt;
    property RetFed: IntegerNullable read FRetFed;
    property CodCliPed: IntegerNullable read FCodCliPed;
    property Dpreventrega: DateTimeNullable read FDpreventrega;
    property Cmunfg: IntegerNullable read FCmunfg;
    property Cmunfgibs: IntegerNullable read FCmunfgibs;
    property Tpnfdebito: IntegerNullable read FTpnfdebito;
    property Tpnfcredito: IntegerNullable read FTpnfcredito;
    property Vnftot: CurrencyNullable read FVnftot;
    property Vbcibscbs: CurrencyNullable read FVbcibscbs;
    property IbsufVdif: CurrencyNullable read FIbsufVdif;
    property IbsufVdevtrib: CurrencyNullable read FIbsufVdevtrib;
    property Vibsuf: CurrencyNullable read FVibsuf;
    property IbsmunVdif: CurrencyNullable read FIbsmunVdif;
    property IbsmunVdevtrib: CurrencyNullable read FIbsmunVdevtrib;
    property Vibsmun: CurrencyNullable read FVibsmun;
    property Vibs: CurrencyNullable read FVibs;
    property IbsVcredpres: CurrencyNullable read FIbsVcredpres;
    property IbsVcredprescondsus: CurrencyNullable read FIbsVcredprescondsus;
    property CbsVdif: CurrencyNullable read FCbsVdif;
    property CbsVdevtrib: CurrencyNullable read FCbsVdevtrib;
    property Vcbs: CurrencyNullable read FVcbs;
    property CbsVcredpres: CurrencyNullable read FCbsVcredpres;
    property CbsVcredprescondsus: CurrencyNullable read FCbsVcredprescondsus;
    property Vibsmono: CurrencyNullable read FVibsmono;
    property Vcbsmono: CurrencyNullable read FVcbsmono;
    property Vibsmonoreten: CurrencyNullable read FVibsmonoreten;
    property Vcbsmonoreten: CurrencyNullable read FVcbsmonoreten;
    property Vibsmonoret: CurrencyNullable read FVibsmonoret;
    property Vcbsmonoret: CurrencyNullable read FVcbsmonoret;
    property Vibsestcred: CurrencyNullable read FVibsestcred;
    property Vcbsestcred: CurrencyNullable read FVcbsestcred;
    property Vis: CurrencyNullable read FVis;
    property OpInternaId: StringNullable read FOpInternaId;
    property DfeTribIgnorar: IntegerNullable read FDfeTribIgnorar;
    property RedbenefpcCalc: IntegerNullable read FRedbenefpcCalc;
    property Tpimp: IntegerNullable read FTpimp;
  end;

  NotaFiscalEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): NotaFiscalEtd;
    procedure SetItem(Index: Integer; const Value: NotaFiscalEtd);
  public
    property Items[Index: Integer]: NotaFiscalEtd read GetItem write SetItem; default;
  end;

implementation

{ NotaFiscalEtd }

constructor NotaFiscalEtd.Create();
begin
  inherited Create;
end;

constructor NotaFiscalEtd.Create(
      ACodNf: Integer;
      ACodEmpresa: Integer;
      const ANaturezaNf: string;
      const ATipoNf: string;
      ANumNf: Integer;
      const ASerie: string;
      const ACodigoNop: DoubleNullable;
      const ADescNatop: StringNullable;
      const ACodigoTr: IntegerNullable;
      ACodCliente: Integer;
      const ACodCondPag: IntegerNullable;
      ACodVendedor: Integer;
      const ANumNfem: IntegerNullable;
      const ADataContabil: DateTimeNullable;
      const ADataLanc: DateTimeNullable;
      const ADataEntSaida: DateTimeNullable;
      const AHoraEntSaida: DateTimeNullable;
      const AValorTotal: DoubleNullable;
      const AValorProd: DoubleNullable;
      const AValorServ: DoubleNullable;
      const AAliqIcm: DoubleNullable;
      const ABaseIcm: DoubleNullable;
      const AValorIcm: DoubleNullable;
      const AValorDesc: DoubleNullable;
      const AValorDescP: DoubleNullable;
      const AValorDescS: DoubleNullable;
      const AAliqIrrf: DoubleNullable;
      const AAliqIss: DoubleNullable;
      const ABaseIss: DoubleNullable;
      const AValorIss: DoubleNullable;
      const ABaseIcmsub: DoubleNullable;
      const AValorIcmsub: DoubleNullable;
      const ABaseIpi: DoubleNullable;
      const AValorIpi: DoubleNullable;
      const AValorFrete: DoubleNullable;
      const AValorSeguro: DoubleNullable;
      const AValorOutDesp: DoubleNullable;
      const AValorDespPf: DoubleNullable;
      const AValorAcresFin: DoubleNullable;
      const AValorPis: DoubleNullable;
      const AValorPisSt: DoubleNullable;
      const AValorCofins: DoubleNullable;
      const AValorCofinsSt: DoubleNullable;
      const ABaseIrrf: DoubleNullable;
      const AValorIrrf: DoubleNullable;
      const AStatus: StringNullable;
      const AObs: StringNullable;
      const AFreteBaseIpi: StringNullable;
      const AFreteFNfe: StringNullable;
      const AFreteBaseIcm: StringNullable;
      const AFretecontaTr: StringNullable;
      const APlacaTr: StringNullable;
      const AUfPlacaTr: StringNullable;
      const AQtdeVolumesTr: IntegerNullable;
      const AEspecieTr: StringNullable;
      const AMarcaTr: StringNullable;
      const ANumeroTr: StringNullable;
      const ACrt: StringNullable;
      const AResultadoEnvio: StringNullable;
      const ADataAutorizacao: DateTimeNullable;
      const ASituacaoNfe: StringNullable;
      const ADigest: StringNullable;
      const AProtocolo: StringNullable;
      const ACodigoerro: StringNullable;
      const ADescricaoerro: StringNullable;
      const ATemporesposta: IntegerNullable;
      const AHoraEnvio: StringNullable;
      const ATiponfe: StringNullable;
      const ADanfeimpresso: StringNullable;
      const ADatahoraEnvio: DateTimeNullable;
      const AChaveNfe: StringNullable;
      const ASelNfe: IntegerNullable;
      const ANFormSeguranca: IntegerNullable;
      const ANumNfVndant: IntegerNullable;
      const ASubSerieant: IntegerNullable;
      const AJustCancelamento: StringNullable;
      const AModeloNf: StringNullable;
      const ASubserie: StringNullable;
      const AComProd: StringNullable;
      const AComServ: StringNullable;
      const AInutilnfant: StringNullable;
      const AEmissaoPropria: StringNullable;
      const ANumPed: IntegerNullable;
      const AAntecTrib: StringNullable;
      const ADevolucao: StringNullable;
      const ABenefFiscal: StringNullable;
      const AConfEnt: StringNullable;
      const ATpNf: StringNullable;
      const ADa: StringNullable;
      const AMnf: StringNullable;
      const ACodUsuario: IntegerNullable;
      const AExtemporaneo: StringNullable;
      const ATipoEmissao: StringNullable;
      const ANumNfEmt: IntegerNullable;
      const ASerieEmt: StringNullable;
      const ACodNfRef: IntegerNullable;
      const ANumNfCompl: IntegerNullable;
      const ASerieCompl: StringNullable;
      const ATipoDesconto: StringNullable;
      const APesoB: DoubleNullable;
      const APesoL: DoubleNullable;
      const ANComando: IntegerNullable;
      AAtivo: StatusRegistroEnum;
      const ACodCons: StringNullable;
      const AVlForn: DoubleNullable;
      const AVlTerc: DoubleNullable;
      const ATpLigacao: IntegerNullable;
      const ACodGrupoTensao: StringNullable;
      const ACstDespesa: StringNullable;
      const AVlServ: DoubleNullable;
      const AVlServNt: DoubleNullable;
      const ATpAssinante: StringNullable;
      const ADadosInteresseFisco: StringNullable;
      const ADadosLancamentoFiscal: StringNullable;
      const ANfeCmsg: IntegerNullable;
      const ANfeXmsg: StringNullable;
      const ANfeDhcont: DateTimeNullable;
      const ANfeXjust: StringNullable;
      const ANfeDpecCstat: IntegerNullable;
      const ANfeDpecXmotivo: StringNullable;
      const ANfeDpecNregdpec: StringNullable;
      const AAliqIcmSimples: DoubleNullable;
      const ABaseIcmSimples: DoubleNullable;
      const AValorIcmSimples: DoubleNullable;
      const AInscricaoSubstituto: StringNullable;
      const ACnaeFiscal: StringNullable;
      const AImEmp: StringNullable;
      const ANumGerado: StringNullable;
      const ANCaixa: IntegerNullable;
      const AInfCorpoV: StringNullable;
      const ANped: IntegerNullable;
      const ATipoPed: StringNullable;
      const ALoteNfe: IntegerNullable;
      const AIpiBaseIcm: StringNullable;
      const AConfPiscofins: StringNullable;
      const AComplementarEnt: StringNullable;
      const ATemPiscofinsSt: StringNullable;
      const AAddPiscofinsStTotalnf: StringNullable;
      const AValorIi: DoubleNullable;
      const APathXmlImport: StringNullable;
      const ACodCarga: IntegerNullable;
      const ACodDevolucao: IntegerNullable;
      const ACodNfRemVfe: IntegerNullable;
      const ANfeRecibo: StringNullable;
      const AStatNferecibo: StringNullable;
      const AUfembarq: StringNullable;
      const AXlocembarq: StringNullable;
      const ASemSerie: StringNullable;
      const AConsumidorFinal: StringNullable;
      const AVerificarMudCfop: StringNullable;
      const AVtottrib: DoubleNullable;
      const ACodNfTransf: IntegerNullable;
      const ACodEmpTransf: IntegerNullable;
      const ADupXmlEntrada: StringNullable;
      const ACodProducaoMp: IntegerNullable;
      const ASomenserv: StringNullable;
      const AModDesBh: StringNullable;
      const AChaveNfse: StringNullable;
      const AMotivoNaoRetencao: StringNullable;
      const ATipoRecIssqn: StringNullable;
      const ALocalIncidencia: IntegerNullable;
      const AIdModelo21: StringNullable;
      const ALoteConferencia: IntegerNullable;
      const AHoraEmissao: StringNullable;
      const ANfeIndpres: StringNullable;
      const ANfeIddest: StringNullable;
      const AXlocdespacho: StringNullable;
      const ADataEstoque: DateTimeNullable;
      const AVfcpufdest: DoubleNullable;
      const AVicmsufdest: DoubleNullable;
      const AVicmsufremet: DoubleNullable;
      const ANfeIndiedest: IntegerNullable;
      const AXmlNfe: StringNullable;
      const ACnfe: IntegerNullable;
      const AFcpVfcp: DoubleNullable;
      const AFcpVfcpst: DoubleNullable;
      const AFcpVfcpstret: DoubleNullable;
      const AIpiVipidevol: DoubleNullable;
      const ANomeCliente: StringNullable;
      const ARazao: StringNullable;
      const ACpfcgc: StringNullable;
      const ADestIdestrangeiro: StringNullable;
      const ADestIsuf: StringNullable;
      const ADestIm: StringNullable;
      const ADestEmail: StringNullable;
      const ADestXlgr: StringNullable;
      const ADestNro: StringNullable;
      const ADestXcpl: StringNullable;
      const ADestXbairro: StringNullable;
      const ADestCmun: IntegerNullable;
      const ADestXmun: StringNullable;
      const ADestUf: StringNullable;
      const ADestCep: StringNullable;
      const ADestCpais: IntegerNullable;
      const ADestXpais: StringNullable;
      const ADestFone: StringNullable;
      const AInscEst: StringNullable;
      const ADestSeqid: IntegerNullable;
      const APagVtroco: DoubleNullable;
      const AFatNfat: StringNullable;
      const AFatVorig: DoubleNullable;
      const AFatVdesc: DoubleNullable;
      const AFatVliq: DoubleNullable;
      const ANfeVersao: StringNullable;
      const ANfeTpemis: StringNullable;
      const ANfeTpamb: StringNullable;
      const ATrRntc: StringNullable;
      const ANfeCstat: IntegerNullable;
      const AObsBol1: StringNullable;
      const AClClultimacompra: StringNullable;
      const AClStatusF: StringNullable;
      const ALoteFat: IntegerNullable;
      const AIdAjuste: IntegerNullable;
      const AVicmdeson: DoubleNullable;
      const AFinalidadeid: IntegerNullable;
      const ATipoSeguro: StringNullable;
      const ATipoOutdesp: StringNullable;
      const ATipoFrete: StringNullable;
      const AClGerarPontos: StringNullable;
      const ATotaisComDeson: StringNullable;
      const AImportXml: StringNullable;
      const AEfdrestcomplicmsId: IntegerNullable;
      const AIndintermed: StringNullable;
      const AInfintermedCnpj: StringNullable;
      const AInfintermedIdcadinttran: StringNullable;
      const AConfBc: StringNullable;
      const AVpisdeson: DoubleNullable;
      const AVcofinsdeson: DoubleNullable;
      const AConfIsuf: StringNullable;
      const ACompraXnemp: StringNullable;
      const ACompraXped: StringNullable;
      const ACompraXcont: StringNullable;
      const ATipoDesppf: StringNullable;
      const AVretcofins: DoubleNullable;
      const AVretpis: DoubleNullable;
      const AVretcsll: DoubleNullable;
      const AVbcretprev: DoubleNullable;
      const AVretprev: DoubleNullable;
      const AQbcmono: DoubleNullable;
      const AVicmsmono: DoubleNullable;
      const AQbcmonoreten: DoubleNullable;
      const AVicmsmonoreten: DoubleNullable;
      const AQbcmonoret: DoubleNullable;
      const AVicmsmonoret: DoubleNullable;
      const AGuidt: StringNullable;
      const ARetFed: IntegerNullable;
      const ACodCliPed: IntegerNullable;
      const ADpreventrega: DateTimeNullable;
      const ACmunfg: IntegerNullable;
      const ACmunfgibs: IntegerNullable;
      const ATpnfdebito: IntegerNullable;
      const ATpnfcredito: IntegerNullable;
      const AVnftot: CurrencyNullable;
      const AVbcibscbs: CurrencyNullable;
      const AIbsufVdif: CurrencyNullable;
      const AIbsufVdevtrib: CurrencyNullable;
      const AVibsuf: CurrencyNullable;
      const AIbsmunVdif: CurrencyNullable;
      const AIbsmunVdevtrib: CurrencyNullable;
      const AVibsmun: CurrencyNullable;
      const AVibs: CurrencyNullable;
      const AIbsVcredpres: CurrencyNullable;
      const AIbsVcredprescondsus: CurrencyNullable;
      const ACbsVdif: CurrencyNullable;
      const ACbsVdevtrib: CurrencyNullable;
      const AVcbs: CurrencyNullable;
      const ACbsVcredpres: CurrencyNullable;
      const ACbsVcredprescondsus: CurrencyNullable;
      const AVibsmono: CurrencyNullable;
      const AVcbsmono: CurrencyNullable;
      const AVibsmonoreten: CurrencyNullable;
      const AVcbsmonoreten: CurrencyNullable;
      const AVibsmonoret: CurrencyNullable;
      const AVcbsmonoret: CurrencyNullable;
      const AVibsestcred: CurrencyNullable;
      const AVcbsestcred: CurrencyNullable;
      const AVis: CurrencyNullable;
      const AOpInternaId: StringNullable;
      const ADfeTribIgnorar: IntegerNullable;
      const ARedbenefpcCalc: IntegerNullable;
      const ATpimp: IntegerNullable
);
begin
  Create();
  FCodNf := ACodNf;
  FCodEmpresa := ACodEmpresa;
  FNaturezaNf := ANaturezaNf;
  FTipoNf := ATipoNf;
  FNumNf := ANumNf;
  FSerie := ASerie;
  FCodigoNop := ACodigoNop;
  FDescNatop := ADescNatop;
  FCodigoTr := ACodigoTr;
  FCodCliente := ACodCliente;
  FCodCondPag := ACodCondPag;
  FCodVendedor := ACodVendedor;
  FNumNfem := ANumNfem;
  FDataContabil := ADataContabil;
  FDataLanc := ADataLanc;
  FDataEntSaida := ADataEntSaida;
  FHoraEntSaida := AHoraEntSaida;
  FValorTotal := AValorTotal;
  FValorProd := AValorProd;
  FValorServ := AValorServ;
  FAliqIcm := AAliqIcm;
  FBaseIcm := ABaseIcm;
  FValorIcm := AValorIcm;
  FValorDesc := AValorDesc;
  FValorDescP := AValorDescP;
  FValorDescS := AValorDescS;
  FAliqIrrf := AAliqIrrf;
  FAliqIss := AAliqIss;
  FBaseIss := ABaseIss;
  FValorIss := AValorIss;
  FBaseIcmsub := ABaseIcmsub;
  FValorIcmsub := AValorIcmsub;
  FBaseIpi := ABaseIpi;
  FValorIpi := AValorIpi;
  FValorFrete := AValorFrete;
  FValorSeguro := AValorSeguro;
  FValorOutDesp := AValorOutDesp;
  FValorDespPf := AValorDespPf;
  FValorAcresFin := AValorAcresFin;
  FValorPis := AValorPis;
  FValorPisSt := AValorPisSt;
  FValorCofins := AValorCofins;
  FValorCofinsSt := AValorCofinsSt;
  FBaseIrrf := ABaseIrrf;
  FValorIrrf := AValorIrrf;
  FStatus := AStatus;
  FObs := AObs;
  FFreteBaseIpi := AFreteBaseIpi;
  FFreteFNfe := AFreteFNfe;
  FFreteBaseIcm := AFreteBaseIcm;
  FFretecontaTr := AFretecontaTr;
  FPlacaTr := APlacaTr;
  FUfPlacaTr := AUfPlacaTr;
  FQtdeVolumesTr := AQtdeVolumesTr;
  FEspecieTr := AEspecieTr;
  FMarcaTr := AMarcaTr;
  FNumeroTr := ANumeroTr;
  FCrt := ACrt;
  FResultadoEnvio := AResultadoEnvio;
  FDataAutorizacao := ADataAutorizacao;
  FSituacaoNfe := ASituacaoNfe;
  FDigest := ADigest;
  FProtocolo := AProtocolo;
  FCodigoerro := ACodigoerro;
  FDescricaoerro := ADescricaoerro;
  FTemporesposta := ATemporesposta;
  FHoraEnvio := AHoraEnvio;
  FTiponfe := ATiponfe;
  FDanfeimpresso := ADanfeimpresso;
  FDatahoraEnvio := ADatahoraEnvio;
  FChaveNfe := AChaveNfe;
  FSelNfe := ASelNfe;
  FNFormSeguranca := ANFormSeguranca;
  FNumNfVndant := ANumNfVndant;
  FSubSerieant := ASubSerieant;
  FJustCancelamento := AJustCancelamento;
  FModeloNf := AModeloNf;
  FSubserie := ASubserie;
  FComProd := AComProd;
  FComServ := AComServ;
  FInutilnfant := AInutilnfant;
  FEmissaoPropria := AEmissaoPropria;
  FNumPed := ANumPed;
  FAntecTrib := AAntecTrib;
  FDevolucao := ADevolucao;
  FBenefFiscal := ABenefFiscal;
  FConfEnt := AConfEnt;
  FTpNf := ATpNf;
  FDa := ADa;
  FMnf := AMnf;
  FCodUsuario := ACodUsuario;
  FExtemporaneo := AExtemporaneo;
  FTipoEmissao := ATipoEmissao;
  FNumNfEmt := ANumNfEmt;
  FSerieEmt := ASerieEmt;
  FCodNfRef := ACodNfRef;
  FNumNfCompl := ANumNfCompl;
  FSerieCompl := ASerieCompl;
  FTipoDesconto := ATipoDesconto;
  FPesoB := APesoB;
  FPesoL := APesoL;
  FNComando := ANComando;
  FAtivo := AAtivo;
  FCodCons := ACodCons;
  FVlForn := AVlForn;
  FVlTerc := AVlTerc;
  FTpLigacao := ATpLigacao;
  FCodGrupoTensao := ACodGrupoTensao;
  FCstDespesa := ACstDespesa;
  FVlServ := AVlServ;
  FVlServNt := AVlServNt;
  FTpAssinante := ATpAssinante;
  FDadosInteresseFisco := ADadosInteresseFisco;
  FDadosLancamentoFiscal := ADadosLancamentoFiscal;
  FNfeCmsg := ANfeCmsg;
  FNfeXmsg := ANfeXmsg;
  FNfeDhcont := ANfeDhcont;
  FNfeXjust := ANfeXjust;
  FNfeDpecCstat := ANfeDpecCstat;
  FNfeDpecXmotivo := ANfeDpecXmotivo;
  FNfeDpecNregdpec := ANfeDpecNregdpec;
  FAliqIcmSimples := AAliqIcmSimples;
  FBaseIcmSimples := ABaseIcmSimples;
  FValorIcmSimples := AValorIcmSimples;
  FInscricaoSubstituto := AInscricaoSubstituto;
  FCnaeFiscal := ACnaeFiscal;
  FImEmp := AImEmp;
  FNumGerado := ANumGerado;
  FNCaixa := ANCaixa;
  FInfCorpoV := AInfCorpoV;
  FNped := ANped;
  FTipoPed := ATipoPed;
  FLoteNfe := ALoteNfe;
  FIpiBaseIcm := AIpiBaseIcm;
  FConfPiscofins := AConfPiscofins;
  FComplementarEnt := AComplementarEnt;
  FTemPiscofinsSt := ATemPiscofinsSt;
  FAddPiscofinsStTotalnf := AAddPiscofinsStTotalnf;
  FValorIi := AValorIi;
  FPathXmlImport := APathXmlImport;
  FCodCarga := ACodCarga;
  FCodDevolucao := ACodDevolucao;
  FCodNfRemVfe := ACodNfRemVfe;
  FNfeRecibo := ANfeRecibo;
  FStatNferecibo := AStatNferecibo;
  FUfembarq := AUfembarq;
  FXlocembarq := AXlocembarq;
  FSemSerie := ASemSerie;
  FConsumidorFinal := AConsumidorFinal;
  FVerificarMudCfop := AVerificarMudCfop;
  FVtottrib := AVtottrib;
  FCodNfTransf := ACodNfTransf;
  FCodEmpTransf := ACodEmpTransf;
  FDupXmlEntrada := ADupXmlEntrada;
  FCodProducaoMp := ACodProducaoMp;
  FSomenserv := ASomenserv;
  FModDesBh := AModDesBh;
  FChaveNfse := AChaveNfse;
  FMotivoNaoRetencao := AMotivoNaoRetencao;
  FTipoRecIssqn := ATipoRecIssqn;
  FLocalIncidencia := ALocalIncidencia;
  FIdModelo21 := AIdModelo21;
  FLoteConferencia := ALoteConferencia;
  FHoraEmissao := AHoraEmissao;
  FNfeIndpres := ANfeIndpres;
  FNfeIddest := ANfeIddest;
  FXlocdespacho := AXlocdespacho;
  FDataEstoque := ADataEstoque;
  FVfcpufdest := AVfcpufdest;
  FVicmsufdest := AVicmsufdest;
  FVicmsufremet := AVicmsufremet;
  FNfeIndiedest := ANfeIndiedest;
  FXmlNfe := AXmlNfe;
  FCnfe := ACnfe;
  FFcpVfcp := AFcpVfcp;
  FFcpVfcpst := AFcpVfcpst;
  FFcpVfcpstret := AFcpVfcpstret;
  FIpiVipidevol := AIpiVipidevol;
  FNomeCliente := ANomeCliente;
  FRazao := ARazao;
  FCpfcgc := ACpfcgc;
  FDestIdestrangeiro := ADestIdestrangeiro;
  FDestIsuf := ADestIsuf;
  FDestIm := ADestIm;
  FDestEmail := ADestEmail;
  FDestXlgr := ADestXlgr;
  FDestNro := ADestNro;
  FDestXcpl := ADestXcpl;
  FDestXbairro := ADestXbairro;
  FDestCmun := ADestCmun;
  FDestXmun := ADestXmun;
  FDestUf := ADestUf;
  FDestCep := ADestCep;
  FDestCpais := ADestCpais;
  FDestXpais := ADestXpais;
  FDestFone := ADestFone;
  FInscEst := AInscEst;
  FDestSeqid := ADestSeqid;
  FPagVtroco := APagVtroco;
  FFatNfat := AFatNfat;
  FFatVorig := AFatVorig;
  FFatVdesc := AFatVdesc;
  FFatVliq := AFatVliq;
  FNfeVersao := ANfeVersao;
  FNfeTpemis := ANfeTpemis;
  FNfeTpamb := ANfeTpamb;
  FTrRntc := ATrRntc;
  FNfeCstat := ANfeCstat;
  FObsBol1 := AObsBol1;
  FClClultimacompra := AClClultimacompra;
  FClStatusF := AClStatusF;
  FLoteFat := ALoteFat;
  FIdAjuste := AIdAjuste;
  FVicmdeson := AVicmdeson;
  FFinalidadeid := AFinalidadeid;
  FTipoSeguro := ATipoSeguro;
  FTipoOutdesp := ATipoOutdesp;
  FTipoFrete := ATipoFrete;
  FClGerarPontos := AClGerarPontos;
  FTotaisComDeson := ATotaisComDeson;
  FImportXml := AImportXml;
  FEfdrestcomplicmsId := AEfdrestcomplicmsId;
  FIndintermed := AIndintermed;
  FInfintermedCnpj := AInfintermedCnpj;
  FInfintermedIdcadinttran := AInfintermedIdcadinttran;
  FConfBc := AConfBc;
  FVpisdeson := AVpisdeson;
  FVcofinsdeson := AVcofinsdeson;
  FConfIsuf := AConfIsuf;
  FCompraXnemp := ACompraXnemp;
  FCompraXped := ACompraXped;
  FCompraXcont := ACompraXcont;
  FTipoDesppf := ATipoDesppf;
  FVretcofins := AVretcofins;
  FVretpis := AVretpis;
  FVretcsll := AVretcsll;
  FVbcretprev := AVbcretprev;
  FVretprev := AVretprev;
  FQbcmono := AQbcmono;
  FVicmsmono := AVicmsmono;
  FQbcmonoreten := AQbcmonoreten;
  FVicmsmonoreten := AVicmsmonoreten;
  FQbcmonoret := AQbcmonoret;
  FVicmsmonoret := AVicmsmonoret;
  FGuidt := AGuidt;
  FRetFed := ARetFed;
  FCodCliPed := ACodCliPed;
  FDpreventrega := ADpreventrega;
  FCmunfg := ACmunfg;
  FCmunfgibs := ACmunfgibs;
  FTpnfdebito := ATpnfdebito;
  FTpnfcredito := ATpnfcredito;
  FVnftot := AVnftot;
  FVbcibscbs := AVbcibscbs;
  FIbsufVdif := AIbsufVdif;
  FIbsufVdevtrib := AIbsufVdevtrib;
  FVibsuf := AVibsuf;
  FIbsmunVdif := AIbsmunVdif;
  FIbsmunVdevtrib := AIbsmunVdevtrib;
  FVibsmun := AVibsmun;
  FVibs := AVibs;
  FIbsVcredpres := AIbsVcredpres;
  FIbsVcredprescondsus := AIbsVcredprescondsus;
  FCbsVdif := ACbsVdif;
  FCbsVdevtrib := ACbsVdevtrib;
  FVcbs := AVcbs;
  FCbsVcredpres := ACbsVcredpres;
  FCbsVcredprescondsus := ACbsVcredprescondsus;
  FVibsmono := AVibsmono;
  FVcbsmono := AVcbsmono;
  FVibsmonoreten := AVibsmonoreten;
  FVcbsmonoreten := AVcbsmonoreten;
  FVibsmonoret := AVibsmonoret;
  FVcbsmonoret := AVcbsmonoret;
  FVibsestcred := AVibsestcred;
  FVcbsestcred := AVcbsestcred;
  FVis := AVis;
  FOpInternaId := AOpInternaId;
  FDfeTribIgnorar := ADfeTribIgnorar;
  FRedbenefpcCalc := ARedbenefpcCalc;
  FTpimp := ATpimp;
end;

function NotaFiscalEtd.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NotaFiscalEtd.Create(
      FCodNf,
      FCodEmpresa,
      FNaturezaNf,
      FTipoNf,
      FNumNf,
      FSerie,
      FCodigoNop,
      FDescNatop,
      FCodigoTr,
      FCodCliente,
      FCodCondPag,
      FCodVendedor,
      FNumNfem,
      FDataContabil,
      FDataLanc,
      FDataEntSaida,
      FHoraEntSaida,
      FValorTotal,
      FValorProd,
      FValorServ,
      FAliqIcm,
      FBaseIcm,
      FValorIcm,
      FValorDesc,
      FValorDescP,
      FValorDescS,
      FAliqIrrf,
      FAliqIss,
      FBaseIss,
      FValorIss,
      FBaseIcmsub,
      FValorIcmsub,
      FBaseIpi,
      FValorIpi,
      FValorFrete,
      FValorSeguro,
      FValorOutDesp,
      FValorDespPf,
      FValorAcresFin,
      FValorPis,
      FValorPisSt,
      FValorCofins,
      FValorCofinsSt,
      FBaseIrrf,
      FValorIrrf,
      FStatus,
      FObs,
      FFreteBaseIpi,
      FFreteFNfe,
      FFreteBaseIcm,
      FFretecontaTr,
      FPlacaTr,
      FUfPlacaTr,
      FQtdeVolumesTr,
      FEspecieTr,
      FMarcaTr,
      FNumeroTr,
      FCrt,
      FResultadoEnvio,
      FDataAutorizacao,
      FSituacaoNfe,
      FDigest,
      FProtocolo,
      FCodigoerro,
      FDescricaoerro,
      FTemporesposta,
      FHoraEnvio,
      FTiponfe,
      FDanfeimpresso,
      FDatahoraEnvio,
      FChaveNfe,
      FSelNfe,
      FNFormSeguranca,
      FNumNfVndant,
      FSubSerieant,
      FJustCancelamento,
      FModeloNf,
      FSubserie,
      FComProd,
      FComServ,
      FInutilnfant,
      FEmissaoPropria,
      FNumPed,
      FAntecTrib,
      FDevolucao,
      FBenefFiscal,
      FConfEnt,
      FTpNf,
      FDa,
      FMnf,
      FCodUsuario,
      FExtemporaneo,
      FTipoEmissao,
      FNumNfEmt,
      FSerieEmt,
      FCodNfRef,
      FNumNfCompl,
      FSerieCompl,
      FTipoDesconto,
      FPesoB,
      FPesoL,
      FNComando,
      FAtivo,
      FCodCons,
      FVlForn,
      FVlTerc,
      FTpLigacao,
      FCodGrupoTensao,
      FCstDespesa,
      FVlServ,
      FVlServNt,
      FTpAssinante,
      FDadosInteresseFisco,
      FDadosLancamentoFiscal,
      FNfeCmsg,
      FNfeXmsg,
      FNfeDhcont,
      FNfeXjust,
      FNfeDpecCstat,
      FNfeDpecXmotivo,
      FNfeDpecNregdpec,
      FAliqIcmSimples,
      FBaseIcmSimples,
      FValorIcmSimples,
      FInscricaoSubstituto,
      FCnaeFiscal,
      FImEmp,
      FNumGerado,
      FNCaixa,
      FInfCorpoV,
      FNped,
      FTipoPed,
      FLoteNfe,
      FIpiBaseIcm,
      FConfPiscofins,
      FComplementarEnt,
      FTemPiscofinsSt,
      FAddPiscofinsStTotalnf,
      FValorIi,
      FPathXmlImport,
      FCodCarga,
      FCodDevolucao,
      FCodNfRemVfe,
      FNfeRecibo,
      FStatNferecibo,
      FUfembarq,
      FXlocembarq,
      FSemSerie,
      FConsumidorFinal,
      FVerificarMudCfop,
      FVtottrib,
      FCodNfTransf,
      FCodEmpTransf,
      FDupXmlEntrada,
      FCodProducaoMp,
      FSomenserv,
      FModDesBh,
      FChaveNfse,
      FMotivoNaoRetencao,
      FTipoRecIssqn,
      FLocalIncidencia,
      FIdModelo21,
      FLoteConferencia,
      FHoraEmissao,
      FNfeIndpres,
      FNfeIddest,
      FXlocdespacho,
      FDataEstoque,
      FVfcpufdest,
      FVicmsufdest,
      FVicmsufremet,
      FNfeIndiedest,
      FXmlNfe,
      FCnfe,
      FFcpVfcp,
      FFcpVfcpst,
      FFcpVfcpstret,
      FIpiVipidevol,
      FNomeCliente,
      FRazao,
      FCpfcgc,
      FDestIdestrangeiro,
      FDestIsuf,
      FDestIm,
      FDestEmail,
      FDestXlgr,
      FDestNro,
      FDestXcpl,
      FDestXbairro,
      FDestCmun,
      FDestXmun,
      FDestUf,
      FDestCep,
      FDestCpais,
      FDestXpais,
      FDestFone,
      FInscEst,
      FDestSeqid,
      FPagVtroco,
      FFatNfat,
      FFatVorig,
      FFatVdesc,
      FFatVliq,
      FNfeVersao,
      FNfeTpemis,
      FNfeTpamb,
      FTrRntc,
      FNfeCstat,
      FObsBol1,
      FClClultimacompra,
      FClStatusF,
      FLoteFat,
      FIdAjuste,
      FVicmdeson,
      FFinalidadeid,
      FTipoSeguro,
      FTipoOutdesp,
      FTipoFrete,
      FClGerarPontos,
      FTotaisComDeson,
      FImportXml,
      FEfdrestcomplicmsId,
      FIndintermed,
      FInfintermedCnpj,
      FInfintermedIdcadinttran,
      FConfBc,
      FVpisdeson,
      FVcofinsdeson,
      FConfIsuf,
      FCompraXnemp,
      FCompraXped,
      FCompraXcont,
      FTipoDesppf,
      FVretcofins,
      FVretpis,
      FVretcsll,
      FVbcretprev,
      FVretprev,
      FQbcmono,
      FVicmsmono,
      FQbcmonoreten,
      FVicmsmonoreten,
      FQbcmonoret,
      FVicmsmonoret,
      FGuidt,
      FRetFed,
      FCodCliPed,
      FDpreventrega,
      FCmunfg,
      FCmunfgibs,
      FTpnfdebito,
      FTpnfcredito,
      FVnftot,
      FVbcibscbs,
      FIbsufVdif,
      FIbsufVdevtrib,
      FVibsuf,
      FIbsmunVdif,
      FIbsmunVdevtrib,
      FVibsmun,
      FVibs,
      FIbsVcredpres,
      FIbsVcredprescondsus,
      FCbsVdif,
      FCbsVdevtrib,
      FVcbs,
      FCbsVcredpres,
      FCbsVcredprescondsus,
      FVibsmono,
      FVcbsmono,
      FVibsmonoreten,
      FVcbsmonoreten,
      FVibsmonoret,
      FVcbsmonoret,
      FVibsestcred,
      FVcbsestcred,
      FVis,
      FOpInternaId,
      FDfeTribIgnorar,
      FRedbenefpcCalc,
      FTpimp
    );
end;

{ NotaFiscalEtdList }

function NotaFiscalEtdList.GetItem(Index: Integer): NotaFiscalEtd;
begin
  Result := NotaFiscalEtd(inherited Items[Index]);
end;

procedure NotaFiscalEtdList.SetItem(Index: Integer; const Value: NotaFiscalEtd);
begin
  Put(Index, Value);
end;

end.