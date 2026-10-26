unit UClassesRelProdutos;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  ComCtrls, ExtCtrls, UDtmProdutos, Variants, IBQuery, DBGrids, QuickRpt,
  QRCtrls, RDprint, IBDatabase, SysUtils, StdCtrls, pQRBarCode, Classes,
  inv_tipo74_class, config_sistema_class;

type
  TMedia = class(TDataSet_OOP)
  private
    query: TIBQuery;
    linhaSelecionada: boolean;
    linha, vpag: integer;
    procedure novaPaginaPrint;
    function getQuantidadePendenteReqOS(grupo_prod: integer; cod_prod: string): Double;
    procedure abreUltimaCompra(grupo_prod: integer; cod_prod: string);
  public
    qtdeMeses: integer;
    quickRep: TQuickRep;
    print: TRDPrint;
    labelQuantidade, labelMedia, labelAtributos: TQRLabel;
    grid: TDBGrid;
    dtSet: TClientDataSet;
    somenteSelecionado, vImprimirMedia: boolean;
    constructor create;
    procedure bandaDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure imprimirRelatorio(rdp: TRdprint);
  end;

  TIndiceTec = class(TDataSet_OOP)
    constructor create;
  private
    _Linha, _Vpag: integer;
  public
    procedure _NovaPaginaPrint;
    procedure _QRBandAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure _QuickRep_IndiceEstBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure _RelCabecalhoAfterScroll(DataSet: TDataSet);
    function _PreencherNFProd: boolean;
    procedure bandaDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    rdIndice: TRDprint;
    grid: TDBGrid;
    dtSet, dsSetTempNFProd, dtSetProdVal: TClientDataSet;
    _pIndiceRel, _Vltotc, _Vltotr, _Vltovnd, _GrupoProd: integer;
    _SomenteSelecionado: boolean;
    _pRelNFProd, _pRelCab, _pRelDetalhes, _pRelRec, _pRelReqOS: TIBQuery;
    _ValorReqOs: Currency;
    _CodProd: string;
    _Label_SumReqOs: TQRLabel;
    _QRBand_SubRel: TQRBand;
  end;

  TPecasUltimaCompra = class(TDataSet_OOP)
  private
    query: TIBQuery;
    vltotc, vltotr, vltovnd: currency;
  public
    quickRep: TQuickRep;
    labelQtdEstoque, labelDataCompra, labelQtdCompra, labelAtributos, labelNomeEmp, labelVltotc, labelVltotr, labelVltovnd: TQRLabel;
    grid: TDBGrid;
    dtSet: TClientDataSet;
    somenteSelecionado: boolean;
    constructor create;
    procedure BandaCabecalhoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bandaDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bandaSomatorioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure quickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  end;

  TRelProdutos = class(TDataSet_OOP)
  private
    vTotCust, vTotCustR, vTotV, vEst: Currency;
  public
    quickRep: TQuickRep;
    labelTotal, labelCusto, labelCustoR, labelVenda, labelEstoque: TQRLabel;
    constructor create;
    procedure bandaDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bandaFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  end;

  TTabPreco = class
  private
    query: TIBQuery;
    query2: TIBQuery;
    print: TRDPrint;
    vLoc, vGrupo, vSubGrupo, vComEst, vSemEst, vDescGr, vValGr, vAng: boolean;
    vDescGrupos: string;
    linha, vpag: integer;
    vGrup: Integer;
    vSubg: Integer;
    procedure novaPaginaPrint(pPrecoVenda: boolean; pDiferenciado: boolean = false; pPromocao: boolean = false; pPrecoPorQtde: Boolean = False; pNaoExibirSomPrecDifPro: boolean = false);
  public
    constructor create;
    function montaSqlTabPreco(query: TIBQuery; comEst, semEst, grupo, subgrupo, loc, descGr, ValGr, ang: boolean;
      ordem, ordemGr, descGrupos, descSubGrupos, sqlProdutos: string;
      pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False; pPrecoPorQtde: Boolean = False;
      pWhere: string = ''; pTipo: string = ''; pCodTipo: string = ''; pCodPromocao: string = '';
      pWhereProd: string = ''; pWherePromTab: string = ''; pWherePrecoQtde: string = ''): boolean;
    procedure imprimirRelatorio(query: TIBQuery; rdp: TRdprint; pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False; pPrecoPorQtde: Boolean = False; pNaoExibirSomPrecDifPro: boolean = false);
    procedure imprimirRelatorioAng(query: TIBQuery; rdp: TRdprint; datasetGrupo: TClientDataSet; pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False; pPrecoPorQtde: Boolean = False; pNaoExibirSomPrecDifPro: boolean = false);
    procedure imprimirLinhas(query: TIBQuery; pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False; pPrecoPorQtde: Boolean = False; pNumFabr: string = ''; pNaoExibirSomPrecDifPro: boolean = false);
  end;

  TReqMercadoria = class
  private
    query: TIBQuery;
    print: TRDPrint;
    vLoc, vGrupo, vSubGrupo, vComEst, vSemEst, vDescGr, vValGr, vAng: boolean;
    vDescGrupos: string;
    linha, vpag, qtdeMeses: integer;
    vGrup: Integer;
    vSubg: Integer;
    procedure novaPaginaPrint;
  public
    constructor create;
    procedure imprimirRelatorio(rdp: TRdprint);
  end;

  TCatalogo = class(TDataSet_OOP)
  public
    quickRep: TQuickRep;
    grid: TDBGrid;
    somenteSelecionado: boolean;
    constructor create;
    procedure bandaDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  end;

  TFichaProd = class
  private
    query: TIBQuery;
    linha, vpag: integer;
    procedure novaPaginaPrint;
  public
    print: TRDPrint;
    grid: TDBGrid;
    dataReferencia: string;
    somenteSelecionados: boolean;
    destructor Destroy; override;
    constructor create;
    procedure imprimirRelatorio;
  end;

  TRelatoriosSimples = class(TDataSet_OOP)
  private
  public
    quickRep: TQuickRep;
    grid: TDBGrid;
    dtSet: TClientDataSet;
    vBarcode: TQRBarcode;
    somenteSelecionado, ImprimirQtdEstoque, ImprimirProdutosMarcados: boolean;
    constructor create;
    procedure bandaDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ImprimirEtiCodBarras;
    function gravaEtiProdTemp(NUM_FAB_PROD, DESCR_PROD, EMB_PROD, LOCACAO_PROD, LOCACAO_PROD_1, GRUPO_PROD, COD_PROD, APLICACAO_PROD, UNIDADE: string; PREC_TAB_PROD, PREC_30_PROD: double): boolean;
  var
    QtdTemp: double;
    QtdeEmt: string;
  end;

  TRelatoriosEtiTermica = class(TDataSet_OOP)
  private
    vCodEti, vNumColunas: integer;
    vConfEtiqueta: TStringList;
    vModelo, vLScript, valorMascarado: string;
    vQuery: TIBQuery;
    AbuscasAux: TIBQuery;
    conf: TConfig_sistema_class;
    fileToSend: string;

    function GetPrintName: string;
    procedure HandlePrint;
  public
    grid: TDBGrid;
    dtSetEti: TClientDataSet;
    somenteSelecionado, ImprimirQtdEstoque, ImprimirProdutosMarcados: Boolean;
    labelEstoque: TQRLabel;
    constructor create;
    destructor Destroy; override;

    procedure imprimir;
    procedure imprimirINTERMEC;
    procedure imprimirUmaColuna;
    procedure imprimirARGOX(pModelo: string); overload;
    procedure imprimirARGOX(pModelo: string; dtSet: TClientDataSet); overload;
    procedure _imprimirTermicaX(pCodModeloEti: integer);
    procedure _imprimirTermicaXRapido(pCodModeloEti: integer; pDtSet: TDataSet; pImprimirProdutosMarcados: Boolean);
    procedure _limparMemoriaTermicaX;
    function _existeItensEtiConfig: boolean;
    procedure _enviarTextoTermicaX(pBarcode: string; pCodGrade: integer); //pBarcode é CodBarras
    procedure _enviarTextoTermicaX2(pBarcode: string); //pBarcode é CodBarras
    function _retornaValorCalculado(pTextoCalc: string; dtSet: TDataSet = nil): string;
    procedure enviarTextoARGOX(pModelo, pNumFabricacao, pReferencia, pDescricao, pGrupoCodigoGrade: string; {pCodGrade: integer;} pValor, pValor4x: currency);
  type
    TA_CreatePrn = function(selection: integer; FileName: pchar): integer; stdcall;
    TA_Print_Out = function(width, height, copies, amount: integer): integer; stdcall;
    TA_Prn_Text = function(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall;
    TA_Prn_Barcode = function(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall;
    TA_Clear_Memory = procedure(); stdcall;
    TA_ClosePrn = procedure(); stdcall;
    //function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';
    //function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';
    //function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';
    //function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';
    //function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';
  var
    Arquivo: TextFile;
    j, b, itmax, contadorEti: Integer;
    QtdeEmt, CodForn, NomeForn: string;
    Qtd, QtdTemp: double;
    ClickedOK: Boolean;
    CodBarra, DescGrade, DescGrade1: array of string;
    Quant, vCodGrade: array of Integer;
    obRelSimples: TRelatoriosSimples;
    A_CreatePrn: TA_CreatePrn;
    A_Print_Out: TA_Print_Out;
    A_Prn_Text: TA_Prn_Text;
    A_Prn_Barcode: TA_Prn_Barcode;
    A_Clear_Memory: TA_Clear_Memory;
    A_ClosePrn: TA_ClosePrn;
  end;

  TInventario = class(TDataSet_OOP)
  private
    query: TIBQuery;
    rdp: TRDPrint;
    NumeroCasasDecimais: integer;
    vtransp, vtotgert, vtotger, vtoticms, vtotpis, vtotcofins, vtotst, vtotisento, vtotnincidencia: Currency;
    procedure novaPaginaPrint;
  public
    constructor create;
    destructor Destroy; override;
    procedure imprimirInventario(lb: TLabel; ProgressBar: TProgressBar; rdprint: TRdprint; vusTipo74: string);
    function getQtdItensCompra(codprod: string; grupoprod: integer; data: TDateTime): double;
    function getQtdItensVenda(codprod: string; grupoprod: integer; data: TDateTime): double;
    function getQtdItensDevolvidos(codprod: string; grupoprod: integer; data: TDateTime): double;
    function RetornaValorEst(DataReferencia: string; Divisao: boolean; AcresDesc: real): Currency;
    procedure grava_tipo74(vQuant: Double; valor: Double; tipoPosse, grupoprod: integer; codprod: string; valor_icms, valor_pis, valor_cofins : Double);
    function retornaQtdeEmEstoque(DataReferencia: string; GrupoProd: integer; CodProd: string): Double;
  var
    parar: boolean;
    vDataReferencia, vTipoCabecalho, IE, CPFCNPJ, CIDADEEMP, vEnviarPara: string;
    vGravaTipo74, vTotalPorGrupo, vOrdemCresDescricaoProd, vDivisao: boolean;
    linha, vPaginaIni: integer;
    vAcresDesc: Double;
  end;

  TRelFichaInventario = class(TDataSet_OOP)
    //  private
    //    query: TIBQuery;
  public
    grid: TDBGrid;
    rdp: TRDPrint;
    //    crystal: TCrpe;
    constructor create;
    destructor Destroy; override;
    procedure novaPaginaPrint;
  var
    linha, vPagina: integer;
    dataIni, dataFim: string;
  end;

  TRelControleProducaoEstoque = class(TObject)
  private
    fBuscas: TIBQuery;
    fQtdeEstoque: Extended;
    fQtdeEntrada: Extended;
    fQtdeSaida: Extended;
    fNumPagina: Integer;
    fUltPagina: Integer;
  public
    constructor create;
    destructor Destroy; override;
    function _iniciarRelatorio(pGrupo_prod: Integer; pCod_prod, pDataIni, pDataFim: string): Boolean;
    property Buscas: TIBQuery read fBuscas write fBuscas;
    property QtdeEstoque: Extended read fQtdeEstoque write fQtdeEstoque;
    property QtdeEntrada: Extended read fQtdeEntrada write fQtdeEntrada;
    property QtdeSaida: Extended read fQtdeSaida write fQtdeSaida;
    property NumPagina: Integer read fNumPagina write fNumPagina;
    property UltPagina: Integer read fUltPagina write fUltPagina;
  end;

var
  vRelProducaoEst: TRelControleProducaoEstoque;

implementation
uses
  UClassesProdutos, uClassesIndiceTecnico, Dialogs, uDadosIni, Graphics,
  hw_utils, StrUtils, Math, inv_tipo74_posse_class, Contnrs, hw_win_utils,
  opfiscal_model;

function cloud_agente_print_termic(text: WideString; params: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function cloud_agente_last_error: WideString; stdcall; external 'hw.utils.dx.dll';

{ TMedia }
{
function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';

procedure A_Clear_Memory(); stdcall; external 'WINPPLA.DLL';

procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';
}

procedure TMedia.bandaDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  temp: string;
begin
  if somenteSelecionado then
    PrintBand := grid.DataSource.DataSet.FieldByName('sel').AsString = 'S';
    //PrintBand := grid.SelectedRows.Current_RowSelected;
  if not PrintBand then
    exit;
//  temp := retornaValor('select sum(ipv.quant_ped_item) AS VALOR from pedvenda pv' +
//    ' inner join pedvenda_prod ipv on ipv.nped = pv.nped' +
//    ' and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo' +
//    ' where ipv.cod_prod = ' + QuotedStr(dtSet.FieldByName('COD_PROD').AsString) +
//    ' and ipv.grupo_prod = ' + dtSet.FieldByName('GRUPO_PROD').AsString +
//    ' and pv.tipo <> ''ORC'' and (pv.data_fech is null or pv.data_fech < ''01/01/1899'')' +
//    ' and ((pv.status_ped = '''') or (pv.status_ped is null)) ' +
//    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1');
//  if trim(temp) = '' then
//    temp := '0';

  labelQuantidade.Caption := format('%10.2f', [{dtSet.FieldByName('est_r').AsFloat +}dtSet.FieldByName('est_f').AsFloat - getQuantidadePendenteReqOS(DtSet.FieldByName('GRUPO_PROD').asinteger, trim(DtSet.FieldByName('COD_PROD').AsString))]);
//    StrToFloat(trim(temp))]);
  buscas.Close;
  buscas.SQL.Text := 'select sum(vqt) as valor from demandap4 where' +
    ' cod_prod = ' + QuotedStr(dtSet.FieldByName('COD_PROD').AsString) +
    ' and grupo_prod = ' + dtSet.FieldByName('GRUPO_PROD').AsString +
    ' and data_os_rq >= :vdat' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1';
  buscas.Params[0].AsDate := date - (qtdeMeses * 30);
  buscas.Open;
  if buscas.IsEmpty then
    temp := '0'
  else
    temp := buscas.FieldByName('valor').AsString;

  if trim(temp) = '' then
    temp := '0';
  labelMedia.Caption := format('%10.2f', [StrToFloat(temp) / qtdeMeses]);
  labelAtributos.Caption := dtSet.FieldByName('CLASSE_PROD').AsString +
    '-' + dtSet.FieldByName('CLINV').AsString +
    '-' + dtSet.FieldByName('CLPRECO').AsString +
    '-' + dtSet.FieldByName('CLPOP').AsString +
    '-' + dtSet.FieldByName('CLQTV').AsString +
    '-' + dtSet.FieldByName('CLFRV').AsString +
    '-' + dtSet.FieldByName('CLATL').AsString;

  //  temp := retornaValor('select sum(vqt) from demandap where' +
  //    ' cod_prod = :vcodprod and grupo_prod = :vgrupprod and data_os_rq >=:vdat' +
  //    ' and cod_empresa = :cod_empresa and ativo=1');

  //  application.messagebox(pchar(temp+' '+dtSet.FieldByName('descr_prod').AsString),'a',1);
  //  dtSet.FieldByName('quantidade').AsFloat ;
end;

constructor TMedia.create;
begin
  buscas := TIBQuery(DtmProdutos.qrBuscasP);
end;

procedure TMedia.imprimirRelatorio(rdp: TRdprint);
var
  vltotc, vltotr, vltovnd: currency;
begin
  print := TRDprint(rdp);
  print.OpcoesPreview.CaptionPreview := 'Tabela de Peças com Última Compra';
  print.CaptionSetup := 'Tabela de Peças com Última Compra';
  print.TitulodoRelatorio := 'Tabela de Peças com Última Compra';
  vDadosIni._LimparVarSendEmail;
  print.OnSendMail := vDadosini._SendMailRdPrint;
  if not vDadosIni.ModImp(print) then
    exit;
  linha := 1;
  vpag := 1;
  vltotc := 0;
  vltotr := 0;
  vltovnd := 0;
  print.OpcoesPreview.Remalina := true;
  print.TamanhoQteColunas := 160;
  print.FonteTamanhoPadrao := S20cpp;
  linhaSelecionada := true;
  try
    if not print.EstaAberto then
      print.Abrir;
    novaPaginaPrint;
    dtSet.first;
    while not dtSet.eof do
    begin
      if somenteSelecionado then
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        //if grid.SelectedRows.Current_RowSelected then
          linhaSelecionada := true
        else
          linhaSelecionada := false;
      end;
      if linhaSelecionada then
      begin
        if vDadosIni.vSupermercado <> 'S' then
        begin
          print.ImpF(linha, 68, vDadosini.alndir(format('%n', [({dtSet.FieldByName('Est_R').AsFloat + }dtSet.FieldByName('Est_F').AsFloat) - (getQuantidadePendenteReqOS(DtSet.FieldByName('GRUPO_PROD').asinteger, trim(DtSet.FieldByName('COD_PROD').AsString)))]), 6), [comp20]);
        end
        else
          print.ImpF(linha, 68, vDadosini.alndir(format('%n', [{dtSet.FieldByName('Est_R').AsFloat + }dtSet.FieldByName('Est_F').AsFloat]), 6), [comp20]);

        print.ImpF(linha, 1, dtSet.FieldByName('NUM_FAB_PROD').AsString, [comp20]);
        print.ImpF(linha, 18, dtSet.FieldByName('DESCR_PROD').AsString, [comp20]);
        print.ImpF(linha, 80, vDadosini.alndir(format('%n', [dtSet.FieldByName('PREC_CUS_PROD').AsFloat]), 10), [comp20]);
        print.ImpF(linha, 92, vDadosini.alndir(format('%n', [dtSet.FieldByName('PREC_CUSR_PROD').AsFloat]), 10), [comp20]);
        print.ImpF(linha, 104, vDadosini.alndir(format('%n', [dtSet.FieldByName('PREC_TAB_PROD').AsFloat]), 10), [comp20]);
        vltotc := vltotc +
          ((({dtSet.FieldByName('Est_R').asfloat + }dtSet.FieldByName('Est_F').AsFloat) -
          (getQuantidadePendenteReqOS(DtSet.FieldByName('GRUPO_PROD').asinteger, trim(DtSet.FieldByName('COD_PROD').AsString)))) * dtSet.FieldByName('PREC_CUS_PROD').asfloat);

        vltotr := vltotr +
          ((({dtSet.FieldByName('Est_R').AsFloat + }dtSet.FieldByName('Est_F').AsFloat) -
          (getQuantidadePendenteReqOS(DtSet.FieldByName('GRUPO_PROD').asinteger, trim(DtSet.FieldByName('COD_PROD').AsString)))) * dtSet.FieldByName('PREC_CUSR_PROD').asfloat);
        vltovnd := vltovnd + ((({dtSet.FieldByName('Est_R').asfloat + }dtSet.FieldByName('Est_F').asfloat) -
          (getQuantidadePendenteReqOS(DtSet.FieldByName('GRUPO_PROD').asinteger, trim(DtSet.FieldByName('COD_PROD').AsString)))) * dtSet.FieldByName('PREC_TAB_PROD').asfloat);

        abreUltimaCompra(DtSet.FieldByName('GRUPO_PROD').asinteger, trim(DtSet.FieldByName('COD_PROD').AsString));
        print.ImpF(linha, 116, buscas.FieldByName('DATA_LANC').AsString, [comp20]);
        print.ImpF(linha, 130, vDadosini.alndir(format('%n', [buscas.FieldByName('QUANTIDADE').AsFloat]), 6), [comp20]);
        buscas.Close; //Fechar a query aberta em getUltimaCompra

        print.ImpF(linha, 143, dtSet.FieldByName('CLASSE_PROD').asstring + '-' +
          dtSet.FieldByName('CLINV').asstring + '-' + dtSet.FieldByName('CLPRECO').asstring + '-' +
          dtSet.FieldByName('CLPOP').asstring + '-' + dtSet.FieldByName('CLQTV').asstring + '-' +
          dtSet.FieldByName('CLFRV').asstring + '-' + dtSet.FieldByName('CLATL').asstring, [comp20]);
        linha := linha + 1;
        if linha >= 60 then
        begin
          linha := 1;
          novaPaginaPrint;
        end;
      end;
      dtset.next;
      //        vit := vit + 1;
      //        label2.Caption := vDadosini.strzero(vit, 6);
      //        label2.refresh;
    end;
    print.Imp(linha, 1, vDadosini.replicate('=', 160));
    linha := linha + 1;
    print.ImpF(linha, 80, vDadosini.alndir(format('%n', [vltotc]), 10), [comp20]);
    print.ImpF(linha, 92, vDadosini.alndir(format('%n', [vltotr]), 10), [comp20]);
    print.ImpF(linha, 104, vDadosini.alndir(format('%n', [vltovnd]), 10), [comp20]);
  finally
    if print.EstaAberto then
      print.Fechar;
  end;
end;

procedure TMedia.novaPaginaPrint;
begin
  print.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  if not vImprimirMedia then
    print.ImpF(linha, 1, 'TABELA DE PECAS COM ULTIMA COMPRA', [normal, negrito]);
  linha := linha + 2;
  print.ImpF(linha, 1, 'DATA: ' + datetostr(date), [comp17]);
  print.ImpF(linha, 100, 'PAGINA: ' + vDadosIni.strzero(vpag, 4), [comp17]);
  linha := linha + 1;
  vpag := vpag + 1;
  if not vImprimirMedia then
  begin
    print.ImpF(linha, 1, vDadosIni.replicate('=', 160), [comp20]);
    linha := linha + 1;
    print.ImpF(linha, 1, 'CODIGO', [comp20]);
    print.ImpF(linha, 18, 'DENOMINACAO', [comp20]);
    print.ImpF(linha, 68, 'QTDE EST', [comp20]);
    print.ImpF(linha, 80, 'CST CONT', [comp20]);
    print.ImpF(linha, 92, 'CST REAL', [comp20]);
    print.ImpF(linha, 104, 'VALOR VND', [comp20]);
    print.ImpF(linha, 116, 'DT.ULT.COMP', [comp20]);
    print.ImpF(linha, 130, 'QTDE ULT.CMP', [comp20]);
    print.ImpF(linha, 143, 'ATRIBUTOS', [comp20]);
    linha := linha + 1;
    print.ImpF(linha, 1, vDadosIni.replicate('=', 160), [comp20]);
    linha := linha + 1;
  end;
end;

function TMedia.getQuantidadePendenteReqOS(grupo_prod: integer; cod_prod: string): Double;
begin
  Result := vDadosIni.getPendenciasEstoque(grupo_prod, cod_prod, -1, '', buscas);
  Exit;

  buscas.close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as valor from pedvenda pv' +
    ' inner join pedvenda_prod ipv on ipv.nped = pv.nped' +
    ' and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo' +
    ' where ipv.cod_prod = :vcod and ipv.grupo_prod = :vgrup and pv.tipo <> ''ORC''' +
    ' and (pv.data_fech is null or pv.data_fech < ''01/01/1899'') and pv.cod_empresa =' + vDadosIni.codEmpresa +
    ' and ((pv.status_ped = '''') or (pv.status_ped is null))' +
    ' and pv.ativo = 1';
  buscas.ParamByName('vgrup').AsInteger := grupo_prod;
  buscas.ParamByName('vcod').AsString := cod_prod;
  buscas.Prepare;
  buscas.Open;
  Result := buscas.FieldByName('valor').AsFloat;

  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as valor from producao pd, producao_item_indice pi' +
    ' where pi.grupo_prod = ' + IntToStr(grupo_prod) + ' and pi.cod_prod = ' + QuotedStr(cod_prod) +
    ' and pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa' +
    ' and (pd.data_fechamento is null) and pd.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := Result + buscas.FieldByName('valor').AsFloat;
  buscas.Close;
end;

procedure TMedia.abreUltimaCompra(grupo_prod: integer; cod_prod: string);
begin
  buscas.close;
  buscas.SQL.Text := 'select first 1 n.data_lanc,ni.quantidade from ' +
    ' notafiscal n inner join notafiscal_item ni ' +
    ' on n.cod_nf=ni.cod_nf and n.cod_empresa=ni.cod_empresa ' +
    ' where ' +
    ' n.natureza_nf=''E'' and ' +
    ' ni.grupo_prod = :vgrup and ' +
    ' ni.cod_prod = :vcod and ' +
    ' n.cod_empresa = ' + vDadosIni.codEmpresa + ' and n.ativo=1 ' +
    ' order by n.data_lanc desc';
  buscas.ParamByName('vgrup').AsInteger := grupo_prod;
  buscas.ParamByName('vcod').AsString := cod_prod;
  buscas.Prepare;
  buscas.Open;
  //  Result := buscas.FieldByName('valor').AsFloat;
end;

{ TRelProdutos }

procedure TRelProdutos.bandaDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  labelTotal.Caption := FormatFloat('#,##0.00', dataSet.FieldByName('EST_F').AsFloat +
//    dataSet.FieldByName('EST_R').AsFloat);
//  if Trim(labelTotal.Caption) = '0,00' then
//    labelTotal.Caption := '';
//  vTotCust := vTotCust + dataSet.FieldByName('PREC_CUS_PROD').AsFloat *
//    dataSet.FieldByName('EST_F').AsFloat;
//  vTotCustR := vTotCustR + dataSet.FieldByName('PREC_CUSR_PROD').AsFloat *
//    dataSet.FieldByName('EST_F').AsFloat;
//  vTotV := vTotV + dataSet.FieldByName('PREC_TAB_PROD').AsFloat *
//    dataSet.FieldByName('EST_F').AsFloat;
//  vEst := vEst + dataSet.FieldByName('EST_F').AsFloat;
end;

procedure TRelProdutos.bandaFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  labelCusto.Caption := FormatFloat('#,##0.00', vTotCust);
//  labelVenda.Caption := FormatFloat('#,##0.00', vtotv);
//  labelCustoR.Caption := FormatFloat('#,##0.00', vTotCustR);
//  labelEstoque.Caption := FormatFloat('#,##0.00', vEst);
end;

constructor TRelProdutos.create;
begin
  dataSet := TClientDataSet(DtmProdutos.CdsProdutos);
end;

{ TTabPreco }

constructor TTabPreco.create;
begin
  query := TIBQuery(dtmProdutos.qrTabPr);
  query2 := TIBQuery(dtmProdutos.qrTabPr2);
end;

procedure TTabPreco.imprimirLinhas(query: TIBQuery; pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False; pPrecoPorQtde: Boolean = False; pNumFabr: string = ''; pNaoExibirSomPrecDifPro: boolean = false);
var
  pLinha: Boolean;
begin
	try
    pLinha := false;
    if ((pNumFabr = '') or (pNumFabr <> query.FieldByName('NUM_FAB_PROD').AsString)) then
    begin
  //    if ((pNumFabr <> '') and ((pDiferenciado) or (pPromocao) or (pPrecoPorQtde))) then
  //      linha := linha + 2
  //    else
        linha := linha + 1;

      print.ImpF(linha, 1, vDadosIni.strzero(query.FieldByName('GRUPO_PROD').AsInteger, 3) + query.FieldByName('COD_PROD').AsString, [comp17, negrito]);
      if not vDescGr then
        print.ImpF(linha, 11, copy(trim(query.FieldByName('DESCR_PROD').AsString), 1, 40), [comp17, negrito])
      else
        print.ImpF(linha, 11, copy(trim(query.FieldByName('DESCR_PROD').AsString), 1, 28), [comp17, negrito]);
      print.ImpF(linha, 61, trim(query.FieldByName('UNIDADE').AsString), [comp17, negrito]);
      if vDadosIni.Vaplic = 'S' then
        print.ImpF(linha, 68, copy(trim(query.FieldByName('APLICACAO_PROD').AsString), 1, 13), [comp17, negrito])
      else
        print.ImpF(linha, 68, trim(query.FieldByName('NUM_FAB_PROD').AsString), [comp17, negrito]);
      if vValGr then
      begin
        if not pNaoExibirSomPrecDifPro then
        begin
          if pPrecoVenda then
          begin
            print.Impf(linha, 82, vDadosIni.alndir(format('%n',
              [query.FieldByName('PREC_TAB_PROD').AsFloat]), 10), [comp17, negrito]);
            print.Impf(linha, 95, vDadosIni.alndir(format('%n',
              [query.FieldByName('PREC_30_PROD').AsFloat]), 10), [comp17, negrito]);
            print.Impf(linha, 107, vDadosIni.alndir(format('%n',
              [query.FieldByName('PREC_60_PROD').AsFloat]), 10), [comp17, negrito]);
            print.Impf(linha, 118, vDadosIni.alndir(format('%n',
              [query.FieldByName('PREC_90_PROD').AsFloat]), 10), [comp17, negrito]);
          end;
        end;
      end
      else
      begin
        if not pNaoExibirSomPrecDifPro then
        begin
          if pPrecoVenda then
          begin
            print.ImpF(linha, 86, vDadosIni.alndir(format('%n', [query.FieldByName('PREC_TAB_PROD').AsFloat]), 10), [comp17, negrito]);
            print.ImpF(linha, 100, vDadosIni.alndir(format('%n', [query.FieldByName('PREC_30_PROD').AsFloat]), 10), [comp17, negrito]);
            print.ImpF(linha, 112, vDadosIni.alndir(format('%n', [query.FieldByName('PREC_60_PROD').AsFloat]), 10), [comp17, negrito]);
            print.ImpF(linha, 122, vDadosIni.alndir(format('%n', [query.FieldByName('PREC_90_PROD').AsFloat]), 10), [comp17, negrito]);
          end;
        end;
      end;
    end;

    if ((pDiferenciado) or (pPromocao) or (pPrecoPorQtde)) then
    begin
      if not query.FieldByName('COD_PROMOCAO').IsNull then
      begin
        linha := linha + 1;
        if not vDescGr then
        begin
          print.Imp(linha, 6, query.FieldByName('TIPO').AsString);
          print.Imp(linha, 20, query.FieldByName('DESCR_TIPO').AsString);
        end
        else
        begin
          print.ImpF(linha, 6, query.FieldByName('TIPO').AsString, [comp17, negrito]);
          print.ImpF(linha, 20, query.FieldByName('DESCR_TIPO').AsString, [comp17, negrito]);
        end;
        if vValGr then
        begin
          print.Impf(linha, 53, vDadosIni.alndir(format('%n', [query.FieldByName('VALOR_PROMOCAO').AsFloat]), 10), [comp17, negrito]);
          print.Impf(linha, 68, vDadosIni.alndir(format('%n', [query.FieldByName('PORCENTAGEM').AsFloat]), 10), [comp17, negrito]);
          print.Impf(linha, 79, vDadosIni.alndir(format('%n', [query.FieldByName('MAX_DESC').AsFloat]), 10), [comp17, negrito]);
        end
        else
        begin
          if not query.FieldByName('COD_PROMOCAO').IsNull then
          begin
            print.Imp(linha, 57, vDadosIni.alndir(format('%n', [query.FieldByName('VALOR_PROMOCAO').AsFloat]), 10));
              print.Imp(linha, 69, vDadosIni.alndir(format('%n', [query.FieldByName('PORCENTAGEM').AsFloat]), 10));
              print.Imp(linha, 81, vDadosIni.alndir(format('%n', [query.FieldByName('MAX_DESC').AsFloat]), 10));
          end;
        end;
      end;
      if vLoc then
      begin
  //      if query.FieldByName('COD_PROMOCAO').IsNull then
  //        linha := linha + 1;
        print.Imp(linha, 97, query.FieldByName('LOCACAO_PROD').AsString);
        print.Imp(linha, 109, query.FieldByName('LOCACAO_PROD_1').AsString);
      end;
    end;
    if ((vLoc) and ((not pDiferenciado) and (not pPromocao) and not(pPrecoPorQtde))) then
    begin
      linha := linha + 1;
      print.Imp(linha, 2, query.FieldByName('LOCACAO_PROD').AsString);
      print.Imp(linha, 14, query.FieldByName('LOCACAO_PROD_1').AsString);
    end;
  //   linha := linha + 1;
  except
  	on E: Exception do
    begin
      vDadosIni.registraErro('TTabPreco.imprimirLinhas Erro: ' + e.Message);
      if ShowConfirmacao('Erro ao imprimir linhas. Ver erro?') = IDYES then
        ShowErro('Gr: ' + IntToStr(query.FieldByName('GRUPO_PROD').AsInteger) +
        	' Cod: ' + query.FieldByName('COD_PROD').AsString + #13 + e.Message)
    end;
  end;
end;

procedure TTabPreco.imprimirRelatorio(query: TIBQuery; rdp: TRdprint; pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False; pPrecoPorQtde: Boolean = False; pNaoExibirSomPrecDifPro: boolean = false);
var
  pNumFabr: string;
begin
  pNumFabr := '';
  print := TRDprint(rdp);
  print.OpcoesPreview.CaptionPreview := 'Tabela de Preço de Produtos';
  print.CaptionSetup := 'Tabela de Preço de Produtos';
  print.TitulodoRelatorio := 'Tabela de Preço de Produtos';
  vDadosIni._LimparVarSendEmail;
  print.OnSendMail := vDadosini._SendMailRdPrint;
  if not vDadosIni.ModImp(print) then
    exit;
  linha := 1;
  vGrup := 0;
  vSubg := 0;
  if not print.EstaAberto then
    print.Abrir;
  novaPaginaPrint(pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, pNaoExibirSomPrecDifPro);

  if query.FieldByName('GRUPO_PROD').AsInteger = 0 then
  begin
    linha := linha + 1;
    print.Impf(linha, 1, vDadosIni.StrZero(query.FieldByName('GRUPO_PROD').AsInteger, 3) + ' - ' +
      query.FieldByName('descsub').AsString, [expandido, negrito]);
    linha := linha + 1;
  end;

  while not query.eof do
  begin
    if vGrupo then
    begin
      if (query.FieldByName('GRUPO_PROD').AsInteger <> vGrup) then
      begin
        vgrup := query.FieldByName('GRUPO_PROD').AsInteger;
        linha := linha + 1;
        //          DTM1.QRYgrupos.locate('CODIGO_GRUP', QrprodTabGRUPO_PROD.value, []);
        print.Impf(linha, 1, vDadosIni.StrZero(query.FieldByName('GRUPO_PROD').AsInteger, 3) + ' - '
          + query.FieldByName('DESCRICAO').AsString, [expandido, negrito]);
        linha := linha + 1;
      end;
    end;
    if vSubGrupo then
    begin
      if (query.FieldByName('SUB_G_PROD').AsInteger <> vSubg) then
      begin
        //          QRYsubGrupo.locate('CODIGO_SUBGR', QrProdTabSUB_G_PROD.value, []);
        vsubg := query.FieldByName('SUB_G_PROD').AsInteger;
        linha := linha + 1;
        print.Impf(linha, 5, vDadosIni.StrZero(query.FieldByName('SUB_G_PROD').AsInteger, 3) + ' - '
          + query.FieldByName('descsub').AsString, [expandido, negrito]);
        linha := linha + 1;
      end;
    end;
    //
    if ((vGrupo) or (vSubGrupo)) then
    begin
      if vComEst then
      begin
        if query.FieldByName('EST_F').AsFloat > 0 then
          imprimirLinhas(query, pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, pNumFabr, pNaoExibirSomPrecDifPro);
      end;
      if vSemEst then
      begin
        if (query.FieldByName('EST_F').AsFloat <= 0) or (query.FieldByName('EST_F').isnull) then
          imprimirLinhas(query, pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, pNumFabr, pNaoExibirSomPrecDifPro);
      end;
 //     imprimirLinhas(query, pPrecoVenda, pDiferenciado, pPromocao, pNumFabr);
    end;

    if linha > 60 then
    begin
      linha := 1;
      print.Novapagina;
      novaPaginaPrint(pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, pNaoExibirSomPrecDifPro);
    end;
    pNumFabr := query.FieldByName('NUM_FAB_PROD').AsString;
    query.next;
  end;
  print.Fechar;
end;

procedure TTabPreco.imprimirRelatorioAng(query: TIBQuery; rdp: TRdprint; datasetGrupo: TClientDataSet; pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False; pPrecoPorQtde: Boolean = False; pNaoExibirSomPrecDifPro: boolean = false);
var
  vtemp, vNumFabr: string;
  vnum: string;
  itx: Integer;
begin
  vNumFabr := '';
  print := TRDprint(rdp);
  print.OpcoesPreview.CaptionPreview := 'Tabela de Preço de Produtos';
  print.CaptionSetup := 'Tabela de Preço de Produtos';
  print.TitulodoRelatorio := 'Tabela de Preço de Produtos';
  vDadosIni._LimparVarSendEmail;
  print.OnSendMail := vDadosini._SendMailRdPrint;
  if not vDadosIni.ModImp(print) then
    exit;
  linha := 1;
  vGrup := 0;
  vSubg := 0;
  if not print.EstaAberto then
    print.Abrir;
  novaPaginaPrint(pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, pNaoExibirSomPrecDifPro);

  vtemp := vDescGrupos;
  vnum := '';
  for itx := 2 to length(vtemp) do
  begin
    if (vtemp[itx] <> ',') and (vtemp[itx] <> ')') then
      vnum := vnum + vtemp[itx]
    else
    begin
      query.close;
      query.ParamByName('grupo').AsInteger := strtoint(vnum);
      query.open;
      if query.FieldByName('GRUPO_PROD').AsInteger = 0 then
      begin
        datasetGrupo.IndexFieldNames := 'CODIGO_GRUP';
        datasetGrupo.FindNearest([strtoint(vnum)]);
        if datasetGrupo.FieldByName('CODIGO_GRUP').Asinteger <> 0 then
        begin
          linha := linha + 1;
          print.Impf(linha, 1, vDadosIni.StrZero(datasetGrupo.FieldByName('CODIGO_GRUP').AsInteger, 3) + ' - '
            + datasetGrupo.FieldByName('DESCRICAO').AsString, [expandido, negrito]);
          linha := linha + 1;
        end;
      end;
      vnum := '';
      while not query.eof do
      begin
        if vGrupo then
        begin
          if (query.FieldByName('GRUPO_PROD').AsInteger <> vGrup) then
          begin
            vgrup := query.FieldByName('GRUPO_PROD').AsInteger;
            linha := linha + 1;
            //          DTM1.QRYgrupos.locate('CODIGO_GRUP', QrprodTabGRUPO_PROD.value, []);
            print.Impf(linha, 1, vDadosIni.StrZero(query.FieldByName('GRUPO_PROD').AsInteger, 3) +
              ' - ' + query.FieldByName('DESCRICAO').AsString, [expandido, negrito]);
            linha := linha + 1;
          end;
        end;
        if vSubGrupo then
        begin
          if (query.FieldByName('SUB_G_PROD').AsInteger <> vSubg) then
          begin
            //          QRYsubGrupo.locate('CODIGO_SUBGR', QrProdTabSUB_G_PROD.value, []);
            vsubg := query.FieldByName('SUB_G_PROD').AsInteger;
            linha := linha + 1;
            print.Impf(linha, 5, vDadosIni.StrZero(query.FieldByName('SUB_G_PROD').AsInteger, 3) +
              ' - ' + query.FieldByName('descsub').AsString, [expandido, negrito]);
            linha := linha + 1;
          end;
        end;
        //
        if vGrupo and vSubGrupo then
        begin
          imprimirLinhas(query, pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, vNumFabr, pNaoExibirSomPrecDifPro);
        end
        else if vComEst then
        begin
          if query.FieldByName('EST_F').AsFloat > 0 then
            imprimirLinhas(query, pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, vNumFabr, pNaoExibirSomPrecDifPro);
        end
        else if vSemEst then
        begin
          if (query.FieldByName('EST_F').AsFloat <= 0) or (query.FieldByName('EST_F').isnull) then
            imprimirLinhas(query, pPrecoVenda, pDiferenciado, pPromocao, pPrecoPorQtde, vNumFabr, pNaoExibirSomPrecDifPro);
        end;
        if linha > 60 then
        begin
          linha := 1;
          print.Novapagina;
          novaPaginaPrint(pPrecoVenda, pDiferenciado, pPromocao, pNaoExibirSomPrecDifPro);
        end;
        vNumFabr := query.FieldByName('NUM_FAB_PROD').AsString;
        query.next;
      end;
    end;
  end;
  print.Fechar;
end;

function TTabPreco.montaSqlTabPreco(query: TIBQuery; comEst, semEst, grupo, subgrupo, loc,
  descGr, ValGr, ang: boolean; ordem, ordemGr, descGrupos, descSubGrupos, sqlProdutos: string;
  pPrecoVenda: Boolean = False; pDiferenciado: Boolean = False; pPromocao: Boolean = False;
  pPrecoPorQtde: Boolean = False; pWhere: string = ''; pTipo: string = '';
  pCodTipo: string = ''; pCodPromocao: string = '';
  pWhereProd: string = ''; pWherePromTab: string = ''; pWherePrecoQtde: string = ''): boolean;
var
  vStringSql, vStringSqlPromTab, vStringSqlPrecoQtde, vtemp, sqlInicial, sqlPrecoPromTab, sqlPrecoPorQtde, pOrdem: string;
  buscas2: TIBQuery;
begin
  try
    buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := query.Database;
  	buscas2.Transaction := query.Transaction;

    vStringSql := '';
    vStringSqlPromTab := '';
    vStringSqlPrecoQtde := '';
    vLoc := loc;
    vGrupo := grupo;
    vSubGrupo := subgrupo;
    vComEst := comEst;
    vSemEst := semEst;
    vDescGr := descGr;
    vValGr := ValGr;
    vAng := ang;
    vDescGrupos := descGrupos;
    vtemp := '';
    if pos('WHERE', UpperCase(sqlProdutos)) > 0 then
    begin
      vtemp := copy(sqlProdutos, pos('WHERE', UpperCase(sqlProdutos)) + 5, (length(sqlProdutos) - pos('WHERE', UpperCase(sqlProdutos)) + 5));
      if pos('ORDER BY ', vtemp) > 0 then
      begin
        pOrdem := Copy(vtemp, pos('ORDER BY', vtemp), length(vtemp));
        vtemp := Copy(vtemp, 1, pos('ORDER BY', vtemp) - 2);
      end
      else if pos('order by ', vtemp) > 0 then
      begin
        pOrdem := Copy(vtemp, pos('order by', vtemp), length(vtemp));
        vtemp := Copy(vtemp, 1, pos('order by', vtemp) - 2);
      end;
    end;

    if ((not pDiferenciado) and (not pPromocao) and (not pPrecoPorQtde)) then
      sqlInicial := 'select distinct grupos.descricao, sub_grupo.descricao descSub, produtos.num_fab_prod,' +
        ' produtos.cod_prod, produtos.descr_prod, produtos.prec_cus_prod, produtos.prec_tab_prod,' +
        ' produtos.aplicacao_prod, produtos.data_ult_compra, produtos.marca_p, produtos.n_max_prod,' +
        ' produtos.n_min_prod, produtos.classe_prod, produtos.clinv, produtos.clpreco, produtos.clpop,' +
        ' produtos.clqtv, produtos.clfrv, produtos.clatl, produtos.grupo_prod, produtos.sub_g_prod,' +
        ' produtos.est_f, produtos.unidade, produtos.prec_30_prod, produtos.prec_60_prod,' +
        ' produtos.prec_90_prod, produtos.locacao_prod, produtos.locacao_prod_1' +
        ' from produtos inner join grupos on produtos.grupo_prod = grupos.codigo_grup' +
        ' left join sub_grupo on sub_grupo.codigo_subgr = produtos.sub_g_prod ' +
        ' left join cod_barra on cod_barra.grupo_prod = produtos.grupo_prod and cod_barra.cod_prod = produtos.cod_prod and cod_barra.cod_empresa = produtos.cod_empresa '
    else
    begin
      sqlInicial := pWhereProd;
      sqlPrecoPromTab := pWherePromTab;
      sqlPrecoPorQtde := pWherePrecoQtde;
    end;

    if pos('WHERE', UpperCase(sqlInicial)) > 0 then
    	vStringSql := UpperCase(sqlInicial + ' AND ' + vtemp)
    else
      vStringSql := UpperCase(sqlInicial + ' WHERE ' + vtemp);

	 if pos('WHERE', UpperCase(sqlPrecoPromTab)) > 0 then
    	vStringSqlPromTab := UpperCase(sqlPrecoPromTab + ' AND ' + vtemp)
    else
      vStringSqlPromTab := UpperCase(sqlPrecoPromTab + ' WHERE ' + vtemp);

    if pos('WHERE', UpperCase(sqlPrecoPorQtde)) > 0 then
    	vStringSqlPrecoQtde := UpperCase(sqlPrecoPorQtde + ' AND ' + vtemp)
    else
      vStringSqlPrecoQtde := UpperCase(sqlPrecoPorQtde + ' WHERE ' + vtemp);

    pCodTipo := StringReplace(pCodTipo, ' ', '', [rfReplaceAll, rfIgnoreCase]);
    if (pos(copy(pCodTipo, 1, 1), '(') <> 0) and
      (pos(copy(pCodTipo, length(pCodTipo), 1), ')') <> 0) and (length(pCodTipo) >= 3) then
    begin
      if pPrecoVenda then // COM PRECO DE TABELA
      begin
        if ((pDiferenciado) and (not pPromocao)) then
        begin
          if pTipo = 'Localidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((L.COD_LOCALIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL))'
          else if pTipo = 'Setor' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((ST.COD_SETOR in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL))'
          else if pTipo = 'Cidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((CD.COD_CIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL))'
          else if pTipo = 'Avulso' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((P.COD_PROMOCAO in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL))';  ;
        end
        else if ((pDiferenciado) and (pPromocao) and (pCodPromocao <> '')) then
        begin
          if pTipo = 'Localidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((L.COD_LOCALIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL)'
          else if pTipo = 'Setor' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((ST.COD_SETOR in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL)'
          else if pTipo = 'Cidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((CD.COD_CIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL)'
          else if pTipo = 'Avulso' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((P.COD_PROMOCAO in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO IS NULL)';
        end
        else if ((pDiferenciado) and (pPromocao) and (pCodPromocao = '')) then
        begin
          if pTipo = 'Localidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((L.COD_LOCALIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0 AND TP.TIPO = ''P'') or (P.COD_PROMOCAO IS NULL))'
          else if pTipo = 'Setor' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((ST.COD_SETOR in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0 AND TP.TIPO = ''P'') or (P.COD_PROMOCAO IS NULL))'
          else if pTipo = 'Cidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((CD.COD_CIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0 AND TP.TIPO = ''P'') or (P.COD_PROMOCAO IS NULL))'
          else if pTipo = 'Avulso' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((P.COD_PROMOCAO in ' + pCodTipo + ' AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0 AND TP.TIPO = ''P'') or (P.COD_PROMOCAO IS NULL))'  ;
        end;
      end
      else // SEM PRECO DE TABELA
      begin
        if ((pDiferenciado) and (not pPromocao)) then
        begin
          if pTipo = 'Localidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND L.COD_LOCALIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'''
          else if pTipo = 'Setor' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ST.COD_SETOR in ' + pCodTipo + ' AND TP.TIPO = ''T'''
          else if pTipo = 'Cidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND CD.COD_CIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'''
          else if pTipo = 'Avulso' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND P.COD_PROMOCAO in ' + pCodTipo + ' AND TP.TIPO = ''T''';
        end
        else if ((pDiferenciado) and (pPromocao) and (pCodPromocao <> '')) then
        begin
          if pTipo = 'Localidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((L.COD_LOCALIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'')'
          else if pTipo = 'Setor' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((ST.COD_SETOR in ' + pCodTipo + ' AND TP.TIPO = ''T'')'
          else if pTipo = 'Cidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((CD.COD_CIDADE in ' + pCodTipo + ' AND TP.TIPO = ''T'')'
          else if pTipo = 'Avulso' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((P.COD_PROMOCAO in ' + pCodTipo + ' AND TP.TIPO = ''T'')';
        end
        else if ((pDiferenciado) and (pPromocao) and (pCodPromocao = '')) then
        begin
          if pTipo = 'Localidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((L.COD_LOCALIDADE in ' + pCodTipo + '  AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0  AND TP.TIPO = ''P''))'
          else if pTipo = 'Setor' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((ST.COD_SETOR in ' + pCodTipo + '  AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0  AND TP.TIPO = ''P''))'
          else if pTipo = 'Cidade' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((CD.COD_CIDADE in ' + pCodTipo + '  AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0  AND TP.TIPO = ''P''))'
          else if pTipo = 'Avulso' then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((P.COD_PROMOCAO in ' + pCodTipo + '  AND TP.TIPO = ''T'') or (P.COD_PROMOCAO > 0  AND TP.TIPO = ''P''))'  ;
        end;
      end;
    end
    else if pCodTipo <> '' then
    begin
      Application.MessageBox(PChar('Erro ao informar o ' + pTipo + '' + chr(13) + 'Favor corrigir e tentar novamente'),
        'Atenção', MB_OK + MB_ICONINFORMATION);
      result := false;
      exit;
    end;

    if pPromocao then
    begin
      pCodPromocao := StringReplace(pCodPromocao, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      if (pos(copy(pCodPromocao, 1, 1), '(') <> 0) and
        (pos(copy(pCodPromocao, length(pCodPromocao), 1), ')') <> 0) and (length(pCodPromocao) >= 3) then
      begin
        if pPrecoVenda then // COM PRECO DE TABELA
        begin
          if ((pPromocao) and (not pDiferenciado)) then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((P.COD_PROMOCAO in ' + pCodPromocao + '  AND TP.TIPO = ''P'') or (P.COD_PROMOCAO IS NULL))'
          else if ((pPromocao) and (pDiferenciado) and (pCodTipo <> '')) then
            vStringSqlPromTab := vStringSqlPromTab + ' OR (P.COD_PROMOCAO in ' + pCodPromocao + '  AND TP.TIPO = ''P'') or (P.COD_PROMOCAO IS NULL))'
          else if ((pPromocao) and (pDiferenciado) and (pCodTipo = '')) then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((TP.TIPO = ''T'') or (P.COD_PROMOCAO in ' + pCodPromocao + '  AND TP.TIPO = ''P'')  or (P.COD_PROMOCAO IS NULL))';
        end
        else // SEM PRECO DE TABELA
        begin
          if ((pPromocao) and (not pDiferenciado)) then
            vStringSqlPromTab := vStringSqlPromTab + ' AND P.COD_PROMOCAO in ' + pCodPromocao + '  AND TP.TIPO = ''P'''
          else if ((pPromocao) and (pDiferenciado) and (pCodTipo <> '')) then
            vStringSqlPromTab := vStringSqlPromTab + ' OR (P.COD_PROMOCAO in ' + pCodPromocao + '  AND TP.TIPO = ''P''))'
          else if ((pPromocao) and (pDiferenciado) and (pCodTipo = '')) then
            vStringSqlPromTab := vStringSqlPromTab + ' AND ((TP.TIPO = ''T'') or (P.COD_PROMOCAO in ' + pCodPromocao + '  AND TP.TIPO = ''P''))';
        end;
      end
      else if pCodPromocao <> '' then
      begin
        Application.MessageBox('Erro ao informar o Promocao.' + chr(13) + 'Favor corrigir e tentar novamente',
          'Atenção', MB_OK + MB_ICONINFORMATION);
        result := false;
        exit;
      end;
    end;

//    if ((not pPrecoVenda) and (pDiferenciado) and (pPromocao) and (pCodTipo = '') and (pCodPromocao = '')) then
//      vStringSql := vStringSql + ' and p.cod_promocao is not null ';
//
//    if pos('ORDER', vStringSql) <> 0 then
//    begin
//      vStringSql := copy(vStringSql, 1, pos('ORDER', vStringSql) - 1);
//      vStringSqlPrecoQtde := copy(vStringSqlPrecoQtde, 1, pos('ORDER', vStringSqlPrecoQtde) - 1);
//    end;
    if grupo and ang then
    begin
      vStringSql := vStringSql + ' AND produtos.grupo_prod = :grupo ';
      vStringSqlPromTab := vStringSqlPromTab + ' AND produtos.grupo_prod = :grupo ';
      vStringSqlPrecoQtde := vStringSqlPrecoQtde + ' AND produtos.grupo_prod = :grupo ';
    end
    else if grupo then
    begin
      descGrupos := StringReplace(descGrupos, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      if (pos(copy(descGrupos, 1, 1), '(') <> 0) and
        (pos(copy(descGrupos, length(descGrupos), 1), ')') <> 0) and (length(descGrupos) >= 3) then
      begin
        vStringSql := vStringSql + ' AND produtos.grupo_prod in ' + descGrupos + ' ';
        vStringSqlPromTab := vStringSqlPromTab + ' AND produtos.grupo_prod in ' + descGrupos + ' ';
        vStringSqlPrecoQtde := vStringSqlPrecoQtde + ' AND produtos.grupo_prod in ' + descGrupos + ' ';
      end
      else if descGrupos <> '' then
      begin
        Application.MessageBox('Erro ao informar o grupo.' + chr(13) + 'Favor corrigir e tentar novamente',
          'Atenção', MB_OK + MB_ICONINFORMATION);
        result := false;
        exit;
      end;
    end;
    if subgrupo then
    begin
      descSubGrupos := StringReplace(descSubGrupos, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      if (pos(copy(descSubGrupos, 1, 1), '(') <> 0) and
        (pos(copy(descSubGrupos, length(descSubGrupos), 1), ')') <> 0) and (length(descSubGrupos) >= 3) then
      begin
        vStringSql := vStringSql + ' AND produtos.sub_g_prod in ' + descSubGrupos + ' ';
        vStringSqlPromTab := vStringSqlPromTab + ' AND produtos.sub_g_prod in ' + descSubGrupos + ' ';
        vStringSqlPrecoQtde := vStringSqlPrecoQtde + ' AND produtos.sub_g_prod in ' + descSubGrupos + ' ';
      end
      else if descSubGrupos <> '' then
      begin
        Application.MessageBox('Erro ao informar o Subgrupo.' + chr(13) + 'Favor corrigir e tentar novamente',
          'Atenção', MB_OK + MB_ICONINFORMATION);
        result := false;
        exit;
      end;
    end;

//    if not pPrecoVenda then
//    	vStringSql := '';
    if ((pPromocao) or (pDiferenciado)) then
    	vStringSql := vDadosIni.IfThen(pPrecoVenda, vStringSql, '') + vDadosIni.IfThen(pPrecoVenda, ' UNION ', '') + vStringSqlPromTab;
    if (pPrecoPorQtde) then
    	vStringSql := vDadosIni.IfThen((pPrecoVenda) or (pPromocao) or (pDiferenciado), vStringSql, '') + vDadosIni.IfThen((pPrecoVenda) or (pPromocao) or (pDiferenciado), ' UNION ', '') + vStringSqlPrecoQtde;

    if ((pPromocao) or (pDiferenciado) or (pPrecoPorQtde)) then
    begin
//       buscas2.Close;
//       buscas2.SQL.Text := ' select a.rdb$field_position ordem, a.rdb$field_name campo from rdb$relation_fields a ' +
//         ' inner join rdb$fields b on a.rdb$field_source = b.rdb$field_name ' +
//         ' where a.rdb$relation_name = ''PRODUTOS'' and a.rdb$field_name = :index ';
//       buscas2.ParamByName('INDEX').AsString := 'NUM_FAB_PROD';
//       buscas2.Open;
//
//       vStringSql := vStringSql + ' ORDER BY ' + IntToStr(buscas2.FieldByName('ORDEM').AsInteger + 2) + ' , 1';

      if grupo then
      begin
        if ordemGr = 'Alfabetica' then
          vStringSql := vStringSql + ' ORDER BY 2'
        else
          vStringSql := vStringSql + ' ORDER BY 3';
      end;

      if (subgrupo) and (grupo) then
        vStringSql := vStringSql + ', 4'
      else if subgrupo then
        vStringSql := vStringSql + ' ORDER BY 4';

      if (not subgrupo) and (not grupo) then
      begin
        if ordem = 'Numerica' then
          vStringSql := vStringSql + ' ORDER BY 5'
        else
          vStringSql := vStringSql + ' ORDER BY 6';
      end
      else
      begin
        if ordem = 'Numerica' then
          vStringSql := vStringSql + ', 5'
        else
          vStringSql := vStringSql + ', 6';
      end;
    end
    else
    begin
      if grupo then
      begin
        if ordemGr = 'Alfabetica' then
          vStringSql := vStringSql + ' ORDER BY grupos.descricao'
        else
          vStringSql := vStringSql + ' ORDER BY produtos.grupo_prod';
      end;

      if (subgrupo) and (grupo) then
        vStringSql := vStringSql + ',produtos.sub_g_prod'
      else if subgrupo then
        vStringSql := vStringSql + ' ORDER BY produtos.sub_g_prod';

      if (not subgrupo) and (not grupo) then
      begin
        if ordem = 'Numerica' then
          vStringSql := vStringSql + ' ORDER BY produtos.num_fab_prod'
        else
          vStringSql := vStringSql + ' ORDER BY produtos.descr_prod';
      end
      else
      begin
        if ordem = 'Numerica' then
          vStringSql := vStringSql + ',produtos.num_fab_prod'
        else
          vStringSql := vStringSql + ',produtos.descr_prod';
      end;
    end;

    if vStringSql <> '' then
    begin
      query.CLOSE;
      query.sql.text := UpperCase(vStringSql);
      if not ang then
      begin
        query.open;
        query.FetchAll;
        Result := not query.IsEmpty;
        if not Result then
          Application.MessageBox('Nenhum produto encontrado',
            'Atenção', MB_OK + MB_ICONINFORMATION);
      end
      else
        result := true;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      if Application.MessageBox('Ocorreu um Erro na Seleção dos Registros, Mostrar Erro?',
        'Atenção', MB_ICONWARNING + MB_YESNO) = IDYES then
        Application.MessageBox(pchar(E.Message), 'Erro', MB_OK);
    end;
  end;
end;

procedure TTabPreco.novaPaginaPrint(pPrecoVenda: boolean; pDiferenciado: boolean = false; pPromocao: boolean = false; pPrecoPorQtde: Boolean = False; pNaoExibirSomPrecDifPro: boolean = false);
begin
  print.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  print.ImpF(linha, 1, 'TABELA DE PRECO DE PRODUTOS', [normal, negrito]);
  vpag := vpag + 1;
  linha := linha + 1;
  print.ImpF(linha, 1, 'DATA: ' + datetostr(date), [comp17, negrito]);
  print.ImpF(linha, 100, 'PAGINA: ' + vDadosIni.strzero(vpag, 4), [comp17, negrito]);
  linha := linha + 1;
  print.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17, negrito]);
  linha := linha + 1;
  print.ImpF(linha, 1, 'CODIGO', [comp17, negrito]);
  print.ImpF(linha, 11, 'DENOMINACAO', [comp17, negrito]);
  if not pNaoExibirSomPrecDifPro then
  begin
    print.ImpF(linha, 61, 'UN', [comp17, negrito]);
    if vDadosIni.Vaplic = 'S' then
    	print.ImpF(linha, 68, 'APLICACAO', [comp17, negrito])
    else
    	print.ImpF(linha, 68, 'Nº FAB', [comp17, negrito]);
 	  if pPrecoVenda then
    begin
      print.ImpF(linha, 86, 'PRECO TAB', [comp17, negrito]);
      print.ImpF(linha, 102, '30 DIAS', [comp17, negrito]);
      print.ImpF(linha, 115, '30/60 ', [comp17, negrito]);
      print.ImpF(linha, 122, '30/60/90', [comp17, negrito]);
    end;
  end;

  if ((pDiferenciado) or (pPromocao) or (pPrecoPorQtde)) then
  begin
    linha := linha + 1;
    if not vDescGr then
    begin
      print.ImpF(linha, 6, 'TIPO', [comp17]);
      print.ImpF(linha, 20, 'DESCR TIPO', [comp17]);
    end
    else
    begin
      print.ImpF(linha, 6, 'TIPO', [comp17, negrito]);
      print.ImpF(linha, 20, 'DESCR TIPO', [comp17, negrito]);
    end;
    if not vValGr then
    begin
      print.ImpF(linha, 55, 'PRECO DIF (LIQ)', [comp17]);
      print.ImpF(linha, 74, 'DESC(%)', [comp17]);
      print.ImpF(linha, 85, 'MAX (%)', [comp17]);
    end
    else
    begin
      print.ImpF(linha, 55, 'PRECO DIF (LIQ)', [comp17, negrito]);
      print.ImpF(linha, 74, 'DESC(%)', [comp17, negrito]);
      print.ImpF(linha, 85, 'MAX (%)', [comp17, negrito]);
    end;
  end;

  if vLoc then
  begin
    if ((not pDiferenciado) and (not pPromocao) and (not pPrecoPorQtde)) then
    begin
      linha := linha + 1;
      print.ImpF(linha, 2, 'ALOCACAO', [comp17]);
      print.ImpF(linha, 14, 'ALOCACAO 1', [comp17]);
    end
    else
    begin
      print.ImpF(linha, 97, 'ALOCACAO', [comp17]);
      print.ImpF(linha, 109, 'ALOCACAO 1', [comp17]);
    end;
  end;

  linha := linha + 1;
  print.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17]);
  // linha:=linha+1;
end;

{ TCatalogo }

procedure TCatalogo.bandaDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if somenteSelecionado then
    PrintBand := grid.DataSource.DataSet.FieldByName('sel').AsString = 'S';
    //PrintBand := grid.SelectedRows.Current_RowSelected;
end;

constructor TCatalogo.create;

begin

end;

{ TFichaProd }

constructor TFichaProd.create;
begin
  query := TIBQuery(dtmProdutos.qrBuscasP);
end;

destructor TFichaProd.Destroy;
begin
  query.Close;
  inherited;
end;

procedure TFichaProd.imprimirRelatorio;
var
  dataSet: TClientDataSet;
  vtotge: Double;
  vtotgs: Double;
  vtotgc: Double;
  vtotgd: Double;
  temEstoqueIni: Boolean;
  dataConfirmacao: TDate;
  qtdeTrans: Double;
  qtdeReq: Double;
  qtdeEst: Double;
  vtots: Double;
  vtote: Double;
  vtotpb: Double;
  vtotd: Double;
  vtotc: Double;
  vtotp: Double;
  vApresentarEstR: string;
  vComprasP1: Double;
  vComprasP2: Double;
  vVendasP1: Double;
  vVendasP2: Double;
  vest: Double;
  vDevolucaoP: Double;
  qtdeProducao: Double;
begin
	try
    dataSet := TClientDataSet(grid.DataSource.DataSet);
    dataset.DisableControls;
    dataSet.first;
    print.OpcoesPreview.CaptionPreview := 'Ficha do produto';
    print.CaptionSetup := 'Ficha do produto';
    print.TitulodoRelatorio := 'Ficha do produto';
    vDadosIni._LimparVarSendEmail;
    print.OnSendMail := vDadosini._SendMailRdPrint;
    if not vDadosIni.ModImp(print) then
      exit;
    vpag := 0;
    linha := 1;
    if not print.EstaAberto then
      print.abrir;
    novaPaginaPrint;
    vtotge := 0;
    vtotgs := 0;
    vtotgc := 0;
    vtotgd := 0;
    while not dataSet.eof do
    begin
      if ((somenteSelecionados) and (grid.DataSource.DataSet.FieldByName('sel').AsString = 'S')) or (not somenteSelecionados) then
      //if ((somenteSelecionados) and (grid.SelectedRows.Current_RowSelected)) or (not somenteSelecionados) then
      begin
        query.Close;
        query.SQL.Text := 'select DATA_CONFIRM,QUANT_EST,QUANT_REQ,QUANT_TRANS,QUANT_PRODUCAO FROM ESTOQUE_INI' +
          ' WHERE TIP_BAL = ''G'' and grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
          ' and cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1 order by data_confirm desc';
        query.open;
        temEstoqueIni := not query.IsEmpty;
        if temEstoqueIni then
        begin
          dataConfirmacao := query.FieldByName('data_confirm').AsDateTime;
          qtdeTrans := query.FieldByName('QUANT_TRANS').asFloat;
          qtdeReq := query.FieldByName('QUANT_REQ').asFloat;
          qtdeEst := query.FieldByName('QUANT_EST').asFloat;
          qtdeProducao := query.FieldByName('QUANT_PRODUCAO').asFloat;
        end
        else
        begin
          dataConfirmacao := StrToDate('01/01/1990');
          qtdeTrans := 0;
          qtdeReq := 0;
          qtdeEst := 0;
          qtdeProducao := 0;
        end;

        print.Imp(linha, 1, dataSet.FieldByName('NUM_FAB_PROD').AsString);
        print.Imp(linha, 23, copy(dataSet.FieldByName('DESCR_PROD').AsString, 1, 20));
        query.close;
        query.SQL.Text := 'select rq.tipo,rq.nped,rqt.grupo_prod,rqt.cod_prod,pr.num_fab_prod,' +
          ' rq.data_fech,sum(rqt.quant_ped_item) quant_ped_item, sum(rqt.vltot_ped_item) vltot_ped_item' +
          ' from pedvenda rq' +
          ' inner join pedvenda_prod rqt on rq.nped = rqt.nped and rq.tipo = rqt.tipo and' +
          ' rq.cod_empresa = rqt.cod_empresa inner join produtos pr on' +
          ' rqt.grupo_prod = pr.grupo_prod and rqt.cod_prod = pr.cod_prod and' +
          ' rqt.cod_empresa = pr.cod_empresa' +
          ' where rq.data_fech >= :data1 and rq.data_fech <= :data2 and' +
          ' rqt.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
          ' and rqt.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
          ' and rq.cod_empresa = ' + vDadosIni.codEmpresa + ' and rq.ativo = 1 and rq.tipo <> ''ORC''' +
          ' and ((rqt.status is null) or (rqt.status <> ''CANCELADO''))' +
          ' group by rq.tipo,rq.nped,rqt.grupo_prod,rqt.cod_prod,pr.num_fab_prod,rq.data_fech' +
          ' union ' +
          ' select ''PROD'' TIPO, pd.cod_producao NUMDOC, pi.grupo_prod, pi.cod_prod, pr.num_fab_prod, ' +
          ' pd.data_fechamento, sum(coalesce(pi.quantidade_utilizada,0)), sum(coalesce(pi.quantidade_utilizada,0) * pi.prec_cusm_prod) ' +
          ' from produtos pr ' +
          ' inner join producao_item_indice pi on pi.grupo_prod = pr.grupo_prod and pi.cod_prod = pr.cod_prod and pi.cod_empresa = pr.cod_empresa ' +
          ' inner join producao pd on pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa ' +
          ' where pd.data_fechamento >= :data1 and pd.data_fechamento <= :data2' +
          ' and pi.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
          ' and pi.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
          ' and pi.cod_empresa = ' + vDadosIni.codEmpresa +
          ' group by 1, pd.cod_producao, pi.grupo_prod, pi.cod_prod, pr.num_fab_prod, pd.data_fechamento ';
        query.params[0].AsDate := dataConfirmacao;
        query.params[1].AsDate := StrToDate(dataReferencia);
        query.Open;
        vtots := 0;
        vtote := 0;
        vtotpb := 0;
        while not query.eof do
        begin
          vtots := vtots + query.FieldByName('quant_ped_item').AsFloat;
          query.next;
        end;
        query.Close;
        query.SQL.Text := 'select rc.num_nota_nfe,rci.grupo_prod,rci.cod_prod,pr.num_fab_prod,' +
          ' rc.data_lanc_nfe,rci.quant_item_nfe,rci.vlun_item_nfe,fr.nome' +
          ' from' +
          ' nf_entrada rc,item_nf_entrada rci,produtos pr,fornecedor fr' +
          ' where rci.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
          ' and rci.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
          ' and rci.num_nota_nfe = rc.num_nota_nfe and rci.cod_forn_nfe = rc.cod_forn_nfe' +
          ' and rc.data_lanc_nfe >= :vdat1 and rc.data_lanc_nfe <= :vdat2 and' +
          ' (not rc.status_nfe is null or rc.status_nfe <> '''') and rc.cod_forn_nfe = fr.codigo_f' +
          ' and rci.cod_prod = pr.cod_prod and rci.grupo_prod = pr.grupo_prod' +
          ' and rc.cod_empresa = rci.cod_empresa' +
          ' and rci.cod_empresa = pr.cod_empresa' +
          ' and rc.cod_empresa = fr.cod_empresa' +
          ' and rc.cod_empresa = ' + vDadosIni.codEmpresa + ' and RC.ativo=1 ' + //        ' order by rc.data_lanc_nfe';
          ' and (rci.altera_estoque_cfop <> ''N'' or rci.altera_estoque_cfop is null) ' +
          ' union ' +
          ' select nf4.num_nf,it4.grupo_prod,it4.cod_prod,pr.num_fab_prod,nf4.data_lanc, ' +
          ' it4.quantidade,it4.valor_unitario, cl.nome_cliente ' +
          ' from notafiscal nf4 inner join notafiscal_item it4 ' +
          ' on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa ' +
          ' inner join produtos pr on it4.grupo_prod=pr.grupo_prod and it4.cod_prod=pr.cod_prod and it4.cod_empresa = pr.cod_empresa  ' +
          ' inner join clientes cl on nf4.cod_cliente=cl.cod_cliente and nf4.cod_empresa=cl.cod_empresa ' +
          ' where nf4.natureza_nf=''E'' and  nf4.data_lanc >= :vdat1 and nf4.data_lanc <= :vdat2 ' +
          ' and (nf4.status = ''Fechada'') ' +
          ' and nf4.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf4.ativo=1 ' +
          ' and it4.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
          ' and it4.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
          ' and (it4.altera_estoque_cfop <> ''N'' or it4.altera_estoque_cfop is null) ' +
          ' and ((cl.tipo=''F'') or (cl.tipo=''A'')) ' +
          ' union ' +
          ' select pd.cod_producao, pdi.grupo_prod, pdi.cod_prod, pr.num_fab_prod, ' +
          ' pd.data_fechamento, coalesce(pdi.quantidade,0), pdi.prec_cusm_prod, cl.nome_cliente ' +
          ' from produtos pr ' +
          ' inner join producao_item pdi on pdi.grupo_prod = pr.grupo_prod and pdi.cod_prod = pr.cod_prod and pdi.cod_empresa = pr.cod_empresa ' +
          ' inner join producao pd on pd.cod_producao = pdi.cod_producao and pd.cod_empresa = pdi.cod_empresa ' +
          ' left join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
          ' where pd.data_fechamento >= :vdat1 and pd.data_fechamento <= :vdat2 ' +
          ' and pd.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and pdi.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
          ' and pdi.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString + '';

        query.ParamByName('vdat1').AsDate := dataConfirmacao;
        query.ParamByName('vdat2').AsDate := StrToDate(dataReferencia);
        query.Open;
        while not query.eof do
        begin
          vtote := vtote + query.FieldByName('QUANT_ITEM_NFE').AsFloat;
          query.next;
        end;
        query.Close;
        query.SQL.Text := 'select sum(quant) as valor from devolucao where' +
          ' GRUPO_PROD = ' + dataSet.FieldByName('grupo_prod').AsString +
          ' AND COD_PROD = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
          ' AND data >= :vdat1 and data <= :vdat2' +
          ' and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1 and coalesce(nf_gerou,'''') <> ''S''';
        query.params[0].AsDate := dataConfirmacao;
        query.params[1].AsDate := StrToDate(dataReferencia);
        query.open;
        vtotd := query.FieldByName('valor').AsFloat;
        query.close;
        query.sql.text := 'select sum(QTD_DIF_BAL) as soma FROM ESTOQUE_INI WHERE TIP_BAL = ''D''' +
          ' AND GRUPO_PROD = ' + dataSet.FieldByName('grupo_prod').AsString +
          ' AND COD_PROD = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
          ' AND DATA_CONFIRM >= :vdat1 and DATA_CONFIRM <= :vdat2' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
        query.params[0].AsDate := dataConfirmacao;
        query.params[1].AsDate := StrToDate(dataReferencia);
        query.open;
        vtotc := query.FieldByName('SOMA').AsCurrency;
        vtotpb := qtdeTrans + qtdeReq + qtdeProducao;
        print.Imp(linha, 45, vDadosIni.alndir(format('%n', [qtdeEst]), 6));
        print.Imp(linha, 54, vDadosIni.alndir(format('%n', [vtotpb]), 6));
        print.Imp(linha, 61, vDadosIni.alndir(format('%n', [vtote]), 8));
        print.Imp(linha, 71, vDadosIni.alndir(format('%n', [vtots]), 8));
        print.Imp(linha, 82, vDadosIni.alndir(format('%n', [vtotd]), 6));
        print.Imp(linha, 90, vDadosIni.alndir(format('%n', [vtotc]), 6));
        vtotp := 0;
        if (vDadosIni.vEmp.vApresentarEstR = 'O') or (vDadosIni.vEmp.vApresentarEstR = 'S') then
        begin
          query.Close;
          query.SQL.Text := 'select sum(osi.quant_ped_item) as soma from pedvenda os' +
            ' inner join pedvenda_prod osi on  os.nped = osi.nped and os.tipo = osi.tipo and' +
            ' os.cod_empresa = osi.cod_empresa' +
            ' where osi.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
            ' and osi.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and ((osi.status is null) or (osi.status <> ''CANCELADO''))' +
            ' and ((os.status_ped = '''') or (os.status_ped is null))' +
            ' and os.data_fech is null and os.data_ped >= :vdat1 and' +
            ' os.data_ped <= :vdat2 and os.tipo = ''OS'' and' +
            ' OS.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and OS.ATIVO=1 ';
          query.params[0].AsDate := dataConfirmacao;
          query.params[1].AsDate := StrToDate(dataReferencia);
          query.open;
          vtotp := vtotp + query.FieldByName('soma').AsFloat;
        end;
        if (vDadosIni.vEmp.vApresentarEstR = 'R') or (vDadosIni.vEmp.vApresentarEstR = 'S') then
        begin
          query.Close;
          query.SQL.Text := 'select sum(osi.quant_ped_item) as soma from pedvenda os' +
            ' inner join pedvenda_prod osi on  os.nped = osi.nped and os.tipo = osi.tipo and' +
            ' os.cod_empresa = osi.cod_empresa' +
            ' where osi.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
            ' and osi.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and ((osi.status is null) or (osi.status <> ''CANCELADO''))' +
            ' and ((os.status_ped = '''') or (os.status_ped is null))' +
            ' and os.data_fech is null and os.data_ped >= :vdat1 and' +
            ' os.data_ped <= :vdat2 and os.tipo = ''REQ'' and' +
            ' OS.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and OS.ATIVO=1';
          query.params[0].AsDate := dataConfirmacao;
          query.params[1].AsDate := StrToDate(dataReferencia);
          query.open;
          vtotp := vtotp + query.FieldByName('soma').AsFloat;
        
          query.Close;
          query.SQL.Text :=  'select sum(coalesce(c.quant,0)) soma' +
            ' from controle_almoxarifado c ' +
            ' where c.grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
            ' and c.cod_prod = ' + QuotedStr(Trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and c.cod_empresa =' + vDadosIni.codEmpresa +
            ' and c.data_pedido >= :vdat1 and c.data_pedido <= :vdat2';;
          query.params[0].AsDate := dataConfirmacao;
          query.params[1].AsDate := StrToDate(dataReferencia);
          query.open;
          vtotp := vtotp + query.FieldByName('soma').AsFloat;
        end;
        if (vDadosIni.vEmp.vApresentarEstR = 'P') or (vDadosIni.vEmp.vApresentarEstR = 'S') then
        begin
          query.Close;
          query.SQL.Text := 'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as soma from producao pd, producao_item_indice pi' +
            ' where pi.grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
            ' and pi.cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
            ' and pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa' +
            ' and (pd.data_fechamento is null) and pd.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and pd.data >= :vdat1 and pd.data <= :vdat2';
          query.params[0].AsDate := dataConfirmacao;
          query.params[1].AsDate := StrToDate(dataReferencia);
          query.Open;
          vtotp := vtotp + query.FieldByName('soma').AsFloat;
        end;
        if strtodate(dataReferencia) < vDadosIni.getDataBanco(query) then
        begin
          query.Close;
          query.SQL.Text := 'select sum(it.quant_item_nfe) as soma1,sum(it.quant_item_nfe*it.prec_cus_cnt) as soma2' +
            ' from item_nf_entrada it,nf_entrada nf' +
            ' where it.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and it.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
            ' and it.num_nota_nfe = nf.num_nota_nfe and' +
            ' it.cod_forn_nfe = nf.cod_forn_nfe and' +
            ' nf.data_lanc_nfe  >= :vdata and (not nf.status_nfe is null)' +
            ' and nf.cod_empresa = it.cod_empresa' +
            ' and nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf.ativo=1 ' +
            ' union ' +
            ' select sum(it4.quantidade),sum(it4.quantidade*it4.prec_cus_cnt) ' +
            ' from notafiscal_item it4 inner join notafiscal nf4 on it4.cod_nf = nf4.cod_nf ' +
            ' and it4.cod_empresa = nf4.cod_empresa ' +
            ' where nf4.natureza_nf=''E'' and nf4.ativo=1 ' +
            ' and it4.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and it4.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
            ' and nf4.data_lanc  >= :vdata and (not nf4.status is null) ' +
            ' and nf4.cod_empresa = ' + vDadosIni.codEmpresa +
            ' union ' +
            ' select sum(coalesce(pdi.quantidade,0)), sum(coalesce(pdi.quantidade,0) * pdi.prec_cusm_prod) ' +
            ' from produtos pr ' +
            ' inner join producao_item pdi on pdi.grupo_prod = pr.grupo_prod and pdi.cod_prod = pr.cod_prod and pdi.cod_empresa = pr.cod_empresa ' +
            ' inner join producao pd on pd.cod_producao = pdi.cod_producao and pd.cod_empresa = pdi.cod_empresa ' +
            ' where pd.data_fechamento >= :vdata ' +
            ' and pd.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and pdi.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and pdi.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString + '';
          query.ParamByName('vdata').AsDate := strtodate(dataReferencia) + 1;
          query.open;

          vComprasP1 := 0;
          vComprasP2 := 0;
          while not query.eof do
          begin
            vComprasP1 := vComprasP1 + query.FieldByName('soma1').AsFloat;
            vComprasP2 := vComprasP2 + query.FieldByName('soma2').AsFloat;
            query.Next;
          end;

          query.Close;
          query.SQL.Text := 'select sum(osi.quant_ped_item) as soma1,sum(osi.quant_ped_item * osi.pcust_mc) as soma2' +
            ' from pedvenda os' +
            ' inner join pedvenda_prod osi on  os.nped = osi.nped and os.tipo = osi.tipo and' +
            ' os.cod_empresa = osi.cod_empresa' +
            ' where' +
            ' osi.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
            ' and osi.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and ((osi.status is null) or (osi.status <> ''CANCELADO''))' +
            ' and os.data_fech >= :vdata' +
            ' and os.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and os.ativo=1' +
            ' and os.tipo <> ''ORC''' +
            ' union ' +
            ' select sum(coalesce(pi.quantidade_utilizada,0)) as soma1, sum(coalesce(pi.quantidade_utilizada,0) * coalesce(pi.prec_cusm_prod,0)) as soma2' +
            ' from produtos pr ' +
            ' inner join producao_item_indice pi on pi.grupo_prod = pr.grupo_prod and pi.cod_prod = pr.cod_prod and pi.cod_empresa = pr.cod_empresa ' +
            ' inner join producao pd on pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa ' +
            ' where pd.data_fechamento >= :dat1 and pd.data_fechamento <= :dat2' +
            ' and pi.grupo_prod = ' + dataSet.FieldByName('grupo_prod').AsString +
            ' and pi.cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and pi.cod_empresa = ' + vDadosIni.codEmpresa;
          query.ParamByName('vdata').AsDate := strtodate(dataReferencia) + 1;
          query.Open;
          vVendasP1 := query.FieldByName('soma1').AsFloat;
          vVendasP2 := query.FieldByName('soma2').AsFloat;

          query.Close;
          query.SQL.Text := 'select sum(case when (valor_tot > 0) then valor_tot else (quant*valor) end) soma from devolucao ' +
          	' where GRUPO_PROD = ' + dataSet.FieldByName('grupo_prod').AsString +
            ' and COD_PROD = ' + QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString)) +
            ' and data  >= :vdata ' +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and ativo = 1 ' +
            ' and coalesce(nf_gerou,'''') <> ''S'' ';
          query.ParamByName('vdata').AsDate := strtodate(dataReferencia) + 1;
          query.open;
          vDevolucaoP := query.FieldByName('soma').AsFloat;
          vest := (((dataset.FieldByName('EST_F').AsFloat {+ dataset.FieldByName('EST_R').AsFloat}) -
            (vComprasP1 + vDevolucaoP)) + (vVendasP1));
          if vDadosIni.StrToFloatFormat((((qtdeEst + vtotpb) + (vtote + vtotd) - vtots) + vtotc),2) <> vDadosIni.StrToFloatFormat(vest,2) then
            print.Imp(linha, 116, vDadosIni.alndir(format('%n', [((vest))]), 6), clRed)
          else
          print.Imp(linha, 116, vDadosIni.alndir(format('%n', [((vest))]), 6));
          //        - (Dtm1.QrProdTrSUM.value + Dtm1.QrProdRqSUM.value)
        end
        else if vDadosIni.StrToFloatFormat((((qtdeEst + vtotpb) + (vtote + vtotd) - vtots) + vtotc),2) <> vDadosIni.StrToFloatFormat(dataSet.FieldByName('Est_F').AsFloat,2) then
          print.Imp(linha, 116, vDadosIni.alndir(format('%n', [((dataSet.FieldByName('Est_F').AsFloat))]), 6), clRed)
        else
          print.Imp(linha, 116, vDadosIni.alndir(format('%n', [((dataSet.FieldByName('Est_F').AsFloat))]), 6));
        //        - (Dtm1.QrProdTrSUM.value + Dtm1.QrProdRqSUM.value)
        print.Imp(linha, 123, DateToStr(dataConfirmacao));
        print.Imp(linha, 100, vDadosIni.alndir(format('%n', [vtotp]), 6));
        print.Imp(linha, 108, vDadosIni.alndir(format('%n', [(((qtdeEst + vtotpb) + (vtote + vtotd) - vtots) + vtotc)]), 6));
        vtotge := vtotge + vtote;
        vtotgs := vtotgs + vtots;
        vtotgd := vtotgd + vtotd;
        vtotgc := vtotgc + vtotc;
        linha := linha + 1;
        if linha >= 65 then
        begin
          linha := 1;
          print.Novapagina;
          novaPaginaPrint;
        end;
      end;
      dataset.Next;
      //    Dtm1.QRYProdutos.next;
    end;
    print.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17]);
  //  linha := linha + 1;
  //  print.Imp(linha, 1, 'TOTAL:');
    if print.EstaAberto then
      print.fechar;
  finally
  	dataset.EnableControls;
  end;
end;

procedure TFichaProd.novaPaginaPrint;
begin
  print.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  print.ImpF(linha, 1, 'FICHA DO PRODUTO', [normal, negrito]);
  linha := linha + 1;
  print.ImpF(linha, 1, ' ESTOQUE ATE: ' + dataReferencia, [normal, negrito]);
  vpag := vpag + 1;
  linha := linha + 2;
  print.ImpF(linha, 1, 'DATA: ' + datetostr(date), [comp17]);
  print.ImpF(linha, 100, 'PAGINA: ' + vDadosIni.strzero(vpag, 4), [comp17]);
  linha := linha + 1;
  print.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17]);
  linha := linha + 1;
  print.ImpF(linha, 1, 'CODIGO', [comp17]);
  print.ImpF(linha, 23, 'DENOMINACAO', [comp17]);
  print.ImpF(linha, 45, 'EST.IN', [comp17]);
  print.ImpF(linha, 54, 'QT.PB+', [comp17]);
  print.ImpF(linha, 63, 'QT.E+', [comp17]);
  print.ImpF(linha, 74, 'QT.S-', [comp17]);
  print.ImpF(linha, 83, 'QT.D+', [comp17]);
  print.ImpF(linha, 90, 'QT.C+/-', [comp17]);
  print.ImpF(linha, 98, 'Q.P(inf)', [comp17]);
  print.ImpF(linha, 108, 'SALDO', [comp17]);
  print.ImpF(linha, 116, 'EST AT', [comp17]);
  print.ImpF(linha, 123, 'DT.ULT.BAL', [comp17]);
  linha := linha + 1;
  print.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17]);
  linha := linha + 1;
end;

{ TRelatoriosSimpleso }

procedure TRelatoriosSimples.bandaDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vBarCode.BarCode := trim(dtSet.FieldByName('NUM_FAB_PROD').AsString);
  if somenteSelecionado then
    PrintBand := grid.DataSource.DataSet.FieldByName('sel').AsString = 'S';
    //PrintBand := grid.SelectedRows.Current_RowSelected;
end;

constructor TRelatoriosSimples.create;
begin
  transacao := TIBTransaction(DtmProdutos.IBTransProdutos);
  buscas := TIBQuery(dtmProdutos.qrEtiquetaTem);
end;

function TRelatoriosSimples.gravaEtiProdTemp(NUM_FAB_PROD, DESCR_PROD, EMB_PROD,
  LOCACAO_PROD, LOCACAO_PROD_1, GRUPO_PROD, COD_PROD, APLICACAO_PROD,
  UNIDADE: string; PREC_TAB_PROD, PREC_30_PROD: double): boolean;
var
  dt: TDateTime;
begin
  //  Gencodigo()
  dt := vDadosIni.getDataBanco(buscas);
  buscas.Close;
  buscas.SQL.Text := 'INSERT INTO IMP_BAR_PROD (NITEM,COD_EMPRESA, NUM_FAB_PROD,' +
    ' DESCR_PROD, PREC_TAB_PROD, ATIVO, EMB_PROD, LOCACAO_PROD, LOCACAO_PROD_1,' +
    ' GRUPO_PROD, COD_PROD, APLICACAO_PROD, UNIDADE, PREC_30_PROD,DT_MARCACAO,SELECIONADO)' +
    ' VALUES (' + inttostr(Gencodigo('IMP_BAR_PROD', DtmProdutos.SpIncCodigo, vDadosIni.codEmpresa)) +
    ', ' + vDadosIni.codempresa +
    ', ' + quotedstr(trim(NUM_FAB_PROD)) +
    ', :descricao' +
    ', :precoTabela, 1' +
    ', ' + quotedstr(trim(EMB_PROD)) +
    ', ' + quotedstr(trim(LOCACAO_PROD)) +
    ', ' + quotedstr(trim(LOCACAO_PROD_1)) +
    ', ' + GRUPO_PROD +
    ', ' + quotedstr(trim(COD_PROD)) +
    ', :aplicacao ' +
    ', ' + quotedstr(trim(UNIDADE)) +
    ', :preco30Prod,:dtMarcacao,null)';
  buscas.Prepare;
  buscas.ParamByName('descricao').AsString := copy(trim(DESCR_PROD), 1, 40);
  buscas.ParamByName('precoTabela').AsFloat := PREC_TAB_PROD;
  buscas.ParamByName('aplicacao').AsString := trim(APLICACAO_PROD);
  buscas.ParamByName('preco30Prod').AsFloat := PREC_30_PROD;
  buscas.ParamByName('dtMarcacao').AsDateTime := dt;
  buscas.ExecSQL;
  CommitaTransacao;
  buscas.Close;
end;

procedure TRelatoriosSimples.ImprimirEtiCodBarras;
var
  i: integer;
  selec: string;
begin
  if somenteSelecionado then
  begin
    ExecutaComandosSqlExec('update IMP_BAR_PROD set selecionado= null where COD_EMPRESA =' + vDadosIni.codEmpresa +
      ' and ativo=1');
    try
    	grid.DataSource.dataSet.DisableControls;
      grid.DataSource.dataSet.First;
      while not grid.DataSource.dataSet.Eof do
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        //if grid.SelectedRows.Current_RowSelected then
        begin
          if ImprimirProdutosMarcados then
          begin
            QtdeEmt := '0';
            ExecutaComandosSqlExec('update IMP_BAR_PROD set selecionado= ''S'' where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and nitem=' + Grid.DataSource.DataSet.FieldByName('NITEM').AsString);
          end
          else
          begin
            QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
            if not ImprimirQtdEstoque then
            begin
              QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
              if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp) then
              	exit;
              if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                QtdeEmt := inttostr(round(QtdTemp));
            end;
          end;
          if strtofloat(QtdeEmt) >= 1 then
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for I := 1 to strtoint(QtdeEmt) do
            begin
              gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
            end;
            ExecutaComandosSqlExec('update IMP_BAR_PROD set selecionado= ''S'' where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
          end;
        end;
        grid.DataSource.dataSet.Next;
      end;
    finally
      grid.DataSource.dataSet.EnableControls;
    end;
  end
  else
  begin
  	try
    	grid.DataSource.dataSet.DisableControls;
      grid.DataSource.dataSet.First;
      while not grid.DataSource.dataSet.Eof do
      begin
        if ImprimirProdutosMarcados then
        begin
          QtdeEmt := '0';
          ExecutaComandosSqlExec('update IMP_BAR_PROD set selecionado= ''S'' where COD_EMPRESA =' + vDadosIni.codEmpresa +
            ' and ativo=1 and nitem=' + Grid.DataSource.DataSet.FieldByName('NITEM').AsString);
        end
        else
        begin
          QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
          if not ImprimirQtdEstoque then
          begin
            QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
            if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp) then
            	exit;
            if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
              QtdeEmt := inttostr(round(QtdTemp));
          end;
        end;
        if strtofloat(QtdeEmt) >= 1 then
        begin
          ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
            ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
            ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
          for I := 1 to strtoint(QtdeEmt) do
          begin
            gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
              Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
              Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
              Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
              Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
              Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
          end;
          ExecutaComandosSqlExec('update IMP_BAR_PROD set selecionado= ''S'' where COD_EMPRESA =' + vDadosIni.codEmpresa +
            ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
            ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
        end;
        grid.DataSource.dataSet.Next;
      end;
    finally
      grid.DataSource.dataSet.EnableControls;
    end;
  end;
end;

{ TInventario }

constructor TInventario.create;
begin
  if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
  transacao := TIBTransaction(DtmProdutos.IBTransGE);
  Buscas := TIBQuery(DtmProdutos.qrInventario);
  buscas.Close;
  buscas.SQL.Text := 'select IE_EMP,CGC_EMP,CASAS_DECIMAIS,CIDADE_EMP from empresa ' +
    ' where ativo=1 and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    NumeroCasasDecimais := buscas.FieldByName('CASAS_DECIMAIS').AsInteger;
    IE := trim(buscas.FieldByName('IE_EMP').AsString);
    CPFCNPJ := trim(buscas.FieldByName('CGC_EMP').AsString);
    CIDADEEMP := trim(buscas.FieldByName('CIDADE_EMP').AsString);
  end;
  buscas.Close;
end;

destructor TInventario.Destroy;
begin
  buscas.Close;
  inherited;
end;

function TInventario.getQtdItensCompra(codprod: string; grupoprod: integer;
  data: TDateTime): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(it.quant_item_nfe) as qtdItemNFE,sum(it.quant_item_nfe*it.prec_cus_cnt) ' +
    ' from item_nf_entrada it,nf_entrada nf ' +
    ' where nf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and nf.ativo=1 and it.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and it.grupo_prod = ' + inttostr(grupoprod) +
    ' and it.num_nota_nfe = nf.num_nota_nfe ' +
    ' and it.cod_forn_nfe = nf.cod_forn_nfe and it.cod_empresa = nf.cod_empresa ' +
    ' and nf.data_lanc_nfe  >= :vdata and (not nf.status_nfe is null)' +
    ' union ' +
    ' select sum(it4.quantidade),sum(it4.quantidade*it4.prec_cus_cnt) ' +
    ' from notafiscal_item it4 inner join notafiscal nf4 on it4.cod_nf = nf4.cod_nf and it4.cod_empresa = nf4.cod_empresa ' +
    ' where nf4.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf4.natureza_nf=''E'' ' +
    ' and nf4.ativo=1 and it4.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and it4.grupo_prod = ' + inttostr(grupoprod) +
    ' and nf4.data_lanc  >= :vdata and (nf4.status = ''Fechada'')';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := 0;
  while not buscas.eof do
  begin
    result := result + buscas.FieldByName('qtdItemNFE').AsFloat;
    buscas.next;
  end;
  buscas.Close;
end;

function TInventario.getQtdItensDevolvidos(codprod: string; grupoprod: integer;
  data: TDateTime): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(case when (valor_tot > 0) then valor_tot else (quant*valor) end) SomaValorDevolvido, ' +
  	' sum(quant) as qtdItemDevolvido from devolucao ' +
    ' where cod_prod = ' + quotedstr(trim(codprod)) +
    ' and grupo_prod = ' + inttostr(grupoprod) +
    ' and data  >= :vdata ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ' +
    ' and coalesce(nf_gerou,'''') <> ''S'' ';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := buscas.FieldByName('qtdItemDevolvido').AsFloat;
  buscas.Close;
