unit uClassesProgFidelidade;

interface

uses
  Classes, Contnrs;

type

  TClienteProgFid = class
  private
    Fcod_cliente: Integer;
    Fnome_cliente: WideString;
    Frazao: WideString;
    Fcpf_cnpj: WideString;
    Fstatus_f: WideString;
    Fclultimacompra: WideString;
  public
    function Clone: TClienteProgFid;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property nome_cliente: WideString read Fnome_cliente write Fnome_cliente;
    property razao: WideString read Frazao write Frazao;
    property cpf_cnpj: WideString read Fcpf_cnpj write Fcpf_cnpj;
    property status_f: WideString read Fstatus_f write Fstatus_f;
    property clultimacompra: WideString read Fclultimacompra write Fclultimacompra;
  end;

  TKitProdFid = class
  private
    Fcod_kit: Integer;
    Fdescricao: WideString;
  public
    function Clone: TKitProdFid;
    property cod_kit: Integer read Fcod_kit write Fcod_kit;
    property descricao: WideString read Fdescricao write Fdescricao;
  end;

  TMarcaProdFid = class
  private
    Fcod_marca: Integer;
    Fdescricao: WideString;
  public
    function Clone: TMarcaProdFid;
    property cod_marca: Integer read Fcod_marca write Fcod_marca;
    property descricao: WideString read Fdescricao write Fdescricao;
  end;

  TSubGrupoProdFid = class
  private
    Fsub_grupo_prod: Integer;
    Fdescricao: WideString;
  public
    function Clone: TSubGrupoProdFid;
    property sub_grupo_prod: Integer read Fsub_grupo_prod write Fsub_grupo_prod;
    property descricao: WideString read Fdescricao write Fdescricao;
  end;

  TGradeProdFid = class
  private
    Fcod_grade: Integer;
    Fdescricao: WideString;
  public
    function Clone: TGradeProdFid;
    property cod_grade: Integer read Fcod_grade write Fcod_grade;
    property descricao: WideString read Fdescricao write Fdescricao;
  end;

  TGrupoProdFid = class
  private
    Fgrupo_prod: Integer;
    Fdescricao: WideString;
  public
    function Clone: TGrupoProdFid;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property descricao: WideString read Fdescricao write Fdescricao;
  end;

  TVeiculoProgFid = class
  private
   Fcodigo: Integer;
   Fplaca: WideString;
   Fchassi: WideString;
   Fdescricao: WideString;
  public
    function Clone: TVeiculoProgFid;
    property codigo: Integer read Fcodigo write Fcodigo;
    property placa: WideString read Fplaca write Fplaca;
    property chassi: WideString read Fchassi write Fchassi;
    property descricao: WideString read Fdescricao write Fdescricao;
  end;

  TProdutoProgFid = class
  private
    Fcod_prod: WideString;
    Fdescricao: WideString;
    FGradeProdFid: TGradeProdFid;
    FGrupoProdFid: TGrupoProdFid;
    FSubGrupoProdFid: TSubGrupoProdFid;
    FMarcaProdFid: TMarcaProdFid;
    FKitProdFid: TKitProdFid;
  public
    function Clone: TProdutoProgFid;
    destructor Destroy; override;
    property cod_prod: WideString read Fcod_prod write Fcod_prod;
    property descricao: WideString read Fdescricao write Fdescricao;
    property GradeProdFid: TGradeProdFid read FGradeProdFid write FGradeProdFid;
    property GrupoProdFid: TGrupoProdFid read FGrupoProdFid write FGrupoProdFid;
    property SubGrupoProdFid: TSubGrupoProdFid read FSubGrupoProdFid write FSubGrupoProdFid;
    property MarcaProdFid: TMarcaProdFid read FMarcaProdFid write FMarcaProdFid;
    property KitProdFid: TKitProdFid read FKitProdFid write FKitProdFid;
  end;

  TDevolucaoProgFid_Item = class
  private
    Fnitem: Integer;
    Fcodigo: Integer;
    Fchassi: WideString;
    Fplaca: WideString;
    Fgrupo_prod: Integer;
    Fcod_prod: WideString;
    Fcod_grade: Integer;
    Fdescricao: WideString;
    Fvltot_dev_item: Double;
  public
    function Clone: TDevolucaoProgFid_Item;
    property nitem: Integer read Fnitem write Fnitem;
    property codigo: Integer read Fcodigo write Fcodigo;
    property chassi: WideString read Fchassi write Fchassi;
    property placa: WideString read Fplaca write Fplaca;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: WideString read Fcod_prod write Fcod_prod;
    property cod_grade: Integer read Fcod_grade write Fcod_grade;
    property descricao: WideString read Fdescricao write Fdescricao;
    property vltot_dev_item: Double read Fvltot_dev_item write Fvltot_dev_item;
  end;

  TDevolucaoProgFid_Item_List = array of TDevolucaoProgFid_Item;

  TDevolucaoProgFid = class
  private
    Fcoddev: Integer;
    Ftipodev: WideString;
    Fdata: WideString;
    Fvalor_dev: Double;
    FItens: TDevolucaoProgFid_Item_List;
  public
    destructor Destroy; override;
    procedure SetLengthItens(ALength: Integer);
    function Clone: TDevolucaoProgFid;
    property coddev: Integer read Fcoddev write Fcoddev;
    property tipodev: WideString read Ftipodev write Ftipodev;
    property data: WideString read Fdata write Fdata;
    property valor_dev: Double read Fvalor_dev write Fvalor_dev;

    property Itens: TDevolucaoProgFid_Item_List read FItens write FItens;
  end;

  TDevolucaoProgFid_List = array of TDevolucaoProgFid;

  TValeDocProgFid = class
  private
    Fnum_vale: WideString;
    Fhistorico_vale: WideString;
    Fpontos_vale: Double;
    Fvalor_vale: Double;
  public
    function Clone: TValeDocProgFid;
    property num_vale: WideString read Fnum_vale write Fnum_vale;
    property historico_vale: WideString read Fhistorico_vale write Fhistorico_vale;
    property pontos_vale: Double read Fpontos_vale write Fpontos_vale;
    property valor_vale: Double read Fvalor_vale write Fvalor_vale;
  end;

  TValeDocProgFid_List = array of TValeDocProgFid;

  TValeProgFid = class
  private
    Fseqform: Integer;
    Fcodigo_ctrl: Integer;
    Fnome_ctrl: WideString;
    Fdocs: WideString;
    Fnumerodoc: WideString;
    Fdata_mov: WideString;
    Fdata_venc: WideString;
    Fvalor: Double;
    Fnparcela: Integer;
    Frec_tipvend: WideString;
    Frec_numvend: Integer;
    Frecibo: WideString;
    Fhistorico: WideString;
    FValeDoc: TValeDocProgFid_List;
  public
    function Clone: TValeProgFid;
    procedure SetLengthItens(ALength: Integer);
    property seqform: Integer read Fseqform write Fseqform;
    property codigo_ctrl: Integer read Fcodigo_ctrl write Fcodigo_ctrl;
    property nome_ctrl: WideString read Fnome_ctrl write Fnome_ctrl;
    property docs: WideString read Fdocs write Fdocs; //d: dinheiro, cc: cartacao credito, cd: cartao deb, cr: crediario
    property numerodoc: WideString read Fnumerodoc write Fnumerodoc;
    property data_mov: WideString read Fdata_mov write Fdata_mov;
    property data_venc: WideString read Fdata_venc write Fdata_venc;
    property valor: Double read Fvalor write Fvalor;
    property nparcela: Integer read Fnparcela write Fnparcela;
    property rec_tipvend: WideString read Frec_tipvend write Frec_tipvend;
    property rec_numvend: Integer read Frec_numvend write Frec_numvend;
    property recibo: WideString read Frecibo write Frecibo;
    property historico: WideString read Fhistorico write Fhistorico;

    property ValeDoc: TValeDocProgFid_List read FValeDoc write FValeDoc;
  end;

  TValeProgFid_List = array of TValeProgFid;

  TFormasPgtoProgFid = class
  private
    Fseqform: Integer;
    Fcodigo_ctrl: Integer;
    Fnome_ctrl: WideString;
    Fdocs: WideString;
    Fnumerodoc: WideString;
    Fdata_mov: WideString;
    Fdata_venc: WideString;
    Fvalor: Double;
    Fnparcela: Integer;
    Frec_tipvend: WideString;
    Frec_numvend: Integer;
    Frecibo: WideString;
    Fhistorico: WideString;
  public
    function Clone: TFormasPgtoProgFid;
    property seqform: Integer read Fseqform write Fseqform;
    property codigo_ctrl: Integer read Fcodigo_ctrl write Fcodigo_ctrl;
    property nome_ctrl: WideString read Fnome_ctrl write Fnome_ctrl;
    property docs: WideString read Fdocs write Fdocs; //d: dinheiro, cc: cartacao credito, cd: cartao deb, cr: crediario
    property numerodoc: WideString read Fnumerodoc write Fnumerodoc;
    property data_mov: WideString read Fdata_mov write Fdata_mov;
    property data_venc: WideString read Fdata_venc write Fdata_venc;
    property valor: Double read Fvalor write Fvalor;
    property nparcela: Integer read Fnparcela write Fnparcela;
    property rec_tipvend: WideString read Frec_tipvend write Frec_tipvend;
    property rec_numvend: Integer read Frec_numvend write Frec_numvend;
    property recibo: WideString read Frecibo write Frecibo;
    property historico: WideString read Fhistorico write Fhistorico;
  end;

  TFormasPgtoProgFid_List = array of TFormasPgtoProgFid;

  TDocumentoProg_Item = class
  private
    Fnitem: Integer;
    Ftipo: WideString;
    Fvltot_ped_item: Double;
    FProdutoProgFid: TProdutoProgFid;
    FVeiculoProgFid: TVeiculoProgFid;
  public
    destructor Destroy; override;
    function Clone: TDocumentoProg_Item;
    property nitem: Integer read Fnitem write Fnitem;
    property tipo: WideString read Ftipo write Ftipo;
    property vltot_ped_item: Double read Fvltot_ped_item write Fvltot_ped_item;
    property ProdutoProgFid: TProdutoProgFid read FProdutoProgFid write FProdutoProgFid;
    property VeiculoProgFid: TVeiculoProgFid read FVeiculoProgFid write FVeiculoProgFid;
  end;

  TDocumentoProg_Item_List = array of TDocumentoProg_Item;
  
  TDocumentoProgFid = class
  private
    Fndoc: Integer;
    Ftipo: WideString;
    Fdata: WideString;
    Fvalor_total: Double;
    Fvalor_dev: Double;
    Fvalor_vale: Double;
    Ftotal_pontos: Double;
    Ftotal_cashback: Double;
    FClienteProgFid: TClienteProgFid;
    FItens: TDocumentoProg_Item_List;
    FFormPag: TFormasPgtoProgFid_List;
    FDevolucao: TDevolucaoProgFid_List;
    FVale: TValeProgFid_List;
  public
    destructor Destroy; override;
    procedure SetLengthItens(ALength: Integer);
    procedure SetLengthFormaPag(ALength: Integer);
    procedure SetLengthDevolucao(ALength: Integer);
    procedure SetLengthVale(ALength: Integer);

    property ndoc: Integer read Fndoc write Fndoc;
    property tipo: WideString read Ftipo write Ftipo;
    property data: WideString read Fdata write Fdata;
    property valor_total: Double read Fvalor_total write Fvalor_total;
    property valor_dev: Double read Fvalor_dev write Fvalor_dev;
    property valor_vale: Double read Fvalor_vale write Fvalor_vale;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
    property total_cashback: Double read Ftotal_cashback write Ftotal_cashback;

    property ClienteProgFid: TClienteProgFid read FClienteProgFid write FClienteProgFid;
    property Itens: TDocumentoProg_Item_List read FItens write FItens;
    property FormPag: TFormasPgtoProgFid_List read FFormPag write FFormPag;
    property Devolucao: TDevolucaoProgFid_List read FDevolucao write FDevolucao;
    property Vale: TValeProgFid_List read FVale write FVale;
  end;

  TClasseFaixaPontosValor = class
  private
    Fdesc_classe: WideString;
    Fnome: WideString;
    Fcond_ini: WideString;
    Fcond_fim: WideString;
    Fvalor_ini: Double;
    Fvalor_fim: Double;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property nome: WideString read Fnome write Fnome;
    property cond_ini: WideString read Fcond_ini write Fcond_ini;
    property cond_fim: WideString read Fcond_fim write Fcond_fim;
    property valor_ini: Double read Fvalor_ini write Fvalor_ini;
    property valor_fim: Double read Fvalor_fim write Fvalor_fim;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseAssiduidade = class
  private
    Fdesc_classe: WideString;
    Fnome: WideString;
    Fvalor: WideString;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property nome: WideString read Fnome write Fnome;
    property valor: WideString read Fvalor write Fvalor;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFaixaAssiduidade = class
  private
    Fdesc_classe: WideString; 
    Fnome: WideString;
    Fvalor: WideString;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property nome: WideString read Fnome write Fnome;
    property valor: WideString read Fvalor write Fvalor;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFormaPag = class
  private
    Fdesc_classe: WideString;
    Fnome: WideString;
    Fvalor: WideString;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property nome: WideString read Fnome write Fnome;
    property valor: WideString read Fvalor write Fvalor;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseRecPrest = class
  private
    Fdesc_classe: WideString;
    Fnome: WideString;
    Fdata_venc: WideString;
    Fdata_quit: WideString;
    Fdias_carencia: Integer;
    Fvalor: WideString;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property nome: WideString read Fnome write Fnome;
    property data_venc: WideString read Fdata_venc write Fdata_venc;
    property data_quit: WideString read Fdata_quit write Fdata_quit;
    property dias_carencia: Integer read Fdias_carencia write Fdias_carencia;
    property valor: WideString read Fvalor write Fvalor;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseCashback_Item = class
  private
  	Fnitem: Integer;
    Ftipo: WideString;
    Fvltot_ped_item: Double;
    Fvl_cashback: Double;
    FProdutoProgFid: TProdutoProgFid;
    FVeiculoProgFid: TVeiculoProgFid;
  public
  	function Clone: TClasseCashback_Item;
  	property nitem: Integer read Fnitem write Fnitem;
    property tipo: WideString read Ftipo write Ftipo;
    property vltot_ped_item: Double read Fvltot_ped_item write Fvltot_ped_item;
    property vl_cashback: Double read Fvl_cashback write Fvl_cashback;
    property ProdutoProgFid: TProdutoProgFid read FProdutoProgFid write FProdutoProgFid;
    property VeiculoProgFid: TVeiculoProgFid read FVeiculoProgFid write FVeiculoProgFid;
  end;

  TClasseCashbackItem_List = array of TClasseCashback_Item;

  TClasseCashback = class
  private
  	Fdesc_classe: WideString;
    Fvl_cashback: Double;
    FItens: TClasseCashbackItem_List;
  public
  	destructor Destroy; override;
  	procedure SetLengthItens(ALength: Integer);
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property vl_cashback: Double read Fvl_cashback write Fvl_cashback;
    property Itens: TClasseCashbackItem_List read FItens write FItens;
  end;

  TClasseFaixaValorCompra = class
  private
    Fdesc_classe: WideString;
    Fnome: WideString;
    Fcond_ini: WideString;
    Fcond_fim: WideString;
    Fvalor_ini: Double;
    Fvalor_fim: Double;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property nome: WideString read Fnome write Fnome;
    property cond_ini: WideString read Fcond_ini write Fcond_ini;
    property cond_fim: WideString read Fcond_fim write Fcond_fim;
    property valor_ini: Double read Fvalor_ini write Fvalor_ini;
    property valor_fim: Double read Fvalor_fim write Fvalor_fim;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFaixaPontosProduto_Item = class
  private
    Fnome: WideString;
    Fgrupo_prod: Integer;
    Fcod_prod: WideString;
    Fdescricao: WideString;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    function Clone: TClasseFaixaPontosProduto_Item;
    property nome: WideString read Fnome write Fnome;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: WideString read Fcod_prod write Fcod_prod;
    property descricao: WideString read Fdescricao write Fdescricao;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFaixaPontosProduto_Item_List = array of TClasseFaixaPontosProduto_Item;

  TClasseFaixaPontosProduto = class
  private
    Fdesc_classe: WideString;
    Ftotal_pontos: Double;
    FProduto: TClasseFaixaPontosProduto_Item_List;
  public
    destructor Destroy; override;
    procedure SetLengthItens(ALength: Integer);
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
    property Produto: TClasseFaixaPontosProduto_Item_List read FProduto write FProduto;
  end;

  TClasseFaixaPontosGrupoProduto_Item = class
  private
    Fnome: WideString;
    Fgrupo_prod: Integer;
    Fdescricao: WideString;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    function Clone: TClasseFaixaPontosGrupoProduto_Item;
    property nome: WideString read Fnome write Fnome;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property descricao: WideString read Fdescricao write Fdescricao;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFaixaPontosGrupoProduto_Item_List = array of TClasseFaixaPontosGrupoProduto_Item;

  TClasseFaixaPontosGrupoProduto = class
  private
    Fdesc_classe: WideString;
    Ftotal_pontos: Double;
    FGrupo: TClasseFaixaPontosGrupoProduto_Item_List;
  public
    destructor Destroy; override;
    procedure SetLengthItens(ALength: Integer);
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
    property Grupo: TClasseFaixaPontosGrupoProduto_Item_List read FGrupo write FGrupo;
  end;

  TClasseFaixaPontosSubGrupoProduto_Item = class
  private
    Fnome: WideString;
    Fsub_g_prod: Integer;
    Fdescricao: WideString;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    function Clone: TClasseFaixaPontosSubGrupoProduto_Item;
    property nome: WideString read Fnome write Fnome;
    property sub_g_prod: Integer read Fsub_g_prod write Fsub_g_prod;
    property descricao: WideString read Fdescricao write Fdescricao;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFaixaPontosSubGrupoProduto_Item_List = array of TClasseFaixaPontosSubGrupoProduto_Item;

  TClasseFaixaPontosSubGrupoProduto = class
  private
    Fdesc_classe: WideString;
    Ftotal_pontos: Double;
    FSubGrupo: TClasseFaixaPontosSubGrupoProduto_Item_List;
  public
    destructor Destroy; override;
    procedure SetLengthItens(ALength: Integer);
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
    property SubGrupo: TClasseFaixaPontosSubGrupoProduto_Item_List read FSubGrupo write FSubGrupo;
  end;

  TClasseFaixaPontosMarcaProduto_Item = class
  private
    Fnome: WideString;
    Fcod_marca: Integer;
    Fdescricao: WideString;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    function Clone: TClasseFaixaPontosMarcaProduto_Item;
    property nome: WideString read Fnome write Fnome;
    property cod_marca: Integer read Fcod_marca write Fcod_marca;
    property descricao: WideString read Fdescricao write Fdescricao;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFaixaPontosMarcaProduto_Item_List = array of TClasseFaixaPontosMarcaProduto_Item;

  TClasseFaixaPontosMarcaProduto = class
  private
    Fdesc_classe: WideString;
    Ftotal_pontos: Double;
    FMarca: TClasseFaixaPontosMarcaProduto_Item_List;
  public
    destructor Destroy; override;
    procedure SetLengthItens(ALength: Integer);
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
    property Marca: TClasseFaixaPontosMarcaProduto_Item_List read FMarca write FMarca;
  end;

  TClasseFaixaPontosKitProduto_Item = class
  private
    Fnome: WideString;
    Fcodigo_kit: Integer;
    Fdescricao: WideString;
    Fvalor_calculado: Double;
    Fpontos: Double;
    Ftotal_pontos: Double;
  public
    function Clone: TClasseFaixaPontosKitProduto_Item;
    property nome: WideString read Fnome write Fnome;
    property codigo_kit: Integer read Fcodigo_kit write Fcodigo_kit;
    property descricao: WideString read Fdescricao write Fdescricao;
    property valor_calculado: Double read Fvalor_calculado write Fvalor_calculado;
    property pontos: Double read Fpontos write Fpontos;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
  end;

  TClasseFaixaPontosKitProduto_Item_List = array of TClasseFaixaPontosKitProduto_Item;

  TClasseFaixaPontosKitProduto = class
  private
    Fdesc_classe: WideString;
    Ftotal_pontos: Double;
    FKit: TClasseFaixaPontosKitProduto_Item_List;
  public
    destructor Destroy; override;
    procedure SetLengthItens(ALength: Integer);
    property desc_classe: WideString read Fdesc_classe write Fdesc_classe;
    property total_pontos: Double read Ftotal_pontos write Ftotal_pontos;
    property Kit: TClasseFaixaPontosKitProduto_Item_List read FKit write FKit;
  end;

  TCalculoParametros = class
  private
    FdocumentoProgFid: TDocumentoProgFid;
    Fparam_classe_faixa_pontos_valor: TClasseFaixaPontosValor;
    Fparam_classe_assiduidade: TClasseAssiduidade;
    Fparam_classe_faixa_assiduidade: TClasseFaixaAssiduidade;
    Fparam_classe_faixa_valor_compra: TClasseFaixaValorCompra;
    Fparam_classe_faixa_pontos_produto: TClasseFaixaPontosProduto;
    Fparam_classe_faixa_pontos_grupo_produto: TClasseFaixaPontosGrupoProduto;
    Fparam_classe_faixa_pontos_subgrupo_produto: TClasseFaixaPontosSubGrupoProduto;
    Fparam_classe_faixa_pontos_marca_produto: TClasseFaixaPontosMarcaProduto;
    Fparam_classe_faixa_pontos_kit_produto: TClasseFaixaPontosKitProduto;
    Fparam_classe_form_pag: TClasseFormaPag;
    Fparam_classe_rec_prest: TClasseRecPrest;
    Fparam_classe_cashback: TClasseCashback;
  public
    constructor Create(pCriarObj: boolean = false;
     vparam_classe_faixa_pontos_valor: boolean = false;
     vparam_classe_assiduidade: boolean = false;
     vparam_classe_faixa_assiduidade: boolean = false;
     vparam_classe_faixa_valor_compra: boolean = false;
     vparam_classe_faixa_pontos_produto: boolean = false;
     vparam_classe_faixa_pontos_grupo_produto: boolean = false;
     vparam_classe_faixa_pontos_subgrupo_produto: boolean = false;
     vparam_classe_faixa_pontos_marca_produto: boolean = false;
     vparam_classe_faixa_pontos_kit_produto: boolean = false;
     vparam_classe_form_pag: boolean = false;
     vparam_classe_rec_prest: boolean = false;
     vparam_classe_cashback: boolean = false);
    destructor Destroy; override;
    function Clone: TCalculoParametros; overload;
    property documentoProgFid		       	                : TDocumentoProgFid    	            read FdocumentoProgFid                           write FdocumentoProgFid;
    property param_classe_faixa_pontos_valor            : TClasseFaixaPontosValor           read Fparam_classe_faixa_pontos_valor            write Fparam_classe_faixa_pontos_valor;
    property param_classe_assiduidade                   : TClasseAssiduidade                read Fparam_classe_assiduidade                   write Fparam_classe_assiduidade;
    property param_classe_faixa_assiduidade             : TClasseFaixaAssiduidade           read Fparam_classe_faixa_assiduidade             write Fparam_classe_faixa_assiduidade;
    property param_classe_faixa_valor_compra            : TClasseFaixaValorCompra           read Fparam_classe_faixa_valor_compra            write Fparam_classe_faixa_valor_compra;
    property param_classe_faixa_pontos_produto          : TClasseFaixaPontosProduto         read Fparam_classe_faixa_pontos_produto          write Fparam_classe_faixa_pontos_produto;
    property param_classe_faixa_pontos_grupo_produto    : TClasseFaixaPontosGrupoProduto    read Fparam_classe_faixa_pontos_grupo_produto    write Fparam_classe_faixa_pontos_grupo_produto;
    property param_classe_faixa_pontos_subgrupo_produto : TClasseFaixaPontosSubGrupoProduto read Fparam_classe_faixa_pontos_subgrupo_produto write Fparam_classe_faixa_pontos_subgrupo_produto;
    property param_classe_faixa_pontos_marca_produto    : TClasseFaixaPontosMarcaProduto    read Fparam_classe_faixa_pontos_marca_produto    write Fparam_classe_faixa_pontos_marca_produto;
    property param_classe_faixa_pontos_kit_produto      : TClasseFaixaPontosKitProduto      read Fparam_classe_faixa_pontos_kit_produto      write Fparam_classe_faixa_pontos_kit_produto;
    property param_classe_form_pag                      : TClasseFormaPag                   read Fparam_classe_form_pag                      write Fparam_classe_form_pag;
    property param_classe_rec_prest                     : TClasseRecPrest                   read Fparam_classe_rec_prest                     write Fparam_classe_rec_prest;
  	property param_classe_cashback                      : TClasseCashback                   read Fparam_classe_cashback                      write Fparam_classe_cashback;
  end;

  TCalculo = class
  private
    Fparametros: TCalculoParametros;
    FCalculado: Boolean;
  public
    constructor Create;
    function Calcular: Boolean;

    property parametros: TCalculoParametros read Fparametros write Fparametros;
    property Calculado: Boolean read FCalculado write FCalculado;
  end;

