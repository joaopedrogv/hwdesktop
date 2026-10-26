unit PedVendaServ_Model;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  IBQuery,
  Variants, DB;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  IBX.IBQuery,
  System.Variants;
{$ENDIF}

type
  TPedVendaServ_Model = class(TBaseFb_class)
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
    Facresc_plano    : Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;
    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; override;

  published
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
    property acresc_plano    : Double    read Facresc_plano     write Facresc_plano;
  end;

  TPedVendaServs_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TPedVendaServ_Model;
    procedure SetItem(Index: Integer; const Value: TPedVendaServ_Model);
  public
    function New: TPedVendaServ_Model;

    property Items[Index: Integer]: TPedVendaServ_Model read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TPedVendaServ_Model }

constructor TPedVendaServ_Model.Create;
begin
  InitializeObjects;
end;

class function TPedVendaServ_Model.GetFieldsSql(Aalias: string): string;
begin
  Result := ' @nped, @tipo, @cod_servico, @nitem, @cod_empresa, @codigo_nop, @cod_vendedor, @quant_serv_ped,' +
            ' @valor_un_serv, @valor_tot_serv, @vlun_orig, @prc_int_serv, @rateio_desc, @rateio_acresc, ' +
            ' @desc_serv_ped, @cod_vendedor1, @nome_vend, @nome_vend1, @ativo, @tmo_serv, @subgservico, @desc_item,' +
            ' @acresc_item, @iss_retido, @nfs_servico, @cnae_serv, @aliq_iss, ' +
            ' @nprotnfse, @status_nfse, @lote_nfse, @resp_ws_nfse, @codigo_verwsnfse, @outras_infnfse, @desc_servico_rps,' +
            ' @modelo_nfse, @cnae_respnfse, @valor_nfse, @aliq_pis, @aliq_cofins, @cst_pis, @cst_cofins, @data_inclusao,' +
            ' @status, @dav_origem, @irrf_servico, @base_pis, @base_cofins, @valor_pis, @valor_cofins, @cod_agenda, @md5,' +
            ' @npedoriginado, @tipooriginado, @nped_origem, @tipo_origem, @n_comando, @issret_servico, @ctiss,' +
            ' @valor_b_nfse, @csdecvlunt, @nprevenda, @sit_trib, @vl_desp_nf, @nitem_serv, @pisrf_servico,' +
            ' @cofinsrf_servico, @csslrf_servico, @cod_contrato, @acresc_plano, ' +
            ' @cod_rps, @n_nf, @serie, @emissao_rps, @emissao_nfse ';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedVendaServ_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

procedure TPedVendaServ_Model.SetValuesFrom(ADataSet: TDataSet;
  AcheckFields: Boolean);
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
    Facresc_plano     := ADataSet.FieldByName('ACRESC_PLANO').AsFloat;
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
    if Assigned(ADataSet.FindField('ACRESC_PLANO'    )) then Facresc_plano     := ADataSet.FieldByName('ACRESC_PLANO').AsFloat;
  end;
end;