end;

function TInventario.getQtdItensVenda(codprod: string; grupoprod: integer;
  data: TDateTime): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as qtdItemREQOS,sum(ipv.quant_ped_item * ipv.pcust_mc) as vCustoMedio ' +
    ' from pedvenda_prod ipv,pedvenda pv ' +
    ' where ipv.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and ((pv.tipo=' + quotedstr('REQ') + ') or (pv.tipo=' + quotedstr('OS') + ')) ' +
    ' and ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and ipv.nped = pv.nped and pv.data_fech  >= :vdata ' +
    ' and ((ipv.status is null) or (ipv.status <> ''CANCELADO''))' +
    ' and pv.cod_empresa = ipv.cod_empresa ' +
    ' and ipv.tipo=pv.tipo' +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo=1';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := buscas.FieldByName('qtdItemREQOS').AsFloat;
  buscas.Close;
end;

procedure TInventario.grava_tipo74(vQuant: Double; valor: Double;
  tipoPosse, grupoprod: integer; codprod: string; valor_icms, valor_pis, valor_cofins : Double);
var
  Posse: TInv_tipo74_posse_class;
  InvId: Integer;
begin
  if tipoPosse > 0 then
    Exit;
  // Caso houver necessidade o tipo de posse será usado para achar o código de posse
  // mas por enquanto não temos nenhum caso de clientes(que usam peças miudas) que façam uso de
  // Remessa para demonstração de mercadoria
  if vGravaTipo74 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select * from INV_TIPO74 where data_inv = :vdata ' +
      ' and GRUPO_PROD = ' + inttostr(grupoprod) +
      ' AND COD_PROD = ' + quotedstr(trim(codprod)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('VDATA').AsDate := strtodate(vDataReferencia);
    buscas.Open;
    InvId := buscas.FieldByName('id').AsInteger;
    if buscas.isempty then
    begin
      buscas.Close;
      buscas.SQL.Text := 'INSERT INTO INV_TIPO74 ' +
        ' (DATA_INV, COD_EMPRESA, GRUPO_PROD, COD_PROD, QUANTIDADE,' +
        ' VALOR_PROD, CODIGO_POSSE, CNPJ_POSSE, INSCR_POSSE, UF_POSSE, CHASSI_MT, VALOR_ICMS, VALOR_PIS, VALOR_COFINS)' +
        ' VALUES (:vData' +
        ' ,' + vDadosIni.codEmpresa +
        ' ,' + inttostr(grupoprod) +
        ' ,' + quotedstr(trim(codprod)) +
        ' ,:vQuant' +
        ' ,:vValor' +
        ' ,' + quotedstr('1') +
        ' ,' + quotedstr('00000000000000') +
        ' ,' + quotedstr(vDadosIni.Space(14)) +
        ' , ' + quotedstr('  ') +
        ' , NULL, :VALOR_ICMS, :VALOR_PIS, :VALOR_COFINS)';
      buscas.ParamByName('VDATA').AsDate := strtodate(vDataReferencia);
      buscas.ParamByName('vQuant').AsFloat := vQuant;
      buscas.ParamByName('vValor').AsFloat := Valor;
      buscas.ParamByName('VALOR_ICMS').AsFloat := valor_icms;
      buscas.ParamByName('VALOR_PIS').AsFloat := valor_pis;
      buscas.ParamByName('VALOR_COFINS').AsFloat := valor_cofins;
      buscas.Prepare;
      buscas.ExecSQL;
    end
    else
    begin
      Posse := TInv_tipo74_posse_class.Create;
      if InvId > 0 then
        Posse.CopyFrom(SqlOpen('select ip.* from inv_tipo74_posse ip' +
                               ' where ip.inv_id = %d and ip.cod_empresa = %d and ip.ind_prop = 0',
                               [InvId, vDadosIni.cod_empresa]));
      if Posse.id > 0 then
      begin
        Posse.qtde := vQuant;
        Posse.valor := valor;
        if Posse.FoundChanges() then
          SqlExec(Posse.SQLMotor().SQLUpdate);
      end
      else if InvId > 0 then
      begin
        Posse.Free;
        Posse             := TInv_tipo74_posse_class.Create;
        Posse.inv_id      := InvId;
        Posse.cod_empresa := vDadosIni.cod_empresa;
        Posse.qtde        := vQuant;
        Posse.valor       := valor;
        Posse.ind_prop    := 0;
        Posse.ativo       := 1;
        SqlExec(Posse.SQLMotor().SQLInsert);
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text := 'update INV_TIPO74 ' +
          ' set QUANTIDADE = :vQuant' +
          ' ,VALOR_PROD= :vValor, VALOR_ICMS = :VALOR_ICMS, VALOR_PIS = :VALOR_PIS, VALOR_COFINS = :VALOR_COFINS' +
          ' where data_inv = :vdata ' +
          ' and GRUPO_PROD = ' + inttostr(grupoprod) +
          ' AND COD_PROD = ' + quotedstr(trim(codprod)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ParamByName('VDATA').AsDate := strtodate(vDataReferencia);
        buscas.ParamByName('vQuant').AsFloat := vQuant;
        buscas.ParamByName('vValor').AsFloat := Valor;
        buscas.ParamByName('VALOR_ICMS').AsFloat := valor_icms;
        buscas.ParamByName('VALOR_PIS').AsFloat := valor_pis;
        buscas.ParamByName('VALOR_COFINS').AsFloat := valor_cofins;
        buscas.Prepare;
        buscas.ExecSQL;
      end;
    end;
    buscas.close;
  end;
end;

procedure TInventario.imprimirInventario(lb: TLabel; ProgressBar: TProgressBar; rdprint: TRdprint; vusTipo74: string);
var
  vqtdg, vqtdger, vest, vQtdItemVnd, qtdItemCompras, qtdItemDevolvido, vvalortotal: Double;
  vgrup: integer;
  vitem, i, j, k: integer;
  //  eu: string;
  vprC: Double;
  qrBuscaProd: TIBQuery;
  strTemp: string;
  vdescprod: string;
  vTempCSTPIS, vTempCSTCOFINS: string;
  vTempAliqPIS, vTempAliqCOFINS, vTempAliqICMS, SomaPosse: Double;
  dVrEstoque, dVrUnEst, dIcms, dBcPisCofins, dPis, dCofins: Double;
  vAliqIcms: string;
  sAliqIcms: TStringList;
  vQuantAliqIcms, PosseAtualCab: integer;
  vValorIcms : array[1..50] of double;
  buscas2: TIBQuery;
  vGradeP: boolean;
  vExisteGrade, ExibirPosse: boolean;
  vDatatemp: TDate;
  ItensInv: TInv_tipo74s_class;
  NumeroParaExtenso: string;
  conf_pc: TConfTributo;
  itemFiscal: TItemFiscal;

  procedure IncLinhaRel;
  begin
    rdp.imp(linha, 1, '|');
    rdp.imp(linha, 10, '|');
    rdp.imp(linha, 50, '|');
    rdp.imp(linha, 54, '|');
    rdp.imp(linha, 66, '|');
    rdp.imp(linha, 78, '|');
    rdp.imp(linha, 91, '|');
    if vTipoCabecalho = 'Contábil2' then
    begin
    Rdp.imp(linha, 104, '|');
    Rdp.imp(linha, 116, '|');
    Rdp.imp(linha, 129, '|');
    Rdp.imp(linha, 142, '|');
    end;
  end;

  function GetConfTributo: TConfTributo;
  var
    section: string;
    conf: TConfig_sistema_class;
  begin
    Result := TConfTributo.Create();
    conf   := TConfig_sistema_class.getConf('nf_piscofins_bases', buscas, vDadosIni.cod_empresa);
    try
      section     := ReplaceText(TConfTributo.GetSectionBC(ttPISCOFINS, 'S', '55'), 'Composicao_BC_PISCOFINS_', '');
      //section := ReplaceText(section, 'Composicao_BC_PISCOFINS_', '');
      if conf.value1_b.ini.SectionExists(section) then
      begin
        conf.value1_b.WriteBool(section, 'Habilitado', True);
        Result.setConfBC(ttPISCOFINS, 'S', '55', section, conf.value1_b);
      end;

    finally
      conf.Free;
    end;
  end;

begin
  if not vDadosIni.PesqPros('PRO335', 'IMPRIMIR INVENTARIO', '', 'PRODUTOS', '', buscas, true) then
    exit;

  try
    
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vExisteGrade := trim(retornaValor('select coalesce(cod_grade, 0) as valor from grade ' +
   ' where ativo = 1 and cod_grade > 0 and cod_empresa = ' + vDadosIni.codEmpresa)) <> '';

  conf_pc              := GetConfTributo;
  itemFiscal.modeloDoc := '55';
  itemFiscal.e_s       := 'S';
  itemFiscal.tipoCalc  := tcCompleto;

  qrBuscaProd := TIBQuery(dtmProdutos.qrBuscaInvet);
  rdp := TRDprint(rdprint);
  rdp.OpcoesPreview.CaptionPreview := 'Inventário de Produtos';
  rdp.CaptionSetup := 'Inventário de Produtos1';
  rdp.TitulodoRelatorio := 'Inventário de Produtos2';
  rdp.OnSendMail := vDadosini._SendMailRdPrint;
  rdp.OpcoesPreview.Preview := true;
  //  vTipoCabecalho := Cabecalho; //=combobox1.text
  //  vGravaTipo74 := GravaTipo74;
  if vTipoCabecalho = 'Geral' then
  begin
    rdp.FonteTamanhoPadrao := S17cpp;
    rdp.TamanhoQteColunas := 132;
  end
  else if vTipoCabecalho = 'Contábil' then
  begin
    rdp.FonteTamanhoPadrao := S10cpp;//S10cpp;
    rdp.TamanhoQteColunas := 91;
  end
  else if vTipoCabecalho = 'Contábil2' then
  begin
    rdp.FonteTamanhoPadrao := S10cpp;//S10cpp;
    rdp.TamanhoQteColunas := 142;
  end;
  linha := 1;
  if vPaginaIni > 0 then
    vPaginaIni := vPaginaIni - 1
  else
    vPaginaIni := 0;
  sAliqIcms := TStringList.Create;
  sAliqIcms.Clear;
  vQuantAliqIcms := 0;
  vAliqIcms := '';
  vtotger := 0.00;
  vtotgert := 0.00;
  vtoticms := 0.00;
  vtotpis := 0.00;
  vtotcofins := 0.00;
  vvalortotal := 0.00;
  vtotst := 0.00;
  vtotisento := 0.00;
  vtotnincidencia := 0.00;
  vitem := 1;
  vest := 0.00;
  vqtdg := 0; vqtdger := 0;
  PosseAtualCab := -1;
  SomaPosse := 0;
  if not vDadosIni.ModImp(rdp) then
    exit;
  // 'SELECT * FROM Produtos Order by grupo_prod,Descr_prod';
  lb.Caption := 'Abrindo Bases de Produtos...';
  //  lb.Refresh;
  if vOrdemCresDescricaoProd or (vTipoCabecalho <> 'Geral') then
  begin
    SqlOpen('select distinct iif(ip.id is null, 0, iif(ip.ind_prop = 0, 0, iif(ip.ind_prop = 1, 1, 2))) codigo_posse' +
            ' from inv_tipo74 inv' +
            ' left join inv_tipo74_posse ip on ip.inv_id = inv.id and ip.cod_empresa = inv.cod_empresa' +
            ' where inv.cod_empresa = %d and inv.data_inv = %s',
            [vDadosIni.cod_empresa, date_fb(StrToDate(vDataReferencia))]).FetchAll;
    ExibirPosse := buscas.RecordCount > 1;
  end
  else
    ExibirPosse := False;

  if vGravaTipo74 and (vTipoCabecalho <> 'Geral') then
  begin
    ItensInv := TInv_tipo74s_class.Create;
    ItensInv.CopyFrom(TInv_tipo74_class,
                      SqlOpen('select data_inv, cod_empresa, grupo_prod, cod_prod from inv_tipo74' +
                              ' where data_inv = %s and cod_empresa = %d',
                              [date_fb(StrToDate(vDataReferencia)), vDadosIni.cod_empresa]));
  end;

  qrBuscaProd.Close;
  if vusTipo74 = 'S' then
  begin
    {
    qrBuscaProd.SQL.Text := 'select inv.*,pr.descr_prod,pr.unidade,pr.num_fab_prod,pr.nbm,' +
      ' pr.cst_pis, pr.cst_cofins, pr.icm_prod, pr.prec_cusm_prod, pr.icm_prod, pr.isento_prod, pr.n_incidencia_prod from inv_tipo74 inv left join produtos pr ' +
      'on inv.grupo_prod = pr.grupo_prod and inv.cod_prod = pr.cod_prod and inv.cod_empresa = pr.cod_empresa where ' +
      ' inv.cod_empresa = ' + vDadosIni.codEmpresa + ' and data_inv = ' + quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(vDataReferencia)));
    }    
    qrBuscaProd.SQL.Text :=  Format('select i.*,' +
                                    ' i7.chassi_mt, i7.valor_icms, i7.valor_pis, i7.valor_cofins, i7.id,' +
                                    ' pr.descr_prod, pr.unidade, pr.num_fab_prod, pr.nbm, pr.cst_pis, pr.cst_cofins,' +
                                    ' pr.icm_prod, pr.prec_cusm_prod, pr.isento_prod, pr.n_incidencia_prod,' +
                                    ' i.posse_qtde quantidade, (i.posse_total / i.posse_qtde) valor_prod' +
                                    ' from (select inv.data_inv, inv.cod_empresa, inv.grupo_prod, inv.cod_prod,' +
                                    ' iif(ip.id is null, 0, iif(ip.ind_prop = 0, 0, iif(ip.ind_prop = 1, 1, 2))) codigo_posse,' +
                                    ' sum(iif(ip.id is null, inv.quantidade, ip.qtde)) posse_qtde,' +
                                    ' sum(iif(ip.id is null, inv.valor_prod * inv.quantidade, ip.valor * ip.qtde)) posse_total' +
                                    ' from inv_tipo74 inv' +
                                    ' left join inv_tipo74_posse ip on ip.inv_id = inv.id and ip.cod_empresa = inv.cod_empresa' +
                                    ' where inv.cod_empresa = %d and data_inv = %s' +
                                    ' group by 1,2,3,4,5)' +
                                    ' as i' +
                                    ' inner join inv_tipo74 i7 on i7.data_inv = i.data_inv and i7.cod_empresa = i.cod_empresa' +
                                    '   and i7.grupo_prod = i.grupo_prod and i7.cod_prod = i.cod_prod' +
                                    ' left join produtos pr on i7.grupo_prod = pr.grupo_prod and i7.cod_prod = pr.cod_prod' +
                                    '   and i7.cod_empresa = pr.cod_empresa' +
                                    ' order by %s %s pr.descr_prod',
                                    [vDadosIni.cod_empresa, date_fb(StrToDate(vDataReferencia)),
                                     IfThen(ExibirPosse, 'i.codigo_posse,'),
                                     IfThen(not vOrdemCresDescricaoProd, 'pr.grupo_prod,')]);
  end
  else
  begin
    qrBuscaProd.SQL.Text := 'select ' +
      ' pr.grupo_prod,  pr.cod_prod, pr.est_f, pr.est_r, pr.prec_cusm_prod,' +
      ' pr.descr_prod,pr.unidade,pr.num_fab_prod,pr.nbm,' +
      ' pr.cst_pis, pr.cst_cofins, pr.icm_prod, pr.isento_prod, pr.n_incidencia_prod, 0 codigo_posse' +
      ' from produtos pr where  pr.cod_empresa = ' + vDadosIni.codEmpresa + ' and pr.ativo=1 ' +
      ' and ((pr.consumo <> ' + quotedstr('S') + ') or (pr.consumo is null)) ' +
      ' and ((pr.dat_cad_prod is null) or (pr.dat_cad_prod <= :data_ref))' +
      ' and ((((select count(pv.cod_prod) from pedvenda_prod pv ' +
      ' where ((pv.tipo=' + quotedstr('OS') + ' ) or (pv.tipo=' + quotedstr('REQ') + ')) and ' +
      ' pv.grupo_prod = pr.grupo_prod and pv.cod_prod = pr.cod_prod and ' +
      ' pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo=1) >= 1 ) ' +
      ' or ' +
      ' ((select count(it.cod_prod) from item_nf_entrada it where ' +
      ' it.grupo_prod = pr.grupo_prod and it.cod_prod = pr.cod_prod and ' +
      ' it.cod_empresa = ' + vDadosIni.codEmpresa + ' and it.ativo=1) >= 1 ) ' +
      ' or ' +
      ' ((select count(nfit.cod_prod) from notafiscal_item nfit inner join notafiscal nf on ' +
      ' nf.cod_nf=nfit.cod_nf and nf.cod_empresa=nfit.cod_empresa  where nf.natureza_nf=''E'' and ' +
      ' nfit.grupo_prod = pr.grupo_prod and nfit.cod_prod = pr.cod_prod and  ' +
      ' nfit.cod_empresa = ' + vDadosIni.codEmpresa + ' and nfit.ativo=1) >= 1 ) ' +
      ' ) or ((pr.est_f) > 0 and pr.cod_empresa = ' + vDadosIni.codEmpresa + '))';