implementation

uses
  SysUtils, StrUtils;

{ TCalculo }

function TCalculo.Calcular: Boolean;
begin
  Result := True;
  try
    if not Assigned(parametros) then
      raise Exception.Create('Error not Assigned(params)');

    if not Assigned(parametros.documentoProgFid) then
      raise Exception.Create('Error not Assigned(params.documentoProgFid)');

    if (not Assigned(parametros.param_classe_faixa_pontos_valor)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_faixa_pontos_valor)');

    if (not Assigned(parametros.param_classe_assiduidade)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_assiduidade)');

    if (not Assigned(parametros.param_classe_faixa_assiduidade)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_faixa_assiduidade)');

    if (not Assigned(parametros.param_classe_faixa_pontos_produto)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_faixa_pontos_produto)');

    if (not Assigned(parametros.param_classe_faixa_pontos_grupo_produto)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_faixa_pontos_grupo_produto)');

    if (not Assigned(parametros.param_classe_faixa_pontos_subgrupo_produto)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_faixa_pontos_subgrupo_produto)');

    if (not Assigned(parametros.param_classe_faixa_pontos_marca_produto)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_faixa_pontos_marca_produto)');

    if (not Assigned(parametros.param_classe_faixa_pontos_kit_produto)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_faixa_pontos_kit_produto)');

    if (not Assigned(parametros.param_classe_form_pag)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_form_pag)');

    if (not Assigned(parametros.param_classe_rec_prest)) then
      raise Exception.Create('Error not Assigned pametros(param_classe_rec_prest)');
  except on E: Exception do
    begin
      Result := False;
