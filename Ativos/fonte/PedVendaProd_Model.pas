unit PedVendaProd_Model;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  IBQuery,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  IBX.IBQuery,
  System.Variants;
{$ENDIF}

type
  TPedVendaProd_Model = class(TBaseFb_class)
  private
    Fnped            : Integer;
    Ftipo            : string;
    Fgrupo_prod      : Integer;
    Fcod_prod        : string;
    Fnitem           : Integer;
    Fcod_empresa     : Integer;
    Fcod_grade       : Integer;
    Fcodigo_nop      : Double;
    Fnum_fab_prod    : string;
    Fdescr_prod_ped  : string;
    Fquant_ped_item  : Double;
    Fvlun_ped_item   : Double;
    Fvltot_ped_item  : Double;
    Fvlun_orig       : Double;
    Fvlun_ped_nf     : Double;
    Frateio_desc     : Double;
    Frateio_acresc   : Double;
    Fratdsas         : Double;
    Fcomiss_prod     : Double;
    Fcomiss_prod_ger : Double;
    Fpcust_c         : Double;
    Fpcust_mc        : Double;
    Ftp_nf_ped       : string;
    Fsit_atd         : string;
    Fdesc_item       : Double;
    Facresc_item     : Double;
    Fcod_vendedor    : Integer;
    Fcol_cod_vendedor: Integer;
    Fdata_transf     : TDateTime;
    Fnome_vend       : string;
    Fvlo_unitario    : Double;
    Fdata_inclusao   : TDateTime;
    Ftp_descacres    : string;
    Fnat_descacres   : string;
    Fvalor_descacres : Double;
    Fnitem_nf        : Integer;
    Fxped_compra     : string;
    Fnitemped_compra : Integer;
    Fvl_desp_nf      : Double;
    Funidade         : string;
    Ficm_prod        : Double;
    Fcsdecqtde       : string;
    Fcsdecvlunt      : string;
    Fsit_trib        : string;
    Fmd5             : string;
    Fvltot_ped_nf    : Double;
    Ftabpraticada    : string;
    Fprecoporqtde    : string;
    Fcod_sugestao    : Integer;
    Fcod_emp_sugestao: Integer;
    Funidade_conv    : string;
    Foperacao_conv   : string;
    Ffator_conv      : Double;
    Fpeso_liq_prod   : Double;
    Fpeso_brut_prod  : Double;
    Fativo           : Integer;
    Fcod_contrato    : Integer;
    Fcod_nf          : Integer;
    Fn_nf            : Integer;
    Fserie           : string;  
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; override;

  published
    property nped            : Integer   read Fnped             write Fnped;
    property tipo            : string    read Ftipo             write Ftipo;
    property grupo_prod      : Integer   read Fgrupo_prod       write Fgrupo_prod;
    property cod_prod        : string    read Fcod_prod         write Fcod_prod;
    property nitem           : Integer   read Fnitem            write Fnitem;
    property cod_empresa     : Integer   read Fcod_empresa      write Fcod_empresa;
    property cod_grade       : Integer   read Fcod_grade        write Fcod_grade;
    property codigo_nop      : Double    read Fcodigo_nop       write Fcodigo_nop;
    property num_fab_prod    : string    read Fnum_fab_prod     write Fnum_fab_prod;
    property descr_prod_ped  : string    read Fdescr_prod_ped   write Fdescr_prod_ped;
    property quant_ped_item  : Double    read Fquant_ped_item   write Fquant_ped_item;
    property vlun_ped_item   : Double    read Fvlun_ped_item    write Fvlun_ped_item;
    property vltot_ped_item  : Double    read Fvltot_ped_item   write Fvltot_ped_item;
    property vlun_orig       : Double    read Fvlun_orig        write Fvlun_orig;
    property vlun_ped_nf     : Double    read Fvlun_ped_nf      write Fvlun_ped_nf;
    property rateio_desc     : Double    read Frateio_desc      write Frateio_desc;
    property rateio_acresc   : Double    read Frateio_acresc    write Frateio_acresc;
    property ratdsas         : Double    read Fratdsas          write Fratdsas;
    property comiss_prod     : Double    read Fcomiss_prod      write Fcomiss_prod;
    property comiss_prod_ger : Double    read Fcomiss_prod_ger  write Fcomiss_prod_ger;
    property pcust_c         : Double    read Fpcust_c          write Fpcust_c;
    property pcust_mc        : Double    read Fpcust_mc         write Fpcust_mc;
    property tp_nf_ped       : string    read Ftp_nf_ped        write Ftp_nf_ped;
    property sit_atd         : string    read Fsit_atd          write Fsit_atd;
    property desc_item       : Double    read Fdesc_item        write Fdesc_item;
    property acresc_item     : Double    read Facresc_item      write Facresc_item;
    property cod_vendedor    : Integer   read Fcod_vendedor     write Fcod_vendedor;
    property col_cod_vendedor: Integer   read Fcol_cod_vendedor write Fcol_cod_vendedor;
    property data_transf     : TDateTime read Fdata_transf      write Fdata_transf;
    property nome_vend       : string    read Fnome_vend        write Fnome_vend;
    property vlo_unitario    : Double    read Fvlo_unitario     write Fvlo_unitario;
    property data_inclusao   : TDateTime read Fdata_inclusao    write Fdata_inclusao;
    property tp_descacres    : string    read Ftp_descacres     write Ftp_descacres;
    property nat_descacres   : string    read Fnat_descacres    write Fnat_descacres;
    property valor_descacres : Double    read Fvalor_descacres  write Fvalor_descacres;
    property nitem_nf        : Integer   read Fnitem_nf         write Fnitem_nf;
    property xped_compra     : string    read Fxped_compra      write Fxped_compra;
    property nitemped_compra : Integer   read Fnitemped_compra  write Fnitemped_compra;
    property vl_desp_nf      : Double    read Fvl_desp_nf       write Fvl_desp_nf;
    property unidade         : string    read Funidade          write Funidade;
    property icm_prod        : Double    read Ficm_prod         write Ficm_prod;
    property csdecqtde       : string    read Fcsdecqtde        write Fcsdecqtde;
    property csdecvlunt      : string    read Fcsdecvlunt       write Fcsdecvlunt;
    property sit_trib        : string    read Fsit_trib         write Fsit_trib;
    property md5             : string    read Fmd5              write Fmd5;
    property vltot_ped_nf    : Double    read Fvltot_ped_nf     write Fvltot_ped_nf;
    property tabpraticada    : string    read Ftabpraticada     write Ftabpraticada;
    property precoporqtde    : string    read Fprecoporqtde     write Fprecoporqtde;
    property cod_sugestao    : Integer   read Fcod_sugestao     write Fcod_sugestao;
    property cod_emp_sugestao: Integer   read Fcod_emp_sugestao write Fcod_emp_sugestao;
    property unidade_conv    : string    read Funidade_conv     write Funidade_conv;
    property operacao_conv   : string    read Foperacao_conv    write Foperacao_conv;
    property fator_conv      : Double    read Ffator_conv       write Ffator_conv;
    property peso_liq_prod   : Double    read Fpeso_liq_prod    write Fpeso_liq_prod;
    property peso_brut_prod  : Double    read Fpeso_brut_prod   write Fpeso_brut_prod;
    property ativo           : Integer   read Fativo            write Fativo;
    property cod_contrato    : Integer   read Fcod_contrato     write Fcod_contrato;
    property cod_nf          : Integer   read Fcod_nf           write Fcod_nf;
    property n_nf            : Integer   read Fn_nf             write Fn_nf;
    property serie           : string    read Fserie            write Fserie;
  end;

  TPedVendaProds_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TPedVendaProd_Model;
    procedure SetItem(Index: Integer; const Value: TPedVendaProd_Model);
  public
    function New: TPedVendaProd_Model;

    property Items[Index: Integer]: TPedVendaProd_Model read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils, Classes;
{$ENDIF}

