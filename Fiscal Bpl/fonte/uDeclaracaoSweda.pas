unit uDeclaracaoSweda;

interface
(*
uses uRecord;

// Acesso a sWeda

//function ECFOpen(numero: longint; tempo: longint; log: longint; mostra: longint): integer; stdcall;
//  external 'SWECF.DLL' index 1;
//
//procedure ECFClose; stdcall;
//  external 'SWECF.DLL' index 2;
//
//function ECFWrite(Comando: PChar): longint; stdcall;
//  external 'SWECF.DLL' index 3;
//
//function ECFRead(Status: PChar; Extensao: longint): Longint; stdcall;
//  external 'SWECF.DLL' index 4;

//function SWEDA_ExtrairInformacoesECF(NomeArquivo: PChar; Buffer: PTPropriedadesDispositivo;
//  Extensao: Smallint; Opcoes: SmallInt = 0): SmallInt; stdcall; external 'SWMFD.DLL';
//
//function SWEDA_CapturarDispositivo(Dispositivo: word; Opcoes: word = 0; Destino: PChar = nil;
//  Extensao: smallint = 0; TimeOut: integer = 15000; CallBack: TCallBackCD = nil; Instancia: Pointer
//  = nil): Longint; stdcall; external 'SWMFD.DLL';
//
//
//function SWEDA_ReproduzirFitaDetalhe(Origem: PChar; ArquivoDestino: PChar; SelecaoInicial: PChar;
//  SelecaoFinal: PChar; Opcoes: SmallInt = 0; Buffer: PChar = nil; Extensao: Integer = 0): SmallInt;
//stdcall; external 'SWMFD.DLL';
//
//function SWEDA_ArquivoEletronicoCOTEPE(Origem1: PChar; Origem2: PChar; ArquivoDestino: PChar;
//  SelecaoInicial: PChar; SelecaoFinal: PChar; Opcoes: Integer = 0): SmallInt; stdcall; external
//'SWMFD.DLL';

// Funções de Inicialização

function ECF_AlteraSimboloMoeda(SimboloMoeda: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramaAliquota(Aliquota: pchar; ICMS_ISS: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramaHorarioVerao: Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NomeiaDepartamento(
  Indice: Integer;
  Departamento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NomeiaTotalizadorNaoSujeitoIcms(
  Indice: Integer;
  Totalizador: pchar):
  Integer; stdcall; external 'CONVECF.DLL';

function ECF_ProgramaArredondamento: Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramaTruncamento: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_ProgramaTruncamento';

function ECF_LinhasEntreCupons(Linhas: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EspacoEntreLinhas(Dots: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ForcaImpactoAgulhas(ForcaImpacto: Integer): Integer;
stdcall; external 'CONVECF.DLL';

// Funções do Cupom Fiscal

function ECF_AbreCupom(CGC_CPF: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VendeItem(Codigo: pchar;
  Descricao: pchar;
  Aliquota: pchar;
  TipoQuantidade: pchar;
  Quantidade: pchar;
  CasasDecimais: Integer;
  ValorUnitario: pchar;
  TipoDesconto: pchar;
  Desconto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VendeItemDepartamento(
  Codigo: pchar;
  Descricao: pchar;
  Aliquota: pchar;
  ValorUnitario: pchar;
  Quantidade: pchar;
  Acrescimo: pchar;
  Desconto: pchar;
  IndiceDepartamento: pchar;
  UnidadeMedida: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaItemAnterior: Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaItemGenerico(NumeroItem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaCupom: Integer; stdcall; external 'CONVECF.DLL';

function ECF_FechaCupomResumido(
  FormaPagamento: pchar;
  Mensagem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_FechaCupom(
  FormaPagamento: pchar;
  AcrescimoDesconto: pchar;
  TipoAcrescimoDesconto: pchar;
  ValorAcrescimoDesconto: pchar;
  ValorPago: pchar; Mensagem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ResetaImpressora: Integer; stdcall; external 'CONVECF.DLL';

function ECF_IniciaFechamentoCupom(
  AcrescimoDesconto: pchar;
  TipoAcrescimoDesconto: pchar;
  ValorAcrescimoDesconto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EfetuaFormaPagamento(
  FormaPagamento: pchar;
  ValorFormaPagamento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EfetuaFormaPagamentoDescricaoForma(
  FormaPagamento: pchar;
  ValorFormaPagamento: pchar;
  DescricaoFormaPagto: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_TerminaFechamentoCupom(Mensagem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EstornoFormasPagamento(
  FormaOrigem: pchar;
  FormaDestino: pchar;
  Valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UsaUnidadeMedida(UnidadeMedida: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AumentaDescricaoItem(Descricao: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Funções dos Relatórios Fiscais

function ECF_LeituraX: Integer; stdcall; external 'CONVECF.DLL';

function ECF_ReducaoZ(
  Data: pchar;
  Hora: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RelatorioGerencial(Texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RelatorioGerencialTEF(Texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_FechaRelatorioGerencial: Integer; stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalData(
  DataInicial: pchar;
  DataFinal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalReducao(
  ReducaoInicial: pchar;
  ReducaoFinal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalSerialData(
  DataInicial: pchar;
  DataFinal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalSerialReducao(
  ReducaoInicial: pchar;
  ReducaoFinal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Funções das Operações Não Fiscais

function ECF_RecebimentoNaoFiscal(
  IndiceTotalizador: pchar;
  Valor: pchar;
  FormaPagamento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AbreComprovanteNaoFiscalVinculado(
  FormaPagamento: pchar;
  Valor: pchar;
  NumeroCupom: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UsaComprovanteNaoFiscalVinculado(Texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UsaComprovanteNaoFiscalVinculadoTEF(Texto: pchar): Integer;
stdcall; external 'CONVECF.DLL'

function ECF_FechaComprovanteNaoFiscalVinculado: Integer; stdcall;
external 'CONVECF.DLL';

function ECF_Sangria(Valor: pchar): Integer; stdcall; external 'CONVECF.DLL';

function ECF_Suprimento(
  Valor: pchar;
  FormaPagamento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Funções de Informações da Impressora

function ECF_NumeroSerie(NumeroSerie: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_SubTotal(SubTotal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroCupom(NumeroCupom: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraXSerial: Integer; stdcall; external 'CONVECF.DLL';

function ECF_VersaoFirmware(VersaoFirmware: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CGC_IE(CGC: pchar; IE: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_GrandeTotal(GrandeTotal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Cancelamentos(ValorCancelamentos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Descontos(ValorDescontos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroOperacoesNaoFiscais(NumeroOperacoes: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroCuponsCancelados(NumeroCancelamentos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroIntervencoes(NumeroIntervencoes: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroReducoes(NumeroReducoes: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroSubstituicoesProprietario(
  NumeroSubstituicoes: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UltimoItemVendido(NumeroItem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ClicheProprietario(Cliche: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroCaixa(NumeroCaixa: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroLoja(NumeroLoja: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_SimboloMoeda(SimboloMoeda: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_MinutosLigada(Minutos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_MinutosImprimindo(Minutos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaModoOperacao(Modo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaEpromConectada(Flag: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_FlagsFiscais(var Flag: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ValorPagoUltimoCupom(ValorCupom: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DataHoraImpressora(Data: pchar; Hora: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadoresTotalizadoresNaoFiscais(Contadores: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaTotalizadoresNaoFiscais(Totalizadores: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DataHoraReducao(Data: pchar; Hora: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DataMovimento(Data: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaTruncamento(Flag: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Acrescimos(ValorAcrescimos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadorBilhetePassagem(ContadorPassagem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaAliquotasIss(Flag: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaFormasPagamento(Formas: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaRecebimentoNaoFiscal(Recebimentos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaDepartamentos(Departamentos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaTipoImpressora(var TipoImpressora: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaTotalizadoresParciais(Totalizadores: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornoAliquotas(Aliquotas: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaEstadoImpressora(
  var ACK: Integer;
  var ST1: Integer;
  var ST2: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DadosUltimaReducao(DadosReducao: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_MonitoramentoPapel(var Linhas: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaIndiceAliquotasIss(Flag: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ValorFormaPagamento(
  FormaPagamento: pchar;
  Valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ValorTotalizadorNaoFiscal(
  Totalizador: pchar;
  Valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Funções de Autenticação e Gaveta de Dinheiro

function ECF_Autenticacao: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_Autenticacao';

function ECF_ProgramaCaracterAutenticacao(Parametros: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AcionaGaveta: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_AcionaGaveta';

function ECF_VerificaEstadoGaveta(var EstadoGaveta: Integer): Integer;
stdcall; external 'CONVECF.DLL';

// Função para a Impressora Bilhete de Passagem

function ECF_AbreBilhetePassagem(
  ImprimeValorFinal: pchar;
  ImprimeEnfatizado: pchar;
  Embarque: pchar;
  Destino: pchar;
  Linha: pchar;
  Prefixo: pchar;
  Agente: pchar;
  Agencia: pchar;
  Data: pchar;
  Hora: pchar;
  Poltrona: pchar;
  Plataforma: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Funções de Impressão de Cheques

function ECF_ProgramaMoedaSingular(MoedaSingular: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramaMoedaPlural(MoedaPlural: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaImpressaoCheque: Integer; stdcall; external 'CONVECF.DLL';

function ECF_VerificaStatusCheque(var StatusCheque: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ImprimeCheque(
  Banco: pchar;
  Valor: pchar;
  Favorecido: pchar;
  Cidade: pchar;
  Data: pchar; Mensagem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_IncluiCidadeFavorecido(
  Cidade: pchar;
  Favorecido: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ImprimeCopiaCheque: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_ImprimeCopiaCheque';

// Outras Funções

function ECF_AbrePortaSerial: Integer; stdcall; external 'CONVECF.DLL';

function ECF_RetornoImpressora(
  var ACK: Integer;
  var ST1: Integer;
  var ST2: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_FechaPortaSerial: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_FechaPortaSerial';

function ECF_MapaResumo: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_MapaResumo';

function ECF_AberturaDoDia(
  ValorCompra: pchar;
  FormaPagamento: pchar): Integer; stdcall; external 'CONVECF.DLL';

function ECF_FechamentoDoDia: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_FechamentoDoDia';

function ECF_ImprimeConfiguracoesImpressora: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_ImprimeConfiguracoesImpressora';

function ECF_ImprimeDepartamentos: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_ImprimeDepartamentos';

function ECF_RelatorioTipo60Analitico: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_RelatorioTipo60Analitico';

function ECF_RelatorioTipo60Mestre: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_RelatorioTipo60Mestre';

function ECF_VerificaImpressoraLigada: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_VerificaImpressoraLigada';

function ECF_ImpressaoCarne(
  Titulo, Percelas: pchar;
  Datas, Quantidade: integer;
  Texto, Cliente, RG_CPF, Cupom: pchar;
  Vias, Assina: integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_InfoBalanca(
  Porta: pchar;
  Modelo: integer;
  Peso, PrecoKilo, Total: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DadosSintegra(
  DataInicio: pchar;
  DataFinal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_IniciaModoTEF: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_IniciaModoTEF';

function ECF_FinalizaModoTEF: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_FinalizaModoTEF';

function ECF_VersaoDll(Versao: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RegistrosTipo60: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_RegistrosTipo60';

function ECF_LeArquivoRetorno(Retorno: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Funções da Impressora Fiscal MFD

function ECF_AbreCupomMFD(
  CGC: pchar;
  Nome: pchar;
  Endereco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaCupomMFD(
  CGC, Nome,
  Endereco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramaFormaPagamentoMFD(
  FormaPagto,
  OperacaoTef: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EfetuaFormaPagamentoMFD(
  FormaPagamento,
  ValorFormaPagamento,
  Parcelas,
  DescricaoFormaPagto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CupomAdicionalMFD(): Integer; stdcall; external 'CONVECF.DLL';

function ECF_AcrescimoDescontoItemMFD(
  Item,
  AcrescimoDesconto,
  TipoAcrescimoDesconto,
  ValorAcrescimoDesconto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NomeiaRelatorioGerencialMFD(Indice, Descricao: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AutenticacaoMFD(Linhas, Texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AbreComprovanteNaoFiscalVinculadoMFD(
  FormaPagamento,
  Valor,
  NumeroCupom,
  CGC,
  nome,
  Endereco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ReimpressaoNaoFiscalVinculadoMFD(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EfetuaRecebimentoNaoFiscalMFD(
  IndiceTotalizador,
  ValorRecebimento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_IniciaFechamentoRecebimentoNaoFiscalMFD(
  AcrescimoDesconto,
  TipoAcrescimoDesconto,
  ValorAcrescimo,
  ValorDesconto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_FechaRecebimentoNaoFiscalMFD(Mensagem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaRecebimentoNaoFiscalMFD(
  CGC,
  Nome,
  Endereco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AbreRelatorioGerencialMFD(Indice: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UsaRelatorioGerencialMFD(Texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UsaRelatorioGerencialMFDTEF(Texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_SegundaViaNaoFiscalVinculadoMFD(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EstornoNaoFiscalVinculadoMFD(
  CGC,
  Nome,
  Endereco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroSerieMFD(NumeroSerie: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VersaoFirmwareMFD(VersaoFirmware: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CNPJMFD(CNPJ: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_InscricaoEstadualMFD(InscricaoEstadual: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_InscricaoMunicipalMFD(InscricaoMunicipal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TempoOperacionalMFD(TempoOperacional: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_MinutosEmitindoDocumentosFiscaisMFD(Minutos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadoresTotalizadoresNaoFiscaisMFD(Contadores: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaFormasPagamentoMFD(FormasPagamento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaRecebimentoNaoFiscalMFD(Recebimentos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaRelatorioGerencialMFD(Relatorios: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadorComprovantesCreditoMFD(Comprovantes: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadorOperacoesNaoFiscaisCanceladasMFD(
  OperacoesCanceladas: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadorRelatoriosGerenciaisMFD(Relatorios: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadorCupomFiscalMFD(CuponsEmitidos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ContadorFitaDetalheMFD(ContadorFita: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ComprovantesNaoFiscaisNaoEmitidosMFD(Comprovantes: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_NumeroSerieMemoriaMFD(NumeroSerieMFD: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_MarcaModeloTipoImpressoraMFD(
  Marca,
  Modelo,
  Tipo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ReducoesRestantesMFD(Reducoes: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaTotalizadoresParciaisMFD(Totalizadores: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DadosUltimaReducaoMFD(DadosReducao: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalDataMFD(
  DataInicial,
  DataFinal,
  FlagLeitura: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalReducaoMFD(
  ReducaoInicial,
  ReducaoFinal,
  FlagLeitura: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalSerialDataMFD(
  DataInicial,
  DataFinal,
  FlagLeitura: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraMemoriaFiscalSerialReducaoMFD(
  ReducaoInicial,
  ReducaoFinal,
  FlagLeitura: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraChequeMFD(CodigoCMC7: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ImprimeChequeMFD(
  NumeroBanco,
  Valor,
  Favorecido,
  Cidade,
  Data,
  Mensagem,
  ImpressaoVerso,
  Linhas: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornoImpressoraMFD(
  var ACK: Integer;
  var ST1: Integer;
  var ST2: Integer;
  var ST3: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AbreBilhetePassagemMFD(
  Embarque,
  Destino,
  Linha,
  Agencia,
  Data,
  Hora,
  Poltrona,
  Plataforma,
  TipoPassagem,
  RGCliente,
  NomeCliente,
  EnderecoCliente,
  UFDetino: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaAcrescimoDescontoItemMFD(cFlag, cItem: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_SubTotalizaCupomMFD: integer; stdcall; external 'CONVECF.DLL';

function ECF_SubTotalizaRecebimentoMFD: integer; stdcall; external 'CONVECF.DLL';

function ECF_TotalLivreMFD(cMemoriaLivre: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_TamanhoTotalMFD(cTamanhoMFD: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_AcrescimoDescontoSubtotalRecebimentoMFD(
  cFlag,
  cTipo,
  cValor: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_AcrescimoDescontoSubtotalMFD(
  cFlag,
  cTipo,
  cValor: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaAcrescimoDescontoSubtotalMFD(cFlag: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaAcrescimoDescontoSubtotalRecebimentoMFD(
  cFlag: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_TotalizaCupomMFD: integer;
stdcall; external 'CONVECF.DLL';

function ECF_TotalizaRecebimentoMFD: integer;
stdcall; external 'CONVECF.DLL';

function ECF_PercentualLivreMFD(cMemoriaLivre: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_DataHoraUltimoDocumentoMFD(cDataHora: pchar): integer;
stdcall; external 'CONVECF.DLL';

function ECF_MapaResumoMFD: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_MapaResumoMFD';

function ECF_RelatorioTipo60AnaliticoMFD: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_RelatorioTipo60AnaliticoMFD';

function ECF_ValorFormaPagamentoMFD(
  FormaPagamento: pchar;
  Valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ValorTotalizadorNaoFiscalMFD(
  Totalizador: pchar;
  Valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaEstadoImpressoraMFD(
  var ACK: Integer;
  var ST1: Integer;
  var ST2: Integer;
  var ST3: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_IniciaFechamentoCupomMFD(
  AcrescimoDesconto: pchar;
  TipoAcrescimoDesconto: pchar;
  ValorAcrescimo: pchar;
  ValorDesconto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TerminaFechamentoCupomCodigoBarrasMFD(
  cMensagem: pchar;
  cTipoCodigo: pchar;
  cCodigo: pchar;
  iAltura: Integer;
  iLargura: Integer;
  iPosicaoCaracteres: Integer;
  iFonte: Integer;
  iMargem: Integer;
  iCorrecaoErros: Integer;
  iColunas: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaItemNaoFiscalMFD(NumeroItem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AcrescimoItemNaoFiscalMFD(
  NumeroItem: pchar;
  AcrescimoDesconto: pchar;
  TipoAcrescimoDesconto: pchar;
  ValorAcrescimoDesconto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelaAcrescimoNaoFiscalMFD(
  NumeroItem: pchar;
  AcrescimoDesconto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ImprimeClicheMFD: Integer;
stdcall; external 'CONVECF.DLL' Name 'ECF_ImprimeClicheMFD';

function ECF_ImprimeInformacaoChequeMFD(
  Posicao: Integer;
  Linhas: Integer;
  Mensagem: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RelatorioSintegraMFD(
  iRelatorios: Integer;
  cArquivo: pchar;
  cMes: pchar;
  cAno: pchar;
  cRazaoSocial: pchar;
  cEndereco: pchar;
  cNumero: pchar;
  cComplemento: pchar;
  cBairro: pchar;
  cCidade: pchar;
  cCEP: pchar;
  cTelefone: pchar;
  cFax: pchar;
  cContato: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_GeraRelatorioSintegraMFD(
  iRelatorios: Integer;
  cArquivoOrigem: pchar;
  cArquivoDestino: pchar;
  cMes: pchar;
  cAno: pchar;
  cRazaoSocial: pchar;
  cEndereco: pchar;
  cNumero: pchar;
  cComplemento: pchar;
  cBairro: pchar;
  cCidade: pchar;
  cCEP: pchar;
  cTelefone: pchar;
  cFax: pchar;
  cContato: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DownloadMF(Arquivo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DownloadMFD(nome: string;
  tipo: string;
  inicio: string;
  fim: string;
  usuario: string): Integer; StdCall; External 'CONVECF.DLL';

function ECF_FormatoDadosMFD(
  ArquivoOrigem: pchar;
  ArquivoDestino: pchar;
  TipoFormato: pchar;
  TipoDownload: pchar;
  ParametroInicial: pchar;
  ParametroFinal: pchar;
  UsuarioECF: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AtivaDesativaVendaUmaLinhaMFD(iFlag: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AtivaDesativaAlinhamentoEsquerdaMFD(iFlag: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AtivaDesativaCorteProximoMFD(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AtivaDesativaTratamentoONOFFLineMFD(iFlag: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_StatusEstendidoMFD(var iStatus: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaFlagCorteMFD(var iStatus: Integer): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TempoRestanteComprovanteMFD(cTempo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UFProprietarioMFD(cUF: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_GrandeTotalUltimaReducaoMFD(cGT: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DataMovimentoUltimaReducaoMFD(cData: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_SubTotalComprovanteNaoFiscalMFD(cSubTotal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_InicioFimCOOsMFD(cCOOIni, cCOOFim: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_InicioFimGTsMFD(cGTIni, cGTFim: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Função para Configuração dos Códigos de Barras

function ECF_ConfiguraCodigoBarrasMFD(
  Altura: Integer;
  Largura: Integer;
  PosicaoCaracteres: Integer;
  Fonte: Integer; Margem: Integer): Integer;
stdcall; external 'CONVECF.DLL';

// Funções para Impressão dos Códigos de Barras

function ECF_CodigoBarrasUPCAMFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasUPCEMFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasEAN13MFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasEAN8MFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasCODE39MFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasCODE93MFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasCODE128MFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasITFMFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasCODABARMFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasISBNMFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasMSIMFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasPLESSEYMFD(Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CodigoBarrasPDF417MFD(
  NivelCorrecaoErros: Integer;
  Altura: Integer;
  Largura: Integer; Colunas: Integer;
  Codigo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

// Novas Funções

function ECF_VendeItemTresDecimais(codigo: pchar;
  nome: pchar;
  aliquota: pchar;
  quant: pchar;
  valor: pchar;
  tipoacrdesc: pchar;
  perc: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_IdentificaConsumidor(nomei: pchar;
  endi: pchar;
  cpfi: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__EmitirCupomAdicional(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__AbreRelatorioGerencial(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__EnviarTextoCNF(cTexto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__AbreRecebimentoNaoFiscal(indice: pchar;
  tipoacredesc: pchar;
  tipovalor: pchar;
  acredesci: pchar;
  receb: pchar;
  texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__EfetuaFormaPagamentoNaoFiscal(legenda: pchar;
  valor: pchar;
  texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__FundoCaixa(valor: pchar;
  legenda: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__ReducaoZAjustaDataHora(
  cdata: pchar;
  chora: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__AutenticacaoStr(texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__ProgramaFormasPagamento(Modal: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__ProgramaOperador(oper: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__CfgFechaAutomaticoCupom(fac: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__CfgRedZAutomatico(zauto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__CfgCupomAdicional(adicional: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__CfgEspacamentoCupons(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__CfgHoraMinReducaoZ(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__CfgLimiarNearEnd(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF__CfgPermMensPromoCNF(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_AlteraRegistry(
  chave: pchar;
  valori: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_Path(path: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_PathMFD(path: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_ZAutomatica(zauto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_Verao(verao: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_Log(log: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_AplMensagem1(apl: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_AplMensagem2(apl: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_Default(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_Registry_RetornaValor(ecf: pchar;
  chave: pchar;
  valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_StatusCupomFiscal(cupa: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_StatusRelatorioGerencial(rela: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_StatusComprovanteNaoFiscalVinculado
  (vinc: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_StatusComprovanteNaoFiscalNaoVinculado
  (nvinc: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaModeloEcf(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaHorarioVerao(verao: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaZPendente(zpen: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaXPendente(xpen: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaDiaAberto(diaa: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaDescricaoFormasPagamento(Formas: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaFormasPagamentoEx(FPag: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaTotalizadoresNaoFiscaisEx
  (Recebimento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ClicheProprietarioEx
  (ClicheProprietario: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RegistraNumeroSerie(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaNumeroSerie(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaSerialCriptografado(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_COO(COOi: pchar; COOf: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LerAliquotasComIndice(taxas: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VendaBruta(vbruta: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_UltimaFormaPagamento(nome: pchar;
  Valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

//function ECF_TipoUltimoDocumento(): Integer;
//  stdcall; external 'CONVECF.DLL';

function ECF_PalavraStatus(status: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_PalavraStatusBinario(status: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaErroExtendido(status: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaAcrescimoNF(acnf: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCFCancelados(cfc: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCNFCancelados(nfc: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCLX(clx: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCNFNV(Recebimento: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCNFV(Vinculado: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCOO(COO: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCRO(cro: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCRZ(crz: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCRZRestante(sRed: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaCancelamentoNF(cnf: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaDescontoNF(dnf: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaGNF(gnf: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaTempoImprimindo(MinImprim: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaTempoLigado(MinutosLigada: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaTotalPagamentos(FPag: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaTroco(troco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaRegistradoresNaoFiscais(rnf: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaRegistradoresFiscais(rf: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaValorComprovanteNaoFiscal
  (indice: pchar;
  Valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaIndiceComprovanteNaoFiscal
  (nome: pchar;
  indice: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CasasDecimaisProgramada(dval: pchar;
  dqt: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TempoEsperaCheque(segundos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_StatusCheque(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ImprimirCheque(banco: pchar;
  cidade: pchar;
  cdata: pchar;
  nominal: pchar;
  valor: pchar;
  pos: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ImprimirVersoCheque(texto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LiberarCheque(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraCodigoMICR(cmc7: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelarCheque(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramarLeiauteCheque(banco: pchar;
  geometria: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraLeiautesCheques(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DescontoSobreItemVendido(item: pchar;
  tipodesc: pchar;
  valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_AcrescimosICMSISS(vaicms: pchar;
  vaiss: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelamentosICMSISS(vcicms: pchar;
  vciss: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DescontosICMSISS(vdicms: pchar;
  vdiss: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraInformacaoUltimoDoc(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LeituraInformacaoUltimosCNF(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_VerificaRelatorioGerencialProgMFD(sRG: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_SegundaViaCNFV(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CancelamentoCNFV(ignorado: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TEF_ImprimirRespostaCartao(path: pchar;
  forma: pchar;
  trava: pchar;
  valor: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TEF_ImprimirResposta(path: pchar;
  forma: pchar;
  trava: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TEF_FechaRelatorio(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TEF_EsperarArquivo(path: pchar;
  segundos: pchar;
  trava: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TEF_TravarTeclado(trava: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ApagaTabelaNomesNaoFiscais(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ApagaTabelaNomesFormasdePagamento(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ApagaTabelaAliquotas(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ApagaTabelaNomesRelatoriosGerenciais(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ArquivoSintegra2004MFD(itipo: Integer;
  cArquivo: pchar;
  cMes: pchar;
  cAno: pchar;
  cMesf: pchar;
  cAnof: pchar;
  cRazaoSocial: pchar;
  cEndereco: pchar;
  cNumero: pchar;
  cComplemento: pchar;
  cBairro: pchar;
  cCidade: pchar;
  cUF: pchar;
  cCEP: pchar;
  cTelefone: pchar;
  cFax: pchar;
  cContato: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_LigaDesligaJanelas(impressora: pchar; resto: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_EnviarLogotipoCliche(path: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_GravarLogotipoCliche(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ExcluirLogotipoCliche(): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramarParametrosDiversos(ecf: pchar; loja: pchar;
  extra: pchar;
  qt: pchar;
  iss: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramarCliche(razao: pchar;
  fantasia: pchar;
  endereco: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_RetornaTipoEcf(tipo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TabelaMercadoriasServicos3404
  (destino: pchar;
  inicio: pchar;
  fim: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ProgramarTotalizadoresNaoTributados
  (f: pchar;
  i: pchar;
  n: pchar;
  fs: pchar;
  pis: pchar;
  ns: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ReproduzirMemoriaFiscalMFD
  (tipo: pchar;
  fxai: pchar;
  fxaf: pchar;
  asc: pchar;
  bin: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_TipoUltimoDocumento(tipo: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_GeraRegistrosCAT52MFD(pathbin: pchar; datas: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_CapturaDocunmentos(tipo, faixai,
  faixaf, arquivo, log: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_ConfigurarECF(gui: pchar;
  velo: pchar;
  modo: pchar;
  beep: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_DataHoraGravacaoUsuarioSWBasicoMFAdicional(
  datusu: pchar;
  datsof: pchar;
  Adic: pchar): Integer;
stdcall; external 'CONVECF.DLL';

function ECF_FlagsFiscais3MFD(var Flag: Integer): Integer;
stdcall; external 'CONVECF.DLL';
*)
implementation

end.

