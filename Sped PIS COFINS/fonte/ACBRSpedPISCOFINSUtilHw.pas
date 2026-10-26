unit ACBRSpedPISCOFINSUtilHw;

interface

uses ACBrEPCBlocos;

function _StrToEmitentePC(str: string): ACBrEPCBlocos.TACBrEmitente;
//function _StrToTipoTitulo(str: string): TACBrTipoTitulo;
//function _StrToTipoTransporte(str: string): TACBrTipoTransporte;
function _StrToOrigemProcessoPC(str: string): ACBrEPCBlocos.TACBrOrigemProcesso;
//function _StrToTipoOperacaoF(str: string): ACBrEFDBlocos.TACBrTipoOperacao;
function _StrToTipoOperacaoPC(str: string): ACBrEPCBlocos.TACBrTipoOperacao;
function _StrToMovimentacaoFisicaPC(str: string): ACBrEPCBlocos.TACBrMovimentacaoFisica;
function _StrToApuracaoIPIPC(str: string): ACBrEPCBlocos.TACBrApuracaoIPI;
//function _StrToTipoItemF(str: string): ACBrEFDBlocos.TACBrTipoItem;
function _StrToTipoItemPC(str: string): ACBrEPCBlocos.TACBrTipoItem;
//function _StrToTipoOperacaoVeiculo(str: string): TACBrTipoOperacaoVeiculo;
//function _StrToClasseConsumo(str: string): TACBrClasseConsumo;
function _StrToTipoFretePC(str: string): ACBrEPCBlocos.TACBrTipoFrete;
//function _StrToMovimentoBens(str: string): TACBrMovimentoBens;
function _StrToIndicadorSituacaoEspecial(str: string): TACBrIndicadorSituacaoEspecial;
function _StrToIndicadorNaturezaPJ(str: string): TACBrIndicadorNaturezaPJ;
function _StrToIndicadorAtividade(str: string): TACBrIndicadorAtividade;
function _StrToCodIndIncTributaria(str: string): TACBrCodIndIncTributaria;
function _StrToIndAproCred(str: string): TACBrIndAproCred;
function _StrToCodIndTipoCon(str: string): TACBrCodIndTipoCon;
function _StrToNaturezaConta(str: string): TACBrNaturezaConta;
function _StrToIndCTA(str: string): TACBrIndCTA;
function _StrToIndicadorTpOperacao(str: string): TACBrIndicadorTpOperacao;
function _StrToIndicadorEmitenteDF(str: string): TACBrIndicadorEmitenteDF;
function _StrToSituacaoDF(str: string): TACBrSituacaoDF;
function _StrToSituacaoF(str: string): TACBrCodSitF;
function _StrToBaseCalculoCredito(str: string): TACBrBaseCalculoCredito;
function _StrToOrigemCredito(str: string): TACBrOrigemCredito;
function _StrToSituacaoTribPIS(str: string): TACBrSituacaoTribPIS;
function _StrToSituacaoTribCOFINS(str: string): TACBrSituacaoTribCOFINS;
function _StrToSituacaoTribICMS(str: string): TACBrSituacaoTribICMS;
function _StrToSituacaoTribIPI(str: string): TACBrSituacaoTribIPI;
function _StrToNaturezaFrtContratado(str: string): TACBrNaturezaFrtContratado;
function _StrToIndTpOperacaoReceita(str: string): TACBrIndTpOperacaoReceita;
function _StrToCodCont(str: string): TACBrCodCont;
function _StrToCodIndCritEscrit(str: string) : TACBrCodIndCritEscrit;
function _StrToIndicadorDaComposicaoDaReceitaRecebida(str: string): TACBrIndicadorDaComposicaoDaReceitaRecebida;

implementation

function _StrToEmitentePC(str: string): ACBrEPCBlocos.TACBrEmitente;
begin
  if str = '0' then
    Result := ACBrEPCBlocos.edEmissaoPropria
  else
    Result := ACBrEPCBlocos.edTerceiros;
end;

//function _StrToTipoTitulo(str: string): TACBrTipoTitulo;
//begin
//  if str = '00' then
//    Result := tcDuplicata
//  else if str = '01' then
//    Result := tcCheque
//  else if str = '02' then
//    Result := tcPromissoria
//  else if str = '03' then
//    Result := tcRecibo
//  else
//    Result := tcOutros;
//end;

//function _StrToTipoTransporte(str: string): TACBrTipoTransporte;
//begin
//  if str = '0' then result := ttRodoviario // 0 – Rodoviário
//  else if str = '1' then result := ttFerroviario // 1 – Ferroviário
//  else if str = '2' then result := ttRodoFerroviario // 2 – Rodo-Ferroviário
//  else if str = '3' then result := ttAquaviario // 3 – Aquaviário
//  else if str = '4' then result := ttDutoviario // 4 – Dutoviário
//  else if str = '5' then result := ttAereo // 5 – Aéreo
//  else result := ttOutros // 9 – Outros
//end;

function _StrToOrigemProcessoPC(str: string): ACBrEPCBlocos.TACBrOrigemProcesso;
begin
  if str = '1' then Result := ACBrEPCBlocos.opJusticaFederal // 1 - Justiça Federal
  else if str = '3' then Result := ACBrEPCBlocos.opSecexRFB // 3 - Secex/RFB
  else if str = '9' then Result := ACBrEPCBlocos.opOutros // 9 - Outros
  else Result := ACBrEPCBlocos.opNenhum; // Preencher vazio
end;

function _StrToTipoOperacaoPC(str: string): ACBrEPCBlocos.TACBrTipoOperacao;
begin
  if str = '0' then Result := ACBrEPCBlocos.tpEntradaAquisicao // 0 - Entrada
  else Result := ACBrEPCBlocos.tpSaidaPrestacao; // 1 - Saída
end;

function _StrToMovimentacaoFisicaPC(str: string): ACBrEPCBlocos.TACBrMovimentacaoFisica;
begin
  if str = '0' then result := ACBrEPCBlocos.mfSim // 0 - Sim
  else result := ACBrEPCBlocos.mfNao; // 1 - Não
end;

