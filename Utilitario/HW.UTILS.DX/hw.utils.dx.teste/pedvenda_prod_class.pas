unit pedvenda_prod_class;

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
  TPedvenda_prod_class = class(TObject)
  private
    Fnped               : Integer;
    Ftipo               : string;
    Fgrupo_prod         : Integer;
    Fcod_prod           : string;
    Fnitem              : Integer;
    Fcod_empresa        : Integer;
    Fcod_grade          : Integer;
    Fcodigo_nop         : Double;
    Fnum_fab_prod       : string;
    Fdescr_prod_ped     : string;
    Fquant_ped_item     : Double;
    Fvlun_ped_item      : Double;
    Fvltot_ped_item     : Double;
    Fvlun_orig          : Double;
    Fvlun_ped_nf        : Double;
    Fvltot_ped_nf       : Double;
    Frateio_desc        : Double;
    Frateio_acresc      : Double;
    Fn_nf               : Integer;
    Fserie              : string;
    Faliquota_cp        : string;
    Fratdsas            : Double;
    Fcomiss_prod        : Double;
    Fcomiss_prod_ger    : Double;
    Fano_fab_prod       : Integer;
    Fn_serie_prod       : string;
    Fmodelo             : string;
    Fcor                : string;
    Fpcust_c            : Double;
    Fpcust_r            : Double;
    Fpcust_mc           : Double;
    Fpcust_mr           : Double;
    Ftp_nf_ped          : string;
    Fsit_atd            : string;
    Fsel                : string;
    Fdata_atd           : TDateTime;
    Fhora_atd           : string;
    Fcodigo_kit         : Integer;
    Ficmant_sub         : Double;
    Fcod_seg_serv       : Integer;
    Fativo              : Integer;
    Fcol_cod_vendedor   : Integer;
    Fdesc_item          : Double;
    Facresc_item        : Double;
    Fcod_vendedor       : Integer;
    Fdata_transf        : TDateTime;
    Fdata_dev           : TDateTime;
    Fnome_vend          : string;
    Fnome_vend1         : string;
    Fqt_dev             : Double;
    Fvlo_unitario       : Double;
    Fdata_inclusao      : TDateTime;
    Fstatus             : string;
    Fdav_origem         : Integer;
    Ftp_descacres       : string;
    Fnat_descacres      : string;
    Fvalor_descacres    : Double;
    Fcod_nserie         : Integer;
    Fcod_nf             : Integer;
    Fnitem_nf           : Integer;
    Ftabpraticada       : string;
    Fquant_item_dev     : Double;
    Ftipv               : string;
    Fmd5                : string;
    Fcod_pedido         : Integer;
    Fcod_almoxarifado   : Integer;
    Fnpedoriginado      : Integer;
    Ftipooriginado      : string;
    Fmax_desc_tab       : Double;
    Fnitem_pedido       : Integer;
    Frat_desc_avista    : Double;
    Frefazer_comiss     : string;
    Fnped_origem        : Integer;
    Ftipo_origem        : string;
    Fxped_compra        : string;
    Fnitemped_compra    : Integer;
    Fnped_conf          : Integer;
    Fnitem_conf         : Integer;
    Ftipo_conf          : string;
    Funidade            : string;
    Fsit_trib           : string;
    Ficm_prod           : Double;
    Fcsdecqtde          : string;
    Fcsdecvlunt         : string;
    Fnprevenda          : Integer;
    Fvl_debcred         : Double;
    Fvl_desp_nf         : Double;
    Fnitem_serv         : Integer;
    Fcod_vendedor1      : Integer;
    Fprecoporqtde       : string;
    Fn_nfd              : Integer;
    Fseried             : string;
    Fvl_comissao_vend   : Double;
    Fperc_comissao_vend : Double;
    Fvl_comissao_vend1  : Double;
    Fperc_comissao_vend1: Double;
    Fvl_desp_nf_sfo     : Double;
    Fnf_dc_despnf       : Double;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property nped               : Integer   read Fnped                write Fnped;
    property tipo               : string    read Ftipo                write Ftipo;
    property grupo_prod         : Integer   read Fgrupo_prod          write Fgrupo_prod;
    property cod_prod           : string    read Fcod_prod            write Fcod_prod;
    property nitem              : Integer   read Fnitem               write Fnitem;
    property cod_empresa        : Integer   read Fcod_empresa         write Fcod_empresa;
    property cod_grade          : Integer   read Fcod_grade           write Fcod_grade;
    property codigo_nop         : Double    read Fcodigo_nop          write Fcodigo_nop;
    property num_fab_prod       : string    read Fnum_fab_prod        write Fnum_fab_prod;
    property descr_prod_ped     : string    read Fdescr_prod_ped      write Fdescr_prod_ped;
    property quant_ped_item     : Double    read Fquant_ped_item      write Fquant_ped_item;
    property vlun_ped_item      : Double    read Fvlun_ped_item       write Fvlun_ped_item;
    property vltot_ped_item     : Double    read Fvltot_ped_item      write Fvltot_ped_item;
    property vlun_orig          : Double    read Fvlun_orig           write Fvlun_orig;
    property vlun_ped_nf        : Double    read Fvlun_ped_nf         write Fvlun_ped_nf;
    property vltot_ped_nf       : Double    read Fvltot_ped_nf        write Fvltot_ped_nf;
    property rateio_desc        : Double    read Frateio_desc         write Frateio_desc;
    property rateio_acresc      : Double    read Frateio_acresc       write Frateio_acresc;
    property n_nf               : Integer   read Fn_nf                write Fn_nf;
    property serie              : string    read Fserie               write Fserie;
    property aliquota_cp        : string    read Faliquota_cp         write Faliquota_cp;
    property ratdsas            : Double    read Fratdsas             write Fratdsas;
    property comiss_prod        : Double    read Fcomiss_prod         write Fcomiss_prod;
    property comiss_prod_ger    : Double    read Fcomiss_prod_ger     write Fcomiss_prod_ger;
    property ano_fab_prod       : Integer   read Fano_fab_prod        write Fano_fab_prod;
    property n_serie_prod       : string    read Fn_serie_prod        write Fn_serie_prod;
    property modelo             : string    read Fmodelo              write Fmodelo;
    property cor                : string    read Fcor                 write Fcor;
    property pcust_c            : Double    read Fpcust_c             write Fpcust_c;
    property pcust_r            : Double    read Fpcust_r             write Fpcust_r;
    property pcust_mc           : Double    read Fpcust_mc            write Fpcust_mc;
    property pcust_mr           : Double    read Fpcust_mr            write Fpcust_mr;
    property tp_nf_ped          : string    read Ftp_nf_ped           write Ftp_nf_ped;
    property sit_atd            : string    read Fsit_atd             write Fsit_atd;
    property sel                : string    read Fsel                 write Fsel;
    property data_atd           : TDateTime read Fdata_atd            write Fdata_atd;
    property hora_atd           : string    read Fhora_atd            write Fhora_atd;
    property codigo_kit         : Integer   read Fcodigo_kit          write Fcodigo_kit;
    property icmant_sub         : Double    read Ficmant_sub          write Ficmant_sub;
    property cod_seg_serv       : Integer   read Fcod_seg_serv        write Fcod_seg_serv;
    property ativo              : Integer   read Fativo               write Fativo;
    property col_cod_vendedor   : Integer   read Fcol_cod_vendedor    write Fcol_cod_vendedor;
    property desc_item          : Double    read Fdesc_item           write Fdesc_item;
    property acresc_item        : Double    read Facresc_item         write Facresc_item;
    property cod_vendedor       : Integer   read Fcod_vendedor        write Fcod_vendedor;
    property data_transf        : TDateTime read Fdata_transf         write Fdata_transf;
    property data_dev           : TDateTime read Fdata_dev            write Fdata_dev;
    property nome_vend          : string    read Fnome_vend           write Fnome_vend;
    property nome_vend1         : string    read Fnome_vend1          write Fnome_vend1;
    property qt_dev             : Double    read Fqt_dev              write Fqt_dev;
    property vlo_unitario       : Double    read Fvlo_unitario        write Fvlo_unitario;
    property data_inclusao      : TDateTime read Fdata_inclusao       write Fdata_inclusao;
    property status             : string    read Fstatus              write Fstatus;
    property dav_origem         : Integer   read Fdav_origem          write Fdav_origem;
    property tp_descacres       : string    read Ftp_descacres        write Ftp_descacres;
    property nat_descacres      : string    read Fnat_descacres       write Fnat_descacres;
    property valor_descacres    : Double    read Fvalor_descacres     write Fvalor_descacres;
    property cod_nserie         : Integer   read Fcod_nserie          write Fcod_nserie;
    property cod_nf             : Integer   read Fcod_nf              write Fcod_nf;
    property nitem_nf           : Integer   read Fnitem_nf            write Fnitem_nf;
    property tabpraticada       : string    read Ftabpraticada        write Ftabpraticada;
    property quant_item_dev     : Double    read Fquant_item_dev      write Fquant_item_dev;
    property tipv               : string    read Ftipv                write Ftipv;
    property md5                : string    read Fmd5                 write Fmd5;
    property cod_pedido         : Integer   read Fcod_pedido          write Fcod_pedido;
    property cod_almoxarifado   : Integer   read Fcod_almoxarifado    write Fcod_almoxarifado;
    property npedoriginado      : Integer   read Fnpedoriginado       write Fnpedoriginado;
    property tipooriginado      : string    read Ftipooriginado       write Ftipooriginado;
    property max_desc_tab       : Double    read Fmax_desc_tab        write Fmax_desc_tab;
    property nitem_pedido       : Integer   read Fnitem_pedido        write Fnitem_pedido;
    property rat_desc_avista    : Double    read Frat_desc_avista     write Frat_desc_avista;
    property refazer_comiss     : string    read Frefazer_comiss      write Frefazer_comiss;
    property nped_origem        : Integer   read Fnped_origem         write Fnped_origem;
    property tipo_origem        : string    read Ftipo_origem         write Ftipo_origem;
    property xped_compra        : string    read Fxped_compra         write Fxped_compra;
    property nitemped_compra    : Integer   read Fnitemped_compra     write Fnitemped_compra;
    property nped_conf          : Integer   read Fnped_conf           write Fnped_conf;
    property nitem_conf         : Integer   read Fnitem_conf          write Fnitem_conf;
    property tipo_conf          : string    read Ftipo_conf           write Ftipo_conf;
    property unidade            : string    read Funidade             write Funidade;
    property sit_trib           : string    read Fsit_trib            write Fsit_trib;
    property icm_prod           : Double    read Ficm_prod            write Ficm_prod;
    property csdecqtde          : string    read Fcsdecqtde           write Fcsdecqtde;
    property csdecvlunt         : string    read Fcsdecvlunt          write Fcsdecvlunt;
    property nprevenda          : Integer   read Fnprevenda           write Fnprevenda;
    property vl_debcred         : Double    read Fvl_debcred          write Fvl_debcred;
    property vl_desp_nf         : Double    read Fvl_desp_nf          write Fvl_desp_nf;
    property nitem_serv         : Integer   read Fnitem_serv          write Fnitem_serv;
    property cod_vendedor1      : Integer   read Fcod_vendedor1       write Fcod_vendedor1;
    property precoporqtde       : string    read Fprecoporqtde        write Fprecoporqtde;
    property n_nfd              : Integer   read Fn_nfd               write Fn_nfd;
    property seried             : string    read Fseried              write Fseried;
    property vl_comissao_vend   : Double    read Fvl_comissao_vend    write Fvl_comissao_vend;
    property perc_comissao_vend : Double    read Fperc_comissao_vend  write Fperc_comissao_vend;
    property vl_comissao_vend1  : Double    read Fvl_comissao_vend1   write Fvl_comissao_vend1;
    property perc_comissao_vend1: Double    read Fperc_comissao_vend1 write Fperc_comissao_vend1;
    property vl_desp_nf_sfo     : Double    read Fvl_desp_nf_sfo      write Fvl_desp_nf_sfo;
    property nf_dc_despnf       : Double    read Fnf_dc_despnf        write Fnf_dc_despnf;
  end;

  TPedvenda_prod_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TPedvenda_prod_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_prod_class);
  public
    function New: TPedvenda_prod_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TPedvenda_prod_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TPedvenda_prod_class }

