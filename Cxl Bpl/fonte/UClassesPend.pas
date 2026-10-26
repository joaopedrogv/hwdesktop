unit UClassesPend;

interface
uses Forms, Classes, uDataSet_OOP, Controls, StdCtrls, DBClient, uCupom,
  RDprint, IBQuery;

type
  Tcl_abreExtrato_form = function(ACodCliente: Integer): boolean;
  Tnfce_emitir_from_pedvenda = function (ANPed: Integer; ATipo: string): Boolean;

  RClientes = record
    AHandle: THandle;
  end;
  
  RConsultaConta = record
   vDescricaoGR, vDescricaoDEP, vTipoConta: string;
  end;

  TFecdCXL = class;
  TGenerico = class(TDataSet_OOP)
  protected
    comucFiscal: TComunic;
    name:String;
    vusprevenda: string;
    function CamposSQL: string;
  public
    procedure showFiscal;
    procedure verificaFiscalAtivo;
    procedure verificaNFCeAutomatica;
    procedure enviarVendaParaCupom;
    procedure enviarVendaParaNFCe;
    function verificaemissaonf(vtipo: integer; Doc: string = 'Cupom'): boolean;
    function verificarNFSe(nped: Integer; tipo: string;
  		reimprimir: boolean = False; exibir_mens: boolean = True): boolean;
  var
  	vecommerce: string;
    vtipdoc: string;
    vemit_nf: string;
    vmodserv: string;
    NFCeAutomaticaAtiva: Boolean;
  end;

  TPendReq = class(TGenerico)
  private
    valorPendenteRecibo: Currency;
    fCarga: Integer;
    fBuscas2, fBuscas3: TIBQuery;
  public
    constructor create;
    destructor destroy; override;
    function recebendo: boolean;
    function post: boolean; override;
    function marcaRec(vtp: integer): boolean;
    function confirmarecebimento(ValorRecebido: currency): boolean;
    function verificaOSNFSe(pReImprimir: Boolean = False; pExibirMensagem: Boolean = True): boolean;
    function abrePendReq: boolean;
    function PegaInfRec: boolean;
    function verificanentrada: boolean;
    function verificadiferenca: boolean;
    function existeDevInternaPendenteNF: Boolean;
    function existeRetencaoFederalCliente: Boolean;
    function emitirNotaDoPedido(pExibirMensagem: Boolean = True): Boolean;

    function _carga_abrePendReq: Boolean;
    function _carga_fechada(pCod_Carga: Integer): Boolean;
    function _carga_fin_fechada(pCarga: Integer = 0): Boolean;
    function _carga_fin_fechar: Boolean;
    function _carga_fin_reabrir: Boolean;
    function _carga_fin_removerStatusCarga: Boolean;
    function _carga_fin_atualizarStatusCarga: Boolean;
    function _carga_fin_concederDesconto: Boolean;
    function _carga_fin_relatorio: Boolean;
    function _carga_fin_getCarga: Integer;
    function cl_abreExtrato_form(ACodCliente: Integer): boolean;
    function abrirPedVenda: boolean;
  var
    vsrec, vlVnd, vlrec, vlInter: Currency;
    qtdvnd: Integer;
    vTestarDtFechcomDtCaixa: boolean;
    vClienteReq: RClientes; //Variaveis de configuracao do cliente
  end;

  TPendOS = class(TGenerico)
  private
    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    function recebendo: boolean;
    function post: boolean; override;
    function marcaRec(vtp: integer): boolean;
    function confirmarecebimento(ValorRecebido: currency): boolean;
    function abrePendOs: boolean;
    function PegaInfRec: boolean;
  var
    vtipdoc: string;
    vsrec, vlVnd, vlrec: Currency;
    qtdvnd: Integer;
  end;

  TPendVeic = class(TDataSet_OOP)
  private
    valorPendenteRecibo: Currency;
    vdadosmotven: TIBQuery;
  public
    constructor create;
    destructor destroy; override;
    function recebendo: boolean;
    function post: boolean; override;
    function marcaRec(vtp: integer): boolean;
    function confirmarecebimento(ValorRecebido: currency): boolean;
    function abrePendVeic: boolean;
    function PegaInfRec: boolean;
    function DadosComando(vnComando: integer; vtp: integer): boolean;
    function verificaEnvioNFVeic: boolean;
    function verificaEnvioNFVeicCCIA: boolean;
    function BaixarVeicIntermed: boolean;
    function verificairregularidade: boolean;
    function BaixarVeiculos(vtp: integer;vmtus: integer): boolean;
    function BaixarVeiculosCCIA(vtp: integer;vmtus: integer): boolean;
    function gerarnfVenda: boolean;
    function verificardiferenca: boolean;
    function tentarSCAN: boolean;
    function InserirHistEstMoto: boolean;
    function AbrirComFat: boolean; overload;
    function AbrirComFat(pCodigo: Integer): boolean; overload;
    procedure AtualizarVeiculos(buscas2: TIBQuery);
    function cl_abreExtrato_form(ACodCliente: Integer): boolean;
  var
    vtipdoc: string;
    vsrec, vlVnd, vlrec: Currency;
    qtdvnd: Integer;
    vcliente, vvendedor, vcondpag, vnatop: string;
    vTestarDtFechcomDtCaixa: boolean;
    vClienteVeic: RClientes; //Variaveis de configuracao do cliente
  end;

  TPendRecV = class(TDataSet_OOP)
  private
    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    function recebendo: boolean;
    function post: boolean; override;
    function marcaRec(vtp: integer): boolean;
    function confirmarecebimento(ValorRecebido: currency): boolean;
    function abrePendRec: boolean;
    function PegaInfRec: boolean;
    function verificarRecibo: boolean;
  var
    vtipdoc: string;
    vsrec, vlVnd, vlrec: Currency;
    qtdvnd: Integer;
    vTestarDtFechcomDtCaixa: Boolean;
  end;

  TLancCXL = class(TDataSet_OOP)
  private
    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    function PegaInfRec: boolean;
    function AbreLancCXL: boolean;
    function versomentelancavl: boolean;
  var
    vtipdoc: string;
    vsrec, vlVnd, vlrec,vllancavl: Currency;
    qtdvnd: Integer;
  end;

  TFecdCXL = class(TDataSet_OOP)
  private
    valorPendenteRecibo: Currency;
    buscasGeral: tibquery;
  public
    constructor create;
    destructor destroy; override;
    function abreFecDia: boolean;
    function ConfirmaFechamentoCXL: boolean;
    function montaarqCXL: boolean;
    function DiaAberto: Tdate;
    function maparesumo(ModRel: Integer; RdResumo: Trdprint): boolean;
    procedure cablanc(rdresumo: Trdprint);
    procedure cadresumo(rdresumo: Trdprint);
    procedure reldetResumo(RdRelCxl: Trdprint);
    procedure cabrelcxl(rdrelcxl: TrdPrint; detalhar: boolean = false);
    procedure relrecibosrec(Rdrecibos: trdprint);
    procedure cabrecibosrec(Rdrecibos: Trdprint;vdia: Tdate);
    procedure pegainfrecpre;
    function reabredia: boolean;
    function _validaDiaFech: boolean;
    function _carga_fin_emAberto: Boolean;

  var
    vtipdoc: string;
    vsrec, vlVnd, vlrec: Currency;
    qtdvnd: Integer;
    linha,vpag: integer;
    vPosDtMov, vPosTipo, vPosNDoc, vPosValor, vPosHistorico, vPosControle, vPosValorRec: Integer;
  end;

  TContrCXL = class(TDataSet_OOP)
  private
    valorPendenteRecibo: Currency;
  public
    constructor create;
    destructor destroy; override;
    function abrePendcontrCXL(vtp: integer): boolean;
    function retornaCtrl(vcomb: TComboBox): boolean;
    function retornaContas(vcomb: TComboBox; pEntSaida: string): boolean;
    function procControle(vnome: string): integer;
    function procconta(vnome: string): real;
    function testarNumConta(pNatureza: string; pNumConta: Double; var pMensagem: string): boolean;
    function _dadosNContaPlcValidos(pNatureza: string; pNumConta: Double): boolean;
  var
  	 rConta: RConsultaConta;
    vpermitir: boolean;
  end;

  TFormRecCXL = class(TDataSet_OOP)
  private
    valorPendenteRecibo: Currency;
    vtipdoc: string;
    vsrec, vlVnd: Currency;
    qtdvnd: Integer;
  public
    constructor create;
    destructor destroy; override;
    function AbreformpgCXL(vtp: integer): boolean;
    function SomaFormCXL: boolean;
    function fechdet: boolean;
  var
    vlrec, vljuros: Currency;
  end;

  //Criar aqui a classe de cliente/condpag/natop...etc

implementation

uses
  IBDatabase, uDadosIni, SysUtils, Dialogs, Variants, DB, uDtmAtivo, UDTMbALCAO,
  Windows, funcoes, StrUtils, config_sistema_class, hw_utils, Math,
  ContainerUnit, CallerNFSeFeaturesUnit,
  Query_OOP;

{ TPendReq }

