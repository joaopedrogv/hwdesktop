unit uClassesCalculoComissao;

interface

uses
  uDataSet_OOP, DB;

const
  strProd       = 'Produto';
  strServ       = 'Servico';
  strProdServ   = 'Ambos';
  //srtVendaGeral = 'Venda Geral';
  //strLucroBruto = 'Lucro Bruto';
  //strPESO       = 'PESO';
  //strINDIVIDUAL = 'INDIVIDUAL';

  strVendaGeral        = 'Venda Geral';
  strProduto           = 'Produto';
  strPrestacaoRecebida = 'Prestação Recebida';
  strModRecebimento    = 'Mod.Recebimento';

type

  TCalculoComissao = class;
  TColaboradorCom = class;
  TPerfilCom = class;
  TMetaPerfilCom = class;

  RCalculoComissao = record
    fTipoREQ, fTipoOS: string; // Tipos de venda, campos TIPV e TIPO_OS
    fControlesCaixa: string; // Codigos de controle do caixa - "Controle Caixa"
    fCodigosServico: string; // Codigos dos tipos de serviço - "Tipo Serviço"
    fCodigosSegmentacao: string; // Codigos de segmentação       - "Tipo de Segmentação"
    fCodigosGrupo: string; // Codigos dos grupos           - "Grupo Produto"

    //

    ValorLiquidoMaoDeObra: Currency; // Valor total liquido da mao de obra das O.S.
    ValorLiquidoProdutos: Currency; // Valor total liquido da venda de produtos
    ValorLucroMaoDeObra: Currency; // Valor do lucro da mao de obra das O.S.
    ValorLucroProdutos: Currency; // Valor do lucro da venda de produtos
    ValorRecebDinheiro: Currency; // Valor dos recebimentos em dinheiro
    //ValorRecebPrazo: Currency; // Valor dos recebimentos a prazo Creditos/Cheques
    ValorRecebCheque: Currency; // Valor dos recebimentos a prazo Cheques
    ValorRecebCredito: Currency; // Valor dos recebimentos a prazo Creditos
    ValorDevolvCheque: Currency; // Valor das devolucoes a prazo Cheques
    ValorDevolvCredito: Currency; // Valor das devolucoes a prazo Creditos
    ValorComissaoProduto: Currency; // Valor das comissões por produto

    fPercentualMeta: Double; // Percentual da meta atingida
    fQuantidadeOSAbertas: Integer; // Quantidade de OS abertas
    fValorComissao: Currency; // Valor da comissão a pagar
    // Todas as despesas a Pagar cujo o tipo_ctp no plano de contas = 'I'

    {
    fValorBrutoDevolvidoComVenda: Currency; // Valor total da devolucao com vendas informadas
    fValorLiquidoDevolvidoComVenda: Currency; // Valor total da devolucao subtraindo o custo da mercadoria com vendas informadas
    fValorBrutoDevolvidoSemVenda: Currency; // Valor total da devolucao sem vendas informadas
    fValorLiquidoDevolvidoSemVenda: Currency; // Valor total da devolucao subtraindo o custo da mercadoria sem vendas informadas
    fValorDevolvidoComissaoProduto: Currency; // Valor das devolucoes de comissões por produto    
    }

  // Talvez estes atributos não serao usados
  // Campos da tabela de Perfil
    fCODIGO_PERFIL: string;
    fNOME_PERFIL: string;
    fABRANG_PERFIL: string; // Tipo de Comissão
    fTIPO_SERV_PROD: string; // Produto ou Serviço
    fEM_CIMA_PERFIL: string; // Se usa lucro bruto ou valor de venda geral
    fTIPO_PERFIL: string;
    strInfo: string; //Informações de como foi calculada a comissão

    fEntrega: Boolean;

  end;

  TCalculoComissao = class(TDataSet_OOP)
  private
    fDataInicial, fDataFinal: string;
    fCodigoColaborador: string;  // Codigo do colaborador ou codigo dos colaboradores do gerente
    fGerente: Boolean;
    SomaVendaDevolucaoComVenda: Currency;
    SomaLucroDevolucaoComVenda: Currency;
    SomaVendaDevolucaoSemVenda: Currency;
    SomaLucroDevolucaoSemVenda: Currency;
    fSomaDevolucaoPrazo: Currency;
    SomaComissaoProdutoDevolucao: Currency;
    detalhes: TDataSet_OOP;

    lCont, lQtde: Integer;

    excel, calc, sheet: variant;
    vLinhaExcel: integer;

    //fCalculo: array of RCalculoComissao;

    procedure _iniciarVariaveis;
    procedure _iniciarVariaveisCalculo;

    procedure _somaVendasProdutosReq;
    procedure _somaVendasProdutosOS;
    procedure _somaVendasProdutosOsEntrega;
    procedure _subtrairDevolucoesDeVendas;
    procedure _subtrairDevolucoesSemVendas;
    procedure _somaVendasServicos;
    procedure _somaVendasServicosOsEntrega;
    procedure _contarOsAbertas;
    procedure _somaRecebimentos;
    procedure _somaRecebimentosEmDinheiro;
    procedure _somaRecebimentosCheque;
    procedure _somaRecebimentosCreditos;
    procedure _somaRecebimentosChequeDevolucao;
    procedure _somaRecebimentosCreditosDevolucao;

    procedure _calularComissao;
    procedure _salvaComissao;
    function _criarExcel: boolean;
    function _criarCalc: boolean;
  public
    lCalculo: array of RCalculoComissao;

    procedure abreCalculoComissao;

    function _obterComissaoColaborador: boolean;
    function _montarExcel: boolean;
    function _montarCalc: boolean;
    function ObterDetalhes(campo: string; var strInfo: string): TDataSet_OOP;

    constructor create;
    destructor Destroy; override;

    property dataInicial: string read fDataInicial write fDataInicial;
    property dataFinal: string read fDataFinal write fDataFinal;  
  var
    vColab: TColaboradorCom;
  end;

  TColaboradorCom = class(TDataSet_OOP)
  private
    procedure AfterScrollPerfilCom(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create;

    procedure _abreColaboradores;
  var
    vPerfil: TPerfilCom;
  end;

  TPerfilCom = class(TDataSet_OOP)
  private
    procedure AfterScrollMetasCom(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create;
    function _selecionaPerfilComissao(pCodigoColaborador: integer): Boolean;
    procedure conteudoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure tabelasGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  var
    vMetas: TMetaPerfilCom;
  end;

  TMetaPerfilCom = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaMetas(pCodigoPerfil: integer): Boolean;
  end;

var
  calcComiss: TCalculoComissao;

implementation

uses
  Forms, uDtmCalculoComissao, DBClient, IBQuery, IBDatabase, SysUtils,
  uDtmAtivo, Classes, uDadosIni, uCalculoComissao, ComObj, DateUtils,
  StrUtils, hw_utils, Windows, Variants;

{ TCalculoComissao }

procedure TCalculoComissao.abreCalculoComissao;
begin

  if dtmCalculoComissao = nil then
    dtmCalculoComissao := TdtmCalculoComissao.Create(dtmCalculoComissao);

  if not vDadosIni.PesqPros('COMISS001', 'ABRIR', '', 'NAOTEM', '', dtmCalculoComissao.qrBuscas, True) then
    Exit;

  if frmCalculoComissao = nil then
  	Application.CreateForm(TfrmCalculoComissao, frmCalculoComissao);
  frmCalculoComissao.Show;

end;

constructor TCalculoComissao.create;
begin

  if dtmCalculoComissao = nil then
    dtmCalculoComissao := TdtmCalculoComissao.Create(dtmCalculoComissao);

  dataSet := TClientDataSet(dtmCalculoComissao.cdsCalcComissao);
  buscas := TIBQuery(dtmCalculoComissao.qrBuscas);
  transacao := TIBTransaction(dtmCalculoComissao.transacao);

  try
    dataSet.CreateDataSet;
  except
  end;

  dataSet.EmptyDataSet;

  dataSet.IndexFieldNames := 'CODIGO_PERFIL';

  vColab := TColaboradorCom.create;
end;

destructor TCalculoComissao.Destroy;
begin
  vColab.Free;
  vColab := nil;

  dataSet.EmptyDataSet;

  if Assigned(detalhes) then
    FreeAndNil(detalhes);

  inherited;
end;  

function TCalculoComissao.ObterDetalhes(campo: string;
  var strInfo: string): TDataSet_OOP;
const
  camposPVP: array[1..4] of string = ('VALORLIQPC', 'VALORLUCROPC', 'VALORCOMISSPROD', '');
  camposPVS: array[1..4] of string = ('VALORLIQMO', 'VALORLUCROMO', '', '');
  camposREC: array[1..2] of string = ('VALORRECDIN', 'VALORRECPRAZO');
var
  calc: RCalculoComissao;
  sql, sqlPeso, sqlTipoVenda: string;
  sqlColab, sqlGrupos, sqlSegmento, sqlServicos, sqlControles: string;
  fieldColab: string;
  partTipv, partTipo_os: string;
  I: Integer;
begin
  if not Assigned(detalhes) then
    detalhes := TDataSet_OOP.Create(buscas.Database);

  Result := detalhes;

  lCont := dataSet.RecNo - 1;

  if (lCont < Low(lCalculo)) or (lCont > High(lCalculo)) then
    Exit;

  calc := lCalculo[lCont];

  sqlPeso      := IfThen(calc.fABRANG_PERFIL = 'PESO', ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
                                                       ' inner join depto dt on dt.cod_depto = fu.cod_depto');
  sqlGrupos    := IfThen(calc.fCodigosGrupo <> '', ' and pp.grupo_prod in ' + calc.fCodigosGrupo);
  sqlSegmento  := IfThen(calc.fCodigosSegmentacao <> '', ' and pp.cod_seg_serv in ' + calc.fCodigosSegmentacao);
  sqlServicos  := IfThen(calc.fCodigosServico <> '', ' and ps.cod_servico in ' + calc.fCodigosServico);
  sqlControles := IfThen(calc.fControlesCaixa <> '', Format(' and %s in %s', [IfThen(calc.fTIPO_PERFIL = 'Mod.Recebimento', 'tb.cod_controle', 'tb.codigo_ctrl'), calc.fControlesCaixa]));
  fieldColab   := IfThen(calc.fTIPO_SERV_PROD = 'Servico', 'col_cod_vendedor', 'cod_vendedor');

  if MatchText(campo, camposPVP) then
    partTipv    := IfThen(calc.fTipoREQ <> '', Format('((pv.tipo = ''REQ'') and (pv.tipv in %s))', [calc.fTipoREQ]));

  if MatchText(campo, camposPVP) or MatchText(campo, camposPVS) then
    partTipo_os := IfThen(calc.fTipoOS  <> '', Format('((pv.tipo = ''OS'') and (pv.tipo_os in %s))', [calc.fTipoOS]));

  if MatchText(campo, camposPVP) then
    sqlTipoVenda := ' and pv.tipo in (''OS'', ''REQ'')'
  else if MatchText(campo, camposPVS) then
    sqlTipoVenda := ' and pv.tipo in (''OS'')';

  if (partTipv <> '') and (partTipo_os <> '') then
    sqlTipoVenda := sqlTipoVenda + Format(' and (%s or %s)', [partTipv, partTipo_os])
  else if (partTipv <> '') then
    sqlTipoVenda := sqlTipoVenda + Format(' and %s ', [partTipv])
  else if (partTipo_os <> '') then
    sqlTipoVenda := sqlTipoVenda + Format(' and %s ', [partTipo_os]);

  if MatchText(campo, camposPVP) or MatchText(campo, camposPVS) then
    if calc.fABRANG_PERFIL = 'PESO' then
      sqlColab := ' and dt.cod_depto = ' + IntToStr(vColab.fint('cod_depto'))
    else if lCalculo[lCont].fTIPO_PERFIL = 'Produto' then
      sqlColab := ' and col.cod_vendedor in ' + fCodigoColaborador
    else
      sqlColab := ' and col.cod_vendedor = ' + vColab.fstr('cod_vendedor');

  strInfo := PadR('Origem de dados', 19) + ': ';
  if MatchText(calc.fTIPO_PERFIL, ['Venda Geral', 'Produto']) and  MatchText(campo, camposPVP) then
  begin
    strInfo := strInfo + 'Produtos de REQ, OS e Devolução' + sLineBreak;
    sql := Format('select pv.tipo, pv.data_fech data, pv.nped Numero, pp.nitem,' +
                  ' pp.num_fab_prod codigo, pp.descr_prod_ped descricao, pp.quant_ped_item quantidade,' +
                  ' coalesce(pp.vltot_ped_item, 0) + coalesce(pp.rateio_acresc, 0) - coalesce(pp.rateio_desc, 0) -' +
                  ' iif(pv.nf_ac_calctrib in (''S'', ''N''), coalesce(pp.rateio_acresc, 0) - coalesce(pp.acresc_item, 0), 0) valor_liquido,' +
                  ' pp.quant_ped_item * coalesce(pp.pcust_mc, 0) custo,' +
                  ' iif(pv.nf_ac_calctrib in (''S'', ''N''), coalesce(pp.rateio_acresc, 0) - coalesce(pp.acresc_item, 0), 0) Despesas_NF,' +
                  ' coalesce(pp.comiss_prod, 0) Comissao_produto,' +
                  ' coalesce(pp.comiss_prod_ger, 0) comissao_prod_gerente,' +
                  ' col.nome_vendedor, 0 ordem ' +
                  ' from pedvenda pv' +
                  ' inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empresa = pv.cod_empresa' +
                  '   and coalesce(pp.status, '''') <> ''CANCELADO''' +
                  ' inner join colaborador col on col.cod_vendedor = iif(pv.tipo = ''REQ'', pp.cod_vendedor, pp.%s)' +
                  '   and col.cod_empresa = pv.cod_empresa' +
                  ' %s' + // slq peso departamento
                  ' where pv.data_fech >= %s and pv.data_fech <= %s and pv.cod_empresa = %d and pv.ativo = 1' +
                  ' and pv.status_ped = ''FECHADA''' +
                  ' %s' + // tipo ped e tipo venda
                  ' %s' + // colaborador ou depargamento
                  ' %s' + // grupos
                  ' %s' , // segmentacao
                  [fieldColab, sqlPeso, date_fb(fDataInicial), date_fb(fDataFinal), vDadosIni.cod_empresa, sqlTipoVenda,
                   sqlColab, sqlGrupos, sqlSegmento]) +
           ' union '+
           Format('select ''Dev Venda'' tipo, dv.data, dv.sequencia Numero, dv.seqid nitem,' +
                  ' dv.num_fab_prod codigo, dv.descricao, dv.quant quantidade,' +
                  ' 0 - (dv.quant * dv.valor) valor_liquido,' +
                  ' 0 - (coalesce(dv.quant, 0) * coalesce(dv.pcust_mc, 0)) custo,' +
                  ' 0 Despesas_NF,' +
                  ' 0 - (coalesce(pp.comiss_prod, 0) / pp.quant_ped_item * dv.quant) Comissao_produto,' +
                  ' 0 - (coalesce(pp.comiss_prod_ger, 0) / pp.quant_ped_item * dv.quant) comissao_prod_gerente,' +
                  ' col.nome_vendedor, 0 ordem ' +
                  ' from devolucao dv' +
                  ' inner join pedvenda pv on pv.nped = dv.cod_venda and pv.tipo = dv.tipo_venda and pv.cod_empresa = dv.cod_empresa' +
                  '   and pv.status_ped = ''FECHADA''' +
                  ' inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empresa = pv.cod_empresa' +
                  '   and pp.grupo_prod = dv.grupo_prod and pp.cod_prod = dv.cod_prod and pp.cod_vendedor = dv.cod_vendedor' +
                  '   and pp.cod_grade = dv.cod_grade' +
                  ' inner join colaborador col on col.cod_vendedor = dv.cod_vendedor and col.cod_empresa = dv.cod_empresa' +
                  ' %s' + // slq peso departamento
                  ' where dv.data >= %s and dv.data <= %s and dv.cod_empresa = %d and dv.ativo = 1' +
                  ' %s' + // tipo ped e tipo venda
                  ' %s' + // colaborador ou depargamento
                  ' %s' + // grupos
                  ' %s' , // segmentacao,
                  [sqlPeso, date_fb(fDataInicial), date_fb(fDataFinal), vDadosIni.cod_empresa, sqlTipoVenda,
                   sqlColab, ReplaceText(sqlGrupos, 'pp.', 'dv.'), sqlSegmento]) +
           ' union '+
           Format('select ''Dev Avulsa'' tipo, dv.data, dv.sequencia Numero, dv.seqid nitem,' +
                  ' dv.num_fab_prod codigo, dv.descricao, dv.quant quantidade,' +
                  ' 0 - (dv.quant * dv.valor) valor_liquido,' +
                  ' 0 - (coalesce(dv.quant, 0) * coalesce(dv.pcust_mc, 0)) custo,' +  
                  ' 0 Despesas_NF,' +
                  ' 0 - (dv.quant * dv.valor * pr.comissao_prod / 100) Comissao_produto,' +
                  ' 0 - (dv.quant * dv.valor * pr.comissao_prod_ger / 100) comissao_prod_gerente,' +
                  ' col.nome_vendedor, 0 ordem' +
                  ' from devolucao dv' +
                  ' inner join produtos pr on pr.grupo_prod = dv.grupo_prod and pr.cod_prod = dv.cod_prod and pr.cod_empresa = dv.cod_empresa' +
                  ' inner join colaborador col on col.cod_vendedor = dv.cod_vendedor and col.cod_empresa = dv.cod_empresa' +
                  ' %s' + // slq peso departamento
                  ' where dv.data >= %s and dv.data <= %s and dv.cod_empresa = %d and dv.ativo = 1 and coalesce(dv.cod_venda, 0) = 0' +
                  ' %s' + // colaborador ou depargamento
                  ' %s' + // grupos
                  ' order by 2, 1, 3, 4',
                  [sqlPeso, date_fb(fDataInicial), date_fb(fDataFinal), vDadosIni.cod_empresa,
                   sqlColab, ReplaceText(sqlGrupos, 'pp.', 'dv.')]);

    if (lCalculo[lCont].fTIPO_PERFIL = 'Produto') and (fGerente) then
      strInfo := strInfo + 'Gerente dos colaboradores: ' + fCodigoColaborador + strInfo;
  end
  else if MatchText(calc.fTIPO_PERFIL, ['Venda Geral']) and MatchText(campo, camposPVS) then
  begin
    strInfo := strInfo + 'Serviços em OS' + sLineBreak;
    sql := Format('select ''Servico'' Tipo, pv.data_fech Data, pv.nped Numero, ps.nitem,' +
                  ' ps.cod_servico codigo, ps.desc_serv_ped descricao, ps.quant_serv_ped quantidade,' +
                  ' (ps.valor_tot_serv + coalesce(ps.rateio_acresc,0) - coalesce(ps.rateio_desc, 0) ) valorvendaliquida,' +
                  ' col.nome_vendedor as colaborador, 0 ordem' +
                  ' from pedvenda pv' +
                  ' inner join pedvenda_serv ps on ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa' +
                  ' and coalesce(ps.status,'''') <> ''CANCELADO''' +
                  ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
                  ' %s' + // slq peso departamento
                  ' where pv.data_fech >= %s and pv.data_fech <= %s and pv.cod_empresa = %d and pv.ativo = 1 and pv.tipo = ''OS'' ' +
                  ' and pv.status_ped = ''FECHADA''' +
                  ' %s' + // tipo os
                  ' %s' + // colaborador ou departamento
                  ' %s' + // servicos
                  ' order by 2, 1, 3, 4',
                  [sqlPeso, date_fb(fDataInicial), date_fb(fDataFinal), vDadosIni.cod_empresa, sqlTipoVenda,
                   sqlColab, sqlServicos]);
  end
  else if MatchText(campo, camposREC) and (calc.fTIPO_PERFIL = 'Mod.Recebimento') then
  begin
    strInfo := strInfo + 'Formas de pgto de Vendas' + sLineBreak;
    sql := Format('select 1 ordem, ctr.nome_ctrl Controle,' +
                  ' fp.data_mov Data, fp.tpdocs Tipo_Doc, fp.nrequisicao Numero,' +
                  ' fp.ndoc Num_Doc,' +
                  ' fp.valordoc Valor' +
                  ' from formpagamento fp' +
                  ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle' +
                  '   and ctr.codigo_emp = fp.cod_empresa' +
                  ' where fp.data_mov >= %s and fp.data_mov <= %s' +
                  ' and fp.operador = %d and fp.cod_empresa = %d and fp.ativo = 1' +
                  ' and fp.tpdocs not in (''LCS'', ''PRE'') ' +
                  ' and coalesce(fp.rec_tipvend, '''') <> ''REC''' +
                  ' %s' + // sql controles
                  ' order by fp.data_mov, fp.seqform',
                  [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
                   vDadosIni.cod_empresa, ReplaceText(sqlControles, 'tb.', 'fp.')]);
  end
  else if MatchText(campo, camposREC) and (calc.fTIPO_PERFIL = 'Prestação Recebida') then
  begin            
    strInfo := strInfo + 'Recebimentos Financeiros' + sLineBreak;

                  // Soma os recebimentos em dinheiro
    sql := Format('select 1 ordem, ''Caixa'' tipo, ctr.nome_ctrl Controle,' +
                  ' fp.data_mov Data, fp.tpdocs Tipo_Doc, fp.nrequisicao Numero,' +
                  ' fp.ndoc Num_Doc,' +
                  ' fp.valordoc Valor,' +
                  ' fp.cliente' +
                  ' from formpagamento fp' +
                  ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle' +
                  '   and ctr.codigo_emp = fp.cod_empresa' +
                  ' where fp.data_mov >= %s and fp.data_mov <= %s and fp.tipdoc =''N'' ' +
                  ' and fp.operador = %d and fp.cod_empresa = %d and fp.ativo = 1' +
                  ' and fp.tpdocs not in (''LCS'', ''PRE'') ' +
                  ' and coalesce(fp.rec_tipvend, '''') <> ''REC''' +
                  ' %s', // sql controles
                  [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
                   vDadosIni.cod_empresa, ReplaceText(sqlControles, 'tb.codigo_ctrl', 'fp.cod_controle')]) +
           ' union ' + // Soma os recebimentos no financeiro em cheque
           Format('select 2 ordem, ''Cheque'' tipo, ctr.nome_ctrl Controle,' +
                  ' ch.dt_baixa_comissao Data, ch.tp_doc_v Tipo_doc, ch.n_doc_v Numero,' +
                  ' ch.n_ch num_doc,' +
                  ' ch.vl_baixa_comissao Valor,' +
                  ' ch.nome_ch Cliente' +
                  ' from controle_cheque ch' +
                  ' inner join controles ctr on ctr.codigo_ctrl = ch.codigo_ctrl' +
                  '   and ctr.codigo_emp = ch.codigo_emp' +
                  ' where ch.dt_baixa_comissao >= %s and ch.dt_baixa_comissao <= %s' +
                  ' and ch.codigo_vend = %d and (ch.tip_baixa = '''' or ch.tip_baixa is null)' +
                  ' and ch.codigo_emp = %d' +
                  ' and ch.tp_doc_v in (''REQ'', ''OS'', ''MOT'')' +
                  ' %s', // sql controles
                  [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
                   vDadosIni.cod_empresa, ReplaceText(sqlControles, 'tb.codigo_ctrl', 'ch.codigo_ctrl')]) +
           ' union ' + // Soma as devolucoes de cheques
           Format('select 3 ordem, ''Cheque Devolvido'' tipo, ctr.nome_ctrl Controle,' +
                  ' ch.dt_baixa_comissao Data, ch.tp_doc_v Tipo_doc, ch.n_doc_v Numero,' +
                  ' ch.n_ch num_doc,' +
                  ' ch.vl_baixa_comissao Valor,' +
                  ' ch.nome_ch Cliente' +
                  ' from controle_cheque ch' +
                  ' inner join controles ctr on ctr.codigo_ctrl = ch.codigo_ctrl' +
                  '   and ctr.codigo_emp = ch.codigo_emp' +
                  ' where ch.dt_baixa_comissao >= %s and ch.dt_baixa_comissao <= %s' +
                  ' and ch.codigo_vend = %d and ch.tip_baixa = ''D''' +
                  ' and ch.codigo_emp = %d' +
                  ' and ch.tp_doc_v in (''REQ'', ''OS'', ''MOT'')' +
                  ' %s', // sql controles
                  [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
                   vDadosIni.cod_empresa, ReplaceText(sqlControles, 'tb.codigo_ctrl', 'ch.codigo_ctrl')]) +
           ' union ' + // Soma os recebimentos no Financeiro em Creditos
           Format('select 4 ordem, ''Creditos'' tipo, ctr.nome_ctrl Controle,' +
                  ' bx.dt_baixa_comissao Data, bx.tp_doc_v Tipo_doc, bx.n_doc_v Numero,' +
                  ' bx.n_doc_c num_doc,' +
                  ' bx.vl_baixa_comissao Valor,' +
                  ' bx.nome_c Cliente' +
                  ' from BAIXA_CREDITOS bx' +
                  ' inner join controles ctr on ctr.codigo_ctrl = bx.codigo_ctrl' +
                  '   and ctr.codigo_emp = bx.codigo_emp' +
                  ' where bx.dt_baixa_comissao >= %s and bx.dt_baixa_comissao <= %s' +
                  ' and bx.codigo_vend = %d and (bx.tip_baixa = '''' or bx.tip_baixa is null)' +
                  ' and bx.codigo_emp = %d' +
                  ' and bx.tp_doc_v in (''REQ'', ''OS'', ''MOT'')' +
                  ' %s', // sql controles
                  [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
                   vDadosIni.cod_empresa, ReplaceText(sqlControles, 'tb.codigo_ctrl', 'bx.codigo_ctrl')]) +
           ' union ' + // Soma as devolucoes em Creditos
           Format('select 5 ordem, ''Credito Devolvido'' tipo, ctr.nome_ctrl Controle,' +
                  ' bx.dt_baixa_comissao Data, bx.tp_doc_v Tipo_doc, bx.n_doc_v Numero,' +
                  ' bx.n_doc_c num_doc,' +
                  ' bx.vl_baixa_comissao Valor,' +
                  ' bx.nome_c Cliente' +
                  ' from BAIXA_CREDITOS bx' +
                  ' inner join controles ctr on ctr.codigo_ctrl = bx.codigo_ctrl' +
                  '   and ctr.codigo_emp = bx.codigo_emp' +
                  ' where bx.dt_baixa_comissao >= %s and bx.dt_baixa_comissao <= %s' +
                  ' and bx.codigo_vend = %d and bx.tip_baixa = ''D''' +
                  ' and bx.codigo_emp = %d' +
                  ' and bx.tp_doc_v in (''REQ'', ''OS'', ''MOT'')' +
                  ' %s' + // sql controles
                  ' order by 1, 4, 5, 6',
                  [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
                   vDadosIni.cod_empresa, ReplaceText(sqlControles, 'tb.codigo_ctrl', 'bx.codigo_ctrl')]);
  end
  else if campo = 'VALORCOMISSAO' then
  begin
    strInfo := 'Cálculo de Comissão';

    strInfo := strInfo + sLineBreak + sLineBreak + calc.strInfo;

    Exit;
  end
  else
  begin
    detalhes.Close;
    
    strInfo := 'Sem dados para apresentar';

    strInfo := strInfo + sLineBreak + sLineBreak + calc.strInfo;

    Exit;
  end;

  strInfo := strInfo + sLineBreak + sLineBreak + 'Cálculo de Comissão';

  strInfo := strInfo + sLineBreak + sLineBreak + calc.strInfo;

  detalhes.ClientOpen(sql);

  for I := 0 to detalhes.dataSet.Fields.Count - 1 do with detalhes.dataSet do
    if Fields[I] is TFloatField then
      TFloatField(Fields[I]).DisplayFormat := '#,##0.00';// + IfThen(Fields[I].FieldName = 'QUANTIDADE', '0');

  detalhes.dataSet.FieldByName('ordem').Visible := False;

end;

procedure TCalculoComissao._calularComissao;
var
  vPercentualPesoTemp, vSomaMontanteGeral: Double;
  strInfo, strMeta: string;
begin
  //Efetua o calculo da comissão para o perfil corrente
  strInfo := '';

  vSomaMontanteGeral := 0;
  if Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Venda Geral' then
  begin

    if UpperCase(Trim(lCalculo[lCont].fTIPO_SERV_PROD)) = UpperCase('Servico') then
    begin
      if Trim(lCalculo[lCont].fEM_CIMA_PERFIL) = 'Valor Geral' then
      begin
        vSomaMontanteGeral := lCalculo[lCont].ValorLiquidoMaoDeObra;
        strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Valor liquido M.O"'
      end
      else
      begin
        vSomaMontanteGeral := lCalculo[lCont].ValorLucroMaoDeObra;
        strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Lucro M.O" (Valor liquido - Custo")';
      end;
    end
    else
    begin
      if Trim(lCalculo[lCont].fEM_CIMA_PERFIL) = 'Valor Geral' then
      begin
        vSomaMontanteGeral := lCalculo[lCont].ValorLiquidoProdutos;
        strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Valor liquido Produtos"(REQ + OS - Devolução)';
      end
      else
      begin
        vSomaMontanteGeral := lCalculo[lCont].ValorLucroProdutos;
        strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Lucro Produtos"(Valor liquido - Custo)'
      end;
    end;

  end
  else if Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Prestação Recebida' then
  begin
    vSomaMontanteGeral :=
      lCalculo[lCont].ValorRecebDinheiro + lCalculo[lCont].ValorRecebCredito + lCalculo[lCont].ValorRecebCheque;
    strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Recebimento Dinheiro + Recebimento Cheque/Outros"(A vista + Cheques + Creditos -' + sLineBreak +
                         PadR(' ', 21) + 'Dev Cheques - Dev Creditos)';
  end
  else if Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Mod.Recebimento' then
  begin
    vSomaMontanteGeral :=
      lCalculo[lCont].ValorRecebDinheiro + lCalculo[lCont].ValorRecebCredito + lCalculo[lCont].ValorRecebCheque;
    strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Recebimento Dinheiro + Recebimento Cheque/Outros"(Formas de pgto de vendas)';
  end
  else if Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Produto' then
  begin
//    if (lCalculo[lCont].fABRANG_PERFIL <> 'PESO') and
//    (vColab.vPerfil.dataSet.FieldByName('PERC_PESO').AsFloat = 0) then
//    begin
      vSomaMontanteGeral := lCalculo[lCont].ValorComissaoProduto;
      strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Comissao produto"(REQ + OS - Devolução)';
//    end
//    else
//    begin
//      vSomaMontanteGeral := lCalculo[lCont].ValorLiquidoProdutos;
//      strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Valor liquido Produtos"(REQ + OS - Devolução)';
//    end;
  end
  else if Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Segmentação' then
  begin
    if Trim(lCalculo[lCont].fEM_CIMA_PERFIL) = 'Valor Geral' then
    begin
      vSomaMontanteGeral := lCalculo[lCont].ValorLiquidoProdutos;
      strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Valor liquido Produtos"(REQ + OS - Devolução)';
    end
    else
    begin
      vSomaMontanteGeral := lCalculo[lCont].ValorLucroProdutos;
      strInfo := strInfo + PadR('Base de cálculo', 19) + ': "Lucro Produtos"(Valor liquido - Custo)'
    end;
  end;
  strInfo := strInfo + sLineBreak;

  strMeta := '';
  if (Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Produto') then//and
    //(lCalculo[lCont].fABRANG_PERFIL <> 'PESO') and
    //(vColab.vPerfil.dataSet.FieldByName('PERC_PESO').AsFloat = 0) then
  begin
    lCalculo[lCont].fValorComissao := lCalculo[lCont].ValorComissaoProduto;
    strInfo := strInfo + PadR('Valor comissão', 19)+ ': "Comissao produto"(REQ + OS - Devolução)';
  end
  else
  begin
    if vColab.vPerfil.vMetas.dataSet.IsEmpty then
      vPercentualPesoTemp := vColab.vPerfil.dataSet.FieldByName('PERC_PESO').AsFloat
    else
    begin
      lCalculo[lCont].fPercentualMeta := 0;
      vColab.vPerfil.vMetas.dataSet.First;
      while not vColab.vPerfil.vMetas.dataSet.Eof do
      begin
        if ((vSomaMontanteGeral) >= vColab.vPerfil.vMetas.dataSet.FieldByName('VALOR_META').AsFloat) and
          ((vSomaMontanteGeral) <= vColab.vPerfil.vMetas.dataSet.FieldByName('VALOR_META1').AsFloat) then
        begin
          lCalculo[lCont].fPercentualMeta := vColab.vPerfil.vMetas.ffloat('COMISSAO_META');
          strMeta := Format(PadR('Meta atingida', 19) + ': "%s" De %n até %n',
                            [vColab.vPerfil.vMetas.fstr('descricao_meta'),
                             vColab.vPerfil.vMetas.ffloat('valor_meta'),
                             vColab.vPerfil.vMetas.ffloat('valor_meta1')]) + sLineBreak;
        end;

        vColab.vPerfil.vMetas.dataSet.Next;
      end;
      vPercentualPesoTemp := lCalculo[lCont].fPercentualMeta;

      strInfo := strInfo + strMeta;// + Format(PadR('Origem percentual', 19) + ': "Percentual Meta (%f)"', [vPercentualPesoTemp]) + sLineBreak;
    end;

    if lCalculo[lCont].fABRANG_PERFIL = 'PESO' then
    begin
      strInfo := strInfo + Format(PadR('Origem peso', 19) + ': "%s (%f)"', [IfThen(strMeta <> '', 'Meta', 'Perfil'), vPercentualPesoTemp]) + sLineBreak;
      strInfo := strInfo + Format(PadR('Percentual comissão', 19) + ': "Colaborador (%f)"', [vColab.ffloat('PERC_PESO')]);      
   
      lCalculo[lCont].fValorComissao := lCalculo[lCont].fValorComissao +
        ((((vSomaMontanteGeral * vPercentualPesoTemp) / 100) *
        vColab.dataSet.FieldByName('PERC_PESO').AsFloat) / 100);
    end
    else
    begin
      strInfo := strInfo + Format(PadR('Percentual comissão', 19) + ': "%s (%f)"', [IfThen(strMeta <> '', 'Meta', 'Perfil'), vPercentualPesoTemp]);

      lCalculo[lCont].fValorComissao := lCalculo[lCont].fValorComissao +
        ((vSomaMontanteGeral * vPercentualPesoTemp) / 100);      
    end;
  end;

  lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak + strInfo + sLineBreak + sLineBreak + 'Fim';
end;

procedure TCalculoComissao._contarOsAbertas;
begin
  //Conta a quantidade de OS abertas para o Colaborador

  buscas.Close;
  buscas.SQL.Text := 'select' +
    ' count(pv.nped) qtdeaberta' +
    ' from pedvenda pv' +
    ' inner join colaborador col on col.cod_vendedor = pv.cod_vendedor and' +
    ' col.cod_empresa = pv.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where pv.data_ped >= :dataIni and pv.data_ped <= :dataFim and' +
    ' pv.cod_empresa = :cod_empresa and pv.ativo = 1 and pv.tipo = ''OS'' ' +
    ' and pv.status_ped is null';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if Trim(lCalculo[lCont].fTipoOS) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pv.tipo_os in ' + Trim(lCalculo[lCont].fTipoOS);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  lCalculo[lCont].fQuantidadeOSAbertas := lCalculo[lCont].fQuantidadeOSAbertas +
    buscas.FieldByName('qtdeaberta').AsInteger;

  buscas.Close;
end;

function TCalculoComissao._criarCalc: boolean;
begin
	try
    calc := CreateOleObject('com.sun.star.ServiceManager');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro', MB_OK+MB_ICONEXCLAMATION);
  end;
end;

function TCalculoComissao._criarExcel: boolean;
var
  I, J: Integer;
  vtemp: string;
begin
  try
    excel := CreateOleObject('Excel.Application');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro', 0 + 64);
  end;
  try
    excel.Workbooks.add;
    sheet := excel.Workbooks[1].sheets[1];
    sheet.cells[1,01] := 'Cálculo de comissão. Colaborador: ' + Trim(vColab.dataSet.FieldByName('nome_vendedor').AsString) + ' Período: ' + fDataInicial + ' até ' + fDataFinal;
    sheet.cells[1,01].Font.Size := 12;
    sheet.cells[1,01].Font.Bold := True;

    for I := 1 to dataSet.FieldCount do
    begin
      vtemp := dataSet.Fields[I - 1].DisplayLabel;
      sheet.cells[2, I] := vtemp;
      sheet.cells[1,01].Font.Bold := True;
      sheet.cells[2, I].Interior.Color := $00ffcf9c;
    end;
  except

  end;
end;

procedure TCalculoComissao._iniciarVariaveis;
var
  I: Integer;
begin
  SomaVendaDevolucaoComVenda:= 0;
  SomaLucroDevolucaoComVenda:= 0;
  SomaVendaDevolucaoSemVenda:= 0;
  SomaLucroDevolucaoSemVenda:= 0;
  fSomaDevolucaoPrazo := 0;
  SomaComissaoProdutoDevolucao := 0;
  fCodigoColaborador := '';
  fGerente := False;
  {
  for I := 0 to lQtde - 1 do
  begin
    lCalculo[i].fTipoREQ := '';
    lCalculo[i].fTipoOS := '';
    lCalculo[i].fControlesCaixa := '';
    lCalculo[i].fCodigosServico := '';
    lCalculo[i].fCodigosSegmentacao := '';
    lCalculo[i].fCodigosGrupo := '';
    lCalculo[i].ValorLiquidoMaoDeObra := 0;
    lCalculo[i].ValorLiquidoProdutos := 0;
    lCalculo[i].ValorLucroMaoDeObra := 0;
    lCalculo[i].ValorLucroProdutos := 0;
    lCalculo[i].ValorRecebDinheiro := 0;
    lCalculo[i].ValorRecebPrazo := 0;
    lCalculo[i].ValorRecebCheque := 0;
    lCalculo[i].ValorRecebCredito := 0;
    lCalculo[i].ValorDevolvCheque := 0;
    lCalculo[i].ValorDevolvCredito := 0;
    lCalculo[i].ValorComissaoProduto := 0;
    lCalculo[i].fPercentualMeta := 0;
    lCalculo[i].fQuantidadeOSAbertas := 0;
    lCalculo[i].fValorComissao := 0;
    lCalculo[i].fValorBrutoDevolvidoComVenda := 0;
    lCalculo[i].fValorLiquidoDevolvidoComVenda := 0;
    lCalculo[i].fValorBrutoDevolvidoSemVenda := 0;
    lCalculo[i].fValorLiquidoDevolvidoSemVenda := 0;
    lCalculo[i].fValorDevolvidoComissaoProduto := 0;
    lCalculo[i].fCODIGO_PERFIL := '';
    lCalculo[i].fNOME_PERFIL := '';
    lCalculo[i].fABRANG_PERFIL := '';
    lCalculo[i].fTIPO_SERV_PROD := '';
    lCalculo[i].fEM_CIMA_PERFIL := '';
    lCalculo[i].fTIPO_PERFIL := '';
    lCalculo[i].fEntrega := False;
    
  end;
  }

end;

procedure TCalculoComissao._iniciarVariaveisCalculo;
var
  vLista: TStringList;
  I: Integer;
begin
  vLista := TStringList.Create;

  lCalculo[lCont].fTIPO_PERFIL := IfThen(vColab.vPerfil.fequals('TIPO_PERFIL', 'Segmentação'),
                                         strVendaGeral,
                                         vColab.vPerfil.fstr('TIPO_PERFIL'));

  if MatchText(lCalculo[lCont].fTIPO_PERFIL, [strVendaGeral, strProduto]) then
  begin

    vLista.Text := vColab.vPerfil.dataSet.FieldByName('TABELAS_PERFIL').AsString;

    buscas.Close;
    buscas.SQL.Text := 'select * from TIPO_VENDAS where ativo = 1 and venda = ''S'' ';
    buscas.Open;

    for I := 0 to vLista.Count - 1 do
    begin

      buscas.First;
      while not buscas.Eof do
      begin
        if Trim(buscas.FieldByName('tipo').AsString) = 'REQ' then
        begin
          if (Trim(vLista[I]) = Trim(buscas.FieldByName('descricao').AsString)) then
            if Trim(lCalculo[lCont].fTipoREQ) = '' then
              lCalculo[lCont].fTipoREQ := '('+QuotedStr(Trim(buscas.FieldByName('sigla').AsString))
            else
              lCalculo[lCont].fTipoREQ := lCalculo[lCont].fTipoREQ + ',' + QuotedStr(Trim(buscas.FieldByName('sigla').AsString));
        end
        else if Trim(buscas.FieldByName('tipo').AsString) = 'OS' then
        begin
          if (Trim(vLista[I]) = Trim(buscas.FieldByName('descricao').AsString)) then
            if Trim(lCalculo[lCont].fTipoOS) = '' then
              lCalculo[lCont].fTipoOS := '('+QuotedStr(Trim(buscas.FieldByName('tipo_os').AsString))
            else
              lCalculo[lCont].fTipoOS := lCalculo[lCont].fTipoOS + ',' + QuotedStr(Trim(buscas.FieldByName('tipo_os').AsString));
        end;
        buscas.Next;
      end;

      if (Trim(vLista[I]) = 'Vendas O.S Entrega') then
        lCalculo[lCont].fEntrega := True;

    end;
    if Trim(lCalculo[lCont].fTipoREQ) <> '' then
      lCalculo[lCont].fTipoREQ := lCalculo[lCont].fTipoREQ + ')';
    if Trim(lCalculo[lCont].fTipoOS) <> '' then
      lCalculo[lCont].fTipoOS := lCalculo[lCont].fTipoOS + ')';
  end;

  vLista.Text := vColab.vPerfil.dataSet.FieldByName('CONTEUDO_FLAG').AsString;

  for I := 0 to vLista.Count - 1 do
  begin

    if Trim(vColab.vPerfil.dataSet.FieldByName('FLAG_SERV_PROD').AsString) = 'Controle Caixa' then
    begin
      if Trim(lCalculo[lCont].fControlesCaixa) = '' then
        lCalculo[lCont].fControlesCaixa := '(' + Trim(vLista[I])
      else
        lCalculo[lCont].fControlesCaixa := lCalculo[lCont].fControlesCaixa + ',' + Trim(vLista[I]);
    end
    else if Trim(vColab.vPerfil.dataSet.FieldByName('FLAG_SERV_PROD').AsString) = 'Tipo Serviço' then
    begin
      if Trim(lCalculo[lCont].fCodigosServico) = '' then
        lCalculo[lCont].fCodigosServico := '(' + Trim(vLista[I])
      else
        lCalculo[lCont].fCodigosServico := lCalculo[lCont].fCodigosServico + ',' + Trim(vLista[I]);
    end
    else if Trim(vColab.vPerfil.dataSet.FieldByName('FLAG_SERV_PROD').AsString) = 'Tipo de Segmentação' then
    begin
      if Trim(lCalculo[lCont].fCodigosSegmentacao) = '' then
        lCalculo[lCont].fCodigosSegmentacao := '(' + Trim(vLista[I])
      else
        lCalculo[lCont].fCodigosSegmentacao := lCalculo[lCont].fCodigosSegmentacao + ',' + Trim(vLista[I]);
    end
    else if Trim(vColab.vPerfil.dataSet.FieldByName('FLAG_SERV_PROD').AsString) = 'Grupo Produto' then
    begin
      if Trim(lCalculo[lCont].fCodigosGrupo) = '' then
        lCalculo[lCont].fCodigosGrupo := '(' + Trim(vLista[I])
      else
        lCalculo[lCont].fCodigosGrupo := lCalculo[lCont].fCodigosGrupo + ',' + Trim(vLista[I]);
    end;

  end;

  fGerente := False;
  fCodigoColaborador := '(' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if lCalculo[lCont].fTIPO_PERFIL = strProduto then
  begin
    SqlOpen('select cod_vendedor from colaborador' +
      ' where cod_gerente = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa);

    buscas.First;
    while not buscas.Eof do
    begin
      fGerente := True;

      if Trim(fCodigoColaborador) = '' then
        fCodigoColaborador := '(' + Trim(buscas.FieldByName('cod_vendedor').AsString)
      else
        fCodigoColaborador := fCodigoColaborador + ',' + Trim(buscas.FieldByName('cod_vendedor').AsString);

      buscas.Next;
    end;
  end;

  if Trim(lCalculo[lCont].fControlesCaixa) <> '' then
    lCalculo[lCont].fControlesCaixa := lCalculo[lCont].fControlesCaixa + ')';
  if Trim(lCalculo[lCont].fCodigosServico) <> '' then
    lCalculo[lCont].fCodigosServico := lCalculo[lCont].fCodigosServico + ')';
  if Trim(lCalculo[lCont].fCodigosSegmentacao) <> '' then
    lCalculo[lCont].fCodigosSegmentacao := lCalculo[lCont].fCodigosSegmentacao + ')';
  if Trim(lCalculo[lCont].fCodigosGrupo) <> '' then
    lCalculo[lCont].fCodigosGrupo := lCalculo[lCont].fCodigosGrupo + ')';
  if Trim(fCodigoColaborador) <> '' then
    fCodigoColaborador := fCodigoColaborador + ')';

  lCalculo[lCont].fCODIGO_PERFIL := vColab.vPerfil.fstr('CODIGO_PERFIL');
  lCalculo[lCont].fNOME_PERFIL := vColab.vPerfil.fstr('NOME_PERFIL');
  lCalculo[lCont].fABRANG_PERFIL := vColab.vPerfil.fstr('ABRANG_PERFIL');
  lCalculo[lCont].fTIPO_SERV_PROD := vColab.vPerfil.fstr('TIPO_SERV_PROD');
  lCalculo[lCont].fEM_CIMA_PERFIL := vColab.vPerfil.fstr('EM_CIMA_PERFIL');

  if lCalculo[lCont].fTIPO_PERFIL <> strVendaGeral then
    lCalculo[lCont].fABRANG_PERFIL := 'INDIVIDUAL';

  SomaVendaDevolucaoComVenda:= 0;
  SomaLucroDevolucaoComVenda:= 0;
  SomaVendaDevolucaoSemVenda:= 0;
  SomaLucroDevolucaoSemVenda:= 0;
  fSomaDevolucaoPrazo := 0;
  SomaComissaoProdutoDevolucao := 0;

  lCalculo[lCont].strInfo := lCalculo[lCont].fTIPO_PERFIL + sLineBreak;
end;

function TCalculoComissao._montarCalc: boolean;
var
	OpenDesktop, Documento, Planilha: Variant;
	Connect, OpenOffice, Sheets, Sheet, Celula: Variant;
  vPointer: Pointer;
  vTemp: string;
  vSize: Integer;
  vField: TField;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
  i, j: Integer;
begin
  if not vDadosIni.PesqPros('COMISS004', 'ABRIR', '', 'NAOTEM', '', dtmCalculoComissao.qrBuscas, True) then
    Exit;

  if _criarCalc then
  begin
  	try
      vPointer:= DataSet.GetBookmark;

      //Cria o link OLE com o OpenOffice
      if VarIsEmpty(OpenOffice) then
        OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
      Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

      //Inicia o Calc
      OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
      Documento   := OpenDesktop.LoadComponentFromURL('private:factory/scalc',
                        '_blank', 0, VarArrayCreate([0, -1], varVariant));
      Planilha    := Documento.getSheets.getByName('Planilha1');
      Sheets      := Documento.Sheets;
      Sheet       := Sheets.getByIndex(0);

      //Criar linha inicial
      Celula := Planilha.getCellByPosition(i, 0);
      Celula.CharWeight := 200;
      Sheet.getCellByPosition(i, 0).setString('Exportação de dados para Planilha');

      //Definir largura colunas
      for I := 0 to dataSet.FieldCount - 1 do
      begin
      	if (i = 0) then
        begin
          if (Length('Exportação de dados para Planilha') > dataSet.Fields[I].Size) then
            vSize := Length('Exportação de dados para Planilha')
          else if dataSet.Fields[I].DisplayWidth > dataSet.Fields[I].Size then
          	vSize := dataSet.Fields[I].DisplayWidth
          else
            vSize := dataSet.Fields[I].Size;
        end
        else if dataSet.Fields[I].DisplayWidth > dataSet.Fields[I].Size then
          vSize := dataSet.Fields[I].DisplayWidth
        else
        	vSize := dataSet.Fields[I].Size;
        Planilha.getColumns.getByIndex(i).width := vSize * 220;
      end;

      //Preencher colunas planilha
			i := 0;
      j := 1;
      for I := 0 to dataSet.FieldCount - 1 do
      begin
      	Celula := Planilha.getCellByPosition(i, j);
        Celula.CharWeight := 200;
        Celula.CellBackColor := '39423';
        Sheet.getCellByPosition(i, j).setString(dataSet.Fields[I].DisplayLabel);
      end;

      j := 2;
      vLinhaExcel := 3;
      DataSet.First;
      while not DataSet.Eof do
      begin

        for I := 0 to dataSet.FieldCount - 1 do
        begin
        	vField := dataSet.Fields[I];
          vTemp := Trim(dataSet.Fields[I].AsString);

          if vTemp = '' then
          else if dataSet.Fields[I] is TDateTimeField then
          begin
            if not vField.IsNull then
            begin
              DataAux := vField.AsDateTime;
              DecodeDate(vField.AsDateTime, AnoAux, MesAux, DiaAux);
              if DataAux - EncodeDate(AnoAux, MesAux, DiaAux) = 0 then
                Sheet.getCellByPosition(i, j).setString(FormatDateTime('dd/mm/yyyy', EncodeDate(AnoAux, MesAux, DiaAux)))
              else
                Sheet.getCellByPosition(i, j).setString(FormatDateTime('dd/mm/yyyy', DataAux));
            end;
          end
          else  if dataSet.Fields[I] is TFloatField then
          begin
          	if vTemp <> '' then
            begin
              Sheet.getCellByPosition(i, j).setValue(StrToFloat(vTemp));
              if (TFloatField(vField).currency) then
                Sheet.getCellByPosition(i, j).NumberFormat := 21
              else
                Sheet.getCellByPosition(i, j).NumberFormat := 4;
            end
            else
            begin
              Sheet.getCellByPosition(i, j).setValue(StrToFloat(vTemp));
              if (TFloatField(vField).currency) then
                Sheet.getCellByPosition(i, j).NumberFormat := 21
              else
                Sheet.getCellByPosition(i, j).NumberFormat := 4;
            end;
          end
          else if dataSet.Fields[I] is TStringField then
          begin
            Sheet.getCellByPosition(i, j).setString(vTemp)
          end
          else
            Sheet.getCellByPosition(i, j).setString(vTemp);


          Celula := Planilha.getCellByPosition(i, j);

          if vField is TTimeField then
            Celula.HoriJustify   := 3
          else if vField is TDateTimeField then
            Celula.HoriJustify   := 3
          else if vField is TFloatField then
            Celula.HoriJustify   := 3
          else if vField is TIntegerField then
            Celula.HoriJustify   := 3;

          if ((j mod 2) = 1) then
            Celula.CellBackColor := 8303567
          else
            Celula.CellBackColor := 13893372;
        end;

        J := J + 1;

        DataSet.Next;
      end;

      DataSet.GotoBookmark(vPointer);
    finally

    end;
  end;
end;

function TCalculoComissao._montarExcel: boolean;
var
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I: Integer;
begin
  if not vDadosIni.PesqPros('COMISS004', 'ABRIR', '', 'NAOTEM', '', dtmCalculoComissao.qrBuscas, True) then
    Exit;

  if _criarExcel then
  begin
    try
      vPointer:= DataSet.GetBookmark;

      vLinhaExcel := 3;
      DataSet.First;
      while not DataSet.Eof do
      begin

        for I := 1 to dataSet.FieldCount  do
        begin
          vTemp := Trim(dataSet.Fields[I - 1].AsString);

          if vTemp = '' then
          else if dataSet.Fields[I - 1] is TDateTimeField then
            sheet.cells[vLinhaExcel, I].Value := EncodeDate(YearOf(StrToDate(vTemp)),MonthOf(StrToDate(vTemp)),DayOf(StrToDate(vTemp)))
          else  if dataSet.Fields[I - 1] is TFloatField then
          begin
            sheet.cells[vLinhaExcel, I].Value := StrToFloat(StringReplace(vTemp,'.','',[rfReplaceAll]));
            vTemp := Trim(TFloatField(dataSet.Fields[I - 1]).DisplayFormat);
            if vTemp <> '' then
            begin
              vTemp := StringReplace(vTemp,'#','',[rfReplaceAll]);
              vTemp := StringReplace(vTemp,'.',',',[rfReplaceAll]);
            end
            else
              vTemp := '0,00';
            sheet.cells[vLinhaExcel, I].NumberFormat := vTemp;
          end
          else if dataSet.Fields[I - 1] is TStringField then
          begin
            sheet.cells[vLinhaExcel, I].Value := vTemp;
          end
          else
            sheet.cells[vLinhaExcel, I] := vTemp;

          if (vLinhaExcel mod 2) = 1 then
            sheet.cells[vLinhaExcel, I].Interior.Color := 8303567//ColorToRGB(clYellow)
          else
            sheet.cells[vLinhaExcel, I].Interior.Color := 13893372;//ColorToRGB(clSkyBlue);
        end;

        Inc(vLinhaExcel);

        DataSet.Next;
      end;

      DataSet.GotoBookmark(vPointer);

      excel.Cells.EntireRow.AutoFit;
      excel.Cells.EntireColumn.AutoFit;
    finally
      excel.visible := True;
    end;
  end;
end;

function TCalculoComissao._obterComissaoColaborador: boolean;
var
  vValorTotal: Currency;
begin
  if not vDadosIni.PesqPros('COMISS003', 'ABRIR', '', 'NAOTEM', '', dtmCalculoComissao.qrBuscas, True) then
    Exit;

  vDadosIni.abreStatusProcessamento('','Iniciando variáveis');
  dataSet.EmptyDataSet;
  SetLength(lCalculo, 0);
  _iniciarVariaveis;
  lQtde := vColab.vPerfil.dataSet.RecordCount;
  SetLength(lCalculo, lQtde);
  lCont := 0;

  vColab.vPerfil.dataSet.First;
  while not vColab.vPerfil.dataSet.Eof do
  begin

    vDadosIni.abreStatusProcessamento('','Iniciando cálculo de comissão');
    _iniciarVariaveisCalculo;

    vDadosIni.abreStatusProcessamento('','Efetuando soma das Vendas em "REQ"');
    if (lCalculo[lCont].fTipoREQ <> '') and
       (MatchStr(lCalculo[lCont].fTIPO_SERV_PROD, [strProd, strProdServ])) then
      _somaVendasProdutosReq;

    vDadosIni.abreStatusProcessamento('','Efetuando soma das Vendas de produtos em O.S.');
    if (Trim(lCalculo[lCont].fTipoOS) <> '') and
       (MatchStr(lCalculo[lCont].fTIPO_SERV_PROD, [strProd, strProdServ])) then
      _somaVendasProdutosOS;

    vDadosIni.abreStatusProcessamento('','Efetuando soma das Devoluções');
    if ((lCalculo[lCont].fTipoREQ <> '') or (Trim(lCalculo[lCont].fTipoOS) <> '')) and
       (MatchStr(lCalculo[lCont].fTIPO_SERV_PROD, [strProd, strProdServ])) then
    begin
      _subtrairDevolucoesDeVendas;
      _subtrairDevolucoesSemVendas;
    end;

    vDadosIni.abreStatusProcessamento('','Efetuando soma dos Serviços');
    if (Trim(lCalculo[lCont].fTipoOS) <> '') and
       (MatchStr(lCalculo[lCont].fTIPO_SERV_PROD, [strServ, strProdServ])) then
      _somaVendasServicos;

    vDadosIni.abreStatusProcessamento('','Contando O.S. em aberto');
    if (Trim(lCalculo[lCont].fTipoOS) <> '') then
      _contarOsAbertas;

    //acho que esse teste de Venda entrega esta errado ou estranho, parece que independente das condições dos dois testes anteriores, se for entrega
    // soma os valores, porem se a condicao for atendida então está duplicando
//    olhar o comentario
    {
    if lCalculo[lCont].fEntrega then
    begin
      vDadosIni.abreStatusProcessamento('','Efetuando soma das Vendas Entrega');
      _somaVendasServicosOsEntrega;
      _somaVendasProdutosOsEntrega;

      vDadosIni.abreStatusProcessamento('','Contando O.S. em aberto');
      _contarOsAbertas;
    end;
    }

    vDadosIni.abreStatusProcessamento('','Somando recebimentos');
    if Trim(lCalculo[lCont].fTIPO_PERFIL) =  'Prestação Recebida' then
    begin
      _somaRecebimentosEmDinheiro;
      _somaRecebimentosCheque;
      _somaRecebimentosCreditos;

      vDadosIni.abreStatusProcessamento('','Somando devolução de recebimentos');
      _somaRecebimentosChequeDevolucao;
      _somaRecebimentosCreditosDevolucao;
    end
    else if Trim(lCalculo[lCont].fTIPO_PERFIL) =  'Mod.Recebimento' then
    begin
      _somaRecebimentos;
    end;

    vDadosIni.abreStatusProcessamento('','Calculando a comissão com os dados obtidos');
    _calularComissao;

    _salvaComissao;

    vColab.vPerfil.dataSet.Next;
    lCont := lCont + 1;

    if ((SomaVendaDevolucaoComVenda + SomaVendaDevolucaoSemVenda) > 0) or
      ((SomaLucroDevolucaoComVenda + SomaLucroDevolucaoSemVenda) >0) or
      ((fSomaDevolucaoPrazo) > 0) or
      ((SomaComissaoProdutoDevolucao) > 0) then
    begin
      dataSet.Insert;
      dataSet.FieldByName('CODIGO_PERFIL').AsString := 'DEVOL';
      dataSet.FieldByName('NOME_PERFIL').AsString := '* ' + PadL(lCalculo[lCont - 1].fCODIGO_PERFIL, 3) + ' - ' +lCalculo[lCont - 1].fNOME_PERFIL;
      dataSet.FieldByName('VALORLIQMO').AsCurrency := 0;
      dataSet.FieldByName('VALORLIQPC').AsCurrency := (-1) * (SomaVendaDevolucaoComVenda + SomaVendaDevolucaoSemVenda);
      dataSet.FieldByName('VALORLUCROMO').AsCurrency := 0;
      dataSet.FieldByName('VALORLUCROPC').AsCurrency := (-1) * (SomaLucroDevolucaoComVenda + SomaLucroDevolucaoSemVenda);
      dataSet.FieldByName('VALORRECDIN').AsCurrency := 0;
      dataSet.FieldByName('VALORRECPRAZO').AsCurrency := (-1) * (fSomaDevolucaoPrazo);
      dataSet.FieldByName('VALORCOMISSPROD').AsCurrency := (-1) * (SomaComissaoProdutoDevolucao);
      dataSet.FieldByName('ABRANG_PERFIL').AsString := 'DEVOL';
      dataSet.FieldByName('TIPO_SERV_PROD').AsString := 'DEVOL';
      dataSet.FieldByName('EM_CIMA_PERFIL').AsString := 'DEVOL';
      dataSet.FieldByName('PERCENTUALMETA').AsString := 'DEVOL';
      dataSet.FieldByName('QTDEOSABERTAS').AsString := 'DEVOL';
      dataSet.FieldByName('VALORCOMISSAO').AsCurrency := 0;
      dataSet.FieldByName('TIPO_PERFIL').AsString := lCalculo[lCont - 1].fTIPO_PERFIL;
      dataSet.Post;
    end;


  end;

  vDadosIni.abreStatusProcessamento('','Aguarde... Finalizando');

//  dataSet.Insert;
//  dataSet.FieldByName('CODIGO_PERFIL').AsString := 'DEVOL';
//  dataSet.FieldByName('VALORLIQMO').AsCurrency := 0;
//  dataSet.FieldByName('VALORLIQPC').AsCurrency := (-1) * (SomaVendaDevolucaoComVenda + SomaVendaDevolucaoSemVenda);
//  dataSet.FieldByName('VALORLUCROMO').AsCurrency := 0;
//  dataSet.FieldByName('VALORLUCROPC').AsCurrency := (-1) * (SomaLucroDevolucaoComVenda + SomaLucroDevolucaoSemVenda);
//  dataSet.FieldByName('VALORRECDIN').AsCurrency := 0;
//  dataSet.FieldByName('VALORRECPRAZO').AsCurrency := (-1) * (fSomaDevolucaoPrazo);
//  dataSet.FieldByName('VALORCOMISSPROD').AsCurrency := (-1) * (SomaComissaoProdutoDevolucao);
//  dataSet.FieldByName('ABRANG_PERFIL').AsString := 'DEVOL';
//  dataSet.FieldByName('TIPO_SERV_PROD').AsString := 'DEVOL';
//  dataSet.FieldByName('EM_CIMA_PERFIL').AsString := 'DEVOL';
//  dataSet.FieldByName('PERCENTUALMETA').AsString := 'DEVOL';
//  dataSet.FieldByName('QTDEOSABERTAS').AsString := 'DEVOL';
//  dataSet.FieldByName('VALORCOMISSAO').AsCurrency := 0;
//  dataSet.Post;

  vValorTotal := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
    vValorTotal := vValorTotal +
      dataSet.FieldByName('VALORCOMISSAO').AsCurrency;

    dataSet.Next;
  end;

  dataSet.Insert;
  dataSet.FieldByName('CODIGO_PERFIL').AsString := 'TOTAL';
  dataSet.FieldByName('VALORCOMISSAO').AsCurrency := vValorTotal;
  dataSet.Post;

end;

procedure TCalculoComissao._somaRecebimentosEmDinheiro;
var
  sqlControles: string;
begin
  //Soma os recebimentos em dinheiro
  sqlControles := IfThen(lCalculo[lCont].fControlesCaixa <> '', ' and fp.cod_controle in ' + lCalculo[lCont].fControlesCaixa);

  SqlOpen('select sum(valordoc) soma' +
          ' from formpagamento fp' +
          ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle' +
          '   and ctr.codigo_emp = fp.cod_empresa' +
          ' where fp.data_mov >= %s and fp.data_mov <= %s and fp.tipdoc = ''N'' ' +
          ' and fp.operador = %d and fp.cod_empresa = %d and fp.ativo = 1' +
          ' and fp.tpdocs not in (''LCS'', ''PRE'') ' +
          ' and coalesce(fp.rec_tipvend, '''') <> ''REC''' +
          ' %s', // sql controles
          [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
           vDadosIni.cod_empresa, sqlControles]);

  lCalculo[lCont].ValorRecebDinheiro := lCalculo[lCont].ValorRecebDinheiro +
    buscas.FieldByName('soma').AsFloat;

  lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
    Format('%s: %11.2n %s', [PadR('Receb. Caixa', 19),
                            buscas.FieldByName('soma').AsFloat, sLineBreak]);

  buscas.Close;

end;

procedure TCalculoComissao._salvaComissao;
begin
  // Salva o calculo no Dataset Temporário

  dataSet.Insert;
  dataSet.FieldByName('CODIGO_PERFIL').AsString := PadL(lCalculo[lCont].fCODIGO_PERFIL, 3);
  dataSet.FieldByName('NOME_PERFIL').AsString := lCalculo[lCont].fNOME_PERFIL;
  dataSet.FieldByName('VALORLIQMO').AsCurrency := lCalculo[lCont].ValorLiquidoMaoDeObra;
  dataSet.FieldByName('VALORLIQPC').AsCurrency := lCalculo[lCont].ValorLiquidoProdutos;
  dataSet.FieldByName('VALORLUCROMO').AsCurrency := lCalculo[lCont].ValorLucroMaoDeObra;
  dataSet.FieldByName('VALORLUCROPC').AsCurrency := lCalculo[lCont].ValorLucroProdutos;
  dataSet.FieldByName('VALORRECDIN').AsCurrency := lCalculo[lCont].ValorRecebDinheiro;
  dataSet.FieldByName('VALORRECPRAZO').AsCurrency := lCalculo[lCont].ValorRecebCheque + lCalculo[lCont].ValorRecebCredito;
  dataSet.FieldByName('VALORCOMISSPROD').AsCurrency := lCalculo[lCont].ValorComissaoProduto;
  dataSet.FieldByName('ABRANG_PERFIL').AsString := lCalculo[lCont].fABRANG_PERFIL;
  dataSet.FieldByName('TIPO_SERV_PROD').AsString := lCalculo[lCont].fTIPO_SERV_PROD;
  dataSet.FieldByName('EM_CIMA_PERFIL').AsString := lCalculo[lCont].fEM_CIMA_PERFIL;
  dataSet.FieldByName('PERCENTUALMETA').AsString := Format('%0.2f', [lCalculo[lCont].fPercentualMeta]);
  dataSet.FieldByName('QTDEOSABERTAS').AsString := IntToStr(lCalculo[lCont].fQuantidadeOSAbertas);
  dataSet.FieldByName('VALORCOMISSAO').AsCurrency := lCalculo[lCont].fValorComissao;
  dataSet.FieldByName('TIPO_PERFIL').AsString := lCalculo[lCont].fTIPO_PERFIL;
  dataSet.Post;
  
end;

procedure TCalculoComissao._somaRecebimentos;
var
  sqlControles: string; 
begin
  //Soma os recebimentos pelo controle selecionado no perfil
  sqlControles := IfThen(lCalculo[lCont].fControlesCaixa <> '', ' and fp.cod_controle in ' + lCalculo[lCont].fControlesCaixa);

  SqlOpen('select fp.tipdoc, sum(fp.valordoc) soma' +
          ' from formpagamento fp' +
          ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle' +
          '   and ctr.codigo_emp = fp.cod_empresa' +
          ' where fp.data_mov >= %s and fp.data_mov <= %s' +
          ' and fp.operador = %d and fp.cod_empresa = %d and fp.ativo = 1' +
          ' and fp.tpdocs not in (''LCS'', ''PRE'') ' +
          ' and coalesce(fp.rec_tipvend, '''') <> ''REC''' +
          ' %s' + 
          ' group by 1',
          [date_fb(fDataInicial), date_fb(fDataFinal), vColab.fint('cod_vendedor'),
           vDadosIni.cod_empresa, sqlControles]);

  buscas.First;
  while not buscas.Eof do
  begin

    if Trim(buscas.FieldByName('tipdoc').AsString) = 'N' then
    begin    
      lCalculo[lCont].ValorRecebDinheiro := lCalculo[lCont].ValorRecebDinheiro + buscas.FieldByName('soma').AsFloat;
      lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
                                 Format('%s: %11.2n %s', [PadR('Receb. Caixa Vnd', 19),
                                                         buscas.FieldByName('soma').AsFloat, sLineBreak]);
    end
    else if Trim(buscas.FieldByName('tipdoc').AsString) = 'S1' then
    begin    
      lCalculo[lCont].ValorRecebCheque := lCalculo[lCont].ValorRecebCheque + buscas.FieldByName('soma').AsFloat;
      lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
                                 Format('%s: %11.2n %s', [PadR('Receb. Cheque Vnd', 19),
                                                         buscas.FieldByName('soma').AsFloat, sLineBreak]);
    end
    else if Trim(buscas.FieldByName('tipdoc').AsString) = 'S2' then
    begin    
      lCalculo[lCont].ValorRecebCredito := lCalculo[lCont].ValorRecebCredito + buscas.FieldByName('soma').AsFloat;
      lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
                                 Format('%s: %11.2n %s', [PadR('Receb. Creditos Vnd', 19),
                                                         buscas.FieldByName('soma').AsFloat, sLineBreak]);
    end;
                                                       

    buscas.Next;                        
  end;
  buscas.Close;

end;

procedure TCalculoComissao._somaRecebimentosCheque;
begin
  //Soma os recebimentos no financeiro em cheque

  buscas.Close;
  buscas.SQL.Text := 'select sum(VL_BAIXA_COMISSAO) soma from controle_cheque' +
    ' where DT_BAIXA_COMISSAO >= :dataIni and DT_BAIXA_COMISSAO <= :dataFim and' +
    ' codigo_vend = :cod_vendedor and (tip_baixa = '''' or tip_baixa is null) and' +
    ' tp_doc_v in (''REQ'', ''OS'', ''MOT'') and' +
    ' codigo_emp = :cod_empresa';

  if Trim(lCalculo[lCont].fControlesCaixa) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and codigo_ctrl in ' + Trim(lCalculo[lCont].fControlesCaixa);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_vendedor').AsInteger :=
    vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  lCalculo[lCont].ValorRecebCheque := lCalculo[lCont].ValorRecebCheque +
    buscas.FieldByName('soma').AsFloat;

  lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
    Format('%s: %11.2n %s', [PadR('Receb. Cheques', 19),
                            buscas.FieldByName('soma').AsFloat, sLineBreak]);

  buscas.Close;

end;

procedure TCalculoComissao._somaRecebimentosChequeDevolucao;
begin
  //Soma as devolucoes de cheques

  buscas.Close;
  buscas.SQL.Text := 'select sum(VL_BAIXA_COMISSAO) soma from controle_cheque' +
    ' where DT_BAIXA_COMISSAO >= :dataIni and DT_BAIXA_COMISSAO <= :dataFim and' +
    ' codigo_vend = :cod_vendedor and tip_baixa = ''D'' and' +
    ' tp_doc_v in (''REQ'', ''OS'', ''MOT'') and' +
    ' codigo_emp = :cod_empresa';

  if Trim(lCalculo[lCont].fControlesCaixa) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and codigo_ctrl in ' + Trim(lCalculo[lCont].fControlesCaixa);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_vendedor').AsInteger :=
    vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  lCalculo[lCont].ValorDevolvCheque := lCalculo[lCont].ValorDevolvCheque +
    buscas.FieldByName('soma').AsFloat;

  fSomaDevolucaoPrazo := fSomaDevolucaoPrazo +
    lCalculo[lCont].ValorDevolvCheque;

  lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
    Format('%s: %11.2n %s', [PadR('Devolução Cheques', 19),
                            buscas.FieldByName('soma').AsFloat, sLineBreak]);

  buscas.Close;

end;

procedure TCalculoComissao._somaRecebimentosCreditos;
begin
  //Soma os recebimentos no Financeiro em Creditos

  buscas.Close;
  buscas.SQL.Text := 'select sum(VL_BAIXA_COMISSAO) soma from BAIXA_CREDITOS' +
    ' where DT_BAIXA_COMISSAO >= :dataIni and DT_BAIXA_COMISSAO <= :dataFim and' +
    ' codigo_vend = :cod_vendedor and (tip_baixa = '''' or tip_baixa is null) and' +
    ' tp_doc_v in (''REQ'', ''OS'', ''MOT'') and' +
    ' codigo_emp = :cod_empresa';

  if Trim(lCalculo[lCont].fControlesCaixa) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and codigo_ctrl in ' + Trim(lCalculo[lCont].fControlesCaixa);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_vendedor').AsInteger :=
    vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  lCalculo[lCont].ValorRecebCredito := lCalculo[lCont].ValorRecebCredito +
    buscas.FieldByName('soma').AsFloat;

  lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
    Format('%s: %11.2n %s', [PadR('Receb. Creditos', 19),
                            buscas.FieldByName('soma').AsFloat, sLineBreak]);

  buscas.Close;

end;

procedure TCalculoComissao._somaRecebimentosCreditosDevolucao;
begin
  //Soma as devolucoes em Creditos

  buscas.Close;
  buscas.SQL.Text := 'select sum(VL_BAIXA_COMISSAO) soma from BAIXA_CREDITOS' +
    ' where DT_BAIXA_COMISSAO >= :dataIni and DT_BAIXA_COMISSAO <= :dataFim and' +
    ' codigo_vend = :cod_vendedor and tip_baixa = ''D'' and' +
    ' tp_doc_v in (''REQ'', ''OS'', ''MOT'') and' +
    ' codigo_emp = :cod_empresa';

  if Trim(lCalculo[lCont].fControlesCaixa) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and codigo_ctrl in ' + Trim(lCalculo[lCont].fControlesCaixa);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_vendedor').AsInteger :=
    vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  lCalculo[lCont].ValorDevolvCredito := lCalculo[lCont].ValorDevolvCredito +
    buscas.FieldByName('soma').AsFloat;

  fSomaDevolucaoPrazo := fSomaDevolucaoPrazo +
    lCalculo[lCont].ValorDevolvCredito;

  lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak +
    Format('%s: %11.2n %s', [PadR('Devolução Creditos', 19),
                            buscas.FieldByName('soma').AsFloat, sLineBreak]);

  buscas.Close;

end;

procedure TCalculoComissao._somaVendasProdutosOS;
var
  strInfo: string;
begin
  //Soma as vendas com produtos somente em Ordem de Servico
  strInfo := '';

  buscas.Close;
  buscas.SQL.Text := 'select' +
    ' sum(pp.vltot_ped_item + coalesce(pp.rateio_acresc,0) - coalesce(pp.rateio_desc, 0)  -' +
    ' iif(pv.nf_ac_calctrib in (''S'', ''N''), coalesce(pp.rateio_acresc, 0) - coalesce(pp.acresc_item, 0), 0)) valorvendaliquida,' +    
    ' sum( iif(pv.nf_ac_calctrib in (''S'', ''N''), coalesce(pp.rateio_acresc, 0) - coalesce(pp.acresc_item, 0), 0) ) desp_nf,' +    
    ' sum( pp.quant_ped_item * coalesce(pp.pcust_mc, 0) ) valorcusto,' +
    ' sum( coalesce(pp.comiss_prod, 0) ) comissaoprod,' +
    ' sum( coalesce(pp.comiss_prod_ger, 0) ) comiss_prod_ger,' +
//    ' sum( case when (col.cod_vendedor = '+IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger)+
//    ') then coalesce(pp.comiss_prod, 0) + coalesce(pp.comiss_prod_ger, 0)' +
//    ' else coalesce(pp.comiss_prod_ger, 0) end) comiss_prod_ger,' +
    ' sum(( pp.quant_ped_item * coalesce( pp.vlo_unitario, 0)) + coalesce(pp.rateio_acresc,0) -' +
    ' coalesce(pp.rateio_desc, 0) ) vlo_unitario' +
    ' from pedvenda_prod pp' +
    ' inner join pedvenda pv on pp.nped = pv.nped and pp.tipo = pv.tipo and' +
    ' pp.cod_empresa = pv.cod_empresa';

  if UpperCase(lCalculo[lCont].fTIPO_SERV_PROD) = UpperCase('Servico') then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join colaborador col on col.cod_vendedor = pp.col_cod_vendedor and' +
      ' col.cod_empresa = pv.cod_empresa'
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join colaborador col on col.cod_vendedor = pp.cod_vendedor and' +
      ' col.cod_empresa = pv.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and' +
    ' pv.cod_empresa = :cod_empresa and pv.ativo = 1 and pv.tipo = ''OS'' and coalesce(pp.status,'''') <> ''CANCELADO''' +
    ' and pv.status_ped = ''FECHADA''';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else if (Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Produto') then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor in ' + fCodigoColaborador
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if Trim(lCalculo[lCont].fTipoOS) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pv.tipo_os in ' + Trim(lCalculo[lCont].fTipoOS);

  if Trim(lCalculo[lCont].fCodigosGrupo) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.grupo_prod in ' + Trim(lCalculo[lCont].fCodigosGrupo);

  if Trim(lCalculo[lCont].fCodigosSegmentacao) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.cod_seg_serv in ' + Trim(lCalculo[lCont].fCodigosSegmentacao);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  {if (vDadosIni.vUsarCommissao2 = 'S') and (
    (buscas.FieldByName('vlo_unitario').AsFloat >
    buscas.FieldByName('valorvendaliquida').AsFloat) )then
  begin
    lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos +
      buscas.FieldByName('vlo_unitario').AsFloat;
    lCalculo[lCont].ValorLucroProdutos := lCalculo[lCont].ValorLucroProdutos +
      buscas.FieldByName('vlo_unitario').AsFloat - buscas.FieldByName('valorcusto').AsFloat;
  end
  else}
  begin
    lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos +
      buscas.FieldByName('valorvendaliquida').AsFloat;
    lCalculo[lCont].ValorLucroProdutos := lCalculo[lCont].ValorLucroProdutos +
      buscas.FieldByName('valorvendaliquida').AsFloat - buscas.FieldByName('valorcusto').AsFloat;

    strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Produtos OS', 19),
                                                 buscas.FieldByName('valorvendaliquida').AsFloat, sLineBreak]);
    strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Custo Produtos OS', 19),
                                                 buscas.FieldByName('valorcusto').AsFloat, sLineBreak]);
    if buscas.FieldByName('desp_nf').AsFloat > 0 then    
      strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Despenas NF OS', 19),
                                                   buscas.FieldByName('desp_nf').AsFloat, sLineBreak]);
  end;

  lCalculo[lCont].ValorComissaoProduto := lCalculo[lCont].ValorComissaoProduto +
    buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat;
    
  strInfo := strInfo +  Format('%s: %11.2n %s', [PadR('Comissão ' + IfThen(fGerente, 'gerente', 'produto') , 19),
                                                buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat, 
                                                sLineBreak]);
  
  if strInfo <> '' then
    lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak + strInfo;

  buscas.Close;