//      Freturn.texto := 'Erro ' + e.Message;
    end;
  end;
end;

constructor TCalculo.Create;
begin
//  Freturn := TCalculoRetorno.Create;
  Fparametros := TCalculoParametros.Create;
//  Fparametros2 := TCalculoParametros2.Create;
//  ret1 := TCalculoRetorno.Create;

//  SetLength(ret2, 2);
//  ret2[Low(ret2)] := Freturn;
//  ret2[High(ret2)] := ret1;
end;

{ TDocumentoProgFid }

destructor TDocumentoProgFid.Destroy;
var
 I: Integer;
begin
  if Assigned(FClienteProgFid) then
    FreeAndNil(FClienteProgFid);
  if Assigned(FItens) then
   for I := 0 to Length(FItens) - 1 do
     FreeAndNil(FItens[I]);

  if Assigned(FFormPag) then
   for I := 0 to Length(FFormPag) - 1 do
     FreeAndNil(FFormPag[I]);
     
  if Assigned(FDevolucao) then
   for I := 0 to Length(FDevolucao) - 1 do
     FreeAndNil(FDevolucao[I]);

  if Assigned(FVale) then
    for I := 0 to Length(FVale) - 1 do
      FreeAndNil(FVale[I]);
      
  inherited;
end;

procedure TDocumentoProgFid.SetLengthDevolucao(ALength: Integer);
begin
  SetLength(FDevolucao, ALength);
