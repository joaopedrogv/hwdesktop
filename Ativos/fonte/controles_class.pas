unit controles_class;

interface

uses
  Contnrs,
  DB;

type
  TControles_class = class(TObject)
  private
    Fcodigo_ctrl              : Integer;
    Fcodigo_emp               : Integer;
    Ffluxo_ctrl               : string;
    Fn_banco_ctrl             : string;
    Fnome_ctrl                : string;
    Fend_ctrl                 : string;
    Fbairro_ctrl              : string;
    Fcid_ctrl                 : string;
    Fuf_ctrl                  : string;
    Fcep_ctrl                 : string;
    Fcontato_ctrl             : string;
    Ffone_ctrl                : string;
    Fn_conta_ctrl             : string;
    Fsaldo_ant_ctrl           : Double;
    Fsaldo_at_ctrl            : Double;
    Fsobra_ctrl               : Double;
    Fcompsaldo                : string;
    Fdocs                     : string;
    Fcxent                    : string;
    Fqperf                    : Integer;
    Fqseqperf                 : Integer;
    Fnat_lanc                 : string;
    Fcontr_banc               : string;
    Fcrd_f_vnd                : string;
    Ftp_plano                 : string;
    Fnat_ctrl                 : string;
    Fdeb_sai_cnt              : string;
    Fn_agencia_ctrl           : string;
    Fcaminho_licenca_ctrl     : string;
    Fcaminho_logotipo_ctrl    : string;
    Fusar_boleto              : string;
    Fidentif_cedente          : string;
    Fcaminho_remessa          : string;
    Fcod_cedente              : string;
    Finicio_nosso_numrero     : string;
    Ffim_nosso_numero         : string;
    Fproximo_nosso_numero     : string;
    Fcod_finalizador          : Integer;
    Fcodseq_balanco           : Integer;
    Ftipodocumentocobranca    : string;
    Foutrodadoconfiguracao1   : string;
    Foutrodadoconfiguracao2   : string;
    Flayoutarquivoremessa     : string;
    Find_tit                  : string;
    Fcartao_sped              : Integer;
    Fcartao_sped_part         : Integer;
    Fcodigo_baixa             : string;
    Fcodigo_recusa            : string;
    Fcod_cobrebem             : Integer;
    Fativo                    : Integer;
    Fbarrar_automatico        : string;
    Ftaxa_cartao              : Double;
    Fnome_contabil            : string;
    Fentra_prest_cxl          : string;
    Fn_conta_plc_tx_cartao    : Double;
    Fctrl_saida_tx_cartao     : Integer;
    Fgerar_comissao           : string;
    Fentra_pmv                : string;
    Finicial_tpvnd_mobile     : string;
    Fagencia_ctrl             : string;
    Fn_conta_plc_tarifa_cartao: Double;
    Ffp_padrao_cl             : string;
    Fnao_gera_finan           : string;
    Fbaixa_automatica         : string;
    Fn_conta_bx_auto          : Double;
    Fretornos                 : string;
    Ftipo_parcelamento        : string;
    Fdia_base_parcelamento    : string;
    Fnfce_tpag                : Integer;
    Fnfce_tband               : Integer;
    Fdias_ent_fluxo           : Integer;
    Fexibir_resumo_financeiro : string;
    Fcontrapartida            : string;
    Freceber_ctp              : string;
    Fdesat_vinc_balanco       : string;
    Ffp_regra_fidelidade      : string;
    Fdata_conf_sald_banc      : TDateTime;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property codigo_ctrl              : Integer   read Fcodigo_ctrl               write Fcodigo_ctrl;
    property codigo_emp               : Integer   read Fcodigo_emp                write Fcodigo_emp;
    property fluxo_ctrl               : string    read Ffluxo_ctrl                write Ffluxo_ctrl;
    property n_banco_ctrl             : string    read Fn_banco_ctrl              write Fn_banco_ctrl;
    property nome_ctrl                : string    read Fnome_ctrl                 write Fnome_ctrl;
    property end_ctrl                 : string    read Fend_ctrl                  write Fend_ctrl;
    property bairro_ctrl              : string    read Fbairro_ctrl               write Fbairro_ctrl;
    property cid_ctrl                 : string    read Fcid_ctrl                  write Fcid_ctrl;
    property uf_ctrl                  : string    read Fuf_ctrl                   write Fuf_ctrl;
    property cep_ctrl                 : string    read Fcep_ctrl                  write Fcep_ctrl;
    property contato_ctrl             : string    read Fcontato_ctrl              write Fcontato_ctrl;
    property fone_ctrl                : string    read Ffone_ctrl                 write Ffone_ctrl;
    property n_conta_ctrl             : string    read Fn_conta_ctrl              write Fn_conta_ctrl;
    property saldo_ant_ctrl           : Double    read Fsaldo_ant_ctrl            write Fsaldo_ant_ctrl;
    property saldo_at_ctrl            : Double    read Fsaldo_at_ctrl             write Fsaldo_at_ctrl;
    property sobra_ctrl               : Double    read Fsobra_ctrl                write Fsobra_ctrl;
    property compsaldo                : string    read Fcompsaldo                 write Fcompsaldo;
    property docs                     : string    read Fdocs                      write Fdocs;
    property cxent                    : string    read Fcxent                     write Fcxent;
    property qperf                    : Integer   read Fqperf                     write Fqperf;
    property qseqperf                 : Integer   read Fqseqperf                  write Fqseqperf;
    property nat_lanc                 : string    read Fnat_lanc                  write Fnat_lanc;
    property contr_banc               : string    read Fcontr_banc                write Fcontr_banc;
    property crd_f_vnd                : string    read Fcrd_f_vnd                 write Fcrd_f_vnd;
    property tp_plano                 : string    read Ftp_plano                  write Ftp_plano;
    property nat_ctrl                 : string    read Fnat_ctrl                  write Fnat_ctrl;
    property deb_sai_cnt              : string    read Fdeb_sai_cnt               write Fdeb_sai_cnt;
    property n_agencia_ctrl           : string    read Fn_agencia_ctrl            write Fn_agencia_ctrl;
    property caminho_licenca_ctrl     : string    read Fcaminho_licenca_ctrl      write Fcaminho_licenca_ctrl;
    property caminho_logotipo_ctrl    : string    read Fcaminho_logotipo_ctrl     write Fcaminho_logotipo_ctrl;
    property usar_boleto              : string    read Fusar_boleto               write Fusar_boleto;
    property identif_cedente          : string    read Fidentif_cedente           write Fidentif_cedente;
    property caminho_remessa          : string    read Fcaminho_remessa           write Fcaminho_remessa;
    property cod_cedente              : string    read Fcod_cedente               write Fcod_cedente;
    property inicio_nosso_numrero     : string    read Finicio_nosso_numrero      write Finicio_nosso_numrero;
    property fim_nosso_numero         : string    read Ffim_nosso_numero          write Ffim_nosso_numero;
    property proximo_nosso_numero     : string    read Fproximo_nosso_numero      write Fproximo_nosso_numero;
    property cod_finalizador          : Integer   read Fcod_finalizador           write Fcod_finalizador;
    property codseq_balanco           : Integer   read Fcodseq_balanco            write Fcodseq_balanco;
    property tipodocumentocobranca    : string    read Ftipodocumentocobranca     write Ftipodocumentocobranca;
    property outrodadoconfiguracao1   : string    read Foutrodadoconfiguracao1    write Foutrodadoconfiguracao1;
    property outrodadoconfiguracao2   : string    read Foutrodadoconfiguracao2    write Foutrodadoconfiguracao2;
    property layoutarquivoremessa     : string    read Flayoutarquivoremessa      write Flayoutarquivoremessa;
    property ind_tit                  : string    read Find_tit                   write Find_tit;
    property cartao_sped              : Integer   read Fcartao_sped               write Fcartao_sped;
    property cartao_sped_part         : Integer   read Fcartao_sped_part          write Fcartao_sped_part;
    property codigo_baixa             : string    read Fcodigo_baixa              write Fcodigo_baixa;
    property codigo_recusa            : string    read Fcodigo_recusa             write Fcodigo_recusa;
    property cod_cobrebem             : Integer   read Fcod_cobrebem              write Fcod_cobrebem;
    property ativo                    : Integer   read Fativo                     write Fativo;
    property barrar_automatico        : string    read Fbarrar_automatico         write Fbarrar_automatico;
    property taxa_cartao              : Double    read Ftaxa_cartao               write Ftaxa_cartao;
    property nome_contabil            : string    read Fnome_contabil             write Fnome_contabil;
    property entra_prest_cxl          : string    read Fentra_prest_cxl           write Fentra_prest_cxl;
    property n_conta_plc_tx_cartao    : Double    read Fn_conta_plc_tx_cartao     write Fn_conta_plc_tx_cartao;
    property ctrl_saida_tx_cartao     : Integer   read Fctrl_saida_tx_cartao      write Fctrl_saida_tx_cartao;
    property gerar_comissao           : string    read Fgerar_comissao            write Fgerar_comissao;
    property entra_pmv                : string    read Fentra_pmv                 write Fentra_pmv;
    property inicial_tpvnd_mobile     : string    read Finicial_tpvnd_mobile      write Finicial_tpvnd_mobile;
    property agencia_ctrl             : string    read Fagencia_ctrl              write Fagencia_ctrl;
    property n_conta_plc_tarifa_cartao: Double    read Fn_conta_plc_tarifa_cartao write Fn_conta_plc_tarifa_cartao;
    property fp_padrao_cl             : string    read Ffp_padrao_cl              write Ffp_padrao_cl;
    property nao_gera_finan           : string    read Fnao_gera_finan            write Fnao_gera_finan;
    property baixa_automatica         : string    read Fbaixa_automatica          write Fbaixa_automatica;
    property n_conta_bx_auto          : Double    read Fn_conta_bx_auto           write Fn_conta_bx_auto;
    property retornos                 : string    read Fretornos                  write Fretornos;
    property tipo_parcelamento        : string    read Ftipo_parcelamento         write Ftipo_parcelamento;
    property dia_base_parcelamento    : string    read Fdia_base_parcelamento     write Fdia_base_parcelamento;
    property nfce_tpag                : Integer   read Fnfce_tpag                 write Fnfce_tpag;
    property nfce_tband               : Integer   read Fnfce_tband                write Fnfce_tband;
    property dias_ent_fluxo           : Integer   read Fdias_ent_fluxo            write Fdias_ent_fluxo;
    property exibir_resumo_financeiro : string    read Fexibir_resumo_financeiro  write Fexibir_resumo_financeiro;
    property contrapartida            : string    read Fcontrapartida             write Fcontrapartida;
    property receber_ctp              : string    read Freceber_ctp               write Freceber_ctp;
    property desat_vinc_balanco       : string    read Fdesat_vinc_balanco        write Fdesat_vinc_balanco;
    property fp_regra_fidelidade      : string    read Ffp_regra_fidelidade       write Ffp_regra_fidelidade;
    property data_conf_sald_banc      : TDateTime read Fdata_conf_sald_banc       write Fdata_conf_sald_banc;
  end;

  TControles_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TControles_class;
    procedure SetItem(Index: Integer; const Value: TControles_class);
  public
    function New: TControles_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TControles_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TControles_class }