end;

procedure TCalculoComissao._somaVendasProdutosOsEntrega;
begin

  buscas.Close;
  buscas.SQL.Text := 'select' +
    ' sum(pp.vltot_ped_item + coalesce(pp.rateio_acresc,0) -' +
    ' coalesce(pp.rateio_desc, 0) ) valorvendaliquida,' +
    ' sum( pp.quant_ped_item * coalesce(pp.pcust_mc, 0) ) valorcusto,' +
    ' sum( coalesce(pp.comiss_prod, 0) ) comissaoprod,' +
    ' sum( coalesce(pp.comiss_prod_ger, 0) ) comiss_prod_ger,' +
//    ' sum( case when (col.cod_vendedor = '+IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger)+
//    ') then coalesce(pp.comiss_prod, 0) + coalesce(pp.comiss_prod_ger, 0)' +
//    ' else coalesce(pp.comiss_prod_ger, 0) end) comiss_prod_ger,' +
    ' sum(( pp.quant_ped_item * coalesce( pp.vlo_unitario, 0)) + coalesce(pp.rateio_acresc,0) -' +
    ' coalesce(pp.rateio_desc, 0) ) vlo_unitario' +
    ' from pedvenda_prod pp' +
    ' inner join pedvenda pv on pp.nped = pv.nped and pp.tipo = pv.tipo and' +
    ' pp.cod_empresa = pv.cod_empresa';

