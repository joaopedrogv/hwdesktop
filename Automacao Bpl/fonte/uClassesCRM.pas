unit uClassesCRM;

interface

uses
  uDataSet_OOP, DBClient, DB, IBDatabase, IBQuery, Controls;

type
  TCRM = class;
  TColaborador_Ag_Red = class;
  TColaborador_Ag = class;
  TTipo_Ag = class;
  TTipo_Ag_ContatoInicial = class;
  TTipo_Ag_Finalizacao = class;
  TCliente_Ag = class;
  TAgenda = class;
  TDev = class;
  TDevReq = class;
  TPromocaoProdutosCRM = class;
  TFichaAcompanhamento = class;
  TItensFichaAcompanhamento = class;
  TFinancaCred = class;
  TFinancaCh = class;
  TFinancaRec = class;
  TVendasPerdidas = class;
  TCurvaABCCliente = class;
  TItensOrcamentosCli = class;
  TOrcamentosCli = class;
  TSugestaoServicosCli = class;
  TSugestaoServicos = class;

  RClassesCli = record
    vCLQTDCOMPRA, vCLQTDVEICULO, vCLSOMACOMPRA, vCLSOMAVEICULO, vCLULTIMACOMPRA, vCLULTIMOVEICULO,
      vCLATRASOCOMPRA, vCLLUCROCLIENTE, vCLLUCROVEICULO: string;
    vTipoCliP,vTipoCliV,vTipoCliS:boolean;  
  end;

  TCRM = class(TDataSet_OOP)
  protected
    Fdatainicial: Tdate;
    Fdatafinal: Tdate;
    FdataBanco : Tdate;
    FFiltrarData:boolean;
    FTodasEmpresas:boolean;
  public
    constructor create;
    destructor destroy; override;
    function _validarData(pDataI,pDataF: string) : boolean;
    property datainicial: Tdate read Fdatainicial write Fdatainicial;
    property datafinal: TDate read Fdatafinal write Fdatafinal;
    property databanco: TDate read FdataBanco write FdataBanco;
    property FiltrarData: boolean read FFiltrarData write FFiltrarData;
    property TodasEmpresas: boolean read FTodasEmpresas write FTodasEmpresas;
    function _retornaCodClientes(pCPFCNPJ: string) : string;
  var
    obDev: TDev;
    obDevReq: TDevReq;
    obPromProd: TPromocaoProdutosCRM;
    obFichaAcomp : TFichaAcompanhamento;
    obVp : TVendasPerdidas;
    obCliCurvaABC : TCurvaABCCliente;
    obOrcamentoCli : TOrcamentosCli;
    obSugeServ : TSugestaoServicos;
    obSugeServCli: TSugestaoServicosCli;
    obFinancaCred : TFinancaCred;
    obFinancaCh : TFinancaCh;
    obFinancaRec : TFinancaRec;
  end;

  TPromocaoProdutosCRM = class(TDataSet_OOP)
  private
    fDIAS_BASE_CONSULTA: Integer;
    fQTDE_MAX_REGISTROS: Integer;
    fCOD_CLIENTE: Integer;
    fORDEM_QTDE: Boolean;

    fDtSetTmp: TClientDataSet;
    fBuscasEst: TIBQuery;
    procedure _ProdutosAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    function _abrePromocoesParaCliente : Boolean;
    procedure _selecionarItensParaVenda;

    property DIAS_BASE_CONSULTA: Integer read fDIAS_BASE_CONSULTA write fDIAS_BASE_CONSULTA;
    property QTDE_MAX_REGISTROS: Integer read fQTDE_MAX_REGISTROS write fQTDE_MAX_REGISTROS;
    property COD_CLIENTE: Integer read fCOD_CLIENTE write fCOD_CLIENTE;
    property ORDEM_QTDE: Boolean read fORDEM_QTDE write fORDEM_QTDE;
  end;

  TColaborador_Ag_Red = class(TDataSet_OOP)
  public
    constructor create;
    function _abreColaborador(pCOD_VENDEDOR: Integer): Boolean;
  end;

  TColaborador_Ag = class(TDataSet_OOP)
  public
    constructor create;
    function _abreColaborador(pCOD_VENDEDOR: Integer): Boolean; overload;
    function _abreColaborador: Boolean; overload;
  end;

  TTipo_Ag = class(TDataSet_OOP)
  protected
    fTIPO: string;
    fExec: TIBQuery;
  public
    function _abreTipoAgendamento: Boolean;
    function _addTipoAgendamento: Boolean;
    procedure _verificaTipoAgendamento;
  end;

  TTipo_Ag_ContatoInicial = class(TTipo_Ag)
  public
    constructor create;
  end;

  TTipo_Ag_Finalizacao = class(TTipo_Ag)
  public
    constructor create;
  end;

  TTipo_Ag_Ambos = class(TTipo_Ag)
  public
    constructor create;
    function delete: Boolean; override;
    function post: Boolean; override;
  end;

  TCliente_Ag = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaCliente(pCOD_CLIENTE: Integer): Boolean;
    procedure _clienteNaoAceitaContato;
  end;

  TAgenda = class(TDataSet_OOP)
  private
    fTextoReagendamento: string;
    procedure _AfterScrollAgenda(DataSet: TDataSet);
    procedure _BeforeScrollAgenda(DataSet: TDataSet);
    procedure _AfterCloseAgenda(DataSet: TDataSet);
    procedure _AfterScrollColabR(DataSet: TDataSet);
  public
    constructor create;
    destructor Destroy; override;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _validaCliente: Boolean;
    function _abreAgendaDoDia: Boolean;
    function _abreAgendaCliente: Boolean;
    function _abreAgendaColaborador(pCOD_VENDEDOR: Integer): Boolean;
    function _abreAgendaAnterior: Boolean;
    function _abreAgendaProxima: Boolean;
    function _finalizarAgendamento: Boolean; overload;
    function _finalizarAgendamento(pTIPO_VENDA: string): Boolean; overload;
    function _reagendar(pUsarData: Boolean = False): Boolean;
    function _removerCarteiraDeClientesSemCompras: Boolean;
    function _agendarAutomaticamenteAtendimentos: Boolean;

    function _validaTrocaColaborador: Boolean;
    function _moverAgendamentoColaborador(pCOD_VENDEDOR: Integer = 0): Boolean;
    function _moverAllAgendamentosColaborador: Boolean;
    function _moverAllAgendamentoEntreColaboradores: Boolean;
    function _confirmarAgendamentosRedistribuidos: Boolean;

    function cadAgenda(pCOD_CLIENTE: Integer = 0): Boolean;
    function _abreFormReagendamento: Boolean;  // reagendamento no fechamento do contato do cliente

  var
    vDtAgendamento: TDate;
    vCodUltCliente: Integer;
    vDtSetTmp: TClientDataSet;
    vClA: TCliente_Ag;
    vTpA_C: TTipo_Ag;
    vTpA_F: TTipo_Ag;
    vTpA_A: TTipo_Ag;
    vCol: TColaborador_Ag;
    vColR: TColaborador_Ag_Red;
    vPromProd: TPromocaoProdutosCRM;
  end;

  TDev = class(TCRM)
  public
    constructor create;
    function _abreDev(pDataI,pDataF:string;pCodCli:integer) : Boolean;
  var
    vValorTotal, vQuantTotal: Real;
  end;

  TDevReq = class(TCRM)
  public
    constructor create;
    function _abreDevReq(pDataI,pDataF:string;pCodCli:integer) : Boolean;
  var
  end;

  TFichaAcompanhamento = class(TCRM)
  private
    procedure _FichaAcompanhamentoAfterScroll(DataSet: TDataSet);
  protected
//    fdsCred, fdsCH, fdsRecidos: TdataSource;
//    fqueryCred,fqueryCH,fqueryRecibo : TIBQuery;
  public
    constructor create;
    destructor destroy; override;
    function _abreFichaAcompanhamento(pDataI,pDataF,pCPFCNPJ: string;pAbrirVazio:boolean=false) : Boolean;
//    function _abreCreditos(pCPFCNPJ: string) : Boolean;
//    function _abreCH(pCPFCNPJ: string) : Boolean;
//    function _abreRecibos(pCPFCNPJ: string) : Boolean;
    function _retornaCodClientes(pCPFCNPJ: string) : string;
//    property dsCred: TDataSource read fdsCred write fdsCred;
//    property dsCH: TDataSource read fdsCH write fdsCH;
//    property dsRecidos: TDataSource read fdsRecidos write fdsRecidos;
//    property queryCred: TIBQuery read fqueryCred write fqueryCred;
//    property queryCH: TIBQuery read fqueryCH write fqueryCH;
//    property queryRecibo: TIBQuery read fqueryRecibo write fqueryRecibo;
    function _existePesquisa(pCodigo:integer; pTipoPesquisa:string) : boolean;
    function AbrirFolhaVerificacaoCliente: boolean;
  var
    obItensFichaAcomp : TItensFichaAcompanhamento;
//    obFichaCred: TFichaCred;
//    obFichaCh: TFichaCh;
//    obFichaRec: TFichaRec;
  end;

  TItensFichaAcompanhamento = class(TCRM)
  public
    constructor create;
    function _abreItensFichaAcompanhamento(pDataI,pDataF,pCPFCNPJ: string) : Boolean;overload;
  var

  end;

  TFinancaCred = class(TCRM)
  public
    constructor create;
    function _abreCreditos(pCPFCNPJ: string) : Boolean;
  var

  end;
  TFinancaCh = class(TCRM)
  public
    constructor create;
    function _abreCH(pCPFCNPJ: string) : Boolean;
  var

  end;
  TFinancaRec = class(TCRM)
  public
    constructor create;
    function _abreRecibos(pCPFCNPJ: string) : Boolean;
  var

  end;


  TVendasPerdidas = class(TCRM)
  private
  protected
    fdsVP: TdataSource;
    fqueryCred,fqueryCH,fqueryRecibo : TIBQuery;
  public
    constructor create;
    destructor destroy; override;
    function _abrirVendasPerdidas(pCodCli:integer;pDataI,pDataF: string) :boolean;
  var
  end;

  TCurvaABCCliente = class(TCRM)
  private
  protected
//    fdsVP: TdataSource;
//    fqueryCred,fqueryCH,fqueryRecibo : TIBQuery;
  public
    constructor create;
    destructor destroy; override;
    function _abrirClientesCurvaABC(pCodCli:integer) :boolean;
    function _montarRankingCliente(pCLQTDCOMPRA,pCLSOMACOMPRA,pCLULTIMACOMPRA,
      pCLATRASOCOMPRA,pCLLUCROCLIENTE,pNomeCli:string;
      pTipoCliP: boolean=false;pTipoCliV: boolean=false;
      pTipoCliS : boolean=false;pJuncaoTipoCli_E: boolean=false;
      pPessoaFisica: boolean=false;pPessoaJuridica: boolean=false) :boolean;
  var
    vClCli: RClassesCli;
  end;

  TOrcamentosCli = class(TCRM)
  private
    procedure _OrcamentosCliAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    destructor destroy; override;
    function _abreOrcamentosCli(pCodCli:Integer) : Boolean;
  var
    obItensOrcamentosCli : TItensOrcamentosCli;
  end;

  TItensOrcamentosCli = class(TCRM)
  public
    constructor create;
    function _abreItensOrcamentosCli(pCodCli: integer) : Boolean;
  var

  end;

  TSugestaoServicosCli = class(TCRM)
  public
	  constructor create;
    function _abreSugestaoServicosCli(pDataI, pDataF: string; pCodCli: integer) : Boolean;
  var

  end;

  TSugestaoServicos = class(TCRM)
  private
  protected
    fDtSet,fDtSetV: TClientDataSet;
    fdsSugeServ,fdsSugeServVeic :TDataSource;
    fCLQTDCOMPRA,fCLSOMACOMPRA,fCLULTIMACOMPRA,fCLATRASOCOMPRA,fCLLUCROCLIENTE : string;
    fNec_acomp,fExcecaoData :boolean;
    vBuscas1,vBuscas2,vBuscas3,vBuscas4,vBuscas5,vBuscas6:TIBQuery;
  public
    constructor create;
    destructor destroy; override;
    function _abrirSugestaoServ(pVazio:boolean=true) :boolean;
    function _sugerirServico(pCLQTDCOMPRA,pCLSOMACOMPRA,pCLULTIMACOMPRA,
      pCLATRASOCOMPRA,pCLLUCROCLIENTE,pNomeCli:string;
      pTipoCliP: boolean=false;pTipoCliV: boolean=false;
      pTipoCliS : boolean=false;pJuncaoTipoCli_E: boolean=false;
      pPessoaFisica: boolean=false;pPessoaJuridica: boolean=false;
      pVeiculo: boolean=false;pNec_acomp: boolean=false) :boolean;
    procedure filtrarServicoSug(pDataIni,pDataFim:string);
    property CLQTDCOMPRA: string read fCLQTDCOMPRA write fCLQTDCOMPRA;
    property CLSOMACOMPRA: string read fCLSOMACOMPRA write fCLSOMACOMPRA;
    property CLULTIMACOMPRA: string read fCLULTIMACOMPRA write fCLULTIMACOMPRA;
    property CLATRASOCOMPRA: string read fCLATRASOCOMPRA write fCLATRASOCOMPRA;
    property CLLUCROCLIENTE: string read fCLLUCROCLIENTE write fCLLUCROCLIENTE;
    property Nec_acomp: boolean read fNec_acomp write fNec_acomp;
    property excecaoData: boolean read fExcecaoData write fExcecaoData;
    property dsSugeServ: TDataSource read fdsSugeServ write fdsSugeServ;
    property dsSugeServVeic: TDataSource read fdsSugeServVeic write fdsSugeServVeic;
    property DtSet: TClientDataSet read fDtSet write fDtSet;
    property DtSetV: TClientDataSet read fDtSetV write fDtSetV;
  var
    vClassesCL: RClassesCli;
  end;

var
  agenda : TAgenda;
  obCRM : TCRM;

implementation

uses
  uDtmCRM, SysUtils, uDtmAtivo, uDadosIni, Dialogs, Forms, uAgendamentos,
  Windows, funcoes, uPadrao, Variants, Classes, IBCustomDataSet;

{ TCliente_Ag }

constructor TCliente_Ag.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsClA);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  transacao := TIBTransaction(dtmCRM.transacao);
end;

procedure TCliente_Ag._clienteNaoAceitaContato;
begin
  if not buscas.Transaction.InTransaction then
    buscas.Transaction.StartTransaction;

  buscas.Close;
  buscas.SQL.Text := 'update clientes set ACEITA_CONTATO_TLV = ''N''' +
    ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ExecSQL;

  if buscas.Transaction.InTransaction then
    buscas.Transaction.Commit;
end;

function TCliente_Ag._selecionaCliente(pCOD_CLIENTE: Integer): Boolean;
begin
  Result := montaSelect('select c.cod_cliente, c.nome_cliente, c.razao, c.cpfcgc, c.fone_cliente, c.ramal,' +
    ' tc.descricao_tipo, tf.desc_fat, tf.status_f, c.endereco||' +
    ' case when coalesce(rtrim(c.num_end_cliente),'''') = '''' then '''' else '', ''||rtrim(c.num_end_cliente) end||' +
    ' case when coalesce(rtrim(c.complemento),'''') = '''' then '''' else '', ''||rtrim(c.complemento) end||' +
    ' '' - ''||rtrim(c.bairro)||'', ''||rtrim(c.cidade)||'' - ''||rtrim(e.sigla_uf) endereco,' +
    ' c.email, cp.desc_cond_pag, c.tipvcliente, c.contato, c.tel_res_cf, c.fax, c.dias_acomp,' +
    ' c.clqtdcompra, c.clsomacompra, c.clultimacompra, c.cllucrocliente, c.clatrasocompra,' +
    ' c.clqtdveiculo, c.clsomaveiculo, c.clultimoveiculo, c.cllucroveiculo, c. data_ultimo_contato,' +
    ' c.aceita_contato_tlv, c.dias_contato_tlv, c.mediafrequencia, c.cod_vendedor' +
    ' from clientes c' +
    ' left join tipos_clientes tc on tc.codigo_tipo = c.codigo_tipo' +
    ' left join tipo_faturamento tf on tf.codigo_faturamento = c.codigo_faturamento' +
    ' left join estados e on e.codigo_uf = c.codigo_uf' +
    ' left join cond_pag cp on cp.cod_cond_pag = c.cod_cond_pag' +
    ' where c.cod_cliente = ' + IntToStr(pCOD_CLIENTE) + ' and c.cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TAgenda }

function TAgenda.cadAgenda(pCOD_CLIENTE: Integer = 0): Boolean;
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Agenda');
  try
    if dtmCRM = nil then
      dtmCRM := TdtmCRM.Create(dtmCRM);

    if pCOD_CLIENTE > 0 then
    begin
      if not vDadosIni.PesqPros('CRM002', 'CONSULTA', '', 'AGENDAMENTO', '',
        dtmCRM.qrBuscas, True) then
        Exit;
    end
    else if not vDadosIni.PesqPros('CRM001', 'CONSULTA', '', 'AGENDAMENTO', '',
      dtmCRM.qrBuscas, True) then
      Exit;

    if frmAgendamentos = nil then
      Application.CreateForm(TfrmAgendamentos, frmAgendamentos);

    FrmAgendamentos.Tag := pCOD_CLIENTE;
    frmAgendamentos.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TAgenda.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsAgenda);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  transacao := TIBTransaction(dtmCRM.transacao);
  vDtSetTmp := TClientDataSet(dtmCRM.cdsAgenda2);

  vClA := TCliente_Ag.create;
  vTpA_C := TTipo_Ag_ContatoInicial.create;
  vTpA_F := TTipo_Ag_Finalizacao.create;
  vTpA_A := TTipo_Ag_Ambos.create;
  vCol := TColaborador_Ag.create;
  vColR := TColaborador_Ag_Red.create;
  vPromProd := TPromocaoProdutosCRM.create;

  dataSet.AfterScroll := _AfterScrollAgenda;
  dataSet.BeforeScroll := _BeforeScrollAgenda;
  dataSet.AfterClose := _AfterCloseAgenda;

  if vDtSetTmp.Tag = 0 then
    try
      vDtSetTmp.CreateDataSet;
      vDtSetTmp.Tag := 22;
    except
    end;
end;

function TAgenda.delete: Boolean;
var
  vCodTemp: Integer;
begin
  Result := False;

  if Trim(dataSet.FieldByName('status').AsString) <> '' then
    raiseExceptionCreate('Agendamento já finalizado, não pode ser excluído', '');

  if not vDadosIni.PesqPros('CRM007', 'EXCLUIR', '', 'AGENDAMENTO', dataSet.FieldByName('COD_AGENDAMENTO').AsString,
    buscas, True) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'delete from agendamento' +
    ' where cod_agendamento = ' + IntToStr(dataSet.FieldByName('cod_agendamento').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ExecSQL;

  if CommitaTransacao then
    dataSet.Refresh;
end;

destructor TAgenda.Destroy;
begin
  vClA.Free;
  vClA := nil;
  vTpA_C.Free;
  vTpA_C := nil;
  vTpA_F.Free;
  vTpA_F := nil;
  vCol.Free;
  vCol := nil;
  vColR.Free;
  vColR := nil;
  vTpA_A.Free;
  vTpA_A := nil;
  vPromProd.Free;
  vPromProd := nil;
  inherited;
end;

function TAgenda.edit: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM006', 'ALTERAR', '', 'AGENDAMENTO', dataSet.FieldByName('COD_AGENDAMENTO').AsString,
    buscas, True) then
    Exit;

  if inherited Edit then
  begin
    vTpA_C._abreTipoAgendamento;
    dataSet.FieldByName('cod_vendedor').AsInteger := vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    Result := True;
  end;
end;

function TAgenda.insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM005', 'INCLUIR', '', 'AGENDAMENTO', '',
    buscas, True) then
    Exit;

  if inherited insert then
  begin
    dataSet.FieldByName('cod_cliente').AsInteger := vClA.dataSet.FieldByName('cod_cliente').AsInteger;
    dataSet.FieldByName('cod_vendedor').AsInteger := vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    vTpA_C._abreTipoAgendamento;
    Result := True;
  end;
end;

