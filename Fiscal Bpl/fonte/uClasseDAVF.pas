unit uClasseDAVF;

interface

uses
  uDataSet_OOP, DBClient, Controls, StdCtrls, uImpressoraF, ComCtrls,
  IBStoredProc, DB, IBQuery, uRecord, Classes, uClassesMigRegistros;

type
  RDadosCliente = record
    NomeClienteImp, Endereco, Bairro, Cidade, Estado, CpfCnpj, NomeClienteGravar: string;
  end;

  TDAVF = class;
  TItemDAVF = class;
  TFrmPg = class;

  TPedVendasRetaguarda = class(TDataSet_OOP)
  private
    FDadosCliente: RDadosCliente;
    procedure SetDadosCliente(const Value: RDadosCliente);
  protected
    fDataVendas: string;
    vTipoVenda: string;
    vBxEstoque, vVoltaEst: TIBStoredProc;
    fOSPermiteCupom: Boolean;
    procedure BaixaEstoque(vItem: TClientDataSet);overload;
    procedure BaixaEstoque(vItem: TIBQuery);overload;
    procedure VoltaEstoque(vItem: TClientDataSet; pCancelamentoPreVenda: Boolean = False);overload;
    procedure ItemAfterScroll(DataSet: TDataSet);
    function confirmaEmissaoCupomVendaCCF(pCCF: Integer): boolean;
  public
    destructor Destroy; override;
		constructor create;
		procedure desmarcaVendaParaCupom;
		procedure sincronizaCupomNoRetaguarda_nao_usar(codTerminal, codEmpresa: integer; dataIni, dataFim: string; vprogres: TProgressBar); overload;
		procedure sincronizaCupomNoRetaguarda_nao_usar(nCupom: integer; vprogres: TProgressBar); overload;
		procedure sincronizaCupomNoRetaguarda_nao_usar(pDataSetCp, pDataSetCp2: TClientDataSet; vprogres: TProgressBar); overload;
		procedure sincronizaCupomNoRetaguardaTeste_nao_usar(pDataSetCp, pDataSetCp2: TClientDataSet; vprogres: TProgressBar);
    procedure BuscarDadosCliente;
		function verificaDescontoMaiorQueSomaDosItens:boolean;
		function getQueryRetaguarda(pBuscas2: Boolean = False):TIBQuery;
    function marcarVendaParaCupom: boolean; overload;
    function marcarVendaParaCupom(nped: integer): boolean; overload;
    function selecionaVendasParaCupom(isento:integer): boolean; overload; virtual; abstract;
    function selecionaVendasParaCupom(nPed: integer; tipo: string; pCancelados: Boolean = False): boolean; overload; virtual; abstract;
    function selecionaVendasParaCupomUltimos30Dias: boolean; virtual; abstract;
    function selecionaVendasParaCupomDiaAtual(isento,maisDias:integer): boolean; virtual; abstract;
    function selecionaVendasDAVEmitidos(dataIni, dataFim: TDate): boolean; overload; virtual; abstract;
    function selecionaVendasDAVOSEmitidos(dataIni, dataFim: TDate): boolean; virtual; abstract;
    function confirmaEmissaoCupomVenda(nCupom, nDAV: Integer): boolean; virtual; abstract;
    procedure sincronizaDAVNoRet_nao_usar(nCupom,nRegistro,nPrevenda: integer; vprogres: TProgressBar); virtual; abstract;
    function cancelarPreVenda(pVoltarEstoque: Boolean = True): Boolean; virtual; abstract;
    function PedVenda_GetFromPedVenda(ANPed: Integer; ATipo: string): TReg_PedVenda;

    property OSPermiteCupom: Boolean read fOSPermiteCupom;
    property dataVendas: string read fDataVendas write fDataVendas;
    property DadosCliente: RDadosCliente read FDadosCliente write SetDadosCliente;
  var
    vItem: TItemDAVF;
    vFrmPg: TFrmPg;
    apagarVendasRetaguarda: string;
    nCCF: integer;
  end;

  TDAVF = class(TPedVendasRetaguarda)
  public
    destructor Destroy; override;
    constructor create;
    function selecionaVendasParaCupom(isento:integer): boolean; overload; override;
    function selecionaVendasParaCupom(nPed: integer; tipo: string; pCancelados: Boolean = False): boolean; overload; override;
    function selecionaVendasParaCupomUltimos30Dias: boolean; override;
    function selecionaVendasParaCupomDiaAtual(isento,maisDias:integer): boolean; override;
    function selecionaVendasDAVEmitidos(dataIni, dataFim: TDate): boolean; overload; override;
    function selecionaVendasDAVOSEmitidos(dataIni, dataFim: TDate): boolean; override;
    function confirmaEmissaoCupomVenda(nCupom, nDAV: Integer): boolean; override;
    procedure sincronizaDAVNoRet_nao_usar(nCupom,nRegistro,nPrevenda: integer; vprogres: TProgressBar); override;
    function cancelarPreVenda(pVoltarEstoque: Boolean = True): Boolean; override;
    function montarDAVparaImpressao(var pDAV: RVenda): Boolean;
    procedure setDavImpressoECF(pDAV: RVenda);
  end;

  TItemDAVF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaItensDaVenda(nPed: integer; tipo: string): boolean; overload;
  end;

  TFrmPg = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function selecionaFormaPagamento(tipoVenda: string; nped: integer): boolean;
  end;

  TPrestacoes_CX = class(TDataSet_OOP)
  public
    constructor create;
    function abrePrestacoes(dataIni, dataFim: TDate): boolean;overload;
    function abrePrestacoes(diaCxl: TDate): boolean;overload;
    function abrePrestacoes(cod_cred: integer): boolean; overload;
    function cancelaPrestacao(coonaofiscal: integer): boolean;
    function iniciaRecebimento: boolean;
    function cancelaRecebimento:boolean;
    function confirmaRecebimento(coo :integer):boolean;
  end;
  (*
  private
    function getPrestacaoPendente:boolean;
  public
    constructor create;
    function abrePrestacoes(dataIni, dataFim: TDate): boolean;overload;
    function abrePrestacoes(cod_cred: integer): boolean; overload;
    function iniciaRecebimento:boolean;
    function cancelaRecebimento:boolean;
    function confirmaRecebimento(totalizador, finalizador, coo :integer):boolean;
    function inserePrestacao(cod_cred: integer): boolean; overload;
  end;
  *)

  TPreVendaRetaguarda = class(TPedVendasRetaguarda)
  public
    constructor create;
    destructor Destroy; override;
    function selecionaVendasParaCupomDiaAtual(isento, maisDias:integer): boolean; override;
    function selecionaVendasParaCupom(isento:integer): boolean;overload; override;
    function selecionaVendasParaCupom(nPed: integer; tipo: string; pCancelados: Boolean = False): boolean; overload; override;
    function voltarEstoque: Boolean;

    function confirmaEmissaoCupomVenda(nCupom, nPreVnd: Integer): boolean; override;
    function cancelarPreVenda(pVoltarEstoque: Boolean = True): Boolean; override;
  end;

implementation

uses SysUtils, Dialogs, IBDatabase, Forms, Windows,
  uDadosIni, uDtmDavF, uDtmAtivo, StrUtils;

{ TPedVendasRetaguarda }

procedure TPedVendasRetaguarda.BaixaEstoque(vItem: TClientDataSet);
begin
  vBxEstoque := TIBStoredProc(dtmDAVF.SpBxEst);
  vItem.first;
  while not vItem.Eof do
  begin
    vBxEstoque.close;
    vBxEstoque.ParamByName('vgrupo').AsInteger :=
      vItem.Fieldbyname('GRUPO_PROD').AsInteger;
    vBxEstoque.ParamByName('vcod_prod').AsString :=
      vItem.Fieldbyname('COD_PROD').AsString;
    vBxEstoque.ParamByName('quant').AsFloat :=
      vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
    if vItem.Fieldbyname('TP_NF_PED').AsString = '5' then
      vBxEstoque.ParamByName('vests').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat
    else
      vBxEstoque.ParamByName('vests').AsFloat := 0;
    if (vItem.Fieldbyname('TP_NF_PED').AsString = '1') or
      (vItem.Fieldbyname('TP_NF_PED').AsString = '3') then
    begin
      vBxEstoque.ParamByName('vestm').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
      vBxEstoque.ParamByName('vestc').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
    end
    else
    begin
      vBxEstoque.ParamByName('vestm').AsFloat := 0;
      vBxEstoque.ParamByName('vestc').AsFloat := 0;
    end;
    if (vItem.Fieldbyname('TP_NF_PED').AsString = '2') or
      (vItem.Fieldbyname('TP_NF_PED').AsString = '4') then
      vBxEstoque.ParamByName('vestc').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
    vBxEstoque.ParamByName('vdata').AsDate := vDadosIni.getDataBanco(buscas);
    vBxEstoque.ParamByName('cod_empresa').AsInteger := vItem.Fieldbyname('cod_empresa').AsInteger;
    vBxEstoque.Prepare;
    vBxEstoque.ExecProc;
    vItem.Next;
  end;
end;

procedure TPedVendasRetaguarda.BaixaEstoque(vItem: TIBQuery);
begin
  vBxEstoque := TIBStoredProc(dtmDAVF.SpBxEst);

  vItem.first;
  while not vItem.Eof do
  begin
    vBxEstoque.close;
    vBxEstoque.ParamByName('vgrupo').AsInteger :=
      vItem.Fieldbyname('GRUPO_PROD').AsInteger;
    vBxEstoque.ParamByName('vcod_prod').AsString :=
      vItem.Fieldbyname('COD_PROD').AsString;
    vBxEstoque.ParamByName('quant').AsFloat :=
      vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
    if vItem.Fieldbyname('TP_NF_PED').AsString = '5' then
      vBxEstoque.ParamByName('vests').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat
    else
      vBxEstoque.ParamByName('vests').AsFloat := 0;
    if (vItem.Fieldbyname('TP_NF_PED').AsString = '1') or
      (vItem.Fieldbyname('TP_NF_PED').AsString = '3') then
    begin
      vBxEstoque.ParamByName('vestm').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
      vBxEstoque.ParamByName('vestc').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
    end
    else
    begin
      vBxEstoque.ParamByName('vestm').AsFloat := 0;
      vBxEstoque.ParamByName('vestc').AsFloat := 0;
    end;
    if (vItem.Fieldbyname('TP_NF_PED').AsString = '2') or
      (vItem.Fieldbyname('TP_NF_PED').AsString = '4') then
      vBxEstoque.ParamByName('vestc').AsFloat :=
        vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
    vBxEstoque.ParamByName('vdata').AsDate := vDadosIni.getDataBanco(buscas);
    vBxEstoque.ParamByName('cod_empresa').AsInteger := vItem.Fieldbyname('cod_empresa').AsInteger;
    vBxEstoque.Prepare;
    vBxEstoque.ExecProc;
    vItem.Next;
  end;

end;

procedure TPedVendasRetaguarda.BuscarDadosCliente;
begin
  if dataSet.FieldByName('cod_cliente').AsInteger = StrToIntDef(vDadosIni.vCliente.vCodClientePadrao, 0) then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select pv.nome_clientedav, pv.end_avl, pv.bairro_avl, pv.cida_avl, pv.cpfcgc, pv.esta_avl' +
      ' from pedvenda pv ' +
      ' where pv.nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and pv.tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString) +
      ' and pv.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    FDadosCliente.NomeClienteImp    := Trim(buscas.FieldByName('nome_clientedav').AsString);
    FDadosCliente.NomeClienteGravar := Trim(buscas.FieldByName('nome_clientedav').AsString);
    FDadosCliente.Bairro            := Trim(buscas.FieldByName('bairro_avl').AsString);
    FDadosCliente.Cidade            := Trim(buscas.FieldByName('cida_avl').AsString);
    FDadosCliente.CpfCnpj           := Trim(buscas.FieldByName('cpfcgc').AsString);
    FDadosCliente.Estado            := Trim(buscas.FieldByName('esta_avl').AsString);
    FDadosCliente.Endereco          := Trim(buscas.FieldByName('end_avl').AsString);
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := 'select cl.cod_cliente, cl.nome_cliente, cl.endereco, cl.num_end_cliente, cl.complemento,' +
      ' cl.bairro, cl.cidade, cl.cpfcgc, es.sigla_uf' +
      ' from clientes cl ' +
      ' inner join estados es on es.codigo_uf = cl.codigo_uf' +
      ' where cl.cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
      ' and cl.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    FDadosCliente.NomeClienteImp    := Trim(buscas.FieldByName('cod_cliente').AsString + ' ' + buscas.FieldByName('nome_cliente').AsString);
    FDadosCliente.NomeClienteGravar := Trim(buscas.FieldByName('nome_cliente').AsString);
    FDadosCliente.Bairro            := Trim(buscas.FieldByName('bairro').AsString);
    FDadosCliente.Cidade            := Trim(buscas.FieldByName('cidade').AsString);
    FDadosCliente.CpfCnpj           := Trim(buscas.FieldByName('cpfcgc').AsString);
    FDadosCliente.Estado            := Trim(buscas.FieldByName('sigla_uf').AsString);
    FDadosCliente.Endereco          := Trim(buscas.FieldByName('endereco').AsString) +
                      vDadosIni.IfThen(Trim(buscas.FieldByName('num_end_cliente').AsString) <> '',
                                 ',' + Trim(buscas.FieldByName('num_end_cliente').AsString), '') +
                      vDadosIni.IfThen(Trim(buscas.FieldByName('complemento').AsString) <> '',
                                 ',' + Trim(buscas.FieldByName('complemento').AsString), '');
  end;
  buscas.Close;
end;

function TPedVendasRetaguarda.confirmaEmissaoCupomVendaCCF(pCCF: Integer): boolean;
var
  vTipodll: string;
begin
  try
    Result := True;
    inibeErro := 'S';
    vTipodll := 'REQVENDA';
    if Trim(dataSet.FieldByName('tipo').AsString) = 'OS' then
      vTipodll := 'ORDEM_SERV';
    buscas.close;
    buscas.SQL.Text := ('update pedvenda set CCF_CUPOM = ' + IntToStr(pCCF) +
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(vTipoVenda));
    try buscas.ExecSQL; except end;
    CommitaTransacao;

    Result := True;
  except
    on e:exception do begin
//      Result := False;
      //Application.MessageBox(pchar('Erro ao definir numero do cupom fiscal na venda'),'Erro',0+64);
      registraErro('Erro ao definir numero do cupom na venda '+vTipodll + ' Num '+ dataSet.FieldByName('nped').AsString+
        e.Message );
    end;
  end;
end;

constructor TPedVendasRetaguarda.create;
begin
	apagarVendasRetaguarda := '';
	if dtmDAVF = nil then
		dtmDAVF := TdtmDAVF.Create(dtmDAVF);
	dataSet := TClientDataSet(dtmDAVF.cdsDAVF);
	transacao := TIBTransaction(dtmDAVF.transacaoRet);
  buscas := TIBQuery(dtmDAVF.qrBuscas);
  vItem := TItemDAVF.create;
  dataSet.AfterScroll := ItemAfterScroll;
  vFrmPg := TFrmPg.create;
  nCCF := 0;
end;