function _StrToApuracaoIPIPC(str: string): ACBrEPCBlocos.TACBrApuracaoIPI;
begin
  if str = '0' then Result := ACBrEPCBlocos.iaMensal         // 0 - Mensal
  else if str = '1' then Result := ACBrEPCBlocos.iaDecendial // 1 - Decendial
  else Result := ACBrEPCBlocos.iaVazio;
end;

//function _StrToTipoItemF(str: string): ACBrEFDBlocos.TACBrTipoItem;
//begin
//  if str = '00' then Result := ACBrEFDBlocos.tiMercadoriaRevenda // 00 – Mercadoria para Revenda
//  else if str = '01' then Result := ACBrEFDBlocos.tiMateriaPrima // 01 – Matéria-Prima;
//  else if str = '02' then Result := ACBrEFDBlocos.tiEmbalagem // 02 – Embalagem;
//  else if str = '03' then Result := ACBrEFDBlocos.tiProdutoProcesso // 03 – Produto em Processo;
//  else if str = '04' then Result := ACBrEFDBlocos.tiProdutoAcabado // 04 – Produto Acabado;
//  else if str = '05' then Result := ACBrEFDBlocos.tiSubproduto // 05 – Subproduto;
//  else if str = '06' then Result := ACBrEFDBlocos.tiProdutoIntermediario // 06 – Produto Intermediário;
//  else if str = '07' then Result := ACBrEFDBlocos.tiMaterialConsumo // 07 – Material de Uso e Consumo;
//  else if str = '08' then Result := ACBrEFDBlocos.tiAtivoImobilizado // 08 – Ativo Imobilizado;
//  else if str = '09' then Result := ACBrEFDBlocos.tiServicos // 09 – Serviços;
//  else if str = '10' then Result := ACBrEFDBlocos.tiOutrosInsumos // 10 – Outros Insumos;
//  else Result := ACBrEFDBlocos.tiOutras; // 99 – Outras
//end;

function _StrToTipoItemPC(str: string): ACBrEPCBlocos.TACBrTipoItem;
begin
  if str = '00' then Result := ACBrEPCBlocos.tiMercadoriaRevenda // 00 – Mercadoria para Revenda
  else if str = '01' then Result := ACBrEPCBlocos.tiMateriaPrima // 01 – Matéria-Prima;
  else if str = '02' then Result := ACBrEPCBlocos.tiEmbalagem // 02 – Embalagem;
  else if str = '03' then Result := ACBrEPCBlocos.tiProdutoProcesso // 03 – Produto em Processo;
  else if str = '04' then Result := ACBrEPCBlocos.tiProdutoAcabado // 04 – Produto Acabado;
  else if str = '05' then Result := ACBrEPCBlocos.tiSubproduto // 05 – Subproduto;
  else if str = '06' then Result := ACBrEPCBlocos.tiProdutoIntermediario // 06 – Produto Intermediário;
  else if str = '07' then Result := ACBrEPCBlocos.tiMaterialConsumo // 07 – Material de Uso e Consumo;
  else if str = '08' then Result := ACBrEPCBlocos.tiAtivoImobilizado // 08 – Ativo Imobilizado;
  else if str = '09' then Result := ACBrEPCBlocos.tiServicos // 09 – Serviços;
  else if str = '10' then Result := ACBrEPCBlocos.tiOutrosInsumos // 10 – Outros Insumos;
  else Result := ACBrEPCBlocos.tiOutras; // 99 – Outras
end;

//function _StrToTipoOperacaoVeiculo(str: string): TACBrTipoOperacaoVeiculo;
//begin
//  if str = '0' then Result := tovVendaPConcess // 0 - Venda para concessionária
//  else if str = '1' then Result := tovFaturaDireta // 1 - Faturamento direto
//  else if str = '2' then Result := tovVendaDireta // 2 - Venda direta
//  else if str = '3' then Result := tovVendaDConcess // 3 - Venda da concessionária
//  else Result := tovVendaOutros; // 9 - Outros
//end;

//function _StrToClasseConsumo(str: string): TACBrClasseConsumo;
//begin
//  if str = '01' then Result := ccComercial // 01 - Comercial
//  else if str = '02' then Result := ccConsumoProprio // 02 - Consumo Próprio
//  else if str = '03' then Result := ccIluminacaoPublica // 03 - Iluminação Pública
//  else if str = '04' then Result := ccIndustrial // 04 - Industrial
//  else if str = '05' then Result := ccPoderPublico // 05 - Poder Público
//  else if str = '06' then Result := ccResidencial // 06 - Residencial
//  else if str = '07' then Result := ccRural // 07 - Rural
//  else if str = '08' then Result := ccServicoPublico // 08 -Serviço Público
//  else Result := ccComercial;
//end;

function _StrToTipoFretePC(str: string): ACBrEPCBlocos.TACBrTipoFrete;
begin
  if str = '0' then Result := ACBrEPCBlocos.tfPorContaTerceiros // 0 - Por conta de terceiros
  else if str = '1' then Result := ACBrEPCBlocos.tfPorContaEmitente // 1 - Por conta do emitente
  else if str = '2' then Result := ACBrEPCBlocos.tfPorContaDestinatario // 2 - Por conta do destinatário
  else if str = '9' then Result := ACBrEPCBlocos.tfSemCobrancaFrete // 9 - Sem cobrança de frete
  else Result := ACBrEPCBlocos.tfNenhum // Preencher vazio
end;

//function _StrToMovimentoBens(str: string): TACBrMovimentoBens;
//begin
//  if str = 'SI' then Result := mbcSI // SI = Saldo inicial de bens imobilizados
//  else if str = 'IM' then Result := mbcIM // IM = Imobilização de bem individual
//  else if str = 'IA' then Result := mbcIA // IA = Imobilização em Andamento - Componente
//  else if str = 'CI' then Result := mbcCI // CI = Conclusão de Imobilização em Andamento – Bem Resultante
//  else if str = 'MC' then Result := mbcMC // MC = Imobilização oriunda do Ativo Circulante
//  else if str = 'BA' then Result := mbcBA // BA = Baixa do Saldo de ICMS - Fim do período de apropriação
//  else if str = 'AT' then Result := mbcAT // AT = Alienação ou Transferência
//  else if str = 'PE' then Result := mbcPE // PE = Perecimento, Extravio ou Deterioração
//  else if str = 'OT' then Result := mbcOT // OT = Outras Saídas do Imobilizado
//end;