//  if UpperCase(lCalculo[lCont].fTIPO_SERV_PROD) = UpperCase('Servico') then
//    buscas.SQL.Text := buscas.SQL.Text +
//      ' inner join colaborador col on col.cod_vendedor = pp.col_cod_vendedor and' +
//      ' col.cod_empresa = pv.cod_empresa'
//  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join colaborador col on col.cod_vendedor = pv.cod_vendedor and' +
      ' col.cod_empresa = pv.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and' +
    ' pv.cod_empresa = :cod_empresa and pv.ativo = 1 and pv.tipo = ''OS'' and coalesce(pp.status,'''') <> ''CANCELADO''' +
    ' and pv.status_ped = ''FECHADA''';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else if (Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Produto') then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor in ' + fCodigoColaborador
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if Trim(lCalculo[lCont].fTipoREQ) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pv.tipv in ' + Trim(lCalculo[lCont].fTipoREQ);

  if Trim(lCalculo[lCont].fCodigosGrupo) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.grupo_prod in ' + Trim(lCalculo[lCont].fCodigosGrupo);

  if Trim(lCalculo[lCont].fCodigosSegmentacao) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.cod_seg_serv in ' + Trim(lCalculo[lCont].fCodigosSegmentacao);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  {if (vDadosIni.vUsarCommissao2 = 'S') and (
    (buscas.FieldByName('vlo_unitario').AsFloat >
    buscas.FieldByName('valorvendaliquida').AsFloat) )then
  begin
    lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos +
      buscas.FieldByName('vlo_unitario').AsFloat;
    lCalculo[lCont].ValorLucroProdutos := lCalculo[lCont].ValorLucroProdutos +
      buscas.FieldByName('vlo_unitario').AsFloat - buscas.FieldByName('valorcusto').AsFloat;
  end
  else}
  begin
    lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos +
      buscas.FieldByName('valorvendaliquida').AsFloat;
    lCalculo[lCont].ValorLucroProdutos := lCalculo[lCont].ValorLucroProdutos +
      buscas.FieldByName('valorvendaliquida').AsFloat - buscas.FieldByName('valorcusto').AsFloat;
  end;
  if fGerente then
    lCalculo[lCont].ValorComissaoProduto := lCalculo[lCont].ValorComissaoProduto +
      buscas.FieldByName('comiss_prod_ger').AsFloat
  else
    lCalculo[lCont].ValorComissaoProduto := lCalculo[lCont].ValorComissaoProduto +
      buscas.FieldByName('comissaoprod').AsFloat;

  buscas.Close;