end;

procedure TDocumentoProgFid.SetLengthFormaPag(ALength: Integer);
begin
  SetLength(FFormPag, ALength);
end;

procedure TDocumentoProgFid.SetLengthItens(ALength: Integer);
begin
  SetLength(FItens, ALength);
end;

procedure TDocumentoProgFid.SetLengthVale(ALength: Integer);
begin
  SetLength(FVale, ALength);
end;

{ TCalculoParametros }

function TCalculoParametros.Clone: TCalculoParametros;
var
 I: Integer;
begin
  Result := TCalculoParametros.Create(true,
    Self.param_classe_faixa_pontos_valor <> nil,
    Self.param_classe_assiduidade <> nil,
    Self.param_classe_faixa_assiduidade <> nil,
    Self.param_classe_faixa_valor_compra <> nil,
    Self.param_classe_faixa_pontos_produto <> nil,
    Self.param_classe_faixa_pontos_grupo_produto <> nil,
    Self.param_classe_faixa_pontos_subgrupo_produto <> nil,
    Self.param_classe_faixa_pontos_marca_produto <> nil,
    Self.param_classe_faixa_pontos_kit_produto <> nil,
    Self.param_classe_form_pag <> nil,
    Self.param_classe_rec_prest <> nil,
    Self.param_classe_cashback <> nil);

  with Result do
  begin
    FdocumentoProgFid.ndoc                            := Self.documentoProgFid.ndoc;
    FdocumentoProgFid.tipo                            := Self.documentoProgFid.tipo;
    FdocumentoProgFid.data                            := Self.documentoProgFid.data;
    FdocumentoProgFid.valor_total                     := Self.documentoProgFid.valor_total;
    FdocumentoProgFid.valor_dev                       := Self.documentoProgFid.valor_dev;
    FdocumentoProgFid.valor_vale 							        := Self.documentoProgFid.valor_vale;
    FDocumentoProgFid.total_pontos                    := Self.documentoProgFid.total_pontos;
    FDocumentoProgFid.total_cashback                  := Self.documentoProgFid.total_cashback;
    FdocumentoProgFid.ClienteProgFid                  := Self.documentoProgFid.ClienteProgFid.Clone;

    //Itens Produtos (Grupo, SubGrupo, Marca, Kits) e Veiculos
    FDocumentoProgFid.SetLengthItens(Length(Self.documentoProgFid.Itens));
    for I := Low(FDocumentoProgFid.Itens) to High(FDocumentoProgFid.Itens) do
    begin
      FDocumentoProgFid.Itens[I]                      := Self.documentoProgFid.Itens[I].Clone;
      FDocumentoProgFid.Itens[I].nitem                := I + 1;
    end;

    //Formas de pagamento
    FdocumentoProgFid.SetLengthFormaPag(Length(Self.documentoProgFid.FormPag));
    for I := Low(FDocumentoProgFid.FormPag) to High(FDocumentoProgFid.FormPag) do
      FDocumentoProgFid.FormPag[I]                      := Self.documentoProgFid.FormPag[I].Clone;

    //Devoluções
    FdocumentoProgFid.SetLengthDevolucao(Length(Self.documentoProgFid.Devolucao));
    for I := Low(FDocumentoProgFid.Devolucao) to High(FDocumentoProgFid.Devolucao) do
      FDocumentoProgFid.Devolucao[I]                      := Self.documentoProgFid.Devolucao[I].Clone;

    //Vale
    FdocumentoProgFid.SetLengthVale(Length(Self.documentoProgFid.Vale));
    for I := Low(FDocumentoProgFid.Vale) to High(FDocumentoProgFid.Vale) do
      FDocumentoProgFid.Vale[I]                      := Self.documentoProgFid.Vale[I].Clone;

    //Classe faixa de pontos por valor
    if Self.param_classe_faixa_pontos_valor <> nil then
    begin
      Fparam_classe_faixa_pontos_valor.desc_classe 	  := Self.param_classe_faixa_pontos_valor.desc_classe;
      Fparam_classe_faixa_pontos_valor.nome 			    := Self.param_classe_faixa_pontos_valor.nome;
      Fparam_classe_faixa_pontos_valor.cond_ini 		  := Self.param_classe_faixa_pontos_valor.cond_ini;
      Fparam_classe_faixa_pontos_valor.cond_fim 		  := Self.param_classe_faixa_pontos_valor.cond_fim;
      Fparam_classe_faixa_pontos_valor.valor_ini 		  := Self.param_classe_faixa_pontos_valor.valor_ini;
      Fparam_classe_faixa_pontos_valor.valor_fim 		  := Self.param_classe_faixa_pontos_valor.valor_fim;
      Fparam_classe_faixa_pontos_valor.valor_calculado:= Self.param_classe_faixa_pontos_valor.valor_calculado;
      Fparam_classe_faixa_pontos_valor.pontos 			  := Self.param_classe_faixa_pontos_valor.pontos;
      Fparam_classe_faixa_pontos_valor.total_pontos 	:= Self.param_classe_faixa_pontos_valor.total_pontos;
    end;

    //Classe assiduidade
    if Self.param_classe_assiduidade <> nil then
    begin
      Fparam_classe_assiduidade.desc_classe 		    	:= Self.param_classe_assiduidade.desc_classe;
      Fparam_classe_assiduidade.nome 					      	:= Self.param_classe_assiduidade.nome;
      Fparam_classe_assiduidade.valor 			  	    	:= Self.param_classe_assiduidade.valor;
      Fparam_classe_assiduidade.pontos 					      := Self.param_classe_assiduidade.pontos;
      Fparam_classe_assiduidade.total_pontos 	  	  	:= Self.param_classe_assiduidade.total_pontos;
    end;

    //Classe faixa de pontos por assiduidade
    if Self.param_classe_faixa_assiduidade <> nil then
    begin
      Fparam_classe_faixa_assiduidade.desc_classe 	  := Self.param_classe_faixa_assiduidade.desc_classe;
      Fparam_classe_faixa_assiduidade.nome 				    := Self.param_classe_faixa_assiduidade.nome;
      Fparam_classe_faixa_assiduidade.valor 			    := Self.param_classe_faixa_assiduidade.valor;
      Fparam_classe_faixa_assiduidade.valor_calculado := Self.param_classe_faixa_assiduidade.valor_calculado;
      Fparam_classe_faixa_assiduidade.pontos 			    := Self.param_classe_faixa_assiduidade.pontos;
      Fparam_classe_faixa_assiduidade.total_pontos 	  := Self.param_classe_faixa_assiduidade.total_pontos;
    end;

    //Classe faixa valor de compra
    if Self.param_classe_faixa_valor_compra <> nil then
    begin
      Fparam_classe_faixa_valor_compra.desc_classe 	  := Self.param_classe_faixa_valor_compra.desc_classe;
      Fparam_classe_faixa_valor_compra.nome 			    := Self.param_classe_faixa_valor_compra.nome;
      Fparam_classe_faixa_valor_compra.cond_ini 	  	:= Self.param_classe_faixa_valor_compra.cond_ini;
      Fparam_classe_faixa_valor_compra.cond_fim 		  := Self.param_classe_faixa_valor_compra.cond_fim;
      Fparam_classe_faixa_valor_compra.valor_ini 		  := Self.param_classe_faixa_valor_compra.valor_ini;
      Fparam_classe_faixa_valor_compra.valor_fim 	  	:= Self.param_classe_faixa_valor_compra.valor_fim;
      Fparam_classe_faixa_valor_compra.valor_calculado := Self.param_classe_faixa_valor_compra.valor_calculado;
      Fparam_classe_faixa_valor_compra.pontos 			  := Self.param_classe_faixa_valor_compra.pontos;
      Fparam_classe_faixa_valor_compra.total_pontos 	:= Self.param_classe_faixa_valor_compra.total_pontos;
    end;

    //Classe form pag
    if Self.param_classe_form_pag <> nil then
    begin
      Fparam_classe_form_pag.desc_classe 		      	  := Self.param_classe_form_pag.desc_classe;
      Fparam_classe_form_pag.nome 					      	  := Self.param_classe_form_pag.nome;
      Fparam_classe_form_pag.valor 			  	    	    := Self.param_classe_form_pag.valor;
      Fparam_classe_form_pag.pontos 					        := Self.param_classe_form_pag.pontos;
      Fparam_classe_form_pag.total_pontos 	  	  	  := Self.param_classe_form_pag.total_pontos;
    end;

    //Classe rec prest
    if Self.param_classe_rec_prest <> nil then
    begin
      Fparam_classe_rec_prest.desc_classe 		        := Self.param_classe_rec_prest.desc_classe;
      Fparam_classe_rec_prest.nome 					      	  := Self.param_classe_rec_prest.nome;
      Fparam_classe_rec_prest.data_venc					      := Self.param_classe_rec_prest.data_venc;
      Fparam_classe_rec_prest.data_quit					      := Self.param_classe_rec_prest.data_quit;
      Fparam_classe_rec_prest.dias_carencia           := Self.param_classe_rec_prest.dias_carencia;
      Fparam_classe_rec_prest.valor 			  	    	  := Self.param_classe_rec_prest.valor;
      Fparam_classe_rec_prest.pontos 					        := Self.param_classe_rec_prest.pontos;
      Fparam_classe_rec_prest.total_pontos 	  	  	  := Self.param_classe_rec_prest.total_pontos;
    end;

    //Classe faixa pontos por produto
    if Self.param_classe_faixa_pontos_produto <> nil then
    begin
      Fparam_classe_faixa_pontos_produto.desc_classe  := Self.param_classe_faixa_pontos_produto.desc_classe;

      Fparam_classe_faixa_pontos_produto.SetLengthItens(Length(Self.param_classe_faixa_pontos_produto.Produto));
      for I := Low(Fparam_classe_faixa_pontos_produto.Produto) to High(Fparam_classe_faixa_pontos_produto.Produto) do
      begin
        Fparam_classe_faixa_pontos_produto.Produto[I] := Self.param_classe_faixa_pontos_produto.Produto[I].Clone;
        Fparam_classe_faixa_pontos_produto.total_pontos :=
          Fparam_classe_faixa_pontos_produto.total_pontos +
          Fparam_classe_faixa_pontos_produto.Produto[I].total_pontos;
      end;
    end;

    //Classe faixa pontos por grupos produtos
    if Self.param_classe_faixa_pontos_grupo_produto <> nil then
    begin
      Fparam_classe_faixa_pontos_grupo_produto.desc_classe := Self.param_classe_faixa_pontos_grupo_produto.desc_classe;

      Fparam_classe_faixa_pontos_grupo_produto.SetLengthItens(Length(Self.param_classe_faixa_pontos_grupo_produto.Grupo));
      for I := Low(Fparam_classe_faixa_pontos_grupo_produto.Grupo) to High(Fparam_classe_faixa_pontos_grupo_produto.Grupo) do
      begin
        Fparam_classe_faixa_pontos_grupo_produto.Grupo[I] := Self.param_classe_faixa_pontos_grupo_produto.Grupo[I].Clone;
        Fparam_classe_faixa_pontos_grupo_produto.total_pontos :=
          Fparam_classe_faixa_pontos_grupo_produto.total_pontos +
          Fparam_classe_faixa_pontos_grupo_produto.Grupo[I].total_pontos;
      end;
    end;

    //Classe faixa pontos por subgrupos produtos
    if Self.param_classe_faixa_pontos_subgrupo_produto <> nil then
    begin
      Fparam_classe_faixa_pontos_subgrupo_produto.desc_classe := Self.param_classe_faixa_pontos_subgrupo_produto.desc_classe;

      Fparam_classe_faixa_pontos_subgrupo_produto.SetLengthItens(Length(Self.param_classe_faixa_pontos_subgrupo_produto.SubGrupo));
      for I := Low(Fparam_classe_faixa_pontos_subgrupo_produto.SubGrupo) to High(Fparam_classe_faixa_pontos_subgrupo_produto.SubGrupo) do
      begin
        Fparam_classe_faixa_pontos_subgrupo_produto.SubGrupo[I] := Self.param_classe_faixa_pontos_subgrupo_produto.SubGrupo[I].Clone;
        Fparam_classe_faixa_pontos_subgrupo_produto.total_pontos :=
          Fparam_classe_faixa_pontos_subgrupo_produto.total_pontos +
          Fparam_classe_faixa_pontos_subgrupo_produto.SubGrupo[I].total_pontos;
      end;
    end;

    //Classe faixa pontos por marca produtos
    if Self.param_classe_faixa_pontos_marca_produto <> nil then
    begin
      Fparam_classe_faixa_pontos_marca_produto.desc_classe := Self.param_classe_faixa_pontos_marca_produto.desc_classe;

      Fparam_classe_faixa_pontos_marca_produto.SetLengthItens(Length(Self.param_classe_faixa_pontos_marca_produto.Marca));
      for I := Low(Fparam_classe_faixa_pontos_marca_produto.Marca) to High(Fparam_classe_faixa_pontos_marca_produto.Marca) do
      begin
        Fparam_classe_faixa_pontos_marca_produto.Marca[I] := Self.param_classe_faixa_pontos_marca_produto.Marca[I].Clone;
        Fparam_classe_faixa_pontos_marca_produto.total_pontos :=
          Fparam_classe_faixa_pontos_marca_produto.total_pontos +
          Fparam_classe_faixa_pontos_marca_produto.Marca[I].total_pontos;
      end;
    end;

    //Classe faixa pontos por kits produtos
    if Self.param_classe_faixa_pontos_kit_produto <> nil then
    begin
      Fparam_classe_faixa_pontos_kit_produto.desc_classe := Self.param_classe_faixa_pontos_kit_produto.desc_classe;

      Fparam_classe_faixa_pontos_kit_produto.SetLengthItens(Length(Self.param_classe_faixa_pontos_kit_produto.Kit));
      for I := Low(Fparam_classe_faixa_pontos_kit_produto.Kit) to High(Fparam_classe_faixa_pontos_kit_produto.Kit) do
      begin
        Fparam_classe_faixa_pontos_kit_produto.Kit[I] := Self.param_classe_faixa_pontos_kit_produto.Kit[I].Clone;
        Fparam_classe_faixa_pontos_kit_produto.total_pontos :=
          Fparam_classe_faixa_pontos_kit_produto.total_pontos +
          Fparam_classe_faixa_pontos_kit_produto.Kit[I].total_pontos;
      end;
    end;

    //Classe cashback
    if Self.param_classe_cashback <> nil then
    begin
      Fparam_classe_cashback.desc_classe := Self.param_classe_cashback.desc_classe;

      Fparam_classe_cashback.SetLengthItens(Length(Self.param_classe_cashback.Itens));
      for I := Low(Fparam_classe_cashback.Itens) to High(Fparam_classe_cashback.Itens) do
      begin
      	Fparam_classe_cashback.Itens[I] := Self.param_classe_cashback.Itens[I].Clone;
        Fparam_classe_cashback.vl_cashback :=
        	Fparam_classe_cashback.vl_cashback +
          Fparam_classe_cashback.Itens[I].vl_cashback;
      end;
    end;
  end;
