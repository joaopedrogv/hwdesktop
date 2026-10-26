unit nfc_class;

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
  Tnfc_class = class(TBaseFb_class)
  private
    Fcod_nfce                : Integer;
    Fcod_empresa             : Integer;
    Fcod_cliente             : Variant;
    Fserie                   : Variant;
    Fnum_nf                  : Variant;
    Fmodelo                  : string;
    Fdhemi                   : Variant;
    Fdata_lanc               : Variant;
    Fstatus                  : string;
    Fnatop                   : string;
    Ftpimp                   : string;
    Ftpemis                  : string;
    Ftpamb                   : string;
    Findpres                 : string;
    Fsituacao_nfce           : string;
    Fchave_nfce              : string;
    Fcnf                     : Variant;
    Fnprot                   : string;
    Fvbc                     : Variant;
    Fvicms                   : Variant;
    Fvprod                   : Variant;
    Fvfrete                  : Variant;
    Fvseg                    : Variant;
    Fvdesc                   : Variant;
    Fvpis                    : Variant;
    Fvcofins                 : Variant;
    Fvoutro                  : Variant;
    Fvnf                     : Variant;
    Fvtottrib                : Variant;
    Fmodfrete                : string;
    Ftr_codigo               : Variant;
    Fdata_cad                : Variant;
    Fdata_mod                : Variant;
    Fus_mod                  : Variant;
    Fdesc_por_item           : string;
    Fseqpreco                : string;
    Finfadfisco              : TStrings;
    Finfcpl                  : TStrings;
    Fativo                   : Variant;
    Fcstat                   : string;
    Fxmotivo                 : string;
    Fdigval                  : string;
    Fdhrecbto                : Variant;
    Fmsgretorno              : string;
    Fxml_nfce                : TStrings;
    Fcont_alt                : Variant;
    Fcod_nfce_conting        : Variant;
    Fcod_nfce_original       : Variant;
    Fcont_dhcont             : Variant;
    Fcont_xjust              : string;
    Fcanc_xjust              : string;
    Fcanc_cstat              : Variant;
    Fcanc_xmotivo            : string;
    Fcanc_nprot              : string;
    Fcanc_dhrecbto           : Variant;
    Fcanc_xml_nfce           : TStrings;
    Finut_xjust              : string;
    Finut_cstat              : Variant;
    Finut_xmotivo            : string;
    Finut_nprot              : string;
    Finut_dhrecbto           : Variant;
    Finut_xml_nfce           : TStrings;
    Fcont_msg                : Variant;
    Fped_origem_num          : Variant;
    Fped_origem_tip          : string;
    Fped_destino_num         : Variant;
    Fped_destino_tip         : string;
    Fcod_vendedor            : Variant;
    Fcod_cond_pag            : Variant;
    Ffrete_na_base           : string;
    Fvfcp                    : Variant;
    Fvfcpst                  : Variant;
    Fvfcpstret               : Variant;
    Fvtroco                  : Variant;
    Fnfe_versao              : string;
    Fcod_emissor             : Variant;
    Fhashnfc                 : string;
    Findintermed             : string;
    Finfintermed_cnpj        : string;
    Finfintermed_idcadinttran: string;
    Fcod_nfce_complementada  : Variant;
    Fdfe_trib_ignorar        : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property cod_nfce                : Integer  read Fcod_nfce                 write Fcod_nfce;
    property cod_empresa             : Integer  read Fcod_empresa              write Fcod_empresa;
    property cod_cliente             : Variant  read Fcod_cliente              write Fcod_cliente;
    property serie                   : Variant  read Fserie                    write Fserie;
    property num_nf                  : Variant  read Fnum_nf                   write Fnum_nf;
    property modelo                  : string   read Fmodelo                   write Fmodelo;
    property dhemi                   : Variant  read Fdhemi                    write Fdhemi;
    property data_lanc               : Variant  read Fdata_lanc                write Fdata_lanc;
    property status                  : string   read Fstatus                   write Fstatus;
    property natop                   : string   read Fnatop                    write Fnatop;
    property tpimp                   : string   read Ftpimp                    write Ftpimp;
    property tpemis                  : string   read Ftpemis                   write Ftpemis;
    property tpamb                   : string   read Ftpamb                    write Ftpamb;
    property indpres                 : string   read Findpres                  write Findpres;
    property situacao_nfce           : string   read Fsituacao_nfce            write Fsituacao_nfce;
    property chave_nfce              : string   read Fchave_nfce               write Fchave_nfce;
    property cnf                     : Variant  read Fcnf                      write Fcnf;
    property nprot                   : string   read Fnprot                    write Fnprot;
    property vbc                     : Variant  read Fvbc                      write Fvbc;
    property vicms                   : Variant  read Fvicms                    write Fvicms;
    property vprod                   : Variant  read Fvprod                    write Fvprod;
    property vfrete                  : Variant  read Fvfrete                   write Fvfrete;
    property vseg                    : Variant  read Fvseg                     write Fvseg;
    property vdesc                   : Variant  read Fvdesc                    write Fvdesc;
    property vpis                    : Variant  read Fvpis                     write Fvpis;
    property vcofins                 : Variant  read Fvcofins                  write Fvcofins;
    property voutro                  : Variant  read Fvoutro                   write Fvoutro;
    property vnf                     : Variant  read Fvnf                      write Fvnf;
    property vtottrib                : Variant  read Fvtottrib                 write Fvtottrib;
    property modfrete                : string   read Fmodfrete                 write Fmodfrete;
    property tr_codigo               : Variant  read Ftr_codigo                write Ftr_codigo;
    property data_cad                : Variant  read Fdata_cad                 write Fdata_cad;
    property data_mod                : Variant  read Fdata_mod                 write Fdata_mod;
    property us_mod                  : Variant  read Fus_mod                   write Fus_mod;
    property desc_por_item           : string   read Fdesc_por_item            write Fdesc_por_item;
    property seqpreco                : string   read Fseqpreco                 write Fseqpreco;
    property infadfisco              : TStrings read Finfadfisco               write Finfadfisco;
    property infcpl                  : TStrings read Finfcpl                   write Finfcpl;
    property ativo                   : Variant  read Fativo                    write Fativo;
    property cstat                   : string   read Fcstat                    write Fcstat;
    property xmotivo                 : string   read Fxmotivo                  write Fxmotivo;
    property digval                  : string   read Fdigval                   write Fdigval;
    property dhrecbto                : Variant  read Fdhrecbto                 write Fdhrecbto;
    property msgretorno              : string   read Fmsgretorno               write Fmsgretorno;
    property xml_nfce                : TStrings read Fxml_nfce                 write Fxml_nfce;
    property cont_alt                : Variant  read Fcont_alt                 write Fcont_alt;
    property cod_nfce_conting        : Variant  read Fcod_nfce_conting         write Fcod_nfce_conting;
    property cod_nfce_original       : Variant  read Fcod_nfce_original        write Fcod_nfce_original;
    property cont_dhcont             : Variant  read Fcont_dhcont              write Fcont_dhcont;
    property cont_xjust              : string   read Fcont_xjust               write Fcont_xjust;
    property canc_xjust              : string   read Fcanc_xjust               write Fcanc_xjust;
    property canc_cstat              : Variant  read Fcanc_cstat               write Fcanc_cstat;
    property canc_xmotivo            : string   read Fcanc_xmotivo             write Fcanc_xmotivo;
    property canc_nprot              : string   read Fcanc_nprot               write Fcanc_nprot;
    property canc_dhrecbto           : Variant  read Fcanc_dhrecbto            write Fcanc_dhrecbto;
    property canc_xml_nfce           : TStrings read Fcanc_xml_nfce            write Fcanc_xml_nfce;
    property inut_xjust              : string   read Finut_xjust               write Finut_xjust;
    property inut_cstat              : Variant  read Finut_cstat               write Finut_cstat;
    property inut_xmotivo            : string   read Finut_xmotivo             write Finut_xmotivo;
    property inut_nprot              : string   read Finut_nprot               write Finut_nprot;
    property inut_dhrecbto           : Variant  read Finut_dhrecbto            write Finut_dhrecbto;
    property inut_xml_nfce           : TStrings read Finut_xml_nfce            write Finut_xml_nfce;
    property cont_msg                : Variant  read Fcont_msg                 write Fcont_msg;
    property ped_origem_num          : Variant  read Fped_origem_num           write Fped_origem_num;
    property ped_origem_tip          : string   read Fped_origem_tip           write Fped_origem_tip;
    property ped_destino_num         : Variant  read Fped_destino_num          write Fped_destino_num;
    property ped_destino_tip         : string   read Fped_destino_tip          write Fped_destino_tip;
    property cod_vendedor            : Variant  read Fcod_vendedor             write Fcod_vendedor;
    property cod_cond_pag            : Variant  read Fcod_cond_pag             write Fcod_cond_pag;
    property frete_na_base           : string   read Ffrete_na_base            write Ffrete_na_base;
    property vfcp                    : Variant  read Fvfcp                     write Fvfcp;
    property vfcpst                  : Variant  read Fvfcpst                   write Fvfcpst;
    property vfcpstret               : Variant  read Fvfcpstret                write Fvfcpstret;
    property vtroco                  : Variant  read Fvtroco                   write Fvtroco;
    property nfe_versao              : string   read Fnfe_versao               write Fnfe_versao;
    property cod_emissor             : Variant  read Fcod_emissor              write Fcod_emissor;
    property hashnfc                 : string   read Fhashnfc                  write Fhashnfc;
    property indintermed             : string   read Findintermed              write Findintermed;
    property infintermed_cnpj        : string   read Finfintermed_cnpj         write Finfintermed_cnpj;
    property infintermed_idcadinttran: string   read Finfintermed_idcadinttran write Finfintermed_idcadinttran;
    property cod_nfce_complementada  : Variant  read Fcod_nfce_complementada   write Fcod_nfce_complementada;
    property dfe_trib_ignorar        : Variant  read Fdfe_trib_ignorar         write Fdfe_trib_ignorar;
  end;

  TnfcList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): Tnfc_class;
    procedure SetItem(Index: Integer; const Value: Tnfc_class);
  public
    function New: Tnfc_class;

    property Items[Index: Integer]: Tnfc_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ Tnfc_class }

