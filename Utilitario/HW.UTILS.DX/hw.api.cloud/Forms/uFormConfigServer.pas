unit uFormConfigServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.Buttons, uClasseConexao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, IBX.IBServices;

type

  TipoTabelas = (ttDisponiveis, ttCofinguradas, ttNaoConfiguraveis);
  TipoBanco = (tbNaoConfigurado, tbServer, tbClient);
  ConfigActions = (caAtivar, caDesativar);

  TLogText = procedure(text: string; lastLine: Boolean = False) of object;

  RunGBAK = class(TThread)
  private
    Fcmd: string;
    Fverbose: Boolean;
    procedure Execute; override;
  public
    property cmd: string read Fcmd write Fcmd;
    property verbose: Boolean read Fverbose write Fverbose;
  end;

  FirebirdDbUtil = class
  public
    class function CreateBackup(paramsList, bkFileName: string; verbose: Boolean; log: TLogText): Boolean;
    class function CreateRestore(paramsList, bkFileName, fdbFileName: string; verbose: Boolean; log: TLogText): Boolean;
    class function CreateFdbTerminal(paramsList: string; empresaId, caixaId: Integer; token: string; tabelas, scripts: TStrings; log: TLogText): Boolean;
    class function SetStatistics(paramsList: string; log: TLogText): Boolean;
    class function CheckPrivileges(paramsList, tablesList: string; log: TLogText): Boolean;
    class function CreateFdbLog(paramsList, script: string; log: TLogText): Boolean;
  end;

  TConfigServer = class(TConexao)
  private
    FterminaisDb: TConexao_OOP;
    FtipoBanco: TipoBanco;
    FtabsConfiguradas: TStrings;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Inicializar(caixaId: Integer = 0);
    procedure AbrirTodosTerminais;

    function AtivarServer(log: TLogText): Boolean;

    function GetCampos(tabela: string; tipo: TipoTabelas): TStrings;
    function GetTabelas(tipo: TipoTabelas): TStrings;
    function GetEmpresasSchema(tabela: string): TStrings;
    function GetEmpresas(): TStrings;
    function ConfigurarTabelas(action:ConfigActions; tabelas, empresas: TStrings): Boolean;
    function ConfigurarTabelasInicial(empresas: TStrings; log: TLogText): Boolean;
    function ConfigurarCampos(tabela: string; campos, empresas: TStrings): Boolean;
    function CreateBackup(caixaId: Integer; bkFile: string; log: TLogText): string;
    function SaveToken(empresaId, caixaId: Integer; token: string): Boolean;

    property tipBanco: TipoBanco read FtipoBanco write FtipoBanco;
    property tabsConfiguradas: TStrings read FtabsConfiguradas write FtabsConfiguradas;
    property terminaisDb: TConexao_OOP read FterminaisDb write FterminaisDb;
  end;

  TfrmConfigServer = class(TForm)
    PageControl1: TPageControl;
    ts_principal: TTabSheet;
    ts_cofig_tables: TTabSheet;
    Panel1: TPanel;
    pn_dados: TPanel;
    Splitter2: TSplitter;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    Panel99: TPanel;
    pn_tabelas: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    GroupBox4: TGroupBox;
    SpeedButton1: TSpeedButton;
    ck_tab_disp: TCheckListBox;
    GroupBox5: TGroupBox;
    ck_tab_confg: TCheckListBox;
    GroupBox6: TGroupBox;
    lb_tab_notrep: TListBox;
    Panel8: TPanel;
    bt_voltar: TBitBtn;
    lb_tab_conf: TListBox;
    Panel6: TPanel;
    SpeedButton11: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ts_config_campos: TTabSheet;
    Panel9: TPanel;
    pn_campos_add: TPanel;
    GroupBox1: TGroupBox;
    ck_campos_disp: TCheckListBox;
    Panel11: TPanel;
    bt_confCampos_Voltar: TBitBtn;
    Panel5: TPanel;
    GroupBox8: TGroupBox;
    Panel13: TPanel;
    Panel14: TPanel;
    DBGrid1: TDBGrid;
    pn_btns: TPanel;
    SpeedButton10: TSpeedButton;
    pn_empresas: TPanel;
    gbEmpresas: TGroupBox;
    ck_empresas: TCheckListBox;
    Panel3: TPanel;
    bt_confTab_concluir: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox3: TGroupBox;
    ck_tab_sels: TCheckListBox;
    Panel2: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    pn_campos: TPanel;
    GroupBox9: TGroupBox;
    ck_empresas_2: TCheckListBox;
    Panel15: TPanel;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    bt_confCampos_Concluir: TBitBtn;
    GroupBox10: TGroupBox;
    ck_campos_sel: TCheckListBox;
    Panel12: TPanel;
    bt_campos_add_voltar: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pn_table_name: TPanel;
    ts_new_db: TTabSheet;
    Panel7: TPanel;
    pn_fdb_banco: TPanel;
    GroupBox7: TGroupBox;
    Panel17: TPanel;
    bt_fdb_voltar: TBitBtn;
    pn_fdb_restore: TPanel;
    GroupBox13: TGroupBox;
    ts_backup: TTabSheet;
    Panel22: TPanel;
    Panel25: TPanel;
    bt_backup_voltar: TBitBtn;
    Panel29: TPanel;
    GroupBox17: TGroupBox;
    Panel23: TPanel;
    Panel24: TPanel;
    ck_backup_verbose: TCheckBox;
    Panel26: TPanel;
    Panel27: TPanel;
    memoBkp: TMemo;
    pn_bkp_name: TPanel;
    bt_bkp_novo: TBitBtn;
    bt_bkp_sel: TBitBtn;
    lb_bkp_sel: TLabel;
    Panel18: TPanel;
    bt_fdb_sel: TBitBtn;
    lb_fdb_save: TLabel;
    bt_fdb_executar: TBitBtn;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    memoCreateFdb: TMemo;
    TabSheet3: TTabSheet;
    ckl_delete_tables: TCheckListBox;
    ckVerboseRestore: TCheckBox;
    pn_fdb_terminal: TPanel;
    GroupBox11: TGroupBox;
    ts_terminais: TTabSheet;
    Panel19: TPanel;
    Panel30: TPanel;
    BitBtn10: TBitBtn;
    pn_terminais: TPanel;
    GroupBox12: TGroupBox;
    Panel28: TPanel;
    DBGrid2: TDBGrid;
    Panel33: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton22: TSpeedButton;
    pn_terminais_conf: TPanel;
    GroupBox14: TGroupBox;
    Label8: TLabel;
    ed_palavra: TEdit;
    BitBtn11: TBitBtn;
    Label9: TLabel;
    ed_token: TEdit;
    SpeedButton23: TSpeedButton;
    BitBtn13: TBitBtn;
    Label10: TLabel;
    lb_term_empresa: TLabel;
    lb_term_caixa: TLabel;
    Label13: TLabel;
    bt_create_db: TBitBtn;
    SpeedButton18: TSpeedButton;
    Label2: TLabel;
    lb_fdb_empresa: TLabel;
    Label4: TLabel;
    lb_fdb_caixa: TLabel;
    pn_fdb_sucesso: TPanel;
    memo_fdb_log_final: TMemo;
    Panel10: TPanel;
    Label3: TLabel;
    BitBtn14: TBitBtn;
    bt_backup_iniciar: TBitBtn;
    ts_principal_terminal: TTabSheet;
    Panel16: TPanel;
    Panel21: TPanel;
    Panel32: TPanel;
    Panel36: TPanel;
    BitBtn3: TBitBtn;
    ts_ativar: TTabSheet;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    GroupBox18: TGroupBox;
    Panel44: TPanel;
    Panel45: TPanel;
    bt_ativar: TBitBtn;
    Panel47: TPanel;
    memoLog: TMemo;
    bt_ativar_sair: TBitBtn;
    Label6: TLabel;
    ts_script_terminal: TTabSheet;
    memoScriptTerminal: TMemo;
    ts_config_schema_ini: TTabSheet;
    Panel39: TPanel;
    Panel43: TPanel;
    Panel46: TPanel;
    GroupBox20: TGroupBox;
    Panel48: TPanel;
    Panel49: TPanel;
    GroupBox21: TGroupBox;
    ck_empresas_3: TCheckListBox;
    Panel50: TPanel;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    bt_resetSchema: TBitBtn;
    bt_resetSchema_voltar: TBitBtn;
    SpeedButton25: TSpeedButton;
    bt_ativar_continuar: TBitBtn;
    Panel38: TPanel;
    memoResetSchema: TMemo;
    SpeedButton26: TSpeedButton;
    memoDBLogNew: TMemo;
    GroupBox15: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    lb_cx_empresa: TLabel;
    lb_cx_caixa: TLabel;
    Label14: TLabel;
    ed_cx_token: TEdit;
    bt_cx_save: TBitBtn;
    SpeedButton6: TSpeedButton;
    bt_cx_test: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_voltarClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure bt_confTab_concluirClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure bt_campos_add_voltarClick(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure bt_confCampos_ConcluirClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure bt_backup_voltarClick(Sender: TObject);
    procedure bt_bkp_novoClick(Sender: TObject);
    procedure bt_bkp_selClick(Sender: TObject);
    procedure bt_fdb_selClick(Sender: TObject);
    procedure bt_fdb_executarClick(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure bt_create_dbClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure bt_backup_iniciarClick(Sender: TObject);
    procedure bt_ativarClick(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure bt_resetSchemaClick(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure bt_ativar_continuarClick(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure bt_cx_saveClick(Sender: TObject);
    procedure bt_cx_testClick(Sender: TObject);
    procedure ed_cx_tokenChange(Sender: TObject);
  private
    FempresaId: Integer;
    FcaixaId: Integer;
    Fdbpath: string;

    confServer: TConfigServer;
    FparamsUC: TStrings;


    procedure buildInicial;
    procedure buildConfigTables;
    procedure buildResetSchema;
    procedure buildEditTable(table: string);
    procedure buildTerminais;

    procedure logBackup(text: string; lastLine: Boolean = False);
    procedure logCreateFdbTerminal(text: string; lastLine: Boolean = False);
    procedure logProcesso(text: string; lastLine: Boolean = False);
    procedure logResetSchema(text: string; lastLine: Boolean = False);
  public
    { Public declarations }
    property empresaId: Integer read FempresaId write FempresaId;
    property caixaId: Integer read FcaixaId write FcaixaId;
    property dbpath: string read Fdbpath write Fdbpath;
    property paramsUC: TStrings read FparamsUC write FparamsUC;
  end;

var
  frmConfigServer: TfrmConfigServer;

implementation

uses
  System.StrUtils,
  System.NetEncoding,
  System.WideStrUtils,
  System.Math,
  Vcl.Clipbrd,
  Winapi.ShellAPI,
  IBX.IBScript,
  TestConnectionUseCase,
  ConstsBase,
  hw_utils,
  hw_win_utils,
  hw_progress_utils;

{$R *.dfm}

//procedure cloud_get_pedidos(paramsList: WideString);

{ TConfigServer }

procedure TConfigServer.AbrirTodosTerminais;
begin
  FterminaisDb.ClientOpen('select (select result from strzero(e.cod_empresa, 3)) || '' - '' || e.identificacao_emp identificacao_emp,' +
                          ' (select result from strzero(n.cod_emissor, 3)) || '' - '' || n.nome_emissor terminal,' +
                          ' e.cod_empresa, n.cod_emissor,' +
                          ' n.nome_emissor, n.refresh_token from nfc_emissor n' +
                          ' inner join empresa e on e.cod_empresa = n.cod_empresa' +
                          //' where coalesce(n.refresh_token, '''') <> ''''' +
                          ' order by e.cod_empresa, n.cod_emissor');
end;

function TConfigServer.AtivarServer(log: TLogText): Boolean;
begin
  Result := False;
  log('Verificando objetos');

  var conRepl := TConexao.Create();
  try
    var err := '';
    if not conRepl.ConfigureStr(Self.ParamsDB['connectionString'])
      .ConfigureStr(';userName=REPL;passWord=masterkey')
      .conectar(err) then
    begin
      log('Não foi possível conectar ao banco de dados com o usuário REPL. Por favor certifique-se que esse usuário esteja criado no servidor do banco de dados');
      log('Erro: ' + err);
      Exit;
    end;

    var tablist := 'NFCE,NFCE_ITEM,NFCE_DEST,NFCE_PAGAMENTO,NFCE_INFADIC,PRODUTOS,COD_BARRA,COD_GRADE_PROD,TRANSACAO_CARTAO';

    if not FirebirdDbUtil.CheckPrivileges(Self.ParamsDB['connectionString'], tablist + ',SPDB_GUID', log) then
      Exit;

    try

      var tabs := NewStringList(tablist, ',');
      var objname := '';
      var okContinuar := True;
      var tab := '';

      for tab in tabs do
      begin
        Application.ProcessMessages;
        log(Format('Verificando objetos para tabela %s', [tab]));

        if SqlScalar('select count(*) from SPDB_FIELDS_ALL(''%s'') where NAME = ''GUIDT''', [tab]).AsInteger = 0 then
        begin
          log(Format('Tabela %s falta campo GUIDT', [tab]));
          okContinuar := False;
        end
        else
        begin
          objname := tab + IfThen(MatchText(tab, ['NFCE', 'NFCE_ITEM', 'NFCE_DEST', 'NFCE_PAGAMENTO', 'NFCE_INFADIC', 'TRANSACAO_CARTAO']), '_BI_ID', '_BI_GUID');

          if SqlScalar('select count(*) from RDB$DEPENDENCIES' +
                       ' where RDB$DEPENDED_ON_NAME = ''%s'' and RDB$FIELD_NAME = ''GUIDT''' +
                       ' and RDB$DEPENDENT_NAME = ''%s''',
                       [tab, objname ]).AsInteger = 0 then
          begin
            okContinuar := False;
            log(Format('Trigger %s não encontrada para tabela %s e campo GUIDT', [objname, tab]), True);
            log(Format('Verificando objetos. %s', [tab]));
          end;
        end;

        if SqlScalar('select count(*) from RDB$INDICES i' +
                     ' inner join RDB$INDEX_SEGMENTS s on s.rdb$index_name = i.rdb$index_name' +
                     ' where i.rdb$relation_name = ''%s'' and s.rdb$field_name in (''GUIDT'', ''GUID_TR_CARTAO'')',
                    [tab]).AsInteger < IfThen(tab.Equals('NFCE_PAGAMENTO'), 2, 1) then
        begin
          okContinuar := False;
          if tab.Equals('NFCE_PAGAMENTO') then
            log('Tabela NFCE_PAGAMENTO falta indice(s) para o(s) campo(s) GUIDT e GUID_TR_CARTAO')
          else
            log(Format('Tabela %s falta indice para o campo GUIDT', [tab]));
        end;
      end;
      log('Verificação de objetos concluída');

      if not okContinuar then
      begin
        log('>>>>>>>>>>>>>>>>>> IMPORTANTE <<<<<<<<<<<<<<<<<<');
        log('Providencie a criação dos objetos para continuar');
        Exit;
      end;

      log('Preenchendo campos GUID sem valor');
      for tab in tabs do
      begin
        Application.ProcessMessages;
        log(Format('Preenchendo campos GUID sem valor: %s', [tab]), True);

        try

          conRepl.SqlExec('update %s set GUIDT = (select guid from spdb_guid) where coalesce(GUIDT, '''') = ''''', [tab]).Transaction.Commit;

        except on E: Exception do
          begin
            if conRepl.Transacao.InTransaction then
              conRepl.Transacao.Rollback;
            okContinuar := False;
            log(Format('Falha ao preencher campo GUIDT na tabela %s', [tab]));
          end;
        end;

        try

          if tab.Equals('TRANSACAO_CARTAO') then
            conRepl.SqlExec('update nfce_pagamento np' +
                            ' set np.guid_tr_cartao = (' +
                            '   select tc.guidt from transacao_cartao tc' +
                            '     where tc.seqid = np.id_tr_cartao and tc.cod_empresa = np.cod_empresa)' +
                            ' where np.guid_tr_cartao is null and np.id_tr_cartao is not null').Transaction.Commit;

        except on E: Exception do
          begin
            if conRepl.Transacao.InTransaction then
              conRepl.Transacao.Rollback;
            okContinuar := False;
            log('Falha ao preencher campo GUID_TR_CARTAO na tabela NFCE_PAGAMENTO');
          end;
        end;

        try

          if MatchText(tab, ['NFCE_DEST', 'NFCE_INFADIC', 'NFCE_ITEM', 'NFCE_PAGAMENTO']) then
            conRepl.SqlExec('update %s n0 set n0.GUID_NFCE = (select n.guidt from nfce n where n.cod_nfce = n0.cod_nfce and n.cod_empresa = n0.cod_empresa) where coalesce(n0.GUID_NFCE, '''') = ''''', [tab]).Transaction.Commit;

        except on E: Exception do
          begin
            if conRepl.Transacao.InTransaction then
              conRepl.Transacao.Rollback;
            okContinuar := False;
            log(Format('Falha ao preencher campo GUID_NFCE na tabela %s', [tab]));
          end;
        end;

      end;

      log('Preenchimento de campos GUID sem valor concluído', True);

      FirebirdDbUtil.SetStatistics(Format(';databaseName=%s;userName=%s;passWord=%s;charSet=%s',
                                          [Self.ParamsDB['databaseName'],
                                           Self.ParamsDB['userName'],
                                           Self.ParamsDB['password'],
                                           Self.ParamsDB['charSet']]), log);
      if not okContinuar then
      begin
        log('>>>>>>>>>>>>>>>>>> IMPORTANTE <<<<<<<<<<<<<<<<<<');
        log('Execute os scripts para preencher os campos GUID sem valor para continuar');
        Exit;
      end;

      SqlExec('update EMPDESVOLV set DADOS_OFFLINE = ''S'' where COD_EMPDES = 1').Transaction.Commit;

      Result := True;

      log('*');
      log('Sucesso da execução dos scripts');

    except on E: Exception do
      begin
        Result := False;
        if Transacao.InTransaction then
          Transacao.Rollback;

        LogApp.Error('TConfigServer.AtivarServer - Erro %s ', [e.Message]);
        ShowAtencao(e.Message);
      end;
    end;
  finally
    conRepl.desconectar;
    conRepl.Free;
  end;
end;

function TConfigServer.ConfigurarCampos(tabela: string; campos,
  empresas: TStrings): Boolean;
begin
  Client.ClientOpen('select tabela, empresas_id from SINCOFF_SCHEMA where ATIVO = 1');


  var empids := '';
  for var I := 0 to empresas.Count - 1 do
    empids := empids + IfThen(not empids.IsEmpty, ',') + StrToInt(empresas[I].Substring(0, 4).Trim).ToString();

  try
    var sqlCampos := '';
      for var campo in campos do
        sqlCampos := sqlCampos + IfThen(not sqlCampos.IsEmpty, ',') + campo.ToUpper().Trim();

    if not sqlCampos.IsEmpty then
    begin
      Client.ClientOpen('select a.name campo from spdb_fields_all(''%s'') a' +
                        ' where a.name in (select cast(substring(text from 1 for 31) as varchar(31)) campo from sp_split(''%s'', '',''))' +
                        ' order by a.fposition',
                        [tabela, sqlCampos]);
      sqlCampos := '';
      while not Client.Eof do
      begin
        sqlCampos := sqlCampos + IfThen(not sqlCampos.IsEmpty, ',') + Client.fstr('campo');
        Client.Next;
      end;
    end;

    QrAux.Close;
    QrAux.SQL.Text := Format('update or insert into SINCOFF_SCHEMA (tabela, empresas_id, campos, ativo) values (''%s'', ''%s'', :campos, 1) matching (tabela)',
                             [tabela, empids]);
    if sqlCampos.IsEmpty then
      QrAux.Params[0].Value := null
    else
      QrAux.Params[0].Value := sqlCampos;
    QrAux.ExecSQL;
    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if Transacao.InTransaction then
        Transacao.Rollback;

      LogApp.Error('TConfigServer.ConfigurarCampos %s', [e.Message]);
      ShowAtencao(e.Message);
    end;
  end;
end;

function TConfigServer.ConfigurarTabelas(action: ConfigActions; tabelas,
  empresas: TStrings): Boolean;
var
  I: Integer;
begin
  Client.ClientOpen('select tabela, empresas_id from SINCOFF_SCHEMA where ATIVO = 1');


  var empids := '';
  if Assigned(empresas) then
    for I := 0 to empresas.Count - 1 do
      empids := empids + IfThen(not empids.IsEmpty, ',') + StrToInt(empresas[I].Substring(0, 4).Trim).ToString();

  try
    for var item in tabelas do
      if action = caAtivar then
        SqlExec('update or insert into SINCOFF_SCHEMA (tabela, empresas_id, ativo) values (''%s'', ''%s'', 1) matching (tabela)', [item, empids])
      else if (not item.StartsWith('NFC', True)) and (not item.Equals('TRANSACAO_CARTAO')) then
        SqlExec('update SINCOFF_SCHEMA set ATIVO = 0 where tabela = ''%s''', [item]);

    SqlExec('execute procedure spso_fill_schema').Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;

      LogApp.Error('TConfigServer.ConfigurarTabelas %s', [e.Message]);
      ShowAtencao(e.Message);
    end;
  end;

end;

function TConfigServer.ConfigurarTabelasInicial(empresas: TStrings; log: TLogText): Boolean;
var
  I: Integer;
begin
  log('Configurando tabelas');

  var empids := '';
  if Assigned(empresas) then
    for I := 0 to empresas.Count - 1 do
      empids := empids + IfThen(not empids.IsEmpty, ',') + StrToInt(empresas[I].Substring(0, 4).Trim).ToString();

  var tabelas := NewStringList(True, 'PRODUTOS,COD_BARRA,NBM,GRADE,FUNCOES,COLABORADOR,TIPOS_CLIENTES,FINALIDADE,CLIENTES,CIDADES,' +
                                     'ESTADOS,NAT_OP,COND_PAG,CONTROLES,TERMINAL_CARTAO,ADM_CARTAO,INTERMEDIADOR_CONTROLE_EC,' +
                                     'SPED_INFORMACAO_COMPLEMENTAR,EMPRESA,TABELA_PROCESSOS,CONFIG_SISTEMA,' +
                                     'NFCE,NFCE_ITEM,NFCE_DEST,NFCE_PAGAMENTO,NFCE_INFADIC,NFCE_MOVIMENTO,NFCE_MOVIMENTO_LANC,' +
                                     'NFCE_CONFIG,NFC_EMISSOR,TRANSACAO_CARTAO,COD_GRADE_PROD,PEDVENDA', ',');

  try

    SqlExec('update SINCOFF_SCHEMA set ATIVO = 0');

    var campos := '';

    for var tab in tabelas do
    begin
      Application.ProcessMessages;
      log('Configurando tabela ' + tab, True);

      if tab.Equals('PRODUTOS') then
        campos := CAMPOS_PRODUTOS
      else if tab.Equals('COD_BARRA') then
        campos := CAMPOS_COD_BARRA
      else if tab.Equals('NBM') then
        campos := CAMPOS_NBM
      else if tab.Equals('EMPRESA') then
        campos := CAMPOS_EMPRESA
      else
        campos := '';


      SqlExec('update or insert into SINCOFF_SCHEMA (tabela, empresas_id, campos, ativo) values (''%s'', ''%s'', ''%s'', 1) matching (tabela)', [tab, empids, campos]);
    end;

    log('Configuração de tabelas concluída', True);

    log('Definindo ordem do Schema');

    SqlExec('execute procedure spso_fill_schema').Transaction.Commit;

    FirebirdDbUtil.CheckPrivileges(Self.ParamsDB['connectionString'], tabelas.Text, log);

    var conRepL := TConexao.Create;
    try
      var err := '';
      if not conRepL.ConfigureStr(Self.ParamsDB['connectionstring']).ConfigureStr(';username=REPL;password=masterkey').conectar(err) then
      begin
        log('Não foi possível conectar ao banco de dados com o usuário REPL. Não há certeza que o seqid está indexado');
        log('Por favor verifique');
        log('Erro: ' + err);
        Exit;
      end;

      log('Preenchendo seqid tabela ');

      var seq := '';
      for var tabe in tabelas do
      begin
        Application.ProcessMessages;
        log('Preenchendo seqid tabela ' + tabe, True);

        seq := SqlScalar('select s.rdb$depended_on_name from rdb$dependencies d' +
                         ' inner join rdb$dependencies s on s.rdb$dependent_name = d.rdb$dependent_name and s.rdb$depended_on_name like ''SEQ_SO%'' ' +
                         ' where d.rdb$depended_on_name = ' + tabe.QuotedString +
                         ' and d.rdb$field_name = ''SEQID_SINCOFF'' and d.rdb$dependent_name like ''TI_SO%'' ').AsString;

        if not seq.Trim.IsEmpty  then
          conRepL.SqlExec('update %s set seqid_sincoff = next value for %s where seqid_sincoff is null',
                          [tabe, seq]).Transaction.Commit;
      end;
      
    finally
      conRepL.desconectar;
      conRepL.Free;
    end;

    log('Preenchimento de seqid concluído', True);

    FirebirdDbUtil.SetStatistics(Self.ParamsDB['connectionstring'], log);

    log('Processo finalizado com sucesso');

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;

      LogApp.Error('TConfigServer.ConfigurarTabelasInicial %s', [e.Message]);

      ShowAtencao('Falha ao resetar/criar schema inicial. Por favor configure as tabelas do schema e para as empresas' + sLineBreak + sLineBreak +
                  'Erro: ' + e.Message);
    end;
  end;
end;

constructor TConfigServer.Create;
begin
  inherited Create;

  FterminaisDb := NewClientOOP(Transacao);
  FtabsConfiguradas := NewStringList(True);
end;

destructor TConfigServer.Destroy;
begin
  FtabsConfiguradas.Free;
  inherited;
end;

function TConfigServer.CreateBackup(caixaId: Integer; bkFile: string; log: TLogText): string;
var
  bak: TIBBackupService;
  res: TIBRestoreService;
  dbName: string;
  bkName: string;
  logt: string;
begin

  bkName := bkFile;
  dbName := string(Banco.DatabaseName);
  dbName := '192.168.254.50:C:\dadosHW\Sys\jp\A\B\hw.fdb';

  if bkFile = '' then
  begin
    bak := TIBBackupService.Create(nil);
    try
      bak.Protocol := TCP;
      bak.LoginPrompt := False;
      bak.ServerName := dbName.Substring(0, dbName.IndexOf(':'));
      bak.DatabaseName := dbName.Substring(dbName.IndexOf(':') + 1, dbName.Length);
      bak.Options := [];
      bak.Params.Values['user_name'] := Banco.Params.Values['user_name'];
      bak.Params.Values['password'] := Banco.Params.Values['password'];

      bkname := ExtractFilePath(bak.DatabaseName) + 'Terminal_' + PadL(caixaId, 3) + '.fbk';
      bak.BackupFile.Clear;
      bak.BackupFile.Add(bkname);

//      if Assigned(log) then
//        bak.Verbose := False
        bak.Verbose := True;
//      else
        ProgressUtil.Msg('Processando backup. Por favor aguarde');

      bak.Active := True;
      bak.ServiceStart;
      if bak.Verbose then
      begin
        While not bak.Eof do
        begin
          logt := bak.GetNextLine;
//          Application.ProcessMessages;
//          log(bak.GetNextLine);
        end;
      end
      else
        while bak.IsServiceRunning do
          Application.ProcessMessages;
      bak.Active := False;

    finally
      bak.Free;
      ProgressUtil.Terminate;
    end;
  end;


  res := TIBRestoreService.Create(nil);
  try
    res.Protocol := TCP;
    res.LoginPrompt := False;
    res.ServerName := dbName.Substring(0, dbName.IndexOf(':'));
    res.DatabaseName.Text := ReplaceText(bkname, '.fbk', '.fdb');
    //    res.Options := [];
    res.Params.Values['user_name'] := Banco.Params.Values['user_name'];
    res.Params.Values['password'] := Banco.Params.Values['password'];

    res.BackupFile.Clear;
    res.BackupFile.Add(bkname);

//    res.ServerName := '127.0.0.1';
//    res.DatabaseName.Clear;
//    res.DatabaseName.Add('127.0.0.1:D:\Hw\bases\producao\T1.fdb');


//    if Assigned(log) then
      res.Verbose := True;
//    else
      ProgressUtil.Msg('Processando restore. Por favor aguarde');

    res.Active := True;
    res.ServiceStart;
    if res.Verbose then
    begin
      While not res.Eof do
      begin
        logt := res.GetNextLine;
//        Application.ProcessMessages;
//        log(res.GetNextLine);
      end;
    end
    else
      while res.IsServiceRunning do
        Application.ProcessMessages;
    res.Active := False;

  finally
    res.Free;
      ProgressUtil.Terminate;
  end;



end;

function TConfigServer.GetCampos(tabela: string; tipo: TipoTabelas): TStrings;
begin
  case tipo of
    ttDisponiveis:
      Client.ClientOpen('select campo from (' +
                        ' select sum(ind) ind, campo from (' +
                        ' select 1 ind, a.name campo from spdb_fields_all(''%s'') a' +
                        ' union all' +
                        ' select -1 ind, pk.FIELDNAME campo from spdb_fields_pk(''%s'') pk' +
                        ' union' +
                        ' select -1 ind, cast(substring(text from 1 for 31) as varchar(31)) campo from sp_split(''GUIDT,SEQID_SINCOFF'', '','')' +
                        ' union' +
                        ' select 0 ind, cast(substring(text from 1 for 31) as varchar(31)) campo from sp_split((select first 1 sc.campos from sincoff_schema sc where sc.tabela = ''%s''), '','')' +
                        ' )' +
                        ' group by campo) as d' +
                        ' where d.ind = 1', [tabela, tabela, tabela]);

    ttCofinguradas:
      Client.ClientOpen('select cast(substring(text from 1 for 31) as varchar(31)) campo from sp_split((select first 1 sc.campos from sincoff_schema sc where sc.tabela = ''%s''), '','')', [tabela]);
    ttNaoConfiguraveis:
      Client.ClientOpen('select -1 ind, cast(substring(text from 1 for 31) as varchar(31)) campo from sp_split(''GUIDT,SEQID_SINCOFF'', '','')');
  end;

  Result := NewStringList(True);
  while not Client.Eof do
  begin
    Result.Add(Client.fstr('campo'));
    Client.Next;
  end;
  Client.Close;
end;

function TConfigServer.GetEmpresas: TStrings;
begin
  Result := NewStringList(True);
  Client.ClientOpen('select (select result from strzero(cod_empresa, 3)) || '' - '' || identificacao_emp empresa from empresa order by cod_empresa');
  while not Client.Eof do
  begin
    Result.Add(Client.fstr('empresa'));
    Client.Next;
  end;
  Client.Close;
end;

function TConfigServer.GetEmpresasSchema(tabela: string): TStrings;
begin
  Client.ClientOpen('select empresas_id from sincoff_schema where tabela = ''%s''', [tabela]);

  Result := NewStringList(True, Client.fstr('empresas_id'), ',');
end;

function TConfigServer.GetTabelas(tipo: TipoTabelas): TStrings;
begin
  case tipo of
    ttDisponiveis:
      Client.ClientOpen('select tabela from (' +
                        ' select sum(ind) ind, tabela from (' +
                        ' select 0 ind, sc.tabela from sincoff_schema sc' +
                        ' where sc.ativo = 1' +
                        ' union all' +
                        ' select -1 ind, tabela from spri_tables_notrep' +
                        ' union all' +
                        ' select 1 ind, tabela from spdb_tables where tabela not in (''IBE$PARAMS_HISTORY'')) as c' +
                        ' group by tabela) as d' +
                        ' where d.ind = 1' +
                        ' order by tabela');

    ttCofinguradas:
      Client.ClientOpen('select sc.tabela from sincoff_schema sc' +
                        ' where sc.ativo = 1');
    ttNaoConfiguraveis:
      Client.ClientOpen('select tabela from spri_tables_notrep where tabela not in (''EMPDESVOLV'')');
  end;

  Result := NewStringList(True);
  while not Client.Eof do
  begin
    Result.Add(Client.fstr('tabela'));
    Client.Next;
  end;
  Client.Close;
end;

procedure TConfigServer.Inicializar(caixaId: Integer);
begin
  case IndexStr(SqlScalar('select DADOS_OFFLINE from EMPDESVOLV where COD_EMPDES = 1').AsString, ['S', 'C']) of
    0 :
      FtipoBanco := tbServer;
    1 :
      FtipoBanco := tbClient;
    else
      FtipoBanco := tbNaoConfigurado;
  end;

  Client.ClientOpen('select TABELA from SINCOFF_SCHEMA where ATIVO = 1');
  while not Client.Eof do
  begin
    FtabsConfiguradas.Add(Client.fstr('tabela'));
    Client.Next;
  end;
  Client.Close;


  FterminaisDb.ClientOpen('select (select result from strzero(e.cod_empresa, 3)) || '' - '' || e.identificacao_emp identificacao_emp,' +
                          ' (select result from strzero(n.cod_emissor, 3)) || '' - '' || n.nome_emissor terminal,' +
                          ' e.cod_empresa, n.cod_emissor,' +
                          ' n.nome_emissor, n.refresh_token from nfc_emissor n' +
                          ' inner join empresa e on e.cod_empresa = n.cod_empresa' +
                          IfThen(FtipoBanco = tbServer, ' where coalesce(n.refresh_token, '''') <> ''''') +
                          IfThen(FtipoBanco = tbClient, ' where n.cod_emissor = ' + caixaid.ToString()) +
                          ' order by e.cod_empresa, n.cod_emissor');
end;

function TConfigServer.SaveToken(empresaId, caixaId: Integer;
  token: string): Boolean;
begin

  try
    SqlExec('update nfc_emissor set refresh_token = ''%s'' where cod_emissor = %d and cod_empresa = %d ', [token, caixaId, empresaId]).Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if Transacao.InTransaction then
        Transacao.Rollback;

      LogApp.Error('TConfigServer.SaveToken %s %d %d - Erro %s ', [token, caixaId, empresaId, e.Message]);
      ShowAtencao(e.Message);
    end;
  end;
  
end;

{ TfrmConfigServer }

procedure TfrmConfigServer.bt_backup_voltarClick(Sender: TObject);
begin
  PageControl1.ActivePage := ts_new_db;
end;

procedure TfrmConfigServer.bt_bkp_novoClick(Sender: TObject);
begin
  memoBkp.Lines.Clear;
  pn_bkp_name.Caption := 'HwautoTerminal';
  PageControl1.ActivePage := ts_backup;
end;

procedure TfrmConfigServer.bt_bkp_selClick(Sender: TObject);
begin

  var fileOpen := TOpenDialog.Create(nil);
  try
    fileOpen.DefaultExt := '.fbk';
    fileOpen.Filter := 'Backup Firebird|*.fbk|Backup|*.bkp|Banco Firebird|*.fdb|Banco Firebird*|*.gdb|Todos os arquivos|*.*';
    fileOpen.Title := 'Selecione um arquivo de backup para continuar';

    if fileOpen.Execute then
      lb_bkp_sel.Caption := fileOpen.FileName;

  finally
    fileOpen.Free;
  end;

end;

procedure TfrmConfigServer.BitBtn11Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    var empId := StrToInt(string(Copy(lb_term_empresa.Caption, 1, 4)).Trim());
    var cxId := StrToInt(string(Copy(lb_term_caixa.Caption, 1, 4)).Trim());

    if confServer.SqlScalar('select serie_nfce_off from nfc_emissor where cod_empresa = %d and cod_emissor = %d',
      [empId, cxId]).AsInteger = 0 then
    begin
      ShowAtencao('Campo "Serie NFCE Offline" não preenchido no banco de dados para o terminal selecionado' + sLineBreak +
                  'Por favor preencha o campo pelo sistema para continuar');
      Exit;
    end;

    if Trim(ed_palavra.Text).IsEmpty then
    begin
      ShowAtencao('Palavra secreta deve ser informada');
      Exit;
    end;

    var word := ReverseString(TNetEncoding.Base64.EncodeBytesToString(TEncoding.ASCII.GetBytes(ed_palavra.Text)));

    ed_token.Text := TNetEncoding.Base64.EncodeBytesToString(TEncoding.ASCII.GetBytes(ReverseString(PadL(empId, 3) + PadL(cxId, 3) + word)));

    if not confServer.SaveToken(confServer.terminaisDb.fint('cod_empresa'), confServer.terminaisDb.fint('cod_emissor'), ed_token.Text) then
      Exit;

    confServer.terminaisDb.DataSet.Edit;
    confServer.terminaisDb.DataSet.FieldByName('refresh_token').AsString := ed_token.Text;
    confServer.terminaisDb.DataSet.Post;

    bt_create_db.Visible := True;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConfigServer.bt_backup_iniciarClick(Sender: TObject);
begin
  memoBkp.Lines.Clear;

  Screen.Cursor := crHourGlass;
  bt_backup_iniciar.Enabled := False;
  bt_backup_voltar.Enabled := False;
  try

    if confServer.SqlScalar('select serie_nfce_off from nfc_emissor where cod_empresa = %d and cod_emissor = %d',
      [confServer.terminaisDb.fint('cod_empresa'), confServer.terminaisDb.fint('cod_emissor')]).AsInteger = 0 then
      raise Exception.Create('Campo "Serie NFCE Offline" não preenchido no banco de dados para o terminal selecionado' + sLineBreak +
                             'Por favor preencha o campo pelo sistema para continuar');

    var params := NewStringList(paramsUC.Text, ';');
    params.Values['databaseName'] := confServer.ParamsDB['databaseName'];
    params.Values['charset'] := confServer.ParamsDB['charset'];

    if FirebirdDbUtil.CreateBackup(';' + params.Text, pn_bkp_name.Caption, ck_backup_verbose.Checked, logBackup) then
    begin
      memoBkp.Lines.Add('*');
      memoBkp.Lines.Add('*');
      memoBkp.Lines.Add('Backup concluído. Selecione o arquivo na tela anterior para continuar');
    end;

  finally
    Screen.Cursor := crDefault;
    bt_backup_iniciar.Enabled := True;
    bt_backup_voltar.Enabled := True;
  end;
end;

procedure TfrmConfigServer.BitBtn13Click(Sender: TObject);
begin
  pn_terminais.Visible := True;
  pn_terminais_conf.Visible := False;
end;

procedure TfrmConfigServer.BitBtn14Click(Sender: TObject);
begin
  ShellExecute(Application.HANDLE, 'open', PWideChar(ExtractFilePath(lb_fdb_save.Caption)),
    PWideChar('/n, /select,' + lb_fdb_save.Caption), PWideChar('C:\WINDOWS\'), SW_SHOWNORMAL);
end;

procedure TfrmConfigServer.bt_cx_saveClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if not confServer.SaveToken(confServer.terminaisDb.fint('cod_empresa'), confServer.terminaisDb.fint('cod_emissor'), ed_cx_token.Text) then
      Exit;

    confServer.terminaisDb.DataSet.Edit;
    confServer.terminaisDb.DataSet.FieldByName('refresh_token').AsString := ed_cx_token.Text;
    confServer.terminaisDb.DataSet.Post;

    bt_cx_test.Enabled := True;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConfigServer.bt_cx_testClick(Sender: TObject);
begin
  var useCase := TTestConnectionUseCase.Create(';' + paramsUC.Text);
  try
    useCase.Run();
  finally
    useCase.Free;
  end;
end;

procedure TfrmConfigServer.bt_ativar_continuarClick(Sender: TObject);
begin
  buildResetSchema;

  PageControl1.ActivePage := ts_config_schema_ini;
end;

procedure TfrmConfigServer.bt_resetSchemaClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  bt_resetSchema.Enabled := False;
  bt_resetSchema_voltar.Enabled := False;
  try
    var empresas := NewStringList(True);
    for var I := 0 to ck_empresas_3.Count - 1 do
      if ck_empresas_3.Checked[I] then
        empresas.Add(ck_empresas_3.Items[I]);

    if confServer.ConfigurarTabelasInicial(empresas, logResetSchema) then
      bt_resetSchema_voltar.Click;

  finally
    Screen.Cursor := crDefault;
    bt_resetSchema.Enabled := True;
    bt_resetSchema_voltar.Enabled := True;
  end;
end;

procedure TfrmConfigServer.bt_ativarClick(Sender: TObject);
begin
  bt_ativar_continuar.Visible := False;
  memoLog.Lines.Clear;

  Screen.Cursor := crHourGlass;
  bt_ativar.Enabled := False;
  bt_ativar_sair.Enabled := False;
  try

    if confServer.AtivarServer(logProcesso) then
    begin
      bt_ativar_continuar.Visible := True;
      bt_ativar.Visible := False;
      bt_ativar_sair.Visible := False;
      bt_ativar_continuar.Left := bt_ativar_sair.Left;
      logProcesso('*');
      logProcesso('Clique no botão Continuar para ir para tela de configuração inicial');
    end;

  finally
    Screen.Cursor := crDefault;
    bt_ativar.Enabled := True;
    bt_ativar_sair.Enabled := True;
  end;
end;

procedure TfrmConfigServer.bt_confTab_concluirClick(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  bt_confTab_concluir.Enabled := False;
  bt_voltar.Enabled := False;
  try
    var tabelas := NewStringList(True);
    for var I := 0 to ck_tab_sels.Count - 1 do
      if ck_tab_sels.Checked[I] then
        tabelas.Add(ck_tab_sels.Items[I]);

    var empresas := NewStringList(True);
    for var I := 0 to ck_empresas.Count - 1 do
      if ck_empresas.Checked[I] then
        empresas.Add(ck_empresas.Items[I]);

    if tabelas.Count > 0 then
      if confServer.ConfigurarTabelas(caAtivar, tabelas, empresas) then
        buildConfigTables;
        //bt_voltar.Click;


  finally
    bt_confTab_concluir.Enabled := True;
    bt_voltar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConfigServer.bt_voltarClick(Sender: TObject);
begin
  confServer.Inicializar;
  buildInicial;

  PageControl1.ActivePage := ts_principal;
end;

procedure TfrmConfigServer.bt_confCampos_ConcluirClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  bt_confCampos_Concluir.Enabled := False;
  bt_confCampos_Voltar.Enabled := False;
  try

    var campos := NewStringList(True);
    for var I := 0 to ck_campos_sel.Count - 1 do
      if ck_campos_sel.Checked[I] then
        campos.Add(ck_campos_sel.Items[I]);

    var empresas := NewStringList(True);
    for var I := 0 to ck_empresas_2.Count - 1 do
      if ck_empresas_2.Checked[I] then
        empresas.Add(ck_empresas_2.Items[I]);

    if empresas.Count > 0 then
      if confServer.ConfigurarCampos(pn_table_name.Caption, campos, empresas) then
        bt_voltar.Click;

  finally
    bt_confCampos_Concluir.Enabled := True;
  bt_confCampos_Voltar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConfigServer.BitBtn5Click(Sender: TObject);
begin
  pn_empresas.Visible := False;
  pn_tabelas.Visible := True;
end;

procedure TfrmConfigServer.bt_fdb_selClick(Sender: TObject);
begin

  var fileSave := TSaveDialog.Create(nil);
  try
    fileSave.DefaultExt := '.fdb';
    fileSave.Filter := 'Banco Firebird|*.fdb|';
//    with fileSave.FileTypes.Add do
//    begin
//      DisplayName := 'Banco Firebird';
//      FileMask := '*.fdb';
//    end;
    fileSave.Title := 'Salvar arquivo como';

    if fileSave.Execute then
      lb_fdb_save.Caption := fileSave.FileName;

  finally
    fileSave.Free;
  end;
end;

procedure TfrmConfigServer.bt_fdb_executarClick(Sender: TObject);
begin
  if not FileExists(lb_bkp_sel.Caption) then
  begin
    ShowAtencao('Arquivo de backup não existe');
    Exit;
  end;

  var fileS := confServer.ParamsDB['databasename'];

  if EndsText(lb_bkp_sel.Caption, fileS) then
  begin
    ShowAtencao('Arquivo de backup não pode ser o mesmo caminho do banco do servidor' + sLineBreak +
                'Gere um arquivo de backup(*.fbk) ou Faça uma cópia segura do banco de dados original');
    Exit;
  end;

  if FileExists(lb_fdb_save.Caption) then
    if ShowConfirmacao('Já existe um arquivo com o mesmo nome no local selecionado. Deseja substituir?') <> IDYES then
      Exit;

  memoCreateFdb.Lines.Clear;
  Randomize;
  var fileTemp := GetFileNameRandom('FdbTerminal', '.fdb');
  var bkpTemp := '';
  var fdbTemp := '';
  var finalFile := '';
  var manterFinalFile := False;

  Screen.Cursor := crHourGlass;
  bt_fdb_sel.Enabled := False;
  bt_fdb_executar.Enabled := False;
  bt_fdb_voltar.Enabled := False;
  try
    pn_fdb_restore.Visible := False;
    pn_fdb_terminal.Visible := False;
    PageControl2.ActivePage := TabSheet1;

    var tabelas := NewStringList(True);
    for var I := 0 to ckl_delete_tables.Count - 1 do
      if ckl_delete_tables.Checked[I] then
        tabelas.Add(ckl_delete_tables.Items[I]);

    var userAndPass := Format(';userName=%s;passWord=%s;charSet=%s', [confServer.ParamsDB['userName'], confServer.ParamsDB['password'], confServer.ParamsDB['charSet']]);

    logCreateFdbTerminal('Restaurando backup');

    var continuar := False;

    if EndsText('.fdb', lb_bkp_sel.Caption) or EndsText('.gdb', lb_bkp_sel.Caption) then
    begin
      logCreateFdbTerminal('Criando uma cópia para continuar');
      if not CopyFile(PWideChar(lb_bkp_sel.Caption), PWideChar(fileTemp), False) then
      begin
        logCreateFdbTerminal('*');
        logCreateFdbTerminal('Não foi possível criar uma cópia do arquivo selecionado');
      end
      else
        continuar := True;
    end
    else
    if FirebirdDbUtil.CreateRestore(userAndPass, lb_bkp_sel.Caption, fileTemp, ckVerboseRestore.Checked, logCreateFdbTerminal) then
        continuar := True;

    if continuar then
      if FirebirdDbUtil.CreateFdbTerminal(Format(';databaseName=%s:%s' + userAndPass, ['127.0.0.1', fileTemp]),
                                          confServer.terminaisDb.fint('cod_empresa'),
                                          confServer.terminaisDb.fint('cod_emissor'),
                                          confServer.terminaisDb.fstr('refresh_token'),
                                          tabelas, memoScriptTerminal.Lines, logCreateFdbTerminal) then
      begin
        logCreateFdbTerminal('Compactando arquivo final');
        bkpTemp := GetFileNameRandom('FdbTerminal', '.fbk');

        var ok := FirebirdDbUtil.CreateBackup(Format(';databaseName=%s:%s' + userAndPass, ['127.0.0.1', fileTemp]), 
                                              ReplaceText(ExtractFileName(bkpTemp), '.fbk', ''), False, logBackup);
        fdbTemp := GetFileNameRandom('FdbTerminal', '.fdb');
        if ok then
          ok := FirebirdDbUtil.CreateRestore(userAndPass, bkpTemp, fdbTemp, False, logCreateFdbTerminal);

        finalFile := IfThen(ok, fdbTemp, fileTemp);

        if not ok then
        begin
          logCreateFdbTerminal('*');
          logCreateFdbTerminal('Falha na compactação do arquivo final, considera fazer um backup e restore manualmente');
        end;

        FirebirdDbUtil.SetStatistics(Format(';databaseName=%s:%s' + userAndPass, ['127.0.0.1', finalFile]), logCreateFdbTerminal);

        logCreateFdbTerminal('*');
        logCreateFdbTerminal('Movendo o arquivo para o local especificado');
        Application.ProcessMessages;
        if not CopyFile(PWideChar(finalFile), PWideChar(lb_fdb_save.Caption), False) then
        begin
          logCreateFdbTerminal('*');
          logCreateFdbTerminal('Falha ao mover o arquivo para o local especificado. Por favor localize o arquivo abaixo, recorte o o renomeie como desejar');
          logCreateFdbTerminal('*');
          logCreateFdbTerminal(finalFile);
          manterFinalFile := True;
          ShellExecute(Application.HANDLE, 'open', PWideChar(ExtractFilePath(finalFile)),
            PWideChar('/n, /select,' + finalFile), PWideChar('C:\WINDOWS\'), SW_SHOWNORMAL);
        end
        else
        begin
          logCreateFdbTerminal('*');
          logCreateFdbTerminal('Processo concluído');
        end;

        pn_fdb_banco.Visible := False;
        memo_fdb_log_final.Lines.Text := memoCreateFdb.Lines.Text;
        pn_fdb_sucesso.Visible := True;
      end;

  finally
    Sleep(1000);
    if FileExists(fileTemp) then
      DeleteFile(fileTemp);
    if FileExists(bkpTemp) then
      DeleteFile(bkpTemp);
    if ((finalFile <> fileTemp) or (not manterFinalFile)) and FileExists(fileTemp) then
      DeleteFile(fileTemp);
    if ((finalFile <> fdbTemp) or (not manterFinalFile)) and FileExists(fdbTemp) then
      DeleteFile(fdbTemp);

    pn_fdb_restore.Visible := not pn_fdb_sucesso.Visible;
    pn_fdb_terminal.Visible := not pn_fdb_sucesso.Visible;
    pn_fdb_terminal.Top := -10;
    bt_fdb_sel.Enabled := True;
    bt_fdb_executar.Enabled := True;
    bt_fdb_voltar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConfigServer.buildConfigTables;
begin
  pn_empresas.Visible := False;
  pn_tabelas.Visible := True;
  ck_tab_disp.Items.Text := confServer.GetTabelas(ttDisponiveis).Text;
  ck_tab_confg.Items.Text := confServer.GetTabelas(ttCofinguradas).Text;
  lb_tab_notrep.Items.Text := confServer.GetTabelas(ttNaoConfiguraveis).Text;
  ck_empresas.Items.Text := confServer.GetEmpresas.Text;
  for var I := 0 to ck_empresas.Count - 1 do
    ck_empresas.Checked[I] := True;
end;

procedure TfrmConfigServer.buildEditTable(table: string);
begin
  pn_table_name.Caption := table;
  pn_campos_add.Visible := False;
  pn_campos.Visible := True;
  pn_campos_add.Align := alClient;
  pn_campos.Align := alClient;
  ck_campos_disp.Items.Text := confServer.GetCampos(table, ttDisponiveis).Text;
  ck_campos_sel.Items.Text := confServer.GetCampos(table, ttCofinguradas).Text;
  ck_empresas_2.Items.Text := confServer.GetEmpresas.Text;
  var empsIds := confServer.GetEmpresasSchema(table);
  for var I := 0 to ck_empresas_2.Count - 1 do
    ck_empresas_2.Checked[I] := empsIds.IndexOf(
                                                 StrToInt((ck_empresas_2.Items[I].Substring(0, 4).Trim())).ToString()
                                               ) >= 0;

  for var I := 0 to ck_campos_sel.Count - 1 do
    ck_campos_sel.Checked[I] := True;
end;

procedure TfrmConfigServer.buildInicial;
begin
  TryStrToInt(paramsUC.Values['caixaId'], FcaixaId);
  TryStrToInt(paramsUC.Values['empresaId'], FempresaId);

  confServer.Inicializar(caixaId);

  pn_btns.Visible := confServer.tipBanco = tbServer;
  pn_dados.Visible := confServer.tipBanco = tbServer;
  lb_tab_conf.Items.Text := confServer.tabsConfiguradas.Text;
  DBGrid1.DataSource := confServer.terminaisDb.DataSourceOOP;

  if confServer.tipBanco = tbClient then
  begin
    lb_cx_empresa.Caption := confServer.terminaisDb.fstr('identificacao_emp');
    lb_cx_caixa.Caption := confServer.terminaisDb.fstr('terminal');
    ed_cx_token.Text := confServer.terminaisDb.fstr('refresh_token');
    bt_cx_test.Enabled := not confServer.terminaisDb.fempty('refresh_token');
  end;
end;

procedure TfrmConfigServer.buildResetSchema;
begin
  ck_empresas_3.Items.Text := confServer.GetEmpresas.Text;
  for var I := 0 to ck_empresas_3.Count - 1 do
    ck_empresas_3.Checked[I] := True;
end;

procedure TfrmConfigServer.buildTerminais;
begin

  confServer.AbrirTodosTerminais;

  pn_terminais.Visible := True;
  pn_terminais_conf.Visible := False;
  pn_terminais_conf.Align := alClient; 

  DBGrid2.DataSource := confServer.terminaisDb.DataSourceOOP;
end;

procedure TfrmConfigServer.ed_cx_tokenChange(Sender: TObject);
begin
  bt_cx_test.Enabled := False;
end;

procedure TfrmConfigServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  confServer.Free;
  Action := caFree;
  frmConfigServer := nil;
end;

procedure TfrmConfigServer.FormCreate(Sender: TObject);
begin
  confServer := TConfigServer.Create;
end;

procedure TfrmConfigServer.FormShow(Sender: TObject);
begin
  Self.Icon.Handle := ExtractIcon(Handle,PChar(Application.ExeName),0);
  ts_principal.TabVisible := False;
  ts_principal_terminal.TabVisible := False;
  ts_ativar.TabVisible := False;
  ts_cofig_tables.TabVisible := False;
  ts_config_campos.TabVisible := False;
  ts_new_db.TabVisible := False;
  ts_backup.TabVisible := False;
  ts_terminais.TabVisible := False;
  ts_script_terminal.TabVisible := False;
  ts_config_schema_ini.TabVisible := False;
  try

    confServer.ConfigureStr(';' +  paramsUC.Text);

    var err := '';
    if not confServer.conectar(err)  then
      raise Exception.Create('Não foi possivel estabelecer uma conexão com o banco de dados. Por favor contacte o suporte técnico. Erro ' + err);

    buildInicial;

    if confServer.tipBanco = tbClient then
      PageControl1.ActivePage := ts_principal_terminal
    else if confServer.tipBanco = tbServer then
      PageControl1.ActivePage := ts_principal
    else
      PageControl1.ActivePage := ts_ativar;

  except on E: Exception do
    begin
      LogApp.Error('TfrmConfigServer.FormShow %s', [e.Message]);
      ShowAtencao(e.Message);
      PageControl1.ActivePage := ts_principal;
      pn_dados.Visible := False;
      pn_btns.Visible := False;
    end;
  end;
end;

procedure TfrmConfigServer.logBackup(text: string; lastLine: Boolean);
begin
  if lastLine and (memoBkp.Lines.Count > 0) then
    memoBkp.Lines[memoBkp.Lines.Count - 1] := (text)
  else  
    memoBkp.Lines.Add(text);
end;

procedure TfrmConfigServer.logCreateFdbTerminal(text: string; lastLine: Boolean);
begin
  if lastLine and (memoCreateFdb.Lines.Count > 0) then
    memoCreateFdb.Lines[memoCreateFdb.Lines.Count - 1] := (text)
  else
    memoCreateFdb.Lines.Add(text);
end;

procedure TfrmConfigServer.logProcesso(text: string; lastLine: Boolean);
begin
  if lastLine and (memoLog.Lines.Count > 0) then
    memoLog.Lines[memoLog.Lines.Count - 1] := (text)
  else
    memoLog.Lines.Add(text);
end;

procedure TfrmConfigServer.logResetSchema(text: string; lastLine: Boolean);
begin
  if lastLine and (memoResetSchema.Lines.Count > 0) then
    memoResetSchema.Lines[memoResetSchema.Lines.Count - 1] := (text)
  else
    memoResetSchema.Lines.Add(text);
end;

procedure TfrmConfigServer.SpeedButton11Click(Sender: TObject);
begin

  buildConfigTables;

  PageControl1.ActivePage := ts_cofig_tables;
end;

procedure TfrmConfigServer.SpeedButton12Click(Sender: TObject);
begin
  for var I := 0 to ck_tab_confg.Count - 1 do
    ck_tab_confg.Checked[I] := False;
end;

procedure TfrmConfigServer.SpeedButton13Click(Sender: TObject);
begin
  for var I := 0 to ck_tab_confg.Count - 1 do
    ck_tab_confg.Checked[I] := True;
end;

procedure TfrmConfigServer.SpeedButton14Click(Sender: TObject);
begin
  for var I := 0 to ck_empresas.Count - 1 do
    ck_empresas.Checked[I] := True;
end;

procedure TfrmConfigServer.SpeedButton15Click(Sender: TObject);
begin
  for var I := 0 to ck_empresas.Count - 1 do
    ck_empresas.Checked[I] := True;
end;

procedure TfrmConfigServer.SpeedButton16Click(Sender: TObject);
begin
  for var I := 0 to ck_empresas_2.Count - 1 do
    ck_empresas_2.Checked[I] := True;
end;

procedure TfrmConfigServer.SpeedButton17Click(Sender: TObject);
begin
  for var I := 0 to ck_empresas_2.Count - 1 do
    ck_empresas_2.Checked[I] := False;
end;

procedure TfrmConfigServer.SpeedButton18Click(Sender: TObject);
begin
  buildTerminais;
  
  PageControl1.ActivePage := ts_terminais;
end;

procedure TfrmConfigServer.bt_campos_add_voltarClick(Sender: TObject);
begin
  pn_campos.Visible := True;
  pn_campos_add.Visible := False;
end;

procedure TfrmConfigServer.bt_create_dbClick(Sender: TObject);
begin
  lb_fdb_empresa.Caption := confServer.terminaisDb.fstr('identificacao_emp');
  lb_fdb_caixa.Caption := confServer.terminaisDb.fstr('terminal');
  ckl_delete_tables.Items.Text := confServer.GetTabelas(ttNaoConfiguraveis).Text;
  for var i:= 0 to ckl_delete_tables.Count - 1 do
    ckl_delete_tables.Checked[i] := True;
  lb_bkp_sel.Caption := 'Por favor selecione um arquivo de backup ou crie um novo se necessário';
  lb_fdb_save.Caption := 'Por favor informe onde deseja salvar o banco para o novo terminal e clique em Executar';
  ckVerboseRestore.Visible := True;
  bt_fdb_executar.Enabled := True;
  memoCreateFdb.Lines.Clear;
  pn_fdb_sucesso.Visible := False;
  pn_fdb_terminal.Visible := True;
  pn_fdb_restore.Visible := True;
  pn_fdb_banco.Visible := True;
  pn_fdb_terminal.Top := -10;
  pn_fdb_sucesso.Align := alClient;
  PageControl2.ActivePage := TabSheet1;

  PageControl1.ActivePage := ts_new_db;
end;

procedure TfrmConfigServer.SpeedButton19Click(Sender: TObject);
begin
  for var I := 0 to ck_campos_disp.Count - 1 do
    ck_campos_disp.Checked[I] := False;
end;

procedure TfrmConfigServer.SpeedButton1Click(Sender: TObject);
begin
  pn_empresas.Align := alClient;
  pn_empresas.Visible := True;
  pn_tabelas.Visible := False;

  ck_tab_sels.Clear;
  for var I := 0 to ck_tab_disp.Count - 1 do
    if ck_tab_disp.Checked[I] then
    begin
      ck_tab_sels.Items.Add(ck_tab_disp.Items[I]);
      ck_tab_sels.Checked[ck_tab_sels.Count - 1] := True;
    end;

end;

procedure TfrmConfigServer.SpeedButton20Click(Sender: TObject);
begin
  for var I := 0 to ck_campos_disp.Count - 1 do
    ck_campos_disp.Checked[I] := True;
end;

procedure TfrmConfigServer.SpeedButton21Click(Sender: TObject);
begin
  for var I := 0 to ck_campos_disp.Count - 1 do
    if ck_campos_disp.Checked[I] then
    begin
      if ck_campos_sel.Items.IndexOf(ck_campos_disp.Items[I]) >= 0 then
        ck_campos_sel.Checked[ck_campos_sel.Items.IndexOf(ck_campos_disp.Items[I])] := True
      else
      begin
        ck_campos_sel.Items.Add(ck_campos_disp.Items[I]);
        ck_campos_sel.Checked[ck_campos_sel.Count - 1] := True;
      end;
    end;
  bt_campos_add_voltar.Click;
end;

procedure TfrmConfigServer.SpeedButton22Click(Sender: TObject);
begin
  lb_term_empresa.Caption := confServer.terminaisDb.fstr('identificacao_emp');
  lb_term_caixa.Caption := confServer.terminaisDb.fstr('terminal');
  ed_token.Text := confServer.terminaisDb.fstr('refresh_token');      
  bt_create_db.Visible := not confServer.terminaisDb.fstr('refresh_token').IsEmpty;
  ed_palavra.Clear;
  pn_terminais_conf.Visible := True;
  pn_terminais.Visible := False;
end;

procedure TfrmConfigServer.SpeedButton23Click(Sender: TObject);
begin
  clipboard.AsText := ed_token.Text;
end;

procedure TfrmConfigServer.SpeedButton25Click(Sender: TObject);
begin
  if ShowConfirmacao('Deseja mesmo resetar o schema?') = IDYES then
  begin
    buildResetSchema;

    PageControl1.ActivePage := ts_config_schema_ini;
  end;
end;

procedure TfrmConfigServer.SpeedButton26Click(Sender: TObject);
begin
  if ShowConfirmacao('Deseja mesmo criar um banco de dados para Log?') <> IDYES then
    Exit;

  var fileSave := TSaveDialog.Create(nil);
  try
    fileSave.DefaultExt := '.fdb';
    fileSave.Filter := 'Banco Firebird|*.fdb|';
//    with fileSave.FileTypes.Add do
//    begin
//      DisplayName := 'Banco Firebird';
//      FileMask := '*.fdb';
//    end;
    fileSave.Title := 'Salvar arquivo como';

    if fileSave.Execute then
    begin
      var params := Format(';databaseName=127.0.0.1:%s;username=%s;password=%s;charset=WIN1252', 
                           [fileSave.FileName, confServer.ParamsDB['username'], confServer.ParamsDB['password']]);
      if FirebirdDbUtil.CreateFdbLog(params, memoDBLogNew.Text, logBackup ) then
        ShowAtencao('Banco de dados de Log criado com sucesso');
    end;

  finally
    fileSave.Free;
  end;


//  FirebirdDbUtil.CreateFdbLog()
end;

procedure TfrmConfigServer.SpeedButton27Click(Sender: TObject);
begin
  for var I := 0 to ck_empresas_3.Count - 1 do
    ck_empresas_3.Checked[I] := True;
end;

procedure TfrmConfigServer.SpeedButton28Click(Sender: TObject);
begin
  for var I := 0 to ck_empresas_3.Count - 1 do
    ck_empresas_3.Checked[I] := False;
end;

procedure TfrmConfigServer.SpeedButton2Click(Sender: TObject);
begin
  pn_empresas.Align := alClient;
  pn_empresas.Visible := True;
  pn_tabelas.Visible := False;

  ck_tab_sels.Clear;
  for var I := 0 to ck_tab_confg.Count - 1 do
    if ck_tab_confg.Checked[I] then
    begin
      ck_tab_sels.Items.Add(ck_tab_confg.Items[I]);
      ck_tab_sels.Checked[ck_tab_sels.Count - 1] := True;
    end;
end;

procedure TfrmConfigServer.SpeedButton3Click(Sender: TObject);
begin
  if lb_tab_conf.ItemIndex = -1 then
    Exit;


  buildEditTable(lb_tab_conf.Items[lb_tab_conf.ItemIndex]);

  PageControl1.ActivePage := ts_config_campos;
end;

procedure TfrmConfigServer.SpeedButton4Click(Sender: TObject);
begin
  pn_campos_add.Visible := True;
  pn_campos.Visible := False;
end;

procedure TfrmConfigServer.SpeedButton5Click(Sender: TObject);
begin
  if confServer.terminaisDb.IsEmpty then
    Exit;
        
  confServer.SaveToken(confServer.terminaisDb.fint('cod_empresa'), confServer.terminaisDb.fint('cod_emissor'), '');
end;

procedure TfrmConfigServer.SpeedButton7Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts_new_db;
end;

procedure TfrmConfigServer.SpeedButton8Click(Sender: TObject);
begin
  var tabelas := NewStringList(True);
  for var I := 0 to ck_tab_confg.Count - 1 do
    if ck_tab_confg.Checked[I] then
      tabelas.Add(ck_tab_confg.Items[I]);

  if tabelas.Count > 0 then
    if confServer.ConfigurarTabelas(caDesativar, tabelas, nil) then
      buildConfigTables;
end;

{ FirebirdDbUtil }

class function FirebirdDbUtil.CheckPrivileges(
  paramsList, tablesList: string;
  log: TLogText): Boolean;
begin
  Result := True;

  var con := TConexao.Create();
  try
    con.ConfigureStr(paramsList);

    var err:= '';

    if not con.conectar(err) then
    begin
      Result := False;
      log('Erro ao conectar ao banco de dados para checagem de previlégios ' + err);
      Exit;
    end;
    var tables := NewStringList(tablesList, ',');

    for var table in tables do
      try
        con.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [table]).Transaction.Commit();
      except
        on E: Exception do begin
          Result := False;
          log(Format('Falha ao checar priviégios para tabela %s. Por favor contacte o suporte técnico. %s', [table, e.Message]));
        end;
      end;

  finally
    con.desconectar;
    con.Banco.ForceClose;
    con.Free;
  end;
end;

class function FirebirdDbUtil.CreateBackup(
  paramsList, bkFileName: string;
  verbose: Boolean;
  log: TLogText): Boolean;
var
  bak: TIBBackupService;
  dbName: string;
begin

  log('Iniciando processo de backup. Por favor aguarde');
  var splitStr := Copy(paramsList, 1, 1);
  var params := NewStringList(Copy(paramsList, 2, Length(paramsList)), splitStr);

  dbName := params.Values['databaseName'];

  bak := TIBBackupService.Create(nil);
  var con := TConexao.Create();
  con.ConfigureStr(paramsList);
  try
    try

      bak.Protocol := TCP;
      bak.LoginPrompt := False;
      bak.ServerName := dbName.Substring(0, dbName.IndexOf(':'));
      bak.DatabaseName := dbName.Substring(dbName.IndexOf(':') + 1, dbName.Length);
      bak.Options := [];
      bak.Verbose := verbose;
      bak.Params.Values['user_name'] := con.ParamsDB['userName'];
      bak.Params.Values['password'] := con.ParamsDB['password'];

      bkFileName := ExtractFilePath(bak.DatabaseName) + bkFileName + '.fbk';
      bak.BackupFile.Clear;
      bak.BackupFile.Add(bkFileName);

      bak.Active := True;
      bak.ServiceStart;
      if bak.Verbose then
      begin
        While not bak.Eof do
        begin
          Application.ProcessMessages;
          log(bak.GetNextLine);
        end;
      end
      else
        while bak.IsServiceRunning do
          Application.ProcessMessages;
      bak.Active := False;

      Result := True;

    except on E: Exception do
      begin
        Result := False;
        LogApp.Error('TBackupRestore.GetBackup %s', [e.Message]);
        log('Erro durante o processo ' + E.Message);
      end
    end;

  finally
    con.Free;
    bak.Free;
    ProgressUtil.Terminate;
  end;
end;

class function FirebirdDbUtil.CreateFdbLog(paramsList, script: string;
  log: TLogText): Boolean;
begin
  Result := True;

  var con := TConexao.Create();
  var iScript := TIBScript.Create(nil); 
  try
//    con.ConfigureStr(paramsList);
    try
      var params := NewStringList(paramsList, ';');
      con.Banco.Params.Clear;
      con.Banco.Params.Add('user ' + params.Values['username'].QuotedString());
      con.Banco.Params.Add('password ' + params.Values['password'].QuotedString());
      con.Banco.Params.Add('PAGE_SIZE 8192');
      con.Banco.Params.Add('DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252');
      con.Banco.DatabaseName := params.Values['databasename'];
      con.Banco.CreateDatabase;
      con.Banco.ForceClose;

      iScript.Database := con.Banco;
      iScript.Transaction := con.Transacao;

      con.Banco.Params.Clear;
      con.ConfigureStr(paramsList);
      
      var err:= '';
      if not con.conectar(err) then
      begin
        ShowErro('Banco de dados para Log criado, porém ocorreu um erro ao conectar ' + err);
        Exit;
      end;

      if not iScript.Transaction.InTransaction then
        iScript.Transaction.StartTransaction;

      var scripts := NewStringList(script, '|/BLOCO|');
      for var sql in scripts do
      begin 
        iScript.Script.Text := sql;
        iScript.ExecuteScript;        
      end;                    
                                             
      if iScript.Transaction.InTransaction then
        iScript.Transaction.Commit;

    except
      on E: Exception do begin
        Result := False;
        log(Format('Falha ao criar banco de dados de log. Erro: %s', [e.Message]));
      end;
    end;

  finally
    iScript.Free;
    con.desconectar;
    con.Banco.ForceClose;
    con.Free;
  end;
end;

class function FirebirdDbUtil.CreateFdbTerminal(
  paramsList: string;
  empresaId, caixaId: Integer;
  token: string;
  tabelas, scripts: TStrings;
  log: TLogText): Boolean;
var
  con: TConexao;
  iScript: TIBScript;
begin
  log('Iniciando processo');
  con := TConexao.Create;
  iScript := TIBScript.Create(nil);
  try
    try
      iScript.Database := con.Banco;
      iScript.Transaction := con.Transacao;

      con.ConfigureStr(paramsList);
      
      var err:= '';
      if not con.conectar(err) then
        raise Exception.Create('Erro ao conectar ' + err);

      if con.SqlScalar('select serie_nfce_off from nfc_emissor where cod_empresa = %d and cod_emissor = %d', [empresaId, caixaId]).AsInteger = 0 then
        raise Exception.Create('Campo "Serie NFCE Offline" não preenchido no banco de dados para o terminal selecionado' + sLineBreak +
                               'Por favor preencha o campo pelo sistema para continuar');

      log('Executandos scripts do terminal');

      var scriptsT := NewStringList(scripts.Text, '|/BLOCO|');
      for var script in scriptsT do
      begin
        if not con.Transacao.InTransaction then
          con.Transacao.StartTransaction;

        iScript.Script.Text := script;
//        log('/////');
//        log(script);
//        log('/////');

        try
          iScript.ExecuteScript;

        except on E: Exception do
          begin
            if not E.Message.ToLower().Contains('already exists') then
              raise Exception.Create(e.Message);
          end;
        end;
      end;

      log('Verificando empresas');
      var empresas := NewStringList(True);

      con.Client.ClientOpen('select cod_empresa from empresa');
      while not con.Client.Eof do
      begin
        empresas.Add(con.Client.fstr('cod_empresa'));
        con.Client.Next;
      end;

      var tabsManterEmp := NewStringList('NFCE_PAGAMENTO,NFCE_INFADIC,NFCE_ITEM,NFCE_DEST,NFCE,NFCE_MOVIMENTO_LANC,NFCE_MOVIMENTO,NFC_EMISSOR,NFCE_CONFIG,EMPRESA,SINCOFF_DEL,TRANSACAO_CARTAO', ',');
      var tabsNotDel := NewStringList('CODIGO', ',');
      var tab := '';
      var empstr := '';

      con.SqlExec('delete from MIG_EMP').Transaction.Commit;
      log('Executando scripts');

//      for empstr in empresas do
//        for tab in tabelas do
//          if (tabsManterEmp.IndexOf(tab) = -1) or (empresaId.ToString() <> empstr) then
//            if (tabsNotDel.IndexOf(tab) = -1) then
//              con.SqlExec('insert into MIG_EMP (idorigem, iddestino, tabela, acao, concluido) values (%s, %d, ''%s'', ''X'', 0)',
//                          [empstr, empresaId, tab]);
//
//      con.SqlExec('select * from SP_MIGEMP_INACTIVE_TRIGGER(%d, %d, 0)', [empresaId, empresaId]).Transaction.Commit;
      con.SqlExec('delete from NFC_EMISSOR_PENDENCIAS').Transaction.Commit;

      var step := 0;
      for empstr in empresas do
      begin
        step := step + 1;
        log(Format('Executando scripts %d de %d', [step, empresas.Count]), True);
        Application.ProcessMessages;

        for tab in tabelas do
          if (tabsManterEmp.IndexOf(tab) = -1) or (empresaId.ToString() <> empstr) then
            if (tabsNotDel.IndexOf(tab) = -1) then
              con.SqlExec('insert into MIG_EMP (idorigem, iddestino, tabela, acao, concluido) values (%s, %d, ''%s'', ''X'', 0)',
                          [empstr, empresaId, tab]);

        con.SqlExec('select * from SP_MIGEMP_INACTIVE_TRIGGER(%s, %d, 0)', [empstr, empresaId]).Transaction.Commit;

        con.SqlOpen('select * from SP_MIGEMP(''X'', %s, %d, 0)', [empstr, empresaId]).FetchAll;

        if con.Transacao.InTransaction then
          con.Transacao.Commit;

        if empresaId.ToString() = empstr then
        begin
          con.SqlExec('delete from NFCE where COD_EMPRESA <> %d or (COD_EMPRESA = %d and COD_EMISSOR <> %d)',
                      [empresaId, empresaId, caixaId]).Transaction.Commit;
          con.SqlExec('delete from NFCE_MOVIMENTO_LANC L where L.COD_EMPRESA <> %d or' +
                      '  (L.COD_EMPRESA = %d and (select count(L.MOV_ID) from NFCE N where N.MOV_ID = L.MOV_ID and N.COD_EMPRESA = L.COD_EMPRESA) = 0)',
                      [empresaId, empresaId]).Transaction.Commit;
          con.SqlExec('delete from NFCE_MOVIMENTO M where M.COD_EMPRESA <> %d or' +
                      '  (M.COD_EMPRESA = %d and (select count(N.MOV_ID) from NFCE N where N.MOV_ID = M.ID and COD_EMPRESA = M.COD_EMPRESA) = 0)',
                      [empresaId, empresaId]).Transaction.Commit;
          con.SqlExec('delete from NFC_EMISSOR E where E.COD_EMPRESA <> %d or' +
                      ' (E.COD_EMPRESA = %d and E.COD_EMISSOR <> %d and' +
                      '  (((select count(N.COD_EMISSOR) from NFCE N where N.COD_EMISSOR = E.COD_EMISSOR and N.COD_EMPRESA = E.COD_EMPRESA) = 0) and' +
                      '   ((select count(M.COD_EMISSOR) from NFCE_MOVIMENTO M where M.COD_EMISSOR = E.COD_EMISSOR and M.COD_EMPRESA = E.COD_EMPRESA) = 0)))',
                      [empresaId, empresaId, caixaId]).Transaction.Commit;
        end;

        con.SqlExec('select * from SP_MIGEMP_INACTIVE_TRIGGER(%s, %d, 1)', [empstr, empresaId]).Transaction.Commit;
      end;


//      var id := con.SqlScalar('select first 1 id from SINCOFF_DEL where empresa_id = 0 order by id desc').AsInteger;
//      con.SqlExec('delete from SINCOFF_DEL where empresa_id = 0 and id < %d', [id]).Transaction.Commit;
//      id := con.SqlScalar('select first 1 id from SINCOFF_DEL where empresa_id = %d order by id desc', [empresaId]).AsInteger;
//      con.SqlExec('delete from SINCOFF_DEL where empresa_id = %d and id < %d', [empresaId, id]).Transaction.Commit;
      con.SqlExec('delete from NFCE_STATUS_SERVICO').Transaction.Commit;
      con.SqlExec('delete from NOTIFICACAO_API').Transaction.Commit;
      con.SqlExec('delete from EVIDENCIAS_PAF').Transaction.Commit;

      var sql := '';
      var tabSeqIdsSincOff := NewStringList('NFCE,NFCE_PAGAMENTO,NFCE_INFADIC,NFCE_ITEM,NFCE_DEST,NFCE_MOVIMENTO,NFCE_MOVIMENTO_LANC,TRANSACAO_CARTAO', ',');
      for tab in tabSeqIdsSincOff do
      begin
        sql := Format('select max(seqid_sincoff) from %s where cod_empresa = %d', [tab, empresaId]);

        con.SqlExec('update or insert into SINCOFF_SERV_IDS (empresa_id, tabela, side, seqid_sincoff)' +
                    ' values (%d, ''%s'', ''C'', (coalesce((%s),0))) ',
                    [empresaId, tab, sql]);
        con.SqlExec('update or insert into SINCOFF_SERV_IDS (empresa_id, tabela, side, seqid_sincoff)' +
                    ' values (%d, ''%s'', ''S'', (coalesce((%s),0)))',
                    [empresaId, tab, sql]);
      end;
      sql := Format('select first 1 id from SINCOFF_DEL where empresa_id in (0, %d) order by id desc', [empresaId]);
      con.SqlExec('update or insert into SINCOFF_SERV_IDS (empresa_id, tabela, side, seqid_sincoff)' +
                    ' values (%d, ''SINCOFF_DEL'', ''C'', (coalesce((%s),0))) ',
                    [empresaId, sql]);
      con.SqlExec('update or insert into SINCOFF_SERV_IDS (empresa_id, tabela, side, seqid_sincoff)' +
                    ' values (%d, ''SINCOFF_DEL'', ''S'', (coalesce((%s),0))) ',
                    [empresaId, sql]);
      con.SqlExec('delete from SINCOFF_DEL');

//      con.SqlExec('select * from SP_MIGEMP_INACTIVE_TRIGGER(%s, %d, 1)', [empstr, empresaId]).Transaction.Commit;

      con.SqlExec('update EMPDESVOLV set DADOS_OFFLINE = ''C'' where COD_EMPDES = 1');

      con.SqlExec('update NFC_EMISSOR set REFRESH_TOKEN = ''%s'' where COD_EMPRESA = %d and COD_EMISSOR = %d',
                  [token, empresaId, caixaId]).Transaction.Commit;

      var serie := con.SqlScalar('select serie_nfce_off from nfc_emissor where cod_emissor = %d and cod_empresa = %d', [caixaId, empresaId]).AsInteger;

      con.SqlExec('update or insert into CODIGO (cod_empresa, tabela, valor)' +
                  ' values (%d, ''NFCE_SERIE_%d'', %s) matching (tabela, cod_empresa)',
                  [empresaId, serie,
                   Format('(select max(num_nf) from nfce where cod_empresa = %d and serie = %d)', [empresaId, serie])]).Transaction.Commit;

      con.SqlExec('delete from CODIGO where valor = 0').Transaction.Commit;

      Result := True;

      log('Execução de scripts concluída');

    except on E: Exception do
      begin
        if con.Transacao.InTransaction then
          con.Transacao.Rollback;
        Result := False;
        log(E.Message);
        LogApp.Error('FirebirdDbUtil.CreateFdbTerminal ' + e.Message);
      end;
    end;

  finally
    var fdbFile := con.ParamsDB['databaseName'];
    var fdbUser := con.ParamsDB['userName'];
    var fdbPass := con.ParamsDB['passWord'];

    iScript.Free;
    con.desconectar;
    con.Banco.ForceClose;
    con.Free;

    if Result then
    begin
      //gfix -sweep localhost:c:\dados\meubanco.fdb -user sysdba -password masterkey
      var gfix := 'C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe';
      if not FileExists(gfix) then
        gfix := 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\gfix.exe';

      if FileExists(gfix) then
        CreateProcessSimple(Format('%s -sweep %s -user %s -password %s', [gfix, fdbFile,fdbUser, fdbPass]), True, False);
    end;    
  end;
end;

class function FirebirdDbUtil.CreateRestore(
  paramsList, bkFileName, fdbFileName: string;
  verbose: Boolean; log: TLogText): Boolean;
var
  res: TIBRestoreService;
begin
  var splitStr := Copy(paramsList, 1, 1);
  var params := NewStringList(Copy(paramsList, 2, Length(paramsList)), splitStr);

  var gbak := 'C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe';
    if not FileExists(gbak) then
      gbak := 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\gbak.exe';

//  CreateProcessSimple(Format('%s -r %s -p 8192 "%s" "%s" -user %s -password %s',
//                             [gbak, IfThen(verbose, '-v'), bkFileName, fdbFileName, params.Values['userName'], params.Values['passWord']]), True, False);

  var fsize := 0.0;
  var dDisplay := 'KB';

  var lastsize := '';
  var cmd := Format('%s -r %s -p 8192 "%s" "%s" -user %s -password %s',
                    [gbak, IfThen(verbose, '-v'), bkFileName, fdbFileName, params.Values['userName'], params.Values['passWord']]);
  var run := RunGBAK.Create(True);
  try
    run.cmd := cmd;
    run.verbose := verbose;

    log('Criando arquivo');
    run.Start;
    while not run.Finished do
    begin
      Application.ProcessMessages;

      if FileExists(fdbFileName) then
      begin
        fsize := FileSizeB(fdbFileName);
        if IntToStr(Trunc(fsize)) <> lastsize then
        begin
          lastsize := IntToStr(Trunc(fsize));
          if fsize >= Power(1024, 3) then
            dDisplay := Format('%n GB', [fsize / Power(1024, 3)])
          else if fsize >= Power(1024, 2)  then
            dDisplay := Format('%n MB', [fsize / Power(1024, 2)])
          else
            dDisplay := Format('%n KB', [fsize / (1024)]);
          log('Tamanho do arquivo ' + dDisplay, True);
        end;
      end;
    end;
    run.Terminate;
    while not run.Terminated do
      Sleep(500);

  finally
    run.Free;
  end;

  if FileExists(fdbFileName) then
  begin
    Result := True;
    exit;
  end;

  res := TIBRestoreService.Create(nil);
  try
    res.Protocol := TCP;
    res.LoginPrompt := False;
    res.Verbose := verbose;
    res.ServerName := '127.0.01';
    res.DatabaseName.Text := fdbFileName;
    //    res.Options := [];
    res.Params.Values['user_name'] := params.Values['userName'];
    res.Params.Values['password'] := params.Values['passWord'];

    res.BackupFile.Clear;
    res.BackupFile.Add(bkFileName);

    res.Active := True;
    res.ServiceStart;
    if res.Verbose then
    begin
      While not res.Eof do
      begin
        Application.ProcessMessages;
        log(res.GetNextLine);
      end;
    end
    else
      while res.IsServiceRunning do
        Application.ProcessMessages;
    res.Active := False;

  finally
    res.Free;
      ProgressUtil.Terminate;
  end;
end;

class function FirebirdDbUtil.SetStatistics(paramsList: string;
  log: TLogText): Boolean;
begin
  var con := TConexao.Create();
  try
    con.ConfigureStr(paramsList);

    var err := '';
    if not con.conectar(err) then
    begin
      log('Não foi possivel fazer a otimização de indices. Erro -> %s' + err);
      Exit;
    end;
    log('Otimizando indices..');

    var indexName := '';  

    con.Client.ClientOpen('select rdb$index_name index_name' +
                          ' from RDB$INDICES' +
                          ' where coalesce(rdb$system_flag, 0) = 0 and coalesce(rdb$index_inactive, 0) = 0');
    con.Client.Last.First;
    while not con.Client.Eof do
    begin
      Application.ProcessMessages;
      indexName :=  con.Client.fstr('index_name');
        
      log(Format('Otimizando indices - %f%% - %s', [con.Client.DataSet.RecNo / con.Client.DataSet.RecordCount * 100, indexName]), True);

      try
        con.SqlExec('SET STATISTICS INDEX "%s"', [indexName]);
      except on E: Exception do
        begin
          log(Format('Indice %s - Erro %s', [indexName, E.Message]), True);
      
          log(Format('Otimizando indices - %s - %f %%', [indexName, con.Client.DataSet.RecNo / con.Client.DataSet.RecordCount * 100]));
        end;
      end;
    
      con.Client.Next;
    end;

    log('Otimizando indices - 100%', True);

    if con.Transacao.InTransaction then
      con.Transacao.Commit;

  finally
    con.desconectar;
    con.Banco.ForceClose;
    con.Free;
  end;
end;

{ RunGBAK }

procedure RunGBAK.Execute;
begin
  inherited;

  CreateProcessSimple(Fcmd, True, True);
end;

end.
