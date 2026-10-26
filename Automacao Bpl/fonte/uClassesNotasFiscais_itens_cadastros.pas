unit uClassesNotasFiscais_itens_cadastros;

interface

uses
  uDataSet_OOP,
  DB,
  DBClient,
  uClassesNotasFiscais_consts,
  Classes,
  IBQuery,
  Query_OOP,
  vw_clientes_dest_class,
  config_sistema_class,
  uDadosIni;

type
  TProdNF = class;

  TNatOpDescNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaDescricao(vCfop: integer): boolean; overload;
    function selecionaDescricao(descricao: string): boolean; overload;
    function pesquisaDescricaoNaturezaDeOperacao: string;
  end;

  TNatOpNF = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function selecionaCfop(vCfop: integer): boolean;
    function pesquisaNaturezaDeOperacao: Integer;
//    function existeCFOP: boolean; overload;
//    function existeCFOP(vCfop: Integer): boolean; overload;
  var
    vCfopDesc: TNatOpDescNF;
  end;

  TNatOpItemNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaCfop(vCfop: integer): boolean;
  end;

  TTransportadorNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaTransportador(codigo: integer): boolean;
    procedure cadastrarTransportador;
    function pesquisaTransportador: Integer;
  end;

  TEnderecoDocumentoAdicional = class
  private
    FOwner: TDataSet_OOP;
    Fquery : TIBQuery;
    Flista: TVw_clientes_dest_classList;
    Findice: Integer;
  public
    constructor Create(AOwner: TDataSet_OOP);
    destructor Destroy; override;

    function GetLista: TVw_clientes_dest_classList;
    function Next : TVw_clientes_dest_class;
    function Prior: TVw_clientes_dest_class;

    property lista: TVw_clientes_dest_classList read Flista write Flista;
    property indice: Integer read Findice;
  end;

  TCliForNF = class(TDataSet_OOP)
  private          
    FOwner         : TDataSet_OOP;
    FCodCliente    : Integer;
    FDestSeqID     : Integer;
    FEndDoc        : TEnderecoDocumentoAdicional;
    Ficm_ext_c     : Double;
    Fnatop_ext_c   : Double;
    Fnatop_ext_nc  : Double;
    Ficm_ext_nc    : Double;
    Faliq_intra    : Double;
    Fpfcp          : Double;
    Finscricao     : string;
    Fibge_codigo_uf: Integer;
    Fquery         : TIBQuery;
//  private
//    FOwner: TCliForNF;
  public
    constructor create(AOwner: TDataSet_OOP);
    destructor Destroy; override;

    function selecionaClFor: boolean; overload;
    function selecionaClFor(natureza: string): boolean; overload;
    procedure cadastrarClFor;
    function pesquisaCliente(natureza: string): Integer;
    function clienteFornecedorContrinuinte: boolean;
    function empresaSubstitutoTributario: boolean;

    procedure SetDadosDestinatario(Adados: TVw_clientes_dest_class; Achange_nfe_iddest: Boolean = False);
    procedure SetDadosPelaUF;

    property EndDoc         : TEnderecoDocumentoAdicional read FEndDoc         write FEndDoc;
    property CodCliente     : Integer                     read FCodCliente     write FCodCliente;
    property DestSeqID      : Integer                     read FDestSeqID      write FDestSeqID;
    property icm_ext_c      : Double                      read Ficm_ext_c      write Ficm_ext_c;
    property natop_ext_c    : Double                      read Fnatop_ext_c    write Fnatop_ext_c;
    property natop_ext_nc   : Double                      read Fnatop_ext_nc   write Fnatop_ext_nc;
    property icm_ext_nc     : Double                      read Ficm_ext_nc     write Ficm_ext_nc;
    property pfcp           : Double                      read Fpfcp           write Fpfcp;
    property aliq_intra     : Double                      read Faliq_intra     write Faliq_intra;
    property inscricao      : string                      read Finscricao      write Finscricao;
    property ibge_codigo_uf : Integer                     read Fibge_codigo_uf write Fibge_codigo_uf;
  end;

  TCondPagNF = class(TDataSet_OOP)
  private
    FOwner: TDataSet_OOP;
  public
    constructor create(AOwner: TDataSet_OOP);
    function abreCondPag(entradaSaida: char): boolean; overload;
    function abreCondPag(cod_cond_pag: integer): boolean; overload;
    function existeCondPagPrazo: Boolean;
    procedure cadastrarCondPag;
  end;

  TColabNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreUsuarios: boolean;
  end;

  TServNF = class(TDataSet_OOP)
  public
    constructor create;
    function pesquisaTipoServico: string;
    procedure cadastraTipoServico;
    function buscaTipoServico(valorStr: string): boolean; overload;
    function buscaTipoServico(codigo: integer): boolean; overload;
  end;

  TCodBarraNF = class(TDataSet_OOP)
  private
    FOwner: TProdNF;
    FEansPrefixosInvalidos: string;
    FCodBarraSelecionado: string;
  public
    constructor create(AOwner: TProdNF);
    function selecionaProduto(codigoDeBarras: string): boolean;
    function GetEAN(cod_grade: Integer; prefixInvalidosConf: string): string;

    property EansPrefixosInvalidos: string read FEansPrefixosInvalidos write FEansPrefixosInvalidos;
    property CodBarraSelecionado: string read FCodBarraSelecionado write FCodBarraSelecionado;
  end;

  TCnieeNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreImpressorasCniee: boolean;
  end;

  TNcmEstNF = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TModVeicNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreModelos: boolean; overload;
    function abreModelos(descFabricante: string): boolean; overload;
    function abreModelos(codModelo: integer): boolean; overload;
    function buscarModelo(codModelo: integer): boolean;
  end;

  TMarcasNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreMarcas: boolean;
  end;

  TCombustivelNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreCombustivel: boolean;
  end;

  TCorFabricanteNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreCores: boolean;
  end;

  TProdNF = class(TDataSet_OOP)
  type
    TProdNFSqlJoin = (sjCodBarraGrade); //TProdNFSqlJoin = (sjCodBarraGrade, sqEstDispo);
    TProdNFSqlJoins = set of TProdNFSqlJoin;
  strict private
    function GetSqlCamposProd(joins: TProdNFSqlJoins = []): string;
  private
    FNaturezaNF: string;
    fEmb_Conv_UnidComNF, fConv_UnidProduto: string;
    fEmb_Conv_Qtde_Receb, fEmb_Conv_Embal_Com: Double;
    FinibePesquisaCodBarra: Boolean;
    FConv_QtdeEAN: Double;
  public
    FBuscarApenasCB:Boolean;
    vCamposProd: WideString;
    destructor Destroy; override;
    constructor create;
    function buscaProduto(valorStr: string; AAbrirFormSelProd: Boolean): boolean; overload;
    function buscaProdutoSaida(valorStr: string): boolean; overload;
    function buscaProduto(grupo: integer; codigo: string; TestarAtivo: Boolean = False): boolean; overload;
    function buscaProdutoParaConversao(pCODIGO_EAN, pUcom: string; pNItem: Integer = 0): boolean;
    function GetQueryEstoque(grupo: integer; codigo: string; cod_grade: Integer): TQuery_OOP;
    function pesquisaProduto: string;
    procedure cadastraProduto;
    function getPercentualDeReducaoBaseICMS(pDentroDoEstado, pIsento: boolean; pAliquota: Double): Double;
    procedure setDadosEmbalagemProduto(grupo: integer; codigo: string);

    property NaturezaNF: string read FNaturezaNF write FNaturezaNF;
    property Emb_Conv_UnidComNF: string read fEmb_Conv_UnidComNF write fEmb_Conv_UnidComNF;
    property Emb_Conv_Embal_Com : Double read fEmb_Conv_Embal_Com  write fEmb_Conv_Embal_Com;
    property Emb_Conv_Qtde_Receb: Double read fEmb_Conv_Qtde_Receb write fEmb_Conv_Qtde_Receb;
    property Conv_UnidProduto: string read fConv_UnidProduto write fConv_UnidProduto;
    property Conv_QtdeEAN: Double read FConv_QtdeEAN write FConv_QtdeEAN;
    property inibePesquisaCodBarra: Boolean read FinibePesquisaCodBarra write FinibePesquisaCodBarra default False;
  var
    vCB: TCodBarraNF;
    vConsultaDescricao: Boolean;
    vCodGrade: Integer;
  end;

  TProdutoFornecedor = class(TDataSet_OOP)
  public
    constructor create;
    function buscaProdutos(codigo: string; codForn: integer): boolean; overload;
    function buscaProdutos(codigo: string; cpfcgc: string): boolean; overload;
    function buscaProdutosSaida(codigo: string): boolean;
    function existeProduto(codigo, pCodProd: string; pGrupoProd, codForn: integer): boolean; overload;
    function existeProduto(codigo, pCodProd: string; pGrupoProd: Integer; pCpfCgc: string): boolean; overload;
  var
    vCodGrade: Integer;
  end;

  TNcmNF = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function getFirstCEST(NCM: string): string;
  var
    vNcmE: TNcmEstNF;
  end;

  TEstoqueECFNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaEstoqueECFVenda(pGrupo: integer; pCodigo: string): boolean;
    function selecionaEstoqueECFRetorno(pGrupo: integer; pCodigo: string): boolean;
    function selecionaEstoqueECF(pCOD_SERIE: Integer): boolean;
  end;

  TControlesNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaControlesDeBoletos(pControleVenda: Integer = 0): boolean;
    function selecionaControlesContasAPagar: boolean;
    function controleCobrebem: Boolean;
  end;

  TBoletasNF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaBoletas(numeroNF, serieNF: Integer): boolean; overload;
    function selecionaBoletas(pCOD_NF: Integer): boolean; overload;
  end;        

  TItensFreteModel = class
  private
    Fgrupo: Integer;
    Fcodprod: string;
    Fnitem: Integer;
    Ffrete: Double;
    Funidade: string;
    Fquantidade: Double;
    Fvalor: Double;
    FfreteId: Integer;
    FjaIncluido: Boolean;
  published
    property nitem: Integer read Fnitem write Fnitem;
    property unidade: string read Funidade write Funidade;
    property quantidade: Double read Fquantidade write Fquantidade;
    property valor: Double read Fvalor write Fvalor;
    property frete: Double read Ffrete write Ffrete;
    property grupo: Integer read Fgrupo write Fgrupo;
    property codprod: string read Fcodprod write Fcodprod;
    property freteId: Integer read FfreteId write FfreteId;
    property jaIncluido: Boolean read FjaIncluido write FjaIncluido;
  end;

  TItensFreteModelArray = array of TItensFreteModel;

  TFretePorPesoModel = class
  private
    FclienteId: Integer;
    Fitems: TItensFreteModelArray;
    FnotafiscalId: Integer;
    FfreteEmDespPF: Boolean;
    Fconf: TConfig_sistema_class;
  published
    property notafiscalId: Integer read FnotafiscalId write FnotafiscalId;
    property clienteId: Integer read FclienteId write FclienteId;
    property freteEmDespPF: Boolean read FfreteEmDespPF write FfreteEmDespPF;
    property items: TItensFreteModelArray read Fitems write Fitems;
    property conf: TConfig_sistema_class read Fconf write Fconf;
  end;