function TPendReq.abrePendReq: boolean;
begin
  result := montaSelect('select %s from pedvenda rq ' +
    ' inner join clientes cl on rq.cod_cliente = cl.cod_cliente and rq.cod_empresa = cl.cod_empresa ' +
    ' left join nfce on nfce.cod_nfce = rq.cod_nfce and nfce.cod_empresa = rq.cod_empresa' +
    ' Where rq.data_fech is not null and rq.tipo = '''+vtipdoc+''' and status_ped = ''FECHADA'' ' +
    ' and (rq.dia_cxl is null or rq.dia_cxl = :data or rq.dia_cxl = :data1 )' +
    ' and (rq.op_cxl = ' + IntToStr(vDadosIni.vcodOpCxl) + ' or rq.op_cxl is null or rq.op_cxl = 0) ' +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1' +
    ' and (rq.cxl is null or rq.cxl = ''S'') ' +
    vDadosIni.IfThen(vDadosIni.vEcommerce.vHabilitarEcommerce,
      vDadosIni.IfThen(vecommerce = 'S',
        ' and rq.id_commerce > 0 ',
        ' and (rq.id_commerce is null or rq.id_commerce <= 0) '),
      '') +
    ' order by rq.data_fech,rq.nped', vDadosIni.diaFCxl, vDadosIni.diaFCxl, [CamposSQL]);

  //  result := montaSelect('select rq.nreq,cl.nome_cliente,rq.valor_total,rq.data_req,rq.data_c,' +
  //    'rq.obs_cxl_rq,rq.vl_rq_pg_cxl,rq.status_cxl_rq,rq.dia_cxl,rq.v_desc,rq.p_desc,' +
  //    'cl.cod_cliente,rq.cod_cond_pag,rq.cod_vendedor,rq.op_cxl,rq.vl_entrada,' +
  //    'rq.codigo_ctrl,rq.cod_empresa,rq.NPREVENDA,rq.NCUPOM,rq.NSERIEECF,rq.OPERADOR ' +
  //    'from REQVENDA rq,CLIENTES CL ' +
  //    'Where rq.data_c is not null and ' +
  //    '(rq.dia_cxl is null or rq.dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) + ')' +
  //    ' and rq.cod_cliente = cl.cod_cliente and rq.cod_empresa = cl.cod_empresa and ' +
  //    '(rq.op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' or rq.op_cxl is null or rq.op_cxl = 0) ' +
  //    'and rq.cod_empresa = ' + vDadosIni.codEmpresa + ' and rq.ativo = 1 order by rq.data_c,rq.nreq ');

end;

function TPendReq.abrirPedVenda: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
	try
  	vDadosIni.vPesquisa := 'PEDVENDA_ABRIR|';
		formulario := Funcoes.AbreForm('pkPedidoVenda', 'TFrmCadPedVenda', hdTemp);

    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TPendReq.cl_abreExtrato_form(ACodCliente: Integer): boolean;
var
  AProcedure: Tcl_abreExtrato_form;
  AQueryRescue: TIBQuery;
  AUseQueryIni: Boolean;
begin
  try
  	if not vDadosIni._mdiAberto('TFrmCadClientes', 'Cadastro do cliente ja esta aberto, feche o cadastro para utilizar esta funcionalidade') then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    
    if vClienteReq.AHandle = 0 then
      CarregaPacote('pkClientes', vClienteReq.AHandle);

    if vClienteReq.AHandle = 0 then
    begin
      Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
      Exit;
    end;
    @AProcedure := GetProcAddress(vClienteReq.AHandle, 'cl_abreExtrato_form');

    if Assigned(AProcedure) then
      Result := AProcedure(ACodCliente);
  finally
  end;
end;

function TPendReq.confirmarecebimento(ValorRecebido: currency): boolean;
var
	existeProdutos, existeRetencaoProdutos, existeRetencaoServicos: boolean;
begin
  try
    IniciaTransacao;
    edit;
    dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
    dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
    dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
    //    dataSet.FieldByName('VL_RQ_PG_CXL').Value := ValorRecebido;
    dataSet.FieldByName('VL_PAGO_CXL').Value := dataSet.FieldByName('VALOR_TOTAL').Value;
    Post;
    if Apply then
      result := true
    else
      Result := false;

    _carga_fin_atualizarStatusCarga;

    vDadosIni.informarSituacaoPedido(
      dataSet.FieldByName('nped').AsInteger, dataSet.FieldByName('tipo').AsString,
      'ACERTO',
      'Finalizado',
      '',
      buscas, False, False);

    CommitaTransacao;

    if trim(dataSet.fieldbyname('TIPO').AsString) = 'OS' then
      vDadosIni.imprimirReciboLocacao(
        buscas,
        dataSet.FieldByName('NPED').AsInteger,
        dataSet.FieldByName('TIPO').AsString,
        dataSet.FieldByName('COD_CLIENTE').AsInteger,
        'CXL',
        False);

//      if dataSet.FieldByName('TIPO_OS').AsString <> 'GARANTIA' then
    if trim(dataSet.fieldbyname('TIPO').AsString) <> 'OS' then
    begin
      if NFCeAutomaticaAtiva then
        enviarVendaParaNFCe
      else
        enviarVendaParaCupom;
    end
    else if ExecutaComandosSql('select * from tipo_vendas tv where coalesce(tv.tipo_os,'''')='+
      QuotedStr(trim(dataSet.FieldByName('TIPO_OS').AsString))+' and tv.tipo ='+
      QuotedStr(trim(dataSet.fieldbyname('TIPO').AsString))+' and coalesce(tv.comgarantia,'''')<>''S''') then
    begin
      if NFCeAutomaticaAtiva then
        enviarVendaParaNFCe
      else
        enviarVendaParaCupom;
    end
    else
      MessageDlg('O.S. de garantia proceder com emissao da nf e verificar o CFOP correto',mtinformation,[mbOK],0);

    existeProdutos := vDadosIni.existeProdutoDoc( buscas, fint('nped'), fstr('tipo'));

    existeRetencaoProdutos := fdif('tipo', 'ORC')
      and fequals('nf_ac_calctrib', 'S')
      and existeProdutos
      and vDadosIni.RetencaoClienteNFe(
        buscas, IfThen(fint('cod_cli_fat') > 0, fint('cod_cli_fat'), fint('cod_cliente'))
      );

    existeRetencaoServicos := fequals('tipo', 'OS')
      and Container.GetInstance().ErpFeaturesFactory.CreateChecarPossivelRetencaoNFSeUseCase()
        .Executar(fint('nped'));

    if existeRetencaoProdutos or existeRetencaoServicos then
      // Nota Fiscal de Produto e Serviço já emitida anteriormente
    else
    begin
      if existeProdutos then
        emitirNotaDoPedido();

      // Internamente o metodo ja testa sem é OS e tem serviços
      verificaOSNFSe;
    end;
    {
    vExisteServicoOS           := False;
    vRetencaoFedClienteNF      := False;
    vRetencaoFedClienteNFS     := False;
    vRetencaoFedTpServNFS      := False;
    vIssRetidoClienteNFS       := False;
    vIssRetidoTpServNFS        := False;

    vExisteProduto             := vDadosIni.existeProdutoDoc(
                                    buscas,
                                    fint('nped'),
                                    fstr('tipo'));

    if trim(dataSet.fieldbyname('TIPO').AsString) <> 'ORC' then
    begin
      if fstr('nf_ac_calctrib') = 'N' then
        vRetencaoFedClienteNF  := False
      else
        vRetencaoFedClienteNF  := vDadosIni.RetencaoClienteNFe(
                                    buscas,
                                    IfThen(fint('cod_cli_fat') > 0, fint('cod_cli_fat'), fint('cod_cliente')));
    end;

    if trim(dataSet.fieldbyname('TIPO').AsString) = 'OS' then
    begin
      vExisteServicoOS         := vDadosIni.existeServicoDoc(
                                    buscas,
                                    fint('nped'),
                                    fstr('tipo'));

      vIssRetidoClienteNFS     := vDadosIni.IssRetidoClienteNFSe(
                                    buscas,
                                    fint('cod_cliente'));

      vIssRetidoTpServNFS      := vDadosIni.IssRetidoTpServicoNFSe(
                                    buscas,
                                    fint('nped'),
                                    fstr('tipo'));

      vRetencaoFedClienteNFS   := vDadosIni.RetencaoClienteNFSe(
                                    buscas,
                                    fint('cod_cliente'));

      vRetencaoFedTpServNFS    := vDadosIni.RetencaoTpServicoNFSe(
                                    buscas,
                                    fint('nped'),
                                    fstr('tipo'));
    end;

    if ((vExisteProduto) and (vRetencaoFedClienteNF))
      or ((vExisteServicoOS) and ((vIssRetidoClienteNFS) or (vIssRetidoTpServNFS) or (vRetencaoFedClienteNFS) or (vRetencaoFedTpServNFS))) then
    begin
      // Nota Fiscal de Produto e Serviço já emitida anteriormente
    end
    else
      verificaOSNFSe;
    }
  except
    on e: exception do
    begin
      RollBackTransacao;
      result := false;
      Application.MessageBox(pchar('Erro na Gravação: '+
      e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
      registraErro('Erro CXL: ' + e.Message);
    end;
  end;
end;

constructor TPendReq.create;
begin
  DataSet := TClientDataSet(DtmBalcao.CdsPendBalcao);
  transacao := TIBTransaction(DtmBalcao.IbTransBalcao);
  buscas := TIBQuery(DtmBalcao.qrBuscas);
  buscas.close;
  buscas.sql.text:='SELECT EM_NF,USPREVENDA,MODELO_NF_SERV FROM EMPRESA WHERE COD_EMPRESA = '+vDadosIni.codEmpresa+' AND ATIVO = 1';
  buscas.Open;
  vemit_nf:=buscas.FieldByName('EM_NF').AsString;
  vusprevenda:=buscas.FieldByName('USPREVENDA').AsString;
  vmodserv:=trim(buscas.FieldByName('MODELO_NF_SERV').AsString);
  name := 'TPendReq';

  vTestarDtFechcomDtCaixa := false;
end;

destructor TPendReq.destroy;
begin
  inherited;
  Close;
end;

function TPendReq.emitirNotaDoPedido(pExibirMensagem: Boolean = True): Boolean;
type
  TEmitirNotaDoPedido = function(numero: Integer; tipo: string): Boolean;
var
  emitirNotaDoPedido: TEmitirNotaDoPedido;
	vOK: Boolean;
begin
  vOK := True;

  if pExibirMensagem then
		vOK := Application.MessageBox(Pchar('Deseja Emitir NF desta Venda?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES;

  if (Self.vemit_nf <> 'S') or (not Self.verificaemissaonf(1)) or (not vOK) then
    Exit;

  @emitirNotaDoPedido := GetProcAddress(vDadosIni.vNotaFiscal.AHandle, PChar('nf_emitir_from_pedvenda'));
  if Assigned(emitirNotaDoPedido) then
    emitirNotaDoPedido(Self.fint('nped'), Self.fstr('tipo'));
end;

function TPendReq.existeDevInternaPendenteNF: Boolean;
var
  vlista, vListaCodNF: TStringList;
  I: Integer;
begin
  Result := False;

  if (vtipdoc = 'REQ') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select distinct d.sequencia, cod_nf from devolucao d' +
      ' where d.cod_venda = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and d.tipo_venda = ''REQ'' and d.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
      Exit;

    vlista := TStringList.Create;
    vListaCodNF := TStringList.Create;
    vlista.Clear;
    vListaCodNF.Clear;
    buscas.First;
    while not buscas.Eof do
    begin
      vlista.Add(IntToStr(buscas.FieldByName('SEQUENCIA').AsInteger));
      vListaCodNF.Add(IntToStr(buscas.FieldByName('COD_NF').AsInteger));
      buscas.Next;
    end;

    for I := 0 to vlista.Count - 1 do
    begin
      buscas.Close;
      buscas.SQL.Text := 'select COD_DEVOLUCAO from notafiscal' +
        ' where COD_DEVOLUCAO = ' + vlista[i] +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      if buscas.FieldByName('cod_devolucao').AsInteger = 0 then
      begin       
        buscas.Close;
        buscas.SQL.Text := 'select COD_NF from notafiscal' +
          ' where COD_NF = ' + vListaCodNF[i] +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if buscas.FieldByName('COD_NF').AsInteger = 0 then
        begin
          Result := True;
          Application.MessageBox(pchar('A devolução de número ' + vlista[I] + ' ainda não teve nota fiscal emitida'),'',0 + 64);

          if not vDadosIni.PesqPros('CXL071', 'VALIDAR', 'DEV ' + vlista[i] , 'PEDVENDA', dataSet.FieldByName('NPED').AsString, buscas, True) then
            Exit;

          if Application.MessageBox('Deseja continuar mesmo assim?',
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
            Result := False;
        end;
      end;

    end;

  end;
end;

function TPendReq.existeRetencaoFederalCliente: Boolean;
var
  conf: TConfig_sistema_class;
begin
  Result := False;

  conf := TCfg_sis.getConf('nf_s_retencoes_federais', queryCons.query, vDadosIni.cod_empresa);
  try
    if not conf.AsBoolean then
      Exit;
  finally
    queryCons.Close;
    conf.Free;
  end;

  queryCons.SQL(Format('select pv.nf_ac_calctrib, cl.ret_fed from pedvenda pv' +
                       ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
                       ' where pv.nped = %d and pv.tipo = ''%s'' and pv.cod_empresa = %d',
                       [fint('nped'), fstr('tipo'), vDadosIni.cod_empresa]))
    .Open;

  if queryCons.fequals('nf_ac_calctrib', 'N') then
    Result := False
  else
    Result := queryCons.fint('ret_fed') > 0;

  queryCons.Close;
end;

function TPendReq.marcaRec(vtp: integer): boolean;
var
  vNped: Integer;
begin
  try
    Result := False;
    
    IniciaTransacao;
    edit;
    if vtp = 1 then
    begin
      if (dataSet.FieldByName('STATUS_CXL_RQ').AsString <> 'R') then
        if ((dataSet.FieldByName('NUM_NF').IsNull) and (dataSet.FieldByName('NCUPOM').IsNull)) then
        begin
          vDadosIni.vInibeMensPesqPros := 'S';
          if not vDadosIni.PesqPros('CXL063', 'VALIDAR', 'VERIFICAR PEND. NF OU CUPOM NO RECEBIMENTO CXL', 'PEDVENDA', '', buscas, false) then
          begin

            if Application.MessageBox(pchar('Documento a ser recebido não possuí documento fiscal, Deseja continuar com o recebimento?'), 'Confirmação',
              MB_ICONQUESTION + MB_YESNO) = IDNO then
              exit;

            if not vDadosIni.PesqPros('CXL064', 'VALIDAR', 'PERMITIR PEND. NF OU CUPOM NO RECEBIMENTO CXL', 'PEDVENDA',
              dataSet.FieldByName('NPED').AsString, buscas, true) then
              exit;
          end;
        end;

      vNped := dataSet.FieldByName('nped').AsInteger;
      try
        dataSet.RefreshRecord;
        if vNped <> dataSet.FieldByName('nped').AsInteger then
        begin
          Result := False;
          Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
            'Atenção', 0 + 64);
          Exit;
        end;

      except on E: Exception do
        begin
          if Pos('changed by another user', e.Message) > 0 then
          begin
            Result := False;
            Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
              'Atenção', 0 + 64);
            Exit;
          end;
        end;
      end;

      if vtp = 1 then
        if ((vTestarDtFechcomDtCaixa) and (dataSet.FieldByName('DATA_FECH').AsDateTime <> vDadosIni.diaFCxl)) then
        begin
          Result := False;

          Application.MessageBox(PChar('Data de fechamento do documento diferente da data do caixa auxiliar.' + #13 +
             'Data de fechamento: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('data_fech').AsDateTime) + #13 +
             'Data do caixa: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.diaFCxl) + #13 + #13 +
             'Favor verificar antes de continuar!'), 'Atenção', 0 + 64);

          if not vDadosIni.PesqPros('CXL079', 'PERMITIR',
            'DATA FECH DIF DATA CAIXA - TIPO ' + trim(dataSet.FieldByName('TIPO').AsString) + ' NUM DOC ' + IntToStr(dataSet.FieldByName('NPED').AsInteger),
            'PEDVENDA', '', buscas, false) then
            Exit;
        end;

      {if  dataset.FieldByName('NPREVENDA').AsString = '' then
      begin
       if (vDadosIni.vEmp.vUsarPreVenda <> 'S') or (vtipdoc <> 'REQ') then
       if vusprevenda = 'S' then
        dataSet.FieldByName('NPREVENDA').AsInteger:=Gencodigo('PREVENDA', DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
      end;}
      dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
      dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
      dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
    end
    else
    begin
      dataSet.FieldByName('DIA_CXL').Value := null;
      dataSet.FieldByName('STATUS_CXL_RQ').value := null;
      dataset.FieldByName('OP_CXL').value := null;
      dataset.FieldByName('VL_PAGO_CXL').value := 0;
      _carga_fin_removerStatusCarga;

      vDadosIni.informarSituacaoPedido(
        dataSet.FieldByName('nped').AsInteger, dataSet.FieldByName('tipo').AsString,
        'ACERTO',
        'Finalizado',
        '',
        buscas, False, False, True);
    end;
    Post;
    if Apply then
      result := true
    else
      Result := false;
    CommitaTransacao;
  except
    RollBackTransacao;
    MessageDlg('Erro ao marcar o documento para recebimento', mterror, [mbOK], 0);
  end;
end;

function TPendReq.PegaInfRec: boolean;
begin
//  Close;
//  Open;
  abrePendReq;
  vlVnd := 0;
  vsrec := 0;
  vlrec := 0;
  vlInter := 0;
  qtdvnd := 0;
//  vtipdoc := 'REQ';
  while not dataset.Eof do
  begin
    if ((dataset.FieldByName('VL_PAGO_CXL').IsNull) or (dataSet.FieldByName('VL_PAGO_CXL').value =
      0)) and (dataset.FieldByName('DATA_FECH').AsDateTime <= vdadosini.diaFCxl) then
      vsrec := vsrec + dataset.FieldByName('VALOR_TOTAL').AsCurrency;
    dataSet.next;
  end;
  buscas.Close;
  buscas.SQL.Text := 'select sum(valor_TOTAL),count(*)  from PEDVENDA where ' +
    'dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and cod_empresa = ' +
    vDadosIni.codEmpresa + ' AND TIPO = ''REQ'' AND ATIVO = 1 ';
//  	'select sum(valor_total),count(*)  from reqvenda where ' +
//    'dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
//    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and cod_empresa = ' +
//    vDadosIni.codEmpresa + ' AND ATIVO = 1 ';
  buscas.open;
  vlVnd := buscas.Fields[0].AsCurrency;
  qtdvnd := buscas.Fields[1].AsInteger;

  buscas.Close;
  buscas.SQL.text := 'select coalesce(lanc.taxa_intermediador, ''N'') taxa_intermediador, ' +
  	'	sum(coalesce(lanc.valor_cxl, 0)) valor_cxl from lanccxl lanc ' +
    '	where lanc.op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) +
    ' and lanc.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and lanc.data_lc_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' group by 1 ';
  buscas.open;
  buscas.First;
  while not buscas.Eof do
  begin
    if buscas.FieldByName('taxa_intermediador').AsString = 'S' then
      vlInter := vlInter + buscas.FieldByName('valor_cxl').AsCurrency;
    buscas.Next;
  end;
end;

//function TPendReq.open: Boolean;
//begin
{close;
dataSet.CommandText:='select rq.nreq,cl.nome_cliente,rq.valor_total,rq.data_req,rq.data_c,'+
'rq.obs_cxl_rq,rq.vl_rq_pg_cxl,rq.status_cxl_rq,rq.dia_cxl,rq.v_desc,rq.p_desc,'+
'cl.cod_cliente,rq.cod_cond_pag,rq.cod_vendedor,rq.op_cxl,rq.vl_entrada,'+
'rq.codigo_ctrl,rq.cod_empresa,rq.NPREVENDA,rq.NCUPOM,rq.NSERIEECF,rq.OPERADOR '+
'from REQVENDA rq,CLIENTES CL '+
 'Where rq.data_c is not null and '+
'(rq.dia_cxl is null or rq.dia_cxl = '+chr(39)+FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)+chr(39)+')'+
' and rq.cod_cliente = cl.cod_cliente and rq.cod_empresa = cl.cod_empresa and '+
'(rq.op_cxl = '+IntToStr(vDadosIni.vCodOpCxl)+' or rq.op_cxl is null or rq.op_cxl = 0) '+
'and rq.cod_empresa = '+vDadosIni.codEmpresa+' and rq.ativo = 1 ORDER BY rq.data_c,rq.nreq ';
messagedlg(dataSet.CommandText,mtinformation,[mbOK],0);
inherited open;}
{result:=montaSelect('select rq.nreq,cl.nome_cliente,rq.valor_total,rq.data_req,rq.data_c,'+
'rq.obs_cxl_rq,rq.vl_rq_pg_cxl,rq.status_cxl_rq,rq.dia_cxl,rq.v_desc,rq.p_desc,'+
'cl.cod_cliente,rq.cod_cond_pag,rq.cod_vendedor,rq.op_cxl,rq.vl_entrada,'+
'rq.codigo_ctrl,rq.cod_empresa,rq.NPREVENDA,rq.NCUPOM,rq.NSERIEECF,rq.OPERADOR '+
'from REQVENDA rq,CLIENTES CL '+
 'Where rq.data_c is not null and '+
'(rq.dia_cxl is null or rq.dia_cxl = '+chr(39)+FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)+chr(39)+')'+
' and rq.cod_cliente = cl.cod_cliente and rq.cod_empresa = cl.cod_empresa and '+
'(rq.op_cxl = '+IntToStr(vDadosIni.vCodOpCxl)+' or rq.op_cxl is null or rq.op_cxl = 0) '+
'and rq.cod_empresa = '+vDadosIni.codEmpresa+' and rq.ativo = 1 order by rq.data_c,rq.nreq ');}
//end;

function TPendReq.post: boolean;
begin
  inherited post;
end;

function TPendReq.recebendo: boolean;
begin
  result := ExecutaComandosSql('select op_cxl from pedvenda where nped = ' +
    dataset.FieldByName('nped').AsString + ' and ' +
    '(op_cxl is null or op_cxl = 0 or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
      ') and COD_EMPRESA = ' +
    vDadosIni.codEmpresa + ' and tipo = '''+vtipdoc+''' AND ATIVO = 1');
  //  result := ExecutaComandosSql('select op_cxl from reqvenda where nreq = ' + dataset.FieldByName('NREQ').AsString + ' and ' +
  //    '(op_cxl is null or op_cxl = 0 or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ') and COD_EMPRESA = ' +
  //    vDadosIni.codEmpresa + ' AND ATIVO = 1 ');
end;


function TPendReq.verificadiferenca: boolean;
var
  valorPago: currency;
begin
  Buscas.Close;
  Buscas.SQL.Text := 'SELECT sum(valordoc) as valordoc FROM FORMPAGAMENTO ' +
  ' WHERE NREQUISICAO = ' + dataSet.FieldByName('NPED').asstring +
  ' AND TPDOCS = '''+ vtipdoc + ''' and OP_CXL = ' + inttostr(vDadosIni.vcodopcxl) +
  ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1';
  Buscas.Open;
  valorpago:=dataSet.FieldByName('vl_pago_cxl').AsCurrency;
  if RoundTo(valorPago, -2) > RoundTo(Buscas.FieldByName('valordoc').AsCurrency, -2) then
    result := true
  else if RoundTo(dataSet.FieldByName('vl_pago_cxl').AsCurrency, -2) > RoundTo(dataSet.FieldByName('valor_total').AsCurrency, -2) then
    result := true
  else
   result := false;
end;

function TPendReq.verificanentrada: boolean;
begin
  Result:=True;
  if dataSet.FieldByName('VL_ENTRADA').AsFloat > 0 then
  begin
      buscas.close;
      buscas.sql.text:='SELECT cod_controle FROM FORMPAGAMENTO WHERE NREQUISICAO = ' +
        dataSet.FieldByName('NPED').asstring+ ' AND TPDOCS = '''+vtipdoc+
        ''' AND COD_EMPRESA = ' + vDadosIni.codEmpresa+ ' and ATIVO = 1';
      buscas.open;
      while not Buscas.eof do
      begin
        if Buscas.fieldbyname('COD_CONTROLE').value = dataset.fieldbyname('CODIGO_CTRL').AsInteger then
          break;
        Buscas.next;
      end;
      if Buscas.eof then
      begin
        buscas.close;
        buscas.sql.text:='SELECT NOME_CTRL FROM CONTROLES WHERE CODIGO_CTRL = ' +
        dataSet.FieldByName('CODIGO_CTRL').asstring + ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa;
        buscas.open;
        Application.MessageBox(pchar('Recebimento incorreto, Este documento tem entrada de: ' +
          format('%n', [dataset.fieldbyname('VL_ENTRADA').ascurrency]) + ' em ' + Buscas.fieldbyname('NOME_CTRL').asstring),
        'Atenção',MB_ICONEXCLAMATION + MB_OK);

        if vDadosIni.PesqPros('CXL084', 'PERMITIR',
        	'NAO INFORMAR VALOR DE ENTRADA - TIPO ' + dataSet.FieldByName('TIPO').AsString + ' NUM DOC ' + IntToStr(dataSet.FieldByName('NPED').AsInteger),
          'PEDVENDA', dataSet.FieldByName('NPED').AsString, buscas, True) then
        begin
        	Result := true;
          Exit;
        end;

        Result:=false;
      end;
  end;
end;    

function TPendReq.verificaOSNFSe(pReImprimir: Boolean = False; pExibirMensagem: Boolean = True): boolean;
var
	vOK: Boolean;
begin
  if trim(dataSet.fieldbyname('TIPO').AsString) = 'OS' then
  begin
//    buscas.close;
//    buscas.sql.text:='SELECT MODELO_NF_SERV FROM EMPRESA WHERE COD_EMPRESA = '+vDadosIni.codEmpresa;
//    buscas.open;
//    vmodserv:=
    if vmodserv = '55' then
    begin
      buscas.close;
      buscas.sql.text := ' select count(*) as qtde, ' +
     	  ' sum(coalesce(valor_tot_serv, 0) - coalesce(rateio_desc, 0)) as valor from pedvenda_serv ' +
        ' where nped = ' + IntToStr(dataSet.FieldByName('NPED').AsInteger) +
        ' and tipo = ' + QuotedStr(dataSet.FieldByName('TIPO').AsString) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
     	  ' and valor_tot_serv <> 0 ' +
        vDadosIni.IfThen(not pReImprimir,
        	' and (n_nf is null or n_nf = 0) ', '') +
        ' and (status is null or status = '''') ';
      buscas.open;
      if buscas.FieldByName('qtde').AsInteger > 0 then
      begin
      	vOK := True;

        if pExibirMensagem then
      		vOK := Application.MessageBox(Pchar('Deseja Emitir NFSe dos serviços desta Venda no valor de:'+format('%n', [buscas.fieldbyname('valor').ascurrency])+'?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES;

      	if vOK then
          CallerNFSeFeatures.Emitir( fint('nped'), False );
      end;
    end;
  end;
end;

function TPendReq._carga_abrePendReq: Boolean;
begin
  result := montaSelect('select %s from pedvenda rq' +
                        ' inner join CLIENTES CL on cl.cod_cliente = rq.cod_cliente and cl.cod_empresa = rq.cod_empresa' +
    ' left join nfce on nfce.cod_nfce = rq.cod_nfce and nfce.cod_empresa = rq.cod_empresa' +
    ' Where rq.data_fech is not null and rq.tipo = '''+vtipdoc+''' and status_ped = ''FECHADA'' and ' +
    ' (rq.dia_cxl is null or rq.dia_cxl = :data or rq.dia_cxl = :data1 ) and' +
    ' (rq.op_cxl = ' + IntToStr(vDadosIni.vcodOpCxl) + ' or rq.op_cxl is null or rq.op_cxl = 0) ' +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa + ' and rq.ativo = 1' +
    ' and rq.cod_carga = ' + IntToStr(fCarga) +
    ' order by rq.data_fech,rq.nped', vDadosIni.diaFCxl, vDadosIni.diaFCxl, [CamposSQL]);
end;

function TPendReq._carga_fechada(pCod_Carga: Integer): Boolean;
begin
  fCarga := 0;

  Result := False;

  if pCod_Carga = 0 then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select cod_carga, status from carga' +
    ' where cod_carga = ' + IntToStr(pCod_Carga) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if buscas.FieldByName('cod_carga').AsInteger <> pCod_Carga then
  begin
    Application.MessageBox(pchar('Não foi possivel localizar no banco de dados a carga informada'), 'Atenção', 0 + 64);
    Exit;
  end;

  if Trim(buscas.FieldByName('status').AsString) <> 'FECHADA' then
  begin
    Application.MessageBox(pchar('Carga ainda não fechada pelo setor do Estoque'), 'Atenção', 0 + 64);
    Exit;
  end;

  fCarga := pCod_Carga;
  Result := True;

end;

function TPendReq._carga_fin_atualizarStatusCarga: Boolean;
var
  vRecebendo: Boolean;
  vStatus: string;
begin /// Esse metodo é chamado antes de gravar a transacao no metodo de confirmar o recebimento
//  try
    Result :=  True;

    if Trim(dataSet.FieldByName('tipo').AsString) <> 'REQ' then
      exit;

    if dataSet.FieldByName('cod_carga').AsInteger = 0 then
      exit;

    buscas.Close;
    buscas.SQL.Text := 'select count(nped) cont from pedvenda' +
      ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and nped <> ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and tipo = ''REQ'' '+
      ' and coalesce(VL_PAGO_CXL, 0) = 0';
    buscas.Open;

    vRecebendo := buscas.FieldByName('cont').AsInteger > 0;

    if vRecebendo then
      vStatus := 'RECEBENDO'
    else
      vStatus := 'FECHADA';

    buscas.Close;
    buscas.SQL.Text := 'update carga set status_fin = ' + QuotedStr(vStatus) + ',' +
      ' DIA_CXL = :DIA_CXL' +
      ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(status_fin,'''') <> ' + QuotedStr(vStatus);
    buscas.ParamByName('DIA_CXL').AsDate := vDadosIni.diaFCxl;
    buscas.ExecSQL;

//  except
//    on e: exception do begin
//      Result := False;
//      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
//    end;
//  end;
end;

function TPendReq._carga_fin_concederDesconto: Boolean;
var
  vPercMaxDescontoAVista, vDescConcedido, vPercConcedido,
    vValorTotalProdutos, vValorDevolucao: Extended;
  vPercMaxDescontoAVistaSTR: string;
begin
  try
    Result := False;

    if Trim(dataSet.FieldByName('tipo').AsString) <> 'REQ' then
      exit;

    if Trim(dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R' then
      raiseExceptionCreate('Venda já recebida pelo caixa', '');

    if not vDadosIni.PesqPros('CXL069','DESCONTO', 'CARGA ' +
      dataSet.FieldByName('COD_CARGA').AsString + ' REQ ' +
      dataSet.FieldByName('NPED').AsString, 'CARGA',
      dataSet.FieldByName('COD_CARGA').AsString, Buscas, True) then
      Exit;

    buscas.Close;
    buscas.SQL.Text := ' select sum(case when(d.valor_tot > 0) then d.valor_tot else (d.valor * d.quant) end) valor from devolucao d ' +
      ' where d.cod_venda = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and d.tipo_venda = ''REQ'' ' +
      ' and d.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    vValorDevolucao := buscas.FieldByName('valor').AsFloat;

    if vValorDevolucao > 0 then
      Application.MessageBox(pchar('Venda com devolução no valor de: ' + Format('%0.2n', [vValorDevolucao]) + #13 +
        'O valor da devolução não entra para o calculo do desconto'), 'Atenção', 0 + 64);

    buscas.Close;
    buscas.SQL.Text := 'select MAX_DESC_AVISTA from empresa' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    vPercMaxDescontoAVista := buscas.FieldByName('MAX_DESC_AVISTA').AsFloat;
    vPercMaxDescontoAVistaSTR := Format('%0.2f', [vPercMaxDescontoAVista * (dataSet.FieldByName('tot_prod').AsFloat) / 100]);

    if not InputQuery('Máximo Desconto: ' + Format('%0.2f', [vPercMaxDescontoAVista]) + '%',
      'Informe o valor do desconto a conceder: ', vPercMaxDescontoAVistaSTR) then
      Exit;

    try
      vDescConcedido := StrToFloat(vPercMaxDescontoAVistaSTR);
      vDescConcedido := vDadosIni.StrToFloatFormat(vDescConcedido,2);
    except
      raiseExceptionCreate('Valor informado inválido', '');
    end;

    if vDescConcedido < 0 then
      raiseExceptionCreate('Valor informado inválido. Valores negativos não sao aceitos', '');

    if vDadosIni.StrToFloatFormat(vDescConcedido,2) >= vDadosIni.StrToFloatFormat(dataSet.FieldByName('valor_total').AsFloat - vValorDevolucao,2) then
      raiseExceptionCreate('Valor informado inválido. Valor do desconto maior ou igual ao valor da venda', '');

    vPercConcedido := vDescConcedido / dataSet.FieldByName('tot_prod').AsFloat * 100;

    if vDadosIni.StrToFloatFormat(vPercConcedido, 2) > vDadosIni.StrToFloatFormat(vPercMaxDescontoAVista,2) then
    begin
      if not vDadosIni.PesqPros('CXL070','FECHAR', 'CARGA ' +
        dataSet.FieldByName('COD_CARGA').AsString + ' REQ ' +
        dataSet.FieldByName('NPED').AsString + ' DESC EMP ' +
        Format('%0.2f', [vPercMaxDescontoAVista]) + ' DESC PEDIDO ' +
        Format('%0.2f', [vPercConcedido]), 'PEDVENDA',
        dataSet.FieldByName('NPED').AsString, Buscas, True) then
        raiseExceptionCreate('Valor do desconto informado maior que o permitido pela empresa', '');
      if Application.MessageBox(Pchar('Valor do desconto informado maior que o permitido pela empresa' + #13 +
        'Desconto Max na empresa: ' + Format('%0.2f', [vPercMaxDescontoAVista]) + '%' + #13 +
        'Desconto concedido no Pedido: ' + Format('%0.2f', [vPercConcedido]) + '%' + #13 +
        'Deseja continuar mesmo assim?'),
        'Confirmação', MB_ICONQUESTION + MB_YESNO ) <> IDYES then
      begin
        Result := False;
        Exit;
      end;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select sum(VLTOT_PED_ITEM) VLTOT_PED_ITEM from pedvenda_prod' +
      ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').AsString)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(status, '''') = ''''';
    buscas.Open;

    vValorTotalProdutos := buscas.FieldByName('vltot_ped_item').AsFloat;

    // Voltando o valor do rateio no desconto a vista concedido pelo caixa auxiliar caso o desconto ja tenha sido aplicado
    buscas.Close;
    buscas.SQL.Text := 'update pedvenda_prod set' +
      ' rateio_desc = (coalesce(rateio_desc, 0) - (coalesce(rat_desc_avista, 0))),' +
      ' rat_desc_avista = 0' +
      ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').AsString)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(status, '''') = ''''' +
      ' and coalesce(rat_desc_avista, 0) > 0';
    buscas.ExecSQL;

    // Aplicando o desconto proporcional ao valor de cada item na requisição
    buscas.Close;
    buscas.SQL.Text := 'update pedvenda_prod set' +
      ' rat_desc_avista = ((:desconto / :valortotal) * vltot_ped_item),' +
      ' rateio_desc = (coalesce(rateio_desc, 0) + ((:desconto / :valortotal) * vltot_ped_item) )' +
      ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').AsString)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(status, '''') = '''' ';
    buscas.ParamByName('desconto').AsFloat := vDescConcedido;
    buscas.ParamByName('valortotal').AsFloat := vValorTotalProdutos;
    buscas.ExecSQL;

    // Recalculando o valor da comissao nos itens da venda
    buscas.Close;
    buscas.SQL.Text := 'update pedvenda_prod pp set' +
      ' pp.COMISS_PROD = ((coalesce(pp.vltot_ped_item, 0) + coalesce(pp.rateio_acresc, 0) - coalesce(pp.rateio_desc, 0)) *' +
      ' coalesce((select p.comissao_prod from produtos p' +
      ' where p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa), 0) / 100 ),' +
      ' pp.comiss_prod_ger = ((coalesce(pp.vltot_ped_item, 0) + coalesce(pp.rateio_acresc, 0) - coalesce(pp.rateio_desc, 0)) *' +
      ' coalesce((select p.comissao_prod_ger from produtos p' +
      ' where p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa), 0) / 100 )' +
      ' where pp.nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and pp.tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').AsString)) +
      ' and pp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(pp.status, '''') = ''''';
    buscas.ExecSQL;

    // Aplicando o valor do desconto e alterando o valor total na requisicao
    buscas.Close;
    buscas.SQL.Text := 'update pedvenda set' +
      ' desconto = (coalesce(desconto, 0 ) - coalesce(valor_desc_avista,0) ) + :valor_desc_avista,' +
      ' valor_total = (valor_total + coalesce(valor_desc_avista, 0)) - :valor_desc_avista,' +
      ' valor_desc_avista = :valor_desc_avista,' +
      ' cod_controle = 1' +
      ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').AsString)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('valor_desc_avista').AsFloat := vDescConcedido;
    buscas.ExecSQL;

    Result := CommitaTransacao;

    dataSet.RefreshRecord;

    vDadosIni.GravaAuditoria('CXL070','DESCONTO', 'CONCEDER DESCONTO - SUCESSO', 'PEDVENDA',
        dataSet.FieldByName('NPED').AsString, Buscas);

  except
    on e: exception do begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXL070','DESCONTO', 'CONCEDER DESCONTO - FALHA', 'PEDVENDA',
        dataSet.FieldByName('NPED').AsString, Buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TPendReq._carga_fin_fechada(pCarga: Integer = 0): Boolean;
var
  vCarga: Integer;
begin
  if Trim(dataSet.FieldByName('tipo').AsString) <> 'REQ' then
    exit;

  if pCarga = 0 then
    vCarga := fCarga
  else
    vCarga := pCarga;

  buscas.Close;
  buscas.SQL.Text := 'select cod_carga, status_fin from carga' +
    ' where cod_carga = ' + IntToStr(vCarga) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if buscas.FieldByName('cod_carga').AsInteger <> vCarga then
  begin
    Application.MessageBox(pchar('Não foi possivel localizar no banco de dados a carga informada'), 'Atenção', 0 + 64);
    Exit;
  end;

  Result := Trim(buscas.FieldByName('status_fin').AsString) = 'FECHADA';
end;

function TPendReq._carga_fin_fechar: Boolean;
var
  vTmpPed: string;
begin
  try
    if Trim(dataSet.FieldByName('tipo').AsString) <> 'REQ' then
      exit;
      
    buscas.Close;
    buscas.SQL.Text := 'select pv.nped from pedvenda pv' +
      ' where pv.cod_carga = ' + IntToStr(fCarga) +
      ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(pv.status_ped, '''') = ''''';
    buscas.Open;

    vTmpPed := ';,';
    buscas.First;
    while not buscas.Eof do
    begin
      if buscas.FieldByName('nped').AsInteger > 0 then
          raiseExceptionCreate('Venda ' + buscas.FieldByName('nped').AsString + ' ainda não fechada','');

      buscas.Next;
    end;
    
    buscas.Close;
    buscas.SQL.Text := 'select pv.nped, fp.seqform from pedvenda pv' +
      ' left join formpagamento fp on fp.nrequisicao = pv.nped and fp.tpdocs = pv.tipo and fp.cod_empresa = pv.cod_empresa' +
      ' where pv.cod_carga = ' + IntToStr(fCarga) +
      ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(pv.status_ped, '''') = ''FECHADA''';
    buscas.Open;

    vTmpPed := ';,';
    buscas.First;
    while not buscas.Eof do
    begin
      if buscas.FieldByName('nped').AsInteger > 0 then
        if buscas.FieldByName('seqform').AsInteger = 0 then
          raiseExceptionCreate('Venda ' + buscas.FieldByName('nped').AsString + ' sem recebimento','');

      buscas.Next;
    end;

    if Application.MessageBox('Tem certeza que deseja efetuar o fechamento desta carga no Caixa Auxiliar?',
      'Atenção', MB_ICONQUESTION + MB_YESNO) <> ID_YES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'update carga set status_fin = ''FECHADA''' +
      ' where cod_carga = ' + IntToStr(fCarga) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    Result := CommitaTransacao;

    vDadosIni.GravaAuditoria('CXL067','FECHAR', 'FECHAR CARGA - SUCESSO', 'CARGA',
      dataSet.FieldByName('COD_CARGA').AsString, Buscas);

  except
    on e: exception do begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXL067','FECHAR', 'FECHAR CARGA - FALHA', 'CARGA',
        dataSet.FieldByName('COD_CARGA').AsString, Buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

function TPendReq._carga_fin_getCarga: Integer;
begin
  Result := fCarga;
end;

function TPendReq._carga_fin_reabrir: Boolean;
begin
  try
    Result :=  False;

    if Trim(dataSet.FieldByName('tipo').AsString) <> 'REQ' then
      exit;

    if Application.MessageBox('Tem certeza que deseja efetuar a reabertura desta carga no Caixa Auxiliar?',
      'Atenção', MB_ICONQUESTION + MB_YESNO) <> ID_YES then
      Exit;

    _carga_fin_removerStatusCarga;

//    buscas.Close;
//    buscas.SQL.Text := 'update carga set status_fin = null ' +
//      ' where cod_carga = ' + IntToStr(fCarga) +
//      ' and cod_empresa = ' + vDadosIni.codEmpresa;
//    buscas.ExecSQL;

    Result := CommitaTransacao;

    vDadosIni.GravaAuditoria('CXL068','FECHAR', 'REABRIR CARGA - SUCESSO', 'CARGA',
      dataSet.FieldByName('COD_CARGA').AsString, Buscas);

  except
    on e: exception do begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXL068','FECHAR', 'REABRIR CARGA - FALHA', 'CARGA',
        dataSet.FieldByName('COD_CARGA').AsString, Buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TPendReq._carga_fin_relatorio: Boolean;
var
  vLista: TStringList;
  vCodCliente: Integer;
  vStrLinha: string;
  vSomaVendaCliente, vSomaVendaTotal, vSomaPagoCliente, vSomaPagoTotal,
    vSomaDescCliente, vSomaDescTotal: Extended;
  vSomaQtdeCliente, vSomaQtdeTotal, vLinha, vPagina, vColunas: Integer;
  vDataHora: TDateTime;
  vRel: TRDprint;
  fImp_NomeMotorista, fImp_NomeConferente, fImp_NomeFaturista, fImp_ModeloVeiculo, fImp_Setor: string;
  vLinhasRel: Integer;
  I: Integer;
  fDataSetTemp: TClientDataSet;

  procedure _addSomaCliente;
  begin
    vLista.Add(
      '  Soma:' +
      vDadosIni.AlnDir(Format('%0.2f', [vSomaVendaCliente]), 26) +
      vDadosIni.AlnDir('Qtde: ',18) +
      Copy(IntToStr(vSomaQtdeCliente) + vDadosIni.Space(9), 1, 9) +
      vDadosIni.AlnDir(Format('%0.2f', [vSomaPagoCliente]), 31) +
      vDadosIni.AlnDir(Format('%0.2f', [vSomaDescCliente]), 16)
    );
    vLista.Add(vDadosIni.Replicate('-',125));
  end;

  procedure _addSomaDataSetTemp;
  begin
    if fBuscas2.FieldByName('COD_CONTROLE').AsInteger = 0 then
      Exit;
    fDataSetTemp.Filter := 'CODIGO_CTRL = ' + IntToStr(fBuscas2.FieldByName('COD_CONTROLE').AsInteger);
    fDataSetTemp.Filtered := True;

    if fDataSetTemp.FieldByName('CODIGO_CTRL').AsInteger <> fBuscas2.FieldByName('COD_CONTROLE').AsInteger then
    begin
      fDataSetTemp.Insert;
      fDataSetTemp.FieldByName('CODIGO_CTRL').AsInteger := fBuscas2.FieldByName('COD_CONTROLE').AsInteger;
      fDataSetTemp.FieldByName('NOME_CTRL').AsString := fBuscas2.FieldByName('NOME_CTRL').AsString;
      fDataSetTemp.FieldByName('VALORDOCSOMA').AsFloat := fBuscas2.FieldByName('VALORDOCSOMA').AsFloat;
    end
    else
    begin
      fDataSetTemp.Edit;
      fDataSetTemp.FieldByName('VALORDOCSOMA').AsFloat := fDataSetTemp.FieldByName('VALORDOCSOMA').AsFloat +
        fBuscas2.FieldByName('VALORDOCSOMA').AsFloat;
    end;
    fDataSetTemp.Post;
  end;

  procedure _montarCabecalho;
  begin
    vLinha := 1;
    vDataHora := vDadosIni.getDataHoraBanco(buscas);
    Inc(vPagina);
    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    vRel.Impf(vLinha, 001, copy(vDadosIni.vEmp.vnomeEmpresa, 1, 48), [negrito]);
    vRel.Impf(vLinha, 044, '       CNPJ: ' + vDadosIni.vEmp.vCNPJ, []);
    vRel.Impf(vLinha, 077, '     Insc. Est.: ' + vDadosIni.vEmp.vIE, []);
    vRel.Impf(vLinha, 115, ' Pag: ' + vDadosIni.StrZero(vPagina,4), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'RELATORIO DE FECHAMENTO DE CARGA - FINANCEIRO', [negrito]);
    vRel.Impf(vLinha, 039, '           Carga: ' + vDadosIni.StrZero(fBuscas3.FieldByName('cod_carga').AsInteger, 7), []);
    vRel.Impf(vLinha, 080, 'Status Carga: ' + fBuscas3.FieldByName('status').AsString, []);
    vRel.Impf(vLinha, 115, FormatDateTime('dd/mm/yyyy', vDataHora), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Motorista..: ' + fImp_NomeMotorista, []);
    vRel.Impf(vLinha, 041, '       Veiculo: ' + fImp_ModeloVeiculo, []);
    vRel.Impf(vLinha, 082, 'Peso Carga: ' + Format('%0.3f',[fBuscas3.FieldByName('peso_carga').AsFloat]), []);
    vRel.Impf(vLinha, 115, '  ' + FormatDateTime('hh:mm:ss', vDataHora), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Faturista..: ' + fImp_NomeFaturista, []);
    vRel.Impf(vLinha, 041, '         Setor: ' + fImp_Setor, []);
    vRel.Impf(vLinha, 080, 'Status Caixa: ' + fBuscas3.FieldByName('status_fin').AsString, []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Conferente.: ' + fImp_NomeConferente, []);
    if Trim(fBuscas3.FieldByName('data_fechamento').AsString) <> '' then
        vRel.Impf(vLinha, 077, 'Data Fechamento: ' + FormatDateTime( 'dd/mm/yyyy', fBuscas3.FieldByName('data_fechamento').AsDateTime) , []);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    vRel.Impf(vLinha, 1, 'Codigo  Nome / Razao        Valor  Data        Forma Pagamento                   Valor Pago    Desc a vista', [negrito]);
    Inc(vLinha);                  

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

  end;

begin
  fBuscas2 := TIBQuery(DtmBalcao.qrBuscas2);
  fBuscas3 := TIBQuery(DtmBalcao.qrBuscas3);

  vCodCliente := 0;
  vSomaVendaCliente := 0;
  vSomaVendaTotal := 0;
  vSomaPagoCliente := 0;
  vSomaPagoTotal := 0;
  vSomaDescCliente := 0;
  vSomaDescTotal := 0;
  vSomaQtdeCliente := 0;
  vSomaQtdeTotal := 0;
  vLista := TStringList.Create;

  fDataSetTemp := TClientDataSet.Create(Application);
  fDataSetTemp.FieldDefs.Clear;
  fDataSetTemp.FieldDefs.Add('CODIGO_CTRL', ftInteger, 0, false);
  fDataSetTemp.FieldDefs.Add('NOME_CTRL', ftString, 35, false);
  fDataSetTemp.FieldDefs.Add('VALORDOCSOMA', ftFloat, 0, false);

  fDataSetTemp.CreateDataSet;
  fDataSetTemp.LogChanges := False;
  fDataSetTemp.EmptyDataSet;
  
  buscas.Close;
  buscas.SQL.Text := 'select pv.cod_cliente, c.nome_cliente, c.razao, c.cidade,' +
    ' pv.nped, pv.valor_total, pv.data_fech, pv.valor_desc_avista' +
    ' from pedvenda pv' +
    ' inner join clientes c on c.cod_cliente = pv.cod_cliente and c.cod_empresa = pv.cod_empresa' +
    ' where pv.cod_carga = ' + IntToStr(fCarga) +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and status_ped = ''FECHADA''' +
    ' order by c.nome_cliente, pv.nped';
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
    fBuscas2.Close;
    fBuscas2.SQL.Text := 'select fp.cod_controle, ct.nome_ctrl, sum(valordoc) valordocsoma' +
      ' from formpagamento fp' +
      ' inner join controles ct on ct.codigo_ctrl = fp.cod_controle and ct.codigo_emp = fp.cod_empresa' +
      ' where fp.nrequisicao = ' + IntToStr(buscas.FieldByName('nped').AsInteger) +
      ' and tpdocs = ''REQ'' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by 1,2';
    fBuscas2.Open;

    fBuscas2.First;

    if vCodCliente <> buscas.FieldByName('cod_cliente').AsInteger then
    begin
      if vCodCliente <> 0 then
        if Trim(vStrLinha) = '' then
          _addSomaCliente
        else
          vLista.Add(vDadosIni.Replicate('-',125));

      vLista.Add(
        vDadosIni.StrZero(buscas.FieldByName('cod_cliente').AsInteger, 7) +
        ' ' +
        Copy(buscas.FieldByName('nome_cliente').AsString + 
        ' / ' +
        buscas.FieldByName('razao').AsString + vDadosIni.Space(83), 1, 83) +
        ' ' +
        Copy(buscas.FieldByName('cidade').AsString + vDadosIni.Space(23), 1, 23)
      );
      vCodCliente := buscas.FieldByName('cod_cliente').AsInteger;
      vStrLinha := 'Pedido:';
      vSomaVendaCliente := 0;
      vSomaPagoCliente := 0;
      vSomaDescCliente := 0;
      vSomaQtdeCliente := 0;
    end
    else
      vStrLinha := '       ';

    vSomaVendaCliente := vSomaVendaCliente + buscas.FieldByName('valor_total').AsFloat;
    vSomaVendaTotal := vSomaVendaTotal + buscas.FieldByName('valor_total').AsFloat;
    vSomaPagoCliente := vSomaPagoCliente + fBuscas2.FieldByName('valordocsoma').AsFloat;
    vSomaPagoTotal := vSomaPagoTotal + fBuscas2.FieldByName('valordocsoma').AsFloat;
    vSomaDescCliente := vSomaDescCliente + buscas.FieldByName('valor_desc_avista').AsFloat;
    vSomaDescTotal := vSomaDescTotal + buscas.FieldByName('valor_desc_avista').AsFloat;
    vSomaQtdeCliente := vSomaQtdeCliente + 1;
    vSomaQtdeTotal := vSomaQtdeTotal + 1;

    vLista.Add(
      vStrLinha +
      vDadosIni.StrZero(buscas.FieldByName('nped').AsInteger, 7) +
      vDadosIni.AlnDir(Format('%0.2f', [buscas.FieldByName('valor_total').AsFloat]),19) +
      '  ' +
      FormatDateTime('dd/mm/yyyy', buscas.FieldByName('data_fech').AsDateTime) +
      '  ' +
      vDadosIni.StrZero(fBuscas2.FieldByName('cod_controle').AsInteger, 3) +
      ' ' +
      copy(fBuscas2.FieldByName('nome_ctrl').AsString + vDadosIni.Space(20), 1,20) +
      vDadosIni.AlnDir(Format('%0.2f', [fBuscas2.FieldByName('valordocsoma').AsFloat]),20) +
      vDadosIni.AlnDir(Format('%0.2f', [buscas.FieldByName('valor_desc_avista').AsFloat]),16)
    );

    _addSomaDataSetTemp;
    // Aqui é Next mesmo, pois o primeiro registro ja foi lido acima
    fBuscas2.Next;
    while not fBuscas2.Eof do
    begin
      vStrLinha := '       ';
      vSomaPagoCliente := vSomaPagoCliente + fBuscas2.FieldByName('valordocsoma').AsFloat;
      vSomaPagoTotal := vSomaPagoTotal + fBuscas2.FieldByName('valordocsoma').AsFloat;
      vLista.Add(
        vDadosIni.Space(47) +
        vDadosIni.StrZero(fBuscas2.FieldByName('cod_controle').AsInteger, 3) +
        ' ' +
        copy(fBuscas2.FieldByName('nome_ctrl').AsString + vDadosIni.Space(20), 1,20) +
        vDadosIni.AlnDir(Format('%0.2f', [fBuscas2.FieldByName('valordocsoma').AsFloat]), 20)
      );
      _addSomaDataSetTemp;
      fBuscas2.Next;
    end;

    buscas.Next;
  end;
  if vCodCliente <> 0 then
    if Trim(vStrLinha) = '' then
      _addSomaCliente
    else
      vLista.Add(vDadosIni.Replicate('-',125));

  // Selecionando a carga
  fBuscas3.Close;
  fBuscas3.SQL.Text := 'select * from carga' +
    ' where cod_carga = ' + IntToStr(fCarga) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  fBuscas3.Open;

  // Definindo valores das variaveis de impressao
  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(fBuscas3.FieldByName('cod_motorista').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeMotorista := Trim(buscas.FieldByName('nome_vendedor').AsString);
  
  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(fBuscas3.FieldByName('cod_faturista').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeFaturista := Trim(buscas.FieldByName('nome_vendedor').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(fBuscas3.FieldByName('cod_conferente').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeConferente := Trim(buscas.FieldByName('nome_vendedor').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select placa||'' - ''||modelo as modelo from veiculos_transporte' +
    ' where cod_veic = ' + IntToStr(fBuscas3.FieldByName('cod_veic').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_ModeloVeiculo := Trim(buscas.FieldByName('modelo').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select setor from setor' +
    ' where cod_setor = ' + IntToStr(fBuscas3.FieldByName('cod_setor').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_Setor := Trim(buscas.FieldByName('setor').AsString);
  
  //Iniciando a Impressão do relatório
  vColunas := 125;
  vLinhasRel := 66;
  vPagina := 0;
  vRel:=TRDprint.Create(Application);
  if not vDadosIni.ModImp(vRel) then
    exit;
  vRel.FonteTamanhoPadrao := S17cpp;
  vRel.TamanhoQteColunas := vColunas;
  vRel.TamanhoQteLinhas := vLinhasRel;
  vRel.CaptionSetup := 'Configurações de Impressão';
  vRel.OpcoesPreview.CaptionPreview := 'Relatório de Fechamento de Carga - Financeiro';
  vRel.TitulodoRelatorio := 'Relatório de Fechamento de Carga - Financeiro';
  vDadosIni._LimparVarSendEmail;
  vRel.OnSendMail := vDadosini._SendMailRdPrint;
  vRel.OpcoesPreview.Preview := True;
  if not vRel.EstaAberto then
    vRel.Abrir;

  vLinha := vLinhasRel + 1;

  for I := 0 to vLista.Count - 1 do
  begin
    if vLinha >= (vLinhasRel + 1)  then
    begin
      if ((I + 1) = vLista.Count) then
        Continue;

      if I <> 0  then
        vRel.Novapagina;
      _montarCabecalho;
    end
    else if vLinha = vLinhasRel then
      if (Copy(vLista[I],1,7) = '       ') and (Copy(vLista[I+1],1,7) = '  Soma:') then
      begin
        if I <> 0  then
          vRel.Novapagina;
        _montarCabecalho;
      end
      else if (Copy(vLista[I],1,7) <> '  Soma:') and (Copy(vLista[I],1,7) <> ' Total:') and
        (Copy(vLista[I],1,7) <> 'Pedido:') and (Copy(vLista[I],1,7) <> '-------') and
        (Copy(vLista[I],1,7) <> '       ') then
      begin
        if I <> 0  then
          vRel.Novapagina;
        _montarCabecalho;
      end;

    if (vLinha = 10) and ((pos('---------------', vLista[I]) > 0) or ( Trim(vLista[I]) = '')) then
      Continue;

    if (pos('  Soma:', vLista[I]) > 0) or (pos(' Total:', vLista[I]) > 0) then
      vRel.Impf(vLinha, 001, vLista[I], [negrito])
    else
      vRel.Impf(vLinha, 001, vLista[I], []);
    Inc(vLinha);

  end;

  vLista.Clear;
  vStrLinha := 'Soma das Formas de Pagamento';
  fDataSetTemp.Filtered := False;
  fDataSetTemp.IndexFieldNames := 'CODIGO_CTRL';
  fDataSetTemp.First;
  while not fDataSetTemp.Eof do
  begin
    vLista.Add(
      vDadosIni.AlnDir(vStrLinha,28) +
      vDadosIni.AlnDir(vDadosIni.StrZero(fDataSetTemp.FieldByName('codigo_ctrl').AsInteger,3),22) +
      ' ' +
      copy(fDataSetTemp.FieldByName('nome_ctrl').AsString + vDadosIni.Space(20), 1,20) +
      vDadosIni.AlnDir(Format('%0.2f', [fDataSetTemp.FieldByName('valordocsoma').AsFloat]),20) 
    );
    vStrLinha := '';
    fDataSetTemp.Next;
  end;

  if Trim(vStrLinha) = ''  then  
    vLista.Add(vDadosIni.Space(125));

  // Soma do total
  vLista.Add(
    ' Total:' +
    vDadosIni.AlnDir(Format('%0.2f', [vSomaVendaTotal]), 26) +
    vDadosIni.AlnDir('Qtde: ',18) +
    Copy(IntToStr(vSomaQtdeTotal) + vDadosIni.Space(9), 1, 9) +
    vDadosIni.AlnDir(Format('%0.2f', [vSomaPagoTotal]), 31) +
    vDadosIni.AlnDir(Format('%0.2f', [vSomaDescTotal]), 16)
  );
  vLista.Add(vDadosIni.Replicate('-',125));
  if _carga_fin_fechada then
  begin
    vLista.Add(vDadosIni.Replicate(' ',125));
    vLista.Add('    _____________________________________________                           _____________________________________________    ');
    vLista.Add('               Assinatura do Caixa                                                     Assinatura do Motorista');
  end;

  if vLista.Count > (vLinhasRel - vLinha) then
  begin
    vRel.Novapagina;
    _montarCabecalho;
  end;

  for I := 0 to vLista.Count - 1 do
  begin
    if (pos('  Soma:', vLista[I]) > 0) or (pos(' Total:', vLista[I]) > 0) then
      vRel.Impf(vLinha, 001, vLista[I], [negrito])
    else
      vRel.Impf(vLinha, 001, vLista[I], []);
    Inc(vLinha);
  end;

  vRel.Fechar;
end;

function TPendReq._carga_fin_removerStatusCarga: Boolean;
var
  vRecebendo: Boolean;
  vStatus: string;
begin
//  try
    Result :=  True;

    if Trim(dataSet.FieldByName('tipo').AsString) <> 'REQ' then
      exit;

    if dataSet.FieldByName('cod_carga').AsInteger = 0 then
      exit;

    buscas.Close;
    buscas.SQL.Text := 'select count(nped) cont from pedvenda' +
      ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and nped <> ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and tipo = ''REQ'' '+
      ' and coalesce(VL_PAGO_CXL, 0) > 0';
    buscas.Open;

    vRecebendo := buscas.FieldByName('cont').AsInteger > 0;

    if vRecebendo then
      vStatus := 'RECEBENDO'
    else
      vStatus := '';

    buscas.Close;
    buscas.SQL.Text := 'update carga set status_fin = ' + QuotedStr(vStatus) + ',' +
      ' DIA_CXL = :DIA_CXL' +
      ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(status_fin,'''') <> ' + QuotedStr(vStatus);
    if vRecebendo then
      buscas.ParamByName('DIA_CXL').AsDate := vDadosIni.diaFCxl
    else
      buscas.ParamByName('DIA_CXL').Value := Null;
    buscas.ExecSQL;

//  except
//    on e: exception do begin
//      Result := False;
//      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
//    end;
//  end;
end;

{ TPendOS }

function TPendOS.abrePendOs: boolean;
begin
  result := montaSelect('select %s from pedvenda rq ' +
    ' inner join clientes cl on rq.cod_cliente = cl.cod_cliente and rq.cod_empresa = cl.cod_empresa ' +
    ' left join nfce on nfce.cod_nfce = rq.cod_nfce and nfce.cod_empresa = rq.cod_empresa' +
    ' Where rq.data_fech is not null and rq.tipo = ''OS'' and status_ped = ''FECHADA'' ' +
    ' and (rq.dia_cxl is null or rq.dia_cxl = :data or rq.dia_cxl = :data1 )' +
    ' and (rq.op_cxl = ' + IntToStr(vDadosIni.vcodOpCxl) + ' or rq.op_cxl is null or rq.op_cxl = 0) ' +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1' +
    ' and (rq.cxl is null or rq.cxl = ''S'') ' +
    ' order by rq.data_fech,rq.nped ', vDadosIni.diaFCxl, vDadosIni.diaFCxl, [CamposSQL]);
  //  result := montaSelect(' select os.n_os,cl.nome_cliente,os.valor_os,os.data_os,os.data_fec_os,' +
  //    'os.obs_cxl_os,os.vl_pago_cxl,os.status_cxl_os,os.dia_cxl,cl.cod_cliente,' +
  //    'os.desc_vl_os,os.desc_p_prod,os.desc_p_serv,os.tot_prod_os,os.tot_serv_os,' +
  //    'os.cod_cond_pag,os.obs_os,os.cod_vendedor,os.op_cxl,os.cod_empresa,os.nprevenda,' +
  //    'os.NCUPOM,os.NSERIEECF,os.OPERADOR ' +
  //    'from ORDEM_SERV os,CLIENTES CL ' +
  //    'Where os.data_fec_os is not null and ' +
  //    '(os.dia_cxl is null or os.dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) + ') and ' +
  //    'os.cod_cliente = cl.cod_cliente and os.cod_empresa = cl.cod_empresa and ' +
  //    '(os.op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' or os.op_cxl is null or os.op_cxl = 0) and ' +
  //    'os.cod_empresa = ' + vDadosIni.codEmpresa + '  and os.ativo = 1 ' +
  //    'order by os.data_fec_os,os.n_os ');
end;

function TPendOS.confirmarecebimento(ValorRecebido: currency): boolean;
begin
  try
    try
      IniciaTransacao;
      edit;
      dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
      dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
      dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
      //    dataSet.FieldByName('VL_RQ_PG_CXL').Value := ValorRecebido;
      dataSet.FieldByName('VL_PAGO_CXL').Value := ValorRecebido;
      Post;
      if Apply then
        result := true
      else
        Result := false;
      CommitaTransacao;
      if vDadosIni.vNFConsumidor.CodEmissor > 0 then
      if NFCeAutomaticaAtiva then
        enviarVendaParaNFCe
      else
        enviarVendaParaCupom;
    except
      on e: exception do
      begin
        RollBackTransacao;
        result := false;
        Application.MessageBox(pchar('Erro na Gravação: '+
        e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
        registraErro('Erro CXL: ' + e.Message);
      end;
//      RollBackTransacao;
    end;
  finally
  end;
end;

constructor TPendOS.create;
begin
  DataSet := TClientDataSet(DtmBalcao.CdsPendOS);
  transacao := TIBTransaction(DtmBalcao.IbTransBalcao);
  buscas := TIBQuery(DtmBalcao.qrBuscas);
  name := 'TPendOS';
end;

destructor TPendOS.destroy;
begin
  inherited;
  Close;
end;

function TPendOS.marcaRec(vtp: integer): boolean;
begin
  try
    IniciaTransacao;
    edit;
    if vtp = 1 then
    begin
     if (dataSet.FieldByName('STATUS_CXL_RQ').AsString <> 'R') then
       if ((dataSet.FieldByName('NUM_NF').IsNull) and (dataSet.FieldByName('NCUPOM').IsNull)) then
        begin

          vDadosIni.vInibeMensPesqPros := 'S';
          if not vDadosIni.PesqPros('CXL063', 'VALIDAR', 'VERIFICAR PEND. NF OU CUPOM NO RECEBIMENTO CXL', 'PEDVENDA', '', buscas, false) then
          begin

            if Application.MessageBox(pchar('Documento a ser recebido não possuí documento fiscal, Deseja continuar com o recebimento?'), 'Confirmação',
              MB_ICONQUESTION + MB_YESNO) = IDNO then
              exit;

            if not vDadosIni.PesqPros('CXL064', 'VALIDAR', 'PERMITIR PEND. NF OU CUPOM NO RECEBIMENTO CXL', 'PEDVENDA',
              dataSet.FieldByName('NPED').AsString, buscas, true) then
              exit;
          end;
        end;

      {if  dataset.FieldByName('NPREVENDA').AsString = '' then
      begin
       buscas.close;
       buscas.sql.text:='SELECT USPREVENDA FROM EMPRESA WHERE COD_EMPRESA = '+vDadosIni.codEmpresa+' AND ATIVO = 1';
       buscas.Open;
       dataSet.FieldByName('NPREVENDA').AsInteger:=Gencodigo('PREVENDA', DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
      end;}
      dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
      dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
      dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
    end
    else
    begin
      dataSet.FieldByName('DIA_CXL').Value := null;
      dataSet.FieldByName('STATUS_CXL_RQ').value := null;
      dataset.FieldByName('OP_CXL').value := null;
      dataset.FieldByName('VL_PAGO_CXL').value := 0;
    end;
    Post;
    if Apply then
      result := true
    else
      Result := false;
    CommitaTransacao;
  except
    RollBackTransacao;
    MessageDlg('Erro ao marcar o documento para recebimento', mterror, [mbOK], 0);
  end;
end;

function TPendOS.PegaInfRec: boolean;
begin
  abrePendOs;
//  Close;
//  Open;
  vlVnd := 0;
  vsrec := 0;
  vlrec := 0;
  qtdvnd := 0;
//  vtipdoc := 'OS';
  while not dataset.Eof do
  begin
    if ((dataset.FieldByName('VL_PAGO_CXL').IsNull) or (dataSet.FieldByName('VL_PAGO_CXL').value = 0))
    and (dataSet.FieldByName('DATA_FECH').AsDateTime <= vdadosini.diaFCxl) then
      //      vsrec := vsrec + dataset.FieldByName('VALOR_OS').AsCurrency;
      vsrec := vsrec + dataset.FieldByName('VALOR_TOTAL').AsCurrency;
    dataSet.next;
  end;
  buscas.Close;
  buscas.SQL.Text := 'select sum(valor_TOTAL),count(*)  from PEDVENDA where ' +
    'dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and cod_empresa = ' +
    vDadosIni.codEmpresa + ' AND TIPO = ''OS'' AND ATIVO = 1 ';
  buscas.open;
  vlVnd := buscas.Fields[0].AsCurrency;
  qtdvnd := buscas.Fields[1].AsInteger;
end;

function TPendOS.post: boolean;
begin
  inherited post;
end;

function TPendOS.recebendo: boolean;
begin
  //  result := ExecutaComandosSql('select op_cxl from ordem_serv where n_os = ' + dataset.FieldByName('N_OS').AsString + ' and ' +
  //    '(op_cxl is null or op_cxl = 0 or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ') and COD_EMPRESA = ' +
  //    vDadosIni.codEmpresa + ' AND ATIVO = 1 ');
  result := ExecutaComandosSql('select op_cxl from pedvenda where nped = ' +
    dataset.FieldByName('nped').AsString + ' and ' +
    '(op_cxl is null or op_cxl = 0 or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
      ') and COD_EMPRESA = ' +
    vDadosIni.codEmpresa + ' and tipo = ''OS'' AND ATIVO = 1 ');
end;

{ TPendVeic }

function TPendVeic.abrePendVeic: boolean;
begin
  if vDadosIni.vEmp.vVersaoVeiculos = '4' then
   result := montaSelect('select * from com_fat ' +
     ' where natureza = ''S'' and (coalesce(receber, '''')  <> ''N'') ' +
     ' and (dia_cxl is null or dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) + ') ' +
     ' and (upper(trim(coalesce(status_v, ''''))) = ''FECHADO'') ' +
     ' and (op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) +  ' or op_cxl is null or op_cxl = 0) ' +
     ' and cod_empresa = ' + vDadosIni.codEmpresa +
     ' and (cxl is null or cxl = ''S'') ' +
     ' and ativo = 1 ' +
     ' order by data_ven,n_comando ')
  else
    result := montaSelect('select * from com_fat ' +
     ' where (dia_cxl is null or dia_cxl = ' + chr(39) +  FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) + ') ' +
     ' and status_v is null ' +
     ' and (op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' or op_cxl is null or op_cxl = 0) ' +
     ' and cod_empresa = ' + vDadosIni.codEmpresa +
     ' and ativo = 1 ' +
     ' and (cxl is null or cxl = ''S'') ' +
     ' order by data_ven,n_comando ');
end;

function TPendVeic.AbrirComFat: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
   vDadosIni.vPesquisa := 'COM_FATCXL|';

  formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmMovVeiculosCCIA', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
    vDadosIni.vPesquisa := '';
  end;
end;

function TPendVeic.AbrirComFat(pCodigo: Integer): boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  Result := False;

  vDadosIni.vPesquisa := 'COM_FATCXLEDIT| ' + IntToStr(pCodigo);

  vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
  vDadosIni.vDtSetTmp.Close;
  vDadosIni.vDtSetTmp.FieldDefs.Clear;
  vDadosIni.vDtSetTmp.FieldDefs.Add('N_COMANDO', ftInteger, 0, false);

  if vDadosIni.vDtSetTmp.Tag = 0 then
  try
    vDadosIni.vDtSetTmp.CreateDataSet;
    vDadosIni.vDtSetTmp.Tag := 1;
  except
  end;

 vDadosIni.vDtSetTmp.EmptyDataSet;
 vDadosIni.vDtSetTmp.Insert;
 vDadosIni.vDtSetTmp.FieldByName('N_COMANDO').AsInteger := pCodigo;
 vDadosIni.vDtSetTmp.Post;

  formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmMovVeiculosCCIA', hdTemp);

  try
    formulario.ShowModal;
  finally
    if trim(vDadosIni.vPesquisa) = 'COM_FATCXLEDITOK' then
      Result := True
    else
      Result := False;
    formulario.Free;
    unLoadPackage(hdTemp);
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TPendVeic.AtualizarVeiculos(buscas2: TIBQuery);
begin
  buscas2.close;
  buscas2.SQL.text := 'SELECT chassi FROM VEICULOS' +
   ' WHERE chassi = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) + ' and cod_empresa = ' +
    vDadosIni.codEmpresa + ' and ativo = 1';
  buscas2.Open;

  buscas.close;
  buscas.sql.text:='select * from Est_Moto where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
    ' and codigo = ' + InttoStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
    ' and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1';
  buscas.open;

  if buscas2.IsEmpty then
  begin
    buscas2.close;
    buscas2.sql.text :=
      ' INSERT INTO VEICULOS(CODIGO,COD_EMPRESA,CHASSI,COD_CLIENTE,' +
      ' ESPECIE,MARCA_V,MODELO,DESCMODELO,MOTOR,COR,ANOFAB,' +
      ' ANOMOD,CILINDROS,CILINDRADA,LOTACAO,DATA_VENDA,DATA_CAD,HORA_CAD,HP,PLACA,COMBUSTIVEL,' +
      ' COD_COR, COD_COMBUSTIVEL, COD_MARCA, COD_ESPE_SEG, KM_V) ' +
      ' VALUES(:CODIGO,:COD_EMPRESA,:CHASSI,:COD_CLIENTE,:ESPECIE,:MARCA_V,' +
      ' :MODELO,:DESCMODELO,:MOTOR,:COR,:ANOFAB,:ANOMOD,' +
      ' :CILINDROS,:CILINDRADA,:LOTACAO,:DATA_VENDA,:DATA_CAD,:HORA_CAD,:HP,:PLACA,:COMBUSTIVEL,' +
      ' :COD_COR, :COD_COMBUSTIVEL, :COD_MARCA, :COD_ESPE_SEG, :KM_V)';
    buscas2.ParamByName('CODIGO').AsInteger := Gencodigo('VEICULOS', DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
    buscas2.ParamByName('COD_EMPRESA').AsString := buscas.FieldByName('COD_EMPRESA').AsString;
    buscas2.ParamByName('CHASSI').AsString := buscas.FieldByName('CHASSI_C').AsString;
    buscas2.ParamByName('COD_CLIENTE').AsString := dataset.FieldByName('CLIENTES_V').AsString;
    buscas2.ParamByName('ESPECIE').AsString := buscas.FieldByName('TIPOEST').AsString;
    buscas2.ParamByName('MARCA_V').AsString := buscas.FieldByName('MARCAEST').AsString;
    buscas2.ParamByName('MODELO').AsString := buscas.FieldByName('VERSAOEST').AsString;
    buscas2.ParamByName('DESCMODELO').AsString := buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
    buscas2.ParamByName('MOTOR').AsString := buscas.FieldByName('MOTOREST').AsString;
    buscas2.ParamByName('COR').AsString := buscas.FieldByName('COREST').AsString;
    buscas2.ParamByName('ANOFAB').AsString := buscas.FieldByName('ANO_FABEST').AsString;
    buscas2.ParamByName('ANOMOD').AsString := buscas.FieldByName('ANO_MODEST').AsString;
    buscas2.ParamByName('CILINDROS').AsString := buscas.FieldByName('CILINDROSEST').AsString;
    buscas2.ParamByName('CILINDRADA').AsFloat := buscas.FieldByName('CILINDRADAEST').AsFloat;
    buscas2.ParamByName('COMBUSTIVEL').AsString := buscas.FieldByName('COMBUSTIVELEST').AsString;
    buscas2.ParamByName('LOTACAO').AsString := buscas.FieldByName('LOTACAOEST').AsString;
    buscas2.ParamByName('DATA_VENDA').AsString := dataset.FieldByName('DATA_VEN').AsString;
    buscas2.ParamByName('DATA_CAD').AsDate := date;
    buscas2.ParamByName('HORA_CAD').AsString := FormatDateTime('HH:MM', date);
    buscas2.ParamByName('HP').AsFloat := buscas.FieldByName('HPEST').AsFloat;
    if trim(buscas.FieldByName('STATUS_USO').AsString) = 'N' then
      buscas2.ParamByName('PLACA').AsString := copy(buscas.fieldbyname('CHASSI_C').AsString, 10, 8)
    else
      buscas2.ParamByName('PLACA').AsString := buscas.fieldbyname('PLACAEST').AsString;
    buscas2.ParamByName('COD_COR').AsInteger := buscas.FieldByName('COD_COR').AsInteger;
    buscas2.ParamByName('COD_COMBUSTIVEL').AsInteger := buscas.FieldByName('COD_COMBUSTIVEL').AsInteger;
    buscas2.ParamByName('COD_MARCA').AsInteger := buscas.FieldByName('COD_MARCA').AsInteger;
    buscas2.ParamByName('COD_ESPE_SEG').AsInteger := buscas.FieldByName('COD_ESPE_SEG').AsInteger;
    if (buscas.FieldByName('STATUS_USO').AsString = 'N') then
    	buscas2.ParamByName('KM_V').AsInteger := 0
    else
    	buscas2.ParamByName('KM_V').AsInteger := 1;
    buscas2.Prepare;
    buscas2.ExecSQL;
  end
  else
  begin
    buscas2.close;
    buscas2.sql.text :=
      ' UPDATE VEICULOS SET COD_CLIENTE = :COD_CLIENTE,' +
      ' ESPECIE = :ESPECIE, MARCA_V = :MARCA_V, MODELO = :MODELO,DESCMODELO = :DESCMODELO, ' +
      ' MOTOR = :MOTOR, COR = :COR, ANOFAB = :ANOFAB, ANOMOD = :ANOMOD, CILINDROS = :CILINDROS,' +
      ' CILINDRADA = :CILINDRADA, LOTACAO = :LOTACAO, DATA_VENDA = :DATA_VENDA, HP = :HP, COMBUSTIVEL = :COMBUSTIVEL, ' +
      ' COD_COR = :COD_COR, COD_COMBUSTIVEL = :COD_COMBUSTIVEL, COD_MARCA = :COD_MARCA, ' +
      ' COD_ESPE_SEG = :COD_ESPE_SEG, KM_V = :KM_V ' +
      ' WHERE CHASSI = :CHASSI AND COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1';
    buscas2.ParamByName('CHASSI').AsString := buscas.FieldByName('CHASSI_C').AsString;
  	buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.ParamByName('COD_CLIENTE').AsString := dataset.FieldByName('CLIENTES_V').AsString;
    buscas2.ParamByName('ESPECIE').AsString := buscas.FieldByName('TIPOEST').AsString;
    buscas2.ParamByName('MARCA_V').AsString := buscas.FieldByName('MARCAEST').AsString;
    buscas2.ParamByName('MODELO').AsString := buscas.FieldByName('VERSAOEST').AsString;
    buscas2.ParamByName('DESCMODELO').AsString := buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
    buscas2.ParamByName('MOTOR').AsString := buscas.FieldByName('MOTOREST').AsString;
    buscas2.ParamByName('COR').AsString := buscas.FieldByName('COREST').AsString;
    buscas2.ParamByName('ANOFAB').AsString := buscas.FieldByName('ANO_FABEST').AsString;
    buscas2.ParamByName('ANOMOD').AsString := buscas.FieldByName('ANO_MODEST').AsString;
    buscas2.ParamByName('CILINDROS').AsString := buscas.FieldByName('CILINDROSEST').AsString;
    buscas2.ParamByName('CILINDRADA').AsFloat := buscas.FieldByName('CILINDRADAEST').AsFloat;
    buscas2.ParamByName('COMBUSTIVEL').AsString := buscas.FieldByName('COMBUSTIVELEST').AsString;
    buscas2.ParamByName('LOTACAO').AsString := buscas.FieldByName('LOTACAOEST').AsString;
    buscas2.ParamByName('DATA_VENDA').AsString := dataset.FieldByName('DATA_VEN').AsString;
    buscas2.ParamByName('HP').AsFloat := buscas.FieldByName('HPEST').AsFloat;
    buscas2.ParamByName('COD_COR').AsInteger := buscas.FieldByName('COD_COR').AsInteger;
    buscas2.ParamByName('COD_COMBUSTIVEL').AsInteger := buscas.FieldByName('COD_COMBUSTIVEL').AsInteger;
    buscas2.ParamByName('COD_MARCA').AsInteger := buscas.FieldByName('COD_MARCA').AsInteger;
    buscas2.ParamByName('COD_ESPE_SEG').AsInteger := buscas.FieldByName('COD_ESPE_SEG').AsInteger;
    if (buscas.FieldByName('STATUS_USO').AsString = 'N') then
    	buscas2.ParamByName('KM_V').AsInteger := 0
    else
    	buscas2.ParamByName('KM_V').AsInteger := 1;
    buscas2.Prepare;
    buscas2.ExecSQL;
   // Verificar se o cancelamento de nf
  end;
end;

function TPendVeic.BaixarVeicIntermed: boolean;
var
 vcodmtusadas: integer;
begin
// Colocar aqui a baixa de veículo que é de outras concessionária
result:=true;
if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U' then
begin
  if trim(dataSet.fieldbyname('CONFUS').AsString) <> 'S' then
  begin
    if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
      BaixarVeiculosCCIA(1,0)
    else
      BaixarVeiculos(1,0);
  end;
end;
end;

function TPendVeic.BaixarVeiculos(vtp: integer;vmtus: integer): boolean;
var
 vcodmtusadas: integer;
begin
  if (dataset.FieldByName('NATOP_V').Value <> 599) and (dataset.FieldByName('NATOP_V').Value <> 699) and
  (dataset.FieldByName('NATOP_V').Value <> 5912) and (dataset.FieldByName('NATOP_V').Value <> 6912) then
  begin
    if vtp = 1 then
    begin
      buscas.close;
      buscas.sql.text:='select mtusadas.*,tipmodelo.descricao from MtUsadas,tipmodelo '+
      'where mtusadas.versao_us = tipmodelo.codigo and mtusadas.cod_empresa = '+
      'tipmodelo.cod_empresa and mtusadas.chassi_us = '''+
      dataSet.FieldByName('CHASSIV').AsString+''' and mtusadas.cod_empresa = '+
      vDadosIni.codEmpresa+' and mtusadas.ativo = 1';
      buscas.open;
      if buscas.IsEmpty then
      begin
//           messagedlg('Veiculo intermediação não encontrado no estoque', mtinformation, [mbOK], 0);
       result:=false;
      end
      else
      begin
        vdadosmotven.close;
        vdadosmotven.sql.text:='INSERT INTO MOT_VEN(CHASSIV,NUM_NOTA_V,MARCAV,'+
        'DESCRICAO_VERSAOV,VERSAOV,ANO_FABV,ANO_MODV,CORV,CILINDROSV,COMBUSTIVELV,'+
        'CILINDRADAV,HPV,LOTACAOV,TIPOV,RENAVAMV,PRECO_TABV,OBS_ITEMV,MOTORV,'+
        'PLACAV,CERTIFICADOV,DATA_CERTIFICADOV,CATEGORIAV,N_COMANDO,SUB_SERIE,NF_AQ,COM_ENT,CODIGO_US,DAT_CADM,'+
        'VALOR_VEN_US,VL_COMPRA_US,US_CAD_CLI,ESTOQUE,COD_EMPRESA,RED_LUCRO,DATA_CH_NOTA,COD_COR,TIP_PINTURA,NSERIE,PRECO_CUSTO) '+
        'VALUES(:CHASSIV,:NUM_NOTA_V,'+
        ':MARCAV,:DESCRICAO_VERSAOV,:VERSAOV,'+
        ':ANO_FABV,:ANO_MODV,:CORV,:CILINDROSV,:COMBUSTIVELV,:CILINDRADAV,'+
        ':HPV,:LOTACAOV,:TIPOV,:RENAVAMV,:PRECO_TABV,:OBS_ITEMV,:MOTORV,'+
        ':PLACAV,:CERTIFICADOV,:DATA_CERTIFICADOV,:CATEGORIAV,:N_COMANDO,:SUB_SERIE,'+
        ':NF_AQ,:COM_ENT,:CODIGO_US,:DAT_CADM,:VALOR_VEN_US,:VL_COMPRA_US,'+
        ':US_CAD_CLI,:ESTOQUE,:COD_EMPRESA,:RED_LUCRO,:DATA_CH_NOTA,:COD_COR,:TIP_PINTURA,:NSERIE,:PRECO_CUSTO)';
        vdadosmotven.ParamByName('CHASSIV').AsString:=buscas.FieldByName('CHASSI_US').AsString;
        vdadosmotven.ParamByName('NUM_NOTA_V').AsInteger:=dataset.FieldByName('NUM_NOTA_V').AsInteger;
        vdadosmotven.ParamByName('MARCAV').AsString:=copy(buscas.FieldByName('MARCA_US').AsString,1,5);
        vdadosmotven.ParamByName('DESCRICAO_VERSAOV').AsString:=buscas.FieldByName('DESCRICAO').AsString;
        vdadosmotven.ParamByName('VERSAOV').asinteger:=buscas.FieldByName('VERSAO_US').AsInteger;
        vdadosmotven.ParamByName('ANO_FABV').AsInteger:=buscas.FieldByName('ANOFAB_US').AsInteger;
        vdadosmotven.ParamByName('ANO_MODV').AsInteger:=buscas.FieldByName('ANOMOD_US').AsInteger;
        vdadosmotven.ParamByName('CORV').AsString:=buscas.FieldByName('COR_US').AsString;
        vdadosmotven.ParamByName('CILINDROSV').AsInteger:=buscas.FieldByName('CILIND_US').AsInteger;
        vdadosmotven.ParamByName('COMBUSTIVELV').AsString:=buscas.FieldByName('COMBUST_US').AsString;
        vdadosmotven.ParamByName('CILINDRADAV').AsFloat:=buscas.FieldByName('CILINDRADA_US').AsFloat;
        vdadosmotven.ParamByName('HPV').AsFloat:=buscas.FieldByName('HP_US').AsFloat;
        vdadosmotven.ParamByName('LOTACAOV').AsString:=buscas.FieldByName('LOTACAO_US').AsString;
        vdadosmotven.ParamByName('TIPOV').AsString:=copy(buscas.FieldByName('TIPO_US').AsString,1,12);
        vdadosmotven.ParamByName('RENAVAMV').AsString:=buscas.FieldByName('RENAVAM_US').AsString;
        vdadosmotven.ParamByName('PRECO_TABV').AsCurrency:=buscas.FieldByName('VALOR_VEN_US').AsCurrency;
        vdadosmotven.ParamByName('OBS_ITEMV').AsString:=buscas.FieldByName('OBS_US').AsString;
        vdadosmotven.ParamByName('MOTORV').AsString:=buscas.FieldByName('MOTOR_US').AsString;
        vdadosmotven.ParamByName('PLACAV').AsString:=buscas.FieldByName('PLACA_US').AsString;
        vdadosmotven.ParamByName('CERTIFICADOV').AsString:=copy(buscas.FieldByName('CERTIF_US').AsString,1,9);
        vdadosmotven.ParamByName('DATA_CERTIFICADOV').AsString:=buscas.FieldByName('DATA_CERT_US').AsString;
        vdadosmotven.ParamByName('CATEGORIAV').AsString:=buscas.FieldByName('CATEGORIA_US').AsString;
        vdadosmotven.ParamByName('N_COMANDO').AsInteger:=dataset.FieldByName('N_COMANDO').AsInteger;
        vdadosmotven.ParamByName('SUB_SERIE').AsInteger:=dataset.FieldByName('SUB_SERIE').AsInteger;
        vdadosmotven.ParamByName('NF_AQ').AsInteger:=buscas.FieldByName('NFAQ_US').AsInteger;
        vdadosmotven.ParamByName('COM_ENT').AsInteger:=buscas.FieldByName('COM_ENT').AsInteger;
        vdadosmotven.ParamByName('CODIGO_US').AsString:=buscas.FieldByName('CODIGO_US').AsString;
        vdadosmotven.ParamByName('DAT_CADM').AsString:=buscas.FieldByName('DATCAD_US').AsString;
        vdadosmotven.ParamByName('VALOR_VEN_US').AsCurrency:=buscas.FieldByName('VALOR_VEN_US').AsCurrency;
        vdadosmotven.ParamByName('VL_COMPRA_US').AsCurrency:=buscas.FieldByName('VL_COMPRA_US').AsCurrency;
        vdadosmotven.ParamByName('US_CAD_CLI').AsString:=buscas.FieldByName('US_CAD_CLI').AsString;
        vdadosmotven.ParamByName('ESTOQUE').AsString:=buscas.FieldByName('ESTOQUE').AsString;
        vdadosmotven.ParamByName('COD_EMPRESA').AsInteger:=buscas.FieldByName('COD_EMPRESA').AsInteger;
        vdadosmotven.ParamByName('RED_LUCRO').AsString:=buscas.FieldByName('RED_LUCRO').AsString;
        vdadosmotven.ParamByName('DATA_CH_NOTA').AsString:=buscas.FieldByName('DATA_CH_NOTA').AsString;
        vdadosmotven.ParamByName('COD_COR').AsInteger:=buscas.FieldByName('COD_COR').AsInteger;
        vdadosmotven.ParamByName('TIP_PINTURA').AsString:=buscas.FieldByName('TIP_PINTURA').AsString;
        vdadosmotven.ParamByName('NSERIE').AsString:=buscas.FieldByName('NSERIE').AsString;
        vdadosmotven.ParamByName('PRECO_CUSTO').AsFloat:=buscas.FieldByName('PRECO_CUSTO').AsFloat;
        vdadosmotven.Prepare;
        vdadosmotven.ExecSQL;
        vcodmtusadas:=buscas.FieldByName('CODIGO_US').AsInteger;
        buscas.close;
        buscas.sql.text:='DELETE FROM MTUSADAS WHERE CODIGO_US = '+inttostr(vcodmtusadas)+
        ' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;
        dataSet.Edit;
        dataSet.FieldByName('CONFUS').AsString:='S';
        dataSet.Post;
        Apply;
      end;
    end
    else
    begin
      buscas.close;
      buscas.sql.text:='select * from Est_Moto where chassi_c = '''+
      dataSet.FieldByName('CHASSIV').AsString+
      ''' and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1';
      buscas.open;
      if buscas.IsEmpty then
      begin
//           messagedlg('Veiculo intermediação não encontrado no estoque', mtinformation, [mbOK], 0);
       result:=false;
      end
      else
      begin
        vdadosmotven.close;
        vdadosmotven.sql.text:='INSERT INTO MOT_VEN(CHASSIV,NUM_NOTA_V,MARCAV,'+
        'DESCRICAO_VERSAOV,VERSAOV,ANO_FABV,ANO_MODV,CORV,CILINDROSV,COMBUSTIVELV,'+
        'CILINDRADAV,HPV,LOTACAOV,TIPOV,RENAVAMV,PRECO_TABV,OBS_ITEMV,MOTORV,'+
        'PLACAV,CERTIFICADOV,DATA_CERTIFICADOV,CATEGORIAV,N_COMANDO,SUB_SERIE,NF_AQ,'+
        'DATA_CH_NOTA,COD_FORNECEDOR,COD_COR,'+
        'TIP_PINTURA,NSERIE,COD_EMPRESA,FRETE_AQUISICAOV,FRETE_VENDAV,'+
        'BASE_CALC_ICM_SUBV,VALOR_ICM_SUBV,PRECO_CUSTO) '+
        'VALUES(:CHASSIV,:NUM_NOTA_V,'+
        ':MARCAV,:DESCRICAO_VERSAOV,:VERSAOV,'+
        ':ANO_FABV,:ANO_MODV,:CORV,:CILINDROSV,:COMBUSTIVELV,:CILINDRADAV,'+
        ':HPV,:LOTACAOV,:TIPOV,:RENAVAMV,:PRECO_TABV,:OBS_ITEMV,:MOTORV,'+
        ':PLACAV,:CERTIFICADOV,:DATA_CERTIFICADOV,:CATEGORIAV,:N_COMANDO,:SUB_SERIE,'+
        ':NF_AQ,:DATA_CH_NOTA,:COD_FORNECEDOR,:COD_COR,:TIP_PINTURA,:NSERIE,'+
        ':COD_EMPRESA,:FRETE_AQUISICAOV,:FRETE_VENDAV,:BASE_CALC_ICM_SUBV,:VALOR_ICM_SUBV,:PRECO_CUSTO)';
        vdadosmotven.ParamByName('CHASSIV').AsString:=buscas.FieldByName('CHASSI_C').AsString;
        vdadosmotven.ParamByName('NUM_NOTA_V').AsInteger:=dataset.FieldByName('NUM_NOTA_V').AsInteger;
        vdadosmotven.ParamByName('MARCAV').AsString:=copy(buscas.FieldByName('MARCAEST').AsString,1,5);
        vdadosmotven.ParamByName('DESCRICAO_VERSAOV').AsString:=buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
        vdadosmotven.ParamByName('VERSAOV').asinteger:=buscas.FieldByName('VERSAOEST').AsInteger;
        vdadosmotven.ParamByName('ANO_FABV').asinteger:=buscas.FieldByName('ANO_FABEST').AsInteger;
        vdadosmotven.ParamByName('ANO_MODV').asinteger:=buscas.FieldByName('ANO_MODEST').AsInteger;
        vdadosmotven.ParamByName('CORV').AsString:=buscas.FieldByName('COREST').AsString;
        vdadosmotven.ParamByName('CILINDROSV').asinteger:=buscas.FieldByName('CILINDROSEST').asinteger;
        vdadosmotven.ParamByName('COMBUSTIVELV').AsString:=buscas.FieldByName('COMBUSTIVELEST').AsString;
        vdadosmotven.ParamByName('CILINDRADAV').AsFloat:=buscas.FieldByName('CILINDRADAEST').AsFloat;
        vdadosmotven.ParamByName('HPV').AsFloat:=buscas.FieldByName('HPEST').AsFloat;
        vdadosmotven.ParamByName('LOTACAOV').AsString:=buscas.FieldByName('LOTACAOEST').AsString;
        vdadosmotven.ParamByName('TIPOV').AsString:=copy(buscas.FieldByName('TIPOEST').AsString,1,12);
        vdadosmotven.ParamByName('RENAVAMV').AsString:=buscas.FieldByName('RENAVAMEST').AsString;
        vdadosmotven.ParamByName('PRECO_TABV').ascurrency:=buscas.FieldByName('PRECO_TABEST').ascurrency;
        vdadosmotven.ParamByName('OBS_ITEMV').AsString:=buscas.FieldByName('OBS_ITEMEST').AsString;
        vdadosmotven.ParamByName('MOTORV').AsString:=buscas.FieldByName('MOTOREST').AsString;
        vdadosmotven.ParamByName('PLACAV').AsString:=buscas.FieldByName('PLACAEST').AsString;
        vdadosmotven.ParamByName('CERTIFICADOV').AsString:=copy(buscas.FieldByName('CERTIFICADOEST').AsString,1,9);
        vdadosmotven.ParamByName('DATA_CERTIFICADOV').AsString:=buscas.FieldByName('DATA_CERTIFICADOEST').AsString;
        vdadosmotven.ParamByName('CATEGORIAV').AsString:=buscas.FieldByName('CATEGORIAEST').AsString;
        vdadosmotven.ParamByName('N_COMANDO').asinteger:=dataset.FieldByName('N_COMANDO').asinteger;
        vdadosmotven.ParamByName('SUB_SERIE').asinteger:=dataset.FieldByName('SUB_SERIE').asinteger;
        vdadosmotven.ParamByName('NF_AQ').asinteger:=buscas.FieldByName('NUM_NOTA').asinteger;
        vdadosmotven.ParamByName('DATA_CH_NOTA').AsDatetime:=buscas.FieldByName('DATA_CH_NOTA').AsDateTime;
        vdadosmotven.ParamByName('COD_FORNECEDOR').asinteger:=buscas.FieldByName('COD_FORNECEDOR').asinteger;
        vdadosmotven.ParamByName('COD_COR').asinteger:=buscas.FieldByName('COD_COR').asinteger;
        vdadosmotven.ParamByName('TIP_PINTURA').AsString:=buscas.FieldByName('TIP_PINTURA').AsString;
        vdadosmotven.ParamByName('NSERIE').AsString:=buscas.FieldByName('NSERIE').AsString;
        vdadosmotven.ParamByName('COD_EMPRESA').asinteger:=buscas.FieldByName('COD_EMPRESA').AsInteger;
        vdadosmotven.ParamByName('FRETE_AQUISICAOV').ascurrency:=buscas.FieldByName('FRETE_AQUISICAOEST').AsCurrency;
        vdadosmotven.ParamByName('FRETE_VENDAV').ascurrency:=buscas.FieldByName('FRETE_VENDAEST').AsCurrency;
        vdadosmotven.ParamByName('BASE_CALC_ICM_SUBV').ascurrency:=buscas.FieldByName('BASE_CALC_ICM_SUBEST').ascurrency;
        vdadosmotven.ParamByName('VALOR_ICM_SUBV').ascurrency:=buscas.FieldByName('VALOR_ICM_SUBEST').AsCurrency;
        vdadosmotven.ParamByName('PRECO_CUSTO').AsFloat:=buscas.FieldByName('PRECO_CUSTO').AsFloat;
        vdadosmotven.Prepare;
        vdadosmotven.ExecSQL;
        if (dataset.FieldByName('NATOP_V').value = 5409) or (dataset.FieldByName('NATOP_V').value = 6409) then
        begin
         //Transferindo os dados do produto para a tabela transf_dep
         vdadosmotven.close;
         vdadosmotven.sql.text:='INSERT INTO TRANSF_DEP(CHASSIV,NUM_NOTA_V,MARCAV,'+
         'DESCRICAO_VERSAOV,VERSAOV,ANO_FABV,ANO_MODV,CORV,CILINDROSV,COMBUSTIVELV,'+
         'CILINDRADAV,HPV,LOTACAOV,TIPOV,RENAVAMV,PRECO_TABV,OBS_ITEMV,MOTORV,'+
         'PLACAV,CERTIFICADOV,DATA_CERTIFICADOV,CATEGORIAV,N_COMANDO,NF_AQ,'+
         'DATA_CH_NOTA,COD_FORNECEDOR,COD_EMPRESA,FRETE_AQUISICAOV,FRETE_VENDAV,'+
         'BASE_CALC_ICM_SUBV,VALOR_ICM_SUBV,DATA_SAIDA,COD_COR,PRECO_CUSTO) '+
         'VALUES(:CHASSIV,:NUM_NOTA_V,'+
         ':MARCAV,:DESCRICAO_VERSAOV,:VERSAOV,'+
         ':ANO_FABV,:ANO_MODV,:CORV,:CILINDROSV,:COMBUSTIVELV,:CILINDRADAV,'+
         ':HPV,:LOTACAOV,:TIPOV,:RENAVAMV,:PRECO_TABV,:OBS_ITEMV,:MOTORV,'+
         ':PLACAV,:CERTIFICADOV,:DATA_CERTIFICADOV,:CATEGORIAV,:N_COMANDO,'+
         ':NF_AQ,:DATA_CH_NOTA,:COD_FORNECEDOR,'+
         ':COD_EMPRESA,:FRETE_AQUISICAOV,:FRETE_VENDAV,:BASE_CALC_ICM_SUBV,:VALOR_ICM_SUBV,:DATA_SAIDA,:COD_COR,:PRECO_CUSTO)';
         vdadosmotven.ParamByName('CHASSIV').AsString:=buscas.FieldByName('CHASSI_C').AsString;
         vdadosmotven.ParamByName('NUM_NOTA_V').AsInteger:=dataset.FieldByName('NUM_NOTA_V').AsInteger;
         vdadosmotven.ParamByName('MARCAV').AsString:=copy(buscas.FieldByName('MARCAEST').AsString,1,5);
         vdadosmotven.ParamByName('DESCRICAO_VERSAOV').AsString:=buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
         vdadosmotven.ParamByName('VERSAOV').asinteger:=buscas.FieldByName('VERSAOEST').asinteger;
         vdadosmotven.ParamByName('ANO_FABV').asinteger:=buscas.FieldByName('ANO_FABEST').asinteger;
         vdadosmotven.ParamByName('ANO_MODV').asinteger:=buscas.FieldByName('ANO_MODEST').asinteger;
         vdadosmotven.ParamByName('CORV').AsString:=buscas.FieldByName('COREST').AsString;
         vdadosmotven.ParamByName('CILINDROSV').AsInteger:=buscas.FieldByName('CILINDROSEST').asinteger;
         vdadosmotven.ParamByName('COMBUSTIVELV').AsString:=buscas.FieldByName('COMBUSTIVELEST').AsString;
         vdadosmotven.ParamByName('CILINDRADAV').AsFloat:=buscas.FieldByName('CILINDRADAEST').AsFloat;
         vdadosmotven.ParamByName('HPV').AsFloat:=buscas.FieldByName('HPEST').AsFloat;
         vdadosmotven.ParamByName('LOTACAOV').AsString:=buscas.FieldByName('LOTACAOEST').AsString;
         vdadosmotven.ParamByName('TIPOV').AsString:=copy(buscas.FieldByName('TIPOEST').AsString,1,12);
         vdadosmotven.ParamByName('RENAVAMV').AsString:=buscas.FieldByName('RENAVAMEST').AsString;
         vdadosmotven.ParamByName('PRECO_TABV').ascurrency:=buscas.FieldByName('PRECO_TABEST').ascurrency;
         vdadosmotven.ParamByName('OBS_ITEMV').AsString:=buscas.FieldByName('OBS_ITEMEST').AsString;
         vdadosmotven.ParamByName('MOTORV').AsString:=buscas.FieldByName('MOTOREST').AsString;
         vdadosmotven.ParamByName('PLACAV').AsString:=buscas.FieldByName('PLACAEST').AsString;
         vdadosmotven.ParamByName('CERTIFICADOV').AsString:=copy(buscas.FieldByName('CERTIFICADOEST').AsString,1,9);
         vdadosmotven.ParamByName('DATA_CERTIFICADOV').AsString:=buscas.FieldByName('DATA_CERTIFICADOEST').AsString;
         vdadosmotven.ParamByName('CATEGORIAV').AsString:=buscas.FieldByName('CATEGORIAEST').AsString;
         vdadosmotven.ParamByName('N_COMANDO').asinteger:=dataset.FieldByName('N_COMANDO').asinteger;
//         vdadosmotven.ParamByName('SUB_SERIE').asinteger:=dataset.FieldByName('SUB_SERIE').AsInteger;
         vdadosmotven.ParamByName('NF_AQ').AsInteger:=buscas.FieldByName('NUM_NOTA').AsInteger;
         vdadosmotven.ParamByName('DATA_CH_NOTA').AsString:=buscas.FieldByName('DATA_CH_NOTA').AsString;
         vdadosmotven.ParamByName('COD_FORNECEDOR').AsInteger:=buscas.FieldByName('COD_FORNECEDOR').AsInteger;
         vdadosmotven.ParamByName('COD_EMPRESA').AsInteger:=buscas.FieldByName('COD_EMPRESA').AsInteger;
         vdadosmotven.ParamByName('FRETE_AQUISICAOV').AsCurrency:=buscas.FieldByName('FRETE_AQUISICAOEST').AsCurrency;
         vdadosmotven.ParamByName('FRETE_VENDAV').AsCurrency:=buscas.FieldByName('FRETE_VENDAEST').AsCurrency;
         vdadosmotven.ParamByName('BASE_CALC_ICM_SUBV').AsCurrency:=buscas.FieldByName('BASE_CALC_ICM_SUBEST').AsCurrency;
         vdadosmotven.ParamByName('VALOR_ICM_SUBV').AsCurrency:=buscas.FieldByName('VALOR_ICM_SUBEST').AsCurrency;
         vdadosmotven.ParamByName('DATA_SAIDA').AsString:=dataset.FieldByName('DATA_VEN').AsString;
         vdadosmotven.ParamByName('COD_COR').AsInteger:=buscas.FieldByName('COD_COR').AsInteger;
         vdadosmotven.ParamByName('PRECO_CUSTO').AsFloat:=buscas.FieldByName('PRECO_CUSTO').AsFloat;
         vdadosmotven.Prepare;
         vdadosmotven.ExecSQL;
        end;
        if (dataSet.FieldByName('NATOP_V').value <> 5409) and (dataset.FieldByName('NATOP_V').value <> 6409) then
        begin
          vdadosmotven.close;
          vdadosmotven.SQL.text:='SELECT chassi FROM VEICULOS WHERE chassi = '''+
          buscas.FieldByName('CHASSI_C').AsString+''' and cod_empresa = '+
          vDadosIni.codEmpresa+' and ativo = 1';
          vdadosmotven.Open;
          if vdadosmotven.IsEmpty then
          begin
           vdadosmotven.close;
           vdadosmotven.sql.text:=
           'INSERT INTO VEICULOS(CODIGO,COD_EMPRESA,CHASSI,COD_CLIENTE,'+
           'ESPECIE,MARCA_V,MODELO,DESCMODELO,MOTOR,COR,ANOFAB,'+
           'ANOMOD,CILINDROS,CILINDRADA,LOTACAO,DATA_VENDA,DATA_CAD,HORA_CAD,HP,PLACA,COMBUSTIVEL) '+
           'VALUES(:CODIGO,:COD_EMPRESA,:CHASSI,:COD_CLIENTE,:ESPECIE,:MARCA_V,'+
           ':MODELO,:DESCMODELO,:MOTOR,:COR,:ANOFAB,:ANOMOD,'+
           ':CILINDROS,:CILINDRADA,:LOTACAO,:DATA_VENDA,:DATA_CAD,:HORA_CAD,:HP,:PLACA,:COMBUSTIVEL)';
           vdadosmotven.ParamByName('CODIGO').AsInteger:=
           Gencodigo('VEICULOS', DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
           vdadosmotven.ParamByName('COD_EMPRESA').AsString:=buscas.FieldByName('COD_EMPRESA').AsString;
           vdadosmotven.ParamByName('CHASSI').AsString:=buscas.FieldByName('CHASSI_C').AsString;
           vdadosmotven.ParamByName('COD_CLIENTE').AsString:=dataset.FieldByName('CLIENTES_V').AsString;
           vdadosmotven.ParamByName('ESPECIE').AsString:=buscas.FieldByName('TIPOEST').AsString;
           vdadosmotven.ParamByName('MARCA_V').AsString:=buscas.FieldByName('MARCAEST').AsString;
           vdadosmotven.ParamByName('MODELO').AsString:=buscas.FieldByName('VERSAOEST').AsString;
           vdadosmotven.ParamByName('DESCMODELO').AsString:=buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
           vdadosmotven.ParamByName('MOTOR').AsString:=buscas.FieldByName('MOTOREST').AsString;
           vdadosmotven.ParamByName('COR').AsString:=buscas.FieldByName('COREST').AsString;
           vdadosmotven.ParamByName('ANOFAB').AsString:=buscas.FieldByName('ANO_FABEST').AsString;
           vdadosmotven.ParamByName('ANOMOD').AsString:=buscas.FieldByName('ANO_MODEST').AsString;
           vdadosmotven.ParamByName('CILINDROS').AsString:=buscas.FieldByName('CILINDROSEST').AsString;
           vdadosmotven.ParamByName('CILINDRADA').AsFloat:=buscas.FieldByName('CILINDRADAEST').AsFloat;
           vdadosmotven.ParamByName('COMBUSTIVEL').AsString:=buscas.FieldByName('COMBUSTIVELEST').AsString;
           vdadosmotven.ParamByName('LOTACAO').AsString:=buscas.FieldByName('LOTACAOEST').AsString;
           vdadosmotven.ParamByName('DATA_VENDA').AsString:=dataset.FieldByName('DATA_VEN').AsString;
           vdadosmotven.ParamByName('DATA_CAD').AsDate:=date;
           vdadosmotven.ParamByName('HORA_CAD').AsString:=FormatDateTime('HH:MM', date);
           vdadosmotven.ParamByName('HP').AsFloat:=buscas.FieldByName('HPEST').AsFloat;
           vdadosmotven.ParamByName('PLACA').AsString:=copy(buscas.fieldbyname('CHASSI_C').value, 10,8);
           vdadosmotven.Prepare;
           vdadosmotven.ExecSQL;
          end
          else
          begin
           vdadosmotven.close;
           vdadosmotven.sql.text:=
             'UPDATE VEICULOS SET COD_CLIENTE = :COD_CLIENTE,'+
             'ESPECIE = :ESPECIE, MARCA_V = :MARCA_V, MODELO = :MODELO,DESCMODELO = :DESCMODELO, MOTOR = :MOTOR, COR = :COR, ANOFAB = :ANOFAB,'+
             'ANOMOD = :ANOMOD, CILINDROS = :CILINDROS, CILINDRADA = :CILINDRADA, LOTACAO = :LOTACAO, DATA_VENDA = :DATA_VENDA, HP = :HP, COMBUSTIVEL = :COMBUSTIVEL '+
             ' WHERE chassi = '''+ Trim(buscas.FieldByName('CHASSI_C').AsString)+''' and cod_empresa = '+
             vDadosIni.codEmpresa+' and ativo = 1';
           vdadosmotven.ParamByName('COD_CLIENTE').AsString:=dataset.FieldByName('CLIENTES_V').AsString;
           vdadosmotven.ParamByName('ESPECIE').AsString:=buscas.FieldByName('TIPOEST').AsString;
           vdadosmotven.ParamByName('MARCA_V').AsString:=buscas.FieldByName('MARCAEST').AsString;
           vdadosmotven.ParamByName('MODELO').AsString:=buscas.FieldByName('VERSAOEST').AsString;
           vdadosmotven.ParamByName('DESCMODELO').AsString:=buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
           vdadosmotven.ParamByName('MOTOR').AsString:=buscas.FieldByName('MOTOREST').AsString;
           vdadosmotven.ParamByName('COR').AsString:=buscas.FieldByName('COREST').AsString;
           vdadosmotven.ParamByName('ANOFAB').AsString:=buscas.FieldByName('ANO_FABEST').AsString;
           vdadosmotven.ParamByName('ANOMOD').AsString:=buscas.FieldByName('ANO_MODEST').AsString;
           vdadosmotven.ParamByName('CILINDROS').AsString:=buscas.FieldByName('CILINDROSEST').AsString;
           vdadosmotven.ParamByName('CILINDRADA').AsFloat:=buscas.FieldByName('CILINDRADAEST').AsFloat;
           vdadosmotven.ParamByName('COMBUSTIVEL').AsString:=buscas.FieldByName('COMBUSTIVELEST').AsString;
           vdadosmotven.ParamByName('LOTACAO').AsString:=buscas.FieldByName('LOTACAOEST').AsString;
           vdadosmotven.ParamByName('DATA_VENDA').AsString:=dataset.FieldByName('DATA_VEN').AsString;
           vdadosmotven.ParamByName('HP').AsFloat:=buscas.FieldByName('HPEST').AsFloat;
           vdadosmotven.Prepare;
           vdadosmotven.ExecSQL;

           // Verificar se o cancelamento de nf
          end;
        end;
        buscas.close;
        buscas.sql.text:='DELETE FROM EST_MOTO WHERE CHASSI_C = '''+dataSet.FieldByName('CHASSIV').AsString+''' '+
        ' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;
      end;
    end;
  end
  else
  begin
    if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N' then
    begin
       buscas.close;
       buscas.sql.text:='UPDATE EST_MOTO SET SITUACAO = ''DEMONSTRACAO'' '+
       'where chassi_c = '''+dataset.FieldByName('CHASSIV').AsString+''' and '+
       'cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1';
       buscas.Prepare;
       buscas.ExecSQL;
    end
    else
    begin
      dataSet.Edit;
      dataSet.FieldByName('CONFUS').AsString:='S';
      dataSet.Post;
    end
  end;
end;

function TPendVeic.BaixarVeiculosCCIA(vtp, vmtus: integer): boolean;
var
  vcodmtusadas: integer;
  buscas2: TIBQuery;
  pDtSetTemp: TClientDataSet;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  Result := True;

  if dataSet.FieldByName('NATUREZA').AsString = 'S' then
  begin
    if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
    begin
      if vtp = 1 then
      begin
         buscas.close;
         buscas.sql.text := ' select * from Est_Moto ' +
           ' where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
           ' and codigo = ' + InttoStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
           ' and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1';
         buscas.open;

         if Trim(buscas.FieldByName('POSICAO').AsString) = 'MORTO' then
         begin
//           result:=false;
           exit;
         end;

         buscas.Close;
         if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
           buscas.SQL.Text := 'UPDATE EST_MOTO SET STATUS_ESTOQUE = :STATUS_ESTOQUE, POSICAO = :POSICAO, ' +
            ' STATUS_TRANSDEP = :STATUS_TRANSDEP ' +
            ' WHERE N_COMANDOV = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
            ' AND CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
            ' AND CODIGO = '  + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
            ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa
         else
           buscas.SQL.Text := 'UPDATE EST_MOTO SET POSICAO = :POSICAO, ' +
            ' STATUS_TRANSDEP = :STATUS_TRANSDEP ' +
            ' WHERE N_COMANDOV = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
            ' AND CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
            ' AND CODIGO = '  + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
            ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;

          if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
            buscas.ParamByName('STATUS_ESTOQUE').AsString := 'N';
          if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
            buscas.ParamByName('POSICAO').AsString := 'MORTO';
          if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
            buscas.ParamByName('STATUS_TRANSDEP').AsString := 'S';
          buscas.Prepare;
          buscas.ExecSQL;

          AtualizarVeiculos(buscas2);

          dataSet.Edit;
          dataSet.FieldByName('CONFUS').AsString := 'S';
          dataSet.Post;
      end
      else
      begin
          buscas.close;
          buscas.sql.text:='select * from Est_Moto where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
           ' and codigo = ' + InttoStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
           ' and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1';  // and status_uso = ''N''
          buscas.open;

          if Trim(buscas.FieldByName('POSICAO').AsString) = 'MORTO' then
          begin
//            result:=false;
            exit;
          end;

          //if (dataSet.FieldByName('NATOP_V').value <> 5409) and (dataset.FieldByName('NATOP_V').value <> 6409) then
//          if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'T') and (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
//          begin
              AtualizarVeiculos(buscas2);
//          end;
          buscas.Close;
          if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
            buscas.SQL.Text := 'UPDATE EST_MOTO SET STATUS_ESTOQUE = :STATUS_ESTOQUE, POSICAO = :POSICAO, ' +
             ' STATUS_TRANSDEP = :STATUS_TRANSDEP ' +
             ' WHERE N_COMANDOV = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
             ' AND CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
             ' AND CODIGO = '  + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
             ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa
          else
           buscas.SQL.Text := 'UPDATE EST_MOTO SET POSICAO = :POSICAO, ' +
            ' STATUS_TRANSDEP = :STATUS_TRANSDEP ' +
            ' WHERE N_COMANDOV = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
            ' AND CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
            ' AND CODIGO = '  + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
            ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;

          if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
            buscas.ParamByName('STATUS_ESTOQUE').AsString := 'N';
          if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
            buscas.ParamByName('POSICAO').AsString := 'MORTO';
          if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
            buscas.ParamByName('STATUS_TRANSDEP').AsString := 'S';
          buscas.Prepare;
          buscas.ExecSQL;
      end;
    end
    else
    begin
//       buscas.Close;
//       buscas.SQL.Text := 'UPDATE EST_MOTO SET STATUS_ESTOQUE = :STATUS_ESTOQUE, POSICAO = :POSICAO, ' +
//        ' STATUS_TRANSDEP = :STATUS_TRANSDEP, STATUS_DEMONST = :STATUS_DEMONST ' +
//        ' WHERE N_COMANDOV = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
//        ' AND CHASSI_C = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
//        ' AND CODIGO = '  + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
//        ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
//
//       if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
//         buscas.ParamByName('STATUS_ESTOQUE').AsString := 'N';
//       if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
//            buscas.ParamByName('POSICAO').AsString := 'MORTO';
//       if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
//         buscas.ParamByName('STATUS_TRANSDEP').AsString := 'S';
//       else if dataSet.FieldByName('TIPV_VEICULO').AsString = 'D' then
//        buscas.ParamByName('STATUS_DEMONST').AsString := 'S';
//       buscas.Prepare;
//       buscas.ExecSQL;

       AtualizarVeiculos(buscas2);

       if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U' then
       begin
         if dataset.State <> dsEdit then
          dataSet.Edit;
         dataSet.FieldByName('CONFUS').AsString := 'S';
         dataSet.Post;
       end;
    end;
  end;
  InserirHistEstMoto;
end;

function TPendVeic.cl_abreExtrato_form(ACodCliente: Integer): boolean;
var
  AProcedure: Tcl_abreExtrato_form;
  AQueryRescue: TIBQuery;
  AUseQueryIni: Boolean;
begin           
  try
  	if not vDadosIni._mdiAberto('TFrmCadClientes', 'Cadastro do cliente ja esta aberto, feche o cadastro para utilizar esta funcionalidade') then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    
    if vClienteVeic.AHandle = 0 then
      CarregaPacote('pkClientes', vClienteVeic.AHandle);

    if vClienteVeic.AHandle = 0 then
    begin
      Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
      Exit;
    end;
    @AProcedure := GetProcAddress(vClienteVeic.AHandle, 'cl_abreExtrato_form');

    if Assigned(AProcedure) then
      Result := AProcedure(ACodCliente);
  finally
  end;
end;

function TPendVeic.confirmarecebimento(ValorRecebido: currency): boolean;
begin
  try
    IniciaTransacao;
    edit;
    dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
    dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
    dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
    dataSet.FieldByName('VL_RQ_PG_CXL').Value := ValorRecebido;
    Post;
    if Apply then
      result := true
    else
      Result := false;
    CommitaTransacao;
  except
      on e: exception do
      begin
        RollBackTransacao;
        result := false;
        Application.MessageBox(pchar('Erro na Gravação: '+
        e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
        registraErro('Erro CXL: ' + e.Message);
      end;
//
//    RollBackTransacao;
  end;
end;

constructor TPendVeic.create;
begin
  DataSet := TClientDataSet(DtmBalcao.CdsPendVeic);
  transacao := TIBTransaction(DtmBalcao.IbTransBalcao);
  buscas := TIBQuery(DtmBalcao.qrBuscas);
  vdadosmotven:=TIBQuery(DtmBalcao.QrBuscasGeral);

  vTestarDtFechcomDtCaixa := false;
end;

function TPendVeic.DadosComando(vnComando, vtp: integer): boolean;
begin
  if vtp = 1 then
  begin
    DtmBalcao.IbComandoPesq.close;
    DtmBalcao.IbComandoPesq.SQL.clear;
    DtmBalcao.IbComandoPesq.sql.text := 'SELECT * FROM COM_FAT WHERE N_COMANDO = ' +
      inttostr(vnComando) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
    DtmBalcao.IbComandoPesq.Open;
    buscas.close;
    buscas.sql.Text := 'SELECT * FROM CLIENTES WHERE COD_CLIENTE = ' +
      DtmBalcao.IbComandoPesq.FieldByName('CLIENTES_V').AsString + ' AND COD_EMPRESA = ' +
      vDadosIni.codEmpresa;
    buscas.OPEN;
    vcliente := buscas.fieldbyname('NOME_CLIENTE').AsString;
    buscas.close;
    buscas.sql.Text := 'SELECT * FROM COLABORADOR WHERE COD_VENDEDOR = ' +
      DtmBalcao.IbComandoPesq.FieldByName('COVEND_V').AsString + ' AND COD_EMPRESA = ' +
      vDadosIni.codEmpresa;
    buscas.OPEN;
    vvendedor := buscas.fieldbyname('NOME_VENDEDOR').AsString;
    buscas.close;
    buscas.sql.Text := 'SELECT * FROM COND_PAG WHERE COD_COND_PAG = ' +
      DtmBalcao.IbComandoPesq.FieldByName('CONDPAG_V').AsString;
    buscas.OPEN;
    vcondpag := buscas.fieldbyname('DESC_COND_PAG').AsString;
    buscas.close;
    buscas.sql.Text := 'SELECT * FROM NAT_OP WHERE CODIGO_NOP = ' +
      DtmBalcao.IbComandoPesq.FieldByName('NATOP_V').AsString;
    buscas.OPEN;
    vnatop := buscas.fieldbyname('DESCRICAO_NOP').AsString;
  end
  else
    DtmBalcao.IbComandoPesq.close;
end;

destructor TPendVeic.destroy;
begin
  inherited;
  Close;
end;

function TPendVeic.gerarnfVenda: boolean;
begin
  Edit;
  if (dataSet.fieldbyname('num_nota_v').IsNull) then
  begin
    if tentarSCAN then
    begin
     dataset.fieldbyname('NUM_NOTA_V').AsInteger := Gencodigo('NF_VENDASCAN', DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
     dataset.FieldByName('SERIE').AsString := IntToStr(vDadosIni.vEmp.vNfe.serieScan);
     dataset.FieldByName('SUB_SERIE').AsInteger := StrToIntDef(dataset.FieldByName('SERIE').AsString, 0);
     dataset.FieldByName('MODELO_NF').AsString := vDadosIni.vEmp.vNfe.modeloNF;
     dataSet.FieldByName('TIPONFE').AsString := 'SCAN';
     if vDadosIni.vEmp.vVersaoVeiculos = '4' then
      dataSet.FieldByName('EMISSAO_PROPRIA').AsString := 'S';
    end
    else
    begin
     dataset.fieldbyname('NUM_NOTA_V').AsInteger := Gencodigo('NF_VENDA' + IfThen(vDadosIni.vEmp.vNfe.webServiceAmbiente <> 'Produção', '_HOM'),
                                                              DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
     vDadosIni.hw_registra_estatistica('NOTAFISCAL');
     dataset.FieldByName('SERIE').AsString := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
     dataset.FieldByName('SUB_SERIE').AsInteger := StrToIntDef(dataset.FieldByName('SERIE').AsString, 0);
     dataset.FieldByName('MODELO_NF').AsString := vDadosIni.vEmp.vNfe.modeloNF;
     if vDadosIni.vEmp.vVersaoVeiculos = '4' then
      dataSet.FieldByName('EMISSAO_PROPRIA').AsString := 'S';
    end;
  end;
  post;
  apply;
end;

function TPendVeic.InserirHistEstMoto: boolean;
var
  buscas2, buscas3: TIBQuery;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas3 := TIBQuery.Create(Application);
  buscas3.Database := buscas.Database;
  buscas3.Transaction := buscas.Transaction;

  buscas2.Close;
  buscas2.SQL.Text := ' SELECT E.PRECO_CUSTO, E.PRECO_TABEST, E.RED_LUCRO, E.STATUS_DEMONST, E.STATUS_ESTOQUE, E. STATUS_RES ,' +
    ' E.STATUS_TRANSDEP, E.STATUS_USO, CFT.* FROM COM_FAT CFT ' +
    ' LEFT JOIN EST_MOTO E ON E.CHASSI_C = CFT.CHASSIV AND E.CODIGO = CFT.COD_ESTMOTO AND E.COD_EMPRESA = CFT.COD_EMPRESA ' +
    ' WHERE CFT.N_COMANDO = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
    ' AND CFT.COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas2.Open;

  vDadosIni.vHistV.vChassi := buscas2.FieldByName('CHASSIV').AsString;
  vDadosIni.vHistV.vCodigo := buscas2.FieldByName('COD_ESTMOTO').AsInteger;
  vDadosIni.vHistV.vNatureza := buscas2.FieldByName('NATUREZA').AsString;
  vDadosIni.vHistV.vNumDoc := buscas2.FieldByName('N_COMANDO').AsInteger;
  vDadosIni.vHistV.vPlaca := buscas2.FieldByName('PLACAV').AsString;
  vDadosIni.vHistV.vTipo := buscas2.FieldByName('TIPO').AsString;
  vDadosIni.vHistV.vModelo := buscas2.FieldByName('MODELO').AsString;
  vDadosIni.vHistV.vNumNota := 0;
  vDadosIni.vHistV.vSerieNF := '';
  vDadosIni.vHistV.vStatusNF := '';
  vDadosIni.vHistV.vSituacaoNF := '';
  vDadosIni.vHistV.vModeloNF := '';
  vDadosIni.vHistV.vEmissaoPropriaNF := '';
  vDadosIni.vHistV.vValorOP := buscas2.FieldByName('VALOR_REAL').AsFloat;
  vDadosIni.vHistV.vData := buscas2.FieldByName('DT_ENT_SAID').AsString;
  vDadosIni.vHistV.vNatOP := buscas2.FieldByName('NATOP_V').AsFloat;
  vDadosIni.vHistV.vTipoVenda := buscas2.FieldByName('TIPO_VENDA_V').AsString;
  vDadosIni.vHistV.vCodCliente := buscas2.FieldByName('CLIENTES_V').AsInteger;
  vDadosIni.vHistV.vCodCliVend := buscas2.FieldByName('COD_CLI_VENDE').AsInteger;
  vDadosIni.vHistV.vCodGerente := buscas2.FieldByName('COD_GERENTE').AsInteger;
  vDadosIni.vHistV.vCodConcess := buscas2.FieldByName('COD_CONCESS').AsInteger;
  vDadosIni.vHistV.vCodIntermed := buscas2.FieldByName('COD_INTERMED').AsInteger;
  vDadosIni.vHistV.vCodVendedor := buscas2.FieldByName('COVEND_V').AsInteger;
  vDadosIni.vHistV.vCodCondPag := buscas2.FieldByName('CONDPAG_V').AsInteger;
  vDadosIni.vHistV.vPrecCusto := buscas2.FieldByName('PRECO_CUSTO').AsFloat;
  vDadosIni.vHistV.vPrecTabEst := buscas2.FieldByName('PRECO_TABEST').AsFloat;
  vDadosIni.vHistV.vRedLucro := buscas2.FieldByName('RED_LUCRO').AsString;
  vDadosIni.vHistV.vTipvVeiculo := buscas2.FieldByName('TIPV_VEICULO').AsString;
  vDadosIni.vHistV.vStatusDemonst := buscas2.FieldByName('STATUS_DEMONST').AsString;
  vDadosIni.vHistV.vStatusEstoque := buscas2.FieldByName('STATUS_ESTOQUE').AsString;
  vDadosIni.vHistV.vStatusRes := buscas2.FieldByName('STATUS_RES').AsString;
  vDadosIni.vHistV.vStatusTransD := buscas2.FieldByName('STATUS_TRANSDEP').AsString;
  vDadosIni.vHistV.vStatusUso := buscas2.FieldByName('STATUS_USO').AsString;
  vDadosIni.vHistV.vStatusV := buscas2.FieldByName('STATUS_V').AsString;
  vDadosIni.vHistV.vPosicao := 'MORTO';
  vDadosIni.vHistV.vNumOS := 0;
  vDadosIni.vHistV.vAlteraEstoqueCFOP := buscas2.FieldByName('ALTERA_ESTOQUE_CFOP').AsString;
  vDadosIni.GravarHistEstMoto(buscas3, DtmBalcao.SpIncCodigoCxl, vDadosIni.vHistV);

  if (dataSet.ChangeCount = 0) then
    Result := True
  else
    Result := Apply;

end;

function TPendVeic.marcaRec(vtp: integer): boolean;
var
 vComando: Integer;
begin
  try
    Result := False;
    
    if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    begin
      vComando := dataSet.FieldByName('N_COMANDO').AsInteger;
      try
        dataSet.RefreshRecord;
        if vComando <> dataSet.FieldByName('N_COMANDO').AsInteger then
        begin
          Result := False;
          Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
            'Atenção', 0 + 64);
          Exit;
        end;

      except on E: Exception do
        begin
          if Pos('changed by another user', e.Message) > 0 then
          begin
            Result := False;
            Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
              'Atenção', 0 + 64);
            Exit;
          end;
        end;
      end;
    end;

    if vtp = 1 then
      if ((vTestarDtFechcomDtCaixa) and (dataSet.FieldByName('DATA_FECH').AsDateTime <> vDadosIni.diaFCxl)) then
      begin
        Result := False;

        Application.MessageBox(PChar('Data de fechamento do documento diferente da data do caixa auxiliar.' + #13 +
           'Data de fechamento: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('data_fech').AsDateTime) + #13 +
           'Data do caixa: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.diaFCxl) + #13 + #13 +
           'Favor verificar antes de continuar!'), 'Atenção', 0 + 64);

        if not vDadosIni.PesqPros('CXL079', 'PERMITIR',
           'DATA FECH DIF DATA CAIXA - TIPO MOV NUM DOC ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger),
           'COM_FAT', '', buscas, false) then
          Exit;
      end;

    IniciaTransacao;
    edit;
    if vtp = 1 then
    begin
      if dataSet.FieldByName('VALOR_A_REC').IsNull then
        dataSet.FieldByName('VALOR_A_REC').AsCurrency:=0;

      dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
      dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
      dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
    end
    else
    begin
      dataSet.FieldByName('DIA_CXL').Value := null;
      dataSet.FieldByName('STATUS_CXL_RQ').value := null;
      dataset.FieldByName('OP_CXL').value := null;
      dataset.FieldByName('VL_RQ_PG_CXL').value := 0;
    end;
    Post;
    if Apply then
      result := true
    else
      Result := false;
    CommitaTransacao;
  except
    RollBackTransacao;
    MessageDlg('Erro ao marcar o documento para recebimento', mterror, [mbOK], 0);
  end;
end;

function TPendVeic.PegaInfRec: boolean;
begin
  abrePendVeic;
  vlVnd := 0;
  vsrec := 0;
  vlrec := 0;
  qtdvnd := 0;
  vtipdoc := 'MOT';
  while not dataset.Eof do
  begin
    if ((dataset.FieldByName('VL_RQ_PG_CXL').IsNull) or (dataSet.FieldByName('VL_RQ_PG_CXL').value =
      0)) and (dataSet.FieldByName('DATA_VEN').AsDateTime <= vdadosini.diaFCxl) then
      vsrec := vsrec + dataset.FieldByName('VALOR_A_REC').AsCurrency;
    dataSet.next;
  end;
  buscas.Close;
  buscas.SQL.Text := 'select sum(VALOR_A_REC),count(*)  from com_fat where ' +
    'dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and cod_empresa = ' +
    vDadosIni.codEmpresa + ' AND ATIVO = 1 ';
  buscas.open;
  vlVnd := buscas.Fields[0].AsCurrency;
  qtdvnd := buscas.Fields[1].AsInteger;
end;

function TPendVeic.post: boolean;
begin
  inherited post;
end;

function TPendVeic.recebendo: boolean;
begin
  result := ExecutaComandosSql('select op_cxl from COM_FAT where n_comando = ' +
    dataset.FieldByName('N_COMANDO').AsString + ' and ' +
    '(op_cxl is null or op_cxl = 0 or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
      ') and COD_EMPRESA = ' +
    vDadosIni.codEmpresa + ' AND ATIVO = 1 ');
end;

function TPendVeic.tentarSCAN: boolean;
begin
  Result := False;
  Exit;
  {
  vDadosIni.atualizarVariaveisEmpresa(buscas);
  if dataSet.FieldByName('num_nota_v').AsInteger = 0 then
  begin
//    if (dataSet.FieldByName('modelo_nf').AsString = '55') and
    if (vDadosIni.vEmp.vNfe.modeloNF = '55') and
       (vDadosIni.vEmp.vNfe.danfeFormaEmissao = 'SCAN') then
    begin
      Application.ProcessMessages;
      Application.MessageBox(pchar('Configuração do SCAN ativada.'+#13+
        'O Sistema irá verificar o Status do servidor SCAN na RFB'),
        'Atenção',0+64);
      //Usar metodo da dll para verificar o Status do servidor SCAN
      if VerificaSCAN(StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW) ) = 107 then
      begin
        Application.ProcessMessages;
        Result :=  Application.MessageBox(pchar('SCAN ativado pela SEFAZ de Origem'+#13+
          'Deseja enviar nota fiscal pelo servidor SCAN na RFB?'),'Confirmação',MB_ICONQUESTION+MB_YESNO) = IDYES;
      end;
    end;
  end;
  }
end;

function TPendVeic.verificaEnvioNFVeic: boolean;
var
 vmtn,vmtus: integer;
begin
 Result:=true;
 vmtus:=0;
 if (not dataSet.FieldByName('NUM_NOTA_V').IsNull) and
 (dataset.FieldByName('MODELO_NF').AsString = '55') and (trim(dataset.FieldByName('SITUACAO_NFE').AsString) = '') then
  Result:=true
 else
 if (not dataSet.FieldByName('NUM_NOTA_V').IsNull) and
 (dataset.FieldByName('MODELO_NF').AsString = '55') then
  Result:=false
 else
  if (dataSet.FieldByName('MODELO_NF').AsString = '55') and
  (trim(dataset.FieldByName('SITUACAO_NFE').AsString) = '') then
   result:=true
  else
   result:=false;
 if trim(dataSet.FieldByName('TIPO_VENDA_V').asstring) = 'U' then
 begin
   if (trim(dataSet.FieldByName('CONFUS').AsString) = 'S') and
   (dataSet.FieldByName('NUM_NOTA_V').IsNull) then
   begin
     result:=false;
      buscas.close;
      buscas.sql.text:='select * from mot_ven where n_comando = '+
      dataset.FieldByName('N_COMANDO').AsString+' and chassiv = '''+
      dataSet.FieldByName('CHASSIV').AsString+''' and cod_empresa = '+
      vDadosIni.codEmpresa+' and ativo = 1';
      buscas.open;
      if buscas.FieldByName('NF_AQ').asinteger <> 0 then
      begin
       vmtus:=1;
       Result:=true;
      end
      else
       result:=false;
   end
   else
   begin
     dataSet.Refresh;
     if dataSet.FieldByName('NUM_NOTA_V').AsInteger = 0 then
     begin
      buscas.close;
      buscas.sql.text:='select * from MtUsadas where chassi_us = '''+
      dataSet.FieldByName('CHASSIV').AsString+''' and cod_empresa = '+
      vDadosIni.codEmpresa+' and ativo = 1';
      buscas.open;
      if buscas.FieldByName('NFAQ_US').asinteger <> 0 then
      begin
       vmtus:=1;
       Result:=true;
      end
      else
       result:=false;
     end
     else
      Result:=True;
   end;
   vmtn:=1;
 end
 else
  vmtn:=2;
 try
   IniciaTransacao;
   if result then
     gerarnfVenda;
   BaixarVeiculos(vmtn,vmtus);
   CommitaTransacao;
 except
    on e: exception do
    begin
      Refresh;
      RollBackTransacao;
      result := false;
      Application.MessageBox(pchar('Erro na Gravação: '+
      e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
      registraErro('Erro CXL: ' + e.Message);
    end;
 end;

end;

function TPendVeic.verificaEnvioNFVeicCCIA: boolean;
var
  vmtn, vmtus: integer;
begin
  Result := true;
  vmtus := 0;
  if (dataSet.FieldByName('NUM_NOTA_V').IsNull) then
     Result := true
  else if (not dataSet.FieldByName('NUM_NOTA_V').IsNull) and
   (dataset.FieldByName('MODELO_NF').AsString = '55') and (trim(dataset.FieldByName('SITUACAO_NFE').AsString) = '') then
    Result := true
  else
    if (not dataSet.FieldByName('NUM_NOTA_V').IsNull) and (dataset.FieldByName('MODELO_NF').AsString = '55') then
      Result := false
    else
      if (dataSet.FieldByName('MODELO_NF').AsString = '55') and (trim(dataset.FieldByName('SITUACAO_NFE').AsString) = '') then
        result := true
      else
        result := false;

  if (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U') or (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N') then
  begin
    if (trim(dataSet.FieldByName('CONFUS').AsString) = 'S') and
      (dataSet.FieldByName('NUM_NOTA_V').IsNull) then
    begin
      result := false;
//      buscas.close;
//      buscas.sql.text := 'select * from com_fat ' +
//        ' where n_comando = ' + dataset.FieldByName('N_COMANDO').AsString +
//        ' and chassiv = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
//        ' and cod_estmoto = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
//        ' and cod_empresa = ' +
//        vDadosIni.codEmpresa + ' and ativo = 1';
//      buscas.open;
      buscas.close;
      buscas.sql.text := 'select * from est_moto ' +
        ' where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
        ' and codigo = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
        ' and cod_empresa = ' +
        vDadosIni.codEmpresa + ' and ativo = 1';
      buscas.open;
      if buscas.FieldByName('COD_NF').asinteger <> 0 then
      begin
        vmtus := 2;
        Result := true;
      end
      else
      begin
        vmtus := 1;
        result := false;
      end;
    end
    else
    begin
      dataSet.Refresh;
      if dataSet.FieldByName('NUM_NOTA_V').AsInteger = 0 then
      begin
        buscas.close;
        buscas.sql.text := 'select * from est_moto ' +
         ' where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
         ' and codigo = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
         ' and cod_empresa = ' +
          vDadosIni.codEmpresa + ' and ativo = 1';
        buscas.open;
        if buscas.FieldByName('NUM_NOTA').asinteger <> 0 then
        begin
          vmtus := 2;
          Result := true;
        end
        else
        begin
          vmtus := 1;
          result := false;
        end;
      end
      else
        Result := True;
    end;
  end
  else
    vmtn := 2;
  try
    IniciaTransacao;
    if result then
      gerarnfVenda;
    if not BaixarVeiculosCCIA(vmtn, vmtus) then
    begin
      Result := False;
      exit;
    end;

    CommitaTransacao;
  except
    on e: exception do
    begin
      Refresh;
      RollBackTransacao;
      result := false;
      Application.MessageBox(pchar('Erro na Gravação: ' +
        e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
      registraErro('Erro: ' + e.Message);
    end;
  end;
end;

function TPendVeic.verificairregularidade: boolean;
begin
//
 Result:=true;
 buscas.close;
 buscas.sql.text:='select status_v from com_fat where n_comando = '+dataSet.FieldByName('N_COMANDO').AsString+
 'and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1';
 buscas.Open;
 if (not buscas.FieldByName('STATUS_V').isnull) or (buscas.isempty)  then
 begin
  Application.MessageBox(pchar('Irregularidades Encontradas no Comando Verifique, Comando Cancelado ou Apagado'),
        'Atenção',MB_ICONEXCLAMATION + MB_OK);
        result:=false;
 end;
 buscas.close;
end;

function TPendVeic.verificardiferenca: boolean;
var
  valorPago: currency;
begin
  Buscas.Close;
  Buscas.SQL.Text := 'SELECT sum(valordoc) as valordoc FROM FORMPAGAMENTO ' +
  ' WHERE NREQUISICAO = ' + dataSet.FieldByName('N_COMANDO').asstring +
  ' AND TPDOCS = ''MOT'' and OP_CXL = ' + inttostr(vDadosIni.vcodopcxl) +
  ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1';
  Buscas.Open;
  valorpago:=dataSet.FieldByName('vl_rq_pg_cxl').AsCurrency;
  if RoundTo(valorPago, -2) > RoundTo(Buscas.FieldByName('valordoc').AsCurrency, -2) then
    result := true
  else if RoundTo(dataSet.FieldByName('VALOR_A_REC').AsFloat, -2) > RoundTo(dataSet.FieldByName('vl_rq_pg_cxl').AsFloat, -2) then
    result := true
  else
   result := false;
end;

{ TPendRecV }

function TPendRecV.abrePendRec: boolean;
begin
  result := montaSelect(' select * from recibos  ' +
    ' where (dia_cxl is null ' +
    ' or dia_cxl = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') ' +
    ' and (op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' or op_cxl is null or op_cxl = 0) ' +
    ' and nrecibo < 100000 ' +
    ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
    ' coalesce(cod_emp_mult, cod_empresa)', 'cod_empresa') + ' = ' + vDadosIni.codEmpresa +
    ' and (cxl is null or cxl = ''S'') ' +
    ' and ativo = 1 ' +
    ' order by nrecibo');
end;

function TPendRecV.confirmarecebimento(ValorRecebido: currency): boolean;
begin
  try
    IniciaTransacao;
    edit;
    dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
    dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
    dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
    dataSet.FieldByName('VL_RQ_PG_CXL').Value := ValorRecebido;
    Post;
    if Apply then
      result := true
    else
      Result := false;
    CommitaTransacao;
  except
    on e: exception do
      begin
        RollBackTransacao;
        result := false;
        Application.MessageBox(pchar('Erro na Gravação: '+
        e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
        registraErro('Erro CXL: ' + e.Message);
      end;
//    RollBackTransacao;
  end;
end;

constructor TPendRecV.create;
begin
  DataSet := TClientDataSet(DtmBalcao.CdsPendRec);
  transacao := TIBTransaction(DtmBalcao.IbTransBalcao);
  buscas := TIBQuery(DtmBalcao.qrBuscas);

  vTestarDtFechcomDtCaixa := false;
end;

destructor TPendRecV.destroy;
begin
  inherited;
  Close;
end;

function TPendRecV.marcaRec(vtp: integer): boolean;
begin

  if vtp = 1 then
    if ((vTestarDtFechcomDtCaixa) and (dataSet.FieldByName('data_rec').AsDateTime <> vDadosIni.diaFCxl)) then
    begin
      Result := False;

      Application.MessageBox(PChar('Data do recibo diferente da data do caixa auxiliar.' + #13 +
         'Data do recibo: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('data_rec').AsDateTime) + #13 +
         'Data do caixa: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.diaFCxl) + #13 + #13 +
         'Favor verificar antes de continuar!'), 'Atenção', 0 + 64);

      if not vDadosIni.PesqPros('CXL079', 'PERMITIR',
        'DATA RECIBO DIF DATA CAIXA - NRECIBO ' + IntToStr(dataSet.FieldByName('NRECIBO').AsInteger),
        'RECIBOS', '', buscas, false) then
        Exit;
    end;

  try
    IniciaTransacao;
    edit;
    if vtp = 1 then
    begin
      dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
      dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
      dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
    end
    else
    begin
      dataSet.FieldByName('DIA_CXL').Value := null;
      dataSet.FieldByName('STATUS_CXL_RQ').value := null;
      dataset.FieldByName('OP_CXL').value := null;
      dataset.FieldByName('VL_RQ_PG_CXL').value := 0;
    end;
    Post;
    if Apply then
      result := true
    else
      Result := false;
    CommitaTransacao;
  except
    RollBackTransacao;
    MessageDlg('Erro ao marcar o documento para recebimento', mterror, [mbOK], 0);
  end;
end;

function TPendRecV.PegaInfRec: boolean;
begin
//  Close;
//  Open;
  abrePendRec;
  vlVnd := 0;
  vsrec := 0;
  vlrec := 0;
  qtdvnd := 0;
  vtipdoc := 'REC';
  while not dataset.Eof do
  begin
    if ((dataset.FieldByName('VL_RQ_PG_CXL').IsNull) or (dataSet.FieldByName('VL_RQ_PG_CXL').value =
      0)) and (dataset.FieldByName('DATA_REC').AsDateTime <= vdadosini.diaFCxl) then
      vsrec := vsrec + dataset.FieldByName('VALOR').AsCurrency;
    dataSet.next;
  end;
  buscas.Close;
  buscas.SQL.Text := 'select sum(VALOR_ORIG),count(*)  from recibos where ' +
    'dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and cod_empresa = ' +
    vDadosIni.codEmpresa + ' AND ATIVO = 1 ';
  buscas.open;
  vlVnd := buscas.Fields[0].AsCurrency;
  qtdvnd := buscas.Fields[1].AsInteger;
  buscas.Close;
  buscas.SQL.text := 'select sum(h.valor_baixa) from hist_rec h  where ' +
    'h.op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' AND h.COD_EMPRESA = ' +
    vDadosIni.codEmpresa + ' and h.data_baixa = ' + chr(39) +
    FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' AND h.ATIVO = 1 ';
  buscas.open;
  vlrec := buscas.Fields[0].AsCurrency;
  buscas.close;
end;

function TPendRecV.post: boolean;
begin
  inherited post;
end;

function TPendRecV.recebendo: boolean;
begin
  result := ExecutaComandosSql('select op_cxl from recibos where nrecibo = ' +
    dataset.FieldByName('NRECIBO').AsString + ' and ' +
    '(op_cxl is null or op_cxl = 0 or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
      ') and COD_EMPRESA = ' +
    vDadosIni.codEmpresa + ' AND ATIVO = 1 ');
end;

function TPendRecV.verificarRecibo: boolean;
begin
  Result := true;
  if (vDadosIni.vRecibo.ReceberPeloFinanceiro) then
  begin
    SqlOpen(' select nrecibo, cod_empresa, cxl from recibos ' +
	    ' where nrecibo = ' + IntToStr(dataSet.fieldbyname('NRECIBO').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);

    if not buscas.IsEmpty then
      if (vDadosIni.vSistema = 'Cxl') and (buscas.FieldByName('cxl').AsString = 'N') then
      begin
        Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique', 'Atenção', MB_OK + MB_ICONWARNING);
        Result := false;
        exit;
      end;
  end;
end;

{ TFormRecCXL }

function TFormRecCXL.AbreformpgCXL(vtp: integer): boolean;
begin
  if vtp = 1 then
  begin
    montaSelect('select cx.nome_ctrl, ' +
      ' sum(coalesce(fr.valordoc, 0)), ' +
      ' sum(coalesce(fr.vl_juros, 0)) vl_juros, ' +
      ' cx.codigo_ctrl from formpagamento fr ' +
      ' inner join controles cx on fr.cod_controle = cx.codigo_ctrl and fr.cod_empresa = cx.codigo_emp ' +
      ' where fr.data_mov = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) +     
      ' and fr.op_cxl = ' + Inttostr(vDadosIni.vcodopcxl) +
      ' and fr.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and fr.ativo = 1 ' +
      ' group by cx.nome_ctrl,cx.codigo_ctrl ');
    vlrec := 0;
    vljuros := 0; 
    while not dataSet.Eof do
    begin
      vlrec := vlrec + dataSet.FieldByName('sum').AsCurrency;
      vljuros := vljuros + dataSet.FieldByName('vl_juros').AsCurrency;
      next;
    end;
  end;
end;

constructor TFormRecCXL.create;
begin
  dataSet := TClientDataSet(DtmBalcao.cdscontrformas);
  buscas := TIBQuery(DtmBalcao.qrBuscas);
end;

destructor TFormRecCXL.destroy;
begin
  inherited;
  Close;
end;

function TFormRecCXL.fechdet: boolean;
begin
  DtmBalcao.QrDetalhesCtrl.Close;
end;

function TFormRecCXL.SomaFormCXL: boolean;
begin
  DtmBalcao.QrDetalhesCtrl.Close;
  DtmBalcao.QrDetalhesCtrl.SQL.Text := ' SELECT fp.data_mov, fp.tpdocs, fp.nrequisicao, fp.ndoc, ' +
    ' fp.cliente, fp.historico, fp.valordoc, fp.data_venc, fp.terceiros, fp.cod_controle, fp.seqform, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    DtmBalcao.QrDetalhesCtrl.SQL.Text := DtmBalcao.QrDetalhesCtrl.SQL.Text +
    	' case when(fp.tpdocs = ''REC'') then ' +
      '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then rc.num_rec_dep ' +
      '   else '''' end ' +
      ' else fp.nrequisicao ' +
      ' end num_rec_dep, ' +
      ' case when (fp.tpdocs = ''REC'') then ' +
      '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then (rc.num_rec_dep||''-''||fp.nparcela) ' +
      '     else '''' end ' +
      ' else fp.ndoc ' +
      ' end num_rec_parc ';
  end
  else
  	DtmBalcao.QrDetalhesCtrl.SQL.Text := DtmBalcao.QrDetalhesCtrl.SQL.Text + ''' '' num_rec_dep, '' '' num_rec_parc ';
  DtmBalcao.QrDetalhesCtrl.SQL.Text := DtmBalcao.QrDetalhesCtrl.SQL.Text +
    ' FROM FORMPAGAMENTO fp ' +
    ' left join recibos rc on rc.nrecibo = fp.nrequisicao and rc.cod_empresa = fp.cod_empresa ' +
    ' WHERE fp.data_mov = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' and fp.cod_controle = ' + dataSet.FieldByName('CODIGO_CTRL').AsString +
    ' and fp.op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
    ' order by fp.data_venc ';
  DtmBalcao.QrDetalhesCtrl.open;
end;

{ TLancCXL }

function TLancCXL.AbreLancCXL: boolean;
begin
  result := montaSelect('select * from lanccxl where data_lc_cxl = '
    + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' and op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa);
end;

constructor TLancCXL.create;
begin
  DataSet := TClientDataSet(DtmBalcao.CdsLancCXL);
  transacao := TIBTransaction(DtmBalcao.IbTransBalcao);
  buscas := TIBQuery(DtmBalcao.qrBuscas);
end;

destructor TLancCXL.destroy;
begin
  inherited;
  Close;
end;

function TLancCXL.PegaInfRec: boolean;
begin
  AbreLancCXL;
//  close;
//  open;
  vlrec := 0;
  vsrec := 0;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('TIPO_LANC_CXL').Value = 'E' then
    begin
      if (dataset.FieldByName('SDD').Value <> 'S') and
        (dataSet.FieldByName('TR').value <> 'S') then
        vlrec := vlrec + dataset.FieldByName('VALOR_CXL').value
    end
    else
    begin
      //      if (dataset.FieldByName('SDD').Value <> 'S') and (dataSet.FieldByName('TR').value <> 'S') then
      vsrec := vsrec + dataset.FieldByName('VALOR_CXL').value;
    end;
    Next;
  end;
end;

function TLancCXL.versomentelancavl: boolean;
begin
buscas.close;
buscas.sql.text:='SELECT sum(coalesce(valordoc, 0)) soma FROM FORMPAGAMENTO ' +
	' WHERE DATA_MOV = '+ QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) +
  ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
  ' AND TPDOCS = ''LCS'' AND (RECIBO IS NULL or RECIBO = '''') ' +
  ' AND OP_CXL = ' + inttostr(vDadosIni.vcodopcxl);
buscas.Open;
vllancavl:=buscas.FieldByName('soma').AsCurrency;
end;

//function TLancCXL.post: boolean;
//begin
//
//end;

{ TContrCXL }

function TContrCXL.abrePendcontrCXL(vtp: integer): boolean;
begin

end;

constructor TContrCXL.create;
begin
  transacao := TIBTransaction(DtmBalcao.IbTransBalcao);
  buscas := TIBQuery(DtmBalcao.qrBuscas);
end;

destructor TContrCXL.destroy;
begin

  inherited;
end;

function TContrCXL.procconta(vnome: string): real;
begin
  buscas.Close;
  buscas.SQL.text := 'SELECT * FROM P_CONTAS WHERE DESC_PLC = ''' + vnome + '''';
  buscas.Open;
  if not buscas.eof then
    Result := buscas.FieldByName('N_CONTA_PLC').AsFloat
  else
    Result := 0;
end;

function TContrCXL.procControle(vnome: string): integer;
begin
  buscas.Close;
  buscas.SQL.text := 'SELECT * FROM CONTROLES WHERE NOME_CTRL = ''' + vnome + '''';
  buscas.Open;
  if not buscas.eof then
    Result := buscas.FieldByName('CODIGO_CTRL').AsInteger
  else
    Result := 0;
end;

function TContrCXL.retornaContas(vcomb: TComboBox; pEntSaida: string): boolean;
begin
  Result := true;
  buscas.Close;
  buscas.SQL.text := 'SELECT * FROM P_CONTAS where coalesce(STHAB,'''') <> ''N'' and tipo_plc = ' + QuotedStr(pEntSaida);
  buscas.Open;
  if not buscas.eof then
  begin
    vcomb.Items.Clear;
    while not buscas.Eof do
    begin
      vcomb.Items.Add(buscas.FieldByName('DESC_PLC').AsString);
      buscas.next;
    end;
  end;
end;

function TContrCXL.retornaCtrl(vcomb: TComboBox): boolean;
begin
  Result := true;
  buscas.Close;
  buscas.SQL.text := 'SELECT * FROM CONTROLES ' +
  	' WHERE CODIGO_CTRL = 1 ' +
    ' AND ATIVO = 1 ' +
    ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' AND (COALESCE(CONTROLE_VISIVEL, ''S'') = ''S'') ', '');
  buscas.Open;
  if not buscas.eof then
  begin
    vcomb.Items.Clear;
    while not buscas.Eof do
    begin
      vcomb.Items.Add(buscas.FieldByName('NOME_CTRL').AsString);
      buscas.next;
    end;
  end;
end;

function TContrCXL.testarNumConta(pNatureza: string; pNumConta: Double;
  var pMensagem: string): boolean;
begin
   try
    if (vpermitir) then
    begin
      Result := true;
     	Exit;
    end;
    Result := false;

    buscas.Close;
    buscas.SQL.Text := ' select p.n_conta_plc, p.desc_plc, p.tipo_plc, c.desc_gr, ' +
    	' c.tipo_gr, s.desc_sub_ct, p.tipo_ctp, p.gerar_contrapartida, p.estornar_vale from p_contas p  ' +
    	' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
      ' where p.n_conta_plc = :n_conta_plc ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := pNumConta;
    buscas.Open;

     if pNatureza = 'S' then
      pMensagem := 'Conta "' + FloatToStr(pNumConta) +
        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
        'Motivo(s): ' + #13 +
        '* Natureza do grupo da conta não esta definida como "SAÍDA"' + #13 +
        '* Tipo da conta não é de origem "FORNECEDOR"/"OUTRAS SAÍDAS"' + #13 +
        '* Conta não pode estar configurada como contrapartida' + #13 +
        '* Conta não pode estar configurada como estornar vale' + #13 +
        'Favor verificar antes de continuar!'
    else
    	pMensagem := 'Conta "' + FloatToStr(pNumConta) +
        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
        'Motivo(s): ' + #13 +
        '* Tipo de entrada não é de origem "EMPRESTIMO"/"TRANSFERÊNCIA"/"OUTRAS RECEITAS"!' + #13 +
        '* Conta não pode estar configurada como contrapartida' + #13 +
        'Favor verificar antes de continuar!';

    Result := True;
    
    if buscas.IsEmpty then
      Exit;

    if buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
    begin
      Result := false;
      Exit;
    end
    else if buscas.FieldByName('ESTORNAR_VALE').AsString = 'S' then
    begin
      Result := false;
      Exit;
    end;

    if pNatureza = 'S' then
    begin
	    if buscas.FieldByName('TIPO_PLC').AsString = 'E' then //Conta de entrada
   	 	Exit;
    end
    else
    begin
      if buscas.FieldByName('TIPO_PLC').AsString = 'S' then //Conta de saída
   	 	Exit
    end;

    if pNatureza = 'S' then
    begin
      if buscas.FieldByName('TIPO_GR').AsString = 'S' then //Natureza da conta de saída
        Exit
      else if buscas.FieldByName('TIPO_CTP').AsString = 'F' then // Conta do tipo fornecedor
        Exit
    end
    else
    begin
      if buscas.FieldByName('TIPO_CTP').AsString = 'E' then // Conta do tipo emprestimo
        Exit
      else if buscas.FieldByName('TIPO_CTP').AsString = 'T' then // Conta do tipo transferencia
        Exit;
    end;

    if buscas.FieldByName('TIPO_CTP').AsString = 'O' then // Conta do tipo outras
    	Exit;

    Result := False;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TContrCXL._dadosNContaPlcValidos(pNatureza: string; pNumConta: Double): boolean;
begin
   Result := False;

   buscas.Close;
   buscas.SQL.Text := 'select gc.DESC_GR,dc.DESC_DEP, pc.TIPO_CTP from p_contas pc ' +
     ' inner join grupos_ct gc on pc.grup_ct=gc.grup_ct inner join depart_ct dc on gc.cod_dep=dc.cod_dep ' +
     ' where pc.n_conta_plc=:Vncontaplc and pc.ativo=1';
   buscas.ParamByName('Vncontaplc').AsFloat := pNumConta;
   buscas.Open;
   rConta.vDescricaoGR := 'Grupo da Conta: ' + buscas.fieldbyname('DESC_GR').asstring;
   rConta.vDescricaoDEP := 'Departamento da Conta: ' + buscas.fieldbyname('DESC_DEP').asstring;
   rConta.vTipoConta := 'Tipo de conta a pagar: ' + vDadosIni.retornaDescricaoTipoNumConta(vDadosIni.IfThen(pNatureza = '', 'S', pNatureza), buscas.fieldbyname('TIPO_CTP').AsString);

   Result := True;
end;

{ TFecdCXL }

function TFecdCXL.abreFecDia: boolean;
begin
  result := montaSelect(
    'select * from fecd_cxl where op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa + ' order by dia_f_cxl ');
end;

procedure TFecdCXL.cablanc(rdresumo: Trdprint);
begin
  linha := linha + 1;
  RdREsumo.imp(linha, 1, 'Descricao');
  RdREsumo.imp(linha, 47, 'Valor');
  RdREsumo.imp(linha, 54, 'Tipo');
  RdREsumo.imp(linha, 59, 'Nº Conta');
  linha := linha + 1;
  RdREsumo.imp(linha, 1, vdadosini.replicate('-', length('Descricao')));
  RdREsumo.imp(linha, 47, vdadosini.replicate('-', length('Valor')));
  RdREsumo.imp(linha, 54, vdadosini.replicate('-', length('Tipo')));
  RdREsumo.imp(linha, 59, vdadosini.replicate('-', length('Nº Conta')));
  linha := linha + 1;
end;

procedure TFecdCXL.cabrecibosrec(Rdrecibos: Trdprint;vdia: Tdate);
begin
  RdRecibos.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  RdRecibos.ImpF(linha, 1, 'RELATORIO DE RECIBOS REC. POR PERIODO', [normal, negrito]);
  linha := linha + 1;
  RdRecibos.ImpF(linha, 1, 'N. MOVIMENTO: ' + vdadosini.strzero(dataSet.FieldByName('N_MOV_CXL').AsInteger, 5), [normal, negrito]);
  linha := linha + 1;
  RdRecibos.ImpF(linha, 1, 'DATA........: ' +datetostr(vdia), [normal, negrito]);
  vpag := vpag + 1;
  linha := linha + 2;
  RdRecibos.ImpF(linha, 1, datetostr(date), [normal]);
  RdRecibos.ImpF(linha, 95, 'PAG: ' + vdadosini.strzero(vpag, 3), [normal]);
  linha := linha + 1;
  RdRecibos.ImpF(linha, 1, vdadosini.replicate('=', 132), [comp17]);
  linha := linha + 1;
  RdRecibos.ImpF(linha, 1, 'Nº RECIBO', [comp17]);
  RdRecibos.ImpF(linha, 14, 'HISTORICO', [comp17]);
  RdRecibos.ImpF(linha, 70, 'VALOR', [comp17]);
  linha := linha + 1;
  RdRecibos.ImpF(linha, 1, vdadosini.replicate('=', 132), [comp17]);
  linha := linha + 1;
end;

procedure TFecdCXL.cabrelcxl(rdrelcxl: TrdPrint; detalhar: boolean = false);
var
 vstatus: string;
begin
  if (dataSet.FieldByName('STATUS_CXL').AsString = '') then
   vstatus:='(CAIXA ABERTO)'
  else
   vstatus:='(CAIXA FECHADO)';
  RdRelCxl.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  RdRelCxl.ImpF(linha, 1, 'RELATORIO DE MOVIMENTO DIARIO', [normal, negrito]);
  linha := linha + 1;
  RdRelCxl.ImpF(linha, 1, 'N. MOVIMENTO: ' + vdadosini.strzero(dataSet.FieldByName('N_MOV_CXL').AsInteger, 5), [normal, negrito]);
  linha := linha + 1;
  RdRelCxl.ImpF(linha, 1, 'DATA........: ' +dataSet.FieldByName('DIA_F_CXL').asstring+' '+vstatus, [normal, negrito]);
  vpag := vpag + 1;
  linha := linha + 2;
  RdRelCxl.ImpF(linha, 1, datetostr(date), [normal]);
  RdRelCxl.ImpF(linha, 95, 'PAG: ' + vdadosini.strzero(vpag, 3), [normal]);
  linha := linha + 1;
  RdRelCxl.ImpF(linha, 1, vdadosini.replicate('=', 132), [comp17]);
  linha := linha + 1;
  RdRelCxl.ImpF(linha, vPosDtMov, 'DT.MOV', [comp17]);
  RdRelCxl.ImpF(linha, vPosTipo, 'TIPO', [comp17]);
  RdRelCxl.ImpF(linha, vPosNDoc, 'N.DOC', [comp17]);
  RdRelCxl.ImpD(linha, vPosValor, 'VALOR', [comp17]);
  RdRelCxl.ImpF(linha, vPosHistorico, 'HISTORICO', [comp17]);
  linha := linha + 1;
  if detalhar then
  begin
    RdRelCxl.ImpF(linha, vPosControle, 'CONTROLE', [comp17]);
    RdRelCxl.ImpF(linha, vPosValorRec, 'VALOR REC', [comp17]);
    linha := linha + 1;
  end;
  RdRelCxl.ImpF(linha, 1, vdadosini.replicate('=', 132), [comp17]);
  linha := linha + 1;
end;

procedure TFecdCXL.cadresumo(rdresumo: Trdprint);
var
 vstatus: string;
begin
  if (dataSet.FieldByName('STATUS_CXL').AsString = '') then
   vstatus:='(CAIXA ABERTO)'
  else
   vstatus:='(CAIXA FECHADO)';
  RdREsumo.imp(linha, 1, 'DATA DO CAIXA: ' +datetostr(dataSet.FieldByName('DIA_F_CXL').AsDateTime));
  RdREsumo.imp(linha, 27, 'Loja: ' + copy(vdadosini.strzero(strtoint(vDadosIni.codEmpresa), 3) +
  ' ' + vDadosIni.vEmp.vnomeEmpresa, 1, 30));
  RdREsumo.imp(linha, 64, 'Op.: ' + copy(vDadosIni.vNomeUsuario, 1, 11));
  linha := linha + 1;
  RdREsumo.imp(linha, 1, vdadosini.replicate('-', 79));
  linha := linha + 1;
  // RdREsumo.imp(linha,1
  RdREsumo.Imp(linha, 25, 'RESUMO DO CAIXA '+vstatus);
  linha := linha + 1;
  RdREsumo.imp(linha, 1, vdadosini.replicate('-', 79));
  linha := linha + 1;
end;

function TFecdCXL.ConfirmaFechamentoCXL: boolean;
var
 vnmov: integer;
begin
  Result:=true;
  try
    IniciaTransacao;
    if dataSet.FieldByName('STATUS_CXL').AsString <> 'FECHADO' then
    begin
      edit;
      dataSet.FieldByName('STATUS_CXL').Value := 'FECHADO';
      Post;
      vnmov:=dataSet.FieldByName('N_MOV_CXL').value+1;
      dataSet.Append;
      dataSet.FieldByName('N_MOV_CXL').value :=vnmov;
//      Gencodigo('FECD_CXL', DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
      dataSet.FieldByName('DIA_F_CXL').value :=vDadosIni.diaAbertoCxl+1;
      dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
      dataSet.FieldByName('CODIGO_EMP').Value := vDadosIni.codEmpresa;
      Post;
    end
    else
    begin
     Application.MessageBox(pchar('Dia já fechado'), 'Informação', MB_OK + MB_ICONINFORMATION);
     Result:=false;
    end;
    if Apply then
      result := true
    else
      Result := false;
    CommitaTransacao;
    DiaAberto;
    vDadosIni.diaFCxl:=vDadosIni.diaAbertoCxl;
  except
  on e: exception do
      begin
        RollBackTransacao;
        result := false;
        Application.MessageBox(pchar('Erro na Gravação: '+
        e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
        registraErro('Erro CXL: ' + e.Message);
      end;
  end;
end;

constructor TFecdCXL.create;
begin
  DataSet := TClientDataSet(DtmBalcao.CdsFecDia);
  transacao := TIBTransaction(DtmBalcao.IbTransBalcao);
  buscas := TIBQuery(DtmBalcao.qrBuscas);
  buscasGeral:=TIBQuery(DtmBalcao.QrBuscasGeral);
end;

destructor TFecdCXL.destroy;
begin
  inherited;
  Close;
end;

function TFecdCXL.DiaAberto: Tdate;
var
  Temp: string;
begin
  Temp:= retornaValor( 'SELECT first 1 DIA_F_CXL as valor FROM FECD_CXL fdx' +
    ' where fdx.op_cxl = '+IntToStr(vDadosIni.vCodOpCxl)+' and (fdx.status_cxl <> ''FECHADO'' or '+
    ' fdx.status_cxl is null ) and codigo_emp = '+vdadosini.codEmpresa+'  ORDER BY DIA_F_CXL DESC');
  if trim(Temp) <> '' then
  begin
    result := StrToDate(Temp);
    vDadosIni.diaAbertoCxl:=StrToDate(Temp);
    vDadosIni.diaFCxl := vDadosIni.diaAbertoCxl;
    exit;
  end;


//  buscas.Close;
//  buscas.SQL.text := 'SELECT DIA_F_CXL FROM FECD_CXL ORDER BY DIA_F_CXL DESC';
//  buscas.Open;
//  if buscas.IsEmpty then
//  begin
    if not dataSet.Active then
      abreFecDia;
    try
      IniciaTransacao;
      Insert;
      dataSet.FieldByName('N_MOV_CXL').AsInteger :=
        Gencodigo('FECD_CXL', DtmBalcao.SpIncCodigoCxl, vDadosIni.codEmpresa);
      dataSet.FieldByName('DIA_F_CXL').AsDateTime := Date;
      dataSet.FieldByName('OP_CXL').AsInteger := vDadosIni.vCodOpCxl;
      dataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
      Post;
      Apply;
      CommitaTransacao;
      Result := date;
      
      Temp:= retornaValor( 'SELECT first 1 DIA_F_CXL as valor FROM FECD_CXL fdx' +
        ' where fdx.op_cxl = '+IntToStr(vDadosIni.vCodOpCxl)+' and (fdx.status_cxl <> ''FECHADO'' or '+
        ' fdx.status_cxl is null ) and codigo_emp = '+vdadosini.codEmpresa+'  ORDER BY DIA_F_CXL DESC');
      if trim(Temp) <> '' then
      begin
        result := StrToDate(Temp);
        vDadosIni.diaAbertoCxl:=StrToDate(Temp);
        vDadosIni.diaFCxl := vDadosIni.diaAbertoCxl;
      end;

    except
      RollBackTransacao;
      MessageDlg('Não foi possível gravar o dia inicial para este operador', mterror, [mbOK], 0);
    end;
//  end
//  else
//    result := buscas.FieldByName('DIA_F_CXL').AsDateTime;
end;

function TFecdCXL.maparesumo(ModRel: Integer; RdResumo: Trdprint): boolean;
var
  vlult, vlcreditos, vqtnotreq, LinhaCol2: integer;
  vvlnotreqE, vvlnotreq, vvlrecantec, vlnaogerarfinanc, vvltroco, vloutrassaidas, Totais: currency;
  vvljurosnotreq, vvldescontonotreq, vvlprest: currency;
  ALancClxReciboE, ALancClxReciboS: Currency;
  ALancCxlE, ALancCxlS: Currency;
  ALancCxlTroco: Currency;
  vqtpcvnd: real;
  vtip, tp1: string;
begin
  linha := 1;
  vpag := 0;
  RdResumo.OpcoesPreview.CaptionPreview := 'Relatório Resumo Caixa';
  RdResumo.TitulodoRelatorio := 'Relatório Resumo Resumo Caixa';
  vDadosIni._LimparVarSendEmail;
  RdResumo.OnSendMail := vDadosini._SendMailRdPrint;
  if not vDadosIni.ModImp(RdResumo) then
    exit;
  RdResumo.Abrir;
  cadresumo(RdResumo);
  buscas.close;
  buscas.sql.text := ' select sum(coalesce(rq.valor_total, 0)) as valor,count(rq.valor_total) as qtde from pedvenda rq ' +
    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda = ''S''' +
    ' and (((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
    ' where rq.dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
    ' and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1 ' +
    ' union '+
    ' select sum(coalesce(valor_a_rec, 0)) as valor,count(valor_a_rec) as qtde from com_fat ' +
    ' where dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
    ' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
  buscas.open;
  vqtnotreq := 0;
  vvlnotreq := 0;
  vvlrecantec := 0;
  vlnaogerarfinanc := 0;
  buscas.First;
  while not buscas.eof do
  begin
    vqtnotreq := vqtnotreq + buscas.FieldByName('QTDE').AsInteger;
    vvlnotreq := vvlnotreq + buscas.FieldByName('VALOR').AsCurrency;
    buscas.next;
  end;

  vloutrassaidas := 0;
  buscas.close;
  buscas.sql.text := ' select sum(coalesce(rq.valor_total, 0)) as valor,count(rq.valor_total) as qtde from pedvenda rq ' +
    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda <> ''S''' +
    ' and (((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
    ' where rq.dia_cxl = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)) +
    ' and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1 ';
  buscas.open;

  buscas.First;
  while not buscas.eof do
  begin
    vqtnotreq := vqtnotreq + buscas.FieldByName('QTDE').AsInteger;
    vloutrassaidas := buscas.FieldByName('VALOR').AsCurrency;
    buscas.Next;
  end;

  vvljurosnotreq := 0;
  
  buscas.close;
  buscas.sql.text := ' select pd.nped, pd.tipo, pd.cod_empresa, ' +
    ' sum(coalesce(fp.juros, 0)) juros from pedvenda pd ' +
    ' left join existe_formas(pd.nped, pd.tipo, pd.cod_empresa) fp on 1 = 1 ' +
    ' left join lanccxl cxl on cxl.n_doc_cxl = pd.nped and cxl.tipo_doc_cxl = pd.tipo and cxl.codigo_emp = pd.cod_empresa and cxl.tr = ''S'' ' +
    ' where pd.tipo = ''REQ'' and pd.dia_cxl = :dia_cxl and pd.op_cxl = :op_cxl and pd.cod_empresa = :cod_empresa ' +
    ' group by 1, 2, 3 ' +
    ' union all ' +
    ' select pd.nped, pd.tipo, pd.cod_empresa, ' +
    ' sum(coalesce(fp.juros, 0)) juros from pedvenda pd ' +
    ' left join existe_formas(pd.nped, pd.tipo, pd.cod_empresa) fp on 1 = 1 ' +
    ' left join lanccxl cxl on cxl.n_doc_cxl = pd.nped and cxl.tipo_doc_cxl = pd.tipo and cxl.codigo_emp = pd.cod_empresa and cxl.tr = ''S'' ' +
    ' where pd.tipo = ''OS'' and pd.dia_cxl = :dia_cxl and pd.op_cxl = :op_cxl and pd.cod_empresa = :cod_empresa ' +
    ' group by 1, 2, 3 ' +
    ' union all ' +
    ' select cf.n_comando, ''MOT'', cf.cod_empresa, ' +
    ' sum(coalesce(fp.juros, 0)) juros from com_fat cf ' +
    ' left join existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa) fp on 1 = 1 ' +
    ' left join lanccxl cxl on cxl.n_doc_cxl = cf.n_comando and cxl.tipo_doc_cxl = ''MOT'' and cxl.codigo_emp = cf.cod_empresa and cxl.tr = ''S'' ' +
    ' where cf.dia_cxl = :dia_cxl and cf.op_cxl = :op_cxl and cf.cod_empresa = :cod_empresa ' +
    ' group by 1, 2, 3 ' +
    ' union all ' +
    ' select bx.cod_cred, ''PRE'', bx.codigo_emp, ' +
    ' sum(coalesce(fp.juros, 0)) juros from baixa_creditos bx ' +
    ' left join existe_formas(bx.lote_cxl, ''PRE'', bx.codigo_emp) fp on 1 = 1 ' +
    ' left join lanccxl cxl on cxl.n_doc_cxl = bx.lote_cxl and cxl.tipo_doc_cxl = ''PRE'' and cxl.codigo_emp = bx.codigo_emp and cxl.tr = ''S'' ' +
    ' where bx.dia_cxl = :dia_cxl and bx.op_cxl = :op_cxl and bx.codigo_emp = :cod_empresa ' +
    ' and bx.datq_c is not null ' +
    ' group by 1, 2, 3 ' +
    ' union all ' +
    ' select ctr.cod_cred, ''PRE'', ctr.codigo_emp, ' +
    ' sum(coalesce(fp.juros, 0)) juros from controle_creditos ctr ' +
    ' left join existe_formas(ctr.lote_cxl, ''PRE'', ctr.codigo_emp) fp on 1 = 1 ' +
    ' left join lanccxl cxl on cxl.n_doc_cxl = ctr.lote_cxl and cxl.tipo_doc_cxl = ''PRE'' and cxl.codigo_emp = ctr.codigo_emp and cxl.tr = ''S'' ' +
    ' where ctr.dia_cxl = :dia_cxl and ctr.op_cxl = :op_cxl and ctr.codigo_emp = :cod_empresa ' +
    ' and ctr.tip_baixa is null and ctr.status_c is null and ctr.datq_c is null ' +
    ' group by 1, 2, 3 ';
  buscas.ParamByName('dia_cxl').AsDateTime := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
  buscas.ParamByName('op_cxl').AsInteger := vDadosIni.vCodOpCxl;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.open;

  buscas.First;
  while not buscas.eof do
  begin
    vvljurosnotreq := vvljurosnotreq + buscas.FieldByName('juros').AsFloat;
    buscas.Next;
  end;

  //Primeiro grupo de informações
  // Coluna 1
  LinhaCol2 := linha;
  RdREsumo.imp(linha, 1, 'Notas Registradas : ' +vDadosIni.alndir(inttostr(vqtnotreq), 8));
  linha := linha + 2;

  buscas.close;
  buscas.sql.text := ' select sum(coalesce(it.quant_ped_item, 0)) as qtde from pedvenda_prod it ' +
  	' inner join pedvenda rq on it.nped = rq.nped and it.tipo = rq.tipo and it.cod_empresa = rq.cod_empresa ' +
    ' where rq.dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+ ''' ' +
    ' and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1 ';
  buscas.open;
  RdREsumo.imp(linha, 1, 'Pecas Vendidas    : ' + vdadosini.alndir(format('%n', [buscas.FieldByName('qtde').AsCurrency]), 8));
  linha := linha + 1;
  RdREsumo.imp(linha, 1, 'Pecas Trocadas    : ');
  linha := linha + 1;
  RdREsumo.Imp(linha, 1, 'Pecas Devolvidas  : ');
  linha := linha + 1;
  buscas.close;

  // Coluna 2
  Totais := 0;
  RdREsumo.ImpF(LinhaCol2, 42, 'SAIDAS MERC.+SERV POR COND.PAG.', [negrito]);
  LinhaCol2 := LinhaCol2 + 1;
  buscas.SQL.Text := ' select sum(coalesce(rq.valor_total, 0)) as valor from pedvenda rq ' +
    ' inner join cond_pag cnd on rq.cod_cond_pag = cnd.cod_cond_pag' +
    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda = ''S''' +
    ' and (((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
    ' where rq.dia_cxl = :dia_cxl ' +
    ' and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and (cnd.desc_cond_pag like ''%VISTA%'')' +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1';
  buscas.ParamByName('dia_cxl').AsDate := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
  buscas.open;
  RdREsumo.imp(LinhaCol2, 42, 'A vista                : ' + vdadosini.alndir(format('%n', [buscas.FieldByName('valor').AsCurrency]), 12));
  Totais := Totais + buscas.FieldByName('valor').AsCurrency;
  LinhaCol2 := LinhaCol2 + 1;
  
  buscas.close;
  buscas.SQL.Text := ' select sum(coalesce(rq.valor_total, 0)) as valor from pedvenda rq' +
    ' inner join cond_pag cnd on rq.cod_cond_pag = cnd.cod_cond_pag' +
    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda = ''S''' +
    ' and (((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
    ' where rq.dia_cxl = :dia_cxl ' +
    ' and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and (not cnd.desc_cond_pag like ''%VISTA%'')' +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1';
  buscas.ParamByName('dia_cxl').AsDate := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
  buscas.open;
  RdREsumo.imp(LinhaCol2, 42, 'A Prazo                : ' + vdadosini.alndir(format('%n', [buscas.FieldByName('valor').AsCurrency]), 12));
  Totais := Totais + buscas.FieldByName('valor').AsCurrency;
  LinhaCol2 := LinhaCol2 + 1;

  buscas.close;
  buscas.SQL.Text := ' select sum(coalesce(rq.valor_total, 0)) as valor from pedvenda rq' +
    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda <> ''S''' +
    ' and (((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
    ' where rq.dia_cxl = :dia_cxl ' +
    ' and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and rq.ativo = 1';
  buscas.ParamByName('dia_cxl').AsDate := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
  buscas.open;
  RdREsumo.imp(LinhaCol2, 42, 'Outros                 : ' + vdadosini.alndir(format('%n', [buscas.FieldByName('valor').AsCurrency]), 12));
  Totais := Totais + buscas.FieldByName('valor').AsCurrency;
  LinhaCol2 := LinhaCol2 + 1;
  RdREsumo.ImpF(LinhaCol2, 42, 'TOTAL                  : ' + vdadosini.alndir(format('%n', [Totais]), 12), [negrito]);

  RdREsumo.imp(linha, 1, vdadosini.replicate('-', 79));
  linha := linha + 1;
  LinhaCol2 := linha;

  //Segundo grupo de informações
  //Coluna 1
  Totais := 0;
  RdREsumo.ImpF(LinhaCol2, 1, 'SAIDAS/RECIBOS/PREST/LANC', [negrito]);
  linha := linha + 2;
  Rdresumo.imp(linha, 1, 'Saídas Vendas     : ' +vDadosIni.alndir(format('%n', [vvlnotreq]), 12));
  linha := linha + 1;
  Totais := Totais + vvlnotreq;
  Rdresumo.imp(linha, 1,  'Outras Saídas     : ' +vDadosIni.alndir(format('%n', [vloutrassaidas]), 12));
  linha := linha + 1;
  Totais := Totais + vloutrassaidas;
  Rdresumo.ImpF(linha, 1, 'SubTotal          : ' +vDadosIni.alndir(format('%n', [Totais]), 12), [negrito]);
  linha := linha + 2;
  
  buscas.close;
  buscas.sql.text := ' select sum(coalesce(valor_orig, 0)) as valor from recibos ' +
  	' where dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+ ''' ' +
    ' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and cod_empresa = '+vDadosIni.codEmpresa;
  buscas.open;
  Rdresumo.imp(linha, 1, 'Recibos           : ' + vDadosIni.alndir(format('%n', [buscas.fieldbyname('valor').asfloat]), 12));
//                                          : ' +
  Totais := Totais + buscas.fieldbyname('valor').asfloat;
  linha := linha + 1;

  buscas.close;
  buscas.sql.text := ' select ''PRE'', sum(coalesce(vl_rq_pg_cxl, 0)) as valor, count(*) as qtde from controle_creditos ' +
  	' where dia_cxl = '''+ FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
	  ' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
  	' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = ' + vDadosIni.codEmpresa +
    ' union all ' +
    ' select ''PRE'', sum(coalesce(vl_rq_pg_cxl, 0)) as valor, count(*) as qtde from baixa_creditos ' +
  	' where dia_cxl = '''+ FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
	  ' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
  	' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = ' + vDadosIni.codEmpresa +
    ' and tp_operacao = ''P'' ';
  buscas.Open;

  vvlprest := 0;
  buscas.First;
  while not buscas.eof do
  begin
  	vvlprest := vvlprest + buscas.FieldByName('valor').AsCurrency;
  	Totais := Totais + buscas.FieldByName('valor').AsCurrency;

    buscas.next;
  end;

  RdREsumo.imp(linha, 1, 'Rec. Prestacoes   : ' + vdadosini.alndir(format('%n', [vvlprest]), 12));
  linha := linha + 1;

  buscas.close;
  buscas.sql.text := ' select * from lanccxl ' +
  	' where data_lc_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
  	' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.open;
  vvlnotreq := 0;
  vvlnotreqE := 0;
  vvltroco := 0;
  while not buscas.eof do
  begin
    if buscas.FieldByName('TR').AsString = 'S' then
      vvltroco := vvltroco + Abs(buscas.FieldByName('VALOR_CXL').AsCurrency)
    else
    begin
      if buscas.FieldByName('TIPO_LANC_CXL').AsString = 'S' then
      begin
      	if ModRel = 1 then
        	vvlnotreq := vvlnotreq + buscas.FieldByName('VALOR_CXL').AsCurrency
        else
        begin
      	  if buscas.FieldByName('REFRECIBO').AsString <> 'S' then
        		vvlnotreq := vvlnotreq + buscas.FieldByName('VALOR_CXL').AsCurrency
          else
            vvlrecantec := vvlrecantec + buscas.FieldByName('VALOR_CXL').AsCurrency;
        end;
      end
      else
        vvlnotreqE := vvlnotreqE + buscas.FieldByName('VALOR_CXL').AsCurrency;
    end;

    buscas.next;
  end;
  RdREsumo.imp(linha, 1, 'Saidas Extras     : ' + vdadosini.alndir('-' + format('%n', [vvlnotreq]), 12));
  Totais := Totais - vvlnotreq;
  linha := linha + 1;
  RdREsumo.imp(linha, 1, 'Outras Entradas   : ' + vdadosini.alndir(format('%n', [vvlnotreqE]), 12));
  Totais := Totais + vvlnotreqE;

  linha := linha + 1;
  Rdresumo.imp(linha, 1, 'Juros             : ' +vDadosIni.alndir(format('%n', [vvljurosnotreq]), 12));
  Totais := Totais + vvljurosnotreq;

//  linha := linha + 1;
//  Rdresumo.imp(linha, 1, 'Troco             : ' +vDadosIni.alndir(format('%n', [0 - vvltroco]), 12));
//  Totais := Totais - vvltroco;

  if ModRel = 1 then
  begin
  	linha := linha + 2;
  	RdREsumo.impf(linha, 1, 'Total Liquido     : ' + vdadosini.alndir(format('%n', [Totais]), 12), [negrito]);
  end;
//  else
//  begin
//  	linha := linha + 2;
//  	RdREsumo.impf(linha, 1, 'Total Geral       : ' + vdadosini.alndir(format('%n', [Totais]), 12), [negrito]);
//  end;

  if ModRel <> 1 then
  begin
  	linha := linha + 2;
    RdREsumo.imp(linha,  1, 'Recibos Antecipado: ' + vdadosini.alndir(format('%n', [-vvlrecantec]), 12));

//    linha := linha + 2;
//    RdREsumo.impf(linha, 1, 'Total Recebimento : ' + vdadosini.alndir(format('%n', [Totais - vvlrecantec]), 12), [negrito]);

  	buscas.close;
  	buscas.sql.text := ' select sum(coalesce(fp.valordoc, 0)) as valor from formpagamento fp ' +
    	' inner join Controles cx on fp.cod_controle = cx.codigo_ctrl and fp.cod_empresa = cx.codigo_emp ' +
      ' where fp.data_mov = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
    	' and fp.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
      ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and fp.ativo = 1 ' +
      ' and cx.nao_gera_finan = ''S'' ';
    buscas.open;

    linha := linha + 2;
    RdREsumo.imp(linha,  1, 'Não Gera Financ   : ' + vdadosini.alndir(format('%n', [-buscas.FieldByName('valor').AsFloat]), 12));

    linha := linha + 2;
    RdREsumo.impf(linha, 1, 'Total Liquido     : ' +
    	vdadosini.alndir(format('%n', [Totais
        - vvlrecantec
        - buscas.FieldByName('valor').AsFloat]), 12), [negrito]);
//    RdREsumo.impf(linha, 1, 'Total Gera Financ : ' +
//    	vdadosini.alndir(format('%n', [
//      	Totais
//        - vvlrecantec
//        - buscas.FieldByName('valor').AsFloat]), 12), [negrito]);
  end;

  linha := linha + 1;

  //Coluna 2
  RdREsumo.ImpF(LinhaCol2, 42, 'RECEBIMENTOS', [negrito]);
  LinhaCol2 := LinhaCol2 + 2;
  buscas.close;
  buscas.sql.text := ' select cx.nome_ctrl,'+//cx.nat_ctrl,' +
  	' cx.nao_gera_finan, ' +
    ' case when cx.tp_plano = ''C'' then ''C''' +
    '		when cx.nao_gera_finan = ''S'' then ''Z''' +
    '   when cx.baixa_automatica = ''S'' then ''Z''' +
    '   when cx.nat_ctrl = ''A'' then ''A''' +
    '   else ''P''' +
    ' end nat_ctrl,' +
    ' case when cx.tp_plano = ''C'' then 0' +
    '		when cx.nao_gera_finan = ''S'' then 3' +
    '   when cx.baixa_automatica = ''S'' then 2' +
    '   when cx.nat_ctrl = ''A'' then 0' +
    '   else 1' +
    ' end tp1,' +
    ' sum(coalesce(fp.valordoc, 0)) as valor FROM FORMPAGAMENTO fp ' +
    ' inner join Controles cx on fp.cod_controle = cx.codigo_ctrl and fp.cod_empresa = cx.codigo_emp ' +
    ' where fp.data_mov = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
    ' and fp.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
    ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and fp.ativo = 1 ' +
  //' and fp.tpdocs <> ''TRC'' ' +
    ' group by 1, 2, 3, 4 ' +
    ' order by 3, 4, 2, 1 ';
  buscas.open;
  vtip := buscas.FieldByName('nat_ctrl').AsString;
  vvlnotreq := 0;
  Totais := 0;
  while not buscas.eof do
  begin
    tp1 := vDadosIni.Replicate('*', buscas.FieldByName('tp1').AsInteger - 1);
    if vtip <> buscas.FieldByName('nat_ctrl').AsString then
    begin
      if vtip = 'A' then
        RdREsumo.imp(LinhaCol2, 42, 'Total a Vista          : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
      else if vtip = 'C' then
      	RdREsumo.imp(LinhaCol2, 42, 'Total Cartoes          : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
      else if vtip = 'Z' then
        RdREsumo.imp(LinhaCol2, 42, 'Total Outros           : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
      else
        RdREsumo.imp(LinhaCol2, 42, 'Total a Prazo          : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
      vtip := buscas.FieldByName('nat_ctrl').asstring;
      vvlnotreq := 0;
      LinhaCol2 := LinhaCol2 + 2;
      RdREsumo.imp(LinhaCol2, 42, copy( tp1 + buscas.FieldByName('nome_ctrl').value, 1, 23));
      RdREsumo.imp(LinhaCol2, 65, ': ' + vdadosini.alndir(format('%n', [buscas.fieldbyname('valor').ascurrency]), 12));
      LinhaCol2 := LinhaCol2 + 1;
      vvlnotreq := vvlnotreq + buscas.fieldbyname('valor').ascurrency;

      if buscas.FieldByName('nao_gera_finan').AsString = 'S' then
      	vlnaogerarfinanc := vlnaogerarfinanc + buscas.fieldbyname('valor').ascurrency;
    end
    else
    begin
      RdREsumo.imp(LinhaCol2, 42, copy( tp1 + buscas.FieldByName('nome_ctrl').value, 1, 23));
      RdREsumo.imp(LinhaCol2, 65, ': ' +vDadosIni.alndir(format('%n', [buscas.fieldbyname('valor').ascurrency]), 12));
      LinhaCol2 := LinhaCol2 + 1;
      vvlnotreq := vvlnotreq + buscas.fieldbyname('valor').ascurrency;

      if buscas.FieldByName('nao_gera_finan').AsString = 'S' then
      	vlnaogerarfinanc := vlnaogerarfinanc + buscas.fieldbyname('valor').ascurrency;
    end;
    //end;
    Totais := Totais + buscas.fieldbyname('valor').ascurrency;
    buscas.next;
    if buscas.eof then
    begin
      if vtip = 'A' then
        RdREsumo.imp(LinhaCol2, 42, 'Total a Vista          : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
      else if vtip = 'C' then
      	RdREsumo.imp(LinhaCol2, 42, 'Total Cartoes          : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
      else if vtip = 'Z' then
        RdREsumo.imp(LinhaCol2, 42, 'Total Outros           : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
      else
        RdREsumo.imp(LinhaCol2, 42, 'Total a Prazo          : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
      vtip :=buscas.FieldByName('nat_ctrl').AsString;
      vvlnotreq := 0;
      LinhaCol2 := LinhaCol2 + 2;
    end;

    if LinhaCol2 >= 62 then
    begin
      LinhaCol2 := 1;
      RdREsumo.Novapagina;
      cadresumo(RdResumo);
      CabLanc(RdResumo);
    end;
  end;

//  if ModRel <> 1 then
//  begin
//    RdREsumo.imp(LinhaCol2, 42, '** Recibo Antecipado   : ' + vdadosini.alndir(format('%n', [vvlrecantec]), 12));
//    LinhaCol2 := LinhaCol2 + 2;
//  end;

//  Totais := Totais - vvltroco;
  RdREsumo.imp(LinhaCol2, 42, '* Troco (' + trim(format('%n', [vvltroco])) + ')');
  vvltroco := 0;


  LinhaCol2 := LinhaCol2 + 2;
  if ModRel = 1 then
  	RdREsumo.impf(LinhaCol2, 42, 'Total Geral            : ' + vdadosini.alndir(format('%n', [Totais]), 12), [negrito])
  else
  begin
//    RdREsumo.impf(LinhaCol2, 42, 'Total Geral            : ' + vdadosini.alndir(format('%n', [Totais + vvlrecantec]), 12), [negrito]);

//  	LinhaCol2 := LinhaCol2 + 2;
//    RdREsumo.imp(LinhaCol2,  42, 'Recibos Antec          : ' + vdadosini.alndir(format('%n', [-vvlrecantec]), 12));

//    LinhaCol2 := LinhaCol2 + 2;
//    RdREsumo.impf(LinhaCol2, 42, 'Total Recebimento      : ' + vdadosini.alndir(format('%n', [Totais]), 12), [negrito]);

//    LinhaCol2 := LinhaCol2 + 2;
//    RdREsumo.imp(LinhaCol2,  42, 'Não Gerar Financeiro   : ' + vdadosini.alndir(format('%n', [-vlnaogerarfinanc]), 12));

//  	LinhaCol2 := LinhaCol2 + 2;
//    RdREsumo.impf(LinhaCol2, 42, 'Total Gera Financeiro  : ' + vdadosini.alndir(format('%n', [Totais - vlnaogerarfinanc]), 12), [negrito]);

    RdREsumo.impf(LinhaCol2, 42, 'Total Geral            : ' + vdadosini.alndir(format('%n', [Totais]), 12), [negrito]);
    LinhaCol2 := LinhaCol2 + 2;
  	RdREsumo.impf(LinhaCol2, 42, 'Total Liquido          : ' + vdadosini.alndir(format('%n', [Totais - vlnaogerarfinanc]), 12), [negrito]);
  end;

  if LinhaCol2 > linha then
    linha := LinhaCol2;

//  if (vloutrassaidas <= 0) then
  linha := linha + 1;
//  buscas.close;
//  buscas.sql.text:='SELECT sum(it.quant_ped_item) as qtde from pedvenda_prod it,pedvenda rq where '+
//  'it.nped = rq.nped and it.tipo = rq.tipo and it.cod_empresa = rq.cod_empresa and rq.dia_cxl = '''+
//  FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+''' and rq.op_cxl = '+inttostr(vDadosIni.vCodOpCxl)+
//  ' and rq.cod_empresa = '+vDadosIni.codEmpresa+' and rq.ativo = 1';
//  buscas.open;
//
//  vqtpcvnd := 0;
//  while not buscas.eof do
//  begin
//    vqtpcvnd := vqtpcvnd +buscas.FieldByName('qtde').AsCurrency;
//    buscas.next;
//  end;
//  //vqtpcvnd := vqtpcvnd + QrvendaMtCOUNT.value;
//  RdREsumo.imp(linha, 1, 'Pecas Vendidas    : ' + vdadosini.alndir(format('%n', [vqtpcvnd]), 8));
//  linha := linha + 1;
//  if (vloutrassaidas > 0) then
//    vlcreditos := linha + 1
//  else
//  vlcreditos := linha;
//  RdREsumo.imp(linha, 1, 'Pecas Trocadas    : ');
//  linha := linha + 1;
//  RdREsumo.Imp(linha, 1, 'Pecas Devolvidas  : ');
//  linha := linha + 2;
//  buscas.close;
//  buscas.sql.text:='SELECT sum(rq.valor_total) as valor from pedvenda rq,cond_pag cnd where '+
//  'rq.cod_cond_pag = cnd.cod_cond_pag and rq.dia_cxl = '''+
//  FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+''' and rq.op_cxl = '+inttostr(vDadosIni.vCodOpCxl)+
//  ' and cnd.desc_cond_pag like ''%VISTA%'' and rq.cod_empresa = '+
//  vDadosIni.codEmpresa+' and rq.ativo = 1';
//  buscas.SQL.Text := 'SELECT sum(rq.valor_total) as valor from pedvenda rq' +
//    ' inner join cond_pag cnd on rq.cod_cond_pag = cnd.cod_cond_pag' +
//    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda = ''S''' +
//    ' and ( ((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
//    ' where rq.dia_cxl = :dia_cxl and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
//    ' and (cnd.desc_cond_pag like ''%VISTA%'')' +
//    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
//    ' and rq.ativo = 1';
//  buscas.ParamByName('dia_cxl').AsDate := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
//  buscas.open;
//  vvlnotreq := 0;
//  while not buscas.eof do
//  begin
//    vvlnotreq := vvlnotreq + buscas.FieldByName('valor').AsCurrency;
//    buscas.next;
//  end;
//  RdREsumo.imp(linha, 1, 'A vista Total      : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
//  linha := linha + 1;
//  buscas.close;
////  buscas.sql.text:='SELECT sum(rq.valor_total) as valor from pedvenda rq,cond_pag cnd where '+
////  'rq.cod_cond_pag = cnd.cod_cond_pag and rq.dia_cxl = '''+
////  FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+''' and rq.op_cxl = '+inttostr(vDadosIni.vCodOpCxl)+
////  ' and (not cnd.desc_cond_pag like ''%VISTA%'') and rq.cod_empresa = '+
////  vDadosIni.codEmpresa+' and rq.ativo = 1';
//  buscas.SQL.Text := 'SELECT sum(rq.valor_total) as valor from pedvenda rq' +
//    ' inner join cond_pag cnd on rq.cod_cond_pag = cnd.cod_cond_pag' +
//    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda = ''S''' +
//    ' and ( ((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
//    ' where rq.dia_cxl = :dia_cxl and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
//    ' and (not cnd.desc_cond_pag like ''%VISTA%'')' +
//    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
//    ' and rq.ativo = 1';
//  buscas.ParamByName('dia_cxl').AsDate := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
//  buscas.open;
//  vvlnotreq := 0;
//  while not buscas.eof do
//  begin
//    vvlnotreq := vvlnotreq + buscas.FieldByName('valor').AsCurrency;
//    buscas.next;
//  end;
//  RdREsumo.imp(linha, 1, 'A Prazo Total     : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
//  linha := linha + 1;
//  buscas.close;
//  buscas.SQL.Text := 'SELECT sum(rq.valor_total) as valor from pedvenda rq' +
//    ' inner join tipo_vendas tv on tv.tipo = rq.tipo and tv.venda <> ''S''' +
//    ' and ( ((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
//    ' where rq.dia_cxl = :dia_cxl and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
//    ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
//    ' and rq.ativo = 1';
//  buscas.ParamByName('dia_cxl').AsDate := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
//  buscas.open;
//
//  vvlnotreq := buscas.FieldByName('valor').AsCurrency;
//  RdREsumo.imp(linha, 1, 'Outros  Total     : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
//  linha := linha + 2;

//  buscas.close;
//  buscas.sql.text:='select ''PRE'',sum(vl_rq_pg_cxl) as valor,count(*) as qtde '+
//  'from controle_creditos  where dia_cxl = '''+
//  FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+
//  ''' and op_cxl = '+inttostr(vDadosIni.vCodOpCxl)+
//  ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = '+vDadosIni.codEmpresa;
//  buscas.Open;
//  RdREsumo.imp(linha, 1, 'Rec. Prestacoes   : ' + vdadosini.alndir(format('%n', [buscas.FieldByName('valor').AsCurrency]), 12));
//  linha := linha + 1;
//  buscas.close;
//  buscas.sql.text:='SELECT cx.nome_ctrl,cx.nat_ctrl,sum(fp.valordoc) '+
//  'FROM FORMPAGAMENTO fp,Controles cx  WHERE '+
//  '(fp.DATA_MOV = '''+FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+''') AND '+
//  'fp.op_cxl = '+inttostr(vDadosIni.vCodOpCxl)+
//  ' and fp.cod_controle = cx.codigo_ctrl and fp.cod_empresa = cx.codigo_emp and '+
//  'fp.cod_empresa = '+vDadosIni.codEmpresa+' AND FP.ATIVO = 1 '+
//  'group by cx.nat_ctrl,cx.nome_ctrl ';
//  vvlnotreq:=0;// Aqui deveria ter um algorítmo para procurar os vales
//  //RdREsumo.imp(linha, 1, 'Vales Emitidos    : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
//  linha := linha + 2;
//  linha := linha + 2;
////  buscas.close;
////  buscas.sql.text:='select * from lanccxl where data_lc_cxl = '''+FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+
////  ''' and op_cxl = '+inttostr(vDadosIni.vCodOpCxl)+' and codigo_emp = '+vDadosIni.codEmpresa;
////  buscas.open;
////  vvlnotreq := 0;
////  vvlnotreqE := 0;
////  while not buscas.eof do
////  begin
////    if buscas.FieldByName('TIPO_LANC_CXL').AsString = 'S' then
////      vvlnotreq := vvlnotreq + buscas.FieldByName('VALOR_CXL').AsCurrency
////    else
////      vvlnotreqE := vvlnotreqE + buscas.FieldByName('VALOR_CXL').AsCurrency;
////    buscas.next;
////  end;
////  RdREsumo.imp(linha, 1, 'Saidas Extras     : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
////  linha := linha + 1;
////  RdREsumo.imp(linha, 1, 'Outras Entradas   : ' + vdadosini.alndir(format('%n', [vvlnotreqE]), 12));
//  vlult := linha+1;
//  linha := vlcreditos;
//  buscas.close;
//  buscas.sql.text:='SELECT cx.nome_ctrl,'+//cx.nat_ctrl,' +
//    ' case when cx.nao_gera_finan = ''S'' then ''Z''' +
//    '   when cx.baixa_automatica = ''S'' then ''Z''' +
//    '   when cx.nat_ctrl = ''A'' then ''A''' +
//    '   else ''P''' +
//    ' end nat_ctrl,' +
//    ' case when cx.nao_gera_finan = ''S'' then 3' +
//    '   when cx.baixa_automatica = ''S'' then 2' +
//    '   when cx.nat_ctrl = ''A'' then 0' +
//    '   else 1' +
//    ' end tp1,' +
//    ' sum(fp.valordoc) as valor '+
//  'FROM FORMPAGAMENTO fp,Controles cx  WHERE '+
//  '(fp.DATA_MOV = '''+FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+''') AND '+
//  'fp.op_cxl = '+inttostr(vDadosIni.vCodOpCxl)+
//  ' and fp.cod_controle = cx.codigo_ctrl and fp.cod_empresa = cx.codigo_emp and '+
//  'fp.cod_empresa = '+vDadosIni.codEmpresa+' AND FP.ATIVO = 1 '+
//  ' group by 1,2,3'+
//  ' order by 2,3,1';
//  buscas.open;
//  vtip :=buscas.FieldByName('nat_ctrl').AsString;
//  vvlnotreq := 0;
//  while not buscas.eof do
//  begin
//    //if pos('VALE',dtmc.QrDetResumonome_ctrl.value) = 0 then
//    //begin
//    tp1 := vDadosIni.Replicate('*', buscas.FieldByName('tp1').AsInteger - 1);
//    if vtip <> buscas.FieldByName('nat_ctrl').AsString then
//    begin
//      if vtip = 'A' then
//        RdREsumo.imp(linha, 42, 'Total a Vista          : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
//      else if vtip = 'Z' then
//        RdREsumo.imp(linha, 42, 'Total Outros           : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
//      else
//        RdREsumo.imp(linha, 42, 'Total a Prazo          : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
//      vtip := buscas.FieldByName('nat_ctrl').asstring;
//      vvlnotreq := 0;
//      linha := linha + 2;
//      RdREsumo.imp(linha, 42, copy( tp1 + buscas.FieldByName('nome_ctrl').value, 1, 23));
//      RdREsumo.imp(linha, 65, ': ' + vdadosini.alndir(format('%n', [buscas.fieldbyname('valor').ascurrency]), 12));
//      linha := linha + 1;
//      vvlnotreq := vvlnotreq + buscas.fieldbyname('valor').ascurrency;
//    end
//    else
//    begin
//      RdREsumo.imp(linha, 42, copy( tp1 + buscas.FieldByName('nome_ctrl').value, 1, 23));
//      RdREsumo.imp(linha, 65, ': ' +vDadosIni.alndir(format('%n', [buscas.fieldbyname('valor').ascurrency]), 12));
//      linha := linha + 1;
//      vvlnotreq := vvlnotreq + buscas.fieldbyname('valor').ascurrency;
//    end;
//    //end;
//    buscas.next;
//    if buscas.eof then
//    begin
//      if vtip = 'A' then
//        RdREsumo.imp(linha, 42, 'Total a Vista          : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
//      else if vtip = 'Z' then
//        RdREsumo.imp(linha, 42, 'Total Outros           : ' + vDadosIni.AlnDir(format('%n', [vvlnotreq]), 12))
//      else
//        RdREsumo.imp(linha, 42, 'Total a Prazo          : ' + vdadosini.alndir(format('%n', [vvlnotreq]), 12));
//      vtip :=buscas.FieldByName('nat_ctrl').AsString;
//      vvlnotreq := 0;
//      linha := linha + 2;
//    end;
//    
//    if linha >= 62 then
//    begin
//      linha := 1;
//      RdREsumo.Novapagina;
//      cadresumo(RdResumo);
//      CabLanc(RdResumo);
//    end;
//  end;
//  if linha < vlult then
//   linha := vlult + 2;
  RdREsumo.imp(linha, 1, vdadosini.replicate('-', 79));
  CabLanc(RdResumo);

  //---------recibos atencipados e devoluçoes
  buscas.close;
  buscas.sql.text := ' select * from lanccxl ' +
  	' where data_lc_cxl = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)) +
    ' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) + ' and codigo_emp = '+vDadosIni.codEmpresa +
    ' and refrecibo = ''S'' ';
  buscas.open;
  ALancClxReciboE := 0;
  ALancClxReciboS := 0;
  if not buscas.IsEmpty then
  begin
    while not buscas.eof do
    begin
      RdREsumo.imp(linha, 1, copy(buscas.FieldByName('HISTORICO_CXL').value, 1, 38));
      RdREsumo.imp(linha, 40, vdadosini.alndir(format('%n', [buscas.FieldByName('VALOR_CXL').ascurrency]), 12));
      RdREsumo.imp(linha, 54, buscas.FieldByName('TIPO_LANC_CXL').value);
      RdREsumo.imp(linha, 59, vdadosini.alndir(format('%n', [buscas.FieldByName('N_CONTA_PLC').ascurrency]), 6));
      if buscas.FieldByName('TIPO_LANC_CXL').value = 'E' then
        ALancClxReciboE := ALancClxReciboE + buscas.FieldByName('VALOR_CXL').ascurrency
      else
        ALancClxReciboS := ALancClxReciboS + buscas.FieldByName('VALOR_CXL').ascurrency;
      linha := linha + 1;
      if linha >= 62 then begin linha := 1; RdREsumo.Novapagina; cadresumo(RdResumo); CabLanc(RdResumo); end;
      buscas.next;
    end;
    if linha >= 62 then begin linha := 1; RdREsumo.Novapagina; cadresumo(RdResumo); CabLanc(RdResumo); end;
    RdREsumo.ImpF(linha, 1, '--Recibos Antec. e Vale Compra(s)......' +
      vDadosIni.Right(vDadosIni.Replicate('.', 12) + Format('%0.2n', [ ALancClxReciboE - ALancClxReciboS ]), 12), [negrito]);
    linha := linha + 2;
  end;
  //---------recibos atencipados e devoluçoes

  //---------lancamentos do caixa auxliar
  buscas.close;
  buscas.sql.text := ' select * from lanccxl ' +
  	' where data_lc_cxl = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and codigo_emp = ' + vDadosIni.codEmpresa +
    ' and refrecibo is null and coalesce(tr, ''N'') = ''N'' ';
  buscas.open;
  ALancCxlE:= 0;
  ALancCxlS := 0;
  while not buscas.eof do
  begin
    RdREsumo.imp(linha, 1, copy(buscas.FieldByName('HISTORICO_CXL').value, 1, 38));
    RdREsumo.imp(linha, 40, vdadosini.alndir(format('%n', [buscas.FieldByName('VALOR_CXL').ascurrency]), 12));
    RdREsumo.imp(linha, 54, buscas.FieldByName('TIPO_LANC_CXL').value);
    RdREsumo.imp(linha, 59, vdadosini.alndir(format('%n', [buscas.FieldByName('N_CONTA_PLC').ascurrency]), 6));
    if buscas.FieldByName('TIPO_LANC_CXL').value = 'E' then
      ALancCxlE := ALancCxlE + buscas.FieldByName('VALOR_CXL').ascurrency
    else
      ALancCxlS := ALancCxlS + buscas.FieldByName('VALOR_CXL').ascurrency;
    linha := linha + 1;
    if linha >= 62 then begin linha := 1; RdREsumo.Novapagina; cadresumo(RdResumo); CabLanc(RdResumo); end;
    buscas.next;
  end;
  if (ALancCxlE > 0) or (ALancCxlS > 0) then
  begin
    if linha >= 62 then begin linha := 1; RdREsumo.Novapagina; cadresumo(RdResumo); CabLanc(RdResumo); end;
//    RdREsumo.ImpF(linha, 1, '--Recibos Antec. e Vale Compra(s)......' + Format('%11.2n', [ ALancClxReciboE - ALancClxReciboS ]), [negrito]);
//    RdREsumo.ImpF(linha, 1, '--Recibos Antec. e Vale Compra(s)......' +
//      vDadosIni.Right(vDadosIni.Replicate(Format('%0.2n', [ ALancClxReciboE - ALancClxReciboS ]), 12), 12, [negrito]);
    RdREsumo.ImpF(linha, 1, '--Lançamentos do Caixa Auxiliar........' +
      vDadosIni.Right(vDadosIni.Replicate('.', 12) + Format('%0.2n', [ ALancCxlE - ALancCxlS ]), 12), [negrito]);
    linha := linha + 2;
  end;
  //---------lancamentos do caixa auxliar


  //---------lancamentos do caixa auxliar troco
  buscas.close;
  buscas.sql.text := ' select * from lanccxl ' +
  	' where data_lc_cxl = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and codigo_emp = ' + vDadosIni.codEmpresa +
    ' and coalesce(tr, ''N'') = ''S'' ';
  buscas.open;
  ALancCxlTroco := 0;
  while not buscas.eof do
  begin
    RdREsumo.imp(linha, 1, copy(buscas.FieldByName('HISTORICO_CXL').value, 1, 38));
    RdREsumo.imp(linha, 40, vdadosini.alndir(format('%n', [buscas.FieldByName('VALOR_CXL').ascurrency]), 12));
    RdREsumo.imp(linha, 54, buscas.FieldByName('TIPO_LANC_CXL').value);
    RdREsumo.imp(linha, 59, vdadosini.alndir(format('%n', [buscas.FieldByName('N_CONTA_PLC').ascurrency]), 6));
//    if buscas.FieldByName('TIPO_LANC_CXL').value = 'E' then
//      vvlnotreqE := vvlnotreqE + buscas.FieldByName('VALOR_CXL').ascurrency
//    else
      ALancCxlTroco := ALancCxlTroco + buscas.FieldByName('VALOR_CXL').ascurrency;
    linha := linha + 1;
    if linha >= 62 then begin linha := 1; RdREsumo.Novapagina; cadresumo(RdResumo); CabLanc(RdResumo); end;
    buscas.next;
  end;
  if (ALancCxlTroco > 0) then
  begin
    if linha >= 62 then begin linha := 1; RdREsumo.Novapagina; cadresumo(RdResumo); CabLanc(RdResumo); end;
//    RdREsumo.ImpF(linha, 1, '--Recibos Antec. e Vale Compra(s)......' + Format('%11.2n', [ ALancClxReciboE - ALancClxReciboS ]), [negrito]);
//    RdREsumo.ImpF(linha, 1, '--Recibos Antec. e Vale Compra(s)......' +
//      vDadosIni.Right(vDadosIni.Replicate(Format('%0.2n', [ ALancClxReciboE - ALancClxReciboS ]), 12), 12, [negrito]);
    RdREsumo.ImpF(linha, 1, '--Lançamentos de Troco.................' +
      vDadosIni.Right(vDadosIni.Replicate('.', 12) + Format('%0.2n', [ ALancCxlTroco ]), 12), [negrito]);
    linha := linha + 1;
  end;
  //---------lancamentos do caixa auxliar troco


  linha := linha + 1;


  if linha >= 62 then
  begin
    linha := 1;
    RdREsumo.Novapagina;
    cadresumo(RdResumo);
    CabLanc(RdResumo);
  end;
  RdREsumo.imp(linha, 1, 'Total das Entrada : ' + vdadosini.alndir(format('%n',
  	[ALancClxReciboE + ALancCxlE]), 12));
  linha := linha + 1;
  if linha >= 62 then
  begin
    linha := 1;
    RdREsumo.Novapagina;
    cadresumo(RdResumo);
    CabLanc(RdResumo);
  end;
  RdREsumo.imp(linha, 1, 'Total das Saidas  : ' + vdadosini.alndir(format('%n',
  	[ALancClxReciboS + ALancCxlS + ALancCxlTroco]), 12));
  linha := linha + 1;
  if linha >= 62 then
  begin
    linha := 1;
    RdREsumo.Novapagina;
    cadresumo(RdResumo);
    CabLanc(RdResumo);
  end;
  RdREsumo.imp(linha, 1, 'Saldo             : ' + vdadosini.alndir(format('%n',
  	[ALancClxReciboE + ALancCxlE
    - (ALancClxReciboS + ALancCxlS + ALancCxlTroco)]), 12));
  linha := linha + 1;
  RdREsumo.imp(linha, 1, vdadosini.replicate('-', 79));
  RdREsumo.Fechar;
end;

function TFecdCXL.montaarqCXL: boolean;
begin
 Result:=true;
end;

procedure TFecdCXL.pegainfrecpre;
begin
//  Close;
//  Open;
  vlVnd := 0;
  vsrec := 0;
  vlrec := 0;
  qtdvnd := 0;
{  buscas.Close;
  buscas.SQL.Text := 'select *  from CONTROLE_CREDITOS where ' +
    'dia_cxl = ' + chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' and codigo_emp = ' +
    vDadosIni.codEmpresa;
    ///+ ' AND ATIVO = 1 ';
  buscas.open;
  while not buscas.Eof do
  begin
    if (buscas.FieldByName('VL_RQ_PG_CXL').IsNull) or (buscas.FieldByName('VL_RQ_PG_CXL').value = 0)
      then
      vsrec := vsrec + buscas.FieldByName('VALOR_CORR').AsCurrency;
    buscas.next;
  end;}
  buscas.Close;
  buscas.SQL.Text := ' select sum(coalesce(VL_RQ_PG_CXL, 0)) valor, count(*) qtde from CONTROLE_CREDITOS ' +
  	' where dia_cxl = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) +
    ' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) +
    ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = ' + vDadosIni.codEmpresa +
    ' union all ' +
    ' select sum(coalesce(VL_RQ_PG_CXL, 0)) valor, count(*) qtde from BAIXA_CREDITOS ' +
    ' where dia_cxl = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) +
		' and op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) +
		' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = ' + vDadosIni.codEmpresa +
		' and tp_operacao = ''P'' ';
  buscas.open;

  buscas.First;
  while not buscas.Eof do
  begin
  	vlVnd := vlVnd + buscas.FieldByName('valor').AsCurrency;
  	qtdvnd := qtdvnd + buscas.FieldByName('qtde').AsInteger;

    buscas.Next;
  end;
end;

function TFecdCXL.reabredia: boolean;
begin
 result:=true;
 if ultdiaCXL then
 begin
   Close;
   Open;
   result:=false;
   exit
 end;
 if vDadosIni.diaAbertoCxl <> dataSet.FieldByName('DIA_F_CXL').value then
 begin
  Application.MessageBox(pchar('Dia do Caixa selecionado não é o dia aberto'),
  'Atenção',MB_ICONEXCLAMATION + MB_OK);
  result:=false;
  exit;
 end;
 buscas.close;
 buscas.sql.text:='SELECT count(*) as qtde FROM formpagamento where data_mov = '+
 chr(39) + FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl) + chr(39) +
 ' and prcss = ''S'' and ativo = 1 and cod_empresa = '+vDadosIni.codEmpresa+' and op_cxl = '+
 inttostr(vDadosIni.vcodopcxl);
 buscas.open;
 if buscas.FieldByName('qtde').AsInteger > 0 then
 begin
  Application.MessageBox(pchar('Dia do Caixa já processado pelo Financeiro'),
  'Atenção',MB_ICONEXCLAMATION + MB_OK);
  result:=false;
 end
 else
 begin
  if Application.MessageBox('Tem certeza que deseja reabrir o Dia selecionado?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
   buscas.close;
   exit;
  end;
  IniciaTransacao;
  try
   buscas.close;
   buscas.sql.text:='delete from fecd_cxl where n_mov_cxl = '+
   dataSet.FieldByName('N_MOV_CXL').asstring+' and dia_f_cxl = '+
   chr(39) + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + chr(39) +
   ' and codigo_emp = '+vDadosIni.codEmpresa;
   buscas.Prepare;
   buscas.ExecSQL;

   buscas.close;
   buscas.sql.text:='update fecd_cxl set status_cxl = null where n_mov_cxl = '+
   inttostr(dataSet.FieldByName('N_MOV_CXL').asinteger-1)+' and dia_f_cxl = '+
   chr(39) + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime-1) + chr(39) +
   ' and codigo_emp = '+vDadosIni.codEmpresa;
   buscas.Prepare;
   buscas.ExecSQL;
   CommitaTransacao;
   DiaAberto;
   vDadosIni.diaFCxl:=vDadosIni.diaAbertoCxl;
   result:=true;
  except
      on e: exception do
      begin
        RollBackTransacao;
        result := false;
        Application.MessageBox(pchar('Erro na Gravação: '+
        e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
        registraErro('Erro CXL: ' + e.Message);
      end;
  end;
 end;
end;

procedure TFecdCXL.reldetResumo(RdRelCxl: Trdprint);
var
  vtote, vtots, vtotr, vtoto, vtotec, vtotccv, vtotmt,vtotpre,vtotrec, vtotlancavulso, vtotjuros, vtottroco, vtottempprest, vtottempformas, vtotal: currency;
  vdet: integer;
  vtp1: string;
  vListaLotePrest: TStringList;
  vListaFormasPrest: TStringList;
  I: Integer;
begin
	vPosDtMov := 1;
  vPosTipo := 14;
  vPosNDoc := 21;
  vPosValor := 39;
  vPosHistorico := 45;
  vPosControle := 45;
  vPosValorRec := 110;

  vtote := 0.00;
  vtots := 0.00;
  vtotr := 0.00;
  vtoto := 0.00;
  vtotec := 0.00;
  vtotccv := 0.00;
  vtotmt := 0.00;
  vtotlancavulso := 0.00;
  vtotpre:= 0.00;
  vtotrec:= 0.00;
  vtotjuros := 0.00;
  vtottroco := 0.00;
  vtottempprest := 0.00;
  vtottempformas := 0.00;
  
  vpag := 0;
  vdet:=0;

  vListaLotePrest := TStringList.Create;
  vListaLotePrest.Clear;

  vListaFormasPrest := TStringList.Create;
  vListaFormasPrest.Clear;
  
  if Application.MessageBox(
      'Deseja Detalhado?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      vdet:=1;

    linha:=1;
    RdRelCxl.OpcoesPreview.CaptionPreview := 'Relatório Movimento Diário';
    RdRelCxl.TitulodoRelatorio := 'Relatório Resumo Movimento Diário';
    vDadosIni._LimparVarSendEmail;
    RdRelCxl.OnSendMail := vDadosini._SendMailRdPrint;

    if not vDadosIni.ModImp(RdRelCxl) then
      exit;
    RdRelCxl.Abrir;
    cabrelcxl(RdRelCxl, vdet = 1);

    buscas.close;
    buscas.sql.text:=' select pd.nped, pd.tipo, pd.cod_empresa, ' +
    	' sum(coalesce(fp.juros, 0)) juros from pedvenda pd ' +
      ' left join existe_formas(pd.nped, pd.tipo, pd.cod_empresa) fp on 1 = 1 ' +
      ' left join lanccxl cxl on cxl.n_doc_cxl = pd.nped and cxl.tipo_doc_cxl = pd.tipo and cxl.codigo_emp = pd.cod_empresa and cxl.tr = ''S'' ' +
      ' where pd.tipo = ''REQ'' ' +
      ' and pd.dia_cxl = :dia_cxl ' +
      ' and pd.op_cxl = :op_cxl ' +
      ' and pd.cod_empresa = :cod_empresa ' +
      ' group by 1, 2, 3 ' +
      ' union all ' +
      ' select pd.nped, pd.tipo, pd.cod_empresa, ' +
      ' sum(coalesce(fp.juros, 0)) juros from pedvenda pd ' +
      ' left join existe_formas(pd.nped, pd.tipo, pd.cod_empresa) fp on 1 = 1 ' +
      ' left join lanccxl cxl on cxl.n_doc_cxl = pd.nped and cxl.tipo_doc_cxl = pd.tipo and cxl.codigo_emp = pd.cod_empresa and cxl.tr = ''S'' ' +
      ' where pd.tipo = ''OS'' ' +
      ' and pd.dia_cxl = :dia_cxl ' +
      ' and pd.op_cxl = :op_cxl ' +
      ' and pd.cod_empresa = :cod_empresa ' +
      ' group by 1, 2, 3 ' +
      ' union all ' +
      ' select cf.n_comando, ''MOT'', cf.cod_empresa, ' +
      ' sum(coalesce(fp.juros, 0)) juros from com_fat cf ' +
      ' left join existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa) fp on 1 = 1 ' +
      ' left join lanccxl cxl on cxl.n_doc_cxl = cf.n_comando and cxl.tipo_doc_cxl = ''MOT'' and cxl.codigo_emp = cf.cod_empresa and cxl.tr = ''S'' ' +
      ' where cf.dia_cxl = :dia_cxl ' +
      ' and cf.op_cxl = :op_cxl ' +
      ' and cf.cod_empresa = :cod_empresa ' +
      ' group by 1, 2, 3 ' +
      ' union all ' +
      ' select ctr.cod_cred, ''PRE'', ctr.codigo_emp, ' +
      ' sum(coalesce(fp.juros, 0)) juros from controle_creditos ctr ' +
      ' left join existe_formas(ctr.lote_cxl, ''PRE'', ctr.codigo_emp) fp on 1 = 1 ' +
      ' left join lanccxl cxl on cxl.n_doc_cxl = ctr.lote_cxl and cxl.tipo_doc_cxl = ''PRE'' and cxl.codigo_emp = ctr.codigo_emp and cxl.tr = ''S'' ' +
      ' where ctr.dia_cxl = :dia_cxl ' +
      ' and ctr.op_cxl = :op_cxl ' +
      ' and ctr.codigo_emp = :cod_empresa ' +
//      ' and ctr.tip_baixa is null and ctr.status_c is null and ctr.datq_c is null ' +
      ' group by 1, 2, 3 ' +
      ' union all ' +
      ' select bx.cod_cred, ''PRE'', bx.codigo_emp, ' +
      ' sum(coalesce(fp.juros, 0)) juros from baixa_creditos bx ' +
      ' left join existe_formas(bx.lote_cxl, ''PRE'', bx.codigo_emp) fp on 1 = 1 ' +
      ' left join lanccxl cxl on cxl.n_doc_cxl = bx.lote_cxl and cxl.tipo_doc_cxl = ''PRE'' and cxl.codigo_emp = bx.codigo_emp and cxl.tr = ''S'' ' +
      ' where bx.dia_cxl = :dia_cxl ' +
      ' and bx.op_cxl = :op_cxl ' +
      ' and bx.codigo_emp = :cod_empresa ' +
      ' and bx.tp_operacao = ''P'' ' +
//      ' and bx.datq_c is not null ' +
      ' group by 1, 2, 3 ';
		buscas.ParamByName('dia_cxl').AsDateTime := dataSet.FieldByName('DIA_F_CXL').AsDateTime;
    buscas.ParamByName('op_cxl').AsInteger := vDadosIni.vCodOpCxl;
    buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.eof do
    begin
      vtotjuros := vtotjuros + buscas.FieldByName('juros').AsFloat;
      buscas.Next;
    end;

    buscas.close;
    buscas.sql.text := ' select rq.tipo, coalesce(rq.nped, 0) as Num_doc,rq.id_commerce,' +
    	' rq.data_ped as data_doc,rq.data_fech as data_Conf,rq.valor_total,rq.obs_cxl_rq,rq.nped as loterec,rq.cod_empresa,' +
      ' case when tv.venda = ''N'' then ''*'' else '' '' end subtipo' +
      ' from pedvenda rq ' +
      ' inner join tipo_vendas tv on tv.tipo = rq.tipo' +
      ' and (((tv.sigla = rq.tipv) and (tv.tipo = ''REQ'')) or ((tv.tipo_os = rq.tipo_os) and (tv.tipo = ''OS'')))' +
      ' where dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
      ' and rq.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
      ' and rq.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and rq.ativo = 1 ' +
      ' union ' +
      ' select ''MOT'' as tipo, coalesce(mt.n_comando, 0) as Num_doc,0 id_commerce,'  +
      ' mt.data_ven as Data_Doc,mt.data_ven as Data_Conf,mt.valor_a_rec as Valor_a_Receber,'+
      '''                                                  '' as obs_cxl_rq,mt.n_comando as loterec,mt.cod_empresa, '' '' subtipo from com_fat mt ' +
      ' where dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
      ' and mt.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and mt.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
      ' union ' +
      ' select ''PRE'' as tipo, 0 Num_doc, 0 id_commerce, ' + //coalesce(pr.cod_cred, 0) Num_doc, 0 id_commerce,' +
      ' null Data_Doc, null Data_Conf, 0 Valor_a_Receber, ' + //coalesce(vl_rq_pg_cxl, 0) Valor_a_Receber,' +
      '''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec, ' +
      ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
      ' '' '' subtipo from controle_creditos pr ' +
      ' where pr.dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
      ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
      ' = ' + vDadosIni.codEmpresa +
      ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
      ' union ' +
      ' select ''PRE'' as tipo, 0 Num_doc, 0 id_commerce, ' + //coalesce(pr.cod_cred, 0) as Num_doc, 0 id_commerce,' +
      ' null Data_Doc, null Data_Conf, 0 Valor_a_Receber, ' + //coalesce(vl_rq_pg_cxl, 0) Valor_a_Receber,' +
      '''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec,' +
      ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
      ' '' '' subtipo from baixa_creditos pr ' +
      ' where pr.dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
      ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
      ' = ' + vDadosIni.codEmpresa +
      ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
      ' and pr.tp_operacao = ''P'' ';

//       buscasGeral.close;
//       buscasGeral.sql.text := ' select count(*) as qtde FROM formpagamento ' +
//       	 ' where data_mov = ' + chr(39) + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + chr(39) +
//         ' and prcss = ''S'' ' +
//         ' and ativo = 1 ' +
//         ' and cod_empresa = ' + vDadosIni.codEmpresa +
//         ' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
//       buscasGeral.open;
//       buscasGeral.FetchAll;
//
//       if buscasGeral.FieldByName('qtde').AsInteger > 0 then
//       begin
//         buscas.sql.text := buscas.sql.text +
//         	' select distinct ''PRE'' as tipo, '' '' as Num_doc, 0 id_commerce,' +
//          ' null Data_Doc, null Data_Conf, 0 Valor_a_Receber,'+
//         	'''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec,' +
//          ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
//          ' '' '' subtipo from baixa_creditos pr ' +
//         	' where pr.dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
//          ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
//          ' = ' + vDadosIni.codEmpresa +
//          ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
//
////         buscas.sql.text := buscas.sql.text +
////         	'select ''PRE'' as tipo, coalesce(pr.n_doc_v, 0) as Num_doc,0 id_commerce,' +
////          ' pr.data_venc_c as Data_Doc,pr.data_rec_c as Data_Conf,pr.VL_RQ_PG_CXL as Valor_a_Receber,'+
////         	'''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec,' +
////          ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
////          ' '' '' subtipo from baixa_creditos pr ' +
////         	' where pr.dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+ ''' ' +
////          ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
////          ' = ' + vDadosIni.codEmpresa +
////          ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
//       end
//       else
//       begin
//         buscas.sql.text := buscas.sql.text +
//          ' select distinct ''PRE'' as tipo, '' '' Num_doc, 0 id_commerce,' +
//          ' null Data_Doc, null Data_Conf, 0 Valor_a_Receber,'+
//          '''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec, ' +
//          ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
//          ' '' '' subtipo from controle_creditos pr ' +
//          ' where pr.dia_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + ''' ' +
//          ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
//          ' = ' + vDadosIni.codEmpresa +
//          ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
//
////         buscas.sql.text := buscas.sql.text +
////          'select ''PRE'' as tipo, coalesce(pr.n_doc_v, 0) as Num_doc,pr.data_venc_c as Data_Doc,pr.data_rec_c as Data_Conf,pr.VL_RQ_PG_CXL as Valor_a_Receber,'+
////          '''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec, ' +
////          ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
////          ' '' '' subtipo from controle_creditos pr ' +
////          ' where pr.dia_cxl = '''+FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+ ''' ' +
////          ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
////          ' = ' + vDadosIni.codEmpresa +
////          ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
//       end;

      if vDadosIni.vRecibo.HabRecPorDepart then
      begin
        buscas.sql.text := buscas.sql.text +
         ' union '+
  	   	 ' select ''REC'' as tipo, ' +
         ' case when (trim(coalesce(pr.num_rec_dep, '''')) <> '''') then pr.num_rec_dep else coalesce(pr.nrecibo, 0) end Num_doc, ' +
         ' 0 id_commerce, ' +
         ' pr.data_rec as Data_Doc,pr.data_rec as Data_Conf,pr.valor_orig as Valor_a_Receber,'+
      	 '''                                                  '' as obs_cxl_rq,pr.nrecibo as loterec,pr.cod_empresa, '' '' subtipo from recibos pr ' +
       	 ' where pr.dia_cxl = '''+FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+''' ' +
         ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
         ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
      end
      else
      begin
	      buscas.sql.text := buscas.sql.text +
         ' union '+
  	   	 ' select ''REC'' as tipo, ' +
         ' coalesce(pr.nrecibo, 0) as Num_doc,' +
         ' 0 id_commerce,' +
         ' pr.data_rec as Data_Doc,pr.data_rec as Data_Conf,pr.valor_orig as Valor_a_Receber,'+
      	 '''                                                  '' as obs_cxl_rq,pr.nrecibo as loterec,pr.cod_empresa, '' '' subtipo from recibos pr ' +
       	 ' where pr.dia_cxl = '''+FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+''' ' +
         ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
         ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
      end;

    buscas.open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.eof do
    begin
    	if trim(buscas.FieldByName('tipo').AsString) = 'PRE' then
      begin
      	buscasGeral.close;
        buscasGeral.sql.text := ' select count(*) as qtde FROM formpagamento ' +
          ' where data_mov = '+ chr(39) + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime) + chr(39) +
          ' and prcss = ''S'' ' +
          ' and ativo = 1 ' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and op_cxl = '+ inttostr(vDadosIni.vCodOpCxl);
        buscasGeral.open;
        buscasGeral.FetchAll;
        if buscasGeral.FieldByName('qtde').AsInteger > 0 then
       	begin
          buscasGeral.Close;
          buscasGeral.sql.text :=
          	'select ''PRE'' as tipo, coalesce(pr.n_doc_v, 0) as Num_doc, pr.data_venc_c as Data_Doc, pr.data_rec_c as Data_Conf, pr.VL_RQ_PG_CXL as valor_total,'+
            '''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec, ' +
            ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
            ' '' '' subtipo from controle_creditos pr ' +
            ' where pr.lote_cxl = ' + IntToStr(buscas.FieldByName('loterec').AsInteger) +
            ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
            ' = ' + vDadosIni.codEmpresa +
            ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
            ' union ' +
            ' select ''PRE'' as tipo, coalesce(pr.n_doc_v, 0) as Num_doc,pr.data_venc_c as Data_Doc,pr.data_rec_c as Data_Conf,pr.VL_RQ_PG_CXL as valor_total,'+
            '''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec,' +
            ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
            ' '' '' subtipo from baixa_creditos pr ' +
            ' where pr.lote_cxl = ' + IntToStr(buscas.FieldByName('loterec').AsInteger) +
            ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
            ' = ' + vDadosIni.codEmpresa +
            ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
            ' and pr.tp_operacao = ''P'' ';
          buscasGeral.Open;
          buscasGeral.FetchAll;
        end
        else
        begin
        	buscasGeral.Close;
        	buscasGeral.sql.text :=
            'select ''PRE'' as tipo, coalesce(pr.n_doc_v, 0) as Num_doc, pr.data_venc_c as Data_Doc, pr.data_rec_c as Data_Conf, pr.VL_RQ_PG_CXL as valor_total,'+
            '''                                                  '' as obs_cxl_rq,pr.lote_cxl as loterec, ' +
            ' pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ', ' +
            ' '' '' subtipo from controle_creditos pr ' +
            ' where pr.lote_cxl = ' + IntToStr(buscas.FieldByName('loterec').AsInteger) +
            ' and pr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
            ' = ' + vDadosIni.codEmpresa +
            ' and pr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl);
          buscasGeral.Open;
          buscasGeral.FetchAll;
        end;

        vListaLotePrest.Clear;
        vListaFormasPrest.Clear;

        vtottempprest := 0.00;

        buscasGeral.First;
        while not buscasGeral.Eof do
        begin
        	vtottempprest := vtottempprest + buscasGeral.FieldByName('valor_total').ascurrency;

        	vListaLotePrest.Add(PadR(datetostr(dataSet.FieldByName('DIA_F_CXL').AsDateTime), vPosTipo - 1) +
          	PadR(buscasGeral.FieldByName('tipo').AsString + Trim(buscasGeral.FieldByName('subtipo').AsString), vPosNDoc - vPosTipo) +
//            vDadosIni.IfThen((buscasGeral.FieldByName('num_doc').AsString <> vDadosIni.apenasNumeros(buscasGeral.FieldByName('num_doc').AsString)),
//	            buscasGeral.FieldByName('num_doc').AsString,
//              vDadosIni.strzero(buscasGeral.FieldByName('num_doc').AsInteger, 5)) + ' ' +
        	  vDadosIni.strzero(buscasGeral.FieldByName('num_doc').AsInteger, 6) + ' ' +
            vDadosIni.AlnDir(format('%n', [buscasGeral.FieldByName('valor_total').ascurrency]), 12) +
            buscasGeral.FieldByName('obs_cxl_rq').AsString);

          vtote := vtote + buscasGeral.FieldByName('VALOR_TOTAL').ascurrency;
          if trim(buscasGeral.FieldByName('tipo').AsString) = 'REQ' then
            vtotr := vtotr + buscasGeral.FieldByName('VALOR_TOTAL').ascurrency
          else if trim(buscasGeral.FieldByName('tipo').AsString) = 'OS' then
            vtoto := vtoto + buscasGeral.FieldByName('VALOR_TOTAL').ascurrency
          else if trim(buscasGeral.FieldByName('tipo').AsString) = 'MOT' then
            vtotmt:= vtotmt + buscasGeral.FieldByName('VALOR_TOTAL').ascurrency
          else if trim(buscasGeral.FieldByName('tipo').AsString) = 'PRE' then
            vtotpre:= vtotpre+ buscasGeral.FieldByName('VALOR_TOTAL').ascurrency
          else if trim(buscasGeral.FieldByName('tipo').AsString) = 'REC' then
            vtotrec:= vtotrec + buscasGeral.FieldByName('VALOR_TOTAL').ascurrency;

          buscasGeral.Next;
        end;

        if buscasGeral.RecordCount > 1 then
        begin
          vListaLotePrest.Add(PadR('SOMA', vPosTipo - 1) +
          	PadR('', vPosNDoc - vPosTipo) +
            PadR('', 6) + ' ' +
            vDadosIni.AlnDir(format('%n', [vtottempprest]), 12) +
            buscasGeral.FieldByName('obs_cxl_rq').AsString);
        end;


        for I := 0 to vListaLotePrest.Count - 1 do
        begin
        	if I <= vListaLotePrest.Count - 1 then
          begin
	        	RdRelCxl.Imp(linha, 1, vListaLotePrest[I]);

            if linha >= 59 then
            begin
              linha := 1;
              RdRelCxl.Novapagina;
              cabrelcxl(RdRelCxl, vdet = 1);
            end;

            linha := linha + 1;
          end;
        end;
      end
      else
      begin
      	if linha >= 65 then
        begin
          linha := 1;
          RdRelCxl.Novapagina;
          cabrelcxl(RdRelCxl, vdet = 1);
        end;

        RdRelCxl.Imp(linha, vPosDtMov, datetostr(dataSet.FieldByName('DIA_F_CXL').AsDateTime));
        RdRelCxl.Imp(linha, vPosTipo,buscas.FieldByName('tipo').AsString + Trim(buscas.FieldByName('subtipo').AsString));
//        if (buscas.FieldByName('num_doc').AsString <> vDadosIni.apenasNumeros(buscas.FieldByName('num_doc').AsString)) then
//          RdRelCxl.Imp(linha, vPosNDoc, buscas.FieldByName('num_doc').AsString)
//        else
//          RdRelCxl.Imp(linha, vPosNDoc,vDadosIni.strzero(buscas.FieldByName('num_doc').AsInteger, 5));
      	RdRelCxl.Imp(linha, vPosNDoc,vDadosIni.strzero(buscas.FieldByName('num_doc').AsInteger, 6));
        RdRelCxl.ImpD(linha, vPosValor, vDadosIni.AlnDir(format('%n', [buscas.FieldByName('VALOR_TOTAL').ascurrency]), 12), [comp17]);
        RdRelCxl.ImpF(linha, vPosHistorico, buscas.FieldByName('OBS_CXL_RQ').AsString, [comp17]);
        linha := linha + 1;
        vtote := vtote + buscas.FieldByName('VALOR_TOTAL').ascurrency;
        if buscas.FieldByName('id_commerce').AsInteger > 0 then
        	vtotec := vtotec + buscas.FieldByName('VALOR_TOTAL').ascurrency
        else if trim(buscas.FieldByName('tipo').AsString) = 'REQ' then
          vtotr := vtotr + buscas.FieldByName('VALOR_TOTAL').ascurrency
        else if trim(buscas.FieldByName('tipo').AsString) = 'OS' then
          vtoto := vtoto + buscas.FieldByName('VALOR_TOTAL').ascurrency
        else if trim(buscas.FieldByName('tipo').AsString) = 'MOT' then
          vtotmt:= vtotmt + buscas.FieldByName('VALOR_TOTAL').ascurrency
        else if trim(buscas.FieldByName('tipo').AsString) = 'PRE' then
          vtotpre:= vtotpre+ buscas.FieldByName('VALOR_TOTAL').ascurrency
        else if trim(buscas.FieldByName('tipo').AsString) = 'REC' then
          vtotrec:= vtotrec+ buscas.FieldByName('VALOR_TOTAL').ascurrency;
      end;

      if vdet = 1 then
      begin
        buscasGeral.close;
        buscasGeral.sql.text := ' select fp.data_mov, fp.tpdocs, fp.nrequisicao, fp.ndoc, fp.cliente, ' +
          ' fp.historico, fp.valordoc, fp.data_venc, fp.terceiros, fp.cod_controle, ' +
          ' case when (fp.recibo is not null) then ' +
          '        ''RECIBO ANTECIPADO'' ' +
          '      else ' +
          '        ctrl.NOME_CTRL ' +
          ' end NOME_CTRL, ' +
          ' case when ctrl.nao_gera_finan = ''S'' then 2 ' +
          '   	 when ctrl.baixa_automatica = ''S'' then 1 ' +
          '   	 else 0 ' +
          ' end tp1 ' +
          ' from FORMPAGAMENTO fp ' +
          ' inner join CONTROLES ctrl on fp.cod_controle = ctrl.codigo_ctrl and fp.cod_empresa = ctrl.codigo_emp ' +
          ' where fp.NREQUISICAO = ' + IntToStr(buscas.FieldByName('LOTEREC').AsInteger) +
          ' and fp.TPDOCS = ' + QuotedStr(buscas.FieldByName('TIPO').AsString) +
          ' and fp.COD_EMPRESA = ' + IntToStr(buscas.FieldByName('COD_EMPRESA').AsInteger) +
          ' and fp.ATIVO = 1 ';
        buscasGeral.open;
        buscasGeral.FetchAll;
        buscasGeral.First;

        vtottempformas := 0.00;

        if buscasGeral.eof then
          linha := linha + 1;
        while not buscasGeral.eof do
        begin
        	vtottempformas := vtottempformas + buscasGeral.FieldByName('valordoc').ascurrency;
          vtp1 := vDadosIni.Replicate('*', buscasGeral.FieldByName('tp1').AsInteger);
          RdRelCxl.Imp(linha, vPosControle, vtp1 + buscasGeral.FieldByName('NOME_CTRL').asstring);
          RdRelCxl.ImpF(linha, vPosValorRec -2, vdadosini.AlnDir(format('%n', [buscasGeral.FieldByName('valordoc').ascurrency]), 12), [comp17]);
          linha := linha + 1;
          buscasGeral.next;

          if linha >= 59 then
          begin
            linha := 1;
            RdRelCxl.Novapagina;
            cabrelcxl(RdRelCxl, vdet = 1);
          end;

          if buscasGeral.eof then
          begin
          	if linha >= 59 then
            begin
              linha := 1;
              RdRelCxl.Novapagina;
              cabrelcxl(RdRelCxl, vdet = 1);
            end;
          	if buscasGeral.RecordCount > 1 then
            begin
              RdRelCxl.Imp(linha, vPosControle, 'SOMA');
              RdRelCxl.ImpF(linha, vPosValorRec -2, vdadosini.AlnDir(format('%n', [vtottempformas]), 12), [comp17]);
              linha := linha + 1;
            end;

            linha := linha + 1;
          end;
        end;

        if linha >= 59 then
        begin
          linha := 1;
          RdRelCxl.Novapagina;
          cabrelcxl(RdRelCxl, vdet = 1);
        end;
      end
      else
       linha := linha + 1;
      buscas.next;
    end;
    //

    (*if vusccia = 'S' then
    begin
      QrApresMovCCIA.close;
      QrApresMovCCIA.sql.text := 'select ''VEIC'',ccia.codigo,ccia.dia_cxl,ccia.obs_cxl_rq,ccia.vl_rq_pg_cxl from vendaveiculo ccia ' +
        'where ccia.dia_cxl = :vdiarq and ccia.op_cxl = ' + inttostr(vcodus) + ' AND COD_EMPRESA = :COD_EMPRESA ';
      QrApresMovCCIA.Params[0].asdate := Dtmc.QryFecdiaDIA_F_CXL.value;
      QrApresMovCCIA.ParamByName('COD_EMPRESA').Text := codEmpresa;
      QrApresMovCCIA.open;
      while not QrApresMovCCIA.eof do
      begin
        RdRelCxl.Imp(linha, 1, dtmc.QryFecdiaDIA_F_CXL.asstring);
        RdRelCxl.Imp(linha, 14, QrApresMovCCIA.Fields[0].value);
        RdRelCxl.Imp(linha, 21, strzero(QrApresMovCCIA.fields[1].value, 5));
        if not QrApresMovCCIA.fields[3].isnull then
          RdRelCxl.Imp(linha, 37, QrApresMovCCIA.fields[3].value);
        RdRelCxl.Imp(linha, 107, AlnDir(format('%n', [QrApresMovCCIA.Fields[4].ascurrency]), 12));
        linha := linha + 1;
        vtote := vtote + QrApresMovCCIA.Fields[4].ascurrency;
        vtotccv := vtotccv + QrApresMovCCIA.Fields[4].ascurrency;
        dtmc.QrDetalhesCCia.close;
        dtmc.QrDetalhesCCia.ParamByName('REQ').AsInteger := QrApresMovCCIA.fields[1].value;
        dtmc.QrDetalhesCCia.ParamByName('VTPDOCS').value := QrApresMovCCIA.fields[0].value;
        dtmc.QrDetalhesCCia.Open;
        if dtmc.QrDetalhesCCia.eof then
          linha := linha + 1;
        while not dtmc.QrDetalhesCCia.eof do
        begin
          QrCtrl.close;
          QrCtrl.params[0].value := dtmc.QrDetalhesCCiaCOD_CONTROLE.value;
          QrCtrl.open;
          RdRelCxl.Imp(linha, 37, QrCtrlNOME_CTRL.asstring);
          RdRelCxl.Imp(linha, 107, AlnDir(format('%n', [dtmc.QrDetalhesCCiaVALORDOC.ascurrency]), 12));
          linha := linha + 1;
          dtmc.QrDetalhesCCia.next;
          if dtmc.QrDetalhesCCia.eof then
            linha := linha + 1;
        end;
        QrApresMovCCIA.next;
        if linha >= 59 then
        begin
          linha := 1;
          RdRelCxl.Novapagina;
        end;
      end;

    end;
    QrCtrl.close;*)
    buscasGeral.close;
    buscas.close;
    buscas.sql.text := ' select * from lanccxl ' +
    	' where data_lc_cxl = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+ ''' ' +
      ' and op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
      ' and codigo_emp = '+vDadosIni.codEmpresa;
    buscas.open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.eof do
    begin
      if buscas.FieldByName('TR').value <> 'S' then
      begin
        if buscas.FieldByName('TIPO_LANC_CXL').value = 'E' then
        begin
          vtote := vtote + buscas.FieldByName('VALOR_CXL').value;
          vtotlancavulso := vtotlancavulso + buscas.FieldByName('VALOR_CXL').AsCurrency;
        end
        else
        begin
          vtots := vtots + buscas.FieldByName('VALOR_CXL').value;
          vtotlancavulso := vtotlancavulso - buscas.FieldByName('VALOR_CXL').AsCurrency;
        end;
        RdRelCxl.Imp(linha, vPosDtMov, DateToStr(dataSet.FieldByName('DIA_F_CXL').AsDateTime));
        RdRelCxl.Imp(linha, vPosTipo, buscas.FieldByName('TIPO_LANC_CXL').AsString);
        RdRelCxl.Imp(linha, vPosNDoc, buscas.FieldByName('N_DOC_CXL').AsString);
        RdRelCxl.ImpD(linha, vPosValor, vdadosini.AlnDir(format('%n', [buscas.FieldByName('VALOR_CXL').AsCurrency]), 12), [comp17]);
        RdRelCxl.ImpF(linha, vPosHistorico, buscas.FieldByName('HISTORICO_CXL').AsString, [comp17]);
      end
      else
        vtottroco := vtottroco + Abs(buscas.FieldByName('VALOR_CXL').AsCurrency);
      linha := linha + 1;
      buscas.next;
      if linha >= 59 then
      begin
        linha := 1;
        RdRelCxl.Novapagina;
        cabrelcxl(RdRelCxl, vdet = 1);
      end;
    end;
    buscas.close;
    buscas.sql.text := 'select ''AVL'',fr.ndoc,fr.data_mov,fr.valordoc,fr.cod_controle,fr.historico,ctrl.nome_ctrl from formpagamento fr ' +
      ' inner join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl and fr.cod_empresa = ctrl.codigo_emp  ' +
      ' where fr.data_mov = ''' + FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('DIA_F_CXL').AsDateTime)+ ''' ' +
      ' and tpdocs = ''AVL'' ' +
      ' and fr.op_cxl = ' + inttostr(vDadosIni.vCodOpCxl) +
      ' and fr.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and fr.ativo = 1 ';
    buscas.open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.eof do
    begin
      vtote := vtote +buscas.FieldByName('valordoc').AsCurrency;
      RdRelCxl.Imp(linha, vPosDtMov,DateToStr(dataSet.FieldByName('DIA_F_CXL').AsDateTime));
      RdRelCxl.Imp(linha, vPosTipo, copy(buscas.FieldByName('NOME_CTRL').asstring, 1, 5));
      RdRelCxl.Imp(linha, vPosNDoc,buscas.FieldByName('COD_CONTROLE').asstring);
      RdRelCxl.ImpD(linha, vPosValor, vdadosini.AlnDir(format('%n', [buscas.FieldByName('valordoc').AsCurrency]), 12), [comp17]);
      RdRelCxl.ImpF(linha, vPosHistorico, buscas.FieldByName('HISTORICO').asstring, [comp17]);
      linha := linha + 1;
      buscas.next;
      if linha >= 59 then
      begin
        linha := 1;
        RdRelCxl.Novapagina;
        cabrelcxl(RdRelCxl, vdet = 1);
      end;
    end;
    RdRelCxl.ImpF(linha, 1, vdadosini.replicate('=', 132), [comp17]);

    if linha >= 47 then
    begin
      linha := 1;
      RdRelCxl.Novapagina;
      cabrelcxl(RdRelCxl, vdet = 1);
    end;
    linha := linha + 1;
    // parei
    RdRelCxl.Imp(linha, 1, 'TOTAL ENTRADA....: ' + vdadosini.alndir(format('%n', [vtote]), 12));
    linha := linha + 1;
    RdRelCxl.Imp(linha, 1, 'TOTAL SAIDAS.....: ' + vdadosini.alndir(format('%n', [0 - vtots]), 12));
    linha := linha + 1;
    RdRelCxl.Imp(linha, 1, 'JUROS............: ' + vdadosini.alndir(format('%n', [vtotjuros]), 12));
    linha := linha + 1;
//    RdRelCxl.Imp(linha, 1, 'DESCONTO.........: ' + vdadosini.alndir(format('%n', [0 - vtotdesconto]), 12));
//    linha := linha + 1;
//    RdRelCxl.Imp(linha, 1, 'TROCO............: ' + vdadosini.alndir(format('%n', [0 - vtottroco]), 12));
//    linha := linha + 1;
    RdRelCxl.Imp(linha, 1, 'TOTAL MOV........: ' + vdadosini.alndir(format('%n', [vtote - vtots + vtotjuros {- vtotdesconto}{ - vtottroco}]), 12));
    linha := linha + 2;

    vtotal := 0;
    vtotal := vtotal + vtotmt;
    RdRelCxl.Imp(linha, 1, 'TOTAL VEIC.......: ' + vdadosini.alndir(format('%n', [vtotmt]), 12));
    linha := linha + 1;

    vtotal := vtotal + vtotec;
    RdRelCxl.Imp(linha, 1, 'TOTAL ECOMMERCE..: ' + vdadosini.alndir(format('%n', [vtotec]), 12));
//    linha := linha + 1;
//    RdRelCxl.Imp(linha, 1, 'TOTAL CCIA.......: ' + vdadosini.alndir(format('%n', [vtotccv]), 12));
    linha := linha + 1;

    vtotal := vtotal + vtotr;
    RdRelCxl.Imp(linha, 1, 'TOTAL REQ........: ' + vdadosini.alndir(format('%n', [vtotr]), 12));
    linha := linha + 1;

    vtotal := vtotal + vtoto;
    RdRelCxl.Imp(linha, 1, 'TOTAL O.S........: ' + vdadosini.alndir(format('%n', [vtoto]), 12));
    linha:=linha+1;

    vtotal := vtotal + vtotlancavulso;
    RdRelCxl.Imp(linha, 1, 'TOTAL LANC AVULSO: ' + vdadosini.alndir(format('%n', [vtotlancavulso]), 12));
    linha:=linha+1;

  	vtotal := vtotal + vtotpre;
    RdRelCxl.Imp(linha, 1, 'TOTAL PREST......: ' + vdadosini.alndir(format('%n', [vtotpre]), 12));
    linha:=linha+1;

    vtotal := vtotal + vtotrec;
    RdRelCxl.Imp(linha, 1, 'TOTAL RECIBO.....: ' + vdadosini.alndir(format('%n', [vtotrec]), 12));
    linha:=linha+1;

    RdRelCxl.Imp(linha, 1, 'TOTAL............: ' + vdadosini.alndir(format('%n', [vtotal]), 12));    
    RdRelCxl.Fechar;
    //  RdRelCxl.Abrir;
end;

procedure TFecdCXL.relrecibosrec(RdRecibos: trdprint);
var
  vdia: string;
  vtote: currency;
begin
  linha := 1;
  vpag := 0;
  InputQuery('Digitação da Data', ' Entre com a Data formato dd/mm/aaaa:', vdia);

  if trim(vdia) = '' then
  begin
  	Application.MessageBox(pchar('Data não informada'), pchar('Atenção'), MB_ICONWARNING + MB_OK);
    exit;
  end;

  try
    strtodate(vdia)
  except
    Application.MessageBox(pchar('Data informada incorreta'), pchar('Atenção'), MB_ICONWARNING + MB_OK);
    exit;
  end;

  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    buscas.close;
    buscas.sql.text:= 'select h.*, r.num_rec_dep from hist_rec h ' +
     ' left join recibos r on r.nrecibo = h.nrecibo and r.cod_empresa = h.cod_empresa ' +
     ' where h.data_baixa = '''+FormatDateTime('mm/dd/yyyy', strtodate(vdia))+''' AND '+
     ' h.COD_US = '+inttostr(vDadosIni.vCodOpCxl)+' AND h.COD_EMPRESA = '+vDadosIni.codEmpresa+
     ' AND h.ATIVO = 1 order by h.SEQCAD_REC';
    buscas.Open;
  end
  else
  begin
    buscas.close;
    buscas.sql.text:= ' select h.* from hist_rec h ' +
     ' where h.data_baixa = '''+FormatDateTime('mm/dd/yyyy', strtodate(vdia))+''' AND '+
     ' h.COD_US = '+inttostr(vDadosIni.vCodOpCxl)+' AND h.COD_EMPRESA = '+vDadosIni.codEmpresa+
     ' AND h.ATIVO = 1 order by h.SEQCAD_REC';
    buscas.Open;
  end;
  RDRecibos.OpcoesPreview.CaptionPreview := 'Relatório Recibos Recebidos por Período';
  RDRecibos.TitulodoRelatorio := 'Relatório Recibos Recebidos por Período';
  vDadosIni._LimparVarSendEmail;
  RDRecibos.OnSendMail := vDadosini._SendMailRdPrint;
  RDRecibos.Abrir;
  cabrecibosrec(Rdrecibos,strtodate(vdia));
  while not buscas.eof do
  begin
    if (vDadosIni.vRecibo.HabRecPorDepart) and (trim(buscas.FieldByName('NUM_REC_DEP').AsString) <> '') then
      RdRecibos.Imp(linha, 1, buscas.FieldByName('NUM_REC_DEP').AsString)
    else
	    RdRecibos.Imp(linha, 1, vdadosini.StrZero(buscas.FieldByName('nrecibo').AsInteger, 5));
    RdRecibos.Imp(linha, 14,buscas.FieldByName('HISTORICO_REC').value);
    RdRecibos.Imp(linha, 70, vdadosini.AlnDir(format('%n', [buscas.FieldByName('VALOR_BAIXA').AsCurrency]), 12));
    linha := linha + 1;
    vtote := vtote + buscas.FieldByName('VALOR_BAIXA').AsCurrency;
    buscas.Next;
    if linha >= 59 then
    begin
      linha := 1;
      RdRecibos.Novapagina;
      cabrecibosrec(Rdrecibos,strtodate(vdia));
    end;
  end;
  RdRecibos.ImpF(linha, 1, vdadosini.replicate('=', 132), [comp17]);
  linha := linha + 1;
  // parei
  RDRecibos.Imp(linha, 1, 'TOTAL RECIBOS: ');
  RDRecibos.Imp(linha, 70, vdadosini.alndir(format('%n', [vtote]), 12));
  RDRecibos.Fechar;
end;

function TFecdCXL._carga_fin_emAberto: Boolean;
var
  vCargas: string;
begin
  Result := False;
  if vDadosIni.vEmp.vUsarFechCargaCxl <> 'S' then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select cod_carga from carga' +
    ' where dia_cxl = :dia_cxl' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and status_fin = ''RECEBENDO''';
  buscas.ParamByName('dia_cxl').AsDate := vDadosIni.diaFCxl;
  buscas.Open;

  vCargas := '';
  buscas.FetchAll;
  buscas.First;
  while not buscas.Eof do
  begin
    vCargas := vCargas + IntToStr(buscas.FieldByName('cod_carga').AsInteger);
    buscas.Next;

    if not buscas.Eof then
      vCargas := vCargas + ', ';
  end;

  Result := buscas.RecordCount > 0;
  if Result then
  begin
    Application.MessageBox(pchar('Existe(m) carga(s) ainda em processo de recebimento pelo Caixa Auxiliar' + #13 +
      'Carga(s): ' + vCargas + #13 +
      'O Fechamento somente poderá continuar depois da(s) carga(s) recebida(s)'), 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);

    if not vDadosIni.PesqPros('CXL072', 'VALIDAR', 'CARGAS: ' + vCargas, '', '', buscas, True) then
      Exit;

    if Application.MessageBox('Deseja continuar mesmo assim?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      Result := False;
  end;
end;

function TFecdCXL._validaDiaFech: boolean;
begin
 result:=true;
 if vDadosIni.diaAbertoCxl <> dataSet.FieldByName('DIA_F_CXL').value then
 begin
//  Application.MessageBox(pchar('Dia do Caixa selecionado não é o dia aberto'),
//  'Atenção',MB_ICONEXCLAMATION + MB_OK);
//  result:=false;
  last;
 end;
end;

//function TFecdCXL.post: boolean;
//begin
//
//end;

{ TGenerico }

function TGenerico.CamposSQL: string;
begin
  Result := Format(' rq.nped,rq.tipo, iif(rq.cod_cliente = %d, coalesce(rq.nome_cli_orc, cl.nome_cliente), cl.nome_cliente) nome_cliente,' +
                   ' rq.valor_total,rq.data_ped,rq.data_fech,' +
                   ' rq.obs_cxl_rq,rq.vl_pago_cxl,rq.status_cxl_rq,rq.dia_cxl,rq.desconto,rq.desc_p_prod,rq.desc_p_serv,' +
                   ' rq.cod_cliente,rq.cod_cli_fat,rq.cod_cond_pag,rq.cod_vendedor,rq.op_cxl,rq.vl_entrada,' +
                   ' rq.codigo_ctrl,rq.cod_empresa,rq.nprevenda,rq.ncupom,rq.nserieecf,rq.operador,rq.num_nf,rq.data_nf,rq.tipo_os,rq.num_nfeext,' +
                   ' rq.cod_carga, rq.valor_desc_avista, rq.tot_prod, rq.id_commerce, rq.local_venda, rq.cod_nfce, rq.num_nfce, rq.nf_ac_calctrib, ' +
                   ' nfce.operador op_nfce, nfce.cod_emissor cx_nfce', [StrToIntDef(vDadosIni.vCliente.vCodClientePadrao, 0)]);
end;

procedure TGenerico.enviarVendaParaCupom;
var
  CNPJ: string;
  INSC: string;
  tipo:string;
begin
  if (vDadosIni.vFiscalAtivo <> 'S') then
    exit;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('nprevenda').AsInteger = 0 then
    exit;

  if not verificaemissaonf(2) then
   exit;
{  if Self.name = 'TPendReq' then
    tipo := 'REQ'
  else if Self.name = 'TPendOS' then
    tipo := 'OS';}
  tipo:=vtipdoc;
  if retornaValor('select ncupom as valor from pedvenda' + ' where nped = ' +
    dataSet.FieldByName('nped').AsString + ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and tipo = ' + QuotedStr(tipo)) <> '' then

  begin
    Application.MessageBox(pchar('Atenção Requisição' +
      ' com cupom fiscal emitido'),
      'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
  try
    comucFiscal.receberVendaDoRetaguarda(dataSet.FieldByName('nped').AsInteger, tipo);
  finally
    Refresh;
     //      frmPrincipalFiscal.Visible := false;
  end;
end;

procedure TGenerico.enviarVendaParaNFCe;
var
  nfce_emitir_from_pedvenda: Tnfce_emitir_from_pedvenda;
  ANomeDoc: string;
begin

  if not verificaemissaonf(2, 'NFCe') then
   exit;

  if (Trim(dataSet.FieldByName('tipo').AsString) = 'ORC') then
  begin
    vDadosIni.ShowAtencao('NFC-e não permitida para orçamentos');
    Exit;
  end;

  SqlOpen('select tipo, status_ped, ncupom, nserieecf, data_cupom, operador, n_nfd, serie_nfd,' +
          ' num_nf, serie_nf, valor_nf from pedvenda' +
          ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
          ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString) +
          ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger));

  if (Trim(buscas.FieldByName('status_ped').AsString) <> 'FECHADA') then
  begin
    vDadosIni.ShowAtencao('NFC-e não permitida para documento com status: ' +
                          Trim(buscas.FieldByName('status_ped').AsString));
    Exit;
  end;

  ANomeDoc := IfThen(Trim(buscas.FieldByName('tipo').AsString) = 'REQ', 'Pedido', 'Ordem de serviço');

  if (buscas.FieldByName('ncupom').AsInteger > 0) then
  begin
    vDadosIni.ShowAtencao('NFC-e não permitida para ' + ANomeDoc + '. Cupom fiscal já emitido ' + #13 +
                          'Numero: ' + buscas.FieldByName('ncupom').AsString + #13 +
                          'ECF: ' + buscas.FieldByName('nserieecf').AsString + #13 +
                          'Caixa: ' + buscas.FieldByName('operador').AsString + #13 +
                          'Data: ' + buscas.FieldByName('data_cupom').AsString
                          );
    Exit;
  end;

  if (buscas.FieldByName('n_nfd').AsInteger > 0) then
  begin
    vDadosIni.ShowAtencao('NFC-e não permitida para ' + ANomeDoc + '. Nota Fiscal Serie D já emitida ' + #13 +
                          'Numero: ' + buscas.FieldByName('n_nfd').AsString + #13 +
                          'Serie: ' + buscas.FieldByName('serie_nfd').AsString //+ #13 +
                          //'Data: ' + buscas.FieldByName('data_nfd').AsString + #13 +
                          //'Valor: ' + Format('%0.2n', [buscas.FieldByName('valor_nfd').AsFloat])
                          );
    Exit;
  end;

  if (buscas.FieldByName('num_nf').AsInteger > 0) then
  begin
    vDadosIni.ShowAtencao('NFC-e não permitida para ' + ANomeDoc + '. Nota Fiscal já emitida ' + #13 +
                          'Numero: ' + buscas.FieldByName('num_nf').AsString + #13 +
                          'Serie: ' + buscas.FieldByName('serie_nf').AsString + #13 +
                          'Valor: ' + Format('%0.2n', [buscas.FieldByName('valor_nf').AsFloat])
                          );
    Exit;
  end;

  if SqlOpen('select n_nf, serie from pedvenda_prod' +
             ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
             ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').AsString)) +
             ' and cod_empresa = ' + vDadosIni.codEmpresa +
             ' and ((status is null) or (status = ' + QuotedStr('') + '))'
            ).FieldByName('n_nf').AsInteger > 0 then
  begin
    vDadosIni.ShowAtencao('NFC-e não permitida para ' + ANomeDoc + '. Nota Fiscal já emitida ' + #13 +
                          'Numero: ' + buscas.FieldByName('n_nf').AsString + #13 +
                          'Serie: ' + buscas.FieldByName('serie').AsString
                          );
    Exit;
  end;
  

  if SqlOpen('select num_nf, situacao_nfce from nfce' +
             ' where cod_nfce = %d and cod_empresa = %d',
             [fint('cod_nfce'), vDadosIni.cod_empresa])
             .FieldByName('situacao_nfce').AsString = 'Autorizada' then
  begin
    if ShowConfirmacao('Já existe uma NFC-e Autorizada para este registro' + #13 +
                       'Numero: ' + buscas.FieldByName('num_nf').AsString + #13 +
                       'Deseja visualizar?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> ID_YES then
      Exit;
  end;

  if vDadosIni.vNFConsumidor.AHandle = 0 then
    CarregaPacote('pkNFConsumidor', vDadosIni.vNFConsumidor.AHandle);

  if vDadosIni.vNFConsumidor.AHandle = 0 then
  begin
    vDadosIni.ShowAtencao('Pacote NF Consumidor não carregado');
    Exit;
  end;

  @nfce_emitir_from_pedvenda := GetProcAddress(vDadosIni.vNFConsumidor.AHandle, PChar('nfce_emitir_from_pedvenda'));
  if Assigned(nfce_emitir_from_pedvenda) then
    nfce_emitir_from_pedvenda(dataSet.FieldByName('nped').AsInteger,
                              Trim(dataSet.FieldByName('tipo').AsString));
end;

procedure TGenerico.verificaNFCeAutomatica;
var
  Conf: TConfig_sistema_class;
begin
  NFCeAutomaticaAtiva := False;
  if vDadosIni.vNFConsumidor.CodEmissor = 0 then
    Exit;

  Conf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_cliente', buscas, vDadosIni.cod_empresa);
  try
    Conf.AtivarMapeamentoKeys;
    NFCeAutomaticaAtiva := Conf.ReadString('NFCe_CaixaAuxiliar', 'EnvioAutomatico', 'N') = 'S';
  finally
    if Conf.KesyChanges then
      with Conf.SaveConfDB(buscas).Transaction do
        if InTransaction then
          Commit;
  end;
end;

function TGenerico.verificarNFSe(nped: Integer; tipo: string;
  reimprimir: boolean = False; exibir_mens: boolean = True): boolean;
begin
	Result := False;

	buscas.close;
  buscas.sql.text := ' select count(*) as qtde, ' +
   ' sum(coalesce(valor_tot_serv, 0) - coalesce(rateio_desc, 0)) as valor from pedvenda_serv ' +
   ' where nped = ' + IntToStr(dataSet.FieldByName('NPED').AsInteger) +
   ' and tipo = ' + QuotedStr(dataSet.FieldByName('TIPO').AsString) +
   ' and cod_empresa = ' + vDadosIni.codEmpresa +
   ' and valor_tot_serv <> 0 ' +
   vDadosIni.IfThen(not reimprimir,
   	 ' and (n_nf is null or n_nf = 0) ', '') +
   ' and (status is null or status = '''') ';
  buscas.open;

  if buscas.FieldByName('qtde').AsInteger > 0 then
  begin
  	if not exibir_mens then
    	Result := True
    else
      Result := Application.MessageBox(Pchar('Deseja Emitir NFSe dos serviços desta Venda no valor de: ' +
        format('%n', [buscas.fieldbyname('valor').ascurrency])+'?'),
        'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES;
  end;
end;

procedure TGenerico.showFiscal;
begin
  if vDadosIni.vFiscalAtivo <> 'S' then
    vDadosIni.vFiscalAtivo := '';
  if vDadosIni.vTerminalFiscal <> 'S' then
    vDadosIni.vFiscalAtivo := 'N';
  if vDadosIni.vFiscalAtivo = 'N' then
    exit;
  if comucFiscal = nil then
    comucFiscal := TComunic.Create;
  comucFiscal.showFiscal;
end;

function TGenerico.verificaemissaonf(vtipo: integer; Doc: string): boolean;
var
 CNPJ,INSC: string;
begin
  result:=true;
  CNPJ := retornaValor('SELECT CPFCGC AS VALOR FROM CLIENTES WHERE COD_CLIENTE = ' +
    dataSet.FieldByName('COD_CLIENTE').AsString + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa);
  INSC := TRIM(retornaValor('SELECT INSC_EST AS VALOR FROM CLIENTES WHERE COD_CLIENTE = ' +
    dataSet.FieldByName('COD_CLIENTE').AsString + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa));
  if vtipo = 2 then
  begin
    if (Length(CNPJ) > 11) //and
    //(INSC <> 'ISENTO')
    then
    if ShowConfirmacao(
      'Este cliente é Pessoa Jurídica, você pode emitir NF, tem certeza que deseja enviar este DAV para %s?',
      [Doc]) = IDNO then
      result:=false;
  end;
  if vtipo = 1 then
  begin
   if ((Length(CNPJ) <= 11) and (vDadosIni.vFiscalAtivo <> 'S'))
   or ((Length(CNPJ) <= 11) and (dataSet.FieldByName('NCUPOM').asinteger <> 0)) then
    Result:=true;
  end;
end;

procedure TGenerico.verificaFiscalAtivo;
begin
  if vDadosIni.vTerminalFiscal <> 'S' then
    vDadosIni.vFiscalAtivo := 'N';
  if vDadosIni.vFiscalAtivo = 'N' then
    exit;
  if vDadosIni.vFiscalAtivo = 'S' then
    exit;
  vDadosIni.vFiscalAtivo := 'N';
  if comucFiscal = nil then
    comucFiscal := TComunic.Create;
  comucFiscal.iniciaFiscalSegundoPlano;
end;

end.

