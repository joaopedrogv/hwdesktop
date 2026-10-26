unit nfce_class;

interface

uses
{$IFDEF VER180}
  Classes,
  Contnrs,
  DB;
{$ELSE}
  System.Classes,
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TNfce_class = class(TObject)
  private
    Fcod_nfce                : Integer;
    Fcod_empresa             : Integer;
    Fcod_cliente             : Integer;
    Fserie                   : Integer;
    Fnum_nf                  : Integer;
    Fmodelo                  : string;
    Fdhemi                   : TDateTime;
    Fdata_lanc               : TDateTime;
    Fstatus                  : string;
    Fnatop                   : string;
    Ftpimp                   : string;
    Ftpemis                  : string;
    Ftpamb                   : string;
    Findpres                 : string;
    Fsituacao_nfce           : string;
    Fchave_nfce              : string;
    Fcnf                     : Integer;
    Fnprot                   : string;
    Fvbc                     : Double;
    Fvicms                   : Double;
    Fvprod                   : Double;
    Fvfrete                  : Double;
    Fvseg                    : Double;
    Fvdesc                   : Double;
    Fvpis                    : Double;
    Fvcofins                 : Double;
    Fvoutro                  : Double;
    Fvnf                     : Double;
    Fvtottrib                : Double;
    Fmodfrete                : string;
    Ftr_codigo               : Integer;
    Fdata_cad                : TDateTime;
    Fdata_mod                : TDateTime;
    Fus_mod                  : Integer;
    Fdesc_por_item           : string;
    Fseqpreco                : string;
    Finfadfisco              : TStrings;
    Finfcpl                  : TStrings;
    Fativo                   : Integer;
    Fcstat                   : string;
    Fxmotivo                 : string;
    Fdigval                  : string;
    Fdhrecbto                : TDateTime;
    Fmsgretorno              : string;
    Fxml_nfce                : TStrings;
    Fcont_alt                : Integer;
    Fcod_nfce_conting        : Integer;
    Fcod_nfce_original       : Integer;
    Fcont_dhcont             : TDateTime;
    Fcont_xjust              : string;
    Fcanc_xjust              : string;
    Fcanc_cstat              : Integer;
    Fcanc_xmotivo            : string;
    Fcanc_nprot              : string;
    Fcanc_dhrecbto           : TDateTime;
    Fcanc_xml_nfce           : TStrings;
    Finut_xjust              : string;
    Finut_cstat              : Integer;
    Finut_xmotivo            : string;
    Finut_nprot              : string;
    Finut_dhrecbto           : TDateTime;
    Finut_xml_nfce           : TStrings;
    Fcont_msg                : Integer;
    Fped_origem_num          : Integer;
    Fped_origem_tip          : string;
    Fped_destino_num         : Integer;
    Fped_destino_tip         : string;
    Fcod_vendedor            : Integer;
    Fcod_cond_pag            : Integer;
    Ffrete_na_base           : string;
    Fvfcp                    : Double;
    Fvfcpst                  : Double;
    Fvfcpstret               : Double;
    Fvtroco                  : Double;
    Fnfe_versao              : string;
    Fcod_emissor             : Integer;
    Fhashnfc                 : string;
    Fnorc                    : Integer;
    Fmov_id                  : Integer;
    Foperador                : Integer;
    Fmov_seq                 : Integer;
    Findintermed             : string;
    Finfintermed_cnpj        : string;
    Finfintermed_idcadinttran: string;
    Fguidt                   : string;
    Fguid_nfce_conting       : string;
    Fguid_nfce_original      : string;
    Fcod_nfce_complementada  : Integer;
    Fcmunfgibs               : Integer;
    Fdfe_trib_ignorar        : Integer;
    Fvnftot                  : Double;
    Fvbcibscbs               : Double;
    Fibsuf_vdif              : Double;
    Fibsuf_vdevtrib          : Double;
    Fvibsuf                  : Double;
    Fibsmun_vdif             : Double;
    Fibsmun_vdevtrib         : Double;
    Fvibsmun                 : Double;
    Fvibs                    : Double;
    Fcbs_vdif                : Double;
    Fcbs_vdevtrib            : Double;
    Fvcbs                    : Double;
    Fvibsmono                : Double;
    Fvcbsmono                : Double;
    Fvibsmonoreten           : Double;
    Fvcbsmonoreten           : Double;
    Fvibsmonoret             : Double;
    Fvcbsmonoret             : Double;
    Fvis                     : Double;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_nfce                : Integer   read Fcod_nfce                 write Fcod_nfce;
    property cod_empresa             : Integer   read Fcod_empresa              write Fcod_empresa;
    property cod_cliente             : Integer   read Fcod_cliente              write Fcod_cliente;
    property serie                   : Integer   read Fserie                    write Fserie;
    property num_nf                  : Integer   read Fnum_nf                   write Fnum_nf;
    property modelo                  : string    read Fmodelo                   write Fmodelo;
    property dhemi                   : TDateTime read Fdhemi                    write Fdhemi;
    property data_lanc               : TDateTime read Fdata_lanc                write Fdata_lanc;
    property status                  : string    read Fstatus                   write Fstatus;
    property natop                   : string    read Fnatop                    write Fnatop;
    property tpimp                   : string    read Ftpimp                    write Ftpimp;
    property tpemis                  : string    read Ftpemis                   write Ftpemis;
    property tpamb                   : string    read Ftpamb                    write Ftpamb;
    property indpres                 : string    read Findpres                  write Findpres;
    property situacao_nfce           : string    read Fsituacao_nfce            write Fsituacao_nfce;
    property chave_nfce              : string    read Fchave_nfce               write Fchave_nfce;
    property cnf                     : Integer   read Fcnf                      write Fcnf;
    property nprot                   : string    read Fnprot                    write Fnprot;
    property vbc                     : Double    read Fvbc                      write Fvbc;
    property vicms                   : Double    read Fvicms                    write Fvicms;
    property vprod                   : Double    read Fvprod                    write Fvprod;
    property vfrete                  : Double    read Fvfrete                   write Fvfrete;
    property vseg                    : Double    read Fvseg                     write Fvseg;
    property vdesc                   : Double    read Fvdesc                    write Fvdesc;
    property vpis                    : Double    read Fvpis                     write Fvpis;
    property vcofins                 : Double    read Fvcofins                  write Fvcofins;
    property voutro                  : Double    read Fvoutro                   write Fvoutro;
    property vnf                     : Double    read Fvnf                      write Fvnf;
    property vtottrib                : Double    read Fvtottrib                 write Fvtottrib;
    property modfrete                : string    read Fmodfrete                 write Fmodfrete;
    property tr_codigo               : Integer   read Ftr_codigo                write Ftr_codigo;
    property data_cad                : TDateTime read Fdata_cad                 write Fdata_cad;
    property data_mod                : TDateTime read Fdata_mod                 write Fdata_mod;
    property us_mod                  : Integer   read Fus_mod                   write Fus_mod;
    property desc_por_item           : string    read Fdesc_por_item            write Fdesc_por_item;
    property seqpreco                : string    read Fseqpreco                 write Fseqpreco;
    property infadfisco              : TStrings  read Finfadfisco               write Finfadfisco;
    property infcpl                  : TStrings  read Finfcpl                   write Finfcpl;
    property ativo                   : Integer   read Fativo                    write Fativo;
    property cstat                   : string    read Fcstat                    write Fcstat;
    property xmotivo                 : string    read Fxmotivo                  write Fxmotivo;
    property digval                  : string    read Fdigval                   write Fdigval;
    property dhrecbto                : TDateTime read Fdhrecbto                 write Fdhrecbto;
    property msgretorno              : string    read Fmsgretorno               write Fmsgretorno;
    property xml_nfce                : TStrings  read Fxml_nfce                 write Fxml_nfce;
    property cont_alt                : Integer   read Fcont_alt                 write Fcont_alt;
    property cod_nfce_conting        : Integer   read Fcod_nfce_conting         write Fcod_nfce_conting;
    property cod_nfce_original       : Integer   read Fcod_nfce_original        write Fcod_nfce_original;
    property cont_dhcont             : TDateTime read Fcont_dhcont              write Fcont_dhcont;
    property cont_xjust              : string    read Fcont_xjust               write Fcont_xjust;
    property canc_xjust              : string    read Fcanc_xjust               write Fcanc_xjust;
    property canc_cstat              : Integer   read Fcanc_cstat               write Fcanc_cstat;
    property canc_xmotivo            : string    read Fcanc_xmotivo             write Fcanc_xmotivo;
    property canc_nprot              : string    read Fcanc_nprot               write Fcanc_nprot;
    property canc_dhrecbto           : TDateTime read Fcanc_dhrecbto            write Fcanc_dhrecbto;
    property canc_xml_nfce           : TStrings  read Fcanc_xml_nfce            write Fcanc_xml_nfce;
    property inut_xjust              : string    read Finut_xjust               write Finut_xjust;
    property inut_cstat              : Integer   read Finut_cstat               write Finut_cstat;
    property inut_xmotivo            : string    read Finut_xmotivo             write Finut_xmotivo;
    property inut_nprot              : string    read Finut_nprot               write Finut_nprot;
    property inut_dhrecbto           : TDateTime read Finut_dhrecbto            write Finut_dhrecbto;
    property inut_xml_nfce           : TStrings  read Finut_xml_nfce            write Finut_xml_nfce;
    property cont_msg                : Integer   read Fcont_msg                 write Fcont_msg;
    property ped_origem_num          : Integer   read Fped_origem_num           write Fped_origem_num;
    property ped_origem_tip          : string    read Fped_origem_tip           write Fped_origem_tip;
    property ped_destino_num         : Integer   read Fped_destino_num          write Fped_destino_num;
    property ped_destino_tip         : string    read Fped_destino_tip          write Fped_destino_tip;
    property cod_vendedor            : Integer   read Fcod_vendedor             write Fcod_vendedor;
    property cod_cond_pag            : Integer   read Fcod_cond_pag             write Fcod_cond_pag;
    property frete_na_base           : string    read Ffrete_na_base            write Ffrete_na_base;
    property vfcp                    : Double    read Fvfcp                     write Fvfcp;
    property vfcpst                  : Double    read Fvfcpst                   write Fvfcpst;
    property vfcpstret               : Double    read Fvfcpstret                write Fvfcpstret;
    property vtroco                  : Double    read Fvtroco                   write Fvtroco;
    property nfe_versao              : string    read Fnfe_versao               write Fnfe_versao;
    property cod_emissor             : Integer   read Fcod_emissor              write Fcod_emissor;
    property hashnfc                 : string    read Fhashnfc                  write Fhashnfc;
    property norc                    : Integer   read Fnorc                     write Fnorc;
    property mov_id                  : Integer   read Fmov_id                   write Fmov_id;
    property operador                : Integer   read Foperador                 write Foperador;
    property mov_seq                 : Integer   read Fmov_seq                  write Fmov_seq;
    property indintermed             : string    read Findintermed              write Findintermed;
    property infintermed_cnpj        : string    read Finfintermed_cnpj         write Finfintermed_cnpj;
    property infintermed_idcadinttran: string    read Finfintermed_idcadinttran write Finfintermed_idcadinttran;
    property guidt                   : string    read Fguidt                    write Fguidt;
    property guid_nfce_conting       : string    read Fguid_nfce_conting        write Fguid_nfce_conting;
    property guid_nfce_original      : string    read Fguid_nfce_original       write Fguid_nfce_original;
    property cod_nfce_complementada  : Integer   read Fcod_nfce_complementada   write Fcod_nfce_complementada;
    property cmunfgibs               : Integer   read Fcmunfgibs                write Fcmunfgibs;
    property dfe_trib_ignorar        : Integer   read Fdfe_trib_ignorar         write Fdfe_trib_ignorar;
    property vnftot                  : Double    read Fvnftot                   write Fvnftot;
    property vbcibscbs               : Double    read Fvbcibscbs                write Fvbcibscbs;
    property ibsuf_vdif              : Double    read Fibsuf_vdif               write Fibsuf_vdif;
    property ibsuf_vdevtrib          : Double    read Fibsuf_vdevtrib           write Fibsuf_vdevtrib;
    property vibsuf                  : Double    read Fvibsuf                   write Fvibsuf;
    property ibsmun_vdif             : Double    read Fibsmun_vdif              write Fibsmun_vdif;
    property ibsmun_vdevtrib         : Double    read Fibsmun_vdevtrib          write Fibsmun_vdevtrib;
    property vibsmun                 : Double    read Fvibsmun                  write Fvibsmun;
    property vibs                    : Double    read Fvibs                     write Fvibs;
    property cbs_vdif                : Double    read Fcbs_vdif                 write Fcbs_vdif;
    property cbs_vdevtrib            : Double    read Fcbs_vdevtrib             write Fcbs_vdevtrib;
    property vcbs                    : Double    read Fvcbs                     write Fvcbs;
    property vibsmono                : Double    read Fvibsmono                 write Fvibsmono;
    property vcbsmono                : Double    read Fvcbsmono                 write Fvcbsmono;
    property vibsmonoreten           : Double    read Fvibsmonoreten            write Fvibsmonoreten;
    property vcbsmonoreten           : Double    read Fvcbsmonoreten            write Fvcbsmonoreten;
    property vibsmonoret             : Double    read Fvibsmonoret              write Fvibsmonoret;
    property vcbsmonoret             : Double    read Fvcbsmonoret              write Fvcbsmonoret;
    property vis                     : Double    read Fvis                      write Fvis;
  end;

  TNfce_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNfce_class;
    procedure SetItem(Index: Integer; const Value: TNfce_class);
  public
    function New: TNfce_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNfce_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TNfce_class }