procedure TPedVendasRetaguarda.desmarcaVendaParaCupom;
begin
  inibeErro := 'S';
  buscas.Close;
  buscas.SQL.Text := 'update pedvenda set status_cupom = '''',codterm_status = 0' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and status_cupom = ''P'' and' +
    ' codterm_status = ' + vDadosIni.vCodTerminal;
  try buscas.ExecSQL; except end;
  CommitaTransacao;
end;

destructor TPedVendasRetaguarda.Destroy;
begin
  vItem.Free;
  vItem := nil;
  vFrmPg.Free;
  vFrmPg := nil;
  inherited;
end;

function TPedVendasRetaguarda.getQueryRetaguarda(pBuscas2: Boolean): TIBQuery;
begin
	if pBuscas2 then
		Result := dtmDAVF.qrBuscas2
	else
  	result := buscas;
end;

procedure TPedVendasRetaguarda.ItemAfterScroll(DataSet: TDataSet);
begin
  vItem.selecionaItensDaVenda(dataSet.FieldByName('nped').AsInteger,dataSet.FieldByName('tipo').AsString);
end;

function TPedVendasRetaguarda.marcarVendaParaCupom(nped: integer): boolean;
begin
  inibeErro := 'S';
  buscas.Close;
  buscas.SQL.Text := 'update pedvenda set status_cupom = ''P'',codterm_status = ' +
    vDadosIni.vCodTerminal + ' where nped = ' + IntToStr(nped) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString);
  try buscas.ExecSQL; except end;
  CommitaTransacao;
  Result := True;
//  Result := ExecutaComandosSql('select nped from pedvenda where nped = ' +
//    IntToStr(nped) +
//    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and status_cupom = ''P'' and' +
//    ' codterm_status = ' + vDadosIni.vCodTerminal + ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString));
end;

function TPedVendasRetaguarda.PedVenda_GetFromPedVenda(ANPed: Integer;
  ATipo: string): TReg_PedVenda;
var
  APedVenda: TReg_PedVenda;
  ACampos: TStringList;
  ASql: string;
  I: Integer;
begin
  if (ANPed = 0) or (not vDadosIni.strIn(ATipo, ['ORC'])) then
  begin
    Result := nil;
    Exit;
  end;

  APedVenda := TReg_PedVenda.create;
  ACampos   := APedVenda.GetCamposDaTabela;
  ASql := '';
  for I := 0 to ACampos.Count - 1 do
    ASql := ASql + IfThen(I > 0, ', ', 'select ') + ACampos[I];

  if SqlOpen(ASql + ' from pedvenda' +
    ' where nped = ' + IntToStr(ANPed) +
    ' and tipo = ' + QuotedStr(ATipo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa).IsEmpty then
  begin
    FreeAndNil(APedVenda);
    Result := APedVenda;
    Exit;
  end;

  with APedVenda do
  begin
    cod_nfce         := buscas.FieldByName('cod_nfce').AsInteger;
    nped             := buscas.FieldByName('nped').AsInteger;
    tipo             := buscas.FieldByName('tipo').AsString;
    cod_cliente      := buscas.FieldByName('cod_cliente').AsInteger;
    cod_vendedor     := buscas.FieldByName('cod_vendedor').AsInteger;
    valor_total      := buscas.FieldByName('valor_total').AsFloat;
    cod_cond_pag     := buscas.FieldByName('cod_cond_pag').AsInteger;
    data_ped         := buscas.FieldByName('data_ped').AsDateTime;
    data_fech        := buscas.FieldByName('data_fech').AsDateTime;
    hora_fech        := buscas.FieldByName('hora_fech').AsString;
    desc_p_prod      := buscas.FieldByName('desc_p_prod').AsFloat;
    desc_p_serv      := buscas.FieldByName('desc_p_serv').AsFloat;
    desconto         := buscas.FieldByName('desconto').AsFloat;
    obs_ped          := buscas.FieldByName('obs_ped').AsString;
    status_ped       := buscas.FieldByName('status_ped').AsString;
    tipv             := buscas.FieldByName('tipv').AsString;
    obs_cxl_rq       := buscas.FieldByName('obs_cxl_rq').AsString;
    vl_pago_cxl      := buscas.FieldByName('vl_pago_cxl').AsFloat;
    tipor            := buscas.FieldByName('tipor').AsString;
    horaabertura     := buscas.FieldByName('horaabertura').AsInteger;
    minabertura      := buscas.FieldByName('minabertura').AsInteger;
    horafechamento   := buscas.FieldByName('horafechamento').AsInteger;
    minfechamento    := buscas.FieldByName('minfechamento').AsInteger;
    vl_entrada       := buscas.FieldByName('vl_entrada').AsFloat;
    nprevenda        := buscas.FieldByName('nprevenda').AsInteger;
    acresc_p_prod    := buscas.FieldByName('acresc_p_prod').AsFloat;
    acresc_p_serv    := buscas.FieldByName('acresc_p_serv').AsFloat;
    acrescimo        := buscas.FieldByName('acrescimo').AsFloat;
    tot_prod         := buscas.FieldByName('tot_prod').AsFloat;
    tot_serv         := buscas.FieldByName('tot_serv').AsFloat;
    cpfcgc           := buscas.FieldByName('cpfcgc').AsString;
    libtrava         := buscas.FieldByName('libtrava').AsString;
    subtipo_os       := buscas.FieldByName('subtipo_os').AsString;
    aprovada_gerente := buscas.FieldByName('aprovada_gerente').AsString;
    nome_clientedav  := buscas.FieldByName('nome_clientedav').AsString;
    nome_cli_orc     := buscas.FieldByName('nome_cli_orc').AsString;
    data_libtrava    := buscas.FieldByName('data_libtrava').AsDateTime;
    md5              := buscas.FieldByName('md5').AsString;
    saveauto         := buscas.FieldByName('saveauto').AsString;
    calc             := buscas.FieldByName('calc').AsString;
    data_estoque     := buscas.FieldByName('data_estoque').AsDateTime;
    status_cxl_rq    := buscas.FieldByName('status_cxl_rq').AsString;
    op_cxl           := buscas.FieldByName('op_cxl').AsInteger;
    dia_cxl          := buscas.FieldByName('dia_cxl').AsDateTime;
    ncupom           := buscas.FieldByName('ncupom').AsInteger;
  end;
  FreeAndNil(ACampos);

  if APedVenda.cod_cliente > 0 then
  begin

    if APedVenda.cod_cliente = StrToIntDef(vDadosIni.vCliente.vCodClientePadrao, 0) then
      SqlOpen('select cod_cliente, nome_clientedav nome_cliente, nome_clientedav razao,' +
                 ' cpfcgc, '' '' fone_cliente, '' '' email, end_avl endereco, ' +
      ' '' '' num_end_cliente, '' '' complemento, bairro_avl bairro, cida_avl cidade, '' '' cep' +
      ' from pedvenda' +
      ' where nped = ' + IntToStr(ANPed) +
      ' and tipo = ' + QuotedStr(ATipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa)
    else
      SqlOpen(
        'select cod_cliente, nome_cliente, razao, cpfcgc, fone_cliente, email, endereco, ' +
        ' num_end_cliente, complemento, bairro, cidade, cep' +
        ' from clientes' +
        ' where cod_cliente = ' + IntToStr(APedVenda.cod_cliente) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

    if APedVenda.cod_cliente = StrToIntDef(vDadosIni.vCliente.vCodClientePadrao, 0) then
      SqlOpen('select pv.cod_cliente, pv.nome_clientedav nome_cliente, pv.nome_clientedav razao,' +
        ' pv.cpfcgc, '' '' fone_cliente, '' '' email, pv.end_avl endereco, ' +
        ' '' '' num_end_cliente, '' '' complemento, pv.bairro_avl bairro, pv.cida_avl cidade, pv.cep_avl cep,' +
        ' 9 nfe_indiedest, ''N'' iss_retido, cid.ibge_cod_cidade, pv.esta_avl sigla_uf,' +
        ' es.nome_uf, es.ibge_codigo_uf' +
        ' from pedvenda pv' +
        ' left join cidades cid on cid.nome_cidade = pv.cida_avl' +
        ' left join cidades_ibge cib on cib.codigo_mun_ibge = cid.ibge_cod_cidade' +
        ' left join estados es on es.ibge_codigo_uf = cib.codigo_uf_ibge' +
        ' where pv.nped = ' + IntToStr(ANPed) +
        ' and pv.tipo = ' + QuotedStr(ATipo) +
        ' and pv.cod_empresa = ' + vDadosIni.codEmpresa)
    else
      SqlOpen(
        'select cl.cod_cliente, cl.nome_cliente, cl.razao, cl.cpfcgc, cl.fone_cliente, cl.email, cl.endereco, ' +
        ' cl.num_end_cliente, cl.complemento, cl.bairro, cl.cidade, cl.cep, cl.nfe_indiedest, cl.iss_retido,' +
        ' cid.ibge_cod_cidade, es.sigla_uf, es.nome_uf, es.ibge_codigo_uf' +
        ' from clientes cl' +
        ' left join cidades cid on cid.cod_cidade = cl.cod_cidade' +
        ' left join estados es on es.codigo_uf = cl.codigo_uf' +
        ' where cl.cod_cliente = ' + IntToStr(APedVenda.cod_cliente) +
        ' and cl.cod_empresa = ' + vDadosIni.codEmpresa);

    with buscas do
      with APedVenda.Cliente do
      begin
        Codigo                      := FieldByName('cod_cliente').AsInteger;
        NomeFantasia                := Trim(FieldByName('nome_cliente').AsString);
        RazaoSocial                 := Trim(FieldByName('razao').AsString);
        cpfcnpj                     := Trim(FieldByName('cpfcgc').AsString);
        endereco.Logradouro         := Trim(FieldByName('endereco').AsString);
        endereco.Numero             := Trim(FieldByName('num_end_cliente').AsString);
        endereco.Complemento        := Trim(FieldByName('complemento').AsString);
        endereco.Bairro             := Trim(FieldByName('bairro').AsString);
        endereco.Cidade.Nome        := Trim(FieldByName('cidade').AsString);
        endereco.Cidade.IBGE_Cidade := FieldByName('ibge_cod_cidade').AsInteger;
        endereco.Cidade.UF          := Trim(FieldByName('sigla_uf').AsString);
        endereco.Cidade.Estado      := Trim(FieldByName('nome_uf').AsString);
        endereco.Cidade.IBGE_Estado := FieldByName('ibge_codigo_uf').AsInteger;
        endereco.CEP                := Trim(FieldByName('cep').AsString);
        telefone                    := Trim(FieldByName('fone_cliente').AsString);
        email                       := Trim(FieldByName('email').AsString);
        {
        Codigo := FieldByName('cod_cliente').AsInteger;
        NomeFantasia := FieldByName('nome_cliente').AsString;
        RazaoSocial := FieldByName('razao').AsString;
        cpfcnpj := FieldByName('cpfcgc').AsString;
        endereco := FieldByName('endereco').AsString +
                    IfThen(Trim(FieldByName('endereco').AsString) <> '', ' ' + Trim(FieldByName('endereco').AsString)) +
                    IfThen(Trim(FieldByName('complemento').AsString) <> '', ' ' + Trim(FieldByName('complemento').AsString)) +
                    IfThen(Trim(FieldByName('bairro').AsString) <> '', ', ' + Trim(FieldByName('bairro').AsString)) +
                    IfThen(Trim(FieldByName('cidade').AsString) <> '', ', ' + Trim(FieldByName('cidade').AsString)) +
                    IfThen(Trim(FieldByName('cep').AsString) <> '', ' - ' + Trim(FieldByName('cep').AsString));
        telefone := FieldByName('fone_cliente').AsString;
        email := FieldByName('email').AsString;
        }
      end;
  end;

  ACampos   := APedVenda.Prod.GetCamposDaTabela;
  ASql := '';
  for I := 0 to ACampos.Count - 1 do
    ASql := ASql + IfThen(I > 0, ', ', 'select ') + ACampos[I];

  SqlOpen(ASql + ' from pedvenda_prod' +
    ' where nped = ' + IntToStr(ANPed) +
    ' and tipo = ' + QuotedStr(ATipo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by nitem');

  buscas.First;
  while not buscas.Eof do
  begin
    with APedVenda.Prod.New do
    begin
      grupo_prod      := buscas.FieldByName('grupo_prod').AsInteger;
      cod_prod        := buscas.FieldByName('cod_prod').AsString;
      nitem           := buscas.FieldByName('nitem').AsInteger;
      cod_grade       := buscas.FieldByName('cod_grade').AsInteger;
      codigo_nop      := buscas.FieldByName('codigo_nop').AsFloat;
      num_fab_prod    := buscas.FieldByName('num_fab_prod').AsString;
      descr_prod_ped  := buscas.FieldByName('descr_prod_ped').AsString;
      quant_ped_item  := buscas.FieldByName('quant_ped_item').AsFloat;
      vlun_ped_item   := buscas.FieldByName('vlun_ped_item').AsFloat;
      vltot_ped_item  := buscas.FieldByName('vltot_ped_item').AsFloat;
      vlun_orig       := buscas.FieldByName('vlun_orig').AsFloat;
      vlun_ped_nf     := buscas.FieldByName('vlun_ped_nf').AsFloat;
      rateio_desc     := buscas.FieldByName('rateio_desc').AsFloat;
      rateio_acresc   := buscas.FieldByName('rateio_acresc').AsFloat;
      ratdsas         := buscas.FieldByName('ratdsas').AsFloat;
      comiss_prod     := buscas.FieldByName('comiss_prod').AsFloat;
      comiss_prod_ger := buscas.FieldByName('comiss_prod_ger').AsFloat;
      pcust_c         := buscas.FieldByName('pcust_c').AsFloat;
      pcust_mc        := buscas.FieldByName('pcust_mc').AsFloat;
      tp_nf_ped       := buscas.FieldByName('tp_nf_ped').AsString;
      sit_atd         := buscas.FieldByName('sit_atd').AsString;
      desc_item       := buscas.FieldByName('desc_item').AsFloat;
      acresc_item     := buscas.FieldByName('acresc_item').AsFloat;
      cod_vendedor    := buscas.FieldByName('cod_vendedor').AsInteger;
      data_transf     := buscas.FieldByName('data_transf').AsDateTime;
      nome_vend       := buscas.FieldByName('nome_vend').AsString;
      vlo_unitario    := buscas.FieldByName('vlo_unitario').AsFloat;
      data_inclusao   := buscas.FieldByName('data_inclusao').AsDateTime;
      tp_descacres    := buscas.FieldByName('tp_descacres').AsString;
      nat_descacres   := buscas.FieldByName('nat_descacres').AsString;
      valor_descacres := buscas.FieldByName('valor_descacres').AsFloat;
      nitem_nf        := buscas.FieldByName('nitem_nf').AsInteger;
      xped_compra     := buscas.FieldByName('xped_compra').AsString;
      nitemped_compra := buscas.FieldByName('nitemped_compra').AsInteger;
      vl_desp_nf      := buscas.FieldByName('vl_desp_nf').AsFloat;
      unidade         := buscas.FieldByName('unidade').AsString;
      icm_prod        := buscas.FieldByName('icm_prod').AsFloat;
      sit_trib        := buscas.FieldByName('sit_trib').AsString;
      md5             := buscas.FieldByName('md5').AsString;
      vltot_ped_nf    := buscas.FieldByName('vltot_ped_nf').AsFloat;
      tabpraticada    := buscas.FieldByName('tabpraticada').AsString;
      precoporqtde    := buscas.FieldByName('precoporqtde').AsString;
    end;

    buscas.Next;
  end;

  SqlOpen(
    ' select fp.seqform, fp.ndoc, fp.tipdoc, fp.cod_controle, fp.n_aut_cart, fp.data_mov, fp.prcss,' +
    ' ctrl.nfce_tpag, ctrl.nfce_tband, ctrl.nome_ctrl, ctrl.docs,' +
    ' ctrl.cartao_sped_part, cl.cpfcgc, ' +
    ' fp.valordoc' +
    ' from formpagamento fp' +
    ' left join controles ctrl on ctrl.codigo_ctrl = fp.cod_controle and ctrl.codigo_emp = fp.cod_empresa' +
    ' left join clientes cl on cl.cod_cliente = ctrl.cartao_sped_part and cl.cod_empresa = ctrl.codigo_emp' +
    ' where fp.nrequisicao = ' + IntToStr(ANPed) +
    ' and fp.tpdocs = ' + QuotedStr(ATipo) +
    ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by 1');

  buscas.First;
  while not buscas.Eof do
  begin
    with APedVenda.Pagamento.New do
    begin
      seqform                    := buscas.FieldByName('seqform').AsInteger;
      ndoc                       := buscas.FieldByName('ndoc').AsString;
      tipdoc                     := buscas.FieldByName('tipdoc').AsString;
      valordoc                   := buscas.FieldByName('valordoc').AsFloat;
      n_aut_cart                 := buscas.FieldByName('n_aut_cart').AsString;
      data_mov                   := buscas.FieldByName('data_mov').AsDateTime;
      prcss                      := buscas.FieldByName('n_aut_cart').AsString;
      Controle.codigo_ctrl       := buscas.FieldByName('cod_controle').AsInteger;
      Controle.nome_ctrl         := buscas.FieldByName('nome_ctrl').AsString;
      Controle.docs              := buscas.FieldByName('docs').AsString;
      Controle.nfce_tpag         := buscas.FieldByName('nfce_tpag').AsInteger;
      Controle.nfce_tband        := buscas.FieldByName('nfce_tband').AsInteger;
      Controle.AdmCartao.Codigo  := buscas.FieldByName('cartao_sped_part').AsInteger;
      Controle.AdmCartao.cpfcnpj := Trim(buscas.FieldByName('cpfcgc').AsString);
    end;
    buscas.Next;
  end;
  buscas.Close;

  for I := 0 to APedVenda.Prod.Count - 1 do
    with APedVenda.Prod.Items[I] do
      if (rateio_desc > 0) and (rateio_acresc > 0) then
        if rateio_desc = rateio_acresc then
        begin
          rateio_desc   := 0;
          rateio_acresc := 0;
        end
        else if rateio_desc > rateio_acresc then
        begin
          rateio_desc   := rateio_desc - rateio_acresc;
          rateio_acresc := 0;
        end
        else
        begin
          rateio_acresc := rateio_acresc - rateio_desc;
          rateio_desc   := 0;
        end;

  Result := APedVenda;
end;

procedure TPedVendasRetaguarda.SetDadosCliente(const Value: RDadosCliente);
begin
  FDadosCliente := Value;
end;

function TPedVendasRetaguarda.marcarVendaParaCupom: boolean;
begin
  inibeErro := 'S';
  buscas.Close;
  buscas.SQL.Text := 'update pedvenda set status_cupom = ''P'',codterm_status = ' +
    vDadosIni.vCodTerminal + ' where nped = ' + dataSet.FieldByName('nped').AsString +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString);
  try buscas.ExecSQL; except end;
  CommitaTransacao;
  Result := True;

//  Result := ExecutaComandosSql('select nped from pedvenda where nped = ' +
//    dataSet.FieldByName('nped').AsString +
//    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and status_cupom = ''P'' and' +
//    ' codterm_status = ' + vDadosIni.vCodTerminal + ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString));
end;

procedure TPedVendasRetaguarda.sincronizaCupomNoRetaguarda_nao_usar(codTerminal, codEmpresa: Integer; dataIni, dataFim:
  string;
  vprogres: TProgressBar);
var
  cupom, cupom2, PV, ProdPV, ServPV: TClientDataSet;
  vTipo: string;
  dataNow: TDateTime;
  vrTotProd, vrTotServ, vrTotal: Currency;
  editar: Boolean;
  nitem: Integer;
  nPedVenda: Integer;
  vTipodll: string;

  // variáveis utilizadas no calculo do preço de venda dos Indices Técnicos.
  vPCTIndice  : Currency;
  vPVProd : Currency;
  vQtdeIndice : Currency;
  vPCIndice : Currency;
  vPVTIndice : Currency;
  vPVUIndice : Currency;
begin
  if vDadosIni.bancoConectado = 'local' then
    exit;
//  if (vDadosIni.vModoSistema <> '') and (vDadosIni.vModoSistema <> 'N') then
//    apagarVendasRetaguarda := 'N';
  if not dtmAtivo.bancoHw.Connected then
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, false) then
      Exit;
  cupom := TClientDataSet(dtmDAVF.cdsCP);
  cupom2 := TClientDataSet(dtmDAVF.cdsCP2);
  PV := TClientDataSet(dtmDAVF.cdsPV);
  ProdPV := TClientDataSet(dtmDAVF.cdsProdPV);
  ServPV := TClientDataSet(dtmDAVF.cdsServPV);

  if dtmDAVF.ibTransCp.InTransaction then
    dtmDAVF.ibTransCp.Commit;
  dtmDAVF.ibTransCp.StartTransaction;
  CommitaTransacao;
  IniciaTransacao;
  cupom.Close;
  cupom.CommandText := 'select * from cupom where data >= :data1 and data <= :data2' +
    ' and cod_terminal = ' + IntToStr(codTerminal) + ' and cod_empresa = ' + IntToStr(codEmpresa) +
    ' and (((prevenda is null) or (prevenda = 0)) and (coalesce(paf_num_prevenda, 0) = 0))';
  cupom.Params[0].AsDate := StrToDate(dataIni);
  cupom.Params[1].AsDate := StrToDate(dataFim);
  cupom.Open;
  if cupom.IsEmpty then
    Exit;
  vprogres.Min := 0;
  vprogres.Position := 0;
  vprogres.Max := cupom.RecordCount;
  while not cupom.Eof do
  begin
    cupom2.Close;
    cupom2.CommandText := 'select * from cupom2 where cod_terminal = ' +
      cupom.FieldByName('cod_terminal').AsString + ' and nserieecf = ' +
      QuotedStr(cupom.FieldByName('nserieecf').AsString) + ' and cod_empresa = ' +
      cupom.FieldByName('cod_empresa').AsString + ' and ordem = ' +
      cupom.FieldByName('registro').AsString;
    cupom2.Open;
    if not cupom2.IsEmpty then
    begin
      vTipo := 'REQ';
      cupom2.First;
      while not cupom2.Eof do
      begin
        if (cupom2.FieldByName('PROD_SERV').AsString = 'S') and
          ((cupom2.FieldByName('status_it').AsString <> 'CANCELADO') and
          (cupom2.FieldByName('status_it').IsNull)) then
        begin
          vTipo := 'OS';
          Break;
        end;
        cupom2.Next;
      end;

      PV.Close;
      PV.CommandText := 'select * from pedvenda where cod_empresa = ' + IntToStr(codEmpresa) +
        ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' + cupom.FieldByName('cupom').AsString +
        ' and nserieecf = ' + QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString))+
        ' and operador = ' + vDadosIni.vCodTerminal;
      PV.Open;
      if cupom.FieldByName('status_cp').AsString = 'CANCELADO' then
      begin
        if not pv.IsEmpty then
        begin
          if apagarVendasRetaguarda <> 'N' then
          begin

            /// Anter de apagar a venda o select armazena os produtos da venda
            ///  Logo abaixo a venda é apagada e para cada item que tem seu estoque alterado
            ///  o sistema gera o novo valor do md5 para o campo
            ProdPV.Close;
            ProdPV.CommandText := 'select * from pedvenda_prod where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ProdPV.Open;

            ExecutaComandosSqlExec('delete from pedvenda where cod_empresa = ' + IntToStr(codEmpresa)
              + ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' +
              cupom.FieldByName('cupom').AsString
              + ' and nserieecf = ' +
              QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString)));

          end;

          if vTipo = 'REQ' then
          begin
            if apagarVendasRetaguarda <> 'N' then
            begin

              if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
                if not ExecutaComandosSql('select nreq from reqvenda ' +
                  ' where nreq = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                  ' and cod_empresa = ' +  vDadosIni.codEmpresa) then
                  VoltaEstoque(ProdPV);

              ExecutaComandosSqlExec('delete from reqvenda where cod_empresa = ' +
                IntToStr(codEmpresa)
                + ' and ncupom = ' + cupom.FieldByName('cupom').AsString +
                ' and nserieecf = ' +
                QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString)));
            end;
          end
          else
          begin
            if apagarVendasRetaguarda <> 'N' then
            begin

              if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
                if not ExecutaComandosSql('select n_os from ordem_serv ' +
                  ' where n_os = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa) then
                  VoltaEstoque(ProdPV);

              ExecutaComandosSqlExec('delete from ordem_serv where cod_empresa = ' +
                IntToStr(codEmpresa) +
                ' and ncupom = ' + cupom.FieldByName('cupom').AsString +
                ' and nserieecf = ' +
                QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString)));
            end;
          end;
          CommitaTransacao;

          if apagarVendasRetaguarda <> 'N' then
          begin
            ProdPV.First;
            while not ProdPV.Eof do
            begin
              vMD5Func._gravaMD5_Produtos(buscas, ProdPV.FieldByName('grupo_prod').AsInteger,
                ProdPV.FieldByName('cod_prod').AsString);
              ProdPV.Next;
            end;
          end;

          IniciaTransacao;
        end;
        PV.close;
      end
      else
      begin
        if pv.IsEmpty then
        begin
          try
            IniciaTransacao;
            PV.Insert;
            if vTipo = 'REQ' then
              PV.FieldByName('NPED').AsInteger :=
                Gencodigo('REQVENDA', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa)
            else
              PV.FieldByName('NPED').AsInteger :=
                Gencodigo('ORDEM_SERV', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa);
            nPedVenda := PV.FieldByName('NPED').AsInteger;
            PV.FieldByName('COD_EMPRESA').AsInteger := strToint(vDadosIni.codEmpresa);
            PV.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
            PV.FieldByName('HORAABERTURA').AsString := copy(timetostr(time), 1, 2);
            PV.FieldByName('MINABERTURA').AsString := copy(timetostr(time), 4, 2);
            PV.FieldByName('TIPV').AsString := 'V';
            PV.FieldByName('TIPOR').AsString := 'V';
            PV.FieldByName('TIPO').AsString := vTipo; //; 'REQ';
            PV.FieldByName('OBS_PED').AsString := 'CUPOM FISCAL N° ' +
              cupom.FieldByName('CUPOM').AsString;
            if vTipo = 'OS' then
            begin
              PV.FieldByName('OBS_OS').AsString := 'CUPOM FISCAL N° ' +
                cupom.FieldByName('CUPOM').AsString;
              PV.FieldByName('tipo_os').AsString := 'CLIENTE';
            end;
            PV.FieldByName('DATA_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
            PV.FieldByName('TIPV').AsString := 'V';
            PV.FieldByName('TIPOR').AsString := 'V';
            PV.FieldByName('NCUPOM').AsString := cupom.FieldByName('CUPOM').AsString;
            PV.FieldByName('CCF_CUPOM').AsString := cupom.FieldByName('CCF').AsString;
            PV.FieldByName('OPERADOR').AsString := vDadosIni.vCodTerminal;
            PV.FieldByName('ACRESCIMO').AsCurrency := cupom.FieldByName('VALOR_ACRES').AsCurrency;
            PV.FieldByName('DESCONTO').AsCurrency := cupom.FieldByName('VALOR_DESC').AsCurrency;
            PV.FieldByName('NSERIEECF').AsString :=
              vDadosIni.decodifica(cupom.FieldByName('NSERIEECF').AsString);
            try
              if cupom.FieldByName('CLIENTE').AsInteger = 0 then
                PV.FieldByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao
              else
                PV.FieldByName('COD_CLIENTE').AsInteger := cupom.FieldByName('CLIENTE').AsInteger;
            except
              PV.FieldByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao;
            end;
            try
              if cupom.FieldByName('COLABORADOR').AsInteger = 0 then
                PV.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao
              else
                PV.FieldByName('COD_VENDEDOR').AsInteger :=
                  cupom.FieldByName('COLABORADOR').AsInteger;
            except
              PV.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao;
            end;
            PV.FieldByName('COD_cond_pag').AsString :=
              retornaValor('select cod_cond_pag as valor from cond_pag where ' +
              ' desc_cond_pag like ' + QuotedStr('%' + 'ISTA' + '%'));
            PV.FieldByName('DATA_FECH').AsDateTime := PV.FieldByName('DATA_PED').AsDateTime;

            ProdPV.Close;
            ProdPV.CommandText := 'select * from pedvenda_prod where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ProdPV.Open;
            ServPV.Close;
            ServPV.CommandText := 'select * from pedvenda_serv where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ServPV.Open;

            vrTotProd := 0;
            vrTotServ := 0;
            vrTotal := 0;
            nitem := 0;
            cupom2.First;
            while not cupom2.Eof do
            begin
              if (cupom2.FieldByName('PROD_SERV').AsString = 'P') and
                ((cupom2.FieldByName('status_it').AsString <> 'CANCELADO') and
                (cupom2.FieldByName('status_it').IsNull)) then
              begin
                //verifica se Produto do cupom2 é tipo_item = 04
                buscas.Close;
                buscas.SQL.Clear;
                buscas.SQL.Add('select grupo_prod, cod_prod from produtos '+
                               'where cod_prod = '+QuotedStr(cupom2.FieldByName('cod_prod').AsString)+
                               'and grupo_prod = '+ cupom2.FieldByName('grupo_prod').AsString +
                               'and cod_empresa = '+ pv.FieldByName('cod_empresa').AsString +
                               'and tipo_item = ''04'' ');
                buscas.Open;

                if not buscas.IsEmpty then
                begin
                   // pesquisa o indice tecinico do produto.
                   buscas.Close;
                   buscas.SQL.Clear;
                   buscas.SQL.Add('select it.* , pr.* '+
                                  'from indice_tecnico it '+
                                  'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
                                  'where it.grupo_prod_acabado = '+ cupom2.FieldByName('grupo_prod').AsString +
                                  'and it.cod_prod_acabado = '+ QuotedStr(cupom2.FieldByName('cod_prod').AsString) +
                                  'and it.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString );
                   buscas.Open;
                end;


                if not buscas.IsEmpty then
                begin
                   // pesquisa o indice tecinico do produto.
//                   buscas.Close;
//                   buscas.SQL.Clear;
//                   buscas.SQL.Add('select it.* , pr.* '+
//                                  'from indice_tecnico it '+
//                                  'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
//                                  'where it.grupo_prod_acabado = '+ cupom2.FieldByName('grupo_prod').AsString +' '+
//                                  'and it.cod_prod_acabado = '+ cupom2.FieldByName('cod_prod').AsString +' '+
//                                  'and it.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString +' ');
//                   buscas.Open;

                   // buscas vai conter as materias primas que serão adicionadas no ProdPV.
                   if not buscas.IsEmpty then
                   begin

                       vQtdeIndice := 0;
                       vPCIndice := 0;
                       vPCTIndice := 0;

                       buscas.First;
                       while not buscas.Eof do
                       begin
                          vQtdeIndice := 0;
                          vPCIndice := 0;

                          vQtdeIndice := cupom2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat;  // 1 KG de Pão
                          if buscas.FieldByName('prec_cusm_prod').AsFloat > 0 then
                            vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice
                          else
                            vPCIndice := 1;

                          vPCTIndice := vPCTIndice + vPCIndice;  // 1,80  // Preço custo total dos Indices
                          buscas.Next;
                       end;

                       buscas.First;
                       while not buscas.Eof do
                       begin

                          editar := false;
                          ProdPV.First;
                          if vDadosIni.vModoCompatibilidade = 'S' then
                          begin
                            while not ProdPV.Eof do
                            begin
                              if (buscas.FieldByName('grupo_prod').AsInteger =
                                ProdPV.FieldByName('grupo_prod').AsInteger) and
                                (trim(buscas.FieldByName('cod_prod').AsString) =
                                trim(ProdPV.FieldByName('cod_prod').AsString)) then
                              begin
                                editar := true;
                                break;
                              end;
                              ProdPV.Next;
                            end;
                          end;

                          vPVProd := 0;
                          vQtdeIndice := 0;
                          vPCIndice := 0;
                          vPVTIndice := 0;
                          vPVUIndice := 0;

                          //Inserir ou Editar Indices Técnicos no lugar do produto acabado.

                          vPVProd := cupom2.FieldByName('QUANTIDADE').AsFloat * cupom2.FieldByName('preco').AsFloat; //3,45   //Preço de Venda Prod. Acabado
                          vQtdeIndice := cupom2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat; //0,3  //Qtde Vendida Indice
                          try
                            vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice; // 0,90  //Preço de Custo do Indice
                          except
                            vPCIndice := 1;
                          end;
                          vPVTIndice := (( vPVProd * vPCIndice ) / vPCTIndice );  //1,725  //Valor Total ( pv ) do Indice;
                          vPVUIndice := vPVTIndice / vQtdeIndice;  //5,75  //valor Unitario ( pv) do Indice;

                          if editar then
                          begin
                            ProdPV.Edit;
                            ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                              ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat +
                              vQtdeIndice;

                            ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency :=
                              ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                              vPVTIndice;

                            if cupom2.FieldByName('RAT_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                                 ((cupom2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                                 ((cupom2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('PERC_DESC').AsFloat <> 0 then
                            begin
                               ProdPV.FieldByName('DESC_ITEM').AsCurrency :=
                                 ProdPV.FieldByName('DESC_ITEM').AsCurrency +
                                 ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                               ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                                 ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                            end;

                            if cupom2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                            begin
                               ProdPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                                 ProdPV.FieldByName('ACRESC_ITEM').AsCurrency +
                                 ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                               ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                                 ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                            end;

                            vrTotProd := vrTotProd + vQtdeIndice *
                              vPVUIndice;

                            vrTotal := vrTotal + ( vQtdeIndice * vPVUIndice) -
                              ((cupom2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd) +
                              ((cupom2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd) -
                              ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd) +
                              ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                          end
                          else
                          begin
                            ProdPV.Insert;
                            inc(nitem);

                            ProdPV.FieldByName('cod_empresa').AsString :=
                              PV.FieldByName('cod_empresa').AsString;
                            ProdPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                            ProdPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                            ProdPV.FieldByName('COD_VENDEDOR').AsInteger := PV.FieldByName('COD_VENDEDOR').AsInteger;

                            ProdPV.FieldByName('GRUPO_PROD').AsInteger :=
                              buscas.FieldByName('GRUPO_PROD').AsInteger;

                            ProdPV.FieldByName('COD_PROD').AsString :=
                              buscas.FieldByName('COD_PROD').AsString;

                            ProdPV.FieldByName('COD_GRADE').AsInteger := 0;
                            ProdPV.FieldByName('CODIGO_NOP').AsFloat := nitem;
                            ProdPV.FieldByName('DESCR_PROD_PED').AsString :=
                              buscas.FieldByName('DESCR_PROD').AsString;

                            ProdPV.FieldByName('NUM_FAB_PROD').AsString :=
                              buscas.FieldByName('num_fab_prod').AsString;

                            ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                              vQtdeIndice;

                            ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat :=
                              vPVUIndice;

                            ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                              ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat;

                            ProdPV.FieldByName('VLUN_ORIG').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat;

                            ProdPV.FieldByName('VLUN_PED_NF').AsFloat := vPVUIndice;

                            ProdPV.FieldByName('VLTOT_PED_NF').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                              vPVUIndice;

                            if cupom2.FieldByName('RAT_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_DESC').AsFloat :=
                                 ((cupom2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                                 ((cupom2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                            // Obs : olhar com JP de onde  tirar esta aliquota para materia prima.
                            ProdPV.FieldByName('ALIQUOTA_CP').AsString :=
                              cupom2.FieldByName('ALIQUOTA_IT').AsString;

                            ProdPV.FieldByName('TP_NF_PED').AsString := '2';
                            ProdPV.FieldByName('SIT_ATD').AsString := 'NT';

                            if cupom2.FieldByName('PERC_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('DESC_ITEM').AsFloat :=
                                 ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                               ProdPV.FieldByName('ACRESC_ITEM').AsFloat :=
                                 ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                            ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                              ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                              ProdPV.FieldByName('DESC_ITEM').AsCurrency;

                            ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                              ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                              ProdPV.FieldByName('ACRESC_ITEM').AsCurrency;

                            ProdPV.FieldByName('nitem').AsInteger := nItem;
                            ProdPV.FieldByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                            ProdPV.FieldByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;

                            ProdPV.Post;
                            vrTotProd := vrTotProd + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat;
                            vrTotal := vrTotal + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat -
                              ProdPV.FieldByName('RATEIO_DESC').AsFloat +
                              ProdPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                              //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                              //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;
                          end;
                          buscas.next;
                       end;
                   end;
                end
                else
                begin

                  // se não for Produto acabado ( tipo_item = 04) vai fazer o processo normal.
                  editar := false;
                  ProdPV.First;
                  if vDadosIni.vModoCompatibilidade = 'S' then
                    while not ProdPV.Eof do
                    begin
                      if (cupom2.FieldByName('grupo_prod').AsInteger =
                        ProdPV.FieldByName('grupo_prod').AsInteger) and
                        (trim(cupom2.FieldByName('cod_prod').AsString) =
                        trim(ProdPV.FieldByName('cod_prod').AsString)) then
                      begin
                        editar := true;
                        break;
                      end;
                      ProdPV.Next;
                    end;
                  if editar then
                  begin
                    ProdPV.Edit;
                    ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                      ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat +
                      cupom2.FieldByName('QUANTIDADE').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency :=
                      ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                      (cupom2.FieldByName('quantidade').AsFloat *
                      cupom2.FieldByName('PRECO').AsCurrency);
                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      cupom2.FieldByName('RAT_DESC').AsCurrency;
                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      cupom2.FieldByName('RAT_ACRES').AsCurrency;
                    ProdPV.FieldByName('DESC_ITEM').AsCurrency :=
                      ProdPV.FieldByName('DESC_ITEM').AsCurrency +
                      cupom2.FieldByName('PERC_DESC').AsCurrency;
                    ProdPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                      ProdPV.FieldByName('ACRESC_ITEM').AsCurrency +
                      cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      cupom2.FieldByName('PERC_DESC').AsCurrency;

                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                    vrTotProd := vrTotProd + (cupom2.FieldByName('quantidade').AsFloat *
                      cupom2.FieldByName('PRECO').AsCurrency);
                    vrTotal := vrTotal + (cupom2.FieldByName('quantidade').AsFloat *
                      cupom2.FieldByName('PRECO').AsCurrency) -
                      cupom2.FieldByName('RAT_DESC').AsCurrency +
                      cupom2.FieldByName('RAT_ACRES').AsCurrency -
                      cupom2.FieldByName('PERC_desc').AsCurrency +
                      cupom2.FieldByName('PERC_ACRESC').AsCurrency;
                  end
                  else
                  begin
                    ProdPV.Insert;
                    inc(nitem);
                    ProdPV.FieldByName('cod_empresa').AsString :=
                      PV.FieldByName('cod_empresa').AsString;
                    ProdPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                    ProdPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                    ProdPV.FieldByName('COD_VENDEDOR').AsInteger := PV.FieldByName('COD_VENDEDOR').AsInteger;
                    ProdPV.FieldByName('GRUPO_PROD').AsInteger :=
                      cupom2.FieldByName('GRUPO_PROD').AsInteger;
                    ProdPV.FieldByName('COD_PROD').AsString :=
                      cupom2.FieldByName('COD_PROD').AsString;
                    ProdPV.FieldByName('COD_GRADE').AsInteger := 0;
                    ProdPV.FieldByName('CODIGO_NOP').AsFloat := nitem;
                    ProdPV.FieldByName('DESCR_PROD_PED').AsString :=
                      cupom2.FieldByName('DESCR_IT').AsString;
                    ProdPV.FieldByName('NUM_FAB_PROD').AsString :=
                      cupom2.FieldByName('CODBARRA').AsString;
                    ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                      cupom2.FieldByName('QUANTIDADE').AsFloat;
                    ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat :=
                      cupom2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                      ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat;
                    ProdPV.FieldByName('VLUN_ORIG').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat;
                    ProdPV.FieldByName('VLUN_PED_NF').AsFloat := cupom2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_NF').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                      cupom2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('RATEIO_DESC').AsFloat :=
                      cupom2.FieldByName('RAT_DESC').AsFloat;
                    ProdPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                      cupom2.FieldByName('RAT_ACRES').AsFloat;
                    ProdPV.FieldByName('ALIQUOTA_CP').AsString :=
                      cupom2.FieldByName('ALIQUOTA_IT').AsString;
                    ProdPV.FieldByName('TP_NF_PED').AsString := '2';
                    ProdPV.FieldByName('SIT_ATD').AsString := 'NT';
                    ProdPV.FieldByName('DESC_ITEM').AsFloat :=
                      cupom2.FieldByName('PERC_DESC').AsFloat;
                    ProdPV.FieldByName('ACRESC_ITEM').AsFloat :=
                      cupom2.FieldByName('PERC_ACRESC').AsFloat;

                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      ProdPV.FieldByName('DESC_ITEM').AsCurrency;

                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      ProdPV.FieldByName('ACRESC_ITEM').AsCurrency;

                    ProdPV.FieldByName('nitem').AsInteger := nItem;
                    buscas.Close;
                    buscas.SQL.Text:= ('select pr.PREC_CUS_PROD, pr.PREC_CUSR_PROD, pr.PREC_CUSM_PROD, pr.PREC_CUSMR_PROD,'+
                      ' pr.ICMANT_SUB from  produtos pr'+
                      ' where pr.grupo_prod = '+ cupom2.FieldByName('grupo_prod').AsString +
                      ' and pr.cod_prod = '+ QuotedStr(cupom2.FieldByName('cod_prod').AsString) +
                      ' and pr.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString );
                    buscas.Open;
                    ProdPV.FieldByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                    ProdPV.FieldByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;
                    ProdPV.Post;
                    vrTotProd := vrTotProd + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat;
                    vrTotal := vrTotal + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat -
                      ProdPV.FieldByName('RATEIO_DESC').AsFloat +
                      ProdPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                      //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                      //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;
                  end;
                end;
              end
              else if (cupom2.FieldByName('PROD_SERV').AsString = 'S') and
                ((cupom2.FieldByName('status_it').AsString <> 'CANCELADO') and
                (cupom2.FieldByName('status_it').IsNull)) then
              begin
                editar := false;
                ServPV.First;
                if vDadosIni.vModoCompatibilidade = 'S' then
                  while not ServPV.Eof do
                  begin
                    if (cupom2.FieldByName('grupo_prod').AsInteger =
                      ServPV.FieldByName('cod_servico').AsInteger) then
                    begin
                      editar := true;
                      break;
                    end;
                    ServPV.Next;
                  end;
                if editar then
                begin
                  ServPV.Edit;
                  ServPV.FieldByName('QUANT_SERV_PED').AsFloat :=
                    ServPV.FieldByName('QUANT_SERV_PED').AsFloat +
                    cupom2.FieldByName('QUANTIDADE').AsFloat;
                  ServPV.FieldByName('VALOR_TOT_SERV').AsCurrency :=
                    ServPV.FieldByName('VALOR_TOT_SERV').AsCurrency +
                    (cupom2.FieldByName('quantidade').AsFloat *
                    cupom2.FieldByName('PRECO').AsCurrency);
                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    cupom2.FieldByName('RAT_DESC').AsCurrency;
                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    cupom2.FieldByName('RAT_ACRES').AsCurrency;
                  ServPV.FieldByName('DESC_ITEM').AsCurrency :=
                    ServPV.FieldByName('DESC_ITEM').AsCurrency +
                    cupom2.FieldByName('PERC_DESC').AsCurrency;
                  ServPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                    ServPV.FieldByName('ACRESC_ITEM').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    cupom2.FieldByName('PERC_DESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                  vrTotProd := vrTotProd + (cupom2.FieldByName('quantidade').AsFloat *
                    cupom2.FieldByName('PRECO').AsCurrency);
                  vrTotal := vrTotal + (cupom2.FieldByName('quantidade').AsFloat *
                    cupom2.FieldByName('PRECO').AsCurrency) -
                    cupom2.FieldByName('RAT_DESC').AsCurrency +
                    cupom2.FieldByName('RAT_ACRES').AsCurrency -
                    cupom2.FieldByName('PERC_desc').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;
                end
                else
                begin
                  ServPV.Insert;     
                  inc(nitem);
                  ServPV.FieldByName('cod_empresa').AsString :=
                    PV.FieldByName('cod_empresa').AsString;
                  ServPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                  ServPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                  ServPV.FieldByName('COD_SERVICO').AsInteger :=
                    cupom2.FieldByName('GRUPO_PROD').AsInteger;
                  ServPV.FieldByName('COD_VENDEDOR').AsInteger :=
                    PV.FieldByName('COD_VENDEDOR').AsInteger;
                  ServPV.FieldByName('CODIGO_NOP').AsFloat := nitem;
                  ServPV.FieldByName('QUANT_SERV_PED').AsFloat :=
                    cupom2.FieldByName('QUANTIDADE').AsFloat;
                  ServPV.FieldByName('VALOR_UN_SERV').AsFloat :=
                    cupom2.FieldByName('PRECO').AsFloat;
                  ServPV.FieldByName('VALOR_TOT_SERV').AsFloat :=
                    ServPV.FieldByName('VALOR_UN_SERV').AsFloat *
                    ServPV.FieldByName('QUANT_SERV_PED').AsFloat;
                  ServPV.FieldByName('VLUN_ORIG').AsFloat :=
                    ServPV.FieldByName('VALOR_UN_SERV').AsFloat;
                  ServPV.FieldByName('RATEIO_DESC').AsFloat :=
                    cupom2.FieldByName('RAT_DESC').AsFloat;
                  ServPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                    cupom2.FieldByName('RAT_ACRES').AsFloat;
                  ServPV.FieldByName('DESC_SERV_PED').AsString :=
                    cupom2.FieldByName('DESCR_IT').AsString;
                  ServPV.FieldByName('COD_VENDEDOR1').AsInteger :=
                    PV.FieldByName('COD_VENDEDOR').AsInteger;
                  ServPV.FieldByName('DESC_ITEM').AsFloat :=
                    cupom2.FieldByName('PERC_DESC').AsFloat;
                  ServPV.FieldByName('ACRESC_ITEM').AsFloat :=
                    cupom2.FieldByName('PERC_ACRESC').AsFloat;
                                     
                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    cupom2.FieldByName('PERC_DESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                  ServPV.FieldByName('nitem').AsInteger := nItem;
                  ServPV.Post;
                  vrTotServ := vrTotServ + ServPV.FieldByName('VALOR_TOT_SERV').AsFloat;
                  vrTotal := vrTotal + ServPV.FieldByName('VALOR_TOT_SERV').AsFloat -
                    ServPV.FieldByName('RATEIO_DESC').AsFloat +
                    ServPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                    //ServPV.FieldByName('DESC_ITEM').AsFloat +
                    //ServPV.FieldByName('ACRESC_ITEM').AsFloat;
                end;
              end;
              cupom2.Next;
            end;
            BaixaEstoque(ProdPV);
            dataNow := vDadosIni.getDataHoraBanco(buscas);
            PV.FieldByName('data_fech').AsString := DateToStr(dataNow);
            PV.FieldByName('status_ped').AsString := 'FECHADA';
            PV.FieldByName('HORAFECHAMENTO').AsString := copy(timetostr(dataNow), 1, 2);
            PV.FieldByName('MINFECHAMENTO').AsString := copy(timetostr(dataNow), 4, 2);
            PV.FieldByName('TOT_PROD').AsCurrency := vrTotProd;
            PV.FieldByName('TOT_SERV').AsCurrency := vrTotServ;
            PV.FieldByName('VALOR_TOTAL').AsCurrency := vrTotal;
//            if (((vDadosIni.vEmp.vUsarPreVenda = 'S') and (vTipo = 'REQ')) or
//              ((vDadosIni.vEmp.vUsarPreVendaOS = 'S') and (vTipo = 'OS'))) and
//              (PV.FieldByName('NPREVENDA').AsInteger = 0)  then
//              PV.FieldByName('NPREVENDA').AsInteger:=Gencodigo('PREVENDA', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa);

            PV.Post;
            pv.ApplyUpdates(0);
            if ProdPV.ChangeCount > 0 then
              ProdPV.ApplyUpdates(0);
            if ServPV.ChangeCount > 0 then
              ServPV.ApplyUpdates(0);
            CommitaTransacao;
            vTipodll := 'REQVENDA';
            if vTipo = 'OS' then
              vTipodll := 'ORDEM_SERV';
            ProdPV.First;
            while not ProdPV.Eof do
            begin
              vMD5Func._gravaMD5_Produtos(buscas, ProdPV.FieldByName('grupo_prod').AsInteger,
                ProdPV.FieldByName('cod_prod').AsString);
              ProdPV.Next;
            end;
            
          except
            on e: exception do begin
              RollBackTransacao;
              registraErro('Erro ao enviar para retaguarda cupom ' +
                cupom.FieldByName('cupom').AsString + ' Erro: ' + e.Message);
            end;
          end;
        end
        else
        begin
          vTipodll := 'REQVENDA';
          nPedVenda := PV.FieldByName('NPED').AsInteger;
          if vTipo = 'OS' then
            vTipodll := 'ORDEM_SERV';
        end;
      end;
    end;
    cupom.Next;
    vprogres.Position := vprogres.Position + 1;
  end;
end;

procedure TPedVendasRetaguarda.sincronizaCupomNoRetaguarda_nao_usar(nCupom: integer;
  vprogres: TProgressBar);
var
  cupom, cupom2, PV, ProdPV, ServPV, IT: TClientDataSet;
  vTipo: string;
  dataNow: TDateTime;
  vrTotProd, vrTotServ, vrTotal: Currency;
  editar: Boolean;
  nItem: Integer;
  nPedVenda: Integer;
  vTipodll: string;

  // variáveis utilizadas no calculo do preço de venda dos Indices Técnicos.
  vPCTIndice  : Currency;
  vPVProd : Currency;
  vQtdeIndice : Currency;
  vPCIndice : Currency;
  vPVTIndice : Currency;
  vPVUIndice : Currency;

  // variaveis utilizadas para criar aquivo
  IndiceTxt : TextFile;
  vQtdeProdTxt : Integer;
  vGerouArquivo : Boolean;

begin
  if vDadosIni.bancoConectado = 'local' then
    exit;
//  if (vDadosIni.vModoSistema = 'S') or (vDadosIni.vModoSistema = 'J')  then
//    exit;
//  if FileExists(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe') then
//    WinExec(Pchar(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe'), SW_SHOWNOACTIVATE);
//  if (vDadosIni.vModoSistema <> '') and (vDadosIni.vModoSistema <> 'N') then
//    apagarVendasRetaguarda := 'N';
  if not dtmAtivo.bancoHw.Connected then
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, false) then
      Exit;
  cupom := TClientDataSet(dtmDAVF.cdsCP);
  cupom2 := TClientDataSet(dtmDAVF.cdsCP2);
  PV := TClientDataSet(dtmDAVF.cdsPV);
  ProdPV := TClientDataSet(dtmDAVF.cdsProdPV);
  ServPV := TClientDataSet(dtmDAVF.cdsServPV);


  if dtmDAVF.ibTransCp.InTransaction then
    dtmDAVF.ibTransCp.Commit;
  dtmDAVF.ibTransCp.StartTransaction;
  CommitaTransacao;
  IniciaTransacao;
  cupom.Close;
  cupom.CommandText := 'select * from cupom where cupom = ' + IntToStr(nCupom) +
    ' and nserieecf = ' + QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf)) +
    ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and (((prevenda is null) or (prevenda = 0)) and (coalesce(paf_num_prevenda, 0) = 0))';
  cupom.Open;
  if cupom.IsEmpty then
    Exit;
  vprogres.Min := 0;
  vprogres.Position := 0;
  while not cupom.Eof do
  begin
    cupom2.Close;
    cupom2.CommandText := 'select * from cupom2 where cod_terminal = ' +
      cupom.FieldByName('cod_terminal').AsString + ' and nserieecf = ' +
      QuotedStr(cupom.FieldByName('nserieecf').AsString) + ' and cod_empresa = ' +
      cupom.FieldByName('cod_empresa').AsString + ' and ordem = ' +
      cupom.FieldByName('registro').AsString;
    cupom2.Open;
    vprogres.Max := cupom.RecordCount + cupom2.RecordCount;
    if not cupom2.IsEmpty then
    begin
      vTipo := 'REQ';
      cupom2.First;
      while not cupom2.Eof do
      begin
        if (cupom2.FieldByName('PROD_SERV').AsString = 'S') and
          ((cupom2.FieldByName('status_it').AsString <> 'CANCELADO') and
          (cupom2.FieldByName('status_it').IsNull)) then
        begin
          vTipo := 'OS';
          Break;
        end;
        cupom2.next;
      end;

      PV.Close;
      PV.CommandText := 'select * from pedvenda where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' + cupom.FieldByName('cupom').AsString +
        ' and nserieecf = ' + QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString))+
        ' and operador = ' + vDadosIni.vCodTerminal ;
      PV.Open;
      if cupom.FieldByName('status_cp').AsString = 'CANCELADO' then
      begin
        if not pv.IsEmpty then
        begin
          if apagarVendasRetaguarda <> 'N' then
          begin

            /// Anter de apagar a venda o select armazena os produtos da venda
            ///  Logo abaixo a venda é apagada e para cada item que tem seu estoque alterado
            ///  o sistema gera o novo valor do md5 para o campo
            ProdPV.Close;
            ProdPV.CommandText := 'select * from pedvenda_prod where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ProdPV.Open;

            ExecutaComandosSqlExec('delete from pedvenda where cod_empresa = ' + vDadosIni.codEmpresa
              + ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' +
              cupom.FieldByName('cupom').AsString +
              ' and nserieecf = ' +
              QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString)));

          end;
          if vTipo = 'REQ' then
          begin
            if apagarVendasRetaguarda <> 'N' then
            begin

              if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
                if not ExecutaComandosSql('select nreq from reqvenda ' +
                  ' where nreq = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa) then
                  VoltaEstoque(ProdPV);
                  
              ExecutaComandosSqlExec('delete from reqvenda where cod_empresa = ' +
                vDadosIni.codEmpresa
                + ' and ncupom = ' + cupom.FieldByName('cupom').AsString +
                ' and nserieecf = ' +
                QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString)));
            end;
          end
          else
          begin
            if apagarVendasRetaguarda <> 'N' then
            begin

              if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
                if not ExecutaComandosSql('select n_os from ordem_serv ' +
                  ' where n_os = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa) then
                  VoltaEstoque(ProdPV);

              ExecutaComandosSqlExec('delete from ordem_serv where cod_empresa = ' +
                vDadosIni.codEmpresa + ' and ncupom = ' + cupom.FieldByName('cupom').AsString +
                ' and nserieecf = ' +
                QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString)));
            end;
          end;
          CommitaTransacao;

          if apagarVendasRetaguarda <> 'N' then
          begin
            ProdPV.First;
            while not ProdPV.Eof do
            begin
              vMD5Func._gravaMD5_Produtos(buscas, ProdPV.FieldByName('grupo_prod').AsInteger,
                ProdPV.FieldByName('cod_prod').AsString);
              ProdPV.Next;
            end;
          end;

          IniciaTransacao;
        end;
        PV.close;
        vprogres.Position := vprogres.Position + 1;
      end
      else
      begin
        if pv.IsEmpty then
        begin
          try
            IniciaTransacao;
            PV.Insert;
            if vTipo = 'REQ' then
              PV.FieldByName('NPED').AsInteger :=
                Gencodigo('REQVENDA', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa)
            else
              PV.FieldByName('NPED').AsInteger :=
                Gencodigo('ORDEM_SERV', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa);
            nPedVenda := PV.FieldByName('NPED').AsInteger;
            PV.FieldByName('COD_EMPRESA').AsInteger := strToint(vDadosIni.codEmpresa);
            PV.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
            PV.FieldByName('HORAABERTURA').AsString := copy(timetostr(time), 1, 2);
            PV.FieldByName('MINABERTURA').AsString := copy(timetostr(time), 4, 2);
            PV.FieldByName('TIPV').AsString := 'V';
            PV.FieldByName('TIPOR').AsString := 'V';
            PV.FieldByName('TIPO').AsString := vTipo; //; 'REQ';
            PV.FieldByName('OBS_PED').AsString := 'CUPOM FISCAL N° ' +
              cupom.FieldByName('CUPOM').AsString;
            if vTipo = 'OS' then
            begin
              PV.FieldByName('OBS_OS').AsString := 'CUPOM FISCAL N° ' +
                cupom.FieldByName('CUPOM').AsString;
              PV.FieldByName('tipo_os').AsString := 'CLIENTE';
            end;
            PV.FieldByName('DATA_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
            PV.FieldByName('TIPV').AsString := 'V';
            PV.FieldByName('TIPOR').AsString := 'V';
            PV.FieldByName('NCUPOM').AsString := cupom.FieldByName('CUPOM').AsString;
            PV.FieldByName('CCF_CUPOM').AsString := cupom.FieldByName('CCF').AsString;
            PV.FieldByName('DATA_CUPOM').AsDateTime := cupom.FieldByName('DATA').AsDateTime;
            PV.FieldByName('OPERADOR').AsString := vDadosIni.vCodTerminal;
            PV.FieldByName('ACRESCIMO').AsCurrency := cupom.FieldByName('VALOR_ACRES').AsCurrency;
            PV.FieldByName('DESCONTO').AsCurrency := cupom.FieldByName('VALOR_DESC').AsCurrency;
            PV.FieldByName('NSERIEECF').AsString :=
              vDadosIni.decodifica(cupom.FieldByName('NSERIEECF').AsString);
            try
              if cupom.FieldByName('CLIENTE').AsInteger = 0 then
                PV.FieldByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao
              else
                PV.FieldByName('COD_CLIENTE').AsInteger := cupom.FieldByName('CLIENTE').AsInteger;
            except
              PV.FieldByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao;
            end;
            try
              if cupom.FieldByName('COLABORADOR').AsInteger = 0 then
                PV.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao
              else
                PV.FieldByName('COD_VENDEDOR').AsInteger :=
                  cupom.FieldByName('COLABORADOR').AsInteger;
            except
              PV.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao;
            end;
            PV.FieldByName('COD_cond_pag').AsString :=
              retornaValor('select cod_cond_pag as valor from cond_pag where ' +
              ' desc_cond_pag like ' + QuotedStr('%' + 'ISTA' + '%'));
            PV.FieldByName('DATA_FECH').AsDateTime := PV.FieldByName('DATA_PED').AsDateTime;

            ProdPV.Close;
            ProdPV.CommandText := 'select * from pedvenda_prod where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ProdPV.Open;
            ServPV.Close;
            ServPV.CommandText := 'select * from pedvenda_serv where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ServPV.Open;

            vrTotProd := 0;
            vrTotServ := 0;
            vrTotal := 0;
            nItem := 0;
            cupom2.First;
            while not cupom2.Eof do
            begin
              if (cupom2.FieldByName('PROD_SERV').AsString = 'P') and
                ((cupom2.FieldByName('status_it').AsString <> 'CANCELADO') and
                (cupom2.FieldByName('status_it').IsNull)) then
              begin

                //verifica se Produto do cupom2 é tipo_item = 04
                buscas.Close;
                buscas.SQL.Clear;
                buscas.SQL.Add('select grupo_prod, cod_prod from produtos '+
                               'where cod_prod = '+QuotedStr(cupom2.FieldByName('cod_prod').AsString)+
                               'and grupo_prod = '+ cupom2.FieldByName('grupo_prod').AsString +
                               'and cod_empresa = '+ pv.FieldByName('cod_empresa').AsString +
                               'and tipo_item = ''04'' ');
                buscas.Open;

                if not buscas.IsEmpty then
                begin
                   // pesquisa o indice tecinico do produto.
                   buscas.Close;
                   buscas.SQL.Clear;
                   buscas.SQL.Add('select it.* , pr.* '+
                                  'from indice_tecnico it '+
                                  'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
                                  'where it.grupo_prod_acabado = '+ cupom2.FieldByName('grupo_prod').AsString +
                                  'and it.cod_prod_acabado = '+ QuotedStr(cupom2.FieldByName('cod_prod').AsString) +
                                  'and it.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString );
                   buscas.Open;
                end;


                if not buscas.IsEmpty then
                begin
                   // pesquisa o indice tecinico do produto.
//                   buscas.Close;
//                   buscas.SQL.Clear;
//                   buscas.SQL.Add('select it.* , pr.* '+
//                                  'from indice_tecnico it '+
//                                  'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
//                                  'where it.grupo_prod_acabado = '+ cupom2.FieldByName('grupo_prod').AsString +' '+
//                                  'and it.cod_prod_acabado = '+ cupom2.FieldByName('cod_prod').AsString +' '+
//                                  'and it.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString +' ');
//                   buscas.Open;

                   // buscas vai conter as materias primas que serão adicionadas no ProdPV.
                   if not buscas.IsEmpty then
                   begin

                       vQtdeIndice := 0;
                       vPCIndice := 0;
                       vPCTIndice := 0;

                       buscas.First;
                       while not buscas.Eof do
                       begin
                          vQtdeIndice := 0;
                          vPCIndice := 0;

                          vQtdeIndice := cupom2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat;  // 1 KG de Pão
                          if buscas.FieldByName('prec_cusm_prod').AsFloat > 0 then
                            vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice
                          else
                            vPCIndice := 1;

                          vPCTIndice := vPCTIndice + vPCIndice;  // 1,80  // Preço custo total dos Indices
                          buscas.Next;
                       end;

                       buscas.First;
                       while not buscas.Eof do
                       begin

                          editar := false;
                          ProdPV.First;
                          if vDadosIni.vModoCompatibilidade = 'S' then
                          begin
                            while not ProdPV.Eof do
                            begin
                              if (buscas.FieldByName('grupo_prod').AsInteger =
                                ProdPV.FieldByName('grupo_prod').AsInteger) and
                                (trim(buscas.FieldByName('cod_prod').AsString) =
                                trim(ProdPV.FieldByName('cod_prod').AsString)) then
                              begin
                                editar := true;
                                break;
                              end;
                              ProdPV.Next;
                            end;
                          end;

                          vPVProd := 0;
                          vQtdeIndice := 0;
                          vPCIndice := 0;
                          vPVTIndice := 0;
                          vPVUIndice := 0;

                          //Inserir ou Editar Indices Técnicos no lugar do produto acabado.

                          vPVProd := cupom2.FieldByName('QUANTIDADE').AsFloat * cupom2.FieldByName('preco').AsFloat; //3,45   //Preço de Venda Prod. Acabado
                          vQtdeIndice := cupom2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat; //0,3  //Qtde Vendida Indice
                          try
                            vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice; // 0,90  //Preço de Custo do Indice
                          except
                            vPCIndice := 1;
                          end;

                          vPVTIndice := (( vPVProd * vPCIndice ) / vPCTIndice );  //1,725  //Valor Total ( pv ) do Indice;
                          vPVUIndice := vPVTIndice / vQtdeIndice;  //5,75  //valor Unitario ( pv) do Indice;

                          if editar then
                          begin
                            ProdPV.Edit;
                            ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                              ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat +
                              vQtdeIndice;

                            ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency :=
                              ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                              vPVTIndice;

                            if cupom2.FieldByName('RAT_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                                 ((cupom2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                                 ((cupom2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('PERC_DESC').AsFloat <> 0 then
                            begin
                               ProdPV.FieldByName('DESC_ITEM').AsCurrency :=
                                 ProdPV.FieldByName('DESC_ITEM').AsCurrency +
                                 ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                               ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                                 ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                            end;

                            if cupom2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                            begin
                               ProdPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                                 ProdPV.FieldByName('ACRESC_ITEM').AsCurrency +
                                 ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                               ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                                 ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                            end;

                            vrTotProd := vrTotProd + vQtdeIndice *
                              vPVUIndice;

                            vrTotal := vrTotal + ( vQtdeIndice * vPVUIndice) -
                              ((cupom2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd) +
                              ((cupom2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd) -
                              ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd) +
                              ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                          end
                          else
                          begin
                            ProdPV.Insert;
                            inc(nitem);

                            ProdPV.FieldByName('cod_empresa').AsString :=
                              PV.FieldByName('cod_empresa').AsString;
                            ProdPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                            ProdPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                            ProdPV.FieldByName('COD_VENDEDOR').AsInteger := PV.FieldByName('COD_VENDEDOR').AsInteger;

                            ProdPV.FieldByName('GRUPO_PROD').AsInteger :=
                              buscas.FieldByName('GRUPO_PROD').AsInteger;

                            ProdPV.FieldByName('COD_PROD').AsString :=
                              buscas.FieldByName('COD_PROD').AsString;

                            ProdPV.FieldByName('COD_GRADE').AsInteger := 0;
                            ProdPV.FieldByName('CODIGO_NOP').AsFloat := nItem;
                            ProdPV.FieldByName('DESCR_PROD_PED').AsString :=
                              buscas.FieldByName('DESCR_PROD').AsString;

                            ProdPV.FieldByName('NUM_FAB_PROD').AsString :=
                              buscas.FieldByName('num_fab_prod').AsString;

                            ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                              vQtdeIndice;

                            ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat :=
                              vPVUIndice;

                            ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                              ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat;

                            ProdPV.FieldByName('VLUN_ORIG').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat;

                            ProdPV.FieldByName('VLUN_PED_NF').AsFloat := vPVUIndice;

                            ProdPV.FieldByName('VLTOT_PED_NF').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                              vPVUIndice;

                            if cupom2.FieldByName('RAT_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_DESC').AsFloat :=
                                 ((cupom2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                                 ((cupom2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                            // Obs : olhar com JP de onde  tirar esta aliquota para materia prima.
                            ProdPV.FieldByName('ALIQUOTA_CP').AsString :=
                              cupom2.FieldByName('ALIQUOTA_IT').AsString;

                            ProdPV.FieldByName('TP_NF_PED').AsString := '2';
                            ProdPV.FieldByName('SIT_ATD').AsString := 'NT';

                            if cupom2.FieldByName('PERC_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('DESC_ITEM').AsFloat :=
                                 ((cupom2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if cupom2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                               ProdPV.FieldByName('ACRESC_ITEM').AsFloat :=
                                 ((cupom2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                            ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                              ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                              ProdPV.FieldByName('DESC_ITEM').AsCurrency;

                            ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                              ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                              ProdPV.FieldByName('ACRESC_ITEM').AsCurrency;

                            ProdPV.FieldByName('nitem').AsInteger := nItem;
                            ProdPV.FieldByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                            ProdPV.FieldByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;

                            ProdPV.Post;
                            vrTotProd := vrTotProd + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat;
                            vrTotal := vrTotal + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat -
                              ProdPV.FieldByName('RATEIO_DESC').AsFloat +
                              ProdPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                              //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                              //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;
                          end;
                          buscas.next;
                       end;
                   end;
                end
                else
                begin

                  // se não for Produto acabado ( tipo_item = 04) vai fazer o processo normal.
                  editar := false;
                  ProdPV.First;
                  if vDadosIni.vModoCompatibilidade = 'S' then
                    while not ProdPV.Eof do
                    begin
                      if (cupom2.FieldByName('grupo_prod').AsInteger =
                        ProdPV.FieldByName('grupo_prod').AsInteger) and
                        (trim(cupom2.FieldByName('cod_prod').AsString) =
                        trim(ProdPV.FieldByName('cod_prod').AsString)) then
                      begin
                        editar := true;
                        break;
                      end;
                      ProdPV.Next;
                    end;
                  if editar then
                  begin
                    ProdPV.Edit;
                    ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                      ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat +
                      cupom2.FieldByName('QUANTIDADE').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency :=
                      ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                      (cupom2.FieldByName('quantidade').AsFloat *
                      cupom2.FieldByName('PRECO').AsCurrency);
                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      cupom2.FieldByName('RAT_DESC').AsCurrency;
                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      cupom2.FieldByName('RAT_ACRES').AsCurrency;
                    ProdPV.FieldByName('DESC_ITEM').AsCurrency :=
                      ProdPV.FieldByName('DESC_ITEM').AsCurrency +
                      cupom2.FieldByName('PERC_DESC').AsCurrency;
                    ProdPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                      ProdPV.FieldByName('ACRESC_ITEM').AsCurrency +
                      cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      cupom2.FieldByName('PERC_DESC').AsCurrency;

                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                    vrTotProd := vrTotProd + (cupom2.FieldByName('quantidade').AsFloat *
                      cupom2.FieldByName('PRECO').AsCurrency);
                    vrTotal := vrTotal + (cupom2.FieldByName('quantidade').AsFloat *
                      cupom2.FieldByName('PRECO').AsCurrency) -
                      cupom2.FieldByName('RAT_DESC').AsCurrency +
                      cupom2.FieldByName('RAT_ACRES').AsCurrency -
                      cupom2.FieldByName('PERC_desc').AsCurrency +
                      cupom2.FieldByName('PERC_ACRESC').AsCurrency;
                  end
                  else
                  begin
                    ProdPV.Insert;
                    inc(nitem);
                    ProdPV.FieldByName('cod_empresa').AsString :=
                      PV.FieldByName('cod_empresa').AsString;
                    ProdPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                    ProdPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                    ProdPV.FieldByName('COD_VENDEDOR').AsInteger := PV.FieldByName('COD_VENDEDOR').AsInteger;
                    ProdPV.FieldByName('GRUPO_PROD').AsInteger :=
                      cupom2.FieldByName('GRUPO_PROD').AsInteger;
                    ProdPV.FieldByName('COD_PROD').AsString :=
                      cupom2.FieldByName('COD_PROD').AsString;
                    ProdPV.FieldByName('COD_GRADE').AsInteger := 0;
                    ProdPV.FieldByName('CODIGO_NOP').AsFloat := nItem;
                    ProdPV.FieldByName('DESCR_PROD_PED').AsString :=
                      cupom2.FieldByName('DESCR_IT').AsString;
                    ProdPV.FieldByName('NUM_FAB_PROD').AsString :=
                      cupom2.FieldByName('CODBARRA').AsString;
                    ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                      cupom2.FieldByName('QUANTIDADE').AsFloat;
                    ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat :=
                      cupom2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                      ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat;
                    ProdPV.FieldByName('VLUN_ORIG').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat;
                    ProdPV.FieldByName('VLUN_PED_NF').AsFloat := cupom2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_NF').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                      cupom2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('RATEIO_DESC').AsFloat :=
                      cupom2.FieldByName('RAT_DESC').AsFloat;
                    ProdPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                      cupom2.FieldByName('RAT_ACRES').AsFloat;
                    ProdPV.FieldByName('ALIQUOTA_CP').AsString :=
                      cupom2.FieldByName('ALIQUOTA_IT').AsString;
                    ProdPV.FieldByName('TP_NF_PED').AsString := '2';
                    ProdPV.FieldByName('SIT_ATD').AsString := 'NT';
                    ProdPV.FieldByName('DESC_ITEM').AsFloat :=
                      cupom2.FieldByName('PERC_DESC').AsFloat;
                    ProdPV.FieldByName('ACRESC_ITEM').AsFloat :=
                      cupom2.FieldByName('PERC_ACRESC').AsFloat;

                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      ProdPV.FieldByName('DESC_ITEM').AsCurrency;

                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      ProdPV.FieldByName('ACRESC_ITEM').AsCurrency;

                    ProdPV.FieldByName('nitem').AsInteger := nItem;
                    buscas.Close;
                    buscas.SQL.Text:= ('select pr.PREC_CUS_PROD, pr.PREC_CUSR_PROD, pr.PREC_CUSM_PROD, pr.PREC_CUSMR_PROD,'+
                      ' pr.ICMANT_SUB from  produtos pr'+
                      ' where pr.grupo_prod = '+ cupom2.FieldByName('grupo_prod').AsString +
                      ' and pr.cod_prod = '+ QuotedStr(cupom2.FieldByName('cod_prod').AsString) +
                      ' and pr.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString );
                    buscas.Open;
                    ProdPV.FieldByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                    ProdPV.FieldByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;
                    ProdPV.Post;
                    vrTotProd := vrTotProd + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat;
                    vrTotal := vrTotal + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat -
                      ProdPV.FieldByName('RATEIO_DESC').AsFloat +
                      ProdPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                      //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                      //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;
                  end;
                end;

              end
              else if (cupom2.FieldByName('PROD_SERV').AsString = 'S') and
                ((cupom2.FieldByName('status_it').AsString <> 'CANCELADO') and
                (cupom2.FieldByName('status_it').IsNull)) then
              begin
                editar := false;
                ServPV.First;
                if vDadosIni.vModoCompatibilidade = 'S' then
                  while not ServPV.Eof do
                  begin
                    if (cupom2.FieldByName('grupo_prod').AsInteger =
                      ServPV.FieldByName('cod_servico').AsInteger) then
                    begin
                      editar := true;
                      break;
                    end;
                    ServPV.Next;
                  end;
                if editar then
                begin
                  ServPV.Edit;
                  ServPV.FieldByName('QUANT_SERV_PED').AsFloat :=
                    ServPV.FieldByName('QUANT_SERV_PED').AsFloat +
                    cupom2.FieldByName('QUANTIDADE').AsFloat;
                  ServPV.FieldByName('VALOR_TOT_SERV').AsCurrency :=
                    ServPV.FieldByName('VALOR_TOT_SERV').AsCurrency +
                    (cupom2.FieldByName('quantidade').AsFloat *
                    cupom2.FieldByName('PRECO').AsCurrency);
                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    cupom2.FieldByName('RAT_DESC').AsCurrency;
                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    cupom2.FieldByName('RAT_ACRES').AsCurrency;
                  ServPV.FieldByName('DESC_ITEM').AsCurrency :=
                    ServPV.FieldByName('DESC_ITEM').AsCurrency +
                    cupom2.FieldByName('PERC_DESC').AsCurrency;
                  ServPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                    ServPV.FieldByName('ACRESC_ITEM').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    cupom2.FieldByName('PERC_DESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                  vrTotProd := vrTotProd + (cupom2.FieldByName('quantidade').AsFloat *
                    cupom2.FieldByName('PRECO').AsCurrency);
                  vrTotal := vrTotal + (cupom2.FieldByName('quantidade').AsFloat *
                    cupom2.FieldByName('PRECO').AsCurrency) -
                    cupom2.FieldByName('RAT_DESC').AsCurrency +
                    cupom2.FieldByName('RAT_ACRES').AsCurrency -
                    cupom2.FieldByName('PERC_desc').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;
                end
                else
                begin
                  ServPV.Insert;
                  inc(nItem);
                  ServPV.FieldByName('cod_empresa').AsString :=
                    PV.FieldByName('cod_empresa').AsString;
                  ServPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                  ServPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                  ServPV.FieldByName('COD_SERVICO').AsInteger :=
                    cupom2.FieldByName('GRUPO_PROD').AsInteger;
                  ServPV.FieldByName('COD_VENDEDOR').AsInteger :=
                    PV.FieldByName('COD_VENDEDOR').AsInteger;
                  ServPV.FieldByName('CODIGO_NOP').AsFloat := nItem;
                  ServPV.FieldByName('QUANT_SERV_PED').AsFloat :=
                    cupom2.FieldByName('QUANTIDADE').AsFloat;
                  ServPV.FieldByName('VALOR_UN_SERV').AsFloat :=
                    cupom2.FieldByName('PRECO').AsFloat;
                  ServPV.FieldByName('VALOR_TOT_SERV').AsFloat :=
                    ServPV.FieldByName('VALOR_UN_SERV').AsFloat *
                    ServPV.FieldByName('QUANT_SERV_PED').AsFloat;
                  ServPV.FieldByName('VLUN_ORIG').AsFloat :=
                    ServPV.FieldByName('VALOR_UN_SERV').AsFloat;
                  ServPV.FieldByName('RATEIO_DESC').AsFloat :=
                    cupom2.FieldByName('RAT_DESC').AsFloat;
                  ServPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                    cupom2.FieldByName('RAT_ACRES').AsFloat;
                  ServPV.FieldByName('DESC_SERV_PED').AsString :=
                    cupom2.FieldByName('DESCR_IT').AsString;
                  ServPV.FieldByName('COD_VENDEDOR1').AsInteger :=
                    PV.FieldByName('COD_VENDEDOR').AsInteger;
                  ServPV.FieldByName('DESC_ITEM').AsFloat :=
                    cupom2.FieldByName('PERC_DESC').AsFloat;
                  ServPV.FieldByName('ACRESC_ITEM').AsFloat :=
                    cupom2.FieldByName('PERC_ACRESC').AsFloat;

                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    cupom2.FieldByName('PERC_DESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    cupom2.FieldByName('PERC_ACRESC').AsCurrency;

                  ServPV.FieldByName('nitem').AsInteger := nItem;
                  ServPV.Post;
                  vrTotServ := vrTotServ + ServPV.FieldByName('VALOR_TOT_SERV').AsFloat;
                  vrTotal := vrTotal + ServPV.FieldByName('VALOR_TOT_SERV').AsFloat -
                    ServPV.FieldByName('RATEIO_DESC').AsFloat +
                    ServPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                    //ServPV.FieldByName('DESC_ITEM').AsFloat +
                    //ServPV.FieldByName('ACRESC_ITEM').AsFloat;
                end;
              end;

              cupom2.Next;
              vprogres.Position := vprogres.Position + 1;
            end;


//            // Gerar arquivo IndiceTxt(Ncupom).txt
//            vQtdeProdTxt := 0;
//            cupom2.First;
//            vGerouArquivo := False;
//            while not cupom2.Eof do
//            begin
//                //verifica se Produto do cupom2 é tipo_item = 04
//                buscas.Close;
//                buscas.SQL.Clear;
//                buscas.SQL.Add('select grupo_prod, cod_prod from produtos '+
//                               'where cod_prod = '+ cupom2.FieldByName('cod_prod').AsString +' '+
//                               'and grupo_prod = '+ cupom2.FieldByName('grupo_prod').AsString +' '+
//                               'and cod_empresa = '+ pv.FieldByName('cod_empresa').AsString +' '+
//                               'and tipo_item = 04 ');
//                buscas.Open;
//                if not buscas.IsEmpty then
//                begin
//                   // pesquisa o indice tecinico do produto.
//                   buscas.Close;
//                   buscas.SQL.Clear;
//                   buscas.SQL.Add('select it.* , pr.* '+
//                                  'from indice_tecnico it '+
//                                  'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
//                                  'where it.grupo_prod_acabado = '+ cupom2.FieldByName('grupo_prod').AsString +' '+
//                                  'and it.cod_prod_acabado = '+ cupom2.FieldByName('cod_prod').AsString +' '+
//                                  'and it.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString +' ');
//                   buscas.Open;
//                   buscas.First;
//                   if not buscas.IsEmpty then
//                   begin
//
//                       vQtdeProdTxt := vQtdeProdTxt + 1;
//
//                       if vGerouArquivo = false then
//                       begin
//
//                           AssignFile( IndiceTxt , vDadosIni.vPathArquivosDigitais + '\INDICETEC' +PV.FieldByName('NCUPOM').AsString+ '.txt' );
//                           Rewrite(IndiceTxt);
//                           Append(IndiceTxt);
//
//                           WriteLn(IndiceTxt, ('Empresa  : '+ vDadosIni.vEmp.vnomeEmpresa ));
//                           WriteLn(IndiceTxt, ('CNPJ     : '+ vDadosIni.vEmp.vCNPJ ));
//                           WriteLn(IndiceTxt, ('INSC.EST : '+ vDadosIni.vEmp.vIE ));
//
//                           WriteLn(IndiceTxt, ( vDadosIni.replicate('-', 80) ));
//
//                           // Monta linha do menu.
//                           vDadosIni.AuxStr := vDadosIni.Space(100);
//                           vDadosIni.LimpaLinha(vDadosIni.AuxStr);
//                           vDadosIni.MontaLinha(0003, 'GRUPO' );
//                           vDadosIni.MontaLinha(0011, 'CODIGO' );
//                           vDadosIni.MontaLinha(0020, 'DESCRICAO' );
//                           vDadosIni.MontaLinha(0058, 'UNIDADE' );
//                           vDadosIni.MontaLinha(0068, 'QUANTIDADE' );
//                           WriteLn(IndiceTxt, vDadosIni.auxstr);
//                           vDadosIni.LimpaLinha(vDadosIni.AuxStr);
//
//                           WriteLn(IndiceTxt, ( vDadosIni.replicate('-', 80) ));
//                           vGerouArquivo := True;
//                       end;
//
//                       if vQtdeProdTxt > 1 then
//                          WriteLn(IndiceTxt, ('') );
//
//                       // monta a linha do produto acabado.
//                       WriteLn(IndiceTxt, ('PRODUTO :'));
//
//                       vDadosIni.AuxStr := vDadosIni.Space(100);
//                       vDadosIni.LimpaLinha(vDadosIni.AuxStr);
//                       vDadosIni.MontaLinha(0004, cupom2.FieldByName('grupo_prod').AsString );
//                       vDadosIni.MontaLinha(0011, cupom2.FieldByName('cod_prod').AsString );
//                       vDadosIni.MontaLinha(0020, cupom2.FieldByName('descr_it').AsString );
//                       vDadosIni.MontaLinha(0060, cupom2.FieldByName('unidade').AsString );
//                       vDadosIni.MontaLinha(0072, cupom2.FieldByName('QUANTIDADE').AsString );
//                       WriteLn(IndiceTxt, vDadosIni.auxstr);
//                       vDadosIni.LimpaLinha(vDadosIni.AuxStr);
//                       WriteLn(IndiceTxt, (''));
//
//                       WriteLn(IndiceTxt, ('MATERIA-PRIMA :'));
//
//                       buscas.First;
//                       while not buscas.Eof do
//                       begin
//                           vQtdeIndice := 0;
//                           vQtdeIndice := cupom2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat;
//
//                           // monta as linhas da matéria-prima.
//                           vDadosIni.AuxStr := vDadosIni.Space(100);
//                           vDadosIni.LimpaLinha(vDadosIni.AuxStr);
//                           vDadosIni.MontaLinha(0004, buscas.FieldByName('grupo_prod').AsString );
//                           vDadosIni.MontaLinha(0011, buscas.FieldByName('cod_prod').AsString );
//                           vDadosIni.MontaLinha(0020, buscas.FieldByName('descr_prod').AsString );
//                           vDadosIni.MontaLinha(0060, buscas.FieldByName('unidade').AsString );
//                           vDadosIni.MontaLinha(0072, CurrToStr (vQtdeIndice) );
//
//                           WriteLn(IndiceTxt, vDadosIni.auxstr);
//                           vDadosIni.LimpaLinha(vDadosIni.AuxStr);
//
//                           buscas.next;
//                       end;
//                   end;
//                end;
//                cupom2.Next;
//            end;
//
//            WriteLn(IndiceTxt, ( vDadosIni.replicate('-', 80) ));
//            WriteLn(IndiceTxt, ('TOTAL DE FORMULAS LISTADAS:    '+ IntToStr (vQtdeProdTxt) +' '));
//            WriteLn(IndiceTxt, ( vDadosIni.replicate('-', 80) ));
//            CloseFile(IndiceTxt);
//            // Aqui termina de Gerar o arquivo IndiceTec(ncupom).txt.


            BaixaEstoque(ProdPV);
            dataNow := vDadosIni.getDataHoraBanco(buscas);
            PV.FieldByName('data_fech').AsString := DateToStr(dataNow);
            PV.FieldByName('status_ped').AsString := 'FECHADA';
            PV.FieldByName('HORAFECHAMENTO').AsString := copy(timetostr(dataNow), 1, 2);
            PV.FieldByName('MINFECHAMENTO').AsString := copy(timetostr(dataNow), 4, 2);
            PV.FieldByName('TOT_PROD').AsCurrency := vrTotProd;
            PV.FieldByName('TOT_SERV').AsCurrency := vrTotServ;
            PV.FieldByName('VALOR_TOTAL').AsCurrency := vrTotal;
//            if (((vDadosIni.vEmp.vUsarPreVenda = 'S') and (vTipo = 'REQ')) or
//              ((vDadosIni.vEmp.vUsarPreVendaOS = 'S') and (vTipo = 'OS'))) and
//              (PV.FieldByName('NPREVENDA').AsInteger = 0)  then
//              PV.FieldByName('NPREVENDA').AsInteger:=Gencodigo('PREVENDA', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa);
            PV.Post;
            pv.ApplyUpdates(0);
            if ProdPV.ChangeCount > 0 then
              ProdPV.ApplyUpdates(0);
            if ServPV.ChangeCount > 0 then
              ServPV.ApplyUpdates(0);
            CommitaTransacao;
            vprogres.Position := vprogres.Position + 1;
            vTipodll := 'REQVENDA';
            if vTipo = 'OS' then
              vTipodll := 'ORDEM_SERV';
            ProdPV.First;
            while not ProdPV.Eof do
            begin
              vMD5Func._gravaMD5_Produtos(buscas, ProdPV.FieldByName('grupo_prod').AsInteger,
                ProdPV.FieldByName('cod_prod').AsString);
              ProdPV.Next;
            end;
          except
            on e: exception do begin
              RollBackTransacao;
              registraErro('Erro ao enviar para retaguarda cupom ' +
                cupom.FieldByName('cupom').AsString + ' Erro: ' + e.Message);
            end;
          end;
        end
        else
        begin
          vTipodll := 'REQVENDA';
          nPedVenda := PV.FieldByName('NPED').AsInteger;
          if vTipo = 'OS' then
            vTipodll := 'ORDEM_SERV';
        end;
      end;
    end;
    cupom.Next;
  end;
end;

function TPedVendasRetaguarda.verificaDescontoMaiorQueSomaDosItens: boolean;
var
  somaDosItens: Currency;
begin
  Result := false;
  somaDosItens := 0;
  vItem.First;
  while not vItem.dataSet.Eof do
  begin
    if vItem.dataSet.FieldByName('tipo').AsString = 'P' then
      somaDosItens:=somaDosItens+vItem.dataSet.FieldByName('qtde').AsFloat*
        vItem.dataSet.FieldByName('vl_unit').AsCurrency;
    vItem.Next;
  end;
  Result := dataSet.FieldByName('desconto').AsCurrency > somaDosItens;
end;

procedure TPedVendasRetaguarda.VoltaEstoque(vItem: TClientDataSet;
  pCancelamentoPreVenda: Boolean = False);
begin
  vVoltaEst := TIBStoredProc(dtmDAVF.SpVoltaEst);

  vItem.first;
  while not vItem.Eof do
  begin
    vVoltaEst.close;
    if pCancelamentoPreVenda then
      vVoltaEst.ParamByName('vgrupo').AsInteger := vItem.Fieldbyname('GRUPOOUSERV').AsInteger
    else
      vVoltaEst.ParamByName('vgrupo').AsInteger := vItem.Fieldbyname('GRUPO_PROD').AsInteger;
    vVoltaEst.ParamByName('vcod_prod').AsString := vItem.Fieldbyname('COD_PROD').AsString;
    if pCancelamentoPreVenda then
      vVoltaEst.ParamByName('quant').AsFloat := vItem.Fieldbyname('QTDE').AsFloat
    else
      vVoltaEst.ParamByName('quant').AsFloat := vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
//    if vItem.Fieldbyname('TP_NF_PED').AsString = '5' then
//      vVoltaEst.ParamByName('vests').AsFloat := vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat
//    else
      vVoltaEst.ParamByName('vests').AsFloat := 0;
//    if (vItem.Fieldbyname('TP_NF_PED').AsString = '1') or
//      (vItem.Fieldbyname('TP_NF_PED').AsString = '3') then
//    begin
//      vVoltaEst.ParamByName('vestm').AsFloat := vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
//      vVoltaEst.ParamByName('vestc').AsFloat := vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
//    end
//    else
//    begin
      vVoltaEst.ParamByName('vestm').AsFloat := 0;
      vVoltaEst.ParamByName('vestc').AsFloat := 0;
//    end;
//    if (vItem.Fieldbyname('TP_NF_PED').AsString = '2') or
//      (vItem.Fieldbyname('TP_NF_PED').AsString = '4') then
//      vVoltaEst.ParamByName('vestc').AsFloat := vItem.Fieldbyname('QUANT_PED_ITEM').AsFloat;
    vVoltaEst.ParamByName('vdata').AsDate := vDadosIni.getDataBanco(buscas);
    vVoltaEst.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.CodEmpresa);
    vVoltaEst.Prepare;
    vVoltaEst.ExecProc;
    vItem.Next;
  end;
end;

procedure TPedVendasRetaguarda.sincronizaCupomNoRetaguarda_nao_usar(pDataSetCp,
  pDataSetCp2: TClientDataSet; vprogres: TProgressBar);
var
  PV, ProdPV, ServPV, IT: TClientDataSet;
  vTipo: string;
  dataNow: TDateTime;
  vrTotProd, vrTotServ, vrTotal: Currency;
  editar: Boolean;
  nItem: Integer;
  nPedVenda: Integer;
  vTipodll: string;

  // variáveis utilizadas no calculo do preço de venda dos Indices Técnicos.
  vPCTIndice  : Currency;
  vPVProd : Currency;
  vQtdeIndice : Currency;
  vPCIndice : Currency;
  vPVTIndice : Currency;
  vPVUIndice : Currency;

  // variaveis utilizadas para criar aquivo
  IndiceTxt : TextFile;
  vQtdeProdTxt : Integer;
  vGerouArquivo : Boolean;

begin
  if vDadosIni.bancoConectado = 'local' then
    exit;

  if not dtmAtivo.bancoHw.Connected then
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, false) then
      Exit;

  PV := TClientDataSet(dtmDAVF.cdsPV);
  ProdPV := TClientDataSet(dtmDAVF.cdsProdPV);
  ServPV := TClientDataSet(dtmDAVF.cdsServPV);

  if dtmDAVF.ibTransCp.InTransaction then
    dtmDAVF.ibTransCp.Commit;
  dtmDAVF.ibTransCp.StartTransaction;
  CommitaTransacao;
  IniciaTransacao;

  if pDataSetCp.IsEmpty then
    Exit;
  vprogres.Min := 0;
  vprogres.Position := 0;
  while not pDataSetCp.Eof do
  begin
  
    vprogres.Max := pDataSetCp.RecordCount + pDataSetCp2.RecordCount;
    if not pDataSetCp2.IsEmpty then
    begin
      vTipo := 'REQ';
      pDataSetCp2.First;
      while not pDataSetCp2.Eof do
      begin
        if (pDataSetCp2.FieldByName('PROD_SERV').AsString = 'S') and
          ((pDataSetCp2.FieldByName('status_it').AsString <> 'CANCELADO') and
          (pDataSetCp2.FieldByName('status_it').IsNull)) then
        begin
          vTipo := 'OS';
          Break;
        end;
        pDataSetCp2.next;
      end;

      PV.Close;
      PV.CommandText := 'select * from pedvenda where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' + pDataSetCp.FieldByName('cupom').AsString +
        ' and nserieecf = ' + QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString))+
        ' and operador = ' + vDadosIni.vCodTerminal ;
      PV.Open;
      if pDataSetCp.FieldByName('status_cp').AsString = 'CANCELADO' then
      begin
        if not pv.IsEmpty then
        begin
          if apagarVendasRetaguarda <> 'N' then
          begin

            /// Anter de apagar a venda o select armazena os produtos da venda
            ///  Logo abaixo a venda é apagada e para cada item que tem seu estoque alterado
            ///  o sistema gera o novo valor do md5 para o campo
            ProdPV.Close;
            ProdPV.CommandText := 'select * from pedvenda_prod where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ProdPV.Open;

            ExecutaComandosSqlExec('delete from pedvenda where cod_empresa = ' + vDadosIni.codEmpresa
              + ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' +
              pDataSetCp.FieldByName('cupom').AsString +
              ' and nserieecf = ' +
              QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString)));

          end;
          if vTipo = 'REQ' then
          begin
            if apagarVendasRetaguarda <> 'N' then
            begin

              if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
                if not ExecutaComandosSql('select nreq from reqvenda ' +
                  ' where nreq = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa) then
                  VoltaEstoque(ProdPV);

              ExecutaComandosSqlExec('delete from reqvenda where cod_empresa = ' +
                vDadosIni.codEmpresa
                + ' and ncupom = ' + pDataSetCp.FieldByName('cupom').AsString +
                ' and nserieecf = ' +
                QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString)));
            end;
          end
          else
          begin
            if apagarVendasRetaguarda <> 'N' then
            begin

              if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
                if not ExecutaComandosSql('select n_os from ordem_serv ' +
                  ' where n_os = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa) then
                  VoltaEstoque(ProdPV);

              ExecutaComandosSqlExec('delete from ordem_serv where cod_empresa = ' +
                vDadosIni.codEmpresa + ' and ncupom = ' + pDataSetCp.FieldByName('cupom').AsString +
                ' and nserieecf = ' +
                QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString)));
            end;
          end;
          CommitaTransacao;

          if apagarVendasRetaguarda <> 'N' then
          begin
            ProdPV.First;
            while not ProdPV.Eof do
            begin
              vMD5Func._gravaMD5_Produtos(buscas, ProdPV.FieldByName('grupo_prod').AsInteger,
                ProdPV.FieldByName('cod_prod').AsString);
              ProdPV.Next;
            end;
          end;

          IniciaTransacao;
        end;
        PV.close;
        vprogres.Position := vprogres.Position + 1;
      end
      else
      begin
        if pv.IsEmpty then
        begin
          try
            IniciaTransacao;
            PV.Insert;
            if vTipo = 'REQ' then
              PV.FieldByName('NPED').AsInteger :=
                Gencodigo('REQVENDA', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa)
            else
              PV.FieldByName('NPED').AsInteger :=
                Gencodigo('ORDEM_SERV', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa);
            nPedVenda := PV.FieldByName('NPED').AsInteger;
            PV.FieldByName('COD_EMPRESA').AsInteger := strToint(vDadosIni.codEmpresa);
            PV.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
            PV.FieldByName('HORAABERTURA').AsString := copy(timetostr(time), 1, 2);
            PV.FieldByName('MINABERTURA').AsString := copy(timetostr(time), 4, 2);
            PV.FieldByName('TIPV').AsString := 'V';
            PV.FieldByName('TIPOR').AsString := 'V';
            PV.FieldByName('TIPO').AsString := vTipo; //; 'REQ';
            PV.FieldByName('OBS_PED').AsString := 'CUPOM FISCAL N° ' +
              pDataSetCp.FieldByName('CUPOM').AsString;
            if vTipo = 'OS' then
            begin
              PV.FieldByName('OBS_OS').AsString := 'CUPOM FISCAL N° ' +
                pDataSetCp.FieldByName('CUPOM').AsString;
              PV.FieldByName('tipo_os').AsString := 'CLIENTE';
            end;
            PV.FieldByName('DATA_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
            PV.FieldByName('TIPV').AsString := 'V';
            PV.FieldByName('TIPOR').AsString := 'V';
            PV.FieldByName('NCUPOM').AsString := pDataSetCp.FieldByName('CUPOM').AsString;
            PV.FieldByName('CCF_CUPOM').AsString := pDataSetCp.FieldByName('CCF').AsString;
            PV.FieldByName('DATA_CUPOM').AsDateTime := pDataSetCp.FieldByName('DATA').AsDateTime;
            PV.FieldByName('OPERADOR').AsString := vDadosIni.vCodTerminal;
            PV.FieldByName('ACRESCIMO').AsCurrency := pDataSetCp.FieldByName('VALOR_ACRES').AsCurrency;
            PV.FieldByName('DESCONTO').AsCurrency := pDataSetCp.FieldByName('VALOR_DESC').AsCurrency;
            PV.FieldByName('NSERIEECF').AsString :=
              vDadosIni.decodifica(pDataSetCp.FieldByName('NSERIEECF').AsString);
            try
              if pDataSetCp.FieldByName('CLIENTE').AsInteger = 0 then
                PV.FieldByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao
              else
                PV.FieldByName('COD_CLIENTE').AsInteger := pDataSetCp.FieldByName('CLIENTE').AsInteger;
            except
              PV.FieldByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao;
            end;
            try
              if pDataSetCp.FieldByName('COLABORADOR').AsInteger = 0 then
                PV.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao
              else
                PV.FieldByName('COD_VENDEDOR').AsInteger :=
                  pDataSetCp.FieldByName('COLABORADOR').AsInteger;
            except
              PV.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao;
            end;
            PV.FieldByName('COD_cond_pag').AsString :=
              retornaValor('select cod_cond_pag as valor from cond_pag where ' +
              ' desc_cond_pag like ' + QuotedStr('%' + 'ISTA' + '%'));
            PV.FieldByName('DATA_FECH').AsDateTime := PV.FieldByName('DATA_PED').AsDateTime;

            ProdPV.Close;
            ProdPV.CommandText := 'select * from pedvenda_prod where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ProdPV.Open;
            ServPV.Close;
            ServPV.CommandText := 'select * from pedvenda_serv where cod_empresa = '
              + PV.FieldByName('cod_empresa').AsString +
              ' and nped = ' + PV.FieldByName('nped').AsString +
              ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
            ServPV.Open;

            vrTotProd := 0;
            vrTotServ := 0;
            vrTotal := 0;
            nItem := 0;
            pDataSetCp2.First;
            while not pDataSetCp2.Eof do
            begin
              if (pDataSetCp2.FieldByName('PROD_SERV').AsString = 'P') and
                ((pDataSetCp2.FieldByName('status_it').AsString <> 'CANCELADO') and
                (pDataSetCp2.FieldByName('status_it').IsNull)) then
              begin

                //verifica se Produto do pDataSetCp2 é tipo_item = 04
                buscas.Close;
                buscas.SQL.Clear;
                buscas.SQL.Add('select grupo_prod, cod_prod from produtos '+
                               'where cod_prod = '+QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString)+
                               'and grupo_prod = '+ pDataSetCp2.FieldByName('grupo_prod').AsString +
                               'and cod_empresa = '+ pv.FieldByName('cod_empresa').AsString +
                               'and tipo_item = ''04'' ');
                buscas.Open;

                if not buscas.IsEmpty then
                begin
                   // pesquisa o indice tecinico do produto.
                   buscas.Close;
                   buscas.SQL.Clear;
                   buscas.SQL.Add('select it.* , pr.* '+
                                  'from indice_tecnico it '+
                                  'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
                                  'where it.grupo_prod_acabado = '+ pDataSetCp2.FieldByName('grupo_prod').AsString +
                                  'and it.cod_prod_acabado = '+ QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString) +
                                  'and it.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString );
                   buscas.Open;
                end;


                if not buscas.IsEmpty then
                begin

                   // buscas vai conter as materias primas que serão adicionadas no ProdPV.
                   if not buscas.IsEmpty then
                   begin

                       vQtdeIndice := 0;
                       vPCIndice := 0;
                       vPCTIndice := 0;

                       buscas.First;
                       while not buscas.Eof do
                       begin
                          vQtdeIndice := 0;
                          vPCIndice := 0;

                          vQtdeIndice := pDataSetCp2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat;  // 1 KG de Pão
                          if buscas.FieldByName('prec_cusm_prod').AsFloat > 0 then
                            vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice
                          else
                            vPCIndice := 1;

                          vPCTIndice := vPCTIndice + vPCIndice;  // 1,80  // Preço custo total dos Indices
                          buscas.Next;
                       end;

                       buscas.First;
                       while not buscas.Eof do
                       begin

                          editar := false;
                          ProdPV.First;
                          if vDadosIni.vModoCompatibilidade = 'S' then
                          begin
                            while not ProdPV.Eof do
                            begin
                              if (buscas.FieldByName('grupo_prod').AsInteger =
                                ProdPV.FieldByName('grupo_prod').AsInteger) and
                                (trim(buscas.FieldByName('cod_prod').AsString) =
                                trim(ProdPV.FieldByName('cod_prod').AsString)) then
                              begin
                                editar := true;
                                break;
                              end;
                              ProdPV.Next;
                            end;
                          end;

                          vPVProd := 0;
                          vQtdeIndice := 0;
                          vPCIndice := 0;
                          vPVTIndice := 0;
                          vPVUIndice := 0;

                          //Inserir ou Editar Indices Técnicos no lugar do produto acabado.

                          vPVProd := pDataSetCp2.FieldByName('QUANTIDADE').AsFloat * pDataSetCp2.FieldByName('preco').AsFloat; //3,45   //Preço de Venda Prod. Acabado
                          vQtdeIndice := pDataSetCp2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat; //0,3  //Qtde Vendida Indice
                          try
                            vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice; // 0,90  //Preço de Custo do Indice
                          except
                            vPCIndice := 1;
                          end;

                          vPVTIndice := (( vPVProd * vPCIndice ) / vPCTIndice );  //1,725  //Valor Total ( pv ) do Indice;
                          vPVUIndice := vPVTIndice / vQtdeIndice;  //5,75  //valor Unitario ( pv) do Indice;

                          if editar then
                          begin
                            ProdPV.Edit;
                            ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                              ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat +
                              vQtdeIndice;

                            ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency :=
                              ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                              vPVTIndice;

                            if pDataSetCp2.FieldByName('RAT_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                                 ((pDataSetCp2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if pDataSetCp2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                                 ((pDataSetCp2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                            if pDataSetCp2.FieldByName('PERC_DESC').AsFloat <> 0 then
                            begin
                               ProdPV.FieldByName('DESC_ITEM').AsCurrency :=
                                 ProdPV.FieldByName('DESC_ITEM').AsCurrency +
                                 ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                               ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                                 ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                            end;

                            if pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                            begin
                               ProdPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                                 ProdPV.FieldByName('ACRESC_ITEM').AsCurrency +
                                 ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                               ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                                 ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                                 ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                            end;

                            vrTotProd := vrTotProd + vQtdeIndice *
                              vPVUIndice;

                            vrTotal := vrTotal + ( vQtdeIndice * vPVUIndice) -
                              ((pDataSetCp2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd) +
                              ((pDataSetCp2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd) -
                              ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd) +
                              ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                          end
                          else
                          begin
                            ProdPV.Insert;
                            inc(nitem);

                            ProdPV.FieldByName('cod_empresa').AsString :=
                              PV.FieldByName('cod_empresa').AsString;
                            ProdPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                            ProdPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                            ProdPV.FieldByName('COD_VENDEDOR').AsInteger := PV.FieldByName('COD_VENDEDOR').AsInteger;

                            ProdPV.FieldByName('GRUPO_PROD').AsInteger :=
                              buscas.FieldByName('GRUPO_PROD').AsInteger;

                            ProdPV.FieldByName('COD_PROD').AsString :=
                              buscas.FieldByName('COD_PROD').AsString;

                            ProdPV.FieldByName('COD_GRADE').AsInteger := 0;
                            ProdPV.FieldByName('CODIGO_NOP').AsFloat := nItem;
                            ProdPV.FieldByName('DESCR_PROD_PED').AsString :=
                              buscas.FieldByName('DESCR_PROD').AsString;

                            ProdPV.FieldByName('NUM_FAB_PROD').AsString :=
                              buscas.FieldByName('num_fab_prod').AsString;

                            ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                              vQtdeIndice;

                            ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat :=
                              vPVUIndice;

                            ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                              ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat;

                            ProdPV.FieldByName('VLUN_ORIG').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat;

                            ProdPV.FieldByName('VLUN_PED_NF').AsFloat := vPVUIndice;

                            ProdPV.FieldByName('VLTOT_PED_NF').AsFloat :=
                              ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                              vPVUIndice;

                            if pDataSetCp2.FieldByName('RAT_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_DESC').AsFloat :=
                                 ((pDataSetCp2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if pDataSetCp2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                               ProdPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                                 ((pDataSetCp2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                            // Obs : olhar com JP de onde  tirar esta aliquota para materia prima.
                            ProdPV.FieldByName('ALIQUOTA_CP').AsString :=
                              pDataSetCp2.FieldByName('ALIQUOTA_IT').AsString;

                            ProdPV.FieldByName('TP_NF_PED').AsString := '2';
                            ProdPV.FieldByName('SIT_ATD').AsString := 'NT';

                            if pDataSetCp2.FieldByName('PERC_DESC').AsFloat <> 0 then
                               ProdPV.FieldByName('DESC_ITEM').AsFloat :=
                                 ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);

                            if pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                               ProdPV.FieldByName('ACRESC_ITEM').AsFloat :=
                                 ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                            ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                              ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                              ProdPV.FieldByName('DESC_ITEM').AsCurrency;

                            ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                              ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                              ProdPV.FieldByName('ACRESC_ITEM').AsCurrency;

                            ProdPV.FieldByName('nitem').AsInteger := nItem;
                            ProdPV.FieldByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                            ProdPV.FieldByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                            ProdPV.FieldByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;

                            ProdPV.Post;
                            vrTotProd := vrTotProd + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat;
                            vrTotal := vrTotal + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat -
                              ProdPV.FieldByName('RATEIO_DESC').AsFloat +
                              ProdPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                              //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                              //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;
                          end;
                          buscas.next;
                       end;
                   end;
                end
                else
                begin

                  // se não for Produto acabado ( tipo_item = 04) vai fazer o processo normal.
                  editar := false;
                  ProdPV.First;
                  if vDadosIni.vModoCompatibilidade = 'S' then
                    while not ProdPV.Eof do
                    begin
                      if (pDataSetCp2.FieldByName('grupo_prod').AsInteger =
                        ProdPV.FieldByName('grupo_prod').AsInteger) and
                        (trim(pDataSetCp2.FieldByName('cod_prod').AsString) =
                        trim(ProdPV.FieldByName('cod_prod').AsString)) then
                      begin
                        editar := true;
                        break;
                      end;
                      ProdPV.Next;
                    end;
                  if editar then
                  begin
                    ProdPV.Edit;
                    ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                      ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat +
                      pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency :=
                      ProdPV.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                      (pDataSetCp2.FieldByName('quantidade').AsFloat *
                      pDataSetCp2.FieldByName('PRECO').AsCurrency);
                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      pDataSetCp2.FieldByName('RAT_DESC').AsCurrency;
                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency;
                    ProdPV.FieldByName('DESC_ITEM').AsCurrency :=
                      ProdPV.FieldByName('DESC_ITEM').AsCurrency +
                      pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;
                    ProdPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                      ProdPV.FieldByName('ACRESC_ITEM').AsCurrency +
                      pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;

                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                    vrTotProd := vrTotProd + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                      pDataSetCp2.FieldByName('PRECO').AsCurrency);
                    vrTotal := vrTotal + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                      pDataSetCp2.FieldByName('PRECO').AsCurrency) -
                      pDataSetCp2.FieldByName('RAT_DESC').AsCurrency +
                      pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency -
                      pDataSetCp2.FieldByName('PERC_desc').AsCurrency +
                      pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;
                  end
                  else
                  begin
                    ProdPV.Insert;
                    inc(nitem);
                    ProdPV.FieldByName('cod_empresa').AsString :=
                      PV.FieldByName('cod_empresa').AsString;
                    ProdPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                    ProdPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                    ProdPV.FieldByName('COD_VENDEDOR').AsInteger := PV.FieldByName('COD_VENDEDOR').AsInteger;
                    ProdPV.FieldByName('GRUPO_PROD').AsInteger :=
                      pDataSetCp2.FieldByName('GRUPO_PROD').AsInteger;
                    ProdPV.FieldByName('COD_PROD').AsString :=
                      pDataSetCp2.FieldByName('COD_PROD').AsString;
                    ProdPV.FieldByName('COD_GRADE').AsInteger := 0;
                    ProdPV.FieldByName('CODIGO_NOP').AsFloat := nItem;
                    ProdPV.FieldByName('DESCR_PROD_PED').AsString :=
                      pDataSetCp2.FieldByName('DESCR_IT').AsString;
                    ProdPV.FieldByName('NUM_FAB_PROD').AsString :=
                      pDataSetCp2.FieldByName('CODBARRA').AsString;
                    ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat :=
                      pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                    ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat :=
                      pDataSetCp2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                      ProdPV.FieldByName('QUANT_PED_ITEM').AsFloat;
                    ProdPV.FieldByName('VLUN_ORIG').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat;
                    ProdPV.FieldByName('VLUN_PED_NF').AsFloat := pDataSetCp2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('VLTOT_PED_NF').AsFloat :=
                      ProdPV.FieldByName('VLUN_PED_ITEM').AsFloat *
                      pDataSetCp2.FieldByName('PRECO').AsFloat;
                    ProdPV.FieldByName('RATEIO_DESC').AsFloat :=
                      pDataSetCp2.FieldByName('RAT_DESC').AsFloat;
                    ProdPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                      pDataSetCp2.FieldByName('RAT_ACRES').AsFloat;
                    ProdPV.FieldByName('ALIQUOTA_CP').AsString :=
                      pDataSetCp2.FieldByName('ALIQUOTA_IT').AsString;
                    ProdPV.FieldByName('TP_NF_PED').AsString := '2';
                    ProdPV.FieldByName('SIT_ATD').AsString := 'NT';
                    ProdPV.FieldByName('DESC_ITEM').AsFloat :=
                      pDataSetCp2.FieldByName('PERC_DESC').AsFloat;
                    ProdPV.FieldByName('ACRESC_ITEM').AsFloat :=
                      pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat;

                    ProdPV.FieldByName('RATEIO_DESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_DESC').AsCurrency +
                      ProdPV.FieldByName('DESC_ITEM').AsCurrency;

                    ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                      ProdPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                      ProdPV.FieldByName('ACRESC_ITEM').AsCurrency;

                    ProdPV.FieldByName('nitem').AsInteger := nItem;
                    buscas.Close;
                    buscas.SQL.Text:= ('select pr.PREC_CUS_PROD, pr.PREC_CUSR_PROD, pr.PREC_CUSM_PROD, pr.PREC_CUSMR_PROD,'+
                      ' pr.ICMANT_SUB from  produtos pr'+
                      ' where pr.grupo_prod = '+ pDataSetCp2.FieldByName('grupo_prod').AsString +
                      ' and pr.cod_prod = '+ QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString) +
                      ' and pr.cod_empresa = '+ pv.FieldByName('cod_empresa').AsString );
                    buscas.Open;
                    ProdPV.FieldByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                    ProdPV.FieldByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                    ProdPV.FieldByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;
                    ProdPV.Post;
                    vrTotProd := vrTotProd + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat;
                    vrTotal := vrTotal + ProdPV.FieldByName('VLTOT_PED_ITEM').AsFloat -
                      ProdPV.FieldByName('RATEIO_DESC').AsFloat +
                      ProdPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                      //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                      //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;
                  end;
                end;

              end
              else if (pDataSetCp2.FieldByName('PROD_SERV').AsString = 'S') and
                ((pDataSetCp2.FieldByName('status_it').AsString <> 'CANCELADO') and
                (pDataSetCp2.FieldByName('status_it').IsNull)) then
              begin
                editar := false;
                ServPV.First;
                if vDadosIni.vModoCompatibilidade = 'S' then
                  while not ServPV.Eof do
                  begin
                    if (pDataSetCp2.FieldByName('grupo_prod').AsInteger =
                      ServPV.FieldByName('cod_servico').AsInteger) then
                    begin
                      editar := true;
                      break;
                    end;
                    ServPV.Next;
                  end;
                if editar then
                begin
                  ServPV.Edit;
                  ServPV.FieldByName('QUANT_SERV_PED').AsFloat :=
                    ServPV.FieldByName('QUANT_SERV_PED').AsFloat +
                    pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                  ServPV.FieldByName('VALOR_TOT_SERV').AsCurrency :=
                    ServPV.FieldByName('VALOR_TOT_SERV').AsCurrency +
                    (pDataSetCp2.FieldByName('quantidade').AsFloat *
                    pDataSetCp2.FieldByName('PRECO').AsCurrency);
                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    pDataSetCp2.FieldByName('RAT_DESC').AsCurrency;
                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency;
                  ServPV.FieldByName('DESC_ITEM').AsCurrency :=
                    ServPV.FieldByName('DESC_ITEM').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;
                  ServPV.FieldByName('ACRESC_ITEM').AsCurrency :=
                    ServPV.FieldByName('ACRESC_ITEM').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                  vrTotProd := vrTotProd + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                    pDataSetCp2.FieldByName('PRECO').AsCurrency);
                  vrTotal := vrTotal + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                    pDataSetCp2.FieldByName('PRECO').AsCurrency) -
                    pDataSetCp2.FieldByName('RAT_DESC').AsCurrency +
                    pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency -
                    pDataSetCp2.FieldByName('PERC_desc').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;
                end
                else
                begin
                  ServPV.Insert;
                  inc(nItem);
                  ServPV.FieldByName('cod_empresa').AsString :=
                    PV.FieldByName('cod_empresa').AsString;
                  ServPV.FieldByName('tipo').AsString := PV.FieldByName('tipo').AsString;
                  ServPV.FieldByName('nped').AsInteger := PV.FieldByName('nped').AsInteger;
                  ServPV.FieldByName('COD_SERVICO').AsInteger :=
                    pDataSetCp2.FieldByName('GRUPO_PROD').AsInteger;
                  ServPV.FieldByName('COD_VENDEDOR').AsInteger :=
                    PV.FieldByName('COD_VENDEDOR').AsInteger;
                  ServPV.FieldByName('CODIGO_NOP').AsFloat := nItem;
                  ServPV.FieldByName('QUANT_SERV_PED').AsFloat :=
                    pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                  ServPV.FieldByName('VALOR_UN_SERV').AsFloat :=
                    pDataSetCp2.FieldByName('PRECO').AsFloat;
                  ServPV.FieldByName('VALOR_TOT_SERV').AsFloat :=
                    ServPV.FieldByName('VALOR_UN_SERV').AsFloat *
                    ServPV.FieldByName('QUANT_SERV_PED').AsFloat;
                  ServPV.FieldByName('VLUN_ORIG').AsFloat :=
                    ServPV.FieldByName('VALOR_UN_SERV').AsFloat;
                  ServPV.FieldByName('RATEIO_DESC').AsFloat :=
                    pDataSetCp2.FieldByName('RAT_DESC').AsFloat;
                  ServPV.FieldByName('RATEIO_ACRESC').AsFloat :=
                    pDataSetCp2.FieldByName('RAT_ACRES').AsFloat;
                  ServPV.FieldByName('DESC_SERV_PED').AsString :=
                    pDataSetCp2.FieldByName('DESCR_IT').AsString;
                  ServPV.FieldByName('COD_VENDEDOR1').AsInteger :=
                    PV.FieldByName('COD_VENDEDOR').AsInteger;
                  ServPV.FieldByName('DESC_ITEM').AsFloat :=
                    pDataSetCp2.FieldByName('PERC_DESC').AsFloat;
                  ServPV.FieldByName('ACRESC_ITEM').AsFloat :=
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat;

                  ServPV.FieldByName('RATEIO_DESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_DESC').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;

                  ServPV.FieldByName('RATEIO_ACRESC').AsCurrency :=
                    ServPV.FieldByName('RATEIO_ACRESC').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                  ServPV.FieldByName('nitem').AsInteger := nItem;
                  ServPV.Post;
                  vrTotServ := vrTotServ + ServPV.FieldByName('VALOR_TOT_SERV').AsFloat;
                  vrTotal := vrTotal + ServPV.FieldByName('VALOR_TOT_SERV').AsFloat -
                    ServPV.FieldByName('RATEIO_DESC').AsFloat +
                    ServPV.FieldByName('RATEIO_ACRESC').AsFloat;// -
                    //ServPV.FieldByName('DESC_ITEM').AsFloat +
                    //ServPV.FieldByName('ACRESC_ITEM').AsFloat;
                end;
              end;

              pDataSetCp2.Next;
              vprogres.Position := vprogres.Position + 1;
            end;

            BaixaEstoque(ProdPV);
            dataNow := vDadosIni.getDataHoraBanco(buscas);
            PV.FieldByName('data_fech').AsString := DateToStr(dataNow);
            PV.FieldByName('status_ped').AsString := 'FECHADA';
            PV.FieldByName('HORAFECHAMENTO').AsString := copy(timetostr(dataNow), 1, 2);
            PV.FieldByName('MINFECHAMENTO').AsString := copy(timetostr(dataNow), 4, 2);
            PV.FieldByName('TOT_PROD').AsCurrency := vrTotProd;
            PV.FieldByName('TOT_SERV').AsCurrency := vrTotServ;
            PV.FieldByName('VALOR_TOTAL').AsCurrency := vrTotal;

            PV.Post;
            pv.ApplyUpdates(0);
            if ProdPV.ChangeCount > 0 then
              ProdPV.ApplyUpdates(0);
            if ServPV.ChangeCount > 0 then
              ServPV.ApplyUpdates(0);
            CommitaTransacao;
            vprogres.Position := vprogres.Position + 1;
            vTipodll := 'REQVENDA';
            if vTipo = 'OS' then
              vTipodll := 'ORDEM_SERV';
            ProdPV.First;
            while not ProdPV.Eof do
            begin
              vMD5Func._gravaMD5_Produtos(buscas, ProdPV.FieldByName('grupo_prod').AsInteger,
                ProdPV.FieldByName('cod_prod').AsString);
              ProdPV.Next;
            end;
          except
            on e: exception do begin
              RollBackTransacao;
              registraErro('Erro ao enviar para retaguarda cupom ' +
                pDataSetCp.FieldByName('cupom').AsString + ' Erro: ' + e.Message);
            end;
          end;
        end
        else
        begin
          vTipodll := 'REQVENDA';
          nPedVenda := PV.FieldByName('NPED').AsInteger;
          if vTipo = 'OS' then
            vTipodll := 'ORDEM_SERV';
        end;
      end;
    end;
    pDataSetCp.Next;
  end;
end;

procedure TPedVendasRetaguarda.sincronizaCupomNoRetaguardaTeste_nao_usar(pDataSetCp,
  pDataSetCp2: TClientDataSet; vprogres: TProgressBar);
var
  IT: TClientDataSet;
  PV, ProdPV, ServPV : TIBQuery;
  ProdPVClient: TClientDataSet;
  vTipo: string;
  dataNow: TDateTime;
  vrTotProd, vrTotServ, vrTotal: Currency;
  editar: Boolean;
  nItem: Integer;
  nPedVenda: Integer;
  vTipodll: string;

  // variáveis utilizadas no calculo do preço de venda dos Indices Técnicos.
  vPCTIndice  : Currency;
  vPVProd : Currency;
  vQtdeIndice : Currency;
  vPCIndice : Currency;
  vPVTIndice : Currency;
  vPVUIndice : Currency;

  // variaveis utilizadas para criar aquivo
  IndiceTxt : TextFile;
  vQtdeProdTxt : Integer;
  vGerouArquivo : Boolean;

begin
  if vDadosIni.bancoConectado = 'local' then
    exit;

  if not dtmAtivo.bancoHw.Connected then
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, false) then
      Exit;

  PV := TIBQuery(dtmDAVF.qrPV);
  ProdPV := TIBQuery(dtmDAVF.qrProdPV);
  ServPV := TIBQuery(dtmDAVF.qrServPV);
  ProdPVClient := TClientDataSet(dtmDAVF.cdsProdPV);

  if dtmDAVF.ibTransCp.InTransaction then
    dtmDAVF.ibTransCp.Commit;
  dtmDAVF.ibTransCp.StartTransaction;
  CommitaTransacao;
  IniciaTransacao;

  if pDataSetCp.IsEmpty then
    Exit;

  vprogres.Min := 0;
  vprogres.Position := 0;

  vprogres.Max := pDataSetCp.RecordCount + pDataSetCp2.RecordCount;
  if not pDataSetCp2.IsEmpty then
  begin
    vTipo := 'REQ';
    pDataSetCp2.First;
    while not pDataSetCp2.Eof do
    begin
      if (pDataSetCp2.FieldByName('PROD_SERV').AsString = 'S') and
        ((pDataSetCp2.FieldByName('status_it').AsString <> 'CANCELADO') and
        (pDataSetCp2.FieldByName('status_it').IsNull)) then
      begin
        vTipo := 'OS';
        Break;
      end;
      pDataSetCp2.next;
    end;

    PV.Close;
    PV.SQL.Text := 'select nped, tipo from pedvenda where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' + pDataSetCp.FieldByName('cupom').AsString +
      ' and nserieecf = ' + QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString))+
      ' and operador = ' + vDadosIni.vCodTerminal ;
    PV.Open;

    if pDataSetCp.FieldByName('status_cp').AsString = 'CANCELADO' then
    begin
      if not pv.IsEmpty then
      begin
        ProdPVClient.Close;
        ProdPVClient.CommandText := 'select * from pedvenda_prod where cod_empresa = '
          + vDadosIni.Codempresa +
          ' and nped = ' + PV.FieldByName('nped').AsString +
          ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
        ProdPVClient.Open;

        if apagarVendasRetaguarda <> 'N' then
        begin

          /// Anter de apagar a venda o select armazena os produtos da venda
          ///  Logo abaixo a venda é apagada e para cada item que tem seu estoque alterado
          ///  o sistema gera o novo valor do md5 para o campo

          ExecutaComandosSqlExec('delete from pedvenda where cod_empresa = ' + vDadosIni.codEmpresa
            + ' and tipo = ' + QuotedStr(vTipo) + ' and ncupom = ' +
            pDataSetCp.FieldByName('cupom').AsString +
            ' and nserieecf = ' +
            QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString)));

        end;
        if vTipo = 'REQ' then
        begin
          if apagarVendasRetaguarda <> 'N' then
          begin

            if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
              if not ExecutaComandosSql('select nreq from reqvenda ' +
                ' where nreq = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa) then
                VoltaEstoque(ProdPVClient);

            ExecutaComandosSqlExec('delete from reqvenda where cod_empresa = ' +
              vDadosIni.codEmpresa
              + ' and ncupom = ' + pDataSetCp.FieldByName('cupom').AsString +
              ' and nserieecf = ' +
              QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString)));
          end;
        end
        else
        begin
          if apagarVendasRetaguarda <> 'N' then
          begin

            if StrToInt(Copy(IntToStr(vDadosIni.vEmp.vVersaoRetaguarda),1,1)) >= 4 then
              if not ExecutaComandosSql('select n_os from ordem_serv ' +
                ' where n_os = '+ IntToStr(PV.FieldByName('nped').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa) then
                VoltaEstoque(ProdPVClient);

            ExecutaComandosSqlExec('delete from ordem_serv where cod_empresa = ' +
              vDadosIni.codEmpresa + ' and ncupom = ' + pDataSetCp.FieldByName('cupom').AsString +
              ' and nserieecf = ' +
              QuotedStr(vDadosIni.decodifica(pDataSetCp.FieldByName('nserieecf').AsString)));
          end;
        end;

        if apagarVendasRetaguarda <> 'N' then
        begin
          ProdPVClient.First;
          while not ProdPVClient.Eof do
          begin
            vMD5Func._gravaMD5_Produtos(buscas, ProdPVClient.FieldByName('grupo_prod').AsInteger,
              ProdPVClient.FieldByName('cod_prod').AsString);
            ProdPVClient.Next;
          end;
        end;
        CommitaTransacao;

        IniciaTransacao;
      end;
      PV.close;
      vprogres.Position := vprogres.Position + 1;
    end
    else
    begin
      if pv.IsEmpty then
      begin
        PV.Close;
        PV.SQL.Text := 'INSERT INTO PEDVENDA (' +
          ' COD_EMPRESA, NPED, TIPO, COD_VENDEDOR, HORAABERTURA, MINABERTURA, TIPV, TIPOR, OBS_PED,' +
          ' OBS_OS, TIPO_OS, NCUPOM, CCF_CUPOM, DATA_CUPOM, OPERADOR, ACRESCIMO, DESCONTO,' +
          ' NSERIEECF, COD_CLIENTE, COD_COND_PAG, DATA_FECH, DATA_PED, STATUS_PED, HORAFECHAMENTO,' +
          ' MINFECHAMENTO, TOT_PROD, TOT_SERV, VALOR_TOTAL)' +
          ' VALUES (' +
          ' :COD_EMPRESA, :NPED, :TIPO, :COD_VENDEDOR, :HORAABERTURA, :MINABERTURA, :TIPV, :TIPOR, :OBS_PED,' +
          ' :OBS_OS, :TIPO_OS, :NCUPOM, :CCF_CUPOM, :DATA_CUPOM, :OPERADOR, :ACRESCIMO, :DESCONTO,' +
          ' :NSERIEECF, :COD_CLIENTE, :COD_COND_PAG, :DATA_FECH, :DATA_PED, :STATUS_PED, :HORAFECHAMENTO,' +
          ' :MINFECHAMENTO, :TOT_PROD, :TOT_SERV, :VALOR_TOTAL)';

        try
          IniciaTransacao;

          if vTipo = 'REQ' then
            PV.ParamByName('NPED').AsInteger :=
              Gencodigo('REQVENDA', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa)
          else
            PV.ParamByName('NPED').AsInteger :=
              Gencodigo('ORDEM_SERV', dtmDAVF.SpIncCodigo, vDadosIni.codEmpresa);
          nPedVenda := PV.ParamByName('NPED').AsInteger;
          PV.ParamByName('COD_EMPRESA').AsInteger := strToint(vDadosIni.codEmpresa);
          PV.ParamByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
          PV.ParamByName('HORAABERTURA').AsString := copy(timetostr(time), 1, 2);
          PV.ParamByName('MINABERTURA').AsString := copy(timetostr(time), 4, 2);
          PV.ParamByName('TIPV').AsString := 'V';
          PV.ParamByName('TIPOR').AsString := 'V';
          PV.ParamByName('TIPO').AsString := vTipo; //; 'REQ';
          PV.ParamByName('OBS_PED').AsString := 'CUPOM FISCAL N° ' +
            pDataSetCp.FieldByName('CUPOM').AsString;
          if vTipo = 'OS' then
          begin
            PV.ParamByName('OBS_OS').AsString := 'CUPOM FISCAL N° ' +
              pDataSetCp.FieldByName('CUPOM').AsString;
            PV.ParamByName('tipo_os').AsString := 'CLIENTE';
          end;
          PV.ParamByName('DATA_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
          PV.ParamByName('TIPV').AsString := 'V';
          PV.ParamByName('TIPOR').AsString := 'V';
          PV.ParamByName('NCUPOM').AsString := pDataSetCp.FieldByName('CUPOM').AsString;
          PV.ParamByName('CCF_CUPOM').AsString := pDataSetCp.FieldByName('CCF').AsString;
          PV.ParamByName('DATA_CUPOM').AsDateTime := pDataSetCp.FieldByName('DATA').AsDateTime;
          PV.ParamByName('OPERADOR').AsString := vDadosIni.vCodTerminal;
          PV.ParamByName('ACRESCIMO').AsCurrency := pDataSetCp.FieldByName('VALOR_ACRES').AsCurrency;
          PV.ParamByName('DESCONTO').AsCurrency := pDataSetCp.FieldByName('VALOR_DESC').AsCurrency;
          PV.ParamByName('NSERIEECF').AsString :=
            vDadosIni.decodifica(pDataSetCp.FieldByName('NSERIEECF').AsString);
          try
            if pDataSetCp.FieldByName('CLIENTE').AsInteger = 0 then
              PV.ParamByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao
            else
              PV.ParamByName('COD_CLIENTE').AsInteger := pDataSetCp.FieldByName('CLIENTE').AsInteger;
          except
            PV.ParamByName('COD_CLIENTE').AsString := vDadosIni.vCliente.vCodClientePadrao;
          end;
          try
            if pDataSetCp.FieldByName('COLABORADOR').AsInteger = 0 then
              PV.ParamByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao
            else
              PV.ParamByName('COD_VENDEDOR').AsInteger :=
                pDataSetCp.FieldByName('COLABORADOR').AsInteger;
          except
            PV.ParamByName('COD_VENDEDOR').AsString := vDadosIni.vCodVendedorPadrao;
          end;
          PV.ParamByName('COD_cond_pag').AsString :=
            retornaValor('select cod_cond_pag as valor from cond_pag where ' +
            ' desc_cond_pag like ' + QuotedStr('%' + 'ISTA' + '%'));
          PV.ParamByName('DATA_FECH').AsDateTime := PV.ParamByName('DATA_PED').AsDateTime;
          
          dataNow := vDadosIni.getDataHoraBanco(buscas);
          PV.ParamByName('data_fech').AsString := DateToStr(dataNow);
          PV.ParamByName('status_ped').AsString := 'FECHADA';
          PV.ParamByName('HORAFECHAMENTO').AsString := copy(timetostr(dataNow), 1, 2);
          PV.ParamByName('MINFECHAMENTO').AsString := copy(timetostr(dataNow), 4, 2);

          PV.ExecSQL;

//          ProdPV.Close;
//          ProdPV.CommandText := 'select * from pedvenda_prod where cod_empresa = '
//            + PV.FieldByName('cod_empresa').AsString +
//            ' and nped = ' + PV.FieldByName('nped').AsString +
//            ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
//          ProdPV.Open;
//          ServPV.Close;
//          ServPV.CommandText := 'select * from pedvenda_serv where cod_empresa = '
//            + PV.FieldByName('cod_empresa').AsString +
//            ' and nped = ' + PV.FieldByName('nped').AsString +
//            ' and tipo = ' + QuotedStr(PV.FieldByName('tipo').AsString);
//          ServPV.Open;

          vrTotProd := 0;
          vrTotServ := 0;
          vrTotal := 0;
          nItem := 0;
          pDataSetCp2.First;
          while not pDataSetCp2.Eof do
          begin
            if (pDataSetCp2.FieldByName('PROD_SERV').AsString = 'P') and
              ((pDataSetCp2.FieldByName('status_it').AsString <> 'CANCELADO') and
              (pDataSetCp2.FieldByName('status_it').IsNull)) then
            begin

              //verifica se Produto do pDataSetCp2 é tipo_item = 04
              buscas.Close;
              buscas.SQL.Clear;
              buscas.SQL.Add('select grupo_prod, cod_prod from produtos '+
                             'where cod_prod = '+QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString)+
                             'and grupo_prod = '+ pDataSetCp2.FieldByName('grupo_prod').AsString +
                             'and cod_empresa = '+ vdadosIni.Codempresa +
                             'and tipo_item = ''04'' ');
              buscas.Open;

              if not buscas.IsEmpty then
              begin
                 // pesquisa o indice tecinico do produto.
                 buscas.Close;
                 buscas.SQL.Clear;
                 buscas.SQL.Add('select it.* , pr.* '+
                                'from indice_tecnico it '+
                                'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
                                'where it.grupo_prod_acabado = '+ pDataSetCp2.FieldByName('grupo_prod').AsString +
                                'and it.cod_prod_acabado = '+ QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString) +
                                'and it.cod_empresa = '+ vdadosIni.Codempresa);
                 buscas.Open;
              end;


              if not buscas.IsEmpty then
              begin

                 // buscas vai conter as materias primas que serão adicionadas no ProdPV.

                 vQtdeIndice := 0;
                 vPCIndice := 0;
                 vPCTIndice := 0;

                 buscas.First;
                 while not buscas.Eof do
                 begin
                    vQtdeIndice := 0;
                    vPCIndice := 0;

                    vQtdeIndice := pDataSetCp2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat;  // 1 KG de Pão
                    if buscas.FieldByName('prec_cusm_prod').AsFloat > 0 then
                      vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice
                    else
                      vPCIndice := 1;

                    vPCTIndice := vPCTIndice + vPCIndice;  // 1,80  // Preço custo total dos Indices
                    buscas.Next;
                 end;

                 buscas.First;
                 while not buscas.Eof do
                 begin

                    editar := false;
                    ProdPV.First;
                    if vDadosIni.vModoCompatibilidade = 'S' then
                    begin
                      ProdPV.Close;
                      ProdPV.SQL.Text := 'select nped, QUANT_PED_ITEM, VLTOT_PED_ITEM, RATEIO_DESC, RATEIO_ACRESC, ' +
                        ' DESC_ITEM, ACRESC_ITEM, RATEIO_DESC, RATEIO_ACRESC from pedvenda_prod'+
                        ' where nped = ' + IntToStr(nPedVenda) +
                        ' and tipo = '  + QuotedStr(vTipo) +
                        ' and grupo_prod = ' + IntToStr(buscas.FieldByName('grupo_prod').AsInteger) +
                        ' and cod_prod = '  + QuotedStr(buscas.FieldByName('cod_prod').AsString) +
                        ' and cod_empresa = ' + vDadosIni.codEmpresa;
                      ProdPV.Open;
                      editar := not ProdPV.IsEmpty;

//                      while not ProdPV.Eof do
//                      begin
//                        if (buscas.FieldByName('grupo_prod').AsInteger =
//                          ProdPV.FieldByName('grupo_prod').AsInteger) and
//                          (trim(buscas.FieldByName('cod_prod').AsString) =
//                          trim(ProdPV.FieldByName('cod_prod').AsString)) then
//                        begin
//                          editar := true;
//                          break;
//                        end;
//                        ProdPV.Next;
//                      end;
                    end;

                    vPVProd := 0;
                    vQtdeIndice := 0;
                    vPCIndice := 0;
                    vPVTIndice := 0;
                    vPVUIndice := 0;

                    //Inserir ou Editar Indices Técnicos no lugar do produto acabado.

                    vPVProd := pDataSetCp2.FieldByName('QUANTIDADE').AsFloat * pDataSetCp2.FieldByName('preco').AsFloat; //3,45   //Preço de Venda Prod. Acabado
                    vQtdeIndice := pDataSetCp2.FieldByName('QUANTIDADE').AsFloat * buscas.FieldByName('quant').AsFloat; //0,3  //Qtde Vendida Indice
                    try
                      vPCIndice := buscas.FieldByName('prec_cusm_prod').AsFloat * vQtdeIndice; // 0,90  //Preço de Custo do Indice
                    except
                      vPCIndice := 1;
                    end;

                    vPVTIndice := (( vPVProd * vPCIndice ) / vPCTIndice );  //1,725  //Valor Total ( pv ) do Indice;
                    vPVUIndice := vPVTIndice / vQtdeIndice;  //5,75  //valor Unitario ( pv) do Indice;

                    if editar then
                    begin
                      buscas.Close;
                      buscas.SQL.Text := 'select nped, QUANT_PED_ITEM, VLTOT_PED_ITEM, RATEIO_DESC, RATEIO_ACRESC, ' +
                        ' DESC_ITEM, ACRESC_ITEM, RATEIO_DESC, RATEIO_ACRESC from pedvenda_prod'+
                        ' where nped = ' + IntToStr(nPedVenda) +
                        ' and tipo = '  + QuotedStr(vTipo) +
                        ' and grupo_prod = ' + IntToStr(ProdPV.FieldByName('grupo_prod').AsInteger) +
                        ' and cod_prod = '  + QuotedStr(ProdPV.FieldByName('cod_prod').AsString) +
                        ' and cod_empresa = ' + vDadosIni.codEmpresa;
                      buscas.Open;

                      ProdPV.Close;
                      ProdPV.SQL.Text := 'update pedvenda_prod set' +
                        ' QUANT_PED_ITEM = :QUANT_PED_ITEM, VLTOT_PED_ITEM = :VLTOT_PED_ITEM,' +
                        ' RATEIO_DESC = :RATEIO_DESC, RATEIO_ACRESC = :RATEIO_ACRESC, ' +
                        ' DESC_ITEM = :DESC_ITEM, ACRESC_ITEM = :ACRESC_ITEM' +
                        ' where nped = ' + IntToStr(nPedVenda) +
                        ' and tipo = '  + QuotedStr(vTipo) +
                        ' and grupo_prod = ' + IntToStr(pDataSetCp2.FieldByName('grupo_prod').AsInteger) +
                        ' and cod_prod = '  + QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString) +
                        ' and cod_empresa = ' + vDadosIni.codEmpresa;

                      ProdPV.ParamByName('QUANT_PED_ITEM').AsFloat :=
                        buscas.FieldByName('QUANT_PED_ITEM').AsFloat +
                        vQtdeIndice;

                      ProdPV.ParamByName('VLTOT_PED_ITEM').AsCurrency :=
                        buscas.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                        vPVTIndice;

                      if pDataSetCp2.FieldByName('RAT_DESC').AsFloat <> 0 then
                         ProdPV.ParamByName('RATEIO_DESC').AsCurrency :=
                           buscas.FieldByName('RATEIO_DESC').AsCurrency +
                           ((pDataSetCp2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                      if pDataSetCp2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                         ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                           buscas.FieldByName('RATEIO_ACRESC').AsCurrency +
                           ((pDataSetCp2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                      if pDataSetCp2.FieldByName('PERC_DESC').AsFloat <> 0 then
                      begin
                         ProdPV.ParamByName('DESC_ITEM').AsCurrency :=
                           buscas.FieldByName('DESC_ITEM').AsCurrency +
                           ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                         ProdPV.ParamByName('RATEIO_DESC').AsCurrency :=
                           buscas.FieldByName('RATEIO_DESC').AsCurrency +
                           ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);
                      end;

                      if pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                      begin
                         ProdPV.ParamByName('ACRESC_ITEM').AsCurrency :=
                           buscas.FieldByName('ACRESC_ITEM').AsCurrency +
                           ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                         ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                           buscas.FieldByName('RATEIO_ACRESC').AsCurrency +
                           ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);
                      end;

                      vrTotProd := vrTotProd + vQtdeIndice *
                        vPVUIndice;

                      vrTotal := vrTotal + ( vQtdeIndice * vPVUIndice) -
                        ((pDataSetCp2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd) +
                        ((pDataSetCp2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd) -
                        ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd) +
                        ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                      ProdPV.ExecSQL;

                    end
                    else
                    begin
                      ProdPV.Close;
                      ProdPV.SQL.Text := 'insert into PEDVENDA_PROD (' +
                        ' NPED, TIPO, COD_EMPRESA, NITEM, GRUPO_PROD, COD_PROD, COD_GRADE, CODIGO_NOP, DESCR_PROD_PED,' +
                        ' NUM_FAB_PROD, QUANT_PED_ITEM, VLUN_PED_ITEM, VLTOT_PED_ITEM, VLUN_ORIG, VLUN_PED_NF,' +
                        ' VLTOT_PED_NF, RATEIO_DESC, RATEIO_ACRESC, ALIQUOTA_CP, TP_NF_PED, SIT_ATD, DESC_ITEM,' +
                        ' ACRESC_ITEM, PCUST_C, PCUST_R, PCUST_MC, PCUST_MR, ICMANT_SUB)' +
                        ' VALUES (' +
                        ' :NPED, :TIPO, :COD_EMPRESA, :NITEM, :GRUPO_PROD, :COD_PROD, :COD_GRADE, :CODIGO_NOP, :DESCR_PROD_PED,' +
                        ' :NUM_FAB_PROD, :QUANT_PED_ITEM, :VLUN_PED_ITEM, :VLTOT_PED_ITEM, :VLUN_ORIG, :VLUN_PED_NF,' +
                        ' :VLTOT_PED_NF, :RATEIO_DESC, :RATEIO_ACRESC, :ALIQUOTA_CP, :TP_NF_PED, :SIT_ATD, :DESC_ITEM,' +
                        ' :ACRESC_ITEM, :PCUST_C, :PCUST_R, :PCUST_MC, :PCUST_MR, :ICMANT_SUB)';

                      inc(nitem);

                      ProdPV.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
                      ProdPV.ParamByName('tipo').AsString := vTipo;
                      ProdPV.ParamByName('nped').AsInteger := nPedVenda;

                      ProdPV.ParamByName('GRUPO_PROD').AsInteger :=
                        buscas.FieldByName('GRUPO_PROD').AsInteger;

                      ProdPV.ParamByName('COD_PROD').AsString :=
                        buscas.FieldByName('COD_PROD').AsString;

                      ProdPV.ParamByName('COD_GRADE').AsInteger := 0;
                      ProdPV.ParamByName('CODIGO_NOP').AsFloat := nItem;
                      ProdPV.ParamByName('DESCR_PROD_PED').AsString :=
                        buscas.FieldByName('DESCR_PROD').AsString;

                      ProdPV.ParamByName('NUM_FAB_PROD').AsString :=
                        buscas.FieldByName('num_fab_prod').AsString;

                      ProdPV.ParamByName('QUANT_PED_ITEM').AsFloat :=
                        vQtdeIndice;

                      ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat :=
                        vPVUIndice;

                      ProdPV.ParamByName('VLTOT_PED_ITEM').AsFloat :=
                        ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat *
                        ProdPV.ParamByName('QUANT_PED_ITEM').AsFloat;

                      ProdPV.ParamByName('VLUN_ORIG').AsFloat :=
                        ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat;

                      ProdPV.ParamByName('VLUN_PED_NF').AsFloat := vPVUIndice;

                      ProdPV.ParamByName('VLTOT_PED_NF').AsFloat :=
                        ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat *
                        vPVUIndice;

                      if pDataSetCp2.FieldByName('RAT_DESC').AsFloat <> 0 then
                         ProdPV.ParamByName('RATEIO_DESC').AsFloat :=
                           ((pDataSetCp2.FieldByName('RAT_DESC').AsFloat * vPVTIndice) / vPVProd);

                      if pDataSetCp2.FieldByName('RAT_ACRES').AsFloat <> 0 then
                         ProdPV.ParamByName('RATEIO_ACRESC').AsFloat :=
                           ((pDataSetCp2.FieldByName('RAT_ACRES').AsFloat * vPVTIndice) / vPVProd);

                      // Obs : olhar com JP de onde  tirar esta aliquota para materia prima.
                      ProdPV.ParamByName('ALIQUOTA_CP').AsString :=
                        pDataSetCp2.FieldByName('ALIQUOTA_IT').AsString;

                      ProdPV.ParamByName('TP_NF_PED').AsString := '2';
                      ProdPV.ParamByName('SIT_ATD').AsString := 'NT';

                      if pDataSetCp2.FieldByName('PERC_DESC').AsFloat <> 0 then
                         ProdPV.ParamByName('DESC_ITEM').AsFloat :=
                           ((pDataSetCp2.FieldByName('PERC_DESC').AsFloat * vPVTIndice) / vPVProd);

                      if pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat <> 0 then
                         ProdPV.ParamByName('ACRESC_ITEM').AsFloat :=
                           ((pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat * vPVTIndice) / vPVProd);

                      ProdPV.ParamByName('RATEIO_DESC').AsCurrency :=
                        ProdPV.ParamByName('RATEIO_DESC').AsCurrency +
                        ProdPV.ParamByName('DESC_ITEM').AsCurrency;

                      ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                        ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency +
                        ProdPV.ParamByName('ACRESC_ITEM').AsCurrency;

                      ProdPV.ParamByName('nitem').AsInteger := nItem;
                      ProdPV.ParamByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                      ProdPV.ParamByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                      ProdPV.ParamByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                      ProdPV.ParamByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                      ProdPV.ParamByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;

                      vrTotProd := vrTotProd + ProdPV.ParamByName('VLTOT_PED_ITEM').AsFloat;
                      vrTotal := vrTotal + ProdPV.ParamByName('VLTOT_PED_ITEM').AsFloat -
                        ProdPV.ParamByName('RATEIO_DESC').AsFloat +
                        ProdPV.ParamByName('RATEIO_ACRESC').AsFloat;// -
                        //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                        //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;

                      ProdPV.ExecSQL;
                      
                    end;
                    buscas.next;
                 end;
              end
              else
              begin

                // se não for Produto acabado ( tipo_item = 04) vai fazer o processo normal.
                editar := false;

                if vDadosIni.vModoCompatibilidade = 'S' then
                begin

                  buscas.Close;
                  buscas.SQL.Text := 'select nped, QUANT_PED_ITEM, VLTOT_PED_ITEM, RATEIO_DESC, RATEIO_ACRESC,' +
                    ' DESC_ITEM, ACRESC_ITEM, RATEIO_DESC, RATEIO_ACRESC from pedvenda_prod'+
                    ' where nped = ' + IntToStr(nPedVenda) +
                    ' and tipo = '  + QuotedStr(vTipo) +
                    ' and grupo_prod = ' + IntToStr(pDataSetCp2.FieldByName('grupo_prod').AsInteger) +
                    ' and cod_prod = '  + QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa;
                  buscas.Open;
                  editar := not buscas.IsEmpty;


//                  ProdPV.First;while not ProdPV.Eof do
//                  begin
//                    if (pDataSetCp2.FieldByName('grupo_prod').AsInteger =
//                      ProdPV.FieldByName('grupo_prod').AsInteger) and
//                      (trim(pDataSetCp2.FieldByName('cod_prod').AsString) =
//                      trim(ProdPV.FieldByName('cod_prod').AsString)) then
//                    begin
//                      editar := true;
//                      break;
//                    end;
//                    ProdPV.Next;
//                  end;
                end;

                if editar then
                begin
                  ProdPV.Close;
                  ProdPV.SQL.Text := 'update pedvenda_prod set' +
                    ' QUANT_PED_ITEM = :QUANT_PED_ITEM, VLTOT_PED_ITEM = :VLTOT_PED_ITEM,' +
                    ' RATEIO_DESC = :RATEIO_DESC, RATEIO_ACRESC = :RATEIO_ACRESC,' +
                    ' DESC_ITEM = :DESC_ITEM, ACRESC_ITEM = :ACRESC_ITEM' +
                    ' where nped = ' + IntToStr(nPedVenda) +
                    ' and tipo = '  + QuotedStr(vTipo) +
                    ' and grupo_prod = ' + IntToStr(pDataSetCp2.FieldByName('grupo_prod').AsInteger) +
                    ' and cod_prod = '  + QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa;

                  ProdPV.ParamByName('QUANT_PED_ITEM').AsFloat :=
                    buscas.FieldByName('QUANT_PED_ITEM').AsFloat +
                    pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                  ProdPV.ParamByName('VLTOT_PED_ITEM').AsCurrency :=
                    buscas.FieldByName('VLTOT_PED_ITEM').AsCurrency +
                    (pDataSetCp2.FieldByName('quantidade').AsFloat *
                    pDataSetCp2.FieldByName('PRECO').AsCurrency);
                  ProdPV.ParamByName('RATEIO_DESC').AsCurrency :=
                    buscas.FieldByName('RATEIO_DESC').AsCurrency +
                    pDataSetCp2.FieldByName('RAT_DESC').AsCurrency;
                  ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                    buscas.FieldByName('RATEIO_ACRESC').AsCurrency +
                    pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency;
                  ProdPV.ParamByName('DESC_ITEM').AsCurrency :=
                    buscas.FieldByName('DESC_ITEM').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;
                  ProdPV.ParamByName('ACRESC_ITEM').AsCurrency :=
                    buscas.FieldByName('ACRESC_ITEM').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                  ProdPV.ParamByName('RATEIO_DESC').AsCurrency :=
                    buscas.FieldByName('RATEIO_DESC').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;

                  ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                    buscas.FieldByName('RATEIO_ACRESC').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                  vrTotProd := vrTotProd + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                    pDataSetCp2.FieldByName('PRECO').AsCurrency);
                  vrTotal := vrTotal + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                    pDataSetCp2.FieldByName('PRECO').AsCurrency) -
                    pDataSetCp2.FieldByName('RAT_DESC').AsCurrency +
                    pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency -
                    pDataSetCp2.FieldByName('PERC_desc').AsCurrency +
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                  ProdPV.ExecSQL;
                end
                else
                begin
                  ProdPV.Close;
                  ProdPV.SQL.Text := 'insert into PEDVENDA_PROD (' +
                    ' NPED, TIPO, COD_EMPRESA, NITEM, GRUPO_PROD, COD_PROD, COD_GRADE, CODIGO_NOP, DESCR_PROD_PED,' +
                    ' NUM_FAB_PROD, QUANT_PED_ITEM, VLUN_PED_ITEM, VLTOT_PED_ITEM, VLUN_ORIG, VLUN_PED_NF,' +
                    ' VLTOT_PED_NF, RATEIO_DESC, RATEIO_ACRESC, ALIQUOTA_CP, TP_NF_PED, SIT_ATD, DESC_ITEM,' +
                    ' ACRESC_ITEM, PCUST_C, PCUST_R, PCUST_MC, PCUST_MR, ICMANT_SUB)' +
                    ' VALUES (' +
                    ' :NPED, :TIPO, :COD_EMPRESA, :NITEM, :GRUPO_PROD, :COD_PROD, :COD_GRADE, :CODIGO_NOP, :DESCR_PROD_PED,' +
                    ' :NUM_FAB_PROD, :QUANT_PED_ITEM, :VLUN_PED_ITEM, :VLTOT_PED_ITEM, :VLUN_ORIG, :VLUN_PED_NF,' +
                    ' :VLTOT_PED_NF, :RATEIO_DESC, :RATEIO_ACRESC, :ALIQUOTA_CP, :TP_NF_PED, :SIT_ATD, :DESC_ITEM,' +
                    ' :ACRESC_ITEM, :PCUST_C, :PCUST_R, :PCUST_MC, :PCUST_MR, :ICMANT_SUB)';

                  inc(nitem);

                  ProdPV.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
                  ProdPV.ParamByName('tipo').AsString := vTipo;
                  ProdPV.ParamByName('nped').AsInteger := nPedVenda;
                  ProdPV.ParamByName('GRUPO_PROD').AsInteger :=
                    pDataSetCp2.FieldByName('GRUPO_PROD').AsInteger;
                  ProdPV.ParamByName('COD_PROD').AsString :=
                    pDataSetCp2.FieldByName('COD_PROD').AsString;
                  ProdPV.ParamByName('COD_GRADE').AsInteger := 0;
                  ProdPV.ParamByName('CODIGO_NOP').AsFloat := nItem;
                  ProdPV.ParamByName('DESCR_PROD_PED').AsString :=
                    pDataSetCp2.FieldByName('DESCR_IT').AsString;
                  ProdPV.ParamByName('NUM_FAB_PROD').AsString :=
                    pDataSetCp2.FieldByName('CODBARRA').AsString;
                  ProdPV.ParamByName('QUANT_PED_ITEM').AsFloat :=
                    pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                  ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat :=
                    pDataSetCp2.FieldByName('PRECO').AsFloat;
                  ProdPV.ParamByName('VLTOT_PED_ITEM').AsFloat :=
                    ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat *
                    ProdPV.ParamByName('QUANT_PED_ITEM').AsFloat;
                  ProdPV.ParamByName('VLUN_ORIG').AsFloat :=
                    ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat;
                  ProdPV.ParamByName('VLUN_PED_NF').AsFloat := pDataSetCp2.FieldByName('PRECO').AsFloat;
                  ProdPV.ParamByName('VLTOT_PED_NF').AsFloat :=
                    ProdPV.ParamByName('VLUN_PED_ITEM').AsFloat *
                    pDataSetCp2.FieldByName('PRECO').AsFloat;
                  ProdPV.ParamByName('RATEIO_DESC').AsFloat :=
                    pDataSetCp2.FieldByName('RAT_DESC').AsFloat;
                  ProdPV.ParamByName('RATEIO_ACRESC').AsFloat :=
                    pDataSetCp2.FieldByName('RAT_ACRES').AsFloat;
                  ProdPV.ParamByName('ALIQUOTA_CP').AsString :=
                    pDataSetCp2.FieldByName('ALIQUOTA_IT').AsString;
                  ProdPV.ParamByName('TP_NF_PED').AsString := '2';
                  ProdPV.ParamByName('SIT_ATD').AsString := 'NT';
                  ProdPV.ParamByName('DESC_ITEM').AsFloat :=
                    pDataSetCp2.FieldByName('PERC_DESC').AsFloat;
                  ProdPV.ParamByName('ACRESC_ITEM').AsFloat :=
                    pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat;

                  ProdPV.ParamByName('RATEIO_DESC').AsCurrency :=
                    ProdPV.ParamByName('RATEIO_DESC').AsCurrency +
                    ProdPV.ParamByName('DESC_ITEM').AsCurrency;

                  ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                    ProdPV.ParamByName('RATEIO_ACRESC').AsCurrency +
                    ProdPV.ParamByName('ACRESC_ITEM').AsCurrency;

                  ProdPV.ParamByName('nitem').AsInteger := nItem;
                  buscas.Close;
                  buscas.SQL.Text:= ('select pr.PREC_CUS_PROD, pr.PREC_CUSR_PROD, pr.PREC_CUSM_PROD, pr.PREC_CUSMR_PROD,'+
                    ' pr.ICMANT_SUB from  produtos pr'+
                    ' where pr.grupo_prod = '+ pDataSetCp2.FieldByName('grupo_prod').AsString +
                    ' and pr.cod_prod = '+ QuotedStr(pDataSetCp2.FieldByName('cod_prod').AsString) +
                    ' and pr.cod_empresa = '+ vDadosIni.codEmpresa);
                  buscas.Open;
                  ProdPV.ParamByName('PCUST_C').AsCurrency := buscas.FieldByName('PREC_CUS_PROD').AsCurrency;
                  ProdPV.ParamByName('PCUST_R').AsCurrency := buscas.FieldByName('PREC_CUSR_PROD').AsCurrency;
                  ProdPV.ParamByName('PCUST_MC').AsCurrency := buscas.FieldByName('PREC_CUSM_PROD').AsCurrency;
                  ProdPV.ParamByName('PCUST_MR').AsCurrency := buscas.FieldByName('PREC_CUSMR_PROD').AsCurrency;
                  ProdPV.ParamByName('ICMANT_SUB').AsCurrency := buscas.FieldByName('ICMANT_SUB').AsCurrency;

                  vrTotProd := vrTotProd + ProdPV.ParamByName('VLTOT_PED_ITEM').AsFloat;
                  vrTotal := vrTotal + ProdPV.ParamByName('VLTOT_PED_ITEM').AsFloat -
                    ProdPV.ParamByName('RATEIO_DESC').AsFloat +
                    ProdPV.ParamByName('RATEIO_ACRESC').AsFloat;// -
                    //ProdPV.FieldByName('DESC_ITEM').AsFloat +
                    //ProdPV.FieldByName('ACRESC_ITEM').AsFloat;

                  ProdPV.ExecSQL;

                end;
              end;

            end
            else if (pDataSetCp2.FieldByName('PROD_SERV').AsString = 'S') and
              ((pDataSetCp2.FieldByName('status_it').AsString <> 'CANCELADO') and
              (pDataSetCp2.FieldByName('status_it').IsNull)) then
            begin
              editar := false;
              if vDadosIni.vModoCompatibilidade = 'S' then
              begin
                buscas.Close;
                buscas.SQL.Text := 'select nped, QUANT_PED_ITEM, VLTOT_PED_ITEM, RATEIO_DESC, RATEIO_ACRESC,' +
                  ' DESC_ITEM, ACRESC_ITEM, RATEIO_DESC, RATEIO_ACRESC from pedvenda_serv'+
                  ' where nped = ' + IntToStr(nPedVenda) +
                  ' and tipo = '  + QuotedStr(vTipo) +
                  ' and cod_servico = ' + IntToStr(pDataSetCp2.FieldByName('grupo_prod').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;
                buscas.Open;

                editar := not ProdPV.IsEmpty;

//                ServPV.First;
//                while not ServPV.Eof do
//                begin
//                  if (pDataSetCp2.FieldByName('grupo_prod').AsInteger =
//                    ServPV.FieldByName('cod_servico').AsInteger) then
//                  begin
//                    editar := true;
//                    break;
//                  end;
//                  ServPV.Next;
//                end;
              end;
              if editar then
              begin
                ServPV.Close;
                ServPV.SQL.Text := 'update PEDVENDA_SERV set'+
                  ' QUANT_SERV_PED = :QUANT_SERV_PED, VALOR_TOT_SERV = :VALOR_TOT_SERV,' +
                  ' RATEIO_DESC = :RATEIO_DESC, RATEIO_ACRESC = :RATEIO_ACRESC, DESC_ITEM = :DESC_ITEM,' +
                  ' ACRESC_ITEM = :ACRESC_ITEM' +
                  ' where nped = ' + IntToStr(nPedVenda) +
                  ' and tipo = '  + QuotedStr(vTipo) +
                  ' and cod_servico = ' +IntToStr(pDataSetCp2.FieldByName('grupo_prod').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;

                ServPV.ParamByName('QUANT_SERV_PED').AsFloat :=
                  buscas.FieldByName('QUANT_SERV_PED').AsFloat +
                  pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                ServPV.ParamByName('VALOR_TOT_SERV').AsCurrency :=
                  buscas.FieldByName('VALOR_TOT_SERV').AsCurrency +
                  (pDataSetCp2.FieldByName('quantidade').AsFloat *
                  pDataSetCp2.FieldByName('PRECO').AsCurrency);
                ServPV.ParamByName('RATEIO_DESC').AsCurrency :=
                  buscas.FieldByName('RATEIO_DESC').AsCurrency +
                  pDataSetCp2.FieldByName('RAT_DESC').AsCurrency;
                ServPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                  buscas.FieldByName('RATEIO_ACRESC').AsCurrency +
                  pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency;
                ServPV.ParamByName('DESC_ITEM').AsCurrency :=
                  buscas.FieldByName('DESC_ITEM').AsCurrency +
                  pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;
                ServPV.ParamByName('ACRESC_ITEM').AsCurrency :=
                  buscas.FieldByName('ACRESC_ITEM').AsCurrency +
                  pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                ServPV.ParamByName('RATEIO_DESC').AsCurrency :=
                  buscas.FieldByName('RATEIO_DESC').AsCurrency +
                  pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;

                ServPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                  buscas.FieldByName('RATEIO_ACRESC').AsCurrency +
                  pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                vrTotProd := vrTotProd + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                  pDataSetCp2.FieldByName('PRECO').AsCurrency);
                vrTotal := vrTotal + (pDataSetCp2.FieldByName('quantidade').AsFloat *
                  pDataSetCp2.FieldByName('PRECO').AsCurrency) -
                  pDataSetCp2.FieldByName('RAT_DESC').AsCurrency +
                  pDataSetCp2.FieldByName('RAT_ACRES').AsCurrency -
                  pDataSetCp2.FieldByName('PERC_desc').AsCurrency +
                  pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                ServPV.ExecSQL;
              end
              else
              begin
                ServPV.Close;
                ServPV.SQL.Text := 'insert into PEDVENDA_SERV values (' +
                  ' NPED, TIPO, COD_EMPRESA, NITEM, COD_SERVICO, COD_VENDEDOR, CODIGO_NOP,' +
                  ' QUANT_SERV_PED, VALOR_UN_SERV, VALOR_TOT_SERV, VLUN_ORIG, RATEIO_DESC,' +
                  ' RATEIO_ACRESC, DESC_SERV_PED, COD_VENDEDOR1, DESC_ITEM, ACRESC_ITEM)' +
                  ' values (' +
                  ' :NPED, :TIPO, :COD_EMPRESA, :NITEM, :COD_SERVICO, :COD_VENDEDOR, :CODIGO_NOP,' +
                  ' :QUANT_SERV_PED, :VALOR_UN_SERV, :VALOR_TOT_SERV, :VLUN_ORIG, :RATEIO_DESC,' +
                  ' :RATEIO_ACRESC, :DESC_SERV_PED, :COD_VENDEDOR1, :DESC_ITEM, :ACRESC_ITEM)';

                inc(nItem);

                ServPV.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
                ServPV.ParamByName('tipo').AsString := vTipo;
                ServPV.ParamByName('nped').AsInteger := nPedVenda;
                ServPV.ParamByName('COD_SERVICO').AsInteger :=
                  pDataSetCp2.FieldByName('GRUPO_PROD').AsInteger;
                ServPV.ParamByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
                ServPV.ParamByName('CODIGO_NOP').AsFloat := nItem;
                ServPV.ParamByName('QUANT_SERV_PED').AsFloat :=
                  pDataSetCp2.FieldByName('QUANTIDADE').AsFloat;
                ServPV.ParamByName('VALOR_UN_SERV').AsFloat :=
                  pDataSetCp2.FieldByName('PRECO').AsFloat;
                ServPV.ParamByName('VALOR_TOT_SERV').AsFloat :=
                  ServPV.ParamByName('VALOR_UN_SERV').AsFloat *
                  ServPV.ParamByName('QUANT_SERV_PED').AsFloat;
                ServPV.ParamByName('VLUN_ORIG').AsFloat :=
                  ServPV.ParamByName('VALOR_UN_SERV').AsFloat;
                ServPV.ParamByName('RATEIO_DESC').AsFloat :=
                  pDataSetCp2.FieldByName('RAT_DESC').AsFloat;
                ServPV.ParamByName('RATEIO_ACRESC').AsFloat :=
                  pDataSetCp2.FieldByName('RAT_ACRES').AsFloat;
                ServPV.ParamByName('DESC_SERV_PED').AsString :=
                  pDataSetCp2.FieldByName('DESCR_IT').AsString;
                ServPV.ParamByName('COD_VENDEDOR1').AsInteger :=
                  PV.FieldByName('COD_VENDEDOR').AsInteger;
                ServPV.ParamByName('DESC_ITEM').AsFloat :=
                  pDataSetCp2.FieldByName('PERC_DESC').AsFloat;
                ServPV.ParamByName('ACRESC_ITEM').AsFloat :=
                  pDataSetCp2.FieldByName('PERC_ACRESC').AsFloat;

                ServPV.ParamByName('RATEIO_DESC').AsCurrency :=
                  ServPV.ParamByName('RATEIO_DESC').AsCurrency +
                  pDataSetCp2.FieldByName('PERC_DESC').AsCurrency;

                ServPV.ParamByName('RATEIO_ACRESC').AsCurrency :=
                  ServPV.ParamByName('RATEIO_ACRESC').AsCurrency +
                  pDataSetCp2.FieldByName('PERC_ACRESC').AsCurrency;

                ServPV.ParamByName('nitem').AsInteger := nItem;

                vrTotServ := vrTotServ + ServPV.ParamByName('VALOR_TOT_SERV').AsFloat;
                vrTotal := vrTotal + ServPV.ParamByName('VALOR_TOT_SERV').AsFloat -
                  ServPV.ParamByName('RATEIO_DESC').AsFloat +
                  ServPV.ParamByName('RATEIO_ACRESC').AsFloat;// -
                  //ServPV.FieldByName('DESC_ITEM').AsFloat +
                  //ServPV.FieldByName('ACRESC_ITEM').AsFloat;
                ServPV.ExecSQL;
              end;
            end;

            pDataSetCp2.Next;
            vprogres.Position := vprogres.Position + 1;
          end;

          PV.Close;
          PV.SQL.Text := 'update pedvenda set' +
            ' TOT_PROD = :TOT_PROD, TOT_SERV = :TOT_SERV, VALOR_TOTAL = :VALOR_TOTAL'+
            ' where nped = '+ IntToStr(nPedVenda) +
            ' and tipo = ' + QuotedStr(vTipo) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;

          PV.ParamByName('TOT_PROD').AsCurrency := vrTotProd;
          PV.ParamByName('TOT_SERV').AsCurrency := vrTotServ;
          PV.ParamByName('VALOR_TOTAL').AsCurrency := vrTotal;

          PV.ExecSQL;

          ProdPV.Close;
          ProdPV.SQL.Text := 'select pp.GRUPO_PROD, pp.cod_prod, pp.QUANT_PED_ITEM, pp.TP_NF_PED, pp.cod_empresa' +
            ' from pedvenda_prod pp where pp.nped = '+IntToStr(nPedVenda)+
            ' and pp.tipo = '+QuotedStr(vTipo)+
            ' and pp.cod_empresa = ' + vDadosIni.codEmpresa;;
          ProdPV.Open;

          BaixaEstoque(ProdPV);

          CommitaTransacao;

          vprogres.Position := vprogres.Position + 1;
          vTipodll := 'REQVENDA';
          if vTipo = 'OS' then
            vTipodll := 'ORDEM_SERV';

          vMD5Func._gravaMD5_Produtos(PV, ProdPV, vTipo, nPedVenda);

        except
          on e: exception do begin
            RollBackTransacao;
            registraErro('Erro ao enviar para retaguarda cupom ' +
              pDataSetCp.FieldByName('cupom').AsString + ' Erro: ' + e.Message);
          end;
        end;
      end
      else
      begin
        vTipodll := 'REQVENDA';
        nPedVenda := PV.FieldByName('NPED').AsInteger;
        if vTipo = 'OS' then
          vTipodll := 'ORDEM_SERV';
      end;
    end;
  end;  
end;

{ TItemDAVF }

constructor TItemDAVF.create;
begin
  dataSet := TClientDataSet(dtmDAVF.cdsItDAVF);
  transacao := TIBTransaction(dtmDAVF.transacaoRet);
  buscas := TIBQuery(dtmDAVF.qrBuscas);
end;


function TItemDAVF.selecionaItensDaVenda(nPed: integer; tipo: string): boolean;
var
  vSqlTemp: string;
begin

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('VND154', 'HABILITAR', 'PAF', 'PEDVENDA_PROD', '', buscas, False) then
    vSqlTemp := ' and not ((coalesce(pp.status, '''') = ''CANCELADO'') and (coalesce(pp.quant_item_dev, 0) = coalesce(pp.quant_ped_item, 0)))'
  else
    vSqlTemp := '';

  Result := montaSelect('select ''P'' tipo, pp.nitem ,pp.nped,pp.cod_prod,' +
    ' pp.grupo_prod grupoOuServ,pp.cod_empresa, pp.num_fab_prod,' +
    ' pp.quant_ped_item qtde, pp.vlun_ped_item vl_unit,pp.descr_prod_ped descr,' +
    ' p.descr_prod_red d_red,pp.rateio_desc,pp.rateio_acresc,' +
    ' p.csdecqtde,p.csdecvlunt, pp.cod_grade, pp.status, pp.pcust_mc, pp.cod_vendedor from pedvenda_prod pp' +
    ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod' +
    ' and p.cod_empresa = pp.cod_empresa' +
    ' where pp.ativo = 1 and pp.cod_empresa = ' + vDadosIni.codEmpresa + ' and pp.nped = ' +
    IntToStr(nped) + ' and pp.tipo = ' + QuotedStr(tipo) + vSqlTemp +
    ' union' +
    ' select ''S'' tipo, ps.nitem, ps.nped, ps.cod_servico cod_prod, ps.cod_servico grupoOuServ,' +
    ' ps.cod_empresa, ps.cod_servico num_fab_prod, ps.quant_serv_ped qtde,ps.valor_un_serv vl_unit,' +
    ' ps.desc_serv_ped descr,'''' d_red,' +
    ' ps.rateio_desc,ps.rateio_acresc,2 csdecqtde,2 csdecvlunt, 0 cod_grade, ps.status, 0 pcust_mc, ps.cod_vendedor from pedvenda_serv ps' +
    ' where ps.ativo = 1 and ps.cod_empresa = ' + vDadosIni.codEmpresa + ' and ps.nped = ' +
    IntToStr(nped) + ' and ps.tipo = ' + QuotedStr(tipo)+
    ' union' +
    ' select ''T'' tipo, 1 nitem, pst.nped, 0 cod_prod, 0 grupoOuServ,' +
    ' pst.cod_empresa, 0 num_fab_prod, 1 qtde,pst.vl_servt vl_unit,' +
    ' pst.descr_servt descr,'''' d_red,' +
    ' 0 rateio_desc,0 rateio_acresc,2 csdecqtde,2 csdecvlunt, 0 cod_grade, '''' status, 0 pcust_mc, -1 cod_vendedor from pedvenda_serv_terc pst' +
    ' where pst.ativo = 1 and pst.cod_empresa = '+vDadosIni.codEmpresa+' and pst.nped =' +
    IntToStr(nped) + ' and pst.tipo = '+QuotedStr(tipo) +
    ' order by 1, 2' );
end;

{ TFrmPg }

constructor TFrmPg.create;
begin
  dataSet := TClientDataSet(dtmDAVF.cdsFrmPg);
  transacao := TIBTransaction(dtmDAVF.transacaoRet);
  buscas := TIBQuery(dtmDAVF.qrBuscas);
end;

destructor TFrmPg.Destroy;
begin

  inherited;
end;

function TFrmPg.selecionaFormaPagamento(tipoVenda: string;
  nped: integer): boolean;
begin
  Result := montaSelect('select fp.cod_controle, sum(fp.valordoc) valordoc from formpagamento fp' +
    ' where fp.nrequisicao = '+IntToStr(nped) +' and fp.tpdocs = '+ QuotedStr(tipoVenda) +
    ' and fp.cod_empresa = '+vDadosIni.codEmpresa + ' group by 1 order by 1');
//  select * from formpagamento where nrequisicao = ' +
//    IntToStr(nped) + ' and tpdocs = ' + QuotedStr(tipoVenda) + ' order by cod_controle');
end;

{ TPrestacoes_CX }

(*
function TPrestacoes_CX.abrePrestacoes(dataIni, dataFim: TDate): boolean;
begin
  Result := montaSelect('select pf.* from prestacoes_fiscal pf' +
    ' where pf.data_venc_c >= :dataIni and pf.data_venc_c <= :dataFim' +
    ' and pf.cod_empresa = '+vDadosIni.codEmpresa+
    ' and (pf.status <> '+QuotedStr('RECEBIDA')+
    ' or pf.status is null)',
    dataIni,dataFim);
end;

function TPrestacoes_CX.abrePrestacoes(cod_cred: integer): boolean;
begin
  Result := montaSelect('select pf.* from prestacoes_fiscal pf' +
    ' where pf.cod_cred = ' + IntToStr(cod_cred) +
    ' and pf.cod_empresa = '+vDadosIni.codEmpresa);
end;

function TPrestacoes_CX.cancelaRecebimento: boolean;
begin
  if dataSet.IsEmpty then
  begin
    Result := false;
    exit;
  end;
  if getPrestacaoPendente then
  begin
    dataSet.Edit;
    dataSet.FieldByName('cod_terminal').AsString := '';
    dataSet.FieldByName('nserieecf').AsString := '';
    dataSet.FieldByName('status').AsString := '';
    dataSet.Post;
    Apply;
    CommitaTransacao;
    Result := true;
  end;
end;

function TPrestacoes_CX.confirmaRecebimento(totalizador, finalizador,
  coo: integer): boolean;
begin
  if dataSet.IsEmpty then
  begin
    Result := false;
    exit;
  end;
  if getPrestacaoPendente then
  begin
    dataSet.Edit;
    dataSet.FieldByName('totalizador').AsInteger := totalizador;
    dataSet.FieldByName('finalizador').AsInteger := finalizador;
    dataSet.FieldByName('coo_documento').AsInteger := coo;
    dataSet.FieldByName('status').AsString := 'RECEBIDA';
    dataSet.Post;
    Apply;
    CommitaTransacao;
    Result := true;
  end;
end;

constructor TPrestacoes_CX.create;
begin
  dataSet := TClientDataSet(dtmDAVF.cdsPrestCx);
  buscas := TIBQuery(dtmDAVF.qrBuscas);
  transacao := TIBTransaction(dtmDAVF.transacaoRet);
end;

function TPrestacoes_CX.getPrestacaoPendente: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select pf.* from prestacoes_fiscal pf' +
    ' where pf.cod_cred = ' +IntToStr(dataSet.FieldByName('cod_cred').AsInteger)+
    ' and pf.cod_empresa = '+vDadosIni.codEmpresa;
  buscas.Open;
  if (buscas.FieldByName('cod_terminal').AsString = '') or
  (buscas.FieldByName('nserieecf').AsString = '') or
  (buscas.FieldByName('status').AsString = '') then
  begin
    Result := true;
    exit;
  end;
  if (buscas.FieldByName('cod_terminal').AsString <> vDadosIni.vCodTerminal) or
    (buscas.FieldByName('nserieecf').AsString <> vDadosIni.vNumSerieEcf) or
    (buscas.FieldByName('status').AsString = 'RECEBIDA') then
    Result := false
  else
    Result := true;
  buscas.Close;
end;

function TPrestacoes_CX.iniciaRecebimento: boolean;
begin
  Result := false;
  if dataSet.IsEmpty then
  begin
    Application.MessageBox('Nenhuma prestação encontrada', 'Atenção', mb_OK+MB_ICONINFORMATION);
    Result := false;
    exit;
  end;
  if getPrestacaoPendente then
  begin
    dataSet.Edit;
    dataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
    dataSet.FieldByName('nserieecf').AsString := vDadosIni.vNumSerieEcf;
    dataSet.FieldByName('status').AsString := 'RECEBENDO';
    dataSet.Post;
    Apply;
    CommitaTransacao;
    Result := true;
  end
  else
  begin
    Application.MessageBox('Prestação recebida ou esta sendo recebida em outro terminal', 'Atenção', mb_OK+MB_ICONINFORMATION);
    Result := false;
  end;
end;

function TPrestacoes_CX.inserePrestacao(cod_cred: integer): boolean;
var
  vSql:AnsiString;
  vData: TDate;
begin
  Result := False;
  buscas.Close;
  buscas.SQL.Text := 'select cod_cred, VALOR_CORR, DATA_VENC_C, N_DOC_C, TP_DOC_V'+
    ' N_DOC_V, COD_CLIENTE from CONTROLE_CREDITOS where '+
    ' cod_cred = '+IntToStr(cod_cred)+ ' and CODIGO_EMP = '+vDadosIni.codEmpresa;
  buscas.Open;
  if buscas.IsEmpty then
  begin
    buscas.close;
    Result := False;
    Application.MessageBox('Prestação não encontrada no Financeiro','Atençõ',0+64);
    Exit;
  end;
  vData:= buscas.FieldByName('DATA_VENC_C').AsDateTime;
  if vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_CORR').AsFloat,2) <= 0 then
  begin
    buscas.close;
    Result := False;
    Application.MessageBox('Prestação menor ou igual a zero','Atençõ',0+64);
    Exit;
  end;    

  vSql := 'INSERT INTO PRESTACOES_FISCAL (COD_CRED, COD_EMPRESA, ' +
    'VALOR_PRESTACAO, N_DOC_C, DATA_VENC_C, TP_DOC_V, N_DOC_V, COD_TERMINAL, NSERIEECF, ' +
    'STATUS, TOTALIZADOR, FINALIZADOR, COO_DOCUMENTO,COD_CLIENTE)' +
    'VALUES (' + IntToStr(buscas.FieldByName('COD_CRED').AsInteger) +
    ', ' + vDadosIni.codEmpresa +
    ', ' + StringReplace(Format('%0.2f',[buscas.FieldByName('VALOR_CORR').AsFloat]),',','.',[]) +
    ', ' + QuotedStr(buscas.FieldByName('N_DOC_C').AsString) +
    ', :vdata' +
    ', ' + QuotedStr(buscas.FieldByName('TP_DOC_V').AsString) +
    ', ' + IntToStr(buscas.FieldByName('N_DOC_V').AsInteger) +
    ', NULL, NULL, NULL, NULL, NULL, NULL' +
    ', ' + IntToStr(buscas.FieldByName('COD_CLIENTE').AsInteger) + ')';
  buscas.Close;
  buscas.SQL.Text := vSql;
  buscas.ParamByName('vdata').AsDate := vData;
  try
    buscas.ExecSQL;
    CommitaTransacao;
    Result := True;
  except
    on e: exception do begin
      Result := False;
      buscas.Close;
      Application.MessageBox(pchar(e.Message),'Erro',0+64);
      registraErro(e.Message);
    end;
  end;
  buscas.Close;
end;
*)

{ TPrestacoes_CX }

function TPrestacoes_CX.abrePrestacoes(dataIni, dataFim: TDate): boolean;
begin
  Result := montaSelect('select cc.cod_cred, cc.data_venc_c, cc.valor_c, cc.tp_rec_cxl,' +
    ' cc.dia_cxl, cc.vl_rq_pg_cxl, cc.valor_corr, cc.n_doc_c, cc.tp_doc_v, cc.n_doc_v, cc.op_cxl' +
    ' from controle_creditos cc where cc.data_venc_c >= :dataIni and' +
    ' cc.data_venc_c <= :dataFim and ((cc.status_c is null) or (cc.status_c <> ''QUITADO''))' +
    ' and cc.codigo_emp = '+vDadosIni.codEmpresa,dataIni, dataFim);
end;

function TPrestacoes_CX.abrePrestacoes(cod_cred: integer): boolean;
begin
  Result := montaSelect('select cc.cod_cred, cc.data_venc_c, cc.valor_c, cc.tp_rec_cxl,' +
    ' cc.dia_cxl, cc.vl_rq_pg_cxl, cc.valor_corr, cc.n_doc_c, cc.tp_doc_v, cc.n_doc_v, cc.op_cxl' +
    ' from controle_creditos cc where cc.cod_cred = ' +IntToStr(cod_cred)+
    ' and ((cc.status_c is null) or (cc.status_c <> ''QUITADO''))' +
    ' and cc.codigo_emp = '+vDadosIni.codEmpresa);
end;

function TPrestacoes_CX.abrePrestacoes(diaCxl: TDate): boolean;
begin
  Result := montaSelect('select cc.cod_cred, cc.data_venc_c, cc.valor_c, cc.tp_rec_cxl,' +
    ' cc.dia_cxl, cc.vl_rq_pg_cxl, cc.valor_corr, cc.n_doc_c, cc.tp_doc_v, cc.n_doc_v, cc.op_cxl' +
    ' from controle_creditos cc where cc.dia_cxl = :dataIni and' +
    ' cc.dia_cxl = :dataFim and ((cc.status_c is null) or (cc.status_c <> ''QUITADO''))' +
    ' and cc.codigo_emp = '+vDadosIni.codEmpresa,diaCxl, diaCxl);
end;

function TPrestacoes_CX.cancelaPrestacao(coonaofiscal: integer): boolean;
begin
  ExecutaComandosSqlExec( 'update controle_Creditos cc set ' +
    ' cc.coonaofiscal = null, cc.nserieecf = null, cod_terminal = null' +
    ' where cc.coonaofiscal = ' +IntToStr(coonaofiscal)+
    ' and cc.cod_terminal = ' +vDadosIni.vCodTerminal+
    ' and cc.nserieecf = '+QuotedStr(vDadosIni.vNumSerieEcf)+
    ' and cc.codigo_emp = '+vDadosIni.codEmpresa);
  CommitaTransacao;
end;

function TPrestacoes_CX.cancelaRecebimento: boolean;
begin
  Result := False;
  try
    buscas.Close;
    buscas.SQL.Text := 'select cc.cod_cred, cc.data_venc_c, cc.valor_c, cc.tp_rec_cxl,' +
      ' cc.dia_cxl, cc.vl_rq_pg_cxl, cc.valor_corr, cc.n_doc_c, cc.tp_doc_v, cc.n_doc_v,' +
      ' cc.coonaofiscal, cc.nserieecf, cc.cod_terminal'+
      ' from controle_creditos cc where cc.cod_cred = ' +IntToStr(dataSet.FieldByName('cod_cred').AsInteger)+
      ' and ((cc.status_c is null) or (cc.status_c <> ''QUITADO''))' +
      ' and cc.codigo_emp = '+vDadosIni.codEmpresa;
    buscas.Open;

    if (buscas.FieldByName('cod_terminal').AsInteger > 0) or
      (Trim(buscas.FieldByName('nserieecf').AsString) <> '') then
    begin
      if (buscas.FieldByName('cod_terminal').AsString <> vDadosIni.vCodTerminal) or
        (Trim(buscas.FieldByName('nserieecf').AsString) <> Trim(vDadosIni.vNumSerieEcf)) then
        exit;
    end;
    buscas.Close;
    buscas.SQL.Text := 'update controle_creditos set cod_terminal = null, coonaofiscal = null'+
    ' , nserieecf = null'+
    ' where cod_cred = ' +IntToStr(dataSet.FieldByName('cod_cred').AsInteger)+
    ' and codigo_emp = '+vDadosIni.codEmpresa;
    buscas.ExecSQL;
    CommitaTransacao;
    Result := True;
    buscas.Close;
  except
    on e: exception do begin
      Result := False;
      buscas.Close;
      Application.MessageBox(pchar(e.Message),'Erro',0+64);
      registraErro(e.Message);
    end;
  end;
end;

function TPrestacoes_CX.confirmaRecebimento(coo: integer): boolean;
begin
  Result := False;
  try
    buscas.Close;
    buscas.SQL.Text := 'update controle_creditos set coonaofiscal = '+IntToStr(coo)+
      ' where cod_cred = ' +IntToStr(dataSet.FieldByName('cod_cred').AsInteger)+
      ' and codigo_emp = '+vDadosIni.codEmpresa;
    buscas.ExecSQL;
    CommitaTransacao;
    Result := True;
    buscas.Close;
  except
    on e: exception do begin
      Result := False;
      buscas.Close;
      Application.MessageBox(pchar(e.Message),'Erro',0+64);
      registraErro(e.Message);
    end;
  end;
end;

constructor TPrestacoes_CX.create;
begin
  dataSet := TClientDataSet(dtmDAVF.cdsPrestCred);
  buscas := TIBQuery(dtmDAVF.qrBuscas);
  transacao := TIBTransaction(dtmDAVF.transacaoRet);
end;

function TPrestacoes_CX.iniciaRecebimento: boolean;
begin
  Result := False;
  try
    buscas.Close;
    buscas.SQL.Text := 'select cc.cod_cred, cc.data_venc_c, cc.valor_c, cc.tp_rec_cxl,' +
      ' cc.dia_cxl, cc.vl_rq_pg_cxl, cc.valor_corr, cc.n_doc_c, cc.tp_doc_v, cc.n_doc_v,' +
      ' cc.coonaofiscal, cc.nserieecf, cc.cod_terminal'+
      ' from controle_creditos cc where cc.cod_cred = ' +IntToStr(dataSet.FieldByName('cod_cred').AsInteger)+
      ' and ((cc.status_c is null) or (cc.status_c <> ''QUITADO''))' +
      ' and cc.codigo_emp = '+vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
      raise exception.create('Prestação não encontrada');

    if buscas.FieldByName('coonaofiscal').AsInteger > 0 then
      raise exception.create('Prestação já emitda Recebimento não fiscal no ECF');

    if (buscas.FieldByName('cod_terminal').AsInteger > 0) or
      (Trim(buscas.FieldByName('nserieecf').AsString) <> '') then
    begin
      if (buscas.FieldByName('cod_terminal').AsString <> vDadosIni.vCodTerminal) or
        (Trim(buscas.FieldByName('nserieecf').AsString) <> Trim(vDadosIni.vNumSerieEcf)) then
        raise exception.create('Prestação já está sendo recebida em outro Terminal');
    end;
    buscas.Close;
    buscas.SQL.Text := 'update controle_creditos set cod_terminal = '+vDadosIni.vCodTerminal+
    ' , nserieecf = '+QuotedStr(Trim(vDadosIni.vNumSerieEcf))+
    ' where cod_cred = ' +IntToStr(dataSet.FieldByName('cod_cred').AsInteger)+
    ' and codigo_emp = '+vDadosIni.codEmpresa;
    buscas.ExecSQL;
    CommitaTransacao;
    Result := True;
    buscas.Close;
  except
    on e: exception do begin
      Result := False;
      buscas.Close;
      Application.MessageBox(pchar(e.Message),'Erro',0+64);
      registraErro(e.Message);
    end;
  end;
end;

{ TPreVendaRetaguarda }

function TPreVendaRetaguarda.cancelarPreVenda(pVoltarEstoque: Boolean = True): Boolean;
begin
  inibeErro := 'S';
  Result := ExecutaComandosSqlExec('update pedvenda set PAF_STATUS_PREVENDA = ''CANCELADA'', STATUS_PED = ''CANCELADO'' '+
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(dataSet.FieldByName('TIPO').AsString));

  if pVoltarEstoque then
    VoltaEstoque(vItem.dataSet, True);

  CommitaTransacao;

  vItem.dataSet.First;
  while not vItem.dataSet.Eof do
  begin
    vMD5Func._gravaMD5_Produtos(buscas, vItem.dataSet.FieldByName('GRUPOOUSERV').AsInteger,
      vItem.dataSet.FieldByName('cod_prod').AsString);

    vItem.dataSet.Next;
  end;


end;

function TPreVendaRetaguarda.confirmaEmissaoCupomVenda(nCupom,
  nPreVnd: Integer): boolean;
var
  vTipodll: string;
begin
  try
    Result := True;
    inibeErro := 'S';
    vTipodll := 'REQVENDA';
    if Trim(dataSet.FieldByName('tipo').AsString) = 'OS' then
      vTipodll := 'ORDEM_SERV';
    buscas.Close;
    buscas.SQL.Text := 'update pedvenda set status_cupom = ''C'',codterm_status = ' + vDadosIni.vCodTerminal +
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(vTipoVenda);
    try buscas.ExecSQL; except end;

    buscas.Close;
    buscas.SQL.Text := 'update pedvenda set NCUPOM = ' + IntToStr(nCupom) + ', operador = ' + vDadosIni.vCodTerminal +
      ', nserieecf = ' + QuotedStr(vDadosIni.vNumSerieEcf) +
      ', data_cupom = '+QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.vdataGeral))+
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(vTipoVenda);
    try buscas.ExecSQL; except end;

    buscas.Close;
    buscas.SQL.Text := 'update ecf set NCUPOM = ' + IntToStr(nCupom) +
      ', cod_terminal = ' + vDadosIni.vCodTerminal +
      ', NSERIETERMINAL = ' + QuotedStr(vDadosIni.vNumSerieEcf) +
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and TIPO_PED = ' + QuotedStr(vTipoVenda);
    try buscas.ExecSQL; except end;

    buscas.Close;
    buscas.SQL.Text := 'update formpagamento set tip_cnt = ''C'' where '+
      ' nrequisicao = ' + dataSet.FieldByName('nped').AsString +
      ' and tpdocs = '+ QuotedStr(Trim(dataSet.FieldByName('tipo').AsString))+
      ' and cod_empresa = '+vDadosIni.codEmpresa;
    try buscas.ExecSQL; except end;

//    ExecutaComandosSql('select nped from pedvenda where nped = ' +
//      dataSet.FieldByName('nped').AsString +
//      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and status_cupom = ''C'' and' +
//      ' codterm_status = ' + vDadosIni.vCodTerminal + ' and tipo = ' + QuotedStr(vTipoVenda));
    CommitaTransacao;

    Result := True;
    if nCCF > 0 then
      confirmaEmissaoCupomVendaCCF(nCCF);
  except
    on e:exception do begin
//      Result := False;
//      Application.MessageBox(pchar('Erro ao definir numero do cupom fiscal na venda'),'Erro',0+64);
      registraErro('Erro ao definir numero do cupom na venda '+vTipodll + ' Num '+ dataSet.FieldByName('nped').AsString+
        e.Message );
    end;
  end;

end;

constructor TPreVendaRetaguarda.create;
begin
  if dtmDAVF = nil then
    dtmDAVF := TdtmDAVF.Create(dtmDAVF);
  dataSet := TClientDataSet(dtmDAVF.cdsPrV);
  transacao := TIBTransaction(dtmDAVF.transacaoRet);
  buscas := TIBQuery(dtmDAVF.qrBuscas);
  vItem := TItemDAVF.create;
  vItem.dataSet:= TClientDataSet(dtmDAVF.cdsItPV);
  vFrmPg := TFrmPg.create;
  dataSet.AfterScroll := ItemAfterScroll;
  nCCF := 0;
end;

destructor TPreVendaRetaguarda.Destroy;
begin
  vItem.Free;
  vItem := nil;
  vFrmPg.Free;
  vFrmPg := nil;
  inherited;
end;

function TPreVendaRetaguarda.selecionaVendasParaCupom(isento: integer): boolean;
var
  temp:string;
begin
  temp :='';
  vTipoVenda := 'REQ';
  if isento = 0 then
    temp :=  ' and (c.insc_est = ''ISENTO'' or (c.insc_est is null) or c.insc_est = '''')'
  else if isento = 1 then
    temp :=  ' and (c.insc_est <> ''ISENTO'' and (not c.insc_est is null))';
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
    +
    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.paf_num_prevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
    ' pd.tipv' +
    ' from pedvenda pd' +
    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +temp+
    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
    ' and pd.status_ped = ''FECHADA'''+
    ' and ((pd.ncupom = 0 ) or (pd.ncupom is null ))' +
    ' and ((pd.paf_num_prevenda > 0) or (not pd.paf_num_prevenda is null))'+
    ' and ((pd.num_nf is null) or (pd.num_nf <= 0)) ' +
    ' and ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and' +
    ' (codterm_status = ' + vDadosIni.vCodTerminal + ' or codterm_status = 0 or' +
    ' codterm_status is null) order by paf_num_prevenda');
  fDataVendas := 'Todos';
    if dataSet.IsEmpty then
      vItem.selecionaItensDaVenda(0,'');
