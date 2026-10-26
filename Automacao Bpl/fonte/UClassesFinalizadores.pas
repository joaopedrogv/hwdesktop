unit UClassesFinalizadores;

interface
uses uDataSet_OOP, ComCtrls, StdCtrls, IBDatabase, DBClient, DBGrids, IBQuery,
  RDprint, xhHierCube;

type
  TResumoD = class;

  TSoftFiscal = class;

  TDocNaoFiscal = class;

  TImpresssorasTerm = class;

  TImpresssoras_CNIEE = class;

  TMapaResumoDetal = class;

  TTerminaisF = class(TDataSet_OOP)
  private
    cdsDestino: Tclientdataset;
    ibapag: Tibquery;
    linha, vpag: integer;
    dataInicial, dataFinal: string;
    vterm: array[1..99] of integer;
    rdVS: TRdPrint;
    vtermsql: string;
    procedure novaPaginarelatorioDeVendasPorSecao(Sender: TObject; Pagina: Integer);
    function CopyFileWithProgressBar(pSource, pDestination: string; pProgressBar: TProgressBar): Boolean;
  public
    vSincMercadorias: Smallint; //0: Todas; 1: Alteradas; 2: Apenas com preços alterados
    vSincClientes: Smallint; //0: Todas; 1: Alterados
    vSincDemais: Smallint; //0: Todas; 1: Alterados
    vSincDataBase: TDateTime;
    constructor create;
    destructor destroy; override;
    function abreTerminais: boolean;
    function post: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function DadosECFAtual: boolean;
    function sincterminal(vtipo: integer; vprogrbar: TprogressBar; vlabel: Tlabel;
      vtabelas: string {Formato: TODOS ou CUPOM|CUPOM2|ALIQ|ETC...}): boolean;
    function MontarArquivoHwF(vprogrbar: TprogressBar; vlabel: Tlabel; VenderecoOr: string; gridenv:
      Tdbgrid): boolean;
    function copiaTabela(tabela: string; progrbar: TProgressBar): integer; //nao usado
    function copiaTabela2(tabela: string; progrbar: TProgressBar): integer; // nao usado
    function copiaTabela3(tabela: string; progrbar: TProgressBar): integer;
    function parar_servico: boolean;
    function cpdadostab: boolean;
    function nregistro(vprogrbar: TprogressBar): boolean;
    function limpatabela(vtabela: string): boolean;
    function enderecohwfdb: string;
    procedure sincronizacaoParaSintegra;
    function getDadosImpressora: boolean;
    function vendasPorPeriodo(drig: TDbgrid; dataInicial, dataFinal: string): boolean;
    function detalhesFormaPagamentoVendas(cod_terminal: integer; dataInicial, dataFinal: string;
      offline: boolean): boolean;
    function relatorioDeVendasPorSecao(dtInicial, dtFinal: string; progress: TProgressBar; grid:
      TDBGrid): boolean;
    function gerarProdutividadeVendasOperadorOLAP(dataInicial, dataFinal: string; cube: THierCube):
      boolean;
    function performance(vdtini: string; vdtfinal: string): real;
    function verificarTerm(grid: TdbGrid): boolean;
    procedure abreConfigF;
    procedure _salvarLog(txtLog: string);
    function ValidarArquivoHwF(pVenderecoOr: string): boolean;
    procedure setDataBaseAlteracaoArquivoHwF(pVenderecoOr: string);
    procedure cadTerminalF(pForm: Integer);
  var
    vtipdoc: string;
    vsrec, vlVnd, vlrec: Currency;
    qtdvnd: Integer;
    SoftFiscal: TSoftFiscal;
    CadResumoD: TResumoD;
    CadDocNaofiscal: TDocNaoFiscal;
    CadImpressoraTerm: TImpresssorasTerm;
    Transsinc: TIBTransaction;
    cniee: string;
    num_serie: string;
    mf_adicional: string;
    data_cad_term: string;
    data_mod_term: string;
    data_sb: string;
    hora_sb: string;
    issqn: string;
    dll: string;
    cod_empresa: string;
    fPathLog: string;
    vdtini, vdtfim: TDateTime;
    vparar: integer;

    //    vHistRec: THistRec;
  end;

  TEmpDesenvolv = class(TDataSet_OOP)
  private
    //    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    //    function recebendo: boolean;
    //    function post: boolean; override;
    //    function marcaRec(vtp: integer): boolean;
    //    function confirmarecebimento(ValorRecebido: currency): boolean;
    //    function open: Boolean; override;
    function abreEmpDes: boolean;
    //    function post: boolean; override;
    //    function PegaInfRec: boolean;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}

  var
    //    vtipdoc: string;
    //    vsrec, vlVnd, vlrec: Currency;
    //    qtdvnd: Integer;

    //    vHistRec: THistRec;
  end;

  TArquivosFiscal = class(TDataSet_OOP)
  private
    //    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function delete: boolean; override;
    function AbreArqFiscal: boolean;
    function AbreArqGeral: boolean;
  var
    vcodfiscal: integer;
  end;

  TSoftFiscal = class(TDataSet_OOP)
  private
    //    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    //    function recebendo: boolean;
    //    function post: boolean; override;
    //    function marcaRec(vtp: integer): boolean;
    //    function confirmarecebimento(ValorRecebido: currency): boolean;
    //    function open: Boolean; override;
    function post: boolean; override;
    function delete: boolean; override;
    function abreSofFiscal: boolean;
    //    function post: boolean; override;
    //    function PegaInfRec: boolean;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}

  var
    CadEmpDes: TEmpDesenvolv;
    cadArquivosFiscal: TArquivosFiscal;
    //    vtipdoc: string;
    //    vsrec, vlVnd, vlrec: Currency;
    //    qtdvnd: Integer;

    //    vHistRec: THistRec;
  end;

  TDocNaoFiscal = class(TDataSet_OOP)
  private
    //    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    //    function recebendo: boolean;
    //    function post: boolean; override;
    //    function marcaRec(vtp: integer): boolean;
    //    function confirmarecebimento(ValorRecebido: currency): boolean;
    //    function open: Boolean; override;
    function post: boolean; override;
    function delete: boolean; override;
    function abreDocNaoFiscal: boolean;
    //    function post: boolean; override;
    //    function PegaInfRec: boolean;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}

    //    vtipdoc: string;
    //    vsrec, vlVnd, vlrec: Currency;
    //    qtdvnd: Integer;

    //    vHistRec: THistRec;
  end;

  TResumoD = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    //    function recebendo: boolean;
    //    function post: boolean; override;
    //    function marcaRec(vtp: integer): boolean;
    //    function confirmarecebimento(ValorRecebido: currency): boolean;
    //    function open: Boolean; override;
    function abreResumoD: boolean;
    function post: boolean; override;
    function delete: boolean; override;
    function Insert: Boolean; override;
    function DetalheResumoD: boolean;
  var
    vnserieecf: string;
    cadMapaResumoDetal: TMapaResumoDetal;
    //    function PegaInfRec: boolean;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}
    //    vHistRec: THistRec;
  end;

  TMapaResumoDetal = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    //    function recebendo: boolean;
    //    function post: boolean; override;
    //    function marcaRec(vtp: integer): boolean;
    //    function confirmarecebimento(ValorRecebido: currency): boolean;
    //    function open: Boolean; override;
    function abreDetalhes: boolean;
    {    function post: boolean; override;
        function delete: boolean; override;
        function Insert: Boolean; override;
        function DetalheResumoD: boolean;}
  var
    vcodterminal, coored: integer;
    //    function PegaInfRec: boolean;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}
    //    vHistRec: THistRec;
  end;

  TImpresssorasTerm = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    //    function recebendo: boolean;
    //    function post: boolean; override;
    //    function marcaRec(vtp: integer): boolean;
    //    function confirmarecebimento(ValorRecebido: currency): boolean;
    //    function open: Boolean; override;
    function abreImpressorasTerm: boolean;
    function post: boolean; override;
    function delete: boolean; override;
    function Insert: Boolean; override;
    function definiratual: boolean;
  var
    vnserieecf: string;
    cadIMPCNIEE: TImpresssoras_CNIEE;
    //    function PegaInfRec: boolean;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}
    //    vHistRec: THistRec;
  end;

  TImpresssoras_CNIEE = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    //    function recebendo: boolean;
    //    function post: boolean; override;
    //    function marcaRec(vtp: integer): boolean;
    //    function confirmarecebimento(ValorRecebido: currency): boolean;
    //    function open: Boolean; override;
    function abreImpressorasCNIEE: boolean;
    //    function PegaInfRec: boolean;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}
    //    vHistRec: THistRec;
  end;

var
  cadTerminais: TTerminaisF;

implementation

uses UdtmTerminalF, uDtmAtivo, SysUtils, DB,
  Dialogs, Forms, Windows, uDadosIni, uSelTerminal, xhConsts, uConfiguracoes, 
  UTerminalF, USincTerminais;

{ TTerminaisF }

procedure TTerminaisF.abreConfigF;
var
  tempNSerieEcf: string;
  tempvCodTerminal: string;
begin
  inherited;
  if not vDadosIni.PesqPros('TERM007', 'CONFIGURAR', '', 'TERMINALF',
    dataSet.FieldByName('COD_TERMINAL').AsString + '-' +
    dataSet.FieldByName('NOME_TERMINAL').AsString, buscas, true) then
    exit;

  if vDadosIni.conectaBanco(dtmAtivo.bancoFiscal, dataSet.FieldByName('END_TERMINAL').AsString, true)
    then
  begin
    if frmConfiguracoes = nil then
      frmConfiguracoes := TfrmConfiguracoes.Create(frmConfiguracoes);
    tempNSerieEcf := vDadosIni.vNumSerieEcf;
    tempvCodTerminal := vDadosIni.vCodTerminal;
    try
      vDadosIni.vNumSerieEcf := dataSet.FieldByName('END_TERMINAL').AsString;
      vDadosIni.vCodTerminal := dataSet.FieldByName('cod_terminal').AsString;
      frmConfiguracoes.Showmodal;
    finally
      vDadosIni.vNumSerieEcf := tempNSerieEcf;
      vDadosIni.vCodTerminal := tempvCodTerminal;
    end;
  end;
end;

function TTerminaisF.abreTerminais: boolean;
begin
  montaSelect('SELECT * FROM TERMINALF WHERE COD_EMPRESA = ' + vdadosini.codEmpresa);
end;

procedure TTerminaisF.cadTerminalF(pForm: Integer);
begin
	try
  	if dtmTerminaisF = nil then
      dtmTerminaisF := TdtmTerminaisF.Create(dtmTerminaisF);
    if pForm = 0 then
    begin
    	vDadosIni.abreStatusProcessamento('', 'Abrindo Operações Frente Loja');

      if FrmTerminalF = nil then
        Application.CreateForm(TFrmTerminalF, FrmTerminalF);
      FrmTerminalF.Show;
    end
    else
    begin
    	vDadosIni.abreStatusProcessamento('', 'Abrindo Sincronizar Dados PAF-ECF');
    
      if FrmSincTerminais = nil then
        Application.CreateForm(TFrmSincTerminais,FrmSincTerminais);
  //     FrmSincTerminais.vterminais:=TTerminaisF(cadTerminais);
  //     FrmSincTerminais.vgrid:=TDBGrid(DBGrid1);
      FrmSincTerminais.tag := 1;
      FrmSincTerminais.ShowModal;
      FrmSincTerminais.Free;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TTerminaisF.copiaTabela(tabela: string; progrbar: TProgressBar): integer;
var
  vprogrbar: TProgressBar;
  Itx, erros: Integer;
  hP: Pointer;
begin
  erros := 0;
  vprogrbar := TProgressBar(progrbar);
  buscas.Close;
  buscas.SQL.Text := 'select * from ' + tabela;
  buscas.Open;
  cdsDestino.close;
  cdsDestino.CommandText := 'select * from ' + tabela + ' where 1=0';
  cdsDestino.open;
  nregistro(vprogrbar);
  while not buscas.Eof do
  begin
    Application.ProcessMessages;
    cdsDestino.Append;
    for Itx := 0 to buscas.FieldCount - 1 do
    begin
      try
        if buscas.Fields[Itx].FieldName = 'NATURALID' then
          cdsDestino.FieldByName(buscas.Fields[Itx].FieldName).asstring :=
            buscas.FieldByName(buscas.Fields[Itx].FieldName).AsString
        else
          cdsDestino.FieldByName(buscas.Fields[Itx].FieldName).Value :=
            buscas.FieldByName(buscas.Fields[Itx].FieldName).Value;
      except

      end;
    end;
    try
      cdsDestino.Post;
    except
      begin
        cdsDestino.Cancel;
        Inc(erros);
      end;
    end;
    buscas.next;
    vprogrbar.Position := vprogrbar.Position + 1;
    if (vprogrbar.Position mod 100 = 0) and (vprogrbar.Position > 1) and (cdsDestino.ChangeCount > 0)
      then
    begin
      hP := cdsDestino.GetBookmark;
      try
        cdsDestino.ApplyUpdates(-1);
      except
        begin
          cdsDestino.Cancel;
          Inc(erros);
        end;
      end;
      cdsDestino.GotoBookmark(hP);
    end;
  end;
  if (cdsDestino.ChangeCount > 0) then
  try
    cdsDestino.ApplyUpdates(-1);
  except
    begin
      cdsDestino.Cancel;
      Inc(erros);
    end;
  end;
end;

function TTerminaisF.copiaTabela2(tabela: string;
  progrbar: TProgressBar): integer;
var
  vTabHwFdb: TIBQuery;
  vSqlSemParametros: WideString;
  vSqlComParametros: WideString;
  I: Integer;
  vprogrbar: TProgressBar;
  vBookMark: Pointer;
begin
  try
    Application.ProcessMessages;
    vTabHwFdb := TIBQuery(dtmTerminaisF.IbapagarHwfdb);
    vprogrbar := TProgressBar(progrbar);
    vTabHwFdb.Close;

    vTabHwFdb.SQL.Text := 'delete from ' + tabela;
    try
      vTabHwFdb.ExecSQL;
    except
    end;
    vTabHwFdb.Close;
    vTabHwFdb.SQL.Text := 'select first 1 * from ' + tabela;
    vTabHwFdb.Open;

    vSqlSemParametros := 'insert into ' + tabela + ' (';
    vSqlComParametros := 'values (';
    for I := 0 to vTabHwFdb.FieldCount - 1 do
    begin
      if i = 0 then
      begin
        vSqlSemParametros := vSqlSemParametros + vTabHwFdb.Fields[i].FieldName;
        vSqlComParametros := vSqlComParametros + ':' + vTabHwFdb.Fields[i].FieldName;
      end
      else
      begin
        vSqlSemParametros := vSqlSemParametros + ', ' + vTabHwFdb.Fields[i].FieldName;
        vSqlComParametros := vSqlComParametros + ', :' + vTabHwFdb.Fields[i].FieldName;
      end;
    end;
    vSqlSemParametros := vSqlSemParametros + ')';
    vSqlComParametros := vSqlComParametros + ')';

    vTabHwFdb.Close;
    vTabHwFdb.SQL.Text := vSqlSemParametros + ' ' + vSqlComParametros;

    vprogrbar.Position := 0;
    vprogrbar.Min := 0;
    buscas.Close;
    buscas.SQL.Text := 'select count(*) as contador from ' + tabela;
    buscas.Open;
    vprogrbar.Max := buscas.FieldByName('contador').AsInteger;

    buscas.Close;
    buscas.SQL.Text := 'select * from ' + tabela;
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      vTabHwFdb.Close;
      for I := 0 to vTabHwFdb.ParamCount - 1 do
      try
        vTabHwFdb.ParamByName(vTabHwFdb.Params[i].Name).Value :=
          buscas.FieldByName(vTabHwFdb.Params[i].Name).Value;
      except
      end;
      try
        vTabHwFdb.ExecSQL;
      except
        //Inc(erros);
      end;
      buscas.Next;
      vprogrbar.Position := vprogrbar.Position + 1;
      if (vprogrbar.Position mod 100 = 0) and (vprogrbar.Position > 1) then
      begin
        Application.ProcessMessages;
        if vTabHwFdb.Transaction.InTransaction then
          vTabHwFdb.Transaction.Commit;
      end;

      if (vprogrbar.Position mod 1000 = 0) then
      begin
        vBookMark := buscas.GetBookmark;
        buscas.Close;

        buscas.Open;
        buscas.GotoBookmark(vBookMark);
      end;

    end;
    Application.ProcessMessages;
    if vTabHwFdb.Transaction.InTransaction then
      vTabHwFdb.Transaction.Commit;
  except
    on e: exception do begin
      application.messagebox(pchar(e.Message), 'Informação', MB_ICONINFORMATION + MB_OK);
      exit;
    end;
  end;
end;

function TTerminaisF.copiaTabela3(tabela: string;
  progrbar: TProgressBar): integer;
var
  vTabHwFdb, vDelHwf: TIBQuery;
  vSqlSemParametros: WideString;
  vSqlComParametros: WideString;
  I: Integer;
  vprogrbar: TProgressBar;
  vBookMark: Pointer;
  vTempFor: Integer;
  vWhereSql: string;
  J: Integer;
  vTemCod_empresa, vTemCodigo_emp: Boolean;
