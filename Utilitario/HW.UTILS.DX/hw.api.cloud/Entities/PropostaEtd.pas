unit PropostaEtd;

interface

type
  TPropostaProduto = class
  private
    FRATEIO_DESC: Double;
    FCOD_EMPRESA: Integer;
    FNUM_FAB_PROD: string;
    FVLTOT_PED_ITEM: Double;
    FCOD_PROD: string;
    FDESCR_PROD_PED: string;
    FVLUN_PED_ITEM: Double;
    FQUANT_PED_ITEM: Double;
    FGRUPO_PROD: Integer;
    FCOD_GRADE: Integer;
    FNITEM: Integer;
    FRATEIO_ACRESC: Double;
    FCODIGO_NOP: Double;
    FATIVO: Integer;
    FNPED: Integer;
    FTIPO: string;
  published
    property NPED: Integer read FNPED write FNPED;
    property TIPO: string read FTIPO write FTIPO;
    property GRUPO_PROD: Integer read FGRUPO_PROD write FGRUPO_PROD;
    property COD_PROD: string read FCOD_PROD write FCOD_PROD;
    property NITEM: Integer read FNITEM write FNITEM;
    property COD_EMPRESA: Integer read FCOD_EMPRESA write FCOD_EMPRESA;
    property COD_GRADE: Integer read FCOD_GRADE write FCOD_GRADE;
    property CODIGO_NOP: Double read FCODIGO_NOP write FCODIGO_NOP;
    property NUM_FAB_PROD: string read FNUM_FAB_PROD write FNUM_FAB_PROD;
    property DESCR_PROD_PED: string read FDESCR_PROD_PED write FDESCR_PROD_PED;
    property QUANT_PED_ITEM: Double read FQUANT_PED_ITEM write FQUANT_PED_ITEM;
    property VLUN_PED_ITEM: Double read FVLUN_PED_ITEM write FVLUN_PED_ITEM;
    property VLTOT_PED_ITEM: Double read FVLTOT_PED_ITEM write FVLTOT_PED_ITEM;
    property RATEIO_DESC: Double read FRATEIO_DESC write FRATEIO_DESC;
    property RATEIO_ACRESC: Double read FRATEIO_ACRESC write FRATEIO_ACRESC;
    property ATIVO: Integer read FATIVO write FATIVO;
  end;

  TProposta = class
  private
    FCOD_EMPRESA: Integer;
    FACRESCIMO: Double;
    FDESCONTO: Double;
    FNPREVENDA: Integer;
    FDATA_PED: TDateTime;
    FVALOR_TOTAL: Double;
    FATIVO: Integer;
    FOBS_PED: string;
    FCOD_COND_PAG: Integer;
    FTIPOR: string;
    FTIPV: string;
    FDESC_P_SERV: Double;
    FDATA_FECH: TDateTime;
    FID_COMMERCE: Integer;
    FLOCAL_VENDA: string;
    FNPED: Integer;
    FCOD_CLIENTE: Integer;
    FVL_ENTRADA: Double;
    FSTATUS_PED: string;
    FHORA_FECH: string;
    FCOD_VENDEDOR: Integer;
    FTIPO: string;
    FDESC_P_PROD: Double;
    FProdutos: TArray<TPropostaProduto>;
  published
    property NPED: Integer read FNPED write FNPED;
    property TIPO: string read FTIPO write FTIPO;
    property COD_EMPRESA: Integer read FCOD_EMPRESA write FCOD_EMPRESA;
    property COD_CLIENTE: Integer read FCOD_CLIENTE write FCOD_CLIENTE;
    property COD_VENDEDOR: Integer read FCOD_VENDEDOR write FCOD_VENDEDOR;
    property VALOR_TOTAL: Double read FVALOR_TOTAL write FVALOR_TOTAL;
    property COD_COND_PAG: Integer read FCOD_COND_PAG write FCOD_COND_PAG;
    property DATA_PED: TDateTime read FDATA_PED write FDATA_PED;
    property DATA_FECH: TDateTime read FDATA_FECH write FDATA_FECH;
    property HORA_FECH: string read FHORA_FECH write FHORA_FECH;
    property DESC_P_PROD: Double read FDESC_P_PROD write FDESC_P_PROD;
    property DESC_P_SERV: Double read FDESC_P_SERV write FDESC_P_SERV;
    property DESCONTO: Double read FDESCONTO write FDESCONTO;
    property ACRESCIMO: Double read FACRESCIMO write FACRESCIMO;
    property OBS_PED: string read FOBS_PED write FOBS_PED;
    property STATUS_PED: string read FSTATUS_PED write FSTATUS_PED;
    property TIPV: string read FTIPV write FTIPV;
    property TIPOR: string read FTIPOR write FTIPOR;
    property VL_ENTRADA: Double read FVL_ENTRADA write FVL_ENTRADA;
    property NPREVENDA: Integer read FNPREVENDA write FNPREVENDA;
    property ID_COMMERCE: Integer read FID_COMMERCE write FID_COMMERCE;
    property LOCAL_VENDA: string read FLOCAL_VENDA write FLOCAL_VENDA;
    property ATIVO: Integer read FATIVO write FATIVO;

    property Produtos: TArray<TPropostaProduto> read FProdutos write FProdutos;
  end;

implementation

end.
