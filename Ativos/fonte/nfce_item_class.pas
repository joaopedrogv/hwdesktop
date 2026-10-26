unit nfce_item_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB;
{$ELSE}
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TNfce_item_class = class(TObject)
  private
    Fcod_nfce           : Integer;
    Fcod_empresa        : Integer;
    Fseqid              : Integer;
    Fnitem              : Integer;
    Ftipo_item          : string;
    Fgrupo_prod         : Integer;
    Fcod_prod           : string;
    Fcod_grade          : Integer;
    Fnum_fab_prod       : string;
    Fcean               : string;
    Fncm                : string;
    Fcfop               : Integer;
    Fxprod              : string;
    Fucom               : string;
    Fqcom               : Double;
    Fvuncom             : Double;
    Fvprod              : Double;
    Fvfrete             : Double;
    Fvseg               : Double;
    Fvdesc              : Double;
    Fvoutro             : Double;
    Fprec_cus_prod      : Double;
    Fprec_cusm_prod     : Double;
    Fcest               : string;
    Fnfci               : string;
    Fvtottrib           : Double;
    Ficm_orig           : string;
    Ficm_cst            : string;
    Ficm_modbc          : Double;
    Ficm_predbc         : Double;
    Ficm_vbc            : Double;
    Ficm_picms          : Double;
    Ficm_vicms          : Double;
    Ficm_vbcstret       : Double;
    Ficm_vicmsstret     : Double;
    Ficm_csosn          : string;
    Ficm_pcredsn        : Double;
    Ficm_vcredicmssn    : Double;
    Fpis_cst            : string;
    Fpis_vbc            : Double;
    Fpis_ppis           : Double;
    Fpis_vpis           : Double;
    Fpis_qbcprod        : Double;
    Fpis_valiqprod      : Double;
    Fcofins_cst         : string;
    Fcofins_vbc         : Double;
    Fcofins_pcofins     : Double;
    Fcofins_vcofins     : Double;
    Fcofins_qbcprod     : Double;
    Fcofins_valiqprod   : Double;
    Fiss_vbc            : Double;
    Fiss_valiq          : Double;
    Fiss_vissqn         : Double;
    Fiss_cmunfg         : Integer;
    Fiss_clistserv      : string;
    Fiss_vdeducao       : Double;
    Fiss_voutro         : Double;
    Fiss_vdescincond    : Double;
    Fiss_vdesccond      : Double;
    Fiss_vissret        : Double;
    Fiss_indiss         : string;
    Fiss_indincentivo   : string;
    Fiss_retido         : string;
    Fcod_servico        : Integer;
    Ffrete_na_base      : string;
    Fcalcular           : string;
    Faltera_estoque_cfop: string;
    Fnat_rec            : string;
    Fcomb_cprodanp      : string;
    Fcomb_descanp       : string;
    Fcomb_pglp          : Double;
    Fcomb_pgnn          : Double;
    Fcomb_pgni          : Double;
    Fcomb_vpart         : Double;
    Fcomb_codif         : string;
    Fcomb_ufcons        : string;
    Ffcp_pfcp           : Double;
    Ffcp_vfcp           : Double;
    Ffcp_vbcfcp         : Double;
    Ffcp_vbcfcpst       : Double;
    Ffcp_pfcpst         : Double;
    Ffcp_vfcpst         : Double;
    Ffcp_pst            : Double;
    Ffcp_vbcfcpstret    : Double;
    Ffcp_pfcpstret      : Double;
    Ffcp_vfcpstret      : Double;
    Fesc_indescala      : string;
    Fesc_cnpjfab        : string;
    Ficm_predbcefet     : Double;
    Ficm_vbcefet        : Double;
    Ficm_picmsefet      : Double;
    Ficm_vicmsefet      : Double;
    Fqbcmonoret         : Double;
    Fadremicmsret       : Double;
    Fvicmsmonoret       : Double;
    Fqtrib              : Double;
    Futrib              : string;
    Fuvnd               : string;
    Fuvnd_fator         : Double;
    Fvitem              : Double;
    Fdfe_trib_id        : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_nfce           : Integer read Fcod_nfce            write Fcod_nfce;
    property cod_empresa        : Integer read Fcod_empresa         write Fcod_empresa;
    property seqid              : Integer read Fseqid               write Fseqid;
    property nitem              : Integer read Fnitem               write Fnitem;
    property tipo_item          : string  read Ftipo_item           write Ftipo_item;
    property grupo_prod         : Integer read Fgrupo_prod          write Fgrupo_prod;
    property cod_prod           : string  read Fcod_prod            write Fcod_prod;
    property cod_grade          : Integer read Fcod_grade           write Fcod_grade;
    property num_fab_prod       : string  read Fnum_fab_prod        write Fnum_fab_prod;
    property cean               : string  read Fcean                write Fcean;
    property ncm                : string  read Fncm                 write Fncm;
    property cfop               : Integer read Fcfop                write Fcfop;
    property xprod              : string  read Fxprod               write Fxprod;
    property ucom               : string  read Fucom                write Fucom;
    property qcom               : Double  read Fqcom                write Fqcom;
    property vuncom             : Double  read Fvuncom              write Fvuncom;
    property vprod              : Double  read Fvprod               write Fvprod;
    property vfrete             : Double  read Fvfrete              write Fvfrete;
    property vseg               : Double  read Fvseg                write Fvseg;
    property vdesc              : Double  read Fvdesc               write Fvdesc;
    property voutro             : Double  read Fvoutro              write Fvoutro;
    property prec_cus_prod      : Double  read Fprec_cus_prod       write Fprec_cus_prod;
    property prec_cusm_prod     : Double  read Fprec_cusm_prod      write Fprec_cusm_prod;
    property cest               : string  read Fcest                write Fcest;
    property nfci               : string  read Fnfci                write Fnfci;
    property vtottrib           : Double  read Fvtottrib            write Fvtottrib;
    property icm_orig           : string  read Ficm_orig            write Ficm_orig;
    property icm_cst            : string  read Ficm_cst             write Ficm_cst;
    property icm_modbc          : Double  read Ficm_modbc           write Ficm_modbc;
    property icm_predbc         : Double  read Ficm_predbc          write Ficm_predbc;
    property icm_vbc            : Double  read Ficm_vbc             write Ficm_vbc;
    property icm_picms          : Double  read Ficm_picms           write Ficm_picms;
    property icm_vicms          : Double  read Ficm_vicms           write Ficm_vicms;
    property icm_vbcstret       : Double  read Ficm_vbcstret        write Ficm_vbcstret;
    property icm_vicmsstret     : Double  read Ficm_vicmsstret      write Ficm_vicmsstret;
    property icm_csosn          : string  read Ficm_csosn           write Ficm_csosn;
    property icm_pcredsn        : Double  read Ficm_pcredsn         write Ficm_pcredsn;
    property icm_vcredicmssn    : Double  read Ficm_vcredicmssn     write Ficm_vcredicmssn;
    property pis_cst            : string  read Fpis_cst             write Fpis_cst;
    property pis_vbc            : Double  read Fpis_vbc             write Fpis_vbc;
    property pis_ppis           : Double  read Fpis_ppis            write Fpis_ppis;
    property pis_vpis           : Double  read Fpis_vpis            write Fpis_vpis;
    property pis_qbcprod        : Double  read Fpis_qbcprod         write Fpis_qbcprod;
    property pis_valiqprod      : Double  read Fpis_valiqprod       write Fpis_valiqprod;
    property cofins_cst         : string  read Fcofins_cst          write Fcofins_cst;
    property cofins_vbc         : Double  read Fcofins_vbc          write Fcofins_vbc;
    property cofins_pcofins     : Double  read Fcofins_pcofins      write Fcofins_pcofins;
    property cofins_vcofins     : Double  read Fcofins_vcofins      write Fcofins_vcofins;
    property cofins_qbcprod     : Double  read Fcofins_qbcprod      write Fcofins_qbcprod;
    property cofins_valiqprod   : Double  read Fcofins_valiqprod    write Fcofins_valiqprod;
    property iss_vbc            : Double  read Fiss_vbc             write Fiss_vbc;
    property iss_valiq          : Double  read Fiss_valiq           write Fiss_valiq;
    property iss_vissqn         : Double  read Fiss_vissqn          write Fiss_vissqn;
    property iss_cmunfg         : Integer read Fiss_cmunfg          write Fiss_cmunfg;
    property iss_clistserv      : string  read Fiss_clistserv       write Fiss_clistserv;
    property iss_vdeducao       : Double  read Fiss_vdeducao        write Fiss_vdeducao;
    property iss_voutro         : Double  read Fiss_voutro          write Fiss_voutro;
    property iss_vdescincond    : Double  read Fiss_vdescincond     write Fiss_vdescincond;
    property iss_vdesccond      : Double  read Fiss_vdesccond       write Fiss_vdesccond;
    property iss_vissret        : Double  read Fiss_vissret         write Fiss_vissret;
    property iss_indiss         : string  read Fiss_indiss          write Fiss_indiss;
    property iss_indincentivo   : string  read Fiss_indincentivo    write Fiss_indincentivo;
    property iss_retido         : string  read Fiss_retido          write Fiss_retido;
    property cod_servico        : Integer read Fcod_servico         write Fcod_servico;
    property frete_na_base      : string  read Ffrete_na_base       write Ffrete_na_base;
    property calcular           : string  read Fcalcular            write Fcalcular;
    property altera_estoque_cfop: string  read Faltera_estoque_cfop write Faltera_estoque_cfop;
    property nat_rec            : string  read Fnat_rec             write Fnat_rec;
    property comb_cprodanp      : string  read Fcomb_cprodanp       write Fcomb_cprodanp;
    property comb_descanp       : string  read Fcomb_descanp        write Fcomb_descanp;
    property comb_pglp          : Double  read Fcomb_pglp           write Fcomb_pglp;
    property comb_pgnn          : Double  read Fcomb_pgnn           write Fcomb_pgnn;
    property comb_pgni          : Double  read Fcomb_pgni           write Fcomb_pgni;
    property comb_vpart         : Double  read Fcomb_vpart          write Fcomb_vpart;
    property comb_codif         : string  read Fcomb_codif          write Fcomb_codif;
    property comb_ufcons        : string  read Fcomb_ufcons         write Fcomb_ufcons;
    property fcp_pfcp           : Double  read Ffcp_pfcp            write Ffcp_pfcp;
    property fcp_vfcp           : Double  read Ffcp_vfcp            write Ffcp_vfcp;
    property fcp_vbcfcp         : Double  read Ffcp_vbcfcp          write Ffcp_vbcfcp;
    property fcp_vbcfcpst       : Double  read Ffcp_vbcfcpst        write Ffcp_vbcfcpst;
    property fcp_pfcpst         : Double  read Ffcp_pfcpst          write Ffcp_pfcpst;
    property fcp_vfcpst         : Double  read Ffcp_vfcpst          write Ffcp_vfcpst;
    property fcp_pst            : Double  read Ffcp_pst             write Ffcp_pst;
    property fcp_vbcfcpstret    : Double  read Ffcp_vbcfcpstret     write Ffcp_vbcfcpstret;
    property fcp_pfcpstret      : Double  read Ffcp_pfcpstret       write Ffcp_pfcpstret;
    property fcp_vfcpstret      : Double  read Ffcp_vfcpstret       write Ffcp_vfcpstret;
    property esc_indescala      : string  read Fesc_indescala       write Fesc_indescala;
    property esc_cnpjfab        : string  read Fesc_cnpjfab         write Fesc_cnpjfab;
    property icm_predbcefet     : Double  read Ficm_predbcefet      write Ficm_predbcefet;
    property icm_vbcefet        : Double  read Ficm_vbcefet         write Ficm_vbcefet;
    property icm_picmsefet      : Double  read Ficm_picmsefet       write Ficm_picmsefet;
    property icm_vicmsefet      : Double  read Ficm_vicmsefet       write Ficm_vicmsefet;
    property qbcmonoret         : Double  read Fqbcmonoret          write Fqbcmonoret;
    property adremicmsret       : Double  read Fadremicmsret        write Fadremicmsret;
    property vicmsmonoret       : Double  read Fvicmsmonoret        write Fvicmsmonoret;
    property qtrib              : Double  read Fqtrib               write Fqtrib;
    property utrib              : string  read Futrib               write Futrib;
    property uvnd               : string  read Fuvnd                write Fuvnd;
    property uvnd_fator         : Double  read Fuvnd_fator          write Fuvnd_fator;
    property vitem              : Double  read Fvitem               write Fvitem;
    property dfe_trib_id        : string  read Fdfe_trib_id         write Fdfe_trib_id;
  end;

  TNfce_item_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNfce_item_class;
    procedure SetItem(Index: Integer; const Value: TNfce_item_class);
  public
    function New: TNfce_item_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNfce_item_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TNfce_item_class }