end;

procedure TCalculoComissao._somaVendasProdutosReq;
var
  strInfo: string;
begin
  //Soma as vendas com produtos somente de requisicoes
  strInfo := '';

  buscas.Close;
  buscas.SQL.Text := 'select' +
    ' sum(pp.vltot_ped_item + coalesce(pp.rateio_acresc,0) - coalesce(pp.rateio_desc, 0) -' +
    ' iif(pv.nf_ac_calctrib in (''S'', ''N''), coalesce(pp.rateio_acresc, 0) - coalesce(pp.acresc_item, 0), 0)) valorvendaliquida,' +
    ' sum( iif(pv.nf_ac_calctrib in (''S'', ''N''), coalesce(pp.rateio_acresc, 0) - coalesce(pp.acresc_item, 0), 0) ) desp_nf,' +
    ' sum( pp.quant_ped_item * coalesce(pp.pcust_mc, 0) ) valorcusto,' +
    ' sum( coalesce(pp.comiss_prod, 0) ) comissaoprod,' +
    ' sum( coalesce(pp.comiss_prod_ger, 0) ) comiss_prod_ger,' +
//    ' sum( case when (col.cod_vendedor = '+IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger)+
//    ') then coalesce(pp.comiss_prod, 0) + coalesce(pp.comiss_prod_ger, 0)' +
//    ' else coalesce(pp.comiss_prod_ger, 0) end) comiss_prod_ger,' +
    ' sum(( pp.quant_ped_item * coalesce( pp.vlo_unitario, 0)) + coalesce(pp.rateio_acresc,0) -' +
    ' coalesce(pp.rateio_desc, 0) ) vlo_unitario' +
    ' from pedvenda_prod pp' +
    ' inner join pedvenda pv on pp.nped = pv.nped and pp.tipo = pv.tipo and' +
    ' pp.cod_empresa = pv.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = pp.cod_vendedor and' +
    ' col.cod_empresa = pv.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and' +
    ' pv.cod_empresa = :cod_empresa and pv.ativo = 1 and pv.tipo = ''REQ'' and coalesce(pp.status,'''') <> ''CANCELADO''' +
    ' and pv.status_ped = ''FECHADA''';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else if (Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Produto') then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor in ' + fCodigoColaborador
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if Trim(lCalculo[lCont].fTipoREQ) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pv.tipv in ' + Trim(lCalculo[lCont].fTipoREQ);

  if Trim(lCalculo[lCont].fCodigosGrupo) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.grupo_prod in ' + Trim(lCalculo[lCont].fCodigosGrupo);

  if Trim(lCalculo[lCont].fCodigosSegmentacao) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.cod_seg_serv in ' + Trim(lCalculo[lCont].fCodigosSegmentacao);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  {if (vDadosIni.vUsarCommissao2 = 'S') and (
    (buscas.FieldByName('vlo_unitario').AsFloat >
    buscas.FieldByName('valorvendaliquida').AsFloat) )then
  begin
    lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos +
      buscas.FieldByName('vlo_unitario').AsFloat;
    lCalculo[lCont].ValorLucroProdutos := lCalculo[lCont].ValorLucroProdutos +
      buscas.FieldByName('vlo_unitario').AsFloat - buscas.FieldByName('valorcusto').AsFloat;
  end
  else}
  begin
    lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos +
      buscas.FieldByName('valorvendaliquida').AsFloat;
    lCalculo[lCont].ValorLucroProdutos := lCalculo[lCont].ValorLucroProdutos +
      buscas.FieldByName('valorvendaliquida').AsFloat - buscas.FieldByName('valorcusto').AsFloat;

    strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Produtos REQ', 19),
                                                 buscas.FieldByName('valorvendaliquida').AsFloat, sLineBreak]);
    strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Custo Produtos REQ', 19),
                                                 buscas.FieldByName('valorcusto').AsFloat, sLineBreak]);    
    if buscas.FieldByName('desp_nf').AsFloat > 0 then    
      strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Despenas NF REQ', 19),
                                                   buscas.FieldByName('desp_nf').AsFloat, sLineBreak]);
  end;

  lCalculo[lCont].ValorComissaoProduto := lCalculo[lCont].ValorComissaoProduto +
    buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat;

  strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Comissão ' + IfThen(fGerente, 'gerente', 'produto') , 19),
                                               buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat, 
                                               sLineBreak]);

  if strInfo <> '' then
    lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak + strInfo;

  buscas.Close;