function _StrToIndicadorSituacaoEspecial(str: string): TACBrIndicadorSituacaoEspecial;
begin
  if str = '0' then Result := indSitAbertura           // 0 - Abertura
  else if str = '1' then Result := indSitCisao         // 1 - Cisão
  else if str = '2' then Result := indSitFusao         // 2 - Fusão
  else if str = '3' then Result := indSitIncorporacao  // 3 - Incorporação
  else if str = '4' then Result := indSitEncerramento; // 4 - Encerramento
end;

function _StrToIndicadorNaturezaPJ(str: string): TACBrIndicadorNaturezaPJ;
begin
  if str = '00' then Result := indNatPJSocEmpresariaGeral         // 0 - Sociedade empresária geral
  else if str = '01' then Result := indNatPJSocCooperativa        // 1 - Sociedade Cooperativa
  else if str = '02' then Result := indNatPJEntExclusivaFolhaSal; // 2 - Entidade sujeita ao PIS/Pasep exclusivamente com base  na folha de salários
end;

function _StrToIndicadorAtividade(str: string): TACBrIndicadorAtividade;
begin
  if str = '0' then Result := indAtivIndustrial            // 0 - Industrial ou equiparado a industrial
  else if str = '1' then Result := indAtivPrestadorServico // 1 - Prestador de serviços
  else if str = '2' then Result := indAtivComercio         // 2 - Atividade de comércios
  else if str = '3' then Result := indAtivoFincanceira     // 3 - Atividade Financeira
  else if str = '4' then Result := indAtivoImobiliaria     // 4 - Atividade Imobiliária
  else Result := indAtivoOutros;                            // 9 - Outros
end;

function _StrToCodIndIncTributaria(str: string): TACBrCodIndIncTributaria;
begin
  if str = '1' then Result := codEscrOpIncNaoCumulativo     // 0 - Escrituração de operações com incidencia exclusivamente no regime não cumulativo
  else if str = '2' then Result := codEscrOpIncCumulativo    // 1 - Escrituração de operações com incidencia exclusivamente no regime cumulativo
  else if str = '3' then Result := codEscrOpIncAmbos;        // 2 - Escrituração de operações com incidencia nos regimes cumulativo e não cumulativo
end;

function _StrToIndAproCred(str: string): TACBrIndAproCred;
begin
  if str = '1' then Result := indMetodoApropriacaoDireta     // 0 - Método de apropriação direta
  else if str = '2' then Result := indMetodoDeRateioProporcional; // 1 - Método de rateio proporcional(Receita Bruta);
end;

function _StrToCodIndTipoCon(str: string): TACBrCodIndTipoCon;
begin
  if str = '1' then Result := codIndTipoConExclAliqBasica  // 0 - Apuração da Contribuição Exclusivamente a Alíquota Básica
  else if str = '2' then Result := codIndTipoAliqEspecificas;    // 1 - Apuração da Contribuição a Alíquotas Específicas (Diferenciadas e/ou por Unidade de Medida de Produto)
end;

function _StrToNaturezaConta(str: string): TACBrNaturezaConta;
begin
  if str = '01' then Result := ncgAtivo               // 01 - Contas de ativo
  else if str = '02' then Result := ncgPassivo        // 02 - Contas de passivo
  else if str = '03' then Result := ncgLiquido        // 03 - Patrimônio líquido
  else if str = '04' then Result := ncgResultado      // 04 - Contas de resultado
  else if str = '05' then Result := ncgCompensacao    // 05 - Contas de compensação
  else if str = '09' then Result := ncgOutras;        // 09 - Outras
end;

function _StrToIndCTA(str: string): TACBrIndCTA;
begin
  if str = 'S' then Result := indCTASintetica  //S Sintética
  else if str = 'A' then Result := indCTAnalitica;   //A Analitica
end;

function _StrToIndicadorTpOperacao(str: string): TACBrIndicadorTpOperacao;
begin
  if str = '0' then Result := itoContratado           // 0 - Serviço Contratado pelo Estabelecimento
  else if str = '1' then Result := itoPrestado;       // 1 - Serviço Prestado pelo Estabelecimento
end;

function _StrToIndicadorEmitenteDF(str: string): TACBrIndicadorEmitenteDF;
begin
  if str = '0' then Result := iedfProprio              // 0 - Emissão própria
  else if str = '1' then Result := iedfTerceiro;       // 1 - Emissão de Terceiros
end;

function _StrToSituacaoDF(str: string): TACBrSituacaoDF;
begin
  if str = '00' then Result := sdfRegular                      // 00 – Documento regular
  else if str = '01' then Result := sdfExtRegular              // 01 - Escrituração extemporânea de documento regular
  else if str = '02' then Result := sdfCancelado               // 02 – Documento cancelado
  else if str = '03' then Result := sdfExtCancelado            // 03 Escrituração extemporânea de documento cancelado
  else if str = '04' then Result := sdfDenegado                // 04 NF-e ou CT-e – denegado
  else if str = '05' then Result := sdfInutilizado             // 05 NF-e ou CT-e - Numeração inutilizada
  else if str = '06' then Result := sdfComplementar            // 06 Documento Fiscal Complementar
  else if str = '07' then Result := sdfExtComplementar         // 07 Escrituração extemporânea de documento complementar
  else if str = '08' then Result := sdfEspecial;               // 08 Documento Fiscal emitido com base em Regime Especial ou Norma Específica
end;

function _StrToSituacaoF(str: string): TACBrCodSitF;
begin
  if str = '00' then Result := csffRegular            // 00 – Documento regular
  else if str = '02' then Result := csfCancelado           // 02 – Documento cancelado
  else if str = '99' then Result := csfOutros;              // 99 – Outros
end;