begin
  try
    Application.ProcessMessages;
    if vDadosIni.vParar = 1 then
      Exit;
    vTabHwFdb := TIBQuery(dtmTerminaisF.qrHwf);
    vDelHwf := TIBQuery(dtmTerminaisF.IbapagarHwfdb);
    vprogrbar := TProgressBar(progrbar);
    vTabHwFdb.Close;

    if ((UpperCase(tabela) = 'PRODUTOS') and (vSincMercadorias > 0)) or
      ((UpperCase(tabela) = 'COD_BARRA') and (vSincMercadorias > 0)) or
      ((UpperCase(tabela) = 'CLIENTES') and (vSincClientes > 0)) or
      ((UpperCase(tabela) = 'TABELA_PROCESSOS') and (vSincDemais > 0)) or
      ((UpperCase(tabela) = 'NBM') and (vSincDemais > 0)) then
    else
    begin
      vTabHwFdb.SQL.Text := 'delete from ' + tabela;
      try
        vTabHwFdb.ExecSQL;
      except
      end;
    end;
    vTabHwFdb.Close;
    vTabHwFdb.SQL.Text := 'select first 1 * from ' + tabela;
    vTabHwFdb.Open;

    buscas.Close;
    buscas.SQL.Text := 'select first 1 * from ' + tabela;
    buscas.Open;

    vSqlSemParametros := 'insert into ' + tabela + ' (';
    vSqlComParametros := 'values (';
    vTemCod_empresa :=  False;
    vTemCodigo_emp :=  False;
    for I := 0 to vTabHwFdb.FieldCount - 1 do
    begin
      if buscas.FindField(vTabHwFdb.Fields[i].FieldName) <> nil then
      begin
        if i = 0 then
        begin
          vSqlSemParametros := vSqlSemParametros + vTabHwFdb.Fields[i].FieldName;
          vSqlComParametros := vSqlComParametros + ':' + vTabHwFdb.Fields[i].FieldName;
        end
        else
        begin
          vSqlSemParametros := vSqlSemParametros + ', ' + vTabHwFdb.Fields[i].FieldName;
          vSqlComParametros := vSqlComParametros + ', :' + vTabHwFdb.Fields[i].FieldName;
        end;
        if not vTemCod_empresa then
          if UpperCase(vTabHwFdb.Fields[i].FieldName) = 'COD_EMPRESA' then
            vTemCod_empresa := True;
        if not vTemCodigo_emp then
          if UpperCase(vTabHwFdb.Fields[i].FieldName) = 'CODIDGO_EMP' then
            vTemCodigo_emp := True;
      end;
    end;
    vSqlSemParametros := vSqlSemParametros + ')';
    vSqlComParametros := vSqlComParametros + ')';

    vTabHwFdb.Close;
    vTabHwFdb.SQL.Text := vSqlSemParametros + ' ' + vSqlComParametros;

    vprogrbar.Position := 0;
    vprogrbar.Min := 0;
    buscas.Close;
    if ((UpperCase(tabela) = 'PRODUTOS') and (vSincMercadorias > 0)) then
    begin
      buscas.SQL.Text := 'select count(*) as contador from ' + tabela;
      if vSincMercadorias = 1 then
        buscas.SQL.Text := buscas.SQL.Text + ' where dat_mod_prod >= :hwf_database'
      else if vSincMercadorias = 2 then
        buscas.SQL.Text := buscas.SQL.Text + ' where data_alt_preco >= :hwf_database';
      buscas.ParamByName('hwf_database').AsDate := vSincDataBase;
    end
    else if ((UpperCase(tabela) = 'COD_BARRA') and (vSincMercadorias = 1)) then
    begin
      buscas.SQL.Text := 'select count(*) as contador from ' + tabela +
        ' where dat_mod_cdbar >= :hwf_database';
      buscas.ParamByName('hwf_database').AsDate := vSincDataBase;
    end
    else if ((UpperCase(tabela) = 'CLIENTES') and (vSincClientes > 0)) or
      ((UpperCase(tabela) = 'TABELA_PROCESSOS') and (vSincDemais > 0)) or
      ((UpperCase(tabela) = 'NBM') and (vSincDemais > 0)) then
    begin
      buscas.SQL.Text := 'select count(*) as contador from ' + tabela +
        ' where data_mod_cad >= :hwf_database';
      buscas.ParamByName('hwf_database').AsDate := vSincDataBase;
    end
    else
      buscas.SQL.Text := 'select count(*) as contador from ' + tabela;
    buscas.Open;
    vprogrbar.Max := buscas.FieldByName('contador').AsInteger;

    if (UpperCase(tabela) = 'PRODUTOS') or (UpperCase(tabela) = 'COD_BARRA') or (UpperCase(tabela) =
      'CLIENTES') then
      vTempFor := 10
    else
      vTempFor := 1;

    for J := 0 to vTempFor - 1 do
    begin
      buscas.Close;
      if (UpperCase(tabela) = 'PRODUTOS') or (UpperCase(tabela) = 'COD_BARRA') then
      begin
        vWhereSql := ' where rtrim(cod_prod) like ' + QuotedStr('%' + IntToStr(J));
        if (UpperCase(tabela) = 'COD_BARRA') then
        begin
          if vSincMercadorias > 0 then
            vWhereSql := vWhereSql + ' and dat_mod_cdbar >= :hwf_database';
        end
        else
        begin
          if vSincMercadorias = 1 then
            vWhereSql := vWhereSql + ' and dat_mod_prod >= :hwf_database'
          else if vSincMercadorias = 2 then
            vWhereSql := vWhereSql + ' and data_alt_preco >= :hwf_database';
        end;
        vWhereSql := vWhereSql + ' and cod_empresa = ' + vDadosIni.codEmpresa +' order by grupo_prod, cod_prod'
      end
      else if UpperCase(tabela) = 'CLIENTES' then
      begin
        vWhereSql := ' where rtrim(cod_cliente) like ' + QuotedStr('%' + IntToStr(J));
        if vSincClientes > 0 then
          vWhereSql := vWhereSql + ' and data_mod_cad >= :hwf_database';
        vWhereSql := vWhereSql + ' and cod_empresa = ' + vDadosIni.codEmpresa +' order by cod_cliente'
      end
      else if ((UpperCase(tabela) = 'TABELA_PROCESSOS') or (UpperCase(tabela) = 'NBM')) and (vSincDemais > 0) then
        vWhereSql := ' where data_mod_cad >= :hwf_database'
      else
        vWhereSql := '';
      if (vTemCod_empresa) and (Pos('COD_EMPRESA', UpperCase(vWhereSql)) = 0) then
      begin
        if Trim(vWhereSql) = '' then
          vWhereSql := ' where cod_empresa = ' + vDadosIni.codEmpresa
        else
          vWhereSql := vWhereSql + ' and cod_empresa = ' + vDadosIni.codEmpresa
      end
      else if (vTemCodigo_emp) and (Pos('CODIGO_EMP', UpperCase(vWhereSql)) = 0) then
      begin
        if Trim(vWhereSql) = '' then
          vWhereSql := ' where codigo_emp = ' + vDadosIni.codEmpresa
        else
          vWhereSql := vWhereSql + ' and codigo_emp = ' + vDadosIni.codEmpresa
      end;

      buscas.SQL.Text := 'select * from ' + tabela + vWhereSql;
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
        if ((UpperCase(tabela) = 'PRODUTOS') and (vSincMercadorias > 0)) then
        begin
          vDelHwf.Close;
          vDelHwf.SQL.Text := 'delete from produtos' +
            ' where grupo_prod = ' + IntToStr(buscas.FieldByName('grupo_prod').AsInteger) +
            ' and cod_prod = ' + QuotedStr(buscas.FieldByName('cod_prod').AsString) +
            ' and cod_empresa = ' + IntToStr(buscas.FieldByName('cod_empresa').AsInteger);
          vDelHwf.ExecSQL;
        end
        else if ((UpperCase(tabela) = 'COD_BARRA') and (vSincMercadorias > 0)) then
        begin
          vDelHwf.Close;
          vDelHwf.SQL.Text := 'delete from cod_barra' +
            ' where grupo_prod = ' + IntToStr(buscas.FieldByName('grupo_prod').AsInteger) +
            ' and cod_prod = ' + QuotedStr(buscas.FieldByName('cod_prod').AsString) +
            ' and cod_barra = ' + QuotedStr(buscas.FieldByName('cod_barra').AsString) +
            ' and cod_empresa = ' + IntToStr(buscas.FieldByName('cod_empresa').AsInteger);
          vDelHwf.ExecSQL;
        end
        else if ((UpperCase(tabela) = 'CLIENTES') and (vSincClientes > 0)) then
        begin
          vDelHwf.Close;
          vDelHwf.SQL.Text := 'delete from clientes' +
            ' where cod_cliente = ' + IntToStr(buscas.FieldByName('cod_cliente').AsInteger) +
            ' and cod_empresa = ' + IntToStr(buscas.FieldByName('cod_empresa').AsInteger);
          vDelHwf.ExecSQL;
        end
        else if ((UpperCase(tabela) = 'TABELA_PROCESSOS') and (vSincDemais > 0)) then
        begin
          vDelHwf.Close;
          vDelHwf.SQL.Text := 'delete from tabela_processos' +
            ' where cod_processo = ' + QuotedStr(buscas.FieldByName('cod_processo').AsString) +
            ' and cod_empresa = ' + IntToStr(buscas.FieldByName('cod_empresa').AsInteger);
          vDelHwf.ExecSQL;
        end
        else if ((UpperCase(tabela) = 'NBM') and (vSincDemais > 0)) then
        begin
          vDelHwf.Close;
          vDelHwf.SQL.Text := 'delete from nbm' +
            ' where COD_NCM = ' + QuotedStr(buscas.FieldByName('COD_NCM').AsString);
          vDelHwf.ExecSQL;
        end;

        vTabHwFdb.Close;
        for I := 0 to vTabHwFdb.ParamCount - 1 do
        try
          if UpperCase(vTabHwFdb.Params[i].Name) = 'HWF_DATABASE' then
            vTabHwFdb.ParamByName(vTabHwFdb.Params[i].Name).Value := vSincDataBase
          else
            vTabHwFdb.ParamByName(vTabHwFdb.Params[i].Name).Value :=
              buscas.FieldByName(vTabHwFdb.Params[i].Name).Value;
        except
        end;
        try
          vTabHwFdb.ExecSQL;
        except
          //Inc(erros);
        end;
        buscas.Next;
        vprogrbar.Position := vprogrbar.Position + 1;
        if (vprogrbar.Position mod 10 = 0) and (vprogrbar.Position > 1) then
          Application.ProcessMessages;
        if (vprogrbar.Position mod 100 = 0) and (vprogrbar.Position > 1) then
        begin
          Application.ProcessMessages;
          if vTabHwFdb.Transaction.InTransaction then
            vTabHwFdb.Transaction.Commit;
        end;

        if vDadosIni.vParar = 1 then
        begin
          if Application.MessageBox('Tem certeza que deseja parar o processamento?',
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
            exit
          else
            vDadosIni.vParar := 0;
        end;

      end;
      Application.ProcessMessages;
      if vTabHwFdb.Transaction.InTransaction then
        vTabHwFdb.Transaction.Commit;

    end;
  except
    on e: exception do begin
      application.messagebox(pchar(e.Message), 'Informação', MB_ICONINFORMATION + MB_OK);
      exit;
    end;
  end;
end;

function TTerminaisF.CopyFileWithProgressBar(pSource, pDestination: string;
  pProgressBar: TProgressBar): Boolean;
var
  FromF, ToF: file of byte;
  Buffer: array[0..4096] of char;
  NumRead: integer;
  FileLength: longint;
  vTmp: string;
  vCount: Integer;
begin
  Result := False;
  AssignFile(FromF, pSource);
  reset(FromF);
  if FileExists(pDestination + '_NEW') then
    DeleteFile(pchar(pDestination + '_NEW'));
    
  AssignFile(ToF, pDestination + '_NEW');
  rewrite(ToF);
  try
    try
      FileLength := FileSize(FromF);
      with pProgressBar do
      begin
        Min := 0;
        Max := FileLength;
        while FileLength > 0 do
        begin
          BlockRead(FromF, Buffer[0], SizeOf(Buffer), NumRead);
          FileLength := FileLength - NumRead;
          BlockWrite(ToF, Buffer[0], NumRead);
          Position := Position + NumRead;
          Application.ProcessMessages;
        end;
      end;
    finally
      CloseFile(FromF);
      CloseFile(ToF);
    end;

    if FileExists(pDestination) then
      if not DeleteFile(pchar(pDestination)) then
      begin
        Application.MessageBox(pchar('Não é possivel criar arquivo em: ' +pDestination +#13 +
          'Arquivo em uso. Repita a operação'), 'Atenção', 0 + 64);
      end;
    RenameFile(pDestination + '_NEW', pDestination);

    Result := True;
  except
    on e: exception do
    begin
      registraErro('TTerminaisF.CopyFileWithProgressBar. Erro: ' + e.Message);
      Application.MessageBox(pchar('TTerminaisF.CopyFileWithProgressBar. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TTerminaisF.cpdadostab: boolean;
var
  itx: integer;
begin
  for Itx := 0 to buscas.FieldCount - 1 do
  begin
    if buscas.Fields[Itx].FieldName = 'NATURALID' then
      cdsDestino.FieldByName(buscas.Fields[Itx].FieldName).asstring :=
        buscas.FieldByName(buscas.Fields[Itx].FieldName).AsString
    else
      cdsDestino.FieldByName(buscas.Fields[Itx].FieldName).Value :=
        buscas.FieldByName(buscas.Fields[Itx].FieldName).Value;
  end;
  cdsDestino.Post;
  cdsDestino.ApplyUpdates(-1);
end;

constructor TTerminaisF.create;
begin
  if dtmTerminaisF = nil then
    dtmTerminaisF := TdtmTerminaisF.create(dtmTerminaisF);
  DataSet := TClientDataSet(dtmTerminaisF.CdsTerminalF);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
  Transsinc := TIBTransaction(dtmTerminaisF.IbTransTerminalInLoco);
  cdsDestino := TClientDataSet(dtmTerminaisF.CdsDestinoHWFFDB);
  ibapag := TIBQuery(dtmTerminaisF.IbapagarHwfdb);
  SoftFiscal := TSoftFiscal.Create;
  SoftFiscal.abreSofFiscal;
  CadResumoD := TResumoD.create;
  CadDocNaofiscal := TDocNaoFiscal.create;
  CadImpressoraTerm := TImpresssorasTerm.create;
  dll := 'N';
  vparar := 0;
  vtermsql := '';

  fPathLog := ExtractFilePath(ParamStr(0)) + 'hwService.log';
end;

function TTerminaisF.DadosECFAtual: boolean;
begin
  buscas.close;
  buscas.SQL.text := 'select * from terminal_impressoras where cod_terminal = ' +
    dataSet.FieldByName('COD_TERMINAL').AsString +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and atual = ''S''';
  buscas.open;
  num_serie := buscas.FieldByName('NUM_SERIE_ECF').AsString;
  mf_adicional := buscas.FieldByName('MF_ADICIONAL').AsString;
  data_cad_term := buscas.FieldByName('DATA_CAD_TERM').AsString;
  data_mod_term := buscas.FieldByName('DATA_MOD_TERM').AsString;
  data_sb := buscas.FieldByName('DATA_SB').AsString;
  hora_sb := buscas.FieldByName('HORA_SB').AsString;
  issqn := buscas.FieldByName('ISSQNDESC').AsString;
  Result := true;
end;

function TTerminaisF.delete: boolean;
begin
  CancelUpdates;
  if application.messagebox('Tem certeza que deseja Excluir o Terminal?', 'Confirmação', mb_yesno
    + MB_DEFBUTTON2) = IDYES then
    if inherited Delete then
      if Apply then
        commitatransacao;
end;

destructor TTerminaisF.destroy;
begin
  dataSet.Close;
  inherited;
end;

function TTerminaisF.detalhesFormaPagamentoVendas(cod_terminal: integer;
  dataInicial, dataFinal: string; offline: boolean): boolean;
var
  vDetalheVendaP: TClientDataSet;
  buscas2: TIBQuery;
begin
  vDetalheVendaP := TClientDataSet(dtmTerminaisF.cdsDetVendT);
  buscas2 := TIBQuery(dtmTerminaisF.IbTerminalinloco);
  while not vDetalheVendaP.IsEmpty do
    vDetalheVendaP.Delete;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('cod_terminal').AsInteger = cod_terminal then
    begin
      if offline then
        exit;

      if vDadosIni.conectaBanco(dtmAtivo.bancoFiscal,
        trim(dataSet.FieldByName('END_TERMINAL').AsString), False) then
      begin
        buscas2.Close;
        buscas2.SQL.Text := 'select f.descricao, fc.data, sum(fc.valor) valor from fincupom fc' +
          ' inner join finalizadores f on fc.finalizador  = f.cod_finalizador' +
          ' inner join cupom cp on cp.cod_terminal = fc.cod_terminal and cp.nserieecf = fc.nserieecf and' +
          ' cp.cod_empresa = fc.cod_empresa and fc.cupom = cp.cupom and fc.ordem = cp.registro' +
          ' where cp.data >= :dataini and cp.data <= :datafim and' +
          ' ((cp.status_cp <> ''CANCELADO'') or (cp.status_cp is null))' +
          ' group by fc.data, f.descricao';
        buscas2.Params[0].AsDate := StrToDate(dataInicial);
        buscas2.Params[1].AsDate := StrToDate(dataFinal);
        buscas2.Open;
        while not buscas2.Eof do
        begin
          vDetalheVendaP.Insert;
          vDetalheVendaP.FieldByName('descricao').AsString :=
            buscas2.FieldByName('descricao').AsString;
          vDetalheVendaP.FieldByName('valor').AsCurrency := buscas2.FieldByName('valor').AsCurrency;
          vDetalheVendaP.Post;
          buscas2.Next;
        end;
        buscas2.Close;
        Result := true;
      end;
      Break;
    end;
    dataSet.Next;
  end;
end;

function TTerminaisF.edit: boolean;
begin
  RollBackTransacao;
  result := inherited edit;

  if not Result then
    Exit;

  dataSet.FieldByName('NOME_TERMINAL').AsString := trim(dataSet.FieldByName('NOME_TERMINAL').AsString);
end;

function TTerminaisF.enderecohwfdb: string;
begin
  buscas.close;
  buscas.SQL.text := 'select * from empresa where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1';
  buscas.open;
  Result := buscas.FieldByName('ENDERECOHWFFDB').AsString;
  buscas.close;
end;

function TTerminaisF.limpatabela(vtabela: string): boolean;
begin
  try
    ibapag.close;
    ibapag.SQL.Text := 'delete from empresa';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from clientes';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from cod_barra';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from produtos';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from colaborador';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from estados';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from funcoes';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from senhas';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from tipos_clientes';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from tipo_servico';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from codigo_banco';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from cond_pag';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from controles';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.close;
    ibapag.SQL.Text := 'delete from tabjuros';
    ibapag.Prepare;
    ibapag.ExecSQL;
    ibapag.SQL.Text := 'delete from TABELA_PROCESSOS';
    ibapag.Prepare;
    ibapag.ExecSQL;

  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtInformation, [mbOK], 0);
      registraErro('E0001 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TTerminaisF.MontarArquivoHwF(vprogrbar: TprogressBar; vlabel: Tlabel;
  VenderecoOr: string; gridenv: Tdbgrid): boolean;
var
  erros: Integer;
  vBancoTemp, vBancoTemp2: string;
  vOK: boolean;
  vTemp: string;
  vTabHwFdb: TIBQuery;
begin
  vTemp := VenderecoOr;
  if Pos(':', vTemp) > 0 then
    vTemp := copy(vTemp, Pos(':', vTemp) + 1, Length(vTemp));

  if Pos(':', vTemp) = 0 then
    VenderecoOr := Pchar('127.0.0.1:' + VenderecoOr);

//    if Pos('127.0.0.1:', vDadosIni.vBancoHwF) = 0 then
//      vDadosIni.vBancoHwF := Pchar('127.0.0.1:' + vDadosIni.vBancoHwF);


  if Pos(UpperCase('HWF.FDB'), UpperCase(VenderecoOr)) > 0 then
    vBancoTemp := StringReplace(VenderecoOr, '\\', '\', [rfReplaceAll])
  else
    vBancoTemp := StringReplace(VenderecoOr + '\Hwf.fdb', '\\', '\', [rfReplaceAll]);
  if vDadosIni.conectaBanco(dtmTerminaisF.DtbHwFFDB, vBancoTemp, true) then
  begin
    //    limpatabela('');
    if (dll = 'N') then
    begin
//      if Application.MessageBox('Deseja reestruturar o Hwf.fdb', 'Confirmação', MB_ICONQUESTION +
//        MB_YESNO) = IDYES then
      begin
        vBancoTemp2 := vDadosIni.vBancoHwF;
        vDadosIni.vBancoHwF := vBancoTemp;
        if vDadosIni.reestruturarBancoDeDados('hwf', true) then
        begin
          vTabHwFdb := TIBQuery(dtmTerminaisF.IbapagarHwfdb);
          vTabHwFdb.Close;
          vTabHwFdb.SQL.Text := 'update EMPDESVOLV set versaobancohwf = '+IntToStr(vDadosIni.vVersaoBancoHwF)+' where COD_EMPDES = 1';
          vTabHwFdb.ExecSQL;
          if vTabHwFdb.Transaction.InTransaction then
            vTabHwFdb.Transaction.Commit;
        end;
        vDadosIni.vBancoHwF := vBancoTemp2;
      end;
    end
    else
    begin
      begin
        vBancoTemp2 := vDadosIni.vBancoHwF;
        vDadosIni.vBancoHwF := vBancoTemp;
        if vDadosIni.reestruturarBancoDeDados('hwf', true) then
        begin
          vTabHwFdb := TIBQuery(dtmTerminaisF.IbapagarHwfdb);
          vTabHwFdb.Close;
          vTabHwFdb.SQL.Text := 'update EMPDESVOLV set versaobancohwf = '+IntToStr(vDadosIni.vVersaoBancoHwF)+' where COD_EMPDES = 1';
          vTabHwFdb.ExecSQL;
          if vTabHwFdb.Transaction.InTransaction then
            vTabHwFdb.Transaction.Commit;
        end;
        vDadosIni.vBancoHwF := vBancoTemp2;
      end;
    end;

    erros := 0;
    vlabel.caption := 'Preparando Empresa';
    erros := erros + copiaTabela3('EMPRESA', vprogrbar);
    vlabel.caption := 'Preparando Estados';
    erros := erros + copiaTabela3('ESTADOS', vprogrbar);
    vlabel.caption := 'Preparando Tipos de Clientes';
    erros := erros + copiaTabela3('TIPOS_CLIENTES', vprogrbar);
    vlabel.caption := 'Preparando Serviços';
    erros := erros + copiaTabela3('TIPO_SERVICO', vprogrbar);
    vlabel.caption := 'Preparando Funções';
    erros := erros + copiaTabela3('FUNCOES', vprogrbar);
    vlabel.caption := 'Preparando Funcionários';
    erros := erros + copiaTabela3('COLABORADOR', vprogrbar);
    vlabel.caption := 'Preparando Tabela de Aplicativos';
    erros := erros + copiaTabela3('ERP', vprogrbar);
    vlabel.caption := 'Preparando Usuários';
    erros := erros + copiaTabela3('SENHAS', vprogrbar);
    vlabel.caption := 'Preparando Usuários por Aplicativo';
    erros := erros + copiaTabela3('SENHAS_ERP', vprogrbar);
    vlabel.caption := 'Preparando Bancos';
    erros := erros + copiaTabela3('CODIGO_BANCO', vprogrbar);
    vlabel.caption := 'Preparando Condições de Pagamento';
    erros := erros + copiaTabela3('COND_PAG', vprogrbar);
    vlabel.caption := 'Preparando Controles';
    erros := erros + copiaTabela3('CONTROLES', vprogrbar);
    vlabel.caption := 'Preparando Tabela de Juros';
    erros := erros + copiaTabela3('TABJUROS', vprogrbar);
    vlabel.caption := 'Preparando Tabela de Processos';
    erros := erros + copiaTabela3('TABELA_PROCESSOS', vprogrbar);
    vlabel.caption := 'Preparando Exeções da Tabela de Processos';
    erros := erros + copiaTabela3('TABELA_PROCESSOS_USUARIOS', vprogrbar);
    vlabel.caption := 'Preparando Clientes';
    erros := erros + copiaTabela3('CLIENTES', vprogrbar);
    vlabel.caption := 'Preparando Produtos';
    erros := erros + copiaTabela3('PRODUTOS', vprogrbar);
    vlabel.caption := 'Preparando Códigos de Barra';
    erros := erros + copiaTabela3('COD_BARRA', vprogrbar);
    vlabel.caption := 'Preparando NCM';
    erros := erros + copiaTabela3('NBM', vprogrbar);
    vlabel.caption := 'Preparando Serviços Lei Complementar 116';
    erros := erros + copiaTabela3('TIPOSERVICONFSE', vprogrbar);
    vlabel.caption := 'Preparando NBS';
    erros := erros + copiaTabela3('NBS', vprogrbar);
    vlabel.caption := 'Preparando Tabela de Configurações';
    erros := erros + copiaTabela3('CONFIG_SISTEMA', vprogrbar);

    setDataBaseAlteracaoArquivoHwF(VenderecoOr);

    vDadosIni.desconectaBanco(dtmTerminaisF.DtbHwFFDB);
    if vDadosIni.vParar = 0 then
    begin
      if erros > 0 then
        application.messagebox(pchar('Arquivo Criado com ' + IntToStr(erros) +
          ' erros, este arquivo será enviado para os terminais'), 'Informação', MB_ICONINFORMATION
          +
          MB_OK)
      else
        if (dll = 'N') then
        begin
          if vDadosIni.vEmp.vResponsavelCopiaHwF <> 'T' then
          application.messagebox('Arquivo Criado com Sucesso, este arquivo será enviado para os terminais', 'Informação', MB_ICONINFORMATION +
            MB_OK);
        end;
      dataSet.First;


      if Pos('127.0.0.1:', vBancoTemp) > 0 then
      begin
        vBancoTemp := StringReplace(vBancoTemp, '127.0.0.1:', '', [rfReplaceAll,
          rfIgnoreCase]);
      end;

      if vDadosIni.vEmp.vResponsavelCopiaHwF = 'T' then
      begin
        if not CopyFileWithProgressBar(Pchar(vBancoTemp), Pchar(trim(vDadosIni.vEmp.vDirCopiaHwFTerminais) + '\HwF.fdb'), vprogrbar) then
          if not (dll = 'S') then
            application.messagebox(Pchar('Erro ao enviar HWF.FDB para destino: ' +
              Trim(trim(vDadosIni.vEmp.vDirCopiaHwFTerminais) + '\HwF.fdb')), 'Informação', MB_ICONINFORMATION + MB_OK);
      end
      else
      while not dataSet.eof do
      begin
        try
          if (dll = 'S') then
            vOK := true
          else if gridenv = nil then
            vOK := True
          else
            vOK := gridenv.SelectedRows.CurrentRowSelected;

          if (vOK) then
          begin
            //            try
            //            vDadosIni.copyArquivo(
            //              vBancoTemp,
            //
            //                trim(dataSet.FieldByName('ENDREDEHWF_FDB').asstring) + '\HwF.Fdb');
            //            except
            //              application.messagebox(Pchar('Erro ao enviar HWF.FDB para ' +
            //                Trim(dataSet.FieldByName('nome_terminal').AsString) + '. Confira os Endereços'),
            //                'Informação', MB_ICONINFORMATION + MB_OK);
            //            end;


            if not CopyFileWithProgressBar(Pchar(vBancoTemp),
              Pchar(trim(dataSet.FieldByName('ENDREDEHWF_FDB').asstring) + '\HwF.Fdb'), vprogrbar) then
            begin
              if not (dll = 'S') then
                application.messagebox(Pchar('Erro ao enviar HWF.FDB para ' +
                  Trim(dataSet.FieldByName('nome_terminal').AsString) + '. Confira o Endereço '),
                  'Informação', MB_ICONINFORMATION + MB_OK);
              if (dll = 'S') then
                _salvarLog('Erro ao enviar HWF.FDB para ' +
                  trim(dataSet.FieldByName('ENDREDEHWF_FDB').asstring) +
                  ', Confira os Endereços do ' +
                  Trim(dataSet.FieldByName('nome_terminal').AsString) + '');
            end
            else
            begin
              if (dll = 'S') then
                _salvarLog('Copia do ' + Trim(dataSet.FieldByName('nome_terminal').AsString) +
                  ' concluído com sucesso, em ' +
                  trim(dataSet.FieldByName('ENDREDEHWF_FDB').asstring)
                  + '');
            end;
          end;
        except
          on e: exception do
          begin
            if not (dll = 'S') then
              MessageDlg('Erro ao enviar HWF.FDB para ' +
                dataSet.FieldByName('nome_terminal').AsString,
                mtInformation, [mbOK], 0);
            MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
            registraErro('ET0001 ' + e.Message);
          end;
        end;
        dataSet.next;
      end;
      if not (dll = 'S') then
        MessageDlg('Operação Concluída', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TTerminaisF.novaPaginarelatorioDeVendasPorSecao(Sender: TObject;
  Pagina: Integer);
var
  vcol, i: integer;
begin
  RdVS.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  RdVS.ImpF(linha, 1, 'RELATORIO DE VENDA POR SECAO', [normal, negrito]);
  linha := linha + 1;
  RdVS.ImpF(linha, 1, 'NO PERIODO DE: ' + dataInicial + ' A ' + dataFinal, [normal, negrito]);
  linha := linha + 1;
  RdVS.ImpF(linha, 1, vDadosIni.replicate('-', 132), [comp20]);
  linha := linha + 1;
  RdVS.ImpF(linha, 1, 'TERMINAIS: ', [comp20]);
  vcol := 12;
  for i := 1 to 99 do
  begin
    if vterm[i] <> 0 then
    begin
      RdVS.ImpF(linha, vcol, vDadosIni.strzero(vterm[i], 3), [comp20]);
      vcol := vcol + 5;
    end;
  end;
  vpag := vpag + 1;
  linha := linha + 2;
  RdVS.ImpF(linha, 1, datetostr(date), [normal]);
  RdVS.ImpF(linha, 80, 'PAG: ' + vDadosIni.strzero(vpag, 3), [normal]);
  linha := linha + 1;
  RdVS.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp20]);
  linha := linha + 1;
  RdVS.ImpF(linha, 1, 'SECAO', [comp20]);
  RdVS.ImpF(linha, 15, 'DESCRICAO', [comp20]);
  RdVS.ImpF(linha, 52, 'ITENS', [comp20]);
  RdVS.ImpF(linha, 69, 'DESCONTOS', [comp20]);
  RdVS.ImpF(linha, 83, 'ACRESCIMOS', [comp20]);
  RdVS.ImpF(linha, 94, 'TOTAL VENDIDO', [comp20]);
  RdVS.ImpF(linha, 108, 'P.VENDA', [comp20]);
  RdVS.ImpF(linha, 116, 'M.F.', [comp20]);
  RdVS.ImpF(linha, 120, 'DIA SEMANA', [comp20]);
  linha := linha + 1;
  //RdVS.ImpF(linha,1,'CUSTO',[comp20]);
  RdVS.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp20]);
  linha := linha + 1;
end;

function TTerminaisF.nregistro(vprogrbar: TprogressBar): boolean;
begin
  buscas.FetchAll;
  vprogrbar.Min := 0;
  vprogrbar.Position := 0;
  vprogrbar.Max := buscas.RecordCount;
end;

function TTerminaisF.parar_servico: boolean;
begin
  Result := false;
  if application.messagebox('Tem certeza que deseja Cancelar o processamento?', 'Confirmação',
    mb_yesno + MB_DEFBUTTON2) = IDYES then
  begin
    Result := true;
  end;
end;

function TTerminaisF.performance(vdtini, vdtfinal: string): real;
var
  vmediaminuto: real;
  vqtde: integer;
begin
  buscas.Close;
  buscas.sql.text := 'select co.cod_vendedor,co.nome_vendedor,pv.horaabertura,pv.horafechamento,' +
    'pv.minabertura,pv.minfechamento,pv.nped,pv.ncupom,case extract(weekday from pv.data_fech) ' +
    'when 0 then ''Domingo'' ' +
    'when 1 then ''Segunda-feira'' ' +
    'when 2 then ''Terça-feira'' ' +
    'when 3 then ''Quarta-feira'' ' +
    'when 4 then ''Quinta-feira'' ' +
    'when 5 then ''Sexta-feira'' ' +
    'when 6 then ''Sábado'' ' +
    'end diasemana,' +
    'case when pv.horaabertura = pv.horafechamento then pv.minfechamento - pv.minabertura ' +
    'when pv.horaabertura < pv.horafechamento then ((pv.horafechamento - pv.horaabertura)*60) - (pv.minabertura - pv.minfechamento) ' +
    'end minutosparafechar ' +
    'from pedvenda pv ' +
    'inner join colaborador co on co.cod_vendedor = pv.cod_vendedor and co.cod_empresa = pv.cod_empresa ' +
    'where pv.data_fech >= :data1 ' +
    'and pv.data_fech <= :data2 ' +
    'and pv.cod_empresa = :cod_empresa ' +
    'and pv.operador in (:operador) ' +
    'and pv.ativo = 1 ' +
    'and not pv.ncupom is null ' +
    'and not pv.minabertura is null ' +
    'and not pv.minfechamento is null ' +
    'and not pv.horaabertura is null ' +
    'and not pv.horafechamento is null ' +
    'and pv.status_ped = ''FECHADA'' ' +
    'group by 1,2,3,4,5,6,7,8,9 ';
  buscas.Params[0].AsDate := StrToDate(vdtini);
  buscas.Params[1].AsDate := StrToDate(vdtfinal);
  buscas.Params[2].AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Params[3].AsString := vtermsql;
  //dataSet.FieldByName('cod_terminal').AsInteger;
  buscas.Open;
  vqtde := 1;
  vmediaminuto := 0;
  while not buscas.eof do
  begin
    vmediaminuto := vmediaminuto + buscas.FieldByName('minutosparafechar').AsCurrency;
    vqtde := vqtde + 1;
    buscas.next;
  end;
  result := vmediaminuto / vqtde;
end;

function TTerminaisF.post: boolean;
begin
  try
    result := true;
    IniciaTransacao;
    if trim(DataSet.FieldByName('NOME_TERMINAL').AsString) = '' then
      raise exception.create('Preencha o Nome do Terminal');
    if (DataSet.FieldByName('END_TERMINAL').AsString) = '' then
      raise exception.create('Preencha o Endereço do terminal');
    if (DataSet.FieldByName('ENDREDEHWF_FDB').AsString) = '' then
      raise exception.create('Preencha o Endereço do HwF.fdb');
    if (DataSet.FieldByName('COD_FISCAL').AsString) = '' then
      raise exception.create('Preencha a versão do FISCAL');
    if DataSet.State = dsInsert then
    begin
      DataSet.FieldByName('cod_terminal').AsInteger := Gencodigo('TERMINALF',
        dtmTerminaisF.SpIncCodigo, vDadosIni.codEmpresa);
      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('ATIVO').AsInteger := 1;
    end;
    result := inherited post;
    Apply;
    CommitaTransacao;
    vDadosIni.GravaAuditoria('TERM003', 'INCLUIR', 'SUCESSO', 'TERMINALF',
      DataSet.FieldByName('cod_terminal').AsString, buscas);
    application.messagebox('Dados Gravados com Sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  except
    on e: exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('TERM003', 'INCLUIR', 'FALHA', 'TERMINALF',
        DataSet.FieldByName('cod_terminal').AsString, buscas);
      result := false;
      MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0001 ' + e.Message);
    end;
  end;
end;

function TTerminaisF.relatorioDeVendasPorSecao(dtInicial, dtFinal:
  string; progress: TProgressBar; grid: TDBGrid): boolean;
var
  vSql: string;
  qrVendS, qrMaxS, qrDesc, qrDescTot: TIBQuery;
  vQtde, vTotalVenda, vlDescOperador, vldescs: Currency;
  vCodSubGrupo: integer;
  vflagop: Integer;
  i: Integer;
  vtotvg: Currency;
  vqtdg: Currency;
begin
  i := 1;
  dataSet.First;
  while not dataSet.eof do
  begin
    if grid.SelectedRows.CurrentRowSelected then
    begin
      vterm[i] := dataSet.FieldByName('COD_TERMINAL').AsInteger;
      i := i + 1;
    end;
    dataSet.next;
  end;
  linha := 1;
  vpag := 0;
  vQtde := 0;
  vTotalVenda := 0;
  vlDescOperador := 0;
  vldescs := 0;
  dataInicial := dtInicial;
  dataFinal := dtFinal;
  qrVendS := TIBQuery(dtmTerminaisF.QrBuscas4);
  qrMaxS := TIBQuery(dtmTerminaisF.QrBuscasFin);
  qrDesc := TIBQuery(dtmTerminaisF.qrBuscas2);
  qrDescTot := TIBQuery(dtmTerminaisF.QrBuscas3);
  rdVS := TRDprint(dtmTerminaisF.rdpRel);
  rdVS.OnNewPage := novaPaginarelatorioDeVendasPorSecao;
  if not vDadosIni.ModImp(dtmTerminaisF.rdpRel) then
    exit;
  try
    RdVS.Abrir;
    //  rdVS.Novapagina;//

    qrVendS.Close;
    qrVendS.SQL.Text :=
      'select sb.codigo_subgr,sb.descricao,pv.operador,sum(pi.quant_ped_item) soma,'
      +
      ' sum(pi.vltot_ped_item) soma1 from produtos pr,pedvenda pv,pedvenda_prod pi,sub_grupo sb' +
      ' where pi.nped = pv.nped and' +
      ' pv.data_fech >= :vdat1 and pv.data_fech <= :vdat2 and pi.grupo_prod = pr.grupo_prod' +
      ' and pi.cod_prod = pr.cod_prod and pr.sub_g_prod = sb.codigo_subgr' +
      ' and pv.cod_empresa = pi.cod_empresa' +
      ' and pv.cod_empresa = pr.cod_empresa' +
      ' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo=1' +
      ' and pv.tipo = pi.tipo and pv.tipo = ''REQ''' +
      ' and pi.status is null ' +
      ' group by sb.codigo_subgr,sb.descricao,pv.operador';
    qrVendS.Params[0].AsDate := StrToDate(dataInicial);
    qrVendS.Params[1].AsDate := StrToDate(dataFinal);
    qrVendS.Open;

    vCodSubGrupo := qrVendS.FieldByName('CODIGO_SUBGR').AsInteger;
    vQtde := 0;
    vTotalVenda := 0;
    vlDescOperador := 0;
    vldescs := 0;
    // imprime o codigo e o tipo do produto
    QrMaxS.close;
    qrMaxS.SQL.Text := 'select pr.sub_g_prod,pv.data_fech,pv.horafechamento,' +
      ' max(pi.quant_ped_item) soma from produtos pr,pedvenda pv,pedvenda_prod pi,' +
      ' sub_grupo sb where pi.nped = pv.nped and pr.sub_g_prod = :vsubgr' +
      ' and pv.data_fech >= :vdat1 and pv.data_fech <= :vdat2 and pi.grupo_prod = pr.grupo_prod and pi.cod_prod =' +
      ' pr.cod_prod and pr.sub_g_prod = sb.codigo_subgr' +
      ' and pv.cod_empresa = pi.cod_empresa' +
      ' and pv.cod_empresa = pr.cod_empresa' +
      ' and pv.cod_empresa = :cod_empresa and pv.ativo=1' +
      ' and pv.tipo = pi.tipo and pv.tipo = ''REQ''' +
      ' and pi.status is null ' +
      ' group by pr.sub_g_prod,pv.data_fech,pv.horafechamento';
    QrMaxS.Params[0].value := qrVendS.FieldByName('CODIGO_SUBGR').AsInteger;
    QrMaxS.params[1].value := strtodate(dataInicial);
    QrMaxS.params[2].value := strtodate(dataFinal);
    QRMaxS.ParamByName('COD_EMPRESA').Text := vDadosIni.codEmpresa;
    QrMaxS.open;
    QrDesc.close;
    qrDesc.SQL.Text := 'select operador,sum(pv.valor_total) soma from pedvenda pv' +
      ' where pv.data_fech >= :vdat1 and pv.data_fech <= :vdat2' +
      ' and cod_empresa = :cod_empresa and pv.status_ped = ''FECHADA'' and ativo=1 group by operador';
    QrDesc.params[0].value := strtodate(dataInicial);
    Qrdesc.params[1].value := strtodate(dataFinal);
    QRDesc.ParamByName('COD_EMPRESA').Text := vDadosIni.codEmpresa;
    QrDesc.open;
    QrDescTot.close;
    qrDescTot.SQL.Text := 'select pv.operador, sum(pi.vltot_ped_item) soma' +
      ' from pedvenda pv, pedvenda_prod pi' +
      ' where pi.nped = pv.nped' +
      ' and pv.tipo = pi.tipo' +
      ' and pv.tipo = ''REQ''' +
      ' and pv.status_ped = ''FECHADA'' ' +
      ' and pv.data_fech >= :vdat1' +
      ' and pv.data_fech <= :vdat2' +
      ' and pv.cod_empresa = pi.cod_empresa' +
      ' and pv.ativo=1 and pv.cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by pv.operador';
    QrDescTot.params[0].value := strtodate(dataInicial);
    QrDescTot.params[1].value := strtodate(dataFinal);
    //  QRDescTot.ParamByName('COD_EMPRESA').Text := vDadosIni.codEmpresa;
    QrDescTot.open;
    QrDesc.first;
    while not QrDesc.eof do
    begin
      vflagop := 0;
      for i := 1 to 99 do
      begin
        if QrDesc.FieldByName('OPERADOR').AsInteger = vterm[i] then
        begin
          vflagop := 1;
          break;
        end;
      end;
      if vflagop = 1 then
        vlDescOperador := vlDescOperador + QrDesc.FieldByName('SOMA').AsCurrency;
      QrDesc.next;
    end;
    vldescs := 0;
    QrDescTot.first;
    while not QrDescTot.eof do
    begin
      vflagop := 0;
      for i := 1 to 99 do
      begin
        if qrDescTot.FieldByName('OPERADOR').AsInteger = vterm[i] then
        begin
          vflagop := 1;
          break;
        end;
      end;
      if vflagop = 1 then
        vldescs := vldescs + qrDescTot.FieldByName('SOMA').AsCurrency;
      QrDescTot.next;
    end;
    vtotvg := 0;
    vqtdg := 0;
    if not QrVendS.eof then
    begin
      rdVS.Imp(linha, 1, vDadosIni.strzero(qrVendS.FieldByName('CODIGO_SUBGR').AsInteger, 3) + ' ' +
        QrVendS.FieldByName('DESCRICAO').AsString);
    end;
    QrVendS.first;
    while not QrVendS.eof do
    begin
      vflagop := 0;
      for i := 1 to 99 do
      begin
        if QrVendS.FieldByName('OPERADOR').AsInteger = vterm[i] then
        begin
          vflagop := 1;
          break;
        end;
      end;
      if vflagop = 1 then
      begin
        vtotvg := vtotvg + QrVendS.FieldByName('SOMA1').AsCurrency;
        vqtdg := vqtdg + QrVendS.FieldByName('SOMA').AsCurrency;
      end;
      QrVendS.next;
    end;
    //    vlDescOperador := vldescs - vlDescOperador;
    vlDescOperador := vlDescOperador - vldescs;
    QrVendS.first;
    if QrVendS.recordcount <> 0 then
    begin
      progress.position := 1;
      progress.min := 1;
      progress.max := QrVendS.recordcount;
    end;
    while not QrVendS.eof do
    begin
      Application.ProcessMessages;
      if (vCodSubGrupo = qrVendS.FieldByName('CODIGO_SUBGR').AsInteger) then
      begin
        //  verificar o operador
        vflagop := 0;
        for i := 1 to 99 do
        begin
          if QrVendS.FieldByName('OPERADOR').AsInteger = vterm[i] then
          begin
            vflagop := 1;
            break;
          end;
        end;
        if vflagop = 1 then
        begin
          vQtde := vQtde + QrVendS.FieldByName('SOMA').AsCurrency;
          vTotalVenda := vTotalVenda + QrVendS.FieldByName('SOMA1').AsCurrency;
        end;
      end
      else
      begin
        // imprime soma do produto anterior
        rdVS.Imp(linha, 52, vDadosIni.AlnDir(Format('%8.2f', [vQtde]), 8));
        if vtotvg <> 0 then
          rdVS.Imp(linha, 66, vDadosIni.AlnDir(format('%n', [((((vTotalVenda * 100) / vtotvg) *
              vlDescOperador) / 100)]),
            12));
        if vtotvg <> 0 then
          rdVS.Imp(linha, 94, vDadosIni.AlnDir(format('%n', [vTotalVenda - ((((vTotalVenda * 100) /
              vtotvg) * vlDescOperador) /
              100)]), 12));
        if vtotvg <> 0 then
          rdVS.Imp(linha, 108, vDadosIni.AlnDir(Format('%6.2f', [((vTotalVenda * 100) / vtotvg)]),
            6));
        rdVS.Imp(linha, 116, vDadosIni.strzero(QrMaxS.FieldByName('HORAFECHAMENTO').AsString, 2));
        rdVS.Imp(linha, 120, DiaSemana[DayOfWeek(QrMaxS.FieldByName('DATA_fech').AsDateTime)]);
        linha := linha + 1;
        if linha >= 64 then
        begin
          linha := 1;
          rdVS.Novapagina;
        end;
        QrMaxS.close;
        QrMaxS.Params[0].value := qrVendS.FieldByName('CODIGO_SUBGR').AsInteger;
        QrMaxS.params[1].value := strtodate(dataInicial);
        QrMaxS.params[2].value := strtodate(dataFinal);
        QRMaxS.ParamByName('COD_EMPRESA').Text := vDadosIni.codEmpresa;
        QrMaxS.open;
        // imprime o codigo e o tipo do produto
        vQtde := 0;
        vTotalVenda := 0;
        vflagop := 0;
        for i := 1 to 99 do
        begin
          if QrVendS.FieldByName('OPERADOR').AsInteger = vterm[i] then
          begin
            vflagop := 1;
            break;
          end;
        end;
        if vflagop = 1 then
        begin
          vQtde := vQtde + QrVendS.FieldByName('SOMA').AsCurrency;
          vTotalVenda := vTotalVenda + QrVendS.FieldByName('SOMA1').AsCurrency;
        end;
        vCodSubGrupo := qrVendS.FieldByName('CODIGO_SUBGR').AsInteger;
        rdVS.Imp(linha, 1, vDadosIni.StrZero(qrVendS.FieldByName('CODIGO_SUBGR').AsInteger, 3) + ' '
          +
          QrVendS.FieldByName('DESCRICAO').AsString);
      end;
      QrVendS.next;
      progress.position := progress.position + 1;
      if QrVendS.Eof then
      begin
        rdVS.Imp(linha, 52, vDadosIni.AlnDir(Format('%8.2f', [vQtde]), 8));
        if vtotvg <> 0 then
          rdVS.Imp(linha, 66, vDadosIni.AlnDir(format('%n', [((((vTotalVenda * 100) / vtotvg) *
              vlDescOperador) / 100)]),
            12));
        rdVS.Imp(linha, 94, vDadosIni.AlnDir(format('%n', [vTotalVenda - ((((vTotalVenda * 100) /
            vtotvg) * vlDescOperador) /
            100)]), 12));
        if vtotvg <> 0 then
          rdVS.Imp(linha, 108, vDadosIni.AlnDir(Format('%6.2f', [((vTotalVenda * 100) / vtotvg)]),
            6));
        rdVS.Imp(linha, 116, vDadosIni.StrZero(QrMaxS.FieldByName('HORAFECHAMENTO').AsInteger, 2));
        rdVS.Imp(linha, 120, DiaSemana[DayOfWeek(QrMaxS.FieldByName('DATA_fech').AsDateTime)]);
        linha := linha + 1;
      end;
    end;
    RdVS.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp20]);
    linha := linha + 1;
    RdVS.Imp(linha, 1, 'TOTAL :');
    RdVS.Imp(linha, 52, vDadosIni.alndir(Format('%8.2f', [vqtdg]), 8));
    RdVS.Imp(linha, 94, vDadosIni.alndir(Format('%n', [vtotvg - vlDescOperador]), 12));
  finally
    rdVS.Fechar;
  end;
end;

function TTerminaisF.gerarProdutividadeVendasOperadorOLAP(dataInicial,
  dataFinal: string; cube: THierCube): boolean;
var
  qrOlap: TIBQuery;
begin
  qrOlap := TIBQuery(dtmTerminaisF.qrOlap);
  qrOlap.Close;
  qrOlap.SQL.Text := 'select' +
    ' co.cod_vendedor,' +
    ' co.nome_vendedor,' +
    ' pv.horaabertura,' +
    ' pv.horafechamento,' +
    ' pv.minabertura,' +
    ' pv.minfechamento,' +
    ' pp.grupo_prod,' +
    ' pp.cod_prod,' +
    ' p.descr_prod,' +
    ' g.descricao nomegrupo,' +
    ' sg.descricao nomesubgrupo,' +
    ' pv.nped,' +
    ' pv.ncupom,' +
    ' pv.operador,' +
    ' case extract(weekday from pv.data_fech)' +
    '     when 0 then ''Domingo''' +
    '     when 1 then ''Segunda-feira''' +
    '     when 2 then ''Terça-feira''' +
    '     when 3 then ''Quarta-feira''' +
    '     when 4 then ''Quinta-feira''' +
    '     when 5 then ''Sexta-feira''' +
    '     when 6 then ''Sábado''' +
    ' end diasemana,' +
    ' sum(pp.vltot_ped_item) vendaBruta,' +
    ' (sum(pp.rateio_desc) + sum(pp.desc_item) ) desconto,' +
    ' (sum(pp.rateio_acresc) + sum(pp.acresc_item) ) acrescimo,' +
    ' (sum(pp.vltot_ped_item) - (sum(pp.rateio_desc) + sum(pp.desc_item)) + (sum(pp.rateio_acresc) + sum(pp.acresc_item) ) ) vendaliquida,' +
    ' count(pp.nitem) qtdeitensdavenda,' +
    ' sum(pp.quant_ped_item) qtdeprodutosvendidos' +
    ' from pedvenda pv' +
    ' inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empresa = pv.cod_empresa' +
    ' inner join colaborador co on co.cod_vendedor = pv.cod_vendedor and co.cod_empresa = pv.cod_empresa' +
    ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa' +
    ' inner join grupos g on g.codigo_grup = p.grupo_prod' +
    ' left join sub_grupo sg on sg.codigo_subgr = p.sub_g_prod' +
    ' where pv.data_fech >= :data1' +
    ' and pv.data_fech <= :data2' +
    ' and pv.cod_empresa = :cod_empresa' +
    ' and pv.operador in (' + vtermsql + ')' +
    ' and pv.ativo = 1' +
    ' and not pv.ncupom is null' +
    ' and not pv.minabertura is null' +
    ' and not pv.minfechamento is null' +
    ' and not pv.horaabertura is null' +
    ' and not pv.horafechamento is null' +
    ' and pp.status is null' +
    ' group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15';
  qrOlap.ParamByName('data1').AsDate := StrToDate(dataInicial);
  qrOlap.ParamByName('data2').AsDate := StrToDate(dataFinal);
  qrOlap.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  //  qrOlap.Params[3].AsString:=vtermsql;
  //  dataSet.FieldByName('cod_terminal').AsInteger;
  qrOlap.Open;

  cube.DataSet := qrOlap;
  cube.Active := False;
  cube.BuildDimensionMap;
  cube.DefineFieldAsDimension('cod_vendedor', 'Cod. Operador', dgpage);
  cube.DefineFieldAsDimension('Operador', 'Terminal', dgRow);
  cube.DefineFieldAsDimension('nome_vendedor', 'Operador', dgRow);
  cube.DefineFieldAsDimension('horaabertura', 'Hr Abert', dgpage);
  cube.DefineFieldAsDimension('horafechamento', 'Hr Fech', dgpage);
  cube.DefineFieldAsDimension('minabertura', 'Min Abert', dgpage);
  cube.DefineFieldAsDimension('minfechamento', 'Min Fech', dgpage);
  cube.DefineFieldAsDimension('grupo_prod', 'Cod Grupo', dgpage);
  cube.DefineFieldAsDimension('cod_prod', 'Cod Produto', dgpage);
  cube.DefineFieldAsDimension('descr_prod', 'Descrição Produto', dgpage);
  cube.DefineFieldAsDimension('nomegrupo', 'Grupo', dgpage);
  cube.DefineFieldAsDimension('nomesubgrupo', 'Sub Grupo', dgpage);
  cube.DefineFieldAsDimension('diasemana', 'Dia Semana', dgpage);
  cube.DefineFieldAsDimension('nped', 'N.Pedido', dgpage);
  cube.DefineFieldAsDimension('ncupom', 'N.Cupom', dgpage);
  cube.DefineFieldAsSummary('vendaBruta');
  cube.DefineFieldAsSummary('desconto');
  cube.DefineFieldAsSummary('acrescimo');
  cube.DefineFieldAsSummary('vendaliquida');
  cube.DefineFieldAsSummary('qtdeitensdavenda');
  cube.DefineFieldAsSummary('qtdeprodutosvendidos');
  //  cube.DefineFieldAsSummary('minutosparafechar');
  cube.Active := true;
  //  cube.DefineFieldAsDimension('vendaBruta','Venda Bruta');
  //  cube.DefineFieldAsDimension('desconto','Desconto');
  //  cube.DefineFieldAsDimension('acrescimo','Acrescimo');
  //  cube.DefineFieldAsDimension('vendaliquida','Venda Líquida');
  //  cube.DefineFieldAsDimension('qtdeitensdavenda','Qtde Itens da Venda');
  //  cube.DefineFieldAsDimension('qtdeprodutosvendidos','Qtde Prod Vendidas');
  //  cube.DefineFieldAsDimension('minutosparafechar','Min p Fechar');
end;

function TTerminaisF.getDadosImpressora: boolean;
begin
  vDadosIni.vNumSerieEcf :=
    retornaValor('select ci.num_serie_ecf as valor from confimp ci where ci.cod_terminal = ' +
    dataSet.FieldByName('cod_terminal').AsString);
  vDadosIni.vCodTerminal := dataSet.FieldByName('cod_terminal').AsString;
  Result := trim(vDadosIni.vNumSerieEcf) <> '';
end;

procedure TTerminaisF.setDataBaseAlteracaoArquivoHwF(pVenderecoOr: string);
var
  vTemp: string;
  vTabHwFdb: TIBQuery;
  vBancoTemp: string;
begin
  try

    vTemp := pVenderecoOr;
    if Pos(':', vTemp) > 0 then
      vTemp := copy(vTemp, Pos(':', vTemp) + 1, Length(vTemp));

    if Pos(':', vTemp) = 0 then
      pVenderecoOr := Pchar('127.0.0.1:' + pVenderecoOr);

    if Pos(UpperCase('HWF.FDB'), UpperCase(pVenderecoOr)) > 0 then
      vBancoTemp := StringReplace(pVenderecoOr, '\\', '\', [rfReplaceAll])
    else
      vBancoTemp := StringReplace(pVenderecoOr + '\Hwf.fdb', '\\', '\', [rfReplaceAll]);

    vSincDataBase := vDadosIni.getDataBanco(buscas);

    if vDadosIni.conectaBanco(dtmTerminaisF.DtbHwFFDB, vBancoTemp, true) then
    begin
      vTabHwFdb := TIBQuery(dtmTerminaisF.IbapagarHwfdb);
      vTabHwFdb.Close;
      vTabHwFdb.SQL.Text := 'update EMPDESVOLV set DATA_BASE_ALT = :DATA_BASE_ALT where COD_EMPDES = 1';
      vTabHwFdb.ParamByName('DATA_BASE_ALT').AsDate := vSincDataBase;
      try
        vTabHwFdb.ExecSQL;
      except
      end;
    end
    else
      Application.MessageBox('Não foi possivel conectar ao HwF.fdb informado', 'Atenção', 0 + 64);
  finally
    vDadosIni.desconectaBanco(dtmTerminaisF.DtbHwFFDB);
  end;
end;

procedure TTerminaisF.sincronizacaoParaSintegra;
begin
  try
    Application.CreateForm(TfrmSelTerminalF, frmSelTerminalF);
    frmSelTerminalF.MaskEdit1.text := DateToStr(vdtini);
    frmSelTerminalF.MaskEdit2.text := DateToStr(vdtfim);
    if frmSelTerminalF.ShowModal = IDOK then
    begin
      try
        vdtini := StrToDate(frmSelTerminalF.MaskEdit1.text);
        vdtfim := StrToDate(frmSelTerminalF.MaskEdit2.text);
      except
        application.messagebox('Datas inválidas ou não preenchidas', 'Informação',
          MB_ICONINFORMATION + MB_OK);
        exit;
      end;
      frmSelTerminalF.BitBtn1.Enabled := false;
      frmSelTerminalF.DBGrid1.Enabled := false;
      frmSelTerminalF.MaskEdit1.Enabled := false;
      frmSelTerminalF.MaskEdit2.Enabled := false;
      frmSelTerminalF.ProgressBar1.Visible := true;
      frmSelTerminalF.Show;
      frmSelTerminalF.Refresh;
      Sleep(500);
      frmSelTerminalF.Refresh;
      First;
      while not dataSet.eof do
      begin
        //        if frmSelTerminalF.DBGrid1.SelectedRows.CurrentRowSelected then
        if vDadosIni.conectaBanco(dtmAtivo.bancoFiscal,
          dataSet.FieldByName('END_TERMINAL').AsString, true) then
          sincterminal(2, frmSelTerminalF.ProgressBar1, frmSelTerminalF.label4, '');
        next;
      end;
    end;
  finally
    frmSelTerminalF.Free;
    frmSelTerminalF := nil;
  end;
end;

function TTerminaisF.sincterminal(vtipo: integer; vprogrbar: TprogressBar; vlabel: Tlabel;
  vtabelas: string {Formato: TODOS ou CUPOM|CUPOM2|ALIQ|ETC...}): boolean;
var
  i, itx: integer;
  vcp, vordem, vnitem: integer;
  vnserie: string;
  temp: string;
begin
  Result := true;
  vparar := 0;
  if vtipo = 1 then // Tipo = 1: para os terminais, 2: dos terminais para o Retaguarda
  begin
    vlabel.Caption := 'Imp. CNIEE->Terminal ' +
      dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
      dataSet.FieldByName('NOME_TERMINAL').AsString;
    try
      Transsinc.StartTransaction;
      CadImpressoraTerm.cadIMPCNIEE.abreImpressorasCNIEE;
      vprogrbar.Position := 0;
      vprogrbar.Min := 0;
      vprogrbar.Max := CadImpressoraTerm.cadIMPCNIEE.dataSet.RecordCount;
      while not CadImpressoraTerm.cadIMPCNIEE.Eof do
      begin
        Application.ProcessMessages;
        with dtmTerminaisF do
        begin
          CdsBuscaTerminal.Close;
          CdsBuscaTerminal.CommandText := 'SELECT * FROM IMPRESSORAS_CNIEE WHERE IDENTIFICACAO = '''
            +
            CadImpressoraTerm.cadIMPCNIEE.dataSet.FieldByName('IDENTIFICACAO').asstring + '''';
          CdsBuscaTerminal.open;
          if CdsBuscaTerminal.IsEmpty then
            CdsBuscaTerminal.Insert
          else
            CdsBuscaTerminal.Edit;
          for I := 0 to CadImpressoraTerm.cadIMPCNIEE.dataSet.FieldCount - 1 do
          begin
            CdsBuscaTerminal.FieldByName(
              CadImpressoraTerm.cadIMPCNIEE.dataSet.Fields[I].FieldName).Value :=
              CadImpressoraTerm.cadIMPCNIEE.dataSet.FieldByName(
              CadImpressoraTerm.cadIMPCNIEE.dataSet.Fields[I].FieldName).Value;
          end;
          CdsBuscaTerminal.Post;
          dtmTerminaisF.CdsBuscaTerminal.ApplyUpdates(-1);
        end;
        vprogrbar.Position := vprogrbar.Position + 1;
        CadImpressoraTerm.cadIMPCNIEE.Next;
        if vparar = 1 then
        begin
          if parar_servico then
            break;
        end;
      end;
      Transsinc.Commit;
    except
      on e: exception do
      begin
        Transsinc.Rollback;
        result := false;
        MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
        registraErro('EF0001 ' + e.Message);
      end;
    end;
    // Empresa Desenvolvedora
    if vparar = 0 then
    begin
      vlabel.Caption := 'Empresa Desenvolvedora->Terminal ' +
        dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
        dataSet.FieldByName('NOME_TERMINAL').AsString;
      try
        Transsinc.StartTransaction;
        SoftFiscal.CadEmpDes.abreEmpDes;
        vprogrbar.Position := 0;
        vprogrbar.Min := 0;
        vprogrbar.Max := SoftFiscal.CadEmpDes.dataSet.RecordCount;
        while not SoftFiscal.CadEmpDes.dataSet.Eof do
        begin
          Application.ProcessMessages;
          with dtmTerminaisF do
          begin
            CdsBuscaTerminal.Close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM EMPDESVOLV WHERE COD_EMPDES = ' +
              SoftFiscal.CadEmpDes.dataSet.FieldByName('COD_EMPDES').asstring;
            CdsBuscaTerminal.open;
            if CdsBuscaTerminal.IsEmpty then
              CdsBuscaTerminal.Insert
            else
              CdsBuscaTerminal.Edit;
            for I := 0 to SoftFiscal.CadEmpDes.dataSet.FieldCount - 1 do
            begin
              CdsBuscaTerminal.FieldByName(
                SoftFiscal.CadEmpDes.dataSet.Fields[I].FieldName).Value :=
                SoftFiscal.CadEmpDes.dataSet.FieldByName(
                SoftFiscal.CadEmpDes.dataSet.Fields[I].FieldName).Value;
            end;
            CdsBuscaTerminal.Post;
            CdsBuscaTerminal.ApplyUpdates(-1);
          end;
          vprogrbar.Position := vprogrbar.Position + 1;
          SoftFiscal.CadEmpDes.Next;
          if vparar = 1 then
          begin
            if parar_servico then
              break;
          end;
        end;
        Transsinc.Commit;
      except
        on e: exception do
        begin
          Transsinc.Rollback;
          result := false;
          MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
          registraErro('EF0001 ' + e.Message);
        end;
      end;
    end;
    // Softwares Fiscais...
    if vparar = 0 then
    begin
      vlabel.Caption := 'Softwares Fiscais->Terminal ' +
        dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
        dataSet.FieldByName('NOME_TERMINAL').AsString;
      try
        Transsinc.StartTransaction;
        SoftFiscal.abreSofFiscal;
        vprogrbar.Position := 0;
        vprogrbar.Min := 0;
        vprogrbar.Max := SoftFiscal.dataSet.RecordCount;
        while not SoftFiscal.Eof do
        begin
          Application.ProcessMessages;
          with dtmTerminaisF do
          begin
            CdsBuscaTerminal.Close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM FISCAL_VERSOES WHERE COD_FISCAL = ' +
              SoftFiscal.dataSet.FieldByName('COD_FISCAL').asstring;
            CdsBuscaTerminal.open;
            if CdsBuscaTerminal.IsEmpty then
              CdsBuscaTerminal.Insert
            else
              CdsBuscaTerminal.Edit;
            for I := 0 to SoftFiscal.dataSet.FieldCount - 1 do
            begin
              if SoftFiscal.dataSet.Fields[I].FieldName <> 'NOMEAPRES' then
              begin
                CdsBuscaTerminal.FieldByName(
                  SoftFiscal.dataSet.Fields[I].FieldName).Value :=
                  SoftFiscal.dataSet.FieldByName(
                  SoftFiscal.dataSet.Fields[I].FieldName).Value;
              end;
            end;
            CdsBuscaTerminal.Post;
            CdsBuscaTerminal.ApplyUpdates(-1);
          end;
          vprogrbar.Position := vprogrbar.Position + 1;
          SoftFiscal.Next;
          if vparar = 1 then
          begin
            if parar_servico then
              break;
          end;
        end;
        Transsinc.Commit;
      except
        on e: exception do
        begin
          Transsinc.Rollback;
          result := false;
          MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
          registraErro('EF0001 ' + e.Message);
        end;
      end;
      if Result then
      begin
        vlabel.Caption := 'Arquivos Utilizados Pelo Fiscal->Terminal ' +
          dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
          dataSet.FieldByName('NOME_TERMINAL').AsString;
        try
          Transsinc.StartTransaction;
          SoftFiscal.cadArquivosFiscal.AbreArqGeral;
          vprogrbar.Position := 0;
          vprogrbar.Min := 0;
          vprogrbar.Max := SoftFiscal.cadArquivosFiscal.dataSet.RecordCount;
          while not SoftFiscal.cadArquivosFiscal.dataSet.Eof do
          begin
            Application.ProcessMessages;
            with dtmTerminaisF do
            begin
              CdsBuscaTerminal.Close;
              CdsBuscaTerminal.CommandText := 'SELECT * FROM ARQUIVOS_FISCAL WHERE COD_ARQUIVO = ' +
                SoftFiscal.cadArquivosFiscal.dataSet.FieldByName('COD_ARQUIVO').asstring;
              CdsBuscaTerminal.open;
              if CdsBuscaTerminal.IsEmpty then
                CdsBuscaTerminal.Insert
              else
                CdsBuscaTerminal.Edit;
              for I := 0 to SoftFiscal.cadArquivosFiscal.dataSet.FieldCount - 1 do
              begin
                CdsBuscaTerminal.FieldByName(
                  SoftFiscal.cadArquivosFiscal.dataSet.Fields[I].FieldName).Value :=
                  SoftFiscal.cadArquivosFiscal.dataSet.FieldByName(
                  SoftFiscal.cadArquivosFiscal.dataSet.Fields[I].FieldName).Value;
              end;
              CdsBuscaTerminal.Post;
              CdsBuscaTerminal.ApplyUpdates(-1);
            end;
            vprogrbar.Position := vprogrbar.Position + 1;
            SoftFiscal.cadArquivosFiscal.Next;
            if vparar = 1 then
            begin
              if parar_servico then
                break;
            end;
          end;
          Transsinc.Commit;
        except
          on e: exception do
          begin
            Transsinc.Rollback;
            result := false;
            MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
            registraErro('EF0001 ' + e.Message);
          end;
        end;
      end;

    end;
    // TerminalF e impressoras Terminais
    if vparar = 0 then
    begin
      vlabel.Caption := 'TerminalF->Terminal ' +
        dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
        dataSet.FieldByName('NOME_TERMINAL').AsString;
      try
        Transsinc.StartTransaction;
        vprogrbar.Position := 0;
        vprogrbar.Min := 0;
        //        vprogrbar.Max:=dataSet.RecordCount;
        //        while not dataSet.Eof do
        //        begin
        with dtmTerminaisF do
        begin
          CdsBuscaTerminal.Close;
          CdsBuscaTerminal.CommandText := 'SELECT * FROM TERMINALF WHERE COD_TERMINAL = ' +
            dataSet.FieldByName('COD_TERMINAL').asstring + ' AND COD_EMPRESA = ' +
            dataSet.FieldByName('COD_EMPRESA').asstring;
          CdsBuscaTerminal.open;
          if CdsBuscaTerminal.IsEmpty then
            CdsBuscaTerminal.Insert
          else
            CdsBuscaTerminal.Edit;
          for I := 0 to dataSet.FieldCount - 1 do
          begin

            CdsBuscaTerminal.FieldByName(
              dataSet.Fields[I].FieldName).Value :=
              dataSet.FieldByName(
              dataSet.Fields[I].FieldName).Value;
          end;
          CdsBuscaTerminal.Post;
          CdsBuscaTerminal.ApplyUpdates(-1);
        end;
        //          vprogrbar.Position:=vprogrbar.Position+1;
        //          CadImpressoraTerm.cadIMPCNIEE.Next;
        //        end;
        vDadosIni.vCodTerminal := dataSet.FieldByName('COD_TERMINAL').AsString;
        CadImpressoraTerm.abreImpressorasTerm;
        while not CadImpressoraTerm.Eof do
        begin
          Application.ProcessMessages;
          with dtmTerminaisF do
          begin
            CdsBuscaTerminal.Close;
            CdsBuscaTerminal.CommandText :=
              'SELECT * FROM TERMINAL_IMPRESSORAS WHERE COD_TERMINAL = ' +
              CadImpressoraTerm.dataSet.FieldByName('COD_TERMINAL').asstring + ' AND COD_EMPRESA = '
              + CadImpressoraTerm.dataSet.FieldByName('COD_EMPRESA').asstring +
              //              ' AND IDENT_CNIEE = ''' + CadImpressoraTerm.dataSet.FieldByName('IDENT_CNIEE').asstring
//              +
            ' AND NUM_SERIE_ECF = ''' +
              vDadosIni.codifica(CadImpressoraTerm.dataSet.FieldByName('NUM_SERIE_ECF').asstring) +
              '''';
            CdsBuscaTerminal.open;
            if CdsBuscaTerminal.IsEmpty then
              CdsBuscaTerminal.Insert
            else
              CdsBuscaTerminal.Edit;
            for I := 0 to CadImpressoraTerm.dataSet.FieldCount - 1 do
            begin
              CdsBuscaTerminal.FieldByName(
                CadImpressoraTerm.dataSet.Fields[I].FieldName).Value :=
                CadImpressoraTerm.dataSet.FieldByName(
                CadImpressoraTerm.dataSet.Fields[I].FieldName).Value;
              if CadImpressoraTerm.dataSet.Fields[I].FieldName = 'NUM_SERIE_ECF' then
                CdsBuscaTerminal.FieldByName(
                  CadImpressoraTerm.dataSet.Fields[I].FieldName).Value :=
                  vDadosIni.codifica(CadImpressoraTerm.dataSet.FieldByName(
                  CadImpressoraTerm.dataSet.Fields[I].FieldName).Value);
            end;
            CdsBuscaTerminal.Post;
            CdsBuscaTerminal.ApplyUpdates(-1);
          end;
          vprogrbar.Position := vprogrbar.Position + 1;
          CadImpressoraTerm.Next;
          if vparar = 1 then
          begin
            if parar_servico then
              break;
          end;
        end;
        Transsinc.Commit;
      except
        on e: exception do
        begin
          Transsinc.Rollback;
          result := false;
          MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
          registraErro('EF0001 ' + e.Message);
        end;
      end;
    end;
    if vparar <> 0 then
      application.messagebox('Sincronização Retaguarda -> Terminal foi Cancelada com Sucesso',
        'Informação', MB_ICONINFORMATION + MB_OK)
    else if vDadosIni.vInibeMensPesqPros <> 'S' then
      application.messagebox('Sincronização Retaguarda -> Terminal foi executado com Sucesso',
        'Informação', MB_ICONINFORMATION + MB_OK);
  end
  else
  begin
    with dtmTerminaisF do
    begin
      for itx := 1 to 10 do
      begin
        if itx = 1 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Aliq';
        if itx = 2 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Cupom';
        if itx = 3 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Cupom2';
        if itx = 4 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Doc. Não Fiscal';
        if itx = 5 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Finalizadores';
        if itx = 6 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Resumo Diário';
        if itx = 7 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Detalhes Mapa Resumo';
        if itx = 8 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Sangria/Suprimento';
        if itx = 9 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Formas pagamento Cupom';
        if itx = 10 then
          vlabel.Caption := 'Terminal ' +
            dataSet.FieldByName('COD_TERMINAL').AsString + ' ' +
            dataSet.FieldByName('NOME_TERMINAL').AsString + '->Retaguarda: Conf. Imp';
        IniciaTransacao;
        try
          if itx = 1 then
          begin
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM ALIQ WHERE COD_EMPRESA = ' +
              vDadosIni.codEmpresa +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;
          if itx = 2 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM CUPOM WHERE DATA >= ''' +
              FormatDateTime('mm/dd/yyyy', vdtini) + ''' AND DATA <= ''' +
              FormatDateTime('mm/dd/yyyy', vdtfim) + ''' AND COD_EMPRESA = ' + vDadosIni.codEmpresa
              +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;
          if itx = 3 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT IT.* FROM CUPOM CP,CUPOM2 IT WHERE CP.DATA >= '''
              +
              FormatDateTime('mm/dd/yyyy', vdtini) + ''' AND CP.DATA <= ''' +
              FormatDateTime('mm/dd/yyyy', vdtfim) + ''' AND CP.COD_EMPRESA = ' +
              vDadosIni.codEmpresa +
              ' AND CP.COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString +
              ' AND CP.REGISTRO = IT.ORDEM AND CP.CUPOM = IT.CUPOM AND CP.COD_TERMINAL = IT.COD_TERMINAL ' +
              'AND CP.NSERIEECF = IT.NSERIEECF AND CP.COD_EMPRESA = IT.COD_EMPRESA ';
            CdsBuscaTerminal.Open;
          end;
          if itx = 4 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM DOC_NAOFISCAL_TERMINAL ' +
              'WHERE DATA_F_EMISSAO >= ''' +
              FormatDateTime('mm/dd/yyyy', vdtini) + ''' AND DATA_F_EMISSAO <= ''' +
              FormatDateTime('mm/dd/yyyy', vdtfim) + ''' AND COD_EMPRESA = ' + vDadosIni.codEmpresa
              +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;
          if itx = 5 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM FINALIZADORES ' +
              'WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;
          if itx = 6 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM RESUMOD ' +
              'WHERE DATA_MOV >= ''' +
              FormatDateTime('mm/dd/yyyy', vdtini) + ''' AND DATA_MOV <= ''' +
              FormatDateTime('mm/dd/yyyy', vdtfim) + ''' AND COD_EMPRESA = ' + vDadosIni.codEmpresa
              +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;
          if itx = 7 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT AL.* FROM MAPA_RESUMO_ALIQ AL,RESUMOD R ' +
              'WHERE R.DATA_MOV >= ''' +
              FormatDateTime('mm/dd/yyyy', vdtini) + ''' AND R.DATA_MOV <= ''' +
              FormatDateTime('mm/dd/yyyy', vdtfim) + ''' AND R.COD_EMPRESA = ' + vDadosIni.codEmpresa
              +
              ' AND R.COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString +
              ' AND R.COD_TERMINAL = AL.COD_TERMINAL AND R.COORED = AL.COORED AND ' +
              'R.COD_EMPRESA = AL.COD_EMPRESA';
            CdsBuscaTerminal.Open;
          end;
          if itx = 8 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM SANGSUP ' +
              'WHERE DATALANC >= ''' +
              FormatDateTime('mm/dd/yyyy', vdtini) + ''' AND DATALANC <= ''' +
              FormatDateTime('mm/dd/yyyy', vdtfim) + ''' AND COD_EMPRESA = ' + vDadosIni.codEmpresa
              +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;
          if itx = 9 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM FINCUPOM WHERE DATA >= ''' +
              FormatDateTime('mm/dd/yyyy', vdtini) + ''' AND DATA <= ''' +
              FormatDateTime('mm/dd/yyyy', vdtfim) + ''' AND COD_EMPRESA = ' + vDadosIni.codEmpresa
              +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;
          if itx = 10 then
          begin
            // Fazer o select de cupom
            CdsBuscaTerminal.close;
            CdsBuscaTerminal.CommandText := 'SELECT * FROM CONFIMP WHERE COD_EMPRESA = ' +
              vDadosIni.codEmpresa
              +
              ' AND COD_TERMINAL = ' + dataSet.FieldByName('COD_TERMINAL').AsString;
            CdsBuscaTerminal.Open;
          end;

          vprogrbar.Min := 0;
          vprogrbar.Position := 0;
          vprogrbar.Max := CdsBuscaTerminal.RecordCount;
          CdsBuscaTerminal.First;
          while not CdsBuscaTerminal.eof do
          begin
            Application.ProcessMessages;
            if itx = 1 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM ALIQ WHERE SEQUENCIA = ''' +
                CdsBuscaTerminal.FieldByName('SEQUENCIA').AsString + ''' AND ALIQ = ' +
                vDadosIni.trocaVirgulaPorPonto(CdsBuscaTerminal.FieldByName('ALIQ').AsString) +
                ' AND COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString + ' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                ''' AND COD_EMPRESA = ' +
                CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString;
              CdsTerminalRet.Open;
            end;
            if itx = 2 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM CUPOM WHERE CUPOM = ' +
                CdsBuscaTerminal.FieldByName('CUPOM').AsString + ' AND COLABORADOR = ' +
                CdsBuscaTerminal.FieldByName('COLABORADOR').AsString + ' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                ''' AND COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString + ' AND REGISTRO = ' +
                CdsBuscaTerminal.FieldByName('REGISTRO').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString;
              CdsTerminalRet.Open;
            end;
            if itx = 3 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM CUPOM2 WHERE CUPOM = ' +
                CdsBuscaTerminal.FieldByName('CUPOM').AsString + ' AND ORDEM = ' +
                CdsBuscaTerminal.FieldByName('ORDEM').AsString + ' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                ''' AND COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString + ' AND NITEM = ' +
                CdsBuscaTerminal.FieldByName('NITEM').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString;
              CdsTerminalRet.Open;
            end;
            if itx = 4 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM DOC_NAOFISCAL_TERMINAL ' +
                ' WHERE COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' AND COO_ECF = ' + CdsBuscaTerminal.FieldByName('COO_ECF').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString +
                ' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                '''';
              CdsTerminalRet.Open;
            end;
            if itx = 5 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM FINALIZADORES ' +
                ' WHERE COD_FINALIZADOR = ' +
                CdsBuscaTerminal.FieldByName('COD_FINALIZADOR').AsString +
                ' AND COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString;
              CdsTerminalRet.Open;
            end;
            if itx = 6 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM RESUMOD ' +
                ' WHERE COORED = ' + CdsBuscaTerminal.FieldByName('COORED').AsString +
                ' AND  COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString +
                ' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                '''';
              CdsTerminalRet.Open;
            end;
            if itx = 7 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM MAPA_RESUMO_ALIQ ' +
                ' WHERE COORED = ' + CdsBuscaTerminal.FieldByName('COORED').AsString +
                ' AND  COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString +
                ' AND ALIQ_SEQ = ''' + CdsBuscaTerminal.FieldByName('ALIQ_SEQ').AsString +
                ''' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                '''';
              CdsTerminalRet.Open;
            end;
            if itx = 8 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM SANGSUP ' +
                ' WHERE NREG = ' + CdsBuscaTerminal.FieldByName('NREG').AsString +
                ' AND  COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString +
                ' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                '''';
              CdsTerminalRet.Open;
            end;
            if itx = 9 then
            begin
              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM FINCUPOM ' +
                ' WHERE ORDEM = ' + CdsBuscaTerminal.FieldByName('ORDEM').AsString +
                ' AND CUPOM = ' + CdsBuscaTerminal.FieldByName('CUPOM').AsString +
                ' AND REGISTRO = ' + CdsBuscaTerminal.FieldByName('REGISTRO').AsString +
                ' AND  COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString +
                ' AND NSERIEECF = ''' +
                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString) +
                '''';
              CdsTerminalRet.Open;
            end;
            if itx = 10 then
            begin
              temp := retornaValor('select t.num_serie_ecf valor from terminal_impressoras t where'
                +
                ' t.cod_terminal = ' + CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' and t.atual = ''S''');

              CdsTerminalRet.Close;
              CdsTerminalRet.CommandText := 'SELECT * FROM CONFIMP ' +
                //                ' WHERE NUM_SERIE_ECF = ''' +
//                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NUM_SERIE_ECF').AsString) +
              ' where COD_TERMINAL = ' +
                CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsString +
                ' AND NUM_SERIE_ECF = ' + QuotedStr(temp) +
                ' AND COD_EMPRESA = ' + CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsString;
              CdsTerminalRet.Open;
            end;

            if CdsTerminalRet.IsEmpty then
              CdsTerminalRet.Insert
            else
              CdsTerminalRet.Edit;
            for I := 0 to CdsBuscaTerminal.FieldCount - 1 do
            begin
              if (CdsBuscaTerminal.Fields[i].FieldName = 'NSERIEECF') then
                CdsTerminalRet.FieldByName(
                  CdsBuscaTerminal.Fields[I].FieldName).Value :=
                  vDadosIni.decodifica(CdsBuscaTerminal.FieldByName(
                  CdsBuscaTerminal.Fields[I].FieldName).Value)
              else
                if (CdsBuscaTerminal.Fields[I].FieldName <> 'ENVIADO_RET') and
                  (CdsTerminalRet.FindField(CdsBuscaTerminal.Fields[I].FieldName) <> nil) then
                  CdsTerminalRet.FieldByName(
                    CdsBuscaTerminal.Fields[I].FieldName).Value :=
                    CdsBuscaTerminal.FieldByName(
                    CdsBuscaTerminal.Fields[I].FieldName).Value;
            end;
            if itx = 10 then
            begin
              CdsTerminalRet.FieldByName('NUM_SERIE_ECF').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('NUM_SERIE_ECF').AsString);
              CdsTerminalRet.FieldByName('MODELO_IMPRESSORA').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('MODELO_IMPRESSORA').AsString);
              CdsTerminalRet.FieldByName('NUM_EQUIP').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('NUM_EQUIP').AsString);
              CdsTerminalRet.FieldByName('OBSERVACAO_CUPOM').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('OBSERVACAO_CUPOM').AsString);
              CdsTerminalRet.FieldByName('MODELO_BALANCA').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('MODELO_BALANCA').AsString);
              CdsTerminalRet.FieldByName('MODELO_DOCF').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('MODELO_DOCF').AsString);
              CdsTerminalRet.FieldByName('ARREDONDAR_TRUNCAR').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('ARREDONDAR_TRUNCAR').AsString);
              CdsTerminalRet.FieldByName('TECLADO_PDV').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('TECLADO_PDV').AsString);
              CdsTerminalRet.FieldByName('USAR_TEF').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('USAR_TEF').AsString);
              CdsTerminalRet.FieldByName('LEITURA_SUP').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('LEITURA_SUP').AsString);
              CdsTerminalRet.FieldByName('VALOR_UNIT_3DIG').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('VALOR_UNIT_3DIG').AsString);
              CdsTerminalRet.FieldByName('LEITURA_MEM_FISCAL').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('LEITURA_MEM_FISCAL').AsString);
              CdsTerminalRet.FieldByName('ABRIR_GAVETA').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('ABRIR_GAVETA').AsString);
              CdsTerminalRet.FieldByName('USAR_CODBARRA').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('USAR_CODBARRA').AsString);
              CdsTerminalRet.FieldByName('CONFERIR_ESTOQUE').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('CONFERIR_ESTOQUE').AsString);
              CdsTerminalRet.FieldByName('LEITOR_SERIAL').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('LEITOR_SERIAL').AsString);
              CdsTerminalRet.FieldByName('VERIFICAR_PAPEL').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('VERIFICAR_PAPEL').AsString);
              CdsTerminalRet.FieldByName('USPOLPREC').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('USPOLPREC').AsString);
              CdsTerminalRet.FieldByName('ENDERECO_HWF').AsString :=
                vDadosIni.decodifica(CdsTerminalRet.FieldByName('ENDERECO_HWF').AsString);
            end;
            CdsTerminalRet.Post;
            CdsTerminalRet.ApplyUpdates(-1);
            CdsBuscaTerminal.Next;
            vprogrbar.Position := vprogrbar.Position + 1;

            if (vprogrbar.Position mod 50) = 0 then
              CommitaTransacao;

            if vparar = 1 then
            begin
              if parar_servico then
                break;
            end;
          end;
          CommitaTransacao;
          CdsBuscaTerminal.First;
          while not CdsBuscaTerminal.Eof do
          begin
            if itx = 2 then
            begin
              buscas.Close;
              buscas.SQL.Text :=
                'select cp.nserieecf, imp.mf_adicional, cniee.modelo_ecf, imp.cod_proprietario,' +
                ' cp.ccf, cp.cupom, cp.data, cp.total subtotal, cp.valor_desc, ''V'' ind_tp_desc,' +
                ' cp.valor_acres, ''V'' ind_tp_acresc, cp.valorcupom, cp.status_cp, 0 cance_acres_subt,' +
                ' cp.acres_desc, cp.nome_cliente, cp.cpfcgc, cp.md5' +
                ' from cupom cp' +
                ' inner join terminal_impressoras imp on imp.cod_terminal = cp.cod_terminal and imp.num_serie_ecf = cp.nserieecf and imp.cod_empresa = cp.cod_empresa and imp.atual = ''S''' +
                ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
                ' where cp.COD_TERMINAL = :COD_TERMINAL and cp.NSERIEECF = :NSERIEECF and cp.COD_EMPRESA = :COD_EMPRESA and cp.REGISTRO = :REGISTRO and cp.CUPOM = :CUPOM';
              buscas.ParamByName('COD_TERMINAL').AsInteger := CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger;
              buscas.ParamByName('NSERIEECF').AsString := vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString);
              buscas.ParamByName('COD_EMPRESA').AsInteger := CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger;
              buscas.ParamByName('REGISTRO').AsInteger := CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger;
              buscas.ParamByName('CUPOM').AsInteger := CdsBuscaTerminal.FieldByName('CUPOM').AsInteger;
              buscas.Open;

              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  Trim(buscas.FieldByName('NSERIEECF').AsString) + '|' +
                  Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
                  Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('ccf').AsString) + '|' +
                  Trim(buscas.FieldByName('cupom').AsString) + '|' +
                  Trim(buscas.FieldByName('data').AsString) + '|' +
                  Trim(buscas.FieldByName('subtotal').AsString) + '|' +
                  Trim(buscas.FieldByName('valor_desc').AsString) + '|' +
                  Trim(buscas.FieldByName('ind_tp_desc').AsString) + '|' +
                  Trim(buscas.FieldByName('valor_acres').AsString) + '|' +
                  Trim(buscas.FieldByName('ind_tp_acresc').AsString) + '|' +
                  Trim(buscas.FieldByName('valorcupom').AsString) + '|' +
                  Trim(buscas.FieldByName('status_cp').AsString) + '|' +
                  Trim(buscas.FieldByName('cance_acres_subt').AsString) + '|' +
                  Trim(buscas.FieldByName('acres_desc').AsString) + '|' +
                  Trim(buscas.FieldByName('nome_cliente').AsString) + '|' +
                  Trim(buscas.FieldByName('cpfcgc').AsString) + '|',
                  'CUPOM',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' AND NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                  ' AND COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' AND REGISTRO = ' + IntToStr(CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger) +
                  ' AND CUPOM = ' + IntToStr(CdsBuscaTerminal.FieldByName('CUPOM').AsInteger)
                );