end;

procedure TCalculoComissao._somaVendasServicos;
begin
  //Soma os Servicos da OS

  buscas.Close;
  buscas.SQL.Text := 'select' +
    ' sum(ps.valor_tot_serv + coalesce(ps.rateio_acresc,0) - coalesce(ps.rateio_desc, 0) ) valorvendaliquida' +
    ' from pedvenda_serv ps' +
    ' inner join pedvenda pv on ps.nped = pv.nped and ps.tipo = pv.tipo and' +
    ' ps.cod_empresa = pv.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and' +
    ' col.cod_empresa = ps.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and' +
    ' pv.cod_empresa = :cod_empresa and pv.ativo = 1 and pv.tipo = ''OS'' ' +
    ' and coalesce(ps.status,'''') <> ''CANCELADO''' +
    ' and pv.status_ped = ''FECHADA''';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if Trim(lCalculo[lCont].fTipoOS) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pv.tipo_os in ' + Trim(lCalculo[lCont].fTipoOS);

  if Trim(lCalculo[lCont].fCodigosServico) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and ps.cod_servico in ' + Trim(lCalculo[lCont].fCodigosServico);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  lCalculo[lCont].ValorLiquidoMaoDeObra := lCalculo[lCont].ValorLiquidoMaoDeObra +
    buscas.FieldByName('valorvendaliquida').AsFloat;
  lCalculo[lCont].ValorLucroMaoDeObra := lCalculo[lCont].ValorLucroMaoDeObra +
    buscas.FieldByName('valorvendaliquida').AsFloat;

  lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak + 
    Format('%s: %11.2n %s', [PadR('Serviços OS', 19),
                            buscas.FieldByName('valorvendaliquida').AsFloat, sLineBreak]);

  buscas.Close;
