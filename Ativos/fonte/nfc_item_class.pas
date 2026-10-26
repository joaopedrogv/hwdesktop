unit nfc_item_class;

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
  Tnfc_item_class = class(TBaseFb_class)
  private
    Fcod_nfce           : Integer;
    Fcod_empresa        : Integer;
    Fseqid              : Integer;
    Fnitem              : Variant;
    Ftipo_item          : string;
    Fgrupo_prod         : Variant;
    Fcod_prod           : string;
    Fcod_grade          : Variant;
    Fnum_fab_prod       : string;
    Fcean               : string;
    Fncm                : string;
    Fcfop               : Variant;
    Fxprod              : string;
    Fucom               : string;
    Fqcom               : Variant;
    Fvuncom             : Variant;
    Fvprod              : Variant;
    Fvfrete             : Variant;
    Fvseg               : Variant;
    Fvdesc              : Variant;
    Fvoutro             : Variant;
    Fprec_cus_prod      : Variant;
    Fprec_cusm_prod     : Variant;
    Fcest               : string;
    Fnfci               : string;
    Fvtottrib           : Variant;
    Ficm_orig           : string;
    Ficm_cst            : string;
    Ficm_modbc          : Variant;
    Ficm_predbc         : Variant;
    Ficm_vbc            : Variant;
    Ficm_picms          : Variant;
    Ficm_vicms          : Variant;
    Ficm_vbcstret       : Variant;
    Ficm_vicmsstret     : Variant;
    Ficm_csosn          : string;
    Ficm_pcredsn        : Variant;
    Ficm_vcredicmssn    : Variant;
    Fpis_cst            : string;
    Fpis_vbc            : Variant;
    Fpis_ppis           : Variant;
    Fpis_vpis           : Variant;
    Fpis_qbcprod        : Variant;
    Fpis_valiqprod      : Variant;
    Fcofins_cst         : string;
    Fcofins_vbc         : Variant;
    Fcofins_pcofins     : Variant;
    Fcofins_vcofins     : Variant;
    Fcofins_qbcprod     : Variant;
    Fcofins_valiqprod   : Variant;
    Fiss_vbc            : Variant;
    Fiss_valiq          : Variant;
    Fiss_vissqn         : Variant;
    Fiss_cmunfg         : Variant;
    Fiss_clistserv      : string;
    Fiss_vdeducao       : Variant;
    Fiss_voutro         : Variant;
    Fiss_vdescincond    : Variant;
    Fiss_vdesccond      : Variant;
    Fiss_vissret        : Variant;
    Fiss_indiss         : string;
    Fiss_indincentivo   : string;
    Fiss_retido         : string;
    Fcod_servico        : Variant;
    Ffrete_na_base      : string;
    Fcalcular           : string;
    Faltera_estoque_cfop: string;
    Fnat_rec            : string;
    Fcomb_cprodanp      : string;
    Fcomb_descanp       : string;
    Fcomb_pglp          : Variant;
    Fcomb_pgnn          : Variant;
    Fcomb_pgni          : Variant;
    Fcomb_vpart         : Variant;
    Fcomb_codif         : string;
    Fcomb_ufcons        : string;
    Ffcp_pfcp           : Variant;
    Ffcp_vfcp           : Variant;
    Ffcp_vbcfcp         : Variant;
    Ffcp_vbcfcpst       : Variant;
    Ffcp_pfcpst         : Variant;
    Ffcp_vfcpst         : Variant;
    Ffcp_pst            : Variant;
    Ffcp_vbcfcpstret    : Variant;
    Ffcp_pfcpstret      : Variant;
    Ffcp_vfcpstret      : Variant;
    Fesc_indescala      : string;
    Fesc_cnpjfab        : string;
    Ficm_predbcefet     : Variant;
    Ficm_vbcefet        : Variant;
    Ficm_picmsefet      : Variant;
    Ficm_vicmsefet      : Variant;
    Fqbcmonoret         : Variant;
    Fadremicmsret       : Variant;
    Fvicmsmonoret       : Variant;
    Fqtrib              : Variant;
    Futrib              : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_nfce           : Integer read Fcod_nfce            write Fcod_nfce;
    property cod_empresa        : Integer read Fcod_empresa         write Fcod_empresa;
    property seqid              : Integer read Fseqid               write Fseqid;
    property nitem              : Variant read Fnitem               write Fnitem;
    property tipo_item          : string  read Ftipo_item           write Ftipo_item;
    property grupo_prod         : Variant read Fgrupo_prod          write Fgrupo_prod;
    property cod_prod           : string  read Fcod_prod            write Fcod_prod;
    property cod_grade          : Variant read Fcod_grade           write Fcod_grade;
    property num_fab_prod       : string  read Fnum_fab_prod        write Fnum_fab_prod;
    property cean               : string  read Fcean                write Fcean;
    property ncm                : string  read Fncm                 write Fncm;
    property cfop               : Variant read Fcfop                write Fcfop;
    property xprod              : string  read Fxprod               write Fxprod;
    property ucom               : string  read Fucom                write Fucom;
    property qcom               : Variant read Fqcom                write Fqcom;
    property vuncom             : Variant read Fvuncom              write Fvuncom;
    property vprod              : Variant read Fvprod               write Fvprod;
    property vfrete             : Variant read Fvfrete              write Fvfrete;
    property vseg               : Variant read Fvseg                write Fvseg;
    property vdesc              : Variant read Fvdesc               write Fvdesc;
    property voutro             : Variant read Fvoutro              write Fvoutro;
    property prec_cus_prod      : Variant read Fprec_cus_prod       write Fprec_cus_prod;
    property prec_cusm_prod     : Variant read Fprec_cusm_prod      write Fprec_cusm_prod;
    property cest               : string  read Fcest                write Fcest;
    property nfci               : string  read Fnfci                write Fnfci;
    property vtottrib           : Variant read Fvtottrib            write Fvtottrib;
    property icm_orig           : string  read Ficm_orig            write Ficm_orig;
    property icm_cst            : string  read Ficm_cst             write Ficm_cst;
    property icm_modbc          : Variant read Ficm_modbc           write Ficm_modbc;
    property icm_predbc         : Variant read Ficm_predbc          write Ficm_predbc;
    property icm_vbc            : Variant read Ficm_vbc             write Ficm_vbc;
    property icm_picms          : Variant read Ficm_picms           write Ficm_picms;
    property icm_vicms          : Variant read Ficm_vicms           write Ficm_vicms;
    property icm_vbcstret       : Variant read Ficm_vbcstret        write Ficm_vbcstret;
    property icm_vicmsstret     : Variant read Ficm_vicmsstret      write Ficm_vicmsstret;
    property icm_csosn          : string  read Ficm_csosn           write Ficm_csosn;
    property icm_pcredsn        : Variant read Ficm_pcredsn         write Ficm_pcredsn;
    property icm_vcredicmssn    : Variant read Ficm_vcredicmssn     write Ficm_vcredicmssn;
    property pis_cst            : string  read Fpis_cst             write Fpis_cst;
    property pis_vbc            : Variant read Fpis_vbc             write Fpis_vbc;
    property pis_ppis           : Variant read Fpis_ppis            write Fpis_ppis;
    property pis_vpis           : Variant read Fpis_vpis            write Fpis_vpis;
    property pis_qbcprod        : Variant read Fpis_qbcprod         write Fpis_qbcprod;
    property pis_valiqprod      : Variant read Fpis_valiqprod       write Fpis_valiqprod;
    property cofins_cst         : string  read Fcofins_cst          write Fcofins_cst;
    property cofins_vbc         : Variant read Fcofins_vbc          write Fcofins_vbc;
    property cofins_pcofins     : Variant read Fcofins_pcofins      write Fcofins_pcofins;
    property cofins_vcofins     : Variant read Fcofins_vcofins      write Fcofins_vcofins;
    property cofins_qbcprod     : Variant read Fcofins_qbcprod      write Fcofins_qbcprod;
    property cofins_valiqprod   : Variant read Fcofins_valiqprod    write Fcofins_valiqprod;
    property iss_vbc            : Variant read Fiss_vbc             write Fiss_vbc;
    property iss_valiq          : Variant read Fiss_valiq           write Fiss_valiq;
    property iss_vissqn         : Variant read Fiss_vissqn          write Fiss_vissqn;
    property iss_cmunfg         : Variant read Fiss_cmunfg          write Fiss_cmunfg;
    property iss_clistserv      : string  read Fiss_clistserv       write Fiss_clistserv;
    property iss_vdeducao       : Variant read Fiss_vdeducao        write Fiss_vdeducao;
    property iss_voutro         : Variant read Fiss_voutro          write Fiss_voutro;
    property iss_vdescincond    : Variant read Fiss_vdescincond     write Fiss_vdescincond;
    property iss_vdesccond      : Variant read Fiss_vdesccond       write Fiss_vdesccond;
    property iss_vissret        : Variant read Fiss_vissret         write Fiss_vissret;
    property iss_indiss         : string  read Fiss_indiss          write Fiss_indiss;
    property iss_indincentivo   : string  read Fiss_indincentivo    write Fiss_indincentivo;
    property iss_retido         : string  read Fiss_retido          write Fiss_retido;
    property cod_servico        : Variant read Fcod_servico         write Fcod_servico;
    property frete_na_base      : string  read Ffrete_na_base       write Ffrete_na_base;
    property calcular           : string  read Fcalcular            write Fcalcular;
    property altera_estoque_cfop: string  read Faltera_estoque_cfop write Faltera_estoque_cfop;
    property nat_rec            : string  read Fnat_rec             write Fnat_rec;
    property comb_cprodanp      : string  read Fcomb_cprodanp       write Fcomb_cprodanp;
    property comb_descanp       : string  read Fcomb_descanp        write Fcomb_descanp;
    property comb_pglp          : Variant read Fcomb_pglp           write Fcomb_pglp;
    property comb_pgnn          : Variant read Fcomb_pgnn           write Fcomb_pgnn;
    property comb_pgni          : Variant read Fcomb_pgni           write Fcomb_pgni;
    property comb_vpart         : Variant read Fcomb_vpart          write Fcomb_vpart;
    property comb_codif         : string  read Fcomb_codif          write Fcomb_codif;
    property comb_ufcons        : string  read Fcomb_ufcons         write Fcomb_ufcons;
    property fcp_pfcp           : Variant read Ffcp_pfcp            write Ffcp_pfcp;
    property fcp_vfcp           : Variant read Ffcp_vfcp            write Ffcp_vfcp;
    property fcp_vbcfcp         : Variant read Ffcp_vbcfcp          write Ffcp_vbcfcp;
    property fcp_vbcfcpst       : Variant read Ffcp_vbcfcpst        write Ffcp_vbcfcpst;
    property fcp_pfcpst         : Variant read Ffcp_pfcpst          write Ffcp_pfcpst;
    property fcp_vfcpst         : Variant read Ffcp_vfcpst          write Ffcp_vfcpst;
    property fcp_pst            : Variant read Ffcp_pst             write Ffcp_pst;
    property fcp_vbcfcpstret    : Variant read Ffcp_vbcfcpstret     write Ffcp_vbcfcpstret;
    property fcp_pfcpstret      : Variant read Ffcp_pfcpstret       write Ffcp_pfcpstret;
    property fcp_vfcpstret      : Variant read Ffcp_vfcpstret       write Ffcp_vfcpstret;
    property esc_indescala      : string  read Fesc_indescala       write Fesc_indescala;
    property esc_cnpjfab        : string  read Fesc_cnpjfab         write Fesc_cnpjfab;
    property icm_predbcefet     : Variant read Ficm_predbcefet      write Ficm_predbcefet;
    property icm_vbcefet        : Variant read Ficm_vbcefet         write Ficm_vbcefet;
    property icm_picmsefet      : Variant read Ficm_picmsefet       write Ficm_picmsefet;
    property icm_vicmsefet      : Variant read Ficm_vicmsefet       write Ficm_vicmsefet;
    property qbcmonoret         : Variant read Fqbcmonoret          write Fqbcmonoret;
    property adremicmsret       : Variant read Fadremicmsret        write Fadremicmsret;
    property vicmsmonoret       : Variant read Fvicmsmonoret        write Fvicmsmonoret;
    property qtrib              : Variant read Fqtrib               write Fqtrib;
    property utrib              : string  read Futrib               write Futrib;
  end;

  Tnfc_itemList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): Tnfc_item_class;
    procedure SetItem(Index: Integer; const Value: Tnfc_item_class);
  public
    function New: Tnfc_item_class;

    property Items[Index: Integer]: Tnfc_item_class read GetItem write SetItem;
  end;

