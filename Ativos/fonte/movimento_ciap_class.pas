unit movimento_ciap_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TMovimento_ciap_class = class(TBaseFb_class)
  private
    Fcod_ind_bem         : Integer;
    Fdt_mov              : TDateTime;
    Ftipo_mov            : string;
    Fcod_empresa         : Integer;
    Fvl_imob_icms_op     : Variant;
    Fvl_imob_icms_st     : Variant;
    Fvl_imob_icms_frt    : Variant;
    Fvl_imob_icms_dif    : Variant;
    Fnum_parc            : Variant;
    Fvl_parc_pass        : Variant;
    Femissao_propria     : string;
    Fcod_cliente         : Variant;
    Fmodelo_nf           : string;
    Fserie               : string;
    Fnum_nf              : Variant;
    Fchv_nfe_cte         : string;
    Fdata_doc            : Variant;
    Fnum_item            : Variant;
    Fgrupo_prod          : Variant;
    Fcod_prod            : string;
    Fcod_nf              : Variant;
    Fnum_da              : string;
    Fqtde                : Variant;
    Funid                : string;
    Fvl_icms_op_aplicado : Variant;
    Fvl_icms_st_aplicado : Variant;
    Fvl_icms_frt_aplicado: Variant;
    Fvl_icms_dif_aplicado: Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_ind_bem         : Integer   read Fcod_ind_bem          write Fcod_ind_bem;
    property dt_mov              : TDateTime read Fdt_mov               write Fdt_mov;
    property tipo_mov            : string    read Ftipo_mov             write Ftipo_mov;
    property cod_empresa         : Integer   read Fcod_empresa          write Fcod_empresa;
    property vl_imob_icms_op     : Variant   read Fvl_imob_icms_op      write Fvl_imob_icms_op;
    property vl_imob_icms_st     : Variant   read Fvl_imob_icms_st      write Fvl_imob_icms_st;
    property vl_imob_icms_frt    : Variant   read Fvl_imob_icms_frt     write Fvl_imob_icms_frt;
    property vl_imob_icms_dif    : Variant   read Fvl_imob_icms_dif     write Fvl_imob_icms_dif;
    property num_parc            : Variant   read Fnum_parc             write Fnum_parc;
    property vl_parc_pass        : Variant   read Fvl_parc_pass         write Fvl_parc_pass;
    property emissao_propria     : string    read Femissao_propria      write Femissao_propria;
    property cod_cliente         : Variant   read Fcod_cliente          write Fcod_cliente;
    property modelo_nf           : string    read Fmodelo_nf            write Fmodelo_nf;
    property serie               : string    read Fserie                write Fserie;
    property num_nf              : Variant   read Fnum_nf               write Fnum_nf;
    property chv_nfe_cte         : string    read Fchv_nfe_cte          write Fchv_nfe_cte;
    property data_doc            : Variant   read Fdata_doc             write Fdata_doc;
    property num_item            : Variant   read Fnum_item             write Fnum_item;
    property grupo_prod          : Variant   read Fgrupo_prod           write Fgrupo_prod;
    property cod_prod            : string    read Fcod_prod             write Fcod_prod;
    property cod_nf              : Variant   read Fcod_nf               write Fcod_nf;
    property num_da              : string    read Fnum_da               write Fnum_da;
    property qtde                : Variant   read Fqtde                 write Fqtde;
    property unid                : string    read Funid                 write Funid;
    property vl_icms_op_aplicado : Variant   read Fvl_icms_op_aplicado  write Fvl_icms_op_aplicado;
    property vl_icms_st_aplicado : Variant   read Fvl_icms_st_aplicado  write Fvl_icms_st_aplicado;
    property vl_icms_frt_aplicado: Variant   read Fvl_icms_frt_aplicado write Fvl_icms_frt_aplicado;
    property vl_icms_dif_aplicado: Variant   read Fvl_icms_dif_aplicado write Fvl_icms_dif_aplicado;
  end;

  TMovimento_ciaps_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TMovimento_ciap_class;
    procedure SetItem(Index: Integer; const Value: TMovimento_ciap_class);
  public
    function New: TMovimento_ciap_class;

    property Items[Index: Integer]: TMovimento_ciap_class read GetItem write SetItem;
  end;

implementation

{ TMovimento_ciap_class }

procedure TMovimento_ciap_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('MOVIMENTO_CIAP');
  with FTable.Fields do
  begin
    AddField('COD_IND_BEM'         , fkInteger , 0  , False, True , True       );
    AddField('DT_MOV'              , fkDateTime, 0  , False, True              );
    AddField('TIPO_MOV'            , fkString  , 2  , False, True              );
    AddField('COD_EMPRESA'         , fkInteger , 0  , False, True , True       );
    AddField('VL_IMOB_ICMS_OP'     , fkFloat   , 0  , True , False, False, True);
    AddField('VL_IMOB_ICMS_ST'     , fkFloat   , 0  , True , False, False, True);
    AddField('VL_IMOB_ICMS_FRT'    , fkFloat   , 0  , True , False, False, True);
    AddField('VL_IMOB_ICMS_DIF'    , fkFloat   , 0  , True , False, False, True);
    AddField('NUM_PARC'            , fkInteger                                 );
    AddField('VL_PARC_PASS'        , fkFloat   , 0  , True , False, False, True);
    AddField('EMISSAO_PROPRIA'     , fkString  , 1                             );
    AddField('COD_CLIENTE'         , fkInteger                                 );
    AddField('MODELO_NF'           , fkString  , 3                             );
    AddField('SERIE'               , fkString  , 5                             );
    AddField('NUM_NF'              , fkInteger                                 );
    AddField('CHV_NFE_CTE'         , fkString  , 60                            );
    AddField('DATA_DOC'            , fkDateTime                                );
    AddField('NUM_ITEM'            , fkInteger                                 );
    AddField('GRUPO_PROD'          , fkInteger , 0  , True , False, True       );
    AddField('COD_PROD'            , fkString  , 6  , True , False, True       );
    AddField('COD_NF'              , fkInteger , 0  , True , False, True       );
    AddField('NUM_DA'              , fkString  , 128                           );
    AddField('QTDE'                , fkFloat   , 0  , True , False, False, True);
    AddField('UNID'                , fkString  , 6                             );
    AddField('VL_ICMS_OP_APLICADO' , fkFloat   , 0  , True , False, False, True);
    AddField('VL_ICMS_ST_APLICADO' , fkFloat   , 0  , True , False, False, True);
    AddField('VL_ICMS_FRT_APLICADO', fkFloat   , 0  , True , False, False, True);
    AddField('VL_ICMS_DIF_APLICADO', fkFloat   , 0  , True , False, False, True);
  end;
end;

constructor TMovimento_ciap_class.Create;
begin
  InitializeObjects;
end;

{ TMovimento_ciaps_class }

function TMovimento_ciaps_class.GetItem(Index: Integer): TMovimento_ciap_class;
begin
  Result := TMovimento_ciap_class(inherited Items[Index]);
end;

function TMovimento_ciaps_class.New: TMovimento_ciap_class;
begin
  Result := TMovimento_ciap_class.Create;
  Add(Result);
end;

procedure TMovimento_ciaps_class.SetItem(Index: Integer; const Value: TMovimento_ciap_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TMovimento_ciap_class);
finalization
  UnRegisterClass(TMovimento_ciap_class);

end.