function _StrToBaseCalculoCredito(str: string): TACBrBaseCalculoCredito;
begin
  if str = '01' then Result := bccAqBensRevenda                       // '01' // Aquisição de bens para revenda
  else if str = '02' then Result := bccAqBensUtiComoInsumo            // '02' // Aquisição de bens utilizados como insumo
  else if str = '03' then Result := bccAqServUtiComoInsumo            // '03' // Aquisição de serviços utilizados como insumo
  else if str = '04' then Result := bccEnergiaEletricaTermica         // '04' // Energia elétrica e térmica  inclusive sob a forma de vapor
  else if str = '05' then Result := bccAluguelPredios                 // '05' // Aluguéis de prédios
  else if str = '06' then Result := bccAluguelMaqEquipamentos         // '06' // Aluguéis de máquinas e equipamentos
  else if str = '07' then Result := bccArmazenagemMercadoria          // '07' // Armazenagem de mercadoria e frete na operação de venda
  else if str = '08' then Result := bccConArrendamentoMercantil       // '08' // Contraprestações de arrendamento mercantil
  else if str = '09' then Result := bccMaqCredDepreciacao             // '09' // Máquinas  equipamentos e outros bens incorporados ao ativo imobilizado (crédito sobre encargos de depreciação).
  else if str = '10' then Result := bccMaqCredAquisicao               // '10' // Máquinas  equipamentos e outros bens incorporados ao ativo imobilizado (crédito com base no valor de aquisição).
  else if str = '11' then Result := bccAmortizacaoDepreciacaoImoveis  // '11' // Amortização e Depreciação de edificações e benfeitorias em imóveis
  else if str = '12' then Result := bccDevolucaoSujeita               // '12' // Devolução de Vendas Sujeitas à Incidência Não-Cumulativa
  else if str = '13' then Result := bccOutrasOpeComDirCredito         // '13' // Outras Operações com Direito a Crédito
  else if str = '14' then Result := bccAtTransporteSubcontratacao     // '14' // Atividade de Transporte de Cargas – Subcontratação
  else if str = '15' then Result := bccAtImobCustoIncorrido           // '15' // Atividade Imobiliária – Custo Incorrido de Unidade Imobiliária
  else if str = '16' then Result := bccAtImobCustoOrcado              // '16' // Atividade Imobiliária – Custo Orçado de unidade não concluída
  else if str = '17' then Result := bccAtPresServ                     // '17' // Atividade de Prestação de Serviços de Limpeza, Conservação e Manutenção – vale-transporte, vale-refeição ou vale-alimentação, fardamento ou uniforme.
  else if str = '18' then Result := bccEstoqueAberturaBens;           // '18' // Estoque de abertura de bens
end;

function _StrToOrigemCredito(str: string): TACBrOrigemCredito;
begin
  if str = '0' then Result := opcMercadoInterno      // 0 – Operação no Mercado Interno
  else if str = '1' then Result := opcImportacao;           // 1 – Operação de Importação
end;

function _StrToSituacaoTribPIS(str: string): TACBrSituacaoTribPIS;
begin
  if str = '01' then Result := stpisValorAliquotaNormal                                 // '01' // Operação Tributável com Alíquota Básica   // valor da operação alíquota normal (cumulativo/não cumulativo)).
  else if str = '02' then Result := stpisValorAliquotaDiferenciada                       // '02' // Operação Tributável com Alíquota Diferenciada // valor da operação (alíquota diferenciada)).
  else if str = '03' then Result := stpisQtdeAliquotaUnidade                             // '03' // Operação Tributável com Alíquota por Unidade de Medida de Produto // quantidade vendida x alíquota por unidade de produto).
  else if str = '04' then Result := stpisMonofaticaAliquotaZero                          // '04' // Operação Tributável Monofásica - Revenda a Alíquota Zero
  else if str = '05' then Result := stpisValorAliquotaPorST                              // '05' // Operação Tributável por Substituição Tributária
  else if str = '06' then Result := stpisAliquotaZero                                    // '06' // Operação Tributável a Alíquota Zero
  else if str = '07' then Result := stpisIsentaContribuicao                              // '07' // Operação Isenta da Contribuição
  else if str = '08' then Result := stpisSemIncidenciaContribuicao                       // '08' // Operação sem Incidência da Contribuição
  else if str = '09' then Result := stpisSuspensaoContribuicao                           // '09' // Operação com Suspensão da Contribuição
  else if str = '49' then Result := stpisOutrasOperacoesSaida                            // '49' // Outras Operações de Saída
  else if str = '50' then Result := stpisOperCredExcRecTribMercInt                       // '50' // Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno
  else if str = '51' then Result := stpisOperCredExcRecNaoTribMercInt                    // '51' // Operação com Direito a Crédito – Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno
  else if str = '52' then Result := stpisOperCredExcRecExportacao                        // '52' // Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação
  else if str = '53' then Result := stpisOperCredRecTribNaoTribMercInt                   // '53' // Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno
  else if str = '54' then Result := stpisOperCredRecTribMercIntEExportacao               // '54' // Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação
  else if str = '55' then Result := stpisOperCredRecNaoTribMercIntEExportacao            // '55' // Operação com Direito a Crédito - Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação
  else if str = '56' then Result := stpisOperCredRecTribENaoTribMercIntEExportacao       // '56' // Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno  e de Exportação
  else if str = '60' then Result := stpisCredPresAquiExcRecTribMercInt                   // '60' // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno
  else if str = '61' then Result := stpisCredPresAquiExcRecNaoTribMercInt                // '61' // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno
  else if str = '62' then Result := stpisCredPresAquiExcExcRecExportacao                 // '62' // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação
  else if str = '63' then Result := stpisCredPresAquiRecTribNaoTribMercInt               // '63' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno
  else if str = '64' then Result := stpisCredPresAquiRecTribMercIntEExportacao           // '64' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação
  else if str = '65' then Result := stpisCredPresAquiRecNaoTribMercIntEExportacao        // '65' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação
  else if str = '66' then Result := stpisCredPresAquiRecTribENaoTribMercIntEExportacao   // '66' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno  e de Exportação
  else if str = '67' then Result := stpisOutrasOperacoes_CredPresumido                   // '67' // Crédito Presumido - Outras Operações
  else if str = '70' then Result := stpisOperAquiSemDirCredito                           // '70' // Operação de Aquisição sem Direito a Crédito
  else if str = '71' then Result := stpisOperAquiComIsensao                              // '71' // Operação de Aquisição com Isenção
  else if str = '72' then Result := stpisOperAquiComSuspensao                            // '72' // Operação de Aquisição com Suspensão
  else if str = '73' then Result := stpisOperAquiAliquotaZero                            // '73' // Operação de Aquisição a Alíquota Zero
  else if str = '74' then Result := stpisOperAqui_SemIncidenciaContribuicao              // '74' // Operação de Aquisição sem Incidência da Contribuição
  else if str = '75' then Result := stpisOperAquiPorST                                   // '75' // Operação de Aquisição por Substituição Tributária
  else if str = '98' then Result := stpisOutrasOperacoesEntrada                          // '98' // Outras Operações de Entrada
  else if str = '99' then Result := stpisOutrasOperacoes;                                // '99' // Outras Operações
