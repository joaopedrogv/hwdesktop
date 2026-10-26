unit pedvenda_prod_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  base_class,
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TPedvenda_prod_class = class(TBase_class)
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
    Fnf_dc_despnf       : Double;
    Fnf_ac_des_emb      : Double;
    procedure Setnped(const Value: Integer);
    procedure Settipo(const Value: string);
    procedure Setgrupo_prod(const Value: Integer);
    procedure Setcod_prod(const Value: string);
    procedure Setnitem(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_grade(const Value: Integer);
    procedure Setcodigo_nop(const Value: Double);
    procedure Setnum_fab_prod(const Value: string);
    procedure Setdescr_prod_ped(const Value: string);
    procedure Setquant_ped_item(const Value: Double);
    procedure Setvlun_ped_item(const Value: Double);
    procedure Setvltot_ped_item(const Value: Double);
    procedure Setvlun_orig(const Value: Double);
    procedure Setvlun_ped_nf(const Value: Double);
    procedure Setvltot_ped_nf(const Value: Double);
    procedure Setrateio_desc(const Value: Double);
    procedure Setrateio_acresc(const Value: Double);
    procedure Setn_nf(const Value: Integer);
    procedure Setserie(const Value: string);
    procedure Setaliquota_cp(const Value: string);
    procedure Setratdsas(const Value: Double);
    procedure Setcomiss_prod(const Value: Double);
    procedure Setcomiss_prod_ger(const Value: Double);
    procedure Setano_fab_prod(const Value: Integer);
    procedure Setn_serie_prod(const Value: string);
    procedure Setmodelo(const Value: string);
    procedure Setcor(const Value: string);
    procedure Setpcust_c(const Value: Double);
    procedure Setpcust_r(const Value: Double);
    procedure Setpcust_mc(const Value: Double);
    procedure Setpcust_mr(const Value: Double);
    procedure Settp_nf_ped(const Value: string);
    procedure Setsit_atd(const Value: string);
    procedure Setsel(const Value: string);
    procedure Setdata_atd(const Value: TDateTime);
    procedure Sethora_atd(const Value: string);
    procedure Setcodigo_kit(const Value: Integer);
    procedure Seticmant_sub(const Value: Double);
    procedure Setcod_seg_serv(const Value: Integer);
    procedure Setativo(const Value: Integer);
    procedure Setcol_cod_vendedor(const Value: Integer);
    procedure Setdesc_item(const Value: Double);
    procedure Setacresc_item(const Value: Double);
    procedure Setcod_vendedor(const Value: Integer);
    procedure Setdata_transf(const Value: TDateTime);
    procedure Setdata_dev(const Value: TDateTime);
    procedure Setnome_vend(const Value: string);
    procedure Setnome_vend1(const Value: string);
    procedure Setqt_dev(const Value: Double);
    procedure Setvlo_unitario(const Value: Double);
    procedure Setdata_inclusao(const Value: TDateTime);
    procedure Setstatus(const Value: string);
    procedure Setdav_origem(const Value: Integer);
    procedure Settp_descacres(const Value: string);
    procedure Setnat_descacres(const Value: string);
    procedure Setvalor_descacres(const Value: Double);
    procedure Setcod_nserie(const Value: Integer);
    procedure Setcod_nf(const Value: Integer);
    procedure Setnitem_nf(const Value: Integer);
    procedure Settabpraticada(const Value: string);
    procedure Setquant_item_dev(const Value: Double);
    procedure Settipv(const Value: string);
    procedure Setmd5(const Value: string);
    procedure Setcod_pedido(const Value: Integer);
    procedure Setcod_almoxarifado(const Value: Integer);
    procedure Setnpedoriginado(const Value: Integer);
    procedure Settipooriginado(const Value: string);
    procedure Setmax_desc_tab(const Value: Double);
    procedure Setnitem_pedido(const Value: Integer);
    procedure Setrat_desc_avista(const Value: Double);
    procedure Setrefazer_comiss(const Value: string);
    procedure Setnped_origem(const Value: Integer);
    procedure Settipo_origem(const Value: string);
    procedure Setxped_compra(const Value: string);
    procedure Setnitemped_compra(const Value: Integer);
    procedure Setnped_conf(const Value: Integer);
    procedure Setnitem_conf(const Value: Integer);
    procedure Settipo_conf(const Value: string);
    procedure Setunidade(const Value: string);
    procedure Setsit_trib(const Value: string);
    procedure Seticm_prod(const Value: Double);
    procedure Setcsdecqtde(const Value: string);
    procedure Setcsdecvlunt(const Value: string);
    procedure Setnprevenda(const Value: Integer);
    procedure Setvl_debcred(const Value: Double);
    procedure Setvl_desp_nf(const Value: Double);
    procedure Setnitem_serv(const Value: Integer);
    procedure Setcod_vendedor1(const Value: Integer);
    procedure Setprecoporqtde(const Value: string);
    procedure Setn_nfd(const Value: Integer);
    procedure Setseried(const Value: string);
    procedure Setvl_comissao_vend(const Value: Double);
    procedure Setperc_comissao_vend(const Value: Double);
    procedure Setvl_comissao_vend1(const Value: Double);
    procedure Setperc_comissao_vend1(const Value: Double);
    procedure Setnf_dc_despnf(const Value: Double);
    procedure Setnf_ac_des_emb(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property nped               : Integer   read Fnped                write Setnped;
    property tipo               : string    read Ftipo                write Settipo;
    property grupo_prod         : Integer   read Fgrupo_prod          write Setgrupo_prod;
    property cod_prod           : string    read Fcod_prod            write Setcod_prod;
    property nitem              : Integer   read Fnitem               write Setnitem;
    property cod_empresa        : Integer   read Fcod_empresa         write Setcod_empresa;
    property cod_grade          : Integer   read Fcod_grade           write Setcod_grade;
    property codigo_nop         : Double    read Fcodigo_nop          write Setcodigo_nop;
    property num_fab_prod       : string    read Fnum_fab_prod        write Setnum_fab_prod;
    property descr_prod_ped     : string    read Fdescr_prod_ped      write Setdescr_prod_ped;
    property quant_ped_item     : Double    read Fquant_ped_item      write Setquant_ped_item;
    property vlun_ped_item      : Double    read Fvlun_ped_item       write Setvlun_ped_item;
    property vltot_ped_item     : Double    read Fvltot_ped_item      write Setvltot_ped_item;
    property vlun_orig          : Double    read Fvlun_orig           write Setvlun_orig;
    property vlun_ped_nf        : Double    read Fvlun_ped_nf         write Setvlun_ped_nf;
    property vltot_ped_nf       : Double    read Fvltot_ped_nf        write Setvltot_ped_nf;
    property rateio_desc        : Double    read Frateio_desc         write Setrateio_desc;
    property rateio_acresc      : Double    read Frateio_acresc       write Setrateio_acresc;
    property n_nf               : Integer   read Fn_nf                write Setn_nf;
    property serie              : string    read Fserie               write Setserie;
    property aliquota_cp        : string    read Faliquota_cp         write Setaliquota_cp;
    property ratdsas            : Double    read Fratdsas             write Setratdsas;
    property comiss_prod        : Double    read Fcomiss_prod         write Setcomiss_prod;
    property comiss_prod_ger    : Double    read Fcomiss_prod_ger     write Setcomiss_prod_ger;
    property ano_fab_prod       : Integer   read Fano_fab_prod        write Setano_fab_prod;
    property n_serie_prod       : string    read Fn_serie_prod        write Setn_serie_prod;
    property modelo             : string    read Fmodelo              write Setmodelo;
    property cor                : string    read Fcor                 write Setcor;
    property pcust_c            : Double    read Fpcust_c             write Setpcust_c;
    property pcust_r            : Double    read Fpcust_r             write Setpcust_r;
    property pcust_mc           : Double    read Fpcust_mc            write Setpcust_mc;
    property pcust_mr           : Double    read Fpcust_mr            write Setpcust_mr;
    property tp_nf_ped          : string    read Ftp_nf_ped           write Settp_nf_ped;
    property sit_atd            : string    read Fsit_atd             write Setsit_atd;
    property sel                : string    read Fsel                 write Setsel;
    property data_atd           : TDateTime read Fdata_atd            write Setdata_atd;
    property hora_atd           : string    read Fhora_atd            write Sethora_atd;
    property codigo_kit         : Integer   read Fcodigo_kit          write Setcodigo_kit;
    property icmant_sub         : Double    read Ficmant_sub          write Seticmant_sub;
    property cod_seg_serv       : Integer   read Fcod_seg_serv        write Setcod_seg_serv;
    property ativo              : Integer   read Fativo               write Setativo;
    property col_cod_vendedor   : Integer   read Fcol_cod_vendedor    write Setcol_cod_vendedor;
    property desc_item          : Double    read Fdesc_item           write Setdesc_item;
    property acresc_item        : Double    read Facresc_item         write Setacresc_item;
    property cod_vendedor       : Integer   read Fcod_vendedor        write Setcod_vendedor;
    property data_transf        : TDateTime read Fdata_transf         write Setdata_transf;
    property data_dev           : TDateTime read Fdata_dev            write Setdata_dev;
    property nome_vend          : string    read Fnome_vend           write Setnome_vend;
    property nome_vend1         : string    read Fnome_vend1          write Setnome_vend1;
    property qt_dev             : Double    read Fqt_dev              write Setqt_dev;
    property vlo_unitario       : Double    read Fvlo_unitario        write Setvlo_unitario;
    property data_inclusao      : TDateTime read Fdata_inclusao       write Setdata_inclusao;
    property status             : string    read Fstatus              write Setstatus;
    property dav_origem         : Integer   read Fdav_origem          write Setdav_origem;
    property tp_descacres       : string    read Ftp_descacres        write Settp_descacres;
    property nat_descacres      : string    read Fnat_descacres       write Setnat_descacres;
    property valor_descacres    : Double    read Fvalor_descacres     write Setvalor_descacres;
    property cod_nserie         : Integer   read Fcod_nserie          write Setcod_nserie;
    property cod_nf             : Integer   read Fcod_nf              write Setcod_nf;
    property nitem_nf           : Integer   read Fnitem_nf            write Setnitem_nf;
    property tabpraticada       : string    read Ftabpraticada        write Settabpraticada;
    property quant_item_dev     : Double    read Fquant_item_dev      write Setquant_item_dev;
    property tipv               : string    read Ftipv                write Settipv;
    property md5                : string    read Fmd5                 write Setmd5;
    property cod_pedido         : Integer   read Fcod_pedido          write Setcod_pedido;
    property cod_almoxarifado   : Integer   read Fcod_almoxarifado    write Setcod_almoxarifado;
    property npedoriginado      : Integer   read Fnpedoriginado       write Setnpedoriginado;
    property tipooriginado      : string    read Ftipooriginado       write Settipooriginado;
    property max_desc_tab       : Double    read Fmax_desc_tab        write Setmax_desc_tab;
    property nitem_pedido       : Integer   read Fnitem_pedido        write Setnitem_pedido;
    property rat_desc_avista    : Double    read Frat_desc_avista     write Setrat_desc_avista;
    property refazer_comiss     : string    read Frefazer_comiss      write Setrefazer_comiss;
    property nped_origem        : Integer   read Fnped_origem         write Setnped_origem;
    property tipo_origem        : string    read Ftipo_origem         write Settipo_origem;
    property xped_compra        : string    read Fxped_compra         write Setxped_compra;
    property nitemped_compra    : Integer   read Fnitemped_compra     write Setnitemped_compra;
    property nped_conf          : Integer   read Fnped_conf           write Setnped_conf;
    property nitem_conf         : Integer   read Fnitem_conf          write Setnitem_conf;
    property tipo_conf          : string    read Ftipo_conf           write Settipo_conf;
    property unidade            : string    read Funidade             write Setunidade;
    property sit_trib           : string    read Fsit_trib            write Setsit_trib;
    property icm_prod           : Double    read Ficm_prod            write Seticm_prod;
    property csdecqtde          : string    read Fcsdecqtde           write Setcsdecqtde;
    property csdecvlunt         : string    read Fcsdecvlunt          write Setcsdecvlunt;
    property nprevenda          : Integer   read Fnprevenda           write Setnprevenda;
    property vl_debcred         : Double    read Fvl_debcred          write Setvl_debcred;
    property vl_desp_nf         : Double    read Fvl_desp_nf          write Setvl_desp_nf;
    property nitem_serv         : Integer   read Fnitem_serv          write Setnitem_serv;
    property cod_vendedor1      : Integer   read Fcod_vendedor1       write Setcod_vendedor1;
    property precoporqtde       : string    read Fprecoporqtde        write Setprecoporqtde;
    property n_nfd              : Integer   read Fn_nfd               write Setn_nfd;
    property seried             : string    read Fseried              write Setseried;
    property vl_comissao_vend   : Double    read Fvl_comissao_vend    write Setvl_comissao_vend;
    property perc_comissao_vend : Double    read Fperc_comissao_vend  write Setperc_comissao_vend;
    property vl_comissao_vend1  : Double    read Fvl_comissao_vend1   write Setvl_comissao_vend1;
    property perc_comissao_vend1: Double    read Fperc_comissao_vend1 write Setperc_comissao_vend1;
    property nf_dc_despnf       : Double    read Fnf_dc_despnf        write Setnf_dc_despnf;
    property nf_ac_des_emb      : Double    read Fnf_ac_des_emb       write Setnf_ac_des_emb;
  end;

  TPedvenda_prod_classList = class(TBase_classList)
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
  Ftable := TTable_fb.Create('PEDVENDA_PROD',
                             'NPED, TIPO, GRUPO_PROD, COD_PROD, NITEM, COD_GRADE, COD_EMPRESA, CODIGO_NOP',
                             'NPED, COD_VENDEDOR, COL_COD_VENDEDOR, GRUPO_PROD, COD_VENDEDOR1, TIPO, COD_EMPRESA, COD_PROD',
                             GetFieldsSql());
  Fativo := 1;
end;

destructor TPedvenda_prod_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
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
            ' @nf_dc_despnf, @nf_ac_des_emb';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_prod_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    nped                := ADataSet.FieldByName('NPED').AsInteger;
    tipo                := Trim(ADataSet.FieldByName('TIPO').AsString);
    grupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    cod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    nitem               := ADataSet.FieldByName('NITEM').AsInteger;
    cod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    cod_grade           := ADataSet.FieldByName('COD_GRADE').AsInteger;
    codigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    num_fab_prod        := Trim(ADataSet.FieldByName('NUM_FAB_PROD').AsString);
    descr_prod_ped      := Trim(ADataSet.FieldByName('DESCR_PROD_PED').AsString);
    quant_ped_item      := ADataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    vlun_ped_item       := ADataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
    vltot_ped_item      := ADataSet.FieldByName('VLTOT_PED_ITEM').AsFloat;
    vlun_orig           := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    vlun_ped_nf         := ADataSet.FieldByName('VLUN_PED_NF').AsFloat;
    vltot_ped_nf        := ADataSet.FieldByName('VLTOT_PED_NF').AsFloat;
    rateio_desc         := ADataSet.FieldByName('RATEIO_DESC').AsFloat;
    rateio_acresc       := ADataSet.FieldByName('RATEIO_ACRESC').AsFloat;
    n_nf                := ADataSet.FieldByName('N_NF').AsInteger;
    serie               := Trim(ADataSet.FieldByName('SERIE').AsString);
    aliquota_cp         := Trim(ADataSet.FieldByName('ALIQUOTA_CP').AsString);
    ratdsas             := ADataSet.FieldByName('RATDSAS').AsFloat;
    comiss_prod         := ADataSet.FieldByName('COMISS_PROD').AsFloat;
    comiss_prod_ger     := ADataSet.FieldByName('COMISS_PROD_GER').AsFloat;
    ano_fab_prod        := ADataSet.FieldByName('ANO_FAB_PROD').AsInteger;
    n_serie_prod        := Trim(ADataSet.FieldByName('N_SERIE_PROD').AsString);
    modelo              := Trim(ADataSet.FieldByName('MODELO').AsString);
    cor                 := Trim(ADataSet.FieldByName('COR').AsString);
    pcust_c             := ADataSet.FieldByName('PCUST_C').AsFloat;
    pcust_r             := ADataSet.FieldByName('PCUST_R').AsFloat;
    pcust_mc            := ADataSet.FieldByName('PCUST_MC').AsFloat;
    pcust_mr            := ADataSet.FieldByName('PCUST_MR').AsFloat;
    tp_nf_ped           := Trim(ADataSet.FieldByName('TP_NF_PED').AsString);
    sit_atd             := Trim(ADataSet.FieldByName('SIT_ATD').AsString);
    sel                 := Trim(ADataSet.FieldByName('SEL').AsString);
    data_atd            := ADataSet.FieldByName('DATA_ATD').AsDateTime;
    hora_atd            := Trim(ADataSet.FieldByName('HORA_ATD').AsString);
    codigo_kit          := ADataSet.FieldByName('CODIGO_KIT').AsInteger;
    icmant_sub          := ADataSet.FieldByName('ICMANT_SUB').AsFloat;
    cod_seg_serv        := ADataSet.FieldByName('COD_SEG_SERV').AsInteger;
    ativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    col_cod_vendedor    := ADataSet.FieldByName('COL_COD_VENDEDOR').AsInteger;
    desc_item           := ADataSet.FieldByName('DESC_ITEM').AsFloat;
    acresc_item         := ADataSet.FieldByName('ACRESC_ITEM').AsFloat;
    cod_vendedor        := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    data_transf         := ADataSet.FieldByName('DATA_TRANSF').AsDateTime;
    data_dev            := ADataSet.FieldByName('DATA_DEV').AsDateTime;
    nome_vend           := Trim(ADataSet.FieldByName('NOME_VEND').AsString);
    nome_vend1          := Trim(ADataSet.FieldByName('NOME_VEND1').AsString);
    qt_dev              := ADataSet.FieldByName('QT_DEV').AsFloat;
    vlo_unitario        := ADataSet.FieldByName('VLO_UNITARIO').AsFloat;
    data_inclusao       := ADataSet.FieldByName('DATA_INCLUSAO').AsDateTime;
    status              := Trim(ADataSet.FieldByName('STATUS').AsString);
    dav_origem          := ADataSet.FieldByName('DAV_ORIGEM').AsInteger;
    tp_descacres        := Trim(ADataSet.FieldByName('TP_DESCACRES').AsString);
    nat_descacres       := Trim(ADataSet.FieldByName('NAT_DESCACRES').AsString);
    valor_descacres     := ADataSet.FieldByName('VALOR_DESCACRES').AsFloat;
    cod_nserie          := ADataSet.FieldByName('COD_NSERIE').AsInteger;
    cod_nf              := ADataSet.FieldByName('COD_NF').AsInteger;
    nitem_nf            := ADataSet.FieldByName('NITEM_NF').AsInteger;
    tabpraticada        := Trim(ADataSet.FieldByName('TABPRATICADA').AsString);
    quant_item_dev      := ADataSet.FieldByName('QUANT_ITEM_DEV').AsFloat;
    tipv                := Trim(ADataSet.FieldByName('TIPV').AsString);
    md5                 := Trim(ADataSet.FieldByName('MD5').AsString);
    cod_pedido          := ADataSet.FieldByName('COD_PEDIDO').AsInteger;
    cod_almoxarifado    := ADataSet.FieldByName('COD_ALMOXARIFADO').AsInteger;
    npedoriginado       := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    tipooriginado       := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
    max_desc_tab        := ADataSet.FieldByName('MAX_DESC_TAB').AsFloat;
    nitem_pedido        := ADataSet.FieldByName('NITEM_PEDIDO').AsInteger;
    rat_desc_avista     := ADataSet.FieldByName('RAT_DESC_AVISTA').AsFloat;
    refazer_comiss      := Trim(ADataSet.FieldByName('REFAZER_COMISS').AsString);
    nped_origem         := ADataSet.FieldByName('NPED_ORIGEM').AsInteger;
    tipo_origem         := Trim(ADataSet.FieldByName('TIPO_ORIGEM').AsString);
    xped_compra         := Trim(ADataSet.FieldByName('XPED_COMPRA').AsString);
    nitemped_compra     := ADataSet.FieldByName('NITEMPED_COMPRA').AsInteger;
    nped_conf           := ADataSet.FieldByName('NPED_CONF').AsInteger;
    nitem_conf          := ADataSet.FieldByName('NITEM_CONF').AsInteger;
    tipo_conf           := Trim(ADataSet.FieldByName('TIPO_CONF').AsString);
    unidade             := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    sit_trib            := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    icm_prod            := ADataSet.FieldByName('ICM_PROD').AsFloat;
    csdecqtde           := Trim(ADataSet.FieldByName('CSDECQTDE').AsString);
    csdecvlunt          := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    nprevenda           := ADataSet.FieldByName('NPREVENDA').AsInteger;
    vl_debcred          := ADataSet.FieldByName('VL_DEBCRED').AsFloat;
    vl_desp_nf          := ADataSet.FieldByName('VL_DESP_NF').AsFloat;
    nitem_serv          := ADataSet.FieldByName('NITEM_SERV').AsInteger;
    cod_vendedor1       := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    precoporqtde        := Trim(ADataSet.FieldByName('PRECOPORQTDE').AsString);
    n_nfd               := ADataSet.FieldByName('N_NFD').AsInteger;
    seried              := Trim(ADataSet.FieldByName('SERIED').AsString);
    vl_comissao_vend    := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    perc_comissao_vend  := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    vl_comissao_vend1   := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    perc_comissao_vend1 := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    nf_dc_despnf        := ADataSet.FieldByName('NF_DC_DESPNF').AsFloat;
    nf_ac_des_emb       := ADataSet.FieldByName('NF_AC_DES_EMB').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'               )) then nped                := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'               )) then tipo                := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('GRUPO_PROD'         )) then grupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'           )) then cod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('NITEM'              )) then nitem               := ADataSet.FieldByName('NITEM').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'        )) then cod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_GRADE'          )) then cod_grade           := ADataSet.FieldByName('COD_GRADE').AsInteger;
    if Assigned(ADataSet.FindField('CODIGO_NOP'         )) then codigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    if Assigned(ADataSet.FindField('NUM_FAB_PROD'       )) then num_fab_prod        := Trim(ADataSet.FieldByName('NUM_FAB_PROD').AsString);
    if Assigned(ADataSet.FindField('DESCR_PROD_PED'     )) then descr_prod_ped      := Trim(ADataSet.FieldByName('DESCR_PROD_PED').AsString);
    if Assigned(ADataSet.FindField('QUANT_PED_ITEM'     )) then quant_ped_item      := ADataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('VLUN_PED_ITEM'      )) then vlun_ped_item       := ADataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('VLTOT_PED_ITEM'     )) then vltot_ped_item      := ADataSet.FieldByName('VLTOT_PED_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('VLUN_ORIG'          )) then vlun_orig           := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    if Assigned(ADataSet.FindField('VLUN_PED_NF'        )) then vlun_ped_nf         := ADataSet.FieldByName('VLUN_PED_NF').AsFloat;
    if Assigned(ADataSet.FindField('VLTOT_PED_NF'       )) then vltot_ped_nf        := ADataSet.FieldByName('VLTOT_PED_NF').AsFloat;
    if Assigned(ADataSet.FindField('RATEIO_DESC'        )) then rateio_desc         := ADataSet.FieldByName('RATEIO_DESC').AsFloat;
    if Assigned(ADataSet.FindField('RATEIO_ACRESC'      )) then rateio_acresc       := ADataSet.FieldByName('RATEIO_ACRESC').AsFloat;
    if Assigned(ADataSet.FindField('N_NF'               )) then n_nf                := ADataSet.FieldByName('N_NF').AsInteger;
    if Assigned(ADataSet.FindField('SERIE'              )) then serie               := Trim(ADataSet.FieldByName('SERIE').AsString);
    if Assigned(ADataSet.FindField('ALIQUOTA_CP'        )) then aliquota_cp         := Trim(ADataSet.FieldByName('ALIQUOTA_CP').AsString);
    if Assigned(ADataSet.FindField('RATDSAS'            )) then ratdsas             := ADataSet.FieldByName('RATDSAS').AsFloat;
    if Assigned(ADataSet.FindField('COMISS_PROD'        )) then comiss_prod         := ADataSet.FieldByName('COMISS_PROD').AsFloat;
    if Assigned(ADataSet.FindField('COMISS_PROD_GER'    )) then comiss_prod_ger     := ADataSet.FieldByName('COMISS_PROD_GER').AsFloat;
    if Assigned(ADataSet.FindField('ANO_FAB_PROD'       )) then ano_fab_prod        := ADataSet.FieldByName('ANO_FAB_PROD').AsInteger;
    if Assigned(ADataSet.FindField('N_SERIE_PROD'       )) then n_serie_prod        := Trim(ADataSet.FieldByName('N_SERIE_PROD').AsString);
    if Assigned(ADataSet.FindField('MODELO'             )) then modelo              := Trim(ADataSet.FieldByName('MODELO').AsString);
    if Assigned(ADataSet.FindField('COR'                )) then cor                 := Trim(ADataSet.FieldByName('COR').AsString);
    if Assigned(ADataSet.FindField('PCUST_C'            )) then pcust_c             := ADataSet.FieldByName('PCUST_C').AsFloat;
    if Assigned(ADataSet.FindField('PCUST_R'            )) then pcust_r             := ADataSet.FieldByName('PCUST_R').AsFloat;
    if Assigned(ADataSet.FindField('PCUST_MC'           )) then pcust_mc            := ADataSet.FieldByName('PCUST_MC').AsFloat;
    if Assigned(ADataSet.FindField('PCUST_MR'           )) then pcust_mr            := ADataSet.FieldByName('PCUST_MR').AsFloat;
    if Assigned(ADataSet.FindField('TP_NF_PED'          )) then tp_nf_ped           := Trim(ADataSet.FieldByName('TP_NF_PED').AsString);
    if Assigned(ADataSet.FindField('SIT_ATD'            )) then sit_atd             := Trim(ADataSet.FieldByName('SIT_ATD').AsString);
    if Assigned(ADataSet.FindField('SEL'                )) then sel                 := Trim(ADataSet.FieldByName('SEL').AsString);
    if Assigned(ADataSet.FindField('DATA_ATD'           )) then data_atd            := ADataSet.FieldByName('DATA_ATD').AsDateTime;
    if Assigned(ADataSet.FindField('HORA_ATD'           )) then hora_atd            := Trim(ADataSet.FieldByName('HORA_ATD').AsString);
    if Assigned(ADataSet.FindField('CODIGO_KIT'         )) then codigo_kit          := ADataSet.FieldByName('CODIGO_KIT').AsInteger;
    if Assigned(ADataSet.FindField('ICMANT_SUB'         )) then icmant_sub          := ADataSet.FieldByName('ICMANT_SUB').AsFloat;
    if Assigned(ADataSet.FindField('COD_SEG_SERV'       )) then cod_seg_serv        := ADataSet.FieldByName('COD_SEG_SERV').AsInteger;
    if Assigned(ADataSet.FindField('ATIVO'              )) then ativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('COL_COD_VENDEDOR'   )) then col_cod_vendedor    := ADataSet.FieldByName('COL_COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('DESC_ITEM'          )) then desc_item           := ADataSet.FieldByName('DESC_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('ACRESC_ITEM'        )) then acresc_item         := ADataSet.FieldByName('ACRESC_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('COD_VENDEDOR'       )) then cod_vendedor        := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('DATA_TRANSF'        )) then data_transf         := ADataSet.FieldByName('DATA_TRANSF').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_DEV'           )) then data_dev            := ADataSet.FieldByName('DATA_DEV').AsDateTime;
    if Assigned(ADataSet.FindField('NOME_VEND'          )) then nome_vend           := Trim(ADataSet.FieldByName('NOME_VEND').AsString);
    if Assigned(ADataSet.FindField('NOME_VEND1'         )) then nome_vend1          := Trim(ADataSet.FieldByName('NOME_VEND1').AsString);
    if Assigned(ADataSet.FindField('QT_DEV'             )) then qt_dev              := ADataSet.FieldByName('QT_DEV').AsFloat;
    if Assigned(ADataSet.FindField('VLO_UNITARIO'       )) then vlo_unitario        := ADataSet.FieldByName('VLO_UNITARIO').AsFloat;
    if Assigned(ADataSet.FindField('DATA_INCLUSAO'      )) then data_inclusao       := ADataSet.FieldByName('DATA_INCLUSAO').AsDateTime;
    if Assigned(ADataSet.FindField('STATUS'             )) then status              := Trim(ADataSet.FieldByName('STATUS').AsString);
    if Assigned(ADataSet.FindField('DAV_ORIGEM'         )) then dav_origem          := ADataSet.FieldByName('DAV_ORIGEM').AsInteger;
    if Assigned(ADataSet.FindField('TP_DESCACRES'       )) then tp_descacres        := Trim(ADataSet.FieldByName('TP_DESCACRES').AsString);
    if Assigned(ADataSet.FindField('NAT_DESCACRES'      )) then nat_descacres       := Trim(ADataSet.FieldByName('NAT_DESCACRES').AsString);
    if Assigned(ADataSet.FindField('VALOR_DESCACRES'    )) then valor_descacres     := ADataSet.FieldByName('VALOR_DESCACRES').AsFloat;
    if Assigned(ADataSet.FindField('COD_NSERIE'         )) then cod_nserie          := ADataSet.FieldByName('COD_NSERIE').AsInteger;
    if Assigned(ADataSet.FindField('COD_NF'             )) then cod_nf              := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('NITEM_NF'           )) then nitem_nf            := ADataSet.FieldByName('NITEM_NF').AsInteger;
    if Assigned(ADataSet.FindField('TABPRATICADA'       )) then tabpraticada        := Trim(ADataSet.FieldByName('TABPRATICADA').AsString);
    if Assigned(ADataSet.FindField('QUANT_ITEM_DEV'     )) then quant_item_dev      := ADataSet.FieldByName('QUANT_ITEM_DEV').AsFloat;
    if Assigned(ADataSet.FindField('TIPV'               )) then tipv                := Trim(ADataSet.FieldByName('TIPV').AsString);
    if Assigned(ADataSet.FindField('MD5'                )) then md5                 := Trim(ADataSet.FieldByName('MD5').AsString);
    if Assigned(ADataSet.FindField('COD_PEDIDO'         )) then cod_pedido          := ADataSet.FieldByName('COD_PEDIDO').AsInteger;
    if Assigned(ADataSet.FindField('COD_ALMOXARIFADO'   )) then cod_almoxarifado    := ADataSet.FieldByName('COD_ALMOXARIFADO').AsInteger;
    if Assigned(ADataSet.FindField('NPEDORIGINADO'      )) then npedoriginado       := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    if Assigned(ADataSet.FindField('TIPOORIGINADO'      )) then tipooriginado       := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
    if Assigned(ADataSet.FindField('MAX_DESC_TAB'       )) then max_desc_tab        := ADataSet.FieldByName('MAX_DESC_TAB').AsFloat;
    if Assigned(ADataSet.FindField('NITEM_PEDIDO'       )) then nitem_pedido        := ADataSet.FieldByName('NITEM_PEDIDO').AsInteger;
    if Assigned(ADataSet.FindField('RAT_DESC_AVISTA'    )) then rat_desc_avista     := ADataSet.FieldByName('RAT_DESC_AVISTA').AsFloat;
    if Assigned(ADataSet.FindField('REFAZER_COMISS'     )) then refazer_comiss      := Trim(ADataSet.FieldByName('REFAZER_COMISS').AsString);
    if Assigned(ADataSet.FindField('NPED_ORIGEM'        )) then nped_origem         := ADataSet.FieldByName('NPED_ORIGEM').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ORIGEM'        )) then tipo_origem         := Trim(ADataSet.FieldByName('TIPO_ORIGEM').AsString);
    if Assigned(ADataSet.FindField('XPED_COMPRA'        )) then xped_compra         := Trim(ADataSet.FieldByName('XPED_COMPRA').AsString);
    if Assigned(ADataSet.FindField('NITEMPED_COMPRA'    )) then nitemped_compra     := ADataSet.FieldByName('NITEMPED_COMPRA').AsInteger;
    if Assigned(ADataSet.FindField('NPED_CONF'          )) then nped_conf           := ADataSet.FieldByName('NPED_CONF').AsInteger;
    if Assigned(ADataSet.FindField('NITEM_CONF'         )) then nitem_conf          := ADataSet.FieldByName('NITEM_CONF').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_CONF'          )) then tipo_conf           := Trim(ADataSet.FieldByName('TIPO_CONF').AsString);
    if Assigned(ADataSet.FindField('UNIDADE'            )) then unidade             := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    if Assigned(ADataSet.FindField('SIT_TRIB'           )) then sit_trib            := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    if Assigned(ADataSet.FindField('ICM_PROD'           )) then icm_prod            := ADataSet.FieldByName('ICM_PROD').AsFloat;
    if Assigned(ADataSet.FindField('CSDECQTDE'          )) then csdecqtde           := Trim(ADataSet.FieldByName('CSDECQTDE').AsString);
    if Assigned(ADataSet.FindField('CSDECVLUNT'         )) then csdecvlunt          := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    if Assigned(ADataSet.FindField('NPREVENDA'          )) then nprevenda           := ADataSet.FieldByName('NPREVENDA').AsInteger;
    if Assigned(ADataSet.FindField('VL_DEBCRED'         )) then vl_debcred          := ADataSet.FieldByName('VL_DEBCRED').AsFloat;
    if Assigned(ADataSet.FindField('VL_DESP_NF'         )) then vl_desp_nf          := ADataSet.FieldByName('VL_DESP_NF').AsFloat;
    if Assigned(ADataSet.FindField('NITEM_SERV'         )) then nitem_serv          := ADataSet.FieldByName('NITEM_SERV').AsInteger;
    if Assigned(ADataSet.FindField('COD_VENDEDOR1'      )) then cod_vendedor1       := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    if Assigned(ADataSet.FindField('PRECOPORQTDE'       )) then precoporqtde        := Trim(ADataSet.FieldByName('PRECOPORQTDE').AsString);
    if Assigned(ADataSet.FindField('N_NFD'              )) then n_nfd               := ADataSet.FieldByName('N_NFD').AsInteger;
    if Assigned(ADataSet.FindField('SERIED'             )) then seried              := Trim(ADataSet.FieldByName('SERIED').AsString);
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND'   )) then vl_comissao_vend    := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND' )) then perc_comissao_vend  := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND1'  )) then vl_comissao_vend1   := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND1')) then perc_comissao_vend1 := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('NF_DC_DESPNF'       )) then nf_dc_despnf        := ADataSet.FieldByName('NF_DC_DESPNF').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_DES_EMB'      )) then nf_ac_des_emb       := ADataSet.FieldByName('NF_AC_DES_EMB').AsFloat;
  end;
