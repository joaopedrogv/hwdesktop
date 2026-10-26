unit NFSeTypesUnit;

interface

type
  EmitenteDPSEnum = ( edpsNaoDefinido, edpsPrestador, edpsTomador, edpsIntermediario);
  OptanteSNEnum = (osnNaoDefinido, osnNaoOptante, osnOptanteMEI, osnOptanteMEEPP);
  RegimeApuracaoSNEnum = (raNaoDefinido, raFederaisMunicipalpeloSN, raFederaisSN, raFederaisMunicipalforaSN);
  TributacaoISSQNEnum = (tiNaoDefinido, tiOperacaoTributavel, tiImunidade, tiExportacao, tiNaoIncidencia);
  TipoRetencaoISSQNEnum = (trNaoDefinido, trNaoRetido, trRetidoPeloTomador, trRetidoPeloIntermediario);
  TipoRetencaoPisCofinsEnum = (
    trpiscofinscsllNaoRetido, trpcRetido, trpcNaoRetido, trpiscofinscsllRetido, trpiscofinsRetidocsllNaoRetido,
    trPisRetidoCofinsCsllNaoRetido, trCofinsRetidoPisCsllNaoRetido, trCofinsCsllRetidoPisNaoRetido,
    trCsllRetidoPisCofinsNaoRetido, trPisCsllRetidoCofinsNaoRetido
  );
  MotivoSubstituicaoEnum = (mstNaoDefinido, mstDesenquadramento, mstEnquadramento, mstInclusao, mstExclusao,
                            mstRejeicao, mstOutros);
  TipoOperEnteGovEnum = (togNaoDefinido, togFornecimento, togRecebimentoPag, togFornecimentoRealizado,
                         togRecebimentoPagPosterior, togFornecimentoRecebimento);
  TipoDocNFSeEnum = (tdocNaoDefinido, tdocXmlDPSEnvio, tdocTextDPSRejeicao, tdocXmlAutorizacao, tdocXmlCancEnvio,
                     tdocXmlCancAutorizacao );
  TipoPartDpesEnum = (tprtNaoDefinido, tprtPrestador, tprtTomador, tprtIntermediario, tprtDestIbsCbs );
  TipoRetencaoFederalPart = (trfSemRetencao, trfComIR, trfComPisCofinsCSLL, trfComIrPisCofinsCSLL);
  SituacaoNFSeEnum = (sdpsExcluido, sdpsRascunho, sdpsRejeicao, sdpsEmissao, sdpsEmProcessamento,
                     sdpsAutorizada, sdpsCancelada, sdpsSubstituida );
  NaturezaEmissaoNFSeEnum = (nemtPrestadorWS, nemtPrestadorPortal, nemtTomadorTerceiros);
  OrigemRegistroNFSeEnum = (orAvulso, orOrdemServico );
  LayoutNFSeEnum = (lytPrefeitura, lytNacionalSemIbsCbs, lytNacionalComIbsCbs);
  TipoHistoricoNFSeEnum = (thAlteracaoStatus, thRejeicao, thEvento, thEmailEnviado, thLogHistorico );
  TipoEventoNFSeEnum = (tenCancelamento);
  OrigemCancelamentoNFSeEnum = ( ocnNaoDefinido, ocnWebService, ocnPortalWebSite );
  MotivoCancelamentoNFSeEnum = ( mcnErroEmissao, mcnServNaoPrestado, mcnRpsCanelado, mcnOutros );

  TipoDocNFSeEnumSet =  set of TipoDocNFSeEnum;


implementation

end.