//      ' ) or ((pr.est_f+pr.est_r) > 0 and pr.cod_empresa = ' + vDadosIni.codEmpresa + '))';
    qrBuscaProd.sql.Text := 'select * from (' + qrBuscaProd.sql.Text +
      Format(' union' +
             ' select pr.grupo_prod, pr.cod_prod, i.posse_qtde est_f, 0 est_r,' +
             ' (i.posse_total / i.posse_qtde) prec_cusm_prod,' +
             ' pr.descr_prod, pr.unidade, pr.num_fab_prod,' +
             ' pr.nbm, pr.cst_pis, pr.cst_cofins, pr.icm_prod, pr.isento_prod, pr.n_incidencia_prod, i.codigo_posse' +
             ' from ( select inv.data_inv, inv.cod_empresa, inv.grupo_prod, inv.cod_prod,' +
             ' iif(ip.id is null, 0, iif(ip.ind_prop = 0, 0, iif(ip.ind_prop = 1, 1, 2))) codigo_posse,' +
             ' sum(iif(ip.id is null, inv.quantidade, ip.qtde)) posse_qtde,' +
             ' sum(iif(ip.id is null, inv.valor_prod * inv.quantidade, ip.valor * ip.qtde)) posse_total' +
             ' from inv_tipo74 inv' +
             ' inner join inv_tipo74_posse ip on ip.inv_id = inv.id and ip.cod_empresa = inv.cod_empresa and ip.ind_prop > 0' +
             ' where inv.cod_empresa = %d and inv.data_inv = %s' +
             ' group by 1,2,3,4,5)' +
             ' as i' +
             ' inner join inv_tipo74 i7 on i7.data_inv = i.data_inv and i7.cod_empresa = i.cod_empresa' +
             '   and i7.grupo_prod = i.grupo_prod and i7.cod_prod = i.cod_prod' +
             ' left join produtos pr on i7.grupo_prod = pr.grupo_prod and i7.cod_prod = pr.cod_prod' +
             '   and i7.cod_empresa = pr.cod_empresa' +
             ' ) as ii' +
             ' order by %s %s ii.descr_prod',
             [vDadosIni.cod_empresa, date_fb(StrToDate(vDataReferencia)),
              IfThen(ExibirPosse, 'ii.codigo_posse,'),
              IfThen(not vOrdemCresDescricaoProd, 'ii.grupo_prod,')]);

    qrBuscaProd.ParamByName('data_ref').AsDate := StrToDate(vDataReferencia);
    {
    if (vOrdemCresDescricaoProd) and (vTipoCabecalho = 'Geral') then
      qrBuscaProd.sql.Text := qrBuscaProd.sql.Text + ' order by pr.Descr_prod'
    else
      qrBuscaProd.sql.Text := qrBuscaProd.sql.Text + ' order by pr.grupo_prod,pr.Descr_prod';
    }
  end;
  logs(qrBuscaProd.SQL.Text, Self.ClassName + '.imprimirInventario.QueryOpen');

  qrBuscaProd.Open;
  logs_elapsed_time();

  qrBuscaProd.FetchAll;
  ProgressBar.max := qrBuscaProd.RecordCount;
  vgrup := qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger;

  rdp.abrir;
  novaPaginaPrint;
  while not qrBuscaProd.eof do
  begin
    Application.processMessages;
    if vusTipo74 = 'S' then
    begin
      if (qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger = 0) and
        (qrBuscaProd.FieldByName('CHASSI_MT').AsString <> '') then
      begin
        buscas.close;
        buscas.SQL.text := 'select * from comprasmesesv4 where chassi = ''' + qrBuscaProd.FieldByName('CHASSI_MT').AsString +
          ''' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;
        if not buscas.IsEmpty then
          vdescprod := buscas.FieldByName('DESCRICAO_VERSAO').AsString
        else
          vdescprod := '';
        buscas.close;
      end;

      vest := qrBuscaProd.FieldByName('QUANTIDADE').AsFloat;
      vprc := qrBuscaProd.FieldByName('VALOR_PROD').AsFloat;

    end
    else if qrBuscaProd.FieldByName('codigo_posse').AsInteger in [1,2] then
    begin        
      vest := qrBuscaProd.FieldByName('EST_F').AsFloat;
      vprc := qrBuscaProd.FieldByName('PREC_CUSM_PROD').AsFloat;
    end
    else
    begin
      if strtodate(vDataReferencia) < date then
      begin
         vDadosIni.RetornarEstoquePrecoCusto(buscas, buscas2, vDataReferencia,
         qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger, qrBuscaProd.FieldByName('COD_PROD').asstring,
         vExisteGrade, vGradeP, vest, vprc);

        if (not vGradeP) or (buscas.IsEmpty) then
        begin
          vprC := 0;
          qtdItemCompras := getQtdItensCompra(trim(qrBuscaProd.FieldByName('COD_PROD').asstring), qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger, strtodate(vDataReferencia));
          vQtdItemVnd := getQtdItensVenda(trim(qrBuscaProd.FieldByName('COD_PROD').asstring), qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger, strtodate(vDataReferencia));
          qtdItemDevolvido := getQtdItensDevolvidos(trim(qrBuscaProd.FieldByName('COD_PROD').asstring), qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger, strtodate(vDataReferencia));
          vest := (((qrBuscaProd.FieldByName('EST_F').AsFloat) - (qtdItemCompras + qtdItemDevolvido)) + (vQtdItemVnd));
//        vest := (((qrBuscaProd.FieldByName('EST_F').AsFloat + qrBuscaProd.FieldByName('EST_R').AsFloat) - (qtdItemCompras + qtdItemDevolvido)) + (vQtdItemVnd));
        end;
//        if vest > 0 then
        if vDadosIni.StrToFloatFormat(vest, 3) > 0.000 then
        begin
          if vprC = 0 then
          begin
            buscas.Close;
            buscas.SQL.Text := 'SELECT first 1 data,valor,prec_cus_med,pr_cusc_prod FROM CUSTOS ' +
              ' WHERE GRUPO_PROD = ' + qrBuscaProd.FieldByName('GRUPO_PROD').asstring +
              ' AND COD_PROD = ' + quotedstr(trim(qrBuscaProd.FieldByName('COD_PROD').asstring)) +
              ' AND DATA < :vdata ' +
              ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1 ' +
              ' order by data desc';
            buscas.ParamByName('vData').AsDate := strtodate(vDataReferencia) + 1;
            buscas.Open;
            if buscas.IsEmpty then
              vprC := qrBuscaProd.FieldByName('PREC_CUSM_PROD').asfloat
            else if buscas.FieldByName('PREC_CUS_MED').AsFloat = 0 then
              vprC := buscas.FieldByName('VALOR').AsFloat
            else
              vprC := buscas.FieldByName('PREC_CUS_MED').AsFloat;
          end;
        end;
      end
      else
      begin
        vest := (qrBuscaProd.FieldByName('EST_F').AsFloat {+ qrBuscaProd.FieldByName('EST_R').AsFloat});
        vprc := qrBuscaProd.FieldByName('PREC_CUSM_PROD').AsFloat;
      end;
    end;

    if Trim(qrBuscaProd.FieldByName('cst_pis').AsString) <> '' then
      vTempCSTPIS := Trim(qrBuscaProd.FieldByName('cst_pis').AsString)
    else
      vTempCSTPIS := '01';

    vTempCSTCOFINS := vTempCSTPIS;

    if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or
      (vTempCSTPIS = '05') or (vTempCSTPIS = '01') then
      vTempAliqPIS := vDadosIni.vEmp.vAliqPIS
    else
      vTempAliqPIS := 0;

    if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or
      (vTempCSTCOFINS = '05') or (vTempCSTCOFINS = '01') then
      vTempAliqCOFINS := vDadosIni.vEmp.vAliqCOFINS
    else
      vTempAliqCOFINS := 0;

    vTempAliqICMS :=  qrBuscaProd.FieldByName('ICM_PROD').AsFloat;

    if vDadosIni.StrToFloatFormat(vest, 3) > 0.000 then
      if vTipoCabecalho = 'Contábil2' then
      begin
        if qrBuscaProd.FieldByName('ICM_PROD').AsFloat > 0 then
          if pos(qrBuscaProd.FieldByName('ICM_PROD').AsString + '|', vAliqIcms) = 0 then
          begin
             vQuantAliqIcms := vQuantAliqIcms + 1;

            if trim(vAliqIcms) = '' then
              vAliqIcms := qrBuscaProd.FieldByName('ICM_PROD').AsString + '|'
            else
              vAliqIcms := vAliqIcms + qrBuscaProd.FieldByName('ICM_PROD').AsString + '|';

            sAliqIcms.Add(qrBuscaProd.FieldByName('ICM_PROD').AsString);

            if vAcresDesc <> 0 then
            begin
              if vDivisao then
              begin
                vValorIcms[vQuantAliqIcms] := vValorIcms[vQuantAliqIcms] + (vest * (vprC / vAcresDesc));
                vvalortotal := vvalortotal + (vest * (vprC / vAcresDesc));
              end
              else
              begin
                vValorIcms[vQuantAliqIcms] := vValorIcms[vQuantAliqIcms] + (vest * (vprC * vAcresDesc));
                vvalortotal := vvalortotal + (vest * (vprC * vAcresDesc));
              end;
            end
            else
            begin
              vValorIcms[vQuantAliqIcms] := vValorIcms[vQuantAliqIcms] + (vest * vprC);
              vvalortotal := vvalortotal + (vest * vprC);
            end;
          end
          else
          begin
            for I := 1 to vQuantAliqIcms do
            begin
             if qrBuscaProd.FieldByName('ICM_PROD').AsString = vDadosIni.getCampoPipe(vAliqIcms,I) then
             begin
               if vAcresDesc <> 0 then
               begin
                 if vDivisao then
                 begin
                   vValorIcms[I] := vValorIcms[I] + (vest * (vprC / vAcresDesc));
                   vvalortotal := vvalortotal + (vest * (vprC / vAcresDesc));
                 end
                 else
                 begin
                   vValorIcms[I] := vValorIcms[I] + (vest * (vprC * vAcresDesc));
                   vvalortotal := vvalortotal + (vest * (vprC * vAcresDesc));
                 end;
               end
               else
               begin
                 vValorIcms[I] := vValorIcms[I] + (vest * vprC);
                 vvalortotal := vvalortotal + (vest * vprC);
               end;
               break;
             end;
            end;
          end;
      end;


//    if vest > 0 then
    if vDadosIni.StrToFloatFormat(vest, 3) > 0.000 then
    begin
      if ExibirPosse then
      begin
        if(PosseAtualCab <> qrBuscaProd.FieldByName('codigo_posse').AsInteger) then
        begin
          SomaPosse     := 0;
          PosseAtualCab := qrBuscaProd.FieldByName('codigo_posse').AsInteger;
          strTemp := IfThen(PosseAtualCab = 0, '0 - Estoque de propriedade do informante e em seu poder') +
                             IfThen(PosseAtualCab = 1, '1 - Estoque de propriedade do informante em posse de terceiros') +
                             IfThen(PosseAtualCab = 2, '2 - Estoque de propriedade de terceiros em posse do informante');
          if vTipoCabecalho = 'Geral' then
            Rdp.ImpF(linha, 2, strTemp, [comp20])
          else
            Rdp.ImpF(linha, 2, strTemp, [comp12]);
          linha := linha + 1;
        end;
        if vDivisao then
          SomaPosse := SomaPosse + (vest * (vprC / IfThen(vAcresDesc > 0, vAcresDesc, 1)))
        else
          SomaPosse := SomaPosse + (vest * (vprC * IfThen(vAcresDesc > 0, vAcresDesc, 1)));
      end;

      if vTipoCabecalho = 'Geral' then
      begin
        Rdp.imp(linha, 2, qrBuscaProd.FieldByName('GRUPO_PROD').asstring);
        Rdp.imp(linha, 5, qrBuscaProd.FieldByName('COD_PROD').AsString);
        Rdp.imp(linha, 20, copy(qrBuscaProd.FieldByName('DESCR_PROD').asstring, 1, 38));
        Rdp.impD(linha, 72, format('%18.3f', [vest]),[comp17]);

        if vAcresDesc <> 0 then
        begin
          if vDivisao then
          begin
            rdp.impd(linha, 87, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [(vprC / vAcresDesc)])), [comp17]);
            rdp.impd(linha, 102, StrNumber(vest * (vprC / vAcresDesc)), [comp17]);
          end
          else
          begin
            rdp.impd(linha, 87, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [(vprC * vAcresDesc)])), [comp17]);
            rdp.impd(linha, 102, StrNumber(vest * (vprC * vAcresDesc)), [comp17]);
          end;
        end
        else
        begin
          rdp.impd(linha, 87, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vprC])), [comp17]);
          rdp.impd(linha, 102, StrNumber(vest * vprC), [comp17]);
        end;

        Rdp.imp(linha, 105, qrBuscaProd.FieldByName('UNIDADE').asstring);
        Rdp.imp(linha, 110, qrBuscaProd.FieldByName('NUM_FAB_PROD').asstring);
        linha := linha + 1;
        vqtdg := vqtdg + vest;
        vqtdger := vqtdger + vest;
        if vAcresDesc <> 0 then
        begin
          if vDivisao then
          begin
            vtotger := vtotger + (vest * (vprC / vAcresDesc));
            vtotgert := vtotgert + (vest * (vprC / vAcresDesc));
          end
          else
          begin
            vtotger := vtotger + (vest * (vprC * vAcresDesc));
            vtotgert := vtotgert + (vest * (vprC * vAcresDesc));
          end;
        end
        else
        begin
          vtotger := vtotger + (vest * vprC);
          vtotgert := vtotgert + (vest * vprC);
        end;
      end
      else
      begin
       // Inserir linhas no Relatório
       IncLinhaRel;

        if qrBuscaProd.FieldByName('DESCR_PROD').asstring <> '' then
          rdp.imp(linha, 11, copy(qrBuscaProd.FieldByName('DESCR_PROD').asstring, 1, 38))
        else
          rdp.imp(linha, 11, copy(vdescprod, 1, 38));
        rdp.imp(linha, 02, copy(qrBuscaProd.FieldByName('NBM').asstring, 1, 8));
        rdp.imp(linha, 51, qrBuscaProd.FieldByName('UNIDADE').asstring);
        Rdp.impD(linha, 65, trim(format('%16.3f', [vest])),[]);
//        rdp.imp(linha, 54, vDadosIni.alndir(floattostr(vest), 4));

        dVrEstoque := vprC * vest;
        if vAcresDesc <> 0 then
          dVrEstoque := IfThen(vDivisao, dVrEstoque / vAcresDesc, dVrEstoque * vAcresDesc);

        dVrUnEst := dVrEstoque / vest;
        dIcms    := dVrEstoque * vTempAliqICMS / 100;

        itemFiscal.vicms := dIcms;
        itemFiscal.valor := dVrEstoque;

        dBcPisCofins  := conf_pc.getBC(ttPISCOFINS, itemFiscal, 0, -10); // Esse metodo usa a confi que diminui o icms de BCPISCOFINS se necessario

        dPis    := dBcPisCofins * vTempAliqPIS    / 100;
        dCofins := dBcPisCofins * vTempAliqCOFINS / 100;
        {
        if vAcresDesc <> 0 then
        begin
          if vDivisao then
          begin
            Rdp.impD(linha, 77, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [(vprC / vAcresDesc)])), []);

            if vTipoCabecalho <> 'Contábil2' then
              Rdp.impD(linha, 89, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * (vprC / vAcresDesc)])), [])
            else
             Rdp.impD(linha, 90, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * (vprC / vAcresDesc)])), []);

            if vTipoCabecalho = 'Contábil2' then
            begin
             Rdp.impD(linha, 115, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqICMS * (vprC / vAcresDesc))/100)])), []);
             Rdp.impD(linha, 128, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqPIS * (vprC / vAcresDesc))/100)])), []);
             Rdp.impD(linha, 141, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqCOFINS * (vprC / vAcresDesc))/100)])), []);
            end;
            grava_tipo74(vest, (vprC / vAcresDesc), qrBuscaProd.FieldByName('codigo_posse').AsInteger, qrBuscaProd.FieldByName('GRUPO_PROD').asinteger, qrBuscaProd.FieldByName('COD_PROD').AsString,
            (vest * ((vTempAliqICMS * (vprC / vAcresDesc))/100)), (vest * ((vTempAliqPIS * (vprC / vAcresDesc))/100)), (vest * ((vTempAliqCOFINS * (vprC / vAcresDesc))/100)));
          end
          else
          begin
            Rdp.impD(linha, 77, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [(vprC * vAcresDesc)])), []);
            if vTipoCabecalho <> 'Contábil2' then
             Rdp.impD(linha, 89, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * (vprC * vAcresDesc)])), [])
            else
             Rdp.impD(linha, 90, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * (vprC * vAcresDesc)])), []);
            if vTipoCabecalho = 'Contábil2' then
            begin
             Rdp.impD(linha, 115, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqICMS * (vprC * vAcresDesc))/100)])), []);
             Rdp.impD(linha, 128, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqPIS * (vprC * vAcresDesc))/100)])), []);
             Rdp.impD(linha, 141, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqCOFINS * (vprC * vAcresDesc))/100)])), []);
            end;
            grava_tipo74(vest, (vprC * vAcresDesc), qrBuscaProd.FieldByName('codigo_posse').AsInteger, qrBuscaProd.FieldByName('GRUPO_PROD').asinteger, qrBuscaProd.FieldByName('COD_PROD').AsString,
            (vest * ((vTempAliqICMS * (vprC * vAcresDesc))/100)), (vest * ((vTempAliqPIS * (vprC * vAcresDesc))/100)), (vest * ((vTempAliqCOFINS * (vprC * vAcresDesc))/100)));
          end;
        end
        else
        begin
          Rdp.impD(linha, 77, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vprC])), []);
          if vTipoCabecalho <> 'Contábil2' then
           Rdp.impD(linha, 89, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * vprC])), [])
          else
           Rdp.impD(linha, 90, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * vprC])), []);

          if vTipoCabecalho = 'Contábil2' then
          begin
           Rdp.impD(linha, 115, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqICMS * vprC)/100)])), []);
           Rdp.impD(linha, 128, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqPIS * vprC)/100)])), []);
           Rdp.impD(linha, 141, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vest * ((vTempAliqCOFINS * vprC)/100)])), []);
          end;
          grava_tipo74(vest, vprC, qrBuscaProd.FieldByName('codigo_posse').AsInteger, qrBuscaProd.FieldByName('GRUPO_PROD').asinteger, qrBuscaProd.FieldByName('COD_PROD').AsString,
          (vest * ((vTempAliqICMS * vprC)/100)), (vest * ((vTempAliqPIS * vprC)/100)), (vest * ((vTempAliqCOFINS * vprC)/100)));
        end;
        }
        Rdp.impD(linha, 77, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [dVrUnEst])), []);
        if vTipoCabecalho <> 'Contábil2' then
         Rdp.impD(linha, 89, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [dVrEstoque])), [])
        else
         Rdp.impD(linha, 90, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [dVrEstoque])), []);

        if vTipoCabecalho = 'Contábil2' then
        begin
          Rdp.impD(linha, 115, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [dIcms  ])), []);
          Rdp.impD(linha, 128, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [dPis   ])), []);
          Rdp.impD(linha, 141, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [dCofins])), []);
        end;
        grava_tipo74(vest, dVrUnEst, qrBuscaProd.FieldByName('codigo_posse').AsInteger, qrBuscaProd.FieldByName('GRUPO_PROD').asinteger, qrBuscaProd.FieldByName('COD_PROD').AsString,
          dIcms, dPis, dCofins);

        linha := linha + 1;

        if vGravaTipo74 and (vTipoCabecalho <> 'Geral') then
          for K := 0 to ItensInv.Count - 1 do with ItensInv.Items[K] do
            if (grupo_prod = qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger) and
               (cod_prod = Trim(qrBuscaProd.FieldByName('COD_PROD').AsString)) then
            begin
              ItensInv.Delete(K);
              Break;
            end;
        {
        if vAcresDesc <> 0 then
        begin
          if vDivisao then
          begin
            vtotger := vtotger + (vest * (vprC / vAcresDesc));
            vtotgert := vtotgert + (vest * (vprC / vAcresDesc));
            vtoticms := vtoticms + (vest * ((vTempAliqICMS * (vprC / vAcresDesc))/100));
            vtotpis :=  vtotpis + (vest * ((vTempAliqPIS * (vprC / vAcresDesc))/100));
            vtotcofins := vtotcofins + (vest * ((vTempAliqCOFINS * (vprC / vAcresDesc))/100));

            if (qrBuscaProd.FieldByName('ICM_PROD').AsFloat <= 0) then
            begin
              if (qrBuscaProd.FieldByName('ISENTO_PROD').AsString = 'S') then
                vtotisento := vtotisento + (vest * (vprC / vAcresDesc))
              else if (qrBuscaProd.FieldByName('N_INCIDENCIA_PROD').AsString = 'S') then
                vtotnincidencia := vtotnincidencia + (vest * (vprC / vAcresDesc))
              else
                vtotst := vtotst + (vest * (vprC / vAcresDesc));
              vvalortotal :=  vvalortotal + (vest * (vprC / vAcresDesc));
            end;
          end
          else
          begin
            vtotger := vtotger + (vest * (vprC * vAcresDesc));
            vtotgert := vtotgert + (vest * (vprC * vAcresDesc));
            vtoticms := vtoticms + (vest * ((vTempAliqICMS * (vprC * vAcresDesc))/100));
            vtotpis := vtotpis + (vest * ((vTempAliqPIS * (vprC * vAcresDesc))/100));
            vtotcofins := vtotcofins + (vest * ((vTempAliqCOFINS* (vprC * vAcresDesc))/100));

            if (qrBuscaProd.FieldByName('ICM_PROD').AsFloat <= 0) then
            begin
              if (qrBuscaProd.FieldByName('ISENTO_PROD').AsString = 'S') then
                vtotisento := vtotisento + (vest * (vprC * vAcresDesc))
              else if (qrBuscaProd.FieldByName('N_INCIDENCIA_PROD').AsString = 'S') then
                vtotnincidencia := vtotnincidencia + (vest * (vprC * vAcresDesc))
              else
                vtotst := vtotst + (vest * (vprC * vAcresDesc));
              vvalortotal :=  vvalortotal + (vest * (vprC * vAcresDesc));
            end;
          end;
        end
        else
        begin
          vtotger := vtotger + (vest * vprC);
          vtotgert := vtotgert + (vest * vprC);
          vtoticms := vtoticms + (vest * ((vTempAliqICMS * vprC)/100));
          vtotpis := vtotpis + (vest * ((vTempAliqPIS * vprC)/100));
          vtotcofins := vtotcofins + (vest * ((vTempAliqCOFINS * vprC)/100));

          if (qrBuscaProd.FieldByName('ICM_PROD').AsFloat <= 0) then
          begin
            if (qrBuscaProd.FieldByName('ISENTO_PROD').AsString = 'S') then
              vtotisento := vtotisento + (vest * vprC)
            else if (qrBuscaProd.FieldByName('N_INCIDENCIA_PROD').AsString = 'S') then
              vtotnincidencia := vtotnincidencia + (vest * vprC)
            else
              vtotst := vtotst + (vest * vprC);
            vvalortotal :=  vvalortotal + (vest * vprC);
          end;
        end;
        }

        vtotger := vtotger + (dVrEstoque);
        vtotgert := vtotgert + (dVrEstoque);
        vtoticms := vtoticms + (dIcms);
        vtotpis := vtotpis + (dPis);
        vtotcofins := vtotcofins + (dCofins);

        if (qrBuscaProd.FieldByName('ICM_PROD').AsFloat <= 0) then
        begin
          if (qrBuscaProd.FieldByName('ISENTO_PROD').AsString = 'S') then
            vtotisento := vtotisento + (dVrEstoque)
          else if (qrBuscaProd.FieldByName('N_INCIDENCIA_PROD').AsString = 'S') then
            vtotnincidencia := vtotnincidencia + (dVrEstoque)
          else
            vtotst := vtotst + (dVrEstoque);
          vvalortotal :=  vvalortotal + (dVrEstoque);
        end;

        vqtdg := vqtdg + vest;
        vqtdger := vqtdger + vest;
      end;
    end;
    if linha >= 59 then
    begin
      linha := linha + 1;
      if vTipoCabecalho = 'Geral' then
      begin
        Rdp.impF(linha, 1, vDadosIni.replicate('=', 130), [comp17]);
        linha := linha + 1;
        Rdp.imp(linha, 60, 'A TRANSPORTAR....');
        Rdp.impD(linha, 102, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotgert])), [comp17]);
        linha := linha + 1;
      end
      else if vTipoCabecalho = 'Contábil' then
      begin
        Rdp.imp(linha, 47, 'A TRANSPORTAR...');
        Rdp.impD(linha, 89, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotgert])),[negrito]);
        linha := linha + 1;
      end
      else if vTipoCabecalho = 'Contábil2' then
      begin
        Rdp.imp(linha, 16, 'A TRANSPORTAR...');
        Rdp.impD(linha, 102, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotgert])),[negrito]);
        linha := linha + 1;
      end;
      linha := 1;
      Rdp.novapagina;
      novaPaginaPrint;
    end;
    lb.Caption := 'Item: ' + vDadosIni.StrZero(vitem, 6) + vDadosIni.Space(10) + 'Produto: ' + trim(qrBuscaProd.FieldByName('NUM_FAB_PROD').asstring) + vDadosIni.Space(10) + 'Total :' + inttostr(ProgressBar.Max);
    //    lb.Refresh;
    if Parar then
    begin
      ProgressBar.Position := 0;
      lb.Caption := '0';
      parar := false;
      RollBackTransacao;
      exit;
    end;
    ProgressBar.Position := ProgressBar.Position + 1;

    qrBuscaProd.next;
    vitem := vitem + 1;

    if (vDadosIni.StrToFloatFormat(vest, 3) > 0.000) and (ExibirPosse) then
      if(PosseAtualCab <> qrBuscaProd.FieldByName('codigo_posse').AsInteger) or (qrBuscaProd.Eof) then
      begin
        strTemp := 'Total estoque de ' + IfThen(PosseAtualCab = 0, 'propriedade do informante e em seu poder') +
                                         IfThen(PosseAtualCab = 1, 'propriedade do informante em posse de terceiros') +
                                         IfThen(PosseAtualCab = 2, 'propriedade de terceiros em posse do informante');
        if vTipoCabecalho = 'Geral' then
          Rdp.ImpF(linha, 9, strTemp, [comp20])
        else
          Rdp.ImpF(linha, 9, strTemp, [comp12]);
        Rdp.impD(linha, IfThen(vTipoCabecalho = 'Contábil', 89, 102), StrNumber(SomaPosse), [negrito]);
        linha := linha + 2;
      end;

    if vTipoCabecalho = 'Geral' then
    begin
      if (qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger <> vgrup) or (qrBuscaProd.eof) then
      begin
        // o checkbox7 é so no caso de ordenar pela descrição=OrdemCresDescricaoProd
        if not vOrdemCresDescricaoProd then
        begin
          linha := linha + 1;
          Rdp.imp(linha, 1, 'TOTAL QUANTIDADE/CUSTO DO GRUPO: ' + inttostr(vgrup));
          Rdp.impD(linha, 102, format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotger]), [comp17]);

          if vTotalPorGrupo then
          begin
            Rdp.impD(linha, 72, 'QUANTIDADE: ' + trim(format('%18.3n' , [vqtdg])), [comp17]);
            vqtdg := 0;
          end;
          vtotger := 0.00;
          vgrup := qrBuscaProd.FieldByName('GRUPO_PROD').Asinteger;
          linha := linha + 1;
        end;
      end
      else
      begin
        if (qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger <> vgrup) or (qrBuscaProd.eof) then
        begin
          linha := linha + 1;
          Rdp.imp(linha, 1, 'TOTAL GRUPO:');
          Rdp.impD(linha, 69, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotger])), [comp20]);
          vtotger := 0.00;
          vgrup := qrBuscaProd.FieldByName('GRUPO_PROD').Asinteger;
          linha := linha + 1;
        end;
      end;
    end;
  end;
  qrBuscaProd.close;

  //removendo itens gravados anteriormente no inventário que não foram encontrados
  if vGravaTipo74 and (vTipoCabecalho <> 'Geral') then
  begin
    for K := 0 to ItensInv.Count - 1 do with ItensInv.Items[K] do
      SqlExec(ItensInv.Items[K].SQLMotor().SQLDelete);
    ItensInv.Clear;
    ItensInv.Free;
  end;

  CommitaTransacao;
  if vTipoCabecalho = 'Contábil' then
    linha := linha + 1;
  if vTipoCabecalho = 'Geral' then
  begin
    Rdp.imp(linha, 1, vDadosIni.replicate('=', 130));
    linha := linha + 1;
    Rdp.imp(linha, 1, 'TOTAL DE ESTOQUE EM ' + vDataReferencia);
    Rdp.impD(linha, 72, trim(format('%18.3n' , [vqtdger])), [comp17]);
    Rdp.impD(linha, 102, trim(format('%n', [vtotgert])), [comp17]);
  end
  else
  begin
    if vTipoCabecalho = 'Contábil' then
      Rdp.imp(linha, 1, vDadosIni.replicate('-', 90))
    else if vTipoCabecalho = 'Contábil2' then
    begin
     IncLinhaRel;
     linha := linha + 1;
     IncLinhaRel;
     rdp.imp(linha, 11, 'TOTAL GERAL');
     Rdp.impD(linha, 103,  trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vvalortotal])), []);
     Rdp.impD(linha, 115, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtoticms])), []);
     Rdp.impD(linha, 128, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotpis])), []);
     Rdp.impD(linha, 141, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotcofins])), []);
     linha := linha + 1;
     IncLinhaRel;
     linha := linha + 1;
     IncLinhaRel;
     rdp.imp(linha, 11, '****************RESUMO*****************');
     linha := linha + 1;
     IncLinhaRel;

     sAliqIcms.Sort;
     for J := 0 to sAliqIcms.Count - 1 do
     begin
        for I := 1 to vQuantAliqIcms do
        begin
          if sAliqIcms[J] = vDadosIni.getCampoPipe(vAliqIcms,I) then
          begin
            rdp.imp(linha, 11, 'MERCADORIA P/REVENDA ' + vDadosIni.getCampoPipe(vAliqIcms,I) + '%');
            Rdp.impD(linha, 103, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vValorIcms[I]])), []);
            linha := linha + 1;
            IncLinhaRel;
            break;
          end;
        end;
     end;

     if vtotisento > 0 then
     begin
       rdp.imp(linha, 11, 'MERCADORIA P/REVENDA ISENTO');
       Rdp.impD(linha, 103, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotisento])), []);
       linha := linha + 1;
       IncLinhaRel;
     end;
     if vtotnincidencia > 0 then
     begin
       rdp.imp(linha,   11, 'MERCADORIA P/REVENDA N.INCIDENCIA');
       Rdp.impD(linha, 103, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotnincidencia])), []);
       linha := linha + 1;
       IncLinhaRel;
     end;
     if vtotst > 0 then
     begin
       rdp.imp(linha,  11, 'MERCADORIA P/REVENDA ST');
       Rdp.impD(linha, 103, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotst])), []);
       linha := linha + 1;
       IncLinhaRel;
     end;
     rdp.imp(linha,   11, 'TOTAL');
     Rdp.impD(linha, 103, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vvalortotal])), []);
     linha := linha + 1;
     IncLinhaRel;
     rdp.imp(linha,   11, 'Total do ICMS recuperavel (-)');
     Rdp.impD(linha, 103, '(' + trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtoticms])) + ')', []);
     linha := linha + 1;
     IncLinhaRel;
     rdp.imp(linha,   11, 'Total do Pis-Pasep nao cumulativo (-)');
     Rdp.impD(linha, 103, '(' + trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotpis])) + ')', []);
     linha := linha + 1;
     IncLinhaRel;
     rdp.imp(linha,   11, 'Total da COFINS    nao cumulativo (-)');
     Rdp.impD(linha, 103, '(' + trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotcofins])) + ')', []);
     linha := linha + 1;
     IncLinhaRel;
     rdp.imp(linha, 11, 'Total do Estoque p/ fins do Imp. Renda');
     Rdp.impD(linha, 103, trim(format('%16.' + IntToStr(NumeroCasasDecimais) + 'n', [vvalortotal - (vtoticms + vtotpis + vtotcofins)])), []);
     linha := linha + 1;
     IncLinhaRel;
     linha := linha + 1;
    end;
    if vTipoCabecalho = 'Contábil' then
      Rdp.imp(linha, 1, vDadosIni.replicate('-', 142))
    else if vTipoCabecalho = 'Contábil2' then
    begin
     Rdp.imp(linha, 1, '+');
     Rdp.imp(linha, 2, vDadosIni.replicate('-', 139));
     Rdp.imp(linha, 142, '+');
    end;
      linha := linha + 1;
      Rdp.imp(linha, 1, 'TOTAL DE ESTOQUE EM ' + vDataReferencia);
      Rdp.impD(linha, 65, trim(format('%n', [vtotgert])), [negrito]);
  end;
  linha := linha + 1;

  //Limita-se a quebra de apenas uma linha
  try
    NumeroParaExtenso := vDadosIni.NumeroParaExtenso(vtotgert);
  except
  	on E: ERangeError do
    begin
      ShowErro('Erro de conversão do valor do inventário por extenso. Não foi possivel converter');
      NumeroParaExtenso := Format('%n', [vtotgert]);
    end;
  end;

  if Length(NumeroParaExtenso) > rdp.TamanhoQteColunas - 2 then
  begin
    strTemp := copy(NumeroParaExtenso, 1, rdp.TamanhoQteColunas);
    for I := rdp.TamanhoQteColunas downto 1 do
    begin
      if strtemp[i] = ' ' then
      begin
        Rdp.Imp(linha, 1, '(' + copy(strTemp, 1, i));
        linha := linha + 1;
        Rdp.Imp(linha, 1, copy(NumeroParaExtenso, i, Length(NumeroParaExtenso)) + ')');
        break;
      end;
    end;
  end
  else
    Rdp.Imp(linha, 1, '(' + NumeroParaExtenso + ')');

  conf_pc.Free;

  linha := linha + 2;
  Rdp.Imp(linha, 1, trim(CIDADEEMP) + ', ' +
    vDadosIni.DataPorExtenso(strtodate(vDataReferencia)) + '.');
  if vEnviarPara = 'Texto' then
    Rdp.GerarTXT('C:\invent.txt');
  if vEnviarPara = 'Formatado' then
    Rdp.GerarPRN('C:\invent.PRN');
  if vEnviarPara = 'RDP' then
    Rdp.GerarRDP('C:\invent.RDP');

  vDadosIni.Auditoria('PRO335', 'IMPRIMIR', 'SUCESSO - ' +
  	' INV: ' + UpperCase(trim(vTipoCabecalho)) +
  	' REF: ' + FormatDateTime('dd/mm/yyyy', strtodate(vDataReferencia)) +
    ' EMISSAO: ' + FormatDateTime('dd/mm/yyyy', Date) +
    ' VL: ' + trim(vDadosIni.Alndir(format('%n', [vtotgert]), 18)), 'PRODUTOS', '');

  Rdp.fechar;
  buscas.close;
  ProgressBar.Position := 0;
  lb.Caption := '0';

  except
  	on E: Exception do
    begin
      vDadosIni.registraErro('TInventario.imprimirInventario Erro: ' + e.Message);
      if ShowConfirmacao('Erro ao gerar inventário. Ver erro?') = IDYES then
        ShowErro(e.Message)
    end;
  end;
end;

procedure TInventario.novaPaginaPrint;
begin
  if vTipoCabecalho = 'Geral' then
  begin
    Rdp.impF(linha, 1, vDadosIni.Replicate('*', 132), [comp17]);
    linha := linha + 1;
    Rdp.impF(linha, 1, '*', [normal, negrito]);
    Rdp.impF(linha, 54, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
    Rdp.impF(linha, 132, '*', [normal, negrito]);
    linha := linha + 1;
    Rdp.impF(linha, 1, '*', [normal, negrito]);
    Rdp.impF(linha, 132, '*', [normal, negrito]);
    linha := linha + 1;
    Rdp.impF(linha, 1, '*', [normal, negrito]);
    Rdp.impF(linha, 10, IE, [normal, negrito]);
    Rdp.impF(linha, 70, CPFCNPJ, [normal, negrito]);
    Rdp.impF(linha, 132, '*', [normal, negrito]);
    linha := linha + 1;
    Rdp.impF(linha, 1, '*', [normal, negrito]);
    Rdp.impF(linha, 132, '*', [normal, negrito]);
    linha := linha + 1;
    Rdp.impF(linha, 1, '*', [normal, negrito]);
    Rdp.impF(linha, 4, datetostr(date), [normal, negrito]);
    vPaginaIni := vPaginaIni + 1;
    Rdp.impF(linha, 110, 'PAG: ' + vDadosIni.strzero(vPaginaIni, 4), [normal, negrito]);
    Rdp.impF(linha, 132, '*', [normal, negrito]);
    linha := linha + 1;
    Rdp.impF(linha, 1, '*', [normal, negrito]);
    Rdp.impF(linha, 1, vDadosIni.replicate('*', 25) + 'ESTOQUE EXISTENTE EM ' + vDataReferencia + vDadosIni.Replicate('*', 21), [normal, negrito]);
    //  linha:=linha+2;
    //  Rdp.impF(linha,1,replicate('=',130),[comp17]);
    linha := linha + 2;
    Rdp.impF(linha, 2, 'CODIGO', [comp17]);
    Rdp.impF(linha, 20, 'DENOMINACAO', [comp17]);
    Rdp.impD(linha, 72, 'ESTOQUE', [comp17]);
    Rdp.impD(linha, 87, 'CUSTO UNITARIO', [comp17]);
    Rdp.impD(linha, 103, 'PRECO TOTAL', [comp17]);
    Rdp.impF(linha, 105, 'UN', [comp17]);
    Rdp.impF(linha, 110, 'N.FABR', [comp17]);
    linha := linha + 1;
    Rdp.impF(linha, 1, vDadosIni.replicate('=', 130), [comp17]);
    linha := linha + 1;
    Rdp.imp(linha, 65, 'TRANSPORTE.....');
    Rdp.impD(linha, 102, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotgert])), [comp17]);
    linha := linha + 1;
  end
  else if vTipoCabecalho = 'Contábil' then
  begin
    Rdp.imp(linha, 1, '+' + vDadosIni.replicate('-', 89) + '+');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 30, 'REGISTRO DE INVENTARIO');
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 01, '|');
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '| FIRMA: ' + vDadosIni.vEmp.vnomeEmpresa);
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 01, '|');
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '| INSC EST.: ' + IE);
    Rdp.imp(linha, 50, '| CGC(MF): ' + CPFCNPJ);
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 01, '|');
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '| FOLHA: ');
    vPaginaIni := vPaginaIni + 1;
    Rdp.imp(linha, 10, vDadosIni.strzero(vPaginaIni, 4));
    Rdp.imp(linha, 33, 'ESTOQUE EXISTENTE EM:');
    Rdp.imp(linha, 55, vDataReferencia);
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '+' + vDadosIni.replicate('-', 89) + '+');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 10, '|');
    Rdp.imp(linha, 50, '|   |           |');
    Rdp.imp(linha, 72, 'VALORES');
    Rdp.imp(linha, 91, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 3, 'CLASS.');
    Rdp.imp(linha, 10, '|');
    Rdp.imp(linha, 22, 'D I S C R I M I N A C A O');
    Rdp.imp(linha, 50, '|UN |   QTDE    |------------------------|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 3, 'FISCAL');
    Rdp.imp(linha, 10, '|');
    //  Rdp.imp(linha,8,'FISCAL');
    Rdp.imp(linha, 50, '|   |           | UNITARIO  |    TOTAL   |');
    linha := linha + 1;
    Rdp.imp(linha, 1, '+' + vDadosIni.replicate('-', 89) + '+');
    linha := linha + 1;
    Rdp.imp(linha, 47, 'TRANSPORTE.....');
    Rdp.impD(linha, 90, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotgert])), [negrito]);
    linha := linha + 1;
  end
  else if vTipoCabecalho = 'Contábil2' then
  begin
    Rdp.imp(linha, 1, '+' + vDadosIni.replicate('-', 140) + '+');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 60, 'REGISTRO DE INVENTARIO');
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 01, '|');
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '| FIRMA: ' + vDadosIni.vEmp.vnomeEmpresa);
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 01, '|');
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '| INSC EST.: ' + IE);
    Rdp.imp(linha, 66, '| CGC(MF): ' + CPFCNPJ);
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 01, '|');
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '| FOLHA: ');
    vPaginaIni := vPaginaIni + 1;
    Rdp.imp(linha, 10, vDadosIni.strzero(vPaginaIni, 4));
    Rdp.imp(linha, 58, 'ESTOQUE EXISTENTE EM:');
    Rdp.imp(linha, 86, vDataReferencia);
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '+' + vDadosIni.replicate('-', 140) + '+');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 10, '|');
    Rdp.imp(linha, 50, '|   |           |');
    Rdp.imp(linha, 82, 'VALORES');
    Rdp.imp(linha, 104, '|');
    Rdp.imp(linha, 117, 'OBSERVACOES');
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 3, 'CLASS.');
    Rdp.imp(linha, 10, '|');
    Rdp.imp(linha, 22, 'DISCRIMINACAO');
    Rdp.imp(linha, 50, '|UN |   QTDE    |---------------------------------------------------------------------------|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 3, 'FISCAL');
    Rdp.imp(linha, 10, '|');
    Rdp.imp(linha, 50, '|   |           | UNITARIO  |   PARCIAL  |    TOTAL   |   ICMS    | PIS/PASEP  |   COFINS   |');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 10, '|');
    Rdp.imp(linha, 50, '|   |           |           |            |            |RECUPERAVEL|NAO CUMULATI|NAO CUMULATI|');
    linha := linha + 1;
    Rdp.imp(linha, 1, '+' + vDadosIni.replicate('-', 140) + '+');
    linha := linha + 1;
    Rdp.imp(linha, 1, '|');
    Rdp.imp(linha, 10, '|');
    Rdp.imp(linha, 16, 'TRANSPORTE.....');
    Rdp.imp(linha, 50, '|');
    Rdp.imp(linha, 54, '|');
    Rdp.imp(linha, 66, '|');
    Rdp.imp(linha, 78, '|');
    Rdp.imp(linha, 91, '|');
    Rdp.impD(linha, 103, trim(format('%18.' + IntToStr(NumeroCasasDecimais) + 'n', [vtotgert])), [normal]);
    Rdp.imp(linha, 104, '|');
    Rdp.imp(linha, 116, '|');
    Rdp.imp(linha, 129, '|');
    Rdp.imp(linha, 142, '|');
    linha := linha + 1;
  end;
end;

function TInventario.retornaQtdeEmEstoque(DataReferencia: string;
  GrupoProd: integer; CodProd: string): Double;
var
  vqtdg, vEstoque, vQtdItemVnd, qtdItemCompras, qtdItemDevolvido: real;
  qrBuscaProd: TIBQuery;
  strTemp: string;
begin
  if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
  vDataReferencia := DataReferencia;
  qrBuscaProd := TIBQuery(dtmProdutos.qrBuscaInvet);
  vEstoque := 0;

  qrBuscaProd.Close;
  qrBuscaProd.SQL.Text := 'select pr.COD_PROD,pr.GRUPO_PROD,pr.Descr_prod,pr.EST_F, ' +
    ' pr.EST_R,pr.PREC_CUSM_PROD from produtos pr where  pr.cod_empresa = ' + vDadosIni.codEmpresa + ' and pr.ativo=1 ' +
    ' and pr.grupo_prod = ' + IntToStr(GrupoProd) + ' and cod_prod = ' + QuotedStr(CodProd) +
    ' and ((pr.consumo <> ' + quotedstr('S') + ') or (pr.consumo is null)) ' +
    ' and ((((select count(pv.cod_prod) from pedvenda_prod pv ' +
    ' where ((pv.tipo=' + quotedstr('OS') + ' ) or (pv.tipo=' + quotedstr('REQ') + ')) and ' +
    ' pv.grupo_prod = pr.grupo_prod and pv.cod_prod = pr.cod_prod and ' +
    ' pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo=1) >= 1 ) ' +
    ' or ' +
    ' ((select count(it.cod_prod) from item_nf_entrada it where ' +
    ' it.grupo_prod = pr.grupo_prod and it.cod_prod = pr.cod_prod and ' +
    ' it.cod_empresa = ' + vDadosIni.codEmpresa + ' and it.ativo=1) >= 1 ) ' +
    ' or ' +
    ' ((select count(nfit.cod_prod) from notafiscal_item nfit inner join notafiscal nf on ' +
    ' nf.cod_nf=nfit.cod_nf and nf.cod_empresa=nfit.cod_empresa  where nf.natureza_nf=''E'' and ' +
    ' nfit.grupo_prod = pr.grupo_prod and nfit.cod_prod = pr.cod_prod and  ' +
    ' nfit.cod_empresa = ' + vDadosIni.codEmpresa + ' and nfit.ativo=1) >= 1 ) ' +
    ' ) or ((pr.est_f) > 0 and pr.cod_empresa = ' + vDadosIni.codEmpresa + '))';
//    ' ) or ((pr.est_f+pr.est_r) > 0 and pr.cod_empresa = ' + vDadosIni.codEmpresa + '))';
  qrBuscaProd.Open;

  if not qrBuscaProd.IsEmpty then
  begin
    qtdItemCompras := getQtdItensCompra(CodProd, GrupoProd, StrToDate(vDataReferencia));
    vQtdItemVnd := getQtdItensVenda(CodProd, GrupoProd, StrToDate(vDataReferencia));
    qtdItemDevolvido := getQtdItensDevolvidos(CodProd, GrupoProd, StrToDate(vDataReferencia));
    vEstoque := (((qrBuscaProd.FieldByName('EST_F').AsFloat {+ qrBuscaProd.FieldByName('EST_R').AsFloat}) - (qtdItemCompras + qtdItemDevolvido)) + (vQtdItemVnd));
  end
  else
    vEstoque := 0;
  qrBuscaProd.close;
  buscas.close;
  CommitaTransacao;
  result := vEstoque;
end;

function TInventario.RetornaValorEst(DataReferencia: string; Divisao: boolean;
  AcresDesc: real): Currency;
var
  vqtdg, vest, vQtdItemVnd, qtdItemCompras, qtdItemDevolvido: real;
  vgrup: integer;
  vitem, i: integer;
  vprC: currency;
  qrBuscaProd: TIBQuery;
  strTemp: string;
begin
  vDataReferencia := DataReferencia;
  vDivisao := Divisao;
  vAcresDesc := AcresDesc;
  qrBuscaProd := TIBQuery(dtmProdutos.qrBuscaInvet);
  vtotger := 0.00;
  vtotgert := 0.00;
  vitem := 1;
  vest := 0.00;
  vqtdg := 0;
  //  lb.Caption := 'Abrindo Bases de Produtos...';

  qrBuscaProd.Close;
  qrBuscaProd.SQL.Text := 'select pr.COD_PROD,pr.GRUPO_PROD,pr.Descr_prod,pr.EST_F, ' +
    ' pr.EST_R,pr.PREC_CUSM_PROD from produtos pr where  pr.cod_empresa = ' + vDadosIni.codEmpresa + ' and pr.ativo=1 ' +
    ' and ((pr.consumo <> ' + quotedstr('S') + ') or (pr.consumo is null)) ' +
    ' and ((((select count(pv.cod_prod) from pedvenda_prod pv ' +
    ' where ((pv.tipo=' + quotedstr('OS') + ' ) or (pv.tipo=' + quotedstr('REQ') + ')) and ' +
    ' pv.grupo_prod = pr.grupo_prod and pv.cod_prod = pr.cod_prod and ' +
    ' pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo=1) >= 1 ) ' +
    ' or ' +
    ' ((select count(it.cod_prod) from item_nf_entrada it where ' +
    ' it.grupo_prod = pr.grupo_prod and it.cod_prod = pr.cod_prod and ' +
    ' it.cod_empresa = ' + vDadosIni.codEmpresa + ' and it.ativo=1) >= 1 ) ' +
    ' or ' +
    ' ((select count(nfit.cod_prod) from notafiscal_item nfit inner join notafiscal nf on ' +
    ' nf.cod_nf=nfit.cod_nf and nf.cod_empresa=nfit.cod_empresa  where nf.natureza_nf=''E'' and ' +
    ' nfit.grupo_prod = pr.grupo_prod and nfit.cod_prod = pr.cod_prod and  ' +
    ' nfit.cod_empresa = ' + vDadosIni.codEmpresa + ' and nfit.ativo=1) >= 1 ) ' +
    ' ) or ((pr.est_f) > 0 and pr.cod_empresa = ' + vDadosIni.codEmpresa + '))';
//    ' ) or ((pr.est_f+pr.est_r) > 0 and pr.cod_empresa = ' + vDadosIni.codEmpresa + '))';

  if (vOrdemCresDescricaoProd) and (vTipoCabecalho = 'Geral') then
    qrBuscaProd.sql.Text := qrBuscaProd.sql.Text + ' order by pr.Descr_prod'
  else
    qrBuscaProd.sql.Text := qrBuscaProd.sql.Text + ' order by pr.grupo_prod,pr.Descr_prod';
  qrBuscaProd.Open;

  while not qrBuscaProd.eof do
  begin
    Application.processMessages;
    if strtodate(vDataReferencia) < date then
    begin
      qtdItemCompras := getQtdItensCompra(trim(qrBuscaProd.FieldByName('COD_PROD').asstring), qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger, strtodate(vDataReferencia));
      vQtdItemVnd := getQtdItensVenda(trim(qrBuscaProd.FieldByName('COD_PROD').asstring), qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger, strtodate(vDataReferencia));
      qtdItemDevolvido := getQtdItensDevolvidos(trim(qrBuscaProd.FieldByName('COD_PROD').asstring), qrBuscaProd.FieldByName('GRUPO_PROD').AsInteger, strtodate(vDataReferencia));
      vest := (((qrBuscaProd.FieldByName('EST_F').AsFloat { + qrBuscaProd.FieldByName('EST_R').AsFloat}) - (qtdItemCompras + qtdItemDevolvido)) + (vQtdItemVnd));

//      if vest > 0 then
      if vDadosIni.StrToFloatFormat(vest, 3) > 0.000 then
      begin
        buscas.Close;
        buscas.SQL.Text := 'SELECT data,valor,prec_cus_med,pr_cusc_prod FROM CUSTOS ' +
          ' WHERE GRUPO_PROD = ' + qrBuscaProd.FieldByName('GRUPO_PROD').asstring +
          ' AND COD_PROD = ' + quotedstr(trim(qrBuscaProd.FieldByName('COD_PROD').asstring)) +
          ' AND DATA < :vdata ' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1 ' +
          ' order by data desc';
        buscas.ParamByName('vData').AsDate := strtodate(vDataReferencia) + 1;
        buscas.Open;
        if buscas.IsEmpty then
          vprC := qrBuscaProd.FieldByName('PREC_CUSM_PROD').asfloat
        else if buscas.FieldByName('PREC_CUS_MED').AsFloat = 0 then
          vprC := buscas.FieldByName('VALOR').AsFloat
        else
          vprC := buscas.FieldByName('PREC_CUS_MED').AsFloat;
      end;
    end
    else
    begin
      vest := (qrBuscaProd.FieldByName('EST_F').AsFloat { + qrBuscaProd.FieldByName('EST_R').AsFloat});
      vprc := qrBuscaProd.FieldByName('PREC_CUSM_PROD').AsFloat;
    end;
//    if vest > 0 then
    if vDadosIni.StrToFloatFormat(vest, 3) > 0.000 then
    begin
      if vAcresDesc <> 0 then
      begin
        if vDivisao then
          vtotgert := vtotgert + (vest * (vprC / vAcresDesc))
        else
          vtotgert := vtotgert + (vest * (vprC * vAcresDesc));
      end
      else
        vtotgert := vtotgert + (vest * vprC);
    end;
    qrBuscaProd.next;
  end;
  qrBuscaProd.close;
  buscas.close;
  CommitaTransacao;
  result := vtotgert;
end;

{ TFichaInventario }

constructor TRelFichaInventario.create;
begin
  transacao := TIBTransaction(DtmProdutos.IBTransProdutos);
  Buscas := TIBQuery(DtmProdutos.qrRelFichaInv);
  rdp := TRDprint.Create(Application);
  rdp.OpcoesPreview.CaptionPreview := 'Ficha de Inventário dos Produtos';
  rdp.CaptionSetup := 'Configurar impressão da Ficha de Inventário';
  rdp.TitulodoRelatorio := 'Ficha de Inventário';
  vDadosIni._LimparVarSendEmail;
  rdp.OnSendMail := vDadosini._SendMailRdPrint;
  rdp.OpcoesPreview.Preview := true;
  rdp.OpcoesPreview.Remalina := true;
  rdp.FonteTamanhoPadrao := S17cpp;
  rdp.TamanhoQteColunas := 132;
  rdp.TamanhoQteLinhas := 66;
  linha := 1;
  vPagina := 1;
  //  crystal := TCrpe.Create(dtmProdutos);
end;

destructor TRelFichaInventario.Destroy;
begin
  buscas.Close;
  inherited;
end;

procedure TRelFichaInventario.novaPaginaPrint;
begin
  if vPagina > 1 then
    Rdp.Novapagina;
  Rdp.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  //  if radiobutton1.Checked then
  //  begin
  Rdp.ImpF(linha, 1, 'FICHA DE INVENTARIO PARA CONFERENCIA DE VENDA', [normal, negrito]);
  linha := linha + 1;
  Rdp.ImpF(linha, 1, 'NO PERIODO DE: ' + dataIni + ' A ' + dataFim, [normal, negrito]);
  linha := linha + 2;
  //  end
  //  else
  //  begin
  //    Rdp.ImpF(linha, 1, 'FICHA DE INVENTARIO', [normal, negrito]);
  //    linha := linha + 2;
  //  end;
  vPagina := vPagina + 1;
  linha := linha + 2;
  Rdp.ImpF(linha, 1, datetostr(date), [normal]);
  Rdp.ImpF(linha, 95, 'PAG: ' + vDadosIni.strzero(vPagina, 3), [normal]);
  linha := linha + 1;
  Rdp.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17]);
  linha := linha + 1;
  Rdp.ImpF(linha, 1, 'ALOCACAO1', [comp17]);
  Rdp.ImpF(linha, 11, 'ALOCACAO2', [comp17]);
  Rdp.ImpF(linha, 21, 'DESCRICAO', [comp17]);
  Rdp.ImpF(linha, 81, 'UN', [comp17]);
  Rdp.ImpF(linha, 85, 'QUANTIDADE', [comp17]);
  Rdp.ImpF(linha, 101, 'EST ATUAL', [comp17]);
  Rdp.ImpF(linha, 112, 'NUM.FABRICACAO', [comp17]);
  linha := linha + 1;
  Rdp.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17]);
  linha := linha + 1;
end;

{ TPecasUltimaCompra }

procedure TPecasUltimaCompra.BandaCabecalhoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  labelNomeEmp.Caption := vDadosIni.vemp.vnomeEmpresa;
end;

procedure TPecasUltimaCompra.bandaDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  temp: string;
  vValorEst: Extended;
  vMedia: TMedia;
begin
  if somenteSelecionado then
    PrintBand := grid.DataSource.DataSet.FieldByName('sel').AsString = 'S';
    //PrintBand := grid.SelectedRows.Current_RowSelected;
  if not PrintBand then
    exit;
  if vDadosIni.vSupermercado <> 'S' then //Checar esta variavel depois...
  begin
    vMedia := TMedia.create;

    vValorEst := vMedia.getQuantidadePendenteReqOS(DtSet.FieldByName('GRUPO_PROD').asinteger, trim(DtSet.FieldByName('COD_PROD').AsString));
    FreeAndNil(vMedia);
//    buscas.close;
//    buscas.sql.text := 'select sum(ipv.quant_ped_item) AS VALOR from pedvenda pv ' +
//      ' inner join pedvenda_prod ipv on ipv.nped = pv.nped' +
//      ' and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo' +
//      ' where ipv.cod_prod = ' + QuotedStr(trim(dtSet.FieldByName('COD_PROD').AsString)) +
//      ' and ipv.grupo_prod = ' + dtSet.FieldByName('GRUPO_PROD').AsString +
//      ' and pv.tipo <> ''ORC'' and (pv.data_fech is null or pv.data_fech < ''01/01/1899'')' +
//      ' and ((ipv.status is null) or (ipv.status <> ''CANCELADO''))' +
//      ' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1';
//    //  temp := FloatToStr(buscas.FieldByName('valor').AsFloat);
//    buscas.Open;
    labelQtdEstoque.Caption := format('%10.2f', [{dtSet.FieldByName('est_r').AsFloat + }dtSet.FieldByName('est_f').AsFloat - vValorEst]);
  end
  else
    labelQtdEstoque.Caption := format('%10.2f', [{dtSet.FieldByName('est_r').AsFloat + }dtSet.FieldByName('est_f').AsFloat]);

  vltotc := vltotc +
    ((({dtSet.FieldByName('Est_R').asfloat + }dtSet.FieldByName('Est_F').AsFloat) -
    (vValorEst)) * dtSet.FieldByName('PREC_CUS_PROD').asfloat);

  vltotr := vltotr +
    ((({dtSet.FieldByName('Est_R').AsFloat + }dtSet.FieldByName('Est_F').AsFloat) -
    (vValorEst)) * dtSet.FieldByName('PREC_CUSR_PROD').asfloat);
  vltovnd := vltovnd + ((({dtSet.FieldByName('Est_R').asfloat + }dtSet.FieldByName('Est_F').asfloat) -
    (vValorEst)) * dtSet.FieldByName('PREC_TAB_PROD').asfloat);

  {  buscas.Close;
    buscas.SQL.Text := 'select first 1 nf.data_lanc_nfe,it.quant_item_nfe from ' +
      ' nf_entrada nf inner join item_nf_entrada it on it.num_nota_nfe = nf.num_nota_nfe ' +
      ' and it.cod_forn_nfe = nf.cod_forn_nfe ' +
      ' where ' +
      ' it.grupo_prod = ' + dtSet.FieldByName('GRUPO_PROD').AsString +
      ' and it.cod_prod = ' + QuotedStr(trim(dtSet.FieldByName('cod_prod').AsString)) +
      ' and nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf.ativo=1 ' +
      ' order by nf.data_lanc_nfe desc';
    buscas.Open;
  }
  buscas.close;
  buscas.SQL.Text := 'select first 1 n.data_lanc,ni.quantidade from ' +
    ' notafiscal n inner join notafiscal_item ni ' +
    ' on n.cod_nf=ni.cod_nf and n.cod_empresa=ni.cod_empresa ' +
    ' where ' +
    ' n.natureza_nf=''E'' and ' +
    ' ni.grupo_prod = ' + dtSet.FieldByName('GRUPO_PROD').AsString +
    ' and ni.cod_prod = ' + QuotedStr(trim(dtSet.FieldByName('cod_prod').AsString)) +
    ' and n.cod_empresa = ' + vDadosIni.codEmpresa + ' and n.ativo=1 ' +
    ' order by n.data_lanc desc';
  buscas.Open;

  labelDataCompra.caption := buscas.FieldByName('DATA_LANC').AsString;
  labelQtdCompra.caption := floattostr(buscas.FieldByName('QUANTIDADE').Asfloat);

  labelAtributos.Caption := dtSet.FieldByName('CLASSE_PROD').AsString +
    '-' + dtSet.FieldByName('CLINV').AsString +
    '-' + dtSet.FieldByName('CLPRECO').AsString +
    '-' + dtSet.FieldByName('CLPOP').AsString +
    '-' + dtSet.FieldByName('CLQTV').AsString +
    '-' + dtSet.FieldByName('CLFRV').AsString +
    '-' + dtSet.FieldByName('CLATL').AsString;
end;

procedure TPecasUltimaCompra.bandaSomatorioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  labelVltotc.Caption := format('%10.2m', [vltotc]);
  labelVltotr.Caption := format('%10.2m', [vltotr]);
  labelVltovnd.Caption := format('%10.2m', [vltovnd]);
end;

constructor TPecasUltimaCompra.create;
begin
  Buscas := TIBQuery(DtmProdutos.qrBuscasP);
end;

procedure TPecasUltimaCompra.quickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vltotc := 0;
  vltotr := 0;
  vltovnd := 0;
end;

{ TReqMercadoria }

constructor TReqMercadoria.create;
begin
  query := TIBQuery(dtmProdutos.qrReqMerc);
end;

procedure TReqMercadoria.imprimirRelatorio(rdp: TRdprint);
begin
  try
    Screen.Cursor := crHourGlass;
    query.close;
    query.sql.text := 'select e.qtmessug as valor from empresa e where e.cod_empresa = ' + vDadosIni.codEmpresa;
    query.open;
    qtdeMeses := query.FieldByName('valor').AsInteger;
    query.close;
    query.sql.text := 'select p.grupo_prod,p.cod_prod,p.sub_g_prod,p.NUM_FAB_PROD,' +
      ' p.DESCR_PROD,p.PREC_TAB_PROD,p.classe_prod,p.CLINV,p.CLPRECO,p.CLPOP,p.CLQTV,' +
      ' p.CLFRV,p.CLATL,g.descricao as descricaog,sg.descricao as descricaosg from produtos p ' +
      ' inner join grupos g on p.grupo_prod=g.codigo_grup ' +
      ' left join sub_grupo sg on ' + //g.codigo_grup=sg.cod_grupo and' +
      ' p.sub_g_prod = sg.codigo_subgr ' +
      ' where p.dt_ult_vnd >= :vdat and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo=1 order by p.sub_g_prod,p.grupo_prod';
    query.params[0].asdate := Date - (qtdeMeses * 30);
    query.open;

    print := TRDprint(rdp);
    print.OpcoesPreview.CaptionPreview := 'Requisição de Mercadoria';
    print.CaptionSetup := 'Requisição de Mercadoria';
    print.TitulodoRelatorio := 'Requisição de Mercadoria';
    vDadosIni._LimparVarSendEmail;
    print.OnSendMail := vDadosini._SendMailRdPrint;
    print.OpcoesPreview.Remalina := true;
    if not vDadosIni.ModImp(print) then
      exit;
    linha := 1;
    vGrup := 0;
    vSubg := 0;
    vpag := 0;

    if not print.EstaAberto then
      print.Abrir;
    novaPaginaPrint;
    vsubg := query.FieldByName('SUB_G_PROD').AsInteger;
    linha := linha + 1;
    print.Impf(linha, 5, vDadosIni.strzero(query.FieldByName('SUB_G_PROD').AsInteger, 3) + ' - ' + query.fieldbyname('DESCRICAOSG').AsString, [expandido, negrito]);
    linha := linha + 1;
    while not query.eof do
    begin
      if query.FieldByName('SUB_G_PROD').AsInteger <> vsubg then
      begin
        linha := 1;
        print.Novapagina;
        novaPaginaPrint;
        vsubg := query.FieldByName('SUB_G_PROD').AsInteger;
        linha := linha + 1;
        print.Impf(linha, 5, vDadosIni.strzero(query.FieldByName('SUB_G_PROD').AsInteger, 3) + ' - ' + query.fieldbyname('DESCRICAOSG').AsString, [expandido, negrito]);
        linha := linha + 1;
      end;
      if query.FieldByName('GRUPO_PROD').AsInteger <> vgrup then
      begin
        vgrup := query.FieldByName('GRUPO_PROD').AsInteger;
        linha := linha + 1;
        print.Impf(linha, 1, vdadosini.strzero(query.FieldByName('GRUPO_PROD').AsInteger, 3) + ' - ' + query.FieldByName('DESCRICAOG').AsString, [expandido, negrito]);
        linha := linha + 1;
      end;
      print.ImpF(linha, 1, query.FieldByName('NUM_FAB_PROD').asstring, [comp20]);
      print.ImpF(linha, 18, query.FieldByName('DESCR_PROD').AsString, [comp20]);
      print.ImpF(linha, 68, '________', [comp20]);
      print.ImpF(linha, 80, '________', [comp20]);
      print.ImpF(linha, 92, '________', [comp20]);
      print.ImpF(linha, 104, vdadosini.alndir(format('%n', [query.FieldByName('PREC_TAB_PROD').Asfloat]), 10), [comp20]);
      print.ImpF(linha, 116, query.FieldByName('CLASSE_PROD').AsString + '-' +
        query.FieldByName('CLINV').AsString + '-' + query.FieldByName('CLPRECO').AsString + '-' +
        query.FieldByName('CLPOP').AsString + '-' + query.FieldByName('CLQTV').AsString + '-' +
        query.FieldByName('CLFRV').AsString + '-' + query.FieldByName('CLATL').AsString, [comp20]);
      linha := linha + 1;
      if linha > 60 then
      begin
        linha := 1;
        print.Novapagina;
        novaPaginaPrint;
      end;
      query.next;
    end;
    if print.EstaAberto then
      print.Fechar;
    query.close;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReqMercadoria.novaPaginaPrint;
begin
  print.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  print.ImpF(linha, 1, 'REQUISICAO DE MERCADORIA', [normal, negrito]);
  vpag := vpag + 1;
  linha := linha + 2;
  print.ImpF(linha, 1, 'DATA: ' + datetostr(date), [comp17]);
  print.ImpF(linha, 120, 'PAGINA: ' + vDadosIni.strzero(vpag, 4), [comp17]);
  linha := linha + 1;
  print.ImpF(linha, 1, vDadosIni.replicate('=', 155), [comp20]);
  linha := linha + 1;
  print.ImpF(linha, 1, 'CODIGO', [comp20]);
  print.ImpF(linha, 18, 'DENOMINACAO', [comp20]);
  print.ImpF(linha, 68, 'QTDE 01', [comp20]);
  print.ImpF(linha, 80, 'QTDE 02', [comp20]);
  print.ImpF(linha, 92, 'QTDE 03', [comp20]);
  print.ImpF(linha, 104, 'VALOR VND', [comp20]);
  print.ImpF(linha, 116, 'ATRIBUTOS', [comp20]);
  linha := linha + 1;
  print.ImpF(linha, 1, vDadosIni.replicate('=', 155), [comp20]);
end;

{ TRelatoriosEtiCodBarra }

destructor TRelatoriosEtiTermica.Destroy;
begin
  if Assigned(conf) then
    FreeAndNil(conf);
  
  inherited;
end;

procedure TRelatoriosEtiTermica.enviarTextoARGOX(pModelo, pNumFabricacao,
  pReferencia, pDescricao, pGrupoCodigoGrade: string; {pCodGrade: integer;} pValor,
  pValor4x: currency);
begin
  //    if (Length(Trim(pNumFabricacao)) < 9) then //Cabe na modelo de etiqueta da Loja Esteriótipo ..Usar Code39 que é alfanumérico
  //    begin
  //      A_Prn_Barcode(17, 75, 1, 'A', 1, 0, 40, 'N', 1, pchar(quotedstr(pNumFabricacao)) {'1803001'});
  //      A_Prn_Barcode(193, 75, 1, 'A', 1, 0, 40, 'N', 1, pchar(quotedstr(pNumFabricacao)) {'AC2020'}); //
  //    end

  //Cabe na modelo de etiqueta da Loja Esteriótipo ..Usar Code128 que é alfanumérico
    //Quarto parâmetro: 'A' é code39  , 'O' é Code93  ,'I' é Codabar , 'E' é Code128 e 'F' é EAN-13
  if pos('SUPERMERCADO', pModelo) > 0 then
    if Length(pNumFabricacao) <> 13 then
      Application.MessageBox(PChar('Padrão de código de barras EAN-13 deve conter exatos 13 dígitos numéricos' + chr(13) + 'Favor verificar este código de barras: ' + pNumFabricacao), 'Anteção', MB_OK + MB_ICONWARNING);

  if (contadorEti mod 2) = 0 then
    A_Clear_Memory;
  if (trim(pModelo) = 'LOJA') then
  begin
    if (contadorEti mod 2) = 0 then
    begin
      A_Prn_Text(15, 178, 1, 1, 1, 1, 1, 'n', 2, 'P/ TROCA NAO DESTACAR');
      A_Prn_Text(15, 165, 1, 2, 4, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(15, 150, 1, 2, 4, 1, 1, 'n', 2, pchar(copy(trim(pReferencia), 1, 20)));
      A_Prn_Text(15, 135, 1, 2, 4, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Barcode(11, 80, 1, 'E', 0, 0, 35, 'N', 2, pchar(trim(pNumFabricacao)));
      A_Prn_Text(15, 55, 1, 1, 1, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(15, 40, 1, 2, 4, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Text(15, 25, 1, 9, 2, 1, 1, 'n', 2, pchar('A Vista: ' + Format('%m', [pValor]))); //120
      A_Prn_Text(15, 10, 1, 9, 2, 1, 1, 'n', 2, pchar('4x ' + Format('%m', [pValor4x / 4]) + ' = ' + Format('%m', [pValor4x]))); //120
    end //15,30,45
    else
    begin
      A_Prn_Text(185, 178, 1, 1, 1, 1, 1, 'n', 2, 'P/ TROCA NAO DESTACAR');
      A_Prn_Text(185, 165, 1, 2, 3, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(185, 150, 1, 2, 3, 1, 1, 'n', 2, pchar(copy(trim(pReferencia), 1, 20)));
      A_Prn_Text(185, 135, 1, 2, 3, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Barcode(183, 80, 1, 'E', 0, 0, 35, 'N', 2, pchar(trim(pNumFabricacao)));
      A_Prn_Text(185, 55, 1, 1, 1, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(185, 40, 1, 2, 3, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Text(185, 25, 1, 9, 2, 1, 1, 'n', 2, pchar('A Vista: ' + Format('%m', [pValor]))); //270,20
      A_Prn_Text(185, 10, 1, 9, 2, 1, 1, 'n', 2, pchar('4x ' + Format('%m', [pValor4x / 4]) + ' = ' + Format('%m', [pValor4x]))); //270
      A_Print_Out(1, 1, 1, 1); // Chamo ao final de cada etiqueta preenchida
    end;
  end
  else if (trim(pModelo) = 'LOJA 1') then
  begin
    if (contadorEti mod 2) = 0 then
    begin //falta ajustar a altura dos campos
      A_Prn_Text(10, 218, 1, 1, 1, 1, 1, 'n', 2, 'P/ TROCA NAO DESTACAR');
      A_Prn_Text(10, 205, 1, 2, 4, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(10, 190, 1, 2, 4, 1, 1, 'n', 2, pchar(copy(trim(pReferencia), 1, 20)));
      A_Prn_Text(10, 175, 1, 2, 4, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Barcode(6, 125, 1, 'E', 0, 0, 35, 'N', 2, pchar(trim(pNumFabricacao)));
      A_Prn_Text(10, 100, 1, 2, 1, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(10, 85, 1, 2, 4, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Text(10, 70, 1, 9, 2, 1, 1, 'n', 2, pchar('A Vista: ' + Format('%m', [pValor]))); //120
      A_Prn_Text(10, 55, 1, 9, 2, 1, 1, 'n', 2, pchar('4x ' + Format('%m', [pValor4x / 4]) + ' = ' + Format('%m', [pValor4x]))); //120
      A_Prn_Barcode(6, 10, 1, 'E', 0, 0, 35, 'N', 2, pchar(trim(pNumFabricacao)));
    end //15,30,45
    else
    begin
      A_Prn_Text(205, 218, 1, 1, 1, 1, 1, 'n', 2, 'P/ TROCA NAO DESTACAR');
      A_Prn_Text(205, 205, 1, 2, 3, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(205, 190, 1, 2, 3, 1, 1, 'n', 2, pchar(copy(trim(pReferencia), 1, 20)));
      A_Prn_Text(205, 175, 1, 2, 3, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Barcode(201, 125, 1, 'E', 0, 0, 35, 'N', 2, pchar(trim(pNumFabricacao)));
      A_Prn_Text(205, 100, 1, 2, 1, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 24)));
      A_Prn_Text(205, 85, 1, 2, 3, 1, 1, 'n', 2, pchar(copy(trim(pGrupoCodigoGrade), vDadosIni.vEmp.vDidgitosGrup + 1, length(trim(pGrupoCodigoGrade)))));
      A_Prn_Text(205, 70, 1, 9, 2, 1, 1, 'n', 2, pchar('A Vista: ' + Format('%m', [pValor]))); //270,20
      A_Prn_Text(205, 55, 1, 9, 2, 1, 1, 'n', 2, pchar('4x ' + Format('%m', [pValor4x / 4]) + ' = ' + Format('%m', [pValor4x]))); //270
      A_Prn_Barcode(201, 10, 1, 'E', 0, 0, 35, 'N', 2, pchar(trim(pNumFabricacao)));
      A_Print_Out(1, 1, 1, 1); // Chamo ao final de cada etiqueta preenchida
    end;
  end
  else if (trim(pModelo) = 'SUPERMERCADO 1C') then
  begin
    //Quarto parâmetro: 'A' é code39  , 'O' é Code93  ,'I' é Codabar e 'E' é Code128 e 'F' é EAN-13
    A_Prn_Barcode(13, 12, 1, 'F', 0, 0, 28, 'N', 0, pchar(trim(copy(pNumFabricacao, 1, 12))));
    A_Prn_Text(230, 20, 1, 6, 4, 1, 1, 'n', 2, pchar(Format('%m', [pValor])));
    A_Prn_Text(18, 78, 1, 3, 3, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 46)));
    A_Print_Out(1, 1, 1, 1); // Chamo ao final de cada etiqueta preenchida
  end
  else if (trim(pModelo) = 'SUPERMERCADO 2C') then
  begin
    //Quarto parâmetro: 'A' é code39  , 'O' é Code93  ,'I' é Codabar e 'E' é Code128 e 'F' é EAN-13
    if (contadorEti mod 2) = 0 then
    begin
      A_Prn_Barcode(10, 8, 1, 'F', 0, 0, 28, 'N', 0, pchar(trim(copy(pNumFabricacao, 1, 12))));
      A_Prn_Text(40, 58, 1, 4, 4, 1, 1, 'n', 2, pchar(Format('%m', [pValor])));
      A_Prn_Text(15, 84, 1, 3, 3, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 23)));
    end
    else
    begin
      A_Prn_Barcode(220, 8, 1, 'F', 0, 0, 28, 'N', 0, pchar(trim(copy(pNumFabricacao, 1, 12))));
      A_Prn_Text(240, 58, 1, 4, 4, 1, 1, 'n', 2, pchar(Format('%m', [pValor])));
      A_Prn_Text(213, 84, 1, 3, 3, 1, 1, 'n', 2, Pchar(copy(trim(pDescricao), 1, 23)));
      A_Print_Out(1, 1, 1, 1); // Chamo ao final de cada etiqueta preenchida
    end;
  end;
  inc(contadorEti);
end;

function TRelatoriosEtiTermica.GetPrintName: string;
begin
  fileToSend := '';
  if vDadosIni.vPortaImpressora <> '' then
  begin
    Result := vDadosIni.vPortaImpressora;
    Exit;
  end;

  if not Assigned(conf) then
    conf := TConfig_sistema_class.getConf('imp_termica', buscas, vDadosIni.cod_empresa);

  if (conf.ReadString('Padrao', 'Porta') <> '') and
     (conf.ReadString('Padrao', 'AgenteId') <> '') then
  begin
    fileToSend := GetFileNameRandom('', '.term');
    Result := fileToSend;
  end
  else
    Result := '';
end;

procedure TRelatoriosEtiTermica.HandlePrint;
var
  fileText: TStrings;
begin
  if not Assigned(conf) then
    Exit;

  if (fileToSend <> '') and
     (FileExists(fileToSend)) then
  begin
    fileText := NewStringList();
    fileText.LoadFromFile(fileToSend);

    if not cloud_agente_print_termic(WideString(fileText.Text),
                                     WideString(Format('name=%s;agentId=%s;cnpj=%s', [conf.ReadString('Padrao', 'Porta'), conf.ReadString('Padrao', 'AgenteId'), vDadosIni.vEmp.vCNPJ])))
    then
      ShowErro(string(cloud_agente_last_error));
  end;
end;

procedure TRelatoriosEtiTermica._enviarTextoTermicaX(pBarcode: string; pCodGrade: integer);
begin
  //se for impressão na coluna 1 ou se for a primeira etiqueta

  AbuscasAux.Close;
  AbuscasAux.SQL.Text := 'select * from produtos' +
                         ' where grupo_prod = ' + IntToStr(grid.DataSource.DataSet.FieldByName('grupo_prod').AsInteger) +
                         ' and cod_prod = ' + QuotedStr(grid.DataSource.DataSet.FieldByName('cod_prod').AsString) +
                         ' and cod_empresa = ' + IntToStr(grid.DataSource.DataSet.FieldByName('cod_empresa').AsInteger);
  AbuscasAux.Open;

  if (((contadorEti + 1) mod vNumColunas) = 1) or (contadorEti = 0) or (vNumColunas = 1) then
    _limparMemoriaTermicaX;
  vQuery.Close;
  vQuery.SQL.Text := ' SELECT * FROM ITMODELOETITERMICA ITM ' +
    ' WHERE ITM.CODIGO = ' + inttostr(vCodEti) +
    ' AND ITM.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND ITM.INDICECOLUNA = ' + inttostr((contadorEti mod vNumColunas) + 1) +
    ' AND ITM.ATIVO = 1 ';
  vQuery.Open;
  vQuery.First;
  while not vQuery.Eof do
  begin
    if trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'BARCODE' then
    begin
      if pos('SUPERMERCADO', vModelo) > 0 then
        if Length(pBarcode) <> 13 then
        begin
          CloseFile(Arquivo);
          Application.MessageBox(PChar('Padrão de código de barras EAN-13 deve conter exatos 13 dígitos numéricos' + chr(13) + 'Favor verificar este código de barras: ' + pBarcode), 'Anteção', MB_OK + MB_ICONWARNING);
          exit;
        end;
      if vLScript = 'ZPL' then
      	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + pBarcode + '^FS')
      else if vLScript = 'EPL2' then
        WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + pBarcode + '"')
      else
      	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + pBarcode);
    end
    else if trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'TEXTO VARIAVEL' then
    begin
    	if vLScript = 'ZPL' then
      begin
        if (vQuery.FieldByName('TEXTO').AsString = 'COD_GRADE') or
          (vQuery.FieldByName('TEXTO').AsString = 'DESCRICAO') or
          (vQuery.FieldByName('TEXTO').AsString = 'DESCRICAO1') then
        begin
          if pCodGrade <> 0 then
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(retornaValor('select ' + vQuery.FieldByName('TEXTO').AsString + ' as valor from grade g where g.cod_empresa=' + vDadosIni.codEmpresa +
                ' and g.ativo=1 and g.cod_grade=' + inttostr(pCodGrade))), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '^FS')
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(retornaValor('select ' + vQuery.FieldByName('TEXTO').AsString + ' as valor from grade g where g.cod_empresa=' + vDadosIni.codEmpresa +
                ' and g.ativo=1 and g.cod_grade=' + inttostr(pCodGrade))) + '^FS');
          end;
        end
        else
        begin
          if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
          begin
            valorMascarado := Format('%m', [AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]);
            if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
            begin
              valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9) + '^FS');
            end
            else
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]) + '^FS');
          end
          else
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '^FS')
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString + '^FS');
          end;
        end;
      end
      else if vLScript = 'EPL2' then
      begin
        if (vQuery.FieldByName('TEXTO').AsString = 'COD_GRADE') or
          (vQuery.FieldByName('TEXTO').AsString = 'DESCRICAO') or
          (vQuery.FieldByName('TEXTO').AsString = 'DESCRICAO1') then
        begin
          if pCodGrade <> 0 then
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + copy(trim(retornaValor('select ' + vQuery.FieldByName('TEXTO').AsString + ' as valor from grade g where g.cod_empresa=' + vDadosIni.codEmpresa +
                ' and g.ativo=1 and g.cod_grade=' + inttostr(pCodGrade))), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '"')
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + trim(retornaValor('select ' + vQuery.FieldByName('TEXTO').AsString + ' as valor from grade g where g.cod_empresa=' + vDadosIni.codEmpresa +
                ' and g.ativo=1 and g.cod_grade=' + inttostr(pCodGrade))) + '"');
          end;
        end
        else
        begin
          if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
          begin
            valorMascarado := Format('%m', [AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]);
            if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
            begin
              valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + vDadosIni.StrZero(trim(valorMascarado), 9) + '"');
            end
            else
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + Format('%m', [AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]) + '"');
          end
          else
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + copy(trim(AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '"')
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString + '"');
          end;
        end;
      end
      else
      begin
        if (vQuery.FieldByName('TEXTO').AsString = 'COD_GRADE') or
          (vQuery.FieldByName('TEXTO').AsString = 'DESCRICAO') or
          (vQuery.FieldByName('TEXTO').AsString = 'DESCRICAO1') then
        begin
          if pCodGrade <> 0 then
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(retornaValor('select ' + vQuery.FieldByName('TEXTO').AsString + ' as valor from grade g where g.cod_empresa=' + vDadosIni.codEmpresa +
                ' and g.ativo=1 and g.cod_grade=' + inttostr(pCodGrade))), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger))
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(retornaValor('select ' + vQuery.FieldByName('TEXTO').AsString + ' as valor from grade g where g.cod_empresa=' + vDadosIni.codEmpresa +
                ' and g.ativo=1 and g.cod_grade=' + inttostr(pCodGrade))));
          end;
        end
        else
        begin
          if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
          begin
            valorMascarado := Format('%m', [AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]);
            if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
            begin
              valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9));
            end
            else
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]));
          end
          else
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger))
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + AbuscasAux.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString);
          end;
        end;
      end;
    end
    else if trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'TEXTO FIXO' then
    begin
    	if vLScript = 'ZPL' then
    	begin
        if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
          WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(vQuery.FieldByName('TEXTO').AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '^FS')
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(vQuery.FieldByName('TEXTO').AsString) + '^FS');
      end
      else if vLScript = 'EPL2' then
      begin
        if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
          WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + copy(trim(vQuery.FieldByName('TEXTO').AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '"')
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + trim(vQuery.FieldByName('TEXTO').AsString) + '"');
      end
      else
      begin
        if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
          WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(vQuery.FieldByName('TEXTO').AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger))
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(vQuery.FieldByName('TEXTO').AsString));
      end;
    end
    else if (trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'CALCULADO') then
    begin
    	if vLScript = 'ZPL' then
    	begin
        if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
        begin
          valorMascarado := Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux))]);
          if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
          begin
            valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9) + '^FS');
          end
          else
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux))]) + '^FS');
        end
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + _retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux) + '^FS');
      end
      else if vLScript = 'EPL2' then
      begin
        if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
        begin
          valorMascarado := Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux))]);
          if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
          begin
            valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + vDadosIni.StrZero(trim(valorMascarado), 9) + '"');
          end
          else
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux))]) + '"');
        end
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + _retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux) + '"');
      end
      else
      begin
        if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
        begin
          valorMascarado := Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux))]);
          if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
          begin
            valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9));
          end
          else
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux))]));
        end
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + _retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString), AbuscasAux));
      end;
    end
    else if (trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'IMAGEM') then
    begin
    	if (vLScript = 'ZPL') then
      	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vQuery.FieldByName('CAMPOIMAGEM').AsVariant)
    	else if (vLScript = 'EPL2') then
	      WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vQuery.FieldByName('CAMPOIMAGEM').AsVariant);
    end;
    vQuery.Next;
  end;
  inc(contadorEti);
  if contadorEti mod vNumColunas = 0 then
  begin
  	if vLScript = 'ZPL' then
    	WriteLn(Arquivo, '^PQ1,0,1,Y^XZ')
    else if vLScript = 'EPL2' then
      WriteLn(Arquivo, 'P1')
    else
    begin
      WriteLn(Arquivo, 'Q0001');
      WriteLn(Arquivo, 'E');
    end;
    CloseFile(Arquivo);
    HandlePrint;
  end;
end;

procedure TRelatoriosEtiTermica._enviarTextoTermicaX2(pBarcode: string);
begin
  //se for impressão na coluna 1 ou se for a primeira etiqueta
  if (((contadorEti + 1) mod vNumColunas) = 1) or (contadorEti = 0) or (vNumColunas = 1) then
    _limparMemoriaTermicaX;
  vQuery.Close;
  vQuery.SQL.Text := ' SELECT * FROM ITMODELOETITERMICA ITM ' +
    ' WHERE ITM.CODIGO = ' + inttostr(vCodEti) +
    ' AND ITM.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND ITM.INDICECOLUNA = ' + inttostr((contadorEti mod vNumColunas) + 1) +
    ' AND ITM.ATIVO = 1';
  vQuery.Open;
  vQuery.First;
  while not vQuery.Eof do
  begin
    if trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'BARCODE' then
    begin
      if pos('SUPERMERCADO', vModelo) > 0 then
        if Length(trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString)).AsString)) <> 13 then
        begin
          CloseFile(Arquivo);
          Application.MessageBox(PChar('Padrão de código de barras EAN-13 deve conter exatos 13 dígitos numéricos' + chr(13) + 'Favor verificar este código de barras: ' + pBarcode), 'Anteção', MB_OK + MB_ICONWARNING);
          exit;
        end;
      if vLScript = 'ZPL' then
      	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString)).AsString)  + '^FS')
      else if vLScript = 'EPL2' then
        WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString)).AsString) + '"')
      else
      	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString)).AsString));
    end
    else if trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'TEXTO VARIAVEL' then
    begin
    	if vLScript = 'ZPL' then
    	begin
        if UpperCase(trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString)) <> 'SEM GRADE' then
          if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
          begin
            valorMascarado := Format('%m', [dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]);
            if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
            begin
              valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9) + '^FS');
            end
            else
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]) + '^FS');
          end
          else
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '^FS')
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString + '^FS');
          end;
      end
      else if vLScript = 'EPL2' then
      begin
        if UpperCase(trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString)) <> 'SEM GRADE' then
          if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
          begin
            valorMascarado := Format('%m', [dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]);
            if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
            begin
              valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + vDadosIni.StrZero(trim(valorMascarado), 9) + '"');
            end
            else
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + Format('%m', [dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]) + '"');
          end
          else
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + copy(trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '"')
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString + '"');
          end;
      end
      else
      begin
        if UpperCase(trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString)) <> 'SEM GRADE' then
          if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
          begin
            valorMascarado := Format('%m', [dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]);
            if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
            begin
              valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
              valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9));
            end
            else
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsFloat]));
          end
          else
          begin
            if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
              WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger))
            else
            	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + dtSetEti.FieldByName(trim(vQuery.FieldByName('TEXTO').AsString)).AsString);
          end;
      end;
    end
    else if trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'TEXTO FIXO' then
    begin
    	if vLScript = 'ZPL' then
    	begin
        if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
          WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(vQuery.FieldByName('TEXTO').AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '^FS')
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(vQuery.FieldByName('TEXTO').AsString) + '^FS');
      end
      else if vLScript = 'EPL2' then
      begin
        if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
          WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + copy(trim(vQuery.FieldByName('TEXTO').AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger) + '"')
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + trim(vQuery.FieldByName('TEXTO').AsString) + '"');
      end
      else
      begin
        if vQuery.FieldByName('NUMCARACTERES').AsInteger > 0 then
          WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + copy(trim(vQuery.FieldByName('TEXTO').AsString), 1, vQuery.FieldByName('NUMCARACTERES').AsInteger))
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + trim(vQuery.FieldByName('TEXTO').AsString));
      end;
    end
    else if (trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'CALCULADO') then
    begin
    	if vLScript = 'ZPL' then
      begin
        if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
        begin
          valorMascarado := Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)))]);
          if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
          begin
            valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9) + '^FS');
          end
          else
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)))]) + '^FS');
        end
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + _retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)) + '^FS');
      end
      else if vLScript = 'EPL2' then
      begin
        if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
        begin
          valorMascarado := Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)))]);
          if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
          begin
            valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + vDadosIni.StrZero(trim(valorMascarado), 9) + '"');
          end
          else
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)))]) + '"');
        end
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + '"' + _retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)) + '"');
      end
      else
      begin
        if vQuery.FieldByName('CAMPOCURRENCY').AsString = 'S' then
        begin
          valorMascarado := Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)))]);
          if vQuery.FieldByName('MASCARARPRECO').AsString = 'S' then
          begin
            valorMascarado := StringReplace(valorMascarado, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, '.', '', [rfReplaceAll, rfIgnoreCase]);
            valorMascarado := StringReplace(valorMascarado, ',', '', [rfReplaceAll, rfIgnoreCase]);
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vDadosIni.StrZero(trim(valorMascarado), 9));
          end
          else
            WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + Format('%m', [StrToFloat(_retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)))]));
        end
        else
        	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + _retornaValorCalculado(trim(vQuery.FieldByName('TEXTO').AsString)));
      end;
    end
    else if (trim(vQuery.FieldByName('TIPOTEXTOIMPRESSO').AsString) = 'IMAGEM') then
    begin
    	if (vLScript = 'ZPL') then
      	WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vQuery.FieldByName('CAMPOIMAGEM').AsVariant)
	    else if (vLScript = 'EPL2') then
	      WriteLn(Arquivo, trim(vQuery.FieldByName('PARAMETROS_IMP').AsString) + vQuery.FieldByName('CAMPOIMAGEM').AsVariant);
    end;

    vQuery.Next;
  end;
  inc(contadorEti);
  if contadorEti mod vNumColunas = 0 then
  begin
    if vLScript = 'ZPL' then
    	WriteLn(Arquivo, '^PQ1,0,1,Y^XZ')
    else if vLScript = 'EPL2' then
      WriteLn(Arquivo, 'P1')
    else
    begin
      WriteLn(Arquivo, 'Q0001');
      WriteLn(Arquivo, 'E');
    end;
    CloseFile(Arquivo);
    HandlePrint;
  end;
end;

function TRelatoriosEtiTermica._existeItensEtiConfig: boolean;
begin
  result := true;
  vQuery.Close;
  vQuery.SQL.Text := ' SELECT * FROM ITMODELOETITERMICA ' +
  	' WHERE CODIGO = ' + inttostr(vCodEti) +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  vQuery.Open;
  if vQuery.IsEmpty then
  begin
    vQuery.Close;
    result := false;
    Application.MessageBox(Pchar('Modelo de etiqueta selecionado não possui itens configurados.' + chr(13) + 'Configure-os antes de prosseguir.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
  end;
end;

procedure TRelatoriosEtiTermica.imprimir;
var
  cont, i: Integer;
  vOK: Boolean;
begin
	if grid.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhum produto informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if somenteSelecionado then
  begin
    vOK := False;

    try
      grid.DataSource.DataSet.DisableControls;
      grid.DataSource.DataSet.First;
      while not grid.DataSource.DataSet.Eof do
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        grid.DataSource.DataSet.Next;
      end;
    finally
      grid.DataSource.DataSet.First;
      grid.DataSource.DataSet.EnableControls;
    end;

    if not vOK then
    begin
      Application.MessageBox(PChar('Nenhum produto selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

	try
    if Application.MessageBox('Deseja ajustar a cabeça de impressão?', 'Confirmação', MB_ICONINFORMATION + MB_YESNO) = IDYES then
    begin
      AssignFile(Arquivo, GetPrintName);
      Rewrite(Arquivo);
      WriteLn(Arquivo, 'N');
      WriteLn(Arquivo, 'Q165,32');
      WriteLn(Arquivo, 'ON');
      WriteLn(Arquivo, 'q460');
      WriteLn(Arquivo, 'D15');
      WriteLn(Arquivo, 'JF');
      WriteLn(Arquivo, 'P1');
      CloseFile(Arquivo);
      HandlePrint;
    end;

    AssignFile(Arquivo, GetPrintName);
    Rewrite(Arquivo);

    grid.DataSource.dataSet.DisableControls;
    grid.DataSource.dataSet.First;
    j := 0;
    b := 5;
    cont := 1;
    while not grid.DataSource.dataSet.eof do
    begin
      if somenteSelecionado then
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        //if grid.SelectedRows.Current_RowSelected then
        begin
          if ImprimirProdutosMarcados then
          begin
            QtdeEmt := '1';
          end
          else
          begin
            QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
            if not ImprimirQtdEstoque then
            begin
              QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
              if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp) then
              	exit;
              if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                QtdeEmt := inttostr(round(QtdTemp));
            end;
          end;
          if strtofloat(QtdeEmt) >= 1 then
          begin
            QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
            buscas.Close;
            {buscas.SQL.Text := 'select first 1 it.COD_FORN_NFE from ' +
              ' nf_entrada nf inner join item_nf_entrada it on it.num_nota_nfe = nf.num_nota_nfe ' +
              ' and it.cod_forn_nfe = nf.cod_forn_nfe ' +
              ' where ' +
              ' it.grupo_prod = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
              ' and it.cod_prod = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
              ' and nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf.ativo=1 ' +
              ' order by nf.data_lanc_nfe desc';}
            buscas.SQL.Text := ' select first 1 nf.cod_cliente from notafiscal nf ' +
              ' inner join notafiscal_item it on it.cod_nf = nf.cod_nf and it.cod_empresa = nf.cod_empresa ' +
              ' where nf.natureza_nf = ''E'' ' +
              ' and it.grupo_prod = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
              ' and it.cod_prod = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
              ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
              ' and nf.ativo = 1 ' +
              ' order by nf.data_lanc desc';
            buscas.Open;
            if buscas.IsEmpty then
              CodForn := ''
            else
              CodForn := Buscas.FieldByName('COD_CLIENTE').AsString;
            //          CodForn := Buscas.FieldByName('COD_FORN_NFE').AsString;
            if Odd(StrToInt(qtdeemt)) then
              qtdeemt := IntToStr(StrToInt(qtdeemt) + 1);
            WriteLn(Arquivo, 'N');
            //WriteLn(Arquivo, 'Q160,32');
            WriteLn(Arquivo, 'Q165,32');
            WriteLn(Arquivo, 'ON');
            WriteLn(Arquivo, 'q460');
            WriteLn(Arquivo, 'D15');
            WriteLn(Arquivo, 'JF');
            j := 0;
            b := 5;
            cont := 1;
            itmax := 0;
            ExecutaComandosSqlExec(' delete from IMP_BAR_PROD ' +
            	' where COD_EMPRESA = ' + vDadosIni.codEmpresa +
              ' and ATIVO = 1 ' +
              ' and GRUPO_PROD = ' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and COD_PROD = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for i := 1 to strtoint(qtdeemt) do
            begin
              //No lugar do num. fabricacao colocar o grupo + o código.
              WriteLn(Arquivo, 'B' + IntToStr(b) + ',' + IntToStr(j) + ',0,3,1,3,48,N,"' + trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString) + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 60) + ',0,2,1,1,N,"' + trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString) + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 80) + ',0,2,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 100) + ',0,2,1,1,N,"' + CodForn + '-' + Copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 10) + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 120) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 18) + '"');
              //WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 140) + ',0,2,1,1,N,"' + Copy((dtm1.QRYProdutosDESCR_PROD.Text), 19, 15) + '"');
              //Se a variável i for par, escreve na mesma linha, senão pula de linha
              if Odd(cont) then
              begin
                b := b + 242;
              end
              else
              begin
                j := j + 193;
                b := 5;
              end;
              cont := cont + 1;
              itmax := itmax + 1;
              if itmax = 22 then
              begin
                WriteLn(Arquivo, 'P1');
                WriteLn(Arquivo, 'N');
                //WriteLn(Arquivo, 'Q160,32');
                WriteLn(Arquivo, 'Q165,32');
                WriteLn(Arquivo, 'ON');
                WriteLn(Arquivo, 'q460');
                WriteLn(Arquivo, 'D15');
                WriteLn(Arquivo, 'JF');
                j := 0;
                b := 5;
                cont := 1;
                itmax := 0;
              end;
              obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
            end;
            WriteLn(Arquivo, 'P1');
          end;
        end;
      end
      else
      begin
        if ImprimirProdutosMarcados then
        begin
          QtdeEmt := '1';
        end
        else
        begin
          QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
          if not ImprimirQtdEstoque then
          begin
            QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
            if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp) then
            	exit;
            if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
              QtdeEmt := inttostr(round(QtdTemp));
          end;
        end;
        if strtofloat(QtdeEmt) >= 1 then
        begin
          QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
          buscas.Close;
          buscas.SQL.Text := ' select first 1 nf.cod_cliente from notafiscal nf ' +
            ' inner join notafiscal_item it on it.cod_nf = nf.cod_nf and it.cod_empresa = nf.cod_empresa ' +
            ' where nf.natureza_nf = ''E'' ' +
            ' and it.grupo_prod = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
            ' and it.cod_prod = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
            ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and nf.ativo = 1 ' +
            ' order by nf.data_lanc desc';
          buscas.Open;
          {buscas.SQL.Text := 'select first 1 it.COD_FORN_NFE from ' +
            ' nf_entrada nf inner join item_nf_entrada it on it.num_nota_nfe = nf.num_nota_nfe ' +
            ' and it.cod_forn_nfe = nf.cod_forn_nfe ' +
            ' where ' +
            ' it.grupo_prod = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
            ' and it.cod_prod = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
            ' and nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf.ativo=1 ' +
            ' order by nf.data_lanc_nfe desc'; }
          buscas.Open;
          if buscas.IsEmpty then
            CodForn := ''
          else
            CodForn := Buscas.FieldByName('COD_CLIENTE').AsString;
          //          CodForn := Buscas.FieldByName('COD_FORN_NFE').AsString;
          if Odd(StrToInt(qtdeemt)) then
            qtdeemt := IntToStr(StrToInt(qtdeemt) + 1);
          WriteLn(Arquivo, 'N');
          //WriteLn(Arquivo, 'Q160,32');
          WriteLn(Arquivo, 'Q165,32');
          WriteLn(Arquivo, 'ON');
          WriteLn(Arquivo, 'q460');
          WriteLn(Arquivo, 'D15');
          WriteLn(Arquivo, 'JF');
          j := 0;
          b := 5;
          cont := 1;
          itmax := 0;
          ExecutaComandosSqlExec(' delete from IMP_BAR_PROD ' +
          	' where COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' and ATIVO = 1 ' +
            ' and GRUPO_PROD = ' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
            ' and COD_PROD = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
          for i := 1 to strtoint(qtdeemt) do
          begin
            //No lugar do num. fabricacao colocar o grupo + o código.
            WriteLn(Arquivo, 'B' + IntToStr(b) + ',' + IntToStr(j) + ',0,3,1,3,48,N,"' + trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 60) + ',0,2,1,1,N,"' + trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 80) + ',0,2,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 100) + ',0,2,1,1,N,"' + CodForn + '-' + Copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 10) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 120) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 18) + '"');
            //WriteLn(Arquivo, 'A' + IntToStr(b + 4) + ',' + IntToStr(j + 140) + ',0,2,1,1,N,"' + Copy((dtm1.QRYProdutosDESCR_PROD.Text), 19, 15) + '"');
            //Se a variável i for par, escreve na mesma linha, senão pula de linha
            if Odd(cont) then
            begin
              b := b + 242;
            end
            else
            begin
              j := j + 193;
              b := 5;
            end;
            cont := cont + 1;
            itmax := itmax + 1;
            if itmax = 22 then
            begin
              WriteLn(Arquivo, 'P1');
              WriteLn(Arquivo, 'N');
              //WriteLn(Arquivo, 'Q160,32');
              WriteLn(Arquivo, 'Q165,32');
              WriteLn(Arquivo, 'ON');
              WriteLn(Arquivo, 'q460');
              WriteLn(Arquivo, 'D15');
              WriteLn(Arquivo, 'JF');
              j := 0;
              b := 5;
              cont := 1;
              itmax := 0;
            end;
            obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
              Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
              Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
              Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
              Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
              Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
          end;
          WriteLn(Arquivo, 'P1');
        end;
      end;
      grid.DataSource.dataSet.Next;
    end;
    CloseFile(Arquivo);
    HandlePrint;
  finally
    grid.DataSource.dataSet.EnableControls;
  end;
end;

procedure TRelatoriosEtiTermica.imprimirARGOX(pModelo: string;
  dtSet: TClientDataSet);
var
  HandleArgox: THandle;
  i: integer;
  dataTemp, cp: string;
  vCodEmp_Grupo: string;
  vSomenteSelecionado: Boolean;
  vOK: Boolean;
begin
	if dtSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhum produto informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

	vSomenteSelecionado := Application.MessageBox('Imprimir somente selecionados?',
  	  'Confirmação', MB_YESNO + MB_ICONQUESTION) = ID_YES;

  if vSomenteSelecionado then
  begin
  	vOK := False;

    try
      dtSet.DisableControls;
      dtSet.First;
      while not dtSet.Eof do
      begin
        if dtSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        dtSet.Next;
      end;
    finally
    	dtSet.First;
  		dtSet.EnableControls;
    end;

    if not vOK then
    begin
    	Application.MessageBox(PChar('Nenhum produto selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if not vDadosIni.testarCodBarrasEtiqueta(somenteSelecionado, dtSet, True) then
    exit;

  try
    HandleArgox := 0;
    HandleArgox := LoadLibrary('WINPPLA.DLL');
    if HandleArgox <> 0 then
    begin
      @A_CreatePrn := GetProcAddress(HandleArgox, 'A_CreatePrn');
      @A_Print_Out := GetProcAddress(HandleArgox, 'A_Print_Out');
      @A_Prn_Text := GetProcAddress(HandleArgox, 'A_Prn_Text');
      @A_Prn_Barcode := GetProcAddress(HandleArgox, 'A_Prn_Barcode');
      @A_Clear_Memory := GetProcAddress(HandleArgox, 'A_Clear_Memory');
      @A_ClosePrn := GetProcAddress(HandleArgox, 'A_ClosePrn');
    end
    else
    begin
      Application.MessageBox(PChar('DLL para comunicação com a impressora Argox OS-214 não encontrada'), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;

    dtSet.First;
    A_createPrn(0, Pchar(vDadosIni.vPortaImpressora));
    while not dtSet.Eof do
    begin
      if vSomenteSelecionado then
      begin
      	if dtSet.FieldByName('sel').AsString = 'S' then
        begin
          for I := 1 to dtSet.FieldByName('qtde').AsInteger do
            if Trim(dtSet.FieldByName('DESCRGRADE').AsString) <> 'SEM GRADE' then
              enviarTextoARGOX(pModelo, dtSet.FieldByName('codbarra').AsString,
                'REF:' + dtSet.FieldByName('APLICACAO_PROD').AsString, dtSet.FieldByName('DESCR_PROD').AsString,
                vDadosIni.StrZero(dtSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
                + trim(dtSet.FieldByName('COD_PROD').AsString) + '/' + copy(dtSet.FieldByName('descrgrade').AsString, 1, 12),
                dtSet.FieldByName('PREC_TAB_PROD').AsCurrency, dtSet.FieldByName('PREC_30_PROD').AsCurrency)
            else
              enviarTextoARGOX(pModelo, dtSet.FieldByName('codbarra').AsString,
                'REF:' + dtSet.FieldByName('APLICACAO_PROD').AsString, dtSet.FieldByName('DESCR_PROD').AsString,
                vDadosIni.StrZero(dtSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
                + trim(dtSet.FieldByName('COD_PROD').AsString),
                dtSet.FieldByName('PREC_TAB_PROD').AsCurrency, dtSet.FieldByName('PREC_30_PROD').AsCurrency);
        end;
      end
      else
      begin
        for I := 1 to dtSet.FieldByName('qtde').AsInteger do
          if Trim(dtSet.FieldByName('DESCRGRADE').AsString) <> 'SEM GRADE' then
            enviarTextoARGOX(pModelo, dtSet.FieldByName('codbarra').AsString,
              'REF:' + dtSet.FieldByName('APLICACAO_PROD').AsString, dtSet.FieldByName('DESCR_PROD').AsString,
              vDadosIni.StrZero(dtSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
              + trim(dtSet.FieldByName('COD_PROD').AsString) + '/' + copy(dtSet.FieldByName('descrgrade').AsString, 1, 12),
              dtSet.FieldByName('PREC_TAB_PROD').AsCurrency, dtSet.FieldByName('PREC_30_PROD').AsCurrency)
          else
            enviarTextoARGOX(pModelo, dtSet.FieldByName('codbarra').AsString,
              'REF:' + dtSet.FieldByName('APLICACAO_PROD').AsString, dtSet.FieldByName('DESCR_PROD').AsString,
              vDadosIni.StrZero(dtSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
              + trim(dtSet.FieldByName('COD_PROD').AsString),
              dtSet.FieldByName('PREC_TAB_PROD').AsCurrency, dtSet.FieldByName('PREC_30_PROD').AsCurrency);
      end;

      dtSet.Next;
    end;

  finally
    if HandleArgox <> 0 then
    begin
      //if (contadorEti mod 2) = 1 then
      A_Print_Out(1, 1, 1, 1);
      A_ClosePrn;
    end;
    FreeLibrary(HandleArgox);
  end;
end;

procedure TRelatoriosEtiTermica.imprimirARGOX(pModelo: string);
var
  HandleArgox: THandle;
  cont, i, k, gp, j: integer;
  dataTemp, cp: string;
  vCodEmp_Grupo: string;
  vOK: Boolean;
begin
	if grid.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhum produto informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if somenteSelecionado then
  begin
  	vOK := False;

    try
      grid.DataSource.DataSet.DisableControls;
      grid.DataSource.DataSet.First;
      while not grid.DataSource.DataSet.Eof do
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        grid.DataSource.DataSet.Next;
      end;
    finally
    	grid.DataSource.DataSet.First;
  		grid.DataSource.DataSet.EnableControls;
    end;

    if not vOK then
    begin
    	Application.MessageBox(PChar('Nenhum produto selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if not vDadosIni.testarCodBarrasEtiqueta(somenteSelecionado, grid, True) then
    exit;

  try
    gp := 0;
    HandleArgox := 0;
    HandleArgox := LoadLibrary('WINPPLA.DLL');
    if HandleArgox <> 0 then
    begin
      @A_CreatePrn := GetProcAddress(HandleArgox, 'A_CreatePrn');
      @A_Print_Out := GetProcAddress(HandleArgox, 'A_Print_Out');
      @A_Prn_Text := GetProcAddress(HandleArgox, 'A_Prn_Text');
      @A_Prn_Barcode := GetProcAddress(HandleArgox, 'A_Prn_Barcode');
      @A_Clear_Memory := GetProcAddress(HandleArgox, 'A_Clear_Memory');
      @A_ClosePrn := GetProcAddress(HandleArgox, 'A_ClosePrn');
    end
    else
    begin
      Application.MessageBox(PChar('DLL para comunicação com a impressora Argox OS-214 não encontrada'), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;

    contadorEti := 0;
    grid.DataSource.DataSet.DisableControls;
    grid.DataSource.DataSet.First;
    A_createPrn(0, Pchar(vDadosIni.vPortaImpressora));
    //            A_createPrn(0, 'C:\Temp\out.txt');
    while not grid.DataSource.DataSet.EOF do
    begin
      if somenteSelecionado then
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        //if grid.SelectedRows.Current_RowSelected then
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
            QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
          end;
          buscas.Close;
          buscas.SQL.Text := 'select * from COD_GRADE_PROD P ' +
          	' inner join GRADE G on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
            ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
            ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
            ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and p.ativo=1';
          buscas.Open;
          buscas.FetchAll;
          if not buscas.IsEmpty then
          begin
            SetLength(CodBarra, Buscas.RecordCount);
            SetLength(DescGrade, Buscas.RecordCount);
            SetLength(DescGrade1, Buscas.RecordCount);
            SetLength(Quant, Buscas.RecordCount);
            buscas.First;
            i := 0;
            while not Buscas.EOF do
            begin
              DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
              DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);
              Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);

              CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
              	buscas,
                grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
                grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
                buscas.FieldByName('COD_GRADE').AsInteger,
                grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);

//              if (vDadosIni.vEmp.vDigitosEmp = 2) or (vDadosIni.vEmp.vDigitosEmp = 1) then
//                CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, vDadosIni.vEmp.vDigitosEmp) + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                  + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString
//              else
//                CodBarra[i] := 'G-' + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                  + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString;

              inc(i);
              Buscas.Next;
            end;
          end
          else
          begin
            if ImprimirProdutosMarcados then
              QtdeEmt := '1'
            else
            begin
              if not ImprimirQtdEstoque then
              begin
                QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
                	exit;
                if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                  QtdeEmt := inttostr(round(QtdTemp));
              end;
            end;
            SetLength(CodBarra, 1);
            SetLength(DescGrade, 1);
            SetLength(DescGrade1, 1);
            SetLength(Quant, 1);
            DescGrade[0] := '';
            DescGrade1[0] := '';
            Quant[0] := 0;

            CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
              buscas,
              grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
              grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
              0,
              grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
              vDadosIni.IfThen(pos('SUPERMERCADO', pModelo) > 0, false,
              	vDadosIni.IfThen(vDadosIni.vProduto.vUsarNumFabCodBarra, false,
              		true)));

//            if (pos('SUPERMERCADO', pModelo) > 0) then
//              CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString)
//            else
//              CodBarra[0] := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString);
          end;

          if (Buscas.IsEmpty) then
          begin
            for cont := 0 to StrToInt(QtdeEmt) - 1 do
            begin
              enviarTextoARGOX(pModelo, CodBarra[0],
                'REF:' + grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString,
                vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
                + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString),
                grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsCurrency);
            end;
            if not ImprimirProdutosMarcados then
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
              for j := 1 to strtoint(QtdeEmt) do
                obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                  Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                  Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
            end;
          end
          else if (not Buscas.IsEmpty) then
          begin
            if ImprimirProdutosMarcados then
            begin
              if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
                and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
              begin
                gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
                cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
                for k := 0 to Length(Quant) - 1 do
                begin
                  QtdeEmt := inttostr(Quant[k]);
                  if not ImprimirQtdEstoque then
                  begin
                    QtdTemp := strtofloat(QtdeEmt);
                    if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                    	exit;
                    if Quant[k] <> QtdTemp then
                      QtdeEmt := inttostr(round(QtdTemp));
                  end;

                  for i := 0 to StrToInt(QtdeEmt) - 1 do
                  begin
                    enviarTextoARGOX(pModelo, CodBarra[k],
                      'REF:' + grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString,
                      vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
                      + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + copy(DescGrade[k], 1, 12),
                      grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsCurrency);
                  end;
                end;
              end;
            end
            else
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
              for k := 0 to Length(Quant) - 1 do
              begin
                QtdeEmt := inttostr(Quant[k]);
                if not ImprimirQtdEstoque then
                begin
                  QtdTemp := strtofloat(QtdeEmt);
                  if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                  	exit;
                  if Quant[k] <> QtdTemp then
                    QtdeEmt := inttostr(round(QtdTemp));
                end;
                for i := 0 to StrToInt(QtdeEmt) - 1 do
                begin
                  enviarTextoARGOX(pModelo, CodBarra[k],
                    'REF:' + grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString,
                    vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
                    + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + copy(DescGrade[k], 1, 12),
                    grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsCurrency);
                  obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                    Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                    Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
                end;
              end;
            end;
          end;
        end;
      end
      else
      begin
        if ImprimirProdutosMarcados then
          QtdeEmt := '1'
        else
        begin
          QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
          QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
        end;
        buscas.Close;
        buscas.SQL.Text := 'select * from COD_GRADE_PROD P ' +
        	' inner join GRADE G on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
          ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
          ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
          ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and p.ativo=1';
        buscas.Open;
        buscas.FetchAll;
        if not buscas.IsEmpty then
        begin
          SetLength(CodBarra, Buscas.RecordCount);
          SetLength(DescGrade, Buscas.RecordCount);
          SetLength(DescGrade1, Buscas.RecordCount);
          SetLength(Quant, Buscas.RecordCount);
          buscas.First;
          i := 0;
          while not Buscas.EOF do
          begin
            DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
            DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);
            Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);
            
            CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
              buscas,
              grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
              grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
              buscas.FieldByName('COD_GRADE').AsInteger,
              grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);

//            if (vDadosIni.vEmp.vDigitosEmp = 2) or (vDadosIni.vEmp.vDigitosEmp = 1) then
//              CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, vDadosIni.vEmp.vDigitosEmp) + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString
//            else
//              CodBarra[i] := 'G-' + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString;

            inc(i);
            Buscas.Next;
          end;
        end
        else
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            if not ImprimirQtdEstoque then
            begin
              QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
              if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
              	exit;
              if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                QtdeEmt := inttostr(round(QtdTemp));
            end;
          end;
          SetLength(CodBarra, 1);
          SetLength(DescGrade, 1);
          SetLength(DescGrade1, 1);
          SetLength(Quant, 1);
          DescGrade[0] := '';
          DescGrade1[0] := '';
          Quant[0] := 0;

          CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
            buscas,
            grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
            0,
            grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
            vDadosIni.IfThen(pos('SUPERMERCADO', pModelo) > 0, false,
              vDadosIni.IfThen(vDadosIni.vProduto.vUsarNumFabCodBarra, false,
              	true)));
            
//          if (pos('SUPERMERCADO', pModelo) > 0) then
//            CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString)
//          else
//            CodBarra[0] := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString);
        end;

        if (Buscas.IsEmpty) then //and (not DTM1.QRYProdutosEST_F.IsNull) then
        begin
          for cont := 0 to StrToInt(QtdeEmt) - 1 do
          begin
            enviarTextoARGOX(pModelo, CodBarra[0],
              'REF:' + grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString,
              vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
              + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString),
              grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsCurrency);
          end;
          if not ImprimirProdutosMarcados then
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for j := 1 to strtoint(QtdeEmt) do
              obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
          end;
        end
        else if (not Buscas.IsEmpty) then
        begin
          if ImprimirProdutosMarcados then
          begin
            if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
              and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
            begin
              gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
              cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
              for k := 0 to Length(Quant) - 1 do
              begin
                QtdeEmt := inttostr(Quant[k]);
                if not ImprimirQtdEstoque then
                begin
                  QtdTemp := strtofloat(QtdeEmt);
                  if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                  	exit;
                  //                  vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp);
                  if Quant[k] <> QtdTemp then
                    QtdeEmt := inttostr(round(QtdTemp));
                end;
                for i := 0 to StrToInt(QtdeEmt) - 1 do
                begin
                  enviarTextoARGOX(pModelo, CodBarra[k],
                    'REF:' + grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString,
                    vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
                    + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + copy(DescGrade[k], 1, 12),
                    grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsCurrency);
                end;
              end;
            end;
          end
          else
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for k := 0 to Length(Quant) - 1 do
            begin
              QtdeEmt := inttostr(Quant[k]);
              if not ImprimirQtdEstoque then
              begin
                QtdTemp := strtofloat(QtdeEmt);
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                	exit;
                //                vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp);
                if Quant[k] <> QtdTemp then
                  QtdeEmt := inttostr(round(QtdTemp));
              end;
              for i := 0 to StrToInt(QtdeEmt) - 1 do
              begin
                enviarTextoARGOX(pModelo, CodBarra[k],
                  'REF:' + grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString,
                  vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
                  + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + copy(DescGrade[k], 1, 12),
                  grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsCurrency);
                obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                  Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                  Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
              end;
            end;
          end;
        end;
      end;
      grid.DataSource.dataSet.Next
    end; //Fim do While
  finally
  	grid.DataSource.DataSet.EnableControls;
    if HandleArgox <> 0 then
    begin
      if (contadorEti mod 2) = 1 then
        A_Print_Out(1, 1, 1, 1);
      A_ClosePrn;
    end;
    FreeLibrary(HandleArgox);
  end;
end;

procedure TRelatoriosEtiTermica.imprimirINTERMEC;
var
  cont, i, k, gp, j: integer;
  dataTemp, cp: string;
  vOK: Boolean;
begin
	if grid.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhum produto informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if somenteSelecionado then
  begin
  	vOK := False;

    try
      grid.DataSource.DataSet.DisableControls;
      grid.DataSource.DataSet.First;
      while not grid.DataSource.DataSet.Eof do
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        grid.DataSource.DataSet.Next;
      end;
    finally
    	grid.DataSource.DataSet.First;
  		grid.DataSource.DataSet.EnableControls;
    end;

    if not vOK then
    begin
    	Application.MessageBox(PChar('Nenhum produto selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if not vDadosIni.testarCodBarrasEtiqueta(somenteSelecionado, grid, True) then
    exit;

	try
    gp := 0;
    b := 5;
    itmax := 0;
    grid.DataSource.DataSet.DisableControls;
    grid.DataSource.DataSet.First;
    AssignFile(Arquivo, GetPrintName);
    Rewrite(Arquivo);
    while not grid.DataSource.DataSet.EOF do
    begin
      if somenteSelecionado then
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        //if grid.SelectedRows.Current_RowSelected then
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
            QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
          end;

          buscas.Close;
          buscas.SQL.Text := 'select * from COD_GRADE_PROD P inner join GRADE G ' +
            ' on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
            ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
            ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
            ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and p.ativo=1';
          buscas.Open;
          buscas.FetchAll;
          if not buscas.IsEmpty then
          begin
            SetLength(CodBarra, Buscas.RecordCount);
            SetLength(DescGrade, Buscas.RecordCount);
            SetLength(DescGrade1, Buscas.RecordCount);
            SetLength(Quant, Buscas.RecordCount);
            buscas.First;
            i := 0;
            while not Buscas.EOF do
            begin
              DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
              DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);
              Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);

              CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
              	buscas,
                grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
                grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
                buscas.FieldByName('COD_GRADE').AsInteger,
                grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);

//              CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, 2) + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString
//                + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + Buscas.FieldByName('COD_GRADE').AsString;

              inc(i);
              Buscas.Next;
            end;
          end
          else
          begin
            if ImprimirProdutosMarcados then
              QtdeEmt := '1'
            else
            begin
              if not ImprimirQtdEstoque then
              begin
                QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
                	exit;
                if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                  QtdeEmt := inttostr(round(QtdTemp));
              end;
            end;
            SetLength(CodBarra, 1);
            SetLength(DescGrade, 1);
            SetLength(DescGrade1, 1);
            SetLength(Quant, 1);
            DescGrade[0] := '';
            DescGrade1[0] := '';
            //          Quant[0] := round(QtdTemp);
            Quant[0] := 0;

            CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
            	buscas,
            	grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            	grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
            	0,
            	grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
            	true);
              
//            CodBarra[0] := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString);
          end;

          WriteLn(Arquivo, 'ZT'); //ZT
          WriteLn(Arquivo, 'q800');
          WriteLn(Arquivo, 'Q600,24');
          WriteLn(Arquivo, 'ON');
          WriteLn(Arquivo, 'D15');
          WriteLn(Arquivo, 'JF');
          WriteLn(Arquivo, 'S2');
          WriteLn(Arquivo, 'N');
          dataTemp := StringReplace(grid.DataSource.dataSet.FieldByName('DAT_CAD_PROD').AsString, '/', '', [rfReplaceAll]);
          dataTemp := StringReplace(dataTemp, '-', '', []);
          dataTemp := StringReplace(dataTemp, '.', '', []);

          if (Buscas.IsEmpty) then //and (not DTM1.QRYProdutosEST_F.IsNull) then
          begin
            for cont := 0 to StrToInt(QtdeEmt) - 1 do
            begin
              WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 10) + ',0,1,2,3,N,"' + Copy(vDadosIni.vEmp.vnomeEmpresa, 1, 20) + '"');
              WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(j + 70) + ',0,1,2,3,128,B,"' + CodBarra[0] + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 260) + ',0,1,1,2,N,"' + trim(Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30)) + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 290) + ',0,1,1,2,N,"' + trim(Copy('MARCA: ' + grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 22)) + ' - ' + trim(copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 15)) + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 320) + ',0,1,2,2,N,"TAM: ' + DescGrade[0] + ' ' + DescGrade1[0] + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 350) + ',0,1,1,1,N,"' + dataTemp + '"');
              WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 480) + ',0,1,3,3,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
              if (b = 405) then //or ((k = Length(Quant) - 1)) then
              begin
                WriteLn(Arquivo, 'P1');
                WriteLn(Arquivo, 'N');
              end;
              if b = 5 then
                b := 405
              else if b = 405 then
                b := 5;

              //inc(itmax);
              if itmax >= 6 then
              begin
                WriteLn(Arquivo, 'ZT'); //ZT
                WriteLn(Arquivo, 'q800');
                WriteLn(Arquivo, 'Q600,24');
                WriteLn(Arquivo, 'ON');
                WriteLn(Arquivo, 'D15');
                WriteLn(Arquivo, 'JF');
                WriteLn(Arquivo, 'S2');
                WriteLn(Arquivo, 'N');
                itmax := 0;
              end;
            end;
            if not ImprimirProdutosMarcados then
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
              for j := 1 to strtoint(QtdeEmt) do
                obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                  Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                  Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
            end;
          end
          else if (not Buscas.IsEmpty) then
          begin
            if ImprimirProdutosMarcados then
            begin
              if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
                and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
              begin
                gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
                cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
                for k := 0 to Length(Quant) - 1 do
                begin
                  QtdeEmt := inttostr(Quant[k]);
                  if not ImprimirQtdEstoque then
                  begin
                    QtdTemp := strtofloat(QtdeEmt);
                    if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                    	exit;
                    if Quant[k] <> QtdTemp then
                      QtdeEmt := inttostr(round(QtdTemp));
                  end;
                  for i := 0 to StrToInt(QtdeEmt) - 1 do
                  begin
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 10) + ',0,1,2,3,N,"' + Copy(vDadosIni.vEmp.vnomeEmpresa, 1, 20) + '"');
                    WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(j + 70) + ',0,1,2,3,128,B,"' + CodBarra[k] + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 260) + ',0,1,1,2,N,"' + trim(Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30)) + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 290) + ',0,1,1,2,N,"' + trim(Copy('MARCA: ' + grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 22)) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 15) + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 320) + ',0,1,2,2,N,"TAM: ' + DescGrade[k] + ' ' + DescGrade1[k] + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 350) + ',0,1,1,1,N,"' + dataTemp + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 440) + ',0,1,3,3,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');

                    if (b = 405) then //or ((k = Length(Quant) - 1)) then
                    begin
                      WriteLn(Arquivo, 'P1');
                      WriteLn(Arquivo, 'N');
                    end;
                    if b = 5 then
                      b := 405
                    else if b = 405 then
                      b := 5;

                    if itmax >= 6 then
                    begin
                      WriteLn(Arquivo, 'ZT'); //ZT
                      WriteLn(Arquivo, 'q800');
                      WriteLn(Arquivo, 'Q600,24');
                      WriteLn(Arquivo, 'ON');
                      WriteLn(Arquivo, 'D15');
                      WriteLn(Arquivo, 'JF');
                      WriteLn(Arquivo, 'S2');
                      WriteLn(Arquivo, 'N');
                      itmax := 0;
                    end;
                  end;
                end;
              end;
            end
            else
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
              for k := 0 to Length(Quant) - 1 do
              begin
                QtdeEmt := inttostr(Quant[k]);
                if not ImprimirQtdEstoque then
                begin
                  QtdTemp := strtofloat(QtdeEmt);
                  if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                  	exit;
                  if Quant[k] <> QtdTemp then
                    QtdeEmt := inttostr(round(QtdTemp));
                end;
                for i := 0 to StrToInt(QtdeEmt) - 1 do
                begin
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 10) + ',0,1,2,3,N,"' + Copy(vDadosIni.vEmp.vnomeEmpresa, 1, 20) + '"');
                  WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(j + 70) + ',0,1,2,3,128,B,"' + CodBarra[k] + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 260) + ',0,1,1,2,N,"' + trim(Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30)) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 290) + ',0,1,1,2,N,"' + trim(Copy('MARCA: ' + grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 22)) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 15) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 320) + ',0,1,2,2,N,"TAM: ' + DescGrade[k] + ' ' + DescGrade1[k] + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 350) + ',0,1,1,1,N,"' + dataTemp + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 440) + ',0,1,3,3,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');

                  if (b = 405) then //or ((k = Length(Quant) - 1)) then
                  begin
                    WriteLn(Arquivo, 'P1');
                    WriteLn(Arquivo, 'N');
                  end;
                  if b = 5 then
                    b := 405
                  else if b = 405 then
                    b := 5;

                  if itmax >= 6 then
                  begin
                    WriteLn(Arquivo, 'ZT'); //ZT
                    WriteLn(Arquivo, 'q800');
                    WriteLn(Arquivo, 'Q600,24');
                    WriteLn(Arquivo, 'ON');
                    WriteLn(Arquivo, 'D15');
                    WriteLn(Arquivo, 'JF');
                    WriteLn(Arquivo, 'S2');
                    WriteLn(Arquivo, 'N');
                    itmax := 0;
                  end;
                  obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                    Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                    Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
                end;
              end;
            end;
          end;
        end;
      end
      else
      begin
        if ImprimirProdutosMarcados then
          QtdeEmt := '1'
        else
        begin
          QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
          QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
        end;
        buscas.Close;
        buscas.SQL.Text := 'select * from COD_GRADE_PROD P inner join GRADE G ' +
          ' on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
          ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
          ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
          ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and p.ativo=1';
        buscas.Open;
        buscas.FetchAll;
        if not buscas.IsEmpty then
        begin
          SetLength(CodBarra, Buscas.RecordCount);
          SetLength(DescGrade, Buscas.RecordCount);
          SetLength(DescGrade1, Buscas.RecordCount);
          SetLength(Quant, Buscas.RecordCount);
          buscas.First;
          i := 0;
          while not Buscas.EOF do
          begin
            DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
            DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);
            Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);

            CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
              buscas,
              grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
              grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
              buscas.FieldByName('COD_GRADE').AsInteger,
              grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);
              
//            CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, 2) + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString
//              + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + Buscas.FieldByName('COD_GRADE').AsString;

            inc(i);
            Buscas.Next;
          end;
        end
        else
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            if not ImprimirQtdEstoque then
            begin
              QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
              if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
              	exit;
              if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                QtdeEmt := inttostr(round(QtdTemp));
            end;
          end;
          SetLength(CodBarra, 1);
          SetLength(DescGrade, 1);
          SetLength(DescGrade1, 1);
          SetLength(Quant, 1);
          DescGrade[0] := '';
          DescGrade1[0] := '';
          Quant[0] := 0;

          CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
            buscas,
            grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
            0,
            grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
            true);

//          CodBarra[0] := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString);
        end;

        WriteLn(Arquivo, 'ZT'); //ZT
        WriteLn(Arquivo, 'q800');
        WriteLn(Arquivo, 'Q600,24');
        WriteLn(Arquivo, 'ON');
        WriteLn(Arquivo, 'D15');
        WriteLn(Arquivo, 'JF');
        WriteLn(Arquivo, 'S2');
        WriteLn(Arquivo, 'N');

        dataTemp := StringReplace(grid.DataSource.dataSet.FieldByName('DAT_CAD_PROD').AsString, '/', '', [rfReplaceAll]);
        dataTemp := StringReplace(dataTemp, '-', '', []);
        dataTemp := StringReplace(dataTemp, '.', '', []);

        if (Buscas.IsEmpty) then //and (not DTM1.QRYProdutosEST_F.IsNull) then
        begin
          for cont := 0 to StrToInt(QtdeEmt) - 1 do
          begin
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 10) + ',0,1,2,3,N,"' + Copy(vDadosIni.vEmp.vnomeEmpresa, 1, 20) + '"');
            WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(j + 70) + ',0,1,2,3,128,B,"' + CodBarra[0] + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 260) + ',0,1,1,2,N,"' + trim(Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30)) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 290) + ',0,1,1,2,N,"' + trim(Copy('MARCA: ' + grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 22)) + ' - ' + trim(copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 15)) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 320) + ',0,1,2,2,N,"TAM: ' + DescGrade[0] + ' ' + DescGrade1[0] + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 350) + ',0,1,1,1,N,"' + dataTemp + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 480) + ',0,1,3,3,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
            if (b = 405) then //or ((k = Length(Quant) - 1)) then
            begin
              WriteLn(Arquivo, 'P1');
              WriteLn(Arquivo, 'N');
            end;
            if b = 5 then
              b := 405
            else if b = 405 then
              b := 5;

            //inc(itmax);
            if itmax >= 6 then
            begin
              WriteLn(Arquivo, 'ZT'); //ZT
              WriteLn(Arquivo, 'q800');
              WriteLn(Arquivo, 'Q600,24');
              WriteLn(Arquivo, 'ON');
              WriteLn(Arquivo, 'D15');
              WriteLn(Arquivo, 'JF');
              WriteLn(Arquivo, 'S2');
              WriteLn(Arquivo, 'N');
              itmax := 0;
            end;
          end;
          if not ImprimirProdutosMarcados then
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for j := 1 to strtoint(QtdeEmt) do
              obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
          end;
        end
        else if (not Buscas.IsEmpty) then
        begin
          if ImprimirProdutosMarcados then
          begin
            if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
              and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
            begin
              gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
              cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
              for k := 0 to Length(Quant) - 1 do
              begin
                QtdeEmt := inttostr(Quant[k]);
                if not ImprimirQtdEstoque then
                begin
                  QtdTemp := strtofloat(QtdeEmt);
                  if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp) then
                  	exit;
                  if Quant[k] <> QtdTemp then
                    QtdeEmt := inttostr(round(QtdTemp));
                end;
                for i := 0 to StrToInt(QtdeEmt) - 1 do
                begin
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 10) + ',0,1,2,3,N,"' + Copy(vDadosIni.vEmp.vnomeEmpresa, 1, 20) + '"');
                  WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(j + 70) + ',0,1,2,3,128,B,"' + CodBarra[k] + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 260) + ',0,1,1,2,N,"' + trim(Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30)) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 290) + ',0,1,1,2,N,"' + trim(Copy('MARCA: ' + grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 22)) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 15) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 320) + ',0,1,2,2,N,"TAM: ' + DescGrade[k] + ' ' + DescGrade1[k] + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 350) + ',0,1,1,1,N,"' + dataTemp + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 440) + ',0,1,3,3,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');

                  if (b = 405) then //or ((k = Length(Quant) - 1)) then
                  begin
                    WriteLn(Arquivo, 'P1');
                    WriteLn(Arquivo, 'N');
                  end;
                  if b = 5 then
                    b := 405
                  else if b = 405 then
                    b := 5;

                  if itmax >= 6 then
                  begin
                    WriteLn(Arquivo, 'ZT'); //ZT
                    WriteLn(Arquivo, 'q800');
                    WriteLn(Arquivo, 'Q600,24');
                    WriteLn(Arquivo, 'ON');
                    WriteLn(Arquivo, 'D15');
                    WriteLn(Arquivo, 'JF');
                    WriteLn(Arquivo, 'S2');
                    WriteLn(Arquivo, 'N');
                    itmax := 0;
                  end;
                end;
              end;
            end;
          end
          else
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for k := 0 to Length(Quant) - 1 do
            begin
              QtdeEmt := inttostr(Quant[k]);
              if not ImprimirQtdEstoque then
              begin
                QtdTemp := strtofloat(QtdeEmt);
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade:', QtdTemp) then
                	exit;
                if Quant[k] <> QtdTemp then
                  QtdeEmt := inttostr(round(QtdTemp));
              end;
              for i := 0 to StrToInt(QtdeEmt) - 1 do
              begin
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 10) + ',0,1,2,3,N,"' + Copy(vDadosIni.vEmp.vnomeEmpresa, 1, 20) + '"');
                WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(j + 70) + ',0,1,2,3,128,B,"' + CodBarra[k] + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 260) + ',0,1,1,2,N,"' + trim(Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30)) + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 290) + ',0,1,1,2,N,"' + trim(Copy('MARCA: ' + grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 22)) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 15) + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 320) + ',0,1,2,2,N,"TAM: ' + DescGrade[k] + ' ' + DescGrade1[k] + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 350) + ',0,1,1,1,N,"' + dataTemp + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(j + 440) + ',0,1,3,3,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');

                if (b = 405) then //or ((k = Length(Quant) - 1)) then
                begin
                  WriteLn(Arquivo, 'P1');
                  WriteLn(Arquivo, 'N');
                end;
                if b = 5 then
                  b := 405
                else if b = 405 then
                  b := 5;

                if itmax >= 6 then
                begin
                  WriteLn(Arquivo, 'ZT'); //ZT
                  WriteLn(Arquivo, 'q800');
                  WriteLn(Arquivo, 'Q600,24');
                  WriteLn(Arquivo, 'ON');
                  WriteLn(Arquivo, 'D15');
                  WriteLn(Arquivo, 'JF');
                  WriteLn(Arquivo, 'S2');
                  WriteLn(Arquivo, 'N');
                  itmax := 0;
                end;
                obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                  Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                  Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
              end;
            end;
          end;
        end;
      end;
      inc(itmax);
      grid.DataSource.dataSet.Next
    end; //Fim do While
    if b = 405 then
      WriteLn(Arquivo, 'P1');
    CloseFile(Arquivo);
    HandlePrint;
  finally
    grid.DataSource.DataSet.EnableControls;
  end;
end;

procedure TRelatoriosEtiTermica._imprimirTermicaX(pCodModeloEti: integer);
var
  HandleArgox: THandle;
  cont, i, k, gp, j: integer;
  dataTemp, cp: string;
  vCodEmp_Grupo: string;
  vOK: Boolean;
begin
	if grid.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhum produto informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if somenteSelecionado then
  begin
  	vOK := False;

    try
      grid.DataSource.DataSet.DisableControls;
      grid.DataSource.DataSet.First;
      while not grid.DataSource.DataSet.Eof do
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        grid.DataSource.DataSet.Next;
      end;
    finally
    	grid.DataSource.DataSet.First;
  		grid.DataSource.DataSet.EnableControls;
    end;

    if not vOK then
    begin
    	Application.MessageBox(PChar('Nenhum produto selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if not vDadosIni.testarCodBarrasEtiqueta(somenteSelecionado, grid, True) then
    exit;

  try
    gp := 0;
    vConfEtiqueta := TStringList.create;
    vCodEti := pCodModeloEti;
    contadorEti := 0;
    //Validações para o modelo selecionado
    buscas.Close;
    buscas.SQL.Text := ' SELECT * FROM MODELOETITERMICA ' +
    	' WHERE ATIVO = 1 ' +
      ' AND CODIGO = ' + inttostr(vCodEti) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      vLScript := buscas.FieldByName('LSCRIPT').AsString;
      vModelo := buscas.FieldByName('DESCRICAO').AsString;
      vNumColunas := buscas.FieldByName('NUMCOLUNAS').AsInteger;
    end
    else
    begin
      Application.MessageBox(Pchar('As configurações do modelo de etiqueta selecionado estão vazias.' + chr(13) + 'Configure-as antes de prosseguir.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if not _existeItensEtiConfig then
      exit;

  	grid.DataSource.DataSet.DisableControls;
    grid.DataSource.DataSet.First;
    while not grid.DataSource.DataSet.EOF do
    begin
      if somenteSelecionado then
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        //if grid.SelectedRows.Current_RowSelected then
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
            QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
          end;
          buscas.Close;
          buscas.SQL.Text := 'select * from COD_GRADE_PROD P ' +
          	' inner join GRADE G on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
            ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
            ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
            ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' and p.ativo=1';
          buscas.Open;
          buscas.FetchAll;
          if not buscas.IsEmpty then
          begin
            SetLength(CodBarra, Buscas.RecordCount);
            SetLength(DescGrade, Buscas.RecordCount);
            SetLength(DescGrade1, Buscas.RecordCount);
            SetLength(Quant, Buscas.RecordCount);
            SetLength(vCodGrade, Buscas.RecordCount);
            buscas.First;
            i := 0;
            while not Buscas.EOF do
            begin
              DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
              DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);
              Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);
              vCodGrade[i] := Buscas.FieldByName('COD_GRADE').Asinteger;

              CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
              	buscas,
                grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
                grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
                buscas.FieldByName('COD_GRADE').AsInteger,
                grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);

//              if (vDadosIni.vEmp.vDigitosEmp = 2) or (vDadosIni.vEmp.vDigitosEmp = 1) then
//                CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, vDadosIni.vEmp.vDigitosEmp) + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                  + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString
//              else
//                CodBarra[i] := 'G-' + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                  + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString;

              inc(i);
              Buscas.Next;
            end;
          end
          else
          begin
            if ImprimirProdutosMarcados then
              QtdeEmt := '1'
            else
            begin
              if not ImprimirQtdEstoque then
              begin
                QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
                	exit;
                if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                  QtdeEmt := inttostr(round(QtdTemp));
              end;
            end;
            SetLength(CodBarra, 1);
            SetLength(DescGrade, 1);
            SetLength(DescGrade1, 1);
            SetLength(Quant, 1);
            SetLength(vCodGrade, 1);
            DescGrade[0] := '';
            DescGrade1[0] := '';
            Quant[0] := 0;
            vCodGrade[0] := 0;
            CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
              buscas,
              grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
              grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
              0,
              grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
              false);
//              vDadosIni.IfThen(pos('SUPERMERCADO', vModelo) > 0, false,
//              	vDadosIni.IfThen(vDadosIni.vProduto.vUsarNumFabCodBarra, false,
//              		true)));

//              CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);
//
//            if (pos('SUPERMERCADO', vModelo) > 0) then
//              CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString)
//            else
//              CodBarra[0] := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString);
          end;

          if (Buscas.IsEmpty) then
          begin
            for cont := 0 to StrToInt(QtdeEmt) - 1 do
              _enviarTextoTermicaX(CodBarra[0], 0); //sem grade
            if not ImprimirProdutosMarcados then
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
              for j := 1 to strtoint(QtdeEmt) do
                obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                  Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                  Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
            end;
          end
          else if (not Buscas.IsEmpty) then
          begin
            if ImprimirProdutosMarcados then
            begin
              if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
                and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
              begin
                gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
                cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
                for k := 0 to Length(Quant) - 1 do
                begin
                  QtdeEmt := inttostr(Quant[k]);
                  if not ImprimirQtdEstoque then
                  begin
                    QtdTemp := strtofloat(QtdeEmt);
                    if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                    	exit;
                    if Quant[k] <> QtdTemp then
                      QtdeEmt := inttostr(round(QtdTemp));
                  end;

                  for i := 0 to StrToInt(QtdeEmt) - 1 do
                    _enviarTextoTermicaX(CodBarra[k], vCodGrade[k]);
                end;
              end;
            end
            else
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
              for k := 0 to Length(Quant) - 1 do
              begin
                QtdeEmt := inttostr(Quant[k]);
                if not ImprimirQtdEstoque then
                begin
                  QtdTemp := strtofloat(QtdeEmt);
                  if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                  	exit;
                  if Quant[k] <> QtdTemp then
                    QtdeEmt := inttostr(round(QtdTemp));
                end;
                for i := 0 to StrToInt(QtdeEmt) - 1 do
                begin
                  _enviarTextoTermicaX(CodBarra[k], vCodGrade[k]);
                  obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                    Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                    Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
                end;
              end;
            end;
          end;
        end;
      end
      else
      begin
        if ImprimirProdutosMarcados then
          QtdeEmt := '1'
        else
        begin
          QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
          QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
        end;
        buscas.Close;
        buscas.SQL.Text := 'select * from COD_GRADE_PROD P inner join GRADE G ' +
          ' on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
          ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
          ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
          ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and p.ativo=1';
        buscas.Open;
        buscas.FetchAll;
        if not buscas.IsEmpty then
        begin
          SetLength(CodBarra, Buscas.RecordCount);
          SetLength(DescGrade, Buscas.RecordCount);
          SetLength(DescGrade1, Buscas.RecordCount);
          SetLength(Quant, Buscas.RecordCount);
          SetLength(vCodGrade, Buscas.RecordCount);
          buscas.First;
          i := 0;
          while not Buscas.EOF do
          begin
            DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
            DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);
            Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);
            vCodGrade[i] := Buscas.FieldByName('COD_GRADE').AsInteger;

            CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
              buscas,
              grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
              grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
              buscas.FieldByName('COD_GRADE').AsInteger,
              grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);
              
//            if (vDadosIni.vEmp.vDigitosEmp = 2) or (vDadosIni.vEmp.vDigitosEmp = 1) then
//              CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, vDadosIni.vEmp.vDigitosEmp) + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString
//            else
//              CodBarra[i] := 'G-' + vDadosIni.StrZero(grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString, vDadosIni.vEmp.vDidgitosGrup)
//                + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + Buscas.FieldByName('COD_GRADE').AsString;

            inc(i);
            Buscas.Next;
          end;
        end
        else
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            if not ImprimirQtdEstoque then
            begin
              QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
              if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
              	exit;
              if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                QtdeEmt := inttostr(round(QtdTemp));
            end;
          end;
          SetLength(CodBarra, 1);
          SetLength(DescGrade, 1);
          SetLength(DescGrade1, 1);
          SetLength(Quant, 1);
          SetLength(vCodGrade, 1);
          DescGrade[0] := '';
          DescGrade1[0] := '';
          Quant[0] := 0;
          vCodGrade[0] := 0;

          CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
            buscas,
            grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
            0,
            grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
            false);
//            vDadosIni.IfThen(pos('SUPERMERCADO', vModelo) > 0, false,
//              vDadosIni.IfThen(vDadosIni.vProduto.vUsarNumFabCodBarra, false,
//              	true)));

//          CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);

//          if (pos('SUPERMERCADO', vModelo) > 0) then
//            CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString)
//          else
//            CodBarra[0] := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString);
        end;

        if (Buscas.IsEmpty) then //and (not DTM1.QRYProdutosEST_F.IsNull) then
        begin
          for cont := 0 to StrToInt(QtdeEmt) - 1 do
            _enviarTextoTermicaX(CodBarra[0], 0); //sem grade
          if not ImprimirProdutosMarcados then
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for j := 1 to strtoint(QtdeEmt) do
              obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
          end;
        end
        else if (not Buscas.IsEmpty) then
        begin
          if ImprimirProdutosMarcados then
          begin
            if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
              and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
            begin
              gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
              cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
              for k := 0 to Length(Quant) - 1 do
              begin
                QtdeEmt := inttostr(Quant[k]);
                if not ImprimirQtdEstoque then
                begin
                  QtdTemp := strtofloat(QtdeEmt);
                  if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                  	exit;
                  if Quant[k] <> QtdTemp then
                    QtdeEmt := inttostr(round(QtdTemp));
                end;
                for i := 0 to StrToInt(QtdeEmt) - 1 do
                  _enviarTextoTermicaX(CodBarra[k], vCodGrade[k]);
              end;
            end;
          end
          else
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for k := 0 to Length(Quant) - 1 do
            begin
              QtdeEmt := inttostr(Quant[k]);
              if not ImprimirQtdEstoque then
              begin
                QtdTemp := strtofloat(QtdeEmt);
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta para a Grade:' + DescGrade[k], copy(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString, 1, 15) + ' - Quantidade Grade:', QtdTemp) then
                	exit;
                if Quant[k] <> QtdTemp then
                  QtdeEmt := inttostr(round(QtdTemp));
              end;
              for i := 0 to StrToInt(QtdeEmt) - 1 do
              begin
                _enviarTextoTermicaX(CodBarra[k], vCodGrade[k]);
                obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                  Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                  Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
              end;
            end;
          end;
        end;
      end;
      grid.DataSource.dataSet.Next
    end; //Fim do While
  finally
    grid.DataSource.dataSet.EnableControls;
    if contadorEti > 0 then
    begin
      if contadorEti mod vNumColunas <> 0 then
      begin
      	if vLScript = 'ZPL' then
          WriteLn(Arquivo, '^PQ1,0,1,Y^XZ')
        else if vLScript = 'EPL2' then
          WriteLn(Arquivo, 'P1')
        else begin
          WriteLn(Arquivo, 'Q0001');
          WriteLn(Arquivo, 'E');
        end;
        CloseFile(Arquivo);
        HandlePrint;
      end;
    end;
    FreeAndNil(vConfEtiqueta);
  end;
end;

procedure TRelatoriosEtiTermica._imprimirTermicaXRapido(pCodModeloEti: integer; pDtSet: TDataSet; pImprimirProdutosMarcados: Boolean);
var
  i: integer;
  dataTemp, cp: string;
  vCodEmp_Grupo: string;
  vOK: Boolean;
begin
	if pDtSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhum produto informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

	if pImprimirProdutosMarcados then
  begin
  	vOK := False;

    try
      pDtSet.DisableControls;
      pDtSet.First;
      while not pDtSet.Eof do
      begin
        if pDtSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        pDtSet.Next;
      end;
    finally
      pDtSet.First;
  		pDtSet.EnableControls;
    end;

    if not vOK then
    begin
    	Application.MessageBox(PChar('Nenhum produto selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if not vDadosIni.testarCodBarrasEtiqueta(pImprimirProdutosMarcados, pDtSet, True) then
    exit;

  try
    vConfEtiqueta := TStringList.create;
    vCodEti := pCodModeloEti;
    contadorEti := 0;
    //Validações para o modelo selecionado
    buscas.Close;
    buscas.SQL.Text := ' SELECT * FROM MODELOETITERMICA ' +
    	' WHERE ATIVO = 1 ' +
      ' AND CODIGO = ' + inttostr(vCodEti) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      vLScript := buscas.FieldByName('LSCRIPT').AsString;
      vModelo := buscas.FieldByName('DESCRICAO').AsString;
      vNumColunas := buscas.FieldByName('NUMCOLUNAS').AsInteger;
    end
    else
    begin
      Application.MessageBox(Pchar('As configurações do modelo de etiqueta selecionado estão vazias.' + chr(13) + 'Configure-as antes de prosseguir.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if not _existeItensEtiConfig then
      exit;

    dtSetEti := TClientDataSet(pDtSet);
    dtSetEti.First;
    while not dtSetEti.Eof do
    begin
      if pImprimirProdutosMarcados then
      begin
      	if dtSetEti.FieldByName('sel').AsString = 'S' then
          for I := 1 to dtSetEti.FieldByName('qtde').AsInteger do
            _enviarTextoTermicaX2('');
      end
      else
      begin
        for I := 1 to dtSetEti.FieldByName('qtde').AsInteger do
          _enviarTextoTermicaX2('');
      end;
      dtSetEti.Next;
    end;

  finally
    if contadorEti mod vNumColunas <> 0 then
    begin
      if vLScript = 'ZPL' then
        WriteLn(Arquivo, '^PQ1,0,1,Y^XZ')
      else if vLScript = 'EPL2' then
      	WriteLn(Arquivo, 'P1')
      else
      begin
        WriteLn(Arquivo, 'Q0001');
        WriteLn(Arquivo, 'E');
      end;
      CloseFile(Arquivo);
      HandlePrint;
    end;
  end;
end;

procedure TRelatoriosEtiTermica._limparMemoriaTermicaX;
var
  i: integer;
begin
  if vConfEtiqueta.Count = 0 then
  begin //aqui só entrará uma vez
    vQuery.Close;
    vQuery.SQL.Text := ' SELECT * FROM MODELOETITERMICA ' +
      ' WHERE CODIGO = ' + inttostr(vCodEti) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
    vQuery.Open;
    if not vQuery.IsEmpty then
    begin
      vConfEtiqueta.Clear;
      vConfEtiqueta.Text := vQuery.FieldByName('CONFIGMODELOETI').AsWideString;
      vLScript := vQuery.FieldByName('LSCRIPT').AsString;
      vModelo := vQuery.FieldByName('DESCRICAO').AsString;
      vNumColunas := vQuery.FieldByName('NUMCOLUNAS').AsInteger;
      AssignFile(Arquivo, GetPrintName);
      Rewrite(Arquivo);
      for I := 0 to vConfEtiqueta.Count - 1 do
      begin
        WriteLn(Arquivo, vConfEtiqueta[i]);
      end;
    end
    else
      Application.MessageBox(Pchar('As configurações do modelo de etiqueta selecionado estão vazias.' + chr(13) + 'Configure-as antes de prosseguir.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    vQuery.close;
  end
  else
  begin
//    CloseFile(Arquivo);
    AssignFile(Arquivo, GetPrintName);
    Rewrite(Arquivo);
    for I := 0 to vConfEtiqueta.Count - 1 do
      WriteLn(Arquivo, vConfEtiqueta[i]);
  end;
end;

function TRelatoriosEtiTermica._retornaValorCalculado(pTextoCalc: string;
  dtSet: TDataSet): string;
var
  vOperando1, vOperando2: double;
  vValorCalculado: real;
  vOperador, vStrTemp: string;
  contador: integer;
begin
  contador := 1;
  vOperador := '';
  vStrTemp := '';
  vValorCalculado := 0;
  vOperando1 := 0;
  vOperando2 := 0;
  if Pos('|', pTextoCalc) = 1 then
    pTextoCalc := Copy(pTextoCalc, 2, length(pTextoCalc) - 1);
  while pTextoCalc <> '' do
  begin
    if Pos('|', pTextoCalc) > 0 then
      vStrTemp := Copy(pTextoCalc, 1, Pos('|', pTextoCalc) - 1)
    else
    	vStrTemp := Copy(pTextoCalc, 1, length(pTextoCalc));
    if not (odd(contador)) and (contador > 3) then
      vOperador := vStrTemp
    else if odd(contador) and (contador > 3) then
    begin
      try
        vOperando2 := StrToFloat(vStrTemp);
      except
        if dtSet <> nil then
          vOperando2 := dtSet.FieldByName(vStrTemp).AsFloat
        else vOperando2 := dtSetEti.FieldByName(vStrTemp).AsFloat;
      end;
      if trim(vOperador) = '+' then
        vValorCalculado := vValorCalculado + vOperando2
      else if trim(vOperador) = '-' then
        vValorCalculado := vValorCalculado - vOperando2
      else if trim(vOperador) = '*' then
        vValorCalculado := vValorCalculado * vOperando2
      else if trim(vOperador) = '/' then
      begin
        if vOperando2 <> 0 then
          vValorCalculado := vValorCalculado / vOperando2;
      end;
    end
    else if (contador mod 3) = 1 then
    begin
      try
        vOperando1 := StrToFloat(vStrTemp);
      except
        if dtSet <> nil then
          vOperando1 := dtSet.FieldByName(vStrTemp).AsFloat
        else vOperando1 := dtSetEti.FieldByName(vStrTemp).AsFloat;
      end;
    end
    else if (contador mod 3) = 2 then
      vOperador := vStrTemp
    else if (contador mod 3) = 0 then
    begin
      try
        vOperando2 := StrToFloat(vStrTemp);
      except
        if dtSet <> nil then
          vOperando2 := dtSet.FieldByName(vStrTemp).AsFloat
        else
        	vOperando2 := dtSetEti.FieldByName(vStrTemp).AsFloat;
      end;
      if trim(vOperador) = '+' then
        vValorCalculado := vOperando1 + vOperando2
      else if trim(vOperador) = '-' then
        vValorCalculado := vOperando1 - vOperando2
      else if trim(vOperador) = '*' then
        vValorCalculado := vOperando1 * vOperando2
      else if trim(vOperador) = '/' then
      begin
        if vOperando2 <> 0 then
          vValorCalculado := vOperando1 / vOperando2;
      end;
    end;
    if Pos('|', pTextoCalc) > 0 then
      pTextoCalc := Copy(pTextoCalc, Pos('|', pTextoCalc) + 1, length(pTextoCalc))
    else
    	pTextoCalc := '';
    inc(contador);
  end;
  result := FloatToStr(vValorCalculado);
end;

procedure TRelatoriosEtiTermica.imprimirUmaColuna;
var
  cont, i, k, j, gp: integer;
  dataTemp, cp: string;
  vOK: Boolean;
begin
	if grid.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhum produto informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if somenteSelecionado then
  begin
  	vOK := False;

    try
      grid.DataSource.DataSet.DisableControls;
      grid.DataSource.DataSet.First;
      while not grid.DataSource.DataSet.Eof do
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        grid.DataSource.DataSet.Next;
      end;
    finally
    	grid.DataSource.DataSet.First;
  		grid.DataSource.DataSet.EnableControls;
    end;

    if not vOK then
    begin
    	Application.MessageBox(PChar('Nenhum produto selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if not vDadosIni.testarCodBarrasEtiqueta(somenteSelecionado, grid, True) then
    exit;

	try
  	grid.DataSource.DataSet.DisableControls;
    grid.DataSource.DataSet.First;
    AssignFile(Arquivo, GetPrintName);
    Rewrite(Arquivo);
    gp := 0;
    b := 0;
    j := 0;
    while not grid.DataSource.dataSet.EOF do
    begin
      if somenteSelecionado then
      begin
        if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        //if grid.SelectedRows.Current_RowSelected then
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
            QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
          end;
          WriteLn(Arquivo, 'ZT'); //ZT
          WriteLn(Arquivo, 'q400');
          WriteLn(Arquivo, 'Q200,24');
          WriteLn(Arquivo, 'ON');
          WriteLn(Arquivo, 'D10');
          WriteLn(Arquivo, 'JF');
          WriteLn(Arquivo, 'S5');
          WriteLn(Arquivo, 'N');

          buscas.Close;
          buscas.SQL.Text := 'select * from COD_GRADE_PROD P inner join GRADE G ' +
            ' on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
            ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
            ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
            ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and p.ativo=1';
          buscas.Open;
          buscas.FetchAll;
          if not buscas.IsEmpty then
          begin
            SetLength(CodBarra, Buscas.RecordCount);
            SetLength(DescGrade, Buscas.RecordCount);
            SetLength(DescGrade1, Buscas.RecordCount);
            SetLength(Quant, Buscas.RecordCount);
            buscas.First;
            i := 0;
            while not Buscas.EOF do
            begin
              Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);
              QtdTemp := round(Buscas.FieldByName('QTDE').AsFloat);
              if not ImprimirQtdEstoque then
              begin
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' Grade: ' + copy(trim(Buscas.FieldByName('DESCRICAO').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
                	exit;
                if round(Buscas.FieldByName('QTDE').AsFloat) <> QtdTemp then
                  Quant[i] := round(QtdTemp);
              end;

              DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
              DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);

              CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
                buscas,
                grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
                grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
                buscas.FieldByName('COD_GRADE').AsInteger,
                grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);

//              CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, 2) + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString
//                + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + Buscas.FieldByName('COD_GRADE').AsString;

              inc(i);
              Buscas.Next;
            end;
          end
          else
          begin
            if ImprimirProdutosMarcados then
              QtdeEmt := '1'
            else
            begin
              if not ImprimirQtdEstoque then
              begin
                QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
                if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
                	exit;
                if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                  QtdeEmt := inttostr(round(QtdTemp));
              end;
            end;
            SetLength(CodBarra, 1);
            SetLength(DescGrade, 1);
            SetLength(DescGrade1, 1);
            SetLength(Quant, 1);
            DescGrade[0] := '';
            DescGrade1[0] := '';
            Quant[0] := 0;

            CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
              buscas,
              grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
              grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
              0,
              grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
              false);

//            CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);
          end;
          dataTemp := StringReplace(grid.DataSource.dataSet.FieldByName('DAT_CAD_PROD').AsString, '/', '', [rfReplaceAll]);
          dataTemp := StringReplace(dataTemp, '-', '', []);
          dataTemp := StringReplace(dataTemp, '.', '', []);

          if (Buscas.IsEmpty) and (strtoint(QtdeEmt) >= 1) then
          begin
            WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(10) + ',0,1,2,2,64,B,"' + CodBarra[0] + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(105) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(125) + ',0,2,1,1,N,"MARCA: ' + copy(grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 10) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 12) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(145) + ',0,2,1,1,N,"TAM:' + Copy(DescGrade[0], 1, 15) + '   ' + Copy(DescGrade1[0], 1, 15) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(170) + ',0,4,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
            WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(185) + ',0,1,1,1,N,"                           ' + dataTemp + '"');
            WriteLn(Arquivo, 'P' + QtdeEmt + '');
            if not ImprimirProdutosMarcados then
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
              for j := 1 to strtoint(QtdeEmt) do
                obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                  Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                  Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                  Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
            end;
          end
          else if (strtofloat(QtdeEmt) >= 1) then
          begin
            if ImprimirProdutosMarcados then
            begin
              if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
                and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
              begin
                gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
                cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
                for k := 0 to Length(Quant) - 1 do
                begin
                  if (Quant[k] >= 1) then
                  begin
                    WriteLn(Arquivo, 'N');
                    WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(10) + ',0,1,2,2,64,B,"' + CodBarra[k] + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(105) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30) + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(125) + ',0,2,1,1,N,"MARCA: ' + copy(grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 10) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 12) + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(145) + ',0,2,1,1,N,"TAM:' + Copy(DescGrade[k], 1, 15) + '   ' + Copy(DescGrade1[k], 1, 15) + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(170) + ',0,4,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
                    WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(185) + ',0,1,1,1,N,"                           ' + dataTemp + '"');
                    WriteLn(Arquivo, 'P' + inttostr(Quant[k]) + '');
                  end;
                end;
              end;
            end
            else
            begin
              ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
                ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
                ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));

              for k := 0 to Length(Quant) - 1 do
              begin
                if (Quant[k] >= 1) then
                begin
                  WriteLn(Arquivo, 'N');
                  WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(10) + ',0,1,2,2,64,B,"' + CodBarra[k] + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(105) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(125) + ',0,2,1,1,N,"MARCA: ' + copy(grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 10) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 12) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(145) + ',0,2,1,1,N,"TAM:' + Copy(DescGrade[k], 1, 15) + '   ' + Copy(DescGrade1[k], 1, 15) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(170) + ',0,4,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(185) + ',0,1,1,1,N,"                           ' + dataTemp + '"');
                  WriteLn(Arquivo, 'P' + inttostr(Quant[k]) + '');
                  for j := 1 to Quant[k] do
                    obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                      Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                      Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                      Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                      Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                      Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
                end;
              end;
            end;
          end;
        end;
      end
      else
      begin
        if ImprimirProdutosMarcados then
          QtdeEmt := '1'
        else
        begin
          QtdeEmt := Floattostr(grid.DataSource.dataSet.FieldByName('Est_F').AsFloat);
          QtdeEmt := inttostr(round(strtofloat(QtdeEmt)));
        end;
        WriteLn(Arquivo, 'ZT'); //ZT
        WriteLn(Arquivo, 'q400');
        WriteLn(Arquivo, 'Q200,24');
        WriteLn(Arquivo, 'ON');
        WriteLn(Arquivo, 'D10');
        WriteLn(Arquivo, 'JF');
        WriteLn(Arquivo, 'S5');
        WriteLn(Arquivo, 'N');

        buscas.Close;
        buscas.SQL.Text := 'select * from COD_GRADE_PROD P inner join GRADE G ' +
          ' on P.COD_GRADE = G.COD_GRADE and P.COD_EMPRESA = G.COD_EMPRESA ' +
          ' where P.GRUPO_PROD = ' + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString +
          ' and P.COD_PROD = ' + QuotedStr(trim(grid.DataSource.dataSet.FieldByName('cod_prod').AsString)) +
          ' and P.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and p.ativo=1';
        buscas.Open;
        buscas.FetchAll;
        if not buscas.IsEmpty then
        begin
          SetLength(CodBarra, Buscas.RecordCount);
          SetLength(DescGrade, Buscas.RecordCount);
          SetLength(DescGrade1, Buscas.RecordCount);
          SetLength(Quant, Buscas.RecordCount);
          buscas.First;
          i := 0;
          while not Buscas.EOF do
          begin
            Quant[i] := round(Buscas.FieldByName('QTDE').AsFloat);
            QtdTemp := round(Buscas.FieldByName('QTDE').AsFloat);
            if not ImprimirQtdEstoque then
            begin
              if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' Grade: ' + copy(trim(Buscas.FieldByName('DESCRICAO').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
              	exit;
              if round(Buscas.FieldByName('QTDE').AsFloat) <> QtdTemp then
                Quant[i] := round(QtdTemp);
            end;

            DescGrade[i] := trim(Buscas.FieldByName('DESCRICAO').AsString);
            DescGrade1[i] := trim(Buscas.FieldByName('DESCRICAO1').AsString);

            CodBarra[i] := vDadosIni.retornaCodBarraEtiqueta(
              buscas,
              grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
              grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
              buscas.FieldByName('COD_GRADE').AsInteger,
              grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);

//            CodBarra[i] := 'G-' + vDadosIni.StrZero(vDadosIni.CodEmpresa, 2) + grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsString
//              + trim(grid.DataSource.dataSet.FieldByName('COD_PROD').AsString) + '/' + Buscas.FieldByName('COD_GRADE').AsString;

            inc(i);
            Buscas.Next;
          end;
        end
        else
        begin
          if ImprimirProdutosMarcados then
            QtdeEmt := '1'
          else
          begin
            if not ImprimirQtdEstoque then
            begin
              QtdTemp := grid.DataSource.dataSet.FieldByName('Est_F').AsFloat;
              if not vDadosIni.InputValoReal('Quantidade de Etiqueta', copy(trim(grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 15) + ' - Quantidade:', QtdTemp) then
              	exit;
              if grid.DataSource.dataSet.FieldByName('Est_F').AsFloat <> QtdTemp then
                QtdeEmt := inttostr(round(QtdTemp));
            end;
          end;
          SetLength(CodBarra, 1);
          SetLength(DescGrade, 1);
          SetLength(DescGrade1, 1);
          SetLength(Quant, 1);
          DescGrade[0] := '';
          DescGrade1[0] := '';
          Quant[0] := 0;

          CodBarra[0] := vDadosIni.retornaCodBarraEtiqueta(
            buscas,
            grid.DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            grid.DataSource.dataSet.FieldByName('COD_PROD').AsString,
            0,
            grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString,
            false);
            
//          CodBarra[0] := trim(grid.DataSource.dataSet.FieldByName('NUM_FAB_PROD').AsString);
        end;
        dataTemp := StringReplace(grid.DataSource.dataSet.FieldByName('DAT_CAD_PROD').AsString, '/', '', [rfReplaceAll]);
        dataTemp := StringReplace(dataTemp, '-', '', []);
        dataTemp := StringReplace(dataTemp, '.', '', []);

        if (Buscas.IsEmpty) and (strtoint(QtdeEmt) >= 1) then
        begin
          WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(10) + ',0,1,2,2,64,B,"' + CodBarra[0] + '"');
          WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(105) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30) + '"');
          WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(125) + ',0,2,1,1,N,"MARCA: ' + copy(grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 10) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 12) + '"');
          WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(145) + ',0,2,1,1,N,"TAM:' + Copy(DescGrade[0], 1, 15) + '   ' + Copy(DescGrade1[0], 1, 15) + '"');
          WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(170) + ',0,4,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
          WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(185) + ',0,1,1,1,N,"                           ' + dataTemp + '"');
          WriteLn(Arquivo, 'P' + QtdeEmt + '');
          if not ImprimirProdutosMarcados then
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for j := 1 to strtoint(QtdeEmt) do
              obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
          end;
        end
        else if (strtofloat(QtdeEmt) >= 1) then
        begin
          if ImprimirProdutosMarcados then
          begin
            if (gp <> grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger)
              and (cp <> trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring)) then
            begin
              gp := grid.DataSource.dataSet.FieldByName('GRUPO_PROD').asinteger;
              cp := trim(grid.DataSource.dataSet.FieldByName('COD_PROD').asstring);
              for k := 0 to Length(Quant) - 1 do
              begin
                if (Quant[k] >= 1) then
                begin
                  WriteLn(Arquivo, 'N');
                  WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(10) + ',0,1,2,2,64,B,"' + CodBarra[k] + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(105) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(125) + ',0,2,1,1,N,"MARCA: ' + copy(grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 10) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 12) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(145) + ',0,2,1,1,N,"TAM:' + Copy(DescGrade[k], 1, 15) + '   ' + Copy(DescGrade1[k], 1, 15) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(170) + ',0,4,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
                  WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(185) + ',0,1,1,1,N,"                           ' + dataTemp + '"');
                  WriteLn(Arquivo, 'P' + inttostr(Quant[k]) + '');
                end;
              end;
            end;
          end
          else
          begin
            ExecutaComandosSqlExec('delete from IMP_BAR_PROD where COD_EMPRESA =' + vDadosIni.codEmpresa +
              ' and ativo=1 and grupo_prod=' + Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString +
              ' and cod_prod = ' + QuotedStr(trim(grid.DataSource.DataSet.FieldByName('COD_PROD').AsString)));
            for k := 0 to Length(Quant) - 1 do
            begin
              if (Quant[k] >= 1) then
              begin
                WriteLn(Arquivo, 'N');
                WriteLn(Arquivo, 'B' + IntToStr(b + 15) + ',' + IntToStr(10) + ',0,1,2,2,64,B,"' + CodBarra[k] + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(105) + ',0,2,1,1,N,"' + Copy((grid.DataSource.dataSet.FieldByName('DESCR_PROD').AsString), 1, 30) + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(125) + ',0,2,1,1,N,"MARCA: ' + copy(grid.DataSource.dataSet.FieldByName('MARCA_P').AsString, 1, 10) + ' - ' + copy(grid.DataSource.dataSet.FieldByName('APLICACAO_PROD').AsString, 1, 12) + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(145) + ',0,2,1,1,N,"TAM:' + Copy(DescGrade[k], 1, 15) + '   ' + Copy(DescGrade1[k], 1, 15) + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(170) + ',0,4,1,1,N,"' + Format('%m', [grid.DataSource.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency]) + '"');
                WriteLn(Arquivo, 'A' + IntToStr(b + 15) + ',' + IntToStr(185) + ',0,1,1,1,N,"                           ' + dataTemp + '"');
                WriteLn(Arquivo, 'P' + inttostr(Quant[k]) + '');
                for j := 1 to Quant[k] do
                  obRelSimples.gravaEtiProdTemp(Grid.DataSource.DataSet.FieldByName('NUM_FAB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('DESCR_PROD').AsString, Grid.DataSource.DataSet.FieldByName('EMB_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('LOCACAO_PROD_1').AsString,
                    Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                    Grid.DataSource.DataSet.FieldByName('APLICACAO_PROD').AsString, Grid.DataSource.DataSet.FieldByName('UNIDADE').AsString,
                    Grid.DataSource.DataSet.FieldByName('PREC_TAB_PROD').AsFloat, Grid.DataSource.DataSet.FieldByName('PREC_30_PROD').AsFloat);
              end;
            end;
          end;
        end;
      end;
      grid.DataSource.dataSet.Next;
    end;
    CloseFile(Arquivo);
    HandlePrint;
  finally
    grid.DataSource.DataSet.EnableControls;
  end;
end;

constructor TRelatoriosEtiTermica.create;
begin
  //  dataSet := TClientDataSet(DtmProdutos.CdsProdutos);
  buscas := TIBQuery(DtmProdutos.qrBuscasP);
  transacao := TIBTransaction(DtmProdutos.IBTransProdutos);
  obRelSimples := TRelatoriosSimples.create;
  vQuery := TIBQuery.Create(nil);
  vQuery.Database := DtmProdutos.qrBuscasP.Database;
  vQuery.Transaction := transacao;

  AbuscasAux := TIBQuery.Create(nil);
  AbuscasAux.Database := DtmProdutos.qrBuscasP.Database;
  AbuscasAux.Transaction := transacao;
  vCodEti := 0;
end;

{ TIndiceTec }

procedure TIndiceTec.bandaDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{Se for o terceiro relatório não precisa passar pela seleção, pois ele já seleciona detro do dataset temporario}
  if (not (_pIndiceRel = 3)) then
  begin
    if _SomenteSelecionado then
      PrintBand := grid.DataSource.DataSet.FieldByName('sel').AsString = 'S';
      //PrintBand := grid.SelectedRows.Current_RowSelected;
    if not PrintBand then
      exit;
  end;
end;

constructor TIndiceTec.create;
begin
  buscas := TIBQuery(DtmProdutos.qrBuscasP);
  rdIndice := TRDprint(dtmProdutos.rdpIndice);

  _pRelCab := TIBQuery(dtmProdutos.qrIndiceRel);
  _pRelDetalhes := TIBQuery(dtmProdutos.qrIndicesDetalhesRel);
  _pRelRec := TIBQuery(dtmProdutos.qrIndiceRec);
  _pRelReqOs := TIBQuery(dtmProdutos.qrIndReqOs);
  _pRelNFProd := TIBQuery(dtmProdutos.qrProdNFEnt);

  dsSetTempNFProd := TClientDataSet(DtmProdutos.Cdsprodnftemp);
  dtSetProdVal := TClientDataSet(DtmProdutos.cdsProdVal);
end;

procedure TIndiceTec._NovaPaginaPrint;
begin
  rdIndice.ImpF(_linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  _linha := _linha + 1;
//  if not vImprimirMedia then
 //   print.ImpF(_linha, 1, 'TABELA DE PECAS COM ULTIMA COMPRA', [normal, negrito]);
  _linha := _linha + 2;
  rdIndice.ImpF(_linha, 1, 'DATA: ' + datetostr(date), [comp17]);
  rdIndice.ImpF(_linha, 100, 'PAGINA: ' + vDadosIni.strzero(_vpag, 4), [comp17]);
  _linha := _linha + 1;
  _vpag := _vpag + 1;
 // if not vImprimirMedia then
 // begin
  rdIndice.ImpF(_linha, 1, vDadosIni.replicate('=', 160), [comp20]);
  _linha := _linha + 1;
  rdIndice.ImpF(_linha, 1, 'COD.', [comp20]);
  rdIndice.ImpF(_linha, 18, 'DESCRICAO', [comp20]);
  rdIndice.ImpF(_linha, 68, 'RECEITA', [comp20]);
  rdIndice.ImpF(_linha, 80, 'QTDE', [comp20]);
   // print.ImpF(_linha, 92, 'CST REAL', [comp20]);
    //print.ImpF(_linha, 104, 'VALOR VND', [comp20]);
   // print.ImpF(_linha, 116, 'DT.ULT.COMP', [comp20]);
    //print.ImpF(_linha, 130, 'QTDE ULT.CMP', [comp20]);
    //print.ImpF(_linha, 143, 'ATRIBUTOS', [comp20]);
  _linha := _linha + 1;
  rdIndice.ImpF(_linha, 1, vDadosIni.replicate('=', 160), [comp20]);
  _linha := _linha + 1;
  //end;
end;

function TIndiceTec._PreencherNFProd: boolean;
var
  _ValorProd: Currency;
  linhaselecionada: boolean;
  vEst: Extended;
  vMEdia: TMedia;
begin

{5}if dsSetTempNFProd.Tag <> 1 then
  begin
    dsSetTempNFProd.CreateDataSet;
    dsSetTempNFProd.Tag := 1;
  end; {5}
  dsSetTempNFProd.EmptyDataSet;



  linhaSelecionada := true;
  dtSet.First;
      {1}while not dtSet.eof do
  begin

    if _SomenteSelecionado then
    begin
      if grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
      //if grid.SelectedRows.Current_RowSelected then
        linhaSelecionada := true
      else
        linhaSelecionada := false;
    end;

     {7}if (linhaselecionada) then
    begin

      dtSetProdVal.Insert;
      dtSetProdVal.FieldByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
      dtSetProdVal.FieldByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;
      dtSetProdVal.FieldByName('NUM_FAB_PROD').AsString := dtSet.FieldByName('NUM_FAB_PROD').AsString;
      dtSetProdVal.FieldByName('DESCR_PROD').AsString := dtSet.FieldByName('DESCR_PROD').AsString;
      dtSetProdVal.FieldByName('EST_F').AsFloat := dtSet.FieldByName('EST_F').AsFloat -
        vDadosIni.getPendenciasEstoque(dtSet.FieldByName('grupo_prod').AsInteger, dtSet.FieldByName('cod_prod').AsString,
        -1, '', buscas);
      dtSetProdVal.FieldByName('UNIDADE').AsString := dtSet.FieldByName('UNIDADE').AsString;
      dtSetProdVal.FieldByName('LOCACAO_PROD').AsString := dtSet.FieldByName('LOCACAO_PROD').AsString;
      dtSetProdVal.FieldByName('LOCACAO_PROD_1').AsString := dtSet.FieldByName('LOCACAO_PROD_1').AsString;
      dtSetProdVal.FieldByName('cod_empresa').AsString := dtSet.FieldByName('cod_empresa').AsString;

      _pRelNFProd.Close;
      _pRelNFProd.SQL.Text := 'select nf.num_nf,nfi.quantidade, '
        + ' nfi.data_validade,nfi.referencia,nfi.num_fab_fornecedor,cli.nome_cliente, '
        + ' cli.razao from notafiscal_item nfi inner join notafiscal nf '
        + ' on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa '
        + ' inner join clientes cli on cli.cod_cliente = nf.cod_cliente and nf.cod_empresa = cli.cod_empresa  '
        + ' where tipo_item = ''P'' and NATUREZA_NF = ''E'' and nfi.cod_prod=:cod_prod '
        + ' and nfi.grupo_prod =:grupo_prod and nf.cod_empresa = ' + vDadosIni.codEmpresa
        + ' order by nf.DATA_LANC desc';

      _pRelNFProd.ParamByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
      _pRelNFProd.ParamByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;


      _pRelNFProd.Open;


      vMEdia := TMedia.create;
      vEst := dtSet.FieldByName('EST_F').AsFloat - vMEdia.getQuantidadePendenteReqOS(
        dtSet.FieldByName('grupo_prod').AsInteger,
        dtSet.FieldByName('cod_prod').AsString);

//      {3}if (dtSet.FieldByName('EST_F').AsFloat > 0) then
//      if vEst > 0 then
      if vDadosIni.StrToFloatFormat(vest, 3) > 0.000 then
      begin

//      _ValorProd := dtSet.FieldByName('EST_F').AsFloat;
        _ValorProd := vEst;

      {Insere os sub itens}
      {2}while not _pRelNFProd.eof do
        begin

          if (_ValorProd > 0) then
          begin

           {Insere a menor data de validade no produto para ordenar por data de validade}

           {13}if (not (_pRelNFProd.FieldByName('data_validade').IsNull)) then
            begin
           {12}if (not (dtSetProdVal.FieldByName('DATAVALIDADE').IsNull)) then
              begin

           {11}if (dtSetProdVal.FieldByName('DATAVALIDADE').AsDateTime >
                  _pRelNFProd.FieldByName('data_validade').AsDateTime) then
                begin
                  dtSetProdVal.FieldByName('DATAVALIDADE').Value :=
                    _pRelNFProd.FieldByName('data_validade').Value;

                end; {11}


              end {12}
              else
              begin
                dtSetProdVal.FieldByName('DATAVALIDADE').Value :=
                  _pRelNFProd.FieldByName('data_validade').Value;
              end; {12}

            end; {13}
            dsSetTempNFProd.Insert;
            dsSetTempNFProd.FieldByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
            dsSetTempNFProd.FieldByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;
            dsSetTempNFProd.FieldByName('num_nf').AsInteger :=
              _pRelNFProd.FieldByName('num_nf').AsInteger;

                {Se o valor do estoque for maior que o valor de entrada,
                inserir o valor de entrada e prosseguir, senão inserir o valor do
                estoque e encerrar }
            if (_ValorProd > _pRelNFProd.FieldByName('quantidade').AsFloat) then
              dsSetTempNFProd.FieldByName('quantidade').AsFloat :=
                _pRelNFProd.FieldByName('quantidade').AsFloat
            else
              dsSetTempNFProd.FieldByName('quantidade').AsFloat :=
                _valorprod;

            dsSetTempNFProd.FieldByName('data_validade').Value :=
              _pRelNFProd.FieldByName('data_validade').Value;
            dsSetTempNFProd.FieldByName('referencia').AsString :=
              _pRelNFProd.FieldByName('referencia').AsString;
            dsSetTempNFProd.FieldByName('num_fab_fornecedor').AsString :=
              _pRelNFProd.FieldByName('num_fab_fornecedor').AsString;
            dsSetTempNFProd.FieldByName('nome_cliente').AsString :=
              _pRelNFProd.FieldByName('nome_cliente').AsString;
            dsSetTempNFProd.FieldByName('razao').AsString :=
              _pRelNFProd.FieldByName('razao').AsString;
            dsSetTempNFProd.Post
          end
          else
            break;


          _ValorProd := _ValorProd - _pRelNFProd.FieldByName('quantidade').AsFloat;

          _pRelNFProd.Next;
        end; {2}

      end; {3}
      dtSetProdVal.Post;
    end; {7}
    dtSet.Next;

  end; {1}


end;

procedure TIndiceTec._QRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  vMedia: TMedia;
begin

  if _SomenteSelecionado then
    BandPrinted := grid.DataSource.DataSet.FieldByName('sel').AsString = 'S';
    //BandPrinted := grid.SelectedRows.Current_RowSelected;
  if not BandPrinted then
    exit;

//  _pRelReqOS.Close;
//  _pRelReqOS.SQL.text := 'select coalesce(sum(ipv.quant_ped_item),0) as qt from pedvenda pv'
//    + ' inner join pedvenda_prod ipv on ipv.nped = pv.nped'
//    + ' and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo'
//    + ' where ipv.cod_prod =:cod_prod '
//    + ' and ipv.grupo_prod =:grupo_prod '
//    + ' and ((ipv.status is null) or (ipv.status <> ''CANCELADO'')) '
//    + ' and pv.tipo <> ''ORC'''  //esta data é a inicial do banco quando tem migração
//    + ' and (pv.data_fech is null or pv.data_fech < ''01/01/1900'') and pv.cod_empresa = ipv.cod_empresa  '
//    + ' and pv.ativo = 1 '
//    + ' and pv.cod_empresa = '+vDadosIni.codEmpresa;
//
//  _pRelreqos.ParamByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
//  _pRelreqos.ParamByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;
//
//  _pRelreqos.open;

  vMedia := TMedia.create;

  _ValorReqOs := _ValorReqOs + vMedia.getQuantidadePendenteReqOS(
    dtSet.FieldByName('grupo_prod').AsInteger,
    dtSet.FieldByName('cod_prod').AsString);