//              vMD5Func._gravaMD5_Cupom(buscas,
//                CdsBuscaTerminal.FieldByName('cupom').AsInteger,
//                CdsBuscaTerminal.FieldByName('cod_terminal').AsInteger,
//                CdsBuscaTerminal.FieldByName('registro').AsInteger,
//                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('nserieecf').AsString))
            end
            else if itx = 3 then
            begin
              buscas.Close;
              buscas.SQL.Text :=
                'select cp.nserieecf, imp.mf_adicional, cniee.modelo_ecf, imp.cod_proprietario,' +
                ' cp.ccf, cp.cupom, cp.nitem, cp.grupo_prod||cp.cod_prod codigo, cp.codbarra, cp.prod_serv, cp.descr_it,' +
                ' cp.quantidade, cp.unidade, cp.preco, cp.perc_desc, cp.perc_acresc, cp.total,' +
                ' cp.descaliq, cp.status_it, cp.iat, cp.ippt, cp.csdecqtde, cp.csdecvlunt, cp.md5' +
                ' from cupom2 cp' +
                ' inner join terminal_impressoras imp on imp.cod_terminal = cp.cod_terminal and imp.num_serie_ecf = cp.nserieecf and imp.cod_empresa = cp.cod_empresa and imp.atual = ''S''' +
                ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
                ' where cp.COD_TERMINAL = :COD_TERMINAL and cp.NSERIEECF = :NSERIEECF and cp.COD_EMPRESA = :COD_EMPRESA and cp.REGISTRO = :REGISTRO and cp.ORDEM = :ORDEM and cp.CUPOM = :CUPOM';
              buscas.ParamByName('COD_TERMINAL').AsInteger := CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger;
              buscas.ParamByName('NSERIEECF').AsString := vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString);
              buscas.ParamByName('COD_EMPRESA').AsInteger := CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger;
              buscas.ParamByName('REGISTRO').AsInteger := CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger;
              buscas.ParamByName('ORDEM').AsInteger := CdsBuscaTerminal.FieldByName('ORDEM').AsInteger;
              buscas.ParamByName('CUPOM').AsInteger := CdsBuscaTerminal.FieldByName('CUPOM').AsInteger;
              buscas.Open;

              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  Trim(buscas.FieldByName('NSERIEECF').AsString) + '|' +
                  Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
                  Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('cupom').AsString) + '|' +
                  Trim(buscas.FieldByName('ccf').AsString) + '|' +
                  Trim(buscas.FieldByName('nitem').AsString) + '|' +
                  Trim(buscas.FieldByName('codigo').AsString) + '|' +
                  Trim(buscas.FieldByName('codbarra').AsString) + '|' +
                  Trim(buscas.FieldByName('prod_serv').AsString) + '|' +
                  Trim(buscas.FieldByName('descr_it').AsString) + '|' +
                  Trim(buscas.FieldByName('quantidade').AsString) + '|' +
                  Trim(buscas.FieldByName('unidade').AsString) + '|' +
                  Trim(buscas.FieldByName('preco').AsString) + '|' +
                  Trim(buscas.FieldByName('perc_desc').AsString) + '|' +
                  Trim(buscas.FieldByName('perc_acresc').AsString) + '|' +
                  Trim(buscas.FieldByName('total').AsString) + '|' +
                  Trim(buscas.FieldByName('descaliq').AsString) + '|' +
                  Trim(buscas.FieldByName('status_it').AsString) + '|' +
                  Trim(buscas.FieldByName('iat').AsString) + '|' +
                  Trim(buscas.FieldByName('ippt').AsString) + '|' +
                  Trim(buscas.FieldByName('csdecqtde').AsString) + '|' +
                  Trim(buscas.FieldByName('csdecvlunt').AsString) + '|',
                  'CUPOM2',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' AND NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                  ' AND COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' AND REGISTRO = ' + IntToStr(CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger) +
                  ' AND ORDEM = ' + IntToStr(CdsBuscaTerminal.FieldByName('ORDEM').AsInteger) +
                  ' AND CUPOM = ' + IntToStr(CdsBuscaTerminal.FieldByName('CUPOM').AsInteger)
                );
