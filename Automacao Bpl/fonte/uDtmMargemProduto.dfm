object dtmMargemProd: TdtmMargemProd
  OldCreateOrder = False
  Height = 466
  Width = 719
  object cdsEmpMargProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsEmpMargProdBeforeOpen
    Left = 32
    Top = 192
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoMargProd
    Left = 121
    Top = 1
  end
  object transacaoMargProd: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 1
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoMargProd
    SQL.Strings = (
      
        'select DESCR_PROD,CLASSE_PROD,CLINV,CLPRECO,CLPOP,CLQTV,CLFRV,CL' +
        'ATL,DT_ULT_VND,DT_ULT_VNDA,PREC_TAB_PROD,PREC_PUBLICO,'
      
        'VL_ULT_COMPRA,PREC_CUSM_PROD,ICM_PROD,COMISSAO_PROD,COMISSAO_PRO' +
        'D_GER,ISENTO_PIS,GRUPO_PROD,COD_PROD,VALORPME,PERC_TB_VARE,PERC_' +
        'TB_ATAC,EST_F'
      'from PRODUTOS')
    Left = 122
    Top = 78
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 122
    Top = 137
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsEmpMargProdBeforeOpen
    Left = 122
    Top = 194
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoMargProd
    SQL.Strings = (
      'SELECT * FROM EMPRESA'
      'where ativo=1')
    Left = 29
    Top = 78
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 137
  end
  object dspBarra: TDataSetProvider
    DataSet = qrBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 199
    Top = 145
  end
  object qrBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from COD_BARRA')
    Left = 199
    Top = 78
  end
  object cdsBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBarra'
    BeforeOpen = cdsEmpMargProdBeforeOpen
    Left = 199
    Top = 202
    object cdsBarraCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsBarraGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsBarraCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
  end
  object dsProd: TDataSource
    AutoEdit = False
    DataSet = cdsProd
    Left = 280
    Top = 200
  end
  object cdsSugestaoVendaCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 8
  end
  object DtGrupos: TDataSource
    DataSet = IbGrupos
    Left = 272
    Top = 72
  end
  object IbGrupos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoMargProd
    SQL.Strings = (
      
        'select gr.codigo_grup as codigo_grupo,gr.descricao as descricao_' +
        'grupo,(sum(pp.vltot_ped_item)-sum(pp.rateio_desc)) as valorprod,' +
        'sum(pp.quant_ped_item) as qtde,'
      
        'sum(pp.quant_ped_item*pp.pcust_mc) as custos,((sum(pp.vltot_ped_' +
        'item)-sum(pp.rateio_desc))/sum(pp.quant_ped_item*pp.pcust_mc)) a' +
        's markup'
      
        'from pedvenda p,pedvenda_prod pp,grupos gr where pp.grupo_prod =' +
        ' gr.codigo_grup and pp.nped = p.nped and pp.tipo = p.tipo'
      'and pp.cod_empresa = p.cod_empresa'
      'And ((p.tipo = '#39'OS'#39' and p.tipo_os = '#39'CLIENTE'#39') or'
      '(p.tipo = '#39'REQ'#39' and p.tipv <> '#39'C'#39' and p.tipv <> '#39'E'#39'))'
      
        'and (p.status_ped <> '#39#39' or not p.status_ped is null) and p.ativo' +
        ' = 1 and p.cod_empresa = 1 group by codigo_grupo,descricao_grupo')
    Left = 344
    Top = 72
  end
  object HieranalVenda: THierCube
    DataSet = Ibvendageralprodutos
    DimensionMap = <>
    Left = 344
    Top = 8
  end
  object Ibvendageralprodutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoMargProd
    Left = 280
    Top = 136
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NITEM'
    Params = <>
    BeforeOpen = cdsEmpMargProdBeforeOpen
    Left = 40
    Top = 304
    object cdsItensVendaNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object cdsItensVendaGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsItensVendaCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsItensVendaCOD_GRADE: TIntegerField
      DisplayLabel = 'Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsItensVendaNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsItensVendaDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD_PED'
      Size = 75
    end
    object cdsItensVendaUNIDADE_CONV: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE_CONV'
      Size = 3
    end
    object cdsItensVendaQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Quantidade'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_PED_ITEM_CONV'
    end
    object cdsItensVendaVLUN_PED_ITEM: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio'
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV'
      currency = True
    end
    object cdsItensVendaVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Val. total item'
      FieldName = 'VLTOT_PED_ITEM'
      currency = True
    end
    object cdsItensVendaRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio do Desconto'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsItensVendaRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio do Acrescimo'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsItensVendaPCUST_C: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'PCUST_MC'
    end
    object cdsItensVendaSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItensVendaTIPV: TStringField
      Tag = 1
      FieldName = 'TIPV'
      Size = 1
    end
    object cdsItensVendaCMV: TCurrencyField
      FieldName = 'CMV'
    end
    object cdsItensVendaCF: TCurrencyField
      FieldName = 'CF'
    end
    object cdsItensVendaCV: TFloatField
      DisplayLabel = 'Custo Variavel'
      FieldName = 'CV'
      currency = True
    end
    object cdsItensVendaCT: TFloatField
      DisplayLabel = 'Custo Total'
      FieldName = 'CT'
      currency = True
    end
    object cdsItensVendaLUCROLIQ: TFloatField
      DisplayLabel = 'Lucro Liquido'
      FieldName = 'LUCROLIQ'
      currency = True
    end
    object cdsItensVendaMARKUP: TFloatField
      DisplayLabel = 'Markup'
      FieldName = 'MARKUP'
      DisplayFormat = '#0.0000'
    end
    object cdsItensVendaPE: TFloatField
      DisplayLabel = 'Ponto de Equilibrio'
      FieldName = 'PE'
      currency = True
    end
    object cdsItensVendaCMVPERC: TFloatField
      FieldName = 'CMVPERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCFPERC: TFloatField
      FieldName = 'CFPERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCTPERC: TFloatField
      FieldName = 'CTPERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaLUCROLIQPERC: TFloatField
      FieldName = 'LUCROLIQPERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCVPERC: TFloatField
      FieldName = 'CVPERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaVLUN_LIQUIDO: TCurrencyField
      FieldName = 'VLUN_LIQUIDO'
    end
    object cdsItensVendaRATEIO_DESC_UNITARIO: TCurrencyField
      FieldName = 'RATEIO_DESC_UNITARIO'
    end
    object cdsItensVendaRATEIO_ACRESC_UNITARIO: TCurrencyField
      FieldName = 'RATEIO_ACRESC_UNITARIO'
    end
    object cdsItensVendaPE_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PE_TOTAL'
    end
    object cdsItensVendaVLUN_PED_ITEM_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_TOTAL'
    end
    object cdsItensVendaVLUN_LIQUIDO_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_LIQUIDO_TOTAL'
    end
    object cdsItensVendaCMV_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'CMV_TOTAL'
    end
    object cdsItensVendaCF_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'CF_TOTAL'
    end
    object cdsItensVendaCV_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'CV_TOTAL'
    end
    object cdsItensVendaCT_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'CT_TOTAL'
    end
    object cdsItensVendaLUCROLIQ_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'LUCROLIQ_TOTAL'
    end
    object cdsItensVendaCFPERC_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CFPERC_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCTPERC_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CTPERC_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaLUCROLIQPERC_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'LUCROLIQPERC_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCMVPERC_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CMVPERC_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
      Size = 1
    end
    object cdsItensVendaTABPRATICADA: TStringField
      FieldName = 'TABPRATICADA'
      Size = 1
    end
    object cdsItensVendaEM_PROMOCAO: TStringField
      FieldName = 'EM_PROMOCAO'
      Size = 1
    end
    object cdsItensVendaIRRF_ITEM: TCurrencyField
      FieldName = 'IRRF_ITEM'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaIRRF_PERC: TFloatField
      FieldName = 'IRRF_PERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaIRRF_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'IRRF_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaADIRRF_ITEM: TCurrencyField
      FieldName = 'ADIRRF_ITEM'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaADIRRF_PERC: TFloatField
      FieldName = 'ADIRRF_PERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaADIRRF_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'ADIRRF_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCSLL_ITEM: TFloatField
      FieldName = 'CSLL_ITEM'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCSLL_PERC: TFloatField
      FieldName = 'CSLL_PERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaCSLL_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CSLL_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaLUCRORETIDO_ITEM: TFloatField
      FieldName = 'LUCRORETIDO_ITEM'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaLUCRORETIDO_PERC: TFloatField
      FieldName = 'LUCRORETIDO_PERC'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaLUCRORETIDO_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'LUCRORETIDO_TOTAL'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendaUNIDADE: TStringField
      DisplayLabel = 'Un Princ'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsItensVendaQUANT_PED_ITEM2: TFloatField
      DisplayLabel = 'Quantidade (Un Princ)'
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsItensVendaVLUN_PED_ITEM2: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio (Un Princ)'
      FieldName = 'VLUN_PED_ITEM'
    end
    object cdsItensVendaOPERACAO_CONV: TStringField
      DisplayLabel = 'Operacao Conv'
      FieldName = 'OPERACAO_CONV'
      Size = 1
    end
    object cdsItensVendaFATOR_CONV: TFloatField
      DisplayLabel = 'Fator Conv'
      FieldName = 'FATOR_CONV'
    end
    object cdsItensVendaFATOR_CONV_TEMP: TStringField
      DisplayLabel = 'Fator'
      FieldKind = fkInternalCalc
      FieldName = 'FATOR_CONV_TEMP'
      Size = 50
    end
  end
  object dsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 40
    Top = 368
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsEmpMargProdBeforeOpen
    Left = 122
    Top = 305
    object cdsVendaNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsVendaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsVendaTIPV: TStringField
      FieldName = 'TIPV'
      Size = 1
    end
    object cdsVendaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsVendaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsVendaDATA_PED: TSQLTimeStampField
      FieldName = 'DATA_PED'
    end
    object cdsVendaDATA_FECH: TSQLTimeStampField
      FieldName = 'DATA_FECH'
    end
    object cdsVendaVALOR_TOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsVendaTOT_PROD: TCurrencyField
      FieldName = 'TOT_PROD'
    end
    object cdsVendaCMV: TCurrencyField
      FieldName = 'CMV'
    end
    object cdsVendaCF: TCurrencyField
      FieldName = 'CF'
    end
    object cdsVendaCV: TFloatField
      DisplayLabel = 'Custo Variavel'
      FieldName = 'CV'
      currency = True
    end
    object cdsVendaCT: TFloatField
      DisplayLabel = 'Custo Total'
      FieldName = 'CT'
      currency = True
    end
    object cdsVendaLUCROLIQ: TFloatField
      DisplayLabel = 'Lucro Liquido'
      FieldName = 'LUCROLIQ'
      currency = True
    end
    object cdsVendaMARKUP: TFloatField
      DisplayLabel = 'Markup'
      FieldName = 'MARKUP'
      DisplayFormat = '#0.0000'
    end
    object cdsVendaPE: TFloatField
      DisplayLabel = 'Ponto de Equilibrio'
      FieldName = 'PE'
      currency = True
    end
    object cdsVendaCMVPERC: TFloatField
      FieldName = 'CMVPERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaCFPERC: TFloatField
      FieldName = 'CFPERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaCVPERC: TFloatField
      FieldName = 'CVPERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaCTPERC: TFloatField
      FieldName = 'CTPERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaLUCROLIQPERC: TFloatField
      FieldName = 'LUCROLIQPERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaIRRF: TCurrencyField
      FieldName = 'IRRF'
      DisplayFormat = '#0.00'
    end
    object cdsVendaIRRF_PERC: TFloatField
      FieldName = 'IRRF_PERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaADIRRF: TCurrencyField
      FieldName = 'ADIRRF'
      DisplayFormat = '#0.00'
    end
    object cdsVendaADIRRF_PERC: TFloatField
      FieldName = 'ADIRRF_PERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaCSLL: TFloatField
      FieldName = 'CSLL'
      DisplayFormat = '#0.00'
    end
    object cdsVendaCSLL_PERC: TFloatField
      FieldName = 'CSLL_PERC'
      DisplayFormat = '#0.00'
    end
    object cdsVendaLUCRORETIDO: TFloatField
      FieldName = 'LUCRORETIDO'
      DisplayFormat = '#0.00'
    end
    object cdsVendaLUCRORETIDO_PERC: TFloatField
      FieldName = 'LUCRORETIDO_PERC'
      DisplayFormat = '#0.00'
    end
  end
  object dsVenda: TDataSource
    DataSet = cdsVenda
    Left = 122
    Top = 369
  end
end
