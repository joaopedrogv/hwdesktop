unit uClassesConfigWS;

interface

uses
	uDataSet_OOP, uDtmAtivo, DBClient, IBDatabase, IBQuery, UDtmConfig, Windows,
  Forms, DBCtrls, SysUtils, DB, StdCtrls, Classes, CheckLst, Controls, Graphics, DBGrids,
  ComCtrls;

type
  RConsulta = record
    vSqlAdicional: AnsiString;
    vDataIni, vDataIniAd, vDataFim, vDataFimAd, vCondicao, vCondicaoAd, vCampo, vCampoAd, vValor, vValorAd: string;
    vPorData, vAdicional, vPorDataAd: boolean;
  end;

  TSchemasScript = class(TDataSet_OOP)
  private
  public
    function _abreFormScripts(vNomeSchema, vUser, vScript, vErro: string): boolean;
  	function abreSchema: boolean;
    procedure verificarSchema;
    constructor create;
    function salvarDadosScript(vNomeSchema, vUser, vSql, vStatus, vErro: string): boolean;
  var
  	vCodScript: Integer;  
  end;

  TSchemasWs = class(TDataSet_OOP)
  private
  public
  	function abreSchema: boolean;
    constructor create;
  end;

  TConsultasWs = class(TDataSet_OOP)
  private
  public
    procedure visualizarWS(Tipoform: Integer);
  	constructor create;
    function _defineSqlAdicional: boolean;
  var
    rConsulta: RConsulta;
  end;

  TDependenciaWs = class(TDataSet_OOP)
  private
  public
    function incluirTabela(pNomeTab1, pNomeTab2, pCampoCod1, pCampoCod2, pCampoDesc1, pCampoDesc2: string): boolean;
    function excluirTabela: boolean;
    function abreCadastros: boolean;
    function _abreFormDependencia: boolean;
    constructor create;
  end;

  TCadastrosBasWs = class(TDataSet_OOP)
  private
  public
    function incluirTabela(pNomeTab, pCamposChave, pCamposPesquisa: string): boolean;
    function excluirTabela: boolean;
    function abreCadastros: boolean;
    procedure abreTabelasBD(vcomb: TCombobox);
    procedure abreCamposBD(pNomeTab: string; vcomb: TCombobox);
    function _abreFormCadastrosBasicos: boolean;
  	constructor create;
  end;

  TReplicacoesWS = class(TDataSet_OOP)
  private
  public
  	fTempReplicoes: TClientDataSet;
    fTempReplicoesDtSource: TDataSource;
    function abreReplicacoes: boolean;
	  function _abreFormReplicacaPendentes: boolean;
    function _concluirReplicacao: boolean;
    function _demarcarReplicacao: boolean;
    constructor create;
  end;

  TScriptWS = class(TDataSet_OOP)
  private
    cbsEllipsis: TObject;
  public
    function abreScript: boolean;
    constructor create;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function verificaDestino(vcomb: TDbCombobox): boolean;
    function executarScript: boolean;
  end;

  TTabelasBD = class(TDataSet_OOP)
  private
  public
    function incluirTabela(pNomeTab: string): boolean;
    function excluirTabela: boolean;
    function _abreFormTabelaNaoReplicadas: boolean;
    procedure abreTabelasBD(vcomb: TCombobox);
    function abreTabelas: boolean;
		constructor create;
  end;

  TCamposWs = class(TDataSet_OOP)
  private
  public
    function abreCampos(pCodSchema, pCodEmpresa: Integer; pNomeTab: string = ''): boolean;
    function atualizarCampos(datasetEmpresa: TClientDataSet; pCodSchema: Integer; pNomeTab: string; pSomenteEmp: boolean = false): boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    constructor create;
  end;

  TTabelasWs = class(TDataSet_OOP)
  private
    destructor destroy; override;
  public
    function _abreFormListaTabela(pCodSchema, pEmpresa: Integer; pSchema: string): boolean;
    function _abreFormTabela: boolean;
    function abreTabelas(pCodSchema, pCodEmpresa: Integer; pSchema: string): boolean;
    function atualizarTabelas(datasetEmpresa: TClientDataSet; pCodSchema: Integer): boolean;
    procedure _marcaDesmarcaLinha;
 	 constructor create;
  var
	  vCampos: TCamposWs;
  end;

  TEmpresaAux = class(TDataSet_OOP)
  private
    destructor destroy; override;
  public
    function abreEmpresas(pCodSchema: Integer): boolean;
    function atualizarEmpresa(pCodSchema: Integer): boolean;
    function _marcaDesmarcaLinha: boolean;
	 constructor create;
  var
    vTabelas: TTabelasWs;
  end;

  TLogWs = class(TDataSet_OOP)
  private
  public
    constructor create;
    function verificaConexao: boolean;
    function lerLog(pMemo: TMemo; pMemoGeral: TMemo; pToken: string; pTipo: string = 'L'): Boolean;
    function atualizarConsultaLog(pToken: string): Boolean;
    function buscarSchemas: boolean;
  end;

  TConfigAPItipocliente = class(TDataSet_OOP)
  public
    constructor create;
    function abreTipoCliente: boolean;
  end;

  TConfigAPIcondpag = class(TDataSet_OOP)
  public
    constructor create;
    function abreCondPag: boolean;
  end;

  TConfigAPIvendedor = class(TDataSet_OOP)
  public
    constructor create;
    function abreVendedor: boolean;
  end;

  TConfigAPIpromocao = class(TDataSet_OOP)
  public
    constructor create;
    function abrePromocao: boolean;
  end;

  TConfigAPIpromocaoOrdem = class(TDataSet_OOP)
  public
    constructor create;
    function abrePromocaoOrdem(pTipo: string): boolean;
  end;

  TConfigAPIcollectionsRag = class(TDataSet_OOP)
  public
    constructor create;
    function abreCollectionsRag: boolean;
    function post: boolean; override;
    function Insert: boolean; override;
    function Delete: boolean; override;
  end;

  TConfigAPItabela = class(TDataSet_OOP)
  public
    constructor create;
    function abreTabela: boolean;
  end;

  TMsgPlataforma = class(TDataSet_OOP)
  public
    constructor create;
    function abreMsgPlataforma: boolean;
  end;

  TTipoContato = class(TDataSet_OOP)
  public
  	constructor create;
    function abreTipoContato: boolean;
  end;

  TMsgOrigem = class(TDataSet_OOP)
  public
  	constructor create;
    function abreOrigem: boolean;
  end;

  TModCartas = class(TDataSet_OOP)
  public
  	constructor create;
    function abreModCartas(pCodCarta: Integer): boolean;
  end;

  TAbreMsgPlataforma = class(TDataSet_OOP)
  public
  	constructor create;
    function abreMsgPlataforma: boolean; overload;
  end;

  TAbreMsgTipoContatoOrigem = class(TDataSet_OOP)
  public
  	constructor create;
    function AbreMsgTipoContatoOrigem: boolean; overload;
  end;

  TMsgTipoContatoOrigem = class(TDataSet_OOP)
  public
  	constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete(pPerguntar: Boolean = True): boolean;
    function abreMsgTipoContatoOrigem: boolean; overload;
    function abreMsgTipoContatoOrigem(pIdTipoContato: Integer; pOrigem: Integer): boolean; overload;
    procedure InserirTipoContrato(pCheckListBoxTipoContrato: TCheckListBox);
    procedure InserirOrigem(pCheckListBoxOrigem: TCheckListBox);
    function abreFormMsgTipoContatoLote: boolean;
    function PostMsgTipoContatoOrigemLote: boolean;
    procedure cadMsgTipoContatoOrigem(Tipoform: Integer);
    function _defineSqlAdicional: boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
  	rCons: RConsulta;
    TipoContato: TTipoContato;
    Origem: TMsgOrigem;
  end;

  TMsgTipoContatoOrigemPlataforma = class(TDataSet_OOP)
  public
  	 constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete(pPerguntar: Boolean = True): boolean;
    function abreMsgTipoContatoOrigemPlataforma: boolean; overload;
    function abreMsgTipoContatoOrigemPlataforma(pIdPlataforma: Integer; pIdOrigemTipoContato: Integer): boolean; overload;
    procedure InserirOrigemTipoContrato(pCheckListBoxOrigemTipoContrato: TCheckListBox);
    procedure InserirPlataforma(pCheckListBoxPlataforma: TCheckListBox);
    function abreFormMsgTipoContatoOrigemPlataformaLote: boolean;
    function PostMsgTipoContatoOrigemPlataformaLote: boolean;
    procedure cadMsgTipoContatoOrigemPlataforma(Tipoform: Integer);
    function MsgTipoContatoOrigemPlataforma: boolean;
    function _defineSqlAdicional: boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
  	rCons: RConsulta;
    Plataforma: TAbreMsgPlataforma;
    TipoContatoOrigem: TAbreMsgTipoContatoOrigem;
  end;

  TMsgOrigemModCartas = class(TDataSet_OOP)
  public
  	 constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete(pPerguntar: Boolean = True): boolean;
    function abreMsgOrigemModCartas: boolean; overload;
    function abreMsgOrigemModCartas(pCodCarta: Integer; pOrigem: Integer): boolean; overload;
    procedure InserirModCartas(pCheckListBoxModcartas: TCheckListBox);
    procedure InserirOrigem(pCheckListBoxOrigem: TCheckListBox);
    function abreFormMsgOrigemModCartasLote: boolean;
    function PostMsgOrigemModCartasLote: boolean;
    procedure cadMsgOrigemModCartas(Tipoform: Integer);
    function _defineSqlAdicional: boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
  	 rCons: RConsulta;
    ModCartas: TModCartas;
    Origem: TMsgOrigem;
  end;

  TConfigAPI = class(TDataSet_OOP)
  private
    destructor destroy; override;
    procedure dataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor create;
    function insert: Boolean;
    function edit: Boolean;
    function delete: Boolean;
    function post: Boolean;
    function abreFormOpcoes: boolean;
  	 procedure cadConfigAPI(Tipoform: Integer);
    function buscarTipoCliente(pCodigo: Integer): boolean;
    function buscarVendedor(pCodigo: Integer): boolean;
    function buscarCondPag(pCodigo: Integer): boolean;
    function buscarColaboradorVendedor(pCodigo: Integer): boolean;
    function buscarPromocao(pCodigo: Integer): boolean;
    function buscarTabela(pCodigo: Integer): boolean;
    function buscarTipoVenda(pTipo: string; pSigla: string): boolean;
    function addItemTreeViewPromocaoDB(pTipo: string; pTreeView: TTreeView; pTreeView2: TTreeView; pPromocao: string): boolean;
    function deleteItemTreeViewPromocaoDB(pTipo: string; pTreeView: TTreeView; pPromocao: string): boolean;
    function setarTab(pTipo: string; pCeCi: string; pTreeView: TTreeView; pTreeView2: TTreeView; pPromocao: string): boolean;
    procedure montarTreeViewPromocaoDB(pTipo: string; pTreeView, pTreeView2: TTreeView);
    procedure montarAmbiente(DbCombobox: TDBComboBox; cgc_emp: string);
    procedure montarTipoREQ(DbCombobox: TDBComboBox);
    procedure montarTipoOS(DbCombobox: TDBComboBox);
  var
    vMsgPlataforma: TMsgPlataforma;
    vConfigAPIcondpag: TConfigAPIcondpag;
    vConfigAPIvendedor: TConfigAPIvendedor;
    vConfigAPIpromocao: TConfigAPIpromocao;
    vConfigAPItabela: TConfigAPItabela;
    vConfigAPItipocliente: TConfigAPItipocliente;
    vConfigAPIpromocaoOrdem: TConfigAPIpromocaoOrdem;
    vConfigAPIcollectionsRag: TConfigAPIcollectionsRag;
    vcodcondpag, vcodvendedor, vcodtipocliente, vcodpromocao, vcodtabela: Integer;
    vUrlNummus: string;
    vApiKeyNummus: string;
    vClientIdNummus: string;
    vUrlKentro: string;
    vPasswordKentro: string;
    vQueuedIdKentro: string;
    vAmbiente: string;
    vUserId: string;
    vUserIdOld: string;
    vCodTabelaOld: Integer;
  end;

  TConfigWS = class(TDataSet_OOP)
  private
    destructor destroy; override;
  public
    buscasEmpV: TIBQuery;
  	function insert: Boolean;
    function edit: Boolean;
    function delete: Boolean;
    function post: Boolean;
    function abrelixeira: boolean;
    function restauralixeira: boolean;
    function statuslixeira: boolean;
    function abreConfigWs: boolean; overload;
    function abreConfigWs(pCodigo: Integer): boolean; overload;
    procedure cadConfigWS(Tipoform: Integer);
    function existeToken: boolean;
    function existeSchema: boolean;
    function existeSchemaEspelhado: boolean;
    function buscarSchemaVinculados(buscasTemp: TIBQuery): boolean;
    constructor create;
    procedure atualizarTabela(pTodos: string = 'N');
    function colarConf(pColarSchema: string = 'N'; pClonar: string = 'N'; pGravarProcess: string = 'S'): boolean;
    function clonarSchema: boolean;
    procedure _retornarIndice(pIndex: string);
  var
  	vEmpresa: TEmpresaAux;
    vIdentificacao: string;
    vCodSchema, vCodEmpresa, vAtivo: Integer;
  end;

var
  vConfigWS: TConfigWS;
  vConsultasWs: TConsultasWs;
  vLogWs: TLogWs;
  vTabelasBD: TTabelasBD;
  vCadastrosBasWs: TCadastrosBasWs;
  vDependenciaWs: TDependenciaWs;
  vReplicacoes: TReplicacoesWS;
  vScript: TScriptWS;
  vSchema: TSchemasWs;
  vSchemaScript: TSchemasScript;

implementation

uses uCadConfigWS, uDadosIni, uPadrao, uVisualizarWS, uCadConfigAPI, hw_utils, StrUtils, Variants, 
  uTipoContatoOrigem, uTipoContatoOrigemPlataforma, uModeloCartasOrigem;