implementation

{ Tnfc_item_class }

procedure Tnfc_item_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NFCE_ITEM');
  with FTable.Fields do
  begin
    AddField('COD_NFCE'           , fkInteger, 0  , False, True , True       );
    AddField('COD_EMPRESA'        , fkInteger, 0  , False, True , True       );
    AddField('SEQID'              , fkInteger, 0  , False, True              );
    AddField('NITEM'              , fkInteger                                );
    AddField('TIPO_ITEM'          , fkString , 1                             );
    AddField('GRUPO_PROD'         , fkInteger, 0  , True , False, True       );
    AddField('COD_PROD'           , fkString , 6  , True , False, True       );
    AddField('COD_GRADE'          , fkInteger, 0  , True , False, True , True);
    AddField('NUM_FAB_PROD'       , fkString , 20                            );
    AddField('CEAN'               , fkString , 14                            );
    AddField('NCM'                , fkString , 8                             );
    AddField('CFOP'               , fkInteger                                );
    AddField('XPROD'              , fkString , 120                           );
    AddField('UCOM'               , fkString , 6                             );
    AddField('QCOM'               , fkFloat  , 0  , True , False, False, True);
    AddField('VUNCOM'             , fkFloat  , 0  , True , False, False, True);
    AddField('VPROD'              , fkFloat  , 0  , True , False, False, True);
    AddField('VFRETE'             , fkFloat  , 0  , True , False, False, True);
    AddField('VSEG'               , fkFloat  , 0  , True , False, False, True);
    AddField('VDESC'              , fkFloat  , 0  , True , False, False, True);
    AddField('VOUTRO'             , fkFloat  , 0  , True , False, False, True);
    AddField('PREC_CUS_PROD'      , fkFloat  , 0  , True , False, False, True);
    AddField('PREC_CUSM_PROD'     , fkFloat  , 0  , True , False, False, True);
    AddField('CEST'               , fkString , 7                             );
    AddField('NFCI'               , fkString , 36                            );
    AddField('VTOTTRIB'           , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_ORIG'           , fkString , 1                             );
    AddField('ICM_CST'            , fkString , 2                             );
    AddField('ICM_MODBC'          , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_PREDBC'         , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_VBC'            , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_PICMS'          , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_VICMS'          , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_VBCSTRET'       , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_VICMSSTRET'     , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_CSOSN'          , fkString , 3                             );
    AddField('ICM_PCREDSN'        , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_VCREDICMSSN'    , fkFloat  , 0  , True , False, False, True);
    AddField('PIS_CST'            , fkString , 2                             );
    AddField('PIS_VBC'            , fkFloat  , 0  , True , False, False, True);
    AddField('PIS_PPIS'           , fkFloat  , 0  , True , False, False, True);
    AddField('PIS_VPIS'           , fkFloat  , 0  , True , False, False, True);
    AddField('PIS_QBCPROD'        , fkFloat  , 0  , True , False, False, True);
    AddField('PIS_VALIQPROD'      , fkFloat  , 0  , True , False, False, True);
    AddField('COFINS_CST'         , fkString , 2                             );
    AddField('COFINS_VBC'         , fkFloat  , 0  , True , False, False, True);
    AddField('COFINS_PCOFINS'     , fkFloat  , 0  , True , False, False, True);
    AddField('COFINS_VCOFINS'     , fkFloat  , 0  , True , False, False, True);
    AddField('COFINS_QBCPROD'     , fkFloat  , 0  , True , False, False, True);
    AddField('COFINS_VALIQPROD'   , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_VBC'            , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_VALIQ'          , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_VISSQN'         , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_CMUNFG'         , fkInteger                                );
    AddField('ISS_CLISTSERV'      , fkString , 5                             );
    AddField('ISS_VDEDUCAO'       , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_VOUTRO'         , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_VDESCINCOND'    , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_VDESCCOND'      , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_VISSRET'        , fkFloat  , 0  , True , False, False, True);
    AddField('ISS_INDISS'         , fkString , 2                             );
    AddField('ISS_INDINCENTIVO'   , fkString , 1                             );
    AddField('ISS_RETIDO'         , fkString , 1                             );
    AddField('COD_SERVICO'        , fkInteger, 0  , True , False, True       );
    AddField('FRETE_NA_BASE'      , fkString , 1                             );
    AddField('CALCULAR'           , fkString , 1                             );
    AddField('ALTERA_ESTOQUE_CFOP', fkString , 1  , True , False, False, True);
    AddField('NAT_REC'            , fkString , 3                             );
    AddField('COMB_CPRODANP'      , fkString , 9                             );
    AddField('COMB_DESCANP'       , fkString , 95                            );
    AddField('COMB_PGLP'          , fkFloat  , 0  , True , False, False, True);
    AddField('COMB_PGNN'          , fkFloat  , 0  , True , False, False, True);
    AddField('COMB_PGNI'          , fkFloat  , 0  , True , False, False, True);
    AddField('COMB_VPART'         , fkFloat  , 0  , True , False, False, True);
    AddField('COMB_CODIF'         , fkString , 21                            );
    AddField('COMB_UFCONS'        , fkString , 2                             );
    AddField('FCP_PFCP'           , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_VFCP'           , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_VBCFCP'         , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_VBCFCPST'       , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_PFCPST'         , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_VFCPST'         , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_PST'            , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_VBCFCPSTRET'    , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_PFCPSTRET'      , fkFloat  , 0  , True , False, False, True);
    AddField('FCP_VFCPSTRET'      , fkFloat  , 0  , True , False, False, True);
    AddField('ESC_INDESCALA'      , fkString , 1                             );
    AddField('ESC_CNPJFAB'        , fkString , 14                            );
    AddField('ICM_PREDBCEFET'     , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_VBCEFET'        , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_PICMSEFET'      , fkFloat  , 0  , True , False, False, True);
    AddField('ICM_VICMSEFET'      , fkFloat  , 0  , True , False, False, True);
    AddField('QBCMONORET'         , fkFloat  , 0  , True , False, False, True);
    AddField('ADREMICMSRET'       , fkFloat  , 0  , True , False, False, True);
    AddField('VICMSMONORET'       , fkFloat  , 0  , True , False, False, True);
    AddField('QTRIB'              , fkFloat  , 0  , True , False, False, True);
    AddField('UTRIB'              , fkString , 6                             );
  end;
end;

constructor Tnfc_item_class.Create;
begin
  InitializeObjects;
end;

{ Tnfc_itemList }

function Tnfc_itemList.GetItem(Index: Integer): Tnfc_item_class;
begin
  Result := Tnfc_item_class(inherited Items[Index]);
end;

function Tnfc_itemList.New: Tnfc_item_class;
begin
  Result := Tnfc_item_class.Create;
  Add(Result);
end;

procedure Tnfc_itemList.SetItem(Index: Integer; const Value: Tnfc_item_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(Tnfc_item_class);
finalization
  UnRegisterClass(Tnfc_item_class);

end.