implementation   

uses
  SysUtils, StrUtils, IBDatabase, Math, Forms, Windows, Controls,
  uDtmAtivo, uDtmNF, uEscollhaProdutoNF,
  uClassesNotasFiscais, uClassesNotasFiscais_ServTransporte, UClassesClientes, uClassesCadastrosBasicos,
  uClassesProdutos, DFeEnums, FormatoImpressaoDANFeEnumUnit, gs1prefix, hw_doc_utils, UnidadeVenda_Model;

{ TNatOpDescNF }

constructor TNatOpDescNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsNatOpD);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TNatOpDescNF.selecionaDescricao(vCfop: integer): boolean;
begin
  Result := montaSelect('select * from nat_op_descricao where codigo_nop = ' + IntToStr(vCfop));
end;

function TNatOpDescNF.pesquisaDescricaoNaturezaDeOperacao: string;
var
  codigo: string;
begin
  codigo := vDadosIni.pesquisaRapida('NAT_OP_DESCRICAO');
  if Trim(codigo) <> '' then
    Result := codigo
  else
    Result := '';
end;

function TNatOpDescNF.selecionaDescricao(descricao: string): boolean;
begin
  Result := montaSelect('select * from nat_op_descricao where descricao_nop = ' +
    QuotedStr(descricao));
end;

{ TNatOpNF }

constructor TNatOpNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsNatOpNf);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
  vCfopDesc := TNatOpDescNF.create;
end;

destructor TNatOpNF.Destroy;
begin
  vCfopDesc.Free;
  vCfopDesc := nil;
  inherited;
end;

//function TNatOpNF.existeCFOP: boolean;
//begin
//
//end;
//
//function TNatOpNF.existeCFOP(vCfop: Integer): boolean;
//begin
//
//end;

function TNatOpNF.pesquisaNaturezaDeOperacao: Integer;
var
  codigo: string;
begin
  codigo := vDadosIni.pesquisaRapida('NAT_OP');
  try
    Result := StrToInt(Trim(codigo));
  except
    Result := 0;
  end;
end;

function TNatOpNF.selecionaCfop(vCfop: integer): boolean;
begin
  Result := montaSelect('select codigo_nop, descricao_nop, precc, comimp,' +
    ' sem_imposto, calc_custo, case when alt_est = ''N'' then ''N'' else ''S'' end alt_est, tipv_veiculo from nat_op ' +
    ' where codigo_nop = ' +
    IntToStr(vCfop) + ' and ativo = 1');
  vCfopDesc.selecionaDescricao(vCfop);
end;

{ TNatOpItemNF }

constructor TNatOpItemNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsNatOpItNf);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TNatOpItemNF.selecionaCfop(vCfop: integer): boolean;
begin
  Result := montaSelect('select codigo_nop, descricao_nop, precc, comimp,' +
    ' sem_imposto, calc_custo, case when alt_est = ''N'' then ''N'' else ''S'' end alt_est, tipv_veiculo from nat_op where codigo_nop = ' +
    IntToStr(vCfop) + ' and ativo = 1');
end;

{ TTransportadorNF }

procedure TTransportadorNF.cadastrarTransportador;
var
  cadTransp: TTransportador;
begin
  cadTransp.CadTransportador(1);
end;

constructor TTransportadorNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsTranspNf);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TTransportadorNF.pesquisaTransportador: Integer;
var
  codigo: string;
begin
  codigo := vDadosIni.pesquisaRapida('TRANSPORTADOR');
  try
    Result := StrToInt(Trim(codigo));
  except
    Result := 0;
  end;
end;

function TTransportadorNF.selecionaTransportador(codigo: integer): boolean;
begin
  Result := montaSelect('select' +
    ' tr.codigo_tr,' +
    ' tr.nome_tr,' +
    ' tr.cnpj_tr,' +
    ' tr.ie_tr,' +
    ' tr.end_tr,' +
    ' tr.municipio_tr,' +
    ' tr.codigoantt,' +
    ' e.sigla_uf,' +
    ' e.ibge_codigo_uf,' +
    ' e.nome_uf' +
    ' from transportador tr' +
    ' inner join estados e on e.codigo_uf = tr.uf_tr' +
    ' where tr.codigo_tr = ' + IntToStr(codigo) + ' and tr.cod_empresa = ' +
    vDadosIni.codEmpresa + ' and tr.ativo = 1');
  if Length(Trim(dataSet.FieldByName('cnpj_tr').AsString)) = 14 then
    dataSet.FieldByName('cnpj_tr').EditMask := HelperCNPJ.EditMask//'99.999.999/9999-99;0;'
  else if Length(Trim(dataSet.FieldByName('cnpj_tr').AsString)) = 11 then
    dataSet.FieldByName('cnpj_tr').EditMask := '999.999.999-99;0;'
  else
    dataSet.FieldByName('cnpj_tr').EditMask := '';
end;

{ TEnderecoDocumentoAdicional }

constructor TEnderecoDocumentoAdicional.Create(AOwner: TDataSet_OOP);
begin
  FOwner := AOwner;
  Flista := TVw_clientes_dest_classList.Create;

  Fquery             := TIBQuery.Create(Application);
  Fquery.Database    := FOwner.buscas.Database;
  Fquery.Transaction := FOwner.buscas.Transaction;
end;

destructor TEnderecoDocumentoAdicional.Destroy;
begin
  if Assigned(Flista) then
    FreeAndNil(Flista);

  if Assigned(Fquery) then
    FreeAndNil(Fquery);
  inherited;
end;

