unit UClasseAdig;

interface

uses Forms, Classes, uDataSet_OOP, Controls, StdCtrls, DBClient, UDtmArqsDig,
  ComCtrls, DBGrids, dateutils, IBQuery, uClasseConexao;

type
  ETipo = (eTotal, eParcial);

  REmpDesenvolv = record
    cCNPJ, cIE, cIM, cNOMEEMPRESA, cNOMEPAF, cVERSAO, cMD5LISTA, cMD5Dados: string;
  end;

  TAnexos = class;
  TInventario_Adig = class;
  TTerminalProc = class;
  TRelProdAnexoIII = class;
  TRelProdAnexoIV = class;
  TRelProdAnexoV = class;
  TRelProdAnexoVI = class;
  TAdigEmpresa = class;

  TAnexos = class(TDataSet_OOP)
  protected
    function _registrosIncluidosOuExcluidos(pTipo: string; pDataIni, pDataFim: TDate; pBuscas: TIBQuery): Boolean;
  end;

  TInventario_Adig = class(TDataSet_OOP)
  private
    function getQtdItensCompra(codprod: string; grupoprod: integer; data: TDateTime): double;
    function getQtdItensVenda(codprod: string; grupoprod: integer; data: TDateTime): double;
    function getQtdItensDevolvidos(codprod: string; grupoprod: integer; data: TDateTime): double;
  public
    constructor create;
    destructor Destroy; override;
    function retornaQtdeEmEstoque(DataReferencia: string; GrupoProd: integer; CodProd: string): Double;
  var
    vDataReferencia: string;
  end;

  TTerminalProc = class(TDataSet_OOP)
  public
    constructor create;
    destructor destroy; override;
    function AbreTerminal: boolean;
  end;

  TRelProdAnexoIII = class(TAnexos)
  public
    constructor create;
    destructor destroy; override;
    function MontarArquivoIII(vdat1: string; vdat2: string; vend: string; vBarra: TprogressBar):
      boolean;
  var
    FDadosEmpAnxIII: TAdigEmpresa;
    FDadosTerminal: TTerminalProc;
  end;

  TRelProdAnexoIV = class(TAnexos)
  private
    vListaGrupoeCodigo: TStringList;
  public
    constructor create;
    destructor destroy; override;
    function Abreprodutos: boolean; overload;
    function Abreprodutos(valorPesquisa, codigoOuDescricao: string): boolean; overload;
    function MontarArquivo(vend, totalOuParcial: string; vBarra: TprogressBar): boolean;
  var
    FDadosEmp: TAdigEmpresa;
    vListaCodigo, vListaDescricao: TStringList;
  end;

  TRelProdAnexoV = class(TAnexos)
  public
    constructor create;
    destructor destroy; override;
    function Abreprodutos: boolean;
    function MontarArquivo(vend: string; vBarra: TprogressBar): boolean;
  var
    FDadosEmp: TAdigEmpresa;
  end;

  TRelProdAnexoVI = class(TAnexos)
  private
    Arq: TextFile;
    itx: integer;
    cCNPJ, cIE, cIM, cNOMEEMPRESA, cNOMEPAF, cVERSAO, cMD5LISTA: string;
    vInterrogacao, vSemRegistros: Boolean;
    function getStringSemCaract(valor: string): string;
    procedure lerDadosArquivoCriptogravado;
  public
    constructor create;
    destructor destroy; override;
    function Abreprodutos: boolean;
    function montarquivoVI(vend: string;
      vBarra: TprogressBar; vtlbtp: Tlabel): boolean;
    function AbFechArquivoVI(vend: string; vtp: integer): boolean;
    function MontarArquivoR01(vend: string; vBarra: TprogressBar; vtlbtp: Tlabel; vcod_terminal:
      integer): boolean;
    function MontarArquivoR02(vend: string; vBarra: TprogressBar; vtlbtp: Tlabel; vcod_terminal:
      integer): boolean;
    function MontarArquivoR03(vend: string; vBarra: TprogressBar; vtlbtp: Tlabel; vcod_terminal:
      integer): boolean;
    function MontarArquivoR04(vend: string; vBarra: TprogressBar; vtlbtp: Tlabel; vcod_terminal:
      integer): boolean;
    function MontarArquivoR05(vend: string; vBarra: TprogressBar; vtlbtp: Tlabel; vcod_terminal:
      integer): boolean;
    function MontarArquivoR06(vend: string; vBarra: TprogressBar; vtlbtp: Tlabel; vcod_terminal:
      integer): boolean;
    function MontarArquivoR07(vend: string; vBarra: TprogressBar; vtlbtp: Tlabel; vcod_terminal:
      integer): boolean;
  var
    FDadosEmp: TAdigEmpresa;
    Fterminais: TTerminalProc;
    CdsTerminais: TClientDataSet;
    dtini, DtFinal, vDtMov, vPelaReducao: string;
    vGerarArqMesmoSemMov: Boolean;
    NomeArq: string;
    vcdterminal: integer;
  end;

  TAdigEmpresa = class(TDataSet_OOP)
  private
    //    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    function abreEmpresa: boolean;
  var
    //    AuxStr: string;
    //    vtipdoc: string;
    //    vsrec, vlVnd, vlrec: Currency;
    //    qtdvnd: Integer;

    //    vHistRec: THistRec;
  end;

  TArquivoDigital = class(TConexao)
  protected
    fDelimitador: string;
    fCaracteresAremover: string;
    fDataInicial: string;
    fDataFinal: string;
    fListaArquivo : TStringList;
    fEnderecoArquivo: string;
    function formataData(pData: TDateTime): string;
    function formataHora(pTime: TTime): string; overload;
    function formataHora(pTime: TDateTime): string; overload;
    function formataHora(pTime: string): string; overload;
    function formataString(pString: string; pTamanho: Integer): string;
    function formataInteiro(pInteiro, pTamanho: Integer): string; overload;
    function formataInteiro(pInteiro: string; pTamanho: Integer): string; overload;
    function formataNumero(pNumero: Extended; pTamanho: Integer; pCasasDecimais: Integer = 2): string;
    function gerarMD5: Boolean;
  public
    property dataInicial: string read fDataInicial write fDataInicial;
    property dataFinal: string read fDataFinal  write fDataFinal;
    property enderecoDoArquivo: string read fEnderecoArquivo  write fEnderecoArquivo;
  end;

  TAnexoIV = class(TArquivoDigital)
  private
    fCamposECF: string;
    fModeloECF: string;
    fProgressRegistros: TprogressBar;
    fProgressRegistrosDetalhes: TprogressBar;
    fLabelRegistros: TLabel;
    fLabelRegistrosDetalhes: TLabel;
    fCNPJEmpPAF: string;
    fNumSerieMovimento: string;
    fMD5: TManutencaoAlteracoesArquivosPAF;
    fEmpDesenvol: REmpDesenvolv;

    fBuscas, fQrMD5: TIBQuery;
    fTipoEstoque: ETipo;
    fdataSetEstoqueParcial: TClientDataSet;

		procedure addProgress(pProgress: TProgressBar; pMin, pMax, pPosition: Integer);
		procedure setTextoLabel(pLabel: TLabel; pTexto: string; pTitulo: string = '');
		procedure setCamposECF;

		function validaMD5_A2(pData, pTipo: string; pCodigo: Integer): boolean;

		function gerarU1: boolean; //identificacao do paf ecf
		function gerarA2: boolean; // total diario dos meios de pagamento
		function gerarP2(pTabelaPreco: string): boolean; // relacao de mercadorias e servicos
		function gerarE2: boolean; // relacao de mercadorias em estoque
		function gerarE3: boolean; // identificacao do ecf que emitiu o doc base para a atualizacao do estoque
		function gerarD2: boolean; // relacao dos dav emitidos
		function gerarD3: boolean; // detalhes dos dav emitidos
		function gerarD4: boolean; // log de alteracao dos itens do dav
		///  B2 combustivel ///  C2 combustivel ///  F2 transporte ///  F3 transporte ///  F4 transporte ///  T2 transporte ///  M2 transporte ///  L2 transporte ///  G2 pedagio
		function gerarH2: boolean;  // credenciadora cartao
		function gerarS2: boolean;  // mesa/conta de cliente - O.S.
		function gerarS3: boolean;  // itens da mesa/conta de cliente
		function gerarR01: boolean;  // identificacao do ECF
		function gerarR02: boolean;  // relacao de reducaoz
		function gerarR03: boolean;  // detalhes da reducao z
		function gerarR04: boolean;  // cupom fiscal
		function gerarR05: boolean;  // detalhe do cupom, nota ou bilhete
		function gerarR06: boolean;  // demais documentos emitidos pelo ecf
		function gerarR07: boolean;  // detalhes de cupom fiscal e nao fiscal - MEIOS de PAGAMENTO

		function formatarArquivo: Boolean;
		function posicionarTexto(pTexto: string; pMax: Integer; const pArgs: array of Integer): string;

  public
    constructor create;
    destructor destroy; override;
    function montarArquivo: Boolean;
    function montarArquivoMovimentoECF: Boolean;

    property tipoEstoque: ETipo read fTipoEstoque write fTipoEstoque;
    property dataSetEstoqueParcial: TClientDataSet read fdataSetEstoqueParcial write fdataSetEstoqueParcial;
    property progressRegistros: TprogressBar read fProgressRegistros write fProgressRegistros;
    property progressRegistrosDetalhes: TprogressBar read fProgressRegistrosDetalhes write fProgressRegistrosDetalhes;
    property labelRegistros: TLabel  read fLabelRegistros write fLabelRegistros;
    property labelRegistrosDetalhes: TLabel  read fLabelRegistrosDetalhes write fLabelRegistrosDetalhes;

  end;

implementation

uses
  IBDatabase, UdadosIni, Dialogs, SysUtils, DB, uDtmAtivo, Windows,
  IniFiles;

{ TRelProdAnexoV }

function TRelProdAnexoV.Abreprodutos: boolean;
begin
  result :=
    montaSelect('select ''P'' tipo, p.grupo_prod, p.cod_prod, p.descr_prod, p.unidade,' +
    ' p.tipo_fab, p.icm_prod, p.isento_prod,  p.n_incidencia_prod, p.prec_tab_prod,' +
    ' (p.est_f + p.est_r) est_f from PRODUTOS p where p.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1' +
    ' union' +
    ' select ''S'' tipo, 0, cast(s.cod_servico as char(6)),s.desc_servico, s.unidade,' +
    ' ''P'', s.aliq_iss, s.isento_serv, s.n_incidencia_serv, s.valor_servico, 0' +
    ' from tipo_servico s where ativo = 1 AND COALESCE(s.COD_EMPRESA, ' + vDadosIni.codEmpresa + ') = ' + vDadosIni.codEmpresa);
end;

constructor TRelProdAnexoV.create;
begin
  DataSet := TClientDataSet(DtmArqsDig.CdsAdigProdutos);
  //DtmArqsDig.IbAdigProdutos.Params[0].AsInteger :=
  //  StrToInt(vDadosIni.codEmpresa);
  transacao := TIBTransaction(DtmArqsDig.IbTransArqDigs);
  buscas := TIBQuery(DtmArqsDig.qrBuscas);
  FDadosEmp := TAdigEmpresa.create;
end;

destructor TRelProdAnexoV.destroy;
begin
  inherited;
  Close;
end;

function TRelProdAnexoV.MontarArquivo(vend: string; vBarra: TprogressBar): boolean;
var
  Arq: TextFile;
  NomeArq, vTemp: string;
  itx: integer;
  Buffer: Ansistring;
  nowStr: string;
  buscas2: TIBQuery;
  vInterrogacao: Boolean;
  vLista: TStringList;
begin
  vInterrogacao := False;
  Abreprodutos;
  FDadosEmp.abreEmpresa;
  nowStr := DateTimeToStr(now);
  nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  NomeArq := vend + 'Tab.Prod.' + nowStr+ '.txt'; //copy(datetostr(date), 4, 2) + copy(datetostr(date), 7, 4) + '.TXT';
  AssignFile(Arq, NomeArq);
  Rewrite(arq);
  vDadosIni.AuxStr := vDadosIni.Space(94);
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vDadosIni.MontaLinha(0001, 'P1');
  vDadosIni.MontaLinha(0003, FDadosEmp.dataSet.FieldByName('CNPJ_EMP').AsString);
  vDadosIni.MontaLinha(0017, copy(FDadosEmp.dataSet.FieldByName('IE_EMP').value, 1, 14));
  vTemp := FDadosEmp.dataSet.FieldByName('IM_EMP').AsString;
  vTemp := StringReplace(vTemp, ' ', '', [rfReplaceAll]);
  vTemp := StringReplace(vTemp, '.', '', [rfReplaceAll]);
  vTemp := StringReplace(vTemp, '-', '', [rfReplaceAll]);
  vDadosIni.MontaLinha(0031, copy(vTemp, 1, 14));
  vDadosIni.MontaLinha(0045, copy(FDadosEmp.dataSet.FieldByName('NOME_EMP').value, 1, 50));
  WriteLn(arq, vDadosIni.auxstr);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('P2', 0, 0, buscas);

  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  itx := 0;
  vDadosIni.AuxStr := vDadosIni.Space(105);
  buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
  dataSet.First;
  while not dataSet.Eof do
  begin
    Application.ProcessMessages;
    vDadosIni.MontaLinha(0001, 'P2');
    vDadosIni.MontaLinha(0003, FDadosEmp.dataSet.FieldByName('CNPJ_EMP').value);
    vDadosIni.MontaLinha(0017, vDadosIni.strzero(
      dataSet.FieldByName('GRUPO_PROD').AsString +
      Trim(dataset.FieldByName('COD_PROD').AsString), 14));
    vDadosIni.MontaLinha(0031, copy(dataSet.FieldByName('DESCR_PROD').AsString, 1, 50));

    if dataSet.FieldByName('tipo').AsString = 'P' then
    begin
      if vMD5Func._validaMD5_Produtos( buscas,
        dataSet.FieldByName('GRUPO_PROD').AsInteger,
        Trim(dataset.FieldByName('COD_PROD').AsString))   then
        vDadosIni.MontaLinha(0081, copy(dataSet.FieldByName('UNIDADE').asstring, 1, 2))
      else
        vDadosIni.MontaLinha(0081, '?');
    end
    else
    begin
      if vMD5Func._validaMD5_Servicos( buscas,
        StrToInt(Trim(dataSet.FieldByName('COD_PROD').AsString))) then
        vDadosIni.MontaLinha(0081, copy(dataSet.FieldByName('UNIDADE').asstring, 1, 2))
      else
        vDadosIni.MontaLinha(0081, '?');                          
    end;

    vDadosIni.MontaLinha(0087, vDadosIni.vIndicadorArredondamentoOuTruncamento);
    vDadosIni.MontaLinha(0088, copy(dataSet.FieldByName('tipo_fab').asstring, 1, 1));

    if (dataSet.FieldByName('ICM_PROD').AsFloat > 0) then
    begin
      if dataSet.FieldByName('tipo').AsString = 'P' then
        vDadosIni.MontaLinha(0089, 'T')
      else
        vDadosIni.MontaLinha(0089, 'S');
      vDadosIni.MontaLinha(0090, vDadosIni.Tzero(dataSet.FieldByName('ICM_PROD').AsCurrency, 4));
    end
    else if dataSet.FieldByName('ISENTO_PROD').AsString = 'S' then
    begin
      vDadosIni.MontaLinha(0089, 'I');
      vDadosIni.MontaLinha(0090, '0000');
    end
    else if dataSet.FieldByName('N_INCIDENCIA_PROD').AsString = 'S' then
    begin
      vDadosIni.MontaLinha(0089, 'N');
      vDadosIni.MontaLinha(0090, '0000');
    end
    else if (dataSet.FieldByName('ICM_PROD').AsFloat = 0) then
    begin
      vDadosIni.MontaLinha(0089, 'F');
      vDadosIni.MontaLinha(0090, '0000');
    end;
    vDadosIni.MontaLinha(0094, vDadosIni.Tzero(dataSet.FieldByName('PREC_TAB_PROD').AsCurrency,
      12));
    WriteLn(arq, vDadosIni.auxstr);
    itx := itx + 1;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    dataSet.Next;
  end;
  vDadosIni.AuxStr := vDadosIni.Space(36);
  vDadosIni.MontaLinha(0001, 'P9');
  vDadosIni.MontaLinha(0003, FDadosEmp.dataSet.FieldByName('CNPJ_EMP').value);
  vDadosIni.MontaLinha(0017, copy(FDadosEmp.dataSet.FieldByName('IE_EMP').value, 1, 14));
  vDadosIni.MontaLinha(0031, vDadosIni.strzero(itx, 6));
  WriteLn(arq, vDadosIni.auxstr);
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  closeFile(arq);

  if vInterrogacao then
  begin
    vLista := TStringList.Create;
    vLista.LoadFromFile(NomeArq);
    vLista[0] := copy(vLista[0], 1, 44) + vDadosIni.Replicate('?', 50);
    vLista.SaveToFile(NomeArq);
  end;

  vDadosIni.gerarMD5ArquivoEletronico(NomeArq);
  if FileExists(NomeArq) then
    Application.MessageBox(pchar('Arquivo "Tab. Prod" criado com sucesso' + #13 +
      'O arquivo foi salvo em: ' + NomeArq), 'Atenção', 0 + 64);
  FDadosEmp.Close;
  Result := true;
end;

{ TAdigEmpresa }

function TAdigEmpresa.abreEmpresa: boolean;
begin
  result := montaSelect(' select * from empresa where cod_empresa = ' + vDadosIni.codEmpresa +
    '  and ativo = 1 ');
end;

constructor TAdigEmpresa.create;
begin
  DataSet := TClientDataSet(DtmArqsDig.CdsAdigEmpresa);
  transacao := TIBTransaction(DtmArqsDig.IbTransArqDigs);
  buscas := TIBQuery(DtmArqsDig.qrBuscas);
end;

destructor TAdigEmpresa.destroy;
begin
  inherited;
  close;
end;

{ TRelProdAnexoIII }

constructor TRelProdAnexoIII.create;
begin
  DataSet := TClientDataSet(DtmArqsDig.CdsDavsEmt);
  transacao := TIBTransaction(DtmArqsDig.IbTransArqDigs);
  buscas := TIBQuery(DtmArqsDig.qrBuscas);
  FDadosEmpAnxIII := TAdigEmpresa.create;
end;

destructor TRelProdAnexoIII.destroy;
begin

  inherited;
end;

function TRelProdAnexoIII.MontarArquivoIII(vdat1, vdat2, vend: string;
  vBarra: TprogressBar): boolean;
var
  Arq: TextFile;
  vidcniee, vmfadc, NomeArq: string;
  itx, itx2, vCodigoteminal: integer;
  Buffer: string;
  nowStr: string;
  buscas2: TIBQuery;
  vTemp: string;
  vItem: Integer;
  vInterrogacao: Boolean;
  vLista: TStringList;