end;

function _StrToSituacaoTribCOFINS(str: string): TACBrSituacaoTribCOFINS;
begin
  if str = '01' then Result := stcofinsValorAliquotaNormal                                 // '01' // Operação Tributável com Alíquota Básica   // valor da operação alíquota normal (cumulativo/não cumulativo)).
  else if str = '02' then Result := stcofinsValorAliquotaDiferenciada                       // '02' // Operação Tributável com Alíquota Diferenciada // valor da operação (alíquota diferenciada)).
  else if str = '03' then Result := stcofinsQtdeAliquotaUnidade                             // '03' // Operação Tributável com Alíquota por Unidade de Medida de Produto // quantidade vendida x alíquota por unidade de produto).
  else if str = '04' then Result := stcofinsMonofaticaAliquotaZero                          // '04' // Operação Tributável Monofásica - Revenda a Alíquota Zero
  else if str = '05' then Result := stcofinsValorAliquotaPorST                              // '05' // Operação Tributável por Substituição Tributária
  else if str = '06' then Result := stcofinsAliquotaZero                                    // '06' // Operação Tributável a Alíquota Zero
  else if str = '07' then Result := stcofinsIsentaContribuicao                              // '07' // Operação Isenta da Contribuição
  else if str = '08' then Result := stcofinsSemIncidenciaContribuicao                       // '08' // Operação sem Incidência da Contribuição
  else if str = '09' then Result := stcofinsSuspensaoContribuicao                           // '09' // Operação com Suspensão da Contribuição
  else if str = '49' then Result := stcofinsOutrasOperacoesSaida                            // '49' // Outras Operações de Saída
  else if str = '50' then Result := stcofinsOperCredExcRecTribMercInt                       // '50' // Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno
  else if str = '51' then Result := stcofinsOperCredExcRecNaoTribMercInt                    // '51' // Operação com Direito a Crédito – Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno
  else if str = '52' then Result := stcofinsOperCredExcRecExportacao                        // '52' // Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação
  else if str = '53' then Result := stcofinsOperCredRecTribNaoTribMercInt                   // '53' // Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno
  else if str = '54' then Result := stcofinsOperCredRecTribMercIntEExportacao               // '54' // Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação
  else if str = '55' then Result := stcofinsOperCredRecNaoTribMercIntEExportacao            // '55' // Operação com Direito a Crédito - Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação
  else if str = '56' then Result := stcofinsOperCredRecTribENaoTribMercIntEExportacao       // '56' // Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno  e de Exportação
  else if str = '60' then Result := stcofinsCredPresAquiExcRecTribMercInt                   // '60' // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno
  else if str = '61' then Result := stcofinsCredPresAquiExcRecNaoTribMercInt                // '61' // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno
  else if str = '62' then Result := stcofinsCredPresAquiExcExcRecExportacao                 // '62' // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação
  else if str = '63' then Result := stcofinsCredPresAquiRecTribNaoTribMercInt               // '63' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno
  else if str = '64' then Result := stcofinsCredPresAquiRecTribMercIntEExportacao           // '64' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação
  else if str = '65' then Result := stcofinsCredPresAquiRecNaoTribMercIntEExportacao        // '65' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação
  else if str = '66' then Result := stcofinsCredPresAquiRecTribENaoTribMercIntEExportacao   // '66' // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno  e de Exportação
  else if str = '67' then Result := stcofinsOutrasOperacoes_CredPresumido                   // '67' // Crédito Presumido - Outras Operações
  else if str = '70' then Result := stcofinsOperAquiSemDirCredito                           // '70' // Operação de Aquisição sem Direito a Crédito
  else if str = '71' then Result := stcofinsOperAquiComIsensao                              // '71' // Operação de Aquisição com Isenção
  else if str = '72' then Result := stcofinsOperAquiComSuspensao                            // '72' // Operação de Aquisição com Suspensão
  else if str = '73' then Result := stcofinsOperAquiAliquotaZero                            // '73' // Operação de Aquisição a Alíquota Zero
  else if str = '74' then Result := stcofinsOperAqui_SemIncidenciaContribuicao              // '74' // Operação de Aquisição sem Incidência da Contribuição
  else if str = '75' then Result := stcofinsOperAquiPorST                                   // '75' // Operação de Aquisição por Substituição Tributária
  else if str = '98' then Result := stcofinsOutrasOperacoesEntrada                          // '98' // Outras Operações de Entrada
  else if str = '99' then Result := stcofinsOutrasOperacoes;                                // '99' // Outras Operações
end;