{ TPedVendaProd_Model }

procedure TPedVendaProd_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

constructor TPedVendaProd_Model.Create;
begin
  InitializeObjects;
end;

class function TPedVendaProd_Model.GetFieldsSql(Aalias: string): string;
begin
  Result := ' @nped, @tipo, @grupo_prod, @cod_prod, @nitem, @cod_empresa, @cod_grade, @codigo_nop, @num_fab_prod,' +
            ' @descr_prod_ped, @quant_ped_item, @vlun_ped_item, @vltot_ped_item, @vlun_orig, @vlun_ped_nf, @rateio_desc,' +
            ' @rateio_acresc, @ratdsas, @comiss_prod, @comiss_prod_ger, @pcust_c, @pcust_mc, @tp_nf_ped, @sit_atd,' +
            ' @desc_item, @acresc_item, @cod_vendedor, @col_cod_vendedor, @data_transf, @nome_vend, @vlo_unitario, @data_inclusao,' +
            ' @tp_descacres, @nat_descacres, @valor_descacres, @nitem_nf, @xped_compra, @nitemped_compra, @vl_desp_nf,' +
            ' @unidade, @icm_prod, @csdecqtde, @csdecvlunt, @sit_trib, @md5, @vltot_ped_nf, @tabpraticada, @precoporqtde, @cod_sugestao,' +
            ' @cod_emp_sugestao, @unidade_conv, @operacao_conv, @fator_conv, @peso_liq_prod, @peso_brut_prod, @ativo, @cod_contrato, ' +
            ' @cod_nf, @n_nf, @serie ';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