begin
  vInterrogacao := False;
  buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
  montaSelect('select pa.tipo, pa.nped, pa.nprevenda, pa.data_fech, pa.nome_clientedav nome_cliente, pa.ncupom,' +
    ' pa.nserieecf, pa.valor_total, pa.cod_empresa, pa.operador, pa.data_cupom, pa.cpfcgc, pa.coo_impressao' +
    ' from pedvenda pa' +
    ' inner join clientes cl on cl.cod_cliente = pa.cod_cliente and cl.cod_empresa = pa.cod_empresa' +
    ' where (pa.nprevenda is not null) and pa.nprevenda <> 0 and pa.status_ped <> '''' and pa.status_ped = ''FECHADA'' and' +
    ' (pa.status_ped is not null) and pa.ativo = 1 and pa.data_fech >= :data1 and pa.data_fech <= :data2' +
    ' order by pa.data_fech,pa.nprevenda', StrToDate(vdat1), StrToDate(vdat2));

  FDadosEmpAnxIII.abreEmpresa;
  nowStr := DateTimeToStr(now);
  nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  NomeArq := vend + 'DAVSEMITIDOS' + nowStr + '.txt';// copy(datetostr(date), 4, 2) + copy(datetostr(date), 7, 4) + '.TXT';
  AssignFile(Arq, NomeArq);
  Rewrite(arq);
  vDadosIni.AuxStr := vDadosIni.Space(94);
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vDadosIni.MontaLinha(0001, 'D1');
  vDadosIni.MontaLinha(0003, FDadosEmpAnxIII.dataSet.FieldByName('CNPJ_EMP').AsString);
  vDadosIni.MontaLinha(0017, copy(FDadosEmpAnxIII.dataSet.FieldByName('IE_EMP').value, 1, 14));
  vDadosIni.MontaLinha(0031, vDadosIni.StringReplace2(
    copy(FDadosEmpAnxIII.dataSet.FieldByName('IM_EMP').value, 1, 14),
    '/\-_;:.,+=|', '           ', True));
  vDadosIni.MontaLinha(0045, copy(FDadosEmpAnxIII.dataSet.FieldByName('NOME_EMP').value, 1, 50));
  WriteLn(arq, vDadosIni.auxstr);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('D2', StrToDate(vdat1), StrToDate(vdat2), buscas);

  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vBarra.Max := dataSet.RecordCount * 2 ;
  vBarra.Min := 0;
  vBarra.Position := 1;
  itx := 0;
  dataSet.First;
  while not dataSet.eof do
  begin

    if not vInterrogacao then
    vInterrogacao := not vMD5Func._validaMD5_DAV_Itens(buscas, dataSet.FieldByName('NPREVENDA').AsInteger);

    buscas.Close;
    buscas.SQL.Text := 'select * from TERMINAL_IMPRESSORAS where ' +
      'NUM_SERIE_ECF = ''' + dataset.FieldByName('nserieecf').AsString + ''' and cod_empresa = ' +
      vDadosIni.codEmpresa + ' AND ATIVO = 1 ';
    buscas.open;

    vmfadc := buscas.FieldByName('MF_ADICIONAL').AsString;
    vidcniee := buscas.FieldByName('IDENT_CNIEE').AsString;
    vCodigoteminal := buscas.FieldByName('cod_terminal').AsInteger;;
    buscas.Close;
    buscas.SQL.Text := 'select * from IMPRESSORAS_CNIEE where ' +
      'IDENTIFICACAO = ''' + vidcniee + ''' AND ATIVO = 1 ';
    buscas.open;

    vDadosIni.AuxStr := vDadosIni.Space(212);
    vDadosIni.MontaLinha(0001, 'D2');
    vDadosIni.MontaLinha(0003, FDadosEmpAnxIII.dataSet.FieldByName('CNPJ_EMP').AsString);
    vDadosIni.MontaLinha(0017, dataSet.FieldByName('nserieecf').AsString);
    vDadosIni.MontaLinha(0037, vmfadc);
    vDadosIni.MontaLinha(0038, copy(buscas.FieldByName('TIPO_ECF').AsString, 1, 7));
    vDadosIni.MontaLinha(0045, buscas.FieldByName('MARCA_ECF').AsString);

    if vMD5Func._validaMD5_DAV(buscas2, dataSet.FieldByName('nprevenda').AsInteger) then
      vDadosIni.MontaLinha(0065, buscas.FieldByName('MODELO_ECF').AsString)
    else
      vDadosIni.MontaLinha(0065, vDadosIni.Replicate('?', 20));

    if dataSet.FieldByName('coo_impressao').AsInteger > 0 then
      vDadosIni.MontaLinha(0085, vDadosIni.StrZero(dataSet.FieldByName('coo_impressao').AsInteger, 6))
    else
      vDadosIni.MontaLinha(0085, vDadosIni.StrZero(0, 6));
    vDadosIni.MontaLinha(0091, vDadosIni.StrZero(dataSet.FieldByName('NPREVENDA').AsInteger, 13));
    vDadosIni.MontaLinha(0104, vdadosini.StrZero(YearOf(dataSet.fieldbyname('data_fech').value), 4)
      +
      vdadosini.StrZero(MonthOf(dataSet.fieldbyname('data_fech').value), 2) +
      vdadosini.StrZero(DayOf(dataSet.fieldbyname('data_fech').value), 2));
    if dataset.FieldByName('TIPO').AsString = 'REQ' then
      vDadosIni.MontaLinha(0112, 'PEDIDO');
    if dataset.FieldByName('TIPO').AsString = 'ORC' then
      vDadosIni.MontaLinha(0112, 'ORCAMENTO');
    if TRIM(dataset.FieldByName('TIPO').AsString) = 'OS' then
      vDadosIni.MontaLinha(0112, 'ORDEM DE SERVICO');
    vDadosIni.MontaLinha(0142, vDadosIni.TZero(
      dataSet.FieldByName('VALOR_TOTAL').AsCurrency, 8));
    vDadosIni.MontaLinha(0150, vDadosIni.StrZero(dataSet.FieldByName('NCUPOM').AsInteger, 6));
    vDadosIni.MontaLinha(0156, vDadosIni.StrZero(vCodigoteminal,3));
    vDadosIni.MontaLinha(0159, copy(dataSet.FieldByName('nome_cliente').AsString,1,40));
    vDadosIni.MontaLinha(0199,vDadosIni.StrZero(
      Trim(dataSet.FieldByName('cpfcgc').AsString),14));
    WriteLn(arq, vDadosIni.auxstr);
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    itx := itx + 1;

    vBarra.Position := vBarra.Position + 1;
    dataSet.Next;
  end;

  // Registro D3. Detalhes do DAV
  itx2 := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
    buscas.Close;
    buscas.SQL.Text := 'select ''P'' tipo_item, pp.nitem, pp.data_inclusao, pp.num_fab_prod,' +
      ' pp.descr_prod_ped, pp.quant_ped_item, p.unidade, pp.vlun_ped_item,' +
      ' (coalesce(pp.rateio_desc,0) + coalesce(pp.desc_item,0)) desconto,' +
      ' (coalesce(pp.rateio_acresc,0) + coalesce(pp.acresc_item,0)) acrescimo,' +
      ' p.icm_prod, p.isento_prod, p.n_incidencia_prod, pp.status, pp.grupo_prod, pp.cod_prod, pp.cod_grade, 0 cod_servico' +
      ' from pedvenda_prod pp' +
      ' inner join produtos p on p.grupo_prod = pp.grupo_prod and' +
      '     p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa' +
      ' where pp.nped = :nped and pp.tipo = :tipo and pp.cod_empresa = :cod_empresa' +
      ' union' +
      ' select ''S'' tipo_item, ss.nitem, ss.data_inclusao, ss.cod_servico,' +
      ' ss.desc_serv_ped, ss.quant_serv_ped, s.unidade, ss.valor_un_serv,' +
      ' (coalesce(ss.rateio_desc,0) + coalesce(ss.desc_item,0)) desconto,' +
      ' (coalesce(ss.rateio_acresc,0) + coalesce(ss.acresc_item,0)) acrescimo,' +
      ' s.aliq_iss, s.isento_serv, s.n_incidencia_serv, ss.status, 0 grupo_prod, '''' cod_prod, 0 cod_grade, ss.cod_servico' +
      ' from pedvenda_serv ss' +
      ' inner join tipo_servico s on s.cod_servico = ss.cod_servico' +
      ' where ss.nped = :nped and ss.tipo = :tipo and ss.cod_empresa = :cod_empresa'+
      ' order by 1,2';
    buscas.ParamByName('nped').AsInteger := dataSet.FieldByName('nped').AsInteger;
    buscas.ParamByName('tipo').AsString := dataSet.FieldByName('tipo').AsString;
    buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;
    buscas.First;
    vItem:=0;
    while not buscas.Eof do
    begin
      itx2 := itx2 + 1;
      Inc(vItem);
      vDadosIni.AuxStr := vDadosIni.Space(198);
      vDadosIni.MontaLinha(001, 'D3');
      vDadosIni.MontaLinha(003, vDadosIni.StrZero(dataSet.FieldByName('NPREVENDA').AsInteger, 13));
      vTemp:= buscas.FieldByName('data_inclusao').AsString;
      if Trim(vTemp) = '' then
        vTemp:= dataSet.fieldbyname('data_fech').AsString;
      vDadosIni.MontaLinha(016, vdadosini.StrZero(YearOf(StrToDate(vTemp)), 4) +
        vdadosini.StrZero(MonthOf(StrToDate(vTemp)), 2) +
        vdadosini.StrZero(DayOf(StrToDate(vTemp)), 2));
      vDadosIni.MontaLinha(024, vDadosIni.StrZero(vItem, 3));
      vDadosIni.MontaLinha(027, copy(buscas.FieldByName('num_fab_prod').AsString,1,14));
      if Trim(buscas.FieldByName('tipo_item').AsString) = 'P' then
      begin
        if NOT vMD5Func._validaMD5_DAV_Produtos_Sevicos(buscas2,
          dataSet.FieldByName('nped').AsInteger,
          dataSet.FieldByName('tipo').AsString, 'P',
          buscas.FieldByName('GRUPO_PROD').AsInteger,
          buscas.FieldByName('COD_PROD').AsString,
          buscas.FieldByName('COD_GRADE').AsInteger, 0,
          buscas.FieldByName('NITEM').AsInteger) then
          vDadosIni.MontaLinha(041, vDadosIni.Replicate('?', 100))
        else
          vDadosIni.MontaLinha(041, buscas.FieldByName('descr_prod_ped').AsString);
      end
      else
      begin
        if not vMD5Func._validaMD5_DAV_Produtos_Sevicos(buscas2,
          dataSet.FieldByName('nped').AsInteger,
          dataSet.FieldByName('tipo').AsString, 'S',
          0,
          '',
          0,
          buscas.FieldByName('cod_servico').AsInteger,
          buscas.FieldByName('NITEM').AsInteger) then
          vDadosIni.MontaLinha(041, vDadosIni.Replicate('?', 100))
        else
          vDadosIni.MontaLinha(041, buscas.FieldByName('descr_prod_ped').AsString);
      end;
      vDadosIni.MontaLinha(141, vDadosIni.StrZero(Trunc(vDadosIni.StrToFloatFormat(
        buscas.FieldByName('quant_ped_item').AsFloat,2) * 100), 7));
      vDadosIni.MontaLinha(148, copy(buscas.FieldByName('unidade').AsString,1,3));
      vDadosIni.MontaLinha(151, vDadosIni.StrZero(Trunc(vDadosIni.StrToFloatFormat(
        buscas.FieldByName('vlun_ped_item').AsFloat,2) * 100), 8));
      vDadosIni.MontaLinha(159, vDadosIni.StrZero(Trunc(vDadosIni.StrToFloatFormat(
        buscas.FieldByName('desconto').AsFloat,2) * 100), 8));
      vDadosIni.MontaLinha(167, vDadosIni.StrZero(Trunc(vDadosIni.StrToFloatFormat(
        buscas.FieldByName('acrescimo').AsFloat,2) * 100), 8));
      vDadosIni.MontaLinha(175, vDadosIni.StrZero(Trunc(vDadosIni.StrToFloatFormat(
        (buscas.FieldByName('quant_ped_item').AsFloat *
        buscas.FieldByName('vlun_ped_item').AsFloat) +
        buscas.FieldByName('acrescimo').AsFloat -
        buscas.FieldByName('desconto').AsFloat ,2) * 100), 14));
      vTemp := 'F1';
      if buscas.FieldByName('isento_prod').AsString = 'S' then
        vTemp := 'I1'
      else if buscas.FieldByName('n_incidencia_prod').AsString = 'S' then
        vTemp := 'N1'
      else if buscas.FieldByName('icm_prod').AsFloat > 0 then
      begin
        vTemp := '01';
        buscas2.Close;
        buscas2.SQL.Text := 'select indice from aliq'+
          ' where cod_terminal = '+ IntToStr(dataSet.FieldByName('operador').AsInteger)+
          ' and nserieecf = '+QuotedStr(dataSet.FieldByName('nserieecf').AsString)+
          ' and cod_empresa = '+vDadosIni.codEmpresa;
        buscas2.Open;
        if not buscas2.IsEmpty then
          vTemp := vDadosIni.StrZero(buscas2.FieldByName('indice').AsInteger,2);
        buscas2.Close;
        if buscas.FieldByName('tipo_item').AsString = 'P' then
          vTemp := vTemp+'T'
        else
          vTemp := vTemp+'S';
        vTemp := vTemp + vDadosIni.StrZero( Trunc(
            vDadosIni.StrToFloatFormat(buscas.FieldByName('icm_prod').AsFloat,2) *
            100 ) ,4);
      end;
      vDadosIni.MontaLinha(189, copy(vTemp,1,7));
      vTemp := 'N';
      if UpperCase(trim(buscas.FieldByName('status').AsString)) = 'CANCELADO' then
        vTemp := 'N';
      vDadosIni.MontaLinha(196, copy(vTemp,1,1));
      vDadosIni.MontaLinha(197, '22');
      WriteLn(arq, vDadosIni.auxstr);
      vDadosIni.LimpaLinha(vDadosIni.AuxStr);
      buscas.Next;
    end;
    vBarra.Position := vBarra.Position + 1;
    dataSet.Next;
  end;
  vDadosIni.AuxStr := vDadosIni.Space(42);
  vDadosIni.MontaLinha(0001, 'D9');
  vDadosIni.MontaLinha(0003, FDadosEmpAnxIII.dataSet.FieldByName('CNPJ_EMP').value);
  vDadosIni.MontaLinha(0017, copy(FDadosEmpAnxIII.dataSet.FieldByName('IE_EMP').value, 1, 14));
  vDadosIni.MontaLinha(0031, vDadosIni.strzero(itx, 6));
  vDadosIni.MontaLinha(0037, vDadosIni.strzero(itx2, 6));
  WriteLn(arq, vDadosIni.auxstr);
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  closeFile(arq);

  if vInterrogacao then
  begin
    vLista := TStringList.Create;
    vLista.LoadFromFile(NomeArq);
    vLista[0] := copy(vLista[0], 1, 44) + vDadosIni.Replicate('?', 50);
    vLista.SaveToFile(NomeArq);
  end;

  vDadosIni.gerarMD5ArquivoEletronico(NomeArq);
  if FileExists(NomeArq) then
    Application.MessageBox(pchar('Arquivo "DAV Emitidos" criado com sucesso' + #13 +
      'O arquivo foi salvo em: ' + NomeArq), 'Atenção', 0 + 64);
  FDadosEmpAnxIII.Close;
  Result := true;
end;

{ TTerminalProc }

function TTerminalProc.AbreTerminal: boolean;
begin
  result := montaSelect('SELECT * FROM TERMINALF WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

constructor TTerminalProc.create;
begin
  DataSet := TClientDataSet(DtmArqsDig.CdsTerminalF);
  transacao := TIBTransaction(DtmArqsDig.IbTransArqDigs);
  buscas := TIBQuery(DtmArqsDig.qrBuscas);
end;

destructor TTerminalProc.destroy;
begin
  Close;
  inherited;
end;

{ TRelProdAnexoIV }

function TRelProdAnexoIV.Abreprodutos: boolean;
begin
  result :=
    montaSelect('select ''P'' tipo, p.grupo_prod, p.cod_prod, p.descr_prod, p.unidade,' +
    ' p.tipo_fab, p.icm_prod, p.isento_prod,  p.n_incidencia_prod, p.prec_tab_prod,' +
    ' (p.est_f + p.est_r) est_f from PRODUTOS p where p.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1');
end;

function TRelProdAnexoIV.Abreprodutos(valorPesquisa,
  codigoOuDescricao: string): boolean;
begin
  if codigoOuDescricao = 'D' then
    result :=
      montaSelect('select ''P'' tipo, p.grupo_prod, p.cod_prod, p.descr_prod, p.unidade,' +
      ' p.tipo_fab, p.icm_prod, p.isento_prod,  p.n_incidencia_prod, p.prec_tab_prod,' +
      ' (p.est_f + p.est_r) est_f from PRODUTOS p where p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1' +
      ' and p.descr_prod like ''' + valorPesquisa + '%''')
  else
  begin
    buscas.Close;
    buscas.SQL.Text :=
      ('select cb.* from cod_barra cb' +
      ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
      ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
      ' where cod_barra = ' + QuotedStr(valorPesquisa) +
      ' and cb.ativo = 1 and cb.cod_empresa = ' + vDadosIni.codEmpresa);
    buscas.Open;
    if not buscas.IsEmpty then
      result :=
        montaSelect('select ''P'' tipo, p.grupo_prod, p.cod_prod, p.descr_prod, p.unidade,' +
        ' p.tipo_fab, p.icm_prod, p.isento_prod,  p.n_incidencia_prod, p.prec_tab_prod,' +
        ' (p.est_f + p.est_r) est_f from PRODUTOS p where p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1' +
        ' and p.grupo_prod = ' + buscas.FieldByName('grupo_prod').AsString +
        ' and p.cod_prod = ' + QuotedStr(buscas.FieldByName('cod_prod').AsString));
    buscas.close;
  end;
end;

constructor TRelProdAnexoIV.create;
begin
  DataSet := TClientDataSet(DtmArqsDig.CdsAdigProdutos);
  transacao := TIBTransaction(DtmArqsDig.IbTransArqDigs);
  buscas := TIBQuery(DtmArqsDig.qrBuscas);
  FDadosEmp := TAdigEmpresa.create;
  vListaCodigo := TStringList.Create;
  vListaDescricao := TStringList.Create;
  vListaGrupoeCodigo := TStringList.Create;
end;

destructor TRelProdAnexoIV.destroy;
begin
  FDadosEmp.Free;
  inherited;
end;

function TRelProdAnexoIV.MontarArquivo(vend, totalOuParcial: string;
  vBarra: TprogressBar): boolean;
var
  //  vddini: TSingleton;
  Arq: TextFile;
  NomeArq: string;
  itx: integer;
  Buffer: Ansistring;
  vTemp: string;
  vInv: TInventario_Adig;
  vEstoq: Double;
  I: Integer;
  J: Integer;
  vOK: Boolean;
  vSql: string;
  nowStr: string;
  buscas2: TIBQuery;
  vInterrogacao: Boolean;
  vLista: TStringList;
begin
  Result := false;
  vInterrogacao := False;
  //messagedlg('O Arquivo será gerado na Pasta: ' + vend, mtinformation, [mbOK], 0);
  if totalOuParcial = 'T' then
    Abreprodutos;
  FDadosEmp.abreEmpresa;
  nowStr := DateTimeToStr(now);
  nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  NomeArq := vend + 'Estoque.' + totalOuParcial + '.' + nowStr + '.txt';// copy(datetostr(date), 4, 2) + copy(datetostr(date), 7, 4) + '.TXT';
  AssignFile(Arq, NomeArq);
  Rewrite(arq);
  vDadosIni.AuxStr := vDadosIni.Space(176);
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vDadosIni.MontaLinha(0001, 'E1');
  vDadosIni.MontaLinha(0003, FDadosEmp.dataSet.FieldByName('CNPJ_EMP').AsString);
  vDadosIni.MontaLinha(0017, copy(FDadosEmp.dataSet.FieldByName('IE_EMP').value, 1, 14));
  vTemp := FDadosEmp.dataSet.FieldByName('IM_EMP').AsString;
  vTemp := StringReplace(vTemp, ' ', '', [rfReplaceAll]);
  vTemp := StringReplace(vTemp, '.', '', [rfReplaceAll]);
  vTemp := StringReplace(vTemp, '-', '', [rfReplaceAll]);
  vDadosIni.MontaLinha(0031, copy(vTemp, 1, 14));
  vDadosIni.MontaLinha(0045, copy(FDadosEmp.dataSet.FieldByName('NOME_EMP').value, 1, 50));

  buscas.Close;
  buscas.SQL.Text := 'SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.TIPO_ECF,' +
    'CNIEE.MARCA_ECF,CNIEE.MODELO_ECF,CNIEE.VERSAOSB,IMP.DATA_SB,IMP.HORA_SB,' +
    'IMP.COD_TERMINAL,DES.CNPJ_EMPDES,DES.IE_EMPDES,DES.IM_EMPDES,DES.NOME_EMPDES,' +
    'FSC.NOME_PAF,FSC.VERSAO_PAF,FSC.MD5_PAF,FSC.ER_PAF_ECF,IMP.IDENT_CNIEE,' +
    ' IMP.DATA_ALT_EST_ECF, IMP.HORA_ALT_EST_ECF FROM ' +
    'TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE,TERMINALF TERM,' +
    'FISCAL_VERSOES FSC,EMPDESVOLV DES WHERE IMP.COD_TERMINAL = ' +
    vDadosIni.vCodTerminal + ' AND IMP.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO AND IMP.COD_TERMINAL = ' +
    'TERM.COD_TERMINAL AND IMP.COD_EMPRESA = ' +
    'TERM.COD_EMPRESA AND TERM.COD_FISCAL = FSC.COD_FISCAL AND FSC.COD_EMPDES = DES.COD_EMPDES';
  buscas.open;

  vDadosIni.MontaLinha(0095, buscas.FieldByName('NUM_SERIE_ECF').AsString);
  vDadosIni.MontaLinha(0115, buscas.FieldByName('MF_ADICIONAL').AsString);
  vDadosIni.MontaLinha(0116, buscas.FieldByName('TIPO_ECF').AsString);
  vDadosIni.MontaLinha(0123, buscas.FieldByName('MARCA_ECF').AsString);
  buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
  if (vMD5Func._validaMD5_TerminalImpressoras( buscas2,
    buscas.FieldByName('COD_TERMINAL').AsInteger,
    buscas.FieldByName('IDENT_CNIEE').AsString,
    Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString))) and
    (vMD5Func._validaMD5_EmpresaUsuaria(buscas2, StrToInt(vDadosIni.codEmpresa)) ) then
    vDadosIni.MontaLinha(0143, buscas.FieldByName('MODELO_ECF').AsString)
  else
    vDadosIni.MontaLinha(0143, '?');
  vDadosIni.MontaLinha(0163, StringReplace(FormatDateTime('YYYY/MM/DD', StrToDate(buscas.FieldByName('DATA_ALT_EST_ECF').AsString) ), '/', '',[rfReplaceAll]));
  vDadosIni.MontaLinha(0171, StringReplace(FormatDateTime('HH:MM:SS', StrToTime(buscas.FieldByName('HORA_ALT_EST_ECF').AsString) ), ':', '',[rfReplaceAll]));

  WriteLn(arq, vDadosIni.auxstr);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('E2', 0, 0, buscas);

  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  itx := 0;
  if totalOuParcial <> 'T' then
  begin
    ///  No arquivo parcial o usuario poderá informar quantos codigos e descricao ele quiser
    ///  O sistema armazena os codigos em um string list e as descricoes em outro
    ///  No momento de gerar o arquivo, aqui abaixo ele busca o grupo e codigo de cada um dos
    ///  codigos ou descricoes informadas e armazena em outro stringlist que possui o grupo e codigo

    vListaGrupoeCodigo.Clear;

    for I := 0 to vListaDescricao.Count - 1 do
    begin
      Abreprodutos(vListaDescricao[i], 'D');
      while not dataSet.Eof do
      begin
        vOK := True;
        for J := 0 to vListaGrupoeCodigo.Count - 1 do
          if (vDadosIni.getCampoPipe(vListaGrupoeCodigo[J], 1) =
            dataSet.FieldByName('grupo_prod').AsString) and
            (vDadosIni.getCampoPipe(vListaGrupoeCodigo[J], 2) =
            Trim(dataSet.FieldByName('cod_prod').AsString)) then
          begin
            vOK := False;
            Break
          end;
        if vOK then
          vListaGrupoeCodigo.Add(
            dataSet.FieldByName('grupo_prod').AsString + '|' +
            Trim(dataSet.FieldByName('cod_prod').AsString) + '|');
        dataSet.Next;
      end;
    end;

    for I := 0 to vListaCodigo.Count - 1 do
    begin
      Abreprodutos(vListaCodigo[i], 'C');
      while not dataSet.Eof do
      begin
        vOK := True;
        for J := 0 to vListaGrupoeCodigo.Count - 1 do
          if (vDadosIni.getCampoPipe(vListaGrupoeCodigo[J], 1) =
            dataSet.FieldByName('grupo_prod').AsString) and
            (vDadosIni.getCampoPipe(vListaGrupoeCodigo[J], 2) =
            Trim(dataSet.FieldByName('cod_prod').AsString)) then
          begin
            vOK := False;
            Break
          end;
        if vOK then
          vListaGrupoeCodigo.Add(
            dataSet.FieldByName('grupo_prod').AsString + '|' +
            Trim(dataSet.FieldByName('cod_prod').AsString) + '|');
        dataSet.Next;
      end;
    end;

    ///  Com o stringlist pronto, abaixo o sistema vai para cada grupo e codigo fazer um select
    vSql:='(';
    for I := 0 to vListaGrupoeCodigo.Count - 1 do
      vSql := vSql + ','+QuotedStr(
        vDadosIni.getCampoPipe(vListaGrupoeCodigo[i],1)+
        vDadosIni.getCampoPipe(vListaGrupoeCodigo[i],2));
    vSql := StringReplace(vSql,'(,','(',[rfReplaceAll]);
    vSql := vSql + ')';
    if vSql = '()' then
      vSql := '('''')';

    montaSelect('select ''P'' tipo, p.grupo_prod, p.cod_prod, p.descr_prod, p.unidade,' +
    ' p.tipo_fab, p.icm_prod, p.isento_prod,  p.n_incidencia_prod, p.prec_tab_prod,' +
    ' (p.est_f + p.est_r) est_f from PRODUTOS p where p.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 and p.grupo_prod||p.cod_prod in '+vSql);

  end;
  buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
  dataSet.First;
  while not dataSet.Eof do
  begin
    vDadosIni.AuxStr := vDadosIni.Space(96);
    vDadosIni.MontaLinha(0001, 'E2');
    vDadosIni.MontaLinha(0003, FDadosEmp.dataSet.FieldByName('CNPJ_EMP').value);
    vDadosIni.MontaLinha(0017, vDadosIni.strzero(
      dataSet.FieldByName('GRUPO_PROD').AsString +
      Trim(dataset.FieldByName('COD_PROD').AsString), 13));
    vDadosIni.MontaLinha(0031, copy(dataSet.FieldByName('DESCR_PROD').asstring, 1, 50));
    if vMD5Func._validaMD5_Produtos(buscas2,
      dataSet.FieldByName('GRUPO_PROD').AsInteger,
      Trim(dataSet.FieldByName('cod_prod').AsString)) then
      vDadosIni.MontaLinha(0081, copy(dataSet.FieldByName('UNIDADE').asstring, 1, 2))
    else
      vDadosIni.MontaLinha(0081, '?');

    if totalOuParcial = 'T' then
    begin
      if dataset.FieldByName('EST_F').AsFloat >= 0 then
        vDadosIni.MontaLinha(0087, '+')
      else
        vDadosIni.MontaLinha(0087, '-');
      vDadosIni.MontaLinha(0088, vDadosIni.StrZero( StringReplace(Format('%0.3f', [Abs(dataset.FieldByName('EST_F').AsCurrency)]), ',', '', [rfReplaceAll]) , 9));
//      vDadosIni.MontaLinha(0088, vDadosIni.TZero(Abs(dataset.FieldByName('EST_F').AsCurrency),
//        9));
//      vDadosIni.MontaLinha(0097, vdadosini.StrZero(YearOf(date), 4) +
//        vdadosini.StrZero(MonthOf(date), 2) +
//        vdadosini.StrZero(DayOf(date), 2));
    end
    else
    begin
      if vInv = nil then
        vInv := TInventario_Adig.create;
      vEstoq := vInv.retornaQtdeEmEstoque(DateToStr(date - 1),
        dataSet.FieldByName('grupo_prod').asInteger,
        dataSet.FieldByName('cod_prod').AsString);
      if vEstoq >= 0 then
        vDadosIni.MontaLinha(0087, '+')
      else
        vDadosIni.MontaLinha(0087, '-');
      vDadosIni.MontaLinha(0088, vDadosIni.StrZero( StringReplace(Format('%0.3f', [Abs(vEstoq)]), ',', '', [rfReplaceAll]) , 9));
//      vDadosIni.TZero(Abs(vEstoq), 9));
//      vDadosIni.MontaLinha(0097, vdadosini.StrZero(YearOf(date - 1), 4) +
//        vdadosini.StrZero(MonthOf(date - 1), 2) +
//        vdadosini.StrZero(DayOf(date - 1), 2));
    end;
    WriteLn(arq, vDadosIni.auxstr);
    itx := itx + 1;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    dataSet.Next;
  end;
  vDadosIni.AuxStr := vDadosIni.Space(36);
  vDadosIni.MontaLinha(0001, 'E9');
  vDadosIni.MontaLinha(0003, FDadosEmp.dataSet.FieldByName('CNPJ_EMP').aSSTRING);
  vDadosIni.MontaLinha(0017, copy(FDadosEmp.dataSet.FieldByName('IE_EMP').ASSTRING, 1, 14));
  vDadosIni.MontaLinha(0031, TRIM(vDadosIni.strzero(itx, 6)));
  WriteLn(arq, vDadosIni.auxstr);
  WriteLn(arq, '');
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  closeFile(arq);

  if vInterrogacao then
  begin
    vLista := TStringList.Create;
    vLista.LoadFromFile(NomeArq);
    vLista[0] := copy(vLista[0], 1, 44) + vDadosIni.Replicate('?', 50) + copy(vLista[0], 95, 176);
    vLista.SaveToFile(NomeArq);
  end;

  vDadosIni.gerarMD5ArquivoEletronico(NomeArq);
  if FileExists(NomeArq) then
    Application.MessageBox(pchar('Arquivo "Estoque" criado com sucesso' + #13 +
      'O arquivo foi salvo em: ' + NomeArq), 'Atenção', 0 + 64);

  FDadosEmp.Close;
  Result := true;
end;

{ TRelProdAnexoVI }

function TRelProdAnexoVI.AbFechArquivoVI(vend: string; vtp: integer): boolean;
var
  Buffer: Ansistring;
  vLista: TStringList;
begin
  if vtp = 1 then
  begin
    vSemRegistros := True;
    buscas.Close;
    buscas.SQL.TEXT := 'SELECT IMP.NUM_SERIE_ECF,CNIEE.IDENTIFICACAO ' +
      'FROM TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE WHERE IMP.COD_TERMINAL = ' +
      inttostr(vcdterminal) + ' AND IMP.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO ';
    buscas.Open;
    NomeArq := vend + buscas.FieldByName('IDENTIFICACAO').AsString +
      vDadosIni.Right(buscas.FieldByName('NUM_SERIE_ECF').AsString, 14) +
      copy(vDtMov, 1, 2) + copy(vDtMov, 4, 2) + copy(vDtMov, 7, 4) + '.TXT';
    buscas.Close;
    //messagedlg('O Arquivo será gerado na Pasta: ' + vend, mtinformation, [mbOK], 0);
    Abreprodutos;
    FDadosEmp.abreEmpresa;
    //  NomeArq := vend + 'aVI' + copy(datetostr(date), 4, 2) + copy(datetostr(date), 7, 4) + '.TXT';
    AssignFile(Arq, NomeArq);
    Rewrite(arq);
    vInterrogacao := False;
  end
  else
  begin
    closeFile(arq);

    if vInterrogacao then
    begin
      vLista := TStringList.Create;
      vLista.LoadFromFile(NomeArq);
      vLista[0] := copy(vLista[0], 1, 168) + vDadosIni.Replicate('?', 40) + copy(vLista[0], 209, 310) ;
      vLista.SaveToFile(NomeArq);
    end;

    vDadosIni.gerarMD5ArquivoEletronico(NomeArq);
    if (FileExists(NomeArq)) and (vPelaReducao = 'S') then
      Application.MessageBox(pchar('Arquivo "Movimento por ECF" criado com sucesso' + #13 +
        'O arquivo foi salvo em: ' + NomeArq), 'Atenção', 0 + 64);

    FDadosEmp.Close;
    //Application.MessageBox(pchar('Arquivo Criado com Sucesso!!!'), 'Informação', MB_ICONINFORMATION + MB_OK);
  end;
end;

function TRelProdAnexoVI.Abreprodutos: boolean;
begin

end;

constructor TRelProdAnexoVI.create;
begin
  if DtmArqsDig = nil then
    DtmArqsDig := TDtmArqsDig.Create(DtmArqsDig);
  DataSet := TClientDataSet(DtmArqsDig.CdsAnexoVI);
  transacao := TIBTransaction(DtmArqsDig.IbTransArqDigs);
  buscas := TIBQuery(DtmArqsDig.qrBuscas);
  FDadosEmp := TAdigEmpresa.create;
  Fterminais := TTerminalProc.create;
  Fterminais.AbreTerminal;
  vcdterminal := 0;
end;

destructor TRelProdAnexoVI.destroy;
begin
  FDadosEmp.free;
  Fterminais.Free;
  FDadosEmp := nil;
  Fterminais := nil;
  inherited;
end;

function TRelProdAnexoVI.getStringSemCaract(valor: string): string;
var
  temp: string;
begin
  temp := valor;
  temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, ';', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '/', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, ':', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '\', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '|', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '-', '', [rfReplaceAll, rfIgnoreCase]);
  Result := temp;
end;

procedure TRelProdAnexoVI.lerDadosArquivoCriptogravado;
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    cCNPJ := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'CNPJ', ''));
    cIE := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'IE', ''));
    cIE := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'IM', ''));
    cNOMEEMPRESA := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'NOMEEMPRESA', ''));
    cNOMEPAF := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'NOMEPAF', ''));
    cVERSAO := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'VERSAO', ''));
    cMD5LISTA := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'MD5LISTA', ''));
    cMD5LISTA := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'MD5LISTA', ''));
  finally
    arquivo.free;
  end;
end;

function TRelProdAnexoVI.MontarArquivoR01(vend: string; vBarra: TprogressBar;
  vtlbtp: Tlabel; vcod_terminal: integer): boolean;
var
  buscas2: TIBQuery;
begin
  FDadosEmp.abreEmpresa;
  montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.TIPO_ECF,' +
    'CNIEE.MARCA_ECF,CNIEE.MODELO_ECF,CNIEE.VERSAOSB,IMP.DATA_SB,IMP.HORA_SB,' +
    'IMP.COD_TERMINAL,DES.CNPJ_EMPDES,DES.IE_EMPDES,DES.IM_EMPDES,DES.NOME_EMPDES,' +
    'FSC.NOME_PAF,FSC.VERSAO_PAF,FSC.MD5_PAF,FSC.ER_PAF_ECF,IMP.IDENT_CNIEE FROM ' +
    'TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE,TERMINALF TERM,' +
    'FISCAL_VERSOES FSC,EMPDESVOLV DES WHERE IMP.COD_TERMINAL = ' +
    inttostr(vcod_terminal) + ' AND IMP.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO AND IMP.COD_TERMINAL = ' +
    'TERM.COD_TERMINAL AND IMP.COD_EMPRESA = ' +
    'TERM.COD_EMPRESA AND TERM.COD_FISCAL = FSC.COD_FISCAL AND FSC.COD_EMPDES = DES.COD_EMPDES');
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  vDadosIni.AuxStr := vDadosIni.Space(310);
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vDadosIni.MontaLinha(0001, 'R01');
  vDadosIni.MontaLinha(0004, dataSet.FieldByName('NUM_SERIE_ECF').AsString);
  vDadosIni.MontaLinha(0024, dataSet.FieldByName('MF_ADICIONAL').AsString);
  vDadosIni.MontaLinha(0025, dataSet.FieldByName('TIPO_ECF').AsString);
  vDadosIni.MontaLinha(0032, dataSet.FieldByName('MARCA_ECF').AsString);
  buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
  if (vMD5Func._validaMD5_TerminalImpressoras( buscas2,
    dataSet.FieldByName('COD_TERMINAL').AsInteger,
    dataSet.FieldByName('IDENT_CNIEE').AsString,
    Trim(dataSet.FieldByName('NUM_SERIE_ECF').AsString))) and
    (vMD5Func._validaMD5_EmpresaUsuaria(buscas2, StrToInt(vDadosIni.codEmpresa)) ) then
    vDadosIni.MontaLinha(0052, dataSet.FieldByName('MODELO_ECF').AsString)
  else
    vDadosIni.MontaLinha(0052, '?');
  vDadosIni.MontaLinha(0072, dataSet.FieldByName('VERSAOSB').AsString);
  vDadosIni.MontaLinha(0082, vDadosIni.StrZero(YearOf(dataSet.fieldbyname('DATA_SB').value), 4) +
    vDadosIni.StrZero(MonthOf(dataSet.fieldbyname('DATA_SB').value), 2) +
    vDadosIni.StrZero(DayOf(dataSet.fieldbyname('DATA_SB').value), 2));
  vDadosIni.MontaLinha(0090, copy(StringReplace(trim(dataset.FieldByName('HORA_SB').AsString), ':',
    '',
    [rfReplaceAll, rfIgnoreCase]) + '000000', 1, 6));
  //  vDadosIni.MontaLinha(0090, Copy(dataset.FieldByName('HORA_SB').AsString, 1, 2) +
  //    Copy(dataset.FieldByName('HORA_SB').AsString, 4, 2) +
  //    Copy(dataset.FieldByName('HORA_SB').AsString, 7, 2));
  vDadosIni.MontaLinha(0096, vDadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger, 3));
  vDadosIni.MontaLinha(0099, FDadosEmp.dataSet.FieldByName('cgc_emp').AsString);

  vDadosIni.MontaLinha(0113, copy(FDadosEmp.dataSet.FieldByName('IE_EMP').value, 1, 14));
  
    lerDadosArquivoCriptogravado;
    vDadosIni.MontaLinha(0127, vDadosIni.StrZero(Trim(cCNPJ),14));
    vDadosIni.MontaLinha(0141, vDadosIni.StrZero(Trim(getStringSemCaract(cIE)),14));
    vDadosIni.MontaLinha(0155, vDadosIni.StrZero(Trim(getStringSemCaract(cIM)),14));
    vDadosIni.MontaLinha(0169, cNOMEEMPRESA);
    vDadosIni.MontaLinha(0209, cNOMEPAF);
    vDadosIni.MontaLinha(0249, cVERSAO);
    vDadosIni.MontaLinha(0259, cMD5LISTA);

  vDadosIni.MontaLinha(0291, vDadosIni.StrZero(YearOf(strtodate(dtini)), 4) +
    vDadosIni.StrZero(MonthOf(strtodate(dtini)), 2) +
    vDadosIni.StrZero(DayOf(strtodate(dtini)), 2));
  vDadosIni.MontaLinha(0299, vDadosIni.StrZero(YearOf(strtodate(DtFinal)), 4) +
    vDadosIni.StrZero(MonthOf(strtodate(DtFinal)), 2) +
    vDadosIni.StrZero(DayOf(strtodate(DtFinal)), 2));
  vDadosIni.MontaLinha(0307, dataSet.FieldByName('ER_PAF_ECF').AsString);
  WriteLn(arq, vDadosIni.auxstr);
  vDadosIni.LimpaLinha(vDadosIni.AuxStr);
  vBarra.Position := vBarra.Position + 1;
  Application.ProcessMessages;
  dataSet.Close;
  Result := true;
end;

function TRelProdAnexoVI.MontarArquivoR02(vend: string; vBarra: TprogressBar;
  vtlbtp: Tlabel; vcod_terminal: integer): boolean;
var
  buscas2: TIBQuery;
begin
  montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.TIPO_ECF,' +
    'CNIEE.MARCA_ECF,CNIEE.MODELO_ECF,IMP.COD_TERMINAL,RES.NREDUCOES,RES.COORED,' +
    'RES.CRO_MOV,RES.DATA_MOV,RES.DATA_EMISSAO_Z,RES.HORA_EMISSAO_Z,RES.VLVENDAB,' +
    'IMP.ISSQNDESC FROM ' +
    'RESUMOD RES, TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE WHERE RES.DATA_MOV >= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(dtini)) + chr(39) +
    ' AND RES.DATA_MOV <= '
    + chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(DtFinal)) + chr(39) +
    ' AND RES.COD_TERMINAL = ' + inttostr(vcod_terminal) +
    ' AND RES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND RES.COD_TERMINAL = IMP.COD_TERMINAL AND RES.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO ');
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  vDadosIni.AuxStr := vDadosIni.Space(101);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('R02', strtodate(dtini), strtodate(DtFinal), buscas);

  dataSet.First;
  while not dataSet.eof do
  begin
    vSemRegistros := False;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vDadosIni.MontaLinha(0001, 'R02');
    vDadosIni.MontaLinha(0004, dataSet.FieldByName('NUM_SERIE_ECF').AsString);
    vDadosIni.MontaLinha(0024, dataSet.FieldByName('MF_ADICIONAL').AsString);

    buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
    if vMD5Func._validaMD5_ReducaoZ(buscas2,
      dataSet.FieldByName('COORED').AsInteger,
      dataSet.FieldByName('COD_TERMINAL').AsInteger,
      Trim(vDadosIni.vNumSerieEcf),
      dataSet.fieldbyname('DATA_MOV').AsString ) then
      vDadosIni.MontaLinha(0025, dataSet.FieldByName('MODELO_ECF').AsString)
    else
      vDadosIni.MontaLinha(0025, '?');

    vDadosIni.MontaLinha(0045, vDadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger, 2));
    vDadosIni.MontaLinha(0047, vDadosIni.StrZero(dataSet.FieldByName('NREDUCOES').AsInteger, 6));
    vDadosIni.MontaLinha(0053, vDadosIni.StrZero(dataSet.FieldByName('COORED').AsInteger, 6));
    vDadosIni.MontaLinha(0059, vDadosIni.StrZero(dataSet.FieldByName('CRO_MOV').AsInteger, 6));
    vDadosIni.MontaLinha(0065, vDadosIni.StrZero(YearOf(dataSet.fieldbyname('DATA_MOV').value), 4) +
      vDadosIni.StrZero(MonthOf(dataSet.fieldbyname('DATA_MOV').value), 2) +
      vDadosIni.StrZero(DayOf(dataSet.fieldbyname('DATA_MOV').value), 2));
    vDadosIni.MontaLinha(0073,
      vDadosIni.StrZero(YearOf(dataSet.fieldbyname('DATA_EMISSAO_Z').value), 4) +
      vDadosIni.StrZero(MonthOf(dataSet.fieldbyname('DATA_EMISSAO_Z').value), 2) +
      vDadosIni.StrZero(DayOf(dataSet.fieldbyname('DATA_EMISSAO_Z').value), 2));
    vDadosIni.MontaLinha(0081, Copy(dataset.FieldByName('HORA_EMISSAO_Z').AsString, 1, 2) +
      Copy(dataset.FieldByName('HORA_EMISSAO_Z').AsString, 4, 2) +
      Copy(dataset.FieldByName('HORA_EMISSAO_Z').AsString, 7, 2));
    vDadosIni.MontaLinha(0087, vDadosIni.Tzero(dataSet.FieldByName('VLVENDAB').AsCurrency, 14));
    vDadosIni.MontaLinha(0101, dataSet.FieldByName('ISSQNDESC').AsString);
    WriteLn(arq, vDadosIni.auxstr);
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    Application.ProcessMessages;
    dataSet.Next;
  end;
  dataSet.close;
  result := true;
end;

function TRelProdAnexoVI.MontarArquivoR03(vend: string; vBarra: TprogressBar;
  vtlbtp: Tlabel; vcod_terminal: integer): boolean;
var
  buscas2: TIBQuery;
begin
  montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,' +
    'IMP.COD_TERMINAL,RES.NREDUCOES,RES.COORED,MP.ALIQ_SEQ,MP.DESCALIQ,' +
    'MP.VALORALIQ ' +
    ' FROM RESUMOD RES, TERMINAL_IMPRESSORAS IMP,MAPA_RESUMO_ALIQ MP,' +
    'IMPRESSORAS_CNIEE CNIEE WHERE ' +
    'RES.DATA_MOV >= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(dtini)) + chr(39) +
    ' AND RES.DATA_MOV <= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(DtFinal)) + chr(39) +
    'AND RES.COD_TERMINAL = ' + inttostr(vcod_terminal) +
    ' AND RES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND RES.COD_TERMINAL = IMP.COD_TERMINAL AND RES.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO' +
    ' AND RES.COD_TERMINAL = MP.COD_TERMINAL ' +
    'AND RES.COORED = MP.COORED AND RES.COD_EMPRESA = MP.COD_EMPRESA ');
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  vDadosIni.AuxStr := vDadosIni.Space(72);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('R03', strtodate(dtini), strtodate(DtFinal), buscas);

  dataSet.First;
  while not dataSet.eof do
  begin
    vSemRegistros := False;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vDadosIni.MontaLinha(0001, 'R03');
    vDadosIni.MontaLinha(0004, dataSet.FieldByName('NUM_SERIE_ECF').AsString);
    vDadosIni.MontaLinha(0024, dataSet.FieldByName('MF_ADICIONAL').AsString);

    buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
    if vMD5Func._validaMD5_DetalhesReducaoZ(buscas2,
      dataSet.FieldByName('COORED').AsInteger,
      dataSet.FieldByName('COD_TERMINAL').AsInteger,
      Trim(dataSet.FieldByName('NUM_SERIE_ECF').AsString),
      dataSet.FieldByName('DESCALIQ').AsString) then
      vDadosIni.MontaLinha(0025, dataSet.FieldByName('MODELO_ECF').AsString)
    else
      vDadosIni.MontaLinha(0025, '?');
    vDadosIni.MontaLinha(0045, vDadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger, 2));
    vDadosIni.MontaLinha(0047, vDadosIni.StrZero(dataSet.FieldByName('NREDUCOES').AsInteger, 6));
    //    if  dataset.FieldByName('DESCALIQ').value in ['F','I'] then

    {   if (dataset.FieldByName('DESCALIQ').AsString <> 'F') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'I') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'N') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'FS') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'IS') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'NS') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'OPNF') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'DT') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'DS') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'AT') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'AS') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'Can-T') and
        (dataset.FieldByName('DESCALIQ').AsString <> 'Can-S') and
        then}
    vDadosIni.MontaLinha(0053, dataSet.FieldByName('DESCALIQ').value);
    vDadosIni.MontaLinha(0060, vDadosIni.Tzero(dataSet.FieldByName('VALORALIQ').AsCurrency, 13));
    WriteLn(arq, vDadosIni.auxstr);
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    Application.ProcessMessages;
    dataSet.Next;
  end;
  dataSet.close;
  result := true;
end;

function TRelProdAnexoVI.MontarArquivoR04(vend: string; vBarra: TprogressBar;
  vtlbtp: Tlabel; vcod_terminal: integer): boolean;
var
  buscas2: TIBQuery;
begin
  montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,' +
    'IMP.COD_TERMINAL,CP.CCF,CP.CUPOM,CP.DATA,CP.VALORCUPOM,' + //CP.ACRES_DESC,'+
    'CP.VALOR_DESC,CP.VALOR_ACRES,CP.STATUS_CP,CP.TOTAL,CP.CLIENTE,CP.REGISTRO ' +
    ' FROM CUPOM CP, TERMINAL_IMPRESSORAS IMP, IMPRESSORAS_CNIEE CNIEE WHERE ' +
    'CP.DATA >= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(dtini)) + chr(39) +
    'AND CP.DATA <= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(DtFinal)) + chr(39) +
    ' AND CP.COD_TERMINAL = ' + inttostr(vcod_terminal) +
    ' AND CP.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND CP.COD_TERMINAL = IMP.COD_TERMINAL AND CP.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO');
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  vDadosIni.AuxStr := vDadosIni.Space(191);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('R04', strtodate(dtini), strtodate(DtFinal), buscas);

  dataSet.First;
  while not dataSet.eof do
  begin
    vSemRegistros := False;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vDadosIni.MontaLinha(0001, 'R04');
    vDadosIni.MontaLinha(0004, dataSet.FieldByName('NUM_SERIE_ECF').AsString);
    vDadosIni.MontaLinha(0024, dataSet.FieldByName('MF_ADICIONAL').AsString);

    buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
    if vMD5Func._validaMD5_Cupom(buscas2,
      dataSet.FieldByName('CUPOM').AsInteger,
      dataSet.FieldByName('COD_TERMINAL').AsInteger,
      dataSet.FieldByName('REGISTRO').AsInteger,
      Trim(vDadosIni.vNumSerieEcf)) then
      vDadosIni.MontaLinha(0025, dataSet.FieldByName('MODELO_ECF').AsString)
    else
      vDadosIni.MontaLinha(0025, '?');

    vDadosIni.MontaLinha(0045, vDadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger, 2));
    vDadosIni.MontaLinha(0047, vDadosIni.StrZero(dataSet.FieldByName('CCF').AsInteger, 6));
    vDadosIni.MontaLinha(0053, vDadosIni.StrZero(dataSet.FieldByName('CUPOM').AsInteger, 6));
    vDadosIni.MontaLinha(0059, vDadosIni.StrZero(YearOf(dataSet.fieldbyname('DATA').value), 4) +
      vDadosIni.StrZero(MonthOf(dataSet.fieldbyname('DATA').value), 2) +
      vDadosIni.StrZero(DayOf(dataSet.fieldbyname('DATA').value), 2));
    vDadosIni.MontaLinha(0067, vDadosIni.Tzero(dataSet.FieldByName('TOTAL').AsCurrency, 14));
    // Colocar o valor total neste campo...
    vDadosIni.MontaLinha(0081, vDadosIni.Tzero(dataSet.FieldByName('VALOR_DESC').AsCurrency, 13));
    // Olhar se este campo está sendo convertido normalmente...
    vDadosIni.MontaLinha(0094, 'V');
    vDadosIni.MontaLinha(0095, vDadosIni.Tzero(dataSet.FieldByName('VALOR_ACRES').AsCurrency, 13));
    // Olhar se este campo está sendo convertido normalmente...
    vDadosIni.MontaLinha(0108, 'V');
    vDadosIni.MontaLinha(0109, vDadosIni.Tzero(dataSet.FieldByName('VALORCUPOM').AsCurrency, 14));
    // Verificar se este campo é mesmo o total liquido do cupom
    if dataset.fieldbyname('STATUS_CP').AsString = 'CANCELADO' then
      vDadosIni.MontaLinha(0123, 'S')
    else
      vDadosIni.MontaLinha(0123, 'N');
    vDadosIni.MontaLinha(0124, vDadosIni.Tzero(0, 13));
    vDadosIni.MontaLinha(0137, 'D');
    if (not dataset.fieldbyname('CLIENTE').IsNull) and (dataset.fieldbyname('CLIENTE').AsInteger <>
      0) then
    begin
      buscas.close;
      buscas.SQL.Text := 'SELECT * FROM CLIENTES WHERE COD_CLIENTE = ' +
        dataset.fieldbyname('CLIENTE').AsString +
        ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas.open;
      if not buscas.IsEmpty then
      begin
        vDadosIni.MontaLinha(0138, buscas.FieldByName('NOME_CLIENTE').AsString);
        try
          //          buscas.FieldByName('CPFCGC').AsInteger;
          vDadosIni.MontaLinha(0178, vDadosIni.StrZero(trim(buscas.FieldByName('CPFCGC').AsString),
            14));
        except
          vDadosIni.MontaLinha(0178, vDadosIni.StrZero(0, 14));
        end;
      end
      else
        vDadosIni.MontaLinha(0178, vDadosIni.StrZero(0, 14));
    end
    else
      vDadosIni.MontaLinha(0178, vDadosIni.StrZero(0, 14));
    WriteLn(arq, vDadosIni.auxstr);
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    Application.ProcessMessages;
    dataSet.Next;
  end;
  dataSet.close;
  result := true;
end;

function TRelProdAnexoVI.MontarArquivoR05(vend: string; vBarra: TprogressBar;
  vtlbtp: Tlabel; vcod_terminal: integer): boolean;
var
  buscas2: TIBQuery;
begin
  // Seria interessante mudar o tamanho da descrição do item....
  // O Acréscimo será em cima do rat_acres
  {montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,' +
    'IMP.COD_TERMINAL,CP.CCF,CP.CUPOM,CP.DATA,IT.NITEM,IT.CODBARRA,' +
    'IT.DESCR_IT,IT.QUANTIDADE,PROD.UNIDADE,IT.PRECO,IT.PERC_DESC,IT.RAT_ACRES, ' +
    '(IT.TOTAL-IT.PERC_DESC+RAT_ACRES) AS VLTOTLIQ,IT.DESCALIQ,IT.STATUS_IT,PROD.ARREDONDAR_TRUNCAR,' +
    'IT.CSDECQTDE,IT.CSDECVLUNT,PROD.TIPO_FAB, IT.REGISTRO, IT.ORDEM ' +
    ' FROM CUPOM2 IT,PRODUTOS PROD,CUPOM CP,TERMINAL_IMPRESSORAS IMP,' +
    'IMPRESSORAS_CNIEE CNIEE WHERE ' +
    'IT.COD_TERMINAL = ' + inttostr(vcod_terminal) + ' AND IT.COD_EMPRESA = ' +
    vDadosIni.codEmpresa +
    ' AND IT.COD_TERMINAL = CP.COD_TERMINAL ' +
    ' AND IT.NSERIEECF = CP.NSERIEECF ' +
    ' AND IT.CUPOM = CP.CUPOM AND IT.ORDEM = CP.REGISTRO AND ' +
    ' IT.COD_EMPRESA = CP.COD_EMPRESA AND IT.GRUPO_PROD = PROD.GRUPO_PROD ' +
    'AND IT.COD_PROD = PROD.COD_PROD AND IT.COD_EMPRESA = PROD.COD_EMPRESA AND CP.DATA >= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(dtini)) + chr(39) +
    'AND CP.DATA <= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(DtFinal)) + chr(39) +
    ' AND CP.COD_TERMINAL = IMP.COD_TERMINAL AND CP.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO');}
  montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,' +
    'IMP.COD_TERMINAL,CP.CCF,CP.CUPOM,CP.DATA,IT.NITEM,IT.CODBARRA,' +
    'IT.DESCR_IT,IT.QUANTIDADE,IT.PRECO,IT.PERC_DESC,IT.RAT_ACRES, ' +
    '(IT.TOTAL-IT.PERC_DESC+RAT_ACRES) AS VLTOTLIQ,IT.DESCALIQ,IT.STATUS_IT,' +
    'IT.CSDECQTDE,IT.CSDECVLUNT,IT.REGISTRO, IT.ORDEM, it.grupo_prod, it.cod_prod ' +
    ' FROM CUPOM2 IT,CUPOM CP,TERMINAL_IMPRESSORAS IMP,' +
    'IMPRESSORAS_CNIEE CNIEE WHERE ' +
    'IT.COD_TERMINAL = ' + inttostr(vcod_terminal) + ' AND IT.COD_EMPRESA = ' +
    vDadosIni.codEmpresa +
    ' AND IT.COD_TERMINAL = CP.COD_TERMINAL ' +
//    ' AND IT.NSERIEECF = CP.NSERIEECF ' +
//    ' AND IT.CUPOM = CP.CUPOM' +
    ' AND IT.ORDEM = CP.REGISTRO AND ' +
    ' IT.COD_EMPRESA = CP.COD_EMPRESA  ' +
    'AND CP.DATA >= ' + chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(dtini)) + chr(39) +
    'AND CP.DATA <= ' + chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(DtFinal)) + chr(39) +
    ' AND CP.COD_TERMINAL = IMP.COD_TERMINAL AND CP.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO');

  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  vDadosIni.AuxStr := vDadosIni.Space(268);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('R05', strtodate(dtini), strtodate(DtFinal), buscas);

  dataSet.First;
  while not dataSet.eof do
  begin
    vSemRegistros := False;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vDadosIni.MontaLinha(0001, 'R05');
    vDadosIni.MontaLinha(0004, dataSet.FieldByName('NUM_SERIE_ECF').AsString);
    vDadosIni.MontaLinha(0024, dataSet.FieldByName('MF_ADICIONAL').AsString);

    buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
    if vMD5Func._validaMD5_Cupom2(buscas2,
      dataSet.FieldByName('COD_TERMINAL').AsInteger,
      dataSet.FieldByName('REGISTRO').AsInteger,
      dataSet.FieldByName('NITEM').AsInteger,
      dataSet.FieldByName('CUPOM').AsInteger,
      dataSet.FieldByName('ORDEM').AsInteger,
      Trim(vDadosIni.vNumSerieEcf)) then
      vDadosIni.MontaLinha(0025, dataSet.FieldByName('MODELO_ECF').AsString)
    else
      vDadosIni.MontaLinha(0025, '?');

    vDadosIni.MontaLinha(0045, vDadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger, 2));
    vDadosIni.MontaLinha(0047, vDadosIni.StrZero(dataSet.FieldByName('CUPOM').AsInteger, 6));
    vDadosIni.MontaLinha(0053, vDadosIni.StrZero(dataSet.FieldByName('CCF').AsInteger, 6));
    vDadosIni.MontaLinha(0059, vDadosIni.StrZero(dataset.FieldByName('NITEM').AsInteger, 3));
    vDadosIni.MontaLinha(0062, dataSet.fieldbyname('CODBARRA').AsString);
    vDadosIni.MontaLinha(0076, dataSet.fieldbyname('DESCR_IT').AsString);
    vDadosIni.MontaLinha(0176, vDadosIni.Tzero(dataSet.FieldByName('QUANTIDADE').AsCurrency, 7));

    buscas2.Close;
    buscas2.SQL.Text := 'select unidade, arredondar_truncar, tipo_fab from produtos' +
      ' where grupo_prod = ' + IntToStr( dataSet.FieldByName('grupo_prod').AsInteger ) +
      ' and cod_prod = ' + QuotedStr( dataSet.FieldByName('cod_prod').AsString ) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas2.Open;

    vDadosIni.MontaLinha(0183, buscas2.FieldByName('UNIDADE').AsString);
    vDadosIni.MontaLinha(0186, vDadosIni.Tzero(dataSet.FieldByName('PRECO').AsCurrency, 8));
    vDadosIni.MontaLinha(0194, vDadosIni.Tzero(dataSet.FieldByName('PERC_DESC').AsCurrency, 8));
    vDadosIni.MontaLinha(0202, vDadosIni.Tzero(dataSet.FieldByName('RAT_ACRES').AsCurrency, 8));
    vDadosIni.MontaLinha(0210, vDadosIni.Tzero(dataSet.FieldByName('VLTOTLIQ').AsCurrency, 14));
    vDadosIni.MontaLinha(0224, dataSet.FieldByName('DESCALIQ').AsString);
    if dataSet.fieldbyname('STATUS_IT').AsString = 'CANCELADO' then
      vDadosIni.MontaLinha(0231, 'S')
    else
      vDadosIni.MontaLinha(0231, 'N');
    vDadosIni.MontaLinha(0232, vDadosIni.Tzero(0, 7));
    vDadosIni.MontaLinha(0239, vDadosIni.Tzero(0, 13));
    vDadosIni.MontaLinha(0252, vDadosIni.Tzero(0, 13));
    if (buscas2.FieldByName('ARREDONDAR_TRUNCAR').isnull) or
      (buscas2.FieldByName('ARREDONDAR_TRUNCAR').value = '') then
      vDadosIni.MontaLinha(0265, 'T')
    else
      vDadosIni.MontaLinha(0265, buscas2.FieldByName('ARREDONDAR_TRUNCAR').AsString);

    if (buscas2.FieldByName('TIPO_FAB').isnull) or (buscas2.FieldByName('TIPO_FAB').value = '') then
      vDadosIni.MontaLinha(0266, 'T')
    else
      vDadosIni.MontaLinha(0266, buscas2.FieldByName('TIPO_FAB').asstring);
    vDadosIni.MontaLinha(0267, dataSet.FieldByName('CSDECQTDE').asstring);
    vDadosIni.MontaLinha(0268, dataSet.FieldByName('CSDECVLUNT').asstring);
    WriteLn(arq, vDadosIni.auxstr);
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    Application.ProcessMessages;
    dataSet.Next;
  end;
  dataSet.close;
  result := true;
end;

function TRelProdAnexoVI.MontarArquivoR06(vend: string; vBarra: TprogressBar;
  vtlbtp: Tlabel; vcod_terminal: integer): boolean;
var
  buscas2: TIBQuery;
begin
  montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,' +
    'IMP.COD_TERMINAL,DOC.COO_ECF,DOC.GNF_ECF,DOC.GRG_ECF,DOC.CDC_ECF,' +
    'DOC.TIPO_DOC_ECF,DOC.DATA_F_EMISSAO,DOC.HORA_F_EMISSAO ' +
    ' FROM DOC_NAOFISCAL_TERMINAL DOC, TERMINAL_IMPRESSORAS IMP,' +
    'IMPRESSORAS_CNIEE CNIEE WHERE ' +
    'DOC.DATA_F_EMISSAO >= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(dtini)) + chr(39) +
    'AND DOC.DATA_F_EMISSAO <= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(DtFinal)) + chr(39) +
    ' AND DOC.COD_TERMINAL = ' + inttostr(vcod_terminal) +
    ' AND DOC.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND DOC.COD_TERMINAL = IMP.COD_TERMINAL AND DOC.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO');
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  vDadosIni.AuxStr := vDadosIni.Space(84);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('R06', strtodate(dtini), strtodate(DtFinal), buscas);

  dataSet.First;
  while not dataSet.eof do
  begin
    vSemRegistros := False;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vDadosIni.MontaLinha(0001, 'R06');
    vDadosIni.MontaLinha(0004, dataSet.FieldByName('NUM_SERIE_ECF').AsString);
    vDadosIni.MontaLinha(0024, dataSet.FieldByName('MF_ADICIONAL').AsString);

    buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
    if vMD5Func._validaMD5_DocNaoFiscal(buscas2,
      dataSet.FieldByName('COO_ECF').AsInteger,
      dataSet.FieldByName('COD_TERMINAL').AsInteger,
      Trim(vDadosIni.vNumSerieEcf)) then
      vDadosIni.MontaLinha(0025, dataSet.FieldByName('MODELO_ECF').AsString)
    else
      vDadosIni.MontaLinha(0025, '?');
      
    vDadosIni.MontaLinha(0045, vDadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger, 2));
    vDadosIni.MontaLinha(0047, vDadosIni.StrZero(dataSet.FieldByName('COO_ECF').AsInteger, 6));
    vDadosIni.MontaLinha(0053, vDadosIni.StrZero(dataSet.FieldByName('GNF_ECF').AsInteger, 6));
    vDadosIni.MontaLinha(0059, vDadosIni.StrZero(dataSet.FieldByName('GRG_ECF').AsInteger, 6));
    vDadosIni.MontaLinha(0065, vDadosIni.StrZero(dataSet.FieldByName('CDC_ECF').AsInteger, 4));
    vDadosIni.MontaLinha(0069, dataSet.FieldByName('TIPO_DOC_ECF').AsString);
    vDadosIni.MontaLinha(0071,
      vDadosIni.StrZero(YearOf(dataSet.fieldbyname('DATA_F_EMISSAO').value), 4) +
      vDadosIni.StrZero(MonthOf(dataSet.fieldbyname('DATA_F_EMISSAO').value), 2) +
      vDadosIni.StrZero(DayOf(dataSet.fieldbyname('DATA_F_EMISSAO').value), 2));
    vDadosIni.MontaLinha(0079, StringReplace(dataSet.fieldbyname('HORA_F_EMISSAO').AsString, ':',
      '',
      [rfReplaceAll, rfIgnoreCase]));
    WriteLn(arq, vDadosIni.auxstr);
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    Application.ProcessMessages;
    dataSet.Next;
  end;
  dataSet.close;
  result := true;
end;

function TRelProdAnexoVI.MontarArquivoR07(vend: string; vBarra: TprogressBar;
  vtlbtp: Tlabel; vcod_terminal: integer): boolean;
var
  buscas2: TIBQuery;
begin
  montaSelect('SELECT IMP.NUM_SERIE_ECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,' +
    'IMP.COD_TERMINAL,FIN.CUPOM,FIN.CCF_ECF,FIN.GNF_ECF,' +
    'FIN.VALOR,fnz.descricao,FIN.registro ' +
    ' FROM FINCUPOM FIN, TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE, ' +
    ' finalizadores fnz ' +
    ' WHERE ' +
    'FIN.DATA >= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(dtini)) + chr(39) +
    'AND FIN.DATA <= ' +
    chr(39) + FormatDateTime('mm/dd/yyyy', strtodate(DtFinal)) + chr(39) +
    ' AND FIN.COD_TERMINAL = ' + inttostr(vcod_terminal) +
    ' AND FIN.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND FIN.COD_TERMINAL = IMP.COD_TERMINAL AND FIN.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO' +
    ' and fnz.cod_finalizador = fin.finalizador' +
    ' and fnz.cod_empresa = fin.cod_empresa' +
//    ' and fnz.nserieecf = fin.nserieecf' +
    ' and fnz.cod_terminal = fin.cod_terminal AND COALESCE(FIN.VALOR, 0) > 0');
  vBarra.Max := dataSet.RecordCount;
  vBarra.Min := 0;
  vBarra.Position := 1;
  vDadosIni.AuxStr := vDadosIni.Space(106);

  if not vInterrogacao then
    vInterrogacao := _registrosIncluidosOuExcluidos('R07', strtodate(dtini), strtodate(DtFinal), buscas);

  dataSet.First;
  while not dataSet.eof do
  begin
    vSemRegistros := False;
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vDadosIni.MontaLinha(0001, 'R07');
    vDadosIni.MontaLinha(0004, dataSet.FieldByName('NUM_SERIE_ECF').AsString);
    vDadosIni.MontaLinha(0024, dataSet.FieldByName('MF_ADICIONAL').AsString);

    buscas2 := TIBQuery(DtmArqsDig.QrBuscas2);
    if vMD5Func._validaMD5_FinCupom(buscas2,
      dataSet.FieldByName('registro').AsInteger,
      dataSet.FieldByName('COD_TERMINAL').AsInteger,
      Trim(vDadosIni.vNumSerieEcf)) then
      vDadosIni.MontaLinha(0025, dataSet.FieldByName('MODELO_ECF').AsString)
    else
      vDadosIni.MontaLinha(0025, '?');
    vDadosIni.MontaLinha(0045, vDadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger, 2));
    vDadosIni.MontaLinha(0047, vDadosIni.StrZero(dataSet.FieldByName('CUPOM').AsInteger, 6));
    vDadosIni.MontaLinha(0053, vDadosIni.StrZero(dataSet.FieldByName('CCF_ECF').AsInteger, 6));
    vDadosIni.MontaLinha(0059, vDadosIni.StrZero(dataSet.FieldByName('GNF_ECF').AsInteger, 6));
    vDadosIni.MontaLinha(0065, dataSet.FieldByName('descricao').asstring);
    vDadosIni.MontaLinha(0080, vDadosIni.Tzero(dataSet.FieldByName('VALOR').AsCurrency, 13));
    vDadosIni.MontaLinha(0093, 'N');
    vDadosIni.MontaLinha(0094, vDadosIni.Tzero(0.00, 13));
    WriteLn(arq, vDadosIni.auxstr);
    vDadosIni.LimpaLinha(vDadosIni.AuxStr);
    vBarra.Position := vBarra.Position + 1;
    Application.ProcessMessages;
    dataSet.Next;
  end;
  dataSet.close;
  result := true;
end;

function TRelProdAnexoVI.montarquivoVI(vend: string;
  vBarra: TprogressBar; vtlbtp: Tlabel): boolean;
begin
  try
    strtodate(dtini);
    strtodate(DtFinal);
  except
    messagedlg('Data inicial ou Final inválida(s) para o período informado!!!', mtinformation,
      [mbOK], 0);
    Result := false;
    exit;
  end;
  if vcdterminal = 0 then
  begin
    messagedlg('Código do Terminal incorreto!!!', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  AbFechArquivoVI(vend, 1);
  //  while not vcdsterminais.eof do
  //  begin
  if MontarArquivoR01(vend, vBarra, vtlbtp, vcdterminal) then
    if MontarArquivoR02(vend, vBarra, vtlbtp, vcdterminal) then
      if MontarArquivoR03(vend, vBarra, vtlbtp, vcdterminal) then
        if MontarArquivoR04(vend, vBarra, vtlbtp, vcdterminal) then
          if MontarArquivoR05(vend, vBarra, vtlbtp, vcdterminal) then
            if MontarArquivoR06(vend, vBarra, vtlbtp, vcdterminal) then
              if MontarArquivoR07(vend, vBarra, vtlbtp, vcdterminal) then
                result := true
              else
              begin
                Result := false;
                //                  break;
              end;
  //  end;
  if (vSemRegistros) and (not vGerarArqMesmoSemMov) then
  begin
    Result := False;
    Rewrite(arq);
    CloseFile(Arq);
    DeleteFile(pchar(NomeArq)); 
    NomeArq := '';
  end;
  if Result then
  begin
    AbFechArquivoVI(vend, 2);
    result := true;
  end
  else
    Result := false;
end;

{ TInventario_Adig }

constructor TInventario_Adig.create;
begin
  if DtmArqsDig = nil then
    DtmArqsDig := TDtmArqsDig.Create(DtmArqsDig);
  transacao := TIBTransaction(DtmArqsDig.IbTransArqDigs);
  Buscas := TIBQuery(DtmArqsDig.qrInventario);
end;

destructor TInventario_Adig.Destroy;
begin
  buscas.close;
  inherited;
end;

function TInventario_Adig.getQtdItensCompra(codprod: string; grupoprod: integer;
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

function TInventario_Adig.getQtdItensDevolvidos(codprod: string;
  grupoprod: integer; data: TDateTime): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(quant*valor) as SomaValorDevolvido,sum(quant) as qtdItemDevolvido from devolucao ' +
    ' where cod_prod = ' + quotedstr(trim(codprod)) +
    ' and grupo_prod = ' + inttostr(grupoprod) +
    ' and data  >= :vdata ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := buscas.FieldByName('qtdItemDevolvido').AsFloat;
  buscas.Close;
end;

function TInventario_Adig.getQtdItensVenda(codprod: string; grupoprod: integer;
  data: TDateTime): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as qtdItemREQOS,sum(ipv.quant_ped_item * ipv.pcust_mc) as vCustoMedio ' +
    ' from pedvenda_prod ipv,pedvenda pv ' +
    ' where ipv.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and ((pv.tipo=' + quotedstr('REQ') + ') or (pv.tipo=' + quotedstr('OS') + ')) ' +
    ' and ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and ipv.nped = pv.nped and pv.data_fech  >= :vdata ' +
    ' and ((ipv.status is null) or (ipv.status <> ''CANCELADO''))'+
    ' and pv.cod_empresa = ipv.cod_empresa ' +
    ' and ipv.tipo=pv.tipo' +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo=1';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := buscas.FieldByName('qtdItemREQOS').AsFloat;
  buscas.Close;
end;

function TInventario_Adig.retornaQtdeEmEstoque(DataReferencia: string;
  GrupoProd: integer; CodProd: string): Double;
var
  vqtdg, vEstoque, vQtdItemVnd, qtdItemCompras, qtdItemDevolvido: real;
  qrBuscaProd: TIBQuery;
  strTemp: string;
begin
  if DtmArqsDig = nil then
    DtmArqsDig := TDtmArqsDig.Create(DtmArqsDig);
  vDataReferencia := DataReferencia;
  qrBuscaProd := TIBQuery(DtmArqsDig.qrBuscaInvet);
  Buscas := TIBQuery(DtmArqsDig.qrInventario);
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
    ' ) or ((pr.est_f+pr.est_r) > 0 and pr.cod_empresa = ' + vDadosIni.codEmpresa + '))';
  qrBuscaProd.Open;

  if not qrBuscaProd.IsEmpty then
  begin
    qtdItemCompras := getQtdItensCompra(CodProd, GrupoProd, StrToDate(vDataReferencia));
    vQtdItemVnd := getQtdItensVenda(CodProd, GrupoProd, StrToDate(vDataReferencia));
    qtdItemDevolvido := getQtdItensDevolvidos(CodProd, GrupoProd, StrToDate(vDataReferencia));
    vEstoque := (((qrBuscaProd.FieldByName('EST_F').AsFloat + qrBuscaProd.FieldByName('EST_R').AsFloat) - (qtdItemCompras + qtdItemDevolvido)) + (vQtdItemVnd));
  end
  else
    vEstoque := 0;
  qrBuscaProd.close;
  buscas.close;
  result := vEstoque;
end;

{ TAnexos }

function TAnexos._registrosIncluidosOuExcluidos(pTipo: string; pDataIni, pDataFim: TDate; pBuscas: TIBQuery): Boolean;
begin
  Result := False;
  if pTipo = 'E2' then
    pTipo := 'P2';

  try
    pBuscas.Close;
    pBuscas.SQL.Text := '';
    pBuscas.SQL.Text := 'select count(seqid) contador from evidencias_paf' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and registro = ' + QuotedStr(pTipo);
    if pDataIni > 0 then
    begin
      pBuscas.SQL.Text := pBuscas.SQL.Text + ' and data_movimento >= :dataIni' +
        ' and data_movimento <= :dataFim';
      pBuscas.ParamByName('dataIni').AsDate := pDataIni;
      pBuscas.ParamByName('dataFim').AsDate := pDataFim;
    end;
    pBuscas.Open;

    Result := pBuscas.FieldByName('contador').AsInteger > 0;
  finally
    pBuscas.Close;
  end;
  
end;

{ TAnexoIV }

procedure TAnexoIV.addProgress(pProgress: TProgressBar; pMin, pMax,
  pPosition: Integer);
begin
  if pProgress <> nil then
  begin
    pProgress.Min := pMin;
    pProgress.Max := pMax;
    if pPosition = 0 then
      pProgress.Position := 0
    else
      pProgress.Position := pProgress.Position + pPosition;
    Application.ProcessMessages;
  end
  else if pMax > 0 then
    vDadosIni.abreStatusProcessamento('', 'Processando. ' + IntToStr(Trunc(pMin / pMax * 100)) + '%' )
  else
    vDadosIni.abreStatusProcessamento('', 'Aguarde');
end;

constructor TAnexoIV.create;
begin

  fMD5 := TManutencaoAlteracoesArquivosPAF.create;

  fListaArquivo := TStringList.Create;
  fDelimitador := '|';

  inherited;
  
  fBuscas := TIBQuery.Create(Application);
  fBuscas.Database := Banco;
  fBuscas.Transaction := Transacao;

  fQrMD5 := TIBQuery.Create(Application);
  fQrMD5.Database := Banco;
  fQrMD5.Transaction := Transacao;
end;

destructor TAnexoIV.destroy;
begin

  inherited;
end;

function TAnexoIV.formatarArquivo: Boolean;
var
  I: Integer;
  vListaNova: TStringList;
  vTipo: string;
begin
	vListaNova := TStringList.Create;

  for I := 0 to fListaArquivo.Count - 1 do
  begin
    vTipo := vDadosIni.getCampoPipe(fListaArquivo[I], 1);
    if vTipo = 'U1' then
      vListaNova.Add(posicionarTexto(fListaArquivo[I], 094, [ 1, 3, 17, 31, 45]))
    else if vTipo = 'A2' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 048, [ 1, 3, 11, 36, 37]))
    else if vTipo = 'P2' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 105, [ 1, 3, 17, 31, 81, 87, 88, 89, 90, 94]))
    else if vTipo = 'E2' then
      vListaNova.Add(posicionarTexto(fListaArquivo[I], 096, [ 1, 3, 17, 31, 81, 87, 88]))
		else if vTipo = 'E3' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 084, [ 1, 3, 23, 24, 31, 51, 71, 79]))
		else if vTipo = 'D2' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 218, [ 1, 3, 17, 37, 38, 45, 65, 85, 94, 107, 115, 145, 153, 162, 165, 205]))
		else if vTipo = 'D3' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 196, [ 1, 3, 16, 24, 27, 41, 141, 148, 151, 159, 167, 175, 189, 190, 194, 195, 196]))
		else if vTipo = 'D4' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 200, [ 1, 3, 16, 24, 30, 44, 144, 151, 154, 162, 170, 178, 192, 193, 197, 198, 199, 200]))
		else if vTipo = 'H2' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 138, [ 1, 3, 17, 37, 38, 45, 65, 85, 91, 97, 110, 118, 132]))
		else if vTipo = 'S2' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 085, [ 1, 3, 17, 25, 31, 44, 57, 66]))
		else if vTipo = 'S3' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 177, [ 1, 3, 17, 25, 31, 44, 58, 158, 165, 168, 176, 177]))
		else if vTipo = 'R01' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 310, [ 1, 4, 24, 25, 32, 52, 72, 82, 90, 96, 99, 113, 127, 141, 155, 169, 209, 249, 259, 291, 299, 307]))
		else if vTipo = 'R02' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 104, [ 1, 4, 24, 25, 45, 47, 53, 62, 68, 76, 84, 90, 104]))
		else if vTipo = 'R03' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 072, [ 1, 4, 24, 25, 45, 47, 53, 60]))
		else if vTipo = 'R04' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 197, [ 1, 4, 24, 25, 45, 47, 56, 65, 73, 87, 100, 101, 114, 115, 129, 130, 143, 144, 184]))
		else if vTipo = 'R05' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 274, [ 1, 4, 24, 25, 45, 47, 56, 65, 68, 82, 182, 189, 192, 200, 208, 216, 230, 237, 238, 245, 258, 271, 272, 273, 274]))
		else if vTipo = 'R06' then
			vListaNova.Add(posicionarTexto(fListaArquivo[I], 087, [ 1, 4, 24, 25, 45, 47, 56, 62, 68, 72, 74, 82]))
    else if vTipo = 'R07' then
      vListaNova.Add(posicionarTexto(fListaArquivo[I], 112, [ 1, 4, 24, 25, 45, 47, 56, 65, 71, 86, 99, 100]));
  end;
  fListaArquivo.Text := vListaNova.Text;
end;

function TAnexoIV.gerarA2: boolean;
var
  vListaFC, vListaFP: TStringList;
  vDataBase, vDataFim: TDate;
  I, K: Integer;
  vtemp: string;
begin
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and fc.nserieecf = ' + QuotedStr(fNumSerieMovimento);

  vListaFC := TStringList.Create;
  vListaFC.Clear;
  vListaFP := TStringList.Create;
  vListaFP.Clear;
  try
    QrAux.Close;
    QrAux.SQL.Text :=
      'select fc.finalizador codigo, fc.data, f.descricao, case when coalesce(fc.tipo_doc, '''') = ''CUP'' then ''1'' else ''2'' end tipo,' +
      ' sum(fc.valor) valor from fincupom fc' +
      ' inner join finalizadores f on f.cod_terminal = fc.cod_terminal and f.nserieecf = fc.nserieecf and f.cod_empresa = fc.cod_empresa and f.cod_finalizador = fc.finalizador' +
      ' where fc.data >= :dataIni and fc.data <= :dataFim' + vtemp +
      // comentei esta linha para subtrair o troco que fica com o valor negativo
      //' where coalesce(fc.valorsaque , 0 ) > 0 and fc.data >= :dataIni and fc.data <= :dataFim' +
			' and fc.cod_empresa = ' + vDadosIni.codEmpresa +
			' and coalesce(fc.status_fc, '''') <> ''CANCELADO''' +
      ' group by 1,2,3,4' +
      ' union' +
      ' select fp.cod_controle codigo, fp.data_mov data, c.nome_ctrl descricao, ''3'' tipo, sum(fp.valordoc) valor from formpagamento fp' +
      ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa' +
      ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim and coalesce(fp.num_nota,0) > 0 and rtrim(tpdocs) = ''NF''' +
      ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by 1,2,3,4' +
      ' order by 2';
    QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
    QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
    QrAux.Open;

    QrAux.FetchAll;

    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 0);
    setTextoLabel(labelRegistrosDetalhes, 'Montando registros A2');

    QrAux.First;
    while not QrAux.Eof do
    begin
      addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);
      fListaArquivo.Add( 'A2' + fDelimitador +
        formataData(QrAux.FieldByName('data').AsDateTime) + fDelimitador +
        formataString(
          vDadosIni.retornoPorCondicao(validaMD5_A2(DateToStr(QrAux.FieldByName('data').AsDateTime),
            QrAux.FieldByName('tipo').AsString, QrAux.FieldByName('codigo').AsInteger),
            QrAux.FieldByName('descricao').AsString, '?'), 25) + fDelimitador +
        formataString(QrAux.FieldByName('tipo').AsString, 1) + fDelimitador +
        formataNumero(QrAux.FieldByName('valor').AsFloat, 12) + fDelimitador
      );
      QrAux.Next;
    end;
    result := true;
    exit;

    setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações. Etapa 2 de 3');

    QrAux.Close;
    QrAux.SQL.Text :=
      'select fp.data_mov data, c.nome_ctrl descricao, ''3'' tipo, sum(fp.valordoc) valor from formpagamento fp' +
      ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa' +
      ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim and coalesce(fp.num_nota,0) > 0' +
      ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by 1,2,3' +
      ' order by 1';
    QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
    QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
    QrAux.Open;

    QrAux.FetchAll;

    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 0);
    setTextoLabel(labelRegistrosDetalhes, 'Montando registros A2. Etapa 2 de 3');

    QrAux.First;
    while not QrAux.Eof do
    begin
      addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

      vListaFC.Add( 'A2' + fDelimitador +
        formataData(QrAux.FieldByName('data').AsDateTime) + fDelimitador +
        formataString(
          vDadosIni.retornoPorCondicao(validaMD5_A2(DateToStr(QrAux.FieldByName('data').AsDateTime),
            QrAux.FieldByName('tipo').AsString, QrAux.FieldByName('codigo').AsInteger),
            QrAux.FieldByName('descricao').AsString, '?'), 25) + fDelimitador +
        formataString(QrAux.FieldByName('tipo').AsString, 1) + fDelimitador +
        formataNumero(QrAux.FieldByName('valor').AsFloat, 12) + fDelimitador
      );
      QrAux.Next;
    end;
  except
  end;

  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Montando registros A2. Etapa 3 de 3');

  vDataBase := StrToDate(fDataInicial);
  vDataFim := StrToDate(fDataFinal);
  K := Trunc(vDataFim - vDataBase);
  while vDataBase <= vDataFim do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, K, 1);
    for I := 0 to vListaFC.Count - 1 do
      if vDadosIni.getCampoPipe(vListaFC[I], 2, fDelimitador) = formataData(vDataBase) then
        fListaArquivo.Add(vListaFC[I]);
    for I := 0 to vListaFP.Count - 1 do
      if vDadosIni.getCampoPipe(vListaFP[I], 2, fDelimitador) = formataData(vDataBase) then
        fListaArquivo.Add(vListaFP[I]);
    vDataBase := vDataBase + 1;
  end;
end;

function TAnexoIV.gerarD2: boolean;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  QrAux.Close;
  QrAux.SQL.Text :=
    'select pa.coo_impressao, pa.nprevenda, pa.data_ped,' +
    ' case when pa.tipo = ''REQ'' then ''Pedido''' +
    ' when pa.tipo = ''ORC'' then ''Orcamento''' +
    ' else ''Ordem de Servico'' end titulo, pa.tipo, pa.valor_total, pa.ncupom, pa.operador,' +
    ' pa.nome_clientedav, pa.cpfcgc, pa.md5' +
    ' from pedvenda pa' +
    ' where coalesce(pa.nprevenda, 0) > 0 ' +
    ' and pa.ativo = 1 and pa.data_ped >= :dataIni and pa.data_ped <= :dataFim' +
    ' and pa.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by pa.data_fech, pa.nprevenda';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros D2');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('D2' + fDelimitador +
      fCNPJEmpPAF + fDelimitador +
			fCamposECF +
      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          fCNPJEmpPAF + '|' +
          QrAux.FieldByName('coo_impressao').AsString + '|' +
          QrAux.FieldByName('nprevenda').AsString + '|' +
          FormatDateTime('dd/mm/yyyy', QrAux.FieldByName('data_ped').AsDateTime) + '|' +
          QrAux.FieldByName('titulo').AsString + '|' +
          QrAux.FieldByName('valor_total').AsString + '|' +
          QrAux.FieldByName('ncupom').AsString + '|' +
          QrAux.FieldByName('operador').AsString + '|' +
          QrAux.FieldByName('nome_clientedav').AsString + '|' +
          QrAux.FieldByName('cpfcgc').AsString + '|',
          Trim(QrAux.FieldByName('MD5').AsString)),
        fModeloECF, '?'), 20) + fDelimitador +
			formataInteiro(QrAux.FieldByName('coo_impressao').AsInteger, 9) + fDelimitador +
			formataInteiro(QrAux.FieldByName('nprevenda').AsInteger, 13) + fDelimitador +
			formataData(QrAux.FieldByName('data_ped').AsDateTime) + fDelimitador +
			formataString(QrAux.FieldByName('titulo').AsString, 30) + fDelimitador +
			formataNumero(QrAux.FieldByName('valor_total').AsFloat, 8) + fDelimitador +
			formataInteiro(QrAux.FieldByName('ncupom').AsInteger, 9) + fDelimitador +
      formataInteiro(QrAux.FieldByName('operador').AsInteger, 3) + fDelimitador +
      formataString(QrAux.FieldByName('nome_clientedav').AsString, 40) + fDelimitador +
			formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('cpfcgc').AsString), 14) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarD3: boolean;