end;

constructor TCalculoParametros.Create(pCriarObj: boolean = false;
 vparam_classe_faixa_pontos_valor: boolean = false;
 vparam_classe_assiduidade: boolean = false;
 vparam_classe_faixa_assiduidade: boolean = false;
 vparam_classe_faixa_valor_compra: boolean = false;
 vparam_classe_faixa_pontos_produto: boolean = false;
 vparam_classe_faixa_pontos_grupo_produto: boolean = false;
 vparam_classe_faixa_pontos_subgrupo_produto: boolean = false;
 vparam_classe_faixa_pontos_marca_produto: boolean = false;
 vparam_classe_faixa_pontos_kit_produto: boolean = false;
 vparam_classe_form_pag: boolean = false;
 vparam_classe_rec_prest: boolean = false;
 vparam_classe_cashback: boolean = false);
begin
  FdocumentoProgFid := TDocumentoProgFid.Create;
  FdocumentoProgFid.ClienteProgFid := TClienteProgFid.Create;
  if pCriarObj then
  begin
    if vparam_classe_faixa_pontos_valor then
      Fparam_classe_faixa_pontos_valor := TClasseFaixaPontosValor.Create;
    if vparam_classe_assiduidade then
      Fparam_classe_assiduidade := TClasseAssiduidade.Create;
    if vparam_classe_faixa_assiduidade then
      Fparam_classe_faixa_assiduidade := TClasseFaixaAssiduidade.Create;
    if vparam_classe_faixa_valor_compra then
      Fparam_classe_faixa_valor_compra := TClasseFaixaValorCompra.Create;
    if vparam_classe_form_pag then
      Fparam_classe_form_pag := TClasseFormaPag.Create;
    if vparam_classe_rec_prest then
      Fparam_classe_rec_prest := TClasseRecPrest.Create;
    if vparam_classe_faixa_pontos_produto then
      Fparam_classe_faixa_pontos_produto := TClasseFaixaPontosProduto.Create;
    if vparam_classe_faixa_pontos_grupo_produto then
      Fparam_classe_faixa_pontos_grupo_produto := TClasseFaixaPontosGrupoProduto.Create;
    if vparam_classe_faixa_pontos_subgrupo_produto then
      Fparam_classe_faixa_pontos_subgrupo_produto := TClasseFaixaPontosSubGrupoProduto.Create;
    if vparam_classe_faixa_pontos_marca_produto then
      Fparam_classe_faixa_pontos_marca_produto := TClasseFaixaPontosMarcaProduto.Create;
    if vparam_classe_faixa_pontos_kit_produto then
      Fparam_classe_faixa_pontos_kit_produto := TClasseFaixaPontosKitProduto.Create;
    if vparam_classe_cashback then
      Fparam_classe_cashback := TClasseCashback.Create;
  end;