end;

function TPreVendaRetaguarda.selecionaVendasParaCupom(nPed: integer;
  tipo: string; pCancelados: Boolean = False): boolean;
var
  vTemp: string;
begin
  vTipoVenda := tipo;
  vTemp := 'pd.status_ped = ''FECHADA''';
  if pCancelados then
    vTemp := '((pd.status_ped = ''FECHADA'') or (pd.status_ped = ''CANCELADO''))';
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
    +
    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.paf_num_prevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
    ' pd.tipv' +
    ' from pedvenda pd' +
    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
    ' and pd.nped = ' + IntToStr(nPed) + ' and pd.tipo = ' + QuotedStr(tipo) +
    ' and ' + vTemp + 
    ' and ((pd.ncupom = 0 ) or (pd.ncupom is null ))' +
    ' and ((pd.num_nf is null) or (pd.num_nf <= 0)) ' +
    ' and ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and' +
    ' (codterm_status = ' + vDadosIni.vCodTerminal + ' or codterm_status = 0 or' +
    ' codterm_status is null)');
  if dataSet.IsEmpty then
    vItem.selecionaItensDaVenda(0,'');
end;

function TPreVendaRetaguarda.selecionaVendasParaCupomDiaAtual(isento,
  maisDias: integer): boolean;
var
  data: TDate;
  temp:string;
