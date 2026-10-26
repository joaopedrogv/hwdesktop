unit pedvenda_serv_class;

interface

uses
  Contnrs,
  DB;

type
  TPedvenda_serv_class = class(TObject)
  private
    Fnped            : Integer;
    Ftipo            : string;
    Fcod_servico     : Integer;
    Fnitem           : Integer;
    Fcod_empresa     : Integer;
    Fcodigo_nop      : Double;
    Fcod_vendedor    : Integer;
    Fquant_serv_ped  : Double;
    Fvalor_un_serv   : Double;
    Fvalor_tot_serv  : Double;
    Fvlun_orig       : Double;
    Fprc_int_serv    : Double;
    Frateio_desc     : Double;
    Frateio_acresc   : Double;
    Fn_nf            : Int64;
    Fserie           : string;
    Fdesc_serv_ped   : string;
    Fcod_vendedor1   : Integer;
    Fnome_vend       : string;
    Fnome_vend1      : string;
    Fativo           : Integer;
    Ftmo_serv        : Double;
    Fsubgservico     : Integer;
    Fdesc_item       : Double;
    Facresc_item     : Double;
    Fcod_rps         : Integer;
    Fiss_retido      : Integer;
    Fnfs_servico     : string;
    Fcnae_serv       : Integer;
    Faliq_iss        : Double;
    Femissao_rps     : TDateTime;
    Femissao_nfse    : TDateTime;
    Fnprotnfse       : string;
    Fstatus_nfse     : string;
    Flote_nfse       : Integer;
    Fresp_ws_nfse    : string;
    Fcodigo_verwsnfse: string;
    Foutras_infnfse  : string;
    Fdesc_servico_rps: string;
    Fmodelo_nfse     : string;
    Fcnae_respnfse   : string;
    Fvalor_nfse      : Double;
    Faliq_pis        : Double;
    Faliq_cofins     : Double;
    Fcst_pis         : string;
    Fcst_cofins      : string;
    Fdata_inclusao   : TDateTime;
    Fstatus          : string;
    Fdav_origem      : Integer;
    Firrf_servico    : Double;
    Fbase_pis        : Double;
    Fbase_cofins     : Double;
    Fvalor_pis       : Double;
    Fvalor_cofins    : Double;
    Fcod_agenda      : Integer;
    Fmd5             : string;
    Fnpedoriginado   : Integer;
    Ftipooriginado   : string;
    Fnped_origem     : Integer;
    Ftipo_origem     : string;
    Fn_comando       : Integer;
    Fissret_servico  : Double;
    Fctiss           : string;
    Fvalor_b_nfse    : Double;
    Fcsdecvlunt      : string;
    Fnprevenda       : Integer;
    Fsit_trib        : string;
    Fvl_desp_nf      : Double;
    Fnitem_serv      : Integer;
    Fpisrf_servico   : Double;
    Fcofinsrf_servico: Double;
    Fcsslrf_servico  : Double;
    Fcod_contrato    : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property nped            : Integer   read Fnped             write Fnped;
    property tipo            : string    read Ftipo             write Ftipo;
    property cod_servico     : Integer   read Fcod_servico      write Fcod_servico;
    property nitem           : Integer   read Fnitem            write Fnitem;
    property cod_empresa     : Integer   read Fcod_empresa      write Fcod_empresa;
    property codigo_nop      : Double    read Fcodigo_nop       write Fcodigo_nop;
    property cod_vendedor    : Integer   read Fcod_vendedor     write Fcod_vendedor;
    property quant_serv_ped  : Double    read Fquant_serv_ped   write Fquant_serv_ped;
    property valor_un_serv   : Double    read Fvalor_un_serv    write Fvalor_un_serv;
    property valor_tot_serv  : Double    read Fvalor_tot_serv   write Fvalor_tot_serv;
    property vlun_orig       : Double    read Fvlun_orig        write Fvlun_orig;
    property prc_int_serv    : Double    read Fprc_int_serv     write Fprc_int_serv;
    property rateio_desc     : Double    read Frateio_desc      write Frateio_desc;
    property rateio_acresc   : Double    read Frateio_acresc    write Frateio_acresc;
    property n_nf            : Int64     read Fn_nf             write Fn_nf;
    property serie           : string    read Fserie            write Fserie;
    property desc_serv_ped   : string    read Fdesc_serv_ped    write Fdesc_serv_ped;
    property cod_vendedor1   : Integer   read Fcod_vendedor1    write Fcod_vendedor1;
    property nome_vend       : string    read Fnome_vend        write Fnome_vend;
    property nome_vend1      : string    read Fnome_vend1       write Fnome_vend1;
    property ativo           : Integer   read Fativo            write Fativo;
    property tmo_serv        : Double    read Ftmo_serv         write Ftmo_serv;
    property subgservico     : Integer   read Fsubgservico      write Fsubgservico;
    property desc_item       : Double    read Fdesc_item        write Fdesc_item;
    property acresc_item     : Double    read Facresc_item      write Facresc_item;
    property cod_rps         : Integer   read Fcod_rps          write Fcod_rps;
    property iss_retido      : Integer   read Fiss_retido       write Fiss_retido;
    property nfs_servico     : string    read Fnfs_servico      write Fnfs_servico;
    property cnae_serv       : Integer   read Fcnae_serv        write Fcnae_serv;
    property aliq_iss        : Double    read Faliq_iss         write Faliq_iss;
    property emissao_rps     : TDateTime read Femissao_rps      write Femissao_rps;
    property emissao_nfse    : TDateTime read Femissao_nfse     write Femissao_nfse;
    property nprotnfse       : string    read Fnprotnfse        write Fnprotnfse;
    property status_nfse     : string    read Fstatus_nfse      write Fstatus_nfse;
    property lote_nfse       : Integer   read Flote_nfse        write Flote_nfse;
    property resp_ws_nfse    : string    read Fresp_ws_nfse     write Fresp_ws_nfse;
    property codigo_verwsnfse: string    read Fcodigo_verwsnfse write Fcodigo_verwsnfse;
    property outras_infnfse  : string    read Foutras_infnfse   write Foutras_infnfse;
    property desc_servico_rps: string    read Fdesc_servico_rps write Fdesc_servico_rps;
    property modelo_nfse     : string    read Fmodelo_nfse      write Fmodelo_nfse;
    property cnae_respnfse   : string    read Fcnae_respnfse    write Fcnae_respnfse;
    property valor_nfse      : Double    read Fvalor_nfse       write Fvalor_nfse;
    property aliq_pis        : Double    read Faliq_pis         write Faliq_pis;
    property aliq_cofins     : Double    read Faliq_cofins      write Faliq_cofins;
    property cst_pis         : string    read Fcst_pis          write Fcst_pis;
    property cst_cofins      : string    read Fcst_cofins       write Fcst_cofins;
    property data_inclusao   : TDateTime read Fdata_inclusao    write Fdata_inclusao;
    property status          : string    read Fstatus           write Fstatus;
    property dav_origem      : Integer   read Fdav_origem       write Fdav_origem;
    property irrf_servico    : Double    read Firrf_servico     write Firrf_servico;
    property base_pis        : Double    read Fbase_pis         write Fbase_pis;
    property base_cofins     : Double    read Fbase_cofins      write Fbase_cofins;
    property valor_pis       : Double    read Fvalor_pis        write Fvalor_pis;
    property valor_cofins    : Double    read Fvalor_cofins     write Fvalor_cofins;
    property cod_agenda      : Integer   read Fcod_agenda       write Fcod_agenda;
    property md5             : string    read Fmd5              write Fmd5;
    property npedoriginado   : Integer   read Fnpedoriginado    write Fnpedoriginado;
    property tipooriginado   : string    read Ftipooriginado    write Ftipooriginado;
    property nped_origem     : Integer   read Fnped_origem      write Fnped_origem;
    property tipo_origem     : string    read Ftipo_origem      write Ftipo_origem;
    property n_comando       : Integer   read Fn_comando        write Fn_comando;
    property issret_servico  : Double    read Fissret_servico   write Fissret_servico;
    property ctiss           : string    read Fctiss            write Fctiss;
    property valor_b_nfse    : Double    read Fvalor_b_nfse     write Fvalor_b_nfse;
    property csdecvlunt      : string    read Fcsdecvlunt       write Fcsdecvlunt;
    property nprevenda       : Integer   read Fnprevenda        write Fnprevenda;
    property sit_trib        : string    read Fsit_trib         write Fsit_trib;
    property vl_desp_nf      : Double    read Fvl_desp_nf       write Fvl_desp_nf;
    property nitem_serv      : Integer   read Fnitem_serv       write Fnitem_serv;
    property pisrf_servico   : Double    read Fpisrf_servico    write Fpisrf_servico;
    property cofinsrf_servico: Double    read Fcofinsrf_servico write Fcofinsrf_servico;
    property csslrf_servico  : Double    read Fcsslrf_servico   write Fcsslrf_servico;
    property cod_contrato    : Integer   read Fcod_contrato     write Fcod_contrato;
  end;

  TPedvenda_serv_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TPedvenda_serv_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_serv_class);
  public
    function New: TPedvenda_serv_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TPedvenda_serv_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TPedvenda_serv_class }

