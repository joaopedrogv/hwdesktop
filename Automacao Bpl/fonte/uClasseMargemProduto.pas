unit uClasseMargemProduto;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  IBStoredProc, RDPrint, StdCtrls, IBQuery, xhHierCube;

type
  TEmpresaMargP = class;
  TProdutoMargP = class;
  TCodBarraMarg = class;

  TCodBarramarg = class(TDataSet_OOP)
  public
    constructor create;
    function abreCodBarra(codBarra: string): boolean;
  end;

  TEmpresaMargP = class(TDataSet_OOP)

  public
    constructor create;
    function abreEmpresa: boolean;
  end;

  TProdutoMargP = class(TDataSet_OOP)
  private
    vvendageralBI: TIBQuery;
    vfercube: THiercube;
  public
    destructor Destroy; override;
    constructor create;
    function buscaProduto(codBarra: string): boolean; overload;
    function buscaProduto(grupo: integer; codigo: string;vtipoprod: Shortint): boolean; overload;
    function verificarVendaproduto(vnumfab: string;vmes,vano: integer;ValPrecvenda: currency;vtipoprod: Shortint): currency;
    function vendasgeralBI(vmeses: integer): boolean;
    // colocar neste método acima o cálculo para veiculos e serviços...
    function montardatas: boolean;
    function RegistrarMarkupprod(vmarkup: real; vtip: smallint;vcond: string;vpercmarg: real;vpercmargcusto: real): boolean;
//    function verificarDNA(vcoddep: integer): boolean;
  var
    vEmp: TEmpresaMargP;
    vdat1,vdat2: Tdate;
    vBarra: TCodBarraMarg;
    vqtdeProd: real;
    vmarkupgrupo: real;
    vtipovenda: string;
    vultvndatac,vultvndvarejo: string;
    vvalprod,vpreccusto,vpercdesc,vcustgrupo,vprecvendaatac,vprecvendavar: currency;
    vdescprodserv: string;
    vcldemand,vclpreco,vclinvest,vclpop,vclqtde,vclfreq,vclatual: string;
    vcfperc: integer;
  end;

  TMargemProduto = class(TDataSet_OOP)
  private
    semDadosEmpresa: boolean;
    FlucroAntesIRRFJuros: Currency;
    FvalorContribuicaoSocialPerc: Double;
    FcustoMercadoriaVendida: Currency;
    FprecoVendaComDesconto: Currency;
    FDebitoCredito: string;
    FvalorUltimaCompra: Currency;
    FmargemDeContribuicao: Currency;
//    FlucroAntesIRRFJurosPerc: Double;
    Fregime: string;
    FcustoMercadoriaVendidaPerc: Double;
    FAliqPadraoICMS: Double;
    FlucroLiquidoSobreFaturamento: Currency;
    FlucroLiquidoRetidoNaEmpresa: Currency;
    FlucroLiquidoRetidoNaEmpresaPerc: Double;
    FpercDesconto: Double;
    FJurosCompraPrazo: Double;
    FmargemDeContribuicaoPerc: Double;
    FComissaoProdutos: Double;
    FConcessionaria: string;
    FCustoEstoque: Double;
    FprecoVenda: Currency;
    FvalorJurosCompraPrazo: Currency;
    FlucroLiquidoSobreFaturamentoPerc: Double;
    FvalorComissaoProdutos: Currency;
//    FlucroAntesIRRF: Currency;
    FvalorCustoEstoque: Currency;
    FCPMF: Double;
    FcustoAquisicao: Currency;
    FPIS: Double;
    FvalorJurosCompraPrazoPerc: Currency;
    FDespesasFixas: Double;
    FEncargosComissao: Double;
    FOutrosEncargos: Double;
    FvalorSimplesNacional: Currency;
//    FlucroAntesIRRFPerc: Double;
    FvalorCPMF: Currency;
    FvalorCustoEstoquePerc: Double;
    FContribuicaoSocial: Double;
    FCONFINS: Double;
    FvalorPIS: Currency;
    FvalorDespesasFixas: Currency;
    FvalorOutrosEncargos: Currency;
    FvalorEncargosComissao: Currency;
    FdiasDeEstoque: Integer;
    FrecolhimentoICMS: Currency;
    FcustoAquisicaoPerc: Double;
    FAliqIRRF: Double;
    FIRRFValor: Currency;
    FIRRFPerc: Double;
    FAliqCSLL: Double;
    FCSLLValor: Currency;
    FCSLLPerc: Double;
    FAliqIRRFAdicional: Double;
    FIRRFAdicionalValor: Currency;
    FIRRFAdicionalPerc: Double;
    FvalorContribuicaoSocial: Currency;
    FvalorCONFINS: Currency;
    FAliqSimplesNacional: Double;
    FrecolhimentoICMSPerc: Double;
    FMargemLucro: double;
    FPEProduto: double;
    FCustosVariaveis: double;
    FqtdeEsperada: double;
    vVendaPorGrupo: TIBQuery;
    procedure atualizaCamposFormulario;
    procedure itensVendaCalcFields(DataSet: TDataSet);
  public
    constructor create(vAtualizaForm: Boolean = True);
    destructor destroy; override;
    procedure cadMargemProduto;
    procedure cadLucratividade;
    function obterProduto(codigodeBarras: string; atacado: boolean; var vMargemLiquida,
      vPercMargemLiquida: Currency;vtipoprod: Shortint; vAtualizaForm: Boolean = True): boolean;
    procedure efetuarCalculo(vAtualizaForm: boolean = True);
    function obterMargemProduto(precoVendaComDesconto,precoCusto:Currency;
    codigodeBarras: string; atacado: boolean; var vMargemLiquida,vPercMargemLiquida: Currency;vtipoprod: Shortint; vAtualizaForm: boolean = True): boolean;
    procedure atualizaValores;
    function abrirvendaporGrupo(vtipo: string): boolean;
    function fechaVendaporgrup: boolean;
    function montardatas: boolean;
    // Empresa
    property regime: string read Fregime;
    property debitoCredito: string read FDebitoCredito;
    property concessionaria: string read FConcessionaria;
    property outrosEncargos: Double read FOutrosEncargos;
    property aliqPadraoICMS: Double read FAliqPadraoICMS;
    property CONFINS: Double read FCONFINS;
    property PIS: Double read FPIS;
    property ComissaoProdutos: Double read FComissaoProdutos;
    property EncargosComissao: Double read FEncargosComissao;
    property CustoEstoque: Double read FCustoEstoque;
    property DespesasFixas: Double read FDespesasFixas;
    property JurosCompraPrazo: Double read FJurosCompraPrazo;
//    property IRRF: Double read FIRRF;
    property ContribuicaoSocial: Double read FContribuicaoSocial;
    property CPMF: Double read FCPMF;
    property AliqSimplesNacional: Double read FAliqSimplesNacional;
    //Produtos
    property valorUltimaCompra: Currency read FvalorUltimaCompra;
    property custoAquisicao: Currency read FcustoAquisicao;
    property custoAquisicaoPerc: Double read FcustoAquisicaoPerc;
    property recolhimentoICMS: Currency read FrecolhimentoICMS;
    property recolhimentoICMSPerc: Double read FrecolhimentoICMSPerc;
    property precoVenda: Currency read FprecoVenda;
    //Preenchimento do Usuário e ou Calculo do sistema
    property precoVendaComDesconto: Currency read FprecoVendaComDesconto;
    property percDesconto: Double read FpercDesconto write FpercDesconto;
    property diasDeEstoque: Integer read FdiasDeEstoque;
    property valorPIS: Currency read FvalorPIS;
    property valorCONFINS: Currency read FvalorCONFINS;
    property valorComissaoProdutos: Currency read FvalorComissaoProdutos;
    property valorEncargosComissao: Currency read FvalorEncargosComissao;
    property valorCustoEstoque: Currency read FvalorCustoEstoque;
    property valorCustoEstoquePerc: Double read FvalorCustoEstoquePerc;
    property valorOutrosEncargos: Currency read FvalorOutrosEncargos;
    property valorSimplesNacional: Currency read FvalorSimplesNacional;
    property valorCPMF: Currency read FvalorCPMF;
    property custoMercadoriaVendida: Currency read FcustoMercadoriaVendida;
    property custoMercadoriaVendidaPerc: Double read FcustoMercadoriaVendidaPerc;
    property margemDeContribuicao: Currency read FmargemDeContribuicao;
    property margemDeContribuicaoPerc: Double read FmargemDeContribuicaoPerc;
    property valorDespesasFixas: Currency read FvalorDespesasFixas;
//    property lucroAntesIRRFJuros: Currency read FlucroAntesIRRFJuros;
//    property lucroAntesIRRFJurosPerc: Double read FlucroAntesIRRFJurosPerc;
    property valorJurosCompraPrazo: Currency read FvalorJurosCompraPrazo;
    property valorJurosCompraPrazoPerc: Currency read FvalorJurosCompraPrazoPerc;
//    property lucroAntesIRRF: Currency read FlucroAntesIRRF;
//    property lucroAntesIRRFPerc: Double read FlucroAntesIRRFPerc;
//    property valorIRRF: Currency read FvalorIRRF;
//    property valorIRRFPerc: Double read FvalorIRRFPerc;
    property valorContribuicaoSocial: Currency read FvalorContribuicaoSocial;
    property valorContribuicaoSocialPerc: Double read FvalorContribuicaoSocialPerc;
    property lucroLiquidoSobreFaturamento: Currency read FlucroLiquidoSobreFaturamento;
    property lucroLiquidoSobreFaturamentoPerc: Double read FlucroLiquidoSobreFaturamentoPerc;
    property MargemLucro: Double read FMargemLucro;
    property PEProduto: Double read FPEProduto;
    property CustosVariaveis: Double read FCustosVariaveis;
    property QtdeEsperada: Double read FqtdeEsperada;
    property AliqIRRF: Double read FAliqIRRF;
    property AliqIRRFAdicional: Double read FAliqIRRFAdicional;
    property IRRFValor: Currency read FIRRFValor;
    property IRRFPerc: Double read FIRRFPerc;
    property IRRFAdicionalValor: Currency read FIRRFAdicionalValor;
    property IRRFAdicionalPerc: Double read FIRRFAdicionalPerc;
    property CSLLValor: Currency read FCSLLValor;
    property CSLLPerc: Double read FCSLLPerc; 
    property lucroLiquidoRetidoNaEmpresa: Currency read FlucroLiquidoRetidoNaEmpresa;
    property lucroLiquidoRetidoNaEmpresaPerc: Double read FlucroLiquidoRetidoNaEmpresaPerc;
  var
    vProd: TProdutoMargP;
    vdat1,vdat2: Tdate;
    vVenda: TClientDataSet;
    vItensVenda: TClientDataSet;
  end;

implementation

uses
  uDtmMargemProduto, IBDatabase, SysUtils, uMargemProduto, Classes,
  Math, uEditMoeda, uDadosIni, xhConsts, uLucratividade;

