unit contas_a_pagar_class;

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
  TContas_a_pagar_class = class(TBaseFb_class)
  private
    Fcod_contrp           : Integer;
    Fnum_nota_nfe         : Variant;
    Fcod_forn_nfe         : Variant;
    Fcodigo_ctrl          : Integer;
    Fn_conta_plc          : Double;
    Fnome_for_ctp         : string;
    Fdata_ent_ctp         : Variant;
    Fn_doc_ctp            : string;
    Fvalor_ctp            : Variant;
    Fstatus_ctp           : string;
    Fdatq_ctp             : Variant;
    Fnatl_ctp             : string;
    Fdata_venc_ctp        : Variant;
    Ftipo_ctp             : string;
    Flote                 : Variant;
    Ftipo_for_dup         : string;
    Fsubt_for_dup         : string;
    Fselec                : string;
    Fhistorico_ctp        : string;
    Fdata_cxl             : Variant;
    Ftip_cnt              : string;
    Fn_cheq_ctp           : string;
    Fnominal_ctp          : string;
    Fdt_compens           : Variant;
    Fchassi_conc          : string;
    Fdata_baixa           : Variant;
    Fvalor_pago           : Variant;
    Faceite_ctp           : string;
    Fvl_contabil          : Variant;
    Fcodigo_emp           : Integer;
    Fcpf_cgc_f            : string;
    Fcod_emp_mult         : Variant;
    Fnome_banco_dupl      : string;
    Fstatus_honda         : string;
    Fdata_prev_pg         : Variant;
    Fcod_equip            : Variant;
    Fhistrat              : string;
    Fn_conta_plc_or       : Variant;
    Ftprat                : string;
    Fdtreferencia         : Variant;
    Fentra_previsao       : string;
    Fserie                : string;
    Fn_doc_ctp_orig       : string;
    Fvalor_ctp_orig       : Variant;
    Fref_frete            : string;
    Fop_cx                : Variant;
    Fcod_obs              : Variant;
    Fnsu_ro_adm           : string;
    Farq_extrato_adm      : string;
    Fro_adm               : Variant;
    Fcod_adm              : Variant;
    Fcod_despesa          : Variant;
    Falterado             : string;
    Fcod_usuario_process  : Variant;
    Fdata_process         : Variant;
    Fhora_process         : string;
    Fnomearq_process      : string;
    Fus_cad               : Variant;
    Fus_bx                : Variant;
    Fcod_contrapartida    : Variant;
    Fnped                 : Variant;
    Ftipo_nped            : string;
    Fcod_contrapartida_ctp: Variant;
    Fnparcela             : Variant;
    Fqtde_parc            : Variant;
    Fhwcredid             : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_contrp           : Integer read Fcod_contrp            write Fcod_contrp;
    property num_nota_nfe         : Variant read Fnum_nota_nfe          write Fnum_nota_nfe;
    property cod_forn_nfe         : Variant read Fcod_forn_nfe          write Fcod_forn_nfe;
    property codigo_ctrl          : Integer read Fcodigo_ctrl           write Fcodigo_ctrl;
    property n_conta_plc          : Double  read Fn_conta_plc           write Fn_conta_plc;
    property nome_for_ctp         : string  read Fnome_for_ctp          write Fnome_for_ctp;
    property data_ent_ctp         : Variant read Fdata_ent_ctp          write Fdata_ent_ctp;
    property n_doc_ctp            : string  read Fn_doc_ctp             write Fn_doc_ctp;
    property valor_ctp            : Variant read Fvalor_ctp             write Fvalor_ctp;
    property status_ctp           : string  read Fstatus_ctp            write Fstatus_ctp;
    property datq_ctp             : Variant read Fdatq_ctp              write Fdatq_ctp;
    property natl_ctp             : string  read Fnatl_ctp              write Fnatl_ctp;
    property data_venc_ctp        : Variant read Fdata_venc_ctp         write Fdata_venc_ctp;
    property tipo_ctp             : string  read Ftipo_ctp              write Ftipo_ctp;
    property lote                 : Variant read Flote                  write Flote;
    property tipo_for_dup         : string  read Ftipo_for_dup          write Ftipo_for_dup;
    property subt_for_dup         : string  read Fsubt_for_dup          write Fsubt_for_dup;
    property selec                : string  read Fselec                 write Fselec;
    property historico_ctp        : string  read Fhistorico_ctp         write Fhistorico_ctp;
    property data_cxl             : Variant read Fdata_cxl              write Fdata_cxl;
    property tip_cnt              : string  read Ftip_cnt               write Ftip_cnt;
    property n_cheq_ctp           : string  read Fn_cheq_ctp            write Fn_cheq_ctp;
    property nominal_ctp          : string  read Fnominal_ctp           write Fnominal_ctp;
    property dt_compens           : Variant read Fdt_compens            write Fdt_compens;
    property chassi_conc          : string  read Fchassi_conc           write Fchassi_conc;
    property data_baixa           : Variant read Fdata_baixa            write Fdata_baixa;
    property valor_pago           : Variant read Fvalor_pago            write Fvalor_pago;
    property aceite_ctp           : string  read Faceite_ctp            write Faceite_ctp;
    property vl_contabil          : Variant read Fvl_contabil           write Fvl_contabil;
    property codigo_emp           : Integer read Fcodigo_emp            write Fcodigo_emp;
    property cpf_cgc_f            : string  read Fcpf_cgc_f             write Fcpf_cgc_f;
    property cod_emp_mult         : Variant read Fcod_emp_mult          write Fcod_emp_mult;
    property nome_banco_dupl      : string  read Fnome_banco_dupl       write Fnome_banco_dupl;
    property status_honda         : string  read Fstatus_honda          write Fstatus_honda;
    property data_prev_pg         : Variant read Fdata_prev_pg          write Fdata_prev_pg;
    property cod_equip            : Variant read Fcod_equip             write Fcod_equip;
    property histrat              : string  read Fhistrat               write Fhistrat;
    property n_conta_plc_or       : Variant read Fn_conta_plc_or        write Fn_conta_plc_or;
    property tprat                : string  read Ftprat                 write Ftprat;
    property dtreferencia         : Variant read Fdtreferencia          write Fdtreferencia;
    property entra_previsao       : string  read Fentra_previsao        write Fentra_previsao;
    property serie                : string  read Fserie                 write Fserie;
    property n_doc_ctp_orig       : string  read Fn_doc_ctp_orig        write Fn_doc_ctp_orig;
    property valor_ctp_orig       : Variant read Fvalor_ctp_orig        write Fvalor_ctp_orig;
    property ref_frete            : string  read Fref_frete             write Fref_frete;
    property op_cx                : Variant read Fop_cx                 write Fop_cx;
    property cod_obs              : Variant read Fcod_obs               write Fcod_obs;
    property nsu_ro_adm           : string  read Fnsu_ro_adm            write Fnsu_ro_adm;
    property arq_extrato_adm      : string  read Farq_extrato_adm       write Farq_extrato_adm;
    property ro_adm               : Variant read Fro_adm                write Fro_adm;
    property cod_adm              : Variant read Fcod_adm               write Fcod_adm;
    property cod_despesa          : Variant read Fcod_despesa           write Fcod_despesa;
    property alterado             : string  read Falterado              write Falterado;
    property cod_usuario_process  : Variant read Fcod_usuario_process   write Fcod_usuario_process;
    property data_process         : Variant read Fdata_process          write Fdata_process;
    property hora_process         : string  read Fhora_process          write Fhora_process;
    property nomearq_process      : string  read Fnomearq_process       write Fnomearq_process;
    property us_cad               : Variant read Fus_cad                write Fus_cad;
    property us_bx                : Variant read Fus_bx                 write Fus_bx;
    property cod_contrapartida    : Variant read Fcod_contrapartida     write Fcod_contrapartida;
    property nped                 : Variant read Fnped                  write Fnped;
    property tipo_nped            : string  read Ftipo_nped             write Ftipo_nped;
    property cod_contrapartida_ctp: Variant read Fcod_contrapartida_ctp write Fcod_contrapartida_ctp;
    property nparcela             : Variant read Fnparcela              write Fnparcela;
    property qtde_parc            : Variant read Fqtde_parc             write Fqtde_parc;
    property hwcredid             : Variant read Fhwcredid              write Fhwcredid;
  end;

  TContas_a_pagars_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TContas_a_pagar_class;
    procedure SetItem(Index: Integer; const Value: TContas_a_pagar_class);
  public
    function New: TContas_a_pagar_class;

    property Items[Index: Integer]: TContas_a_pagar_class read GetItem write SetItem;
  end;