constructor TPedvenda_serv_class.Create;
begin
  Fativo := 1;
end;

destructor TPedvenda_serv_class.Destroy;
begin
  inherited;
end;

class function TPedvenda_serv_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@nped, @tipo, @cod_servico, @nitem, @cod_empresa, @codigo_nop, @cod_vendedor, @quant_serv_ped,' +
            ' @valor_un_serv, @valor_tot_serv, @vlun_orig, @prc_int_serv, @rateio_desc, @rateio_acresc, @n_nf, @serie,' +
            ' @desc_serv_ped, @cod_vendedor1, @nome_vend, @nome_vend1, @ativo, @tmo_serv, @subgservico, @desc_item,' +
            ' @acresc_item, @cod_rps, @iss_retido, @nfs_servico, @cnae_serv, @aliq_iss, @emissao_rps, @emissao_nfse,' +
            ' @nprotnfse, @status_nfse, @lote_nfse, @resp_ws_nfse, @codigo_verwsnfse, @outras_infnfse, @desc_servico_rps,' +
            ' @modelo_nfse, @cnae_respnfse, @valor_nfse, @aliq_pis, @aliq_cofins, @cst_pis, @cst_cofins, @data_inclusao,' +
            ' @status, @dav_origem, @irrf_servico, @base_pis, @base_cofins, @valor_pis, @valor_cofins, @cod_agenda, @md5,' +
            ' @npedoriginado, @tipooriginado, @nped_origem, @tipo_origem, @n_comando, @issret_servico, @ctiss,' +
            ' @valor_b_nfse, @csdecvlunt, @nprevenda, @sit_trib, @vl_desp_nf, @nitem_serv, @pisrf_servico,' +
            ' @cofinsrf_servico, @csslrf_servico, @cod_contrato';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_serv_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fnped             := ADataSet.FieldByName('NPED').AsInteger;
    Ftipo             := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fcod_servico      := ADataSet.FieldByName('COD_SERVICO').AsInteger;
    Fnitem            := ADataSet.FieldByName('NITEM').AsInteger;
    Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcodigo_nop       := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    Fcod_vendedor     := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    Fquant_serv_ped   := ADataSet.FieldByName('QUANT_SERV_PED').AsFloat;
    Fvalor_un_serv    := ADataSet.FieldByName('VALOR_UN_SERV').AsFloat;
    Fvalor_tot_serv   := ADataSet.FieldByName('VALOR_TOT_SERV').AsFloat;
    Fvlun_orig        := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    Fprc_int_serv     := ADataSet.FieldByName('PRC_INT_SERV').AsFloat;
    Frateio_desc      := ADataSet.FieldByName('RATEIO_DESC').AsFloat;
    Frateio_acresc    := ADataSet.FieldByName('RATEIO_ACRESC').AsFloat;
    Fn_nf             := ADataSet.FieldByName('N_NF').AsInteger;
    Fserie            := Trim(ADataSet.FieldByName('SERIE').AsString);
    Fdesc_serv_ped    := Trim(ADataSet.FieldByName('DESC_SERV_PED').AsString);
    Fcod_vendedor1    := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    Fnome_vend        := Trim(ADataSet.FieldByName('NOME_VEND').AsString);
    Fnome_vend1       := Trim(ADataSet.FieldByName('NOME_VEND1').AsString);
    Fativo            := ADataSet.FieldByName('ATIVO').AsInteger;
    Ftmo_serv         := ADataSet.FieldByName('TMO_SERV').AsFloat;
    Fsubgservico      := ADataSet.FieldByName('SUBGSERVICO').AsInteger;
    Fdesc_item        := ADataSet.FieldByName('DESC_ITEM').AsFloat;
    Facresc_item      := ADataSet.FieldByName('ACRESC_ITEM').AsFloat;
    Fcod_rps          := ADataSet.FieldByName('COD_RPS').AsInteger;
    Fiss_retido       := ADataSet.FieldByName('ISS_RETIDO').AsInteger;
    Fnfs_servico      := Trim(ADataSet.FieldByName('NFS_SERVICO').AsString);
    Fcnae_serv        := ADataSet.FieldByName('CNAE_SERV').AsInteger;
    Faliq_iss         := ADataSet.FieldByName('ALIQ_ISS').AsFloat;
    Femissao_rps      := ADataSet.FieldByName('EMISSAO_RPS').AsDateTime;
    Femissao_nfse     := ADataSet.FieldByName('EMISSAO_NFSE').AsDateTime;
    Fnprotnfse        := Trim(ADataSet.FieldByName('NPROTNFSE').AsString);
    Fstatus_nfse      := Trim(ADataSet.FieldByName('STATUS_NFSE').AsString);
    Flote_nfse        := ADataSet.FieldByName('LOTE_NFSE').AsInteger;
    Fresp_ws_nfse     := Trim(ADataSet.FieldByName('RESP_WS_NFSE').AsString);
    Fcodigo_verwsnfse := Trim(ADataSet.FieldByName('CODIGO_VERWSNFSE').AsString);
    Foutras_infnfse   := Trim(ADataSet.FieldByName('OUTRAS_INFNFSE').AsString);
    Fdesc_servico_rps := Trim(ADataSet.FieldByName('DESC_SERVICO_RPS').AsString);
    Fmodelo_nfse      := Trim(ADataSet.FieldByName('MODELO_NFSE').AsString);
    Fcnae_respnfse    := Trim(ADataSet.FieldByName('CNAE_RESPNFSE').AsString);
    Fvalor_nfse       := ADataSet.FieldByName('VALOR_NFSE').AsFloat;
    Faliq_pis         := ADataSet.FieldByName('ALIQ_PIS').AsFloat;
    Faliq_cofins      := ADataSet.FieldByName('ALIQ_COFINS').AsFloat;
    Fcst_pis          := Trim(ADataSet.FieldByName('CST_PIS').AsString);
    Fcst_cofins       := Trim(ADataSet.FieldByName('CST_COFINS').AsString);
    Fdata_inclusao    := ADataSet.FieldByName('DATA_INCLUSAO').AsDateTime;
    Fstatus           := Trim(ADataSet.FieldByName('STATUS').AsString);
    Fdav_origem       := ADataSet.FieldByName('DAV_ORIGEM').AsInteger;
    Firrf_servico     := ADataSet.FieldByName('IRRF_SERVICO').AsFloat;
    Fbase_pis         := ADataSet.FieldByName('BASE_PIS').AsFloat;
    Fbase_cofins      := ADataSet.FieldByName('BASE_COFINS').AsFloat;
    Fvalor_pis        := ADataSet.FieldByName('VALOR_PIS').AsFloat;
    Fvalor_cofins     := ADataSet.FieldByName('VALOR_COFINS').AsFloat;
    Fcod_agenda       := ADataSet.FieldByName('COD_AGENDA').AsInteger;
    Fmd5              := Trim(ADataSet.FieldByName('MD5').AsString);
    Fnpedoriginado    := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    Ftipooriginado    := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
    Fnped_origem      := ADataSet.FieldByName('NPED_ORIGEM').AsInteger;
    Ftipo_origem      := Trim(ADataSet.FieldByName('TIPO_ORIGEM').AsString);
    Fn_comando        := ADataSet.FieldByName('N_COMANDO').AsInteger;
    Fissret_servico   := ADataSet.FieldByName('ISSRET_SERVICO').AsFloat;
    Fctiss            := Trim(ADataSet.FieldByName('CTISS').AsString);
    Fvalor_b_nfse     := ADataSet.FieldByName('VALOR_B_NFSE').AsFloat;
    Fcsdecvlunt       := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    Fnprevenda        := ADataSet.FieldByName('NPREVENDA').AsInteger;
    Fsit_trib         := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    Fvl_desp_nf       := ADataSet.FieldByName('VL_DESP_NF').AsFloat;
    Fnitem_serv       := ADataSet.FieldByName('NITEM_SERV').AsInteger;
    Fpisrf_servico    := ADataSet.FieldByName('PISRF_SERVICO').AsFloat;
    Fcofinsrf_servico := ADataSet.FieldByName('COFINSRF_SERVICO').AsFloat;
    Fcsslrf_servico   := ADataSet.FieldByName('CSSLRF_SERVICO').AsFloat;
    Fcod_contrato     := ADataSet.FieldByName('COD_CONTRATO').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'            )) then Fnped             := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'            )) then Ftipo             := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('COD_SERVICO'     )) then Fcod_servico      := ADataSet.FieldByName('COD_SERVICO').AsInteger;
    if Assigned(ADataSet.FindField('NITEM'           )) then Fnitem            := ADataSet.FieldByName('NITEM').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'     )) then Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('CODIGO_NOP'      )) then Fcodigo_nop       := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    if Assigned(ADataSet.FindField('COD_VENDEDOR'    )) then Fcod_vendedor     := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('QUANT_SERV_PED'  )) then Fquant_serv_ped   := ADataSet.FieldByName('QUANT_SERV_PED').AsFloat;
    if Assigned(ADataSet.FindField('VALOR_UN_SERV'   )) then Fvalor_un_serv    := ADataSet.FieldByName('VALOR_UN_SERV').AsFloat;
    if Assigned(ADataSet.FindField('VALOR_TOT_SERV'  )) then Fvalor_tot_serv   := ADataSet.FieldByName('VALOR_TOT_SERV').AsFloat;
    if Assigned(ADataSet.FindField('VLUN_ORIG'       )) then Fvlun_orig        := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    if Assigned(ADataSet.FindField('PRC_INT_SERV'    )) then Fprc_int_serv     := ADataSet.FieldByName('PRC_INT_SERV').AsFloat;
    if Assigned(ADataSet.FindField('RATEIO_DESC'     )) then Frateio_desc      := ADataSet.FieldByName('RATEIO_DESC').AsFloat;
    if Assigned(ADataSet.FindField('RATEIO_ACRESC'   )) then Frateio_acresc    := ADataSet.FieldByName('RATEIO_ACRESC').AsFloat;
    if Assigned(ADataSet.FindField('N_NF'            )) then Fn_nf             := ADataSet.FieldByName('N_NF').AsInteger;
    if Assigned(ADataSet.FindField('SERIE'           )) then Fserie            := Trim(ADataSet.FieldByName('SERIE').AsString);
    if Assigned(ADataSet.FindField('DESC_SERV_PED'   )) then Fdesc_serv_ped    := Trim(ADataSet.FieldByName('DESC_SERV_PED').AsString);
    if Assigned(ADataSet.FindField('COD_VENDEDOR1'   )) then Fcod_vendedor1    := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    if Assigned(ADataSet.FindField('NOME_VEND'       )) then Fnome_vend        := Trim(ADataSet.FieldByName('NOME_VEND').AsString);
    if Assigned(ADataSet.FindField('NOME_VEND1'      )) then Fnome_vend1       := Trim(ADataSet.FieldByName('NOME_VEND1').AsString);
    if Assigned(ADataSet.FindField('ATIVO'           )) then Fativo            := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('TMO_SERV'        )) then Ftmo_serv         := ADataSet.FieldByName('TMO_SERV').AsFloat;
    if Assigned(ADataSet.FindField('SUBGSERVICO'     )) then Fsubgservico      := ADataSet.FieldByName('SUBGSERVICO').AsInteger;
    if Assigned(ADataSet.FindField('DESC_ITEM'       )) then Fdesc_item        := ADataSet.FieldByName('DESC_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('ACRESC_ITEM'     )) then Facresc_item      := ADataSet.FieldByName('ACRESC_ITEM').AsFloat;
    if Assigned(ADataSet.FindField('COD_RPS'         )) then Fcod_rps          := ADataSet.FieldByName('COD_RPS').AsInteger;
    if Assigned(ADataSet.FindField('ISS_RETIDO'      )) then Fiss_retido       := ADataSet.FieldByName('ISS_RETIDO').AsInteger;
    if Assigned(ADataSet.FindField('NFS_SERVICO'     )) then Fnfs_servico      := Trim(ADataSet.FieldByName('NFS_SERVICO').AsString);
    if Assigned(ADataSet.FindField('CNAE_SERV'       )) then Fcnae_serv        := ADataSet.FieldByName('CNAE_SERV').AsInteger;
    if Assigned(ADataSet.FindField('ALIQ_ISS'        )) then Faliq_iss         := ADataSet.FieldByName('ALIQ_ISS').AsFloat;
    if Assigned(ADataSet.FindField('EMISSAO_RPS'     )) then Femissao_rps      := ADataSet.FieldByName('EMISSAO_RPS').AsDateTime;
    if Assigned(ADataSet.FindField('EMISSAO_NFSE'    )) then Femissao_nfse     := ADataSet.FieldByName('EMISSAO_NFSE').AsDateTime;
    if Assigned(ADataSet.FindField('NPROTNFSE'       )) then Fnprotnfse        := Trim(ADataSet.FieldByName('NPROTNFSE').AsString);
    if Assigned(ADataSet.FindField('STATUS_NFSE'     )) then Fstatus_nfse      := Trim(ADataSet.FieldByName('STATUS_NFSE').AsString);
    if Assigned(ADataSet.FindField('LOTE_NFSE'       )) then Flote_nfse        := ADataSet.FieldByName('LOTE_NFSE').AsInteger;
    if Assigned(ADataSet.FindField('RESP_WS_NFSE'    )) then Fresp_ws_nfse     := Trim(ADataSet.FieldByName('RESP_WS_NFSE').AsString);
    if Assigned(ADataSet.FindField('CODIGO_VERWSNFSE')) then Fcodigo_verwsnfse := Trim(ADataSet.FieldByName('CODIGO_VERWSNFSE').AsString);
    if Assigned(ADataSet.FindField('OUTRAS_INFNFSE'  )) then Foutras_infnfse   := Trim(ADataSet.FieldByName('OUTRAS_INFNFSE').AsString);
    if Assigned(ADataSet.FindField('DESC_SERVICO_RPS')) then Fdesc_servico_rps := Trim(ADataSet.FieldByName('DESC_SERVICO_RPS').AsString);
    if Assigned(ADataSet.FindField('MODELO_NFSE'     )) then Fmodelo_nfse      := Trim(ADataSet.FieldByName('MODELO_NFSE').AsString);
    if Assigned(ADataSet.FindField('CNAE_RESPNFSE'   )) then Fcnae_respnfse    := Trim(ADataSet.FieldByName('CNAE_RESPNFSE').AsString);
    if Assigned(ADataSet.FindField('VALOR_NFSE'      )) then Fvalor_nfse       := ADataSet.FieldByName('VALOR_NFSE').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_PIS'        )) then Faliq_pis         := ADataSet.FieldByName('ALIQ_PIS').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_COFINS'     )) then Faliq_cofins      := ADataSet.FieldByName('ALIQ_COFINS').AsFloat;
    if Assigned(ADataSet.FindField('CST_PIS'         )) then Fcst_pis          := Trim(ADataSet.FieldByName('CST_PIS').AsString);
    if Assigned(ADataSet.FindField('CST_COFINS'      )) then Fcst_cofins       := Trim(ADataSet.FieldByName('CST_COFINS').AsString);
    if Assigned(ADataSet.FindField('DATA_INCLUSAO'   )) then Fdata_inclusao    := ADataSet.FieldByName('DATA_INCLUSAO').AsDateTime;
    if Assigned(ADataSet.FindField('STATUS'          )) then Fstatus           := Trim(ADataSet.FieldByName('STATUS').AsString);
    if Assigned(ADataSet.FindField('DAV_ORIGEM'      )) then Fdav_origem       := ADataSet.FieldByName('DAV_ORIGEM').AsInteger;
    if Assigned(ADataSet.FindField('IRRF_SERVICO'    )) then Firrf_servico     := ADataSet.FieldByName('IRRF_SERVICO').AsFloat;
    if Assigned(ADataSet.FindField('BASE_PIS'        )) then Fbase_pis         := ADataSet.FieldByName('BASE_PIS').AsFloat;
    if Assigned(ADataSet.FindField('BASE_COFINS'     )) then Fbase_cofins      := ADataSet.FieldByName('BASE_COFINS').AsFloat;
    if Assigned(ADataSet.FindField('VALOR_PIS'       )) then Fvalor_pis        := ADataSet.FieldByName('VALOR_PIS').AsFloat;
    if Assigned(ADataSet.FindField('VALOR_COFINS'    )) then Fvalor_cofins     := ADataSet.FieldByName('VALOR_COFINS').AsFloat;
    if Assigned(ADataSet.FindField('COD_AGENDA'      )) then Fcod_agenda       := ADataSet.FieldByName('COD_AGENDA').AsInteger;
    if Assigned(ADataSet.FindField('MD5'             )) then Fmd5              := Trim(ADataSet.FieldByName('MD5').AsString);
    if Assigned(ADataSet.FindField('NPEDORIGINADO'   )) then Fnpedoriginado    := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    if Assigned(ADataSet.FindField('TIPOORIGINADO'   )) then Ftipooriginado    := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
    if Assigned(ADataSet.FindField('NPED_ORIGEM'     )) then Fnped_origem      := ADataSet.FieldByName('NPED_ORIGEM').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ORIGEM'     )) then Ftipo_origem      := Trim(ADataSet.FieldByName('TIPO_ORIGEM').AsString);
    if Assigned(ADataSet.FindField('N_COMANDO'       )) then Fn_comando        := ADataSet.FieldByName('N_COMANDO').AsInteger;
    if Assigned(ADataSet.FindField('ISSRET_SERVICO'  )) then Fissret_servico   := ADataSet.FieldByName('ISSRET_SERVICO').AsFloat;
    if Assigned(ADataSet.FindField('CTISS'           )) then Fctiss            := Trim(ADataSet.FieldByName('CTISS').AsString);
    if Assigned(ADataSet.FindField('VALOR_B_NFSE'    )) then Fvalor_b_nfse     := ADataSet.FieldByName('VALOR_B_NFSE').AsFloat;
    if Assigned(ADataSet.FindField('CSDECVLUNT'      )) then Fcsdecvlunt       := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    if Assigned(ADataSet.FindField('NPREVENDA'       )) then Fnprevenda        := ADataSet.FieldByName('NPREVENDA').AsInteger;
    if Assigned(ADataSet.FindField('SIT_TRIB'        )) then Fsit_trib         := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    if Assigned(ADataSet.FindField('VL_DESP_NF'      )) then Fvl_desp_nf       := ADataSet.FieldByName('VL_DESP_NF').AsFloat;
    if Assigned(ADataSet.FindField('NITEM_SERV'      )) then Fnitem_serv       := ADataSet.FieldByName('NITEM_SERV').AsInteger;
    if Assigned(ADataSet.FindField('PISRF_SERVICO'   )) then Fpisrf_servico    := ADataSet.FieldByName('PISRF_SERVICO').AsFloat;
    if Assigned(ADataSet.FindField('COFINSRF_SERVICO')) then Fcofinsrf_servico := ADataSet.FieldByName('COFINSRF_SERVICO').AsFloat;
    if Assigned(ADataSet.FindField('CSSLRF_SERVICO'  )) then Fcsslrf_servico   := ADataSet.FieldByName('CSSLRF_SERVICO').AsFloat;
    if Assigned(ADataSet.FindField('COD_CONTRATO'    )) then Fcod_contrato     := ADataSet.FieldByName('COD_CONTRATO').AsInteger;
  end;
end;

{ TPedvenda_serv_classList }

function TPedvenda_serv_classList.GetItem(Index: Integer): TPedvenda_serv_class;
begin
  Result := TPedvenda_serv_class(inherited Items[Index]);
end;

function TPedvenda_serv_classList.New: TPedvenda_serv_class;
begin
  Result := TPedvenda_serv_class.Create;
  Add(Result);
end;

procedure TPedvenda_serv_classList.SetItem(Index: Integer; const Value: TPedvenda_serv_class);
begin
  Put(Index, Value);
end;
procedure TPedvenda_serv_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