//              vMD5Func._gravaMD5_Cupom2(buscas,
//                CdsBuscaTerminal.FieldByName('cod_terminal').AsInteger,
//                CdsBuscaTerminal.FieldByName('registro').AsInteger,
//                CdsBuscaTerminal.FieldByName('nitem').AsInteger,
//                CdsBuscaTerminal.FieldByName('cupom').AsInteger,
//                CdsBuscaTerminal.FieldByName('ordem').AsInteger,
//                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('nserieecf').AsString));
            end
            else if itx = 4 then
            begin
              buscas.Close;
              buscas.SQL.Text :=
                'select doc.nserieecf, imp.mf_adicional, cniee.modelo_ecf,' +
                ' imp.cod_proprietario, doc.coo_ecf, doc.gnf_ecf, doc.grg_ecf, doc.cdc_ecf,' +
                ' doc.tipo_doc_ecf, doc.data_f_emissao, doc.hora_f_emissao, doc.md5' +
                ' from doc_naofiscal_terminal doc' +
                ' inner join terminal_impressoras imp on imp.cod_terminal = doc.cod_terminal and imp.num_serie_ecf = doc.nserieecf and imp.cod_empresa = doc.cod_empresa and imp.atual = ''S''' +
                ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
                ' where doc.COD_TERMINAL = :COD_TERMINAL and doc.NSERIEECF = :NSERIEECF and doc.COD_EMPRESA = :COD_EMPRESA and doc.COO_ECF = :COO_ECF';
              buscas.ParamByName('COD_TERMINAL').AsInteger := CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger;
              buscas.ParamByName('NSERIEECF').AsString := vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString);
              buscas.ParamByName('COD_EMPRESA').AsInteger := CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger;
              buscas.ParamByName('COO_ECF').AsInteger := CdsBuscaTerminal.FieldByName('COO_ECF').AsInteger;
              buscas.Open;

              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  Trim(buscas.FieldByName('NSERIEECF').AsString) + '|' +
                  Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
                  Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
                  Trim(buscas.FieldByName('COO_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('GNF_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('GRG_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('CDC_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('TIPO_DOC_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('DATA_F_EMISSAO').AsString) + '|' +
                  Trim(buscas.FieldByName('HORA_F_EMISSAO').AsString) + '|',
                  'DOC_NAOFISCAL_TERMINAL',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' AND NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                  ' AND COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' AND COO_ECF = ' + IntToStr(CdsBuscaTerminal.FieldByName('COO_ECF').AsInteger)
                );

//              vMD5Func._gravaMD5_DocNaoFiscal(buscas,
//                CdsBuscaTerminal.FieldByName('coo_ecf').AsInteger,
//                CdsBuscaTerminal.FieldByName('cod_terminal').AsInteger,
//                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('nserieecf').AsString))
            end
            else if itx = 6 then
            begin
              buscas.Close;
              buscas.SQL.Text :=
                'SELECT RES.NSERIEECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,IMP.COD_PROPRIETARIO,RES.NREDUCOES,RES.COORED,' +
                'RES.CRO_MOV,RES.DATA_MOV,RES.DATA_EMISSAO_Z,RES.HORA_EMISSAO_Z,RES.VLVENDAB,' +
                'IMP.ISSQNDESC, RES.MD5 FROM ' +
                'RESUMOD RES, TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE WHERE' +
                ' RES.COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                ' AND RES.NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                ' AND RES.COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                ' AND RES.COORED = ' + IntToStr(CdsBuscaTerminal.FieldByName('COORED').AsInteger) +
                ' AND RES.COD_TERMINAL = IMP.COD_TERMINAL AND RES.COD_EMPRESA = ' +
                'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO ';
              buscas.Open;

              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  Trim(buscas.FieldByName('NSERIEECF').AsString) + '|' +
                  Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
                  Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
                  Trim(buscas.FieldByName('NREDUCOES').AsString) + '|' +
                  Trim(buscas.FieldByName('COORED').AsString) + '|' +
                  Trim(buscas.FieldByName('CRO_MOV').AsString) + '|' +
                  Trim(buscas.FieldByName('DATA_MOV').AsString) + '|' +
                  Trim(buscas.FieldByName('DATA_EMISSAO_Z').AsString) + '|' +
                  Trim(buscas.FieldByName('HORA_EMISSAO_Z').AsString) + '|' +
                  Trim(buscas.FieldByName('VLVENDAB').AsString) + '|' +
                  Trim(buscas.FieldByName('ISSQNDESC').AsString) + '|',
                  'RESUMOD',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' AND NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                  ' AND COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' AND COORED = ' + IntToStr(CdsBuscaTerminal.FieldByName('COORED').AsInteger)
                );
//              vMD5Func._gravaMD5_ReducaoZ(buscas,
//                CdsBuscaTerminal.FieldByName('coored').AsInteger,
//                CdsBuscaTerminal.FieldByName('cod_terminal').AsInteger,
//                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('nserieecf').AsString),
//                CdsBuscaTerminal.FieldByName('data_mov').AsString);
            end
            else if itx = 7 then
            begin
              buscas.Close;
              buscas.SQL.Text :=
                'select mp.nserieecf,imp.mf_adicional,cniee.modelo_ecf, imp.cod_proprietario,res.nreducoes,' +
                ' case when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-T'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-T'')) then ''Can-T''' +
                ' when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-S'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-S'')) then ''Can-S''' +
                ' else mp.descaliq' +
                ' end descaliq, mp.valoraliq, mp.md5' +
                ' from resumod res' +
                ' inner join terminal_impressoras imp on imp.cod_terminal = res.cod_terminal and imp.num_serie_ecf = res.nserieecf and imp.cod_empresa = res.cod_empresa and imp.atual = ''S''' +
                ' inner join mapa_resumo_aliq mp on mp.cod_terminal = res.cod_terminal and mp.nserieecf = res.nserieecf and mp.cod_empresa = res.cod_empresa and mp.coored = res.coored' +
                ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
                ' where mp.COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                ' AND mp.NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                ' AND mp.COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                ' AND mp.COORED = ' + IntToStr(CdsBuscaTerminal.FieldByName('COORED').AsInteger) +
                ' AND mp.ALIQ_SEQ = ' + QuotedStr(CdsBuscaTerminal.FieldByName('ALIQ_SEQ').AsString) ;
              buscas.Open;

              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  Trim(buscas.FieldByName('NSERIEECF').AsString) + '|' +
                  Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
                  Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
                  Trim(buscas.FieldByName('NREDUCOES').AsString) + '|' +
                  Trim(buscas.FieldByName('DESCALIQ').AsString) + '|' +
                  Trim(buscas.FieldByName('VALORALIQ').AsString) + '|',
                  'MAPA_RESUMO_ALIQ',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' AND NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                  ' AND COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' AND COORED = ' + IntToStr(CdsBuscaTerminal.FieldByName('COORED').AsInteger) +
                  ' AND ALIQ_SEQ = ' + QuotedStr(CdsBuscaTerminal.FieldByName('ALIQ_SEQ').AsString)
                );