end;

destructor TCalculoParametros.Destroy;
begin
  if Assigned(FdocumentoProgFid) then
    FreeAndNil(FdocumentoProgFid);

  if Assigned(Fparam_classe_faixa_pontos_valor) then
    FreeAndNil(Fparam_classe_faixa_pontos_valor);

 if Assigned(Fparam_classe_assiduidade) then
    FreeAndNil(Fparam_classe_assiduidade);

 if Assigned(Fparam_classe_faixa_assiduidade) then
    FreeAndNil(Fparam_classe_faixa_assiduidade);

 if Assigned(Fparam_classe_faixa_valor_compra) then
    FreeAndNil(Fparam_classe_faixa_valor_compra);

 if Assigned(Fparam_classe_form_pag) then
    FreeAndNil(Fparam_classe_form_pag);

 if Assigned(Fparam_classe_rec_prest) then
    FreeAndNil(Fparam_classe_rec_prest);

 if Assigned(Fparam_classe_faixa_valor_compra) then
   FreeAndNil(Fparam_classe_faixa_valor_compra);

 if Assigned(Fparam_classe_faixa_pontos_produto) then
   FreeAndNil(Fparam_classe_faixa_pontos_produto);

 if Assigned(Fparam_classe_faixa_pontos_grupo_produto) then
   FreeAndNil(Fparam_classe_faixa_pontos_grupo_produto);

 if Assigned(Fparam_classe_faixa_pontos_subgrupo_produto) then
   FreeAndNil(Fparam_classe_faixa_pontos_subgrupo_produto);

 if Assigned(Fparam_classe_faixa_pontos_marca_produto) then
   FreeAndNil(Fparam_classe_faixa_pontos_marca_produto);

 if Assigned(Fparam_classe_faixa_pontos_kit_produto) then
   FreeAndNil(Fparam_classe_faixa_pontos_kit_produto);

  inherited;