begin
	Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  QrAux.Close;
  QrAux.SQL.Text :=
    'select pv.data_ped, pp.nprevenda, pp.data_inclusao, pp.nitem, pp.grupo_prod||pp.cod_prod codigo, pp.num_fab_prod, pp.descr_prod_ped descricao,' +
    ' pp.quant_ped_item qtde, pp.unidade, pp.vlun_ped_item vl_unit, pp.rateio_desc, pp.rateio_acresc, pp.vltot_ped_item vl_tot,' +
    ' pp.sit_trib, pp.icm_prod aliquota, pp.status, pp.csdecqtde, pp.csdecvlunt, pp.md5' +
    ' from pedvenda pv' +
    ' inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empresa = pv.cod_empresa' +
		' where coalesce(pv.nprevenda, 0) > 0 ' +
		' and pv.ativo = 1 and pv.data_ped >= :dataIni and pv.data_ped <= :dataFim' +
		' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
		' union' +
		' select pv.data_ped, ps.nprevenda, ps.data_inclusao, ps.nitem, ps.cod_servico codigo, ps.cod_servico num_fab_prod, ps.desc_serv_ped descricao,' +
		' ps.quant_serv_ped qtde, '''' unidade, ps.valor_un_serv vl_unit, ps.rateio_desc, ps.rateio_acresc, ps.valor_tot_serv vl_tot,' +
		' ps.sit_trib, ps.aliq_iss aliquota, ps.status, 0 csdecqtde, ps.csdecvlunt, ps.md5' +
		' from pedvenda pv' +
		' inner join pedvenda_serv ps on ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa' +
    ' where coalesce(pv.nprevenda, 0) > 0 ' +
    ' and pv.ativo = 1 and pv.data_ped >= :dataIni and pv.data_ped <= :dataFim' +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by 1, 2';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros D3');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('D3' + fDelimitador +
      formataInteiro(QrAux.FieldByName('nprevenda').AsInteger, 6) + fDelimitador +
      formataData(QrAux.FieldByName('data_inclusao').AsDateTime) + fDelimitador +
      formataInteiro(QrAux.FieldByName('nitem').AsInteger, 6) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao(
       (vDadosIni.vImpressaoCodigoCupom = 'GC') and (vDadosIni.vUsaCodigoBarras <> 'S'),
       QrAux.FieldByName('codigo').AsString,
       QrAux.FieldByName('num_fab_prod').AsString), 14) + fDelimitador +

     formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('nprevenda').AsString) + '|' +
          Trim(QrAux.FieldByName('data_inclusao').AsString) + '|' +
          Trim(QrAux.FieldByName('nitem').AsString) + '|' +
          Trim(QrAux.FieldByName('codigo').AsString) + '|' +
          Trim(QrAux.FieldByName('num_fab_prod').AsString) + '|' +
          Trim(QrAux.FieldByName('descricao').AsString) + '|' +
          Trim(QrAux.FieldByName('qtde').AsString) + '|' +
          Trim(QrAux.FieldByName('unidade').AsString) + '|' +
          Trim(QrAux.FieldByName('vl_unit').AsString) + '|' +
          Trim(QrAux.FieldByName('rateio_desc').AsString) + '|' +
          Trim(QrAux.FieldByName('rateio_acresc').AsString) + '|' +
          Trim(QrAux.FieldByName('vl_tot').AsString) + '|' +
          Trim(QrAux.FieldByName('sit_trib').AsString) + '|' +
          Trim(QrAux.FieldByName('aliquota').AsString) + '|' +
					Trim(QrAux.FieldByName('status').AsString) + '|' +
          Trim(QrAux.FieldByName('csdecqtde').AsString) + '|' +
          Trim(QrAux.FieldByName('csdecvlunt').AsString) + '|',
          Trim(QrAux.FieldByName('MD5').AsString)),
        QrAux.FieldByName('descricao').AsString, '?'), 100) + fDelimitador +

			formataNumero(QrAux.FieldByName('qtde').AsFloat, 7, StrToIntDef( QrAux.FieldByName('csdecqtde').AsString, 3)) + fDelimitador +
			formataString(QrAux.FieldByName('unidade').AsString, 3) + fDelimitador +
			formataNumero(QrAux.FieldByName('vl_unit').AsFloat, 8, StrToIntDef( QrAux.FieldByName('csdecvlunt').AsString, 2)) + fDelimitador +
			formataNumero(QrAux.FieldByName('rateio_desc').AsFloat, 8) + fDelimitador +
      formataNumero(QrAux.FieldByName('rateio_acresc').AsFloat, 8) + fDelimitador +
      formataNumero(
        QrAux.FieldByName('vl_tot').AsFloat + QrAux.FieldByName('rateio_acresc').AsFloat - QrAux.FieldByName('rateio_desc').AsFloat, 14) + fDelimitador +
      formataString(QrAux.FieldByName('sit_trib').AsString, 1) + fDelimitador +
      formataNumero(
        vDadosIni.retornoPorCondicao(
          vDadosIni.strEstaContidoEm(QrAux.FieldByName('sit_trib').AsString, ['T', 'S']),
              QrAux.FieldByName('aliquota').AsFloat, 0), 4) + fDelimitador +
      formataString(
        vDadosIni.retornoPorCondicao(
					Trim(QrAux.FieldByName('status').AsString) = 'CANCELADO', 'S', 'N'), 1) + fDelimitador +
			formataInteiro(StrToIntDef(QrAux.FieldByName('csdecqtde').AsString, 3), 1) + fDelimitador +
			formataInteiro(StrToIntDef(QrAux.FieldByName('csdecvlunt').AsString, 2), 1) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarD4: boolean;
var
  vdados: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  QrAux.Close;
  QrAux.SQL.Text :=
    'select DATA_MOVIMENTO, DADOS_REG_PAF from EVIDENCIAS_PAF' +
    ' where DATA_MOVIMENTO >= :dataIni and DATA_MOVIMENTO <= :dataFim' +
    ' and REGISTRO = ''D4'' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by 1, 2';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros D4');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);
    vdados := QrAux.FieldByName('DADOS_REG_PAF').AsString;

    fListaArquivo.Add('D4' + fDelimitador +
      formataInteiro( StrToIntDef( vDadosIni.getCampoPipe(vdados, 1) , 0), 13 ) + fDelimitador +  //numero do dav
      formataData(QrAux.FieldByName('DATA_MOVIMENTO').AsDateTime) + fDelimitador + //data
      formataHora( vDadosIni.getCampoPipe(vdados, 3) ) + fDelimitador + // hora
      formataString( vDadosIni.retornoPorCondicao(
        (vDadosIni.vImpressaoCodigoCupom = 'GC') and (vDadosIni.vUsaCodigoBarras <> 'S'),
        vDadosIni.getCampoPipe(vdados, 4),
        vDadosIni.getCampoPipe(vdados, 5)), 14) + fDelimitador + //codigo
      formataString( vDadosIni.getCampoPipe(vdados, 6), 100 ) + fDelimitador + // descricao
      formataNumero( StrToFloatDef( vDadosIni.StringReplace2(vDadosIni.getCampoPipe(vdados, 7), '.', ',', True), 0), 7, StrToIntDef( vDadosIni.getCampoPipe(vdados, 16), 2) ) + fDelimitador + // quantidade
      formataString( vDadosIni.getCampoPipe(vdados, 8), 3 ) + fDelimitador + // unidade
      formataNumero( StrToFloatDef( vDadosIni.StringReplace2(vDadosIni.getCampoPipe(vdados, 9), '.', ',', True), 0), 8, StrToIntDef( vDadosIni.getCampoPipe(vdados, 17), 2) ) + fDelimitador + // valor unitario
      formataNumero( StrToFloatDef( vDadosIni.StringReplace2(vDadosIni.getCampoPipe(vdados, 10), '.', ',', True), 0), 8 ) + fDelimitador + // desconto no item
      formataNumero( StrToFloatDef( vDadosIni.StringReplace2(vDadosIni.getCampoPipe(vdados, 11), '.', ',', True), 0), 8 ) + fDelimitador + // acrescimo no item
      formataNumero( StrToFloatDef( vDadosIni.StringReplace2(vDadosIni.getCampoPipe(vdados, 12), '.', ',', True), 0), 14 ) + fDelimitador + // valor total liq
      formataString( vDadosIni.getCampoPipe(vdados, 13), 1 ) + fDelimitador + // sit trib
      formataNumero( StrToFloatDef( vDadosIni.StringReplace2(vDadosIni.getCampoPipe(vdados, 14), '.', ',', True), 0), 4 ) + fDelimitador + // aliquota
      formataString( vDadosIni.retornoPorCondicao( Trim(vDadosIni.getCampoPipe(vdados, 15)) = 'CANCELADO',
        'S', 'N'), 1) + fDelimitador + // ind cance
      formataInteiro( StrToIntDef(vDadosIni.getCampoPipe(vdados, 16), 3 ), 1) + fDelimitador + // casas desc qtde
      formataInteiro( StrToIntDef(vDadosIni.getCampoPipe(vdados, 17), 2 ), 1) + fDelimitador + // casas desc vlunit
      formataString( vDadosIni.getCampoPipe(vdados, 18), 1 ) + fDelimitador // tipo alteracao
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarE2: boolean;

  function getSqlEstoqueParcial: string;
  begin
    if (fTipoEstoque = eTotal) or (fdataSetEstoqueParcial.IsEmpty) then
    begin
      Result := '';
      Exit;
    end;

    Result := ' and grupo_prod||cod_prod in (';

    fdataSetEstoqueParcial.First;
    while not fdataSetEstoqueParcial.Eof do
    begin
      Result := Result +
        fdataSetEstoqueParcial.FieldByName('grupo_prod').AsString +
        fdataSetEstoqueParcial.FieldByName('cod_prod').AsString + ',';
      fdataSetEstoqueParcial.Next;
    end;

    Result := Copy(Result, 1, Length(Result) - 1) + ')';
  end;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  QrAux.Close;
  QrAux.SQL.Text :=
    'select grupo_prod||cod_prod codigo, num_fab_prod, descr_prod, unidade,' +
    ' case when coalesce(arredondar_truncar, ''T'') = ''T'' then ''T'' else ''A'' end iat,' +
    ' case when coalesce(tipo_fab, ''T'') = ''T'' then ''T'' else ''P'' end ippt,' +
		' sit_trib, icm_prod aliquota, prec_tab_prod valor_unitario, est_f, ''P'' prodserv, md5 from produtos' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + getSqlEstoqueParcial +
    ' and coalesce(consumo, ''N'') <> ''S'' and ativo = 1' +
    ' order by 3';
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros E2');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('E2' + fDelimitador +
      vDadosIni.apenasNumeros(fCNPJEmpPAF) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao(
       (vDadosIni.vImpressaoCodigoCupom = 'GC') and (vDadosIni.vUsaCodigoBarras <> 'S'),
       QrAux.FieldByName('codigo').AsString,
       QrAux.FieldByName('num_fab_prod').AsString), 14) + fDelimitador +
      formataString(QrAux.FieldByName('descr_prod').AsString, 50) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('prodserv').AsString) + '|' +
          Trim(QrAux.FieldByName('codigo').AsString) + '|' +
          Trim(QrAux.FieldByName('num_fab_prod').AsString) + '|' +
          Trim(QrAux.FieldByName('descr_prod').AsString) + '|' +
          Trim(QrAux.FieldByName('unidade').AsString) + '|' +
					Trim(QrAux.FieldByName('iat').AsString) + '|' +
					Trim(QrAux.FieldByName('ippt').AsString) + '|' +
					Trim(QrAux.FieldByName('sit_trib').AsString) + '|' +
          Trim(QrAux.FieldByName('aliquota').AsString) + '|' +
          FloatToStr(vDadosIni.StrToFloatFormat(QrAux.FieldByName('valor_unitario').AsFloat, 2)) + '|' +
          FloatToStr(vDadosIni.StrToFloatFormat(QrAux.FieldByName('est_f').AsFloat, 3)) + '|',
          Trim(QrAux.FieldByName('md5').AsString)),
        QrAux.FieldByName('unidade').AsString, '?'), 6) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        (vDadosIni.StrToFloatFormat(QrAux.FieldByName('est_f').AsFloat, 3) < 0), '-', '+'), 1) + fDelimitador +
      formataNumero(Abs(QrAux.FieldByName('est_f').AsFloat), 9, 3) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarE3: boolean;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  QrAux.Close;
  QrAux.SQL.Text :=
    'select NSERIEECF, MF_ADICIONAL, TIPO_ECF, MARCA_ECF, MODELO_ECF, DATA_AT, HORA_AT, MD5 from PAF_DOC_BASE_ATEST' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and DATA_AT >= :dataIni and DATA_AT <= :dataFim' +
    ' order by DATA_AT';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros E3');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('E3' + fDelimitador +
      formataString(QrAux.FieldByName('NSERIEECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +
      formataString(QrAux.FieldByName('TIPO_ECF').AsString, 7) + fDelimitador +
      formataString(QrAux.FieldByName('MARCA_ECF').AsString, 20) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          FormatDateTime('dd/mm/yyyy', QrAux.FieldByName('DATA_AT').AsDateTime) + '|' +
          Trim(QrAux.FieldByName('HORA_AT').AsString) + '|' +
          Trim(QrAux.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('TIPO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MARCA_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|',
          Trim(QrAux.FieldByName('MD5').AsString)),
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +

      formataData(QrAux.FieldByName('DATA_AT').AsDateTime) + fDelimitador +
      formataHora(QrAux.FieldByName('HORA_AT').AsString) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarH2: boolean;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  QrAux.Close;
  QrAux.SQL.Text :=
    'select * from FINCUPOM' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and DATA >= :dataIni and DATA <= :dataFim AND valor_troco > 0' +
    ' order by DATA, cupom';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros H2');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('H2' + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('CPFCGC_AMD_TROCO').AsString), 14) + fDelimitador +
      fCamposECF +
      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          QrAux.FieldByName('CPFCGC_AMD_TROCO').AsString + '|' +
          QrAux.FieldByName('CUPOM').AsString + '|' +
          QrAux.FieldByName('CCF_ECF').AsString + '|' +
          QrAux.FieldByName('VALOR_TROCO').AsString + '|' +
          FormatDateTime('dd/mm/yyyy', QrAux.FieldByName('DATA').AsDateTime) + '|' +
          QrAux.FieldByName('CPFCGC_CLI_TROCO').AsString + '|' +
          Trim(QrAux.FieldByName('N_AUT_CART').AsString) + '|',
          Trim(QrAux.FieldByName('MD5H2').AsString)),
        fModeloECF, '?'), 20) + fDelimitador +
      formataInteiro(QrAux.FieldByName('CUPOM').AsInteger, 6) + fDelimitador +
      formataInteiro(QrAux.FieldByName('CCF_ECF').AsInteger, 6) + fDelimitador +
      formataNumero(QrAux.FieldByName('VALOR_TROCO').AsFloat, 13) + fDelimitador +
      formataData(QrAux.FieldByName('DATA').AsDateTime) + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('CPFCGC_CLI_TROCO').AsString), 14) + fDelimitador +
      formataString(QrAux.FieldByName('N_AUT_CART').AsString, 7) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarP2(pTabelaPreco: string): boolean;
var
  vIAT: string;
  vTmpCampo: string;
begin
	Result := False;

  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  vIAT := Trim(vDadosIni.vIndicadorArredondamentoOuTruncamento);
  if vIAT <> 'A' then
    vIAT := 'T';

  if Pos('30', pTabelaPreco) > 0 then
    vTmpCampo := 'PREC_30_PROD'
  else if Pos('60', pTabelaPreco) > 0 then
    vTmpCampo := 'PREC_60_PROD'
  else if Pos('90', pTabelaPreco) > 0 then
    vTmpCampo := 'PREC_90_PROD'
  else
    vTmpCampo := 'prec_tab_prod';

  QrAux.Close;
  QrAux.SQL.Text :=
    'select grupo_prod||cod_prod codigo, num_fab_prod, descr_prod, unidade,' +
    ' case when coalesce(arredondar_truncar, ''T'') = ''T'' then ''T'' else ''A'' end iat,' +
		' case when coalesce(tipo_fab, ''T'') = ''T'' then ''T'' else ''P'' end ippt,' +
		' sit_trib, icm_prod aliquota, ' + vTmpCampo + ' valor_unitario, est_f, ''P'' prodserv, md5 from produtos' +
		' where cod_empresa = ' + vDadosIni.codEmpresa +
		' and coalesce(consumo, ''N'') <> ''S'' and ativo = 1' +
		' union' +
		' select cast(cod_servico as varchar(20)) codigo, cast(cod_servico as varchar(20)) num_fab_prod,' +
		' desc_servico descr_prod, ''UND'' unidade, ''T'' iat, ''P'' ippt, sit_trib, aliq_iss aliquota,' +
		' valor_servico valor_unitario, 0 est_f, ''S'' prodserv, md5 from tipo_servico' +
    ' where coalesce(cod_empresa, ' + vDadosIni.codEmpresa + ') = ' + vDadosIni.codEmpresa +
    ' and ativo = 1' +
    ' order by 3';
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros P2');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('P2' + fDelimitador +
      vDadosIni.apenasNumeros(fCNPJEmpPAF) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao(
       (vDadosIni.vImpressaoCodigoCupom = 'GC') and (vDadosIni.vUsaCodigoBarras <> 'S'),
       QrAux.FieldByName('codigo').AsString,
       QrAux.FieldByName('num_fab_prod').AsString), 14) + fDelimitador +
      formataString(QrAux.FieldByName('descr_prod').AsString, 50) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('prodserv').AsString) + '|' +
          Trim(QrAux.FieldByName('codigo').AsString) + '|' +
          Trim(QrAux.FieldByName('num_fab_prod').AsString) + '|' +
          Trim(QrAux.FieldByName('descr_prod').AsString) + '|' +
          Trim(QrAux.FieldByName('unidade').AsString) + '|' +
					Trim(QrAux.FieldByName('iat').AsString) + '|' +
					Trim(QrAux.FieldByName('ippt').AsString) + '|' +
					Trim(QrAux.FieldByName('sit_trib').AsString) + '|' +
					Trim(QrAux.FieldByName('aliquota').AsString) + '|' +
          FloatToStr(vDadosIni.StrToFloatFormat(QrAux.FieldByName('valor_unitario').AsFloat, 2)) + '|' +
          FloatToStr(vDadosIni.StrToFloatFormat(QrAux.FieldByName('est_f').AsFloat, 3)) + '|',
          Trim(QrAux.FieldByName('md5').AsString)),
        QrAux.FieldByName('unidade').AsString, '?'), 6) + fDelimitador +

      formataString(QrAux.FieldByName('iat').AsString, 1) + fDelimitador +
      formataString(QrAux.FieldByName('ippt').AsString, 1) + fDelimitador +
      formataString(QrAux.FieldByName('sit_trib').AsString, 1) + fDelimitador +
      formataNumero(QrAux.FieldByName('aliquota').AsFloat, 4) + fDelimitador +
      formataNumero(QrAux.FieldByName('valor_unitario').AsFloat, 12) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarR01: boolean;
var
  vtemp: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and imp.num_serie_ecf = ' + QuotedStr(fNumSerieMovimento);

  QrAux.Close;
  QrAux.SQL.Text :=
    'SELECT IMP.NUM_SERIE_ECF, IMP.MF_ADICIONAL, CNIEE.TIPO_ECF,' +
    'CNIEE.MARCA_ECF, CNIEE.MODELO_ECF, CNIEE.VERSAOSB, IMP.DATA_SB, IMP.HORA_SB,' +
    'IMP.COD_TERMINAL, DES.CNPJ_EMPDES, DES.IE_EMPDES, DES.IM_EMPDES, DES.NOME_EMPDES,' +
    'FSC.NOME_PAF, FSC.VERSAO_PAF, FSC.MD5_PAF, FSC.ER_PAF_ECF, IMP.IDENT_CNIEE, IMP.MD5 FROM ' +
    'TERMINAL_IMPRESSORAS IMP, IMPRESSORAS_CNIEE CNIEE, TERMINALF TERM,' +
    'FISCAL_VERSOES FSC,EMPDESVOLV DES' +
    ' WHERE ' + //IMP.COD_TERMINAL = ' + inttostr(VDA.vcod_terminal) +
//    ' AND' +
    ' IMP.COD_EMPRESA = ' + vDadosIni.codEmpresa + vtemp +
    ' AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO AND IMP.COD_TERMINAL = ' +
    ' TERM.COD_TERMINAL AND IMP.COD_EMPRESA = ' +
    ' TERM.COD_EMPRESA AND TERM.COD_FISCAL = FSC.COD_FISCAL AND FSC.COD_EMPDES = DES.COD_EMPDES' +
    ' ORDER BY IMP.COD_TERMINAL';
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros R01');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('R01' + fDelimitador +
      formataString(QrAux.FieldByName('NUM_SERIE_ECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +
      formataString(QrAux.FieldByName('TIPO_ECF').AsString, 7) + fDelimitador +
      formataString(QrAux.FieldByName('MARCA_ECF').AsString, 20) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        (fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('NUM_SERIE_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('TIPO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MARCA_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('VERSAOSB').AsString) + '|' +
          Trim(QrAux.FieldByName('DATA_SB').AsString) + '|' +
          Trim(QrAux.FieldByName('HORA_SB').AsString) + '|' +
          Trim(QrAux.FieldByName('COD_TERMINAL').AsString) + '|' +
          Trim(fCNPJEmpPAF) + '|' +
          Trim(vDadosIni.vEmp.vIE) + '|' +
          Trim(QrAux.FieldByName('ER_PAF_ECF').AsString) + '|',
          Trim(QrAux.FieldByName('MD5').AsString)))
//          and
//        (fMD5._validaMD5_registrosPAF(
//          Trim(fEmpDesenvol.cCNPJ) + '|' +
//          Trim(fEmpDesenvol.cIE) + '|' +
//          Trim(fEmpDesenvol.cIM) + '|' +
//          Trim(fEmpDesenvol.cNOMEEMPRESA) + '|' +
//          Trim(fEmpDesenvol.cNOMEPAF) + '|' +
//          Trim(fEmpDesenvol.cVERSAO) + '|' +
//          Trim(fEmpDesenvol.cMD5LISTA) + '|',
//          Trim(fEmpDesenvol.cMD5Dados)))
          ,
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +

      formataString(QrAux.FieldByName('VERSAOSB').AsString, 10) + fDelimitador +
      formataData(QrAux.FieldByName('DATA_SB').AsDateTime) + fDelimitador +
      formataHora(QrAux.FieldByName('HORA_SB').AsString) + fDelimitador +
      formataInteiro(QrAux.FieldByName('COD_TERMINAL').AsInteger, 3) + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(fCNPJEmpPAF), 14) + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(vDadosIni.vEmp.vIE), 14) + fDelimitador +

      formataInteiro(vDadosIni.apenasNumeros(fEmpDesenvol.cCNPJ), 14) + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(fEmpDesenvol.cIE), 14) + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(fEmpDesenvol.cIM), 14) + fDelimitador +
      formataString(fEmpDesenvol.cNOMEEMPRESA, 40) + fDelimitador +
      formataString(fEmpDesenvol.cNOMEPAF, 40) + fDelimitador +
      formataString(fEmpDesenvol.cVERSAO, 10) + fDelimitador +
      formataString(fEmpDesenvol.cMD5LISTA, 32) + fDelimitador +

//      formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('CNPJ_EMPDES').AsString), 14) + fDelimitador +
//      formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('IE_EMPDES').AsString), 14) + fDelimitador +
//      formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('IM_EMPDES').AsString), 14) + fDelimitador +
//      formataString(QrAux.FieldByName('NOME_EMPDES').AsString, 40) + fDelimitador +
//      formataString(QrAux.FieldByName('NOME_PAF').AsString, 40) + fDelimitador +
//      formataString(QrAux.FieldByName('VERSAO_PAF').AsString, 10) + fDelimitador +
//      formataString(QrAux.FieldByName('MD5_PAF').AsString, 32) + fDelimitador +

      formataData(StrToDate(fDataInicial)) + fDelimitador +
      formataData(StrToDate(fDataFinal)) + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('ER_PAF_ECF').AsString), 4) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarR02: boolean;
var
  vtemp: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and res.nserieecf = ' + QuotedStr(fNumSerieMovimento);

  QrAux.Close;
  QrAux.SQL.Text :=
    'SELECT RES.NSERIEECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,IMP.COD_PROPRIETARIO,RES.NREDUCOES,RES.COORED,' +
    'RES.CRO_MOV,RES.DATA_MOV,RES.DATA_EMISSAO_Z,RES.HORA_EMISSAO_Z,RES.VLVENDAB,' +
    'IMP.ISSQNDESC, RES.MD5 FROM ' +
    'RESUMOD RES, TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE WHERE RES.DATA_MOV >= :dataIni' +
    ' AND RES.DATA_MOV <= :dataFim' + vtemp +
    ' AND RES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND RES.COD_TERMINAL = IMP.COD_TERMINAL AND RES.COD_EMPRESA = ' +
    'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO' +
    ' ORDER BY RES.NSERIEECF, RES.NREDUCOES';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros R02');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('R02' + fDelimitador +
      formataString(QrAux.FieldByName('NSERIEECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(QrAux.FieldByName('NREDUCOES').AsString) + '|' +
          Trim(QrAux.FieldByName('COORED').AsString) + '|' +
          Trim(QrAux.FieldByName('CRO_MOV').AsString) + '|' +
          Trim(QrAux.FieldByName('DATA_MOV').AsString) + '|' +
          Trim(QrAux.FieldByName('DATA_EMISSAO_Z').AsString) + '|' +
          Trim(QrAux.FieldByName('HORA_EMISSAO_Z').AsString) + '|' +
          Trim(QrAux.FieldByName('VLVENDAB').AsString) + '|' +
          Trim(QrAux.FieldByName('ISSQNDESC').AsString) + '|',
          Trim(QrAux.FieldByName('MD5').AsString)),
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +

      formataInteiro(QrAux.FieldByName('COD_PROPRIETARIO').AsInteger, 2) + fDelimitador +
      formataInteiro(QrAux.FieldByName('NREDUCOES').AsInteger, 6) + fDelimitador +
      formataInteiro(QrAux.FieldByName('COORED').AsInteger, 9) + fDelimitador +
      formataInteiro(QrAux.FieldByName('CRO_MOV').AsInteger, 6) + fDelimitador +
      formataData(QrAux.FieldByName('DATA_MOV').AsDateTime) + fDelimitador +
      formataData(QrAux.FieldByName('DATA_EMISSAO_Z').AsDateTime) + fDelimitador +
      formataHora(QrAux.FieldByName('HORA_EMISSAO_Z').AsString) + fDelimitador +
      formataNumero(QrAux.FieldByName('VLVENDAB').AsFloat, 14) + fDelimitador +    
      formataString(QrAux.FieldByName('ISSQNDESC').AsString, 1) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarR03: boolean;
var
  vtemp: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and mp.nserieecf = ' + QuotedStr(fNumSerieMovimento);

  QrAux.Close;
  QrAux.SQL.Text :=
    'select mp.nserieecf,imp.mf_adicional,cniee.modelo_ecf, imp.cod_proprietario,res.nreducoes,' +
    ' case when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-T'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-T'')) then ''Can-T''' +
    ' when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-S'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-S'')) then ''Can-S''' +
    ' else mp.descaliq' +
    ' end descaliq, mp.valoraliq, mp.md5' +
    ' from resumod res' +
    ' inner join terminal_impressoras imp on imp.cod_terminal = res.cod_terminal and imp.num_serie_ecf = res.nserieecf and imp.cod_empresa = res.cod_empresa and imp.atual = ''S''' +
    ' inner join mapa_resumo_aliq mp on mp.cod_terminal = res.cod_terminal and mp.nserieecf = res.nserieecf and mp.cod_empresa = res.cod_empresa and mp.coored = res.coored' +
    ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
    ' where res.data_mov >= :dataini and res.data_mov <= :datafim' +
    ' and res.cod_empresa = ' + vDadosIni.codEmpresa + vtemp +
    ' order by mp.nserieecf, mp.coored';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros R03');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('R03' + fDelimitador +
      formataString(QrAux.FieldByName('NSERIEECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(QrAux.FieldByName('NREDUCOES').AsString) + '|' +
          Trim(QrAux.FieldByName('DESCALIQ').AsString) + '|' +
          Trim(QrAux.FieldByName('VALORALIQ').AsString) + '|' ,
          Trim(QrAux.FieldByName('MD5').AsString)),
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +

      formataInteiro(QrAux.FieldByName('COD_PROPRIETARIO').AsInteger, 2) + fDelimitador +
      formataInteiro(QrAux.FieldByName('NREDUCOES').AsInteger, 6) + fDelimitador +
      formataString(QrAux.FieldByName('DESCALIQ').AsString, 7) + fDelimitador +
      formataNumero(QrAux.FieldByName('VALORALIQ').AsFloat, 13) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarR04: boolean;
var
  vtemp: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and cp.nserieecf = ' + QuotedStr(fNumSerieMovimento);

  QrAux.Close;
  QrAux.SQL.Text :=
    'select cp.nserieecf, imp.mf_adicional, cniee.modelo_ecf, imp.cod_proprietario,' +
    ' cp.ccf, cp.cupom, cp.data, cp.total subtotal, cp.valor_desc, ''V'' ind_tp_desc,' +
    ' cp.valor_acres, ''V'' ind_tp_acresc, cp.valorcupom, cp.status_cp, 0 cance_acres_subt,' +
    ' cp.acres_desc, cp.nome_cliente, cp.cpfcgc, cp.md5' +
    ' from cupom cp' +
    ' left join terminal_impressoras imp on imp.cod_terminal = cp.cod_terminal and imp.num_serie_ecf = cp.nserieecf and imp.cod_empresa = cp.cod_empresa and imp.atual = ''S''' +
    ' left join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
    ' where cp.data >= :dataIni and cp.data <= :dataFim' +
    ' and cp.cod_empresa = ' + vDadosIni.codEmpresa + vtemp +
    ' order by cp.data, cp.cupom';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros R04');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('R04' + fDelimitador +
      formataString(QrAux.FieldByName('NSERIEECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('ccf').AsString) + '|' +
          Trim(QrAux.FieldByName('cupom').AsString) + '|' +
          Trim(QrAux.FieldByName('data').AsString) + '|' +
          Trim(QrAux.FieldByName('subtotal').AsString) + '|' +
          Trim(QrAux.FieldByName('valor_desc').AsString) + '|' +
          Trim(QrAux.FieldByName('ind_tp_desc').AsString) + '|' +
          Trim(QrAux.FieldByName('valor_acres').AsString) + '|' +
          Trim(QrAux.FieldByName('ind_tp_acresc').AsString) + '|' +
          Trim(QrAux.FieldByName('valorcupom').AsString) + '|' +
          Trim(QrAux.FieldByName('status_cp').AsString) + '|' +
          Trim(QrAux.FieldByName('cance_acres_subt').AsString) + '|' +
          Trim(QrAux.FieldByName('acres_desc').AsString) + '|' +
          Trim(QrAux.FieldByName('nome_cliente').AsString) + '|' +
          Trim(QrAux.FieldByName('cpfcgc').AsString) + '|',
          Trim(QrAux.FieldByName('MD5').AsString)),
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +

      formataInteiro(QrAux.FieldByName('COD_PROPRIETARIO').AsInteger, 2) + fDelimitador +
			formataInteiro(QrAux.FieldByName('ccf').AsInteger, 9) + fDelimitador +
			formataInteiro(QrAux.FieldByName('cupom').AsInteger, 9) + fDelimitador +
      formataData(QrAux.FieldByName('data').AsDateTime) + fDelimitador +
      formataNumero(QrAux.FieldByName('subtotal').AsFloat, 14) + fDelimitador +
      formataNumero(QrAux.FieldByName('valor_desc').AsFloat, 13) + fDelimitador +
      formataString(QrAux.FieldByName('ind_tp_desc').AsString, 1) + fDelimitador +
      formataNumero(QrAux.FieldByName('valor_acres').AsFloat, 13) + fDelimitador +
      formataString(QrAux.FieldByName('ind_tp_acresc').AsString, 1) + fDelimitador +
      formataNumero(QrAux.FieldByName('valorcupom').AsFloat, 14) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao(
        Trim(QrAux.FieldByName('status_cp').AsString) = 'CANCELADO', 'S', 'N'), 1) + fDelimitador +
      formataNumero(QrAux.FieldByName('cance_acres_subt').AsFloat, 13) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao(
        (QrAux.FieldByName('valor_desc').AsFloat > 0) or (QrAux.FieldByName('valor_acres').AsFloat > 0),
        QrAux.FieldByName('acres_desc').AsString,
        QrAux.FieldByName('acres_desc').AsString), 1) + fDelimitador +
      formataString(QrAux.FieldByName('nome_cliente').AsString, 40) + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(Trim(QrAux.FieldByName('cpfcgc').AsString)), 14) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarR05: boolean;