//              vMD5Func._gravaMD5_DetalhesReducaoZ(buscas,
//                CdsBuscaTerminal.FieldByName('coored').AsInteger,
//                CdsBuscaTerminal.FieldByName('cod_terminal').AsInteger,
//                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('nserieecf').AsString),
//                CdsBuscaTerminal.FieldByName('descaliq').AsString)
            end
            else if itx = 9 then
            begin
              //MEIOS DE PAGAMENTO
              buscas.Close;
              buscas.SQL.Text := 'select FC.COD_TERMINAL, FC.NSERIEECF, FC.COD_EMPRESA, FC.REGISTRO, FC.DATA, FC.TIPO_DOC, F.DESCRICAO, FC.VALOR from FINCUPOM FC' +
                ' left JOIN FINALIZADORES F on F.COD_TERMINAL = FC.COD_TERMINAL and F.NSERIEECF = FC.NSERIEECF and F.COD_EMPRESA = FC.COD_EMPRESA AND F.COD_FINALIZADOR = FC.FINALIZADOR' +
                ' where FC.COD_TERMINAL = :COD_TERMINAL and FC.NSERIEECF = :NSERIEECF and FC.COD_EMPRESA = :COD_EMPRESA and FC.REGISTRO = :REGISTRO and FC.TIPO_DOC = :TIPO_DOC';
              buscas.ParamByName('COD_TERMINAL').AsInteger := CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger;
              buscas.ParamByName('NSERIEECF').AsString := vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString);
              buscas.ParamByName('COD_EMPRESA').AsInteger := CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger;
              buscas.ParamByName('REGISTRO').AsInteger := CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger;
              buscas.ParamByName('TIPO_DOC').AsString := CdsBuscaTerminal.FieldByName('TIPO_DOC').AsString;
              buscas.Open;
              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  FormatDateTime('dd/mm/yyyy', buscas.FieldByName('data').AsDateTime) + '|' +
                  Trim(buscas.FieldByName('descricao').AsString) + '|' +
                  Trim(buscas.FieldByName('tipo_doc').AsString) + '|' +
                  buscas.FieldByName('valor').AsString + '|',
                  'FINCUPOM',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' and NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('nserieecf').AsString)) +
                  ' and COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' and REGISTRO = ' + IntToStr(CdsBuscaTerminal.FieldByName('registro').AsInteger) +
                  ' and TIPO_DOC = ' + QuotedStr(CdsBuscaTerminal.FieldByName('tipo_doc').AsString)
                );

              // H2 - TROCO OPERADORAS DE CARTAO
              buscas.Close;
              buscas.SQL.Text := 'SELECT CPFCGC_AMD_TROCO, CUPOM, CCF_ECF, VALOR_TROCO,' +
                ' DATA, CPFCGC_CLI_TROCO, N_AUT_CART, COD_TERMINAL FROM FINCUPOM' +
                ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and TIPO_DOC = :TIPO_DOC AND COALESCE(VALOR_TROCO,0) > 0';
              buscas.ParamByName('COD_TERMINAL').AsInteger := CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger;
              buscas.ParamByName('NSERIEECF').AsString := vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString);
              buscas.ParamByName('COD_EMPRESA').AsInteger := CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger;
              buscas.ParamByName('REGISTRO').AsInteger := CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger;
              buscas.ParamByName('TIPO_DOC').AsString := CdsBuscaTerminal.FieldByName('TIPO_DOC').AsString;
              buscas.Open;

              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  buscas.FieldByName('CPFCGC_AMD_TROCO').AsString + '|' +
                  buscas.FieldByName('CUPOM').AsString + '|' +
                  buscas.FieldByName('CCF_ECF').AsString + '|' +
                  buscas.FieldByName('VALOR_TROCO').AsString + '|' +
                  FormatDateTime('dd/mm/yyyy', buscas.FieldByName('DATA').AsDateTime) + '|' +
                  buscas.FieldByName('CPFCGC_CLI_TROCO').AsString + '|' +
                  Trim(buscas.FieldByName('N_AUT_CART').AsString) + '|' ,
                  'FINCUPOM',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' and NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                  ' and COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' and REGISTRO = ' + IntToStr(CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger) +
                  ' and TIPO_DOC = ' + QuotedStr(CdsBuscaTerminal.FieldByName('tipo_doc').AsString),
                  'MD5H2');

              // R07 MEIOS DE PAGAMENTO DOS CUPONS FISCAIS
              buscas.Close;
              buscas.SQL.Text :=
                'select fin.nserieecf, imp.mf_adicional, cniee.modelo_ecf,' +
                ' imp.cod_proprietario, fin.cupom, fin.ccf_ecf, fin.gnf_ecf,' +
                ' fnz.descricao, fin.valor, fin.status_fc, fin.md5r07' +
                ' from fincupom fin' +
                ' inner join terminal_impressoras imp on imp.cod_terminal = fin.cod_terminal and imp.num_serie_ecf = fin.nserieecf and imp.cod_empresa = fin.cod_empresa and imp.atual = ''S''' +
                ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
                ' inner join finalizadores fnz on fnz.cod_terminal = fin.cod_terminal and fnz.nserieecf = fin.nserieecf and fnz.cod_empresa = fin.cod_empresa and fnz.cod_finalizador = fin.finalizador' +
                ' where fin.COD_TERMINAL = :COD_TERMINAL and fin.NSERIEECF = :NSERIEECF and fin.COD_EMPRESA = :COD_EMPRESA and fin.REGISTRO = :REGISTRO and fin.TIPO_DOC = :TIPO_DOC';
              buscas.ParamByName('COD_TERMINAL').AsInteger := CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger;
              buscas.ParamByName('NSERIEECF').AsString := vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString);
              buscas.ParamByName('COD_EMPRESA').AsInteger := CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger;
              buscas.ParamByName('REGISTRO').AsInteger := CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger;
              buscas.ParamByName('TIPO_DOC').AsString := CdsBuscaTerminal.FieldByName('TIPO_DOC').AsString;
              buscas.Open;

              if not buscas.IsEmpty then
                vMD5Func._gravaMD5_RegistrosPAF( buscas,
                  Trim(buscas.FieldByName('NSERIEECF').AsString) + '|' +
                  Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
                  Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
                  Trim(buscas.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
                  Trim(buscas.FieldByName('cupom').AsString) + '|' +
                  Trim(buscas.FieldByName('ccf_ecf').AsString) + '|' +
                  Trim(buscas.FieldByName('gnf_ecf').AsString) + '|' +
                  Trim(buscas.FieldByName('descricao').AsString) + '|' +
                  Trim(buscas.FieldByName('valor').AsString) + '|' +
                  Trim(buscas.FieldByName('status_fc').AsString) + '|',
                  'FINCUPOM',
                  ' COD_TERMINAL = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_TERMINAL').AsInteger) +
                  ' AND NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('NSERIEECF').AsString)) +
                  ' AND COD_EMPRESA = ' + IntToStr(CdsBuscaTerminal.FieldByName('COD_EMPRESA').AsInteger) +
                  ' AND REGISTRO = ' + IntToStr(CdsBuscaTerminal.FieldByName('REGISTRO').AsInteger) +
                  ' AND TIPO_DOC = ' + QuotedStr(CdsBuscaTerminal.FieldByName('TIPO_DOC').AsString),
                  'MD5R07'
                );