end;

procedure TCalculoComissao._somaVendasServicosOsEntrega;
begin
  //Soma os Servicos da OS

  buscas.Close;
  buscas.SQL.Text := 'select' +
    ' sum(ps.valor_tot_serv + coalesce(ps.rateio_acresc,0) - coalesce(ps.rateio_desc, 0) ) valorvendaliquida' +
    ' from pedvenda_serv ps' +
    ' inner join pedvenda pv on ps.nped = pv.nped and ps.tipo = pv.tipo and' +
    ' ps.cod_empresa = pv.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = pv.cod_vendedor and' +
    ' col.cod_empresa = pv.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and' +
    ' pv.cod_empresa = :cod_empresa and pv.ativo = 1 and pv.tipo = ''OS'' ' +
    ' and coalesce(ps.status,'''') <> ''CANCELADO''' +
    ' and pv.status_ped = ''FECHADA''';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if Trim(lCalculo[lCont].fTipoOS) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pv.tipo_os in ' + Trim(lCalculo[lCont].fTipoOS);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  lCalculo[lCont].ValorLiquidoMaoDeObra := lCalculo[lCont].ValorLiquidoMaoDeObra +
    buscas.FieldByName('valorvendaliquida').AsFloat;
  lCalculo[lCont].ValorLucroMaoDeObra := lCalculo[lCont].ValorLucroMaoDeObra +
    buscas.FieldByName('valorvendaliquida').AsFloat;

  buscas.Close;