var
  vtemp: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and cp.nserieecf = ' + QuotedStr(fNumSerieMovimento);

  QrAux.Close;
  QrAux.SQL.Text :=
    'select cp.nserieecf, imp.mf_adicional, cniee.modelo_ecf, imp.cod_proprietario,' +
    ' cp.ccf, cp.cupom, cp.nitem, cp.grupo_prod||cp.cod_prod codigo, cp.codbarra, cp.prod_serv, cp.descr_it,' +
    ' cp.quantidade, cp.unidade, cp.preco, cp.perc_desc, cp.perc_acresc, cp.total,' +
    ' cp.descaliq, cp.status_it, cp.iat, cp.ippt, cp.csdecqtde, cp.csdecvlunt, cp.md5' +
    ' from cupom2 cp' +
		' left join terminal_impressoras imp on imp.cod_terminal = cp.cod_terminal and imp.num_serie_ecf = cp.nserieecf and imp.cod_empresa = cp.cod_empresa and imp.atual = ''S''' +
    ' left join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
    ' where cp.data >= :dataIni and cp.data <= :dataFim' +
    ' and cp.cod_empresa = ' + vDadosIni.codEmpresa + vtemp +
    ' order by cp.data, cp.cupom, cp.nitem';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros R05');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('R05' + fDelimitador +
      formataString(QrAux.FieldByName('NSERIEECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('cupom').AsString) + '|' +
          Trim(QrAux.FieldByName('ccf').AsString) + '|' +
          Trim(QrAux.FieldByName('nitem').AsString) + '|' +
          Trim(QrAux.FieldByName('codigo').AsString) + '|' +
          Trim(QrAux.FieldByName('codbarra').AsString) + '|' +
          Trim(QrAux.FieldByName('prod_serv').AsString) + '|' +
          Trim(QrAux.FieldByName('descr_it').AsString) + '|' +
          Trim(QrAux.FieldByName('quantidade').AsString) + '|' +
          Trim(QrAux.FieldByName('unidade').AsString) + '|' +
          Trim(QrAux.FieldByName('preco').AsString) + '|' +
          Trim(QrAux.FieldByName('perc_desc').AsString) + '|' +
          Trim(QrAux.FieldByName('perc_acresc').AsString) + '|' +
          Trim(QrAux.FieldByName('total').AsString) + '|' +
          Trim(QrAux.FieldByName('descaliq').AsString) + '|' +
          Trim(QrAux.FieldByName('status_it').AsString) + '|' +
          Trim(QrAux.FieldByName('iat').AsString) + '|' +
          Trim(QrAux.FieldByName('ippt').AsString) + '|' +
          Trim(QrAux.FieldByName('csdecqtde').AsString) + '|' +
          Trim(QrAux.FieldByName('csdecvlunt').AsString) + '|',
          Trim(QrAux.FieldByName('MD5').AsString)),
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +

      formataInteiro(QrAux.FieldByName('COD_PROPRIETARIO').AsInteger, 2) + fDelimitador +
			formataInteiro(QrAux.FieldByName('cupom').AsInteger, 9) + fDelimitador +
			formataInteiro(QrAux.FieldByName('ccf').AsInteger, 9) + fDelimitador +
      formataInteiro(QrAux.FieldByName('nitem').AsInteger, 3) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao(
        (vDadosIni.vImpressaoCodigoCupom = 'GC') and (vDadosIni.vUsaCodigoBarras <> 'S'),
        QrAux.FieldByName('codigo').AsString,
        QrAux.FieldByName('codbarra').AsString), 14) + fDelimitador +
      formataString(QrAux.FieldByName('descr_it').AsString, 100) + fDelimitador +
      formataNumero(QrAux.FieldByName('quantidade').AsFloat, 7, StrToIntDef( QrAux.FieldByName('csdecqtde').AsString, 3)) + fDelimitador +
      formataString(QrAux.FieldByName('unidade').AsString, 3) + fDelimitador +
      formataNumero(QrAux.FieldByName('preco').AsFloat, 8, StrToIntDef( QrAux.FieldByName('csdecvlunt').AsString, 2)) + fDelimitador +
      formataNumero(QrAux.FieldByName('perc_desc').AsFloat, 8) + fDelimitador +
      formataNumero(QrAux.FieldByName('perc_acresc').AsFloat, 8) + fDelimitador +
      formataNumero( QrAux.FieldByName('total').AsFloat + QrAux.FieldByName('perc_acresc').AsFloat -
				QrAux.FieldByName('perc_desc').AsFloat, 14) + fDelimitador +
      formataString(QrAux.FieldByName('descaliq').AsString + '1', 7) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao(
          Trim(QrAux.FieldByName('status_it').AsString) = 'CANCELADO', 'S', 'N'), 1) + fDelimitador +
      formataNumero( vDadosIni.retornoPorCondicao(
				Trim(QrAux.FieldByName('status_it').AsString) = 'CANCELADO',
        QrAux.FieldByName('quantidade').AsFloat, 0), 7, StrToIntDef(QrAux.FieldByName('csdecqtde').AsString, 3)) + fDelimitador +
      formataNumero( vDadosIni.retornoPorCondicao( Trim(QrAux.FieldByName('status_it').AsString) = 'CANCELADO',
        QrAux.FieldByName('total').AsFloat, 0), 13) + fDelimitador +
      formataNumero( vDadosIni.retornoPorCondicao( Trim(QrAux.FieldByName('status_it').AsString) = 'CANCELADO',
        QrAux.FieldByName('perc_acresc').AsFloat, 0), 13) + fDelimitador +
      formataString(QrAux.FieldByName('iat').AsString, 1) + fDelimitador +
      formataString(QrAux.FieldByName('ippt').AsString, 1) + fDelimitador +
      formataInteiro(StrToIntDef(QrAux.FieldByName('csdecqtde').AsString, 3), 1) + fDelimitador +
      formataInteiro(StrToIntDef(QrAux.FieldByName('csdecvlunt').AsString, 2), 1) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarR06: boolean;