function _StrToSituacaoTribICMS(str: string): TACBrSituacaoTribICMS;
begin
  if str = '000' then Result := sticmsTributadaIntegralmente                                     // '000' //	Tributada integralmente
  else if str = '010' then Result := sticmsTributadaComCobracaPorST                              // '010' //	Tributada e com cobrança do ICMS por substituição tributária
  else if str = '020' then Result := sticmsComReducao                                            // '020' //	Com redução de base de cálculo
  else if str = '030' then Result := sticmsIsentaComCobracaPorST                                 // '030' //	Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '040' then Result := sticmsIsenta                                                // '040' //	Isenta
  else if str = '041' then Result := sticmsNaoTributada                                          // '041' //	Não tributada
  else if str = '050' then Result := sticmsSuspensao                                             // '050' //	Suspensão
  else if str = '051' then Result := sticmsDiferimento                                           // '051' //	Diferimento
  else if str = '060' then Result := sticmsCobradoAnteriormentePorST                             // '060' //	ICMS cobrado anteriormente por substituição tributária
  else if str = '070' then Result := sticmsComReducaoPorST                                       // '070' //	Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '090' then Result := sticmsOutros                                                // '090' //	Outros
  else if str = '100' then Result := sticmsEstrangeiraImportacaoDiretaTributadaIntegralmente     // '100' // Estrangeira - Importação direta - Tributada integralmente
  else if str = '110' then Result := sticmsEstrangeiraImportacaoDiretaTributadaComCobracaPorST   // '110' // Estrangeira - Importação direta - Tributada e com cobrança do ICMS por substituição tributária
  else if str = '120' then Result := sticmsEstrangeiraImportacaoDiretaComReducao                 // '120' // Estrangeira - Importação direta - Com redução de base de cálculo
  else if str = '130' then Result := sticmsEstrangeiraImportacaoDiretaIsentaComCobracaPorST      // '130' // Estrangeira - Importação direta - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '140' then Result := sticmsEstrangeiraImportacaoDiretaIsenta                     // '140' // Estrangeira - Importação direta - Isenta
  else if str = '141' then Result := sticmsEstrangeiraImportacaoDiretaNaoTributada               // '141' // Estrangeira - Importação direta - Não tributada
  else if str = '150' then Result := sticmsEstrangeiraImportacaoDiretaSuspensao                  // '150' // Estrangeira - Importação direta - Suspensão
  else if str = '151' then Result := sticmsEstrangeiraImportacaoDiretaDiferimento                // '151' // Estrangeira - Importação direta - Diferimento
  else if str = '160' then Result := sticmsEstrangeiraImportacaoDiretaCobradoAnteriormentePorST  // '160' // Estrangeira - Importação direta - ICMS cobrado anteriormente por substituição tributária
  else if str = '170' then Result := sticmsEstrangeiraImportacaoDiretaComReducaoPorST            // '170' // Estrangeira - Importação direta - Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '190' then Result := sticmsEstrangeiraImportacaoDiretaOutros                     // '190' // Estrangeira - Importação direta - Outras
  else if str = '200' then Result := sticmsEstrangeiraAdqMercIntTributadaIntegralmente           // '200' // Estrangeira - Adquirida no mercado interno - Tributada integralmente
  else if str = '210' then Result := sticmsEstrangeiraAdqMercIntTributadaComCobracaPorST         // '210' // Estrangeira - Adquirida no mercado interno - Tributada e com cobrança do ICMS por substituição tributária
  else if str = '220' then Result := sticmsEstrangeiraAdqMercIntComReducao                       // '220' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo
  else if str = '230' then Result := sticmsEstrangeiraAdqMercIntIsentaComCobracaPorST            // '230' // Estrangeira - Adquirida no mercado interno - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '240' then Result := sticmsEstrangeiraAdqMercIntIsenta                           // '240' // Estrangeira - Adquirida no mercado interno - Isenta
  else if str = '241' then Result := sticmsEstrangeiraAdqMercIntNaoTributada                     // '241' // Estrangeira - Adquirida no mercado interno - Não tributada
  else if str = '250' then Result := sticmsEstrangeiraAdqMercIntSuspensao                        // '250' // Estrangeira - Adquirida no mercado interno - Suspensão
  else if str = '251' then Result := sticmsEstrangeiraAdqMercIntDiferimento                      // '251' // Estrangeira - Adquirida no mercado interno - Diferimento
  else if str = '260' then Result := sticmsEstrangeiraAdqMercIntCobradoAnteriormentePorST        // '260' // Estrangeira - Adquirida no mercado interno - ICMS cobrado anteriormente por substituição tributária
  else if str = '270' then Result := sticmsEstrangeiraAdqMercIntComReducaoPorST                  // '270' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '290' then Result := sticmsEstrangeiraAdqMercIntOutros                           // '290' // Estrangeira - Adquirida no mercado interno - Outras
  else if str = '300' then Result := csticms300                                                  // '300' // Estrangeira - Adquirida no mercado interno - Tributada integralmente
  else if str = '310' then Result := csticms310                                                  // '310' // Estrangeira - Adquirida no mercado interno - Tributada e com cobrança do ICMS por substituição tributária
  else if str = '320' then Result := csticms320                                                  // '320' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo
  else if str = '330' then Result := csticms330                                                  // '330' // Estrangeira - Adquirida no mercado interno - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '340' then Result := csticms340                                                  // '340' // Estrangeira - Adquirida no mercado interno - Isenta
  else if str = '341' then Result := csticms341                                                  // '341' // Estrangeira - Adquirida no mercado interno - Não tributada
  else if str = '350' then Result := csticms350                                                  // '350' // Estrangeira - Adquirida no mercado interno - Suspensão
  else if str = '351' then Result := csticms351                                                  // '351' // Estrangeira - Adquirida no mercado interno - Diferimento
  else if str = '360' then Result := csticms360                                                  // '360' // Estrangeira - Adquirida no mercado interno - ICMS cobrado anteriormente por substituição tributária
  else if str = '370' then Result := csticms370                                                  // '370' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '390' then Result := csticms390                                                  // '390' // Estrangeira - Adquirida no mercado interno - Outras
  else if str = '400' then Result := csticms400                                                  // '400' // Estrangeira - Adquirida no mercado interno - Tributada integralmente
  else if str = '410' then Result := csticms410                                                  // '410' // Estrangeira - Adquirida no mercado interno - Tributada e com cobrança do ICMS por substituição tributária
  else if str = '420' then Result := csticms420                                                  // '420' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo
  else if str = '430' then Result := csticms430                                                  // '430' // Estrangeira - Adquirida no mercado interno - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '440' then Result := csticms440                                                  // '440' // Estrangeira - Adquirida no mercado interno - Isenta
  else if str = '441' then Result := csticms441                                                  // '441' // Estrangeira - Adquirida no mercado interno - Não tributada
  else if str = '450' then Result := csticms450                                                  // '450' // Estrangeira - Adquirida no mercado interno - Suspensão
  else if str = '451' then Result := csticms451                                                  // '451' // Estrangeira - Adquirida no mercado interno - Diferimento
  else if str = '460' then Result := csticms460                                                  // '460' // Estrangeira - Adquirida no mercado interno - ICMS cobrado anteriormente por substituição tributária
  else if str = '470' then Result := csticms470                                                  // '470' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '490' then Result := csticms490                                                  // '490' // Estrangeira - Adquirida no mercado interno - Outras
  else if str = '500' then Result := csticms500                                                  // '500' // Estrangeira - Adquirida no mercado interno - Tributada integralmente
  else if str = '510' then Result := csticms510                                                  // '510' // Estrangeira - Adquirida no mercado interno - Tributada e com cobrança do ICMS por substituição tributária
  else if str = '520' then Result := csticms520                                                  // '520' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo
  else if str = '530' then Result := csticms530                                                  // '530' // Estrangeira - Adquirida no mercado interno - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '540' then Result := csticms540                                                  // '540' // Estrangeira - Adquirida no mercado interno - Isenta
  else if str = '541' then Result := csticms541                                                  // '541' // Estrangeira - Adquirida no mercado interno - Não tributada
  else if str = '550' then Result := csticms550                                                  // '550' // Estrangeira - Adquirida no mercado interno - Suspensão
  else if str = '551' then Result := csticms551                                                  // '551' // Estrangeira - Adquirida no mercado interno - Diferimento
  else if str = '560' then Result := csticms560                                                  // '560' // Estrangeira - Adquirida no mercado interno - ICMS cobrado anteriormente por substituição tributária
  else if str = '570' then Result := csticms570                                                  // '570' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '590' then Result := csticms590                                                  // '590' // Estrangeira - Adquirida no mercado interno - Outras
  else if str = '600' then Result := csticms600                                                  // '600' // Estrangeira - Adquirida no mercado interno - Tributada integralmente
  else if str = '610' then Result := csticms610                                                  // '610' // Estrangeira - Adquirida no mercado interno - Tributada e com cobrança do ICMS por substituição tributária
  else if str = '620' then Result := csticms620                                                  // '620' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo
  else if str = '630' then Result := csticms630                                                  // '630' // Estrangeira - Adquirida no mercado interno - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '640' then Result := csticms640                                                  // '640' // Estrangeira - Adquirida no mercado interno - Isenta
  else if str = '641' then Result := csticms641                                                  // '641' // Estrangeira - Adquirida no mercado interno - Não tributada
  else if str = '650' then Result := csticms650                                                  // '650' // Estrangeira - Adquirida no mercado interno - Suspensão
  else if str = '651' then Result := csticms651                                                  // '651' // Estrangeira - Adquirida no mercado interno - Diferimento
  else if str = '660' then Result := csticms660                                                  // '660' // Estrangeira - Adquirida no mercado interno - ICMS cobrado anteriormente por substituição tributária
  else if str = '670' then Result := csticms670                                                  // '670' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '690' then Result := csticms690                                                  // '690' // Estrangeira - Adquirida no mercado interno - Outras
  else if str = '700' then Result := csticms700                                                  // '700' // Estrangeira - Adquirida no mercado interno - Tributada integralmente
  else if str = '710' then Result := csticms710                                                  // '710' // Estrangeira - Adquirida no mercado interno - Tributada e com cobrança do ICMS por substituição tributária
  else if str = '720' then Result := csticms720                                                  // '720' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo
  else if str = '730' then Result := csticms730                                                  // '730' // Estrangeira - Adquirida no mercado interno - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  else if str = '740' then Result := csticms740                                                  // '740' // Estrangeira - Adquirida no mercado interno - Isenta
  else if str = '741' then Result := csticms741                                                  // '741' // Estrangeira - Adquirida no mercado interno - Não tributada
  else if str = '750' then Result := csticms750                                                  // '750' // Estrangeira - Adquirida no mercado interno - Suspensão
  else if str = '751' then Result := csticms751                                                  // '751' // Estrangeira - Adquirida no mercado interno - Diferimento
  else if str = '760' then Result := csticms760                                                  // '760' // Estrangeira - Adquirida no mercado interno - ICMS cobrado anteriormente por substituição tributária
  else if str = '770' then Result := csticms770                                                  // '770' // Estrangeira - Adquirida no mercado interno - Com redução de base de cálculo e cobrança do ICMS por substituição tributária
  else if str = '790' then Result := csticms790                                                  // '790' // Estrangeira - Adquirida no mercado interno - Outras
  else if str = '101' then Result := sticmsSimplesNacionalTributadaComPermissaoCredito           // '101' // Simples Nacional - Tributada pelo Simples Nacional com permissão de crédito
  else if str = '102' then Result := sticmsSimplesNacionalTributadaSemPermissaoCredito           // '102' // Simples Nacional - Tributada pelo Simples Nacional sem permissão de crédito
  else if str = '103' then Result := sticmsSimplesNacionalIsencaoPorFaixaReceitaBruta            // '103' // Simples Nacional - Isenção do ICMS no Simples Nacional para faixa de receita bruta
  else if str = '201' then Result := sticmsSimplesNacionalTributadaComPermissaoCreditoComST      // '201' // Simples Nacional - Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária
  else if str = '202' then Result := sticmsSimplesNacionalTributadaSemPermissaoCreditoComST      // '202' // Simples Nacional - Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
  else if str = '203' then Result := sticmsSimplesNacionalIsencaoPorFaixaReceitaBrutaComST       // '203' // Simples Nacional - Isenção do ICMS no Simples Nacional para faixa de receita bruta e com cobrança do ICMS por substituição tributária
  else if str = '300' then Result := sticmsSimplesNacionalImune                                  // '300' // Simples Nacional - Imune
  else if str = '400' then Result := sticmsSimplesNacionalNaoTributada                           // '400' // Simples Nacional - Não tributada pelo Simples Nacional
  else if str = '500' then Result := sticmsSimplesNacionalCobradoAnteriormentePorST              // '500' // Simples Nacional - ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação
  else if str = '900' then Result := sticmsSimplesNacionalOutros;                                // '900' // Simples Nacional - Outros