procedure plugboleto_cedente(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
procedure suzuki_autenticacao(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
function _strImagetoBase64(FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';

function hwc_cad_empresa(AparamsList: WideString; Aativo: Integer; Atipoop: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';

{ TConfigWS }

function TConfigWS.abreConfigWs: boolean;
begin
  Result := montaSelect(' SELECT * FROM WSR_SCHEMAS ' +
   ' WHERE COD_EMPRESA=' + vDadosIni.codEmpresa + ' AND COD_SCHEMA = 0 AND ATIVO = 1');
  Result := not dataSet.IsEmpty;
end;

function TConfigWS.abreConfigWs(pCodigo: Integer): boolean;
begin
  Result := montaSelect(' SELECT * FROM WSR_SCHEMAS ' +
   ' WHERE COD_SCHEMA = ' + IntToStr(pCodigo) + '  AND ATIVO = 1');
  Result := not dataSet.IsEmpty;
end;

function TConfigWS.abrelixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    result := false;
  end
  else
    result :=
      montaSelect('SELECT * FROM WSR_SCHEMAS ' +
       ' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 0');

end;

procedure TConfigWS.atualizarTabela(pTodos: string = 'N');
begin
  buscas.Close;
//  if trim(pTodos) = 'S' then
	buscas.SQL.Text := ' UPDATE WSR_TABELAS SET DATA = CURRENT_TIMESTAMP ' +
  	' WHERE ATIVO = 1 ';
//  else
//     buscas.SQL.Text := ' UPDATE WSR_TABELAS SET DATA = CURRENT_TIMESTAMP ' +
//       ' WHERE ATIVO = 1 ' +
//       ' AND COD_SCHEMA = :COD_SCHEMA ';
//  if trim(pTodos) <> 'S' then
//     buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').asInteger;
  buscas.ExecSQL;

  buscas.Close;
  buscas.SQL.Text := ' UPDATE EMPRESA_FISICA SET DATA_CONFIG_WS = NULL ';
  buscas.ExecSQL;

  if transacao.InTransaction then
  	transacao.Commit;
end;

function TConfigWS.buscarSchemaVinculados(buscasTemp: TIBQuery): boolean;
begin
 try
    buscasTemp.Close;
    buscasTemp.SQL.Text := ' SELECT COD_SCHEMA FROM WSR_SCHEMAS ' +
    	' WHERE COD_SCHEMA_ESP = :COD_SCHEMA AND ATIVO = 1';
    buscasTemp.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
    buscasTemp.Open;
    buscasTemp.FetchAll;

    Result := not buscasTemp.IsEmpty;
  except on E: Exception do
  begin
    Result := False;
  	Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

procedure TConfigWS.cadConfigWS(Tipoform: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Configuração do wsReplicação');

    vDadosIni.vTipoForm := 0;
    if dtmConfig = nil then
      dtmConfig := TdtmConfig.Create(dtmConfig);
      
    if not vDadosIni.PesqPros('CWS001', 'CONSULTA', '', 'WSR_SCHEMAS', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmCadConfigWS = nil then
      Application.CreateForm(TfrmCadConfigWS, frmCadConfigWS);
      
    if (TipoForm > 0) and (not frmCadConfigWS.Visible) then
      frmCadConfigWS.ShowModal
    else if (not frmCadConfigWS.Visible) then
      frmCadConfigWS.Show
    else if frmCadConfigWS.FormStyle = fsMDIChild then
      frmCadConfigWS.Show
    else
      frmCadConfigWS.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;


function TConfigWS.clonarSchema: boolean;
var
	buscas2: TIBQuery;
  I, vCodSchemaTemp: Integer;
begin
	try
    Result := True;
    
    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := ' SELECT FIRST 1 * FROM WSR_SCHEMAS ' +
      ' WHERE COD_SCHEMA = :COD_SCHEMA ';
    buscas2.ParamByName('COD_SCHEMA').AsInteger := vCodSchema;
    buscas2.Open;

    buscas2.First;
    while not buscas2.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := 'UPDATE OR INSERT INTO WSR_SCHEMAS (';
      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.SQL.Text := buscas.SQL.Text + buscas2.FieldDefs[i].Name + ',';
      buscas.SQL.Text := Copy(trim(buscas.SQL.Text), 1, Length(trim(buscas.SQL.Text)) - 1) + ') VALUES (';
      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.SQL.Text := buscas.SQL.Text + ':' + buscas2.FieldDefs[i].Name + ',';
      buscas.SQL.Text := Copy(trim(buscas.SQL.Text), 1, Length(trim(buscas.SQL.Text)) - 1) +
        ') MATCHING (COD_SCHEMA, COD_EMPRESA); ';

      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.ParamByName(buscas2.FieldDefs[i].Name).Value := buscas2.FieldByName(buscas2.FieldDefs[i].Name).Value;
      vCodSchemaTemp := Gencodigo('WSR_SCHEMAS', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);
      buscas.ParamByName('COD_SCHEMA').AsInteger := vCodSchemaTemp;
      buscas.ParamByName('IDENTIFICACAO').AsString := buscas2.FieldByName('IDENTIFICACAO').AsString + '_COPY' + IntToStr(vCodSchemaTemp);
      buscas.ParamByName('TOKEN').AsString := buscas2.FieldByName('TOKEN').AsString + '_COPY' + IntToStr(vCodSchemaTemp);
      buscas.ExecSQL;

      buscas2.Next;
    end;
    CommitaTransacao;
  except on E: Exception do
  begin
     Result := false;
     vDadosIni.fechaStatusProcessamento;
     RollBackTransacao;
     Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 16);
     registraErro(e.Message);
  end;
  end;

  if Result then
  begin
    vConfigWS.abreConfigWs(vCodSchemaTemp);
	  colarConf('S', 'S');
    vConfigWS.vCodSchema := vCodSchemaTemp;
  end;
end;

function TConfigWS.colarConf(pColarSchema: string = 'N'; pClonar: string = 'N'; pGravarProcess: string = 'S'): boolean;
var
	buscas2: TIBQuery;
  I: Integer;
begin
  try
    Result := true;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    if pColarSchema = 'N' then
    begin
       vDadosIni.abreStatusProcessamento('','Atualizando empresa(s)');

       buscas.Close;
       buscas.SQL.Text := ' UPDATE OR INSERT INTO WSR_EMPRESAS (COD_EMPRESA, COD_SCHEMA, ATIVO) ' +
         ' VALUES (:COD_EMPRESA, :COD_SCHEMA, :ATIVO) MATCHING (COD_EMPRESA, COD_SCHEMA) ';
       buscas.ParamByName('COD_EMPRESA').AsInteger := vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger;
       buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
       buscas.ParamByName('ATIVO').AsInteger := vAtivo;
       buscas.ExecSQL;

       vDadosIni.fechaStatusProcessamento;
    end
    else
    begin
      vDadosIni.abreStatusProcessamento('','Atualizando empresa(s)');

      buscas2.Close;
      buscas2.SQL.Text := ' SELECT * FROM WSR_EMPRESAS ' +
        ' WHERE COD_SCHEMA = :COD_SCHEMA ';
      buscas2.ParamByName('COD_SCHEMA').AsInteger := vCodSchema;
      buscas2.Open;
      buscas2.FetchAll;

      buscas2.First;
      while not buscas2.Eof do
      begin
        buscas.Close;
        buscas.SQL.Text := ' UPDATE OR INSERT INTO WSR_EMPRESAS (COD_EMPRESA, COD_SCHEMA, ATIVO) ' +
          ' VALUES (:COD_EMPRESA, :COD_SCHEMA, :ATIVO) MATCHING (COD_EMPRESA, COD_SCHEMA) ';
        buscas.ParamByName('COD_EMPRESA').AsInteger := buscas2.FieldByName('COD_EMPRESA').AsInteger;
        buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
        buscas.ParamByName('ATIVO').AsInteger := buscas2.FieldByName('ATIVO').AsInteger;
        buscas.ExecSQL;

        buscas2.Next;
      end;
      vDadosIni.fechaStatusProcessamento;
    end;

    vDadosIni.abreStatusProcessamento('','Atualizando tabela(s)');

    buscas2.Close;
    buscas2.SQL.Text := ' DELETE FROM WSR_TABELAS ' +
      ' WHERE COD_SCHEMA = :COD_SCHEMA ';
    if pColarSchema = 'N' then
       buscas2.SQL.Text := buscas2.SQL.Text  +  ' AND COD_EMPRESA = :COD_EMPRESA ';
    buscas2.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
    if pColarSchema = 'N' then
       buscas2.ParamByName('COD_EMPRESA').AsInteger := vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas2.ExecSQL;

    buscas2.Close;
    buscas2.SQL.Text := ' SELECT * FROM WSR_TABELAS ' +
        ' WHERE COD_SCHEMA = :COD_SCHEMA ';
    if pColarSchema = 'N' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' AND COD_EMPRESA = :COD_EMPRESA ';
    buscas2.ParamByName('COD_SCHEMA').AsInteger := vCodSchema;
    if pColarSchema = 'N' then
	    buscas2.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
    buscas2.Open;
    buscas2.FetchAll;

    buscas2.First;
    while not buscas2.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := 'UPDATE OR INSERT INTO WSR_TABELAS (';
      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.SQL.Text := buscas.SQL.Text + buscas2.FieldDefs[i].Name + ',';
      buscas.SQL.Text := Copy(trim(buscas.SQL.Text), 1, Length(trim(buscas.SQL.Text)) - 1) + ') VALUES (';
      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.SQL.Text := buscas.SQL.Text + ':' + buscas2.FieldDefs[i].Name + ',';
      buscas.SQL.Text := Copy(trim(buscas.SQL.Text), 1, Length(trim(buscas.SQL.Text)) - 1) +
      	') MATCHING (NOME_TAB, COD_SCHEMA, COD_EMPRESA); ';

      for I := 0 to buscas2.FieldDefs.Count - 1 do
      	if trim(buscas2.FieldDefs[i].Name) <> 'DATA' then
	        buscas.ParamByName(buscas2.FieldDefs[i].Name).Value := buscas2.FieldByName(buscas2.FieldDefs[i].Name).Value;
          
      if pColarSchema = 'N' then
	      buscas.ParamByName('COD_EMPRESA').AsInteger := vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger
	    else
	      buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
      buscas.ExecSQL;

      buscas2.Next;
    end;
    vDadosIni.fechaStatusProcessamento;

    vDadosIni.abreStatusProcessamento('','Atualizando campo(s)');

    buscas2.Close;
   	buscas2.SQL.Text := ' DELETE FROM WSR_CAMPOS ' +
       ' WHERE COD_SCHEMA = :COD_SCHEMA ';
    if pColarSchema = 'N' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' AND COD_EMPRESA = :COD_EMPRESA ';
    buscas2.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
    if pColarSchema = 'N' then
    	buscas.ParamByName('COD_EMPRESA').AsInteger := vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas2.ExecSQL;

    buscas2.Close;
    buscas2.SQL.Text := ' SELECT * FROM WSR_CAMPOS ' +
      ' WHERE COD_SCHEMA = :COD_SCHEMA ';
    if pColarSchema = 'N' then
    	buscas2.SQL.Text := buscas2.SQL.Text + ' AND COD_EMPRESA = :COD_EMPRESA ';
    buscas2.ParamByName('COD_SCHEMA').AsInteger := vCodSchema;
    if pColarSchema = 'N' then
	    buscas2.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
    buscas2.Open;
    buscas2.FetchAll;

    buscas2.First;
    while not buscas2.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := 'UPDATE OR INSERT INTO WSR_CAMPOS (';
      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.SQL.Text := buscas.SQL.Text + buscas2.FieldDefs[i].Name + ',';
      buscas.SQL.Text := Copy(trim(buscas.SQL.Text), 1, Length(trim(buscas.SQL.Text)) - 1) + ') VALUES (';
      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.SQL.Text := buscas.SQL.Text + ':' + buscas2.FieldDefs[i].Name + ',';
      buscas.SQL.Text := Copy(trim(buscas.SQL.Text), 1, Length(trim(buscas.SQL.Text)) - 1) +
      	') MATCHING (NOME_TAB, CAMPO, COD_SCHEMA, COD_EMPRESA); ';
                                                               
      for I := 0 to buscas2.FieldDefs.Count - 1 do
        buscas.ParamByName(buscas2.FieldDefs[i].Name).Value := buscas2.FieldByName(buscas2.FieldDefs[i].Name).Value;
      if pColarSchema = 'N' then
	      buscas.ParamByName('COD_EMPRESA').AsInteger := vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger
      else
	      buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;  
      buscas.ExecSQL;

      buscas2.Next;
    end;
    vDadosIni.fechaStatusProcessamento;

//    CommitaTransacao;
    if pGravarProcess = 'S' then
    begin
      if pClonar = 'S' then
        vDadosIni.GravaAuditoria('CWS027', 'CLONAR', 'SUCESSO - CLONAR SCHEMA ANT: ' + IntToStr(vCodSchema) + '  SCHEMA ATUAL: ' + IntToStr(dataSet.FieldByName('COD_SCHEMA').AsInteger), 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas)
      else
      begin
        if pColarSchema = 'N' then
        vDadosIni.GravaAuditoria('CWS019', 'COLAR', 'SUCESSO - COPIOU EMPRESA: ' + IntToStr(vCodEmpresa) + ' COLOU EMPRESA: ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger), 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas)
      else
        vDadosIni.GravaAuditoria('CWS023', 'COLAR', 'SUCESSO - COPIOU SCHEMA: ' + IntToStr(vCodSchema) + '  COLOU SCHEMA: ' + IntToStr(dataSet.FieldByName('COD_SCHEMA').AsInteger), 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas);
      end;
    end;

  except on E: Exception do
  begin
     Result := false;
     vDadosIni.fechaStatusProcessamento;
     if pGravarProcess = 'S' then
     begin
       if pClonar = 'S' then
         vDadosIni.GravaAuditoria('CWS027', 'CLONAR', 'FALHA - CLONAR SCHEMA ANT: ' + IntToStr(vCodSchema) + '  SCHEMA ATUAL: ' + IntToStr(dataSet.FieldByName('COD_SCHEMA').AsInteger), 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas)
       else
       begin
         if pColarSchema = 'N' then
           vDadosIni.GravaAuditoria('CWS019', 'COLAR', 'FALHA - COPIOU EMPRESA: ' + IntToStr(vCodEmpresa) + ' COLOU EMPRESA: ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger), 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas)
         else
           vDadosIni.GravaAuditoria('CWS023', 'COLAR', 'FALHA - COPIOU SCHEMA: ' + IntToStr(vCodSchema) + ' COLOU SCHEMA: ' + IntToStr(dataSet.FieldByName('COD_SCHEMA').AsInteger), 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas);
       end;
     end;
     RollBackTransacao;
     Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 16);
     registraErro(e.Message);
  end;
  end;
end;



constructor TConfigWS.create;
begin
	dataset := TClientDataSet(dtmConfig.cdswsSchema);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  buscasEmpV := TIBQuery.Create(Application);
  buscasEmpV.Database := buscas.Database;
  buscasEmpV.Transaction := buscas.Transaction;

  vEmpresa := TEmpresaAux.Create;
end;

function TConfigWS.delete: Boolean;
var
  codigo: string;
begin
  if dataSet.IsEmpty then
    exit;

  codigo := dataSet.FieldByName('COD_SCHEMA').AsString;

  if dataSet.FieldByName('ATIVO').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      result := inherited Delete;
      if Result then
        result := Apply;
      if result then
        result := CommitaTransacao;
      if Result then
        vDadosIni.GravaAuditoria('CWS002', 'EXCLUIR', 'SUCESSO', 'WSR_SCHEMAS', codigo, buscas)
      else
        vDadosIni.GravaAuditoria('CWS002', 'EXCLUIR', 'FALHA', 'WSR_SCHEMAS', codigo, buscas);
      Refresh;  
    end;
  end
  else
    if Application.MessageBox('Tem certeza que deseja mover este arquivo para a Lixeira ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      dataSet.Edit;
      if dataSet.State = dsEdit then
      begin
        dataSet.FieldByName('ATIVO').asString := '0';
        dataSet.Post;
        Result := Apply;
        if Result then
	        Result := CommitaTransacao;
        if Result then
          vDadosIni.GravaAuditoria('CWS007', 'ENVIAR REGISTRO PARA A LIXEIRA', 'SUCESSO', 'WSR_SCHEMAS', codigo, buscas)
        else
          vDadosIni.GravaAuditoria('CWS007', 'ENVIAR REGISTRO PARA A LIXEIRA ', 'FALHA', 'WSR_SCHEMAS', codigo, buscas);
      end;
      Refresh;
    end;
end;

destructor TConfigWS.destroy;
begin
  vEmpresa.Free;
  vEmpresa := nil;

  inherited;
end;

function TConfigWS.edit: Boolean;
begin
	try
  	Result := False;

    if (dataSet.IsEmpty) then
      Exit;

    if not vDadosIni.PesqPros('CWS003', 'ALTERAR', '', 'WSR_SCHEMAS', dataSet.FieldByName('COD_EMPRESA').AsString, buscas, False) then
      Exit;

		vEmpresa.abreEmpresas(dataSet.FieldByName('COD_SCHEMA').AsInteger);

    Result := inherited edit;

    if not Result then
    	exit;

    if dataSet.FieldByName('MATRIZ_FILIAL').IsNull then
	    dataSet.FieldByName('MATRIZ_FILIAL').AsString := 'N';

  except on E: Exception do
  begin  	
    Result := False;
  	Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);    
  end;  
  end;
end;

function TConfigWS.existeSchema: boolean;
begin
 try
    buscas.Close;
    buscas.SQL.Text := ' SELECT COD_SCHEMA FROM WSR_SCHEMAS ' +
    	' WHERE COD_SCHEMA = :COD_SCHEMA AND ATIVO = 1';
    buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger;
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
  begin
    Result := False;
  	Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TConfigWS.existeSchemaEspelhado: boolean;
begin
  try
    Result := true;
    
    if dataSet.State <> dsEdit then
    	exit;
      
    buscas.Close;
    buscas.SQL.Text := ' SELECT COD_SCHEMA FROM WSR_SCHEMAS ' +
    	' WHERE COD_SCHEMA_ESP = :COD_SCHEMA AND ATIVO = 1';
    buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
    buscas.Open;

    Result := buscas.IsEmpty;
  except on E: Exception do
  begin
    Result := False;
  	Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TConfigWS.existeToken: boolean;
begin
	try
    buscas.Close;
    buscas.SQL.Text := 'SELECT TOKEN FROM WSR_SCHEMAS WHERE TOKEN = :TOKEN AND COD_SCHEMA <> :COD_SCHEMA';
    buscas.ParamByName('TOKEN').AsString := dataSet.FieldByName('TOKEN').AsString;
    buscas.ParamByName('COD_SCHEMA').AsInteger := dataSet.FieldByName('COD_SCHEMA').AsInteger;
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
  begin
    Result := False;
  	Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TConfigWS.insert: Boolean;
begin
	try
    Result := False;

    if not vDadosIni.PesqPros('CWS004', 'INCLUIR', '', 'WSR_SCHEMAS', '', buscas, False) then
      Exit;

    if (not dataSet.Active) then
      montaSelect('SELECT * FROM WSR_SCHEMAS WHERE ATIVO = 0');

    Result := inherited insert;

    if (not Result) then
    	Exit;

    dataSet.FieldByName('SCHEMA_REPLICACAO').AsString := 'M';
    dataSet.FieldByName('MATRIZ_FILIAL').AsString := 'N';

    vEmpresa.abreEmpresas(dataSet.FieldByName('COD_SCHEMA').AsInteger);
//    if vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0 then
//	    vEmpresa.vTabelas.abreTabelas(dataSet.FieldByName('COD_SCHEMA').AsInteger, vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger);

  except on E: Exception do
  begin
    Result := False;
  	Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TConfigWS.post: Boolean;
var
  acao: string;
begin
	try
		if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if (dataSet.FieldByName('MATRIZ_FILIAL').AsString <> 'N')
    	and (dataSet.FieldByName('MATRIZ_FILIAL').AsString <> 'S') then
	    dataSet.FieldByName('MATRIZ_FILIAL').AsString := 'N';

    dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('ATIVO').AsInteger := 1;

    if trim(dataSet.FieldByName('TOKEN').AsString) = '' then
      raiseExceptionCreate('Token de acesso deve ser informado!', 'DBEdit2');

    if (existeToken) then
		raiseExceptionCreate('Token de acesso já existe para outra empresa!', 'edtToken');

    if trim(dataSet.FieldByName('SCHEMA_REPLICACAO').AsString) = '' then
      raiseExceptionCreate('Tipo do schema deve ser informado!', 'DBComboBox1');

    if (trim(dataSet.FieldByName('SCHEMA_REPLICACAO').AsString) <> 'M')
     and (trim(dataSet.FieldByName('SCHEMA_REPLICACAO').AsString) <> 'A') then
      raiseExceptionCreate('Tipo do schema incorreto!', 'DBComboBox1');

    if dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger > 0 then
      if not (existeSchemaEspelhado) then
        raiseExceptionCreate('Schema utlizado para configurar outros schemas, não é possível informar o código do schema base!', 'DBEdit5');

    if dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger > 0 then
      if dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger = dataSet.FieldByName('COD_SCHEMA').AsInteger then
       	raiseExceptionCreate('Código do schema deve ser diferente do código do schema base!', 'DBEdit5');

    if dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger > 0 then
	    if not (existeSchema) then
				raiseExceptionCreate('Código do schema base ' + IntToStr(dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger) +
    	  ' não encontrado ou se encontra na lixeira!', 'DBEdit5');

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_SCHEMA').asInteger := Gencodigo('WSR_SCHEMAS', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);

    inherited Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CWS005', acao, 'SUCESSO', 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas);
//			Refresh;
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CWS005', acao, 'FALHA', 'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas);
//			Refresh;
    end;
  except on E: Exception do
  begin
    Result := False;
  	 Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TConfigWS.restauralixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        dataSet.Edit;
        if dataSet.State = dsEdit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          dataSet.Post;
          Result := Apply;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('CWS009', 'RESTAURAR REGISTRO', 'SUCESSO',
              'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('CWS009', 'RESTAURAR REGISTRO', 'FALHA',
              'WSR_SCHEMAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas);
        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) +
        'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
  Refresh;
end;

function TConfigWS.statuslixeira: boolean;
begin
  Result := ExecutaComandosSql('SELECT FIRST 1 COD_SCHEMA FROM WSR_SCHEMAS ' +
    ' WHERE ATIVO = 0 AND COD_EMPRESA = ' +  vDadosIni.codEmpresa);
end;

procedure TConfigWS._retornarIndice(pIndex: string);
var
  vInd: string;
begin
  Vind := '';
  dataSet.IndexDefs.Clear;
  while pos('IDX$', pIndex) > 0 do
  begin
    if pos('IDX$D', pIndex) > 0 then
    begin
      pIndex := Copy(pIndex, 6, Length(pIndex));
      dataSet.IndexDefs.Add(pIndex, pIndex, [ixDescending]);
    end;
    if pos('IDX$A', pIndex) > 0 then
    begin
      pIndex := Copy(pIndex, 6, Length(pIndex));
      dataSet.IndexDefs.Add(pIndex, pIndex, []);
    end;
    vInd := 'S';
  end;

  try
    if vInd = 'S' then
      dataSet.IndexName := pIndex;
  except
  end;
end;

{ TEmpresaAux }

function TEmpresaAux.abreEmpresas(pCodSchema: Integer): boolean;
begin
	Result := montaSelect(' SELECT EMP.COD_EMPRESA, (EMP.COD_EMPRESA||'' - ''||EMP.IDENTIFICACAO_EMP) IDENTIFICACAO_EMP, ' +
	 ' CASE WHEN (S.ATIVO = 1) THEN S.COD_SCHEMA ELSE 0 END COD_SCHEMA, ' + IntToStr(pCodSchema) + ' CODSCHEMA, ' +
    ' CASE WHEN (SH.SCHEMA_REPLICACAO = ''A'') THEN ''A'' ELSE ''M'' END SCHEMA_REPLICACAO FROM EMPRESA EMP ' +
	 ' LEFT JOIN WSR_EMPRESAS S ON S.COD_SCHEMA =  ' + IntToStr(pCodSchema) + ' AND S.COD_EMPRESA = EMP.COD_EMPRESA ' +
    ' LEFT JOIN WSR_SCHEMAS SH ON SH.COD_SCHEMA = S.COD_SCHEMA ' +
	 ' ORDER BY EMP.COD_EMPRESA ');

  try
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if (dataSet.FieldByName('COD_SCHEMA').AsInteger > 0) then
      begin
        dataSet.Edit;
        dataSet.FieldByName('SEL').AsString := 'S';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.First;
  finally
    dataSet.EnableControls;
  end;
end;

function TEmpresaAux.atualizarEmpresa(pCodSchema: Integer): boolean;
var
  buscas2: TIBQuery;
begin
  try
    Result := False;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    try
      vDadosIni.abreStatusProcessamento('','Atualizando empresa(s)');

      dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        vDadosIni.abreStatusProcessamento('','Atualizando empresa: ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger));
        if not vDadosIni.PesqPros('CWS022', 'SALVAR - EMPRESA ' + dataSet.FieldByName('COD_EMPRESA').AsString +
            ' SCHEMA ' + IntToStr(pCodSchema), '', 'WSR_TABELAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas2, true) then
          exit;

        buscas.Close;
        buscas.SQL.Text := 'UPDATE OR INSERT INTO WSR_EMPRESAS (COD_EMPRESA, COD_SCHEMA, ATIVO, ORDEM) ' +
          ' VALUES (:COD_EMPRESA, :COD_SCHEMA, :ATIVO, :ORDEM) ' +
          ' MATCHING  (COD_EMPRESA, COD_SCHEMA);';
        buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas.ParamByName('COD_SCHEMA').AsInteger := pCodSchema;
        if dataSet.FieldByName('SEL').AsString = 'S' then
          buscas.ParamByName('ATIVO').AsInteger := 1
        else
          buscas.ParamByName('ATIVO').AsInteger := 0;
        buscas.ParamByName('ORDEM').AsInteger := 0;
        buscas.ExecSQL;

        dataSet.Next;
      end;
      dataSet.First;
    finally
      dataSet.EnableControls;
      vDadosIni.fechaStatusProcessamento;
    end;

//    if transacao.InTransaction then
//    begin
//    	transacao.Commit;
//	    vDadosIni.GravaAuditoria('CWS022', 'SALVAR', 'SUCESSO', 'WSR_EMPRESAS', '', buscas);
//    end;

    Result := True;
  except on E: Exception do
  begin
    Result := False;
    Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
//    vDadosIni.GravaAuditoria('CWS022', 'SALVAR', 'FALHA', 'WSR_EMPRESAS', '', buscas);
    registraErro(e.Message);
  end;
  end;
end;

constructor TEmpresaAux.create;
begin
	dataset := TClientDataSet(dtmConfig.cdswsEmpresas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  vTabelas := TTabelasWs.Create;
end;

destructor TEmpresaAux.destroy;
begin
  vTabelas.Free;
  vTabelas := nil;

  inherited;
end;

function TEmpresaAux._marcaDesmarcaLinha: boolean;
var
 vTemp: string;
 vProcesso: string;
begin
   Result := False;

   if dataSet.IsEmpty then
    exit;

   vTemp := 'REMOVER';
   vProcesso := 'CWS021';
   if dataSet.FieldByName('SEL').AsString = '' then
   begin
      vTemp := 'ADICIONAR';
      vProcesso := 'CWS020';
   end;

   if dataSet.FieldByName('SEL').AsString = '' then
   begin
     if Application.MessageBox(PChar('Deseja adicionar empresa ao schema de replicação?'),
       'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON2) <> mrYES then
     exit;
   end
   else
   begin
     if Application.MessageBox(PChar('Deseja remover empresa do schema de replicação?'),
       'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON2) <> mrYES then
     exit;
   end;

  if not vDadosIni.PesqPros(vProcesso, UpperCase(vTemp) + ' - EMPRESA ' + dataSet.FieldByName('COD_EMPRESA').AsString +
  ' SCHEMA ' + dataSet.FieldByName('COD_SCHEMA').AsString, '', 'WSR_EMPRESAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas, true) then
    Exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;

  Result := True;
end;

{ TTabelas }

function TTabelasWs.abreTabelas(pCodSchema, pCodEmpresa: Integer; pSchema: string): boolean;
var
 vSql: string;
 vListaEmp: TStringList;
 I: Integer;
begin
    vSql := ' SELECT DISTINCT ' +
      IntToStr(pCodEmpresa) + ' COD_EMPRESA, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN TRIM(T.NOME_TAB) ELSE TRIM(RC.RDB$RELATION_NAME) END NOME_TAB, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN TRIM(T.RECEBER) ELSE ''S'' END RECEBER, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN TRIM(T.ENVIAR) ELSE ''S'' END ENVIAR, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN TRIM(T.INSERIR) ELSE ''S'' END INSERIR, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN TRIM(T.ALTERAR) ELSE ''S'' END ALTERAR, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN TRIM(T.DELETAR) ELSE ''S'' END DELETAR, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN T.BUFFER ELSE 0 END BUFFER, ' +
      ' CASE WHEN (T.COD_SCHEMA > 0) THEN T.S_EMP_FIS ELSE ''S'' END S_EMP_FIS, ';
     if (pSchema = 'M') then
	     vSql := vSql + ' CASE WHEN (COALESCE(T.ATIVO, 0) = 0) THEN NULL ELSE T.COD_SCHEMA END COD_SCHEMA, '
     else
	     vSql := vSql + ' CASE WHEN (COALESCE(T.ATIVO, 1) = 1) THEN ' + IntToStr(pCodSchema) + ' ELSE NULL END COD_SCHEMA, ';
     vSql := vSql +
      ' CASE WHEN (WT.ATIVO = 0) THEN ''S'' ELSE ''N'' END RESTRICAO ' +
      ' FROM RDB$RELATIONS RR ' +
      ' INNER JOIN RDB$RELATION_CONSTRAINTS RC ON RR.RDB$RELATION_NAME = RC.RDB$RELATION_NAME  AND RR.RDB$SYSTEM_FLAG = 0 ' +
      ' INNER JOIN RDB$INDICES RI ON RI.RDB$RELATION_NAME = RC.RDB$RELATION_NAME ' +
      ' LEFT JOIN WSR_TABELAS T ON T.NOME_TAB = RC.RDB$RELATION_NAME AND T.COD_SCHEMA = ' + IntToStr(pCodSchema) + ' AND T.COD_EMPRESA = ' + IntToStr(pCodEmpresa) + ' AND T.ATIVO = 1 ' +
      ' LEFT JOIN WSR_TABELAS WT ON WT.NOME_TAB = RC.RDB$RELATION_NAME AND WT.COD_SCHEMA = 0 AND WT.COD_EMPRESA = 0 AND WT.ATIVO = 0' +      
      ' LEFT JOIN WSR_SCHEMAS S ON S.COD_SCHEMA = T.COD_SCHEMA ' +
      ' WHERE (((T.ENVIAR = ''S'' OR T.RECEBER = ''S'') ' +
      ' AND S.COD_SCHEMA = ' + IntToStr(pCodSchema) + ' AND T.COD_EMPRESA = ' + IntToStr(pCodEmpresa) + ') OR (T.COD_SCHEMA IS NULL)) ' +
      ' AND RC.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'' ' +
      ' AND TRIM(RC.RDB$RELATION_NAME) NOT LIKE ''WSR_%'' AND TRIM(RC.RDB$RELATION_NAME) NOT LIKE ''REPL_%'' ';

  Result := montaSelect(vSql);

  try
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      if dataSet.FieldByName('COD_SCHEMA').AsInteger > 0 then
        dataSet.FieldByName('SEL').AsString := 'S'
      else
        dataSet.FieldByName('SEL').AsString := 'N';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;
  finally
    dataSet.EnableControls;
  end;
end;

function TTabelasWs.atualizarTabelas(datasetEmpresa: TClientDataSet; pCodSchema: Integer): boolean;
var
  I, vRecNo: Integer;
  vListTemp: TStringList;
  vCodEmpresa: Integer;
begin
  try
    Result := False;

    vRecNo := datasetEmpresa.RecNo;

    try
     vListTemp := TStringList.Create;
    except
    end;
    vListTemp.Clear;

    try
       vDadosIni.abreStatusProcessamento('','Atualizando tabela(s)');

       vCodEmpresa := datasetEmpresa.FieldByName('COD_EMPRESA').AsInteger;

       try
         datasetEmpresa.DisableControls;

         if frmCadConfigWS.ckEmpresasTab.Checked then
           datasetEmpresa.First;
         while not datasetEmpresa.Eof do
         begin
           vListTemp.Add(IntToStr(datasetEmpresa.FieldByName('COD_EMPRESA').AsInteger));

           if not frmCadConfigWS.ckEmpresasTab.Checked then
              Break;

           datasetEmpresa.Next;
         end;
       finally
         datasetEmpresa.EnableConstraints;
       end;

       dataSet.Filtered := false;
       dataSet.Filter := ' SEL <> ''S'' ';
       dataSet.Filtered := true;

       try
         dataSet.DisableControls;

         dataSet.First;
         while not dataSet.Eof do
         begin
           buscas.Close;
           buscas.SQL.Text := ' DELETE FROM WSR_TABELAS ' +
             ' WHERE NOME_TAB = :NOME_TAB AND COD_SCHEMA = :COD_SCHEMA AND COD_EMPRESA = :COD_EMPRESA ';
           buscas.ParamByName('NOME_TAB').AsString := trim(dataSet.FieldByName('NOME_TAB').AsString);
           buscas.ParamByName('COD_SCHEMA').AsInteger := pCodSchema;
           buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListTemp[I]);
           buscas.ExecSQL;

           dataSet.Next;
         end;
         dataSet.First;
       finally
         dataSet.EnableControls;
       end;

       dataSet.Filtered := false;
       dataSet.Filter := ' SEL = ''S'' ';
       dataSet.Filtered := true;

      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
           vDadosIni.abreStatusProcessamento('','Atualizando tabela: ' + trim(dataSet.FieldByName('NOME_TAB').AsString));

           for I := 0 to vListTemp.Count - 1 do
           begin
            datasetEmpresa.Locate('COD_EMPRESA', StrToInt(vListTemp[I]), []);
            vCampos.abreCampos(pCodSchema, StrToInt(vListTemp[I]), trim(dataSet.FieldByName('NOME_TAB').AsString));

            buscas.Close;
            buscas.SQL.Text := ' DELETE FROM WSR_TABELAS ' +
              ' WHERE NOME_TAB = :NOME_TAB AND COD_SCHEMA = :COD_SCHEMA AND COD_EMPRESA = :COD_EMPRESA ';
            buscas.ParamByName('NOME_TAB').AsString := trim(dataSet.FieldByName('NOME_TAB').AsString);
            buscas.ParamByName('COD_SCHEMA').AsInteger := pCodSchema;
            buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListTemp[I]);
            buscas.ExecSQL;

            if not vDadosIni.PesqPros('CWS026', 'SALVAR - TABELA ' + dataSet.FieldByName('NOME_TAB').AsString +
               ' EMPRESA ' + vListTemp[I], '', 'WSR_TABELAS', IntToStr(pCodSchema), buscas, true) then
               exit;

            buscas.Close;
            buscas.SQL.Text := ' UPDATE OR INSERT INTO WSR_TABELAS (NOME_TAB, COD_SCHEMA, COD_EMPRESA, ' +
              ' ENVIAR, RECEBER, INSERIR, ALTERAR, DELETAR, ORDEM, BUFFER, S_EMP_FIS, ATIVO, DATA) ' +
              ' VALUES (:NOME_TAB, :COD_SCHEMA, :COD_EMPRESA, ' +
              ' :ENVIAR, :RECEBER, :INSERIR, :ALTERAR, :DELETAR, :ORDEM, :BUFFER, :S_EMP_FIS, :ATIVO, :DATA) ' +
              ' MATCHING  (NOME_TAB, COD_SCHEMA, COD_EMPRESA); ';
            buscas.ParamByName('NOME_TAB').AsString := trim(dataSet.FieldByName('NOME_TAB').AsString);
            buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListTemp[I]);
            buscas.ParamByName('COD_SCHEMA').AsInteger := pCodSchema;
            buscas.ParamByName('ENVIAR').AsString := dataSet.FieldByName('ENVIAR').AsString;
            buscas.ParamByName('RECEBER').AsString := dataSet.FieldByName('RECEBER').AsString;
            buscas.ParamByName('INSERIR').AsString := dataSet.FieldByName('INSERIR').AsString;
            buscas.ParamByName('ALTERAR').AsString := dataSet.FieldByName('ALTERAR').AsString;
            buscas.ParamByName('DELETAR').AsString := dataSet.FieldByName('DELETAR').AsString;
            buscas.ParamByName('BUFFER').AsInteger := dataSet.FieldByName('BUFFER').AsInteger;
            buscas.ParamByName('S_EMP_FIS').AsString := dataSet.FieldByName('S_EMP_FIS').AsString;
            if dataSet.FieldByName('SEL').AsString = 'S' then
              buscas.ParamByName('ATIVO').AsInteger := 1
            else
              buscas.ParamByName('ATIVO').AsInteger := 0;
            buscas.ParamByName('ORDEM').AsInteger := 0;
            buscas.ExecSQL;

            vCampos.atualizarCampos(datasetEmpresa, pCodSchema, trim(dataSet.FieldByName('NOME_TAB').AsString), frmCadConfigWS.ckEmpresasTab.Checked);
          end;

          dataSet.Next;
        end;
        dataSet.First;
      finally
        dataSet.EnableControls;
      end;

  	finally
      dataSet.Filtered := false;
      datasetEmpresa.RecNo := vRecNo;
      datasetEmpresa.Locate('COD_EMPRESA', vCodEmpresa, [])
    end;

//    CommitaTransacao;
//    vDadosIni.GravaAuditoria('CWS026', 'SALVAR', 'SUCESSO', 'WSR_TABELAS', IntToStr(pCodSchema), buscas);

    Result := True;
  except on E: Exception do
    begin
      Result := False;
  	   RollBackTransacao;
//      vDadosIni.GravaAuditoria('CWS026', 'SALVAR', 'FALHA', 'WSR_TABELAS', IntToStr(pCodSchema), buscas);
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TTabelasWs.create;
begin
  dataset := TClientDataSet(dtmConfig.cdswsTabelas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  vCampos := TCamposWs.Create;
end;

destructor TTabelasWs.destroy;
begin
  vCampos.Free;
  vCampos := nil;

  inherited;
end;

function TTabelasWs._abreFormListaTabela(pCodSchema, pEmpresa: Integer; pSchema: string): boolean;
var
  formulario: TfrmPadrao;
  vOK: Boolean;
begin
  try
    vOK := false;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COD_EMPRESA FROM WSR_EMPRESAS ' +
     	' WHERE COD_EMPRESA = :COD_EMPRESA AND COD_SCHEMA = :COD_SCHEMA ';
    buscas.ParamByName('COD_EMPRESA').AsInteger := pEmpresa;
    buscas.ParamByName('COD_SCHEMA').AsInteger := pCodSchema;
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Application.MessageBox('Favor adicionar/salvar a empresa antes de visualizar as tabelas!', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      exit;
    end;

    vOK := true;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.ShowHint := True;
    formulario.Position := poMainFormCenter;
    formulario.Caption := 'Configurar tabelas: empresa ' + IntToStr(pEmpresa);
    formulario.BorderIcons := [biSystemMenu];
    frmCadConfigWS.pnListaTabelas.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.OnKeyDown := frmCadConfigWS.KeyDownTabela;
    abreTabelas(pCodSchema, pEmpresa, pSchema);
    frmCadConfigWS.ckEmpresasTab.Checked := _LerConfiguracoesRegistroBoolean('ckEmpresasTab');
    frmCadConfigWS.ckEmpresasCampos.Checked := _LerConfiguracoesRegistroBoolean('ckEmpresasTab');
    result := (formulario.ShowModal = mrOk);
  finally
    if vOK then
    begin
      _GravaConfiguracoesBoolean('ckEmpresasTab', frmCadConfigWS.ckEmpresasTab.Checked);
      frmCadConfigWS.pnListaTabelas.Parent := frmCadConfigWS.TabSheet4;
      formulario.Free;
      formulario := nil;
    end;
  end;
end;

function TTabelasWs._abreFormTabela: boolean;
var
  formulario: TfrmPadrao;
  vOK: Boolean;
begin
  try
    vOK := true;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.ShowHint := True;
    formulario.Position := poMainFormCenter;
    formulario.BorderIcons := [biSystemMenu];
    formulario.Caption := 'Configurar tabela: ' + dataSet.FieldByName('NOME_TAB').AsString + ' - empresa ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger);
    frmCadConfigWS.pnTabela.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.OnKeyDown := frmCadConfigWS.KeyDownCampos;
    frmCadConfigWS.atribuirValorCamposTabela;
//    frmCadConfigWS.ckEmpresasCampos.Checked := _LerConfiguracoesRegistroBoolean('ckEmpresasCampos');
    vCampos.abreCampos(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger, dataSet.FieldByName('COD_EMPRESA').AsInteger, dataSet.FieldByName('NOME_TAB').AsString);
    result := (formulario.ShowModal = mrOk);
  finally
    if vOK then
    begin
//    	_GravaConfiguracoesBoolean('ckEmpresasCampos', frmCadConfigWS.ckEmpresasCampos.Checked);
      frmCadConfigWS.pnTabela.Parent := frmCadConfigWS.TabSheet5;
      formulario.Free;
      formulario := nil;
    end;
  end;
end;

procedure TTabelasWs._marcaDesmarcaLinha;
var
 vTemp: string;
 vProcesso: string;
 vListTemp: TStringList;
 I: Integer;
begin
  if dataSet.IsEmpty then
    exit;

  vTemp := 'REMOVER';
  vProcesso := 'CWS025';

  try
   vListTemp := TStringList.Create;
  except
  end;
  vListTemp.Clear;

  try
    vConfigWS.vEmpresa.dataSet.DisableControls;
    if frmCadConfigWS.ckEmpresasTab.Checked then
      vConfigWS.vEmpresa.dataSet.First;
    while not vConfigWS.vEmpresa.dataSet.Eof do
    begin
      vListTemp.Add(IntToStr(vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger));

      if not frmCadConfigWS.ckEmpresasTab.Checked then
         Break;

      vConfigWS.vEmpresa.dataSet.Next;
    end;
  finally
    vConfigWS.vEmpresa.dataSet.EnableConstraints;
  end;

  if dataSet.FieldByName('SEL').AsString = '' then
  begin
     vTemp := 'ADICIONAR';
     vProcesso := 'CWS024';
  end;

  if (dataSet.FieldByName('RESTRICAO').AsString <> 'S') then
  begin
    if not vDadosIni.PesqPros(vProcesso, UpperCase(vTemp) + ' - TABELA ' + dataSet.FieldByName('NOME_TAB').AsString +
     ' EMPRESA ' + dataSet.FieldByName('COD_EMPRESA').AsString + ' SCHEMA ' + dataSet.FieldByName('COD_SCHEMA').AsString,
      '', 'WSR_TABELAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas, true) then
      Exit;

    dataSet.Edit;
    if dataSet.FieldByName('SEL').AsString = 'S' then
      dataSet.FieldByName('SEL').AsString := ''
    else
      dataSet.FieldByName('SEL').AsString := 'S';
    dataSet.Post;

    if dataSet.FieldByName('SEL').AsString = 'S' then
    begin
      for I := 0 to vListTemp.Count - 1 do
      begin
        buscas.Close;
        buscas.SQL.Text := ' UPDATE OR INSERT INTO WSR_TABELAS (NOME_TAB, COD_SCHEMA, COD_EMPRESA, ' +
          ' ENVIAR, RECEBER, INSERIR, ALTERAR, DELETAR, ORDEM, BUFFER, S_EMP_FIS, ATIVO, DATA) ' +
          ' VALUES (:NOME_TAB, :COD_SCHEMA, :COD_EMPRESA, ' +
          ' :ENVIAR, :RECEBER, :INSERIR, :ALTERAR, :DELETAR, :ORDEM, :BUFFER, :S_EMP_FIS, :ATIVO, :DATA) ' +
          ' MATCHING  (NOME_TAB, COD_SCHEMA, COD_EMPRESA); ';
        buscas.ParamByName('NOME_TAB').AsString := trim(dataSet.FieldByName('NOME_TAB').AsString);
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListTemp[I]);
        buscas.ParamByName('COD_SCHEMA').AsInteger := vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger;;
        buscas.ParamByName('ENVIAR').AsString := dataSet.FieldByName('ENVIAR').AsString;
        buscas.ParamByName('RECEBER').AsString := dataSet.FieldByName('RECEBER').AsString;
        buscas.ParamByName('INSERIR').AsString := dataSet.FieldByName('INSERIR').AsString;
        buscas.ParamByName('ALTERAR').AsString := dataSet.FieldByName('ALTERAR').AsString;
        buscas.ParamByName('DELETAR').AsString := dataSet.FieldByName('DELETAR').AsString;
        buscas.ParamByName('BUFFER').AsInteger := dataSet.FieldByName('BUFFER').AsInteger;
        buscas.ParamByName('S_EMP_FIS').AsString := dataSet.FieldByName('S_EMP_FIS').AsString;
        if dataSet.FieldByName('SEL').AsString = 'S' then
          buscas.ParamByName('ATIVO').AsInteger := 1
        else
          buscas.ParamByName('ATIVO').AsInteger := 0;
        buscas.ParamByName('ORDEM').AsInteger := 0;
        buscas.ExecSQL;
      end;
    end;

  end;
end;

{ TLog }

function TLogWs.atualizarConsultaLog(pToken: string): Boolean;
begin
  try
    Result := False;

     if not verificaConexao then
     	exit;

     buscas.Close;
     buscas.SQL.Text := ' UPDATE CONSULTA SET DATA = :DATA;';
     buscas.ParamByName('DATA').AsDateTime := Now;
     buscas.ExecSQL;

     if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
        
     Result := True;
        
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TLogWs.buscarSchemas: boolean;
begin
  Result := False;

  if not dtmConfig.IBDatabaseLog.Connected then
  begin
    dtmConfig.IBDatabaseLog.DatabaseName := vDadosIni.vBancoLogWs;
    dtmConfig.IBDatabaseLog.Connected := true;
  end;

  if not dtmConfig.IBDatabaseLog.Connected then
    exit;

  buscas.Close;
  buscas.SQL.Text := ' SELECT * FROM HWSERVICES ';
  buscas.Open;
  buscas.FetchAll;

  Result := not buscas.IsEmpty;
end;

constructor TLogWs.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsLog);
  transacao := TIBTransaction(dtmConfig.ibTransLog);
  buscas := TIBQuery(dtmConfig.qrLog);
end;

function TLogWs.lerLog(pMemo: TMemo; pMemoGeral: TMemo; pToken: string; pTipo: string = 'L'): Boolean;
var
 vId: Integer;
begin
  try
    Result := False;

    if not verificaConexao then
    	exit;

    buscas.Close;
    if pTipo = 'L' then
      buscas.SQL.Text := ' SELECT LOG.ID, LOG.LOG FROM LOG ' +
        ' WHERE LOG.ID > (SELECT COALESCE(CONSULTA.ID,0) ID FROM CONSULTA WHERE TOKEN = :TOKEN AND TIPO = ''L'') ' +
        ' AND LOG.TOKEN = :TOKEN AND LOG.ATIVO = 1'
    else
    	buscas.SQL.Text := ' SELECT ERROS.ID, ERROS.ERRO LOG FROM ERROS ' +
        ' WHERE ERROS.ID > (SELECT COALESCE(CONSULTA.ID,0) ID FROM CONSULTA WHERE TOKEN = :TOKEN AND TIPO = ''E'') ' +
        ' AND ERROS.TOKEN = :TOKEN AND ERROS.ATIVO = 1';
    buscas.ParamByName('TOKEN').AsString := pToken;
    buscas.Open;
    buscas.FetchAll;

    vId := 0;
    buscas.First;
    while not buscas.Eof do
    begin
      pMemo.Lines.Add(buscas.FieldByName('LOG').AsString);
      pMemoGeral.Lines.Add(buscas.FieldByName('LOG').AsString);
      vId := buscas.FieldByName('ID').AsInteger;
      buscas.Next;
    end;

    if vId > 0 then
    begin
      buscas.Close;
      buscas.SQL.Text := ' UPDATE OR INSERT INTO CONSULTA (TOKEN, TIPO, DATA, ID) ' +
        ' VALUES (:TOKEN, :TIPO, :DATA, :ID) MATCHING (TOKEN, TIPO);';
      buscas.ParamByName('TOKEN').AsString := pToken;
      if pTipo = 'L' then
	      buscas.ParamByName('TIPO').AsString := 'L'
      else
      	buscas.ParamByName('TIPO').AsString := 'E';
      buscas.ParamByName('DATA').AsDateTime := Now;
      buscas.ParamByName('ID').AsInteger := vId;
      buscas.ExecSQL;

      if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;
      Result := True;
    end;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TLogWs.verificaConexao: boolean;
begin
  try
    Result := false;

    if (trim(vDadosIni.vBancoLogWs) = '') then
    begin
       Application.MessageBox('Endereço do banco de LogWS não informado no config.ini!', 'Informação', MB_OK + MB_ICONINFORMATION +   MB_DEFBUTTON1);
       exit;
    end;

    dtmConfig.IBDatabaseLog.Connected := false;
    dtmConfig.IBDatabaseLog.DatabaseName := vDadosIni.vBancoLogWs;
    dtmConfig.IBDatabaseLog.Connected := true;

    if not dtmConfig.IBDatabaseLog.Connected then
    begin
      Application.MessageBox('Não foi possível conectar no banco de LogWS!', 'Informação', MB_OK + MB_ICONINFORMATION +   MB_DEFBUTTON1);
      exit;
    end;

    Result := True;

    except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

{ TCamposWs }

function TCamposWs.abreCampos(pCodSchema, pCodEmpresa: Integer;
  pNomeTab: string): boolean;
var
	vSql: string;
begin
  vSql := ' SELECT RRF.RDB$RELATION_NAME NOME_TAB, TRIM(RRF.RDB$FIELD_NAME) AS CAMPO, ' +
    ' TRIM(RT.RDB$TYPE_NAME) TIPO, ' + IntToStr(pCodEmpresa) + ' COD_EMPRESA, ' + IntToStr(pCodSchema) + ' COD_SCHEMA, ' +
    ' CASE WHEN (WC.ATIVO = 0) THEN 0 ELSE 1 END ATIVO, ' +
    //PRIMARY KEY
  	 ' (SELECT DISTINCT CASE WHEN (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') THEN ''S'' ELSE ''N'' END PK  FROM RDB$INDICES ' +
    ' INNER JOIN RDB$RELATION_CONSTRAINTS ON RDB$RELATION_CONSTRAINTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME ' +
    ' INNER JOIN RDB$INDEX_SEGMENTS ON RDB$INDEX_SEGMENTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME ' +
    ' INNER JOIN RDB$RELATION_FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_NAME = RDB$INDEX_SEGMENTS.RDB$FIELD_NAME ' +
    ' WHERE (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') ' +
    ' AND RDB$INDICES.RDB$RELATION_NAME = RRF.RDB$RELATION_NAME ' +
    ' AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = TRIM(RRF.RDB$FIELD_NAME)), ' +
    //FOREIGN KEY
    ' (SELECT DISTINCT CASE WHEN (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'') THEN ''S'' ELSE ''N'' END FK  FROM RDB$INDICES ' +
    ' INNER JOIN RDB$RELATION_CONSTRAINTS ON RDB$RELATION_CONSTRAINTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME ' +
    ' INNER JOIN RDB$INDEX_SEGMENTS ON RDB$INDEX_SEGMENTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME ' +
    ' INNER JOIN RDB$RELATION_FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_NAME = RDB$INDEX_SEGMENTS.RDB$FIELD_NAME ' +
    ' WHERE (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'') ' +
    ' AND RDB$INDICES.RDB$RELATION_NAME = RRF.RDB$RELATION_NAME ' +
    ' AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = TRIM(RRF.RDB$FIELD_NAME)) ' +
    ' FROM RDB$RELATIONS RR ' +
    ' INNER JOIN RDB$RELATION_CONSTRAINTS RC ON RR.RDB$RELATION_NAME = RC.RDB$RELATION_NAME  AND RR.RDB$SYSTEM_FLAG = 0 ' +
    ' INNER JOIN RDB$RELATION_FIELDS RRF ON RR.RDB$RELATION_NAME = RRF.RDB$RELATION_NAME ' +
    ' INNER JOIN RDB$FIELDS RF ON RF.RDB$FIELD_NAME = RRF.RDB$FIELD_SOURCE ' +
    ' INNER JOIN RDB$TYPES RT ON RT.RDB$TYPE = RF.RDB$FIELD_TYPE AND RT.RDB$FIELD_NAME = ''RDB$FIELD_TYPE'' ' +
    ' LEFT JOIN WSR_CAMPOS WC ON WC.NOME_TAB = RRF.RDB$RELATION_NAME AND WC.CAMPO = (RRF.RDB$FIELD_NAME) AND WC.COD_SCHEMA = ' + IntToStr(pCodSchema) + ' AND WC.COD_EMPRESA = ' + IntToStr(pCodEmpresa) + ' AND ATIVO = 0 ' +
    ' WHERE NOT(RT.RDB$TYPE_NAME = ''BLOB'' AND RF.RDB$FIELD_SUB_TYPE = 2) ' +
    ' AND TRIM(RRF.RDB$FIELD_NAME) <> ''SEQID_WS'' AND TRIM(RRF.RDB$FIELD_NAME) <> ''DATA_HORA_ALT_WS'' ' +
    ' AND TRIM(RRF.RDB$FIELD_NAME) <> ''EMP_ALT_WS'' ' +
    ' AND RC.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'' AND TRIM(RC.RDB$RELATION_NAME) NOT LIKE ''WSR_%'' ' +
    ' AND TRIM(RC.RDB$RELATION_NAME) NOT LIKE ''REPL_%'' ';
  if trim(pNomeTab) <> '' then   
	 vSql := vSql + ' AND TRIM(RRF.RDB$RELATION_NAME) = ' + QuotedStr(pNomeTab);
  vSql := vSql + ' ORDER BY RRF.RDB$FIELD_POSITION ';
  Result := montaSelect(vSql);

  try
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      if dataSet.FieldByName('ATIVO').AsInteger <> 0 then
        dataSet.FieldByName('SEL').AsString := 'S'
      else
        dataSet.FieldByName('SEL').AsString := 'N';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;
  finally
    dataSet.EnableControls;
  end;
end;

function TCamposWs.atualizarCampos(datasetEmpresa: TClientDataSet; pCodSchema: Integer; pNomeTab: string; pSomenteEmp: boolean): boolean;
var
  vSel, I, vRecNo: Integer;
  vListTemp: TStringList;
  vExisteCampoSemChavePrimEstrang: boolean;
begin
  try
    Result := False;
    vExisteCampoSemChavePrimEstrang := false;
    try
      vRecNo := datasetEmpresa.RecNo;

      try
       vListTemp := TStringList.Create;
      except
      end;
      vListTemp.Clear;

      try
        datasetEmpresa.DisableControls;
        if not (pSomenteEmp) then
          if frmCadConfigWS.ckEmpresasCampos.Checked then
             datasetEmpresa.First;
        while not datasetEmpresa.Eof do
        begin
           vListTemp.Add(IntToStr(datasetEmpresa.FieldByName('COD_EMPRESA').AsInteger));

           if pSomenteEmp then
              Break
           else if not frmCadConfigWS.ckEmpresasCampos.Checked then
              Break;

           datasetEmpresa.Next;
        end;
      finally
        datasetEmpresa.EnableControls;
      end;

      vDadosIni.fechaStatusProcessamento;
      vDadosIni.abreStatusProcessamento('', 'Atualizando campo(s)');

      try
        dataSet.Filtered := false;
        dataSet.Filter := ' SEL = '''' ';
        dataSet.Filtered := true;

        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('PK').AsString <> 'S') and (dataSet.FieldByName('FK').AsString <> 'S') then
            begin
              vExisteCampoSemChavePrimEstrang := true;
              Break;
            end;

            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;
      finally
        dataSet.First;
        dataSet.Filtered := false;
      end;

      try
        dataSet.Filtered := false;
        dataSet.Filter := ' SEL = ''S'' ';
        dataSet.Filtered := true;

        try
          vSel := 0;
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('PK').AsString <> 'S') and (dataSet.FieldByName('FK').AsString <> 'S') then
            begin
              vSel := 1;
              Break;
            end;

            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        if not (pSomenteEmp) then
          if (vSel <= 0) and (vExisteCampoSemChavePrimEstrang) then
          begin
            Application.MessageBox('Nenhum campo habilitado sem chave primária e estrangeira, favor selecionar!', 'Atenção', 0 + 64);
            Exit;
          end;

      finally
        dataSet.First;
        dataSet.Filtered := false;
      end;

      for I := 0 to vListTemp.Count - 1 do
      begin
        buscas.Close;
        buscas.SQL.Text := ' DELETE FROM WSR_CAMPOS ' +
          ' WHERE NOME_TAB = :NOME_TAB AND ' +
          ' COD_EMPRESA = :COD_EMPRESA AND COD_SCHEMA = :COD_SCHEMA ';
        buscas.ParamByName('NOME_TAB').AsString := pNomeTab;
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListTemp[I]);
        buscas.ParamByName('COD_SCHEMA').AsInteger := pCodSchema;
        buscas.ExecSQL;
      end;

      dataSet.Filtered := false;
      dataSet.Filter := ' SEL <> ''S'' ';
      dataSet.Filtered := true;

      try
        dataSet.DisableControls;
        for I := 0 to vListTemp.Count - 1 do
        begin
          if not dataSet.IsEmpty then
            if not vDadosIni.PesqPros('CWS030', 'SALVAR - TABELA ' + dataSet.FieldByName('NOME_TAB').AsString +
             ' EMPRESA ' + vListTemp[I], '', 'WSR_CAMPOS', IntToStr(pCodSchema), buscas, true) then
                 exit;

          dataSet.First;
          while not dataSet.Eof do
          begin
            vDadosIni.abreStatusProcessamento('', 'Atualizando campo: ' + trim(dataset.FieldByName('CAMPO').AsString) + ' - tabela: ' + trim(pNomeTab));

            if (dataSet.FieldByName('SEL').AsString <> 'S') then
            begin
                buscas.Close;
                buscas.SQL.Text := ' UPDATE OR INSERT INTO WSR_CAMPOS (NOME_TAB, CAMPO, COD_EMPRESA, COD_SCHEMA, ATIVO) ' +
                   ' VALUES (:NOME_TAB, :CAMPO, :COD_EMPRESA, :COD_SCHEMA, :ATIVO) ' +
                   ' MATCHING (NOME_TAB, CAMPO, COD_EMPRESA, COD_SCHEMA); ';
                buscas.ParamByName('NOME_TAB').AsString := pNomeTab;
                buscas.ParamByName('CAMPO').AsString := trim(dataset.FieldByName('CAMPO').AsString);
                buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListTemp[I]);
                buscas.ParamByName('COD_SCHEMA').AsInteger := pCodSchema;
                buscas.ParamByName('ATIVO').AsInteger := 0;
                buscas.ExecSQL;
            end;
            dataSet.Next;
          end;
        end;
        dataSet.First;
      finally
        dataSet.EnableControls;
      end;

  	finally
       dataSet.Filtered := false;
       datasetEmpresa.RecNo := vRecNo;
    end;

//    CommitaTransacao;
//    vDadosIni.GravaAuditoria('CWS030', 'SALVAR', 'SUCESSO', 'WSR_CAMPOS', IntToStr(pCodSchema), buscas);

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
//      vDadosIni.GravaAuditoria('CWS030', 'SALVAR', 'FALHA', 'WSR_CAMPOS', IntToStr(pCodSchema), buscas);
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TCamposWs.create;
begin
  dataset := TClientDataSet(dtmConfig.cdswsCampos);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

procedure TCamposWs._desmarcarTodos;
begin
 try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      if (dataSet.FieldByName('PK').AsString <> 'S') and (dataSet.FieldByName('PK').AsString <> 'S') then
      begin
        if not vDadosIni.PesqPros('CWS029', 'REMOVER - EMPRESA ' + dataSet.FieldByName('COD_EMPRESA').AsString +
         ' SCHEMA ' + dataSet.FieldByName('COD_SCHEMA').AsString, '', 'WSR_EMPRESAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas, true) then
        Exit;

        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := '';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TCamposWs._marcaDesmarcaLinha;
var
 vTemp, vProcesso: string;
begin
  if dataSet.IsEmpty then
    exit;

  vTemp := 'REMOVER';
  vProcesso := 'CWS029';
  if dataSet.FieldByName('SEL').AsString = '' then
  begin
     vTemp := 'ADICIONAR';
     vProcesso := 'CWS028';
  end;

  if (dataSet.FieldByName('PK').AsString = 'S') or (dataSet.FieldByName('PK').AsString = 'S') then
  begin
    Application.MessageBox('Não é possível marcar ou desmarcar campo que faz parte de uma chave primária ou chave estrangeira!', 'Atenção', 0 + 64);
    Exit;
  end
  else
  begin
    if not vDadosIni.PesqPros(vProcesso, UpperCase(vTemp) + ' - EMPRESA ' + dataSet.FieldByName('COD_EMPRESA').AsString +
     ' SCHEMA ' + dataSet.FieldByName('COD_SCHEMA').AsString, '', 'WSR_EMPRESAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas, true) then
    Exit;

    dataSet.Edit;
    if dataSet.FieldByName('SEL').AsString = 'S' then
      dataSet.FieldByName('SEL').AsString := ''
    else
      dataSet.FieldByName('SEL').AsString := 'S';
    dataSet.Post;
  end;
end;

procedure TCamposWs._marcarTodos;
begin
 try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      if (dataSet.FieldByName('PK').AsString <> 'S') and (dataSet.FieldByName('PK').AsString <> 'S') then
      begin
        if not vDadosIni.PesqPros('CWS028', 'ADICIONAR - EMPRESA ' + dataSet.FieldByName('COD_EMPRESA').AsString +
         ' SCHEMA ' + dataSet.FieldByName('COD_SCHEMA').AsString, '', 'WSR_EMPRESAS', dataSet.FieldByName('COD_SCHEMA').AsString, buscas, true) then
        Exit;

        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TTabelasBD }

function TTabelasBD.abreTabelas: boolean;
begin
  Result := montaSelect(' SELECT NOME_TAB, COD_SCHEMA, COD_EMPRESA, ATIVO FROM WSR_TABELAS ' +
    ' WHERE COD_SCHEMA = 0 AND COD_EMPRESA = 0 AND ATIVO = 0 ' +
    ' ORDER BY NOME_TAB ');
end;

procedure TTabelasBD.abreTabelasBD(vcomb: TCombobox);
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT DISTINCT RC.RDB$RELATION_NAME NOME_TAB FROM RDB$RELATION_CONSTRAINTS RC ' +
  	' INNER JOIN RDB$INDICES RI ON RI.RDB$RELATION_NAME = RC.RDB$RELATION_NAME ' +
    ' AND RC.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'' AND RI.RDB$RELATION_NAME NOT LIKE ''WSR_%'' ' +
    ' AND RI.RDB$RELATION_NAME NOT IN ' +
    ' (SELECT NOME_TAB FROM WSR_TABELAS WHERE COD_SCHEMA = 0 AND COD_EMPRESA = 0 AND ATIVO = 0) ';
  buscas.Open;
  buscas.FetchAll;

  vcomb.Items.Clear;
  buscas.First;
  while not buscas.Eof do
  begin
    vcomb.Items.Add(trim(buscas.FieldByName('NOME_TAB').AsString));
    buscas.Next;
  end;
  vcomb.ItemIndex := 0;
end;

constructor TTabelasBD.create;
begin
 	dataset := TClientDataSet(dtmConfig.cdsTabelas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

function TTabelasBD.excluirTabela: boolean;
var
  vNomeTab: string;
begin
  Result := False;
   
  if dataSet.IsEmpty then
   exit;

  vNomeTab := dataSet.FieldByName('NOME_TAB').AsString;

  if Application.MessageBox(PChar('Deseja remover tabela ' + QuotedStr(trim(vNomeTab)) + ' da lista?'),
        'Remover', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
    exit;
        
  result := inherited Delete;
  if Result then
    result := Apply;
  if Result then
  begin
  	CommitaTransacao;
    vDadosIni.GravaAuditoria('CWS012', 'REMOVER', 'SUCESSO - ' + trim(vNomeTab), 'WSR_TABELAS', '0', buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CWS012', 'REMOVER', 'FALHA - ' + trim(vNomeTab), 'WSR_TABELAS', '0', buscas);
  end;

end;

function TTabelasBD.incluirTabela(pNomeTab: string): boolean;
begin
  try
    Result := False;

    if (trim(pNomeTab) = '') then
      raiseExceptionCreate('Tabela não informada!', 'ComboBox4');

    buscas.Close;
    buscas.SQL.Text := ' SELECT NOME_TAB, COD_SCHEMA, COD_EMPRESA, ATIVO FROM WSR_TABELAS ' +
     ' WHERE NOME_TAB = :NOME_TAB  AND COD_SCHEMA = 0 AND COD_EMPRESA = 0 AND ATIVO = 0 ';
    buscas.ParamByName('NOME_TAB').AsString := pNomeTab;
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Tabela '+ QuotedStr(trim(pNomeTab)) +' já adicionada a lista!', 'ComboBox4');

     if not (dataSet.State in [dsInsert, dsEdit]) then
       dataSet.Insert;
    dataSet.FieldByName('NOME_TAB').AsString := trim(pNomeTab);
    dataSet.FieldByName('COD_SCHEMA').AsInteger := 0;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := 0;
    dataSet.FieldByName('ATIVO').AsInteger := 0;
    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CWS011', 'INCLUIR', 'SUCESSO - ' + trim(pNomeTab), 'WSR_TABELAS', '0', buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CWS011', 'INCLUIR', 'FALHA - ' + trim(pNomeTab), 'WSR_TABELAS', '0', buscas);
    end;

  except on E: Exception do
  begin
    Result := False;
    Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TTabelasBD._abreFormTabelaNaoReplicadas: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.ShowHint := True;
    formulario.Position := poMainFormCenter;
    formulario.BorderIcons := [biSystemMenu];
    formulario.Caption := 'Restrições de replicação';
    frmCadConfigWS.pnTabelasNaoReplicadas.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    abreTabelasBD(frmCadConfigWS.ComboBox4);
    formulario.OnKeyDown := frmCadConfigWS.KeyDownNaoReplicar;
    abreTabelas;
    frmCadConfigWS.ComboBox6.Clear;
    frmCadConfigWS.ComboBox7.Clear;
    if (trim(frmCadConfigWS.ComboBox5.Text) <> '') then
    begin
      vCadastrosBasWs.abreCamposBD(frmCadConfigWS.ComboBox5.Text, frmCadConfigWS.ComboBox6);
      vCadastrosBasWs.abreCamposBD(frmCadConfigWS.ComboBox5.Text, frmCadConfigWS.ComboBox7);
    end;
    result := (formulario.ShowModal = mrOk);
  finally
    frmCadConfigWS.pnTabelasNaoReplicadas.Parent := frmCadConfigWS.TabSheet12;
    formulario.Free;
    formulario := nil;
  end;
end;

{ TCadastrosBasWs }

function TCadastrosBasWs.abreCadastros: boolean;
begin
  Result := montaSelect(' SELECT * FROM WSR_CADASTROSBASICOS ' +
  		' WHERE ATIVO = 1 ORDER BY TABELA ');
end;

procedure TCadastrosBasWs.abreCamposBD(pNomeTab: string; vcomb: TCombobox);
begin
  buscas.Close;
  buscas.SQL.Text := ' select trim(rrf.rdb$relation_name) as TABELA, trim(rrf.rdb$field_name) as CAMPO, ' +
  	' trim(rt.rdb$type_name) TIPO, trim(rf.rdb$field_sub_type) SUBTIPO from rdb$relation_fields rrf ' +
    ' inner join rdb$fields rf on rf.rdb$field_name = rrf.rdb$field_source ' +
    ' inner join rdb$types rt on rt.rdb$type = rf.rdb$field_type and rt.rdb$field_name = ''RDB$FIELD_TYPE'' ' +
    ' where trim(rrf.rdb$relation_name) = :TABELA and not(rt.rdb$type_name = ''BLOB'' and rf.rdb$field_sub_type = 2) ' +
    ' and trim(rrf.rdb$field_name) <> ''SEQID_WS'' and trim(rrf.rdb$field_name) <> ''DATA_HORA_ALT_WS'' ' +
    ' and trim(rrf.rdb$field_name) <> ''EMP_ALT_WS''';
  buscas.ParamByName('TABELA').AsString := pNomeTab;
  buscas.Open;
  buscas.FetchAll;

  vcomb.Items.Clear;
  buscas.First;
  while not buscas.Eof do
  begin
    vcomb.Items.Add(trim(buscas.FieldByName('CAMPO').AsString));
    buscas.Next;
  end;
  vcomb.ItemIndex := 0;
end;

procedure TCadastrosBasWs.abreTabelasBD(vcomb: TCombobox);
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT DISTINCT RC.RDB$RELATION_NAME NOME_TAB FROM RDB$RELATION_CONSTRAINTS RC ' +
  	' INNER JOIN RDB$INDICES RI ON RI.RDB$RELATION_NAME = RC.RDB$RELATION_NAME ' +
    ' AND RC.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'' AND RI.RDB$RELATION_NAME NOT LIKE ''WSR_%'' ' +
    ' AND RI.RDB$RELATION_NAME NOT IN ' +
    ' (SELECT NOME_TAB FROM WSR_TABELAS WHERE COD_SCHEMA = 0 AND COD_EMPRESA = 0 AND ATIVO = 0) ';
  buscas.Open;
  buscas.FetchAll;

  vcomb.Items.Clear;
  buscas.First;
  while not buscas.Eof do
  begin
    vcomb.Items.Add(trim(buscas.FieldByName('NOME_TAB').AsString));
    buscas.Next;
  end;
  vcomb.ItemIndex := 0;
end;

constructor TCadastrosBasWs.create;
begin
  dataset := TClientDataSet(dtmConfig.cdswsCadastrosBas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

function TCadastrosBasWs.excluirTabela: boolean;
var
  vNomeTab: string;
begin
  Result := False;
   
  if dataSet.IsEmpty then
   exit;

  vNomeTab := dataSet.FieldByName('TABELA').AsString;

  if Application.MessageBox(PChar('Deseja remover tabela ' + QuotedStr(trim(vNomeTab)) + ' da lista?'),
        'Remover', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
    exit;
        
  result := inherited Delete;
  if Result then
    result := Apply;
  if Result then
  begin
  	CommitaTransacao;
    vDadosIni.GravaAuditoria('CWS015', 'REMOVER', 'SUCESSO', 'WSR_TABELAS', trim(vNomeTab), buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CWS015', 'REMOVER', 'FALHA', 'WSR_TABELAS', trim(vNomeTab), buscas);
  end;
end;

function TCadastrosBasWs.incluirTabela(pNomeTab, pCamposChave,
  pCamposPesquisa: string): boolean;
begin
  try
    Result := False;

    if (trim(pNomeTab) = '') then
      raiseExceptionCreate('Tabela não informada!', 'ComboBox5');

    if (trim(pCamposChave) = '') then
      raiseExceptionCreate('Campo chave não informada!', 'ComboBox6');

    if (trim(pCamposPesquisa) = '') then
      raiseExceptionCreate('Campo pesquisa não informada!', 'ComboBox7');

    if (trim(pCamposChave) = trim(pCamposPesquisa)) then
      raiseExceptionCreate('Campo pesquisa e campo chave devem ser diferentes!', 'ComboBox7');

    buscas.Close;
    buscas.SQL.Text := ' SELECT TABELA, CAMPOS_CHAVE, CAMPOS_PESQUISA FROM WSR_CADASTROSBASICOS ' +
    	' WHERE TABELA = :TABELA AND ATIVO = 1 ';
    buscas.ParamByName('TABELA').AsString := trim(pNomeTab);
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Tabela '+ QuotedStr(trim(pNomeTab)) +' já adicionada a lista!', 'ComboBox5');

     if not (dataSet.State in [dsInsert, dsEdit]) then
       dataSet.Insert;
    dataSet.FieldByName('TABELA').AsString := trim(pNomeTab);
    dataSet.FieldByName('CAMPOS_CHAVE').AsString := trim(pCamposChave);
    dataSet.FieldByName('CAMPOS_PESQUISA').AsString := trim(pCamposPesquisa);
    dataSet.FieldByName('ATIVO').AsInteger := 1;
    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CWS014', 'INCLUIR', 'SUCESSO', 'WSR_CADASTROSBASICOS', trim(pNomeTab), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CWS014', 'INCLUIR', 'FALHA', 'WSR_CADASTROSBASICOS', trim(pNomeTab), buscas);
    end;

  except on E: Exception do
  begin
    Result := False;
    Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TCadastrosBasWs._abreFormCadastrosBasicos: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.ShowHint := True;
    formulario.Position := poMainFormCenter;
    formulario.BorderIcons := [biSystemMenu];
    formulario.Caption := 'Cadastros Básicos';
    frmCadConfigWS.pnCadastrosBasicos.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    abreTabelasBD(frmCadConfigWS.ComboBox5);
    frmCadConfigWS.ComboBox6.Clear;
    frmCadConfigWS.ComboBox7.Clear;
    formulario.OnKeyDown := frmCadConfigWS.KeyDownCadastros;
    abreCadastros;
    result := (formulario.ShowModal = mrOk);
  finally
    frmCadConfigWS.pnCadastrosBasicos.Parent := frmCadConfigWS.TabSheet12;
    formulario.Free;
    formulario := nil;
  end;
end;

{ TDependenciaWs }

function TDependenciaWs.abreCadastros: boolean;
begin
 Result := montaSelect(' SELECT * FROM WSR_DEPENDENCIAS ' +
  	' WHERE ATIVO = 1 ORDER BY TABELA, TABELA2 ');
end;

constructor TDependenciaWs.create;
begin
  dataset := TClientDataSet(dtmConfig.cdswsDependencia);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

function TDependenciaWs.excluirTabela: boolean;
 var
  vNomeTab1, vNomeTab2: string;
begin
  Result := False;
   
  if dataSet.IsEmpty then
   exit;

  vNomeTab1 := dataSet.FieldByName('TABELA').AsString;
  vNomeTab2 := dataSet.FieldByName('TABELA2').AsString;

  if Application.MessageBox(PChar('Deseja remover tabelas ' + QuotedStr(trim(vNomeTab1)  + ' - ' + trim(vNomeTab2)) +
    ' da lista?'), 'Remover', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
    exit;
        
  result := inherited Delete;
  if Result then
    result := Apply;
  if Result then
  begin
  	CommitaTransacao;
    vDadosIni.GravaAuditoria('CWS018', 'REMOVER', 'SUCESSO', 'WSR_DEPENDENCIAS', trim(vNomeTab1)  + ' - ' + trim(vNomeTab2), buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CWS018', 'REMOVER', 'FALHA', 'WSR_DEPENDENCIAS', trim(vNomeTab1)  + ' - ' + trim(vNomeTab2), buscas);
  end;
end;

function TDependenciaWs.incluirTabela(pNomeTab1, pNomeTab2, pCampoCod1, pCampoCod2,
  pCampoDesc1, pCampoDesc2: string): boolean;
begin
  try
    Result := False;

    if (trim(pNomeTab1) = '') then
    	raiseExceptionCreate('Tabela não informada!', 'ComboBox8');

    if (trim(pNomeTab2) = '') then
      raiseExceptionCreate('Tabela(Consulta) não informada!', 'ComboBox11');

    if (trim(pCampoCod1) = '') then
      raiseExceptionCreate('Campo código não informada!', 'ComboBox9');

    if (trim(pCampoCod2) = '') then
      raiseExceptionCreate('Campo código(Consulta) não informada!', 'ComboBox12');

    if (trim(pCampoDesc1) = '') then
	    raiseExceptionCreate('Campo descrição não informada!','ComboBox10');

    if (trim(pCampoDesc2) = '') then
      raiseExceptionCreate('Campo descrição(Consulta) não informada!', 'ComboBox13');

    if (trim(pCampoCod1) = trim(pCampoDesc1)) then
	    raiseExceptionCreate('Campo código e campo descrição devem ser diferentes!','ComboBox10');

    if (trim(pCampoCod2) = trim(pCampoDesc2)) then
		  raiseExceptionCreate('Campo código(Consulta) e campo descrição(Consulta) devem ser diferentes!', 'ComboBox13');

    buscas.Close;
    buscas.SQL.Text := ' SELECT TABELA, TABELA2 FROM WSR_DEPENDENCIAS ' +
    	' WHERE TABELA = :TABELA AND TABELA2 = :TABELA2 AND ATIVO = 1 ';
    buscas.ParamByName('TABELA').AsString := trim(pNomeTab1);
    buscas.ParamByName('TABELA2').AsString := trim(pNomeTab2);
    buscas.Open;

    if not buscas.IsEmpty then
    	raiseExceptionCreate('Tabela '+ QuotedStr(trim(pNomeTab1) + ' - ' + trim(pNomeTab2)) +' já adicionada a lista!', 'BitBtn22');

     if not (dataSet.State in [dsInsert, dsEdit]) then
       dataSet.Insert;
    dataSet.FieldByName('TABELA').AsString := trim(pNomeTab1);
    dataSet.FieldByName('TABELA2').AsString := trim(pNomeTab2);
    dataSet.FieldByName('CAMPO_CODIGO').AsString := trim(pCampoCod1);
    dataSet.FieldByName('CAMPO_CODIGO2').AsString := trim(pCampoCod2);
    dataSet.FieldByName('CAMPO_DESCRICAO').AsString := trim(pCampoDesc1);
    dataSet.FieldByName('CAMPO_DESCRICAO2').AsString := trim(pCampoDesc2);
    dataSet.FieldByName('ATIVO').AsInteger := 1;
    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CWS017', 'INCLUIR', 'SUCESSO', 'WSR_DEPENDENCIAS', trim(pNomeTab1) + ' - ' + trim(pNomeTab2), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CWS017', 'INCLUIR', 'FALHA', 'WSR_DEPENDENCIAS', trim(pNomeTab1) + ' - ' + trim(pNomeTab2), buscas);
    end;

  except on E: Exception do
  begin
    Result := False;
    Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
    registraErro(e.Message);
  end;
  end;
end;

function TDependenciaWs._abreFormDependencia: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.ShowHint := True;
    formulario.Position := poMainFormCenter;
    formulario.BorderIcons := [biSystemMenu];
    formulario.Caption := 'Dependências';
    frmCadConfigWS.pnDependencia.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    vTabelasBD.abreTabelasBD(frmCadConfigWS.ComboBox8);
    vTabelasBD.abreTabelasBD(frmCadConfigWS.ComboBox11);
    frmCadConfigWS.ComboBox9.Clear;
    frmCadConfigWS.ComboBox10.Clear;
    frmCadConfigWS.ComboBox12.Clear;
    frmCadConfigWS.ComboBox13.Clear;
    formulario.OnKeyDown := frmCadConfigWS.KeyDownDependencia;
    abreCadastros;
    frmCadConfigWS.ComboBox9.Clear;
  	frmCadConfigWS.ComboBox10.Clear;
    if (trim(frmCadConfigWS.ComboBox8.Text) <> '') then
  	begin
      vCadastrosBasWs.abreCamposBD(frmCadConfigWS.ComboBox8.Text, frmCadConfigWS.ComboBox9);
      vCadastrosBasWs.abreCamposBD(frmCadConfigWS.ComboBox8.Text, frmCadConfigWS.ComboBox10);
    end;
    frmCadConfigWS.ComboBox12.Clear;
  	frmCadConfigWS.ComboBox13.Clear;
    if (trim(frmCadConfigWS.ComboBox11.Text) <> '') then
    begin
      vCadastrosBasWs.abreCamposBD(frmCadConfigWS.ComboBox11.Text, frmCadConfigWS.ComboBox12);
      vCadastrosBasWs.abreCamposBD(frmCadConfigWS.ComboBox11.Text, frmCadConfigWS.ComboBox13);
    end;
    result := (formulario.ShowModal = mrOk);
  finally
    frmCadConfigWS.pnDependencia.Parent := frmCadConfigWS.TabSheet12;
    formulario.Free;
    formulario := nil;
  end;
end;

{ TConsultasWs }

constructor TConsultasWs.create;
begin
  dataset := TClientDataSet(dtmConfig.cdswsConsultas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

procedure TConsultasWs.visualizarWS(Tipoform: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('','Abrindo Visualização do wsReplicação');

    vDadosIni.vTipoForm := 0;
    if dtmConfig = nil then
      dtmConfig := TdtmConfig.Create(dtmConfig);
      
    if not vDadosIni.PesqPros('CWS031', 'CONSULTA', '', 'WSR_CONSULTAS', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmVisualizarWs = nil then
      Application.CreateForm(TfrmVisualizarWs, frmVisualizarWs);

    if (TipoForm > 0) and (not frmVisualizarWs.Visible) then
      frmVisualizarWs.ShowModal
    else if (not frmVisualizarWs.Visible) then
      frmVisualizarWs.Show
    else if frmVisualizarWs.FormStyle = fsMDIChild then
      frmVisualizarWs.Show
    else
      frmVisualizarWs.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

function TConsultasWs._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCondicaoTmp: string;
begin
  result := true;
  rConsulta.vSqlAdicional := '';

  if rConsulta.vAdicional then
  begin
    if rConsulta.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDate(rConsulta.vDataIniAd);
      except
        rConsulta.vDataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rConsulta.vDataFimAd);
      except
        rConsulta.vDataFimAd := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
          'Atenção', MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
          formatodata := 'mm/dd/yyyy'
        else if pos('.', ShortDateFormat) <> 0 then
          formatodata := 'dd.mm.yyyy';
        if rConsulta.vDataIniAd <> '' then
          rConsulta.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rConsulta.vDataIniAd)));
        if rConsulta.vDataFimAd <> '' then
          rConsulta.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rConsulta.vDataFimAd)));
      end;
    end
    else if rConsulta.vValorAd = '' then
      exit;

    vCampoTemp:= '';
    if rConsulta.vCampoAd = 'Empresa' then
      vCampoTemp := 'EMPRESA.IDENTIFICACAO_EMP'
    else if rConsulta.vCampoAd = 'Schema' then
      vCampoTemp := 'WSR_SCHEMAS.IDENTIFICACAO'
    else if rConsulta.vCampoAd = 'Token' then
      vCampoTemp := 'WSR_SCHEMAS.TOKEN';

    if Trim(vCampoTemp) <> '' then
    begin
      vCondicaoTmp := rConsulta.vCondicaoAd;
      if vCondicaoTmp = 'Igual' then
        vCondicaoTmp := '='
      else if vCondicaoTmp = 'Maior' then
        vCondicaoTmp := '>'
      else if vCondicaoTmp = 'Maior ou Igual' then
        vCondicaoTmp := '>='
      else if vCondicaoTmp = 'Menor' then
        vCondicaoTmp := '<'
      else if vCondicaoTmp = 'Menor ou Igual' then
        vCondicaoTmp := '<='
      else if vCondicaoTmp = 'Diferente' then
        vCondicaoTmp := '<>'
      else if (vCondicaoTmp = 'Esta contido') then
        vCondicaoTmp := 'like'
      else if (vCondicaoTmp = 'Começa') then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if vCondicaoTmp = 'like' then
        rConsulta.vSqlAdicional := rConsulta.vSqlAdicional + ' and ' + vCampoTemp + ' like ' + QuotedStr('%' + rConsulta.vValorAd + '%')
      else if vCondicaoTmp = 'Começa' then
        rConsulta.vSqlAdicional := rConsulta.vSqlAdicional + ' and ' + vCampoTemp + ' like ' + QuotedStr(rConsulta.vValorAd + '%')
      else
        rConsulta.vSqlAdicional := rConsulta.vSqlAdicional + ' and ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' +QuotedStr(rConsulta.vValorAd);
      rConsulta.vValorAd := '';
      Exit;
    end;

    if rConsulta.vCondicaoAd = 'Igual' then
      rConsulta.vCondicaoAd := '='
    else if rConsulta.vCondicaoAd = 'Maior' then
      rConsulta.vCondicaoAd := '>'
    else if rConsulta.vCondicaoAd = 'Maior ou Igual' then
      rConsulta.vCondicaoAd := '>='
    else if rConsulta.vCondicaoAd = 'Menor' then
      rConsulta.vCondicaoAd := '<'
    else if rConsulta.vCondicaoAd = 'Menor ou Igual' then
      rConsulta.vCondicaoAd := '<='
    else if rConsulta.vCondicaoAd = 'Diferente' then
      rConsulta.vCondicaoAd := '<>'
    else if (rConsulta.vCondicaoAd = 'Esta contido') then
      rConsulta.vCondicaoAd := 'like'
    else if (rConsulta.vCondicaoAd = 'Começa') then
      rConsulta.vCondicaoAd := 'Começa'
    else
      rConsulta.vCondicaoAd := '=';
    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rConsulta.vCampoAd) then
        begin
          if rConsulta.vCampo = rConsulta.vCampoAd then
          begin
            rConsulta.vsqlAdicional := '';
            exit;
          end;
          rConsulta.vCampoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rConsulta.vCondicaoAd = 'Começa') or (rConsulta.vCondicaoAd = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rConsulta.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end
            else if ((Dataset.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField))
              then
            try
              strtofloat(rConsulta.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rConsulta.vCondicaoAd := '=';
            rConsulta.vValorAd := vDadosIni.trocaVirgulaPorPonto(rConsulta.vValorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if (rConsulta.vDataIniAd <> '') and (rConsulta.vDataFimAd <> '') then
              rConsulta.vSqlAdicional := ' AND ' + rConsulta.vsqlAdicional + rConsulta.vCampoAd +
                ' >= ' + rConsulta.vDataIniAd + ' and ' + rConsulta.vCampoAd + ' <= ' + rConsulta.vDataFimAd
            else if (rConsulta.vDataFimAd <> '') then
              rConsulta.vsqlAdicional := ' AND ' + rConsulta.vsqlAdicional + rConsulta.vCampoAd +
                ' <= ' + rConsulta.vDataIniAd
            else if (rConsulta.vDataIniAd <> '') and (rConsulta.vDataFimAd <> '') then
              rConsulta.vsqlAdicional := ' AND ' + rConsulta.vsqlAdicional + rConsulta.vCampoAd +
                ' >= ' + rConsulta.vDataIniAd;
            Break;
          end;
          if rConsulta.vCondicaoAd = 'like' then
            rConsulta.vsqlAdicional := rConsulta.vsqlAdicional + rConsulta.vCampoAd +
              ' like ' + QuotedStr('%' +
              rConsulta.vValorAd +
              '%')
          else if rConsulta.vCondicaoAd = 'Começa' then
            rConsulta.vsqlAdicional := rConsulta.vsqlAdicional + rConsulta.vCampoAd +
              ' like ' +
              QuotedStr(rConsulta.vValorAd + '%')
          else
            rConsulta.vsqlAdicional := rConsulta.vsqlAdicional + rConsulta.vCampoAd + ' '
              + rConsulta.vCondicaoAd + ' ' +
              QuotedStr(rConsulta.vValorAd);

          if rConsulta.vCondicaoAd <> 'Começa' then
            rConsulta.vsqlAdicional := rConsulta.vCampoAd + ' ' + rConsulta.vCondicaoAd + ' ' + QuotedStr(rConsulta.vValorAd)
          else
            rConsulta.vsqlAdicional := rConsulta.vCampoAd + ' LIKE' + QuotedStr(rConsulta.vValorAd + '%');

          if rConsulta.vCampoAd = 'IDENTIFICACAO_EMP' then

          else if rConsulta.vCampoAd = 'IDENTIFICACAO_EMP' then
            rConsulta.vsqlAdicional := ' EMPRESA.' + rConsulta.vsqlAdicional
          else if rConsulta.vCampoAd = 'IDENTIFICACAO' then
            rConsulta.vsqlAdicional := ' WSR_SCHEMAS.' + rConsulta.vsqlAdicional
          else if rConsulta.vCampoAd = 'TOKEN' then
            rConsulta.vsqlAdicional := ' WSR_SCHEMAS.' + rConsulta.vsqlAdicional
          else
          	rConsulta.vsqlAdicional := ' WSR_CONSULTAS.' + rConsulta.vsqlAdicional;
          Break;
        end;
      end;
    end;
  end;
end;

{ TReplicacoesWS }

function TReplicacoesWS.abreReplicacoes: boolean;
var
  buscas2: TIBQuery;
	vSql: string;
  vOK: Boolean;
begin
   vSql := '';
   fTempReplicoes.EmptyDataSet;
   
   buscas2 := TIBQuery.Create(Application);
   buscas2.Database := buscas.Database;
   buscas2.Transaction := buscas.Transaction;

   buscas2.Close;
   buscas2.SQL.Text := ' SELECT WS.TOKEN, WE.COD_EMPRESA, WS.COD_EMPRESA_FISICA, ' +
   	' WS.COD_CENT_DIS, WS.COD_EMPRESAS_FISICA, WS.RECEBER FROM WSR_SCHEMAS WS ' +
    ' INNER JOIN WSR_EMPRESAS WE ON WE.COD_SCHEMA = WS.COD_SCHEMA ' +
    ' WHERE WS.ATIVO = 1 AND WE.ATIVO = 1 ';
   buscas2.Open;
   buscas2.FetchAll;

   buscas2.First;
   while not buscas2.Eof do
   begin
     if trim(vSql) <> '' then
     		vSql := vSql + ' UNION ';
        
     vSql := vSql + ' SELECT ' + QuotedStr(buscas2.FieldByName('TOKEN').AsString)+ ' TOKEN, '+
      IntToStr(buscas2.FieldByName('COD_EMPRESA').AsInteger) + ' COD_EMPRESA, ' +
      IntToStr(buscas2.FieldByName('COD_EMPRESA_FISICA').AsInteger) + ' COD_EMPRESA_FISICA, ' +
      IntToStr(buscas2.FieldByName('COD_CENT_DIS').AsInteger) + ' COD_CENT_DIS, ' +
      QuotedStr(buscas2.FieldByName('COD_EMPRESAS_FISICA').AsString) + ' COD_EMPRESAS_FISICA, ' +
      QuotedStr(buscas2.FieldByName('RECEBER').AsString) + ' RECEBER, ' +
      ' LISTA FROM GETCONSULTAS(' + QuotedStr(buscas2.FieldByName('TOKEN').AsString) + ', ' +
     	IntToStr(buscas2.FieldByName('COD_EMPRESA').AsInteger) + ', ' +
      IntToStr(buscas2.FieldByName('COD_EMPRESA_FISICA').AsInteger) + ', ' +
      IntToStr(buscas2.FieldByName('COD_CENT_DIS').AsInteger) + ', ' +
      QuotedStr(buscas2.FieldByName('COD_EMPRESAS_FISICA').AsString) + ', ' +
      QuotedStr(buscas2.FieldByName('RECEBER').AsString) + ')';

     buscas2.Next;
   end;

   buscas2.Close;
   buscas2.SQL.Text := vSql;
   buscas2.Open;
   buscas2.FetchAll;

   buscas2.First;
   while not buscas2.Eof do
   begin
//      buscas.Close;
//      buscas.SQL.Text := ' SELECT COUNT(*) QTDE FROM WSR_TAB_CHAVESALTERADAS ' +
//      	' WHERE NOME_TAB = ' + QuotedStr(vDadosIni.getCampoPipe(buscas2.FieldByName('LISTA').AsString + '|', 2)) +
//        ' AND ATIVO = 1 ';
//      buscas.Open;
//
//      if buscas.FieldByName('QTDE').AsInteger > 0 then
//      begin
//        buscas.Close;
//        buscas.SQL.Text := ' SELECT COALESCE(CONFIG, ''N'') CONFIG FROM WSR_REPL ' +
//          ' WHERE NOME_TAB = ' + QuotedStr(fTempReplicoes.FieldByName('TABELA').AsString) +
//          ' AND COD_EMPRESA = ' + IntToStr(fTempReplicoes.FieldByName('COD_EMPRESA').AsInteger) +
//          ' AND COD_EMP_FIS = ' + IntToStr(fTempReplicoes.FieldByName('COD_EMPRESA_FISICA').AsInteger) +
//          ' AND ATIVO = 1 ';
//        buscas.Open;

//        if buscas.IsEmpty then
//	        vOK := true
//        else if buscas.FieldByName('CONFIG').AsString = 'N' then
//      		vOK := true
//        else
//        	vOK := false;
        vOK := true;
				if vOK then
        begin
          fTempReplicoes.Insert;
          fTempReplicoes.FieldByName('TOKEN').AsString := Copy(buscas2.FieldByName('TOKEN').AsString, 1, 30);
          fTempReplicoes.FieldByName('TOKEN_ORIG').AsString := buscas2.FieldByName('TOKEN').AsString;
          fTempReplicoes.FieldByName('COD_EMPRESA').AsInteger := buscas2.FieldByName('COD_EMPRESA').AsInteger;
          fTempReplicoes.FieldByName('COD_EMPRESA_FISICA').AsInteger := buscas2.FieldByName('COD_EMPRESA_FISICA').AsInteger;
          fTempReplicoes.FieldByName('COD_CENT_DIS').AsInteger := buscas2.FieldByName('COD_CENT_DIS').AsInteger;
          fTempReplicoes.FieldByName('COD_EMPRESAS_FISICA').AsString := buscas2.FieldByName('COD_EMPRESAS_FISICA').AsString;
          fTempReplicoes.FieldByName('RECEBER').AsString := buscas2.FieldByName('RECEBER').AsString;
          fTempReplicoes.FieldByName('TABELA').AsString := vDadosIni.getCampoPipe(buscas2.FieldByName('LISTA').AsString + '|', 2);
          fTempReplicoes.FieldByName('ENVREC').AsString := vDadosIni.getCampoPipe(buscas2.FieldByName('LISTA').AsString + '|', 1);
          fTempReplicoes.FieldByName('SEQID_INI').AsInteger := StrToIntDef(vDadosIni.getCampoPipe(buscas2.FieldByName('LISTA').AsString + '|', 8), 0);
          fTempReplicoes.FieldByName('SEQID_FIM').AsInteger := StrToIntDef(vDadosIni.getCampoPipe(buscas2.FieldByName('LISTA').AsString + '|', 9), 0);

          buscas.Close;
          buscas.SQL.Text := ' SELECT COD_SCRIPT, STATUS FROM WSR_SCRIPTS ' +
            ' WHERE TIPO = ''R'' AND TOKEN = ' + QuotedStr(fTempReplicoes.FieldByName('TOKEN_ORIG').AsString) +
            ' AND TABELA = ' + QuotedStr(fTempReplicoes.FieldByName('TABELA').AsString) +
            ' AND ENVREC = ' + QuotedStr(fTempReplicoes.FieldByName('ENVREC').AsString) +
            ' AND COD_EMPRESA = ' + IntToStr(fTempReplicoes.FieldByName('COD_EMPRESA').AsInteger) +
            ' AND COD_EMP_FIS = ' + IntToStr(fTempReplicoes.FieldByName('COD_EMPRESA_FISICA').AsInteger) +
            ' AND SEQID_WS = ' + IntToStr(fTempReplicoes.FieldByName('SEQID_FIM').AsInteger) +
            ' AND ATIVO = 1 ';
          buscas.Open;

          if not buscas.IsEmpty then
          begin
             fTempReplicoes.FieldByName('SEL').AsString := 'S';
             fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger := buscas.FieldByName('COD_SCRIPT').AsInteger;
             fTempReplicoes.FieldByName('STATUS').AsString := buscas.FieldByName('STATUS').AsString;
          end
          else
          begin
             fTempReplicoes.FieldByName('SEL').AsString := 'N';
             fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger := 0;
          end;

          fTempReplicoes.Post;
//        end;
        end;

      buscas2.Next;
   end;

   fTempReplicoes.IndexFieldNames := 'TOKEN; COD_EMPRESA; TABELA; ENVREC; COD_EMPRESA_FISICA;';
   fTempReplicoes.First;

end;

constructor TReplicacoesWS.create;
begin
  dataset := TClientDataSet(dtmConfig.cdswsReplicacoes);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  fTempReplicoes := TClientDataSet.Create(nil);
  fTempReplicoes.Close;
  fTempReplicoes.FieldDefs.Clear;
  fTempReplicoes.FieldDefs.Add('TOKEN', ftString, 30, false);
  fTempReplicoes.FieldDefs.Add('TOKEN_ORIG', ftString, 128, false);
  fTempReplicoes.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  fTempReplicoes.FieldDefs.Add('COD_EMPRESA_FISICA', ftInteger, 0, false);
  fTempReplicoes.FieldDefs.Add('COD_CENT_DIS', ftInteger, 0, false);
  fTempReplicoes.FieldDefs.Add('COD_EMPRESAS_FISICA', ftString, 16, false);
  fTempReplicoes.FieldDefs.Add('RECEBER', ftString, 1, false);
  fTempReplicoes.FieldDefs.Add('TABELA', ftString, 31, false);
  fTempReplicoes.FieldDefs.Add('ENVREC', ftString, 1, false);
  fTempReplicoes.FieldDefs.Add('SEQID_INI', ftInteger, 0, false);
  fTempReplicoes.FieldDefs.Add('SEQID_FIM', ftInteger, 0, false);
  fTempReplicoes.FieldDefs.Add('SEL', ftString, 1, false);
  fTempReplicoes.FieldDefs.Add('SINC', ftString, 1, false);
  fTempReplicoes.FieldDefs.Add('STATUS', ftString, 10, false);
  fTempReplicoes.FieldDefs.Add('COD_SCRIPT', ftInteger, 0, false);

  if fTempReplicoes.Tag = 0 then
  try
    fTempReplicoes.CreateDataSet;
    fTempReplicoes.Tag := 1;

    fTempReplicoes.FieldByName('COD_EMPRESA_FISICA').Visible := false;
    fTempReplicoes.FieldByName('COD_CENT_DIS').Visible := false;
    fTempReplicoes.FieldByName('COD_EMPRESAS_FISICA').Visible := false;
    fTempReplicoes.FieldByName('RECEBER').Visible := false;
    fTempReplicoes.FieldByName('TOKEN_ORIG').Visible := false;
    fTempReplicoes.FieldByName('SEL').Visible := false;
    fTempReplicoes.FieldByName('COD_SCRIPT').Visible := false;

    fTempReplicoes.FieldByName('TOKEN').DisplayLabel := 'Schema';
    fTempReplicoes.FieldByName('COD_EMPRESA').DisplayLabel := 'Empresa';
    fTempReplicoes.FieldByName('ENVREC').DisplayLabel := 'Tipo';
    fTempReplicoes.FieldByName('TABELA').DisplayLabel := 'Tabela';
    fTempReplicoes.FieldByName('SEQID_INI').DisplayLabel := 'Início';
    fTempReplicoes.FieldByName('SEQID_FIM').DisplayLabel := 'Fim';
    fTempReplicoes.FieldByName('SINC').DisplayLabel := 'Sincronizando';

    fTempReplicoesDtSource := TDataSource.Create(nil);
    fTempReplicoesDtSource.DataSet := fTempReplicoes;
  except
  end;
end;

function TReplicacoesWS._abreFormReplicacaPendentes: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.ShowHint := True;
    formulario.Position := poMainFormCenter;
    formulario.BorderIcons := [biSystemMenu];
    formulario.Caption := 'Sincronização em andamento';
    frmCadConfigWS.pnReplicacoes.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.OnKeyDown := frmCadConfigWS.KeyDownReplicacao;
    frmCadConfigWS.DBGrid8.DataSource := fTempReplicoesDtSource;
  	 abreReplicacoes;
    result := (formulario.ShowModal = mrOk);
  finally
    frmCadConfigWS.pnReplicacoes.Parent := frmCadConfigWS.TabSheet12;
    formulario.Free;
    formulario := nil;
  end;
end;

function TReplicacoesWS._concluirReplicacao: boolean;
var
 vCodigo: Integer;
begin
  try
    vCodigo := 0;
    Result := true;

    if fTempReplicoes.IsEmpty then
    begin
      Application.MessageBox('Nenhuma replicação em andamento selecionada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    if not vDadosIni.PesqPros('CWS036', 'FINALIZAR', '', 'WSR_SCRIPTS',
      fTempReplicoes.FieldByName('COD_SCRIPT').AsString, buscas, true) then
        Exit;

    if fTempReplicoes.FieldByName('SEL').AsString = 'S' then
    begin
      Application.MessageBox('Registro já marcado para finalizar sincronização', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    if fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger > 0 then
    begin
       Application.MessageBox('Registro já marcado para finalizar sincronização', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
       exit;
    end;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COD_SCRIPT FROM WSR_SCRIPTS ' +
      ' WHERE COD_SCRIPT = ' + IntToStr(fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger);
    buscas.Open;

    if buscas.FieldByName('COD_SCRIPT').AsInteger > 0 then
    begin
      Application.MessageBox('Registro já marcado para finalizar sincronização', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);

      fTempReplicoes.Edit;
      fTempReplicoes.FieldByName('SEL').AsString := 'S';
      fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger := buscas.FieldByName('COD_SCRIPT').AsInteger;
      fTempReplicoes.Post;
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := ' INSERT INTO WSR_SCRIPTS (COD_SCRIPT, TIPO, TOKEN, USER_BANCO, TABELA, STATUS, ATIVO, ' +
      ' 	ENVREC, COD_EMPRESA, COD_EMP_FIS, SEQID_WS) ' +
      ' VALUES (:COD_SCRIPT, :TIPO, :TOKEN, :USER_BANCO, :TABELA, :STATUS, :ATIVO, ' +
      '		:ENVREC, :COD_EMPRESA, :COD_EMP_FIS, :SEQID_WS);';
    vCodigo := Gencodigo('WSR_SCRIPTS', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);
    buscas.ParamByName('COD_SCRIPT').AsInteger := vCodigo;
    buscas.ParamByName('TOKEN').AsString := fTempReplicoes.FieldByName('TOKEN_ORIG').AsString;
    buscas.ParamByName('TIPO').AsString := 'R';
    buscas.ParamByName('USER_BANCO').AsString := 'SYSDBA';
    buscas.ParamByName('STATUS').AsString := 'PENDENTE';
    buscas.ParamByName('ATIVO').AsInteger := 1;
    buscas.ParamByName('TABELA').AsString := fTempReplicoes.FieldByName('TABELA').AsString;
    buscas.ParamByName('ENVREC').AsString := fTempReplicoes.FieldByName('ENVREC').AsString;
    buscas.ParamByName('COD_EMPRESA').AsInteger := fTempReplicoes.FieldByName('COD_EMPRESA').AsInteger;
    buscas.ParamByName('COD_EMP_FIS').AsInteger := fTempReplicoes.FieldByName('COD_EMPRESA_FISICA').AsInteger;
    buscas.ParamByName('SEQID_WS').AsInteger := fTempReplicoes.FieldByName('SEQID_FIM').AsInteger;
    buscas.ExecSQL;

    fTempReplicoes.Edit;
    fTempReplicoes.FieldByName('SEL').AsString := 'S';
    fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger := vCodigo;
    fTempReplicoes.Post;

    if transacao.InTransaction then
      transacao.Commit;
    vDadosIni.GravaAuditoria('CWS036', 'FINALIZAR', 'SUCESSO', 'WSR_SCRIPTS', IntToStr(vCodigo), buscas);
  except
    on e: exception do
    begin
      Result := false;
      vDadosIni.GravaAuditoria('CWS036', 'FINALIZAR', 'FALHA', 'WSR_SCRIPTS', IntToStr(vCodigo), buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TReplicacoesWS._demarcarReplicacao: boolean;
begin
  try
    Result := true;

    if fTempReplicoes.IsEmpty then
    begin
      Application.MessageBox('Nenhuma replicação em andamento selecionada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    if fTempReplicoes.FieldByName('SEL').AsString = 'N' then
    begin
      Application.MessageBox('Registro já desmarcado para não finalizar sincronização', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    if not vDadosIni.PesqPros('CWS037', 'DESMARCAR', '', 'WSR_SCRIPTS',
      fTempReplicoes.FieldByName('COD_SCRIPT').AsString, buscas, true) then
        Exit;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COD_SCRIPT, STATUS FROM WSR_SCRIPTS ' +
      ' WHERE COD_SCRIPT = ' + IntToStr(fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger);
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Application.MessageBox('Registro já desmarcado para não finalizar sincronização', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);

      fTempReplicoes.Edit;
      fTempReplicoes.FieldByName('SEL').AsString := 'N';
      fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger := 0;
      fTempReplicoes.Post;
      exit;
    end;

    if (trim(buscas.FieldByName('STATUS').AsString) = 'FALHA')
      or (trim(buscas.FieldByName('STATUS').AsString) = 'CONCLUIDO') then
    begin
      Application.MessageBox('Registro já foi executado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := ' DELETE FROM WSR_SCRIPTS ' +
      ' WHERE COD_SCRIPT = ' + IntToStr(fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger);
    buscas.ExecSQL;

    fTempReplicoes.Edit;
    fTempReplicoes.FieldByName('SEL').AsString := 'N';
    fTempReplicoes.FieldByName('COD_SCRIPT').AsInteger := 0; 
    fTempReplicoes.Post;

    if transacao.InTransaction then
      transacao.Commit;
    vDadosIni.GravaAuditoria('CWS037', 'DESMARCAR', 'SUCESSO', 'WSR_SCRIPTS', fTempReplicoes.FieldByName('COD_SCRIPT').AsString, buscas);
  except
    on e: exception do
    begin
      Result := false;
      vDadosIni.GravaAuditoria('CWS037', 'DESMARCAR', 'FALHA', 'WSR_SCRIPTS', fTempReplicoes.FieldByName('COD_SCRIPT').AsString, buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TScriptWS }

function TScriptWS.abreScript: boolean;
begin
  Result := montaSelect(' SELECT * FROM WSR_SCRIPTS ' +
  	' WHERE TIPO = ''S'' AND ATIVO = 1 ORDER BY COD_SCRIPT DESC ');
end;

constructor TScriptWS.create;
begin
  dataset := TClientDataSet(dtmConfig.cdswsScript);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

function TScriptWS.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('COD_SCRIPT').AsString;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;
  abreScript;
  if Result then
    vDadosIni.GravaAuditoria('CWS041', 'EXCLUIR', 'SUCESSO', 'WSR_SCRIPTS', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('CWS041', 'EXCLUIR', 'FALHA', 'WSR_SCRIPTS', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

function TScriptWS.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CWS040', 'ALTERAR', '', 'WSR_SCRIPTS',
    '', buscas, false) then
    Exit;

  if trim(dataSet.FieldByName('STATUS').AsString) <> 'PENDENTE' then
  begin
  	Application.MessageBox(pchar('Script já executado'), 'Atenção', MB_OK);
    Result := false;
    exit;
  end;
  
  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('TOKEN').AsString := dataSet.FieldByName('TOKEN').AsString;
    dataSet.FieldByName('USER_BANCO').AsString := dataSet.FieldByName('USER_BANCO').AsString;
  end;
end;

function TScriptWS.executarScript: boolean;
begin
	try
    Result := false;

    if trim(dataSet.FieldByName('TOKEN').AsString) <> 'WEBSERVICE' then
    begin
    	Result := true;
      exit;
    end;

  	dtmConfig.IBDatabaseScript.ForceClose;
    dtmConfig.IBDatabaseScript.Close;
  	dtmConfig.IBDatabaseScript.DatabaseName := vDadosIni.vBancoHW;
    dtmConfig.IBDatabaseScript.Params[0] := 'user_name= ' + dataSet.FieldByName('USER_BANCO').AsString;
    dtmConfig.IBDatabaseScript.Params[1] := 'password=masterkey ';
    dtmConfig.IBDatabaseScript.LoginPrompt := false;
		dtmConfig.IBDatabaseScript.Connected := true;

    if dtmConfig.IBDatabaseScript.Connected then
    begin
      dtmConfig.IBQueryScript.Close;
      dtmConfig.IBQueryScript.SQL.Text := dataSet.FieldByName('SQL').AsString;
      dtmConfig.IBQueryScript.ExecSQL;

      if dtmConfig.IBTransactionScript.InTransaction then
        dtmConfig.IBTransactionScript.Commit;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE WSR_SCRIPTS SET STATUS = :STATUS, ERRO = :ERRO ' +
        ' WHERE COD_SCRIPT = :COD_SCRIPT ';
      buscas.ParamByName('STATUS').AsString := 'CONCLUIDO';
      buscas.ParamByName('COD_SCRIPT').AsInteger := dataSet.FieldByName('COD_SCRIPT').AsInteger;
      buscas.ExecSQL;

      CommitaTransacao;
    end
    else
    	 Application.MessageBox(pchar('Script não executado'), 'Atenção', MB_OK);

    Result := true;

  except
    on e: exception do
    begin
      buscas.Close;
      buscas.SQL.Text := ' UPDATE WSR_SCRIPTS SET STATUS = :STATUS, ERRO = :ERRO ' +
        ' WHERE COD_SCRIPT = :COD_SCRIPT ';
      buscas.ParamByName('STATUS').AsString := 'FALHA';
      buscas.ParamByName('ERRO').AsString := e.Message;
      buscas.ParamByName('COD_SCRIPT').AsInteger := dataSet.FieldByName('COD_SCRIPT').AsInteger;
      buscas.ExecSQL;

      CommitaTransacao;

      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TScriptWS.Insert: boolean;
begin
  if not vDadosIni.PesqPros('CWS039', 'INCLUIR', '', 'WSR_SCRIPTS',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from wsr_scripts ' +
      ' where cod_script=0 and ativo=0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('TIPO').AsString := 'S';
    dataSet.FieldByName('ATIVO').AsFloat := 1;
    dataSet.FieldByName('STATUS').AsString := 'PENDENTE';
  end;
end;

function TScriptWS.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;
    
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if not vDadosIni.PesqPros('CWS042', 'SALVAR', '', 'WSR_SCRIPTS',
      dataSet.FieldByName('COD_SCRIPT').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('TOKEN').AsString) = '' then
      raiseExceptionCreate('Destino deve ser informado', 'DBComboBox8');

    if trim(dataSet.FieldByName('USER_BANCO').AsString) = '' then
      raiseExceptionCreate('Usuário deve ser informado', 'DBComboBox9');
      
    if trim(dataSet.FieldByName('SQL').AsString) = '' then
      raiseExceptionCreate('Script deve ser informado', 'DBMemo1');

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('COD_SCRIPT').AsInteger :=
        Gencodigo('WSR_SCRIPTS', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);

    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    executarScript;  

    if Result then
      vDadosIni.GravaAuditoria('CWS042', acao, 'SUCESSO', 'WSR_SCRIPTS',
        dataSet.FieldByName('COD_SCRIPT').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('CWS042', acao, 'FALHA', 'WSR_SCRIPTS',
        dataSet.FieldByName('COD_SCRIPT').AsString, buscas);

        
    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TScriptWS.verificaDestino(vcomb: TDbCombobox): boolean;
begin
  Result := false;

  buscas.close;
  buscas.sql.text := ' select token from wsr_schemas ' +
  	' where ativo = 1 ' +
    ' order by token ';
  buscas.open;
  vcomb.Items.Clear;
  vcomb.Items.Add('WEBSERVICE');
  while not buscas.eof do
  begin
    vcomb.Items.Add(buscas.FieldByName('token').AsString);
    buscas.next;
  end;
  Result := true;
end;

{ TSchemasWs }

function TSchemasWs.abreSchema: boolean;
begin
	Result := montaSelect(' SELECT * FROM WSR_SCHEMAS ' +
  	' WHERE COD_SCHEMA > 0 AND ATIVO = 1 ');
end;

constructor TSchemasWs.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsConsultaSchemas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TSchemasScript }

function TSchemasScript.abreSchema: boolean;
begin
	Result := montaSelect(' SELECT * FROM WSR_SCHEMAS ' +
  	' WHERE ATIVO = 1 ORDER BY COD_SCHEMA ');
end;

constructor TSchemasScript.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsSchemasScript);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

function TSchemasScript.salvarDadosScript(vNomeSchema, vUser, vSql, vStatus, vErro: string): boolean;
var
  acao: string;
begin
	try
    if trim(vStatus) <> '' then
    begin
      buscas.Close;
      buscas.SQL.Text := ' UPDATE WSR_SCRIPTS SET STATUS = :STATUS, ERRO = :ERRO ' +
      	' WHERE COD_SCRIPT = :COD_SCRIPT ';
      buscas.ParamByName('COD_SCRIPT').AsInteger := vCodScript;
	    buscas.ParamByName('STATUS').AsString := vStatus;
      if trim(vErro) <> '' then
	    	buscas.ParamByName('ERRO').AsString := vErro;
      buscas.ExecSQL;
      CommitaTransacao;

      exit;
    end;
  	buscas.Close;
  	buscas.SQL.Text := ' INSERT INTO WSR_SCRIPTS (COD_SCRIPT, TIPO, TOKEN, ' +
  		' USER_BANCO, SQL, STATUS, ATIVO, COD_EMPRESA,  ERRO) ' +
    	' VALUES (:COD_SCRIPT, :TIPO, :TOKEN, :USER_BANCO, :SQL, :STATUS, :ATIVO, :COD_EMPRESA, :ERRO); ';
    vCodScript := Gencodigo('WSR_SCRIPTS', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);
  	buscas.ParamByName('COD_SCRIPT').AsInteger := vCodScript;
    buscas.ParamByName('TIPO').AsString := 'S';
    buscas.ParamByName('TOKEN').AsString := vNomeSchema;
    buscas.ParamByName('USER_BANCO').AsString := vUser;
    buscas.ParamByName('SQL').AsString := vSql;
    if trim(vStatus) <> '' then
	    buscas.ParamByName('STATUS').AsString := vStatus
    else
    	buscas.ParamByName('STATUS').AsString := 'PENDENTE';
    buscas.ParamByName('ATIVO').AsInteger := 1;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    if trim(vErro) <> '' then
	    buscas.ParamByName('ERRO').AsString := vErro;
    buscas.ExecSQL;

    CommitaTransacao;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TSchemasScript.verificarSchema;
begin
   try
     buscas.Close;
     buscas.SQL.Text := ' SELECT COD_SCHEMA FROM WSR_SCHEMAS ' +
      ' WHERE COD_SCHEMA = :COD_SCHEMA AND IDENTIFICACAO = ''WEBSERVICE'' ';
     buscas.ParamByName('COD_SCHEMA').AsInteger := 0;
     buscas.Open;

     if buscas.IsEmpty then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE OR INSERT INTO WSR_SCHEMAS ' +
        ' (COD_SCHEMA, COD_EMPRESA, IDENTIFICACAO, TOKEN, ATIVO) ' +
        ' VALUES (:COD_SCHEMA, :COD_EMPRESA, :IDENTIFICACAO, :TOKEN, :ATIVO) ' +
        ' MATCHING (COD_SCHEMA); ';
       buscas.ParamByName('COD_SCHEMA').AsInteger := 0;
       buscas.ParamByName('COD_EMPRESA').AsInteger := 0;
       buscas.ParamByName('IDENTIFICACAO').AsString := 'WEBSERVICE';
       buscas.ParamByName('TOKEN').AsString := 'WEBSERVICE';
       buscas.ParamByName('ATIVO').AsInteger := 1;
       buscas.ExecSQL;
     end;

     buscas.Close;
     buscas.SQL.Text := ' SELECT COD_SCHEMA FROM WSR_EMPRESAS ' +
      ' WHERE COD_EMPRESA = :COD_EMPRESA AND COD_SCHEMA = :COD_SCHEMA ';
     buscas.ParamByName('COD_EMPRESA').AsInteger := 0;
     buscas.ParamByName('COD_SCHEMA').AsInteger := 0;
     buscas.Open;

     if buscas.IsEmpty then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE OR INSERT INTO WSR_EMPRESAS ' +
        ' (COD_EMPRESA, COD_SCHEMA, ATIVO, ORDEM) ' +
        ' VALUES (:COD_EMPRESA, :COD_SCHEMA, :ATIVO, :ORDEM) ' +
        ' MATCHING (COD_EMPRESA, COD_SCHEMA); ';
       buscas.ParamByName('COD_EMPRESA').AsInteger := 0;
       buscas.ParamByName('COD_SCHEMA').AsInteger := 0;
       buscas.ParamByName('ATIVO').AsInteger := 0;
       buscas.ParamByName('ORDEM').AsInteger := 0;
       buscas.ExecSQL;
     end;

     if buscas.Transaction.InTransaction then
       buscas.Transaction.Commit;
  except on E: Exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TSchemasScript._abreFormScripts(vNomeSchema, vUser, vScript, vErro: string): boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.ShowHint := True;
    formulario.Position := poMainFormCenter;
    formulario.BorderIcons := [biSystemMenu];
    formulario.Caption := 'Scripts';
    frmCadConfigWS.pnScriptM.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.OnKeyDown := frmCadConfigWS.KeyDownScript;
    frmCadConfigWS.ComboBox14.Items.Clear;

    buscas.Close;
	  buscas.SQL.Text :=  ' SELECT TOKEN FROM WSR_SCHEMAS ' +
  		' WHERE ATIVO = 1 ORDER BY COD_SCHEMA ';
    buscas.Open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.Eof do
    begin
    	frmCadConfigWS.ComboBox14.Items.Add(buscas.FieldByName('TOKEN').AsString);
      
    	buscas.Next;
    end;
    frmCadConfigWS.ComboBox14.Text := vNomeSchema;
    frmCadConfigWS.ComboBox15.Text := vUser;
    frmCadConfigWS.Memo1.Text := vScript;
    frmCadConfigWS.Memo2.Text := vErro;

    result := (formulario.ShowModal = mrOk);
  finally
    frmCadConfigWS.pnScriptM.Parent := frmCadConfigWS.TabSheet9;
    formulario.Free;
    formulario := nil;
  end;
end;

{ TConfigAPI }

function TConfigAPI.abreFormOpcoes: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 505;
    formulario.Height := 168;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'API';
    frmCadConfigAPI.pnOpcoesAPI.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 0 then
      begin
        dataSet.FieldByName('API').AsString := 'TRAYCOMMERCE';
      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 1 then
      begin
      	dataSet.FieldByName('API').AsString := 'NUVEMSHOP';
        dataSet.FieldByName('URL_API').AsString := 'https://api.nuvemshop.com.br/v1';
      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 2 then
      begin
      	dataSet.FieldByName('API').AsString := 'COMERCIOABERTO';
      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 3 then
      begin
        dataSet.FieldByName('API').AsString := 'PROGRAMAFIDELIDADE';
        dataSet.FieldByName('URL_API').AsString := 'https://api.sistemafidelidade.com.br';
      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 4 then
      begin
        dataSet.FieldByName('API').AsString := 'NUMMUSCASHBACK';
        dataSet.FieldByName('URL_API').AsString := 'https://api.production.nummus.com.br/v1|||';
      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 5 then
      begin
      	dataSet.FieldByName('API').AsString := 'CONFERE';
        dataSet.FieldByName('URL_API').AsString := 'https://api.confere.com.br/integrations';
      end
//      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 6 then
//      begin
//      	dataSet.FieldByName('API').AsString := 'KENTRO';
//        dataSet.FieldByName('URL_API').AsString := '';
//      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 6 then
      begin
      	dataSet.FieldByName('API').AsString := 'BOLETO_API';
      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 7 then
      begin
        dataSet.FieldByName('API').AsString := 'HWCLOUD_IA';
      end
      else if frmCadConfigAPI.RadioGroupOpcoes.ItemIndex = 8 then
      begin
        dataSet.FieldByName('API').AsString := 'SUZUKI';
      end;
    end;
    frmCadConfigAPI.pnOpcoesAPI.Parent := frmCadConfigAPI.tsOpcoes;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfigAPI.addItemTreeViewPromocaoDB(pTipo: string; pTreeView, pTreeView2: TTreeView; pPromocao: string): boolean;
var
  I: Integer;
  vcodpromocao: Integer;
  ANode: TtreeNode;
begin
  try
    Result := true;
    vcodpromocao := 0;

    if pTreeView.Items.Count <= 0 then
      exit;

    try
      vcodpromocao := StrToInt(trim(Copy(pPromocao, 1, Pos('|', pPromocao) - 1)));
    except
      Application.MessageBox(PChar('Falha ao selecionar tabela de preço: ' + trim(pPromocao)), 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vcodpromocao := 0;
      Exit;
    end;

    if vcodpromocao = 0 then
      exit;

    try
      vConfigAPIpromocaoOrdem.dataSet.Filtered := false;
      vConfigAPIpromocaoOrdem.dataSet.Filter := 'cod_promocao = ' + IntToStr(vcodpromocao);
      vConfigAPIpromocaoOrdem.dataSet.Filtered := true;

      if not vConfigAPIpromocaoOrdem.dataSet.IsEmpty then
      begin
        Application.MessageBox(PChar('Tabela de preço já adicionada: ' + trim(pPromocao)), 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        vcodpromocao := 0;
        Exit;
      end;
    finally
      vConfigAPIpromocaoOrdem.dataSet.Filtered := false;
      vConfigAPIpromocaoOrdem.IndexFieldNames := 'ordem';
    end;

    vConfigAPIpromocaoOrdem.dataSet.Insert;
    vConfigAPIpromocaoOrdem.dataSet.FieldByName('cod_promocao').AsInteger := vcodpromocao;
    vConfigAPIpromocaoOrdem.dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    vConfigAPIpromocaoOrdem.dataSet.FieldByName('tab_ce').AsString := 'S';
    vConfigAPIpromocaoOrdem.dataSet.Post;
    vConfigAPIpromocaoOrdem.Apply;

    vConfigAPIpromocaoOrdem.abrePromocaoOrdem(pTipo);
    montarTreeViewPromocaoDB(pTipo, pTreeView, pTreeView2);
    
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfigAPI.buscarColaboradorVendedor(pCodigo: Integer): boolean;
begin
  try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COLABORADOR.COD_VENDEDOR, FUNCOES.DESC_FUNCAO FROM COLABORADOR ' +
      ' LEFT JOIN FUNCOES ON FUNCOES.COD_FUNCAO = COLABORADOR.COD_FUNCAO ' +
    	' WHERE COLABORADOR.COD_VENDEDOR = :COD_VENDEDOR  ' +
      ' AND COLABORADOR.COD_EMPRESA = :COD_EMPRESA ' +
      ' AND COLABORADOR.ATIVO = 1 ';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('COD_VENDEDOR').AsInteger := pCodigo;
    buscas.Open;

    if Pos('VEND', trim(buscas.FieldByName('DESC_FUNCAO').AsString)) <= 0 then
    begin
    	Result := false;
      exit;
    end;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfigAPI.buscarCondPag(pCodigo: Integer): boolean;
begin
 try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COND_PAG.COD_COND_PAG, COND_PAG.DESC_COND_PAG FROM COND_PAG ' +
    	' WHERE COND_PAG.COD_COND_PAG = :COD_COND_PAG ' +
      ' AND COND_PAG.ATIVO = 1 ';
    buscas.ParamByName('COD_COND_PAG').AsInteger := pCodigo;
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;	
end;

function TConfigAPI.buscarPromocao(pCodigo: Integer): boolean;
begin
  try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.DESCR_PROMOCAO FROM PROMOCAO ' +
      ' LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_TPPRECO AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA ' +
    	' WHERE PROMOCAO.COD_PROMOCAO = :COD_PROMOCAO AND PROMOCAO.COD_EMPRESA = :COD_EMPRESA ' +
      ' AND PROMOCAO.COD_PROMOCAO > 0 AND PROMOCAO.DATA_INI IS NOT NULL AND PROMOCAO.DATA_FIM IS NOT NULL ' +
      ' AND PROMOCAO.ATIVO = 1 ';
    buscas.ParamByName('COD_PROMOCAO').AsInteger := pCodigo;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfigAPI.buscarTabela(pCodigo: Integer): boolean;
begin
  try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.DESCR_PROMOCAO FROM PROMOCAO ' +
      ' LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_TPPRECO AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA ' +
    	' WHERE PROMOCAO.COD_PROMOCAO = :COD_PROMOCAO AND PROMOCAO.COD_EMPRESA = :COD_EMPRESA ' +
      ' AND PROMOCAO.COD_PROMOCAO > 0 ' + //AND TIPO_PRECO.TIPO = ''T'' ' +
      ' AND PROMOCAO.ATIVO = 1 ';
    buscas.ParamByName('COD_PROMOCAO').AsInteger := pCodigo;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfigAPI.buscarTipoCliente(pCodigo: Integer): boolean;
begin
  try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' SELECT CODIGO_TIPO FROM TIPOS_CLIENTES ' +
    	' WHERE TIPOS_CLIENTES.CODIGO_TIPO = :CODIGO_TIPO  ' +
      ' AND TIPOS_CLIENTES.ATIVO = 1 ';
    buscas.ParamByName('CODIGO_TIPO').AsInteger := pCodigo;
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfigAPI.buscarTipoVenda(pTipo: string; pSigla: string): boolean;
begin
  try
    Result := true;

    buscas.Close;
    if trim(pTipo) = 'OS' then
    begin
    	buscas.SQL.Text := ' SELECT COD_TIPO, TIPO FROM TIPO_VENDAS ' +
        ' WHERE TIPO = :TIPO AND TIPO_OS = :TIPO_OS ';
      buscas.ParamByName('TIPO_OS').AsString := pSigla;
    end
    else
    begin
      buscas.SQL.Text := ' SELECT COD_TIPO, TIPO FROM TIPO_VENDAS ' +
        ' WHERE TIPO = :TIPO AND SIGLA = :SIGLA ';
      buscas.ParamByName('SIGLA').AsString := pSigla;
    end;
    buscas.ParamByName('TIPO').AsString := trim(pTipo);
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfigAPI.buscarVendedor(pCodigo: Integer): boolean;
begin
  try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COLABORADOR.COD_VENDEDOR, FUNCOES.DESC_FUNCAO FROM COLABORADOR ' +
      ' LEFT JOIN FUNCOES ON FUNCOES.COD_FUNCAO = COLABORADOR.COD_FUNCAO ' +
    	' WHERE COLABORADOR.COD_VENDEDOR = :COD_VENDEDOR  ' +
      ' AND COLABORADOR.COD_EMPRESA = :COD_EMPRESA ' +
      ' AND COLABORADOR.ATIVO = 1 ';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('COD_VENDEDOR').AsInteger := pCodigo;
    buscas.Open;

    Result := not buscas.IsEmpty;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TConfigAPI.cadConfigAPI(Tipoform: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('','Abrindo Configuração da API');

    vDadosIni.vTipoForm := 0;
    if dtmConfig = nil then
      dtmConfig := TdtmConfig.Create(dtmConfig);

    if not vDadosIni.PesqPros('API001', 'CONSULTA', '', 'CONFIG_API', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmCadConfigAPI = nil then
      Application.CreateForm(TfrmCadConfigAPI, frmCadConfigAPI);

    if (TipoForm > 0) and (not frmCadConfigAPI.Visible) then
      frmCadConfigAPI.ShowModal
    else if (not frmCadConfigAPI.Visible) then
      frmCadConfigAPI.Show
    else if frmCadConfigAPI.FormStyle = fsMDIChild then
      frmCadConfigAPI.Show
    else
      frmCadConfigAPI.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TConfigAPI.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsConfigAPI);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  vMsgPlataforma := TMsgPlataforma.Create;
  vConfigAPIcondpag := TConfigAPIcondpag.create;
  vConfigAPItipocliente := TConfigAPItipocliente.Create;
  vConfigAPIvendedor := TConfigAPIvendedor.Create;
  vConfigAPIpromocao := TConfigAPIpromocao.Create;
  vConfigAPItabela := TConfigAPItabela.Create;
  vConfigAPIpromocaoOrdem := TConfigAPIpromocaoOrdem.Create;
  vConfigAPIcollectionsRag := TConfigAPIcollectionsRag.create;

  dataSet.FieldByName('token_api').OnGetText := dataSetGetText;
end;

procedure TConfigAPI.dataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if fequals('API', 'COMERCIOABERTO') and (string(Sender.FieldName) = 'TOKEN_API') then
    Text := PadL('*', Length(Sender.AsString))
  else
    Text := Sender.AsString;
end;

function TConfigAPI.delete: Boolean;
var
  codigo: string;
begin
  if dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('API005', 'EXCLUIR', '', 'CONFIG_API', vDadosIni.codEmpresa, buscas, false) then
      Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    exit;

  result := inherited Delete;
  if Result then
    result := Apply;
  if result then
    result := CommitaTransacao;
  if Result then
    vDadosIni.GravaAuditoria('CWS005', 'EXCLUIR', 'SUCESSO', 'CONFIG_API', codigo, buscas)
  else
    vDadosIni.GravaAuditoria('CWS005', 'EXCLUIR', 'FALHA', 'CONFIG_API', codigo, buscas);
  Refresh;
end;

function TConfigAPI.deleteItemTreeViewPromocaoDB(pTipo: string; pTreeView: TTreeView; pPromocao: string): boolean;
var
  I: Integer;
  vcodpromocao: Integer;
begin
  try
    Result := true;
    vcodpromocao := 0;

    if pTreeView.Items.Count <= 0 then
      exit;

    try
      vcodpromocao := StrToInt(trim(Copy(pPromocao, 1, Pos('|', pPromocao) - 1)));
    except
      Application.MessageBox(PChar('Falha ao selecionar tabela de preço: ' + trim(pPromocao)), 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vcodpromocao := 0;
      Exit;
    end;

    if vcodpromocao = 0 then
      exit;

    try
      vConfigAPIpromocaoOrdem.dataSet.Filtered := false;
      vConfigAPIpromocaoOrdem.dataSet.Filter := 'cod_promocao = ' + IntToStr(vcodpromocao);
      vConfigAPIpromocaoOrdem.dataSet.Filtered := true;

      if not vConfigAPIpromocaoOrdem.dataSet.IsEmpty then
      begin
        vConfigAPIpromocaoOrdem.dataSet.Delete;
        vConfigAPIpromocaoOrdem.Apply;

        for I := 0 to pTreeView.Items.Count - 1 do
          if pTreeView.Items[I].Text = pPromocao then
          begin
            pTreeView.Items[I].Delete;
            break;
          end;
      end;
    finally
      vConfigAPIpromocaoOrdem.dataSet.Filtered := false;
      vConfigAPIpromocaoOrdem.IndexFieldNames := 'ordem';
    end;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TConfigAPI.destroy;
begin
  vMsgPlataforma.Free;
  vMsgPlataforma := nil;

  vConfigAPIcondpag.Free;
  vConfigAPIcondpag := nil;

  vConfigAPItipocliente.Free;
  vConfigAPItipocliente := nil;

  vConfigAPIvendedor.Free;
  vConfigAPIvendedor := nil;

  vConfigAPIpromocao.Free;
  vConfigAPIpromocao := nil;

  vConfigAPItabela.Free;
  vConfigAPItabela := nil;

  vConfigAPIpromocaoOrdem.Free;
  vConfigAPIpromocaoOrdem := nil;

  vConfigAPIcollectionsRag.Free;
  vConfigAPIcollectionsRag := nil;

  inherited;
end;

function TConfigAPI.edit: Boolean;
var
	vDataBanco: TDateTime;
begin
	try
  	Result := False;

    vcodvendedor := 0;
    vcodtipocliente := 0;
    vcodpromocao := 0;
    vcodtabela := 0;
    vCodTabelaOld := 0;
    vAmbiente := '';
    vUserId := '';
    vUserIdOld := '';

    vDataBanco := vDadosIni.getDataBanco(buscas);

    if (dataSet.IsEmpty) then
      Exit;

    if not vDadosIni.PesqPros('API004', 'ALTERAR', '', 'CONFIG_API', vDadosIni.codEmpresa, buscas, False) then
      Exit;

    Result := inherited edit;

    if (not Result) then
      exit;

    if (trim(dataset.FieldByName('API').AsString) = 'BOLETO_API')
    	or (trim(dataset.FieldByName('API').AsString) = 'SUZUKI') then
    begin
	    vUserIdOld := trim(dataset.FieldByName('USER_ID').AsString);
      SqlOpen(' select hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')) from rdb$database ', buscas);
      vUserId := buscas.FieldByName('HASH').AsString;
    end;

    vCodTabelaOld := dataSet.FieldByName('COD_TAB_PRECO').AsInteger;

    if trim(dataset.FieldByName('API').AsString) = 'COMERCIOABERTO' then
    begin
      if fempty('nomefantasia') then
        fdata('nomefantasia').Put(vDadosIni.vEmp.vNomeEmpresa);
      if fempty('arquivologo') then
        fdata('arquivologo').Put(vDadosIni.vEmp.vNfe.pathLogo);
      if fempty('telefone') then
        fdata('telefone').Put(OnlyNumber(vDadosIni.vEmp.vTelefone));
      if fempty('emailcontato') and (not ContainsText(vDadosIni.vEmp.vEmail, 'hwsistemas')) then
        fdata('emailcontato').Put(vDadosIni.vEmp.vEmail);
    end
    else if (trim(dataset.FieldByName('API').AsString) = 'BOLETO_API') then
    begin
    	if fempty('token_api') then
      	fdata('token_api').Put('637cc5db92301540898f57addf2a8710');
      if (trim(vUserIdOld) = '') then
        Application.MessageBox('Boletos de Cobrança em ambiente de homologação.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
      else if (trim(vUserIdOld) <> trim(vUserId)) then
      	Application.MessageBox('Boletos de Cobrança em ambiente de homologação.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    end
    else if trim(dataset.FieldByName('API').AsString) = 'HWCLOUD_IA' then
    begin
      if fempty('url_api') then
        fdata('url_api').Put('https://hwcloudia.hwsistemasti.com.br/');

      if fempty('usar_api_pedido') then
        fdata('usar_api_pedido').Put('N');

      if fempty('usar_api_cog') then
        fdata('usar_api_cog').Put('N');

      if fempty('modelo_padrao') then
        fdata('modelo_padrao').Put(1);

      if fempty('ambiente_api') then
        fdata('ambiente_api').Put(vDadosIni.vEmp.vCNPJ);

      if fempty('dia_mes_ini_fat_meta') then
        fdata('dia_mes_ini_fat_meta').Put(1);

      if fempty('limite_gastos_meta') then
        fdata('limite_gastos_meta').Put(30.00);

      if fempty('tipo_venda') then
      begin
        SqlOpen(' select sigla from tipo_vendas ' +
        	 ' where tipo = ''REQ'' ' +
          ' and ativo = 1 ' +
          ' order by ordemexibicao ', buscas);
        if not buscas.IsEmpty then
        	 fdata('tipo_venda').Put(buscas.FieldByName('sigla').AsString);
      end;

      if fempty('tipo_os') then
      begin
        SqlOpen(' select tipo_os from tipo_vendas ' +
        	 ' where tipo = ''OS'' ' +
          ' and ativo = 1 ' +
          ' order by ordemexibicao ', buscas);
        if not buscas.IsEmpty then
        	 fdata('tipo_os').Put(buscas.FieldByName('tipo_os').AsString);
      end;

      if fempty('cod_cond_pag') then
         fdata('cod_cond_pag').Put(1);

      if fempty('horario_semana_ini') then
      	fdata('horario_semana_ini').Put('08:00');
      if fempty('horario_semana_fim') then
      	fdata('horario_semana_fim').Put('18:00');
      if fempty('horario_sabado_ini') then
      	fdata('horario_sabado_ini').Put('08:00');
      if fempty('horario_sabado_fim') then
      	fdata('horario_sabado_fim').Put('12:00');

      if fempty('util_recomendacao') then
      	fdata('util_recomendacao').Put('S');
      if fempty('interv_treino_recomenda') then
      	fdata('interv_treino_recomenda').Put(7);
      if fempty('dias_vnd_recomenda') then
        fdata('dias_vnd_recomenda').Put(360);
      if fempty('info_contato') then
        fdata('info_contato').Put('Você poderá falar com nosso suporte através do contato: *(11)11111-1111* (whatsapp). \nVocê també poderá ver mais sobre nossos produtos no link: https://www.empresateste.com.br'); 

      if fempty('peso_popularidade') then
      	fdata('peso_popularidade').Put('30');
      if fempty('peso_nivel_giro_medio') then
      	fdata('peso_nivel_giro_medio').Put('25');
      if fempty('peso_demanda') then
      	fdata('peso_demanda').Put('20');
      if fempty('peso_frequencia') then
      	fdata('peso_frequencia').Put('15');
      if fempty('peso_preco') then
      	fdata('peso_preco').Put('10');

      if fempty('giro_padrao_baixo_ini') then
      	fdata('giro_padrao_baixo_ini').Put('1');
      if fempty('giro_padrao_baixo_fim') then
      	fdata('giro_padrao_baixo_fim').Put('4,99');
      if fempty('giro_padrao_medio_ini') then
      	fdata('giro_padrao_medio_ini').Put('5');
      if fempty('giro_padrao_medio_fim') then
      	fdata('giro_padrao_medio_fim').Put('8,99');
      if fempty('giro_padrao_alto_ini') then
      	fdata('giro_padrao_alto_ini').Put('9');
    	if fempty('giro_padrao_alto_fim') then
      	fdata('giro_padrao_alto_fim').Put('1000');

      if fempty('cor_primary') then
        fdata('cor_primary').Put('#0070EB');
      if fempty('cor_primary_container') then
        fdata('cor_primary_container').Put('#939BA3');
      if fempty('cor_primary_fixed') then
        fdata('cor_primary_fixed').Put('#D8E2FF');
      if fempty('cor_on_primary') then
        fdata('cor_on_primary').Put('#FFFFFF');
      if fempty('cor_secondary') then
        fdata('cor_secondary').Put('#34C759');
      if fempty('cor_secondary_container') then
        fdata('cor_secondary_container').Put('#6FFB85');
      if fempty('cor_tertiary') then
        fdata('cor_tertiary').Put('#5856D6');
      if fempty('cor_error') then
        fdata('cor_error').Put('#BA1A1A');
      if fempty('cor_background') then
        fdata('cor_background').Put('#F2F2F7');
      if fempty('cor_surface_lowest') then
        fdata('cor_surface_lowest').Put('#FFFFFF');
      if fempty('cor_surface_low') then
        fdata('cor_surface_low').Put('#F3F3F8');

      if fempty('drive_type') then
      	fdata('drive_type').Put('gdrive');
      if fempty('drive_check_modif') then
      	fdata('drive_check_modif').Put('S');
   	if fempty('util_agentic_rag') then
      	fdata('util_agentic_rag').Put('S');
    end
    else if trim(dataset.FieldByName('API').AsString) = 'SUZUKI' then
    begin
    	if (trim(vUserIdOld) = '') then
        Application.MessageBox('Suzuki (Conexão Suzuki) em ambiente de homologação.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
      else if (trim(vUserIdOld) <> trim(vUserId)) then
      	Application.MessageBox('Suzuki (Conexão Suzuki) em ambiente de homologação.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    end;

    if fempty('data_cad') then
    	fdata('data_cad').Put(vDataBanco);

    if fempty('data_mod') then
      fdata('data_mod').Put(vDataBanco);

    if trim(dataSet.FieldByName('SENHA_API').AsString) <> '' then
      dataSet.FieldByName('SENHA_API').AsString :=
        vDadosIni.decodifica(dataSet.FieldByName('SENHA_API').AsString);

    if trim(dataSet.FieldByName('SENHA').AsString) <> '' then
      dataSet.FieldByName('SENHA').AsString :=
        vDadosIni.decodifica(dataSet.FieldByName('SENHA').AsString);

    vMsgPlataforma.abreMsgPlataforma;
    vConfigAPIcondpag.abreCondPag;
    vConfigAPItipocliente.abreTipoCliente;
    vConfigAPIvendedor.abreVendedor;
    vConfigAPIpromocao.abrePromocao;
    vConfigAPItabela.abreTabela;
    if trim(dataset.FieldByName('API').AsString) = 'HWCLOUD_IA' then
    	vConfigAPIpromocaoOrdem.abrePromocaoOrdem('H')
    else if trim(dataset.FieldByName('API').AsString) = 'COMERCIOABERTO' then
	    vConfigAPIpromocaoOrdem.abrePromocaoOrdem('C')
    else if trim(dataset.FieldByName('API').AsString) = 'TRAYCOMMERCE' then
    	vConfigAPIpromocaoOrdem.abrePromocaoOrdem('E')
    else if trim(dataset.FieldByName('API').AsString) = 'NUVEMSHOP' then
    	vConfigAPIpromocaoOrdem.abrePromocaoOrdem('E');
    vConfigAPIcollectionsRag.abreCollectionsRag;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end
end;

function TConfigAPI.insert: Boolean;
var
  vapi: string;
  vDataBanco: TDateTime;
begin
  try
    Result := False;

    vcodvendedor := 0;
    vcodtipocliente := 0;
    vcodpromocao := 0;
    vcodtabela := 0;
    vCodTabelaOld := 0;
    vAmbiente := '';
    vUserId := '';
    vUserIdOld := '';

    vDataBanco := vDadosIni.getDataBanco(buscas);

    if not vDadosIni.PesqPros('API003', 'INCLUIR', '', 'CONFIG_API', vDadosIni.codEmpresa, buscas, False) then
      Exit;

    if (not dataSet.Active) then
      montaSelect('SELECT CONFIG_API.*, ''TRAY (E-COMMERCE)'' as API_DESCR FROM CONFIG_API ' +
      	' WHERE CONFIG_API.COD_EMPRESA = ' + vDadosIni.codEmpresa);

    Result := inherited insert;

    if (not Result) then
    	Exit;

    if not abreFormOpcoes then
    begin
      dataSet.Cancel;
      Result := false;
      exit;
    end;

    vapi := dataSet.FieldByName('api').AsString;
    SqlOpen('select cod_empresa, api from config_api ' +
    	' where api = ' + QuotedStr(vapi) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    if not buscas.IsEmpty then
    begin
      if Application.MessageBox('Configuração já existente, deseja editar?',
       'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
      begin
        dataSet.Cancel;
        Result := false;
        exit;
      end;
      dataSet.Cancel;

      dataSet.Close;
      dataSet.CommandText := ' select config_api.*, ' +
      	' case when (config_api.api = ''TRAYCOMMERCE'') then ' +
        '        ''TRAY (E-COMMERCE)'' ' +
        '      when (config_api.api = ''NUVEMSHOP'') then ' +
        '        ''NUVEMSHOP (E-COMMERCE)'' ' +
        '      when (config_api.api = ''COMERCIOABERTO'') then ' +
        '        ''COMERCIO ABERTO (VENDAS NA INTERNET)'' ' +
        '      when (config_api.api = ''PROGRAMAFIDELIDADE'') then ' +
        '        ''SMARTBIS (PROGRAMA DE FIDELIDADE)'' ' +
        '      when (config_api.api = ''NUMMUSCASHBACK'') then ' +
        '        ''NUMMUS (CASCHBACK)'' ' +
        '      when (config_api.api = ''CONFERE'') then ' +
        '        ''CONFERE (CONCILIACAO DE CARTOES)'' ' +
        '      when (config_api.api = ''KENTRO'') then ' +
        '        ''KENTRO (GESTAO VIA MENSAGENS WHATSAPP)'' ' +
        '      when (config_api.api = ''BOLETO_API'') then ' +
        '        ''TECNOSPEED PLUG BOLETO (EMISSAO DE BOLETOS)'' ' +
        '		when (config_api.api = ''HWCLOUD_IA'') THEN ' +
    	  '		  ''HW CLOUD IA (INTEGRADOR)'' ' +
        '		WHEN (CONFIG_API.API = ''SUZUKI'') THEN ' +
        '		  ''SUZUKI (CONEXÃO SUZUKI)'' ' +
        '      else ' +
        '        config_api.api ' +
        ' end api_descr from config_api ' +
       	' where config_api.api = ' + QuotedStr(vapi) +
        ' and config_api.cod_empresa = ' + vDadosIni.codEmpresa;
      dataSet.Open;

      if not (dataSet.State in [dsInsert, dsEdit]) then
        dataSet.Edit;
    end;

    if trim(vapi) = 'COMERCIOABERTO' then
    begin
      if fempty('nomefantasia') then
        fdata('nomefantasia').Put(vDadosIni.vEmp.vNomeEmpresa);
      if fempty('arquivologo') then
        fdata('arquivologo').Put(vDadosIni.vEmp.vNfe.pathLogo);
      if fempty('telefone') then
        fdata('telefone').Put(OnlyNumber(vDadosIni.vEmp.vTelefone));
      if fempty('emailcontato') and (not ContainsText(vDadosIni.vEmp.vEmail, 'hwsistemas')) then
        fdata('emailcontato').Put(vDadosIni.vEmp.vEmail);
    end
    else if trim(vapi) = 'BOLETO_API' then
    begin
    	if fempty('token_api') then
        fdata('token_api').Put('637cc5db92301540898f57addf2a8710');
    	if fempty('chave_assign') then
	     	fdata('chave_assign').Put(vDadosIni.vEmp.vCNPJ);
  	 end
    else if trim(vapi) = 'HWCLOUD_IA' then
    begin
      if fempty('url_api') then
        fdata('url_api').Put('https://hwcloudia.hwsistemasti.com.br/');

      if fempty('usar_api_pedido') then
        fdata('usar_api_pedido').Put('N');
        
      if fempty('usar_api_cog') then
        fdata('usar_api_cog').Put('N');

      if fempty('modelo_padrao') then
        fdata('modelo_padrao').Put(1);

      if fempty('ambiente_api') then
        fdata('ambiente_api').Put(vDadosIni.vEmp.vCNPJ);

      if fempty('dia_mes_ini_fat_meta') then
        fdata('dia_mes_ini_fat_meta').Put(1);

      if fempty('limite_gastos_meta') then
        fdata('limite_gastos_meta').Put(30.00);

      if fempty('tipo_venda') then
      begin
        SqlOpen(' select sigla from tipo_vendas ' +
        	 ' where tipo = ''REQ'' ' +
          ' and ativo = 1 ' +
          ' order by ordemexibicao ', buscas);
        if not buscas.IsEmpty then
        	 fdata('tipo_venda').Put(buscas.FieldByName('sigla').AsString);
      end;

      if fempty('tipo_os') then
      begin
        SqlOpen(' select tipo_os from tipo_vendas ' +
        	 ' where tipo = ''OS'' ' +
          ' and ativo = 1 ' +
          ' order by ordemexibicao ', buscas);
        if not buscas.IsEmpty then
        	 fdata('tipo_os').Put(buscas.FieldByName('tipo_os').AsString);
      end;

      if fempty('cod_cond_pag') then
         fdata('cod_cond_pag').Put(1);

      if fempty('horario_semana_ini') then
      	fdata('horario_semana_ini').Put('08:00');
      if fempty('horario_semana_fim') then
      	fdata('horario_semana_fim').Put('18:00');
      if fempty('horario_sabado_ini') then
      	fdata('horario_sabado_ini').Put('08:00');
      if fempty('horario_sabado_fim') then
      	fdata('horario_sabado_fim').Put('12:00');

    	if fempty('util_recomendacao') then
      	fdata('util_recomendacao').Put('S');
      if fempty('interv_treino_recomenda') then
      	fdata('interv_treino_recomenda').Put(7);
      if fempty('dias_vnd_recomenda') then
        fdata('dias_vnd_recomenda').Put(360);
      if fempty('info_contato') then
        fdata('info_contato').Put('Você poderá falar com nosso suporte através do contato: *(11)11111-1111* (whatsapp). \nVocê també poderá ver mais sobre nossos produtos no link: https://www.empresateste.com.br');

      if fempty('peso_popularidade') then
      	fdata('peso_popularidade').Put('30');
      if fempty('peso_nivel_giro_medio') then
      	fdata('peso_nivel_giro_medio').Put('25');
      if fempty('peso_demanda') then
      	fdata('peso_demanda').Put('20');
      if fempty('peso_frequencia') then
      	fdata('peso_frequencia').Put('15');
      if fempty('peso_preco') then
      	fdata('peso_preco').Put('10');

      if fempty('giro_padrao_baixo_ini') then
      	fdata('giro_padrao_baixo_ini').Put('1');
      if fempty('giro_padrao_baixo_fim') then
      	fdata('giro_padrao_baixo_fim').Put('4,99');
      if fempty('giro_padrao_medio_ini') then
      	fdata('giro_padrao_medio_ini').Put('5');
      if fempty('giro_padrao_medio_fim') then
      	fdata('giro_padrao_medio_fim').Put('8,99');
      if fempty('giro_padrao_alto_ini') then
      	fdata('giro_padrao_alto_ini').Put('9');
    	if fempty('giro_padrao_alto_fim') then
      	fdata('giro_padrao_alto_fim').Put('1000');

      if fempty('cor_primary') then
        fdata('cor_primary').Put('#0070EB');
      if fempty('cor_primary_container') then
        fdata('cor_primary_container').Put('#939BA3');
      if fempty('cor_primary_fixed') then
        fdata('cor_primary_fixed').Put('#D8E2FF');
      if fempty('cor_on_primary') then
        fdata('cor_on_primary').Put('#FFFFFF');
      if fempty('cor_secondary') then
        fdata('cor_secondary').Put('#34C759');
      if fempty('cor_secondary_container') then
        fdata('cor_secondary_container').Put('#6FFB85');
      if fempty('cor_tertiary') then
        fdata('cor_tertiary').Put('#5856D6');
      if fempty('cor_error') then
        fdata('cor_error').Put('#BA1A1A');
      if fempty('cor_background') then
        fdata('cor_background').Put('#F2F2F7');
      if fempty('cor_surface_lowest') then
        fdata('cor_surface_lowest').Put('#FFFFFF');
      if fempty('cor_surface_low') then
        fdata('cor_surface_low').Put('#F3F3F8');

      if fempty('drive_type') then
      	fdata('drive_type').Put('gdrive');
      if fempty('drive_check_modif') then
      	fdata('drive_check_modif').Put('S');
   	if fempty('util_agentic_rag') then
      	fdata('util_agentic_rag').Put('S');
    end;

  	if fempty('data_cad') then
    	fdata('data_cad').Put(vDataBanco);

    vMsgPlataforma.abreMsgPlataforma;
    vConfigAPIcondpag.abreCondPag;
    vConfigAPItipocliente.abreTipoCliente;
    vConfigAPIvendedor.abreVendedor;
    vConfigAPIpromocao.abrePromocao;
    vConfigAPItabela.abreTabela;
    if trim(vapi) = 'HWCLOUD_IA' then
    	vConfigAPIpromocaoOrdem.abrePromocaoOrdem('H')
    else if trim(vapi) = 'COMERCIOABERTO' then
	    vConfigAPIpromocaoOrdem.abrePromocaoOrdem('C')
    else if trim(vapi) = 'TRAYCOMMERCE' then
    	vConfigAPIpromocaoOrdem.abrePromocaoOrdem('E')
    else if trim(vapi) = 'NUVEMSHOP' then
    	vConfigAPIpromocaoOrdem.abrePromocaoOrdem('E');
    vConfigAPIcollectionsRag.abreCollectionsRag;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TConfigAPI.montarAmbiente(DbCombobox: TDBComboBox; cgc_emp: string);
begin
  DbCombobox.Clear;

  if trim(cgc_emp) <> '' then
  	 DbCombobox.Items.Add(trim(cgc_emp));

  SqlOpen(' select cgc_emp from empresa ' +
  	' where ativo = 1 ' +
   ' order by cod_empresa ');
  buscas.First;
  while not buscas.Eof do
  begin
    if DbCombobox.Items.IndexOf(trim(buscas.FieldByName('cgc_emp').AsString)) = -1 then
    	DbCombobox.Items.Add(trim(buscas.FieldByName('cgc_emp').AsString));

    buscas.Next;
  end;
end;

procedure TConfigAPI.montarTipoOS(DbCombobox: TDBComboBox);
begin
  DbCombobox.Clear;
  SqlOpen(' select tipo_os from tipo_vendas ' +
  	 ' where tipo = ''OS'' ' +
    ' and ativo = 1 ' +
    ' order by tipo_os ');
  buscas.First;
  while not buscas.Eof do
  begin
    if DbCombobox.Items.IndexOf(trim(buscas.FieldByName('tipo_os').AsString)) = -1 then
    	DbCombobox.Items.Add(trim(buscas.FieldByName('tipo_os').AsString));

    buscas.Next;
  end;
end;

procedure TConfigAPI.montarTipoREQ(DbCombobox: TDBComboBox);
begin
  DbCombobox.Clear;
  SqlOpen(' select descricao from tipo_vendas ' +
  	 ' where tipo = ''REQ'' ' +
    ' and ativo = 1 ' +
    ' order by descricao ');
  buscas.First;
  while not buscas.Eof do
  begin
    if DbCombobox.Items.IndexOf(trim(buscas.FieldByName('descricao').AsString)) = -1 then
    	DbCombobox.Items.Add(trim(buscas.FieldByName('descricao').AsString));

    buscas.Next;
  end;
end;

procedure TConfigAPI.montarTreeViewPromocaoDB(pTipo: string; pTreeView, pTreeView2: TTreeView);
var
  I: Integer;
  ANode, ANode2: TtreeNode;
  vtemp, vpromocao: string;
  vMaxOrdem: Integer;
begin
//  if not vDadosIni.vEcommerce.vHabilitarEcommerce then
//    exit;

  if not (dataSet.State in [dsInsert, dsEdit]) then
    exit;

  vMaxOrdem := vDadosIni.retornaMaxOrdemPromocao;

  pTreeView.Items.Clear();
  pTreeView2.Items.Clear();
  SqlOpen(
   	vDadosIni.IfThen(trim(pTipo) = 'H',
        ' select -1 cod_promocao, ''PROMOCAO'' descr_promocao, ' + IntToStr(0) + ' ordem, ' +
        ' null data_ini, null data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from rdb$database ' +
        ' union all ' +
        ' select -2 cod_promocao, ''VAREJO'' descr_promocao, ' + IntToStr(vMaxOrdem + 4) + ' ordem, ' +
        ' null data_ini, null data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from rdb$database ' +
        ' union all ' +
        ' select -3 cod_promocao, ''30 DIAS'' descr_promocao, ' + IntToStr(vMaxOrdem + 1) + ' ordem, ' +
        ' null data_ini, null data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from rdb$database ' +
        ' union all ' +
        ' select -4 cod_promocao, ''60 DIAS'' descr_promocao, ' + IntToStr(vMaxOrdem + 2) + ' ordem, ' +
        ' null data_ini, null data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from rdb$database ' +
        ' union all ' +
        ' select -5 cod_promocao, ''90 DIAS'' descr_promocao, ' + IntToStr(vMaxOrdem + 3) + ' ordem, ' +
        ' null data_ini, null data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from rdb$database ' +
        ' union all ' +
        ' select -11 cod_promocao, ''SERVICO'' descr_promocao, 0 ordem, ' +
        ' null data_ini, null data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from rdb$database ' +
        ' union all ' +
        ' select promocao.cod_promocao, promocao.descr_promocao, promocao.ordem, ' +
        ' promocao.data_ini, promocao.data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from promocao ' +
        ' inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco ' +
        '		  and tipo_preco.cod_empresa = promocao.cod_empresa ' +
        ' where promocao.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and coalesce(promocao.padrao, ''N'') = ''S'' ' +
        ' and promocao.data_ini is not null and promocao.data_fim is not null ' +
        ' union all '
      , '') +
  		' select promocao.cod_promocao, promocao.descr_promocao, promocao.ordem, ' +
      ' promocao.data_ini, promocao.data_fim, ' + vDadosIni.FusoSqlDate + ' dataatual from promocao ' +
      ' inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco ' +
      '		  and tipo_preco.cod_empresa = promocao.cod_empresa ' +
      ' where promocao.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and promocao.cod_promocao > 0 ' +
      vDadosIni.IfThen(trim(pTipo) = 'H',
        '',
        ' and coalesce(promocao.padrao, ''N'') <> ''S'' ' +
        ' and promocao.data_ini is not null and promocao.data_fim is not null ') +
      ' and promocao.ativo = 1 ' +
      vDadosIni.IfThen(trim(pTipo) = 'H',
        ' order by 3 ', ' order by 4 '
      )
  );
  buscas.First;
  while not buscas.Eof do
  begin
    ANode := pTreeView.Items.AddChild(nil, IntToStr(buscas.FieldByName('cod_promocao').AsInteger) + ' | ' + trim(buscas.FieldByName('descr_promocao').AsString));

    if (buscas.FieldByName('data_ini').IsNull) or (buscas.FieldByName('data_fim').IsNull) then
      pTreeView.Items.AddChild(ANode, 'Sem data de vigência')
    else if buscas.FieldByName('data_ini').AsDateTime = buscas.FieldByName('data_fim').AsDateTime then
      pTreeView.Items.AddChild(ANode, 'Somente dia ' + FormatDateTime('dd/mm/yyyy', buscas.FieldByName('data_fim').AsDateTime))
    else
      pTreeView.Items.AddChild(ANode, Format('De %s até %s', [FormatDateTime('dd/mm/yyyy', buscas.FieldByName('data_ini').AsDateTime),
                                                              FormatDateTime('dd/mm/yyyy', buscas.FieldByName('data_fim').AsDateTime)]));

    if (buscas.FieldByName('data_ini').IsNull) or (buscas.FieldByName('data_fim').IsNull) then
    	pTreeView.Items.AddChild(ANode, 'Em vigência')
    else if (buscas.FieldByName('dataatual').AsDateTime < buscas.FieldByName('data_ini').AsDateTime) then
      pTreeView.Items.AddChild(ANode, 'Aguardando')
    else if (buscas.FieldByName('dataatual').AsDateTime > buscas.FieldByName('data_fim').AsDateTime) then
      pTreeView.Items.AddChild(ANode, 'Tabela expirada')
    else
      pTreeView.Items.AddChild(ANode, 'Em vigência');

    buscas.Next;
  end;

  if dataSet.State = dsInsert then
    Exit;

  vConfigAPIpromocaoOrdem.dataSet.First;
  while not vConfigAPIpromocaoOrdem.dataSet.Eof do
  begin  
    ANode2 := pTreeView2.Items.AddChild(nil,
    	IntToStr(vConfigAPIpromocaoOrdem.dataSet.FieldByName('cod_promocao').AsInteger) + ' | ' + trim(vConfigAPIpromocaoOrdem.dataSet.FieldByName('descr_promocao').AsString) +
      vDadosIni.IfThen((trim(pTipo) = 'H') and ((vConfigAPIpromocaoOrdem.dataSet.FieldByName('tab_ce').AsString = 'S') or (vConfigAPIpromocaoOrdem.dataSet.FieldByName('tab_ci').AsString = 'S')), ' -> ' +
      	vDadosIni.IfThen(vConfigAPIpromocaoOrdem.dataSet.FieldByName('tab_ce').AsString = 'S', 'CE', '') +
         	vDadosIni.IfThen((vConfigAPIpromocaoOrdem.dataSet.FieldByName('tab_ce').AsString = 'S') and (vConfigAPIpromocaoOrdem.dataSet.FieldByName('tab_ci').AsString = 'S'), '/', '') +
         vDadosIni.IfThen(vConfigAPIpromocaoOrdem.dataSet.FieldByName('tab_ci').AsString = 'S', 'CI', '')
      , '')
    );

    if (vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_ini').IsNull) or (vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_fim').IsNull) then
      pTreeView2.Items.AddChild(ANode2, 'Sem data de vigência')
    else if vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_ini').AsDateTime = vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_fim').AsDateTime then
      pTreeView2.Items.AddChild(ANode2, 'Somente dia ' + FormatDateTime('dd/mm/yyyy', vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_fim').AsDateTime))
    else
      pTreeView2.Items.AddChild(ANode2, Format('De %s até %s', [FormatDateTime('dd/mm/yyyy', vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_ini').AsDateTime),
                                                                FormatDateTime('dd/mm/yyyy', vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_fim').AsDateTime)]));

    if (vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_ini').IsNull) or (vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_fim').IsNull) then
      pTreeView2.Items.AddChild(ANode2, 'Em vigência')
    else if (vConfigAPIpromocaoOrdem.dataSet.FieldByName('dataatual').AsDateTime < vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_ini').AsDateTime) then
      pTreeView2.Items.AddChild(ANode2, 'Aguardando')
    else if (vConfigAPIpromocaoOrdem.dataSet.FieldByName('dataatual').AsDateTime > vConfigAPIpromocaoOrdem.dataSet.FieldByName('data_fim').AsDateTime) then
      pTreeView2.Items.AddChild(ANode2, 'Tabela expirada')
    else
      pTreeView2.Items.AddChild(ANode2, 'Em vigência');

    vConfigAPIpromocaoOrdem.dataSet.Next;
  end;
end;

function TConfigAPI.post: Boolean;
var
  vapi: string;
  acao: string;
begin
  try
	 if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    vapi := trim(dataSet.FieldByName('API').AsString);

    if not vDadosIni.PesqPros('API006', acao, '', 'CONFIG_API', vDadosIni.codEmpresa, buscas, False) then
      Exit;


//    if Pos('VEND', trim(buscas.FieldByName('DESC_FUNCAO').AsString)) <= 0 then
//      raiseExceptionCreate('Colaborador não está definido como "VENDEDOR".', 'EditHw3');
//    if vcodpromocao > 0 then
//      if not buscarPromocao(vcodpromocao) then
//        raiseExceptionCreate('Promoção não encontrada!', 'EditHw5');

    if trim(dataSet.FieldByName('API').AsString) = 'TRAYCOMMERCE' then
    begin
    	if trim(dataSet.FieldByName('URL_API').AsString) = '' then
      	raiseExceptionCreate('Url não informado.', 'DBEditUrlTray');

      if trim(dataSet.FieldByName('CONSUMER_KEY').AsString) = '' then
      	raiseExceptionCreate('Consumer Key não informado.', 'DBEditConsumerKeyTray');

      if trim(dataSet.FieldByName('CONSUMER_SECRET').AsString) = '' then
      	raiseExceptionCreate('Consumer Secret não informado.', 'DBEditConsumerSecretTray');

      if trim(dataSet.FieldByName('CODE_AUTORIZATION').AsString) = '' then
      	raiseExceptionCreate('Code Autorization não informado.', 'DBEditCodeAutorizationTray');

      if vcodtipocliente <= 0 then
      	raiseExceptionCreate('Tipo de Cliente não informado.', 'EditHwTipoClienteTray');

      if vcodtipocliente > 0 then
        if not buscarTipoCliente(vcodtipocliente) then
          raiseExceptionCreate('Tipo de cliente não encontrado!', 'EditHwTipoClienteTray');

      if vcodvendedor <= 0 then
      	raiseExceptionCreate('Vendedor não informado.', 'EditHwVendedorTray');

      if vcodvendedor > 0 then
        if not buscarVendedor(vcodvendedor) then
          raiseExceptionCreate('Vendedor não encontrado!', 'EditHwVendedorTray');

      if vcodtabela > 0 then
        if not buscarTabela(vcodtabela) then
          raiseExceptionCreate('Tabela de Preço não encontrada!', 'EditHwTabelaPrecoTray');

      if trim(dataSet.FieldByName('TIPO_VENDA').AsString) = '' then
      	raiseExceptionCreate('Tipo de Venda não informado.', 'DBComboBoxTipoVendaPadraoREQTray');

      if trim(dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        if not buscarTipoVenda('REQ', Copy(trim(dataSet.FieldByName('TIPO_VENDA').AsString), 1, 1)) then
          raiseExceptionCreate('Sigla "' + Copy(trim(dataSet.FieldByName('TIPO_VENDA').AsString), 1, 1) +
            '" para tipo de venda "REQ" não encontrada.', 'DBComboBoxTipoVendaPadraoREQTray');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'NUVEMSHOP' then
    begin
    	if trim(dataSet.FieldByName('URL_API').AsString) = '' then
      	raiseExceptionCreate('Url não informado.', 'DBEditUrlNuvemshop');

      if trim(dataSet.FieldByName('USER_ID').AsString) = '' then
      	raiseExceptionCreate('Id Loja não informado.', 'DBEditIdLojaNuvemshop');

      if trim(dataSet.FieldByName('ACESS_TOKEN').AsString) = '' then
      	raiseExceptionCreate('Acess Token Key não informado.', 'DBEditAcessTokenNuvemshop');

      if vcodtipocliente <= 0 then
      	raiseExceptionCreate('Tipo de Cliente não informado.', 'EditHwTipoClienteNuvemshop');

      if vcodtipocliente > 0 then
        if not buscarTipoCliente(vcodtipocliente) then
          raiseExceptionCreate('Tipo de cliente não encontrado!', 'EditHwTipoClienteNuvemshop');

      if vcodvendedor <= 0 then
      	raiseExceptionCreate('Vendedor não informado.', 'EditHwVendedorNuvemshop');

      if vcodvendedor > 0 then
        if not buscarVendedor(vcodvendedor) then
          raiseExceptionCreate('Vendedor não encontrado!', 'EditHwVendedorNuvemshop');

      if vcodtabela > 0 then
        if not buscarTabela(vcodtabela) then
          raiseExceptionCreate('Tabela de Preço não encontrada!', 'EditHwTabelaPrecoNuvemshop');

      if trim(dataSet.FieldByName('TIPO_VENDA').AsString) = '' then
      	raiseExceptionCreate('Tipo de Venda não informado.', 'DBComboBoxTipoVendaPadraoREQNuvemshop');

      if trim(dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        if not buscarTipoVenda('REQ', Copy(trim(dataSet.FieldByName('TIPO_VENDA').AsString), 1, 1)) then
          raiseExceptionCreate('Sigla "' + Copy(trim(dataSet.FieldByName('TIPO_VENDA').AsString), 1, 1) +
            '" para tipo de venda "REQ" não encontrada.', 'DBComboBoxTipoVendaPadraoREQNuvemshop');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'COMERCIOABERTO' then
    begin
     	if trim(dataSet.FieldByName('NOMEFANTASIA').AsString) = '' then
      	raiseExceptionCreate('Identificação Empresa não informado.', 'DBEditIdentificacaoCA');

      if trim(dataSet.FieldByName('TOKEN_API').AsString) = '' then
      	raiseExceptionCreate('Senha não informada.', 'DBEditSenhaCA');

      if vcodtabela > 0 then
        if not buscarTabela(vcodtabela) then
          raiseExceptionCreate('Tabela de Preço não encontrada!', 'EditHwTabelaPrecoCA');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'PROGRAMAFIDELIDADE' then
    begin
    	if trim(dataSet.FieldByName('URL_API').AsString) = '' then
      	raiseExceptionCreate('Url não informado.', 'DBEditUrlSmartbis');

      if trim(dataSet.FieldByName('TOKEN_API').AsString) = '' then
      	raiseExceptionCreate('Token não informado.', 'DBEditTokenSmartbis');

      if trim(dataSet.FieldByName('SENHA_API').AsString) = '' then
      	raiseExceptionCreate('Token não informado.', 'DBEditSenhaSmartbis');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'CONFERE' then
    begin
      if trim(dataSet.FieldByName('URL_API').AsString) = '' then
      	raiseExceptionCreate('Url não informado.', 'DBEditUrlConfere');

      if trim(dataSet.FieldByName('COD_INTEGRADOR').AsString) = '' then
      	raiseExceptionCreate('Cod Integrador não informado.', 'DBEditCodIntegradorConfere');

      if trim(dataSet.FieldByName('TOKEN_INTEGRADOR').AsString) = '' then
      	raiseExceptionCreate('Token Integrador não informado.', 'DBMemoTokenIntegradorConfere');

      if trim(dataSet.FieldByName('COD_CLIENTE_CONFERE').AsString) = '' then
      	raiseExceptionCreate('Cod Cliente Confere não informado.', 'DBEditCodClienteConfere');

      if trim(dataSet.FieldByName('COD_ESTABEL_CONFERE').AsString) = '' then
      	raiseExceptionCreate('Cod Estabelecimento Confere não informado.', 'DBEditCodEstabConfere');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'NUMMUSCASHBACK' then
    begin
      if trim(vUrlNummus) = '' then
      	raiseExceptionCreate('Url não informado.', 'EditUrlNummus');

      if trim(vApiKeyNummus) = '' then
      	raiseExceptionCreate('API Key não informado.', 'EditApiKeyNummus');

      if trim(vClientIdNummus) = '' then
      	raiseExceptionCreate('Client Id não informado.', 'EditClientIdNummus');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'KENTRO' then
    begin
    	if trim(vUrlKentro) = '' then
      	raiseExceptionCreate('Url não informado.', 'EditUrlKentro');

      if trim(vPasswordKentro) = '' then
      	raiseExceptionCreate('Chave não informado.', 'EditPasswordKentro');

      if trim(vQueuedIdKentro) = '' then
      	raiseExceptionCreate('Queued Id não informado.', 'EditQueuedIdKentro');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'BOLETO_API' then
    begin
      if trim(dataSet.FieldByName('TOKEN_API').AsString) = '' then
      	raiseExceptionCreate('Token não informado.', 'DBEditTokenPlug');

      if trim(dataSet.FieldByName('CHAVE_ASSIGN').AsString) = '' then
      	raiseExceptionCreate('Chave Assign não informado.', 'DBEditChaveAssignPlug');

      if trim(dataSet.FieldByName('CHAVE_ASSIGN').AsString) <> trim(vDadosIni.vEmp.vCNPJ) then
        raiseExceptionCreate('Chave diferente do CNPJ da empresa logada.', 'DBEditChaveAssignPlug');

      if trim(vAmbiente) = '' then
      	raiseExceptionCreate('Ambiente não informado.', 'ComboBoxAmbientePlug');

      if (trim(vAmbiente) <> 'Produção') and (trim(vAmbiente) <> 'Homologação') then
      		raiseExceptionCreate('Ambiente inválido.', 'ComboBoxAmbientePlug');
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'HWCLOUD_IA' then
    begin
    	if trim(dataSet.FieldByName('URL_API').AsString) = '' then
      	raiseExceptionCreate('Url não informado.', 'DBEditUrlHwCloudIA');

      if trim(dataSet.FieldByName('TOKEN_API').AsString) = '' then
      	raiseExceptionCreate('Authorization não informado.', 'DBEditAuthorizationHwCloudIA');

      if trim(dataSet.FieldByName('USAR_API_PEDIDO').AsString) = '' then
         raiseExceptionCreate('Utilizar Venda Online (API Pedido) não informado.', 'DBComboBoxUsarAPIPedidoHwCloudIA');

      if trim(dataSet.FieldByName('USAR_API_COG').AsString) = '' then
      	raiseExceptionCreate('Utilizar Bot (API Cog) não informado.', 'DBComboBoxUsarAPICogHwCloudIA');

      if trim(dataSet.FieldByName('USAR_API_COG').AsString) = 'S' then
        if dataSet.FieldByName('MODELO_PADRAO').AsInteger <= 0 then
          raiseExceptionCreate('Modelo Padrão não informado.', 'DBEditModeloPadraoHwCloudIA');

      if trim(dataSet.FieldByName('AMBIENTE_API').AsString) = '' then
      	raiseExceptionCreate('Ambiente não informado.', 'DBComboBoxAmbienteHwCloudIA');

      if trim(dataSet.FieldByName('USAR_API_COG').AsString) = 'S' then
        if trim(dataSet.FieldByName('NOME_BOT').AsString) = '' then
          raiseExceptionCreate('Nome do Bot não informado.', 'DBEditNomeBotHwCloudIA');

      if dataSet.FieldByName('DIA_MES_INI_FAT_META').AsInteger <= 0 then
      	raiseExceptionCreate('Dia do Mês Inicial para Faturamento Meta não informado.', 'DBEditDiaMesFatMetaHwCloudIA');

      if dataSet.FieldByName('DIA_MES_INI_FAT_META').AsInteger > 28 then
         raiseExceptionCreate('Dia do Mês Inicial para Faturamento Meta não deve ser maior que 28.', 'DBEditDiaMesFatMetaHwCloudIA');

      if dataSet.FieldByName('LIMITE_GASTOS_META').AsFloat <= 0 then
         raiseExceptionCreate('Limite de Gastos Meta não informado.', 'DBEditLimiteGastosMetaHwCloudIA');

      if trim(dataSet.FieldByName('HORARIO_SEMANA_INI').AsString) = '' then
      	raiseExceptionCreate('Horário da semana inicial não informado.', 'DBEditSemanaIniHwCloudIA');

      if trim(dataSet.FieldByName('HORARIO_SEMANA_FIM').AsString) = '' then
      	raiseExceptionCreate('Horário da semana final não informado.', 'DBEditSemanaFimHwCloudIA');

      if trim(dataSet.FieldByName('HORARIO_SABADO_INI').AsString) = '' then
      	raiseExceptionCreate('Horário do sábado inicial não informado.', 'DBEditSabadoIniHwCloudIA');

      if trim(dataSet.FieldByName('HORARIO_SABADO_FIM').AsString) = '' then
      	raiseExceptionCreate('Horário do sábado final não informado.', 'DBEditSabadoFimHwCloudIA');
          
    	if dataSet.FieldByName('PESO_POPULARIDADE').AsInteger <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Peso (Popularidade) não informado.', 'DBEditPesoPopularidadeHwCloudIA');
      end;

      if dataSet.FieldByName('PESO_NIVEL_GIRO_MEDIO').AsInteger <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Peso (Nível Giro Médio) não informado.', 'DBEditPesoNivelGiroMedioHwCloudIA');
      end;

      if dataSet.FieldByName('PESO_DEMANDA').AsInteger <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Peso (Demanda) não informado.', 'DBEditPesoDemandaHwCloudIA');
      end;

      if dataSet.FieldByName('PESO_FREQUENCIA').AsInteger <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Peso (Frequência) não informado.', 'DBEditPesoFrequenciaHwCloudIA');
      end;

      if dataSet.FieldByName('PESO_PRECO').AsInteger <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Peso (Preço) não informado.', 'DBEditPesoPrecoHwCloudIA');
      end;

      if (dataSet.FieldByName('PESO_POPULARIDADE').AsInteger +
      	 dataSet.FieldByName('PESO_NIVEL_GIRO_MEDIO').AsInteger +
          dataSet.FieldByName('PESO_DEMANDA').AsInteger +
          dataSet.FieldByName('PESO_FREQUENCIA').AsInteger +
          dataSet.FieldByName('PESO_PRECO').AsInteger <> 100) then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Soma dos Pesos não deve ser diferente de 100%.', 'DBEditPesoPopularidade');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_INI').AsFloat <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo inicial não informado.', 'DBEditGiroBaixaIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_FIM').AsFloat <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo final não informado.', 'DBEditGiroBaixoFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_MEDIO_INI').AsFloat <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro médio inicial não informado.', 'DBEditGiroMedioIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_MEDIO_FIM').AsFloat <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro médio final não informado.', 'DBEditGiroMedioFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_ALTO_INI').AsFloat <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro alto inicial não informado.', 'DBEditGiroAltoIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_ALTO_FIM').AsFloat <= 0 then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro alto final não informado.', 'DBEditGiroAltoFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_BAIXO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo inicial deve ser menor que o giro baixo final.', 'DBEditGiroBaixaIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_MEDIO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_MEDIO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro médio inicial deve ser menor que o giro médio final.', 'DBEditGiroMedioIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_ALTO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro alto inicial deve ser menor que o giro alto final.', 'DBEditGiroAltoIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_MEDIO_INI').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo inicial deve ser menor que o giro médio inicial.', 'DBEditGiroBaixaIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_MEDIO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo inicial deve ser menor que o giro médio final.', 'DBEditGiroBaixaIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_FIM').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_MEDIO_INI').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo final deve ser menor que o giro médio inicial.', 'DBEditGiroBaixoFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_FIM').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_MEDIO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo final deve ser menor que o giro médio final.', 'DBEditGiroBaixoFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_INI').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo inicial deve ser menor que o giro alto inicial.', 'DBEditGiroBaixaIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo inicial deve ser menor que o giro alto final.', 'DBEditGiroBaixaIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_FIM').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_INI').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo final deve ser menor que o giro alto inicial.', 'DBEditGiroBaixoFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_BAIXO_FIM').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro baixo final deve ser menor que o giro alto final.', 'DBEditGiroBaixoFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_MEDIO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_INI').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro médio inicial deve ser menor que o giro alto inicial.', 'DBEditGiroMedioIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_MEDIO_INI').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro médio inicial deve ser menor que o giro alto final.', 'DBEditGiroMedioIniHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_MEDIO_FIM').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_INI').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro médio final deve ser menor que o giro alto inicial.', 'DBEditGiroMedioFimHwCloudIA');
      end;

      if dataSet.FieldByName('GIRO_PADRAO_MEDIO_FIM').AsFloat >= dataSet.FieldByName('GIRO_PADRAO_ALTO_FIM').AsFloat then
      begin
        frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet6;
        raiseExceptionCreate('Giro médio final deve ser menor que o giro alto final.', 'DBEditGiroMedioFimHwCloudIA');
      end;

      if trim(dataSet.FieldByName('USAR_API_PEDIDO').AsString) = 'S' then
      begin
        if trim(dataSet.FieldByName('TIPO_VENDA').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
          raiseExceptionCreate('Tipo de Venda não informado.', 'DBComboBoxTipoVendaPadraoREQHwCloud');
        end;

        if trim(dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
          if not buscarTipoVenda('REQ', Copy(trim(dataSet.FieldByName('TIPO_VENDA').AsString), 1, 1)) then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
            raiseExceptionCreate('Sigla "' + Copy(trim(dataSet.FieldByName('TIPO_VENDA').AsString), 1, 1) +
              '" para tipo de venda "REQ" não encontrada.', 'DBComboBoxTipoVendaPadraoREQHwCloud');
          end;

        if trim(dataSet.FieldByName('TIPO_OS').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
          raiseExceptionCreate('Tipo de OS não informado.', 'DBComboBoxTipoVendaPadraoOSHwCloud');
        end;

        if trim(dataSet.FieldByName('TIPO_OS').AsString) <> '' then
          if not buscarTipoVenda('OS', dataSet.FieldByName('TIPO_OS').AsString) then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
            raiseExceptionCreate('Tipo de OS "' + dataSet.FieldByName('TIPO_OS').AsString +
              '" para tipo de venda "OS" não encontrada.', 'DBComboBoxTipoVendaPadraoOSHwCloud');
          end;

        if vcodcondpag <= 0 then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
          raiseExceptionCreate('Condição de Pagamento não informado.', 'EditHwCondPagHwCloudIA');
        end;

        if vcodcondpag > 0 then
          if not buscarCondPag(vcodcondpag) then
          begin
            frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
            raiseExceptionCreate('Condição de Pagamento não encontrada!', 'EditHwCondPagHwCloudIA');
          end;

        if vcodtipocliente <= 0 then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
          raiseExceptionCreate('Tipo de Cliente não informado.', 'EditHwTipoClienteHwCloudIA');
        end;

        if vcodtipocliente > 0 then
          if not buscarTipoCliente(vcodtipocliente) then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
            raiseExceptionCreate('Tipo de cliente não encontrado!', 'EditHwTipoClienteHwCloudIA');
          end;

        if vcodvendedor <= 0 then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
          raiseExceptionCreate('Vendedor não informado.', 'EditHwVendedorHwCloudIA');
        end;

        if vcodvendedor > 0 then
          if not buscarVendedor(vcodvendedor) then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet8;
            raiseExceptionCreate('Vendedor não encontrado!', 'EditHwVendedorHwCloudIA');
          end;

        if trim(dataSet.FieldByName('CAMINHO_LOGO_EMP').AsString) <> '' then
          if not FileExists(trim(dataSet.FieldByName('CAMINHO_LOGO_EMP').AsString)) then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet7;
            raiseExceptionCreate('Logo da empresa não encontrado.', 'DBEditLogoEmpHwCloudIA');
          end;

        if trim(dataSet.FieldByName('CAMINHO_LOGO_EMP').AsString) <> '' then
          if LowerCase(ExtractFileExt(trim(dataSet.FieldByName('CAMINHO_LOGO_EMP').AsString))) <> '.png' then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet7;
            raiseExceptionCreate('Extensão da logo da empresa incorreta, extensão deve ser (.png)', 'DBEditLogoEmpHwCloudIA');
          end;

        if trim(dataSet.FieldByName('CAMINHO_LOGO_EMP').AsString) <> '' then
          dataSet.FieldByName('CAMINHO_LOGO_EMP_BASE64').AsString := _strImagetoBase64(trim(dataSet.FieldByName('CAMINHO_LOGO_EMP').AsString))
        else
          dataSet.FieldByName('CAMINHO_LOGO_EMP_BASE64').Value := Null;

        if trim(dataSet.FieldByName('CAMINHO_FAVICON_EMP').AsString) <> '' then
          if not FileExists(trim(dataSet.FieldByName('CAMINHO_FAVICON_EMP').AsString)) then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet7;
            raiseExceptionCreate('Favicon da empresa não encontrado.', 'DBEditFaviconEmpresaHwCloudIA');
          end;

        if trim(dataSet.FieldByName('CAMINHO_FAVICON_EMP').AsString) <> '' then
          if LowerCase(ExtractFileExt(trim(dataSet.FieldByName('CAMINHO_FAVICON_EMP').AsString))) <> '.ico' then
          begin
        	 	frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet7;
            raiseExceptionCreate('Extensão do favicon da empresa incorreta, extensão deve ser (.ico)', 'DBEditFaviconEmpresaHwCloudIA');
          end;

        if trim(dataSet.FieldByName('CAMINHO_FAVICON_EMP').AsString) <> '' then
          dataSet.FieldByName('CAMINHO_FAVICON_EMP_BASE64').AsString := _strImagetoBase64(trim(dataSet.FieldByName('CAMINHO_FAVICON_EMP').AsString))
        else
          dataSet.FieldByName('CAMINHO_FAVICON_EMP_BASE64').Value := Null;

        if trim(dataSet.FieldByName('COR_PRIMARY').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Primary não informada.', 'pnCorPrimaryHwCloudIA');   
        end;

        if trim(dataSet.FieldByName('COR_PRIMARY_CONTAINER').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Primary Container não informada.', 'pnCorPrimaryContainerHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_PRIMARY_FIXED').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Primary Fixed não informada.', 'pnCorPrimaryFixedHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_ON_PRIMARY').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor On Primary não informada.', 'pnCorOnPrimaryHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_SECONDARY').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Secondary não informada.', 'pnCorSecondaryHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_SECONDARY_CONTAINER').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Secondary Container não informada.', 'pnCorSecondaryContainerHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_TERTIARY').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Tertiary não informada.', 'pnCorTertiaryHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_ERROR').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Error não informada.', 'pnCorErrorHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_BACKGROUND').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Background não informada.', 'pnCorBackGroundHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_SURFACE_LOWEST').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Primary não informada.', 'pnCorSurfaceLowestHwCloudIA');
        end;

        if trim(dataSet.FieldByName('COR_SURFACE_LOW').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet4;
          raiseExceptionCreate('Cor Primary não informada.', 'pnCorSurfaceLowHwCloudIA');
        end;

        if vConfigAPIpromocaoOrdem.IsEmpty then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet10;
          raiseExceptionCreate('Nenhuma tabela de preço adicionada.', 'TreeViewPromocaoHwCloudIA_DB');
        end;

        try
          vConfigAPIpromocaoOrdem.dataSet.First;
          while not vConfigAPIpromocaoOrdem.dataSet.Eof do
          begin
            if (Trim(vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CE').AsString) <> 'S')
              and (trim(vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CI').AsString) <> 'S') then
              begin
                frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet10;
                raiseExceptionCreate('Precisa informar o tipo da tabela de preço (CE/CI): ' + #13 + #13 +
                  'TABELA DE PREÇO' + #13 +
                  'Código: ' + IntToStr(vConfigAPIpromocaoOrdem.dataSet.FieldByName('COD_PROMOCAO').AsInteger) + #13 +
                  'Descrição: ' + Trim(vConfigAPIpromocaoOrdem.dataSet.FieldByName('DESCR_PROMOCAO').AsString) + #13 + #13 +
                  'Favor verificar antes de continuar.', 'TreeViewPromocaoHwCloudIA_DB');
              end;

            vConfigAPIpromocaoOrdem.dataSet.Next;
          end;
        finally
          vConfigAPIpromocaoOrdem.dataSet.First;
        end;
      end;

      if trim(dataSet.FieldByName('USAR_API_COG').AsString) = 'S' then
      begin
        if trim(dataSet.FieldByName('DRIVE_TYPE').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet9;
          raiseExceptionCreate('drive type não informado.', 'DBComboBoxDriveTypeHwCloudIA');
        end;

        if trim(dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet9;
          raiseExceptionCreate('drive check_modification não informado.', 'DBComboBoxDriveCheckModif');
        end;

        if (trim(dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) <> 'S') and (trim(dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) <> 'N') then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet9;
          raiseExceptionCreate('drive check_modification incorreto.', 'DBComboBoxDriveCheckModif');
        end;

        if trim(dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet9;
          raiseExceptionCreate('util agentic_rag não informado.', 'DBComboBoxUtlAgenticRagHwCloudIA');
        end;

        if (trim(dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) <> 'S') and (trim(dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) <> 'N') then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet9;
          raiseExceptionCreate('util agentic_incorreto.', 'DBComboBoxUtlAgenticRagHwCloudIA');
        end;

        if trim(dataSet.FieldByName('PASTA_PADRAO_DRIVE').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet9;
          raiseExceptionCreate('pasta padrao_drive não informado.', 'DBEditPastaPadraoDriveHwCloudIA');
        end;

        if trim(dataSet.FieldByName('DRIVE_CREDENTIALS').AsString) = '' then
        begin
        	 frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet9;
          raiseExceptionCreate('drive credentials não informado.', 'DBMemoDriveCredentials');
        end;

        if vConfigAPIcollectionsRag.dataSet.IsEmpty then
        begin
          frmCadConfigAPI.PageControl4.ActivePage := frmCadConfigAPI.TabSheet11;
          raiseExceptionCreate('Nenhuma collection rag adicionada.', 'DBGridCollectionRagHwCloudIA');
        end;
      end;
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'SUZUKI' then
    begin
      if trim(dataSet.FieldByName('TOKEN_API').AsString) = '' then
      	raiseExceptionCreate('Usuário não informado.', 'DBEditUsuarioSuzuki');

      if trim(dataSet.FieldByName('SENHA').AsString) = '' then
      	raiseExceptionCreate('Senha não informado.', 'DBEditSenhaSuzuki');

      if trim(vAmbiente) = '' then
      	raiseExceptionCreate('Ambiente não informado.', 'ComboBoxAmbienteSuzuki');

      if (trim(vAmbiente) <> 'Produção') and (trim(vAmbiente) <> 'Homologação') then
      	raiseExceptionCreate('Ambiente inválido.', 'ComboBoxAmbienteSuzuki');
    end;

    if vcodcondpag > 0 then
      dataSet.FieldByName('COD_COND_PAG').AsInteger := vcodcondpag
    else
    	dataSet.FieldByName('COD_COND_PAG').Value := Null;

    if vcodtipocliente > 0 then
	   dataSet.FieldByName('COD_TIP_CLIENTE').AsInteger := vcodtipocliente
    else
    	dataSet.FieldByName('COD_TIP_CLIENTE').Value := Null;

    if vcodvendedor > 0 then
	   dataSet.FieldByName('COD_VENDEDOR').AsInteger := vcodvendedor
    else
    	dataSet.FieldByName('COD_VENDEDOR').Value := Null;

    if vcodtabela > 0 then
	   dataSet.FieldByName('COD_TAB_PRECO').AsInteger := vcodtabela
    else
    	dataSet.FieldByName('COD_TAB_PRECO').Value := Null;

    if trim(dataSet.FieldByName('SENHA_API').AsString) <> '' then
      dataSet.FieldByName('SENHA_API').AsString := vDadosIni.codifica(dataSet.FieldByName('SENHA_API').AsString)
    else
    	dataSet.FieldByName('SENHA_API').Value := Null;

    if trim(dataSet.FieldByName('SENHA').AsString) <> '' then
      dataSet.FieldByName('SENHA').AsString := vDadosIni.codifica(dataSet.FieldByName('SENHA').AsString)
    else
    	dataSet.FieldByName('SENHA').Value := Null;

    dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);

    dataSet.FieldByName('ATIVO').AsInteger := 1;

    if trim(dataSet.FieldByName('API').AsString) = 'BOLETO_API' then
    begin
    	if (acao = 'INSERIR') or (trim(vAmbiente) = 'Produção') then
      begin
      	SqlOpen(' select hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')) from rdb$database ', buscas);

        if (trim(vAmbiente)) <> 'Produção' then
          dataset.FieldByName('USER_ID').Value := Null
        else
        begin
          if buscas.FieldByName('HASH').IsNull then
            dataset.FieldByName('USER_ID').Value := Null
          else
            dataset.FieldByName('USER_ID').AsString := buscas.FieldByName('HASH').AsString;
        end;
      end
      else if (trim(vAmbiente) <> 'Produção') then
      	dataset.FieldByName('USER_ID').Value := Null
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'NUMMUSCASHBACK' then
    begin
      dataSet.FieldByName('URL_API').AsString :=
      	trim(vUrlNummus) + '|' +
	    	trim(vApiKeyNummus) + '|' +
		    trim(vClientIdNummus) + '|';
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'KENTRO' then
    begin
      dataSet.FieldByName('URL_API').AsString :=
      	trim(vUrlKentro) + '|' +
	    	trim(vPasswordKentro) + '|' +
		    trim(vQueuedIdKentro) + '|';
    end
    else if trim(dataSet.FieldByName('API').AsString) = 'SUZUKI' then
    begin
      if (acao = 'INSERIR') or (trim(vAmbiente) = 'Produção') then
      begin
      	SqlOpen(' select hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')) from rdb$database ', buscas);

        if (trim(vAmbiente)) <> 'Produção' then
          dataset.FieldByName('USER_ID').Value := Null
        else
        begin
          if buscas.FieldByName('HASH').IsNull then
            dataset.FieldByName('USER_ID').Value := Null
          else
            dataset.FieldByName('USER_ID').AsString := buscas.FieldByName('HASH').AsString;
    end;
      end
      else if (trim(vAmbiente) <> 'Produção') then
      	dataset.FieldByName('USER_ID').Value := Null
    end;

    dataSet.FieldByName('TIPO_VENDA').AsString := Copy(trim(dataSet.FieldByName('TIPO_VENDA').AsString), 1, 1);
    
    inherited Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if (Result) and (acao = 'EDITAR') then
    begin
      if (trim(vapi) = 'TRAYCOMMERCE') or (trim(vapi) = 'NUVEMSHOP') then
      begin
        if vCodTabelaOld <> dataSet.FieldByName('COD_TAB_PRECO').AsInteger then
        begin
          try
            vDadosIni.abreStatusProcessamento('','Atualizando preços produtos E-Commerce');

            buscas.Close;
            buscas.SQL.Text := ' UPDATE PRODUTOS_EC SET PRODUTOS_EC.GRUPO_PROD = PRODUTOS_EC.GRUPO_PROD, ' +
              ' PRODUTOS_EC.COD_PROD = PRODUTOS_EC.COD_PROD, ' +
              ' PRODUTOS_EC.COD_EMPRESA = PRODUTOS_EC.COD_EMPRESA ' +
              ' WHERE PRODUTOS_EC.COD_EMPRESA = :COD_EMPRESA ' +
              ' AND PRODUTOS_EC.SINC_ECOMMERCE = ''S'' ';
            buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas.ExecSQL;
          finally
            vDadosIni.fechaStatusProcessamento;
          end;
        end;
      end
      else if (trim(vapi) = 'HWCLOUD_IA') then
      begin
        buscas.Close;
        buscas.SQL.Text := ' UPDATE EMPRESA SET ATIVO = ATIVO ' +
        	 ' WHERE COD_EMPRESA = :COD_EMPRESA ';
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ExecSQL;
      end;
    end;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('API006', acao, 'SUCESSO', 'CONFIG_API', vDadosIni.codEmpresa, buscas);

      if (trim(vapi) = 'BOLETO_API') then
      begin
        plugboleto_cedente(
	  	    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                 [vDadosIni.vBancoHW, vDadosIni.codEmpresa]));
      end
      else if (trim(vapi) = 'SUZUKI') then
      begin
      	suzuki_autenticacao(
	  	    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                 [vDadosIni.vBancoHW, vDadosIni.codEmpresa]));
      end
      else if (trim(vapi) = 'HWCLOUD_IA') then
      begin
        hwc_cad_empresa(
          Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                 [vDadosIni.vBancoHW, vDadosIni.codEmpresa]),
          1,
          'I');
      end;
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('API006', acao, 'FALHA', 'CONFIG_API', vDadosIni.codEmpresa, buscas);
    end;

    if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then
      if trim(vapi) = 'HWCLOUD_IA' then
        if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
          vDadosIni.buscarConfigHwCloud;

    Refresh;

  except on E: Exception do
    begin
      Result := False;
       Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfigAPI.setarTab(pTipo: string; pCeCi: string; pTreeView: TTreeView; pTreeView2: TTreeView;
  pPromocao: string): boolean;
var
  I: Integer;
  vcodpromocao: Integer;
begin
  try
    Result := true;

    if pTreeView2.Items.Count <= 0 then
      exit;

    try
      vcodpromocao := StrToInt(trim(Copy(pPromocao, 1, Pos('|', pPromocao) - 1)));
    except
      Application.MessageBox(PChar('Falha ao selecionar tabela de preço: ' + trim(pPromocao)), 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vcodpromocao := 0;
      Exit;
    end;

    if vcodpromocao = 0 then
      exit;

    try
      vConfigAPIpromocaoOrdem.dataSet.Filtered := false;
      vConfigAPIpromocaoOrdem.dataSet.Filter := 'cod_promocao = ' + IntToStr(vcodpromocao);
      vConfigAPIpromocaoOrdem.dataSet.Filtered := true;

      if not vConfigAPIpromocaoOrdem.dataSet.IsEmpty then
      begin
        vConfigAPIpromocaoOrdem.dataSet.Edit;

        if (pCeCi = 'CE') and (vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CE').AsString = 'S') and (vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CI').AsString <> 'S') then
          vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CI').AsString := 'S'
        else if (pCeCi = 'CI') and (vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CI').AsString = 'S') and (vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CE').AsString <> 'S') then
          vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_CE').AsString := 'S';

        vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_' +pCeCi).AsString :=
        	 vDadosIni.IfThen(vConfigAPIpromocaoOrdem.dataSet.FieldByName('TAB_' + pCeCi).AsString = 'S', 'N', 'S');
        vConfigAPIpromocaoOrdem.dataSet.Post;
        vConfigAPIpromocaoOrdem.Apply;
      end;
    finally
      vConfigAPIpromocaoOrdem.dataSet.Filtered := false;
      vConfigAPIpromocaoOrdem.IndexFieldNames := 'ordem';
    end;

    vConfigAPIpromocaoOrdem.abrePromocaoOrdem(pTipo);
    montarTreeViewPromocaoDB(pTipo, pTreeView, pTreeView2);

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

{ TConfigAPItabela }

function TConfigAPItabela.abreTabela: boolean;
begin
  Result := montaSelect(' SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.DESCR_PROMOCAO FROM PROMOCAO ' +
 	 ' LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_TPPRECO AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA ' +
    ' WHERE PROMOCAO.COD_PROMOCAO > 0 ' + // AND TIPO_PRECO.TIPO = ''T'' ' +
    ' AND PROMOCAO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND PROMOCAO.ATIVO = 1 ' +
    ' ORDER BY PROMOCAO.DESCR_PROMOCAO ');
end;

constructor TConfigAPItabela.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsConfigAPItabela);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TConfigAPIpromocao }

function TConfigAPIpromocao.abrePromocao: boolean;
begin
   Result := montaSelect(' SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.DESCR_PROMOCAO FROM PROMOCAO ' +
     ' LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_TPPRECO AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA ' +
     ' WHERE PROMOCAO.COD_PROMOCAO > 0 AND PROMOCAO.DATA_INI IS NOT NULL AND PROMOCAO.DATA_FIM IS NOT NULL ' +
     ' AND PROMOCAO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' AND PROMOCAO.ATIVO = 1 ' +
     ' ORDER BY PROMOCAO.DESCR_PROMOCAO ');
end;

constructor TConfigAPIpromocao.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsConfigAPIpromocao);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TConfigAPItipocliente }

function TConfigAPItipocliente.abreTipoCliente: boolean;
begin
  Result := montaSelect(' SELECT TIPOS_CLIENTES.CODIGO_TIPO, TIPOS_CLIENTES.DESCRICAO_TIPO FROM TIPOS_CLIENTES ' +
  	 ' WHERE TIPOS_CLIENTES.ATIVO = 1 ' +
    ' ORDER BY TIPOS_CLIENTES.DESCRICAO_TIPO ');
end;

constructor TConfigAPItipocliente.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsConfigAPItipocliente);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TConfigAPIvendedor }

function TConfigAPIvendedor.abreVendedor: boolean;
begin
 Result := montaSelect(' SELECT COLABORADOR.COD_VENDEDOR, ' +
 	' COLABORADOR.NOME_VENDEDOR, FUNCOES.DESC_FUNCAO FROM COLABORADOR ' +
   ' LEFT JOIN FUNCOES ON FUNCOES.COD_FUNCAO = COLABORADOR.COD_FUNCAO ' +
	' WHERE COLABORADOR.ATIVO = 1 ' +
   ' AND COLABORADOR.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' ORDER BY COLABORADOR.NOME_VENDEDOR ');
end;

constructor TConfigAPIvendedor.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsConfigAPIvendedor);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TConfigAPIpromocaoOrdem }

function TConfigAPIpromocaoOrdem.abrePromocaoOrdem(pTipo: string): boolean;
var
  vMaxOrdem: Integer;	
begin
  if pTipo = 'H' then
  begin
    vMaxOrdem := vDadosIni.retornaMaxOrdemPromocao;

    Result := montaSelect(
      ' select promocao_ordem_hc.cod_promocao, promocao_ordem_hc.cod_empresa, ' + IntToStr(0) + ' ordem, promocao_ordem_hc.atual, ' +
      ' ''PROMOCAO'' descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, promocao_ordem_hc.tab_ce, promocao_ordem_hc.tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_hc ' +
      ' where promocao_ordem_hc.cod_promocao = -1 ' +
      ' and promocao_ordem_hc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select promocao_ordem_hc.cod_promocao, promocao_ordem_hc.cod_empresa, ' + IntToStr(vMaxOrdem + 4) + ' ordem, promocao_ordem_hc.atual, ' +
      ' ''VAREJO'' descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, promocao_ordem_hc.tab_ce, promocao_ordem_hc.tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_hc ' +
      ' where promocao_ordem_hc.cod_promocao = -2 ' +
      ' and promocao_ordem_hc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select promocao_ordem_hc.cod_promocao, promocao_ordem_hc.cod_empresa, ' + IntToStr(vMaxOrdem + 1) + ' ordem, promocao_ordem_hc.atual, ' +
      ' ''30 DIAS'' descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, promocao_ordem_hc.tab_ce, promocao_ordem_hc.tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_hc ' +
      ' where promocao_ordem_hc.cod_promocao = -3 ' +
      ' and promocao_ordem_hc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select promocao_ordem_hc.cod_promocao, promocao_ordem_hc.cod_empresa, ' + IntToStr(vMaxOrdem + 2) + ' ordem, promocao_ordem_hc.atual, ' +
      ' ''60 DIAS'' descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, promocao_ordem_hc.tab_ce, promocao_ordem_hc.tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_hc ' +
      ' where promocao_ordem_hc.cod_promocao = -4 ' +
      ' and promocao_ordem_hc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select promocao_ordem_hc.cod_promocao, promocao_ordem_hc.cod_empresa, ' + IntToStr(vMaxOrdem + 3) + ' ordem, promocao_ordem_hc.atual, ' +
      ' ''90 DIAS'' descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, promocao_ordem_hc.tab_ce, promocao_ordem_hc.tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_hc ' +
      ' where promocao_ordem_hc.cod_promocao = -5 ' +
      ' and promocao_ordem_hc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select promocao_ordem_hc.cod_promocao, promocao_ordem_hc.cod_empresa, ' + IntToStr(0) + ' ordem, promocao_ordem_hc.atual, ' +
      ' ''SERVICO'' descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, promocao_ordem_hc.tab_ce, promocao_ordem_hc.tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_hc ' +
      ' where promocao_ordem_hc.cod_promocao = -11 ' +
      ' and promocao_ordem_hc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union all ' +
    	' select promocao_ordem_hc.cod_promocao, promocao_ordem_hc.cod_empresa, promocao.ordem, promocao_ordem_hc.atual, ' +
      ' promocao.descr_promocao, promocao.data_ini, promocao.data_fim, promocao_ordem_hc.tab_ce, promocao_ordem_hc.tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_hc ' +
      ' left join promocao on promocao.cod_promocao = promocao_ordem_hc.cod_promocao and promocao.cod_empresa = promocao_ordem_hc.cod_empresa ' +
      ' where promocao_ordem_hc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and promocao_ordem_hc.cod_promocao > 0 ' +
      ' order by 3 ');

    try
    	dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('TAB_CE').AsString <> 'S') and (dataSet.FieldByName('TAB_CI').AsString <> 'S') then
        begin
          dataSet.Edit;
          dataSet.FieldByName('TAB_CE').AsString := 'S';
          dataSet.Post;
        end;

        dataSet.Next;
      end;
    finally
      dataSet.First;
    end;
  end
  else if pTipo = 'E' then
    Result := montaSelect(' select promocao_ordem_ec.cod_promocao, promocao_ordem_ec.cod_empresa, promocao_ordem_ec.ordem, promocao_ordem_ec.atual, ' +
    	' promocao.descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, null tab_ce, null tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_ec ' +
      ' left join promocao on promocao.cod_promocao = promocao_ordem_ec.cod_promocao and promocao.cod_empresa = promocao_ordem_ec.cod_empresa ' +
      ' where promocao_ordem_ec.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by 3 ')
  else
  	Result := montaSelect(' select promocao_ordem_ca.cod_promocao, promocao_ordem_ca.cod_empresa, promocao_ordem_ca.ordem, promocao_ordem_ca.atual, ' +
   	' promocao.descr_promocao, cast(null as timestamp) data_ini, cast(null as timestamp) data_fim, null tab_ce, null tab_ci, ' +
      ' (select current_d from sp_current_ts(' + vDadosIni.codEmpresa + ')) dataatual from promocao_ordem_ca ' +
      ' left join promocao on promocao.cod_promocao = promocao_ordem_ca.cod_promocao and promocao.cod_empresa = promocao_ordem_ca.cod_empresa ' +
      ' where promocao_ordem_ca.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by 3 ')
end;

constructor TConfigAPIpromocaoOrdem.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsPromocaoOrdemEC);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TMsgPlataforma}

function TMsgPlataforma.abreMsgPlataforma: boolean;
begin
  Result := montaSelect(' select ' +
  	 ' msg_plataforma.id, ' +
    ' msg_plataforma.cod_empresa, ' +
    ' msg_plataforma.id_msg_aplicativo, ' +
  	 ' msg_aplicativo.aplicativo, ' +
    ' msg_plataforma.plataforma, ' +
    ' msg_plataforma.identificador_bot from msg_plataforma ' +
    ' inner join msg_aplicativo on ' +
    '		msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
    ' where msg_plataforma.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and msg_plataforma.id > 0 ' +
    ' and msg_plataforma.id_msg_aplicativo > 0 ' +
    ' order by msg_plataforma.id_msg_aplicativo, msg_plataforma.plataforma, msg_plataforma.identificador_bot ');
end;

constructor TMsgPlataforma.create;
begin
	dataset := TClientDataSet(dtmConfig.cdsMsgPlataforma);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TMsgTipoContatoOrigem }

function TMsgTipoContatoOrigem.abreMsgTipoContatoOrigem: boolean;
begin
	Result := montaSelect(' select ' +
  	' msg_tipo_contato_origem.*,  ' +
  	' msg_origem.descricao, tipo_contato.tipo from msg_tipo_contato_origem ' +
    ' left join tipo_contato on ' +
    '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
    '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
    ' left join msg_origem on ' +
    '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
    ' where msg_tipo_contato_origem.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TMsgTipoContatoOrigem.abreFormMsgTipoContatoLote: boolean;
begin
  InserirTipoContrato(frmTipoContatoOrigem.CheckListBoxTipoContrato);
  InserirOrigem(frmTipoContatoOrigem.CheckListBoxOrigem);

	Result := vDadosIni.abreForm('Origem por Tipo de Contato (Lote)', frmTipoContatoOrigem.pnOrigemTipoContato, frmTipoContatoOrigem.tsOrigemTipoContrato);

  if Result then
  begin
    if not PostMsgTipoContatoOrigemLote then
    	Exit;
  end;
end;

function TMsgTipoContatoOrigem.abreMsgTipoContatoOrigem(
	pIdTipoContato,
  pOrigem: Integer): boolean;
begin
  Result := montaSelect(' select msg_tipo_contato_origem.*,  ' +
  	' msg_origem.descricao, tipo_contato.tipo from msg_tipo_contato_origem ' +
    ' left join tipo_contato on ' +
    '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
    '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
    ' left join msg_origem on ' +
    '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
    ' where msg_tipo_contato_origem.id_tipo_contato = ' + IntToStr(pIdTipoContato) +
    ' and msg_tipo_contato_origem.id_msg_origem = ' + IntToStr(pOrigem) +
    ' and msg_tipo_contato_origem.cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TMsgTipoContatoOrigem.cadMsgTipoContatoOrigem(Tipoform: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Origem por Tipo de Contato');

    vDadosIni.vTipoForm := 0;
    if dtmConfig = nil then
      dtmConfig := TdtmConfig.Create(dtmConfig);

    if not vDadosIni.PesqPros('CFG064', 'CONSULTA', '', 'MSG_TIPO_CONTATO_ORIGEM', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmTipoContatoOrigem = nil then
      Application.CreateForm(TfrmTipoContatoOrigem, frmTipoContatoOrigem);

    if (TipoForm > 0) and (not frmTipoContatoOrigem.Visible) then
      frmTipoContatoOrigem.ShowModal
    else if (not frmTipoContatoOrigem.Visible) then
      frmTipoContatoOrigem.Show
    else if frmTipoContatoOrigem.FormStyle = fsMDIChild then
      frmTipoContatoOrigem.Show
    else
      frmTipoContatoOrigem.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TMsgTipoContatoOrigem.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsMsgTipoContatoOrigem);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  TipoContato := TTipoContato.create;
  Origem      := TMsgOrigem.create;
end;

function TMsgTipoContatoOrigem.Delete(pPerguntar: Boolean = True): boolean;
var
  vId: string;
  vOrigem: string;
  vTipo: string;
  vtemp: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  try
    vId     := trim(dataSet.FieldByName('ID').AsString);
    vOrigem := trim(dataSet.FieldByName('DESCRICAO').AsString);
    vTipo   := trim(dataSet.FieldByName('TIPO').AsString);

    prepare_loop('SEL = ''S''');

    if not dataset.IsEmpty then
    begin
      vId     := '';
      vOrigem := '';
      vTipo   := '';
    end;
  finally
  	prepare_loop_done;
  end;

  try
  	if (trim(vId) <> '') then
      prepare_loop('ID = ' + vId)
    else
    	prepare_loop('SEL = ''S''');

    vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
      'ORIGEM POR TIPO DE CONTATO' + #13 +
      'Tipo: ' + vTipo + #13 +
      'Origem: ' + vOrigem;

    if (trim(vId) = '') then
    	vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

    if not vDadosIni.PesqPros('CFG068', 'EXCLUIR', '', 'MSG_TIPO_CONTATO_ORIGEM',
      vDadosIni.IfThen(trim(vId) <> '', vId, ''), buscas, false) then
      Exit;

    if pPerguntar then
      if Application.MessageBox(PChar(vtemp),
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        	exit;

    dataSet.First;
    while not dataSet.Eof do
  	begin
      SqlExec(' delete from msg_tipo_contato_origem ' +
        ' where id = %d ' +
        ' and cod_empresa = %d ',
        [fint('id'), fint('cod_empresa')], buscas);

      vDadosIni.GravaAuditoria('CFG068', 'EXCLUIR', '', 'MSG_TIPO_CONTATO_ORIGEM',
      	IntToStr(fint('id')), buscas);

      dataSet.Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    prepare_loop_done;
  end;

  Result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('CFG068', 'EXCLUIR', 'SUCESSO', 'MSG_TIPO_CONTATO_ORIGEM', '', buscas)
  else
    vDadosIni.GravaAuditoria('CFG068', 'EXCLUIR', 'FALHA', 'MSG_TIPO_CONTATO_ORIGEM', '', buscas);

  Result := true;
  Refresh;
end;

destructor TMsgTipoContatoOrigem.destroy;
begin
	TipoContato.Free;
  TipoContato := nil;

  Origem.Free;
  Origem := nil;

  inherited;
end;

function TMsgTipoContatoOrigem.PostMsgTipoContatoOrigemLote: boolean;
var
	I, J: Integer;
  vCodTipoContato: Integer;
  vCodOrigem: Integer;
  vSel: boolean;
	vSql: string;
begin
	Result := False;
  vSel := False;

  vSql := dataSet.CommandText;

  for I := 0 to frmTipoContatoOrigem.CheckListBoxTipoContrato.Count - 1 do
  begin
    if frmTipoContatoOrigem.CheckListBoxTipoContrato.Checked[I] then
    begin
    	vCodTipoContato := StrToInt(Copy(frmTipoContatoOrigem.CheckListBoxTipoContrato.Items[i], 1, Pos(' | ', frmTipoContatoOrigem.CheckListBoxTipoContrato.Items[i]) - 1));

      for J := 0 to frmTipoContatoOrigem.CheckListBoxOrigem.Count - 1 do
      begin
        if frmTipoContatoOrigem.CheckListBoxOrigem.Checked[J] then
        begin
        	vCodOrigem  := StrToInt(Copy(frmTipoContatoOrigem.CheckListBoxOrigem.Items[j], 1, Pos(' | ', frmTipoContatoOrigem.CheckListBoxOrigem.Items[j]) - 1));

        	vSel := True;

          abreMsgTipoContatoOrigem(
            vCodTipoContato,
            vCodOrigem);

          if dataSet.IsEmpty then
          begin
            if not Insert then
              Exit;

            dataSet.FieldByName('ID_TIPO_CONTATO').AsInteger := vCodTipoContato;
            dataSet.FieldByName('ID_MSG_ORIGEM').AsInteger   := vCodOrigem;

            if not Post then
              Exit;
          end;
        end;
      end;
    end;
  end;

  Result := vSel;

  if (Result) and (trim(vSql) <> '') then
  	montaSelect(vSql);
end;

procedure TMsgTipoContatoOrigem.InserirOrigem(
  pCheckListBoxOrigem: TCheckListBox);
begin
  pCheckListBoxOrigem.Clear;

  buscas.Close;
  buscas.SQL.Text := ' select id, descricao from msg_origem ';
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
		pCheckListBoxOrigem.Items.Add(
    	vDadosIni.StrZero(buscas.FieldByName('id').AsInteger, 3) + ' | ' +
      trim(buscas.FieldByName('descricao').AsString)
    );

    buscas.Next;
  end;
end;

procedure TMsgTipoContatoOrigem.InserirTipoContrato(
  pCheckListBoxTipoContrato: TCheckListBox);
begin
	pCheckListBoxTipoContrato.Clear;

  buscas.Close;
  buscas.SQL.Text := ' select id, cod_empresa, tipo from tipo_contato ' +
  	' where cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
  	pCheckListBoxTipoContrato.Items.Add(
    	vDadosIni.StrZero(buscas.FieldByName('id').AsInteger, 3) + ' | ' +
      trim(buscas.FieldByName('tipo').AsString)
    );

    buscas.Next;
  end;
end;

function TMsgTipoContatoOrigem.Insert: boolean;
begin
	if not vDadosIni.PesqPros('CFG066', 'INCLUIR', '', 'MSG_TIPO_CONTATO_ORIGEM',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect(' select msg_tipo_contato_origem.*,  ' +
  	' msg_origem.descricao, tipo_contato.tipo from msg_tipo_contato_origem ' +
    ' left join tipo_contato on ' +
    '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
    '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
    ' left join msg_origem on ' +
    '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
    ' where msg_tipo_contato_origem.id = 0 ' +
    ' and msg_tipo_contato_origem.cod_empresa = 0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;

    TipoContato.abreTipoContato;
    Origem.abreOrigem;
  end;
end;

function TMsgTipoContatoOrigem.edit: boolean;
begin
	Result := False;
  if not vDadosIni.PesqPros('CFG067', 'ALTERAR', '', 'MSG_TIPO_CONTATO_ORIGEM',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;

    TipoContato.abreTipoContato;
    Origem.abreOrigem;
  end;
end;

function TMsgTipoContatoOrigem.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('CFG069', 'SALVAR', '', 'MSG_TIPO_CONTATO_ORIGEM',
      dataSet.FieldByName('ID').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('ID_TIPO_CONTATO').AsInteger <= 0 then
      raiseExceptionCreate('Tipo de Contato deve ser informado', 'DBLookupComboBox1');

    if trim(dataSet.FieldByName('ID_MSG_ORIGEM').AsString) = '' then
      raiseExceptionCreate('Origem deve ser informado', 'DBLookupComboBox2');

    SqlOpen(' select msg_tipo_contato_origem.id_tipo_contato, ' +
    	' msg_tipo_contato_origem.id_msg_origem, ' +
      ' msg_tipo_contato_origem.cod_empresa, ' +
      ' msg_origem.descricao, ' +
      ' tipo_contato.tipo from msg_tipo_contato_origem ' +
      ' inner join tipo_contato on ' +
      '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
      '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      ' inner join msg_origem on ' +
      '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
      ' where msg_tipo_contato_origem.id_tipo_contato = %d ' +
      ' and msg_tipo_contato_origem.id_msg_origem = %d ' +
      ' and msg_tipo_contato_origem.cod_empresa = %d ' +
      ' and msg_tipo_contato_origem.id <> %d ',
      [fint('id_tipo_contato'), fint('id_msg_origem'), fint('cod_empresa'), fint('id')], buscas);

      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe registro para essa Origem e Tipo de Contato: ' + #13 + #13 +
          'Tipo de Contato: ' + trim(buscas.FieldByName('tipo').AsString) + #13 +
          'Origem: ' + trim(buscas.FieldByName('descricao').AsString), 'DBLookupComboBox1');

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('ID').AsInteger :=
        Gencodigo('MSG_TIPO_CONTATO_ORIGEM', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('CFG069', acao, 'SUCESSO', 'MSG_TIPO_CONTATO_ORIGEM',
        dataSet.FieldByName('ID').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('CFG069', acao, 'FALHA', 'MSG_TIPO_CONTATO_ORIGEM',
        dataSet.FieldByName('ID').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TMsgTipoContatoOrigem._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
begin
  result := true;
  rCons.vSqlAdicional := '';
  rCons.vValor   := Trim(rCons.vValor);
  rCons.vValorAd := Trim(rCons.vValorAd);

  if rCons.vAdicional then
  begin
    if rCons.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDate(rCons.vDataIniAd);
      except
        rCons.vDataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rCons.vDataFimAd);
      except
        rCons.vDataFimAd := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
          'Atenção', MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
          formatodata := 'mm/dd/yyyy'
        else if pos('.', ShortDateFormat) <> 0 then
          formatodata := 'dd.mm.yyyy';
        if rCons.vDataIniAd <> '' then
          rCons.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCons.vDataIniAd)));
        if rCons.vDataFimAd <> '' then
          rCons.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCons.vDataFimAd)));
      end;
    end
    else if rCons.vValorAd = '' then
      exit;
    if rCons.vCondicaoAd = 'Igual' then
      rCons.vCondicaoAd := '='
    else if rCons.vCondicaoAd = 'Maior' then
      rCons.vCondicaoAd := '>'
    else if rCons.vCondicaoAd = 'Maior ou Igual' then
      rCons.vCondicaoAd := '>='
    else if rCons.vCondicaoAd = 'Menor' then
      rCons.vCondicaoAd := '<'
    else if rCons.vCondicaoAd = 'Menor ou Igual' then
      rCons.vCondicaoAd := '<='
    else if rCons.vCondicaoAd = 'Diferente' then
      rCons.vCondicaoAd := '<>'
    else if (rCons.vCondicaoAd = 'Esta contido') then
      rCons.vCondicaoAd := 'like'
    else if (rCons.vCondicaoAd = 'Começa') then
      rCons.vCondicaoAd := 'Começa'
    else
      rCons.vCondicaoAd := '=';
    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rCons.vCampoAd) then
        begin
          rCons.vValorAd := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rCons.vValorAd);
//          if rCons.vCampo = rCons.vCampoAd then
//          begin
//            rCons.vsqlAdicional := '';
//            exit;
//          end;
          rCons.vCampoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rCons.vCondicaoAd = 'Começa') or (rCons.vCondicaoAd = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rCons.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end
            else if ((Dataset.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField))
              then
            try
              strtofloat(rCons.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rCons.vCondicaoAd := '=';
            rCons.vValorAd := vDadosIni.trocaVirgulaPorPonto(rCons.vValorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if (rCons.vDataIniAd <> '') and (rCons.vDataFimAd <> '') then
              rCons.vSqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' >= ' + rCons.vDataIniAd + ' and ' + rCons.vCampoAd + ' <= ' + rCons.vDataFimAd
            else if (rCons.vDataFimAd <> '') then
              rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' <= ' + rCons.vDataIniAd
            else if (rCons.vDataIniAd <> '') and (rCons.vDataFimAd <> '') then
              rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' >= ' + rCons.vDataIniAd;
            Break;
          end;
          if rCons.vCondicaoAd = 'like' then
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
              ' like ' + QuotedStr('%' +
              rCons.vValorAd +
              '%')
          else if rCons.vCondicaoAd = 'Começa' then
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
              ' like ' +
              QuotedStr(rCons.vValorAd + '%')
          else
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd + ' '
              + rCons.vCondicaoAd + ' ' +
              QuotedStr(rCons.vValorAd);

          if rCons.vCondicaoAd <> 'Começa' then
          begin
            if rCons.vCampoAd = 'DESCRICAO' then
              rCons.vsqlAdicional := ' MSG_ORIGEM.DESCRICAO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else if rCons.vCampoAd = 'TIPO' then
              rCons.vsqlAdicional := 'TIPO_CONTATO.TIPO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else
              rCons.vsqlAdicional := 'MSG_TIPO_CONTATO_ORIGEM.' + rCons.vCampoAd + ' ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd);
          end
          else
          begin
            if rCons.vCampoAd = 'DESCRICAO' then
              rCons.vsqlAdicional := ' MSG_ORIGEM.DESCRICAO LIKE ' + QuotedStr(rCons.vValorAd + '%')
            else if rCons.vCampoAd = 'TIPO' then
              rCons.vsqlAdicional := 'TIPO_CONTATO.TIPO LIKE' + QuotedStr(rCons.vValorAd + '%')
            else
              rCons.vsqlAdicional := 'MSG_TIPO_CONTATO_ORIGEM.' + rCons.vCampoAd + ' LIKE' + QuotedStr(rCons.vValorAd + '%');
          end;

          Break;
        end;
      end;
    end;
  end;

  tempSql := '';

  if Trim(rCons.vValor) <> '' then
    for I := 0 to dataSet.FieldCount - 1 do
      if Dataset.Fields[I].FieldKind = fkData then
        if ContainsText(dataset.Fields[I].DisplayName, rCons.vCampo) then
        begin
          rCons.vValor := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rCons.vValor);
          Break;
        end;

  if rCons.vCampo = 'Origem' then
    tempSql := ' MSG_ORIGEM.DESCRICAO '
  else if rCons.vCampo = 'Tipo Contato' then
    tempSql := ' TIPO_CONTATO.TIPO ';
  if tempSql  <> '' then
  begin
    if rCons.vCondicao = 'Igual' then
      tempTipo := '= '
    else if rCons.vCondicao = 'Maior' then
      tempTipo := '> '
    else if rCons.vCondicao = 'Maior ou Igual' then
      tempTipo := '>= '
    else if rCons.vCondicao = 'Menor' then
      tempTipo := '< '
    else if rCons.vCondicao = 'Menor ou Igual' then
      tempTipo := '<= '
    else if rCons.vCondicao = 'Diferente' then
      tempTipo := '<> '
    else if (rCons.vCondicao = 'Esta contido') then
      tempTipo := 'like'
    else if (rCons.vCondicao = 'Começa') then
      tempTipo := 'Começa'
    else
      tempTipo := '= ';

    if tempTipo = 'like' then
      tempSql := tempSql + tempTipo + QuotedStr('%' + rCons.vValor + '%')
    else if tempTipo = 'Começa' then
      tempSql := tempSql + 'like' + QuotedStr(rCons.vValor + '%')
    else
      tempSql := tempSql + tempTipo + QuotedStr(rCons.vValor);
    rCons.vValor := '';
    if Trim(rCons.vSqlAdicional) <> '' then
      rCons.vSqlAdicional := rCons.vSqlAdicional + ' and ' + tempSql
    else
      rCons.vSqlAdicional := tempSql;
  end;
end;

procedure TMsgTipoContatoOrigem._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TMsgTipoContatoOrigem._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TMsgTipoContatoOrigem._marcarTodos;
begin
 	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TTipoContato }

function TTipoContato.abreTipoContato: boolean;
begin
  Result := montaSelect(
  	 ' select ' +
    ' tipo_contato.id, ' +
    ' tipo_contato.cod_empresa, ' +
    ' tipo_contato.tipo, ' +
    ' ((select result from strzero(coalesce(tipo_contato.id, 0), 3)) || '' | '' || trim(coalesce(tipo_contato.tipo, ''''))) tipo_contato from tipo_contato ' +
  	 ' where cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TTipoContato.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsTipoContato);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TMsgOrigem }

function TMsgOrigem.abreOrigem: boolean;
begin
  Result := montaSelect(
  	 ' select ' +
    ' msg_origem.id, ' +
    ' msg_origem.descricao, ' +
    ' ((select result from strzero(coalesce(msg_origem.id, 0), 3)) || '' | '' || trim(coalesce(msg_origem.descricao, ''''))) origem from msg_origem ' +
    ' order by 2 ');
end;

constructor TMsgOrigem.create;
begin
	dataset := TClientDataSet(dtmConfig.cdsMsgOrigem);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TMsgTipoContatoOrigemPlataforma }

function TMsgTipoContatoOrigemPlataforma.abreFormMsgTipoContatoOrigemPlataformaLote: boolean;
begin
	InserirPlataforma(frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma);
	InserirOrigemTipoContrato(frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato);

	Result := vDadosIni.abreForm('Origem por Tipo de Contato e Plataforma (Lote)', frmTipoContatoOrigemPlataforma.pnOrigemTipoContatoPlataforma, frmTipoContatoOrigemPlataforma.tsOrigemTipoContratoPlataforma);

  if Result then
  begin
    if not PostMsgTipoContatoOrigemPlataformaLote then
    	Exit;
  end;
end;

function TMsgTipoContatoOrigemPlataforma.abreMsgTipoContatoOrigemPlataforma: boolean;
begin
	Result := montaSelect(' select msg_tipo_contato_origem_plat.*, ' +
    ' msg_aplicativo.aplicativo, msg_plataforma.plataforma, msg_plataforma.identificador_bot, ' +
    ' tipo_contato.tipo, msg_origem.descricao from msg_tipo_contato_origem_plat ' +
    ' left join msg_plataforma on ' +
    '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
    '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
    '	left join msg_aplicativo on ' +
    '		msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
    ' left join msg_tipo_contato_origem on ' +
    '     msg_tipo_contato_origem.id = msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem ' +
    '     and msg_tipo_contato_origem.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
    ' left join msg_origem on ' +
    '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
    ' left join tipo_contato on ' +
    '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
    '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
    ' where msg_tipo_contato_origem_plat.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TMsgTipoContatoOrigemPlataforma.abreMsgTipoContatoOrigemPlataforma(
  pIdPlataforma, pIdOrigemTipoContato: Integer): boolean;
begin
  Result := montaSelect(' select msg_tipo_contato_origem_plat.*, ' +
    ' msg_aplicativo.aplicativo, msg_plataforma.plataforma, msg_plataforma.identificador_bot, ' +
    ' tipo_contato.tipo, msg_origem.descricao from msg_tipo_contato_origem_plat ' +
    ' left join msg_plataforma on ' +
    '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
    '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
    '	left join msg_aplicativo on ' +
    '		msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
    ' left join msg_tipo_contato_origem on ' +
    '     msg_tipo_contato_origem.id = msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem ' +
    '     and msg_tipo_contato_origem.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
    ' left join msg_origem on ' +
    '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
    ' left join tipo_contato on ' +
    '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
    '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
    ' where msg_tipo_contato_origem_plat.id_msg_plataforma = ' + IntToStr(pIdPlataforma) +
    ' and msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = ' + IntToStr(pIdOrigemTipoContato) +
    ' and msg_tipo_contato_origem_plat.cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TMsgTipoContatoOrigemPlataforma.cadMsgTipoContatoOrigemPlataforma(
  Tipoform: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Origem por Tipo de Contato e Plataforma');

    vDadosIni.vTipoForm := 0;
    if dtmConfig = nil then
      dtmConfig := TdtmConfig.Create(dtmConfig);

    if not vDadosIni.PesqPros('CFG070', 'CONSULTA', '', 'MSG_TIPO_CONTATO_ORIGEM_PLAT', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmTipoContatoOrigemPlataforma = nil then
      Application.CreateForm(TfrmTipoContatoOrigemPlataforma, frmTipoContatoOrigemPlataforma);

    if (TipoForm > 0) and (not frmTipoContatoOrigemPlataforma.Visible) then
      frmTipoContatoOrigemPlataforma.ShowModal
    else if (not frmTipoContatoOrigemPlataforma.Visible) then
      frmTipoContatoOrigemPlataforma.Show
    else if frmTipoContatoOrigemPlataforma.FormStyle = fsMDIChild then
      frmTipoContatoOrigemPlataforma.Show
    else
      frmTipoContatoOrigemPlataforma.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TMsgTipoContatoOrigemPlataforma.create;
begin
	dataset := TClientDataSet(dtmConfig.cdsMsgTipoContatoOrigemPlataforma);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  Plataforma        := TAbreMsgPlataforma.create;
  TipoContatoOrigem := TAbreMsgTipoContatoOrigem.create;
end;

function TMsgTipoContatoOrigemPlataforma.Delete(pPerguntar: Boolean): boolean;
var
  vIdPlataforma: string;
  vIdTipoContatoOrigem: string;
  vOrigem: string;
  vTipo: string;
  vAplicativo: string;
  vPlataforma: string;
  vtemp: string;
begin
	Result := False;
  if dataSet.IsEmpty then
    exit;

  try
    vIdPlataforma        := trim(dataSet.FieldByName('ID_MSG_PLATAFORMA').AsString);
    vIdTipoContatoOrigem := trim(dataSet.FieldByName('ID_MSG_TIPO_CONTATO_ORIGEM').AsString);
    vAplicativo          := trim(dataSet.FieldByName('APLICATIVO').AsString);
    vPlataforma          := trim(dataSet.FieldByName('PLATAFORMA').AsString);
    vOrigem              := trim(dataSet.FieldByName('DESCRICAO').AsString);
    vTipo                := trim(dataSet.FieldByName('TIPO').AsString);

    prepare_loop('SEL = ''S''');

    if not dataset.IsEmpty then
    begin
      vIdPlataforma        := '';
      vIdTipoContatoOrigem := '';
      vAplicativo          := '';
      vPlataforma          := '';
      vOrigem              := '';
      vTipo                := '';
    end;
  finally
  	prepare_loop_done;
  end;

  try
  	if (trim(vIdPlataforma) <> '') and (trim(vIdTipoContatoOrigem) <> '') then
      prepare_loop('ID_MSG_PLATAFORMA = ' + vIdPlataforma + ' AND ID_MSG_TIPO_CONTATO_ORIGEM = ' + vIdTipoContatoOrigem)
    else
    	prepare_loop('SEL = ''S''');

    vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
      'PLATAFORMA E ORIGEM POR TIPO DE CONTATO' + #13 +
      'Aplicativo: ' + vAplicativo + #13 +
      'Plataforma: ' + vPlataforma + #13 +
      'Tipo Contato: ' + vTipo + #13 +
      'Origem: ' + vOrigem;

    if (trim(vIdPlataforma) = '') and (trim(vIdTipoContatoOrigem) = '') then
    	vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

    if not vDadosIni.PesqPros('CFG074', 'EXCLUIR', '', 'MSG_TIPO_CONTATO_ORIGEM_PLAT',
      vDadosIni.IfThen((trim(vIdPlataforma) <> '') and (trim(vIdTipoContatoOrigem) <> ''), vIdPlataforma + ' - ' + vIdTipoContatoOrigem, ''), buscas, false) then
      Exit;

    if pPerguntar then
      if Application.MessageBox(PChar(vtemp),
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        	exit;

    dataSet.First;
    while not dataSet.Eof do
  	begin
      SqlExec(' delete from msg_tipo_contato_origem_plat ' +
        ' where id_msg_plataforma = %d ' +
        ' and id_msg_tipo_contato_origem = %d ' +
        ' and cod_empresa = %d ',
        [fint('id_msg_plataforma'), fint('id_msg_tipo_contato_origem') , fint('cod_empresa')], buscas);

      vDadosIni.GravaAuditoria('CFG074', 'EXCLUIR', '', 'MSG_TIPO_CONTATO_ORIGEM_PLAT',
      	IntToStr(fint('id_msg_plataforma')) + ' - ' + IntToStr(fint('id_msg_tipo_contato_origem')), buscas);

      dataSet.Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    prepare_loop_done;
  end;

  Result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('CFG074', 'EXCLUIR', 'SUCESSO', 'MSG_TIPO_CONTATO_ORIGEM_PLAT', '', buscas)
  else
    vDadosIni.GravaAuditoria('CFG074', 'EXCLUIR', 'FALHA', 'MSG_TIPO_CONTATO_ORIGEM_PLAT', '', buscas);

  Result := true;
  Refresh;
end;

destructor TMsgTipoContatoOrigemPlataforma.destroy;
begin
  Plataforma.Free;
  Plataforma := nil;

  TipoContatoOrigem.Free;
  TipoContatoOrigem := nil;

  inherited;
end;

function TMsgTipoContatoOrigemPlataforma.edit: boolean;
begin
	Result := False;
  if not vDadosIni.PesqPros('CFG073', 'ALTERAR', '', 'MSG_TIPO_CONTATO_ORIGEM_PLAT',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;

    Plataforma.abreMsgPlataforma;
    TipoContatoOrigem.AbreMsgTipoContatoOrigem;
  end;
end;

procedure TMsgTipoContatoOrigemPlataforma.InserirOrigemTipoContrato(
  pCheckListBoxOrigemTipoContrato: TCheckListBox);
begin
	pCheckListBoxOrigemTipoContrato.Clear;

  buscas.Close;
  buscas.SQL.Text := ' select msg_tipo_contato_origem.id, ' +
  	' (tipo_contato.tipo || '' ('' || msg_origem.descricao || '')'') tipo_contato_origem from msg_tipo_contato_origem ' +
    ' inner join msg_origem on ' +
    '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
    ' inner join tipo_contato on ' +
    '			tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
    '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
    ' where msg_tipo_contato_origem.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by msg_origem.descricao, tipo_contato.tipo ';
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
  	pCheckListBoxOrigemTipoContrato.Items.Add(
    	vDadosIni.StrZero(buscas.FieldByName('id').AsInteger, 3) + ' | ' +
      trim(buscas.FieldByName('tipo_contato_origem').AsString)
    );

    buscas.Next;
  end;
end;

procedure TMsgTipoContatoOrigemPlataforma.InserirPlataforma(
  pCheckListBoxPlataforma: TCheckListBox);
begin
	pCheckListBoxPlataforma.Clear;

  buscas.Close;
  buscas.SQL.Text := ' select msg_plataforma.id, ' +
  	' (trim(coalesce(msg_aplicativo.aplicativo, '''')) || '' | '' || ' +
    '	 trim(coalesce(msg_plataforma.plataforma, '''')) || '' | '' || ' +
    '	 trim(coalesce(msg_plataforma.identificador_bot, '''')) ' +
    ' ) plataforma from msg_plataforma ' +
    ' left join msg_aplicativo on msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
  	' where msg_plataforma.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and msg_plataforma.id > 0 ' +
    ' and msg_plataforma.id_msg_aplicativo > 0 ' +
    ' order by msg_plataforma.id_msg_aplicativo, msg_plataforma.plataforma, msg_plataforma.identificador_bot ';
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
  	pCheckListBoxPlataforma.Items.Add(
    	vDadosIni.StrZero(buscas.FieldByName('id').AsInteger, 3) + ' | ' +
      trim(buscas.FieldByName('plataforma').AsString)
    );

    buscas.Next;
  end;
end;

function TMsgTipoContatoOrigemPlataforma.Insert: boolean;
begin
	if not vDadosIni.PesqPros('CFG072', 'INCLUIR', '', 'MSG_TIPO_CONTATO_ORIGEM_PLAT',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect(' select msg_tipo_contato_origem_plat.*, ' +
    	' msg_aplicativo.aplicativo, msg_plataforma.plataforma, msg_plataforma.identificador_bot, ' +
      ' tipo_contato.tipo, msg_origem.descricao from msg_tipo_contato_origem_plat ' +
      ' left join msg_plataforma on ' +
      '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
      '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
      '	left join msg_aplicativo on ' +
      '		msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
      ' left join msg_tipo_contato_origem on ' +
      '     msg_tipo_contato_origem.id = msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem ' +
      '     and msg_tipo_contato_origem.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
      ' left join msg_origem on ' +
      '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
      ' left join tipo_contato on ' +
      '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
      '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      ' where msg_tipo_contato_origem_plat.id_msg_plataforma = 0 ' +
      ' and msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = 0 ' +
      ' and msg_tipo_contato_origem_plat.cod_empresa = 0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;

    Plataforma.abreMsgPlataforma;
    TipoContatoOrigem.AbreMsgTipoContatoOrigem;
  end;
end;

function TMsgTipoContatoOrigemPlataforma.MsgTipoContatoOrigemPlataforma: boolean;
var
	I, J: Integer;
  vCodPlataforma: Integer;
  vCodOrigemTipoContrato: Integer;
  vSel: boolean;
	vSql: string;
begin
	Result := False;
  vSel := False;

  vSql := dataSet.CommandText;

  for I := 0 to frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Count - 1 do
  begin
    if frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Checked[I] then
    begin
    	vCodPlataforma := StrToInt(Copy(frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Items[i], 1, Pos(' | ', frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Items[i]) - 1));

      for J := 0 to frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Count - 1 do
      begin
        vCodOrigemTipoContrato := StrToInt(Copy(frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Items[j], 1, Pos(' | ', frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Items[j]) - 1));

        if frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Checked[J] then
        begin
        	vSel := True;

          abreMsgTipoContatoOrigemPlataforma(
            vCodPlataforma,
            vCodOrigemTipoContrato);

          if dataSet.IsEmpty then
          begin
            if not Insert then
              Exit;

            dataSet.FieldByName('ID_MSG_PLATAFORMA').AsInteger := vCodPlataforma;
            dataSet.FieldByName('ID_MSG_ORIGEM').AsInteger     := vCodOrigemTipoContrato;

            if not Post then
              Exit;
          end;
        end;
      end;
    end;
  end;

  Result := vSel;

  if (Result) and (trim(vSql) <> '') then
  	montaSelect(vSql);
end;

function TMsgTipoContatoOrigemPlataforma.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('CFG075', 'SALVAR', '', 'MSG_TIPO_CONTATO_ORIGEM_PLAT',
      dataSet.FieldByName('ID_MSG_PLATAFORMA').AsString + ' - ' + dataSet.FieldByName('ID_MSG_TIPO_CONTATO_ORIGEM').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('ID_MSG_PLATAFORMA').AsInteger <= 0 then
      raiseExceptionCreate('Plataforma deve ser informado', 'DBLookupComboBox1');

    if dataSet.FieldByName('ID_MSG_TIPO_CONTATO_ORIGEM').AsInteger <= 0 then
      raiseExceptionCreate('Origem por Tipo de Contato deve ser informado', 'DBLookupComboBox2');

    if acao = 'INSERIR' then
    begin
    	SqlOpen(' select msg_tipo_contato_origem_plat.*, ' +
        ' msg_aplicativo.aplicativo, ' +
        ' msg_plataforma.plataforma, ' +
        ' tipo_contato.tipo, ' +
        ' msg_origem.descricao from msg_tipo_contato_origem_plat ' +
        ' inner join msg_plataforma on ' +
        '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
        '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
        '	inner join msg_aplicativo on ' +
        '		msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
        ' inner join msg_tipo_contato_origem on ' +
        '     msg_tipo_contato_origem.id = msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem ' +
        '     and msg_tipo_contato_origem.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
        ' inner join msg_origem on ' +
        '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
        ' inner join tipo_contato on ' +
        '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
        '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
        ' where msg_tipo_contato_origem_plat.id_msg_plataforma = %d ' +
        ' and msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = %d ' +
        ' and msg_tipo_contato_origem_plat.cod_empresa = %d ',
        [fint('id_msg_plataforma'), fint('id_msg_tipo_contato_origem'), fint('cod_empresa')], buscas);

      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe registro para essa Plataforma e Origem por Tipo de Contato:' + #13 + #13 +
          'Aplicativo: ' + trim(buscas.FieldByName('aplicativo').AsString) + #13 +
          'Plataforma: ' + trim(buscas.FieldByName('plataforma').AsString) + #13 +
          'Tipo de Contato: ' + trim(buscas.FieldByName('tipo').AsString) + #13 +
          'Origem: ' + trim(buscas.FieldByName('descricao').AsString), 'DBLookupComboBox1');

      SqlOpen(' select msg_tipo_contato_origem_plat.*, ' +
        ' msg_aplicativo.aplicativo, ' +
        ' msg_plataforma.plataforma, ' +
        ' tipo_contato.tipo, ' +
        ' msg_origem.descricao from msg_tipo_contato_origem_plat ' +
        ' inner join msg_tipo_contato_origem on ' +
        '     msg_tipo_contato_origem.id = msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem ' +
        '     and msg_tipo_contato_origem.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
        ' inner join msg_plataforma on  ' +
        '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
        '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
        ' inner join msg_aplicativo on ' +
        '     msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
        ' inner join tipo_contato on ' +
        '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
        '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
        ' inner join msg_origem on ' +
        '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
        ' where msg_tipo_contato_origem_plat.id_msg_plataforma <> %d ' +
        ' and msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = %d ' +
        ' and msg_tipo_contato_origem_plat.cod_empresa = %d ' +
        ' and msg_plataforma.id_msg_aplicativo in (select msg_plataforma.id_msg_aplicativo from msg_plataforma ' +
        '	                                         where msg_plataforma.id = %d ' +
        '                                          and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa) ',
        [fint('id_msg_plataforma'),
         fint('id_msg_tipo_contato_origem'),
         fint('cod_empresa'),
         fint('id_msg_plataforma')], buscas);

      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe registro para esse Aplicativo e Origem por Tipo de Contato: ' + #13 + #13 +
          'Aplicativo: ' + trim(buscas.FieldByName('aplicativo').AsString) + #13 +
          'Plataforma: ' + trim(buscas.FieldByName('plataforma').AsString) + #13 +
          'Tipo de Contato: ' + trim(buscas.FieldByName('tipo').AsString) + #13 +
          'Origem: ' + trim(buscas.FieldByName('descricao').AsString), 'DBLookupComboBox1');
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('CFG075', acao, 'SUCESSO', 'MSG_TIPO_CONTATO_ORIGEM_PLAT',
        dataSet.FieldByName('ID_MSG_PLATAFORMA').AsString + ' - ' + dataSet.FieldByName('ID_MSG_TIPO_CONTATO_ORIGEM').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('CFG075', acao, 'FALHA', 'MSG_TIPO_CONTATO_ORIGEM_PLAT',
        dataSet.FieldByName('ID_MSG_PLATAFORMA').AsString + ' - ' + dataSet.FieldByName('ID_MSG_TIPO_CONTATO_ORIGEM').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TMsgTipoContatoOrigemPlataforma.PostMsgTipoContatoOrigemPlataformaLote: boolean;
var
	I, J: Integer;
  vCodPlataforma: Integer;
  vCodOrigemTipoContrato: Integer;
  vSel: boolean;
	vSql: string;
begin
	Result := False;
  vSel := False;

  vSql := dataSet.CommandText;

  for I := 0 to frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Count - 1 do
  begin
    if frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Checked[I] then
    begin
      vCodPlataforma := StrToInt(Copy(frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Items[i], 1, Pos(' | ', frmTipoContatoOrigemPlataforma.CheckListBoxPlataforma.Items[i]) - 1));

      for J := 0 to frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Count - 1 do
      begin
      	if frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Checked[J] then
        begin
      		vCodOrigemTipoContrato := StrToInt(Copy(frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Items[j], 1, Pos(' | ', frmTipoContatoOrigemPlataforma.CheckListBoxOrigemTipoContrato.Items[j]) - 1));

        	vSel := True;

          abreMsgTipoContatoOrigemPlataforma(
            vCodPlataforma,
            vCodOrigemTipoContrato);

          if dataSet.IsEmpty then
          begin
            if not Insert then
              Exit;

            dataSet.FieldByName('ID_MSG_PLATAFORMA').AsInteger           := vCodPlataforma;
            dataSet.FieldByName('ID_MSG_TIPO_CONTATO_ORIGEM').AsInteger  := vCodOrigemTipoContrato;

            if not Post then
              Exit;
          end;
        end;
      end;
    end;
  end;

  Result := vSel;

  if (Result) and (trim(vSql) <> '') then
  	montaSelect(vSql);
end;

function TMsgTipoContatoOrigemPlataforma._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
begin
  result := true;
  rCons.vSqlAdicional := '';
  rCons.vValor   := Trim(rCons.vValor);
  rCons.vValorAd := Trim(rCons.vValorAd);

  if rCons.vAdicional then
  begin
    if rCons.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDate(rCons.vDataIniAd);
      except
        rCons.vDataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rCons.vDataFimAd);
      except
        rCons.vDataFimAd := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
          'Atenção', MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
          formatodata := 'mm/dd/yyyy'
        else if pos('.', ShortDateFormat) <> 0 then
          formatodata := 'dd.mm.yyyy';
        if rCons.vDataIniAd <> '' then
          rCons.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCons.vDataIniAd)));
        if rCons.vDataFimAd <> '' then
          rCons.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCons.vDataFimAd)));
      end;
    end
    else if rCons.vValorAd = '' then
      exit;
    if rCons.vCondicaoAd = 'Igual' then
      rCons.vCondicaoAd := '='
    else if rCons.vCondicaoAd = 'Maior' then
      rCons.vCondicaoAd := '>'
    else if rCons.vCondicaoAd = 'Maior ou Igual' then
      rCons.vCondicaoAd := '>='
    else if rCons.vCondicaoAd = 'Menor' then
      rCons.vCondicaoAd := '<'
    else if rCons.vCondicaoAd = 'Menor ou Igual' then
      rCons.vCondicaoAd := '<='
    else if rCons.vCondicaoAd = 'Diferente' then
      rCons.vCondicaoAd := '<>'
    else if (rCons.vCondicaoAd = 'Esta contido') then
      rCons.vCondicaoAd := 'like'
    else if (rCons.vCondicaoAd = 'Começa') then
      rCons.vCondicaoAd := 'Começa'
    else
      rCons.vCondicaoAd := '=';
    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rCons.vCampoAd) then
        begin
          rCons.vValorAd := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rCons.vValorAd);
//          if rCons.vCampo = rCons.vCampoAd then
//          begin
//            rCons.vsqlAdicional := '';
//            exit;
//          end;
          rCons.vCampoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rCons.vCondicaoAd = 'Começa') or (rCons.vCondicaoAd = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rCons.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end
            else if ((Dataset.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField))
              then
            try
              strtofloat(rCons.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rCons.vCondicaoAd := '=';
            rCons.vValorAd := vDadosIni.trocaVirgulaPorPonto(rCons.vValorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if (rCons.vDataIniAd <> '') and (rCons.vDataFimAd <> '') then
              rCons.vSqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' >= ' + rCons.vDataIniAd + ' and ' + rCons.vCampoAd + ' <= ' + rCons.vDataFimAd
            else if (rCons.vDataFimAd <> '') then
              rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' <= ' + rCons.vDataIniAd
            else if (rCons.vDataIniAd <> '') and (rCons.vDataFimAd <> '') then
              rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' >= ' + rCons.vDataIniAd;
            Break;
          end;
          if rCons.vCondicaoAd = 'like' then
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
              ' like ' + QuotedStr('%' +
              rCons.vValorAd +
              '%')
          else if rCons.vCondicaoAd = 'Começa' then
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
              ' like ' +
              QuotedStr(rCons.vValorAd + '%')
          else
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd + ' '
              + rCons.vCondicaoAd + ' ' +
              QuotedStr(rCons.vValorAd);

          if rCons.vCondicaoAd <> 'Começa' then
          begin
          	if rCons.vCampoAd = 'APLICATIVO' then
            	rCons.vsqlAdicional := 'MSG_APLICATIVO.APLICATIVO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else if rCons.vCampoAd = 'PLATAFORMA' then
              rCons.vsqlAdicional := 'MSG_PLATAFORMA.PLATAFORMA ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else if rCons.vCampoAd = 'IDENTIFICADOR_BOT' then
              rCons.vsqlAdicional := 'MSG_PLATAFORMA.IDENTIFICADOR_BOT ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else if rCons.vCampoAd = 'TIPO' then
              rCons.vsqlAdicional := 'TIPO_CONTATO.TIPO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else if rCons.vCampoAd = 'DESCRICAO' then
              rCons.vsqlAdicional := 'MSG_ORIGEM.DESCRICAO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else
              rCons.vsqlAdicional := 'MSG_TIPO_CONTATO_ORIGEM.' + rCons.vCampoAd + ' ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd);
          end
          else
          begin
          	if rCons.vCampoAd = 'APLICATIVO' then
            	rCons.vsqlAdicional := 'MSG_APLICATIVO.APLICATIVO LIKE ' + QuotedStr(rCons.vValorAd + '%')
            else if rCons.vCampoAd = 'PLATAFORMA' then
              rCons.vsqlAdicional := 'MSG_PLATAFORMA.PLATAFORMA LIKE ' + QuotedStr(rCons.vValorAd + '%')
            else if rCons.vCampoAd = 'IDENTIFICADOR_BOT' then
              rCons.vsqlAdicional := 'MSG_PLATAFORMA.IDENTIFICADOR_BOT LIKE ' + QuotedStr(rCons.vValorAd + '%')
            else if rCons.vCampoAd = 'TIPO' then
              rCons.vsqlAdicional := 'TIPO_CONTATO.TIPO LIKE' + QuotedStr(rCons.vValorAd + '%')
            else if rCons.vCampoAd = 'DESCRICAO' then
            	rCons.vsqlAdicional := 'MSG_ORIGEM.DESCRICAO LIKE' + QuotedStr(rCons.vValorAd + '%')
            else
              rCons.vsqlAdicional := 'MSG_TIPO_CONTATO_ORIGEM.' + rCons.vCampoAd + ' LIKE' + QuotedStr(rCons.vValorAd + '%');
          end;

          Break;
        end;
      end;
    end;
  end;

  tempSql := '';

  if Trim(rCons.vValor) <> '' then                                   
    for I := 0 to dataSet.FieldCount - 1 do
      if Dataset.Fields[I].FieldKind = fkData then
        if ContainsText(dataset.Fields[I].DisplayName, rCons.vCampo) then
        begin
          rCons.vValor := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rCons.vValor);
          Break;
        end;

  if rCons.vCampo = 'Aplicativo' then
    tempSql := ' MSG_APLICATIVO.APLICATIVO '
  else if rCons.vCampo = 'Plataforma' then
    tempSql := ' MSG_PLATAFORMA.PLATAFORMA '
  else if rCons.vCampo = 'Identificador Bot' then
    tempSql := ' MSG_PLATAFORMA.IDENTIFICADOR_BOT '
  else if rCons.vCampo = 'Tipo Contato' then
    tempSql := ' TIPO_CONTATO.TIPO '
  else if rCons.vCampo = 'Origem' then
    tempSql := ' MSG_ORIGEM.DESCRICAO ';
  if tempSql  <> '' then
  begin
    if rCons.vCondicao = 'Igual' then
      tempTipo := '= '
    else if rCons.vCondicao = 'Maior' then
      tempTipo := '> '
    else if rCons.vCondicao = 'Maior ou Igual' then
      tempTipo := '>= '
    else if rCons.vCondicao = 'Menor' then
      tempTipo := '< '
    else if rCons.vCondicao = 'Menor ou Igual' then
      tempTipo := '<= '
    else if rCons.vCondicao = 'Diferente' then
      tempTipo := '<> '
    else if (rCons.vCondicao = 'Esta contido') then
      tempTipo := 'like'
    else if (rCons.vCondicao = 'Começa') then
      tempTipo := 'Começa'
    else
      tempTipo := '= ';

    if tempTipo = 'like' then
      tempSql := tempSql + tempTipo + QuotedStr('%' + rCons.vValor + '%')
    else if tempTipo = 'Começa' then
      tempSql := tempSql + 'like' + QuotedStr(rCons.vValor + '%')
    else
      tempSql := tempSql + tempTipo + QuotedStr(rCons.vValor);
    rCons.vValor := '';
    if Trim(rCons.vSqlAdicional) <> '' then
      rCons.vSqlAdicional := rCons.vSqlAdicional + ' and ' + tempSql
    else
      rCons.vSqlAdicional := tempSql;
  end;
end;

procedure TMsgTipoContatoOrigemPlataforma._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TMsgTipoContatoOrigemPlataforma._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TMsgTipoContatoOrigemPlataforma._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TAbreMsgPlataforma }

function TAbreMsgPlataforma.abreMsgPlataforma: boolean;
begin
  Result := montaSelect(' select msg_plataforma.id, ' +
  	 ' msg_plataforma.cod_empresa, ' +
    ' ((select result from strzero(coalesce(msg_plataforma.id, 0), 3)) || '' | '' || ' +
    '		trim(coalesce(msg_aplicativo.aplicativo, '''')) || '' | '' || ' +
    '		trim(coalesce(msg_plataforma.plataforma, '''')) || '' | '' || ' +
    '		trim(coalesce(identificador_bot, '''')) ' +
    ' ) plataforma from msg_plataforma ' +
    ' inner join msg_aplicativo on ' +
    '		msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
  	 ' where msg_plataforma.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and msg_plataforma.id > 0 ' +
    ' and msg_plataforma.id_msg_aplicativo > 0 ' +
    ' order by msg_plataforma.id_msg_aplicativo, msg_plataforma.plataforma, msg_plataforma.identificador_bot ');
end;

constructor TAbreMsgPlataforma.create;
begin
	dataset := TClientDataSet(dtmConfig.cdsAbreMsgPlataforma);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TAbreMsgTipoContatoOrigem }

function TAbreMsgTipoContatoOrigem.AbreMsgTipoContatoOrigem: boolean;
begin
  Result := montaSelect(' select msg_tipo_contato_origem.id, ' +
  	 ' ((select result from strzero(coalesce(msg_tipo_contato_origem.id, 0), 3)) || '' | '' || ' +
    '		trim(coalesce(tipo_contato.tipo, '''')) || '' | '' || ' +
    '		trim(coalesce(msg_origem.descricao, '''')) ' +
    ' ) tipo_contato_origem from msg_tipo_contato_origem ' +
    ' inner join msg_origem on ' +
    '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
    ' inner join tipo_contato on ' +
    '     tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato ' +
    '     and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
    ' where msg_tipo_contato_origem.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by msg_origem.descricao, tipo_contato.tipo ');
end;

constructor TAbreMsgTipoContatoOrigem.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsAbreMsgTipoContatoOrigem);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TMsgOrigemModCartas }

function TMsgOrigemModCartas.abreFormMsgOrigemModCartasLote: boolean;
begin
  InserirModCartas(frmModcartasOrigem.CheckListBoxModcartas);
  InserirOrigem(frmModcartasOrigem.CheckListBoxOrigem);

	Result := vDadosIni.abreForm('Origem por Modelo de Carta (Lote)', frmModcartasOrigem.pnOrigemModcarta, frmModcartasOrigem.tsOrigemModarta);

  if Result then
  begin
    if not PostMsgOrigemModCartasLote then
    	Exit;
  end;
end;

function TMsgOrigemModCartas.abreMsgOrigemModCartas(pCodCarta,
  pOrigem: Integer): boolean;
begin
	Result := montaSelect(' select msg_origem_modcartas.*, ' +
    	' msg_origem.descricao, ' +
      ' modcartas.descricao as modcarta, ' +
      ' msg_aplicativo.aplicativo from msg_origem_modcartas ' +
      ' left join modcartas on ' +
      '     modcartas.cod_carta = msg_origem_modcartas.cod_carta ' +
      '     and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa ' +
      ' left join msg_aplicativo on ' +
      '     msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
      ' left join msg_origem on ' +
      '     msg_origem.id = msg_origem_modcartas.id_msg_origem ' +
      ' where msg_origem_modcartas.id_msg_origem = ' + IntToStr(pOrigem) +
      ' and msg_origem_modcartas.cod_carta = ' + IntToStr(pCodCarta) +
      ' and msg_origem_modcartas.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TMsgOrigemModCartas.abreMsgOrigemModCartas: boolean;
begin
	Result := montaSelect(' select msg_origem_modcartas.*, ' +
    	' msg_origem.descricao, ' +
      ' modcartas.descricao as modcarta, ' +
      ' msg_aplicativo.aplicativo from msg_origem_modcartas ' +
      ' left join modcartas on ' +
      '     modcartas.cod_carta = msg_origem_modcartas.cod_carta ' +
      '     and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa ' +
      ' left join msg_aplicativo on ' +
      '     msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
      ' left join msg_origem on ' +
      '     msg_origem.id = msg_origem_modcartas.id_msg_origem ' +
      ' where msg_origem_modcartas.cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TMsgOrigemModCartas.cadMsgOrigemModCartas(Tipoform: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Origem por Modelo de Carta');

    vDadosIni.vTipoForm := 0;
    if dtmConfig = nil then
      dtmConfig := TdtmConfig.Create(dtmConfig);

    if not vDadosIni.PesqPros('CFG076', 'CONSULTA', '', 'MSG_ORIGEM_MODCARTAS', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmModcartasOrigem = nil then
      Application.CreateForm(TfrmModcartasOrigem, frmModcartasOrigem);

    if (TipoForm > 0) and (not frmModcartasOrigem.Visible) then
      frmModcartasOrigem.ShowModal
    else if (not frmModcartasOrigem.Visible) then
      frmModcartasOrigem.Show
    else if frmModcartasOrigem.FormStyle = fsMDIChild then
      frmModcartasOrigem.Show
    else
      frmModcartasOrigem.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TMsgOrigemModCartas.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsMsgOrigemModCartas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);

  ModCartas := TModCartas.create;
  Origem    := TMsgOrigem.create;
end;

function TMsgOrigemModCartas.Delete(pPerguntar: Boolean): boolean;
var
  vIdOrigem: string;
  vCodCarta: string;
  vOrigem: string;
  vAplicativo: string;
  vModcarta: string;
  vtemp: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  try
    vIdOrigem   := trim(dataSet.FieldByName('ID_MSG_ORIGEM').AsString);
    vCodCarta   := trim(dataSet.FieldByName('COD_CARTA').AsString);
    vOrigem     := trim(dataSet.FieldByName('DESCRICAO').AsString);
    vAplicativo := trim(dataSet.FieldByName('APLICATIVO').AsString);
    vModcarta   := trim(dataSet.FieldByName('MODCARTA').AsString);

    prepare_loop('SEL = ''S''');

    if not dataset.IsEmpty then
    begin
      vIdOrigem   := '';
      vCodCarta   := '';
      vOrigem     := '';
      vAplicativo := '';
      vModcarta   := '';
    end;
  finally
  	prepare_loop_done;
  end;

  try
  	if (trim(vIdOrigem) <> '') then
      prepare_loop('ID_MSG_ORIGEM = ' + vIdOrigem + ' AND COD_CARTA = ' + vCodCarta)
    else
    	prepare_loop('SEL = ''S''');

    vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
      'ORIGEM POR MODELO DE CARTA' + #13 +
      'Aplicativo: ' + vAplicativo + #13 +
      'Modcarta: ' + vModcarta + #13 +
      'Origem: ' + vOrigem;

    if (trim(vIdOrigem) = '') then
    	vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

    if not vDadosIni.PesqPros('CFG080', 'EXCLUIR', '', 'MSG_ORIGEM_MODCARTAS',
      vDadosIni.IfThen(trim(vIdOrigem) <> '', vIdOrigem + ' ' + vCodCarta, ''), buscas, false) then
      Exit;

    if pPerguntar then
      if Application.MessageBox(PChar(vtemp),
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        	exit;

    dataSet.First;
    while not dataSet.Eof do
  	begin
      SqlExec(' delete from msg_origem_modcartas ' +
        ' where id_msg_origem = %d ' +
        ' and cod_carta = %d ' +
        ' and cod_empresa = %d ',
        [fint('id_msg_origem'), fint('cod_carta'), fint('cod_empresa')], buscas);

      vDadosIni.GravaAuditoria('CFG080', 'EXCLUIR', '', 'MSG_ORIGEM_MODCARTAS',
      	IntToStr(fint('id_msg_origem')) + ' ' + IntToStr(fint('cod_carta')), buscas);

      dataSet.Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    prepare_loop_done;
  end;

  Result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('CFG080', 'EXCLUIR', 'SUCESSO', 'MSG_ORIGEM_MODCARTAS', '', buscas)
  else
    vDadosIni.GravaAuditoria('CFG080', 'EXCLUIR', 'FALHA', 'MSG_ORIGEM_MODCARTAS', '', buscas);

  Result := true;
  Refresh;
end;

destructor TMsgOrigemModCartas.destroy;
begin
	ModCartas.Free;
  ModCartas := nil;

  ModCartas.Free;
  ModCartas := nil;
  inherited;
end;

function TMsgOrigemModCartas.edit: boolean;
begin
	Result := False;
  if not vDadosIni.PesqPros('CFG079', 'ALTERAR', '', 'MSG_ORIGEM_MODCARTAS',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;

    ModCartas.abreModCartas(dataSet.FieldByName('cod_carta').AsInteger);
    Origem.abreOrigem;
  end;
end;

procedure TMsgOrigemModCartas.InserirModCartas(
  pCheckListBoxModcartas: TCheckListBox);
begin
	pCheckListBoxModcartas.Clear;

  buscas.Close;
  buscas.SQL.Text :=
  	 ' select modcartas.cod_carta, modcartas.cod_empresa, modcartas.tipo, modcartas.descricao, msg_aplicativo.aplicativo from modcartas ' +
  	 ' left join msg_aplicativo on ' +
    '		msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
  	 ' where modcartas.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and modcartas.tipo = ''NOT'' ' +
    ' and modcartas.ativo = 1 ' +
    ' and modcartas.tipo_contrato in (''AVISO DE VENCIMENTO'', ''CREDITOS EM ATRASO'', ''AGRADECIMENTO'') ' +
    ' union ' +
    ' select modcartas.cod_carta, modcartas.cod_empresa, modcartas.tipo, modcartas.descricao, msg_aplicativo.aplicativo from modcartas ' +
  	 ' left join msg_aplicativo on ' +
    '		msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
  	 ' where modcartas.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and modcartas.tipo = ''DOC'' ' +
    ' and modcartas.ativo = 1 ' ;
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
  	pCheckListBoxModcartas.Items.Add(
    	vDadosIni.StrZero(buscas.FieldByName('cod_carta').AsInteger, 3) + ' | ' +
      trim(buscas.FieldByName('tipo').AsString) + ' | ' +
      trim(buscas.FieldByName('descricao').AsString) + ' | ' +
      trim(buscas.FieldByName('aplicativo').AsString)
    );

    buscas.Next;
  end;
end;

procedure TMsgOrigemModCartas.InserirOrigem(pCheckListBoxOrigem: TCheckListBox);
begin
  pCheckListBoxOrigem.Clear;

  buscas.Close;
  buscas.SQL.Text := ' select id, descricao from msg_origem ';
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
		pCheckListBoxOrigem.Items.Add(
    	vDadosIni.StrZero(buscas.FieldByName('id').AsInteger, 3) + ' | ' +
      trim(buscas.FieldByName('descricao').AsString)
    );

    buscas.Next;
  end;
end;

function TMsgOrigemModCartas.Insert: boolean;
begin
	if not vDadosIni.PesqPros('CFG078', 'INCLUIR', '', 'MSG_ORIGEM_MODCARTAS',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect(' select msg_origem_modcartas.*, ' +
    	' msg_origem.descricao, ' +
      ' modcartas.descricao as modcarta, ' +
      ' msg_aplicativo.aplicativo from msg_origem_modcartas ' +
      ' left join modcartas on ' +
      '     modcartas.cod_carta = msg_origem_modcartas.cod_carta ' +
      '     and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa ' +
      ' left join msg_aplicativo on ' +
      '     msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
      ' left join msg_origem on ' +
      '     msg_origem.id = msg_origem_modcartas.id_msg_origem ' +
      ' where msg_origem_modcartas.id_msg_origem = 0 ' +
      ' and msg_origem_modcartas.cod_carta = 0 ' +
      ' and msg_origem_modcartas.cod_empresa = 0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;

    ModCartas.abreModCartas(0);
    Origem.abreOrigem;
  end;
end;

function TMsgOrigemModCartas.post: boolean;
var
  acao: string;
  codigo: integer;
  vOrigem: string;
  vCodCarta: Integer;
  vCarta: string;
  vTipo: string;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('CFG081', 'SALVAR', '', 'MSG_ORIGEM_MODCARTAS',
      dataSet.FieldByName('ID_MSG_ORIGEM').AsString + ' - ' +
      dataSet.FieldByName('COD_CARTA').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('COD_CARTA').AsInteger <= 0 then
      raiseExceptionCreate('Modelo de carta deve ser informado', 'DBLookupComboBox1');

    if trim(dataSet.FieldByName('ID_MSG_ORIGEM').AsString) = '' then
      raiseExceptionCreate('Origem deve ser informado', 'DBLookupComboBox2');

    SqlOpen(' select id, descricao from msg_origem ' +
    	' where id = %d ',
      [fint('id_msg_origem')], buscas);

    vOrigem := trim(buscas.FieldByName('descricao').AsString);

    SqlOpen(' select modcartas.cod_carta, modcartas.descricao, modcartas.tipo from modcartas ' +
    	' where modcartas.cod_carta = %d ' +
      ' and modcartas.cod_empresa = %d ',
      [fint('cod_carta'), vDadosIni.cod_empresa], buscas);

    vCodCarta := buscas.FieldByName('cod_carta').AsInteger;
    vCarta := trim(buscas.FieldByName('descricao').AsString);
    vTipo := trim(buscas.FieldByName('tipo').AsString);

    if ((trim(vTipo) = 'NOT') and (trim(vOrigem) <> 'NOTIFICACAO FINANCEIRO')) then
      raiseExceptionCreate('Modelo de carta informada do tipo NOT e origem informada deve ser do tipo "NOTIFICACAO FINANCEIRO": ' + #13 + #13 +
      	'MODELO DE CARTA' + #13 +
         'Código: ' + IntToStr(vCodCarta) + #13 +
         'Descrição: ' + trim(vCarta) + #13 +
         'Tipo: ' + trim(vTipo) + #13 + #13 +
         'ORIGEM ' + #13 +
         'Origem: ' + trim(vOrigem) + #13 + #13 +
         'Favor verificar antes de continuar', 'DBLookupComboBox1')
    else if ((trim(vTipo) = 'DOC') and (trim(vOrigem) = 'NOTIFICACAO FINANCEIRO')) then
    	raiseExceptionCreate('Modelo de carta informada do tipo DOC e origem informada deve ser diferente do tipo "NOTIFICACAO FINANCEIRO": ' + #13 + #13 +
      	'MODELO DE CARTA' + #13 +
         'Código: ' + IntToStr(vCodCarta) + #13 +
         'Descrição: ' + trim(vCarta) + #13 +
         'Tipo: ' + trim(vTipo) + #13 + #13 +
         'ORIGEM ' + #13 +
         'Origem: ' + trim(vOrigem) + #13 + #13 +
         'Favor verificar antes de continuar', 'DBLookupComboBox1');

    if acao = 'INSERIR' then
    begin
      SqlOpen(' select msg_origem_modcartas.*, ' +
        ' msg_origem.descricao, ' +
        ' modcartas.descricao as modcarta, ' +
        ' msg_aplicativo.aplicativo from msg_origem_modcartas ' +
        ' inner join modcartas on ' +
        '     modcartas.cod_carta = msg_origem_modcartas.cod_carta ' +
        '     and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa ' +
      	'	inner join msg_aplicativo on ' +
        '		msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
        ' inner join msg_origem on ' +
        '     msg_origem.id = msg_origem_modcartas.id_msg_origem ' +
        ' where msg_origem_modcartas.id_msg_origem = %d ' +
        ' and msg_origem_modcartas.cod_carta = %d ' +
        ' and msg_origem_modcartas.cod_empresa = %d ',
        [fint('id_msg_origem'), fint('cod_carta'), fint('cod_empresa')], buscas);

      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe registro para essa Origem e Modelo de Carta:' + #13 + #13 +
          'Aplicativo: ' + trim(buscas.FieldByName('aplicativo').AsString) + #13 +
          'Modelo de Carta: ' + trim(buscas.FieldByName('modcarta').AsString) + #13 +
          'Origem: ' + trim(buscas.FieldByName('descricao').AsString), 'DBLookupComboBox1');

      SqlOpen(' select msg_origem_modcartas.*, ' +
      	' msg_origem.descricao, ' +
        ' modcartas.descricao as modcarta, ' +
        ' msg_aplicativo.aplicativo from msg_origem_modcartas ' +
        ' inner join modcartas on ' +
        '     modcartas.cod_carta = msg_origem_modcartas.cod_carta ' +
        '     and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa ' +
        ' inner join msg_aplicativo on ' +
        '     msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
        ' inner join msg_origem on ' +
        '     msg_origem.id = msg_origem_modcartas.id_msg_origem ' +
        ' where msg_origem_modcartas.id_msg_origem = %d ' +
        ' and msg_origem_modcartas.cod_carta <> %d ' +
        ' and msg_origem_modcartas.cod_empresa = %d ' +
        ' and modcartas.id_msg_aplicativo in (select modcartas.id_msg_aplicativo from modcartas ' +
        '                                     where modcartas.cod_carta = %d ' +
        '                                     and modcartas.cod_empresa = %d) ' +
        ' and modcartas.doc in (select ''Q'' from rdb$database ' +
        '												union all ' +
        '                       select modcartas.doc from modcartas ' +
        '                       where modcartas.cod_carta = %d ' +
        '                       and modcartas.cod_empresa = %d) ',
        [fint('id_msg_origem'), fint('cod_carta'), fint('cod_empresa'),
         fint('cod_carta'), fint('cod_empresa'),
         fint('cod_carta'), fint('cod_empresa')], buscas);

      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe registro para essa Origem e Aplicativo:' + #13 + #13 +
          'Aplicativo: ' + trim(buscas.FieldByName('aplicativo').AsString) + #13 +
          'Modelo de Carta: ' + trim(buscas.FieldByName('modcarta').AsString) + #13 +
          'Origem: ' + trim(buscas.FieldByName('descricao').AsString), 'DBLookupComboBox1');
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('CFG081', acao, 'SUCESSO', 'MSG_ORIGEM_MODCARTAS',
        dataSet.FieldByName('ID_MSG_ORIGEM').AsString + ' - ' +
      	dataSet.FieldByName('COD_CARTA').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('CFG081', acao, 'FALHA', 'MSG_ORIGEM_MODCARTAS',
        dataSet.FieldByName('ID_MSG_ORIGEM').AsString + ' - ' +
      	dataSet.FieldByName('COD_CARTA').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TMsgOrigemModCartas.PostMsgOrigemModCartasLote: boolean;
var
	I, J: Integer;
  vCodCarta: Integer;
  vCodOrigem: Integer;
  vSel: boolean;
	vSql: string;
begin
	Result := False;
  vSel := False;

  vSql := dataSet.CommandText;

  for I := 0 to frmModcartasOrigem.CheckListBoxModcartas.Count - 1 do
  begin
    if frmModcartasOrigem.CheckListBoxModcartas.Checked[I] then
    begin
    	vCodCarta := StrToInt(Copy(frmModcartasOrigem.CheckListBoxModcartas.Items[i], 1, Pos(' | ', frmModcartasOrigem.CheckListBoxModcartas.Items[i]) - 1));

      for J := 0 to frmModcartasOrigem.CheckListBoxOrigem.Count - 1 do
      begin
        if frmModcartasOrigem.CheckListBoxOrigem.Checked[J] then
        begin
        	vCodOrigem  := StrToInt(Copy(frmModcartasOrigem.CheckListBoxOrigem.Items[j], 1, Pos(' | ', frmModcartasOrigem.CheckListBoxOrigem.Items[j]) - 1));

        	vSel := True;

          abreMsgOrigemModCartas(
            vCodCarta,
            vCodOrigem);

          if dataSet.IsEmpty then
          begin
            if not Insert then
              Exit;

            dataSet.FieldByName('COD_CARTA').AsInteger     := vCodCarta;
            dataSet.FieldByName('ID_MSG_ORIGEM').AsInteger := vCodOrigem;

            if not Post then
              Exit;
          end;
        end;
      end;
    end;
  end;

  Result := vSel;

  if (Result) and (trim(vSql) <> '') then
  	montaSelect(vSql);
end;

function TMsgOrigemModCartas._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
begin
  result := true;
  rCons.vSqlAdicional := '';
  rCons.vValor   := Trim(rCons.vValor);
  rCons.vValorAd := Trim(rCons.vValorAd);

  if rCons.vAdicional then
  begin
    if rCons.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDate(rCons.vDataIniAd);
      except
        rCons.vDataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rCons.vDataFimAd);
      except
        rCons.vDataFimAd := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
          'Atenção', MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
          formatodata := 'mm/dd/yyyy'
        else if pos('.', ShortDateFormat) <> 0 then
          formatodata := 'dd.mm.yyyy';
        if rCons.vDataIniAd <> '' then
          rCons.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCons.vDataIniAd)));
        if rCons.vDataFimAd <> '' then
          rCons.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCons.vDataFimAd)));
      end;
    end
    else if rCons.vValorAd = '' then
      exit;
    if rCons.vCondicaoAd = 'Igual' then
      rCons.vCondicaoAd := '='
    else if rCons.vCondicaoAd = 'Maior' then
      rCons.vCondicaoAd := '>'
    else if rCons.vCondicaoAd = 'Maior ou Igual' then
      rCons.vCondicaoAd := '>='
    else if rCons.vCondicaoAd = 'Menor' then
      rCons.vCondicaoAd := '<'
    else if rCons.vCondicaoAd = 'Menor ou Igual' then
      rCons.vCondicaoAd := '<='
    else if rCons.vCondicaoAd = 'Diferente' then
      rCons.vCondicaoAd := '<>'
    else if (rCons.vCondicaoAd = 'Esta contido') then
      rCons.vCondicaoAd := 'like'
    else if (rCons.vCondicaoAd = 'Começa') then
      rCons.vCondicaoAd := 'Começa'
    else
      rCons.vCondicaoAd := '=';
    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rCons.vCampoAd) then
        begin
          rCons.vValorAd := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rCons.vValorAd);
//          if rCons.vCampo = rCons.vCampoAd then
//          begin
//            rCons.vsqlAdicional := '';
//            exit;
//          end;
          rCons.vCampoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rCons.vCondicaoAd = 'Começa') or (rCons.vCondicaoAd = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rCons.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end
            else if ((Dataset.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField))
              then
            try
              strtofloat(rCons.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rCons.vCondicaoAd := '=';
            rCons.vValorAd := vDadosIni.trocaVirgulaPorPonto(rCons.vValorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if (rCons.vDataIniAd <> '') and (rCons.vDataFimAd <> '') then
              rCons.vSqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' >= ' + rCons.vDataIniAd + ' and ' + rCons.vCampoAd + ' <= ' + rCons.vDataFimAd
            else if (rCons.vDataFimAd <> '') then
              rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' <= ' + rCons.vDataIniAd
            else if (rCons.vDataIniAd <> '') and (rCons.vDataFimAd <> '') then
              rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
                ' >= ' + rCons.vDataIniAd;
            Break;
          end;
          if rCons.vCondicaoAd = 'like' then
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
              ' like ' + QuotedStr('%' +
              rCons.vValorAd +
              '%')
          else if rCons.vCondicaoAd = 'Começa' then
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd +
              ' like ' +
              QuotedStr(rCons.vValorAd + '%')
          else
            rCons.vsqlAdicional := rCons.vsqlAdicional + rCons.vCampoAd + ' '
              + rCons.vCondicaoAd + ' ' +
              QuotedStr(rCons.vValorAd);

          if rCons.vCondicaoAd <> 'Começa' then
          begin
            if rCons.vCampoAd = 'DESCRICAO' then
              rCons.vsqlAdicional := ' MSG_ORIGEM.DESCRICAO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else if rCons.vCampoAd = 'MODCARTA' then
              rCons.vsqlAdicional := 'MODCARTAS.DESCRICAO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else if rCons.vCampoAd = 'APLICATIVO' then
              rCons.vsqlAdicional := 'MSG_APLICATIVO.APLICATIVO ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd)
            else
              rCons.vsqlAdicional := 'MSG_ORIGEM_MODCARTAS.' + rCons.vCampoAd + ' ' + rCons.vCondicaoAd + ' ' + QuotedStr(rCons.vValorAd);
          end
          else
          begin
            if rCons.vCampoAd = 'DESCRICAO' then
              rCons.vsqlAdicional := ' MSG_ORIGEM.DESCRICAO LIKE ' + QuotedStr(rCons.vValorAd + '%')
            else if rCons.vCampoAd = 'MODCARTA' then
              rCons.vsqlAdicional := 'MODCARTAS.DESCRICAO LIKE' + QuotedStr(rCons.vValorAd + '%')
            else if rCons.vCampoAd = 'APLICATIVO' then
              rCons.vsqlAdicional := 'MSG_APLICATIVO.APLICATIVO LIKE' + QuotedStr(rCons.vValorAd + '%')
            else
              rCons.vsqlAdicional := 'MSG_ORIGEM_MODCARTAS.' + rCons.vCampoAd + ' LIKE' + QuotedStr(rCons.vValorAd + '%');
          end;

          Break;
        end;
      end;
    end;
  end;

  tempSql := '';

  if Trim(rCons.vValor) <> '' then
    for I := 0 to dataSet.FieldCount - 1 do
      if Dataset.Fields[I].FieldKind = fkData then
        if ContainsText(dataset.Fields[I].DisplayName, rCons.vCampo) then
        begin
          rCons.vValor := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rCons.vValor);
          Break;
        end;

  if rCons.vCampo = 'Origem' then
    tempSql := ' MSG_ORIGEM.DESCRICAO '
  else if rCons.vCampo = 'Modcarta' then
    tempSql := ' MODCARTAS.DESCRICAO '
  else if rCons.vCampo = 'Aplicativo' then
  	tempSql := ' MSG_APLICATIVO.APLICATIVO ';
  if tempSql  <> '' then
  begin
    if rCons.vCondicao = 'Igual' then
      tempTipo := '= '
    else if rCons.vCondicao = 'Maior' then
      tempTipo := '> '
    else if rCons.vCondicao = 'Maior ou Igual' then
      tempTipo := '>= '
    else if rCons.vCondicao = 'Menor' then
      tempTipo := '< '
    else if rCons.vCondicao = 'Menor ou Igual' then
      tempTipo := '<= '
    else if rCons.vCondicao = 'Diferente' then
      tempTipo := '<> '
    else if (rCons.vCondicao = 'Esta contido') then
      tempTipo := 'like'
    else if (rCons.vCondicao = 'Começa') then
      tempTipo := 'Começa'
    else
      tempTipo := '= ';

    if tempTipo = 'like' then
      tempSql := tempSql + tempTipo + QuotedStr('%' + rCons.vValor + '%')
    else if tempTipo = 'Começa' then
      tempSql := tempSql + 'like' + QuotedStr(rCons.vValor + '%')
    else
      tempSql := tempSql + tempTipo + QuotedStr(rCons.vValor);
    rCons.vValor := '';
    if Trim(rCons.vSqlAdicional) <> '' then
      rCons.vSqlAdicional := rCons.vSqlAdicional + ' and ' + tempSql
    else
      rCons.vSqlAdicional := tempSql;
  end;
end;

procedure TMsgOrigemModCartas._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TMsgOrigemModCartas._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TMsgOrigemModCartas._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TModCartas }

function TModCartas.abreModCartas(pCodCarta: Integer): boolean;
begin
  Result := montaSelect(
  	 ' select ' +
  	 ' modcartas.cod_carta, ' +
    ' modcartas.descricao, ' +
    ' ((select result from strzero(coalesce(modcartas.cod_carta, 0), 3)) || '' | '' || trim(coalesce(modcartas.descricao, '''')) || '' | '' || trim(coalesce(msg_aplicativo.aplicativo, ''''))) modcartas from modcartas ' +
    ' left join msg_aplicativo on ' +
    '		msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
  	 ' where modcartas.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and modcartas.tipo = ''NOT'' ' +
    ' and modcartas.ativo = 1 ' +
    ' and modcartas.tipo_contrato in (''AVISO DE VENCIMENTO'', ''CREDITOS EM ATRASO'', ''AGRADECIMENTO'') ' +
    ' union ' +
    ' select ' +
  	 ' modcartas.cod_carta, ' +
    ' modcartas.descricao, ' +
    ' ((select result from strzero(coalesce(modcartas.cod_carta, 0), 3)) || '' | '' || trim(coalesce(modcartas.descricao, '''')) || '' | '' || trim(coalesce(msg_aplicativo.aplicativo, ''''))) modcartas from modcartas ' +
    ' left join msg_aplicativo on ' +
    '		msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
  	 ' where modcartas.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and modcartas.tipo = ''DOC'' ' +
    ' and modcartas.ativo = 1 ' +
    vDadosIni.IfThen(pCodCarta > 0,
      ' union ' +
      ' select ' +
      ' modcartas.cod_carta, ' +
      ' modcartas.descricao, ' +
      ' ((select result from strzero(coalesce(modcartas.cod_carta, 0), 3)) || '' | '' || trim(coalesce(modcartas.descricao, '''')) || '' | '' || trim(coalesce(msg_aplicativo.aplicativo, ''''))) modcartas from modcartas ' +
      ' left join msg_aplicativo on ' +
      '		msg_aplicativo.id = modcartas.id_msg_aplicativo ' +
      ' where modcartas.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and modcartas.cod_carta = ' + IntToStr(pCodCarta), '') +
    ' order by 2 ');
end;

constructor TModCartas.create;
begin
	dataset := TClientDataSet(dtmConfig.cdsModcartas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TConfigAPIcondpag }

function TConfigAPIcondpag.abreCondPag: boolean;
begin
   Result := montaSelect(' SELECT COND_PAG.COD_COND_PAG, COND_PAG.DESC_COND_PAG FROM COND_PAG ' +
	' WHERE COND_PAG.ATIVO = 1 ' +
   ' ORDER BY COND_PAG.DESC_COND_PAG ');
end;

constructor TConfigAPIcondpag.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsConfigAPIcondpag);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

{ TConfigAPIcollectionsRag }

function TConfigAPIcollectionsRag.abreCollectionsRag: boolean;
begin
  Result := montaSelect(' select * from collections_rag_hc ' +
    ' where collections_rag_hc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by collections_rag_hc.collection_rag ');
end;

constructor TConfigAPIcollectionsRag.create;
begin
  dataset := TClientDataSet(dtmConfig.cdsCollectionsRag);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
end;

function TConfigAPIcollectionsRag.Delete: boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  result := inherited Delete;
  if Result then
    result := Apply;
end;

function TConfigAPIcollectionsRag.Insert: boolean;
begin
  Result := inherited Insert;

  if Result then
    dataSet.FieldByName('COD_EMPRESA').AsInteger := vDadosIni.cod_empresa;
end;

function TConfigAPIcollectionsRag.post: boolean;
begin
  try
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if trim(dataSet.FieldByName('COLLECTION_RAG').AsString) = '' then
      raiseExceptionCreate('Collection não informado.', 'DBEditCollectionRag');

    SqlOpen(' select * from collections_rag_hc ' +
    	' where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and collection_rag = ' + QuotedStr(trim(dataSet.FieldByName('COLLECTION_RAG').AsString)));

    if not buscas.IsEmpty then
      raiseExceptionCreate('Collection já adicionada.', 'DBEditCollectionRag');

    inherited Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

  except on E: Exception do
    begin
      Result := False;
       Application.MessageBox(PChar(e.Message), 'Erro', MB_OK + MB_ICONASTERISK);
      registraErro(e.Message);
    end;
  end;
end;

end.
