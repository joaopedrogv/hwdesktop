unit uClassesNotasFiscais_pedidos;

interface

uses
  uDataSet_OOP,
  DB,
  DBClient,
  uClassesNotasFiscais_consts,
  Classes,
  IBQuery,
  vw_clientes_dest_class,
  pedvenda_ref_nf_class,
  uDadosIni, Contnrs;

type

  TItemTransitoNF = class(TDataSet_OOP)
  private
    sqlTemp: WideString;
  public
    constructor create;
    function selecionaItem(pNumNota, pNumCaixa: integer): boolean;
  end;

  TTransitoNF = class(TDataSet_OOP)
  private
    procedure AfterScrollTransitoNF(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create;
    function pesquisaTransitoNotaFiscal(pNumNfChassi, pDataIni, pDataFim: string): boolean;
  var
    vItem: TItemTransitoNF;
  end;

  TItemComFatNF = class(TDataSet_OOP)
  private
    sqlTemp: WideString;
  public
    destructor Destroy; override;
    constructor create;
    function selecionaItem(pComando: integer; pChassi: string; pCodigo: Integer = 0): boolean;
  end;

  TComFatNF = class(TDataSet_OOP)
  private
    procedure AfterScrollComandoNF(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create;
    function pesquisaComandoFaturamento(pCodCliente: Integer;
      pComandoChassi, pDataIni, pDataFim: string): boolean;
    function pesquisaContratoFaturamento(pCodCliente: Integer;
      pComandoChassi, pDataIni, pDataFim: string): boolean;
  var
    vItem: TItemComFatNF;
  end;    

  TItemPedidoNFRec = class(TDataSet_OOP)
  private
    fItensPedidosNF: TDataSet_OOP;
  public
    vAutomatica: Boolean;
    procedure AfterScrollItens(DataSet: TDataSet);
    constructor create;
    procedure clearData;
    procedure montarDataSet(vItem: TDataSet_OOP);
    function marcaDesmarcaItem(vItem: TDataSet_OOP): Boolean;
    function confirmaBaixaItensPedidos(vItem: TDataSet_OOP): Boolean;
    function validaBaixaSemMarcarPedidos(vItem: TDataSet_OOP): Boolean;
  end;

  TAuxped_class = class(TObject)
  private
    Fnped          : Integer;
    Ftipo          : string;
    Fnf_ac_calctrib: string;
  public
    procedure ShowLog(Alog: string);

    property nped          : Integer read Fnped           write Fnped;
    property tipo          : string  read Ftipo           write Ftipo;
    property nf_ac_calctrib: string  read Fnf_ac_calctrib write Fnf_ac_calctrib;
  end;

  TAuxped_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TAuxped_class;
    procedure SetItem(Index: Integer; const Value: TAuxped_class);
  public
    function New: TAuxped_class;
    function GetAuxPed(Anped: Integer; Atipo: string): TAuxped_class;

    property Items[Index: Integer]: TAuxped_class read GetItem write SetItem;
  end;

  THw_pedvenda_ref_nf_classList = class(TPedvenda_ref_nf_classList)
  public
    function Add(Anped: Integer; Atipo: string; Acod_empresa: Integer = 0; Acod_nf: Integer = 0): Integer; overload;
  end; 

  TPedCompraItensNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaItensPedCompraNf(pNped: integer): boolean;
  end;

  TPedCompraNF = class(TDataSet_OOP)
  private
    procedure AfterScrollPedCompraNF(DataSet: TDataSet);
  public
    vComandTextUltimo: WideString;
    constructor create;
    function pesquisaPedCompra(pNped, pCodFornecedor: Integer;
      pDataIni, pDataFim: string): boolean;
    function abrePedCompra(pNped: integer): boolean;
  var
    vItem: TPedCompraItensNF;
  end;

  TPedVendaItensNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaItensPedVendaNf(pNped: integer; pTipo: string): boolean;
  end;

  TPedVendaNF = class(TDataSet_OOP)
  private
    procedure AfterScrollPedVendaNf(DataSet: TDataSet);
  public
    constructor create;
    function pesquisaPedVenda(pReq, pOrdServ: boolean; pNped, pCodCliente: Integer;
      pDataIni, pDataFim: string; pApenasComCupom: Boolean; pVendasVAN: Boolean): boolean; overload;
    function pesquisaPedVenda(pReq: integer; pTipo: string): boolean; overload;
    procedure check_uncheck; overload;
    procedure check_uncheck(ACheckUnCheckAll: Boolean); overload;
  var
    vItem: TPedVendaItensNF;
  end;

implementation

uses
  SysUtils, IBDatabase, uDtmAtivo, uDtmNF,
  Forms, Windows, StrUtils, uClassesNotasFiscais, Query_OOP, nf_item_class;
//  Variants,
//  config_sistema_class,
//  UClassesClientes,
//  uClassesCadastrosBasicos,
//  uClassesProdutos,
//  notafiscal_class,
//  DateUtils,
//  uClassesNotasFiscais_consts,
//  Dialogs,
//  uClasseConexao,
//gs1prefix,
//  Math,
//  uEscollhaProdutoNF,
//  Controls;
//  sped_informacao_complementar_class,
//  base_class;

{ TItemTransitoNF }

constructor TItemTransitoNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsItTrans);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  sqlTemp := dtmNF.qrItTrans.SQL.Text;
end;

function TItemTransitoNF.selecionaItem(pNumNota, pNumCaixa: integer): boolean;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    sqlTemp :=' select CHASSI_C AS CHASSIT, NUM_NOTA AS NUM_NOTAT, COD_EMPRESA, VERSAOEST AS VERSAOT, ' +
     ' ANO_FABEST AS ANO_FABT, ANO_MODEST AS ANO_MODT, COREST AS CORT, MOTOREST AS MOTORT, ' +
     ' DESCRICAO_VERSAOEST AS DESCRICAO_VERSAOT, CILINDROSEST AS CILINDROST, COMBUSTIVELEST AS COMBUSTIVELT, ' +
     ' CILINDRADAEST AS CILINDRADAT, HPEST AS HPT, LOTACAOEST AS LOTACAOT, TIPOEST AS TIPOT, RENAVAMEST AS RENAVAMT, ' +
     ' PRECO_TABEST AS PRECO_TABT, FRETE_AQUISICAOEST AS FRETE_AQUISICAOT, FRETE_VENDAEST AS FRETE_VENDAT, ' +
     ' BASE_CALC_ICM_SUBEST AS BASE_CALC_ICM_SUBT, VALOR_ICM_SUBEST AS VALOR_ICM_SUBT, OBS_ITEMEST AS OBS_ITEMT, ' +
     ' PLACAEST AS PLACAT, CERTIFICADOEST AS CERTIFICADOT, DATA_CERTIFICADOEST AS DATA_CERTIFICADOT, ' +
     ' CATEGORIAEST AS CATEGORIAT, CAIXA_N, TIPO_RES, DATA_RES, VENDEDOR_RES, TIPO_VENDA, COD_CLIENTE, STATUS_RES, ' +
     ' NOME_RES, SIT_RES, SITUACAO, ATIVO, MARCAEST AS MARCAT, N_CAIXA from est_moto where num_nota = :num_nf ' +
     ' and n_caixa = :n_caixa and cod_empresa = :cod_empresa and (trim(coalesce(posicao, '''')) = ''TRANSITO'') '
  else
    sqlTemp :=' select CHASSIT, NUM_NOTAT, COD_EMPRESA, VERSAOT, ANO_FABT, ANO_MODT, CORT, MOTORT, ' +
     ' DESCRICAO_VERSAOT, CILINDROST, COMBUSTIVELT, CILINDRADAT, HPT, LOTACAOT, TIPOT, RENAVAMT, PRECO_TABT, ' +
     ' FRETE_AQUISICAOT, FRETE_VENDAT, BASE_CALC_ICM_SUBT, VALOR_ICM_SUBT, OBS_ITEMT, PLACAT, CERTIFICADOT, ' +
     ' DATA_CERTIFICADOT, CATEGORIAT, CAIXA_N, TIPO_RES, DATA_RES, VENDEDOR_RES, TIPO_VENDA, COD_CLIENTE, STATUS_RES, ' +
     ' NOME_RES, SIT_RES, SITUACAO, ATIVO, MARCAT, N_CAIXA from transito_motos where num_notat = :num_nf ' +
     ' and n_caixa = :n_caixa and cod_empresa = :cod_empresa';

  dataSet.Close;
  dataSet.CommandText := StringReplace(sqlTemp, ':num_nf', IntToStr(pNumNota), [rfReplaceAll,
    rfIgnoreCase]);
  dataSet.CommandText := StringReplace(dataSet.CommandText, ':n_caixa', IntToStr(pNumCaixa),
    [rfReplaceAll, rfIgnoreCase]);
  dataSet.CommandText := StringReplace(dataSet.CommandText, ':cod_empresa', vDadosIni.codEmpresa,
    [rfReplaceAll, rfIgnoreCase]);
  dataSet.Open;
end;

{ TTransitoNF }

procedure TTransitoNF.AfterScrollTransitoNF(DataSet: TDataSet);
begin
  vItem.selecionaItem(DataSet.FieldByName('num_notat').AsInteger,
    DataSet.FieldByName('n_caixa').AsInteger);
end;

constructor TTransitoNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsTrans);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  vItem := TItemTransitoNF.create;
  dataSet.AfterScroll := AfterScrollTransitoNF;
end;

destructor TTransitoNF.Destroy;
begin
  vItem.Free;
  vItem := nil;
  inherited;
end;

function TTransitoNF.pesquisaTransitoNotaFiscal(pNumNfChassi, pDataIni,
  pDataFim: string): boolean;
var
  pWhere: WideString;
begin
  if (Trim(pNumNfChassi) = '') and
    (pDataIni = '  /  /    ') and (pDataFim = '  /  /    ') then
  begin
    Application.MessageBox('Nenhum tipo de filtro informado. Informe algum valor para a pesquisa das Notas em Trânsito', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (pDataIni <> '  /  /    ') and (pDataFim = '  /  /    ') or
    (pDataIni = '  /  /    ') and (pDataFim <> '  /  /    ') then
  begin
    Application.MessageBox('Informe as datas de inicio e fim', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  pWhere := ' where nt.cod_empresa = ' + vDadosIni.codEmpresa + ' and nt.ativo = 1' +
    ' and ((nt.statust = '''') or (nt.statust is null))';
  try
    StrToInt(Trim(pNumNfChassi));
    if StrToInt(Trim(pNumNfChassi)) > 0 then
      pWhere := pWhere + ' and nt.num_notat = ' + Trim(pNumNfChassi);
  except
    if Trim(pNumNfChassi) <> '' then
      pWhere := pWhere + ' and tm.chassit = ' + QuotedStr(Trim(pNumNfChassi));
  end;
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    pWhere := pWhere + ' and nt.data_emissaot >= :dataIni and nt.data_emissaot <= :dataFim';

  if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
     dataSet.CommandText := 'select' +
     ' nt.NUM_NOTAT,' +
     ' nt.COD_EMPRESA,' +
     ' nt.SERIET,' +
     ' nt.DATA_EMISSAOT,' +
     ' nt.DATA_VENCT,' +
     ' nt.VALORNOTAT,' +
     ' nt.CODFATT,' +
     ' nt.TPFATT,' +
     ' nt.FRETET,' +
     ' nt.SEGUROT,' +
     ' nt.ICMSSUBT,' +
     ' nt.STATUST,' +
     ' nt.DT_REC_NF,' +
     ' nt.N_CAIXA' +
     ' from NF_TRANSITO nt' +
     ' left join est_moto est on est.num_nota = nt.num_notat and est.n_caixa = nt.n_caixa' +
     ' and est.cod_empresa = nt.cod_empresa'
  else
   dataSet.CommandText := 'select' +
     ' nt.NUM_NOTAT,' +
     ' nt.COD_EMPRESA,' +
     ' nt.SERIET,' +
     ' nt.DATA_EMISSAOT,' +
     ' nt.DATA_VENCT,' +
     ' nt.VALORNOTAT,' +
     ' nt.CODFATT,' +
     ' nt.TPFATT,' +
     ' nt.FRETET,' +
     ' nt.SEGUROT,' +
     ' nt.ICMSSUBT,' +
     ' nt.STATUST,' +
     ' nt.DT_REC_NF,' +
     ' nt.N_CAIXA' +
     ' from NF_TRANSITO nt' +
     ' left join transito_motos tm on tm.num_notat = nt.num_notat and nt.n_caixa = tm.n_caixa' +
     ' and tm.cod_empresa = nt.cod_empresa';
   vItem.selecionaItem(0, 0);
  if Pos(':dataIni', pWhere) > 0 then
    montaSelect(dataSet.CommandText + pWhere, StrToDate(pDataIni), StrToDate(pDataFim))
  else
    montaSelect(dataSet.CommandText + pWhere);
end;

{ TItemComFatNF }

constructor TItemComFatNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsMotVen);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  sqlTemp := dtmNF.qrMotVen.SQL.Text;
end;