{ TEmpresaMargP }

function TEmpresaMargP.abreEmpresa: boolean;
begin
  Result := montaSelect('select * from empresa where cod_empresa = ' + vDadosIni.codEmpresa);
  if dataSet.IsEmpty then
  begin
    Result := false;
    exit;
  end;
  Result := true;
end;

constructor TEmpresaMargP.create;
begin
  dataSet := TClientDataSet(dtmMargemProd.cdsEmpMargProd);
  buscas := TIBQuery(dtmMargemProd.qrBuscas);
  transacao := TIBTransaction(dtmMargemProd.transacaoMargProd);
end;

{ TProdutoMargP }

function TProdutoMargP.buscaProduto(codBarra: string): boolean;
begin
  try
  	if Copy(codBarra, 1, 13) = 'GRUPO|CODIGO|' then
  		montaSelect('select * from produtos where grupo_prod = '
      + vDadosIni.getCampoPipe(codBarra, 3) + ' and cod_prod = '
      + QuotedStr(vDadosIni.getCampoPipe(codBarra, 4))
      + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and (coalesce(consumo, ''N'') <> ''S'')')
    else
    	montaSelect('select * from produtos where num_fab_prod = ' + QuotedStr(codBarra) +
      	' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa + ' and (coalesce(consumo, ''N'') <> ''S'')');
    if dataSet.IsEmpty then
    begin
      if not vBarra.abreCodBarra(codBarra) then
        raise exception.create('Produto não encontrado');
      if not buscaProduto(vBarra.dataSet.FieldByName('grupo_prod').AsInteger,
        vBarra.dataSet.FieldByName('cod_prod').AsString,1) then
        raise exception.create('Produto não encontrado ou é produto para consumo');
    end;
    vprecvendaatac:=dataSet.FieldByName('PREC_PUBLICO').AsCurrency;
    vprecvendavar:=dataSet.FieldByName('PREC_TAB_PROD').AsCurrency;
    vdescprodserv:='GRUPO: '+vDadosIni.StrZero(dataSet.FieldByName('GRUPO_PROD').AsInteger,5)+'/'+dataSet.FieldByName('DESCR_PROD').AsString;
    vcldemand:=dataSet.FieldByName('CLASSE_PROD').AsString;
    vclpreco:=dataSet.FieldByName('CLPRECO').AsString;
    vclinvest:=dataSet.FieldByName('CLINV').AsString;
    vclpop:=dataSet.FieldByName('CLPOP').AsString;
    vclqtde:=dataSet.FieldByName('CLQTV').AsString;
    vclfreq:=dataSet.FieldByName('CLFRV').AsString;
    vclatual:=dataSet.FieldByName('CLATL').AsString;
    vpreccusto:=dataSet.FieldByName('PREC_CUSM_PROD').AsCurrency;
    Result := true;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

function TProdutoMargP.buscaProduto(grupo: integer; codigo: string;vtipoprod: Shortint): boolean;
begin
  if vtipoprod = 1 then
  begin
   montaSelect('select * from produtos ' +
   	 ' where grupo_prod = ' + IntToStr(grupo) +
     ' and cod_prod = ' + QuotedStr(codigo) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa +
     ' and ativo = 1 ' +
     ' and (coalesce(consumo, ''N'') <> ''S'')');
   vprecvendaatac:=dataSet.FieldByName('PREC_PUBLICO').AsCurrency;
   vprecvendavar:=dataSet.FieldByName('PREC_TAB_PROD').AsCurrency;
   vdescprodserv:=dataSet.FieldByName('DESCR_PROD').AsString;
   vcldemand:=dataSet.FieldByName('CLASSE_PROD').AsString;
   vclpreco:=dataSet.FieldByName('CLPRECO').AsString;
   vclinvest:=dataSet.FieldByName('CLINV').AsString;
   vclpop:=dataSet.FieldByName('CLPOP').AsString;
   vclqtde:=dataSet.FieldByName('CLQTV').AsString;
   vclfreq:=dataSet.FieldByName('CLFRV').AsString;
   vclatual:=dataSet.FieldByName('CLATL').AsString;
   vpreccusto:=dataSet.FieldByName('PREC_CUSM_PROD').AsCurrency;
  end;
  if vtipoprod = 2 then
  begin
   montaSelect('select * from grupos ' +
   	' where codigo_grup = ' + IntToStr(grupo));
   vdescprodserv:=dataSet.FieldByName('DESCRICAO').AsString;
  end;
  if vtipoprod = 3 then
  begin
   montaSelect('select * from sub_grupo ' +
   	' where codigo_subgr = ' + IntToStr(grupo));
   vdescprodserv:=dataSet.FieldByName('DESCRICAO').AsString;
  end;
  if vtipoprod = 4 then
  begin
  // herbert correção depois
   montaSelect('select tipo_servico.* from tipo_servico ' +
   	' inner join tipo_servico_empresa on tipo_servico_empresa.cod_servico = tipo_servico.cod_servico and tipo_servico_empresa.cod_empresa = ' + vDadosIni.codEmpresa + 
    ' where tipo_servico.cod_servico = ' + IntToStr(grupo) +
    ' and tipo_servico.ativo = 1');
     vprecvendaatac:=0;
   vprecvendavar:=dataSet.FieldByName('VALOR_SERVICO').AsCurrency;
   vprecvendaatac:=0;
   vdescprodserv:=dataSet.FieldByName('DESC_SERVICO').AsString;
   vcldemand:=dataSet.FieldByName('CLASSE_SERV').AsString;
   vclpreco:='';
   vclinvest:='';
   vclpop:=dataSet.FieldByName('CLASSE_POP').AsString;
   vclqtde:=dataSet.FieldByName('CLASSE_QTD').AsString;
   vclfreq:='';
   vclatual:=dataSet.FieldByName('CLASSE_ATL').AsString;
     //and cod_empresa = ' + vDadosIni.codEmpresa);
  end;
  Result := not dataSet.IsEmpty
end;

constructor TProdutoMargP.create;
begin
  dataSet := TClientDataSet(dtmMargemProd.cdsProd);
  buscas := TIBQuery(dtmMargemProd.qrBuscas);
  transacao := TIBTransaction(dtmMargemProd.transacaoMargProd);
  vvendageralBI:=TIBQuery(dtmMargemProd.Ibvendageralprodutos);
  vfercube:=THierCube(dtmMargemProd.HieranalVenda);
  vpercdesc:=0;
  vEmp := TEmpresaMargP.create;
  vBarra := TCodBarraMarg.create;
  vqtdeProd:=0;
  vcfperc:=0;
end;

destructor TProdutoMargP.Destroy;
begin
  FreeAndNil(vEmp);
  FreeAndNil(vBarra);
  inherited;
end;


function TProdutoMargP.montardatas: boolean;
begin
 vdat1:=StrToDate('01/'+inttostr(vmesap)+'/'+IntToStr(vanoap));
 vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesap)+'/'+
 IntToStr(vanoap))))+'/'+inttostr(vmesap)+'/'+IntToStr(vanoap));
end;

function TProdutoMargP.RegistrarMarkupprod(vmarkup: real;
  vtip: smallint;vcond: string;vpercmarg: real;vpercmargcusto: real): boolean;
var
 vmarkdef: real;
 vtrunc: integer;
 vpercmargccusto,vprec,vpercatac: string;
begin
//  vtrunc:=trunc(vmarkup);
  vmarkdef:=(vmarkup-1)*100;