begin
  vTipoVenda := 'REQ';
  temp :='';
  if isento = 0 then
    temp :=  ' and (c.insc_est = ''ISENTO'' or (c.insc_est is null) or c.insc_est = '''')'
  else if isento = 1 then
    temp :=  ' and (c.insc_est <> ''ISENTO'' and (not c.insc_est is null))';
  data:=vDadosIni.getDataBanco(buscas);
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech, pd.valor_total,pd.desconto,' +
                ' pd.acrescimo,pd.paf_num_prevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
                ' pd.tipv' +
                ' from pedvenda pd' +
                ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +temp+
                ' where pd.ativo = 1 and pd.cod_empresa  = '+vDadosIni.codEmpresa+' and pd.data_fech >= :data1 and pd.data_fech <= :data2 and' +
                ' pd.status_ped = ''FECHADA'' and'+
                ' ((pd.paf_num_prevenda > 0) or (not pd.paf_num_prevenda is null)) and' +
                ' ((pd.ncupom = 0 ) or (pd.ncupom is null )) and' +
                ' ((pd.num_nf is null) or (pd.num_nf <= 0)) and' +
                ' ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and (codterm_status = '+vDadosIni.vCodTerminal+' or' +
                ' codterm_status = 0 or codterm_status is null) order by paf_num_prevenda',data+maisDias,data+maisDias);
  fDataVendas := FormatDateTime('dd/mm/yyyy', data + maisDias);
    if dataSet.IsEmpty then
      vItem.selecionaItensDaVenda(0,'');
end;

function TPreVendaRetaguarda.voltarEstoque: Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select status_ped from pedvenda' +
                     ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
                     ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString) +
                     ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := (buscas.FieldByName('status_ped').AsString) = 'FECHADA';

end;

{ TDAVF }

function TDAVF.cancelarPreVenda(pVoltarEstoque: Boolean): Boolean;
begin
  inibeErro := 'S';
  Result := ExecutaComandosSqlExec('update pedvenda set PAF_STATUS_PREVENDA = ''CANCELADA'' '+
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(dataSet.FieldByName('TIPO').AsString));

//  if pVoltarEstoque then
//    VoltaEstoque(vItem.dataSet, True);

  CommitaTransacao;
end;

function TDAVF.confirmaEmissaoCupomVenda(nCupom, nDAV: Integer): boolean;
var
  vTipodll: string;
begin
  try
    Result := True;
    inibeErro := 'S';
    vTipodll := 'REQVENDA';
    if Trim(dataSet.FieldByName('tipo').AsString) = 'OS' then
      vTipodll := 'ORDEM_SERV';
    buscas.Close;
    buscas.SQL.Text := 'update pedvenda set status_cupom = ''C'',codterm_status = ' + vDadosIni.vCodTerminal +
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(vTipoVenda);
    try buscas.ExecSQL; except end;

    buscas.Close;
    buscas.SQL.Text := 'update pedvenda set NCUPOM = ' + IntToStr(nCupom) + ', operador = ' + vDadosIni.vCodTerminal +
      ', nserieecf = ' + QuotedStr(vDadosIni.vNumSerieEcf) +
      ', data_cupom = '+QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.vdataGeral))+
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tipo = ' + QuotedStr(vTipoVenda);
    try buscas.ExecSQL; except end;

    buscas.Close;
    buscas.SQL.Text := 'update ecf set NCUPOM = ' + IntToStr(nCupom) +
      ', cod_terminal = ' + vDadosIni.vCodTerminal +
      ', NSERIETERMINAL = ' + QuotedStr(vDadosIni.vNumSerieEcf) +
      ' where nped = ' + dataSet.FieldByName('nped').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and TIPO_PED = ' + QuotedStr(vTipoVenda);
    try buscas.ExecSQL; except end;

    buscas.Close;
    buscas.SQL.Text := 'update formpagamento set tip_cnt = ''C'' where '+
      ' nrequisicao = ' + dataSet.FieldByName('nped').AsString +
      ' and tpdocs = '+ QuotedStr(Trim(dataSet.FieldByName('tipo').AsString))+
      ' and cod_empresa = '+vDadosIni.codEmpresa;
    try buscas.ExecSQL; except end;

//    ExecutaComandosSql('select nped from pedvenda where nped = ' +
//      dataSet.FieldByName('nped').AsString +
//      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and status_cupom = ''C'' and' +
//      ' codterm_status = ' + vDadosIni.vCodTerminal + ' and tipo = ' + QuotedStr(vTipoVenda));
    CommitaTransacao;

    vMD5Func._gravaMD5_DAV(buscas, nDAV);

    Result := True;
    if nCCF > 0 then
      confirmaEmissaoCupomVendaCCF(nCCF);
  except
    on e:exception do begin
//      Result := False;
//      Application.MessageBox(pchar('Erro ao definir numero do cupom fiscal na venda'),'Erro',0+64);
      registraErro('Erro ao definir numero do cupom na venda '+vTipodll + ' Num '+ dataSet.FieldByName('nped').AsString+
        e.Message );
    end;
  end;
end;

constructor TDAVF.create;
begin
  apagarVendasRetaguarda := '';
  if dtmDAVF = nil then
    dtmDAVF := TdtmDAVF.Create(dtmDAVF);
  dataSet := TClientDataSet(dtmDAVF.cdsDAVF);
  transacao := TIBTransaction(dtmDAVF.transacaoRet);
  buscas := TIBQuery(dtmDAVF.qrBuscas);
  vItem := TItemDAVF.create;
  dataSet.AfterScroll := ItemAfterScroll;
  vFrmPg := TFrmPg.create;
  nCCF := 0;
end;

destructor TDAVF.Destroy;
begin
  vItem.Free;
  vItem := nil;
  vFrmPg.Free;
  vFrmPg := nil;
  inherited;
end;

function TDAVF.montarDAVparaImpressao(var pDAV: RVenda): Boolean;
var
  I, vCodCliente, vCodCondPag, vCodVendedor, vCodVeic, vCodEquip: Integer;
  vPlacaVeic, vChassiVeic: string;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('NPREVENDA').AsInteger = 0 then
    EXIT;

  buscas.Close;
  buscas.SQL.Text := 'select * from pedvenda' +
    ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
    ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if Trim(buscas.FieldByName('dav_impresso').AsString) = 'S' then
  begin
    Result := False;
    Application.MessageBox('DAV já impresso! Reimpressão não permitida', 'Atenção', 0+ 64);
    Exit;
  end;

  pDav.nped := buscas.FieldByName('nped').AsInteger;
  pDav.nprevenda := buscas.FieldByName('nprevenda').AsInteger;
  pDav.cod_cliente := buscas.FieldByName('cod_cliente').AsInteger;
  pDav.cod_vendedor := buscas.FieldByName('cod_vendedor').AsInteger;
  pDav.cod_cond_pag := buscas.FieldByName('cod_cond_pag').AsInteger;
  pDav.empresa := vDadosIni.vEmp.vRazaoSocial;
  pDav.fone_Empresa := vDadosIni.vEmp.vTelefone;
  pDav.cgc_emp := vDadosIni.vEmp.vCNPJ;
  pDav.tipo_venda := buscas.FieldByName('tipo').AsString;
  pDav.observacao := buscas.FieldByName('obs_ped').AsString;
  pDav.valor_bruto := buscas.FieldByName('tot_prod').AsCurrency + buscas.FieldByName('tot_serv').AsCurrency;
  pDav.valor_produtos := buscas.FieldByName('tot_prod').AsCurrency;
  pDav.valor_servicos := buscas.FieldByName('tot_serv').AsCurrency;
  pDav.valor_liquido := buscas.FieldByName('valor_total').AsCurrency;
  vCodCliente := buscas.FieldByName('cod_cliente').AsInteger;
  vCodCondPag := buscas.FieldByName('cod_cond_pag').AsInteger;
  vCodVendedor := buscas.FieldByName('cod_vendedor').AsInteger;
  vCodVeic := buscas.FieldByName('cod_veiculo').AsInteger;
  vPlacaVeic := buscas.FieldByName('placa').AsString;
  vChassiVeic := buscas.FieldByName('chassi').AsString;
  vCodEquip := buscas.FieldByName('cod_equip').AsInteger;

  buscas.Close;
  buscas.SQL.Text := 'select c.cod_cliente, c.nome_cliente, c.endereco, c.bairro, c.cidade, c.cpfcgc, c.insc_est, c.fone_cliente, e.sigla_uf' +
    ' from clientes c' +
    ' inner join estados e on e.codigo_uf = c.codigo_uf' +
    ' where cod_cliente = ' + IntToStr(vCodCliente) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  pDav.nome_cliente := buscas.FieldByName('nome_cliente').AsString;
  pDav.endereco_cliente := buscas.FieldByName('endereco').AsString;
  pDav.bairro_cliente := buscas.FieldByName('bairro').AsString;
  pDav.cidade_cliente := buscas.FieldByName('cidade').AsString;
  pDav.cnpjcpf_cliente := buscas.FieldByName('cpfcgc').AsString;
  pDav.insc_cliente := buscas.FieldByName('insc_est').AsString;
  pDav.fone_cliente := buscas.FieldByName('fone_cliente').AsString;
  pDav.estado_cliente := buscas.FieldByName('sigla_uf').AsString;
  pDav.usar_Declaracao := vDadosIni.vEmp.vUsarDeclSPCReq;

  buscas.Close;
  buscas.SQL.Text := 'select cod_cond_pag, desc_cond_pag from cond_pag where cod_cond_pag = ' + IntToStr(vCodCondPag);
  buscas.Open;
  pDav.cond_pag := buscas.FieldByName('desc_cond_pag').AsString;

  buscas.Close;
  buscas.SQL.Text := 'select cod_vendedor, nome_vendedor' +
    ' from colaborador where cod_vendedor = ' + IntToStr(vCodVendedor) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  pDav.vendedor := buscas.FieldByName('nome_vendedor').AsString;

  if vCodEquip > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select N_SERIE, NOM_EQUIP from equipamento' +
      ' where cod_equip = ' + IntToStr(vCodEquip) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if Trim(buscas.FieldByName('NOM_EQUIP').AsString) <> '' then
      pDAV.linhaAd1 := 'Objeto: ' + Trim(buscas.FieldByName('NOM_EQUIP').AsString);
    if Trim(buscas.FieldByName('N_SERIE').AsString) <> '' then
      pDAV.linhaAd2 := 'N.Serie: ' + Trim(buscas.FieldByName('N_SERIE').AsString);
  end
  else if vCodVeic > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select PLACA, MARCA_V, DESCMODELO, ANOFAB, RENAVAM from VEICULOS' +
      ' where codigo = ' + IntToStr(vCodVeic) +
      ' and placa = ' + QuotedStr(vPlacaVeic) +
      ' and chassi = ' + QuotedStr(vChassiVeic) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    pDAV.linhaAd1 := 'Veic Mod: ' + Trim(buscas.FieldByName('DESCMODELO').AsString);
    pDAV.linhaAd2 := 'Placa: ' + Trim(buscas.FieldByName('placa').AsString) + ' Marca: ' + Trim(buscas.FieldByName('MARCA_V').AsString);
    pDAV.linhaAd3 := 'Ano Fab: ' + Trim(buscas.FieldByName('ANOFAB').AsString) + ' Renavam: ' + Trim(buscas.FieldByName('RENAVAM').AsString);
  end;
  pDav.desconto := 0;
  pDav.acrescimo := 0;
  pDav.qtdeItens := 0;

  buscas.Close;
  buscas.SQL.Text := 'select pp.*, pr.descr_prod_red from pedvenda_prod pp' +
    ' inner join produtos pr on pr.grupo_prod = pp.grupo_prod and pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa' +
    ' where pp.nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
    ' and pp.tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString) +
    ' and pp.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;
  pDav.qtde_Produtos := buscas.RecordCount;
  pDav.qtdeItens := pDav.qtdeItens + pDav.qtde_Produtos;

  SetLength(pDav.item, pDav.qtdeItens);
  i := 0;
  buscas.First;
  while not buscas.Eof do
  begin
    pDav.item[i].tipo := 'P';
    pDav.item[i].cod_prod := buscas.FieldByName('cod_prod').AsString;
    pDav.item[i].num_fab_prod := buscas.FieldByName('num_fab_prod').AsString;
    pDav.item[i].descr := buscas.FieldByName('descr_prod_ped').AsString;
    pDav.item[i].descr_red := buscas.FieldByName('descr_prod_red').AsString;
    pDav.item[i].csdecqtde := buscas.FieldByName('csdecqtde').AsString;
    pDav.item[i].csdecvlunt := buscas.FieldByName('csdecvlunt').AsString;
    pDav.item[i].nped := buscas.FieldByName('nped').AsInteger;
    pDav.item[i].grupo_prod := buscas.FieldByName('grupo_prod').AsInteger;
    pDav.item[i].cod_empresa := buscas.FieldByName('cod_empresa').AsInteger;
    pDav.item[i].qtde := buscas.FieldByName('quant_ped_item').AsFloat;
    pDav.item[i].vl_unit := buscas.FieldByName('vlun_ped_item').AsCurrency;
    pDav.item[i].rateio_desc := buscas.FieldByName('rateio_desc').AsCurrency;
    pDav.item[i].rateio_acresc := buscas.FieldByName('rateio_acresc').AsCurrency;
    pDav.item[i].desc_item := 0;
    pDav.item[i].acresc_intem := 0;

    pDav.desconto := pDav.desconto + buscas.FieldByName('rateio_desc').AsCurrency;
    pDav.acrescimo := pDav.acrescimo + buscas.FieldByName('rateio_acresc').AsCurrency;

    inc(i);
    buscas.Next;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select ps.* from pedvenda_serv ps' +
    ' where ps.nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
    ' and ps.tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString) +
    ' and ps.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;
  pDav.qtde_Servicos := buscas.RecordCount;
  pDav.qtdeItens := pDav.qtdeItens + pDav.qtde_Servicos;

  SetLength(pDav.item, pDav.qtdeItens);
  buscas.First;
  while not buscas.Eof do
  begin
    pDav.item[i].tipo := 'S';
    pDav.item[i].cod_prod := buscas.FieldByName('cod_servico').AsString;
    pDav.item[i].num_fab_prod := buscas.FieldByName('cod_servico').AsString;
    pDav.item[i].descr := buscas.FieldByName('desc_serv_ped').AsString;
    pDav.item[i].csdecqtde := '3';
    pDav.item[i].csdecvlunt := buscas.FieldByName('csdecvlunt').AsString;
    pDav.item[i].nped := buscas.FieldByName('nped').AsInteger;
    pDav.item[i].grupo_prod := buscas.FieldByName('cod_servico').AsInteger;
    pDav.item[i].cod_empresa := buscas.FieldByName('cod_empresa').AsInteger;
    pDav.item[i].qtde := buscas.FieldByName('quant_serv_ped').AsFloat;
    pDav.item[i].vl_unit := buscas.FieldByName('valor_un_serv').AsCurrency;
    pDav.item[i].rateio_desc := buscas.FieldByName('rateio_desc').AsCurrency;
    pDav.item[i].rateio_acresc := buscas.FieldByName('rateio_acresc').AsCurrency;
    pDav.item[i].desc_item := 0;
    pDav.item[i].acresc_intem := 0;
    
    pDav.desconto := pDav.desconto + buscas.FieldByName('rateio_desc').AsCurrency;
    pDav.acrescimo := pDav.acrescimo + buscas.FieldByName('rateio_acresc').AsCurrency;
    inc(i);
    buscas.Next;
  end;
  Result := True
end;

function TDAVF.selecionaVendasDAVEmitidos(dataIni, dataFim: TDate): boolean;
begin
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
    +
    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.nprevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
    ' pd.tipv' +
    ' from pedvenda pd' +
    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
    ' and pd.data_fech >= :dataIni and pd.data_fech <= :dataFim ' +
    ' and pd.status_ped = ''FECHADA'' '+
    ' and ((pd.nprevenda <> 0) and (not pd.nprevenda is null)) order by pd.data_fech', dataIni,
    dataFim);
end;

function TDAVF.selecionaVendasDAVOSEmitidos(dataIni, dataFim: TDate): boolean;
begin
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
    +
    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.nprevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
    ' pd.tipv' +
    ' from pedvenda pd' +
    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
    ' and pd.tipo = ''OS''' +
    ' and pd.data_fech >= :dataIni and pd.data_fech <= :dataFim ' +
    ' and pd.status_ped = ''FECHADA'' '+
    ' and ((pd.nprevenda <> 0) and (not pd.nprevenda is null)) order by pd.data_fech', dataIni,
    dataFim);