//              vMD5Func._gravaMD5_FinCupom(buscas,
//                CdsBuscaTerminal.FieldByName('registro').AsInteger,
//                CdsBuscaTerminal.FieldByName('cod_terminal').AsInteger,
//                vDadosIni.decodifica(CdsBuscaTerminal.FieldByName('nserieecf').AsString));
            end;

            CdsBuscaTerminal.Next;
          end;

          if vparar <> 0 then
            break;
        except
          on e: exception do
          begin
            RollBackTransacao;
            result := false;
            MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
            registraErro('EF0001 ' + e.Message);
          end;
        end;
      end;
      //      if vparar <> 0 then
      //        application.messagebox('Sincronização Terminal -> Retaguarda foi Cancelada com Sucesso',
      //          'Informação', MB_ICONINFORMATION + MB_OK)
      //      else if vDadosIni.vInibeMensPesqPros <> 'S' then
      //        application.messagebox('Sincronização Terminal - >Retaguarda foi executado com Sucesso',
      //          'Informação', MB_ICONINFORMATION + MB_OK);
    end;
  end;
end;

function TTerminaisF.ValidarArquivoHwF(pVenderecoOr: string): boolean;
var
  vTemp: string;
  vTabHwFdb: TIBQuery;
  vBancoTemp: string;