//  vmarkdef:=vmarkdef/100;
  // vtip = 1 grupo, vtip = 2 produto
  IniciaTransacao;
  try
    if vcond = 'A' then
    begin
     vprec:='PERC_TB_PRODA';
     vpercatac:='PERC_TB_ATAC';
     vpercmargccusto:='MARGMINCCUSTOA';
    end
    else
    begin
     vprec:='PERC_TB_PROD';
     vpercatac:='PERC_TB_VARE';
     vpercmargccusto:='MARGMINCCUSTOV';
    end;
    if vtip = 1 then
    begin
      buscas.close;
      buscas.SQL.Text:='update produtos set rep_int_active = 1, '+vprec+'='+
      vDadosIni.trocaVirgulaPorPonto(FloatToStr(vmarkdef))+','+vpercatac+'='+
      vDadosIni.trocaVirgulaPorPonto(FloatToStr(vpercmarg))+','+vpercmargccusto+'='+
      vDadosIni.trocaVirgulaPorPonto(FloatToStr(vpercmargcusto))+
      ' where grupo_prod = '+
      dataSet.FieldByName('GRUPO_PROD').AsString+' and cod_empresa = '+vDadosIni.codEmpresa+
      ' and ativo = 1';
      buscas.Prepare;
      buscas.ExecSQL;
    end
    else
    begin
      if vtip = 2 then
      begin
       buscas.close;
       buscas.SQL.Text:='update produtos set rep_int_active = 1, '+vprec+'='+
       vDadosIni.trocaVirgulaPorPonto(FloatToStr(vmarkdef))+','+vpercatac+'='+
       vDadosIni.trocaVirgulaPorPonto(FloatToStr(vpercmarg))+','+vpercmargccusto+'='+
       vDadosIni.trocaVirgulaPorPonto(FloatToStr(vpercmargcusto))+
       ' where grupo_prod = '+
       dataSet.FieldByName('GRUPO_PROD').AsString+' and cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+
       ''' and cod_empresa = '+vDadosIni.codEmpresa+
       ' and ativo = 1';
       buscas.Prepare;
       buscas.ExecSQL;
      end
      else
      begin
       buscas.close;
       buscas.SQL.Text:='update produtos set rep_int_active = 1, '+vprec+'='+
       vDadosIni.trocaVirgulaPorPonto(FloatToStr(vmarkdef))+','+vpercatac+'='+
       vDadosIni.trocaVirgulaPorPonto(FloatToStr(vpercmarg))+','+vpercmargccusto+'='+
       vDadosIni.trocaVirgulaPorPonto(FloatToStr(vpercmargcusto))+
       ' where sub_g_prod = '+
       dataSet.FieldByName('codigo_subgr').AsString+' and cod_empresa = '+vDadosIni.codEmpresa+
       ' and ativo = 1';
       buscas.Prepare;
       buscas.ExecSQL;
      end;
    end;
    CommitaTransacao
  except
      on e: exception do
      begin
      RollBackTransacao;
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

function TProdutoMargP.vendasgeralBI(vmeses: integer): boolean;
var
  vtppesq,vtppesq1,vtppesq2: string;
begin
  montardatas;
  vdat1:=vdat2-(vmeses*30);
  result:=true;
  vtppesq:='((p.data_fech >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+'''))';
  vtppesq1:='((ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+'''))';
  vtppesq2:='((c.data_em_nf >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and c.data_em_nf <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+'''))';
   vvendageralBI.Close;
   vvendageralBI.SQL.text:=
  'select emp.nome_emp as empresa,gr.descricao as grupo_prod,p.tipo||'' '' as tipo,extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,'+
  'i.descr_prod_ped as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,sum(i.VLTOT_PED_ITEM+I.RATEIO_ACRESC) as bruto,sum(i.RATEIO_DESC) as desconto,sum(i.QUANT_PED_ITEM*i.PCUST_MC) as custo,p.tipv as tipovenda '+
  ' from PEDVENDA_PROD i, PEDVENDA p, GRUPOS GR,SUB_GRUPO sb,produtos pr,EMPRESA emp,colaborador col '+
  'where i.grupo_prod = pr.grupo_prod and i.cod_prod = pr.cod_prod and i.cod_empresa = pr.cod_empresa and pr.sub_g_prod = sb.codigo_subgr and i.grupo_prod = gr.codigo_grup and '+
  ' i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and (i.status is null or i.status = '''')  and i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa and '+vtppesq+
  ' AND '+
  ' p.cod_empresa in ('+vDadosIni.codEmpresa+') and p.cod_empresa = emp.cod_empresa '+
  'and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) or (p.tipo = ''REQ'' and tipv in '+vDadosIni.vTipoVendaREQ+')) '+
  ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo '+
  'union '+
  'select emp.nome_emp as empresa,s.desc_servico||''                    '' as grupo_prod,''OSS '' as tipo,extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,'+
  's.desc_servico as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,sum(i.VALOR_TOT_SERV+i.RATEIO_ACRESC) as bruto,sum(i.RATEIO_DESC) as desconto, 0 as custo,p.tipv as tipovenda '+
  'from PEDVENDA_SERV i, PEDVENDA p, TIPO_SERVICO s,sub_grupo sb, EMPRESA emp,COLABORADOR col '+
  ' where sb.codigo_subgr = 0 and i.cod_servico = s.cod_servico and i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and (i.status is null or i.status = '''') and i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa and '+vtppesq+
  ' AND '+
  'p.cod_empresa in ('+vDadosIni.codEmpresa+') and p.cod_empresa = emp.cod_empresa '+
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ) '+
  ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo '+
  'union '+
  'select emp.nome_emp as empresa,i.descr_servt||''                    '' as grupo_prod,''OST '' as tipo,'+
  'extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,i.descr_servt as descricao_prod,'+
  'col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,SUM(i.VL_SERVT) as bruto,SUM(0) as desconto, SUM(0) as custo,p.tipv as tipovenda '+
  'from PEDVENDA_SERV_TERC i, PEDVENDA p,empresa emp,sub_grupo sb,colaborador col '+
  'where sb.codigo_subgr = 0 and i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa and '+vtppesq+
  ' AND '+
  'p.cod_empresa in ('+vDadosIni.codEmpresa+') and p.cod_empresa = emp.cod_empresa '+
  'and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ) GROUP BY empresa,grupo_prod,tipo,mes,ano, '+
  'descricao_prod,nome_vendedor,tipovenda,sub_grupo '+
  'union '+
  'select emp.nome_emp as empresa,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,''VEI '' as tipo, '+
  'extract(month from ft.data_ven) as mes,extract(year from ft.data_ven) as ano,'+
  'vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,sum(ft.valor_real) as bruto,0 as desconto,'+
  'sum((select first 1 (et.custo) from comprasmesesv4 et where '+
  'et.chassi = vn.chassiv and et.cod_empresa = vn.cod_empresa order by data_ch_nota)) as custo,''V'' as tipovenda '+
  'from com_fat ft,mot_ven vn,sub_grupo sb,'+
  'TIPMODELO vv,colaborador col,empresa emp '+
  'where  sb.codigo_subgr = 0 and ft.tipo_venda_v = ''N'' and  '+vtppesq1+
  'and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and '+
  'ft.chassiv = vn.chassiv and ft.num_nota_v = vn.num_nota_v and ft.n_comando = vn.n_comando and '+
  'vn.versaov = vv.codigo and ft.cod_empresa = vn.cod_empresa and '+
  'ft.cod_empresa in ('+vDadosIni.codEmpresa+') and ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa and '+
  'ft.cod_empresa = emp.cod_empresa and ft.ativo = 1 '+
  'group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo '+
  'union '+
  'select emp.nome_emp as empresa,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,''VEIU'' as tipo,'+
  'extract(month from ft.data_ven) as mes,extract(year from ft.data_ven) as ano,'+
  'vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,sum(ft.valor_real) as bruto,0 as desconto,'+
  'sum(vn.vl_compra_us) as custo,''V'' as tipovenda '+
  'from com_fat ft,mot_ven vn,sub_grupo sb,'+
  'TIPMODELO vv,colaborador col,empresa emp '+
  'WHERE  sb.codigo_subgr = 0 and ft.tipo_venda_v = ''U'' and '+vtppesq1+
  'and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and '+
  'ft.chassiv = vn.chassiv and ft.n_comando = vn.n_comando and '+
  'vn.versaov = vv.codigo and ft.cod_empresa = vn.cod_empresa and '+
  'ft.cod_empresa in ('+vDadosIni.codEmpresa+') and ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa and '+
  'ft.cod_empresa = emp.cod_empresa and ft.ativo = 1 '+
  'group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo '+
  'union '+
  'select emp.nome_emp as empresa,c.descricao||''-''||cast(c.codseq_comissao as char(10))||''         '' as grupo_prod,'+
  'c.tipo_reg as tipo,extract(month from c.data_em_nf) as mes,extract(year from c.data_em_nf) as ano,'+
  'c.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,sum(c.valor) as bruto,0 as desconto,'+
  '0 as custo,''V'' as tipovenda '+
  'from COMISSAO_CONSORCIO c,colaborador col,empresa emp,sub_grupo sb '+
  'WHERE '+vtppesq2+' and sb.codigo_subgr = 0 and c.cod_vendedor = col.cod_vendedor and c.cod_empresa = col.cod_empresa and '+
  'c.cod_empresa in ('+vDadosIni.codEmpresa+') and c.ativo = 1 and c.cod_empresa = emp.cod_empresa '+
  'group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo ';
  vvendageralBI.Open;
//   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  //vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('grupo_prod','Grupo Produto',dgpage);
  vFerCube.DefineFieldAsDimension('tipo','Tipo de Venda',dgRow);
  vFerCube.DefineFieldAsDimension('ANO','Ano Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('MES','Mês do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('descricao_prod','Descrição do Produto',dgPage);
  vFerCube.DefineFieldAsDimension('empresa','Nome Empresa',dgPage);
  vFerCube.DefineFieldAsDimension('nome_vendedor','Nome Vendedor',dgPage);
  vFerCube.DefineFieldAsDimension('tipovenda','Natureza de Venda',dgPage);
  vFerCube.DefineFieldAsDimension('sub_grupo','SubGrupo Produto',dgPage);
  vFerCube.DefineFieldAsSummary('BRUTO');
  vFerCube.DefineFieldAsSummary('desconto');
  vFerCube.DefineFieldAsSummary('custo');
  vfercube.Active:=true;
end;

function TProdutoMargP.verificarVendaproduto(vnumfab: string; vmes,
  vano: integer;ValPrecvenda: currency;vtipoprod: Shortint): currency;
var
 vpercgr,vvaltot,vpercpart: real;
 vgrupo: string;
begin
  montardatas;
  vvalprod:=0;
  vvaltot:=0;
  buscas.Close;
  if vtipoprod = 1 then
  begin
    buscaProduto(trim(vnumfab));
    buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
    'sum(pp.quant_ped_item*pp.pcust_mc) as custos,sum(pp.rateio_desc) as desconto '+
    'from pedvenda p,pedvenda_prod pp where pp.grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
    ' and pp.cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+
    ''' and pp.nped = p.nped and pp.tipo = p.tipo '+
    'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''')  '+
    'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
    ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
    ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
    '(p.tipo = ''REQ'')) '+
    'and p.tipv = '''+copy(vtipovenda,1,1)+''' and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
    'p.cod_empresa = '+vDadosIni.codEmpresa;
    vgrupo:='GRUPO_PROD';
  end;
  if vtipoprod = 2 then
  begin
    buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
    'sum(pp.quant_ped_item*pp.pcust_mc) as custos,sum(pp.rateio_desc) as desconto '+
    'from pedvenda p,pedvenda_prod pp where pp.grupo_prod = '+dataSet.FieldByName('CODIGO_GRUP').AsString+
    ' and pp.nped = p.nped and pp.tipo = p.tipo '+
    'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
    'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
    ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
    ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
    '(p.tipo = ''REQ'')) '+
    'and p.tipv = '''+copy(vtipovenda,1,1)+''' and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
    'p.cod_empresa = '+vDadosIni.codEmpresa;
    vgrupo:='CODIGO_GRUP';
  end;
  if vtipoprod = 3 then
  begin
    buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
    'sum(pp.quant_ped_item*pp.pcust_mc) as custos,sum(pp.rateio_desc) as desconto '+
    'from pedvenda p,pedvenda_prod pp,produtos pr where pp.grupo_prod = pr.grupo_prod and '+
    'pp.cod_prod = pr.cod_prod and pp.cod_empresa = pr.cod_empresa and pr.sub_g_prod = '+
    dataSet.FieldByName('codigo_subgr').AsString+
    ' and pp.nped = p.nped and pp.tipo = p.tipo '+
    'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
    'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
    ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
    ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
    '(p.tipo = ''REQ'')) '+
    'and p.tipv = '''+copy(vtipovenda,1,1)+''' and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
    'p.cod_empresa = '+vDadosIni.codEmpresa;
    vgrupo:='CODIGO_SUBGR';
  end;
  if vtipoprod = 4 then
  begin
    buscas.SQL.text:='select (sum(pp.valor_tot_serv+(pp.prc_int_serv*pp.quant_serv_ped))-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_serv_ped) as qtde,'+
    'sum(pp.quant_serv_ped*0) as custos,sum(pp.rateio_desc) as desconto '+
    'from pedvenda p,pedvenda_serv pp where pp.cod_servico = '+dataSet.FieldByName('COD_SERVICO').AsString+
    ' and pp.nped = p.nped and pp.tipo = p.tipo '+
    'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
    'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
    ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
    ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+')) '+
    'and p.tipv = '''+copy(vtipovenda,1,1)+''' and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
    'p.cod_empresa = '+vDadosIni.codEmpresa;
  end;

//  buscas.SQL.text:='select (sum(vtot_venda)-sum(desconto)) as valorprod,sum(vqt) as qtde '+
//  'from vendasmeses4 where grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
//  ' and cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+''' AND '+
//  'data_os_rq >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' and '+
//  'data_os_rq <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
//  ''' and cod_empresa = '+vDadosIni.codEmpresa;
  buscas.Open;
  vvalprod:=buscas.FieldByName('VALORPROD').AsCurrency;
  vqtdePROD:=buscas.FieldByName('qtde').AsCurrency;
  vcustgrupo:=buscas.FieldByName('custos').AsCurrency;
  vpercdesc:=buscas.FieldByName('desconto').AsCurrency;
  if (vtipoprod = 1) or (vtipoprod = 2) or (vtipoprod = 3) then
  begin
    if vvalprod <> 0 then
    begin