end;

function TDAVF.selecionaVendasParaCupom(isento: integer): boolean;
var
  temp:string;
begin
  temp :='';
  if isento = 0 then
    temp :=  ' and (c.insc_est = ''ISENTO'' or (c.insc_est is null) or c.insc_est = '''')'
  else if isento = 1 then
    temp :=  ' and (c.insc_est <> ''ISENTO'' and (not c.insc_est is null))';
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
    +
    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.nprevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
    ' pd.tipv' +
    ' from pedvenda pd' +
    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +temp+
    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
    ' and pd.status_ped = ''FECHADA'''+
    ' and ((pd.ncupom = 0 ) or (pd.ncupom is null ))' +
    ' and ((pd.nprevenda > 0) or (not pd.nprevenda is null))'+
    ' and ((pd.num_nf is null) or (pd.num_nf <= 0)) ' +
    ' and coalesce(paf_status_prevenda, '''') = '''' ' +
    ' and ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and' +
    ' (codterm_status = ' + vDadosIni.vCodTerminal + ' or codterm_status = 0 or' +
    ' codterm_status is null) order by nprevenda');
  fDataVendas := 'Todos';

    if dataSet.IsEmpty then
      vItem.selecionaItensDaVenda(0,'');
end;

function TDAVF.selecionaVendasParaCupom(nPed: integer; tipo: string; pCancelados: Boolean = False): boolean;
begin
  vTipoVenda := tipo;
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
    +
    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.nprevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
    ' pd.tipv' +
    ' from pedvenda pd' +
    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
    ' and pd.nped = ' + IntToStr(nPed) + ' and pd.tipo = ' + QuotedStr(tipo) +
    ' and pd.status_ped = ''FECHADA'' '+
    ' and ((pd.ncupom = 0 ) or (pd.ncupom is null ))' +
    ' and ((pd.num_nf is null) or (pd.num_nf <= 0)) ' + 
    ' and coalesce(paf_status_prevenda, '''') = '''' ' +
    ' and ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and' +
    ' (codterm_status = ' + vDadosIni.vCodTerminal + ' or codterm_status = 0 or' +
    ' codterm_status is null)');
  if dataSet.IsEmpty then
    vItem.selecionaItensDaVenda(0,'');
  fOSPermiteCupom := True;

  if Trim(tipo) = 'OS' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select pv.nped from pedvenda pv' +
      ' inner join tipo_vendas tv on tv.tipo_os = pv.tipo_os' +
      ' where pv.nped = ' + IntToStr(nPed) + ' and pv.tipo = ' + QuotedStr(tipo) + ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tv.permitir_cupom_servico = ''N'' and tv.tipo = ''OS''';
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      fOSPermiteCupom := False;
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select pv.nped from pedvenda pv' +
      ' inner join tipo_vendas tv on tv.tipo_os = pv.subtipo_os' +
      ' where pv.nped = ' + IntToStr(nPed) + ' and pv.tipo = ' + QuotedStr(tipo) + ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tv.permitir_cupom_servico = ''N'' and tv.tipo = ''OSS''';
    buscas.Open;
    if not buscas.IsEmpty then
      fOSPermiteCupom := False;
  end;