end;

function _StrToSituacaoTribIPI(str: string): TACBrSituacaoTribIPI;
begin
  if str = '00' then Result := stipiEntradaRecuperacaoCredito       // '00' // Entrada com recuperação de crédito
  else if str = '01' then Result := stipiEntradaTributradaZero      // '01' // Entrada tributada com alíquota zero
  else if str = '02' then Result := stipiEntradaIsenta              // '02' // Entrada isenta
  else if str = '03' then Result := stipiEntradaNaoTributada        // '03' // Entrada não-tributada
  else if str = '04' then Result := stipiEntradaImune               // '04' // Entrada imune
  else if str = '05' then Result := stipiEntradaComSuspensao        // '05' // Entrada com suspensão
  else if str = '49' then Result := stipiOutrasEntradas             // '49' // Outras entradas
  else if str = '50' then Result := stipiSaidaTributada             // '50' // Saída tributada
  else if str = '51' then Result := stipiSaidaTributadaZero         // '51' // Saída tributada com alíquota zero
  else if str = '52' then Result := stipiSaidaIsenta                // '52' // Saída isenta
  else if str = '53' then Result := stipiSaidaNaoTributada          // '53' // Saída não-tributada
  else if str = '54' then Result := stipiSaidaImune                 // '54' // Saída imune
  else if str = '55' then Result := stipiSaidaComSuspensao          // '55' // Saída com suspensão
  else if str = '99' then Result := stipiOutrasSaidas;              // '99' // Outras saídas