//      buscas.Close;
//      buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(pp.rateio_desc)) as valorprod,sum(pp.quant_ped_item) as qtde,'+
//      'sum(pp.quant_ped_item*pp.pcust_mc) as custos '+
//      'from pedvenda p,pedvenda_prod pp where pp.nped = p.nped and pp.tipo = p.tipo '+
//      'and pp.cod_empresa = p.cod_empresa '+
//      'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
//      ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
//      ''' and ((p.tipo = ''OS'' and p.tipo_os = ''CLIENTE'') or '+
//      '(p.tipo = ''REQ'' and p.tipv <> ''C'' and p.tipv <> ''E'')) '+
//      'and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
//      'p.cod_empresa = '+vDadosIni.codEmpresa;

  //    'select (sum(vtot_venda)-sum(desconto)) as valorprod '+
  //    'from vendasmeses4 where data_os_rq >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' and '+
  //    'data_os_rq <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
  //    ''' and cod_empresa = '+vDadosIni.codEmpresa;
  //    vmes = '+inttostr(vmes)+' and vano = '+IntToStr(vano)+
  //    ' and cod_empresa = '+vDadosIni.codEmpresa;
//      buscas.Open;
      vvaltot:=vfatapura;
      //buscas.FieldByName('VALORPROD').AsCurrency;
      vpercpart:=((vvalprod/vvaltot)*100);
      VCFprod:=(((vpercpart*VCF)/100)/vqtdePROD);
      VCFgeral:=((vpercpart*VCF)/100);
      buscas.Close;
      if vtipoprod = 3 then
       //herbert 12/08/2011
       buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
       'sum(pp.quant_ped_item*pp.pcust_mc) as custos '+
       'from pedvenda p,pedvenda_prod pp,produtos pr where pp.grupo_prod = pr.grupo_prod and pp.cod_prod = '+
       'pr.cod_prod and pp.cod_empresa = pr.cod_empresa and pr.sub_g_prod = '+dataSet.FieldByName(vgrupo).AsString+
       ' and pp.nped = p.nped and pp.tipo = p.tipo '+
       'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
       'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
       ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
       ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
       '(p.tipo = ''REQ'')) '+
       'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+Copy(vtipovenda,1,1)+''' and p.ativo = 1 and '+
       'p.cod_empresa = '+vDadosIni.codEmpresa
      else
       buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
       'sum(pp.quant_ped_item*pp.pcust_mc) as custos '+
       'from pedvenda p,pedvenda_prod pp where pp.grupo_prod = '+dataSet.FieldByName(vgrupo).AsString+
       ' and pp.nped = p.nped and pp.tipo = p.tipo '+
       'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
       'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
       ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
       ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
       '(p.tipo = ''REQ'')) '+
       'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+Copy(vtipovenda,1,1)+''' and p.ativo = 1 and '+
       'p.cod_empresa = '+vDadosIni.codEmpresa;
   //  buscas.SQL.text:='select (sum(vtot_venda)-sum(desconto)) as valorprod,sum(vqt) as qtde '+
  //  'from vendasmeses4 where grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
  //  ' and cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+''' AND '+
  //  'data_os_rq >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' and '+
  //  'data_os_rq <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
  //  ''' and cod_empresa = '+vDadosIni.codEmpresa;
      buscas.Open;
      if buscas.FieldByName('custos').AsFloat <> 0 then
       vmarkupgrupo:=buscas.FieldByName('valorprod').AsFloat/buscas.FieldByName('custos').AsFloat
      else
       vmarkupgrupo:=0;
      if (vtipoprod = 2) or (vtipoprod = 3) then
      begin
       if copy(vtipovenda,1,1) = 'V' then
       begin
        vprecvendavar:=vvalprod+vpercdesc;
        vpercdesc:=(vpercdesc/vprecvendavar)*100;
       end
       else
       begin
        vprecvendaatac:=vvalprod+vpercdesc;
        vpercdesc:=(vpercdesc/vprecvendaatac)*100;
       end;
        VCFprod:=vCFGeral;
      end;
    end
    else
    begin
      buscas.Close;
      if vtipoprod = 3 then
        buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
       'sum(pp.quant_ped_item*pp.pcust_mc) as custos '+
       'from pedvenda p,pedvenda_prod pp,produtos pr where pp.grupo_prod = pr.grupo_prod and pp.cod_prod = pr.cod_prod and '+
       'pp.cod_empresa = pr.cod_empresa and pr.sub_g_prod = '+dataSet.FieldByName(vgrupo).AsString+
       ' and  pp.nped = p.nped and pp.tipo = p.tipo '+
       'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
       'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
       ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
       ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
       '(p.tipo = ''REQ'')) '+
       'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+Copy(vtipovenda,1,1)+''' and p.ativo = 1 and '+
       'p.cod_empresa = '+vDadosIni.codEmpresa
      else
       buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
       'sum(pp.quant_ped_item*pp.pcust_mc) as custos '+
       'from pedvenda p,pedvenda_prod pp where pp.grupo_prod = '+dataSet.FieldByName(vgrupo).AsString+
       ' and  pp.nped = p.nped and pp.tipo = p.tipo '+
       'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
       'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
       ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
       ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
       '(p.tipo = ''REQ'')) '+
       'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+Copy(vtipovenda,1,1)+''' and p.ativo = 1 and '+
       'p.cod_empresa = '+vDadosIni.codEmpresa;
  //    buscas.SQL.text:='select (sum(vtot_venda)-sum(desconto)) as valorprod,sum(customc) as custos '+
  //    'from vendasmeses4 where grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
  //    ' and vmes = '+inttostr(vmes)+' and vano = '+IntToStr(vano)+
  //    ' and cod_empresa = '+vDadosIni.codEmpresa;
      buscas.Open;
      vvalprod:=buscas.FieldByName('VALORPROD').AsCurrency;
      if buscas.FieldByName('custos').AsFloat <> 0 then
       vmarkupgrupo:=buscas.FieldByName('valorprod').AsFloat/buscas.FieldByName('custos').AsFloat
      else
       vmarkupgrupo:=0;
      if vvalprod <> 0 then
      begin
       buscas.Close;
       buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(coalesce(pp.rateio_desc,0))+sum(coalesce(pp.rateio_acresc,0))) as valorprod,sum(pp.quant_ped_item) as qtde,'+
       'sum(pp.quant_ped_item*pp.pcust_mc) as custos '+
       'from pedvenda p,pedvenda_prod pp where pp.nped = p.nped and pp.tipo = p.tipo '+
       'and pp.cod_empresa = p.cod_empresa '+
       'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
       ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
       ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
       '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
       'and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
       'p.cod_empresa = '+vDadosIni.codEmpresa;
  //     buscas.SQL.text:='select (sum(vtot_venda)-sum(desconto)) as valorprod '+
  //     'from vendasmeses4 where vmes = '+inttostr(vmes)+' and vano = '+IntToStr(vano)+
  //     ' and cod_empresa = '+vDadosIni.codEmpresa;
       buscas.Open;
       vvaltot:=buscas.FieldByName('VALORPROD').AsCurrency;
       vpercpart:=((vvalprod/vvaltot)*100);
       vpercgr:=(vpercpart*VCF)/100;
       buscas.close;
       // Retirei o peso pelo estoque no cálculo de custo fixo 04/07/2013
    {   if dataSet.FieldByName('EST_F').AsFloat > 0 then
       begin
         buscas.Close;
         buscas.SQL.text:='select (sum(est_f*prec_cusm_prod)) as valorprod '+
         'from produtos where grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
         ' and cod_empresa = '+vDadosIni.codEmpresa;
         buscas.Open;
         // colocar aqui também o cálculo por qtde
         VCFprod:=(((dataSet.FieldByName('EST_F').AsFloat*
         dataSet.FieldByName('PREC_CUSM_PROD').AsCurrency)/
         buscas.FieldByName('VALORPROD').AsCurrency)*100)*(vpercgr/100);
       end
       else}
        VCFprod:=(VPERCCF*ValPrecvenda)/100;
      end
      else
      begin
       VCFprod:=(VPERCCF*ValPrecvenda)/100;
  //     (vpercpart*VCF)/100;
      end;
    end;
  end
  else
  begin
    if vvalprod <> 0 then
    begin
      vvaltot:=vfatapura;
      //buscas.FieldByName('VALORPROD').AsCurrency;
      vpercpart:=((vvalprod/vvaltot)*100);
      VCFprod:=(((vpercpart*VCF)/100)/vqtdePROD);
      VCFgeral:=((vpercpart*VCF)/100);
      vmarkupgrupo:=0;
    end
    else
      VCFprod:=(VPERCCF*ValPrecvenda)/100;
  end;

end;

{ TCodBarramarg }