end;

procedure TCalculoComissao._subtrairDevolucoesDeVendas;
var
  partTipv: string;
  partTipo_os: string;
  sqlTipoVenda: string;
  strInfo: string;
begin
  //Soma as devolucoes de vendas
  strInfo := '';

  buscas.Close;
  buscas.SQL.Text := 'select' +
//    ' sum(pp.vltot_ped_item + coalesce(pp.rateio_acresc,0) + coalesce(pp.acresc_item, 0) -' +
//    ' ( coalesce(pp.rateio_desc, 0) + coalesce(pp.desc_item, 0)) ) valorvendaliquida,' +
//    ' sum( pp.quant_ped_item * coalesce(pp.pcust_mc, 0) ) valorcusto,' +
//    ' sum( coalesce(pp.comiss_prod, 0) ) comissaoprod,' +
//    ' sum( coalesce(pp.comiss_prod_ger, 0) ) comiss_prod_ger,' +
//    ' sum( case when (col.cod_vendedor = '+IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger)+
//    ') then coalesce(pp.comiss_prod, 0) + coalesce(pp.comiss_prod_ger, 0)' +
//    ' else coalesce(pp.comiss_prod_ger, 0) end) comiss_prod_ger,' +
    ' sum(( pp.quant_ped_item * coalesce( pp.vlo_unitario, 0)) + coalesce(pp.rateio_acresc,0) -' +
    ' coalesce(pp.rateio_desc, 0) ) vlo_unitario,' +
    ' sum( coalesce(pp.comiss_prod    , 0) / pp.quant_ped_item * dv.quant ) comissaoprod,' +
    ' sum( coalesce(pp.comiss_prod_ger, 0) / pp.quant_ped_item * dv.quant ) comiss_prod_ger,' +
    ' sum( dv.quant * dv.valor) valordevolucao,' +
    ' sum( dv.quant * coalesce(dv.pcust_mc, 0) ) custodevolucao' +
    ' from pedvenda_prod pp' +
    ' inner join pedvenda pv on pp.nped = pv.nped and pp.tipo = pv.tipo and' +
    ' pp.cod_empresa = pv.cod_empresa' +
    ' inner join devolucao dv on dv.grupo_prod = pp.grupo_prod and' +
    ' dv.cod_prod = pp.cod_prod and dv.cod_empresa = pp.cod_empresa and' +
    ' dv.cod_vendedor = pp.cod_vendedor and dv.cod_venda = pp.nped' +
    ' and dv.tipo_venda = pp.tipo and dv.cod_grade = pp.cod_grade' +
    ' inner join colaborador col on col.cod_vendedor = dv.cod_vendedor and' +
    ' col.cod_empresa = dv.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where dv.data >= :dataIni and dv.data <= :dataFim and' +
    //' dv.cod_empresa = :cod_empresa and dv.ativo = 1 and pv.tipo = ''REQ'' and coalesce(pp.status,'''') <> ''CANCELADO''';
    ' dv.cod_empresa = :cod_empresa and dv.ativo = 1 and pv.status_ped = ''FECHADA'' and coalesce(pp.status,'''') <> ''CANCELADO''';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else if (Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Produto') then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor in ' + fCodigoColaborador
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);
  {
  if Trim(lCalculo[lCont].fTipoREQ) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pv.tipv in ' + Trim(lCalculo[lCont].fTipoREQ);
  }
  if lCalculo[lCont].fTipoREQ <> '' then
    partTipv    := IfThen(lCalculo[lCont].fTipoREQ <> '', Format('((pv.tipo = ''REQ'') and (pv.tipv in %s))', [lCalculo[lCont].fTipoREQ]));

  if lCalculo[lCont].fTipoOS <> '' then
    partTipo_os := IfThen(lCalculo[lCont].fTipoOS  <> '', Format('((pv.tipo = ''OS'') and (pv.tipo_os in %s))', [lCalculo[lCont].fTipoOS]));
    
  if (partTipv <> '') and (partTipo_os <> '') then
    sqlTipoVenda := Format(' and (%s or %s)', [partTipv, partTipo_os])
  else if (partTipv <> '') then
    sqlTipoVenda := Format(' and %s ', [partTipv])
  else if (partTipo_os <> '') then
    sqlTipoVenda := Format(' and %s ', [partTipo_os]);

  buscas.SQL.Text := buscas.SQL.Text + sqlTipoVenda;

  if Trim(lCalculo[lCont].fCodigosGrupo) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.grupo_prod in ' + Trim(lCalculo[lCont].fCodigosGrupo);

  if Trim(lCalculo[lCont].fCodigosSegmentacao) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and pp.cod_seg_serv in ' + Trim(lCalculo[lCont].fCodigosSegmentacao);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  {
  if (vDadosIni.vUsarCommissao2 = 'S') and (
    (buscas.FieldByName('vlo_unitario').AsFloat >
    buscas.FieldByName('valorvendaliquida').AsFloat) )then
  begin
    lCalculo[lCont].fValorBrutoDevolvidoComVenda := lCalculo[lCont].fValorBrutoDevolvidoComVenda +
      buscas.FieldByName('vlo_unitario').AsFloat;
    lCalculo[lCont].fValorLiquidoDevolvidoComVenda := lCalculo[lCont].fValorLiquidoDevolvidoComVenda +
      buscas.FieldByName('vlo_unitario').AsFloat - buscas.FieldByName('valorcusto').AsFloat;
  end
  else
  begin
    lCalculo[lCont].fValorBrutoDevolvidoComVenda := lCalculo[lCont].fValorBrutoDevolvidoComVenda +
      buscas.FieldByName('valorvendaliquida').AsFloat;
    lCalculo[lCont].fValorLiquidoDevolvidoComVenda := lCalculo[lCont].fValorLiquidoDevolvidoComVenda +
      buscas.FieldByName('valorvendaliquida').AsFloat - buscas.FieldByName('valorcusto').AsFloat;
  end;

  lCalculo[lCont].fValorLiquidoProdutos := lCalculo[lCont].fValorLiquidoProdutos -
    lCalculo[lCont].fValorBrutoDevolvidoComVenda;
  lCalculo[lCont].fValorLucroProdutos := lCalculo[lCont].fValorLucroProdutos -
    lCalculo[lCont].fValorLiquidoDevolvidoComVenda;

  if fGerente then
    lCalculo[lCont].fValorComissaoProduto := lCalculo[lCont].fValorComissaoProduto -
      buscas.FieldByName('comiss_prod_ger').AsFloat
  else
    lCalculo[lCont].fValorComissaoProduto := lCalculo[lCont].fValorComissaoProduto -
      buscas.FieldByName('comissaoprod').AsFloat;

  if fGerente then
    lCalculo[lCont].fValorDevolvidoComissaoProduto := lCalculo[lCont].fValorDevolvidoComissaoProduto +
      buscas.FieldByName('comiss_prod_ger').AsFloat
  else
    lCalculo[lCont].fValorDevolvidoComissaoProduto := lCalculo[lCont].fValorDevolvidoComissaoProduto +
      buscas.FieldByName('comissaoprod').AsFloat;

  fSomaValorBrutoDevolvidoComVenda := fSomaValorBrutoDevolvidoComVenda +
    lCalculo[lCont].fValorBrutoDevolvidoComVenda;

  fSomaValorLiquidoDevolvidoComVenda := fSomaValorLiquidoDevolvidoComVenda +
    lCalculo[lCont].fValorLiquidoDevolvidoComVenda;

  fSomaValorDevolvidoComissaoProduto := fSomaValorDevolvidoComissaoProduto +
    lCalculo[lCont].fValorDevolvidoComissaoProduto;
  }
  
  strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Devolução Vendas', 19),  
                                               0 - buscas.FieldByName('valordevolucao').AsFloat, sLineBreak]);
  strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Custo Dev Vendas', 19),
                                               0 - buscas.FieldByName('custodevolucao').AsFloat, sLineBreak]);
  strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Comiss Dev Vendas', 19),
                                               0 - buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat, 
                                               sLineBreak]);

  lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos - buscas.FieldByName('valordevolucao').AsFloat;
  lCalculo[lCont].ValorLucroProdutos   := lCalculo[lCont].ValorLucroProdutos   -
    (buscas.FieldByName('valordevolucao').AsFloat - buscas.FieldByName('custodevolucao').AsFloat);                             
  lCalculo[lCont].ValorComissaoProduto := lCalculo[lCont].ValorComissaoProduto -
    buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat;
    
  SomaVendaDevolucaoComVenda := SomaVendaDevolucaoComVenda + buscas.FieldByName('valordevolucao').AsFloat;
  SomaLucroDevolucaoComVenda := SomaLucroDevolucaoComVenda +
    buscas.FieldByName('valordevolucao').AsFloat - buscas.FieldByName('custodevolucao').AsFloat;
  SomaComissaoProdutoDevolucao := SomaComissaoProdutoDevolucao +
    buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat;

  if strInfo <> '' then
    lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak + strInfo;

  buscas.Close;

