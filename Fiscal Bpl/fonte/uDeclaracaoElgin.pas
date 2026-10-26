unit uDeclaracaoElgin;

interface
(*
uses uRecord;

function Elgin_AberturaDoDia(ValorCompra: string; FormaPagamento: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_AbreComprovanteNaoFiscalVinculado(FormaPagamento: string; Valor: string; NumeroCupom:
  string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreComprovanteNaoFiscalVinculadoMFD(FormaPagamento, Valor, NumeroCupom, CGC, nome,
  Endereco: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_AbreCupom(CGC_CPF: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreCupomMFD(CGC: string; Nome: string; Endereco: string): Integer; StdCall; External
  'Elgin.DLL'
function Elgin_AbrePortaSerial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_AbreRelatorioGerencial(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRelatorioGerencialMFD(Indice: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AcionaGaveta: Integer; StdCall; External 'Elgin.DLL'
function Elgin_AcionaGuilhotinaMFD(TipoCorte: integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AcrescimoDescontoItemMFD(Item, AcrescimoDesconto, TipoAcrescimoDesconto,
  ValorAcrescimoDesconto: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_AcrescimoDescontoSubtotalMFD(cFlag, cTipo, cValor: string): integer; StdCall; External
  'Elgin.DLL'
function Elgin_AcrescimoDescontoSubtotalRecebimentoMFD(cFlag, cTipo, cValor: string): integer;
  StdCall; External 'Elgin.DLL';
function Elgin_AcrescimoItemNaoFiscalMFD(strNroItem: string; strAcrescDesc: string;
  strTipoAcrescDesc: string; strValor: string): integer; StdCall; External 'Elgin.DLL';
function Elgin_Acrescimos(ValorAcrescimos: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AlteraSimboloMoeda(SimboloMoeda: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AtivaDesativaVendaUmaLinhaMFD(iFlag: Integer): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_AumentaDescricaoItem(Descricao: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_Autenticacao: Integer; StdCall; External 'Elgin.DLL'
function Elgin_AutenticacaoMFD(Linhas, Texto: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_CancelaAcrescimoDescontoItemMFD(cFlag, cItem: string): integer; StdCall; External
  'Elgin.DLL';
function Elgin_CancelaAcrescimoDescontoSubtotalMFD(cFlag: string): integer; StdCall; External
  'Elgin.DLL'
function Elgin_CancelaAcrescimoDescontoSubtotalRecebimentoMFD(cFlag: string): integer; StdCall;
  External 'Elgin.DLL';
function Elgin_CancelaAcrescimoNaoFiscalMFD(strNumeroItem: string; strAcrecDesc: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_CancelaCupom: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaCupomMFD(CGC, Nome, Endereco: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_CancelaImpressaoCheque: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemAnterior: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemGenerico(NumeroItem: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemNaoFiscalMFD(strNroItem: string): integer; StdCall; External 'Elgin.DLL';
function Elgin_Cancelamentos(ValorCancelamentos: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): Integer; StdCall;
  External 'Elgin.DLL'
function Elgin_CGC_IE(CGC: string; IE: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ClicheProprietario(Cliche: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CNPJ_IE(CNPJ: string; IE: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CNPJMFD(CNPJ: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CodigoBarrasCODABARMFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasCODE128MFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasCODE39MFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasCODE93MFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasEAN13MFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasEAN8MFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasISBNMFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasITFMFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasMSIMFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasPLESSEYMFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasUPCAMFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_CodigoBarrasUPCEMFD(Codigo: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_ComprovantesNaoFiscaisNaoEmitidosMFD(Comprovantes: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ConfiguraCodigoBarrasMFD(var Altura: Integer; var Largura: Integer; var pos: Integer;
  var Fonte: Integer; var Margem: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorComprovantesCreditoMFD(Comprovantes: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ContadorCupomFiscalMFD(CuponsEmitidos: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ContadoresTotalizadoresNaoFiscais(Contadores: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ContadoresTotalizadoresNaoFiscaisMFD(Contadores: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ContadorFitaDetalheMFD(ContadorFita: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorOperacoesNaoFiscaisCanceladasMFD(OperacoesCanceladas: string): Integer;
  StdCall; External 'Elgin.DLL'
function Elgin_ContadorRelatoriosGerenciaisMFD(Relatorios: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_CupomAdicionalMFD(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosSintegra(DataInicial: string; DataFinal: string): integer; StdCall; External
  'Elgin.DLL';
function Elgin_DadosUltimaReducao(DadosReducao: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosUltimaReducaoMFD(DadosReducao: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataHoraImpressora(Data: string; Hora: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_DataHoraReducao(Data: string; Hora: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataHoraSoftwareBasico(DataSW, HoraSW: PChar): Integer; stdcall; External
  'Elgin.DLL';
function Elgin_DataHoraUltimoDocumentoMFD(cDataHora: string): integer; StdCall; External
  'Elgin.DLL';
function Elgin_DataMovimento(Data: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataMovimentoUltimaReducaoMFD(cDataMovimento: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_Descontos(ValorDescontos: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DownloadMF(Arquivo: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_DownloadMFD(Arquivo: string; TipoDownload: string; ParametroInicial: string;
  ParametroFinal: string; UsuarioECF: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_EfetuaFormaPagamentoDescricaoForma(FormaPagamento: string; ValorFormaPagamento:
  string; DescricaoFormaPagto: string): integer; StdCall; External 'Elgin.DLL';
function Elgin_EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas,
  DescricaoFormaPagto: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_EspacoEntreLinhas(Dots: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EstornoFormasPagamento(FormaOrigem: string; FormaDestino: string; Valor: string):
  Integer; StdCall; External 'Elgin.DLL';
function Elgin_EstornoNaoFiscalVinculadoMFD(CGC, Nome, Endereco: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechaCupom(FormaPagamento: string; AcrescimoDesconto: string; TipoAcrescimoDesconto:
  string; ValorAcrescimoDesconto: string; ValorPago: string; Mensagem: string): Integer; StdCall;
  External 'Elgin.DLL';
function Elgin_FechaCupomResumido(FormaPagamento: string; Mensagem: string): Integer; StdCall;
  External 'Elgin.DLL';
function Elgin_FechamentoDoDia: Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaPortaSerial: Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaRecebimentoNaoFiscalMFD(Mensagem: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaRelatorioGerencial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_FlagsFiscais(var Flag: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FlagsFiscaisStr(FlagFiscal: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FormatoDadosMFD(ArquivoOrigem: string;
  ArquivoDestino: string;
  TipoFormato: string;
  TipoDownload: string;
  ParametroInicial: string;
  ParametroFinal: string;
  UsuarioECF: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_GrandeTotal(GrandeTotal: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_GrandeTotalUltimaReducaoMFD(cGT: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_IdentificaConsumidor(CNPJ_CPF: string; Nome: string; Endereco: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_ImprimeCheque(Banco: string; Valor: string; Favorecido: string; Cidade: string; Data:
  string; Mensagem: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeChequeMFD(NumeroBanco, Valor, Favorecido, Cidade, Data, Mensagem,
  ImpressaoVerso, Linhas: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeConfiguracoesImpressora: Integer; StdCall; External 'Elgin.DLL'
function Elgin_ImprimeCopiaCheque: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeDepartamentos: Integer; StdCall; External 'Elgin.DLL';
function Elgin_IncluiCidadeFavorecido(Cidade: string; Favorecido: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_IniciaFechamentoCupom(AcrescimoDesconto: string; TipoAcrescimoDesconto: string;
  ValorAcrescimoDesconto: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoCupomMFD(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimo,
  ValorDesconto: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoRecebimentoNaoFiscalMFD(AcrescimoDesconto, TipoAcrescimoDesconto,
  ValorAcrescimo, ValorDesconto: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InicioFimCOOsMFD(cCOOIni, cCOOFim: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InicioFimGTsMFD(cGTInicial, cGTFinal: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_InscricaoEstadualMFD(InscricaoEstadual: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_InscricaoMunicipalMFD(InscricaoMunicipal: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_LeArquivoRetorno(sCupom: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeIndicadores(var Indicador: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraCheque(CodigoCMC7: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalData(DataInicial, DataFinal, FlagLeitura: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
  Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, FlagLeitura: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
  Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraX: Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraXSerial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeNomeRelatorioGerencial(Codigo, descricao: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_LinhasEntreCupons(Linhas: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MapaResumo: Integer; StdCall; External 'Elgin.DLL';
function Elgin_MapaResumoMFD: Integer; StdCall; External 'Elgin.DLL';
function Elgin_MarcaModeloTipoImpressoraMFD(Marca, Modelo, Tipo: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_MinutosEmitindoDocumentosFiscaisMFD(Minutos: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_MinutosImprimindo(Minutos: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MinutosLigada(Minutos: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ModeloImpressora(ModeloImpressora: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NomeiaDepartamento(Indice: Integer; Departamento: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_NomeiaRelatorioGerencialMFD(Indice, Descricao: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_NomeiaTotalizadorNaoSujeitoIcms(Indice: Integer; Totalizador: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_NumeroCaixa(NumeroCaixa: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroCupom(NumeroCupom: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroCuponsCancelados(NumeroCancelamentos: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_NumeroIntervencoes(NumeroIntervencoes: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_NumeroLoja(NumeroLoja: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroOperacoesNaoFiscais(NumeroOperacoes: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_NumeroReducoes(NumeroReducoes: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerie(NumeroSerie: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerieCriptografado(NumeroSerie: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_NumeroSerieDescriptografado(NumeroSerieCriptografado: string;
  NumeroSerieDesCriptografado: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerieMemoriaMFD(NumeroSerieMFD: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_NumeroSubstituicoesProprietario(NumeroSubstituicoes: string): Integer; StdCall;
  External 'Elgin.DLL';
function Elgin_PercentualLivreMFD(cMemoriaLivre: string): integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaAliquota(Aliquota: string; ICMS_ISS: Integer): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ProgramaArredondamento: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaBaudRate(BaudRate: PChar): Integer; stdcall; External 'Elgin.DLL';
function Elgin_ProgramaCaracterAutenticacao(Parametros: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ProgramaHorarioVerao: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaIdAplicativoMFD(NomeAplicativo: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ProgramaMoedaPlural(MoedaPlural: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaMoedaSingular(MoedaSingular: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaOperador(NomeOperador: string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_ProgramaTruncamento: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RecebimentoNaoFiscal(IndiceTotalizador: string; Valor: string; FormaPagamento:
  string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReducaoZ(Data: string; Hora: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReducoesRestantesMFD(Reducoes: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RegistrosTipo60: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReimpressaoNaoFiscalVinculadoMFD(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioGerencial(Texto: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioSintegraMFD(iRelatorios: Integer; cArquivo: string; cMes: string; cAno:
  string; cRazaoSocial: string; cEndereco: string; cNumero: string; cComplemento: string; cBairro:
  string; cCidade: string; cCEP: string; cTelefone: string; cFax: string; cContato: string): Integer;
  StdCall; External 'Elgin.DLL';
function Elgin_RelatorioTipo60Analitico: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioTipo60AnaliticoMFD: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioTipo60Mestre: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ResetaImpressora: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RetornoAliquotas(Aliquotas: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RetornoImpressora(var i: integer; ErrorMsg: string): integer; StdCall; External
  'Elgin.DLL';
function Elgin_Sangria(Valor: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SegundaViaNaoFiscalVinculadoMFD(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SimboloMoeda(SimboloMoeda: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_StatusEstendidoMFD(var iStatus: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SubTotal(SubTotal: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SubTotalComprovanteNaoFiscalMFD(cSubTotal: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_Suprimento(Valor: string; FormaPagamento: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_TamanhoTotalMFD(cTamanhoMFD: string): integer; StdCall; External 'Elgin.DLL';
function Elgin_TempoOperacionalMFD(TempoOperacional: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_TerminaFechamentoCupom(Mensagem: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TerminaFechamentoCupomCodigoBarrasMFD(cMensagem: string; cTipoCodigo: string;
  cCodigo: string; iAltura: integer; iLargura: integer; iPosicaoCaracteres: integer; iFonte: integer;
  iMargem: integer; iCorrecaoErros: integer; iColunas: integer): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_TotalDiaTroco(TotalDiaTroco: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalDocTroco(TotalDocTroco: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalLivreMFD(cMemoriaLivre: string): integer; StdCall; External 'Elgin.DLL';
function Elgin_UltimoItemVendido(NumeroItem: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_UsaComprovanteNaoFiscalVinculado(Texto: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_UsaRelatorioGerencialMFD(Texto: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorFormaPagamento(FormaPagamento: string; Valor: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_ValorFormaPagamentoMFD(FormaPagamento: string; Valor: string): Integer; StdCall;
  External 'Elgin.DLL';
function Elgin_ValorPagoUltimoCupom(ValorCupom: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorTotalizadorNaoFiscal(Totalizador: string; Valor: string): Integer; StdCall;
  External 'Elgin.DLL';
function Elgin_ValorTotalizadorNaoFiscalMFD(Totalizador: string; Valor: string): Integer; StdCall;
  External 'Elgin.DLL';
function Elgin_VendaBruta(VendaBruta: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendaLiquida(VendaLiquida: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendeItem(Codigo: string; Descricao: string; Aliquota: string; TipoQuantidade:
  string; Quantidade: string; CasasDecimais: Integer; ValorUnitario: string; TipoDesconto: string;
  Desconto: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendeItemDepartamento(Codigo: string; Descricao: string; Aliquota: string;
  ValorUnitario: string; Quantidade: string; Acrescimo: string; Desconto: string; IndiceDepartamento:
  string; UnidadeMedida: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaAliquotasICMS(Flag: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaAliquotasIss(Flag: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaDepartamentos(Departamentos: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoGaveta(var EstadoGaveta: Integer): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaEstadoGavetaStr(EstadoGaveta: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaEstadoImpressora(var ACK: Integer; var ST1: Integer; var ST2: Integer):
  Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressoraMFD(var ACK: Integer; var ST1: Integer; var ST2: Integer; var
  ST3: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressoraStr(ACK: string; ST1: string; ST2: string): Integer; StdCall;
  External 'Elgin.DLL';
function Elgin_VerificaFormasPagamento(Formas: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaFormasPagamentoMFD(FormasPagamento: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaImpressoraLigada: Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaIndiceAliquotasICMS(Flag: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaIndiceAliquotasIss(Flag: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaModoOperacao(Modo: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaRecebimentoNaoFiscal(Recebimentos: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaRecebimentoNaoFiscalMFD(Recebimentos: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaReducaoZAutomatica(var Flag: integer): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaRelatorioGerencialMFD(Relatorios: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaSensorPoucoPapelMFD(Flag: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaStatusCheque(var StatusCheque: Integer): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaTipoImpressora(var TipoImpressora: Integer): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaTipoImpressoraStr(TipoImpressora: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaTotalizadoresNaoFiscais(Totalizadores: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaTotalizadoresParciais(Totalizadores: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaTotalizadoresParciaisMFD(Totalizadores: string): Integer; StdCall; External
  'Elgin.DLL';
function Elgin_VerificaTruncamento(Flag: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaZPendente(var Flag: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VersaoFirmware(VersaoFirmware: string): Integer; StdCall; External 'Elgin.DLL';
function RFD_ConvertedaMFD(CRZ: string): Integer; StdCall; External 'Elgin.DLL';
function RFD_ConvertedaMFDData(dataInicial,dataFinal: string): Integer; StdCall; External 'Elgin.DLL';
*)
implementation

end.