function TEnderecoDocumentoAdicional.GetLista: TVw_clientes_dest_classList;
begin
  Flista.Clear;
  Findice := -1;
  try
    if FOwner.dataSet.FieldByName('cod_cliente').AsInteger = 0 then
      Exit;
       {
    if FOwner.SqlOpen(
      'select cl.cod_cliente, 0 seqid, ''Cadastro Principal'' tipo, cl.insc_est, cl.nfe_indiedest indiedest,' +
      ' cl.nfe_idestrangeiro idestrangeiro, '''' isuf, cl.insc_municipal im, cl.email,' +
      ' cl.endereco xlgr, cl.num_end_cliente nro, cl.complemento xcpl, cl.bairro xbairro,' +
      ' cid.ibge_cod_cidade cmun, cid.nome_cidade xmun, es.sigla_uf uf, cl.cep,' +
      ' cl.cod_pais cpais, paises.nome_pais xpais, cl.fone_cliente fone, cl.cod_empresa, cl.ativo' +
      ' from clientes cl' +
      ' left join cidades cid on cid.cod_cidade = cl.cod_cidade' +
      ' left join estados es on es.codigo_uf = cl.codigo_uf' +
      ' left join paises on paises.cod_pais = cl.cod_pais' +
      ' where cl.cod_cliente = ' + IntToStr(FOwner.dataSet.FieldByName('cod_cliente').AsInteger) +
      ' and cl.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union' +
      ' select' +
      ' cod_cliente, seqid, tipo, insc_est, indiedest, idestrangeiro, isuf, im,' +
      ' email, xlgr, nro, xcpl, xbairro, cmun, xmun, uf, cep, cpais, xpais, fone, cod_empresa, ativo' +
      ' from clientes_end_doc_add' +
      ' where cod_cliente = ' + IntToStr(FOwner.dataSet.FieldByName('cod_cliente').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1', Fquery).IsEmpty then
      Exit;
      }    
    if FOwner.SqlOpen('select %s from VW_CLIENTES_DEST' +
                      ' where cod_cliente = %d and cod_empresa = %s and ativo = 1',
                      [TVw_clientes_dest_class.GetFieldsSql(), FOwner.f_int('cod_cliente'), vDadosIni.codEmpresa ], Fquery).IsEmpty then
      Exit;

    Fquery.First;
    while not Fquery.Eof do
    begin
      Flista.New.SetValuesFrom(Fquery);

      Fquery.Next;
    end;
    Fquery.Close;
    Findice := 0; 
  finally
    Result := Flista;
  end;
end;

function TEnderecoDocumentoAdicional.Next: TVw_clientes_dest_class;
begin
  if Flista.Count <= 0 then
    Exit;

  if (Findice + 1) = Flista.Count then
  else if (Findice + 1) < Flista.Count then
    Findice := Findice + 1;

  Result := Flista.Items[Findice];
end;

function TEnderecoDocumentoAdicional.Prior: TVw_clientes_dest_class;
begin
  if Flista.Count <= 0 then
    Exit;

  if (Findice) = 0 then
  else if (Findice - 1) >= 0 then
    Findice := Findice - 1;

  Result := Flista.Items[Findice];
end;

{ TCliForNF }

procedure TCliForNF.cadastrarClFor;
var
  cadClFor: TCadClientes;
begin
  cadClFor.CadCliente(1);
end;

function TCliForNF.clienteFornecedorContrinuinte: boolean;
begin
  Result := FOwner.dataSet.FieldByName('NFE_INDIEDEST').AsInteger = 1;
end;

function TCliForNF.empresaSubstitutoTributario: boolean;
begin
  Result := true;
//  (dataSet.FieldByName('inscricao').AsString <> 'ISENTO') and
//    (Trim(dataSet.FieldByName('inscricao').AsString) <> '');
end;

constructor TCliForNF.create(AOwner: TDataSet_OOP);
begin
  FOwner := AOwner;
  dataSet := TClientDataSet(DtmNF.cdsClF);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);

  Fquery             := TIBQuery.Create(Application);
  Fquery.Database    := buscas.Database;
  Fquery.Transaction := buscas.Transaction;

  FEndDoc := TEnderecoDocumentoAdicional.Create(AOwner);
end;

destructor TCliForNF.Destroy;
begin
  if Assigned(FEndDoc) then
    FreeAndNil(FEndDoc);
  if Assigned(Fquery) then
    FreeAndNil(Fquery);
  inherited;
end;

function TCliForNF.pesquisaCliente(natureza: string): Integer;
var
  codigo: string;
begin
  if natureza = 'S' then
    codigo := vDadosIni.pesquisaRapida('CLIENTES',
      ' AND ((CLIENTES.TIPO <> ''F'') OR (CLIENTES.TIPO IS NULL))', 'Pesquisa de Clientes')
  else
    codigo := vDadosIni.pesquisaRapida('CLIENTES',
      ' AND ((CLIENTES.TIPO <> ''C'') OR (CLIENTES.TIPO IS NULL))', 'Pesquisa de Fornecedores');
  try
    Result := StrToInt(Trim(codigo));
  except
    Result := 0;
  end;
end;

function TCliForNF.selecionaClFor(natureza: string): boolean;
var
  tipoNaoEntraSql: string;
begin
  tipoNaoEntraSql := 'C';
  if natureza = 'S' then
    tipoNaoEntraSql := 'F';
  Result := montaSelect('select' +
    ' cl.cod_cliente,' +
    ' cl.nome_cliente,' +
    ' cl.codigo_uf,' +
    ' cl.razao,' +
    ' cl.cpfcgc,' +
    ' cl.insc_est,' +
    ' cl.endereco,' +
    ' cl.num_end_cliente, ' +
    ' cl.complemento,' +
    ' cl.cep,' +
    ' cl.fone_cliente,' +
    ' cl.cod_cond_pag,' +
    ' cl.regime,' +
    ' cl.insc_municipal,' +
    ' cl.finalidadeid,' +
    ' cl.ret_fed,' +
    ' e.sigla_uf,' +
    ' e.nome_uf,' +
    ' e.ibge_codigo_uf,' +
    ' e.aliq_intra,' +
    ' em.im_emp,' +
    ' em.cnae_fiscal,' +
    ' es.inscricao,' +
    ' ci.cod_cidade,' +
    ' ci.nome_cidade,' +
    ' ci.ibge_cod_cidade,' +
    ' cm.natop_ext_c,' +
    ' cm.icm_ext_c,' +
    ' cm.NATOP_EXT_NC,' +
    ' cm.ICM_EXT_NC,' +
    ' cm.NATOP_INT_NC,' +
    ' ba.cod_bairro,' +
    ' ba.nome_bairro,' +
    ' cl.calcular_st_nf_saida,' +
    ' cl.consumidor_final,' +
    ' cl.nfe_idestrangeiro,' +
    ' cl.nfe_indiedest,' +
    ' e.pfcp ' +
    ' from clientes cl inner join estados e on e.codigo_uf = cl.codigo_uf' +
    ' left join cidades ci on ci.cod_cidade = cl.cod_cidade' +
    ' left join bairros ba on ba.cod_bairro = cl.cod_bairro' +
    ' inner join empresa em on em.cod_empresa = cl.cod_empresa' +
    ' left join cfop_mud cm on cm.codigo_uf = em.uf_emp and cm.uf_destino = cl.codigo_uf' +
    ' left join empresa_substituto es on es.cod_empresa = cl.cod_empresa and e.sigla_uf = es.sigla_uf' +
    ' where cl.cod_cliente = ' + IntToStr(FOwner.dataSet.FieldByName('cod_cliente').AsInteger) + ' and cl.cod_empresa = ' +
    vDadosIni.codEmpresa + ' and ((cl.tipo <> ' + QuotedStr(tipoNaoEntraSql) +
    ') or (cl.tipo is null)) and cl.ativo = 1');
  if Length(Trim(dataSet.FieldByName('cpfcgc').AsString)) = 14 then
    dataSet.FieldByName('CPFCGC').EditMask := HelperCNPJ.EditMask//'99.999.999/9999-99;0;'
  else if Length(Trim(dataSet.FieldByName('cpfcgc').AsString)) = 11 then
    dataSet.FieldByName('CPFCGC').EditMask := '999.999.999-99;0;'
  else
    dataSet.FieldByName('CPFCGC').EditMask := '';

  EndDoc.GetLista;

  SetDadosPelaUF;
end;

procedure TCliForNF.SetDadosDestinatario(Adados: TVw_clientes_dest_class;
  Achange_nfe_iddest: Boolean);
var
  Alist: TStrings;
  Astr: string;
  I: Integer;
begin
  if not (FOwner.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if not Assigned(Adados) then
    Exit;

  Astr := '';
  Alist := vDadosIni.StrToTStrings(Adados.email, [',', ';', '|', sLineBreak, ' ']);
  for I := 0 to Alist.Count - 1 do
    if Length(Astr +  IfThen(Astr <> '', ',') + Alist[I]) > 60 then
      Break
    else
      Astr := Astr + IfThen(Astr <> '', ',') + Alist[I];
  Adados.email := Astr;

  FOwner.dataSet.FieldByName('cod_cliente').AsInteger       := Adados.cod_cliente;
  FOwner.dataSet.FieldByName('dest_seqid').AsInteger        := Adados.dest_seqid;
  FOwner.dataSet.FieldByName('nome_cliente').AsString       := dataSet.FieldByName('nome_cliente').AsString;
  FOwner.dataSet.FieldByName('razao').AsString              := dataSet.FieldByName('razao').AsString;
  FOwner.dataSet.FieldByName('cpfcgc').AsString             := dataSet.FieldByName('cpfcgc').AsString;
  FOwner.dataSet.FieldByName('nfe_indiedest').AsInteger     := dataSet.FieldByName('nfe_indiedest').AsInteger;
  FOwner.dataSet.FieldByName('consumidor_final').AsString   := dataSet.FieldByName('consumidor_final').AsString;
  FOwner.dataSet.FieldByName('finalidadeid').AsInteger      := dataSet.FieldByName('finalidadeid').AsInteger;
  FOwner.dataSet.FieldByName('ret_fed').AsInteger           := dataSet.FieldByName('ret_fed').AsInteger;
  FOwner.dataSet.FieldByName('insc_est').AsString           := Adados.insc_est;
  FOwner.dataSet.FieldByName('dest_idestrangeiro').AsString := Adados.idestrangeiro;
  FOwner.dataSet.FieldByName('dest_isuf').AsString          := Adados.isuf;
  FOwner.dataSet.FieldByName('dest_im').AsString            := Adados.im;
  FOwner.dataSet.FieldByName('dest_email').AsString         := Adados.email;
  FOwner.dataSet.FieldByName('dest_xlgr').AsString          := Adados.logradouro;
  FOwner.dataSet.FieldByName('dest_nro').AsString           := Adados.numero;
  FOwner.dataSet.FieldByName('dest_xcpl').AsString          := Adados.complemento;
  FOwner.dataSet.FieldByName('dest_xbairro').AsString       := Adados.bairro;
  FOwner.dataSet.FieldByName('dest_cmun').AsInteger         := Adados.cmun;
  FOwner.dataSet.FieldByName('dest_xmun').AsString          := Adados.cidade;
  FOwner.dataSet.FieldByName('dest_uf').AsString            := Adados.uf;
  FOwner.dataSet.FieldByName('dest_cep').AsString           := Adados.cep;
  FOwner.dataSet.FieldByName('dest_cpais').AsInteger        := IfThen(Adados.cpais > 0, Adados.cpais, 1058);
  FOwner.dataSet.FieldByName('dest_xpais').AsString         := IfThen(Adados.xpais <> '', Adados.xpais, 'BRASIL');
  FOwner.dataSet.FieldByName('dest_fone').AsString          := Adados.telefone;
  FOwner.dataSet.FieldByName('cmunfgibs').AsInteger         := Adados.cmun;

  if FOwner.fequals('tpimp', Ord(fidSimplificadoTipo2)) then
  begin
    FOwner.dataSet.FieldByName('consumidor_final').AsString := 'S';

    if FOwner.fequals('cod_cliente', vDadosIni.vCliente.vCodClientePadrao) then
    begin
      FOwner.dataSet.FieldByName('cpfcgc').Clear();
      FOwner.dataSet.FieldByName('nfe_indiedest').AsInteger     := 9; // nao contribuinte
      FOwner.dataSet.FieldByName('consumidor_final').AsString   := dataSet.FieldByName('consumidor_final').AsString;
      FOwner.dataSet.FieldByName('ret_fed').Clear();
      FOwner.dataSet.FieldByName('insc_est').Clear();
      FOwner.dataSet.FieldByName('dest_idestrangeiro').Clear();
      FOwner.dataSet.FieldByName('dest_isuf').Clear();
      FOwner.dataSet.FieldByName('dest_im').Clear();
      FOwner.dataSet.FieldByName('dest_email').Clear();
      FOwner.dataSet.FieldByName('dest_xlgr').Clear();
      FOwner.dataSet.FieldByName('dest_nro').Clear();
      FOwner.dataSet.FieldByName('dest_xcpl').Clear();
      FOwner.dataSet.FieldByName('dest_xbairro').Clear();
      FOwner.dataSet.FieldByName('dest_cmun').Clear();
      FOwner.dataSet.FieldByName('dest_xmun').Clear();
      FOwner.dataSet.FieldByName('dest_uf').AsString := vDadosIni.vEmp.vSiglaUF;
      FOwner.dataSet.FieldByName('dest_cep').Clear();
      FOwner.dataSet.FieldByName('dest_cpais').AsInteger := 1058;
      FOwner.dataSet.FieldByName('dest_xpais').AsString  := 'BRASIL';
      FOwner.dataSet.FieldByName('dest_fone').Clear();
      FOwner.dataSet.FieldByName('cmunfgibs').AsInteger := vDadosIni.vEmp.vNfe.ibgeCodCidade;
    end;
  end;

  if (FOwner.dataSet.FieldByName('consumidor_final').AsString = 'N') or (FOwner.f_str('nfe_iddest') = '') or (Achange_nfe_iddest) then
    if (vDadosIni.vEmp.vSiglaUF = FOwner.dataSet.FieldByName('dest_uf').AsString) then
      FOwner.dataSet.FieldByName('nfe_iddest').AsInteger := 1
    else
      FOwner.dataSet.FieldByName('nfe_iddest').AsInteger := IfThen(FOwner.dataSet.FieldByName('dest_uf').AsString = 'EX', 3, 2);
  if FOwner.dataSet.FieldByName('nfe_indiedest').AsInteger = 0 then
    FOwner.dataSet.FieldByName('nfe_indiedest').AsInteger :=
      IfThen(vDadosIni.strIn(Trim(FOwner.dataSet.FieldByName('insc_est').AsString), ['', 'ISENTO']), 9, 1);
  SetDadosPelaUF;
end;

procedure TCliForNF.SetDadosPelaUF;
var
  Auf: string;
begin
  SqlOpen('select e.pfcp, e.aliq_intra, e.ibge_codigo_uf, es.inscricao, ' +
          ' cm.icm_ext_c, cm.natop_ext_c, cm.natop_ext_nc, cm.icm_ext_nc' +
          ' from estados e' +
          ' left join empresa em on em.cod_empresa = ' + vDadosIni.codEmpresa +
          ' left join empresa_substituto es on es.cod_empresa = ' + vDadosIni.codEmpresa + ' and e.sigla_uf = es.sigla_uf' +
          ' left join cfop_mud cm on cm.codigo_uf = em.uf_emp and cm.uf_destino = e.codigo_uf' +
          ' where e.sigla_uf = ' + QuotedStr((FOwner as TNFCab).getUFdaOperacao), Fquery);
  Ficm_ext_c      := Fquery.FieldByName('icm_ext_c').AsFloat;
  Fnatop_ext_c    := Fquery.FieldByName('natop_ext_c').AsFloat;
  Ficm_ext_nc     := Fquery.FieldByName('icm_ext_nc').AsFloat;
  Fnatop_ext_nc   := Fquery.FieldByName('natop_ext_nc').AsFloat;
  Fpfcp           := Fquery.FieldByName('pfcp').AsFloat;
  Faliq_intra     := Fquery.FieldByName('aliq_intra').AsFloat;
  Finscricao      := Fquery.FieldByName('inscricao').AsString;
  Fibge_codigo_uf := Fquery.FieldByName('ibge_codigo_uf').AsInteger;
end;

function TCliForNF.selecionaClFor: boolean;
var
  I: Integer;
begin
  Result := montaSelect('select' +
    ' cl.cod_cliente,' +
    ' cl.nome_cliente,' +
    ' cl.codigo_uf,' +
    ' cl.razao,' +
    ' cl.cpfcgc,' +
    ' cl.insc_est,' +
    ' cl.endereco,' +
    ' cl.num_end_cliente, ' +
    ' cl.complemento,' +
    ' cl.cep,' +
    ' cl.fone_cliente,' +
    ' cl.cod_cond_pag,' +
    ' cl.regime,' +
    ' cl.insc_municipal,' +
    ' cl.finalidadeid,' +
    ' cl.ret_fed,' +
    ' e.sigla_uf,' +
    ' e.nome_uf,' +
    ' e.ibge_codigo_uf,' +
    ' e.aliq_intra,' +
    ' em.im_emp,' +
    ' em.cnae_fiscal,' +
    ' es.inscricao,' +
    ' ci.cod_cidade,' +
    ' ci.nome_cidade,' +
    ' ci.ibge_cod_cidade,' +
    ' cm.natop_ext_c,' +
    ' cm.icm_ext_c,' +
    ' cm.NATOP_EXT_NC,' +
    ' cm.ICM_EXT_NC,' +
    ' cm.NATOP_INT_NC,' +
    ' ba.cod_bairro,' +
    ' ba.nome_bairro,' +
    ' cl.calcular_st_nf_saida,' +
    ' cl.consumidor_final,' +
    ' cl.nfe_idestrangeiro,' +
    ' cl.nfe_indiedest,' +
    ' e.pfcp ' +
    ' from clientes cl inner join estados e on e.codigo_uf = cl.codigo_uf' +
    ' left join cidades ci on ci.cod_cidade = cl.cod_cidade' +
    ' left join bairros ba on ba.cod_bairro = cl.cod_bairro' +
    ' inner join empresa em on em.cod_empresa = cl.cod_empresa' +
    ' left join cfop_mud cm on cm.codigo_uf = em.uf_emp and cm.uf_destino = cl.codigo_uf' +
    ' left join empresa_substituto es on es.cod_empresa = cl.cod_empresa and e.sigla_uf = es.sigla_uf' +
    ' where cl.cod_cliente = ' + IntToStr(FOwner.dataSet.FieldByName('cod_cliente').AsInteger) + ' and cl.cod_empresa = ' +
    vDadosIni.codEmpresa + ' and cl.ativo = 1');
  if Length(Trim(dataSet.FieldByName('cpfcgc').AsString)) = 14 then
    dataSet.FieldByName('CPFCGC').EditMask := HelperCNPJ.EditMask//'99.999.999/9999-99;0;'
  else if Length(Trim(dataSet.FieldByName('cpfcgc').AsString)) = 14 then
    dataSet.FieldByName('CPFCGC').EditMask := '999.999.999-99;0;'
  else
    dataSet.FieldByName('CPFCGC').EditMask := '';

  EndDoc.GetLista;

  SetDadosPelaUF;
end;

{ TCondPagNF }

function TCondPagNF.abreCondPag(entradaSaida: char): boolean;
var
  temp: char;
begin
  temp := 'C';
  if entradaSaida = 'E' then
    temp := 'V';
  Result := montaSelect(' select COND_PAG.COD_COND_PAG, COND_PAG.DESC_COND_PAG, COND_PAG.MAX_DESC, COND_PAG.SEQPRECO ' +
                        ' from COND_PAG ' +
                        ' INNER JOIN COND_PAG_EMPRESA ON ' +
                        ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
                        '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                        ' where COND_PAG.NATUREZA_CP <> %s ' +
                        ' and COND_PAG.ATIVO = 1 ' +
                        ' and COND_PAG.COD_COND_PAG <> %d ' +
                        ' union' +
                        ' select COND_PAG.COD_COND_PAG, COND_PAG.DESC_COND_PAG, COND_PAG.MAX_DESC, COND_PAG.SEQPRECO ' +
                        ' from COND_PAG ' +
                        ' INNER JOIN COND_PAG_EMPRESA ON ' +
                        ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
                        '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                        ' where COND_PAG.NATUREZA_CP <> %s ' +
                        ' and COND_PAG.COD_COND_PAG = %d ',
                        [QuotedStr(temp), FOwner.fint('cod_cond_pag'), QuotedStr(temp), FOwner.fint('cod_cond_pag')]);
end;

function TCondPagNF.abreCondPag(cod_cond_pag: integer): boolean;
begin
  Result := montaSelect(' select' +
    ' COND_PAG.COD_COND_PAG,' +
    ' COND_PAG.DESC_COND_PAG,' +
    ' COND_PAG.MAX_DESC,' +
    ' COND_PAG.SEQPRECO' +
    ' from COND_PAG ' +
    ' INNER JOIN COND_PAG_EMPRESA ON ' +
    ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
    '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' where COND_PAG.COD_COND_PAG = ' + IntToStr(cod_cond_pag));
end;

procedure TCondPagNF.cadastrarCondPag;
var
  cadCondPag: TCondicaoPagamento;
begin
  cadCondPag.cadCondicaoPagamento(1);
  Refresh;
end;

constructor TCondPagNF.create(AOwner: TDataSet_OOP);
begin
  dataSet := TClientDataSet(DtmNF.cdsCPag);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
  FOwner := AOwner;
  IndexFieldNames := 'DESC_COND_PAG';
end;

function TCondPagNF.existeCondPagPrazo: Boolean;
begin
  Result := False;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if Pos('PRAZO', dataSet.FieldByName('desc_cond_pag').AsString) > 0 then
    begin
      Result := True;
      Exit;
    end;
    dataSet.Next;
  end;
end;

{ TColabNF }

function TColabNF.abreUsuarios: boolean;
begin
  result := montaselect('select' +
    ' cod_vendedor,' +
    ' nome_vendedor' +
    ' from colaborador where ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TColabNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsCol);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

{ TServNF }

function TServNF.buscaTipoServico(valorStr: string): boolean;
var
  vSelectTemp: string;
begin
  try
    vSelectTemp := 'select' +
      ' TP.COD_SERVICO,' +
      ' TP.DESC_SERVICO,' +
      ' TP.VALOR_SERVICO,' +
      ' TP.SHONDA,' +
      ' TP.STIPO,' +
      ' TP.ALIQ_ISS,' +
      ' TP.CODIGO_NOP,' +
      ' TP.ISENTO_SERV,' +
      ' TP.ISENTO_PIS,' +
      ' TP.UNIDADE,' +
      ' TP.N_INCIDENCIA_SERV,' +
      ' TP.CST_PIS,' +
      ' TP.CST_COFINS,' +
      ' TP.CST_PIS_ENT,' +
      ' TP.CST_COFINS_ENT,' +
      ' TP.CNBS ' +
      ' from TIPO_SERVICO TP ' +
      ' INNER JOIN TIPO_SERVICO_EMPRESA TE ON TE.COD_SERVICO = TP.COD_SERVICO AND TE.COD_EMPRESA = ' + vDadosIni.codEmpresa;
    // Buscando pelo Codigo
    try
      StrToInt(trim(valorStr));
      montaSelect(vSelectTemp +
        ' WHERE TP.COD_SERVICO = ' + (valorStr) +
        ' AND TE.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' AND TP.ATIVO = 1');
      if not dataSet.IsEmpty then
      begin
        Result := true;
        Exit;
      end;
    except
    end;
    //Buscando pela Descrição
    montaSelect(vSelectTemp +
      ' WHERE TP.DESC_SERVICO like ' + QuotedStr(valorStr + '%') +
      ' AND TE.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND TP.ATIVO = 1');
    if not dataSet.IsEmpty then
    begin
      if dataSet.RecordCount > 1 then
      begin
        try
          Application.CreateForm(TfrmEscolhaProdutoNf, frmEscolhaProdutoNf);
          frmEscolhaProdutoNf.GroupBox2.Visible := True;
          frmEscolhaProdutoNf.GroupBox2.Align := alClient;
          if frmEscolhaProdutoNf.ShowModal = idOK then
          begin
            montaSelect(vSelectTemp +
              ' WHERE TP.COD_SERVICO = ' + dataSet.FieldByName('COD_SERVICO').AsString +
              ' AND TE.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              ' AND TP.ATIVO = 1');
            if not dataSet.IsEmpty then
            begin
              Result := true;
              Exit;
            end;
          end;
        finally
          frmEscolhaProdutoNf.Free;
          frmEscolhaProdutoNf := nil;
        end;
      end
      else
      begin
        Result := true;
        Exit;
      end;
    end;
    Result := False;
  finally
  end;
end;

function TServNF.buscaTipoServico(codigo: integer): boolean;
begin
  montaSelect('select' +
    ' TP.COD_SERVICO,' +
    ' TP.DESC_SERVICO,' +
    ' TP.VALOR_SERVICO,' +
    ' TP.SHONDA,' +
    ' TP.STIPO,' +
    ' TP.ALIQ_ISS,' +
    ' TP.CODIGO_NOP,' +
    ' TP.ISENTO_SERV,' +
    ' TP.ISENTO_PIS,' +
    ' TP.UNIDADE,' +
    ' TP.N_INCIDENCIA_SERV,' +
    ' TP.CST_PIS,' +
    ' TP.CST_COFINS,' +
    ' TP.CST_PIS_ENT,' +
    ' TP.CST_COFINS_ENT,' +
    ' TP.CNBS ' +
    ' from TIPO_SERVICO TP ' +
    ' INNER JOIN TIPO_SERVICO_EMPRESA TE ON TE.COD_SERVICO = TP.COD_SERVICO AND TE.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' WHERE TP.COD_SERVICO = ' + IntToStr(codigo) +
    ' AND TE.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND TP.ATIVO = 1');
  Result := not dataSet.IsEmpty;
end;

procedure TServNF.cadastraTipoServico;
var
  vCadTipoServ: TTipoServ;
begin
  vCadTipoServ.CadTipoServ(1);
end;

constructor TServNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsServ);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TServNF.pesquisaTipoServico: string;
begin
  Result := Trim(vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Tipo de Serviço'));
end;

{ TCodBarraNF }

constructor TCodBarraNF.create(AOwner: TProdNF);
begin
  FOwner := AOwner;
  dataSet := TClientDataSet(DtmNF.cdsCodBarra);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TCodBarraNF.GetEAN(cod_grade: Integer; prefixInvalidosConf: string): string;
begin
  Result := '';
  if not Assigned(FOwner) then
    Exit;

  if (not FOwner.dataSet.Active) or (FOwner.dataSet.IsEmpty) then
    Exit;

  if cod_grade > 0 then
    if SqlOpen('select -1 ordem,  count(cb.cod_barra) cont, '' '' cod_barra from cod_barra cb' +
               ' where cb.grupo_prod = %d and cb.cod_prod = %s and cb.cod_empresa = %d and cb.ativo = 1 and coalesce(cb.cod_grade, 0) > 0' +
               ' union' +
               ' select 0 ordem, 0 cont, cb.cod_barra from cod_barra cb' +
               ' where cb.grupo_prod = %d and cb.cod_prod = %s and cb.cod_empresa = %d and cb.ativo = 1 and cb.cod_grade = %d' +
               ' union' +
               ' select 1 ordem, 0 cont, %s cod_barra from rdb$database' +
               ' union' +
               ' select 2 ordem, 0 cont,  cb.cod_barra from cod_barra cb' +
               ' where cb.grupo_prod = %d and cb.cod_prod = %s and cb.cod_empresa = %d and cb.ativo = 1' +
               ' and coalesce(cb.cod_grade, 0) = 0' +
               ' order by 1',
               [FOwner.fint('grupo_prod'), FOwner.fstrq('cod_prod'), vDadosIni.cod_empresa,
                FOwner.fint('grupo_prod'), FOwner.fstrq('cod_prod'), vDadosIni.cod_empresa, cod_grade,
                FOwner.fstrq('num_fab_prod'),
                FOwner.fint('grupo_prod'), FOwner.fstrq('cod_prod'), vDadosIni.cod_empresa]).FieldByName('cont').AsInteger > 0 then
    begin
      buscas.First;
      while not buscas.Eof do
      begin
        if vDadosIni.ValidaEAN(TGS1Prefix.GetEanValido(buscas.FieldByName('cod_barra').AsString, prefixInvalidosConf))  then
        begin
          Result := Trim(buscas.FieldByName('cod_barra').AsString);
          Exit;
        end;
        buscas.Next;
      end;
      Exit;
    end;

  if vDadosIni.ValidaEAN(TGS1Prefix.GetEanValido(FOwner.dataSet.FieldByName('num_fab_prod').AsString, prefixInvalidosConf)) then
  begin
    Result := Trim(FOwner.dataSet.FieldByName('num_fab_prod').AsString);
    Exit;
  end;

  montaSelect('select cb.* from cod_barra cb' +
    ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
    ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' where cb.grupo_prod = ' + IntToStr(FOwner.dataSet.FieldByName('grupo_prod').AsInteger) +
    ' and cb.cod_prod = ' + QuotedStr(FOwner.dataSet.FieldByName('cod_prod').AsString) +
    ' and cb.ativo = 1 and cb.cod_empresa = ' + vDadosIni.codEmpresa);

  dataSet.First;
  while not dataSet.Eof do
  begin

    if vDadosIni.ValidaEAN(TGS1Prefix.GetEanValido(dataSet.FieldByName('cod_barra').AsString, prefixInvalidosConf)) then
    begin
      Result := Trim(dataSet.FieldByName('cod_barra').AsString);
      Exit;
    end;

    dataSet.Next;
  end;
end;

function TCodBarraNF.selecionaProduto(codigoDeBarras: string): boolean;
begin
  Result := montaSelect('select cb.* from cod_barra cb' +
    ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
    ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' where cb.cod_barra = '+ QuotedStr(codigoDeBarras) +
    ' and p.ativo = 1 and cb.ativo = 1 and cb.cod_empresa = '+ vDadosIni.codEmpresa);//+
//    ' PLAN JOIN (CB INDEX (PK_CODBARRA), P INDEX (PK_PRODUTOS))');     //testar aqui dankine
//  Result := montaSelect('select * from cod_barra where cod_barra = ' + QuotedStr(codigoDeBarras) +
//    ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

{ TCnieeNF }

function TCnieeNF.abreImpressorasCniee: boolean;
begin
  Result := montaSelect('select * from impressoras_cniee');
end;

constructor TCnieeNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsCNIEE);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

{ TNcmEstNF }

constructor TNcmEstNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsNcmE);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

{ TModVeicNF }

function TModVeicNF.abreModelos: boolean;
begin
  Result := montaSelect('select * from tipmodelo where cod_empresa = ' +
    vDadosIni.codEmpresa + ' and ativo = 1 order by descricao')
end;

function TModVeicNF.abreModelos(descFabricante: string): boolean;
begin
  Result := montaSelect('select * from tipmodelo where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and desfab = ' + QuotedStr(descFabricante) + ' and ativo = 1 order by descricao');
  Result := not dataSet.IsEmpty;
end;

function TModVeicNF.abreModelos(codModelo: integer): boolean;
begin
  Result := montaSelect('select * from tipmodelo where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and codigo = ' + IntToStr(codModelo) + ' and ativo = 1 order by descricao');
  Result := not dataSet.IsEmpty;
end;

function TModVeicNF.buscarModelo(codModelo: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select * from tipmodelo where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and codigo = ' + IntToStr(codModelo) + ' and ativo = 1';
  buscas.Open;

  Result := not buscas.IsEmpty;
end;

constructor TModVeicNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsModV);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

{ TMarcasNF }

function TMarcasNF.abreMarcas: boolean;
begin
 Result := montaSelect('select * from marca_prod where tipo_marca = ''V'' and ativo = 1');
end;

constructor TMarcasNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsMarcaFab);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

{ TCombustivelNF }

function TCombustivelNF.abreCombustivel: boolean;
begin
 Result := montaSelect('select * from tp_comb_renavam where ativo = 1');
end;

constructor TCombustivelNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsCombustivelFab);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

{ TCorFabricanteNF }

function TCorFabricanteNF.abreCores: boolean;
begin
  Result := montaSelect('select * from codigo_corfab where ativo = 1');
end;

constructor TCorFabricanteNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsCorFab);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

{ TProdNF }

function TProdNF.buscaProduto(valorStr: string; AAbrirFormSelProd: Boolean): boolean;
var
  I: integer;
  grupoProd, codigoProd, SqlAuxiliar: string;
begin
  try
    SqlAuxiliar := '';
    vConsultaDescricao := False;
    ///  Combinado com o Herbert de pesquisar todos os produtos,
    ///  pois quando o produto entra pra manutencao tem de sair, entao o mesmo
    ///  produto deve estar acessivel na saida

    //if FNaturezaNF = 'S' then
    //  SqlAuxiliar := ' and ((consumo <> ''S'') or (consumo is null))';
    // Buscando pelo numero de fabricação
    {montaSelect('select ' + vCamposProd + ' from produtos where num_fab_prod = ' +
      QuotedStr(valorStr) +
      ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa + SqlAuxiliar);
    if not dataSet.IsEmpty then
    begin
      Result := true;
      Exit;
    end;   }
    //Buscando pelo codigo de barras


    // Caso precisar abrir o formulario para escolher o produto para ENTRADA(not AAbrirFormSelProd)
    // vai ter de fazer o select abaixo sem a grade, pois a grade vai na confirmação

    vCodGrade := 0;
    vCB.CodBarraSelecionado := ''; 
    if vCB.selecionaProduto(valorStr) then
      if AAbrirFormSelProd then
      begin
      	if vCB.dataSet.RecordCount > 1 then
        	montaSelect('select ' + GetSqlCamposProd([sjCodBarraGrade]) +
//          StringReplace(vCamposProd,
//            ' P.NUM_FAB_PROD, 0 COD_GRADE, ''SEM GRADE'' DESCRICAO, '' '' DESCRICAO1',
//            ' coalesce(cb.cod_barra, P.NUM_FAB_PROD) NUM_FAB_PROD, gr.COD_GRADE, gr.DESCRICAO, gr.DESCRICAO1',
//            [rfReplaceAll, rfIgnoreCase]) +
            ' from COD_BARRA CB' +
            '   inner join PRODUTOS P on P.GRUPO_PROD = CB.GRUPO_PROD and' +
            '         P.COD_PROD = CB.COD_PROD and' +
            '         P.COD_EMPRESA = CB.COD_EMPRESA and' +
            '         P.ATIVO = 1' +
            '   left join GRADE GR on GR.COD_GRADE = CB.COD_GRADE and' +
            '         GR.COD_EMPRESA = CB.COD_EMPRESA' +
            '   left join COD_GRADE_PROD G on G.GRUPO_PROD = CB.GRUPO_PROD and' +
            '         G.COD_PROD = CB.COD_PROD and' +
            '         G.COD_EMPRESA = CB.COD_EMPRESA and' +
            '         G.COD_GRADE = CB.COD_GRADE ' +
            ' where cb.cod_barra = '+ QuotedStr(valorStr) +
            ' and cb.ativo = 1 and cb.cod_empresa = '+ vDadosIni.codEmpresa +
            ' order by p.descr_prod')
        else
        	montaSelect('select ' + GetSqlCamposProd([sjCodBarraGrade]) +
//            StringReplace(vCamposProd,
//            ' P.NUM_FAB_PROD, 0 COD_GRADE, ''SEM GRADE'' DESCRICAO, '' '' DESCRICAO1',
//            ' coalesce(cb.cod_barra, P.NUM_FAB_PROD) NUM_FAB_PROD, gr.COD_GRADE, gr.DESCRICAO, gr.DESCRICAO1',
//            [rfReplaceAll, rfIgnoreCase]) +
            ' from produtos p' +
            ' left join cod_grade_prod g on g.grupo_prod = p.grupo_prod and g.cod_prod = p.cod_prod and g.cod_empresa = p.cod_empresa' + IfThen(inibePesquisaCodBarra, ' and g.cod_grade = -99') +
            ' left join grade gr on gr.cod_grade = g.cod_grade and gr.cod_empresa = g.cod_empresa' +
            ' left join cod_barra cb on cb.grupo_prod = p.grupo_prod and cb.cod_prod = p.cod_prod and cb.cod_empresa = p.cod_empresa and cb.cod_grade = gr.cod_grade ' +
            ' where p.grupo_prod = ' + IntToStr(vCB.dataSet.FieldByName('grupo_prod').AsInteger) +
            ' and p.cod_prod = ' + QuotedStr(vCB.dataSet.FieldByName('cod_prod').AsString) +
            ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
            ' order by p.descr_prod');

        vConsultaDescricao := true;
        if dataSet.RecordCount > 1 then
        begin
          try
            Application.CreateForm(TfrmEscolhaProdutoNf, frmEscolhaProdutoNf);
            frmEscolhaProdutoNf.GroupBox1.Visible := True;
            frmEscolhaProdutoNf.GroupBox1.Align := alClient;
            frmEscolhaProdutoNf.Panel2.Visible := AAbrirFormSelProd and (not inibePesquisaCodBarra);
            if frmEscolhaProdutoNf.ShowModal = idOK then
            begin
              vCodGrade := dataSet.FieldByName('cod_grade').AsInteger;
              vCB.CodBarraSelecionado := fstr('NUM_FAB_PROD');
              if buscaProduto(dataSet.FieldByName('grupo_prod').AsInteger,
                dataSet.FieldByName('cod_prod').AsString) then
              begin
                Result := true;
                Exit;
              end;
            end;
          finally
            frmEscolhaProdutoNf.Free;
            frmEscolhaProdutoNf := nil;
          end;
        end
        else if dataSet.RecordCount > 0 then
          Result := True;
        Exit;
      end
      else
      if buscaProduto(vCB.dataSet.FieldByName('grupo_prod').AsInteger,
        vCB.dataSet.FieldByName('cod_prod').AsString) then
      begin
        if vCB.dataSet.FieldByName('cod_grade').AsInteger > 0 then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select cod_grade from grade' +
            ' where cod_grade  = ' + IntToStr(vCB.dataSet.FieldByName('cod_grade').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.Open;
          if buscas.FieldByName('cod_grade').AsInteger = vCB.dataSet.FieldByName('cod_grade').AsInteger then
          begin
            vCodGrade := vCB.dataSet.FieldByName('cod_grade').AsInteger;
            vCB.CodBarraSelecionado := vCB.fstr('cod_barra');
          end;
        end;
        Result := true;
        Exit;
      end;
    //Buscando pelo grupo e codigo
    if not FBuscarApenasCB then
    try
      codigoProd := '';
      for I := length(valorStr) downto (length(valorStr) - StrToInt(vDadosIni.vProduto.vDigitosProd) + 1)
        do
        codigoProd := valorStr[i] + codigoProd;
      grupoProd := '';
      //      for I := length(valorStr) downto (length(valorStr) - StrToInt(vDadosIni.vProduto.vDigitosProd)) do
      //        grupoProd := valorStr[i] + grupoProd;
      grupoProd := copy(Trim(valorStr), 1, length(valorStr) -
        StrToInt(vDadosIni.vProduto.vDigitosProd));

      if buscaProduto(StrToInt(grupoProd), codigoProd, True) then
      begin
        Result := true;
        Exit;
      end;
    except
    end;
    //Buscando pela Descrição
    if AAbrirFormSelProd then
      montaSelect('select ' + GetSqlCamposProd([sjCodBarraGrade]) +
//        StringReplace(vCamposProd,
//        ' P.NUM_FAB_PROD, 0 COD_GRADE, ''SEM GRADE'' DESCRICAO, '' '' DESCRICAO1',
//        ' coalesce(cb.cod_barra, P.NUM_FAB_PROD) NUM_FAB_PROD, gr.COD_GRADE, gr.DESCRICAO, gr.DESCRICAO1',
//        [rfReplaceAll, rfIgnoreCase]) +
        ' from produtos p' +
        ' left join cod_grade_prod g on g.grupo_prod = p.grupo_prod and g.cod_prod = p.cod_prod and g.cod_empresa = p.cod_empresa' + IfThen(inibePesquisaCodBarra, ' and g.cod_grade = -99') +
        ' left join grade gr on gr.cod_grade = g.cod_grade and gr.cod_empresa = g.cod_empresa' +
        ' left join cod_barra cb on cb.grupo_prod = p.grupo_prod and cb.cod_prod = p.cod_prod and cb.cod_empresa = p.cod_empresa and cb.cod_grade = gr.cod_grade ' +
        ' where p.descr_prod like ' +
        QuotedStr(valorStr + '%') +
        ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa + SqlAuxiliar +
        ' order by p.descr_prod')
    else
      montaSelect('select ' + GetSqlCamposProd([]) + ' from produtos p' +
        ' where p.descr_prod like ' + QuotedStr(valorStr + '%') +
        ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa + SqlAuxiliar +
        ' order by p.descr_prod');
    if not dataSet.IsEmpty then
    begin
      vConsultaDescricao := true;
      if dataSet.RecordCount > 1 then
      begin
        try
          Application.CreateForm(TfrmEscolhaProdutoNf, frmEscolhaProdutoNf);
          frmEscolhaProdutoNf.GroupBox1.Visible := True;
          frmEscolhaProdutoNf.GroupBox1.Align := alClient;
          frmEscolhaProdutoNf.Panel2.Visible := AAbrirFormSelProd and (not inibePesquisaCodBarra);
          if frmEscolhaProdutoNf.ShowModal = idOK then
          begin
            vCodGrade := dataSet.FieldByName('cod_grade').AsInteger;
            vCB.CodBarraSelecionado := fstr('NUM_FAB_PROD');
            if buscaProduto(dataSet.FieldByName('grupo_prod').AsInteger,
              dataSet.FieldByName('cod_prod').AsString) then
            begin
              Result := true;
              Exit;
            end;
          end;
        finally
          frmEscolhaProdutoNf.Free;
          frmEscolhaProdutoNf := nil;
        end;
      end
      else
      begin
        Result := true;
        Exit;
      end;
    end;
    Result := False;
  finally
    FBuscarApenasCB := False;
  end;
end;

function TProdNF.GetQueryEstoque(grupo: integer; codigo: string; cod_grade: Integer): TQuery_OOP;
begin
  Result := queryCons.SQL('select * from getestoquedisponivel(:grupo_prod, :cod_prod, :cod_grade, :cod_empresa, 0, '''', 0, 0)')
    .ParamValue('grupo_prod', grupo)
    .ParamValue('cod_prod', codigo)
    .ParamValue('cod_grade', cod_grade)
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .Open;
end;

function TProdNF.buscaProduto(grupo: integer; codigo: string; TestarAtivo: Boolean): boolean;
var
  SqlAuxiliar: string;
begin
  SqlAuxiliar := '';
  //if FNaturezaNF = 'S' then
    //SqlAuxiliar := ' and ((consumo <> ''S'') or (consumo is null))';
  montaSelect('select ' + GetSqlCamposProd([]) + ' from produtos p where p.grupo_prod = ' + IntToStr(grupo) +
    ' and p.cod_prod = ' + QuotedStr(codigo) + vDadosIni.IfThen(TestarAtivo, ' and p.ativo = 1', '') +
    ' and p.cod_empresa = ' + vDadosIni.codEmpresa + SqlAuxiliar +
    ' order by p.descr_prod');
  Result := not dataSet.IsEmpty
end;

function TProdNF.buscaProdutoParaConversao(pCODIGO_EAN, pUcom: string; pNItem: Integer = 0): boolean;
begin
  FConv_QtdeEAN:= 0;
  Conv_UnidProduto := '';

  if Trim(pCODIGO_EAN) = '' then
    Exit;

  montaSelect('select ' + GetSqlCamposProd([]) + ' from produtos p' +
    ' inner join vw_produtos_conversao pc on pc.grupo_prod = p.grupo_prod and pc.cod_prod = p.cod_prod and pc.cod_empresa = p.cod_empresa' +
    ' where pc.codigo_ean = ' + QuotedStr(pCODIGO_EAN) +
    ' and pc.codigo_ean <> ''''' +
    ' and pc.unidade = ' + QuotedStr(AnsiUpperCase(Trim(pUcom))) +
    ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by p.descr_prod');
  Result := not dataSet.IsEmpty;

  if dataSet.IsEmpty then
  begin
    montaSelect('select ' + GetSqlCamposProd([]) + ' from produtos p' +
      ' inner join vw_produtos_conversao pc on pc.grupo_prod = p.grupo_prod and pc.cod_prod = p.cod_prod and pc.cod_empresa = p.cod_empresa' +
      ' where pc.codigo_ean = ' + QuotedStr(pCODIGO_EAN) +
      ' and pc.codigo_ean <> ''''' +
      ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by p.descr_prod');
    Result := not dataSet.IsEmpty;
  end;

  if not dataSet.IsEmpty then
  begin
//      vConsultaDescricao := true;
    if dataSet.RecordCount > 1 then
    begin
      try
        Application.CreateForm(TfrmEscolhaProdutoNf, frmEscolhaProdutoNf);
        frmEscolhaProdutoNf.GroupBox1.Visible := True;
        frmEscolhaProdutoNf.GroupBox1.Align := alClient;
        frmEscolhaProdutoNf.Tag := pNItem;
        frmEscolhaProdutoNf.BitBtn4.Visible := False;
        frmEscolhaProdutoNf.ShowModal;// = idOK then
        if buscaProduto(dataSet.FieldByName('grupo_prod').AsInteger,
          dataSet.FieldByName('cod_prod').AsString) then
        begin
          Result := true;
        end
        else
          Result := False;
      finally
        frmEscolhaProdutoNf.Free;
        frmEscolhaProdutoNf := nil;
      end;
    end
    else
      Result := true;

    if Result then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select quantidade, unidade unid_nf from vw_produtos_conversao' +
        ' where grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString)  +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and codigo_ean = ' + QuotedStr(pCODIGO_EAN);
      buscas.Open;
      Conv_QtdeEAN := buscas.FieldByName('quantidade').AsFloat;
      Conv_UnidProduto := AnsiUpperCase(dataSet.FieldByName('unidade').AsString);
      Emb_Conv_UnidComNF := AnsiUpperCase(buscas.FieldByName('unid_nf').AsString);
    end;
  end;
end;

function TProdNF.buscaProdutoSaida(valorStr: string): boolean;
var
  I: integer;
  grupoProd, codigoProd, SqlAuxiliar: string;
begin
  try
    SqlAuxiliar := '';
    vConsultaDescricao := False;

    vCodGrade := 0;
    if vCB.selecionaProduto(valorStr) then
    begin
      montaSelect('select ' + GetSqlCamposProd([sjCodBarraGrade]) +
        ' from produtos p' +
        ' left join cod_grade_prod g on g.grupo_prod = p.grupo_prod and g.cod_prod = p.cod_prod and g.cod_empresa = p.cod_empresa' +
        ' left join grade gr on gr.cod_grade = g.cod_grade and gr.cod_empresa = g.cod_empresa' +
        ' left join cod_barra cb on cb.grupo_prod = p.grupo_prod and cb.cod_prod = p.cod_prod and cb.cod_empresa = p.cod_empresa and cb.cod_grade = gr.cod_grade ' +
        ' where p.grupo_prod = ' + IntToStr(vCB.dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and p.cod_prod = ' + QuotedStr(vCB.dataSet.FieldByName('cod_prod').AsString) +
        ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' order by p.descr_prod');

      vConsultaDescricao := true;
      if dataSet.RecordCount > 0 then
        Result := True;
      Exit;
    end;

    Result := False;
  finally
    FBuscarApenasCB := False;
  end;
end;

procedure TProdNF.cadastraProduto;
var
  vCadProduto: TProdutos;
begin
  vCadProduto.CadProdutos(1);
end;

constructor TProdNF.create;
var
  I: Integer;
begin
  dataSet := TClientDataSet(DtmNF.cdsProd);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
  vCB := TCodBarraNF.create(Self);

  FNaturezaNF := 'S';
  FBuscarApenasCB := False;
  vConsultaDescricao := False;
  inibePesquisaCodBarra := False;
  for I := 0 to dataSet.FieldCount - 1 do
    if (dataSet.Fields[i] is TFloatField) or (dataSet.Fields[i] is TCurrencyField) then
      TFloatField(dataSet.Fields[i]).DisplayFormat := '##0.00';
  vCamposProd := 'P.GRUPO_PROD, P.COD_PROD, P.CODIGO_NOP, P.PREC_CUS_PROD, P.PREC_TAB_PROD, P.DESCR_PROD,' +
    ' P.IPI_PROD, P.ICM_PROD, P.PERC_TB_PROD, P.PERC_TB_PRODA, P.PREC_30_PROD, P.EST_F, P.EST_R,' +
    ' P.PREC_60_PROD, P.PREC_90_PROD, P.MARCA_P, P.PERC_RED_PROD, P.ISENTO_PROD, P.N_INCIDENCIA_PROD,' +
    ' P.UNIDADE, P.CST_PROD, P.PREC_PUBLICO, P.PREC_CUSR_PROD, P.ISENTO_PIS, P.PREC_CUS_MNF, P.EMB_PROD,' +
    ' P.PERC_SUBSTTR, P.QTDEMB, P.BALANCA_PROD, P.VALIDADE_PROD, P.PREC_CUSR_MNF, P.PREC_CUSM_PROD,' +
    ' P.PERC_FRETE_PROD, P.PREC_CUSMR_PROD, P.PERC_TB_ATAC, P.PERC_TB_VARE, P.ICMANT_SUB,' +
    ' P.NBM, P.PESO_LIQ_PROD, P.PESO_BRUT_PROD, P.PERMITIR_DESCONTO, P.EM_PROMOCAO, P.PRECO_PROMOCAO,' +
    ' P.DESCR_PROD_RED, P.CONSUMO, P.BASEICMANT_SUB, P.MARGMINCCUSTOV, P.MARGMINCCUSTOA, P.ECF, P.APLICACAO_PROD,' +
    ' P.DAT_CAD_PROD, P.CST_IPI, P.CFOP_INTER_N_CONT, P.CST_PIS, P.CST_COFINS, P.CST_PIS_ENT, P.CST_COFINS_ENT,' +
    ' P.ALIQ_PIS_DIFERENCIADA, P.ALIQ_COFINS_DIFERENCIADA, P.PREC_60_PROD, P.PREC_90_PROD, P.PERC_AD_30,' +
    ' P.PERC_AD_60, P.PERC_AD_90, P.MAX_DESC_ITEM, P.PDESC_PR30_VAREJO, P.PERC_TB_PROD3, P.PERC_TB_PROD6, P.PERC_TB_PROD9,' +
    ' P.ALIQ_CRED_PIS, P.ALIQ_CRED_COFINS, P.COMB_CPRODANP, P.COMB_CODIF, P.NFCI, P.NFE_NRECOPI, P.COMB_PMIXGN, P.CENQ_IPI_NFE, P.CEST,' +
    ' P.COMB_DESCANP, P.COMB_PGLP, P.COMB_PGNN, P.COMB_PGNI, P.COMB_VPART,' +
    ' P.FCP_ALIQ, P.FCP_VBCFCPSTRET, P.FCP_PFCPSTRET, P.FCP_VFCPSTRET, P.ANT_PST, P.ANT_VICMSSUBSTITUTO, P.NFE_INDESCALA, P.NFE_CNPJFAB,' +
    ' P.NFE_UTRIB, P.NFE_QTRIB, P.CEST_VARIANTE_ID, P.CFOP_NFCE,' +
    ' P.NUM_FAB_PROD, 0 COD_GRADE, ''SEM GRADE'' DESCRICAO, '' '' DESCRICAO1';
end;

destructor TProdNF.Destroy;
begin
  vCB.Free;
  vCB := nil;

  inherited;
end;

function TProdNF.getPercentualDeReducaoBaseICMS(pDentroDoEstado,
  pIsento: Boolean; pAliquota: Double): Double;
var
  vDentroEstado, vIsento: integer;
begin
  vDentroEstado := 0;
  vIsento := 0;
  if pDentroDoEstado then
    vDentroEstado := 1;
  if pIsento then
    vIsento := 1;
  try
    buscas.Close;
    buscas.SQL.Text := 'select percentual from reducao where grupo_prod = ' +
      dataSet.FieldByName('grupo_prod').AsString +
      ' and cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
      ' and cod_empresa = ' +
      vDadosIni.codEmpresa +
      ' and isento = ' + IntToStr(vIsento) + ' and dentro_est = ' + IntToStr(vDentroEstado) +
      ' and aliquota = :aliquota';
    buscas.ParamByName('aliquota').AsFloat := pAliquota;
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      if (vDadosIni.vEmp.vUsarReducaoInvertida = 'S') and (buscas.FieldByName('percentual').AsFloat > 0) then
        Result := 100 - buscas.FieldByName('percentual').AsFloat
      else
        Result := buscas.FieldByName('percentual').AsFloat;
    end
    else if (vDadosIni.vEmp.vUsarReducaoInvertida = 'S') and (dataSet.FieldByName('perc_red_prod').AsFloat > 0) then
      Result := 100 - dataSet.FieldByName('perc_red_prod').AsFloat
    else
      Result := dataSet.FieldByName('perc_red_prod').AsFloat;
  finally
    buscas.Close;
  end;
end;

function TProdNF.GetSqlCamposProd(joins: TProdNFSqlJoins): string;
begin
  Result := vCamposProd;

  if sjCodBarraGrade in joins then
    Result := StringReplace(Result, ' P.NUM_FAB_PROD, 0 COD_GRADE, ''SEM GRADE'' DESCRICAO, '' '' DESCRICAO1',
            ' coalesce(cb.cod_barra, P.NUM_FAB_PROD) NUM_FAB_PROD, gr.COD_GRADE, gr.DESCRICAO, gr.DESCRICAO1',
            [rfReplaceAll, rfIgnoreCase]);

//  if sqEstDispo in joins then
//  begin
//    if sjCodBarraGrade in joins then
//      Result := StringReplace(Result, ' P.EST_F', ' coalesce(G.QTDE, P.EST_F) EST_F,', [rfReplaceAll, rfIgnoreCase]);
//
//    Result := StringReplace(Result, ' P.EST_F ESTOQUE', ' EST.ESTOQUE', [rfReplaceAll, rfIgnoreCase]);
//  end;
// Caso venha utilizar o join abaixo, basta adicionar ", P.EST_F ESTOQUE" no vCamposProd e o join nas consultas
//            ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1' +
end;

function TProdNF.pesquisaProduto: string;
begin
  Result := Trim(vDadosIni.pesquisaRapida('PRODUTOS'));
end;

procedure TProdNF.setDadosEmbalagemProduto(grupo: integer; codigo: string);
begin
  buscas.Close;
  buscas.SQL.Text := 'select p.emb_prod, p.qtdemb, p.unidade from produtos p' +
    ' where p.grupo_prod = ' + IntToStr(grupo) +
    ' and p.cod_prod = ' + QuotedStr(codigo) +
    ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  fEmb_Conv_UnidComNF := AnsiUpperCase(Trim(buscas.FieldByName('EMB_PROD').AsString));
  fConv_UnidProduto := AnsiUpperCase(Trim(buscas.FieldByName('UNIDADE').AsString));
  fEmb_Conv_Embal_Com  := buscas.FieldByName('QTDEMB').AsFloat;
  fEmb_Conv_Qtde_Receb := 0;
  buscas.Close;
end;

{ TProdutoFornecedor }

function TProdutoFornecedor.buscaProdutos(codigo: string; codForn: integer): boolean;
begin
  vCodGrade := 0;
  result := montaSelect('select cf.grupo_prod, cf.cod_prod, cf.num_fab_fornecedor, cf.cod_grade,' +
    ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from codigo_fornecedor_vw cf' +
    ' inner join produtos p on p.grupo_prod = cf.grupo_prod and p.cod_prod = cf.cod_prod and p.cod_empresa = cf.cod_empresa ' +
    ' where cf.num_fab_fornecedor = ' + QuotedStr(codigo) +
    ' and cf.cod_fornecedor = ' + IntToStr(codForn) +
    ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and p.ativo = 1');
  if dataSet.FieldByName('cod_grade').AsInteger > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select cod_grade from grade' +
      ' where cod_grade  = ' + IntToStr(dataSet.FieldByName('cod_grade').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if buscas.FieldByName('cod_grade').AsInteger = dataSet.FieldByName('cod_grade').AsInteger then
      vCodGrade := dataSet.FieldByName('cod_grade').AsInteger;
  end;
end;

function TProdutoFornecedor.buscaProdutos(codigo, cpfcgc: string): boolean;
begin
	vCodGrade := 0;
  result := montaSelect('select cf.grupo_prod, cf.cod_prod, cf.num_fab_fornecedor, cf.cod_grade,' +
    ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from codigo_fornecedor_vw cf' +
    ' inner join produtos p on p.grupo_prod = cf.grupo_prod and p.cod_prod = cf.cod_prod and p.cod_empresa = cf.cod_empresa ' +
    ' where cf.num_fab_fornecedor = ' + QuotedStr(codigo) +
    ' and cf.cpfcgc = ' + QuotedStr(cpfcgc) +
    ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and p.ativo = 1');
  if dataSet.FieldByName('cod_grade').AsInteger > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select cod_grade from grade' +
      ' where cod_grade  = ' + IntToStr(dataSet.FieldByName('cod_grade').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if buscas.FieldByName('cod_grade').AsInteger = dataSet.FieldByName('cod_grade').AsInteger then
      vCodGrade := dataSet.FieldByName('cod_grade').AsInteger;
  end;
end;

function TProdutoFornecedor.buscaProdutosSaida(codigo: string): boolean;
begin
  vCodGrade := 0;
  result := montaSelect('select p.grupo_prod, p.cod_prod, p.num_fab_prod num_fab_fornecedor, 0 cod_grade,' +
  	' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from produtos p ' +
    ' inner join cod_barra cb on p.grupo_prod=cb.grupo_prod and p.cod_prod=cb.cod_prod and p.cod_empresa=cb.cod_empresa ' +
    ' where p.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cb.cod_barra = ' + QuotedStr(codigo) + ' and p.ativo = 1');
end;

constructor TProdutoFornecedor.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsprodForn);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TProdutoFornecedor.existeProduto(codigo, pCodProd: string;
  pGrupoProd: Integer; pCpfCgc: string): boolean;
begin
	result := montaSelect('select cf.grupo_prod, cf.cod_prod, cf.num_fab_fornecedor, cf.cod_grade,' +
    ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from codigo_fornecedor_vw cf' +
    ' inner join produtos p on p.grupo_prod = cf.grupo_prod and p.cod_prod = cf.cod_prod and p.cod_empresa = cf.cod_empresa ' +
    ' where cf.cpfcgc = ' + QuotedStr(pCpfCgc) +
    ' and cf.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and cf.cod_prod = ' + QuotedStr(pCodProd) +
    ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cf.num_fab_fornecedor = ' + QuotedStr(codigo) +
    ' and p.ativo = 1');
  Result := not dataSet.IsEmpty;
end;

function TProdutoFornecedor.existeProduto(codigo, pCodProd: string;
  pGrupoProd, codForn: integer): boolean;
begin
  result := montaSelect('select cf.grupo_prod, cf.cod_prod, cf.num_fab_fornecedor, cf.cod_grade,' +
    ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from codigo_fornecedor_vw cf' +
    ' inner join produtos p on p.grupo_prod = cf.grupo_prod and p.cod_prod = cf.cod_prod and p.cod_empresa = cf.cod_empresa ' +
    ' where cf.num_fab_fornecedor = ' + QuotedStr(codigo) +
    ' and cf.cod_fornecedor = ' + IntToStr(codForn) +
    ' and cf.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and cf.cod_prod = ' + QuotedStr(pCodProd) +
    ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and p.ativo = 1');
  Result := not dataSet.IsEmpty;
end;

{ TNcmNF }

constructor TNcmNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsNcm);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
  vNcmE := TNcmEstNF.create;
end;

destructor TNcmNF.Destroy;
begin
  vNcmE.Free;
  vNcmE := nil;
  inherited;
end;

function TNcmNF.getFirstCEST(NCM: string): string;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cest from nbm where cod_ncm = ' + QuotedStr(NCM);
  buscas.Open;
  Result := Trim(buscas.FieldByName('cest').AsString);
end;

{ TEstoqueECFNF }

constructor TEstoqueECFNF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsEstEcf);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TEstoqueECFNF.selecionaEstoqueECF(pCOD_SERIE: Integer): boolean;
begin
  Result := montaSelect('select * from ecf where cod_nserie = ' + IntToStr(pCOD_SERIE) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TEstoqueECFNF.selecionaEstoqueECFRetorno(pGrupo: integer;
  pCodigo: string): boolean;
begin
  Result := montaSelect('select * from ecf where status <> ''Estoque'' and' +
    ' status <> ''Vendido'' and grupo_prod = ' + IntToStr(pGrupo) + ' and cod_prod = ' + QuotedStr(Trim(pCodigo))+
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TEstoqueECFNF.selecionaEstoqueECFVenda(pGrupo: integer;
  pCodigo: string): boolean;
begin
  Result := montaSelect('select * from ecf where status = ''Estoque''' +
    ' and grupo_prod = ' + IntToStr(pGrupo) + ' and cod_prod = ' + QuotedStr(Trim(pCodigo))+
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TControlesNF }

function TControlesNF.controleCobrebem: Boolean;
begin
  Result := False;
  buscas.Close;
  buscas.SQL.Text := 'select cod_cobrebem from cobrebem where CODIGO_CTRL = :CODIGO_CTRL' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ParamByName('CODIGO_CTRL').AsInteger := Dataset.FieldByName('codigo_ctrl').AsInteger;
  buscas.Open;
  Result := Buscas.FieldByName('cod_cobrebem').AsInteger > 0;
  Buscas.Close;
end;

constructor TControlesNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsCtrl);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
end;

function TControlesNF.selecionaControlesContasAPagar: boolean;
begin
  montaSelect('select * from controles ' +
  	' where codigo_emp = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' and (coalesce(controle_visivel, ''S'') = ''S'') ', '') +
    ' and ativo <> 99 ' +
    ' order by codigo_ctrl');
end;

function TControlesNF.selecionaControlesDeBoletos(pControleVenda: Integer = 0): boolean;
var
  vTemp: string;
begin
  vTemp := '';
  if pControleVenda > 0 then
    vTemp := ' and codigo_ctrl = ' + IntToStr(pControleVenda);
  montaSelect('select * from controles ' +
    ' where codigo_emp = ' + vDadosIni.codEmpresa +
    ' and USAR_BOLETO = ''S''' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' and (coalesce(controle_visivel, ''S'') = ''S'') ', '') +
    ' and ativo <> 99 ' +
    vTemp);
end;

{ TBoletasNF }

constructor TBoletasNF.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsBolNf);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
end;

function TBoletasNF.selecionaBoletas(numeroNF, serieNF: Integer): boolean;
begin
  Result := montaSelect('select c1.nome_ctrl, cb.descricao, b.* from boletas b' +
    ' left join controles c1 on c1.codigo_ctrl = b.cod_controle_cx and c1.codigo_emp = b.cod_empresa' +
    ' left join cobrebem cb on cb.cod_cobrebem = b.cod_cobrebem and cb.cod_empresa = b.cod_empresa' +
    ' where b.num_nf_vnd = ' + IntToStr(numeronf) +
    ' and b.sub_serie = ' + IntToStr(serieNF) + ' and b.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and b.ativo = 1');
end;

function TBoletasNF.selecionaBoletas(pCOD_NF: Integer): boolean;
begin
  Result := montaSelect('select c1.nome_ctrl, cb.descricao, b.* from boletas b' +
    ' left join controles c1 on c1.codigo_ctrl = b.cod_controle_cx and c1.codigo_emp = b.cod_empresa' +
    ' left join cobrebem cb on cb.cod_cobrebem = b.cod_cobrebem and cb.cod_empresa = b.cod_empresa' +
    ' where b.cod_nf = ' + IntToStr(pCOD_NF) + ' and b.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and b.ativo = 1');
end;

end.

