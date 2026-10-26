unit uImpressoraF;

interface

uses
  Controls, uRecord, Classes;

type
  RetornoDLL_ECF = record
    comando, estadoComunicacao, estadoImpressora, estadoFiscal, estadoFuncao, retornoFuncao:string;
  end;
  TImpressoraF = class(TObject)
  private
    fSemArquivoAux: Boolean;
    fSemDireitoDeUso: Boolean;
  protected
    fQtdeColunasImpressao: Integer;
    //    FDataSource: TDataSource;
    Faitred: string;
    FvTipoImpressora: string;
    FvtipoArredond: string;
    FvPorta: integer;
    FVccancTef: integer;
    FTpVnd: integer;
    FTecPDV: string;
    FqtdDig, FqtdDigQtde: integer; //Qtde Digitos Valor Unitário
    Fvcpreco, FvcTotal: string;
    FValorLiq, Fcdescit: string;
    FNumSerieEcf: string;
    FDataECF, FHoraEcf: string;
    vnotif, vvcart, reimprime, vlinhaTef: string;
    vnomefTef: array[1..10] of string;
    vvalfTef: array[1..10] of string;
    vflretp, vflret, iconta, vnivel, vimptef, vcanctef, itxtef1, itxtef, vseqarqt, vacr: integer;
    Fvvalpr: string;
    Fvnc: integer;
    FvDataRes,FvHoraRes, Fvcooini, Fvcoofin, FvContRed, FvcontRein, FvvendBr, FvGrandT: string;
    Fvmodimpbema: string;
    // Variavel para Sweda
      Fvpfch: string;
    Fvqtparc: string;
    Fvleg: string;
    Fvlegsup: string;
    Fvtitulo: string;
    FvtituloSup: string;
    FvUnidade: string;
    FTemMFD: Boolean;
    FPermitirVenda: Boolean;
    FCodigoFFImpressora:String;
    FvErroTEF:string;
    FvTituloRel:string;
    fPathRetornoTXT: string;
    //    FMapaResumo: RmapaResumo;
        // propriedades para impressão do cupom
        //vflretp:  // propriedade de alteração de preco
        //    FiConta: integer;
    //Variavel de retorno das funcoes das dll's
    vRetornoDll:RetornoDLL_ECF;
    //------------------------------------------
    procedure GetDirList(Directory,extensao: string; var Result: TStrings);
    function StringReplaceHw(valor,procurar,substituir:string;retirarBrancos:boolean):string;
    function removeCaracteresCNPJ(cnpj:string):string;
    procedure removerLinhasEmBranco(Afile: string);
  public
    vMapaResumo: RmapaResumo;
    vDocNaoF: RDocNaoFiscais;
    function AbrePortaS(vportaCom: string): boolean; virtual; abstract;
    function AbrecomprovanteNaoFiscal(FormaPagamento: string; Valor: string; NumeroCupom: string):
      boolean; virtual; abstract;
    function VerificaImpressoraLigada: boolean; virtual; abstract;
    function FechaPortaSerial: boolean; virtual; abstract;
    function NumeroCupom: string; virtual; abstract;
    function RetornoImpressora(var ACK: Integer; var ST1: Integer; var ST2: Integer): boolean;
      virtual; abstract;
    function FechamentoDoDia: boolean; virtual; abstract;
    function RelatorioTipo60Mestre: boolean; virtual; abstract;
    function CancelaCupom(vsubtr: integer): boolean; virtual; abstract;
    function AcionaGaveta: boolean; virtual; abstract;
    function AbreCupom(CGC_CPF: string): boolean; virtual; abstract;
    function VendeItem(Codigo: string; Descricao: string; Aliquota: string; TipoQuantidade: string;
      Quantidade: string;
      CasasDecimais: Integer; ValorUnitario: real; TipoDesconto: string; Desconto1, Desconto2: real;
      nquant: real): boolean; virtual; abstract;
    function DataHoraImpressora(Data: string; Hora: string): boolean; virtual; abstract;
    function AberturaDoDia(ValorCompra: string; FormaPagamento: string): boolean; virtual; abstract;
    function LeituraX: boolean; virtual; abstract;
    function SubTotal: string; virtual; abstract;
    function IniciaFechamentoCupom(AcrescimoDesconto: string; TipoAcrescimoDesconto: string;
      ValorAcrescimoDesconto: real): boolean; virtual; abstract;
    function EfetuaFormaPagamento(FormaPagamento: string; ValorFormaPagamento: real; vcodFinal:
      integer): boolean; virtual; abstract;
    function TerminaFechamentoCupom(linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8:
      string): boolean; virtual; abstract;
    function ProgramaHorarioVerao: boolean; virtual; abstract;
    function DesprogramaHorarioVerao: boolean; virtual; abstract;
    function CancelaItemGenerico(NumeroItem: real): boolean; virtual; abstract;
    function Sangria(Valor: string): boolean; virtual; abstract;
    function Suprimento(Valor: string; FormaPagamento: string): boolean; virtual; abstract;
    function AbreCupomMFD(CGC: string; Nome: string; Endereco: string): boolean; virtual; abstract;
    function NumeroSerieMFD: string; virtual; abstract;
    function LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada,
      endereco: string): boolean; virtual; abstract;
    function LeituraMemoriaFiscalData(vdata1, vdata2, CompletaSimplificada: string): boolean;
      virtual; abstract;
    function NumeroSerie: string; virtual; abstract;
    function ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: string): boolean; virtual; abstract;
    function IniciaFechamentoCupomMFD(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimo,
      ValorDesconto: string): boolean; virtual; abstract;
    function EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas,
      DescricaoFormaPagto: string): boolean; virtual; abstract;
    function LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, CompletaSimplificada, endereco:
      string): boolean; virtual; abstract;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: string):
      boolean; virtual; abstract;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura: string): boolean;
      virtual; abstract;
    function LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, CompletaSimplificada:
      string): boolean;
      virtual; abstract;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura: string):
      boolean; virtual; abstract;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura:
      string): boolean; virtual; abstract;
    function RecebimentoNaoFiscal(IndiceTotalizador: string; Valor: string; FormaPagamento: string):
      boolean; virtual; abstract;
    function AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco: string): boolean; virtual; abstract;
    function EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento: string): boolean;
      virtual; abstract;
    function FechaRecebimentoNaoFiscalMFD(Mensagem: string): boolean; virtual; abstract;
    function AbreComprovanteNaoFiscalVinculado(Forma_de_Pagamento: string; Valor_Pago: string;
      Numero_do_Cupom: string): Integer; virtual; abstract;
    function FechaRelatorioGerencial: Integer; virtual; abstract;
    function FechaRelatorioGerencialTEF: Integer; virtual; abstract;
    function FechaComprovanteNaoFiscalVinculado: Integer; virtual; abstract;
    function FechaComprovanteNaoFiscalVinculadoTEF: Integer; virtual; abstract;
    function UsaComprovanteNaoFiscalVinculado(Texto: string): Integer; virtual; abstract;
    function RelatorioGerencial(Texto: string): Integer; virtual; abstract;
    function RelatorioGerencial2(Texto: string): Integer; virtual; abstract;
    function retorno_Imp: boolean; virtual; abstract;
    function retorno_ImpGer(vflap: integer): boolean; virtual; abstract;
    function Retorno_impTEF: boolean; virtual; abstract;
    function cMascara(vvalor: real; vqtd: real; idx: integer; vdesc1: real; vdesc2: real): string;
      virtual; abstract;
    function cMascQuant(vqtd: real): string; virtual; abstract;
    function Descricaoimp(vdesc: string): string; virtual; abstract;
    function convNumero(var Valor: real): real; virtual; abstract;
    function convNumero2(var Valor1: real): string; virtual; abstract;
    function defAtribTef: string; virtual; abstract;
    function DefCodFinalPrazo: string; virtual; abstract;
    function Imprime_Prazo: boolean; virtual; abstract;
    function PrazoECF: boolean; virtual; abstract;
    function fechaCupom: boolean; virtual; abstract;
    function verificaPapel: boolean; virtual; abstract;
    function FecharOp: boolean; virtual; abstract;
    function LeTabelaResumo: boolean; virtual; abstract;
    function TamDesc(vtam: integer; DescriTam: string): string;
    function TamDescricao(vtam: integer; DescriTam: string): string;
		function centralizaDescricao(vtam: integer; Descricao: string): string;
		function insertMultString(pTam: Integer; const pPos: array of integer; const pStrs: array of string): string;
    function defvalsangsup(vvalsangsup: real): string; virtual; abstract;
    function abrerelatorioGer: boolean; virtual; abstract;
    function numeroCOO: string; virtual; abstract;
    function numeroCCF: string; virtual; abstract;
    function numeroGNF: string; virtual; abstract;
    function numeroGRG: string; virtual; abstract;
    function numeroCDC: string; virtual; abstract;
    function numeroCER: string; virtual; abstract;
    procedure regconfPorta(vport: string); virtual; abstract;
    procedure ImpResumoVnd; virtual; abstract;
    procedure ImpDavsEmitidos; virtual; abstract;
    procedure ImpDavsOSEmitidos; virtual; abstract;
    procedure ImpMeiosDePagamento; virtual; abstract;
    procedure ImpIdentificacaoPAFECF; virtual; abstract;
    function MontaDescricao(vdesc, vunidade: string): string; virtual; abstract;
    function ImpTirouZSoz(vdat1: Tdate; Vdat2: Tdate): boolean; virtual; abstract;
    function diaCaixaFechado: Boolean; virtual; abstract;
    function getGrandeTotal: string; virtual; abstract;
    function cadastraNovoTotalizadorNaoFiscal(nomeTotaliz: string; codigo: integer): integer;
      virtual; abstract;
    procedure recuperacaoAutomaticaAliquotas; virtual; abstract;
    function imprimeDavNoEcf(dav: RVenda): boolean; virtual; abstract;
    function copyArquivo(pathOrigem, pathDestino: string): boolean;
    function espelhoMFDporData(dataInicial, dataFinal, tipo, endereco, codProp: string): boolean;
      virtual; abstract;
    function espelhoMFDporCOO(cooInicial, cooFinal, tipo, endereco, codProp: string): boolean;
      virtual; abstract;
    function arquivoMFDCotepe1704porData(dataInicial, dataFinal, endereco, codProp, pTipo: string): boolean;
      virtual; abstract;
    function arquivoMFDCotepe1704porCOO(cooInicial, cooFinal, endereco, codProp, pTipo: string): boolean;
      virtual; abstract;
    function dataHoraUltimoDocumento:String;virtual; abstract;
    procedure montaMaparesumo;virtual; abstract;
    function cupomAberto:boolean;virtual;abstract;
    procedure cancelaCupomTEF;virtual;abstract;
    function obterCNPJUsuario:string;virtual;abstract;
    procedure acionaCortePapel(corteCompleto, gerencial :boolean);virtual;abstract;
    function Retorno_Impressora:boolean;virtual;abstract;
    function Verifica_Impressora:boolean;virtual;abstract;
    function existeReducaoZPendente:Integer;virtual;abstract;//0:Nao existe Z Pendente; 1: Z Pendente; 2: Erro
    procedure defineArredondamentoTruncamento;virtual;abstract;
    function VendeItemSimples(pCodigo: string; pDescricao, pAliquota: string;
      pValorUnitario, pQuantidade, pDescontoPercentual, pDescontoValor: Real): boolean; virtual;abstract;
    function CancelamentoNaoFiscal:boolean; virtual;abstract;// Cancela o atual ou ultimo documento nao fiscal, Sangria , suprimento, prestacao
    /// Retorna o estado do cupom atual. 0: Aberto; 1: Subtotalizado; 2: Soma fechada
    function estadoDeEmissaoDoCupomFiscal: integer;virtual;abstract;
    function ValorPagoCupomAtual: string; virtual; abstract;
    procedure Analisa_iRetorno; virtual; abstract;
    function gerarArquivosConferenciaSintegraSPED(vNomeArqSint, vNomeArqCOTEPE, vDtIni, vDtFim: string): boolean; virtual; abstract;
    procedure EqualizarVelocidade; virtual; abstract;

    function getValorUnitarioComCasasDecimais(valor:Currency):Currency;//faz o truncamento ou arredondamento do valor unitario
    function getQuantidadeComCasasDecimais(valor:Currency):Currency;//faz o truncamento ou arredondamento da quantidade
    function getValorTotalComCasasDecimais(valor:Currency):Currency;//faz o truncamento ou arredondamento do valor total

    property vTipoImpressora: string read FvTipoImpressora write FvTipoImpressora;
    property vtipoArredond: string read FvtipoArredond write FvtipoArredond;
    property vFVccancTef: integer read FVccancTef write FVccancTef;
    property vFvPorta: integer read FvPorta write FvPorta;
    property vFTpVnd: integer read FTpVnd write FTpVnd;
    property vFTecPDV: string read FTecPDV write FTecPDV;
    property vFqtdDig: integer read FqtdDig write FqtdDig;
    property vFqtdDigQtde: integer read FqtdDigQtde write FqtdDigQtde;    
    property vFvcpreco: string read Fvcpreco write Fvcpreco;
    property vFvcTotal: string read FvcTotal write FvcTotal;
    property vFcdescit: string read Fcdescit write Fcdescit;
    property vFValorLiq: string read FValorLiq write FValorLiq;
    property vFNumSerieEcf: string read FNumSerieEcf write FNumSerieEcf;
    property vFDataECF: string read FDataECF write FDataECF;
    property vFHoraEcf: string read FHoraEcf write FHoraEcf;
    property vFvvalpr: string read Fvvalpr write Fvvalpr;
    property vFvnc: integer read Fvnc write Fvnc;
    property vFvcooini: string read Fvcooini write Fvcooini;
    property vFvcoofin: string read Fvcoofin write Fvcoofin;
    property vFvContRed: string read FvContRed write FvContRed;
    property vFvcontRein: string read FvcontRein write FvcontRein;
    property vFvvendBr: string read FvvendBr write FvvendBr;
    property vFvGrandT: string read FvGrandT write FvGrandT;
    property vFvDataRes: string read FvDataRes write FvDataRes;
    property vFvmodimpbema: string read Fvmodimpbema write Fvmodimpbema;
    property vFvpfch: string read Fvpfch write Fvpfch;
    property vFvqtparc: string read Fvqtparc write Fvqtparc;
    property vFvleg: string read Fvleg write Fvleg;
    property vFvtitulo: string read Fvtitulo write Fvtitulo;
    property vFvlegsup: string read Fvlegsup write Fvlegsup;
    property vFvtitulosup: string read Fvtitulosup write Fvtitulosup;
    property vFvUnidade: string read FvUnidade write FvUnidade;
    property vFaitred: string read Faitred write Faitred;
    property vTemMFD: Boolean read FTemMFD write FTemMFD;
    property vPermitirVenda: Boolean read FPermitirVenda write FPermitirVenda;
    property vCodigoFFImpressora: String read FCodigoFFImpressora write FCodigoFFImpressora;
    property vErroTEF: String read FvErroTEF write FvErroTEF;
    property vTituloRel : string read FvTituloRel write FvTituloRel;
    property RetornoDll : RetornoDLL_ECF read vRetornoDll;
		property QtdeColunasImpressao: Integer read fQtdeColunasImpressao write fQtdeColunasImpressao;
		property SemArquivoAux: Boolean read fSemArquivoAux write fSemArquivoAux;
		property SemDireitoDeUso: Boolean read fSemDireitoDeUso write fSemDireitoDeUso;
    //  property iConta: integer read FiConta write FiConta;

  end;

