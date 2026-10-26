object DtmArqsDig: TDtmArqsDig
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 503
  Width = 1059
  object CdsAdigProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAdigProdutos'
    BeforeOpen = CdsAdigProdutosBeforeOpen
    OnCalcFields = CdsAdigProdutosCalcFields
    Left = 40
    Top = 80
    object CdsAdigProdutosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object CdsAdigProdutosGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object CdsAdigProdutosCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CdsAdigProdutosDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object CdsAdigProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object CdsAdigProdutosTIPO_FAB: TStringField
      FieldName = 'TIPO_FAB'
      Size = 1
    end
    object CdsAdigProdutosICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
    end
    object CdsAdigProdutosISENTO_PROD: TStringField
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object CdsAdigProdutosN_INCIDENCIA_PROD: TStringField
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object CdsAdigProdutosPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
    end
    object CdsAdigProdutosEST_F: TFloatField
      FieldName = 'EST_F'
    end
    object CdsAdigProdutosGTIN: TStringField
      FieldKind = fkCalculated
      FieldName = 'GTIN'
      Size = 14
      Calculated = True
    end
  end
  object DspAdigProdutos: TDataSetProvider
    DataSet = IbAdigProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 72
  end
  object IbAdigProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    SQL.Strings = (
      
        'select '#39'P'#39' tipo, p.grupo_prod, p.cod_prod, p.descr_prod, p.unida' +
        'de,'
      
        '  p.tipo_fab, p.icm_prod, p.isento_prod,  p.n_incidencia_prod, p' +
        '.prec_tab_prod,'
      
        '  (p.est_f + p.est_r) est_f from PRODUTOS p where p.cod_empresa ' +
        '= :cod_empresa'
      'union'
      
        'select '#39'S'#39' tipo, 0, cast(s.cod_servico as char(6)),s.desc_servic' +
        'o, s.unidade,'
      
        '  '#39'P'#39', s.aliq_iss, s.isento_serv, s.n_incidencia_serv, s.valor_s' +
        'ervico, 0'
      '  from tipo_servico s')
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object IbTransArqDigs: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 16
  end
  object QrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    Left = 216
    Top = 72
  end
  object IbAdigEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    SQL.Strings = (
      'select * from empresa')
    Left = 288
    Top = 24
  end
  object DspAdigEmpresa: TDataSetProvider
    DataSet = IbAdigEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 304
    Top = 80
  end
  object CdsAdigEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAdigEmpresa'
    BeforeOpen = CdsAdigProdutosBeforeOpen
    Left = 376
    Top = 24
    object CdsAdigEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsAdigEmpresaNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object CdsAdigEmpresaENDERECO_EMP: TStringField
      FieldName = 'ENDERECO_EMP'
      Size = 50
    end
    object CdsAdigEmpresaBAIRRO_EMP: TStringField
      FieldName = 'BAIRRO_EMP'
      Size = 30
    end
    object CdsAdigEmpresaCIDADE_EMP: TStringField
      FieldName = 'CIDADE_EMP'
      Size = 30
    end
    object CdsAdigEmpresaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object CdsAdigEmpresaUF_EMP: TIntegerField
      FieldName = 'UF_EMP'
    end
    object CdsAdigEmpresaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Size = 18
    end
    object CdsAdigEmpresaIE_EMP: TStringField
      FieldName = 'IE_EMP'
      Size = 18
    end
    object CdsAdigEmpresaIM_EMP: TStringField
      FieldName = 'IM_EMP'
      Size = 18
    end
    object CdsAdigEmpresaOBSERV_EMP: TStringField
      FieldName = 'OBSERV_EMP'
      Size = 60
    end
    object CdsAdigEmpresaTELEFONE_EMP: TStringField
      FieldName = 'TELEFONE_EMP'
      Size = 14
    end
    object CdsAdigEmpresaPROP_EMP: TStringField
      FieldName = 'PROP_EMP'
      Size = 40
    end
    object CdsAdigEmpresaCAIXA_INTEGRADO: TStringField
      FieldName = 'CAIXA_INTEGRADO'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaFILIAL: TStringField
      FieldName = 'FILIAL'
      Size = 21
    end
    object CdsAdigEmpresaG_CI: TIntegerField
      FieldName = 'G_CI'
    end
    object CdsAdigEmpresaG_CDV: TIntegerField
      FieldName = 'G_CDV'
    end
    object CdsAdigEmpresaG_CDF: TIntegerField
      FieldName = 'G_CDF'
    end
    object CdsAdigEmpresaG_CRO: TIntegerField
      FieldName = 'G_CRO'
    end
    object CdsAdigEmpresaG_CSE: TIntegerField
      FieldName = 'G_CSE'
    end
    object CdsAdigEmpresaEM_NF: TStringField
      FieldName = 'EM_NF'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaMOD_FAT: TStringField
      FieldName = 'MOD_FAT'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaQT_SERV_NF: TIntegerField
      FieldName = 'QT_SERV_NF'
    end
    object CdsAdigEmpresaQT_PROD_NF: TIntegerField
      FieldName = 'QT_PROD_NF'
    end
    object CdsAdigEmpresaDEB_CRED: TStringField
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaCONEXAO: TStringField
      FieldName = 'CONEXAO'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaN_PED: TStringField
      FieldName = 'N_PED'
      Size = 10
    end
    object CdsAdigEmpresaCONCESS: TStringField
      FieldName = 'CONCESS'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaOBS_PAD_OS: TMemoField
      FieldName = 'OBS_PAD_OS'
      BlobType = ftMemo
      Size = 8
    end
    object CdsAdigEmpresaVND_AB_CUSTO: TStringField
      FieldName = 'VND_AB_CUSTO'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaTX_JUROS: TFloatField
      FieldName = 'TX_JUROS'
    end
    object CdsAdigEmpresaMULTAS: TFloatField
      FieldName = 'MULTAS'
    end
    object CdsAdigEmpresaQTDE_ITENS_NF: TIntegerField
      FieldName = 'QTDE_ITENS_NF'
    end
    object CdsAdigEmpresaNOTA_FISCAL: TIntegerField
      FieldName = 'NOTA_FISCAL'
    end
    object CdsAdigEmpresaPORTA_IMPRESSAO: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object CdsAdigEmpresaCALCULADORA: TStringField
      FieldName = 'CALCULADORA'
      Size = 80
    end
    object CdsAdigEmpresaTAMANHOLETRA: TStringField
      FieldName = 'TAMANHOLETRA'
      Size = 10
    end
    object CdsAdigEmpresaQTDE_LINHASNF: TIntegerField
      FieldName = 'QTDE_LINHASNF'
    end
    object CdsAdigEmpresaISS_EMP: TFloatField
      FieldName = 'ISS_EMP'
    end
    object CdsAdigEmpresaQTMESSUG: TIntegerField
      FieldName = 'QTMESSUG'
    end
    object CdsAdigEmpresaCABREQ: TStringField
      FieldName = 'CABREQ'
      Size = 15
    end
    object CdsAdigEmpresaCABOS: TStringField
      FieldName = 'CABOS'
      Size = 15
    end
    object CdsAdigEmpresaDADVAP: TStringField
      FieldName = 'DADVAP'
      FixedChar = True
      Size = 3
    end
    object CdsAdigEmpresaPASTA_FRENTE: TStringField
      FieldName = 'PASTA_FRENTE'
      Size = 21
    end
    object CdsAdigEmpresaNUMERO_END: TIntegerField
      FieldName = 'NUMERO_END'
    end
    object CdsAdigEmpresaALIQPADRAO: TFloatField
      FieldName = 'ALIQPADRAO'
    end
    object CdsAdigEmpresaTP_SUG: TIntegerField
      FieldName = 'TP_SUG'
    end
    object CdsAdigEmpresaTE_SUG: TIntegerField
      FieldName = 'TE_SUG'
    end
    object CdsAdigEmpresaTA_SUG: TIntegerField
      FieldName = 'TA_SUG'
    end
    object CdsAdigEmpresaFP_SUG: TIntegerField
      FieldName = 'FP_SUG'
    end
    object CdsAdigEmpresaMES_RET_SERV1: TIntegerField
      FieldName = 'MES_RET_SERV1'
    end
    object CdsAdigEmpresaKM_RET_SERV1: TIntegerField
      FieldName = 'KM_RET_SERV1'
    end
    object CdsAdigEmpresaMES_RET_SERV3: TIntegerField
      FieldName = 'MES_RET_SERV3'
    end
    object CdsAdigEmpresaKM_RET_SERV3: TIntegerField
      FieldName = 'KM_RET_SERV3'
    end
    object CdsAdigEmpresaINTERV_KM_SERV: TIntegerField
      FieldName = 'INTERV_KM_SERV'
    end
    object CdsAdigEmpresaEMAIL_EMP: TStringField
      FieldName = 'EMAIL_EMP'
      Size = 50
    end
    object CdsAdigEmpresaSMTP_EMP: TStringField
      FieldName = 'SMTP_EMP'
      Size = 50
    end
    object CdsAdigEmpresaLOGIN_EMP: TStringField
      FieldName = 'LOGIN_EMP'
      Size = 15
    end
    object CdsAdigEmpresaCOD_SERV_PADRAO: TIntegerField
      FieldName = 'COD_SERV_PADRAO'
    end
    object CdsAdigEmpresaCPPADPROD: TStringField
      FieldName = 'CPPADPROD'
      Size = 40
    end
    object CdsAdigEmpresaCPPADCL: TStringField
      FieldName = 'CPPADCL'
      Size = 40
    end
    object CdsAdigEmpresaCPPADVEI: TStringField
      FieldName = 'CPPADVEI'
      Size = 40
    end
    object CdsAdigEmpresaLOCAL_PAG: TStringField
      FieldName = 'LOCAL_PAG'
      Size = 60
    end
    object CdsAdigEmpresaTOTDESC_EMP: TFloatField
      FieldName = 'TOTDESC_EMP'
    end
    object CdsAdigEmpresaUTIL_AUD: TStringField
      FieldName = 'UTIL_AUD'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaUTIL_PESQE: TStringField
      FieldName = 'UTIL_PESQE'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaARREDOND: TStringField
      FieldName = 'ARREDOND'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaTOTDESC_EMPA: TFloatField
      FieldName = 'TOTDESC_EMPA'
    end
    object CdsAdigEmpresaMIN_MARGEM_V: TFloatField
      FieldName = 'MIN_MARGEM_V'
    end
    object CdsAdigEmpresaMIN_MARGEM_A: TFloatField
      FieldName = 'MIN_MARGEM_A'
    end
    object CdsAdigEmpresaALT_PERC_MARGEM: TStringField
      FieldName = 'ALT_PERC_MARGEM'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaAPRES_ESTR: TStringField
      FieldName = 'APRES_ESTR'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaDIAS_DEMO_EMP: TIntegerField
      FieldName = 'DIAS_DEMO_EMP'
    end
    object CdsAdigEmpresaDIAS_RES_EMP: TIntegerField
      FieldName = 'DIAS_RES_EMP'
    end
    object CdsAdigEmpresaOBS_BOL: TStringField
      FieldName = 'OBS_BOL'
      Size = 45
    end
    object CdsAdigEmpresaOBS_DECL_OS: TMemoField
      FieldName = 'OBS_DECL_OS'
      BlobType = ftMemo
      Size = 8
    end
    object CdsAdigEmpresaDECL_OBS_OS: TStringField
      FieldName = 'DECL_OBS_OS'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaG_CI_VEIC: TIntegerField
      FieldName = 'G_CI_VEIC'
    end
    object CdsAdigEmpresaG_CDV_VEIC: TIntegerField
      FieldName = 'G_CDV_VEIC'
    end
    object CdsAdigEmpresaG_CDF_VEIC: TIntegerField
      FieldName = 'G_CDF_VEIC'
    end
    object CdsAdigEmpresaG_CRO_VEIC: TIntegerField
      FieldName = 'G_CRO_VEIC'
    end
    object CdsAdigEmpresaG_CSE_VEIC: TIntegerField
      FieldName = 'G_CSE_VEIC'
    end
    object CdsAdigEmpresaG_CI_SERV: TIntegerField
      FieldName = 'G_CI_SERV'
    end
    object CdsAdigEmpresaG_CDV_SERV: TIntegerField
      FieldName = 'G_CDV_SERV'
    end
    object CdsAdigEmpresaG_CDF_SERV: TIntegerField
      FieldName = 'G_CDF_SERV'
    end
    object CdsAdigEmpresaG_CRO_SERV: TIntegerField
      FieldName = 'G_CRO_SERV'
    end
    object CdsAdigEmpresaG_CSE_SERV: TIntegerField
      FieldName = 'G_CSE_SERV'
    end
    object CdsAdigEmpresaG_IR_ADM: TIntegerField
      FieldName = 'G_IR_ADM'
    end
    object CdsAdigEmpresaG_CTRS_ADM: TIntegerField
      FieldName = 'G_CTRS_ADM'
    end
    object CdsAdigEmpresaG_REM_ADM: TIntegerField
      FieldName = 'G_REM_ADM'
    end
    object CdsAdigEmpresaG_REIV_ADM: TIntegerField
      FieldName = 'G_REIV_ADM'
    end
    object CdsAdigEmpresaG_DF_ADM: TIntegerField
      FieldName = 'G_DF_ADM'
    end
    object CdsAdigEmpresaG_DV_ADM: TIntegerField
      FieldName = 'G_DV_ADM'
    end
    object CdsAdigEmpresaCOFINS_EMP: TFloatField
      FieldName = 'COFINS_EMP'
    end
    object CdsAdigEmpresaPIS_EMP: TFloatField
      FieldName = 'PIS_EMP'
    end
    object CdsAdigEmpresaCOMISS_PROD_EMP: TFloatField
      FieldName = 'COMISS_PROD_EMP'
    end
    object CdsAdigEmpresaENC_SOBR_COM: TFloatField
      FieldName = 'ENC_SOBR_COM'
    end
    object CdsAdigEmpresaCUSTO_EST_EMP: TFloatField
      FieldName = 'CUSTO_EST_EMP'
    end
    object CdsAdigEmpresaOUT_ENC_EMP: TFloatField
      FieldName = 'OUT_ENC_EMP'
    end
    object CdsAdigEmpresaDESP_FIXAS: TFloatField
      FieldName = 'DESP_FIXAS'
    end
    object CdsAdigEmpresaJR_CMP_EMP: TFloatField
      FieldName = 'JR_CMP_EMP'
    end
    object CdsAdigEmpresaIMP_RENDA: TFloatField
      FieldName = 'IMP_RENDA'
    end
    object CdsAdigEmpresaCONTR_S_EMP: TFloatField
      FieldName = 'CONTR_S_EMP'
    end
    object CdsAdigEmpresaSIMPLES_EMP: TFloatField
      FieldName = 'SIMPLES_EMP'
    end
    object CdsAdigEmpresaMIN_M_LQ_A: TFloatField
      FieldName = 'MIN_M_LQ_A'
    end
    object CdsAdigEmpresaMIN_M_LQ_V: TFloatField
      FieldName = 'MIN_M_LQ_V'
    end
    object CdsAdigEmpresaUS_MINM_PROD: TStringField
      FieldName = 'US_MINM_PROD'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaCPMF_EMP: TFloatField
      FieldName = 'CPMF_EMP'
    end
    object CdsAdigEmpresaN_CONC_ASS: TIntegerField
      FieldName = 'N_CONC_ASS'
    end
    object CdsAdigEmpresaCASAS_DECIMAIS: TIntegerField
      FieldName = 'CASAS_DECIMAIS'
    end
    object CdsAdigEmpresaSEG_PROD_SERV: TStringField
      FieldName = 'SEG_PROD_SERV'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaDIAS_PREC_TAB: TIntegerField
      FieldName = 'DIAS_PREC_TAB'
    end
    object CdsAdigEmpresaPRAZO_MED_VND: TIntegerField
      FieldName = 'PRAZO_MED_VND'
    end
    object CdsAdigEmpresaCUSTO_BOLETA: TFloatField
      FieldName = 'CUSTO_BOLETA'
    end
    object CdsAdigEmpresaTX_CARTAO: TFloatField
      FieldName = 'TX_CARTAO'
    end
    object CdsAdigEmpresaPERC_VND_CARTAO: TFloatField
      FieldName = 'PERC_VND_CARTAO'
    end
    object CdsAdigEmpresaTX_CARTAO_PARC: TFloatField
      FieldName = 'TX_CARTAO_PARC'
    end
    object CdsAdigEmpresaDIAS_REC_FIN: TIntegerField
      FieldName = 'DIAS_REC_FIN'
    end
    object CdsAdigEmpresaADIC_FIN: TFloatField
      FieldName = 'ADIC_FIN'
    end
    object CdsAdigEmpresaVND_MIN_FIN: TFloatField
      FieldName = 'VND_MIN_FIN'
    end
    object CdsAdigEmpresaVERSAO: TIntegerField
      FieldName = 'VERSAO'
    end
    object CdsAdigEmpresaARREDONDA_PRECO: TStringField
      FieldName = 'ARREDONDA_PRECO'
      FixedChar = True
      Size = 4
    end
    object CdsAdigEmpresaMENSAGEM_EMP: TStringField
      FieldName = 'MENSAGEM_EMP'
      Size = 40
    end
    object CdsAdigEmpresaMAXDESCPARC: TFloatField
      FieldName = 'MAXDESCPARC'
    end
    object CdsAdigEmpresaUS_ROMANEIO: TStringField
      FieldName = 'US_ROMANEIO'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaALMOX: TStringField
      FieldName = 'ALMOX'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsAdigEmpresaUS_DECL_REQ: TStringField
      FieldName = 'US_DECL_REQ'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaAT_PRECREP: TStringField
      FieldName = 'AT_PRECREP'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaUSPREVENDA: TStringField
      FieldName = 'USPREVENDA'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaUSPREVENDA_OS: TStringField
      FieldName = 'USPREVENDA_OS'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaAUT_SERV_CUPOM: TStringField
      FieldName = 'AUT_SERV_CUPOM'
      FixedChar = True
      Size = 1
    end
    object CdsAdigEmpresaSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
    end
    object CdsAdigEmpresaSEQ_ARQ_REMESSA: TIntegerField
      FieldName = 'SEQ_ARQ_REMESSA'
    end
    object CdsAdigEmpresaRECIBO_HTML_BOLETO: TBlobField
      FieldName = 'RECIBO_HTML_BOLETO'
      Size = 8
    end
    object CdsAdigEmpresaPROXIMO_NOSSO_NUMERO: TStringField
      FieldName = 'PROXIMO_NOSSO_NUMERO'
    end
    object CdsAdigEmpresaCGC_EMP: TStringField
      FieldName = 'CGC_EMP'
      Size = 18
    end
    object CdsAdigEmpresaENDRECO_EMP: TStringField
      FieldName = 'ENDRECO_EMP'
      Size = 50
    end
  end
  object IbDavsEmt: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    Left = 464
    Top = 24
  end
  object DspDavsEmitidos: TDataSetProvider
    DataSet = IbDavsEmt
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 456
    Top = 72
  end
  object CdsDavsEmt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDavsEmitidos'
    BeforeOpen = CdsAdigProdutosBeforeOpen
    Left = 528
    Top = 24
  end
  object IbTerminalF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    SQL.Strings = (
      'select * from terminalF')
    Left = 536
    Top = 72
  end
  object DspTerminalF: TDataSetProvider
    DataSet = IbTerminalF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 616
    Top = 22
  end
  object CdsTerminalF: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from terminalF'
    Params = <>
    ProviderName = 'DspTerminalF'
    BeforeOpen = CdsAdigProdutosBeforeOpen
    Left = 616
    Top = 72
    object CdsTerminalFCOD_TERMINAL: TIntegerField
      DisplayLabel = 'C'#243'digo Terminal'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object CdsTerminalFCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsTerminalFNOME_TERMINAL: TStringField
      DisplayLabel = 'Nome do Terminal'
      FieldName = 'NOME_TERMINAL'
      Required = True
      FixedChar = True
      Size = 30
    end
    object CdsTerminalFEND_TERMINAL: TStringField
      DisplayLabel = 'Endere'#231'o do Terminal'
      FieldName = 'END_TERMINAL'
      FixedChar = True
      Size = 40
    end
  end
  object IbanexoVI: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    Left = 696
    Top = 24
  end
  object DspAnexoVI: TDataSetProvider
    DataSet = IbanexoVI
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 704
    Top = 80
  end
  object CdsAnexoVI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAnexoVI'
    BeforeOpen = CdsAdigProdutosBeforeOpen
    Left = 766
    Top = 23
  end
  object DtTerminalF: TDataSource
    DataSet = CdsTerminalF
    Left = 616
    Top = 120
  end
  object dsProdAdig: TDataSource
    AutoEdit = False
    DataSet = CdsAdigProdutos
    Left = 216
    Top = 160
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    Left = 216
    Top = 112
  end
  object qrInventario: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    SQL.Strings = (
      '')
    Left = 422
    Top = 144
  end
  object qrBuscaInvet: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransArqDigs
    SQL.Strings = (
      '')
    Left = 374
    Top = 145
  end
end