//  _ValorReqOs := _ValorReqOs + _pRelReqOS.FieldByName('QT').AsCurrency;

  _Label_SumReqOs.Caption := Format('%f', [_ValorReqOs]);

end;

procedure TIndiceTec._QuickRep_IndiceEstBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  _ValorReqOs := 0;
end;

procedure TIndiceTec._RelCabecalhoAfterScroll(DataSet: TDataSet);
begin
  _pRelDetalhes.Close;
  _pRelRec.Close;
  _pRelReqOS.Close;

  if (_pIndiceRel = 3) then
  begin

    if ((not (dtSetProdVal.IsEmpty)) and
      (not (dtSetProdVal.FieldByName('cod_prod').AsString = '')) and
      (not (dtSetProdVal.FieldByName('grupo_prod').AsString = ''))) then
    begin

      dsSetTempNFProd.Filtered := False;
      dsSetTempNFProd.Filter := 'cod_prod = ' + dtSetProdVal.FieldByName('cod_prod').AsString + ' and grupo_prod = ' +
        dtSetProdVal.FieldByName('grupo_prod').AsString;
      dsSetTempNFProd.Filtered := True;

      if (not (dsSetTempNFProd.IsEmpty)) then
        _QRBand_SubRel.Height := 48
      else
        _QRBand_SubRel.Height := 16;

    end;

  end
  else if (_pIndiceRel = 1) then //tab Indice técnico ficha do produto
  begin

    _pRelDetalhes.SQL.Text := 'select it.*, (p.est_f -' +
      '(' +
      ' (' +
      '  coalesce((select sum(coalesce(ipv.quant_ped_item,0)) as valor from pedvenda pv' +
      '  inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo' +
      '  where ipv.cod_prod = p.cod_prod and ipv.grupo_prod = p.grupo_prod and pv.tipo <> ''ORC''  and' +
      '  ((ipv.status is null) or (ipv.status <> ''CANCELADO'')) and (pv.data_fech is null or pv.data_fech < ''01/01/1900'') and' +
      '  pv.cod_empresa = p.cod_empresa and pv.ativo = 1),0)' +
      ' )' +
      ' +' +
      ' (' +
      '  coalesce((select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) from producao pd' +
      '  inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa' +
      '  where pd.data_fechamento is null and pd.cod_empresa = p.cod_empresa and pi.grupo_prod = p.grupo_prod and pi.cod_prod = p.cod_prod),0)' +
      '  )' +
      ')' +
      ') as est_f,p.unidade,p.descr_prod,p.locacao_prod,p.locacao_prod_1,p.prec_cus_prod,p.prec_cusm_prod,(p.prec_30_prod) as perc ' +
      ' from indice_tecnico it, produtos p where ' +
      ' p.cod_empresa = it.cod_empresa and ' +
      ' p.cod_prod = it.cod_prod_mprima ' +
      ' and  p.grupo_prod=it.grupo_prod_mprima and ' +
      ' it.cod_prod_acabado = :cod_prod and ' +
      ' it.grupo_prod_acabado =:grupo_prod ' +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa;
    _pRelDetalhes.ParamByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
    _pRelDetalhes.ParamByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;
    _pRelDetalhes.Open;

    _pRelRec.SQL.Text := ' select ra.PROCESSO_PRODUCAO  from produtos as p, ' +
      ' rec_ass as ra where p.cod_recprod = ra.COD_RECEITA and ' +
      ' p.cod_empresa = ra.cod_empresa and p.cod_prod=:cod_prod and p.grupo_prod=:grupo_prod ' +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa;
    _pRelRec.ParamByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
    _pRelRec.ParamByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;
    _pRelRec.Open;
  end
  else if (_pIndiceRel = 2) then //tab Indice técnico Estoque
  begin

    _pRelDetalhes.SQL.Text := 'select it.*, (p.est_f -' +
      '(' +
      ' (' +
      '  coalesce((select sum(coalesce(ipv.quant_ped_item,0)) as valor from pedvenda pv' +
      '  inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo' +
      '  where ipv.cod_prod = p.cod_prod and ipv.grupo_prod = p.grupo_prod and pv.tipo <> ''ORC''  and' +
      '  ((ipv.status is null) or (ipv.status <> ''CANCELADO'')) and (pv.data_fech is null or pv.data_fech < ''01/01/1900'') and' +
      '  pv.cod_empresa = p.cod_empresa and pv.ativo = 1),0)' +
      ' )' +
      ' +' +
      ' (' +
      '  coalesce((select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) from producao pd' +
      '  inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa' +
      '  where pd.data_fechamento is null and pd.cod_empresa = p.cod_empresa and pi.grupo_prod = p.grupo_prod and pi.cod_prod = p.cod_prod),0)' +
      '  )' +
      ')' +
      ') as est_f,p.unidade,p.descr_prod,p.locacao_prod,p.locacao_prod_1,p.prec_cus_prod,p.prec_cusm_prod,' +
      ' (select coalesce(((it.quant*100)/sum(ie.quant)),0) as perc from indice_tecnico ie where ' +
      '  it.cod_prod_acabado = ie.cod_prod_acabado ' +
      ' and  it.grupo_prod_acabado =ie.grupo_prod_acabado and ie.cod_empresa=it.cod_empresa )  as perc ' +
      ' from indice_tecnico it, produtos p where ' +
      ' p.cod_empresa = it.cod_empresa and ' +
      ' p.cod_prod = it.cod_prod_mprima ' +
      ' and  p.grupo_prod=it.grupo_prod_mprima and ' +
      ' it.cod_prod_acabado = :cod_prod and ' +
      ' it.grupo_prod_acabado =:grupo_prod ' +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa;
    _pRelDetalhes.ParamByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
    _pRelDetalhes.ParamByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;
    _pRelDetalhes.Open;

    _pRelReqOS.SQL.text := 'select' +
      ' (' +
      '  (' +
      '   select sum(coalesce(ipv.quant_ped_item,0)) as valor from pedvenda pv' +
      '   inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo' +
      '   where ipv.cod_prod = pr.cod_prod and ipv.grupo_prod = pr.grupo_prod and pv.tipo <> ''ORC''  and' +
      '   ((ipv.status is null) or (ipv.status <> ''CANCELADO'')) and (pv.data_fech is null or pv.data_fech < ''01/01/1900'') and' +
      '   pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1' +
      '  )' +
      '  +' +
      '  (' +
      '   select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) from producao pd' +
      '   inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa' +
      '   where pd.data_fechamento is null and pd.cod_empresa = ' + vDadosIni.codEmpresa + ' and pi.grupo_prod = PR.grupo_prod and pi.cod_prod = PR.cod_prod' +
      '  )' +
      ' ) as qt from produtos pr where pr.cod_empresa =' + vDadosIni.codEmpresa +
      ' and pr.ativo=1 and pr.grupo_prod = :grupo_prod and pr.cod_prod = :cod_prod';
    _pRelreqos.ParamByName('cod_prod').AsString := dtSet.FieldByName('cod_prod').AsString;
    _pRelreqos.ParamByName('grupo_prod').AsInteger := dtSet.FieldByName('grupo_prod').AsInteger;
    _pRelreqos.open;
  end;