end;

{ TClienteProgFid }

function TClienteProgFid.Clone: TClienteProgFid;
begin
  Result := TClienteProgFid.Create;
  with Result do
  begin
    cod_cliente := Self.cod_cliente;
    nome_cliente := trim(Self.nome_cliente);
    razao := trim(Self.razao);
    cpf_cnpj := trim(Self.cpf_cnpj);
    status_f := trim(Self.status_f);
    clultimacompra := trim(Self.clultimacompra);
  end;
end;

{ TDocumentoProg_Item }

function TDocumentoProg_Item.Clone: TDocumentoProg_Item;
begin
  Result := TDocumentoProg_Item.Create;
  with Result do
  begin
    nitem := Self.nitem;
    tipo := Self.tipo;
    vltot_ped_item := Self.vltot_ped_item;
    if (trim(tipo) = 'REQ') or (trim(tipo) = 'OS') or (trim(tipo) = 'DEV') then
      ProdutoProgFid := Self.ProdutoProgFid.Clone
    else
      VeiculoProgFid := Self.VeiculoProgFid.Clone;
  end;
end;

destructor TDocumentoProg_Item.Destroy;
begin
  if Assigned(FProdutoProgFid) then
    FreeAndNil(FProdutoProgFid);
  if Assigned(FVeiculoProgFid) then
    FreeAndNil(FVeiculoProgFid); 
  inherited;
end;

{ TProdutoProgFid }

function TProdutoProgFid.Clone: TProdutoProgFid;
begin
  Result := TProdutoProgFid.Create;
  with Result do
  begin
    cod_prod := Self.cod_prod;
    descricao := trim(Self.descricao);

    GradeProdFid := Self.GradeProdFid.Clone;
    GrupoProdFid := Self.GrupoProdFid.Clone;
    SubGrupoProdFid := Self.SubGrupoProdFid.Clone;
    MarcaProdFid := Self.MarcaProdFid.Clone;
    KitProdFid := Self.KitProdFid.Clone;
  end;
end;

destructor TProdutoProgFid.Destroy;
begin
  if Assigned(FGradeProdFid) then
    FreeAndNil(FGradeProdFid);
  if Assigned(FGrupoProdFid) then
    FreeAndNil(FGrupoProdFid);
  if Assigned(FSubGrupoProdFid) then
    FreeAndNil(FSubGrupoProdFid);
  if Assigned(FMarcaProdFid) then
    FreeAndNil(FMarcaProdFid);
  if Assigned(FKitProdFid) then
    FreeAndNil(FKitProdFid);
  inherited;
end;

{ TGrupoProdFid }

function TGrupoProdFid.Clone: TGrupoProdFid;
begin
  Result := TGrupoProdFid.Create;
  with Result do
  begin
    grupo_prod := Self.grupo_prod;
    descricao := trim(Self.descricao);
  end;
end;

{ TSubGrupoProdFid }

function TSubGrupoProdFid.Clone: TSubGrupoProdFid;
begin
  if Self = nil then
  begin
    Result := nil;
    exit;
  end;

  Result := TSubGrupoProdFid.Create;
  with Result do
  begin
    sub_grupo_prod := Self.sub_grupo_prod;
    descricao := trim(Self.descricao);
  end;
end;

{ TMarcaProdFid }

function TMarcaProdFid.Clone: TMarcaProdFid;
begin
  Result := TMarcaProdFid.Create;
  with Result do
  begin
    cod_marca := Self.cod_marca;
    descricao := trim(Self.descricao);
  end;
end;

{ TKitProdFid }

function TKitProdFid.Clone: TKitProdFid;
begin
  if Self = nil then
  begin
    Result := nil;
    exit;
  end;

  Result := TKitProdFid.Create;
  with Result do
  begin
    cod_kit := Self.cod_kit;
    descricao := trim(Self.descricao);
  end;
end;

{ TClasseFaixaPontosProduto }

destructor TClasseFaixaPontosProduto.Destroy;
var
 I: Integer;
begin
  if Assigned(FProduto) then
   for I := 0 to Length(FProduto) - 1 do
     FreeAndNil(FProduto[I]);
  inherited;
end;

procedure TClasseFaixaPontosProduto.SetLengthItens(ALength: Integer);
begin
  SetLength(FProduto, ALength);
end;

{ TClasseFaixaPontosProduto_Item }

function TClasseFaixaPontosProduto_Item.Clone: TClasseFaixaPontosProduto_Item;
begin
  Result := TClasseFaixaPontosProduto_Item.Create;
  with Result do
  begin
    nome := Self.nome;
    grupo_prod := Self.grupo_prod;
    cod_prod := Self.cod_prod;
    descricao := trim(Self.descricao);
    valor_calculado := Self.valor_calculado;
    pontos := Self.pontos;
    total_pontos := Self.total_pontos;
  end;
end;

{ TClasseFaixaPontosMarcaProduto_Item }

function TClasseFaixaPontosMarcaProduto_Item.Clone: TClasseFaixaPontosMarcaProduto_Item;
begin
  Result := TClasseFaixaPontosMarcaProduto_Item.Create;
  with Result do
  begin
    nome := Self.nome;
    cod_marca := Self.cod_marca;
    descricao := trim(Self.descricao);
    valor_calculado := Self.valor_calculado;
    pontos := Self.pontos;
    total_pontos := Self.total_pontos;
  end;
end;

{ TClasseFaixaPontosMarcaProduto }

destructor TClasseFaixaPontosMarcaProduto.Destroy;
var
 I: Integer;
begin
  if Assigned(FMarca) then
    for I := 0 to Length(FMarca) - 1 do
      FreeAndNil(FMarca[I]);
  inherited;
end;

procedure TClasseFaixaPontosMarcaProduto.SetLengthItens(ALength: Integer);
begin
  SetLength(FMarca, ALength);
end;

{ TClasseFaixaPontosGrupoProduto_Item }

function TClasseFaixaPontosGrupoProduto_Item.Clone: TClasseFaixaPontosGrupoProduto_Item;
begin
  Result := TClasseFaixaPontosGrupoProduto_Item.Create;
  with Result do
  begin
    nome := Self.nome;
    grupo_prod := Self.grupo_prod;
    descricao := trim(Self.descricao);
    valor_calculado := Self.valor_calculado;
    pontos := Self.pontos;
    total_pontos := Self.total_pontos;
  end;
end;

{ TClasseFaixaPontosGrupoProduto }