function TCodBarramarg.abreCodBarra(codBarra: string): boolean;
begin
  Result := montaSelect('select * from cod_barra where cod_barra = ' + QuotedStr(codBarra) +
    ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

constructor TCodBarramarg.create;
begin
  dataSet := TClientDataSet(dtmMargemProd.cdsBarra);
  buscas := TIBQuery(dtmMargemProd.qrBuscas);
  transacao := TIBTransaction(dtmMargemProd.transacaoMargProd);
end;

{ TMargemProduto }

function TMargemProduto.abrirvendaporGrupo(vtipo: string): boolean;
begin
  if (vtipo = 'PRODUTOS') or (vtipo = 'PRODUTOS - Grupos') then
  begin
    montardatas;
    vVendaPorGrupo.close;
    vVendaPorGrupo.SQL.text:='select gr.codigo_grup as codigo_grupo,gr.descricao as descricao_grupo,CAST((sum(pp.vltot_ped_item)-sum(pp.rateio_desc)) AS decimal(10,2)) as valorprod,CAST(sum(pp.quant_ped_item) AS decimal(10,2)) as qtde,'+
      'CAST(sum(pp.quant_ped_item*pp.pcust_mc) AS decimal(10,2)) as custos,CAST(((sum(pp.vltot_ped_item)-sum(pp.rateio_desc))/sum(pp.quant_ped_item*pp.pcust_mc)) AS decimal(10,4)) as markup '+
      'from pedvenda p,pedvenda_prod pp,grupos gr where pp.grupo_prod = gr.codigo_grup and pp.nped = p.nped and pp.tipo = p.tipo '+
      'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
      'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
      ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
      ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vdadosini.vTipoVendaOS+') or '+
      '(p.tipo = ''REQ'')) '+
      'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+copy(vProd.vtipovenda,1,1)+''' and p.ativo = 1 and '+
      'p.cod_empresa = '+vDadosIni.codEmpresa+' group by codigo_grupo,descricao_grupo';
    vVendaPorGrupo.Open;
  end;
  if vtipo = 'PRODUTOS - SubGrupos' then
  begin
    montardatas;
    vVendaPorGrupo.close;
    vVendaPorGrupo.SQL.text:='select sb.codigo_subgr as codigo_Subgrupo,sb.descricao as descricao_subgrupo,cast((sum(pp.vltot_ped_item)-sum(pp.rateio_desc)) AS decimal(10,2)) as valorprod,cast(sum(pp.quant_ped_item) AS decimal(10,2)) as qtde,'+
      'cast(sum(pp.quant_ped_item*pp.pcust_mc) AS decimal(10,2)) as custos,cast(((sum(pp.vltot_ped_item)-sum(pp.rateio_desc))/sum(pp.quant_ped_item*pp.pcust_mc)) AS decimal(10,4)) as markup '+
      'from pedvenda p,pedvenda_prod pp,sub_grupo sb,produtos pr where '+
      'pp.grupo_prod = pr.grupo_prod and pp.cod_prod = pr.cod_prod and pp.cod_empresa = pr.cod_empresa and pr.sub_g_prod = sb.codigo_subgr and pp.nped = p.nped and pp.tipo = p.tipo '+
      'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
      'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
      ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
      ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
      '(p.tipo = ''REQ'')) '+
      'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+copy(vProd.vtipovenda,1,1)+''' and p.ativo = 1 and '+
      'p.cod_empresa = '+vDadosIni.codEmpresa+' group by codigo_subgrupo,descricao_subgrupo';
    vVendaPorGrupo.Open;
  end;
end;

procedure TMargemProduto.atualizaCamposFormulario;
begin
  if frmMargemProduto <> nil then
  begin
//    frmMargemProduto.edValorIRRF.Valor := FvalorIRRF;
//    frmMargemProduto.edLucroAntesIRRFJuros.Valor := FlucroAntesIRRFJuros;
//    frmMargemProduto.edValorContribuicaoSocialPerc.Valor := FvalorContribuicaoSocialPerc;
//    frmMargemProduto.edCustoMercadoriaVendida.Valor := FcustoMercadoriaVendida;
    frmMargemProduto.edPrecoVendaComDesconto.Valor := FprecoVendaComDesconto;
    frmMargemProduto.edValorUltimaCompra.Valor := FvalorUltimaCompra;
    frmMargemProduto.EdtPeProduto.Valor:=PEProduto;
    frmMargemProduto.EdtCustosVariaveis.valor:=FCustosVariaveis;
    frmMargemProduto.edValorDespesasFixas.Valor:=FDespesasFixas;
//    frmMargemProduto.edMargemContribuicao.Valor := FmargemDeContribuicao;
//    frmMargemProduto.edValorIRRFPerc.Valor := FvalorIRRFPerc;
//    frmMargemProduto.edLucroAntesIRRFJurosPerc.Valor := FlucroAntesIRRFJurosPerc;
//    frmMargemProduto.edCustoMercadoriaVendidaPerc.Valor := FcustoMercadoriaVendidaPerc;
//    frmMargemProduto.edRecolhimentoICMSPerc.Valor := FAliqPadraoICMS;
    frmMargemProduto.edLucroLiquidoSobreFaturamento.Valor := FlucroLiquidoSobreFaturamento;
    frmMargemProduto.edPercentualDesconto.Valor := FpercDesconto;
    frmMargemProduto.edDespesasFixas.Valor:=0;
//    frmMargemProduto.edJurosCompraPrazo.Valor := FJurosCompraPrazo;
//    frmMargemProduto.edMargemContribuicaoPerc.Valor := FmargemDeContribuicaoPerc;
//    frmMargemProduto.edComissaoProduto.Valor := FComissaoProdutos;
//    frmMargemProduto.edCustoEstoque.Valor := FCustoEstoque;
    frmMargemProduto.edPrecoVenda.Valor := FprecoVenda;
//    frmMargemProduto.edValorJurosCompraPrazo.Valor := FvalorJurosCompraPrazo;
    frmMargemProduto.edLucroLiquidoSobreFaturamentoPerc.Valor := FlucroLiquidoSobreFaturamentoPerc;
//    frmMargemProduto.edValorComissaoProduto.Valor := FvalorComissaoProdutos;
//    frmMargemProduto.edLucroAntesIRRF.Valor := FlucroAntesIRRF;
//    frmMargemProduto.edValorCustoEstoque.Valor := FvalorCustoEstoque;
//    frmMargemProduto.edCPMF.Valor := FCPMF;
    frmMargemProduto.edCustoAquisicao.Valor := FcustoAquisicao;
//    frmMargemProduto.edPIS.Valor := FPIS;
//    frmMargemProduto.edValorJurosCompraPrazoPerc.Valor := FvalorJurosCompraPrazoPerc;
//    frmMargemProduto.edEncargosComissao.Valor := FEncargosComissao;
//    frmMargemProduto.edOutrosEncargos.Valor := FOutrosEncargos;
//    frmMargemProduto.edValorSimplesNacional.Valor := FvalorSimplesNacional;
//    frmMargemProduto.edLucroAntesIRRFPerc.Valor := FlucroAntesIRRFPerc;
//    frmMargemProduto.edValorCPMF.Valor := FvalorCPMF;
//    frmMargemProduto.edValorCustoEstoquePerc.Valor := FvalorCustoEstoquePerc;
//    frmMargemProduto.edContribuicaoSocial.Valor := FContribuicaoSocial;
//    frmMargemProduto.edCONFINS.Valor := FCONFINS;
//    frmMargemProduto.edValorPIS.Valor := FvalorPIS;
    frmMargemProduto.edLucroLiqRetidoEmpresa.Valor := FlucroLiquidoRetidoNaEmpresa;
    frmMargemProduto.edLucroLiqRetidoEmpresaPerc.Valor := FlucroLiquidoRetidoNaEmpresaPerc;
    frmMargemProduto.edIRRF.Valor := FIRRFValor;
    frmMargemProduto.edIRRFPerc.Valor := FIRRFPerc;
    frmMargemProduto.edADIRRF.Valor := FIRRFAdicionalValor;
    frmMargemProduto.edADIRRFPerc.Valor := FIRRFAdicionalPerc;
    frmMargemProduto.edCSLL.Valor := FCSLLValor;
    frmMargemProduto.edCSLLPerc.Valor := FCSLLPerc;

    if FCustosVariaveis <> 0 then
    begin
     frmMargemProduto.edValorDespesasFixas.Valor := FvalorDespesasFixas;
     frmMargemProduto.edDespesasFixas.Valor :=(FvalorDespesasFixas/FprecoVendaComDesconto)*100;
     frmMargemProduto.EdtCustosVariaveis.Valor:=FCustosVariaveis;
     frmMargemProduto.EdPercVariavel.valor:=vProd.VOCV;
     frmMargemProduto.edtQtdeVenda.Valor:=FqtdeEsperada;
    end;
//    (FCustosVariaveis/FprecoVendaComDesconto)*100
//    frmMargemProduto.edValorOutrosEncargos.Valor := FvalorOutrosEncargos;
//    frmMargemProduto.edValorEncargosComissao.Valor := FvalorEncargosComissao;
    frmMargemProduto.edDiasDeEstoque.Valor := FdiasDeEstoque;
//    frmMargemProduto.edRecolhimentoICMS.Valor := FrecolhimentoICMS;
    frmMargemProduto.edCustoAquisicaoPerc.Valor := FcustoAquisicaoPerc;
    frmMargemProduto.EdtCustosTotais.Valor:=0;
    frmMargemProduto.EdtCustosTotais.Valor:=
    frmMargemProduto.EdtCustosTotais.Valor+frmMargemProduto.edCustoAquisicao.Valor+
    frmMargemProduto.edValorDespesasFixas.Valor+frmMargemProduto.EdtCustosVariaveis.Valor;
    if vProd.vqtdeProd <> 0 then
    begin
     frmMargemProduto.EdtQtdeVendida.valor:=vProd.vqtdeProd;
     frmMargemProduto.EdtValorCFProduto.Valor:=vProd.VCFgeral;
    end
    else
    begin
     frmMargemProduto.EdtQtdeVendida.valor:=0;
     frmMargemProduto.EdtValorCFProduto.Valor:=0;
    end;
    IF FprecoVendaComDesconto <> 0 then
     frmMargemProduto.EdtPercCustosTotais.Valor:=
     ((frmMargemProduto.EdtCustosTotais.Valor/FprecoVendaComDesconto)*100);
     frmMargemProduto.EdValorVendaSug.Valor:=
     ((frmMargemProduto.edValorDespesasFixas.Valor+frmMargemProduto.edCustoAquisicao.Valor)/(1-
     ((frmMargemProduto.EdtMargemEsp.Valor/100)+
     (frmMargemProduto.EdPercVariavel.valor/100))));
//    frmMargemProduto.edIRRF.Valor := FIRRF;
//    frmMargemProduto.edValorContribuicaoSocial.Valor := FvalorContribuicaoSocial;
//    frmMargemProduto.edValorCONFINS.Valor := FvalorCONFINS;
//    frmMargemProduto.edAliqSimplesNacional.Valor := FAliqSimplesNacional;
//    frmMargemProduto.edRecolhimentoICMSPerc.Valor := FrecolhimentoICMSPerc;
     if FcustoAquisicao <> 0 then
       frmMargemProduto.edtMarkup.valor:=FprecoVendaComDesconto/FcustoAquisicao;
     frmMargemProduto.edtmarkupGrupo.valor:=vProd.vmarkupgrupo;
  end;
end;

procedure TMargemProduto.atualizaValores;
begin
  if frmMargemProduto <> nil then
  begin
//    FvalorIRRF := frmMargemProduto.edValorIRRF.Valor;
//    FlucroAntesIRRFJuros := frmMargemProduto.edLucroAntesIRRFJuros.Valor;
//    FvalorContribuicaoSocialPerc := frmMargemProduto.edValorContribuicaoSocialPerc.Valor;
//    FcustoMercadoriaVendida := frmMargemProduto.edCustoMercadoriaVendida.Valor;
    FprecoVendaComDesconto := frmMargemProduto.edPrecoVendaComDesconto.Valor;
    FvalorUltimaCompra := frmMargemProduto.edValorUltimaCompra.Valor;
//    FmargemDeContribuicao := frmMargemProduto.edMargemContribuicao.Valor;
//    FvalorIRRFPerc := frmMargemProduto.edValorIRRFPerc.Valor;
//    FlucroAntesIRRFJurosPerc := frmMargemProduto.edLucroAntesIRRFJurosPerc.Valor;
//    FcustoMercadoriaVendidaPerc := frmMargemProduto.edCustoMercadoriaVendidaPerc.Valor;
//    FAliqPadraoICMS := frmMargemProduto.edRecolhimentoICMSPerc.Valor;
    FlucroLiquidoSobreFaturamento := frmMargemProduto.edLucroLiquidoSobreFaturamento.Valor;
    FpercDesconto := frmMargemProduto.edPercentualDesconto.Valor;
//    FJurosCompraPrazo := frmMargemProduto.edJurosCompraPrazo.Valor;
//    FmargemDeContribuicaoPerc := frmMargemProduto.edMargemContribuicaoPerc.Valor;
//    FComissaoProdutos := frmMargemProduto.edComissaoProduto.Valor;
//    FCustoEstoque := frmMargemProduto.edCustoEstoque.Valor;
    FprecoVenda := frmMargemProduto.edPrecoVenda.Valor;
//    FvalorJurosCompraPrazo := frmMargemProduto.edValorJurosCompraPrazo.Valor;
    FlucroLiquidoSobreFaturamentoPerc := frmMargemProduto.edLucroLiquidoSobreFaturamentoPerc.Valor;
//    FvalorComissaoProdutos := frmMargemProduto.edValorComissaoProduto.Valor;
//    FlucroAntesIRRF := frmMargemProduto.edLucroAntesIRRF.Valor;
//    FvalorCustoEstoque := frmMargemProduto.edValorCustoEstoque.Valor;
//    FCPMF := frmMargemProduto.edCPMF.Valor;
    FcustoAquisicao := frmMargemProduto.edCustoAquisicao.Valor;
//    FPIS := frmMargemProduto.edPIS.Valor;
//    FvalorJurosCompraPrazoPerc := frmMargemProduto.edValorJurosCompraPrazoPerc.Valor;
    FDespesasFixas := frmMargemProduto.edValorDespesasFixas.Valor;
    FvalorDespesasFixas := FDespesasFixas;
    FCustosVariaveis:=frmMargemProduto.EdtCustosVariaveis.Valor;
    if frmMargemProduto.EdPercVariavel.Valor <> 0 then
     vProd.VOCV:=frmMargemProduto.EdPercVariavel.Valor;
//    FEncargosComissao := frmMargemProduto.edEncargosComissao.Valor;
//    FOutrosEncargos := frmMargemProduto.edOutrosEncargos.Valor;
//    FvalorSimplesNacional := frmMargemProduto.edValorSimplesNacional.Valor;
//    FlucroAntesIRRFPerc := frmMargemProduto.edLucroAntesIRRFPerc.Valor;
//    FvalorCPMF := frmMargemProduto.edValorCPMF.Valor;
//    FvalorCustoEstoquePerc := frmMargemProduto.edValorCustoEstoquePerc.Valor;
//    FContribuicaoSocial := frmMargemProduto.edContribuicaoSocial.Valor;
//    FCONFINS := frmMargemProduto.edCONFINS.Valor;
//    FvalorPIS := frmMargemProduto.edValorPIS.Valor;
//    FvalorDespesasFixas := frmMargemProduto.edValorDespesasFixas.Valor;
//    FvalorOutrosEncargos := frmMargemProduto.edValorOutrosEncargos.Valor;
//    FvalorEncargosComissao := frmMargemProduto.edValorEncargosComissao.Valor;
    FdiasDeEstoque := trunc(frmMargemProduto.edDiasDeEstoque.Valor);
//    FrecolhimentoICMS := frmMargemProduto.edRecolhimentoICMS.Valor;
    FcustoAquisicaoPerc := frmMargemProduto.edCustoAquisicaoPerc.Valor;
    FMargemLucro:=frmMargemProduto.EdtMargemEsp.Valor;
//    FIRRF := frmMargemProduto.edIRRF.Valor;
//    FvalorContribuicaoSocial := frmMargemProduto.edValorContribuicaoSocial.Valor;
//    FvalorCONFINS := frmMargemProduto.edValorCONFINS.Valor;
//    FAliqSimplesNacional := frmMargemProduto.edAliqSimplesNacional.Valor;
//    FrecolhimentoICMSPerc := frmMargemProduto.edRecolhimentoICMSPerc.Valor;
  end;
end;

procedure TMargemProduto.cadLucratividade;
begin
  if frmLucratividade = nil then
    Application.CreateForm(TfrmLucratividade, frmLucratividade);
  frmLucratividade.ShowModal;
end;

procedure TMargemProduto.cadMargemProduto;
begin
  if frmMargemProduto = nil then
    Application.CreateForm(TfrmMargemProduto, frmMargemProduto);
  frmMargemProduto.ShowModal;
end;

constructor TMargemProduto.create(vAtualizaForm: Boolean = True);
begin
  if dtmMargemProd = nil then
    dtmMargemProd := TdtmMargemProd.Create(dtmMargemProd);
  vProd := TProdutoMargP.create;
  vVendaPorGrupo:=TIBQuery(dtmMargemProd.ibgrupos);
  semDadosEmpresa := not vProd.vEmp.abreEmpresa;
  vVenda := TClientDataSet(dtmMargemProd.cdsVenda);
  vItensVenda := TClientDataSet(dtmMargemProd.cdsItensVenda);
  if not vVenda.Active then
  	vVenda.CreateDataSet;
  if not vItensVenda.Active then
  	vItensVenda.CreateDataSet;
  vItensVenda.OnCalcFields := itensVendaCalcFields;

  TFloatField(vItensVenda.FieldByName('VLUN_PED_ITEM')).DisplayFormat := '##0.' +
    vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais);
  TFloatField(vItensVenda.FieldByName('VLUN_PED_ITEM_CONV')).DisplayFormat := '##0.' +
    vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais);

  TFloatField(vItensVenda.FieldByName('VLTOT_PED_ITEM')).DisplayFormat := '##0.00';
  TFloatField(vItensVenda.FieldByName('QUANT_PED_ITEM')).DisplayFormat := '##0.0000';
  TFloatField(vItensVenda.FieldByName('QUANT_PED_ITEM_CONV')).DisplayFormat := '##0.0000';


  buscas := TIBQuery(dtmMargemProd.qrBuscas);