var
  vtemp: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and doc.nserieecf = ' + QuotedStr(fNumSerieMovimento);

  QrAux.Close;
  QrAux.SQL.Text :=
    'select doc.nserieecf, imp.mf_adicional, cniee.modelo_ecf,' +
    ' imp.cod_proprietario, doc.coo_ecf, doc.gnf_ecf, doc.grg_ecf, doc.cdc_ecf,' +
    ' doc.tipo_doc_ecf, doc.data_f_emissao, doc.hora_f_emissao, doc.md5' +
    ' from doc_naofiscal_terminal doc' +
		' left join terminal_impressoras imp on imp.cod_terminal = doc.cod_terminal and imp.num_serie_ecf = doc.nserieecf and imp.cod_empresa = doc.cod_empresa and imp.atual = ''S''' +
    ' left join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
    ' where doc.data_f_emissao >= :dataini and doc.data_f_emissao <= :datafim' +
    ' and doc.cod_empresa = ' + vDadosIni.codEmpresa + vtemp +
    ' order by doc.nserieecf, doc.data_f_emissao, doc.hora_f_emissao';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros R06');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('R06' + fDelimitador +
      formataString(QrAux.FieldByName('NSERIEECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(QrAux.FieldByName('COO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('GNF_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('GRG_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('CDC_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('TIPO_DOC_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('DATA_F_EMISSAO').AsString) + '|' +
          Trim(QrAux.FieldByName('HORA_F_EMISSAO').AsString) + '|' ,
          Trim(QrAux.FieldByName('MD5').AsString)),
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +

      formataInteiro(QrAux.FieldByName('COD_PROPRIETARIO').AsInteger, 2) + fDelimitador +
			formataInteiro(QrAux.FieldByName('COO_ECF').AsInteger, 9) + fDelimitador +
      formataInteiro(QrAux.FieldByName('GNF_ECF').AsInteger, 6) + fDelimitador +
      formataInteiro(QrAux.FieldByName('GRG_ECF').AsInteger, 6) + fDelimitador +
      formataInteiro(QrAux.FieldByName('CDC_ECF').AsInteger, 4) + fDelimitador +
      formataString(QrAux.FieldByName('TIPO_DOC_ECF').AsString, 2) + fDelimitador +
      formataData(QrAux.FieldByName('DATA_F_EMISSAO').AsDateTime) + fDelimitador +
      formataHora(QrAux.FieldByName('HORA_F_EMISSAO').AsString) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarR07: boolean;
var
  vtemp: string;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  if Trim(fNumSerieMovimento) <> '' then
    vtemp := ' and fin.nserieecf = ' + QuotedStr(fNumSerieMovimento);

  QrAux.Close;
  QrAux.SQL.Text :=
    'select fin.nserieecf, imp.mf_adicional, cniee.modelo_ecf,' +
    ' imp.cod_proprietario, fin.cupom, fin.ccf_ecf, fin.gnf_ecf,' +
    ' fnz.descricao, fin.valor, fin.status_fc, fin.md5r07' +
    ' from fincupom fin' +
		' left join terminal_impressoras imp on imp.cod_terminal = fin.cod_terminal and imp.num_serie_ecf = fin.nserieecf and imp.cod_empresa = fin.cod_empresa and imp.atual = ''S''' +
		' left join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
    ' left join finalizadores fnz on fnz.cod_terminal = fin.cod_terminal and fnz.nserieecf = fin.nserieecf and fnz.cod_empresa = fin.cod_empresa and fnz.cod_finalizador = fin.finalizador' +
    ' where fin.data >= :dataini and fin.data <= :datafim' +
    ' and fin.cod_empresa = ' + vDadosIni.codEmpresa + vtemp +
    ' and coalesce(fin.valor, 0) > 0' +
    ' order by fin.nserieecf, fin.cupom';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros R07');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('R07' + fDelimitador +
      formataString(QrAux.FieldByName('NSERIEECF').AsString, 20) + fDelimitador +
      formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +

      formataString( vDadosIni.retornoPorCondicao(
        fMD5._validaMD5_registrosPAF(
          Trim(QrAux.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(QrAux.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(QrAux.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(QrAux.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(QrAux.FieldByName('cupom').AsString) + '|' +
          Trim(QrAux.FieldByName('ccf_ecf').AsString) + '|' +
          Trim(QrAux.FieldByName('gnf_ecf').AsString) + '|' +
          Trim(QrAux.FieldByName('descricao').AsString) + '|' +
          Trim(QrAux.FieldByName('valor').AsString) + '|' +
          Trim(QrAux.FieldByName('status_fc').AsString) + '|' ,
          Trim(QrAux.FieldByName('md5r07').AsString)),
        QrAux.FieldByName('MODELO_ECF').AsString, '?'), 20) + fDelimitador +
      formataInteiro(QrAux.FieldByName('COD_PROPRIETARIO').AsInteger, 2) + fDelimitador +
			formataInteiro(QrAux.FieldByName('cupom').AsInteger, 9) + fDelimitador +
			formataInteiro(QrAux.FieldByName('ccf_ecf').AsInteger, 9) + fDelimitador +
			formataInteiro(QrAux.FieldByName('gnf_ecf').AsInteger, 6) + fDelimitador +
      formataString(QrAux.FieldByName('descricao').AsString, 15) + fDelimitador +
      formataNumero(QrAux.FieldByName('valor').AsFloat, 13) + fDelimitador +
			formataString( vDadosIni.retornoPorCondicao(
        Trim(QrAux.FieldByName('status_fc').AsString) = 'CANCELADO', 'S', 'N'), 1) + fDelimitador +
      formataNumero( vDadosIni.retornoPorCondicao(
        Trim(QrAux.FieldByName('status_fc').AsString) = 'CANCELADO',
        QrAux.FieldByName('valor').AsFloat, 0), 13) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarS2: boolean;
begin
	Result := False;
	addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
	setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

	QrAux.Close;
	QrAux.SQL.Text :=
		'select ps.DATA_PED, ps.HORAABERTURA, ps.MINABERTURA, ps.VALOR_TOTAL, ps.COO_CONTA_CLIENTE,' +
		' ps.NSERIEECF_CONTA_CLIENTE, ps.NPREVENDA from pedvenda ps' +
		' where ps.tipo = ''OS'' and ps.cod_empresa = ' + vDadosIni.codEmpresa + ' and coalesce(ps.nprevenda, 0) > 0 and' +
		' coalesce(ps.status_ped, '''') <> ''CANCELADO'' and coalesce(ps.paf_status_prevenda, '''') <> ''CANCELADA'' and' +
		' ((coalesce(ps.ncupom, 0) = 0) and (coalesce(ps.num_nf, 0) = 0) and (coalesce(ps.num_nfeext, 0) = 0))'+
		' and ps.valor_total > 0' +
		' order by ps.data_ped, ps.nprevenda';
	QrAux.Open;

	QrAux.FetchAll;

	setTextoLabel(labelRegistrosDetalhes, 'Montando registros S2');
	QrAux.First;
	while not QrAux.Eof do
	begin
		addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

		fListaArquivo.Add('S2' + fDelimitador +
			fCNPJEmpPAF + fDelimitador +
			formataData(QrAux.FieldByName('DATA_PED').AsDateTime) + fDelimitador +
			formataHora(
				vDadosIni.StrZero(QrAux.FieldByName('HORAABERTURA').AsInteger, 2) + ':' +
				vDadosIni.StrZero(QrAux.FieldByName('MINABERTURA').AsInteger, 2) + ':00') + fDelimitador +
			vDadosIni.retornoPorCondicao( True,
//				fMD5._validaMD5_registrosPAF(
//				  fCNPJEmpPAF + '|' +
//					QrAux.FieldByName('DATA_PED').AsString + '|' +
//					QrAux.FieldByName('HORAABERTURA').AsString + '|' +
//					QrAux.FieldByName('MINABERTURA').AsString + '|' +
//					QrAux.FieldByName('NPREVENDA').AsString + '|' +
//					QrAux.FieldByName('VALOR_TOTAL').AsString + '|' +
//					QrAux.FieldByName('COO_CONTA_CLIENTE').AsString + '|' +
//					QrAux.FieldByName('NSERIEECF_CONTA_CLIENTE').AsString + '|'),
				formataInteiro(QrAux.FieldByName('NPREVENDA').AsInteger, 13),
				formataString('?', 13)) + fDelimitador +
			formataNumero(QrAux.FieldByName('VALOR_TOTAL').AsFloat, 13) + fDelimitador +
			formataInteiro(QrAux.FieldByName('COO_CONTA_CLIENTE').AsInteger, 9) + fDelimitador +
			formataString(QrAux.FieldByName('NSERIEECF_CONTA_CLIENTE').AsString, 20) + fDelimitador
		);
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarS3: boolean;
begin
  Result := False;
  addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
  setTextoLabel(labelRegistrosDetalhes, 'Aguarde... buscando informações');

  QrAux.Close;
  QrAux.SQL.Text :=
    'select pv.data_ped, pv.horaabertura, pv.minabertura, pp.nprevenda, pp.grupo_prod||pp.cod_prod codigo, pp.num_fab_prod, pp.descr_prod_ped descricao,' +
    ' pp.quant_ped_item qtde, pp.unidade, pp.vlun_ped_item vl_unit, pp.csdecqtde, pp.csdecvlunt, pp.md5' +
    ' from pedvenda pv' +
		' inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empresa = pv.cod_empresa' +
		' where pv.tipo = ''OS'' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and coalesce(pv.nprevenda, 0) > 0 and' +
		' coalesce(pv.status_ped, '''') <> ''CANCELADO'' and coalesce(pv.paf_status_prevenda, '''') <> ''CANCELADA'' and' +
		' ((coalesce(pv.ncupom, 0) = 0) and (coalesce(pv.num_nf, 0) = 0) and (coalesce(pv.num_nfeext, 0) = 0))'+
		' and pv.valor_total > 0' +
		' and coalesce(pp.status,'''') <> ''CANCELADO'' ' +
		' union' +
		' select pv.data_ped, pv.horaabertura, pv.minabertura, ps.nprevenda, ps.cod_servico codigo, ps.cod_servico num_fab_prod, ps.desc_serv_ped descricao,' +
		' ps.quant_serv_ped qtde, '''' unidade, ps.valor_un_serv vl_unit, 0 csdecqtde, ps.csdecvlunt, ps.md5' +
		' from pedvenda pv' +
		' inner join pedvenda_serv ps on ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa' +
		' where pv.tipo = ''OS'' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and coalesce(pv.nprevenda, 0) > 0 and' +
		' coalesce(pv.status_ped, '''') <> ''CANCELADO'' and coalesce(pv.paf_status_prevenda, '''') <> ''CANCELADA'' and' +
		' ((coalesce(pv.ncupom, 0) = 0) and (coalesce(pv.num_nf, 0) = 0) and (coalesce(pv.num_nfeext, 0) = 0))'+
		' and pv.valor_total > 0' +
		' and coalesce(ps.status,'''') <> ''CANCELADO'' ' +
		' order by 1, 4';
  QrAux.Open;

  QrAux.FetchAll;

  setTextoLabel(labelRegistrosDetalhes, 'Montando registros S3');
  QrAux.First;
  while not QrAux.Eof do
  begin
    addProgress(fProgressRegistrosDetalhes, 0, QrAux.RecordCount, 1);

    fListaArquivo.Add('S3' + fDelimitador +
      fCNPJEmpPAF + fDelimitador +
      formataData(QrAux.FieldByName('DATA_PED').AsDateTime) + fDelimitador +
      formataHora(
        vDadosIni.StrZero(QrAux.FieldByName('HORAABERTURA').AsInteger, 2) + ':' +
				vDadosIni.StrZero(QrAux.FieldByName('MINABERTURA').AsInteger, 2) + ':00') + fDelimitador +
				formataInteiro(QrAux.FieldByName('NPREVENDA').AsInteger, 13) + fDelimitador +
			formataString( vDadosIni.retornoPorCondicao(
				(vDadosIni.vImpressaoCodigoCupom = 'GC') and (vDadosIni.vUsaCodigoBarras <> 'S'),
				QrAux.FieldByName('codigo').AsString,
				QrAux.FieldByName('num_fab_prod').AsString), 14) + fDelimitador +
			formataString(QrAux.FieldByName('descricao').AsString, 100) + fDelimitador +
			formataNumero(QrAux.FieldByName('qtde').AsFloat, 7, StrToIntDef( QrAux.FieldByName('csdecqtde').AsString, 3)) + fDelimitador +
			formataString(QrAux.FieldByName('unidade').AsString, 3) + fDelimitador +
      formataNumero(QrAux.FieldByName('vl_unit').AsFloat, 8, StrToIntDef( QrAux.FieldByName('csdecvlunt').AsString, 2)) + fDelimitador +
			formataInteiro(StrToIntDef(QrAux.FieldByName('csdecqtde').AsString, 3), 1) + fDelimitador +
			formataInteiro(StrToIntDef(QrAux.FieldByName('csdecvlunt').AsString, 2), 1) + fDelimitador
    );
    QrAux.Next;
  end;
  Result := True;
end;

function TAnexoIV.gerarU1: boolean;
var
  vInconsistencias: Boolean;
begin
  Result := False;

  QrAux.Close;
  QrAux.SQL.Text := 'select count(ep.registro) contador from evidencias_paf ep' +
    ' where ep.data_movimento >= :dataIni and ep.data_movimento <= :dataFim' +
    ' and ep.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ep.registro in (''CP'', ''C2'', ''AE'', ''DN'', ''FC'', ''FP'', ''MR'', ''PV'', ''PR'', ''PP'', ''PS'', ''RZ'', ''TI'', ''TS'')';
  QrAux.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  QrAux.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  QrAux.Open;

  vInconsistencias := QrAux.FieldByName('contador').AsInteger > 0;

  QrAux.Close;
  QrAux.SQL.Text := 'select cgc_emp, ie_emp, im_emp, nome_emp from empresa' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa;
  QrAux.Open;

  if not QrAux.IsEmpty then
  begin
    fCNPJEmpPAF := QrAux.FieldByName('cgc_emp').AsString;
    fListaArquivo.Add('U1' + fDelimitador +
      formataInteiro(vDadosIni.apenasNumeros(QrAux.FieldByName('cgc_emp').AsString), 14) + fDelimitador +
      formataString(vDadosIni.apenasNumeros(QrAux.FieldByName('ie_emp').AsString), 14) + fDelimitador +
      formataString(vDadosIni.apenasNumeros(QrAux.FieldByName('im_emp').AsString), 14) + fDelimitador +
      formataString( vDadosIni.retornoPorCondicao( not vInconsistencias,
        QrAux.FieldByName('nome_emp').AsString, '?'), 50) + fDelimitador
    );
    Result := True;
  end;

end;

procedure TAnexoIV.setCamposECF;
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  QrAux.Close;
  QrAux.SQL.Text := 'select cgc_emp, ie_emp, im_emp, nome_emp from empresa' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa;
  QrAux.Open;

  if not QrAux.IsEmpty then
    fCNPJEmpPAF := QrAux.FieldByName('cgc_emp').AsString;

  QrAux.Close;
  QrAux.SQL.Text := 'select t.MF_ADICIONAL, i.TIPO_ECF, i.MARCA_ECF, i.MODELO_ECF from TERMINAL_IMPRESSORAS t' +
    ' left join IMPRESSORAS_CNIEE i on i.IDENTIFICACAO = t.IDENT_CNIEE' +
    ' where t.COD_TERMINAL = ' + vDadosIni.vCodTerminal +
    ' and t.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' and t.NUM_SERIE_ECF = ' + QuotedStr(vDadosIni.vNumSerieEcf);
  QrAux.Open;

  fCamposECF := formataString(vDadosIni.vNumSerieEcf, 20) + fDelimitador +
    formataString(QrAux.FieldByName('MF_ADICIONAL').AsString, 1) + fDelimitador +
    formataString(QrAux.FieldByName('TIPO_ECF').AsString, 7) + fDelimitador +
    formataString(QrAux.FieldByName('MARCA_ECF').AsString, 20) + fDelimitador;
  fModeloECF := formataString(QrAux.FieldByName('MODELO_ECF').AsString, 20);

  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    fEmpDesenvol.cCNPJ := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'CNPJ', ''));
    fEmpDesenvol.cIE := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'IE', ''));
    fEmpDesenvol.cIM := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'IM', ''));
    fEmpDesenvol.cNOMEEMPRESA := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'NOMEEMPRESA', ''));
    fEmpDesenvol.cNOMEPAF := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'NOMEPAF', ''));
    fEmpDesenvol.cVERSAO := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'VERSAO', ''));
    fEmpDesenvol.cMD5LISTA := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'MD5LISTA', ''));
    fEmpDesenvol.cMD5Dados := vDadosIni.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'MD5DADOS', ''));
  finally
    arquivo.free;
  end;

end;

function TAnexoIV.montarArquivo: Boolean;
var
  vCountRegistros: Integer;
  vListaTabPrecoAD: TStringList;
  I: Integer;
begin
  try
    fListaArquivo.Clear;
    vCountRegistros := 18;

    try                   

      addProgress(fProgressRegistros, 0, vCountRegistros, 0);

      if not conectar(False) then
        raise exception.Create('Erro ao conectar com o banco de dados');

      fNumSerieMovimento := '';
      setCamposECF;

      gerarU1;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarA2;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarP2('');
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      if Trim(vDadosIni.vStringTabelaPrecoADPAF) <> '' then
      begin
        vListaTabPrecoAD := TStringList.Create;
        vListaTabPrecoAD.Text := vDadosIni.vStringTabelaPrecoADPAF;
        for I := 0 to vListaTabPrecoAD.Count - 1 do
          if Trim(vListaTabPrecoAD[I]) <> '' then
          begin
            gerarP2(Trim(vListaTabPrecoAD[I]));
            addProgress(fProgressRegistros, 0, vCountRegistros, 1);
          end;
      end;

      gerarE2;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarE3;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarD2;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarD3;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarD4;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarH2;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarS2;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarS3;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarR01;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarR02;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarR03;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarR04;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarR05;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarR06;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      gerarR07;
      addProgress(fProgressRegistros, 0, vCountRegistros, 1);

      formatarArquivo;

      fEnderecoArquivo :=
        vDadosIni.vPathArquivosDigitais +
        '\registros_pafecf_' +
        vDadosIni.StringReplace2(FormatDateTime('yyyy/mm/dd_hh:mm:ss', now), '/:', '  ', True) + '.txt';

      fListaArquivo.SaveToFile(fEnderecoArquivo);

      Result := gerarMD5;

    finally
      desconectar;
      addProgress(fProgressRegistros, 0, 0, 0);
      addProgress(fProgressRegistrosDetalhes, 0, 0, 0);
      setTextoLabel(fLabelRegistros, '.');
      setTextoLabel(fLabelRegistrosDetalhes, '.');
      vDadosIni.fechaStatusProcessamento;
    end;
    if Result then
    begin
      Application.MessageBox(PChar('Arquivo gerado com sucesso' + #13 + fEnderecoArquivo), 'Atenção', 0 + 64);
      setTextoLabel(fLabelRegistros, 'Arquivo gerado com sucesso');
      setTextoLabel(fLabelRegistrosDetalhes, fEnderecoArquivo);
    end;

  except
    on E: Exception do
    begin
      Result := False;
      registraErro('function TAnexoIV.montarArquivo. Erro: ' + e.Message);
      Application.MessageBox(PChar('Erro ao gerar arquivo. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

function TAnexoIV.montarArquivoMovimentoECF: Boolean;
var
  vCountRegistros: Integer;
begin
  try
    fListaArquivo.Clear;
    vCountRegistros := 18;

    try

      addProgress(nil, 0, 0, 0);
      setTextoLabel(nil, 'Iniciando montagem do arquivo', 'Arquivo Anexo IV');

      if not conectar(False) then
        raise exception.Create('Erro ao conectar com o banco de dados');

      fNumSerieMovimento := vDadosIni.vNumSerieEcf;
      setCamposECF;

      {setTextoLabel(nil, '', 'Registro U1');
      gerarU1;
      setTextoLabel(nil, '', 'Registro A2');
      gerarA2;
      setTextoLabel(nil, '', 'Registro P2');
      gerarP2;
      setTextoLabel(nil, '', 'Registro E2');
      gerarE2;
      setTextoLabel(nil, '', 'Registro E3');
      gerarE3;
      setTextoLabel(nil, '', 'Registro D2');
      gerarD2;
      setTextoLabel(nil, '', 'Registro D3');
      gerarD3;
      setTextoLabel(nil, '', 'Registro D4');
      gerarD4;
      setTextoLabel(nil, '', 'Registro H2');
			gerarH2; }
			setTextoLabel(nil, '', 'Registro S2');
			gerarS2;
			setTextoLabel(nil, '', 'Registro S3'); 
      gerarS3;
      setTextoLabel(nil, '', 'Registro R01');
      gerarR01;
      setTextoLabel(nil, '', 'Registro R02');
      gerarR02;
      setTextoLabel(nil, '', 'Registro R03');
      gerarR03;
      setTextoLabel(nil, '', 'Registro R04');
      gerarR04;
      setTextoLabel(nil, '', 'Registro R05');
      gerarR05;
      setTextoLabel(nil, '', 'Registro R06');
      gerarR06;
      setTextoLabel(nil, '', 'Registro R07');
      gerarR07;

      addProgress(nil, 0, 0, 0);
      setTextoLabel(nil, 'Finalizando arquivo', 'Arquivo Anexo IV');

      formatarArquivo;

      QrAux.close;
      QrAux.SQL.TEXT :=
        'SELECT CNIEE.IDENTIFICACAO FROM TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE' +
        ' WHERE IMP.COD_TERMINAL = ' + vDadosIni.vCodTerminal +
        ' AND IMP.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and IMP.NUM_SERIE_ECF = ' + QuotedStr(fNumSerieMovimento) +
        ' AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO ';
      QrAux.Open;
      fEnderecoArquivo := Trim(QrAux.FieldByName('IDENTIFICACAO').AsString) +
        vDadosIni.Right(fNumSerieMovimento, 14) +
        StringReplace(FormatDateTime('DD/MM/YYYY', StrToDate(fDataInicial)), '/', '', [rfReplaceAll]) + '.txt';

      fEnderecoArquivo :=
        vDadosIni.vPathArquivosDigitais + '\' + fEnderecoArquivo;;

      fListaArquivo.SaveToFile(fEnderecoArquivo);

      setTextoLabel(nil, 'Gerando EAD');

      Result := gerarMD5;

    finally
      desconectar;
    end;
    if Result then
    begin
      setTextoLabel(nil, 'Arquivo salvo no diretorio: ' + fEnderecoArquivo);
      Application.MessageBox(PChar('Arquivo gerado com sucesso' + #13 + fEnderecoArquivo), 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
    end;

  except
    on E: Exception do
    begin
      Result := False;
      registraErro('function TAnexoIV.montarArquivo. Erro: ' + e.Message);
      Application.MessageBox(PChar('Erro ao gerar arquivo. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TAnexoIV.posicionarTexto(pTexto: string; pMax: Integer;
  const pArgs: array of Integer): string;
var
  I, vCount: Integer;
  vTemp: string;
begin
  vTemp := vDadosIni.Space(pMax);
  for I := 0 to Length(pArgs) - 1 do
  begin
    vCount := I + 1;
    Insert(vDadosIni.getCampoPipe(pTexto, vCount), vTemp, pArgs[I]);
    end;
  vTemp := Copy(vTemp + vDadosIni.Space(pMax), 1, pMax);
  Result := vTemp;
end;

procedure TAnexoIV.setTextoLabel(pLabel: TLabel; pTexto: string; pTitulo: string);
begin
  if pLabel <> nil then
  begin
    pLabel.Caption := pTexto;
    Application.ProcessMessages;
  end
  else
    vDadosIni.abreStatusProcessamento(pTitulo, pTexto);
end;

function TAnexoIV.validaMD5_A2(pData, pTipo: string; pCodigo: Integer): boolean;
var
  vTmp: string;
begin
  Result := True;
  if pTipo  = '3' then
  begin
    fBuscas.Close;
    fBuscas.SQL.Text :=
      'select fp.data_mov, fp.cod_controle, fp.valordoc, fp.md5 from formpagamento fp' +
      ' where fp.data_mov = :dataBase and coalesce(fp.num_nota,0) > 0' +
      ' and fp.cod_controle =  ' + IntToStr(pCodigo) +
      ' and fp.cod_empresa = ' + vDadosIni.codEmpresa;
    fBuscas.ParamByName('dataBase').AsDate := StrToDate(pData);
    fBuscas.Open;

    fBuscas.First;
    while not fBuscas.Eof do
    begin
      if not fMD5._validaMD5_registrosPAF(
        Trim(fBuscas.FieldByName('data_mov').AsString) + '|' +
        Trim(fBuscas.FieldByName('cod_controle').AsString) + '|' +
        fBuscas.FieldByName('valordoc').AsString + '|',
        fBuscas.FieldByName('md5').AsString) then
      begin
        Result := False;
        Exit;
      end;
      fBuscas.Next;
    end;

  end
  else
  begin
    if pTipo = '1' then
      vTmp := ' and fc.tipo_doc = ''CUP'''
    else
      vTmp := ' and fc.tipo_doc <> ''CUP''';

    fBuscas.Close;
    fBuscas.SQL.Text :=
      'select fc.data, f.descricao, fc.tipo_doc, fc.valor, fc.md5 from fincupom fc' +
      ' inner join finalizadores f on f.cod_terminal = fc.cod_terminal and f.nserieecf = fc.nserieecf and f.cod_empresa = fc.cod_empresa and f.cod_finalizador = fc.finalizador' +
      ' where fc.data = :dataBase' +
      ' and fc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and fc.finalizador = ' + IntToStr(pCodigo) + vTmp;
    fBuscas.ParamByName('dataBase').AsDate := StrToDate(pData);
    fBuscas.Open;

    fBuscas.First;
    while not fBuscas.Eof do
    begin
      if not fMD5._validaMD5_registrosPAF(
        Trim(fBuscas.FieldByName('data').AsString) + '|' +
        Trim(fBuscas.FieldByName('descricao').AsString) + '|' +
        Trim(fBuscas.FieldByName('tipo_doc').AsString) + '|' +
        fBuscas.FieldByName('valor').AsString + '|',
        fBuscas.FieldByName('md5').AsString) then
      begin
        Result := False;
        Exit;
      end;
      fBuscas.Next;
    end;
  end;
end;

{ TArquivoDigital }

function TArquivoDigital.formataHora(pTime: TDateTime): string;
begin
  Result := vDadosIni.StringReplace2(FormatDateTime('hh:mm:ss', pTime),':',' ', True);
end;

function TArquivoDigital.formataHora(pTime: TTime): string;
begin
  Result := vDadosIni.StringReplace2(FormatDateTime('hh:mm:ss', pTime),':',' ', True);
end;

function TArquivoDigital.formataData(pData: TDateTime): string;
begin
  Result := vDadosIni.StringReplace2(FormatDateTime('yyyy/mm/dd', pData),'/',' ', True);
end;

function TArquivoDigital.formataHora(pTime: string): string;
begin
  Result := vDadosIni.StringReplace2(FormatDateTime('hh:mm:ss', StrToTimeDef(pTime, Now)),':',' ', True);
end;

function TArquivoDigital.formataInteiro(pInteiro: string; pTamanho: Integer): string;
begin
  Result := vDadosIni.StrZero(pInteiro, pTamanho);
end;

function TArquivoDigital.formataInteiro(pInteiro, pTamanho: Integer): string;
begin
  Result := vDadosIni.StrZero(pInteiro, pTamanho);
end;

function TArquivoDigital.formataNumero(pNumero: Extended; pTamanho: Integer;
  pCasasDecimais: Integer): string;
var
  vTmp: string;
begin
  if pTamanho <= 0  then
    Result := ''
  else
  begin
    Result := Format('%0.' + IntToStr(pCasasDecimais) + 'f', [pNumero]);
    Result := Trim(vDadosIni.StringReplace2( Result, '.,', '  ', True));
    Result := vDadosIni.StrZero(Result, pTamanho);
    Result := Copy(Result, 1, pTamanho);
  end;
end;

function TArquivoDigital.formataString(pString: string;
  pTamanho: Integer): string;
begin
  Result := Copy(pString, 1, pTamanho);
end;

function TArquivoDigital.gerarMD5: Boolean;
var
  Buffer: AnsiString;
  Arq: TextFile;
begin
  try
    Result := True;
    AssignFile(Arq, fEnderecoArquivo);
      Append(arq);
//      WriteLn(arq, '');
      CloseFile(Arq);
    Buffer := vDadosIni.Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), fEnderecoArquivo);
    begin
      AssignFile(Arq, fEnderecoArquivo);
      Append(arq);
      WriteLn(arq, 'EAD' + buffer);
      CloseFile(Arq);
    end;
  except
    Result := False;
    Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR + MB_OK);
  end;
end;

end.