begin
  try

    vTemp := pVenderecoOr;
    if Pos(':', vTemp) > 0 then
      vTemp := copy(vTemp, Pos(':', vTemp) + 1, Length(vTemp));

    if Pos(':', vTemp) = 0 then
      pVenderecoOr := Pchar('127.0.0.1:' + pVenderecoOr);

    if Pos(UpperCase('HWF.FDB'), UpperCase(pVenderecoOr)) > 0 then
      vBancoTemp := StringReplace(pVenderecoOr, '\\', '\', [rfReplaceAll])
    else
      vBancoTemp := StringReplace(pVenderecoOr + '\Hwf.fdb', '\\', '\', [rfReplaceAll]);

    if vDadosIni.conectaBanco(dtmTerminaisF.DtbHwFFDB, vBancoTemp, true) then
    begin
      vTabHwFdb := TIBQuery(dtmTerminaisF.IbapagarHwfdb);
      vTabHwFdb.Close;
      vTabHwFdb.SQL.Text := 'select DATA_BASE_ALT from EMPDESVOLV where COD_EMPDES = 1';
      try
        vTabHwFdb.Open;
        vSincDataBase := vTabHwFdb.FieldByName('DATA_BASE_ALT').AsDateTime;
      except
        vSincDataBase := 0;
      end;
    end
    else
      Application.MessageBox('Não foi possivel conectar ao HwF.fdb informado', 'Atenção', 0 + 64);
  finally
    vDadosIni.desconectaBanco(dtmTerminaisF.DtbHwFFDB);
  end;
end;

function TTerminaisF.vendasPorPeriodo(drig: TDbgrid; dataInicial,
  dataFinal: string): boolean;
var
  vVendaP: TClientDataSet;
  buscas2: TIBQuery;
begin
  try
    StrToDate(dataInicial);
    StrToDate(dataFinal);
  except
    application.messagebox('Período inválido', 'Informação', MB_ICONINFORMATION + MB_OK);
  end;

  vVendaP := TClientDataSet(dtmTerminaisF.cdsVendTerminais);
  buscas2 := TIBQuery(dtmTerminaisF.IbTerminalinloco);
  while not vVendaP.IsEmpty do
    vVendaP.Delete;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if drig.SelectedRows.CurrentRowSelected then
    begin
      if vDadosIni.conectaBanco(dtmAtivo.bancoFiscal,
        trim(dataSet.FieldByName('END_TERMINAL').AsString), False) then
      begin
        buscas2.Close;
        buscas2.SQL.Text :=
          'select cp.data, SUM(cp.total) vendabruta, SUM(cp.valorpago) vendaliquida,' +
          ' SUM(CP.valor_desc) DESCONTO, SUM(CP.valor_acres) ACRESCIMO' +
          ' from cupom cp' +
          ' where cp.data >= :dataIni and cp.data <= :dataFim and' +
          ' ((cp.status_cp <> ''CANCELADO'') or (CP.status_cp IS NULL))' +
          ' GROUP BY cp.data';
        buscas2.Params[0].AsDate := StrToDate(dataInicial);
        buscas2.Params[1].AsDate := StrToDate(dataFinal);
        buscas2.Open;
        while not buscas2.Eof do
        begin
          vVendaP.Insert;
          vVendaP.FieldByName('Terminal').AsString :=
            trim(dataSet.FieldByName('nome_terminal').AsString);
          vVendaP.FieldByName('cod_Terminal').AsInteger :=
            dataSet.FieldByName('cod_terminal').AsInteger;
          vVendaP.FieldByName('DataMovimento').AsDateTime := buscas2.FieldByName('data').AsDateTime;
          vVendaP.FieldByName('VendaBruta').AsCurrency :=
            buscas2.FieldByName('vendabruta').AsCurrency;
          vVendaP.FieldByName('Desconto').AsCurrency := buscas2.FieldByName('desconto').AsCurrency;
          vVendaP.FieldByName('VendaLiquida').AsCurrency :=
            buscas2.FieldByName('vendaliquida').AsCurrency;
          vVendaP.FieldByName('Acrescimo').AsCurrency :=
            buscas2.FieldByName('acrescimo').AsCurrency;
          vVendaP.Post;
          buscas2.Next;
        end;
        buscas2.Close;
      end
      else
      begin
        vVendaP.Insert;
        vVendaP.FieldByName('Terminal').AsString :=
          trim(dataSet.FieldByName('nome_terminal').AsString) + ' OFF-Line';
        vVendaP.FieldByName('cod_Terminal').AsInteger :=
          dataSet.FieldByName('cod_terminal').AsInteger;
        vVendaP.Post;
      end;
    end;
    dataSet.Next;
  end;
  Result := not vVendaP.IsEmpty;
end;

function TTerminaisF.verificarTerm(grid: TdbGrid): boolean;
begin
  result := false;
  vtermsql := '';
  first;
  while not dataSet.eof do
  begin
    if grid.SelectedRows.CurrentRowSelected then
      vtermsql := vtermsql + dataSet.FieldByName('COD_TERMINAL').AsString + ',';
    dataSet.next;
  end;
  vtermsql := Copy(vtermsql, 1, Length(vtermsql) - 1);
  if vtermsql = '' then
    result := false
  else
    //  begin
    //   vtermsql:='('+vtermsql+')';
    result := true;
  //  end;
end;

procedure TTerminaisF._salvarLog(txtLog: string);
var
  Arq: TextFile;
begin
  try
    AssignFile(Arq, fPathLog);
    if not FileExists(fPathLog) then
      Rewrite(arq)
    else
      append(arq);
    WriteLn(arq, DateTimeToStr(Now) + ' : ' + txtLog);
  finally
    CloseFile(Arq);
  end;
end;

{ TSoftFiscal }

function TSoftFiscal.abreSofFiscal: boolean;
begin
  montaSelect('select f.*,f.NOME_PAF||''-''||d.NOME_EMPDES as NOMEAPRES from ' +
    'FISCAL_VERSOES f, EMPDESVOLV d where ' +
    'f.COD_EMPDES = d.COD_EMPDES ');
end;

constructor TSoftFiscal.create;
begin
  DataSet := TClientDataSet(dtmTerminaisF.CdsSoftFiscal);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
  CadEmpDes := TEmpDesenvolv.create;
  cadArquivosFiscal := TArquivosFiscal.create;
  CadEmpDes.abreEmpDes;
end;

function TSoftFiscal.delete: boolean;
begin
  CancelUpdates;
  if application.messagebox('Tem certeza que deseja Excluir PAF Selecionado?', 'Confirmação',
    mb_yesno + MB_DEFBUTTON2) = IDYES then
    if inherited Delete then
      if not Apply then
        CancelUpdates;
end;

destructor TSoftFiscal.destroy;
begin
  dataSet.Close;
  inherited;
end;

function TSoftFiscal.post: boolean;
begin
  try
    result := true;
    IniciaTransacao;
    if dataset.FieldByName('COD_EMPDES').asinteger <= 0 then
      raise exception.create('Empresa Desenvolvedora não informada');
    if (trim(DataSet.FieldByName('NOME_PAF').AsString) = '') or
      (DataSet.FieldByName('NOME_PAF').IsNull) then
      raise exception.create('Preencha o Nome do PAF');
    if (trim(DataSet.FieldByName('VERSAO_PAF').AsString) = '') or
      (DataSet.FieldByName('VERSAO_PAF').IsNull) then
      raise exception.create('Preencha a Versão do PAF');
    if (trim(DataSet.FieldByName('MD5_PAF').AsString) = '') or
      (DataSet.FieldByName('MD5_PAF').IsNull) then
      raise exception.create('Preencha a MD5 desta Versão do PAF');
    if length(trim(DataSet.FieldByName('MD5_PAF').AsString)) < 32 then
      raise exception.create('MD5 do Arquivo com tamanho menor que 32 dígitos');
    if (trim(DataSet.FieldByName('ER_PAF_ECF').AsString) = '') or
      (DataSet.FieldByName('ER_PAF_ECF').IsNull) then
      raise exception.create('Preencha o ER PAF ECF desta Versão do PAF');
    if pos('.', DataSet.FieldByName('ER_PAF_ECF').AsString) > 0 then
      raise
        exception.create('Preencha o ER PAF ECF sem pontos. Somente Numeros. Coloque Zeros a esquerda. Ex: 0108');
    if Length(Trim(DataSet.FieldByName('ER_PAF_ECF').AsString)) <> 4 then
      raise
        exception.create('Preencha o ER PAF ECF sem pontos. Somente Numeros. Coloque Zeros a esquerda. Ex: 0108');

    if (trim(DataSet.FieldByName('PRINCIPAL_EXEC').AsString) = '') or
      (DataSet.FieldByName('PRINCIPAL_EXEC').IsNull) then
      raise exception.create('Preencha o Nome do Aplicativo Principal');
    if (trim(DataSet.FieldByName('N_LAUDO_FISCAL').AsString) = '') or
      (DataSet.FieldByName('N_LAUDO_FISCAL').IsNull) then
      raise exception.create('Preencha o número do Laudo Técnico');
    if DataSet.State = dsInsert then
    begin
      //      buscas.close;
      //      buscas.SQL.Text := 'SELECT GEN_ID(INC_SOFTFISCAL,1) FROM RDB$DATABASE';
      //      buscas.Open;
      //      DataSet.FieldByName('COD_FISCAL').AsInteger := buscas.Fields[0].AsInteger;
      //      buscas.close;
      DataSet.FieldByName('DATA_CAD_FISCAL').AsDateTime := Date;
      dataSet.FieldByName('ATIVO').AsInteger := 1;
    end
    else
      DataSet.FieldByName('DATA_MOD_FISCAL').AsDateTime := Date;

    result := inherited post;
    Apply;
    CommitaTransacao;
    vDadosIni.GravaAuditoria('TERM022', 'INCLUIR/ALTERAR', 'SUCESSO', 'FISCAL_VERSOES',
      DataSet.FieldByName('COD_FISCAL').AsString, buscas);
    application.messagebox('Dados Gravados com Sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  except
    on e: exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('TERM022', 'INCLUIR/ALTERAR', 'FALHA', 'FISCAL_VERSOES',
        DataSet.FieldByName('COD_FISCAL').AsString, buscas);
      result := false;
      MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0001 ' + e.Message);
    end;
  end;

end;

{ TResumoD }

function TResumoD.abreResumoD: boolean;
begin
  montaSelect('SELECT * FROM RESUMOD WHERE COD_EMPRESA = ' + vdadosini.codEmpresa +
    ' AND COD_TERMINAL = ' + vdadosini.vcodTerminal + ' order by DATA_MOV');
end;

constructor TResumoD.create;
begin
  DataSet := TClientDataSet(dtmTerminaisF.CdsResumoD);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
  cadMapaResumoDetal := TMapaResumoDetal.create;
end;

function TResumoD.delete: boolean;
begin
  CancelUpdates;
  if application.messagebox('Tem certeza que deseja Excluir o Resumo Diário Selecionado?',
    'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    if inherited Delete then
      Apply;
end;

destructor TResumoD.destroy;
begin
  dataSet.close;
  cadMapaResumoDetal.Free;
  inherited;
end;

function TResumoD.DetalheResumoD: boolean;
begin

end;

function TResumoD.Insert: Boolean;
begin
  inherited Insert;
  DataSet.FieldByName('DATA_MOV').AsDateTime := Date;
  DataSet.FieldByName('VLCANCEL').AsFloat := 0;
  DataSet.FieldByName('VLACRESCIMO').AsFloat := 0;
  DataSet.FieldByName('VLDESCONTOS').AsFloat := 0;
  DataSet.FieldByName('VLISS').AsFloat := 0;
  DataSet.FieldByName('VLISENTOS').AsFloat := 0;
  DataSet.FieldByName('VLNINCIDENCIA').AsFloat := 0;
  DataSet.FieldByName('VLSUBST').AsFloat := 0;
end;

function TResumoD.post: boolean;
begin
  try
    result := true;
    IniciaTransacao;
    if (trim(DataSet.FieldByName('DATA_MOV').AsString) = '') or
      (DataSet.FieldByName('DATA_MOV').IsNull) then
      raise exception.create('Preencha a Data do Resumo');
    if (trim(DataSet.FieldByName('COORED').AsString) = '') or
      (DataSet.FieldByName('COORED').IsNull) then
      raise exception.create('Preencha o COO da Redução');
    if DataSet.FieldByName('SEQINI').AsInteger = 0 then
      raise exception.create('Preencha o Seq. Inicial do ECF');
    if DataSet.FieldByName('SEQFIM').AsInteger = 0 then
      raise exception.create('Preencha o Seq. Final do ECF');
    if DataSet.FieldByName('VLVENDAB').AsFloat < 0 then
      raise exception.create('Preencha o Valor de Venda Bruta');
    if DataSet.FieldByName('VLTOTGERAL').AsFloat < 0 then
      raise exception.create('Preencha o Valor do Grande Total');
    if DataSet.FieldByName('CRO_MOV').AsInteger <= 0 then
      raise exception.create('Preencha o valor do contador de início de Operação');
    if DataSet.FieldByName('NREDUCOES').AsInteger <= 0 then
      raise exception.create('Preencha o valor do contador de reduções');
    if DataSet.FieldByName('VLTOTLIQ').AsFloat < 0 then
      raise exception.create('Preencha o valor total liquído para esta movimentção');
    if DataSet.FieldByName('VLCANCEL').isnull then
      raise exception.create('Preencha o valor total de cancelamentos para esta movimentção');
    if DataSet.FieldByName('VLACRESCIMO').isnull then
      raise exception.create('Preencha o valor total de Acréscimo para esta movimentção');
    if DataSet.FieldByName('VLDESCONTOS').IsNull then
      raise exception.create('Preencha o valor total de descontos para esta movimentção');
    if DataSet.FieldByName('VLISS').IsNull then
      raise exception.create('Preencha o valor total ISS para esta movimentção');
    if DataSet.FieldByName('VLISENTOS').IsNull then
      raise exception.create('Preencha o valor total isentos para esta movimentção');
    if DataSet.FieldByName('VLNINCIDENCIA').IsNull then
      raise exception.create('Preencha o valor total Não incidência para esta movimentção');
    if DataSet.FieldByName('VLSUBST').IsNull then
      raise
        exception.create('Preencha o valor total Substituição Tributária para esta movimentção');
    if DataSet.FieldByName('DATA_EMISSAO_Z').IsNull then
      raise exception.create('Preencha a Data de emissão do Z para esta movimentção');
    if DataSet.FieldByName('HORA_EMISSAO_Z').IsNull then
      raise exception.create('Preencha a Hora de emissão do Z para esta movimentção');
    if DataSet.State = dsInsert then
    begin
      DataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      DataSet.FieldByName('NSERIEECF').AsString := vnserieecf;
      //      dataSet.FieldByName('ATIVO').AsInteger:=1;
    end;
    result := inherited post;
    Apply;
    CommitaTransacao;

    buscas.Close;
    buscas.SQL.Text :=
      'SELECT RES.NSERIEECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,IMP.COD_PROPRIETARIO,RES.NREDUCOES,RES.COORED,' +
      'RES.CRO_MOV,RES.DATA_MOV,RES.DATA_EMISSAO_Z,RES.HORA_EMISSAO_Z,RES.VLVENDAB,' +
      'IMP.ISSQNDESC, RES.MD5 FROM ' +
      'RESUMOD RES, TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE WHERE' +
      ' RES.COD_TERMINAL = ' + IntToStr(dataSet.FieldByName('COD_TERMINAL').AsInteger) +
      ' AND RES.NSERIEECF = ' + QuotedStr(dataSet.FieldByName('NSERIEECF').AsString) +
      ' AND RES.COD_EMPRESA = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) +
      ' AND RES.COORED = ' + IntToStr(dataSet.FieldByName('COORED').AsInteger) +
      ' AND RES.COD_TERMINAL = IMP.COD_TERMINAL AND RES.COD_EMPRESA = ' +
      'IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO ';
    buscas.Open;

    if not buscas.IsEmpty then
      vMD5Func._gravaMD5_RegistrosPAF( buscas,
        Trim(buscas.FieldByName('NSERIEECF').AsString) + '|' +
        Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
        Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
        Trim(buscas.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
        Trim(buscas.FieldByName('NREDUCOES').AsString) + '|' +
        Trim(buscas.FieldByName('COORED').AsString) + '|' +
        Trim(buscas.FieldByName('CRO_MOV').AsString) + '|' +
        Trim(buscas.FieldByName('DATA_MOV').AsString) + '|' +
        Trim(buscas.FieldByName('DATA_EMISSAO_Z').AsString) + '|' +
        Trim(buscas.FieldByName('HORA_EMISSAO_Z').AsString) + '|' +
        Trim(buscas.FieldByName('VLVENDAB').AsString) + '|' +
        Trim(buscas.FieldByName('ISSQNDESC').AsString) + '|',
        'RESUMOD',
        ' COD_TERMINAL = ' + IntToStr(dataSet.FieldByName('COD_TERMINAL').AsInteger) +
        ' AND NSERIEECF = ' + QuotedStr(dataSet.FieldByName('NSERIEECF').AsString) +
        ' AND COD_EMPRESA = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) +
        ' AND COORED = ' + IntToStr(dataSet.FieldByName('COORED').AsInteger)
      );

//    vMD5Func._gravaMD5_ReducaoZ(buscas,
//      dataSet.FieldByName('coored').AsInteger,
//      dataSet.FieldByName('cod_terminal').AsInteger,
//      vDadosIni.decodifica(dataSet.FieldByName('nserieecf').AsString),
//      dataSet.FieldByName('data_mov').AsString
//      );
    vDadosIni.GravaAuditoria('TERM020', 'INCLUIR/ALTERAR', 'SUCESSO', 'RESUMOD',
      DataSet.FieldByName('cod_terminal').AsString + '-' +
      DataSet.FieldByName('NSERIEECF').AsString + ' - ' + DataSet.FieldByName('DATA_MOV').AsString,
      buscas);
    application.messagebox('Dados Gravados com Sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  except
    on e: exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('TERM020', 'INCLUIR/ALTERAR', 'FALHA', 'RESUMOD',
        DataSet.FieldByName('cod_terminal').AsString + '-' +
        DataSet.FieldByName('NSERIEECF').AsString + ' - ' +
        DataSet.FieldByName('DATA_MOV').AsString, buscas);
      result := false;
      MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0001 ' + e.Message);
    end;
  end;

end;

{ TEmpDesenvolv }

function TEmpDesenvolv.abreEmpDes: boolean;
begin
  montaSelect('select * from EMPDESVOLV WHERE ATIVO = 1');
end;

constructor TEmpDesenvolv.create;
begin
  DataSet := TClientDataSet(dtmTerminaisF.CdsEmpDesenvolv);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
end;

destructor TEmpDesenvolv.destroy;
begin
  dataSet.close;
  inherited;
end;

{ TDocNaoFiscal }

function TDocNaoFiscal.abreDocNaoFiscal: boolean;
begin
  montaSelect('SELECT * FROM DOC_NAOFISCAL_TERMINAL WHERE COD_EMPRESA = ' + vdadosini.codEmpresa +
    ' AND COD_TERMINAL = ' + vdadosini.vcodTerminal);
end;

constructor TDocNaoFiscal.create;
begin
  DataSet := TClientDataSet(dtmTerminaisF.CdsDocNaoFiscal);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
end;

function TDocNaoFiscal.delete: boolean;
begin
  CancelUpdates;
  if application.messagebox('Tem certeza que deseja Excluir Doc Selecionado?', 'Confirmação',
    mb_yesno + MB_DEFBUTTON2) = IDYES then
    if inherited Delete then
      if not Apply then
        CancelUpdates;
end;

destructor TDocNaoFiscal.destroy;
begin
  Close;
  inherited;
end;

function TDocNaoFiscal.post: boolean;
begin
  try
    result := true;
    IniciaTransacao;
    if (DataSet.FieldByName('GNF_ECF').AsInteger = 0)
      and (DataSet.FieldByName('GRG_ECF').AsInteger = 0) and
      (DataSet.FieldByName('CDC_ECF').AsInteger = 0) then
      raise exception.create('Preencha GNF_ECF ou GRG_ECF ou CDC_ECF')
    else
    begin
      if DataSet.FieldByName('GNF_ECF').IsNull then
        DataSet.FieldByName('GNF_ECF').AsInteger := 0;
      if DataSet.FieldByName('GRG_ECF').IsNull then
        DataSet.FieldByName('GRG_ECF').AsInteger := 0;
      if DataSet.FieldByName('CDC_ECF').IsNull then
        DataSet.FieldByName('CDC_ECF').AsInteger := 0;
    end;
    if (trim(DataSet.FieldByName('DATA_F_EMISSAO').AsString) = '') or
      (DataSet.FieldByName('DATA_F_EMISSAO').IsNull) then
      raise exception.create('Preencha o Data Emissão do documento');
    if (trim(DataSet.FieldByName('COO_ECF').AsString) = '') or
      (DataSet.FieldByName('COO_ECF').IsNull) then
      raise exception.create('Preencha o COO do Documento');

    if DataSet.State = dsInsert then
    begin
      DataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      //      dataSet.FieldByName('ATIVO').AsInteger:=1;
    end;
    result := inherited post;
    Apply;
    CommitaTransacao;
    vDadosIni.GravaAuditoria('TERM029', 'INCLUIR/ALTERAR', 'SUCESSO', 'DOC_NAOFISCAL_TERMINAL',
      dataSet.FieldByName('COD_TERMINAL').AsString + '-' + dataSet.FieldByName('NSERIEECF').AsString
      +
      '-' + dataSet.FieldByName('COO_ECF').AsString, buscas);
    application.messagebox('Dados Gravados com Sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  except
    on e: exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('TERM029', 'INCLUIR/ALTERAR', 'FALHA', 'DOC_NAOFISCAL_TERMINAL',
        dataSet.FieldByName('COD_TERMINAL').AsString + '-' +
        dataSet.FieldByName('NSERIEECF').AsString +
        '-' + dataSet.FieldByName('COO_ECF').AsString, buscas);
      result := false;
      MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0001 ' + e.Message);
    end;
  end;
end;

{ TImpresssoras_CNIEE }

function TImpresssoras_CNIEE.abreImpressorasCNIEE: boolean;
begin
  montaSelect('SELECT * FROM IMPRESSORAS_CNIEE ');
end;

constructor TImpresssoras_CNIEE.create;
begin
  DataSet := TClientDataSet(dtmTerminaisF.CdsImpCNIEE);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
end;

destructor TImpresssoras_CNIEE.destroy;
begin
  Close;
  inherited;
end;

{ TImpresssorasTerm }

function TImpresssorasTerm.abreImpressorasTerm: boolean;
begin
  montaSelect('SELECT * FROM TERMINAL_IMPRESSORAS WHERE COD_EMPRESA = ' + vdadosini.codEmpresa +
    ' AND COD_TERMINAL = ' + vdadosini.vcodTerminal);
  cadIMPCNIEE.abreImpressorasCNIEE;
end;

constructor TImpresssorasTerm.create;
begin
  DataSet := TClientDataSet(dtmTerminaisF.CdsImprTerminal);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
  cadIMPCNIEE := TImpresssoras_CNIEE.create;
end;

function TImpresssorasTerm.definiratual: boolean;
var
  vnumserie, cniee: string;
begin
  result := false;
  vnumserie := dataSet.FieldByName('NUM_SERIE_ECF').AsString;
  cniee := dataSet.FieldByName('IDENT_CNIEE').AsString;
  IniciaTransacao;
  try
    dataset.First;
    while not dataset.eof do
    begin
      edit;
      if (dataSet.FieldByName('NUM_SERIE_ECF').AsString <> vnumserie) or
        (dataSet.FieldByName('IDENT_CNIEE').AsString <> cniee) then
        dataSet.FieldByName('ATUAL').AsString := 'N'
      else
        dataSet.FieldByName('ATUAL').AsString := 'S';
      dataSet.post;
      dataset.next;
    end;
    Apply;
    CommitaTransacao;
    Result := true;
  except
    on e: exception do
    begin
      RollBackTransacao;
      result := false;
      MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0001 ' + e.Message);
    end;
  end;
end;

function TImpresssorasTerm.delete: boolean;
begin
  CancelUpdates;
  if application.messagebox('Tem certeza que deseja Excluir Impressora Selecionado?',
    'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    if inherited Delete then
      if not Apply then
        CancelUpdates;
end;

destructor TImpresssorasTerm.destroy;
begin
  cadIMPCNIEE.Free;
  Close;
  inherited;
end;

function TImpresssorasTerm.Insert: Boolean;
begin
  inherited insert;
end;

function TImpresssorasTerm.post: boolean;
begin
  try
    result := true;
    IniciaTransacao;
    if DataSet.FieldByName('IDENT_CNIEE').IsNull then
      raise exception.create('Preencha Identificação da impressora no CNIEE');
    if (DataSet.FieldByName('NUM_SERIE_ECF').IsNull) or
      (DataSet.FieldByName('NUM_SERIE_ECF').asstring = '') then
      raise exception.create('Preencha Número de série do ECF');

    if (trim(DataSet.FieldByName('DATA_SB').AsString) = '') or
      (DataSet.FieldByName('DATA_SB').IsNull) then
      raise exception.create('Preencha o Data do Software Básico do ECF');
    if (trim(DataSet.FieldByName('HORA_SB').AsString) = '') or
      (DataSet.FieldByName('HORA_SB').IsNull) then
      raise exception.create('Preencha o Hora do Software Básico do ECF');

    if DataSet.State = dsInsert then
    begin
      DataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('DATA_CAD_TERM').AsDateTime := date;
      dataSet.FieldByName('ATUAL').AsString := 'N';

      //      dataSet.FieldByName('ATIVO').AsInteger:=1;
    end
    else
      dataSet.FieldByName('DATA_MOD_TERM').AsDateTime := date;
    result := inherited post;
    Apply;
    CommitaTransacao;

    buscas.Close;
    buscas.SQL.Text :=
      'SELECT IMP.NUM_SERIE_ECF, IMP.MF_ADICIONAL, CNIEE.TIPO_ECF,' +
      'CNIEE.MARCA_ECF, CNIEE.MODELO_ECF, CNIEE.VERSAOSB, IMP.DATA_SB, IMP.HORA_SB,' +
      'IMP.COD_TERMINAL, DES.CNPJ_EMPDES, DES.IE_EMPDES, DES.IM_EMPDES, DES.NOME_EMPDES,' +
      'FSC.NOME_PAF, FSC.VERSAO_PAF, FSC.MD5_PAF, FSC.ER_PAF_ECF, IMP.IDENT_CNIEE, IMP.MD5 FROM ' +
      'TERMINAL_IMPRESSORAS IMP, IMPRESSORAS_CNIEE CNIEE, TERMINALF TERM,' +
      'FISCAL_VERSOES FSC,EMPDESVOLV DES' +
      ' WHERE IMP.COD_TERMINAL = ' + inttostr(DataSet.FieldByName('cod_terminal').AsInteger) +
      ' AND IMP.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND IMP.NUM_SERIE_ECF = ' + QuotedStr(DataSet.FieldByName('NUM_SERIE_ECF').AsString) +
      ' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO AND IMP.COD_TERMINAL = ' +
      ' TERM.COD_TERMINAL AND IMP.COD_EMPRESA = ' +
      ' TERM.COD_EMPRESA AND TERM.COD_FISCAL = FSC.COD_FISCAL AND FSC.COD_EMPDES = DES.COD_EMPDES';
    buscas.Open;

    vMD5Func._gravaMD5_RegistrosPAF( buscas,
      Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(buscas.FieldByName('TIPO_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('MARCA_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('VERSAOSB').AsString) + '|' +
          Trim(buscas.FieldByName('DATA_SB').AsString) + '|' +
          Trim(buscas.FieldByName('HORA_SB').AsString) + '|' +
          Trim(buscas.FieldByName('COD_TERMINAL').AsString) + '|' +
          Trim(vDadosIni.vEmp.vCNPJ) + '|' +
          Trim(vDadosIni.vEmp.vIE) + '|' +
          Trim(buscas.FieldByName('ER_PAF_ECF').AsString) + '|',
          'TERMINAL_IMPRESSORAS',
          ' COD_TERMINAL = ' + IntToStr( dataSet.FieldByName('COD_TERMINAL').AsInteger ) +
          ' AND NUM_SERIE_ECF = ' + QuotedStr(dataSet.FieldByName('NUM_SERIE_ECF').AsString) +
          ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa);

    vDadosIni.GravaAuditoria('TERM034', 'INCLUIR/ALTERAR', 'SUCESSO', 'TERMINAL_IMPRESSORAS',
      dataSet.FieldByName('COD_TERMINAL').AsString + dataSet.FieldByName('IDENT_CNIEE').AsString +
      dataSet.FieldByName('NUM_SERIE_ECF').AsString, buscas);
    application.messagebox('Dados Gravados com Sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  except
    on e: exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('TERM034', 'INCLUIR/ALTERAR', 'FALHA', 'TERMINAL_IMPRESSORAS',
        dataSet.FieldByName('COD_TERMINAL').AsString + dataSet.FieldByName('IDENT_CNIEE').AsString +
        dataSet.FieldByName('NUM_SERIE_ECF').AsString, buscas);
      result := false;
      MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0001 ' + e.Message);
    end;
  end;
end;

{ TMapaResumoDetal }

function TMapaResumoDetal.abreDetalhes: boolean;
begin
  montaSelect('SELECT * FROM MAPA_RESUMO_ALIQ WHERE cod_terminal = ' +
    inttostr(vcodterminal) + ' and COORED = ' + inttostr(coored));
end;

constructor TMapaResumoDetal.create;
begin
  DataSet := TClientDataSet(dtmTerminaisF.CdsDetallhesResumoD);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
end;

destructor TMapaResumoDetal.destroy;
begin
  Close;
  inherited;
end;

{ TArquivosFiscal }

function TArquivosFiscal.AbreArqFiscal: boolean;
begin
  montaSelect('select * from arquivos_fiscal where cod_fiscal = ' + IntToStr(vcodfiscal));
end;

function TArquivosFiscal.AbreArqGeral: boolean;
begin
  montaSelect('select * from arquivos_fiscal');
end;

constructor TArquivosFiscal.create;
begin
  dataSet := TClientDataSet(dtmTerminaisF.CdsArquivosFiscal);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
  buscas := TIBQuery(dtmTerminaisF.QrBuscasFin);
end;

function TArquivosFiscal.delete: boolean;
begin
  CancelUpdates;
  if application.messagebox('Tem certeza que deseja Excluir o Arquivo?', 'Confirmação', mb_yesno
    + MB_DEFBUTTON2) = IDYES then
    if inherited Delete then
      Apply;
end;

destructor TArquivosFiscal.destroy;
begin
  dataSet.close;
  inherited;
end;

function TArquivosFiscal.post: boolean;
begin
  try
    result := true;
    IniciaTransacao;
    if vcodfiscal <= 0 then
      raise exception.create('Código do Sistema Fiscal não informada')
    else
      dataset.FieldByName('COD_FISCAL').asinteger := vcodfiscal;

    if (trim(DataSet.FieldByName('NOME_ARQUIVO').AsString) = '') or
      (DataSet.FieldByName('NOME_ARQUIVO').IsNull) then
      raise exception.create('Preencha o Nome do Arquivo');
    if (trim(DataSet.FieldByName('MD5_ARQUIVO').AsString) = '') or
      (DataSet.FieldByName('MD5_ARQUIVO').IsNull) then
      raise exception.create('Preencha o MD5 do Arquivo');
    if length(trim(DataSet.FieldByName('MD5_ARQUIVO').AsString)) < 32 then
      raise exception.create('MD5 do Arquivo com tamanho menor que 32 dígitos');

    if DataSet.State = dsInsert then
    begin
      buscas.close;
      buscas.SQL.Text := 'SELECT GEN_ID(INC_ARQUIVOS,1) FROM RDB$DATABASE';
      buscas.Open;
      DataSet.FieldByName('COD_ARQUIVO').AsInteger := buscas.Fields[0].AsInteger;
      buscas.close;
    end;
    result := inherited post;
    Apply;
    CommitaTransacao;
    application.messagebox('Dados Gravados com Sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  except
    on e: exception do
    begin
      RollBackTransacao;
      result := false;
      MessageDlg('ET0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0001 ' + e.Message);
    end;
  end;
end;

end.