constructor TControles_class.Create;
begin
  Fativo := 1;
end;

destructor TControles_class.Destroy;
begin
  inherited;
end;

class function TControles_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@codigo_ctrl, @codigo_emp, @fluxo_ctrl, @n_banco_ctrl, @nome_ctrl, @end_ctrl, @bairro_ctrl, @cid_ctrl,' +
            ' @uf_ctrl, @cep_ctrl, @contato_ctrl, @fone_ctrl, @n_conta_ctrl, @saldo_ant_ctrl, @saldo_at_ctrl, @sobra_ctrl,' +
            ' @compsaldo, @docs, @cxent, @qperf, @qseqperf, @nat_lanc, @contr_banc, @crd_f_vnd, @tp_plano, @nat_ctrl,' +
            ' @deb_sai_cnt, @n_agencia_ctrl, @caminho_licenca_ctrl, @caminho_logotipo_ctrl, @usar_boleto,' +
            ' @identif_cedente, @caminho_remessa, @cod_cedente, @inicio_nosso_numrero, @fim_nosso_numero,' +
            ' @proximo_nosso_numero, @cod_finalizador, @codseq_balanco, @tipodocumentocobranca, @outrodadoconfiguracao1,' +
            ' @outrodadoconfiguracao2, @layoutarquivoremessa, @ind_tit, @cartao_sped, @cartao_sped_part, @codigo_baixa,' +
            ' @codigo_recusa, @cod_cobrebem, @ativo, @barrar_automatico, @taxa_cartao, @nome_contabil, @entra_prest_cxl,' +
            ' @n_conta_plc_tx_cartao, @ctrl_saida_tx_cartao, @gerar_comissao, @entra_pmv, @inicial_tpvnd_mobile,' +
            ' @agencia_ctrl, @n_conta_plc_tarifa_cartao, @fp_padrao_cl, @nao_gera_finan, @baixa_automatica,' +
            ' @n_conta_bx_auto, @retornos, @tipo_parcelamento, @dia_base_parcelamento, @nfce_tpag, @nfce_tband,' +
            ' @dias_ent_fluxo, @exibir_resumo_financeiro, @contrapartida, @receber_ctp, @desat_vinc_balanco,' +
            ' @fp_regra_fidelidade, @data_conf_sald_banc';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TControles_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcodigo_ctrl               := ADataSet.FieldByName('CODIGO_CTRL').AsInteger;
    Fcodigo_emp                := ADataSet.FieldByName('CODIGO_EMP').AsInteger;
    Ffluxo_ctrl                := Trim(ADataSet.FieldByName('FLUXO_CTRL').AsString);
    Fn_banco_ctrl              := Trim(ADataSet.FieldByName('N_BANCO_CTRL').AsString);
    Fnome_ctrl                 := Trim(ADataSet.FieldByName('NOME_CTRL').AsString);
    Fend_ctrl                  := Trim(ADataSet.FieldByName('END_CTRL').AsString);
    Fbairro_ctrl               := Trim(ADataSet.FieldByName('BAIRRO_CTRL').AsString);
    Fcid_ctrl                  := Trim(ADataSet.FieldByName('CID_CTRL').AsString);
    Fuf_ctrl                   := Trim(ADataSet.FieldByName('UF_CTRL').AsString);
    Fcep_ctrl                  := Trim(ADataSet.FieldByName('CEP_CTRL').AsString);
    Fcontato_ctrl              := Trim(ADataSet.FieldByName('CONTATO_CTRL').AsString);
    Ffone_ctrl                 := Trim(ADataSet.FieldByName('FONE_CTRL').AsString);
    Fn_conta_ctrl              := Trim(ADataSet.FieldByName('N_CONTA_CTRL').AsString);
    Fsaldo_ant_ctrl            := ADataSet.FieldByName('SALDO_ANT_CTRL').AsFloat;
    Fsaldo_at_ctrl             := ADataSet.FieldByName('SALDO_AT_CTRL').AsFloat;
    Fsobra_ctrl                := ADataSet.FieldByName('SOBRA_CTRL').AsFloat;
    Fcompsaldo                 := Trim(ADataSet.FieldByName('COMPSALDO').AsString);
    Fdocs                      := Trim(ADataSet.FieldByName('DOCS').AsString);
    Fcxent                     := Trim(ADataSet.FieldByName('CXENT').AsString);
    Fqperf                     := ADataSet.FieldByName('QPERF').AsInteger;
    Fqseqperf                  := ADataSet.FieldByName('QSEQPERF').AsInteger;
    Fnat_lanc                  := Trim(ADataSet.FieldByName('NAT_LANC').AsString);
    Fcontr_banc                := Trim(ADataSet.FieldByName('CONTR_BANC').AsString);
    Fcrd_f_vnd                 := Trim(ADataSet.FieldByName('CRD_F_VND').AsString);
    Ftp_plano                  := Trim(ADataSet.FieldByName('TP_PLANO').AsString);
    Fnat_ctrl                  := Trim(ADataSet.FieldByName('NAT_CTRL').AsString);
    Fdeb_sai_cnt               := Trim(ADataSet.FieldByName('DEB_SAI_CNT').AsString);
    Fn_agencia_ctrl            := Trim(ADataSet.FieldByName('N_AGENCIA_CTRL').AsString);
    Fcaminho_licenca_ctrl      := Trim(ADataSet.FieldByName('CAMINHO_LICENCA_CTRL').AsString);
    Fcaminho_logotipo_ctrl     := Trim(ADataSet.FieldByName('CAMINHO_LOGOTIPO_CTRL').AsString);
    Fusar_boleto               := Trim(ADataSet.FieldByName('USAR_BOLETO').AsString);
    Fidentif_cedente           := Trim(ADataSet.FieldByName('IDENTIF_CEDENTE').AsString);
    Fcaminho_remessa           := Trim(ADataSet.FieldByName('CAMINHO_REMESSA').AsString);
    Fcod_cedente               := Trim(ADataSet.FieldByName('COD_CEDENTE').AsString);
    Finicio_nosso_numrero      := Trim(ADataSet.FieldByName('INICIO_NOSSO_NUMRERO').AsString);
    Ffim_nosso_numero          := Trim(ADataSet.FieldByName('FIM_NOSSO_NUMERO').AsString);
    Fproximo_nosso_numero      := Trim(ADataSet.FieldByName('PROXIMO_NOSSO_NUMERO').AsString);
    Fcod_finalizador           := ADataSet.FieldByName('COD_FINALIZADOR').AsInteger;
    Fcodseq_balanco            := ADataSet.FieldByName('CODSEQ_BALANCO').AsInteger;
    Ftipodocumentocobranca     := Trim(ADataSet.FieldByName('TIPODOCUMENTOCOBRANCA').AsString);
    Foutrodadoconfiguracao1    := Trim(ADataSet.FieldByName('OUTRODADOCONFIGURACAO1').AsString);
    Foutrodadoconfiguracao2    := Trim(ADataSet.FieldByName('OUTRODADOCONFIGURACAO2').AsString);
    Flayoutarquivoremessa      := Trim(ADataSet.FieldByName('LAYOUTARQUIVOREMESSA').AsString);
    Find_tit                   := Trim(ADataSet.FieldByName('IND_TIT').AsString);
    Fcartao_sped               := ADataSet.FieldByName('CARTAO_SPED').AsInteger;
    Fcartao_sped_part          := ADataSet.FieldByName('CARTAO_SPED_PART').AsInteger;
    Fcodigo_baixa              := Trim(ADataSet.FieldByName('CODIGO_BAIXA').AsString);
    Fcodigo_recusa             := Trim(ADataSet.FieldByName('CODIGO_RECUSA').AsString);
    Fcod_cobrebem              := ADataSet.FieldByName('COD_COBREBEM').AsInteger;
    Fativo                     := ADataSet.FieldByName('ATIVO').AsInteger;
    Fbarrar_automatico         := Trim(ADataSet.FieldByName('BARRAR_AUTOMATICO').AsString);
    Ftaxa_cartao               := ADataSet.FieldByName('TAXA_CARTAO').AsFloat;
    Fnome_contabil             := Trim(ADataSet.FieldByName('NOME_CONTABIL').AsString);
    Fentra_prest_cxl           := Trim(ADataSet.FieldByName('ENTRA_PREST_CXL').AsString);
    Fn_conta_plc_tx_cartao     := ADataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat;
    Fctrl_saida_tx_cartao      := ADataSet.FieldByName('CTRL_SAIDA_TX_CARTAO').AsInteger;
    Fgerar_comissao            := Trim(ADataSet.FieldByName('GERAR_COMISSAO').AsString);
    Fentra_pmv                 := Trim(ADataSet.FieldByName('ENTRA_PMV').AsString);
    Finicial_tpvnd_mobile      := Trim(ADataSet.FieldByName('INICIAL_TPVND_MOBILE').AsString);
    Fagencia_ctrl              := Trim(ADataSet.FieldByName('AGENCIA_CTRL').AsString);
    Fn_conta_plc_tarifa_cartao := ADataSet.FieldByName('N_CONTA_PLC_TARIFA_CARTAO').AsFloat;
    Ffp_padrao_cl              := Trim(ADataSet.FieldByName('FP_PADRAO_CL').AsString);
    Fnao_gera_finan            := Trim(ADataSet.FieldByName('NAO_GERA_FINAN').AsString);
    Fbaixa_automatica          := Trim(ADataSet.FieldByName('BAIXA_AUTOMATICA').AsString);
    Fn_conta_bx_auto           := ADataSet.FieldByName('N_CONTA_BX_AUTO').AsFloat;
    Fretornos                  := Trim(ADataSet.FieldByName('RETORNOS').AsString);
    Ftipo_parcelamento         := Trim(ADataSet.FieldByName('TIPO_PARCELAMENTO').AsString);
    Fdia_base_parcelamento     := Trim(ADataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString);
    Fnfce_tpag                 := ADataSet.FieldByName('NFCE_TPAG').AsInteger;
    Fnfce_tband                := ADataSet.FieldByName('NFCE_TBAND').AsInteger;
    Fdias_ent_fluxo            := ADataSet.FieldByName('DIAS_ENT_FLUXO').AsInteger;
    Fexibir_resumo_financeiro  := Trim(ADataSet.FieldByName('EXIBIR_RESUMO_FINANCEIRO').AsString);
    Fcontrapartida             := Trim(ADataSet.FieldByName('CONTRAPARTIDA').AsString);
    Freceber_ctp               := Trim(ADataSet.FieldByName('RECEBER_CTP').AsString);
    Fdesat_vinc_balanco        := Trim(ADataSet.FieldByName('DESAT_VINC_BALANCO').AsString);
    Ffp_regra_fidelidade       := Trim(ADataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString);
    Fdata_conf_sald_banc       := ADataSet.FieldByName('DATA_CONF_SALD_BANC').AsDateTime;
  end
  else
  begin
    if Assigned(ADataSet.FindField('CODIGO_CTRL'              )) then Fcodigo_ctrl               := ADataSet.FieldByName('CODIGO_CTRL').AsInteger;
    if Assigned(ADataSet.FindField('CODIGO_EMP'               )) then Fcodigo_emp                := ADataSet.FieldByName('CODIGO_EMP').AsInteger;
    if Assigned(ADataSet.FindField('FLUXO_CTRL'               )) then Ffluxo_ctrl                := Trim(ADataSet.FieldByName('FLUXO_CTRL').AsString);
    if Assigned(ADataSet.FindField('N_BANCO_CTRL'             )) then Fn_banco_ctrl              := Trim(ADataSet.FieldByName('N_BANCO_CTRL').AsString);
    if Assigned(ADataSet.FindField('NOME_CTRL'                )) then Fnome_ctrl                 := Trim(ADataSet.FieldByName('NOME_CTRL').AsString);
    if Assigned(ADataSet.FindField('END_CTRL'                 )) then Fend_ctrl                  := Trim(ADataSet.FieldByName('END_CTRL').AsString);
    if Assigned(ADataSet.FindField('BAIRRO_CTRL'              )) then Fbairro_ctrl               := Trim(ADataSet.FieldByName('BAIRRO_CTRL').AsString);
    if Assigned(ADataSet.FindField('CID_CTRL'                 )) then Fcid_ctrl                  := Trim(ADataSet.FieldByName('CID_CTRL').AsString);
    if Assigned(ADataSet.FindField('UF_CTRL'                  )) then Fuf_ctrl                   := Trim(ADataSet.FieldByName('UF_CTRL').AsString);
    if Assigned(ADataSet.FindField('CEP_CTRL'                 )) then Fcep_ctrl                  := Trim(ADataSet.FieldByName('CEP_CTRL').AsString);
    if Assigned(ADataSet.FindField('CONTATO_CTRL'             )) then Fcontato_ctrl              := Trim(ADataSet.FieldByName('CONTATO_CTRL').AsString);
    if Assigned(ADataSet.FindField('FONE_CTRL'                )) then Ffone_ctrl                 := Trim(ADataSet.FieldByName('FONE_CTRL').AsString);
    if Assigned(ADataSet.FindField('N_CONTA_CTRL'             )) then Fn_conta_ctrl              := Trim(ADataSet.FieldByName('N_CONTA_CTRL').AsString);
    if Assigned(ADataSet.FindField('SALDO_ANT_CTRL'           )) then Fsaldo_ant_ctrl            := ADataSet.FieldByName('SALDO_ANT_CTRL').AsFloat;
    if Assigned(ADataSet.FindField('SALDO_AT_CTRL'            )) then Fsaldo_at_ctrl             := ADataSet.FieldByName('SALDO_AT_CTRL').AsFloat;
    if Assigned(ADataSet.FindField('SOBRA_CTRL'               )) then Fsobra_ctrl                := ADataSet.FieldByName('SOBRA_CTRL').AsFloat;
    if Assigned(ADataSet.FindField('COMPSALDO'                )) then Fcompsaldo                 := Trim(ADataSet.FieldByName('COMPSALDO').AsString);
    if Assigned(ADataSet.FindField('DOCS'                     )) then Fdocs                      := Trim(ADataSet.FieldByName('DOCS').AsString);
    if Assigned(ADataSet.FindField('CXENT'                    )) then Fcxent                     := Trim(ADataSet.FieldByName('CXENT').AsString);
    if Assigned(ADataSet.FindField('QPERF'                    )) then Fqperf                     := ADataSet.FieldByName('QPERF').AsInteger;
    if Assigned(ADataSet.FindField('QSEQPERF'                 )) then Fqseqperf                  := ADataSet.FieldByName('QSEQPERF').AsInteger;
    if Assigned(ADataSet.FindField('NAT_LANC'                 )) then Fnat_lanc                  := Trim(ADataSet.FieldByName('NAT_LANC').AsString);
    if Assigned(ADataSet.FindField('CONTR_BANC'               )) then Fcontr_banc                := Trim(ADataSet.FieldByName('CONTR_BANC').AsString);
    if Assigned(ADataSet.FindField('CRD_F_VND'                )) then Fcrd_f_vnd                 := Trim(ADataSet.FieldByName('CRD_F_VND').AsString);
    if Assigned(ADataSet.FindField('TP_PLANO'                 )) then Ftp_plano                  := Trim(ADataSet.FieldByName('TP_PLANO').AsString);
    if Assigned(ADataSet.FindField('NAT_CTRL'                 )) then Fnat_ctrl                  := Trim(ADataSet.FieldByName('NAT_CTRL').AsString);
    if Assigned(ADataSet.FindField('DEB_SAI_CNT'              )) then Fdeb_sai_cnt               := Trim(ADataSet.FieldByName('DEB_SAI_CNT').AsString);
    if Assigned(ADataSet.FindField('N_AGENCIA_CTRL'           )) then Fn_agencia_ctrl            := Trim(ADataSet.FieldByName('N_AGENCIA_CTRL').AsString);
    if Assigned(ADataSet.FindField('CAMINHO_LICENCA_CTRL'     )) then Fcaminho_licenca_ctrl      := Trim(ADataSet.FieldByName('CAMINHO_LICENCA_CTRL').AsString);
    if Assigned(ADataSet.FindField('CAMINHO_LOGOTIPO_CTRL'    )) then Fcaminho_logotipo_ctrl     := Trim(ADataSet.FieldByName('CAMINHO_LOGOTIPO_CTRL').AsString);
    if Assigned(ADataSet.FindField('USAR_BOLETO'              )) then Fusar_boleto               := Trim(ADataSet.FieldByName('USAR_BOLETO').AsString);
    if Assigned(ADataSet.FindField('IDENTIF_CEDENTE'          )) then Fidentif_cedente           := Trim(ADataSet.FieldByName('IDENTIF_CEDENTE').AsString);
    if Assigned(ADataSet.FindField('CAMINHO_REMESSA'          )) then Fcaminho_remessa           := Trim(ADataSet.FieldByName('CAMINHO_REMESSA').AsString);
    if Assigned(ADataSet.FindField('COD_CEDENTE'              )) then Fcod_cedente               := Trim(ADataSet.FieldByName('COD_CEDENTE').AsString);
    if Assigned(ADataSet.FindField('INICIO_NOSSO_NUMRERO'     )) then Finicio_nosso_numrero      := Trim(ADataSet.FieldByName('INICIO_NOSSO_NUMRERO').AsString);
    if Assigned(ADataSet.FindField('FIM_NOSSO_NUMERO'         )) then Ffim_nosso_numero          := Trim(ADataSet.FieldByName('FIM_NOSSO_NUMERO').AsString);
    if Assigned(ADataSet.FindField('PROXIMO_NOSSO_NUMERO'     )) then Fproximo_nosso_numero      := Trim(ADataSet.FieldByName('PROXIMO_NOSSO_NUMERO').AsString);
    if Assigned(ADataSet.FindField('COD_FINALIZADOR'          )) then Fcod_finalizador           := ADataSet.FieldByName('COD_FINALIZADOR').AsInteger;
    if Assigned(ADataSet.FindField('CODSEQ_BALANCO'           )) then Fcodseq_balanco            := ADataSet.FieldByName('CODSEQ_BALANCO').AsInteger;
    if Assigned(ADataSet.FindField('TIPODOCUMENTOCOBRANCA'    )) then Ftipodocumentocobranca     := Trim(ADataSet.FieldByName('TIPODOCUMENTOCOBRANCA').AsString);
    if Assigned(ADataSet.FindField('OUTRODADOCONFIGURACAO1'   )) then Foutrodadoconfiguracao1    := Trim(ADataSet.FieldByName('OUTRODADOCONFIGURACAO1').AsString);
    if Assigned(ADataSet.FindField('OUTRODADOCONFIGURACAO2'   )) then Foutrodadoconfiguracao2    := Trim(ADataSet.FieldByName('OUTRODADOCONFIGURACAO2').AsString);
    if Assigned(ADataSet.FindField('LAYOUTARQUIVOREMESSA'     )) then Flayoutarquivoremessa      := Trim(ADataSet.FieldByName('LAYOUTARQUIVOREMESSA').AsString);
    if Assigned(ADataSet.FindField('IND_TIT'                  )) then Find_tit                   := Trim(ADataSet.FieldByName('IND_TIT').AsString);
    if Assigned(ADataSet.FindField('CARTAO_SPED'              )) then Fcartao_sped               := ADataSet.FieldByName('CARTAO_SPED').AsInteger;
    if Assigned(ADataSet.FindField('CARTAO_SPED_PART'         )) then Fcartao_sped_part          := ADataSet.FieldByName('CARTAO_SPED_PART').AsInteger;
    if Assigned(ADataSet.FindField('CODIGO_BAIXA'             )) then Fcodigo_baixa              := Trim(ADataSet.FieldByName('CODIGO_BAIXA').AsString);
    if Assigned(ADataSet.FindField('CODIGO_RECUSA'            )) then Fcodigo_recusa             := Trim(ADataSet.FieldByName('CODIGO_RECUSA').AsString);
    if Assigned(ADataSet.FindField('COD_COBREBEM'             )) then Fcod_cobrebem              := ADataSet.FieldByName('COD_COBREBEM').AsInteger;
    if Assigned(ADataSet.FindField('ATIVO'                    )) then Fativo                     := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('BARRAR_AUTOMATICO'        )) then Fbarrar_automatico         := Trim(ADataSet.FieldByName('BARRAR_AUTOMATICO').AsString);
    if Assigned(ADataSet.FindField('TAXA_CARTAO'              )) then Ftaxa_cartao               := ADataSet.FieldByName('TAXA_CARTAO').AsFloat;
    if Assigned(ADataSet.FindField('NOME_CONTABIL'            )) then Fnome_contabil             := Trim(ADataSet.FieldByName('NOME_CONTABIL').AsString);
    if Assigned(ADataSet.FindField('ENTRA_PREST_CXL'          )) then Fentra_prest_cxl           := Trim(ADataSet.FieldByName('ENTRA_PREST_CXL').AsString);
    if Assigned(ADataSet.FindField('N_CONTA_PLC_TX_CARTAO'    )) then Fn_conta_plc_tx_cartao     := ADataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat;
    if Assigned(ADataSet.FindField('CTRL_SAIDA_TX_CARTAO'     )) then Fctrl_saida_tx_cartao      := ADataSet.FieldByName('CTRL_SAIDA_TX_CARTAO').AsInteger;
    if Assigned(ADataSet.FindField('GERAR_COMISSAO'           )) then Fgerar_comissao            := Trim(ADataSet.FieldByName('GERAR_COMISSAO').AsString);
    if Assigned(ADataSet.FindField('ENTRA_PMV'                )) then Fentra_pmv                 := Trim(ADataSet.FieldByName('ENTRA_PMV').AsString);
    if Assigned(ADataSet.FindField('INICIAL_TPVND_MOBILE'     )) then Finicial_tpvnd_mobile      := Trim(ADataSet.FieldByName('INICIAL_TPVND_MOBILE').AsString);
    if Assigned(ADataSet.FindField('AGENCIA_CTRL'             )) then Fagencia_ctrl              := Trim(ADataSet.FieldByName('AGENCIA_CTRL').AsString);
    if Assigned(ADataSet.FindField('N_CONTA_PLC_TARIFA_CARTAO')) then Fn_conta_plc_tarifa_cartao := ADataSet.FieldByName('N_CONTA_PLC_TARIFA_CARTAO').AsFloat;
    if Assigned(ADataSet.FindField('FP_PADRAO_CL'             )) then Ffp_padrao_cl              := Trim(ADataSet.FieldByName('FP_PADRAO_CL').AsString);
    if Assigned(ADataSet.FindField('NAO_GERA_FINAN'           )) then Fnao_gera_finan            := Trim(ADataSet.FieldByName('NAO_GERA_FINAN').AsString);
    if Assigned(ADataSet.FindField('BAIXA_AUTOMATICA'         )) then Fbaixa_automatica          := Trim(ADataSet.FieldByName('BAIXA_AUTOMATICA').AsString);
    if Assigned(ADataSet.FindField('N_CONTA_BX_AUTO'          )) then Fn_conta_bx_auto           := ADataSet.FieldByName('N_CONTA_BX_AUTO').AsFloat;
    if Assigned(ADataSet.FindField('RETORNOS'                 )) then Fretornos                  := Trim(ADataSet.FieldByName('RETORNOS').AsString);
    if Assigned(ADataSet.FindField('TIPO_PARCELAMENTO'        )) then Ftipo_parcelamento         := Trim(ADataSet.FieldByName('TIPO_PARCELAMENTO').AsString);
    if Assigned(ADataSet.FindField('DIA_BASE_PARCELAMENTO'    )) then Fdia_base_parcelamento     := Trim(ADataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString);
    if Assigned(ADataSet.FindField('NFCE_TPAG'                )) then Fnfce_tpag                 := ADataSet.FieldByName('NFCE_TPAG').AsInteger;
    if Assigned(ADataSet.FindField('NFCE_TBAND'               )) then Fnfce_tband                := ADataSet.FieldByName('NFCE_TBAND').AsInteger;
    if Assigned(ADataSet.FindField('DIAS_ENT_FLUXO'           )) then Fdias_ent_fluxo            := ADataSet.FieldByName('DIAS_ENT_FLUXO').AsInteger;
    if Assigned(ADataSet.FindField('EXIBIR_RESUMO_FINANCEIRO' )) then Fexibir_resumo_financeiro  := Trim(ADataSet.FieldByName('EXIBIR_RESUMO_FINANCEIRO').AsString);
    if Assigned(ADataSet.FindField('CONTRAPARTIDA'            )) then Fcontrapartida             := Trim(ADataSet.FieldByName('CONTRAPARTIDA').AsString);
    if Assigned(ADataSet.FindField('RECEBER_CTP'              )) then Freceber_ctp               := Trim(ADataSet.FieldByName('RECEBER_CTP').AsString);
    if Assigned(ADataSet.FindField('DESAT_VINC_BALANCO'       )) then Fdesat_vinc_balanco        := Trim(ADataSet.FieldByName('DESAT_VINC_BALANCO').AsString);
    if Assigned(ADataSet.FindField('FP_REGRA_FIDELIDADE'      )) then Ffp_regra_fidelidade       := Trim(ADataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString);
    if Assigned(ADataSet.FindField('DATA_CONF_SALD_BANC'      )) then Fdata_conf_sald_banc       := ADataSet.FieldByName('DATA_CONF_SALD_BANC').AsDateTime;
  end;
end;

{ TControles_classList }

function TControles_classList.GetItem(Index: Integer): TControles_class;
begin
  Result := TControles_class(inherited Items[Index]);
end;

function TControles_classList.New: TControles_class;
begin
  Result := TControles_class.Create;
  Add(Result);
end;

procedure TControles_classList.SetItem(Index: Integer; const Value: TControles_class);
begin
  Put(Index, Value);
end;

procedure TControles_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