end;

{ TRelControleProducaoEstoque }

constructor TRelControleProducaoEstoque.create;
begin
  fBuscas := TIBQuery(dtmProdutos.qrBuscas);
end;

destructor TRelControleProducaoEstoque.Destroy;
begin
  fBuscas.Close;
  inherited;
end;

function TRelControleProducaoEstoque._iniciarRelatorio(pGrupo_prod: Integer;
  pCod_prod, pDataIni, pDataFim: string): Boolean;
begin

  fBuscas.Close;
  fBuscas.SQL.Text :=
    'select ''NF'' especie, nf.serie, nf.subserie, nf.num_nf, nf.data_lanc data,' +
    ' (select result from strzero(extract(day from nf.data_lanc),2)) as dia,' +
    ' p.cod_cta_estoque contabil, nfi.codigo_nop fiscal, nf.natureza_nf e_s, ''1'' cod, sum(coalesce(nfi.quantidade,0)) quantidade,' +
    ' sum(coalesce(nfi.valor_total,0)) valor, sum(coalesce(nfi.valor_ipi,0)) ipi from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P'' and coalesce(nfi.altera_estoque_cfop, '''') <> ''N''' +
    ' inner join produtos p on p.grupo_prod = nfi.grupo_prod and p.cod_prod = nfi.cod_prod and p.cod_empresa = nfi.cod_empresa' +
    ' where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and nf.cod_empresa = :cod_empresa and' +
    ' nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim' +
    ' and nf.status = ''Fechada''' +
    ' and ( (nf.emissao_propria = ''S'' and nf.modelo_nf = ''55'' and coalesce(nf.situacao_nfe,'''') = ''Autorizada'' )' +
    ' or (nf.emissao_propria = ''S'' and nf.modelo_nf <> ''55'')' +
    ' or (nf.emissao_propria = ''N'') )' +
    ' group by 1,2,3,4,5,6,7,8,9,10' +
    ' union' +
    ' select ''OP'', null, null, op.cod_producao, op.data_fechamento,' +
    ' (select result from strzero(extract(day from op.data_fechamento),2)),' +
    ' p.cod_cta_estoque, null, ''E'', ''1'' cod, sum(coalesce(oi.quantidade,0)) quantidade,' +
    ' sum(coalesce(oi.prec_cus_prod,0) * coalesce(oi.quantidade,0)) valor_total,' +
    ' sum((coalesce(oi.prec_cus_prod,0) * coalesce(oi.quantidade,0)) * coalesce(p.ipi_prod,0) / 100) from producao op' +
    ' inner join producao_item oi on oi.cod_producao = op.cod_producao and oi.cod_empresa = OP.cod_empresa' +
    ' inner join produtos p on p.grupo_prod = oi.grupo_prod and p.cod_prod = oi.cod_prod and p.cod_empresa = oi.cod_empresa' +
    ' where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and op.cod_empresa = :cod_empresa and' +
    ' op.data_fechamento >= :dataIni and op.data_fechamento <= :dataFim' +
    ' group by 1,2,3,4,5,6,7,8,9,10' +
    ' union' +
    ' select ''OP'', null, null, op.cod_producao, op.data_fechamento,' +
    ' (select result from strzero(extract(day from op.data_fechamento),2)),' +
    ' p.cod_cta_estoque, null, ''S'', ''1'' cod, sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) quantidade,' +
    ' sum(coalesce(pi.prec_cusm_prod,0) * (coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0))) valor_total,' +
    ' sum((coalesce(pi.prec_cusm_prod,0) * (coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0))) * p.ipi_prod / 100) from producao op' +
    ' inner join producao_item_indice pi on pi.cod_producao = op.cod_producao and pi.cod_empresa = OP.cod_empresa' +
    ' inner join produtos p on p.grupo_prod = pi.grupo_prod and p.cod_prod = pi.cod_prod and p.cod_empresa = pi.cod_empresa' +
    ' where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and op.cod_empresa = :cod_empresa and' +
    ' op.data_fechamento >= :dataIni and op.data_fechamento <= :dataFim' +
    ' group by 1,2,3,4,5,6,7,8,9,10' +
    ' order by 5, 4';
  fBuscas.ParamByName('grupo_prod').AsInteger := pGrupo_prod;
  fBuscas.ParamByName('cod_prod').AsString := pCod_prod;
  fBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  fBuscas.ParamByName('dataIni').AsDate := StrToDate(pDataIni);
  fBuscas.ParamByName('dataFim').AsDate := StrToDate(pDataFim);
  fBuscas.Open;

  Result := not fBuscas.IsEmpty;

  fQtdeEstoque := 0;


end;

end.