//  FpercDesconto:=0;
  try
//    FvalorIRRF := 0;
//    FlucroAntesIRRFJuros := 0;
    FvalorContribuicaoSocialPerc := 0;
    FcustoMercadoriaVendida := 0;
    FprecoVendaComDesconto := 0;
    FvalorUltimaCompra := 0;
    FmargemDeContribuicao := 0;
//    FvalorIRRFPerc := 0;
//    FlucroAntesIRRFJurosPerc := 0;
    FcustoMercadoriaVendidaPerc := 0;
    FAliqPadraoICMS := 0;
    FlucroLiquidoSobreFaturamento := 0;
    FpercDesconto := 0;
    FJurosCompraPrazo := 0;
    FmargemDeContribuicaoPerc := 0;
    FComissaoProdutos := 0;
    FCustoEstoque := 0;
    FprecoVenda := 0;
    FvalorJurosCompraPrazo := 0;
    FlucroLiquidoSobreFaturamentoPerc := 0;
    FvalorComissaoProdutos := 0;
//    FlucroAntesIRRF := 0;
    FvalorCustoEstoque := 0;
    FCPMF := 0;
    FcustoAquisicao := 0;
    FPIS := 0;
    FvalorJurosCompraPrazoPerc := 0;
    FDespesasFixas := 0;
    FEncargosComissao := 0;
    FOutrosEncargos := 0;
    FvalorSimplesNacional := 0;
//    FlucroAntesIRRFPerc := 0;
    FvalorCPMF := 0;
    FvalorCustoEstoquePerc := 0;
    FContribuicaoSocial := 0;
    FCONFINS := 0;
    FvalorPIS := 0;
    FvalorDespesasFixas := 0;
    FvalorOutrosEncargos := 0;
    FvalorEncargosComissao := 0;
    FdiasDeEstoque := 0;
    FrecolhimentoICMS := 0;
    FcustoAquisicaoPerc := 0;
//    FIRRF := 0;
    FvalorContribuicaoSocial := 0;
    FvalorCONFINS := 0;
    FAliqSimplesNacional := 0;
    FrecolhimentoICMSPerc := 0;
    FMargemLucro:=0;
    FPEProduto:=0;
    FCustosVariaveis:=0;
    FqtdeEsperada:=0;

    
    FlucroLiquidoRetidoNaEmpresa := 0;
    FlucroLiquidoRetidoNaEmpresaPerc := 0;
    FIRRFValor := 0;
    FIRRFPerc := 0;
    FIRRFAdicionalValor := 0;
    FIRRFAdicionalPerc := 0;

    FRegime := vProd.vEmp.dataSet.FieldByName('regime').AsString;
    FDebitoCredito := vProd.vEmp.dataSet.FieldByName('deb_cred').AsString;
    FConcessionaria := vProd.vEmp.dataSet.FieldByName('concess').AsString;
    FOutrosEncargos := vProd.vEmp.dataSet.FieldByName('out_enc_emp').AsFloat;
    FAliqPadraoICMS := vProd.vEmp.dataSet.FieldByName('aliqpadrao').AsFloat;
    FCONFINS := vProd.vEmp.dataSet.FieldByName('cofins_emp').AsFloat;
    FPIS := vProd.vEmp.dataSet.FieldByName('pis_emp').AsFloat;
    FComissaoProdutos := vProd.vEmp.dataSet.FieldByName('comiss_prod_emp').AsFloat;
    FEncargosComissao := vProd.vEmp.dataSet.FieldByName('enc_sobr_com').AsFloat;
    FCustoEstoque := vProd.vEmp.dataSet.FieldByName('custo_est_emp').AsFloat;
    FDespesasFixas := vProd.vEmp.dataSet.FieldByName('desp_fixas').AsFloat;
    FJurosCompraPrazo := vProd.vEmp.dataSet.FieldByName('jr_cmp_emp').AsFloat;
    FAliqIRRF := vProd.vEmp.dataSet.FieldByName('imp_renda').AsFloat;
    FAliqIRRFAdicional := vProd.vEmp.dataSet.FieldByName('imp_renda_adicional').AsFloat;
    FContribuicaoSocial := vProd.vEmp.dataSet.FieldByName('contr_s_emp').AsFloat;
    FAliqCSLL := FContribuicaoSocial;
    FCPMF := vProd.vEmp.dataSet.FieldByName('cpmf_emp').AsFloat;
    FAliqSimplesNacional := vProd.vEmp.dataSet.FieldByName('simples_emp').AsFloat;
    if vAtualizaForm then
    	atualizaCamposFormulario;
  except
    semDadosEmpresa := true;
  end;
end;

destructor TMargemProduto.destroy;
begin
  FreeAndNil(vProd);
  inherited;
end;

procedure TMargemProduto.efetuarCalculo(vAtualizaForm: boolean = True);
begin

  FcustoAquisicaoPerc := (FcustoAquisicao / FprecoVendaComDesconto) * 100;
  FcustoAquisicaoPerc := StrToFloat(Trim(Format('%10.2f',[FcustoAquisicaoPerc])));