function TAgenda.post: Boolean;
var
  acao: string;
  vdtAtual: TDateTime;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM008', 'SALVAR', '', 'AGENDAMENTO', dataSet.FieldByName('COD_AGENDAMENTO').AsString, buscas, True) then
    Exit;

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

    if dataSet.FieldByName('COD_CONTATO').AsInteger = 0 then
      raiseExceptionCreate('Tipo de Contato não informado', 'DBLookupComboBox4');

    if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
      raiseExceptionCreate('Cliente não informado', 'DBLookupComboBox4');

    if dataSet.FieldByName('COD_CONTATO').AsInteger = 0 then
      raiseExceptionCreate('Tipo de Contato não informado', 'DBLookupComboBox4');

    if dataSet.State = dsInsert then
    begin
      if dataSet.FieldByName('DATA_AGENDADA').AsDateTime < vDadosIni.getDataBanco(buscas) then
        raiseExceptionCreate('Data Agendada deve ser maior ou igual a data atual', 'DBEdit3');
    end
    else if dataSet.FieldByName('DATA_AGENDADA').AsDateTime < vDadosIni.getDataBanco(buscas) then
      raiseExceptionCreate('Data Agendada menor que a data atual', 'DBEdit3');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('COD_AGENDAMENTO').AsInteger := Gencodigo('AGENDAMENTO', dtmCRM.SpIncCodigo,vDadosIni.codEmpresa);
      if dataSet.FieldByName('COD_AGENDAMENTO_ANT').AsInteger > 0 then
      begin
        vdtAtual := vDadosIni.getDataBanco(buscas);
        buscas.Close;
        buscas.SQL.Text := 'update agendamento' +
          ' set cod_agendamento_prox = ' + IntToStr(dataSet.FieldByName('COD_AGENDAMENTO').AsInteger) +
          ', cod_finalizacao = 5' +
          ', data_finalizacao = :data_finalizacao' +
          ', descricao = :descricao' +
          ', status = ''FINALIZADO''' +
          ' where cod_agendamento = ' + IntToStr(dataSet.FieldByName('COD_AGENDAMENTO_ANT').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ParamByName('descricao').AsString := fTextoReagendamento;
        buscas.ParamByName('data_finalizacao').AsDate := vdtAtual;
        buscas.ExecSQL;
      end;
    end;

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM008', acao, 'SUCESSO', 'AGENDAMENTO', dataSet.FieldByName('COD_AGENDAMENTO').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM008', acao, 'FALHA', 'AGENDAMENTO', dataSet.FieldByName('COD_AGENDAMENTO').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TAgenda._abreAgendaAnterior: Boolean;
var
  vCodigo: Integer;
begin
  Result := False;

  if dataSet.FieldByName('cod_agendamento_ant').AsInteger = 0 then
    Exit;

  if not vDadosIni.PesqPros('CRM011', 'CONSULTA', 'COD AG: ' + dataSet.FieldByName('cod_agendamento').AsString +
    ' VOLTAR PARA: ' + dataSet.FieldByName('cod_agendamento_ant').AsString, 'AGENDAMENTO',
    dataSet.FieldByName('cod_agendamento').AsString, Buscas, True) then
    Exit;

  vCodigo := dataSet.FieldByName('cod_agendamento_ant').AsInteger;

  dataSet.Close;
  dataSet.CommandText := 'select a.*, c.nome_cliente, c.razao, co.nome_vendedor,' +
    ' c.clqtdcompra, c.clsomacompra, c.clultimacompra, c.cllucrocliente, c.clatrasocompra,' +
    ' c.clqtdveiculo, c.clsomaveiculo, c.clultimoveiculo, c.cllucroveiculo' +
    ' from agendamento A' +
    ' left join clientes c on c.cod_cliente = a.cod_cliente and c.cod_empresa = a.cod_empresa' +
    ' left join colaborador co on co.cod_vendedor = a.cod_vendedor and co.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento tac on tac.cod_tipo_agendamento = a.cod_contato and tac.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento taf on taf.cod_tipo_agendamento = a.cod_finalizacao and taf.cod_empresa = a.cod_empresa' +
    ' where a.cod_agendamento = :cod_agendamento_ant and a.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and a.cod_vendedor = :cod_vendedor' +
    ' order by a.data_agendada, a.cod_agendamento';
  dataSet.Params[0].AsInteger := vCodigo;
  dataSet.Params[1].AsInteger := vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
  dataSet.Open;
  Result := True;
end;

function TAgenda._abreAgendaCliente: Boolean;
begin
  if not vDadosIni.PesqPros('CRM002', 'CONSULTA', 'CLIENTE COD: ' + IntToStr(vClA.dataSet.FieldByName('cod_cliente').AsInteger), 'AGENDAMENTO', '',
    Buscas, True) then
    Exit;

  dataSet.Close;
  dataSet.CommandText := 'select a.*, c.nome_cliente, c.razao, co.nome_vendedor,' +
    ' c.clqtdcompra, c.clsomacompra, c.clultimacompra, c.cllucrocliente, c.clatrasocompra,' +
    ' c.clqtdveiculo, c.clsomaveiculo, c.clultimoveiculo, c.cllucroveiculo' +
    ' from agendamento A' +
    ' left join clientes c on c.cod_cliente = a.cod_cliente and c.cod_empresa = a.cod_empresa' +
    ' left join colaborador co on co.cod_vendedor = a.cod_vendedor and co.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento tac on tac.cod_tipo_agendamento = a.cod_contato and tac.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento taf on taf.cod_tipo_agendamento = a.cod_finalizacao and taf.cod_empresa = a.cod_empresa' +
    ' where a.cod_cliente = :cod_cliente and a.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and a.cod_vendedor = :cod_vendedor and a.data_finalizacao is null' +
    ' order by a.data_agendada, a.cod_agendamento';
  dataSet.Params[0].AsInteger := vClA.dataSet.FieldByName('cod_cliente').AsInteger;
  dataSet.Params[1].AsInteger := vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
  dataSet.Open;

  vTpA_C._abreTipoAgendamento;
  vTpA_F._abreTipoAgendamento;

  Result := True;
end;

function TAgenda._abreAgendaColaborador(pCOD_VENDEDOR: Integer): Boolean;
begin
  dataSet.Close;
  dataSet.CommandText := 'select a.*, c.nome_cliente, c.razao, co.nome_vendedor,' +
    ' c.clqtdcompra, c.clsomacompra, c.clultimacompra, c.cllucrocliente, c.clatrasocompra,' +
    ' c.clqtdveiculo, c.clsomaveiculo, c.clultimoveiculo, c.cllucroveiculo' +
    ' from agendamento A' +
    ' left join clientes c on c.cod_cliente = a.cod_cliente and c.cod_empresa = a.cod_empresa' +
    ' left join colaborador co on co.cod_vendedor = a.cod_vendedor and co.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento tac on tac.cod_tipo_agendamento = a.cod_contato and tac.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento taf on taf.cod_tipo_agendamento = a.cod_finalizacao and taf.cod_empresa = a.cod_empresa' +
    ' where a.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and a.cod_vendedor = :cod_vendedor and a.data_finalizacao is null' +
    ' order by a.data_agendada, a.cod_agendamento';
  dataSet.Params[0].AsInteger := pCOD_VENDEDOR;
  dataSet.Open;

  Result := True;
end;

function TAgenda._abreAgendaDoDia: Boolean;
var
  vDtGeral: TDateTime;
begin
  Result := False;

  vDtGeral := vDadosIni.getDataBanco(buscas);

  if not vDadosIni.PesqPros('CRM001', 'CONSULTA', 'DIA ' + DateToStr(vDtGeral), 'AGENDAMENTO', '',
    Buscas, True) then
    Exit;

  dataSet.Close;
  dataSet.CommandText := 'select a.*, c.nome_cliente, c.razao, co.nome_vendedor,' +
    ' c.clqtdcompra, c.clsomacompra, c.clultimacompra, c.cllucrocliente, c.clatrasocompra,' +
    ' c.clqtdveiculo, c.clsomaveiculo, c.clultimoveiculo, c.cllucroveiculo' +
    ' from agendamento A' +
    ' left join clientes c on c.cod_cliente = a.cod_cliente and c.cod_empresa = a.cod_empresa' +
    ' left join colaborador co on co.cod_vendedor = a.cod_vendedor and co.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento tac on tac.cod_tipo_agendamento = a.cod_contato and tac.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento taf on taf.cod_tipo_agendamento = a.cod_finalizacao and taf.cod_empresa = a.cod_empresa' +
    ' where a.data_agendada <= :dataAgenda and a.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and a.cod_vendedor = :cod_vendedor and a.data_finalizacao is null' +
    ' order by a.data_agendada, a.cod_agendamento';
  dataSet.Params[0].AsDate := vDtGeral;
  dataSet.Params[1].AsInteger := vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
  dataSet.Open;

  vTpA_C._abreTipoAgendamento;
  vTpA_F._abreTipoAgendamento;
  
  Result := True;
end;

function TAgenda._abreAgendaProxima: Boolean;
var
  vCodigo: Integer;
begin
  Result := False;

  if dataSet.FieldByName('cod_agendamento_prox').AsInteger = 0 then
    Exit;

  if not vDadosIni.PesqPros('CRM012', 'CONSULTA', 'COD AG: ' + dataSet.FieldByName('cod_agendamento').AsString +
    ' IR PARA: ' + dataSet.FieldByName('cod_agendamento_prox').AsString, 'AGENDAMENTO',
    dataSet.FieldByName('cod_agendamento').AsString, Buscas, True) then
    Exit;

  vCodigo := dataSet.FieldByName('cod_agendamento_prox').AsInteger;

  dataSet.Close;
  dataSet.CommandText := 'select a.*, c.nome_cliente, c.razao, co.nome_vendedor,' +
    ' c.clqtdcompra, c.clsomacompra, c.clultimacompra, c.cllucrocliente, c.clatrasocompra,' +
    ' c.clqtdveiculo, c.clsomaveiculo, c.clultimoveiculo, c.cllucroveiculo' +
    ' from agendamento A' +
    ' left join clientes c on c.cod_cliente = a.cod_cliente and c.cod_empresa = a.cod_empresa' +
    ' left join colaborador co on co.cod_vendedor = a.cod_vendedor and co.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento tac on tac.cod_tipo_agendamento = a.cod_contato and tac.cod_empresa = a.cod_empresa' +
    ' left join tipo_agendamento taf on taf.cod_tipo_agendamento = a.cod_finalizacao and taf.cod_empresa = a.cod_empresa' +
    ' where a.cod_agendamento = :cod_agendamento_prox and a.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and a.cod_vendedor = :cod_vendedor' +
    ' order by a.data_agendada, a.cod_agendamento';
  dataSet.Params[0].AsInteger := vCodigo;
  dataSet.Params[1].AsInteger := vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
  dataSet.Open;
  Result := True;
end;

function TAgenda._abreFormReagendamento: Boolean;
var
  formulario: TfrmPadrao;
begin

  Result := True;
  vClA._selecionaCliente(vCodUltCliente);
  if Trim(vClA.dataSet.FieldByName('ACEITA_CONTATO_TLV').AsString) = 'N' then
    Exit;

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Reagendamento';
    FrmAgendamentos.pnProximoAgendamento.Visible := True;
    FrmAgendamentos.pnProximoAgendamento.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;

    if vClA.dataSet.FieldByName('DIAS_CONTATO_TLV').AsInteger > 0 then
      vDtAgendamento := vClA.dataSet.FieldByName('DIAS_CONTATO_TLV').AsInteger + Trunc(vDadosIni.getDataBanco(buscas))
    else if vDadosIni.vEmp.vDiasContatoTlVnd > 0  then
      vDtAgendamento := vDadosIni.vEmp.vDiasContatoTlVnd + Trunc(vDadosIni.getDataBanco(buscas))
    else if vClA.dataSet.FieldByName('MEDIAFREQUENCIA').AsInteger > 0 then
      vDtAgendamento := vClA.dataSet.FieldByName('MEDIAFREQUENCIA').AsInteger + Trunc(vDadosIni.getDataBanco(buscas))
    else
      vDtAgendamento := 30 + Trunc(vDadosIni.getDataBanco(buscas));

    result := (formulario.ShowModal = IDOK);

  finally
    FrmAgendamentos.pnProximoAgendamento.Visible := False;
    FrmAgendamentos.pnProximoAgendamento.Parent := FrmAgendamentos.tsFinalizacaoContato;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TAgenda._AfterCloseAgenda(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).IndexName := '';
end;

function TAgenda._validaTrocaColaborador: Boolean;
var
  vIdResp: Integer;
begin
  if Self.dataSet.ChangeCount > 0 then
  begin
    vIdResp := Application.MessageBox('Deseja salvar alterações', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION);
    if vIdResp = IDYES then
      Result := _confirmarAgendamentosRedistribuidos
    else if vIdResp = IDNO then
    begin
      vDtSetTmp.EmptyDataSet;
      dataSet.CancelUpdates;
      Result := True;
      
      vDadosIni.GravaAuditoria('CRM025', 'ALTERAR', 'ROLLBACK TRANSACAO', 'AGENDAMENTO', '', buscas);
    end
    else
      Result := false;
  end
  else
    Result := True;
end;

procedure TAgenda._AfterScrollColabR(DataSet: TDataSet);
begin
  vDtSetTmp.Filtered := False;
  vDtSetTmp.Filter := 'COD_VENDEDOR = ' + IntToStr(vColR.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
  vDtSetTmp.Filtered := True;
end;

procedure TAgenda._AfterScrollAgenda(DataSet: TDataSet);
begin
  if DataSet.FieldByName('cod_cliente').AsInteger <> vClA.DataSet.FieldByName('cod_cliente').AsInteger then
    vClA._selecionaCliente(DataSet.FieldByName('cod_cliente').AsInteger);
end;

function TAgenda._agendarAutomaticamenteAtendimentos: Boolean;
var
  vRemoverDataCasoErro: Boolean;
  vQtdeDiasSemCompra: Integer;
  vLista, vLista2: TStringList;
  I: Integer;
  J: Integer;
  iR: Integer;

  procedure _setDataProcessamento;
  begin
    if not buscas.Transaction.InTransaction then
      buscas.Transaction.StartTransaction;

    buscas.Close;
    buscas.SQL.Text := 'update colaborador set data_proc_carteira = :data_proc_carteira' +
      ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data_proc_carteira').AsDate := vDadosIni.vdataGeral;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;
  end;

begin
  try
    vRemoverDataCasoErro:= True;

    if vDadosIni.vEmp.vDiasContatoTlVnd <= 0 then
      Exit;

    // Verifica clientes sem compras ou contatos no periodo
    vDadosIni.vdataGeral := vDadosIni.getDataBanco(buscas);
    buscas.Close;
    buscas.SQL.Text := 'select cod_vendedor, data_proc_carteira from colaborador' +
      ' where data_proc_carteira = :data_proc_carteira' +
      ' and cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data_proc_carteira').AsDate := vDadosIni.vdataGeral;
    buscas.Open;

    if not buscas.IsEmpty then
      Exit;

    // Crianda agendamentos automaticos para clientes da carteira do vendedor logado
    buscas.Close;
    buscas.SQL.Text := 'select cod_cliente, data_ultimo_contato, data_ult_compra from clientes c' +
      ' where ( ((c.data_ult_compra < :data_contato) or (c.data_ult_compra is null))' +
      ' and ((c.data_ultimo_contato < :data_contato) or (c.data_ultimo_contato is null)) )' +
      ' and coalesce(c.aceita_contato_tlv,0 ) <> ''N''' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and c.cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
      ' and c.ativo = 1';
    buscas.ParamByName('data_contato').AsDate := vDadosIni.vdataGeral - vDadosIni.vEmp.vDiasContatoTlVnd;
    buscas.Open;

    vLista := TStringList.Create;
    vLista2 := TStringList.Create;

    if not buscas.IsEmpty then
    begin

      vLista.Clear;
      vLista2.Clear;

      buscas.First;
      while not buscas.Eof do
      begin
        vLista.Add(buscas.FieldByName('cod_cliente').AsString);
        buscas.Next;
      end;

      for I := 0 to vLista.Count - 1 do
      begin
        buscas.Close;
        buscas.SQL.Text := 'select first 1 data_agendada from agendamento' +
          ' where cod_cliente = ' + vLista[I] +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and data_agendada >= :data1 and data_agendada <= :data2' +
          ' and coalesce(status, '''') <> ''FINALIZADO'' ';
        buscas.ParamByName('data1').AsDate := vDadosIni.vdataGeral - vDadosIni.vEmp.vDiasContatoTlVnd;
        buscas.ParamByName('data2').AsDate := vDadosIni.vdataGeral;
        buscas.Open;

        if buscas.IsEmpty then
          vLista2.Add(vLista[I]);
      end;

      if vLista2.Count > 0 then
      begin
        if not buscas.Transaction.InTransaction then
          buscas.Transaction.StartTransaction;

        for I := 0 to vLista2.Count - 1 do
        begin

          buscas.Close;
          buscas.SQL.Text :=
            'INSERT INTO AGENDAMENTO (COD_AGENDAMENTO, COD_EMPRESA, COD_CLIENTE, COD_VENDEDOR, COD_CONTATO,' +
            ' DATA_AGENDADA, AUTOMATICO, COD_USUARIO)' +
            ' VALUES (:COD_AGENDAMENTO, ' + vDadosIni.codEmpresa + ', ' + vLista2[I] + ', ' + IntToStr(vDadosIni.vCodUsuario) + ', 1,' +
            ' :DATA_AGENDADA, ''S'', ' + IntToStr(vDadosIni.vCodUsuario)+ ')';
          buscas.ParamByName('COD_AGENDAMENTO').AsInteger := Gencodigo('AGENDAMENTO', dtmCRM.SpIncCodigo, vDadosIni.codEmpresa);
          buscas.ParamByName('DATA_AGENDADA').AsDate := vDadosIni.vdataGeral;
          buscas.ExecSQL;

        end;
        if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;
      end;
    end;

    //Criando agendamento automatico para clientes que nao pertencem a nenhuma carteira

    buscas.Close;
    buscas.SQL.Text := 'select cod_cliente, data_ultimo_contato, data_ult_compra from clientes c' +
      ' where ( ((c.data_ult_compra < :data_contato) or (c.data_ult_compra is null))' +
      ' and ((c.data_ultimo_contato < :data_contato) or (c.data_ultimo_contato is null)) )' +
      ' and coalesce(c.aceita_contato_tlv,0 ) <> ''N''' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(c.cod_vendedor, 0) = 0' +
      ' and c.ativo = 1';
    buscas.ParamByName('data_contato').AsDate := vDadosIni.vdataGeral - vDadosIni.vEmp.vDiasContatoTlVnd;
    buscas.Open;

    if buscas.IsEmpty then
    begin
      _setDataProcessamento;
      Exit;
    end;

    vLista.Clear;
    vLista2.Clear;

    buscas.First;
    while not buscas.Eof do
    begin
      vLista.Add(buscas.FieldByName('cod_cliente').AsString);
      buscas.Next;
    end;

    for I := 0 to vLista.Count - 1 do
    begin
      buscas.Close;
      buscas.SQL.Text := 'select first 1 data_agendada from agendamento' +
        ' where cod_cliente = ' + vLista[I] +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and data_agendada >= :data1 and data_agendada <= :data2' +
        ' and coalesce(status, '''') <> ''FINALIZADO'' ';
      buscas.ParamByName('data1').AsDate := vDadosIni.vdataGeral - vDadosIni.vEmp.vDiasContatoTlVnd;
      buscas.ParamByName('data2').AsDate := vDadosIni.vdataGeral;
      buscas.Open;

      if buscas.IsEmpty then
        vLista2.Add(vLista[I]);
    end;

    buscas.Close;
    buscas.SQL.Text := 'select count(cod_vendedor) contador from colaborador' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ((data_proc_carteira is null) or (not (data_proc_carteira = :data_proc_carteira)))' +
      ' and vendedor_tlv = ''S''' +
      ' and ativo = 1';
    buscas.Open;

    if buscas.FieldByName('contador').AsInteger = 0 then
      J:= 1
    else
      J := buscas.FieldByName('contador').AsInteger;

    if J > 1 then
      J :=  Trunc(vLista2.Count / J)
    else
      J := vLista2.Count;

    iR := 0;

    if vLista2.Count > 0 then
    begin
      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;

      Randomize;
      for I := 1 to J do
      begin

        iR := Random(vLista2.Count);

        buscas.Close;
        buscas.SQL.Text :=
          'INSERT INTO AGENDAMENTO (COD_AGENDAMENTO, COD_EMPRESA, COD_CLIENTE, COD_VENDEDOR, COD_CONTATO,' +
          ' DATA_AGENDADA, AUTOMATICO, COD_USUARIO)' +
          ' VALUES (:COD_AGENDAMENTO, ' + vDadosIni.codEmpresa + ', ' + vLista2[iR] + ', ' + IntToStr(vDadosIni.vCodUsuario) + ', 1,' +
          ' :DATA_AGENDADA, ''S'', ' + IntToStr(vDadosIni.vCodUsuario)+ ')';
        buscas.ParamByName('COD_AGENDAMENTO').AsInteger := Gencodigo('AGENDAMENTO', dtmCRM.SpIncCodigo, vDadosIni.codEmpresa);
        buscas.ParamByName('DATA_AGENDADA').AsDate := vDadosIni.vdataGeral;
        buscas.ExecSQL;

        vLista2.Delete(iR);

      end;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    end;

    _setDataProcessamento;    

  except
    on E: Exception do begin

    end;
  end;
end;

procedure TAgenda._BeforeScrollAgenda(DataSet: TDataSet);
begin
  if Self.dataSet.ChangeCount > 0 then
    Self.dataSet.CancelUpdates;
end;

function TAgenda._confirmarAgendamentosRedistribuidos: Boolean;
begin
  try
    vDtSetTmp.Filter := '';
    vDtSetTmp.Filtered := False;

    vDtSetTmp.First;
    while not vDtSetTmp.Eof do
    begin
      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;

      buscas.Close;
      buscas.SQL.Text := 'update agendamento set cod_vendedor = ' + IntToStr(vDtSetTmp.FieldByName('cod_vendedor').AsInteger) +
        ' where cod_agendamento = ' + IntToStr(vDtSetTmp.FieldByName('cod_agendamento').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      vDtSetTmp.Next;
    end;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('CRM025', 'ALTERAR', 'CONFIRMAR TRANSACAO', 'AGENDAMENTO', '', buscas);

    Result := True;

    vDtSetTmp.EmptyDataSet;
  except on E: Exception do
    begin
      Result := False;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
      
      vDadosIni.GravaAuditoria('CRM025', 'ALTERAR', 'ROLLBACK TRANSACAO', 'AGENDAMENTO', '', buscas);

      Application.MessageBox(pchar('Erro ao confirmar registribuição de agendamentos. Erro: ' + e.Message), 'Ateção', 0 + 64);
      registraErro('TAgenda._confirmarAgendamentosRedistribuidos. Erro: ' + E.Message);
    end;
  end;
end;

function TAgenda._finalizarAgendamento(pTIPO_VENDA: string): Boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin

  Result := False;

  buscas.Close;
  buscas.SQL.Text := 'select nped, tipo from pedvenda' +
    ' where cod_agendamento = ' + IntToStr(dataSet.FieldByName('cod_agendamento').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  pTIPO_VENDA := pTIPO_VENDA;
  if not buscas.IsEmpty then
  begin
    vDadosIni.vtpVenda := pTIPO_VENDA;
    pTIPO_VENDA := Trim(buscas.FieldByName('tipo').AsString) + '|' + IntToStr(buscas.FieldByName('nped').AsInteger);
  end
  else
  begin
    vDadosIni.vtpVenda := pTIPO_VENDA;
    pTIPO_VENDA := pTIPO_VENDA + '|0';
  end;

  vDadosIni.vPesquisa := 'TELEVENDA|' + IntToStr(dataSet.FieldByName('cod_agendamento').AsInteger) + '|' + pTIPO_VENDA + '|';

  formulario := Funcoes.AbreForm('pkPedidoVenda', 'TFrmCadPedVenda', hdTemp);

  try
    formulario.ShowModal;
  finally
    vDadosIni.vPesquisa := '';
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
  
  buscas.Close;
  buscas.SQL.Text := 'select nped, tipo, status_ped from pedvenda' +
    ' where cod_agendamento = ' + IntToStr(dataSet.FieldByName('cod_agendamento').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  if Trim(buscas.FieldByName('status_ped').AsString) <> '' then
  begin
    vCodUltCliente := dataSet.FieldByName('cod_cliente').AsInteger;
    Result := montaSelect(dataSet.CommandText);
  end;
end;

function TAgenda._moverAgendamentoColaborador(pCOD_VENDEDOR: Integer = 0): Boolean;
var
  I: Integer;
  vCodVendedor: Integer;
begin
  Result := False;

  if pCOD_VENDEDOR > 0 then
    vCodVendedor := pCOD_VENDEDOR
  else
    vCodVendedor := vColR.dataSet.FieldByName('cod_vendedor').AsInteger;

  if not vDadosIni.PesqPros('CRM025', 'ALTERAR', 'COD ' + dataSet.FieldByName('COD_AGENDAMENTO').AsString +
    ' COD VENDEDOR ' + dataSet.FieldByName('cod_vendedor').AsString +
    ' MOVIDO PARA COD_VENDEDOR ' + IntToStr(vCodVendedor), 'AGENDAMENTO', '',
    buscas, True) then
    Exit;

  try

    vDtSetTmp.Insert;
    for I := 0 to dataSet.FieldCount - 1 do
      vDtSetTmp.FieldByName(dataSet.Fields[i].FieldName).Value :=
        dataSet.FieldByName(dataSet.Fields[i].FieldName).Value;

    if pCOD_VENDEDOR > 0 then
      vDtSetTmp.FieldByName('cod_vendedor').AsInteger := pCOD_VENDEDOR
    else
      vDtSetTmp.FieldByName('cod_vendedor').AsInteger := vColR.dataSet.FieldByName('cod_vendedor').AsInteger;
    vDtSetTmp.Post;

    dataSet.Edit;
    if pCOD_VENDEDOR > 0 then
      dataSet.FieldByName('cod_vendedor').AsInteger := pCOD_VENDEDOR
    else
      dataSet.FieldByName('cod_vendedor').AsInteger := vColR.dataSet.FieldByName('cod_vendedor').AsInteger;
    dataSet.Post;
    Result := True;

  except
    dataSet.CancelUpdates;
    vDtSetTmp.CancelUpdates;
    Result := False;
  end;

end;

function TAgenda._moverAllAgendamentoEntreColaboradores: Boolean;
var
  vLista: TStringList;
  vCont: Integer;
begin
  vLista := TStringList.Create;
  vLista.Clear;

  vColR.dataSet.First;
  while not vColR.dataSet.Eof do
  begin
    vLista.Add(IntToStr(vColR.dataSet.FieldByName('cod_vendedor').AsInteger));
    vColR.dataSet.Next;
  end;

  vCont:= 0;

  Result := False;
  dataSet.First;
  while not dataSet.IsEmpty do
  begin
    inc(vCont);
    if not _moverAgendamentoColaborador(StrToInt(vLista[vCont - 1])) then
    begin
      Result := False;
      Exit;
    end;

//    dataSet.Next;
    if vCont = vLista.Count then
      vCont := 0;
    Result := True;
  end;
end;

function TAgenda._moverAllAgendamentosColaborador: Boolean;
begin
  Result := False;
  dataSet.First;
  while not dataSet.IsEmpty do
  begin
    if not _moverAgendamentoColaborador then
    begin
      Result := False;
      Exit;
    end;
//    dataSet.Next;
    Result := True;
  end;
end;

function TAgenda._finalizarAgendamento: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM014', 'INCLUIR', 'COD CLIENTE: ' + dataSet.FieldByName('COD_CLIENTE').AsString,
    'AGENDAMENTO', dataSet.FieldByName('cod_agendamento').AsString, Buscas, True) then
    Exit;

  if dataSet.IsEmpty then
    raiseExceptionCreate('Sem agendamentos', '');

  buscas.Close;
  buscas.SQL.Text := 'select nped, tipo, status_ped from pedvenda' +
    ' where cod_agendamento = ' + IntToStr(dataSet.FieldByName('cod_agendamento').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if not buscas.IsEmpty then
    if Trim(buscas.FieldByName('status_ped').AsString) = '' then
      raiseExceptionCreate('Venda já iniciada pelo Atendimento. O fechamento da venda irá finalizar este atendimento', '');

  if not (dataSet.State in [dsInsert, dsEdit]) then
    if dataSet.Active then
      dataSet.Edit;

  if Trim(dataSet.FieldByName('status').AsString) <> '' then
    raiseExceptionCreate('Agendamento já finalizado', '');

  if dataSet.FieldByName('cod_finalizacao').AsInteger = 0 then
    raiseExceptionCreate('Selecione o tipo de Finalização', '');

  dataSet.FieldByName('data_finalizacao').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('status').AsString := 'FINALIZADO';

  Result := inherited Post;
  Result := Apply;

  if Result then
  begin

    buscas.Close;
    buscas.SQL.Text := 'update clientes set data_ultimo_contato = :data_ultimo_contato' +
      ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM014', 'FINALIZAR', 'SUCESSO', 'AGENDAMENTO', dataSet.FieldByName('cod_agendamento').AsString, buscas);
    vCodUltCliente := dataSet.FieldByName('cod_cliente').AsInteger;
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM014', 'FINALIZAR', 'FALHA', 'AGENDAMENTO', dataSet.FieldByName('cod_agendamento').AsString, buscas);
  end;

  dataSet.Refresh;

end;

function TAgenda._reagendar(pUsarData: Boolean = False): Boolean;
var
	vCodAgendamento, vCodCliente: Integer;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM013', 'INCLUIR', 'COD CLIENTE: ' + dataSet.FieldByName('COD_CLIENTE').AsString,
    'AGENDAMENTO', dataSet.FieldByName('cod_agendamento').AsString, Buscas, True) then
    Exit;

  vCodAgendamento := dataSet.FieldByName('cod_agendamento').AsInteger;
  vCodCliente := dataSet.FieldByName('cod_cliente').AsInteger;
  fTextoReagendamento := dataSet.FieldByName('DESCRICAO').AsString;
  dataSet.Cancel;
  if Insert then
  begin
    dataSet.FieldByName('cod_contato').AsInteger := 1; // 1: é o codigo do registro AGENDAMENTO na tabela tipo_agendamento
    dataSet.FieldByName('cod_agendamento_ant').AsInteger := vCodAgendamento;
    dataSet.FieldByName('cod_cliente').AsInteger := vCodCliente;
    vClA._selecionaCliente(vCodCliente);
    dataSet.FieldByName('cod_contato').AsInteger := 1;
    if  pUsarData then
    begin
      dataSet.FieldByName('data_agendada').AsDateTime := vDtAgendamento;
      dataSet.FieldByName('cod_agendamento_ant').Value := Null;
      dataSet.FieldByName('cod_cliente').AsInteger :=  vCodUltCliente;
      vClA._selecionaCliente(vCodUltCliente);
    end;
    Result := True;
  end;
end;

function TAgenda._removerCarteiraDeClientesSemCompras: Boolean;
var
  vRemoverDataCasoErro: Boolean;
  vQtdeDiasSemCompra: Integer;
  vLista, vLista2: TStringList;
  I: Integer;
begin
  try
    vRemoverDataCasoErro:= True;

    // Verifica se ja houve processamento ou se o processamento já foi iniciado
    vDadosIni.vdataGeral := vDadosIni.getDataBanco(buscas);
    buscas.Close;
    buscas.SQL.Text := 'select cod_vendedor, data_remov_carteira from colaborador' +
      ' where data_remov_carteira = :data_remov_carteira' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data_remov_carteira').AsDate := vDadosIni.vdataGeral;
    buscas.Open;

    if not buscas.IsEmpty then
      Exit;

    if not buscas.Transaction.InTransaction then
      buscas.Transaction.StartTransaction;

    // Atribuindo data atual ao colaborador logado para indicar o inicio do processamento
    buscas.Close;
    buscas.SQL.Text := 'update colaborador set data_remov_carteira = :data_remov_carteira' +
      ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data_remov_carteira').AsDate := vDadosIni.vdataGeral;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vRemoverDataCasoErro:= True;

    //Verificando se outro colaborador iniciou o processo ao mesmo tempo. Caso isso ocorra este processamento será cancelado
    buscas.Close;
    buscas.SQL.Text := 'select cod_vendedor, data_remov_carteira from colaborador' +
      ' where data_remov_carteira = :data_remov_carteira' +
      ' and cod_vendedor <> ' + IntToStr(vDadosIni.vCodUsuario) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data_remov_carteira').AsDate := vDadosIni.vdataGeral;
    buscas.Open;

    if not buscas.IsEmpty then
    begin
      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;

      buscas.Close;
      buscas.SQL.Text := 'update colaborador set data_remov_carteira = null' +
        ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;
      
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      Exit;
    end;

    //Iniciando o processamento
    // Selecionando qtde de dias paraverificar clientes sem compras no periodo
    buscas.Close;
    buscas.SQL.Text := 'select qtde_dias_sem_comp_cart from empresa' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    vQtdeDiasSemCompra := buscas.FieldByName('qtde_dias_sem_comp_cart').AsInteger;

    if vQtdeDiasSemCompra = 0 then
      Exit;

    // Selecionando clientes sem compras no period entre a data atual e a data atual menos a qtde de dias na empresa
    buscas.Close;
    buscas.SQL.Text := 'select cod_cliente from clientes' +
      ' where data_ult_compra < :data_ult_compra' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_vendedor > 0' +
      ' and ativo = 1';
    buscas.ParamByName('data_ult_compra').AsDate := vDadosIni.vdataGeral - vQtdeDiasSemCompra;
    buscas.Open;

    vLista := TStringList.Create;
    vLista.Clear;

    vLista2 := TStringList.Create;
    vLista2.Clear;

    buscas.First;
    while not buscas.Eof do
    begin
      vLista.Add(buscas.FieldByName('cod_cliente').AsString);
      buscas.Next;
    end;

    for I := 0 to vLista.Count - 1 do
    begin
      buscas.Close;
      buscas.SQL.Text := 'select first 1 data_ped from pedvenda' +
        ' where cod_cliente = ' + vLista[I] +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and data_ped >= :data1 and data_ped <= :data2' +
        ' and coalesce(status_ped, '''') = '''' ';
      buscas.ParamByName('data1').AsDate := vDadosIni.vdataGeral - vQtdeDiasSemCompra;
      buscas.ParamByName('data2').AsDate := vDadosIni.vdataGeral;
      buscas.Open;

      if buscas.IsEmpty then
        vLista2.Add(vLista[I]);
//      else
//        vLista2.Add(buscas.FieldByName('data_ped').AsString);
    end;

    if vLista2.Count > 0 then
    begin
      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;

      buscas.Close;
      buscas.SQL.Text := 'update clientes set cod_vendedor = null' +
        ' where cod_cliente in (';

      for I := 0 to vLista2.Count - 1 do
      begin
        if I = (vLista2.Count - 1) then
          buscas.SQL.Text := buscas.SQL.Text + vLista2[I] + ')'
        else
          buscas.SQL.Text := buscas.SQL.Text + vLista2[I] + ',';
      end;
      buscas.SQL.Text := buscas.SQL.Text + ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    end;

  except
    on E: Exception do begin
      if vRemoverDataCasoErro then
      begin
        buscas.Close;
        buscas.SQL.Text := 'update colaborador set data_remov_carteira = null' +
          ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ParamByName('data_remov_carteira').AsDate := vDadosIni.vdataGeral;
        buscas.ExecSQL;
      end;
    end;
  end;
end;

function TAgenda._validaCliente: Boolean;
begin
  try
    Result := True;
    vClA._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
    if vClA.dataSet.FieldByName('cod_vendedor').AsInteger <> dataSet.FieldByName('cod_vendedor').AsInteger then
    begin
      Result := False;

      Application.MessageBox('Cliente não pertence a carteira deste vendedor', 'Atenção', 0 + 64);
      if not vDadosIni.PesqPros('CRM024', 'INCLUIR', 'TIPO I ', 'TIPO_AGENDAMENTO', '',
        buscas, True) then
        Exit;

      if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> ID_YES then
        Exit;

      Result := True;

    end;
  finally
    if not Result then
      if dataSet.State in [dsInsert, dsEdit] then
      begin
        dataSet.FieldByName('cod_cliente').Value := Null;
        vClA._selecionaCliente(0);
      end;
  end;
end;

{ TTipo_Ag }

function TTipo_Ag._abreTipoAgendamento: Boolean;
begin
  if fTIPO = 'A' then
    Result := montaSelect('select ta.* from tipo_agendamento ta' +
      ' where ta.cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1 order by cod_tipo_agendamento')
  else
    Result := montaSelect('select ta.* from tipo_agendamento ta' +
      ' where ta.tipo = ' + QuotedStr(fTIPO) + ' and ta.cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1 order by descricao');
end;

function TTipo_Ag._addTipoAgendamento: Boolean;
var
  vTemp : string;
  vMsg1, vMsg2:string;
begin
  Result := False;

  if fTIPO = 'I' then
  begin

    if not vDadosIni.PesqPros('CRM009', 'INCLUIR', 'TIPO I ', 'TIPO_AGENDAMENTO', '',
      buscas, True) then
      Exit;

    vMsg1 :=  'Cadastro de Tipo de Contato';
    vMsg2 :=  'Informe a descrição do Tipo de Contato';
  end
  else
  begin

    if not vDadosIni.PesqPros('CRM010', 'INCLUIR', 'TIPO F', 'TIPO_AGENDAMENTO', '',
      buscas, True) then
      Exit;

    vMsg1 :=  'Cadastro de Finalização';
    vMsg2 :=  'Informe a descrição da Finalização';
  end;

  vTemp := '';
  if not InputQuery(vMsg1, vMsg2, vTemp) then
    Exit;

  if Trim(vTemp) = '' then
    raiseExceptionCreate('Descrição não informada','');

  vTemp := UpperCase(Copy(Trim(vTemp),1,32));

  try
    try
      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;
      fExec.Close;
      fExec.SQL.Text := 'INSERT INTO TIPO_AGENDAMENTO (COD_TIPO_AGENDAMENTO, COD_EMPRESA, TIPO, DESCRICAO, ATIVO)' +
        ' VALUES (:COD_TIPO_AGENDAMENTO, ' + vDadosIni.codEmpresa + ', ' + QuotedStr(fTIPO) + ', ' + QuotedStr(vTemp) + ', 1)';
      fExec.ParamByName('COD_TIPO_AGENDAMENTO').AsInteger := Gencodigo('TIPO_AGENDAMENTO', dtmCRM.spIncCodigoAux, vDadosIni.codEmpresa);
      fExec.ExecSQL;
      if fExec.Transaction.InTransaction then
      begin
        fExec.Transaction.Commit;
        if fTIPO = 'I' then
          vDadosIni.GravaAuditoria('CRM009', 'INCLUIR', 'SUCESSO TIPO I ' + vTemp, 'TIPO_AGENDAMENTO', '', buscas)
        else
          vDadosIni.GravaAuditoria('CRM010', 'INCLUIR', 'SUCESSO TIPO F ' + vTemp, 'TIPO_AGENDAMENTO', '', buscas);
      end;
    except
      if fTIPO = 'I' then
        vDadosIni.GravaAuditoria('CRM009', 'INCLUIR', 'FALHA TIPO I ' + vTemp, 'TIPO_AGENDAMENTO', '', buscas)
      else
        vDadosIni.GravaAuditoria('CRM010', 'INCLUIR', 'FALHA TIPO F ' + vTemp, 'TIPO_AGENDAMENTO', '', buscas);
    end;
  finally
    if fExec.Transaction.InTransaction then
      fExec.Transaction.Rollback;
  end;

  montaSelect(dataSet.CommandText);
  Result := True;

end;

procedure TTipo_Ag._verificaTipoAgendamento;
begin
  if not fExec.Transaction.InTransaction then
    fExec.Transaction.StartTransaction;

  fExec.Close;
  buscas.Close;
  buscas.SQL.Text := 'select * from TIPO_AGENDAMENTO where cod_tipo_agendamento = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  fExec.SQL.Text := '';
  if buscas.IsEmpty then
    fExec.SQL.Text := 'INSERT INTO TIPO_AGENDAMENTO (COD_TIPO_AGENDAMENTO, COD_EMPRESA, TIPO, DESCRICAO) VALUES ( 1, ' + vDadosIni.codEmpresa + ', ''I'', ''AGENDAMENTO'')'
  else if (Trim(buscas.FieldByName('TIPO').AsString) <> 'I') or (Trim(buscas.FieldByName('DESCRICAO').AsString) <> 'AGENDAMENTO') then
    fExec.SQL.Text := 'UPDATE TIPO_AGENDAMENTO SET TIPO = ''I'', DESCRICAO = ''AGENDAMENTO'' WHERE COD_TIPO_AGENDAMENTO = 1 AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  if fExec.SQL.Text <> '' then
    fExec.ExecSQL;

  fExec.Close;
  buscas.Close;
  buscas.SQL.Text := 'select * from TIPO_AGENDAMENTO where cod_tipo_agendamento = 2 and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  fExec.SQL.Text := '';
  if buscas.IsEmpty then
    fExec.SQL.Text := 'INSERT INTO TIPO_AGENDAMENTO (COD_TIPO_AGENDAMENTO, COD_EMPRESA, TIPO, DESCRICAO) VALUES ( 2, ' + vDadosIni.codEmpresa + ', ''F'', ''AGENDA OFICINA'')'
  else if (Trim(buscas.FieldByName('TIPO').AsString) <> 'F') or (Trim(buscas.FieldByName('DESCRICAO').AsString) <> 'AGENDA OFICINA') then
    fExec.SQL.Text := 'UPDATE TIPO_AGENDAMENTO SET TIPO = ''F'', DESCRICAO = ''AGENDA OFICINA'' WHERE COD_TIPO_AGENDAMENTO = 2 AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  if fExec.SQL.Text <> '' then
    fExec.ExecSQL;

  fExec.Close;
  buscas.Close;
  buscas.SQL.Text := 'select * from TIPO_AGENDAMENTO where cod_tipo_agendamento = 3 and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  fExec.SQL.Text := '';
  if buscas.IsEmpty then
    fExec.SQL.Text := 'INSERT INTO TIPO_AGENDAMENTO (COD_TIPO_AGENDAMENTO, COD_EMPRESA, TIPO, DESCRICAO) VALUES ( 3, ' + vDadosIni.codEmpresa + ', ''I'', ''AGENDAMENTO SERVICO'')'
  else if (Trim(buscas.FieldByName('TIPO').AsString) <> 'I') or (Trim(buscas.FieldByName('DESCRICAO').AsString) <> 'AGENDAMENTO SERVICO') then
    fExec.SQL.Text := 'UPDATE TIPO_AGENDAMENTO SET TIPO = ''I'', DESCRICAO = ''AGENDAMENTO SERVICO'' WHERE COD_TIPO_AGENDAMENTO = 3 AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  if fExec.SQL.Text <> '' then
    fExec.ExecSQL;

  fExec.Close;
  buscas.Close;
  buscas.SQL.Text := 'select * from TIPO_AGENDAMENTO where cod_tipo_agendamento = 4 and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  fExec.SQL.Text := '';
  if buscas.IsEmpty then
    fExec.SQL.Text := 'INSERT INTO TIPO_AGENDAMENTO (COD_TIPO_AGENDAMENTO, COD_EMPRESA, TIPO, DESCRICAO) VALUES ( 4, ' + vDadosIni.codEmpresa + ', ''I'', ''PROMOCAO'')'
  else if (Trim(buscas.FieldByName('TIPO').AsString) <> 'I') or (Trim(buscas.FieldByName('DESCRICAO').AsString) <> 'PROMOCAO') then
    fExec.SQL.Text := 'UPDATE TIPO_AGENDAMENTO SET TIPO = ''I'', DESCRICAO = ''PROMOCAO'' WHERE COD_TIPO_AGENDAMENTO = 4 AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  if fExec.SQL.Text <> '' then
    fExec.ExecSQL;

  fExec.Close;
  buscas.Close;
  buscas.SQL.Text := 'select * from TIPO_AGENDAMENTO where cod_tipo_agendamento = 5 and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  fExec.SQL.Text := '';
  if buscas.IsEmpty then
    fExec.SQL.Text := 'INSERT INTO TIPO_AGENDAMENTO (COD_TIPO_AGENDAMENTO, COD_EMPRESA, TIPO, DESCRICAO) VALUES ( 5, ' + vDadosIni.codEmpresa + ', ''F'', ''REAGENDAMENTO'')'
  else if (Trim(buscas.FieldByName('TIPO').AsString) <> 'F') or (Trim(buscas.FieldByName('DESCRICAO').AsString) <> 'REAGENDAMENTO') then
    fExec.SQL.Text := 'UPDATE TIPO_AGENDAMENTO SET TIPO = ''F'', DESCRICAO = ''REAGENDAMENTO'' WHERE COD_TIPO_AGENDAMENTO = 5 AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  if fExec.SQL.Text <> '' then
    fExec.ExecSQL;

  fExec.Close;
  buscas.Close;
  buscas.SQL.Text := 'select * from TIPO_AGENDAMENTO where cod_tipo_agendamento = 6 and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  fExec.SQL.Text := '';
  if buscas.IsEmpty then
    fExec.SQL.Text := 'INSERT INTO TIPO_AGENDAMENTO (COD_TIPO_AGENDAMENTO, COD_EMPRESA, TIPO, DESCRICAO) VALUES ( 6, ' + vDadosIni.codEmpresa + ', ''F'', ''VENDA REALIZADA'')'
  else if (Trim(buscas.FieldByName('TIPO').AsString) <> 'F') or (Trim(buscas.FieldByName('DESCRICAO').AsString) <> 'VENDA REALIZADA') then
    fExec.SQL.Text := 'UPDATE TIPO_AGENDAMENTO SET TIPO = ''F'', DESCRICAO = ''VENDA REALIZADA'' WHERE COD_TIPO_AGENDAMENTO = 6 AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  if fExec.SQL.Text <> '' then
    fExec.ExecSQL;
            
  if fExec.Transaction.InTransaction then
    fExec.Transaction.Commit;
end;

{ TTipo_Ag_ContatoInicial }

constructor TTipo_Ag_ContatoInicial.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsTpA_C);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  fExec := TIBQuery(dtmCRM.qrAux);
  transacao := TIBTransaction(dtmCRM.transacao);
  fTIPO := 'I';
end;

{ TTipo_Ag_Finalizacao }

constructor TTipo_Ag_Finalizacao.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsTpA_F);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  fExec := TIBQuery(dtmCRM.qrAux);
  transacao := TIBTransaction(dtmCRM.transacao);
  fTIPO := 'F';
end;

{ TColaborador_Ag }

constructor TColaborador_Ag.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsCol);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  transacao := TIBTransaction(dtmCRM.transacao);
end;

