unit uDeclaracaoDaruma;

interface
(*
uses uRecord;

// Métodos do Cupom Fiscal

 function Daruma_FI_AbreCupom( CPF_ou_CNPJ: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; Tipo_de_Quantidade: String; Quantidade: String; Casas_Decimais: Integer; Valor_Unitario: String; Tipo_de_Desconto: String; Valor_do_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; Valor_Unitario: String; Quantidade: String; Valor_do_Desconto: String; Valor_do_Acrescimo: String; Indice_Departamento: String; Unidade_Medida: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VendeItemTresDecimais( Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; Valor_Unitario: String; Acrescimo_ou_Desconto: String; Percentual_Acrescimo_ou_Desconto : String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_FechaCupomResumido( Descricao_da_Forma_de_Pagamento: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_IniciaFechamentoCupom( Acrescimo_ou_Desconto: String; Tipo_do_Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EfetuaFormaPagamento( Descricao_da_Forma_Pagamento: String; Valor_da_Forma_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EfetuaFormaPagamentoDescricaoForma( Descricao_da_Forma_Pagamento: string; Valor_da_Forma_Pagamento: string; Texto_Livre: string ): integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_IdentificaConsumidor( Nome_do_Consumidor: String; Endereco: String; CPF_ou_CNPJ: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_TerminaFechamentoCupom( Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_FechaCupom( Forma_de_Pagamento: String; Acrescimo_ou_Desconto: String; Tipo_Acrescimo_ou_Desconto: String; Valor_Acrescimo_ou_Desconto: String; Valor_Pago: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CancelaItemAnterior: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CancelaItemGenerico( Numero_Item: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CancelaCupom: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_AumentaDescricaoItem( Descricao_Extendida: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_UsaUnidadeMedida( Unidade_Medida: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EmitirCupomAdicional: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EstornoFormasPagamento( Forma_de_Origem: String; Nova_Forma: String; Valor_Total_Pago: String ): Integer; StdCall; External 'Daruma32.dll';  
 
  
 
 // Métodos para Recebimentos e Relatórios  
 
  
 
 function Daruma_FI_AbreComprovanteNaoFiscalVinculado( Forma_de_Pagamento: String; Valor_Pago: String; Numero_do_Cupom: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_UsaComprovanteNaoFiscalVinculado( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RelatorioGerencial( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_AbreRelatorioGerencial: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EnviarTextoCNF( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_FechaRelatorioGerencial: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RecebimentoNaoFiscal( Descricao_do_Totalizador: String; Valor_do_Recebimento: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_AbreRecebimentoNaoFiscal( Descricao_do_Totalizador: String; Acrescimo_ou_Desconto: String; Tipo_Acrescimo_ou_Desconto: String; Valor_Acrescimo_ou_Desconto: String; Valor_do_Recebimento: String; Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EfetuaFormaPagamentoNaoFiscal( Forma_de_Pagamento: String; Valor_da_Forma_Pagamento: String; Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_Sangria( Valor_da_Sangria: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_Suprimento( Valor_do_Suprimento: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_FundoCaixa( Valor_do_Fundo_Caixa: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_LeituraX: Integer; StdCall; External 'Daruma32.dll' ;  
 
 function Daruma_FI_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ReducaoZAjustaDataHora( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_LeituraMemoriaFiscalData( Data_Inicial: String; Data_Final: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_LeituraMemoriaFiscalReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_LeituraMemoriaFiscalSerialData( Data_Inicial: String; Data_Final: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_LeituraMemoriaFiscalSerialReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; StdCall; External 'Daruma32.dll';  
 
  
 
 // Métodos Gaveta, Autentica e Outras  
 
  
 
 function Daruma_FI_VerificaDocAutenticacao: Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_Autenticacao: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_Autenticacao';  
 
 function Daruma_FI_AutenticacaoStr( Autenticacao_Str :string ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_VerificaEstadoGaveta( Var Estado_Gaveta: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaEstadoGavetaStr( Estado_Gaveta: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_AcionaGaveta: Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_AbrePortaSerial: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_FechaPortaSerial: Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_AberturaDoDia( Valor_do_Suprimento: string; Forma_de_Pagamento: string ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_FechamentoDoDia: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_FechamentoDoDia';  
 
 function Daruma_FI_ImprimeConfiguracoesImpressora: Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_RegistraNumeroSerie: Integer; StdCall; External 'Daruma32.dll' ;  
 
 function Daruma_FI_VerificaNumeroSerie: Integer; StdCall; External 'Daruma32.dll' ;  
 
 function Daruma_FI_RetornaSerialCriptografado( SerialCriptografado :string; NumeroSerial: string ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_ConfiguraHorarioVerao( DataEntrada: string; DataSaida: string ; controle: string): Integer; StdCall; External 'Daruma32.dll' ;  
 
 function Daruma_FI_SaltarLinhas( Int_Linhas:Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
  
 
  
 
  
 
 // Métodos Prog e Config  
 
  
 
 function Daruma_FI_ProgramaAliquota( Valor_Aliquota: String; Tipo_Aliquota: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NomeiaTotalizadorNaoSujeitoIcms( Indice_do_Totalizador: Integer; Nome_do_Totalizador: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ProgramaFormasPagamento( Descricao_das_Formas_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ProgramaOperador( Nome_do_Operador: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ProgramaArredondamento: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ProgramaTruncamento: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_ProgramaTruncamento';  
 
 function Daruma_FI_LinhasEntreCupons( Linhas_Entre_Cupons: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EspacoEntreLinhas( Espaco_Entre_Linhas: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ProgramaHorarioVerao: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_EqualizaFormasPgto: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ProgramaVinculados( Vinculado: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ProgFormasPagtoSemVincular( Descricao_da_Forma_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';  
 
  
 
 // Métodos de Configuração e Registry  
 
  
 
 function Daruma_FI_CfgFechaAutomaticoCupom( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgRedZAutomatico( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgImpEstGavVendas( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgLeituraXAuto( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgCalcArredondamento( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgHorarioVerao( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgSensorAut( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgCupomAdicional( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgPermMensPromCNF( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgEspacamentoCupons( DistanciaCupons: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgHoraMinReducaoZ( Hora_Min_para_ReducaoZ: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CfgLimiarNearEnd( NumeroLinhas: String ): Integer; StdCall; External 'Daruma32.dll';  
 
  
 
 function Daruma_Registry_AplMensagem1(Str_AplMensagem_1: string): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_AplMensagem2(Str_AplMensagem_2: string): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_AlteraRegistry( Chave: String; ValorChave: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_Porta( Porta: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_Path( Path: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_Status( Status: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_StatusFuncao( StatusFuncao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_Retorno( Retorno: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_ControlePorta( ControlePorta: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_ModoGaveta( ModoGaveta: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_Log( Log: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_NomeLog( NomeLog: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_Separador( Separador: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_SeparaMsgPromo( SeparaMsgPromo: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_ZAutomatica( ZAutomatica: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_XAutomatica( XAutomatica: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_VendeItemUmaLinha( VendeItemUmaLinha: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_Default: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_RetornaValor( Produto: String; Chave: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_TerminalServer( TerminalServer: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_ErroExtendidoOk( ValorErro: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_AbrirDiaFiscal( AbrirDiaFiscal: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_VendaAutomatica( VendaAutomatica: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_IgnorarPoucoPapel( IgnorarPoucoPapel: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_ImprimeRegistry( Produto: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_Registry_TEF_NumeroLinhasImpressao( NumeroLinhasImpressao: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_MFD_ArredondaValor( Valor: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_MFD_ArredondaQuantidade( Quantidade: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_MFD_ProgramarSinalSonoro( NomeChave: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_MFD_LeituraMFCompleta( Valor: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_MFDValorFinal( ValorFinal: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_NumeroSerieNaoFormatado( Formatado: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_CupomAdicionalDll( AdicionalDll: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_CupomAdicionalDllConfig( ConfigAdicionalDll: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_PCExpanionLogin( FlagLogin: String ): Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_Registry_LogTamMaxMB( LogTamMaxMB: String ): Integer; StdCall; External 'Daruma32.dll'  
 
  
 
  
 
 // Métodos de Informações e Status  
 
 function Daruma_FI_StatusCupomFiscal( StatusCupomFiscal: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_StatusRelatorioGerencial( StatusRelGerencial: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_StatusComprovanteNaoFiscalVinculado( StatusCNFV: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_StatusComprovanteNaoFiscalNaoVinculado( StatusCNFNV: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaImpressoraLigada: Integer; StdCall; External 'Daruma32.dll'  
 
 function Daruma_FI_VerificaTotalizadoresParciais( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaModoOperacao( Modo: string ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaTotalizadoresNaoFiscais( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaTotalizadoresNaoFiscaisEx( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaTruncamento( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaAliquotasIss( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaRecebimentoNaoFiscal( Recebimentos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaStatusCheque( StatusCheque: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaModeloECF: Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaDescricaoFormasPagamento( Descricao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaXPendente( XPendente: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaZPendente( ZPendente: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaDiaAberto( DiaAberto: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaHorarioVerao( HoraioVerao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaFormasPagamentoEx( FormasEx: String ): Integer; StdCall; External 'Daruma32.dll';  
 
  
 
  
 
 function Daruma_FI_VerificaEpromConectada( Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornarVersaoDLL(Versao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ClicheProprietario( Cliche: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ClicheProprietarioEx( ClicheEx: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroLoja( NumeroLoja: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VersaoFirmware( VersaoFirmware: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_LerAliquotasComIndice(AliquotasComIndice: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_COO(Inicial: String; Final: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_MinutosImprimindo( Minutos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_MinutosLigada( Minutos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroSubstituicoesProprietario( NumeroSubstituicoes: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroIntervencoes( NumeroIntervencoes: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroReducoes( NumeroReducoes: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroCuponsCancelados( NumeroCancelamentos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_DataHoraReducao( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_DataMovimento( Data: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ContadoresTotalizadoresNaoFiscais( Contadores: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VendaBruta( VendaBruta: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_VendaBrutaAcumulada( VendaBrutaAcumulada: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_GrandeTotal( GrandeTotal: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_Descontos( ValorDescontos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_Acrescimos( ValorAcrescimos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_Cancelamentos( ValorCancelamentos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_DadosUltimaReducao( DadosReducao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_SubTotal( SubTotal: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_SaldoAPagar( SaldoAPagar: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_Troco( Troco: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ValorFormaPagamento( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_ValorTotalizadorNaoFiscal( Totalizador: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_UltimaFormaPagamento( Descricao_da_Forma: String; Valor_da_Forma: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_TipoUltimoDocumento(TipoUltimoDoc: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_MapaResumo: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_MapaResumo';  
 
 function Daruma_FI_RelatorioTipo60Analitico: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_RelatorioTipo60Analitico';  
 
 function Daruma_FI_RelatorioTipo60Mestre: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_RelatorioTipo60Mestre';  
 
 function Daruma_FI_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_FlagsFiscaisStr(Flag: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_PalavraStatus( PalavraStatus: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_PalavraStatusBinario( PalavraStatusBinario: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_SimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaErroExtendido( ErroExtendido: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaAcrescimoNF( AcrescimoNF: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCFCancelados( CFCancelados: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCNFCancelados( CNFCancelados: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCLX(CLX: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCNFNV(CNFNV: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCNFV(CNFV: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaDescricaoCNFV(CNFV: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCRO(CRO: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCRZ(CRZ: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCRZRestante( CRZRestante: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaCancelamentoNF( CancelamentoNF: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaDescontoNF( DescontoNF: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaGNF( GNF: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaTempoImprimindo( TempoImprimindo: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaTempoLigado( TempoLigado: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaTotalPagamentos( TotalPagamentos: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaTroco( Troco: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaValorComprovanteNaoFiscal( Indice_CNF: String; Informacao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaIndiceComprovanteNaoFiscal( DescricaoRegistrCNF: String; RefIndice: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaRegistradoresNaoFiscais( RegistrNaoFiscais: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FI_RetornaRegistradoresFiscais( RegistrFiscais: String ): Integer; StdCall; External 'Daruma32.dll';

  // Metodos exclusivos para MFD  
 
 function Daruma_RFD_GerarArquivo(DataInicial: String; DataFinal: String): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_DescontoAcrescimoItem(NumItemDescontoAcrescimo:String; DescAcres:String; TipoDescAcres:String; ValorDescAcres:String): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_StatusCupomFiscal( StatusCupomFiscal_Mfd: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_ImprimeCodigoBarras( Tipo: String; Codigo: String; Largura: String; Altura: String; Posicao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_RetornaInformacao( Indice: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_DownloadDaMFD(CoInicial: String; CoFinal: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_CasasDecimaisProgramada( Quantidade: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_IndicePrimeiroVinculado( Indice: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_TerminaFechamentoCupomCodigoBarras( Mensagem: String; Tipo: String ;Codigo: String ; Largura: String ; Altura: String ;Posicao: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_SinalSonoro( NumeroBeeps: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_AbreRelatorioGerencial( NomeRelatorio: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_VerificaRelatoriosGerenciais( Relatorios: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_ProgramaRelatoriosGerenciais( NomeRelatorio: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_EmitirCupomAdicional(): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_AcionarGuilhotina: Integer; StdCall; External 'Daruma32.dll' ;  
 
 function Daruma_FIMFD_EqualizarVelocidade(Valor: String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_AbreRecebimentoNaoFiscal( CPF: String; Nome: String; Endereco:String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_RecebimentoNaoFiscal( DescricaoTotalizador:String; AcresDesc:String; TipoAcresDesc:String; ValorAcresDesc:String; ValorRecebimento:String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_IniciaFechamentoNaoFiscal( AcresDesc:String; TipoAcresDesc:String; ValorAcresDesc:String): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_EfetuaFormaPagamentoNaoFiscal( FormaPgto:String; Valor:String; Observacao:String): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_TerminaFechamentoNaoFiscal( MsgPromo:String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_ProgramarGuilhotina( Separacao_entre_Documentos:String; Linhas_para_Acionamento_Guilhotina:String; Status_da_Guilhotina:String; Impressao_Antecipada_Cliche:String ): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_GTCodificado(GTCodificado: String):Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_Verifica_GTCodificado(GTCodificado: String):Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_NumeroSerialCodificado(NumeroSerialCodificado:String): Integer; StdCall; External 'Daruma32.dll';  
 
 function Daruma_FIMFD_Verifica_NumeroSerialCodificado(NumeroSerialCodificado:String): Integer; StdCall; External 'Daruma32.dll';

 function Daruma_Sintegra_GerarRegistrosArq( DataInicio: String; DataFim: String; Municipio: String; Fax: String; CodIdConvenio: String; CodIdNatureza: String; CodIdFinalidade: String; Logradouro: String; Numero: String; Complemento: String; Bairro: String; CEP: String; NomeContato: String; Telefone: String): Integer; StdCall; External 'Daruma32.dll';

 function Daruma_Sintegra_GerarRegistro60M( DataInicio: String; DataFim: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';  

 function Daruma_FIMFD_GerarAtoCotepePafData(DataIni: string; DataFim: string): Integer; StdCall; External 'Daruma32.dll';

 function Daruma_FIMFD_GerarAtoCotepePafCOO(COOIni: string; COOFim: string): Integer; StdCall; External 'Daruma32.dll';
*)
implementation

end.