{  FrecolhimentoICMS := (FprecoVendaComDesconto * FrecolhimentoICMSPerc) / 100;
  FrecolhimentoICMS := StrToFloat(Trim(Format('%10.2f',[FrecolhimentoICMS])));

  FvalorPIS := (FprecoVendaComDesconto * FPIS) / 100;
  FvalorPIS := StrToFloat(Trim(Format('%10.2f',[FvalorPIS])));

  FvalorCONFINS := (FprecoVendaComDesconto * FCONFINS) / 100;
  FvalorCONFINS := StrToFloat(Trim(Format('%10.2f',[FvalorCONFINS])));

  FvalorComissaoProdutos := (FprecoVendaComDesconto * FComissaoProdutos) / 100;
  FvalorComissaoProdutos := StrToFloat(Trim(Format('%10.2f',[FvalorComissaoProdutos])));

  FvalorEncargosComissao := (FprecoVendaComDesconto * FEncargosComissao) / 100;
  FvalorEncargosComissao := StrToFloat(Trim(Format('%10.2f',[FvalorEncargosComissao])));

   FvalorCustoEstoque := FcustoAquisicao *
    (Power(1 + (FCustoEstoque / 100), FdiasDeEstoque / 30) - 1);
  FvalorCustoEstoque := StrToFloat(Trim(Format('%10.2f',[FvalorCustoEstoque])));

  FvalorCustoEstoquePerc := (FvalorCustoEstoque / FprecoVendaComDesconto) * 100;
  FvalorCustoEstoquePerc := StrToFloat(Trim(Format('%10.2f',[FvalorCustoEstoquePerc])));

  FvalorOutrosEncargos := (FprecoVendaComDesconto * FOutrosEncargos) / 100;
  FvalorOutrosEncargos := StrToFloat(Trim(Format('%10.2f',[FvalorOutrosEncargos])));

  FvalorSimplesNacional := (FprecoVendaComDesconto * FAliqSimplesNacional) / 100;
  FvalorSimplesNacional := StrToFloat(Trim(Format('%10.2f',[FvalorSimplesNacional])));

  FvalorCPMF := (FprecoVendaComDesconto * FCPMF) / 100;
  FvalorCPMF := StrToFloat(Trim(Format('%10.2f',[FvalorCPMF])));

  FcustoMercadoriaVendida := FcustoAquisicao + FrecolhimentoICMS + FvalorCONFINS + FvalorPIS +
    FvalorComissaoProdutos + FvalorEncargosComissao + FvalorCustoEstoque + FvalorOutrosEncargos +
    FvalorSimplesNacional + FvalorCPMF;
  FcustoMercadoriaVendida := StrToFloat(Trim(Format('%10.2f',[FcustoMercadoriaVendida])));

  FcustoMercadoriaVendidaPerc := (FcustoMercadoriaVendida / FprecoVendaComDesconto) * 100;
  FcustoMercadoriaVendidaPerc := StrToFloat(Trim(Format('%10.2f',[FcustoMercadoriaVendidaPerc])));

  FmargemDeContribuicao := FprecoVendaComDesconto - FcustoMercadoriaVendida;
  FmargemDeContribuicao := StrToFloat(Trim(Format('%10.2f',[FmargemDeContribuicao])));

  FmargemDeContribuicaoPerc := (FmargemDeContribuicao / FprecoVendaComDesconto) * 100;
  FmargemDeContribuicaoPerc := StrToFloat(Trim(Format('%10.2f',[FmargemDeContribuicaoPerc])));

  FvalorDespesasFixas := (FprecoVendaComDesconto * FDespesasFixas) / 100;
  FvalorDespesasFixas := StrToFloat(Trim(Format('%10.2f',[FvalorDespesasFixas])));

  FlucroAntesIRRFJuros := FmargemDeContribuicao - FvalorDespesasFixas;
  FlucroAntesIRRFJuros := StrToFloat(Trim(Format('%10.2f',[FlucroAntesIRRFJuros])));

  FlucroAntesIRRFJurosPerc := (FlucroAntesIRRFJuros / FprecoVendaComDesconto) * 100;
  FlucroAntesIRRFJurosPerc := StrToFloat(Trim(Format('%10.2f',[FlucroAntesIRRFJurosPerc])));

  vProd.buscas.Close;
  vProd.buscas.SQL.Text :=
    'select rc.data_lanc_nfe,pr.num_fab_prod,it.ipi_item_nfe,it.alicm_item_nfe' +
    ' from nf_entrada rc,item_nf_entrada it,produtos pr' +
    ' where' +
    ' it.grupo_prod = :vgrupo and it.cod_prod = :vcod and it.grupo_prod = pr.grupo_prod and' +
    ' it.cod_prod = pr.cod_prod and it.num_nota_nfe = rc.num_nota_nfe and it.cod_forn_nfe =' +
    ' rc.cod_forn_nfe' +
    ' and rc.cod_empresa = it.cod_empresa' +
    ' and rc.cod_empresa = pr.cod_empresa' +
    ' and rc.cod_empresa = :cod_empresa and RC.ativo=1' +
    ' order by rc.data_lanc_nfe desc';
  vProd.buscas.Params[0].AsInteger := vProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  vProd.buscas.Params[1].AsString := vProd.dataSet.FieldByName('COD_PROD').AsString;
  vProd.buscas.Params[2].AsString := vDadosIni.codEmpresa;
  vProd.buscas.Open;

  FvalorJurosCompraPrazo := (((FvalorUltimaCompra * FJurosCompraPrazo) / 100) *
    (1 + (vProd.buscas.FieldByName('IPI_ITEM_NFE').AsFloat / 100))) /
    (1 - ((vProd.buscas.FieldByName('ALICM_ITEM_NFE').AsFloat / 100) + (FCONFINS / 100) +
    (FPIS / 100)));
  FvalorJurosCompraPrazo := StrToFloat(Trim(Format('%10.2f',[FvalorJurosCompraPrazo])));

  FvalorJurosCompraPrazoPerc := (FvalorJurosCompraPrazo / FprecoVendaComDesconto) * 100;
  FvalorJurosCompraPrazoPerc := StrToFloat(Trim(Format('%10.2f',[FvalorJurosCompraPrazoPerc])));

  FlucroAntesIRRF := lucroAntesIRRFJuros - FvalorJurosCompraPrazo;
  FlucroAntesIRRF := StrToFloat(Trim(Format('%10.2f',[FlucroAntesIRRF])));

  FlucroAntesIRRFPerc := (FlucroAntesIRRF / FprecoVendaComDesconto) * 100;
  FlucroAntesIRRFPerc := StrToFloat(Trim(Format('%10.2f',[FlucroAntesIRRFPerc])));

  if FlucroAntesIRRF > 0 then
  begin
    FvalorIRRF := (FlucroAntesIRRF * FIRRF) / 100;
    FvalorIRRF := StrToFloat(Trim(Format('%10.2f',[FvalorIRRF])));

    FvalorContribuicaoSocial := (FlucroAntesIRRF * FContribuicaoSocial) / 100;
    FvalorContribuicaoSocial := StrToFloat(Trim(Format('%10.2f',[FvalorContribuicaoSocial])));

    FvalorIRRFPerc := (FvalorIRRF / FprecoVendaComDesconto) * 100;
    FvalorIRRFPerc := StrToFloat(Trim(Format('%10.2f',[FvalorIRRFPerc])));

    FvalorContribuicaoSocialPerc := (FvalorContribuicaoSocial / FprecoVendaComDesconto) * 100;
    FvalorContribuicaoSocialPerc := StrToFloat(Trim(Format('%10.2f',[FvalorContribuicaoSocialPerc])));
  end
  else
  begin
    FvalorIRRF := 0;
    FvalorIRRFPerc := 0;
    FvalorContribuicaoSocial := 0;
    FvalorContribuicaoSocialPerc := 0;
    FvalorSimplesNacional := 0;
    FAliqSimplesNacional := 0;
  end;
  FlucroLiquidoSobreFaturamento := lucroAntesIRRF - (FvalorIRRF + FvalorContribuicaoSocial);
  FlucroLiquidoSobreFaturamento := StrToFloat(Trim(Format('%10.2f',[FlucroLiquidoSobreFaturamento])));

  FlucroLiquidoSobreFaturamentoPerc := (FlucroLiquidoSobreFaturamento / FprecoVendaComDesconto)
    * 100;
  FlucroLiquidoSobreFaturamentoPerc := StrToFloat(Trim(Format('%10.2f',[FlucroLiquidoSobreFaturamentoPerc])));
  }
  FCustosVariaveis:=FprecoVendaComDesconto*(vProd.VOCV/100);
  FPEProduto:=((FDespesasFixas+FcustoAquisicao)/(1-(vProd.VOCV/100)));
//  FcustoAquisicao/(1-((FDespesasFixas/FprecoVendaComDesconto)+(vProd.VOCV/100)));
  FvalorDespesasFixas := FDespesasFixas;
  FvalorDespesasFixas := StrToFloat(Trim(Format('%10.2f',[FvalorDespesasFixas])));
  FqtdeEsperada:=vProd.VCFgeral/
  ((FprecoVendaComDesconto-(FcustoAquisicao+(FprecoVendaComDesconto*(vProd.VOCV/100))))-
  ((FprecoVendaComDesconto*FMargemLucro)/100));
  FlucroLiquidoSobreFaturamento :=FprecoVendaComDesconto-(FDespesasFixas)-(FcustoAquisicao+FCustosVariaveis);
  FlucroLiquidoSobreFaturamentoPerc := (FlucroLiquidoSobreFaturamento / FprecoVendaComDesconto)
    * 100;
  FlucroLiquidoSobreFaturamentoPerc := StrToFloat(Trim(Format('%10.2f',[FlucroLiquidoSobreFaturamentoPerc])));

  FIRRFValor := FlucroLiquidoSobreFaturamento * FAliqIRRF / 100;
  FIRRFPerc := (FIRRFValor / FprecoVendaComDesconto) * 100;
  FIRRFAdicionalValor := (FlucroLiquidoSobreFaturamento * vProd.vPercBaseADIRRF / 100) * FAliqIRRFAdicional / 100;
  FIRRFAdicionalPerc := (FIRRFAdicionalValor / FprecoVendaComDesconto) * 100;
  FCSLLValor := FlucroLiquidoSobreFaturamento * FAliqCSLL / 100;
  FCSLLPerc := (FCSLLValor / FprecoVendaComDesconto) * 100;
  FlucroLiquidoRetidoNaEmpresa := FlucroLiquidoSobreFaturamento - FIRRFValor - FIRRFAdicionalValor - FCSLLValor;
  FlucroLiquidoRetidoNaEmpresaPerc := (FlucroLiquidoRetidoNaEmpresa / FprecoVendaComDesconto) * 100;

  if vAtualizaForm then
	  atualizaCamposFormulario;
  {vProd.buscas.Close;
  vProd.buscas.SQL.Text := 'select rc.data_lanc_nfe,pr.num_fab_prod,it.ipi_item_nfe,it.alicm_item_nfe' +
    ' from nf_entrada rc,item_nf_entrada it,produtos pr' +
    ' where' +
    ' it.grupo_prod = :vgrupo and it.cod_prod = :vcod and it.grupo_prod = pr.grupo_prod and' +
    ' it.cod_prod = pr.cod_prod and it.num_nota_nfe = rc.num_nota_nfe and it.cod_forn_nfe =' +
    ' rc.cod_forn_nfe' +
    ' and rc.cod_empresa = it.cod_empresa' +
    ' and rc.cod_empresa = pr.cod_empresa' +
    ' and rc.cod_empresa = :cod_empresa and ativo=1' +
    ' order by rc.data_lanc_nfe desc';
  vProd.buscas.Params[0].AsInteger :=  vProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  vProd.buscas.Params[1].AsString := vProd.dataSet.FieldByName('COD_PROD').AsString;
  vProd.buscas.Params[2].AsString := vDadosIni.codEmpresa;
  vProd.buscas.Open;
  if FDebitoCredito = 'S' then
  begin

  end;}