end;

function TDAVF.selecionaVendasParaCupomDiaAtual(isento,
  maisDias: integer): boolean;
var
  data: TDate;
  temp:string;
begin
  temp :='';
  if isento = 0 then
    temp :=  ' and (c.insc_est = ''ISENTO'' or (c.insc_est is null) or c.insc_est = '''')'
  else if isento = 1 then
    temp :=  ' and (c.insc_est <> ''ISENTO'' and (not c.insc_est is null))';
  data:=vDadosIni.getDataBanco(buscas);
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech, pd.valor_total,pd.desconto,' +
                ' pd.acrescimo,pd.nprevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
                ' pd.tipv' +
                ' from pedvenda pd' +
                ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +temp+
                ' where pd.ativo = 1 and pd.cod_empresa  = '+vDadosIni.codEmpresa+' and pd.data_fech >= :data1 and pd.data_fech <= :data2 and' +
                ' pd.status_ped = ''FECHADA'' and'+
                ' ((pd.nprevenda > 0) or (not pd.nprevenda is null)) and' +
                ' ((pd.ncupom = 0 ) or (pd.ncupom is null )) and' +
                ' ((pd.num_nf is null) or (pd.num_nf <= 0)) and' +
                ' coalesce(paf_status_prevenda, '''') = '''' and ' +
                ' ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and (codterm_status = '+vDadosIni.vCodTerminal+' or' +
                ' codterm_status = 0 or codterm_status is null) order by nprevenda',data+maisDias,data+maisDias);
  fDataVendas := FormatDateTime('dd/mm/yyyy', data + maisDias);
    if dataSet.IsEmpty then
      vItem.selecionaItensDaVenda(0,'');
//                '   select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
//    +
//    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.nprevenda,pd.status_cupom,pd.codterm_status from pedvenda pd' +
//    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
//    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
//    ' and pd.data_ped >= :data1 and pd.data_ped <= :data2'+
//    ' and (pd.nprevenda > 0) or (not pd.nprevenda is null)'+
//    ' and ((pd.ncupom = 0 ) or (pd.ncupom is null ))' +
//    ' and ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and' +
//    ' (codterm_status = ' + vDadosIni.vCodTerminal + ' or codterm_status = 0 or' +
//    ' codterm_status is null) order by nprevenda',data, data);
end;

function TDAVF.selecionaVendasParaCupomUltimos30Dias: boolean;
var
  data: TDate;
begin
  data:=vDadosIni.getDataBanco(buscas);
  Result :=
    montaSelect('select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vendedor,pd.data_fech,'
    +
    ' pd.valor_total,pd.desconto, pd.acrescimo,pd.nprevenda,pd.status_cupom,pd.codterm_status,pd.ncupom, pd.coo_impressao, pd.coo_conta_cliente, pd.cer_conta_cliente,' +
    ' pd.tipv' +
    ' from pedvenda pd' +
    ' inner join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
    ' where pd.ativo = 1 and pd.cod_empresa  = ' + vdadosini.codempresa +
    ' and pd.data_fech >= :data1 and pd.data_fech <= :data2'+
    ' and pd.status_ped = ''FECHADA'' '+
    ' and (pd.nprevenda > 0) or (not pd.nprevenda is null)'+
    ' and ((pd.ncupom = 0 ) or (pd.ncupom is null ))' +
    ' and ((pd.num_nf is null) or (pd.num_nf <= 0)) ' +
    ' and coalesce(paf_status_prevenda, '''') = '''' ' +
    ' and ((status_cupom <> ''P'' and status_cupom <> ''C'') or (status_cupom is null)) and' +
    ' (codterm_status = ' + vDadosIni.vCodTerminal + ' or codterm_status = 0 or' +
    ' codterm_status is null) order by nprevenda',data - 30 , data);
  if dataSet.IsEmpty then
    vItem.selecionaItensDaVenda(0,'');
end;

procedure TDAVF.setDavImpressoECF(pDAV: RVenda);
begin
  if not buscas.Transaction.InTransaction then
    buscas.Transaction.StartTransaction;

  buscas.Close;
  buscas.SQL.Text := 'update pedvenda set COO_IMPRESSAO = ' + IntToStr(pDAV.COO_Impressao) +
    ',NSERIECF_IMPRESSAO = ' + QuotedStr(pDAV.NSerie_Impressao) +
    ', OPERADOR_IMPRESSAO = ' + IntToStr(pDAV.CAIXA_Impressao) +
    ', DAV_IMPRESSO = ''S''' +
    ' where nped = ' + dataSet.FieldByName('NPED').AsString +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo').AsString);
  buscas.ExecSQL;

  if buscas.Transaction.InTransaction then
		buscas.Transaction.Commit;

  vMD5Func._gravaMD5_DAV(buscas, dataSet.FieldByName('nprevenda').AsInteger);