constructor TPedvenda_prod_class.Create;
begin
  Fativo := 1;
end;

destructor TPedvenda_prod_class.Destroy;
begin
  inherited;
end;

class function TPedvenda_prod_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@nped, @tipo, @grupo_prod, @cod_prod, @nitem, @cod_empresa, @cod_grade, @codigo_nop, @num_fab_prod,' +
            ' @descr_prod_ped, @quant_ped_item, @vlun_ped_item, @vltot_ped_item, @vlun_orig, @vlun_ped_nf, @vltot_ped_nf,' +
            ' @rateio_desc, @rateio_acresc, @n_nf, @serie, @aliquota_cp, @ratdsas, @comiss_prod, @comiss_prod_ger,' +
            ' @ano_fab_prod, @n_serie_prod, @modelo, @cor, @pcust_c, @pcust_r, @pcust_mc, @pcust_mr, @tp_nf_ped, @sit_atd,' +
            ' @sel, @data_atd, @hora_atd, @codigo_kit, @icmant_sub, @cod_seg_serv, @ativo, @col_cod_vendedor, @desc_item,' +
            ' @acresc_item, @cod_vendedor, @data_transf, @data_dev, @nome_vend, @nome_vend1, @qt_dev, @vlo_unitario,' +
            ' @data_inclusao, @status, @dav_origem, @tp_descacres, @nat_descacres, @valor_descacres, @cod_nserie, @cod_nf,' +
            ' @nitem_nf, @tabpraticada, @quant_item_dev, @tipv, @md5, @cod_pedido, @cod_almoxarifado, @npedoriginado,' +
            ' @tipooriginado, @max_desc_tab, @nitem_pedido, @rat_desc_avista, @refazer_comiss, @nped_origem, @tipo_origem,' +
            ' @xped_compra, @nitemped_compra, @nped_conf, @nitem_conf, @tipo_conf, @unidade, @sit_trib, @icm_prod,' +
            ' @csdecqtde, @csdecvlunt, @nprevenda, @vl_debcred, @vl_desp_nf, @nitem_serv, @cod_vendedor1, @precoporqtde,' +
            ' @n_nfd, @seried, @vl_comissao_vend, @perc_comissao_vend, @vl_comissao_vend1, @perc_comissao_vend1,' +
            ' @vl_desp_nf_sfo, @nf_dc_despnf';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_prod_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fnped                := ADataSet.FieldByName('NPED').AsInteger;
    Ftipo                := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fgrupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fnitem               := ADataSet.FieldByName('NITEM').AsInteger;
    Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_grade           := ADataSet.FieldByName('COD_GRADE').AsInteger;
    Fcodigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    Fnum_fab_prod        := Trim(ADataSet.FieldByName('NUM_FAB_PROD').AsString);
    Fdescr_prod_ped      := Trim(ADataSet.FieldByName('DESCR_PROD_PED').AsString);
    Fquant_ped_item      := ADataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    Fvlun_ped_item       := ADataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
    Fvltot_ped_item      := ADataSet.FieldByName('VLTOT_PED_ITEM').AsFloat;
    Fvlun_orig           := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    Fvlun_ped_nf         := ADataSet.FieldByName('VLUN_PED_NF').AsFloat;
    Fvltot_ped_nf        := ADataSet.FieldByName('VLTOT_PED_NF').AsFloat;
    Frateio_desc         := ADataSet.FieldByName('RATEIO_DESC').AsFloat;
    Frateio_acresc       := ADataSet.FieldByName('RATEIO_ACRESC').AsFloat;
    Fn_nf                := ADataSet.FieldByName('N_NF').AsInteger;
    Fserie               := Trim(ADataSet.FieldByName('SERIE').AsString);
    Faliquota_cp         := Trim(ADataSet.FieldByName('ALIQUOTA_CP').AsString);
    Fratdsas             := ADataSet.FieldByName('RATDSAS').AsFloat;
    Fcomiss_prod         := ADataSet.FieldByName('COMISS_PROD').AsFloat;
    Fcomiss_prod_ger     := ADataSet.FieldByName('COMISS_PROD_GER').AsFloat;
    Fano_fab_prod        := ADataSet.FieldByName('ANO_FAB_PROD').AsInteger;
    Fn_serie_prod        := Trim(ADataSet.FieldByName('N_SERIE_PROD').AsString);
    Fmodelo              := Trim(ADataSet.FieldByName('MODELO').AsString);
    Fcor                 := Trim(ADataSet.FieldByName('COR').AsString);
    Fpcust_c             := ADataSet.FieldByName('PCUST_C').AsFloat;
    Fpcust_r             := ADataSet.FieldByName('PCUST_R').AsFloat;
    Fpcust_mc            := ADataSet.FieldByName('PCUST_MC').AsFloat;
    Fpcust_mr            := ADataSet.FieldByName('PCUST_MR').AsFloat;
    Ftp_nf_ped           := Trim(ADataSet.FieldByName('TP_NF_PED').AsString);
    Fsit_atd             := Trim(ADataSet.FieldByName('SIT_ATD').AsString);
    Fsel                 := Trim(ADataSet.FieldByName('SEL').AsString);
    Fdata_atd            := ADataSet.FieldByName('DATA_ATD').AsDateTime;
    Fhora_atd            := Trim(ADataSet.FieldByName('HORA_ATD').AsString);
    Fcodigo_kit          := ADataSet.FieldByName('CODIGO_KIT').AsInteger;
    Ficmant_sub          := ADataSet.FieldByName('ICMANT_SUB').AsFloat;
    Fcod_seg_serv        := ADataSet.FieldByName('COD_SEG_SERV').AsInteger;
    Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    Fcol_cod_vendedor    := ADataSet.FieldByName('COL_COD_VENDEDOR').AsInteger;
    Fdesc_item           := ADataSet.FieldByName('DESC_ITEM').AsFloat;
    Facresc_item         := ADataSet.FieldByName('ACRESC_ITEM').AsFloat;
    Fcod_vendedor        := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    Fdata_transf         := ADataSet.FieldByName('DATA_TRANSF').AsDateTime;
    Fdata_dev            := ADataSet.FieldByName('DATA_DEV').AsDateTime;
    Fnome_vend           := Trim(ADataSet.FieldByName('NOME_VEND').AsString);
    Fnome_vend1          := Trim(ADataSet.FieldByName('NOME_VEND1').AsString);
    Fqt_dev              := ADataSet.FieldByName('QT_DEV').AsFloat;
    Fvlo_unitario        := ADataSet.FieldByName('VLO_UNITARIO').AsFloat;
    Fdata_inclusao       := ADataSet.FieldByName('DATA_INCLUSAO').AsDateTime;
    Fstatus              := Trim(ADataSet.FieldByName('STATUS').AsString);
    Fdav_origem          := ADataSet.FieldByName('DAV_ORIGEM').AsInteger;
    Ftp_descacres        := Trim(ADataSet.FieldByName('TP_DESCACRES').AsString);
    Fnat_descacres       := Trim(ADataSet.FieldByName('NAT_DESCACRES').AsString);
    Fvalor_descacres     := ADataSet.FieldByName('VALOR_DESCACRES').AsFloat;
    Fcod_nserie          := ADataSet.FieldByName('COD_NSERIE').AsInteger;
    Fcod_nf              := ADataSet.FieldByName('COD_NF').AsInteger;
    Fnitem_nf            := ADataSet.FieldByName('NITEM_NF').AsInteger;
    Ftabpraticada        := Trim(ADataSet.FieldByName('TABPRATICADA').AsString);
    Fquant_item_dev      := ADataSet.FieldByName('QUANT_ITEM_DEV').AsFloat;
    Ftipv                := Trim(ADataSet.FieldByName('TIPV').AsString);
    Fmd5                 := Trim(ADataSet.FieldByName('MD5').AsString);
    Fcod_pedido          := ADataSet.FieldByName('COD_PEDIDO').AsInteger;
    Fcod_almoxarifado    := ADataSet.FieldByName('COD_ALMOXARIFADO').AsInteger;
    Fnpedoriginado       := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    Ftipooriginado       := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
    Fmax_desc_tab        := ADataSet.FieldByName('MAX_DESC_TAB').AsFloat;
    Fnitem_pedido        := ADataSet.FieldByName('NITEM_PEDIDO').AsInteger;
    Frat_desc_avista     := ADataSet.FieldByName('RAT_DESC_AVISTA').AsFloat;
    Frefazer_comiss      := Trim(ADataSet.FieldByName('REFAZER_COMISS').AsString);
    Fnped_origem         := ADataSet.FieldByName('NPED_ORIGEM').AsInteger;
    Ftipo_origem         := Trim(ADataSet.FieldByName('TIPO_ORIGEM').AsString);
    Fxped_compra         := Trim(ADataSet.FieldByName('XPED_COMPRA').AsString);
    Fnitemped_compra     := ADataSet.FieldByName('NITEMPED_COMPRA').AsInteger;
    Fnped_conf           := ADataSet.FieldByName('NPED_CONF').AsInteger;
    Fnitem_conf          := ADataSet.FieldByName('NITEM_CONF').AsInteger;
    Ftipo_conf           := Trim(ADataSet.FieldByName('TIPO_CONF').AsString);
    Funidade             := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    Fsit_trib            := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    Ficm_prod            := ADataSet.FieldByName('ICM_PROD').AsFloat;
    Fcsdecqtde           := Trim(ADataSet.FieldByName('CSDECQTDE').AsString);
    Fcsdecvlunt          := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    Fnprevenda           := ADataSet.FieldByName('NPREVENDA').AsInteger;
    Fvl_debcred          := ADataSet.FieldByName('VL_DEBCRED').AsFloat;
    Fvl_desp_nf          := ADataSet.FieldByName('VL_DESP_NF').AsFloat;
    Fnitem_serv          := ADataSet.FieldByName('NITEM_SERV').AsInteger;
    Fcod_vendedor1       := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    Fprecoporqtde        := Trim(ADataSet.FieldByName('PRECOPORQTDE').AsString);
    Fn_nfd               := ADataSet.FieldByName('N_NFD').AsInteger;
    Fseried              := Trim(ADataSet.FieldByName('SERIED').AsString);
    Fvl_comissao_vend    := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    Fperc_comissao_vend  := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    Fvl_comissao_vend1   := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    Fperc_comissao_vend1 := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    Fvl_desp_nf_sfo      := ADataSet.FieldByName('VL_DESP_NF_SFO').AsFloat;
    Fnf_dc_despnf        := ADataSet.FieldByName('NF_DC_DESPNF').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'               )) then Fnped                := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'               )) then Ftipo                := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('GRUPO_PROD'         )) then Fgrupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'           )) then Fcod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('NITEM'              )) then Fnitem               := ADataSet.FieldByName('NITEM').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'        )) then Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_GRADE'          )) then Fcod_grade           := ADataSet.FieldByName('COD_GRADE').AsInteger;
    if Assigned(ADataSet.FindField('CODIGO_NOP'         )) then Fcodigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    if Assigned(ADataSet.FindField('NUM_FAB_PROD'       )) then Fnum_fab_prod        := Trim(ADataSet.FieldByName('NUM_FAB_PROD').AsString);
    if Assigned(ADataSet.FindField('DESCR_PROD_PED'     )) then Fdescr_prod_ped      := Trim(ADataSet.FieldByName('DESCR_PROD_PED').AsString);
    if Assigned(ADataSet.FindField('QUANT_PED_ITEM'     )) then Fquant_ped_item      := ADataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('VLUN_PED_ITEM'      )) then Fvlun_ped_item       := ADataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('VLTOT_PED_ITEM'     )) then Fvltot_ped_item      := ADataSet.FieldByName('VLTOT_PED_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('VLUN_ORIG'          )) then Fvlun_orig           := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    if Assigned(ADataSet.FindField('VLUN_PED_NF'        )) then Fvlun_ped_nf         := ADataSet.FieldByName('VLUN_PED_NF').AsFloat;
    if Assigned(ADataSet.FindField('VLTOT_PED_NF'       )) then Fvltot_ped_nf        := ADataSet.FieldByName('VLTOT_PED_NF').AsFloat;
    if Assigned(ADataSet.FindField('RATEIO_DESC'        )) then Frateio_desc         := ADataSet.FieldByName('RATEIO_DESC').AsFloat;
    if Assigned(ADataSet.FindField('RATEIO_ACRESC'      )) then Frateio_acresc       := ADataSet.FieldByName('RATEIO_ACRESC').AsFloat;
    if Assigned(ADataSet.FindField('N_NF'               )) then Fn_nf                := ADataSet.FieldByName('N_NF').AsInteger;
    if Assigned(ADataSet.FindField('SERIE'              )) then Fserie               := Trim(ADataSet.FieldByName('SERIE').AsString);
    if Assigned(ADataSet.FindField('ALIQUOTA_CP'        )) then Faliquota_cp         := Trim(ADataSet.FieldByName('ALIQUOTA_CP').AsString);
    if Assigned(ADataSet.FindField('RATDSAS'            )) then Fratdsas             := ADataSet.FieldByName('RATDSAS').AsFloat;
    if Assigned(ADataSet.FindField('COMISS_PROD'        )) then Fcomiss_prod         := ADataSet.FieldByName('COMISS_PROD').AsFloat;
    if Assigned(ADataSet.FindField('COMISS_PROD_GER'    )) then Fcomiss_prod_ger     := ADataSet.FieldByName('COMISS_PROD_GER').AsFloat;
    if Assigned(ADataSet.FindField('ANO_FAB_PROD'       )) then Fano_fab_prod        := ADataSet.FieldByName('ANO_FAB_PROD').AsInteger;
    if Assigned(ADataSet.FindField('N_SERIE_PROD'       )) then Fn_serie_prod        := Trim(ADataSet.FieldByName('N_SERIE_PROD').AsString);
    if Assigned(ADataSet.FindField('MODELO'             )) then Fmodelo              := Trim(ADataSet.FieldByName('MODELO').AsString);
    if Assigned(ADataSet.FindField('COR'                )) then Fcor                 := Trim(ADataSet.FieldByName('COR').AsString);
    if Assigned(ADataSet.FindField('PCUST_C'            )) then Fpcust_c             := ADataSet.FieldByName('PCUST_C').AsFloat;
    if Assigned(ADataSet.FindField('PCUST_R'            )) then Fpcust_r             := ADataSet.FieldByName('PCUST_R').AsFloat;
    if Assigned(ADataSet.FindField('PCUST_MC'           )) then Fpcust_mc            := ADataSet.FieldByName('PCUST_MC').AsFloat;
    if Assigned(ADataSet.FindField('PCUST_MR'           )) then Fpcust_mr            := ADataSet.FieldByName('PCUST_MR').AsFloat;
    if Assigned(ADataSet.FindField('TP_NF_PED'          )) then Ftp_nf_ped           := Trim(ADataSet.FieldByName('TP_NF_PED').AsString);
    if Assigned(ADataSet.FindField('SIT_ATD'            )) then Fsit_atd             := Trim(ADataSet.FieldByName('SIT_ATD').AsString);
    if Assigned(ADataSet.FindField('SEL'                )) then Fsel                 := Trim(ADataSet.FieldByName('SEL').AsString);
    if Assigned(ADataSet.FindField('DATA_ATD'           )) then Fdata_atd            := ADataSet.FieldByName('DATA_ATD').AsDateTime;
    if Assigned(ADataSet.FindField('HORA_ATD'           )) then Fhora_atd            := Trim(ADataSet.FieldByName('HORA_ATD').AsString);
    if Assigned(ADataSet.FindField('CODIGO_KIT'         )) then Fcodigo_kit          := ADataSet.FieldByName('CODIGO_KIT').AsInteger;
    if Assigned(ADataSet.FindField('ICMANT_SUB'         )) then Ficmant_sub          := ADataSet.FieldByName('ICMANT_SUB').AsFloat;
    if Assigned(ADataSet.FindField('COD_SEG_SERV'       )) then Fcod_seg_serv        := ADataSet.FieldByName('COD_SEG_SERV').AsInteger;
    if Assigned(ADataSet.FindField('ATIVO'              )) then Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('COL_COD_VENDEDOR'   )) then Fcol_cod_vendedor    := ADataSet.FieldByName('COL_COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('DESC_ITEM'          )) then Fdesc_item           := ADataSet.FieldByName('DESC_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('ACRESC_ITEM'        )) then Facresc_item         := ADataSet.FieldByName('ACRESC_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('COD_VENDEDOR'       )) then Fcod_vendedor        := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('DATA_TRANSF'        )) then Fdata_transf         := ADataSet.FieldByName('DATA_TRANSF').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_DEV'           )) then Fdata_dev            := ADataSet.FieldByName('DATA_DEV').AsDateTime;
    if Assigned(ADataSet.FindField('NOME_VEND'          )) then Fnome_vend           := Trim(ADataSet.FieldByName('NOME_VEND').AsString);
    if Assigned(ADataSet.FindField('NOME_VEND1'         )) then Fnome_vend1          := Trim(ADataSet.FieldByName('NOME_VEND1').AsString);
    if Assigned(ADataSet.FindField('QT_DEV'             )) then Fqt_dev              := ADataSet.FieldByName('QT_DEV').AsFloat;
    if Assigned(ADataSet.FindField('VLO_UNITARIO'       )) then Fvlo_unitario        := ADataSet.FieldByName('VLO_UNITARIO').AsFloat;
    if Assigned(ADataSet.FindField('DATA_INCLUSAO'      )) then Fdata_inclusao       := ADataSet.FieldByName('DATA_INCLUSAO').AsDateTime;
    if Assigned(ADataSet.FindField('STATUS'             )) then Fstatus              := Trim(ADataSet.FieldByName('STATUS').AsString);
    if Assigned(ADataSet.FindField('DAV_ORIGEM'         )) then Fdav_origem          := ADataSet.FieldByName('DAV_ORIGEM').AsInteger;
    if Assigned(ADataSet.FindField('TP_DESCACRES'       )) then Ftp_descacres        := Trim(ADataSet.FieldByName('TP_DESCACRES').AsString);
    if Assigned(ADataSet.FindField('NAT_DESCACRES'      )) then Fnat_descacres       := Trim(ADataSet.FieldByName('NAT_DESCACRES').AsString);
    if Assigned(ADataSet.FindField('VALOR_DESCACRES'    )) then Fvalor_descacres     := ADataSet.FieldByName('VALOR_DESCACRES').AsFloat;
    if Assigned(ADataSet.FindField('COD_NSERIE'         )) then Fcod_nserie          := ADataSet.FieldByName('COD_NSERIE').AsInteger;
    if Assigned(ADataSet.FindField('COD_NF'             )) then Fcod_nf              := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('NITEM_NF'           )) then Fnitem_nf            := ADataSet.FieldByName('NITEM_NF').AsInteger;
    if Assigned(ADataSet.FindField('TABPRATICADA'       )) then Ftabpraticada        := Trim(ADataSet.FieldByName('TABPRATICADA').AsString);
    if Assigned(ADataSet.FindField('QUANT_ITEM_DEV'     )) then Fquant_item_dev      := ADataSet.FieldByName('QUANT_ITEM_DEV').AsFloat;
    if Assigned(ADataSet.FindField('TIPV'               )) then Ftipv                := Trim(ADataSet.FieldByName('TIPV').AsString);
    if Assigned(ADataSet.FindField('MD5'                )) then Fmd5                 := Trim(ADataSet.FieldByName('MD5').AsString);
    if Assigned(ADataSet.FindField('COD_PEDIDO'         )) then Fcod_pedido          := ADataSet.FieldByName('COD_PEDIDO').AsInteger;
    if Assigned(ADataSet.FindField('COD_ALMOXARIFADO'   )) then Fcod_almoxarifado    := ADataSet.FieldByName('COD_ALMOXARIFADO').AsInteger;
    if Assigned(ADataSet.FindField('NPEDORIGINADO'      )) then Fnpedoriginado       := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    if Assigned(ADataSet.FindField('TIPOORIGINADO'      )) then Ftipooriginado       := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
    if Assigned(ADataSet.FindField('MAX_DESC_TAB'       )) then Fmax_desc_tab        := ADataSet.FieldByName('MAX_DESC_TAB').AsFloat;
    if Assigned(ADataSet.FindField('NITEM_PEDIDO'       )) then Fnitem_pedido        := ADataSet.FieldByName('NITEM_PEDIDO').AsInteger;
    if Assigned(ADataSet.FindField('RAT_DESC_AVISTA'    )) then Frat_desc_avista     := ADataSet.FieldByName('RAT_DESC_AVISTA').AsFloat;
    if Assigned(ADataSet.FindField('REFAZER_COMISS'     )) then Frefazer_comiss      := Trim(ADataSet.FieldByName('REFAZER_COMISS').AsString);
    if Assigned(ADataSet.FindField('NPED_ORIGEM'        )) then Fnped_origem         := ADataSet.FieldByName('NPED_ORIGEM').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ORIGEM'        )) then Ftipo_origem         := Trim(ADataSet.FieldByName('TIPO_ORIGEM').AsString);
    if Assigned(ADataSet.FindField('XPED_COMPRA'        )) then Fxped_compra         := Trim(ADataSet.FieldByName('XPED_COMPRA').AsString);
    if Assigned(ADataSet.FindField('NITEMPED_COMPRA'    )) then Fnitemped_compra     := ADataSet.FieldByName('NITEMPED_COMPRA').AsInteger;
    if Assigned(ADataSet.FindField('NPED_CONF'          )) then Fnped_conf           := ADataSet.FieldByName('NPED_CONF').AsInteger;
    if Assigned(ADataSet.FindField('NITEM_CONF'         )) then Fnitem_conf          := ADataSet.FieldByName('NITEM_CONF').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_CONF'          )) then Ftipo_conf           := Trim(ADataSet.FieldByName('TIPO_CONF').AsString);
    if Assigned(ADataSet.FindField('UNIDADE'            )) then Funidade             := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    if Assigned(ADataSet.FindField('SIT_TRIB'           )) then Fsit_trib            := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    if Assigned(ADataSet.FindField('ICM_PROD'           )) then Ficm_prod            := ADataSet.FieldByName('ICM_PROD').AsFloat;
    if Assigned(ADataSet.FindField('CSDECQTDE'          )) then Fcsdecqtde           := Trim(ADataSet.FieldByName('CSDECQTDE').AsString);
    if Assigned(ADataSet.FindField('CSDECVLUNT'         )) then Fcsdecvlunt          := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    if Assigned(ADataSet.FindField('NPREVENDA'          )) then Fnprevenda           := ADataSet.FieldByName('NPREVENDA').AsInteger;
    if Assigned(ADataSet.FindField('VL_DEBCRED'         )) then Fvl_debcred          := ADataSet.FieldByName('VL_DEBCRED').AsFloat;
    if Assigned(ADataSet.FindField('VL_DESP_NF'         )) then Fvl_desp_nf          := ADataSet.FieldByName('VL_DESP_NF').AsFloat;
    if Assigned(ADataSet.FindField('NITEM_SERV'         )) then Fnitem_serv          := ADataSet.FieldByName('NITEM_SERV').AsInteger;
    if Assigned(ADataSet.FindField('COD_VENDEDOR1'      )) then Fcod_vendedor1       := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    if Assigned(ADataSet.FindField('PRECOPORQTDE'       )) then Fprecoporqtde        := Trim(ADataSet.FieldByName('PRECOPORQTDE').AsString);
    if Assigned(ADataSet.FindField('N_NFD'              )) then Fn_nfd               := ADataSet.FieldByName('N_NFD').AsInteger;
    if Assigned(ADataSet.FindField('SERIED'             )) then Fseried              := Trim(ADataSet.FieldByName('SERIED').AsString);
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND'   )) then Fvl_comissao_vend    := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND' )) then Fperc_comissao_vend  := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND1'  )) then Fvl_comissao_vend1   := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND1')) then Fperc_comissao_vend1 := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('VL_DESP_NF_SFO'     )) then Fvl_desp_nf_sfo      := ADataSet.FieldByName('VL_DESP_NF_SFO').AsFloat;
    if Assigned(ADataSet.FindField('NF_DC_DESPNF'       )) then Fnf_dc_despnf        := ADataSet.FieldByName('NF_DC_DESPNF').AsFloat;
  end;
end;

{ TPedvenda_prod_classList }

function TPedvenda_prod_classList.GetItem(Index: Integer): TPedvenda_prod_class;
begin
  Result := TPedvenda_prod_class(inherited Items[Index]);
end;

function TPedvenda_prod_classList.New: TPedvenda_prod_class;
begin
  Result := TPedvenda_prod_class.Create;
  Add(Result);
end;

procedure TPedvenda_prod_classList.SetItem(Index: Integer; const Value: TPedvenda_prod_class);
begin
  Put(Index, Value);
end;

procedure TPedvenda_prod_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