class function TNfce_item_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nfce, @cod_empresa, @seqid, @nitem, @tipo_item, @grupo_prod, @cod_prod, @cod_grade, @num_fab_prod,' +
            ' @cean, @ncm, @cfop, @xprod, @ucom, @qcom, @vuncom, @vprod, @vfrete, @vseg, @vdesc, @voutro, @prec_cus_prod,' +
            ' @prec_cusm_prod, @cest, @nfci, @vtottrib, @icm_orig, @icm_cst, @icm_modbc, @icm_predbc, @icm_vbc,' +
            ' @icm_picms, @icm_vicms, @icm_vbcstret, @icm_vicmsstret, @icm_csosn, @icm_pcredsn, @icm_vcredicmssn,' +
            ' @pis_cst, @pis_vbc, @pis_ppis, @pis_vpis, @pis_qbcprod, @pis_valiqprod, @cofins_cst, @cofins_vbc,' +
            ' @cofins_pcofins, @cofins_vcofins, @cofins_qbcprod, @cofins_valiqprod, @iss_vbc, @iss_valiq, @iss_vissqn,' +
            ' @iss_cmunfg, @iss_clistserv, @iss_vdeducao, @iss_voutro, @iss_vdescincond, @iss_vdesccond, @iss_vissret,' +
            ' @iss_indiss, @iss_indincentivo, @iss_retido, @cod_servico, @frete_na_base, @calcular, @altera_estoque_cfop,' +
            ' @nat_rec, @comb_cprodanp, @comb_descanp, @comb_pglp, @comb_pgnn, @comb_pgni, @comb_vpart, @comb_codif,' +
            ' @comb_ufcons, @fcp_pfcp, @fcp_vfcp, @fcp_vbcfcp, @fcp_vbcfcpst, @fcp_pfcpst, @fcp_vfcpst, @fcp_pst,' +
            ' @fcp_vbcfcpstret, @fcp_pfcpstret, @fcp_vfcpstret, @esc_indescala, @esc_cnpjfab, @icm_predbcefet,' +
            ' @icm_vbcefet, @icm_picmsefet, @icm_vicmsefet, @qbcmonoret, @adremicmsret, @vicmsmonoret, @qtrib, @utrib,' +
            ' @uvnd, @uvnd_fator, @vitem, @dfe_trib_id';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNfce_item_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nfce            := ADataSet.FieldByName('COD_NFCE').AsInteger;
    Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fseqid               := ADataSet.FieldByName('SEQID').AsInteger;
    Fnitem               := ADataSet.FieldByName('NITEM').AsInteger;
    Ftipo_item           := Trim(ADataSet.FieldByName('TIPO_ITEM').AsString);
    Fgrupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fcod_grade           := ADataSet.FieldByName('COD_GRADE').AsInteger;
    Fnum_fab_prod        := Trim(ADataSet.FieldByName('NUM_FAB_PROD').AsString);
    Fcean                := Trim(ADataSet.FieldByName('CEAN').AsString);
    Fncm                 := Trim(ADataSet.FieldByName('NCM').AsString);
    Fcfop                := ADataSet.FieldByName('CFOP').AsInteger;
    Fxprod               := Trim(ADataSet.FieldByName('XPROD').AsString);
    Fucom                := Trim(ADataSet.FieldByName('UCOM').AsString);
    Fqcom                := ADataSet.FieldByName('QCOM').AsFloat;
    Fvuncom              := ADataSet.FieldByName('VUNCOM').AsFloat;
    Fvprod               := ADataSet.FieldByName('VPROD').AsFloat;
    Fvfrete              := ADataSet.FieldByName('VFRETE').AsFloat;
    Fvseg                := ADataSet.FieldByName('VSEG').AsFloat;
    Fvdesc               := ADataSet.FieldByName('VDESC').AsFloat;
    Fvoutro              := ADataSet.FieldByName('VOUTRO').AsFloat;
    Fprec_cus_prod       := ADataSet.FieldByName('PREC_CUS_PROD').AsFloat;
    Fprec_cusm_prod      := ADataSet.FieldByName('PREC_CUSM_PROD').AsFloat;
    Fcest                := Trim(ADataSet.FieldByName('CEST').AsString);
    Fnfci                := Trim(ADataSet.FieldByName('NFCI').AsString);
    Fvtottrib            := ADataSet.FieldByName('VTOTTRIB').AsFloat;
    Ficm_orig            := Trim(ADataSet.FieldByName('ICM_ORIG').AsString);
    Ficm_cst             := Trim(ADataSet.FieldByName('ICM_CST').AsString);
    Ficm_modbc           := ADataSet.FieldByName('ICM_MODBC').AsFloat;
    Ficm_predbc          := ADataSet.FieldByName('ICM_PREDBC').AsFloat;
    Ficm_vbc             := ADataSet.FieldByName('ICM_VBC').AsFloat;
    Ficm_picms           := ADataSet.FieldByName('ICM_PICMS').AsFloat;
    Ficm_vicms           := ADataSet.FieldByName('ICM_VICMS').AsFloat;
    Ficm_vbcstret        := ADataSet.FieldByName('ICM_VBCSTRET').AsFloat;
    Ficm_vicmsstret      := ADataSet.FieldByName('ICM_VICMSSTRET').AsFloat;
    Ficm_csosn           := Trim(ADataSet.FieldByName('ICM_CSOSN').AsString);
    Ficm_pcredsn         := ADataSet.FieldByName('ICM_PCREDSN').AsFloat;
    Ficm_vcredicmssn     := ADataSet.FieldByName('ICM_VCREDICMSSN').AsFloat;
    Fpis_cst             := Trim(ADataSet.FieldByName('PIS_CST').AsString);
    Fpis_vbc             := ADataSet.FieldByName('PIS_VBC').AsFloat;
    Fpis_ppis            := ADataSet.FieldByName('PIS_PPIS').AsFloat;
    Fpis_vpis            := ADataSet.FieldByName('PIS_VPIS').AsFloat;
    Fpis_qbcprod         := ADataSet.FieldByName('PIS_QBCPROD').AsFloat;
    Fpis_valiqprod       := ADataSet.FieldByName('PIS_VALIQPROD').AsFloat;
    Fcofins_cst          := Trim(ADataSet.FieldByName('COFINS_CST').AsString);
    Fcofins_vbc          := ADataSet.FieldByName('COFINS_VBC').AsFloat;
    Fcofins_pcofins      := ADataSet.FieldByName('COFINS_PCOFINS').AsFloat;
    Fcofins_vcofins      := ADataSet.FieldByName('COFINS_VCOFINS').AsFloat;
    Fcofins_qbcprod      := ADataSet.FieldByName('COFINS_QBCPROD').AsFloat;
    Fcofins_valiqprod    := ADataSet.FieldByName('COFINS_VALIQPROD').AsFloat;
    Fiss_vbc             := ADataSet.FieldByName('ISS_VBC').AsFloat;
    Fiss_valiq           := ADataSet.FieldByName('ISS_VALIQ').AsFloat;
    Fiss_vissqn          := ADataSet.FieldByName('ISS_VISSQN').AsFloat;
    Fiss_cmunfg          := ADataSet.FieldByName('ISS_CMUNFG').AsInteger;
    Fiss_clistserv       := Trim(ADataSet.FieldByName('ISS_CLISTSERV').AsString);
    Fiss_vdeducao        := ADataSet.FieldByName('ISS_VDEDUCAO').AsFloat;
    Fiss_voutro          := ADataSet.FieldByName('ISS_VOUTRO').AsFloat;
    Fiss_vdescincond     := ADataSet.FieldByName('ISS_VDESCINCOND').AsFloat;
    Fiss_vdesccond       := ADataSet.FieldByName('ISS_VDESCCOND').AsFloat;
    Fiss_vissret         := ADataSet.FieldByName('ISS_VISSRET').AsFloat;
    Fiss_indiss          := Trim(ADataSet.FieldByName('ISS_INDISS').AsString);
    Fiss_indincentivo    := Trim(ADataSet.FieldByName('ISS_INDINCENTIVO').AsString);
    Fiss_retido          := Trim(ADataSet.FieldByName('ISS_RETIDO').AsString);
    Fcod_servico         := ADataSet.FieldByName('COD_SERVICO').AsInteger;
    Ffrete_na_base       := Trim(ADataSet.FieldByName('FRETE_NA_BASE').AsString);
    Fcalcular            := Trim(ADataSet.FieldByName('CALCULAR').AsString);
    Faltera_estoque_cfop := Trim(ADataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString);
    Fnat_rec             := Trim(ADataSet.FieldByName('NAT_REC').AsString);
    Fcomb_cprodanp       := Trim(ADataSet.FieldByName('COMB_CPRODANP').AsString);
    Fcomb_descanp        := Trim(ADataSet.FieldByName('COMB_DESCANP').AsString);
    Fcomb_pglp           := ADataSet.FieldByName('COMB_PGLP').AsFloat;
    Fcomb_pgnn           := ADataSet.FieldByName('COMB_PGNN').AsFloat;
    Fcomb_pgni           := ADataSet.FieldByName('COMB_PGNI').AsFloat;
    Fcomb_vpart          := ADataSet.FieldByName('COMB_VPART').AsFloat;
    Fcomb_codif          := Trim(ADataSet.FieldByName('COMB_CODIF').AsString);
    Fcomb_ufcons         := Trim(ADataSet.FieldByName('COMB_UFCONS').AsString);
    Ffcp_pfcp            := ADataSet.FieldByName('FCP_PFCP').AsFloat;
    Ffcp_vfcp            := ADataSet.FieldByName('FCP_VFCP').AsFloat;
    Ffcp_vbcfcp          := ADataSet.FieldByName('FCP_VBCFCP').AsFloat;
    Ffcp_vbcfcpst        := ADataSet.FieldByName('FCP_VBCFCPST').AsFloat;
    Ffcp_pfcpst          := ADataSet.FieldByName('FCP_PFCPST').AsFloat;
    Ffcp_vfcpst          := ADataSet.FieldByName('FCP_VFCPST').AsFloat;
    Ffcp_pst             := ADataSet.FieldByName('FCP_PST').AsFloat;
    Ffcp_vbcfcpstret     := ADataSet.FieldByName('FCP_VBCFCPSTRET').AsFloat;
    Ffcp_pfcpstret       := ADataSet.FieldByName('FCP_PFCPSTRET').AsFloat;
    Ffcp_vfcpstret       := ADataSet.FieldByName('FCP_VFCPSTRET').AsFloat;
    Fesc_indescala       := Trim(ADataSet.FieldByName('ESC_INDESCALA').AsString);
    Fesc_cnpjfab         := Trim(ADataSet.FieldByName('ESC_CNPJFAB').AsString);
    Ficm_predbcefet      := ADataSet.FieldByName('ICM_PREDBCEFET').AsFloat;
    Ficm_vbcefet         := ADataSet.FieldByName('ICM_VBCEFET').AsFloat;
    Ficm_picmsefet       := ADataSet.FieldByName('ICM_PICMSEFET').AsFloat;
    Ficm_vicmsefet       := ADataSet.FieldByName('ICM_VICMSEFET').AsFloat;
    Fqbcmonoret          := ADataSet.FieldByName('QBCMONORET').AsFloat;
    Fadremicmsret        := ADataSet.FieldByName('ADREMICMSRET').AsFloat;
    Fvicmsmonoret        := ADataSet.FieldByName('VICMSMONORET').AsFloat;
    Fqtrib               := ADataSet.FieldByName('QTRIB').AsFloat;
    Futrib               := Trim(ADataSet.FieldByName('UTRIB').AsString);
    Fuvnd                := Trim(ADataSet.FieldByName('UVND').AsString);
    Fuvnd_fator          := ADataSet.FieldByName('UVND_FATOR').AsFloat;
    Fvitem               := ADataSet.FieldByName('VITEM').AsFloat;
    Fdfe_trib_id         := Trim(ADataSet.FieldByName('DFE_TRIB_ID').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NFCE'           )) then Fcod_nfce            := ADataSet.FieldByName('COD_NFCE').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'        )) then Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('SEQID'              )) then Fseqid               := ADataSet.FieldByName('SEQID').AsInteger;
    if Assigned(ADataSet.FindField('NITEM'              )) then Fnitem               := ADataSet.FieldByName('NITEM').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ITEM'          )) then Ftipo_item           := Trim(ADataSet.FieldByName('TIPO_ITEM').AsString);
    if Assigned(ADataSet.FindField('GRUPO_PROD'         )) then Fgrupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'           )) then Fcod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('COD_GRADE'          )) then Fcod_grade           := ADataSet.FieldByName('COD_GRADE').AsInteger;
    if Assigned(ADataSet.FindField('NUM_FAB_PROD'       )) then Fnum_fab_prod        := Trim(ADataSet.FieldByName('NUM_FAB_PROD').AsString);
    if Assigned(ADataSet.FindField('CEAN'               )) then Fcean                := Trim(ADataSet.FieldByName('CEAN').AsString);
    if Assigned(ADataSet.FindField('NCM'                )) then Fncm                 := Trim(ADataSet.FieldByName('NCM').AsString);
    if Assigned(ADataSet.FindField('CFOP'               )) then Fcfop                := ADataSet.FieldByName('CFOP').AsInteger;
    if Assigned(ADataSet.FindField('XPROD'              )) then Fxprod               := Trim(ADataSet.FieldByName('XPROD').AsString);
    if Assigned(ADataSet.FindField('UCOM'               )) then Fucom                := Trim(ADataSet.FieldByName('UCOM').AsString);
    if Assigned(ADataSet.FindField('QCOM'               )) then Fqcom                := ADataSet.FieldByName('QCOM').AsFloat;
    if Assigned(ADataSet.FindField('VUNCOM'             )) then Fvuncom              := ADataSet.FieldByName('VUNCOM').AsFloat;
    if Assigned(ADataSet.FindField('VPROD'              )) then Fvprod               := ADataSet.FieldByName('VPROD').AsFloat;
    if Assigned(ADataSet.FindField('VFRETE'             )) then Fvfrete              := ADataSet.FieldByName('VFRETE').AsFloat;
    if Assigned(ADataSet.FindField('VSEG'               )) then Fvseg                := ADataSet.FieldByName('VSEG').AsFloat;
    if Assigned(ADataSet.FindField('VDESC'              )) then Fvdesc               := ADataSet.FieldByName('VDESC').AsFloat;
    if Assigned(ADataSet.FindField('VOUTRO'             )) then Fvoutro              := ADataSet.FieldByName('VOUTRO').AsFloat;
    if Assigned(ADataSet.FindField('PREC_CUS_PROD'      )) then Fprec_cus_prod       := ADataSet.FieldByName('PREC_CUS_PROD').AsFloat;
    if Assigned(ADataSet.FindField('PREC_CUSM_PROD'     )) then Fprec_cusm_prod      := ADataSet.FieldByName('PREC_CUSM_PROD').AsFloat;
    if Assigned(ADataSet.FindField('CEST'               )) then Fcest                := Trim(ADataSet.FieldByName('CEST').AsString);
    if Assigned(ADataSet.FindField('NFCI'               )) then Fnfci                := Trim(ADataSet.FieldByName('NFCI').AsString);
    if Assigned(ADataSet.FindField('VTOTTRIB'           )) then Fvtottrib            := ADataSet.FieldByName('VTOTTRIB').AsFloat;
    if Assigned(ADataSet.FindField('ICM_ORIG'           )) then Ficm_orig            := Trim(ADataSet.FieldByName('ICM_ORIG').AsString);
    if Assigned(ADataSet.FindField('ICM_CST'            )) then Ficm_cst             := Trim(ADataSet.FieldByName('ICM_CST').AsString);
    if Assigned(ADataSet.FindField('ICM_MODBC'          )) then Ficm_modbc           := ADataSet.FieldByName('ICM_MODBC').AsFloat;
    if Assigned(ADataSet.FindField('ICM_PREDBC'         )) then Ficm_predbc          := ADataSet.FieldByName('ICM_PREDBC').AsFloat;
    if Assigned(ADataSet.FindField('ICM_VBC'            )) then Ficm_vbc             := ADataSet.FieldByName('ICM_VBC').AsFloat;
    if Assigned(ADataSet.FindField('ICM_PICMS'          )) then Ficm_picms           := ADataSet.FieldByName('ICM_PICMS').AsFloat;
    if Assigned(ADataSet.FindField('ICM_VICMS'          )) then Ficm_vicms           := ADataSet.FieldByName('ICM_VICMS').AsFloat;
    if Assigned(ADataSet.FindField('ICM_VBCSTRET'       )) then Ficm_vbcstret        := ADataSet.FieldByName('ICM_VBCSTRET').AsFloat;
    if Assigned(ADataSet.FindField('ICM_VICMSSTRET'     )) then Ficm_vicmsstret      := ADataSet.FieldByName('ICM_VICMSSTRET').AsFloat;
    if Assigned(ADataSet.FindField('ICM_CSOSN'          )) then Ficm_csosn           := Trim(ADataSet.FieldByName('ICM_CSOSN').AsString);
    if Assigned(ADataSet.FindField('ICM_PCREDSN'        )) then Ficm_pcredsn         := ADataSet.FieldByName('ICM_PCREDSN').AsFloat;
    if Assigned(ADataSet.FindField('ICM_VCREDICMSSN'    )) then Ficm_vcredicmssn     := ADataSet.FieldByName('ICM_VCREDICMSSN').AsFloat;
    if Assigned(ADataSet.FindField('PIS_CST'            )) then Fpis_cst             := Trim(ADataSet.FieldByName('PIS_CST').AsString);
    if Assigned(ADataSet.FindField('PIS_VBC'            )) then Fpis_vbc             := ADataSet.FieldByName('PIS_VBC').AsFloat;
    if Assigned(ADataSet.FindField('PIS_PPIS'           )) then Fpis_ppis            := ADataSet.FieldByName('PIS_PPIS').AsFloat;
    if Assigned(ADataSet.FindField('PIS_VPIS'           )) then Fpis_vpis            := ADataSet.FieldByName('PIS_VPIS').AsFloat;
    if Assigned(ADataSet.FindField('PIS_QBCPROD'        )) then Fpis_qbcprod         := ADataSet.FieldByName('PIS_QBCPROD').AsFloat;
    if Assigned(ADataSet.FindField('PIS_VALIQPROD'      )) then Fpis_valiqprod       := ADataSet.FieldByName('PIS_VALIQPROD').AsFloat;
    if Assigned(ADataSet.FindField('COFINS_CST'         )) then Fcofins_cst          := Trim(ADataSet.FieldByName('COFINS_CST').AsString);
    if Assigned(ADataSet.FindField('COFINS_VBC'         )) then Fcofins_vbc          := ADataSet.FieldByName('COFINS_VBC').AsFloat;
    if Assigned(ADataSet.FindField('COFINS_PCOFINS'     )) then Fcofins_pcofins      := ADataSet.FieldByName('COFINS_PCOFINS').AsFloat;
    if Assigned(ADataSet.FindField('COFINS_VCOFINS'     )) then Fcofins_vcofins      := ADataSet.FieldByName('COFINS_VCOFINS').AsFloat;
    if Assigned(ADataSet.FindField('COFINS_QBCPROD'     )) then Fcofins_qbcprod      := ADataSet.FieldByName('COFINS_QBCPROD').AsFloat;
    if Assigned(ADataSet.FindField('COFINS_VALIQPROD'   )) then Fcofins_valiqprod    := ADataSet.FieldByName('COFINS_VALIQPROD').AsFloat;
    if Assigned(ADataSet.FindField('ISS_VBC'            )) then Fiss_vbc             := ADataSet.FieldByName('ISS_VBC').AsFloat;
    if Assigned(ADataSet.FindField('ISS_VALIQ'          )) then Fiss_valiq           := ADataSet.FieldByName('ISS_VALIQ').AsFloat;
    if Assigned(ADataSet.FindField('ISS_VISSQN'         )) then Fiss_vissqn          := ADataSet.FieldByName('ISS_VISSQN').AsFloat;
    if Assigned(ADataSet.FindField('ISS_CMUNFG'         )) then Fiss_cmunfg          := ADataSet.FieldByName('ISS_CMUNFG').AsInteger;
    if Assigned(ADataSet.FindField('ISS_CLISTSERV'      )) then Fiss_clistserv       := Trim(ADataSet.FieldByName('ISS_CLISTSERV').AsString);
    if Assigned(ADataSet.FindField('ISS_VDEDUCAO'       )) then Fiss_vdeducao        := ADataSet.FieldByName('ISS_VDEDUCAO').AsFloat;
    if Assigned(ADataSet.FindField('ISS_VOUTRO'         )) then Fiss_voutro          := ADataSet.FieldByName('ISS_VOUTRO').AsFloat;
    if Assigned(ADataSet.FindField('ISS_VDESCINCOND'    )) then Fiss_vdescincond     := ADataSet.FieldByName('ISS_VDESCINCOND').AsFloat;
    if Assigned(ADataSet.FindField('ISS_VDESCCOND'      )) then Fiss_vdesccond       := ADataSet.FieldByName('ISS_VDESCCOND').AsFloat;
    if Assigned(ADataSet.FindField('ISS_VISSRET'        )) then Fiss_vissret         := ADataSet.FieldByName('ISS_VISSRET').AsFloat;
    if Assigned(ADataSet.FindField('ISS_INDISS'         )) then Fiss_indiss          := Trim(ADataSet.FieldByName('ISS_INDISS').AsString);
    if Assigned(ADataSet.FindField('ISS_INDINCENTIVO'   )) then Fiss_indincentivo    := Trim(ADataSet.FieldByName('ISS_INDINCENTIVO').AsString);
    if Assigned(ADataSet.FindField('ISS_RETIDO'         )) then Fiss_retido          := Trim(ADataSet.FieldByName('ISS_RETIDO').AsString);
    if Assigned(ADataSet.FindField('COD_SERVICO'        )) then Fcod_servico         := ADataSet.FieldByName('COD_SERVICO').AsInteger;
    if Assigned(ADataSet.FindField('FRETE_NA_BASE'      )) then Ffrete_na_base       := Trim(ADataSet.FieldByName('FRETE_NA_BASE').AsString);
    if Assigned(ADataSet.FindField('CALCULAR'           )) then Fcalcular            := Trim(ADataSet.FieldByName('CALCULAR').AsString);
    if Assigned(ADataSet.FindField('ALTERA_ESTOQUE_CFOP')) then Faltera_estoque_cfop := Trim(ADataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString);
    if Assigned(ADataSet.FindField('NAT_REC'            )) then Fnat_rec             := Trim(ADataSet.FieldByName('NAT_REC').AsString);
    if Assigned(ADataSet.FindField('COMB_CPRODANP'      )) then Fcomb_cprodanp       := Trim(ADataSet.FieldByName('COMB_CPRODANP').AsString);
    if Assigned(ADataSet.FindField('COMB_DESCANP'       )) then Fcomb_descanp        := Trim(ADataSet.FieldByName('COMB_DESCANP').AsString);
    if Assigned(ADataSet.FindField('COMB_PGLP'          )) then Fcomb_pglp           := ADataSet.FieldByName('COMB_PGLP').AsFloat;
    if Assigned(ADataSet.FindField('COMB_PGNN'          )) then Fcomb_pgnn           := ADataSet.FieldByName('COMB_PGNN').AsFloat;
    if Assigned(ADataSet.FindField('COMB_PGNI'          )) then Fcomb_pgni           := ADataSet.FieldByName('COMB_PGNI').AsFloat;
    if Assigned(ADataSet.FindField('COMB_VPART'         )) then Fcomb_vpart          := ADataSet.FieldByName('COMB_VPART').AsFloat;
    if Assigned(ADataSet.FindField('COMB_CODIF'         )) then Fcomb_codif          := Trim(ADataSet.FieldByName('COMB_CODIF').AsString);
    if Assigned(ADataSet.FindField('COMB_UFCONS'        )) then Fcomb_ufcons         := Trim(ADataSet.FieldByName('COMB_UFCONS').AsString);
    if Assigned(ADataSet.FindField('FCP_PFCP'           )) then Ffcp_pfcp            := ADataSet.FieldByName('FCP_PFCP').AsFloat;
    if Assigned(ADataSet.FindField('FCP_VFCP'           )) then Ffcp_vfcp            := ADataSet.FieldByName('FCP_VFCP').AsFloat;
    if Assigned(ADataSet.FindField('FCP_VBCFCP'         )) then Ffcp_vbcfcp          := ADataSet.FieldByName('FCP_VBCFCP').AsFloat;
    if Assigned(ADataSet.FindField('FCP_VBCFCPST'       )) then Ffcp_vbcfcpst        := ADataSet.FieldByName('FCP_VBCFCPST').AsFloat;
    if Assigned(ADataSet.FindField('FCP_PFCPST'         )) then Ffcp_pfcpst          := ADataSet.FieldByName('FCP_PFCPST').AsFloat;
    if Assigned(ADataSet.FindField('FCP_VFCPST'         )) then Ffcp_vfcpst          := ADataSet.FieldByName('FCP_VFCPST').AsFloat;
    if Assigned(ADataSet.FindField('FCP_PST'            )) then Ffcp_pst             := ADataSet.FieldByName('FCP_PST').AsFloat;
    if Assigned(ADataSet.FindField('FCP_VBCFCPSTRET'    )) then Ffcp_vbcfcpstret     := ADataSet.FieldByName('FCP_VBCFCPSTRET').AsFloat;
    if Assigned(ADataSet.FindField('FCP_PFCPSTRET'      )) then Ffcp_pfcpstret       := ADataSet.FieldByName('FCP_PFCPSTRET').AsFloat;
    if Assigned(ADataSet.FindField('FCP_VFCPSTRET'      )) then Ffcp_vfcpstret       := ADataSet.FieldByName('FCP_VFCPSTRET').AsFloat;
    if Assigned(ADataSet.FindField('ESC_INDESCALA'      )) then Fesc_indescala       := Trim(ADataSet.FieldByName('ESC_INDESCALA').AsString);
    if Assigned(ADataSet.FindField('ESC_CNPJFAB'        )) then Fesc_cnpjfab         := Trim(ADataSet.FieldByName('ESC_CNPJFAB').AsString);
    if Assigned(ADataSet.FindField('ICM_PREDBCEFET'     )) then Ficm_predbcefet      := ADataSet.FieldByName('ICM_PREDBCEFET').AsFloat;
    if Assigned(ADataSet.FindField('ICM_VBCEFET'        )) then Ficm_vbcefet         := ADataSet.FieldByName('ICM_VBCEFET').AsFloat;
    if Assigned(ADataSet.FindField('ICM_PICMSEFET'      )) then Ficm_picmsefet       := ADataSet.FieldByName('ICM_PICMSEFET').AsFloat;
    if Assigned(ADataSet.FindField('ICM_VICMSEFET'      )) then Ficm_vicmsefet       := ADataSet.FieldByName('ICM_VICMSEFET').AsFloat;
    if Assigned(ADataSet.FindField('QBCMONORET'         )) then Fqbcmonoret          := ADataSet.FieldByName('QBCMONORET').AsFloat;
    if Assigned(ADataSet.FindField('ADREMICMSRET'       )) then Fadremicmsret        := ADataSet.FieldByName('ADREMICMSRET').AsFloat;
    if Assigned(ADataSet.FindField('VICMSMONORET'       )) then Fvicmsmonoret        := ADataSet.FieldByName('VICMSMONORET').AsFloat;
    if Assigned(ADataSet.FindField('QTRIB'              )) then Fqtrib               := ADataSet.FieldByName('QTRIB').AsFloat;
    if Assigned(ADataSet.FindField('UTRIB'              )) then Futrib               := Trim(ADataSet.FieldByName('UTRIB').AsString);
    if Assigned(ADataSet.FindField('UVND'               )) then Fuvnd                := Trim(ADataSet.FieldByName('UVND').AsString);
    if Assigned(ADataSet.FindField('UVND_FATOR'         )) then Fuvnd_fator          := ADataSet.FieldByName('UVND_FATOR').AsFloat;
    if Assigned(ADataSet.FindField('VITEM'              )) then Fvitem               := ADataSet.FieldByName('VITEM').AsFloat;
    if Assigned(ADataSet.FindField('DFE_TRIB_ID'        )) then Fdfe_trib_id         := Trim(ADataSet.FieldByName('DFE_TRIB_ID').AsString);
  end;
end;

{ TNfce_item_classList }

function TNfce_item_classList.GetItem(Index: Integer): TNfce_item_class;
begin
  Result := TNfce_item_class(inherited Items[Index]);
end;

function TNfce_item_classList.New: TNfce_item_class;
begin
  Result := TNfce_item_class.Create;
  Add(Result);
end;

procedure TNfce_item_classList.SetItem(Index: Integer; const Value: TNfce_item_class);
begin
  Put(Index, Value);
end;

procedure TNfce_item_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