end;

procedure TDAVF.sincronizaDAVNoRet_nao_usar(nCupom, nRegistro, nPrevenda: integer;
  vprogres: TProgressBar);
var
  cupom, cupom2, PV, ProdPV, ServPV: TClientDataSet;
  vTipo: string;
  dataNow: TDateTime;
  vrTotProd, vrTotServ, vrTotal: Currency;
  editar: Boolean;
  nItem: Integer;
  nPedVenda: Integer;
  vTipodll: string;
begin
  if vDadosIni.bancoConectado = 'local' then
    exit;
//  if FileExists(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe') then
//    WinExec(Pchar(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe'), SW_SHOWNOACTIVATE);
  apagarVendasRetaguarda := 'N';
  if not dtmAtivo.bancoHw.Connected then
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, false) then
      Exit;
  cupom := TClientDataSet(dtmDAVF.cdsCP);
  cupom2 := TClientDataSet(dtmDAVF.cdsCP2);
  PV := TClientDataSet(dtmDAVF.cdsPV);
  ProdPV := TClientDataSet(dtmDAVF.cdsProdPV);
  ServPV := TClientDataSet(dtmDAVF.cdsServPV);
  if dtmDAVF.ibTransCp.InTransaction then
    dtmDAVF.ibTransCp.Commit;
  dtmDAVF.ibTransCp.StartTransaction;
  CommitaTransacao;
  IniciaTransacao;
  cupom.Close;
  cupom.CommandText := 'select * from cupom where cupom = ' + IntToStr(nCupom) +
    ' and registro = ' + IntToStr(nRegistro) +
    ' and prevenda = ' + IntToStr(nPrevenda) +
    ' and nserieecf = ' + QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf)) +
    ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and cod_empresa = ' + vDadosIni.codEmpresa ;
  cupom.Open;
  if cupom.IsEmpty then
    Exit;
  vprogres.Min := 0;
  vprogres.Position := 0;
  while not cupom.Eof do
  begin
      PV.Close;
      PV.CommandText := 'select * from pedvenda where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ncupom = ' + cupom.FieldByName('cupom').AsString +
        ' and nserieecf = ' +  QuotedStr(vDadosIni.decodifica(cupom.FieldByName('nserieecf').AsString))+
        ' and operador = ' + vDadosIni.vCodTerminal;
      PV.Open;
      if cupom.FieldByName('status_cp').AsString = 'CANCELADO' then
      begin
        if not pv.IsEmpty then
        begin
          vTipo := PV.FieldByName('TIPO').AsString;
          ExecutaComandosSqlExec('update pedvenda set nserieecf = null' +
            ', ncupom = null ' +
            ', data_cupom = null ' +
            ', operador = null '+
            ', STATUS_CUPOM = null '+
            ', CODTERM_STATUS = null '+
            ', CCF_CUPOM = null' +
            ' where cod_empresa = ' + vDadosIni.codEmpresa +
            ' and tipo = ' + QuotedStr(vTipo) + ' and nped = ' +
            PV.FieldByName('nped').AsString );

          buscas.Close;
          buscas.SQL.Text := 'update ecf set NCUPOM = null ' +
            ', cod_terminal = null' +
            ', NSERIETERMINAL = null' +
            ' where nped = ' + PV.FieldByName('nped').AsString +
            ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and TIPO_PED = ' + QuotedStr(vTipo);
          buscas.ExecSQL;

          if vTipo = 'REQ' then
          ExecutaComandosSqlExec('update reqvenda set nserieecf = null' +
            ', ncupom = null' +
            ', operador = null'+
            ' where cod_empresa = ' + vDadosIni.codEmpresa +
            ' and nreq = ' + PV.FieldByName('nped').AsString )
          else
            ExecutaComandosSqlExec('update ordem_serv set nserieecf = null' +
            ', ncupom = null' +
            ', operador = null'+
            ' where cod_empresa = ' + vDadosIni.codEmpresa +
            ' and n_os = ' + PV.FieldByName('nped').AsString );
          CommitaTransacao;
          IniciaTransacao;
        end;
        PV.close;
        vprogres.Position := vprogres.Position + 1;
      end;
    cupom.Next;
  end;
end;

end.