function TPedVendaProd_Model.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('NPED').AsInteger             := Fnped;
    ADataSet.ParamByName('TIPO').AsString              := Copy(Ftipo          , 1, 3);
    ADataSet.ParamByName('GRUPO_PROD').AsInteger       := Fgrupo_prod;
    ADataSet.ParamByName('COD_PROD').AsString          := Copy(Fcod_prod      , 1, 6);
    ADataSet.ParamByName('NITEM').AsInteger            := Fnitem;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger      := Fcod_empresa;
    ADataSet.ParamByName('COD_GRADE').AsInteger        := Fcod_grade;
    ADataSet.ParamByName('CODIGO_NOP').AsFloat         := Fcodigo_nop;
    ADataSet.ParamByName('NUM_FAB_PROD').AsString      := Copy(Fnum_fab_prod  , 1, 20);
    ADataSet.ParamByName('DESCR_PROD_PED').AsString    := Copy(Fdescr_prod_ped, 1, 75);
    ADataSet.ParamByName('QUANT_PED_ITEM').AsFloat     := Fquant_ped_item;
    ADataSet.ParamByName('VLUN_PED_ITEM').AsFloat      := Fvlun_ped_item;
    ADataSet.ParamByName('VLTOT_PED_ITEM').AsFloat     := Fvltot_ped_item;
    ADataSet.ParamByName('VLUN_ORIG').AsFloat          := Fvlun_orig;
    ADataSet.ParamByName('VLUN_PED_NF').AsFloat        := Fvlun_ped_nf;
    ADataSet.ParamByName('RATEIO_DESC').AsFloat        := Frateio_desc;
    ADataSet.ParamByName('RATEIO_ACRESC').AsFloat      := Frateio_acresc;
    ADataSet.ParamByName('RATDSAS').AsFloat            := Fratdsas;
    ADataSet.ParamByName('COMISS_PROD').AsFloat        := Fcomiss_prod;
    ADataSet.ParamByName('COMISS_PROD_GER').AsFloat    := Fcomiss_prod_ger;
    ADataSet.ParamByName('PCUST_C').AsFloat            := Fpcust_c;
    ADataSet.ParamByName('PCUST_MC').AsFloat           := Fpcust_mc;
    ADataSet.ParamByName('TP_NF_PED').AsString         := Copy(Ftp_nf_ped     , 1, 1);
    ADataSet.ParamByName('SIT_ATD').AsString           := Copy(Fsit_atd       , 1, 2);
    ADataSet.ParamByName('DESC_ITEM').AsFloat          := Fdesc_item;
    ADataSet.ParamByName('ACRESC_ITEM').AsFloat        := Facresc_item;
    ADataSet.ParamByName('COD_VENDEDOR').AsInteger     := Fcod_vendedor;
    ADataSet.ParamByName('COL_COD_VENDEDOR').AsInteger := Fcol_cod_vendedor;
    ADataSet.ParamByName('DATA_TRANSF').AsDateTime     := Fdata_transf;
    ADataSet.ParamByName('NOME_VEND').AsString         := Copy(Fnome_vend     , 1, 35);
    ADataSet.ParamByName('VLO_UNITARIO').AsFloat       := Fvlo_unitario;
    ADataSet.ParamByName('DATA_INCLUSAO').AsDateTime   := Fdata_inclusao;
    ADataSet.ParamByName('TP_DESCACRES').AsString      := Copy(Ftp_descacres  , 1, 10);
    ADataSet.ParamByName('NAT_DESCACRES').AsString     := Copy(Fnat_descacres , 1, 10);
    ADataSet.ParamByName('VALOR_DESCACRES').AsFloat    := Fvalor_descacres;
    ADataSet.ParamByName('NITEM_NF').AsInteger         := Fnitem_nf;
    ADataSet.ParamByName('XPED_COMPRA').AsString       := Copy(Fxped_compra   , 1, 15);
    ADataSet.ParamByName('NITEMPED_COMPRA').AsInteger  := Fnitemped_compra;
    ADataSet.ParamByName('VL_DESP_NF').AsFloat         := Fvl_desp_nf;
    ADataSet.ParamByName('UNIDADE').AsString           := Copy(Funidade       , 1, 3);
    ADataSet.ParamByName('ICM_PROD').AsFloat           := Ficm_prod;
    ADataSet.ParamByName('SIT_TRIB').AsString          := Copy(Fsit_trib      , 1, 1);
    ADataSet.ParamByName('MD5').AsString               := Copy(Fmd5           , 1, 256);
    ADataSet.ParamByName('VLTOT_PED_NF').AsFloat       := Fvltot_ped_nf;
    ADataSet.ParamByName('TABPRATICADA').AsString      := Copy(Ftabpraticada  , 1, 1);
    ADataSet.ParamByName('PRECOPORQTDE').AsString      := Copy(Fprecoporqtde  , 1, 1);
    ADataSet.ParamByName('COD_SUGESTAO').AsInteger     := Fcod_sugestao;
    ADataSet.ParamByName('COD_EMP_SUGESTAO').AsInteger := Fcod_emp_sugestao;
    ADataSet.ParamByName('UNIDADE_CONV').AsString      := Copy(Funidade_conv  , 1, 3);
    ADataSet.ParamByName('OPERACAO_CONV').AsString     := Copy(Foperacao_conv , 1, 1);
    ADataSet.ParamByName('FATOR_CONV').AsFloat         := Ffator_conv;
    ADataSet.ParamByName('PESO_LIQ_PROD').AsFloat      := Fpeso_liq_prod;
    ADataSet.ParamByName('PESO_BRUT_PROD').AsFloat     := Fpeso_brut_prod;
    ADataSet.ParamByName('ATIVO').AsInteger            := Fativo;
    ADataSet.ParamByName('COD_CONTRATO').AsInteger     := Fcod_contrato;
    ADataSet.ParamByName('COD_NF').AsInteger           := Fcod_nf;
    ADataSet.ParamByName('N_NF').AsInteger             := Fn_nf;
    ADataSet.ParamByName('SERIE').AsString             := Fserie;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('NPED'            )) then   ADataSet.ParamByName('NPED').AsInteger             := Fnped;
    if Assigned(ADataSet.Params.FindParam('TIPO'            )) then   ADataSet.ParamByName('TIPO').AsString              := Copy(Ftipo          , 1, 3);
    if Assigned(ADataSet.Params.FindParam('GRUPO_PROD'      )) then   ADataSet.ParamByName('GRUPO_PROD').AsInteger       := Fgrupo_prod;
    if Assigned(ADataSet.Params.FindParam('COD_PROD'        )) then   ADataSet.ParamByName('COD_PROD').AsString          := Copy(Fcod_prod      , 1, 6);
    if Assigned(ADataSet.Params.FindParam('NITEM'           )) then   ADataSet.ParamByName('NITEM').AsInteger            := Fnitem;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'     )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger      := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_GRADE'       )) then   ADataSet.ParamByName('COD_GRADE').AsInteger        := Fcod_grade;
    if Assigned(ADataSet.Params.FindParam('CODIGO_NOP'      )) then   ADataSet.ParamByName('CODIGO_NOP').AsFloat         := Fcodigo_nop;
    if Assigned(ADataSet.Params.FindParam('NUM_FAB_PROD'    )) then   ADataSet.ParamByName('NUM_FAB_PROD').AsString      := Copy(Fnum_fab_prod  , 1, 20);
    if Assigned(ADataSet.Params.FindParam('DESCR_PROD_PED'  )) then   ADataSet.ParamByName('DESCR_PROD_PED').AsString    := Copy(Fdescr_prod_ped, 1, 75);
    if Assigned(ADataSet.Params.FindParam('QUANT_PED_ITEM'  )) then   ADataSet.ParamByName('QUANT_PED_ITEM').AsFloat     := Fquant_ped_item;
    if Assigned(ADataSet.Params.FindParam('VLUN_PED_ITEM'   )) then   ADataSet.ParamByName('VLUN_PED_ITEM').AsFloat      := Fvlun_ped_item;
    if Assigned(ADataSet.Params.FindParam('VLTOT_PED_ITEM'  )) then   ADataSet.ParamByName('VLTOT_PED_ITEM').AsFloat     := Fvltot_ped_item;
    if Assigned(ADataSet.Params.FindParam('VLUN_ORIG'       )) then   ADataSet.ParamByName('VLUN_ORIG').AsFloat          := Fvlun_orig;
    if Assigned(ADataSet.Params.FindParam('VLUN_PED_NF'     )) then   ADataSet.ParamByName('VLUN_PED_NF').AsFloat        := Fvlun_ped_nf;
    if Assigned(ADataSet.Params.FindParam('RATEIO_DESC'     )) then   ADataSet.ParamByName('RATEIO_DESC').AsFloat        := Frateio_desc;
    if Assigned(ADataSet.Params.FindParam('RATEIO_ACRESC'   )) then   ADataSet.ParamByName('RATEIO_ACRESC').AsFloat      := Frateio_acresc;
    if Assigned(ADataSet.Params.FindParam('RATDSAS'         )) then   ADataSet.ParamByName('RATDSAS').AsFloat            := Fratdsas;
    if Assigned(ADataSet.Params.FindParam('COMISS_PROD'     )) then   ADataSet.ParamByName('COMISS_PROD').AsFloat        := Fcomiss_prod;
    if Assigned(ADataSet.Params.FindParam('COMISS_PROD_GER' )) then   ADataSet.ParamByName('COMISS_PROD_GER').AsFloat    := Fcomiss_prod_ger;
    if Assigned(ADataSet.Params.FindParam('PCUST_C'         )) then   ADataSet.ParamByName('PCUST_C').AsFloat            := Fpcust_c;
    if Assigned(ADataSet.Params.FindParam('PCUST_MC'        )) then   ADataSet.ParamByName('PCUST_MC').AsFloat           := Fpcust_mc;
    if Assigned(ADataSet.Params.FindParam('TP_NF_PED'       )) then   ADataSet.ParamByName('TP_NF_PED').AsString         := Copy(Ftp_nf_ped     , 1, 1);
    if Assigned(ADataSet.Params.FindParam('SIT_ATD'         )) then   ADataSet.ParamByName('SIT_ATD').AsString           := Copy(Fsit_atd       , 1, 2);
    if Assigned(ADataSet.Params.FindParam('DESC_ITEM'       )) then   ADataSet.ParamByName('DESC_ITEM').AsFloat          := Fdesc_item;
    if Assigned(ADataSet.Params.FindParam('ACRESC_ITEM'     )) then   ADataSet.ParamByName('ACRESC_ITEM').AsFloat        := Facresc_item;
    if Assigned(ADataSet.Params.FindParam('COD_VENDEDOR'    )) then   ADataSet.ParamByName('COD_VENDEDOR').AsInteger     := Fcod_vendedor;
  	if Assigned(ADataSet.Params.FindParam('COL_COD_VENDEDOR')) then   ADataSet.ParamByName('COL_COD_VENDEDOR').AsInteger := Fcol_cod_vendedor;    
    if Assigned(ADataSet.Params.FindParam('DATA_TRANSF'     )) then   ADataSet.ParamByName('DATA_TRANSF').AsDateTime     := Fdata_transf;
    if Assigned(ADataSet.Params.FindParam('NOME_VEND'       )) then   ADataSet.ParamByName('NOME_VEND').AsString         := Copy(Fnome_vend     , 1, 35);
    if Assigned(ADataSet.Params.FindParam('VLO_UNITARIO'    )) then   ADataSet.ParamByName('VLO_UNITARIO').AsFloat       := Fvlo_unitario;
    if Assigned(ADataSet.Params.FindParam('DATA_INCLUSAO'   )) then   ADataSet.ParamByName('DATA_INCLUSAO').AsDateTime   := Fdata_inclusao;
    if Assigned(ADataSet.Params.FindParam('TP_DESCACRES'    )) then   ADataSet.ParamByName('TP_DESCACRES').AsString      := Copy(Ftp_descacres  , 1, 10);
    if Assigned(ADataSet.Params.FindParam('NAT_DESCACRES'   )) then   ADataSet.ParamByName('NAT_DESCACRES').AsString     := Copy(Fnat_descacres , 1, 10);
    if Assigned(ADataSet.Params.FindParam('VALOR_DESCACRES' )) then   ADataSet.ParamByName('VALOR_DESCACRES').AsFloat    := Fvalor_descacres;
    if Assigned(ADataSet.Params.FindParam('NITEM_NF'        )) then   ADataSet.ParamByName('NITEM_NF').AsInteger         := Fnitem_nf;
    if Assigned(ADataSet.Params.FindParam('XPED_COMPRA'     )) then   ADataSet.ParamByName('XPED_COMPRA').AsString       := Copy(Fxped_compra   , 1, 15);
    if Assigned(ADataSet.Params.FindParam('NITEMPED_COMPRA' )) then   ADataSet.ParamByName('NITEMPED_COMPRA').AsInteger  := Fnitemped_compra;
    if Assigned(ADataSet.Params.FindParam('VL_DESP_NF'      )) then   ADataSet.ParamByName('VL_DESP_NF').AsFloat         := Fvl_desp_nf;
    if Assigned(ADataSet.Params.FindParam('UNIDADE'         )) then   ADataSet.ParamByName('UNIDADE').AsString           := Copy(Funidade       , 1, 3);
    if Assigned(ADataSet.Params.FindParam('ICM_PROD'        )) then   ADataSet.ParamByName('ICM_PROD').AsFloat           := Ficm_prod;
    if Assigned(ADataSet.Params.FindParam('SIT_TRIB'        )) then   ADataSet.ParamByName('SIT_TRIB').AsString          := Copy(Fsit_trib      , 1, 1);
    if Assigned(ADataSet.Params.FindParam('MD5'             )) then   ADataSet.ParamByName('MD5').AsString               := Copy(Fmd5           , 1, 256);
    if Assigned(ADataSet.Params.FindParam('VLTOT_PED_NF'    )) then   ADataSet.ParamByName('VLTOT_PED_NF').AsFloat       := Fvltot_ped_nf;
    if Assigned(ADataSet.Params.FindParam('TABPRATICADA'    )) then   ADataSet.ParamByName('TABPRATICADA').AsString      := Copy(Ftabpraticada  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('PRECOPORQTDE'    )) then   ADataSet.ParamByName('PRECOPORQTDE').AsString      := Copy(Fprecoporqtde  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('COD_SUGESTAO'    )) then   ADataSet.ParamByName('COD_SUGESTAO').AsInteger     := Fcod_sugestao;
    if Assigned(ADataSet.Params.FindParam('COD_EMP_SUGESTAO')) then   ADataSet.ParamByName('COD_EMP_SUGESTAO').AsInteger := Fcod_emp_sugestao;
    if Assigned(ADataSet.Params.FindParam('UNIDADE_CONV'    )) then   ADataSet.ParamByName('UNIDADE_CONV').AsString      := Copy(Funidade_conv  , 1, 3);
    if Assigned(ADataSet.Params.FindParam('OPERACAO_CONV'   )) then   ADataSet.ParamByName('OPERACAO_CONV').AsString     := Copy(Foperacao_conv , 1, 1);
    if Assigned(ADataSet.Params.FindParam('FATOR_CONV'      )) then   ADataSet.ParamByName('FATOR_CONV').AsFloat         := Ffator_conv;
    if Assigned(ADataSet.Params.FindParam('PESO_LIQ_PROD'   )) then   ADataSet.ParamByName('PESO_LIQ_PROD').AsFloat      := Fpeso_liq_prod;
    if Assigned(ADataSet.Params.FindParam('PESO_BRUT_PROD'  )) then   ADataSet.ParamByName('PESO_BRUT_PROD').AsFloat     := Fpeso_brut_prod;
    if Assigned(ADataSet.Params.FindParam('ATIVO'           )) then   ADataSet.ParamByName('ATIVO').AsInteger            := Fativo;       
    if Assigned(ADataSet.Params.FindParam('COD_CONTRATO'    )) then   ADataSet.ParamByName('COD_CONTRATO').AsInteger     := Fcod_contrato;
    if Assigned(ADataSet.Params.FindParam('COD_NF'          )) then   ADataSet.ParamByName('COD_NF').AsInteger           := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('N_NF'            )) then   ADataSet.ParamByName('N_NF').AsInteger             := Fn_nf;
    if Assigned(ADataSet.Params.FindParam('SERIE'           )) then   ADataSet.ParamByName('SERIE').AsString             := Fserie;
  end;
end;

{ TPedVendaProds_Model }

function TPedVendaProds_Model.GetItem(Index: Integer): TPedVendaProd_Model;
begin
  Result := TPedVendaProd_Model(inherited Items[Index]);
end;

function TPedVendaProds_Model.New: TPedVendaProd_Model;
begin
  Result := TPedVendaProd_Model.Create;
  Add(Result);
end;

procedure TPedVendaProds_Model.SetItem(Index: Integer; const Value: TPedVendaProd_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TPedVendaProd_Model);
finalization
  UnRegisterClass(TPedVendaProd_Model);

end.