destructor TItemComFatNF.Destroy;
begin
  dtmNF.qrMotVen.SQL.Text := sqlTemp;
  inherited;
end;

function TItemComFatNF.selecionaItem(pComando: integer; pChassi: string; pCodigo: Integer = 0): boolean;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    sqlTemp :=' select coalesce(status_uso, ''N'') TIPO, em.tipoest, em.chassi_c, em.cod_empresa, em.num_nota NF_AQ, em.serie, ' +
      ' em.marcaest, em.versaoest, em.descricao_versaoest, em.ano_fabest, em.ano_modest, em.corest, em.cilindrosest, ' +
      ' em.combustivelest, em.cilindradaest, em.hpest, em.lotacaoest, em.renavamest, em.preco_tabest precovenda, ' +
      ' em.preco_custo_desp precocompra, em.frete_aquisicaoest, em.frete_vendaest, em.obs_itemest, em.motorest, ' +
      ' em.placaest, em.certificadoest, em.data_certificadoest, em.categoriaest, em.codigo, em.data_ch_nota, ' +
      ' em.tipo_venda, em.nserie, em.tip_pintura, em.cod_cor, em.situacao, em.base_calc_icm_subest base_calc_icm_subv, ' +
      ' em.valor_icm_subest valor_icm_subv, em.com_ent, em.red_lucro, em.cod_fornecedor, ''ESTOQUE'' tab, em.PRECO_CUSTO, ' +
      ' tm.ncmsh ' +
      ' from est_moto em' +
      ' left join tipmodelo tm on tm.codigo = em.versaoest and tm.cod_empresa = em.cod_empresa ' +
      ' where em.chassi_c = :chassi and em.codigo = :codigo and em.cod_empresa = :cod_empresa ' +
      ' order by em.codigo desc ';
  dataSet.Close;
  dataSet.CommandText := StringReplace(sqlTemp, ':chassi', QuotedStr(pChassi), [rfReplaceAll,
    rfIgnoreCase]);
  dataSet.CommandText := StringReplace(dataSet.CommandText, ':cod_empresa', vDadosIni.codEmpresa,
    [rfReplaceAll, rfIgnoreCase]);
  dataSet.CommandText := StringReplace(dataSet.CommandText, ':comando', IntToStr(pComando),
    [rfReplaceAll, rfIgnoreCase]);
  if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    dataSet.CommandText := StringReplace(dataSet.CommandText, ':codigo', IntToStr(pCodigo),
      [rfReplaceAll, rfIgnoreCase]);
  //  dataSet.Params[0].AsInteger := pComando;
  //  dataSet.Params[0].AsString := pChassi;
  //  dataSet.Params[1].AsString := vDadosIni.codEmpresa;
  //  dataSet.Params[2].AsString := pChassi;
  //  dataSet.Params[3].AsString := vDadosIni.codEmpresa;
  dataSet.Open;
end;

{ TComFatNF }

procedure TComFatNF.AfterScrollComandoNF(DataSet: TDataSet);
begin
  vItem.selecionaItem(DataSet.FieldByName('n_comando').AsInteger,
    DataSet.FieldByName('chassiv').AsString, DataSet.FieldByName('COD_ESTMOTO').AsInteger);
end;

constructor TComFatNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsComFat);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  vItem := TItemComFatNF.create;
  dataSet.AfterScroll := AfterScrollComandoNF;
end;

destructor TComFatNF.Destroy;
begin
  vItem.Free;
  vItem := nil;
  inherited;
end;