end;

function _StrToNaturezaFrtContratado(str: string): TACBrNaturezaFrtContratado;
begin
  if str = '0' then Result := nfcVendaOnusEstVendedor         //0 - Operações de vendas, com ônus suportado pelo estabelecimento vendedor
  else if str = '1' then Result := nfcVendaOnusAdquirente     //1 - Operações de vendas, com ônus suportado pelo adquirente
  else if str = '2' then Result := nfcCompraGeraCred          //2 - Operações de compras (bens para revenda, matériasprima e outros produtos, geradores de crédito)
  else if str = '3' then Result := nfcCompraNaoGeraCred       //3 - Operações de compras (bens para revenda, matériasprima e outros produtos, não geradores de crédito)
  else if str = '4' then Result := nfcTransfAcabadosPJ        //4 - Transferência de produtos acabados entre estabelecimentos da pessoa jurídica
  else if str = '5' then Result := nfcTransfNaoAcabadosPJ     //5 - Transferência de produtos em elaboração entre estabelecimentos da pessoa jurídica
  else Result := nfcOutras;                                   //9 - Outras.
end;

function _StrToIndTpOperacaoReceita(str: string): TACBrIndTpOperacaoReceita;
begin
  if str = '0' then Result := indRepCustosDespesasEncargos          //0 – Operação Representativa de Aquisição, Custos, Despesa ou Encargos, Sujeita à Incidência de Crédito de PIS/Pasep ou Cofins (CST 50 a 66).
  else if str = '1' then Result := indRepReceitaAuferida            //1 – Operação Representativa de Receita Auferida Sujeita ao Pagamento da Contribuição para o PIS/Pasep e da Cofins (CST 01, 02, 03 ou 05).
  else {if str = '2' then} Result := indRepReceitaNaoAuferida;      //2 - Operação Representativa de Receita Auferida Não Sujeita ao Pagamento da Contribuição para o PIS/Pasep e da Cofins (CST 04, 06, 07, 08, 09, 49 ou 99).
end;

function _StrToCodCont(str: string): TACBrCodCont;
begin
  if str = '01' then Result := ccNaoAcumAliqBasica                         // 01 // Contribuição não-cumulativa apurada a alíquota básica
  else if str = '02' then Result :=  ccNaoAcumAliqDiferenciada             // 02 // Contribuição não-cumulativa apurada a alíquotas diferenciadas
  else if str = '03' then Result :=  ccNaoAcumAliqUnidProduto              // 03 // Contribuição não-cumulativa apurada a alíquota por unidade de medida de produto
  else if str = '04' then Result :=  ccNaoAcumAliqBasicaAtivImobiliaria    // 04 // Contribuição não-cumulativa apurada a alíquota básica - Atividade Imobiliária
  else if str = '31' then Result :=  ccApuradaPorST                        // 31 // Contribuição apurada por substituição tributária
  else if str = '32' then Result :=  ccApuradaPorSTManaus                  // 32 // Contribuição apurada por substituição tributária - Vendas à Zona Franca de Manaus
  else if str = '51' then Result :=  ccAcumAliqBasica                      // 51 // Contribuição cumulativa apurada a alíquota básica
  else if str = '52' then Result :=  ccAcumAliqDiferenciada                // 52 // Contribuição cumulativa apurada a alíquotas diferenciadas
  else if str = '53' then Result :=  ccAcumAliqUnidProduto                 // 53 // Contribuição cumulativa apurada a alíquota por unidade de medida de produto
  else if str = '54' then Result :=  ccAcumAliqBasicaAtivImobiliaria       // 54 // Contribuição cumulativa apurada a alíquota básica - Atividade Imobiliária
  else if str = '70' then Result :=  ccApuradaAtivImobiliaria              // 70 // Contribuição apurada da Atividade Imobiliária - RET
  else if str = '71' then Result :=  ccApuradaSCPNaoCumulativa             // 71 // Contribuição apurada de SCP - Incidência Não Cumulativa
  else if str = '72' then Result :=  ccApuradaSCPCumulativa                // 72 // Contribuição apurada de SCP - Incidência Cumulativa
  else if str = '99' then Result :=  ccPISPasepSalarios;                   // 99 // Contribuição para o PIS/Pasep - Folha de Salários
end;

function _StrToCodIndCritEscrit(str: string) : TACBrCodIndCritEscrit;
begin
  if str = '1' then      Result := codRegimeCaixa                    //1 – Regime de Caixa – Escrituração consolidada (Registro F500);
  else if str = '2' then Result := codRegimeCompetEscritConsolidada  //2 – Regime de Competência - Escrituração consolidada (Registro F550);
  else if str = '9' then Result := codRegimeCompetEscritDetalhada;   //9 – Regime de Competência - Escrituração detalhada, com base nos registros dos Blocos “A”, “C”, “D” e “F”.
end;

function _StrToIndicadorDaComposicaoDaReceitaRecebida(str: string): TACBrIndicadorDaComposicaoDaReceitaRecebida;
begin
  if str = '01' then      Result := crCliente           //01- Clientes
  else if str = '02' then Result :=  crAdministradora    //02- Administradora de cartão de débito/crédito
  else if str = '03' then Result :=  crTituloDeCredito   //03- Título de crédito - Duplicata, nota promissória, cheque, etc.
  else if str = '04' then Result :=  crDocumentoFiscal   //04- Documento fiscal
  else if str = '05' then Result :=  crItemVendido       //05- Item vendido (produtos e serviços)
  else if str = '99' then Result :=  crOutros;           //99- Outros (Detalhar no campo 10 – Informação Complementar)
end;

end.