destructor TClasseFaixaPontosGrupoProduto.Destroy;
var
 I: Integer;
begin
  if Assigned(FGrupo) then
    for I := 0 to Length(FGrupo) - 1 do
      FreeAndNil(FGrupo[I]);
  inherited;
end;

procedure TClasseFaixaPontosGrupoProduto.SetLengthItens(ALength: Integer);
begin
  SetLength(FGrupo, ALength);
end;

{ TClasseFaixaPontosSubGrupoProduto_Item }

function TClasseFaixaPontosSubGrupoProduto_Item.Clone: TClasseFaixaPontosSubGrupoProduto_Item;
begin
  Result := TClasseFaixaPontosSubGrupoProduto_Item.Create;
  with Result do
  begin
    nome := Self.nome;
    sub_g_prod := Self.sub_g_prod;
    descricao := trim(Self.descricao);
    valor_calculado := Self.valor_calculado;
    pontos := Self.pontos;
    total_pontos := Self.total_pontos;
  end;
end;

{ TClasseFaixaPontosSubGrupoProduto }

destructor TClasseFaixaPontosSubGrupoProduto.Destroy;
var
 I: Integer;
begin
  if Assigned(FSubGrupo) then
    for I := 0 to Length(FSubGrupo) - 1 do
      FreeAndNil(FSubGrupo[I]);
  inherited;
end;

procedure TClasseFaixaPontosSubGrupoProduto.SetLengthItens(ALength: Integer);
begin
  SetLength(FSubGrupo, ALength);
end;

{ TClasseFaixaPontosKitProduto_Item }

function TClasseFaixaPontosKitProduto_Item.Clone: TClasseFaixaPontosKitProduto_Item;
begin
  Result := TClasseFaixaPontosKitProduto_Item.Create;
  with Result do
  begin
    nome := Self.nome;
    codigo_kit := Self.codigo_kit;
    descricao := trim(Self.descricao);
    valor_calculado := Self.valor_calculado;
    pontos := Self.pontos;
    total_pontos := Self.total_pontos;
  end;
end;

{ TClasseFaixaPontosKitProduto }

destructor TClasseFaixaPontosKitProduto.Destroy;
var
  I: Integer;
begin
  if Assigned(FKit) then
    for I := 0 to Length(FKit) - 1 do
      FreeAndNil(FKit[I]);
  inherited;
end;

procedure TClasseFaixaPontosKitProduto.SetLengthItens(ALength: Integer);
begin
  SetLength(FKit, ALength);
end;

{ TVeiculoProgFid }

function TVeiculoProgFid.Clone: TVeiculoProgFid;
begin
  Result := TVeiculoProgFid.Create;
  with Result do
  begin
    codigo := Self.codigo;
    placa := Self.placa;
    chassi := Self.chassi;
    descricao := Self.descricao;
  end;
end;

{ TFormasPgtoProgFid }

function TFormasPgtoProgFid.Clone: TFormasPgtoProgFid;
begin
  Result := TFormasPgtoProgFid.Create;
  with Result do
  begin
    seqform := Self.seqform;
    codigo_ctrl := Self.codigo_ctrl;
    nome_ctrl := Self.nome_ctrl;
    docs := Self.docs;
    numerodoc := Self.numerodoc;
    data_mov := Self.data_mov;
    data_venc := Self.data_venc;
    valor := Self.valor;
    nparcela := Self.nparcela;
    rec_tipvend := Self.rec_tipvend;
    rec_numvend := Self.rec_numvend;
    recibo := Self.recibo;
    historico := Self.historico;
  end;
end;

{ TDevolucaoProgFid }

function TDevolucaoProgFid.Clone: TDevolucaoProgFid;
var
  I: Integer;
begin
  Result := TDevolucaoProgFid.Create;
  with Result do
  begin
    coddev := Self.coddev;
    tipodev := Self.tipodev;
    data := Self.data;
    valor_dev := Self.valor_dev;

    SetLengthItens(Length(Self.Itens));
    for I := Low(Itens) to High(Itens) do
      Itens[I] := Self.Itens[I].Clone;
  end;
end;

destructor TDevolucaoProgFid.Destroy;
var
  I: Integer;
begin
  if Assigned(FItens) then
    for I := 0 to Length(FItens) - 1 do
      FreeAndNil(FItens[I]);
  inherited;
end;

procedure TDevolucaoProgFid.SetLengthItens(ALength: Integer);
begin
  SetLength(FItens, ALength);
end;

{ TGradeProdFid }

function TGradeProdFid.Clone: TGradeProdFid;
begin
  Result := TGradeProdFid.Create;
  with Result do
  begin
    cod_grade := Self.cod_grade;
    descricao := trim(Self.descricao);
  end;
end;

{ TDevolucaoProgFid_Item }

function TDevolucaoProgFid_Item.Clone: TDevolucaoProgFid_Item;
begin
  Result := TDevolucaoProgFid_Item.Create;
  with Result do
  begin
    nitem := Self.nitem;
    codigo := 0;
    chassi := '';
    placa := '';
    grupo_prod := 0;
    cod_prod := '';
    cod_grade := 0;
    if Self.codigo > 0 then
    begin
      codigo := Self.codigo;
      chassi := Self.chassi;
      placa := Self.placa;
    end
    else
    begin
      grupo_prod := Self.grupo_prod;
      cod_prod := Self.cod_prod;
      cod_grade := Self.cod_grade;
    end;
    descricao := trim(Self.descricao);
    vltot_dev_item := Self.vltot_dev_item;
  end;
end;

{ TValeProgFid }

function TValeProgFid.Clone: TValeProgFid;
var
  I: Integer;
begin
  Result := TValeProgFid.Create;
  with Result do
  begin
    seqform := Self.seqform;
    codigo_ctrl := Self.codigo_ctrl;
    nome_ctrl := Self.nome_ctrl;
    docs := Self.docs;
    numerodoc := Self.numerodoc;
    data_mov := Self.data_mov;
    data_venc := Self.data_venc;
    valor := Self.valor;
    nparcela := Self.nparcela;
    rec_tipvend := Self.rec_tipvend;
    rec_numvend := Self.rec_numvend;
    recibo := Self.recibo;
    historico := Self.historico;

    SetLengthItens(Length(Self.ValeDoc));
    for I := Low(ValeDoc) to High(ValeDoc) do
      ValeDoc[I] := Self.ValeDoc[I].Clone;
  end;
end;

procedure TValeProgFid.SetLengthItens(ALength: Integer);
begin
  SetLength(FValeDoc, ALength);
end;

{ TValeDocProgFid }

function TValeDocProgFid.Clone: TValeDocProgFid;
begin
  Result := TValeDocProgFid.Create;
  with Result do
  begin
    num_vale := Self.num_vale;
    historico_vale := Self.historico_vale;
    pontos_vale := Self.pontos_vale;
    valor_vale := Self.valor_vale;
  end;
end;

{ TClasseCashback }

destructor TClasseCashback.Destroy;
var
  I: Integer;
begin
  if Assigned(FItens) then
    for I := 0 to Length(FItens) - 1 do
      FreeAndNil(FItens[I]);
  inherited;
end;

procedure TClasseCashback.SetLengthItens(ALength: Integer);
begin
	SetLength(FItens, ALength);
end;

{ TClasseCashback_Item }

function TClasseCashback_Item.Clone: TClasseCashback_Item;
begin
	Result := TClasseCashback_Item.Create;
  with Result do
  begin
  	nitem := Self.nitem;
    tipo := Self.tipo;
    vltot_ped_item := Self.vltot_ped_item;
    vl_cashback := Self.vl_cashback;
  	if (trim(tipo) = 'REQ') or (trim(tipo) = 'OS') or (trim(tipo) = 'DEV') then
      ProdutoProgFid := Self.ProdutoProgFid.Clone
    else
      VeiculoProgFid := Self.VeiculoProgFid.Clone;
  end;
end;

end.