function TColaborador_Ag._abreColaborador(pCOD_VENDEDOR: Integer): Boolean;
begin
  Result := montaSelect('select c.cod_vendedor, c.nome_vendedor, c.vendedor_tlv from colaborador c' +
    ' where c.cod_vendedor = ' + IntToStr(pCOD_VENDEDOR) +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and c.vendedor_tlv = ''S''');
end;

function TColaborador_Ag._abreColaborador: Boolean;
begin
  Result := montaSelect('select c.cod_vendedor, c.nome_vendedor, c.vendedor_tlv from colaborador c' +
    ' where c.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and c.vendedor_tlv = ''S''');
end;

{ TTipo_Ag_Ambos }

constructor TTipo_Ag_Ambos.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsTpA_CF);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  fExec := TIBQuery(dtmCRM.qrAux);
  transacao := TIBTransaction(dtmCRM.transacao);
  fTIPO := 'A';
end;

function TTipo_Ag_Ambos.delete: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if Application.MessageBox('Deseja mesmo excluir o registro selecionado?',
    'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;
    
  if not vDadosIni.PesqPros('CRM018', 'EXCLUIR', 'TIPO ' + dataSet.FieldByName('TIPO').AsString + ' ' +
    dataSet.FieldByName('DESCRICAO').AsString, 'TIPO_AGENDAMENTO', dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsString,
    buscas, True) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select cod_agendamento from agendamento' +
    ' where ((cod_contato = ' + IntToStr(dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsInteger) + ')' +
    ' or (cod_finalizacao = ' + IntToStr(dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsInteger) + '))' +
    ' and ativo = 1';
  buscas.Open;

  if not buscas.IsEmpty then
    raiseExceptionCreate('Tipo de Contato/Finalização já vinculado a um Agendamento. Não pode ser excluído', '');

  try
    try
      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;
      fExec.Close;
      fExec.SQL.Text := 'delete from TIPO_AGENDAMENTO' +
        ' where COD_TIPO_AGENDAMENTO = ' +  IntToStr(dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsInteger);
      fExec.ExecSQL;
      if fExec.Transaction.InTransaction then
      begin
        fExec.Transaction.Commit;
        vDadosIni.GravaAuditoria('CRM018', 'EXCLUIR', 'SUCESSO DESCR: ' + dataSet.FieldByName('DESCRICAO').AsString, 'TIPO_AGENDAMENTO', dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsString, buscas);
      end;
      _abreTipoAgendamento;
      Result := True;
    except
      vDadosIni.GravaAuditoria('CRM018', 'EXCLUIR', 'FALHA DESCR: ' + dataSet.FieldByName('DESCRICAO').AsString, 'TIPO_AGENDAMENTO', dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsString, buscas);
    end;
  finally
    if fExec.Transaction.InTransaction then
      fExec.Transaction.Rollback;
  end;
  _verificaTipoAgendamento;
  montaSelect(dataSet.CommandText);
  Result := True;
end;

function TTipo_Ag_Ambos.post: Boolean;
var
  vTemp : string;
  vMsg1, vMsg2:string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CRM019', 'ALTERAR', 'TIPO ' + dataSet.FieldByName('TIPO').AsString + ' ' +
    dataSet.FieldByName('DESCRICAO').AsString, 'TIPO_AGENDAMENTO', dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsString,
    buscas, True) then
    Exit;

  if dataSet.FieldByName('TIPO').AsString = 'I' then
  begin
    vMsg1 :=  'Alteração de Tipo de Contato';
    vMsg2 :=  'Informe a descrição do Tipo de Contato';
  end
  else
  begin
    vMsg1 :=  'Alteração de Finalização';
    vMsg2 :=  'Informe a descrição da Finalização';
  end;

  vTemp := '';
  if not InputQuery(vMsg1, vMsg2, vTemp) then
    Exit;

  if Trim(vTemp) = '' then
    raiseExceptionCreate('Descrição não informada','');

  vTemp := UpperCase(Copy(Trim(vTemp),1,32));

  try
    try
      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;
      fExec.Close;
      fExec.SQL.Text := 'update TIPO_AGENDAMENTO set DESCRICAO = ' + QuotedStr(vTemp) +
        ' where COD_TIPO_AGENDAMENTO = :COD_TIPO_AGENDAMENTO and cod_empresa = ' + vDadosIni.codEmpresa;
      fExec.ParamByName('COD_TIPO_AGENDAMENTO').AsInteger := dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsInteger;
      fExec.ExecSQL;
      if fExec.Transaction.InTransaction then
      begin
        fExec.Transaction.Commit;
        vDadosIni.GravaAuditoria('CRM019', 'INCLUIR', 'SUCESSO DESCR: ' + vTemp, 'TIPO_AGENDAMENTO', dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsString, buscas);
      end;
    except
      vDadosIni.GravaAuditoria('CRM019', 'INCLUIR', 'FALHA DESCR: ' + vTemp, 'TIPO_AGENDAMENTO', dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsString, buscas);
    end;
  finally
    if fExec.Transaction.InTransaction then
      fExec.Transaction.Rollback;
  end;
  _verificaTipoAgendamento;

  montaSelect(dataSet.CommandText);
  Result := True;