end;

function TPedvenda_prod_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('NPED').AsInteger              := Fnped;
    ADataSet.ParamByName('TIPO').AsString               := Copy(Ftipo          , 1, 3);
    ADataSet.ParamByName('GRUPO_PROD').AsInteger        := Fgrupo_prod;
    ADataSet.ParamByName('COD_PROD').AsString           := Copy(Fcod_prod      , 1, 6);
    ADataSet.ParamByName('NITEM').AsInteger             := Fnitem;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger       := Fcod_empresa;
    ADataSet.ParamByName('COD_GRADE').AsInteger         := Fcod_grade;
    ADataSet.ParamByName('CODIGO_NOP').AsFloat          := Fcodigo_nop;
    ADataSet.ParamByName('NUM_FAB_PROD').AsString       := Copy(Fnum_fab_prod  , 1, 20);
    ADataSet.ParamByName('DESCR_PROD_PED').AsString     := Copy(Fdescr_prod_ped, 1, 75);
    ADataSet.ParamByName('QUANT_PED_ITEM').AsFloat      := Fquant_ped_item;
    ADataSet.ParamByName('VLUN_PED_ITEM').AsFloat       := Fvlun_ped_item;
    ADataSet.ParamByName('VLTOT_PED_ITEM').AsFloat      := Fvltot_ped_item;
    ADataSet.ParamByName('VLUN_ORIG').AsFloat           := Fvlun_orig;
    ADataSet.ParamByName('VLUN_PED_NF').AsFloat         := Fvlun_ped_nf;
    ADataSet.ParamByName('VLTOT_PED_NF').AsFloat        := Fvltot_ped_nf;
    ADataSet.ParamByName('RATEIO_DESC').AsFloat         := Frateio_desc;
    ADataSet.ParamByName('RATEIO_ACRESC').AsFloat       := Frateio_acresc;
    ADataSet.ParamByName('N_NF').AsInteger              := Fn_nf;
    ADataSet.ParamByName('SERIE').AsString              := Copy(Fserie         , 1, 5);
    ADataSet.ParamByName('ALIQUOTA_CP').AsString        := Copy(Faliquota_cp   , 1, 4);
    ADataSet.ParamByName('RATDSAS').AsFloat             := Fratdsas;
    ADataSet.ParamByName('COMISS_PROD').AsFloat         := Fcomiss_prod;
    ADataSet.ParamByName('COMISS_PROD_GER').AsFloat     := Fcomiss_prod_ger;
    ADataSet.ParamByName('ANO_FAB_PROD').AsInteger      := Fano_fab_prod;
    ADataSet.ParamByName('N_SERIE_PROD').AsString       := Copy(Fn_serie_prod  , 1, 15);
    ADataSet.ParamByName('MODELO').AsString             := Copy(Fmodelo        , 1, 15);
    ADataSet.ParamByName('COR').AsString                := Copy(Fcor           , 1, 10);
    ADataSet.ParamByName('PCUST_C').AsFloat             := Fpcust_c;
    ADataSet.ParamByName('PCUST_R').AsFloat             := Fpcust_r;
    ADataSet.ParamByName('PCUST_MC').AsFloat            := Fpcust_mc;
    ADataSet.ParamByName('PCUST_MR').AsFloat            := Fpcust_mr;
    ADataSet.ParamByName('TP_NF_PED').AsString          := Copy(Ftp_nf_ped     , 1, 1);
    ADataSet.ParamByName('SIT_ATD').AsString            := Copy(Fsit_atd       , 1, 2);
    ADataSet.ParamByName('SEL').AsString                := Copy(Fsel           , 1, 1);
    ADataSet.ParamByName('DATA_ATD').AsDateTime         := Fdata_atd;
    ADataSet.ParamByName('HORA_ATD').AsString           := Copy(Fhora_atd      , 1, 8);
    ADataSet.ParamByName('CODIGO_KIT').AsInteger        := Fcodigo_kit;
    ADataSet.ParamByName('ICMANT_SUB').AsFloat          := Ficmant_sub;
    ADataSet.ParamByName('COD_SEG_SERV').AsInteger      := Fcod_seg_serv;
    ADataSet.ParamByName('ATIVO').AsInteger             := Fativo;
    ADataSet.ParamByName('COL_COD_VENDEDOR').AsInteger  := Fcol_cod_vendedor;
    ADataSet.ParamByName('DESC_ITEM').AsFloat           := Fdesc_item;
    ADataSet.ParamByName('ACRESC_ITEM').AsFloat         := Facresc_item;
    ADataSet.ParamByName('COD_VENDEDOR').AsInteger      := Fcod_vendedor;
    ADataSet.ParamByName('DATA_TRANSF').AsDateTime      := Fdata_transf;
    ADataSet.ParamByName('DATA_DEV').AsDateTime         := Fdata_dev;
    ADataSet.ParamByName('NOME_VEND').AsString          := Copy(Fnome_vend     , 1, 35);
    ADataSet.ParamByName('NOME_VEND1').AsString         := Copy(Fnome_vend1    , 1, 35);
    ADataSet.ParamByName('QT_DEV').AsFloat              := Fqt_dev;
    ADataSet.ParamByName('VLO_UNITARIO').AsFloat        := Fvlo_unitario;
    ADataSet.ParamByName('DATA_INCLUSAO').AsDateTime    := Fdata_inclusao;
    ADataSet.ParamByName('STATUS').AsString             := Copy(Fstatus        , 1, 10);
    ADataSet.ParamByName('DAV_ORIGEM').AsInteger        := Fdav_origem;
    ADataSet.ParamByName('TP_DESCACRES').AsString       := Copy(Ftp_descacres  , 1, 10);
    ADataSet.ParamByName('NAT_DESCACRES').AsString      := Copy(Fnat_descacres , 1, 10);
    ADataSet.ParamByName('VALOR_DESCACRES').AsFloat     := Fvalor_descacres;
    ADataSet.ParamByName('COD_NSERIE').AsInteger        := Fcod_nserie;
    ADataSet.ParamByName('COD_NF').AsInteger            := Fcod_nf;
    ADataSet.ParamByName('NITEM_NF').AsInteger          := Fnitem_nf;
    ADataSet.ParamByName('TABPRATICADA').AsString       := Copy(Ftabpraticada  , 1, 1);
    ADataSet.ParamByName('QUANT_ITEM_DEV').AsFloat      := Fquant_item_dev;
    ADataSet.ParamByName('TIPV').AsString               := Copy(Ftipv          , 1, 1);
    ADataSet.ParamByName('MD5').AsString                := Copy(Fmd5           , 1, 256);
    ADataSet.ParamByName('COD_PEDIDO').AsInteger        := Fcod_pedido;
    ADataSet.ParamByName('COD_ALMOXARIFADO').AsInteger  := Fcod_almoxarifado;
    ADataSet.ParamByName('NPEDORIGINADO').AsInteger     := Fnpedoriginado;
    ADataSet.ParamByName('TIPOORIGINADO').AsString      := Copy(Ftipooriginado , 1, 3);
    ADataSet.ParamByName('MAX_DESC_TAB').AsFloat        := Fmax_desc_tab;
    ADataSet.ParamByName('NITEM_PEDIDO').AsInteger      := Fnitem_pedido;
    ADataSet.ParamByName('RAT_DESC_AVISTA').AsFloat     := Frat_desc_avista;
    ADataSet.ParamByName('REFAZER_COMISS').AsString     := Copy(Frefazer_comiss, 1, 1);
    ADataSet.ParamByName('NPED_ORIGEM').AsInteger       := Fnped_origem;
    ADataSet.ParamByName('TIPO_ORIGEM').AsString        := Copy(Ftipo_origem   , 1, 3);
    ADataSet.ParamByName('XPED_COMPRA').AsString        := Copy(Fxped_compra   , 1, 15);
    ADataSet.ParamByName('NITEMPED_COMPRA').AsInteger   := Fnitemped_compra;
    ADataSet.ParamByName('NPED_CONF').AsInteger         := Fnped_conf;
    ADataSet.ParamByName('NITEM_CONF').AsInteger        := Fnitem_conf;
    ADataSet.ParamByName('TIPO_CONF').AsString          := Copy(Ftipo_conf     , 1, 3);
    ADataSet.ParamByName('UNIDADE').AsString            := Copy(Funidade       , 1, 3);
    ADataSet.ParamByName('SIT_TRIB').AsString           := Copy(Fsit_trib      , 1, 1);
    ADataSet.ParamByName('ICM_PROD').AsFloat            := Ficm_prod;
    ADataSet.ParamByName('CSDECQTDE').AsString          := Copy(Fcsdecqtde     , 1, 1);
    ADataSet.ParamByName('CSDECVLUNT').AsString         := Copy(Fcsdecvlunt    , 1, 1);
    ADataSet.ParamByName('NPREVENDA').AsInteger         := Fnprevenda;
    ADataSet.ParamByName('VL_DEBCRED').AsFloat          := Fvl_debcred;
    ADataSet.ParamByName('VL_DESP_NF').AsFloat          := Fvl_desp_nf;
    ADataSet.ParamByName('NITEM_SERV').AsInteger        := Fnitem_serv;
    ADataSet.ParamByName('COD_VENDEDOR1').AsInteger     := Fcod_vendedor1;
    ADataSet.ParamByName('PRECOPORQTDE').AsString       := Copy(Fprecoporqtde  , 1, 1);
    ADataSet.ParamByName('N_NFD').AsInteger             := Fn_nfd;
    ADataSet.ParamByName('SERIED').AsString             := Copy(Fseried        , 1, 5);
    ADataSet.ParamByName('VL_COMISSAO_VEND').AsFloat    := Fvl_comissao_vend;
    ADataSet.ParamByName('PERC_COMISSAO_VEND').AsFloat  := Fperc_comissao_vend;
    ADataSet.ParamByName('VL_COMISSAO_VEND1').AsFloat   := Fvl_comissao_vend1;
    ADataSet.ParamByName('PERC_COMISSAO_VEND1').AsFloat := Fperc_comissao_vend1;
    ADataSet.ParamByName('NF_DC_DESPNF').AsFloat        := Fnf_dc_despnf;
    ADataSet.ParamByName('NF_AC_DES_EMB').AsFloat       := Fnf_ac_des_emb;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('NPED'               )) then   ADataSet.ParamByName('NPED').AsInteger              := Fnped;
    if Assigned(ADataSet.Params.FindParam('TIPO'               )) then   ADataSet.ParamByName('TIPO').AsString               := Copy(Ftipo          , 1, 3);
    if Assigned(ADataSet.Params.FindParam('GRUPO_PROD'         )) then   ADataSet.ParamByName('GRUPO_PROD').AsInteger        := Fgrupo_prod;
    if Assigned(ADataSet.Params.FindParam('COD_PROD'           )) then   ADataSet.ParamByName('COD_PROD').AsString           := Copy(Fcod_prod      , 1, 6);
    if Assigned(ADataSet.Params.FindParam('NITEM'              )) then   ADataSet.ParamByName('NITEM').AsInteger             := Fnitem;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'        )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger       := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_GRADE'          )) then   ADataSet.ParamByName('COD_GRADE').AsInteger         := Fcod_grade;
    if Assigned(ADataSet.Params.FindParam('CODIGO_NOP'         )) then   ADataSet.ParamByName('CODIGO_NOP').AsFloat          := Fcodigo_nop;
    if Assigned(ADataSet.Params.FindParam('NUM_FAB_PROD'       )) then   ADataSet.ParamByName('NUM_FAB_PROD').AsString       := Copy(Fnum_fab_prod  , 1, 20);
    if Assigned(ADataSet.Params.FindParam('DESCR_PROD_PED'     )) then   ADataSet.ParamByName('DESCR_PROD_PED').AsString     := Copy(Fdescr_prod_ped, 1, 75);
    if Assigned(ADataSet.Params.FindParam('QUANT_PED_ITEM'     )) then   ADataSet.ParamByName('QUANT_PED_ITEM').AsFloat      := Fquant_ped_item;
    if Assigned(ADataSet.Params.FindParam('VLUN_PED_ITEM'      )) then   ADataSet.ParamByName('VLUN_PED_ITEM').AsFloat       := Fvlun_ped_item;
    if Assigned(ADataSet.Params.FindParam('VLTOT_PED_ITEM'     )) then   ADataSet.ParamByName('VLTOT_PED_ITEM').AsFloat      := Fvltot_ped_item;
    if Assigned(ADataSet.Params.FindParam('VLUN_ORIG'          )) then   ADataSet.ParamByName('VLUN_ORIG').AsFloat           := Fvlun_orig;
    if Assigned(ADataSet.Params.FindParam('VLUN_PED_NF'        )) then   ADataSet.ParamByName('VLUN_PED_NF').AsFloat         := Fvlun_ped_nf;
    if Assigned(ADataSet.Params.FindParam('VLTOT_PED_NF'       )) then   ADataSet.ParamByName('VLTOT_PED_NF').AsFloat        := Fvltot_ped_nf;
    if Assigned(ADataSet.Params.FindParam('RATEIO_DESC'        )) then   ADataSet.ParamByName('RATEIO_DESC').AsFloat         := Frateio_desc;
    if Assigned(ADataSet.Params.FindParam('RATEIO_ACRESC'      )) then   ADataSet.ParamByName('RATEIO_ACRESC').AsFloat       := Frateio_acresc;
    if Assigned(ADataSet.Params.FindParam('N_NF'               )) then   ADataSet.ParamByName('N_NF').AsInteger              := Fn_nf;
    if Assigned(ADataSet.Params.FindParam('SERIE'              )) then   ADataSet.ParamByName('SERIE').AsString              := Copy(Fserie         , 1, 5);
    if Assigned(ADataSet.Params.FindParam('ALIQUOTA_CP'        )) then   ADataSet.ParamByName('ALIQUOTA_CP').AsString        := Copy(Faliquota_cp   , 1, 4);
    if Assigned(ADataSet.Params.FindParam('RATDSAS'            )) then   ADataSet.ParamByName('RATDSAS').AsFloat             := Fratdsas;
    if Assigned(ADataSet.Params.FindParam('COMISS_PROD'        )) then   ADataSet.ParamByName('COMISS_PROD').AsFloat         := Fcomiss_prod;
    if Assigned(ADataSet.Params.FindParam('COMISS_PROD_GER'    )) then   ADataSet.ParamByName('COMISS_PROD_GER').AsFloat     := Fcomiss_prod_ger;
    if Assigned(ADataSet.Params.FindParam('ANO_FAB_PROD'       )) then   ADataSet.ParamByName('ANO_FAB_PROD').AsInteger      := Fano_fab_prod;
    if Assigned(ADataSet.Params.FindParam('N_SERIE_PROD'       )) then   ADataSet.ParamByName('N_SERIE_PROD').AsString       := Copy(Fn_serie_prod  , 1, 15);
    if Assigned(ADataSet.Params.FindParam('MODELO'             )) then   ADataSet.ParamByName('MODELO').AsString             := Copy(Fmodelo        , 1, 15);
    if Assigned(ADataSet.Params.FindParam('COR'                )) then   ADataSet.ParamByName('COR').AsString                := Copy(Fcor           , 1, 10);
    if Assigned(ADataSet.Params.FindParam('PCUST_C'            )) then   ADataSet.ParamByName('PCUST_C').AsFloat             := Fpcust_c;
    if Assigned(ADataSet.Params.FindParam('PCUST_R'            )) then   ADataSet.ParamByName('PCUST_R').AsFloat             := Fpcust_r;
    if Assigned(ADataSet.Params.FindParam('PCUST_MC'           )) then   ADataSet.ParamByName('PCUST_MC').AsFloat            := Fpcust_mc;
    if Assigned(ADataSet.Params.FindParam('PCUST_MR'           )) then   ADataSet.ParamByName('PCUST_MR').AsFloat            := Fpcust_mr;
    if Assigned(ADataSet.Params.FindParam('TP_NF_PED'          )) then   ADataSet.ParamByName('TP_NF_PED').AsString          := Copy(Ftp_nf_ped     , 1, 1);
    if Assigned(ADataSet.Params.FindParam('SIT_ATD'            )) then   ADataSet.ParamByName('SIT_ATD').AsString            := Copy(Fsit_atd       , 1, 2);
    if Assigned(ADataSet.Params.FindParam('SEL'                )) then   ADataSet.ParamByName('SEL').AsString                := Copy(Fsel           , 1, 1);
    if Assigned(ADataSet.Params.FindParam('DATA_ATD'           )) then   ADataSet.ParamByName('DATA_ATD').AsDateTime         := Fdata_atd;
    if Assigned(ADataSet.Params.FindParam('HORA_ATD'           )) then   ADataSet.ParamByName('HORA_ATD').AsString           := Copy(Fhora_atd      , 1, 8);
    if Assigned(ADataSet.Params.FindParam('CODIGO_KIT'         )) then   ADataSet.ParamByName('CODIGO_KIT').AsInteger        := Fcodigo_kit;
    if Assigned(ADataSet.Params.FindParam('ICMANT_SUB'         )) then   ADataSet.ParamByName('ICMANT_SUB').AsFloat          := Ficmant_sub;
    if Assigned(ADataSet.Params.FindParam('COD_SEG_SERV'       )) then   ADataSet.ParamByName('COD_SEG_SERV').AsInteger      := Fcod_seg_serv;
    if Assigned(ADataSet.Params.FindParam('ATIVO'              )) then   ADataSet.ParamByName('ATIVO').AsInteger             := Fativo;
    if Assigned(ADataSet.Params.FindParam('COL_COD_VENDEDOR'   )) then   ADataSet.ParamByName('COL_COD_VENDEDOR').AsInteger  := Fcol_cod_vendedor;
    if Assigned(ADataSet.Params.FindParam('DESC_ITEM'          )) then   ADataSet.ParamByName('DESC_ITEM').AsFloat           := Fdesc_item;
    if Assigned(ADataSet.Params.FindParam('ACRESC_ITEM'        )) then   ADataSet.ParamByName('ACRESC_ITEM').AsFloat         := Facresc_item;
    if Assigned(ADataSet.Params.FindParam('COD_VENDEDOR'       )) then   ADataSet.ParamByName('COD_VENDEDOR').AsInteger      := Fcod_vendedor;
    if Assigned(ADataSet.Params.FindParam('DATA_TRANSF'        )) then   ADataSet.ParamByName('DATA_TRANSF').AsDateTime      := Fdata_transf;
    if Assigned(ADataSet.Params.FindParam('DATA_DEV'           )) then   ADataSet.ParamByName('DATA_DEV').AsDateTime         := Fdata_dev;
    if Assigned(ADataSet.Params.FindParam('NOME_VEND'          )) then   ADataSet.ParamByName('NOME_VEND').AsString          := Copy(Fnome_vend     , 1, 35);
    if Assigned(ADataSet.Params.FindParam('NOME_VEND1'         )) then   ADataSet.ParamByName('NOME_VEND1').AsString         := Copy(Fnome_vend1    , 1, 35);
    if Assigned(ADataSet.Params.FindParam('QT_DEV'             )) then   ADataSet.ParamByName('QT_DEV').AsFloat              := Fqt_dev;
    if Assigned(ADataSet.Params.FindParam('VLO_UNITARIO'       )) then   ADataSet.ParamByName('VLO_UNITARIO').AsFloat        := Fvlo_unitario;
    if Assigned(ADataSet.Params.FindParam('DATA_INCLUSAO'      )) then   ADataSet.ParamByName('DATA_INCLUSAO').AsDateTime    := Fdata_inclusao;
    if Assigned(ADataSet.Params.FindParam('STATUS'             )) then   ADataSet.ParamByName('STATUS').AsString             := Copy(Fstatus        , 1, 10);
    if Assigned(ADataSet.Params.FindParam('DAV_ORIGEM'         )) then   ADataSet.ParamByName('DAV_ORIGEM').AsInteger        := Fdav_origem;
    if Assigned(ADataSet.Params.FindParam('TP_DESCACRES'       )) then   ADataSet.ParamByName('TP_DESCACRES').AsString       := Copy(Ftp_descacres  , 1, 10);
    if Assigned(ADataSet.Params.FindParam('NAT_DESCACRES'      )) then   ADataSet.ParamByName('NAT_DESCACRES').AsString      := Copy(Fnat_descacres , 1, 10);
    if Assigned(ADataSet.Params.FindParam('VALOR_DESCACRES'    )) then   ADataSet.ParamByName('VALOR_DESCACRES').AsFloat     := Fvalor_descacres;
    if Assigned(ADataSet.Params.FindParam('COD_NSERIE'         )) then   ADataSet.ParamByName('COD_NSERIE').AsInteger        := Fcod_nserie;
    if Assigned(ADataSet.Params.FindParam('COD_NF'             )) then   ADataSet.ParamByName('COD_NF').AsInteger            := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('NITEM_NF'           )) then   ADataSet.ParamByName('NITEM_NF').AsInteger          := Fnitem_nf;
    if Assigned(ADataSet.Params.FindParam('TABPRATICADA'       )) then   ADataSet.ParamByName('TABPRATICADA').AsString       := Copy(Ftabpraticada  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('QUANT_ITEM_DEV'     )) then   ADataSet.ParamByName('QUANT_ITEM_DEV').AsFloat      := Fquant_item_dev;
    if Assigned(ADataSet.Params.FindParam('TIPV'               )) then   ADataSet.ParamByName('TIPV').AsString               := Copy(Ftipv          , 1, 1);
    if Assigned(ADataSet.Params.FindParam('MD5'                )) then   ADataSet.ParamByName('MD5').AsString                := Copy(Fmd5           , 1, 256);
    if Assigned(ADataSet.Params.FindParam('COD_PEDIDO'         )) then   ADataSet.ParamByName('COD_PEDIDO').AsInteger        := Fcod_pedido;
    if Assigned(ADataSet.Params.FindParam('COD_ALMOXARIFADO'   )) then   ADataSet.ParamByName('COD_ALMOXARIFADO').AsInteger  := Fcod_almoxarifado;
    if Assigned(ADataSet.Params.FindParam('NPEDORIGINADO'      )) then   ADataSet.ParamByName('NPEDORIGINADO').AsInteger     := Fnpedoriginado;
    if Assigned(ADataSet.Params.FindParam('TIPOORIGINADO'      )) then   ADataSet.ParamByName('TIPOORIGINADO').AsString      := Copy(Ftipooriginado , 1, 3);
    if Assigned(ADataSet.Params.FindParam('MAX_DESC_TAB'       )) then   ADataSet.ParamByName('MAX_DESC_TAB').AsFloat        := Fmax_desc_tab;
    if Assigned(ADataSet.Params.FindParam('NITEM_PEDIDO'       )) then   ADataSet.ParamByName('NITEM_PEDIDO').AsInteger      := Fnitem_pedido;
    if Assigned(ADataSet.Params.FindParam('RAT_DESC_AVISTA'    )) then   ADataSet.ParamByName('RAT_DESC_AVISTA').AsFloat     := Frat_desc_avista;
    if Assigned(ADataSet.Params.FindParam('REFAZER_COMISS'     )) then   ADataSet.ParamByName('REFAZER_COMISS').AsString     := Copy(Frefazer_comiss, 1, 1);
    if Assigned(ADataSet.Params.FindParam('NPED_ORIGEM'        )) then   ADataSet.ParamByName('NPED_ORIGEM').AsInteger       := Fnped_origem;
    if Assigned(ADataSet.Params.FindParam('TIPO_ORIGEM'        )) then   ADataSet.ParamByName('TIPO_ORIGEM').AsString        := Copy(Ftipo_origem   , 1, 3);
    if Assigned(ADataSet.Params.FindParam('XPED_COMPRA'        )) then   ADataSet.ParamByName('XPED_COMPRA').AsString        := Copy(Fxped_compra   , 1, 15);
    if Assigned(ADataSet.Params.FindParam('NITEMPED_COMPRA'    )) then   ADataSet.ParamByName('NITEMPED_COMPRA').AsInteger   := Fnitemped_compra;
    if Assigned(ADataSet.Params.FindParam('NPED_CONF'          )) then   ADataSet.ParamByName('NPED_CONF').AsInteger         := Fnped_conf;
    if Assigned(ADataSet.Params.FindParam('NITEM_CONF'         )) then   ADataSet.ParamByName('NITEM_CONF').AsInteger        := Fnitem_conf;
    if Assigned(ADataSet.Params.FindParam('TIPO_CONF'          )) then   ADataSet.ParamByName('TIPO_CONF').AsString          := Copy(Ftipo_conf     , 1, 3);
    if Assigned(ADataSet.Params.FindParam('UNIDADE'            )) then   ADataSet.ParamByName('UNIDADE').AsString            := Copy(Funidade       , 1, 3);
    if Assigned(ADataSet.Params.FindParam('SIT_TRIB'           )) then   ADataSet.ParamByName('SIT_TRIB').AsString           := Copy(Fsit_trib      , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ICM_PROD'           )) then   ADataSet.ParamByName('ICM_PROD').AsFloat            := Ficm_prod;
    if Assigned(ADataSet.Params.FindParam('CSDECQTDE'          )) then   ADataSet.ParamByName('CSDECQTDE').AsString          := Copy(Fcsdecqtde     , 1, 1);
    if Assigned(ADataSet.Params.FindParam('CSDECVLUNT'         )) then   ADataSet.ParamByName('CSDECVLUNT').AsString         := Copy(Fcsdecvlunt    , 1, 1);
    if Assigned(ADataSet.Params.FindParam('NPREVENDA'          )) then   ADataSet.ParamByName('NPREVENDA').AsInteger         := Fnprevenda;
    if Assigned(ADataSet.Params.FindParam('VL_DEBCRED'         )) then   ADataSet.ParamByName('VL_DEBCRED').AsFloat          := Fvl_debcred;
    if Assigned(ADataSet.Params.FindParam('VL_DESP_NF'         )) then   ADataSet.ParamByName('VL_DESP_NF').AsFloat          := Fvl_desp_nf;
    if Assigned(ADataSet.Params.FindParam('NITEM_SERV'         )) then   ADataSet.ParamByName('NITEM_SERV').AsInteger        := Fnitem_serv;
    if Assigned(ADataSet.Params.FindParam('COD_VENDEDOR1'      )) then   ADataSet.ParamByName('COD_VENDEDOR1').AsInteger     := Fcod_vendedor1;
    if Assigned(ADataSet.Params.FindParam('PRECOPORQTDE'       )) then   ADataSet.ParamByName('PRECOPORQTDE').AsString       := Copy(Fprecoporqtde  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('N_NFD'              )) then   ADataSet.ParamByName('N_NFD').AsInteger             := Fn_nfd;
    if Assigned(ADataSet.Params.FindParam('SERIED'             )) then   ADataSet.ParamByName('SERIED').AsString             := Copy(Fseried        , 1, 5);
    if Assigned(ADataSet.Params.FindParam('VL_COMISSAO_VEND'   )) then   ADataSet.ParamByName('VL_COMISSAO_VEND').AsFloat    := Fvl_comissao_vend;
    if Assigned(ADataSet.Params.FindParam('PERC_COMISSAO_VEND' )) then   ADataSet.ParamByName('PERC_COMISSAO_VEND').AsFloat  := Fperc_comissao_vend;
    if Assigned(ADataSet.Params.FindParam('VL_COMISSAO_VEND1'  )) then   ADataSet.ParamByName('VL_COMISSAO_VEND1').AsFloat   := Fvl_comissao_vend1;
    if Assigned(ADataSet.Params.FindParam('PERC_COMISSAO_VEND1')) then   ADataSet.ParamByName('PERC_COMISSAO_VEND1').AsFloat := Fperc_comissao_vend1;
    if Assigned(ADataSet.Params.FindParam('NF_DC_DESPNF'       )) then   ADataSet.ParamByName('NF_DC_DESPNF').AsFloat        := Fnf_dc_despnf;
    if Assigned(ADataSet.Params.FindParam('NF_AC_DES_EMB'      )) then   ADataSet.ParamByName('NF_AC_DES_EMB').AsFloat       := Fnf_ac_des_emb;
  end;
end;

procedure TPedvenda_prod_class.Setnped(const Value: Integer);
begin
  Fnped := Value;
  ChangeField('NPED', Fnped);
end;

procedure TPedvenda_prod_class.Settipo(const Value: string);
begin
  Ftipo := Value;
  ChangeField('TIPO', strq(Ftipo, 3));
end;

procedure TPedvenda_prod_class.Setgrupo_prod(const Value: Integer);
begin
  Fgrupo_prod := Value;
  ChangeField('GRUPO_PROD', Fgrupo_prod);
end;

procedure TPedvenda_prod_class.Setcod_prod(const Value: string);
begin
  Fcod_prod := Value;
  ChangeField('COD_PROD', strq(Fcod_prod, 6));
end;

procedure TPedvenda_prod_class.Setnitem(const Value: Integer);
begin
  Fnitem := Value;
  ChangeField('NITEM', Fnitem);
end;

procedure TPedvenda_prod_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TPedvenda_prod_class.Setcod_grade(const Value: Integer);
begin
  Fcod_grade := Value;
  ChangeField('COD_GRADE', Fcod_grade);
end;

procedure TPedvenda_prod_class.Setcodigo_nop(const Value: Double);
begin
  Fcodigo_nop := Value;
  ChangeField_f('CODIGO_NOP', Fcodigo_nop);
end;

procedure TPedvenda_prod_class.Setnum_fab_prod(const Value: string);
begin
  Fnum_fab_prod := Value;
  ChangeField('NUM_FAB_PROD', strq(Fnum_fab_prod, 20));
end;

procedure TPedvenda_prod_class.Setdescr_prod_ped(const Value: string);
begin
  Fdescr_prod_ped := Value;
  ChangeField('DESCR_PROD_PED', strq(Fdescr_prod_ped, 75));
end;

procedure TPedvenda_prod_class.Setquant_ped_item(const Value: Double);
begin
  Fquant_ped_item := Value;
  ChangeField_f('QUANT_PED_ITEM', Fquant_ped_item);
end;

procedure TPedvenda_prod_class.Setvlun_ped_item(const Value: Double);
begin
  Fvlun_ped_item := Value;
  ChangeField_f('VLUN_PED_ITEM', Fvlun_ped_item);
end;

procedure TPedvenda_prod_class.Setvltot_ped_item(const Value: Double);
begin
  Fvltot_ped_item := Value;
  ChangeField_f('VLTOT_PED_ITEM', Fvltot_ped_item);
end;

procedure TPedvenda_prod_class.Setvlun_orig(const Value: Double);
begin
  Fvlun_orig := Value;
  ChangeField_f('VLUN_ORIG', Fvlun_orig);
end;

procedure TPedvenda_prod_class.Setvlun_ped_nf(const Value: Double);
begin
  Fvlun_ped_nf := Value;
  ChangeField_f('VLUN_PED_NF', Fvlun_ped_nf);
end;

procedure TPedvenda_prod_class.Setvltot_ped_nf(const Value: Double);
begin
  Fvltot_ped_nf := Value;
  ChangeField_f('VLTOT_PED_NF', Fvltot_ped_nf);
end;

procedure TPedvenda_prod_class.Setrateio_desc(const Value: Double);
begin
  Frateio_desc := Value;
  ChangeField_f('RATEIO_DESC', Frateio_desc);
end;

procedure TPedvenda_prod_class.Setrateio_acresc(const Value: Double);
begin
  Frateio_acresc := Value;
  ChangeField_f('RATEIO_ACRESC', Frateio_acresc);
end;

procedure TPedvenda_prod_class.Setn_nf(const Value: Integer);
begin
  Fn_nf := Value;
  ChangeField('N_NF', Fn_nf);
end;

procedure TPedvenda_prod_class.Setserie(const Value: string);
begin
  Fserie := Value;
  ChangeField('SERIE', strq(Fserie, 5));
end;

procedure TPedvenda_prod_class.Setaliquota_cp(const Value: string);
begin
  Faliquota_cp := Value;
  ChangeField('ALIQUOTA_CP', strq(Faliquota_cp, 4));
end;

procedure TPedvenda_prod_class.Setratdsas(const Value: Double);
begin
  Fratdsas := Value;
  ChangeField_f('RATDSAS', Fratdsas);
end;

procedure TPedvenda_prod_class.Setcomiss_prod(const Value: Double);
begin
  Fcomiss_prod := Value;
  ChangeField_f('COMISS_PROD', Fcomiss_prod);
end;

procedure TPedvenda_prod_class.Setcomiss_prod_ger(const Value: Double);
begin
  Fcomiss_prod_ger := Value;
  ChangeField_f('COMISS_PROD_GER', Fcomiss_prod_ger);
end;

procedure TPedvenda_prod_class.Setano_fab_prod(const Value: Integer);
begin
  Fano_fab_prod := Value;
  ChangeField('ANO_FAB_PROD', Fano_fab_prod);
end;

procedure TPedvenda_prod_class.Setn_serie_prod(const Value: string);
begin
  Fn_serie_prod := Value;
  ChangeField('N_SERIE_PROD', strq(Fn_serie_prod, 15));
end;

procedure TPedvenda_prod_class.Setmodelo(const Value: string);
begin
  Fmodelo := Value;
  ChangeField('MODELO', strq(Fmodelo, 15));
end;

procedure TPedvenda_prod_class.Setcor(const Value: string);
begin
  Fcor := Value;
  ChangeField('COR', strq(Fcor, 10));
end;

procedure TPedvenda_prod_class.Setpcust_c(const Value: Double);
begin
  Fpcust_c := Value;
  ChangeField_f('PCUST_C', Fpcust_c);
end;

procedure TPedvenda_prod_class.Setpcust_r(const Value: Double);
begin
  Fpcust_r := Value;
  ChangeField_f('PCUST_R', Fpcust_r);
end;

procedure TPedvenda_prod_class.Setpcust_mc(const Value: Double);
begin
  Fpcust_mc := Value;
  ChangeField_f('PCUST_MC', Fpcust_mc);
end;

procedure TPedvenda_prod_class.Setpcust_mr(const Value: Double);
begin
  Fpcust_mr := Value;
  ChangeField_f('PCUST_MR', Fpcust_mr);
end;

procedure TPedvenda_prod_class.Settp_nf_ped(const Value: string);
begin
  Ftp_nf_ped := Value;
  ChangeField('TP_NF_PED', strq(Ftp_nf_ped, 1));
end;

procedure TPedvenda_prod_class.Setsit_atd(const Value: string);
begin
  Fsit_atd := Value;
  ChangeField('SIT_ATD', strq(Fsit_atd, 2));
end;

procedure TPedvenda_prod_class.Setsel(const Value: string);
begin
  Fsel := Value;
  ChangeField('SEL', strq(Fsel, 1));
end;

procedure TPedvenda_prod_class.Setdata_atd(const Value: TDateTime);
begin
  Fdata_atd := Value;
  ChangeField_dt('DATA_ATD', Fdata_atd);
end;

procedure TPedvenda_prod_class.Sethora_atd(const Value: string);
begin
  Fhora_atd := Value;
  ChangeField('HORA_ATD', strq(Fhora_atd, 8));
end;

procedure TPedvenda_prod_class.Setcodigo_kit(const Value: Integer);
begin
  Fcodigo_kit := Value;
  ChangeField('CODIGO_KIT', Fcodigo_kit);
end;

procedure TPedvenda_prod_class.Seticmant_sub(const Value: Double);
begin
  Ficmant_sub := Value;
  ChangeField_f('ICMANT_SUB', Ficmant_sub);
end;

procedure TPedvenda_prod_class.Setcod_seg_serv(const Value: Integer);
begin
  Fcod_seg_serv := Value;
  ChangeField('COD_SEG_SERV', Fcod_seg_serv);
end;

procedure TPedvenda_prod_class.Setativo(const Value: Integer);
begin
  Fativo := Value;
  ChangeField('ATIVO', Fativo);
end;

procedure TPedvenda_prod_class.Setcol_cod_vendedor(const Value: Integer);
begin
  Fcol_cod_vendedor := Value;
  ChangeField('COL_COD_VENDEDOR', Fcol_cod_vendedor);
end;

procedure TPedvenda_prod_class.Setdesc_item(const Value: Double);
begin
  Fdesc_item := Value;
  ChangeField_f('DESC_ITEM', Fdesc_item);
end;

procedure TPedvenda_prod_class.Setacresc_item(const Value: Double);
begin
  Facresc_item := Value;
  ChangeField_f('ACRESC_ITEM', Facresc_item);
end;

procedure TPedvenda_prod_class.Setcod_vendedor(const Value: Integer);
begin
  Fcod_vendedor := Value;
  ChangeField('COD_VENDEDOR', Fcod_vendedor);
end;

procedure TPedvenda_prod_class.Setdata_transf(const Value: TDateTime);
begin
  Fdata_transf := Value;
  ChangeField_dt('DATA_TRANSF', Fdata_transf);
end;

procedure TPedvenda_prod_class.Setdata_dev(const Value: TDateTime);
begin
  Fdata_dev := Value;
  ChangeField_dt('DATA_DEV', Fdata_dev);
end;

procedure TPedvenda_prod_class.Setnome_vend(const Value: string);
begin
  Fnome_vend := Value;
  ChangeField('NOME_VEND', strq(Fnome_vend, 35));
end;

procedure TPedvenda_prod_class.Setnome_vend1(const Value: string);
begin
  Fnome_vend1 := Value;
  ChangeField('NOME_VEND1', strq(Fnome_vend1, 35));
end;

procedure TPedvenda_prod_class.Setqt_dev(const Value: Double);
begin
  Fqt_dev := Value;
  ChangeField_f('QT_DEV', Fqt_dev);
end;

procedure TPedvenda_prod_class.Setvlo_unitario(const Value: Double);
begin
  Fvlo_unitario := Value;
  ChangeField_f('VLO_UNITARIO', Fvlo_unitario);
end;

procedure TPedvenda_prod_class.Setdata_inclusao(const Value: TDateTime);
begin
  Fdata_inclusao := Value;
  ChangeField_dt('DATA_INCLUSAO', Fdata_inclusao);
end;

procedure TPedvenda_prod_class.Setstatus(const Value: string);
begin
  Fstatus := Value;
  ChangeField('STATUS', strq(Fstatus, 10));
end;

procedure TPedvenda_prod_class.Setdav_origem(const Value: Integer);
begin
  Fdav_origem := Value;
  ChangeField('DAV_ORIGEM', Fdav_origem);
end;

procedure TPedvenda_prod_class.Settp_descacres(const Value: string);
begin
  Ftp_descacres := Value;
  ChangeField('TP_DESCACRES', strq(Ftp_descacres, 10));
end;

procedure TPedvenda_prod_class.Setnat_descacres(const Value: string);
begin
  Fnat_descacres := Value;
  ChangeField('NAT_DESCACRES', strq(Fnat_descacres, 10));
end;

procedure TPedvenda_prod_class.Setvalor_descacres(const Value: Double);
begin
  Fvalor_descacres := Value;
  ChangeField_f('VALOR_DESCACRES', Fvalor_descacres);
end;

procedure TPedvenda_prod_class.Setcod_nserie(const Value: Integer);
begin
  Fcod_nserie := Value;
  ChangeField('COD_NSERIE', Fcod_nserie);
end;

procedure TPedvenda_prod_class.Setcod_nf(const Value: Integer);
begin
  Fcod_nf := Value;
  ChangeField('COD_NF', Fcod_nf);
end;

procedure TPedvenda_prod_class.Setnitem_nf(const Value: Integer);
begin
  Fnitem_nf := Value;
  ChangeField('NITEM_NF', Fnitem_nf);
end;

procedure TPedvenda_prod_class.Settabpraticada(const Value: string);
begin
  Ftabpraticada := Value;
  ChangeField('TABPRATICADA', strq(Ftabpraticada, 1));
end;

procedure TPedvenda_prod_class.Setquant_item_dev(const Value: Double);
begin
  Fquant_item_dev := Value;
  ChangeField_f('QUANT_ITEM_DEV', Fquant_item_dev);
end;

procedure TPedvenda_prod_class.Settipv(const Value: string);
begin
  Ftipv := Value;
  ChangeField('TIPV', strq(Ftipv, 1));
end;

procedure TPedvenda_prod_class.Setmd5(const Value: string);
begin
  Fmd5 := Value;
  ChangeField('MD5', strq(Fmd5, 256));
end;

procedure TPedvenda_prod_class.Setcod_pedido(const Value: Integer);
begin
  Fcod_pedido := Value;
  ChangeField('COD_PEDIDO', Fcod_pedido);
end;

procedure TPedvenda_prod_class.Setcod_almoxarifado(const Value: Integer);
begin
  Fcod_almoxarifado := Value;
  ChangeField('COD_ALMOXARIFADO', Fcod_almoxarifado);
end;

procedure TPedvenda_prod_class.Setnpedoriginado(const Value: Integer);
begin
  Fnpedoriginado := Value;
  ChangeField('NPEDORIGINADO', Fnpedoriginado);
end;

procedure TPedvenda_prod_class.Settipooriginado(const Value: string);
begin
  Ftipooriginado := Value;
  ChangeField('TIPOORIGINADO', strq(Ftipooriginado, 3));
end;

procedure TPedvenda_prod_class.Setmax_desc_tab(const Value: Double);
begin
  Fmax_desc_tab := Value;
  ChangeField_f('MAX_DESC_TAB', Fmax_desc_tab);
end;

procedure TPedvenda_prod_class.Setnitem_pedido(const Value: Integer);
begin
  Fnitem_pedido := Value;
  ChangeField('NITEM_PEDIDO', Fnitem_pedido);
end;

procedure TPedvenda_prod_class.Setrat_desc_avista(const Value: Double);
begin
  Frat_desc_avista := Value;
  ChangeField_f('RAT_DESC_AVISTA', Frat_desc_avista);
end;

procedure TPedvenda_prod_class.Setrefazer_comiss(const Value: string);
begin
  Frefazer_comiss := Value;
  ChangeField('REFAZER_COMISS', strq(Frefazer_comiss, 1));
end;

procedure TPedvenda_prod_class.Setnped_origem(const Value: Integer);
begin
  Fnped_origem := Value;
  ChangeField('NPED_ORIGEM', Fnped_origem);
end;

procedure TPedvenda_prod_class.Settipo_origem(const Value: string);
begin
  Ftipo_origem := Value;
  ChangeField('TIPO_ORIGEM', strq(Ftipo_origem, 3));
end;

procedure TPedvenda_prod_class.Setxped_compra(const Value: string);
begin
  Fxped_compra := Value;
  ChangeField('XPED_COMPRA', strq(Fxped_compra, 15));
end;

procedure TPedvenda_prod_class.Setnitemped_compra(const Value: Integer);
begin
  Fnitemped_compra := Value;
  ChangeField('NITEMPED_COMPRA', Fnitemped_compra);
end;

procedure TPedvenda_prod_class.Setnped_conf(const Value: Integer);
begin
  Fnped_conf := Value;
  ChangeField('NPED_CONF', Fnped_conf);
end;

procedure TPedvenda_prod_class.Setnitem_conf(const Value: Integer);
begin
  Fnitem_conf := Value;
  ChangeField('NITEM_CONF', Fnitem_conf);
end;

procedure TPedvenda_prod_class.Settipo_conf(const Value: string);
begin
  Ftipo_conf := Value;
  ChangeField('TIPO_CONF', strq(Ftipo_conf, 3));
end;

procedure TPedvenda_prod_class.Setunidade(const Value: string);
begin
  Funidade := Value;
  ChangeField('UNIDADE', strq(Funidade, 3));
end;

procedure TPedvenda_prod_class.Setsit_trib(const Value: string);
begin
  Fsit_trib := Value;
  ChangeField('SIT_TRIB', strq(Fsit_trib, 1));
end;

procedure TPedvenda_prod_class.Seticm_prod(const Value: Double);
begin
  Ficm_prod := Value;
  ChangeField_f('ICM_PROD', Ficm_prod);
end;

procedure TPedvenda_prod_class.Setcsdecqtde(const Value: string);
begin
  Fcsdecqtde := Value;
  ChangeField('CSDECQTDE', strq(Fcsdecqtde, 1));
end;

procedure TPedvenda_prod_class.Setcsdecvlunt(const Value: string);
begin
  Fcsdecvlunt := Value;
  ChangeField('CSDECVLUNT', strq(Fcsdecvlunt, 1));
end;

procedure TPedvenda_prod_class.Setnprevenda(const Value: Integer);
begin
  Fnprevenda := Value;
  ChangeField('NPREVENDA', Fnprevenda);
end;

procedure TPedvenda_prod_class.Setvl_debcred(const Value: Double);
begin
  Fvl_debcred := Value;
  ChangeField_f('VL_DEBCRED', Fvl_debcred);
end;

procedure TPedvenda_prod_class.Setvl_desp_nf(const Value: Double);
begin
  Fvl_desp_nf := Value;
  ChangeField_f('VL_DESP_NF', Fvl_desp_nf);
end;

procedure TPedvenda_prod_class.Setnitem_serv(const Value: Integer);
begin
  Fnitem_serv := Value;
  ChangeField('NITEM_SERV', Fnitem_serv);
end;

procedure TPedvenda_prod_class.Setcod_vendedor1(const Value: Integer);
begin
  Fcod_vendedor1 := Value;
  ChangeField('COD_VENDEDOR1', Fcod_vendedor1);
end;

procedure TPedvenda_prod_class.Setprecoporqtde(const Value: string);
begin
  Fprecoporqtde := Value;
  ChangeField('PRECOPORQTDE', strq(Fprecoporqtde, 1));
end;

procedure TPedvenda_prod_class.Setn_nfd(const Value: Integer);
begin
  Fn_nfd := Value;
  ChangeField('N_NFD', Fn_nfd);
end;

procedure TPedvenda_prod_class.Setseried(const Value: string);
begin
  Fseried := Value;
  ChangeField('SERIED', strq(Fseried, 5));
end;

procedure TPedvenda_prod_class.Setvl_comissao_vend(const Value: Double);
begin
  Fvl_comissao_vend := Value;
  ChangeField_f('VL_COMISSAO_VEND', Fvl_comissao_vend);
end;

procedure TPedvenda_prod_class.Setperc_comissao_vend(const Value: Double);
begin
  Fperc_comissao_vend := Value;
  ChangeField_f('PERC_COMISSAO_VEND', Fperc_comissao_vend);
end;

procedure TPedvenda_prod_class.Setvl_comissao_vend1(const Value: Double);
begin
  Fvl_comissao_vend1 := Value;
  ChangeField_f('VL_COMISSAO_VEND1', Fvl_comissao_vend1);
end;

procedure TPedvenda_prod_class.Setperc_comissao_vend1(const Value: Double);
begin
  Fperc_comissao_vend1 := Value;
  ChangeField_f('PERC_COMISSAO_VEND1', Fperc_comissao_vend1);
end;

procedure TPedvenda_prod_class.Setnf_dc_despnf(const Value: Double);
begin
  Fnf_dc_despnf := Value;
  ChangeField_f('NF_DC_DESPNF', Fnf_dc_despnf);
end;

procedure TPedvenda_prod_class.Setnf_ac_des_emb(const Value: Double);
begin
  Fnf_ac_des_emb := Value;
  ChangeField_f('NF_AC_DES_EMB', Fnf_ac_des_emb);
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