constructor TNfce_class.Create;
begin
  Finfadfisco    := TStringList.Create;
  Finfcpl        := TStringList.Create;
  Fativo         := 1;
  Fxml_nfce      := TStringList.Create;
  Fcanc_xml_nfce := TStringList.Create;
  Finut_xml_nfce := TStringList.Create;
end;

destructor TNfce_class.Destroy;
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

class function TNfce_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nfce, @cod_empresa, @cod_cliente, @serie, @num_nf, @modelo, @dhemi, @data_lanc, @status, @natop, @tpimp,' +
            ' @tpemis, @tpamb, @indpres, @situacao_nfce, @chave_nfce, @cnf, @nprot, @vbc, @vicms, @vprod, @vfrete, @vseg,' +
            ' @vdesc, @vpis, @vcofins, @voutro, @vnf, @vtottrib, @modfrete, @tr_codigo, @data_cad, @data_mod, @us_mod,' +
            ' @desc_por_item, @seqpreco, @infadfisco, @infcpl, @ativo, @cstat, @xmotivo, @digval, @dhrecbto, @msgretorno,' +
            ' @xml_nfce, @cont_alt, @cod_nfce_conting, @cod_nfce_original, @cont_dhcont, @cont_xjust, @canc_xjust,' +
            ' @canc_cstat, @canc_xmotivo, @canc_nprot, @canc_dhrecbto, @canc_xml_nfce, @inut_xjust, @inut_cstat,' +
            ' @inut_xmotivo, @inut_nprot, @inut_dhrecbto, @inut_xml_nfce, @cont_msg, @ped_origem_num, @ped_origem_tip,' +
            ' @ped_destino_num, @ped_destino_tip, @cod_vendedor, @cod_cond_pag, @frete_na_base, @vfcp, @vfcpst,' +
            ' @vfcpstret, @vtroco, @nfe_versao, @cod_emissor, @hashnfc, @norc, @mov_id, @operador, @mov_seq, @indintermed,' +
            ' @infintermed_cnpj, @infintermed_idcadinttran, @guidt, @guid_nfce_conting, @guid_nfce_original,' +
            ' @cod_nfce_complementada, @cmunfgibs, @dfe_trib_ignorar, @vnftot, @vbcibscbs, @ibsuf_vdif, @ibsuf_vdevtrib,' +
            ' @vibsuf, @ibsmun_vdif, @ibsmun_vdevtrib, @vibsmun, @vibs, @cbs_vdif, @cbs_vdevtrib, @vcbs, @vibsmono,' +
            ' @vcbsmono, @vibsmonoreten, @vcbsmonoreten, @vibsmonoret, @vcbsmonoret, @vis';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNfce_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nfce                 := ADataSet.FieldByName('COD_NFCE').AsInteger;
    Fcod_empresa              := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_cliente              := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    Fserie                    := ADataSet.FieldByName('SERIE').AsInteger;
    Fnum_nf                   := ADataSet.FieldByName('NUM_NF').AsInteger;
    Fmodelo                   := Trim(ADataSet.FieldByName('MODELO').AsString);
    Fdhemi                    := ADataSet.FieldByName('DHEMI').AsDateTime;
    Fdata_lanc                := ADataSet.FieldByName('DATA_LANC').AsDateTime;
    Fstatus                   := Trim(ADataSet.FieldByName('STATUS').AsString);
    Fnatop                    := Trim(ADataSet.FieldByName('NATOP').AsString);
    Ftpimp                    := Trim(ADataSet.FieldByName('TPIMP').AsString);
    Ftpemis                   := Trim(ADataSet.FieldByName('TPEMIS').AsString);
    Ftpamb                    := Trim(ADataSet.FieldByName('TPAMB').AsString);
    Findpres                  := Trim(ADataSet.FieldByName('INDPRES').AsString);
    Fsituacao_nfce            := Trim(ADataSet.FieldByName('SITUACAO_NFCE').AsString);
    Fchave_nfce               := Trim(ADataSet.FieldByName('CHAVE_NFCE').AsString);
    Fcnf                      := ADataSet.FieldByName('CNF').AsInteger;
    Fnprot                    := Trim(ADataSet.FieldByName('NPROT').AsString);
    Fvbc                      := ADataSet.FieldByName('VBC').AsFloat;
    Fvicms                    := ADataSet.FieldByName('VICMS').AsFloat;
    Fvprod                    := ADataSet.FieldByName('VPROD').AsFloat;
    Fvfrete                   := ADataSet.FieldByName('VFRETE').AsFloat;
    Fvseg                     := ADataSet.FieldByName('VSEG').AsFloat;
    Fvdesc                    := ADataSet.FieldByName('VDESC').AsFloat;
    Fvpis                     := ADataSet.FieldByName('VPIS').AsFloat;
    Fvcofins                  := ADataSet.FieldByName('VCOFINS').AsFloat;
    Fvoutro                   := ADataSet.FieldByName('VOUTRO').AsFloat;
    Fvnf                      := ADataSet.FieldByName('VNF').AsFloat;
    Fvtottrib                 := ADataSet.FieldByName('VTOTTRIB').AsFloat;
    Fmodfrete                 := Trim(ADataSet.FieldByName('MODFRETE').AsString);
    Ftr_codigo                := ADataSet.FieldByName('TR_CODIGO').AsInteger;
    Fdata_cad                 := ADataSet.FieldByName('DATA_CAD').AsDateTime;
    Fdata_mod                 := ADataSet.FieldByName('DATA_MOD').AsDateTime;
    Fus_mod                   := ADataSet.FieldByName('US_MOD').AsInteger;
    Fdesc_por_item            := Trim(ADataSet.FieldByName('DESC_POR_ITEM').AsString);
    Fseqpreco                 := Trim(ADataSet.FieldByName('SEQPRECO').AsString);
    Finfadfisco.Text          := Trim(ADataSet.FieldByName('INFADFISCO').AsString);
    Finfcpl.Text              := Trim(ADataSet.FieldByName('INFCPL').AsString);
    Fativo                    := ADataSet.FieldByName('ATIVO').AsInteger;
    Fcstat                    := Trim(ADataSet.FieldByName('CSTAT').AsString);
    Fxmotivo                  := Trim(ADataSet.FieldByName('XMOTIVO').AsString);
    Fdigval                   := Trim(ADataSet.FieldByName('DIGVAL').AsString);
    Fdhrecbto                 := ADataSet.FieldByName('DHRECBTO').AsDateTime;
    Fmsgretorno               := Trim(ADataSet.FieldByName('MSGRETORNO').AsString);
    Fxml_nfce.Text            := Trim(ADataSet.FieldByName('XML_NFCE').AsString);
    Fcont_alt                 := ADataSet.FieldByName('CONT_ALT').AsInteger;
    Fcod_nfce_conting         := ADataSet.FieldByName('COD_NFCE_CONTING').AsInteger;
    Fcod_nfce_original        := ADataSet.FieldByName('COD_NFCE_ORIGINAL').AsInteger;
    Fcont_dhcont              := ADataSet.FieldByName('CONT_DHCONT').AsDateTime;
    Fcont_xjust               := Trim(ADataSet.FieldByName('CONT_XJUST').AsString);
    Fcanc_xjust               := Trim(ADataSet.FieldByName('CANC_XJUST').AsString);
    Fcanc_cstat               := ADataSet.FieldByName('CANC_CSTAT').AsInteger;
    Fcanc_xmotivo             := Trim(ADataSet.FieldByName('CANC_XMOTIVO').AsString);
    Fcanc_nprot               := Trim(ADataSet.FieldByName('CANC_NPROT').AsString);
    Fcanc_dhrecbto            := ADataSet.FieldByName('CANC_DHRECBTO').AsDateTime;
    Fcanc_xml_nfce.Text       := Trim(ADataSet.FieldByName('CANC_XML_NFCE').AsString);
    Finut_xjust               := Trim(ADataSet.FieldByName('INUT_XJUST').AsString);
    Finut_cstat               := ADataSet.FieldByName('INUT_CSTAT').AsInteger;
    Finut_xmotivo             := Trim(ADataSet.FieldByName('INUT_XMOTIVO').AsString);
    Finut_nprot               := Trim(ADataSet.FieldByName('INUT_NPROT').AsString);
    Finut_dhrecbto            := ADataSet.FieldByName('INUT_DHRECBTO').AsDateTime;
    Finut_xml_nfce.Text       := Trim(ADataSet.FieldByName('INUT_XML_NFCE').AsString);
    Fcont_msg                 := ADataSet.FieldByName('CONT_MSG').AsInteger;
    Fped_origem_num           := ADataSet.FieldByName('PED_ORIGEM_NUM').AsInteger;
    Fped_origem_tip           := Trim(ADataSet.FieldByName('PED_ORIGEM_TIP').AsString);
    Fped_destino_num          := ADataSet.FieldByName('PED_DESTINO_NUM').AsInteger;
    Fped_destino_tip          := Trim(ADataSet.FieldByName('PED_DESTINO_TIP').AsString);
    Fcod_vendedor             := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    Fcod_cond_pag             := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    Ffrete_na_base            := Trim(ADataSet.FieldByName('FRETE_NA_BASE').AsString);
    Fvfcp                     := ADataSet.FieldByName('VFCP').AsFloat;
    Fvfcpst                   := ADataSet.FieldByName('VFCPST').AsFloat;
    Fvfcpstret                := ADataSet.FieldByName('VFCPSTRET').AsFloat;
    Fvtroco                   := ADataSet.FieldByName('VTROCO').AsFloat;
    Fnfe_versao               := Trim(ADataSet.FieldByName('NFE_VERSAO').AsString);
    Fcod_emissor              := ADataSet.FieldByName('COD_EMISSOR').AsInteger;
    Fhashnfc                  := Trim(ADataSet.FieldByName('HASHNFC').AsString);
    Fnorc                     := ADataSet.FieldByName('NORC').AsInteger;
    Fmov_id                   := ADataSet.FieldByName('MOV_ID').AsInteger;
    Foperador                 := ADataSet.FieldByName('OPERADOR').AsInteger;
    Fmov_seq                  := ADataSet.FieldByName('MOV_SEQ').AsInteger;
    Findintermed              := Trim(ADataSet.FieldByName('INDINTERMED').AsString);
    Finfintermed_cnpj         := Trim(ADataSet.FieldByName('INFINTERMED_CNPJ').AsString);
    Finfintermed_idcadinttran := Trim(ADataSet.FieldByName('INFINTERMED_IDCADINTTRAN').AsString);
    Fguidt                    := Trim(ADataSet.FieldByName('GUIDT').AsString);
    Fguid_nfce_conting        := Trim(ADataSet.FieldByName('GUID_NFCE_CONTING').AsString);
    Fguid_nfce_original       := Trim(ADataSet.FieldByName('GUID_NFCE_ORIGINAL').AsString);
    Fcod_nfce_complementada   := ADataSet.FieldByName('COD_NFCE_COMPLEMENTADA').AsInteger;
    Fcmunfgibs                := ADataSet.FieldByName('CMUNFGIBS').AsInteger;
    Fdfe_trib_ignorar         := ADataSet.FieldByName('DFE_TRIB_IGNORAR').AsInteger;
    Fvnftot                   := ADataSet.FieldByName('VNFTOT').AsFloat;
    Fvbcibscbs                := ADataSet.FieldByName('VBCIBSCBS').AsFloat;
    Fibsuf_vdif               := ADataSet.FieldByName('IBSUF_VDIF').AsFloat;
    Fibsuf_vdevtrib           := ADataSet.FieldByName('IBSUF_VDEVTRIB').AsFloat;
    Fvibsuf                   := ADataSet.FieldByName('VIBSUF').AsFloat;
    Fibsmun_vdif              := ADataSet.FieldByName('IBSMUN_VDIF').AsFloat;
    Fibsmun_vdevtrib          := ADataSet.FieldByName('IBSMUN_VDEVTRIB').AsFloat;
    Fvibsmun                  := ADataSet.FieldByName('VIBSMUN').AsFloat;
    Fvibs                     := ADataSet.FieldByName('VIBS').AsFloat;
    Fcbs_vdif                 := ADataSet.FieldByName('CBS_VDIF').AsFloat;
    Fcbs_vdevtrib             := ADataSet.FieldByName('CBS_VDEVTRIB').AsFloat;
    Fvcbs                     := ADataSet.FieldByName('VCBS').AsFloat;
    Fvibsmono                 := ADataSet.FieldByName('VIBSMONO').AsFloat;
    Fvcbsmono                 := ADataSet.FieldByName('VCBSMONO').AsFloat;
    Fvibsmonoreten            := ADataSet.FieldByName('VIBSMONORETEN').AsFloat;
    Fvcbsmonoreten            := ADataSet.FieldByName('VCBSMONORETEN').AsFloat;
    Fvibsmonoret              := ADataSet.FieldByName('VIBSMONORET').AsFloat;
    Fvcbsmonoret              := ADataSet.FieldByName('VCBSMONORET').AsFloat;
    Fvis                      := ADataSet.FieldByName('VIS').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NFCE'                )) then Fcod_nfce                 := ADataSet.FieldByName('COD_NFCE').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'             )) then Fcod_empresa              := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_CLIENTE'             )) then Fcod_cliente              := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('SERIE'                   )) then Fserie                    := ADataSet.FieldByName('SERIE').AsInteger;
    if Assigned(ADataSet.FindField('NUM_NF'                  )) then Fnum_nf                   := ADataSet.FieldByName('NUM_NF').AsInteger;
    if Assigned(ADataSet.FindField('MODELO'                  )) then Fmodelo                   := Trim(ADataSet.FieldByName('MODELO').AsString);
    if Assigned(ADataSet.FindField('DHEMI'                   )) then Fdhemi                    := ADataSet.FieldByName('DHEMI').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_LANC'               )) then Fdata_lanc                := ADataSet.FieldByName('DATA_LANC').AsDateTime;
    if Assigned(ADataSet.FindField('STATUS'                  )) then Fstatus                   := Trim(ADataSet.FieldByName('STATUS').AsString);
    if Assigned(ADataSet.FindField('NATOP'                   )) then Fnatop                    := Trim(ADataSet.FieldByName('NATOP').AsString);
    if Assigned(ADataSet.FindField('TPIMP'                   )) then Ftpimp                    := Trim(ADataSet.FieldByName('TPIMP').AsString);
    if Assigned(ADataSet.FindField('TPEMIS'                  )) then Ftpemis                   := Trim(ADataSet.FieldByName('TPEMIS').AsString);
    if Assigned(ADataSet.FindField('TPAMB'                   )) then Ftpamb                    := Trim(ADataSet.FieldByName('TPAMB').AsString);
    if Assigned(ADataSet.FindField('INDPRES'                 )) then Findpres                  := Trim(ADataSet.FieldByName('INDPRES').AsString);
    if Assigned(ADataSet.FindField('SITUACAO_NFCE'           )) then Fsituacao_nfce            := Trim(ADataSet.FieldByName('SITUACAO_NFCE').AsString);
    if Assigned(ADataSet.FindField('CHAVE_NFCE'              )) then Fchave_nfce               := Trim(ADataSet.FieldByName('CHAVE_NFCE').AsString);
    if Assigned(ADataSet.FindField('CNF'                     )) then Fcnf                      := ADataSet.FieldByName('CNF').AsInteger;
    if Assigned(ADataSet.FindField('NPROT'                   )) then Fnprot                    := Trim(ADataSet.FieldByName('NPROT').AsString);
    if Assigned(ADataSet.FindField('VBC'                     )) then Fvbc                      := ADataSet.FieldByName('VBC').AsFloat;
    if Assigned(ADataSet.FindField('VICMS'                   )) then Fvicms                    := ADataSet.FieldByName('VICMS').AsFloat;
    if Assigned(ADataSet.FindField('VPROD'                   )) then Fvprod                    := ADataSet.FieldByName('VPROD').AsFloat;
    if Assigned(ADataSet.FindField('VFRETE'                  )) then Fvfrete                   := ADataSet.FieldByName('VFRETE').AsFloat;
    if Assigned(ADataSet.FindField('VSEG'                    )) then Fvseg                     := ADataSet.FieldByName('VSEG').AsFloat;
    if Assigned(ADataSet.FindField('VDESC'                   )) then Fvdesc                    := ADataSet.FieldByName('VDESC').AsFloat;
    if Assigned(ADataSet.FindField('VPIS'                    )) then Fvpis                     := ADataSet.FieldByName('VPIS').AsFloat;
    if Assigned(ADataSet.FindField('VCOFINS'                 )) then Fvcofins                  := ADataSet.FieldByName('VCOFINS').AsFloat;
    if Assigned(ADataSet.FindField('VOUTRO'                  )) then Fvoutro                   := ADataSet.FieldByName('VOUTRO').AsFloat;
    if Assigned(ADataSet.FindField('VNF'                     )) then Fvnf                      := ADataSet.FieldByName('VNF').AsFloat;
    if Assigned(ADataSet.FindField('VTOTTRIB'                )) then Fvtottrib                 := ADataSet.FieldByName('VTOTTRIB').AsFloat;
    if Assigned(ADataSet.FindField('MODFRETE'                )) then Fmodfrete                 := Trim(ADataSet.FieldByName('MODFRETE').AsString);
    if Assigned(ADataSet.FindField('TR_CODIGO'               )) then Ftr_codigo                := ADataSet.FieldByName('TR_CODIGO').AsInteger;
    if Assigned(ADataSet.FindField('DATA_CAD'                )) then Fdata_cad                 := ADataSet.FieldByName('DATA_CAD').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_MOD'                )) then Fdata_mod                 := ADataSet.FieldByName('DATA_MOD').AsDateTime;
    if Assigned(ADataSet.FindField('US_MOD'                  )) then Fus_mod                   := ADataSet.FieldByName('US_MOD').AsInteger;
    if Assigned(ADataSet.FindField('DESC_POR_ITEM'           )) then Fdesc_por_item            := Trim(ADataSet.FieldByName('DESC_POR_ITEM').AsString);
    if Assigned(ADataSet.FindField('SEQPRECO'                )) then Fseqpreco                 := Trim(ADataSet.FieldByName('SEQPRECO').AsString);
    if Assigned(ADataSet.FindField('INFADFISCO'              )) then Finfadfisco.Text          := Trim(ADataSet.FieldByName('INFADFISCO').AsString);
    if Assigned(ADataSet.FindField('INFCPL'                  )) then Finfcpl.Text              := Trim(ADataSet.FieldByName('INFCPL').AsString);
    if Assigned(ADataSet.FindField('ATIVO'                   )) then Fativo                    := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('CSTAT'                   )) then Fcstat                    := Trim(ADataSet.FieldByName('CSTAT').AsString);
    if Assigned(ADataSet.FindField('XMOTIVO'                 )) then Fxmotivo                  := Trim(ADataSet.FieldByName('XMOTIVO').AsString);
    if Assigned(ADataSet.FindField('DIGVAL'                  )) then Fdigval                   := Trim(ADataSet.FieldByName('DIGVAL').AsString);
    if Assigned(ADataSet.FindField('DHRECBTO'                )) then Fdhrecbto                 := ADataSet.FieldByName('DHRECBTO').AsDateTime;
    if Assigned(ADataSet.FindField('MSGRETORNO'              )) then Fmsgretorno               := Trim(ADataSet.FieldByName('MSGRETORNO').AsString);
    if Assigned(ADataSet.FindField('XML_NFCE'                )) then Fxml_nfce.Text            := Trim(ADataSet.FieldByName('XML_NFCE').AsString);
    if Assigned(ADataSet.FindField('CONT_ALT'                )) then Fcont_alt                 := ADataSet.FieldByName('CONT_ALT').AsInteger;
    if Assigned(ADataSet.FindField('COD_NFCE_CONTING'        )) then Fcod_nfce_conting         := ADataSet.FieldByName('COD_NFCE_CONTING').AsInteger;
    if Assigned(ADataSet.FindField('COD_NFCE_ORIGINAL'       )) then Fcod_nfce_original        := ADataSet.FieldByName('COD_NFCE_ORIGINAL').AsInteger;
    if Assigned(ADataSet.FindField('CONT_DHCONT'             )) then Fcont_dhcont              := ADataSet.FieldByName('CONT_DHCONT').AsDateTime;
    if Assigned(ADataSet.FindField('CONT_XJUST'              )) then Fcont_xjust               := Trim(ADataSet.FieldByName('CONT_XJUST').AsString);
    if Assigned(ADataSet.FindField('CANC_XJUST'              )) then Fcanc_xjust               := Trim(ADataSet.FieldByName('CANC_XJUST').AsString);
    if Assigned(ADataSet.FindField('CANC_CSTAT'              )) then Fcanc_cstat               := ADataSet.FieldByName('CANC_CSTAT').AsInteger;
    if Assigned(ADataSet.FindField('CANC_XMOTIVO'            )) then Fcanc_xmotivo             := Trim(ADataSet.FieldByName('CANC_XMOTIVO').AsString);
    if Assigned(ADataSet.FindField('CANC_NPROT'              )) then Fcanc_nprot               := Trim(ADataSet.FieldByName('CANC_NPROT').AsString);
    if Assigned(ADataSet.FindField('CANC_DHRECBTO'           )) then Fcanc_dhrecbto            := ADataSet.FieldByName('CANC_DHRECBTO').AsDateTime;
    if Assigned(ADataSet.FindField('CANC_XML_NFCE'           )) then Fcanc_xml_nfce.Text       := Trim(ADataSet.FieldByName('CANC_XML_NFCE').AsString);
    if Assigned(ADataSet.FindField('INUT_XJUST'              )) then Finut_xjust               := Trim(ADataSet.FieldByName('INUT_XJUST').AsString);
    if Assigned(ADataSet.FindField('INUT_CSTAT'              )) then Finut_cstat               := ADataSet.FieldByName('INUT_CSTAT').AsInteger;
    if Assigned(ADataSet.FindField('INUT_XMOTIVO'            )) then Finut_xmotivo             := Trim(ADataSet.FieldByName('INUT_XMOTIVO').AsString);
    if Assigned(ADataSet.FindField('INUT_NPROT'              )) then Finut_nprot               := Trim(ADataSet.FieldByName('INUT_NPROT').AsString);
    if Assigned(ADataSet.FindField('INUT_DHRECBTO'           )) then Finut_dhrecbto            := ADataSet.FieldByName('INUT_DHRECBTO').AsDateTime;
    if Assigned(ADataSet.FindField('INUT_XML_NFCE'           )) then Finut_xml_nfce.Text       := Trim(ADataSet.FieldByName('INUT_XML_NFCE').AsString);
    if Assigned(ADataSet.FindField('CONT_MSG'                )) then Fcont_msg                 := ADataSet.FieldByName('CONT_MSG').AsInteger;
    if Assigned(ADataSet.FindField('PED_ORIGEM_NUM'          )) then Fped_origem_num           := ADataSet.FieldByName('PED_ORIGEM_NUM').AsInteger;
    if Assigned(ADataSet.FindField('PED_ORIGEM_TIP'          )) then Fped_origem_tip           := Trim(ADataSet.FieldByName('PED_ORIGEM_TIP').AsString);
    if Assigned(ADataSet.FindField('PED_DESTINO_NUM'         )) then Fped_destino_num          := ADataSet.FieldByName('PED_DESTINO_NUM').AsInteger;
    if Assigned(ADataSet.FindField('PED_DESTINO_TIP'         )) then Fped_destino_tip          := Trim(ADataSet.FieldByName('PED_DESTINO_TIP').AsString);
    if Assigned(ADataSet.FindField('COD_VENDEDOR'            )) then Fcod_vendedor             := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('COD_COND_PAG'            )) then Fcod_cond_pag             := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    if Assigned(ADataSet.FindField('FRETE_NA_BASE'           )) then Ffrete_na_base            := Trim(ADataSet.FieldByName('FRETE_NA_BASE').AsString);
    if Assigned(ADataSet.FindField('VFCP'                    )) then Fvfcp                     := ADataSet.FieldByName('VFCP').AsFloat;
    if Assigned(ADataSet.FindField('VFCPST'                  )) then Fvfcpst                   := ADataSet.FieldByName('VFCPST').AsFloat;
    if Assigned(ADataSet.FindField('VFCPSTRET'               )) then Fvfcpstret                := ADataSet.FieldByName('VFCPSTRET').AsFloat;
    if Assigned(ADataSet.FindField('VTROCO'                  )) then Fvtroco                   := ADataSet.FieldByName('VTROCO').AsFloat;
    if Assigned(ADataSet.FindField('NFE_VERSAO'              )) then Fnfe_versao               := Trim(ADataSet.FieldByName('NFE_VERSAO').AsString);
    if Assigned(ADataSet.FindField('COD_EMISSOR'             )) then Fcod_emissor              := ADataSet.FieldByName('COD_EMISSOR').AsInteger;
    if Assigned(ADataSet.FindField('HASHNFC'                 )) then Fhashnfc                  := Trim(ADataSet.FieldByName('HASHNFC').AsString);
    if Assigned(ADataSet.FindField('NORC'                    )) then Fnorc                     := ADataSet.FieldByName('NORC').AsInteger;
    if Assigned(ADataSet.FindField('MOV_ID'                  )) then Fmov_id                   := ADataSet.FieldByName('MOV_ID').AsInteger;
    if Assigned(ADataSet.FindField('OPERADOR'                )) then Foperador                 := ADataSet.FieldByName('OPERADOR').AsInteger;
    if Assigned(ADataSet.FindField('MOV_SEQ'                 )) then Fmov_seq                  := ADataSet.FieldByName('MOV_SEQ').AsInteger;
    if Assigned(ADataSet.FindField('INDINTERMED'             )) then Findintermed              := Trim(ADataSet.FieldByName('INDINTERMED').AsString);
    if Assigned(ADataSet.FindField('INFINTERMED_CNPJ'        )) then Finfintermed_cnpj         := Trim(ADataSet.FieldByName('INFINTERMED_CNPJ').AsString);
    if Assigned(ADataSet.FindField('INFINTERMED_IDCADINTTRAN')) then Finfintermed_idcadinttran := Trim(ADataSet.FieldByName('INFINTERMED_IDCADINTTRAN').AsString);
    if Assigned(ADataSet.FindField('GUIDT'                   )) then Fguidt                    := Trim(ADataSet.FieldByName('GUIDT').AsString);
    if Assigned(ADataSet.FindField('GUID_NFCE_CONTING'       )) then Fguid_nfce_conting        := Trim(ADataSet.FieldByName('GUID_NFCE_CONTING').AsString);
    if Assigned(ADataSet.FindField('GUID_NFCE_ORIGINAL'      )) then Fguid_nfce_original       := Trim(ADataSet.FieldByName('GUID_NFCE_ORIGINAL').AsString);
    if Assigned(ADataSet.FindField('COD_NFCE_COMPLEMENTADA'  )) then Fcod_nfce_complementada   := ADataSet.FieldByName('COD_NFCE_COMPLEMENTADA').AsInteger;
    if Assigned(ADataSet.FindField('CMUNFGIBS'               )) then Fcmunfgibs                := ADataSet.FieldByName('CMUNFGIBS').AsInteger;
    if Assigned(ADataSet.FindField('DFE_TRIB_IGNORAR'        )) then Fdfe_trib_ignorar         := ADataSet.FieldByName('DFE_TRIB_IGNORAR').AsInteger;
    if Assigned(ADataSet.FindField('VNFTOT'                  )) then Fvnftot                   := ADataSet.FieldByName('VNFTOT').AsFloat;
    if Assigned(ADataSet.FindField('VBCIBSCBS'               )) then Fvbcibscbs                := ADataSet.FieldByName('VBCIBSCBS').AsFloat;
    if Assigned(ADataSet.FindField('IBSUF_VDIF'              )) then Fibsuf_vdif               := ADataSet.FieldByName('IBSUF_VDIF').AsFloat;
    if Assigned(ADataSet.FindField('IBSUF_VDEVTRIB'          )) then Fibsuf_vdevtrib           := ADataSet.FieldByName('IBSUF_VDEVTRIB').AsFloat;
    if Assigned(ADataSet.FindField('VIBSUF'                  )) then Fvibsuf                   := ADataSet.FieldByName('VIBSUF').AsFloat;
    if Assigned(ADataSet.FindField('IBSMUN_VDIF'             )) then Fibsmun_vdif              := ADataSet.FieldByName('IBSMUN_VDIF').AsFloat;
    if Assigned(ADataSet.FindField('IBSMUN_VDEVTRIB'         )) then Fibsmun_vdevtrib          := ADataSet.FieldByName('IBSMUN_VDEVTRIB').AsFloat;
    if Assigned(ADataSet.FindField('VIBSMUN'                 )) then Fvibsmun                  := ADataSet.FieldByName('VIBSMUN').AsFloat;
    if Assigned(ADataSet.FindField('VIBS'                    )) then Fvibs                     := ADataSet.FieldByName('VIBS').AsFloat;
    if Assigned(ADataSet.FindField('CBS_VDIF'                )) then Fcbs_vdif                 := ADataSet.FieldByName('CBS_VDIF').AsFloat;
    if Assigned(ADataSet.FindField('CBS_VDEVTRIB'            )) then Fcbs_vdevtrib             := ADataSet.FieldByName('CBS_VDEVTRIB').AsFloat;
    if Assigned(ADataSet.FindField('VCBS'                    )) then Fvcbs                     := ADataSet.FieldByName('VCBS').AsFloat;
    if Assigned(ADataSet.FindField('VIBSMONO'                )) then Fvibsmono                 := ADataSet.FieldByName('VIBSMONO').AsFloat;
    if Assigned(ADataSet.FindField('VCBSMONO'                )) then Fvcbsmono                 := ADataSet.FieldByName('VCBSMONO').AsFloat;
    if Assigned(ADataSet.FindField('VIBSMONORETEN'           )) then Fvibsmonoreten            := ADataSet.FieldByName('VIBSMONORETEN').AsFloat;
    if Assigned(ADataSet.FindField('VCBSMONORETEN'           )) then Fvcbsmonoreten            := ADataSet.FieldByName('VCBSMONORETEN').AsFloat;
    if Assigned(ADataSet.FindField('VIBSMONORET'             )) then Fvibsmonoret              := ADataSet.FieldByName('VIBSMONORET').AsFloat;
    if Assigned(ADataSet.FindField('VCBSMONORET'             )) then Fvcbsmonoret              := ADataSet.FieldByName('VCBSMONORET').AsFloat;
    if Assigned(ADataSet.FindField('VIS'                     )) then Fvis                      := ADataSet.FieldByName('VIS').AsFloat;
  end;
end;

{ TNfce_classList }

function TNfce_classList.GetItem(Index: Integer): TNfce_class;
begin
  Result := TNfce_class(inherited Items[Index]);
end;

function TNfce_classList.New: TNfce_class;
begin
  Result := TNfce_class.Create;
  Add(Result);
end;

procedure TNfce_classList.SetItem(Index: Integer; const Value: TNfce_class);
begin
  Put(Index, Value);
end;

procedure TNfce_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