implementation

uses
  SysUtils;

{ TImpressoraF }

function TImpressoraF.centralizaDescricao(vtam: integer;
  Descricao: string): string;
var
  temp: string;
  vlength, vlengthespaco, vlengthDireita, vlengthEsquerda: integer;
  I: Integer;
begin
  temp := trim(Descricao);
  vlength := Length(temp);
  vlengthespaco := vtam - vlength;
  vlengthEsquerda := trunc(vlengthespaco / 2);
  vlengthDireita := vtam - vlength - vlengthEsquerda;

  for I := 1 to vlengthEsquerda do
    Insert(' ', temp, 0);

  for I := 1 to vlengthDireita do
    temp := temp + ' ';
  result := copy(temp, 1, vtam);
end;

function TImpressoraF.copyArquivo(pathOrigem, pathDestino: string): boolean;
var
  arqOrigem, arqDestino: TFileStream;
begin
  Result := false;
  arqOrigem := TFileStream.Create(pathOrigem, fmOpenRead);
  try
    arqDestino := TFileStream.Create(pathDestino, fmOpenWrite or fmCreate);
    try
      arqDestino.CopyFrom(arqOrigem, arqOrigem.Size);
      Result := true;
    finally
      arqDestino.Free;
    end;
  finally
    arqOrigem.Free;
  end;