end;

{ TDev }

constructor TDev.create;
begin
  if dtmCRM = nil then
    dtmCRM := TdtmCRM.Create(dtmCRM);
  dataSet := TClientDataSet(dtmCRM.cdsDev);
  buscas := TIBQuery(dtmCRM.qrDev);
  transacao := TIBTransaction(dtmCRM.transacao);
end;

function TDev._abreDev(pDataI, pDataF: string;pCodCli:integer): Boolean;
begin
  result:=false;
  if obCRM.FFiltrarData then
  begin
    try
      obCRM.Fdatainicial := StrToDate(pDataI);
      obCRM.Fdatafinal := StrToDate(pDataF);
      result:= montaSelect('select * from devolucao where data >= :dti and data<= :dtf '+
      ' and coalesce(cod_cliente,0) = '+ inttostr(pCodCli)+
      ' and cod_empresa = '+vDadosIni.codEmpresa+ ' and ativo=1 ',StrToDate(pDataI),StrToDate(pDataF));
    except
      Result := False;
      Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  end
  else
  begin
  	result:= montaSelect('select * from devolucao where '+
   	 ' coalesce(cod_cliente,0) = '+ inttostr(pCodCli) +
    	' and cod_empresa = '+vDadosIni.codEmpresa+ ' and ativo=1 ');
  end;
end;

{ TDevReq }

constructor TDevReq.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsDevReq);
  buscas := TIBQuery(dtmCRM.qrDevReq);
  transacao := TIBTransaction(dtmCRM.transacao);
end;

function TDevReq._abreDevReq(pDataI,pDataF:string;pCodCli:integer): Boolean;
begin
  result:=false;
  if obCRM.FFiltrarData then
  begin
    try
      StrToDate(pDataI);
      StrToDate(pDataF);
      result:= montaSelect('select c.nome_cliente,v.data_fech, vp.* from clientes c inner join pedvenda v '+
        ' on v.cod_cliente=c.cod_cliente and v.cod_empresa= c.cod_empresa '+
        ' inner join pedvenda_prod vp  on v.nped=vp.nped '+
        ' and v.cod_empresa=vp.cod_empresa and v.tipo=vp.tipo '+
        ' where c.cod_cliente = '+inttostr(pCodCli)+
        ' and v.data_fech>=:dti and  v.data_fech<=:dtf and v.cod_empresa='+vDadosIni.codEmpresa+
        ' and coalesce(vp.tipv,'''')<>'''' ' +
        ' order by vp.cod_empresa, vp.nped, vp.nitem ', StrToDate(pDataI),StrToDate(pDataF));
    except
      Result := False;
      Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) +
      'Verifique os campos de data.' + chr(13) +
      'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  end
  else
    result:= montaSelect('select c.nome_cliente,v.data_fech, vp.* from clientes c inner join pedvenda v '+
      ' on v.cod_cliente=c.cod_cliente and v.cod_empresa= c.cod_empresa '+
      ' inner join pedvenda_prod vp  on v.nped=vp.nped '+
      ' and v.cod_empresa=vp.cod_empresa and v.tipo=vp.tipo '+
      ' where c.cod_cliente = '+inttostr(pCodCli)+
      ' and v.cod_empresa='+vDadosIni.codEmpresa+ ' and v.ativo=1 '+
      ' and coalesce(vp.tipv,'''')<>'''' ' +
      ' order by vp.cod_empresa, vp.nped, vp.nitem ');
end;

{ TCRM }

constructor TCRM.create;
begin
  if dtmCRM = nil then
    dtmCRM := TdtmCRM.Create(dtmCRM);
  buscas := TIBQuery(dtmCRM.qrCRM);
  transacao := TIBTransaction(dtmCRM.transacao);

  FFiltrarData:=false;
  FTodasEmpresas := false;
  Fdatainicial := vDadosIni.getDataBanco(buscas);
  Fdatafinal := Fdatainicial;
  FdataBanco := Fdatainicial;
  obPromProd := TPromocaoProdutosCRM.create;
end;

destructor TCRM.destroy;
begin
  if obDev <> nil then
  begin
    obDev.Free;
    obDev := nil;
  end;
  if obDevReq <> nil then
  begin
    obDevReq.Free;
    obDevReq := nil;
  end;
  if obOrcamentoCli <> nil then
  begin
    obOrcamentoCli.Free;
    obOrcamentoCli := nil;
  end;
  if obFichaAcomp <> nil then
  begin
    obFichaAcomp.Free;
    obFichaAcomp := nil;
  end;
  if obCliCurvaABC <> nil then
  begin
    obCliCurvaABC.Free;
    obCliCurvaABC := nil;
  end;
  if obSugeServCli <> nil then
  begin
    obSugeServCli.Free;
    obSugeServCli := nil;
  end;
  inherited;
end;

function TCRM._retornaCodClientes(pCPFCNPJ: string): string;
begin
  result:= '(-1)';
  buscas.Close;
  if obCRM.TodasEmpresas then
    buscas.SQL.Text := 'select fps.cod_cliente from fichavendaprod_serv fps '+
      ' where fps.cpfcnpj=' +QuotedStr(trim(pCPFCNPJ))+
      ' group by fps.cod_cliente'
  else buscas.SQL.Text := 'select fps.cod_cliente from fichavendaprod_serv fps '+
         ' where fps.cpfcnpj=' +QuotedStr(trim(pCPFCNPJ))+
         ' and fps.cod_empresa = ' +vDadosIni.codEmpresa+
         ' group by fps.cod_cliente';
  buscas.Open;
  buscas.First;
  if buscas.IsEmpty then
    result:= '(-1)'
  else begin
    result := '(';
    while not buscas.eof do
    begin
      result:=result+buscas.FieldByName('COD_CLIENTE').AsString;
      buscas.Next;
      if buscas.eof then
        result:=result+')'
      else result:=result+',';
    end;
  end;
  buscas.close;
end;

