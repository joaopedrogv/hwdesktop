unit Uimpressoras;
                                 
interface              

uses DB, StdCtrls, Classes, SysUtils, forms, windows, dialogs, messages,
  Controls, inifiles, uImpressoraF{, uRecord, uDeclaracaoSweda, uDeclaracaoEpson,
  uDeclaracaoElgin, uDeclaracaoDaruma,uDeclaracaoBematech};

type
  TImpSWedaMFD = class(TImpressoraF);
  TImpBematech = class(TImpressoraF);
  TImpdaruma = class(TImpressoraF);
  TImpElgin = class(TImpressoraF);
  TImpEpson = class(TImpressoraF);
(*
  TImpSWedaMFD = class;
  TImpBematech = class;
  TImpdaruma = class;
  TImpElgin = class;
  TImpEpson = class;

  TImpSWedaMFD = class(TImpressoraF)
  private
    Retorno: Integer;
    Comando: array[0..512] of Char;
    Status: array[0..512] of Char;
    dadosZ: RegUltimaZ;
    Conteudo: array[0..3020] of char;
    vPortaAberta: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Analisa_iRetorno; override;
    function AbrePortaS(vportaCom: string): boolean; override;
    function AbrecomprovanteNaoFiscal(FormaPagamento: string; Valor: string; NumeroCupom: string):
      boolean; override;
    function VerificaImpressoraLigada: boolean; override;
    function FechaPortaSerial: boolean; override;
    function NumeroCupom: string; override;
    function RetornoImpressora(var ACK: Integer; var ST1: Integer; var ST2: Integer): boolean;
      override;
    function FechamentoDoDia: boolean; override;
    function RelatorioTipo60Mestre: boolean; override;
    function CancelaCupom(vsubtr: integer): boolean; override;
    function AcionaGaveta: boolean; override;
    function AbreCupom(CGC_CPF: string): boolean; override;
    function VendeItem(Codigo: string; Descricao: string; Aliquota: string; TipoQuantidade: string;
      Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
      TipoDesconto: string; Desconto1, Desconto2: real; nquant: real): boolean; override;
    function vendadeItens(ccodigo: string; cDescricao: string; cAliquota: string;
      cTipoQtde: string; cQtde: string; iCasasDecimais: integer; cValor: string;
      cTipoDesconto: string; cValorDesc: string): boolean;
    function DataHoraImpressora(Data: string; Hora: string): boolean; override;
    function AberturaDoDia(ValorCompra: string; FormaPagamento: string): boolean; override;
    function LeituraX: boolean; override;
    function SubTotal: string; override;
    function IniciaFechamentoCupom(AcrescimoDesconto: string; TipoAcrescimoDesconto: string;
      ValorAcrescimoDesconto: real): boolean; override;
    function EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: real; vcodFinal:
      integer): boolean; override;
    function TerminaFechamentoCupom(linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8:
      string): boolean; override;
    function ProgramaHorarioVerao: boolean; override;
    function CancelaItemGenerico(NumeroItem: real): boolean; override;
    function Sangria(Valor: string): boolean; override;
    function Suprimento(Valor: string; FormaPagamento: string): boolean; override;
    function AbreCupomMFD(CGC: string; Nome: string; Endereco: string): boolean; override;
    function NumeroSerieMFD: string; override;
    function LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalData(vdata1, vdata2, CompletaSimplificada: string): boolean;
      override;
    function NumeroSerie: string; override;
    function ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: string): boolean; override;
    function IniciaFechamentoCupomMFD(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimo,
      ValorDesconto: string): boolean; override;
    function EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas,
      DescricaoFormaPagto: string): boolean; override;
    function LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada, endereco:
      string): boolean; override;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: string):
      boolean;
      override;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura: string): boolean;
      override;
    function LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada:
      string): boolean;
      override;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
      boolean; override;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura:
      string): boolean; override;
    function RecebimentoNaoFiscal(IndiceTotalizador: string; Valor: string; FormaPagamento: string):
      boolean; override;
    function AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): boolean; override;
    function EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento: string): boolean;
      override;
    function FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean; override;
    function Retorno_impTEF: boolean; override;
    function AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento: string; Valor_Pago: string;
      Numero_do_Cupom: string): Integer; override;
    function FechaComprovanteNaoFiscalVinculado: Integer; override;
    function FechaComprovanteNaoFiscalVinculadoTEF: Integer; override;
    function FechaRelatorioGerencialTEF: Integer; override;
    function UsaComprovanteNaoFiscalVinculado(Texto: string): Integer; override;
    function RelatorioGerencial(Texto: string): Integer; override;
    function RelatorioGerencial2(Texto: string): Integer; override;
    function FechaRelatorioGerencial: Integer; override;
    function retorno_Imp: boolean; override;
    function retorno_ImpGer(vflap: integer): boolean; override;
    function LeTabelaResumo: boolean; override;
    procedure ImpResumoVnd; override;
    function cMascara(vvalor: real; vqtd: real; idx: integer; vdesc1: real; vdesc2: real): string;
      override;
    function cMascQuant(vqtd: real): string; override;
    function Descricaoimp(vdesc: string): string; override;
    function convNumero(var Valor: real): real; override;
    function convNumero2(var Valor1: real): string; override;
    function defAtribTef: string; override;
    function DefCodFinalPrazo: string; override;
    function Imprime_Prazo: boolean; override;
    function PrazoECF: boolean; override;
    function DesprogramaHorarioVerao: boolean; override;
    function verificaPapel: boolean; override;
    function FecharOp: boolean; override;
    function defvalsangsup(vvalsangsup: real): string; override;
    function fechaCupom: boolean; override; //nao usado
    function abrerelatorioGer: boolean; override;
    function ImpTirouZSoz(vdat1: Tdate; Vdat2: Tdate): boolean; override;
    procedure regconfPorta(vport: string); override;
    function MontaDescricao(vdesc, vunidade: string): string; override;
    function numeroCOO: string; override;
    function numeroCCF: string; override;
    function numeroGNF: string; override;
    function numeroGRG: string; override;
    function numeroCDC: string; override;
    function numeroCER: string; override;
    function diaCaixaFechado: Boolean; override;
    procedure ImpDavsEmitidos; override;
    procedure ImpDavsOSEmitidos; override;
    procedure ImpMeiosDePagamento; override;
    procedure ImpIdentificacaoPAFECF; override;
    function imprimeDavNoEcf(dav: RVenda): boolean; override;
    function getGrandeTotal: string; override;
    function cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string; codigo: integer): Integer;
      override;
    procedure recuperacaoAutomaticaAliquotas; override;
    function espelhoMFDporData(dataInicial, dataFinal, tipo, endereco, codProp: string): boolean;
      override;
    function espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco, codProp: string): boolean;
      override;
    function arquivoMFDCotepe1704porData(dataInicial, dataFinal, endereco, codProp, pTipo: string):
      boolean; override;
    function arquivoMFDCotepe1704porCOO(cooInicial, cooFinal, endereco, codProp, pTipo: string): boolean;
      override;
    function dataHoraUltimoDocumento: string; override;
    procedure montaMaparesumo; override;
    function cupomAberto: boolean; override;
    procedure cancelaCupomTEF; override;
    function obterCNPJUsuario:string;override;
    procedure acionaCortePapel(corteCompleto, gerencial:boolean);override;
    function Retorno_Impressora:boolean;override;
    function Verifica_Impressora:boolean;override;
    function existeReducaoZPendente:Integer;override;
    procedure defineArredondamentoTruncamento;override;
    function VendeItemSimples(pCodigo: string; pDescricao, pAliquota: string;
      pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean; override;
    function CancelamentoNaoFiscal:boolean;override;
    function estadoDeEmissaoDoCupomFiscal: integer;override;
    function ValorPagoCupomAtual: string; override;
    function gerarArquivosConferenciaSintegraSPED(vNomeArqSint, vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean; override;
    procedure EqualizarVelocidade; override;
  end;

  TImpBematech = class(TImpressoraF)
  private
    iRetorno: integer;
    vPortaAberta, vRetExtHab: Boolean;
		function getVendaBruta(cooRed:integer):string;overload;
		function getVendaBruta(cooRed:integer;dataEmissaoZ:string):string;overload;
    function getRetornoExtendidoST3:integer;
    //    function retorno_ImpBema: boolean;
    //    function retorno_ImpBemaGer(vflap: integer): boolean;
    function gerarArquivoMFD(pTipo, pFormato, pParam1, pParam2, pEnderecoArq: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function AbrePortaS(vportaCom: string): boolean; override;
    function AbrecomprovanteNaoFiscal(FormaPagamento: string; Valor: string; NumeroCupom: string):
      boolean; override;
    function VerificaImpressoraLigada: boolean; override;
    function FechaPortaSerial: boolean; override;
    function NumeroCupom: string; override;
    function RetornoImpressora(var ACK: Integer; var ST1: Integer; var ST2: Integer): boolean;
      override;
    function FechamentoDoDia: boolean; override;
    function RelatorioTipo60Mestre: boolean; override;
    function CancelaCupom(vsubtr: integer): boolean; override;
    function AcionaGaveta: boolean; override;
    function AbreCupom(CGC_CPF: string): boolean; override;
    function VendeItem(Codigo: string; Descricao: string; Aliquota: string; TipoQuantidade: string;
      Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
      TipoDesconto: string; Desconto1, Desconto2: real; nquant: real): boolean; override;
    function DataHoraImpressora(Data: string; Hora: string): boolean; override;
    function AberturaDoDia(ValorCompra: string; FormaPagamento: string): boolean; override;
    function LeituraX: boolean; override;
    function SubTotal: string; override;
    function IniciaFechamentoCupom(AcrescimoDesconto: string; TipoAcrescimoDesconto: string;
      ValorAcrescimoDesconto: real): boolean; override;
    function EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: real; vcodFinal:
      integer): boolean; override;
    function TerminaFechamentoCupom(linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8:
      string): boolean; override;
    function ProgramaHorarioVerao: boolean; override;
    function CancelaItemGenerico(NumeroItem: real): boolean; override;
    function Sangria(Valor: string): boolean; override;
    function Suprimento(Valor: string; FormaPagamento: string): boolean; override;
    function AbreCupomMFD(CGC: string; Nome: string; Endereco: string): boolean; override;
    function NumeroSerieMFD: string; override;
    function LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalData(vdata1, vdata2, CompletaSimplificada: string): boolean;
      override;
    function NumeroSerie: string; override;
    function ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: string): boolean; override;
    function IniciaFechamentoCupomMFD(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimo,
      ValorDesconto: string): boolean; override;
    function EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas,
      DescricaoFormaPagto: string): boolean; override;
    function LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada, endereco:
      string): boolean; override;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: string):
      boolean;
      override;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura: string): boolean;
      override;
    function LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada:
      string): boolean;
      override;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
      boolean; override;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura:
      string): boolean; override;
    function RecebimentoNaoFiscal(IndiceTotalizador: string; Valor: string; FormaPagamento: string):
      boolean; override;
    function AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): boolean; override;
    function EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento: string): boolean;
      override;
    function FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean; override;
    function cMascara(vvalor: real; vqtd: real; idx: integer; vdesc1: real; vdesc2: real): string;
      override;
    function AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento: string; Valor_Pago: string;
      Numero_do_Cupom: string): Integer; override;
    function FechaComprovanteNaoFiscalVinculado: Integer; override;
    function FechaComprovanteNaoFiscalVinculadoTEF: Integer; override;
    function FechaRelatorioGerencialTEF: Integer; override;
    function UsaComprovanteNaoFiscalVinculado(Texto: string): Integer; override;
    function RelatorioGerencial(Texto: string): Integer; override;
    function RelatorioGerencial2(Texto: string): Integer; override;
    function FechaRelatorioGerencial: Integer; override;
    function retorno_Imp: boolean; override;
    function retorno_ImpGer(vflap: integer): boolean; override;
    function Retorno_impTEF: boolean; override;
    function LeTabelaResumo: boolean; override;
    procedure Analisa_iRetorno; override;
    function cMascQuant(vqtd: real): string; override;
    function Descricaoimp(vdesc: string): string; override;
    function convNumero(var Valor: real): real; override;
    function convNumero2(var Valor1: real): string; override;
    function vendadeItensBema(ccodigo: string; cDescricao: string; cAliquota: string;
      cTipoQtde: string; cQtde: string; iCasasDecimais: integer; cValor: string;
      cTipoDesconto: string; cValorDesc: string): boolean;
    function defAtribTef: string; override;
    function DefCodFinalPrazo: string; override;
    function Imprime_Prazo: boolean; override;
    function PrazoECF: boolean; override;
    function fechaCupom: boolean; override; //nao usado
    function DesprogramaHorarioVerao: boolean; override;
    function verificaPapel: boolean; override;
    function FecharOp: boolean; override;
    procedure ImpResumoVnd; override;
    function defvalsangsup(vvalsangsup: real): string; override;
    function abrerelatorioGer: boolean; override;
    function ImpTirouZSoz(vdat1: Tdate; Vdat2: Tdate): boolean; override;
    procedure regconfPorta(vport: string); override;
    function MontaDescricao(vdesc, vunidade: string): string; override;
    function numeroCOO: string; override;
    function numeroCCF: string; override;
    function numeroGNF: string; override;
    function numeroGRG: string; override;
    function numeroCDC: string; override;
    function numeroCER: string; override;
    function diaCaixaFechado: Boolean; override;
    procedure ImpDavsEmitidos; override;
    procedure ImpDavsOSEmitidos; override;
    procedure ImpMeiosDePagamento; override;
    procedure ImpIdentificacaoPAFECF; override;
    function imprimeDavNoEcf(dav: RVenda): boolean; override;
    function getGrandeTotal: string; override;
    function cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string; codigo: integer): Integer;
      override;
    procedure recuperacaoAutomaticaAliquotas; override;
    function espelhoMFDporData(dataInicial, dataFinal, tipo, endereco, codProp: string): boolean;
      override;
    function espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco, codProp: string): boolean;
      override;
    function arquivoMFDCotepe1704porData(dataInicial, dataFinal, endereco, codProp, pTipo: string):
      boolean; override;
    function arquivoMFDCotepe1704porCOO(cooInicial, cooFinal, endereco, codProp, pTipo: string): boolean;
      override;
    function dataHoraUltimoDocumento: string; override;
    procedure montaMaparesumo; override;
    function cupomAberto: boolean; override;
    procedure cancelaCupomTEF; override;
    function obterCNPJUsuario:string;override;
    procedure acionaCortePapel(corteCompleto, gerencial:boolean);override;
    function Retorno_Impressora:boolean; override;
    function Verifica_Impressora:boolean; override;
    function existeReducaoZPendente:Integer;override;
    procedure defineArredondamentoTruncamento;override;
    function VendeItemSimples(pCodigo: string; pDescricao, pAliquota: string;
      pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean; override;
    function CancelamentoNaoFiscal:boolean;override;
    function estadoDeEmissaoDoCupomFiscal: integer;override;
    function ValorPagoCupomAtual: string; override;
    function gerarArquivosConferenciaSintegraSPED(vNomeArqSint, vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean; override;
    procedure EqualizarVelocidade; override;
  end;

  TImpdaruma = class(TImpressoraF)
  private
    iRetorno: integer;
    //    function retorno_ImpBema: boolean;
    //    function retorno_ImpBemaGer(vflap: integer): boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function AbrePortaS(vportaCom: string): boolean; override;
    function AbrecomprovanteNaoFiscal(FormaPagamento: string; Valor: string; NumeroCupom: string):
      boolean; override;
    function VerificaImpressoraLigada: boolean; override;
    function FechaPortaSerial: boolean; override;
    function NumeroCupom: string; override;
    function RetornoImpressora(var ACK: Integer; var ST1: Integer; var ST2: Integer): boolean;
      override;

    function FechamentoDoDia: boolean; override;
    function RelatorioTipo60Mestre: boolean; override;
    function CancelaCupom(vsubtr: integer): boolean; override;
    function AcionaGaveta: boolean; override;
    function AbreCupom(CGC_CPF: string): boolean; override;
    function VendeItem(Codigo: string; Descricao: string; Aliquota: string; TipoQuantidade: string;
      Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
      TipoDesconto: string; Desconto1, Desconto2: real; nquant: real): boolean; override;
    function DataHoraImpressora(Data: string; Hora: string): boolean; override;
    function AberturaDoDia(ValorCompra: string; FormaPagamento: string): boolean; override;
    function LeituraX: boolean; override;
    function SubTotal: string; override;
    function IniciaFechamentoCupom(AcrescimoDesconto: string; TipoAcrescimoDesconto: string;
      ValorAcrescimoDesconto: real): boolean; override;
    function EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: real; vcodFinal:
      integer): boolean; override;
    function TerminaFechamentoCupom(linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8:
      string): boolean; override;
    function ProgramaHorarioVerao: boolean; override;
    function CancelaItemGenerico(NumeroItem: real): boolean; override;
    function Sangria(Valor: string): boolean; override;
    function Suprimento(Valor: string; FormaPagamento: string): boolean; override;
    function AbreCupomMFD(CGC: string; Nome: string; Endereco: string): boolean; override;
    function NumeroSerieMFD: string; override;
    function LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalData(vdata1, vdata2, CompletaSimplificada: string): boolean;
      override;
    function NumeroSerie: string; override;
    function ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: string): boolean; override;
    function IniciaFechamentoCupomMFD(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimo,
      ValorDesconto: string): boolean; override;
    function EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas,
      DescricaoFormaPagto: string): boolean; override;
    function LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: string):
      boolean;
      override;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura: string): boolean;
      override;
    function LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada:
      string): boolean;
      override;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
      boolean; override;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura:
      string): boolean; override;
    function RecebimentoNaoFiscal(IndiceTotalizador: string; Valor: string; FormaPagamento: string):
      boolean; override;
    function AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): boolean; override;
    function EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento: string): boolean;
      override;
    function FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean; override;
    function cMascara(vvalor: real; vqtd: real; idx: integer; vdesc1: real; vdesc2: real): string;
      override;
    function AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento: string; Valor_Pago: string;
      Numero_do_Cupom: string): Integer; override;
    function FechaComprovanteNaoFiscalVinculado: Integer; override;
    function FechaComprovanteNaoFiscalVinculadoTEF: Integer; override;
    function FechaRelatorioGerencialTEF: Integer; override;
    function UsaComprovanteNaoFiscalVinculado(Texto: string): Integer; override;
    function RelatorioGerencial(Texto: string): Integer; override;
    function RelatorioGerencial2(Texto: string): Integer; override;
    function FechaRelatorioGerencial: Integer; override;
    function retorno_Imp: boolean; override;
    function retorno_ImpGer(vflap: integer): boolean; override;
    function Retorno_impTEF: boolean; override;
    function LeTabelaResumo: boolean; override;
    procedure Analisa_iRetorno; override;
    procedure ProgramaF;
    function cMascQuant(vqtd: real): string; override;
    function Descricaoimp(vdesc: string): string; override;
    function convNumero(var Valor: real): real; override;
    function convNumero2(var Valor1: real): string; override;
    function vendadeItensBema(ccodigo: string; cDescricao: string; cAliquota: string;
      cTipoQtde: string; cQtde: string; iCasasDecimais: integer; cValor: string;
      cTipoDesconto: string; cValorDesc: string): boolean;
    function defAtribTef: string; override;
    function DefCodFinalPrazo: string; override;
    function Imprime_Prazo: boolean; override;
    function PrazoECF: boolean; override;
    function fechaCupom: boolean; override; //nao usado
    function DesprogramaHorarioVerao: boolean; override;
    function verificaPapel: boolean; override;
    function FecharOp: boolean; override;
    procedure ImpResumoVnd; override;
    function defvalsangsup(vvalsangsup: real): string; override;
    function abrerelatorioGer: boolean; override;
    function ImpTirouZSoz(vdat1: Tdate; Vdat2: Tdate): boolean; override;
    procedure regconfPorta(vport: string); override;
    function MontaDescricao(vdesc, vunidade: string): string; override;
    function numeroCOO: string; override;
    function numeroCCF: string; override;
    function numeroGNF: string; override;
    function numeroGRG: string; override;
    function numeroCDC: string; override;
    function numeroCER: string; override;
    function diaCaixaFechado: Boolean; override;
    procedure ImpDavsEmitidos; override;
    procedure ImpDavsOSEmitidos; override;
    procedure ImpMeiosDePagamento; override;
    procedure ImpIdentificacaoPAFECF; override;
    function imprimeDavNoEcf(dav: RVenda): boolean; override;
    function getGrandeTotal: string; override;
    function cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string; codigo: integer): Integer;
      override;
    procedure recuperacaoAutomaticaAliquotas; override;
    function alteraRegistro(Str_Nome_da_Chave, Str_Valor_da_Chave: string): boolean;
    function espelhoMFDporData(dataInicial, dataFinal, tipo, endereco, codProp: string): boolean;
      override;
    function espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco, codProp: string): boolean;
      override;
    function arquivoMFDCotepe1704porData(dataInicial, dataFinal, endereco, codProp, pTipo: string):
      boolean; override;
    function arquivoMFDCotepe1704porCOO(cooInicial, cooFinal, endereco, codProp, pTipo: string): boolean;
      override;
    function dataHoraUltimoDocumento: string; override;
    procedure montaMaparesumo; override;
    function cupomAberto: boolean; override;
    function obterCNPJUsuario:string;override;
    procedure acionaCortePapel(corteCompleto, gerencial:boolean);override;
    function Retorno_Impressora:boolean;override;
    function Verifica_Impressora:boolean;override;
    function existeReducaoZPendente:Integer;override;
    procedure defineArredondamentoTruncamento;override;
    function VendeItemSimples(pCodigo: string; pDescricao, pAliquota: string;
      pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean; override;
    function CancelamentoNaoFiscal:boolean;override;
    function estadoDeEmissaoDoCupomFiscal: integer;override;
    function ValorPagoCupomAtual: string; override;
    function gerarArquivosConferenciaSintegraSPED(vNomeArqSint, vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean; override;
    procedure EqualizarVelocidade; override;
  end;

  TImpElgin = class(TImpressoraF)
  private
    iRetorno: integer;
    vRetExtHab: Boolean;
    strMensagemErro: string;
    function ObtemRetornoECF(var strMensagemErro: String): Boolean;
    function _RetornoImpressora(var iCodErro: integer; var strErroMsg: string): Integer;
    //    function retorno_ImpBema: boolean;
    //    function retorno_ImpBemaGer(vflap: integer): boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function AbrePortaS(vportaCom: string): boolean; override;
    function AbrecomprovanteNaoFiscal(FormaPagamento: string; Valor: string; NumeroCupom: string):
      boolean; override;
    function VerificaImpressoraLigada: boolean; override;
    function FechaPortaSerial: boolean; override;
    function NumeroCupom: string; override;
    function RetornoImpressora(var ACK: Integer; var ST1: Integer; var ST2: Integer): boolean;
      override;
    function FechamentoDoDia: boolean; override;
    function RelatorioTipo60Mestre: boolean; override;
    function CancelaCupom(vsubtr: integer): boolean; override;
    function AcionaGaveta: boolean; override;
    function AbreCupom(CGC_CPF: string): boolean; override;
    function VendeItem(Codigo: string; Descricao: string; Aliquota: string; TipoQuantidade: string;
      Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
      TipoDesconto: string; Desconto1, Desconto2: real; nquant: real): boolean; override;
    function DataHoraImpressora(Data: string; Hora: string): boolean; override;
    function AberturaDoDia(ValorCompra: string; FormaPagamento: string): boolean; override;
    function LeituraX: boolean; override;
    function SubTotal: string; override;
    function IniciaFechamentoCupom(AcrescimoDesconto: string; TipoAcrescimoDesconto: string;
      ValorAcrescimoDesconto: real): boolean; override;
    function EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: real; vcodFinal:
      integer): boolean; override;
    function TerminaFechamentoCupom(linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8:
      string): boolean; override;
    function ProgramaHorarioVerao: boolean; override;
    function CancelaItemGenerico(NumeroItem: real): boolean; override;
    function Sangria(Valor: string): boolean; override;
    function Suprimento(Valor: string; FormaPagamento: string): boolean; override;
    function AbreCupomMFD(CGC: string; Nome: string; Endereco: string): boolean; override;
    function NumeroSerieMFD: string; override;
    function LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalData(vdata1, vdata2, CompletaSimplificada: string): boolean;
      override;
    function NumeroSerie: string; override;
    function ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: string): boolean; override;
    function IniciaFechamentoCupomMFD(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimo,
      ValorDesconto: string): boolean; override;
    function EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas,
      DescricaoFormaPagto: string): boolean; override;
    function LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: string):
      boolean;
      override;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura: string): boolean;
      override;
    function LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada:
      string): boolean;
      override;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
      boolean; override;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura:
      string): boolean; override;
    function RecebimentoNaoFiscal(IndiceTotalizador: string; Valor: string; FormaPagamento: string):
      boolean; override;
    function AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): boolean; override;
    function EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento: string): boolean;
      override;
    function FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean; override;
    function cMascara(vvalor: real; vqtd: real; idx: integer; vdesc1: real; vdesc2: real): string;
      override;
    function AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento: string; Valor_Pago: string;
      Numero_do_Cupom: string): Integer; override;
    function FechaComprovanteNaoFiscalVinculado: Integer; override;
    function FechaComprovanteNaoFiscalVinculadoTEF: Integer; override;
    function FechaRelatorioGerencialTEF: Integer; override;
    function UsaComprovanteNaoFiscalVinculado(Texto: string): Integer; override;
    function RelatorioGerencial(Texto: string): Integer; override;
    function RelatorioGerencial2(Texto: string): Integer; override;
    function FechaRelatorioGerencial: Integer; override;
    function retorno_Imp: boolean; override;
    function retorno_ImpGer(vflap: integer): boolean; override;
    function Retorno_impTEF: boolean; override;
    function LeTabelaResumo: boolean; override;
    procedure Analisa_iRetorno; override;
    function cMascQuant(vqtd: real): string; override;
    function Descricaoimp(vdesc: string): string; override;
    function convNumero(var Valor: real): real; override;
    function convNumero2(var Valor1: real): string; override;
    function vendadeItensBema(ccodigo: string; cDescricao: string; cAliquota: string;
      cTipoQtde: string; cQtde: string; iCasasDecimais: integer; cValor: string;
      cTipoDesconto: string; cValorDesc: string): boolean;
    function defAtribTef: string; override;
    function DefCodFinalPrazo: string; override;
    function Imprime_Prazo: boolean; override;
    function PrazoECF: boolean; override;
    function fechaCupom: boolean; override; //nao usado
    function DesprogramaHorarioVerao: boolean; override;
    function verificaPapel: boolean; override;
    function FecharOp: boolean; override;
    procedure ImpResumoVnd; override;
    function defvalsangsup(vvalsangsup: real): string; override;
    function abrerelatorioGer: boolean; override;
    function ImpTirouZSoz(vdat1: Tdate; Vdat2: Tdate): boolean; override;
    procedure regconfPorta(vport: string); override;
    function MontaDescricao(vdesc, vunidade: string): string; override;
    function numeroCOO: string; override;
    function numeroCCF: string; override;
    function numeroGNF: string; override;
    function numeroGRG: string; override;
    function numeroCDC: string; override;
    function numeroCER: string; override;
    function diaCaixaFechado: Boolean; override;
    procedure ImpDavsEmitidos; override;
    procedure ImpDavsOSEmitidos; override;
    procedure ImpMeiosDePagamento; override;
    procedure ImpIdentificacaoPAFECF; override;
    function imprimeDavNoEcf(dav: RVenda): boolean; override;
    function getGrandeTotal: string; override;
    function cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string; codigo: integer): Integer;
      override;
    procedure recuperacaoAutomaticaAliquotas; override;
    function espelhoMFDporData(dataInicial, dataFinal, tipo, endereco, codProp: string): boolean;
      override;
    function espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco, codProp: string): boolean;
      override;
    function arquivoMFDCotepe1704porData(dataInicial, dataFinal, endereco, codProp, pTipo: string):
      boolean; override;
    function arquivoMFDCotepe1704porCOO(cooInicial, cooFinal, endereco, codProp, pTipo: string): boolean;
      override;
    function dataHoraUltimoDocumento: string; override;
    procedure montaMaparesumo; override;
    function cupomAberto: boolean; override;
    function obterCNPJUsuario:string;override;
    procedure acionaCortePapel(corteCompleto, gerencial:boolean);override;
    function Retorno_Impressora:boolean;override;
    function Verifica_Impressora:boolean;override;
    function existeReducaoZPendente:Integer;override;
    procedure defineArredondamentoTruncamento;override;
    function VendeItemSimples(pCodigo: string; pDescricao, pAliquota: string;
      pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean; override;
    function CancelamentoNaoFiscal:boolean;override;
    function estadoDeEmissaoDoCupomFiscal: integer;override;
    function ValorPagoCupomAtual: string; override;
    function gerarArquivosConferenciaSintegraSPED(vNomeArqSint, vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean; override;
    procedure EqualizarVelocidade; override;
  end;

  TImpEpson = class(TImpressoraF)
  private
    iRetorno: integer;
    procedure verificaErroDadosReducao;
    //    function retorno_ImpBema: boolean;
    //    function retorno_ImpBemaGer(vflap: integer): boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function AbrePortaS(vportaCom: string): boolean; override;
    function AbrecomprovanteNaoFiscal(FormaPagamento: string; Valor: string; NumeroCupom: string):
      boolean; override;
    function VerificaImpressoraLigada: boolean; override;
    function FechaPortaSerial: boolean; override;
    function NumeroCupom: string; override;
    function RetornoImpressora(var ACK: Integer; var ST1: Integer; var ST2: Integer): boolean;
      override;
    function FechamentoDoDia: boolean; override;
    function RelatorioTipo60Mestre: boolean; override;
    function CancelaCupom(vsubtr: integer): boolean; override;
    function AcionaGaveta: boolean; override;
    function AbreCupom(CGC_CPF: string): boolean; override;
    function VendeItem(Codigo: string; Descricao: string; Aliquota: string; TipoQuantidade: string;
      Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
      TipoDesconto: string; Desconto1, Desconto2: real; nquant: real): boolean; override;
    function DataHoraImpressora(Data: string; Hora: string): boolean; override;
    function AberturaDoDia(ValorCompra: string; FormaPagamento: string): boolean; override;
    function LeituraX: boolean; override;
    function SubTotal: string; override;
    function IniciaFechamentoCupom(AcrescimoDesconto: string; TipoAcrescimoDesconto: string;
      ValorAcrescimoDesconto: real): boolean; override;
    function EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: real; vcodFinal:
      integer): boolean; override;
    function TerminaFechamentoCupom(linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8:
      string): boolean; override;
    function ProgramaHorarioVerao: boolean; override;
    function CancelaItemGenerico(NumeroItem: real): boolean; override;
    function Sangria(Valor: string): boolean; override;
    function Suprimento(Valor: string; FormaPagamento: string): boolean; override;
    function AbreCupomMFD(CGC: string; Nome: string; Endereco: string): boolean; override;
    function NumeroSerieMFD: string; override;
    function LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalData(vdata1, vdata2, CompletaSimplificada: string): boolean;
      override;
    function NumeroSerie: string; override;
    function ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: string): boolean; override;
    function IniciaFechamentoCupomMFD(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimo,
      ValorDesconto: string): boolean; override;
    function EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas,
      DescricaoFormaPagto: string): boolean; override;
    function LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada,
      endereco: string): boolean; override;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: string):
      boolean;
      override;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura: string): boolean;
      override;
    function LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada:
      string): boolean;
      override;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
      boolean; override;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura:
      string): boolean; override;
    function RecebimentoNaoFiscal(IndiceTotalizador: string; Valor: string; FormaPagamento: string):
      boolean; override;
    function AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): boolean; override;
    function EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento: string): boolean;
      override;
    function FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean; override;
    function cMascara(vvalor: real; vqtd: real; idx: integer; vdesc1: real; vdesc2: real): string;
      override;
    function AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento: string; Valor_Pago: string;
      Numero_do_Cupom: string): Integer; override;
    function FechaComprovanteNaoFiscalVinculado: Integer; override;
    function FechaComprovanteNaoFiscalVinculadoTEF: Integer; override;
    function FechaRelatorioGerencialTEF: Integer; override;
    function UsaComprovanteNaoFiscalVinculado(Texto: string): Integer; override;
    function RelatorioGerencial(Texto: string): Integer; override;
    function RelatorioGerencial2(Texto: string): Integer; override;
    function FechaRelatorioGerencial: Integer; override;
    function retorno_Imp: boolean; override;
    function retorno_ImpGer(vflap: integer): boolean; override;
    function Retorno_impTEF: boolean; override;
    function LeTabelaResumo: boolean; override;
    procedure Analisa_iRetorno; override;
    function cMascQuant(vqtd: real): string; override;
    function Descricaoimp(vdesc: string): string; override;
    function convNumero(var Valor: real): real; override;
    function convNumero2(var Valor1: real): string; override;
    function vendadeItensBema(ccodigo: string; cDescricao: string; cAliquota: string;
      cTipoQtde: string; cQtde: string; iCasasDecimais: integer; cValor: string;
      cTipoDesconto: string; cValorDesc: string): boolean;
    function defAtribTef: string; override;
    function DefCodFinalPrazo: string; override;
    function Imprime_Prazo: boolean; override;
    function PrazoECF: boolean; override;
    function fechaCupom: boolean; override; //nao usado
    function DesprogramaHorarioVerao: boolean; override;
    function verificaPapel: boolean; override;
    function FecharOp: boolean; override;
    procedure ImpResumoVnd; override;
    function defvalsangsup(vvalsangsup: real): string; override;
    function abrerelatorioGer: boolean; override;
    function ImpTirouZSoz(vdat1: Tdate; Vdat2: Tdate): boolean; override;
    procedure regconfPorta(vport: string); override;
    function MontaDescricao(vdesc, vunidade: string): string; override;
    function numeroCOO: string; override;
    function numeroCCF: string; override;
    function numeroGNF: string; override;
    function numeroGRG: string; override;
    function numeroCDC: string; override;
    function numeroCER: string; override;
    function diaCaixaFechado: Boolean; override;
    procedure ImpDavsEmitidos; override;
    procedure ImpDavsOSEmitidos; override;
    procedure ImpMeiosDePagamento; override;
    procedure ImpIdentificacaoPAFECF; override;
    function imprimeDavNoEcf(dav: RVenda): boolean; override;
    function getGrandeTotal: string; override;
    function cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string; codigo: integer): Integer;
      override;
    procedure recuperacaoAutomaticaAliquotas; override;
    function espelhoMFDporData(dataInicial, dataFinal, tipo, endereco, codProp: string): boolean;
      override;
    function espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco, codProp: string): boolean;
      override;
    function arquivoMFDCotepe1704porData(dataInicial, dataFinal, endereco, codProp, pTipo: string):
      boolean; override;
    function arquivoMFDCotepe1704porCOO(cooInicial, cooFinal, endereco, codProp, pTipo: string): boolean;
      override;
    function dataHoraUltimoDocumento: string; override;
    procedure montaMaparesumo; override;
    function cupomAberto: boolean; override;
    function obterCNPJUsuario:string;override;
    procedure acionaCortePapel(corteCompleto, gerencial:boolean);override;
    function Retorno_Impressora:boolean;override;
    function Verifica_Impressora:boolean;override;
    function existeReducaoZPendente:Integer;override;
    procedure defineArredondamentoTruncamento;override;
    function VendeItemSimples(pCodigo: string; pDescricao, pAliquota: string;
      pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean; override;
    function CancelamentoNaoFiscal:boolean;override;
    function estadoDeEmissaoDoCupomFiscal: integer;override;
    function ValorPagoCupomAtual: string; override;
    function gerarArquivosConferenciaSintegraSPED(vNomeArqSint, vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean; override;
    procedure EqualizarVelocidade; override;
  end;

*)

implementation

(*

uses uPrincipalF, uDtmDAVF, uCadastrosF, uDadosIni, Registry, uDtmAtivo, uCupom,
  uDadosIniFiscal, DateUtils, uDataSet_OOP;

function BlockInput(block: boolean): DWORD; stdcall; external 'user32.DLL';

{ TImpBematech }

function TImpBematech.AberturaDoDia(ValorCompra,
  FormaPagamento: string): boolean;
var
  scomando: string;
  iresp: integer;
begin
  Result := true;
  if vTipoImpressora = 'BematechMP20' then
  begin
    //      FPrinter.FechaComunicacao;
    //     iretorno:=Bematech_FI_AbrePortaSerial;
    Bematech_FI_FechaPortaSerial;
    if vFvPorta = 1 then
      iResp := IniPortaStr(Pchar('COM1'));
    if vFvPorta = 2 then
      iResp := IniPortaStr(Pchar('COM2'));
    if vFvPorta = 3 then
      iResp := IniPortaStr(Pchar('COM3'));
    //             AbrePorta();
    obFinalizador.getTodos;
    obFinalizador.first;
    sComando := #27 + '|73|';
    obFinalizador.getTodos;
    obFinalizador.First;
    while not obFinalizador.eof do
    begin
      if obFinalizador.dataSet.FieldByName('Cod_finalizador').AsInteger <> 1 then
        //      uppercase(dm.TbFinalizadoresNome_Finalizador.value) <> 'DINHEIRO' then
      begin
        sComando := sComando +
          trim(obFinalizador.dataSet.FieldByName('descricao').AsString) +
          vDadosIniF.Space(16 -
          Length(trim(obFinalizador.dataSet.FieldByName('descricao').AsString))) + '|';
      end;
      obFinalizador.next;
    end;
    sComando := sComando + #27;
    obFinalizador.first;
    iResp := FormataTX(PChar(sComando));
    iResp := FechaPorta();
    iretorno := Bematech_FI_AbrePortaSerial;
    Analisa_iRetorno;
    iRetorno := Bematech_FI_AberturaDoDia(pchar('0,00'), pchar(''));
  end;

  if (vTipoImpressora = 'BematechMFD') then
  begin
    obFinalizador.getTodos;
    obFinalizador.first;
    while not obFinalizador.eof do
    begin
      if obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger <> 1 then
        //            obFinalizadorNome_Finalizador.value <> 'DINHEIRO' then
      begin
        if obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1 then
          iRetorno :=
            Bematech_FI_ProgramaFormaPagamentoMFD(pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1, 16)),
            '1')
        else
          iRetorno :=
            Bematech_FI_ProgramaFormaPagamentoMFD(pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1, 16)),
            '0');
        Analisa_iRetorno;
        //       if iretorno <> 1 then
        //       begin
      end;
      obFinalizador.next;
    end;
    iRetorno := Bematech_FI_AberturaDoDia(pchar('0,00'), pchar(''));
    Retorno_Impressora;
  end;
end;

function TImpBematech.AbrecomprovanteNaoFiscal(FormaPagamento, Valor,
  NumeroCupom: string): boolean;
begin

end;

function TImpBematech.AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento,
  Valor_Pago, Numero_do_Cupom: string): Integer;
begin
  Bematech_FI_AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento, Valor_Pago,
    Numero_do_Cupom);
end;

function TImpBematech.AbreCupom(CGC_CPF: string): boolean;
begin
  Result := true;
  if FvTipoImpressora = 'BematechMP20' then
  begin
    iRetorno := Bematech_FI_AbreCupom(Pchar(''));
    Analisa_iRetorno();
    if not retorno_impGer(1) then
      iretorno := 0;
    if (iretorno <> 1) then
      AbreCupom := false;
  end;
  if FvTipoImpressora = 'BematechMFD' then
  begin
    iRetorno := Bematech_FI_AbreCupomMFD('', '', '');
    //      Bematech_FI_AbreCupom( Pchar( '' ) );
    Analisa_iRetorno();
    if not Retorno_Impressora then
      Result:= False;
//    if iRetorno <> 1 then
//    begin
//      Retorno_Impressora;
//      Result := False;
//      Exit;
//    end;
//    if not retorno_impGer(1) then
//      iretorno := 0;
//    if iretorno <> 1 then
//      AbreCupom := false;
  end;
  if Result then
    DataHoraImpressora('', '');
end;

function TImpBematech.AbreCupomMFD(CGC, Nome, Endereco: string): boolean;
begin

end;

function TImpBematech.AbrePortaS(vportaCom: string): boolean;
begin
  Result := true;
  if  FechaPortaSerial then
    Sleep(500);
  iretorno := Bematech_FI_AbrePortaSerial;
  Analisa_iRetorno;
                        
  if iretorno <> 1 then
    AbrePortaS := false;
  if (not vRetExtHab) and (vTemMFD) and (result)  then
  begin
    Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD('1');
    vRetExtHab := True;
  end;
end;

function TImpBematech.AbreRecebimentoNaoFiscalMFD(CGC, Nome,
  Endereco: string): boolean;
begin

end;

function TImpBematech.abrerelatorioGer: boolean;
begin

end;

procedure TImpBematech.acionaCortePapel(corteCompleto, gerencial: boolean);
var
  i: Integer;
begin
  inherited;
  if not vTemMFD  then
    exit;

//  for i := 0 to 3 do
//    if gerencial then
//       RelatorioGerencial(TamDescricao(48,' '))
//    else
//       UsaComprovanteNaoFiscalVinculado(TamDescricao(48,' '));


  if corteCompleto then
    Bematech_FI_AcionaGuilhotinaMFD(1)
  else
    Bematech_FI_AcionaGuilhotinaMFD(0);
end;

function TImpBematech.AcionaGaveta: boolean;
begin
  Result := true;
  iRetorno := Bematech_FI_AcionaGaveta();
  result := Retorno_Impressora;
end;

procedure TImpBematech.Analisa_iRetorno;
begin
  if iRetorno = 0 then
    Application.MessageBox('Erro de Comunicação !', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -1 then
    Application.MessageBox('Erro de Execução na Função. Verifique!', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -2 then
    Application.MessageBox('Parâmetro Inválido !', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -3 then
    Application.MessageBox('Alíquota não programada !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -4 then
    Application.MessageBox('Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -5 then
    Application.MessageBox('Erro ao Abrir a Porta de Comunicação', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -6 then
    Application.MessageBox('Impressora Desligada ou Desconectada', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -7 then
    Application.MessageBox('Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -8 then
    Application.MessageBox('Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt',
      'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -18 then
    Application.MessageBox('Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -19 then
    Application.MessageBox('Parâmetro diferentes !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -20 then
    Application.MessageBox('Transação cancelada pelo Operador !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -21 then
    Application.MessageBox('A Transação não foi aprovada !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -22 then
    Application.MessageBox('Não foi possível terminal a Impressão !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -23 then
    Application.MessageBox('Não foi possível terminal a Operação !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -30 then
    Application.MessageBox('Função Incompativel com ECF!', 'Atenção',
      MB_IconInformation + MB_OK);
end;

function TImpBematech.gerarArquivoMFD(pTipo, pFormato, pParam1, pParam2,
  pEnderecoArq: string): Boolean;
var
  strDataInicial: String;
  strDataFinal: String;
  cIntervalo: string;
  iFormato: integer;
  iQtdeArquivos: integer;
  cChavePublica: String;
  cChavePrivada: String;
  cNomeArquivo: string;
  vLista: TStringList;
begin
  if ( pTipo = 'D' ) then
  begin
    cIntervalo := 'D';
    strDataInicial := pParam1;
    strDataFinal := pParam2;
  end
  else
  begin
    cIntervalo := 'C';
    strDataInicial := pParam1;
    strDataFinal := pParam2;
  end;

  if ( pFormato = 'MF'  ) then iFormato := 0;
  if ( pFormato = 'MFD' ) then iFormato := 1;
  if ( pFormato = 'TDM' ) then iFormato := 2;
  if ( pFormato = 'RZ'  ) then iFormato := 3;
  if ( pFormato = 'RFD' ) then iFormato := 4;

  iQtdeArquivos := 1;
  cChavePublica := 'A499F300F731F6892F44B83A5DD9D97CFFFD0ABE96E29B4B4B4EB2F9E5BCFFCF0A52EAFDF05779F90B3A199BE5776B13373CB2E71D8AB67F4080CE27B226FFF032B6A7182C90C935EF2F4D343A743B60307EE4961F0C5EB02B1CEEF48D647C02E9BE164DC404B833F80C5B4268C04039547E7D5E242537B02360674B569208'+'BD';
  cChavePrivada := 'D19598300478932ACFFE16CB6903552F15FDBD2D3B9659FAD79C3603C07B875919E9D8B28919B8F4C20C6AE23268A636D1206F5E6BC79D89B6152804B15A9781C90E0A2D5064FB5B7CC01048AD8C66768F76D71647E7D39F8EDD714044CEA68F2A40106849132B01D14DDEB3FBA6FC1A9FBE9EA71BAB9293707A4EAD29CB6F'+'3D';

  setlength( cChavePublica, 256 );
  setlength( cChavePrivada, 256 );
  setlength( cNomeArquivo, 512 );

  iRetorno := genkkey( cChavePublica, cChavePrivada );

  iRetorno := Bematech_FI_ArquivoMFDPath( '',
                                      pEnderecoArq,
                                      pParam1,
                                      pParam2,
                                      cIntervalo,
                                      vDadosIniF.vCodPropEcf,
                                      iFormato,
                                      cChavePublica,
                                      cChavePrivada,
                                      iQtdeArquivos);
  Analisa_iRetorno();
  Retorno_Impressora();

  if FileExists(pEnderecoArq) then
  begin
    vLista := TStringList.Create;
    vLista.LoadFromFile(pEnderecoArq);

    if Copy(vLista[vLista.Count - 1],1,3) = 'EAD' then
      vLista.Delete(vLista.Count - 1);
		vLista.SaveToFile(pEnderecoArq);

		if FileExists(ExtractFilePath(Application.ExeName) + 'Download.MFD') then
      CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'Download.MFD'),
               PChar(StringReplace(pEnderecoArq, '.txt', '.MFD', [rfIgnoreCase, rfReplaceAll])), False);
  end;
end;

function TImpBematech.arquivoMFDCotepe1704porCOO(cooInicial, cooFinal,
  endereco, codProp, pTipo: string): boolean;
var
  arquivoMFD, temp, temp2: string;
  i: Integer;
  cFlag: string;
  cModeloImp: string;
  dtIni: string;
  dtFim: string;
  cTipo: string;
  iACK: Integer;
  iST1: Integer;
  iST2: Integer;
  iST3: Integer;
  cArqTemp: TextFile;
  cArqTempTXT: TextFile;
  cArqTXT: string;
  Texto: TStringList;
  cFormato: string;
  cTipoDownload: string;
  cLinha: string;
  hdBema: THandle;
begin
  if not vDadosIniF.existeComando('10', True) then
    Exit;
  {  application.MessageBox('Função nao suportada pelo modelo de ECF utilizado', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    exit;
    arquivoMFD := StringReplace(endereco, 'txt', 'MFD', [rfReplaceAll, rfIgnoreCase]);
    iRetorno := Bematech_FI_DownloadMFD(arquivoMFD, '2', cooInicial, cooFinal, codProp);
    if iretorno <> 1 then
    begin
      Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
      Result := false;
      exit;
    end;
    temp := ShortDateFormat;
    ShortDateFormat := 'dd/mm/yyyy';
    for i := 1 to 512 do temp2 := temp2 + ' ';
    iRetorno := Bematech_FI_GeraRegistrosCAT52MFDEx(arquivoMFD, datetostr(Date), temp2);
    ShortDateFormat := temp;
    if iretorno <> 1 then
    begin
      Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
        + MB_OK);
      Result := false;
      exit;
    end;
    copyArquivo(temp2, endereco);
    Result := iRetorno = 1;     }
  cFlag := '1';
  SetLength(cModeloImp, 10);
  iRetorno := Bematech_FI_ModeloImpressora(cModeloImp);
  //Comando para retornar o modelo da impressora
  if (iRetorno = 0) then
  begin
    application.MessageBox('Erro de comunicação!', 'ERRO', MB_ICONINFORMATION + MB_OK);
    Result := false;
    exit;
  end;
  if (Trim(cModeloImp) = 'MP20FI') or (Trim(cModeloImp) = 'MP40FI') or (Trim(cModeloImp) = 'MP25FI')
    or (Trim(cModeloImp) = 'MP50FI') then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    exit;
  end;

  gerarArquivoMFD('C', pTipo, cooInicial, cooFinal, endereco);
  Result := iRetorno = 1;
  if not Result then
    Application.MessageBox(pchar('ECF não conseguiu gerar o arquivo ou não possui esta funcionalidade'), 'Erro', MB_ICONERROR + MB_OK);
  exit;

  arquivoMFD := StringReplace(endereco, 'txt', 'MFD', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Bematech_FI_DownloadMFD(arquivoMFD, '2', cooInicial, cooFinal, codProp);
  //  iRetorno := Bematech_FI_DownloadMFD(arquivoMFD, '0', '','','');
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Analisa_iRetorno;
  Retorno_Impressora;
  cArqTXT := arquivoMFD + 'Espelho.TXT';
  cFormato := '0';
  cTipoDownload := '0';
  iRetorno := Bematech_FI_FormatoDadosMFD(pchar(arquivoMFD),
    pchar(cArqTXT),
    pchar(cFormato),
    pchar(cTipoDownload),
    pchar(''),
    pchar(''),
    pchar(''));

  AssignFile(cArqTemp, cArqTXT);
  Reset(cArqTemp);

  // Cria o arquivo EspelhoTMP.TXT para guardar a imagens dos cupons
  // capturados, retirando as linhas em branco.

  cLinha := '';
  while not EOF(cArqTemp) do
  begin
    Readln(cArqTemp, cLinha);
    if Pos('COO:' + vDadosIniF.StrZero(cooInicial, 6), cLinha) > 0 then
      dtIni := copy(clinha, 1, 10);
    if Pos('COO:' + vDadosIniF.StrZero(cooFinal, 6), cLinha) > 0 then
      dtFim := copy(clinha, 1, 10);
  end;
  CloseFile(cArqTemp);
  dtIni := StringReplace(dtIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dtFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
  DeleteFile(pchar(arquivoMFD));
  iRetorno := Bematech_FI_DownloadMFD(arquivoMFD, '1', dtIni, dtFim, codProp);

  cTipo := '2';
  if not obEmpresa.Active then
    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);

  iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(cFlag);
  iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);

  hdBema := 0;

  if (Trim(cModeloImp) = 'MP2000FI') or (Trim(cModeloImp) = 'MP6000FI') then
    hdBema := LoadLibrary(Pchar('BemaMFD.dll'))
  else
    hdBema := LoadLibrary(Pchar('BemaMFD2.dll'));
  if hdBema <> 0 then
  begin
    @BemaGeraRegistrosTipoE := GetProcAddress(hdBema, PCHAR('BemaGeraRegistrosTipoE'));

    BemaGeraRegistrosTipoE(arquivoMFD, endereco, dtIni, dtFim,
      obEmpresa.dataSet.FieldByName('nome_emp').asstring,
      obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring,
      '', cTipo, '', '', '', '', '', '', '', '', '', '', '', '', '');
    FreeLibrary(hdBema);
    Retorno_Impressora;
  end
  else
    iRetorno := 0;
  {
temp := ShortDateFormat;
ShortDateFormat := 'dd/mm/yyyy';
for i := 1 to 512 do temp2 := temp2 + ' ';
iRetorno := Bematech_FI_GeraRegistrosCAT52MFDEx(arquivoMFD, datetostr(Date), temp2);
ShortDateFormat := temp;  }
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  //  copyArquivo(temp2, endereco);
  Result := iRetorno = 1;
end;

function TImpBematech.arquivoMFDCotepe1704porData(dataInicial, dataFinal,
  endereco, codProp, pTipo: string): boolean;
var
  arquivoMFD, temp, temp2: string;
  dtIni, dtFim: string;
  i: Integer;
  cFlag: string;
  cModeloImp: string;
  iACK: Integer;
  iST1: Integer;
  iST2: Integer;
  iST3: Integer;
  cTipo: string;
  hdBema: THandle;
  vArqTDM: Boolean;
begin
  if not vDadosIniF.existeComando('9', True) then
    Exit;
  cFlag := '1';
  SetLength(cModeloImp, 10);
  iRetorno := Bematech_FI_ModeloImpressora(cModeloImp);
  //Comando para retornar o modelo da impressora
  if (iRetorno = 0) then
  begin
    application.MessageBox('Erro de comunicação!', 'ERRO', MB_ICONINFORMATION + MB_OK);
    Result := false;
    exit;
  end;
  if (Trim(cModeloImp) = 'MP20FI') or (Trim(cModeloImp) = 'MP40FI') or (Trim(cModeloImp) = 'MP25FI')
    or (Trim(cModeloImp) = 'MP50FI') then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    exit;
  end;

  vArqTDM := Copy(vDadosIniF.GetIni('Fiscal', 'BematechArqTDM', ''),1,1) = 'S';
  if vArqTDM then
    vArqTDM := Application.MessageBox('Arquivo no formado TDM?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) =  IDYES;

  if not vArqTDM then
  begin

  gerarArquivoMFD('D', pTipo, dataInicial, dataFinal, endereco);
  Result := iRetorno = 1;
  if not Result then
    Application.MessageBox(pchar('ECF não conseguiu gerar o arquivo ou não possui esta funcionalidade'), 'Erro', MB_ICONERROR + MB_OK);
  exit;

  end
  else if Copy(vDadosIniF.GetIni('Fiscal', 'BematechArqTDM', ''), 1, 2) = 'S1' then
  begin
    gerarArquivoMFD('D', 'TDM', dataInicial, dataFinal, endereco);
    Result := iRetorno = 1;
    if not Result then
      Application.MessageBox(pchar('ECF não conseguiu gerar o arquivo ou não possui esta funcionalidade'), 'Erro', MB_ICONERROR + MB_OK);
    exit;
  end;

  arquivoMFD := StringReplace(endereco, 'txt', 'MFD', [rfReplaceAll, rfIgnoreCase]);
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(dtIni, 5, 2);
  Delete(dtFim, 5, 2);
  dtIni := StringReplace(dtIni, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dtFim, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Bematech_FI_DownloadMFD(arquivoMFD, '1', dtIni, dtFim, codProp);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Analisa_iRetorno;
  Retorno_Impressora;
  if Trim(Copy(vDadosIniF.GetIni('Fiscal', 'BematechArqTDM', ''),2,1)) <> '' then
    cTipo := Trim(Copy(vDadosIniF.GetIni('Fiscal', 'BematechArqTDM', ''),2,1))
  else
  cTipo := '2';
  if not obEmpresa.Active then
    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(cFlag);
  iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);

  hdBema := 0;

  if (Trim(cModeloImp) = 'MP2000FI') or (Trim(cModeloImp) = 'MP6000FI') then
    hdBema := LoadLibrary(Pchar('BemaMFD.dll'))
  else
    hdBema := LoadLibrary(Pchar('BemaMFD2.dll'));
  if hdBema <> 0 then
  begin
    @BemaGeraRegistrosTipoE := GetProcAddress(hdBema, PCHAR('BemaGeraRegistrosTipoE'));

    BemaGeraRegistrosTipoE(arquivoMFD, endereco, dtIni, dtFim,
      obEmpresa.dataSet.FieldByName('nome_emp').asstring,
      obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring,
      '', cTipo, '', '', '', '', '', '', '', '', '', '', '', '', '');
    FreeLibrary(hdBema);
    Retorno_Impressora;
  end
  else
    iRetorno := 0;
  {
temp := ShortDateFormat;
ShortDateFormat := 'dd/mm/yyyy';
for i := 1 to 512 do temp2 := temp2 + ' ';
iRetorno := Bematech_FI_GeraRegistrosCAT52MFDEx(arquivoMFD, datetostr(Date), temp2);
ShortDateFormat := temp;  }
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  //  copyArquivo(temp2, endereco);
  Result := iRetorno = 1;
end;

function TImpBematech.cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string;
  codigo: integer): Integer;
var
  codigoTotalizador: Integer;
  I: Integer;
begin
  Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms(codigo, copy(nomeTotaliz, 1, 19));
  if iretorno = 1 then
  begin
    result := codigo;
    exit;
  end;
  for I := 1 to 30 do
  begin
    Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms(I, copy(nomeTotaliz, 1, 19));
    if iretorno = 1 then
    begin
      result := codigo;
      exit;
    end
    else
      Result := 0;
  end;
  Application.MessageBox(pchar('Totalizador não foi cadastrado.' + #13 +
    'Verifique! Função permitida apenas depois da redução Z e antes de registrar o movimento do dia'),
    'Atenção', MB_ICONWARNING + MB_OK);
end;

function TImpBematech.CancelaCupom(vsubtr: integer): boolean;
begin
  Result := true;
  if Fvmodimpbema = 'YANCO' then
  begin
    if vsubtr <> 0 then
    begin
      messagedlg('Não permitido para esta impressora', mtinformation, [mbOK], 0);
      result := false;
      exit;
    end;
  end;
  iRetorno := Bematech_FI_CancelaCupom();
  Analisa_iRetorno;
  if iretorno <> 1 then
  begin
    Retorno_Impressora;
    result := false;
    Exit;
  end;
  Result := Retorno_Impressora;
//  if not retorno_impGer(1) then
//    Result := false;
  //    EnvCmdsCupom(10);
end;

procedure TImpBematech.cancelaCupomTEF;
begin
  inherited;
  iRetorno := Bematech_FI_CancelaCupom();
end;

function TImpBematech.CancelaItemGenerico(NumeroItem: real): boolean;
begin
  Result := true;
  iRetorno := Bematech_FI_CancelaItemGenerico(pchar(vDadosIniF.StrZeroDec(NumeroItem, 3, 0)));
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    CancelaItemGenerico := false;
    exit;
  end;
  Result := Retorno_Impressora;
//  if not retorno_impGer(1) then
//  begin
//    CancelaItemGenerico := false;
//    exit;
//  end;
end;

function TImpBematech.CancelamentoNaoFiscal: boolean;
begin
  if vTemMFD then
  begin
    iRetorno := Bematech_FI_CancelaRecebimentoNaoFiscalMFD('','','');
    Result := Retorno_Impressora;
  end
  else
  begin
    Application.ProcessMessages;
    Application.MessageBox('Função não suportada pela impressora','Atenção',0+64);
    Result := False;
  end;
end;

function TImpBematech.cMascara(vvalor: real; vqtd: real; idx: integer; vdesc1: real; vdesc2:
  real):
  string;
var
  ctotal: string;
  cdescit: string;
begin
  if (idx = 1) or (idx = 2) then
  begin
    vvalor := convNumero(vvalor);
    ctotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 3);
    if FvtipoArredond <> 'A' then
    begin
      if pos(',', ctotal) > 0 then
        ctotal := copy(ctotal, 1, pos(',', ctotal) - 1) + ',' + copy(ctotal, pos(',', ctotal) +
          1,
          2);
    end
    else
    begin
      cTotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 2);
      while pos('.', ctotal) > 0 do
        delete(ctotal, pos('.', ctotal), 1);
    end;
  end;
  if idx = 2 then
  begin
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
  end;
  if idx = 1 then
    cMascara := ctotal;
  if idx = 2 then
    cMascara := cdescit;
end;

function TImpBematech.cMascQuant(vqtd: real): string;
var
  cQuant: string;
begin
  cQuant := vDadosIniF.StrZeroDec(vqtd, 8, 3);
  delete(cQuant, 5, 1);
  cMascQuant := cQuant;
end;

function TImpBematech.convnumero(var Valor: real): real;
begin
  if vFqtdDig = 3 then
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 3))
  else
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 2))  ;
end;

function TImpBematech.convNumero2(var Valor1: real): string;
begin
  if vFqtdDig = 3 then
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 3)
  else
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 2);
end;

constructor TImpBematech.Create;
begin
  vPortaAberta:= False;
  vRetExtHab:= False;
  fQtdeColunasImpressao := 48;
  fPathRetornoTXT := vDadosIniF.GetIni('Fiscal', 'PathRetornoTXT', 'C:\Retorno.txt');
end;

function TImpBematech.cupomAberto: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := False;
  FlagsFiscais:=0;
  iRetorno := Bematech_FI_FlagsFiscais(FlagsFiscais);
  if iRetorno <> 1 then
    exit;
  if (FlagsFiscais mod 2) <> 0 then
    Result := True;
end;

function TImpBematech.DataHoraImpressora(Data, Hora: string): boolean;
var
  iConta: integer;
begin
  Result := true;
  FDataECF := '';
  for iConta := 1 to 6 do
  begin
    FDataECF := FDataECF + ' ';
  end;
  FHoraEcf := '';
  for iConta := 1 to 6 do
  begin
    FHoraEcf := FHoraEcf + ' ';
  end;
  iRetorno := Bematech_FI_DataHoraImpressora(FDataECF, FHoraEcf);
  if iretorno = 1 then
  begin
    Insert(':', FHoraEcf, 3);
    Insert(':', FHoraEcf, 6);
    Insert('/', FDataECF, 3);
    Insert('/', FDataECF, 6);
  end
  else
  begin
    //    Analisa_iRetorno;
    FHoraEcf := '00:00:00';
    FDataECF := '01/01/1980';
  end;
  //  FDataECF := '14/12/2007';
end;

function TImpBematech.dataHoraUltimoDocumento: string;
var
  sDataHora: string;
  I: Integer;
begin
  if (vTipoImpressora = 'BematechMFD') then
  begin
  for i := 1 to 12 do
    sDataHora := sDataHora + ' ';

  iRetorno := 0;
  while iRetorno <> 1 do
  begin
    iRetorno := Bematech_FI_DataHoraUltimoDocumentoMFD(sDataHora);
    if iRetorno <> 1 then
    begin
      //      if Application.MessageBox(pchar('Impressora não responde. Tentar novamente?'),
      //        'Atenção',
      //        MB_ICONINFORMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  insert('/', sDataHora, 3);
  insert('/20', sDataHora, 6);
  insert(' ', sDataHora, 11);
  insert(':', sDataHora, 14);
  insert(':', sDataHora, 17);
  end
  else
  begin
    DataHoraImpressora('','');
    sDataHora := DateToStr(StrToDate( FDataECF));
    sDataHora := sDataHora+' '+FHoraEcf;
  end;
  Result := sDataHora;
end;

function TImpBematech.defAtribTef: string;
begin
  Result := obFinalizador.dataSet.FieldByName('descricao').AsString;
  while length(Result) < 10 do
    Result := Result + ' ';
end;

function TImpBematech.DefCodFinalPrazo: string;
begin
  DefCodFinalPrazo := obFinalizador.dataSet.FieldByName('descricao').AsString;
end;

procedure TImpBematech.defineArredondamentoTruncamento;
var
  vTruncArred:string;
  I: Integer;
begin
  inherited;
  FqtdDigQtde := 3;
  vTruncArred := '';
  For I := 1 to 2 do vTruncArred := vTruncArred + ' ';
  iRetorno := Bematech_FI_VerificaTruncamento(vTruncArred);
  if Retorno_Impressora then
  begin
    vTruncArred := Copy(Trim(vTruncArred),1,1);
    if vTruncArred = '1' then
      FvtipoArredond := 'T'
    else if vTruncArred = '0' then
      FvtipoArredond := 'A';
  end;
end;

function TImpBematech.defvalsangsup(vvalsangsup: real): string;
var
  cValorZero: string;
begin
  cValorZero := vDadosIniF.StrZeroDec(vvalsangsup, 15, 2);
  delete(cValorZero, 13, 1);
  result := cValorZero;
end;

function TImpBematech.Descricaoimp(vdesc: string): string;
var
  cDescricao: string;
  t: integer;
begin
  //    cDescricao := Ldescricao.Caption;
  if Faitred = 'S' then
  begin
    cDescricao := vdesc;
    for t := 1 to 29 - length(cDescricao) do
    begin
      Insert(' ', cDescricao, 29);
    end;
    result := copy(cDescricao, 1, 29);
  end
  else
    Result := vdesc;
end;

function TImpBematech.DesprogramaHorarioVerao: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := true;
  FlagsFiscais:=0;
  iRetorno := Bematech_FI_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then
  else
  begin
    Application.MessageBox('Horário de verão não esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  iRetorno := Bematech_FI_ProgramaHorarioVerao();
  Analisa_iRetorno;
  Result := Retorno_Impressora;
//   if iRetorno = 0 then
//   result:= false;
end;

destructor TImpBematech.Destroy;
begin
  inherited;

end;

function TImpBematech.diaCaixaFechado: Boolean;
var
  Arq: TextFile;
  vl, i: integer;
  resp: string;
  DataReducao: string;
  horaReducao: string;
  vStringDataMov: string;
begin
  Result := true;
  if vTemMFD then
  begin
    for I := 1 to 6 do vStringDataMov:= vStringDataMov +' ';
      iRetorno := Bematech_FI_DataMovimentoUltimaReducaoMFD(vStringDataMov);
    if (Trim(vStringDataMov) <> '00/00/00') AND (pos('/',Trim(vStringDataMov)) = 0) then
      vStringDataMov := copy(vStringDataMov,1,2)+'/'+copy(vStringDataMov,3,2)+'/'+copy(vStringDataMov,5,2)
    else
      vStringDataMov := Trim(vStringDataMov);
    try
      vFvDataRes := DateToStr(StrToDate(vStringDataMov));
    except
      vFvDataRes := '';
    end;
  end;
  if vFvDataRes = '' then
  begin
    iRetorno := Bematech_FI_RelatorioTipo60Mestre();
    Analisa_iRetorno();
    if iretorno <> 1 then
    begin
      messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    removerLinhasEmBranco(fPathRetornoTXT);
    AssignFile(Arq, fPathRetornoTXT);
    try
      reset(arq);
    except
      messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 3 then
        begin
          FvDataRes := trim(copy(resp, 28, 25));
          if FvDataRes = '00/00/00' then
            FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
          break;
        end;
      end;
      inc(vl);
    end;
    CloseFile(Arq);
  end;
  for i := 1 to 6 do DataReducao := DataReducao + ' ';
  for i := 1 to 6 do horaReducao := horaReducao + ' ';
  iRetorno := Bematech_FI_DataHoraReducao(DataReducao, horaReducao);
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  vMapaResumo.dataRed := trim(copy(DataReducao, 1, 2)) + '/' + trim(copy(DataReducao, 3, 2)) + '/' +
    trim(copy(DataReducao, 5, 2));
  vMapaResumo.horaRed := trim(copy(horaReducao, 1, 2)) + ':' + trim(copy(horaReducao, 3, 2)) + ':' +
    trim(copy(horaReducao, 5, 2));
  if vMapaResumo.dataRed = '00/00/00' then
    vMapaResumo.dataRed := DateToStr(Date - 1);
  vMapaResumo.dataRed := DateToStr(StrToDate(vMapaResumo.dataRed));
end;

function TImpBematech.EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: real;
  vcodFinal: integer): boolean;
var
  cdinheiro: string;
begin
  Result := true;
  cdinheiro := vDadosIniF.StrZeroDec(ValorFormaPagamento, 15, 2);
  delete(cdinheiro, 13, 1);
  if vDadosIniF.GetIni('Fiscal', 'FormaPagamento_Trim_FormatoNumerico', 'N') = 'S' then
  begin
    FormaPagamento := Trim(FormaPagamento);
    cdinheiro := Format('%0.2f', [ValorFormaPagamento]);
  end;
  if (vTipoImpressora = 'BematechMFD') then
    iRetorno := Bematech_FI_EfetuaFormaPagamentoMFD(FormaPagamento, cdinheiro, '1', pchar(''))
  else
    iRetorno := Bematech_FI_EfetuaFormaPagamento(FormaPagamento, cdinheiro);

  //Tentativa de correção para a Bematech MP4200
  if iRetorno = -24 then
  begin
    FormaPagamento := Trim(FormaPagamento);
    if (vTipoImpressora = 'BematechMFD') then
      iRetorno := Bematech_FI_EfetuaFormaPagamentoMFD(FormaPagamento, cdinheiro, '1', pchar(''))
    else
      iRetorno := Bematech_FI_EfetuaFormaPagamento(FormaPagamento, cdinheiro);
  end;
  if iRetorno = -2 then
  begin
    FormaPagamento := Trim(FormaPagamento);
    cdinheiro := Format('%0.2f', [ValorFormaPagamento]);
    if (vTipoImpressora = 'BematechMFD') then
      iRetorno := Bematech_FI_EfetuaFormaPagamentoMFD(FormaPagamento, cdinheiro, '1', pchar(''))
    else
      iRetorno := Bematech_FI_EfetuaFormaPagamento(FormaPagamento, cdinheiro);
  end;

  //  Analisa_iRetorno();
  if not Retorno_Impressora then
//  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
  begin
    EfetuaFormaPagamento := false;
    exit;
  end;
end;

function TImpBematech.EfetuaFormaPagamentoMFD(FormaPagamento,
  ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): boolean;
begin

end;

function TImpBematech.EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,
  ValorRecebimento: string): boolean;
begin

end;

procedure TImpBematech.EqualizarVelocidade;
begin
  inherited;

end;

function TImpBematech.espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD, cFlag, cModeloImp: string;
  iACK, iST1, iST2, iST3: Integer;
begin
  if not vDadosIniF.existeComando('8', True) then
    Exit;
  cFlag := '1';
  SetLength(cModeloImp, 10);
  iRetorno := Bematech_FI_ModeloImpressora(cModeloImp);
  //Comando para retornar o modelo da impressora
  if (Trim(cModeloImp) = 'MP20FI') or (Trim(cModeloImp) = 'MP40FI') or (Trim(cModeloImp) = 'MP25FI')
    or (Trim(cModeloImp) = 'MP50FI') then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    Exit;
  end;
  arquivoMFD := StringReplace(endereco, 'txt', 'MFD', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Bematech_FI_DownloadMFD(arquivoMFD, '2', cooInicial, cooFinal, codProp);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Analisa_iRetorno;
  Retorno_Impressora;
  iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(cFlag);
  iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  iRetorno := Bematech_FI_FormatoDadosMFD(arquivoMFD, endereco, '0', '2', cooInicial, cooFinal,
    codProp);
  Analisa_iRetorno;
  if iretorno <> 1 then
  begin
    Retorno_Impressora;
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end
  else
  begin
    result := Retorno_Impressora;
    iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(cFlag);
    iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  end;
end;

function TImpBematech.espelhoMFDporData(dataInicial, dataFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD, dtIni, dtFim, cFlag, cModeloImp: string;
  iACK, iST1, iST2, iST3: Integer;
begin
  if not vDadosIniF.existeComando('7', True) then
    Exit;
  cFlag := '1';
  SetLength(cModeloImp, 10);
  iRetorno := Bematech_FI_ModeloImpressora(cModeloImp);
  //Comando para retornar o modelo da impressora
  if (Trim(cModeloImp) = 'MP20FI') or (Trim(cModeloImp) = 'MP40FI') or (Trim(cModeloImp) = 'MP25FI')
    or (Trim(cModeloImp) = 'MP50FI') then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    Exit;
  end;
  arquivoMFD := StringReplace(endereco, 'txt', 'MFD', [rfReplaceAll, rfIgnoreCase]);
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(dtIni, 5, 2);
  Delete(dtFim, 5, 2);
  dtIni := StringReplace(dtIni, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dtFim, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Bematech_FI_DownloadMFD(arquivoMFD, '1', dtIni, dtFim, codProp);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Analisa_iRetorno;
  Retorno_Impressora;
  iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(cFlag);
  iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  iRetorno := Bematech_FI_FormatoDadosMFD(arquivoMFD, endereco, '0', '1', dtIni, dtFim, codProp);
  if iretorno <> 1 then
  begin
    Retorno_Impressora;
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end
  else
  begin
    Result := Retorno_Impressora;
    iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(cFlag);
    iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  end;
end;
                                            
function TImpBematech.estadoDeEmissaoDoCupomFiscal: integer;
var
  FlagsFiscais: Integer;
  vCupoAberto,vFormPagAtv: Boolean;
  cValorSubTotal, cValorPago: string;
  I: Integer;
begin
  vCupoAberto := False;
  vFormPagAtv := False;
  cValorSubTotal := '';
  cValorPago:= '';
  FlagsFiscais:=0;
  iRetorno := Bematech_FI_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 32 then FlagsFiscais := FlagsFiscais - 32;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then FlagsFiscais := FlagsFiscais - 4;
  if FlagsFiscais >= 2 then
  begin
    FlagsFiscais := FlagsFiscais - 2;
    vFormPagAtv := True;
    for I := 1 to 14 do cValorSubTotal := cValorSubTotal + ' ';
    iRetorno := Bematech_FI_SubTotal(cValorSubTotal);
    cValorSubTotal := Trim(cValorSubTotal);
    try
      StrToInt64(cValorSubTotal);
    except
      cValorSubTotal := '0';
    end;
  end;
  if FlagsFiscais >= 1 then
  begin
    vCupoAberto := True;
    for I := 1 to 14 do cValorPago := cValorPago + ' ';
    iRetorno := Bematech_FI_ValorPagoUltimoCupom(cValorPago);
    cValorPago := Trim(cValorPago);
    try
      StrToInt64(cValorPago);
    except
      cValorPago := '0';
    end;
  end;
  if not vCupoAberto  then
    Result := 2
  else if vFormPagAtv then
  begin
    if StrToInt64(cValorPago) >= StrToInt64(cValorSubTotal) then
      Result := 2
    else
      Result := 1;
  end
  else
    Result := 0;
end;

function TImpBematech.existeReducaoZPendente:Integer;
var
  I: Integer;
  vStringDataMov, vStringDataECF, vStringHoraECF: string;
  vBooleanTemp:Boolean;
  vStringDataReducao: string;
  vStringHoraReducao: string;
  Arq: TextFile;
  vl: Integer;
  resp: string;
begin
  Result := 2;
  vStringDataMov:='';
  vStringDataECF:='';
  vStringHoraECF:='';
  vBooleanTemp:=False;
  if vTemMFD then
  begin
    for I := 1 to 6 do vStringDataMov:= vStringDataMov +' ';
    iRetorno := Bematech_FI_DataMovimento(vStringDataMov);
    i:= getRetornoExtendidoST3;
    vStringDataMov := copy(vStringDataMov,1,2)+'/'+copy(vStringDataMov,3,2)+'/'+copy(vStringDataMov,5,2);
    if vStringDataMov = '00/00/00' then
    begin
      for I := 1 to 6 do vStringDataMov:= vStringDataMov +' ';
      iRetorno := Bematech_FI_DataMovimentoUltimaReducaoMFD(vStringDataMov);
      if (Trim(vStringDataMov) <> '00/00/00') AND (pos('/',Trim(vStringDataMov)) = 0) then
        vStringDataMov := copy(vStringDataMov,1,2)+'/'+copy(vStringDataMov,3,2)+'/'+copy(vStringDataMov,5,2)
      else
        vStringDataMov := Trim(vStringDataMov);
//      if vStringDataMov = '00/00/00' then
//      begin
//        for I := 1 to 6 do begin vStringDataECF:= vStringDataECF +' '; vStringHoraECF:= vStringHoraECF +' '; end;
//        iRetorno := Bematech_FI_DataHoraImpressora(vStringDataECF,vStringHoraECF);
//        vStringDataECF := copy(vStringDataECF,1,2)+'/'+copy(vStringDataECF,3,2)+'/'+copy(vStringDataECF,5,2);
//        try
//          vStringDataMov := DateToStr(StrToDate(vStringDataECF)-1);
//        except
//          vStringDataMov := DateToStr(date-1);
//        end;
//      end;
    end;
    if i = 66 then
      Result := 1
    else
      result := 0;
  end
  else
  begin
    for I := 1 to 6 do vStringDataMov:= vStringDataMov +' ';
      iRetorno := Bematech_FI_DataMovimento(vStringDataMov);
    for I := 1 to 6 do begin vStringDataECF:= vStringDataECF +' '; vStringHoraECF:= vStringHoraECF +' '; end;
      iRetorno := Bematech_FI_DataHoraImpressora(vStringDataECF,vStringHoraECF);
    try
      vStringDataMov := copy(vStringDataMov,1,2)+'/'+copy(vStringDataMov,3,2)+'/'+copy(vStringDataMov,5,2);
      vStringDataECF := copy(vStringDataECF,1,2)+'/'+copy(vStringDataECF,3,2)+'/'+copy(vStringDataECF,5,2);
      if (vStringDataMov = '00/00/00') or (StrToDate(vStringDataMov) = StrToDate(vStringDataECF)) then
        result := 0
      else if (StrToDate(vStringDataMov) < StrToDate(vStringDataECF)) then
        result := 1;
    except
      Application.MessageBox('Erro ao obter datas para verificar se exite redução Z pendente','Atenção',0+64);
      exit;
    end;
  end;
  try
    if vStringDataMov <> '00/00/00' then
      FvDataRes :=DateToStr(StrToDate(vStringDataMov));
  except
    Result :=2;
    exit;
  end;
  if Result = 1  then
    exit;
  iRetorno := Bematech_FI_RelatorioTipo60Mestre();
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    Result := 2;
    exit;
  end;
  removerLinhasEmBranco(fPathRetornoTXT);
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
    Result := 2;
    exit;
  end;
  vl := 1;
  while not eof(arq) do
  begin
    ReadLn(Arq, resp);
    if resp <> '' then
    begin
      if (vl = 3) and (vStringDataMov = '00/00/00') then
      begin
        vStringDataMov := copy(resp,45,8);
        try
          StrToDate(vStringDataMov);
          FvDataRes :=DateToStr(StrToDate(vStringDataMov));
        except
        end;
      end;
      if vl = 7 then // coo inicial
        Fvcooini := trim(copy(resp, 28, 25));
      if vl = 8 then // coo final
        Fvcoofin := trim(copy(resp, 28, 25));
      if vl = 9 then // contador de reduções
        FvContRed := trim(copy(resp, 28, 25));
      if vl = 10 then // reinicio de operações
        FvcontRein := trim(copy(resp, 28, 25));
      if vl = 11 then // Venda bruta
        FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      if vl = 12 then // Grante Total
        FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      vl := vl + 1;
    end;
  end;
  CloseFile(Arq);
  for i := 1 to 6 do vStringDataReducao := vStringDataReducao + ' ';
  for i := 1 to 6 do vStringHoraReducao := vStringHoraReducao + ' ';
  iRetorno := Bematech_FI_DataHoraReducao(vStringDataReducao, vStringHoraReducao);
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    Result := 2;
    exit;
  end;
  vMapaResumo.dataRed := trim(copy(vStringDataReducao, 1, 2)) + '/' + trim(copy(vStringDataReducao, 3, 2)) + '/' +
    trim(copy(vStringDataReducao, 5, 2));
  vMapaResumo.horaRed := trim(copy(vStringHoraReducao, 1, 2)) + ':' + trim(copy(vStringHoraReducao, 3, 2)) + ':' +
    trim(copy(vStringHoraReducao, 5, 2));
  if vMapaResumo.dataRed = '00/00/00' then     vMapaResumo.dataRed := DateToStr(Date - 1);
  vMapaResumo.dataRed := DateToStr(StrToDate(vMapaResumo.dataRed));
  if FvDataRes = '' then
    FvDataRes := vMapaResumo.dataRed;
  montaMaparesumo;
end;

function TImpBematech.FechaComprovanteNaoFiscalVinculado: integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := Bematech_FI_FechaComprovanteNaoFiscalVinculado;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroCDC;
      if temp = '' then
        exit;
      vDocNaoF.cdc := temp;
      vDocNaoF.tipoDoc := 'CC';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
end;

function TImpBematech.FechaComprovanteNaoFiscalVinculadoTEF: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    iRetorno := Bematech_FI_FechaComprovanteNaoFiscalVinculado;
    Result := iRetorno;
    if not retorno_Imp then
      if vFVccancTef = 1 then
        Result := 0;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroCDC;
      if temp = '' then
        exit;
      vDocNaoF.cdc := temp;
      vDocNaoF.tipoDoc := 'CC';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
  //  while not retorno_Imp do
  //  begin
  //    BlockInput(false);
  //    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'),
  //      'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
  //    begin
  //      BlockInput(true);
  //      iRetorno := Bematech_FI_FechaComprovanteNaoFiscalVinculado
  //    end
  //    else
  //    begin
  //      Bematech_FI_FechaComprovanteNaoFiscalVinculado
  //      Result := 0;
  //      break;
  //    end;
  //  end;
end;

function TImpBematech.fechaCupom: boolean;
begin
  Result := true;
  Bematech_FI_AbrePortaSerial;
  if Bematech_FI_FechaRelatorioGerencial = 0 then
    Bematech_FI_FechaComprovanteNaoFiscalVinculado;
  Bematech_FI_FechaPortaSerial;
end;

function TImpBematech.FechamentoDoDia: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
  i: Integer;
  vStringDataMov: string;
  vStringTemp: string;
  iACK, iST1, iST2, iST3: Integer;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
    if vFvmodimpbema = 'YANCO' then
    begin
      iRetorno := Bematech_FI_FechamentoDoDia();
      Analisa_iRetorno;
      if not Retorno_Impressora then
      begin
        result := False;
        exit;
      end;

      if iRetorno = 1 then
      begin
        obConfImp.fechaDia;
        exit;
      end
      else
      BEGIN
        Retorno_Impressora;
        Result:= false;
      end;
    end
    else
    begin
      vStringDataMov:='';
      for I := 1 to 6 do vStringDataMov:= vStringDataMov +' ';
      iRetorno := Bematech_FI_DataMovimento(vStringDataMov);
      iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
      if not Verifica_Impressora then
      begin
        if ( vTemMFD ) then
           iRetorno := Bematech_FI_VerificaEstadoImpressoraMFD( iACK, iST1, iST2, iST3 )
        else
           iRetorno := Bematech_FI_VerificaEstadoImpressora( iACK, iST1, iST2 );
        if (iST3 = 66) then
        begin
          if ((iST1 <> 0) or (iST2 <> 0)) then
          begin
            Result := False;
            exit;
          end;
        end
        else if ((iST1 <> 0) or (iST2 <> 0)) then
        begin
          Result := False;
          exit;
        end;
      end;
      vStringDataMov := copy(vStringDataMov,1,2)+'/'+copy(vStringDataMov,3,2)+'/'+copy(vStringDataMov,5,2);

      iRetorno := Bematech_FI_FechamentoDoDia();
//      iRetorno := Bematech_FI_ReducaoZ(FormatDateTime('dd/mm/yyyy',date),FormatDateTime('hh:mm:ss',time));
      Retorno_Impressora;
      vStringTemp:='';
      for I := 1 to 6 do vStringTemp:= vStringTemp +' ';
      iRetorno := Bematech_FI_DataMovimento(vStringTemp);
      vStringTemp := copy(vStringTemp,1,2)+'/'+copy(vStringTemp,3,2)+'/'+copy(vStringTemp,5,2);

      Resp := '';
      while trim(resp) = '' do
      begin
        Sleep(5000);
        Resp := '';
        for i := 1 to 15 do begin Resp := Resp + ' '
        end;
        Bematech_FI_NumeroSerie(Resp);
        if trim(resp) <> '' then
          iRetorno := 1;
      end;
      Analisa_iRetorno;
      if not retorno_impGer(1) then
        iRetorno := 0;
      if iretorno <> 1 then
      begin
        Application.MessageBox(pchar('O Sistema irá ler os dados da Redução e armazenar no Resumo'), 'Confirmação',
          MB_ICONQUESTION + MB_OK); // = mrNo then
        //        begin
        //          result := false;
        //          exit;
        //        end
      end;
      if vFvmodimpbema = 'YANCO' then
        Sleep(2 * 1000);

      if vDadosIniF.getProgramacaoHorarioVerao = 'ATIVAR' then
        if Application.MessageBox(pchar('Foi feito um agendamento para Ativar'+
          ' o Horario de Verão. Confirma a Programação?'),'Confirmção',MB_YESNO+MB_ICONQUESTION) = IDYES then
              ProgramaHorarioVerao;

      iRetorno := Bematech_FI_RelatorioTipo60Mestre();
      Analisa_iRetorno();
      if iretorno <> 1 then
      begin
        Retorno_Impressora;
        messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
        Result := false;
        exit;
      end;
      removerLinhasEmBranco(fPathRetornoTXT);
      AssignFile(Arq, fPathRetornoTXT);
      try
        reset(arq);
      except
        messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK],
          0);
        Result := false;
        exit;
      end;
      vl := 1;
      while not eof(arq) do
      begin
        ReadLn(Arq, resp);
        if resp <> '' then
        begin
          if vl = 3 then
          begin
            FvDataRes := trim(copy(resp, 28, 25));
            if FvDataRes = '00/00/00' then
              FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
            if vStringDataMov <> '00/00/00' then
              try
                StrToDate(vStringDataMov);
                FvDataRes := DateToStr(StrToDate(vStringDataMov));
              except
              end;
          end;
          if vl = 7 then // coo inicial
            Fvcooini := trim(copy(resp, 28, 25));
          if vl = 8 then // coo final
            Fvcoofin := trim(copy(resp, 28, 25));
          if vl = 9 then // contador de reduções
            FvContRed := trim(copy(resp, 28, 25));
          if vl = 10 then // reinicio de operações
            FvcontRein := trim(copy(resp, 28, 25));
          if vl = 11 then // Venda bruta
            FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          if vl = 12 then // Grante Total
            FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          vl := vl + 1;
        end;
      end;
      CloseFile(Arq);
      diaCaixaFechado;
      montaMaparesumo;
    end;
    //        delefile(Arq);
    FechaPortaSerial;
  end
  else
  begin
    Retorno_Impressora;
    Result := false;
    exit;
  end
end;

function TImpBematech.FechaPortaSerial: boolean;
begin
  Result := true;
  Bematech_FI_FechaPortaSerial;
  vPortaAberta := false;
end;

function TImpBematech.FechaRecebimentoNaoFiscalMFD(
  Mensagem: string): boolean;
begin

end;

function TImpBematech.FechaRelatorioGerencial: integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := Bematech_FI_FechaRelatorioGerencial;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroGRG;
      if temp = '' then
        exit;
      vDocNaoF.grg := temp;
      vDocNaoF.tipoDoc := 'RG';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
end;

function TImpBematech.FechaRelatorioGerencialTEF: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    iRetorno := Bematech_FI_FechaRelatorioGerencial;
    Result := iRetorno;
    if not retorno_Imp then
      if vFVccancTef = 1 then
        Result := 0;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroGRG;
      if temp = '' then
        exit;
      vDocNaoF.grg := temp;
      vDocNaoF.tipoDoc := 'RG';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
end;

function TImpBematech.FecharOp: boolean;
begin
	Result := true;
	Bematech_FI_RelatorioGerencial(TamDescricao(48, '               FECHAMENTO DO OPERADOR           '));
	Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
	Bematech_FI_RelatorioGerencial(TamDescricao(48, 'DATA.........: ' + datetostr(date)));
	Bematech_FI_RelatorioGerencial(TamDescricao(48, 'CAIXA/PDV....: ' +
		vDadosIniF.StrZeroDec(obConfImp.dataSet.FieldByName('COD_TERMINAL').AsInteger, 4, 0)));
	Bematech_FI_RelatorioGerencial(TamDescricao(48, 'NOME DO OP...: ' + trim(vDadosIniF.vNomeFuncionario)));
	Bematech_FI_RelatorioGerencial(TamDescricao(48, ' '));
	Bematech_FI_RelatorioGerencial(TamDescricao(48, ' '));
	Bematech_FI_RelatorioGerencial(TamDescricao(48, '        ---------------------------------       '));
	Bematech_FI_RelatorioGerencial(TamDescricao(48, '                  ASS. DO OPERADOR              '));
  FechaRelatorioGerencial;
end;

function TImpBematech.gerarArquivosConferenciaSintegraSPED(vNomeArqSint,
  vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean;
begin
  Result := False;
  iRetorno :=
    Bematech_FI_RelatorioSintegraMFD(1,
      pchar(vNomeArqSint),
      pchar(copy(vDtIni,4,2)),
      pchar(copy(vDtIni,7,4)),
      pchar(copy(vDadosIniF.vEmp.vRazaoSocial,1,35)),
      pchar(copy(vDadosIniF.vEmp.vEndereco,1,34)),
      pchar(copy(vDadosIniF.vEmp.vNumeroEnd,1,5)),
      pchar(''),
      pchar(copy(vDadosIniF.vEmp.vBairro,1,15)),
      pchar(copy(vDadosIniF.vEmp.vCidade,1,30)),
      pchar(copy(vDadosIniF.vEmp.vCEP,1,12)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,12)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,10)),
      pchar(copy(vDadosIniF.vEmp.vProprietario,1,18)));
  if iRetorno <> 1 then
    exit;

  Result := arquivoMFDCotepe1704porData(vDtIni, vDtFim, vNomeArqCOTEPE, vDadosIniF.vCodPropEcf, 'MFD');
end;

function TImpBematech.getGrandeTotal: string;
var
  vlrGT: string;
  iConta: integer;
  temp: string;
begin
  vlrGT := '';
  for iConta := 1 to 18 do begin vlrGT := vlrGT + ' '
  end;
  iRetorno := Bematech_FI_GrandeTotal(vlrGT);
  while iRetorno <> 1 do
  begin
    if Application.MessageBox('GT. Impressora não responde. Tentar novamente',
      'Atenção',MB_YESNO+MB_ICONQUESTION) = IDNO then
      exit;
    iRetorno := Bematech_FI_GrandeTotal(vlrGT);
  end;
  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
    temp := ''
  else
    temp := (copy(vlrGT, 1, 16) + ',' + copy(vlrGT, 17, 2));
  temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Result := temp;
end;

function TImpBematech.getRetornoExtendidoST3: integer;
Var iACK, iST1, iST2, iST3: Integer;
begin
  iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
  Result := -1;
  iRetorno := Bematech_FI_VerificaEstadoImpressoraMFD( iACK, iST1, iST2, iST3 );
  if (iACK = 0) then
    exit
  else if (iACK = 6)  then
    Result := iST3;
end;

function TImpBematech.getVendaBruta(cooRed:integer;dataEmissaoZ: string): string;
var
  cTipoDownload: string;
  cDadoInicial: string;
  cDadoFinal: string;
  cUsuario: string;
  cTipoFormato: string;
  cArqTemp: TextFile;
  cArqTempTXT: TextFile;
  cArqTXT: string;
  cLinha: string;
  vFlgcopiar: Integer;
	temp, tempCancISS: string;
begin
	cTipoDownload := '1';
  cDadoInicial := StringReplace(dataEmissaoZ, '/', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(cDadoInicial, 5, 2);
  cDadoInicial := StringReplace(cDadoInicial, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  cDadoFinal := cDadoInicial;
  cUsuario      := vDadosIni.vCodPropEcf;
  cTipoFormato := '0';
  iRetorno := Bematech_FI_DownloadMFD( ExtractFilePath(Application.ExeName)+'donwload.mdf', cTipoDownload, cDadoInicial, cDadoFinal,cUsuario );
  if iRetorno <> 1  then
  begin
    Result := '';
    exit;
  end;
  iRetorno := Bematech_FI_FormatoDadosMFD( ExtractFilePath(Application.ExeName)+'donwload.mdf',
      ExtractFilePath(Application.ExeName)+'donwload.txt',      pchar( cTipoFormato ),      pchar( cTipoDownload ),
      pchar( cDadoInicial ),      pchar( cDadoFinal ),    pchar( cUsuario ) );
  if iRetorno = 1 then
  begin
    cArqTXT := ExtractFilePath(Application.ExeName)+'donwload.txt';
    AssignFile(cArqTemp, cArqTXT);
		Reset(cArqTemp);
		cLinha := '';
		vFlgcopiar:=0;
		temp := '';
		tempCancISS :='';
    while not EOF(cArqTemp) do
    begin
      Readln(cArqTemp, cLinha);
      if Pos('COO:'+vDadosIniF.StrZero(cooRed,6), cLinha) > 0 then
          vFlgcopiar := 1;
			if vFlgcopiar = 1 then
				if Pos('VENDA BRUTA DI', cLinha) > 0 then
					temp := StringReplace(trim(copy(clinha, 20, 30)),'*','0',[rfReplaceAll, rfIgnoreCase]);
			if (temp <> '') then
				break;
		end;

		{cLinha := '';
		vFlgcopiar:=0;
		Reset(cArqTemp);
		tempCancISS :='';
    while not EOF(cArqTemp) do
    begin
      Readln(cArqTemp, cLinha);
			if Pos('COO:'+vDadosIniF.StrZero(cooRed,6), cLinha) > 0 then
          vFlgcopiar := 1;
			if vFlgcopiar = 1 then
				if Pos('CANCELAMENTO ISSQN', cLinha) > 0 then
					tempCancISS := StringReplace(trim(copy(clinha, 20, 30)),'*','0',[rfReplaceAll, rfIgnoreCase]);
			if (tempCancISS <> '') then
			begin
				vMapaResumo.vlCancelamentoISSQN := tempCancISS;
				break;
			end;
		end; }
    CloseFile(cArqTemp);
    Result := vDadosIniF.tirapontos(temp,2);
  end;
end;

function TImpBematech.getVendaBruta(cooRed:integer): string;
var
  cTipoDownload: string;
  cDadoInicial: string;
  cDadoFinal: string;
  cUsuario: string;
  cTipoFormato: string;
  cArqTemp: TextFile;
  cArqTempTXT: TextFile;
  cArqTXT: string;
  cLinha: string;
  vFlgcopiar: Integer;
	temp, tempCancISS: string;
begin
	cTipoDownload := '2';
	cDadoInicial  := vDadosIni.StrZero(cooRed - 1,6);
	cDadoFinal    := vDadosIni.StrZero(cooRed ,6);
	cUsuario      := vDadosIni.vCodPropEcf;
	cTipoFormato := '0';
	iRetorno := Bematech_FI_DownloadMFD( ExtractFilePath(Application.ExeName)+'donwload.mdf', cTipoDownload, cDadoInicial, cDadoFinal,cUsuario );
	if iRetorno <> 1  then
	begin
		Result := '';
		exit;
	end;
	iRetorno := Bematech_FI_FormatoDadosMFD( ExtractFilePath(Application.ExeName)+'donwload.mdf',
			ExtractFilePath(Application.ExeName)+'donwload.txt',      pchar( cTipoFormato ),      pchar( cTipoDownload ),
			pchar( cDadoInicial ),      pchar( cDadoFinal ),    pchar( cUsuario ) );
	if iRetorno = 1 then
	begin
		cArqTXT := ExtractFilePath(Application.ExeName)+'donwload.txt';
		AssignFile(cArqTemp, cArqTXT);
		Reset(cArqTemp);
		cLinha := '';
		vFlgcopiar:=0;
		temp := '';
		while not EOF(cArqTemp) do
		begin
			Readln(cArqTemp, cLinha);
			if Pos('COO:'+vDadosIniF.StrZero(cooRed,6), cLinha) > 0 then
          vFlgcopiar := 1;
			if vFlgcopiar = 1 then
				if Pos('VENDA BRUTA DI', cLinha) > 0 then
					temp := StringReplace(trim(copy(clinha, 20, 30)),'*','0',[rfReplaceAll, rfIgnoreCase]);
			if temp <> '' then
        break;
		end;

		{cLinha := '';
		vFlgcopiar:=0;
		Reset(cArqTemp);
		tempCancISS :='';
		while not EOF(cArqTemp) do
    begin
      Readln(cArqTemp, cLinha);
			if Pos('COO:'+vDadosIniF.StrZero(cooRed,6), cLinha) > 0 then
          vFlgcopiar := 1;
			if vFlgcopiar = 1 then
				if Pos('CANCELAMENTO ISSQN', cLinha) > 0 then
					tempCancISS := StringReplace(trim(copy(clinha, 20, 30)),'*','0',[rfReplaceAll, rfIgnoreCase]);
			if (tempCancISS <> '') then
			begin
				vMapaResumo.vlCancelamentoISSQN := tempCancISS;
				break;
			end;
		end;}
		CloseFile(cArqTemp);
    Result := vDadosIniF.tirapontos(temp,2);
  end;
end;

procedure TImpBematech.ImpDavsEmitidos;
var
  tipo, vTexto: string;
  I: Integer;
begin
  inherited;
  Bematech_FI_RelatorioGerencial('                  DAV EMITIDOS                  ');
  Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));

  obVenda.First;
  while not obVenda.eof do
  begin
    if obVenda.dataSet.FieldByName('TIPO').AsString = 'REQ' then
      tipo := 'PEDIDO'
    else if TRIM(obVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
      tipo := 'ORDEM SERVIÇO'
    else if obVenda.dataSet.FieldByName('TIPO').AsString = 'ORC' then
      tipo := 'ORÇAMENTO';

    vTexto := TamDesc(13, tipo) + '    ' +
      obVenda.dataSet.FieldByName('DATA_FECH').AsString + '       ' +
      vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
        vDadosIniF.vQtdeDigDAV)+'                                   ';

    Bematech_FI_RelatorioGerencial(copy(vTexto,1,48));

    vTexto := 'COO Vinc: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('ncupom').AsInteger, 6) +
              ' COO Imp: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('coo_impressao').AsInteger, 6) +
              ' Valor: ' + Format('%5.2F', [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]) +
              '                                   ';

    Bematech_FI_RelatorioGerencial(copy(vTexto,1,48));

    Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));

    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obVenda.close;
end;

procedure TImpBematech.ImpDavsOSEmitidos;
begin
  inherited;
  Bematech_FI_RelatorioGerencial('                DAV-OS EMITIDOS             ');
  Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Bematech_FI_RelatorioGerencial(' ');
  Bematech_FI_RelatorioGerencial(' ');

  obVenda.First;
  while not obVenda.eof do
  begin
    Bematech_FI_RelatorioGerencial(vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
      vDadosIniF.vQtdeDigDAV) + '             ' + Format('%10.2F',
      [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]));
    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obVenda.close;
end;

procedure TImpBematech.ImpIdentificacaoPAFECF;
begin
  inherited;
  RelatorioGerencial2('             IDENTIFICAÇÃO DO PAF-ECF         ');
  RelatorioGerencial2(vDadosIniF.Replicate('=', 48));
  RelatorioGerencial2(vDadosIniF.Replicate(' ', 48));
  obIdentF.abreIdentFiscal(False);
  obIdentF.First;
  RelatorioGerencial2(TamDescricao(48, 'Laudo Numero: ' +
    obIdentF.dataSet.FieldByName('n_laudo_fiscal').AsString) +
    TamDescricao(48, obIdentF.dataSet.FieldByName('nome_empdes').AsString) +
    TamDescricao(48, ' CNPJ: ' + obIdentF.dataSet.FieldByName('cnpj_empdes').AsString) +
    TamDescricao(48, ' Endereço: ' + obIdentF.dataSet.FieldByName('endereco_empdes').AsString) +
    TamDescricao(48, ' Bairro: ' + obIdentF.dataSet.FieldByName('bairro_empdes').AsString) +
    TamDescricao(48, ' Cidade: ' + obIdentF.dataSet.FieldByName('cidade_empdes').AsString +
    ' UF: ' + obIdentF.dataSet.FieldByName('uf_empdes').AsString) +
    TamDescricao(48, ' Telefone: ' + obIdentF.dataSet.FieldByName('fone_empdes').AsString) +
    TamDescricao(48, ' Contato: ' + obIdentF.dataSet.FieldByName('contato_empdes').AsString) +
    TamDescricao(48, obIdentF.dataSet.FieldByName('nome_paf').AsString) +
    TamDescricao(48, ' ' + obIdentF.dataSet.FieldByName('nome_comercial').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Versão: ' +
    obIdentF.dataSet.FieldByName('versao_paf').AsString) +
    TamDescricao(48, ' Principal Executavel: ' +
    obIdentF.dataSet.FieldByName('principal_exec').AsString) +
    TamDescricao(48, ' MD5: ' + vDadosIniF.vMD5Fiscal));
  RelatorioGerencial2(' Outros arquivos e MD5');
  while not obIdentF.dataSet.Eof do
  begin
    RelatorioGerencial2(
      TamDescricao(48, '  ' + obIdentF.dataSet.FieldByName('nome_arquivo').AsString) +
      TamDescricao(48, '  ' + obIdentF.dataSet.FieldByName('md5_arquivo').AsString));
    obIdentF.next;
  end;
  obTermImp.abreTerminalImpressoras;
  RelatorioGerencial2('ECF''s Autorizados');
  obTermImp.First;
  while not obTermImp.dataSet.Eof do
  begin
    RelatorioGerencial2(' ' +
      vDadosIniF.decodifica(obTermImp.dataSet.FieldByName('num_serie_ecf').AsString));
    obTermImp.next;
  end;
  FechaRelatorioGerencial;
end;

procedure TImpBematech.ImpMeiosDePagamento;
var
  vTipDoc: string;
  vValorCancelado: Currency;
  aFinal: array[1..99] of string;
  aValor: array[1..99] of Currency;
  I, flFinal: Integer;
begin
  inherited;
  for I := 1 to 99 do
  begin
    aFinal[i] := '';
    aValor[i] := 0;
  end;

  Bematech_FI_RelatorioGerencial('               MEIOS DE PAGAMENTO               ');
  Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Bematech_FI_RelatorioGerencial(TamDescricao(48, vTituloRel));
  Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));
  Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));
  obCupom.vMeiosPag.First;
  while not obCupom.vMeiosPag.dataSet.Eof do
  begin
    vtipDoc := '';
    vValorCancelado := obCupom.vMeiosPag.getValorCancelado(
      obCupom.vMeiosPag.dataSet.FieldByName('cod_finalizador').AsInteger,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime);
    if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString <> 'CUP' then
      vValorCancelado := 0;
    if vValorCancelado < obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat then
    begin
      if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'CUP' then
        vtipDoc := trim('Cupom Fiscal')
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'REC' then
        vtipDoc := 'Comprovante Nao Fiscal - ' +
          Trim(obCupom.vMeiosPag.dataSet.FieldByName('DESCRICAO').AsString)
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'SUP' then
        vtipDoc := TamDesc(48, 'Comprovante Não Fiscal - ') + 'Suprimento';

      Bematech_FI_RelatorioGerencial(
        TamDescricao(24, trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) +
        ' - ' + obCupom.vMeiosPag.dataSet.FieldByName('tipo_final').AsString) +
        TamDescricao(12, trim(obCupom.vMeiosPag.dataSet.FieldByName('data').AsString)) +
        TamDescricao(12, format('%9.2f', [obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
        vValorCancelado]))
          +
        TamDescricao(48, vTipDoc) + TamDescricao(48, ' '));
      flFinal := 0;
      for I := 1 to 99 do
      begin
        if aFinal[i] = trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) then
        begin
          aValor[i] := aValor[i] + obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
            vValorCancelado;
          flFinal := 1;
          Break;
        end;
      end;
      if flFinal = 0 then
      begin
        for I := 1 to 99 do
        begin
          if aFinal[i] = '' then
          begin
            aFinal[i] := trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString);
            aValor[i] := aValor[i] + obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
              vValorCancelado;
            Break;
          end;
        end;
      end;
    end;
    obCupom.vMeiosPag.next;
  end;
  for i := 1 to 99 do
  begin
    if aFinal[i] <> '' then
    begin
      Bematech_FI_RelatorioGerencial(TamDescricao(20, afinal[i]) +
        TamDescricao(28, Format('%12.2f', [aValor[i]])));
    end
    else
      Break;
  end;
  FechaRelatorioGerencial;
  obCupom.vMeiosPag.close;
end;

procedure TImpBematech.ImpResumoVnd;
var
  vindbarra, vindprod: string;
begin
  //
//  inherited;
  Bematech_FI_RelatorioGerencial('     RELATORIO DE QTDE DE PRODUTOS VENDIDOS ');
  Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Bematech_FI_RelatorioGerencial(' ');
  Bematech_FI_RelatorioGerencial(' ');
  //jp  vindbarra := dm.TBBarra.IndexName;
  //jp  vindprod := dm.TBProduto.IndexName;
  //jp  DM.TBBarra.IndexName := 'CodBarra';
  //jp  DM.TbProduto.IndexName := 'Produto4';
  while not obCupom.vTotalVenda.eof do
  begin
    //    obProd.vCodBarra.selecionaCodBarra(Trim(obCupom.vTotalVenda.dataSet.fieldbyname('codbarra').AsString));
    if obProd.selecionaProdutoGrupoCodigo(
      obCupom.vTotalVenda.dataSet.fieldbyname('GRUPO_PROD').AsInteger,
      obCupom.vTotalVenda.dataSet.fieldbyname('COD_PROD').AsString) then
      Bematech_FI_RelatorioGerencial(TamDescricao(48,TamDesc(29, obProd.dataSet.FieldByName('descr_prod').AsString) +
        '  ' + format('%8.5f', [obCupom.vTotalVenda.dataSet.fieldbyname('SOMA').AsFloat])));
    obCupom.vTotalVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obCupom.vTotalVenda.close;
  //jp  DM.TBBarra.IndexName := vindbarra;
  //jp  DM.TbProduto.IndexName := vindprod;
end;

function TImpBematech.imprimeDavNoEcf(dav: RVenda): boolean;
var
  temp: string;
  tamanhoLinha: integer;
  I: Integer;
begin
  tamanhoLinha := fQtdeColunasImpressao;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Documento Auxiliar de Venda'));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Doc Nº ' + vDadosIniF.StrZero(dav.nprevenda,
    vDadosIniF.vQtdeDigDAV) +
    '  Nº Doc Fiscal ___________'));
  temp := '';
  if dav.tipo_venda = 'REQ' then
    temp := 'Pedido de Venda Nº '
  else if TRIM(dav.tipo_venda) = 'OS' then
    temp := 'Ordem de Serviço Nº '
  else if dav.tipo_venda = 'ORC' then
    temp := 'Orçamento Nº ';
  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  //  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Cliente: ' +
    vDadosIniF.StrZero(dav.cod_cliente,
    6)
    + ' ' + dav.nome_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Endereço: ' + dav.endereco_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.bairro_cliente + ', ' + dav.cidade_cliente
    +
    '-'
    + dav.estado_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CPF/CNPJ: ' +
    vDadosIniF.StrZero(dav.cnpjcpf_cliente, 14) + '  Insc Est: ' + dav.insc_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Telefone: ' + dav.fone_cliente + '  Cond.Pag: '
    + dav.cond_pag));
  if Trim(dav.linhaAd1) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd1)));
  if Trim(dav.linhaAd2) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd2)));
  if Trim(dav.linhaAd3) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd3)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,
    'PRODUTO/SERVIÇO  QTDE     VL UNIT      VL TOTAL'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  for I := 0 to dav.qtde_Produtos + dav.qtde_Servicos - 1 do
  begin
    temp := IntToStr(i + 1) + ' ';
    if dav.item[i].tipo = 'P' then
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod) + ' ' + dav.item[i].cod_prod;
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end
    else
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod);
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end;
  end;
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Produtos..: ' +
      IntToStr(dav.qtde_Produtos)));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Serviços..: ' +
      IntToStr(dav.qtde_Servicos)));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Produtos....: ' + Format('%12.2f',
      [dav.valor_produtos])));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Serviços....: ' + Format('%12.2f',
      [dav.valor_servicos])));
  if dav.desconto > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Desconto..........: ' + Format('%12.2f',
      [dav.desconto])));
  if dav.acrescimo > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Acréscimo.........: ' + Format('%12.2f',
      [dav.acrescimo])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Líquido.....: ' + Format('%12.2f',
    [dav.valor_liquido])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,'Obs.: ' + dav.observacao));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  if dav.usar_Declaracao = 'S' then
  begin
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'Autorizo, nos termos do parágrafo 2º do artigo'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      '43 do codigo de defesa do consumidor o registro'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'do meu debito no servico de protecao ao credito,'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'e a respectiva correcao monetaria, ate a data'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'do seu efetivo pagamento, caso haja'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'inadimplencia de minhas obrigaçoes perante esta.'));

    RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  end;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, '______________________________'));
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Assinatura'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.empresa + '    ' + dav.fone_Empresa));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CNPJ: ' + dav.cgc_emp));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'E VEDADA A AUTENTICACAO DESTE DOCUMENTO'));
  result := FechaRelatorioGerencial = 1;
end;

function TImpBematech.Imprime_Prazo: boolean;
var
  ixx, i: integer;
  vcount, vfl, vret: integer;
  iInicio: Ttime;
  mes: array[1..12] of string;
  vdia, vmes, vano: word;
  cdinheiro: string;
begin
  Result := true;
  mes[1] := 'JANEIRO';
  mes[2] := 'FEVEREIRO';
  mes[3] := 'MARÇO';
  mes[4] := 'ABRIL';
  mes[5] := 'MAIO';
  mes[6] := 'JUNHO';
  mes[7] := 'JULHO';
  mes[8] := 'AGOSTO';
  mes[9] := 'SETEMBRO';
  mes[10] := 'OUTUBRO';
  mes[11] := 'NOVEMBRO';
  mes[12] := 'DEZEMBRO';
  //
 // BlockInput(true);
  if not obEmpresa.Active then
    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
  //
  vimptef := 1;
  vret := 1;
  vcanctef := 0;
  reimprime :='1';
  if reimprime = '0' then
  begin
    cdinheiro := vDadosIniF.StrZeroDec(StrToFloat(Fvvalpr), 15, 2);
    delete(cdinheiro, 13, 1);
    if vacr = 1 then
      Bematech_FI_AbreComprovanteNaoFiscalVinculado(pchar('Prazo     '), pchar(cdinheiro),
        pchar(vDadosIniF.StrZeroDec(Fvnc, 6, 0)));
  end;
  for i := 1 to obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger do
    // QtdCpNF.value do
  begin
    obCupom.vFPg.First;
    vcount := 1;
    while not obCupom.vFPg.eof do
    begin
      decodedate(obCupom.vFPg.dataSet.FieldByName('data_venc').AsDateTime, vano, vmes, vdia);
      vret := 1;
      if reimprime = '0' then
      begin
        if vcount > 1 then
        begin
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('=', 48)) = 0
            then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(vDadosIniF.vEmp.vRazaoSocial,48)) = 0 then
            break;
          if
            Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring,48)) = 0 then
            break;
          if
            Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(obEmpresa.dataSet.FieldByName('bairro_emp').AsString +
            ', ' + obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString,48)) = 0 then
            break;
          if
            Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(obEmpresa.dataSet.FieldByName('TELEFONE_EMP').AsString + ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario,48)) = 0 then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('=', 48)) = 0
            then
            break;
        end;
        //
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('Reconheco o valor da divida abaixo:',48)) =
          0
          then
          break;
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('NDOC').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString,48)) = 0 then
          break;
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat]),48)) = 0 then
          break;
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('OPERADOR: ' +
          vDadosIniF.vNomeFuncionario,48))
          = 0 then
          break;
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48)) = 0 then
          break;
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48)) = 0 then
          break;
        if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString,48)) = 0 then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString),48)) = 0 then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString,48)) = 0 then
            break;
        end
        else
        begin
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('CLIENTE: ' + obCupom.getNomeAvulso,48)) =
            0
            then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('ENDERECO: ' + obCupom.getBairroAvulso
            +
            ' ' + obCupom.getCidadeAvulso,48)) = 0 then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('CPF/CNPJ: ' +
            obCupom.getCpfCnpjAvulso,48))
            =
            0 then
            break;
        end;
        if
          Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString),48)) = 0 then
          break;
      end
      else
      begin
        if vcount > 1 then
        begin
          if Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
          if Bematech_FI_RelatorioGerencial(vDadosIniF.Space(obEmpresa.dataSet.FieldByName('NOME_EMP').AsString,48))
            = 0
            then
            break;
          if
            Bematech_FI_RelatorioGerencial(vDadosIniF.Space(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring,48))
            = 0 then
            break;
          if Bematech_FI_RelatorioGerencial(vDadosIniF.Space(obEmpresa.dataSet.FieldByName('BAIRRO_EMP').AsString
            +
            ', ' + obEmpresa.dataSet.FieldByName('CIDADE_EMP').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString,48)) = 0 then
            break;
          if
            Bematech_FI_RelatorioGerencial(vDadosIniF.Space(obEmpresa.dataSet.FieldByName('TELEFONE_EMP').AsString
            +
            ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario,48)) = 0 then
            break;
          if Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
        end;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Space('Reconheco o valor da divida abaixo:',48)) = 0 then
          break;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString,48)) = 0 then
          break;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Space('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat]),48)) = 0 then
          break;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Space('OPERADOR: ' + vDadosIniF.vNomeFuncionario,48)) = 0 then
          break;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48)) = 0 then
          break;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48)) = 0 then
          break;
        if Bematech_FI_RelatorioGerencial(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if Bematech_FI_RelatorioGerencial(vDadosIniF.Space('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString,48)) = 0 then
            break;
          if Bematech_FI_RelatorioGerencial(vDadosIniF.Space('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('Endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('Bairro').AsString),48)) = 0 then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('Cpfcgc').AsString,48)) = 0 then
            break;
        end
        else
        begin
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('CLIENTE: ' + obCupom.getNomeAvulso,48)) =
            0
            then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('ENDERECO: ' +
            obCupom.getEnderecoAvulso
            +
            ' ' + obCupom.getBairroAvulso,48)) = 0 then
            break;
          if Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space('CPF/CNPJ: ' +
            obCupom.getCpfCnpjAvulso,48))
            =
            0 then
            break;
        end;
        if
          Bematech_FI_RelatorioGerencial(vDadosIniF.Space(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString),48)) = 0 then
          break;
      end;
      if vret = 0 then
        break;
      retorno_ImpTEF;
      if vcanctef <> 0 then
        vret := 0;
      if vret = 0 then
        break;
      obCupom.vFPg.next;
      inc(vcount);
      if obCupom.vFPg.eof then
      begin
        {     if reimprime = '0' then
             begin
              vret:=Bematech_FI_UsaComprovanteNaoFiscalVinculado(' ');
              vret:=Bematech_FI_UsaComprovanteNaoFiscalVinculado(' ');
             end
             else
             begin
              vret:=Bematech_FI_RelatorioGerencial(' ');
              vret:=Bematech_FI_RelatorioGerencial(' ');
             end;
             if vret = 0 then
              break;}
      end
      else
      begin
        if reimprime = '0' then
        begin
          vret := Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48));
          vret := Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48));
          vret := Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48));
          vret := Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48));
        end
        else
        begin
          vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
          vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
          vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
          vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
        end;
      end;
    end;
    if vret = 0 then
      break
    else
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
        if vret = 0 then
          break;
        vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
        if vret = 0 then
          break;
      end;
    end;
    if i <> 2 then
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        iInicio := time;
        if reimprime = '0' then
        begin
          vret := Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48));
          if vret = 0 then
            break;
          vret := Bematech_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Space(' ',48));
          if vret = 0 then
            break;
        end
        else
        begin
          vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
          if vret = 0 then
            break;
          vret := Bematech_FI_RelatorioGerencial(vDadosIniF.Space(' ',48));
          if vret = 0 then
            break;
        end;
        //   IF dm.TBConfImpQtdCpNF.value > 1 then
       //    begin
        repeat
        until ((time - iInicio) > strtotime('00:00:02'));
        //    end;
      end;
    end;
  end;
  if vret = 0 then
    Imprime_Prazo := false
  else
  begin
    if reimprime = '1' then
      FechaRelatorioGerencial
    else
      FechaComprovanteNaoFiscalVinculado;
    Imprime_Prazo := true;
  end;
  // BlockInput(false);
end;

function TImpBematech.ImpTirouZSoz(vdat1: Tdate; Vdat2: Tdate): boolean;
begin
  if vdat1 = Vdat2 then
    Result := true
  else
    result := false;
end;

function TImpBematech.IniciaFechamentoCupom(AcrescimoDesconto,
  TipoAcrescimoDesconto: string; ValorAcrescimoDesconto: real): boolean;
var
  cDes_Acres: string;
  vrAcumGT: Currency;
begin
  Result := true;
  if (vTipoImpressora = 'BematechMP20') then
  begin
    cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 15, 2);
    delete(cDes_Acres, 13, 1);
    iRetorno := Bematech_FI_IniciaFechamentoCupom(acrescimoDesconto, '$', cDes_Acres);
    if not retorno_impGer(1) then
      iRetorno := 0;
    if iretorno = 1 then
    begin
      cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 13, 2);
      delete(cDes_Acres, 11, 1);
      vrAcumGT := ValorAcrescimoDesconto;
      iRetorno := Bematech_FI_IniciaFechamentoCupom(AcrescimoDesconto, '$', cDes_Acres);
      if (iretorno = 1) and (AcrescimoDesconto = 'A') then
        vdadosIniF.acumulaGrandeTotal(vrAcumGT);
      //if not retorno_impGer(1) then
      //  iRetorno := 0;
      if iretorno <> 1 then
      begin
        Analisa_iRetorno;
        IniciaFechamentoCupom := false;
        exit;
      end;
    end;
  end;

  if (vTipoImpressora = 'BematechMFD') then
  begin
    cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 15, 2);
    delete(cDes_Acres, 13, 1);

    {    cValor := DCAcres_Desc.Text;
        cTipoDesconto := '$';
        cValorDesc := cDes_Acres;
        cDescricao := '00000000000000';}
    vrAcumGT := ValorAcrescimoDesconto;
    iRetorno := 0;
    while iRetorno = 0 do
    begin
      iRetorno := Bematech_FI_IniciaFechamentoCupom(AcrescimoDesconto, '$', cDes_Acres);
      if iRetorno <> 1 then
      begin
        BlockInput(False);
        if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
          'Atenção',
          MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
          Break;
      end
      else Break;
      BlockInput(true);
      Sleep(2000);
      BlockInput(true);
    end;
    Analisa_iRetorno;
    result := Retorno_Impressora;
    if (iretorno = 1) and (AcrescimoDesconto = 'A') and (result) then
      vdadosIniF.acumulaGrandeTotal(vrAcumGT);
    //       iRetorno := Bematech_FI_IniciaFechamentoCupomMFD( DCAcres_Desc.Text, cTipoDesconto, cValorDesc ,cDescricao);
    //       ( pchar(DCAcres_Desc.Text), pchar('$'), pchar(cDes_Acres),pchar('00000000000000'));
    //if not retorno_impGer(1) then
    //  iRetorno := 0;

//    if iretorno <> 1 then
//    begin
//      Analisa_iRetorno;
//      IniciaFechamentoCupom := false;
//      exit;
//    end;
  end;

end;

function TImpBematech.IniciaFechamentoCupomMFD(AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto: string): boolean;
begin

end;

function TImpBematech.LeituraMemoriaFiscalData(vdata1,
  vdata2, CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
  end;
  Result := true;
  if vTipoImpressora <> 'BematechMFD' then
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalData(pchar(vdata1), pchar(vdata2));
    Analisa_iRetorno;
    result :=Retorno_Impressora;
  end
  else
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalDataMFD(pchar(vdata1), pchar(vdata2),
      pchar(CompletaSimplificada));
    Analisa_iRetorno;
    result:=Retorno_Impressora;
  end;
end;

function TImpBematech.LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): boolean;
begin

end;

function TImpBematech.LeituraMemoriaFiscalReducao(ReducaoInicial,
  ReducaoFinal, CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
  end;
  Result := true;
  if vTipoImpressora <> 'BematechMFD' then
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal);
    Analisa_iRetorno;
    Result := Retorno_Impressora;
  end
  else
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal,
      pchar(CompletaSimplificada));
    Analisa_iRetorno;
    result :=Retorno_Impressora;
  end;
end;

function TImpBematech.LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpBematech.LeituraMemoriaFiscalSerialData(DataInicial, DataFinal,
  CompletaSimplificada,
  endereco: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
  end;
  Result := true;
  if vTipoImpressora <> 'BematechMFD' then
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalSerialData(pchar(DataInicial),
      pchar(DataFinal));
    Analisa_iRetorno;
    result := Retorno_Impressora;
  end
  else
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalSerialDataMFD(pchar(DataInicial),
      pchar(DataFinal), pchar(CompletaSimplificada));
    Analisa_iRetorno;
    result:=Retorno_Impressora;
  end;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpBematech.LeituraMemoriaFiscalSerialDataMFD(DataInicial,
  DataFinal, FlagLeitura: string): boolean;
begin

end;

function TImpBematech.LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal,
  CompletaSimplificada, endereco: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
  end;
  Result := true;
  if vTipoImpressora <> 'BematechMFD' then
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal);
    Analisa_iRetorno;
    result :=Retorno_Impressora;
  end
  else
  begin
    iRetorno := Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal,
      pchar(CompletaSimplificada));
    Analisa_iRetorno;
    result:=Retorno_Impressora;
  end;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpBematech.LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpBematech.LeituraX: boolean;
begin
  Result := true;
  iRetorno := Bematech_FI_LeituraX();
  Analisa_iRetorno();
  Retorno_Impressora;
end;

function TImpBematech.LeTabelaResumo: boolean;
var
  Arq: TextFile;
  vdadredz: array[1..6] of string;
  vl: integer;
  resp: string;
begin
  Result := true;
  iRetorno := Bematech_FI_RelatorioTipo60Mestre();
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  removerLinhasEmBranco(fPathRetornoTXT);
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  vl := 1;
  while not eof(arq) do
  begin
    ReadLn(Arq, resp);
    if resp <> '' then
    begin
      if vl = 3 then
      begin
        FvDataRes := trim(copy(resp, 28, 25));
        if FvDataRes = '00/00/00' then
          FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
      end;
      if vl = 7 then // coo inicial
        Fvcooini := trim(copy(resp, 28, 25));
      if vl = 8 then // coo final
        Fvcoofin := trim(copy(resp, 28, 25));
      if vl = 9 then // contador de reduções
        FvContRed := trim(copy(resp, 28, 25));
      if vl = 10 then // reinicio de operações
        FvcontRein := trim(copy(resp, 28, 25));
      if vl = 11 then // Venda bruta
        FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      if vl = 12 then // Grante Total
        FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      vl := vl + 1;
    end;
  end;
  CloseFile(Arq); 
  diaCaixaFechado;
  montaMaparesumo;
  //Fim complemento resumo d
end;

function TImpBematech.MontaDescricao(vdesc, vunidade: string): string;
begin
  if Faitred = 'S' then
    Result := copy(vdesc, 1, 24) + ' ' + copy(vunidade, 1, 3)
  else
    Result := trim(vdesc) + ' ' + copy(vunidade, 1, 3);
end;

procedure TImpBematech.montaMaparesumo;
var
  resp, dataHoraUltDoc: string;
  registros: TStringList;
  vAliq: TAliquota;
  Arq: TextFile;
  vl: Integer;
  I: Integer;
  qtdeReg: Integer;
  vrtemp: Currency;
  vtemp: string;
  AInteger: Integer;
begin
  inherited;
  resp := '';
  //  dataHoraUltDoc := dataHoraUltimoDocumento;
//  vMapaResumo.dataRed := FvDataRes; // Copy(dataHoraUltDoc, 1, 10);
//  vMapaResumo.horaRed := FvHoraRes; // Copy(dataHoraUltDoc, 12, 8);
  if vDadosIniF.vmodimpbema = 'YANCO' then
    Sleep(2 * 1000);
  if CImpressoraF.vTemMFD then
    iRetorno := Bematech_FI_MapaResumoMFD()
  else
    iRetorno := Bematech_FI_MapaResumo();
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    exit;
  end;
  removerLinhasEmBranco(fPathRetornoTXT);
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK],
      0);
    exit;
  end;

  registros := TStringList.Create;
  if CImpressoraF.vTemMFD then
  begin
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if Pos('ISS.............................:', resp) > 0 then
          vMapaResumo.vlISS := trim(copy(resp, 34, 16))
        else if Pos('Isenção de ICMS', resp) > 0 then
          vMapaResumo.vlIsencaoICM := trim(copy(resp, 34, 16))
        else if Pos('Isenção de ISSQN', resp) > 0 then
          vMapaResumo.vlIsencaoISSQN := trim(copy(resp, 34, 16))
        else if Pos('Não Incidência de ICMS', resp) > 0 then
          vMapaResumo.vlNaoIncidenciaICMS := trim(copy(resp, 34, 16))
        else if Pos('Não Incidência de ISSQN', resp) > 0 then
          vMapaResumo.vlNaoIncidenciaISSQN := trim(copy(resp, 34, 16))
        else if Pos('Substituição Tributária de ICMS', resp) > 0 then
          vMapaResumo.vlSubstICMS := trim(copy(resp, 34, 16))
        else if Pos('Substituição Tributária de ISSQN', resp) > 0 then
          vMapaResumo.vlSubstISSQN := trim(copy(resp, 34, 16))
        else
        if vl = 1 then // Contador Reducao ZZ
          vMapaResumo.nreducoes := trim(copy(resp, 34, 16))
        else if vl = 2 then // COO Reducao
          vMapaResumo.coored := trim(copy(resp, 34, 16))
        else if vl = 4 then // Venda Liquida
          vMapaResumo.vlTotLiq := trim(copy(resp, 34, 16))
        else if vl = 5 then // Cancelamentos ICMS
          vMapaResumo.vlCancelamentoICMS := trim(copy(resp, 34, 16))
        else if vl = 6 then // Cancelamento ISSQn
          vMapaResumo.vlCancelamentoISSQN := trim(copy(resp, 34, 16))
        else if vl = 7 then // Acrescimo ICMS
          vMapaResumo.vlAcrescimoICMS := trim(copy(resp, 34, 16))
        else if vl = 8 then // Acrescimo ISSQN
          vMapaResumo.vlAcrescimoISSQN := trim(copy(resp, 34, 16))
        else if vl = 9 then // Desconto ICMS
          vMapaResumo.vlDescontoICMS := trim(copy(resp, 34, 16))
        else if vl = 10 then // Desconto ISSQN
          vMapaResumo.vlDescontoISSQN := trim(copy(resp, 34, 16))
        else if vl = 11 then // ISS
          vMapaResumo.vlISS := trim(copy(resp, 34, 16))
        else if vl = 12 then // Isencao de ICMS
          vMapaResumo.vlIsencaoICM := trim(copy(resp, 34, 16))
        else if vl = 13 then // Isencao de ISS
          vMapaResumo.vlIsencaoISSQN := trim(copy(resp, 34, 16))
        else if vl = 14 then // Nao Inciadencia ICMS
          vMapaResumo.vlNaoIncidenciaICMS := trim(copy(resp, 34, 16))
        else if vl = 15 then // Nao Incidencia ISS
          vMapaResumo.vlNaoIncidenciaISSQN := trim(copy(resp, 34, 16))
        else if vl = 16 then // Subst ICMS
          vMapaResumo.vlSubstICMS := trim(copy(resp, 34, 16))
        else if vl = 17 then // Subst ISSQN
          vMapaResumo.vlSubstISSQN := trim(copy(resp, 34, 16));

        vl := vl + 1;
        if pos('Substituição Tributária de ISS', resp) > 0 then
          while not eof(arq) do
          begin
            ReadLn(Arq, resp);
            if (resp <> '') and (copy(resp, 1, 4) <> '0000') and (TryStrToInt(copy(resp, 1, 4), AInteger)) then
              registros.Add(resp);
          end;
      end;
		end;
    registros.Add('Canc-T....' + vMapaResumo.vlCancelamentoICMS);
		registros.Add('Canc-S....' + vMapaResumo.vlCancelamentoISSQN);
		registros.Add('DT........' + vMapaResumo.vlDescontoICMS);
    registros.Add('DS........' + vMapaResumo.vlDescontoISSQN);
    registros.Add('F1........' + vMapaResumo.vlSubstICMS);
    registros.Add('FS1.......' + vMapaResumo.vlSubstISSQN);
    registros.Add('I1........' + vMapaResumo.vlIsencaoICM);
    registros.Add('IS1.......' + vMapaResumo.vlIsencaoISSQN);
    registros.Add('N1........' + vMapaResumo.vlNaoIncidenciaICMS);
    registros.Add('NS1.......' + vMapaResumo.vlNaoIncidenciaISSQN);
  end
  else
  begin
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 1 then // Contador Reducao ZZ
          vMapaResumo.nreducoes := trim(copy(resp, 25, 16))
        else if vl = 2 then // COO Reducao
          vMapaResumo.coored := trim(copy(resp, 25, 16))
        else if vl = 4 then // Venda Liquida
          vMapaResumo.vlTotLiq := trim(copy(resp, 25, 16))
        else if vl = 5 then // Cancelamentos
          vMapaResumo.vlCancel := trim(copy(resp, 25, 16))
        else if vl = 6 then // Acrescimos
          vMapaResumo.vlAcrescimo := trim(copy(resp, 25, 16))
        else if vl = 7 then // Descontos
          vMapaResumo.vlDesconto := trim(copy(resp, 25, 16))
        else if vl = 8 then // ISS
          vMapaResumo.vlISS := trim(copy(resp, 25, 16))
        else if vl = 9 then // Isençao
          vMapaResumo.vlIsentos := trim(copy(resp, 25, 16))
        else if vl = 10 then // Nao Incidencia
          vMapaResumo.vlNaoIncidencia := trim(copy(resp, 25, 16))
        else if vl = 11 then // Substituicao tributaria
          vMapaResumo.vlSubst := trim(copy(resp, 25, 16));
        vl := vl + 1;
        if pos('Subs', resp) > 0 then
          while not eof(arq) do
          begin
            ReadLn(Arq, resp);
            if (resp <> '') and (copy(resp, 1, 4) <> '0000') then
              registros.Add(resp);
          end;
      end;
    end;
    registros.Add('Canc-T....' + vMapaResumo.vlCancel);
    registros.Add('DT........' + vMapaResumo.vlDesconto);
    registros.Add('F1........' + vMapaResumo.vlSubst);
    registros.Add('I1........' + vMapaResumo.vlIsentos);
    registros.Add('N1........' + vMapaResumo.vlNaoIncidencia);
  end;
  CloseFile(Arq);
  if CImpressoraF.vTemMFD then
  begin
    qtdeReg:= 10;
    vrtemp := StrToCurr(vDadosIniF.tirapontos(vMapaResumo.vlTotLiq,2));
    vrtemp := vrtemp + StrToCurr(vDadosIniF.tirapontos(vMapaResumo.vlCancelamentoICMS,2));
    vrtemp := vrtemp + StrToCurr(vDadosIniF.tirapontos(vMapaResumo.vlDescontoICMS,2));
    vrtemp := vrtemp + StrToCurr(vDadosIniF.tirapontos(vMapaResumo.vlISS,2));
    vrtemp := vrtemp + StrToCurr(vDadosIniF.tirapontos(vMapaResumo.vlCancelamentoISSQN,2));
    vrtemp := vrtemp + StrToCurr(vDadosIniF.tirapontos(vMapaResumo.vlDescontoISSQN,2));
    if vDadosIniF.vLerVendaBruta = 'C' then
			vtemp := getVendaBruta(StrToInt(trim(vMapaResumo.coored)))
    else if vDadosIniF.vLerVendaBruta = 'D' then
      vtemp := getVendaBruta(StrToInt(trim(vMapaResumo.coored)),Trim(vMapaResumo.dataRed))
    else
      vtemp := '';
    if trim(vtemp) <> '' then
			FvvendBr := vtemp;

		{if vDadosIniF.strEstaContidoEm(vDadosIniF.vLerVendaBruta, ['C', 'D']) then
			for I := 0 to registros.Count - 1 - qtdeReg do
				if pos('Canc-S....', registros[i]) > 0 then
				begin
					registros[i] := 'Canc-S....' + vMapaResumo.vlCancelamentoISSQN;
					Break;
				end; }
  end
  else
    qtdeReg :=5;
  //if StrToFloat(vMapaResumo.vlIsentos)  > 0 then


  vMapaResumo.qtdeAliq := registros.Count;
  SetLength(vMapaResumo.valiqs, vMapaResumo.qtdeAliq);
  vAliq := TAliquota.create;
  vAliq.getTodos;

	for I := 0 to registros.Count - 1 - qtdeReg do
  begin
    vMapaResumo.valiqs[i].aliq := Copy(registros[i], 1, 2) + ',' + Copy(registros[i], 3, 2);
    registros[I] := Copy(registros[i], 5, Length(registros[i]));
    registros[I] := StringReplace(registros[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ':', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ' ', '', [rfReplaceAll, rfIgnoreCase]);
    vMapaResumo.valiqs[i].valor := StrToCurr(registros[i]);

    vAliq.First;
    while not vAliq.dataSet.Eof do
    begin
      if (vAliq.dataSet.FieldByName('aliq').AsCurrency = StrToCurr(vMapaResumo.valiqs[i].aliq))
        and (vAliq.dataSet.FieldByName('servico').AsString <> 'S') then
      begin
        vMapaResumo.valiqs[i].aliq :=
          vDadosIniF.StrZero(vAliq.dataSet.FieldByName('indice').AsInteger, 2) +
          'T' + StringReplace(vMapaResumo.valiqs[i].aliq, ',', '', [rfReplaceAll, rfIgnoreCase]);
        vMapaResumo.valiqs[i].seq :=
          vDadosIniF.StrZero(vAliq.dataSet.FieldByName('sequencia').AsString, 2);
        Break;
      end;
      vAliq.Next;
    end;
  end;
  for I := (registros.Count - qtdeReg) to registros.Count - 1 do
  begin
    vMapaResumo.valiqs[i].aliq := Copy(registros[i], 1, 10); // + ',' + Copy(registros[i], 3, 2);
    vMapaResumo.valiqs[i].aliq := StringReplace(vMapaResumo.valiqs[i].aliq, '.', '', [rfReplaceAll,
      rfIgnoreCase]);
    registros[I] := Copy(registros[i], 11, Length(registros[i]));
    registros[I] := StringReplace(registros[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ':', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ' ', '', [rfReplaceAll, rfIgnoreCase]);
    vMapaResumo.valiqs[i].valor := StrToCurr(registros[i]);
    vMapaResumo.valiqs[i].seq := vDadosIniF.StrZero(i, 2);
  end;
end;

function TImpBematech.numeroCCF: string;
var
  sCCF: string;
  cont: integer;
begin
  for cont := 1 to 6 do sCCF := sCCF + ' ';
  if (vTipoImpressora = 'BematechMFD') then
    iRetorno := Bematech_FI_ContadorCupomFiscalMFD(sCCF)
  else
    sCCF := NumeroCupom;
  result := sCCF;
end;

function TImpBematech.numeroCDC: string;
var
  sCDC: string;
  cont: integer;
begin
  for cont := 1 to 6 do sCDC := sCDC + ' ';
  if (vTipoImpressora = 'BematechMFD') then
    iRetorno := Bematech_FI_ContadorComprovantesCreditoMFD(sCDC)
  else
    sCDC:= NumeroCupom;
  result := sCDC;
end;

function TImpBematech.numeroCER: string;
var
	sCER: string;
	cont: integer;
begin
	setlength( sCER, 659 );
	if (vTipoImpressora = 'BematechMFD') then
		iRetorno := Bematech_FI_VerificaRelatorioGerencialMFD( sCER )
	else
		sCER := '0';
	if iRetorno = 1 then
		sCER := Copy(sCER, 1, 4);

//	for cont := 1 to 6 do sCER := sCER + ' ';
//	if (vTipoImpressora = 'BematechMFD') then
//		iRetorno := Bematech_FI_ContadorRelatoriosGerenciaisMFD(sCER)
//	else
//		sCER:= '0';
	result := sCER;
end;

function TImpBematech.numeroCOO: string;
begin
  Result := NumeroCupom;
end;

function TImpBematech.NumeroCupom: string;
var
  cnumerocupom: string;
var
  iConta: integer;
begin
  //     FPrinter.FechaComunicacao;
 //     Bematech_FI_AbrePortaSerial;
  for iConta := 1 to 6 do begin cNumeroCupom := cNumeroCupom + ' '
  end;
  iRetorno := 0;
  while iRetorno <> 1 do
  begin
    BlockInput(False);
    iRetorno := Bematech_FI_NumeroCupom(cNumeroCupom);
    if iRetorno <> 1 then
    begin
      //      if Application.MessageBox(pchar('Impressora não responde. Tentar novamente?'),
      //        'Atenção',
      //        MB_ICONINFORMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
    BlockInput(true);
  end;
  //     Bematech_FI_FechaPortaSerial;
  NumeroCupom := cNumeroCupom;
end;

function TImpBematech.numeroGNF: string;
var
  sGNF: string;
  cont: integer;
begin
  for cont := 1 to 6 do sGNF := sGNF + ' ';
  iRetorno := Bematech_FI_NumeroOperacoesNaoFiscais(sGNF);
  result := sGNF;
end;

function TImpBematech.numeroGRG: string;
var
  sGRG: string;
  cont: integer;
begin
  for cont := 1 to 6 do sGRG := sGRG + ' ';
  if (vTipoImpressora = 'BematechMFD') then
    iRetorno := Bematech_FI_ContadorRelatoriosGerenciaisMFD(sGRG)
  else
    sGRG := NumeroCupom;
  result := sGRG;
end;

function TImpBematech.NumeroSerie: string;
var
  retorno_var: string;
  iConta: integer;
begin
  Retorno_var := '';
  if (vTipoImpressora = 'BematechMFD') then
  begin
    for iConta := 1 to 20 do begin Retorno_var := Retorno_var + ' '
    end;
    // função que retorna o número de série da impressora
    iretorno := Bematech_FI_NumeroSerieMFD(Retorno_var);
  end
  else
  begin
    for iConta := 1 to 15 do begin Retorno_var := Retorno_var + ' '
    end;
    // função que retorna o número de série da impressora
    iRetorno := Bematech_FI_NumeroSerie(Retorno_var);
  end;

  // Procedure que analisa o retorno da função
  Analisa_iRetorno();
  //     FPrinter.AtualizaEprom;
  //     Retorno_var:=FPrinter.UltimaResp;
  if iRetorno > 0 then
    NumeroSerie := retorno_var
  else
  begin
    ShowMessage(retorno_var);
    NumeroSerie := '';
  end;
end;

function TImpBematech.NumeroSerieMFD: string;
begin

end;

function TImpBematech.obterCNPJUsuario: string;
var
  vCNPJ: string;
  i: integer;
begin
  vCNPJ := '';
  for i := 1 to 20 do vCNPJ := vCNPJ + ' ';
  if vTemMFD then
    iRetorno := Bematech_FI_CNPJMFD(vCNPJ)
  else
    vCNPJ := '';
  result := trim(removeCaracteresCNPJ(vCNPJ));
end;

function TImpBematech.PrazoECF: boolean;
var
  vret: integer;
begin
  Result := true;
  Bematech_FI_AbrePortaSerial;
  reimprime := '0';
  vacr := 1;
  while not Imprime_Prazo do
  begin
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if reimprime = '1' then
        FechaRelatorioGerencial
      else
        FechaComprovanteNaoFiscalVinculado;
      break;
    end
    else
    begin
      Result := true;
      //tef      sTEFRetorno := '0';
      if reimprime = '1' then
      begin
        vret := FechaRelatorioGerencial;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaRelatorioGerencial
          else
          begin
            Result := false;
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        if not result then
          //tef        if sTEFRetorno = '1' then
          break;
      end
      else
      begin
        vret := FechaComprovanteNaoFiscalVinculado;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaComprovanteNaoFiscalVinculado
          else
          begin
            Result := FALSE;
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        if not result then
          //tef        if sTEFRetorno = '1' then
          break;
        if vret <> 0 then
          reimprime := '1';
      end;
    end;
  end;
  Bematech_FI_FechaPortaSerial;
end;

function TImpBematech.ProgramaFormaPagamentoMFD(FormaPagto,
  OperacaoTef: string): boolean;
begin

end;

function TImpBematech.ProgramaHorarioVerao: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := true;
  FlagsFiscais:=0;
  iRetorno := Bematech_FI_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then
  begin
    Application.MessageBox('Horário de verão já esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  iRetorno := Bematech_FI_ProgramaHorarioVerao();
  Analisa_iRetorno;
  result  := Retorno_Impressora;
  //retorno_impGer(1);
  //if iRetorno = 0 then
  //result:= false;
end;

function TImpBematech.RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Bematech_FI_RecebimentoNaoFiscal(indicetotalizador, Valor, FormaPagamento);
  if iretorno <> 1 then
    result := False;
  Analisa_iRetorno;
  result := Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

procedure TImpBematech.recuperacaoAutomaticaAliquotas;
var
  vAliq: TAliquota;
  I: Integer;
  sAliquotas, sIndices, temp, tempInd: string;
  cont, contIndices: integer;
begin
  inherited;

  sAliquotas := '';
  for cont := 1 to 79 do sAliquotas := sAliquotas + ' ';
  iRetorno := Bematech_FI_RetornoAliquotas(sAliquotas);
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    exit;
  end;
  sAliquotas := StringReplace(sAliquotas, ',', '', [rfReplaceAll, rfIgnoreCase]);

  vAliq := TAliquota.create;
  vAliq.apagaAliquotas;

  // Incluindo aliquotas de serviço
  sindices := '';
  for cont := 1 to 48 do sIndices := sIndices + ' ';
  iRetorno := Bematech_FI_VerificaIndiceAliquotasIss(sIndices);
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    exit;
  end;
  sIndices := StringReplace(sIndices, ',', '', [rfReplaceAll, rfIgnoreCase]);
  cont := 1;
  contIndices := 1;
  for I := 1 to 16 do
  begin
    tempInd := trim(copy(sIndices, contIndices, 2));
    if tempInd = '' then
      Break;
    try
      temp := copy(sAliquotas, (StrToInt(tempInd) * 4) - 3, 4);
      vAliq.incluiAliquota(vDadosIniF.StrZero(StrToInt(tempInd), 2), 'S', StrToFloat(copy(temp,
        1, 2) + ',' + copy(temp, 3, 2)), StrToInt(tempInd));
    except
    end;
    inc(contIndices, 2);
  end;
  //Fim incluindo aliquotas de servico

  cont := 1;
  for I := 1 to 16 do
  begin
    temp := trim(copy(sAliquotas, cont, 4));
    if temp = '' then
      Break;
    vAliq.incluiAliquota(vDadosIniF.StrZero(i, 2), 'N', StrToFloat(copy(temp, 1, 2) + ',' +
      copy(temp, 3, 2)), i);
    inc(cont, 4);
  end;
  //Fim incluindo aliquotas de icms

  vAliq.free;
  vAliq := nil;
end;

procedure TImpBematech.regconfPorta(vport: string);
var
  inifile: Tinifile;
begin
  try
    if StrToInt(Trim(vport)) > 0 then
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + 'BemaFI32.ini') then
      begin
      IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'BemaFI32.ini');
      if StrToIntDef(vport, -1) = -1 then
      IniFile.WriteString('Sistema', 'porta', vport)
      else
      IniFile.WriteString('Sistema', 'porta', 'COM' + vport);
      inifile.Free;
      end;
    //  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'BemaFI32.ini');
    //  IniFile.WriteString('Sistema', 'ControlePorta', vport);
    //  inifile.Free;
      if FileExists(vDadosIniF.vEndConfigDll + 'BemaFI32.ini') then
      begin
      IniFile := TIniFile.Create(vDadosIniF.vEndConfigDll + 'BemaFI32.ini');
      if StrToIntDef(vport, -1) = -1 then
      IniFile.WriteString('Sistema', 'porta', vport)
      else
      IniFile.WriteString('Sistema', 'porta', 'COM' + vport);
      inifile.Free;
      end;
    //  IniFile := TIniFile.Create(vDadosIniF.vEndConfigDll + 'BemaFI32.ini');
    //  IniFile.WriteString('Sistema', 'ControlePorta', vport);
    //  inifile.Free;
      if FileExists('C:\Windows\system32\BemaFI32.ini') then
      begin
      IniFile := TIniFile.Create('C:\Windows\system32\BemaFI32.ini');
      if StrToIntDef(vport, -1) = -1 then
      IniFile.WriteString('Sistema', 'porta', vport)
      else
      IniFile.WriteString('Sistema', 'porta', 'COM' + vport);
      inifile.Free;
      end;
    end;
  except
  end;
end;

function TImpBematech.RelatorioGerencial(Texto: string): integer;
begin
  Result := Bematech_FI_RelatorioGerencial(Texto);
end;

function TImpBematech.RelatorioGerencial2(Texto: string): Integer;
begin
  Result := 0;
  while Result = 0 do
  begin
    Result := Bematech_FI_RelatorioGerencial(Texto);
    if Result <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        Break;
    end
    else Break;
  end;
end;

function TImpBematech.RelatorioTipo60Mestre: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
    if vFvmodimpbema = 'YANCO' then
    begin
      exit;
    end
    else
    begin
      iRetorno := Bematech_FI_RelatorioTipo60Mestre();
      Analisa_iRetorno();
      Retorno_Impressora;
      if iretorno <> 1 then
      begin
        Retorno_Impressora;
        messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
        Result := false;
        exit;
      end;
      removerLinhasEmBranco(fPathRetornoTXT);
      AssignFile(Arq, fPathRetornoTXT);
      try
        reset(arq);
      except
        messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK],
          0);
        Result := false;
        exit;
      end;
      vl := 1;
      while not eof(arq) do
      begin
        ReadLn(Arq, resp);
        if resp <> '' then
        begin
          if vl = 7 then // coo inicial
            Fvcooini := trim(copy(resp, 28, 25));
          if vl = 8 then // coo final
            Fvcoofin := trim(copy(resp, 28, 25));
          if vl = 9 then // contador de reduções
            FvContRed := trim(copy(resp, 28, 25));
          if vl = 10 then // reinicio de operações
            FvcontRein := trim(copy(resp, 28, 25));
          if vl = 11 then // Venda bruta
            FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          if vl = 12 then // Grante Total
            FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          vl := vl + 1;
        end;
      end;
      CloseFile(Arq);
    end;
    //        delefile(Arq);
    FechaPortaSerial;
  end
  else
  begin
    Retorno_Impressora;
    Result := false;
    exit;
  end
end;

function TImpBematech.RetornoImpressora(var ACK, ST1,
  ST2: Integer): boolean;
begin
    iRetorno:= Bematech_FI_VerificaEstadoImpressora(ACK, ST1, ST2);
    Analisa_iRetorno;
    if iRetorno = 1 then
      result:= true
    else
      result:= false;
end;


function TImpBematech.retorno_Imp: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := Bematech_FI_NumeroSerie(cNumeroSerie);
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      vFVccancTef := 1;
      //vcanctef := 1;
      Retorno_Imp := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_Imp := false;
    end;
  end
  else
    Retorno_Imp := true;
end;

function TImpBematech.retorno_ImpGer(vflap: integer): boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  vflg: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  //
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  {  if retorno <> 1 then
      Result := false
    else
    begin}
  if iACK = 6 then
  begin
    vflg := 0;
    if iST2 >= 128 then
    begin
      if vflap = 1 then
        messagedlg('Parâmetro inválido', mtinformation, [mbOK], 0);
      iST2 := iST2 - 128;
      result := false;
      vflg := 1;
    end;
    if iST2 >= 64 then
    begin
      iST2 := iST2 - 64;
      vflg := 1;
    end;
    if iST2 >= 32 then
    begin
      iST2 := iST2 - 32;
      vflg := 1;
    end;
    if iST2 >= 16 then
    begin
      iST2 := iST2 - 16;
      if vflap = 1 then
        messagedlg('Aliquota não Programada', mtinformation, [mbOK], 0);
      result := false;
      vflg := 1;
    end;
    if iST2 >= 8 then
    begin
      iST2 := iST2 - 8;
    end;
    if iST2 >= 4 then
    begin
      iST2 := iST2 - 4;
    end;
    if iST2 >= 2 then
    begin
      iST2 := iST2 - 2;
    end;
    if iST2 >= 1 then
    begin
      iST2 := iST2 - 1;
      if vflap = 1 then
        messagedlg('Comando não Executado', mtinformation, [mbOK], 0);
      result := false;
      vflg := 1;
    end;
    if vflg = 0 then
      result := true;
  end
  else
    result := true;
  //  end;
end;

function TImpBematech.Retorno_Impressora:boolean;
Var
  iACK, iST1, iST2, iST3: Integer;
begin
  try
    iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
    vRetornoDll.retornoFuncao := '' ;
    vRetornoDll.estadoImpressora := '';
    vRetornoDll.estadoFuncao := '';

    if ( vTemMFD ) then
       iRetorno := Bematech_FI_RetornoImpressoraMFD( iACK, iST1, iST2, iST3 )
    else
       iRetorno := Bematech_FI_RetornoImpressora( iACK, iST1, iST2 );
    if iRetorno <> 1 then
    begin
      Result := False;
      exit;
    end;

    Result := True;

    If iACK = 21 Then
    BEGIN
      Application.MessageBox( 'A Impressora retornou NAK. O programa será abortado!', 'Erro', MB_IconError + MB_OK );
      Application.Terminate;
      Exit;
    End
    else if iACK = 0 then
      result := False
    else if ( vTemMFD ) and (vRetExtHab) and (iACK = 6) then
    begin
      vRetornoDll.retornoFuncao := 'ERRO';
      Result:= False;
      case iST3 of
        000:
          begin
            Result:= True;
            vRetornoDll.estadoFuncao := 'COMANDO OK';
            vRetornoDll.retornoFuncao := 'OK';
          end;
        001: vRetornoDll.estadoFuncao := 'COMANDO INVÁLIDO';
        002: vRetornoDll.estadoFuncao := 'ERRO DESCONHECIDO';
        003: vRetornoDll.estadoFuncao := 'NÚMERO DE PARÂMETRO INVÁLIDO';
        004: vRetornoDll.estadoFuncao := 'TIPO DE PARÂMETRO INVÁLIDO';
        005: vRetornoDll.estadoFuncao := 'TODAS ALÍQUOTAS JÁ PROGRAMADAS';
        006: vRetornoDll.estadoFuncao := 'TOTALIZADOR NÃO FISCAL JÁ PROGRAMADO';
        007: vRetornoDll.estadoFuncao := 'CUPOM FISCAL ABERTO';
        008: vRetornoDll.estadoFuncao := 'CUPOM FISCAL FECHADO';
        009: vRetornoDll.estadoFuncao := 'ECF OCUPADO';
        010: vRetornoDll.estadoFuncao := 'IMPRESSORA EM ERRO';
        011: vRetornoDll.estadoFuncao := 'IMPRESSORA SEM PAPEL';
        012: vRetornoDll.estadoFuncao := 'IMPRESSORA COM CABEÇA LEVANTADA';
        013: vRetornoDll.estadoFuncao := 'IMPRESSORA OFF LINE';
        014: vRetornoDll.estadoFuncao := 'ALÍQUOTA NÃO PROGRAMADA';
        015: vRetornoDll.estadoFuncao := 'TERMINADOR DE STRING FALTANDO';
        016: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO MAIOR QUE O TOTAL DO CUPOM FISCAL';
        017: vRetornoDll.estadoFuncao := 'CUPOM FISCAL SEM ITEM VENDIDO';
        018: vRetornoDll.estadoFuncao := 'COMANDO NÃO EFETIVADO';
        019: vRetornoDll.estadoFuncao := 'SEM ESPAÇO PARA NOVAS FORMAS DE PAGAMENTO';
        020: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO NÃO PROGRAMADA';
        021: vRetornoDll.estadoFuncao := 'ÍNDICE MAIOR QUE NÚMERO DE FORMA DE PAGAMENTO';
        022: vRetornoDll.estadoFuncao := 'FORMAS DE PAGAMENTO ENCERRADAS';
        023: vRetornoDll.estadoFuncao := 'CUPOM NÃO TOTALIZADO';
        024: vRetornoDll.estadoFuncao := 'COMANDO MAIOR QUE 7Fh (127d)';
        025: vRetornoDll.estadoFuncao := 'CUPOM FISCAL ABERTO E SEM ÍTEM';
        026: vRetornoDll.estadoFuncao := 'CANCELAMENTO NÃO IMEDIATAMENTE APÓS';
        027: vRetornoDll.estadoFuncao := 'CANCELAMENTO JÁ EFETUADO';
        028: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO OU JÁ EMITIDO';
        029: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO NÃO PERMITE TEF';
        030: vRetornoDll.estadoFuncao := 'SEM COMPROVANTE NÃO FISCAL ABERTO';
        031: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO JÁ ABERTO';
        032: vRetornoDll.estadoFuncao := 'REIMPRESSÃO NÃO PERMITIDA';
        033: vRetornoDll.estadoFuncao := 'COMPROVANTE NÃO FISCAL JÁ ABERTO';
        034: vRetornoDll.estadoFuncao := 'TOTALIZADOR NÃO FISCAL NÃO PROGRAMADO';
        035: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL SEM ÍTEM VENDIDO';
        036: vRetornoDll.estadoFuncao := 'ACRÉSCIMO E DESCONTO MAIOR QUE TOTAL CNF';
        037: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO NÃO INDICADO';
        038: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO DIFERENTE DO TOTAL DO RECEBIMENTO';
        039: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO MAIS DE UMA SANGRIA OU SUPRIMENTO';
        040: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL JÁ PROGRAMADO';
        041: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL NÃO PROGRAMADO';
        042: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL NÃO PERMITIDO';
        043: vRetornoDll.estadoFuncao := 'MFD NÃO INICIALIZADA';
        044: vRetornoDll.estadoFuncao := 'MFD AUSENTE';
        045: vRetornoDll.estadoFuncao := 'MFD SEM NÚMERO DE SÉRIE';
        046: vRetornoDll.estadoFuncao := 'MFD JÁ INICIALIZADA';
        047: vRetornoDll.estadoFuncao := 'MFD LOTADA';
        048: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL ABERTO';
        049: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL DESCONECTADA';
        050: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM NÚMERO DE SÉRIE DA MFD';
        051: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL LOTADA';
        052: vRetornoDll.estadoFuncao := 'DATA INICIAL INVÁLIDA';
        053: vRetornoDll.estadoFuncao := 'DATA FINAL INVÁLIDA';
        054: vRetornoDll.estadoFuncao := 'CONTADOR DE REDUÇÃO Z INICIAL INVÁLIDO';
        055: vRetornoDll.estadoFuncao := 'CONTADOR DE REDUÇÃO Z FINAL INVÁLIDO';
        056: vRetornoDll.estadoFuncao := 'ERRO DE ALOCAÇÃO';
        057: vRetornoDll.estadoFuncao := 'DADOS DO RTC INCORRETOS';
        058: vRetornoDll.estadoFuncao := 'DATA ANTERIOR AO ÚLTIMO DOCUMENTO EMITIDO';
        059: vRetornoDll.estadoFuncao := 'FORA DE INTERVENÇÃO TÉCNICA';
        060: vRetornoDll.estadoFuncao := 'EM INTERVENÇÃO TÉCNICA';
        061: vRetornoDll.estadoFuncao := 'ERRO NA MEMÓRIA DE TRABALHO';
        062: vRetornoDll.estadoFuncao := 'JÁ HOUVE MOVIMENTO NO DIA';
        063: vRetornoDll.estadoFuncao := 'BLOQUEIO POR RZ';
        064: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO ABERTA';
        065: vRetornoDll.estadoFuncao := 'AGUARDANDO PRIMEIRO PROPRIETÁRIO';
        066: vRetornoDll.estadoFuncao := 'AGUARDANDO RZ';
        067: vRetornoDll.estadoFuncao := 'ECF OU LOJA IGUAL A ZERO';
        068: vRetornoDll.estadoFuncao := 'CUPOM ADICIONAL NÃO PERMITIDO';
        069: vRetornoDll.estadoFuncao := 'DESCONTO MAIOR QUE TOTAL VENDIDO EM ICMS';
        070: vRetornoDll.estadoFuncao := 'RECEBIMENTO NÃO FISCAL NULO NÃO PERMITIDO';
        071: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO MAIOR QUE TOTAL NÃO FISCAL';
        072: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL LOTADA PARA NOVO CARTUCHO';
        073: vRetornoDll.estadoFuncao := 'ERRO DE GRAVAÇÃO NA MF';
        074: vRetornoDll.estadoFuncao := 'ERRO DE GRAVAÇÃO NA MFD';
        075: vRetornoDll.estadoFuncao := 'DADOS DO RTC ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
        076: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR LEITURAS DA MFD';
        077: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR VERSAO DO SB';
        078: vRetornoDll.estadoFuncao := 'DESCRIÇÃO IGUAL A DEFAULT NÃO PERMITIDO';
        079: vRetornoDll.estadoFuncao := 'EXTRAPOLADO NÚMERO DE REPETIÇÕES PERMITIDAS';
        080: vRetornoDll.estadoFuncao := 'SEGUNDA VIA DO COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO';
        081: vRetornoDll.estadoFuncao := 'PARCELAMENTO FORA DA SEQUÊNCIA';
        082: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
        083: vRetornoDll.estadoFuncao := 'TEXTO COM SEQUÊNCIA DE ESC INVÁLIDA';
        084: vRetornoDll.estadoFuncao := 'TEXTO COM SEQUÊNCIA DE ESC INCOMPLETA';
        085: vRetornoDll.estadoFuncao := 'VENDA COM VALOR NULO';
        086: vRetornoDll.estadoFuncao := 'ESTORNO DE VALOR NULO';
        087: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO DIFERENTE DO TOTAL DA SANGRIA';
        088: vRetornoDll.estadoFuncao := 'REDUÇÃO NÃO PERMITIDA EM INTERVENÇÃO TÉCNICA';
        089: vRetornoDll.estadoFuncao := 'AGUARDANDO RZ PARA ENTRADA EM INTERVENÇÃO TÉCNICA';
        090: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO COM VALOR NULO NÃO PERMITIDO';
        091: vRetornoDll.estadoFuncao := 'ACRÉSCIMO E DESCONTO MAIOR QUE VALOR DO ÍTEM';
        092: vRetornoDll.estadoFuncao := 'AUTENTICAÇÃO NÃO PERMITIDA';
        093: vRetornoDll.estadoFuncao := 'TIMEOUT NA VALIDAÇÃO';
        094: vRetornoDll.estadoFuncao := 'COMANDO NÃO EXECUTADO EM IMPRESSORA BILHETE DE PASSAGEM';
        095: vRetornoDll.estadoFuncao := 'COMANDO NÃO EXECUTADO EM IMPRESSORA DE CUPOM FISCAL';
        096: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL FECHADO';
        097: vRetornoDll.estadoFuncao := 'PARÂMETRO NÃO ASCII EM CAMPO ASCII';
        098: vRetornoDll.estadoFuncao := 'PARÂMETRO NÃO ASCII NUMÉRICO EM CAMPO ASCII NUMÉRICO';
        099: vRetornoDll.estadoFuncao := 'TIPO DE TRANSPORTE INVÁLIDO';
        100: vRetornoDll.estadoFuncao := 'DATA E HORA INVÁLIDA';
        101: vRetornoDll.estadoFuncao := 'SEM RELATÓRIO GERENCIAL OU COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
        102: vRetornoDll.estadoFuncao := 'NÚMERO DO TOTALIZADOR NÃO FISCAL INVÁLIDO';
        103: vRetornoDll.estadoFuncao := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
        104: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO EM SANGRIA OU SUPRIMENTO NÃO PERMITIDO';
        105: vRetornoDll.estadoFuncao := 'NÚMERO DO RELATÓRIO GERENCIAL INVÁLIDO';
        106: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO ORIGEM NÃO PROGRAMADA';
        107: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO DESTINO NÃO PROGRAMADA';
        108: vRetornoDll.estadoFuncao := 'ESTORNO MAIOR QUE FORMA PAGAMENTO';
        109: vRetornoDll.estadoFuncao := 'CARACTER NUMÉRICO NA CODIFICAÇÃO GT NÃO PERMITIDO';
        110: vRetornoDll.estadoFuncao := 'ERRO NA INICIALIZAÇÃO DA MF';
        111: vRetornoDll.estadoFuncao := 'NOME DO TOTALIZADOR EM BRANCO NÃO PERMITIDO';
        112: vRetornoDll.estadoFuncao := 'DATA E HORA ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
        113: vRetornoDll.estadoFuncao := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
        114: vRetornoDll.estadoFuncao := 'ÍTEM ANTERIOR AOS TREZENTOS ÚLTIMOS';
        115: vRetornoDll.estadoFuncao := 'ÍTEM NÃO EXISTE OU JÁ CANCELADO';
        116: vRetornoDll.estadoFuncao := 'CÓDIGO COM ESPAÇOS NÃO PERMITIDO';
        117: vRetornoDll.estadoFuncao := 'DESCRICAO SEM CARACTER ALFABÉTICO NÃO PERMITIDO';
        118: vRetornoDll.estadoFuncao := 'ACRÉSCIMO MAIOR QUE VALOR DO ÍTEM';
        119: vRetornoDll.estadoFuncao := 'DESCONTO MAIOR QUE VALOR DO ÍTEM';
        120: vRetornoDll.estadoFuncao := 'DESCONTO EM ISS NÃO PERMITIDO';
        121: vRetornoDll.estadoFuncao := 'ACRÉSCIMO EM ÍTEM JÁ EFETUADO';
        122: vRetornoDll.estadoFuncao := 'DESCONTO EM ÍTEM JÁ EFETUADO';
        123: vRetornoDll.estadoFuncao := 'ERRO NA MEMÓRIA FISCAL CHAMAR CREDENCIADO';
        124: vRetornoDll.estadoFuncao := 'AGUARDANDO GRAVAÇÃO NA MEMÓRIA FISCAL';
        125: vRetornoDll.estadoFuncao := 'CARACTER REPETIDO NA CODIFICAÇÃO DO GT';
        126: vRetornoDll.estadoFuncao := 'VERSÃO JÁ GRAVADA NA MEMÓRIA FISCAL';
        127: vRetornoDll.estadoFuncao := 'ESTOURO DE CAPACIDADE NO CHEQUE';
        128: vRetornoDll.estadoFuncao := 'TIMEOUT NA LEITURA DO CHEQUE';
        129: vRetornoDll.estadoFuncao := 'MÊS INVÁLIDO';
        130: vRetornoDll.estadoFuncao := 'COORDENADA INVÁLIDA';
        131: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO';
        132: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO VALOR';
        133: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO EXTENSO';
        134: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO FAVORECIDO';
        135: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NA LOCALIDADE';
        136: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO OPCIONAL';
        137: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO DIA';
        138: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO MÊS';
        139: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO ANO';
        140: vRetornoDll.estadoFuncao := 'USANDO MFD DE OUTRO ECF';
        141: vRetornoDll.estadoFuncao := 'PRIMEIRO DADO DIFERENTE DE ESC OU 1C';
        142: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO ALTERAR SEM INTERVENÇÃO TÉCNICA';
        143: vRetornoDll.estadoFuncao := 'DADOS DA ÚLTIMA RZ CORROMPIDOS';
        144: vRetornoDll.estadoFuncao := 'COMANDO NÃO PERMITIDO NO MODO INICIALIZAÇÃO';
        145: vRetornoDll.estadoFuncao := 'AGUARDANDO ACERTO DE RELÓGIO';
        146: vRetornoDll.estadoFuncao := 'MFD JÁ INICIALIZADA PARA OUTRA MF';
        147: vRetornoDll.estadoFuncao := 'AGUARDANDO ACERTO DO RELÓGIO OU DESBLOQUEIO PELO TECLADO';
        148: vRetornoDll.estadoFuncao := 'VALOR FORMA DE PAGAMENTO MAIOR QUE MÁXIMO PERMITIDO';
        149: vRetornoDll.estadoFuncao := 'RAZÃO SOCIAL EM BRANCO';
        150: vRetornoDll.estadoFuncao := 'NOME DE FANTASIA EM BRANCO';
        151: vRetornoDll.estadoFuncao := 'ENDEREÇO EM BRANCO';
        152: vRetornoDll.estadoFuncao := 'ESTORNO DE CDC NÃO PERMITIDO';
        153: vRetornoDll.estadoFuncao := 'DADOS DO PROPRIETÁRIO IGUAIS AO ATUAL';
        154: vRetornoDll.estadoFuncao := 'ESTORNO DE FORMA DE PAGAMENTO NÃO PERMITIDO';
        155: vRetornoDll.estadoFuncao := 'DESCRIÇÃO FORMA DE PAGAMENTO IGUAL JÁ PROGRAMADA';
        156: vRetornoDll.estadoFuncao := 'ACERTO DE HORÁRIO DE VERÃO SÓ IMEDIATAMENTE APÓS RZ';
        157: vRetornoDll.estadoFuncao := 'IT NÃO PERMITIDA MF RESERVADA PARA RZ';
        158: vRetornoDll.estadoFuncao := 'SENHA CNPJ INVÁLIDA';
        159: vRetornoDll.estadoFuncao := 'TIMEOUT NA INICIALIZAÇÃO DA NOVA MF';
        160: vRetornoDll.estadoFuncao := 'NÃO ENCONTRADO DADOS NA MFD';
        161: vRetornoDll.estadoFuncao := 'SANGRIA OU SUPRIMENTO DEVEM SER ÚNICOS NO CNF';
        162: vRetornoDll.estadoFuncao := 'ÍNDICE DA FORMA DE PAGAMENTO NULO NÃO PERMITIDO';
        163: vRetornoDll.estadoFuncao := 'UF DESTINO INVÁLIDA';
        164: vRetornoDll.estadoFuncao := 'TIPO DE TRANSPORTE INCOMPATÍVEL COM UF DESTINO';
        165: vRetornoDll.estadoFuncao := 'DESCRIÇÃO DO PRIMEIRO ÍTEM DO BILHETE DE PASSAGEM DIFERENTE DE "TARIFA"';
        166: vRetornoDll.estadoFuncao := 'AGUARDANDO IMPRESSÃO DE CHEQUE OU AUTENTICAÇÃO';
        167: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO PROGRAMAÇAO CNPJ IE COM ESPAÇOS EM BRANCO';
        168: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO PROGRAMAÇÃO UF COM ESPAÇOS EM BRANCO';
        169: vRetornoDll.estadoFuncao := 'NÚMERO DE IMPRESSÕES DA FITA DETALHE NESTA INTERVENÇÃO TÉCNICA ESGOTADO';
        170: vRetornoDll.estadoFuncao := 'CF JÁ SUBTOTALIZADO';
        171: vRetornoDll.estadoFuncao := 'CUPOM NÃO SUBTOTALIZADO';
        172: vRetornoDll.estadoFuncao := 'ACRÉSCIMO EM SUBTOTAL JÁ EFETUADO';
        173: vRetornoDll.estadoFuncao := 'DESCONTO EM SUBTOTAL JÁ EFETUADO';
        174: vRetornoDll.estadoFuncao := 'ACRÉSCIMO NULO NÃO PERMITIDO';
        175: vRetornoDll.estadoFuncao := 'DESCONTO NULO NÃO PERMITIDO';
        176: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM SUBTOTAL NÃO PERMITIDO';
        177: vRetornoDll.estadoFuncao := 'DATA INVÁLIDA';
        178: vRetornoDll.estadoFuncao := 'VALOR DO CHEQUE NULO NÃO PERMITIDO';
        179: vRetornoDll.estadoFuncao := 'VALOR DO CHEQUE INVÁLIDO';
        180: vRetornoDll.estadoFuncao := 'CHEQUE SEM LOCALIDADE NÃO PERMITIDO';
        181: vRetornoDll.estadoFuncao := 'CANCELAMENTO ACRÉSCIMO EM ÍTEM NÃO PERMITIDO';
        182: vRetornoDll.estadoFuncao := 'CANCELAMENTO DESCONTO EM ÍTEM NÃO PERMITIDO';
        183: vRetornoDll.estadoFuncao := 'NÚMERO MÁXIMO DE ÍTENS ATINGIDO';
        184: vRetornoDll.estadoFuncao := 'NÚMERO DE ÍTEM NULO NÃO PERMITIDO';
        185: vRetornoDll.estadoFuncao := 'MAIS QUE DUAS ALÍQUOTAS DIFERENTES NO BILHETE DE PASSAGEM NÃO PERMITIDO';
        186: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
        187: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
        188: vRetornoDll.estadoFuncao := 'CLICHE JÁ IMPRESSO';
        189: vRetornoDll.estadoFuncao := 'TEXTO OPCIONAL DO CHEQUE EXCEDEU O MÁXIMO PERMITIDO';
        190: vRetornoDll.estadoFuncao := 'IMPRESSÃO AUTOMÁTICA NO VERSO NÃO PERMITIDO NESTE EQUIPAMENTO';
        191: vRetornoDll.estadoFuncao := 'TIMEOUT NA INSERÇÃO DO CHEQUE';
        192: vRetornoDll.estadoFuncao := 'OVERFLOW NA CAPACIDADE DE TEXTO DO COMPROVANTE DE CRÉDITO OU DÉBITO';
        193: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DE ESPAÇOS ENTRE CUPONS MENOR QUE O MÍNIMO PERMITIDO';
        194: vRetornoDll.estadoFuncao := 'EQUIPAMENTO NÃO POSSUI LEITOR DE CHEQUE';
        195: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DE ALÍQUOTA COM VALOR NULO NÃO PERMITIDO';
        196: vRetornoDll.estadoFuncao := 'PARÂMETRO BAUD RATE INVÁLIDO';
        197: vRetornoDll.estadoFuncao := 'CONFIGURAÇÃO PERMITIDA SOMENTE PELA PORTA DOS FISCO';
        198: vRetornoDll.estadoFuncao := 'VALOR TOTAL DO ITEM EXCEDE 11 DÍGITOS';
        199: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DA MOEDA COM ESPAÇOS EM BRACO NÃO PERMITIDO';
        200: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS DEVEM SER PROGRAMADAS COM 2 OU 3';
        201: vRetornoDll.estadoFuncao := 'NÃO PERMITE CADASTRAR USUÁRIOS DIFERENTES NA MESMA MFD';
        202: vRetornoDll.estadoFuncao := 'IDENTIFICAÇÃO DO CONSUMIDOR NÃO PERMITIDA PARA SANGRIA OU SUPRIMENTO';
        203: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS EM QUANTIDADE MAIOR DO QUE A PERMITIDA';
        204: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS DO UNITÁRIO MAIOR DO QUE O PERMITIDA';
        205: vRetornoDll.estadoFuncao := 'POSIÇÃO RESERVADA PARA ICMS';
        206: vRetornoDll.estadoFuncao := 'POSIÇÃO RESERVADA PARA ISS';
        207: vRetornoDll.estadoFuncao := 'TODAS AS ALÍQUOTAS COM A MESMA VINCULAÇÃO NÃO PERMITIDO';
        208: vRetornoDll.estadoFuncao := 'DATA DE EMBARQUE ANTERIOR A DATA DE EMISSÃO';
        209: vRetornoDll.estadoFuncao := 'ALÍQUOTA DE ISS NÃO PERMITIDA SEM INSCRIÇÃO MUNICIPAL';
        210: vRetornoDll.estadoFuncao := 'RETORNO PACOTE CLICHE FORA DA SEQUÊNCIA';
        211: vRetornoDll.estadoFuncao := 'ESPAÇO PARA ARMAZENAMENTO DO CLICHE ESGOTADO';
        212: vRetornoDll.estadoFuncao := 'CLICHE GRÁFICO NÃO DISPONÍVEL PARA CONFIRMAÇÃO';
        213: vRetornoDll.estadoFuncao := 'CRC DO CLICHE GRÁFICO DIFERENTE DO INFORMADO';
        214: vRetornoDll.estadoFuncao := 'INTERVALO INVÁLIDO';
        215: vRetornoDll.estadoFuncao := 'USUÁRIO JÁ PROGRAMADO';
        217: vRetornoDll.estadoFuncao := 'DETECTADA ABERTURA DO EQUIPAMENTO';
        218: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO/DESCONTO NÃO PERMITIDO';
        else vRetornoDll.estadoFuncao := 'ERRO NAO INFORMADO PELA IMPRESSORA';
      end;
      vRetornoDll.estadoFuncao := vDadosIniF.StrZero(iST3,3)+ '-'+ vRetornoDll.estadoFuncao ;
    end;

    If ( iACK = 6 ) then
    BEGIN
      if not ( vTemMFD ) then
      begin
        vRetornoDll.estadoFuncao := 'COMANDO OK';
        vRetornoDll.retornoFuncao := 'OK';
        if (iST1 <> 0) or (iST2 <> 0 ) then
        begin
          vRetornoDll.retornoFuncao := 'ERRO';
          vRetornoDll.estadoFuncao := '';
          Result:= False;
        end;
      end
      else if Trim(vRetornoDll.estadoFuncao) <> ''  then
          vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao+'. ';
        // Verifica ST1

      IF iST1 >= 128 Then BEGIN iST1 := iST1 - 128; vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Fim de Papel. '; END;
      IF iST1 >= 64  Then BEGIN iST1 := iST1 - 64;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Pouco Papel. '; END;
      IF iST1 >= 32  Then BEGIN iST1 := iST1 - 32;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Erro no Relógio. '; END;
      IF iST1 >= 16  Then BEGIN iST1 := iST1 - 16;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Impressora em Erro. '; END;
      IF iST1 >= 8   Then BEGIN iST1 := iST1 - 8;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CMD não iniciado com ESC. '; END;
      IF iST1 >= 4   Then BEGIN iST1 := iST1 - 4;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Comando inexistente. '; END;
      IF iST1 >= 2   Then BEGIN iST1 := iST1 - 2;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Cupom Aberto. '; END;
      IF iST1 >= 1   Then BEGIN iST1 := iST1 - 1;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Nº de Parâmetros Inválidos. '; END;

      // Verifica ST2
      IF iST2 >= 128 Then BEGIN iST2 := iST2 - 128; vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Tipo de Parâmetro Inválido. '; END;
      IF iST2 >= 64  Then BEGIN iST2 := iST2 - 64;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Memória Fiscal Lotada. '; END;
      IF iST2 >= 32  Then BEGIN iST2 := iST2 - 32;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CMOS não Volátil. '; END;
      IF iST2 >= 16  Then BEGIN iST2 := iST2 - 16;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Alíquota Não Programada. '; END;
      IF iST2 >= 8   Then BEGIN iST2 := iST2 - 8;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Alíquotas lotadas. '; END;
      IF iST2 >= 4   Then BEGIN iST2 := iST2 - 4;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Cancelamento não Permitido. '; END;
      IF iST2 >= 2   Then BEGIN iST2 := iST2 - 2;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CGC/IE não Programados. '; END;
      IF iST2 >= 1   Then BEGIN iST2 := iST2 - 1;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Comando não Executado. '; END;
    End;
    vDadosIniF.abreFormRetornoImpressora;
  finally
    vRetornoDll.retornoFuncao := '';
  end;
end;

function TImpBematech.Retorno_impTEF: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  // iRetorno := Bematech_FI_NumeroSerie( cNumeroSerie );
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      Retorno_ImpTEF := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_ImpTEf := false;
    end;
  end;
end;

function TImpBematech.Sangria(Valor: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Bematech_FI_Sangria(pchar(valor));
  if iretorno <> 1 then
    result := false;
  Analisa_iRetorno;
  Result := Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpBematech.SubTotal: string;
var
  vlrultc: string;
  iConta: integer;
begin
  vlrultc := '';
  for iConta := 1 to 14 do begin vlrultc := vlrultc + ' '
  end;
  iRetorno := 0;

  while iRetorno = 0 do
  begin
    iRetorno := Bematech_FI_SubTotal(vlrultc);
    if iRetorno <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        Break;
    end
    else Break;
    BlockInput(true);
    Sleep(2000);
    BlockInput(true);
  end;

  //  if not retorno_impGer(1) then
  //    iRetorno := 0;
  if iretorno <> 1 then
    SubTotal := ''
  else
    SubTotal := (copy(vlrultc, 1, 12) + ',' + copy(vlrultc, 13, 2));
end;

function TImpBematech.Suprimento(Valor, FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Bematech_FI_Suprimento(pchar(Valor), pchar(Formapagamento));
  if iretorno <> 1 then
    result := false;
  Analisa_iRetorno;
  Result := Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpBematech.TerminaFechamentoCupom(linha1, linha2, linha3, linha4, linha5, linha6,
  linha7,
  linha8: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Bematech_FI_TerminaFechamentoCupom(linha1 + linha2 + linha3 + linha4 + linha5 +
    linha6
    + linha7 + linha8);
  if not Retorno_Impressora then
  //if not retorno_impGer(1) then
    iRetorno := 0;
  while iretorno <> 1 do
    //          Fprinter.FechaCupomFiscal('N') do
  begin
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      TerminaFechamentoCupom := false;
      exit;
      break;
    end
    else
      iRetorno := Bematech_FI_TerminaFechamentoCupom(linha1 + linha2 + linha3 + linha4 + linha5
        +
        linha6 + linha7 + linha8);
        Retorno_Impressora;
  end;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.tipoDoc := 'RV';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpBematech.UsaComprovanteNaoFiscalVinculado(
  Texto: string): integer;
begin
  result := Bematech_FI_UsaComprovanteNaoFiscalVinculado(texto);
end;

function TImpBematech.ValorPagoCupomAtual: string;
var
  cValorPago: string;
  I: Integer;
begin
  for I := 1 to 14 do cValorPago := cValorPago + ' ';
  iRetorno := Bematech_FI_ValorPagoUltimoCupom(cValorPago);
  cValorPago := Trim(cValorPago);
  try
    cValorPago := IntToStr(StrToInt64(cValorPago));
  except
    cValorPago := '0';
  end;
  if cValorPago = '0' then
    Result := '0'
  else
    Result := Format('%0.2f',[StrToInt64(cValorPago) / 100]);
end;

function TImpBematech.vendadeItensBema(ccodigo, cDescricao, cAliquota,
  cTipoQtde, cQtde: string; iCasasDecimais: integer; cValor, cTipoDesconto,
  cValorDesc: string): boolean;
var
  iretorno: integer;
begin
  //
  Result := true;
  //  iretorno := Bematech_FI_VendeItem(pchar(cCodigo),
  //    pchar(cDescricao),
  //    pchar(cAliquota),
  //    pchar(cTipoQtde),
  //    pchar(cQtde),
  //    iCasasDecimais,
  //    pchar(cValor),
  //    pchar(cTipoDesconto),
  //    pchar(cValorDesc));
  iretorno := Bematech_FI_VendeItemDepartamento(pchar(cCodigo),
    pchar(cDescricao),
    pchar(cAliquota),
    pchar(cValor),
    pchar(cQtde),
    '0',
    pchar(cValorDesc),
    '01',
    '  ');
  if iretorno <> 1 then
    Result := false
  else
  begin
    result := Retorno_Impressora;
//    if not retorno_impGer(1) then
//      result := false
//    else
//      result := true;
  end;
end;

function TImpBematech.VendeItem(Codigo, Descricao, Aliquota,
  TipoQuantidade, Quantidade: string; CasasDecimais: Integer;
  ValorUnitario: real; TipoDesconto: string; Desconto1, Desconto2: real; nquant: real): boolean;
var
  vflgn, iretorno: integer;
  vvp: string;
  vrAcumGT: Currency;
begin
  Result := true;
  vFqtdDig := 3;
  if vFqtdDig = 3 then
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 3);
    delete(Fvcpreco, 6, 1);
  end
  else
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 2);
    delete(Fvcpreco, 7, 1);
  end;
  vFvcpreco := convNumero2(valorunitario);
  valorunitario := convNumero(ValorUnitario);
  if vtipoArredond <> 'A' then
  begin
    if pos(',', vFvcpreco) > 0 then
    begin
      if vFqtdDig = 3 then
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 3)
      else
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 2);
    end;
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 3);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end
  else
  begin
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 2);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    while pos('.', FvcTotal) > 0 do
      delete(FvcTotal, pos('.', FvcTotal), 1);
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end;
  if vFqtdDig = 3 then
    delete(Fvcpreco, 6, 1)
  else
    delete(Fvcpreco, 7, 1);
  if pos(',', vFvcTotal) > 0 then
    vFvcTotal := copy(vFvcTotal, 1, pos(',', vFvcTotal) - 1) + ',' + copy(vFvcTotal, pos(',',
      vFvcTotal) + 1, 2);
  //         nTotal:=nTotal+strtofloat(vFvcTotal);
  if (Desconto1 > 0) or (Desconto2 > 0) then

    vFValorLiq := floattostr((strtofloat(vFvcTotal) - strtofloat(vFcdescit)))
      //          floattostr((strtofloat(vFvcTotal)-(Strtofloat(vFvcTotal)*(vdescitem/100))))
  else
    vFValorLiq := vFvcTotal;
  vFvcTotal := vDadosIniF.StrZeroDec(strtofloat(vFvcTotal), 13, 2);
  delete(FvcTotal, 11, 1);
  //         eu:=currtostr((nPreco*nQuant));
  //         delete(vFvcTotal,8,1);
  //      showmessage(cbarra+cdesc20+vsittributaria+
  //       'F'+Cquant+inttostr(vqtdig)+vFvcpreco+'%'+'0000');
  if (Desconto1 > 0) or (Desconto2 > 0) then
  begin
    //vFcdescit := vDadosIniF.StrZeroDec(desconto1 + ((desconto2 * 100) / Valorunitario), 5, 2);
    vFcdescit := vDadosIniF.StrZeroDec(desconto2 + ((desconto1 * Valorunitario) / 100), 9, 2);
    delete(Fcdescit, 7, 1);
  end
  else
  begin
    Fcdescit := '00000000';
  end;
  {    cCodigo := cbarra;
     cDescricao := cdesc20;
     cAliquota := vSitTributaria;
     cTipoQtde := 'F';
     cQtde := cQuant;
     iCasasDecimais := vqtdig;
     cValor := vFvcpreco;
     cTipoDesconto := '%';
     cValorDesc := cdescit;}

  vflgn := 0;
  while not vendadeItensBema(Codigo, Descricao, Aliquota, 'F', quantidade, vFqtdDig,
    vFvcpreco, '$', vFcdescit) do
  begin
    if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      vflgn := 1;
      break;
    end;
  end;
  if vflgn = 1 then
  begin
    VendeItem := false;
    exit;
  end;
  vdadosIniF.acumulaGrandeTotal(vrAcumGT);
  if (Desconto1 < 0) or (Desconto2 < 0) then
    // o Valor negativo do desconto significa que é acrescimo
    if vDadosIniF.existeComando('2', false) then
    begin
      vFcdescit := trim(Format('%12.2f', [((-1) * desconto2) + ((((-1) * desconto1) *
          Valorunitario)
          / 100)]));
      vFValorLiq := FloatToStr(StrToFloat(vFValorLiq) + StrToFloat(vFcdescit));
      vrAcumGT := strtoCurr(trim(vFcdescit));
      //vFcdescit := vDadosIniF.StrZeroDec(((-1) * desconto2) + ((((-1) * desconto1) * Valorunitario) / 100), 15, 2);
      //delete(Fcdescit, 12, 1);
      iretorno := Bematech_FI_AcrescimoDescontoItemMFD(vDadosIniF.getNItem,
        'A', '$', vFcdescit);
      Analisa_iRetorno;
      if Retorno_Impressora then
        vdadosIniF.acumulaGrandeTotal(vrAcumGT);
    end;
end;

function TImpBematech.VendeItemSimples(pCodigo, pDescricao, pAliquota: string;
  pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean;
var
  cQtde,cValor,cDesconto,cAcrescimo:string;
  vrTemp,vrDesc,vrAcres,vrTot:Real;
  vQtde:string;
begin
//  vQtde := cMascQuant(pQuantidade);
//  Result := VendeItem(pCodigo,pDescricao,pAliquota,'F',vQtde,FqtdDig,pValorUnitario,'$',
//    pDescontoPercentual,pDescontoValor,pQuantidade);
 Result := False;
  vrTemp := getQuantidadeComCasasDecimais(pQuantidade);
  cQtde := Format('%12.'+IntToStr(FqtdDigQtde)+'f',[vrTemp]);

  vrTemp := getValorUnitarioComCasasDecimais(pValorUnitario);
  cValor := Format('%15.3f',[vrTemp]);

  cQtde := StringReplace(Trim(cQtde),',','',[rfReplaceAll]);
  cValor := StringReplace(Trim(cValor),',','',[rfReplaceAll]);

  vrTemp := getValorTotalComCasasDecimais( pValorUnitario * pQuantidade);
  vFValorLiq := Format('%0.2f',[vrTemp]);
  vrTot := vrTemp;

  cDesconto := '000';
  cAcrescimo := '000';
  if (pDescontoPercentual > 0) or (pDescontoValor > 0) then
  begin
    vrDesc := vDadosIniF.StrToFloatFormat( ((vrTot * pDescontoPercentual) / 100) + pDescontoValor,2);
    cDesconto := Format('%0.2f',[vrDesc]);
    cDesconto := StringReplace(Trim(cDesconto),',','',[rfReplaceAll]);
    vFValorLiq := Format('%0.2f',[StrToFloat(vFValorLiq) - vrDesc]);
  end
  else if (pDescontoPercentual < 0)  or (pDescontoValor < 0) then
  begin
    if vDadosIniF.existeComando('2', false) then
    begin
      vrAcres := vDadosIniF.StrToFloatFormat( ((vrTot * ((-1)*pDescontoPercentual)) / 100) + ((-1)*pDescontoValor),2);
      cAcrescimo := Format('%0.2f',[vrAcres]);
      cAcrescimo := StringReplace(Trim(cAcrescimo),',','',[rfReplaceAll]);
      vFValorLiq := Format('%0.2f',[vrAcres + StrToFloat(vFValorLiq)]);
      vrTot := vrTot + vrAcres;
    end;
  end;

  while True do
  begin
    iretorno := Bematech_FI_VendeItemDepartamento(pchar(pCodigo),
      pchar(pDescricao),
      pchar(pAliquota),
      pchar(cValor),
      pchar(cQtde),
      pchar(cAcrescimo),
      pchar(cDesconto),
      '01',
      '  ');
    result := Retorno_Impressora;
    vDadosIniF.acumulaGrandeTotal(vrTot);
    if Result then
    begin
//      vDadosIniF.acumulaGrandeTotal(vrTot);
      Break;
    end
    else
    begin
      Application.ProcessMessages;
      if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
        Break;
    end;
  end;  
end;

function TImpBematech.VerificaImpressoraLigada: boolean;
begin
  NumeroCupom;
  Result := (iRetorno = 1);
end;

function TImpBematech.verificaPapel: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := Bematech_FI_NumeroSerie(cNumeroSerie);
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      verificaPapel := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      verificaPapel := false;
    end;
  end
  else
    verificaPapel := true;
end;

function TImpBematech.Verifica_Impressora: boolean;
Var
  iACK, iST1, iST2, iST3: Integer;
begin
  try
    iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
    vRetornoDll.retornoFuncao := '' ;
    vRetornoDll.estadoImpressora := '';
    vRetornoDll.estadoFuncao := '';

    if ( vTemMFD ) then
       iRetorno := Bematech_FI_VerificaEstadoImpressoraMFD( iACK, iST1, iST2, iST3 )
    else
       iRetorno := Bematech_FI_VerificaEstadoImpressora( iACK, iST1, iST2 );
    if iRetorno <> 1 then
    begin
      Result := False;
      exit;
    end;

    Result := True;

    If iACK = 21 Then
    BEGIN
      Application.MessageBox( 'A Impressora retornou NAK. O programa será abortado!', 'Erro', MB_IconError + MB_OK );
      Application.Terminate;
      Exit;
    End
    else if iACK = 0 then
      result := False
    else if ( vTemMFD ) and (vRetExtHab) and (iACK = 6) then
    begin
      vRetornoDll.retornoFuncao := 'ERRO';
      Result:= False;
      case iST3 of
        000:
          begin
            if (iST1 = 0) and (iST2 = 0 ) then
            begin
              Result:= True;
              vRetornoDll.estadoFuncao := 'COMANDO OK';
              vRetornoDll.retornoFuncao := 'OK';
            end;
          end;
        001: vRetornoDll.estadoFuncao := 'COMANDO INVÁLIDO';
        002: vRetornoDll.estadoFuncao := 'ERRO DESCONHECIDO';
        003: vRetornoDll.estadoFuncao := 'NÚMERO DE PARÂMETRO INVÁLIDO';
        004: vRetornoDll.estadoFuncao := 'TIPO DE PARÂMETRO INVÁLIDO';
        005: vRetornoDll.estadoFuncao := 'TODAS ALÍQUOTAS JÁ PROGRAMADAS';
        006: vRetornoDll.estadoFuncao := 'TOTALIZADOR NÃO FISCAL JÁ PROGRAMADO';
        007: vRetornoDll.estadoFuncao := 'CUPOM FISCAL ABERTO';
        008: vRetornoDll.estadoFuncao := 'CUPOM FISCAL FECHADO';
        009: vRetornoDll.estadoFuncao := 'ECF OCUPADO';
        010: vRetornoDll.estadoFuncao := 'IMPRESSORA EM ERRO';
        011: vRetornoDll.estadoFuncao := 'IMPRESSORA SEM PAPEL';
        012: vRetornoDll.estadoFuncao := 'IMPRESSORA COM CABEÇA LEVANTADA';
        013: vRetornoDll.estadoFuncao := 'IMPRESSORA OFF LINE';
        014: vRetornoDll.estadoFuncao := 'ALÍQUOTA NÃO PROGRAMADA';
        015: vRetornoDll.estadoFuncao := 'TERMINADOR DE STRING FALTANDO';
        016: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO MAIOR QUE O TOTAL DO CUPOM FISCAL';
        017: vRetornoDll.estadoFuncao := 'CUPOM FISCAL SEM ITEM VENDIDO';
        018: vRetornoDll.estadoFuncao := 'COMANDO NÃO EFETIVADO';
        019: vRetornoDll.estadoFuncao := 'SEM ESPAÇO PARA NOVAS FORMAS DE PAGAMENTO';
        020: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO NÃO PROGRAMADA';
        021: vRetornoDll.estadoFuncao := 'ÍNDICE MAIOR QUE NÚMERO DE FORMA DE PAGAMENTO';
        022: vRetornoDll.estadoFuncao := 'FORMAS DE PAGAMENTO ENCERRADAS';
        023: vRetornoDll.estadoFuncao := 'CUPOM NÃO TOTALIZADO';
        024: vRetornoDll.estadoFuncao := 'COMANDO MAIOR QUE 7Fh (127d)';
        025: vRetornoDll.estadoFuncao := 'CUPOM FISCAL ABERTO E SEM ÍTEM';
        026: vRetornoDll.estadoFuncao := 'CANCELAMENTO NÃO IMEDIATAMENTE APÓS';
        027: vRetornoDll.estadoFuncao := 'CANCELAMENTO JÁ EFETUADO';
        028: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO OU JÁ EMITIDO';
        029: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO NÃO PERMITE TEF';
        030: vRetornoDll.estadoFuncao := 'SEM COMPROVANTE NÃO FISCAL ABERTO';
        031: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO JÁ ABERTO';
        032: vRetornoDll.estadoFuncao := 'REIMPRESSÃO NÃO PERMITIDA';
        033: vRetornoDll.estadoFuncao := 'COMPROVANTE NÃO FISCAL JÁ ABERTO';
        034: vRetornoDll.estadoFuncao := 'TOTALIZADOR NÃO FISCAL NÃO PROGRAMADO';
        035: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL SEM ÍTEM VENDIDO';
        036: vRetornoDll.estadoFuncao := 'ACRÉSCIMO E DESCONTO MAIOR QUE TOTAL CNF';
        037: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO NÃO INDICADO';
        038: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO DIFERENTE DO TOTAL DO RECEBIMENTO';
        039: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO MAIS DE UMA SANGRIA OU SUPRIMENTO';
        040: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL JÁ PROGRAMADO';
        041: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL NÃO PROGRAMADO';
        042: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL NÃO PERMITIDO';
        043: vRetornoDll.estadoFuncao := 'MFD NÃO INICIALIZADA';
        044: vRetornoDll.estadoFuncao := 'MFD AUSENTE';
        045: vRetornoDll.estadoFuncao := 'MFD SEM NÚMERO DE SÉRIE';
        046: vRetornoDll.estadoFuncao := 'MFD JÁ INICIALIZADA';
        047: vRetornoDll.estadoFuncao := 'MFD LOTADA';
        048: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL ABERTO';
        049: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL DESCONECTADA';
        050: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM NÚMERO DE SÉRIE DA MFD';
        051: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL LOTADA';
        052: vRetornoDll.estadoFuncao := 'DATA INICIAL INVÁLIDA';
        053: vRetornoDll.estadoFuncao := 'DATA FINAL INVÁLIDA';
        054: vRetornoDll.estadoFuncao := 'CONTADOR DE REDUÇÃO Z INICIAL INVÁLIDO';
        055: vRetornoDll.estadoFuncao := 'CONTADOR DE REDUÇÃO Z FINAL INVÁLIDO';
        056: vRetornoDll.estadoFuncao := 'ERRO DE ALOCAÇÃO';
        057: vRetornoDll.estadoFuncao := 'DADOS DO RTC INCORRETOS';
        058: vRetornoDll.estadoFuncao := 'DATA ANTERIOR AO ÚLTIMO DOCUMENTO EMITIDO';
        059: vRetornoDll.estadoFuncao := 'FORA DE INTERVENÇÃO TÉCNICA';
        060: vRetornoDll.estadoFuncao := 'EM INTERVENÇÃO TÉCNICA';
        061: vRetornoDll.estadoFuncao := 'ERRO NA MEMÓRIA DE TRABALHO';
        062: vRetornoDll.estadoFuncao := 'JÁ HOUVE MOVIMENTO NO DIA';
        063: vRetornoDll.estadoFuncao := 'BLOQUEIO POR RZ';
        064: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO ABERTA';
        065: vRetornoDll.estadoFuncao := 'AGUARDANDO PRIMEIRO PROPRIETÁRIO';
        066: vRetornoDll.estadoFuncao := 'AGUARDANDO RZ';
        067: vRetornoDll.estadoFuncao := 'ECF OU LOJA IGUAL A ZERO';
        068: vRetornoDll.estadoFuncao := 'CUPOM ADICIONAL NÃO PERMITIDO';
        069: vRetornoDll.estadoFuncao := 'DESCONTO MAIOR QUE TOTAL VENDIDO EM ICMS';
        070: vRetornoDll.estadoFuncao := 'RECEBIMENTO NÃO FISCAL NULO NÃO PERMITIDO';
        071: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO MAIOR QUE TOTAL NÃO FISCAL';
        072: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL LOTADA PARA NOVO CARTUCHO';
        073: vRetornoDll.estadoFuncao := 'ERRO DE GRAVAÇÃO NA MF';
        074: vRetornoDll.estadoFuncao := 'ERRO DE GRAVAÇÃO NA MFD';
        075: vRetornoDll.estadoFuncao := 'DADOS DO RTC ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
        076: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR LEITURAS DA MFD';
        077: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR VERSAO DO SB';
        078: vRetornoDll.estadoFuncao := 'DESCRIÇÃO IGUAL A DEFAULT NÃO PERMITIDO';
        079: vRetornoDll.estadoFuncao := 'EXTRAPOLADO NÚMERO DE REPETIÇÕES PERMITIDAS';
        080: vRetornoDll.estadoFuncao := 'SEGUNDA VIA DO COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO';
        081: vRetornoDll.estadoFuncao := 'PARCELAMENTO FORA DA SEQUÊNCIA';
        082: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
        083: vRetornoDll.estadoFuncao := 'TEXTO COM SEQUÊNCIA DE ESC INVÁLIDA';
        084: vRetornoDll.estadoFuncao := 'TEXTO COM SEQUÊNCIA DE ESC INCOMPLETA';
        085: vRetornoDll.estadoFuncao := 'VENDA COM VALOR NULO';
        086: vRetornoDll.estadoFuncao := 'ESTORNO DE VALOR NULO';
        087: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO DIFERENTE DO TOTAL DA SANGRIA';
        088: vRetornoDll.estadoFuncao := 'REDUÇÃO NÃO PERMITIDA EM INTERVENÇÃO TÉCNICA';
        089: vRetornoDll.estadoFuncao := 'AGUARDANDO RZ PARA ENTRADA EM INTERVENÇÃO TÉCNICA';
        090: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO COM VALOR NULO NÃO PERMITIDO';
        091: vRetornoDll.estadoFuncao := 'ACRÉSCIMO E DESCONTO MAIOR QUE VALOR DO ÍTEM';
        092: vRetornoDll.estadoFuncao := 'AUTENTICAÇÃO NÃO PERMITIDA';
        093: vRetornoDll.estadoFuncao := 'TIMEOUT NA VALIDAÇÃO';
        094: vRetornoDll.estadoFuncao := 'COMANDO NÃO EXECUTADO EM IMPRESSORA BILHETE DE PASSAGEM';
        095: vRetornoDll.estadoFuncao := 'COMANDO NÃO EXECUTADO EM IMPRESSORA DE CUPOM FISCAL';
        096: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL FECHADO';
        097: vRetornoDll.estadoFuncao := 'PARÂMETRO NÃO ASCII EM CAMPO ASCII';
        098: vRetornoDll.estadoFuncao := 'PARÂMETRO NÃO ASCII NUMÉRICO EM CAMPO ASCII NUMÉRICO';
        099: vRetornoDll.estadoFuncao := 'TIPO DE TRANSPORTE INVÁLIDO';
        100: vRetornoDll.estadoFuncao := 'DATA E HORA INVÁLIDA';
        101: vRetornoDll.estadoFuncao := 'SEM RELATÓRIO GERENCIAL OU COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
        102: vRetornoDll.estadoFuncao := 'NÚMERO DO TOTALIZADOR NÃO FISCAL INVÁLIDO';
        103: vRetornoDll.estadoFuncao := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
        104: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO EM SANGRIA OU SUPRIMENTO NÃO PERMITIDO';
        105: vRetornoDll.estadoFuncao := 'NÚMERO DO RELATÓRIO GERENCIAL INVÁLIDO';
        106: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO ORIGEM NÃO PROGRAMADA';
        107: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO DESTINO NÃO PROGRAMADA';
        108: vRetornoDll.estadoFuncao := 'ESTORNO MAIOR QUE FORMA PAGAMENTO';
        109: vRetornoDll.estadoFuncao := 'CARACTER NUMÉRICO NA CODIFICAÇÃO GT NÃO PERMITIDO';
        110: vRetornoDll.estadoFuncao := 'ERRO NA INICIALIZAÇÃO DA MF';
        111: vRetornoDll.estadoFuncao := 'NOME DO TOTALIZADOR EM BRANCO NÃO PERMITIDO';
        112: vRetornoDll.estadoFuncao := 'DATA E HORA ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
        113: vRetornoDll.estadoFuncao := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
        114: vRetornoDll.estadoFuncao := 'ÍTEM ANTERIOR AOS TREZENTOS ÚLTIMOS';
        115: vRetornoDll.estadoFuncao := 'ÍTEM NÃO EXISTE OU JÁ CANCELADO';
        116: vRetornoDll.estadoFuncao := 'CÓDIGO COM ESPAÇOS NÃO PERMITIDO';
        117: vRetornoDll.estadoFuncao := 'DESCRICAO SEM CARACTER ALFABÉTICO NÃO PERMITIDO';
        118: vRetornoDll.estadoFuncao := 'ACRÉSCIMO MAIOR QUE VALOR DO ÍTEM';
        119: vRetornoDll.estadoFuncao := 'DESCONTO MAIOR QUE VALOR DO ÍTEM';
        120: vRetornoDll.estadoFuncao := 'DESCONTO EM ISS NÃO PERMITIDO';
        121: vRetornoDll.estadoFuncao := 'ACRÉSCIMO EM ÍTEM JÁ EFETUADO';
        122: vRetornoDll.estadoFuncao := 'DESCONTO EM ÍTEM JÁ EFETUADO';
        123: vRetornoDll.estadoFuncao := 'ERRO NA MEMÓRIA FISCAL CHAMAR CREDENCIADO';
        124: vRetornoDll.estadoFuncao := 'AGUARDANDO GRAVAÇÃO NA MEMÓRIA FISCAL';
        125: vRetornoDll.estadoFuncao := 'CARACTER REPETIDO NA CODIFICAÇÃO DO GT';
        126: vRetornoDll.estadoFuncao := 'VERSÃO JÁ GRAVADA NA MEMÓRIA FISCAL';
        127: vRetornoDll.estadoFuncao := 'ESTOURO DE CAPACIDADE NO CHEQUE';
        128: vRetornoDll.estadoFuncao := 'TIMEOUT NA LEITURA DO CHEQUE';
        129: vRetornoDll.estadoFuncao := 'MÊS INVÁLIDO';
        130: vRetornoDll.estadoFuncao := 'COORDENADA INVÁLIDA';
        131: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO';
        132: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO VALOR';
        133: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO EXTENSO';
        134: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO FAVORECIDO';
        135: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NA LOCALIDADE';
        136: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO OPCIONAL';
        137: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO DIA';
        138: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO MÊS';
        139: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO ANO';
        140: vRetornoDll.estadoFuncao := 'USANDO MFD DE OUTRO ECF';
        141: vRetornoDll.estadoFuncao := 'PRIMEIRO DADO DIFERENTE DE ESC OU 1C';
        142: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO ALTERAR SEM INTERVENÇÃO TÉCNICA';
        143: vRetornoDll.estadoFuncao := 'DADOS DA ÚLTIMA RZ CORROMPIDOS';
        144: vRetornoDll.estadoFuncao := 'COMANDO NÃO PERMITIDO NO MODO INICIALIZAÇÃO';
        145: vRetornoDll.estadoFuncao := 'AGUARDANDO ACERTO DE RELÓGIO';
        146: vRetornoDll.estadoFuncao := 'MFD JÁ INICIALIZADA PARA OUTRA MF';
        147: vRetornoDll.estadoFuncao := 'AGUARDANDO ACERTO DO RELÓGIO OU DESBLOQUEIO PELO TECLADO';
        148: vRetornoDll.estadoFuncao := 'VALOR FORMA DE PAGAMENTO MAIOR QUE MÁXIMO PERMITIDO';
        149: vRetornoDll.estadoFuncao := 'RAZÃO SOCIAL EM BRANCO';
        150: vRetornoDll.estadoFuncao := 'NOME DE FANTASIA EM BRANCO';
        151: vRetornoDll.estadoFuncao := 'ENDEREÇO EM BRANCO';
        152: vRetornoDll.estadoFuncao := 'ESTORNO DE CDC NÃO PERMITIDO';
        153: vRetornoDll.estadoFuncao := 'DADOS DO PROPRIETÁRIO IGUAIS AO ATUAL';
        154: vRetornoDll.estadoFuncao := 'ESTORNO DE FORMA DE PAGAMENTO NÃO PERMITIDO';
        155: vRetornoDll.estadoFuncao := 'DESCRIÇÃO FORMA DE PAGAMENTO IGUAL JÁ PROGRAMADA';
        156: vRetornoDll.estadoFuncao := 'ACERTO DE HORÁRIO DE VERÃO SÓ IMEDIATAMENTE APÓS RZ';
        157: vRetornoDll.estadoFuncao := 'IT NÃO PERMITIDA MF RESERVADA PARA RZ';
        158: vRetornoDll.estadoFuncao := 'SENHA CNPJ INVÁLIDA';
        159: vRetornoDll.estadoFuncao := 'TIMEOUT NA INICIALIZAÇÃO DA NOVA MF';
        160: vRetornoDll.estadoFuncao := 'NÃO ENCONTRADO DADOS NA MFD';
        161: vRetornoDll.estadoFuncao := 'SANGRIA OU SUPRIMENTO DEVEM SER ÚNICOS NO CNF';
        162: vRetornoDll.estadoFuncao := 'ÍNDICE DA FORMA DE PAGAMENTO NULO NÃO PERMITIDO';
        163: vRetornoDll.estadoFuncao := 'UF DESTINO INVÁLIDA';
        164: vRetornoDll.estadoFuncao := 'TIPO DE TRANSPORTE INCOMPATÍVEL COM UF DESTINO';
        165: vRetornoDll.estadoFuncao := 'DESCRIÇÃO DO PRIMEIRO ÍTEM DO BILHETE DE PASSAGEM DIFERENTE DE "TARIFA"';
        166: vRetornoDll.estadoFuncao := 'AGUARDANDO IMPRESSÃO DE CHEQUE OU AUTENTICAÇÃO';
        167: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO PROGRAMAÇAO CNPJ IE COM ESPAÇOS EM BRANCO';
        168: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO PROGRAMAÇÃO UF COM ESPAÇOS EM BRANCO';
        169: vRetornoDll.estadoFuncao := 'NÚMERO DE IMPRESSÕES DA FITA DETALHE NESTA INTERVENÇÃO TÉCNICA ESGOTADO';
        170: vRetornoDll.estadoFuncao := 'CF JÁ SUBTOTALIZADO';
        171: vRetornoDll.estadoFuncao := 'CUPOM NÃO SUBTOTALIZADO';
        172: vRetornoDll.estadoFuncao := 'ACRÉSCIMO EM SUBTOTAL JÁ EFETUADO';
        173: vRetornoDll.estadoFuncao := 'DESCONTO EM SUBTOTAL JÁ EFETUADO';
        174: vRetornoDll.estadoFuncao := 'ACRÉSCIMO NULO NÃO PERMITIDO';
        175: vRetornoDll.estadoFuncao := 'DESCONTO NULO NÃO PERMITIDO';
        176: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM SUBTOTAL NÃO PERMITIDO';
        177: vRetornoDll.estadoFuncao := 'DATA INVÁLIDA';
        178: vRetornoDll.estadoFuncao := 'VALOR DO CHEQUE NULO NÃO PERMITIDO';
        179: vRetornoDll.estadoFuncao := 'VALOR DO CHEQUE INVÁLIDO';
        180: vRetornoDll.estadoFuncao := 'CHEQUE SEM LOCALIDADE NÃO PERMITIDO';
        181: vRetornoDll.estadoFuncao := 'CANCELAMENTO ACRÉSCIMO EM ÍTEM NÃO PERMITIDO';
        182: vRetornoDll.estadoFuncao := 'CANCELAMENTO DESCONTO EM ÍTEM NÃO PERMITIDO';
        183: vRetornoDll.estadoFuncao := 'NÚMERO MÁXIMO DE ÍTENS ATINGIDO';
        184: vRetornoDll.estadoFuncao := 'NÚMERO DE ÍTEM NULO NÃO PERMITIDO';
        185: vRetornoDll.estadoFuncao := 'MAIS QUE DUAS ALÍQUOTAS DIFERENTES NO BILHETE DE PASSAGEM NÃO PERMITIDO';
        186: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
        187: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
        188: vRetornoDll.estadoFuncao := 'CLICHE JÁ IMPRESSO';
        189: vRetornoDll.estadoFuncao := 'TEXTO OPCIONAL DO CHEQUE EXCEDEU O MÁXIMO PERMITIDO';
        190: vRetornoDll.estadoFuncao := 'IMPRESSÃO AUTOMÁTICA NO VERSO NÃO PERMITIDO NESTE EQUIPAMENTO';
        191: vRetornoDll.estadoFuncao := 'TIMEOUT NA INSERÇÃO DO CHEQUE';
        192: vRetornoDll.estadoFuncao := 'OVERFLOW NA CAPACIDADE DE TEXTO DO COMPROVANTE DE CRÉDITO OU DÉBITO';
        193: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DE ESPAÇOS ENTRE CUPONS MENOR QUE O MÍNIMO PERMITIDO';
        194: vRetornoDll.estadoFuncao := 'EQUIPAMENTO NÃO POSSUI LEITOR DE CHEQUE';
        195: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DE ALÍQUOTA COM VALOR NULO NÃO PERMITIDO';
        196: vRetornoDll.estadoFuncao := 'PARÂMETRO BAUD RATE INVÁLIDO';
        197: vRetornoDll.estadoFuncao := 'CONFIGURAÇÃO PERMITIDA SOMENTE PELA PORTA DOS FISCO';
        198: vRetornoDll.estadoFuncao := 'VALOR TOTAL DO ITEM EXCEDE 11 DÍGITOS';
        199: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DA MOEDA COM ESPAÇOS EM BRACO NÃO PERMITIDO';
        200: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS DEVEM SER PROGRAMADAS COM 2 OU 3';
        201: vRetornoDll.estadoFuncao := 'NÃO PERMITE CADASTRAR USUÁRIOS DIFERENTES NA MESMA MFD';
        202: vRetornoDll.estadoFuncao := 'IDENTIFICAÇÃO DO CONSUMIDOR NÃO PERMITIDA PARA SANGRIA OU SUPRIMENTO';
        203: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS EM QUANTIDADE MAIOR DO QUE A PERMITIDA';
        204: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS DO UNITÁRIO MAIOR DO QUE O PERMITIDA';
        205: vRetornoDll.estadoFuncao := 'POSIÇÃO RESERVADA PARA ICMS';
        206: vRetornoDll.estadoFuncao := 'POSIÇÃO RESERVADA PARA ISS';
        207: vRetornoDll.estadoFuncao := 'TODAS AS ALÍQUOTAS COM A MESMA VINCULAÇÃO NÃO PERMITIDO';
        208: vRetornoDll.estadoFuncao := 'DATA DE EMBARQUE ANTERIOR A DATA DE EMISSÃO';
        209: vRetornoDll.estadoFuncao := 'ALÍQUOTA DE ISS NÃO PERMITIDA SEM INSCRIÇÃO MUNICIPAL';
        210: vRetornoDll.estadoFuncao := 'RETORNO PACOTE CLICHE FORA DA SEQUÊNCIA';
        211: vRetornoDll.estadoFuncao := 'ESPAÇO PARA ARMAZENAMENTO DO CLICHE ESGOTADO';
        212: vRetornoDll.estadoFuncao := 'CLICHE GRÁFICO NÃO DISPONÍVEL PARA CONFIRMAÇÃO';
        213: vRetornoDll.estadoFuncao := 'CRC DO CLICHE GRÁFICO DIFERENTE DO INFORMADO';
        214: vRetornoDll.estadoFuncao := 'INTERVALO INVÁLIDO';
        215: vRetornoDll.estadoFuncao := 'USUÁRIO JÁ PROGRAMADO';
        217: vRetornoDll.estadoFuncao := 'DETECTADA ABERTURA DO EQUIPAMENTO';
        218: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO/DESCONTO NÃO PERMITIDO';
        else vRetornoDll.estadoFuncao := 'ERRO NAO INFORMADO PELA IMPRESSORA';
      end;
      vRetornoDll.estadoFuncao := vDadosIniF.StrZero(iST3,3)+ '-'+ vRetornoDll.estadoFuncao ;
    end;

    If ( iACK = 6 ) then
    BEGIN
      if not ( vTemMFD ) then
      begin
        vRetornoDll.estadoFuncao := 'COMANDO OK';
        vRetornoDll.retornoFuncao := 'OK';
        if (iST1 <> 0) or (iST2 <> 0 ) then
        begin
          vRetornoDll.retornoFuncao := 'ERRO';
          vRetornoDll.estadoFuncao := '';
          Result:= False;
        end;
      end
      else if Trim(vRetornoDll.estadoFuncao) <> ''  then  
          vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao+'. ';
        // Verifica ST1

      IF iST1 >= 128 Then BEGIN iST1 := iST1 - 128; vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Fim de Papel. '; END;
      IF iST1 >= 64  Then BEGIN iST1 := iST1 - 64;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Pouco Papel. '; END;
      IF iST1 >= 32  Then BEGIN iST1 := iST1 - 32;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Erro no Relógio. '; END;
      IF iST1 >= 16  Then BEGIN iST1 := iST1 - 16;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Impressora em Erro. '; END;
      IF iST1 >= 8   Then BEGIN iST1 := iST1 - 8;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CMD não iniciado com ESC. '; END;
      IF iST1 >= 4   Then BEGIN iST1 := iST1 - 4;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Comando inexistente. '; END;
      IF iST1 >= 2   Then BEGIN iST1 := iST1 - 2;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Cupom Aberto. '; END;
      IF iST1 >= 1   Then BEGIN iST1 := iST1 - 1;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Nº de Parâmetros Inválidos. '; END;

      // Verifica ST2
      IF iST2 >= 128 Then BEGIN iST2 := iST2 - 128; vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Tipo de Parâmetro Inválido. '; END;
      IF iST2 >= 64  Then BEGIN iST2 := iST2 - 64;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Memória Fiscal Lotada. '; END;
      IF iST2 >= 32  Then BEGIN iST2 := iST2 - 32;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CMOS não Volátil. '; END;
      IF iST2 >= 16  Then BEGIN iST2 := iST2 - 16;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Alíquota Não Programada. '; END;
      IF iST2 >= 8   Then BEGIN iST2 := iST2 - 8;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Alíquotas lotadas. '; END;
      IF iST2 >= 4   Then BEGIN iST2 := iST2 - 4;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Cancelamento não Permitido. '; END;
      IF iST2 >= 2   Then BEGIN iST2 := iST2 - 2;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CGC/IE não Programados. '; END;
      IF iST2 >= 1   Then BEGIN iST2 := iST2 - 1;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Comando não Executado. '; END;
    End;
    if vDadosIniF.vInibeMensPesqPros <> 'S' then
      vDadosIniF.abreFormRetornoImpressora;
    vDadosIniF.vInibeMensPesqPros := 'N';
    if not Result then
    begin
      Application.ProcessMessages;
      Result  := Application.MessageBox('Deseja continuar assim mesmo?',
        'Confirmação',MB_ICONQUESTION+MB_YESNO) = IDYES;
    end;
  finally
    vRetornoDll.retornoFuncao := '';
  end;
end;

{ TImpdaruma }

function TImpdaruma.AberturaDoDia(ValorCompra,
  FormaPagamento: string): boolean;
begin
  Result := true;
  iRetorno := daruma_FI_AberturaDoDia(pchar('0,00'), pchar(''));
  if (vTipoImpressora = 'DARUMAMFD') then
    iRetorno := Daruma_FI_LeituraX();
end;

function TImpdaruma.AbrecomprovanteNaoFiscal(FormaPagamento, Valor,
  NumeroCupom: string): boolean;
begin

end;

function TImpdaruma.AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento,
  Valor_Pago, Numero_do_Cupom: string): Integer;
begin
  Daruma_FI_AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento, Valor_Pago, Numero_do_Cupom);
end;

function TImpdaruma.AbreCupom(CGC_CPF: string): boolean;
begin
  Result := true;
  if FvTipoImpressora = 'DARUMA' then
  begin
    iRetorno := Daruma_FI_AbreCupom(Pchar(''));
    Analisa_iRetorno();
    if not retorno_impGer(1) then
      iretorno := 0;
    if (iretorno <> 1) then
      AbreCupom := false;
  end;
  if FvTipoImpressora = 'DARUMAMFD' then
  begin
    iRetorno := Daruma_FI_AbreCupom(Pchar(''));
    //      Bematech_FI_AbreCupom( Pchar( '' ) );
    Analisa_iRetorno();
    if not retorno_impGer(1) then
      iretorno := 0;
    if iretorno <> 1 then
      AbreCupom := false;
  end;
  if Result then
    DataHoraImpressora('', '');
end;

function TImpdaruma.AbreCupomMFD(CGC, Nome, Endereco: string): boolean;
begin

end;

function TImpdaruma.AbrePortaS(vportaCom: string): boolean;
begin
  Result := true;
  iretorno := Daruma_FI_AbrePortaSerial;
  Analisa_iRetorno;
  if iretorno <> 1 then
    AbrePortaS := false;
end;

function TImpdaruma.AbreRecebimentoNaoFiscalMFD(CGC, Nome,
  Endereco: string): boolean;
begin

end;

function TImpdaruma.abrerelatorioGer: boolean;
begin

end;

procedure TImpdaruma.acionaCortePapel(corteCompleto, gerencial: boolean);
begin
  inherited;
  if not vTemMFD then
    exit;
  iRetorno := Daruma_FIMFD_AcionarGuilhotina;
end;

function TImpdaruma.AcionaGaveta: boolean;
begin
  Result := true;
  iRetorno := Daruma_FI_AcionaGaveta();
end;

function TImpdaruma.alteraRegistro(Str_Nome_da_Chave,
  Str_Valor_da_Chave: string): boolean;
begin
  iRetorno := Daruma_Registry_AlteraRegistry(Str_Nome_da_Chave, Str_Valor_da_Chave);
  Result := iRetorno = 1;
  if not Result then
    Analisa_iRetorno;
end;

procedure TImpdaruma.Analisa_iRetorno;
begin
  if iRetorno = 0 then
    Application.MessageBox('Erro de Comunicação !', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -1 then
    Application.MessageBox('Erro de Execução na Função. Verifique!', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -2 then
    Application.MessageBox('Parâmetro Inválido !', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -3 then
    Application.MessageBox('Alíquota não programada !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -4 then
    Application.MessageBox('Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -5 then
    Application.MessageBox('Erro ao Abrir a Porta de Comunicação', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -6 then
    Application.MessageBox('Impressora Desligada ou Desconectada', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -7 then
    Application.MessageBox('Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -8 then
    Application.MessageBox('Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt',
      'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -18 then
    Application.MessageBox('Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -19 then
    Application.MessageBox('Parâmetro diferentes !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -20 then
    Application.MessageBox('Transação cancelada pelo Operador !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -21 then
    Application.MessageBox('A Transação não foi aprovada !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -22 then
    Application.MessageBox('Não foi possível terminal a Impressão !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -23 then
    Application.MessageBox('Não foi possível terminal a Operação !', 'Atenção',
      MB_IconInformation + MB_OK);
end;

function TImpdaruma.arquivoMFDCotepe1704porCOO(cooInicial, cooFinal,
  endereco, codProp, pTipo: string): boolean;
begin
  if not vDadosIniF.existeComando('10', True) then
    Exit;
  if FileExists('C:\ATOCOTEPE_DARUMA.TXT') then
    DeleteFile(pchar('C:\ATOCOTEPE_DARUMA.TXT'));
  iRetorno := Daruma_FIMFD_GerarAtoCotepePafCoo(vDadosIniF.StrZero(cooInicial, 6),
    vDadosIniF.StrZero(cooFinal, 6));
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end
  else
  begin
    if FileExists('C:\ATOCOTEPE_DARUMA.TXT') then
    begin
      copyArquivo('C:\ATOCOTEPE_DARUMA.TXT', endereco);
      DeleteFile(pchar('C:\ATOCOTEPE_DARUMA.TXT'));
    end;
  end;
  Result := iRetorno = 1;
end;

function TImpdaruma.arquivoMFDCotepe1704porData(dataInicial, dataFinal,
  endereco, codProp, pTipo: string): boolean;
var
  registro: TRegistry;
  dtIni, dtFim, nomeArquivo, temp: string;
  lista: TStrings;
  I: Integer;
begin
  if not vDadosIniF.existeComando('9', True) then
    Exit;
  if FileExists('C:\ATOCOTEPE_DARUMA.TXT') then
    DeleteFile(pchar('C:\ATOCOTEPE_DARUMA.TXT'));
  iRetorno := Daruma_FIMFD_GerarAtoCotepePAFData(
    StringReplace(dataInicial,'/','',[rfReplaceAll]),
    StringReplace(dataFinal,'/','',[rfReplaceAll]));
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end
  else
  begin
    if FileExists('C:\ATOCOTEPE_DARUMA.TXT') then
    begin
      copyArquivo('C:\ATOCOTEPE_DARUMA.TXT', endereco);
      DeleteFile(pchar('C:\ATOCOTEPE_DARUMA.TXT'));
    end;
  end;
  Result := iRetorno = 1;
end;

function TImpdaruma.cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string;
  codigo: integer): Integer;
var
  codigoTotalizador: Integer;
  I: Integer;
begin
  Daruma_FI_NomeiaTotalizadorNaoSujeitoIcms(codigo, copy(nomeTotaliz, 1, 21));
  if iretorno = 1 then
  begin
    result := codigo;
    exit;
  end;
  for I := 1 to 30 do
  begin
    Daruma_FI_NomeiaTotalizadorNaoSujeitoIcms(I, copy(nomeTotaliz, 1, 21));
    if iretorno = 1 then
    begin
      result := codigo;
      exit;
    end
    else
      Result := 0;
  end;
  Application.MessageBox(pchar('Totalizador não foi cadastrado.' + #13 +
    'Verifique! Função permitida apenas depois da redução Z e antes de registrar o movimento do dia'),
    'Atenção', MB_ICONWARNING + MB_OK);
end;

function TImpdaruma.CancelaCupom(vsubtr: integer): boolean;
begin
  Result := true;
  iRetorno := Daruma_FI_CancelaCupom();
  Analisa_iRetorno;
  if iretorno <> 1 then
    result := false;
  if not retorno_impGer(1) then
    Result := false;
  //    EnvCmdsCupom(10);
end;

function TImpdaruma.CancelaItemGenerico(NumeroItem: real): boolean;
begin
  Result := true;
  iRetorno := Daruma_FI_CancelaItemGenerico(pchar(vDadosIniF.StrZeroDec(NumeroItem, 3, 0)));
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    CancelaItemGenerico := false;
    exit;
  end;
  if not retorno_impGer(1) then
  begin
    CancelaItemGenerico := false;
    exit;
  end;
end;

function TImpdaruma.CancelamentoNaoFiscal: boolean;
begin
  Application.ProcessMessages;
  Application.MessageBox('Função não suportada pela impressora','Atenção',0+64);
  Result := False;
end;

function TImpdaruma.cMascara(vvalor, vqtd: real; idx: integer; vdesc1,
  vdesc2: real): string;
var
  ctotal: string;
  cdescit: string;
begin
  if (idx = 1) or (idx = 2) then
  begin
    vvalor := convNumero(vvalor);
    ctotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 3);
    if FvtipoArredond <> 'A' then
    begin
      if pos(',', ctotal) > 0 then
        ctotal := copy(ctotal, 1, pos(',', ctotal) - 1) + ',' + copy(ctotal, pos(',', ctotal) +
          1,
          2);
    end
    else
    begin
      cTotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 2);
      while pos('.', ctotal) > 0 do
        delete(ctotal, pos('.', ctotal), 1);
    end;
  end;
  if idx = 2 then
  begin
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
  end;
  if idx = 1 then
    cMascara := ctotal;
  if idx = 2 then
    cMascara := cdescit;
end;

function TImpdaruma.cMascQuant(vqtd: real): string;
var
  cQuant: string;
begin
  cQuant := vDadosIniF.StrZeroDec(vqtd, 8, 3);
  delete(cQuant, 5, 1);
  cMascQuant := cQuant;
end;

function TImpdaruma.convNumero(var Valor: real): real;
begin
  if vFqtdDig = 3 then
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 3))
  else
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 2));
end;

function TImpdaruma.convNumero2(var Valor1: real): string;
begin
  if vFqtdDig = 3 then
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 3)
  else
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 2);
end;

constructor TImpdaruma.Create;
begin
  fQtdeColunasImpressao := 48;
  fPathRetornoTXT := vDadosIniF.GetIni('Fiscal', 'PathRetornoTXT', 'C:\Retorno.txt');
end;

function TImpdaruma.cupomAberto: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := False;
  iRetorno := Daruma_FI_FlagsFiscais(FlagsFiscais);
  if iRetorno <> 1 then
    exit;
  if (FlagsFiscais mod 2) <> 0 then
    Result := true;
end;

function TImpdaruma.DataHoraImpressora(Data, Hora: string): boolean;
var
  iConta: integer;
begin
  Result := true;
  FDataECF := '';
  for iConta := 1 to 6 do
  begin
    FDataECF := FDataECF + ' ';
  end;
  FHoraEcf := '';
  for iConta := 1 to 6 do
  begin
    FHoraEcf := FHoraEcf + ' ';
  end;
  iRetorno := Daruma_FI_DataHoraImpressora(FDataECF, FHoraEcf);
  if iretorno = 1 then
  begin
    Insert(':', FHoraEcf, 3);
    Insert(':', FHoraEcf, 6);
    Insert('/', FDataECF, 3);
    Insert('/', FDataECF, 6);
  end
  else
  begin
    //    Analisa_iRetorno;
    FHoraEcf := '00:00:00';
    FDataECF := '01/01/1980';
  end;
end;

function TImpdaruma.dataHoraUltimoDocumento: string;
var
  sDataHora: string;
  I: Integer;
begin
  if not vTemMFD then
  begin
    sDataHora := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Result := sDataHora;
    Exit;
  end;         

  for i := 1 to 14 do
    sDataHora := sDataHora + ' ';

  iRetorno := 0;
  while iRetorno <> 1 do
  begin
    iRetorno := Daruma_FIMFD_RetornaInformacao('73', sDataHora);
    if iRetorno <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  insert('/', sDataHora, 3);
  insert('/', sDataHora, 6);
  insert(' ', sDataHora, 11);
  insert(':', sDataHora, 14);
  insert(':', sDataHora, 17);

  Result := sDataHora;
end;

function TImpdaruma.defAtribTef: string;
begin
  defAtribTef := obFinalizador.dataSet.FieldByName('descricao').AsString;
end;

function TImpdaruma.DefCodFinalPrazo: string;
begin
  DefCodFinalPrazo := obFinalizador.dataSet.FieldByName('descricao').AsString;
end;

procedure TImpdaruma.defineArredondamentoTruncamento;
var
  vTruncArred:string;
  I: Integer;
begin
  inherited;
  FqtdDigQtde := 3;
  vTruncArred := '';
  if vDadosIniF.vDarumaObterIndiceATImpressora = 'N' then
    exit;
  For I := 1 to 2 do vTruncArred := vTruncArred + ' ';
  iRetorno := Daruma_FI_VerificaTruncamento(vTruncArred);
  if Retorno_Impressora then
  begin
    vTruncArred := Copy(Trim(vTruncArred),1,1);
    if vTruncArred = '1' then
      FvtipoArredond := 'T'
    else if vTruncArred = '0' then
      FvtipoArredond := 'A';
  end;
end;

function TImpdaruma.defvalsangsup(vvalsangsup: real): string;
var
  cValorZero: string;
begin
  cValorZero := vDadosIniF.StrZeroDec(vvalsangsup, 15, 2);
  delete(cValorZero, 13, 1);
  result := cValorZero;
end;

function TImpdaruma.Descricaoimp(vdesc: string): string;
var
  cDescricao: string;
  t: integer;
begin
  //    cDescricao := Ldescricao.Caption;
  cDescricao := vdesc;
  for t := 1 to 29 - length(cDescricao) do
  begin
    Insert(' ', cDescricao, 29);
  end;
  result := copy(cDescricao, 1, 29);
end;

function TImpdaruma.DesprogramaHorarioVerao: boolean;
var
  vHorarioVerao: string;
  I: Integer;
begin
  Result := true;
  vHorarioVerao:='';
  for I := 1 to 2 do vHorarioVerao := vHorarioVerao + ' ';
  iRetorno := Daruma_FI_VerificaHorarioVerao(pchar(vHorarioVerao));
  vHorarioVerao := Copy(Trim(vHorarioVerao),1,1);
  if vHorarioVerao = '0' then
  begin
    Application.MessageBox('Horário de verão não esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  iRetorno := Daruma_FI_ProgramaHorarioVerao();
  Retorno_Impressora;
  if iRetorno = 0 then
    result:= false;
end;

destructor TImpdaruma.Destroy;
begin
  inherited;

end;

function TImpdaruma.diaCaixaFechado: Boolean;
var
  Arq: TextFile;
  vl, i: integer;
  resp: string;
  DataReducao: string;
  horaReducao: string;
begin
  Result := true;
  if vFvDataRes = '' then
  begin
    iRetorno := Daruma_FI_RelatorioTipo60Mestre();
    Analisa_iRetorno();
    if iretorno <> 1 then
    begin
      messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    AssignFile(Arq, fPathRetornoTXT);
    try
      reset(arq);
    except
      messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 3 then
        begin
          FvDataRes := trim(copy(resp, 28, 25));
          if FvDataRes = '00/00/00' then
            FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
          try
            FvDataRes := DateToStr(StrToDate(FvDataRes));
          except
            FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
          end;
          break;
        end;
      end;
      inc(vl);
    end;
    CloseFile(Arq);
  end;
  for i := 1 to 6 do DataReducao := DataReducao + ' ';
  for i := 1 to 6 do horaReducao := horaReducao + ' ';
  iRetorno := Daruma_FI_DataHoraReducao(DataReducao, horaReducao);
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  vMapaResumo.dataRed := trim(copy(DataReducao, 1, 2)) + '/' + trim(copy(DataReducao, 3, 2)) + '/' +
    trim(copy(DataReducao, 5, 2));
  vMapaResumo.horaRed := trim(copy(horaReducao, 1, 2)) + ':' + trim(copy(horaReducao, 3, 2)) + ':' +
    trim(copy(horaReducao, 5, 2));
  if vMapaResumo.dataRed = '00/00/00' then
    vMapaResumo.dataRed := DateToStr(Date - 1);
  try
    vMapaResumo.dataRed := DateToStr(StrToDate(vMapaResumo.dataRed));
  except
    vMapaResumo.dataRed := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
  end;
end;

function TImpdaruma.EfetuaFormaPagamento(FormaPagamento: string;
  ValorFormaPagamento: real; vcodFinal: integer): boolean;
var
  cdinheiro: string;
begin
  Result := true;
  cdinheiro := vDadosIniF.StrZeroDec(ValorFormaPagamento, 15, 2);
  delete(cdinheiro, 13, 1);
  //  if (vTipoImpressora = 'BematechMFD') then
  //    iRetorno := Bematech_FI_EfetuaFormaPagamentoMFD(FormaPagamento, cdinheiro, '1', pchar(''))
  //  else
  iRetorno := Daruma_FI_EfetuaFormaPagamento(FormaPagamento, cdinheiro);
  //  Analisa_iRetorno();
  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
  begin
    EfetuaFormaPagamento := false;
    exit;
  end;
end;

function TImpdaruma.EfetuaFormaPagamentoMFD(FormaPagamento,
  ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): boolean;
begin

end;

function TImpdaruma.EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,
  ValorRecebimento: string): boolean;
begin

end;

procedure TImpdaruma.EqualizarVelocidade;
var
  Str_EqualizaVelocidade: String;
  I: Integer;
begin
  inherited;

  SetLength (Str_EqualizaVelocidade,6);
  iRetorno:= Daruma_FIMFD_EqualizarVelocidade(Str_EqualizaVelocidade);
  if iRetorno <> 1 then
  begin
    Application.MessageBox('Erro ao Equalizar velocidade da porta de cominicação', 'Atenção', 0 + 64);
    Analisa_iRetorno;
  end;
  
end;

function TImpdaruma.espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco,
  codProp: string): boolean;
begin
  if not vDadosIniF.existeComando('8', True) then
    Exit;
  if FileExists(fPathRetornoTXT) then
    DeleteFile(pchar(fPathRetornoTXT));
  iRetorno := Daruma_FIMFD_DownLoadDaMFD(vDadosIniF.StrZero(cooInicial, 6),
    vDadosIniF.StrZero(cooFinal, 6));
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end
  else
  begin
    if FileExists(fPathRetornoTXT) then
    begin
      copyArquivo(fPathRetornoTXT, endereco);
      DeleteFile(pchar(fPathRetornoTXT));
    end;
  end;
  Result := iRetorno = 1;
end;

function TImpdaruma.espelhoMFDporData(dataInicial, dataFinal, tipo, endereco,
  codProp: string): boolean;
var
  dtIni, dtFim: string;
begin
  if not vDadosIniF.existeComando('7', True) then
    Exit;
  Delete(dtIni, 7, 2);
  Delete(dtFim, 7, 2);
  dtIni := StringReplace(dataInicial, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Daruma_FIMFD_DownLoadDaMFD(dtIni, dtFim);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Result := iRetorno = 1;
end;

function TImpdaruma.estadoDeEmissaoDoCupomFiscal: integer;
var
  FlagsFiscais: Integer;
  vCupoAberto,vFormPagAtv: Boolean;
  cValorSubTotal, cValorPago: string;
  I: Integer;
begin
  vCupoAberto := False;
  vFormPagAtv := False;
  cValorSubTotal := '';
  cValorPago:= '';
  FlagsFiscais:=0;
  iRetorno := Daruma_FI_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 32 then FlagsFiscais := FlagsFiscais - 32;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then FlagsFiscais := FlagsFiscais - 4;
  if FlagsFiscais >= 2 then
  begin
    FlagsFiscais := FlagsFiscais - 2;
    vFormPagAtv := True;
    for I := 1 to 14 do cValorSubTotal := cValorSubTotal + ' ';
    iRetorno := Daruma_FI_SubTotal(cValorSubTotal);
    cValorSubTotal := Trim(cValorSubTotal);
    try
      StrToInt64(cValorSubTotal);
    except
      cValorSubTotal := '0';
    end;
  end;
  if FlagsFiscais >= 1 then
  begin
    vCupoAberto := True;
    for I := 1 to 14 do cValorPago := cValorPago + ' ';
    iRetorno := Daruma_FI_ValorPagoUltimoCupom(cValorPago);
    cValorPago := Trim(cValorPago);
    try
      StrToInt64(cValorPago);
    except
      cValorPago := '0';
    end;
  end;
  if not vCupoAberto  then
    Result := 2
  else if vFormPagAtv then
  begin
    if StrToInt64(cValorPago) >= StrToInt64(cValorSubTotal) then
      Result := 2
    else
      Result := 1;
  end
  else
    Result := 0;
end;

function TImpdaruma.existeReducaoZPendente:Integer;
begin
Result := 2;
end;

function TImpdaruma.FechaComprovanteNaoFiscalVinculado: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := Daruma_FI_FechaComprovanteNaoFiscalVinculado;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroCDC;
      if temp = '' then
        exit;
      vDocNaoF.cdc := temp;
      vDocNaoF.tipoDoc := 'CC';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
    BlockInput(false);
  end;
end;

function TImpdaruma.FechaComprovanteNaoFiscalVinculadoTEF: Integer;
begin
  Result := FechaComprovanteNaoFiscalVinculado;
end;

function TImpdaruma.fechaCupom: boolean;
begin
  Result := true;
  Daruma_FI_AbrePortaSerial;
  if Daruma_FI_FechaRelatorioGerencial = 0 then
    Daruma_FI_FechaComprovanteNaoFiscalVinculado;
  Daruma_FI_FechaPortaSerial;
end;

function TImpdaruma.FechamentoDoDia: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
    if vFvmodimpbema = 'YANCO' then
    begin
      iRetorno := Daruma_FI_FechamentoDoDia();
      if iRetorno = 1 then
      begin
        obConfImp.fechaDia;
        exit;
      end;
    end
    else
    begin
      iRetorno := Daruma_FI_ReducaoZ('', '');
      if iRetorno <> 1 then
      begin
        Result:= false;
        exit;
      end;
      Analisa_iRetorno;
      if not retorno_impGer(1) then
        iRetorno := 0;
      ProgramaF;
      iRetorno := Daruma_FI_FechamentoDoDia();
      Analisa_iRetorno;

      if iRetorno <>1 then
       begin
        Result:= false;
        exit;
      end;

      if not retorno_impGer(1) then
        iRetorno := 0;
      if iretorno <> 1 then
      begin
        if Application.MessageBox(pchar('Erro ao emitir redução Z.' + #13 +
          'Ler dados da última redução e colocar no arquivo de resumo?'), 'Confirmação',
          MB_ICONQUESTION + MB_YESNO) = mrNo then
        begin
          result := false;
          exit;
        end
      end;
      if vDadosIniF.vModImpBema = 'YANCO' then
        Sleep(2 * 1000);

      if vDadosIniF.getProgramacaoHorarioVerao = 'ATIVAR' then
        if Application.MessageBox(pchar('Foi feito um agendamento para Ativar'+
          ' o Horario de Verão. Confirma a Programação?'),'Confirmção',MB_YESNO+MB_ICONQUESTION) = IDYES then
              ProgramaHorarioVerao;

      iRetorno := Daruma_FI_RelatorioTipo60Mestre();
      Analisa_iRetorno();
      if iretorno <> 1 then
      begin
        messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
        Result := false;
        exit;
      end;
      AssignFile(Arq, fPathRetornoTXT);
      try
        reset(arq);
      except
        messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK],
          0);
        Result := false;
        exit;
      end;
      vl := 1;
      while not eof(arq) do
      begin
        ReadLn(Arq, resp);
        if resp <> '' then
        begin
          if vl = 3 then
          begin
            FvDataRes := trim(copy(resp, 28, 25));
            if FvDataRes = '00/00/00' then
              FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
          end;
          if vl = 7 then // coo inicial
            Fvcooini := trim(copy(resp, 28, 25));
          if vl = 8 then // coo final
            Fvcoofin := trim(copy(resp, 28, 25));
          if vl = 9 then // contador de reduções
            FvContRed := trim(copy(resp, 28, 25));
          if vl = 10 then // reinicio de operações
            FvcontRein := trim(copy(resp, 28, 25));
          if vl = 11 then // Venda bruta
            FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          if vl = 12 then // Grante Total
            FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          vl := vl + 1;
        end;
      end;
      CloseFile(Arq);

    end;
    //        delefile(Arq);
    diaCaixaFechado;
    montaMaparesumo;
    FechaPortaSerial;
  end
  else
  begin
    Result := false;
    exit;
  end;
end;

function TImpdaruma.FechaPortaSerial: boolean;
begin
  Result := true;
  Daruma_FI_FechaPortaSerial;
end;

function TImpdaruma.FechaRecebimentoNaoFiscalMFD(
  Mensagem: string): boolean;
begin

end;

function TImpdaruma.FechaRelatorioGerencial: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := Daruma_FI_FechaRelatorioGerencial;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroGRG;
      if temp = '' then
        exit;
      vDocNaoF.grg := temp;
      vDocNaoF.tipoDoc := 'RG';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
    BlockInput(false);
  end;
end;

function TImpdaruma.FechaRelatorioGerencialTEF: Integer;
begin
  Result := FechaRelatorioGerencial;
end;

function TImpdaruma.FecharOp: boolean;
begin
  Result := true;
  Daruma_FI_RelatorioGerencial('               FECHAMENTO DO OPERADOR           ');
  Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Daruma_FI_RelatorioGerencial('DATA.........: ' + datetostr(date));
  Daruma_FI_RelatorioGerencial('CAIXA/PDV....: ' +
    vDadosIniF.StrZeroDec(obConfImp.dataSet.FieldByName('cod_terminal').AsInteger, 4, 0));
  Daruma_FI_RelatorioGerencial('NOME DO OP...: ' + trim(vDadosIniF.vNomeFuncionario));
  Daruma_FI_RelatorioGerencial(' ');
  Daruma_FI_RelatorioGerencial(' ');
  Daruma_FI_RelatorioGerencial('        ---------------------------------       ');
  Daruma_FI_RelatorioGerencial('                  ASS. DO OPERADOR              ');
  FechaRelatorioGerencial;
end;

function TImpdaruma.gerarArquivosConferenciaSintegraSPED(vNomeArqSint,
  vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean;
var
  arquivoTxt: TextFile;
  Str_Retorno: String;
  vDias:integer;
begin
  Result := False;
  vDias := 0;

  try
    AssignFile(arquivoTxt,vNomeArqSint);
    Reset(arquivoTxt);
    while true do
    begin
      iRetorno := Daruma_Sintegra_GerarRegistro60M(
        StringReplace(vDtIni,'/','',[rfReplaceAll]),
        StringReplace(vDtFim,'/','',[rfReplaceAll]), Str_Retorno);
      if (Trim(Str_Retorno) = 'FIM DOS DADOS') or
        (Trim(Str_Retorno) = '') or
        (vDias > 31)then
        Break
      else
        Write(arquivoTxt, Str_Retorno);
      inc(vDias);
    end;
  finally
    CloseFile(arquivoTxt);
  end;

  {iRetorno :=
    Daruma_Sintegra_GerarRegistrosArq(vDtIni,
      vDtFim,
      pchar(copy(vDadosIniF.vEmp.vCidade,1,30)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,10)),
      '3',
      '3',
      '1',
      pchar(copy(vDadosIniF.vEmp.vEndereco,1,34)),
      pchar(copy(vDadosIniF.vEmp.vNumeroEnd,1,5)),
      '',
      pchar(copy(vDadosIniF.vEmp.vBairro,1,15)),
      pchar(copy(vDadosIniF.vEmp.vCEP,1,12)),
      pchar(copy(vDadosIniF.vEmp.vProprietario,1,18)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,12)));}
  if iRetorno <> 1 then
    exit;

  Result := arquivoMFDCotepe1704porData(vDtIni, vDtFim, vNomeArqCOTEPE, vDadosIniF.vCodPropEcf, 'MFD');
end;

function TImpdaruma.getGrandeTotal: string;
var
  vlrGT: string;
  iConta: integer;
  temp: string;
begin
  vlrGT := '';
  for iConta := 1 to 18 do begin vlrGT := vlrGT + ' '
  end;
  iRetorno := Daruma_FI_GrandeTotal(vlrGT);
  while iRetorno <> 1 do
  begin
    if Application.MessageBox('GT. Impressora não responde. Tentar novamente',
      'Atenção',MB_YESNO+MB_ICONQUESTION) = IDNO then
      exit;
    iRetorno := Daruma_FI_GrandeTotal(vlrGT);
  end;
  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
    temp := ''
  else
    temp := (copy(vlrGT, 1, 16) + ',' + copy(vlrGT, 17, 2));
  temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Result := temp;
end;

procedure TImpdaruma.ImpDavsEmitidos;
var
  tipo: string;
  vTexto: string;
begin
  inherited;
  Daruma_FI_RelatorioGerencial('                  DAV EMITIDOS                  ');
  Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));
  obVenda.First;
  while not obVenda.eof do
  begin
    if obVenda.dataSet.FieldByName('TIPO').AsString = 'REQ' then
      tipo := 'PEDIDO'
    else if TRIM(obVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
      tipo := 'ORDEM SERVIÇO'
    else if obVenda.dataSet.FieldByName('TIPO').AsString = 'ORC' then
      tipo := 'ORÇAMENTO';

    vTexto := TamDesc(13, tipo) + '    ' +
      obVenda.dataSet.FieldByName('DATA_FECH').AsString + '       ' +
      vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
        vDadosIniF.vQtdeDigDAV)+'                                   ';

    Daruma_FI_RelatorioGerencial(copy(vTexto,1,48));

    vTexto := 'COO Vinc: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('ncupom').AsInteger, 6) +
              ' COO Imp: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('coo_impressao').AsInteger, 6) +
              ' Valor: ' + Format('%5.2F', [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]) +
              '                                   ';

    Daruma_FI_RelatorioGerencial(copy(vTexto,1,48));

    Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));

    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obVenda.Close;
end;

procedure TImpdaruma.ImpDavsOSEmitidos;
begin
  inherited;
  Daruma_FI_RelatorioGerencial('                DAV-OS EMITIDOS            ');
  Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Daruma_FI_RelatorioGerencial(' ');
  Daruma_FI_RelatorioGerencial(' ');
  obVenda.First;
  while not obVenda.eof do
  begin
    Daruma_FI_RelatorioGerencial(vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
      vDadosIniF.vQtdeDigDAV) + '             ' + Format('%10.2F',
      [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]));
    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obVenda.Close;
end;

procedure TImpdaruma.ImpIdentificacaoPAFECF;
begin
  inherited;
  RelatorioGerencial2('             IDENTIFICAÇÃO DO PAF-ECF         ');
  RelatorioGerencial2(vDadosIniF.Replicate('=', 48));
  RelatorioGerencial2(vDadosIniF.Replicate(' ', 48));
  obIdentF.abreIdentFiscal(False);
  obIdentF.First;
  RelatorioGerencial2(TamDescricao(48, 'Laudo Numero: ' +
    obIdentF.dataSet.FieldByName('n_laudo_fiscal').AsString) +
    TamDescricao(48, obIdentF.dataSet.FieldByName('nome_empdes').AsString) +
    TamDescricao(48, ' CNPJ: ' + obIdentF.dataSet.FieldByName('cnpj_empdes').AsString) +
    TamDescricao(48, ' Endereço: ' + obIdentF.dataSet.FieldByName('endereco_empdes').AsString) +
    TamDescricao(48, ' Bairro: ' + obIdentF.dataSet.FieldByName('bairro_empdes').AsString) +
    TamDescricao(48, ' Cidade: ' + obIdentF.dataSet.FieldByName('cidade_empdes').AsString +
    ' UF: ' + obIdentF.dataSet.FieldByName('uf_empdes').AsString) +
    TamDescricao(48, ' Telefone: ' + obIdentF.dataSet.FieldByName('fone_empdes').AsString) +
    TamDescricao(48, ' Contato: ' + obIdentF.dataSet.FieldByName('contato_empdes').AsString) +
    TamDescricao(48, obIdentF.dataSet.FieldByName('nome_paf').AsString) +
    TamDescricao(48, ' ' + obIdentF.dataSet.FieldByName('nome_comercial').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Versão: ' +
    obIdentF.dataSet.FieldByName('versao_paf').AsString) +
    TamDescricao(48, ' Principal Executavel: ' +
    obIdentF.dataSet.FieldByName('principal_exec').AsString) +
    TamDescricao(48, ' MD5: ' + vDadosIniF.vMD5Fiscal));
  RelatorioGerencial2(' Outros arquivos e MD5');
  while not obIdentF.dataSet.Eof do
  begin
    RelatorioGerencial2(
      TamDescricao(48, '  ' + obIdentF.dataSet.FieldByName('nome_arquivo').AsString) +
      TamDescricao(48, '  ' + obIdentF.dataSet.FieldByName('md5_arquivo').AsString));
    obIdentF.next;
  end;
  obTermImp.abreTerminalImpressoras;
  RelatorioGerencial2('ECF''s Autorizados');
  obTermImp.First;
  while not obTermImp.dataSet.Eof do
  begin
    RelatorioGerencial2(' ' +
      vDadosIniF.decodifica(obTermImp.dataSet.FieldByName('num_serie_ecf').AsString));
    obTermImp.next;
  end;
  FechaRelatorioGerencial;
end;

procedure TImpdaruma.ImpMeiosDePagamento;
var
  vTipDoc: string;
  vValorCancelado: Currency;
begin
  inherited;
  Daruma_FI_RelatorioGerencial('               MEIOS DE PAGAMENTO               ');
  Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Daruma_FI_RelatorioGerencial(' ');
  Daruma_FI_RelatorioGerencial(' ');
  obCupom.vMeiosPag.First;
  while not obCupom.vMeiosPag.dataSet.Eof do
  begin
    vtipDoc := '';
    vValorCancelado := obCupom.vMeiosPag.getValorCancelado(
      obCupom.vMeiosPag.dataSet.FieldByName('cod_finalizador').AsInteger,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime);
    if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString <> 'CUP' then
      vValorCancelado := 0;
    if vValorCancelado < obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat then
    begin
      if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'CUP' then
        vtipDoc := trim('Cupom Fiscal')
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'REC' then
        vtipDoc := 'Comprovante Nao Fiscal - ' +
          Trim(obCupom.vMeiosPag.dataSet.FieldByName('DESCRICAO').AsString)
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'SUP' then
        vtipDoc := TamDesc(48, 'Comprovante Não Fiscal - ') + 'Suprimento';

      Daruma_FI_RelatorioGerencial(
        TamDescricao(24, trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) +
        ' - ' + obCupom.vMeiosPag.dataSet.FieldByName('tipo_final').AsString) +
        TamDescricao(12, trim(obCupom.vMeiosPag.dataSet.FieldByName('data').AsString)) +
        TamDescricao(12, format('%9.2f', [obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
        vValorCancelado]))
          +
        TamDescricao(48, vTipDoc) + TamDescricao(48, ' '));
    end;
    obCupom.vMeiosPag.next;
  end;
  FechaRelatorioGerencial;
  obCupom.vMeiosPag.close;
end;

procedure TImpdaruma.ImpResumoVnd;
var
  vindbarra, vindprod: string;
begin
  inherited;
  Daruma_FI_RelatorioGerencial('     RELATORIO DE QTDE DE PRODUTOS VENDIDOS ');
  Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Daruma_FI_RelatorioGerencial(' ');
  Daruma_FI_RelatorioGerencial(' ');
  while not obCupom.vTotalVenda.dataSet.eof do
  begin
    obProd.selecionaProdutoGrupoCodigo(
      obCupom.vTotalVenda.dataSet.fieldbyname('GRUPO_PROD').AsInteger,
      obCupom.vTotalVenda.dataSet.fieldbyname('COD_PROD').AsString);
    Daruma_FI_RelatorioGerencial(TamDescricao(48,TamDesc(29, obProd.dataSet.FieldByName('descr_prod').AsString)
      +
      '  ' + format('%8.5f',
      [obCupom.vTotalVenda.dataSet.FieldByName('SOMA').AsFloat])));
    obCupom.vTotalVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obCupom.vTotalVenda.dataSet.close;
end;

function TImpdaruma.imprimeDavNoEcf(dav: RVenda): boolean;
var
  temp: string;
  tamanhoLinha: integer;
  I: Integer;
begin
  tamanhoLinha := fQtdeColunasImpressao;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Documento Auxiliar de Venda'));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Doc Nº ' + vDadosIniF.StrZero(dav.nprevenda,
    vDadosIniF.vQtdeDigDAV) +
    '  Nº Doc Fiscal ___________'));
  temp := '';
  if dav.tipo_venda = 'REQ' then
    temp := 'Pedido de Venda Nº '
  else if TRIM(dav.tipo_venda) = 'OS' then
    temp := 'Ordem de Serviço Nº '
  else if dav.tipo_venda = 'ORC' then
    temp := 'Orçamento Nº ';
  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  //  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Cliente: ' +
    vDadosIniF.StrZero(dav.cod_cliente,
    6)
    + ' ' + dav.nome_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Endereço: ' + dav.endereco_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.bairro_cliente + ', ' + dav.cidade_cliente
    +
    '-'
    + dav.estado_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CPF/CNPJ: ' +
    vDadosIniF.StrZero(dav.cnpjcpf_cliente, 14) + '  Insc Est: ' + dav.insc_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Telefone: ' + dav.fone_cliente + '  Cond.Pag: '
    + dav.cond_pag));
  if Trim(dav.linhaAd1) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd1)));
  if Trim(dav.linhaAd2) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd2)));
  if Trim(dav.linhaAd3) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd3)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,
    'PRODUTO/SERVIÇO  QTDE     VL UNIT      VL TOTAL'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  for I := 0 to dav.qtde_Produtos + dav.qtde_Servicos - 1 do
  begin
    temp := IntToStr(i + 1) + ' ';
    if dav.item[i].tipo = 'P' then
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod) + ' ' + dav.item[i].cod_prod;
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end
    else
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod);
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end;
  end;
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Produtos..: ' +
      IntToStr(dav.qtde_Produtos)));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Serviços..: ' +
      IntToStr(dav.qtde_Servicos)));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Produtos....: ' + Format('%12.2f',
      [dav.valor_produtos])));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Serviços....: ' + Format('%12.2f',
      [dav.valor_servicos])));
  if dav.desconto > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Desconto..........: ' + Format('%12.2f',
      [dav.desconto])));
  if dav.acrescimo > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Acréscimo.........: ' + Format('%12.2f',
      [dav.acrescimo])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Líquido.....: ' + Format('%12.2f',
    [dav.valor_liquido])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,'Obs.: ' + dav.observacao));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  if dav.usar_Declaracao = 'S' then
  begin
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'Autorizo, nos termos do parágrafo 2º do artigo'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      '43 do codigo de defesa do consumidor o registro'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'do meu debito no servico de protecao ao credito,'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'e a respectiva correcao monetaria, ate a data'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'do seu efetivo pagamento, caso haja'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'inadimplencia de minhas obrigaçoes perante esta.'));

    RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  end;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, '______________________________'));
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Assinatura'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.empresa + '    ' + dav.fone_Empresa));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CNPJ: ' + dav.cgc_emp));
  result := FechaRelatorioGerencial = 1;
end;

function TImpdaruma.Imprime_Prazo: boolean;
var
  ixx, i: integer;
  vcount, vfl, vret: integer;
  iInicio: Ttime;
  mes: array[1..12] of string;
  vdia, vmes, vano: word;
begin
  Result := true;
  reimprime :='1';
  mes[1] := 'JANEIRO';
  mes[2] := 'FEVEREIRO';
  mes[3] := 'MARÇO';
  mes[4] := 'ABRIL';
  mes[5] := 'MAIO';
  mes[6] := 'JUNHO';
  mes[7] := 'JULHO';
  mes[8] := 'AGOSTO';
  mes[9] := 'SETEMBRO';
  mes[10] := 'OUTUBRO';
  mes[11] := 'NOVEMBRO';
  mes[12] := 'DEZEMBRO';
  //
 // BlockInput(true);
  if not obEmpresa.Active then
    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
  //
  vimptef := 1;
  vret := 1;
  vcanctef := 0;
  if reimprime = '0' then
  begin
    if vacr = 1 then
      Daruma_FI_AbreComprovanteNaoFiscalVinculado('Prazo           ', Fvvalpr,
        vDadosIniF.StrZeroDec(Fvnc, 6, 0));
  end;
  for i := 1 to obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger do
    // QtdCpNF.value do
  begin
    obCupom.vFPg.First;
    vcount := 1;
    while not obCupom.vFPg.Eof do
    begin
      decodedate(obCupom.vFPg.dataSet.FieldByName('data_venc').AsDateTime, vano, vmes, vdia);
      vret := 1;
      if reimprime = '0' then
      begin
        if vcount > 1 then
        begin
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.vEmp.vRazaoSocial) = 0 then
            break;
          if
            Daruma_FI_UsaComprovanteNaoFiscalVinculado(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring) = 0 then
            break;
          if
            Daruma_FI_UsaComprovanteNaoFiscalVinculado(obEmpresa.dataSet.FieldByName('bairro_emp').AsString +
            ', ' + obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString) = 0 then
            break;
          if
            Daruma_FI_UsaComprovanteNaoFiscalVinculado(obEmpresa.dataSet.FieldByName('telefone_emp').AsString + ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario) = 0 then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
        end;
        //
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado('Reconheco o valor da divida abaixo:') = 0
          then
          break;
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString) = 0 then
          break;
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').Asfloat])) = 0 then
          break;
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado('OPERADOR: ' + vDadosIniF.vNomeFuncionario)
          = 0
          then
          break;
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ') = 0 then
          break;
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ') = 0 then
          break;
        if Daruma_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString) = 0 then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString)) = 0 then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString) = 0 then
            break;
        end
        else
        begin
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('CLIENTE: ' + obCupom.getNomeAvulso) = 0
            then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('ENDERECO: ' + obCupom.getEnderecoAvulso
            +
            ' ' + obCupom.getBairroAvulso) = 0 then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' + obCupom.getCpfCnpjAvulso)
            =
            0
            then
            break;
        end;
        if
          Daruma_FI_UsaComprovanteNaoFiscalVinculado(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString)) = 0 then
          break;
      end
      else
      begin
        if vcount > 1 then
        begin
          if Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
          if Daruma_FI_RelatorioGerencial(vDadosIniF.vEmp.vRazaoSocial) = 0 then
            break;
          if Daruma_FI_RelatorioGerencial(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring)
            = 0
            then
            break;
          if Daruma_FI_RelatorioGerencial(obEmpresa.dataSet.FieldByName('bairro_emp').AsString +
            ', '
            + obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString) = 0 then
            break;
          if Daruma_FI_RelatorioGerencial(obEmpresa.dataSet.FieldByName('telefone_emp').AsString
            +
            ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario) = 0 then
            break;
          if Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
        end;
        if Daruma_FI_RelatorioGerencial('Reconheco o valor da divida abaixo:') = 0 then
          break;
        if Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if Daruma_FI_RelatorioGerencial(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString) = 0 then
          break;
        if Daruma_FI_RelatorioGerencial('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat])) = 0 then
          break;
        if Daruma_FI_RelatorioGerencial('OPERADOR: ' + vDadosIniF.vNomeFuncionario) = 0 then
          break;
        if Daruma_FI_RelatorioGerencial(' ') = 0 then
          break;
        if Daruma_FI_RelatorioGerencial(' ') = 0 then
          break;
        if Daruma_FI_RelatorioGerencial(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if Daruma_FI_RelatorioGerencial('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString) = 0 then
            break;
          if Daruma_FI_RelatorioGerencial('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString)) = 0 then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString) = 0 then
            break;
        end
        else
        begin
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('CLIENTE: ' + obCupom.getNomeAvulso) = 0
            then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('ENDERECO: ' + obCupom.getEnderecoAvulso
            +
            ' ' + obCupom.getBairroAvulso) = 0 then
            break;
          if Daruma_FI_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' + obCupom.getCpfCnpjAvulso)
            =
            0
            then
            break;
        end;
        if
          Daruma_FI_RelatorioGerencial(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString)) = 0 then
          break;
      end;
      if vret = 0 then
        break;
      retorno_ImpTEF;
      if vcanctef <> 0 then
        vret := 0;
      if vret = 0 then
        break;
      obCupom.vFPg.Next;
      inc(vcount);
      if obCupom.vFPg.Eof then
      begin
        {     if reimprime = '0' then
             begin
              vret:=Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
              vret:=Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
             end
             else
             begin
              vret:=Daruma_FI_RelatorioGerencial(' ');
              vret:=Daruma_FI_RelatorioGerencial(' ');
             end;
             if vret = 0 then
              break;}
      end
      else
      begin
        if reimprime = '0' then
        begin
          vret := Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
          vret := Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
          vret := Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
          vret := Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
        end
        else
        begin
          vret := Daruma_FI_RelatorioGerencial(' ');
          vret := Daruma_FI_RelatorioGerencial(' ');
          vret := Daruma_FI_RelatorioGerencial(' ');
          vret := Daruma_FI_RelatorioGerencial(' ');
        end;
      end;
    end;
    if vret = 0 then
      break
    else
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        vret := Daruma_FI_RelatorioGerencial(' ');
        if vret = 0 then
          break;
        vret := Daruma_FI_RelatorioGerencial(' ');
        if vret = 0 then
          break;
      end;
    end;
    if i <> 2 then
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        iInicio := time;
        if reimprime = '0' then
        begin
          vret := Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
          if vret = 0 then
            break;
          vret := Daruma_FI_UsaComprovanteNaoFiscalVinculado(' ');
          if vret = 0 then
            break;
        end
        else
        begin
          vret := Daruma_FI_RelatorioGerencial(' ');
          if vret = 0 then
            break;
          vret := Daruma_FI_RelatorioGerencial(' ');
          if vret = 0 then
            break;
        end;
        //   IF obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
       //    begin
        repeat
        until ((time - iInicio) > strtotime('00:00:02'));
        //    end;
      end;
    end;
  end;
  if vret = 0 then
    Imprime_Prazo := false
  else
  begin
    if reimprime = '1' then
      FechaRelatorioGerencial
    else
      FechaComprovanteNaoFiscalVinculado;
    Imprime_Prazo := true;
  end;
  // BlockInput(false);
end;

function TImpdaruma.ImpTirouZSoz(vdat1, Vdat2: Tdate): boolean;
begin
  if vdat1 = Vdat2 then
    Result := true
  else
    result := false;
end;

function TImpdaruma.IniciaFechamentoCupom(AcrescimoDesconto,
  TipoAcrescimoDesconto: string; ValorAcrescimoDesconto: real): boolean;
var
  cDes_Acres: string;
begin
  Result := true;
  {if (vTipoImpressora = 'BematechMP20') then
  begin
    cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 15, 2);
    delete(cDes_Acres, 13, 1);
    iRetorno := Bematech_FI_IniciaFechamentoCupom(acrescimoDesconto, '$', cDes_Acres);
    if not retorno_impGer(1) then
      iRetorno := 0;
    if iretorno <> 1 then
    begin
      cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 13, 2);
      delete(cDes_Acres, 11, 1);
      iRetorno := Bematech_FI_IniciaFechamentoCupom(AcrescimoDesconto, '$', cDes_Acres);
      if not retorno_impGer(1) then
        iRetorno := 0;
      if iretorno <> 1 then
      begin
        Analisa_iRetorno;
        IniciaFechamentoCupom := false;
        exit;
      end;
    end;
  end;}

//  if (vTipoImpressora = 'BematechMFD') then
//  begin
  cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 15, 2);
  delete(cDes_Acres, 13, 1);

  {    cValor := DCAcres_Desc.Text;
      cTipoDesconto := '$';
      cValorDesc := cDes_Acres;
      cDescricao := '00000000000000';}
  iRetorno := Daruma_FI_IniciaFechamentoCupom(AcrescimoDesconto, '$', cDes_Acres);
  //       iRetorno := Bematech_FI_IniciaFechamentoCupomMFD( DCAcres_Desc.Text, cTipoDesconto, cValorDesc ,cDescricao);
  //       ( pchar(DCAcres_Desc.Text), pchar('$'), pchar(cDes_Acres),pchar('00000000000000'));
  if not retorno_impGer(1) then
    iRetorno := 0;

  if iretorno <> 1 then
  begin
    Analisa_iRetorno;
    IniciaFechamentoCupom := false;
    exit;
  end;
  vdadosIniF.acumulaGrandeTotal(0);
  //end;
end;

function TImpdaruma.IniciaFechamentoCupomMFD(AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto: string): boolean;
begin

end;

function TImpdaruma.LeituraMemoriaFiscalData(vdata1,
  vdata2, CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '1');
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '0');
  end;
  Result := true;
  iRetorno := Daruma_FI_LeituraMemoriaFiscalData(pchar(vdata1), pchar(vdata2));
  Analisa_iRetorno;
end;

function TImpdaruma.LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): boolean;
begin

end;

function TImpdaruma.LeituraMemoriaFiscalReducao(ReducaoInicial,
  ReducaoFinal, CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '1');
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '0');
  end;
  Result := true;
  iRetorno := Daruma_FI_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal);
  Analisa_iRetorno;
end;

function TImpdaruma.LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpdaruma.LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada,
  endereco: string): boolean;
var
  vtp: string;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '1');
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '0');
  end;
  Result := true;
  iRetorno := Daruma_FI_LeituraMemoriaFiscalSerialData(pchar(DataInicial), pchar(DataFinal));
  Analisa_iRetorno;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpdaruma.LeituraMemoriaFiscalSerialDataMFD(DataInicial,
  DataFinal, FlagLeitura: string): boolean;
begin

end;

function TImpdaruma.LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal,
  CompletaSimplificada, endereco: string): boolean;
var
  vtp: string;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '1');
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
    alteraRegistro('MFDLeituraMFCompleta ', '0');
  end;
  Result := true;
  iRetorno := Daruma_FI_LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal);
  Analisa_iRetorno;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpdaruma.LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpdaruma.LeituraX: boolean;
begin
  Result := true;
  iRetorno := Daruma_FI_LeituraX();
  Analisa_iRetorno();
end;

function TImpdaruma.LeTabelaResumo: boolean;
var
  Arq: TextFile;
  vdadredz: array[1..6] of string;
  vl: integer;
  resp: string;
begin
  Result := true;
  iRetorno := Daruma_FI_RelatorioTipo60Mestre();
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  vl := 1;
  while not eof(arq) do
  begin
    ReadLn(Arq, resp);
    if resp <> '' then
    begin
      if vl = 3 then
        FvDataRes := trim(copy(resp, 28, 25));
      if vl = 7 then // coo inicial
        Fvcooini := trim(copy(resp, 28, 25));
      if vl = 8 then // coo final
        Fvcoofin := trim(copy(resp, 28, 25));
      if vl = 9 then // contador de reduções
        FvContRed := trim(copy(resp, 28, 25));
      if vl = 10 then // reinicio de operações
        FvcontRein := trim(copy(resp, 28, 25));
      if vl = 11 then // Venda bruta
        FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      if vl = 12 then // Grante Total
        FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      vl := vl + 1;
    end;
  end;
  CloseFile(Arq);
  diaCaixaFechado;
  montaMaparesumo;
end;

function TImpdaruma.NumeroCupom: string;
var
  cnumerocupom: string;
  iConta: integer;
begin
  //     FPrinter.FechaComunicacao;
           //     Bematech_FI_AbrePortaSerial;
  for iConta := 1 to 6 do begin cNumeroCupom := cNumeroCupom + ' '
  end;
  iRetorno := 0;
  while iRetorno <> 1 do
  begin
    iRetorno := Daruma_FI_NumeroCupom(cNumeroCupom);
    if iRetorno <> 1 then
    begin
      //BlockInput(False);
      //if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
      //  'Atenção',
      //  MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  //     Bematech_FI_FechaPortaSerial;
  NumeroCupom := cNumeroCupom;
end;

function TImpdaruma.numeroGNF: string;
var
  sGNF: string;
  cont: integer;
begin
  sGNF := '';
  for cont := 1 to 6 do sGNF := sGNF + ' ';
  iRetorno := Daruma_FI_NumeroOperacoesNaoFiscais(sGNF);
  result := sGNF;
end;

function TImpdaruma.numeroGRG: string;
var
  sGRG: string;
  cont: integer;
begin
  sGRG := '';
  for cont := 1 to 6 do sGRG := sGRG + ' ';
  iRetorno := Daruma_FIMFD_RetornaInformacao('33', sGRG);
  result := sGRG;
end;

function TImpdaruma.NumeroSerie: string;
var
  retorno_var: string;
  iConta: integer;
begin
  Retorno_var := '';
  {if (vTipoImpressora = 'BematechMFD') then
  begin
    for iConta := 1 to 20 do begin Retorno_var := Retorno_var + ' ' end;
    // função que retorna o número de série da impressora
    iretorno := Bematech_FI_NumeroSerieMFD(Retorno_var);
  end
  else
  begin}
  for iConta := 1 to 15 do begin Retorno_var := Retorno_var + ' '
  end;
  // função que retorna o número de série da impressora
  iRetorno := Daruma_FI_NumeroSerie(Retorno_var);
  //  end;

    // Procedure que analisa o retorno da função
  Analisa_iRetorno();
  //     FPrinter.AtualizaEprom;
  //     Retorno_var:=FPrinter.UltimaResp;
  if iRetorno > 0 then
    NumeroSerie := retorno_var
  else
  begin
    ShowMessage(retorno_var);
    NumeroSerie := '';
  end;
end;

function TImpdaruma.NumeroSerieMFD: string;
begin

end;

function TImpdaruma.obterCNPJUsuario: string;
var
  vCNPJ: string;
  i: integer;
begin
  vCNPJ := '';
  for i := 1 to 20 do vCNPJ := vCNPJ + ' ';
  if vTemMFD then
    iRetorno := Daruma_FIMFD_RetornaInformacao('90', vCNPJ)
  else
    vCNPJ := '';
  result := trim(removeCaracteresCNPJ(vCNPJ));
end;

function TImpdaruma.PrazoECF: boolean;
var
  vret: integer;
begin
  Result := true;
  Daruma_FI_AbrePortaSerial;
  reimprime := '0';
  vacr := 1;
  while not Imprime_Prazo do
  begin
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if reimprime = '1' then
        FechaRelatorioGerencial
      else
        FechaComprovanteNaoFiscalVinculado;
      break;
    end
    else
    begin
      //tef      sTEFRetorno := '0';
      if reimprime = '1' then
      begin
        vret := FechaRelatorioGerencial;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaRelatorioGerencial
          else
          begin
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        //tef        if sTEFRetorno = '1' then
        break;
      end
      else
      begin
        vret := FechaComprovanteNaoFiscalVinculado;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaComprovanteNaoFiscalVinculado
          else
          begin
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        //tef        if sTEFRetorno = '1' then
        break;
        if vret <> 0 then
          reimprime := '1';
      end;
    end;
  end;
  Daruma_FI_FechaPortaSerial;
end;

function TImpdaruma.ProgramaFormaPagamentoMFD(FormaPagto,
  OperacaoTef: string): boolean;
begin

end;

function TImpdaruma.ProgramaHorarioVerao: boolean;
var
  vHorarioVerao: string;
  I: Integer;
begin
  Result := true;
  vHorarioVerao:='';
  for I := 1 to 2 do vHorarioVerao := vHorarioVerao + ' ';
  iRetorno := Daruma_FI_VerificaHorarioVerao(pchar(vHorarioVerao));
  vHorarioVerao := Copy(Trim(vHorarioVerao),1,1);
  if vHorarioVerao = '1' then
  begin
    Application.MessageBox('Horário de verão já esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  iRetorno := Daruma_FI_ProgramaHorarioVerao();
  Retorno_Impressora;
  if iRetorno = 0 then
    result:= false;
end;

function TImpdaruma.RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Daruma_FI_RecebimentoNaoFiscal(indicetotalizador, Valor, FormaPagamento);
  if iretorno <> 1 then
    result := False;
  Analisa_iRetorno;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpdaruma.RelatorioGerencial(Texto: string): Integer;
begin
  Result := Daruma_FI_RelatorioGerencial(Texto);
end;

function TImpdaruma.RelatorioGerencial2(Texto: string): Integer;
begin
  Result := 0;
  while Result = 0 do
  begin
    Result := Daruma_FI_RelatorioGerencial(Texto);
    if Result <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        Break;
    end
    else Break;
  end;
end;

function TImpdaruma.RelatorioTipo60Mestre: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
    if vFvmodimpbema = 'YANCO' then
    begin
      exit;
    end
    else
    begin
      iRetorno := Daruma_FI_RelatorioTipo60Mestre();
      Analisa_iRetorno();
      if iretorno <> 1 then
      begin
        messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
        Result := false;
        exit;
      end;
      AssignFile(Arq, fPathRetornoTXT);
      try
        reset(arq);
      except
        messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK],
          0);
        Result := false;
        exit;
      end;
      vl := 1;
      while not eof(arq) do
      begin
        ReadLn(Arq, resp);
        if resp <> '' then
        begin
          if vl = 7 then // coo inicial
            Fvcooini := trim(copy(resp, 28, 25));
          if vl = 8 then // coo final
            Fvcoofin := trim(copy(resp, 28, 25));
          if vl = 9 then // contador de reduções
            FvContRed := trim(copy(resp, 28, 25));
          if vl = 10 then // reinicio de operações
            FvcontRein := trim(copy(resp, 28, 25));
          if vl = 11 then // Venda bruta
            FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          if vl = 12 then // Grante Total
            FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
          vl := vl + 1;
        end;
      end;
      CloseFile(Arq);
    end;
    //        delefile(Arq);
    FechaPortaSerial;
  end
  else
  begin
    Result := false;
    exit;
  end;
end;

function TImpdaruma.retorno_Imp: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := Daruma_FI_NumeroSerie(cNumeroSerie);
  iRetorno := Daruma_FI_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      vFVccancTef := 1;
      //vcanctef := 1;
      Retorno_Imp := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_Imp := false;
    end;
  end
  else
    Retorno_Imp := true;
end;

function TImpdaruma.retorno_ImpGer(vflap: integer): boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  vflg: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  //
  iRetorno := daruma_FI_RetornoImpressora(iACK, iST1, iST2);
  {  if retorno <> 1 then
      Result := false
    else
    begin}
  if iACK = 6 then
  begin
    vflg := 0;
    if iST2 >= 128 then
    begin
      if vflap = 1 then
        messagedlg('Parâmetro inválido', mtinformation, [mbOK], 0);
      iST2 := iST2 - 128;
      result := false;
      vflg := 1;
    end;
    if iST2 >= 64 then
    begin
      iST2 := iST2 - 64;
      vflg := 1;
    end;
    if iST2 >= 32 then
    begin
      iST2 := iST2 - 32;
      vflg := 1;
    end;
    if iST2 >= 16 then
    begin
      iST2 := iST2 - 16;
      if vflap = 1 then
        messagedlg('Aliquota não Programada', mtinformation, [mbOK], 0);
      result := false;
      vflg := 1;
    end;
    if iST2 >= 8 then
    begin
      iST2 := iST2 - 8;
    end;
    if iST2 >= 4 then
    begin
      iST2 := iST2 - 4;
    end;
    if iST2 >= 2 then
    begin
      iST2 := iST2 - 2;
    end;
    if iST2 >= 1 then
    begin
      iST2 := iST2 - 1;
      if vflap = 1 then
        messagedlg('Comando não Executado', mtinformation, [mbOK], 0);
      result := false;
      vflg := 1;
    end;
    if vflg = 0 then
      result := true;
  end
  else
    result := true;
  //  end;
end;

function TImpdaruma.Retorno_Impressora:boolean;
begin
  inherited;
  Result := iRetorno = 1;
end;

function TImpdaruma.Retorno_impTEF: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  // iRetorno := Bematech_FI_NumeroSerie( cNumeroSerie );
  iRetorno := Daruma_FI_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      Retorno_ImpTEF := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_ImpTEf := false;
    end;
  end;
end;

function TImpdaruma.RetornoImpressora(var ACK, ST1, ST2: Integer): boolean;
begin
    iRetorno := Daruma_FI_VerificaEstadoImpressora(ACK, ST1, ST2);
    Analisa_iRetorno;
    if iRetorno = 1 then
      result:= true
    else
      result:= false;

end;


function TImpdaruma.Sangria(Valor: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Daruma_FI_Sangria(pchar(valor));
  if iretorno <> 1 then
    result := false;
  Analisa_iRetorno;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpdaruma.SubTotal: string;
var
  vlrultc: string;
  iConta: integer;
begin
  vlrultc := '';
  for iConta := 1 to 14 do begin vlrultc := vlrultc + ' '
  end;
  iRetorno := Daruma_FI_SubTotal(vlrultc);

  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
    SubTotal := ''
  else
    SubTotal := (copy(vlrultc, 1, 12) + ',' + copy(vlrultc, 13, 2));
end;

function TImpdaruma.Suprimento(Valor, FormaPagamento: string): boolean;
var
  dataHoraUltDoc, vTemp: string;
begin
  Result := true;
  iRetorno := Daruma_FI_VerificaModeloECF();
  vTemp := FormaPagamento;
  if iRetorno = 1 then
  begin
    obFinalizador.dataSet.First;
    vTemp := Trim(obFinalizador.dataSet.FieldByName('descricao').AsString);
    while length(vTemp) < 10 do
      vTemp := vTemp + ' ';
  end;
  iRetorno := Daruma_FI_Suprimento(pchar(Valor), pchar(vTemp));
  if iretorno <> 1 then
    result := false;
  Analisa_iRetorno;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0'; //   '12/12/2008 12:12:58'
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpdaruma.TerminaFechamentoCupom(linha1, linha2, linha3, linha4,
  linha5, linha6, linha7, linha8: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Daruma_FI_TerminaFechamentoCupom(linha1 + linha2 + linha3 + linha4 + linha5 +
    linha6
    +
    linha7 + linha8);
  if not retorno_impGer(1) then
    iRetorno := 0;
  while iretorno <> 1 do
    //          Fprinter.FechaCupomFiscal('N') do
  begin
    if Application.MessageBox(pchar('Impressora Fiscal Não Responde, Tentar Novamente'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      TerminaFechamentoCupom := false;
      exit;
      break;
    end
    else
      iRetorno := Daruma_FI_TerminaFechamentoCupom(linha1 + linha2 + linha3 + linha4 + linha5 +
        linha6 + linha7 + linha8);
  end;
  if Result then
  begin
    vdadosIniF.acumulaGrandeTotal(0);
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.tipoDoc := 'RV';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpdaruma.UsaComprovanteNaoFiscalVinculado(
  Texto: string): Integer;
begin
  result := Daruma_FI_UsaComprovanteNaoFiscalVinculado(texto);
end;

function TImpdaruma.ValorPagoCupomAtual: string;
var
  cValorPago: string;
  I: Integer;
begin
  for I := 1 to 14 do cValorPago := cValorPago + ' ';
  iRetorno := Daruma_FI_ValorPagoUltimoCupom(cValorPago);
  cValorPago := Trim(cValorPago);
  try
    cValorPago := IntToStr(StrToInt64(cValorPago));
  except
    cValorPago := '0';
  end;
  if cValorPago = '0' then
    Result := '0'
  else
    Result := Format('%0.2f',[StrToInt64(cValorPago) / 100]);
end;

function TImpdaruma.vendadeItensBema(ccodigo, cDescricao, cAliquota,
  cTipoQtde, cQtde: string; iCasasDecimais: integer; cValor, cTipoDesconto,
  cValorDesc: string): boolean;
var
  iretorno: integer;
begin
  //
  Result := true;
  iretorno := daruma_FI_VendeItem(pchar(cCodigo),
    pchar(cDescricao),
    pchar(cAliquota),
    pchar(cTipoQtde),
    pchar(cQtde),
    iCasasDecimais,
    pchar(cValor),
    pchar(cTipoDesconto),
    pchar(cValorDesc));
  if iretorno <> 1 then
    Result := false
  else
  begin
    if not retorno_impGer(1) then
      result := false
    else
      result := true;
  end;
end;

function TImpdaruma.VendeItem(Codigo, Descricao, Aliquota, TipoQuantidade,
  Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
  TipoDesconto: string; Desconto1, Desconto2, nquant: real): boolean;
var
  vflgn: integer;
  vvp: string;
  vrAcumGT: Currency;
begin
  Result := true;
  if vFqtdDig = 3 then
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 3);
    delete(Fvcpreco, 6, 1);
  end
  else
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 2);
    delete(Fvcpreco, 7, 1);
  end;
  vFvcpreco := convNumero2(valorunitario);
  valorunitario := convNumero(ValorUnitario);
  if vtipoArredond <> 'A' then
  begin
    if pos(',', vFvcpreco) > 0 then
    begin
      if vFqtdDig = 3 then
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 3)
      else
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 2);
    end;
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 3);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end
  else
  begin
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 2);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    while pos('.', FvcTotal) > 0 do
      delete(FvcTotal, pos('.', FvcTotal), 1);
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end;
  if vFqtdDig = 3 then
    delete(Fvcpreco, 6, 1)
  else
    delete(Fvcpreco, 7, 1);
  if pos(',', vFvcTotal) > 0 then
    vFvcTotal := copy(vFvcTotal, 1, pos(',', vFvcTotal) - 1) + ',' + copy(vFvcTotal, pos(',',
      vFvcTotal) + 1, 2);
  //         nTotal:=nTotal+strtofloat(vFvcTotal);
  if (Desconto1 > 0) or (Desconto2 > 0) then

    vFValorLiq := floattostr((strtofloat(vFvcTotal) - strtofloat(vFcdescit)))
      //          floattostr((strtofloat(vFvcTotal)-(Strtofloat(vFvcTotal)*(vdescitem/100))))
  else
    vFValorLiq := vFvcTotal;
  vFvcTotal := vDadosIniF.StrZeroDec(strtofloat(vFvcTotal), 13, 2);
  delete(FvcTotal, 11, 1);
  //         eu:=currtostr((nPreco*nQuant));
  //         delete(vFvcTotal,8,1);
  //      showmessage(cbarra+cdesc20+vsittributaria+
  //       'F'+Cquant+inttostr(vqtdig)+vFvcpreco+'%'+'0000');
  if (Desconto1 > 0) or (Desconto2 > 0) then
  begin
    vFcdescit := vDadosIniF.StrZeroDec(desconto2 + ((desconto1 * Valorunitario) / 100), 9, 2);
    delete(Fcdescit, 7, 1);
  end
  else if ((Desconto1 < 0) or (Desconto2 < 0)) and (vDadosIniF.existeComando('2', false)) then
    // o Valor negativo do desconto significa que é acrescimo
  begin
    if vDadosIniF.existeComando('2', false) then
    begin
      vFcdescit := vDadosIniF.StrZeroDec(((-1) * desconto2) + ((((-1) * desconto1) *
        Valorunitario)
        / 100), 9, 2);
      vFValorLiq := FloatToStr(StrToFloat(vFValorLiq) + StrToFloat(vFcdescit));
      vrAcumGT := vrAcumGT + StrToCurr(trim(vFcdescit));
      delete(Fcdescit, 7, 1);
    end;
  end
  else
    vFcdescit := '00000000';

  vflgn := 0;
  while not vendadeItensBema(Codigo, Descricao, Aliquota, 'F', quantidade, vFqtdDig,
    vFvcpreco, '$', vFcdescit) do
    //       FPrinter.VendeItem3Dig(cbarra+'\'+cdesc20+'\'+vSitTributaria+'\'+cQuant+'\'+vFvcpreco+'\'+cdescit+'\UN\'+vFvcTotal) do
  begin
    if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      vflgn := 1;
      break;
    end;
    //              messagedlg('Problemas no Envio de Inf. Para Impressora',mtinformation,[mbOK],0);
  end;
  if vflgn = 1 then
  begin
    VendeItem := false;
    exit;
  end;
  vdadosIniF.acumulaGrandeTotal(vrAcumGT);
end;

function TImpdaruma.VendeItemSimples(pCodigo, pDescricao, pAliquota: string;
  pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean;
var
  cQtde,cValor,cDesconto,cAcrescimo:string;
  vrTemp,vrDesc,vrAcres,vrTot:Real;
  vQtde:string;
begin
//  vQtde := cMascQuant(pQuantidade);
//  Result := VendeItem(pCodigo,pDescricao,pAliquota,'F',vQtde,FqtdDig,pValorUnitario,'$',
//    pDescontoPercentual,pDescontoValor,pQuantidade);
 Result := False;
  pCodigo := Copy(pCodigo, 2, Length(pCodigo) - 1);
  vrTemp := getQuantidadeComCasasDecimais(pQuantidade);
  cQtde := Format('%12.'+IntToStr(FqtdDigQtde)+'f',[vrTemp]);

  vrTemp := getValorUnitarioComCasasDecimais(pValorUnitario);
  cValor := Format('%15.3f',[vrTemp]);

  cQtde := StringReplace(Trim(cQtde),',','',[rfReplaceAll]);
  cValor := StringReplace(Trim(cValor),',','',[rfReplaceAll]);

  vrTemp := getValorTotalComCasasDecimais( pValorUnitario * pQuantidade);
  vFValorLiq := Format('%0.2f',[vrTemp]);
  vrTot := vrTemp;

  cDesconto := '000';
  cAcrescimo := '000';
  if (pDescontoPercentual > 0) or (pDescontoValor > 0) then
  begin
    vrDesc := abs(vDadosIniF.StrToFloatFormat( ((vrTot * pDescontoPercentual) / 100) + pDescontoValor,2));
    cDesconto := Format('%0.2f',[vrDesc]);
    cDesconto := StringReplace(Trim(cDesconto),',','',[rfReplaceAll]);
    vFValorLiq := Format('%0.2f',[StrToFloat(vFValorLiq) - vrDesc]);
  end
  else if (pDescontoPercentual < 0)  or (pDescontoValor < 0) then
  begin
    if vDadosIniF.existeComando('2', false) then
    begin
      vrAcres := abs(vDadosIniF.StrToFloatFormat( ((vrTot * ((-1)*pDescontoPercentual)) / 100) + ((-1)*pDescontoValor),2));
      cAcrescimo := Format('%0.2f',[vrAcres]);
      cAcrescimo := StringReplace(Trim(cAcrescimo),',','',[rfReplaceAll]);
      vFValorLiq := Format('%0.2f',[vrAcres + StrToFloat(vFValorLiq)]);
      vrTot := vrTot + vrAcres;
    end;
  end;

  while True do
  begin
    iretorno := Daruma_FI_VendeItemDepartamento(pchar(pCodigo),
      pchar(pDescricao),
      pchar(pAliquota),
      pchar(cValor),
      pchar(cQtde),
      pchar(cDesconto),
      pchar(cAcrescimo),
      '01',
      '  ');
    result := Retorno_Impressora;
    if Result then
    begin
      vDadosIniF.acumulaGrandeTotal(vrTot);
      Break;
    end
    else
    begin
      Application.ProcessMessages;
      if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
        Break;
    end;
  end;
end;

function TImpdaruma.VerificaImpressoraLigada: boolean;
begin
  NumeroCupom;
  Result := (iRetorno = 1);
end;

function TImpdaruma.verificaPapel: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := Daruma_FI_NumeroSerie(cNumeroSerie);
  iRetorno := Daruma_FI_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      verificaPapel := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      verificaPapel := false;
    end;
  end
  else
    verificaPapel := true;
end;

function TImpdaruma.Verifica_Impressora: boolean;
begin
  Result := Retorno_Impressora;
end;

procedure TImpdaruma.ProgramaF;
var
  scomando: string;
  iresp: integer;
begin
  scomando := '';
  obFinalizador.getTodos;
  obFinalizador.first;
  while not obFinalizador.eof do
  begin
    if obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger <> 1 then
      //            obFinalizador.dataSet.FieldByName('descricao').AsString <> 'DINHEIRO' then
    begin
      if (vTipoImpressora = 'DARUMAMFD') then
        scomando := scomando +
          copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString),
          1, 15) + ';'
      else
        scomando := scomando +
          copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString),
          1, 16) + ';';
      Analisa_iRetorno;
      //       if iretorno <> 1 then
      //       begin
    end;
    obFinalizador.next;
  end;
  Daruma_FI_ProgramaFormasPagamento(pChar(scomando));
end;

procedure TImpdaruma.recuperacaoAutomaticaAliquotas;
var
  vAliq: TAliquota;
  I: Integer;
  sAliquotas, sIndices, temp, tempInd: string;
  cont, contIndices: integer;
begin
  inherited;

  sAliquotas := '';
  for cont := 1 to 79 do sAliquotas := sAliquotas + ' ';
  iRetorno := Daruma_FI_RetornoAliquotas(sAliquotas);
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    exit;
  end;
  sAliquotas := StringReplace(sAliquotas, ',', '', [rfReplaceAll, rfIgnoreCase]);

  vAliq := TAliquota.create;
  vAliq.apagaAliquotas;

  // Incluindo aliquotas de serviço
  sindices := '';
  for cont := 1 to 48 do sIndices := sIndices + ' ';
  iRetorno := Daruma_FI_VerificaIndiceAliquotasIss(sIndices);
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    exit;
  end;
  sIndices := StringReplace(sIndices, ',', '', [rfReplaceAll, rfIgnoreCase]);
  cont := 1;
  contIndices := 1;
  for I := 1 to 16 do
  begin
    tempInd := trim(copy(sIndices, contIndices, 2));
    if tempInd = '' then
      Break;
    try
      temp := copy(sAliquotas, (StrToInt(tempInd) * 4) - 3, 4);
      vAliq.incluiAliquota(vDadosIniF.StrZero(StrToInt(tempInd), 2), 'S', StrToFloat(copy(temp,
        1, 2) + ',' + copy(temp, 3, 2)), StrToInt(tempInd));
    except
    end;
    inc(contIndices, 2);
  end;
  //Fim incluindo aliquotas de servico

  cont := 1;
  for I := 1 to 16 do
  begin
    temp := trim(copy(sAliquotas, cont, 4));
    if temp = '' then
      Break;
    vAliq.incluiAliquota(vDadosIniF.StrZero(i, 2), 'N', StrToFloat(copy(temp, 1, 2) + ',' +
      copy(temp, 3, 2)), i);
    inc(cont, 4);
  end;
  //Fim incluindo aliquotas de icms

  vAliq.free;
  vAliq := nil;
end;

procedure TImpdaruma.regconfPorta(vport: string);
begin
  iRetorno := Daruma_Registry_Porta('COM' + vport);
  Analisa_iRetorno;
  iRetorno := Daruma_Registry_AlteraRegistry('Path', vDadosIniF.vEndConfigDll);
  Analisa_iRetorno;
end;

function TImpdaruma.MontaDescricao(vdesc, vunidade: string): string;
begin
  Result := copy(vdesc, 1, 24) + ' ' + copy(vunidade, 1, 3);
end;

procedure TImpdaruma.montaMaparesumo;
var
  resp: string;
  dataHoraUltDoc: string;
  registros: TStringList;
  Arq: TextFile;
  vl: Integer;
  vAliq: TAliquota;
  I: Integer;
begin
  inherited;
  resp := '';
  //  dataHoraUltDoc := dataHoraUltimoDocumento;
  //  vMapaResumo.dataRed := Copy(dataHoraUltDoc, 1, 10);
  //  vMapaResumo.horaRed := Copy(dataHoraUltDoc, 12, 8);
  iRetorno := Daruma_FI_MapaResumo();
  Analisa_iRetorno();
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    exit;
  end;
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK],
      0);
    exit;
  end;

  registros := TStringList.Create;

  vl := 1;
  while not eof(arq) do
  begin
    ReadLn(Arq, resp);
    if resp <> '' then
    begin
      if vl = 1 then // Contador Reducao ZZ
        vMapaResumo.nreducoes := trim(copy(resp, 25, 16));
      if vl = 2 then // COO Reducao
        vMapaResumo.coored := trim(copy(resp, 25, 16));
      if vl = 4 then // Venda Liquida
        vMapaResumo.vlTotLiq := trim(copy(resp, 25, 16));
      if vl = 5 then // Cancelamentos
        vMapaResumo.vlCancel := trim(copy(resp, 25, 16));
      if vl = 6 then // Acrescimos
        vMapaResumo.vlAcrescimo := trim(copy(resp, 25, 16));
      if vl = 7 then // Descontos
        vMapaResumo.vlDesconto := trim(copy(resp, 25, 16));
      if vl = 8 then // ISS
        vMapaResumo.vlISS := trim(copy(resp, 25, 16));
      if vl = 9 then // Isençao
        vMapaResumo.vlIsentos := trim(copy(resp, 25, 16));
      if vl = 10 then // Nao Incidencia
        vMapaResumo.vlNaoIncidencia := trim(copy(resp, 25, 16));
      if vl = 11 then // Substituicao tributaria
        vMapaResumo.vlSubst := trim(copy(resp, 25, 16));
      vl := vl + 1;
      if pos('Subs', resp) > 0 then
        while not eof(arq) do
        begin
          ReadLn(Arq, resp);
          if (resp <> '') and (copy(resp, 1, 4) <> '0000') then
            registros.Add(resp);
        end;
    end;
  end;
  CloseFile(Arq);

  registros.Add('Canc-T....' + vMapaResumo.vlCancel);
  registros.Add('DT........' + vMapaResumo.vlDesconto);
  registros.Add('F1........' + vMapaResumo.vlSubst);
  registros.Add('I1........' + vMapaResumo.vlIsentos);
  registros.Add('N1........' + vMapaResumo.vlNaoIncidencia);

  vMapaResumo.qtdeAliq := registros.Count;
  SetLength(vMapaResumo.valiqs, vMapaResumo.qtdeAliq);
  vAliq := TAliquota.create;
  vAliq.getTodos;

  for I := 0 to registros.Count - 1 - 5 do
  begin
    vMapaResumo.valiqs[i].aliq := Copy(registros[i], 1, 2) + ',' + Copy(registros[i], 3, 2);
    registros[I] := Copy(registros[i], 5, Length(registros[i]));
    registros[I] := StringReplace(registros[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ':', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ' ', '', [rfReplaceAll, rfIgnoreCase]);
    vMapaResumo.valiqs[i].valor := StrToCurr(registros[i]);

    vAliq.First;
    while not vAliq.dataSet.Eof do
    begin
      if (vAliq.dataSet.FieldByName('aliq').AsCurrency = StrToCurr(vMapaResumo.valiqs[i].aliq))
        and (vAliq.dataSet.FieldByName('servico').AsString <> 'S') then
      begin
        vMapaResumo.valiqs[i].aliq :=
          vDadosIniF.StrZero(vAliq.dataSet.FieldByName('indice').AsInteger, 2) +
          'T' + StringReplace(vMapaResumo.valiqs[i].aliq, ',', '', [rfReplaceAll, rfIgnoreCase]);
        vMapaResumo.valiqs[i].seq :=
          vDadosIniF.StrZero(vAliq.dataSet.FieldByName('sequencia').AsString, 2);
        Break;
      end;
      vAliq.Next;
    end;
  end;
  for I := (registros.Count - 5) to registros.Count - 1 do
  begin
    vMapaResumo.valiqs[i].aliq := Copy(registros[i], 1, 10); // + ',' + Copy(registros[i], 3, 2);
    vMapaResumo.valiqs[i].aliq := StringReplace(vMapaResumo.valiqs[i].aliq, '.', '', [rfReplaceAll,
      rfIgnoreCase]);
    registros[I] := Copy(registros[i], 11, Length(registros[i]));
    registros[I] := StringReplace(registros[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ':', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ' ', '', [rfReplaceAll, rfIgnoreCase]);
    vMapaResumo.valiqs[i].valor := StrToCurr(registros[i]);
    vMapaResumo.valiqs[i].seq := vDadosIniF.StrZero(i, 2);
  end;
end;

function TImpdaruma.numeroCCF: string;
var
  sCCF: string;
  cont: integer;
begin
  sCCF := '';
  for cont := 1 to 6 do
    sCCF := sCCF + ' ';
  iRetorno := Daruma_FIMFD_RetornaInformacao('30', sCCF);
  Result := sCCF;
end;

function TImpdaruma.numeroCDC: string;
var
  sCDC: string;
  cont: integer;
begin
  sCDC := '';
  for cont := 1 to 4 do sCDC := sCDC + ' ';
  iRetorno := Daruma_FIMFD_RetornaInformacao('45', sCDC);
  result := sCDC;
end;

function TImpdaruma.numeroCER: string;
var
  sCDC: string;
  cont: integer;
begin
  sCDC := '';
  for cont := 1 to 80 do sCDC := sCDC + ' ';
  iRetorno := Daruma_FIMFD_RetornaInformacao('44', sCDC);
  result := copy(sCDC,1,4);
end;

function TImpdaruma.numeroCOO: string;
var
  sCOO: string;
  cont: integer;
begin
  sCOO := '';
  for cont := 1 to 6 do
    sCOO := sCOO + ' ';
  iRetorno := Daruma_FIMFD_RetornaInformacao('26', sCOO);
  Result := sCOO;
end;

{ TImpElgin }

function TImpElgin.AberturaDoDia(ValorCompra,
  FormaPagamento: string): boolean;
var
  scomando: string;
  iresp: integer;
begin
  Result := true;
  //if (vTipoImpressora = 'BematechMFD') then
//  begin
  obFinalizador.getTodos;
  obFinalizador.first;
  while not obFinalizador.eof do
  begin
    if obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger <> 1 then
      //            obFinalizador.dataSet.FieldByName('descricao').AsString <> 'DINHEIRO' then
    begin
      if obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1 then
        iRetorno :=
          Elgin_ProgramaFormaPagamentoMFD(pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1,
          16)),
          '1')
      else
        iRetorno :=
          Elgin_ProgramaFormaPagamentoMFD(pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1,
          16)),
          '0');
      Analisa_iRetorno;
      //       if iretorno <> 1 then
      //       begin
    end;
    obFinalizador.next;
  end;
  iRetorno := Elgin_AberturaDoDia(pchar('0,00'), pchar(''));
  Retorno_Impressora;
end;

function TImpElgin.AbrecomprovanteNaoFiscal(FormaPagamento, Valor,
  NumeroCupom: string): boolean;
begin

end;

function TImpElgin.AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento,
  Valor_Pago, Numero_do_Cupom: string): Integer;
begin
  Elgin_AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento, Valor_Pago, Numero_do_Cupom);
end;

function TImpElgin.AbreCupom(CGC_CPF: string): boolean;
begin
  Result := true;
  if FvTipoImpressora = 'ELGIN' then
  begin
    iRetorno := Elgin_AbreCupom(Pchar(''));
    Analisa_iRetorno();
    Retorno_Impressora;
    if not retorno_impGer(1) then
      iretorno := 0;
    if (iretorno <> 1) then
      AbreCupom := false;
  end;
  if FvTipoImpressora = 'ELGINMFD' then
  begin
    iRetorno := Elgin_AbreCupomMFD('', '', '');
    //      Bematech_FI_AbreCupom( Pchar( '' ) );
    Analisa_iRetorno();
    if not Retorno_Impressora then
      Result:= False;
//    if not retorno_impGer(1) then
//      iretorno := 0;
//    if iretorno <> 1 then
//      AbreCupom := false;
  end;
  if Result then
    DataHoraImpressora('', '');
end;

function TImpElgin.AbreCupomMFD(CGC, Nome, Endereco: string): boolean;
begin

end;

function TImpElgin.AbrePortaS(vportaCom: string): boolean;
begin
  Result := true;
  iretorno := Elgin_AbrePortaSerial;
  Analisa_iRetorno;
  if iretorno <> 1 then
    AbrePortaS := false;
  if (not vRetExtHab) and (vTemMFD) and (result)  then
  begin
    Elgin_HabilitaDesabilitaRetornoEstendidoMFD('1');
    vRetExtHab := True;
  end;
end;

function TImpElgin.AbreRecebimentoNaoFiscalMFD(CGC, Nome,
  Endereco: string): boolean;
begin

end;

function TImpElgin.abrerelatorioGer: boolean;
begin
  iRetorno := Elgin_AbreRelatorioGerencial();
end;

procedure TImpElgin.acionaCortePapel(corteCompleto, gerencial: boolean);
begin
  inherited;
  if not vTemMFD then
    exit;
  if corteCompleto then
    iRetorno := Elgin_AcionaGuilhotinaMFD(1)
  else
    iRetorno := Elgin_AcionaGuilhotinaMFD(0);
end;

function TImpElgin.AcionaGaveta: boolean;
begin
  Result := true;
  iRetorno := Elgin_AcionaGaveta();
  Result := Retorno_Impressora;
end;

procedure TImpElgin.Analisa_iRetorno;
begin
  if iRetorno = 0 then
    Application.MessageBox('Erro de Comunicação !', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -2 then
    Application.MessageBox('Parâmetro Inválido !', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -4 then
    Application.MessageBox('Arquivo ELGIN.INI não encontrado. Verifique!', 'Atenção',
      MB_IconInformation + MB_OK)
  else if iRetorno = -5 then
    Application.MessageBox('Erro ao Abrir a Porta de Comunicação', 'Erro',
      MB_IconError + MB_OK)
  else if iRetorno = -50 then
    Application.MessageBox('Número de série Inválido !', 'Atenção',
      MB_IconInformation + MB_OK);
end;

function TImpElgin.arquivoMFDCotepe1704porCOO(cooInicial, cooFinal,
  endereco, codProp, pTipo: string): boolean;
begin
  if not vDadosIniF.existeComando('10', True) then
    Exit;
end;

function TImpElgin.arquivoMFDCotepe1704porData(dataInicial, dataFinal,
  endereco, codProp, pTipo: string): boolean;
var
  nomeArquivo, temp: string;
  dtIni: string;
  dtFim: string;
  lista: TStrings;
  I: Integer;
begin
  if not vDadosIniF.existeComando('9', True) then
    Exit;
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := RFD_ConvertedaMFDData(dtIni, dtFim);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  Result := iRetorno = 1;
  if Result then
  begin
    temp := ShortDateFormat;
    ShortDateFormat := 'dd/mm/yyyy';
    nomeArquivo := padraoCAT52[StrToInt(copy(dataFinal, 1, 2))];
    nomeArquivo := nomeArquivo + padraoCAT52[StrToInt(copy(dataFinal, 4, 2))];
    nomeArquivo := nomeArquivo + padraoCAT52[StrToInt(copy(dataFinal, 9, 2))];
    ShortDateFormat := temp;
    lista := TStringList.Create;
    GetDirList(ExtractFilePath(Application.ExeName) + 'RFDTEMP', nomeArquivo, lista);
    for I := 0 to lista.Count - 1 do
    begin
      temp := StringReplace(lista[i], '\\', '\', [rfReplaceAll]);
      if DateToStr(FileDateToDateTime(FileAge(temp))) = DateToStr(Date) then
        if copyArquivo(temp, endereco) then
        begin
          DeleteFile(pchar(temp));
          Break;
        end;
    end;
  end;
end;

function TImpElgin.cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string;
  codigo: integer): Integer;
var
  codigoTotalizador: Integer;
  I: Integer;
begin
  Elgin_NomeiaTotalizadorNaoSujeitoIcms(codigo, copy(nomeTotaliz, 1, 19));
  if iretorno = 1 then
  begin
    result := codigo;
    exit;
  end;
  for I := 1 to 30 do
  begin
    Elgin_NomeiaTotalizadorNaoSujeitoIcms(I, copy(nomeTotaliz, 1, 19));
    if iretorno = 1 then
    begin
      result := codigo;
      exit;
    end
    else
      Result := 0;
  end;
  Application.MessageBox(pchar('Totalizador não foi cadastrado.' + #13 +
    'Verifique! Função permitida apenas depois da redução Z e antes de registrar o movimento do dia'),
    'Atenção', MB_ICONWARNING + MB_OK);
end;

function TImpElgin.CancelaCupom(vsubtr: integer): boolean;
begin
  Result := true;
  iRetorno := Elgin_CancelaCupom();
  Analisa_iRetorno;
  Result := Retorno_Impressora;
//  if iretorno <> 1 then
//    result := false;
//  if not retorno_impGer(1) then
//    Result := false;
end;

function TImpElgin.CancelaItemGenerico(NumeroItem: real): boolean;
begin
  Result := true;
  iRetorno := Elgin_CancelaItemGenerico(pchar(vDadosIniF.StrZeroDec(NumeroItem, 3, 0)));
  Analisa_iRetorno();
  Result := Retorno_Impressora;

//  if iretorno <> 1 then
//  begin
//    CancelaItemGenerico := false;
//    exit;
//  end;
//  if not retorno_impGer(1) then
//  begin
//    CancelaItemGenerico := false;
//    exit;
//  end;
end;

function TImpElgin.CancelamentoNaoFiscal: boolean;
begin
  if vTemMFD then
  begin
    iRetorno := Elgin_CancelaRecebimentoNaoFiscalMFD('','','');
    Result := Retorno_Impressora;
  end
  else
  begin
    Application.ProcessMessages;
    Application.MessageBox('Função não suportada pela impressora','Atenção',0+64);
    Result := False;
  end;
end;

function TImpElgin.cMascara(vvalor, vqtd: real; idx: integer; vdesc1,
  vdesc2: real): string;
var
  ctotal: string;
  cdescit: string;
begin
  if (idx = 1) or (idx = 2) then
  begin
    vvalor := convNumero(vvalor);
    ctotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 3);
    if FvtipoArredond <> 'A' then
    begin
      if pos(',', ctotal) > 0 then
        ctotal := copy(ctotal, 1, pos(',', ctotal) - 1) + ',' + copy(ctotal, pos(',', ctotal) +
          1,
          2);
    end
    else
    begin
      cTotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 2);
      while pos('.', ctotal) > 0 do
        delete(ctotal, pos('.', ctotal), 1);
    end;
  end;
  if idx = 2 then
  begin
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
  end;
  if idx = 1 then
    cMascara := ctotal;
  if idx = 2 then
    cMascara := cdescit;
end;

function TImpElgin.cMascQuant(vqtd: real): string;
var
  cQuant: string;
begin
  cQuant := vDadosIniF.StrZeroDec(vqtd, 8, 3);
  delete(cQuant, 5, 1);
  cMascQuant := cQuant;
end;

function TImpElgin.convNumero(var Valor: real): real;
begin
  if vFqtdDig = 3 then
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 3))
  else
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 2));
end;

function TImpElgin.convNumero2(var Valor1: real): string;
begin
  if vFqtdDig = 3 then
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 3)
  else
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 2);
end;

constructor TImpElgin.Create;
begin
  fQtdeColunasImpressao := 48;
  vRetExtHab:= False;
  fPathRetornoTXT := vDadosIniF.GetIni('Fiscal', 'PathRetornoTXT', 'C:\Retorno.txt');
end;

function TImpElgin.cupomAberto: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := False;
  iRetorno := Elgin_FlagsFiscais(FlagsFiscais);
  if iRetorno <> 1 then
    exit;
  if (FlagsFiscais mod 2) <> 0 then
    Result := true;
end;

function TImpElgin.DataHoraImpressora(Data, Hora: string): boolean;
var
  iConta: integer;
begin
  Result := true;
  FDataECF := '';
  for iConta := 1 to 6 do
  begin
    FDataECF := FDataECF + ' ';
  end;
  FHoraEcf := '';
  for iConta := 1 to 6 do
  begin
    FHoraEcf := FHoraEcf + ' ';
  end;
  iRetorno := Elgin_DataHoraImpressora(FDataECF, FHoraEcf);
  if iretorno = 1 then
  begin
    Insert(':', FHoraEcf, 3);
    Insert(':', FHoraEcf, 6);
    Insert('/', FDataECF, 3);
    Insert('/', FDataECF, 6);
  end
  else
  begin
    //    Analisa_iRetorno;
    FHoraEcf := '00:00:00';
    FDataECF := '01/01/1980';
  end;
  //  FHoraEcf:='11:17:00';
  //  FDataECF:='26/12/2007';
end;

function TImpElgin.dataHoraUltimoDocumento: string;
var
  sDataHora: string;
  I: Integer;
begin
  for i := 1 to 12 do
    sDataHora := sDataHora + ' ';

  iRetorno := 0;
  while iRetorno <> 1 do
  begin
    iRetorno := Elgin_DataHoraUltimoDocumentoMFD(sDataHora);
    if iRetorno <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  insert('/', sDataHora, 3);
  insert('/20', sDataHora, 6);
  insert(' ', sDataHora, 11);
  insert(':', sDataHora, 14);
  insert(':', sDataHora, 17);

  Result := sDataHora;
end;

function TImpElgin.defAtribTef: string;
begin
  defAtribTef := obFinalizador.dataSet.FieldByName('descricao').AsString;
end;

function TImpElgin.DefCodFinalPrazo: string;
begin
  DefCodFinalPrazo := obFinalizador.dataSet.FieldByName('descricao').AsString;
end;

procedure TImpElgin.defineArredondamentoTruncamento;
var
  vTruncArred:string;
  I: Integer;
begin
  inherited;
  FqtdDigQtde := 3;
  vTruncArred := '';
  For I := 1 to 2 do vTruncArred := vTruncArred + ' ';
  iRetorno := Elgin_VerificaTruncamento(vTruncArred);
  if Retorno_Impressora then
  begin
    vTruncArred := Copy(Trim(vTruncArred),1,1);
    if vTruncArred = '1' then
      FvtipoArredond := 'T'
    else if vTruncArred = '0' then
      FvtipoArredond := 'A';
  end;
end;

function TImpElgin.defvalsangsup(vvalsangsup: real): string;
var
  cValorZero: string;
begin
  cValorZero := vDadosIniF.StrZeroDec(vvalsangsup, 15, 2);
  delete(cValorZero, 13, 1);
  result := cValorZero;
end;

function TImpElgin.Descricaoimp(vdesc: string): string;
var
  cDescricao: string;
  t: integer;
begin
  //    cDescricao := Ldescricao.Caption;
  cDescricao := vdesc;
  for t := 1 to 29 - length(cDescricao) do
  begin
    Insert(' ', cDescricao, 29);
  end;
  result := copy(cDescricao, 1, 29);
end;

function TImpElgin.DesprogramaHorarioVerao: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := true;
  FlagsFiscais:=0;
  iRetorno := Elgin_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then
  else
  begin
    Application.MessageBox('Horário de verão não esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  iRetorno := Elgin_ProgramaHorarioVerao();
  Analisa_iRetorno;
  Result := Retorno_Impressora;

//   if iRetorno = 0 then
//  result:= false;
end;

destructor TImpElgin.Destroy;
begin
  inherited;

end;

function TImpElgin.diaCaixaFechado: Boolean;
var
  Arq: TextFile;
  vl, i: integer;
  resp: string;
  DataReducao: string;
  horaReducao: string;
begin
  Result := true;
  if vFvDataRes = '' then
  begin
    iRetorno := Elgin_RelatorioTipo60Mestre();
    Analisa_iRetorno();
    Retorno_Impressora;
    if iretorno <> 1 then
    begin
      FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
      messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    AssignFile(Arq, fPathRetornoTXT);
    try
      reset(arq);
    except
      messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 3 then
        begin
          FvDataRes := trim(copy(resp, 28, 25));
          if FvDataRes = '00/00/00' then
            FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
          break;
        end;
      end;
      inc(vl);
    end;
    CloseFile(Arq);
  end;
  for i := 1 to 6 do DataReducao := DataReducao + ' ';
  for i := 1 to 6 do horaReducao := horaReducao + ' ';
  iRetorno := Elgin_DataHoraReducao(DataReducao, horaReducao);
  Analisa_iRetorno();
  Retorno_Impressora;
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  vMapaResumo.dataRed := trim(copy(DataReducao, 1, 2)) + '/' + trim(copy(DataReducao, 3, 2)) + '/' +
    trim(copy(DataReducao, 5, 2));
  vMapaResumo.horaRed := trim(copy(horaReducao, 1, 2)) + ':' + trim(copy(horaReducao, 3, 2)) + ':' +
    trim(copy(horaReducao, 5, 2));
  if vMapaResumo.dataRed = '00/00/00' then
    vMapaResumo.dataRed := DateToStr(Date - 1);
  vMapaResumo.dataRed := DateToStr(StrToDate(vMapaResumo.dataRed));
end;

function TImpElgin.EfetuaFormaPagamento(FormaPagamento: string;
  ValorFormaPagamento: real; vcodFinal: integer): boolean;
var
  cdinheiro: string;
  //  iCodErro: integer;
  //    strErroMsg: string;
begin
  Result := true;
  cdinheiro := vDadosIniF.StrZeroDec(ValorFormaPagamento, 15, 2);
  delete(cdinheiro, 13, 1);
  if (vTipoImpressora = 'ELGINMFD') then
    iRetorno := Elgin_EfetuaFormaPagamentoMFD(trim(FormaPagamento), cdinheiro, '1', pchar(''))
  else
    iRetorno := Elgin_EfetuaFormaPagamento(trim(FormaPagamento), cdinheiro);

  //  strErroMsg := StringOfChar(' ',100);
  //  Elgin_RetornoImpressora( iCodErro, strErroMsg );
//  Analisa_iRetorno();

  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
  begin
    EfetuaFormaPagamento := false;
    exit;
  end;
end;

function TImpElgin.EfetuaFormaPagamentoMFD(FormaPagamento,
  ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): boolean;
begin

end;

function TImpElgin.EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,
  ValorRecebimento: string): boolean;
begin

end;

procedure TImpElgin.EqualizarVelocidade;
begin
  inherited;

end;

function TImpElgin.espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD: string;
begin
  if not vDadosIniF.existeComando('8', True) then
    Exit;
  arquivoMFD := StringReplace(endereco, 'txt', 'MFD', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Elgin_DownloadMFD(arquivoMFD, '2', cooInicial, cooFinal, codProp);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  iRetorno := Elgin_FormatoDadosMFD(arquivoMFD, endereco, '0', '2', cooInicial, cooFinal,
    codProp);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  Result := iRetorno = 1;
end;

function TImpElgin.espelhoMFDporData(dataInicial, dataFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD: string;
  dtIni, dtFim: string;
begin
  if not vDadosIniF.existeComando('7', True) then
    Exit;
  arquivoMFD := StringReplace(endereco, 'txt', 'MFD', [rfReplaceAll, rfIgnoreCase]);
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(dtIni, 5, 2);
  Delete(dtFim, 5, 2);
  dtIni := StringReplace(dataInicial, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := Elgin_DownloadMFD(arquivoMFD, '1', dtIni, dtFim, codProp);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  iRetorno := Elgin_FormatoDadosMFD(arquivoMFD, endereco, '0', '1', dtIni, dtFim, codProp);
  if iretorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  Result := iRetorno = 1;
end;

function TImpElgin.estadoDeEmissaoDoCupomFiscal: integer;
var
  FlagsFiscais: Integer;
  vCupoAberto,vFormPagAtv: Boolean;
  cValorSubTotal, cValorPago: string;
  I: Integer;
begin
  vCupoAberto := False;
  vFormPagAtv := False;
  cValorSubTotal := '';
  cValorPago:= '';
  FlagsFiscais:=0;
  iRetorno := Elgin_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 32 then FlagsFiscais := FlagsFiscais - 32;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then FlagsFiscais := FlagsFiscais - 4;
  if FlagsFiscais >= 2 then
  begin
    FlagsFiscais := FlagsFiscais - 2;
    vFormPagAtv := True;
    for I := 1 to 14 do cValorSubTotal := cValorSubTotal + ' ';
    iRetorno := Elgin_SubTotal(cValorSubTotal);
    cValorSubTotal := Trim(cValorSubTotal);
    try
      StrToInt64(cValorSubTotal);
    except
      cValorSubTotal := '0';
    end;
  end;
  if FlagsFiscais >= 1 then
  begin
    vCupoAberto := True;
    for I := 1 to 14 do cValorPago := cValorPago + ' ';
    iRetorno := Elgin_ValorPagoUltimoCupom(cValorPago);
    cValorPago := Trim(cValorPago);
    try
      StrToInt64(cValorPago);
    except
      cValorPago := '0';
    end;
  end;
  if not vCupoAberto  then
    Result := 2
  else if vFormPagAtv then
  begin
    if StrToInt64(cValorPago) >= StrToInt64(cValorSubTotal) then
      Result := 2
    else
      Result := 1;
  end
  else
    Result := 0;
end;

function TImpElgin.existeReducaoZPendente:Integer;
var
  vZPendente: Integer;
  vStringDataReducao: string;
  vStringHoraReducao: string;
  Arq: TextFile;
  vl: Integer;
  resp: string;
  I: Integer;
  vStringDataMov: string;
begin
  iRetorno := Elgin_VerificaZPendente(vZPendente);

  Analisa_iRetorno();
  Retorno_Impressora;
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    Result := 2;
    exit;
  end;

  for I := 1 to 6 do vStringDataMov:= vStringDataMov +' ';
  iRetorno := Elgin_DataMovimento(vStringDataMov);
  if (Trim(vStringDataMov) <> '00/00/00') AND (pos('/',Trim(vStringDataMov)) = 0) then
    vStringDataMov := copy(vStringDataMov,1,2)+'/'+copy(vStringDataMov,3,2)+'/'+copy(vStringDataMov,5,2)
  else
    vStringDataMov := Trim(vStringDataMov);

  iRetorno := Elgin_RelatorioTipo60Mestre();
  Analisa_iRetorno();
  Retorno_Impressora;
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    Result := 2;
    exit;
  end;
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
    Result := 2;
    exit;
  end;
  vl := 1;
  while not eof(arq) do
  begin
    ReadLn(Arq, resp);
    if resp <> '' then
    begin
      if (vl = 3) and (vStringDataMov = '00/00/00') then
      begin
        vStringDataMov := copy(resp,41,10);
        try
          StrToDate(vStringDataMov);
          FvDataRes :=DateToStr(StrToDate(vStringDataMov));
        except
        end;
      end;
      if vl = 7 then // coo inicial
        Fvcooini := trim(copy(resp, 28, 25));
      if vl = 8 then // coo final
        Fvcoofin := trim(copy(resp, 28, 25));
      if vl = 9 then // contador de reduções
        FvContRed := trim(copy(resp, 28, 25));
      if vl = 10 then // reinicio de operações
        FvcontRein := trim(copy(resp, 28, 25));
      if vl = 11 then // Venda bruta
        FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      if vl = 12 then // Grante Total
        FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      vl := vl + 1;
    end;
  end;
  CloseFile(Arq);
  for i := 1 to 6 do vStringDataReducao := vStringDataReducao + ' ';
  for i := 1 to 6 do vStringHoraReducao := vStringHoraReducao + ' ';
  iRetorno := Elgin_DataHoraReducao(vStringDataReducao, vStringHoraReducao);
  Analisa_iRetorno();
  Retorno_Impressora;
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    Result := 2;
    exit;
  end;
  vMapaResumo.dataRed := trim(copy(vStringDataReducao, 1, 2)) + '/' + trim(copy(vStringDataReducao, 3, 2)) + '/' +
    trim(copy(vStringDataReducao, 5, 2));
  vMapaResumo.horaRed := trim(copy(vStringHoraReducao, 1, 2)) + ':' + trim(copy(vStringHoraReducao, 3, 2)) + ':' +
    trim(copy(vStringHoraReducao, 5, 2));
  if vMapaResumo.dataRed = '00/00/00' then     vMapaResumo.dataRed := DateToStr(Date - 1);
  vMapaResumo.dataRed := DateToStr(StrToDate(vMapaResumo.dataRed));
  if FvDataRes = '' then
    FvDataRes := vMapaResumo.dataRed;

  if vZPendente = 0  then
  begin
    Result := 0;
    montaMaparesumo;
  end
  else
  begin
    Result := 1;
    montaMaparesumo;
  end;
end;

function TImpElgin.FechaComprovanteNaoFiscalVinculado: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := Elgin_FechaComprovanteNaoFiscalVinculado;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroCDC;
      if temp = '' then
        exit;
      vDocNaoF.cdc := temp;
      vDocNaoF.tipoDoc := 'CC';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
    BlockInput(false);
  end;
end;

function TImpElgin.FechaComprovanteNaoFiscalVinculadoTEF: Integer;
begin
  Result := FechaComprovanteNaoFiscalVinculado;
end;

function TImpElgin.fechaCupom: boolean;
begin
  Result := true;
  Elgin_AbrePortaSerial;
  if Elgin_FechaRelatorioGerencial = 0 then
    Elgin_FechaComprovanteNaoFiscalVinculado;
  Elgin_FechaPortaSerial;
end;

function TImpElgin.FechamentoDoDia: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
    iRetorno := Elgin_FechamentoDoDia();
    Retorno_Impressora;
//    Analisa_iRetorno;
    if not retorno_impGer(1) then
      iRetorno := 0;
    if iretorno <> 1 then
    begin
      if Application.MessageBox(pchar('Erro ao emitir Redução Z.' + #13 +
        'Ler dados da última redução e colocar no arquivo de resumo?'), 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = mrNo then
      begin
        result := false;
        exit;
      end
    end;
    if vDadosIniF.vModImpBema = 'YANCO' then
      Sleep(2 * 1000);

    if vDadosIniF.getProgramacaoHorarioVerao = 'ATIVAR' then
      if Application.MessageBox(pchar('Foi feito um agendamento para Ativar'+
        ' o Horario de Verão. Confirma a Programação?'),'Confirmção',MB_YESNO+MB_ICONQUESTION) = IDYES then
            ProgramaHorarioVerao;

    iRetorno := Elgin_RelatorioTipo60Mestre();
    Analisa_iRetorno();
    Retorno_Impressora;
    if iretorno <> 1 then
    begin
      messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    AssignFile(Arq, fPathRetornoTXT);
    try
      reset(arq);
    except
      messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 3 then
        begin
          FvDataRes := trim(copy(resp, 28, 25));
          if FvDataRes = '00/00/00' then
            FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime - 1);
        end;
        if vl = 7 then // coo inicial
          Fvcooini := trim(copy(resp, 28, 25));
        if vl = 8 then // coo final
          Fvcoofin := trim(copy(resp, 28, 25));
        if vl = 9 then // contador de reduções
          FvContRed := trim(copy(resp, 28, 25));
        if vl = 10 then // reinicio de operações
          FvcontRein := trim(copy(resp, 28, 25));
        if vl = 11 then // Venda bruta
          FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
        if vl = 12 then // Grante Total
          FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
        vl := vl + 1;
      end;
    end;
    CloseFile(Arq);
    //        delefile(Arq);
    diaCaixaFechado;
    montaMaparesumo;
    FechaPortaSerial;
  end
  else
  begin
    Result := false;
    exit;
  end;
end;

function TImpElgin.FechaPortaSerial: boolean;
begin
  Result := true;
  Elgin_FechaPortaSerial;
end;

function TImpElgin.FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean;
begin

end;

function TImpElgin.FechaRelatorioGerencial: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := Elgin_FechaRelatorioGerencial;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroGRG;
      if temp = '' then
        exit;
      vDocNaoF.grg := temp;
      vDocNaoF.tipoDoc := 'RG';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
    BlockInput(false);
  end;
end;

function TImpElgin.FechaRelatorioGerencialTEF: Integer;
begin
  Result := FechaRelatorioGerencial;
end;

function TImpElgin.FecharOp: boolean;
begin
  Result := true;
  Elgin_AbreRelatorioGerencial;
  Elgin_RelatorioGerencial('               FECHAMENTO DO OPERADOR           ');
  Elgin_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Elgin_RelatorioGerencial('DATA.........: ' + datetostr(date));
  Elgin_RelatorioGerencial('CAIXA/PDV....: ' +
    vDadosIniF.StrZeroDec(obConfImp.dataSet.FieldByName('cod_terminal').AsInteger,
    4, 0));
  Elgin_RelatorioGerencial('NOME DO OP...: ' + trim(vDadosIniF.vNomeFuncionario));
  Elgin_RelatorioGerencial(' ');
  Elgin_RelatorioGerencial(' ');
  Elgin_RelatorioGerencial('        ---------------------------------       ');
  Elgin_RelatorioGerencial('                  ASS. DO OPERADOR              ');
  FechaRelatorioGerencial;
end;

function TImpElgin.gerarArquivosConferenciaSintegraSPED(vNomeArqSint,
  vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean;
begin
  Result := False;
  iRetorno :=
    Elgin_RelatorioSintegraMFD(1,
      pchar(vNomeArqSint),
      pchar(copy(vDtIni,4,2)),
      pchar(copy(vDtIni,7,4)),
      pchar(copy(vDadosIniF.vEmp.vRazaoSocial,1,35)),
      pchar(copy(vDadosIniF.vEmp.vEndereco,1,34)),
      pchar(copy(vDadosIniF.vEmp.vNumeroEnd,1,5)),
      pchar(''),
      pchar(copy(vDadosIniF.vEmp.vBairro,1,15)),
      pchar(copy(vDadosIniF.vEmp.vCidade,1,30)),
      pchar(copy(vDadosIniF.vEmp.vCEP,1,12)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,12)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,10)),
      pchar(copy(vDadosIniF.vEmp.vProprietario,1,18)));
  if iRetorno <> 1 then
    exit;

  Result := arquivoMFDCotepe1704porData(vDtIni, vDtFim, vNomeArqCOTEPE, vDadosIniF.vCodPropEcf, 'MFD');
end;

function TImpElgin.getGrandeTotal: string;
var
  vlrGT: string;
  iConta: integer;
  temp: string;
begin
  vlrGT := '';
  for iConta := 1 to 18 do begin vlrGT := vlrGT + ' '
  end;
  iRetorno := Elgin_GrandeTotal(vlrGT);
  while iRetorno <> 1 do
  begin
    if Application.MessageBox('GT. Impressora não responde. Tentar novamente',
      'Atenção',MB_YESNO+MB_ICONQUESTION) = IDNO then
      exit;
    iRetorno := Elgin_GrandeTotal(vlrGT);
  end;
  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
    temp := ''
  else
    temp := (copy(vlrGT, 1, 16) + ',' + copy(vlrGT, 17, 2));
  temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Result := temp;
end;

procedure TImpElgin.ImpDavsEmitidos;
var
  tipo: string;
  vTexto: string;
begin
  inherited;
  Elgin_RelatorioGerencial('                  DAV EMITIDOS                  ');
  Elgin_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Elgin_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));
  obVenda.First;
  while not obVenda.eof do
  begin
    if obVenda.dataSet.FieldByName('TIPO').AsString = 'REQ' then
      tipo := 'PEDIDO'
    else if TRIM(obVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
      tipo := 'ORDEM SERVIÇO'
    else if obVenda.dataSet.FieldByName('TIPO').AsString = 'ORC' then
      tipo := 'ORÇAMENTO';

    vTexto := TamDesc(13, tipo) + '    ' +
      obVenda.dataSet.FieldByName('DATA_FECH').AsString + '       ' +
      vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
        vDadosIniF.vQtdeDigDAV)+'                                   ';

    Elgin_RelatorioGerencial(copy(vTexto,1,48));

    vTexto := 'COO Vinc: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('ncupom').AsInteger, 6) +
              ' COO Imp: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('coo_impressao').AsInteger, 6) +
              ' Valor: ' + Format('%5.2F', [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]) +
              '                                   ';

    Elgin_RelatorioGerencial(copy(vTexto,1,48));

    Elgin_RelatorioGerencial(vDadosIniF.Replicate(' ', 48));

    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obvenda.Close;
end;

procedure TImpElgin.ImpDavsOSEmitidos;
begin
  inherited;
  Elgin_RelatorioGerencial('                DAV-OS EMITIDOS            ');
  Elgin_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Elgin_RelatorioGerencial(' ');
  Elgin_RelatorioGerencial(' ');
  obVenda.First;
  while not obVenda.eof do
  begin
    Elgin_RelatorioGerencial(vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
      vDadosIniF.vQtdeDigDAV) + '             ' + Format('%10.2F',
      [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]));
    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obvenda.Close;
end;

procedure TImpElgin.ImpIdentificacaoPAFECF;
begin
  inherited;
  RelatorioGerencial2('             IDENTIFICAÇÃO DO PAF-ECF         ');
  RelatorioGerencial2(vDadosIniF.Replicate('=', 48));
  RelatorioGerencial2(vDadosIniF.Replicate(' ', 48));
  obIdentF.abreIdentFiscal(False);
  obIdentF.First;
  RelatorioGerencial2(TamDescricao(48, 'Laudo Numero: ' +
    obIdentF.dataSet.FieldByName('n_laudo_fiscal').AsString) +
    TamDescricao(48, obIdentF.dataSet.FieldByName('nome_empdes').AsString) +
    TamDescricao(48, ' CNPJ: ' + obIdentF.dataSet.FieldByName('cnpj_empdes').AsString) +
    TamDescricao(48, ' Endereço: ' + obIdentF.dataSet.FieldByName('endereco_empdes').AsString) +
    TamDescricao(48, ' Bairro: ' + obIdentF.dataSet.FieldByName('bairro_empdes').AsString) +
    TamDescricao(48, ' Cidade: ' + obIdentF.dataSet.FieldByName('cidade_empdes').AsString +
    ' UF: ' + obIdentF.dataSet.FieldByName('uf_empdes').AsString) +
    TamDescricao(48, ' Telefone: ' + obIdentF.dataSet.FieldByName('fone_empdes').AsString) +
    TamDescricao(48, ' Contato: ' + obIdentF.dataSet.FieldByName('contato_empdes').AsString) +
    TamDescricao(48, obIdentF.dataSet.FieldByName('nome_paf').AsString) +
    TamDescricao(48, ' ' + obIdentF.dataSet.FieldByName('nome_comercial').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Versão: ' +
    obIdentF.dataSet.FieldByName('versao_paf').AsString) +
    TamDescricao(48, ' Principal Executavel: ' +
    obIdentF.dataSet.FieldByName('principal_exec').AsString) +
    TamDescricao(48, ' MD5: ' + vDadosIniF.vMD5Fiscal));
  RelatorioGerencial2(' Outros arquivos e MD5');
  while not obIdentF.dataSet.Eof do
  begin
    RelatorioGerencial2(
      TamDescricao(48, '  ' + obIdentF.dataSet.FieldByName('nome_arquivo').AsString) +
      TamDescricao(48, '  ' + obIdentF.dataSet.FieldByName('md5_arquivo').AsString));
    obIdentF.next;
  end;
  obTermImp.abreTerminalImpressoras;
  RelatorioGerencial2('ECF''s Autorizados');
  obTermImp.First;
  while not obTermImp.dataSet.Eof do
  begin
    RelatorioGerencial2(' ' +
      vDadosIniF.decodifica(obTermImp.dataSet.FieldByName('num_serie_ecf').AsString));
    obTermImp.next;
  end;
  FechaRelatorioGerencial;
end;

procedure TImpElgin.ImpMeiosDePagamento;
var
  vTipDoc: string;
  vValorCancelado: Currency;
begin
  inherited;
  iRetorno := Elgin_AbreRelatorioGerencial;
  Retorno_Impressora;
  Elgin_RelatorioGerencial('               MEIOS DE PAGAMENTO               ');
  Elgin_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Elgin_RelatorioGerencial(' ');
  Elgin_RelatorioGerencial(' ');
  obCupom.vMeiosPag.First;
  while not obCupom.vMeiosPag.dataSet.Eof do
  begin
    vtipDoc := '';
    vValorCancelado := obCupom.vMeiosPag.getValorCancelado(
      obCupom.vMeiosPag.dataSet.FieldByName('cod_finalizador').AsInteger,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime);
    if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString <> 'CUP' then
      vValorCancelado := 0;
    if vValorCancelado < obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat then
    begin
      if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'CUP' then
        vtipDoc := trim('Cupom Fiscal')
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'REC' then
        vtipDoc := 'Comprovante Nao Fiscal - ' +
          Trim(obCupom.vMeiosPag.dataSet.FieldByName('DESCRICAO').AsString)
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'SUP' then
        vtipDoc := TamDesc(48, 'Comprovante Não Fiscal - ') + 'Suprimento';

      Elgin_RelatorioGerencial(
        TamDescricao(24, trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) +
        ' - ' + obCupom.vMeiosPag.dataSet.FieldByName('tipo_final').AsString) +
        TamDescricao(12, trim(obCupom.vMeiosPag.dataSet.FieldByName('data').AsString)) +
        TamDescricao(12, format('%9.2f', [obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
        vValorCancelado]))
          +
        TamDescricao(48, vTipDoc) + TamDescricao(48, ' '));
    end;
    obCupom.vMeiosPag.next;
  end;
  FechaRelatorioGerencial;
  obCupom.vMeiosPag.close;
end;

procedure TImpElgin.ImpResumoVnd;
var
  vindbarra, vindprod: string;
begin
  inherited;
  Elgin_RelatorioGerencial('     RELATORIO DE QTDE DE PRODUTOS VENDIDOS ');
  Elgin_RelatorioGerencial(vDadosIniF.Replicate('=', 48));
  Elgin_RelatorioGerencial(' ');
  Elgin_RelatorioGerencial(' ');
  while not obCupom.vTotalVenda.dataSet.eof do
  begin
    obProd.selecionaProdutoGrupoCodigo(
      obCupom.vTotalVenda.dataSet.fieldbyname('GRUPO_PROD').AsInteger,
      obCupom.vTotalVenda.dataSet.fieldbyname('COD_PROD').AsString);
    Elgin_RelatorioGerencial(TamDescricao(48,TamDesc(29, obProd.dataSet.FieldByName('descr_prod').AsString) +
      '  '
      +
      format('%8.5f',
      [obCupom.vTotalVenda.dataSet.FieldByName('SOMA').AsFloat])));
    obCupom.vTotalVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obCupom.vTotalVenda.dataSet.close;
end;

function TImpElgin.imprimeDavNoEcf(dav: RVenda): boolean;
var
  temp: string;
  tamanhoLinha: integer;
  I: Integer;
begin
  tamanhoLinha := fQtdeColunasImpressao;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Documento Auxiliar de Venda'));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Doc Nº ' + vDadosIniF.StrZero(dav.nprevenda,
    vDadosIniF.vQtdeDigDAV) +
    '  Nº Doc Fiscal ___________'));
  temp := '';
  if dav.tipo_venda = 'REQ' then
    temp := 'Pedido de Venda Nº '
  else if TRIM(dav.tipo_venda) = 'OS' then
    temp := 'Ordem de Serviço Nº '
  else if dav.tipo_venda = 'ORC' then
    temp := 'Orçamento Nº ';
  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  //  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Cliente: ' +
    vDadosIniF.StrZero(dav.cod_cliente,
    6)
    + ' ' + dav.nome_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Endereço: ' + dav.endereco_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.bairro_cliente + ', ' + dav.cidade_cliente
    +
    '-'
    + dav.estado_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CPF/CNPJ: ' +
    vDadosIniF.StrZero(dav.cnpjcpf_cliente, 14) + '  Insc Est: ' + dav.insc_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Telefone: ' + dav.fone_cliente + '  Cond.Pag: '
    + dav.cond_pag));
  if Trim(dav.linhaAd1) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd1)));
  if Trim(dav.linhaAd2) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd2)));
  if Trim(dav.linhaAd3) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd3)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,
    'PRODUTO/SERVIÇO  QTDE     VL UNIT      VL TOTAL'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  for I := 0 to dav.qtde_Produtos + dav.qtde_Servicos - 1 do
  begin
    temp := IntToStr(i + 1) + ' ';
    if dav.item[i].tipo = 'P' then
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod) + ' ' + dav.item[i].cod_prod;
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end
    else
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod);
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end;
  end;
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Produtos..: ' +
      IntToStr(dav.qtde_Produtos)));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Serviços..: ' +
      IntToStr(dav.qtde_Servicos)));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Produtos....: ' + Format('%12.2f',
      [dav.valor_produtos])));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Serviços....: ' + Format('%12.2f',
      [dav.valor_servicos])));
  if dav.desconto > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Desconto..........: ' + Format('%12.2f',
      [dav.desconto])));
  if dav.acrescimo > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Acréscimo.........: ' + Format('%12.2f',
      [dav.acrescimo])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Líquido.....: ' + Format('%12.2f',
    [dav.valor_liquido])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,'Obs.: ' + dav.observacao));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  if dav.usar_Declaracao = 'S' then
  begin
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'Autorizo, nos termos do parágrafo 2º do artigo'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      '43 do codigo de defesa do consumidor o registro'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'do meu debito no servico de protecao ao credito,'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'e a respectiva correcao monetaria, ate a data'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'do seu efetivo pagamento, caso haja'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'inadimplencia de minhas obrigaçoes perante esta.'));

    RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  end;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, '______________________________'));
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Assinatura'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.empresa + '    ' + dav.fone_Empresa));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CNPJ: ' + dav.cgc_emp));
  result := FechaRelatorioGerencial = 1;
end;

function TImpElgin.Imprime_Prazo: boolean;
var
  ixx, i: integer;
  vcount, vfl, vret: integer;
  iInicio: Ttime;
  mes: array[1..12] of string;
  vdia, vmes, vano: word;
begin
  Result := true;
  reimprime :='1';
  mes[1] := 'JANEIRO';
  mes[2] := 'FEVEREIRO';
  mes[3] := 'MARÇO';
  mes[4] := 'ABRIL';
  mes[5] := 'MAIO';
  mes[6] := 'JUNHO';
  mes[7] := 'JULHO';
  mes[8] := 'AGOSTO';
  mes[9] := 'SETEMBRO';
  mes[10] := 'OUTUBRO';
  mes[11] := 'NOVEMBRO';
  mes[12] := 'DEZEMBRO';
  //
 // BlockInput(true);
  if not obEmpresa.Active then
    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
  //
  vimptef := 1;
  vret := 1;
  vcanctef := 0;
  if reimprime = '0' then
  begin
    if vacr = 1 then
      Elgin_AbreComprovanteNaoFiscalVinculado('Prazo', Fvvalpr, vDadosIniF.StrZeroDec(Fvnc, 6,
        0));
  end;
  for i := 1 to obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger do
    // QtdCpNF.value do
  begin
    obCupom.vFPg.First;
    vcount := 1;
    while not obCupom.vFPg.Eof do
    begin
      decodedate(obCupom.vFPg.dataSet.FieldByName('data_venc').AsDateTime, vano, vmes, vdia);
      vret := 1;
      if reimprime = '0' then
      begin
        if vcount > 1 then
        begin
          if Elgin_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado(vDadosIniF.vEmp.vRazaoSocial) = 0 then
            break;
          if
            Elgin_UsaComprovanteNaoFiscalVinculado(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring) = 0 then
            break;
          if
            Elgin_UsaComprovanteNaoFiscalVinculado(obEmpresa.dataSet.FieldByName('bairro_emp').AsString
            + ', ' + obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString) = 0 then
            break;
          if
            Elgin_UsaComprovanteNaoFiscalVinculado(obEmpresa.dataSet.FieldByName('telefone_emp').AsString + ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario) = 0 then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
        end;
        //
        if Elgin_UsaComprovanteNaoFiscalVinculado('Reconheco o valor da divida abaixo:') = 0
          then
          break;
        if Elgin_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if Elgin_UsaComprovanteNaoFiscalVinculado(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString) = 0 then
          break;
        if Elgin_UsaComprovanteNaoFiscalVinculado('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat])) = 0 then
          break;
        if Elgin_UsaComprovanteNaoFiscalVinculado('OPERADOR: ' + vDadosIniF.vNomeFuncionario) = 0
          then
          break;
        if Elgin_UsaComprovanteNaoFiscalVinculado(' ') = 0 then
          break;
        if Elgin_UsaComprovanteNaoFiscalVinculado(' ') = 0 then
          break;
        if Elgin_UsaComprovanteNaoFiscalVinculado(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if Elgin_UsaComprovanteNaoFiscalVinculado('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString) = 0 then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString)) = 0 then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString) = 0 then
            break;
        end
        else
        begin
          if Elgin_UsaComprovanteNaoFiscalVinculado('CLIENTE: ' + obCupom.getNomeAvulso) = 0
            then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado('ENDERECO: ' + obCupom.getEnderecoAvulso +
            ' '
            +
            obCupom.getBairroAvulso) = 0 then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' + obCupom.getCpfCnpjAvulso) = 0
            then
            break;
        end;
        if
          Elgin_UsaComprovanteNaoFiscalVinculado(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString)) = 0 then
          break;
      end
      else
      begin
        if vcount > 1 then
        begin
          if Elgin_RelatorioGerencial(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
          if Elgin_RelatorioGerencial(vDadosIniF.vEmp.vRazaoSocial) = 0 then
            break;
          if Elgin_RelatorioGerencial(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring) = 0
            then
            break;
          if Elgin_RelatorioGerencial(obEmpresa.dataSet.FieldByName('bairro_emp').AsString + ', '
            +
            obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString) = 0 then
            break;
          if Elgin_RelatorioGerencial(obEmpresa.dataSet.FieldByName('telefone_emp').AsString +
            ' '
            +
            'OPERADOR: ' + vDadosIniF.vNomeFuncionario) = 0 then
            break;
          if Elgin_RelatorioGerencial(vDadosIniF.Replicate('=', 48)) = 0 then
            break;
        end;
        if Elgin_RelatorioGerencial('Reconheco o valor da divida abaixo:') = 0 then
          break;
        if Elgin_RelatorioGerencial(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if Elgin_RelatorioGerencial(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString
          +
          '] VENC.: ' + obCupom.vFPg.dataSet.FieldByName('data_venc').AsString) = 0 then
          break;
        if Elgin_RelatorioGerencial('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat])) = 0 then
          break;
        if Elgin_RelatorioGerencial('OPERADOR: ' + vDadosIniF.vNomeFuncionario) = 0 then
          break;
        if Elgin_RelatorioGerencial(' ') = 0 then
          break;
        if Elgin_RelatorioGerencial(' ') = 0 then
          break;
        if Elgin_RelatorioGerencial(vDadosIniF.Replicate('-', 48)) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if Elgin_RelatorioGerencial('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString) = 0 then
            break;
          if Elgin_RelatorioGerencial('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString)) = 0 then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString) = 0 then
            break;
        end
        else
        begin
          if Elgin_UsaComprovanteNaoFiscalVinculado('CLIENTE: ' + obCupom.getNomeAvulso) = 0
            then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado('ENDERECO: ' + obCupom.getEnderecoAvulso +
            ' '
            +
            obCupom.getBairroAvulso) = 0 then
            break;
          if Elgin_UsaComprovanteNaoFiscalVinculado('CPF/CNPJ: ' + obCupom.getCpfCnpjAvulso) = 0
            then
            break;
        end;
        if
          Elgin_RelatorioGerencial(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString)) = 0 then
          break;
      end;
      if vret = 0 then
        break;
      retorno_ImpTEF;
      if vcanctef <> 0 then
        vret := 0;
      if vret = 0 then
        break;
      obCupom.vFPg.Next;
      inc(vcount);
      if obCupom.vFPg.Eof then
      begin
        {     if reimprime = '0' then
             begin
              vret:=Elgin_UsaComprovanteNaoFiscalVinculado(' ');
              vret:=Elgin_UsaComprovanteNaoFiscalVinculado(' ');
             end
             else
             begin
              vret:=Elgin_RelatorioGerencial(' ');
              vret:=Elgin_RelatorioGerencial(' ');
             end;
             if vret = 0 then
              break;}
      end
      else
      begin
        if reimprime = '0' then
        begin
          vret := Elgin_UsaComprovanteNaoFiscalVinculado(' ');
          vret := Elgin_UsaComprovanteNaoFiscalVinculado(' ');
          vret := Elgin_UsaComprovanteNaoFiscalVinculado(' ');
          vret := Elgin_UsaComprovanteNaoFiscalVinculado(' ');
        end
        else
        begin
          vret := Elgin_RelatorioGerencial(' ');
          vret := Elgin_RelatorioGerencial(' ');
          vret := Elgin_RelatorioGerencial(' ');
          vret := Elgin_RelatorioGerencial(' ');
        end;
      end;
    end;
    if vret = 0 then
      break
    else
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        vret := Elgin_RelatorioGerencial(' ');
        if vret = 0 then
          break;
        vret := Elgin_RelatorioGerencial(' ');
        if vret = 0 then
          break;
      end;
    end;
    if i <> 2 then
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        iInicio := time;
        if reimprime = '0' then
        begin
          vret := Elgin_UsaComprovanteNaoFiscalVinculado(' ');
          if vret = 0 then
            break;
          vret := Elgin_UsaComprovanteNaoFiscalVinculado(' ');
          if vret = 0 then
            break;
        end
        else
        begin
          vret := Elgin_RelatorioGerencial(' ');
          if vret = 0 then
            break;
          vret := Elgin_RelatorioGerencial(' ');
          if vret = 0 then
            break;
        end;
        //   IF obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
       //    begin
        repeat
        until ((time - iInicio) > strtotime('00:00:02'));
        //    end;
      end;
    end;
  end;
  if vret = 0 then
    Imprime_Prazo := false
  else
  begin
    if reimprime = '1' then
      FechaRelatorioGerencial
    else
      FechaComprovanteNaoFiscalVinculado;
    Imprime_Prazo := true;
  end;
  // BlockInput(false);
end;

function TImpElgin.ImpTirouZSoz(vdat1, Vdat2: Tdate): boolean;
begin
  if vdat1 = Vdat2 then
    Result := true
  else
    result := false;
end;

function TImpElgin.IniciaFechamentoCupom(AcrescimoDesconto,
  TipoAcrescimoDesconto: string; ValorAcrescimoDesconto: real): boolean;
var
  cDes_Acres: string;
begin
  Result := true;
  if (vTipoImpressora = 'ELGIN') then
  begin
    cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 15, 2);
    delete(cDes_Acres, 13, 1);
    iRetorno := Elgin_IniciaFechamentoCupom(acrescimoDesconto, '$', cDes_Acres);
    if not retorno_impGer(1) then
      iRetorno := 0;
    if iretorno <> 1 then
    begin
      cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 13, 2);
      delete(cDes_Acres, 11, 1);
      iRetorno := Elgin_IniciaFechamentoCupom(AcrescimoDesconto, '$', cDes_Acres);
      Analisa_iRetorno;
      Retorno_Impressora;
      if not retorno_impGer(1) then
        iRetorno := 0;
      if iretorno <> 1 then
      begin
        IniciaFechamentoCupom := false;
        exit;
      end;
    end;
    vdadosIniF.acumulaGrandeTotal(0);
  end;

  if (vTipoImpressora = 'ELGINMFD') then
  begin
    cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 15, 2);
    delete(cDes_Acres, 13, 1);

    {    cValor := DCAcres_Desc.Text;
        cTipoDesconto := '$';
        cValorDesc := cDes_Acres;
        cDescricao := '00000000000000';}
    iRetorno := Elgin_IniciaFechamentoCupom(AcrescimoDesconto, '$', cDes_Acres);
    Analisa_iRetorno;
    Retorno_Impressora;
    //       iRetorno := Bematech_FI_IniciaFechamentoCupomMFD( DCAcres_Desc.Text, cTipoDesconto, cValorDesc ,cDescricao);
    //       ( pchar(DCAcres_Desc.Text), pchar('$'), pchar(cDes_Acres),pchar('00000000000000'));
    if not retorno_impGer(1) then
      iRetorno := 0;

    if iretorno <> 1 then
    begin
      IniciaFechamentoCupom := false;
      exit;
    end;
    vdadosIniF.acumulaGrandeTotal(0);
  end;
end;

function TImpElgin.IniciaFechamentoCupomMFD(AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto: string): boolean;
begin

end;

function TImpElgin.LeituraMemoriaFiscalData(vdata1,
  vdata2, CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
  end;
  Result := true;
  iRetorno := Elgin_LeituraMemoriaFiscalData(pchar(vdata1), pchar(vdata2),
    pchar(CompletaSimplificada));
  retorno_impressora;
end;

function TImpElgin.LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): boolean;
begin

end;

function TImpElgin.LeituraMemoriaFiscalReducao(ReducaoInicial,
  ReducaoFinal, CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
  end;
  Result := true;
  iRetorno := Elgin_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal,
    pchar(CompletaSimplificada));
  Analisa_iRetorno;
  Retorno_Impressora;
end;

function TImpElgin.LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpElgin.LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada,
  endereco: string): boolean;
var
  vtp: string;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
  end;
  Result := true;
  iRetorno := Elgin_LeituraMemoriaFiscalSerialData(pchar(DataInicial), pchar(DataFinal),
    pchar(CompletaSimplificada));
  Analisa_iRetorno;
  Retorno_Impressora;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpElgin.LeituraMemoriaFiscalSerialDataMFD(DataInicial,
  DataFinal, FlagLeitura: string): boolean;
begin

end;

function TImpElgin.LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal,
  CompletaSimplificada, endereco: string): boolean;
var
  vtp: string;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
  end;
  Result := true;
  iRetorno := Elgin_LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal,
    pchar(CompletaSimplificada));
  Analisa_iRetorno;
  Retorno_Impressora;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpElgin.LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpElgin.LeituraX: boolean;
begin
  Result := true;
  iRetorno := Elgin_LeituraX();
  Analisa_iRetorno();
  Retorno_Impressora;
end;

function TImpElgin.LeTabelaResumo: boolean;
var
  Arq: TextFile;
  vdadredz: array[1..6] of string;
  vl: integer;
  resp: string;
begin
  Result := true;
  iRetorno := Elgin_RelatorioTipo60Mestre();
  Analisa_iRetorno();
  Retorno_Impressora;
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  vl := 1;
  while not eof(arq) do
  begin
    ReadLn(Arq, resp);
    if resp <> '' then
    begin
      if vl = 3 then
        FvDataRes := trim(copy(resp, 28, 25));
      if vl = 7 then // coo inicial
        Fvcooini := trim(copy(resp, 28, 25));
      if vl = 8 then // coo final
        Fvcoofin := trim(copy(resp, 28, 25));
      if vl = 9 then // contador de reduções
        FvContRed := trim(copy(resp, 28, 25));
      if vl = 10 then // reinicio de operações
        FvcontRein := trim(copy(resp, 28, 25));
      if vl = 11 then // Venda bruta
        FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      if vl = 12 then // Grante Total
        FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
      vl := vl + 1;
    end;
  end;
  CloseFile(Arq);
  // Lendo complemento para o resumo d
  diaCaixaFechado;
  montaMaparesumo;
  //Fim complemento resumo d
end;

function TImpElgin.NumeroCupom: string;
var
  cnumerocupom: string;
  iConta: integer;
begin
  for iConta := 1 to 6 do
    cNumeroCupom := cNumeroCupom + ' ';
  iRetorno := 0;
  while iRetorno <> 1 do
  begin
    iRetorno := Elgin_NumeroCupom(cNumeroCupom);
    if iRetorno <> 1 then
    begin
      //BlockInput(False);
      //if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
      //  'Atenção',
      //  MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  NumeroCupom := cNumeroCupom;
end;

function TImpElgin.numeroGNF: string;
var
  sGNF: string;
  cont: integer;
begin
  for cont := 1 to 6 do sGNF := sGNF + ' ';
  iRetorno := Elgin_NumeroOperacoesNaoFiscais(sGNF);
  result := sGNF;
end;

function TImpElgin.numeroGRG: string;
var
  sGRGF: string;
  cont: integer;
begin
  for cont := 1 to 6 do sGRGF := sGRGF + ' ';
  iRetorno := Elgin_ContadorRelatoriosGerenciaisMFD(sGRGF);
  result := sGRGF;
end;

function TImpElgin.NumeroSerie: string;
var
  retorno_var: string;
  iConta: integer;
begin
  Retorno_var := '';
  //  sleep(1000);
  for iConta := 1 to 20 do begin Retorno_var := Retorno_var + ' '
  end;
  // função que retorna o número de série da impressora
  iRetorno := Elgin_NumeroSerie(Retorno_var);

  // Procedure que analisa o retorno da função
  Analisa_iRetorno();
  Retorno_Impressora;
  //     FPrinter.AtualizaEprom;
  //     Retorno_var:=FPrinter.UltimaResp;
  if iRetorno > 0 then
    NumeroSerie := retorno_var
  else
  begin
    ShowMessage(retorno_var);
    NumeroSerie := '';
  end;
end;

function TImpElgin.NumeroSerieMFD: string;
begin

end;

function TImpElgin.ObtemRetornoECF(var strMensagemErro: String): Boolean;
var
  VRetorno, iCodErro: Integer;
  strErroMsg: String;
  bSucesso: Boolean;
begin
  strErroMsg := StringofChar(' ', 1024);
  VRetorno := _RetornoImpressora(iCodErro, strErroMsg);
  strMensagemErro := 'Erro nº: ' + intToStr(iCodErro) + ' - ' + strErroMsg;

  If (VRetorno = 1) Then
    bSucesso := True
  Else
    bSucesso := False;

  ObtemRetornoECF := bSucesso;
end;

function TImpElgin.obterCNPJUsuario: string;
var
  vCNPJ: string;
  i: integer;
begin
  vCNPJ := '';
  for i := 1 to 20 do vCNPJ := vCNPJ + ' ';
  if vTemMFD then
    iRetorno := Elgin_CNPJMFD(vCNPJ)
  else
    vCNPJ := '';
  result := trim(removeCaracteresCNPJ(vCNPJ));
end;

function TImpElgin.PrazoECF: boolean;
var
  vret: integer;
begin
  Result := true;
  Elgin_AbrePortaSerial;
  reimprime := '0';
  vacr := 1;
  while not Imprime_Prazo do
  begin
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if reimprime = '1' then
        FechaRelatorioGerencial
      else
        FechaComprovanteNaoFiscalVinculado;
      break;
    end
    else
    begin
      //tef      sTEFRetorno := '0';
      if reimprime = '1' then
      begin
        vret := FechaRelatorioGerencial;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaRelatorioGerencial
          else
          begin
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        //tef        if sTEFRetorno = '1' then
        break;
      end
      else
      begin
        vret := FechaComprovanteNaoFiscalVinculado;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaComprovanteNaoFiscalVinculado
          else
          begin
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        //tef        if sTEFRetorno = '1' then
        break;
        if vret <> 0 then
          reimprime := '1';
      end;
    end;
  end;
  Elgin_FechaPortaSerial;
end;

function TImpElgin.ProgramaFormaPagamentoMFD(FormaPagto,
  OperacaoTef: string): boolean;
begin

end;

function TImpElgin.ProgramaHorarioVerao: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := true;
  FlagsFiscais:=0;
  iRetorno := Elgin_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then
  begin
    Application.MessageBox('Horário de verão já esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  iRetorno := Elgin_ProgramaHorarioVerao();
  Analisa_iRetorno;
  Retorno_Impressora;
  retorno_impGer(1);

  if iRetorno = 0 then
  result:= false;
end;

function TImpElgin.RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Elgin_RecebimentoNaoFiscal(indicetotalizador, Valor, FormaPagamento);
  if iretorno <> 1 then
    result := False;
  Analisa_iRetorno;
  Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

procedure TImpElgin.recuperacaoAutomaticaAliquotas;
var
  vAliq: TAliquota;
  I: Integer;
  sAliquotas, sIndices, temp, tempInd: string;
  cont, contIndices: integer;
begin
  inherited;

  sAliquotas := '';
  for cont := 1 to 79 do sAliquotas := sAliquotas + ' ';
  iRetorno := Elgin_RetornoAliquotas(sAliquotas);
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    exit;
  end;
  sAliquotas := StringReplace(sAliquotas, ',', '', [rfReplaceAll, rfIgnoreCase]);

  vAliq := TAliquota.create;
  vAliq.apagaAliquotas;

  // Incluindo aliquotas de serviço
  sindices := '';
  for cont := 1 to 48 do sIndices := sIndices + ' ';
  iRetorno := Elgin_VerificaIndiceAliquotasIss(sIndices);
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora', mtinformation, [mbOK], 0);
    exit;
  end;
  sIndices := StringReplace(sIndices, ',', '', [rfReplaceAll, rfIgnoreCase]);
  cont := 1;
  contIndices := 1;
  for I := 1 to 16 do
  begin
    tempInd := trim(copy(sIndices, contIndices, 2));
    if tempInd = '' then
      Break;
    try
      temp := copy(sAliquotas, (StrToInt(tempInd) * 4) - 3, 4);
      vAliq.incluiAliquota(vDadosIniF.StrZero(StrToInt(tempInd), 2), 'S', StrToFloat(copy(temp,
        1, 2) + ',' + copy(temp, 3, 2)), StrToInt(tempInd));
    except
    end;
    inc(contIndices, 2);
  end;
  //Fim incluindo aliquotas de servico

  cont := 1;
  for I := 1 to 16 do
  begin
    temp := trim(copy(sAliquotas, cont, 4));
    if temp = '' then
      Break;
    vAliq.incluiAliquota(vDadosIniF.StrZero(i, 2), 'N', StrToFloat(copy(temp, 1, 2) + ',' +
      copy(temp, 3, 2)), i);
    inc(cont, 4);
  end;
  //Fim incluindo aliquotas de icms

  vAliq.free;
  vAliq := nil;
end;

procedure TImpElgin.regconfPorta(vport: string);
var
  inifile: Tinifile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Elgin.ini');
  IniFile.WriteString('Sistema', 'porta', 'COM' + vport);
  inifile.Free;
  IniFile := TIniFile.Create(vDadosIniF.vEndConfigDll + 'Elgin.ini');
  IniFile.WriteString('Sistema', 'porta', 'COM' + vport);
  inifile.Free;
end;

function TImpElgin.RelatorioGerencial(Texto: string): Integer;
begin
  Result := Elgin_RelatorioGerencial(Texto);
end;

function TImpElgin.RelatorioGerencial2(Texto: string): Integer;
begin
  Result := 0;
  while Result = 0 do
  begin
    Result := Elgin_RelatorioGerencial(Texto);
    if Result <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        Break;
    end
    else Break;
  end;
end;

function TImpElgin.RelatorioTipo60Mestre: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
    iRetorno := Elgin_RelatorioTipo60Mestre();
    Analisa_iRetorno();
    Retorno_Impressora;
    if iretorno <> 1 then
    begin
      messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    AssignFile(Arq, fPathRetornoTXT);
    try
      reset(arq);
    except
      messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 7 then // coo inicial
          Fvcooini := trim(copy(resp, 28, 25));
        if vl = 8 then // coo final
          Fvcoofin := trim(copy(resp, 28, 25));
        if vl = 9 then // contador de reduções
          FvContRed := trim(copy(resp, 28, 25));
        if vl = 10 then // reinicio de operações
          FvcontRein := trim(copy(resp, 28, 25));
        if vl = 11 then // Venda bruta
          FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
        if vl = 12 then // Grante Total
          FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 25)), 2);
        vl := vl + 1;
      end;
    end;
    CloseFile(Arq);
    FechaPortaSerial;
  end
  else
  begin
    Result := false;
    exit;
  end
end;

function TImpElgin.retorno_Imp: boolean;
{var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' ' end;
  iRetorno := Elgin_NumeroSerie(cNumeroSerie);
  iRetorno := Elgin_VerificaEstadoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      vFVccancTef := 1;
      //vcanctef := 1;
      Retorno_Imp := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_Imp := false;
    end;
  end
  else
    Retorno_Imp := true;}
var
  iretorno, verr: Integer;
  vstrerr: string;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  verr := 0;
  for iConta := 1 to 100 do begin vstrerr := vstrerr + ' '
  end;
  //    vstrerr := StringOfChar(' ', 100);
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := Elgin_NumeroSerie(cNumeroSerie);
  iRetorno := Elgin_RetornoImpressora(verr, vstrerr);
  if verr <> 0 then
  begin
    if ((verr >= 11000) and (verr <= 11008)) or ((verr >= 8000) and (verr <= 8027)) then
    begin
      vFVccancTef := 1;
      Retorno_Imp := false;
    end
    else
      Retorno_Imp := false;
  end
  else
    Retorno_Imp := true;
end;

function TImpElgin.retorno_ImpGer(vflap: integer): boolean;

  //  end;
var
  iconta, iretorno, verr: Integer;
  vstrerr: string;
begin
  Result := true;
  verr := 0;
  for iConta := 1 to 100 do begin vstrerr := vstrerr + ' '
  end;
  //  vstrerr := StringOfChar(' ', 100);
  iRetorno := Elgin_RetornoImpressora(verr, vstrerr);
  if verr <> 0 then
  begin
    if ((verr >= 11000) and (verr <= 11008)) or ((verr >= 8000) and (verr <= 8027)) then
    begin
      vFVccancTef := 1;
      result := false;
    end
    else
      result := false;
    if vflap = 1 then
      MessageDlg(vstrerr, mterror, [mbOK], 0);
  end
  else
    result := true;
end;

function TImpElgin.Retorno_Impressora:boolean;
Var
  iACK, iST1, iST2, iST3, vRetorno: Integer;
  strMensagem, strCirc: string;
  vOK: Boolean;
begin
  vOK := True;
  strMensagem:= '';

  if(iRetorno = 1) then
    vOK:= True
  else begin
    strMensagem := 'Erro não identificado';
    case iRetorno of
      0: //strMensagem := 'Erro de comunicação';
        If (ObtemRetornoECF(strCirc)) Then
          strMensagem := strCirc
        Else
          strMensagem := 'Erro na comunicação.';
      -2: strMensagem := 'Erro Nº -2 - Parâmetro inválido';
      -4: strMensagem := 'Erro Nº -4 - Arquivo ini não encontrado ou parâmetro inválido para o nome da porta';
      -5: strMensagem := 'Erro Nº -5 - Erro ao abrir a porta de comunicação';
      -27: strMensagem := 'Erro Nº -27 - Status da impressora diferente de 6,0,0,0 (Ack, St1, St2 e St3)';
    end;
    vOK:= False;
  end;

  try
    iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
    vRetornoDll.retornoFuncao := '' ;
    vRetornoDll.estadoImpressora := '';
    vRetornoDll.estadoFuncao := '';

    if ( vTemMFD ) then
       vRetorno := Elgin_VerificaEstadoImpressoraMFD( iACK, iST1, iST2, iST3 )
    else
       vRetorno := Elgin_VerificaEstadoImpressora( iACK, iST1, iST2 );
    if vRetorno <> 1 then
    begin
      Result := False;
      exit;
    end;

    Result := True;

    If iACK = 21 Then
    BEGIN
      Application.MessageBox( 'A Impressora retornou NAK. O programa será abortado!', 'Erro', MB_IconError + MB_OK );
      Application.Terminate;
      Exit;
    End
    else if iACK = 0 then
      result := False
    else if ( vTemMFD ) and (vRetExtHab) and (iACK = 6) then
    begin
      vRetornoDll.retornoFuncao := 'ERRO';
      Result:= False;
      case iST3 of
        000:
          begin
            Result:= True;
            vRetornoDll.estadoFuncao := 'COMANDO OK';
            vRetornoDll.retornoFuncao := 'OK';
          end;
        1: vRetornoDll.estadoFuncao := 'COMANDO INVÁLIDO';
        2: vRetornoDll.estadoFuncao := 'ERRO DESCONHECIDO';
        3: vRetornoDll.estadoFuncao := 'NÚMERO DE PARÂMETRO INVÁLIDO';
        4: vRetornoDll.estadoFuncao := 'TIPO DE PARÂMETRO INVÁLIDO';
        5: vRetornoDll.estadoFuncao := 'TODAS ALÍQUOTAS JÁ PROGRAMADAS';
        6: vRetornoDll.estadoFuncao := 'TOTALIZADOR NÃO FISCAL JÁ PROGRAMADO';
        7: vRetornoDll.estadoFuncao := 'CUPOM FISCAL ABERTO';
        8: vRetornoDll.estadoFuncao := 'CUPOM FISCAL FECHADO';
        9: vRetornoDll.estadoFuncao := 'ECF OCUPADO';
        10: vRetornoDll.estadoFuncao := 'IMPRESSORA EM ERRO';
        11: vRetornoDll.estadoFuncao := 'IMPRESSORA SEM PAPEL';
        12: vRetornoDll.estadoFuncao := 'MPRESSORA COM CABEÇA LEVANTADA';
        13: vRetornoDll.estadoFuncao := 'MPRESSORA OFF LINE';
        14: vRetornoDll.estadoFuncao := 'ALÍQUOTA NÃO PROGRAMADA';
        15: vRetornoDll.estadoFuncao := 'TERMINADOR DE STRING FALTANDO';
        16: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO MAIOR QUE O TOTAL DO CUPOM FISCAL';
        17: vRetornoDll.estadoFuncao := 'CUPOM FISCAL SEM ITEM VENDIDO';
        18: vRetornoDll.estadoFuncao := 'COMANDO NÃO EFETIVADO';
        19: vRetornoDll.estadoFuncao := 'SEM ESPAÇO PARA NOVAS FORMAS DE PAGAMENTO';
        20: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO NÃO PROGRAMADA';
        21: vRetornoDll.estadoFuncao := 'ÍNDICE MAIOR QUE NÚMERO DE FORMA DE PAGAMENTO';
        22: vRetornoDll.estadoFuncao := 'FORMAS DE PAGAMENTO ENCERRADAS';
        23: vRetornoDll.estadoFuncao := 'CUPOM NÃO TOTALIZADO';
        24: vRetornoDll.estadoFuncao := 'COMANDO MAIOR QUE 7Fh (127d)';
        25: vRetornoDll.estadoFuncao := 'CUPOM FISCAL ABERTO E SEM ÍTEM';
        26: vRetornoDll.estadoFuncao := 'CANCELAMENTO NÃO IMEDIATAMENTE APÓS';
        27: vRetornoDll.estadoFuncao := 'CANCELAMENTO JÁ EFETUADO';
        28: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO OU JÁ EMITIDO';
        29: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO NÃO PERMITE TEF';
        30: vRetornoDll.estadoFuncao := 'SEM COMPROVANTE NÃO FISCAL ABERTO';
        31: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO JÁ ABERTO';
        32: vRetornoDll.estadoFuncao := 'REIMPRESSÃO NÃO PERMITIDA';
        33: vRetornoDll.estadoFuncao := 'COMPROVANTE NÃO FISCAL JÁ ABERTO';
        34: vRetornoDll.estadoFuncao := 'TOTALIZADOR NÃO FISCAL NÃO PROGRAMADO';
        35: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL SEM ÍTEM VENDIDO';
        36: vRetornoDll.estadoFuncao := 'ACRÉSCIMO E DESCONTO MAIOR QUE TOTAL CNF';
        37: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO NÃO INDICADO';
        38: vRetornoDll.estadoFuncao := 'MEIO DE PAGAMENTO DIFERENTE DO TOTAL DO RECEBIMENTO';
        39: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO MAIS DE UMA SANGRIA OU SUPRIMENTO';
        40: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL JÁ PROGRAMADO';
        41: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL NÃO PROGRAMADO';
        42: vRetornoDll.estadoFuncao := 'RELATÓRIO GERENCIAL NÃO PERMITIDO';
        43: vRetornoDll.estadoFuncao := 'MFD NÃO INICIALIZADA';
        44: vRetornoDll.estadoFuncao := 'MFD AUSENTE';
        45: vRetornoDll.estadoFuncao := 'MFD SEM NÚMERO DE SÉRIE';
        46: vRetornoDll.estadoFuncao := 'MFD JÁ INICIALIZADA';
        47: vRetornoDll.estadoFuncao := 'MFD LOTADA';
        48: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL ABERTO';
        49: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL DESCONECTADA';
        50: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM NÚMERO DE SÉRIE DA MFD';
        51: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL LOTADA';
        52: vRetornoDll.estadoFuncao := 'DATA INICIAL INVÁLIDA';
        53: vRetornoDll.estadoFuncao := 'DATA FINAL INVÁLIDA';
        54: vRetornoDll.estadoFuncao := 'CONTADOR DE REDUÇÃO Z INICIAL INVÁLIDO';
        55: vRetornoDll.estadoFuncao := 'CONTADOR DE REDUÇÃO Z FINAL INVÁLIDO';
        56: vRetornoDll.estadoFuncao := 'ERRO DE ALOCAÇÃO';
        57: vRetornoDll.estadoFuncao := 'DADOS DO RTC INCORRETOS';
        58: vRetornoDll.estadoFuncao := 'DATA ANTERIOR AO ÚLTIMO DOCUMENTO EMITIDO';
        59: vRetornoDll.estadoFuncao := 'FORA DE INTERVENÇÃO TÉCNICA';
        60: vRetornoDll.estadoFuncao := 'EM INTERVENÇÃO TÉCNICA';
        61: vRetornoDll.estadoFuncao := 'ERRO NA MEMÓRIA DE TRABALHO';
        62: vRetornoDll.estadoFuncao := 'JÁ HOUVE MOVIMENTO NO DIA';
        63: vRetornoDll.estadoFuncao := 'BLOQUEIO POR RZ';
        64: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO ABERTA';
        65: vRetornoDll.estadoFuncao := 'AGUARDANDO PRIMEIRO PROPRIETÁRIO';
        66: vRetornoDll.estadoFuncao := 'AGUARDANDO RZ';
        67: vRetornoDll.estadoFuncao := 'ECF OU LOJA IGUAL A ZERO';
        68: vRetornoDll.estadoFuncao := 'CUPOM ADICIONAL NÃO PERMITIDO';
        69: vRetornoDll.estadoFuncao := 'DESCONTO MAIOR QUE TOTAL VENDIDO EM ICMS';
        70: vRetornoDll.estadoFuncao := 'RECEBIMENTO NÃO FISCAL NULO NÃO PERMITIDO';
        71: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO MAIOR QUE TOTAL NÃO FISCAL';
        72: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL LOTADA PARA NOVO CARTUCHO';
        73: vRetornoDll.estadoFuncao := 'ERRO DE GRAVAÇÃO NA MF';
        74: vRetornoDll.estadoFuncao := 'ERRO DE GRAVAÇÃO NA MFD';
        75: vRetornoDll.estadoFuncao := 'DADOS DO RTC ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
        76: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR LEITURAS DA MFD';
        77: vRetornoDll.estadoFuncao := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR VERSAO DO SB';
        78: vRetornoDll.estadoFuncao := 'DESCRIÇÃO IGUAL A DEFAULT NÃO PERMITIDO';
        79: vRetornoDll.estadoFuncao := 'EXTRAPOLADO NÚMERO DE REPETIÇÕES PERMITIDAS';
        80: vRetornoDll.estadoFuncao := 'SEGUNDA VIA DO COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO';
        81: vRetornoDll.estadoFuncao := 'PARCELAMENTO FORA DA SEQUÊNCIA';
        82: vRetornoDll.estadoFuncao := 'COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
        83: vRetornoDll.estadoFuncao := 'TEXTO COM SEQUÊNCIA DE ESC INVÁLIDA';
        84: vRetornoDll.estadoFuncao := 'TEXTO COM SEQUÊNCIA DE ESC INCOMPLETA';
        85: vRetornoDll.estadoFuncao := 'VENDA COM VALOR NULO';
        86: vRetornoDll.estadoFuncao := 'ESTORNO DE VALOR NULO';
        87: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO DIFERENTE DO TOTAL DA SANGRIA';
        88: vRetornoDll.estadoFuncao := 'REDUÇÃO NÃO PERMITIDA EM INTERVENÇÃO TÉCNICA';
        89: vRetornoDll.estadoFuncao := 'AGUARDANDO RZ PARA ENTRADA EM INTERVENÇÃO TÉCNICA';
        90: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO COM VALOR NULO NÃO PERMITIDO';
        91: vRetornoDll.estadoFuncao := 'ACRÉSCIMO E DESCONTO MAIOR QUE VALOR DO ÍTEM';
        92: vRetornoDll.estadoFuncao := 'AUTENTICAÇÃO NÃO PERMITIDA';
        93: vRetornoDll.estadoFuncao := 'TIMEOUT NA VALIDAÇÃO';
        94: vRetornoDll.estadoFuncao := 'COMANDO NÃO EXECUTADO EM IMPRESSORA BILHETE DE PASSAGEM';
        95: vRetornoDll.estadoFuncao := 'COMANDO NÃO EXECUTADO EM IMPRESSORA DE CUPOM FISCAL';
        96: vRetornoDll.estadoFuncao := 'CUPOM NÃO FISCAL FECHADO';
        97: vRetornoDll.estadoFuncao := 'PARÂMETRO NÃO ASCII EM CAMPO ASCII';
        98: vRetornoDll.estadoFuncao := 'PARÂMETRO NÃO ASCII NUMÉRICO EM CAMPO ASCII NUMÉRICO';
        99: vRetornoDll.estadoFuncao := 'TIPO DE TRANSPORTE INVÁLIDO';
        100: vRetornoDll.estadoFuncao := 'DATA E HORA INVÁLIDA';
        101: vRetornoDll.estadoFuncao := 'SEM RELATÓRIO GERENCIAL OU COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
        102: vRetornoDll.estadoFuncao := 'NÚMERO DO TOTALIZADOR NÃO FISCAL INVÁLIDO';
        103: vRetornoDll.estadoFuncao := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
        104: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO EM SANGRIA OU SUPRIMENTO NÃO PERMITIDO';
        105: vRetornoDll.estadoFuncao := 'NÚMERO DO RELATÓRIO GERENCIAL INVÁLIDO';
        106: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO ORIGEM NÃO PROGRAMADA';
        107: vRetornoDll.estadoFuncao := 'FORMA DE PAGAMENTO DESTINO NÃO PROGRAMADA';
        108: vRetornoDll.estadoFuncao := 'ESTORNO MAIOR QUE FORMA PAGAMENTO';
        109: vRetornoDll.estadoFuncao := 'CARACTER NUMÉRICO NA CODIFICAÇÃO GT NÃO PERMITIDO';
        110: vRetornoDll.estadoFuncao := 'ERRO NA INICIALIZAÇÃO DA MF';
        111: vRetornoDll.estadoFuncao := 'NOME DO TOTALIZADOR EM BRANCO NÃO PERMITIDO';
        112: vRetornoDll.estadoFuncao := 'DATA E HORA ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
        113: vRetornoDll.estadoFuncao := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
        114: vRetornoDll.estadoFuncao := 'ÍTEM ANTERIOR AOS TREZENTOS ÚLTIMOS';
        115: vRetornoDll.estadoFuncao := 'ÍTEM NÃO EXISTE OU JÁ CANCELADO';
        116: vRetornoDll.estadoFuncao := 'CÓDIGO COM ESPAÇOS NÃO PERMITIDO';
        117: vRetornoDll.estadoFuncao := 'DESCRICAO SEM CARACTER ALFABÉTICO NÃO PERMITIDO';
        118: vRetornoDll.estadoFuncao := 'ACRÉSCIMO MAIOR QUE VALOR DO ÍTEM';
        119: vRetornoDll.estadoFuncao := 'DESCONTO MAIOR QUE VALOR DO ÍTEM';
        120: vRetornoDll.estadoFuncao := 'DESCONTO EM ISS NÃO PERMITIDO';
        121: vRetornoDll.estadoFuncao := 'ACRÉSCIMO EM ÍTEM JÁ EFETUADO';
        122: vRetornoDll.estadoFuncao := 'DESCONTO EM ÍTEM JÁ EFETUADO';
        123: vRetornoDll.estadoFuncao := 'ERRO NA MEMÓRIA FISCAL CHAMAR CREDENCIADO';
        124: vRetornoDll.estadoFuncao := 'AGUARDANDO GRAVAÇÃO NA MEMÓRIA FISCAL';
        125: vRetornoDll.estadoFuncao := 'CARACTER REPETIDO NA CODIFICAÇÃO DO GT';
        126: vRetornoDll.estadoFuncao := 'VERSÃO JÁ GRAVADA NA MEMÓRIA FISCAL';
        127: vRetornoDll.estadoFuncao := 'ESTOURO DE CAPACIDADE NO CHEQUE';
        128: vRetornoDll.estadoFuncao := 'TIMEOUT NA LEITURA DO CHEQUE';
        129: vRetornoDll.estadoFuncao := 'MÊS INVÁLIDO';
        130: vRetornoDll.estadoFuncao := 'COORDENADA INVÁLIDA';
        131: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO';
        132: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO VALOR';
        133: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO EXTENSO';
        134: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO FAVORECIDO';
        135: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NA LOCALIDADE';
        136: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO OPCIONAL';
        137: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO DIA';
        138: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO MÊS';
        139: vRetornoDll.estadoFuncao := 'SOBREPOSIÇÃO DE TEXTO NO ANO';
        140: vRetornoDll.estadoFuncao := 'USANDO MFD DE OUTRO ECF';
        141: vRetornoDll.estadoFuncao := 'PRIMEIRO DADO DIFERENTE DE ESC OU 1C';
        142: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO ALTERAR SEM INTERVENÇÃO TÉCNICA';
        143: vRetornoDll.estadoFuncao := 'DADOS DA ÚLTIMA RZ CORROMPIDOS';
        144: vRetornoDll.estadoFuncao := 'COMANDO NÃO PERMITIDO NO MODO INICIALIZAÇÃO';
        145: vRetornoDll.estadoFuncao := 'AGUARDANDO ACERTO DE RELÓGIO';
        146: vRetornoDll.estadoFuncao := 'MFD JÁ INICIALIZADA PARA OUTRA MF';
        147: vRetornoDll.estadoFuncao := 'AGUARDANDO ACERTO DO RELÓGIO OU DESBLOQUEIO PELO TECLADO';
        148: vRetornoDll.estadoFuncao := 'VALOR FORMA DE PAGAMENTO MAIOR QUE MÁXIMO PERMITIDO';
        149: vRetornoDll.estadoFuncao := 'RAZÃO SOCIAL EM BRANCO';
        150: vRetornoDll.estadoFuncao := 'NOME DE FANTASIA EM BRANCO';
        151: vRetornoDll.estadoFuncao := 'ENDEREÇO EM BRANCO';
        152: vRetornoDll.estadoFuncao := 'ESTORNO DE CDC NÃO PERMITIDO';
        153: vRetornoDll.estadoFuncao := 'DADOS DO PROPRIETÁRIO IGUAIS AO ATUAL';
        154: vRetornoDll.estadoFuncao := 'ESTORNO DE FORMA DE PAGAMENTO NÃO PERMITIDO';
        155: vRetornoDll.estadoFuncao := 'DESCRIÇÃO FORMA DE PAGAMENTO IGUAL JÁ PROGRAMADA';
        156: vRetornoDll.estadoFuncao := 'ACERTO DE HORÁRIO DE VERÃO SÓ IMEDIATAMENTE APÓS RZ';
        157: vRetornoDll.estadoFuncao := 'IT NÃO PERMITIDA MF RESERVADA PARA RZ';
        158: vRetornoDll.estadoFuncao := 'SENHA CNPJ INVÁLIDA';
        159: vRetornoDll.estadoFuncao := 'TIMEOUT NA INICIALIZAÇÃO DA NOVA MF';
        160: vRetornoDll.estadoFuncao := 'NÃO ENCONTRADO DADOS NA MFD';
        161: vRetornoDll.estadoFuncao := 'SANGRIA OU SUPRIMENTO DEVEM SER ÚNICOS NO CNF';
        162: vRetornoDll.estadoFuncao := 'ÍNDICE DA FORMA DE PAGAMENTO NULO NÃO PERMITIDO';
        163: vRetornoDll.estadoFuncao := 'UF DESTINO INVÁLIDA';
        164: vRetornoDll.estadoFuncao := 'TIPO DE TRANSPORTE INCOMPATÍVEL COM UF DESTINO';
        165: vRetornoDll.estadoFuncao := 'DESCRIÇÃO DO PRIMEIRO ÍTEM DO BILHETE DE PASSAGEM DIFERENTE DE "TARIFA"';
        166: vRetornoDll.estadoFuncao := 'AGUARDANDO IMPRESSÃO DE CHEQUE OU AUTENTICAÇÃO';
        167: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO PROGRAMAÇAO CNPJ IE COM ESPAÇOS EM BRANCO';
        168: vRetornoDll.estadoFuncao := 'NÃO PERMITIDO PROGRAMAÇÃO UF COM ESPAÇOS EM BRANCO';
        169: vRetornoDll.estadoFuncao := 'NÚMERO DE IMPRESSÕES DA FITA DETALHE NESTA INTERVENÇÃO TÉCNICA ESGOTADO';
        170: vRetornoDll.estadoFuncao := 'CF JÁ SUBTOTALIZADO';
        171: vRetornoDll.estadoFuncao := 'CUPOM NÃO SUBTOTALIZADO';
        172: vRetornoDll.estadoFuncao := 'ACRÉSCIMO EM SUBTOTAL JÁ EFETUADO';
        173: vRetornoDll.estadoFuncao := 'DESCONTO EM SUBTOTAL JÁ EFETUADO';
        174: vRetornoDll.estadoFuncao := 'ACRÉSCIMO NULO NÃO PERMITIDO';
        175: vRetornoDll.estadoFuncao := 'DESCONTO NULO NÃO PERMITIDO';
        176: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM SUBTOTAL NÃO PERMITIDO';
        177: vRetornoDll.estadoFuncao := 'DATA INVÁLIDA';
        178: vRetornoDll.estadoFuncao := 'VALOR DO CHEQUE NULO NÃO PERMITIDO';
        179: vRetornoDll.estadoFuncao := 'VALOR DO CHEQUE INVÁLIDO';
        180: vRetornoDll.estadoFuncao := 'CHEQUE SEM LOCALIDADE NÃO PERMITIDO';
        181: vRetornoDll.estadoFuncao := 'CANCELAMENTO ACRÉSCIMO EM ÍTEM NÃO PERMITIDO';
        182: vRetornoDll.estadoFuncao := 'CANCELAMENTO DESCONTO EM ÍTEM NÃO PERMITIDO';
        183: vRetornoDll.estadoFuncao := 'NÚMERO MÁXIMO DE ÍTENS ATINGIDO';
        184: vRetornoDll.estadoFuncao := 'NÚMERO DE ÍTEM NULO NÃO PERMITIDO';
        185: vRetornoDll.estadoFuncao := 'MAIS QUE DUAS ALÍQUOTAS DIFERENTES NO BILHETE DE PASSAGEM NÃO PERMITIDO';
        186: vRetornoDll.estadoFuncao := 'ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
        187: vRetornoDll.estadoFuncao := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
        188: vRetornoDll.estadoFuncao := 'CLICHE JÁ IMPRESSO';
        189: vRetornoDll.estadoFuncao := 'TEXTO OPCIONAL DO CHEQUE EXCEDEU O MÁXIMO PERMITIDO';
        190: vRetornoDll.estadoFuncao := 'IMPRESSÃO AUTOMÁTICA NO VERSO NÃO PERMITIDO NESTE EQUIPAMENTO';
        191: vRetornoDll.estadoFuncao := 'TIMEOUT NA INSERÇÃO DO CHEQUE';
        192: vRetornoDll.estadoFuncao := 'OVERFLOW NA CAPACIDADE DE TEXTO DO COMPROVANTE DE CRÉDITO OU DÉBITO';
        193: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DE ESPAÇOS ENTRE CUPONS MENOR QUE O MÍNIMO PERMITIDO';
        194: vRetornoDll.estadoFuncao := 'EQUIPAMENTO NÃO POSSUI LEITOR DE CHEQUE';
        195: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DE ALÍQUOTA COM VALOR NULO NÃO PERMITIDO';
        196: vRetornoDll.estadoFuncao := 'PARÂMETRO BAUD RATE INVÁLIDO';
        197: vRetornoDll.estadoFuncao := 'CONFIGURAÇÃO PERMITIDA SOMENTE PELA PORTA DOS FISCO';
        198: vRetornoDll.estadoFuncao := 'VALOR TOTAL DO ITEM EXCEDE 11 DÍGITOS';
        199: vRetornoDll.estadoFuncao := 'PROGRAMAÇÃO DA MOEDA COM ESPAÇOS EM BRACO NÃO PERMITIDO';
        200: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS DEVEM SER PROGRAMADAS COM 2 OU 3';
        201: vRetornoDll.estadoFuncao := 'NÃO PERMITE CADASTRAR USUÁRIOS DIFERENTES NA MESMA MFD';
        202: vRetornoDll.estadoFuncao := 'IDENTIFICAÇÃO DO CONSUMIDOR NÃO PERMITIDA PARA SANGRIA OU SUPRIMENTO';
        203: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS EM QUANTIDADE MAIOR DO QUE A PERMITIDA';
        204: vRetornoDll.estadoFuncao := 'CASAS DECIMAIS DO UNITÁRIO MAIOR DO QUE O PERMITIDA';
        205: vRetornoDll.estadoFuncao := 'POSIÇÃO RESERVADA PARA ICMS';
        206: vRetornoDll.estadoFuncao := 'POSIÇÃO RESERVADA PARA ISS';
        207: vRetornoDll.estadoFuncao := 'TODAS AS ALÍQUOTAS COM A MESMA VINCULAÇÃO NÃO PERMITIDO';
        208: vRetornoDll.estadoFuncao := 'DATA DE EMBARQUE ANTERIOR A DATA DE EMISSÃO';
        209: vRetornoDll.estadoFuncao := 'ALIQUOTA_DE_ISS_NAO_PERMITIDO_SEM_INSCRICAO_MUNICIPAL';
        210: vRetornoDll.estadoFuncao := 'RETORNO_PACOTE_CLICHE_FORA_DA_SEQUENCIA';
        211: vRetornoDll.estadoFuncao := 'RETORNO_ESPACO_PARA_PARA_ARMAZENAMENTO_CLICHE_ESGOTADO';
        212: vRetornoDll.estadoFuncao := 'RETORNO_CLICHE_GRAFICO_NAO_DISPONIVEL_PARA_CONFIRMACAO';
        213: vRetornoDll.estadoFuncao := 'RETORNO_CRC_DO_CLICHE_GRAFICO_DIFERENTE_DO_INFORMADO';
        else vRetornoDll.estadoFuncao := 'ERRO NAO INFORMADO PELA IMPRESSORA';
      end;
      vRetornoDll.estadoFuncao := vDadosIniF.StrZero(iST3,3)+ '-'+ vRetornoDll.estadoFuncao ;
    end;

    If ( iACK = 6 ) then
    BEGIN
      if not ( vTemMFD ) then
      begin
        vRetornoDll.estadoFuncao := 'COMANDO OK';
        vRetornoDll.retornoFuncao := 'OK';
        if (iST1 <> 0) or (iST2 <> 0 ) then
        begin
          vRetornoDll.retornoFuncao := 'ERRO';
          vRetornoDll.estadoFuncao := '';
          Result:= False;
        end;
      end
      else if Trim(vRetornoDll.estadoFuncao) <> ''  then
          vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao+'. ';

      if (not vOK) then
      begin
        vRetornoDll.retornoFuncao := 'ERRO';
        vRetornoDll.estadoFuncao := strMensagem + ' ' + strMensagemErro;
      end;

      // Verifica ST1

      IF iST1 >= 128 Then BEGIN iST1 := iST1 - 128; vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Fim de Papel. '; END;
      IF iST1 >= 64  Then BEGIN iST1 := iST1 - 64;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Pouco Papel. '; END;
      IF iST1 >= 32  Then BEGIN iST1 := iST1 - 32;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Erro no Relógio. '; END;
      IF iST1 >= 16  Then BEGIN iST1 := iST1 - 16;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Impressora em Erro. '; END;
      IF iST1 >= 8   Then BEGIN iST1 := iST1 - 8;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CMD não iniciado com ESC. '; END;
      IF iST1 >= 4   Then BEGIN iST1 := iST1 - 4;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Comando inexistente. '; END;
      IF iST1 >= 2   Then BEGIN iST1 := iST1 - 2;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Cupom Aberto. '; END;
      IF iST1 >= 1   Then BEGIN iST1 := iST1 - 1;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Nº de Parâmetros Inválidos. '; END;

      // Verifica ST2
      IF iST2 >= 128 Then BEGIN iST2 := iST2 - 128; vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Tipo de Parâmetro Inválido. '; END;
      IF iST2 >= 64  Then BEGIN iST2 := iST2 - 64;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Memória Fiscal Lotada. '; END;
      IF iST2 >= 32  Then BEGIN iST2 := iST2 - 32;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CMOS não Volátil. '; END;
      IF iST2 >= 16  Then BEGIN iST2 := iST2 - 16;  vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Alíquota Não Programada. '; END;
      IF iST2 >= 8   Then BEGIN iST2 := iST2 - 8;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Alíquotas lotadas. '; END;
      IF iST2 >= 4   Then BEGIN iST2 := iST2 - 4;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Cancelamento não Permitido. '; END;
      IF iST2 >= 2   Then BEGIN iST2 := iST2 - 2;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'CGC/IE não Programados. '; END;
      IF iST2 >= 1   Then BEGIN iST2 := iST2 - 1;   vRetornoDll.estadoFuncao := vRetornoDll.estadoFuncao + 'Comando não Executado. '; END;
    End;
    Result := vRetornoDll.retornoFuncao = 'OK';
    vDadosIniF.abreFormRetornoImpressora;
  finally
    vRetornoDll.retornoFuncao := '';
  end;
end;

function TImpElgin.Retorno_impTEF: boolean;
{var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  // iRetorno := Bematech_FI_NumeroSerie( cNumeroSerie );
  iRetorno := Elgin_VerificaEstadoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      Retorno_ImpTEF := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_ImpTEf := false;
    end;
  end;}
var
  iconta, iretorno, verr: Integer;
  vstrerr: string;
begin
  Result := true;
  verr := 0;
  //    vstrerr := StringOfChar(' ', 100);
  for iConta := 1 to 100 do begin vstrerr := vstrerr + ' '
  end;
  iRetorno := Elgin_RetornoImpressora(verr, vstrerr);
  if verr <> 0 then
  begin
    if ((verr >= 11000) and (verr <= 11008)) or ((verr >= 8000) and (verr <= 8027)) then
    begin
      vFVccancTef := 1;
      Retorno_ImpTEF := false;
    end
    else
      Retorno_ImpTEF := false;
  end
  else
    Retorno_ImpTEF := true;
end;

function TImpElgin.RetornoImpressora(var ACK, ST1, ST2: Integer): boolean;
begin
    iRetorno:= Elgin_VerificaEstadoImpressora(ACK, ST1, ST2);
    Analisa_iRetorno;
    Result := Retorno_Impressora;
//    if iRetorno = 1 then
//      result:= true
//    else
//      result:= false;
end;

function TImpElgin.Sangria(Valor: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Elgin_Sangria(pchar(valor));
  if iretorno <> 1 then
    result := false;
  Analisa_iRetorno;
  Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpElgin.SubTotal: string;
var
  vlrultc: string;
  iConta: integer;
begin
  vlrultc := '';
  for iConta := 1 to 14 do begin vlrultc := vlrultc + ' '
  end;
  iRetorno := Elgin_SubTotal(vlrultc);

  if not retorno_impGer(1) then
    iRetorno := 0;
  if iretorno <> 1 then
    SubTotal := ''
  else
    SubTotal := (copy(vlrultc, 1, 12) + ',' + copy(vlrultc, 13, 2));
end;

function TImpElgin.Suprimento(Valor, FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Elgin_Suprimento(pchar(Valor), Pchar(FormaPagamento));
  if iretorno <> 1 then
    result := false;
  Analisa_iRetorno;
  Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpElgin.TerminaFechamentoCupom(linha1, linha2, linha3, linha4,
  linha5, linha6, linha7, linha8: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := Elgin_TerminaFechamentoCupom(linha1 + linha2 + linha3 + linha4 + linha5 + linha6 +
    linha7 + linha8);
  if not retorno_impGer(1) then
    iRetorno := 0;
  while iretorno <> 1 do
    //          Fprinter.FechaCupomFiscal('N') do
  begin
    if Application.MessageBox(pchar('Impressora Fiscal Não Responde, Tentar Novamente'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      TerminaFechamentoCupom := false;
      exit;
      break;
    end
    else
      iRetorno := Elgin_TerminaFechamentoCupom(linha1 + linha2 + linha3 + linha4 + linha5 +
        linha6
        +
        linha7 + linha8);
  end;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.tipoDoc := 'RV';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpElgin.UsaComprovanteNaoFiscalVinculado(
  Texto: string): Integer;
begin
  result := Elgin_UsaComprovanteNaoFiscalVinculado(texto);
end;

function TImpElgin.ValorPagoCupomAtual: string;
var
  cValorPago: string;
  I: Integer;
begin
  for I := 1 to 14 do cValorPago := cValorPago + ' ';
  iRetorno := Elgin_ValorPagoUltimoCupom(cValorPago);
  cValorPago := Trim(cValorPago);
  try
    cValorPago := IntToStr(StrToInt64(cValorPago));
  except
    cValorPago := '0';
  end;
  if cValorPago = '0' then
    Result := '0'
  else
    Result := Format('%0.2f',[StrToInt64(cValorPago) / 100]);
end;

function TImpElgin.vendadeItensBema(ccodigo, cDescricao, cAliquota,
  cTipoQtde, cQtde: string; iCasasDecimais: integer; cValor, cTipoDesconto,
  cValorDesc: string): boolean;
var
  iretorno: integer;
begin
  //
  Result := true;
  iretorno := Elgin_VendeItem(pchar(cCodigo),
    pchar(cDescricao),
    pchar(cAliquota),
    pchar(cTipoQtde),
    pchar(cQtde),
    iCasasDecimais,
    pchar(cValor),
    pchar(cTipoDesconto),
    pchar(cValorDesc));
  if iretorno <> 1 then
    Result := false
  else
  begin
    if not retorno_impGer(1) then
      result := false
    else
      result := true;
  end;
end;

function TImpElgin.VendeItem(Codigo, Descricao, Aliquota, TipoQuantidade,
  Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
  TipoDesconto: string; Desconto1, Desconto2, nquant: real): boolean;
var
  vflgn: integer;
  vvp: string;
  vrAcumGT: Currency;
begin
  Result := true;
  if vFqtdDig = 3 then
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 3);
    delete(Fvcpreco, 6, 1);
  end
  else
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 2);
    delete(Fvcpreco, 7, 1);
  end;
  vFvcpreco := convNumero2(valorunitario);
  valorunitario := convNumero(ValorUnitario);
  if vtipoArredond <> 'A' then
  begin
    if pos(',', vFvcpreco) > 0 then
    begin
      if vFqtdDig = 3 then
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 3)
      else
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 2);
    end;
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 3);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end
  else
  begin
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 2);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    while pos('.', FvcTotal) > 0 do
      delete(FvcTotal, pos('.', FvcTotal), 1);
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end;
  if vFqtdDig = 3 then
    delete(Fvcpreco, 6, 1)
  else
    delete(Fvcpreco, 7, 1);
  if pos(',', vFvcTotal) > 0 then
    vFvcTotal := copy(vFvcTotal, 1, pos(',', vFvcTotal) - 1) + ',' + copy(vFvcTotal, pos(',',
      vFvcTotal) + 1, 2);
  //         nTotal:=nTotal+strtofloat(vFvcTotal);
  if (Desconto1 > 0) or (Desconto2 > 0) then

    vFValorLiq := floattostr((strtofloat(vFvcTotal) - strtofloat(vFcdescit)))
      //          floattostr((strtofloat(vFvcTotal)-(Strtofloat(vFvcTotal)*(vdescitem/100))))
  else
    vFValorLiq := vFvcTotal;
  vFvcTotal := vDadosIniF.StrZeroDec(strtofloat(vFvcTotal), 13, 2);
  delete(FvcTotal, 11, 1);
  //         eu:=currtostr((nPreco*nQuant));
  //         delete(vFvcTotal,8,1);
  //      showmessage(cbarra+cdesc20+vsittributaria+
  //       'F'+Cquant+inttostr(vqtdig)+vFvcpreco+'%'+'0000');
  if (Desconto1 > 0) or (Desconto2 > 0) then
  begin
    vFcdescit := vDadosIniF.StrZeroDec(desconto2 + ((desconto1 * Valorunitario) / 100), 9, 2);
    //vFcdescit := vDadosIniF.StrZeroDec(desconto1 + ((desconto2 * 100) / Valorunitario), 5, 2);
    //delete(Fcdescit, 3, 1);
  end
  else
  begin
    Fcdescit := '00000000';
  end;

  {    cCodigo := cbarra;
      cDescricao := cdesc20;
      cAliquota := vSitTributaria;
      cTipoQtde := 'F';
      cQtde := cQuant;
      iCasasDecimais := vqtdig;
      cValor := vFvcpreco;
      cTipoDesconto := '%';
      cValorDesc := cdescit;}

  vflgn := 0;
  while not vendadeItensBema(Codigo, Descricao, Aliquota, 'F', quantidade, vFqtdDig,
    vFvcpreco, '$', vFcdescit) do
    //       FPrinter.VendeItem3Dig(cbarra+'\'+cdesc20+'\'+vSitTributaria+'\'+cQuant+'\'+vFvcpreco+'\'+cdescit+'\UN\'+vFvcTotal) do
  begin
    if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      vflgn := 1;
      break;
    end;
    //              messagedlg('Problemas no Envio de Inf. Para Impressora',mtinformation,[mbOK],0);
  end;
  if vflgn = 1 then
  begin
    VendeItem := false;
    exit;
  end;
  vdadosIniF.acumulaGrandeTotal(vrAcumGT);
  if (Desconto1 < 0) or (Desconto2 < 0) then
    // o Valor negativo do desconto significa que é acrescimo
    if vDadosIniF.existeComando('2', false) then
    begin
      vFcdescit := trim(Format('%12.2f', [((-1) * desconto2) + ((((-1) * desconto1) *
          Valorunitario)
          / 100)]));
      vFValorLiq := FloatToStr(StrToFloat(vFValorLiq) + StrToFloat(vFcdescit));
      vrAcumGT := StrToCurr(trim(vFcdescit));
      //vFcdescit := vDadosIniF.StrZeroDec(((-1) * desconto2) + ((((-1) * desconto1) * Valorunitario) / 100), 15, 2);
      //delete(Fcdescit, 12, 1);
      iretorno := Elgin_AcrescimoDescontoItemMFD(vDadosIniF.getNItem,
        'A', '$', vFcdescit);
      if iRetorno = 1 then
        vdadosIniF.acumulaGrandeTotal(vrAcumGT);
      Analisa_iRetorno;
      Retorno_Impressora;
    end;
end;

function TImpElgin.VendeItemSimples(pCodigo, pDescricao, pAliquota: string;
  pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean;
var
  cQtde,cValor,cDesconto,cAcrescimo:string;
  vrTemp,vrDesc,vrAcres,vrTot:Real;
  vQtde, cUn:string;
begin
//  vQtde := cMascQuant(pQuantidade);
//  Result := VendeItem(pCodigo,pDescricao,pAliquota,'F',vQtde,FqtdDig,pValorUnitario,'$',
//    pDescontoPercentual,pDescontoValor,pQuantidade);
  Result := False;
  vrTemp := getQuantidadeComCasasDecimais(pQuantidade);
  cQtde := Format('%02.'+IntToStr(FqtdDigQtde)+'f',[vrTemp]);

  vrTemp := getValorUnitarioComCasasDecimais(pValorUnitario);
  cValor := Format('%0.3f',[vrTemp]);

//  cQtde := StringReplace(Trim(cQtde),',','',[rfReplaceAll]);
//  cValor := StringReplace(Trim(cValor),',','',[rfReplaceAll]);

  vrTemp := getValorTotalComCasasDecimais( pValorUnitario * pQuantidade);
  vFValorLiq := Format('%0.2f',[vrTemp]);
  vrTot := vrTemp;

  cDesconto := '0';
  cAcrescimo := '0';
  if (pDescontoPercentual > 0) or (pDescontoValor > 0) then
  begin
    vrDesc := vDadosIniF.StrToFloatFormat( ((vrTot * pDescontoPercentual) / 100) + pDescontoValor,2);
    cDesconto := Format('%0.2f',[vrDesc]);
//    cDesconto := StringReplace(Trim(cDesconto),',','',[rfReplaceAll]);
    vFValorLiq := Format('%0.2f',[StrToFloat(vFValorLiq) - vrDesc]);
  end
  else if (pDescontoPercentual < 0)  or (pDescontoValor < 0) then
  begin
    if vDadosIniF.existeComando('2', false) then
    begin
      vrAcres := vDadosIniF.StrToFloatFormat( ((vrTot * ((-1)*pDescontoPercentual)) / 100) + ((-1)*pDescontoValor),2);
      cAcrescimo := Format('%0.2f',[vrAcres]);
//      cAcrescimo := StringReplace(Trim(cAcrescimo),',','',[rfReplaceAll]);
      vFValorLiq := Format('%0.2f',[vrAcres + StrToFloat(vFValorLiq)]);
      vrTot := vrTot + vrAcres;
    end;
  end;
  cUn := '.';

  while True do
  begin
    iretorno := Elgin_VendeItemDepartamento(pchar(pCodigo),
      pchar(pDescricao),
      pchar(pAliquota),
      pchar(cValor),
      pchar(cQtde),
      pchar(cAcrescimo),
      pchar(cDesconto),
      '01',
      '  ');
    result := Retorno_Impressora;
    if Result then
    begin
      vDadosIniF.acumulaGrandeTotal(vrTot);
      Break;
    end
    else
    begin
      Application.ProcessMessages;
      if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
        Break;
    end;
  end;
end;

function TImpElgin.VerificaImpressoraLigada: boolean;
begin
  NumeroCupom;
  Result := (iRetorno = 1);
end;

function TImpElgin.verificaPapel: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := Elgin_NumeroSerie(cNumeroSerie);
  iRetorno := Elgin_VerificaEstadoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      verificaPapel := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      verificaPapel := false;
    end;
  end
  else
    verificaPapel := true;
end;

function TImpElgin.Verifica_Impressora: boolean;
begin
  Result := Retorno_Impressora;
end;

function TImpElgin._RetornoImpressora(var iCodErro: integer;
  var strErroMsg: string): Integer;
var
  VRetorno: Integer;
begin
  strErroMsg := StringOfChar(' ',2048);
  VRetorno := Elgin_RetornoImpressora(iCodErro, strErroMsg);
  result := VRetorno;
end;

function TImpElgin.MontaDescricao(vdesc, vunidade: string): string;
begin
  Result := copy(vdesc, 1, 24) + ' ' + copy(vunidade, 1, 3);
end;

procedure TImpElgin.montaMaparesumo;
var
  resp: string;
  dataHoraUltDoc: string;
  registros: TStringList;
  vAliq: TAliquota;
  vl: Integer;
  Arq: TextFile;
  I, vMaior: Integer;
begin
  inherited;
  resp := '';
  //  dataHoraUltDoc := dataHoraUltimoDocumento;
  //  vMapaResumo.dataRed := Copy(dataHoraUltDoc, 1, 10);
  //  vMapaResumo.horaRed := Copy(dataHoraUltDoc, 12, 8);
  iRetorno := Elgin_MapaResumo();
  Analisa_iRetorno();
  Retorno_Impressora;
  if iretorno <> 1 then
  begin
    messagedlg('erro ao receber dados da impressora para resumo', mtinformation, [mbOK], 0);
    exit;
  end;
  AssignFile(Arq, fPathRetornoTXT);
  try
    reset(arq);
  except
    messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
    exit;
  end;

  registros := TStringList.Create;

  vl := 1;
  while not eof(arq) do
  begin
    ReadLn(Arq, resp);
    if resp <> '' then
    begin
      if vl = 1 then // Contador Reducao ZZ
        vMapaResumo.nreducoes := trim(copy(resp, 34, 16));
      if vl = 2 then // COO Reducao
        vMapaResumo.coored := trim(copy(resp, 34, 16));
      if vl = 4 then // Venda Liquida
        vMapaResumo.vlTotLiq := trim(copy(resp, 34, 16));
      if vl = 5 then // Cancelamentos
        vMapaResumo.vlCancel := trim(copy(resp, 34, 16));
      if vl = 6 then // Acrescimos
        vMapaResumo.vlAcrescimo := trim(copy(resp, 34, 16));
      if vl = 7 then // Descontos
        vMapaResumo.vlDesconto := trim(copy(resp, 34, 16));
      if vl = 8 then // ISS
        vMapaResumo.vlISS := trim(copy(resp, 34, 16));
      if vl = 9 then // Isençao
        vMapaResumo.vlIsentos := trim(copy(resp, 34, 16));
      if vl = 10 then // Nao Incidencia
        vMapaResumo.vlNaoIncidencia := trim(copy(resp, 34, 16));
      if vl = 11 then // Substituicao tributaria
        vMapaResumo.vlSubst := trim(copy(resp, 34, 16));
      vl := vl + 1;
      if pos('Subs', resp) > 0 then
        while not eof(arq) do
        begin
          ReadLn(Arq, resp);
          if (resp <> '') and (copy(resp, 1, 4) <> '0000') then
            registros.Add(resp);
        end;
    end;
  end;
  CloseFile(Arq);

  registros.Add('Canc-T....' + vMapaResumo.vlCancel);
  registros.Add('DT........' + vMapaResumo.vlDesconto);
  registros.Add('F1........' + vMapaResumo.vlSubst);
  registros.Add('I1........' + vMapaResumo.vlIsentos);
  registros.Add('N1........' + vMapaResumo.vlNaoIncidencia);

  vMapaResumo.qtdeAliq := registros.Count;
  SetLength(vMapaResumo.valiqs, vMapaResumo.qtdeAliq);
  vAliq := TAliquota.create;
  vAliq.getTodos;
  vMaior := 0;

  for I := 0 to registros.Count - 1 - 5 do
  begin
    vMapaResumo.valiqs[i].aliq := Copy(registros[i], 1, 2) + ',' + Copy(registros[i], 3, 2);
    registros[I] := Copy(registros[i], 5, Length(registros[i]));
    registros[I] := StringReplace(registros[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ':', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ' ', '', [rfReplaceAll, rfIgnoreCase]);
    vMapaResumo.valiqs[i].valor := StrToCurr(registros[i]);

    vAliq.First;
    while not vAliq.dataSet.Eof do
    begin
      if (vAliq.dataSet.FieldByName('aliq').AsCurrency = StrToCurr(vMapaResumo.valiqs[i].aliq))
        and (vAliq.dataSet.FieldByName('servico').AsString <> 'S') then
      begin
        vMapaResumo.valiqs[i].aliq :=
          vDadosIniF.StrZero(vAliq.dataSet.FieldByName('indice').AsInteger, 2) +
          'T' + StringReplace(vMapaResumo.valiqs[i].aliq, ',', '', [rfReplaceAll, rfIgnoreCase]);
        vMapaResumo.valiqs[i].seq :=
          vDadosIniF.StrZero(vAliq.dataSet.FieldByName('sequencia').AsString, 2);
        try
          if StrToInt(vMapaResumo.valiqs[i].seq) > vMaior then
            vMaior := StrToInt(vMapaResumo.valiqs[i].seq);
        except
          if (I + 1) > vMaior then
            vMaior := (I + 1);
        end;
        Break;
      end;
      vAliq.Next;
    end;
  end;
  for I := (registros.Count - 5) to registros.Count - 1 do
  begin
    Inc(vMaior);
    vMapaResumo.valiqs[i].aliq := Copy(registros[i], 1, 10); // + ',' + Copy(registros[i], 3, 2);
    vMapaResumo.valiqs[i].aliq := StringReplace(vMapaResumo.valiqs[i].aliq, '.', '', [rfReplaceAll,
      rfIgnoreCase]);
    registros[I] := Copy(registros[i], 11, Length(registros[i]));
    registros[I] := StringReplace(registros[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ':', '', [rfReplaceAll, rfIgnoreCase]);
    registros[I] := StringReplace(registros[i], ' ', '', [rfReplaceAll, rfIgnoreCase]);
    vMapaResumo.valiqs[i].valor := StrToCurr(registros[i]);
    vMapaResumo.valiqs[i].seq := vDadosIniF.StrZero(vMaior, 2);
  end;
end;

function TImpElgin.numeroCCF: string;
var
  sCCF: string;
  iConta: Integer;
begin
  sCCF := '';
  for iConta := 1 to 6 do sCCF := sCCF + ' ';
  iRetorno := Elgin_ContadorCupomFiscalMFD(sCCF);
  result := sCCF;
end;

function TImpElgin.numeroCDC: string;
var
  sCDC: string;
  cont: integer;
begin
  for cont := 1 to 4 do sCDC := sCDC + ' ';
  iRetorno := Elgin_ContadorComprovantesCreditoMFD(sCDC);
  result := sCDC;
end;

function TImpElgin.numeroCER: string;
var
  sCER: string;
  cont: integer;
begin
  for cont := 1 to 4 do sCER := sCER + ' ';
  iRetorno := Elgin_ContadorRelatoriosGerenciaisMFD(sCER);
  result := sCER;
end;

function TImpElgin.numeroCOO: string;
begin
  Result := NumeroCupom;
end;

{ TImpEpson }

function TImpEpson.AberturaDoDia(ValorCompra,
  FormaPagamento: string): boolean;
var
  scomando: string;
  iresp: integer;
begin
  Result := true;
  AbrePortaS('');
  obFinalizador.getTodos;
  obFinalizador.first;
  while not obFinalizador.eof do
  begin
    if obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger <> 1 then
      //            obFinalizador.dataSet.FieldByName('descricao').AsString <> 'DINHEIRO' then
    begin
      if obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1 then
        iRetorno := EPSON_Config_Forma_Pagamento(true,
          Pchar(obFinalizador.dataSet.FieldByName('cod_finalizador').asstring),
          pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1, 15)))
      else
        iRetorno := EPSON_Config_Forma_Pagamento(false,
          Pchar(obFinalizador.dataSet.FieldByName('cod_finalizador').asstring),
          pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1, 15)));
      Analisa_iRetorno;
      //       if iretorno <> 1 then
      //       begin
    end;
    obFinalizador.next;
  end;
  iRetorno := EPSON_RelatorioFiscal_Abrir_Dia();
  Analisa_iRetorno;
  Retorno_Impressora;
end;

function TImpEpson.AbrecomprovanteNaoFiscal(FormaPagamento, Valor,
  NumeroCupom: string): boolean;
begin

end;

function TImpEpson.AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento,
  Valor_Pago, Numero_do_Cupom: string): Integer;
begin
  Valor_Pago := Copy(Valor_Pago, 2, 13);
  try
    Forma_de_Pagamento := IntToStr(StrToInt(Trim(Forma_de_Pagamento)));
  except
  end;
  iRetorno := EPSON_NaoFiscal_Abrir_CCD(pchar(Forma_de_pagamento), Pchar(Valor_Pago), 2, '1');
end;

function TImpEpson.AbreCupom(CGC_CPF: string): boolean;
begin
  Result := true;
  iRetorno := EPSON_Fiscal_Abrir_Cupom('', '', '', '', 1);
  Analisa_iRetorno();
  if not Retorno_Impressora then
//  if not retorno_impGer(1) then
//    iretorno := 0;
//  if (iretorno <> 0) then
    AbreCupom := false;
  if Result then
    DataHoraImpressora('', '');
end;

function TImpEpson.AbreCupomMFD(CGC, Nome, Endereco: string): boolean;
begin

end;

function TImpEpson.AbrePortaS(vportaCom: string): boolean;
var
	iConta: Integer;
  Temp: string;
  ST2: string;
  ret: Integer;
begin
  if Fvporta > 0 then
  begin
      Result := true;
    iRetorno := EPSON_Serial_Obter_Estado_Com;
    if iRetorno = 0 then
    begin
      Result := True;
      Exit;
    end;
    iRetorno := EPSON_Serial_Abrir_Porta(38400, Fvporta);
    if iretorno <> 0 then
      AbrePortaS := false;
    Exit;
  end;

  Result := true;
//  iRetorno := EPSON_Serial_Obter_Estado_Com;
//  if iRetorno = 0 then
//  begin
//    Result := True;
//    Exit;
//  end;
  iRetorno := EPSON_Serial_Abrir_Porta(38400, Fvporta);

  for iConta := 1 to 20 do Temp := Temp + ' ';
  for iConta := 1 to 4 do ST2 := ST2 + ' ';

  ret := EPSON_Obter_Estado_Impressora(PChar(Temp));
  if ret <> 0 then
  begin
    Result := False;
    Exit;
  end;
  ST2 := Copy(Temp, 5, 4);

  case StrToInt('$' + ST2) of
      0: Result := True;
      1: Result := True;
    else Result := False;
  end;

//  if iretorno <> 0 then
//    AbrePortaS := false;
end;

function TImpEpson.AbreRecebimentoNaoFiscalMFD(CGC, Nome,
  Endereco: string): boolean;
begin

end;

function TImpEpson.abrerelatorioGer: boolean;
begin
  iRetorno := EPSON_NaoFiscal_Abrir_Relatorio_Gerencial('1');
end;

procedure TImpEpson.acionaCortePapel(corteCompleto, gerencial: boolean);
begin
  inherited;
  if not vTemMFD  then
  Exit;

end;

function TImpEpson.AcionaGaveta: boolean;
begin
  Result := true;
  iRetorno := EPSON_Impressora_Abrir_Gaveta();
  Analisa_iRetorno;
  Retorno_Impressora;
end;

procedure TImpEpson.Analisa_iRetorno;
var
  vmens, ST2, ST3, ST4, ST5, Temp: string;
var
  iST3, iST4, iST5, iConta, ret: Integer;
begin

  for iConta := 1 to 4 do
    ST2 := ST2 + ' ';

  for iConta := 1 to 20 do
    Temp := Temp + ' ';

  ret := EPSON_Obter_Estado_Impressora(PChar(Temp));

  if ret <> 0 then
    messagedlg('Comando não Executado', mtinformation, [mbOK], 0)
  else
  begin
    ST2 := Copy(Temp, 5, 4);
    //==============================================================================
    //Estado da Comunicação
    //==============================================================================
    if StrToInt('$' + ST2) <> 0 then
    begin
      case StrToInt('$' + ST2) of
        1: vmens := 'Porta já está aberta.';
        2: vmens := 'Porta usada por outra aplicação.';
        4: vmens := 'Número de porta inválido.';
        5: vmens := 'Velocidade inválida.';
        16: vmens := 'String não está vazia ou contém hora inválida.';
      else vmens := 'Erro interno da biblioteca.';
      end;
      MessageDlg(vmens, mtinformation, [mbOK], 0);
    end;
  end;
end;

function TImpEpson.arquivoMFDCotepe1704porCOO(cooInicial, cooFinal,
  endereco, codProp, pTipo: string): boolean;
var
  arquivoMFD: string;
begin
  if not vDadosIniF.existeComando('10', True) then
    Exit;
  arquivoMFD := StringReplace(endereco, '.txt', '', [rfReplaceAll, rfIgnoreCase]);
  AbrePortaS('');
  iRetorno := EPSON_Obter_Dados_MF_MFD(pchar(cooInicial), pchar(cooFinal), 1, 0, 1, 0,
    pchar(arquivoMFD));
  if iRetorno <> 0 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Result := iRetorno = 0;
  if copyArquivo(arquivoMFD + '_CTP.txt', endereco) then
    DeleteFile(pchar(arquivoMFD + '_CTP.txt'));
end;

function TImpEpson.arquivoMFDCotepe1704porData(dataInicial, dataFinal,
  endereco, codProp, pTipo: string): boolean;
var
  arquivoMFD: string;
  dtIni, dtFim: string;
begin
  if not vDadosIniF.existeComando('9', True) then
    Exit;
  arquivoMFD := StringReplace(endereco, '.txt', '', [rfReplaceAll, rfIgnoreCase]);
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  iRetorno := EPSON_Obter_Dados_MF_MFD(pchar(dtIni), pchar(dtFim), 0, 0, 1, 0,
    pchar(arquivoMFD));
  if iRetorno <> 0 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Result := iRetorno = 0;
  if copyArquivo(arquivoMFD + '_CTP.txt', endereco) then
    DeleteFile(pchar(arquivoMFD + '_CTP.txt'));
end;

function TImpEpson.cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string;
  codigo: integer): Integer;
begin
  iRetorno := EPSON_Config_Totalizador_NaoFiscal(pchar(nomeTotaliz), codigo);
  Analisa_iRetorno();
  Retorno_Impressora;
  if iretorno = 0 then
  begin
    Result := codigo;
    exit;
  end
  else
    Result := 0;
end;

function TImpEpson.CancelaCupom(vsubtr: integer): boolean;
begin
  Result := true;
  if not AbrePortaS('') then
    Exit;
  iRetorno := EPSON_Fiscal_Cancelar_Cupom();
  Analisa_iRetorno;
  if not Retorno_Impressora then
//  if iretorno <> 0 then
    result := false;
//  if not retorno_impGer(1) then
//    Result := false;
end;

function TImpEpson.CancelaItemGenerico(NumeroItem: real): boolean;
begin
  Result := true;
  iRetorno := EPSON_Fiscal_Cancelar_Item(pchar(vDadosIniF.StrZeroDec(NumeroItem, 3, 0)));
  Analisa_iRetorno();
  if not Retorno_Impressora then  
//  if iretorno <> 0 then
  begin
    CancelaItemGenerico := false;
    exit;
  end;
//  if not retorno_impGer(1) then
//  begin
//    CancelaItemGenerico := false;
//    exit;
//  end;
end;

function TImpEpson.CancelamentoNaoFiscal: boolean;
begin
  iRetorno := EPSON_NaoFiscal_Cancelar_Comprovante();
  Result := Retorno_Impressora;
end;

function TImpEpson.cMascara(vvalor, vqtd: real; idx: integer; vdesc1,
  vdesc2: real): string;
var
  ctotal: string;
  cdescit: string;
begin
  if (idx = 1) or (idx = 2) then
  begin
    vvalor := convNumero(vvalor);
    ctotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 3);
    if FvtipoArredond <> 'A' then
    begin
      if pos(',', ctotal) > 0 then
        ctotal := copy(ctotal, 1, pos(',', ctotal) - 1) + ',' + copy(ctotal, pos(',', ctotal) +
          1,
          2);
    end
    else
    begin
      cTotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 2);
      while pos('.', ctotal) > 0 do
        delete(ctotal, pos('.', ctotal), 1);
    end;
  end;
  if idx = 2 then
  begin
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
  end;
  if idx = 1 then
    cMascara := ctotal;
  if idx = 2 then
    cMascara := cdescit;
end;

function TImpEpson.cMascQuant(vqtd: real): string;
var
  cQuant: string;
begin
  cQuant := vDadosIniF.StrZeroDec(vqtd, 8, 3);
  delete(cQuant, 5, 1);
  cMascQuant := cQuant;
end;

function TImpEpson.convNumero(var Valor: real): real;
begin
  if vFqtdDig = 3 then
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 3))
  else
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 2));
end;

function TImpEpson.convNumero2(var Valor1: real): string;
begin
  if vFqtdDig = 3 then
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 3)
  else
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 2);
end;

constructor TImpEpson.Create;
begin
  fQtdeColunasImpressao := 48;
  fPathRetornoTXT := vDadosIniF.GetIni('Fiscal', 'PathRetornoTXT', 'C:\Retorno.txt');
end;

function TImpEpson.cupomAberto: boolean;
var
  FlagsFiscais: string;
  I: Integer;
begin
  Result := False;
  FlagsFiscais := '';
  for i := 1 to 57 do FlagsFiscais := FlagsFiscais + ' ';
  iRetorno := EPSON_Obter_Estado_Cupom(pchar(FlagsFiscais));
  if iRetorno <> 0 then
    exit;
  if copy(FlagsFiscais, 1, 2) = '01' then
    Result := true;
end;

function TImpEpson.DataHoraImpressora(Data, Hora: string): boolean;
var
  iConta: integer;
  szDados: string;
begin
  Result := true;
  for iConta := 1 to 15 do
    szDados := szDados + ' ';
  iRetorno := EPSON_Obter_Hora_Relogio(PChar(szDados));
  FDataECF := copy(szDados, 1, 8);
  FHoraEcf := copy(szDados, 9, 6);
  if iretorno = 0 then
  begin
    Insert(':', FHoraEcf, 3);
    Insert(':', FHoraEcf, 6);
    Insert('/', FDataECF, 3);
    Insert('/', FDataECF, 6);
  end
  else
  begin
    //    Analisa_iRetorno;
    FHoraEcf := '00:00:00';
    FDataECF := '01/01/1980';
  end;
  //  FDataECF := '14/12/2007';
end;

function TImpEpson.dataHoraUltimoDocumento: string;
var
  sDataHora: string;
  I: Integer;
begin
  for i := 1 to 30 do
    sDataHora := sDataHora + ' ';

  iRetorno := 1;
  while iRetorno <> 0 do
  begin
    iRetorno := EPSON_Obter_Informacao_Ultimo_Documento(pchar(sDataHora));
    if iRetorno <> 0 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  sDataHora := Copy(sDataHora, 3, 14);
  insert('/', sDataHora, 3);
  insert('/', sDataHora, 6);
  insert(' ', sDataHora, 11);
  insert(':', sDataHora, 14);
  insert(':', sDataHora, 17);

  Result := sDataHora;
end;

function TImpEpson.defAtribTef: string;
begin
  defAtribTef :=
    vDadosIniF.StrZeroDec(obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger, 2, 0);
end;

function TImpEpson.DefCodFinalPrazo: string;
begin
  DefCodFinalPrazo :=     obFinalizador.dataSet.FieldByName('cod_finalizador').AsString;
//    vDadosIniF.StrZeroDec(obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger, 2, 0);
end;

procedure TImpEpson.defineArredondamentoTruncamento;
var
  vTemp:string;
  I: Integer;
begin
  inherited;
  vtipoArredond := 'T';
  FqtdDigQtde := 3;
  vTemp := '';
  for I := 1 to 7 do
    vTemp :=  vTemp + ' ';
  iRetorno := EPSON_Obter_Casas_Decimais(pchar(vTemp));
  if Retorno_Impressora then
  begin
    try
      FqtdDigQtde := StrToInt(copy(vTemp,1,3));
    except
    end;
    try
      FqtdDig := StrToInt(copy(vTemp,4,3));
    except
    end;
  end;
end;

function TImpEpson.defvalsangsup(vvalsangsup: real): string;
var
  cValorZero: string;
begin
  cValorZero := vDadosIniF.StrZeroDec(vvalsangsup, 12, 2);
  delete(cValorZero, 10, 1);
  result := cValorZero;
end;

function TImpEpson.Descricaoimp(vdesc: string): string;
var
  cDescricao: string;
  t: integer;
begin
  //    cDescricao := Ldescricao.Caption;
  cDescricao := vdesc;
  for t := 1 to 29 - length(cDescricao) do
  begin
    Insert(' ', cDescricao, 35);
  end;
  result := copy(cDescricao, 1, 35);
end;

function TImpEpson.DesprogramaHorarioVerao: boolean;
var
  vHorarioVeraoAtivado:boolean;
begin
  Result := False;
  iRetorno := EPSON_Obter_Estado_Horario_Verao(vHorarioVeraoAtivado);
  if vHorarioVeraoAtivado then
  begin
    iRetorno := EPSON_Config_Horario_Verao();
    Analisa_iRetorno;
    result := Retorno_Impressora;
  end
  else
    Application.MessageBox('Horário de Verão não esta ativado','Atenção',0+64);
//  Result := true;
//  iRetorno := EPSON_Config_Horario_Verao();
//  Analisa_iRetorno;
//  retorno_impGer(1);

//   if iRetorno = 0 then
//  result:= false;
end;

destructor TImpEpson.Destroy;
begin
  inherited;

end;

function TImpEpson.diaCaixaFechado: Boolean;
var
  Resp: string;
  iconta, i, J: integer;
  szCrzAnsi: AnsiString;
  szDados: string;
  szLastRZData: array[0..1166] of Char;
begin
  try
    Result := true;
    szDados := '';
//    szCrzAnsi := '';
//    for iConta := 1 to 881 do szCrzAnsi := szCrzAnsi + ' ';
    for iConta := 0 to 1160 do szLastRZData[iConta] := ' ';

//    iRetorno := EPSON_Obter_Dados_Ultima_RZ(pchar(szCrzAnsi));
    iRetorno := EPSON_Obter_Dados_Ultima_RZ(szLastRZData);
    resp := '';
//    for I := 1 to 8 do resp := resp + szCrzAnsi[i];
    for I := 0 to 7 do resp := resp + szLastRZData[i];
    if (trim(resp) <> '') then
    begin
      FvDataRes := '';
//      for I := length(szCrzAnsi) - 8 to length(szCrzAnsi) - 1 do FvDataRes := FvDataRes + szCrzAnsi[i];
      //szCrzAnsi[length(szCrzAnsi)- (J -i) ] + FvDataRes ;
      for I := 1159 to 1166 do FvDataRes := FvDataRes + szLastRZData[i];;//szCrzAnsi[i];
      Insert('/', FvDataRes, 3);
      Insert('/', FvDataRes, 6);
      try
        StrToDate(FvDataRes);
      except
        FvDataRes := '';
        FvDataRes := obConfImp.dataSet.FieldByName('diafechado').AsString;
//        for I := 1 to 8 do
//          FvDataRes := FvDataRes + szCrzAnsi[i];
//        Insert('/', FvDataRes, 3);
//        Insert('/', FvDataRes, 6);
      end;
    end
    else
    begin
      for iConta := 1 to 70 do szDados := szDados + ' ';
      iRetorno := EPSON_Obter_Dados_Jornada(PChar(szDados));
      FvDataRes := Copy(szDados, 1, 8);
      Insert('/', FvDataRes, 3);
      Insert('/', FvDataRes, 6);

      //if obConfImp.dataSet.FieldByName('diaaberto').AsString = FvDataRes then
      //begin
      if copy(szDados, 65, 1) = '1' then
        FvDataRes := DateToStr(StrToDate(FvDataRes) - 1);
      FvDataRes := obConfImp.dataSet.FieldByName('diafechado').AsString;
      //end;

    end;
  except
    result := false;
  end;
end;

function TImpEpson.EfetuaFormaPagamento(FormaPagamento: string;
  ValorFormaPagamento: real; vcodFinal: integer): boolean;
var
  cdinheiro: string;
begin
  Result := true;
  cdinheiro := vDadosIniF.StrZeroDec(ValorFormaPagamento, 14, 2);
  delete(cdinheiro, 12, 1);
  iRetorno := EPSON_Fiscal_Pagamento(pchar(inttostr(vcodFinal)), Pchar(cdinheiro), 2, pchar(''),
    pchar(''));
  //  Analisa_iRetorno();
  Analisa_iRetorno;
  if not Retorno_Impressora then
//  if not retorno_impGer(1) then
//    iRetorno := 1;
//  if iretorno <> 0 then
  begin
    EfetuaFormaPagamento := false;
    exit;
  end;
end;

function TImpEpson.EfetuaFormaPagamentoMFD(FormaPagamento,
  ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): boolean;
begin

end;

function TImpEpson.EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,
  ValorRecebimento: string): boolean;
begin

end;

procedure TImpEpson.EqualizarVelocidade;
begin
  inherited;

end;

function TImpEpson.espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD: string;
begin
  try
    if not vDadosIniF.existeComando('8', True) then
      Exit;
    arquivoMFD := StringReplace(endereco, '.txt', '', [rfReplaceAll, rfIgnoreCase]);
    arquivoMFD := StringReplace(arquivoMFD, '\', '\\', [rfReplaceAll]);
    iRetorno := EPSON_Obter_Dados_MF_MFD(pchar(cooInicial), pchar(cooFinal), 2, 65535, 0, 0,
      pchar(arquivoMFD));
    arquivoMFD := StringReplace(arquivoMFD, '\\', '\', [rfReplaceAll]);
    if iRetorno <> 0 then
    begin
      Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
      Result := false;
      exit;
    end;
    copyArquivo(arquivoMFD + '_ESP.txt', endereco);
    DeleteFile(pchar(arquivoMFD + '_ESP.txt'));
    Result := iRetorno = 0;
  except
    Result := false;
  end;
end;

function TImpEpson.espelhoMFDporData(dataInicial, dataFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD: string;
  dtIni, dtFim: string;
begin
  try
    if not vDadosIniF.existeComando('7', True) then
      Exit;
    arquivoMFD := StringReplace(endereco, '.txt', '', [rfReplaceAll, rfIgnoreCase]);
    arquivoMFD := StringReplace(arquivoMFD, '\', '\\', [rfReplaceAll]);
    dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
    dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
    iRetorno := EPSON_Obter_Dados_MF_MFD(pchar(dtIni), pchar(dtFim), 0, 65535, 0, 0,
      pchar(arquivoMFD));
    arquivoMFD := StringReplace(arquivoMFD, '\\', '\', [rfReplaceAll]);
    if iRetorno <> 0 then
    begin
      Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
      Result := false;
      exit;
    end;
    copyArquivo(arquivoMFD + '_ESP.txt', endereco);
    Result := iRetorno = 0;
  except
    result := false;
  end;
end;

function TImpEpson.estadoDeEmissaoDoCupomFiscal: integer;
var
  FlagsFiscais: Integer;
  vpszEstado: string;
  I: Integer;
begin
  vpszEstado := '';
  for i := 1 to 57 do vpszEstado := vpszEstado + ' ';
  EPSON_Obter_Estado_Cupom(pchar(vpszEstado));
  if Copy(vpszEstado,1,2) = '01' then
  begin
    if Copy(vpszEstado,55,2) = '01' then
      Result := 0
    else if (Copy(vpszEstado,55,2) = '02') or (Copy(vpszEstado,55,2) = '03') then
      Result := 1
    else
      Result := 2;
  end
  else
    Result := 2;
end;

function TImpEpson.existeReducaoZPendente:Integer;
var
  I, iST4: Integer;
  szDados, ST4, Temp: string;
  ret: Integer;
begin
  szDados := '';
  FDataECF := '';
  for i := 1 to 15 do szDados := szDados + ' ';
  iRetorno := EPSON_Obter_Hora_Relogio(PChar(szDados));
  FDataECF := copy(szDados, 1, 8);
  if Trim(FDataECF) <> '' then
    FDataECF := Trim(Copy(FDataECF,1,2)+'/'+Copy(FDataECF,3,2)+'/'+Copy(FDataECF,5,4));

  szDados := '';
  for i := 1 to 70 do szDados := szDados + ' ';
  iRetorno := EPSON_Obter_Dados_Jornada(PChar(szDados));
  FvDataRes := Copy(szDados, 1, 8);
  if Trim(FvDataRes) <> '' then
    FvDataRes := Trim(Copy(FvDataRes,1,2)+'/'+Copy(FvDataRes,3,2)+'/'+Copy(FvDataRes,5,4));

  Temp := '';
  for i:= 1 to 20 do Temp := Temp + ' ';
  ret := EPSON_Obter_Estado_Impressora(PChar(Temp));

  if ret <> 0 then
    Result := 2
  else
  begin
    if iRetorno <> 0 then
      Result := 2
    else                                                                                 
    begin
      ST4 := Copy(Temp, 13, 4);
      iST4 := StrToInt('$' + ST4);
      if (iST4 >= 32768) then iST4 := iST4 - 32768;
      if (iST4 >= 16384) then iST4 := iST4 - 16384;
      if (iST4 >= 4096) then iST4 := iST4 - 4096;
      if (iST4 >= 2048) then iST4 := iST4 - 2048;
      if (iST4 >= 1024) then iST4 := iST4 - 1024;
      if (iST4 >= 128) then
      begin
        try
          if StrToDate(FDataECF) > StrToDate(FvDataRes) then
            Result := 1
          else
            Result := 0;
        except
          Result := 2;
        end;
      end
      else
        Result := 0;
    end;
  end;
  if Result = 1  then
    exit;
  TRY
    LeTabelaResumo;
    //montaMaparesumo;
  except
  end;
end;

function TImpEpson.FechaComprovanteNaoFiscalVinculado: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    if EPSON_NaoFiscal_Fechar_CCD(True) <> 0 then
      Result := 0
    else
      result := 1;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroCDC;
      if temp = '' then
        exit;
      vDocNaoF.cdc := temp;
      vDocNaoF.tipoDoc := 'CC';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
    BlockInput(false);
  end;
end;

function TImpEpson.FechaComprovanteNaoFiscalVinculadoTEF: Integer;
begin
  Result := FechaComprovanteNaoFiscalVinculado;
end;

function TImpEpson.fechaCupom: boolean;
begin
  Result := true;
  iRetorno := EPSON_Serial_Abrir_Porta(38400, Fvporta);
  if EPSON_NaoFiscal_Fechar_Relatorio_Gerencial(true) <> 0 then
    EPSON_NaoFiscal_Fechar_CCD(true);
  EPSON_Serial_Fechar_Porta();
end;

function TImpEpson.FechamentoDoDia: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
  iconta: integer;
  szcrz: string;
  szVBatual: string;
  szVBanterior: string;
  szCrzAnsi: AnsiString;
  tempValor: Real;
  vTemp: string;
  vHorarioVerao:integer;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
//.    for iConta := 1 to 15 do szVBatual := szVBatual + ' ';
//.    for iConta := 1 to 15 do szVBanterior := szVBanterior + ' ';
//.    iRetorno := EPSON_Obter_Venda_Bruta(PChar(szVBatual), PChar(szVBanterior));
    //olhar Herbert (retorno com casas decimais)
//    FvvendBr := vDadosIniF.tirapontos(szVBatual, 2);
//.    FvvendBR := vDadosIniF.StrZeroDec(strtoint(szVBatual), 15, 0);
//.    FvvendBr := copy(FvvendBr, 1, 13) + ',' + copy(FvvendBr, 14, 2);
    vTemp:= vDadosIniF.getProgramacaoHorarioVerao;
    if vTemp = 'ATIVAR' then
    begin
      vHorarioVerao := 1;
      vTemp := 'Ativar'
    end
    else if vTemp = 'DESATIVAR' then
    begin
      vHorarioVerao := 0;
      vTemp := 'Desativar';
    end
    else
      vHorarioVerao := 2;
    if vHorarioVerao <> 2 then
      if Application.MessageBox(pchar('Foi feito um agendamento para '+vTemp+
        ' o Horario de Verão. Confirma a Programação?'),'Confirmção',MB_YESNO+MB_ICONQUESTION) = IDNO then
        vHorarioVerao := 2;

    for iConta := 1 to 20 do szCRZ := szCRZ + ' ';
    iRetorno := EPSON_RelatorioFiscal_RZ('', '', vHorarioVerao, PChar(szCRZ));
    //    iRetorno := Bematech_FI_FechamentoDoDia();
    Analisa_iRetorno;

    if not Retorno_Impressora then
//    if not retorno_impGer(1) then
//      iRetorno := 0;
//    if iretorno <> 0 then
    begin
      if Application.MessageBox(pchar('Erro ao emitir redução Z.' + #13 +
        'Ler dados da última redução e colocar no arquivo de resumo?'), 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = mrNo then
      begin
        result := false;
        exit;
      end
    end;
    LeTabelaResumo;
    montaMaparesumo;
    FechaPortaSerial;
  end
  else
  begin
    Result := false;
    exit;
  end;
end;

function TImpEpson.FechaPortaSerial: boolean;
begin
//  if FvPorta <> 0 then
    iRetorno := EPSON_Serial_Fechar_Porta();
end;

function TImpEpson.FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean;
begin

end;

function TImpEpson.FechaRelatorioGerencial: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    if EPSON_NaoFiscal_Fechar_Relatorio_Gerencial(true) <> 0 then
      Result := 0
    else
      Result := 1;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroGRG;
      if temp = '' then
        exit;
      vDocNaoF.grg := temp;
      vDocNaoF.tipoDoc := 'RG';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
    BlockInput(false);
  end;
end;

function TImpEpson.FechaRelatorioGerencialTEF: Integer;
begin
  Result := FechaRelatorioGerencial;
end;

function TImpEpson.FecharOp: boolean;
begin
  Result := true;
  EPSON_NaoFiscal_Abrir_Relatorio_Gerencial('1');
  EPSON_NaoFiscal_Imprimir_Linha('               FECHAMENTO DO OPERADOR           ');
  EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48)));
  EPSON_NaoFiscal_Imprimir_Linha(Pchar('DATA.........: ' + datetostr(date)));
  EPSON_NaoFiscal_Imprimir_Linha(Pchar('CAIXA/PDV....: ' +
    vDadosIniF.StrZeroDec(obConfImp.dataSet.FieldByName('cod_terminal').AsInteger, 4, 0)));
  EPSON_NaoFiscal_Imprimir_Linha(Pchar('NOME DO OP...: ' + trim(vDadosIniF.vNomeFuncionario)));
  EPSON_NaoFiscal_Imprimir_Linha(' ');
  EPSON_NaoFiscal_Imprimir_Linha(' ');
  EPSON_NaoFiscal_Imprimir_Linha('        ---------------------------------       ');
  EPSON_NaoFiscal_Imprimir_Linha('                  ASS. DO OPERADOR              ');
  FechaRelatorioGerencial; //(true);
end;

function TImpEpson.gerarArquivosConferenciaSintegraSPED(vNomeArqSint,
  vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean;
var
  arquivoMFD: string;
  dtIni: string;
  dtFim: string;
begin
  Result := False;

  dtIni := DateToStr(StartOfTheMonth(StrToDate(vDtIni)));
  dtFim := DateToStr(EndOfTheMonth(StrToDate(vDtFim)));

  arquivoMFD := StringReplace(vNomeArqSint, '.txt', '', [rfReplaceAll, rfIgnoreCase]);
  dtIni := StringReplace(dtIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dtFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
//  iRetorno := EPSON_Config_Dados_Sintegra('RAZAO SOCIAL', 'LOGRADOURO', '123', '', 'CENTRO', 'GOVAL', '35065019', 'MG', '3332725351', '3332725351', 'HW');
  iRetorno := EPSON_Obter_Dados_MF_MFD(pchar(dtIni), pchar(dtFim), 0, 0, 0, 1,
    pchar(arquivoMFD));
  if iRetorno <> 0 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Result := iRetorno = 0;
  if copyArquivo(arquivoMFD + '_SIN.txt', vNomeArqSint) then
    DeleteFile(pchar(arquivoMFD + '_SIN.txt'));

  if iRetorno <> 0 then
    exit;

  dtIni := DateToStr(StartOfTheMonth(StrToDate(vDtIni)));
  dtFim := DateToStr(EndOfTheMonth(StrToDate(vDtFim)));

  Result := arquivoMFDCotepe1704porData(dtIni, dtFim, vNomeArqCOTEPE, vDadosIniF.vCodPropEcf, 'MFD');
end;

function TImpEpson.getGrandeTotal: string;
var
  vlrGT: string;
  iConta: integer;
  temp: string;
begin
  vlrGT := '';
  for iConta := 1 to 18 do begin vlrGT := vlrGT + ' '
  end;
  iRetorno := EPSON_Obter_GT(PChar(vlrGT));
  vlrGT := vDadosIniF.StrZero(vlrGT, 18);
  //while iRetorno <> 0 do
  while not Retorno_Impressora do  
  begin
    if Application.MessageBox('GT. Impressora não responde. Tentar novamente',
      'Atenção',MB_YESNO+MB_ICONQUESTION) = IDNO then
      exit;
    iRetorno := EPSON_Obter_GT(PChar(vlrGT));
    vlrGT := vDadosIniF.StrZero(vlrGT, 18);
  end;
//  if not retorno_impGer(1) then
//    iRetorno := 1;
//  if iretorno <> 0 then
//    temp := ''
//  else
    temp := (copy(vlrGT, 1, 16) + ',' + copy(vlrGT, 17, 2));
  temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Result := temp;
end;

procedure TImpEpson.ImpDavsEmitidos;
var
  tipo: string;
  vTexto: string;
begin
  inherited;
  EPSON_NaoFiscal_Abrir_Relatorio_Gerencial('1');
  EPSON_NaoFiscal_Imprimir_Linha('                  DAV EMITIDOS                  ');
  EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48)));
  EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate(' ', 48)));
  obVenda.First;
  while not obVenda.eof do
  begin
    if obVenda.dataSet.FieldByName('TIPO').AsString = 'REQ' then
      tipo := 'PEDIDO'
    else if TRIM(obVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
      tipo := 'ORDEM SERVIÇO'
    else if obVenda.dataSet.FieldByName('TIPO').AsString = 'ORC' then
      tipo := 'ORÇAMENTO';

    vTexto := TamDesc(13, tipo) + '    ' +
      obVenda.dataSet.FieldByName('DATA_FECH').AsString + '       ' +
      vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
        vDadosIniF.vQtdeDigDAV)+'                                   ';

    EPSON_NaoFiscal_Imprimir_Linha(pchar(copy(vTexto,1,48)));

    vTexto := 'COO Vinc: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('ncupom').AsInteger, 6) +
              ' COO Imp: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('coo_impressao').AsInteger, 6) +
              ' Valor: ' + Format('%5.2F', [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]) +
              '                                   ';

    EPSON_NaoFiscal_Imprimir_Linha(pchar(copy(vTexto,1,48)));

    EPSON_NaoFiscal_Imprimir_Linha(pchar(vDadosIniF.Replicate(' ', 48)));

    obVenda.Next;
  end;
  FechaRelatorioGerencial;
  obVenda.close;
end;

procedure TImpEpson.ImpDavsOSEmitidos;
begin
  inherited;
  EPSON_NaoFiscal_Abrir_Relatorio_Gerencial('1');
  EPSON_NaoFiscal_Imprimir_Linha('                DAV-OS EMITIDOS            ');
  EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48)));
  EPSON_NaoFiscal_Imprimir_Linha(' ');
  EPSON_NaoFiscal_Imprimir_Linha(' ');
  obVenda.First;
  while not obVenda.eof do
  begin
    EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
      vDadosIniF.vQtdeDigDAV) + '             ' + Format('%10.2F',
      [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency])));
    obVenda.Next;
  end;
  FechaRelatorioGerencial;
  obVenda.close;
end;

procedure TImpEpson.ImpIdentificacaoPAFECF;
begin
  inherited;
  abrerelatorioGer;
  RelatorioGerencial2('             IDENTIFICAÇÃO DO PAF-ECF         ');
  RelatorioGerencial2(vDadosIniF.Replicate('=', 48));
  RelatorioGerencial2(vDadosIniF.Replicate(' ', 48));
  obIdentF.abreIdentFiscal(False);
  obIdentF.First;
  RelatorioGerencial2(TamDescricao(48, 'Laudo Numero: ' +
    obIdentF.dataSet.FieldByName('n_laudo_fiscal').AsString));
  RelatorioGerencial2(TamDescricao(48, obIdentF.dataSet.FieldByName('nome_empdes').AsString));
  RelatorioGerencial2(TamDescricao(48, ' CNPJ: ' +
    obIdentF.dataSet.FieldByName('cnpj_empdes').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Endereço: ' +
    obIdentF.dataSet.FieldByName('endereco_empdes').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Bairro: ' +
    obIdentF.dataSet.FieldByName('bairro_empdes').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Cidade: ' +
    obIdentF.dataSet.FieldByName('cidade_empdes').AsString +
    ' UF: ' + obIdentF.dataSet.FieldByName('uf_empdes').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Telefone: ' +
    obIdentF.dataSet.FieldByName('fone_empdes').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Contato: ' +
    obIdentF.dataSet.FieldByName('contato_empdes').AsString));
  RelatorioGerencial2(TamDescricao(48, obIdentF.dataSet.FieldByName('nome_paf').AsString));
  RelatorioGerencial2(TamDescricao(48, ' ' +
    obIdentF.dataSet.FieldByName('nome_comercial').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Versão: ' +
    obIdentF.dataSet.FieldByName('versao_paf').AsString));
  RelatorioGerencial2(TamDescricao(48, ' Principal Executavel: ' +
    obIdentF.dataSet.FieldByName('principal_exec').AsString));
  RelatorioGerencial2(TamDescricao(48, ' MD5: ' +
    vDadosIniF.vMD5Fiscal));
  RelatorioGerencial2(' Outros arquivos e MD5');
  while not obIdentF.dataSet.Eof do
  begin
    RelatorioGerencial2(TamDescricao(48, '  ' +
      obIdentF.dataSet.FieldByName('nome_arquivo').AsString));
    RelatorioGerencial2(TamDescricao(48, '  ' +
      obIdentF.dataSet.FieldByName('md5_arquivo').AsString));
    obIdentF.next;
  end;
  obTermImp.abreTerminalImpressoras;
  RelatorioGerencial2('ECF''s Autorizados');
  obTermImp.First;
  while not obTermImp.dataSet.Eof do
  begin
    RelatorioGerencial2(' ' +
      vDadosIniF.decodifica(obTermImp.dataSet.FieldByName('num_serie_ecf').AsString));
    obTermImp.next;
  end;
  FechaRelatorioGerencial;
end;

procedure TImpEpson.ImpMeiosDePagamento;
var
  vTipDoc: string;
  vValorCancelado: Currency;
  aFinal: array[1..99] of string;
  aValor: array[1..99] of Currency;
  I, flFinal: Integer;

begin
  inherited;
  for I := 1 to 99 do
  begin
    aFinal[i] := '';
    aValor[i] := 0;
  end;

  EPSON_NaoFiscal_Abrir_Relatorio_Gerencial('1');
  EPSON_NaoFiscal_Imprimir_Linha('               MEIOS DE PAGAMENTO               ');
  EPSON_NaoFiscal_Imprimir_Linha(pchar(vDadosIniF.Replicate('=', 48)));
  EPSON_NaoFiscal_Imprimir_Linha(pchar(TamDescricao(48, vTituloRel)));
  EPSON_NaoFiscal_Imprimir_Linha(' ');
  EPSON_NaoFiscal_Imprimir_Linha(' ');

  obCupom.vMeiosPag.First;
  while not obCupom.vMeiosPag.dataSet.Eof do
  begin
    vtipDoc := '';
    vValorCancelado := obCupom.vMeiosPag.getValorCancelado(
      obCupom.vMeiosPag.dataSet.FieldByName('cod_finalizador').AsInteger,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime);
    if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString <> 'CUP' then
      vValorCancelado := 0;
    if vValorCancelado < obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat then
    begin
      if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'CUP' then
        vtipDoc := trim('Cupom Fiscal')
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'REC' then
        vtipDoc := 'Comprovante Nao Fiscal - ' +
          Trim(obCupom.vMeiosPag.dataSet.FieldByName('DESCRICAO').AsString)
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'SUP' then
        vtipDoc := TamDesc(48, 'Comprovante Não Fiscal - ') + 'Suprimento';

      RelatorioGerencial2(
        TamDescricao(24, trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) +
        ' - ' + obCupom.vMeiosPag.dataSet.FieldByName('tipo_final').AsString) +
        TamDescricao(12, trim(obCupom.vMeiosPag.dataSet.FieldByName('data').AsString)) +
        TamDescricao(12, format('%9.2f', [obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
        vValorCancelado]))
          +
        TamDescricao(48, vTipDoc) + TamDescricao(48, ' '));
      flFinal := 0;
      for I := 1 to 99 do
      begin
        if aFinal[i] = trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) then
        begin
          aValor[i] := aValor[i] + obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
            vValorCancelado;
          flFinal := 1;
          Break;
        end;
      end;
      if flFinal = 0 then
      begin
        for I := 1 to 99 do
        begin
          if aFinal[i] = '' then
          begin
            aFinal[i] := trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString);
            aValor[i] := aValor[i] + obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
              vValorCancelado;
            Break;
          end;
        end;
      end;
    end;
    obCupom.vMeiosPag.next;
  end;

  EPSON_NaoFiscal_Imprimir_Linha(' ');
  
  for i := 1 to 99 do
  begin
    if aFinal[i] <> '' then
    begin
      RelatorioGerencial2( TamDescricao(20, afinal[i]) +
        TamDescricao(28, Format('%12.2f', [aValor[i]])));
    end
    else
      Break;
  end;
  FechaRelatorioGerencial;
  obCupom.vMeiosPag.close;  
end;

procedure TImpEpson.ImpResumoVnd;
var
  vindbarra, vindprod: string;
begin
  inherited;
  EPSON_NaoFiscal_Abrir_Relatorio_Gerencial('1');
  EPSON_NaoFiscal_Imprimir_Linha('     RELATORIO DE QTDE DE PRODUTOS VENDIDOS ');
  EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48)));
  EPSON_NaoFiscal_Imprimir_Linha(' ');
  EPSON_NaoFiscal_Imprimir_Linha(' ');
  while not obCupom.vTotalVenda.dataSet.eof do
  begin
    obProd.selecionaProdutoGrupoCodigo(
      obCupom.vTotalVenda.dataSet.fieldbyname('GRUPO_PROD').AsInteger,
      obCupom.vTotalVenda.dataSet.fieldbyname('COD_PROD').AsString);
    EPSON_NaoFiscal_Imprimir_Linha(Pchar(TamDescricao(48,TamDesc(29,obProd.dataSet.FieldByName('descr_prod').AsString) + '  ' +
      format('%8.5f', [obCupom.vTotalVenda.dataSet.FieldByName('SOMA').AsFloat]))));
    obCupom.vTotalVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obCupom.vTotalVenda.dataSet.close;
end;

function TImpEpson.imprimeDavNoEcf(dav: RVenda): boolean;
var
  temp: string;
  tamanhoLinha: integer;
  I: Integer;
begin
  tamanhoLinha := fQtdeColunasImpressao;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Documento Auxiliar de Venda'));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Doc Nº ' + vDadosIniF.StrZero(dav.nprevenda,
    vDadosIniF.vQtdeDigDAV) +
    '  Nº Doc Fiscal ___________'));
  temp := '';
  if dav.tipo_venda = 'REQ' then
    temp := 'Pedido de Venda Nº '
  else if TRIM(dav.tipo_venda) = 'OS' then
    temp := 'Ordem de Serviço Nº '
  else if dav.tipo_venda = 'ORC' then
    temp := 'Orçamento Nº ';
  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  //  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Cliente: ' +
    vDadosIniF.StrZero(dav.cod_cliente,
    6)
    + ' ' + dav.nome_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Endereço: ' + dav.endereco_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.bairro_cliente + ', ' + dav.cidade_cliente
    +
    '-'
    + dav.estado_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CPF/CNPJ: ' +
    vDadosIniF.StrZero(dav.cnpjcpf_cliente, 14) + '  Insc Est: ' + dav.insc_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Telefone: ' + dav.fone_cliente + '  Cond.Pag: '
    + dav.cond_pag));
  if Trim(dav.linhaAd1) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd1)));
  if Trim(dav.linhaAd2) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd2)));
  if Trim(dav.linhaAd3) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd3)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,
    'PRODUTO/SERVIÇO  QTDE     VL UNIT      VL TOTAL'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  for I := 0 to dav.qtde_Produtos + dav.qtde_Servicos - 1 do
  begin
    temp := IntToStr(i + 1) + ' ';
    if dav.item[i].tipo = 'P' then
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod) + ' ' + dav.item[i].cod_prod;
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end
    else
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod);
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end;
  end;
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Produtos..: ' +
      IntToStr(dav.qtde_Produtos)));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Serviços..: ' +
      IntToStr(dav.qtde_Servicos)));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Produtos....: ' + Format('%12.2f',
      [dav.valor_produtos])));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Serviços....: ' + Format('%12.2f',
      [dav.valor_servicos])));
  if dav.desconto > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Desconto..........: ' + Format('%12.2f',
      [dav.desconto])));
  if dav.acrescimo > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Acréscimo.........: ' + Format('%12.2f',
      [dav.acrescimo])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Líquido.....: ' + Format('%12.2f',
    [dav.valor_liquido])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,'Obs.: ' + dav.observacao));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  if dav.usar_Declaracao = 'S' then
  begin
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'Autorizo, nos termos do parágrafo 2º do artigo'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      '43 do codigo de defesa do consumidor o registro'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'do meu debito no servico de protecao ao credito,'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'e a respectiva correcao monetaria, ate a data'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'do seu efetivo pagamento, caso haja'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'inadimplencia de minhas obrigaçoes perante esta.'));

    RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  end;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, '______________________________'));
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Assinatura'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.empresa + '    ' + dav.fone_Empresa));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CNPJ: ' + dav.cgc_emp));
  result := FechaRelatorioGerencial = 1;
end;

function TImpEpson.Imprime_Prazo: boolean;
var
  ixx, i: integer;
  vcount, vfl, vret: integer;
  iInicio: Ttime;
  mes: array[1..12] of string;
  vdia, vmes, vano: word;
  cdinheiro: string;
begin
  Result := true;

  mes[1] := 'JANEIRO';
  mes[2] := 'FEVEREIRO';
  mes[3] := 'MARÇO';
  mes[4] := 'ABRIL';
  mes[5] := 'MAIO';
  mes[6] := 'JUNHO';
  mes[7] := 'JULHO';
  mes[8] := 'AGOSTO';
  mes[9] := 'SETEMBRO';
  mes[10] := 'OUTUBRO';
  mes[11] := 'NOVEMBRO';
  mes[12] := 'DEZEMBRO';
  //
 // BlockInput(true);
  if not obEmpresa.Active then
    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
  //
  vimptef := 1;
  vret := 0;
  vcanctef := 0;
  reimprime :='1';
  if reimprime = '0' then
  begin
    cdinheiro := vDadosIniF.StrZeroDec(StrToFloat(vDadosIniF.trocaVirgulaPorPonto(Fvvalpr)), 14, 2);
    delete(cdinheiro, 12, 1);
//    Fvvalpr:= Trim(Format('%10.2F',[strtofloat(Fvvalpr)]));
//    Fvvalpr:= vDadosIniF.tirapontos(vDadosIniF.trocaVirgulaPorPonto(Fvvalpr),2);
    if vacr = 1 then
      EPSON_NaoFiscal_Abrir_CCD(Pchar(DefCodFinalPrazo), Pchar(cdinheiro), 2, '1');
  end
  else
    EPSON_NaoFiscal_Abrir_Relatorio_Gerencial('1');
  for i := 1 to obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger do
    // QtdCpNF.value do
  begin
    obCupom.vFPg.First;
    vcount := 1;
    while not obCupom.vFPg.Eof do
    begin
      decodedate(obCupom.vFPg.dataSet.FieldByName('data_venc').AsDateTime, vano, vmes, vdia);
      vret := 0;
      if reimprime = '0' then
      begin
        if vcount > 1 then
        begin
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48))) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.vEmp.vRazaoSocial)) <> 0 then
            break;
          if
            EPSON_NaoFiscal_Imprimir_Linha(Pchar(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring)) <> 0 then
            break;
          if
            EPSON_NaoFiscal_Imprimir_Linha(Pchar(obEmpresa.dataSet.FieldByName('bairro_emp').AsString
            +
            ', ' + obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString)) <> 0 then
            break;
          if
            EPSON_NaoFiscal_Imprimir_Linha(Pchar(obEmpresa.dataSet.FieldByName('telefone_emp').AsString
            + ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario)) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48))) <> 0 then
            break;
        end;
        //
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar('Reconheco o valor da divida abaixo:')) <> 0
          then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('-', 48))) <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString)) <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat]))) <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar('OPERADOR: ' + vDadosIniF.vNomeFuncionario)) <> 0
          then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(' ') <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(' ') <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('-', 48))) <> 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString)) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString))) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString)) <> 0 then
            break;
        end
        else
        begin
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CLIENTE: ' + obCupom.getNomeAvulso)) <> 0
            then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('ENDERECO: ' + obCupom.getEnderecoAvulso + ' '
            +
            obCupom.getBairroAvulso)) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CPF/CNPJ: ' + obCupom.getCpfCnpjAvulso)) <> 0
            then
            break;
        end;
        if
          EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString))) <> 0 then
          break;
      end
      else
      begin
        if vcount > 1 then
        begin
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48))) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.vEmp.vRazaoSocial)) <> 0 then
            break;
          if
            EPSON_NaoFiscal_Imprimir_Linha(Pchar(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring)) <> 0 then
            break;
          if
            EPSON_NaoFiscal_Imprimir_Linha(Pchar(obEmpresa.dataSet.FieldByName('bairro_emp').AsString
            +
            ', ' + obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString)) <> 0 then
            break;
          if
            EPSON_NaoFiscal_Imprimir_Linha(Pchar(obEmpresa.dataSet.FieldByName('telefone_emp').AsString
            + ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario)) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('=', 48))) <> 0 then
            break;
        end;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar('Reconheco o valor da divida abaixo:')) <> 0
          then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('-', 48))) <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString)) <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar('   VALOR: ' + format('%f',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat]))) <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar('OPERADOR: ' + vDadosIniF.vNomeFuncionario)) <> 0
          then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(' ') <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(' ') <> 0 then
          break;
        if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.Replicate('-', 48))) <> 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString)) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString))) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString)) <> 0 then
            break;
        end
        else
        begin
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CLIENTE: ' + obCupom.getNomeAvulso)) <> 0
            then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('ENDERECO: ' + obCupom.getEnderecoAvulso + ' '
            +
            obCupom.getBairroAvulso)) <> 0 then
            break;
          if EPSON_NaoFiscal_Imprimir_Linha(Pchar('CPF/CNPJ: ' + obCupom.getCpfCnpjAvulso)) <> 0
            then
            break;
        end;
        if
          EPSON_NaoFiscal_Imprimir_Linha(Pchar(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString))) <> 0 then
          break;
      end;
      if vret <> 0 then
        break;
      retorno_ImpTEF;
      if vcanctef <> 0 then
        vret := 1;
      if vret <> 0 then
        break;
      obCupom.vFPg.Next;
      inc(vcount);
      if obCupom.vFPg.Eof then
      begin
        {     if reimprime = '0' then
             begin
              vret:=EPSON_NaoFiscal_Imprimir_Linha(' ');
              vret:=EPSON_NaoFiscal_Imprimir_Linha(' ');
             end
             else
             begin
              vret:=EPSON_NaoFiscal_Imprimir_Linha(' ');
              vret:=EPSON_NaoFiscal_Imprimir_Linha(' ');
             end;
             if vret = 0 then
              break;}
      end
      else
      begin
        if reimprime = '0' then
        begin
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
        end
        else
        begin
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
        end;
      end;
    end;
    if vret <> 0 then
      break
    else
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
        if vret <> 0 then
          break;
        vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
        if vret <> 0 then
          break;
      end;
    end;
    if i <> 2 then
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        iInicio := time;
        if reimprime = '0' then
        begin
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          if vret <> 0 then
            break;
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          if vret <> 0 then
            break;
        end
        else
        begin
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          if vret <> 0 then
            break;
          vret := EPSON_NaoFiscal_Imprimir_Linha(' ');
          if vret <> 0 then
            break;
        end;
        //   IF obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
       //    begin
        repeat
        until ((time - iInicio) > strtotime('00:00:02'));
        //    end;
      end;
    end;
  end;
  if vret <> 0 then
    Imprime_Prazo := false
  else
  begin
    if reimprime = '1' then
      FechaRelatorioGerencial
    else
      FechaComprovanteNaoFiscalVinculado;
    Imprime_Prazo := true;
  end;
  // BlockInput(false);

end;

function TImpEpson.ImpTirouZSoz(vdat1, Vdat2: Tdate): boolean;
begin
  if vdat1 = Vdat2 then
    Result := true
  else
    result := false;
end;

function TImpEpson.IniciaFechamentoCupom(AcrescimoDesconto,
  TipoAcrescimoDesconto: string; ValorAcrescimoDesconto: real): boolean;
var
  cDes_Acres: string;
begin
  Result := true;
  cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 11, 2);
  delete(cDes_Acres, 9, 1);

  {    cValor := DCAcres_Desc.Text;
      cTipoDesconto := '$';
      cValorDesc := cDes_Acres;
      cDescricao := '00000000000000';}
  try
    if strtoint(cDes_Acres) <> 0 then
    begin
      if AcrescimoDesconto = 'D' then
        iRetorno := EPSON_Fiscal_Desconto_Acrescimo_Subtotal(Pchar(cDes_Acres), 2, True, False)
      else
        iRetorno := EPSON_Fiscal_Desconto_Acrescimo_Subtotal(Pchar(cDes_Acres), 2, false,
          False);
      Analisa_iRetorno;
      if (Retorno_Impressora) and (AcrescimoDesconto = 'A') then
//      if (iretorno = 0) and (AcrescimoDesconto = 'A') then
        vdadosIniF.acumulaGrandeTotal(ValorAcrescimoDesconto);
    end;
  except

  end;
  //  iRetorno := Bematech_FI_IniciaFechamentoCupom(AcrescimoDesconto, '$', cDes_Acres);
    //       iRetorno := Bematech_FI_IniciaFechamentoCupomMFD( DCAcres_Desc.Text, cTipoDesconto, cValorDesc ,cDescricao);
    //       ( pchar(DCAcres_Desc.Text), pchar('$'), pchar(cDes_Acres),pchar('00000000000000'));
//  if not retorno_impGer(1) then
//    iRetorno := 1;

//  if iretorno <> 0 then
//  begin
//    Analisa_iRetorno;
//    IniciaFechamentoCupom := false;
//    exit;
//  end;
end;

function TImpEpson.IniciaFechamentoCupomMFD(AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto: string): boolean;
begin

end;

function TImpEpson.LeituraMemoriaFiscalData(vdata1,
  vdata2, CompletaSimplificada: string): boolean;
var
  iconta: integer;
  tambuff: Integer;
  pszDados: string;
  vdt1, vdt2: string;
  tipoP: integer;
begin
  tipop := 0;
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
    tipoP := tipoP + 1;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
    tipoP := tipoP + 3;
  end;
  tipoP := tipoP + 4;
  Result := true;
  vdt1 := copy(vdata1, 1, 2) + copy(vdata1, 4, 2) + copy(vdata1, 7, 4);
  vdt2 := copy(vdata2, 1, 2) + copy(vdata2, 4, 2) + copy(vdata2, 7, 4);
  for iConta := 1 to 10000 do
    pszDados := pszDados + ' ';
  tambuff := 0;
  iRetorno := EPSON_RelatorioFiscal_Leitura_MF(Pchar(vdt1), Pchar(vdt2), tipoP, PChar(pszDados),
    PCHAR(fPathRetornoTXT), @tambuff, 10000);
  if Retorno_Impressora then
    messagedlg('Arquivo ' + fPathRetornoTXT + ' gerado com sucesso', mtinformation, [mbOK], 0);
end;

function TImpEpson.LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): boolean;
begin

end;

function TImpEpson.LeituraMemoriaFiscalReducao(ReducaoInicial,
  ReducaoFinal, CompletaSimplificada: string): boolean;
var
  iconta: integer;
  tambuff: Integer;
  pszDados: string;
  tipoP: integer;
begin
  tipoP := 0;
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
    tipoP := tipoP + 0;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
    tipoP := tipoP + 2;
  end;
  tipoP := tipoP + 4;
  Result := true;
  for iConta := 1 to 10000 do
    pszDados := pszDados + ' ';
  tambuff := 0;
  iRetorno := EPSON_RelatorioFiscal_Leitura_MF(Pchar(reducaoinicial), Pchar(ReducaoFinal),
    tipoP, PChar(pszDados), PChar(fPathRetornoTXT), @tambuff, 10000);
  if Retorno_Impressora then
    messagedlg('Arquivo ' + fPathRetornoTXT + ' gerado com sucesso', mtinformation, [mbOK], 0);
end;

function TImpEpson.LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpEpson.LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada,
  endereco: string): boolean;
var
  iconta: integer;
  tambuff: Integer;
  pszDados: string;
  vdt1, vdt2: string;
  tipoP: integer;
begin
  tipoP := 0;
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
    tipoP := tipoP + 1;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
    tipoP := tipoP + 3;
  end;
  Result := true;
  tipoP := tipoP + 16;
  vdt1 := copy(DataInicial, 1, 2) + copy(DataInicial, 4, 2) + copy(DataInicial, 7, 4);
  vdt2 := copy(DataFinal, 1, 2) + copy(DataFinal, 4, 2) + copy(DataFinal, 7, 4);
  for iConta := 1 to 10000 do
    pszDados := pszDados + ' ';
  tambuff := 0;
  iRetorno := EPSON_RelatorioFiscal_Leitura_MF(Pchar(vdt1), Pchar(vdt2), tipoP, PChar(pszDados),
    pchar(endereco), @tambuff, 10000);
  if Retorno_Impressora then
    messagedlg('Arquivo ' + endereco + ' gerado com sucesso', mtinformation, [mbOK], 0);
end;

function TImpEpson.LeituraMemoriaFiscalSerialDataMFD(DataInicial,
  DataFinal, FlagLeitura: string): boolean;
begin

end;

function TImpEpson.LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal,
  CompletaSimplificada, endereco: string): boolean;
var
  iconta: integer;
  tambuff: Integer;
  pszDados: string;
  tipoP: integer;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
    tipoP := tipoP + 0;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
    tipoP := tipoP + 2;
  end;
  Result := true;
  tipoP := tipoP + 16;
  for iConta := 1 to 10000 do
    pszDados := pszDados + ' ';
  tambuff := 0;
  iRetorno := EPSON_RelatorioFiscal_Leitura_MF(Pchar(reducaoinicial), Pchar(ReducaoFinal),
    tipoP,
    PChar(pszDados), pchar(endereco), @tambuff, 10000);
  if Retorno_Impressora then
    messagedlg('Arquivo ' + endereco + ' gerado com sucesso', mtinformation, [mbOK], 0);
end;

function TImpEpson.LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpEpson.LeituraX: boolean;
begin
  Result := true;
  iRetorno := EPSON_RelatorioFiscal_LeituraX();
  Analisa_iRetorno();
  Retorno_Impressora;
end;

function TImpEpson.LeTabelaResumo: boolean;
var
  vl, i: integer;
  Resp: string;
  iconta: integer;
  szcrz: string;
  szVBatual: string;
  szVBanterior: string;
  tempValor: Real;
  szCrzAnsi: ANSIString;
  ll: TStringList;
  temp: string;
  szDados: string;
  szLastRZData: array[0..1166] of Char;
begin
  Result := true;
  diaCaixaFechado;
  for iConta := 0 to 1160 do szLastRZData[iConta] := ' ';
  iRetorno := EPSON_Obter_Dados_Ultima_RZ(szLastRZData);
  temp := ''; for I := 26 to 31 do temp := temp + szLastRZData[i];
  if trim(temp) = '' then
  begin
    Fvcooini:='0';
    Fvcoofin:='0';
    vMapaResumo.coored:='0';
    Exit;
  end;

  For i := 1 To 602 Do   szDados := szDados + ' ';
  iRetorno := EPSON_Obter_Total_JornadaEX('T',pchar(copy(temp,3,4)),pchar(szDados));
  FvvendBR:=''; for I := 17 to 30 do FvvendBr := FvvendBr + szDados[i];
  FvvendBr := copy(FvvendBr, 1, 12) + ',' + copy(FvvendBr, 13, 2);
  Fvcooini:=''; for I := 14 to 19 do Fvcooini := Fvcooini + szLastRZData[i];
  Fvcoofin:=''; for I := 20 to 25 do Fvcoofin := Fvcoofin + szLastRZData[i];
  FvContRed:=''; for I := 26 to 31 do FvContRed := FvContRed + szLastRZData[i];
  FvcontRein:=''; for I := 32 to 37 do FvcontRein := FvcontRein + szLastRZData[i];
  FvGrandT:=''; for I := 86 to 103 do FvGrandT := FvGrandT + szLastRZData[i];
  FvGrandT := copy(FvGrandT, 1, 16) + ',' + copy(FvGrandT, 17, 2);

//.  szCRZ := '';
//.  for iConta := 1 to 70 do szCRZ := szCRZ + ' ';
  //  iRetorno := EPSON_Obter_Dados_Jornada(PChar(szCRZ));
  //  Fvcooini := trim(copy(szCRZ, 29, 6));
  //  Fvcoofin := trim(copy(szCRZ, 35, 6));
//.  szCrzAnsi := '';
//.  for i := 1 to 1167 do szCrzAnsi := szCrzAnsi + ' ';
//.
//.  iRetorno := EPSON_Obter_Dados_Ultima_RZ(pchar(szCrzAnsi));
//.  temp:='';
//.  for I := 27 to 32 do temp := szCrzAnsi[i];
//.  szDados := '';
//.  For i := 1 To 602 Do   szDados := szDados + ' ';
//.  iRetorno := EPSON_Obter_Total_JornadaEX('T',pchar(temp),pchar(szDados));
//.  FvvendBr := '';
//.  for I := 17 to 30 do FvvendBr := FvvendBr + szDados[i];
//.
//.  fvcooini := '';
//.  for I := 15 to 20 do Fvcooini := Fvcooini + szCrzAnsi[i];
//.  fvcooFin := '';
//.  for I := 21 to 26 do fvcooFin := fvcooFin + szCrzAnsi[i];
//.  for I := 87 to 104 do
  //    FvvendBr := FvvendBr + szCrzAnsi[i];
//  szCRZ := '';
//.  for iConta := 1 to 100 do szCRZ := szCRZ + ' ';
//.  iRetorno := EPSON_Obter_Contadores(PChar(szCRZ));
//.  FvContRed := trim(copy(szCRZ, 7, 6));
//.  FvcontRein := trim(copy(szCRZ, 13, 6));
//.  szVBatual := '';
//.  for iConta := 1 to 15 do szVBatual := szVBatual + ' ';
//.  szVBanterior := '';
//.  for iConta := 1 to 15 do szVBanterior := szVBanterior + ' ';
  //  iRetorno := EPSON_Obter_Venda_Bruta(PChar(szVBatual), PChar(szVBanterior));
  //olhar Herbert (retorno com casas decimais)
  //  FvvendBR := vDadosIniF.StrZeroDec(strtoint(szVBatual), 15, 0);
//.  FvvendBr := copy(FvvendBr, 1, 12) + ',' + copy(FvvendBr, 13, 2);
  //FvvendBr := vDadosIniF.tirapontos(szVBatual, 2);

//.  szCRZ := '';
//.  for iConta := 1 to 20 do szCRZ := szCRZ + ' ';
//.  iRetorno := EPSON_Obter_GT(PChar(szCRZ));
//.  FvGrandT := vDadosIniF.tirapontos(szCRZ, 2);
//.  FvGrandT := vDadosIniF.StrZeroDec(strtoint(FvGrandT), 15, 0);
//.  FvGrandT := copy(FvGrandT, 1, 13) + ',' + copy(FvGrandT, 14, 2);
  montaMaparesumo;
  result:= true;
end;

function TImpEpson.NumeroCupom: string;
var
  cnumerocupom: string;
  iConta: integer;
begin
  //     FPrinter.FechaComunicacao;
           //     Bematech_FI_AbrePortaSerial;
  AbrePortaS('');
  for iConta := 1 to 100 do begin cNumeroCupom := cNumeroCupom + ' '
  end;
  iRetorno := 1;
  while iRetorno <> 0 do
  begin
    iRetorno := EPSON_Obter_Contadores(pchar(cNumeroCupom));
    if iRetorno <> 0 then
    begin
      //BlockInput(False);
      //if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
      //  'Atenção',
      //  MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  NumeroCupom := copy(cNumeroCupom, 1, 6);
end;

function TImpEpson.numeroGNF: string;
var
  sGNF: string;
  sContadoress: array[0..84] of Char;
  I: Integer;
begin
  AbrePortaS('');
  for i := 0 to 84 do sContadoress[i] := ' ';
  iRetorno := EPSON_Obter_Contadores(sContadoress);
  sGNF :='';
  for I := 18 to 23 do sGNF := sGNF + sContadoress[i];
  Result := sGNF;
end;

function TImpEpson.numeroGRG: string;
var
  sGRG: string;
  iConta: integer;
begin
  for iConta := 1 to 100 do
    sGRG := sGRG + ' ';
  iRetorno := EPSON_Obter_Contadores(PChar(sGRG));
  Result := copy(sGRG, 37, 6);
end;

function TImpEpson.NumeroSerie: string;
var
  retorno_var: string;
  iConta: integer;
begin
  Retorno_var := '';
  for iConta := 1 to 110 do
    Retorno_var := Retorno_var + ' ';
  iRetorno := EPSON_Obter_Dados_Impressora(PChar(Retorno_var));
  Analisa_iRetorno();
  if iRetorno = 0 then
    NumeroSerie := copy(retorno_var, 1, 20)
  else
  begin
    Retorno_Impressora;
    ShowMessage(copy(retorno_var, 1, 20));
    NumeroSerie := '';
  end;
end;

function TImpEpson.NumeroSerieMFD: string;
begin

end;

function TImpEpson.obterCNPJUsuario: string;
var
  vCNPJ: string;
  i: integer;
begin
  vCNPJ := '';
  for i := 1 to 50 do vCNPJ := vCNPJ + ' ';
  AbrePortaS('');
  if vTemMFD then
    iRetorno := EPSON_Obter_Dados_Usuario (pchar(vCNPJ))
  else
    vCNPJ := '';
  if vDadosIniF.vNumSerieEcf = 'EPMM0400000000000001' then
    Result := Trim(vDadosIniF.vEmp.vCNPJ)
  else
    result := trim(removeCaracteresCNPJ(copy(vCNPJ,1,18)));
end;

function TImpEpson.PrazoECF: boolean;
var
  vret: integer;
begin
  Result := true;
//  iRetorno := EPSON_Serial_Abrir_Porta(38400, Fvporta);
  AbrePortaS('');
  reimprime := '0';
  vacr := 1;
  while not Imprime_Prazo do
  begin
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if reimprime = '1' then
        FechaRelatorioGerencial
      else
        FechaComprovanteNaoFiscalVinculado;
      break;
    end
    else
    begin
      //tef      sTEFRetorno := '0';
      if reimprime = '1' then
      begin
        vret := FechaRelatorioGerencial;
        while vret <> 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaRelatorioGerencial
          else
          begin
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        //tef        if sTEFRetorno = '1' then
        break;
      end
      else
      begin
        vret := FechaComprovanteNaoFiscalVinculado;
        while vret <> 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaComprovanteNaoFiscalVinculado
          else
          begin
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        //tef        if sTEFRetorno = '1' then
        break;
        if vret <> 0 then
          reimprime := '1';
      end;
    end;
  end;
  EPSON_Serial_Fechar_Porta();
end;

function TImpEpson.ProgramaFormaPagamentoMFD(FormaPagto,
  OperacaoTef: string): boolean;
begin

end;

function TImpEpson.ProgramaHorarioVerao: boolean;
var
  vHorarioVeraoAtivado:boolean;
begin
  Result := False;
  iRetorno := EPSON_Obter_Estado_Horario_Verao(vHorarioVeraoAtivado);
  if not vHorarioVeraoAtivado then
  begin
    iRetorno := EPSON_Config_Horario_Verao();
    Analisa_iRetorno;
    result := Retorno_Impressora;
  end
  else
    Application.MessageBox('Horário de Verão já esta ativado','Atenção',0+64);

//  Analisa_iRetorno;
//  retorno_impGer(1);

//  if iRetorno = 0 then
//  result:= false;
end;

function TImpEpson.RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := EPSON_NaoFiscal_Abrir_Comprovante('', '', '', '', 1);
  if not Retorno_Impressora then
//  if iretorno <> 0 then
    result := False
  else
  begin
    iRetorno := EPSON_NaoFiscal_Vender_Item(pchar(indiceTotalizador), Pchar(Valor), 2);
    if not Retorno_Impressora then
      Result := False
    else
    begin
      iRetorno := EPSON_NaoFiscal_Pagamento(Pchar(DefCodFinalPrazo), Pchar(Valor), 2, '', '');
      if not Retorno_Impressora then
        Result := False
      else
      begin
        iRetorno := EPSON_NaoFiscal_Fechar_Comprovante(True);
        Result := Retorno_Impressora;
      end;
    end;
  end;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

procedure TImpEpson.recuperacaoAutomaticaAliquotas;
var
  iConta: Integer;
  szAliquotas: string;
  contTipo, contAliq, cont, contValor: integer;
  I: Integer;
  lista: TStrings;
  seq, aliq: string;
  vAliq: TAliquota;
begin
  for iConta := 1 to 553 do
    szAliquotas := szAliquotas + ' ';

  iRetorno := EPSON_Obter_Tabela_Aliquotas(pchar(szAliquotas));

  vAliq := TAliquota.create;
  vAliq.apagaAliquotas;

  cont := 1;
  contTipo := 1;
  contAliq := 3;
  contValor := 7;
  lista := TStrings.Create;

  for I := 1 to 24 do
  begin
    seq := copy(szAliquotas, contTipo, 2);
    aliq := copy(szAliquotas, contAliq, 4);
    if (seq = '00') or (aliq = '0000') or (trim(seq) = '') or (trim(aliq) = '') then
      Break;

    if pos('T', seq) > 0 then
      vAliq.incluiAliquota(seq, 'N', StrToFloat(copy(aliq, 1, 2) + ',' +
        copy(aliq, 3, 2)), i)
    else
      vAliq.incluiAliquota(seq, 'S', StrToFloat(copy(aliq, 1, 2) + ',' +
        copy(aliq, 3, 2)), i);

    inc(cont, 23);
    inc(contTipo, 23);
    inc(contAliq, 23);
    inc(contValor, 23);
  end;
  vAliq.Free;
  vAliq := nil;
end;

procedure TImpEpson.regconfPorta(vport: string);
begin
  //  inherited;

end;

function TImpEpson.RelatorioGerencial(Texto: string): Integer;
begin
  if EPSON_NaoFiscal_Imprimir_Linha(Pchar(texto)) = 0 then
    result := 0
  else
    result := 1;
end;

function TImpEpson.RelatorioGerencial2(Texto: string): Integer;
var
  vLn, vImp: string;
  vResult: Integer;
begin
  vResult := 1;
  Result := 1;
  vLn := Texto;
  while vResult = 1 do
  begin
    while Trim(vLn) <> '' do
    begin
      vImp := Copy(vLn,1,48);
      vResult := RelatorioGerencial(vImp);
      if vResult = 1 then
        Break;
      vLn := Copy(vLn,49,length(vLn));
    end;
    if vResult = 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        begin
          Result := 0;
          exit;
        end;
    end
    else Break;
  end;
end;

function TImpEpson.RelatorioTipo60Mestre: boolean;
var
  Arq: TextFile;
  vl: integer;
  Resp: string;
  iconta: integer;
  szcrz: string;
  szVBatual: string;
  szVBanterior: string;
  szCrzAnsi: AnsiString;
  tempValor: Real;
begin
  Result := true;
  if AbrePortaS('') then
  begin
    if Numeroserie = '' then
    begin
      FechaPortaSerial;
      Result := false;
      exit;
    end;
    for iConta := 1 to 15 do
      szVBatual := szVBatual + ' ';
    for iConta := 1 to 15 do
      szVBanterior := szVBanterior + ' ';
    iRetorno := EPSON_Obter_Venda_Bruta(PChar(szVBatual), PChar(szVBanterior));

    FvvendBR := vDadosIniF.StrZeroDec(strtoint(szVBatual), 15, 0);
    FvvendBr := copy(FvvendBr, 1, 13) + ',' + copy(FvvendBr, 14, 2);
    for iConta := 1 to 20 do
      szCRZ := szCRZ + ' ';

    szCRZ := '';
    for iConta := 1 to 70 do
      szCRZ := szCRZ + ' ';
    iRetorno := EPSON_Obter_Dados_Jornada(PChar(szCRZ));
    Fvcooini := trim(copy(szCRZ, 29, 6));
    Fvcoofin := trim(copy(szCRZ, 35, 6));
    szCRZ := '';
    for iConta := 1 to 100 do
      szCRZ := szCRZ + ' ';
    iRetorno := EPSON_Obter_Contadores(PChar(szCRZ));
    FvContRed := trim(copy(szCRZ, 7, 6));
    FvcontRein := trim(copy(szCRZ, 13, 6));
    szCRZ := '';
    for iConta := 1 to 20 do
      szCRZ := szCRZ + ' ';
    iRetorno := EPSON_Obter_GT(PChar(szCRZ));
    FvGrandT := vDadosIniF.tirapontos(szCRZ, 2);
    FvGrandT := vDadosIniF.StrZeroDec(strtoint(FvGrandT), 15, 0);
    FvGrandT := copy(FvGrandT, 1, 13) + ',' + copy(FvGrandT, 14, 2);
    FechaPortaSerial;
  end
  else
  begin
    Result := false;
    exit;
  end;
end;

function TImpEpson.retorno_Imp: boolean;
var
  iretorno: Integer;
  cNumeroSerie: string;
  iConta: integer;
  ST5, Temp: string;
  iST3, iST4, iST5: Integer;
  flagB15, flagB14, flagB12, flagB11, flagB10, flagB09, flagB07: Boolean;
begin
  Result := true;
  cNumeroSerie := '';
  for iConta := 1 to 110 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := EPSON_Obter_Dados_Impressora(PChar(cNumeroSerie));

  for iConta := 1 to 4 do
    ST5 := ST5 + ' ';

  for iConta := 1 to 20 do
    Temp := Temp + ' ';

  iRetorno := EPSON_Obter_Estado_Impressora(PChar(Temp));
  if iRetorno = 0 then
  begin
    ST5 := Copy(Temp, 17, 4);
    ST5 := UpperCase(ST5);
    iST5 := StrToInt('$' + ST5);
    if iST5 <> $0000 then
    begin
      vFVccancTef := 1;
      Retorno_Imp := false;
    end;
  end
  else
    Retorno_Imp := false;
end;

function TImpEpson.retorno_ImpGer(vflap: integer): boolean;
var
  iretorno: Integer;
  vflg: integer;
  vmens: string;
  iConta: integer;
  ST5, Temp: string;
  iST3, iST4, iST5: Integer;
begin
  Result := true;

  for iConta := 1 to 4 do
    ST5 := ST5 + ' ';

  for iConta := 1 to 20 do
    Temp := Temp + ' ';

  iRetorno := EPSON_Obter_Estado_Impressora(PChar(Temp));
  if iRetorno = 0 then
  begin
    ST5 := Copy(Temp, 17, 4);
    vflg := 0;
    ST5 := UpperCase(ST5);
    iST5 := StrToInt('$' + ST5);
    if iST5 = $0000 then
      result := true
    else
    begin
      case iST5 of
        $0001: vmens := 'Erro interno';
        $0002: vmens := 'Erro de iniciação do equipamento';
        $0003: vmens := 'Erro de processo interno';
        $0101: vmens := 'Comando inválido para o estado atual';
        $0102: vmens := 'Comando inválido para o documento atual';
        $0106: vmens := 'Comando aceito apenas fora de intervenção';
        $0107: vmens := 'Comando aceito apenas dentro de intervenção';
        $0108: vmens := 'Comando inválido durante processo de scan';
        $0109: vmens := 'Excesso de intervenções';
        $0201: vmens := 'Comando com frame inválido';
        $0202: vmens := 'Comando inválido';
        $0203: vmens := 'Campos em excesso';
        $0204: vmens := 'Campos em falta';
        $0205: vmens := 'Campo não opcional';
        $0206: vmens := 'Campo alfanumérico inválido';
        $0207: vmens := 'Campo alfabético inválido';
        $0208: vmens := 'Campo numérico inválido';
        $0209: vmens := 'Campo binário inválido';
        $020A: vmens := 'Campo imprimível inválido';
        $020B: vmens := 'Campo hexadecimal inválido';
        $020C: vmens := 'Campo data inválido';
        $020D: vmens := 'Campo hora inválido';
        $020E: vmens := 'Campo com atributos de impressão inválidos';
        $020F: vmens := 'Campo booleano inválido';
        $0210: vmens := 'Campo com tamanho inválido';
        $0211: vmens := 'Extensão de comando inválida';
        $0212: vmens := 'Código de barra não permitido';
        $0213: vmens := 'Atributos de impressão não permitidos';
        $0214: vmens := 'Atributos de impressão inválidos';
        $0215: vmens := 'Código de barras incorretamente definido';
        $0217: vmens := 'Comando invalido para a porta selecionada';
        $0301: vmens := 'Erro de hardware';
        $0302: vmens := 'Impressora não está pronta';
        $0303: vmens := 'Erro de Impressão';
        $0304: vmens := 'Falta de papel';
        $0305: vmens := 'Pouco papel disponível';
        $0306: vmens := 'Erro em carga ou expulsão do papel';
        $0307: vmens := 'Característica não suportada pela impressora';
        $0308: vmens := 'Erro de display';
        $0309: vmens := 'Seqüência de scan inválida';
        $300A: vmens := 'Número de área de recorte inválido';
        $300B: vmens := 'Scanner não preparado';
        $300C: vmens := 'Qualidade de Logotipo não suportada pela impressora';
        $030E: vmens := 'Erro de leitura do microcódigo';
        $0401: vmens := 'Número de série inválido';
        $0402: vmens := 'Requer dados de fiscalização já configurados';
        $0501: vmens := 'Data / Hora não configurada';
        $0502: vmens := 'Data inválida';
        $0503: vmens := 'Data em intervalo inválido';
        $0504: vmens := 'Nome operador inválido';
        $0505: vmens := 'Número de caixa inválido';
        $0508: vmens := 'Dados de Cabeçalho ou rodapé inválidos';
        $0509: vmens := 'Excesso de fiscalização';
        $500C: vmens := 'Número máximo de meios de pagamento já definidos';
        $050D: vmens := 'Meio de pagamento já definido';
        $050E: vmens := 'Meio de pagamento inválido';
        $050F: vmens := 'Descrição do meio de pagamento inválido';
        $0510: vmens := 'Valor máximo de desconto inválido';
        $0513: vmens := 'Logotipo do usuário inválido';
        $0514: vmens := 'Seqüência de logotipo inválido';
        $0515: vmens := 'Configuração de display inválida';
        $0516: vmens := 'Dados do MICR inválidos';
        $0517: vmens := 'Campo de endereço inválido';
        $0518: vmens := 'Nome da loja não definido';
        $0519: vmens := 'Dados fiscais não definidos';
        $510A: vmens := 'Número seqüencial do ECF inválido';
        $510B: vmens := 'Simbologia do GT inválida, devem ser todos diferentes';
        $510C: vmens := 'Número de CNPJ inválido';
        $051D: vmens := 'Senha de fiscalização inválida';
        $051E: vmens := 'Último documento deve ser uma redução Z';
        $051F: vmens := 'Símbolo da moeda igual ao atualmente cadastrado';
        $0520: vmens := 'Identificação da alíquota não cadastrada';
        $0521: vmens := 'Alíquota não cadastrada';
        $0601: vmens := 'Memória de Fita-detalhe esgotada';
        $0605: vmens := 'Número de série invalido para a Memória de Fita-detalhe';
        $0606: vmens := 'Memória de Fita-detalhe não iniciada';
        $0607: vmens := 'Memória de Fita-detalhe não pode estar iniciada';
        $0608: vmens := 'Número de série da Memória de Fita-detalhe não confere';
        $0609: vmens := 'Erro Interno na Memória de Fita-detalhe';
        $0701: vmens := 'Valor inválido para o número do registro';
        $0702: vmens := 'Valor inválido para o número do item';
        $0703: vmens := 'Intervalo inválido para a leitura da MFD';
        $0704: vmens := 'Número de usuário inválido para MFD';
        $0801: vmens := 'Comando inválido com jornada fiscal fechada';
        $0802: vmens := 'Comando inválido com jornada fiscal aberta';
        $0803: vmens := 'Memória Fiscal esgotada';
        $0804: vmens := 'Jornada fiscal deve ser fechada';
        $0805: vmens := 'Não há meios de pagamento definidos';
        $0806: vmens := 'Excesso de meios de pagamento utilizados na jornada fiscal';
        $0807: vmens := 'Jornada fiscal sem movimento de vendas';
        $0808: vmens := 'Intervalo de jornada fiscal inválido';
        $0809: vmens := 'Existem mais dados para serem lidos';
        $800A: vmens := 'Não existem mais dados para serem lidos';
        $800B: vmens := 'Não pode abrir jornada fiscal';
        $800C: vmens := 'Não pode fechar jornada fiscal';
        $080D: vmens := 'Limite máximo do período fiscal atingido';
        $080E: vmens := 'Limite máximo do período fiscal não atingido';
        $080F: vmens := 'Abertura da jornada fiscal não permitida';
        $0901: vmens := 'Valor muito grande';
        $0902: vmens := 'Valor muito pequeno';
        $0903: vmens := 'Itens em excesso';
        $0904: vmens := 'Alíquotas em excesso';
        $0905: vmens := 'Desconto ou acréscimos em excesso';
        $0906: vmens := 'Meios de pagamento em excesso';
        $0907: vmens := 'Item não encontrado';
        $0908: vmens := 'Meio de pagamento não encontrado';
        $0909: vmens := 'Total nulo';
        $900C: vmens := 'Tipo de pagamento não definido';
        $090F: vmens := 'Alíquota não encontrada';
        $0910: vmens := 'Alíquota inválida';
        $0911: vmens := 'Excesso de meios de pagamento com CDC';
        $0912: vmens := 'Meio de pagamento com CDC já emitido';
        $0913: vmens := 'Meio de pagamento com CDC ainda não emitido';
        $0914: vmens := 'Leitura da Memória Fiscal – intervalo CRZ inválido';
        $0915: vmens := 'Leitura da Memória Fiscal – intervalo de data inválido';
        $0A01: vmens := 'Operação não permitida após desconto / acréscimo';
        $0A02: vmens := 'Operação não permitida após registro de pagamentos';
        $0A03: vmens := 'Tipo de item inválido';
        $0A04: vmens := 'Linha de descrição em branco';
        $0A05: vmens := 'Quantidade muito pequena';
        $0A06: vmens := 'Quantidade muito grande';
        $0A07: vmens := 'Total do item com valor muito alto';
        $0A08: vmens := 'Operação não permitida antes do registro de pagamentos';
        $0A09: vmens := 'Registro de pagamento incompleto';
        $0A0A: vmens := 'Registro de pagamento finalizado';
        $0A0B: vmens := 'Valor pago inválido';
        $0A0C: vmens := 'Valor de desconto ou acréscimo não permitido';
        $0A0E: vmens := 'Valor não pode ser zero';
        $0A0F: vmens := 'Operação não permitida antes do registro de itens';
        $0A11: vmens := 'Cancelamento de desconto e acréscimo somente para item atual';
        $0A12: vmens := 'Não foi possível cancelar último Cupom Fiscal';
        $0A13: vmens := 'Último Cupom Fiscal não encontrado';
        $0A14: vmens := 'Último Comprovante Não-Fiscal não encontrado';
        $0A15: vmens := 'Cancelamento de CDC necessária';
        $0A16: vmens := 'Número de item em Cupom Fiscal inválido';
        $0A17: vmens := 'Operação somente permitida após subtotalização';
        $0A18: vmens := 'Operação somente permitida durante a venda de itens';
        $0A19: vmens := 'Operação não permitida em item com desconto ou acréscimo';
        $0A1A: vmens := 'Dígitos de quantidade inválidos';
        $0A1B: vmens := 'Dígitos de valor unitário inválido';
        $0A1C: vmens := 'Não há desconto ou acréscimo a cancelar';
        $0A1D: vmens := 'Não há item para cancelar';
        $0A1E: vmens := 'Desconto ou acréscimo somente no item atual';
        $0A1F: vmens := 'Desconto ou acréscimo já efetuado';
        $0A20: vmens := 'Desconto ou acréscimo nulo não permitido';
        $0A21: vmens := 'Valor unitário inválido';
        $0A22: vmens := 'Quantidade inválida';
        $0A23: vmens := 'Código de item inválido';
        $0A24: vmens := 'Descrição inválida';
        $0A25: vmens := 'Operação de desconto ou acréscimo não permitida';
        $0A26: vmens := 'Mensagem promocional já impressa';
        $0A27: vmens := 'Linhas adicionais não podem ser impressas';
        $0A28: vmens := 'Dados do consumidor já impresso';
        $0A29: vmens := 'Dados do consumidor somente no fim do documento';
        $0A2A: vmens := 'Dados do consumidor somente no inicio do documento';
        $0A2B: vmens := 'Comando Inválido para o item';
        $0E01: vmens := 'Número de linhas em documento excedido';
        $0E02: vmens := 'Número do relatório inválido';
        $0E03: vmens := 'Operação não permitida após registro de itens';
        $0E04: vmens := 'Registro de valor nulo não permitido';
        $0E05: vmens := 'Não há desconto a cancelar';
        $0E06: vmens := 'Não há acréscimo a cancelar';
        $0E07: vmens := 'Operação somente permitida após subtotalização';
        $0E08: vmens := 'Operação somente permitida durante registro de itens';
        $0E09: vmens := 'Operação não-fiscal inválida';
        $0E0A: vmens := 'Último comprovante Não-Fiscal não encontrado';
        $0E0B: vmens := 'Meio de pagamento não encontrado';
        $0E0C: vmens := 'Não foi possível imprimir nova via';
        $0E0D: vmens := 'Não foi possível realizar reimpressão';
        $0E0E: vmens := 'Não foi possível imprimir nova parcela';
        $0E0F: vmens := 'Não há mais parcelas a imprimir';
        $0E10: vmens := 'Registro de item Não-Fiscal inválido';
        $0E11: vmens := 'Desconto ou acréscimo já efetuado';
        $0E12: vmens := 'Valor de desconto ou acréscimo inválido';
        $0E13: vmens := 'Não foi possível cancelar o item';
        $0E14: vmens := 'Itens em excesso';
        $0E15: vmens := 'Operação Não-Fiscal não cadastrada';
        $0E16: vmens := 'Excesso de relatórios / operações não-fiscais cadastradas';
        $0E17: vmens := 'Relatório não encontrado';
        $0E18: vmens := 'Comando não permitido';
        $0E19: vmens :=
          'Comando não permitido em operações não-fiscais para movimento de monetário';
        $0E1A: vmens :=
          'Comando permitido apenas em operações não-fiscais para movimento de monetário';
        $0E1B: vmens := 'Número de parcelas inválido para a emissão de CCD';
        $0E1C: vmens := 'Operação não fiscal já cadastrada';
        $0E1D: vmens := 'Relatório gerencial já cadastrado';
        $0E1E: vmens := 'Relatório Gerencial Inválido';
        $3001: vmens := 'Configuração de cheque não registrada';
        $3002: vmens := 'Configuração de cheque não encontrada';
        $3003: vmens := 'Valor do cheque já impresso';
        $3004: vmens := 'Nominal ao cheque já impresso';
        $3005: vmens := 'Linhas adicionais no cheque já impresso';
        $3006: vmens := 'Autenticação já impressa';
        $3007: vmens := 'Número máximo de autenticações já impresso';
      else vmens := 'Erro desconhecido';
      end;
      if vflap = 1 then
        messagedlg(vmens, mtinformation, [mbOK], 0);
      result := false;
      vflg := 1;
    end;
  end
  else
    result := false;
end;

function TImpEpson.Retorno_Impressora:boolean;
var
  ST1err, ST1field, ST2, ST3, ST4, ST5, Temp: string;
  iST3, iST4, iST5, iConta, ret: Integer;
  flagB15, flagB14, flagB12, flagB11, flagB10, flagB09, flagB07: Boolean;
begin
  try
    ST1err := '';
    ST1field := '';
    ST2 := '';
    ST3 := '';
    ST4 := '';
    ST5 := '';
    Temp := '';
                         
    for iConta := 1 to 20 do
      Temp := Temp + ' ';

    for iConta := 1 to 2 do
      ST1err := ST1err + ' ';

    for iConta := 1 to 2 do
      ST1field := ST1field + ' ';

    for iConta := 1 to 4 do
      ST2 := ST2 + ' ';

    for iConta := 1 to 4 do
      ST3 := ST3 + ' ';

    for iConta := 1 to 4 do
      ST4 := ST4 + ' ';

    for iConta := 1 to 4 do
      ST5 := ST5 + ' ';

    vRetornoDll.estadoComunicacao := '';
    vRetornoDll.estadoImpressora := '';
    vRetornoDll.estadoFiscal := '';
    vRetornoDll.estadoFuncao := '';
    vRetornoDll.retornoFuncao := '';
  except
  end;

  ret := EPSON_Obter_Estado_Impressora(PChar(Temp));

  if ret <> 0 then
    vRetornoDll.retornoFuncao := 'ERRO'
  else
  begin
    if iRetorno <> 0 then
      vRetornoDll.retornoFuncao := 'ERRO'
    else
      vRetornoDll.retornoFuncao := 'OK';

    ST1err := Copy(Temp, 1, 2);
    ST1field := Copy(Temp, 3, 2);
    ST2 := Copy(Temp, 5, 4);
    ST3 := Copy(Temp, 9, 4);
    ST4 := Copy(Temp, 13, 4);
    ST5 := Copy(Temp, 17, 4);

    //==============================================================================
    //Parâmetros do último comando
    //==============================================================================
//    case StrToInt(ST1err) of
//      0: T2.Text := 'Campos sem erro.';
//      1: T2.Text := 'Campo deve ser um ponteiro para string.';
//      2: T2.Text := 'String com data inválida.';
//      3: T2.Text := 'String com hora inválida.';
//      4: T2.Text := 'String não está vazia ou contém data inválida.';
//      5: T2.Text := 'String não está vazia ou contém hora inválida.';
//      6: T2.Text := 'String não pode ser vazia.';
//    else T2.Text := 'Erro não mapeado.';
//    end;
//
//    if StrToInt(ST1err) <> 0 then
//      T2.Text := T2.Text + ' - Campo com erro: ' + ST1field;

    //==============================================================================
    //Estado da Comunicação
    //==============================================================================
    case StrToInt('$' + ST2) of
      0: vRetornoDll.estadoComunicacao := 'Porta aberta com sucesso.';
      1: vRetornoDll.estadoComunicacao := 'Porta já está aberta.';
      2: vRetornoDll.estadoComunicacao := 'Porta usada por outra aplicação.';
      4: vRetornoDll.estadoComunicacao := 'Número de porta inválido.';
      5: vRetornoDll.estadoComunicacao := 'Velocidade inválida.';
      16: vRetornoDll.estadoComunicacao := 'String não está vazia ou contém hora inválida.';
    else vRetornoDll.estadoComunicacao := 'Erro interno da biblioteca.';
    end;

    //==============================================================================
    //Estado da Impressora
    //==============================================================================
    flagB09 := false;
    flagB10 := false;
    vRetornoDll.estadoImpressora := '';
    iST3 := StrToInt('$' + ST3);
    //****************************************************************************
    //                       TRATAMENTO DO BIT 15                                *
    //****************************************************************************
    if (iST3 >= 32768) then
    begin
      vRetornoDll.estadoImpressora := 'Impressora(Offline) - ';
      iST3 := iST3 - 32768;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 14                                *
    //****************************************************************************
    if (iST3 >= 16384) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Erro de impressão - ';
      iST3 := iST3 - 16384;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 13                                *
    //****************************************************************************
    if (iST3 >= 8192) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Tampa superior aberta - ';
      iST3 := iST3 - 8192;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 12                                *
    //****************************************************************************
    if (iST3 >= 4096) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Estado da gaveta = 1 - ';
      iST3 := iST3 - 4096;
    end;

    //****************************************************************************
    //                       TRATAMENTO DOS BITS 10 E 9                          *
    //****************************************************************************
    if (iST3 >= 1024) then
    begin
      flagB10 := true;
      iST3 := iST3 - 1024;
    end;

    if (iST3 >= 512) then
    begin
      flagB09 := true;
      iST3 := iST3 - 512;
    end;

    if ((flagB10 = True) and (flagB09 = True)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Leitura do MICR - '
    else if ((flagB10 = True) and (flagB09 = False)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Estação Autenticação (TMH6000 e TMU675) - '
    else if ((flagB10 = False) and (flagB09 = True)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Estação cheque - '
    else if ((flagB10 = False) and (flagB09 = False)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Impressora Online - ';

    //****************************************************************************
    //                       TRATAMENTO DO BIT 8                                 *
    //****************************************************************************
    if (iST3 >= 256) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Aguardando retirada do papel - ';
      iST3 := iST3 - 256;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 7                                 *
    //****************************************************************************
    if (iST3 >= 128) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Aguardando inserção do papel - ';
      iST3 := iST3 - 128;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 6                                 *
    //****************************************************************************
    if (iST3 >= 64) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Estado do sensor inferior da estação de cheque = 1 - ';
      iST3 := iST3 - 64;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 5                                 *
    //****************************************************************************
    if (iST3 >= 32) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Estado do sensor superior da estação do cheque = 1 - ';
      iST3 := iST3 - 32;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 4                                 *
    //****************************************************************************
    if (iST3 >= 16) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Estado do sensor de autenticação = 1 - ';
      iST3 := iST3 - 16;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 3                                 *
    //****************************************************************************
    if (iST3 >= 8) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Sem papel - ';
      iST3 := iST3 - 8;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 2                                 *
    //****************************************************************************
    if (iST3 >= 4) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Pouco papel - ';
      iST3 := iST3 - 4;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 1                                 *
    //****************************************************************************
    if (iST3 >= 2) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Sem papel - ';
      iST3 := iST3 - 2;
    end;

    //****************************************************************************
    //                       TRATAMENTO DO BIT 0                                 *
    //****************************************************************************
    if (iST3 >= 1) then
    begin
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Pouco papel - ';
    end;

    //==============================================================================
    //Estado fiscal
    //==============================================================================
    flagB15 := false;
    flagB14 := false;
    flagB11 := false;
    flagB10 := false;
    vRetornoDll.estadoFiscal := '';

    iST4 := StrToInt('$' + ST4);

    //****************************************************************************
    //                       TRATAMENTO DOS BITS 15 E 14                         *
    //****************************************************************************
    if (iST4 >= 32768) then
    begin
      flagB15 := true;
      iST4 := iST4 - 32768;
    end;

    if (iST4 >= 16384) then
    begin
      flagB14 := true;
      iST4 := iST4 - 16384;
    end;

    if ((flagB15 = True) and (flagB14 = True)) then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Modo Fiscalizado - '
    else if ((flagB15 = True) and (flagB14 = False)) then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Modo manufatura (Não-Fiscalizado) - '
    else if ((flagB15 = False) and (flagB14 = False)) then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Modo bloqueado - ';
    //****************************************************************************

    //****************************************************************************
    //                           TRATAMENTO DO BITS 12                           *
    //****************************************************************************
    if (iST4 >= 4096) then
    begin
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Modo de Intervenção Técnica - ';
      iST4 := iST4 - 4096;
    end
    else
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Modo de operação normal - ';
    //****************************************************************************

    //****************************************************************************
    //                       TRATAMENTO DOS BITS 11 E 10                         *
    //****************************************************************************
    if (iST4 >= 2048) then
    begin
      flagB11 := true;
      iST4 := iST4 - 2048;
    end;

    if (iST4 >= 1024) then
    begin
      flagB10 := true;
      iST4 := iST4 - 1024;
    end;

    if ((flagB11 = True) and (flagB10 = True)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Erro de leitura/escrita da Memória Fiscal - '
    else if ((flagB11 = True) and (flagB10 = False)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Memória Fiscal cheia - '
    else if ((flagB11 = False) and (flagB10 = True)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Memória Fiscal em esgotamento - '
    else if ((flagB11 = False) and (flagB10 = False)) then
      vRetornoDll.estadoImpressora := vRetornoDll.estadoImpressora + 'Memória Fiscal em operação normal - ';
    //****************************************************************************

    //****************************************************************************
    //                           TRATAMENTO DO BIT7                              *
    //****************************************************************************
    if (iST4 >= 128) then
    begin
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Período de vendas aberto - ';
      iST4 := iST4 - 128;
    end
    else
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Período de vendas fechado - ';
    //****************************************************************************

    //****************************************************************************
    //                       TRATAMENTO DOS BITS 3,2,1 E 0                       *
    //****************************************************************************
    if iST4 = 9 then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Cheque ou autenticação (TMH6000 e TMU675) - '
    else if iST4 = 8 then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Comprovante Não-Fiscal - '
    else if iST4 = 4 then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Relatório Gerencial - '
    else if iST4 = 3 then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Estorno de Comprovante de Crédito ou Débito - '
    else if iST4 = 2 then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Comprovante de Crédito ou Débito - '
    else if iST4 = 1 then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Cupom Fiscal aberto - '
    else if iST4 = 0 then
      vRetornoDll.estadoFiscal := vRetornoDll.estadoFiscal + 'Documento fechado - ';
    //****************************************************************************

    //==============================================================================
    //Estado de execução do último comando
    //==============================================================================
    ST5 := UpperCase(ST5);
    vRetornoDll.retornoFuncao := 'ERRO';
    iST5 := StrToInt('$' + ST5);
    case iST5 of
      $0000:
      begin
        vRetornoDll.estadoFuncao := 'Resultado sem erro';
        vRetornoDll.retornoFuncao := 'OK';
      end;
      $0001: vRetornoDll.estadoFuncao := 'Erro interno';
      $0002: vRetornoDll.estadoFuncao := 'Erro de iniciação do equipamento';
      $0003: vRetornoDll.estadoFuncao := 'Erro de processo interno';
      $0101: vRetornoDll.estadoFuncao := 'Comando inválido para o estado atual';
      $0102: vRetornoDll.estadoFuncao := 'Comando inválido para o documento atual';
      $0106: vRetornoDll.estadoFuncao := 'Comando aceito apenas fora de intervenção';
      $0107: vRetornoDll.estadoFuncao := 'Comando aceito apenas dentro de intervenção';
      $0108: vRetornoDll.estadoFuncao := 'Comando inválido durante processo de scan';
      $0109: vRetornoDll.estadoFuncao := 'Excesso de intervenções';
      $0201: vRetornoDll.estadoFuncao := 'Comando com frame inválido';
      $0202: vRetornoDll.estadoFuncao := 'Comando inválido';
      $0203: vRetornoDll.estadoFuncao := 'Campos em excesso';
      $0204: vRetornoDll.estadoFuncao := 'Campos em falta';
      $0205: vRetornoDll.estadoFuncao := 'Campo não opcional';
      $0206: vRetornoDll.estadoFuncao := 'Campo alfanumérico inválido';
      $0207: vRetornoDll.estadoFuncao := 'Campo alfabético inválido';
      $0208: vRetornoDll.estadoFuncao := 'Campo numérico inválido';
      $0209: vRetornoDll.estadoFuncao := 'Campo binário inválido';
      $020A: vRetornoDll.estadoFuncao := 'Campo imprimível inválido';
      $020B: vRetornoDll.estadoFuncao := 'Campo hexadecimal inválido';
      $020C: vRetornoDll.estadoFuncao := 'Campo data inválido';
      $020D: vRetornoDll.estadoFuncao := 'Campo hora inválido';
      $020E: vRetornoDll.estadoFuncao := 'Campo com atributos de impressão inválidos';
      $020F: vRetornoDll.estadoFuncao := 'Campo booleano inválido';
      $0210: vRetornoDll.estadoFuncao := 'Campo com tamanho inválido';
      $0211: vRetornoDll.estadoFuncao := 'Extensão de comando inválida';
      $0212: vRetornoDll.estadoFuncao := 'Código de barra não permitido';
      $0213: vRetornoDll.estadoFuncao := 'Atributos de impressão não permitidos';
      $0214: vRetornoDll.estadoFuncao := 'Atributos de impressão inválidos';
      $0215: vRetornoDll.estadoFuncao := 'Código de barras incorretamente definido';
      $0217: vRetornoDll.estadoFuncao := 'Comando invalido para a porta selecionada';
      $0301: vRetornoDll.estadoFuncao := 'Erro de hardware';
      $0302: vRetornoDll.estadoFuncao := 'Impressora não está pronta';
      $0303: vRetornoDll.estadoFuncao := 'Erro de Impressão';
      $0304: vRetornoDll.estadoFuncao := 'Falta de papel';
      $0305: vRetornoDll.estadoFuncao := 'Pouco papel disponível';
      $0306: vRetornoDll.estadoFuncao := 'Erro em carga ou expulsão do papel';
      $0307: vRetornoDll.estadoFuncao := 'Característica não suportada pela impressora';
      $0308: vRetornoDll.estadoFuncao := 'Erro de display';
      $0309: vRetornoDll.estadoFuncao := 'Seqüência de scan inválida';
      $300A: vRetornoDll.estadoFuncao := 'Número de área de recorte inválido';
      $300B: vRetornoDll.estadoFuncao := 'Scanner não preparado';
      $300C: vRetornoDll.estadoFuncao := 'Qualidade de Logotipo não suportada pela impressora';
      $030E: vRetornoDll.estadoFuncao := 'Erro de leitura do microcódigo';
      $0401: vRetornoDll.estadoFuncao := 'Número de série inválido';
      $0402: vRetornoDll.estadoFuncao := 'Requer dados de fiscalização já configurados';
      $0501: vRetornoDll.estadoFuncao := 'Data / Hora não configurada';
      $0502: vRetornoDll.estadoFuncao := 'Data inválida';
      $0503: vRetornoDll.estadoFuncao := 'Data em intervalo inválido';
      $0504: vRetornoDll.estadoFuncao := 'Nome operador inválido';
      $0505: vRetornoDll.estadoFuncao := 'Número de caixa inválido';
      $0508: vRetornoDll.estadoFuncao := 'Dados de Cabeçalho ou rodapé inválidos';
      $0509: vRetornoDll.estadoFuncao := 'Excesso de fiscalização';
      $500C: vRetornoDll.estadoFuncao := 'Número máximo de meios de pagamento já definidos';
      $050D: vRetornoDll.estadoFuncao := 'Meio de pagamento já definido';
      $050E: vRetornoDll.estadoFuncao := 'Meio de pagamento inválido';
      $050F: vRetornoDll.estadoFuncao := 'Descrição do meio de pagamento inválido';
      $0510: vRetornoDll.estadoFuncao := 'Valor máximo de desconto inválido';
      $0513: vRetornoDll.estadoFuncao := 'Logotipo do usuário inválido';
      $0514: vRetornoDll.estadoFuncao := 'Seqüência de logotipo inválido';
      $0515: vRetornoDll.estadoFuncao := 'Configuração de display inválida';
      $0516: vRetornoDll.estadoFuncao := 'Dados do MICR inválidos';
      $0517: vRetornoDll.estadoFuncao := 'Campo de endereço inválido';
      $0518: vRetornoDll.estadoFuncao := 'Nome da loja não definido';
      $0519: vRetornoDll.estadoFuncao := 'Dados fiscais não definidos';
      $510A: vRetornoDll.estadoFuncao := 'Número seqüencial do ECF inválido';
      $510B: vRetornoDll.estadoFuncao := 'Simbologia do GT inválida, devem ser todos diferentes';
      $510C: vRetornoDll.estadoFuncao := 'Número de CNPJ inválido';
      $051D: vRetornoDll.estadoFuncao := 'Senha de fiscalização inválida';
      $051E: vRetornoDll.estadoFuncao := 'Último documento deve ser uma redução Z';
      $051F: vRetornoDll.estadoFuncao := 'Símbolo da moeda igual ao atualmente cadastrado';
      $0520: vRetornoDll.estadoFuncao := 'Identificação da alíquota não cadastrada';
      $0521: vRetornoDll.estadoFuncao := 'Alíquota não cadastrada';
      $0601: vRetornoDll.estadoFuncao := 'Memória de Fita-detalhe esgotada';
      $0605: vRetornoDll.estadoFuncao := 'Número de série invalido para a Memória de Fita-detalhe';
      $0606: vRetornoDll.estadoFuncao := 'Memória de Fita-detalhe não iniciada';
      $0607: vRetornoDll.estadoFuncao := 'Memória de Fita-detalhe não pode estar iniciada';
      $0608: vRetornoDll.estadoFuncao := 'Número de série da Memória de Fita-detalhe não confere';
      $0609: vRetornoDll.estadoFuncao := 'Erro Interno na Memória de Fita-detalhe';
      $0701: vRetornoDll.estadoFuncao := 'Valor inválido para o número do registro';
      $0702: vRetornoDll.estadoFuncao := 'Valor inválido para o número do item';
      $0703: vRetornoDll.estadoFuncao := 'Intervalo inválido para a leitura da MFD';
      $0704: vRetornoDll.estadoFuncao := 'Número de usuário inválido para MFD';
      $0801: vRetornoDll.estadoFuncao := 'Comando inválido com jornada fiscal fechada';
      $0802: vRetornoDll.estadoFuncao := 'Comando inválido com jornada fiscal aberta';
      $0803: vRetornoDll.estadoFuncao := 'Memória Fiscal esgotada';
      $0804: vRetornoDll.estadoFuncao := 'Jornada fiscal deve ser fechada';
      $0805: vRetornoDll.estadoFuncao := 'Não há meios de pagamento definidos';
      $0806: vRetornoDll.estadoFuncao := 'Excesso de meios de pagamento utilizados na jornada fiscal';
      $0807: vRetornoDll.estadoFuncao := 'Jornada fiscal sem movimento de vendas';
      $0808: vRetornoDll.estadoFuncao := 'Intervalo de jornada fiscal inválido';
      $0809: vRetornoDll.estadoFuncao := 'Existem mais dados para serem lidos';
      $800A: vRetornoDll.estadoFuncao := 'Não existem mais dados para serem lidos';
      $800B: vRetornoDll.estadoFuncao := 'Não pode abrir jornada fiscal';
      $800C: vRetornoDll.estadoFuncao := 'Não pode fechar jornada fiscal';
      $080D: vRetornoDll.estadoFuncao := 'Limite máximo do período fiscal atingido';
      $080E: vRetornoDll.estadoFuncao := 'Limite máximo do período fiscal não atingido';
      $080F: vRetornoDll.estadoFuncao := 'Abertura da jornada fiscal não permitida';
      $0901: vRetornoDll.estadoFuncao := 'Valor muito grande';
      $0902: vRetornoDll.estadoFuncao := 'Valor muito pequeno';
      $0903: vRetornoDll.estadoFuncao := 'Itens em excesso';
      $0904: vRetornoDll.estadoFuncao := 'Alíquotas em excesso';
      $0905: vRetornoDll.estadoFuncao := 'Desconto ou acréscimos em excesso';
      $0906: vRetornoDll.estadoFuncao := 'Meios de pagamento em excesso';
      $0907: vRetornoDll.estadoFuncao := 'Item não encontrado';
      $0908: vRetornoDll.estadoFuncao := 'Meio de pagamento não encontrado';
      $0909: vRetornoDll.estadoFuncao := 'Total nulo';
      $900C: vRetornoDll.estadoFuncao := 'Tipo de pagamento não definido';
      $090F: vRetornoDll.estadoFuncao := 'Alíquota não encontrada';
      $0910: vRetornoDll.estadoFuncao := 'Alíquota inválida';
      $0911: vRetornoDll.estadoFuncao := 'Excesso de meios de pagamento com CDC';
      $0912: vRetornoDll.estadoFuncao := 'Meio de pagamento com CDC já emitido';
      $0913: vRetornoDll.estadoFuncao := 'Meio de pagamento com CDC ainda não emitido';
      $0914: vRetornoDll.estadoFuncao := 'Leitura da Memória Fiscal – intervalo CRZ inválido';
      $0915: vRetornoDll.estadoFuncao := 'Leitura da Memória Fiscal – intervalo de data inválido';
      $0A01: vRetornoDll.estadoFuncao := 'Operação não permitida após desconto / acréscimo';
      $0A02: vRetornoDll.estadoFuncao := 'Operação não permitida após registro de pagamentos';
      $0A03: vRetornoDll.estadoFuncao := 'Tipo de item inválido';
      $0A04: vRetornoDll.estadoFuncao := 'Linha de descrição em branco';
      $0A05: vRetornoDll.estadoFuncao := 'Quantidade muito pequena';
      $0A06: vRetornoDll.estadoFuncao := 'Quantidade muito grande';
      $0A07: vRetornoDll.estadoFuncao := 'Total do item com valor muito alto';
      $0A08: vRetornoDll.estadoFuncao := 'Operação não permitida antes do registro de pagamentos';
      $0A09: vRetornoDll.estadoFuncao := 'Registro de pagamento incompleto';
      $0A0A: vRetornoDll.estadoFuncao := 'Registro de pagamento finalizado';
      $0A0B: vRetornoDll.estadoFuncao := 'Valor pago inválido';
      $0A0C: vRetornoDll.estadoFuncao := 'Valor de desconto ou acréscimo não permitido';
      $0A0E: vRetornoDll.estadoFuncao := 'Valor não pode ser zero';
      $0A0F: vRetornoDll.estadoFuncao := 'Operação não permitida antes do registro de itens';
      $0A11: vRetornoDll.estadoFuncao := 'Cancelamento de desconto e acréscimo somente para item atual';
      $0A12: vRetornoDll.estadoFuncao := 'Não foi possível cancelar último Cupom Fiscal';
      $0A13: vRetornoDll.estadoFuncao := 'Último Cupom Fiscal não encontrado';
      $0A14: vRetornoDll.estadoFuncao := 'Último Comprovante Não-Fiscal não encontrado';
      $0A15: vRetornoDll.estadoFuncao := 'Cancelamento de CDC necessária';
      $0A16: vRetornoDll.estadoFuncao := 'Número de item em Cupom Fiscal inválido';
      $0A17: vRetornoDll.estadoFuncao := 'Operação somente permitida após subtotalização';
      $0A18: vRetornoDll.estadoFuncao := 'Operação somente permitida durante a venda de itens';
      $0A19: vRetornoDll.estadoFuncao := 'Operação não permitida em item com desconto ou acréscimo';
      $0A1A: vRetornoDll.estadoFuncao := 'Dígitos de quantidade inválidos';
      $0A1B: vRetornoDll.estadoFuncao := 'Dígitos de valor unitário inválido';
      $0A1C: vRetornoDll.estadoFuncao := 'Não há desconto ou acréscimo a cancelar';
      $0A1D: vRetornoDll.estadoFuncao := 'Não há item para cancelar';
      $0A1E: vRetornoDll.estadoFuncao := 'Desconto ou acréscimo somente no item atual';
      $0A1F: vRetornoDll.estadoFuncao := 'Desconto ou acréscimo já efetuado';
      $0A20: vRetornoDll.estadoFuncao := 'Desconto ou acréscimo nulo não permitido';
      $0A21: vRetornoDll.estadoFuncao := 'Valor unitário inválido';
      $0A22: vRetornoDll.estadoFuncao := 'Quantidade inválida';
      $0A23: vRetornoDll.estadoFuncao := 'Código de item inválido';
      $0A24: vRetornoDll.estadoFuncao := 'Descrição inválida';
      $0A25: vRetornoDll.estadoFuncao := 'Operação de desconto ou acréscimo não permitida';
      $0A26: vRetornoDll.estadoFuncao := 'Mensagem promocional já impressa';
      $0A27: vRetornoDll.estadoFuncao := 'Linhas adicionais não podem ser impressas';
      $0A28: vRetornoDll.estadoFuncao := 'Dados do consumidor já impresso';
      $0A29: vRetornoDll.estadoFuncao := 'Dados do consumidor somente no fim do documento';
      $0A2A: vRetornoDll.estadoFuncao := 'Dados do consumidor somente no inicio do documento';
      $0A2B: vRetornoDll.estadoFuncao := 'Comando Inválido para o item';
      $0E01: vRetornoDll.estadoFuncao := 'Número de linhas em documento excedido';
      $0E02: vRetornoDll.estadoFuncao := 'Número do relatório inválido';
      $0E03: vRetornoDll.estadoFuncao := 'Operação não permitida após registro de itens';
      $0E04: vRetornoDll.estadoFuncao := 'Registro de valor nulo não permitido';
      $0E05: vRetornoDll.estadoFuncao := 'Não há desconto a cancelar';
      $0E06: vRetornoDll.estadoFuncao := 'Não há acréscimo a cancelar';
      $0E07: vRetornoDll.estadoFuncao := 'Operação somente permitida após subtotalização';
      $0E08: vRetornoDll.estadoFuncao := 'Operação somente permitida durante registro de itens';
      $0E09: vRetornoDll.estadoFuncao := 'Operação não-fiscal inválida';
      $0E0A: vRetornoDll.estadoFuncao := 'Último comprovante Não-Fiscal não encontrado';
      $0E0B: vRetornoDll.estadoFuncao := 'Meio de pagamento não encontrado';
      $0E0C: vRetornoDll.estadoFuncao := 'Não foi possível imprimir nova via';
      $0E0D: vRetornoDll.estadoFuncao := 'Não foi possível realizar reimpressão';
      $0E0E: vRetornoDll.estadoFuncao := 'Não foi possível imprimir nova parcela';
      $0E0F: vRetornoDll.estadoFuncao := 'Não há mais parcelas a imprimir';
      $0E10: vRetornoDll.estadoFuncao := 'Registro de item Não-Fiscal inválido';
      $0E11: vRetornoDll.estadoFuncao := 'Desconto ou acréscimo já efetuado';
      $0E12: vRetornoDll.estadoFuncao := 'Valor de desconto ou acréscimo inválido';
      $0E13: vRetornoDll.estadoFuncao := 'Não foi possível cancelar o item';
      $0E14: vRetornoDll.estadoFuncao := 'Itens em excesso';
      $0E15: vRetornoDll.estadoFuncao := 'Operação Não-Fiscal não cadastrada';
      $0E16: vRetornoDll.estadoFuncao := 'Excesso de relatórios / operações não-fiscais cadastradas';
      $0E17: vRetornoDll.estadoFuncao := 'Relatório não encontrado';
      $0E18: vRetornoDll.estadoFuncao := 'Comando não permitido';
      $0E19: vRetornoDll.estadoFuncao :=
        'Comando não permitido em operações não-fiscais para movimento de monetário';
      $0E1A: vRetornoDll.estadoFuncao :=
        'Comando permitido apenas em operações não-fiscais para movimento de monetário';
      $0E1B: vRetornoDll.estadoFuncao := 'Número de parcelas inválido para a emissão de CCD';
      $0E1C: vRetornoDll.estadoFuncao := 'Operação não fiscal já cadastrada';
      $0E1D: vRetornoDll.estadoFuncao := 'Relatório gerencial já cadastrado';
      $0E1E: vRetornoDll.estadoFuncao := 'Relatório Gerencial Inválido';
      $3001: vRetornoDll.estadoFuncao := 'Configuração de cheque não registrada';
      $3002: vRetornoDll.estadoFuncao := 'Configuração de cheque não encontrada';
      $3003: vRetornoDll.estadoFuncao := 'Valor do cheque já impresso';
      $3004: vRetornoDll.estadoFuncao := 'Nominal ao cheque já impresso';
      $3005: vRetornoDll.estadoFuncao := 'Linhas adicionais no cheque já impresso';
      $3006: vRetornoDll.estadoFuncao := 'Autenticação já impressa';
      $3007: vRetornoDll.estadoFuncao := 'Número máximo de autenticações já impresso';
    else vRetornoDll.estadoFuncao := 'Erro desconhecido';
    end;
    //==============================================================================
  end;
  Result := vRetornoDll.retornoFuncao = 'OK';
  vDadosIniF.abreFormRetornoImpressora;
//  T1.Text := funcName;
end;

function TImpEpson.Retorno_impTEF: boolean;
var
  iretorno: Integer;
  cNumeroSerie: string;
  iConta: integer;
  ST5, Temp: string;
  iST3, iST4, iST5: Integer;
  flagB15, flagB14, flagB12, flagB11, flagB10, flagB09, flagB07: Boolean;
begin
  Result := true;

  for iConta := 1 to 4 do
    ST5 := ST5 + ' ';

  for iConta := 1 to 20 do
    Temp := Temp + ' ';

  iRetorno := EPSON_Obter_Estado_Impressora(PChar(Temp));
  if iRetorno = 0 then
  begin
    ST5 := Copy(Temp, 17, 4);
    ST5 := UpperCase(ST5);
    iST5 := StrToInt('$' + ST5);
    if iST5 <> $0000 then
    begin
      FVccancTef := 1;
      vcanctef := 1;
      Retorno_ImpTEF := false;
    end;
  end
  else
    Retorno_ImpTEF := false;
end;

function TImpEpson.RetornoImpressora(var ACK, ST1, ST2: Integer): boolean;
begin

end;

function TImpEpson.Sangria(Valor: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := EPSON_NaoFiscal_Sangria(Pchar(valor), 2);
//  if iretorno <> 0 then
//    result := false;
  Analisa_iRetorno;
  Result := Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpEpson.SubTotal: string;
var
  vlrultc: string;
  iConta: integer;
begin
  vlrultc := '';
  for iConta := 1 to 20 do begin vlrultc := vlrultc + ' '
  end;
  iRetorno := EPSON_Fiscal_Obter_SubTotal(PChar(vlrultc));
  vlrultc := vDadosIniF.StrZeroDec(strtoint(vlrultc), 13, 0);
  if not retorno_impGer(1) then
    iRetorno := 1;
  if iretorno <> 0 then
    SubTotal := ''
  else
    SubTotal := (copy(vlrultc, 1, 11) + ',' + copy(vlrultc, 12, 2));
end;

function TImpEpson.Suprimento(Valor, FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := EPSON_NaoFiscal_Fundo_Troco(Pchar(Valor), 2);
//  if iretorno <> 0 then
//    result := false;
  Analisa_iRetorno;
  Result := Retorno_Impressora;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpEpson.TerminaFechamentoCupom(linha1, linha2, linha3, linha4,
  linha5, linha6, linha7, linha8: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  iRetorno := EPSON_Fiscal_Imprimir_Mensagem(Pchar(linha1), Pchar(linha2), Pchar(linha3),
    Pchar(linha4), Pchar(linha5), Pchar(linha6), Pchar(linha7), Pchar(linha8));
  if estadoDeEmissaoDoCupomFiscal <> 2 then  
  while not Retorno_Impressora do

//  if not retorno_impGer(1) then
//    iRetorno := 1;
//  while iretorno <> 0 do
    //          Fprinter.FechaCupomFiscal('N') do
  begin
    if Application.MessageBox(pchar('Impressora Fiscal Não Responde, Tentar Novamente'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      TerminaFechamentoCupom := false;
      exit;
      break;
    end
    else
      iRetorno := EPSON_Fiscal_Imprimir_Mensagem(Pchar(linha1), Pchar(linha2), Pchar(linha3),
        Pchar(linha4), Pchar(linha5), Pchar(linha6), Pchar(linha7), Pchar(linha8));
  end;
  iRetorno := EPSON_Fiscal_Fechar_Cupom(True, False);
  while not Retorno_Impressora do
//  if not retorno_impGer(1) then
//    iRetorno := 1;
//  while iretorno <> 0 do
    //          Fprinter.FechaCupomFiscal('N') do
  begin
    if Application.MessageBox(pchar('Impressora Fiscal Não Responde, Tentar Novamente'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      TerminaFechamentoCupom := false;
      exit;
      break;
    end
    else
      iRetorno := EPSON_Fiscal_Fechar_Cupom(True, False);
  end;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.tipoDoc := 'RV';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpEpson.UsaComprovanteNaoFiscalVinculado(
  Texto: string): Integer;
var
  vTmp, vTmp2: string;
  I: Integer;
begin
  vTmp2 := Texto;
  while True do
  begin
    vTmp := Copy(vTmp2, 1, 48);
    vTmp2 := Copy(vTmp2, 49, Length(vTmp2));
    if EPSON_NaoFiscal_Imprimir_Linha(Pchar(vTmp)) <> 0 then
      result := 0
    else
      result := 1;
    if Result = 0 then
      Break;
    if Length(vTmp2) = 0 then
      Break;
  end;
end;

function TImpEpson.ValorPagoCupomAtual: string;
var
  FlagsFiscais: Integer;
  vpszEstado, cValorPago: string;
  I: Integer;
begin
  vpszEstado := '';
  for i := 1 to 57 do vpszEstado := vpszEstado + ' ';
  EPSON_Obter_Estado_Cupom(pchar(vpszEstado));
  if Copy(vpszEstado,1,2) = '01' then
  begin
    cValorPago := Copy(vpszEstado,22,13);
    try
      cValorPago := IntToStr(StrToInt64(cValorPago));
    except
      cValorPago := '0';
    end;
    if cValorPago = '0' then
      Result := '0'
    else
      Result := Format('%0.2f',[StrToInt64(cValorPago) / 100]);
  end
  else
    Result := '0';
end;

function TImpEpson.vendadeItensBema(ccodigo, cDescricao, cAliquota,
  cTipoQtde, cQtde: string; iCasasDecimais: integer; cValor, cTipoDesconto,
  cValorDesc: string): boolean;
var
  iretorno: integer;
  temp: string;
begin
  //
  Result := true;
  iRetorno := EPSON_Fiscal_Vender_Item(pchar(cCodigo),
    pchar(cDescricao),
    pchar(cQtde),
    3, //Verifica a aliquota na venda ta vindo F e dando pau
    pchar(copy(FvUnidade, 1, 2)),
    pchar(cValor),
    iCasasDecimais,
    pchar(cAliquota),
    1);
  result := Retorno_Impressora ;
//  if iretorno <> 0 then
//    Result := false
//  else
//  begin
//    if not retorno_impGer(1) then
//      result := false
//    else
//      result := true;
//  end;
  temp:=cValorDesc;
  temp:=stringreplace(temp,'-','0',[]);
  if (cValorDesc <> '00000000') and (Result) then
  begin
    if pos('-', cValorDesc) > 0 then
      iRetorno := EPSON_Fiscal_Desconto_Acrescimo_Item(pchar(temp), 2, False, false)
    else
      iRetorno := EPSON_Fiscal_Desconto_Acrescimo_Item(pchar(cValorDesc), 2, True, false);
    Retorno_Impressora;
  end;
//  if iretorno <> 0 then
//    Result := false
//  else
//  begin
//    if not retorno_impGer(1) then
//      result := false
//    else
//      result := true;
//  end;
end;

function TImpEpson.VendeItem(Codigo, Descricao, Aliquota, TipoQuantidade,
  Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
  TipoDesconto: string; Desconto1, Desconto2, nquant: real): boolean;
var
  it, vflgn: integer;
  vvp: string;
  valiq: array[1..16] of string;
  valiqt: string;
  vrAcumGT: Currency;
  iConta, I, ContTipo, ContAliq, Cont, ContValor: Integer;
  szAliquotas, seq, aliq: string;
begin
  Result := true;
  for iConta := 1 to 553 do
    szAliquotas := szAliquotas + ' ';
  iRetorno := EPSON_Obter_Tabela_Aliquotas(pchar(szAliquotas));
  contTipo := 1;
  contAliq := 3;


  valiq[1] := 'a';
  valiq[2] := 'b';
  valiq[3] := 'c';
  valiq[4] := 'd';
  valiq[5] := 'e';
  valiq[6] := 'f';
  valiq[7] := 'g';
  valiq[8] := 'h';
  valiq[9] := 'i';
  valiq[10] := 'j';
  valiq[11] := 'k';
  valiq[12] := 'l';
  valiq[13] := 'm';
  valiq[14] := 'n';
  valiq[15] := 'o';
  valiq[16] := 'p';
  if vFqtdDig = 3 then
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 3);
    delete(Fvcpreco, 6, 1);
  end
  else
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 2);
    delete(Fvcpreco, 7, 1);
  end;
  vFvcpreco := convNumero2(valorunitario);
  valorunitario := convNumero(ValorUnitario);
  if vtipoArredond <> 'A' then
  begin
    if pos(',', vFvcpreco) > 0 then
    begin
      if vFqtdDig = 3 then
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 3)
      else
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 2);
    end;
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 3);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end
  else
  begin
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 2);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    while pos('.', FvcTotal) > 0 do
      delete(FvcTotal, pos('.', FvcTotal), 1);
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end;
  if vFqtdDig = 3 then
    delete(Fvcpreco, 6, 1)
  else
    delete(Fvcpreco, 7, 1);
  if pos(',', vFvcTotal) > 0 then
    vFvcTotal := copy(vFvcTotal, 1, pos(',', vFvcTotal) - 1) + ',' + copy(vFvcTotal, pos(',',
      vFvcTotal) + 1, 2);
  //         nTotal:=nTotal+strtofloat(vFvcTotal);
  if (Desconto1 > 0) or (Desconto2 > 0) then
    vFValorLiq := floattostr((strtofloat(vFvcTotal) - strtofloat(vFcdescit)))
      //          floattostr((strtofloat(vFvcTotal)-(Strtofloat(vFvcTotal)*(vdescitem/100))))
  else
    vFValorLiq := vFvcTotal;
  vFvcTotal := vDadosIniF.StrZeroDec(strtofloat(vFvcTotal), 13, 2);
  delete(FvcTotal, 11, 1);
  //         eu:=currtostr((nPreco*nQuant));
  //         delete(vFvcTotal,8,1);
  //      showmessage(cbarra+cdesc20+vsittributaria+
  //       'F'+Cquant+inttostr(vqtdig)+vFvcpreco+'%'+'0000');
  try
//    valiqt := 'T' + valiq[strtoint(Aliquota)];
    strtoint(Aliquota);
    valiqt := Aliquota;
    for I := 1 to 24 do
    begin
      seq := copy(szAliquotas, contTipo, 2);
      aliq := copy(szAliquotas, contAliq, 4);
      if (seq = '00') or (aliq = '0000') or (trim(seq) = '') or (trim(aliq) = '') then
        Break;
      if I = StrToInt(Aliquota) then
      begin
        valiqt := seq;
        Break;
      end;
      inc(contTipo, 23);
      inc(contAliq, 23);
    end;

  except
    valiqt := Aliquota;
    if Aliquota = 'FF' then
      valiqt := 'F';
    if Aliquota = 'II' then
      valiqt := 'I';
    if Aliquota = 'NN' then
      valiqt := 'N';
  end;
  if (Desconto1 > 0) or (Desconto2 > 0) then
  begin
    vFcdescit := vDadosIniF.StrZeroDec(desconto2 + ((desconto1 * Valorunitario) / 100), 9, 2);
    delete(Fcdescit, 7, 1);
    //vFcdescit := vDadosIniF.StrZeroDec(desconto1 + ((desconto2 * 100) / Valorunitario), 5, 2);
    //delete(Fcdescit, 3, 1);
  end
  else if (Desconto1 < 0) or (Desconto2 < 0) then
  begin
    if vDadosIniF.existeComando('2', false) then
    begin
      vFcdescit := vDadosIniF.StrZeroDec(((-1) * desconto2) + ((((-1) * desconto1) *
        Valorunitario)
        / 100), 9, 2);
      vFcdescit := StringReplace(vFcdescit, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      vrAcumGT := vrAcumGT + StrToCurr(trim(vFcdescit));
      vFValorLiq := FloatToStr(StrToFloat(vFValorLiq) + StrToFloat(vFcdescit));
      vFcdescit := '-' + vFcdescit;
      vFcdescit := StringReplace(vFcdescit, ',', '', [rfReplaceAll, rfIgnoreCase]);
    end;
  end
  else
    vFcdescit := '00000000';

  {    cCodigo := cbarra;
      cDescricao := cdesc20;
      cAliquota := vSitTributaria;
      cTipoQtde := 'F';
      cQtde := cQuant;
      iCasasDecimais := vqtdig;
      cValor := vFvcpreco;
      cTipoDesconto := '%';
      cValorDesc := cdescit;}
  vflgn := 0;
  while not vendadeItensBema(Codigo, Descricao, valiqt, 'F', quantidade, vFqtdDig,
    vFvcpreco, '%', vFcdescit) do
    //       FPrinter.VendeItem3Dig(cbarra+'\'+cdesc20+'\'+vSitTributaria+'\'+cQuant+'\'+vFvcpreco+'\'+cdescit+'\UN\'+vFvcTotal) do
  begin
    if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      vflgn := 1;
      break;
    end;
    //              messagedlg('Problemas no Envio de Inf. Para Impressora',mtinformation,[mbOK],0);
  end;
  if vflgn = 1 then
  begin
    VendeItem := false;
    exit;
  end;
  vdadosIniF.acumulaGrandeTotal(vrAcumGT);
end;

function TImpEpson.VendeItemSimples(pCodigo, pDescricao, pAliquota: string;
  pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean;
var
  cQtde,cValor,cAliquota,cDescontoAcrescimo:string;
  vrTemp:Real;
begin
  cQtde := Format('%12.4f',[pQuantidade]);
  if FqtdDigQtde = 2 then
    cQtde := Copy(cQtde,1,10)
  else
    cQtde := Copy(cQtde,1,11);

  cValor := Format('%15.4f',[pValorUnitario]);
  if FqtdDig = 2 then
    cValor := Copy(cValor,1,13)
  else
    cValor := Copy(cValor,1,14);

  cQtde := StringReplace(Trim(cQtde),',','',[rfReplaceAll]);
  cValor := StringReplace(Trim(cValor),',','',[rfReplaceAll]);

  if pAliquota = 'FF' then
    cAliquota := 'F'
  else if pAliquota = 'NN' then
    cAliquota := 'N'
  else if pAliquota = 'II' then
    cAliquota := 'I'
  else
    cAliquota := pAliquota;

  while True do
  begin
    iRetorno := EPSON_Fiscal_Vender_Item(pchar(pCodigo),
      pchar(pDescricao),
      pchar(cQtde),
      FqtdDigQtde, //Verifica a aliquota na venda ta vindo F e dando pau
      pchar(copy(FvUnidade, 1, 2)),
      pchar(cValor),
      FqtdDig,
      pchar(cAliquota),
      1);
    result := Retorno_Impressora ;
    if Result  then
    begin
      vrTemp := getValorTotalComCasasDecimais( pValorUnitario * pQuantidade);
      vFValorLiq := Format('%0.2f',[vrTemp]);

      vDadosIniF.acumulaGrandeTotal(vDadosIniF.StrToFloatFormat(pValorUnitario,2));
      if (pDescontoPercentual > 0) or (pDescontoValor > 0) then
      begin
        vrTemp := vDadosIniF.StrToFloatFormat( ((vrTemp * pDescontoPercentual) / 100) + pDescontoValor,2);
        cDescontoAcrescimo := Format('%0.2f',[vrTemp]);
        cDescontoAcrescimo := StringReplace(Trim(cDescontoAcrescimo),',','',[rfReplaceAll]);
        iRetorno := EPSON_Fiscal_Desconto_Acrescimo_Item(pchar(cDescontoAcrescimo), 2, True, false);
        if Retorno_Impressora then
        begin
          vFValorLiq := Format('%0.2f',[StrToFloat(vFValorLiq) - vrTemp]);
          vDadosIniF.acumulaGrandeTotal(vDadosIniF.StrToFloatFormat(vrTemp,2));
        end;
      end
      else if (pDescontoPercentual < 0)  or (pDescontoValor < 0) then
      begin
        if vDadosIniF.existeComando('2', false) then
        begin
          vrTemp := vDadosIniF.StrToFloatFormat( ((vrTemp * ((-1)*pDescontoPercentual)) / 100) + ((-1)*pDescontoValor),2);
          cDescontoAcrescimo := Format('%0.2f',[vrTemp]);
          cDescontoAcrescimo := StringReplace(Trim(cDescontoAcrescimo),',','',[rfReplaceAll]);
          iRetorno := EPSON_Fiscal_Desconto_Acrescimo_Item(pchar(cDescontoAcrescimo), 2, False, false);
          if Retorno_Impressora then
          begin
            vFValorLiq := Format('%0.2f',[vrTemp + StrToFloat(vFValorLiq)]);
            vDadosIniF.acumulaGrandeTotal(vDadosIniF.StrToFloatFormat(vrTemp,2));
          end;
        end;
      end;
      Break;
    end
    else
    begin
      Application.ProcessMessages;
      if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
        Break;
    end;
  end;
end;

procedure TImpEpson.verificaErroDadosReducao;
var
  vTemp: string;
  arquivoMFD: string;
  cArqTXT: string;
  cArqTemp: TextFile;
  cLinha: string;
begin

  try
    vTemp := obCupom.retornaValor('select first 1 r.coored as valor from resumod r' +
      ' where r.coored < ' + vMapaResumo.coored +
      ' and r.nserieecf = '+ QuotedStr(vDadosIniF.codifica(vDadosIni.vNumSerieEcf))+
      ' and r.cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and r.cod_empresa = ' + vDadosIniF.codEmpresa+
      ' order by r.coored desc');
    StrToInt(vTemp);
  except
    Exit;
  end;

  if pos('?', Fvcooini) > 0 then
    Fvcooini := IntToStr(StrToInt(vTemp) + 2);

  try
    vTemp := IntToStr(StrToInt(Trim(vMapaResumo.coored)) - 1);
  except
    Exit;
  end;

  try
    if not vDadosIniF.existeComando('8', True) then
      Exit;
    arquivoMFD := vDadosIniF.vPathArquivosDigitais + '\temp';

    iRetorno := EPSON_Obter_Dados_MF_MFD(pchar(vTemp), pchar(vTemp), 2, 65535, 0, 0,
      pchar(arquivoMFD));
    arquivoMFD := StringReplace(arquivoMFD, '\\', '\', [rfReplaceAll]);
    if iRetorno <> 0 then
      Exit;

    cArqTXT := arquivoMFD + '_ESP.txt';
    if not FileExists(cArqTXT) then
      Exit;

    AssignFile(cArqTemp, cArqTXT);
    Reset(cArqTemp);

    cLinha := '';
    while not EOF(cArqTemp) do
    begin
      Readln(cArqTemp, cLinha);
      if Pos('COO:' + vDadosIniF.StrZero(vTemp, 6), cLinha) > 0 then
      begin
        FvDataRes := copy(clinha, 1, 10);
        Break;
      end;
    end;
    CloseFile(cArqTemp);

    DeleteFile(pchar(arquivoMFD + '_ESP.txt'));

  except
  end;

end;

function TImpEpson.VerificaImpressoraLigada: boolean;
begin
  NumeroCupom;
  Result := (iRetorno = 0);
end;

function TImpEpson.verificaPapel: boolean;
var
  iretorno: Integer;
  cNumeroSerie: string;
  iConta: integer;
  ST3, ST5, Temp: string;
  iST3, iST4, iST5: Integer;
  flagB15, flagB14, flagB12, flagB11, flagB10, flagB09, flagB07: Boolean;
begin
  Result := true;
  cNumeroSerie := '';
  for iConta := 1 to 110 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := EPSON_Obter_Dados_Impressora(PChar(cNumeroSerie));

  for iConta := 1 to 4 do
    ST3 := ST3 + ' ';

  for iConta := 1 to 20 do
    Temp := Temp + ' ';

  iRetorno := EPSON_Obter_Estado_Impressora(PChar(Temp));
  if iRetorno = 0 then
  begin
    ST3 := Copy(Temp, 9, 4);
    //    ST5 := UpperCase(ST5);
    iST3 := StrToInt('$' + ST3);

    if (iST3 >= 32768) then iST3 := iST3 - 32768;
    if (iST3 >= 16384) then iST3 := iST3 - 16384;
    if (iST3 >= 8192) then iST3 := iST3 - 8192;
    if (iST3 >= 4096) then iST3 := iST3 - 4096;
    if (iST3 >= 1024) then iST3 := iST3 - 1024;
    if (iST3 >= 512) then iST3 := iST3 - 512;
    if (iST3 >= 256) then iST3 := iST3 - 256;
    if (iST3 >= 128) then iST3 := iST3 - 128;
    if (iST3 >= 64) then iST3 := iST3 - 64;
    if (iST3 >= 32) then iST3 := iST3 - 32;
    if (iST3 >= 16) then iST3 := iST3 - 16;
    if (iST3 >= 8) then
    begin
      FVccancTef := 1;
      vcanctef := 1;
      verificaPapel := false;
      iST3 := iST3 - 8;
    end;

    if (iST3 >= 4) then
    begin
      verificaPapel := false;
      iST3 := iST3 - 4;
    end;
    if (iST3 >= 2) then
    begin
      FVccancTef := 1;
      vcanctef := 1;
      verificaPapel := false;
      iST3 := iST3 - 2;
    end;
    if (iST3 >= 1) then
      verificaPapel := false;
  end
  else
    verificaPapel := false;
end;

function TImpEpson.Verifica_Impressora: boolean;
begin
  Result := Retorno_Impressora;
end;

function TImpEpson.MontaDescricao(vdesc, vunidade: string): string;
begin
  Result := copy(vdesc, 1, 35);
end;

procedure TImpEpson.montaMaparesumo;
var
  szCrzAnsi, temp: AnsiString;
  tempValor: Currency;
  regAliq, regValor: TStringList;
  I: Integer;
  cont: Integer;
  vAliq: TAliquota;
  contT: Integer;
  contS: Integer;
  tempIss: Currency;
  tempNaoIncidencia: Currency;
  tempIsento: Currency;
  tempSubst: Currency;
begin
  inherited;
  // Lendo complemento para resumo D
  try
    if vMapaResumo.coored = '0' then
      exit;
    szCrzAnsi := '';
    for i := 1 to 1148 do szCrzAnsi := szCrzAnsi + ' ';

    iRetorno := EPSON_Obter_Dados_Ultima_RZ(pchar(szCrzAnsi));
    Analisa_iRetorno;
    if not retorno_impGer(1) then
      iRetorno := 0;
    if iretorno <> 0 then
    begin
      Application.MessageBox(pchar('Erro ao ler dados da redução Z'), 'Atenção',
        MB_ICONEXCLAMATION
        + MB_OK);
      exit;
    end;
    vMapaResumo.nreducoes := FvContRed;//trim(copy(szCrzAnsi, 27, 6));
    vMapaResumo.coored := Fvcoofin;//trim(copy(szCrzAnsi, 21, 6));
    tempValor := 0;
    tempValor := StrToFloat(Trim(copy(szCrzAnsi, 105, 15)) + ',' + Trim(copy(szCrzAnsi, 120, 2)));
    tempValor := tempValor + StrToFloat(Trim(copy(szCrzAnsi, 122, 15)) + ',' + Trim(copy(szCrzAnsi,
      137, 2)));
    tempValor := tempValor + StrToFloat(Trim(copy(szCrzAnsi, 139, 15)) + ',' + Trim(copy(szCrzAnsi,
      154, 2)));
    vMapaResumo.vlCancel := Format('%15.2f', [tempValor]);

    tempValor := 0;
    tempValor := StrToFloat(Trim(copy(szCrzAnsi, 207, 15)) + ',' + Trim(copy(szCrzAnsi, 222, 2)));
    tempValor := tempValor + StrToFloat(Trim(copy(szCrzAnsi, 224, 15)) + ',' + Trim(copy(szCrzAnsi,
      239, 2)));
    tempValor := tempValor + StrToFloat(Trim(copy(szCrzAnsi, 241, 15)) + ',' + Trim(copy(szCrzAnsi,
      256, 2)));
    vMapaResumo.vlAcrescimo := Format('%15.2f', [tempValor]);

    tempValor := 0;
    tempValor := StrToFloat(Trim(copy(szCrzAnsi, 156, 15)) + ',' + Trim(copy(szCrzAnsi, 171, 2)));
    tempValor := tempValor + StrToFloat(Trim(copy(szCrzAnsi, 173, 15)) + ',' + Trim(copy(szCrzAnsi,
      188, 2)));
    tempValor := tempValor + StrToFloat(Trim(copy(szCrzAnsi, 190, 15)) + ',' + Trim(copy(szCrzAnsi,
      205, 2)));
    vMapaResumo.vlDesconto := Format('%15.2f', [tempValor]);

    vMapaResumo.dataRed := trim(copy(szCrzAnsi, 1, 8));
    Insert('/', vMapaResumo.dataRed, 3);
    Insert('/', vMapaResumo.dataRed, 6);

    vMapaResumo.horaRed := trim(copy(szCrzAnsi, 9, 6));
    Insert(':', vMapaResumo.horaRed, 3);
    Insert(':', vMapaResumo.horaRed, 6);

    tempValor := 0;
    tempValor := StrToFloat(FvvendBr);
    tempValor := tempValor - StrToFloat(vMapaResumo.vlCancel);
    tempValor := tempValor - StrToFloat(vMapaResumo.vlDesconto);
    vMapaResumo.vlTotLiq := Format('%15.2f', [tempValor]);

    regAliq := TStringList.create;
    regValor := TStringList.Create;

    cont := 1;
    temp := '';
    for I := 258 to 377 do temp := temp + szCrzAnsi[i];
    //  temp := copy(szCrzAnsi, 258, 120);
    for I := 1 to 24 do
    begin
      regAliq.Add(Copy(temp, cont, 5));
      Inc(cont, 5);
    end;

    cont := 1;
    temp := '';
    for I := 384 to 791 do temp := temp + szCrzAnsi[i];
    //  temp := copy(szCrzAnsi, 384, 408);
    for I := 1 to 24 do
    begin
      try
        tempValor := StrToCurr(Copy(temp, cont, 15) + ',' + Copy(temp, cont + 15, 2));
        regValor.Add(CurrToStr(tempValor));
      except
        regValor.Add('0,00');
      end;
      Inc(cont, 17);
    end;

    tempIss := 0;
    tempNaoIncidencia := 0;
    tempIsento := 0;
    tempSubst := 0;
    for I := 0 to 23 do
    begin
      temp := UpperCase(trim(regAliq[i]));

      if (pos('S', temp) > 0) and (temp <> 'FS') and
        (temp <> 'IS') and (temp <> 'NS') then
        tempIss := tempIss + StrToCurr(trim(regValor[i]));
      if (temp = 'N') then
        tempNaoIncidencia := tempNaoIncidencia + StrToCurr(trim(regValor[i]));
      if (temp = 'I') then
        tempIsento := tempIsento + StrToCurr(trim(regValor[i]));
      if (temp = 'F') then
        tempSubst := tempSubst + StrToCurr(trim(regValor[i]));

      if (Length(temp) = 5) and (pos('T', temp) > 0) then
        regAliq[i] := vDadosIniF.StrZero(i+1, 2) + UpperCase(Trim(regAliq[i]))
      else if (Length(temp) = 5) and (pos('S', temp) > 0) then
        regAliq[i] := vDadosIniF.StrZero(i+1, 2) + UpperCase(Trim(regAliq[i]))
      else if (temp = 'F') or (temp = 'FS') or (temp = 'I') or (temp = 'IS') or
        (temp = 'N') or (temp = 'NS') then
        regAliq[i] := UpperCase(Trim(regAliq[i])) + '1';// vDadosIniF.StrZero(i, 2);
    end;
    vMapaResumo.vlISS := Format('%15.2f', [tempIss]);
    vMapaResumo.vlIsentos := Format('%15.2f', [tempIsento]);
    vMapaResumo.vlNaoIncidencia := Format('%15.2f', [tempNaoIncidencia]);
    vMapaResumo.vlSubst := Format('%15.2f', [tempSubst]);

    regAliq.Add('Can-T');
    regValor.Add(Trim(copy(szCrzAnsi, 105, 15)) + ',' + Trim(copy(szCrzAnsi, 120, 2)));
    regAliq.Add('Can-S');
    regValor.Add(Trim(copy(szCrzAnsi, 122, 15)) + ',' + Trim(copy(szCrzAnsi, 137, 2)));
    regAliq.Add('DT');
    regValor.Add(Trim(copy(szCrzAnsi, 156, 15)) + ',' + Trim(copy(szCrzAnsi, 171, 2)));
    regAliq.Add('DS');
    regValor.Add(Trim(copy(szCrzAnsi, 173, 15)) + ',' + Trim(copy(szCrzAnsi, 188, 2)));
    regAliq.Add('AT');
    regValor.Add(Trim(copy(szCrzAnsi, 207, 15)) + ',' + Trim(copy(szCrzAnsi, 222, 2)));
    regAliq.Add('AS');
    regValor.Add(Trim(copy(szCrzAnsi, 224, 15)) + ',' + Trim(copy(szCrzAnsi, 239, 2)));

    vMapaResumo.qtdeAliq := regAliq.Count;
    SetLength(vMapaResumo.valiqs, regAliq.Count);

    vAliq := TAliquota.Create;
    vAliq.getTodos;

    for I := 0 to regAliq.Count - 1 do
    begin
      //    if (COPY(regAliq[I], 1, 1) = 'T') or (COPY(regAliq[I], 1, 1) = 'S') then
      //      vMapaResumo.valiqs[i].seq := trim(vDadosIniF.StrZero(I + 1, 2))
      //    else
      vMapaResumo.valiqs[i].seq := IntToStr(I);
      vMapaResumo.valiqs[i].aliq := trim(regAliq[i]);
      try
        vMapaResumo.valiqs[i].valor := StrToCurr(regValor[i]);
      except
        vMapaResumo.valiqs[i].valor := 0;
      end;
    end;
    contT := 1;
    //Fvcooini := '??????';//remover esta linha. Linha usada apenas para testes
    if Pos('?', Fvcooini) > 0 then
      if vDadosIniF.vDigitarDadosReducaoZ <> 'S' then
        verificaErroDadosReducao;
  except

  end;
end;

function TImpEpson.numeroCCF: string;
var
  ccfCupom: string;
  szContadores: array[0..100] of Char;
  iConta: integer;
  I: Integer;
begin
  for iConta := 1 to 100 do
    ccfCupom := ccfCupom + ' ';
  iRetorno := EPSON_Obter_Contadores(szContadores);// PChar(ccfCupom));
  ccfCupom := '';
  for I := 42 to 47 do
    ccfCupom := ccfCupom + szContadores[i];
  Result := ccfCupom;

  //Result := copy(ccfCupom, 43, 6);
end;

function TImpEpson.numeroCDC: string;
var
  sCDC: string;
  iConta: integer;
begin
  for iConta := 1 to 100 do
    sCDC := sCDC + ' ';
  iRetorno := EPSON_Obter_Contadores(PChar(sCDC));
  Result := copy(sCDC, 25, 6);
end;

function TImpEpson.numeroCER: string;
var
  szRelatoriosGerenciais: array[0..421] of Char;
begin
  iRetorno := EPSON_Obter_Tabela_Relatorios_Gerenciais(szRelatoriosGerenciais );
  Result := copy(szRelatoriosGerenciais, 18, 4);
end;

function TImpEpson.numeroCOO: string;
begin
  Result := NumeroCupom;
end;

{ TImpSWedaMFD }

function TImpSWedaMFD.AberturaDoDia(ValorCompra,
  FormaPagamento: string): boolean;
var
  scomando: string;
  iresp: integer;
begin
  Result := true;
  obFinalizador.getTodosFiscal;
  obFinalizador.first;
  if vTemMFD then
    while not obFinalizador.eof do
    begin
      if obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger <> 1 then
      begin
        if obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1 then
          Retorno :=
            ECF_ProgramaFormaPagamentoMFD(pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1, 16)), '1')
        else
          Retorno :=
            ECF_ProgramaFormaPagamentoMFD(pchar(copy(trim(obFinalizador.dataSet.FieldByName('descricao').AsString), 1, 16)), '0');
      end;
      obFinalizador.next;
    end;
  try
    Retorno := ECF_AberturaDoDia(pchar('0'), pchar(''));
  except
    vPortaAberta := False;
    AbrePortaS('');
  end;
end;

function TImpSWedaMFD.AbrecomprovanteNaoFiscal(FormaPagamento, Valor,
  NumeroCupom: string): boolean;
begin

end;

function TImpSWedaMFD.AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento,
  Valor_Pago, Numero_do_Cupom: string): Integer;
begin
  ECF_AbreComprovanteNaoFiscalVinculado(pchar(Forma_de_Pagamento), pchar(Valor_Pago),
    pchar(Numero_do_Cupom));
end;

function TImpSWedaMFD.AbreCupom(CGC_CPF: string): boolean;
begin
  Result := true;
  Retorno := ECF_AbreCupom('');
  if not retorno_impGer(1) then
    retorno := 0;
  if retorno <> 1 then
    AbreCupom := false;
  if Result then
    DataHoraImpressora('', '');
end;

function TImpSWedaMFD.AbreCupomMFD(CGC, Nome, Endereco: string): boolean;
begin

end;

function TImpSWedaMFD.AbrePortaS(vportaCom: string): boolean;
begin
  Result := true;
  if vPortaAberta then
    Exit;
  ECF_FechaPortaSerial;
  Retorno := ECF_AbrePortaSerial;
  Result := Retorno = 1;
  vPortaAberta := Result;
end;

function TImpSWedaMFD.AbreRecebimentoNaoFiscalMFD(CGC, Nome,
  Endereco: string): boolean;
begin

end;

function TImpSWedaMFD.abrerelatorioGer: boolean;
begin

end;

procedure TImpSWedaMFD.acionaCortePapel(corteCompleto, gerencial: boolean);
begin
  inherited;

end;

function TImpSWedaMFD.AcionaGaveta: boolean;
begin
  Result := true;
  Retorno := ECF_AcionaGaveta();
end;

procedure TImpSWedaMFD.Analisa_iRetorno;
begin
  if Retorno = 0 then
    Application.MessageBox('Erro de Comunicação !', 'Erro',
      MB_IconError + MB_OK)
  else if Retorno = -1 then
    Application.MessageBox('Erro de Execução na Função. Verifique!', 'Erro',
      MB_IconError + MB_OK)
  else if Retorno = -2 then
    Application.MessageBox('Parâmetro Inválido !', 'Erro',
      MB_IconError + MB_OK)
  else if Retorno = -3 then
    Application.MessageBox('Alíquota não programada !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -4 then
    Application.MessageBox('Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -5 then
    Application.MessageBox('Erro ao Abrir a Porta de Comunicação', 'Erro',
      MB_IconError + MB_OK)
  else if Retorno = -6 then
    Application.MessageBox('Impressora Desligada ou Desconectada', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -7 then
    Application.MessageBox('Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -8 then
    Application.MessageBox('Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt',
      'Erro',
      MB_IconError + MB_OK)
  else if Retorno = -18 then
    Application.MessageBox('Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -19 then
    Application.MessageBox('Parâmetro diferentes !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -20 then
    Application.MessageBox('Transação cancelada pelo Operador !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -21 then
    Application.MessageBox('A Transação não foi aprovada !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -22 then
    Application.MessageBox('Não foi possível terminal a Impressão !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -23 then
    Application.MessageBox('Não foi possível terminal a Operação !', 'Atenção',
      MB_IconInformation + MB_OK)
  else if Retorno = -24 then
    Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK)
  else if Retorno = -25 then
    Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK)
  else if Retorno = -26 then
    Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK)
  else if Retorno = -28 then
    Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);
end;

function TImpSWedaMFD.arquivoMFDCotepe1704porCOO(cooInicial, cooFinal, endereco,
  codProp, pTipo: string): boolean;
var
  arquivoMFD, cFlag, cModeloImp: string;
begin
  if not vDadosIniF.existeComando('8', True) then
    Exit;
  cFlag := '1';
  SetLength(cModeloImp, 10);
  cModeloImp := vTipoImpressora;
  //Comando para retornar o modelo da impressora
  if not vTemMFD then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    Exit;
  end;
  arquivoMFD := StringReplace(endereco, '.txt', '.mfd', [rfReplaceAll, rfIgnoreCase]);
  if pTipo = 'MF' then
    Retorno := ECF_DownloadMF(PChar(arquivoMFD))
  else
    Retorno := ECF_DownloadMFD(arquivoMFD, '0', ' ', ' ', '0');
  if retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  cooInicial := vDadosIniF.StrZero(cooInicial, 7);
  cooFinal := vDadosIniF.StrZero(cooFinal, 7);
  Retorno := ECF_ReproduzirMemoriaFiscalMFD('3', pchar(cooInicial), pchar(cooFinal),
    pchar(endereco), pchar(arquivoMFD));
  if Retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  Result := Retorno = 1;
end;

function TImpSWedaMFD.arquivoMFDCotepe1704porData(dataInicial, dataFinal,
  endereco, codProp, pTipo: string): boolean;
var
  arquivoMFD, dtIni, dtFim, cFlag, cModeloImp: string;
begin
  if not vDadosIniF.existeComando('7', True) then
    Exit;
  cFlag := '3';
  SetLength(cModeloImp, 10);
  cModeloImp := vTipoImpressora;
  //Comando para retornar o modelo da impressora
  if not vTemMFD then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    Exit;
  end;
  arquivoMFD := StringReplace(endereco, '.txt', '.bin', [rfReplaceAll, rfIgnoreCase]);
  dtIni := dataInicial; dtFim := dataFinal;
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if pTipo = 'MF' then
    Retorno := ECF_DownloadMF(PChar(arquivoMFD))
  else
    Retorno := ECF_DownloadMFD(arquivoMFD, '0', ' ', ' ', '0');
  if retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Retorno := ECF_ReproduzirMemoriaFiscalMFD(pchar(cFlag), pchar(dtIni), pchar(dtFim),
    pchar(endereco), pchar(arquivoMFD));

  if Retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  Result := Retorno = 1;
end;

function TImpSWedaMFD.cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string;
  codigo: integer): Integer;
var
  codigoTotalizador: Integer;
  I: Integer;
begin
  ECF_NomeiaTotalizadorNaoSujeitoIcms(codigo, pchar(copy(nomeTotaliz, 1, 19)));
  if retorno = 1 then
  begin
    result := codigo;
    exit;
  end;
  for I := 1 to 30 do
  begin
    ECF_NomeiaTotalizadorNaoSujeitoIcms(I, pchar(copy(nomeTotaliz, 1, 19)));
    if retorno = 1 then
    begin
      result := codigo;
      exit;
    end
    else
      Result := 0;
  end;
  Application.MessageBox(pchar('Totalizador não foi cadastrado.' + #13 +
    'Verifique! Função permitida apenas depois da redução Z e antes de registrar o movimento do dia'),
    'Atenção', MB_ICONWARNING + MB_OK);
end;

function TImpSWedaMFD.CancelaCupom(vsubtr: integer): boolean;
begin
  Result := true;
  Retorno := ECF_CancelaCupom();
  if retorno <> 1 then
    result := false;
  if not retorno_impGer(1) then
    Result := false;
end;

procedure TImpSWedaMFD.cancelaCupomTEF;
begin
  inherited;
  Retorno := Bematech_FI_CancelaCupom();
end;

function TImpSWedaMFD.CancelaItemGenerico(NumeroItem: real): boolean;
begin
  Result := true;
  Retorno := ECF_CancelaItemGenerico(pchar(vDadosIniF.StrZeroDec(NumeroItem, 3, 0)));
  Analisa_iRetorno();
  if retorno <> 1 then
  begin
    CancelaItemGenerico := false;
    exit;
  end;
  if not retorno_impGer(1) then
  begin
    CancelaItemGenerico := false;
    exit;
  end;
end;

function TImpSWedaMFD.CancelamentoNaoFiscal: boolean;
begin
  if vTemMFD then
  begin
    Retorno := ECF_CancelaRecebimentoNaoFiscalMFD('','','');
    Result := Retorno_Impressora;
  end
  else
  begin
    Application.ProcessMessages;
    Application.MessageBox('Função não suportada pela impressora','Atenção',0+64);
    Result := False;
  end;
end;

function TImpSWedaMFD.cMascara(vvalor, vqtd: real; idx: integer; vdesc1,
  vdesc2: real): string;
var
  ctotal: string;
  cdescit: string;
begin
  if (idx = 1) or (idx = 2) then
  begin
    vvalor := convNumero(vvalor);
    ctotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 3);
    if FvtipoArredond <> 'A' then
    begin
      if pos(',', ctotal) > 0 then
        ctotal := copy(ctotal, 1, pos(',', ctotal) - 1) + ',' + copy(ctotal, pos(',', ctotal) +
          1,
          2);
    end
    else
    begin
      cTotal := FloatToStrF((vqtd * vvalor), ffgeneral, 12, 2);
      while pos('.', ctotal) > 0 do
        delete(ctotal, pos('.', ctotal), 1);
    end;
  end;
  if idx = 2 then
  begin
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
    cDescit := FloatToStrF(((strtofloat(cTotal) * (vdesc1 / 100)) + vdesc2), ffgeneral, 12, 3);
    if pos(',', cDescit) > 0 then
      cDescit := copy(cDescit, 1, pos(',', cDescit) - 1) + ',' + copy(cDescit, pos(',', cDescit)
        +
        1, 2);
  end;
  if idx = 1 then
    cMascara := ctotal;
  if idx = 2 then
    cMascara := cdescit;
end;

function TImpSWedaMFD.cMascQuant(vqtd: real): string;
var
  cQuant: string;
begin
  cQuant := vDadosIniF.StrZeroDec(vqtd, 8, 3);
  delete(cQuant, 5, 1);
  cMascQuant := cQuant;
end;

function TImpSWedaMFD.convNumero(var Valor: real): real;
begin
  if vFqtdDig = 3 then
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 3))
  else
      convnumero := strtofloat(FloatToStrF(valor, ffgeneral, 12, 2));
end;

function TImpSWedaMFD.convNumero2(var Valor1: real): string;
begin
  if vFqtdDig = 3 then
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 3)
  else
      convnumero2 := FloatToStrF(valor1, ffgeneral, 12, 2);
end;

constructor TImpSWedaMFD.Create;
begin
  if vTemMFD then
    fQtdeColunasImpressao := 48
  else
    fQtdeColunasImpressao := 40;
  vPortaAberta := false;
  fPathRetornoTXT := vDadosIniF.GetIni('Fiscal', 'PathRetornoTXT', 'C:\Retorno.txt');
end;

function TImpSWedaMFD.cupomAberto: boolean;
var
  FlagsFiscais: Integer;
begin
  Result := False;
  Retorno := ECF_FlagsFiscais(FlagsFiscais);
  if Retorno <> 1 then
    exit;
  if (FlagsFiscais mod 2) <> 0 then
    Result := true;
end;

function TImpSWedaMFD.DataHoraImpressora(Data, Hora: string): boolean;
var
  iConta: integer;
begin
  Result := true;
  FDataECF := '';
  for iConta := 1 to 6 do FDataECF := FDataECF + ' ';
  FHoraEcf := '';
  for iConta := 1 to 6 do FHoraEcf := FHoraEcf + ' ';
  Retorno := ECF_DataHoraImpressora(pchar(FDataECF), pchar(FHoraEcf));
  if retorno = 1 then
  begin
    Insert(':', FHoraEcf, 3);
    Insert(':', FHoraEcf, 6);
    Insert('/', FDataECF, 3);
    Insert('/', FDataECF, 6);
  end
  else
  begin
    FHoraEcf := '00:00:00';
    FDataECF := '01/01/1980';
  end;
end;

function TImpSWedaMFD.dataHoraUltimoDocumento: string;
var
  sDataHora: string;
  I: Integer;
begin
  for i := 1 to 12 do
    sDataHora := sDataHora + ' ';

  Retorno := 0;
  while Retorno <> 1 do
  begin
    Retorno := ECF_DataHoraUltimoDocumentoMFD(pchar(sDataHora));
    if Retorno <> 1 then
    begin
      begin
        Result := '';
        exit;
      end;
    end
    else Break;
  end;
  insert('/', sDataHora, 3);
  insert('/20', sDataHora, 6);
  insert(' ', sDataHora, 11);
  insert(':', sDataHora, 14);
  insert(':', sDataHora, 17);

  Result := sDataHora;
end;

function TImpSWedaMFD.defAtribTef: string;
begin
  Result := obFinalizador.dataSet.FieldByName('descricao').AsString;
  while length(Result) < 10 do
    Result := Result + ' ';
end;

function TImpSWedaMFD.DefCodFinalPrazo: string;
begin
  DefCodFinalPrazo := obFinalizador.dataSet.FieldByName('descricao').AsString;
end;

procedure TImpSWedaMFD.defineArredondamentoTruncamento;
var
  vTruncArred:string;
  I: Integer;
begin
  inherited;
  FqtdDigQtde := 3;
  vTruncArred := '';
  For I := 1 to 2 do vTruncArred := vTruncArred + ' ';
  Retorno := ECF_VerificaTruncamento(pchar(vTruncArred));
  if Retorno_Impressora then
  begin
    vTruncArred := Copy(Trim(vTruncArred),1,1);
    if vTruncArred = '1' then
      FvtipoArredond := 'T'
    else if vTruncArred = '0' then
      FvtipoArredond := 'A';
  end;
end;

function TImpSWedaMFD.defvalsangsup(vvalsangsup: real): string;
var
  cValorZero: string;
begin
  cValorZero := vDadosIniF.StrZeroDec(vvalsangsup, 15, 2);
  delete(cValorZero, 13, 1);
  result := cValorZero;
end;

function TImpSWedaMFD.Descricaoimp(vdesc: string): string;
var
  cDescricao: string;
  t: integer;
begin
  //    cDescricao := Ldescricao.Caption;
  if Faitred = 'S' then
  begin
    cDescricao := vdesc;
    for t := 1 to 29 - length(cDescricao) do
    begin
      Insert(' ', cDescricao, 29);
    end;
    result := copy(cDescricao, 1, 29);
  end
  else
    Result := vdesc;
end;

function TImpSWedaMFD.DesprogramaHorarioVerao: boolean;
var
  vHorarioVerao: string;
  I: Integer;
begin
  Result := true;
  vHorarioVerao:='';
  for I := 1 to 2 do vHorarioVerao := vHorarioVerao + ' ';
  Retorno := ECF_VerificaHorarioVerao(pchar(vHorarioVerao));
  vHorarioVerao := Copy(Trim(vHorarioVerao),1,1);
  if vHorarioVerao = '0' then
  begin
    Application.MessageBox('Horário de verão não esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  Retorno := ECF_ProgramaHorarioVerao();
  if Retorno = 0 then
    result:= false;    
end;

destructor TImpSWedaMFD.Destroy;
begin
  vPortaAberta := false;
  FechaPortaSerial;
  inherited;
end;

function TImpSWedaMFD.diaCaixaFechado: Boolean;
begin
  LeTabelaResumo;
end;

function TImpSWedaMFD.EfetuaFormaPagamento(FormaPagamento: string;
  ValorFormaPagamento: real; vcodFinal: integer): boolean;
var
  cdinheiro: string;
begin
  Result := true;
  cdinheiro := vDadosIniF.StrZeroDec(ValorFormaPagamento, 15, 2);
  delete(cdinheiro, 13, 1);
  Retorno := ECF_EfetuaFormaPagamento(pchar(FormaPagamento), pchar(cdinheiro));
  if not retorno_impGer(1) then
    Retorno := 0;
  if Retorno <> 1 then
  begin
    EfetuaFormaPagamento := false;
    exit;
  end;
end;

function TImpSWedaMFD.EfetuaFormaPagamentoMFD(FormaPagamento,
  ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): boolean;
begin

end;

function TImpSWedaMFD.EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,
  ValorRecebimento: string): boolean;
begin

end;

procedure TImpSWedaMFD.EqualizarVelocidade;
begin
  inherited;

end;

function TImpSWedaMFD.espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD, cFlag, cModeloImp: string;
begin
  if not vDadosIniF.existeComando('8', True) then
    Exit;
  cFlag := '1';
  SetLength(cModeloImp, 10);
  cModeloImp := vTipoImpressora;
  //Comando para retornar o modelo da impressora
  if not vTemMFD then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    Exit;
  end;
  arquivoMFD := StringReplace(endereco, '.txt', '.BIN', [rfReplaceAll, rfIgnoreCase]);
  Retorno := ECF_DownloadMFD(arquivoMFD, '0', ' ', ' ', '0');
  if retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  Retorno := ecf_FormatoDadosMFD(pchar(arquivoMFD), pchar(endereco), '0', '2', pchar(cooInicial),
    pchar(cooFinal), '0');
  if Retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  Result := Retorno = 1;
end;

function TImpSWedaMFD.espelhoMFDporData(dataInicial, dataFinal, tipo, endereco,
  codProp: string): boolean;
var
  arquivoMFD, dtIni, dtFim, cFlag, cModeloImp: string;
begin
  if not vDadosIniF.existeComando('7', True) then
    Exit;
  cFlag := '1';
  SetLength(cModeloImp, 10);
  cModeloImp := vTipoImpressora;
  //Comando para retornar o modelo da impressora
  if not vTemMFD then //Verifica se é uma impressora com MFD
  begin
    application.MessageBox('Este modelo de impressora não da suporte a este comando!', 'ERRO',
      MB_ICONINFORMATION + MB_OK);
    Result := false;
    Exit;
  end;
  arquivoMFD := StringReplace(endereco, '.txt', '.bin', [rfReplaceAll, rfIgnoreCase]);
  dtIni := StringReplace(dataInicial, '/', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dataFinal, '/', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(dtIni, 5, 2);
  Delete(dtFim, 5, 2);
  dtIni := StringReplace(dtIni, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  dtFim := StringReplace(dtFim, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  Retorno := ECF_DownloadMFD(arquivoMFD, '0', ' ', ' ', '0');
  if retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao receber arquivo da MFD'), 'Erro', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  //  Retorno := ecf_HabilitaDesabilitaRetornoEstendidoMFD(pchar(cFlag));
  //  Retorno := ecf_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  Retorno := ecf_FormatoDadosMFD(pchar(arquivoMFD), pchar(endereco), '0', '1', pchar(dtIni),
    pchar(dtFim), pchar(codProp));
  if Retorno <> 1 then
  begin
    Application.MessageBox(pchar('Erro ao converter para arquivo eletronico'), 'Erro', MB_ICONERROR
      + MB_OK);
    Result := false;
    exit;
  end;
  Result := Retorno = 1;
end;

function TImpSWedaMFD.estadoDeEmissaoDoCupomFiscal: integer;
var
  FlagsFiscais: Integer;
  vCupoAberto,vFormPagAtv: Boolean;
  I: Integer;
  cValorSubTotal: string;
  cValorPago: string;
begin
  vCupoAberto := False;
  vFormPagAtv := False;
  cValorSubTotal := '';
  cValorPago:= '';
  FlagsFiscais:=0;
  Retorno := ECF_FlagsFiscais(FlagsFiscais);
  if FlagsFiscais >= 128 then FlagsFiscais := FlagsFiscais - 128;
  if FlagsFiscais >= 64 then FlagsFiscais := FlagsFiscais - 64;
  if FlagsFiscais >= 32 then FlagsFiscais := FlagsFiscais - 32;
  if FlagsFiscais >= 16 then FlagsFiscais := FlagsFiscais - 16;
  if FlagsFiscais >= 8 then FlagsFiscais := FlagsFiscais - 8;
  if FlagsFiscais >= 4 then FlagsFiscais := FlagsFiscais - 4;
  if FlagsFiscais >= 2 then
  begin
    FlagsFiscais := FlagsFiscais - 2;
    vFormPagAtv := True;
    for I := 1 to 14 do cValorSubTotal := cValorSubTotal + ' ';
    Retorno := ECF_SubTotal(pchar(cValorSubTotal));
    cValorSubTotal := Trim(cValorSubTotal);
    try
      StrToInt64(cValorSubTotal);
    except
      cValorSubTotal := '0';
    end;
  end;
  if FlagsFiscais >= 1 then
  begin
    vCupoAberto := True;
    for I := 1 to 14 do cValorPago := cValorPago + ' ';
    Retorno := ECF_ValorPagoUltimoCupom(pchar(cValorPago));
    cValorPago := Trim(cValorPago);
    try
      StrToInt64(cValorPago);
    except
      cValorPago := '0';
    end;
  end;
  if not vCupoAberto  then
    Result := 2
  else if vFormPagAtv then
  begin
    if StrToInt64(cValorPago) >= StrToInt64(cValorSubTotal) then
      Result := 2
    else
      Result := 1;
  end
  else
    Result := 0;
end;

function TImpSWedaMFD.existeReducaoZPendente:Integer;
begin
  Result := 2;
end;

function TImpSWedaMFD.FechaComprovanteNaoFiscalVinculado: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := ECF_FechaComprovanteNaoFiscalVinculado;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroCDC;
      if temp = '' then
        exit;
      vDocNaoF.cdc := temp;
      vDocNaoF.tipoDoc := 'CC';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
end;

function TImpSWedaMFD.FechaComprovanteNaoFiscalVinculadoTEF: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    Retorno := ECF_FechaComprovanteNaoFiscalVinculado;
    Result := Retorno;
    if not retorno_Imp then
      if vFVccancTef = 1 then
        Result := 0;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroCDC;
      if temp = '' then
        exit;
      vDocNaoF.cdc := temp;
      vDocNaoF.tipoDoc := 'CC';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
end;

function TImpSWedaMFD.fechaCupom: boolean;
begin
  Result := true;
  //  ECF_AbrePortaSerial;
  if ECF_FechaRelatorioGerencial = 0 then
    ECF_FechaComprovanteNaoFiscalVinculado;
  //  ECF_FechaPortaSerial;
end;

function TImpSWedaMFD.FechamentoDoDia: boolean;
var
  resp: string;
  i: Integer;
begin
  Result := true;
  if pos(trim(Numeroserie), vDadosIniF.getNumSerieEcfDescriptografado) = 0 then
  begin
    //      FechaPortaSerial;
    Result := false;
    exit;
  end;
  try
    Retorno := ECF_FechamentoDoDia;
    
  except
  end;
  Resp := '';
  while trim(resp) = '' do
  begin
    Sleep(5000);
    Resp := '';
    for i := 1 to 15 do begin Resp := Resp + ' '
    end;
    ECF_NumeroSerie(pchar(Resp));
    if trim(resp) <> '' then
      Retorno := 1;
  end;
  if not retorno_impGer(1) then
    Retorno := 0;
  if Retorno <> 1 then
    Application.MessageBox(pchar('O Sistema irá ler os dados da Redução e armazenar no Resumo'),
      'Confirmação',
      MB_ICONQUESTION + MB_OK);

  if vDadosIniF.getProgramacaoHorarioVerao = 'ATIVAR' then
    if Application.MessageBox(pchar('Foi feito um agendamento para Ativar'+
      ' o Horario de Verão. Confirma a Programação?'),'Confirmção',MB_YESNO+MB_ICONQUESTION) = IDYES then
          ProgramaHorarioVerao;

  diaCaixaFechado;
  LeTabelaResumo;
  if DateToStr(obConfImp.dataSet.FieldByName('diaaberto').AsDateTime) <> (FvDataRes) then
    FvDataRes := DateToStr(obConfImp.dataSet.FieldByName('diaaberto').AsDateTime);
  //    FechaPortaSerial;
end;

function TImpSWedaMFD.FechaPortaSerial: boolean;
begin
  Result := true;
  if vPortaAberta then
    exit;
  Retorno := ECF_FechaPortaSerial;
  Result := Retorno = 1;
end;

function TImpSWedaMFD.FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean;
begin

end;

function TImpSWedaMFD.FechaRelatorioGerencial: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    result := ECF_FechaRelatorioGerencial;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroGRG;
      if temp = '' then
        exit;
      vDocNaoF.grg := temp;
      vDocNaoF.tipoDoc := 'RG';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
end;

function TImpSWedaMFD.FechaRelatorioGerencialTEF: Integer;
var
  dataHoraUltDoc: string;
  temp: string;
begin
  try
    Retorno := ECF_FechaRelatorioGerencial;
    Result := Retorno;
    if not retorno_Imp then
      if vFVccancTef = 1 then
        Result := 0;
    if (Result = 1) and (vErroTEF <> 'S') then
    begin
      vDocNaoF.data := '';
      vDocNaoF.hora := '';
      vDocNaoF.tipoDoc := '';
      vDocNaoF.coo := '0';
      vDocNaoF.gnf := '0';
      vDocNaoF.grg := '0';
      vDocNaoF.cdc := '0';
      dataHoraUltDoc := dataHoraUltimoDocumento;
      if dataHoraUltDoc = '' then
        Exit;
      vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
      vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
      temp := NumeroCupom;
      if temp = '' then
        exit;
      vDocNaoF.coo := temp;
      temp := numeroGNF;
      if temp = '' then
        exit;
      vDocNaoF.gnf := temp;
      temp := numeroGRG;
      if temp = '' then
        exit;
      vDocNaoF.grg := temp;
      vDocNaoF.tipoDoc := 'RG';
      obDocNF.incluiDocNaoFIscal(vDocNaoF);
    end;
  finally
    vErroTEF := '';
  end;
end;

function TImpSWedaMFD.FecharOp: boolean;
begin
  Result := true;
  abrerelatorioGer;
  ECF_RelatorioGerencial('               FECHAMENTO DO OPERADOR           ');
  ECF_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', 48)));
  ECF_RelatorioGerencial(pchar('DATA.........: ' + datetostr(date)));
  ECF_RelatorioGerencial(pchar('CAIXA/PDV....: ' +
    vDadosIniF.StrZeroDec(obConfImp.dataSet.FieldByName('COD_TERMINAL').AsInteger, 4, 0)));
  ECF_RelatorioGerencial(pchar('NOME DO OP...: ' + trim(vDadosIniF.vNomeFuncionario)));
  ECF_RelatorioGerencial(' ');
  ECF_RelatorioGerencial(' ');
  ECF_RelatorioGerencial('        ---------------------------------       ');
  ECF_RelatorioGerencial('                  ASS. DO OPERADOR              ');
  FechaRelatorioGerencial;
end;

function TImpSWedaMFD.gerarArquivosConferenciaSintegraSPED(vNomeArqSint,
  vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean;
begin
  Result := False;
  Retorno :=
    ECF_RelatorioSintegraMFD(1,
      pchar(vNomeArqSint),
      pchar(copy(vDtIni,4,2)),
      pchar(copy(vDtIni,7,4)),
      pchar(copy(vDadosIniF.vEmp.vRazaoSocial,1,35)),
      pchar(copy(vDadosIniF.vEmp.vEndereco,1,34)),
      pchar(copy(vDadosIniF.vEmp.vNumeroEnd,1,5)),
      pchar(''),
      pchar(copy(vDadosIniF.vEmp.vBairro,1,15)),
      pchar(copy(vDadosIniF.vEmp.vCidade,1,30)),
      pchar(copy(vDadosIniF.vEmp.vCEP,1,12)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,12)),
      pchar(copy(vDadosIniF.vEmp.vTelefone,1,10)),
      pchar(copy(vDadosIniF.vEmp.vProprietario,1,18)));
  if Retorno <> 1 then
    exit;

  Result := arquivoMFDCotepe1704porData(vDtIni, vDtFim, vNomeArqCOTEPE, vDadosIniF.vCodPropEcf, 'MFD');
end;

function TImpSWedaMFD.getGrandeTotal: string;
var
  vlrGT: string;
  iConta: integer;
  temp: string;
begin
  vlrGT := '';
  for iConta := 1 to 18 do begin vlrGT := vlrGT + ' '
  end;
  Retorno := ECF_GrandeTotal(pchar(vlrGT));
  while Retorno <> 1 do
  begin
    if Application.MessageBox('GT. Impressora não responde. Tentar novamente',
      'Atenção',MB_YESNO+MB_ICONQUESTION) = IDNO then
      exit;
    Retorno := ECF_GrandeTotal(pchar(vlrGT));
  end;
  if not retorno_impGer(1) then
    Retorno := 0;
  if retorno <> 1 then
    temp := ''
  else
    temp := (copy(vlrGT, 1, 16) + ',' + copy(vlrGT, 17, 2));
  temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Result := temp;
end;

procedure TImpSWedaMFD.ImpDavsEmitidos;
var
  tipo: string;
  vTexto: string;
begin
  inherited;
  abrerelatorioGer;
  ECF_RelatorioGerencial('                  DAV EMITIDOS                  ');
  if vTemMFD then
    ecf_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', 48)))
  else
    ecf_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', 40)));
  ecf_RelatorioGerencial(pchar(vDadosIniF.Replicate(' ', 48)));

  obVenda.First;
  while not obVenda.eof do
  begin
    if obVenda.dataSet.FieldByName('TIPO').AsString = 'REQ' then
      tipo := 'PEDIDO'
    else if TRIM(obVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
      tipo := 'ORDEM SERVIÇO'
    else if obVenda.dataSet.FieldByName('TIPO').AsString = 'ORC' then
      tipo := 'ORÇAMENTO';

    vTexto := TamDesc(13, tipo) + '    ' +
      obVenda.dataSet.FieldByName('DATA_FECH').AsString + '       ' +
      vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
        vDadosIniF.vQtdeDigDAV)+'                                   ';

    ECF_RelatorioGerencial(pchar(copy(vTexto,1,48)));

    vTexto := 'COO Vinc: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('ncupom').AsInteger, 6) +
              ' COO Imp: ' + vDadosIniF.StrZero(obVenda.dataSet.FieldByName('coo_impressao').AsInteger, 6) +
              ' Valor: ' + Format('%5.2F', [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency]) +
              '                                   ';

    ECF_RelatorioGerencial(pchar(copy(vTexto,1,48)));

    ECF_RelatorioGerencial(pchar(vDadosIniF.Replicate(' ', 48)));

    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obVenda.close;
end;

procedure TImpSWedaMFD.ImpDavsOSEmitidos;
var
  tamanholinha: Integer;
begin
  inherited;
  if vTemMFD then
    tamanholinha := 48
  else
    tamanholinha := 40;
  abrerelatorioGer;
  ecf_RelatorioGerencial('            DAV-OS EMITIDOS           ');
  ecf_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', tamanholinha)));
  ecf_RelatorioGerencial(' ');
  ecf_RelatorioGerencial(' ');

  obVenda.First;
  while not obVenda.eof do
  begin
    ecf_RelatorioGerencial(pchar(vDadosIniF.StrZero(obVenda.dataSet.FieldByName('NPREVENDA').AsInteger,
      vDadosIniF.vQtdeDigDAV) + '             ' + Format('%10.2F',
      [obVenda.dataSet.FieldByName('VALOR_TOTAL').AsCurrency])));
    obVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obVenda.close;
end;

procedure TImpSWedaMFD.ImpIdentificacaoPAFECF;
var
  tamanhoLinha: Integer;
begin
  inherited;
  if vTemMFD then
    tamanhoLinha := 48
  else
    tamanhoLinha := 40;
  abrerelatorioGer;
  RelatorioGerencial2('             IDENTIFICAÇÃO DO PAF-ECF         ');
  RelatorioGerencial2(vDadosIniF.Replicate('=', 48));
  RelatorioGerencial2(vDadosIniF.Replicate(' ', 48));
  obIdentF.abreIdentFiscal(False);
  obIdentF.First;
  RelatorioGerencial2(TamDescricao(tamanholinha, 'Laudo Numero: ' +
    obIdentF.dataSet.FieldByName('n_laudo_fiscal').AsString) +
    TamDescricao(tamanholinha, obIdentF.dataSet.FieldByName('nome_empdes').AsString) +
    TamDescricao(tamanholinha, ' CNPJ: ' + obIdentF.dataSet.FieldByName('cnpj_empdes').AsString) +
    TamDescricao(tamanholinha, ' Endereço: ' +
      obIdentF.dataSet.FieldByName('endereco_empdes').AsString) +
    TamDescricao(tamanholinha, ' Bairro: ' + obIdentF.dataSet.FieldByName('bairro_empdes').AsString)
      +
    TamDescricao(tamanholinha, ' Cidade: ' + obIdentF.dataSet.FieldByName('cidade_empdes').AsString
      +
    ' UF: ' + obIdentF.dataSet.FieldByName('uf_empdes').AsString) +
    TamDescricao(tamanholinha, ' Telefone: ' + obIdentF.dataSet.FieldByName('fone_empdes').AsString)
      +
    TamDescricao(tamanholinha, ' Contato: ' +
      obIdentF.dataSet.FieldByName('contato_empdes').AsString) +
    TamDescricao(tamanholinha, obIdentF.dataSet.FieldByName('nome_paf').AsString) +
    TamDescricao(tamanholinha, ' ' + obIdentF.dataSet.FieldByName('nome_comercial').AsString));
  RelatorioGerencial2(TamDescricao(tamanholinha, ' Versão: ' +
    obIdentF.dataSet.FieldByName('versao_paf').AsString) +
    TamDescricao(tamanholinha, ' Principal Executavel: ' +
    obIdentF.dataSet.FieldByName('principal_exec').AsString) +
    TamDescricao(tamanholinha, ' MD5: ' + vDadosIniF.vMD5Fiscal));
  RelatorioGerencial2(' Outros arquivos e MD5');
  while not obIdentF.dataSet.Eof do
  begin
    RelatorioGerencial2(
      TamDescricao(tamanholinha, '  ' + obIdentF.dataSet.FieldByName('nome_arquivo').AsString) +
      TamDescricao(tamanholinha, '  ' + obIdentF.dataSet.FieldByName('md5_arquivo').AsString));
    obIdentF.next;
  end;
  obTermImp.abreTerminalImpressoras;
  RelatorioGerencial2('ECF''s Autorizados');
  obTermImp.First;
  while not obTermImp.dataSet.Eof do
  begin
    RelatorioGerencial2(' ' +
      vDadosIniF.decodifica(obTermImp.dataSet.FieldByName('num_serie_ecf').AsString));
    obTermImp.next;
  end;
  FechaRelatorioGerencial;
end;

procedure TImpSWedaMFD.ImpMeiosDePagamento;
var
  vTipDoc: string;
  vValorCancelado: Currency;
  aFinal: array[1..99] of string;
  aValor: array[1..99] of Currency;
  I, flFinal: Integer;
  tamanholinha: integer;
begin
  inherited;
  for I := 1 to 99 do
  begin
    aFinal[i] := '';
    aValor[i] := 0;
  end;
  if vTemMFD then
    tamanholinha := 48
  else
    tamanholinha := 40;
  abrerelatorioGer;
  ecf_RelatorioGerencial('               MEIOS DE PAGAMENTO               ');
  ecf_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', tamanholinha)));
  ecf_RelatorioGerencial(pchar(TamDescricao(tamanholinha, vTituloRel)));
  ecf_RelatorioGerencial(' ');
  ecf_RelatorioGerencial(' ');
  obCupom.vMeiosPag.First;
  while not obCupom.vMeiosPag.dataSet.Eof do
  begin
    vtipDoc := '';
    vValorCancelado := obCupom.vMeiosPag.getValorCancelado(
      obCupom.vMeiosPag.dataSet.FieldByName('cod_finalizador').AsInteger,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime,
      obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime);
    if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString <> 'CUP' then
      vValorCancelado := 0;
    if vValorCancelado < obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat then
    begin
      if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'CUP' then
        vtipDoc := trim('Cupom Fiscal')
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'REC' then
        vtipDoc := 'Comprovante Nao Fiscal - ' +
          Trim(obCupom.vMeiosPag.dataSet.FieldByName('DESCRICAO').AsString)
      else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'SUP' then
        vtipDoc := TamDesc(tamanholinha, 'Comprovante Não Fiscal - ') + 'Suprimento';
      if vTemMFD then

        ecf_RelatorioGerencial(pchar(
          TamDescricao(24, trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) +
          ' - ' + obCupom.vMeiosPag.dataSet.FieldByName('tipo_final').AsString) +
          TamDescricao(12, trim(obCupom.vMeiosPag.dataSet.FieldByName('data').AsString)) +
          TamDescricao(12, format('%9.2f', [obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
          vValorCancelado]))
            + TamDescricao(tamanholinha, vTipDoc) + TamDescricao(tamanholinha, ' ')))
      else
        ecf_RelatorioGerencial(pchar(
          TamDescricao(20, trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) +
          ' - ' + obCupom.vMeiosPag.dataSet.FieldByName('tipo_final').AsString) +
          TamDescricao(10, trim(obCupom.vMeiosPag.dataSet.FieldByName('data').AsString)) +
          TamDescricao(10, format('%9.2f', [obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
          vValorCancelado]))
            + TamDescricao(tamanholinha, vTipDoc) + TamDescricao(tamanholinha, ' ')));
      flFinal := 0;
      for I := 1 to 99 do
      begin
        if aFinal[i] = trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString) then
        begin
          aValor[i] := aValor[i] + obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
            vValorCancelado;
          flFinal := 1;
          Break;
        end;
      end;
      if flFinal = 0 then
      begin
        for I := 1 to 99 do
        begin
          if aFinal[i] = '' then
          begin
            aFinal[i] := trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString);
            aValor[i] := aValor[i] + obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
              vValorCancelado;
            Break;
          end;
        end;
      end;
    end;
    obCupom.vMeiosPag.next;
  end;
  for i := 1 to 99 do
  begin
    if aFinal[i] <> '' then
    begin
      ecf_RelatorioGerencial(pchar(TamDescricao(20, afinal[i]) +
        TamDescricao(20, Format('%12.2f', [aValor[i]]))));
    end
    else
      Break;
  end;
  FechaRelatorioGerencial;
  obCupom.vMeiosPag.close;
end;

procedure TImpSWedaMFD.ImpResumoVnd;
var
  vindbarra, vindprod: string;
begin
  abrerelatorioGer;
  ECF_RelatorioGerencial('     RELATORIO DE QTDE DE PRODUTOS VENDIDOS ');
  ECF_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', 48)));
  ECF_RelatorioGerencial(' ');
  ECF_RelatorioGerencial(' ');
  while not obCupom.vTotalVenda.eof do
  begin
    //    obProd.vCodBarra.selecionaCodBarra(Trim(obCupom.vTotalVenda.dataSet.fieldbyname('codbarra').AsString));
    if obProd.selecionaProdutoGrupoCodigo(
      obCupom.vTotalVenda.dataSet.fieldbyname('GRUPO_PROD').AsInteger,
      obCupom.vTotalVenda.dataSet.fieldbyname('COD_PROD').AsString) then
      ECF_RelatorioGerencial(pchar(TamDescricao(48,TamDesc(29, obProd.dataSet.FieldByName('descr_prod').AsString) +
        '  ' + format('%8.5f', [obCupom.vTotalVenda.dataSet.fieldbyname('SOMA').AsFloat]))));
    obCupom.vTotalVenda.dataSet.next;
  end;
  FechaRelatorioGerencial;
  obCupom.vTotalVenda.close;
end;

function TImpSWedaMFD.imprimeDavNoEcf(dav: RVenda): boolean;
var
  temp: string;
  tamanhoLinha: integer;
  I: Integer;
begin
  if vTemMFD then
    tamanhoLinha := fQtdeColunasImpressao
  else
    tamanhoLinha := fQtdeColunasImpressao;
  abrerelatorioGer;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Documento Auxiliar de Venda'));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Doc Nº ' + vDadosIniF.StrZero(dav.nprevenda,
    vDadosIniF.vQtdeDigDAV) +
    '  Nº Doc Fiscal ___________'));
  temp := '';
  if dav.tipo_venda = 'REQ' then
    temp := 'Pedido de Venda Nº '
  else if TRIM(dav.tipo_venda) = 'OS' then
    temp := 'Ordem de Serviço Nº '
  else if dav.tipo_venda = 'ORC' then
    temp := 'Orçamento Nº ';
  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  //  RelatorioGerencial2(TamDescricao(tamanhoLinha, temp + vDadosIniF.StrZero(dav.nped, 8)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Cliente: ' +
    vDadosIniF.StrZero(dav.cod_cliente,
    6)
    + ' ' + dav.nome_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Endereço: ' + dav.endereco_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.bairro_cliente + ', ' + dav.cidade_cliente
    +
    '-'
    + dav.estado_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CPF/CNPJ: ' +
    vDadosIniF.StrZero(dav.cnpjcpf_cliente, 14) + '  Insc Est: ' + dav.insc_cliente));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Telefone: ' + dav.fone_cliente + '  Cond.Pag: '
    + dav.cond_pag));
  if Trim(dav.linhaAd1) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd1)));
  if Trim(dav.linhaAd2) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd2)));
  if Trim(dav.linhaAd3) <> '' then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, Trim(dav.linhaAd3)));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,
    'PRODUTO/SERVIÇO  QTDE     VL UNIT      VL TOTAL'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  for I := 0 to dav.qtde_Produtos + dav.qtde_Servicos - 1 do
  begin
    temp := IntToStr(i + 1) + ' ';
    if dav.item[i].tipo = 'P' then
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod) + ' ' + dav.item[i].cod_prod;
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end
    else
    begin
      temp := temp + IntToStr(dav.item[i].grupo_prod);
      if trim(dav.item[i].descr_red) <> '' then
        temp := temp + ' ' + dav.item[i].descr_red
      else
        temp := temp + ' ' + dav.item[i].descr;
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := '';
      if dav.item[i].desc_item > 0 then
        temp := 'desconto  ' + vDadosIniF.StrZero(Trim(Format('%10.2f', [(dav.item[i].desc_item
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%'
      else if dav.item[i].acresc_intem > 0 then
        temp := 'acrescimo ' + vDadosIniF.StrZero(Trim(Format('%10.2f',
          [(dav.item[i].acresc_intem
            /
            (dav.item[i].qtde * dav.item[i].vl_unit) * 100)])), 5) + '%';
      if temp <> '' then
        RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
      temp := vDadosIni.AlnDir(Format('%6.' + dav.item[i].csdecqtde + 'f',
        [dav.item[i].qtde]), 21);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%8.' + dav.item[i].csdecvlunt + 'f',
        [dav.item[i].vl_unit])), 12);
      temp := temp + vDadosIniF.AlnDir(trim(Format('%10.2f', [(dav.item[i].qtde *
          dav.item[i].vl_unit) + dav.item[i].acresc_intem - dav.item[i].desc_item])), 15);
      RelatorioGerencial2(TamDescricao(tamanhoLinha, temp));
    end;
  end;
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Produtos..: ' +
      IntToStr(dav.qtde_Produtos)));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Qtde de Serviços..: ' +
      IntToStr(dav.qtde_Servicos)));
  if dav.qtde_Produtos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Produtos....: ' + Format('%12.2f',
      [dav.valor_produtos])));
  if dav.qtde_Servicos > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Serviços....: ' + Format('%12.2f',
      [dav.valor_servicos])));
  if dav.desconto > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Desconto..........: ' + Format('%12.2f',
      [dav.desconto])));
  if dav.acrescimo > 0 then
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Acréscimo.........: ' + Format('%12.2f',
      [dav.acrescimo])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'Total Líquido.....: ' + Format('%12.2f',
    [dav.valor_liquido])));
  RelatorioGerencial2(TamDescricao(tamanhoLinha,'Obs.: ' + dav.observacao));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  if dav.usar_Declaracao = 'S' then
  begin
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'Autorizo, nos termos do parágrafo 2º do artigo'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      '43 do codigo de defesa do consumidor o registro'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'do meu debito no servico de protecao ao credito,'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'e a respectiva correcao monetaria, ate a data'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha, 'do seu efetivo pagamento, caso haja'));
    RelatorioGerencial2(TamDescricao(tamanhoLinha,
      'inadimplencia de minhas obrigaçoes perante esta.'));

    RelatorioGerencial2(TamDescricao(tamanhoLinha, ' '));
  end;
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, '______________________________'));
  RelatorioGerencial2(centralizaDescricao(tamanhoLinha, 'Assinatura'));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, dav.empresa + '    ' + dav.fone_Empresa));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'CNPJ: ' + dav.cgc_emp));
  RelatorioGerencial2(vDadosIniF.Replicate('-', tamanhoLinha));
  RelatorioGerencial2(TamDescricao(tamanhoLinha, 'E VEDADA A AUTENTICACAO DESTE DOCUMENTO'));
  result := FechaRelatorioGerencial = 1;
end;

function TImpSWedaMFD.Imprime_Prazo: boolean;
var
  ixx, i: integer;
  vcount, vfl, vret: integer;
  iInicio: Ttime;
  mes: array[1..12] of string;
  vdia, vmes, vano: word;
  cdinheiro: string;
begin
  Result := true;
  reimprime :='1';
  mes[1] := 'JANEIRO';
  mes[2] := 'FEVEREIRO';
  mes[3] := 'MARÇO';
  mes[4] := 'ABRIL';
  mes[5] := 'MAIO';
  mes[6] := 'JUNHO';
  mes[7] := 'JULHO';
  mes[8] := 'AGOSTO';
  mes[9] := 'SETEMBRO';
  mes[10] := 'OUTUBRO';
  mes[11] := 'NOVEMBRO';
  mes[12] := 'DEZEMBRO';
  //
 // BlockInput(true);
  if not obEmpresa.Active then
    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
  //
  vimptef := 1;
  vret := 1;
  vcanctef := 0;
  if reimprime = '0' then
  begin
    cdinheiro := vDadosIniF.StrZeroDec(StrToFloat(Fvvalpr), 15, 2);
    delete(cdinheiro, 13, 1);
    if vacr = 1 then
      ECF_AbreComprovanteNaoFiscalVinculado(pchar('Prazo     '), pchar(cdinheiro),
        pchar(vDadosIniF.StrZeroDec(Fvnc, 6, 0)));
  end
  else abrerelatorioGer;
  for i := 1 to obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger do
    // QtdCpNF.value do
  begin
    obCupom.vFPg.First;
    vcount := 1;
    while not obCupom.vFPg.eof do
    begin
      decodedate(obCupom.vFPg.dataSet.FieldByName('data_venc').AsDateTime, vano, vmes, vdia);
      vret := 1;
      if reimprime = '0' then
      begin
        if vcount > 1 then
        begin
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar(vDadosIniF.Replicate('=', 48))) = 0
            then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar(vDadosIniF.vEmp.vRazaoSocial)) = 0 then
            break;
          if
            ECF_UsaComprovanteNaoFiscalVinculado(pchar(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring)) = 0 then
            break;
          if
            ECF_UsaComprovanteNaoFiscalVinculado(pchar(obEmpresa.dataSet.FieldByName('bairro_emp').AsString +
            ', ' + obEmpresa.dataSet.FieldByName('cidade_emp').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString)) = 0 then
            break;
          if
            ECF_UsaComprovanteNaoFiscalVinculado(pchar(obEmpresa.dataSet.FieldByName('TELEFONE_EMP').AsString + ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario)) = 0 then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar(vDadosIniF.Replicate('=', 48))) = 0
            then
            break;
        end;
        //
        if ECF_UsaComprovanteNaoFiscalVinculado('Reconheco o valor da divida abaixo:') =
          0
          then
          break;
        if ECF_UsaComprovanteNaoFiscalVinculado(pchar(vDadosIniF.Replicate('-', 48))) = 0 then
          break;
        if ECF_UsaComprovanteNaoFiscalVinculado(pchar(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('NDOC').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString)) = 0 then
          break;
        if ECF_UsaComprovanteNaoFiscalVinculado(pchar('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat]))) = 0 then
          break;
        if ECF_UsaComprovanteNaoFiscalVinculado(pchar('OPERADOR: ' +
          vDadosIniF.vNomeFuncionario))
          = 0 then
          break;
        if ECF_UsaComprovanteNaoFiscalVinculado(' ') = 0 then
          break;
        if ECF_UsaComprovanteNaoFiscalVinculado(' ') = 0 then
          break;
        if ECF_UsaComprovanteNaoFiscalVinculado(pchar(vDadosIniF.Replicate('-', 48))) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString)) = 0 then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('bairro').AsString))) = 0 then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('cpfcgc').AsString)) = 0 then
            break;
        end
        else
        begin
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('CLIENTE: ' + obCupom.getNomeAvulso)) =
            0
            then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('ENDERECO: ' + obCupom.getBairroAvulso
            +
            ' ' + obCupom.getCidadeAvulso)) = 0 then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('CPF/CNPJ: ' +
            obCupom.getCpfCnpjAvulso))
            =
            0 then
            break;
        end;
        if
          ECF_UsaComprovanteNaoFiscalVinculado(pchar(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString))) = 0 then
          break;
      end
      else
      begin
        if vcount > 1 then
        begin
          if ECF_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', 48))) = 0 then
            break;
          if ECF_RelatorioGerencial(pchar(obEmpresa.dataSet.FieldByName('NOME_EMP').AsString))
            = 0
            then
            break;
          if
            ECF_RelatorioGerencial(pchar(obEmpresa.dataSet.FieldByName('endreco_emp').asstring + ',' +
      obEmpresa.dataSet.FieldByName('numero_end').asstring))
            = 0 then
            break;
          if ECF_RelatorioGerencial(pchar(obEmpresa.dataSet.FieldByName('BAIRRO_EMP').AsString
            +
            ', ' + obEmpresa.dataSet.FieldByName('CIDADE_EMP').AsString + '-' +
            obEmpresa.dataSet.FieldByName('sigla_uf').AsString)) = 0 then
            break;
          if
            ECF_RelatorioGerencial(pchar(obEmpresa.dataSet.FieldByName('TELEFONE_EMP').AsString
            +
            ' ' + 'OPERADOR: ' + vDadosIniF.vNomeFuncionario)) = 0 then
            break;
          if ECF_RelatorioGerencial(pchar(vDadosIniF.Replicate('=', 48))) = 0 then
            break;
        end;
        if ECF_RelatorioGerencial('Reconheco o valor da divida abaixo:') = 0 then
          break;
        if ECF_RelatorioGerencial(pchar(vDadosIniF.Replicate('-', 48))) = 0 then
          break;
        if ECF_RelatorioGerencial(pchar(' N.CUPOM: [' +
          obCupom.vFPg.dataSet.FieldByName('ndoc').AsString + '] VENC.: ' +
          obCupom.vFPg.dataSet.FieldByName('data_venc').AsString)) = 0 then
          break;
        if ECF_RelatorioGerencial(pchar('   VALOR: ' + format('%n',
          [obCupom.vFPg.dataSet.FieldByName('valordoc').AsFloat]))) = 0 then
          break;
        if ECF_RelatorioGerencial(pchar('OPERADOR: ' + vDadosIniF.vNomeFuncionario)) = 0 then
          break;
        if ECF_RelatorioGerencial(' ') = 0 then
          break;
        if ECF_RelatorioGerencial(' ') = 0 then
          break;
        if ECF_RelatorioGerencial(pchar(vDadosIniF.Replicate('-', 48))) = 0 then
          break;
        if obCupom.getNomeAvulso = '' then
        begin
          if ECF_RelatorioGerencial(pchar('CLIENTE: ' +
            vDadosIniF.StrZeroDec(obCliente.dataSet.FieldByName('cod_cliente').AsInteger, 5, 0)
            +
            ' '
            + obCliente.dataSet.FieldByName('nome_cliente').AsString)) = 0 then
            break;
          if ECF_RelatorioGerencial(pchar('ENDERECO:' +
            trim(obCliente.dataSet.FieldByName('Endereco').AsString) + ' ' +
            Trim(obCliente.dataSet.FieldByName('Bairro').AsString))) = 0 then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('CPF/CNPJ: ' +
            obCliente.dataSet.FieldByName('Cpfcgc').AsString)) = 0 then
            break;
        end
        else
        begin
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('CLIENTE: ' + obCupom.getNomeAvulso)) =
            0
            then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('ENDERECO: ' +
            obCupom.getEnderecoAvulso
            +
            ' ' + obCupom.getBairroAvulso)) = 0 then
            break;
          if ECF_UsaComprovanteNaoFiscalVinculado(pchar('CPF/CNPJ: ' +
            obCupom.getCpfCnpjAvulso))
            =
            0 then
            break;
        end;
        if
          ECF_RelatorioGerencial(pchar(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').AsString))) = 0 then
          break;
      end;
      if vret = 0 then
        break;
      retorno_ImpTEF;
      if vcanctef <> 0 then
        vret := 0;
      if vret = 0 then
        break;
      obCupom.vFPg.next;
      inc(vcount);
      if obCupom.vFPg.eof then
      begin
        {     if reimprime = '0' then
             begin
              vret:=ECF_UsaComprovanteNaoFiscalVinculado(' ');
              vret:=ECF_UsaComprovanteNaoFiscalVinculado(' ');
             end
             else
             begin
              vret:=ECF_RelatorioGerencial(' ');
              vret:=ECF_RelatorioGerencial(' ');
             end;
             if vret = 0 then
              break;}
      end
      else
      begin
        if reimprime = '0' then
        begin
          vret := ECF_UsaComprovanteNaoFiscalVinculado(' ');
          vret := ECF_UsaComprovanteNaoFiscalVinculado(' ');
          vret := ECF_UsaComprovanteNaoFiscalVinculado(' ');
          vret := ECF_UsaComprovanteNaoFiscalVinculado(' ');
        end
        else
        begin
          vret := ECF_RelatorioGerencial(' ');
          vret := ECF_RelatorioGerencial(' ');
          vret := ECF_RelatorioGerencial(' ');
          vret := ECF_RelatorioGerencial(' ');
        end;
      end;
    end;
    if vret = 0 then
      break
    else
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        vret := ECF_RelatorioGerencial(' ');
        if vret = 0 then
          break;
        vret := ECF_RelatorioGerencial(' ');
        if vret = 0 then
          break;
      end;
    end;
    if i <> 2 then
    begin
      if obConfImp.dataSet.FieldByName('qt_vias_naofiscais').AsInteger > 1 then
      begin
        iInicio := time;
        if reimprime = '0' then
        begin
          vret := ECF_UsaComprovanteNaoFiscalVinculado(' ');
          if vret = 0 then
            break;
          vret := ECF_UsaComprovanteNaoFiscalVinculado(' ');
          if vret = 0 then
            break;
        end
        else
        begin
          vret := ECF_RelatorioGerencial(' ');
          if vret = 0 then
            break;
          vret := ECF_RelatorioGerencial(' ');
          if vret = 0 then
            break;
        end;
        //   IF dm.TBConfImpQtdCpNF.value > 1 then
       //    begin
        repeat
        until ((time - iInicio) > strtotime('00:00:02'));
        //    end;
      end;
    end;
  end;
  if vret = 0 then
    Imprime_Prazo := false
  else
  begin
    if reimprime = '1' then
      FechaRelatorioGerencial
    else
      FechaComprovanteNaoFiscalVinculado;
    Imprime_Prazo := true;
  end;
end;

function TImpSWedaMFD.ImpTirouZSoz(vdat1, Vdat2: Tdate): boolean;
var
  Zpend: string;
begin
  SetLength(Zpend, 2);
  Retorno := ECF_VerificaZPendente(pchar(Zpend));
  Result := copy(Zpend, 1, 1) = '0';
  exit;
  if vdat1 = Vdat2 then
    Result := true
  else
    result := false;
end;

function TImpSWedaMFD.IniciaFechamentoCupom(AcrescimoDesconto,
  TipoAcrescimoDesconto: string; ValorAcrescimoDesconto: real): boolean;
var
  cDes_Acres: string;
  vrAcumGT: Currency;
begin
  Result := true;

  cDes_Acres := vDadosIniF.StrZeroDec(ValorAcrescimoDesconto, 15, 2);
  delete(cDes_Acres, 13, 1);
  vrAcumGT := ValorAcrescimoDesconto;
  Retorno := 0;
  while Retorno = 0 do
  begin
    Retorno := ECF_IniciaFechamentoCupom(pchar(AcrescimoDesconto), '$', pchar(cDes_Acres));
    if Retorno <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        Break;
    end
    else Break;
    BlockInput(true);
    Sleep(2000);
    BlockInput(true);
  end;
  if (retorno = 1) and (AcrescimoDesconto = 'A') then
    vdadosIniF.acumulaGrandeTotal(vrAcumGT);
  if not retorno_impGer(1) then
    Retorno := 0;

  if retorno <> 1 then
  begin
    Analisa_iRetorno;
    IniciaFechamentoCupom := false;
    exit;
  end;
end;

function TImpSWedaMFD.IniciaFechamentoCupomMFD(AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto: string): boolean;
begin

end;

function TImpSWedaMFD.LeituraMemoriaFiscalData(vdata1, vdata2,
  CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
  end;
  Result := true;
  if not vTemMFD then
  begin
    Retorno := ECF_LeituraMemoriaFiscalData(pchar(vdata1), pchar(vdata2));
    Analisa_iRetorno;
  end
  else
  begin
    Retorno := ECF_LeituraMemoriaFiscalDataMFD(pchar(vdata1), pchar(vdata2),
      pchar(CompletaSimplificada));
    Analisa_iRetorno;
  end;
end;

function TImpSWedaMFD.LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): boolean;
begin

end;

function TImpSWedaMFD.LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal,
  CompletaSimplificada: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('5', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('6', True) then
      Exit;
  end;
  Result := true;
  if not vTemMFD then
  begin
    Retorno := ECF_LeituraMemoriaFiscalReducao(pchar(ReducaoInicial), pchar(ReducaoFinal));
    Analisa_iRetorno;
  end
  else
  begin
    Retorno := ECF_LeituraMemoriaFiscalReducaoMFD(pchar(ReducaoInicial), pchar(ReducaoFinal),
      pchar(CompletaSimplificada));
    Analisa_iRetorno;
  end;
end;

function TImpSWedaMFD.LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpSWedaMFD.LeituraMemoriaFiscalSerialData(DataInicial, DataFinal,
  CompletaSimplificada, endereco: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
  end;
  Result := true;
  if not vTemMFD then
  begin
    Retorno := ECF_LeituraMemoriaFiscalSerialData(pchar(DataInicial),
      pchar(DataFinal));
    Analisa_iRetorno;
  end
  else
  begin
    Retorno := ECF_LeituraMemoriaFiscalSerialDataMFD(pchar(DataInicial),
      pchar(DataFinal), pchar(CompletaSimplificada));
    Analisa_iRetorno;
  end;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpSWedaMFD.LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): boolean;
begin

end;

function TImpSWedaMFD.LeituraMemoriaFiscalSerialReducao(ReducaoInicial,
  ReducaoFinal, CompletaSimplificada, endereco: string): boolean;
begin
  if CompletaSimplificada = 'c' then
  begin
    if not vDadosIniF.existeComando('3', True) then
      Exit;
  end
  else if CompletaSimplificada = 's' then
  begin
    if not vDadosIniF.existeComando('4', True) then
      Exit;
  end;
  Result := true;
  if not vTemMFD then
  begin
    Retorno := ECF_LeituraMemoriaFiscalSerialReducao(pchar(ReducaoInicial), pchar(ReducaoFinal));
    Analisa_iRetorno;
  end
  else
  begin
    Retorno := ECF_LeituraMemoriaFiscalSerialReducaoMFD(pchar(ReducaoInicial), pchar(ReducaoFinal),
      pchar(CompletaSimplificada));
    Analisa_iRetorno;
  end;
  if Result then
    copyArquivo(fPathRetornoTXT, endereco);
end;

function TImpSWedaMFD.LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): boolean;
begin

end;

function TImpSWedaMFD.LeituraX: boolean;
begin
  Result := true;
  Retorno := ECF_LeituraX();
  Analisa_iRetorno();
end;

function TImpSWedaMFD.LeTabelaResumo: boolean;
var
  i: Integer;
  sDataReducao: string;
  sHoraReducao: string;
  temp: string;
  valorTemp: Currency;
  Arq: TextFile;
  vl: Integer;
  resp: string;
begin
  result := true;
  RelatorioTipo60Mestre;
  for i := 1 to 6 do sDataReducao := sDataReducao + ' ';
  for i := 1 to 6 do sHoraReducao := sHoraReducao + ' ';
  Retorno := ECF_DataHoraReducao(pchar(sDataReducao), pchar(sHoraReducao));
  Insert('/', sDataReducao, 3);
  Insert('/', sDataReducao, 6);
  Insert(':', sHoraReducao, 3);
  Insert(':', sHoraReducao, 6);

  retorno := ECF_DadosUltimaReducaoMFD(Conteudo);
  CopyMemory(@dadosZ, @conteudo, 1278);
  FvDataRes := dadosZ.DataMovimento;
  Insert('/', FvDataRes, 3);
  Insert('/', FvDataRes, 6);
  FvDataRes := DateToStr(StrToDate(FvDataRes));
  vMapaResumo.dataRed := sDataReducao;
  vMapaResumo.horaRed := sHoraReducao;
  vMapaResumo.nreducoes := StringReplaceHw(dadosZ.CRZ, ',', ' ', true);
  vMapaResumo.coored := StringReplaceHw(dadosZ.COO, ',.', '  ', true);
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.C_ICMS, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.C_ISS, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.C_NFISC, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  vMapaResumo.vlCancel := CurrToStr(valorTemp);

  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.A_ICMS, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.A_ISS, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.A_NFISC, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  vMapaResumo.vlAcrescimo := CurrToStr(valorTemp);

  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.D_ICMS, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.D_ISS, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.D_NFISC, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  vMapaResumo.vlDesconto := CurrToStr(valorTemp);

  vMapaResumo.vlISS := '0';

  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.I_ICMS, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.I_ISS, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  vMapaResumo.vlIsentos := CurrToStr(valorTemp);

  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.N_ICMS, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.N_ISS, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  vMapaResumo.vlNaoIncidencia := CurrToStr(valorTemp);

  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.F_ICMS, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.F_ISS, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  vMapaResumo.vlSubst := CurrToStr(valorTemp);

  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.A_ICMS, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.A_ISS, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  temp := vDadosIniF.StrZero(StringReplaceHw(dadosZ.A_NFISC, ',.', '  ', true), 30);
  valorTemp := valorTemp + StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));

  Retorno := ECF_MapaResumo;
  if Retorno = 1 then
  begin
    AssignFile(Arq, fPathRetornoTXT);
    try
      reset(arq);
    except
      messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 4 then
        begin
          vMapaResumo.vlTotLiq := trim(copy(resp, 34, length(resp)));
          break;
        end;
        vl := vl + 1;
      end;
    end;
    CloseFile(Arq);
  end;
  temp := vDadosIniF.StrZero(StringReplaceHw(vMapaResumo.vlTotLiq, ',.', '  ', true), 30);
  valorTemp := StrToCurr(Copy(temp, 1, 28) + ',' + Copy(temp, 29, 2));
  vMapaResumo.vlTotLiq := CurrToStr(valorTemp);
  montaMaparesumo;
end;

function TImpSWedaMFD.MontaDescricao(vdesc, vunidade: string): string;
begin
  if Faitred = 'S' then
    Result := copy(vdesc, 1, 24) + ' ' + copy(vunidade, 1, 3)
  else
    Result := trim(vdesc) + ' ' + copy(vunidade, 1, 3);
end;

procedure TImpSWedaMFD.montaMaparesumo;
var
  registros: TStringList;
  indices: TStringList;
  I: Integer;
  aliqIndices: AnsiString;
  temp: string;
  temp1: string;
  vAliq: TAliquota;
  indicador: string;
begin
  inherited;
  indices := TStringList.Create;
  for i := 1 to 300 do aliqIndices := aliqIndices + ' ';
  Retorno := ECF_LerAliquotasComIndice(pchar(aliqIndices));
  while true do
  begin
    temp := Copy(aliqIndices, 1, 6); Delete(temp, 2, 1);
    indices.Add(temp);
    aliqIndices := Copy(aliqIndices, 8, length(aliqIndices));
    if trim(aliqIndices) = '' then
      Break;
  end;

  registros := TStringList.Create;
  for I := 0 to indices.count - 1 do
  begin
    //    temp:=dadosZ.Aliquotas[i];insert(temp,',',3);
    temp := indices[i];
    temp1 := Format('%16.2f', [StrToFloat(trim(dadosZ.ParciaisTributados[i])) / 100]);
    //    dadosZ.ParciaisTributados[i];insert(temp,',',14);
    registros.Add(temp + '.....' + temp1);
  end;
  registros.Add('F1........' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.F_ICMS,
    ',.',
      '  ', true))) / 100]));
  registros.Add('I1........' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.I_ICMS,
    ',.',
      '  ', true))) / 100]));
  registros.Add('N1........' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.N_ICMS,
    ',.',
      '  ', true))) / 100]));
  registros.Add('FS1.......' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.F_ISS, ',.',
      '  ', true))) / 100]));
  registros.Add('IS1.......' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.I_ISS, ',.',
      '  ', true))) / 100]));
  registros.Add('NS1.......' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.N_ISS, ',.',
      '  ', true))) / 100]));
  //  registros.Add('OPNF......' + Format('%12.2f',[StrToFloat(trim(StringReplaceHw(dadosZ.F_ISS))/100]));
  registros.Add('DT........' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.D_ICMS,
    ',.',
      '  ', true))) / 100]));
  registros.Add('DS........' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.D_ISS, ',.',
      '  ', true))) / 100]));
  registros.Add('AT........' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.A_ICMS,
    ',.',
      '  ', true))) / 100]));
  registros.Add('AS........' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.A_ISS, ',.',
      '  ', true))) / 100]));
  registros.Add('Canc-T....' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.C_ICMS,
    ',.',
      '  ', true))) / 100]));
  registros.Add('Canc-S....' + Format('%12.2f', [StrToFloat(trim(StringReplaceHw(dadosZ.C_ISS, ',.',
      '  ', true))) / 100]));

  vMapaResumo.qtdeAliq := registros.Count;

  SetLength(vMapaResumo.valiqs, vMapaResumo.qtdeAliq);
  vAliq := TAliquota.create;
  vAliq.getTodos;

  for I := 0 to registros.Count - 1 - 12 do
  begin
    vMapaResumo.valiqs[i].aliq := vDadosIniF.StrZero(I + 1, 2) + copy(registros[i], 1, 5);
    vMapaResumo.valiqs[i].valor := StrToCurr(StringReplaceHw(copy(registros[i], 11,
      length(registros[i])), '.', ' ', True));
    vMapaResumo.valiqs[I].seq := vDadosIniF.StrZero(i + 1, 2);
  end;
  for I := (registros.Count - 12) to registros.Count - 1 do
  begin
    vMapaResumo.valiqs[i].aliq := StringReplaceHw(Copy(registros[i], 1, 10), '.', ' ', true);
    // + ',' + Copy(registros[i], 3, 2);
  //    vMapaResumo.valiqs[i].aliq := StringReplace(vMapaResumo.valiqs[i].aliq, '.', '', [rfReplaceAll, rfIgnoreCase]);
  //    registros[I] := Copy(registros[i], 11, Length(registros[i]));
  //    registros[I] := StringReplace(registros[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
  //    registros[I] := StringReplace(registros[i], ':', '', [rfReplaceAll, rfIgnoreCase]);
  //    registros[I] := StringReplace(registros[i], ' ', '', [rfReplaceAll, rfIgnoreCase]);
    temp := trim(Copy(registros[i], 11, length(registros[i])));
    vMapaResumo.valiqs[i].valor := StrToCurr(temp);
    vMapaResumo.valiqs[i].seq := vDadosIniF.StrZero(i + 1, 2);
  end;
end;

function TImpSWedaMFD.numeroCCF: string;
var
  sCCF: string;
  cont: integer;
begin
  for cont := 1 to 6 do sCCF := sCCF + ' ';
  //  if  vTemMFD = 'S' then
  Retorno := ECF_ContadorCupomFiscalMFD(pchar(sCCF));
  //  else
  //    sCCF := NumeroCupom;
  result := sCCF;
end;

function TImpSWedaMFD.numeroCDC: string;
var
  sCDC: string;
  cont: integer;
begin
  for cont := 1 to 6 do sCDC := sCDC + ' ';
  Retorno := ecf_ContadorComprovantesCreditoMFD(pchar(sCDC));
  result := sCDC;
end;

function TImpSWedaMFD.numeroCER: string;
var
  sCER: string;
  cont: integer;
begin
  for cont := 1 to 6 do sCER := sCER + ' ';
  Retorno := ECF_ContadorRelatoriosGerenciaisMFD(pchar(sCER));
  result := sCER;
end;

function TImpSWedaMFD.numeroCOO: string;
begin
  Result := NumeroCupom;
end;

function TImpSWedaMFD.NumeroCupom: string;
var
  sNumeroCupom: string;
  i: Integer;
begin
  for i := 1 to 6 do sNumeroCupom := sNumeroCupom + ' ';
  Retorno := ECF_NumeroCupom(pchar(sNumeroCupom));
  Result := trim(sNumeroCupom);
end;

function TImpSWedaMFD.numeroGNF: string;
var
  sGNF: string;
  cont: integer;
begin
  for cont := 1 to 6 do sGNF := sGNF + ' ';
  //  if  vTemMFD = 'S'  then
  Retorno := ECF_NumeroOperacoesNaoFiscais(pchar(sGNF));
  //  ELSE
  //    sGNF := NumeroCupom;
  result := sGNF;
end;

function TImpSWedaMFD.numeroGRG: string;
var
  sGRG: string;
  cont: integer;
begin
  for cont := 1 to 6 do sGRG := sGRG + ' ';
  Retorno := ECF_ContadorRelatoriosGerenciaisMFD(pchar(sGRG));
  result := sGRG;
end;

function TImpSWedaMFD.NumeroSerie: string;
var
  retorno_var: string;
  iConta: integer;
begin
  Retorno_var := '';
  if vTemMFD then
  begin
    for iConta := 1 to 20 do Retorno_var := Retorno_var + ' ';
    retorno := ECF_NumeroSerieMFD(pchar(Retorno_var));
  end
  else
  begin
    for iConta := 1 to 15 do Retorno_var := Retorno_var + ' ';
    Retorno := ECF_NumeroSerie(pchar(Retorno_var));
  end;
  Analisa_iRetorno();
  if Retorno > 0 then
    NumeroSerie := retorno_var
  else
  begin
    ShowMessage(retorno_var);
    NumeroSerie := '';
  end;
end;

function TImpSWedaMFD.NumeroSerieMFD: string;
begin

end;

function TImpSWedaMFD.obterCNPJUsuario: string;
var
  vCNPJ: string;
  i: integer;
begin
  vCNPJ := '';
  for i := 1 to 20 do vCNPJ := vCNPJ + ' ';
  if vTemMFD then
    Retorno := ECF_CNPJMFD(pchar(vCNPJ))
  else
    vCNPJ := '';
  result := trim(removeCaracteresCNPJ(vCNPJ));
end;

function TImpSWedaMFD.PrazoECF: boolean;
var
  vret: integer;
begin
  Result := true;
  reimprime := '0';
  vacr := 1;
  while not Imprime_Prazo do
  begin
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if reimprime = '1' then
        FechaRelatorioGerencial
      else
        FechaComprovanteNaoFiscalVinculado;
      break;
    end
    else
    begin
      Result := true;
      //tef      sTEFRetorno := '0';
      if reimprime = '1' then
      begin
        vret := FechaRelatorioGerencial;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaRelatorioGerencial
          else
          begin
            Result := false;
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        if not result then
          //tef        if sTEFRetorno = '1' then
          break;
      end
      else
      begin
        vret := FechaComprovanteNaoFiscalVinculado;
        while vret = 0 do
        begin
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
            vret := FechaComprovanteNaoFiscalVinculado
          else
          begin
            Result := FALSE;
            //tef            sTEFRetorno := '1';
            break;
          end
        end;
        if not result then
          //tef        if sTEFRetorno = '1' then
          break;
        if vret <> 0 then
          reimprime := '1';
      end;
    end;
  end;
  //  ECF_FechaPortaSerial;
end;

function TImpSWedaMFD.ProgramaFormaPagamentoMFD(FormaPagto,
  OperacaoTef: string): boolean;
begin

end;

function TImpSWedaMFD.ProgramaHorarioVerao: boolean;
var
  vHorarioVerao: string;
  I: Integer;
begin
  Result := true;
  vHorarioVerao:='';
  for I := 1 to 2 do vHorarioVerao := vHorarioVerao + ' ';
  Retorno := ECF_VerificaHorarioVerao(pchar(vHorarioVerao));
  vHorarioVerao := Copy(Trim(vHorarioVerao),1,1);
  if vHorarioVerao = '1' then
  begin
    Application.MessageBox('Horário de verão já esta ativado','Atenção',0+64);
    Result := False;
    Exit;
  end;
  Retorno := ECF_ProgramaHorarioVerao();
  if Retorno = 0 then
    result:= false;
end;

function TImpSWedaMFD.RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  Retorno := ECF_RecebimentoNaoFiscal(pchar(indicetotalizador), pchar(Valor),
    pchar(FormaPagamento));
  if Retorno <> 1 then
    result := False;
  Analisa_iRetorno;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

procedure TImpSWedaMFD.recuperacaoAutomaticaAliquotas;
var
  vAliq: TAliquota;
  I: Integer;
  sAliquotas, sIndices, temp, tempInd: string;
  cont, contIndices: integer;
  indices: TStringList;
  aliqIndices: AnsiString;
begin
  inherited;

  indices := TStringList.Create;
  for i := 1 to 300 do aliqIndices := aliqIndices + ' ';
  Retorno := ECF_LerAliquotasComIndice(pchar(aliqIndices));
  while true do
  begin
    temp := Copy(aliqIndices, 1, 6); Delete(temp, 2, 1);
    indices.Add(temp);
    aliqIndices := Copy(aliqIndices, 8, length(aliqIndices));
    if trim(aliqIndices) = '' then
      Break;
  end;
  vAliq := TAliquota.create;
  vAliq.apagaAliquotas;
  cont := 1;
  for I := 0 to indices.Count - 1 do
  begin
    temp := copy(indices[i], 1, 1);
    if temp = 'T' then
      temp := 'N';
    vAliq.incluiAliquota(vDadosIniF.StrZero(i + 1, 2), temp,
      StrToFloat(copy(indices[i], 2, 2) + ',' +
      copy(indices[i], 4, 2)), i + 1);
  end;
  vAliq.free;
  vAliq := nil;
end;

procedure TImpSWedaMFD.regconfPorta(vport: string);
var
  inifile: Tinifile;
  vTemp: String;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'SWC.INI');
  IniFile.WriteString('COMUNICAÇÃO', 'PORTA', vport);
  inifile.Free;
  IniFile := TIniFile.Create(vDadosIniF.vEndConfigDll + 'SWC.INI');
  IniFile.WriteString('COMUNICAÇÃO', 'PORTA', vport);
  inifile.Free;
end;

function TImpSWedaMFD.RelatorioGerencial(Texto: string): Integer;
begin
  Result := ECF_RelatorioGerencial(pchar(Texto));
end;

function TImpSWedaMFD.RelatorioGerencial2(Texto: string): Integer;
begin
  Result := 0;
  while Result = 0 do
  begin
    Result := ECF_RelatorioGerencial(pchar(Texto));
    if Result <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        Break;
    end
    else Break;
  end;
end;

function TImpSWedaMFD.RelatorioTipo60Mestre: boolean;
var
  Arq: TextFile;
  vl: Integer;
  resp: string;
begin
  Retorno := ECF_RelatorioTipo60Mestre;
  if Retorno = 1 then
  begin
    AssignFile(Arq, fPathRetornoTXT);
    try
      reset(arq);
    except
      messagedlg('Erro ao abrir o arquivo de retorno da impressora', mtinformation, [mbOK], 0);
      Result := false;
      exit;
    end;
    vl := 1;
    while not eof(arq) do
    begin
      ReadLn(Arq, resp);
      if resp <> '' then
      begin
        if vl = 7 then // coo inicial
          Fvcooini := trim(copy(resp, 28, 30));
        if vl = 8 then // coo final
          Fvcoofin := trim(copy(resp, 28, 30));
        if vl = 9 then // contador de reduções
          FvContRed := trim(copy(resp, 28, 30));
        if vl = 10 then // reinicio de operações
          FvcontRein := trim(copy(resp, 28, 30));
        if vl = 11 then // Venda bruta
          FvvendBr := vDadosIniF.tirapontos(trim(copy(resp, 28, 30)), 2);
        if vl = 12 then // Grante Total
          FvGrandT := vDadosIniF.tirapontos(trim(copy(resp, 28, 30)), 2);
        vl := vl + 1;
      end;
    end;
    CloseFile(Arq);
  end;
end;

function TImpSWedaMFD.RetornoImpressora(var ACK, ST1, ST2: Integer): boolean;
var iRetorno: integer;
begin
    iRetorno:=  ECF_VerificaEstadoImpressora(ACK, ST1, ST2);
    Analisa_iRetorno;
    if iRetorno = 1 then
      result:= true
    else
      result:= false;

end;

function TImpSWedaMFD.retorno_Imp: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := ECF_NumeroSerie(pchar(cNumeroSerie));
  iRetorno := ECF_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      vFVccancTef := 1;
      //vcanctef := 1;
      Retorno_Imp := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_Imp := false;
    end;
  end
  else
    Retorno_Imp := true;
end;

function TImpSWedaMFD.retorno_ImpGer(vflap: integer): boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  vflg: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  //
  iRetorno := ecf_RetornoImpressora(iACK, iST1, iST2);
  {  if retorno <> 1 then
      Result := false
    else
    begin}
  if iACK = 6 then
  begin
    vflg := 0;
    if iST2 >= 128 then
    begin
      if vflap = 1 then
        messagedlg('Parâmetro inválido', mtinformation, [mbOK], 0);
      iST2 := iST2 - 128;
      result := false;
      vflg := 1;
    end;
    if iST2 >= 64 then
    begin
      iST2 := iST2 - 64;
      vflg := 1;
    end;
    if iST2 >= 32 then
    begin
      iST2 := iST2 - 32;
      vflg := 1;
    end;
    if iST2 >= 16 then
    begin
      iST2 := iST2 - 16;
      if vflap = 1 then
        messagedlg('Aliquota não Programada', mtinformation, [mbOK], 0);
      result := false;
      vflg := 1;
    end;
    if iST2 >= 8 then
    begin
      iST2 := iST2 - 8;
    end;
    if iST2 >= 4 then
    begin
      iST2 := iST2 - 4;
    end;
    if iST2 >= 2 then
    begin
      iST2 := iST2 - 2;
    end;
    if iST2 >= 1 then
    begin
      iST2 := iST2 - 1;
      if vflap = 1 then
        messagedlg('Comando não Executado', mtinformation, [mbOK], 0);
      result := false;
      vflg := 1;
    end;
    if vflg = 0 then
      result := true;
  end
  else
    result := true;
end;

function TImpSWedaMFD.Retorno_Impressora:boolean;
begin
  inherited;
  Result := Retorno = 1;  
end;

function TImpSWedaMFD.Retorno_impTEF: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  iRetorno := ecf_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      Retorno_ImpTEF := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      Retorno_ImpTEf := false;
    end;
  end;

end;

function TImpSWedaMFD.Sangria(Valor: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  Retorno := ECF_Sangria(pchar(valor));
  if retorno <> 1 then
    result := false;
  Analisa_iRetorno;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpSWedaMFD.SubTotal: string;
var
  vlrultc: string;
  iConta: integer;
begin
  vlrultc := '';
  for iConta := 1 to 14 do vlrultc := vlrultc + ' ';
  Retorno := 0;

  while Retorno = 0 do
  begin
    Retorno := ECF_SubTotal(pchar(vlrultc));
    if Retorno <> 1 then
    begin
      BlockInput(False);
      if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
        'Atenção', MB_ICONEXCLAMATION + MB_YESNO) = mrNo then
        Break;
    end
    else Break;
    BlockInput(true);
    Sleep(2000);
    BlockInput(true);
  end;
  if retorno <> 1 then
    SubTotal := ''
  else
    SubTotal := (copy(vlrultc, 1, 12) + ',' + copy(vlrultc, 13, 2));
end;

function TImpSWedaMFD.Suprimento(Valor, FormaPagamento: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  Retorno := ECF_Suprimento(pchar(Valor), pchar(Formapagamento));
  if retorno <> 1 then
    result := false;
  Analisa_iRetorno;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.coo := NumeroCupom;
    vDocNaoF.gnf := numeroGNF;
    vDocNaoF.tipoDoc := 'CN';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpSWedaMFD.TerminaFechamentoCupom(linha1, linha2, linha3, linha4,
  linha5, linha6, linha7, linha8: string): boolean;
var
  dataHoraUltDoc: string;
begin
  Result := true;
  if not vTemMFD then
  begin
    if trim(linha1) <> '' then
      linha1 := Copy(linha1, 1, 40);
    if trim(linha2) <> '' then
      linha2 := Copy(linha2, 1, 40);
    if trim(linha3) <> '' then
      linha3 := Copy(linha3, 1, 40);
    if trim(linha4) <> '' then
      linha4 := Copy(linha4, 1, 40);
    if trim(linha5) <> '' then
      linha5 := Copy(linha5, 1, 40);
    if trim(linha6) <> '' then
      linha6 := Copy(linha6, 1, 40);
    if trim(linha7) <> '' then
      linha7 := Copy(linha7, 1, 40);
    if trim(linha8) <> '' then
      linha8 := Copy(linha8, 1, 40);
  end;

  Retorno := ECF_TerminaFechamentoCupom(pchar(linha1 + linha2 + linha3 + linha4 + linha5 +
    linha6 + linha7 + linha8));
  if not retorno_impGer(1) then
    Retorno := 0;
  while retorno <> 1 do
  begin
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      TerminaFechamentoCupom := false;
      exit;
      break;
    end
    else
      Retorno := ECF_TerminaFechamentoCupom(pchar(linha1 + linha2 + linha3 + linha4 + linha5
        + linha6 + linha7 + linha8));
  end;
  if Result then
  begin
    vDocNaoF.data := '';
    vDocNaoF.hora := '';
    vDocNaoF.tipoDoc := '';
    vDocNaoF.coo := '0';
    vDocNaoF.gnf := '0';
    vDocNaoF.grg := '0';
    vDocNaoF.cdc := '0';
    dataHoraUltDoc := dataHoraUltimoDocumento;
    vDocNaoF.data := Copy(dataHoraUltDoc, 1, 10);
    vDocNaoF.hora := Copy(dataHoraUltDoc, 12, 8);
    vDocNaoF.tipoDoc := 'RV';
    vDocNaoF.coo := NumeroCupom;
    obDocNF.incluiDocNaoFIscal(vDocNaoF);
  end;
end;

function TImpSWedaMFD.UsaComprovanteNaoFiscalVinculado(Texto: string): Integer;
begin
  result := ECF_UsaComprovanteNaoFiscalVinculado(pchar(texto));
end;

function TImpSWedaMFD.ValorPagoCupomAtual: string;
var
  cValorPago: string;
  I: Integer;
begin
  for I := 1 to 14 do cValorPago := cValorPago + ' ';
  Retorno := ECF_ValorPagoUltimoCupom(pchar(cValorPago));
  cValorPago := Trim(cValorPago);
  try
    cValorPago := IntToStr(StrToInt64(cValorPago));
  except
    cValorPago := '0';
  end;
  if cValorPago = '0' then
    Result := '0'
  else
    Result := Format('%0.2f',[StrToInt64(cValorPago) / 100]);
end;

function TImpSWedaMFD.vendadeItens(ccodigo, cDescricao, cAliquota, cTipoQtde,
  cQtde: string; iCasasDecimais: integer; cValor, cTipoDesconto,
  cValorDesc: string): boolean;
var
  cValorAc: string;
begin
  //
  if not vTemMFD then
    ccodigo := Copy(ccodigo,2,13);
  
  Result := true;
  if pos('-', cValorDesc) > 0 then
  begin
    cValorAc := cValorDesc;
    Delete(cValorAc, 1, 1);
    cValorDesc := '0';
  end
  else
    cValorAc := '0';
  retorno := ECF_VendeItemDepartamento(pchar(cCodigo),
    pchar(cDescricao),
    pchar(cAliquota),
    pchar(cValor),
    pchar(cQtde),
    pchar(cValorAc),
    pchar(cValorDesc),
    '01', ' ');
  if retorno <> 1 then
    Result := false
  else
  begin
    if not retorno_impGer(1) then
      result := false
    else
      result := true;
  end;
end;

function TImpSWedaMFD.VendeItem(Codigo, Descricao, Aliquota, TipoQuantidade,
  Quantidade: string; CasasDecimais: Integer; ValorUnitario: real;
  TipoDesconto: string; Desconto1, Desconto2, nquant: real): boolean;
var
  vflgn, iretorno: integer;
  vvp: string;
  vrAcumGT: Currency;
begin
  Result := true;
  vFqtdDig := 3;
  if vFqtdDig = 3 then
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 3);
    delete(Fvcpreco, 6, 1);
  end
  else
  begin
    vFvcpreco := vDadosIniF.StrZeroDec(valorunitario, 9, 2);
    delete(Fvcpreco, 7, 1);
  end;
  vFvcpreco := convNumero2(valorunitario);
  valorunitario := convNumero(ValorUnitario);
  if vtipoArredond <> 'A' then
  begin
    if pos(',', vFvcpreco) > 0 then
    begin
      if vFqtdDig = 3 then
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 3)
      else
        vFvcpreco := copy(vFvcpreco, 1, pos(',', vFvcpreco) - 1) + ',' + copy(vFvcpreco,
          pos(',',
          vFvcpreco) + 1, 2);
    end;
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 3);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end
  else
  begin
    vFvcTotal := FloatToStrF((nquant * strtofloat(vFvcpreco)), ffgeneral, 12, 2);
    vrAcumGT := StrToCurr(trim(vFvcTotal));
    while pos('.', FvcTotal) > 0 do
      delete(FvcTotal, pos('.', FvcTotal), 1);
    if vFqtdDig = 3 then
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 3)
    else
      vFvcpreco := vDadosIniF.StrZeroDec(strtofloat(vFvcpreco), 09, 2);
  end;
  if vFqtdDig = 3 then
    delete(Fvcpreco, 6, 1)
  else
    delete(Fvcpreco, 7, 1);
  if pos(',', vFvcTotal) > 0 then
    vFvcTotal := copy(vFvcTotal, 1, pos(',', vFvcTotal) - 1) + ',' + copy(vFvcTotal, pos(',',
      vFvcTotal) + 1, 2);

  if (Desconto1 > 0) or (Desconto2 > 0) then
    vFValorLiq := floattostr((strtofloat(vFvcTotal) - strtofloat(vFcdescit)))
  else
    vFValorLiq := vFvcTotal;
  vFvcTotal := vDadosIniF.StrZeroDec(strtofloat(vFvcTotal), 13, 2);
  delete(FvcTotal, 11, 1);

  if (Desconto1 > 0) or (Desconto2 > 0) then
  begin
    vFcdescit := vDadosIniF.StrZeroDec(desconto2 + ((desconto1 * Valorunitario) / 100), 9, 2);
    delete(Fcdescit, 7, 1);
  end
  else if ((Desconto1 < 0) or (Desconto2 < 0)) and (vDadosIniF.existeComando('2', false)) then
    // o Valor negativo do desconto significa que é acrescimo
  begin
    if vDadosIniF.existeComando('2', false) then
    begin
      vFcdescit := vDadosIniF.StrZeroDec(((-1) * desconto2) + ((((-1) * desconto1) *
        Valorunitario) / 100), 9, 2);
      delete(Fcdescit, 7, 1);
      vFValorLiq := FloatToStr(StrToFloat(vFValorLiq) + (StrToFloat(vFcdescit)) / 100);
      vrAcumGT := vrAcumGT + (StrToCurr(trim(vFcdescit)) / 100);

      Fcdescit := '-' + Fcdescit;
    end;
  end
  else
    vFcdescit := '00000000';

  vflgn := 0;
  while not vendadeItens(Codigo, Descricao, Aliquota, 'F', quantidade, vFqtdDig,
    vFvcpreco, '$', vFcdescit) do
  begin
    if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      vflgn := 1;
      break;
    end;
  end;
  if vflgn = 1 then
  begin
    VendeItem := false;
    exit;
  end;
  vdadosIniF.acumulaGrandeTotal(vrAcumGT);
end;

function TImpSWedaMFD.VendeItemSimples(pCodigo, pDescricao, pAliquota: string;
  pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean;
var
  cQtde,cValor,cDesconto,cAcrescimo:string;
  vrTemp,vrDesc,vrAcres,vrTot:Real;
  vQtde:string;
begin
//  vQtde := cMascQuant(pQuantidade);
//  Result := VendeItem(pCodigo,pDescricao,pAliquota,'F',vQtde,FqtdDig,pValorUnitario,'$',
//    pDescontoPercentual,pDescontoValor,pQuantidade);
  Result := False;
  vrTemp := getQuantidadeComCasasDecimais(pQuantidade);
  cQtde := Format('%12.'+IntToStr(FqtdDigQtde)+'f',[vrTemp]);

  vrTemp := getValorUnitarioComCasasDecimais(pValorUnitario);
  cValor := Format('%15.3f',[vrTemp]);

  cQtde := StringReplace(Trim(cQtde),',','',[rfReplaceAll]);
  cValor := StringReplace(Trim(cValor),',','',[rfReplaceAll]);

  vrTemp := getValorTotalComCasasDecimais( pValorUnitario * pQuantidade);
  vFValorLiq := Format('%0.2f',[vrTemp]);
  vrTot := vrTemp;

  cDesconto := '000';
  cAcrescimo := '000';
  if (pDescontoPercentual > 0) or (pDescontoValor > 0) then
  begin
    vrDesc := vDadosIniF.StrToFloatFormat( ((vrTot * pDescontoPercentual) / 100) + pDescontoValor,2);
    cDesconto := Format('%0.2f',[vrDesc]);
    cDesconto := StringReplace(Trim(cDesconto),',','',[rfReplaceAll]);
    vFValorLiq := Format('%0.2f',[StrToFloat(vFValorLiq) - vrDesc]);
  end
  else if (pDescontoPercentual < 0)  or (pDescontoValor < 0) then
  begin
    if vDadosIniF.existeComando('2', false) then
    begin
      vrAcres := vDadosIniF.StrToFloatFormat( ((vrTot * ((-1)*pDescontoPercentual)) / 100) + ((-1)*pDescontoValor),2);
      cAcrescimo := Format('%0.2f',[vrAcres]);
      cAcrescimo := StringReplace(Trim(cAcrescimo),',','',[rfReplaceAll]);
      vFValorLiq := Format('%0.2f',[vrAcres + StrToFloat(vFValorLiq)]);
      vrTot := vrTot + vrAcres;
    end;
  end;

  while True do
  begin
    retorno := ECF_VendeItemDepartamento(pchar(pCodigo),
      pchar(pDescricao),
      pchar(pAliquota),
      pchar(cValor),
      pchar(cQtde),
      pchar(cAcrescimo),
      pchar(cDesconto),
      '01',
      '  ');
    result := Retorno_Impressora;
    if Result then
    begin
      vDadosIniF.acumulaGrandeTotal(vrTot);
      Break;
    end
    else
    begin
      Application.ProcessMessages;
      if Application.MessageBox(pchar('Problemas no envio de informações para a impressora.' + #13 +
      'Tentar Novamente'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
        Break;
    end;
  end;
end;

function TImpSWedaMFD.VerificaImpressoraLigada: boolean;
begin
  NumeroCupom;
  Result := (Retorno = 1);
end;                         

function TImpSWedaMFD.verificaPapel: boolean;
var
  iretorno, iACK, iST1, iST2: Integer;
  cNumeroSerie: string;
  iConta: integer;
begin
  Result := true;
  iACK := 0; iST1 := 0; iST2 := 0;
  for iConta := 1 to 15 do begin cNumeroSerie := cNumeroSerie + ' '
  end;
  iRetorno := ECF_NumeroSerie(pchar(cNumeroSerie));
  iRetorno := ECF_RetornoImpressora(iACK, iST1, iST2);
  if iACK = 6 then
  begin
    if iST1 >= 128 then
    begin
      iST1 := iST1 - 128;
      FVccancTef := 1;
      vcanctef := 1;
      verificaPapel := false;
    end;
    if iST1 >= 64 then
    begin
      iST1 := iST1 - 64;
      verificaPapel := false;
    end;
  end
  else
    verificaPapel := true;
end;

function TImpSWedaMFD.Verifica_Impressora: boolean;
begin

end;

*)

end.