function TComFatNF.pesquisaComandoFaturamento(pCodCliente: Integer;
  pComandoChassi, pDataIni, pDataFim: string): boolean;
var
  pWhere: WideString;
begin
  if (Trim(pComandoChassi) = '') and (pCodCliente = 0) and
    (pDataIni = '  /  /    ') and (pDataFim = '  /  /    ') then
  begin
    Application.MessageBox('Nenhum tipo de filtro informado. Informe algum valor para a pesquisa dos Comandos', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (pDataIni <> '  /  /    ') and (pDataFim = '  /  /    ') or
    (pDataIni = '  /  /    ') and (pDataFim <> '  /  /    ') then
  begin
    Application.MessageBox('Informe as datas de inicio e fim', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    pWhere := ' where cf.cod_empresa = ' + vDadosIni.codEmpresa + ' and CF.ativo = 1' +
     ' and (CF.STATUS_V <> ''CANCELADO'') and (TRIM(CF.NATUREZA) = ''S'') '+
     ' and not cf.num_nota_v is null'
  else
    pWhere := ' where cf.cod_empresa = ' + vDadosIni.codEmpresa + ' and CF.ativo = 1' +
     ' and (CF.STATUS_V is null OR CF.STATUS_V <> ''CANCELADA'')' +
     ' and not cf.num_nota_v is null';
  try
    StrToInt(Trim(pComandoChassi));
    if StrToInt(Trim(pComandoChassi)) > 0 then
      pWhere := pWhere + ' and cf.n_comando = ' + Trim(pComandoChassi);
  except
    if Trim(pComandoChassi) <> '' then
      pWhere := pWhere + ' and cf.chassiv = ' + QuotedStr(Trim(pComandoChassi));
  end;
  if pCodCliente > 0 then
    pWhere := pWhere + ' and c.cod_cliente = ' + IntToStr(pCodCliente);
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    pWhere := pWhere + ' and cf.DATA_VEN >= :dataIni and CF.DATA_VEN <= :dataFim';

  dataSet.CommandText := 'select' +
    ' cf.n_comando,' +
    ' cf.sub_serie,' +
    ' cf.num_nota_v,' +
    ' cf.chassiv,' +
    ' cf.nome_receb,' +
    ' cf.tipo_venda_v,' +
    ' case when (cf.natureza = ''S'') then cf.clientes_v else cf.cod_cli_vende end clientes_v, ' +
    ' case when (cf.natureza = ''S'') then c.nome_cliente else c2.nome_cliente end nome_cliente, ' +
    ' cf.covend_v,' +
    ' cf.condpag_v,' +
    ' cf.natop_v,' +
    ' cf.codfisc_v,' +
    ' cf.prven_v,' +
    ' cf.frete_v,' +
    ' cf.seguro_v,' +
    ' cf.outdesp_v,' +
    ' cf.alicm_v,' +
    ' cf.redb_v,' +
    ' cf.desconto_v,' +
    ' cf.inscsub_v,' +
    ' cf.valtot_v,' +
    ' cf.status_v,' +
    ' cf.tipo_v,' +
    ' cf.bicmsub_v,' +
    ' cf.vlicmsub_v,' +
    ' cf.PERC_RED_V,' +
    ' cf.cst_v,' +
    ' cf.serie,' +
    ' cf.tprest,' +
    ' cf.obs_v,' +
    ' cf.dt_ent_said,' +
    ' cf.natureza,' +
    ' cf.valor_real,' +
    ' cf.valor_a_rec, ' +
    ' cf.cod_estmoto, ' +
    ' cf.tipv_veiculo, ' +
    ' cf.tipo, ' +
    ' cf.modelo,' +
    ' cf.altera_estoque_cfop ' +
    ' from com_fat cf' +
    ' left join clientes c on c.cod_cliente = cf.clientes_v and c.cod_empresa = cf.cod_empresa ' +
    ' left join clientes c2 on c2.cod_cliente = cf.cod_cli_vende and c2.cod_empresa = cf.cod_empresa ';
  vItem.selecionaItem(0, '');
  if Pos(':dataIni', pWhere) > 0 then
    montaSelect(dataSet.CommandText + pWhere, StrToDate(pDataIni), StrToDate(pDataFim))
  else
    montaSelect(dataSet.CommandText + pWhere);

  Result := True;
end;

function TComFatNF.pesquisaContratoFaturamento(pCodCliente: Integer;
  pComandoChassi, pDataIni, pDataFim: string): boolean;
var
  pWhere: WideString;
begin
  if (Trim(pComandoChassi) = '') and (pCodCliente = 0) and
    (pDataIni = '  /  /    ') and (pDataFim = '  /  /    ') then
  begin
    Application.MessageBox('Nenhum tipo de filtro informado. Informe algum valor para a pesquisa dos Comandos', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (pDataIni <> '  /  /    ') and (pDataFim = '  /  /    ') or
    (pDataIni = '  /  /    ') and (pDataFim <> '  /  /    ') then
  begin
    Application.MessageBox('Informe as datas de inicio e fim', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    pWhere := ' where cf.cod_empresa = ' + vDadosIni.codEmpresa + ' and CF.ativo = 1' +
     ' and (CF.STATUS_V <> ''CANCELADO'') '
  else
    pWhere := ' where cf.cod_empresa = ' + vDadosIni.codEmpresa + ' and CF.ativo = 1' +
      ' and (CF.STATUS_V is null OR CF.STATUS_V <> ''CANCELADA'')';
  try
    StrToInt(Trim(pComandoChassi));
    if StrToInt(Trim(pComandoChassi)) > 0 then
      pWhere := pWhere + ' and cf.n_comando = ' + Trim(pComandoChassi);
  except
    if Trim(pComandoChassi) <> '' then
      pWhere := pWhere + ' and cf.chassiv = ' + QuotedStr(Trim(pComandoChassi));
  end;
  if pCodCliente > 0 then
    pWhere := pWhere + ' and c.cod_cliente = ' + IntToStr(pCodCliente);
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    pWhere := pWhere + ' and cf.DATA_VEN >= :dataIni and CF.DATA_VEN <= :dataFim';

  dataSet.CommandText := 'select' +
    ' cf.n_comando,' +
    ' cf.sub_serie,' +
    ' cf.num_nota_v,' +
    ' cf.chassiv,' +
    ' cf.nome_receb,' +
    ' cf.tipo_venda_v,' +
    ' case when (cf.natureza = ''S'') then cf.clientes_v else cf.cod_cli_vende end clientes_v, ' +
    ' case when (cf.natureza = ''S'') then c.nome_cliente else c2.nome_cliente end nome_cliente, ' +
    ' cf.covend_v,' +
    ' cf.condpag_v,' +
    ' cf.natop_v,' +
    ' cf.codfisc_v,' +
    ' cf.prven_v,' +
    ' cf.frete_v,' +
    ' cf.seguro_v,' +
    ' cf.outdesp_v,' +
    ' cf.alicm_v,' +
    ' cf.redb_v,' +
    ' cf.desconto_v,' +
    ' cf.inscsub_v,' +
    ' cf.valtot_v,' +
    ' cf.status_v,' +
    ' cf.tipo_v,' +
    ' cf.bicmsub_v,' +
    ' cf.vlicmsub_v,' +
    ' cf.PERC_RED_V,' +
    ' cf.cst_v,' +
    ' cf.serie,' +
    ' cf.tprest,' +
    ' cf.obs_v,' +
    ' cf.dt_ent_said,' +
    ' cf.natureza,' +
    ' cf.valor_real,' +
    ' cf.valor_a_rec, ' +
    ' cf.cod_estmoto, ' +
    ' cf.tipv_veiculo, ' +
    ' cf.tipo, ' +
    ' cf.modelo,' +
    ' cf.altera_estoque_cfop ' +
    ' from com_fat cf' +
    ' left join clientes c on c.cod_cliente = cf.clientes_v and c.cod_empresa = cf.cod_empresa ' +
    ' left join clientes c2 on c2.cod_cliente = cf.cod_cli_vende and c2.cod_empresa = cf.cod_empresa ';
  vItem.selecionaItem(0, '');
  if Pos(':dataIni', pWhere) > 0 then
    montaSelect(dataSet.CommandText + pWhere, StrToDate(pDataIni), StrToDate(pDataFim))
  else
    montaSelect(dataSet.CommandText + pWhere);
end;

{ TItemPedidoNFRec }

procedure TItemPedidoNFRec.AfterScrollItens(DataSet: TDataSet);
begin
  if not DataSet.Active then
    Exit;

  Self.dataSet.Filter := ' GRUPO_PROD = ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
    ' and COD_PROD = ' + QuotedStr(Trim(dataSet.FieldByName('COD_PROD').AsString)) +
    ' and COD_NF = ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
    ' and NITEM_NF = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger);
  Self.dataSet.Filtered := True;

  if dataSet.FieldByName('tipo_item').AsString <> 'P' then
    Exit;

  try
    Self.dataSet.First;
    while not Self.dataSet.Eof do
    begin

      fItensPedidosNF.dataSet.Filter := 'GRUPO_PROD = ' + IntToStr(Self.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' and COD_PROD = ' + QuotedStr(Trim(Self.dataSet.FieldByName('COD_PROD').AsString)) +
        ' and NUM_PED = ' + IntToStr(Self.dataSet.FieldByName('NUM_PED').AsInteger) +
        ' and NITEM = ' + IntToStr(Self.dataSet.FieldByName('NITEM').AsInteger);
      fItensPedidosNF.dataSet.Filtered := True;

      Self.dataSet.Edit;
      Self.dataSet.FieldByName('qtde_nf').AsFloat := 0;

      fItensPedidosNF.dataSet.First;
      while not fItensPedidosNF.dataSet.Eof do
      begin
        Self.dataSet.FieldByName('qtde_nf').AsFloat :=
          Self.dataSet.FieldByName('qtde_nf').AsFloat +
          fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat;
        fItensPedidosNF.dataSet.Next;
      end;
      Self.dataSet.FieldByName('qtde_pendente_atual').AsFloat :=
        Self.dataSet.FieldByName('qtde_pendente').AsFloat -
        Self.dataSet.FieldByName('qtde_nf').AsFloat;
      Self.dataSet.Post;

      Self.dataSet.Next;
    end;
    Self.dataSet.First;

  finally
    fItensPedidosNF.dataSet.Filtered := False;
    fItensPedidosNF.dataSet.Filter := '';
  end;
end;

procedure TItemPedidoNFRec.clearData;
begin
  if not DataSet.Active then
    Exit;
    
  dataSet.EmptyDataSet;
  fItensPedidosNF.dataSet.EmptyDataSet;
end;

function TItemPedidoNFRec.confirmaBaixaItensPedidos(vItem: TDataSet_OOP): Boolean;
var
  vFiltro: string;
begin
  Result := True;
  try
    if vAutomatica then
    begin
      try
        vItem.dataSet.Filter := 'ALTERA_ESTOQUE_CFOP <> ''N''';
        vItem.dataSet.Filtered := True;
        montarDataSet(vItem);
        vItem.dataSet.AfterScroll := AfterScrollItens;

        vItem.dataSet.First;
        while not vItem.dataSet.Eof do
        begin
          if (vItem.dataSet.FieldByName('tipo_item').AsString = 'P') and (vItem.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
          begin
            dataSet.First;
            while not dataSet.Eof do
            begin

              marcaDesmarcaItem(vItem);

              dataSet.Next;
            end;

          end;
          vItem.dataSet.Next;
        end;
      finally
        vItem.dataSet.AfterScroll := (vItem as TNFItem).AfterItemNf;
        vItem.dataSet.Filtered := False;
        vItem.dataSet.Filter := '';
      end;
    end;

    fItensPedidosNF.dataSet.Filtered := False;
    fItensPedidosNF.dataSet.Filter := '';

    fItensPedidosNF.dataSet.First;
    while not fItensPedidosNF.dataSet.Eof do
    begin

      buscas.Close;
      buscas.SQL.Text := 'insert into ITEM_PEDIDO_NF_REC (NUM_PED, GRUPO_PROD, COD_PROD, COD_EMPRESA, NITEM, COD_NF, NITEM_NF, QTDE_RECEBIDA)' +
        ' values (:NUM_PED, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, :NITEM, :COD_NF, :NITEM_NF, :QTDE_RECEBIDA)';
      buscas.ParamByName('NUM_PED').AsInteger := fItensPedidosNF.dataSet.FieldByName('NUM_PED').AsInteger;
      buscas.ParamByName('GRUPO_PROD').AsInteger := fItensPedidosNF.dataSet.FieldByName('GRUPO_PROD').AsInteger;
      buscas.ParamByName('COD_PROD').AsString := fItensPedidosNF.dataSet.FieldByName('COD_PROD').AsString;
      buscas.ParamByName('NITEM').AsInteger := fItensPedidosNF.dataSet.FieldByName('NITEM').AsInteger;
      buscas.ParamByName('COD_NF').AsInteger := fItensPedidosNF.dataSet.FieldByName('COD_NF').AsInteger;
      buscas.ParamByName('NITEM_NF').AsInteger := fItensPedidosNF.dataSet.FieldByName('NITEM_NF').AsInteger;
      buscas.ParamByName('QTDE_RECEBIDA').AsFloat := fItensPedidosNF.dataSet.FieldByName('QTDE_BAIXA').AsFloat;
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      buscas.ExecSQL;
      fItensPedidosNF.dataSet.Next;
    end;
    clearData;

  except on E: Exception do
    begin
      Result := False;
      registraErro('function confirmaBaixaItensPedidos. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao baixar quantidade(s) recebida(s) no(s) pedido(s). Erro: ' + E.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

constructor TItemPedidoNFRec.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsItemPedBaixa);
  buscas := TIBQuery(dtmNF.qrBuscasNF);

  fItensPedidosNF := TDataSet_OOP.Create;
  fItensPedidosNF.dataSet := TClientDataSet(dtmNF.cdsItemPedBaixaNF);

  if not dataSet.Active then
    dataSet.CreateDataSet;

  if not fItensPedidosNF.dataSet.Active then
    fItensPedidosNF.dataSet.CreateDataSet;
end;

function TItemPedidoNFRec.marcaDesmarcaItem(vItem: TDataSet_OOP): Boolean;
var
  vQtdeNFItem: Extended;
begin
  if vItem.dataSet.FieldByName('tipo_item').AsString <> 'P' then
    Exit;

//  dataSet.Filter := ' GRUPO_PROD = ' + IntToStr(vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
//            ' and COD_PROD = ' + QuotedStr(Trim(vItem.dataSet.FieldByName('COD_PROD').AsString)) +
//            ' and NUM_PED = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
//            ' and NITEM = ' + IntToStr(buscas.FieldByName('NITEM').AsInteger);
//          dataSet.Filtered := True;

  try
    fItensPedidosNF.dataSet.Filter := 'NITEM_NF = ' + IntToStr(vItem.dataSet.FieldByName('nitem').AsInteger) +
      ' and GRUPO_PROD = ' + IntToStr(vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
      ' and COD_PROD = ' + QuotedStr(Trim(vItem.dataSet.FieldByName('COD_PROD').AsString));
    fItensPedidosNF.dataSet.Filtered := True;

    vQtdeNFItem := 0;

    fItensPedidosNF.dataSet.First;
    while not fItensPedidosNF.dataSet.Eof do
    begin
      vQtdeNFItem := vQtdeNFItem + fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat;
      fItensPedidosNF.dataSet.Next;
    end;
//
//    vQtdeOutrosNITEM := 0;
//    fItensPedidosNF.dataSet.First;
//    while not fItensPedidosNF.dataSet.Eof do
//    begin
//      vQtdeOutrosNITEM := vQtdeOutrosNITEM +
//        fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat;
//      fItensPedidosNF.dataSet.Next;
//    end;

    fItensPedidosNF.dataSet.Filter := 'NITEM_NF = ' + IntToStr(vItem.dataSet.FieldByName('nitem').AsInteger) +
      ' and GRUPO_PROD = ' + IntToStr(vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
      ' and COD_PROD = ' + QuotedStr(Trim(vItem.dataSet.FieldByName('COD_PROD').AsString)) +
      ' and NUM_PED = ' + IntToStr(dataSet.FieldByName('NUM_PED').AsInteger) +
      ' and NITEM = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger);
    fItensPedidosNF.dataSet.Filtered := True;

    if dataSet.FieldByName('SEL').AsString <> 'S' then
    begin
      if (fItensPedidosNF.dataSet.FieldByName('num_ped').AsInteger = 0) and
        ((dataSet.FieldByName('qtde_pendente').AsFloat - dataSet.FieldByName('qtde_nf').AsFloat) > 0) and
        (vQtdeNFItem < vItem.dataSet.FieldByName('quantidade').AsFloat) then
//         (vItem.dataSet.FieldByName('quantidade').AsFloat)) then
//        ((dataSet.FieldByName('qtde_pendente').AsFloat - vQtdeOutrosNITEM) >= (vItem.dataSet.FieldByName('quantidade').AsFloat)) then
      begin
        fItensPedidosNF.dataSet.Insert;
        fItensPedidosNF.dataSet.FieldByName('grupo_prod').AsInteger := dataSet.FieldByName('grupo_prod').AsInteger;
        fItensPedidosNF.dataSet.FieldByName('cod_prod').AsString := Trim(dataSet.FieldByName('cod_prod').AsString);
        fItensPedidosNF.dataSet.FieldByName('num_ped').AsInteger := dataSet.FieldByName('num_ped').AsInteger;
        fItensPedidosNF.dataSet.FieldByName('nitem').AsInteger := dataSet.FieldByName('nitem').AsInteger;
        fItensPedidosNF.dataSet.FieldByName('cod_nf').AsInteger := dataSet.FieldByName('cod_nf').AsInteger;
        fItensPedidosNF.dataSet.FieldByName('nitem_nf').AsInteger := dataSet.FieldByName('nitem_nf').AsInteger;
        if (vItem.dataSet.FieldByName('quantidade').AsFloat - vQtdeNFItem) > (dataSet.FieldByName('qtde_pendente').AsFloat - dataSet.FieldByName('qtde_nf').AsFloat) then
          fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat :=
            dataSet.FieldByName('qtde_pendente').AsFloat - dataSet.FieldByName('qtde_nf').AsFloat
        else
          fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat := (vItem.dataSet.FieldByName('quantidade').AsFloat - vQtdeNFItem);
        dataSet.Edit;
        dataSet.FieldByName('SEL').AsString := 'S';
        dataSet.FieldByName('qtde_nf').AsFloat := dataSet.FieldByName('qtde_nf').AsFloat + fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat;
        dataSet.FieldByName('qtde_pendente_atual').AsFloat := dataSet.FieldByName('qtde_pendente').AsFloat - dataSet.FieldByName('qtde_nf').AsFloat;
        dataSet.Post;
        fItensPedidosNF.dataSet.Post;
      end;
    end
    else if (fItensPedidosNF.dataSet.FieldByName('num_ped').AsInteger > 0) then
    begin
      dataSet.Edit;
      dataSet.FieldByName('SEL').AsString := '';
      dataSet.FieldByName('qtde_nf').AsFloat := dataSet.FieldByName('qtde_nf').AsFloat - fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat;
      dataSet.FieldByName('qtde_pendente_atual').AsFloat := dataSet.FieldByName('qtde_pendente').AsFloat - dataSet.FieldByName('qtde_nf').AsFloat;
      dataSet.Post;
      fItensPedidosNF.dataSet.Delete;
    end;

  finally
    fItensPedidosNF.dataSet.Filtered := False;
    fItensPedidosNF.dataSet.Filter := '';
  end;
end;

procedure TItemPedidoNFRec.montarDataSet(vItem: TDataSet_OOP);
begin
  if not DataSet.Active then
    Exit;

  if vItem.dataSet.IsEmpty then
  begin
    clearData;
    Exit;
  end;

  clearData;

  try

    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
      if vItem.dataSet.FieldByName('tipo_item').AsString = 'P' then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select p.num_ped, ip.nitem, ip.quant_it_prod, ip.descr_prod, coalesce(sum(ir.qtde_recebida),0) qtde_recebida,' +
          ' (coalesce(ip.quant_it_prod,0) - coalesce(sum(ir.qtde_recebida),0)) qtde_pendente' +
          ' from item_pedido ip' +
          ' inner join pedido p on p.num_ped = ip.num_ped and p.cod_empresa = ip.cod_empresa' +
          ' left join item_pedido_nf_rec ir on ir.num_ped = ip.num_ped and ir.grupo_prod = ir.grupo_prod and' +
          ' ir.cod_prod = ip.cod_prod and ir.cod_empresa = ip.cod_empresa and ir.nitem =  ip.nitem' +
          ' where ip.grupo_prod = ' + IntToStr(vItem.dataSet.FieldByName('grupo_prod').AsInteger) +
          ' and ip.cod_prod = ' + QuotedStr(Trim(vItem.dataSet.FieldByName('cod_prod').AsString)) +
          ' and ip.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and p.status_ped = ''EFETIVADO'' and p.ativo = 1 and coalesce(ip.recebido, '''') <> ''S''' +
          ' group by 1, 2, 3, 4';

//        'select p.num_ped, ip.nitem, sum(ip.quant_it_prod) quant_it_prod from item_pedido ip' +
//          ' inner join pedido p on p.num_ped = ip.num_ped and p.cod_empresa = ip.cod_empresa' +
//          ' where ip.grupo_prod = ' + IntToStr(vItem.dataSet.FieldByName('grupo_prod').AsInteger) +
//          ' and ip.cod_prod = ' + QuotedStr(Trim(vItem.dataSet.FieldByName('cod_prod').AsString)) +
//          ' and ip.cod_empresa = ' + vDadosIni.codEmpresa +
//          ' and p.status_ped = ''EFETIVADO'' and p.ativo = 1  and coalesce(ip.recebido, '''') <> ''S''' +
//          ' group by 1, 2';
        buscas.Open;

        buscas.First;
        while not buscas.Eof do
        begin

          dataSet.Filter := ' GRUPO_PROD = ' + IntToStr(vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
            ' and COD_PROD = ' + QuotedStr(Trim(vItem.dataSet.FieldByName('COD_PROD').AsString)) +
            ' and COD_NF = ' + IntToStr(vItem.dataSet.FieldByName('COD_NF').AsInteger) +
            ' and NITEM_NF = ' + IntToStr(vItem.dataSet.FieldByName('NITEM').AsInteger) +
            ' and NUM_PED = ' + IntToStr(buscas.FieldByName('NUM_PED').AsInteger) +
            ' and NITEM = ' + IntToStr(buscas.FieldByName('NITEM').AsInteger);
          dataSet.Filtered := True;

          if dataSet.IsEmpty then
          begin
            dataSet.Insert;
            dataSet.FieldByName('grupo_prod').AsInteger := vItem.dataSet.FieldByName('grupo_prod').AsInteger;
            dataSet.FieldByName('cod_prod').AsString := Trim(vItem.dataSet.FieldByName('cod_prod').AsString);
            dataSet.FieldByName('cod_nf').AsInteger := vItem.dataSet.FieldByName('cod_nf').AsInteger;
            dataSet.FieldByName('nitem_nf').AsInteger := vItem.dataSet.FieldByName('nitem').AsInteger;
            dataSet.FieldByName('descr_prod').AsString := Trim(buscas.FieldByName('descr_prod').AsString);
            dataSet.FieldByName('num_ped').AsInteger := buscas.FieldByName('num_ped').AsInteger;
            dataSet.FieldByName('nitem').AsInteger := buscas.FieldByName('nitem').AsInteger;
            dataSet.FieldByName('quant_it_prod').AsFloat := buscas.FieldByName('quant_it_prod').AsFloat;
            dataSet.FieldByName('qtde_recebida').AsFloat := buscas.FieldByName('qtde_recebida').AsFloat;
            dataSet.FieldByName('qtde_pendente').AsFloat := buscas.FieldByName('qtde_pendente').AsFloat;
            dataSet.FieldByName('qtde_nf').AsFloat := 0;
            dataSet.FieldByName('qtde_pendente_atual').AsFloat :=
              dataSet.FieldByName('qtde_pendente').AsFloat -
              dataSet.FieldByName('qtde_nf').AsFloat;
            dataSet.FieldByName('sel').AsString := '';
            dataSet.Post;
          end;
          buscas.Next;
        end;
      end;
      vItem.dataSet.Next;
    end;

  finally
    dataSet.Filter := '';
    dataSet.Filtered := False;
  end;
end;

function TItemPedidoNFRec.validaBaixaSemMarcarPedidos(vItem: TDataSet_OOP): Boolean;
var
  vQtdeItemNF, vQtdeDisponivelPedidos, vQtdeSomaNF: Extended;
  vItensSemBaixar: Boolean;
  vListaSemBaixa: TStringList;
  I: Integer;
begin
  Result := False;

  vItensSemBaixar := False;
  vListaSemBaixa := TStringList.Create;
  vListaSemBaixa.Clear;

  vItem.dataSet.First;
  while not vItem.dataSet.Eof do
  begin
    if (vItem.dataSet.FieldByName('tipo_item').AsString = 'P') and (vItem.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
    begin
      vQtdeItemNF := vItem.dataSet.FieldByName('quantidade').AsFloat;
      vQtdeDisponivelPedidos := 0;
      vQtdeSomaNF := 0;

      dataSet.First;
      while not dataSet.Eof do
      begin
        vQtdeDisponivelPedidos := vQtdeDisponivelPedidos + dataSet.FieldByName('qtde_pendente_atual').AsFloat;
        dataSet.Next;
      end;

      fItensPedidosNF.dataSet.Filter := 'NITEM_NF = ' + IntToStr(vItem.dataSet.FieldByName('nitem').AsInteger) +
        ' and GRUPO_PROD = ' + IntToStr(vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' and COD_PROD = ' + QuotedStr(Trim(vItem.dataSet.FieldByName('COD_PROD').AsString));
      fItensPedidosNF.dataSet.Filtered := True;

      fItensPedidosNF.dataSet.First;
      while not fItensPedidosNF.dataSet.Eof do
      begin
        vQtdeSomaNF := vQtdeSomaNF + fItensPedidosNF.dataSet.FieldByName('qtde_baixa').AsFloat;
        fItensPedidosNF.dataSet.Next;
      end;

      if vQtdeDisponivelPedidos > 0 then
        if vQtdeItemNF > vQtdeSomaNF then
        begin
          vListaSemBaixa.Add('N.:' + vItem.dataSet.FieldByName('NITEM').AsString + '-' +
            'PROD:' + vItem.dataSet.FieldByName('grupo_prod').AsString + '-' +
            Trim(vItem.dataSet.FieldByName('cod_prod').AsString) + //' - ' +
            //Trim(Copy(vItem.dataSet.FieldByName('descricao_item').AsString, 1, 35)) +
            '.QTDE: ' + vItem.dataSet.FieldByName('quantidade').AsString +
            '.BAIXA: ' + FloatToStr(vQtdeSomaNF) +
            '.DISP: ' + FloatToStr(vQtdeDisponivelPedidos) +
            '. ' + Trim(vItem.dataSet.FieldByName('descricao_item').AsString));
          if not vItensSemBaixar then
            vItensSemBaixar := True;
        end;

    end;
    vItem.dataSet.Next;
  end;

  try

    if vItensSemBaixar then
    begin

      if not vDadosIni.PesqPros('NF0171', 'VALIDAR', 'ITENS PEDIDO SEM BAIXA', 'NOTAFISCAL',
        vItem.dataSet.FieldByName('COD_NF').AsString, buscas, True) then
        Exit
      else if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
      for I := 0 to vListaSemBaixa.Count - 1 do
        vDadosIni.GravaAuditoria('NF0171', 'VALIDAR', vListaSemBaixa[I], 'NOTAFISCAL', vItem.dataSet.FieldByName('COD_NF').AsString, buscas);

    end;
  finally
    vListaSemBaixa.Free;
  end;

  Result := True;

end;

{ TAuxped_class }

procedure TAuxped_class.ShowLog(Alog: string);
begin
  //vDadosIni.ShowAtencao('%s - Nped %d Tipo %s Calc = %s', [Alog, Self.nped, Self.tipo, Self.nf_ac_calctrib]);
end; 

{ TAuxped_classList }

function TAuxped_classList.GetAuxPed(Anped: Integer;
  Atipo: string): TAuxped_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].nped = Anped) and
       (TriM(Self.Items[I].tipo) = Trim(Atipo)) then
      Result := Self.Items[I];
end;

function TAuxped_classList.GetItem(Index: Integer): TAuxped_class;
begin
  Result := TAuxped_class(inherited Items[Index]);
end;

function TAuxped_classList.New: TAuxped_class;
begin
  Result := TAuxped_class.Create;
  Add(Result);
end;

procedure TAuxped_classList.SetItem(Index: Integer; const Value: TAuxped_class);
begin
  Put(Index, Value);
end;

{ THw_pedvenda_ref_nf_classList }

function THw_pedvenda_ref_nf_classList.Add(Anped: Integer; Atipo: string;
  Acod_empresa, Acod_nf: Integer): Integer;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do with Self.Items[I] do
    if (nped = Anped) and (tipo = Atipo) and (cod_empresa = Acod_empresa) and (cod_nf = Acod_nf) then
    begin
      Result := I;
      Exit;
    end;

  with New do
  begin
    nped        := Anped;
    tipo        := Atipo;
    cod_empresa := Acod_empresa;
    cod_nf      := Acod_nf;
    Result      := Self.Count;
  end;
end;

{ TPedCompraItensNF }

constructor TPedCompraItensNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsIPedC);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  dataSet.CommandText := 'select' +
    '''P'' tipo_item,' +
    ' pvp.num_ped,' +
    ' p.descr_prod,' +
    ' p.num_fab_prod,' +
    ' pvp.grupo_prod,' +
    ' pvp.cod_prod,' +
    ' pvp.quant_it_prod,' +
    ' pvp.quant_pen_it,' +
    ' pvp.quant_min_it,' +
    ' pvp.val_unt_it,' +
    ' pvp.val_tot_it' +
    ' from item_pedido pvp' +
    ' inner join produtos p on p.grupo_prod = pvp.grupo_prod and p.cod_prod = pvp.cod_prod and' +
    ' p.cod_empresa = pvp.cod_empresa' +
    ' where pvp.num_ped = :nped ' +
    ' and pvp.cod_empresa = ' + vDadosIni.codEmpresa;
end;

function TPedCompraItensNF.selecionaItensPedCompraNf(pNped: integer): boolean;
begin
  dataSet.Close;
  dataSet.Params[0].AsInteger := pNped;
  dataSet.Open;
end;

{ TPedCompraNF }

function TPedCompraNF.abrePedCompra(pNped: integer): boolean;
begin
  montaSelect('select' +
    ' pv.num_ped,' +
    ' pv.tipo_ped,' +
    ' pv.val_tot_ped,' +
    ' pv.codigo_f,' +
    ' c.nome_cliente,' +
    ' pv.data_env_ped,' +
    ' pv.data_chg_ped,' +
    ' pv.cod_vendedor,' +
    ' col.nome_vendedor,' +
    ' pv.status_ped' +
    ' from pedido pv' +
    ' inner join clientes c on c.cod_cliente = pv.codigo_f and c.cod_empresa = pv.cod_empresa' +
    ' left join colaborador col on col.cod_vendedor = pv.cod_vendedor and col.cod_empresa = pv.cod_empresa' +
    ' where pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1' +
    ' and pv.num_ped = ' + IntToStr(pNped));
  vItem.selecionaItensPedCompraNf(pNped);
end;

procedure TPedCompraNF.AfterScrollPedCompraNF(DataSet: TDataSet);
begin
  vItem.selecionaItensPedCompraNf(DataSet.FieldByName('num_ped').AsInteger);
end;

constructor TPedCompraNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsPedC);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  vItem := TPedCompraItensNF.create;
  dataSet.AfterScroll := AfterScrollPedCompraNF;
  vComandTextUltimo := '';
end;

function TPedCompraNF.pesquisaPedCompra(pNped, pCodFornecedor: Integer;
  pDataIni, pDataFim: string): boolean;
var
  pWhere: WideString;
begin
  if (pNped = 0) and (pCodFornecedor = 0) and
    (pDataIni = '  /  /    ') and (pDataFim = '  /  /    ') then
  begin
    Application.MessageBox('Nenhum tipo de filtro informado. Informe algum valor para a pesquisa das Vendas', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (pDataIni <> '  /  /    ') and (pDataFim = '  /  /    ') or
    (pDataIni = '  /  /    ') and (pDataFim <> '  /  /    ') then
  begin
    Application.MessageBox('Informe as datas de inicio e fim', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  pWhere := ' where pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1' +
    ' and pv.DATA_CHG_PED is null and pv.STATUS_PED = ''EFETIVADO''';

  if pNped > 0 then
    pWhere := pWhere + ' and pv.num_ped = ' + IntToStr(pNped);
  if pCodFornecedor > 0 then
    pWhere := pWhere + ' and pv.codigo_F = ' + IntToStr(pCodFornecedor);
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    pWhere := pWhere + ' and pv.DATA_ENV_PED >= :dataIni and pv.DATA_ENV_PED <= :dataFim';

  dataSet.CommandText := 'select' +
    ' pv.num_ped,' +
    ' pv.tipo_ped,' +
    ' pv.val_tot_ped,' +
    ' pv.codigo_f,' +
    ' c.nome_cliente,' +
    ' pv.data_env_ped,' +
    ' pv.data_chg_ped,' +
    ' pv.cod_vendedor,' +
    ' col.nome_vendedor,' +
    ' pv.status_ped' +
    ' from pedido pv' +
    ' inner join clientes c on c.cod_cliente = pv.codigo_f and c.cod_empresa = pv.cod_empresa' +
    ' left join colaborador col on col.cod_vendedor = pv.cod_vendedor and col.cod_empresa = pv.cod_empresa';
  vItem.selecionaItensPedCompraNf(0);
  if Pos(':dataIni', pWhere) > 0 then
    montaSelect(dataSet.CommandText + pWhere, StrToDate(pDataIni), StrToDate(pDataFim))
  else
    montaSelect(dataSet.CommandText + pWhere);
  vComandTextUltimo := dataSet.CommandText;
end;

{ TPedVendaItensNF }

constructor TPedVendaItensNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsItPedNf);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  {
  dataSet.CommandText := 'select' +
    ' ''P'' tipo_item,' +
    ' pvp.nped,' +
    ' pvp.tipo,' +
    ' pvp.nitem,' +
    ' pvp.num_fab_prod,' +
    ' pvp.descr_prod_ped,' +
    ' pvp.quant_ped_item,' +
    ' pvp.vltot_ped_item,' +
    ' pvp.vltot_ped_nf,' +
    ' (pvp.rateio_acresc) acrescimo,' +
    ' (pvp.rateio_desc) desconto,' +
    ' pvp.codigo_nop,' +
    ' pvp.grupo_prod,' +
    ' pvp.cod_prod,' +
    ' pvp.n_nf,' +
    ' pvp.serie,' +
    ' pvp.xped_compra,' +
    ' pvp.nitemped_compra,' +
    ' pvp.pcust_mc,' +
    ' pvp.vl_desp_nf,' +
    ' pvp.acresc_item,' +
    ' pvp.nf_ac_des_emb,' +
    ' pvp.nf_dc_despnf,' +
    ' pvp.cod_grade ' +
    ' from pedvenda_prod pvp' +
    ' where pvp.nped = :nped' +
    ' and pvp.tipo = :tipo' +
    ' and pvp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ((pvp.status is null) or (pvp.status <> ''CANCELADO''))'+
    ' union ' +
    ' select' +
    ' ''S'' ,pvs.nped,' +
    ' pvs.tipo,' +
    ' pvs.nitem,' +
    ' pvs.cod_servico,' +
    ' pvs.desc_serv_ped,' +
    ' pvs.quant_serv_ped,' +
    ' pvs.valor_tot_serv,' +
    ' pvs.valor_tot_serv,' +
    '(pvs.acresc_item + pvs.rateio_acresc) acrescimo,' +
    '(pvs.desc_item + pvs.rateio_desc) desconto,' +
    ' pvs.codigo_nop,' +
    ' null,' +
    ' null,' +
    ' pvs.n_nf,' +
    ' pvs.serie,' +
    ' '''',' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0 ' +
    ' from pedvenda_serv pvs' +
    ' where pvs.nped = :nped' +
    ' and pvs.tipo = :tipo' +
    ' and pvs.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ((pvs.status is null) or (pvs.status <> ''CANCELADO''))'+
    ' union ' +
    ' select' +
    ' ''T'',pvt.nped,' +
    ' pvt.tipo,' +
    ' 0,' +
    ' 0,' +
    ' ''SERVICO DE TERCEIRO'',' +
    ' 1,' +
    ' sum(pvt.vl_servt),' +
    ' sum(pvt.vl_servt),' +
    ' sum(0) acrescimo,' +
    ' sum(0) desconto,' +
    ' e.cfop_pad_serv,' +
    ' null,' +
    ' null,' +
    ' null,' +
    ' null,' +
    ' '''',' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0,' +
    ' 0 ' +
    ' from pedvenda_serv_terc pvt' +
    ' inner join empresa e on e.cod_empresa = pvt.cod_empresa' +
    ' where pvt.nped = :nped' +
    ' and pvt.tipo = :tipo' +
    ' and pvt.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2,3,4,5,6,7,12,13,14,15,16' +
    ' order by 1,4';
    }
end;

function TPedVendaItensNF.selecionaItensPedVendaNf(pNped: integer;
  pTipo: string): boolean;
begin
  ClientOpen('select ''P'' tipo_item, pvp.nped, pvp.tipo, pvp.nitem, pvp.num_fab_prod, pvp.descr_prod_ped, pvp.quant_ped_item,' +
             ' pvp.vltot_ped_item, pvp.vltot_ped_nf, (pvp.rateio_acresc) acrescimo, (pvp.rateio_desc) desconto, pvp.codigo_nop,' +
             ' pvp.grupo_prod, pvp.cod_prod, pvp.n_nf, pvp.serie, pvp.xped_compra, pvp.nitemped_compra, pvp.pcust_mc, pvp.vl_desp_nf,' +
             ' pvp.acresc_item, pvp.nf_ac_des_emb, pvp.nf_dc_despnf, pvp.cod_grade, pf.qvnd, pf.uvnd, pf.uvnd_fator' +
             ' from pedvenda_prod_fator pf inner join pedvenda_prod pvp on (pf.nped = pvp.nped) and (pf.tipo = pvp.tipo)' +
             '   and (pf.grupo_prod = pvp.grupo_prod) and (pf.cod_prod = pvp.cod_prod) and (pf.nitem = pvp.nitem)' +
             '   and (pf.cod_empresa = pvp.cod_empresa) and (pf.cod_grade = pvp.cod_grade) and (pf.codigo_nop = pvp.codigo_nop)' +
             ' where pf.nped = %d and pf.tipo = ''%s'' and pf.cod_empresa = %d' +
             ' and ((pvp.status is null) or (pvp.status <> ''CANCELADO''))' +
             ' union' +
             ' select ''S'' ,pvs.nped, pvs.tipo, pvs.nitem, pvs.cod_servico, pvs.desc_serv_ped, pvs.quant_serv_ped, pvs.valor_tot_serv,' +
             ' pvs.valor_tot_serv,(pvs.acresc_item + pvs.rateio_acresc) acrescimo,(pvs.desc_item + pvs.rateio_desc) desconto, pvs.codigo_nop,' +
             ' null, null, pvs.n_nf, pvs.serie, '''', 0, 0, 0, 0, 0, 0, 0, pvs.quant_serv_ped qvnd, cast(''UND'' as varchar(6)) uvnd, 1.0 uvnd_fator' +
             ' from pedvenda_serv pvs' +
             ' where pvs.nped = %d and pvs.tipo = ''%s'' and pvs.cod_empresa = %d' +
             ' and ((pvs.status is null) or (pvs.status <> ''CANCELADO''))' +
             ' union' +
             ' select ''T'',pvt.nped, pvt.tipo, 0, 0, ''SERVICO DE TERCEIRO'', 1, sum(pvt.vl_servt), sum(pvt.vl_servt), sum(0) acrescimo,' +
             ' sum(0) desconto, e.cfop_pad_serv, null, null, null, null, '''', 0, 0, 0, 0, 0, 0, 0, 1 qvnd, cast(''UND'' as varchar(6)) uvnd, 1.0 uvnd_fator' +
             ' from pedvenda_serv_terc pvt inner join empresa e on e.cod_empresa = pvt.cod_empresa' +
             ' where pvt.nped = %d and pvt.tipo = ''%s'' and pvt.cod_empresa = %d' +
             ' group by 1,2,3,4,5,6,7,12,13,14,15,16 order by 1,4', [pNped, pTipo, vDadosIni.cod_empresa, pNped, pTipo, vDadosIni.cod_empresa, pNped, pTipo, vDadosIni.cod_empresa]);
end;

{ TPedVendaNF }

procedure TPedVendaNF.AfterScrollPedVendaNf(DataSet: TDataSet);
begin
  vItem.selecionaItensPedVendaNf(DataSet.FieldByName('nped').AsInteger,
    DataSet.FieldByName('tipo').AsString);
end;

procedure TPedVendaNF.check_uncheck;
begin
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := IfThen(dataSet.FieldByName('sel').AsString <> 'S', 'S');
  dataSet.Post;
end;

procedure TPedVendaNF.check_uncheck(ACheckUnCheckAll: Boolean);
var
  ARecNo: Integer;
begin
  ARecNo := dataSet.RecNo;
  try
    dataSet.AfterScroll := nil;
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if (ACheckUnCheckAll and (dataSet.FieldByName('sel').AsString <> 'S')) or
        ((not ACheckUnCheckAll) and (dataSet.FieldByName('sel').AsString = 'S')) then
        check_uncheck;
      dataSet.Next;
    end;
  finally
    dataSet.AfterScroll := AfterScrollPedVendaNf;
    dataSet.RecNo := ARecNo;
    dataSet.EnableControls;
  end;
end;

constructor TPedVendaNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsPedNf);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  vItem := TPedVendaItensNF.create;
  dataSet.AfterScroll := AfterScrollPedVendaNf;
end;

function TPedVendaNF.pesquisaPedVenda(pReq: integer; pTipo: string): boolean;
begin
  montaSelect('select' +
    ' pv.nped,' +
    ' pv.tipo,' +
    ' pv.valor_total,' +
    ' pv.cod_cliente,' +
    ' c.nome_cliente,' +
    ' pv.data_ped,' +
    ' pv.data_fech,' +
    ' pv.operador,' +
    ' pv.ncupom,' +
    ' pv.nserieecf,' +
    ' pv.data_cupom,' +
    ' pv.num_nf,' +
    ' pv.OBS_OS,' +
    ' pv.OBS_TPVENDA, ' +
    ' pv.cod_cond_pag,' +
    ' pv.cod_vendedor,' +
    ' pv.num_nfeext,' +
    ' pv.cod_carga,' +
    ' pv.cod_nfce,' +
    ' pv.dest_seqid,' +
    ' pv.tot_prod,' +
    ' pv.nf_ac_calctrib,' +
    ' pv.nf_ac_seguro,' +
    ' pv.nf_ac_outras,' +
    ' pv.nf_ac_frete,' +
    ' pv.nf_freteconta,' +
    ' pv.finalidadeid,' +
    ' pv.cod_cli_fat,' +
    ' nfce.num_nf||''-''||nfce.serie||''-''||nfce.situacao_nfce as dados_nfce ' +
    ' from pedvenda pv' +
    ' inner join clientes c on c.cod_cliente = pv.cod_cliente and c.cod_empresa = pv.cod_empresa' +
    ' left join nfce on nfce.cod_nfce = pv.cod_nfce and nfce.cod_empresa = pv.cod_empresa' +
    ' where pv.nped = ' + IntToStr(pReq) + ' and pv.tipo = ' + QuotedStr(pTipo) +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa);
  vItem.selecionaItensPedVendaNf(DataSet.FieldByName('nped').AsInteger,
    DataSet.FieldByName('tipo').AsString);
end;

function TPedVendaNF.pesquisaPedVenda(pReq, pOrdServ: boolean; pNped,
  pCodCliente: Integer; pDataIni, pDataFim: string; pApenasComCupom: Boolean; pVendasVAN: Boolean): boolean;
var
  pWhere: WideString;
begin
//  if vDadosIni.vEmp.vAbaterItens <> 'S' then
//    pVendasVAN := False;
  if (not pReq) and (not pOrdServ) then
  begin
    Application.MessageBox('Nenhum tipo de venda selecionado. Selecione Requisição ou Ordem de Serviço', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (pNped = 0) and (pCodCliente = 0) and
    (pDataIni = '  /  /    ') and (pDataFim = '  /  /    ') then
  begin
    Application.MessageBox('Nenhum tipo de filtro informado. Informe algum valor para a pesquisa das Vendas', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (pDataIni <> '  /  /    ') and (pDataFim = '  /  /    ') or
    (pDataIni = '  /  /    ') and (pDataFim <> '  /  /    ') then
  begin
    Application.MessageBox('Informe as datas de inicio e fim', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if pVendasVAN then
    pWhere := ' where pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1 and coalesce(pv.status_ped, '' '') <> ''CANCELADO'' '
  else
  pWhere := ' where pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1' +
    ' and not pv.data_fech is null and pv.status_ped = ''FECHADA'' ';

  if pReq and pOrdServ then
    pWhere := pWhere + ' and pv.tipo <> ' + QuotedStr('ORC')
  else if pReq then
    pWhere := pWhere + ' and pv.tipo = ' + QuotedStr('REQ')
  else if pOrdServ then
    pWhere := pWhere + ' and pv.tipo = ' + QuotedStr('OS');
  if pNped > 0 then
    pWhere := pWhere + ' and pv.nped = ' + IntToStr(pNped);
  if pCodCliente > 0 then
    pWhere := pWhere + ' and pv.cod_cliente = ' + IntToStr(pCodCliente);
  if pVendasVAN then
  begin
    if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
      pWhere := pWhere + ' and pv.data_ped >= :dataIni and pv.data_ped <= :dataFim';
  end
  else
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    pWhere := pWhere + ' and pv.data_fech >= :dataIni and pv.data_fech <= :dataFim';
  if pApenasComCupom then
    pWhere := pWhere + ' and ((pv.ncupom > 0) or (pv.cod_nfce > 0))';

  dataSet.CommandText := 'select' +
    ' pv.nped,' +
    ' pv.tipo,' +
    ' pv.valor_total,' +
    ' pv.cod_cliente,' +
    ' c.nome_cliente,' +
    ' pv.data_ped,' +
    ' pv.data_fech,' +
    ' pv.operador,' +
    ' pv.ncupom,' +
    ' pv.nserieecf,' +
    ' pv.data_cupom,' +
    ' pv.num_nf,' +
    ' pv.OBS_OS,' +
    ' pv.OBS_TPVENDA, ' +
    ' pv.cod_cond_pag,' +
    ' pv.cod_vendedor,' +
    ' pv.num_nfeext,' +
    ' pv.cod_carga,' +
    ' pv.cod_nfce,' +
    ' pv.dest_seqid,' +
    ' pv.tot_prod,' +
    ' pv.nf_ac_calctrib,' +
    ' pv.nf_ac_seguro,' +
    ' pv.nf_ac_outras,' +
    ' pv.nf_ac_frete,' +
    ' pv.nf_freteconta,' +
    ' pv.finalidadeid,' +
    ' pv.cod_cli_fat,' +
    ' nfce.num_nf||''-''||nfce.serie||''-''||nfce.situacao_nfce as dados_nfce ' +
    ' from pedvenda pv' +
    ' inner join clientes c on c.cod_cliente = pv.cod_cliente and c.cod_empresa = pv.cod_empresa' +
    IfThen(pVendasVAN,
    ' inner join tipo_vendas tv on pv.tipo = tv.tipo and tv.configfechvnd = ''F'' and' +
    '   case when pv.tipo = ''OS'' then tv.tipo_os else tv.sigla end = case when pv.tipo = ''OS'' then pv.tipo_os else pv.tipv end') +
    ' left join nfce on nfce.cod_nfce = pv.cod_nfce and nfce.cod_empresa = pv.cod_empresa';
  {
  if pVendasVAN then
    dataSet.CommandText := dataSet.CommandText +
      ' inner join tipo_vendas tv on tv.sigla = pv.tipv and tv.tipo = pv.tipo and tv.usar_conferencia_produto = ''S''';
  }
  vItem.selecionaItensPedVendaNf(0, '.');
  if Pos(':dataIni', pWhere) > 0 then
    result := montaSelect(dataSet.CommandText + pWhere, StrToDate(pDataIni), StrToDate(pDataFim))
  else
    result := montaSelect(dataSet.CommandText + pWhere);
end;

end.
