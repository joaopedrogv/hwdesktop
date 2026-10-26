object dtmDevolucao: TdtmDevolucao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 522
  Width = 726
  object cdsDevolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDevolucao'
    BeforeOpen = cdsDevolucaoBeforeOpen
    Left = 128
    Top = 128
    object cdsDevolucaoSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = '"DEVOLUCAO"."SEQUENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDevolucaoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"DEVOLUCAO"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDevolucaoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Origin = '"DEVOLUCAO"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDevolucaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"DEVOLUCAO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDevolucaoNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"DEVOLUCAO"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object cdsDevolucaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"DEVOLUCAO"."DESCRICAO"'
      FixedChar = True
      Size = 75
    end
    object cdsDevolucaoQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"DEVOLUCAO"."QUANT"'
    end
    object cdsDevolucaoQUANT_C: TFloatField
      FieldName = 'QUANT_C'
      Origin = '"DEVOLUCAO"."QUANT_C"'
    end
    object cdsDevolucaoVALOR: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR'
      Origin = '"DEVOLUCAO"."VALOR"'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsDevolucaoVALOR_TOT: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOT'
      DisplayFormat = '##0.00'
    end
    object cdsDevolucaoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = '"DEVOLUCAO"."DATA"'
    end
    object cdsDevolucaoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"DEVOLUCAO"."COD_VENDEDOR"'
    end
    object cdsDevolucaoNUM_NOTA_NFE: TIntegerField
      FieldName = 'NUM_NOTA_NFE'
      Origin = '"DEVOLUCAO"."NUM_NOTA_NFE"'
    end
    object cdsDevolucaoCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Origin = '"DEVOLUCAO"."COD_FORNECEDOR"'
    end
    object cdsDevolucaoCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"DEVOLUCAO"."COD_VENDA"'
    end
    object cdsDevolucaoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = '"DEVOLUCAO"."TIPO"'
      FixedChar = True
      Size = 1
    end
    object cdsDevolucaoATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"DEVOLUCAO"."ATIVO"'
    end
    object cdsDevolucaoCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = '"DEVOLUCAO"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDevolucaoPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
      Origin = '"DEVOLUCAO"."PCUST_MC"'
    end
    object cdsDevolucaoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"DEVOLUCAO"."NOME_CLIENTE"'
      Size = 35
    end
    object cdsDevolucaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = '"DEVOLUCAO"."ENDERECO"'
      Size = 50
    end
    object cdsDevolucaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = '"DEVOLUCAO"."TELEFONE"'
      FixedChar = True
      Size = 14
    end
    object cdsDevolucaoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"DEVOLUCAO"."COD_CLIENTE"'
    end
    object cdsDevolucaoTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 3
    end
    object cdsDevolucaoSEQID: TIntegerField
      FieldName = 'SEQID'
    end
    object cdsDevolucaoCOMISS_PROD: TFloatField
      FieldName = 'COMISS_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsDevolucaoCOMISS_PROD_GER: TFloatField
      FieldName = 'COMISS_PROD_GER'
      DisplayFormat = '##0.00'
    end
    object cdsDevolucaoTIPV: TStringField
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsDevolucaoVALOR_ORIG: TFloatField
      FieldName = 'VALOR_ORIG'
    end
    object cdsDevolucaoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsDevolucaoUNIDADE_CONV: TStringField
      FieldName = 'UNIDADE_CONV'
      Size = 6
    end
    object cdsDevolucaoQUANT_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_CONV'
    end
    object cdsDevolucaoVALOR_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_CONV'
    end
    object cdsDevolucaoOPERACAO_CONV: TStringField
      FieldName = 'OPERACAO_CONV'
      FixedChar = True
      Size = 1
    end
    object cdsDevolucaoFATOR_CONV: TFloatField
      FieldName = 'FATOR_CONV'
    end
    object cdsDevolucaoFATOR_CONV_TEMP: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'FATOR_CONV_TEMP'
      Size = 50
    end
    object cdsDevolucaoPERC_COMISSAO_CONDPAG: TFloatField
      FieldName = 'PERC_COMISSAO_CONDPAG'
    end
    object cdsDevolucaoPERC_COMISSAO_VEND3: TFloatField
      FieldName = 'PERC_COMISSAO_VEND3'
    end
    object cdsDevolucaoUSAR_DEBCRED: TStringField
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
  end
  object qrDevolucao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from DEVOLUCAO  where SEQUENCIA = 0')
    Left = 128
    Top = 32
  end
  object dsDevolucao: TDataSource
    DataSet = cdsDevolucao
    Left = 128
    Top = 176
  end
  object dspDevolucao: TDataSetProvider
    DataSet = qrDevolucao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 80
  end
  object IbTransDevolucao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 48
    Top = 32
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    Left = 48
    Top = 80
  end
  object qrPedVendaProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from PEDVENDA_PROD')
    Left = 206
    Top = 258
  end
  object dspPedVendaProd: TDataSetProvider
    DataSet = qrPedVendaProd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 206
    Top = 306
  end
  object cdsPedVendaProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedVendaProd'
    BeforeOpen = cdsPedVendaProdBeforeOpen
    Left = 206
    Top = 354
    object cdsPedVendaProdSEL: TStringField
      DisplayLabel = 'Sel'
      FieldName = 'SEL'
      Origin = '"PEDVENDA_PROD"."SEL"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaProdNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"PEDVENDA_PROD"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedVendaProdTIPO: TStringField
      FieldName = 'TIPO'
      Origin = '"PEDVENDA_PROD"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPedVendaProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedVendaProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA_PROD"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPedVendaProdNITEM: TIntegerField
      FieldName = 'NITEM'
      Origin = '"PEDVENDA_PROD"."NITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPedVendaProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA_PROD"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedVendaProdCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = '"PEDVENDA_PROD"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPedVendaProdCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
      Origin = '"PEDVENDA_PROD"."CODIGO_NOP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPedVendaProdNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object cdsPedVendaProdDESCR_PROD_PED: TStringField
      FieldName = 'DESCR_PROD_PED'
      Origin = '"PEDVENDA_PROD"."DESCR_PROD_PED"'
      Size = 60
    end
    object cdsPedVendaProdQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."QUANT_PED_ITEM"'
      DisplayFormat = '#0.000'
    end
    object cdsPedVendaProdQUANT_DEV_ITEM_TEMP2: TFloatField
      DisplayLabel = 'Qtde Dev'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_DEV_ITEM_TEMP_CONV'
      DisplayFormat = '#0.000'
    end
    object cdsPedVendaProdVLUN_PED_ITEM: TFloatField
      FieldName = 'VLUN_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_ITEM"'
      currency = True
    end
    object cdsPedVendaProdVLUN_PED_ITEM_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_LIQ'
    end
    object cdsPedVendaProdVLTOT_PED_ITEM: TFloatField
      FieldName = 'VLTOT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_ITEM"'
      currency = True
    end
    object cdsPedVendaProdVLTOT_PED_ITEM_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLTOT_PED_ITEM_LIQ'
    end
    object cdsPedVendaProdVLUN_ORIG: TFloatField
      FieldName = 'VLUN_ORIG'
      Origin = '"PEDVENDA_PROD"."VLUN_ORIG"'
      currency = True
    end
    object cdsPedVendaProdVLUN_PED_NF: TFloatField
      FieldName = 'VLUN_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_NF"'
      currency = True
    end
    object cdsPedVendaProdVLTOT_PED_NF: TFloatField
      FieldName = 'VLTOT_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_NF"'
      currency = True
    end
    object cdsPedVendaProdRATEIO_DESC: TFloatField
      FieldName = 'RATEIO_DESC'
      Origin = '"PEDVENDA_PROD"."RATEIO_DESC"'
    end
    object cdsPedVendaProdRATEIO_ACRESC: TFloatField
      FieldName = 'RATEIO_ACRESC'
      Origin = '"PEDVENDA_PROD"."RATEIO_ACRESC"'
    end
    object cdsPedVendaProdN_NF: TIntegerField
      FieldName = 'N_NF'
      Origin = '"PEDVENDA_PROD"."N_NF"'
    end
    object cdsPedVendaProdSERIE: TStringField
      FieldName = 'SERIE'
      Origin = '"PEDVENDA_PROD"."SERIE"'
      Size = 5
    end
    object cdsPedVendaProdALIQUOTA_CP: TStringField
      FieldName = 'ALIQUOTA_CP'
      Origin = '"PEDVENDA_PROD"."ALIQUOTA_CP"'
      FixedChar = True
      Size = 4
    end
    object cdsPedVendaProdRATDSAS: TFloatField
      FieldName = 'RATDSAS'
      Origin = '"PEDVENDA_PROD"."RATDSAS"'
    end
    object cdsPedVendaProdCOMISS_PROD: TFloatField
      FieldName = 'COMISS_PROD'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD"'
    end
    object cdsPedVendaProdCOMISS_PROD_GER: TFloatField
      FieldName = 'COMISS_PROD_GER'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD_GER"'
    end
    object cdsPedVendaProdANO_FAB_PROD: TIntegerField
      FieldName = 'ANO_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."ANO_FAB_PROD"'
    end
    object cdsPedVendaProdN_SERIE_PROD: TStringField
      FieldName = 'N_SERIE_PROD'
      Origin = '"PEDVENDA_PROD"."N_SERIE_PROD"'
      Size = 15
    end
    object cdsPedVendaProdMODELO: TStringField
      FieldName = 'MODELO'
      Origin = '"PEDVENDA_PROD"."MODELO"'
      Size = 15
    end
    object cdsPedVendaProdCOR: TStringField
      FieldName = 'COR'
      Origin = '"PEDVENDA_PROD"."COR"'
      Size = 10
    end
    object cdsPedVendaProdPCUST_C: TFloatField
      FieldName = 'PCUST_C'
      Origin = '"PEDVENDA_PROD"."PCUST_C"'
      currency = True
    end
    object cdsPedVendaProdPCUST_R: TFloatField
      FieldName = 'PCUST_R'
      Origin = '"PEDVENDA_PROD"."PCUST_R"'
      currency = True
    end
    object cdsPedVendaProdPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
      Origin = '"PEDVENDA_PROD"."PCUST_MC"'
      currency = True
    end
    object cdsPedVendaProdPCUST_MR: TFloatField
      FieldName = 'PCUST_MR'
      Origin = '"PEDVENDA_PROD"."PCUST_MR"'
      currency = True
    end
    object cdsPedVendaProdTP_NF_PED: TStringField
      FieldName = 'TP_NF_PED'
      Origin = '"PEDVENDA_PROD"."TP_NF_PED"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaProdSIT_ATD: TStringField
      FieldName = 'SIT_ATD'
      Origin = '"PEDVENDA_PROD"."SIT_ATD"'
      FixedChar = True
      Size = 2
    end
    object cdsPedVendaProdDATA_ATD: TDateTimeField
      FieldName = 'DATA_ATD'
      Origin = '"PEDVENDA_PROD"."DATA_ATD"'
    end
    object cdsPedVendaProdHORA_ATD: TStringField
      FieldName = 'HORA_ATD'
      Origin = '"PEDVENDA_PROD"."HORA_ATD"'
      FixedChar = True
      Size = 8
    end
    object cdsPedVendaProdCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
      Origin = '"PEDVENDA_PROD"."CODIGO_KIT"'
    end
    object cdsPedVendaProdICMANT_SUB: TFloatField
      FieldName = 'ICMANT_SUB'
      Origin = '"PEDVENDA_PROD"."ICMANT_SUB"'
    end
    object cdsPedVendaProdCOD_SEG_SERV: TIntegerField
      FieldName = 'COD_SEG_SERV'
      Origin = '"PEDVENDA_PROD"."COD_SEG_SERV"'
    end
    object cdsPedVendaProdATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"PEDVENDA_PROD"."ATIVO"'
    end
    object cdsPedVendaProdCOL_COD_VENDEDOR: TIntegerField
      FieldName = 'COL_COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COL_COD_VENDEDOR"'
    end
    object cdsPedVendaProdDESC_ITEM: TFloatField
      FieldName = 'DESC_ITEM'
      Origin = '"PEDVENDA_PROD"."DESC_ITEM"'
    end
    object cdsPedVendaProdACRESC_ITEM: TFloatField
      FieldName = 'ACRESC_ITEM'
      Origin = '"PEDVENDA_PROD"."ACRESC_ITEM"'
    end
    object cdsPedVendaProdCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COD_VENDEDOR"'
    end
    object cdsPedVendaProdDATA_TRANSF: TDateTimeField
      FieldName = 'DATA_TRANSF'
      Origin = '"PEDVENDA_PROD"."DATA_TRANSF"'
    end
    object cdsPedVendaProdDATA_DEV: TDateTimeField
      FieldName = 'DATA_DEV'
      Origin = '"PEDVENDA_PROD"."DATA_DEV"'
    end
    object cdsPedVendaProdNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = '"PEDVENDA_PROD"."NOME_VEND"'
      Size = 35
    end
    object cdsPedVendaProdNOME_VEND1: TStringField
      FieldName = 'NOME_VEND1'
      Origin = '"PEDVENDA_PROD"."NOME_VEND1"'
      Size = 35
    end
    object cdsPedVendaProdQT_DEV: TFloatField
      FieldName = 'QT_DEV'
      Origin = '"PEDVENDA_PROD"."QT_DEV"'
    end
    object cdsPedVendaProdUNIDADE_CONV: TStringField
      FieldName = 'UNIDADE_CONV'
      Size = 6
    end
    object cdsPedVendaProdQUANT_PED_ITEM_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_PED_ITEM_CONV'
    end
    object cdsPedVendaProdQUANT_DEV_ITEM_TEMP: TFloatField
      DisplayLabel = 'Qtde Dev (Un Princ)'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_DEV_ITEM_TEMP'
    end
    object cdsPedVendaProdVLUN_PED_ITEM_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV'
    end
    object cdsPedVendaProdVLUN_PED_ITEM_CONV_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV_LIQ'
    end
    object cdsPedVendaProdOPERACAO_CONV: TStringField
      FieldName = 'OPERACAO_CONV'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaProdFATOR_CONV: TFloatField
      FieldName = 'FATOR_CONV'
    end
    object cdsPedVendaProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsPedVendaProdFATOR_CONV_TEMP: TStringField
      DisplayLabel = 'Fator'
      FieldKind = fkInternalCalc
      FieldName = 'FATOR_CONV_TEMP'
      Size = 50
    end
    object cdsPedVendaProdPERC_COMISSAO_CONDPAG: TFloatField
      FieldName = 'PERC_COMISSAO_CONDPAG'
    end
    object cdsPedVendaProdPERC_COMISSAO_VEND3: TFloatField
      FieldName = 'PERC_COMISSAO_VEND3'
    end
    object cdsPedVendaProdSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsPedVendaProdTABPRATICADA: TStringField
      DisplayLabel = 'Pre'#231'o P/T/Q/N'
      FieldName = 'TABPRATICADA'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaProdUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
  end
  object dsPedVendaProd: TDataSource
    DataSet = cdsPedVendaProd
    Left = 206
    Top = 402
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from EMPRESA')
    Left = 288
    Top = 32
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 80
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsEmpresaBeforeOpen
    Left = 288
    Top = 128
    object cdsEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object cdsEmpresaENDERECO_EMP: TStringField
      FieldName = 'ENDERECO_EMP'
      Size = 50
    end
    object cdsEmpresaBAIRRO_EMP: TStringField
      FieldName = 'BAIRRO_EMP'
      Size = 30
    end
    object cdsEmpresaCIDADE_EMP: TStringField
      FieldName = 'CIDADE_EMP'
      Size = 30
    end
    object cdsEmpresaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object cdsEmpresaUF_EMP: TIntegerField
      FieldName = 'UF_EMP'
    end
    object cdsEmpresaCGC_EMP: TStringField
      FieldName = 'CGC_EMP'
      Size = 18
    end
    object cdsEmpresaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Size = 18
    end
    object cdsEmpresaIE_EMP: TStringField
      FieldName = 'IE_EMP'
      Size = 18
    end
    object cdsEmpresaIM_EMP: TStringField
      FieldName = 'IM_EMP'
      Size = 18
    end
    object cdsEmpresaOBSERV_EMP: TStringField
      FieldName = 'OBSERV_EMP'
      Size = 60
    end
    object cdsEmpresaTELEFONE_EMP: TStringField
      FieldName = 'TELEFONE_EMP'
      Size = 14
    end
    object cdsEmpresaPROP_EMP: TStringField
      FieldName = 'PROP_EMP'
      Size = 40
    end
    object cdsEmpresaCAIXA_INTEGRADO: TStringField
      FieldName = 'CAIXA_INTEGRADO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaFILIAL: TStringField
      FieldName = 'FILIAL'
      Size = 21
    end
    object cdsEmpresaG_CI: TIntegerField
      FieldName = 'G_CI'
    end
    object cdsEmpresaG_CDV: TIntegerField
      FieldName = 'G_CDV'
    end
    object cdsEmpresaG_CDF: TIntegerField
      FieldName = 'G_CDF'
    end
    object cdsEmpresaG_CRO: TIntegerField
      FieldName = 'G_CRO'
    end
    object cdsEmpresaG_CSE: TIntegerField
      FieldName = 'G_CSE'
    end
    object cdsEmpresaEM_NF: TStringField
      FieldName = 'EM_NF'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMOD_FAT: TStringField
      FieldName = 'MOD_FAT'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaQT_SERV_NF: TIntegerField
      FieldName = 'QT_SERV_NF'
    end
    object cdsEmpresaQT_PROD_NF: TIntegerField
      FieldName = 'QT_PROD_NF'
    end
    object cdsEmpresaDEB_CRED: TStringField
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONEXAO: TStringField
      FieldName = 'CONEXAO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaN_PED: TStringField
      FieldName = 'N_PED'
      Size = 10
    end
    object cdsEmpresaCONCESS: TStringField
      FieldName = 'CONCESS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaOBS_PAD_OS: TMemoField
      FieldName = 'OBS_PAD_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaVND_AB_CUSTO: TStringField
      FieldName = 'VND_AB_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTX_JUROS: TFloatField
      FieldName = 'TX_JUROS'
    end
    object cdsEmpresaMULTAS: TFloatField
      FieldName = 'MULTAS'
    end
    object cdsEmpresaQTDE_ITENS_NF: TIntegerField
      FieldName = 'QTDE_ITENS_NF'
    end
    object cdsEmpresaNOTA_FISCAL: TIntegerField
      FieldName = 'NOTA_FISCAL'
    end
    object cdsEmpresaPORTA_IMPRESSAO: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object cdsEmpresaCALCULADORA: TStringField
      FieldName = 'CALCULADORA'
      Size = 80
    end
    object cdsEmpresaTAMANHOLETRA: TStringField
      FieldName = 'TAMANHOLETRA'
      Size = 10
    end
    object cdsEmpresaQTDE_LINHASNF: TIntegerField
      FieldName = 'QTDE_LINHASNF'
    end
    object cdsEmpresaISS_EMP: TFloatField
      FieldName = 'ISS_EMP'
    end
    object cdsEmpresaQTMESSUG: TIntegerField
      FieldName = 'QTMESSUG'
    end
    object cdsEmpresaCABREQ: TStringField
      FieldName = 'CABREQ'
      Size = 15
    end
    object cdsEmpresaCABOS: TStringField
      FieldName = 'CABOS'
      Size = 15
    end
    object cdsEmpresaDADVAP: TStringField
      FieldName = 'DADVAP'
      FixedChar = True
      Size = 3
    end
    object cdsEmpresaPASTA_FRENTE: TStringField
      FieldName = 'PASTA_FRENTE'
      Size = 21
    end
    object cdsEmpresaNUMERO_END: TIntegerField
      FieldName = 'NUMERO_END'
    end
    object cdsEmpresaALIQPADRAO: TFloatField
      FieldName = 'ALIQPADRAO'
    end
    object cdsEmpresaTP_SUG: TIntegerField
      FieldName = 'TP_SUG'
    end
    object cdsEmpresaTE_SUG: TIntegerField
      FieldName = 'TE_SUG'
    end
    object cdsEmpresaTA_SUG: TIntegerField
      FieldName = 'TA_SUG'
    end
    object cdsEmpresaFP_SUG: TIntegerField
      FieldName = 'FP_SUG'
    end
    object cdsEmpresaMES_RET_SERV1: TIntegerField
      FieldName = 'MES_RET_SERV1'
    end
    object cdsEmpresaKM_RET_SERV1: TIntegerField
      FieldName = 'KM_RET_SERV1'
    end
    object cdsEmpresaMES_RET_SERV3: TIntegerField
      FieldName = 'MES_RET_SERV3'
    end
    object cdsEmpresaKM_RET_SERV3: TIntegerField
      FieldName = 'KM_RET_SERV3'
    end
    object cdsEmpresaINTERV_KM_SERV: TIntegerField
      FieldName = 'INTERV_KM_SERV'
    end
    object cdsEmpresaEMAIL_EMP: TStringField
      FieldName = 'EMAIL_EMP'
      Size = 50
    end
    object cdsEmpresaSMTP_EMP: TStringField
      FieldName = 'SMTP_EMP'
      Size = 50
    end
    object cdsEmpresaLOGIN_EMP: TStringField
      FieldName = 'LOGIN_EMP'
      Size = 50
    end
    object cdsEmpresaCOD_SERV_PADRAO: TIntegerField
      FieldName = 'COD_SERV_PADRAO'
    end
    object cdsEmpresaCPPADPROD: TStringField
      FieldName = 'CPPADPROD'
      Size = 40
    end
    object cdsEmpresaCPPADCL: TStringField
      FieldName = 'CPPADCL'
      Size = 40
    end
    object cdsEmpresaCPPADVEI: TStringField
      FieldName = 'CPPADVEI'
      Size = 40
    end
    object cdsEmpresaLOCAL_PAG: TStringField
      FieldName = 'LOCAL_PAG'
      Size = 60
    end
    object cdsEmpresaTOTDESC_EMP: TFloatField
      FieldName = 'TOTDESC_EMP'
    end
    object cdsEmpresaUTIL_AUD: TStringField
      FieldName = 'UTIL_AUD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUTIL_PESQE: TStringField
      FieldName = 'UTIL_PESQE'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaARREDOND: TStringField
      FieldName = 'ARREDOND'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTOTDESC_EMPA: TFloatField
      FieldName = 'TOTDESC_EMPA'
    end
    object cdsEmpresaMIN_MARGEM_V: TFloatField
      FieldName = 'MIN_MARGEM_V'
    end
    object cdsEmpresaMIN_MARGEM_A: TFloatField
      FieldName = 'MIN_MARGEM_A'
    end
    object cdsEmpresaALT_PERC_MARGEM: TStringField
      FieldName = 'ALT_PERC_MARGEM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAPRES_ESTR: TStringField
      FieldName = 'APRES_ESTR'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIAS_DEMO_EMP: TIntegerField
      FieldName = 'DIAS_DEMO_EMP'
    end
    object cdsEmpresaDIAS_RES_EMP: TIntegerField
      FieldName = 'DIAS_RES_EMP'
    end
    object cdsEmpresaOBS_BOL: TStringField
      FieldName = 'OBS_BOL'
      Size = 45
    end
    object cdsEmpresaOBS_DECL_OS: TMemoField
      FieldName = 'OBS_DECL_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaDECL_OBS_OS: TStringField
      FieldName = 'DECL_OBS_OS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaG_CI_VEIC: TIntegerField
      FieldName = 'G_CI_VEIC'
    end
    object cdsEmpresaG_CDV_VEIC: TIntegerField
      FieldName = 'G_CDV_VEIC'
    end
    object cdsEmpresaG_CDF_VEIC: TIntegerField
      FieldName = 'G_CDF_VEIC'
    end
    object cdsEmpresaG_CRO_VEIC: TIntegerField
      FieldName = 'G_CRO_VEIC'
    end
    object cdsEmpresaG_CSE_VEIC: TIntegerField
      FieldName = 'G_CSE_VEIC'
    end
    object cdsEmpresaG_CI_SERV: TIntegerField
      FieldName = 'G_CI_SERV'
    end
    object cdsEmpresaG_CDV_SERV: TIntegerField
      FieldName = 'G_CDV_SERV'
    end
    object cdsEmpresaG_CDF_SERV: TIntegerField
      FieldName = 'G_CDF_SERV'
    end
    object cdsEmpresaG_CRO_SERV: TIntegerField
      FieldName = 'G_CRO_SERV'
    end
    object cdsEmpresaG_CSE_SERV: TIntegerField
      FieldName = 'G_CSE_SERV'
    end
    object cdsEmpresaG_IR_ADM: TIntegerField
      FieldName = 'G_IR_ADM'
    end
    object cdsEmpresaG_CTRS_ADM: TIntegerField
      FieldName = 'G_CTRS_ADM'
    end
    object cdsEmpresaG_REM_ADM: TIntegerField
      FieldName = 'G_REM_ADM'
    end
    object cdsEmpresaG_REIV_ADM: TIntegerField
      FieldName = 'G_REIV_ADM'
    end
    object cdsEmpresaG_DF_ADM: TIntegerField
      FieldName = 'G_DF_ADM'
    end
    object cdsEmpresaG_DV_ADM: TIntegerField
      FieldName = 'G_DV_ADM'
    end
    object cdsEmpresaCOFINS_EMP: TFloatField
      FieldName = 'COFINS_EMP'
    end
    object cdsEmpresaPIS_EMP: TFloatField
      FieldName = 'PIS_EMP'
    end
    object cdsEmpresaCOMISS_PROD_EMP: TFloatField
      FieldName = 'COMISS_PROD_EMP'
    end
    object cdsEmpresaENC_SOBR_COM: TFloatField
      FieldName = 'ENC_SOBR_COM'
    end
    object cdsEmpresaCUSTO_EST_EMP: TFloatField
      FieldName = 'CUSTO_EST_EMP'
    end
    object cdsEmpresaOUT_ENC_EMP: TFloatField
      FieldName = 'OUT_ENC_EMP'
    end
    object cdsEmpresaDESP_FIXAS: TFloatField
      FieldName = 'DESP_FIXAS'
    end
    object cdsEmpresaJR_CMP_EMP: TFloatField
      FieldName = 'JR_CMP_EMP'
    end
    object cdsEmpresaIMP_RENDA: TFloatField
      FieldName = 'IMP_RENDA'
    end
    object cdsEmpresaCONTR_S_EMP: TFloatField
      FieldName = 'CONTR_S_EMP'
    end
    object cdsEmpresaSIMPLES_EMP: TFloatField
      FieldName = 'SIMPLES_EMP'
    end
    object cdsEmpresaMIN_M_LQ_A: TFloatField
      FieldName = 'MIN_M_LQ_A'
    end
    object cdsEmpresaMIN_M_LQ_V: TFloatField
      FieldName = 'MIN_M_LQ_V'
    end
    object cdsEmpresaUS_MINM_PROD: TStringField
      FieldName = 'US_MINM_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCPMF_EMP: TFloatField
      FieldName = 'CPMF_EMP'
    end
    object cdsEmpresaN_CONC_ASS: TIntegerField
      FieldName = 'N_CONC_ASS'
    end
    object cdsEmpresaCASAS_DECIMAIS: TIntegerField
      FieldName = 'CASAS_DECIMAIS'
    end
    object cdsEmpresaSEG_PROD_SERV: TStringField
      FieldName = 'SEG_PROD_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIAS_PREC_TAB: TIntegerField
      FieldName = 'DIAS_PREC_TAB'
    end
    object cdsEmpresaPRAZO_MED_VND: TIntegerField
      FieldName = 'PRAZO_MED_VND'
    end
    object cdsEmpresaCUSTO_BOLETA: TFloatField
      FieldName = 'CUSTO_BOLETA'
    end
    object cdsEmpresaTX_CARTAO: TFloatField
      FieldName = 'TX_CARTAO'
    end
    object cdsEmpresaPERC_VND_CARTAO: TFloatField
      FieldName = 'PERC_VND_CARTAO'
    end
    object cdsEmpresaTX_CARTAO_PARC: TFloatField
      FieldName = 'TX_CARTAO_PARC'
    end
    object cdsEmpresaDIAS_REC_FIN: TIntegerField
      FieldName = 'DIAS_REC_FIN'
    end
    object cdsEmpresaADIC_FIN: TFloatField
      FieldName = 'ADIC_FIN'
    end
    object cdsEmpresaVND_MIN_FIN: TFloatField
      FieldName = 'VND_MIN_FIN'
    end
    object cdsEmpresaVERSAO: TIntegerField
      FieldName = 'VERSAO'
    end
    object cdsEmpresaARREDONDA_PRECO: TStringField
      FieldName = 'ARREDONDA_PRECO'
      FixedChar = True
      Size = 4
    end
    object cdsEmpresaMENSAGEM_EMP: TStringField
      FieldName = 'MENSAGEM_EMP'
      Size = 40
    end
    object cdsEmpresaMAXDESCPARC: TFloatField
      FieldName = 'MAXDESCPARC'
    end
    object cdsEmpresaUS_ROMANEIO: TStringField
      FieldName = 'US_ROMANEIO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaALMOX: TStringField
      FieldName = 'ALMOX'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsEmpresaUS_DECL_REQ: TStringField
      FieldName = 'US_DECL_REQ'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAT_PRECREP: TStringField
      FieldName = 'AT_PRECREP'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSPREVENDA: TStringField
      FieldName = 'USPREVENDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSPREVENDA_OS: TStringField
      FieldName = 'USPREVENDA_OS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAUT_SERV_CUPOM: TStringField
      FieldName = 'AUT_SERV_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
    end
    object cdsEmpresaSEQ_ARQ_REMESSA: TIntegerField
      FieldName = 'SEQ_ARQ_REMESSA'
    end
    object cdsEmpresaRECIBO_HTML_BOLETO: TBlobField
      FieldName = 'RECIBO_HTML_BOLETO'
      Size = 8
    end
    object cdsEmpresaPROXIMO_NOSSO_NUMERO: TStringField
      FieldName = 'PROXIMO_NOSSO_NUMERO'
    end
    object cdsEmpresaENDRECO_EMP: TStringField
      FieldName = 'ENDRECO_EMP'
      Size = 50
    end
    object cdsEmpresaATRIBUIR_DATA_SERVIDOR: TStringField
      FieldName = 'ATRIBUIR_DATA_SERVIDOR'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCFOP_PAD_PROD: TFloatField
      FieldName = 'CFOP_PAD_PROD'
    end
    object cdsEmpresaCFOP_PAD_SERV: TFloatField
      FieldName = 'CFOP_PAD_SERV'
    end
    object cdsEmpresaQTDE_CARAC_ITENSNF: TIntegerField
      FieldName = 'QTDE_CARAC_ITENSNF'
    end
    object cdsEmpresaENDERECOHWFFDB: TStringField
      FieldName = 'ENDERECOHWFFDB'
      Size = 50
    end
    object cdsEmpresaITAUTO: TStringField
      FieldName = 'ITAUTO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTPIMPRE: TStringField
      FieldName = 'TPIMPRE'
      FixedChar = True
      Size = 15
    end
    object cdsEmpresaCODBARRADO: TIntegerField
      FieldName = 'CODBARRADO'
    end
    object cdsEmpresaCODDBARRADO: TIntegerField
      FieldName = 'CODDBARRADO'
    end
    object cdsEmpresaNOME_CDL: TStringField
      FieldName = 'NOME_CDL'
      FixedChar = True
      Size = 60
    end
    object cdsEmpresaUF_CDL: TStringField
      FieldName = 'UF_CDL'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaFONE_CDL: TStringField
      FieldName = 'FONE_CDL'
      FixedChar = True
      Size = 13
    end
    object cdsEmpresaENDERECO_CDL: TStringField
      FieldName = 'ENDERECO_CDL'
      FixedChar = True
      Size = 30
    end
    object cdsEmpresaBAIRRO_CDL: TStringField
      FieldName = 'BAIRRO_CDL'
      FixedChar = True
      Size = 25
    end
    object cdsEmpresaCOD_EMP_CDL: TIntegerField
      FieldName = 'COD_EMP_CDL'
    end
    object cdsEmpresaDIAS_CAR_JUROS: TIntegerField
      FieldName = 'DIAS_CAR_JUROS'
    end
    object cdsEmpresaORDERBY_CRED: TStringField
      FieldName = 'ORDERBY_CRED'
    end
    object cdsEmpresaORDERBY_CH: TStringField
      FieldName = 'ORDERBY_CH'
    end
    object cdsEmpresaESTADO_EMP: TStringField
      FieldName = 'ESTADO_EMP'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaNFE_CAMINHO_CERT: TStringField
      FieldName = 'NFE_CAMINHO_CERT'
      Size = 50
    end
    object cdsEmpresaNFE_SENHA__CERT: TStringField
      FieldName = 'NFE_SENHA__CERT'
      Size = 30
    end
    object cdsEmpresaNFE_NUMSERIE_CERT: TStringField
      FieldName = 'NFE_NUMSERIE_CERT'
      Size = 50
    end
    object cdsEmpresaNFE_DANFE_TIPO: TStringField
      FieldName = 'NFE_DANFE_TIPO'
      Size = 15
    end
    object cdsEmpresaNFE_DANFE_FOREMISS: TStringField
      FieldName = 'NFE_DANFE_FOREMISS'
      Size = 15
    end
    object cdsEmpresaNFE_LOGOMARCA: TStringField
      FieldName = 'NFE_LOGOMARCA'
      Size = 100
    end
    object cdsEmpresaNFE_LOGPATH: TStringField
      FieldName = 'NFE_LOGPATH'
      Size = 100
    end
    object cdsEmpresaWEBSERV_UF: TStringField
      FieldName = 'WEBSERV_UF'
      Size = 2
    end
    object cdsEmpresaWEBSERV_AMBIENTE: TStringField
      FieldName = 'WEBSERV_AMBIENTE'
      Size = 15
    end
    object cdsEmpresaWEBSERV_VISUALIZAR: TStringField
      FieldName = 'WEBSERV_VISUALIZAR'
      Size = 5
    end
    object cdsEmpresaDIAS_AVISO: TIntegerField
      FieldName = 'DIAS_AVISO'
    end
    object cdsEmpresaNFE_ENDRELRAVE: TStringField
      FieldName = 'NFE_ENDRELRAVE'
      Size = 80
    end
    object cdsEmpresaNFE_ENDERECOPDF: TStringField
      FieldName = 'NFE_ENDERECOPDF'
      Size = 80
    end
    object cdsEmpresaPORTA_SMTP: TIntegerField
      FieldName = 'PORTA_SMTP'
    end
    object cdsEmpresaENVIAEMAILNFE: TStringField
      FieldName = 'ENVIAEMAILNFE'
      Size = 1
    end
    object cdsEmpresaASSUNTO_NFE: TStringField
      FieldName = 'ASSUNTO_NFE'
      Size = 70
    end
    object cdsEmpresaEMAIL_USASSL: TStringField
      FieldName = 'EMAIL_USASSL'
      Size = 1
    end
    object cdsEmpresaEMAIL_SENHA: TStringField
      FieldName = 'EMAIL_SENHA'
      Size = 30
    end
    object cdsEmpresaMENSAGEM_NFE: TBlobField
      FieldName = 'MENSAGEM_NFE'
      Size = 8
    end
    object cdsEmpresaIBGE_COD_CIDADE: TIntegerField
      FieldName = 'IBGE_COD_CIDADE'
    end
    object cdsEmpresaIBGE_CODIGO_UF: TIntegerField
      FieldName = 'IBGE_CODIGO_UF'
    end
    object cdsEmpresaMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsEmpresaSERIE_SCAN: TIntegerField
      FieldName = 'SERIE_SCAN'
    end
    object cdsEmpresaUSO_SERVICO_NFE: TStringField
      FieldName = 'USO_SERVICO_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSERIE_SERV_NFE: TIntegerField
      FieldName = 'SERIE_SERV_NFE'
    end
    object cdsEmpresaMODELO_NF_SERV: TStringField
      FieldName = 'MODELO_NF_SERV'
      Size = 3
    end
    object cdsEmpresaUS_EDICAOCLIENTE_VENDA: TStringField
      FieldName = 'US_EDICAOCLIENTE_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCOPIAR_HWF_TERM_RET: TStringField
      FieldName = 'COPIAR_HWF_TERM_RET'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
    end
    object cdsEmpresaREGIME: TStringField
      FieldName = 'REGIME'
    end
    object cdsEmpresaNUM_CREDENC_INTERVENTOR: TStringField
      FieldName = 'NUM_CREDENC_INTERVENTOR'
    end
    object cdsEmpresaDTDEF_CLASSEP: TDateTimeField
      FieldName = 'DTDEF_CLASSEP'
    end
    object cdsEmpresaDTDEFINICAO_GE: TDateTimeField
      FieldName = 'DTDEFINICAO_GE'
    end
    object cdsEmpresaQTDMES_CLASSEP: TIntegerField
      FieldName = 'QTDMES_CLASSEP'
    end
    object cdsEmpresaQTDMES_GE: TIntegerField
      FieldName = 'QTDMES_GE'
    end
    object cdsEmpresaEST_SEGURACAPROD: TIntegerField
      FieldName = 'EST_SEGURACAPROD'
    end
    object cdsEmpresaCODDEPPRODUTOS: TIntegerField
      FieldName = 'CODDEPPRODUTOS'
    end
    object cdsEmpresaCODDEPOFICINA: TIntegerField
      FieldName = 'CODDEPOFICINA'
    end
    object cdsEmpresaCODDEPVEICULOS: TIntegerField
      FieldName = 'CODDEPVEICULOS'
    end
    object cdsEmpresaDTDEF_CLASSE_S: TDateTimeField
      FieldName = 'DTDEF_CLASSE_S'
    end
    object cdsEmpresaQTDMES_CLASSE_S: TIntegerField
      FieldName = 'QTDMES_CLASSE_S'
    end
    object cdsEmpresaCODDEPVEICULOSUS: TIntegerField
      FieldName = 'CODDEPVEICULOSUS'
    end
    object cdsEmpresaDIAS_TRABALHO_MES: TIntegerField
      FieldName = 'DIAS_TRABALHO_MES'
    end
    object cdsEmpresaUSAR_REGRAS_NCM: TStringField
      FieldName = 'USAR_REGRAS_NCM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDTEMP: TStringField
      FieldName = 'DTEMP'
      Size = 16
    end
    object cdsEmpresaSPED_IND_PERFIL: TStringField
      FieldName = 'SPED_IND_PERFIL'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSPED_SUFRAMA: TStringField
      FieldName = 'SPED_SUFRAMA'
      Size = 9
    end
    object cdsEmpresaSPED_IND_ATIV: TIntegerField
      FieldName = 'SPED_IND_ATIV'
    end
    object cdsEmpresaCOD_CONTADOR: TIntegerField
      FieldName = 'COD_CONTADOR'
    end
    object cdsEmpresaFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Size = 50
    end
    object cdsEmpresaCOMPLEMENTO_EMP: TStringField
      FieldName = 'COMPLEMENTO_EMP'
      Size = 50
    end
    object cdsEmpresaNFE_DHCONT: TDateTimeField
      FieldName = 'NFE_DHCONT'
    end
    object cdsEmpresaNFE_XJUST: TStringField
      FieldName = 'NFE_XJUST'
      Size = 256
    end
    object cdsEmpresaALIQ_SIMPLES_ICM: TFloatField
      FieldName = 'ALIQ_SIMPLES_ICM'
    end
    object cdsEmpresaALIQ_SIMPLES_ISS: TFloatField
      FieldName = 'ALIQ_SIMPLES_ISS'
    end
    object cdsEmpresaNFE_GRAVALOG: TStringField
      FieldName = 'NFE_GRAVALOG'
      Size = 1
    end
    object cdsEmpresaNFE_TMPRETORNOMIL: TIntegerField
      FieldName = 'NFE_TMPRETORNOMIL'
    end
    object cdsEmpresaNFE_QTDELIMITENFPEND: TIntegerField
      FieldName = 'NFE_QTDELIMITENFPEND'
    end
    object cdsEmpresaNFEPENDEMDIAS: TIntegerField
      FieldName = 'NFEPENDEMDIAS'
    end
    object cdsEmpresaCNAE_FISCAL: TStringField
      FieldName = 'CNAE_FISCAL'
      Size = 7
    end
    object cdsEmpresaCFOP_PAD_DEVOLUCAO: TFloatField
      FieldName = 'CFOP_PAD_DEVOLUCAO'
    end
    object cdsEmpresaBUSCA_COD_NO_PROD: TStringField
      FieldName = 'BUSCA_COD_NO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONF_FORMPAGAMENTO: TStringField
      FieldName = 'CONF_FORMPAGAMENTO'
      FixedChar = True
      Size = 3
    end
    object cdsEmpresaDESCONSIDERAR_ICMS_NFENT: TStringField
      FieldName = 'DESCONSIDERAR_ICMS_NFENT'
      FixedChar = True
      Size = 1
    end
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 288
    Top = 176
  end
  object qrProduto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select p.*,'
      'coalesce(est.estoque, 0) estoque_disponivel, '
      'coalesce(est.est_prima, 0) estoque_produzir from produtos p '
      'inner join cod_barra cb on cb.cod_prod = p.cod_prod '
      'and cb.grupo_prod = p.grupo_prod '
      'and cb.cod_empresa = p.cod_empresa '
      
        'left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.co' +
        'd_empresa, 0, '#39#39', 0, 0) est on 1 = 1'
      'where cb.cod_barra = :cod_barra '
      'and cb.cod_empresa = :cod_empresa '
      'and cb.ativo = 1 ')
    Left = 368
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspProduto: TDataSetProvider
    DataSet = qrProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 368
    Top = 80
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    BeforeOpen = cdsProdutoBeforeOpen
    Left = 368
    Top = 128
    object cdsProdutoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutoCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdutoSUB_G_PROD: TIntegerField
      FieldName = 'SUB_G_PROD'
    end
    object cdsProdutoEST_F: TFloatField
      FieldName = 'EST_F'
    end
    object cdsProdutoEST_R: TFloatField
      FieldName = 'EST_R'
    end
    object cdsProdutoPREC_CUS_PROD: TFloatField
      FieldName = 'PREC_CUS_PROD'
      currency = True
    end
    object cdsProdutoPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      currency = True
    end
    object cdsProdutoLOCACAO_PROD: TStringField
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsProdutoLOCACAO_PROD_1: TStringField
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
    object cdsProdutoAPLICACAO_PROD: TStringField
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
    object cdsProdutoDATA_ULT_COMPRA: TDateTimeField
      FieldName = 'DATA_ULT_COMPRA'
    end
    object cdsProdutoVL_ULT_COMPRA: TFloatField
      FieldName = 'VL_ULT_COMPRA'
    end
    object cdsProdutoN_CRI_PROD: TFloatField
      FieldName = 'N_CRI_PROD'
    end
    object cdsProdutoN_MIN_PROD: TFloatField
      FieldName = 'N_MIN_PROD'
    end
    object cdsProdutoN_MAX_PROD: TFloatField
      FieldName = 'N_MAX_PROD'
    end
    object cdsProdutoPREC_REP_PROD: TFloatField
      FieldName = 'PREC_REP_PROD'
    end
    object cdsProdutoCLASSE_PROD: TStringField
      FieldName = 'CLASSE_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoQUANT_PED_PROD: TFloatField
      FieldName = 'QUANT_PED_PROD'
    end
    object cdsProdutoQUANT_TR_PROD: TFloatField
      FieldName = 'QUANT_TR_PROD'
    end
    object cdsProdutoDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdutoIPI_PROD: TFloatField
      FieldName = 'IPI_PROD'
    end
    object cdsProdutoNUM_NF_REC: TIntegerField
      FieldName = 'NUM_NF_REC'
    end
    object cdsProdutoQUANT_RET_PROD: TFloatField
      FieldName = 'QUANT_RET_PROD'
    end
    object cdsProdutoICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
    end
    object cdsProdutoQREQ_PROD: TFloatField
      FieldName = 'QREQ_PROD'
    end
    object cdsProdutoQCONF_PROD: TFloatField
      FieldName = 'QCONF_PROD'
    end
    object cdsProdutoPERC_TB_PROD: TFloatField
      FieldName = 'PERC_TB_PROD'
    end
    object cdsProdutoNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdutoPREC_30_PROD: TFloatField
      FieldName = 'PREC_30_PROD'
      currency = True
    end
    object cdsProdutoPREC_60_PROD: TFloatField
      FieldName = 'PREC_60_PROD'
      currency = True
    end
    object cdsProdutoPREC_90_PROD: TFloatField
      FieldName = 'PREC_90_PROD'
      currency = True
    end
    object cdsProdutoMARCA_P: TStringField
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 10
    end
    object cdsProdutoALT_COD_CUPOM: TStringField
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPERC_RED_PROD: TFloatField
      FieldName = 'PERC_RED_PROD'
    end
    object cdsProdutoCOD_CUST_PROD: TStringField
      FieldName = 'COD_CUST_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsProdutoCOMISSAO_PROD: TFloatField
      FieldName = 'COMISSAO_PROD'
    end
    object cdsProdutoISENTO_PROD: TStringField
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoN_INCIDENCIA_PROD: TStringField
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoQUANT_PROD_BL: TFloatField
      FieldName = 'QUANT_PROD_BL'
    end
    object cdsProdutoLOCACAO1_BL: TStringField
      FieldName = 'LOCACAO1_BL'
      FixedChar = True
      Size = 8
    end
    object cdsProdutoLOCACAO2_BL: TStringField
      FieldName = 'LOCACAO2_BL'
      FixedChar = True
      Size = 8
    end
    object cdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProdutoPERC_TB_PROD3: TFloatField
      FieldName = 'PERC_TB_PROD3'
    end
    object cdsProdutoPERC_TB_PROD6: TFloatField
      FieldName = 'PERC_TB_PROD6'
    end
    object cdsProdutoPERC_TB_PROD9: TFloatField
      FieldName = 'PERC_TB_PROD9'
    end
    object cdsProdutoALT_DESC_CUPOM: TStringField
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCST_PROD: TStringField
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsProdutoCLINV: TStringField
      FieldName = 'CLINV'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCLPRECO: TStringField
      FieldName = 'CLPRECO'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoCLPOP: TStringField
      FieldName = 'CLPOP'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoCLQTV: TStringField
      FieldName = 'CLQTV'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoCLFRV: TStringField
      FieldName = 'CLFRV'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoCLATL: TStringField
      FieldName = 'CLATL'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoDT_ULT_VND: TDateTimeField
      FieldName = 'DT_ULT_VND'
    end
    object cdsProdutoDT_ULT_VNDA: TDateTimeField
      FieldName = 'DT_ULT_VNDA'
    end
    object cdsProdutoPREC_PUBLICO: TFloatField
      FieldName = 'PREC_PUBLICO'
      currency = True
    end
    object cdsProdutoCOD_PPS: TStringField
      FieldName = 'COD_PPS'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoDAT_CAD_PROD: TDateTimeField
      FieldName = 'DAT_CAD_PROD'
    end
    object cdsProdutoDAT_MOD_PROD: TDateTimeField
      FieldName = 'DAT_MOD_PROD'
    end
    object cdsProdutoPREC_CUSR_PROD: TFloatField
      FieldName = 'PREC_CUSR_PROD'
    end
    object cdsProdutoCOD_DSGS: TStringField
      FieldName = 'COD_DSGS'
      FixedChar = True
      Size = 6
    end
    object cdsProdutoISENTO_PIS: TStringField
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoESTC: TFloatField
      FieldName = 'ESTC'
    end
    object cdsProdutoESTS: TFloatField
      FieldName = 'ESTS'
    end
    object cdsProdutoESTM: TFloatField
      FieldName = 'ESTM'
    end
    object cdsProdutoPREC_CUS_MNF: TFloatField
      FieldName = 'PREC_CUS_MNF'
    end
    object cdsProdutoEMB_PROD: TStringField
      FieldName = 'EMB_PROD'
      FixedChar = True
      Size = 10
    end
    object cdsProdutoPERC_SUBSTTR: TFloatField
      FieldName = 'PERC_SUBSTTR'
    end
    object cdsProdutoQTDEMB: TFloatField
      FieldName = 'QTDEMB'
    end
    object cdsProdutoBALANCA_PROD: TStringField
      FieldName = 'BALANCA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoVALIDADE_PROD: TStringField
      FieldName = 'VALIDADE_PROD'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoPREC_CUSR_MNF: TFloatField
      FieldName = 'PREC_CUSR_MNF'
    end
    object cdsProdutoPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsProdutoPERC_FRETE_PROD: TFloatField
      FieldName = 'PERC_FRETE_PROD'
    end
    object cdsProdutoPREC_CUSMR_PROD: TFloatField
      FieldName = 'PREC_CUSMR_PROD'
    end
    object cdsProdutoESTSUBSTR: TStringField
      FieldName = 'ESTSUBSTR'
      FixedChar = True
      Size = 80
    end
    object cdsProdutoCOMISSAO_PROD_GER: TFloatField
      FieldName = 'COMISSAO_PROD_GER'
    end
    object cdsProdutoCUSTO_HONDA: TFloatField
      FieldName = 'CUSTO_HONDA'
    end
    object cdsProdutoALIQ_RED_PROD: TFloatField
      FieldName = 'ALIQ_RED_PROD'
    end
    object cdsProdutoTIP_PROD_IND: TStringField
      FieldName = 'TIP_PROD_IND'
      FixedChar = True
      Size = 5
    end
    object cdsProdutoPERC_TB_ATAC: TFloatField
      FieldName = 'PERC_TB_ATAC'
    end
    object cdsProdutoPERC_TB_VARE: TFloatField
      FieldName = 'PERC_TB_VARE'
    end
    object cdsProdutoICMANT_SUB: TFloatField
      FieldName = 'ICMANT_SUB'
    end
    object cdsProdutoNEC_ACOMP: TStringField
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoDIAS_ACOMP: TIntegerField
      FieldName = 'DIAS_ACOMP'
    end
    object cdsProdutoNBM: TStringField
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsProdutoPERC_AD_30: TFloatField
      FieldName = 'PERC_AD_30'
    end
    object cdsProdutoPERC_AD_60: TFloatField
      FieldName = 'PERC_AD_60'
    end
    object cdsProdutoPERC_AD_90: TFloatField
      FieldName = 'PERC_AD_90'
    end
    object cdsProdutoDATA_MOD_PR: TDateTimeField
      FieldName = 'DATA_MOD_PR'
    end
    object cdsProdutoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsProdutoPESO_LIQ_PROD: TFloatField
      FieldName = 'PESO_LIQ_PROD'
    end
    object cdsProdutoPESO_BRUT_PROD: TFloatField
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsProdutoLOC_DEP: TStringField
      FieldName = 'LOC_DEP'
      FixedChar = True
      Size = 8
    end
    object cdsProdutoCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object cdsProdutoTOT_ALIQ: TStringField
      FieldName = 'TOT_ALIQ'
      FixedChar = True
      Size = 4
    end
    object cdsProdutoDATA_ULT_AJUSTE: TDateTimeField
      FieldName = 'DATA_ULT_AJUSTE'
    end
    object cdsProdutoPRECO_AJUSTE: TFloatField
      FieldName = 'PRECO_AJUSTE'
    end
    object cdsProdutoALIQ_INTERNA_NFENT: TFloatField
      FieldName = 'ALIQ_INTERNA_NFENT'
    end
    object cdsProdutoCOD_RECEITA: TIntegerField
      FieldName = 'COD_RECEITA'
    end
    object cdsProdutoPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoARREDONDAR_TRUNCAR: TStringField
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoEM_PROMOCAO: TStringField
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
      currency = True
    end
    object cdsProdutoTIPO_FAB: TStringField
      FieldName = 'TIPO_FAB'
      Size = 1
    end
    object cdsProdutoCSDECQTDE: TStringField
      FieldName = 'CSDECQTDE'
      Size = 1
    end
    object cdsProdutoCSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object cdsProdutoDESCR_PROD_RED: TStringField
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsProdutoCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoBASEICMANT_SUB: TFloatField
      FieldName = 'BASEICMANT_SUB'
    end
    object cdsProdutoVALORGE: TFloatField
      FieldName = 'VALORGE'
    end
    object cdsProdutoVALORPME: TFloatField
      FieldName = 'VALORPME'
    end
    object cdsProdutoQTDPROD_EXCESSO: TFloatField
      FieldName = 'QTDPROD_EXCESSO'
    end
    object cdsProdutoQTDDIAS_EXCESSO: TFloatField
      FieldName = 'QTDDIAS_EXCESSO'
    end
    object cdsProdutoEST_SEGURANCA: TIntegerField
      FieldName = 'EST_SEGURANCA'
    end
    object cdsProdutoFREQ_PEDIDO: TIntegerField
      FieldName = 'FREQ_PEDIDO'
    end
    object cdsProdutoDMD: TFloatField
      FieldName = 'DMD'
    end
    object cdsProdutoTCUTILIZADO: TFloatField
      FieldName = 'TCUTILIZADO'
    end
    object cdsProdutoPERC_TB_PRODA: TFloatField
      FieldName = 'PERC_TB_PRODA'
    end
    object cdsProdutoMARGMINCCUSTOV: TFloatField
      FieldName = 'MARGMINCCUSTOV'
    end
    object cdsProdutoMARGMINCCUSTOA: TFloatField
      FieldName = 'MARGMINCCUSTOA'
    end
    object cdsProdutoTRIBUTACAO: TStringField
      FieldName = 'TRIBUTACAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoECF: TStringField
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoNUM_BANCA: TIntegerField
      FieldName = 'NUM_BANCA'
    end
    object cdsProdutoDATA_ALT_PRECO: TDateTimeField
      FieldName = 'DATA_ALT_PRECO'
    end
    object cdsProdutoTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoQTD_ETIQUETAS: TIntegerField
      FieldName = 'QTD_ETIQUETAS'
    end
    object cdsProdutoESTOQUE_DISPONIVEL: TFloatField
      FieldName = 'ESTOQUE_DISPONIVEL'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutoESTOQUE_PRODUZIR: TFloatField
      FieldName = 'ESTOQUE_PRODUZIR'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutoUSAR_DEBCRED: TStringField
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 368
    Top = 176
  end
  object dspGrade: TDataSetProvider
    DataSet = qrGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 208
    Top = 80
  end
  object cdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrade'
    BeforeOpen = cdsGradeBeforeOpen
    Left = 208
    Top = 128
    object cdsGradeGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"COD_GRADE_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGradeCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Origin = '"COD_GRADE_PROD"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = '"COD_GRADE_PROD"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGradeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"COD_GRADE_PROD"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGradeQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = '"COD_GRADE_PROD"."QTDE"'
    end
    object cdsGradeATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"COD_GRADE_PROD"."ATIVO"'
    end
    object cdsGradeQTD_ETIQUETAS: TIntegerField
      FieldName = 'QTD_ETIQUETAS'
      Origin = '"COD_GRADE_PROD"."QTD_ETIQUETAS"'
    end
    object cdsGradeCOD_GRADE1: TIntegerField
      FieldName = 'COD_GRADE1'
      Origin = '"GRADE"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGradeCOD_EMPRESA1: TIntegerField
      FieldName = 'COD_EMPRESA1'
      Origin = '"GRADE"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRADE"."DESCRICAO"'
      Size = 32
    end
    object cdsGradeDESCRICAO1: TStringField
      FieldName = 'DESCRICAO1'
      Origin = '"GRADE"."DESCRICAO1"'
      Size = 32
    end
    object cdsGradeATIVO1: TIntegerField
      FieldName = 'ATIVO1'
      Origin = '"GRADE"."ATIVO"'
    end
  end
  object dsGrade: TDataSource
    DataSet = cdsGrade
    Left = 208
    Top = 176
  end
  object qrDevolGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from DEVOLUCAO_GRADE'
      'where cod_empresa = :cod_empresa'
      'and COD_DEVOLUCAO = 0'
      'and ativo = 1'
      '')
    Left = 448
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspDevolGrade: TDataSetProvider
    DataSet = qrDevolGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 448
    Top = 80
  end
  object cdsDevolGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDevolGrade'
    BeforeOpen = cdsDevolGradeBeforeOpen
    Left = 448
    Top = 128
    object cdsDevolGradeCOD_DEVOLUCAO: TIntegerField
      FieldName = 'COD_DEVOLUCAO'
      Required = True
    end
    object cdsDevolGradeGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsDevolGradeCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDevolGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsDevolGradeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDevolGradeQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object cdsDevolGradeATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsDevolGradeSEQID: TIntegerField
      FieldName = 'SEQID'
      Required = True
    end
  end
  object dsDevolGrade: TDataSource
    DataSet = cdsDevolGrade
    Left = 448
    Top = 176
  end
  object strVoltaGrade: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    StoredProcName = 'VOLTA_ESTOQUE_GRADE'
    Left = 630
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VCOD_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_GRADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object strVoltaEstoque: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    StoredProcName = 'AUMENTA_ESTOQUE'
    Left = 632
    Top = 312
  end
  object qrRecibo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from recibos where STATUS_REC IS NULL'
      'and cod_empresa = :cod_empresa and ativo=1'
      '')
    Left = 536
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspRecibo: TDataSetProvider
    DataSet = qrRecibo
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 536
    Top = 80
  end
  object cdsRecibo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecibo'
    BeforeOpen = cdsReciboBeforeOpen
    Left = 536
    Top = 128
    object cdsReciboNRECIBO: TIntegerField
      FieldName = 'NRECIBO'
      Required = True
    end
    object cdsReciboCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsReciboVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsReciboREFERENCIA1: TStringField
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA3: TStringField
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA4: TStringField
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object cdsReciboBENEF_CLIENT: TStringField
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object cdsReciboNOME_DEV: TStringField
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object cdsReciboDATA_REC: TDateTimeField
      FieldName = 'DATA_REC'
    end
    object cdsReciboLOCALDATA: TStringField
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object cdsReciboRECANT: TStringField
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object cdsReciboSTATUS_REC: TStringField
      FieldName = 'STATUS_REC'
      FixedChar = True
      Size = 10
    end
    object cdsReciboCOD_BENEF: TIntegerField
      FieldName = 'COD_BENEF'
    end
    object cdsReciboDEPREC: TStringField
      FieldName = 'DEPREC'
      FixedChar = True
      Size = 1
    end
    object cdsReciboNDOCANT: TIntegerField
      FieldName = 'NDOCANT'
    end
    object cdsReciboDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
    end
    object cdsReciboN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
    end
    object cdsReciboOBS_CXL_RQ: TStringField
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object cdsReciboSTATUS_CXL_RQ: TStringField
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsReciboVL_RQ_PG_CXL: TFloatField
      FieldName = 'VL_RQ_PG_CXL'
    end
    object cdsReciboDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object cdsReciboHISTORICO_REC: TStringField
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object cdsReciboCOD_PREP: TIntegerField
      FieldName = 'COD_PREP'
    end
    object cdsReciboSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsReciboOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsReciboCOD_US: TIntegerField
      FieldName = 'COD_US'
    end
    object cdsReciboATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsReciboCOD_DEVEDOR: TIntegerField
      FieldName = 'COD_DEVEDOR'
    end
    object cdsReciboVALOR_ORIG: TFloatField
      FieldName = 'VALOR_ORIG'
    end
    object cdsReciboNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
    end
    object cdsReciboSERIE_NF: TStringField
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object cdsReciboNUM_REC_DEP: TStringField
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object cdsReciboATRAVES1: TStringField
      FieldName = 'ATRAVES1'
      Size = 66
    end
    object cdsReciboATRAVES2: TStringField
      FieldName = 'ATRAVES2'
      Size = 66
    end
    object cdsReciboATRAVES3: TStringField
      FieldName = 'ATRAVES3'
      Size = 66
    end
    object cdsReciboOBSERVACAO1: TStringField
      FieldName = 'OBSERVACAO1'
      Size = 66
    end
    object cdsReciboOBSERVACAO2: TStringField
      FieldName = 'OBSERVACAO2'
      Size = 66
    end
    object cdsReciboOBSERVACAO3: TStringField
      FieldName = 'OBSERVACAO3'
      Size = 66
    end
    object cdsReciboCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
    end
    object cdsReciboDATA_VENC: TDateTimeField
      FieldName = 'DATA_VENC'
    end
  end
  object dsRecibo: TDataSource
    DataSet = cdsRecibo
    Left = 536
    Top = 176
  end
  object qrClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 608
    Top = 32
  end
  object dspClientes: TDataSetProvider
    DataSet = qrClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 608
    Top = 80
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    BeforeOpen = cdsClientesBeforeOpen
    Left = 608
    Top = 127
    object cdsClientesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClientesCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsClientesCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsClientesCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
    end
    object cdsClientesCODIGO_FATURAMENTO: TIntegerField
      FieldName = 'CODIGO_FATURAMENTO'
    end
    object cdsClientesEST_CODIGO_UF: TIntegerField
      FieldName = 'EST_CODIGO_UF'
      Required = True
    end
    object cdsClientesCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsClientesINSC_EST: TStringField
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsClientesFAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object cdsClientesCIDA_COBRANCA: TStringField
      FieldName = 'CIDA_COBRANCA'
      Size = 30
    end
    object cdsClientesCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      FixedChar = True
      Size = 9
    end
    object cdsClientesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsClientesDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object cdsClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 10
    end
    object cdsClientesNATURALID: TStringField
      FieldName = 'NATURALID'
    end
    object cdsClientesCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 35
    end
    object cdsClientesLOC_TRAB: TStringField
      FieldName = 'LOC_TRAB'
      Size = 30
    end
    object cdsClientesEND_TRAB: TStringField
      FieldName = 'END_TRAB'
      Size = 35
    end
    object cdsClientesFONE_TRAB: TStringField
      FieldName = 'FONE_TRAB'
      FixedChar = True
      Size = 14
    end
    object cdsClientesCARGO: TStringField
      FieldName = 'CARGO'
      Size = 15
    end
    object cdsClientesRG: TStringField
      FieldName = 'RG'
      FixedChar = True
      Size = 10
    end
    object cdsClientesEXPEDIC: TDateTimeField
      FieldName = 'EXPEDIC'
    end
    object cdsClientesORG_EXPEDIC: TStringField
      FieldName = 'ORG_EXPEDIC'
    end
    object cdsClientesCTPS: TStringField
      FieldName = 'CTPS'
      FixedChar = True
      Size = 10
    end
    object cdsClientesREF_BANC1: TStringField
      FieldName = 'REF_BANC1'
      Size = 30
    end
    object cdsClientesFONE_BANC1: TStringField
      FieldName = 'FONE_BANC1'
      FixedChar = True
      Size = 14
    end
    object cdsClientesREF_BANC2: TStringField
      FieldName = 'REF_BANC2'
      Size = 30
    end
    object cdsClientesFONE_BANC2: TStringField
      FieldName = 'FONE_BANC2'
      FixedChar = True
      Size = 14
    end
    object cdsClientesREF_COM1: TStringField
      FieldName = 'REF_COM1'
      Size = 30
    end
    object cdsClientesEND_COM1: TStringField
      FieldName = 'END_COM1'
      Size = 30
    end
    object cdsClientesFONE_COM1: TStringField
      FieldName = 'FONE_COM1'
      FixedChar = True
      Size = 14
    end
    object cdsClientesINFORM: TStringField
      FieldName = 'INFORM'
      Size = 30
    end
    object cdsClientesPRI_COMPR: TDateTimeField
      FieldName = 'PRI_COMPR'
    end
    object cdsClientesULT_COMPR: TDateTimeField
      FieldName = 'ULT_COMPR'
    end
    object cdsClientesCONCEITO: TStringField
      FieldName = 'CONCEITO'
      Size = 15
    end
    object cdsClientesREF_COM2: TStringField
      FieldName = 'REF_COM2'
      Size = 30
    end
    object cdsClientesEND_COM2: TStringField
      FieldName = 'END_COM2'
      Size = 30
    end
    object cdsClientesFONE_COM2: TStringField
      FieldName = 'FONE_COM2'
      FixedChar = True
      Size = 14
    end
    object cdsClientesINFORM2: TStringField
      FieldName = 'INFORM2'
      Size = 30
    end
    object cdsClientesPRI_COMPR2: TDateTimeField
      FieldName = 'PRI_COMPR2'
    end
    object cdsClientesULT_COMPR2: TDateTimeField
      FieldName = 'ULT_COMPR2'
    end
    object cdsClientesCONCEITO2: TStringField
      FieldName = 'CONCEITO2'
      Size = 15
    end
    object cdsClientesSPCL: TDateTimeField
      FieldName = 'SPCL'
    end
    object cdsClientesSPCEST: TDateTimeField
      FieldName = 'SPCEST'
    end
    object cdsClientesREGSPC: TDateTimeField
      FieldName = 'REGSPC'
    end
    object cdsClientesREGSPCCH: TDateTimeField
      FieldName = 'REGSPCCH'
    end
    object cdsClientesUS_CAD_CLI: TIntegerField
      FieldName = 'US_CAD_CLI'
    end
    object cdsClientesFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
    end
    object cdsClientesEND_COBRANCA: TStringField
      FieldName = 'END_COBRANCA'
      Size = 50
    end
    object cdsClientesBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 35
    end
    object cdsClientesOBS_DIV: TMemoField
      FieldName = 'OBS_DIV'
      BlobType = ftMemo
      Size = 8
    end
    object cdsClientesPAI: TStringField
      FieldName = 'PAI'
      Size = 35
    end
    object cdsClientesMAE: TStringField
      FieldName = 'MAE'
      Size = 35
    end
    object cdsClientesDATA_NASC: TDateTimeField
      FieldName = 'DATA_NASC'
    end
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsClientesCOD_CONVENIO: TIntegerField
      FieldName = 'COD_CONVENIO'
    end
    object cdsClientesCONVENIADO: TStringField
      FieldName = 'CONVENIADO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesDIA_VENC: TIntegerField
      FieldName = 'DIA_VENC'
    end
    object cdsClientesDATA_MOD_CAD: TDateTimeField
      FieldName = 'DATA_MOD_CAD'
    end
    object cdsClientesCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
    end
    object cdsClientesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 8
    end
    object cdsClientesCLQTDCOMPRA: TStringField
      FieldName = 'CLQTDCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLSOMACOMPRA: TStringField
      FieldName = 'CLSOMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLULTIMACOMPRA: TStringField
      FieldName = 'CLULTIMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLATRASOCOMPRA: TStringField
      FieldName = 'CLATRASOCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLLUCROCLIENTE: TStringField
      FieldName = 'CLLUCROCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsClientesLUCROCLIENTE: TFloatField
      FieldName = 'LUCROCLIENTE'
    end
    object cdsClientesTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      FixedChar = True
      Size = 6
    end
    object cdsClientesCLQTDVEICULO: TStringField
      FieldName = 'CLQTDVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLSOMAVEICULO: TStringField
      FieldName = 'CLSOMAVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLULTIMOVEICULO: TStringField
      FieldName = 'CLULTIMOVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLLUCROVEICULO: TStringField
      FieldName = 'CLLUCROVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesLUCROCLIENTE_V: TFloatField
      FieldName = 'LUCROCLIENTE_V'
    end
    object cdsClientesV_Q_VEICULO: TFloatField
      FieldName = 'V_Q_VEICULO'
    end
    object cdsClientesM_Q_VEICULO: TFloatField
      FieldName = 'M_Q_VEICULO'
    end
    object cdsClientesV_T_VEICULO: TFloatField
      FieldName = 'V_T_VEICULO'
    end
    object cdsClientesM_T_VEICULO: TFloatField
      FieldName = 'M_T_VEICULO'
    end
    object cdsClientesV_L_VEICULO: TFloatField
      FieldName = 'V_L_VEICULO'
    end
    object cdsClientesM_L_VEICULO: TFloatField
      FieldName = 'M_L_VEICULO'
    end
    object cdsClientesDATA_ULT_VENDA_V: TDateTimeField
      FieldName = 'DATA_ULT_VENDA_V'
    end
    object cdsClientesMEDIA_FREQUENCIA_V: TFloatField
      FieldName = 'MEDIA_FREQUENCIA_V'
    end
    object cdsClientesMEDIAFREQUENCIA: TFloatField
      FieldName = 'MEDIAFREQUENCIA'
    end
    object cdsClientesV_Q_COMPRA: TFloatField
      FieldName = 'V_Q_COMPRA'
    end
    object cdsClientesM_Q_COMPRA: TFloatField
      FieldName = 'M_Q_COMPRA'
    end
    object cdsClientesV_T_COMPRA: TFloatField
      FieldName = 'V_T_COMPRA'
    end
    object cdsClientesM_T_COMPRA: TFloatField
      FieldName = 'M_T_COMPRA'
    end
    object cdsClientesV_L_COMPRA: TFloatField
      FieldName = 'V_L_COMPRA'
    end
    object cdsClientesM_L_COMPRA: TFloatField
      FieldName = 'M_L_COMPRA'
    end
    object cdsClientesV_A_COMPRA: TFloatField
      FieldName = 'V_A_COMPRA'
    end
    object cdsClientesM_A_COMPRA: TFloatField
      FieldName = 'M_A_COMPRA'
    end
    object cdsClientesDATA_ULT_COMPRA: TDateTimeField
      FieldName = 'DATA_ULT_COMPRA'
    end
    object cdsClientesNEC_ACOMP: TStringField
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsClientesDIAS_ACOMP: TIntegerField
      FieldName = 'DIAS_ACOMP'
    end
    object cdsClientesSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesRAMO_ATIVIDADE: TStringField
      FieldName = 'RAMO_ATIVIDADE'
      Size = 60
    end
    object cdsClientesCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsClientesCOD_BAIRRO: TSmallintField
      FieldName = 'COD_BAIRRO'
    end
    object cdsClientesCOD_CIDADE_COBRANCA: TSmallintField
      FieldName = 'COD_CIDADE_COBRANCA'
    end
    object cdsClientesCOD_BAIRRO_COBRANCA: TSmallintField
      FieldName = 'COD_BAIRRO_COBRANCA'
    end
    object cdsClientesESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 32
    end
    object cdsClientesTIPVCLIENTE: TStringField
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCAMP_PR_VENDA: TStringField
      FieldName = 'CAMP_PR_VENDA'
    end
    object cdsClientesPERC_DESC: TFloatField
      FieldName = 'PERC_DESC'
    end
    object cdsClientesATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsClientesCOD_CONTADOR: TIntegerField
      FieldName = 'COD_CONTADOR'
    end
    object cdsClientesBARRADO: TStringField
      FieldName = 'BARRADO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesNUM_END_CLIENTE: TStringField
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsClientesTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesUSUARIO_C: TStringField
      FieldName = 'USUARIO_C'
    end
    object cdsClientesSENHA_C: TStringField
      FieldName = 'SENHA_C'
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsClientesINSC_SUB_F: TStringField
      FieldName = 'INSC_SUB_F'
      FixedChar = True
      Size = 18
    end
    object cdsClientesCDMICROEPP: TStringField
      FieldName = 'CDMICROEPP'
      FixedChar = True
      Size = 1
    end
    object cdsClientesTEL_RES_CF: TStringField
      FieldName = 'TEL_RES_CF'
      FixedChar = True
      Size = 14
    end
    object cdsClientesRAMAL: TStringField
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 5
    end
    object cdsClientesCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsClientesREGIME: TStringField
      FieldName = 'REGIME'
    end
    object cdsClientesRENDA_INDVIDUAL: TFloatField
      FieldName = 'RENDA_INDVIDUAL'
    end
    object cdsClientesCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 608
    Top = 177
  end
  object strIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 632
    Top = 416
  end
  object qrGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from COD_GRADE_PROD C, GRADE G'
      'where C.cod_grade = G.cod_grade'
      'and C.cod_prod = :cod_prod '
      'and C.grupo_prod = :grupo_prod '
      'and C.cod_empresa = :cod_empresa '
      'and C.ativo = 1 ')
    Left = 208
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object qrVendedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select nome_vendedor, cod_vendedor'
      'from colaborador'
      'where cod_vendedor = :cod_vendedor'
      'and cod_empresa = :cod_empresa'
      'and ativo = 1')
    Left = 48
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspVendedor: TDataSetProvider
    DataSet = qrVendedor
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 48
    Top = 304
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor'
    BeforeOpen = cdsVendedorBeforeOpen
    Left = 48
    Top = 352
    object cdsVendedorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 48
    Top = 400
  end
  object qrBuscas02: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from pedvenda'
      'where ativo = 1'
      'and data_fech >= :dataini'
      'and data_fech <= :datafin'
      'and nped = :nped'
      'and cod_cliente = :cod_cliente'
      'and cod_empresa = :cod_empresa')
    Left = 448
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dsBuscas02: TDataSource
    DataSet = qrBuscas02
    Left = 448
    Top = 306
  end
  object Rdp1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'LESTE INFORMATICA LTDA - ME'
    RegistroUsuario.SerieProduto = 'SINGLE-0113/01448'
    RegistroUsuario.AutorizacaoKey = 'VUYG-1QQX-P85V-AWCD-RR5K'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 132
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 632
    Top = 264
  end
  object qrPedvenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      
        'select pedvenda.*, dev_vnd.valor_total_dev, dev_vnd.valor_total_' +
        'apos_dev from pedvenda'
      
        'left join retorna_qtde_dev_vnd(pedvenda.nped, pedvenda.tipo, ped' +
        'venda.cod_empresa, pedvenda.valor_total) dev_vnd on 1 = 1'
      'where pedvenda.ativo = 1'
      'and pedvenda.data_fech >= :dataini'
      'and pedvenda.data_fech <= :datafin'
      'and pedvenda.nped = :nped'
      'and pedvenda.cod_cliente = :cod_cliente'
      'and pedvenda.cod_empresa = :cod_empresa')
    Left = 120
    Top = 258
    ParamData = <
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datafin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspPedvenda: TDataSetProvider
    DataSet = qrPedvenda
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 306
  end
  object cdsPedvenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datafin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPedvenda'
    BeforeOpen = cdsPedvendaBeforeOpen
    Left = 120
    Top = 354
    object cdsPedvendaNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedvendaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPedvendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedvendaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"PEDVENDA"."COD_CLIENTE"'
      Required = True
    end
    object cdsPedvendaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      Required = True
    end
    object cdsPedvendaCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Origin = '"PEDVENDA"."COD_COND_PAG"'
    end
    object cdsPedvendaN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
      Origin = '"PEDVENDA"."N_MOV_CXL"'
    end
    object cdsPedvendaDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
      Origin = '"PEDVENDA"."DIA_CXL"'
    end
    object cdsPedvendaDATA_PED: TDateTimeField
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
    end
    object cdsPedvendaDATA_FECH: TDateTimeField
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
    end
    object cdsPedvendaDATVENC: TDateTimeField
      FieldName = 'DATVENC'
      Origin = '"PEDVENDA"."DATVENC"'
    end
    object cdsPedvendaVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      DisplayFormat = '##0.00'
    end
    object cdsPedvendaDESC_P_PROD: TFloatField
      FieldName = 'DESC_P_PROD'
      Origin = '"PEDVENDA"."DESC_P_PROD"'
    end
    object cdsPedvendaDESC_P_SERV: TFloatField
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object cdsPedvendaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
    end
    object cdsPedvendaOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Origin = '"PEDVENDA"."OBS_PED"'
      Size = 50
    end
    object cdsPedvendaSTATUS_PED: TStringField
      FieldName = 'STATUS_PED'
      Origin = '"PEDVENDA"."STATUS_PED"'
      Size = 10
    end
    object cdsPedvendaTIPV: TStringField
      FieldName = 'TIPV'
      Origin = '"PEDVENDA"."TIPV"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaOBS_CXL_RQ: TStringField
      FieldName = 'OBS_CXL_RQ'
      Origin = '"PEDVENDA"."OBS_CXL_RQ"'
      Size = 50
    end
    object cdsPedvendaSTATUS_CXL_RQ: TStringField
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"PEDVENDA"."STATUS_CXL_RQ"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaVL_PAGO_CXL: TFloatField
      FieldName = 'VL_PAGO_CXL'
      Origin = '"PEDVENDA"."VL_PAGO_CXL"'
    end
    object cdsPedvendaSELEC: TStringField
      FieldName = 'SELEC'
      Origin = '"PEDVENDA"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaTIPOR: TStringField
      FieldName = 'TIPOR'
      Origin = '"PEDVENDA"."TIPOR"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaHORAABERTURA: TIntegerField
      FieldName = 'HORAABERTURA'
      Origin = '"PEDVENDA"."HORAABERTURA"'
    end
    object cdsPedvendaMINABERTURA: TIntegerField
      FieldName = 'MINABERTURA'
      Origin = '"PEDVENDA"."MINABERTURA"'
    end
    object cdsPedvendaHORAFECHAMENTO: TIntegerField
      FieldName = 'HORAFECHAMENTO'
      Origin = '"PEDVENDA"."HORAFECHAMENTO"'
    end
    object cdsPedvendaMINFECHAMENTO: TIntegerField
      FieldName = 'MINFECHAMENTO'
      Origin = '"PEDVENDA"."MINFECHAMENTO"'
    end
    object cdsPedvendaHORASUBTOTAL: TIntegerField
      FieldName = 'HORASUBTOTAL'
      Origin = '"PEDVENDA"."HORASUBTOTAL"'
    end
    object cdsPedvendaMINSUBTOTAL: TIntegerField
      FieldName = 'MINSUBTOTAL'
      Origin = '"PEDVENDA"."MINSUBTOTAL"'
    end
    object cdsPedvendaNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
      Origin = '"PEDVENDA"."NCUPOM"'
    end
    object cdsPedvendaOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = '"PEDVENDA"."OPERADOR"'
    end
    object cdsPedvendaDATA_CUPOM: TDateTimeField
      FieldName = 'DATA_CUPOM'
      Origin = '"PEDVENDA"."DATA_CUPOM"'
    end
    object cdsPedvendaDA: TStringField
      FieldName = 'DA'
      Origin = '"PEDVENDA"."DA"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Origin = '"PEDVENDA"."NSERIEECF"'
    end
    object cdsPedvendaNOME_RECEB: TStringField
      FieldName = 'NOME_RECEB'
      Origin = '"PEDVENDA"."NOME_RECEB"'
      Size = 40
    end
    object cdsPedvendaEND_RECEB: TStringField
      FieldName = 'END_RECEB'
      Origin = '"PEDVENDA"."END_RECEB"'
      Size = 35
    end
    object cdsPedvendaBAIRRO_RECEB: TStringField
      FieldName = 'BAIRRO_RECEB'
      Origin = '"PEDVENDA"."BAIRRO_RECEB"'
    end
    object cdsPedvendaCIDA_RECEB: TStringField
      FieldName = 'CIDA_RECEB'
      Origin = '"PEDVENDA"."CIDA_RECEB"'
      Size = 15
    end
    object cdsPedvendaCEP_RECEB: TStringField
      FieldName = 'CEP_RECEB'
      Origin = '"PEDVENDA"."CEP_RECEB"'
      FixedChar = True
      Size = 8
    end
    object cdsPedvendaFONE_RECEB: TStringField
      FieldName = 'FONE_RECEB'
      Origin = '"PEDVENDA"."FONE_RECEB"'
      Size = 14
    end
    object cdsPedvendaOBS_MINUTA: TMemoField
      FieldName = 'OBS_MINUTA'
      Origin = '"PEDVENDA"."OBS_MINUTA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedvendaGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA"."GRUPO_PROD"'
    end
    object cdsPedvendaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA"."COD_PROD"'
      FixedChar = True
      Size = 6
    end
    object cdsPedvendaOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
      Origin = '"PEDVENDA"."OP_CXL"'
    end
    object cdsPedvendaCOD_CIDADE_RECEB: TSmallintField
      FieldName = 'COD_CIDADE_RECEB'
      Origin = '"PEDVENDA"."COD_CIDADE_RECEB"'
    end
    object cdsPedvendaCOD_BAIRRO_RECEB: TSmallintField
      FieldName = 'COD_BAIRRO_RECEB'
      Origin = '"PEDVENDA"."COD_BAIRRO_RECEB"'
    end
    object cdsPedvendaVL_ENTRADA: TFloatField
      FieldName = 'VL_ENTRADA'
      Origin = '"PEDVENDA"."VL_ENTRADA"'
    end
    object cdsPedvendaCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Origin = '"PEDVENDA"."CODIGO_CTRL"'
    end
    object cdsPedvendaNPREVENDA: TIntegerField
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
    end
    object cdsPedvendaSTAT_REQ: TStringField
      FieldName = 'STAT_REQ'
      Origin = '"PEDVENDA"."STAT_REQ"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaACRESC_P_PROD: TFloatField
      FieldName = 'ACRESC_P_PROD'
      Origin = '"PEDVENDA"."ACRESC_P_PROD"'
    end
    object cdsPedvendaACRESC_P_SERV: TFloatField
      FieldName = 'ACRESC_P_SERV'
      Origin = '"PEDVENDA"."ACRESC_P_SERV"'
    end
    object cdsPedvendaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = '"PEDVENDA"."ACRESCIMO"'
    end
    object cdsPedvendaPLACA: TStringField
      FieldName = 'PLACA'
      Origin = '"PEDVENDA"."PLACA"'
      Size = 10
    end
    object cdsPedvendaCHASSI: TStringField
      FieldName = 'CHASSI'
      Origin = '"PEDVENDA"."CHASSI"'
      Size = 17
    end
    object cdsPedvendaKM_V: TIntegerField
      FieldName = 'KM_V'
      Origin = '"PEDVENDA"."KM_V"'
    end
    object cdsPedvendaORC_PROD: TIntegerField
      FieldName = 'ORC_PROD'
      Origin = '"PEDVENDA"."ORC_PROD"'
    end
    object cdsPedvendaDT_PROMETIDA: TDateTimeField
      FieldName = 'DT_PROMETIDA'
      Origin = '"PEDVENDA"."DT_PROMETIDA"'
    end
    object cdsPedvendaOBS_OS: TMemoField
      FieldName = 'OBS_OS'
      Origin = '"PEDVENDA"."OBS_OS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedvendaAPARELHO_PED: TStringField
      FieldName = 'APARELHO_PED'
      Origin = '"PEDVENDA"."APARELHO_PED"'
      Size = 50
    end
    object cdsPedvendaGUARDA_VOL: TStringField
      FieldName = 'GUARDA_VOL'
      Origin = '"PEDVENDA"."GUARDA_VOL"'
      Size = 10
    end
    object cdsPedvendaCOMBUST_VEIC: TStringField
      FieldName = 'COMBUST_VEIC'
      Origin = '"PEDVENDA"."COMBUST_VEIC"'
      FixedChar = True
      Size = 3
    end
    object cdsPedvendaDEFEITO: TMemoField
      FieldName = 'DEFEITO'
      Origin = '"PEDVENDA"."DEFEITO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedvendaESTADO_VEIC: TMemoField
      FieldName = 'ESTADO_VEIC'
      Origin = '"PEDVENDA"."ESTADO_VEIC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedvendaACESSORIOS: TMemoField
      FieldName = 'ACESSORIOS'
      Origin = '"PEDVENDA"."ACESSORIOS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedvendaTIPO_OS: TStringField
      FieldName = 'TIPO_OS'
      Origin = '"PEDVENDA"."TIPO_OS"'
      Size = 10
    end
    object cdsPedvendaH_ENT: TDateTimeField
      FieldName = 'H_ENT'
      Origin = '"PEDVENDA"."H_ENT"'
    end
    object cdsPedvendaH_PROMETIDA: TDateTimeField
      FieldName = 'H_PROMETIDA'
      Origin = '"PEDVENDA"."H_PROMETIDA"'
    end
    object cdsPedvendaDATA_NF: TDateTimeField
      FieldName = 'DATA_NF'
      Origin = '"PEDVENDA"."DATA_NF"'
    end
    object cdsPedvendaDT_NFGARANTIA: TDateTimeField
      FieldName = 'DT_NFGARANTIA'
      Origin = '"PEDVENDA"."DT_NFGARANTIA"'
    end
    object cdsPedvendaTOT_PROD: TFloatField
      FieldName = 'TOT_PROD'
      Origin = '"PEDVENDA"."TOT_PROD"'
    end
    object cdsPedvendaTOT_SERV: TFloatField
      FieldName = 'TOT_SERV'
      Origin = '"PEDVENDA"."TOT_SERV"'
    end
    object cdsPedvendaTP_ABORD: TStringField
      FieldName = 'TP_ABORD'
      Origin = '"PEDVENDA"."TP_ABORD"'
      FixedChar = True
      Size = 3
    end
    object cdsPedvendaFR_PAGBOSCH: TStringField
      FieldName = 'FR_PAGBOSCH'
      Origin = '"PEDVENDA"."FR_PAGBOSCH"'
      FixedChar = True
      Size = 3
    end
    object cdsPedvendaSEQ_FECH: TIntegerField
      FieldName = 'SEQ_FECH'
      Origin = '"PEDVENDA"."SEQ_FECH"'
    end
    object cdsPedvendaEM_NF: TStringField
      FieldName = 'EM_NF'
      Origin = '"PEDVENDA"."EM_NF"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Origin = '"PEDVENDA"."COD_EQUIP"'
    end
    object cdsPedvendaN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Origin = '"PEDVENDA"."N_SERIE"'
      Size = 32
    end
    object cdsPedvendaNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
      Origin = '"PEDVENDA"."NUM_NF"'
    end
    object cdsPedvendaOBS_LIVRO_REG: TStringField
      FieldName = 'OBS_LIVRO_REG'
      Origin = '"PEDVENDA"."OBS_LIVRO_REG"'
      Size = 32
    end
    object cdsPedvendaVALOR_NF: TFloatField
      FieldName = 'VALOR_NF'
      Origin = '"PEDVENDA"."VALOR_NF"'
    end
    object cdsPedvendaNF_PGARANTIA: TIntegerField
      FieldName = 'NF_PGARANTIA'
      Origin = '"PEDVENDA"."NF_PGARANTIA"'
    end
    object cdsPedvendaNOME_NF_GARANTIA: TStringField
      FieldName = 'NOME_NF_GARANTIA'
      Origin = '"PEDVENDA"."NOME_NF_GARANTIA"'
      Size = 60
    end
    object cdsPedvendaHORA_FECH: TStringField
      FieldName = 'HORA_FECH'
      Origin = '"PEDVENDA"."HORA_FECH"'
      FixedChar = True
      Size = 8
    end
    object cdsPedvendaST_TERM_SERV: TStringField
      FieldName = 'ST_TERM_SERV'
      Origin = '"PEDVENDA"."ST_TERM_SERV"'
      FixedChar = True
      Size = 10
    end
    object cdsPedvendaREGISTRO_DE_ENTREGA: TStringField
      FieldName = 'REGISTRO_DE_ENTREGA'
      Origin = '"PEDVENDA"."REGISTRO_DE_ENTREGA"'
      Size = 100
    end
    object cdsPedvendaATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"PEDVENDA"."ATIVO"'
    end
    object cdsPedvendaTIPO_ORC: TStringField
      FieldName = 'TIPO_ORC'
      Origin = '"PEDVENDA"."TIPO_ORC"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaSTATUS_CUPOM: TStringField
      FieldName = 'STATUS_CUPOM'
      Origin = '"PEDVENDA"."STATUS_CUPOM"'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaCODTERM_STATUS: TIntegerField
      FieldName = 'CODTERM_STATUS'
      Origin = '"PEDVENDA"."CODTERM_STATUS"'
    end
    object cdsPedvendaCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Origin = '"PEDVENDA"."CPFCGC"'
      FixedChar = True
      Size = 18
    end
    object cdsPedvendaNOME_CLI_ORC: TStringField
      FieldName = 'NOME_CLI_ORC'
      Origin = '"PEDVENDA"."NOME_CLI_ORC"'
      Size = 35
    end
    object cdsPedvendaCOD_ORCAMENTO: TIntegerField
      FieldName = 'COD_ORCAMENTO'
      Origin = '"PEDVENDA"."COD_ORCAMENTO"'
    end
    object cdsPedvendaOBS_RED_OS: TStringField
      FieldName = 'OBS_RED_OS'
      Origin = '"PEDVENDA"."OBS_RED_OS"'
      Size = 50
    end
    object cdsPedvendaCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
      Origin = '"PEDVENDA"."COD_VEICULO"'
    end
    object cdsPedvendaDATA_NFEXT: TDateTimeField
      FieldName = 'DATA_NFEXT'
      Origin = '"PEDVENDA"."DATA_NFEXT"'
    end
    object cdsPedvendaVALOR_NFEXT: TFloatField
      FieldName = 'VALOR_NFEXT'
      Origin = '"PEDVENDA"."VALOR_NFEXT"'
    end
    object cdsPedvendaNUM_NFEEXT: TLargeintField
      FieldName = 'NUM_NFEEXT'
    end
    object cdsPedvendaDEV: TStringField
      FieldName = 'DEV'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaVALOR_TOTAL_DEV: TFloatField
      DisplayLabel = 'Valor Total Devolvido'
      FieldName = 'VALOR_TOTAL_DEV'
      DisplayFormat = '##0.00'
    end
    object cdsPedvendaVALOR_TOTAL_APOS_DEV: TFloatField
      DisplayLabel = 'Valor Total Apos Devolucao'
      FieldName = 'VALOR_TOTAL_APOS_DEV'
      DisplayFormat = '##0.00'
    end
  end
  object dsPedvenda: TDataSource
    DataSet = cdsPedvenda
    Left = 120
    Top = 402
  end
  object qrNF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select nf.*, nfi.*'
      'from notafiscal nf, notafiscal_item nfi'
      'where nf.cod_nf = nfi.cod_nf'
      'and nf.cod_empresa = nfi.cod_empresa'
      'and nfi.tipo_item = '#39'P'#39
      'and nf.cod_nf = :codnf'
      'and nf.cod_empresa = :cod_empresa'
      '')
    Left = 288
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codnf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspNF: TDataSetProvider
    DataSet = qrNF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 304
  end
  object cdsNF: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'codnf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspNF'
    BeforeOpen = cdsNFBeforeOpen
    Left = 288
    Top = 352
    object cdsNFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"NOTAFISCAL"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNFCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"NOTAFISCAL"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNFNATUREZA_NF: TStringField
      FieldName = 'NATUREZA_NF'
      Origin = '"NOTAFISCAL"."NATUREZA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNFTIPO_NF: TStringField
      FieldName = 'TIPO_NF'
      Origin = '"NOTAFISCAL"."TIPO_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNFNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
      Origin = '"NOTAFISCAL"."NUM_NF"'
      Required = True
    end
    object cdsNFSERIE: TStringField
      FieldName = 'SERIE'
      Origin = '"NOTAFISCAL"."SERIE"'
      Size = 5
    end
    object cdsNFCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
      Origin = '"NOTAFISCAL"."CODIGO_NOP"'
    end
    object cdsNFDESC_NATOP: TStringField
      FieldName = 'DESC_NATOP'
      Origin = '"NOTAFISCAL"."DESC_NATOP"'
      Size = 128
    end
    object cdsNFCODIGO_TR: TIntegerField
      FieldName = 'CODIGO_TR'
      Origin = '"NOTAFISCAL"."CODIGO_TR"'
    end
    object cdsNFCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"NOTAFISCAL"."COD_CLIENTE"'
      Required = True
    end
    object cdsNFCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Origin = '"NOTAFISCAL"."COD_COND_PAG"'
    end
    object cdsNFCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"NOTAFISCAL"."COD_VENDEDOR"'
      Required = True
    end
    object cdsNFNUM_NFEM: TIntegerField
      FieldName = 'NUM_NFEM'
      Origin = '"NOTAFISCAL"."NUM_NFEM"'
    end
    object cdsNFDATA_CONTABIL: TDateTimeField
      FieldName = 'DATA_CONTABIL'
      Origin = '"NOTAFISCAL"."DATA_CONTABIL"'
    end
    object cdsNFDATA_LANC: TDateTimeField
      FieldName = 'DATA_LANC'
      Origin = '"NOTAFISCAL"."DATA_LANC"'
    end
    object cdsNFDATA_ENT_SAIDA: TDateTimeField
      FieldName = 'DATA_ENT_SAIDA'
      Origin = '"NOTAFISCAL"."DATA_ENT_SAIDA"'
    end
    object cdsNFHORA_ENT_SAIDA: TTimeField
      FieldName = 'HORA_ENT_SAIDA'
      Origin = '"NOTAFISCAL"."HORA_ENT_SAIDA"'
    end
    object cdsNFVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = '"NOTAFISCAL"."VALOR_TOTAL"'
    end
    object cdsNFVALOR_PROD: TFloatField
      FieldName = 'VALOR_PROD'
      Origin = '"NOTAFISCAL"."VALOR_PROD"'
    end
    object cdsNFVALOR_SERV: TFloatField
      FieldName = 'VALOR_SERV'
      Origin = '"NOTAFISCAL"."VALOR_SERV"'
    end
    object cdsNFALIQ_ICM: TFloatField
      FieldName = 'ALIQ_ICM'
      Origin = '"NOTAFISCAL"."ALIQ_ICM"'
    end
    object cdsNFBASE_ICM: TFloatField
      FieldName = 'BASE_ICM'
      Origin = '"NOTAFISCAL"."BASE_ICM"'
    end
    object cdsNFVALOR_ICM: TFloatField
      FieldName = 'VALOR_ICM'
      Origin = '"NOTAFISCAL"."VALOR_ICM"'
    end
    object cdsNFVALOR_DESC: TFloatField
      FieldName = 'VALOR_DESC'
      Origin = '"NOTAFISCAL"."VALOR_DESC"'
    end
    object cdsNFVALOR_DESC_P: TFloatField
      FieldName = 'VALOR_DESC_P'
      Origin = '"NOTAFISCAL"."VALOR_DESC_P"'
    end
    object cdsNFVALOR_DESC_S: TFloatField
      FieldName = 'VALOR_DESC_S'
      Origin = '"NOTAFISCAL"."VALOR_DESC_S"'
    end
    object cdsNFALIQ_IRRF: TFloatField
      FieldName = 'ALIQ_IRRF'
      Origin = '"NOTAFISCAL"."ALIQ_IRRF"'
    end
    object cdsNFALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
      Origin = '"NOTAFISCAL"."ALIQ_ISS"'
    end
    object cdsNFBASE_ISS: TFloatField
      FieldName = 'BASE_ISS'
      Origin = '"NOTAFISCAL"."BASE_ISS"'
    end
    object cdsNFVALOR_ISS: TFloatField
      FieldName = 'VALOR_ISS'
      Origin = '"NOTAFISCAL"."VALOR_ISS"'
    end
    object cdsNFBASE_ICMSUB: TFloatField
      FieldName = 'BASE_ICMSUB'
      Origin = '"NOTAFISCAL"."BASE_ICMSUB"'
    end
    object cdsNFVALOR_ICMSUB: TFloatField
      FieldName = 'VALOR_ICMSUB'
      Origin = '"NOTAFISCAL"."VALOR_ICMSUB"'
    end
    object cdsNFBASE_IPI: TFloatField
      FieldName = 'BASE_IPI'
      Origin = '"NOTAFISCAL"."BASE_IPI"'
    end
    object cdsNFVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
      Origin = '"NOTAFISCAL"."VALOR_IPI"'
    end
    object cdsNFVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
      Origin = '"NOTAFISCAL"."VALOR_FRETE"'
    end
    object cdsNFVALOR_SEGURO: TFloatField
      FieldName = 'VALOR_SEGURO'
      Origin = '"NOTAFISCAL"."VALOR_SEGURO"'
    end
    object cdsNFVALOR_OUT_DESP: TFloatField
      FieldName = 'VALOR_OUT_DESP'
      Origin = '"NOTAFISCAL"."VALOR_OUT_DESP"'
    end
    object cdsNFVALOR_DESP_PF: TFloatField
      FieldName = 'VALOR_DESP_PF'
      Origin = '"NOTAFISCAL"."VALOR_DESP_PF"'
    end
    object cdsNFVALOR_ACRES_FIN: TFloatField
      FieldName = 'VALOR_ACRES_FIN'
      Origin = '"NOTAFISCAL"."VALOR_ACRES_FIN"'
    end
    object cdsNFVALOR_PIS: TFloatField
      FieldName = 'VALOR_PIS'
      Origin = '"NOTAFISCAL"."VALOR_PIS"'
    end
    object cdsNFVALOR_PIS_ST: TFloatField
      FieldName = 'VALOR_PIS_ST'
      Origin = '"NOTAFISCAL"."VALOR_PIS_ST"'
    end
    object cdsNFVALOR_COFINS: TFloatField
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTAFISCAL"."VALOR_COFINS"'
    end
    object cdsNFVALOR_COFINS_ST: TFloatField
      FieldName = 'VALOR_COFINS_ST'
      Origin = '"NOTAFISCAL"."VALOR_COFINS_ST"'
    end
    object cdsNFBASE_IRRF: TFloatField
      FieldName = 'BASE_IRRF'
      Origin = '"NOTAFISCAL"."BASE_IRRF"'
    end
    object cdsNFVALOR_IRRF: TFloatField
      FieldName = 'VALOR_IRRF'
      Origin = '"NOTAFISCAL"."VALOR_IRRF"'
    end
    object cdsNFSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = '"NOTAFISCAL"."STATUS"'
      Size = 10
    end
    object cdsNFOBS: TMemoField
      FieldName = 'OBS'
      Origin = '"NOTAFISCAL"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFFRETE_BASE_IPI: TStringField
      FieldName = 'FRETE_BASE_IPI'
      Origin = '"NOTAFISCAL"."FRETE_BASE_IPI"'
      FixedChar = True
      Size = 1
    end
    object cdsNFFRETE_F_NFE: TStringField
      FieldName = 'FRETE_F_NFE'
      Origin = '"NOTAFISCAL"."FRETE_F_NFE"'
      FixedChar = True
      Size = 1
    end
    object cdsNFFRETE_BASE_ICM: TStringField
      FieldName = 'FRETE_BASE_ICM'
      Origin = '"NOTAFISCAL"."FRETE_BASE_ICM"'
      FixedChar = True
      Size = 1
    end
    object cdsNFFRETECONTA_TR: TStringField
      FieldName = 'FRETECONTA_TR'
      Origin = '"NOTAFISCAL"."FRETECONTA_TR"'
      FixedChar = True
      Size = 1
    end
    object cdsNFPLACA_TR: TStringField
      FieldName = 'PLACA_TR'
      Origin = '"NOTAFISCAL"."PLACA_TR"'
      Size = 7
    end
    object cdsNFUF_PLACA_TR: TStringField
      FieldName = 'UF_PLACA_TR'
      Origin = '"NOTAFISCAL"."UF_PLACA_TR"'
      FixedChar = True
      Size = 2
    end
    object cdsNFQTDE_VOLUMES_TR: TIntegerField
      FieldName = 'QTDE_VOLUMES_TR'
      Origin = '"NOTAFISCAL"."QTDE_VOLUMES_TR"'
    end
    object cdsNFESPECIE_TR: TStringField
      FieldName = 'ESPECIE_TR'
      Origin = '"NOTAFISCAL"."ESPECIE_TR"'
      Size = 15
    end
    object cdsNFMARCA_TR: TStringField
      FieldName = 'MARCA_TR'
      Origin = '"NOTAFISCAL"."MARCA_TR"'
      Size = 15
    end
    object cdsNFNUMERO_TR: TStringField
      FieldName = 'NUMERO_TR'
      Origin = '"NOTAFISCAL"."NUMERO_TR"'
      Size = 15
    end
    object cdsNFCRT: TStringField
      FieldName = 'CRT'
      Origin = '"NOTAFISCAL"."CRT"'
      FixedChar = True
      Size = 1
    end
    object cdsNFRESULTADO_ENVIO: TStringField
      FieldName = 'RESULTADO_ENVIO'
      Origin = '"NOTAFISCAL"."RESULTADO_ENVIO"'
      Size = 30
    end
    object cdsNFDATA_AUTORIZACAO: TDateTimeField
      FieldName = 'DATA_AUTORIZACAO'
      Origin = '"NOTAFISCAL"."DATA_AUTORIZACAO"'
    end
    object cdsNFSITUACAO_NFE: TStringField
      FieldName = 'SITUACAO_NFE'
      Origin = '"NOTAFISCAL"."SITUACAO_NFE"'
      Size = 40
    end
    object cdsNFDIGEST: TStringField
      FieldName = 'DIGEST'
      Origin = '"NOTAFISCAL"."DIGEST"'
      Size = 40
    end
    object cdsNFPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = '"NOTAFISCAL"."PROTOCOLO"'
      Size = 40
    end
    object cdsNFCODIGOERRO: TStringField
      FieldName = 'CODIGOERRO'
      Origin = '"NOTAFISCAL"."CODIGOERRO"'
      Size = 10
    end
    object cdsNFDESCRICAOERRO: TStringField
      FieldName = 'DESCRICAOERRO'
      Origin = '"NOTAFISCAL"."DESCRICAOERRO"'
      Size = 50
    end
    object cdsNFTEMPORESPOSTA: TSmallintField
      FieldName = 'TEMPORESPOSTA'
      Origin = '"NOTAFISCAL"."TEMPORESPOSTA"'
    end
    object cdsNFHORA_ENVIO: TStringField
      FieldName = 'HORA_ENVIO'
      Origin = '"NOTAFISCAL"."HORA_ENVIO"'
      Size = 8
    end
    object cdsNFTIPONFE: TStringField
      FieldName = 'TIPONFE'
      Origin = '"NOTAFISCAL"."TIPONFE"'
      Size = 40
    end
    object cdsNFDANFEIMPRESSO: TStringField
      FieldName = 'DANFEIMPRESSO'
      Origin = '"NOTAFISCAL"."DANFEIMPRESSO"'
      Size = 5
    end
    object cdsNFDATAHORA_ENVIO: TDateTimeField
      FieldName = 'DATAHORA_ENVIO'
      Origin = '"NOTAFISCAL"."DATAHORA_ENVIO"'
    end
    object cdsNFCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Origin = '"NOTAFISCAL"."CHAVE_NFE"'
      Size = 60
    end
    object cdsNFSEL_NFE: TIntegerField
      FieldName = 'SEL_NFE'
      Origin = '"NOTAFISCAL"."SEL_NFE"'
    end
    object cdsNFN_FORM_SEGURANCA: TIntegerField
      FieldName = 'N_FORM_SEGURANCA'
      Origin = '"NOTAFISCAL"."N_FORM_SEGURANCA"'
    end
    object cdsNFNUM_NF_VNDANT: TIntegerField
      FieldName = 'NUM_NF_VNDANT'
      Origin = '"NOTAFISCAL"."NUM_NF_VNDANT"'
    end
    object cdsNFSUB_SERIEANT: TIntegerField
      FieldName = 'SUB_SERIEANT'
      Origin = '"NOTAFISCAL"."SUB_SERIEANT"'
    end
    object cdsNFJUST_CANCELAMENTO: TStringField
      FieldName = 'JUST_CANCELAMENTO'
      Origin = '"NOTAFISCAL"."JUST_CANCELAMENTO"'
      Size = 60
    end
    object cdsNFMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      Origin = '"NOTAFISCAL"."MODELO_NF"'
      Size = 3
    end
    object cdsNFSUBSERIE: TStringField
      FieldName = 'SUBSERIE'
      Origin = '"NOTAFISCAL"."SUBSERIE"'
      Size = 5
    end
    object cdsNFCOM_PROD: TStringField
      FieldName = 'COM_PROD'
      Origin = '"NOTAFISCAL"."COM_PROD"'
      Size = 1
    end
    object cdsNFCOM_SERV: TStringField
      FieldName = 'COM_SERV'
      Origin = '"NOTAFISCAL"."COM_SERV"'
      Size = 1
    end
    object cdsNFINUTILNFANT: TStringField
      FieldName = 'INUTILNFANT'
      Origin = '"NOTAFISCAL"."INUTILNFANT"'
      Size = 1
    end
    object cdsNFEMISSAO_PROPRIA: TStringField
      FieldName = 'EMISSAO_PROPRIA'
      Origin = '"NOTAFISCAL"."EMISSAO_PROPRIA"'
      FixedChar = True
      Size = 1
    end
    object cdsNFNUM_PED: TIntegerField
      FieldName = 'NUM_PED'
      Origin = '"NOTAFISCAL"."NUM_PED"'
    end
    object cdsNFANTEC_TRIB: TStringField
      FieldName = 'ANTEC_TRIB'
      Origin = '"NOTAFISCAL"."ANTEC_TRIB"'
      FixedChar = True
      Size = 1
    end
    object cdsNFDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      Origin = '"NOTAFISCAL"."DEVOLUCAO"'
      FixedChar = True
      Size = 3
    end
    object cdsNFBENEF_FISCAL: TStringField
      FieldName = 'BENEF_FISCAL'
      Origin = '"NOTAFISCAL"."BENEF_FISCAL"'
      FixedChar = True
      Size = 1
    end
    object cdsNFCONF_ENT: TStringField
      FieldName = 'CONF_ENT'
      Origin = '"NOTAFISCAL"."CONF_ENT"'
      FixedChar = True
      Size = 1
    end
    object cdsNFTP_NF: TStringField
      FieldName = 'TP_NF'
      Origin = '"NOTAFISCAL"."TP_NF"'
      FixedChar = True
      Size = 1
    end
    object cdsNFDA: TStringField
      FieldName = 'DA'
      Origin = '"NOTAFISCAL"."DA"'
      FixedChar = True
      Size = 1
    end
    object cdsNFMNF: TStringField
      FieldName = 'MNF'
      Origin = '"NOTAFISCAL"."MNF"'
      FixedChar = True
      Size = 1
    end
    object cdsNFCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = '"NOTAFISCAL"."COD_USUARIO"'
    end
    object cdsNFEXTEMPORANEO: TStringField
      FieldName = 'EXTEMPORANEO'
      Origin = '"NOTAFISCAL"."EXTEMPORANEO"'
      FixedChar = True
      Size = 1
    end
    object cdsNFTIPO_EMISSAO: TStringField
      FieldName = 'TIPO_EMISSAO'
      Origin = '"NOTAFISCAL"."TIPO_EMISSAO"'
      FixedChar = True
      Size = 1
    end
    object cdsNFNUM_NF_EMT: TIntegerField
      FieldName = 'NUM_NF_EMT'
      Origin = '"NOTAFISCAL"."NUM_NF_EMT"'
    end
    object cdsNFSERIE_EMT: TStringField
      FieldName = 'SERIE_EMT'
      Origin = '"NOTAFISCAL"."SERIE_EMT"'
      Size = 5
    end
    object cdsNFCOD_NF_REF: TIntegerField
      FieldName = 'COD_NF_REF'
      Origin = '"NOTAFISCAL"."COD_NF_REF"'
    end
    object cdsNFNUM_NF_COMPL: TIntegerField
      FieldName = 'NUM_NF_COMPL'
      Origin = '"NOTAFISCAL"."NUM_NF_COMPL"'
    end
    object cdsNFSERIE_COMPL: TStringField
      FieldName = 'SERIE_COMPL'
      Origin = '"NOTAFISCAL"."SERIE_COMPL"'
      Size = 5
    end
    object cdsNFTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = '"NOTAFISCAL"."TIPO_DESCONTO"'
      FixedChar = True
      Size = 1
    end
    object cdsNFPESO_B: TFloatField
      FieldName = 'PESO_B'
      Origin = '"NOTAFISCAL"."PESO_B"'
    end
    object cdsNFPESO_L: TFloatField
      FieldName = 'PESO_L'
      Origin = '"NOTAFISCAL"."PESO_L"'
    end
    object cdsNFN_COMANDO: TIntegerField
      FieldName = 'N_COMANDO'
      Origin = '"NOTAFISCAL"."N_COMANDO"'
    end
    object cdsNFATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"NOTAFISCAL"."ATIVO"'
    end
    object cdsNFCOD_CONS: TStringField
      FieldName = 'COD_CONS'
      Origin = '"NOTAFISCAL"."COD_CONS"'
      FixedChar = True
      Size = 2
    end
    object cdsNFVL_FORN: TFloatField
      FieldName = 'VL_FORN'
      Origin = '"NOTAFISCAL"."VL_FORN"'
    end
    object cdsNFVL_TERC: TFloatField
      FieldName = 'VL_TERC'
      Origin = '"NOTAFISCAL"."VL_TERC"'
    end
    object cdsNFTP_LIGACAO: TSmallintField
      FieldName = 'TP_LIGACAO'
      Origin = '"NOTAFISCAL"."TP_LIGACAO"'
    end
    object cdsNFCOD_GRUPO_TENSAO: TStringField
      FieldName = 'COD_GRUPO_TENSAO'
      Origin = '"NOTAFISCAL"."COD_GRUPO_TENSAO"'
      FixedChar = True
      Size = 2
    end
    object cdsNFCST_DESPESA: TStringField
      FieldName = 'CST_DESPESA'
      Origin = '"NOTAFISCAL"."CST_DESPESA"'
      FixedChar = True
      Size = 3
    end
    object cdsNFVL_SERV: TFloatField
      FieldName = 'VL_SERV'
      Origin = '"NOTAFISCAL"."VL_SERV"'
    end
    object cdsNFVL_SERV_NT: TFloatField
      FieldName = 'VL_SERV_NT'
      Origin = '"NOTAFISCAL"."VL_SERV_NT"'
    end
    object cdsNFTP_ASSINANTE: TStringField
      FieldName = 'TP_ASSINANTE'
      Origin = '"NOTAFISCAL"."TP_ASSINANTE"'
      FixedChar = True
      Size = 1
    end
    object cdsNFDADOS_INTERESSE_FISCO: TMemoField
      FieldName = 'DADOS_INTERESSE_FISCO'
      Origin = '"NOTAFISCAL"."DADOS_INTERESSE_FISCO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFDADOS_LANCAMENTO_FISCAL: TMemoField
      FieldName = 'DADOS_LANCAMENTO_FISCAL'
      Origin = '"NOTAFISCAL"."DADOS_LANCAMENTO_FISCAL"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFNFE_CMSG: TSmallintField
      FieldName = 'NFE_CMSG'
      Origin = '"NOTAFISCAL"."NFE_CMSG"'
    end
    object cdsNFNFE_XMSG: TStringField
      FieldName = 'NFE_XMSG'
      Origin = '"NOTAFISCAL"."NFE_XMSG"'
      Size = 200
    end
    object cdsNFNFE_DHCONT: TDateTimeField
      FieldName = 'NFE_DHCONT'
      Origin = '"NOTAFISCAL"."NFE_DHCONT"'
    end
    object cdsNFNFE_XJUST: TStringField
      FieldName = 'NFE_XJUST'
      Origin = '"NOTAFISCAL"."NFE_XJUST"'
      Size = 256
    end
    object cdsNFNFE_DPEC_CSTAT: TSmallintField
      FieldName = 'NFE_DPEC_CSTAT'
      Origin = '"NOTAFISCAL"."NFE_DPEC_CSTAT"'
    end
    object cdsNFNFE_DPEC_XMOTIVO: TStringField
      FieldName = 'NFE_DPEC_XMOTIVO'
      Origin = '"NOTAFISCAL"."NFE_DPEC_XMOTIVO"'
      Size = 256
    end
    object cdsNFNFE_DPEC_NREGDPEC: TStringField
      FieldName = 'NFE_DPEC_NREGDPEC'
      Origin = '"NOTAFISCAL"."NFE_DPEC_NREGDPEC"'
      Size = 17
    end
    object cdsNFALIQ_ICM_SIMPLES: TFloatField
      FieldName = 'ALIQ_ICM_SIMPLES'
      Origin = '"NOTAFISCAL"."ALIQ_ICM_SIMPLES"'
    end
    object cdsNFBASE_ICM_SIMPLES: TFloatField
      FieldName = 'BASE_ICM_SIMPLES'
      Origin = '"NOTAFISCAL"."BASE_ICM_SIMPLES"'
    end
    object cdsNFVALOR_ICM_SIMPLES: TFloatField
      FieldName = 'VALOR_ICM_SIMPLES'
      Origin = '"NOTAFISCAL"."VALOR_ICM_SIMPLES"'
    end
    object cdsNFINSCRICAO_SUBSTITUTO: TStringField
      FieldName = 'INSCRICAO_SUBSTITUTO'
      Origin = '"NOTAFISCAL"."INSCRICAO_SUBSTITUTO"'
      Size = 18
    end
    object cdsNFCNAE_FISCAL: TStringField
      FieldName = 'CNAE_FISCAL'
      Origin = '"NOTAFISCAL"."CNAE_FISCAL"'
      Size = 7
    end
    object cdsNFIM_EMP: TStringField
      FieldName = 'IM_EMP'
      Origin = '"NOTAFISCAL"."IM_EMP"'
      Size = 18
    end
    object cdsNFNUM_GERADO: TStringField
      FieldName = 'NUM_GERADO'
      Origin = '"NOTAFISCAL"."NUM_GERADO"'
      FixedChar = True
      Size = 1
    end
    object cdsNFN_CAIXA: TIntegerField
      FieldName = 'N_CAIXA'
      Origin = '"NOTAFISCAL"."N_CAIXA"'
    end
    object cdsNFINF_CORPO_V: TMemoField
      FieldName = 'INF_CORPO_V'
      Origin = '"NOTAFISCAL"."INF_CORPO_V"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"NOTAFISCAL"."NPED"'
    end
    object cdsNFTIPO_PED: TStringField
      FieldName = 'TIPO_PED'
      Origin = '"NOTAFISCAL"."TIPO_PED"'
      Size = 3
    end
    object cdsNFCOD_NF1: TIntegerField
      FieldName = 'COD_NF1'
      Required = True
    end
    object cdsNFCOD_EMPRESA1: TIntegerField
      FieldName = 'COD_EMPRESA1'
      Required = True
    end
    object cdsNFNITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsNFGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsNFCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsNFCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object cdsNFCHASSI: TStringField
      FieldName = 'CHASSI'
      FixedChar = True
      Size = 17
    end
    object cdsNFTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsNFCODIGO_NOP1: TFloatField
      FieldName = 'CODIGO_NOP1'
    end
    object cdsNFDESC_NATOP1: TStringField
      FieldName = 'DESC_NATOP1'
      Size = 128
    end
    object cdsNFCST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsNFCSOSN: TStringField
      FieldName = 'CSOSN'
      FixedChar = True
      Size = 3
    end
    object cdsNFREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 3
    end
    object cdsNFNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsNFDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 60
    end
    object cdsNFNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object cdsNFDATA_VALIDADE: TDateTimeField
      FieldName = 'DATA_VALIDADE'
    end
    object cdsNFQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsNFVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsNFVALOR_TOTAL1: TFloatField
      FieldName = 'VALOR_TOTAL1'
    end
    object cdsNFALIQ_ICM1: TFloatField
      FieldName = 'ALIQ_ICM1'
    end
    object cdsNFBASE_ICM1: TFloatField
      FieldName = 'BASE_ICM1'
    end
    object cdsNFVALOR_ICM1: TFloatField
      FieldName = 'VALOR_ICM1'
    end
    object cdsNFALIQ_ICMSUB: TFloatField
      FieldName = 'ALIQ_ICMSUB'
    end
    object cdsNFBASE_ICMSUB1: TFloatField
      FieldName = 'BASE_ICMSUB1'
    end
    object cdsNFVALOR_ICMSUB1: TFloatField
      FieldName = 'VALOR_ICMSUB1'
    end
    object cdsNFBASE_ICMANT_SUB: TFloatField
      FieldName = 'BASE_ICMANT_SUB'
    end
    object cdsNFVALOR_ICMANT_SUB: TFloatField
      FieldName = 'VALOR_ICMANT_SUB'
    end
    object cdsNFALIQ_IPI: TFloatField
      FieldName = 'ALIQ_IPI'
    end
    object cdsNFBASE_IPI1: TFloatField
      FieldName = 'BASE_IPI1'
    end
    object cdsNFVALOR_IPI1: TFloatField
      FieldName = 'VALOR_IPI1'
    end
    object cdsNFPERC_RED_PROD: TFloatField
      FieldName = 'PERC_RED_PROD'
    end
    object cdsNFPERC_RED_IPI: TFloatField
      FieldName = 'PERC_RED_IPI'
    end
    object cdsNFPERC_RED_PROD_SUB: TFloatField
      FieldName = 'PERC_RED_PROD_SUB'
    end
    object cdsNFRATEIO_DESCONTO: TFloatField
      FieldName = 'RATEIO_DESCONTO'
    end
    object cdsNFPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object cdsNFVALOR_DESCONTO_PERC: TFloatField
      FieldName = 'VALOR_DESCONTO_PERC'
    end
    object cdsNFMVA: TFloatField
      FieldName = 'MVA'
    end
    object cdsNFRATEIO_SEGURO: TFloatField
      FieldName = 'RATEIO_SEGURO'
    end
    object cdsNFRATEIO_OUTDESP: TFloatField
      FieldName = 'RATEIO_OUTDESP'
    end
    object cdsNFRATEIO_FRETE: TFloatField
      FieldName = 'RATEIO_FRETE'
    end
    object cdsNFRATEIO_ACRES_FIN: TFloatField
      FieldName = 'RATEIO_ACRES_FIN'
    end
    object cdsNFRATEIO_DESP_PF: TFloatField
      FieldName = 'RATEIO_DESP_PF'
    end
    object cdsNFPERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
    end
    object cdsNFPRCTB_ITEM: TFloatField
      FieldName = 'PRCTB_ITEM'
    end
    object cdsNFPRCTB_ITEMA: TFloatField
      FieldName = 'PRCTB_ITEMA'
    end
    object cdsNFPREC_CUS_CNT: TFloatField
      FieldName = 'PREC_CUS_CNT'
    end
    object cdsNFPREC_VND_PROD: TFloatField
      FieldName = 'PREC_VND_PROD'
    end
    object cdsNFPREC_VND_PRODA: TFloatField
      FieldName = 'PREC_VND_PRODA'
    end
    object cdsNFPREC_CUS_REP: TFloatField
      FieldName = 'PREC_CUS_REP'
    end
    object cdsNFPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsNFPMARGFIM: TFloatField
      FieldName = 'PMARGFIM'
    end
    object cdsNFPMARGFIM_A: TFloatField
      FieldName = 'PMARGFIM_A'
    end
    object cdsNFQTDEMB: TFloatField
      FieldName = 'QTDEMB'
    end
    object cdsNFQTDEMBREC: TFloatField
      FieldName = 'QTDEMBREC'
    end
    object cdsNFVLREMBNF: TFloatField
      FieldName = 'VLREMBNF'
    end
    object cdsNFVLBRUREAL: TFloatField
      FieldName = 'VLBRUREAL'
    end
    object cdsNFPDESC_R: TFloatField
      FieldName = 'PDESC_R'
    end
    object cdsNFVLREMBNFR: TFloatField
      FieldName = 'VLREMBNFR'
    end
    object cdsNFVLUN_B_NFE: TFloatField
      FieldName = 'VLUN_B_NFE'
    end
    object cdsNFVLISENTO: TFloatField
      FieldName = 'VLISENTO'
    end
    object cdsNFVLOUTRAS: TFloatField
      FieldName = 'VLOUTRAS'
    end
    object cdsNFVLN_TRIB: TFloatField
      FieldName = 'VLN_TRIB'
    end
    object cdsNFALIQ_ICM_SIMPLES1: TFloatField
      FieldName = 'ALIQ_ICM_SIMPLES1'
    end
    object cdsNFBASE_ICM_SIMPLES1: TFloatField
      FieldName = 'BASE_ICM_SIMPLES1'
    end
    object cdsNFVALOR_ICM_SIMPLES1: TFloatField
      FieldName = 'VALOR_ICM_SIMPLES1'
    end
    object cdsNFALIQ_ISS1: TFloatField
      FieldName = 'ALIQ_ISS1'
    end
    object cdsNFBASE_ISS1: TFloatField
      FieldName = 'BASE_ISS1'
    end
    object cdsNFVALOR_ISS1: TFloatField
      FieldName = 'VALOR_ISS1'
    end
    object cdsNFPESO_B1: TFloatField
      FieldName = 'PESO_B1'
    end
    object cdsNFPESO_L1: TFloatField
      FieldName = 'PESO_L1'
    end
    object cdsNFCAMP_ENTEST: TStringField
      FieldName = 'CAMP_ENTEST'
      FixedChar = True
      Size = 1
    end
    object cdsNFSEQ_DEVOLUCAO: TIntegerField
      FieldName = 'SEQ_DEVOLUCAO'
    end
    object cdsNFMNF1: TStringField
      FieldName = 'MNF1'
      FixedChar = True
      Size = 1
    end
    object cdsNFALTERA_ESTOQUE_CFOP: TStringField
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsNFALTERA_CUSTO_CFOP: TStringField
      FieldName = 'ALTERA_CUSTO_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsNFPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsNFNPED1: TIntegerField
      FieldName = 'NPED1'
    end
    object cdsNFTIPO_PED1: TStringField
      FieldName = 'TIPO_PED1'
      FixedChar = True
      Size = 3
    end
    object cdsNFNITEM_PED: TIntegerField
      FieldName = 'NITEM_PED'
    end
    object cdsNFTERMINAL: TIntegerField
      FieldName = 'TERMINAL'
    end
    object cdsNFNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
    end
    object cdsNFNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsNFDATA_CUPOM: TDateTimeField
      FieldName = 'DATA_CUPOM'
    end
    object cdsNFRED_LUCRO: TStringField
      FieldName = 'RED_LUCRO'
      FixedChar = True
      Size = 1
    end
    object cdsNFDESCRICAO_ITEM_OUTRAS: TMemoField
      FieldName = 'DESCRICAO_ITEM_OUTRAS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFECF: TStringField
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsNFATIVO1: TIntegerField
      FieldName = 'ATIVO1'
    end
    object cdsNFVALOR_DIF: TFloatField
      FieldName = 'VALOR_DIF'
    end
    object cdsNFINDTOT: TSmallintField
      FieldName = 'INDTOT'
    end
    object cdsNFMODBCST: TIntegerField
      FieldName = 'MODBCST'
    end
    object cdsNFMODBC: TIntegerField
      FieldName = 'MODBC'
    end
    object cdsNFVALOR_ICM_STDES: TFloatField
      FieldName = 'VALOR_ICM_STDES'
    end
    object cdsNFVL_MULTP: TFloatField
      FieldName = 'VL_MULTP'
    end
    object cdsNFPR_CUSC_PROD: TFloatField
      FieldName = 'PR_CUSC_PROD'
    end
    object cdsNFPREC_CUS_R: TFloatField
      FieldName = 'PREC_CUS_R'
    end
    object cdsNFNUM_FAB_FORNECEDOR: TStringField
      FieldName = 'NUM_FAB_FORNECEDOR'
    end
    object cdsNFCST_PIS: TStringField
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsNFALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object cdsNFVALOR_PIS1: TFloatField
      FieldName = 'VALOR_PIS1'
    end
    object cdsNFCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsNFALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object cdsNFVALOR_COFINS1: TFloatField
      FieldName = 'VALOR_COFINS1'
    end
    object cdsNFCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsNFPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
    end
    object cdsNFBASE_ICMSUB_ANT: TFloatField
      FieldName = 'BASE_ICMSUB_ANT'
    end
    object cdsNFVALOR_ICMSUB_ANT: TFloatField
      FieldName = 'VALOR_ICMSUB_ANT'
    end
    object cdsNFCST_IPI: TStringField
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 2
    end
    object cdsNFIND_MOV: TSmallintField
      FieldName = 'IND_MOV'
    end
  end
  object dsNF: TDataSource
    DataSet = cdsNF
    Left = 288
    Top = 400
  end
  object qrNFItem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    SQL.Strings = (
      'select * from NOTAFISCAL_ITEM')
    Left = 368
    Top = 256
  end
  object dspNFItem: TDataSetProvider
    DataSet = qrNFItem
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 368
    Top = 304
  end
  object cdsNFItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFItem'
    BeforeOpen = cdsNFItemBeforeOpen
    Left = 368
    Top = 352
    object cdsNFItemCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNFItemCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFItemNITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsNFItemGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsNFItemCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsNFItemCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object cdsNFItemCHASSI: TStringField
      FieldName = 'CHASSI'
      FixedChar = True
      Size = 17
    end
    object cdsNFItemTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsNFItemDESC_NATOP: TStringField
      FieldName = 'DESC_NATOP'
      Size = 128
    end
    object cdsNFItemCST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsNFItemCSOSN: TStringField
      FieldName = 'CSOSN'
      FixedChar = True
      Size = 3
    end
    object cdsNFItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 6
    end
    object cdsNFItemNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsNFItemNUM_FAB_FORNECEDOR: TStringField
      FieldName = 'NUM_FAB_FORNECEDOR'
    end
    object cdsNFItemDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 60
    end
    object cdsNFItemNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object cdsNFItemDATA_VALIDADE: TDateTimeField
      FieldName = 'DATA_VALIDADE'
    end
    object cdsNFItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsNFItemVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsNFItemVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsNFItemALIQ_ICM: TFloatField
      FieldName = 'ALIQ_ICM'
    end
    object cdsNFItemBASE_ICM: TFloatField
      FieldName = 'BASE_ICM'
    end
    object cdsNFItemVALOR_ICM: TFloatField
      FieldName = 'VALOR_ICM'
    end
    object cdsNFItemALIQ_ICMSUB: TFloatField
      FieldName = 'ALIQ_ICMSUB'
    end
    object cdsNFItemBASE_ICMSUB: TFloatField
      FieldName = 'BASE_ICMSUB'
    end
    object cdsNFItemVALOR_ICMSUB: TFloatField
      FieldName = 'VALOR_ICMSUB'
    end
    object cdsNFItemVALOR_ICM_STDES: TFloatField
      FieldName = 'VALOR_ICM_STDES'
    end
    object cdsNFItemBASE_ICMANT_SUB: TFloatField
      FieldName = 'BASE_ICMANT_SUB'
    end
    object cdsNFItemVALOR_ICMANT_SUB: TFloatField
      FieldName = 'VALOR_ICMANT_SUB'
    end
    object cdsNFItemALIQ_IPI: TFloatField
      FieldName = 'ALIQ_IPI'
    end
    object cdsNFItemBASE_IPI: TFloatField
      FieldName = 'BASE_IPI'
    end
    object cdsNFItemVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
    end
    object cdsNFItemPERC_RED_PROD: TFloatField
      FieldName = 'PERC_RED_PROD'
    end
    object cdsNFItemPERC_RED_IPI: TFloatField
      FieldName = 'PERC_RED_IPI'
    end
    object cdsNFItemPERC_RED_PROD_SUB: TFloatField
      FieldName = 'PERC_RED_PROD_SUB'
    end
    object cdsNFItemRATEIO_DESCONTO: TFloatField
      FieldName = 'RATEIO_DESCONTO'
    end
    object cdsNFItemPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object cdsNFItemVALOR_DESCONTO_PERC: TFloatField
      FieldName = 'VALOR_DESCONTO_PERC'
    end
    object cdsNFItemMVA: TFloatField
      FieldName = 'MVA'
    end
    object cdsNFItemRATEIO_SEGURO: TFloatField
      FieldName = 'RATEIO_SEGURO'
    end
    object cdsNFItemRATEIO_OUTDESP: TFloatField
      FieldName = 'RATEIO_OUTDESP'
    end
    object cdsNFItemRATEIO_FRETE: TFloatField
      FieldName = 'RATEIO_FRETE'
    end
    object cdsNFItemRATEIO_ACRES_FIN: TFloatField
      FieldName = 'RATEIO_ACRES_FIN'
    end
    object cdsNFItemRATEIO_DESP_PF: TFloatField
      FieldName = 'RATEIO_DESP_PF'
    end
    object cdsNFItemPERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
    end
    object cdsNFItemPRCTB_ITEM: TFloatField
      FieldName = 'PRCTB_ITEM'
    end
    object cdsNFItemPRCTB_ITEMA: TFloatField
      FieldName = 'PRCTB_ITEMA'
    end
    object cdsNFItemPREC_CUS_CNT: TFloatField
      FieldName = 'PREC_CUS_CNT'
    end
    object cdsNFItemPREC_VND_PROD: TFloatField
      FieldName = 'PREC_VND_PROD'
    end
    object cdsNFItemPREC_VND_PRODA: TFloatField
      FieldName = 'PREC_VND_PRODA'
    end
    object cdsNFItemPREC_CUS_REP: TFloatField
      FieldName = 'PREC_CUS_REP'
    end
    object cdsNFItemPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsNFItemPMARGFIM: TFloatField
      FieldName = 'PMARGFIM'
    end
    object cdsNFItemPMARGFIM_A: TFloatField
      FieldName = 'PMARGFIM_A'
    end
    object cdsNFItemQTDEMB: TFloatField
      FieldName = 'QTDEMB'
    end
    object cdsNFItemQTDEMBREC: TFloatField
      FieldName = 'QTDEMBREC'
    end
    object cdsNFItemVLREMBNF: TFloatField
      FieldName = 'VLREMBNF'
    end
    object cdsNFItemVLBRUREAL: TFloatField
      FieldName = 'VLBRUREAL'
    end
    object cdsNFItemPDESC_R: TFloatField
      FieldName = 'PDESC_R'
    end
    object cdsNFItemVLREMBNFR: TFloatField
      FieldName = 'VLREMBNFR'
    end
    object cdsNFItemVLUN_B_NFE: TFloatField
      FieldName = 'VLUN_B_NFE'
    end
    object cdsNFItemVLISENTO: TFloatField
      FieldName = 'VLISENTO'
    end
    object cdsNFItemVLOUTRAS: TFloatField
      FieldName = 'VLOUTRAS'
    end
    object cdsNFItemVLN_TRIB: TFloatField
      FieldName = 'VLN_TRIB'
    end
    object cdsNFItemALIQ_ICM_SIMPLES: TFloatField
      FieldName = 'ALIQ_ICM_SIMPLES'
    end
    object cdsNFItemBASE_ICM_SIMPLES: TFloatField
      FieldName = 'BASE_ICM_SIMPLES'
    end
    object cdsNFItemVALOR_ICM_SIMPLES: TFloatField
      FieldName = 'VALOR_ICM_SIMPLES'
    end
    object cdsNFItemALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
    end
    object cdsNFItemBASE_ISS: TFloatField
      FieldName = 'BASE_ISS'
    end
    object cdsNFItemVALOR_ISS: TFloatField
      FieldName = 'VALOR_ISS'
    end
    object cdsNFItemVALOR_DIF: TFloatField
      FieldName = 'VALOR_DIF'
    end
    object cdsNFItemPESO_B: TFloatField
      FieldName = 'PESO_B'
    end
    object cdsNFItemPESO_L: TFloatField
      FieldName = 'PESO_L'
    end
    object cdsNFItemVL_MULTP: TFloatField
      FieldName = 'VL_MULTP'
    end
    object cdsNFItemPR_CUSC_PROD: TFloatField
      FieldName = 'PR_CUSC_PROD'
    end
    object cdsNFItemPREC_CUS_R: TFloatField
      FieldName = 'PREC_CUS_R'
    end
    object cdsNFItemALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object cdsNFItemVALOR_PIS: TFloatField
      FieldName = 'VALOR_PIS'
    end
    object cdsNFItemALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object cdsNFItemVALOR_COFINS: TFloatField
      FieldName = 'VALOR_COFINS'
    end
    object cdsNFItemPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
    end
    object cdsNFItemCAMP_ENTEST: TStringField
      FieldName = 'CAMP_ENTEST'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemSEQ_DEVOLUCAO: TIntegerField
      FieldName = 'SEQ_DEVOLUCAO'
    end
    object cdsNFItemMNF: TStringField
      FieldName = 'MNF'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemALTERA_ESTOQUE_CFOP: TStringField
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemALTERA_CUSTO_CFOP: TStringField
      FieldName = 'ALTERA_CUSTO_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsNFItemTIPO_PED: TStringField
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsNFItemNITEM_PED: TIntegerField
      FieldName = 'NITEM_PED'
    end
    object cdsNFItemTERMINAL: TIntegerField
      FieldName = 'TERMINAL'
    end
    object cdsNFItemNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
    end
    object cdsNFItemNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsNFItemDATA_CUPOM: TDateTimeField
      FieldName = 'DATA_CUPOM'
    end
    object cdsNFItemRED_LUCRO: TStringField
      FieldName = 'RED_LUCRO'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemDESCRICAO_ITEM_OUTRAS: TMemoField
      FieldName = 'DESCRICAO_ITEM_OUTRAS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFItemECF: TStringField
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsNFItemATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsNFItemINDTOT: TSmallintField
      FieldName = 'INDTOT'
    end
    object cdsNFItemMODBCST: TIntegerField
      FieldName = 'MODBCST'
    end
    object cdsNFItemMODBC: TIntegerField
      FieldName = 'MODBC'
    end
    object cdsNFItemCST_PIS: TStringField
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsNFItemCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsNFItemCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
  end
  object dsNFItem: TDataSource
    DataSet = cdsNFItem
    Left = 368
    Top = 400
  end
  object SpMovEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IbTransDevolucao
    StoredProcName = 'MOVIMENTA_ESTOQUE'
    Left = 44
    Top = 137
  end
end