end;

function TMargemProduto.fechaVendaporgrup: boolean;
begin
 vVendaPorGrupo.Close;
end;

procedure TMargemProduto.itensVendaCalcFields(DataSet: TDataSet);
begin
	vItensVenda.FieldByName('PE_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('PE').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('VLUN_PED_ITEM_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('VLUN_PED_ITEM').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('VLUN_LIQUIDO').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('CMV_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('CMV').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('CF_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('CF').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('CV_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('CV').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('CT_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('CT').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('LUCROLIQ_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('LUCROLIQ').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('IRRF_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('IRRF_ITEM').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('ADIRRF_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('ADIRRF_ITEM').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('CSLL_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('CSLL_ITEM').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

	vItensVenda.FieldByName('LUCRORETIDO_TOTAL').AsFloat :=
  	vItensVenda.FieldByName('LUCRORETIDO_ITEM').AsFloat *
    vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat;

  if vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat > 0 then
    vItensVenda.FieldByName('CMVPERC_TOTAL').AsFloat :=
      vItensVenda.FieldByName('CMV_TOTAL').AsFloat /
      	vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat * 100;

  if vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat > 0 then
    vItensVenda.FieldByName('CFPERC_TOTAL').AsFloat :=
      vItensVenda.FieldByName('CF_TOTAL').AsFloat /
      	vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat * 100;

  if vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat > 0 then
    vItensVenda.FieldByName('CTPERC_TOTAL').AsFloat :=
      vItensVenda.FieldByName('CT_TOTAL').AsFloat /
      	vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat * 100;

  if vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat > 0 then
    vItensVenda.FieldByName('LUCROLIQPERC_TOTAL').AsFloat :=
      vItensVenda.FieldByName('LUCROLIQ_TOTAL').AsFloat /
      	vItensVenda.FieldByName('VLUN_LIQUIDO_TOTAL').AsFloat * 100;
end;

function TMargemProduto.montardatas: boolean;
begin
 vdat1:=StrToDate('01/'+inttostr(vProd.vmesap)+'/'+IntToStr(vProd.vanoap));
 vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vProd.vmesap)+'/'+
 IntToStr(vProd.vanoap))))+'/'+inttostr(vProd.vmesap)+'/'+IntToStr(vProd.vanoap));
end;

function TMargemProduto.obterMargemProduto(precoVendaComDesconto, precoCusto: Currency;
  codigodeBarras: string; atacado: boolean; var vMargemLiquida,
  vPercMargemLiquida: Currency;vtipoprod: Shortint; vAtualizaForm: boolean = True): boolean;
begin
  FpercDesconto :=0;
  FcustoAquisicao := 0;
  FCustosVariaveis := 0;
  FlucroLiquidoSobreFaturamento := 0;
  FPEProduto := 0;
  if (frmMargemProduto = nil) and (vAtualizaForm = True) then
    Application.CreateForm(TfrmMargemProduto, frmMargemProduto);
  if atacado then
    vProd.vtipovenda:='ATACADO'
  else
   vProd.vtipovenda:='VAREJO';
  Result := obterProduto(codigodeBarras,atacado,vMargemLiquida,vMargemLiquida,vtipoprod, vAtualizaForm);
  if not Result then
    exit;
  FprecoVendaComDesconto := precoVendaComDesconto;
  FcustoAquisicao:= precoCusto;
  efetuarCalculo(vAtualizaForm);
  vMargemLiquida := FlucroLiquidoSobreFaturamento;
  vPercMargemLiquida := FlucroLiquidoSobreFaturamentoPerc;
  if vAtualizaForm then
  begin
  	frmMargemProduto.free;
  	frmMargemProduto:=nil;
  end;
end;

function TMargemProduto.obterProduto(codigodeBarras: string; atacado: boolean;
  var vMargemLiquida, vPercMargemLiquida: Currency;vtipoprod: Shortint; vAtualizaForm: Boolean = True): boolean;
begin
  Result := false;
  try
   if vtipoprod = 1 then
   begin
    if not vProd.buscaProduto(codigodeBarras) then
      exit;
    FvalorUltimaCompra := vProd.dataSet.FieldByName('VL_ULT_COMPRA').AsCurrency;
    FcustoAquisicao := vProd.dataSet.FieldByName('PREC_CUSM_PROD').AsCurrency;
    FrecolhimentoICMSPerc := vProd.dataSet.FieldByName('ICM_PROD').AsFloat;
    FComissaoProdutos := vProd.vEmp.dataSet.FieldByName('comiss_prod_emp').AsFloat;
    FdiasDeEstoque:=vProd.dataSet.FieldByName('VALORPME').AsInteger;
    if atacado then
    begin
      FprecoVenda := vProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency;
      FMargemLucro:=vProd.dataSet.FieldByName('PERC_TB_ATAC').AsCurrency;
    end
    else
    begin
      FprecoVenda := vProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency;
      FMargemLucro:= vProd.dataSet.FieldByName('PERC_TB_VARE').AsCurrency;
    end;
    if vAtualizaForm then
    	frmMargemProduto.EdtMargemEsp.Valor:=FMargemLucro;
    if (vProd.dataSet.FieldByName('COMISSAO_PROD').AsFloat > 0) or
      (vProd.dataSet.FieldByName('COMISSAO_PROD_GER').AsFloat > 0) then
    begin
      FComissaoProdutos := 0;
      if (vProd.dataSet.FieldByName('COMISSAO_PROD').AsFloat > 0) then
        FComissaoProdutos := FComissaoProdutos +
          vProd.dataSet.FieldByName('COMISSAO_PROD').AsFloat;
      if (vProd.dataSet.FieldByName('COMISSAO_PROD_GER').AsFloat > 0) then
        FComissaoProdutos := FComissaoProdutos +
          vProd.dataSet.FieldByName('COMISSAO_PROD_GER').AsFloat;
    end;
    if vProd.dataSet.FieldByName('ISENTO_PIS').AsString = 'SIM' then
    begin
      FPIS := 0;
      FCONFINS := 0;
    end;
   end;
   if vtipoprod = 2 then
   begin
    if not vProd.buscaProduto(strtoint(codigodeBarras),'',vtipoprod) then
      exit;
    FvalorUltimaCompra := 0;
    FcustoAquisicao := vProd.vcustgrupo;
    FrecolhimentoICMSPerc := 0;
    FComissaoProdutos := 0;
    FdiasDeEstoque:=vProd.dataSet.FieldByName('VALORPME').AsInteger;
    if atacado then
    begin
      FprecoVenda :=vProd.vprecvendaatac;
      FMargemLucro:=0;
    end
    else
    begin
      FprecoVenda :=vprod.vprecvendavar;
      FMargemLucro:=0;
    end;
    if FMargemLucro <> 0 then
     frmMargemProduto.EdtMargemEsp.Valor:=FMargemLucro;
    FComissaoProdutos := 0;
    FPIS := 0;
    FCONFINS := 0;
   end;
   if vtipoprod = 3 then
   begin
    if not vProd.buscaProduto(strtoint(codigodeBarras),'',vtipoprod) then
      exit;
    FvalorUltimaCompra := 0;
    FcustoAquisicao := vProd.vcustgrupo;
    FrecolhimentoICMSPerc := 0;
    FComissaoProdutos := 0;
    FdiasDeEstoque:=0;
    if atacado then
    begin
      FprecoVenda :=vProd.vprecvendaatac;
      FMargemLucro:=0;
    end
    else
    begin
      FprecoVenda :=vprod.vprecvendavar;
      FMargemLucro:=0;
    end;
    if FMargemLucro <> 0 then
     frmMargemProduto.EdtMargemEsp.Valor:=FMargemLucro;
//    frmMargemProduto.EdtMargemEsp.Valor:=FMargemLucro;
    FComissaoProdutos := 0;
    FPIS := 0;
    FCONFINS := 0;
   end;
   if vtipoprod = 4 then
   begin
     if not vProd.buscaProduto(strtoint(codigodeBarras),'',vtipoprod) then
      exit;
    FvalorUltimaCompra := 0;
    FcustoAquisicao := 0;
    FrecolhimentoICMSPerc := 0;
    FComissaoProdutos :=0;
    FdiasDeEstoque:=0;
    FprecoVenda :=vProd.dataSet.FieldByName('VALOR_SERVICO').AsCurrency;
    FMargemLucro:=0;
    frmMargemProduto.EdtMargemEsp.Valor:=FMargemLucro;
    {if (vProd.dataSet.FieldByName('COMISSAO_PROD').AsFloat > 0) or
      (vProd.dataSet.FieldByName('COMISSAO_PROD_GER').AsFloat > 0) then
    begin
      FComissaoProdutos := 0;
      if (vProd.dataSet.FieldByName('COMISSAO_PROD').AsFloat > 0) then
        FComissaoProdutos := FComissaoProdutos +
          vProd.dataSet.FieldByName('COMISSAO_PROD').AsFloat;
      if (vProd.dataSet.FieldByName('COMISSAO_PROD_GER').AsFloat > 0) then
        FComissaoProdutos := FComissaoProdutos +
          vProd.dataSet.FieldByName('COMISSAO_PROD_GER').AsFloat;
    end;
    if vProd.dataSet.FieldByName('ISENTO_PIS').AsString = 'SIM' then
    begin
      FPIS := 0;
      FCONFINS := 0;
    end;}
   end;
   vProd.verificarVendaproduto(codigodeBarras,vProd.vmesap,vProd.vanoap,FprecoVenda,vtipoprod);
   FprecoVendaComDesconto := FprecoVenda - ( FprecoVenda * FpercDesconto ) / 100;
   FDespesasFixas:=vProd.VCFprod;
   FvalorDespesasFixas := FDespesasFixas;
   if (vtipoprod = 2) or (vtipoprod = 3) then
   begin
     FcustoAquisicao := vProd.vcustgrupo;
     if atacado then
     begin
      FprecoVenda :=vProd.vprecvendaatac;
      FMargemLucro:=0;
     end
     else
     begin
      FprecoVenda :=vprod.vprecvendavar;
      FMargemLucro:=0;
     end;
     FpercDesconto:=vProd.vpercdesc;
     FprecoVendaComDesconto := FprecoVenda - ( FprecoVenda * FpercDesconto ) / 100;
   end;
   atualizaCamposFormulario;
   Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + MB_OK);
    end;
  end;
end;


end.