function TCRM._validarData(pDataI,pDataF: string): boolean;
begin
  Fdatainicial := vDadosIni.getDataBanco(buscas);
  Fdatafinal := Fdatainicial;
  FdataBanco := Fdatainicial;

  result := true;
  if FFiltrarData then
  begin
    try
      Fdatainicial := StrToDate(pDataI);
    except
      Result := False;
      raiseExceptionCreate(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique a da inicial.'),'maskedit1');
      exit;
    end;
    try
      Fdatafinal := StrToDate(pDataF);
    except
      Result := False;
      raiseExceptionCreate(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique a da final.'),'maskedit1');
      exit;
    end;
  end;
end;

{ TColaborador_Ag_Red }

constructor TColaborador_Ag_Red.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsColR);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  transacao := TIBTransaction(dtmCRM.transacao);
end;

function TColaborador_Ag_Red._abreColaborador(pCOD_VENDEDOR: Integer): Boolean;
begin
  Result := montaSelect('select c.cod_vendedor, c.nome_vendedor, c.vendedor_tlv from colaborador c' +
    ' where c.cod_vendedor <> ' + IntToStr(pCOD_VENDEDOR) +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and c.vendedor_tlv = ''S''');
end;

{ TPromocaoProdutosCRM }

constructor TPromocaoProdutosCRM.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsProm);
  buscas := TIBQuery(dtmCRM.qrBuscas);
  transacao := TIBTransaction(dtmCRM.transacao);
  fDtSetTmp := TClientDataSet(dtmCRM.cdsPromTmp);
  fBuscasEst := TIBQuery(dtmCRM.qrBuscasEst);

  if fDtSetTmp.Tag <> 22 then
    try
      fDtSetTmp.CreateDataSet;
      fDtSetTmp.Tag := 22;
      fDtSetTmp.EmptyDataSet;
    except
    end;

  fDIAS_BASE_CONSULTA := vDadosIni.vEmp.vqtmessug * 30;
  fQTDE_MAX_REGISTROS := 20;
  fORDEM_QTDE := True;

  dataSet.AfterScroll := _ProdutosAfterScroll;
end;

function TPromocaoProdutosCRM._abrePromocoesParaCliente: Boolean;
begin
  /// Metodo responsavel por abrir os produtos que o cliente mais compra que estão em promoção
  ///  A quantidade de dias para verificar está no campo QTMESSUG do cadastro da empresa
  ///    Esta quantidade pode ser modificada pela tela
  ///  A quantidade de registros que irão aparecer por padrão são os 20 produtos com maior qtde de compras OU
  ///  A quantidade de registros que irão aparecer por padrão são os 20 produtos com maior soma de compras
  ///    Na tela também será possivel alter a qtde de registros

  vDadosIni.vdataGeral := vDadosIni.getDataBanco(buscas);

  dataSet.Close;
  if fQTDE_MAX_REGISTROS > 0 then
    dataSet.CommandText := 'select first ' + IntToStr(fQTDE_MAX_REGISTROS)
  else
    dataSet.CommandText := 'select' ;

  dataSet.CommandText := dataSet.CommandText + ' pr.grupo_prod, pr.cod_prod, pr.num_fab_prod, pr.descr_prod,' +
    ' case when tp.tipo = ''P'' then ''PROMOCAO ''||P.descr_promocao' +
    '   else ''DIFERENCIADO PARA ''||tp.descr_tipo||'' ''||' +
    '   case when coalesce(l.cod_localidade, 0) > 0 then l.localidade' +
    '     when coalesce(st.cod_setor, 0) > 0 then st.setor' +
    '     when coalesce(cd.cod_cidade, 0) > 0 then cd.nome_cidade' +
    '     else p.descr_promocao' +
    '   end' +
    ' end descricao,' +
    ' pr.prec_tab_prod,pr.prec_publico,' +
    ' case when pp.porcentagem > 0 then (pr.prec_tab_prod * ((100 - pp.porcentagem) / 100)) else pp.valor_promocao end valor_promocao, pp.porcentagem,' +
    ' tp.tipo, p.ordem, count(c.cod_cliente) quantidade, sum(pvp.quant_ped_item) soma' +
    ' from clientes c' +
    ' inner join pedvenda pv on pv.cod_cliente = c.cod_cliente and pv.cod_empresa = c.cod_empresa' +
    ' inner join pedvenda_prod pvp on pvp.nped = pv.nped and pvp.tipo = pv.tipo and pvp.cod_empresa = pv.cod_empresa' +
    ' inner join produtos pr on pr.grupo_prod = pvp.grupo_prod and pr.cod_prod = pvp.cod_prod and pr.cod_empresa = pvp.cod_empresa' +
    ' inner join promocao_produto pp on pr.grupo_prod = pp.grupo_prod and pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa' +
    ' inner join tipo_preco tp on tp.cod_tppreco = pp.cod_tppreco and tp.cod_empresa = pp.cod_empresa' +
    ' left join localidade l on l.cod_localidade = pp.cod_localidade and l.cod_empresa = pp.cod_empresa' +
    ' left join setor st on st.cod_setor = pp.cod_setor and st.cod_empresa = pp.cod_empresa' +
    ' left join cidades cd on cd.cod_cidade = pp.cod_cidade' +
    ' inner join promocao p on p.cod_promocao = pp.cod_promocao and p.cod_tppreco = pp.cod_tppreco and p.cod_empresa = pp.cod_empresa' +
    ' where c.cod_cliente = ' + IntToStr(fCOD_CLIENTE) +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and pv.data_fech >= :datainicial' +
    ' and pv.status_ped = ''FECHADA'' and coalesce(pvp.status,'''') <> ''CANCELADO''' +
    ' and ((pv.tipo = ''OS'' and pv.tipo_os in ' + vDadosIni.vTipoVendaOS + ') or ((pv.tipo = ''REQ'' and pv.tipv in ' + vDadosIni.vTipoVendaREQ + ')))' +
    ' and pr.ativo = 1 and' +
    ' (' +
    '   (tp.tipo = ''T'' and' +
    '     ((tp.descr_tipo = ''SETOR'' AND PP.cod_setor =  st.cod_setor ) or' +
    '       (TP.descr_tipo = ''LOCALIDADE'' AND PP.cod_localidade =  l.cod_localidade ) or' +
    '       (TP.descr_tipo = ''CIDADE'' AND PP.cod_cidade =  cd.cod_cidade)' +
    '     )' +
    '   )' +
    '   or' +
    '   ((tp.tipo = ''P'') and (pp.data_ini <= ' + vDadosIni.FusoSqlDateTime + ' and pp.data_fim >= ' + vDadosIni.FusoSqlDateTime + ')' +
    '   )' +
    ' )' +
    ' group by 1,2,3,4,5,6,7,8,9,10,11';
  if fORDEM_QTDE then
    dataSet.CommandText := dataSet.CommandText + ' order by 12 desc, tp.tipo, p.ordem'
  else
    dataSet.CommandText := dataSet.CommandText + ' order by 13 desc, tp.tipo, p.ordem';
  dataSet.Params[0].AsDate := vDadosIni.vdataGeral - fDIAS_BASE_CONSULTA;
  dataSet.Open;
end;

procedure TPromocaoProdutosCRM._ProdutosAfterScroll(DataSet: TDataSet);
var
  valorEstoque: real;
  vSomaEstoque: Extended;
begin
  vSomaEstoque := 0;
  if (vDadosIni.vEmp.vApresentarEstR = 'S') then
  begin
    buscas.Close;
    buscas.SQL.Text :=
      'select sum(pp.quant_ped_item) as somaEstoque from pedvenda_prod pp, pedvenda p' +
      ' where pp.cod_prod= ' + QuotedStr(trim(Self.dataSet.FieldByName('cod_prod').AsString)) +
      ' and pp.grupo_prod = ' + inttostr(Self.dataSet.FieldByName('grupo_prod').AsInteger) +
      ' and pp.nped = p.nped and pp.tipo = p.tipo and p.tipo <> ''ORC'' ' +
      'and (p.data_fech is null or p.data_fech < ''01/01/1899'') and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and pp.cod_empresa = p.cod_empresa and p.ativo=1 and (pp.status <> ''CANCELADO'' or pp.status is null ) ';
    buscas.open;

    vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;

    buscas.Close;
    buscas.SQL.Text :=
      'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as somaEstoque from producao pd, producao_item_indice pi' +
      ' where pi.grupo_prod = ' + IntToStr(Self.dataSet.FieldByName('grupo_prod').AsInteger) +
      ' and pi.cod_prod = ' + QuotedStr(Self.dataSet.FieldByName('cod_prod').AsString) +
      ' and pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa' +
      ' and (pd.data_fechamento is null) and pd.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    vSomaEstoque := vSomaEstoque + buscas.FieldByName('somaEstoque').AsFloat;
  end
  else if (vDadosIni.vEmp.vApresentarEstR = 'O') then
  begin
    buscas.Close;
    buscas.SQL.Text :=
      'select sum(pp.quant_ped_item) as somaEstoque from pedvenda_prod pp, pedvenda p' +
      ' where pp.cod_prod= ' + QuotedStr(trim(Self.dataSet.FieldByName('cod_prod').AsString)) +
      ' and pp.grupo_prod = ' + inttostr(Self.dataSet.FieldByName('grupo_prod').AsInteger) +
      ' and pp.nped = p.nped and pp.tipo = p.tipo and (p.data_fech is null or p.data_fech < ''01/01/1899'') and p.tipo=''OS''' +
      ' and pp.cod_empresa = p.cod_empresa and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo=1  and (pp.status <> ''CANCELADO'' or pp.status is null )';
    buscas.open;
    vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;
  end
  else if (vDadosIni.vEmp.vApresentarEstR = 'R') then
  begin
    buscas.Close;
    buscas.SQL.Text :=
      'select sum(pp.quant_ped_item) as somaEstoque from pedvenda_prod pp, pedvenda p' +
      ' where pp.cod_prod= ' + QuotedStr(trim(Self.dataSet.FieldByName('cod_prod').AsString)) +
      ' and pp.grupo_prod = ' + inttostr(Self.dataSet.FieldByName('grupo_prod').AsInteger) +
      ' and pp.nped = p.nped and pp.tipo = p.tipo and (p.data_fech is null or p.data_fech < ''01/01/1899'') and p.tipo=''REQ''' +
      ' and pp.cod_empresa = p.cod_empresa and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo=1  and (pp.status <> ''CANCELADO'' or pp.status is null )';
    buscas.open;
    vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;
  end
  else if (vDadosIni.vEmp.vApresentarEstR = 'P') then
  begin
    buscas.Close;
    buscas.SQL.Text :=
      'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as somaEstoque from producao pd, producao_item_indice pi' +
      ' where pi.grupo_prod = ' + IntToStr(Self.dataSet.FieldByName('grupo_prod').AsInteger) +
      ' and pi.cod_prod = ' + QuotedStr(Self.dataSet.FieldByName('cod_prod').AsString) +
      ' and pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa' +
      ' and (pd.data_fechamento is null) and pd.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select est_f from produtos' +
    ' where grupo_prod = ' + IntToStr(Self.dataSet.FieldByName('grupo_prod').AsInteger) +
    ' and cod_prod = ' + QuotedStr(Self.dataSet.FieldByName('cod_prod').AsString) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  valorEstoque := (buscas.FieldByName('est_f').asfloat - vSomaEstoque);

  fBuscasEst.Close;
  fBuscasEst.SQL.Text := 'select cast(:est_f as double precision) estoque from rdb$database';
  fBuscasEst.ParamByName('est_f').AsFloat := valorEstoque;
  fBuscasEst.Open;

end;

procedure TPromocaoProdutosCRM._selecionarItensParaVenda;
begin
  fDtSetTmp.EmptyDataSet;

  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('vender').AsInteger > 0 then
    begin
      fDtSetTmp.Insert;
      fDtSetTmp.FieldByName('tipo').AsString := 'PROMTLV';
      fDtSetTmp.FieldByName('vender').AsFloat := dataSet.FieldByName('vender').AsFloat;
      fDtSetTmp.FieldByName('GRUPO_PROD').AsInteger := dataSet.FieldByName('GRUPO_PROD').AsInteger;
      fDtSetTmp.FieldByName('COD_PROD').AsString := dataSet.FieldByName('COD_PROD').AsString;
      fDtSetTmp.FieldByName('NUM_FAB_PROD').AsString := dataSet.FieldByName('NUM_FAB_PROD').AsString;
      fDtSetTmp.Post;
    end;
    dataSet.Next;
  end;

  if fDtSetTmp.IsEmpty then
    vDadosIni.vDtSetTmp := nil
  else
    vDadosIni.vDtSetTmp := TClientDataSet(fDtSetTmp);

end;

{ TFichaAcompanhamento }
{
function TFichaAcompanhamento.AbrirFolhaVerificacaoCliente: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'MODVEICULO| ' + dataSet.FieldByName('MODELO').AsString;

  formulario := Funcoes.AbreForm('pkClientes', 'TFrmCadModVeiculosCCIA', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;
}

function TFichaAcompanhamento.AbrirFolhaVerificacaoCliente: boolean;
begin

end;
constructor TFichaAcompanhamento.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsFichaCli);
  transacao := TIBTransaction(dtmCRM.transacao);

  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrFichaCli.Database;
  buscas.Transaction := transacao;

  obCRM.databanco := vDadosIni.getDataBanco(buscas);
//  dataSet.IndexFieldNames:='TIPO;NPED;COD_EMPRESA';

  if obItensFichaAcomp = nil then
    obItensFichaAcomp := TItensFichaAcompanhamento.create;
  dataSet.AfterScroll := _FichaAcompanhamentoAfterScroll;
end;

destructor TFichaAcompanhamento.destroy;
begin
  inherited;
  if obItensFichaAcomp<>nil then
  begin
    obItensFichaAcomp.Free;
    obItensFichaAcomp :=nil;
  end;
end;
{
function TFichaAcompanhamento._abreCH(pCPFCNPJ: string): Boolean;
begin
  try
    result:=true;
    if obFichaCh = nil then
      obFichaCh := TFichaCh.create;
    obFichaCh.dataSet.Close;
    obFichaCh.dataSet.CommandText:=
      'Select ctrl.nome_ctrl,ch.N_CH,ch.DATA_REC,ch.DATA_VENC,ch.VALOR_CH,ch.DATQ_CH,ch.TIP_BAIXA,ch.CODIGO_EMP,case when coalesce(ch.datq_ch,asdasd)-ch.data_venc > 0 then ' +
      'coalesce(ch.datq_ch,asdasd)-ch.data_venc else 0 end as dias_atraso from ' +
      ' controle_cheque ch inner join controles ctrl on ch.codigo_ctrl = ctrl.codigo_ctrl '+
      ' and ch.codigo_emp = ctrl.codigo_emp '+
      ' where ch.cod_cliente in ' + _retornaCodClientes(pCPFCNPJ);

    if obCRM.FFiltrarData then
      obFichaCh.dataSet.CommandText := obFichaCh.dataSet.CommandText +' and ch.Data_rec >= :vdat1 and ch.Data_rec <= :vdat2 '
    else obFichaCh.dataSet.CommandText := obFichaCh.dataSet.CommandText +' and ch.Data_rec <= :vdat1 ' ;

    if obCRM.FTodasEmpresas then
      obFichaCh.dataSet.CommandText := obFichaCh.dataSet.CommandText + ' ORDER BY ch.DATA_VENC desc'
    else obFichaCh.dataSet.CommandText := obFichaCh.dataSet.CommandText + ' and ch.CODIGO_EMP = ' + vDadosIni.codEmpresa + ' ORDER BY ch.DATA_VENC desc';

    if obCRM.FFiltrarData then
    begin
      obFichaCh.dataSet.Params.ParamByName('vdat1').AsDate := obCRM.Fdatainicial;
      obFichaCh.dataSet.Params.ParamByName('vdat2').AsDate := obCRM.Fdatafinal;
    end else obFichaCh.dataSet.Params.ParamByName('vdat1').AsDate := obCRM.FdataBanco;
    obFichaCh.dataSet.Open;
  except
    result:= false;
  end;
end;
}
{
function TFichaAcompanhamento._abreCreditos(pCPFCNPJ: string): Boolean;
begin
  try
    result:=true;
    if obFichaCred = nil then
      obFichaCred := TFichaCred.create;
    obFichaCred.dataSet.Close;
    obFichaCred.dataSet.CommandText:= 'select ctrl.nome_ctrl,c.N_DOC_C,c.DATA_REC_C,' +
      ' c.DATA_VENC_C,c.VALOR_C,c.DATQ_C,c.DATA_BAIXA,c.TIP_BAIXA,c.CODIGO_EMP,c.HISTORICO_C,c.COD_CRED,' +
      'case when coalesce(c.data_baixa,asdasd)-c.data_venc_c > 0 then ' +
      'coalesce(c.data_baixa,asdasd)-c.data_venc_c else 0 end  as dias_atraso, c.N_DOC_V as NPED  from controle_creditos c inner join controles ctrl ' +
      ' on c.codigo_ctrl = ctrl.codigo_ctrl and c.codigo_emp = ctrl.codigo_emp ' +
      ' where c.cod_cliente in ' + _retornaCodClientes(pCPFCNPJ);

    if obCRM.FFiltrarData then
      obFichaCred.dataSet.CommandText := obFichaCred.dataSet.CommandText +' and c.DATA_REC_C >= :vdat1 and  c.DATA_REC_C <= :vdat2 '
    else obFichaCred.dataSet.CommandText := obFichaCred.dataSet.CommandText +' and c.DATA_REC_C <= :vdat1 ';

    if obCRM.FTodasEmpresas then
      obFichaCred.dataSet.CommandText := obFichaCred.dataSet.CommandText + ' ORDER BY c.DATA_VENC_C desc'
    else  obFichaCred.dataSet.CommandText := obFichaCred.dataSet.CommandText + ' and c.CODIGO_EMP = ' + vDadosIni.codEmpresa +' ORDER BY c.DATA_VENC_C desc';

    if obCRM.FFiltrarData then
    begin
      obFichaCred.dataSet.Params.ParamByName('vdat1').AsDate := obCRM.Fdatainicial;
      obFichaCred.dataSet.Params.ParamByName('vdat2').AsDate := obCRM.Fdatafinal;
    end else obFichaCred.dataSet.Params.ParamByName('vdat1').AsDate := obCRM.FdataBanco;

    obFichaCred.dataSet.open;
  except
    result := false;
  end;

end;
}
function TFichaAcompanhamento._abreFichaAcompanhamento(pDataI, pDataF,pCPFCNPJ: string;pAbrirVazio:boolean): Boolean;
begin
  result:=false;
  try
    vDadosIni.abreStatusProcessamento('','Abrindo dados da ficha do cliente.');
    if pAbrirVazio then
    begin
      result:= montaSelect(' select first 1 fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech, '+
            ' fps.cpfcnpj,fps.nome_cliente,fps.cod_empresa,flwp.codpesquisa,flwp.status from fichavendaprod_serv fps '+
            ' left join pedvenda pd on pd.nped = fps.nped and pd.tipo = fps.tipo and pd.cod_empresa = fps.cod_empresa ' +
            ' left join flw_pesquisa flwp '+
            ' on fps.tipo= flwp.tipo_ped and fps.cod_empresa=flwp.cod_empresa and fps.nped=flwp.nped '+
            ' where fps.cod_empresa=-1 ');
    end;
    if obCRM.FFiltrarData then
    begin
      try
        StrToDate(pDataI);
        StrToDate(pDataF);
        if obCRM.FTodasEmpresas then
          result:= montaSelect(' select fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,'+
            ' fps.cpfcnpj,fps.nome_cliente,fps.cod_empresa,flwp.codpesquisa,flwp.status from fichavendaprod_serv fps '+
            ' left join pedvenda pd on pd.nped = fps.nped and pd.tipo = fps.tipo and pd.cod_empresa = fps.cod_empresa ' +
            ' left join flw_pesquisa flwp '+
            ' on fps.tipo= flwp.tipo_ped and fps.cod_empresa=flwp.cod_empresa and fps.nped=flwp.nped '+
            ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ))+
            ' and fps.data_fech>=:dti and  fps.data_fech<=:dtf '+
            ' group by fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,fps.cpfcnpj,fps.nome_cliente,'+
            ' fps.cod_empresa,flwp.codpesquisa,flwp.status '+
            ' order by fps.cod_empresa,fps.tipo desc'
            ,StrToDate(pDataI),StrToDate(pDataF))
        else
        	result:= montaSelect(' select fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,'+
            ' fps.cpfcnpj,fps.nome_cliente,fps.cod_empresa,flwp.codpesquisa,flwp.status from fichavendaprod_serv fps '+
            ' left join pedvenda pd on pd.nped = fps.nped and pd.tipo = fps.tipo and pd.cod_empresa = fps.cod_empresa ' +
            ' left join flw_pesquisa flwp '+
            ' on fps.tipo= flwp.tipo_ped and fps.cod_empresa=flwp.cod_empresa and fps.nped=flwp.nped '+
            ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ))+
            ' and fps.data_fech>=:dti and  fps.data_fech<=:dtf and fps.cod_empresa='+vDadosIni.codEmpresa+
            ' group by fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,fps.cpfcnpj,fps.nome_cliente,'+
            ' fps.cod_empresa,flwp.codpesquisa,flwp.status '+
            ' order by fps.cod_empresa,fps.tipo desc '
            ,StrToDate(pDataI),StrToDate(pDataF));
      except
        Result := False;
        Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end
    else
    begin
      if obCRM.FTodasEmpresas then
        result:= montaSelect(' select fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,'+
          ' fps.cpfcnpj,fps.nome_cliente,fps.cod_empresa,flwp.codpesquisa,flwp.status from fichavendaprod_serv fps '+
          ' left join pedvenda pd on pd.nped = fps.nped and pd.tipo = fps.tipo and pd.cod_empresa = fps.cod_empresa ' +
          ' left join flw_pesquisa flwp '+
          ' on fps.tipo= flwp.tipo_ped and fps.cod_empresa=flwp.cod_empresa and fps.nped=flwp.nped '+
          ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ))+
          ' group by fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,fps.cpfcnpj,fps.nome_cliente,'+
          ' fps.cod_empresa,flwp.codpesquisa,flwp.status '+
          ' order by fps.cod_empresa,fps.tipo desc ')
      else
      	result:= montaSelect(' select fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,'+
          ' fps.cpfcnpj,fps.nome_cliente,fps.cod_empresa,flwp.codpesquisa,flwp.status from fichavendaprod_serv fps '+
          ' left join pedvenda pd on pd.nped = fps.nped and pd.tipo = fps.tipo and pd.cod_empresa = fps.cod_empresa ' +
          ' left join flw_pesquisa flwp '+
          ' on fps.tipo= flwp.tipo_ped and fps.cod_empresa=flwp.cod_empresa and fps.nped=flwp.nped '+
          ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ))+
          ' and fps.cod_empresa='+vDadosIni.codEmpresa+
          ' group by fps.nome_emp,fps.tipo,fps.nped,pd.valor_total,fps.data_fech,fps.cpfcnpj,fps.nome_cliente,'+
          ' fps.cod_empresa,flwp.codpesquisa,flwp.status '+
          ' order by fps.cod_empresa,fps.tipo desc');
    end;
  finally
    if IsEmpty then
      obItensFichaAcomp._abreItensFichaAcompanhamento(pDataI,pDataF,'VAZIO');
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TFichaAcompanhamento._existePesquisa(pCodigo: integer;
  pTipoPesquisa: string): boolean;
begin
  result:=false;
  if not ((trim(pTipoPesquisa)='REQ') or (trim(pTipoPesquisa)='OS')) then
  begin
    Application.MessageBox(PChar('Pesquisas de atendimento são resalizadas apenas para pedidos de venda do tipo REQ ou OS.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  result:=ExecutaComandosSql(' select * from flw_pesquisa ' +
  	' where tipo = ''F'' ' +
    ' and tipo_ped = ' + QuotedStr(trim(pTipoPesquisa)) +
    ' and nped = ' + IntToStr(pCodigo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
    
  if not result then
    Application.MessageBox(PChar('Pesquisa de atendimento ainda não realizada para o pedido:'+chr(13)+pTipoPesquisa+' - '+inttostr(pCodigo)+'.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
end;

{
function TFichaAcompanhamento._abreRecibos(pCPFCNPJ: string): Boolean;
begin
  try
    result:=true;
    if obFichaRec = nil then
      obFichaRec := TFichaRec.create;
    obFichaRec.dataSet.Close;
    obFichaRec.dataSet.CommandText := 'Select * from recibos '+
      ' where cod_benef in ' +_retornaCodClientes(pCPFCNPJ) +
      ' and RECANT = ''S'' ';
    if not obCRM.FTodasEmpresas then
      obFichaRec.dataSet.CommandText := obFichaRec.dataSet.CommandText +' and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ativo = 1'
    else obFichaRec.dataSet.CommandText := obFichaRec.dataSet.CommandText + ' and ativo = 1';
    obFichaRec.dataSet.open;
  except
    result:= false;
  end;
end;
}
procedure TFichaAcompanhamento._FichaAcompanhamentoAfterScroll(
  DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
   obItensFichaAcomp.montaSelect('select * from FICHAVENDAPROD_SERV fps'+
    ' where fps.tipo = ''ZZZ'' ' +
    ' and fps.NPED = 0 ' +
    ' and fps.cod_empresa='+vDadosIni.codEmpresa);
   exit;
  end;
  obItensFichaAcomp.montaSelect('select * from FICHAVENDAPROD_SERV fps'+
    ' where fps.cpfcnpj = '+QuotedStr(trim(DataSet.FieldByName('CPFCNPJ').AsString))+
    ' and fps.tipo = '+QuotedStr(trim(DataSet.FieldByName('TIPO').AsString))+
    ' and fps.NPED = '+DataSet.FieldByName('NPED').AsString+
    ' and fps.cod_empresa='+DataSet.FieldByName('COD_EMPRESA').AsString);
//  if not(obFichaCred = nil) then
//    if obFichaCred.Active then
//      obFichaCred.dataSet.Locate('NPED',DataSet.FieldByName('NPED').Asinteger,[]);
//  if obFichaCh.Active then
//    obFichaCh.dataSet.Locate('NPED',DataSet.FieldByName('NPED').Asinteger,[]);
//  if obFichaRec.Active then
//    obFichaRec.dataSet.Locate('NPED',DataSet.FieldByName('NPED').Asinteger,[]);
end;

function TFichaAcompanhamento._retornaCodClientes(pCPFCNPJ: string): string;
begin
  result:= 'null';
  buscas.Close;
  if obCRM.TodasEmpresas then
    buscas.SQL.Text := 'select fps.cod_cliente from fichavendaprod_serv fps '+
      ' where fps.cpfcnpj=' +QuotedStr(trim(pCPFCNPJ))+
      ' group by fps.cod_cliente'
  else
  	buscas.SQL.Text := 'select fps.cod_cliente from fichavendaprod_serv fps '+
      ' where fps.cpfcnpj=' +QuotedStr(trim(pCPFCNPJ))+
      ' and fps.cod_empresa = ' +vDadosIni.codEmpresa+
      ' group by fps.cod_cliente';
  buscas.Open;
  buscas.First;
  if buscas.IsEmpty then
    result:= 'null'
  else begin
    result := '(';
    while not buscas.eof do
    begin
      result:=result+buscas.FieldByName('COD_CLIENTE').AsString;
      buscas.Next;
      if buscas.eof then
        result:=result+')'
      else result:=result+',';
    end;
  end;
  buscas.close;
end;

{ TItensFichaAcompanhamento }

constructor TItensFichaAcompanhamento.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsItensFicha);
  buscas := TIBQuery(dtmCRM.qrItensFicha);
  transacao := TIBTransaction(dtmCRM.transacao);
end;

function TItensFichaAcompanhamento._abreItensFichaAcompanhamento(pDataI, pDataF,
  pCPFCNPJ: string): Boolean;
begin
  result:=false;
  if obCRM.FFiltrarData then
  begin
    try
      StrToDate(pDataI);
      StrToDate(pDataF);
      if obCRM.FTodasEmpresas then
        result:= montaSelect('select * from FICHAVENDAPROD_SERV fps'+
          ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ))+
          ' and fps.data_fech>=:dti and  fps.data_fech<=:dtf and fps.cod_empresa='+vDadosIni.codEmpresa
          ,StrToDate(pDataI),StrToDate(pDataF))
      else  result:= montaSelect('select * from FICHAVENDAPROD_SERV fps'+
          ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ))+
          ' and fps.data_fech>=:dti and  fps.data_fech<=:dtf' ,StrToDate(pDataI),StrToDate(pDataF));
    except
      Result := False;
      Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  end else begin
    if obCRM.FTodasEmpresas then
      result:= montaSelect('select * from FICHAVENDAPROD_SERV fps'+
        ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ)))
    else  result:= montaSelect('select * from FICHAVENDAPROD_SERV fps'+
        ' where fps.cpfcnpj = '+QuotedStr(trim(pCPFCNPJ))+
        ' and fps.cod_empresa='+vDadosIni.codEmpresa);
  end;
end;


{ TVendasPerdidas }

constructor TVendasPerdidas.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsVP);
  transacao := TIBTransaction(dtmCRM.transacao);

  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrVP.Database;
  buscas.Transaction := transacao;
end;

destructor TVendasPerdidas.destroy;
begin

  inherited;
end;

function TVendasPerdidas._abrirVendasPerdidas(pCodCli: integer;pDataI,pDataF: string): boolean;
begin
  result:=false;
  try
    vDadosIni.abreStatusProcessamento('','Abrindo vendas perdidas do cliente.');
    if obCRM.FFiltrarData then
    begin
      try
        StrToDate(pDataI);
        StrToDate(pDataF);
        result:= montaSelect(' select * from venda_perdida vp '+
          ' inner join tipovp tvp '+
          ' on vp.codigo_vp = tvp.codigo_vp and vp.cod_empresa=tvp.cod_empresa '+
          ' where vp.cod_cliente = '+inttostr(pCodCli)+
          ' and vp.data_vnp>=:dti and vp.data_vnp<=:dtf '+
          ' and vp.cod_empresa = '+ vDadosIni.codEmpresa+
          ' and vp.ativo = 1 '+
          ' order by SEQVP '
          ,StrToDate(pDataI),StrToDate(pDataF));
      except
        Result := False;
        Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end else begin
      result:= montaSelect(' select * from venda_perdida vp '+
        ' inner join tipovp tvp '+
        ' on vp.codigo_vp = tvp.codigo_vp and vp.cod_empresa=tvp.cod_empresa '+
        ' where vp.cod_cliente = '+inttostr(pCodCli)+
        ' and vp.cod_empresa = '+ vDadosIni.codEmpresa+
        ' and vp.ativo = 1 '+
        ' order by SEQVP ');
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TCurvaABCCliente }

constructor TCurvaABCCliente.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsRankCli);
  transacao := TIBTransaction(dtmCRM.transacao);

  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrRankCli.Database;
  buscas.Transaction := transacao;
  vClCli.vCLQTDCOMPRA:='';
  vClCli.vCLQTDVEICULO:='';
  vClCli.vCLSOMACOMPRA:='';
  vClCli.vCLSOMAVEICULO:='';
  vClCli.vCLULTIMACOMPRA:='';
  vClCli.vCLULTIMOVEICULO:='';
  vClCli.vCLATRASOCOMPRA:='';
  vClCli.vCLLUCROCLIENTE:='';
  vClCli.vCLLUCROVEICULO:='';
  vClCli.vTipoCliP:=true;
  vClCli.vTipoCliV:=true;
  vClCli.vTipoCliS:=true;
end;

destructor TCurvaABCCliente.destroy;
begin

  inherited;
end;