end;

procedure TCalculoComissao._subtrairDevolucoesSemVendas;
var
  strInfo: string;
begin
  //Soma as devolucoes feitas avulsa
  strInfo := '';

  buscas.Close;
  buscas.SQL.Text := 'select' +
    ' sum( dv.quant * dv.valor) valordevolucao,' +
    ' sum( dv.quant * coalesce(dv.pcust_mc, 0) ) custodevolucao,' +
    ' sum( dv.quant ) quantidade,' +
    ' sum(((( dv.quant * valor ) * pr.comissao_prod ) / 100 )) comissaoprod,' +
    ' sum(((( dv.quant * valor ) * pr.comissao_prod_ger ) / 100 )) comiss_prod_ger' +
//    ' sum( case when (col.cod_vendedor = '+IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger)+
//    ') then ((( dv.quant * valor ) * pr.comissao_prod ) / 100 ) + ((( dv.quant * valor ) * pr.comissao_prod_ger ) / 100 )' +
//    ' else ((( dv.quant * valor ) * pr.comissao_prod_ger ) / 100 ) end) comiss_prod_ger' +
    ' from devolucao dv' +
    ' inner join produtos pr on pr.grupo_prod = dv.grupo_prod and' +
    ' pr.cod_prod = dv.cod_prod and pr.cod_empresa = dv.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = dv.cod_vendedor and' +
    ' col.cod_empresa = dv.cod_empresa';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' inner join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' inner join depto dt on dt.cod_depto = fu.cod_depto';

  buscas.SQL.Text := buscas.SQL.Text +
    ' where dv.data >= :dataIni and dv.data <= :dataFim and' +
    ' ((dv.cod_venda is null) or (dv.cod_venda = 0)) and' +
    ' dv.cod_empresa = :cod_empresa and dv.ativo = 1';

  if UpperCase(lCalculo[lCont].fABRANG_PERFIL) = 'PESO' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dt.cod_depto = ' + IntToStr(vColab.dataSet.FieldByName('cod_depto').AsInteger)
  else if (Trim(lCalculo[lCont].fTIPO_PERFIL) = 'Produto') then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor in ' + fCodigoColaborador
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and col.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  if Trim(lCalculo[lCont].fCodigosGrupo) <> '' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and dv.grupo_prod in ' + Trim(lCalculo[lCont].fCodigosGrupo);

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  {
  lCalculo[lCont].fValorBrutoDevolvidoSemVenda := lCalculo[lCont].fValorBrutoDevolvidoSemVenda +
    buscas.FieldByName('valordevolucao').AsFloat;
  lCalculo[lCont].fValorLiquidoDevolvidoSemVenda := lCalculo[lCont].fValorLiquidoDevolvidoSemVenda +
    buscas.FieldByName('valordevolucao').AsFloat - buscas.FieldByName('valorcusto').AsFloat;

  lCalculo[lCont].fValorLiquidoProdutos := lCalculo[lCont].fValorLiquidoProdutos -
    lCalculo[lCont].fValorBrutoDevolvidoSemVenda;
  lCalculo[lCont].fValorLucroProdutos := lCalculo[lCont].fValorLucroProdutos -
    lCalculo[lCont].fValorLiquidoDevolvidoSemVenda;

  if fGerente then
    lCalculo[lCont].fValorComissaoProduto := lCalculo[lCont].fValorComissaoProduto -
      buscas.FieldByName('comiss_prod_ger').AsFloat
  else
    lCalculo[lCont].fValorComissaoProduto := lCalculo[lCont].fValorComissaoProduto -
      buscas.FieldByName('comissaoprod').AsFloat;

  if fGerente then
    lCalculo[lCont].fValorDevolvidoComissaoProduto := lCalculo[lCont].fValorDevolvidoComissaoProduto +
      buscas.FieldByName('comiss_prod_ger').AsFloat
  else
    lCalculo[lCont].fValorDevolvidoComissaoProduto := lCalculo[lCont].fValorDevolvidoComissaoProduto +
      buscas.FieldByName('comissaoprod').AsFloat;

  fSomaValorBrutoDevolvidoSemVenda := fSomaValorBrutoDevolvidoSemVenda +
    lCalculo[lCont].fValorBrutoDevolvidoSemVenda;

  fSomaValorLiquidoDevolvidoSemVenda := fSomaValorLiquidoDevolvidoSemVenda +
    lCalculo[lCont].fValorLiquidoDevolvidoSemVenda;

  fSomaValorDevolvidoComissaoProduto := fSomaValorDevolvidoComissaoProduto +
    lCalculo[lCont].fValorDevolvidoComissaoProduto;
  }  
  
  strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Devolução Sem Vnd', 19),  
                                               0 - buscas.FieldByName('valordevolucao').AsFloat, sLineBreak]);
  strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Custo Dev S/ Vnd', 19),
                                               0 - buscas.FieldByName('custodevolucao').AsFloat, sLineBreak]);
  strInfo := strInfo + Format('%s: %11.2n %s', [PadR('Comiss Dev Vendas', 19),
                                               0 - buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat, 
                                               sLineBreak]);

  lCalculo[lCont].ValorLiquidoProdutos := lCalculo[lCont].ValorLiquidoProdutos - buscas.FieldByName('valordevolucao').AsFloat;
  lCalculo[lCont].ValorLucroProdutos   := lCalculo[lCont].ValorLucroProdutos   -
    (buscas.FieldByName('valordevolucao').AsFloat - buscas.FieldByName('custodevolucao').AsFloat);                             
  lCalculo[lCont].ValorComissaoProduto := lCalculo[lCont].ValorComissaoProduto -
      buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat;
        
  SomaVendaDevolucaoSemVenda := SomaVendaDevolucaoSemVenda + buscas.FieldByName('valordevolucao').AsFloat;
  SomaLucroDevolucaoSemVenda := SomaLucroDevolucaoSemVenda + 
    (buscas.FieldByName('valordevolucao').AsFloat - buscas.FieldByName('custodevolucao').AsFloat);
  SomaComissaoProdutoDevolucao := SomaComissaoProdutoDevolucao + 
    buscas.FieldByName(IfThen(fGerente, 'comiss_prod_ger', 'comissaoprod')).AsFloat;

  if strInfo <> '' then
    lCalculo[lCont].strInfo := lCalculo[lCont].strInfo + sLineBreak + strInfo;

  buscas.Close;

end;

{ TColaboradorCom }

procedure TColaboradorCom.AfterScrollPerfilCom(DataSet: TDataSet);
begin
  vPerfil._selecionaPerfilComissao(DataSet.FieldByName('cod_vendedor').AsInteger);
end;

constructor TColaboradorCom.create;
begin
  dataSet := TClientDataSet(dtmCalculoComissao.cdsColabCom);
  buscas := TIBQuery(dtmCalculoComissao.qrBuscas);
  transacao := TIBTransaction(dtmCalculoComissao.transacao);

  vPerfil := TPerfilCom.create;
  dataSet.AfterScroll := AfterScrollPerfilCom;
end;

destructor TColaboradorCom.Destroy;
begin
  vPerfil.Free;
  vPerfil := nil;

  inherited;
end;

procedure TColaboradorCom._abreColaboradores;
begin
  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('COMISS002', 'ABRIR', '', 'NAOTEM', '', dtmCalculoComissao.qrBuscas, True) then
  begin
    montaSelect('select col.cod_vendedor, col.nome_vendedor, col.cod_funcao,' +
    ' col.perc_peso, dt.cod_depto' +
    ' from colaborador col' +
    ' left join funcoes fu on fu.cod_funcao = col.cod_funcao' +
    ' left join depto dt on dt.cod_depto = fu.cod_depto' +
    ' where col.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and col.cod_vendedor =  ' + IntToStr(vDadosIni.vCodUsuario) +
    ' and col.ativo = 1 order by col.nome_vendedor');
  end
  else
  begin
    montaSelect('select col.cod_vendedor, col.nome_vendedor, col.cod_funcao,' +
      ' col.perc_peso, dt.cod_depto' +
      ' from colaborador col' +
      ' left join funcoes fu on fu.cod_funcao = col.cod_funcao' +
      ' left join depto dt on dt.cod_depto = fu.cod_depto' +
      ' where col.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and col.ativo = 1 order by col.nome_vendedor');
  end;
end;

{ TMetaPerfilCom }

constructor TMetaPerfilCom.create;
begin
  dataSet := TClientDataSet(dtmCalculoComissao.cdsMetasCom);
  buscas := TIBQuery(dtmCalculoComissao.qrBuscas);
  transacao := TIBTransaction(dtmCalculoComissao.transacao);
end;

function TMetaPerfilCom._selecionaMetas(pCodigoPerfil: integer): Boolean;
begin
  Result := montaSelect('select mv.*, pm.codigo_perfil from metas_vendas mv' +
    ' inner join perfil_metas pm on pm.codigo_meta = mv.codigo_meta and' +
    ' pm.cod_empresa = mv.cod_empresa and' +
    ' pm.codigo_perfil = ' + IntToStr(pCodigoPerfil) +
    ' and mv.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and mv.ativo = 1 and pm.ativo = 1');
end;

{ TPerfilCom }

procedure TPerfilCom.AfterScrollMetasCom(DataSet: TDataSet);
begin
  vMetas._selecionaMetas(DataSet.FieldByName('codigo_perfil').AsInteger);
end;

procedure TPerfilCom.conteudoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'CONTEUDO_FLAG' then
    if not Sender.IsNull then
      Text := Copy(Sender.AsString, 1, 10) + '...';
end;

constructor TPerfilCom.create;
begin
  dataSet := TClientDataSet(dtmCalculoComissao.cdsPerfCom);
  buscas := TIBQuery(dtmCalculoComissao.qrBuscas);
  transacao := TIBTransaction(dtmCalculoComissao.transacao);

  vMetas := TMetaPerfilCom.create;
  dataSet.AfterScroll := AfterScrollMetasCom;

  dataSet.FieldByName('TABELAS_PERFIL').OnGetText := tabelasGetText;
  dataSet.FieldByName('CONTEUDO_FLAG').OnGetText := conteudoGetText;
end;

destructor TPerfilCom.Destroy;
begin
  vMetas.Free;
  vMetas := nil;

  inherited;
end;

procedure TPerfilCom.tabelasGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'TABELAS_PERFIL' then
    if not Sender.IsNull then
      Text := Copy(Sender.AsString, 1, 10) + '...';
end;

function TPerfilCom._selecionaPerfilComissao(
  pCodigoColaborador: integer): Boolean;
begin
  Result := montaSelect('select pc.* from perfil_comissao pc' +
    ' inner join perfil_vendedor pv on pv.codigo_perfil = pc.codigo_perfil' +
    ' where pv.cod_vendedor = ' + IntToStr(pCodigoColaborador) +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and pv.ativo = 1 and pc.ativo = 1 order by pc.codigo_perfil');
end;

end.