procedure Tnfc_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NFCE');
  with FTable.Fields do
  begin
    AddField('COD_NFCE'                , fkInteger , 0  , False, True              );
    AddField('COD_EMPRESA'             , fkInteger , 0  , False, True , True       );
    AddField('COD_CLIENTE'             , fkInteger , 0  , True , False, True       );
    AddField('SERIE'                   , fkInteger                                 );
    AddField('NUM_NF'                  , fkInteger                                 );
    AddField('MODELO'                  , fkString  , 2                             );
    AddField('DHEMI'                   , fkDateTime                                );
    AddField('DATA_LANC'               , fkDateTime                                );
    AddField('STATUS'                  , fkString  , 10                            );
    AddField('NATOP'                   , fkString  , 60                            );
    AddField('TPIMP'                   , fkString  , 1                             );
    AddField('TPEMIS'                  , fkString  , 1                             );
    AddField('TPAMB'                   , fkString  , 1                             );
    AddField('INDPRES'                 , fkString  , 1                             );
    AddField('SITUACAO_NFCE'           , fkString  , 16                            );
    AddField('CHAVE_NFCE'              , fkString  , 44                            );
    AddField('CNF'                     , fkInteger                                 );
    AddField('NPROT'                   , fkString  , 17                            );
    AddField('VBC'                     , fkFloat   , 0  , True , False, False, True);
    AddField('VICMS'                   , fkFloat   , 0  , True , False, False, True);
    AddField('VPROD'                   , fkFloat   , 0  , True , False, False, True);
    AddField('VFRETE'                  , fkFloat   , 0  , True , False, False, True);
    AddField('VSEG'                    , fkFloat   , 0  , True , False, False, True);
    AddField('VDESC'                   , fkFloat   , 0  , True , False, False, True);
    AddField('VPIS'                    , fkFloat   , 0  , True , False, False, True);
    AddField('VCOFINS'                 , fkFloat   , 0  , True , False, False, True);
    AddField('VOUTRO'                  , fkFloat   , 0  , True , False, False, True);
    AddField('VNF'                     , fkFloat   , 0  , True , False, False, True);
    AddField('VTOTTRIB'                , fkFloat   , 0  , True , False, False, True);
    AddField('MODFRETE'                , fkString  , 1                             );
    AddField('TR_CODIGO'               , fkInteger                                 );
    AddField('DATA_CAD'                , fkDateTime                                );
    AddField('DATA_MOD'                , fkDateTime                                );
    AddField('US_MOD'                  , fkInteger                                 );
    AddField('DESC_POR_ITEM'           , fkString  , 1  , True , False, False, True);
    AddField('SEQPRECO'                , fkString  , 1                             );
    AddField('INFADFISCO'              , fkTStrings                                );
    AddField('INFCPL'                  , fkTStrings                                );
    AddField('ATIVO'                   , fkInteger , 0  , True , False, False, True);
    AddField('CSTAT'                   , fkString  , 4                             );
    AddField('XMOTIVO'                 , fkString  , 255                           );
    AddField('DIGVAL'                  , fkString  , 28                            );
    AddField('DHRECBTO'                , fkDateTime                                );
    AddField('MSGRETORNO'              , fkString  , 255                           );
    AddField('XML_NFCE'                , fkTStrings                                );
    AddField('CONT_ALT'                , fkInteger                                 );
    AddField('COD_NFCE_CONTING'        , fkInteger                                 );
    AddField('COD_NFCE_ORIGINAL'       , fkInteger                                 );
    AddField('CONT_DHCONT'             , fkDateTime                                );
    AddField('CONT_XJUST'              , fkString  , 256                           );
    AddField('CANC_XJUST'              , fkString  , 255                           );
    AddField('CANC_CSTAT'              , fkInteger                                 );
    AddField('CANC_XMOTIVO'            , fkString  , 255                           );
    AddField('CANC_NPROT'              , fkString  , 17                            );
    AddField('CANC_DHRECBTO'           , fkDateTime                                );
    AddField('CANC_XML_NFCE'           , fkTStrings                                );
    AddField('INUT_XJUST'              , fkString  , 255                           );
    AddField('INUT_CSTAT'              , fkInteger                                 );
    AddField('INUT_XMOTIVO'            , fkString  , 255                           );
    AddField('INUT_NPROT'              , fkString  , 17                            );
    AddField('INUT_DHRECBTO'           , fkDateTime                                );
    AddField('INUT_XML_NFCE'           , fkTStrings                                );
    AddField('CONT_MSG'                , fkInteger                                 );
    AddField('PED_ORIGEM_NUM'          , fkInteger                                 );
    AddField('PED_ORIGEM_TIP'          , fkString  , 3                             );
    AddField('PED_DESTINO_NUM'         , fkInteger                                 );
    AddField('PED_DESTINO_TIP'         , fkString  , 3                             );
    AddField('COD_VENDEDOR'            , fkInteger , 0  , True , False, True       );
    AddField('COD_COND_PAG'            , fkInteger , 0  , True , False, True       );
    AddField('FRETE_NA_BASE'           , fkString  , 1                             );
    AddField('VFCP'                    , fkFloat   , 0  , True , False, False, True);
    AddField('VFCPST'                  , fkFloat   , 0  , True , False, False, True);
    AddField('VFCPSTRET'               , fkFloat   , 0  , True , False, False, True);
    AddField('VTROCO'                  , fkFloat   , 0  , True , False, False, True);
    AddField('NFE_VERSAO'              , fkString  , 8                             );
    AddField('COD_EMISSOR'             , fkInteger                                 );
    AddField('HASHNFC'                 , fkString  , 32                            );
    AddField('INDINTERMED'             , fkString  , 1                             );
    AddField('INFINTERMED_CNPJ'        , fkString  , 14                            );
    AddField('INFINTERMED_IDCADINTTRAN', fkString  , 60                            );
    AddField('COD_NFCE_COMPLEMENTADA'  , fkInteger , 0  , True , False, True       );
    AddField('DFE_TRIB_IGNORAR'        , fkInteger                                 );
  end;
  Finfadfisco    := TStringList.Create;
  Finfcpl        := TStringList.Create;
  Fxml_nfce      := TStringList.Create;
  Fcanc_xml_nfce := TStringList.Create;
  Finut_xml_nfce := TStringList.Create;
end;

constructor Tnfc_class.Create;
begin
  InitializeObjects;
end;

destructor Tnfc_class.Destroy;
begin
  if Assigned(Finfadfisco) then
    FreeAndNil(Finfadfisco);
  if Assigned(Finfcpl) then
    FreeAndNil(Finfcpl);
  if Assigned(Fxml_nfce) then
    FreeAndNil(Fxml_nfce);
  if Assigned(Fcanc_xml_nfce) then
    FreeAndNil(Fcanc_xml_nfce);
  if Assigned(Finut_xml_nfce) then
    FreeAndNil(Finut_xml_nfce);
  inherited;
end;

{ TnfcList }

function TnfcList.GetItem(Index: Integer): Tnfc_class;
begin
  Result := Tnfc_class(inherited Items[Index]);
end;

function TnfcList.New: Tnfc_class;
begin
  Result := Tnfc_class.Create;
  Add(Result);
end;

procedure TnfcList.SetItem(Index: Integer; const Value: Tnfc_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(Tnfc_class);
finalization
  UnRegisterClass(Tnfc_class);

end.