function TCurvaABCCliente._abrirClientesCurvaABC(pCodCli: integer): boolean;
begin
  result:=false;
  try
    vDadosIni.abreStatusProcessamento('','Abrindo dados do cliente.');
    try
      if pCodCli=0 then
        result:= montaSelect(' select * from clientes c '+
          ' where c.cod_empresa = '+ vDadosIni.codEmpresa+
          ' and c.ativo = 1 ')
      else  result:= montaSelect(' select * from clientes c '+
        ' where c.cod_cliente = '+inttostr(pCodCli)+
        ' and c.cod_empresa = '+ vDadosIni.codEmpresa+
        ' and c.ativo = 1 ');
    except
      Result := False;
      Application.MessageBox(PChar('Erro ao abrir dados do cliente.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;


function TCurvaABCCliente._montarRankingCliente(pCLQTDCOMPRA,pCLSOMACOMPRA,
  pCLULTIMACOMPRA, pCLATRASOCOMPRA, pCLLUCROCLIENTE,pNomeCli: string; pTipoCliP,
  pTipoCliV, pTipoCliS,pJuncaoTipoCli_E,pPessoaFisica,pPessoaJuridica: boolean): boolean;
var
  sqlTemp:string;
begin
  result := false;
  pCLQTDCOMPRA := trim(pCLQTDCOMPRA);
  pCLSOMACOMPRA := trim(pCLSOMACOMPRA);
  pCLULTIMACOMPRA := trim(pCLULTIMACOMPRA);
  pCLATRASOCOMPRA := trim(pCLATRASOCOMPRA);
  pCLLUCROCLIENTE :=trim(pCLLUCROCLIENTE);
  pNomeCli := trim(pNomeCli);
  if obCRM.FTodasEmpresas then
    sqlTemp:='select * from Clientes where ativo = 1 '
  else sqlTemp:='select * from Clientes where cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1 ';
  if pTipoCliP and pTipoCliV and pTipoCliS and pJuncaoTipoCli_E then
    sqlTemp := sqlTemp +' and tipocliente = ''P|V|S'' '
  else if pTipoCliP and pTipoCliV and pJuncaoTipoCli_E then
    sqlTemp := sqlTemp +' and tipocliente = ''P|V'' '
  else if pTipoCliP and pTipoCliS and pJuncaoTipoCli_E then
    sqlTemp := sqlTemp +' and tipocliente = ''P|S'' '
  else if pTipoCliV and pTipoCliS and pJuncaoTipoCli_E then
    sqlTemp := sqlTemp +' and tipocliente = ''V|S'' '
  else if pTipoCliP and pTipoCliV and pTipoCliS then
    sqlTemp := sqlTemp +' and (tipocliente like ''%P%''  or tipocliente like ''%V%''  or tipocliente like ''%S%'') '
  else if pTipoCliP and pTipoCliV then
    sqlTemp := sqlTemp +' and (tipocliente like ''%P%''  or tipocliente like ''%V%'') '
  else if pTipoCliP and pTipoCliS then
    sqlTemp := sqlTemp +' and (tipocliente like ''%P%''  or tipocliente like ''%S%'') '
  else if pTipoCliV and pTipoCliS then
    sqlTemp := sqlTemp +' and (tipocliente like ''%V%''  or tipocliente like ''%S%'') '
  else if pTipoCliP then
    sqlTemp := sqlTemp +' and tipocliente = ''P'' '
  else if pTipoCliV then
    sqlTemp := sqlTemp +' and tipocliente = ''V'' '
  else if pTipoCliS then
    sqlTemp := sqlTemp +' and tipocliente = ''S'' ';
  //Quantidade de Compra de Clientes de Peça, Serviços e os de veículos
  if Trim(pCLQTDCOMPRA) <> '' then
  begin
    if (pTipoCliS or  pTipoCliP) and (pTipoCliV) then
      sqlTemp := sqlTemp +' and CLQTDCOMPRA = '+QuotedStr(pCLQTDCOMPRA)+' and CLQTDVEICULO = '+QuotedStr(pCLQTDCOMPRA)
    else if pTipoCliV then
      sqlTemp := sqlTemp +' and CLQTDVEICULO = '+QuotedStr(pCLQTDCOMPRA)
    else sqlTemp := sqlTemp +' and CLQTDCOMPRA = '+QuotedStr(pCLQTDCOMPRA);
  end;
  //Soma das Compra de Clientes de Peça, Serviços e os de veículos
  if Trim(pCLSOMACOMPRA) <> '' then
  begin
    if (pTipoCliS or  pTipoCliP) and (pTipoCliV) then
      sqlTemp := sqlTemp +' and CLSOMACOMPRA = '+QuotedStr(pCLSOMACOMPRA)+' and CLSOMAVEICULO = '+QuotedStr(pCLSOMACOMPRA)
    else if pTipoCliV then
      sqlTemp := sqlTemp +' and CLSOMAVEICULO = '+QuotedStr(pCLSOMACOMPRA)
    else sqlTemp := sqlTemp +' and CLSOMACOMPRA = '+QuotedStr(pCLSOMACOMPRA);
  end;
  //Última Compra de Clientes de Peça, Serviços e os de veículos
  if Trim(pCLULTIMACOMPRA) <> '' then
  begin
    if (pTipoCliS or  pTipoCliP) and (pTipoCliV) then
      sqlTemp := sqlTemp +' and CLULTIMACOMPRA = '+QuotedStr(pCLULTIMACOMPRA)+' and CLULTIMOVEICULO = '+QuotedStr(pCLULTIMACOMPRA)
    else if pTipoCliV then
      sqlTemp := sqlTemp +' and CLULTIMOVEICULO = '+QuotedStr(pCLULTIMACOMPRA)
    else sqlTemp := sqlTemp +' and CLULTIMACOMPRA = '+QuotedStr(pCLULTIMACOMPRA)
  end;
  //O atraso de compra não está sendo avaliado no caso de veículos
  if Trim(pCLATRASOCOMPRA) <> '' then
    sqlTemp := sqlTemp +' and CLATRASOCOMPRA = '+QuotedStr(pCLATRASOCOMPRA);

  //Lucratividade de Clientes de Peça, serviços e os de veículos
  if Trim(pCLLUCROCLIENTE) <> '' then
  begin
    if (pTipoCliS or  pTipoCliP) and (pTipoCliV) then
      sqlTemp := sqlTemp +' and CLLUCROCLIENTE = '+QuotedStr(pCLLUCROCLIENTE)+' and CLLUCROVEICULO = '+QuotedStr(pCLLUCROCLIENTE)
    else if pTipoCliV then
      sqlTemp := sqlTemp +' and CLLUCROVEICULO = '+QuotedStr(pCLLUCROCLIENTE)
    else sqlTemp := sqlTemp +' and CLLUCROCLIENTE = '+QuotedStr(pCLLUCROCLIENTE)
  end;
  if pNomeCli <> '' then
    sqlTemp := sqlTemp +' and NOME_CLIENTE LIKE '+QuotedStr('%'+pNomeCli+'%');

  if pPessoaFisica and not pPessoaJuridica then
    sqlTemp := sqlTemp +' and strlen(ltrim(rtrim(cpfcgc))) <= 11 '
  else if not pPessoaFisica and pPessoaJuridica then
    sqlTemp := sqlTemp +' and strlen(ltrim(rtrim(cpfcgc))) > 11 ';

  sqlTemp := sqlTemp +'  Order by Nome_Cliente';
//  if pos('WHERE', FrPrincipal.QrPesquisaCliente.SQL.Text) > 0 then
//    sqlTemp := sqlTemp +' and COD_EMPRESA in ('+Empresas+') Order by Nome_Cliente')
//  else
//  sqlTemp := sqlTemp +' WHERE COD_EMPRESA in ('+Empresas+') Order by Nome_Cliente');
  result := montaSelect(sqlTemp);

end;

{ TOrcamentosCli }

constructor TOrcamentosCli.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsOrcCli);
  transacao := TIBTransaction(dtmCRM.transacao);

  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrOrcCli.Database;
  buscas.Transaction := transacao;

  obCRM.databanco := vDadosIni.getDataBanco(buscas);
  if obItensOrcamentosCli = nil then
    obItensOrcamentosCli := TItensOrcamentosCli.create;
  dataSet.AfterScroll := _OrcamentosCliAfterScroll;
end;

destructor TOrcamentosCli.destroy;
begin
  if obItensOrcamentosCli<>nil then
  begin
    obItensOrcamentosCli.Free;
    obItensOrcamentosCli :=nil;
  end;
  inherited;
end;

function TOrcamentosCli._abreOrcamentosCli(pCodCli: Integer): Boolean;
begin
  result:=false;
  try
    vDadosIni.abreStatusProcessamento('','Abrindo orçamentos do cliente.');
    if obCRM.FFiltrarData then
    begin
      try
        result:= montaSelect('select * from pedvenda v '+
            ' where v.cod_cliente = '+inttostr(pCodCli)+
            ' and v.data_ped>=:dti and v.data_ped<=:dtf '+
            ' and v.cod_empresa = '+vDadosIni.codEmpresa+
            ' and v.tipo = '+QuotedStr('ORC')+
            ' order by v.nped desc'
            ,obCRM.datainicial,obCRM.datafinal);
      except
        Result := False;
        Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end else begin
        result:= montaSelect('select * from pedvenda v '+
            ' where v.cod_cliente = '+inttostr(pCodCli)+
            ' and v.cod_empresa = '+vDadosIni.codEmpresa+
            ' and v.tipo = '+QuotedStr('ORC')+
            ' order by v.nped desc');
    end;
  finally
//    if IsEmpty then
//      obItensOrcamentosCli._abreItensOrcamentosCli(dataSet.FieldByName('NPED').AsInteger,dataSet.FieldByName('NPREVENDA').AsInteger,pCodCli);
    obItensOrcamentosCli._abreItensOrcamentosCli({dataSet.FieldByName('NPREVENDA').AsInteger,}pCodCli);
    First;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TOrcamentosCli._OrcamentosCliAfterScroll(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
    obItensOrcamentosCli.dataSet.Filtered := False;
  	 obItensOrcamentosCli.dataSet.Filter := '((NPED = 0 and tipo = ''ZZZ'')) '; 
  	 obItensOrcamentosCli.dataSet.Filtered := True;
    exit;
  end;
  obItensOrcamentosCli.dataSet.Filtered := False;
  obItensOrcamentosCli.dataSet.Filter := '((NPED = '+inttostr(DataSet.FieldByName('NPED').AsInteger)+
    ' and tipo = '+QuotedStr(trim(DataSet.FieldByName('TIPO').AsString)) +') or '+
    ' (NPED_ORIGEM = '+inttostr(DataSet.FieldByName('NPED').AsInteger)+
    ' and TIPO_ORIGEM = '+QuotedStr(trim(DataSet.FieldByName('TIPO').AsString)) +') or '+
    ' (DAV_ORIGEM = '+inttostr(DataSet.FieldByName('NPREVENDA').AsInteger) +') )';
  obItensOrcamentosCli.dataSet.Filtered := True;
end;

{ TItensOrcamentosCli }

constructor TItensOrcamentosCli.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsItOrcCli);
  transacao := TIBTransaction(dtmCRM.transacao);

  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrOrcCli.Database;
  buscas.Transaction := transacao;
end;

function TItensOrcamentosCli._abreItensOrcamentosCli(pCodCli: integer): Boolean;
begin
  result:=false;
  try
    vDadosIni.abreStatusProcessamento('','Abrindo itens relacionados.');
    if obCRM.FFiltrarData then
    begin
      try
        result:= montaSelect('select mps.* from movimentosprodserv mps '+
          ' where mps.data_ped>=:dti and mps.data_ped<=:dtf '+
          ' and mps.cod_cliente = '+inttostr(pCodCli)+
          ' and mps.cod_empresa='+vDadosIni.codEmpresa +
          ' order by mps.tipo ' , obCRM.datainicial,obCRM.datafinal);
      except
        Result := False;
        Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end
    else
    begin
      result:= montaSelect('select mps.* from movimentosprodserv mps '+
          ' where mps.cod_cliente = '+inttostr(pCodCli)+
          ' and mps.cod_empresa='+vDadosIni.codEmpresa +
          ' order by mps.tipo ');
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
//    dataSet.Filtered := False;
//    dataSet.Filter := '((NPED = '+inttostr(DataSet.FieldByName('NPED').AsInteger)+
//      ' and tipo = '+QuotedStr(trim(DataSet.FieldByName('TIPO').AsString)) +') or '+
//      ' (NPED_ORIGEM = '+inttostr(DataSet.FieldByName('NPED').AsInteger)+
//      ' and TIPO_ORIGEM = '+QuotedStr(trim(DataSet.FieldByName('TIPO').AsString)) +') or '+
//      ' (DAV_ORIGEM = '+inttostr(DataSet.FieldByName('NPREVENDA').AsInteger) +') )';
//    dataSet.Filtered := True;
  end;
end;

{ TSugestaoServicos }

constructor TSugestaoServicos.create;
var
  i:integer;
begin
  dataSet := TClientDataSet(dtmCRM.cdsSugServ);
  transacao := TIBTransaction(dtmCRM.transacao);
  buscas  := TIBQuery.Create(Application);
  buscas.Database := dtmCRM.qrSugServ.Database;
  buscas.Transaction := transacao;

  vClassesCl.vCLQTDCOMPRA:='';
  vClassesCl.vCLQTDVEICULO:='';
  vClassesCl.vCLSOMACOMPRA:='';
  vClassesCl.vCLSOMAVEICULO:='';
  vClassesCl.vCLULTIMACOMPRA:='';
  vClassesCl.vCLULTIMOVEICULO:='';
  vClassesCl.vCLATRASOCOMPRA:='';
  vClassesCl.vCLLUCROCLIENTE:='';
  vClassesCl.vCLLUCROVEICULO:='';
  vClassesCl.vTipoCliP:=true;
  vClassesCl.vTipoCliV:=true;
  vClassesCl.vTipoCliS:=true;

  buscas.close;
  buscas.SQL.text:='select first 1 * from temp_sug_serv_cl where cod_empresa =-1 and ativo = 1 order by nome_cliente';
  buscas.open;
  if fDtSet = nil then
    fDtSet := TClientDataSet.Create(nil);
  fDtSet.Close;
  fDtSet.FieldDefs.Clear;
  for I := 0 to buscas.FieldDefs.Count - 1 do
    fDtSet.FieldDefs.Add(
      buscas.FieldDefs[i].Name,
      buscas.FieldDefs[i].DataType,
      buscas.FieldDefs[i].Size,
      false);
  fDtSet.FieldDefs.Add('NEC_ACOMP', ftString, 1, false);
  fDtSet.CreateDataSet;

//  TFloatField(dataSet.FieldByName('VALOR_UN_SERV')).currency := false;
  TIntegerField(fDtSet.FieldByName('COD_CLIENTE')).DisplayLabel := 'Cod.Cliente';
  fDtSet.FieldByName('COD_EMPRESA').Visible := false;
  fDtSet.FieldByName('ATIVO').Visible := false;
  TStringField(fDtSet.FieldByName('NOME_CLIENTE')).DisplayLabel := 'Cliente';
  TDateTimeField(fDtSet.FieldByName('DATA_ULT_COMPRA')).DisplayLabel := 'Última Compra';
  TDateTimeField(fDtSet.FieldByName('DATA_ULT_SERV')).DisplayLabel := 'Último Serviço';
  TStringField(fDtSet.FieldByName('FONE_CLIENTE')).DisplayLabel := 'Fone';
  TStringField(fDtSet.FieldByName('EMAIL')).DisplayLabel := 'Email';
  TStringField(fDtSet.FieldByName('CLQTDCOMPRA')).DisplayLabel := 'Classe Qtd Compra';
  TStringField(fDtSet.FieldByName('CLSOMACOMPRA')).DisplayLabel := 'Classe Soma Compras';
  TStringField(fDtSet.FieldByName('CLULTIMACOMPRA')).DisplayLabel := 'Classe Últimas Compras';
  TStringField(fDtSet.FieldByName('CLATRASOCOMPRA')).DisplayLabel := 'Classe Atraso Compras';
  TStringField(fDtSet.FieldByName('CLLUCROCLIENTE')).DisplayLabel := 'Classe Lucro Cliente';
  TStringField(fDtSet.FieldByName('ENDERECO')).DisplayLabel := 'Endereço';
  TStringField(fDtSet.FieldByName('BAIRRO')).DisplayLabel := 'Bairro';
  TStringField(fDtSet.FieldByName('CIDADE')).DisplayLabel := 'Cidade';
  TStringField(fDtSet.FieldByName('CEP')).DisplayLabel := 'CEP';
  TFloatField(fDtSet.FieldByName('LUCROCLIENTE')).DisplayLabel := 'Lucro Cliente';
  TFloatField(fDtSet.FieldByName('V_Q_COMPRA')).DisplayLabel := 'Qtd Compras';
  TFloatField(fDtSet.FieldByName('M_Q_COMPRA')).DisplayLabel := 'Média Qtd Compras';
  TFloatField(fDtSet.FieldByName('V_T_COMPRA')).DisplayLabel := 'Valor Total Compras';
  TFloatField(fDtSet.FieldByName('M_T_COMPRA')).DisplayLabel := 'Média Valor Compras';
  TFloatField(fDtSet.FieldByName('V_L_COMPRA')).DisplayLabel := 'Lucro Compras';
  TFloatField(fDtSet.FieldByName('M_L_COMPRA')).DisplayLabel := 'Média Lucro Compras';
  TFloatField(fDtSet.FieldByName('V_A_COMPRA')).DisplayLabel := 'Qtd Dias Atraso';
  TFloatField(fDtSet.FieldByName('M_A_COMPRA')).DisplayLabel := 'Média dias Atraso';

  TFloatField(fDtSet.FieldByName('LUCROCLIENTE')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('V_Q_COMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('M_Q_COMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('V_T_COMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('M_T_COMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('V_L_COMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('M_L_COMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('V_A_COMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(fDtSet.FieldByName('M_A_COMPRA')).DisplayFormat := '#,##0.00';

  TIntegerField(fDtSet.FieldByName('CODIGO_UF')).DisplayLabel := 'Cod.UF';
  TIntegerField(fDtSet.FieldByName('COD_CIDADE')).DisplayLabel := 'Cod.Cidade';
  TIntegerField(fDtSet.FieldByName('COD_BAIRRO')).DisplayLabel := 'Cod.Bairro';
  TDateTimeField(fDtSet.FieldByName('DATA_ULT_CONTATO')).DisplayLabel := 'Último Serviço';
  fDtSet.Open;

  if fdsSugeServ = nil then
    fdsSugeServ := TDataSource.Create(nil);
  fdsSugeServ.DataSet := fDtSet;
  buscas.close;
  buscas.SQL.text:='select first 1 * from temp_sug_serv where cod_empresa =-1 and ativo = 1 order by nome_cliente';
  buscas.open;
  if fDtSetV = nil then
  fDtSetV := TClientDataSet.Create(nil);
  fDtSetV.Close;
  fDtSetV.FieldDefs.Clear;
  for I := 0 to buscas.FieldDefs.Count - 1 do
    fDtSetV.FieldDefs.Add(
      buscas.FieldDefs[i].Name,
      buscas.FieldDefs[i].DataType,
      buscas.FieldDefs[i].Size,
      false);
  fDtSetV.CreateDataSet;
  TIntegerField(fDtSetV.FieldByName('COD_CLIENTE')).DisplayLabel := 'Cod.Cliente';
  fDtSetV.FieldByName('COD_EMPRESA').Visible := false;
  fDtSetV.FieldByName('ATIVO').Visible := false;
  TStringField(fDtSetV.FieldByName('NOME_CLIENTE')).DisplayLabel := 'Cliente';
  TStringField(fDtSetV.FieldByName('DESC_VEICULO')).DisplayLabel := 'Descrição do Veículo';
  TIntegerField(fDtSetV.FieldByName('ANO_MOD_V')).DisplayLabel := 'Ano Modelo';
  TIntegerField(fDtSetV.FieldByName('ANO_FAB_V')).DisplayLabel := 'Ano Fabricação';
  TStringField(fDtSetV.FieldByName('COR_V')).DisplayLabel := 'Cor';
  TDateTimeField(fDtSetV.FieldByName('DATA_COMPRA')).DisplayLabel := 'Data Compra';
  TDateTimeField(fDtSetV.FieldByName('DATA_ULT_SERV')).DisplayLabel := 'Data Último Serv.';
  TIntegerField(fDtSetV.FieldByName('KM_SUG_V')).DisplayLabel := 'KM Previsto Serviço';
  TStringField(fDtSetV.FieldByName('FONE_CLIENTE')).DisplayLabel := 'Fone Cliente';
  TStringField(fDtSetV.FieldByName('EMAIL')).DisplayLabel := 'Email';
  TStringField(fDtSetV.FieldByName('ENDERECO')).DisplayLabel := 'Endereço';
  TStringField(fDtSetV.FieldByName('BAIRRO')).DisplayLabel := 'Bairro';
  TStringField(fDtSetV.FieldByName('CIDADE')).DisplayLabel := 'Cidade';
  TStringField(fDtSetV.FieldByName('CEP')).DisplayLabel := 'CEP';
  TIntegerField(fDtSetV.FieldByName('CODIGO_UF')).DisplayLabel := 'Cod.UF';
  TIntegerField(fDtSetV.FieldByName('COD_CIDADE')).DisplayLabel := 'Cod.Cidade';
  TIntegerField(fDtSetV.FieldByName('COD_BAIRRO')).DisplayLabel := 'Cod.Bairro';
  TDateTimeField(fDtSetV.FieldByName('DATA_ULT_CONTATO')).DisplayLabel := 'Data Último Contato';
//  TIntegerField(fDtSetV.FieldByName('N_SUG_SERV')).DisplayLabel := 'Código Sugestão';
  fDtSetV.FieldByName('N_SUG_SERV').Visible := false;
  TIntegerField(fDtSetV.FieldByName('COD_VEICULO')).DisplayLabel := 'Cod.Veículo';
  TIntegerField(fDtSetV.FieldByName('COD_VEICULO')).index:=1;
//  TIntegerField(fDtSetV.FieldByName('N_SUG_SERV')).Index:=21;
  fDtSet.Open;
  if fdsSugeServVeic = nil then
    fdsSugeServVeic := TDataSource.Create(nil);
  fdsSugeServVeic.DataSet := fDtSetV;
  buscas.Close;
end;

destructor TSugestaoServicos.destroy;
begin
//
  inherited;
end;

procedure TSugestaoServicos.filtrarServicoSug(pDataIni,pDataFim:string);
begin
  if (fDtSet = nil) or not(fDtSet.Active) then
    exit;
  fDtSet.Filter:='';
  CLQTDCOMPRA := trim(CLQTDCOMPRA);
  CLSOMACOMPRA := trim(CLSOMACOMPRA);
  CLULTIMACOMPRA := trim(CLULTIMACOMPRA);
  CLATRASOCOMPRA := trim(CLATRASOCOMPRA);
  CLLUCROCLIENTE :=trim(CLLUCROCLIENTE);

  if fExcecaoData then
  begin
    try
      StrToDate(pDataIni);
    except
      raiseExceptionCreate(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique a da inicial.'),'maskedit1');
      exit;
    end;
    try
      StrToDate(pDataFim);
    except
      raiseExceptionCreate(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique a da final.'),'maskedit1');
      exit;
    end;
  end;

  if Nec_acomp then
    fDtSet.Filter:= fDtSet.Filter +' nec_acomp = ''S'' ';

//  if excecaoData then
//    if fDtSet.Filter = '' then
//      fDtSet.Filter:= fDtSet.Filter +' CLLUCROCLIENTE = '+quotedstr(CLLUCROCLIENTE)
//    else fDtSet.Filter:= fDtSet.Filter +' and CLLUCROCLIENTE = '+quotedstr(CLLUCROCLIENTE);

  if not (CLQTDCOMPRA='') then
    if fDtSet.Filter = '' then
      fDtSet.Filter:= fDtSet.Filter +' CLQTDCOMPRA = '+quotedstr(CLQTDCOMPRA)
    else fDtSet.Filter:= fDtSet.Filter +' and CLQTDCOMPRA = '+quotedstr(CLQTDCOMPRA);

  if not (CLSOMACOMPRA='') then
    if fDtSet.Filter = '' then
      fDtSet.Filter:= fDtSet.Filter +' CLSOMACOMPRA = '+quotedstr(CLSOMACOMPRA)
    else fDtSet.Filter:= fDtSet.Filter +' and CLSOMACOMPRA = '+quotedstr(CLSOMACOMPRA);

  if not (CLULTIMACOMPRA='') then
    if fDtSet.Filter = '' then
      fDtSet.Filter:= fDtSet.Filter +' CLULTIMACOMPRA = '+quotedstr(CLULTIMACOMPRA)
    else fDtSet.Filter:= fDtSet.Filter +' and CLULTIMACOMPRA = '+quotedstr(CLULTIMACOMPRA);

  if not (CLATRASOCOMPRA='') then
    if fDtSet.Filter = '' then
      fDtSet.Filter:= fDtSet.Filter +' CLATRASOCOMPRA = '+quotedstr(CLATRASOCOMPRA)
    else fDtSet.Filter:= fDtSet.Filter +' and CLATRASOCOMPRA = '+quotedstr(CLATRASOCOMPRA);

  if not (CLLUCROCLIENTE='') then
    if fDtSet.Filter = '' then
      fDtSet.Filter:= fDtSet.Filter +' CLLUCROCLIENTE = '+quotedstr(CLLUCROCLIENTE)
    else fDtSet.Filter:= fDtSet.Filter +' and CLLUCROCLIENTE = '+quotedstr(CLLUCROCLIENTE);

  if fDtSet.Filter = '' then
    fDtSet.Filtered := false
  else fDtSet.Filtered := true;
end;

function TSugestaoServicos._abrirSugestaoServ(pVazio: boolean): boolean;
begin
  result:= montaSelect('select c.cod_cliente,c.DIAS_ACOMP,c.nome_cliente,c.fone_cliente,c.email,c.CLQTDCOMPRA, '+
    ' c.clsomacompra,c.clultimacompra,c.clatrasocompra,c.cllucrocliente,c.lucrocliente,c.v_q_compra, '+
    ' c.m_q_compra,c.v_t_compra,c.m_t_compra,c.v_l_compra,c.m_l_compra,c.m_a_compra,c.endereco, '+
    ' c.bairro,c.cidade,c.cep,c.codigo_uf,c.cod_empresa, (select max(data) from valorcmpclientes4 '+
    ' v where v.cliente = c.cod_cliente and v.cod_empresa = c.cod_empresa) as ult_vnd_data '+
    ' from clientes c where c.cod_empresa='+vDadosIni.codEmpresa+' and c.ativo = 1 and c.cod_cliente=-1');
end;

function TSugestaoServicos._sugerirServico(pCLQTDCOMPRA, pCLSOMACOMPRA,
  pCLULTIMACOMPRA, pCLATRASOCOMPRA, pCLLUCROCLIENTE, pNomeCli: string;
  pTipoCliP, pTipoCliV, pTipoCliS, pJuncaoTipoCli_E, pPessoaFisica,
  pPessoaJuridica, pVeiculo,pNec_acomp: boolean): boolean;
var
  sqlTemp:string;
  vflgsug,vsomakm,vmediakm:integer;
  vmedia: real;
  vkm1: integer;
begin
  try
    vDadosIni.abreStatusProcessamento('','Abrindo serviços sugeridos');
  result := false;
  pCLQTDCOMPRA := trim(pCLQTDCOMPRA);
  pCLSOMACOMPRA := trim(pCLSOMACOMPRA);
  pCLULTIMACOMPRA := trim(pCLULTIMACOMPRA);
  pCLATRASOCOMPRA := trim(pCLATRASOCOMPRA);
  pCLLUCROCLIENTE :=trim(pCLLUCROCLIENTE);
  pNomeCli := trim(pNomeCli);

  if pVeiculo then
  begin
    vBuscas1  := TIBQuery.Create(Application);
    vBuscas1.Database := buscas.Database;
    vBuscas1.Transaction := transacao;
    vBuscas2  := TIBQuery.Create(Application);
    vBuscas2.Database := buscas.Database;
    vBuscas2.Transaction := transacao;
    vBuscas3  := TIBQuery.Create(Application);
    vBuscas3.Database := buscas.Database;
    vBuscas3.Transaction := transacao;
    vBuscas4  := TIBQuery.Create(Application);
    vBuscas4.Database := buscas.Database;
    vBuscas4.Transaction := transacao;
    vBuscas5  := TIBQuery.Create(Application);
    vBuscas5.Database := buscas.Database;
    vBuscas5.Transaction := transacao;
    vBuscas6  := TIBQuery.Create(Application);
    vBuscas6.Database := buscas.Database;
    vBuscas6.Transaction := transacao;
    
    buscas.close;
    buscas.SQL.Text:='select * from veiculos where data_cad >= :vdat1 and '+
      'data_cad <= :vdat2 and COD_EMPRESA in (' +vDadosIni.codEmpresa + ') and ativo=1 order by codigo';
    buscas.ParamByName('vdat1').AsDate := obCRM.Fdatainicial;
    buscas.ParamByName('vdat2').AsDate := obCRM.Fdatafinal;
    buscas.Open;
    buscas.FetchAll;
    buscas.First;
    DtSetV.EmptyDataSet;
    while not buscas.Eof do
    begin
      Application.ProcessMessages;
      vDadosIni.abreStatusProcessamento('','Sugerindo serviços por veículo....aguarde!!');

      if buscas.FieldByName('CHASSI').AsString = ''  then
      begin
       vBuscas1.Close;  //QrSomaQtp
       vBuscas1.SQL.Text:='select count(nped) as quantOS from pedvenda where placa = '+QuotedStr(trim(buscas.FieldByName('PLACA').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
       vBuscas2.Close;  //QrKmV
       vBuscas2.SQL.Text:='select max(km_v) as maxKmVeic from pedvenda where placa = '+QuotedStr(trim(buscas.FieldByName('PLACA').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
       vBuscas3.Close; //QrDataV
       vBuscas3.SQL.Text:='select max(data_os) as maxdataOS from pedvenda where placa = '+QuotedStr(trim(buscas.FieldByName('PLACA').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
       vBuscas4.Close; //QrPassagens
       vBuscas4.SQL.Text:='select data_ped,km_v from pedvenda where placa = '+QuotedStr(trim(buscas.FieldByName('PLACA').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
      end
      else
      begin
       vBuscas1.Close;  //QrSomaQtp
       vBuscas1.SQL.Text:='select count(nped) as quantOS from pedvenda where chassi = '+QuotedStr(trim(buscas.FieldByName('chassi').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
       vBuscas2.Close;  //QrKmV
       vBuscas2.SQL.Text:='select max(km_v) as maxKmVeic from pedvenda where chassi = '+QuotedStr(trim(buscas.FieldByName('chassi').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
       vBuscas3.Close; //QrDataV
       vBuscas3.SQL.Text:='select max(data_ped) as maxdataOS from pedvenda where chassi = '+QuotedStr(trim(buscas.FieldByName('chassi').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
       vBuscas4.Close; //QrPassagens
       vBuscas4.SQL.Text:='select data_ped,km_v from pedvenda where chassi = '+QuotedStr(trim(buscas.FieldByName('chassi').AsString))+
         ' and tipo=''OS'' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ')';
      end;
      /////////////////////////////////////////////////////////////////////////
      vflgsug:=0;
      if vflgsug = 0 then
      begin
        vBuscas1.Open;
        vBuscas5.Close;
        vBuscas5.SQL.Text:='select * from tipmodelo where codigo = '+inttostr(buscas.FieldByName('MODELO').AsInteger)+
         ' and COD_EMPRESA in (' +vDadosIni.codEmpresa + ') and ativo =1';
        vBuscas5.open;
        if vBuscas1.FieldByName('quantOS').AsInteger>0 then
        begin
          vBuscas2.open;
          if vBuscas2.FieldByName('maxKmVeic').AsInteger <= vBuscas5.FieldByName('KM_RET_SERV1').AsInteger then
          begin
            vBuscas3.open;
            vmedia:=((vBuscas3.FieldByName('maxdataOS').AsDateTime - buscas.FieldByName('DATA_CAD').AsDateTime)/30);
            if  vBuscas5.FieldByName('KM_RET_SERV1').asinteger > 0 then
              vkm1:=vBuscas5.FieldByName('KM_RET_SERV1').asinteger
            else
              vkm1:=1;
            if  (date-vBuscas3.FieldByName('maxdataOS').AsDateTime) >= (((vmedia*vBuscas5.FieldByName('KM_RET_SERV3').asinteger)/vkm1)-1) then
            begin
              vBuscas6.close;
              vBuscas6.SQL.text:='select * from clientes c where c.cod_empresa in (' +vDadosIni.codEmpresa + ')'+
                ' and c.cod_cliente = '+inttostr(buscas.FieldByName('cod_cliente').asinteger)+ ' and c.ativo=1';
              vBuscas6.Open;
              fDtSetV.Append;
              fDtSetV.FieldByName('N_SUG_SERV').AsInteger :=0;
              fDtSetV.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').asinteger;
              fDtSetV.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('cod_cliente').asinteger;
              fDtSetV.FieldByName('NOME_CLIENTE').Asstring := vBuscas6.FieldByName('NOME_CLIENTE').Asstring;
              fDtSetV.FieldByName('DESC_VEICULO').AsString := buscas.FieldByName('DESCMODELO').AsString;
              fDtSetV.FieldByName('ANO_MOD_V').AsInteger := buscas.FieldByName('ANOMOD').asinteger;
              fDtSetV.FieldByName('ANO_FAB_V').AsInteger := buscas.FieldByName('ANOFAB').asinteger;
              fDtSetV.FieldByName('COR_V').AsString := buscas.FieldByName('COR').AsString;
              if buscas.FieldByName('DATA_VENDA').AsString <> '30/12/1899' then
                fDtSetV.FieldByName('DATA_COMPRA').AsDateTime := buscas.FieldByName('DATA_VENDA').AsDateTime
              else fDtSetV.FieldByName('DATA_COMPRA').AsInteger :=0;
              fDtSetV.FieldByName('DATA_ULT_SERV').AsDateTime :=vBuscas3.FieldByName('maxdataOS').AsDateTime;
              fDtSetV.FieldByName('KM_SUG_V').AsInteger := vBuscas5.FieldByName('KM_RET_SERV3').asinteger;
              fDtSetV.FieldByName('FONE_CLIENTE').AsString := vBuscas6.fieldbyname('fone_cliente').asstring+'->'+
                 vBuscas6.fieldbyname('fax').asstring;
              fDtSetV.FieldByName('EMAIL').AsString := vBuscas6.fieldbyname('email').asstring;
              fDtSetV.FieldByName('ENDERECO').AsString := vBuscas6.fieldbyname('ENDERECO').asstring;
              fDtSetV.FieldByName('BAIRRO').AsString := vBuscas6.fieldbyname('BAIRRO').asstring;
              fDtSetV.FieldByName('CIDADE').AsString := vBuscas6.fieldbyname('CIDADE').asstring;
              fDtSetV.FieldByName('CEP').AsString := vBuscas6.fieldbyname('CEP').asstring;
              fDtSetV.FieldByName('CODIGO_UF').AsInteger :=  vBuscas6.fieldbyname('CODIGO_UF').AsInteger;
        //         if not QrContFeito.isempty then
        //          FrPrincipal.QrSugServDATA_ULT_CONTATO.value:=QrContFeitoDATA_CONTATO.value;
              //      fDtSetV.FieldByName('DATA_ULT_CONTATO').AsInteger :=
              fDtSetV.FieldByName('COD_VEICULO').AsInteger := buscas.FieldByName('codigo').asinteger;
              fDtSetV.FieldByName('COD_CIDADE').AsInteger := vBuscas6.fieldbyname('COD_CIDADE').AsInteger;
              fDtSetV.FieldByName('COD_BAIRRO').AsInteger := vBuscas6.fieldbyname('COD_BAIRRO').AsInteger;
              fDtSetV.Post;
            end
            else
            begin
              if (((date- buscas.FieldByName('DATA_CAD').AsDateTime)/30) >= 11) and
              (((date-buscas.FieldByName('DATA_CAD').AsDateTime)/30) <= 12) then
              begin
                vBuscas6.close;
                vBuscas6.SQL.text:='select * from clientes c where c.cod_empresa in (' +vDadosIni.codEmpresa + ')'+
                  ' and c.cod_cliente = '+inttostr(buscas.FieldByName('cod_cliente').asinteger)+ ' and c.ativo=1';
                vBuscas6.Open;
                fDtSetV.Append;
                fDtSetV.FieldByName('N_SUG_SERV').AsInteger :=0;
                fDtSetV.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').asinteger;
                fDtSetV.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('cod_cliente').asinteger;
                fDtSetV.FieldByName('NOME_CLIENTE').Asstring := vBuscas6.FieldByName('NOME_CLIENTE').Asstring;
                fDtSetV.FieldByName('DESC_VEICULO').AsString := buscas.FieldByName('DESCMODELO').AsString;
                fDtSetV.FieldByName('ANO_MOD_V').AsInteger := buscas.FieldByName('ANOMOD').asinteger;
                fDtSetV.FieldByName('ANO_FAB_V').AsInteger := buscas.FieldByName('ANOFAB').asinteger;
                fDtSetV.FieldByName('COR_V').AsString := buscas.FieldByName('COR').AsString;
                if buscas.FieldByName('DATA_VENDA').AsString <> '30/12/1899' then
                  fDtSetV.FieldByName('DATA_COMPRA').AsDateTime := buscas.FieldByName('DATA_VENDA').AsDateTime;
                fDtSetV.FieldByName('DATA_ULT_SERV').AsDateTime :=vBuscas3.FieldByName('maxdataOS').AsDateTime;
                fDtSetV.FieldByName('KM_SUG_V').AsInteger := vBuscas5.FieldByName('KM_RET_SERV3').asinteger;
                fDtSetV.FieldByName('FONE_CLIENTE').AsString := vBuscas6.fieldbyname('fone_cliente').asstring+'->'+
                   vBuscas6.fieldbyname('fax').asstring;
                fDtSetV.FieldByName('EMAIL').AsString := vBuscas6.fieldbyname('email').asstring;
                fDtSetV.FieldByName('ENDERECO').AsString := vBuscas6.fieldbyname('ENDERECO').asstring;
                fDtSetV.FieldByName('BAIRRO').AsString := vBuscas6.fieldbyname('BAIRRO').asstring;
                fDtSetV.FieldByName('CIDADE').AsString := vBuscas6.fieldbyname('CIDADE').asstring;
                fDtSetV.FieldByName('CEP').AsString := vBuscas6.fieldbyname('CEP').asstring;
                fDtSetV.FieldByName('CODIGO_UF').AsInteger :=  vBuscas6.fieldbyname('CODIGO_UF').AsInteger;
          //         if not QrContFeito.isempty then
          //          FrPrincipal.QrSugServDATA_ULT_CONTATO.value:=QrContFeitoDATA_CONTATO.value;
                //      fDtSetV.FieldByName('DATA_ULT_CONTATO').AsInteger :=
                fDtSetV.FieldByName('COD_VEICULO').AsInteger := buscas.FieldByName('codigo').asinteger;
                fDtSetV.FieldByName('COD_CIDADE').AsInteger := vBuscas6.fieldbyname('COD_CIDADE').AsInteger;
                fDtSetV.FieldByName('COD_BAIRRO').AsInteger := vBuscas6.fieldbyname('COD_BAIRRO').AsInteger;
                fDtSetV.Post;
              end;
            end;
          end else
          begin
            if (vBuscas2.FieldByName('maxKmVeic').AsInteger > vBuscas5.FieldByName('KM_RET_SERV1').AsInteger) and
            (vBuscas2.FieldByName('maxKmVeic').AsInteger <= vBuscas5.FieldByName('KM_RET_SERV3').AsInteger) then
            begin
              vBuscas3.open;
              vBuscas4.open;
              vBuscas4.last;
              vsomakm:= vBuscas4.FieldByName('KM_V').AsInteger;
              vmediakm:=vBuscas4.FieldByName('KM_V').AsInteger;
              vmedia:=vBuscas4.FieldByName('DATA_PED').AsFloat;
              vBuscas4.prior;
              vmediakm:= vmediakm - vBuscas4.FieldByName('KM_V').AsInteger;
              vmedia:=((vmedia-vBuscas4.FieldByName('DATA_PED').AsFloat)/30);
              if vmediakm <> 0 then
              begin
                if  (date-vBuscas3.FieldByName('maxdataOS').AsDateTime) >= (((vmedia* vBuscas5.FieldByName('INTERV_KM_SERV').AsInteger)/vmediakm)-1) then
                begin
                  vBuscas6.close;
                  vBuscas6.SQL.text:='select * from clientes c where c.cod_empresa in (' +vDadosIni.codEmpresa + ')'+
                    ' and c.cod_cliente = '+inttostr(buscas.FieldByName('cod_cliente').asinteger)+ ' and c.ativo=1';
                  vBuscas6.Open;
                  fDtSetV.Append;
                  fDtSetV.FieldByName('N_SUG_SERV').AsInteger :=0;
                  fDtSetV.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').asinteger;
                  fDtSetV.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('cod_cliente').asinteger;
                  fDtSetV.FieldByName('NOME_CLIENTE').Asstring := vBuscas6.FieldByName('NOME_CLIENTE').Asstring;
                  fDtSetV.FieldByName('DESC_VEICULO').AsString := buscas.FieldByName('DESCMODELO').AsString;
                  fDtSetV.FieldByName('ANO_MOD_V').AsInteger := buscas.FieldByName('ANOMOD').asinteger;
                  fDtSetV.FieldByName('ANO_FAB_V').AsInteger := buscas.FieldByName('ANOFAB').asinteger;
                  fDtSetV.FieldByName('COR_V').AsString := buscas.FieldByName('COR').AsString;
                  if buscas.FieldByName('DATA_VENDA').AsString <> '30/12/1899' then
                    fDtSetV.FieldByName('DATA_COMPRA').AsDateTime := buscas.FieldByName('DATA_VENDA').AsDateTime;
                  fDtSetV.FieldByName('DATA_ULT_SERV').AsDateTime :=vBuscas3.FieldByName('maxdataOS').AsDateTime;
                  fDtSetV.FieldByName('KM_SUG_V').AsInteger := vBuscas5.FieldByName('INTERV_KM_SERV').asinteger;
                  fDtSetV.FieldByName('FONE_CLIENTE').AsString := vBuscas6.fieldbyname('fone_cliente').asstring+'->'+
                     vBuscas6.fieldbyname('fax').asstring;
                  fDtSetV.FieldByName('EMAIL').AsString := vBuscas6.fieldbyname('email').asstring;
                  fDtSetV.FieldByName('ENDERECO').AsString := vBuscas6.fieldbyname('ENDERECO').asstring;
                  fDtSetV.FieldByName('BAIRRO').AsString := vBuscas6.fieldbyname('BAIRRO').asstring;
                  fDtSetV.FieldByName('CIDADE').AsString := vBuscas6.fieldbyname('CIDADE').asstring;
                  fDtSetV.FieldByName('CEP').AsString := vBuscas6.fieldbyname('CEP').asstring;
                  fDtSetV.FieldByName('CODIGO_UF').AsInteger :=  vBuscas6.fieldbyname('CODIGO_UF').AsInteger;
            //         if not QrContFeito.isempty then
            //          FrPrincipal.QrSugServDATA_ULT_CONTATO.value:=QrContFeitoDATA_CONTATO.value;
                  //      fDtSetV.FieldByName('DATA_ULT_CONTATO').AsInteger :=
                  fDtSetV.FieldByName('COD_VEICULO').AsInteger := buscas.FieldByName('codigo').asinteger;
                  fDtSetV.FieldByName('COD_CIDADE').AsInteger := vBuscas6.fieldbyname('COD_CIDADE').AsInteger;
                  fDtSetV.FieldByName('COD_BAIRRO').AsInteger := vBuscas6.fieldbyname('COD_BAIRRO').AsInteger;
                end;
              end;
            end else
            begin
                   // fazer media
            //       vBuscas1.Close;  //QrSomaQtp
            //       vBuscas2.Close;  //QrKmV
            //       vBuscas3.Close; //QrDataV
            //       vBuscas4.Close; //QrPassagens
               vBuscas3.open;
               vBuscas4.open;
               vBuscas4.last;
               vsomakm:=vBuscas4.FieldByName('KM_V').AsInteger;
               vmediakm:=vBuscas4.FieldByName('KM_V').AsInteger;
               vmedia:=vBuscas4.FieldByName('DATA_PED').AsFloat;
               vBuscas4.prior;
               vmediakm:=vmediakm-vBuscas4.FieldByName('KM_V').AsInteger;
               vmedia:=((vmedia-vBuscas4.FieldByName('DATA_PED').AsFloat)/30);
               if vmediakm <> 0 then
               begin
                 if  (date-vBuscas3.FieldByName('maxdataOS').AsDateTime) >= (((vmedia*vBuscas5.FieldByName('INTERV_KM_SERV').asinteger)/vmediakm)-1) then
                 begin
                   vBuscas6.close;
                   vBuscas6.SQL.text:='select * from clientes c where c.cod_empresa in (' +vDadosIni.codEmpresa + ')'+
                     ' and c.cod_cliente = '+inttostr(buscas.FieldByName('cod_cliente').asinteger)+ ' and c.ativo=1';
                   vBuscas6.Open;
                   fDtSetV.Append;
                   fDtSetV.FieldByName('N_SUG_SERV').AsInteger :=0;
                   fDtSetV.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').asinteger;
                   fDtSetV.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('cod_cliente').asinteger;
                   fDtSetV.FieldByName('NOME_CLIENTE').Asstring := vBuscas6.FieldByName('NOME_CLIENTE').Asstring;
                   fDtSetV.FieldByName('DESC_VEICULO').AsString := buscas.FieldByName('DESCMODELO').AsString;
                   fDtSetV.FieldByName('ANO_MOD_V').AsInteger := buscas.FieldByName('ANOMOD').asinteger;
                   fDtSetV.FieldByName('ANO_FAB_V').AsInteger := buscas.FieldByName('ANOFAB').asinteger;
                   fDtSetV.FieldByName('COR_V').AsString := buscas.FieldByName('COR').AsString;
                   if buscas.FieldByName('DATA_VENDA').AsString <> '30/12/1899' then
                     fDtSetV.FieldByName('DATA_COMPRA').AsDateTime := buscas.FieldByName('DATA_VENDA').AsDateTime;
                   fDtSetV.FieldByName('DATA_ULT_SERV').AsDateTime :=vBuscas3.FieldByName('maxdataOS').AsDateTime;
                   fDtSetV.FieldByName('KM_SUG_V').AsInteger := vsomakm+vBuscas5.FieldByName('INTERV_KM_SERV').asinteger;
                   fDtSetV.FieldByName('FONE_CLIENTE').AsString := vBuscas6.fieldbyname('fone_cliente').asstring+'->'+
                     vBuscas6.fieldbyname('fax').asstring;
                   fDtSetV.FieldByName('EMAIL').AsString := vBuscas6.fieldbyname('email').asstring;
                   fDtSetV.FieldByName('ENDERECO').AsString := vBuscas6.fieldbyname('ENDERECO').asstring;
                   fDtSetV.FieldByName('BAIRRO').AsString := vBuscas6.fieldbyname('BAIRRO').asstring;
                   fDtSetV.FieldByName('CIDADE').AsString := vBuscas6.fieldbyname('CIDADE').asstring;
                   fDtSetV.FieldByName('CEP').AsString := vBuscas6.fieldbyname('CEP').asstring;
                   fDtSetV.FieldByName('CODIGO_UF').AsInteger :=  vBuscas6.fieldbyname('CODIGO_UF').AsInteger;
            //         if not QrContFeito.isempty then
            //          FrPrincipal.QrSugServDATA_ULT_CONTATO.value:=QrContFeitoDATA_CONTATO.value;
                  //      fDtSetV.FieldByName('DATA_ULT_CONTATO').AsInteger :=
                   fDtSetV.FieldByName('COD_VEICULO').AsInteger := buscas.FieldByName('codigo').asinteger;
                   fDtSetV.FieldByName('COD_CIDADE').AsInteger := vBuscas6.fieldbyname('COD_CIDADE').AsInteger;
                   fDtSetV.FieldByName('COD_BAIRRO').AsInteger := vBuscas6.fieldbyname('COD_BAIRRO').AsInteger;
                   fDtSetV.Post;
                 end;
               end;
             end;
           end;
         end else
         begin
         // calcular periodo
           if (((date- buscas.FieldByName('DATA_CAD').AsDateTime)/30) >= 5) and
              (((date-buscas.FieldByName('DATA_CAD').AsDateTime)/30) <= 6) then
           begin
             vBuscas6.close;
             vBuscas6.SQL.text:='select * from clientes c where c.cod_empresa in (' +vDadosIni.codEmpresa + ')'+
               ' and c.cod_cliente = '+inttostr(buscas.FieldByName('cod_cliente').asinteger)+ ' and c.ativo=1';
             vBuscas6.Open;
             fDtSetV.Append;
             fDtSetV.FieldByName('N_SUG_SERV').AsInteger :=0;
             fDtSetV.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').asinteger;
             fDtSetV.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('cod_cliente').asinteger;
             fDtSetV.FieldByName('NOME_CLIENTE').Asstring := vBuscas6.FieldByName('NOME_CLIENTE').Asstring;
             fDtSetV.FieldByName('DESC_VEICULO').AsString := buscas.FieldByName('DESCMODELO').AsString;
             fDtSetV.FieldByName('ANO_MOD_V').AsInteger := buscas.FieldByName('ANOMOD').asinteger;
             fDtSetV.FieldByName('ANO_FAB_V').AsInteger := buscas.FieldByName('ANOFAB').asinteger;
             fDtSetV.FieldByName('COR_V').AsString := buscas.FieldByName('COR').AsString;
             if buscas.FieldByName('DATA_VENDA').AsString <> '30/12/1899' then
               fDtSetV.FieldByName('DATA_COMPRA').AsDateTime := buscas.FieldByName('DATA_VENDA').AsDateTime;
             //fDtSetV.FieldByName('DATA_ULT_SERV').AsDateTime :=vBuscas3.FieldByName('maxdataOS').AsDateTime;
             fDtSetV.FieldByName('KM_SUG_V').AsInteger := vsomakm+vBuscas5.FieldByName('KM_RET_SERV1').asinteger;
             fDtSetV.FieldByName('FONE_CLIENTE').AsString := vBuscas6.fieldbyname('fone_cliente').asstring+'->'+
                vBuscas6.fieldbyname('fax').asstring;
             fDtSetV.FieldByName('EMAIL').AsString := vBuscas6.fieldbyname('email').asstring;
             fDtSetV.FieldByName('ENDERECO').AsString := vBuscas6.fieldbyname('ENDERECO').asstring;
             fDtSetV.FieldByName('BAIRRO').AsString := vBuscas6.fieldbyname('BAIRRO').asstring;
             fDtSetV.FieldByName('CIDADE').AsString := vBuscas6.fieldbyname('CIDADE').asstring;
             fDtSetV.FieldByName('CEP').AsString := vBuscas6.fieldbyname('CEP').asstring;
             fDtSetV.FieldByName('CODIGO_UF').AsInteger :=  vBuscas6.fieldbyname('CODIGO_UF').AsInteger;
        //         if not QrContFeito.isempty then
        //          FrPrincipal.QrSugServDATA_ULT_CONTATO.value:=QrContFeitoDATA_CONTATO.value;
              //      fDtSetV.FieldByName('DATA_ULT_CONTATO').AsInteger :=
             fDtSetV.FieldByName('COD_VEICULO').AsInteger := buscas.FieldByName('codigo').asinteger;
             fDtSetV.FieldByName('COD_CIDADE').AsInteger := vBuscas6.fieldbyname('COD_CIDADE').AsInteger;
             fDtSetV.FieldByName('COD_BAIRRO').AsInteger := vBuscas6.fieldbyname('COD_BAIRRO').AsInteger;
             fDtSetV.Post;
           end;
         end;
       end;
      /////////////////////////////////////////////////////////////////////////
       buscas.Next;
     end;
  end else
  begin
    buscas.Close;
    buscas.SQL.Text := 'select c.cod_cliente,c.DIAS_ACOMP,c.nome_cliente,c.fone_cliente,c.email,c.CLQTDCOMPRA, '+
      ' c.clsomacompra,c.clultimacompra,c.clatrasocompra,c.cllucrocliente,c.lucrocliente,c.v_q_compra, '+
      ' c.m_q_compra,c.v_t_compra,c.m_t_compra,c.v_l_compra,c.m_l_compra,c.V_A_COMPRA,c.m_a_compra,c.endereco, '+
      ' c.bairro,c.cidade,c.cep,c.codigo_uf,c.cod_empresa, '+
      ' (select max(data) from valorcmpclientes4 v'+
      ' where v.cliente = c.cod_cliente and v.cod_empresa = c.cod_empresa and v.tp=''REQ'') as DATA_ULT_COMPRA, '+
      ' (select max(data) from valorcmpclientes4 v'+
      ' where v.cliente = c.cod_cliente and v.cod_empresa = c.cod_empresa and v.tp=''OS'') as DATA_ULT_SERV,c.nec_acomp '+
      ' from clientes c '+
      ' where c.cod_empresa='+vDadosIni.codEmpresa+' and c.ativo = 1 and '+
      ' (' + vDadosIni.FusoSqlDateTime + ' -(select max(data) from valorcmpclientes4  v  where v.cliente = c.cod_cliente '+
      ' and v.cod_empresa = c.cod_empresa))>= coalesce(c.dias_acomp,0) Order by Nome_Cliente';
    buscas.Open;
    while not buscas.Eof do
    begin
      vDadosIni.abreStatusProcessamento('','Abrindo serviços sugeridos....aguarde!!');
      fDtSet.Append;
      fDtSet.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('COD_CLIENTE').AsInteger;
      fDtSet.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').AsInteger;
  //    fDtSet.FieldByName('ATIVO').AsInteger := buscas.FieldByName('ATIVO').AsInteger;
      fDtSet.FieldByName('NOME_CLIENTE').AsString := buscas.FieldByName('NOME_CLIENTE').AsString;
      fDtSet.FieldByName('DATA_ULT_COMPRA').AsVariant := buscas.FieldByName('DATA_ULT_COMPRA').AsVariant;
      fDtSet.FieldByName('DATA_ULT_SERV').AsVariant := buscas.FieldByName('DATA_ULT_SERV').AsVariant;
      fDtSet.FieldByName('FONE_CLIENTE').AsString := buscas.FieldByName('FONE_CLIENTE').AsString;
      fDtSet.FieldByName('EMAIL').AsString := buscas.FieldByName('EMAIL').AsString;
      fDtSet.FieldByName('CLQTDCOMPRA').AsString := buscas.FieldByName('CLQTDCOMPRA').AsString;
      fDtSet.FieldByName('CLSOMACOMPRA').AsString := buscas.FieldByName('CLSOMACOMPRA').AsString;
      fDtSet.FieldByName('CLULTIMACOMPRA').AsString := buscas.FieldByName('CLULTIMACOMPRA').AsString;
      fDtSet.FieldByName('CLATRASOCOMPRA').AsString := buscas.FieldByName('CLATRASOCOMPRA').AsString;
      fDtSet.FieldByName('CLLUCROCLIENTE').AsString := buscas.FieldByName('CLLUCROCLIENTE').AsString;
      fDtSet.FieldByName('ENDERECO').AsString := buscas.FieldByName('ENDERECO').AsString;
      fDtSet.FieldByName('BAIRRO').AsString := buscas.FieldByName('BAIRRO').AsString;
      fDtSet.FieldByName('CIDADE').AsString := buscas.FieldByName('CIDADE').AsString;
      fDtSet.FieldByName('CEP').AsString := buscas.FieldByName('CEP').AsString;
      fDtSet.FieldByName('LUCROCLIENTE').AsFloat := buscas.FieldByName('LUCROCLIENTE').AsFloat;
      fDtSet.FieldByName('V_Q_COMPRA').AsFloat := buscas.FieldByName('V_Q_COMPRA').AsFloat;
      fDtSet.FieldByName('M_Q_COMPRA').AsFloat := buscas.FieldByName('M_Q_COMPRA').AsFloat;
      fDtSet.FieldByName('V_T_COMPRA').AsFloat := buscas.FieldByName('V_T_COMPRA').AsFloat;
      fDtSet.FieldByName('M_T_COMPRA').AsFloat := buscas.FieldByName('M_T_COMPRA').AsFloat;
      fDtSet.FieldByName('V_L_COMPRA').AsFloat := buscas.FieldByName('V_L_COMPRA').AsFloat;
      fDtSet.FieldByName('M_L_COMPRA').AsFloat := buscas.FieldByName('M_L_COMPRA').AsFloat;
      fDtSet.FieldByName('V_A_COMPRA').AsFloat := buscas.FieldByName('V_A_COMPRA').AsFloat;
      fDtSet.FieldByName('M_A_COMPRA').AsFloat := buscas.FieldByName('M_A_COMPRA').AsFloat;
      fDtSet.FieldByName('CODIGO_UF').AsInteger := buscas.FieldByName('CODIGO_UF').AsInteger;
      fDtSet.FieldByName('nec_acomp').AsString := buscas.FieldByName('nec_acomp').AsString;
  //    fDtSet.FieldByName('COD_CIDADE').AsInteger := buscas.FieldByName('COD_CIDADE').AsInteger;
  //    fDtSet.FieldByName('COD_BAIRRO').AsInteger := buscas.FieldByName('COD_BAIRRO').AsInteger;
  //    fDtSet.FieldByName('DATA_ULT_CONTATO').AsDateTime := buscas.FieldByName('DATA_ULT_CONTATO').AsDateTime;
      fDtSet.Post;
      buscas.Next;
    end;
  end;

  buscas.Close;
  finally
    vDadosIni.fechaStatusProcessamento;
    if vBuscas1<>nil then
    begin
      vBuscas1.Free;
      vBuscas1:=nil;
    end;
    if vBuscas2<>nil then
    begin
      vBuscas2.Free;
      vBuscas2:=nil;
    end;
    if vBuscas3<>nil then
    begin
      vBuscas3.Free;
      vBuscas3:=nil;
    end;
    if vBuscas4<>nil then
    begin
      vBuscas4.Free;
      vBuscas4:=nil;
    end;
    if vBuscas5<>nil then
    begin
      vBuscas5.Free;
      vBuscas5:=nil;
    end;
    if vBuscas6<>nil then
    begin
      vBuscas6.Free;
      vBuscas6:=nil;
    end;
  end;
end;

{ TFichaCred }

constructor TFinancaCred.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsFichaCred);
  transacao := TIBTransaction(dtmCRM.transacao);
  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrFichaCred.Database;
  buscas.Transaction := transacao;
end;

function TFinancaCred._abreCreditos(pCPFCNPJ: string): Boolean;
begin
  try
    result:=true;
//    if obFichaCred = nil then
//      obFichaCred := TFichaCred.create;
    dataSet.Close;
    dataSet.CommandText:= 'select ctrl.nome_ctrl,c.N_DOC_C,c.DATA_REC_C,' +
      ' c.DATA_VENC_C,c.VALOR_C,c.DATQ_C,c.DATA_BAIXA,c.TIP_BAIXA,c.CODIGO_EMP,c.HISTORICO_C,c.COD_CRED,' +
      'case when coalesce(c.data_baixa,cast(' + vDadosIni.FusoDateFb + ' as timestamp))-c.data_venc_c > 0 then ' +
      'coalesce(c.data_baixa,cast(' + vDadosIni.FusoDateFb + ' as timestamp))-c.data_venc_c else 0 end  as dias_atraso, c.N_DOC_V as NPED  from controle_creditos c inner join controles ctrl ' +
      ' on c.codigo_ctrl = ctrl.codigo_ctrl and c.codigo_emp = ctrl.codigo_emp ' +
      ' where c.cod_cliente in ' + _retornaCodClientes(pCPFCNPJ);

    if obCRM.FFiltrarData then
      dataSet.CommandText := dataSet.CommandText +' and c.DATA_REC_C >= :vdat1 and  c.DATA_REC_C <= :vdat2 '
    else dataSet.CommandText := dataSet.CommandText +' and c.DATA_REC_C <= :vdat1 ';

    if obCRM.FTodasEmpresas then
      dataSet.CommandText := dataSet.CommandText + ' ORDER BY c.cod_cliente,c.DATA_VENC_C desc'
    else  dataSet.CommandText := dataSet.CommandText + ' and c.CODIGO_EMP = ' + vDadosIni.codEmpresa +' ORDER BY c.cod_cliente,c.DATA_VENC_C desc';

    if obCRM.FFiltrarData then
    begin
      dataSet.Params.ParamByName('vdat1').AsDate := obCRM.Fdatainicial;
      dataSet.Params.ParamByName('vdat2').AsDate := obCRM.Fdatafinal;
    end else dataSet.Params.ParamByName('vdat1').AsDate := obCRM.FdataBanco;

    dataSet.open;
  except
    result := false;
  end;
end;

{ TFichaCh }

constructor TFinancaCh.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsFichaCh);
  transacao := TIBTransaction(dtmCRM.transacao);
  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrFichaCh.Database;
  buscas.Transaction := transacao;
end;

function TFinancaCh._abreCH(pCPFCNPJ: string): Boolean;
begin
  try
    result:=true;
//    if obFichaCh = nil then
//      obFichaCh := TFichaCh.create;
    dataSet.Close;
    dataSet.CommandText:=
      'Select ctrl.nome_ctrl,ch.N_CH,ch.DATA_REC,ch.DATA_VENC,ch.VALOR_CH,ch.DATQ_CH,ch.TIP_BAIXA,ch.CODIGO_EMP,case when coalesce(ch.datq_ch,cast(' + vDadosIni.FusoDateFb + ' as timestamp))-ch.data_venc > 0 then ' +
      'coalesce(ch.datq_ch,cast(' + vDadosIni.FusoDateFb + ' as timestamp))-ch.data_venc else 0 end as dias_atraso from ' +
      ' controle_cheque ch inner join controles ctrl on ch.codigo_ctrl = ctrl.codigo_ctrl '+
      ' and ch.codigo_emp = ctrl.codigo_emp '+
      ' where ch.cod_cliente in ' + _retornaCodClientes(pCPFCNPJ);

    if obCRM.FFiltrarData then
      dataSet.CommandText := dataSet.CommandText +' and ch.Data_rec >= :vdat1 and ch.Data_rec <= :vdat2 '
    else dataSet.CommandText := dataSet.CommandText +' and ch.Data_rec <= :vdat1 ' ;

    if obCRM.FTodasEmpresas then
      dataSet.CommandText := dataSet.CommandText + ' ORDER BY ch.DATA_VENC desc'
    else dataSet.CommandText := dataSet.CommandText + ' and ch.CODIGO_EMP = ' + vDadosIni.codEmpresa + ' ORDER BY ch.DATA_VENC desc';

    if obCRM.FFiltrarData then
    begin
      dataSet.Params.ParamByName('vdat1').AsDate := obCRM.Fdatainicial;
      dataSet.Params.ParamByName('vdat2').AsDate := obCRM.Fdatafinal;
    end else dataSet.Params.ParamByName('vdat1').AsDate := obCRM.FdataBanco;
    dataSet.Open;
  except
    result:= false;
  end;
end;

{ TFichaRec }

constructor TFinancaRec.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsFichaRec);
  transacao := TIBTransaction(dtmCRM.transacao);
  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrFichaRec.Database;
  buscas.Transaction := transacao;
end;

function TFinancaRec._abreRecibos(pCPFCNPJ: string): Boolean;
begin
  try
    result:=true;
//    if obFichaRec = nil then
//      obFichaRec := TFichaRec.create;
    dataSet.Close;
    dataSet.CommandText := 'Select * from recibos '+
      ' where cod_benef in ' +_retornaCodClientes(pCPFCNPJ) +
      ' and RECANT = ''S'' ';
    if not obCRM.FTodasEmpresas then
      dataSet.CommandText := dataSet.CommandText +' and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ativo = 1'
    else dataSet.CommandText := dataSet.CommandText + ' and ativo = 1';
    dataSet.open;
  except
    result:= false;
  end;
end;

{ TSugestaoServicosCli }

constructor TSugestaoServicosCli.create;
begin
  dataSet := TClientDataSet(dtmCRM.cdsSugServCli);
  transacao := TIBTransaction(dtmCRM.transacao);

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
  	dataSet.FieldByName('CHASSI').Tag := 1;
    dataSet.FieldByName('PLACA').Tag := 1;
    dataSet.FieldByName('COD_VEIC').Tag := 1;

    dataSet.FieldByName('COD_EQUIP').Tag := 0;
  end
  else
  begin
  	dataSet.FieldByName('COD_EQUIP').Tag := 1;

    dataSet.FieldByName('CHASSI').Tag := 0;
    dataSet.FieldByName('PLACA').Tag := 0;
    dataSet.FieldByName('COD_VEIC').Tag := 0;
  end;

  buscas  := TIBQuery.Create(nil);
  buscas.Database := dtmCRM.qrOrcCli.Database;
  buscas.Transaction := transacao;
end;

function TSugestaoServicosCli._abreSugestaoServicosCli(pDataI, pDataF: string; pCodCli: integer): Boolean;
var
	vTemp: string;
begin
  vTemp := ' select distinct sugestaoservico.cod_empresa, sugestaoservico.cod_equip, sugestaoservico.cod_veic, ' +
    ' sugestaoservico.chassi, sugestaoservico.placa, sugestaoservico.data, sugestaoservico.cod_cliente, ' +
    ' case when (sugestaoservico.cod_equip > 0) then equipamento.nom_equip else veiculos.descmodelo end descricao_tp, ' +
    ' clientes.nome_cliente, clientes.razao, clientes.fone_cliente, clientes.email, ' +
    ' sugestaoservico.ult_atd, colaborador.nome_vendedor, sugestaoservico.ativo, ' +
    ' sugestaoservico.cod_agenda, sugestaoservico.status, sugestaoservico.ndoc, sugestaoservico.tpdoc, ' +
    ' sugestaoservico.us_cad, sugestaoservico.data_cad, sugestaoservico.hora_cad from sugestaoservico ' +
    ' left join equipamento on equipamento.cod_equip = sugestaoservico.cod_equip and equipamento.cod_empresa = sugestaoservico.cod_empresa ' +
    ' left join veiculos on veiculos.codigo = sugestaoservico.cod_veic and veiculos.chassi = sugestaoservico.chassi and veiculos.placa = sugestaoservico.placa ' +
    ' left join clientes on clientes.cod_cliente = sugestaoservico.cod_cliente AND clientes.cod_empresa = sugestaoservico.cod_empresa ' +
    ' left join colaborador on colaborador.cod_vendedor = sugestaoservico.ult_atd and colaborador.cod_empresa = sugestaoservico.cod_empresa ' +
    ' where sugestaoservico.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and sugestaoservico.cod_cliente = ' + IntToStr(pCodCli) + ' and sugestaoservico.ativo = 1 ';
  if obCRM.FFiltrarData then
    vTemp := vTemp + ' and sugestaoservico.data >= :dti and sugestaoservico.data <= :dtf ';
  vTemp := vTemp + ' order by sugestaoservico.data desc, sugestaoservico.status ';
  if obCRM.FFiltrarData then
	  Result := montaSelect(vTemp, StrToDate(pDataI),StrToDate(pDataF))
  else
  	Result := montaSelect(vTemp);
end;

end.