function TPedVendaServ_Model.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('NPED').AsInteger            := Fnped;
    ADataSet.ParamByName('TIPO').AsString             := Copy(Ftipo            , 1, 3);
    ADataSet.ParamByName('COD_SERVICO').AsInteger     := Fcod_servico;
    ADataSet.ParamByName('NITEM').AsInteger           := Fnitem;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger     := Fcod_empresa;
    ADataSet.ParamByName('CODIGO_NOP').AsFloat        := Fcodigo_nop;
    ADataSet.ParamByName('COD_VENDEDOR').AsInteger    := Fcod_vendedor;
    ADataSet.ParamByName('QUANT_SERV_PED').AsFloat    := Fquant_serv_ped;
    ADataSet.ParamByName('VALOR_UN_SERV').AsFloat     := Fvalor_un_serv;
    ADataSet.ParamByName('VALOR_TOT_SERV').AsFloat    := Fvalor_tot_serv;
    ADataSet.ParamByName('VLUN_ORIG').AsFloat         := Fvlun_orig;
    ADataSet.ParamByName('PRC_INT_SERV').AsFloat      := Fprc_int_serv;
    ADataSet.ParamByName('RATEIO_DESC').AsFloat       := Frateio_desc;
    ADataSet.ParamByName('RATEIO_ACRESC').AsFloat     := Frateio_acresc;
    ADataSet.ParamByName('N_NF').AsInteger            := Fn_nf;
    ADataSet.ParamByName('SERIE').AsString            := Copy(Fserie           , 1, 5);
    ADataSet.ParamByName('DESC_SERV_PED').AsString    := Copy(Fdesc_serv_ped   , 1, 60);
    ADataSet.ParamByName('COD_VENDEDOR1').AsInteger   := Fcod_vendedor1;
    ADataSet.ParamByName('NOME_VEND').AsString        := Copy(Fnome_vend       , 1, 35);
    ADataSet.ParamByName('NOME_VEND1').AsString       := Copy(Fnome_vend1      , 1, 35);
    ADataSet.ParamByName('ATIVO').AsInteger           := Fativo;
    ADataSet.ParamByName('TMO_SERV').AsFloat          := Ftmo_serv;
    ADataSet.ParamByName('SUBGSERVICO').AsInteger     := Fsubgservico;
    ADataSet.ParamByName('DESC_ITEM').AsFloat         := Fdesc_item;
    ADataSet.ParamByName('ACRESC_ITEM').AsFloat       := Facresc_item;
    ADataSet.ParamByName('COD_RPS').AsInteger         := Fcod_rps;
    ADataSet.ParamByName('ISS_RETIDO').AsInteger      := Fiss_retido;
    ADataSet.ParamByName('NFS_SERVICO').AsString      := Copy(Fnfs_servico     , 1, 5);
    ADataSet.ParamByName('CNAE_SERV').AsInteger       := Fcnae_serv;
    ADataSet.ParamByName('ALIQ_ISS').AsFloat          := Faliq_iss;
    ADataSet.ParamByName('EMISSAO_RPS').AsDateTime    := Femissao_rps;
    ADataSet.ParamByName('EMISSAO_NFSE').AsDateTime   := Femissao_nfse;
    ADataSet.ParamByName('NPROTNFSE').AsString        := Copy(Fnprotnfse       , 1, 50);
    ADataSet.ParamByName('STATUS_NFSE').AsString      := Copy(Fstatus_nfse     , 1, 20);
    ADataSet.ParamByName('LOTE_NFSE').AsInteger       := Flote_nfse;
    ADataSet.ParamByName('RESP_WS_NFSE').AsString     := Copy(Fresp_ws_nfse    , 1, 1000);
    ADataSet.ParamByName('CODIGO_VERWSNFSE').AsString := Copy(Fcodigo_verwsnfse, 1, 50);
    ADataSet.ParamByName('OUTRAS_INFNFSE').AsString   := Copy(Foutras_infnfse  , 1, 400);
    ADataSet.ParamByName('DESC_SERVICO_RPS').AsString := Copy(Fdesc_servico_rps, 1, 2000);
    ADataSet.ParamByName('MODELO_NFSE').AsString      := Copy(Fmodelo_nfse     , 1, 3);
    ADataSet.ParamByName('CNAE_RESPNFSE').AsString    := Copy(Fcnae_respnfse   , 1, 12);
    ADataSet.ParamByName('VALOR_NFSE').AsFloat        := Fvalor_nfse;
    ADataSet.ParamByName('ALIQ_PIS').AsFloat          := Faliq_pis;
    ADataSet.ParamByName('ALIQ_COFINS').AsFloat       := Faliq_cofins;
    ADataSet.ParamByName('CST_PIS').AsString          := Copy(Fcst_pis         , 1, 2);
    ADataSet.ParamByName('CST_COFINS').AsString       := Copy(Fcst_cofins      , 1, 2);
    ADataSet.ParamByName('DATA_INCLUSAO').AsDateTime  := Fdata_inclusao;
    ADataSet.ParamByName('STATUS').AsString           := Copy(Fstatus          , 1, 10);
    ADataSet.ParamByName('DAV_ORIGEM').AsInteger      := Fdav_origem;
    ADataSet.ParamByName('IRRF_SERVICO').AsFloat      := Firrf_servico;
    ADataSet.ParamByName('BASE_PIS').AsFloat          := Fbase_pis;
    ADataSet.ParamByName('BASE_COFINS').AsFloat       := Fbase_cofins;
    ADataSet.ParamByName('VALOR_PIS').AsFloat         := Fvalor_pis;
    ADataSet.ParamByName('VALOR_COFINS').AsFloat      := Fvalor_cofins;
    ADataSet.ParamByName('COD_AGENDA').AsInteger      := Fcod_agenda;
    ADataSet.ParamByName('MD5').AsString              := Copy(Fmd5             , 1, 256);
    ADataSet.ParamByName('NPEDORIGINADO').AsInteger   := Fnpedoriginado;
    ADataSet.ParamByName('TIPOORIGINADO').AsString    := Copy(Ftipooriginado   , 1, 3);
    ADataSet.ParamByName('NPED_ORIGEM').AsInteger     := Fnped_origem;
    ADataSet.ParamByName('TIPO_ORIGEM').AsString      := Copy(Ftipo_origem     , 1, 3);
    ADataSet.ParamByName('N_COMANDO').AsInteger       := Fn_comando;
    ADataSet.ParamByName('ISSRET_SERVICO').AsFloat    := Fissret_servico;
    ADataSet.ParamByName('CTISS').AsString            := Copy(Fctiss           , 1, 9);
    ADataSet.ParamByName('VALOR_B_NFSE').AsFloat      := Fvalor_b_nfse;
    ADataSet.ParamByName('CSDECVLUNT').AsString       := Copy(Fcsdecvlunt      , 1, 1);
    ADataSet.ParamByName('NPREVENDA').AsInteger       := Fnprevenda;
    ADataSet.ParamByName('SIT_TRIB').AsString         := Copy(Fsit_trib        , 1, 1);
    ADataSet.ParamByName('VL_DESP_NF').AsFloat        := Fvl_desp_nf;
    ADataSet.ParamByName('NITEM_SERV').AsInteger      := Fnitem_serv;
    ADataSet.ParamByName('PISRF_SERVICO').AsFloat     := Fpisrf_servico;
    ADataSet.ParamByName('COFINSRF_SERVICO').AsFloat  := Fcofinsrf_servico;
    ADataSet.ParamByName('CSSLRF_SERVICO').AsFloat    := Fcsslrf_servico;
    ADataSet.ParamByName('COD_CONTRATO').AsInteger    := Fcod_contrato;
    ADataSet.ParamByName('ACRESC_PLANO').AsFloat      := Facresc_plano;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('NPED'            )) then   ADataSet.ParamByName('NPED').AsInteger            := Fnped;
    if Assigned(ADataSet.Params.FindParam('TIPO'            )) then   ADataSet.ParamByName('TIPO').AsString             := Copy(Ftipo            , 1, 3);
    if Assigned(ADataSet.Params.FindParam('COD_SERVICO'     )) then   ADataSet.ParamByName('COD_SERVICO').AsInteger     := Fcod_servico;
    if Assigned(ADataSet.Params.FindParam('NITEM'           )) then   ADataSet.ParamByName('NITEM').AsInteger           := Fnitem;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'     )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger     := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('CODIGO_NOP'      )) then   ADataSet.ParamByName('CODIGO_NOP').AsFloat        := Fcodigo_nop;
    if Assigned(ADataSet.Params.FindParam('COD_VENDEDOR'    )) then   ADataSet.ParamByName('COD_VENDEDOR').AsInteger    := Fcod_vendedor;
    if Assigned(ADataSet.Params.FindParam('QUANT_SERV_PED'  )) then   ADataSet.ParamByName('QUANT_SERV_PED').AsFloat    := Fquant_serv_ped;
    if Assigned(ADataSet.Params.FindParam('VALOR_UN_SERV'   )) then   ADataSet.ParamByName('VALOR_UN_SERV').AsFloat     := Fvalor_un_serv;
    if Assigned(ADataSet.Params.FindParam('VALOR_TOT_SERV'  )) then   ADataSet.ParamByName('VALOR_TOT_SERV').AsFloat    := Fvalor_tot_serv;
    if Assigned(ADataSet.Params.FindParam('VLUN_ORIG'       )) then   ADataSet.ParamByName('VLUN_ORIG').AsFloat         := Fvlun_orig;
    if Assigned(ADataSet.Params.FindParam('PRC_INT_SERV'    )) then   ADataSet.ParamByName('PRC_INT_SERV').AsFloat      := Fprc_int_serv;
    if Assigned(ADataSet.Params.FindParam('RATEIO_DESC'     )) then   ADataSet.ParamByName('RATEIO_DESC').AsFloat       := Frateio_desc;
    if Assigned(ADataSet.Params.FindParam('RATEIO_ACRESC'   )) then   ADataSet.ParamByName('RATEIO_ACRESC').AsFloat     := Frateio_acresc;
    if Assigned(ADataSet.Params.FindParam('N_NF'            )) then   ADataSet.ParamByName('N_NF').AsInteger            := Fn_nf;
    if Assigned(ADataSet.Params.FindParam('SERIE'           )) then   ADataSet.ParamByName('SERIE').AsString            := Copy(Fserie           , 1, 5);
    if Assigned(ADataSet.Params.FindParam('DESC_SERV_PED'   )) then   ADataSet.ParamByName('DESC_SERV_PED').AsString    := Copy(Fdesc_serv_ped   , 1, 60);
    if Assigned(ADataSet.Params.FindParam('COD_VENDEDOR1'   )) then   ADataSet.ParamByName('COD_VENDEDOR1').AsInteger   := Fcod_vendedor1;
    if Assigned(ADataSet.Params.FindParam('NOME_VEND'       )) then   ADataSet.ParamByName('NOME_VEND').AsString        := Copy(Fnome_vend       , 1, 35);
    if Assigned(ADataSet.Params.FindParam('NOME_VEND1'      )) then   ADataSet.ParamByName('NOME_VEND1').AsString       := Copy(Fnome_vend1      , 1, 35);
    if Assigned(ADataSet.Params.FindParam('ATIVO'           )) then   ADataSet.ParamByName('ATIVO').AsInteger           := Fativo;
    if Assigned(ADataSet.Params.FindParam('TMO_SERV'        )) then   ADataSet.ParamByName('TMO_SERV').AsFloat          := Ftmo_serv;
    if Assigned(ADataSet.Params.FindParam('SUBGSERVICO'     )) then   ADataSet.ParamByName('SUBGSERVICO').AsInteger     := Fsubgservico;
    if Assigned(ADataSet.Params.FindParam('DESC_ITEM'       )) then   ADataSet.ParamByName('DESC_ITEM').AsFloat         := Fdesc_item;
    if Assigned(ADataSet.Params.FindParam('ACRESC_ITEM'     )) then   ADataSet.ParamByName('ACRESC_ITEM').AsFloat       := Facresc_item;
    if Assigned(ADataSet.Params.FindParam('COD_RPS'         )) then   ADataSet.ParamByName('COD_RPS').AsInteger         := Fcod_rps;
    if Assigned(ADataSet.Params.FindParam('ISS_RETIDO'      )) then   ADataSet.ParamByName('ISS_RETIDO').AsInteger      := Fiss_retido;
    if Assigned(ADataSet.Params.FindParam('NFS_SERVICO'     )) then   ADataSet.ParamByName('NFS_SERVICO').AsString      := Copy(Fnfs_servico     , 1, 5);
    if Assigned(ADataSet.Params.FindParam('CNAE_SERV'       )) then   ADataSet.ParamByName('CNAE_SERV').AsInteger       := Fcnae_serv;
    if Assigned(ADataSet.Params.FindParam('ALIQ_ISS'        )) then   ADataSet.ParamByName('ALIQ_ISS').AsFloat          := Faliq_iss;
    if Assigned(ADataSet.Params.FindParam('EMISSAO_RPS'     )) then   ADataSet.ParamByName('EMISSAO_RPS').AsDateTime    := Femissao_rps;
    if Assigned(ADataSet.Params.FindParam('EMISSAO_NFSE'    )) then   ADataSet.ParamByName('EMISSAO_NFSE').AsDateTime   := Femissao_nfse;
    if Assigned(ADataSet.Params.FindParam('NPROTNFSE'       )) then   ADataSet.ParamByName('NPROTNFSE').AsString        := Copy(Fnprotnfse       , 1, 50);
    if Assigned(ADataSet.Params.FindParam('STATUS_NFSE'     )) then   ADataSet.ParamByName('STATUS_NFSE').AsString      := Copy(Fstatus_nfse     , 1, 20);
    if Assigned(ADataSet.Params.FindParam('LOTE_NFSE'       )) then   ADataSet.ParamByName('LOTE_NFSE').AsInteger       := Flote_nfse;
    if Assigned(ADataSet.Params.FindParam('RESP_WS_NFSE'    )) then   ADataSet.ParamByName('RESP_WS_NFSE').AsString     := Copy(Fresp_ws_nfse    , 1, 1000);
    if Assigned(ADataSet.Params.FindParam('CODIGO_VERWSNFSE')) then   ADataSet.ParamByName('CODIGO_VERWSNFSE').AsString := Copy(Fcodigo_verwsnfse, 1, 50);
    if Assigned(ADataSet.Params.FindParam('OUTRAS_INFNFSE'  )) then   ADataSet.ParamByName('OUTRAS_INFNFSE').AsString   := Copy(Foutras_infnfse  , 1, 400);
    if Assigned(ADataSet.Params.FindParam('DESC_SERVICO_RPS')) then   ADataSet.ParamByName('DESC_SERVICO_RPS').AsString := Copy(Fdesc_servico_rps, 1, 2000);
    if Assigned(ADataSet.Params.FindParam('MODELO_NFSE'     )) then   ADataSet.ParamByName('MODELO_NFSE').AsString      := Copy(Fmodelo_nfse     , 1, 3);
    if Assigned(ADataSet.Params.FindParam('CNAE_RESPNFSE'   )) then   ADataSet.ParamByName('CNAE_RESPNFSE').AsString    := Copy(Fcnae_respnfse   , 1, 12);
    if Assigned(ADataSet.Params.FindParam('VALOR_NFSE'      )) then   ADataSet.ParamByName('VALOR_NFSE').AsFloat        := Fvalor_nfse;
    if Assigned(ADataSet.Params.FindParam('ALIQ_PIS'        )) then   ADataSet.ParamByName('ALIQ_PIS').AsFloat          := Faliq_pis;
    if Assigned(ADataSet.Params.FindParam('ALIQ_COFINS'     )) then   ADataSet.ParamByName('ALIQ_COFINS').AsFloat       := Faliq_cofins;
    if Assigned(ADataSet.Params.FindParam('CST_PIS'         )) then   ADataSet.ParamByName('CST_PIS').AsString          := Copy(Fcst_pis         , 1, 2);
    if Assigned(ADataSet.Params.FindParam('CST_COFINS'      )) then   ADataSet.ParamByName('CST_COFINS').AsString       := Copy(Fcst_cofins      , 1, 2);
    if Assigned(ADataSet.Params.FindParam('DATA_INCLUSAO'   )) then   ADataSet.ParamByName('DATA_INCLUSAO').AsDateTime  := Fdata_inclusao;
    if Assigned(ADataSet.Params.FindParam('STATUS'          )) then   ADataSet.ParamByName('STATUS').AsString           := Copy(Fstatus          , 1, 10);
    if Assigned(ADataSet.Params.FindParam('DAV_ORIGEM'      )) then   ADataSet.ParamByName('DAV_ORIGEM').AsInteger      := Fdav_origem;
    if Assigned(ADataSet.Params.FindParam('IRRF_SERVICO'    )) then   ADataSet.ParamByName('IRRF_SERVICO').AsFloat      := Firrf_servico;
    if Assigned(ADataSet.Params.FindParam('BASE_PIS'        )) then   ADataSet.ParamByName('BASE_PIS').AsFloat          := Fbase_pis;
    if Assigned(ADataSet.Params.FindParam('BASE_COFINS'     )) then   ADataSet.ParamByName('BASE_COFINS').AsFloat       := Fbase_cofins;
    if Assigned(ADataSet.Params.FindParam('VALOR_PIS'       )) then   ADataSet.ParamByName('VALOR_PIS').AsFloat         := Fvalor_pis;
    if Assigned(ADataSet.Params.FindParam('VALOR_COFINS'    )) then   ADataSet.ParamByName('VALOR_COFINS').AsFloat      := Fvalor_cofins;
    if Assigned(ADataSet.Params.FindParam('COD_AGENDA'      )) then   ADataSet.ParamByName('COD_AGENDA').AsInteger      := Fcod_agenda;
    if Assigned(ADataSet.Params.FindParam('MD5'             )) then   ADataSet.ParamByName('MD5').AsString              := Copy(Fmd5             , 1, 256);
    if Assigned(ADataSet.Params.FindParam('NPEDORIGINADO'   )) then   ADataSet.ParamByName('NPEDORIGINADO').AsInteger   := Fnpedoriginado;
    if Assigned(ADataSet.Params.FindParam('TIPOORIGINADO'   )) then   ADataSet.ParamByName('TIPOORIGINADO').AsString    := Copy(Ftipooriginado   , 1, 3);
    if Assigned(ADataSet.Params.FindParam('NPED_ORIGEM'     )) then   ADataSet.ParamByName('NPED_ORIGEM').AsInteger     := Fnped_origem;
    if Assigned(ADataSet.Params.FindParam('TIPO_ORIGEM'     )) then   ADataSet.ParamByName('TIPO_ORIGEM').AsString      := Copy(Ftipo_origem     , 1, 3);
    if Assigned(ADataSet.Params.FindParam('N_COMANDO'       )) then   ADataSet.ParamByName('N_COMANDO').AsInteger       := Fn_comando;
    if Assigned(ADataSet.Params.FindParam('ISSRET_SERVICO'  )) then   ADataSet.ParamByName('ISSRET_SERVICO').AsFloat    := Fissret_servico;
    if Assigned(ADataSet.Params.FindParam('CTISS'           )) then   ADataSet.ParamByName('CTISS').AsString            := Copy(Fctiss           , 1, 9);
    if Assigned(ADataSet.Params.FindParam('VALOR_B_NFSE'    )) then   ADataSet.ParamByName('VALOR_B_NFSE').AsFloat      := Fvalor_b_nfse;
    if Assigned(ADataSet.Params.FindParam('CSDECVLUNT'      )) then   ADataSet.ParamByName('CSDECVLUNT').AsString       := Copy(Fcsdecvlunt      , 1, 1);
    if Assigned(ADataSet.Params.FindParam('NPREVENDA'       )) then   ADataSet.ParamByName('NPREVENDA').AsInteger       := Fnprevenda;
    if Assigned(ADataSet.Params.FindParam('SIT_TRIB'        )) then   ADataSet.ParamByName('SIT_TRIB').AsString         := Copy(Fsit_trib        , 1, 1);
    if Assigned(ADataSet.Params.FindParam('VL_DESP_NF'      )) then   ADataSet.ParamByName('VL_DESP_NF').AsFloat        := Fvl_desp_nf;
    if Assigned(ADataSet.Params.FindParam('NITEM_SERV'      )) then   ADataSet.ParamByName('NITEM_SERV').AsInteger      := Fnitem_serv;
    if Assigned(ADataSet.Params.FindParam('PISRF_SERVICO'   )) then   ADataSet.ParamByName('PISRF_SERVICO').AsFloat     := Fpisrf_servico;
    if Assigned(ADataSet.Params.FindParam('COFINSRF_SERVICO')) then   ADataSet.ParamByName('COFINSRF_SERVICO').AsFloat  := Fcofinsrf_servico;
    if Assigned(ADataSet.Params.FindParam('CSSLRF_SERVICO'  )) then   ADataSet.ParamByName('CSSLRF_SERVICO').AsFloat    := Fcsslrf_servico;
    if Assigned(ADataSet.Params.FindParam('COD_CONTRATO'    )) then   ADataSet.ParamByName('COD_CONTRATO').AsInteger    := Fcod_contrato;
    if Assigned(ADataSet.Params.FindParam('ACRESC_PLANO'    )) then   ADataSet.ParamByName('ACRESC_PLANO').AsFloat      := Facresc_plano;
  end;
end;

{ TPedVendaServs_Model }

function TPedVendaServs_Model.GetItem(Index: Integer): TPedVendaServ_Model;
begin
	Result := TPedVendaServ_Model(inherited Items[Index]);
end;

function TPedVendaServs_Model.New: TPedVendaServ_Model;
begin
	Result := TPedVendaServ_Model.Create;
  Add(Result);
end;

procedure TPedVendaServs_Model.SetItem(Index: Integer;
  const Value: TPedVendaServ_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TPedVendaServ_Model);
finalization
  UnRegisterClass(TPedVendaServ_Model);

end.
