object DtmFiscalHwF: TDtmFiscalHwF
  OldCreateOrder = False
  Height = 327
  Width = 881
  object cdsColab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColab'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 428
    Top = 167
    object cdsColabCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColabCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsColabCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsColabCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
      Required = True
    end
    object cdsColabNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColabEND_VENDEDOR: TStringField
      FieldName = 'END_VENDEDOR'
      Size = 35
    end
    object cdsColabBAIRRO_VENDEDOR: TStringField
      FieldName = 'BAIRRO_VENDEDOR'
      Size = 35
    end
    object cdsColabCIDADE_VENDEDOR: TStringField
      FieldName = 'CIDADE_VENDEDOR'
      Size = 35
    end
    object cdsColabCEP_VENDEDOR: TStringField
      FieldName = 'CEP_VENDEDOR'
      FixedChar = True
      Size = 9
    end
    object cdsColabFONE_VENDEDOR: TStringField
      FieldName = 'FONE_VENDEDOR'
      FixedChar = True
      Size = 14
    end
    object cdsColabCPF_VENDEDOR: TStringField
      FieldName = 'CPF_VENDEDOR'
      FixedChar = True
      Size = 11
    end
    object cdsColabPC_VEND_SERV: TFloatField
      FieldName = 'PC_VEND_SERV'
    end
    object cdsColabPC_VEND_PROD: TFloatField
      FieldName = 'PC_VEND_PROD'
    end
    object cdsColabOBS_VENDEDOR: TMemoField
      FieldName = 'OBS_VENDEDOR'
      BlobType = ftMemo
      Size = 8
    end
    object cdsColabDATA_MOD_COL: TDateTimeField
      FieldName = 'DATA_MOD_COL'
    end
    object cdsColabDATA_CAD_COL: TDateTimeField
      FieldName = 'DATA_CAD_COL'
    end
    object cdsColabDAT_NASC_COL: TDateTimeField
      FieldName = 'DAT_NASC_COL'
    end
    object cdsColabNOME_ULT_EMP: TStringField
      FieldName = 'NOME_ULT_EMP'
      Size = 30
    end
    object cdsColabENDERECO_ULT_EMP: TStringField
      FieldName = 'ENDERECO_ULT_EMP'
      Size = 30
    end
    object cdsColabFONE_ULT_EMP: TStringField
      FieldName = 'FONE_ULT_EMP'
      FixedChar = True
      Size = 14
    end
    object cdsColabCONT_ULT_EMP: TStringField
      FieldName = 'CONT_ULT_EMP'
    end
    object cdsColabULT_SAL_EMP: TFloatField
      FieldName = 'ULT_SAL_EMP'
    end
    object cdsColabDTENT_ULT_EMP: TDateTimeField
      FieldName = 'DTENT_ULT_EMP'
    end
    object cdsColabDTSAI_ULT_EMP: TDateTimeField
      FieldName = 'DTSAI_ULT_EMP'
    end
    object cdsColabNOME_PLT_EMP: TStringField
      FieldName = 'NOME_PLT_EMP'
      Size = 30
    end
    object cdsColabENDERECO_PLT_EMP: TStringField
      FieldName = 'ENDERECO_PLT_EMP'
      Size = 30
    end
    object cdsColabFONE_PLT_EMP: TStringField
      FieldName = 'FONE_PLT_EMP'
      FixedChar = True
      Size = 14
    end
    object cdsColabCONT_PLT_EMP: TStringField
      FieldName = 'CONT_PLT_EMP'
    end
    object cdsColabPLT_SAL_EMP: TFloatField
      FieldName = 'PLT_SAL_EMP'
    end
    object cdsColabDTENT_PLT_EMP: TDateTimeField
      FieldName = 'DTENT_PLT_EMP'
    end
    object cdsColabDTSAI_PLT_EMP: TDateTimeField
      FieldName = 'DTSAI_PLT_EMP'
    end
    object cdsColabDT_ULT_FERIAS: TDateTimeField
      FieldName = 'DT_ULT_FERIAS'
    end
    object cdsColabTMP_ULT_FERIAS: TIntegerField
      FieldName = 'TMP_ULT_FERIAS'
    end
    object cdsColabVL_ULT_FERIAS: TFloatField
      FieldName = 'VL_ULT_FERIAS'
    end
    object cdsColabDTVND_ULT_FERIAS: TDateTimeField
      FieldName = 'DTVND_ULT_FERIAS'
    end
    object cdsColabDT_13_SAL: TDateTimeField
      FieldName = 'DT_13_SAL'
    end
    object cdsColabVL_13_SAL: TFloatField
      FieldName = 'VL_13_SAL'
    end
    object cdsColabVL_SAL: TFloatField
      FieldName = 'VL_SAL'
    end
    object cdsColabCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsColabCOD_BAIRRO: TSmallintField
      FieldName = 'COD_BAIRRO'
    end
    object cdsColabSALARIO_REGISTRO: TFloatField
      FieldName = 'SALARIO_REGISTRO'
    end
    object cdsColabVALOR_SALARIO: TFloatField
      FieldName = 'VALOR_SALARIO'
    end
    object cdsColabQUANT_SAL_FAMILIA: TFloatField
      FieldName = 'QUANT_SAL_FAMILIA'
    end
    object cdsColabVALOR_SALARIO_FAMILIA: TFloatField
      FieldName = 'VALOR_SALARIO_FAMILIA'
    end
    object cdsColabPERC_PESO: TFloatField
      FieldName = 'PERC_PESO'
    end
    object cdsColabATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsColabEMAIL_COL: TStringField
      FieldName = 'EMAIL_COL'
      Size = 50
    end
  end
  object cdsCodBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCodBarra'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 360
    Top = 167
    object cdsCodBarraCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsCodBarraGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCodBarraCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCodBarraCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCodBarraDAT_CAD_CDBAR: TDateTimeField
      FieldName = 'DAT_CAD_CDBAR'
    end
    object cdsCodBarraDAT_MOD_CDBAR: TDateTimeField
      FieldName = 'DAT_MOD_CDBAR'
    end
    object cdsCodBarraATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object cdsServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServ'
    BeforeOpen = cdsEmpBeforeOpen
    OnCalcFields = cdsServCalcFields
    Left = 564
    Top = 167
    object cdsServCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
      DisplayFormat = '00000000000000'
    end
    object cdsServDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsServVALOR_SERVICO: TFloatField
      FieldName = 'VALOR_SERVICO'
      currency = True
    end
    object cdsServSHONDA: TStringField
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object cdsServALTCOD: TStringField
      FieldName = 'ALTCOD'
      FixedChar = True
      Size = 1
    end
    object cdsServDATA_CAD_TIPO: TDateTimeField
      FieldName = 'DATA_CAD_TIPO'
    end
    object cdsServDATA_MOD_TIPO: TDateTimeField
      FieldName = 'DATA_MOD_TIPO'
    end
    object cdsServSTIPO: TStringField
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object cdsServTMO: TFloatField
      FieldName = 'TMO'
    end
    object cdsServALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
    end
    object cdsServATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsServCOD_ESPE_SEG: TIntegerField
      FieldName = 'COD_ESPE_SEG'
    end
    object cdsServCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsServSERV_PROP_TERC: TStringField
      FieldName = 'SERV_PROP_TERC'
      FixedChar = True
      Size = 1
    end
    object cdsServISENTO_SERV: TStringField
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsServN_INCIDENCIA_SERV: TStringField
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsServARREDONDAR_TRUNCAR: TStringField
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object cdsServGTIN: TStringField
      FieldKind = fkCalculated
      FieldName = 'GTIN'
      Size = 14
      Calculated = True
    end
    object cdsServSITTRIB: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'SITTRIB'
      Calculated = True
    end
    object cdsServIAT: TStringField
      FieldKind = fkCalculated
      FieldName = 'IAT'
      Size = 1
      Calculated = True
    end
    object cdsServIPPT: TStringField
      FieldKind = fkCalculated
      FieldName = 'IPPT'
      Size = 1
      Calculated = True
    end
    object cdsServCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
  end
  object cdsSenha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSenha'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 496
    Top = 167
    object cdsSenhaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsSenhaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsSenhaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSenhaSENHA: TStringField
      FieldName = 'SENHA'
      FixedChar = True
      Size = 6
    end
    object cdsSenhaNOME_US: TStringField
      FieldName = 'NOME_US'
      FixedChar = True
      Size = 30
    end
    object cdsSenhaNIVEL_US: TIntegerField
      FieldName = 'NIVEL_US'
    end
    object cdsSenhaPROGS: TStringField
      FieldName = 'PROGS'
      FixedChar = True
      Size = 5
    end
    object cdsSenhaSERIAL1: TStringField
      FieldName = 'SERIAL1'
      FixedChar = True
      Size = 4
    end
    object cdsSenhaSERIAL2: TStringField
      FieldName = 'SERIAL2'
      FixedChar = True
      Size = 4
    end
    object cdsSenhaCUPOM: TStringField
      FieldName = 'CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaQTD_CUPOM: TIntegerField
      FieldName = 'QTD_CUPOM'
    end
    object cdsSenhaESTOQ_NEG: TStringField
      FieldName = 'ESTOQ_NEG'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaGAVETA_CUPOM: TStringField
      FieldName = 'GAVETA_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaCUPOM_SERV: TStringField
      FieldName = 'CUPOM_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaCONTRA_SENHA: TStringField
      FieldName = 'CONTRA_SENHA'
      FixedChar = True
      Size = 6
    end
    object cdsSenhaDEPART: TStringField
      FieldName = 'DEPART'
      FixedChar = True
      Size = 10
    end
    object cdsSenhaIMAGENS_US: TStringField
      FieldName = 'IMAGENS_US'
      FixedChar = True
      Size = 30
    end
    object cdsSenhaIMP_US: TStringField
      FieldName = 'IMP_US'
      FixedChar = True
      Size = 15
    end
    object cdsSenhaALT_CAB: TStringField
      FieldName = 'ALT_CAB'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaALT_IMP: TStringField
      FieldName = 'ALT_IMP'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaDATA_CAD_S: TDateTimeField
      FieldName = 'DATA_CAD_S'
    end
    object cdsSenhaDATA_MOD_S: TDateTimeField
      FieldName = 'DATA_MOD_S'
    end
    object cdsSenhaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsEmpBeforeOpen
    OnCalcFields = cdsProdCalcFields
    Left = 292
    Top = 167
    object cdsProdCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 17
    end
    object cdsProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
    end
    object cdsProdEST_F: TFloatField
      FieldName = 'EST_F'
    end
    object cdsProdISENTO_PROD: TStringField
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdN_INCIDENCIA_PROD: TStringField
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      currency = True
    end
    object cdsProdPREC_30_PROD: TFloatField
      FieldName = 'PREC_30_PROD'
      currency = True
    end
    object cdsProdNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdDESCR_PROD_RED: TStringField
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProdCSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Required = True
      Size = 1
    end
    object cdsProdALT_COD_CUPOM: TStringField
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsProdALT_DESC_CUPOM: TStringField
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsProdARREDONDAR_TRUNCAR: TStringField
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object cdsProdTIPO_FAB: TStringField
      FieldName = 'TIPO_FAB'
      Size = 1
    end
    object cdsProdGTIN: TStringField
      FieldKind = fkCalculated
      FieldName = 'GTIN'
      Size = 14
      Calculated = True
    end
    object cdsProdSITTRIB: TStringField
      FieldKind = fkCalculated
      FieldName = 'SITTRIB'
      Calculated = True
    end
    object cdsProdIAT: TStringField
      FieldKind = fkCalculated
      FieldName = 'IAT'
      Size = 1
      Calculated = True
    end
    object cdsProdIPPT: TStringField
      FieldKind = fkCalculated
      FieldName = 'IPPT'
      Size = 1
      Calculated = True
    end
    object cdsProdPREC_CUS_PROD: TFloatField
      FieldName = 'PREC_CUS_PROD'
    end
    object cdsProdPERC_TB_VARE: TFloatField
      FieldName = 'PERC_TB_VARE'
    end
    object cdsProdTOT_ALIQ: TStringField
      FieldName = 'TOT_ALIQ'
      FixedChar = True
      Size = 4
    end
    object cdsProdTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object cdsProdEM_PROMOCAO: TStringField
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object cdsProdCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdCST_PROD: TStringField
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsProdMAX_DESC_ITEM: TFloatField
      FieldName = 'MAX_DESC_ITEM'
    end
    object cdsProdNBM: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'NBM'
      Size = 8
    end
    object cdsProdCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object cdsProdALIQ_PIS_DIFERENCIADA: TFloatField
      FieldName = 'ALIQ_PIS_DIFERENCIADA'
    end
    object cdsProdALIQ_COFINS_DIFERENCIADA: TFloatField
      FieldName = 'ALIQ_COFINS_DIFERENCIADA'
    end
    object cdsProdLISTA_IMAGENS: TBlobField
      FieldName = 'LISTA_IMAGENS'
      Size = 256
    end
  end
  object cdsEstado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstado'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 88
    Top = 167
    object cdsEstadoCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsEstadoNOME_UF: TStringField
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsEstadoSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsEstadoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object cdsEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmp'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 20
    Top = 167
    object cdsEmpCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object cdsEmpENDERECO_EMP: TStringField
      FieldName = 'ENDERECO_EMP'
      Size = 50
    end
    object cdsEmpBAIRRO_EMP: TStringField
      FieldName = 'BAIRRO_EMP'
      Size = 30
    end
    object cdsEmpCIDADE_EMP: TStringField
      FieldName = 'CIDADE_EMP'
      Size = 30
    end
    object cdsEmpCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object cdsEmpCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Size = 18
    end
    object cdsEmpIE_EMP: TStringField
      FieldName = 'IE_EMP'
      Size = 18
    end
    object cdsEmpIM_EMP: TStringField
      FieldName = 'IM_EMP'
      Size = 18
    end
    object cdsEmpTELEFONE_EMP: TStringField
      FieldName = 'TELEFONE_EMP'
      Size = 14
    end
    object cdsEmpNUMERO_END: TIntegerField
      FieldName = 'NUMERO_END'
    end
    object cdsEmpPROP_EMP: TStringField
      FieldName = 'PROP_EMP'
      Size = 40
    end
    object cdsEmpSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsEmpAUT_SERV_CUPOM: TStringField
      FieldName = 'AUT_SERV_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpENDRECO_EMP: TStringField
      FieldName = 'ENDRECO_EMP'
      Size = 50
    end
    object cdsEmpCOPIAR_HWF_TERM_RET: TStringField
      FieldName = 'COPIAR_HWF_TERM_RET'
      FixedChar = True
      Size = 1
    end
    object cdsEmpVERSAO: TIntegerField
      FieldName = 'VERSAO'
    end
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 224
    Top = 167
    object cdsClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClienteCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsClienteCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsClienteCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
      Required = True
    end
    object cdsClienteCODIGO_FATURAMENTO: TIntegerField
      FieldName = 'CODIGO_FATURAMENTO'
    end
    object cdsClienteEST_CODIGO_UF: TIntegerField
      FieldName = 'EST_CODIGO_UF'
      Required = True
    end
    object cdsClienteCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClienteRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsClienteINSC_EST: TStringField
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsClienteFAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object cdsClienteCIDA_COBRANCA: TStringField
      FieldName = 'CIDA_COBRANCA'
      Size = 30
    end
    object cdsClienteCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      FixedChar = True
      Size = 9
    end
    object cdsClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsClienteDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsClienteLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object cdsClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 10
    end
    object cdsClienteNATURALID: TStringField
      FieldName = 'NATURALID'
      Required = True
    end
    object cdsClienteCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 35
    end
    object cdsClienteLOC_TRAB: TStringField
      FieldName = 'LOC_TRAB'
      Size = 30
    end
    object cdsClienteEND_TRAB: TStringField
      FieldName = 'END_TRAB'
      Size = 35
    end
    object cdsClienteFONE_TRAB: TStringField
      FieldName = 'FONE_TRAB'
      FixedChar = True
      Size = 14
    end
    object cdsClienteCARGO: TStringField
      FieldName = 'CARGO'
      Size = 15
    end
    object cdsClienteRG: TStringField
      FieldName = 'RG'
      FixedChar = True
      Size = 10
    end
    object cdsClienteEXPEDIC: TDateTimeField
      FieldName = 'EXPEDIC'
    end
    object cdsClienteORG_EXPEDIC: TStringField
      FieldName = 'ORG_EXPEDIC'
    end
    object cdsClienteCTPS: TStringField
      FieldName = 'CTPS'
      FixedChar = True
      Size = 10
    end
    object cdsClienteREF_BANC1: TStringField
      FieldName = 'REF_BANC1'
      Size = 30
    end
    object cdsClienteFONE_BANC1: TStringField
      FieldName = 'FONE_BANC1'
      FixedChar = True
      Size = 14
    end
    object cdsClienteREF_BANC2: TStringField
      FieldName = 'REF_BANC2'
      Size = 30
    end
    object cdsClienteFONE_BANC2: TStringField
      FieldName = 'FONE_BANC2'
      FixedChar = True
      Size = 14
    end
    object cdsClienteREF_COM1: TStringField
      FieldName = 'REF_COM1'
      Size = 30
    end
    object cdsClienteEND_COM1: TStringField
      FieldName = 'END_COM1'
      Size = 30
    end
    object cdsClienteFONE_COM1: TStringField
      FieldName = 'FONE_COM1'
      FixedChar = True
      Size = 14
    end
    object cdsClienteINFORM: TStringField
      FieldName = 'INFORM'
      Size = 30
    end
    object cdsClientePRI_COMPR: TDateTimeField
      FieldName = 'PRI_COMPR'
    end
    object cdsClienteULT_COMPR: TDateTimeField
      FieldName = 'ULT_COMPR'
    end
    object cdsClienteCONCEITO: TStringField
      FieldName = 'CONCEITO'
      Size = 15
    end
    object cdsClienteREF_COM2: TStringField
      FieldName = 'REF_COM2'
      Size = 30
    end
    object cdsClienteEND_COM2: TStringField
      FieldName = 'END_COM2'
      Size = 30
    end
    object cdsClienteFONE_COM2: TStringField
      FieldName = 'FONE_COM2'
      FixedChar = True
      Size = 14
    end
    object cdsClienteINFORM2: TStringField
      FieldName = 'INFORM2'
      Size = 30
    end
    object cdsClientePRI_COMPR2: TDateTimeField
      FieldName = 'PRI_COMPR2'
    end
    object cdsClienteULT_COMPR2: TDateTimeField
      FieldName = 'ULT_COMPR2'
    end
    object cdsClienteCONCEITO2: TStringField
      FieldName = 'CONCEITO2'
      Size = 15
    end
    object cdsClienteSPCL: TDateTimeField
      FieldName = 'SPCL'
    end
    object cdsClienteSPCEST: TDateTimeField
      FieldName = 'SPCEST'
    end
    object cdsClienteREGSPC: TDateTimeField
      FieldName = 'REGSPC'
    end
    object cdsClienteREGSPCCH: TDateTimeField
      FieldName = 'REGSPCCH'
    end
    object cdsClienteUS_CAD_CLI: TIntegerField
      FieldName = 'US_CAD_CLI'
    end
    object cdsClienteFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
    end
    object cdsClienteEND_COBRANCA: TStringField
      FieldName = 'END_COBRANCA'
      Size = 50
    end
    object cdsClienteBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 35
    end
    object cdsClienteOBS_DIV: TMemoField
      FieldName = 'OBS_DIV'
      BlobType = ftMemo
      Size = 8
    end
    object cdsClientePAI: TStringField
      FieldName = 'PAI'
      Size = 35
    end
    object cdsClienteMAE: TStringField
      FieldName = 'MAE'
      Size = 35
    end
    object cdsClienteDATA_NASC: TDateTimeField
      FieldName = 'DATA_NASC'
    end
    object cdsClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsClienteCOD_CONVENIO: TIntegerField
      FieldName = 'COD_CONVENIO'
    end
    object cdsClienteCONVENIADO: TStringField
      FieldName = 'CONVENIADO'
      FixedChar = True
      Size = 1
    end
    object cdsClienteDIA_VENC: TIntegerField
      FieldName = 'DIA_VENC'
    end
    object cdsClienteDATA_MOD_CAD: TDateTimeField
      FieldName = 'DATA_MOD_CAD'
    end
    object cdsClienteCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
    end
    object cdsClienteCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 8
    end
    object cdsClienteCLQTDCOMPRA: TStringField
      FieldName = 'CLQTDCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLSOMACOMPRA: TStringField
      FieldName = 'CLSOMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLULTIMACOMPRA: TStringField
      FieldName = 'CLULTIMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLATRASOCOMPRA: TStringField
      FieldName = 'CLATRASOCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLLUCROCLIENTE: TStringField
      FieldName = 'CLLUCROCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsClienteLUCROCLIENTE: TFloatField
      FieldName = 'LUCROCLIENTE'
    end
    object cdsClienteTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      FixedChar = True
      Size = 6
    end
    object cdsClienteCLQTDVEICULO: TStringField
      FieldName = 'CLQTDVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLSOMAVEICULO: TStringField
      FieldName = 'CLSOMAVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLULTIMOVEICULO: TStringField
      FieldName = 'CLULTIMOVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLLUCROVEICULO: TStringField
      FieldName = 'CLLUCROVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClienteLUCROCLIENTE_V: TFloatField
      FieldName = 'LUCROCLIENTE_V'
    end
    object cdsClienteV_Q_VEICULO: TFloatField
      FieldName = 'V_Q_VEICULO'
    end
    object cdsClienteM_Q_VEICULO: TFloatField
      FieldName = 'M_Q_VEICULO'
    end
    object cdsClienteV_T_VEICULO: TFloatField
      FieldName = 'V_T_VEICULO'
    end
    object cdsClienteM_T_VEICULO: TFloatField
      FieldName = 'M_T_VEICULO'
    end
    object cdsClienteV_L_VEICULO: TFloatField
      FieldName = 'V_L_VEICULO'
    end
    object cdsClienteM_L_VEICULO: TFloatField
      FieldName = 'M_L_VEICULO'
    end
    object cdsClienteDATA_ULT_VENDA_V: TDateTimeField
      FieldName = 'DATA_ULT_VENDA_V'
    end
    object cdsClienteMEDIA_FREQUENCIA_V: TFloatField
      FieldName = 'MEDIA_FREQUENCIA_V'
    end
    object cdsClienteMEDIAFREQUENCIA: TFloatField
      FieldName = 'MEDIAFREQUENCIA'
    end
    object cdsClienteV_Q_COMPRA: TFloatField
      FieldName = 'V_Q_COMPRA'
    end
    object cdsClienteM_Q_COMPRA: TFloatField
      FieldName = 'M_Q_COMPRA'
    end
    object cdsClienteV_T_COMPRA: TFloatField
      FieldName = 'V_T_COMPRA'
    end
    object cdsClienteM_T_COMPRA: TFloatField
      FieldName = 'M_T_COMPRA'
    end
    object cdsClienteV_L_COMPRA: TFloatField
      FieldName = 'V_L_COMPRA'
    end
    object cdsClienteM_L_COMPRA: TFloatField
      FieldName = 'M_L_COMPRA'
    end
    object cdsClienteV_A_COMPRA: TFloatField
      FieldName = 'V_A_COMPRA'
    end
    object cdsClienteM_A_COMPRA: TFloatField
      FieldName = 'M_A_COMPRA'
    end
    object cdsClienteDATA_ULT_COMPRA: TDateTimeField
      FieldName = 'DATA_ULT_COMPRA'
    end
    object cdsClienteNEC_ACOMP: TStringField
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsClienteDIAS_ACOMP: TIntegerField
      FieldName = 'DIAS_ACOMP'
    end
    object cdsClienteSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsClienteRAMO_ATIVIDADE: TStringField
      FieldName = 'RAMO_ATIVIDADE'
      Size = 60
    end
    object cdsClienteCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsClienteCOD_BAIRRO: TSmallintField
      FieldName = 'COD_BAIRRO'
    end
    object cdsClienteCOD_CIDADE_COBRANCA: TSmallintField
      FieldName = 'COD_CIDADE_COBRANCA'
    end
    object cdsClienteCOD_BAIRRO_COBRANCA: TSmallintField
      FieldName = 'COD_BAIRRO_COBRANCA'
    end
    object cdsClienteESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 32
    end
    object cdsClienteTIPVCLIENTE: TStringField
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsClienteCAMP_PR_VENDA: TStringField
      FieldName = 'CAMP_PR_VENDA'
    end
    object cdsClientePERC_DESC: TFloatField
      FieldName = 'PERC_DESC'
    end
    object cdsClienteSIGLA_UF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsClienteNUM_END_CLIENTE: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
  end
  object dsCodBarra: TDataSource
    AutoEdit = False
    DataSet = cdsCodBarra
    Left = 360
    Top = 224
  end
  object dsProd: TDataSource
    AutoEdit = False
    DataSet = cdsProd
    Left = 292
    Top = 224
  end
  object dsSenha: TDataSource
    AutoEdit = False
    DataSet = cdsSenha
    Left = 496
    Top = 224
  end
  object dsColab: TDataSource
    AutoEdit = False
    DataSet = cdsColab
    Left = 428
    Top = 224
  end
  object dspFuncao: TDataSetProvider
    DataSet = qrFuncao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 632
    Top = 112
  end
  object dsEstado: TDataSource
    AutoEdit = False
    DataSet = cdsEstado
    Left = 88
    Top = 224
  end
  object dspServ: TDataSetProvider
    DataSet = qrServ
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 564
    Top = 112
  end
  object dsEmp: TDataSource
    AutoEdit = False
    DataSet = cdsEmp
    Left = 20
    Top = 224
  end
  object qrFuncao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from FUNCOES')
    Left = 632
    Top = 56
  end
  object dspSenha: TDataSetProvider
    DataSet = qrSenha
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 496
    Top = 112
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = cdsCliente
    Left = 224
    Top = 224
  end
  object dspColab: TDataSetProvider
    DataSet = qrColab
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 428
    Top = 112
  end
  object dsTipCl: TDataSource
    AutoEdit = False
    DataSet = cdsTipCl
    Left = 156
    Top = 224
  end
  object qrServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from TIPO_SERVICO')
    Left = 564
    Top = 56
  end
  object qrSenha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from SENHAS')
    Left = 496
    Top = 56
  end
  object qrColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from COLABORADOR')
    Left = 428
    Top = 56
  end
  object dspCodBarra: TDataSetProvider
    DataSet = qrCodBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 360
    Top = 112
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 292
    Top = 112
  end
  object qrCodBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from COD_BARRA')
    Left = 360
    Top = 56
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      
        'select grupo_prod||cod_prod codigo, p.cod_prod,p.grupo_prod,p.ic' +
        'm_prod,p.est_f,p.isento_prod,p.n_incidencia_prod,'
      
        'p.prec_tab_prod,p.prec_30_prod,p.num_fab_prod,p.descr_prod,p.des' +
        'cr_prod_red,p.unidade,p.csdecvlunt,p.alt_cod_cupom,p.alt_desc_cu' +
        'pom,p.ARREDONDAR_TRUNCAR,p.em_promocao, p.codigo_nop, p.cst_prod' +
        ', p.preco_promocao, p.TIPO_FAB,p.PREC_CUS_PROD,p.PERC_TB_VARE,p.' +
        'tot_aliq, p.tipo_item, p.nbm, p.cst_pis, p.aliq_pis, p.aliq_cofi' +
        'ns, p.lista_imagens'
      'from produtos p')
    Left = 292
    Top = 56
  end
  object qrCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select c.*,e.sigla_uf from clientes c'
      'inner join estados e on e.codigo_uf = c.codigo_uf')
    Left = 224
    Top = 56
  end
  object dspCliente: TDataSetProvider
    DataSet = qrCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 224
    Top = 112
  end
  object dspTipCl: TDataSetProvider
    DataSet = qrTipCl
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 156
    Top = 112
  end
  object qrTipCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from TIPOS_CLIENTES')
    Left = 156
    Top = 56
  end
  object qrEstado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from ESTADOS')
    Left = 88
    Top = 56
  end
  object qrEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      
        'select e.COD_EMPRESA,e.NOME_EMP,e.ENDERECO_EMP,e.BAIRRO_EMP,e.CI' +
        'DADE_EMP,e.CEP_EMP,'
      
        'e.CNPJ_EMP,e.IE_EMP,e.IM_EMP,e.TELEFONE_EMP,e.NUMERO_END,e.PROP_' +
        'EMP ,es.sigla_uf,E.AUT_SERV_CUPOM, e.endreco_emp, e.COPIAR_HWF_T' +
        'ERM_RET'
      'from empresa e inner join estados es on e.uf_emp = es.codigo_uf')
    Left = 20
    Top = 56
  end
  object dspEstado: TDataSetProvider
    DataSet = qrEstado
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 88
    Top = 112
  end
  object dsFuncao: TDataSource
    AutoEdit = False
    DataSet = cdsFuncao
    Left = 632
    Top = 224
  end
  object dspEmp: TDataSetProvider
    DataSet = qrEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 20
    Top = 112
  end
  object dsServ: TDataSource
    AutoEdit = False
    DataSet = cdsServ
    Left = 564
    Top = 224
  end
  object cdsTipCl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipCl'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 156
    Top = 167
    object cdsTipClCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
      Required = True
    end
    object cdsTipClDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      FixedChar = True
      Size = 30
    end
    object cdsTipClOBSERVACAO_T: TStringField
      FieldName = 'OBSERVACAO_T'
      FixedChar = True
      Size = 40
    end
    object cdsTipClATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object cdsFuncao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncao'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 632
    Top = 167
    object cdsFuncaoCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
      Required = True
    end
    object cdsFuncaoCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Required = True
    end
    object cdsFuncaoDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
    object cdsFuncaoTPDOCS_VND: TMemoField
      FieldName = 'TPDOCS_VND'
      BlobType = ftMemo
      Size = 8
    end
    object cdsFuncaoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object transacaoHwF: TIBTransaction
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 88
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    Left = 160
  end
  object spEstoqueReal: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    StoredProcName = 'ESTOQUEREAL'
    Left = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ESTOQUE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VEMPRESA'
        ParamType = ptInput
      end>
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 696
    Top = 112
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHwF
    SQL.Strings = (
      'select * from CONTROLES')
    Left = 696
    Top = 56
  end
  object dsCtrl: TDataSource
    AutoEdit = False
    DataSet = cdsCtrl
    Left = 696
    Top = 224
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = cdsEmpBeforeOpen
    Left = 696
    Top = 175
  end
  object transacaoHw: TIBTransaction
    Tag = 99
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 424
  end
  object qrBuscasHw: TIBQuery
    Tag = 99
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHw
    Left = 496
  end
end