implementation

{ TContas_a_pagar_class }

procedure TContas_a_pagar_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CONTAS_A_PAGAR');
  with FTable.Fields do
  begin
    AddField('COD_CONTRP'           , fkInteger , 0  , False, True       );
    AddField('NUM_NOTA_NFE'         , fkInteger                          );
    AddField('COD_FORN_NFE'         , fkInteger                          );
    AddField('CODIGO_CTRL'          , fkInteger , 0  , False, False, True);
    AddField('N_CONTA_PLC'          , fkFloat   , 0  , False, False, True);
    AddField('NOME_FOR_CTP'         , fkString  , 35                     );
    AddField('DATA_ENT_CTP'         , fkDateTime                         );
    AddField('N_DOC_CTP'            , fkString  , 20                     );
    AddField('VALOR_CTP'            , fkFloat                            );
    AddField('STATUS_CTP'           , fkString  , 10                     );
    AddField('DATQ_CTP'             , fkDateTime                         );
    AddField('NATL_CTP'             , fkString  , 1                      );
    AddField('DATA_VENC_CTP'        , fkDateTime                         );
    AddField('TIPO_CTP'             , fkString  , 1                      );
    AddField('LOTE'                 , fkInteger                          );
    AddField('TIPO_FOR_DUP'         , fkString  , 2                      );
    AddField('SUBT_FOR_DUP'         , fkString  , 2                      );
    AddField('SELEC'                , fkString  , 1                      );
    AddField('HISTORICO_CTP'        , fkString  , 100                    );
    AddField('DATA_CXL'             , fkDateTime                         );
    AddField('TIP_CNT'              , fkString  , 1                      );
    AddField('N_CHEQ_CTP'           , fkString  , 10                     );
    AddField('NOMINAL_CTP'          , fkString  , 35                     );
    AddField('DT_COMPENS'           , fkDateTime                         );
    AddField('CHASSI_CONC'          , fkString  , 17                     );
    AddField('DATA_BAIXA'           , fkDateTime                         );
    AddField('VALOR_PAGO'           , fkFloat                            );
    AddField('ACEITE_CTP'           , fkString  , 1                      );
    AddField('VL_CONTABIL'          , fkFloat                            );
    AddField('CODIGO_EMP'           , fkInteger , 0  , False, True , True);
    AddField('CPF_CGC_F'            , fkString  , 18                     );
    AddField('COD_EMP_MULT'         , fkInteger                          );
    AddField('NOME_BANCO_DUPL'      , fkString  , 10                     );
    AddField('STATUS_HONDA'         , fkString  , 10                     );
    AddField('DATA_PREV_PG'         , fkDateTime                         );
    AddField('COD_EQUIP'            , fkInteger                          );
    AddField('HISTRAT'              , fkString  , 50                     );
    AddField('N_CONTA_PLC_OR'       , fkFloat                            );
    AddField('TPRAT'                , fkString  , 1                      );
    AddField('DTREFERENCIA'         , fkDateTime                         );
    AddField('ENTRA_PREVISAO'       , fkString  , 1                      );
    AddField('SERIE'                , fkString  , 5                      );
    AddField('N_DOC_CTP_ORIG'       , fkString  , 20                     );
    AddField('VALOR_CTP_ORIG'       , fkFloat                            );
    AddField('REF_FRETE'            , fkString  , 1                      );
    AddField('OP_CX'                , fkInteger                          );
    AddField('COD_OBS'              , fkInteger                          );
    AddField('NSU_RO_ADM'           , fkString  , 15                     );
    AddField('ARQ_EXTRATO_ADM'      , fkString  , 255                    );
    AddField('RO_ADM'               , fkInteger                          );
    AddField('COD_ADM'              , fkInteger                          );
    AddField('COD_DESPESA'          , fkInteger                          );
    AddField('ALTERADO'             , fkString  , 1                      );
    AddField('COD_USUARIO_PROCESS'  , fkInteger                          );
    AddField('DATA_PROCESS'         , fkDateTime                         );
    AddField('HORA_PROCESS'         , fkString  , 8                      );
    AddField('NOMEARQ_PROCESS'      , fkString  , 50                     );
    AddField('US_CAD'               , fkInteger                          );
    AddField('US_BX'                , fkInteger                          );
    AddField('COD_CONTRAPARTIDA'    , fkInteger                          );
    AddField('NPED'                 , fkInteger                          );
    AddField('TIPO_NPED'            , fkString  , 3                      );
    AddField('COD_CONTRAPARTIDA_CTP', fkInteger                          );
    AddField('NPARCELA'             , fkInteger                          );
    AddField('QTDE_PARC'            , fkInteger                          );
    AddField('HWCREDID'             , fkInteger                          );
  end;
end;

constructor TContas_a_pagar_class.Create;
begin
  InitializeObjects;
end;

{ TContas_a_pagars_class }

function TContas_a_pagars_class.GetItem(Index: Integer): TContas_a_pagar_class;
begin
  Result := TContas_a_pagar_class(inherited Items[Index]);
end;

function TContas_a_pagars_class.New: TContas_a_pagar_class;
begin
  Result := TContas_a_pagar_class.Create;
  Add(Result);
end;

procedure TContas_a_pagars_class.SetItem(Index: Integer; const Value: TContas_a_pagar_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TContas_a_pagar_class);
finalization
  UnRegisterClass(TContas_a_pagar_class);

end.