end;

function TImpressoraF.TamDesc(vtam: integer; DescriTam: string): string;
var
  vdesc: string;
  t: integer;
begin
  vdesc := DescriTam;
  for t := 1 to vtam - length(vdesc) do
  begin
    Insert(' ', vdesc, 29);
  end;
  result := copy(vdesc, 1, 29);
end;

function TImpressoraF.TamDescricao(vtam: integer; DescriTam: string): string;
var
  vdesc: string;
  t: integer;
begin
  vdesc := DescriTam;
  for t := 1 to vtam - length(vdesc) do
  begin
    Insert(' ', vdesc, vtam);
  end;
  result := copy(vdesc, 1, vtam);
end;

procedure TImpressoraF.GetDirList(Directory,extensao: string; var Result: TStrings);
var
  Sr: TSearchRec;
begin
  FindFirst(Directory + '\*.'+extensao, faDirectory, Sr);
  while FindNext(Sr) = 0 do
    if Sr.Name <> '..' then
    begin
      if pos(extensao,UpperCase(Sr.Name)) > 0 then
        Result.Add(Directory + '\' + Sr.Name);
    end;
end;

function TImpressoraF.getQuantidadeComCasasDecimais(valor: Currency): Currency;
var
  cValorTotal: string;
begin
  if vtipoArredond = 'T' then
  begin
    cValorTotal := Format('%15.4f',[valor]);
    if FqtdDigQtde = 2 then
      cValorTotal := Copy(cValorTotal,1,13)
    else
      cValorTotal := Copy(cValorTotal,1,14);
    Result := StrToFloat(Trim(cValorTotal));
  end
  else
  begin
    Result := StrToFloat(Format('%0.' + IntToStr(FqtdDigQtde) + 'f', [valor]));
  end;
end;

function TImpressoraF.getValorTotalComCasasDecimais(valor: Currency): Currency;
var
  cValorTotal: string;
begin
  if vtipoArredond = 'T' then
  begin
    cValorTotal := Format('%15.3f',[valor]);
    cValorTotal := Copy(cValorTotal,1,14);
    Result := StrToFloat(Trim(cValorTotal));
  end
  else
  begin
    Result := StrToFloat(Format('%0.2f', [valor]));
  end;
end;

function TImpressoraF.getValorUnitarioComCasasDecimais(
  valor: Currency): Currency;
var
  cValorTotal: string;
begin
  if vtipoArredond = 'T' then
  begin
    cValorTotal := Format('%15.4f',[valor]);
    if FqtdDig = 2 then
      cValorTotal := Copy(cValorTotal,1,13)
    else
      cValorTotal := Copy(cValorTotal,1,14);
    Result := StrToFloat(Trim(cValorTotal));
  end
  else
  begin
    Result := StrToFloat(Format('%0.' + IntToStr(FqtdDig) + 'f', [valor]));
  end;
end;

function TImpressoraF.insertMultString(pTam: Integer;
	const pPos: array of integer; const pStrs: array of string): string;
var
	vTempStr: string;
	I: Integer;
begin
	vTempStr := '';
	for I:= 1 to pTam do vTempStr := vTempStr + ' ';

	for I := 0 to Length(pPos) - 1 do
		Insert(pStrs[I], vTempStr, pPos[I]);

  Result := Copy(vTempStr, 1, pTam);

end;

function TImpressoraF.removeCaracteresCNPJ(cnpj: string): string;
var
  vTemp: string;
begin
  vTemp:=cnpj;
  vTemp := StringReplace(vTemp,'.','',[rfReplaceAll]);
  vTemp := StringReplace(vTemp,'-','',[rfReplaceAll]);
  vTemp := StringReplace(vTemp,'/','',[rfReplaceAll]);
  vTemp := StringReplace(vTemp,'\','',[rfReplaceAll]);
  vTemp := StringReplace(vTemp,' ','',[rfReplaceAll]);
  result := vTemp;
end;

procedure TImpressoraF.removerLinhasEmBranco(Afile: string);
var
  AtextFile: TStringList;
  I: Integer;
begin
  if not FileExists(Afile) then
    Exit;

  AtextFile := TStringList.Create;
  try
    AtextFile.LoadFromFile(Afile);
    for I := AtextFile.Count - 1 downto 0 do
      if Trim(AtextFile[I]) = '' then
        AtextFile.Delete(I);
    AtextFile.SaveToFile(Afile);
  finally
    FreeAndNil(AtextFile);
  end;
end;

function TImpressoraF.StringReplaceHw(valor, procurar, substituir:string;
retirarBrancos:boolean): string;
var
  I: Integer;
  temp: string;
begin
  temp := valor;
  for I := 1 to Length(procurar)  do
    temp:=StringReplace(temp,procurar[i],substituir[i],[rfReplaceAll,rfIgnoreCase]);
  if retirarBrancos then
    temp:=StringReplace(temp,' ','',[rfReplaceAll,rfIgnoreCase]);
  Result := temp;
end;

end.

