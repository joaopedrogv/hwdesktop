object dtmProdutos: TdtmProdutos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 1104
  Width = 3801
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 16
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VTABELA'
        ParamType = ptInput
      end>
  end
  object IBTransProdutos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 297
    Top = 65534
  end
  object qrProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select PRODUTOS.*, EST.ESTOQUE, EST.EST_PRIMA  from PRODUTOS'
      
        'LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.CO' +
        'D_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '#39#39', 0, 0) EST ON 1 = 1')
    Left = 17
    Top = 234
  end
  object dspProdutos: TDataSetProvider
    DataSet = qrProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 17
    Top = 285
  end
  object CdsProdutos: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProdutos'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 17
    Top = 336
    object CdsProdutosSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object CdsProdutosCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsProdutosGRUPO_PROD: TIntegerField
      Tag = 2
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object CdsProdutosCOD_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CdsProdutosNUM_FAB_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Numero Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
    end
    object CdsProdutosDESCR_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object CdsProdutosDESCR_PROD_RED: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o Reduzida'
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object CdsProdutosPREC_TAB_PROD: TFloatField
      Tag = 2
      DisplayLabel = 'Pre'#231'o Varejo'
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosEST_F: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosMARCA_P: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 30
    end
    object CdsProdutosCODIGO_NOP: TFloatField
      DisplayLabel = 'Cod Natureza Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object CdsProdutosNBM: TStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object CdsProdutosCST_PROD: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object CdsProdutosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 6
    end
    object CdsProdutosLOCACAO_PROD: TStringField
      DisplayLabel = 'Loca'#231#227'o'
      FieldName = 'LOCACAO_PROD'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object CdsProdutosAPLICACAO_PROD: TStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
    object CdsProdutosICM_PROD: TFloatField
      Tag = 2
      DisplayLabel = 'ICMS'
      FieldName = 'ICM_PROD'
    end
    object CdsProdutosIPI_PROD: TFloatField
      DisplayLabel = 'IPI'
      FieldName = 'IPI_PROD'
    end
    object CdsProdutosISENTO_PROD: TStringField
      DisplayLabel = 'Produto Isento'
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosISENTO_PIS: TStringField
      DisplayLabel = 'Isento PIS/CONFINS'
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosN_INCIDENCIA_PROD: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia Produto'
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosALT_COD_CUPOM: TStringField
      DisplayLabel = 'Alterar Valor Cupom'
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosALT_DESC_CUPOM: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o Cupom'
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosTIPO_FAB: TStringField
      DisplayLabel = 'Tipo de Fabrica'#231#227'o'
      FieldName = 'TIPO_FAB'
      Size = 1
    end
    object CdsProdutosCSDECQTDE: TStringField
      DisplayLabel = 'N'#186' de Casas Decimais para Quantidade'
      FieldName = 'CSDECQTDE'
      Size = 1
    end
    object CdsProdutosCSDECVLUNT: TStringField
      DisplayLabel = 'N'#186' de Casas Decimais para Valor Unit'#225'rio'
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object CdsProdutosARREDONDAR_TRUNCAR: TStringField
      DisplayLabel = 'Arredondar/Truncar'
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosPERMITIR_DESCONTO: TStringField
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosEM_PROMOCAO: TStringField
      DisplayLabel = 'Em Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosPRECO_PROMOCAO: TFloatField
      DisplayLabel = 'Pre'#231'o Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosCONSUMO: TStringField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosPESO_LIQ_PROD: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESO_LIQ_PROD'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosPESO_BRUT_PROD: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUT_PROD'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o Atacado'
      FieldName = 'PREC_PUBLICO'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPERC_TB_PROD: TFloatField
      DisplayLabel = 'Markup Varejo Desejado'
      FieldName = 'PERC_TB_PROD'
      DisplayFormat = '##0.00'
    end
    object CdsProdutosPERC_TB_VARE: TFloatField
      DisplayLabel = 'PMM Varejo'
      FieldName = 'PERC_TB_VARE'
      DisplayFormat = '##0.00'
    end
    object CdsProdutosPERC_TB_PRODA: TFloatField
      DisplayLabel = 'Markup Atacado Desejado'
      FieldName = 'PERC_TB_PRODA'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPERC_TB_ATAC: TFloatField
      DisplayLabel = 'PMM Atacado'
      FieldName = 'PERC_TB_ATAC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPERC_TB_PROD3: TFloatField
      DisplayLabel = 'Markup 30 dias Desejado'
      FieldName = 'PERC_TB_PROD3'
      DisplayFormat = '##0.00'
    end
    object CdsProdutosPERC_TB_PROD9: TFloatField
      DisplayLabel = 'Markup 90 dias Desejado'
      FieldName = 'PERC_TB_PROD9'
      DisplayFormat = '##0.00'
    end
    object CdsProdutosPERC_TB_PROD6: TFloatField
      DisplayLabel = 'Markup 60 dias Desejado'
      FieldName = 'PERC_TB_PROD6'
      DisplayFormat = '##0.00'
    end
    object CdsProdutosPERC_RED_PROD: TFloatField
      DisplayLabel = 'Percentual Redu'#231#227'o Produto'
      FieldName = 'PERC_RED_PROD'
    end
    object CdsProdutosLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Loca'#231#227'o 1'
      FieldName = 'LOCACAO_PROD_1'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object CdsProdutosSUB_G_PROD: TIntegerField
      DisplayLabel = 'Cod Sub Grupo'
      FieldName = 'SUB_G_PROD'
    end
    object CdsProdutosEST_R: TFloatField
      Tag = 1
      DisplayLabel = 'Estoque Dep'#243'sito'
      FieldName = 'EST_R'
      Visible = False
      DisplayFormat = '##0.000'
    end
    object CdsProdutosPREC_CUS_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PREC_CUS_PROD'
      DisplayFormat = '#,##0.000'
    end
    object CdsProdutosPREC_CUSR_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo Real'
      FieldName = 'PREC_CUSR_PROD'
      DisplayFormat = '#,##0.000'
    end
    object CdsProdutosPREC_CUS_MNF: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo da MNF'
      FieldName = 'PREC_CUS_MNF'
      DisplayFormat = '#,##0.000'
    end
    object CdsProdutosDATA_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsProdutosVL_ULT_COMPRA: TFloatField
      DisplayLabel = 'Valor '#218'ltima Compra'
      FieldName = 'VL_ULT_COMPRA'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPREC_REP_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Reposi'#231#227'o'
      FieldName = 'PREC_REP_PROD'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosNUM_NF_REC: TIntegerField
      DisplayLabel = 'Numero Nota Fiscal Recebimento'
      FieldName = 'NUM_NF_REC'
    end
    object CdsProdutosQREQ_PROD: TFloatField
      DisplayLabel = 'Quantidade Requisi'#231#227'o'
      FieldName = 'QREQ_PROD'
    end
    object CdsProdutosQCONF_PROD: TFloatField
      DisplayLabel = 'Quantidade Confirmada'
      FieldName = 'QCONF_PROD'
    end
    object CdsProdutosCOD_CUST_PROD: TStringField
      DisplayLabel = 'Cod Custo Produto'
      FieldName = 'COD_CUST_PROD'
      FixedChar = True
      Size = 6
    end
    object CdsProdutosCOMISSAO_PROD: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO_PROD'
    end
    object CdsProdutosQUANT_PROD_BL: TFloatField
      DisplayLabel = 'Quantidade Embalagem'
      FieldName = 'QUANT_PROD_BL'
    end
    object CdsProdutosLOCACAO1_BL: TStringField
      DisplayLabel = 'Loca'#231#227'o 1 Embalagem'
      FieldName = 'LOCACAO1_BL'
      FixedChar = True
      Size = 8
    end
    object CdsProdutosLOCACAO2_BL: TStringField
      DisplayLabel = 'Loca'#231#227'o 2 Embalagem'
      FieldName = 'LOCACAO2_BL'
      FixedChar = True
      Size = 8
    end
    object CdsProdutosDT_ULT_VND: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Venda'
      FieldName = 'DT_ULT_VND'
    end
    object CdsProdutosDT_ULT_VNDA: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Venda Antes'
      FieldName = 'DT_ULT_VNDA'
    end
    object CdsProdutosCOD_PPS: TStringField
      DisplayLabel = 'Codigo PPS'
      FieldName = 'COD_PPS'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosDAT_CAD_PROD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DAT_CAD_PROD'
    end
    object CdsProdutosDAT_MOD_PROD: TDateTimeField
      DisplayLabel = 'Data Modificac'#227'o'
      FieldName = 'DAT_MOD_PROD'
    end
    object CdsProdutosEMB_PROD: TStringField
      DisplayLabel = 'Embalagem'
      FieldName = 'EMB_PROD'
      FixedChar = True
      Size = 10
    end
    object CdsProdutosPERC_SUBSTTR: TFloatField
      DisplayLabel = 'Percentual Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'PERC_SUBSTTR'
    end
    object CdsProdutosQTDEMB: TFloatField
      DisplayLabel = 'Quantidade Embalagem'
      FieldName = 'QTDEMB'
    end
    object CdsProdutosBALANCA_PROD: TStringField
      DisplayLabel = 'Balan'#231'a'
      FieldName = 'BALANCA_PROD'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosVALIDADE_PROD: TStringField
      DisplayLabel = 'Validade'
      FieldName = 'VALIDADE_PROD'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosPREC_CUSR_MNF: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo Real Meia Nota'
      FieldName = 'PREC_CUSR_MNF'
      DisplayFormat = '#,##0.000'
    end
    object CdsProdutosPREC_CUSM_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      DisplayFormat = '#,##0.000'
    end
    object CdsProdutosPERC_FRETE_PROD: TFloatField
      DisplayLabel = 'Percentual Frete'
      FieldName = 'PERC_FRETE_PROD'
      DisplayFormat = '##0.00'
    end
    object CdsProdutosPREC_CUSMR_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio Real'
      FieldName = 'PREC_CUSMR_PROD'
      DisplayFormat = '#,##0.000'
    end
    object CdsProdutosESTSUBSTR: TStringField
      DisplayLabel = 'Estados Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ESTSUBSTR'
      FixedChar = True
      Size = 80
    end
    object CdsProdutosCOMISSAO_PROD_GER: TFloatField
      DisplayLabel = 'Comiss'#227'o Gerente'
      FieldName = 'COMISSAO_PROD_GER'
      DisplayFormat = '##0.00'
    end
    object CdsProdutosCUSTO_HONDA: TFloatField
      DisplayLabel = 'Custo Honda'
      FieldName = 'CUSTO_HONDA'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosALIQ_RED_PROD: TFloatField
      DisplayLabel = 'Al'#237'quota Redu'#231#227'o'
      FieldName = 'ALIQ_RED_PROD'
    end
    object CdsProdutosTIP_PROD_IND: TStringField
      DisplayLabel = 'Tipo Produto Indicado'
      FieldName = 'TIP_PROD_IND'
      FixedChar = True
      Size = 5
    end
    object CdsProdutosICMANT_SUB: TFloatField
      DisplayLabel = 'ICMS Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ICMANT_SUB'
      DisplayFormat = '#,##0.000'
    end
    object CdsProdutosNEC_ACOMP: TStringField
      DisplayLabel = 'Necessita de Acompanhamento'
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosDIAS_ACOMP: TIntegerField
      DisplayLabel = 'Dias de Acompanhamento'
      FieldName = 'DIAS_ACOMP'
    end
    object CdsProdutosPERC_AD_30: TFloatField
      DisplayLabel = 'Percentual Aumento 30 dias'
      FieldName = 'PERC_AD_30'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosPERC_AD_60: TFloatField
      DisplayLabel = 'Percentual Aumento 60 dias'
      FieldName = 'PERC_AD_60'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosPERC_AD_90: TFloatField
      DisplayLabel = 'Percentual Aumento 90 dias'
      FieldName = 'PERC_AD_90'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosDATA_MOD_PR: TDateTimeField
      DisplayLabel = 'Data/Hora Modifica'#231#227'o'
      FieldName = 'DATA_MOD_PR'
    end
    object CdsProdutosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object CdsProdutosLOC_DEP: TStringField
      DisplayLabel = 'Loca'#231#227'o do Dep'#243'sito'
      FieldName = 'LOC_DEP'
      FixedChar = True
      Size = 8
    end
    object CdsProdutosCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
    end
    object CdsProdutosTOT_ALIQ: TStringField
      DisplayLabel = 'Totalizador redu'#231#227'o no ECF'
      FieldName = 'TOT_ALIQ'
      FixedChar = True
      Size = 4
    end
    object CdsProdutosDATA_ULT_AJUSTE: TDateTimeField
      DisplayLabel = 'Data '#218'ltimo Pre'#231'o de Ajusto'
      FieldName = 'DATA_ULT_AJUSTE'
    end
    object CdsProdutosPRECO_AJUSTE: TFloatField
      DisplayLabel = 'Pre'#231'o Ajuste'
      FieldName = 'PRECO_AJUSTE'
      currency = True
    end
    object CdsProdutosALIQ_INTERNA_NFENT: TFloatField
      DisplayLabel = 'Al'#237'quota Interna NF Entrada'
      FieldName = 'ALIQ_INTERNA_NFENT'
    end
    object CdsProdutosCOD_RECEITA: TIntegerField
      DisplayLabel = 'Cod Receita'
      FieldName = 'COD_RECEITA'
    end
    object CdsProdutosSELEC: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SELEC'
      ProviderFlags = []
      Size = 1
    end
    object CdsProdutosTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo Item(Sped)'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCST_IPI: TStringField
      DisplayLabel = 'Cst IPI'
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCFOP_INTER_N_CONT: TFloatField
      DisplayLabel = 'CFOP Inter N Contrib'
      FieldName = 'CFOP_INTER_N_CONT'
    end
    object CdsProdutosCST_PIS: TStringField
      DisplayLabel = 'CST PIS Venda'
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS Venda'
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCST_PIS_ENT: TStringField
      DisplayLabel = 'CST PIS Entrada'
      FieldName = 'CST_PIS_ENT'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCST_COFINS_ENT: TStringField
      DisplayLabel = 'CST COFINS Entrada'
      FieldName = 'CST_COFINS_ENT'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosNAT_REC: TStringField
      DisplayLabel = 'Natureza Receita PIS/COFINS'
      FieldName = 'NAT_REC'
      Size = 3
    end
    object CdsProdutosALIQ_PIS_DIFERENCIADA: TFloatField
      DisplayLabel = 'Aliquota de PIS Diferenciada Venda'
      FieldName = 'ALIQ_PIS_DIFERENCIADA'
      DisplayFormat = '#0.0000'
    end
    object CdsProdutosALIQ_COFINS_DIFERENCIADA: TFloatField
      DisplayLabel = 'Aliquota de COFINS Diferenciada Venda'
      FieldName = 'ALIQ_COFINS_DIFERENCIADA'
      DisplayFormat = '#0.0000'
    end
    object CdsProdutosALIQ_CRED_PIS: TFloatField
      DisplayLabel = 'Aliquota de Cr'#233'dito do PIS'
      FieldName = 'ALIQ_CRED_PIS'
      DisplayFormat = '#0.0000'
    end
    object CdsProdutosALIQ_CRED_COFINS: TFloatField
      DisplayLabel = 'Aliquota de Cr'#233'dito do COFINS'
      FieldName = 'ALIQ_CRED_COFINS'
      DisplayFormat = '#0.0000'
    end
    object CdsProdutosECF: TStringField
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosMAX_DESC_ITEM: TFloatField
      DisplayLabel = 'Percentual Max Desconto'
      FieldName = 'MAX_DESC_ITEM'
    end
    object CdsProdutosN_CRI_PROD: TFloatField
      DisplayLabel = 'N'#237'vel Cr'#237'tico'
      FieldName = 'N_CRI_PROD'
      DisplayFormat = '##0.000'
      Precision = 4
    end
    object CdsProdutosN_MIN_PROD: TFloatField
      DisplayLabel = 'N'#237'vel M'#237'nimo'
      FieldName = 'N_MIN_PROD'
      DisplayFormat = '##0.000'
      Precision = 4
    end
    object CdsProdutosN_MAX_PROD: TFloatField
      DisplayLabel = 'N'#237'vel M'#225'ximo'
      FieldName = 'N_MAX_PROD'
      DisplayFormat = '##0.000'
      Precision = 4
    end
    object CdsProdutosCLASSE_PROD: TStringField
      DisplayLabel = 'Classe'
      FieldName = 'CLASSE_PROD'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosCLINV: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Valor'
      FieldName = 'CLINV'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosCLPRECO: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Pre'#231'o'
      FieldName = 'CLPRECO'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCLPOP: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Popularidade'
      FieldName = 'CLPOP'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCLQTV: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Volume Venda'
      FieldName = 'CLQTV'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCLFRV: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Frequ'#234'ncia Venda'
      FieldName = 'CLFRV'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosCLATL: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Atualidade Venda'
      FieldName = 'CLATL'
      FixedChar = True
      Size = 2
    end
    object CdsProdutosEST_SEGURANCA: TIntegerField
      DisplayLabel = 'Estoque Seguran'#231'a'
      FieldName = 'EST_SEGURANCA'
    end
    object CdsProdutosTEMPO_ENTREGASUG: TIntegerField
      DisplayLabel = 'Tempo de Entrega Sug'
      FieldName = 'TEMPO_ENTREGASUG'
    end
    object CdsProdutosVALORGE: TFloatField
      DisplayLabel = 'Giro de Estoque'
      FieldName = 'VALORGE'
      Precision = 4
    end
    object CdsProdutosVALORPME: TFloatField
      DisplayLabel = 'Prazo M'#233'dio de Estoque'
      FieldName = 'VALORPME'
      Precision = 4
    end
    object CdsProdutosQTDPROD_EXCESSO: TFloatField
      DisplayLabel = 'Qtde Excesso'
      FieldName = 'QTDPROD_EXCESSO'
      Precision = 4
    end
    object CdsProdutosQTDDIAS_EXCESSO: TFloatField
      DisplayLabel = 'Dias de Excesso'
      FieldName = 'QTDDIAS_EXCESSO'
      Precision = 4
    end
    object CdsProdutosDMD: TFloatField
      DisplayLabel = 'Demanda M'#233'dia Di'#225'ria'
      FieldName = 'DMD'
      Precision = 4
    end
    object CdsProdutosFREQ_PEDIDO: TIntegerField
      DisplayLabel = 'Frequencia Pedido'
      FieldName = 'FREQ_PEDIDO'
    end
    object CdsProdutosCOD_INF: TIntegerField
      DisplayLabel = 'Codigo Informacao Complementar'
      FieldName = 'COD_INF'
    end
    object CdsProdutosCOD_RECPROD: TIntegerField
      DisplayLabel = 'Cod Rec Producao'
      FieldName = 'COD_RECPROD'
    end
    object CdsProdutosBASEICMANT_SUB: TFloatField
      DisplayLabel = 'BC ICMS Ant Trib'
      FieldName = 'BASEICMANT_SUB'
      DisplayFormat = '#0.000'
    end
    object CdsProdutosSEQID: TIntegerField
      Tag = 1
      FieldName = 'SEQID'
    end
    object CdsProdutosCOMB_CPRODANP: TStringField
      Tag = 3
      DisplayLabel = 'Codigo ANP'
      FieldName = 'COMB_CPRODANP'
      Size = 9
    end
    object CdsProdutosCOMB_CODIF: TStringField
      Tag = 3
      DisplayLabel = 'CODIF'
      FieldName = 'COMB_CODIF'
      Size = 21
    end
    object CdsProdutosNFCI: TStringField
      DisplayLabel = 'Num FCI'
      FieldName = 'NFCI'
      Size = 36
    end
    object CdsProdutosPERC_LANCDEBCRED_DEV: TFloatField
      DisplayLabel = 'Perc Debito Cred Dev'
      FieldName = 'PERC_LANCDEBCRED_DEV'
    end
    object CdsProdutosNFE_NRECOPI: TStringField
      Tag = 3
      DisplayLabel = 'Numero do RECOPI  - NF-e'
      FieldName = 'NFE_NRECOPI'
    end
    object CdsProdutosCOMB_PMIXGN: TFloatField
      Tag = 3
      DisplayLabel = 'Percentual de Gas Natural para o produto GLP - NF-e'
      FieldName = 'COMB_PMIXGN'
    end
    object CdsProdutosCOD_USUARIO_PROCESS: TIntegerField
      DisplayLabel = 'Cod Usuario Process'
      FieldName = 'COD_USUARIO_PROCESS'
    end
    object CdsProdutosDATA_PROCESS: TDateTimeField
      DisplayLabel = 'Data Process'
      FieldName = 'DATA_PROCESS'
    end
    object CdsProdutosHORA_PROCESS: TStringField
      DisplayLabel = 'Hora Process'
      FieldName = 'HORA_PROCESS'
      FixedChar = True
      Size = 8
    end
    object CdsProdutosNOMEARQ_PROCESS: TStringField
      DisplayLabel = 'Arquivo Process'
      FieldName = 'NOMEARQ_PROCESS'
      Size = 50
    end
    object CdsProdutosCENQ_IPI_NFE: TStringField
      DisplayLabel = 'Codigo de enquadramento do IPI'
      FieldName = 'CENQ_IPI_NFE'
      Size = 3
    end
    object CdsProdutosCEST: TStringField
      DisplayLabel = 'Codigo Especificador da Substituicao Tributaria - CEST'
      FieldName = 'CEST'
      EditMask = '99.999.99;0;_'
      Size = 7
    end
    object CdsProdutosCSOSN: TStringField
      DisplayWidth = 3
      FieldName = 'CSOSN'
      Size = 3
    end
    object CdsProdutosDETALHES_PROD: TMemoField
      DisplayLabel = 'Detalhes / Caracteristicas'
      FieldName = 'DETALHES_PROD'
      BlobType = ftMemo
    end
    object CdsProdutosOBSERVACOES: TMemoField
      DisplayLabel = 'Observacoes'
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object CdsProdutosLISTA_IMAGENS: TMemoField
      DisplayLabel = 'Lista de Imagens'
      FieldName = 'LISTA_IMAGENS'
      OnGetText = CdsProdutosLISTA_IMAGENSGetText
      BlobType = ftMemo
    end
    object CdsProdutosICMS_RECOMPOSICAO: TFloatField
      DisplayLabel = 'ICMS Recomposi'#231#227'o'
      FieldName = 'ICMS_RECOMPOSICAO'
      DisplayFormat = '#0.000'
    end
    object CdsProdutosCOD_CTA_ESTOQUE: TStringField
      DisplayLabel = 'Cod Conta Analitica Contabil'
      FieldName = 'COD_CTA_ESTOQUE'
      Size = 60
    end
    object CdsProdutosDATA_ALT_PRECO: TDateTimeField
      DisplayLabel = 'Data ultima altera'#231#227'o de pre'#231'o'
      FieldName = 'DATA_ALT_PRECO'
    end
    object CdsProdutosCOMB_DESCANP: TStringField
      DisplayLabel = 'Comb Descri'#231#227'o ANP'
      FieldName = 'COMB_DESCANP'
      Size = 95
    end
    object CdsProdutosCOMB_PGLP: TFloatField
      DisplayLabel = 'Comb Perc GLP'
      FieldName = 'COMB_PGLP'
    end
    object CdsProdutosCOMB_PGNN: TFloatField
      DisplayLabel = 'Comb. Perc Gas Natural Nacional'
      FieldName = 'COMB_PGNN'
    end
    object CdsProdutosCOMB_PGNI: TFloatField
      DisplayLabel = 'Comb. Perc Gas Natural Importado'
      FieldName = 'COMB_PGNI'
    end
    object CdsProdutosCOMB_VPART: TFloatField
      DisplayLabel = 'Comb Valor de Partida'
      FieldName = 'COMB_VPART'
    end
    object CdsProdutosFCP_ALIQ: TFloatField
      DisplayLabel = 'FCP Aliq'
      FieldName = 'FCP_ALIQ'
      DisplayFormat = '#0.00'
    end
    object CdsProdutosFCP_VBCFCPSTRET: TFloatField
      DisplayLabel = 'FCP Base Ret Ant'
      FieldName = 'FCP_VBCFCPSTRET'
      DisplayFormat = '#0.00'
    end
    object CdsProdutosFCP_PFCPSTRET: TFloatField
      DisplayLabel = 'FCP Perc Ret Ant'
      FieldName = 'FCP_PFCPSTRET'
      DisplayFormat = '#0.00'
    end
    object CdsProdutosFCP_VFCPSTRET: TFloatField
      DisplayLabel = 'FCP Valor Ret Ant'
      FieldName = 'FCP_VFCPSTRET'
      DisplayFormat = '#0.00'
    end
    object CdsProdutosNFE_INDESCALA: TStringField
      DisplayLabel = 'Indicador de Escala Relevante(NF-e)'
      FieldName = 'NFE_INDESCALA'
      Size = 1
    end
    object CdsProdutosNFE_CNPJFAB: TStringField
      DisplayLabel = 'CNPJ do Fabricante(Escala relevante NF-e)'
      FieldName = 'NFE_CNPJFAB'
      Size = 14
    end
    object CdsProdutosNFE_UTRIB: TStringField
      DisplayLabel = 'Unid trib(NFe)'
      FieldName = 'NFE_UTRIB'
      Size = 6
    end
    object CdsProdutosNFE_QTRIB: TFloatField
      DisplayLabel = 'Qtde trib(NFe)'
      FieldName = 'NFE_QTRIB'
    end
    object CdsProdutosCOMPRIMENTO_PROD: TFloatField
      DisplayLabel = 'Comprimento'
      FieldName = 'COMPRIMENTO_PROD'
    end
    object CdsProdutosLARGURA_PROD: TFloatField
      DisplayLabel = 'Largura'
      FieldName = 'LARGURA_PROD'
    end
    object CdsProdutosALTURA_PROD: TFloatField
      DisplayLabel = 'Altura'
      FieldName = 'ALTURA_PROD'
    end
    object CdsProdutosID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object CdsProdutosID_COMERCIO_ABERTO: TIntegerField
      DisplayLabel = 'Id Comercio Aberto'
      FieldName = 'ID_COMERCIO_ABERTO'
    end
    object CdsProdutosCHAVE_NFE: TStringField
      Tag = 1
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHAVE_NFE'
      Size = 60
    end
    object CdsProdutosCPROD_XML: TStringField
      Tag = 1
      DisplayLabel = 'CProd'
      FieldName = 'CPROD_XML'
      Size = 60
    end
    object CdsProdutosCEAN_XML: TStringField
      Tag = 1
      DisplayLabel = 'CEAN'
      FieldName = 'CEAN_XML'
      Size = 14
    end
    object CdsProdutosALTEROU_IMAGEM: TStringField
      Tag = 1
      DisplayLabel = 'Alterou Imagem'
      FieldName = 'ALTEROU_IMAGEM'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosALTEROU_IMAGEM_GRADE: TStringField
      Tag = 1
      DisplayLabel = 'Alterou Imagem Grade'
      FieldName = 'ALTEROU_IMAGEM_GRADE'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosREP_INT_ACTIVE: TSmallintField
      Tag = 1
      DisplayLabel = 'RepInt Flag'
      FieldName = 'REP_INT_ACTIVE'
    end
    object CdsProdutosCOD_COMISSAO_FAIXA_DESC: TIntegerField
      DisplayLabel = 'Cod Comissao Faixa Desc'
      FieldName = 'COD_COMISSAO_FAIXA_DESC'
    end
    object CdsProdutosGRUPO_FISCAL_IBSCBS: TStringField
      Tag = 1
      DisplayLabel = 'Grupo Fiscal IBSCBS Id'
      FieldName = 'GRUPO_FISCAL_IBSCBS'
      Size = 36
    end
    object CdsProdutosFORA_LINHA: TStringField
      DisplayLabel = 'Fora de Linha'
      FieldName = 'FORA_LINHA'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosCRIAR_PRODUCAO_AUT: TStringField
      DisplayLabel = 'Gerar producao automaticamente'
      FieldName = 'CRIAR_PRODUCAO_AUT'
      FixedChar = True
      Size = 1
    end
    object CdsProdutosMARGEM_V_DESEJ: TFloatField
      DisplayLabel = 'Margem varejo desejada'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_V_DESEJ'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARKUP_V_CALC: TFloatField
      DisplayLabel = 'Markup varejo atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARKUP_V_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_V_CALC: TFloatField
      DisplayLabel = 'Margem varejo atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_V_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_A_DESEJ: TFloatField
      DisplayLabel = 'Margem atacado desejada'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_A_DESEJ'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARKUP_A_CALC: TFloatField
      DisplayLabel = 'Markup atacado atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARKUP_A_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_A_CALC: TFloatField
      DisplayLabel = 'Margem atacado atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_A_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_30_DESEJ: TFloatField
      DisplayLabel = 'Margem 30 dias desejada'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_30_DESEJ'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARKUP_30_CALC: TFloatField
      DisplayLabel = 'Markup 30 dias atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARKUP_30_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_30_CALC: TFloatField
      DisplayLabel = 'Margem 30 dias atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_30_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_60_DESEJ: TFloatField
      DisplayLabel = 'Margem 60 dias desejada'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_60_DESEJ'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARKUP_60_CALC: TFloatField
      DisplayLabel = 'Markup 60 dias atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARKUP_60_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_60_CALC: TFloatField
      DisplayLabel = 'Margem 60 dias atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_60_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_90_DESEJ: TFloatField
      DisplayLabel = 'Margem 90 dias desejada'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_90_DESEJ'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARKUP_90_CALC: TFloatField
      DisplayLabel = 'Markup 90 dias atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARKUP_90_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_90_CALC: TFloatField
      DisplayLabel = 'Margem 90 dias atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_90_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARKUP_PROMO_CALC: TFloatField
      DisplayLabel = 'Markup Promo atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARKUP_PROMO_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosMARGEM_PROMO_CALC: TFloatField
      DisplayLabel = 'Margem Promo atual'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_PROMO_CALC'
      DisplayFormat = '#,##0.00'
    end
    object CdsProdutosPDESC_PR30_VAREJO: TFloatField
      DisplayLabel = '% Desc Preco 30 dias para Preco varejo'
      FieldName = 'PDESC_PR30_VAREJO'
    end
    object CdsProdutosCFOP_NFCE: TIntegerField
      DisplayLabel = 'CFOP exclusivo NFCe'
      FieldName = 'CFOP_NFCE'
    end
    object CdsProdutosOBS_ETIQ: TMemoField
      DisplayLabel = 'Obs Etiqueta'
      FieldName = 'OBS_ETIQ'
      OnGetText = CdsProdutosOBS_ETIQGetText
      BlobType = ftMemo
      Size = 8
    end
    object CdsProdutosINF_UNIDADE: TStringField
      Tag = 1
      DisplayLabel = 'Inf Unidade'
      FieldName = 'INF_UNIDADE'
      Size = 1
    end
    object CdsProdutosCOD_BARRA_ETI: TStringField
      Tag = 1
      DisplayLabel = 'Cod Barra Etiq'
      FieldName = 'COD_BARRA_ETI'
    end
    object CdsProdutosESTOQUE: TFloatField
      DisplayLabel = 'Estoque Dispon'#237'vel'
      FieldName = 'ESTOQUE'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosEST_PRIMA: TFloatField
      DisplayLabel = 'Estoque Produzir'
      FieldName = 'EST_PRIMA'
      DisplayFormat = '##0.000'
    end
    object CdsProdutosPERC_COMISSAO_CASHBACK: TFloatField
      DisplayLabel = 'Perc Comissao Cashback'
      FieldName = 'PERC_COMISSAO_CASHBACK'
    end
    object CdsProdutosDIAS_VENC_CASHBACK: TIntegerField
      DisplayLabel = 'Dias Venc Cashback'
      FieldName = 'DIAS_VENC_CASHBACK'
    end
    object CdsProdutosUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      OnGetText = CdsProdutosUSAR_DEBCREDGetText
      Size = 1
    end
    object CdsProdutosSINC_HW_CLOUD: TStringField
      DisplayLabel = 'Venda Online'
      FieldName = 'SINC_HW_CLOUD'
      Size = 1
    end
  end
  object dsProdutos: TDataSource
    DataSet = CdsProdutos
    Left = 17
    Top = 388
  end
  object qrCodBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'SELECT * from COD_BARRA')
    Left = 161
    Top = 234
  end
  object dspCodBarra: TDataSetProvider
    DataSet = qrCodBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 161
    Top = 285
  end
  object cdsCodBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCodBarra'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 161
    Top = 336
    object cdsCodBarraCOD_BARRA: TStringField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsCodBarraGRUPO_PROD: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCodBarraCOD_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCodBarraCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      OnGetText = cdsCodBarraCOD_GRADEGetText
    end
    object cdsCodBarraCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCodBarraDAT_CAD_CDBAR: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DAT_CAD_CDBAR'
    end
    object cdsCodBarraDAT_MOD_CDBAR: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Modifica'#231#227'o'
      FieldName = 'DAT_MOD_CDBAR'
    end
    object cdsCodBarraATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsCodBarra: TDataSource
    DataSet = cdsCodBarra
    Left = 161
    Top = 388
  end
  object IBTransGrupos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 352
    Top = 14
  end
  object qrGrupos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGrupos
    SQL.Strings = (
      'SELECT * from grupos'
      '')
    Left = 224
    Top = 234
  end
  object dspGrupos: TDataSetProvider
    DataSet = qrGrupos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 224
    Top = 285
  end
  object cdsGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 224
    Top = 336
    object cdsGruposSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsGruposCODIGO_GRUP: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Grupo'
      FieldName = 'CODIGO_GRUP'
      Required = True
    end
    object cdsGruposDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o Grupo'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsGruposSEQPERF: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia para Relat'#243'rios'
      FieldName = 'SEQPERF'
    end
    object cdsGruposATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsGruposVALORGE: TFloatField
      DisplayLabel = 'Giro de Estoque'
      FieldName = 'VALORGE'
      DisplayFormat = '##0.0000'
    end
    object cdsGruposVALORPME: TFloatField
      DisplayLabel = 'Dura'#231#227'o em dias no Estoque'
      FieldName = 'VALORPME'
      DisplayFormat = '##0.0000'
    end
    object cdsGruposMARKUP_GRUPO: TFloatField
      DisplayLabel = 'Markup do Grupo'
      FieldName = 'MARKUP_GRUPO'
      DisplayFormat = '##0.0000'
    end
  end
  object dsGrupos: TDataSource
    DataSet = cdsGrupos
    Left = 224
    Top = 388
  end
  object qrPesquisa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      '')
    Left = 886
    Top = 123
  end
  object IBTransSubGrupo: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 431
    Top = 14
  end
  object qrSubGrupo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSubGrupo
    SQL.Strings = (
      'SELECT * from SUB_GRUPO'
      '')
    Left = 288
    Top = 234
  end
  object dspSubGrupo: TDataSetProvider
    DataSet = qrSubGrupo
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 285
  end
  object cdsSubGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubGrupo'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 288
    Top = 336
    object cdsSubGrupoSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsSubGrupoCODIGO_SUBGR: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Sub Grupo'
      FieldName = 'CODIGO_SUBGR'
      Required = True
    end
    object cdsSubGrupoDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o Sub Grupo'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsSubGrupoCOD_GRUPO: TIntegerField
      DisplayLabel = 'Cod Grupo'
      FieldName = 'COD_GRUPO'
    end
    object cdsSubGrupoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsSubGrupoSUBSERVICO: TStringField
      DisplayLabel = 'Subgrupo de Servi'#231'o'
      FieldName = 'SUBSERVICO'
      FixedChar = True
      Size = 1
    end
  end
  object dsSubGrupo: TDataSource
    DataSet = cdsSubGrupo
    Left = 288
    Top = 388
  end
  object qrBuscasP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 19
    Top = 125
  end
  object qrBuscasCB: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 942
    Top = 13
  end
  object qrBuscasG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGrupos
    Left = 355
    Top = 65
  end
  object qrBuscasSG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSubGrupo
    Left = 429
    Top = 63
  end
  object RdpProdutos: TRDprint
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
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
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
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 81
    Top = 28
  end
  object IBTransPerfilProd: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 516
    Top = 14
  end
  object qrPerfilProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPerfilProd
    SQL.Strings = (
      'SELECT * FROM Perfil_Produtos'
      'where  ativo = 1'
      '')
    Left = 356
    Top = 234
  end
  object qrBuscasPerfilProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPerfilProd
    Left = 518
    Top = 62
  end
  object dspPerfilProd: TDataSetProvider
    DataSet = qrPerfilProd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 356
    Top = 285
  end
  object cdsPerfilProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilProd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 356
    Top = 336
    object cdsPerfilProdCOD_PERFIL: TIntegerField
      DisplayLabel = 'Cod Perfil'
      FieldName = 'COD_PERFIL'
      Required = True
    end
    object cdsPerfilProdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerfilProdCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsPerfilProdSUB_G_PROD: TIntegerField
      DisplayLabel = 'Cod Sub Grupo'
      FieldName = 'SUB_G_PROD'
    end
    object cdsPerfilProdLOCACAO_PROD: TStringField
      DisplayLabel = 'Loca'#231#227'o'
      FieldName = 'LOCACAO_PROD'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsPerfilProdLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Loca'#231#227'o 1'
      FieldName = 'LOCACAO_PROD_1'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsPerfilProdDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsPerfilProdIPI_PROD: TFloatField
      DisplayLabel = 'IPI'
      FieldName = 'IPI_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdICM_PROD: TFloatField
      DisplayLabel = 'ICMS'
      FieldName = 'ICM_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdPERC_TB_PROD: TFloatField
      DisplayLabel = 'Percentual Varejo'
      FieldName = 'PERC_TB_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdMARCA_P: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 30
    end
    object cdsPerfilProdALT_COD_CUPOM: TStringField
      DisplayLabel = 'Codigo Cupom'
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilProdPERC_RED_PROD: TFloatField
      DisplayLabel = 'Percentual Redu'#231#227'o'
      FieldName = 'PERC_RED_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdCOMISSAO_PROD: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO_PROD'
    end
    object cdsPerfilProdISENTO_PROD: TStringField
      DisplayLabel = 'Produto Isento'
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilProdN_INCIDENCIA_PROD: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia Produto'
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilProdUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsPerfilProdPERC_TB_PROD3: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 30 dias'
      FieldName = 'PERC_TB_PROD3'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdPERC_TB_PROD6: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 60 dias'
      FieldName = 'PERC_TB_PROD6'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdPERC_TB_PROD9: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 90 dias'
      FieldName = 'PERC_TB_PROD9'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdALT_DESC_CUPOM: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o Cupom'
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilProdCST_PROD: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsPerfilProdCOD_PPS: TStringField
      DisplayLabel = 'Codigo PPS'
      FieldName = 'COD_PPS'
      FixedChar = True
      Size = 2
    end
    object cdsPerfilProdCOD_DSGS: TStringField
      DisplayLabel = 'Codigo DSGS'
      FieldName = 'COD_DSGS'
      EditMask = '0.00.0.00;0;_'
      FixedChar = True
      Size = 6
    end
    object cdsPerfilProdISENTO_PIS: TStringField
      DisplayLabel = 'Isento PIS/CONFINS'
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilProdEMB_PROD: TStringField
      DisplayLabel = 'Embalagem'
      FieldName = 'EMB_PROD'
      FixedChar = True
      Size = 10
    end
    object cdsPerfilProdPERC_SUBSTTR: TFloatField
      DisplayLabel = 'Percentual Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'PERC_SUBSTTR'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdQTDEMB: TFloatField
      DisplayLabel = 'Quantidade Embalagem'
      FieldName = 'QTDEMB'
    end
    object cdsPerfilProdBALANCA_PROD: TStringField
      DisplayLabel = 'Balan'#231'a'
      FieldName = 'BALANCA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilProdVALIDADE_PROD: TStringField
      DisplayLabel = 'Validade'
      FieldName = 'VALIDADE_PROD'
      FixedChar = True
      Size = 2
    end
    object cdsPerfilProdCOMISSAO_PROD_GER: TFloatField
      DisplayLabel = 'Comiss'#227'o Produto Gerente'
      FieldName = 'COMISSAO_PROD_GER'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdALIQ_RED_PROD: TFloatField
      DisplayLabel = 'Al'#237'quota Redu'#231#227'o'
      FieldName = 'ALIQ_RED_PROD'
    end
    object cdsPerfilProdTIP_PROD_IND: TStringField
      DisplayLabel = 'Tipo Produto Indicado'
      FieldName = 'TIP_PROD_IND'
      FixedChar = True
      Size = 5
    end
    object cdsPerfilProdPERC_TB_ATAC: TFloatField
      DisplayLabel = 'Percentual Tabela Atacado'
      FieldName = 'PERC_TB_ATAC'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdPERC_TB_VARE: TFloatField
      DisplayLabel = 'Percentual Tabela Varejo'
      FieldName = 'PERC_TB_VARE'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdNEC_ACOMP: TStringField
      DisplayLabel = 'Necessita de Acompanhamento'
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilProdDIAS_ACOMP: TIntegerField
      DisplayLabel = 'Dias de Acompanhamento'
      FieldName = 'DIAS_ACOMP'
    end
    object cdsPerfilProdNBM: TStringField
      DisplayLabel = 'Codigo NBM'
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsPerfilProdPERC_AD_30: TFloatField
      DisplayLabel = 'Percentual Aumento 30 dias'
      FieldName = 'PERC_AD_30'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdPERC_AD_60: TFloatField
      DisplayLabel = 'Percentual Aumento 60 dias'
      FieldName = 'PERC_AD_60'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdPERC_AD_90: TFloatField
      DisplayLabel = 'Percentual Aumento 90 dias'
      FieldName = 'PERC_AD_90'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilProdDESCR_PERFIL: TStringField
      DisplayLabel = 'Descri'#231#227'o do Perfil'
      FieldName = 'DESCR_PERFIL'
      FixedChar = True
      Size = 30
    end
    object cdsPerfilProdATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPerfilProdCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
    end
    object cdsPerfilProdTOT_ALIQ: TStringField
      DisplayLabel = 'Totalizador redu'#231#227'o no ECF'
      FieldName = 'TOT_ALIQ'
      FixedChar = True
      Size = 4
    end
    object cdsPerfilProdCFOP_INTER_N_CONT: TFloatField
      DisplayLabel = 'CFOP Interestadual'
      FieldName = 'CFOP_INTER_N_CONT'
    end
    object cdsPerfilProdMAX_DESC_ITEM: TFloatField
      DisplayLabel = 'Max Desc'
      FieldName = 'MAX_DESC_ITEM'
    end
  end
  object dsPerfilProd: TDataSource
    DataSet = cdsPerfilProd
    Left = 356
    Top = 388
  end
  object IBTransNBM: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 593
    Top = 13
  end
  object qrNBM: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNBM
    SQL.Strings = (
      'select * from nbm')
    Left = 417
    Top = 234
  end
  object qrBuscasNBM: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNBM
    Left = 599
    Top = 62
  end
  object dspNBM: TDataSetProvider
    DataSet = qrNBM
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 414
    Top = 285
  end
  object cdsNBM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNBM'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 414
    Top = 336
    object cdsNBMCOD_NCM: TStringField
      DisplayLabel = 'Cod NCM'
      FieldName = 'COD_NCM'
      FixedChar = True
      Size = 8
    end
    object cdsNBMNOME_NCM: TStringField
      DisplayLabel = 'Descri'#231#227'o NCM'
      FieldName = 'NOME_NCM'
      Size = 60
    end
    object cdsNBMUSAR_MVA_AJUSTADO: TStringField
      DisplayLabel = 'MVA Ajustado'
      FieldName = 'USAR_MVA_AJUSTADO'
      FixedChar = True
      Size = 1
    end
    object cdsNBMREFERENCIA: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'REFERENCIA'
      Size = 4
    end
    object cdsNBMMVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '#0.00'
    end
    object cdsNBMMVA_INTER: TFloatField
      DisplayLabel = 'MVA Interestadual'
      FieldName = 'MVA_INTER'
      DisplayFormat = '#0.00'
    end
    object cdsNBMALIQ_INTRA: TFloatField
      DisplayLabel = 'ICMS Interno'
      FieldName = 'ALIQ_INTRA'
      DisplayFormat = '#0.00'
    end
    object cdsNBMCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsNBMCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsNBMCST_PIS_ENT: TStringField
      DisplayLabel = 'CST PIS Entrada'
      FieldName = 'CST_PIS_ENT'
      FixedChar = True
      Size = 2
    end
    object cdsNBMCST_COFINS_ENT: TStringField
      DisplayLabel = 'CST COFINS Entrada'
      FieldName = 'CST_COFINS_ENT'
      FixedChar = True
      Size = 2
    end
    object cdsNBMALIQ_PIS_DIFERENCIADA: TFloatField
      DisplayLabel = 'Aliq PIS Diferenciada ou Por quantidade'
      FieldName = 'ALIQ_PIS_DIFERENCIADA'
      DisplayFormat = '#0.0000'
    end
    object cdsNBMALIQ_COFINS_DIFERENCIADA: TFloatField
      DisplayLabel = 'Aliq COFINS Diferenciada ou Por quantidade'
      FieldName = 'ALIQ_COFINS_DIFERENCIADA'
      DisplayFormat = '#0.0000'
    end
    object cdsNBMALIQ_CRED_PIS: TFloatField
      DisplayLabel = 'Aliquota de Cr'#233'dito do PIS'
      FieldName = 'ALIQ_CRED_PIS'
      DisplayFormat = '#0.0000'
    end
    object cdsNBMALIQ_CRED_COFINS: TFloatField
      DisplayLabel = 'Aliquota de Cr'#233'dito do COFINS'
      FieldName = 'ALIQ_CRED_COFINS'
      DisplayFormat = '#0.0000'
    end
    object cdsNBMCALC_ST_SAIDA: TStringField
      DisplayLabel = 'Calcular ST na Sa'#237'da'
      FieldName = 'CALC_ST_SAIDA'
      FixedChar = True
      Size = 1
    end
    object cdsNBMNAT_REC: TStringField
      DisplayLabel = 'Natureza Receita PIS/COFINS'
      FieldName = 'NAT_REC'
      Size = 3
    end
    object cdsNBMCOD_INF: TIntegerField
      DisplayLabel = 'Codigo Informacao Complementar'
      FieldName = 'COD_INF'
    end
    object cdsNBMALIQNAC: TFloatField
      DisplayLabel = 'Aliq Nac'
      FieldName = 'ALIQNAC'
    end
    object cdsNBMALIQIMP: TFloatField
      DisplayLabel = 'Aliq Imp'
      FieldName = 'ALIQIMP'
    end
    object cdsNBMMODBCST: TIntegerField
      Tag = 1
      FieldName = 'MODBCST'
    end
    object cdsNBMVLBCST: TFloatField
      Tag = 1
      FieldName = 'VLBCST'
    end
    object cdsNBMNVE: TStringField
      FieldName = 'NVE'
      Size = 64
    end
    object cdsNBMCENQ_IPI_NFE: TStringField
      DisplayLabel = 'Codigo de enquadramento do IPI'
      FieldName = 'CENQ_IPI_NFE'
      Size = 3
    end
    object cdsNBMCEST: TStringField
      DisplayLabel = 'Codigo Especificador da Substituicao Tributaria - CEST'
      FieldName = 'CEST'
      EditMask = '99.999.99;0;_'
      Size = 7
    end
    object cdsNBMFCP_ALIQ: TFloatField
      DisplayLabel = 'Aliq FCP'
      FieldName = 'FCP_ALIQ'
      DisplayFormat = '#0.00'
    end
    object cdsNBMSEL: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
  object dsNBM: TDataSource
    DataSet = cdsNBM
    Left = 413
    Top = 388
  end
  object qrNbmUF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNBM
    SQL.Strings = (
      'select * from nbm_estado')
    Left = 468
    Top = 234
  end
  object dspNbmUF: TDataSetProvider
    DataSet = qrNbmUF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 468
    Top = 285
  end
  object cdsNbmUF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNbmUF'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 468
    Top = 336
    object cdsNbmUFCOD_NBM: TStringField
      DisplayLabel = 'C'#243'digo NBM'
      FieldName = 'COD_NBM'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsNbmUFCODIGO_UF: TIntegerField
      DisplayLabel = 'C'#243'digo UF'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsNbmUFALIQ: TFloatField
      DisplayLabel = 'ICMS'
      FieldName = 'ALIQ'
    end
    object cdsNbmUFMVA: TFloatField
      FieldName = 'MVA'
    end
    object cdsNbmUFCST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsNbmUFPFCP: TFloatField
      DisplayLabel = 'Percentual do Fundo de Combate a Pobreza'
      FieldName = 'PFCP'
      DisplayFormat = '#0.0000'
    end
  end
  object dsNbmUF: TDataSource
    AutoEdit = False
    DataSet = cdsNbmUF
    Left = 467
    Top = 388
  end
  object qrNBMEStados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNBM
    SQL.Strings = (
      'select * from ESTADOS where ativo=1')
    Left = 440
    Top = 124
    object qrNBMEStadosCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = '"ESTADOS"."CODIGO_UF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrNBMEStadosNOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"ESTADOS"."NOME_UF"'
      Size = 30
    end
    object qrNBMEStadosSIGLA_UF: TIBStringField
      FieldName = 'SIGLA_UF'
      Origin = '"ESTADOS"."SIGLA_UF"'
      FixedChar = True
      Size = 2
    end
    object qrNBMEStadosATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"ESTADOS"."ATIVO"'
    end
  end
  object dsNBMEstados: TDataSource
    DataSet = qrNBMEStados
    Left = 445
    Top = 171
  end
  object dsBuscasP: TDataSource
    DataSet = qrBuscasP
    Left = 15
    Top = 174
  end
  object qrDsgs: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransDsgs
    SQL.Strings = (
      'SELECT * FROM G_DSGS WHERE cod_empresa = -1 and ativo=1')
    Left = 520
    Top = 234
  end
  object dspDsgs: TDataSetProvider
    DataSet = qrDsgs
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 520
    Top = 285
  end
  object cdsDsgs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDsgs'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 520
    Top = 336
    object cdsDsgsCOD_DSGS: TStringField
      DisplayLabel = 'Cod DSGS'
      FieldName = 'COD_DSGS'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDsgsCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDsgsN_DEPAR: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'N_DEPAR'
      FixedChar = True
      Size = 15
    end
    object cdsDsgsN_SECAO: TStringField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'N_SECAO'
      FixedChar = True
    end
    object cdsDsgsN_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'N_GRUPO'
      FixedChar = True
    end
    object cdsDsgsS_GRUPO: TStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'S_GRUPO'
      FixedChar = True
    end
    object cdsDsgsP_MARGEM: TStringField
      DisplayLabel = 'Percentual de Margem'
      FieldName = 'P_MARGEM'
      FixedChar = True
    end
    object cdsDsgsATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrBuscasDsgs: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransDsgs
    SQL.Strings = (
      '')
    Left = 665
    Top = 62
  end
  object ibTransDsgs: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 664
    Top = 12
  end
  object dsDSGS: TDataSource
    DataSet = cdsDsgs
    Left = 520
    Top = 388
  end
  object qrLocPPSProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'Select * from pps_produtos'
      'where ativo=1')
    Left = 89
    Top = 124
    object qrLocPPSProdutosCOD_PPS: TIBStringField
      FieldName = 'COD_PPS'
      Origin = '"PPS_PRODUTOS"."COD_PPS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsLocPPSProdutos: TDataSource
    DataSet = qrLocPPSProdutos
    Left = 90
    Top = 172
  end
  object qrRepliProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select *  from PRODUTOS')
    Left = 299
    Top = 458
  end
  object qrRepliCodBarras: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'SELECT * from COD_BARRA')
    Left = 389
    Top = 458
  end
  object qrBuscasRepliCB: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 391
    Top = 605
  end
  object qrBuscasRepliP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 735
    Top = 62
  end
  object dspRepliProdutos: TDataSetProvider
    DataSet = qrRepliProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 299
    Top = 509
  end
  object dspRepliCodBarras: TDataSetProvider
    DataSet = qrRepliCodBarras
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 389
    Top = 509
  end
  object cdsRepliCodBarras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRepliCodBarras'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 389
    Top = 560
    object cdsRepliCodBarrasCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsRepliCodBarrasGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsRepliCodBarrasCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsRepliCodBarrasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRepliCodBarrasDAT_CAD_CDBAR: TDateTimeField
      FieldName = 'DAT_CAD_CDBAR'
    end
    object cdsRepliCodBarrasDAT_MOD_CDBAR: TDateTimeField
      FieldName = 'DAT_MOD_CDBAR'
    end
    object cdsRepliCodBarrasPADRAO_GTIN: TStringField
      FieldName = 'PADRAO_GTIN'
      Size = 10
    end
    object cdsRepliCodBarrasATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsRepliCodBarrasSEQID: TIntegerField
      FieldName = 'SEQID'
    end
  end
  object cdsRepliProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRepliProdutos'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 299
    Top = 560
  end
  object qrCompras: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select nf4.num_nf,it4.grupo_prod,it4.cod_prod,pr.num_fab_prod,'
      
        'pr.descr_prod,nf4.data_lanc,it4.quantidade,it4.valor_unitario,it' +
        '4.prec_cusm_prod,'
      
        'cl.nome_cliente,it4.nitem,it4.codigo_nop, it4.aliq_icm, it4.base' +
        '_icm, it4.valor_icm,'
      'it4.aliq_icmsub, it4.base_icmsub, it4.valor_icmsub,'
      'it4.aliq_ipi, it4.base_ipi,it4.valor_ipi,'
      'it4.aliq_iss, it4.base_iss, it4.valor_iss'
      'from notafiscal nf4 inner join notafiscal_item it4'
      
        '        on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_emp' +
        'resa'
      
        '        inner join produtos pr on it4.grupo_prod=pr.grupo_prod a' +
        'nd it4.cod_prod=pr.cod_prod'
      '        and it4.cod_empresa = pr.cod_empresa'
      
        '        inner join clientes cl on nf4.cod_cliente=cl.cod_cliente' +
        ' and nf4.cod_empresa=cl.cod_empresa'
      
        '        where nf4.natureza_nf='#39'E'#39' and it4.cod_prod = :vcod and i' +
        't4.grupo_prod = :vgrupo'
      '        and (nf4.status = '#39'Fechada'#39')'
      '        and  nf4.data_lanc >= :vdat1 and nf4.data_lanc <= :vdat2'
      '        and nf4.cod_empresa = :cod_empresa and nf4.ativo=1'
      '        order by 6')
    Left = 535
    Top = 459
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vcod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vgrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vdat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vdat2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrComprasNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      Origin = '"NOTAFISCAL"."NUM_NF"'
      Required = True
    end
    object qrComprasGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Origin = '"NOTAFISCAL_ITEM"."GRUPO_PROD"'
    end
    object qrComprasCOD_PROD: TIBStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PROD'
      Origin = '"NOTAFISCAL_ITEM"."COD_PROD"'
      FixedChar = True
      Size = 6
    end
    object qrComprasNUM_FAB_PROD: TIBStringField
      DisplayLabel = 'Num. Fab. Prod'
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PRODUTOS"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrComprasDESCR_PROD: TIBStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      Size = 115
    end
    object qrComprasDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DATA_LANC'
      Origin = '"NOTAFISCAL"."DATA_LANC"'
    end
    object qrComprasQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = '"NOTAFISCAL_ITEM"."QUANTIDADE"'
    end
    object qrComprasVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_UNITARIO"'
      currency = True
    end
    object qrComprasPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUSM_PROD"'
      currency = True
    end
    object qrComprasNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Nome do Fornecedor'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      FixedChar = True
      Size = 35
    end
    object qrComprasNITEM: TIntegerField
      DisplayLabel = 'N. do item'
      FieldName = 'NITEM'
      Origin = '"NOTAFISCAL_ITEM"."NITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrComprasCODIGO_NOP: TFloatField
      DisplayLabel = 'Natureza de Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
      Origin = '"NOTAFISCAL_ITEM"."CODIGO_NOP"'
    end
    object qrComprasALIQ_ICM: TFloatField
      DisplayLabel = 'Aliq ICMS'
      FieldName = 'ALIQ_ICM'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICM"'
    end
    object qrComprasVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICM"'
      currency = True
    end
    object qrComprasBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ICM"'
    end
    object qrComprasALIQ_ICMSUB: TFloatField
      DisplayLabel = 'Aliq ICMS Sub'
      FieldName = 'ALIQ_ICMSUB'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICMSUB"'
    end
    object qrComprasBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ICMSUB"'
    end
    object qrComprasVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS  SUB'
      FieldName = 'VALOR_ICMSUB'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICMSUB"'
      currency = True
    end
    object qrComprasALIQ_IPI: TFloatField
      DisplayLabel = 'Aliq IPI'
      FieldName = 'ALIQ_IPI'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_IPI"'
    end
    object qrComprasBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
      Origin = '"NOTAFISCAL_ITEM"."BASE_IPI"'
    end
    object qrComprasVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_IPI"'
      currency = True
    end
  end
  object dsCompras: TDataSource
    DataSet = qrCompras
    Left = 535
    Top = 505
  end
  object qrVendas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select pv.tipo, pv.nped, ipv.grupo_prod, ipv.cod_prod, ipv.num_f' +
        'ab_prod,'
      
        'pr.descr_prod,  pv.data_fech, ipv.quant_ped_item, ipv.vltot_ped_' +
        'item,'
      'cl.cod_cliente, cl.nome_cliente,pv.tipv'
      
        ',coalesce(gra.cod_grade,0) as cod_grade,coalesce(trim(gra.descri' +
        'cao),'#39#39#39#39') as descricao'
      'from pedvenda pv inner join pedvenda_prod ipv on'
      'ipv.tipo = pv.tipo and ipv.nped = pv.nped and'
      'ipv.cod_empresa = pv.cod_empresa inner join produtos pr on'
      
        'pr.cod_prod = ipv.cod_prod and pr.grupo_prod = ipv.grupo_prod an' +
        'd'
      'pr.cod_empresa = ipv.cod_empresa inner join clientes cl on'
      
        'cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empr' +
        'esa'
      
        'left join grade gra on gra.cod_grade = ipv.cod_grade and gra.cod' +
        '_empresa = ipv.cod_empresa'
      
        'where ipv.cod_prod = :cod_prod and ipv.grupo_prod = :grupo_prod ' +
        'and'
      '(not pv.status_ped is null or pv.status_ped <> '#39#39') and'
      'pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and'
      'pv.ativo = 1 and pv.cod_empresa = :cod_empresa')
    Left = 599
    Top = 459
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
        Name = 'dataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrVendasTIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrVendasNPED: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object qrVendasGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      DisplayWidth = 6
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object qrVendasCOD_PROD: TIBStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA_PROD"."COD_PROD"'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrVendasNUM_FAB_PROD: TIBStringField
      DisplayLabel = 'Num Fabrica'#231#227'o'
      DisplayWidth = 15
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."NUM_FAB_PROD"'
      ProviderFlags = [pfInWhere, pfInKey]
      FixedChar = True
    end
    object qrVendasDESCR_PROD: TIBStringField
      DisplayLabel = 'Descri'#231#227'o Prod'
      DisplayWidth = 30
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      ProviderFlags = [pfInWhere, pfInKey]
      Size = 75
    end
    object qrVendasDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Venda'
      DisplayWidth = 15
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrVendasQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'QUANTIDADE'
      FieldName = 'QUANT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."QUANT_PED_ITEM"'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrVendasVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Valor Total Item'
      FieldName = 'VLTOT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_ITEM"'
      ProviderFlags = [pfInWhere, pfInKey]
      currency = True
    end
    object qrVendasDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o Grade'
      DisplayWidth = 32
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInWhere, pfInKey]
      Size = 32
    end
    object qrVendasCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      DisplayWidth = 6
      FieldName = 'COD_GRADE'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrVendasCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object qrVendasNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
      Size = 35
    end
    object qrVendasTIPV: TIBStringField
      DisplayLabel = 'Tipo de Sa'#237'da'
      FieldName = 'TIPV'
      Origin = '"PEDVENDA"."TIPV"'
      ProviderFlags = [pfInWhere, pfInKey]
      FixedChar = True
      Size = 1
    end
  end
  object dsVendas: TDataSource
    DataSet = qrVendas
    Left = 599
    Top = 505
  end
  object qrUltComp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select nf4.num_nf,fr.nome_cliente,nf4.data_lanc,cond.desc_cond_p' +
        'ag,'
      
        'it4.quantidade,it4.valor_unitario,it4.prec_cusm_prod,it4.aliq_ic' +
        'm,it4.valor_ipi,'
      
        'it4.vl_multp,it4.qtdemb,it4.prec_vnd_prod,it4.PRCTB_ITEM,it4.RAT' +
        'EIO_DESCONTO,it4.PMARGFIM,'
      
        'It4.PERC_FRETE,nf4.da,it4.mnf,it4.nitem,it4.codigo_nop,it4.PR_CU' +
        'SC_PROD,it4.descricao_item'
      
        'from notafiscal nf4 inner join notafiscal_item it4 on nf4.cod_nf' +
        '=it4.cod_nf'
      
        'and nf4.cod_empresa=it4.cod_empresa inner join cond_pag cond on ' +
        'nf4.cod_cond_pag ='
      
        'cond.cod_cond_pag inner join clientes fr on nf4.cod_cliente = fr' +
        '.cod_cliente and'
      'nf4.cod_empresa = fr.cod_empresa where nf4.natureza_nf='#39'E'#39' and '
      'it4.cod_prod = '#39#39
      'and it4.grupo_prod = 0'
      'and (nf4.status = '#39'Fechada'#39') and nf4.cod_empresa = 1'
      'and nf4.ativo=1 order by 1 desc')
    Left = 671
    Top = 459
    object qrUltCompNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      Origin = '"NOTAFISCAL"."NUM_NF"'
      Required = True
    end
    object qrUltCompNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      FixedChar = True
      Size = 35
    end
    object qrUltCompDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lanc'
      FieldName = 'DATA_LANC'
      Origin = '"NOTAFISCAL"."DATA_LANC"'
    end
    object qrUltCompDESC_COND_PAG: TIBStringField
      DisplayLabel = 'Cond Pag'
      FieldName = 'DESC_COND_PAG'
      Origin = '"COND_PAG"."DESC_COND_PAG"'
      Size = 30
    end
    object qrUltCompQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
      Origin = '"NOTAFISCAL_ITEM"."QUANTIDADE"'
    end
    object qrUltCompVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Un'
      FieldName = 'VALOR_UNITARIO'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_UNITARIO"'
      currency = True
    end
    object qrUltCompPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUSM_PROD"'
      currency = True
    end
    object qrUltCompALIQ_ICM: TFloatField
      DisplayLabel = 'Aliq ICMS'
      FieldName = 'ALIQ_ICM'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICM"'
      DisplayFormat = '##0.00'
    end
    object qrUltCompVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_IPI"'
      currency = True
    end
    object qrUltCompVL_MULTP: TFloatField
      DisplayLabel = 'Multiplicador'
      FieldName = 'VL_MULTP'
      Origin = '"NOTAFISCAL_ITEM"."VL_MULTP"'
      DisplayFormat = '##0.0000'
    end
    object qrUltCompQTDEMB: TFloatField
      DisplayLabel = 'Qtde Emb'
      FieldName = 'QTDEMB'
      Origin = '"NOTAFISCAL_ITEM"."QTDEMB"'
    end
    object qrUltCompPREC_VND_PROD: TFloatField
      DisplayLabel = 'Valor Venda'
      FieldName = 'PREC_VND_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_VND_PROD"'
      currency = True
    end
    object qrUltCompPRCTB_ITEM: TFloatField
      DisplayLabel = 'Markup'
      FieldName = 'PRCTB_ITEM'
      Origin = '"NOTAFISCAL_ITEM"."PRCTB_ITEM"'
      DisplayFormat = '##0.00'
    end
    object qrUltCompRATEIO_DESCONTO: TFloatField
      DisplayLabel = 'Rateio Desconto'
      FieldName = 'RATEIO_DESCONTO'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_DESCONTO"'
      currency = True
    end
    object qrUltCompPMARGFIM: TFloatField
      DisplayLabel = 'Perc Margem'
      FieldName = 'PMARGFIM'
      Origin = '"NOTAFISCAL_ITEM"."PMARGFIM"'
      DisplayFormat = '##0.00'
    end
    object qrUltCompPERC_FRETE: TFloatField
      DisplayLabel = 'Perc Frete'
      FieldName = 'PERC_FRETE'
      Origin = '"NOTAFISCAL_ITEM"."PERC_FRETE"'
      DisplayFormat = '##0.00'
    end
    object qrUltCompDA: TIBStringField
      FieldName = 'DA'
      Origin = '"NOTAFISCAL"."DA"'
      FixedChar = True
      Size = 1
    end
    object qrUltCompMNF: TIBStringField
      FieldName = 'MNF'
      Origin = '"NOTAFISCAL_ITEM"."MNF"'
      FixedChar = True
      Size = 1
    end
    object qrUltCompNITEM: TIntegerField
      DisplayLabel = 'N Item'
      FieldName = 'NITEM'
      Origin = '"NOTAFISCAL_ITEM"."NITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrUltCompCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      Origin = '"NOTAFISCAL_ITEM"."CODIGO_NOP"'
    end
    object qrUltCompPR_CUSC_PROD: TFloatField
      DisplayLabel = 'Ultimo Custo'
      FieldName = 'PR_CUSC_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PR_CUSC_PROD"'
      currency = True
    end
    object qrUltCompDESCRICAO_ITEM: TIBStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_ITEM'
      Origin = '"NOTAFISCAL_ITEM"."DESCRICAO_ITEM"'
      Size = 75
    end
  end
  object dsUltComp: TDataSource
    DataSet = qrUltComp
    Left = 671
    Top = 505
  end
  object qrMedia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select infe.num_nota_nfe,fr.nome,nfe.data_lanc_nfe,cond.desc_con' +
        'd_pag,'
      
        'infe.quant_item_nfe,infe.vlun_item_nfe,infe.prec_cus_cnt,infe.al' +
        'icm_item_nfe,'
      
        'infe.ipi_item_nfe,infe.vl_multp,infe.qtdemb,infe.prec_cus_r,infe' +
        '.prec_vnd_prod,'
      
        'infe.prctb_item_nfe,infe.vlr_desc,infe.pmargfim,infe.perc_frete_' +
        'nfe,nfe.da,infe.mnf,'
      
        'nfe.CODIGO_NOP, infe.pr_cusc_prod from nf_entrada nfe inner join' +
        ' item_nf_entrada infe on'
      
        'infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe' +
        '.cod_forn_nfe and'
      'infe.cod_empresa = nfe.cod_empresa inner join fornecedor fr on'
      
        'fr.codigo_f = nfe.cod_forn_nfe and fr.cod_empresa = nfe.cod_empr' +
        'esa'
      'inner join cond_pag cond on cond.cod_cond_pag = nfe.cod_cond_pag'
      
        'where infe.cod_prod = :cod_prod and infe.grupo_prod = :gruso_pro' +
        'd and'
      'nfe.cod_empresa = :cod_empresa order by nfe.data_lanc_nfe')
    Left = 735
    Top = 459
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gruso_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dsMedia: TDataSource
    DataSet = qrMedia
    Left = 735
    Top = 505
  end
  object qrTabPr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select gr.descricao,sg.descricao descSub,p.num_fab_prod,p.cod_pr' +
        'od,p.descr_prod,'
      
        'p.prec_cus_prod,p.prec_tab_prod,p.aplicacao_prod,p.data_ult_comp' +
        'ra,'
      
        'p.marca_p,p.n_max_prod,p.n_min_prod,p.classe_prod,p.clinv,p.clpr' +
        'eco,'
      
        'p.clpop,p.clqtv,p.clfrv,p.clatl,p.grupo_prod,p.sub_g_prod,p.est_' +
        'f,p.unidade,'
      
        'p.prec_30_prod,p.prec_60_prod,p.prec_90_prod,p.locacao_prod,p.lo' +
        'cacao_prod_1'
      
        'from produtos p inner join grupos gr on p.grupo_prod = gr.codigo' +
        '_grup'
      
        'inner join cod_barra cb on cb.cod_prod = p.cod_prod and cb.grupo' +
        '_prod = p.grupo_prod'
      'and cb.cod_empresa = p.cod_empresa'
      'left join sub_grupo sg on sg.codigo_subgr = p.sub_g_prod'
      
        'where  p.cod_empresa = 1 and p.ativo=1 and gr.codigo_grup in (10' +
        '1,1101,1102) order by gr.descricao')
    Left = 791
    Top = 459
    object qrTabPrDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPOS"."DESCRICAO"'
      Size = 80
    end
    object qrTabPrNUM_FAB_PROD: TIBStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PRODUTOS"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrTabPrCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"PRODUTOS"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrTabPrDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      FixedChar = True
      Size = 75
    end
    object qrTabPrPREC_CUS_PROD: TFloatField
      FieldName = 'PREC_CUS_PROD'
      Origin = '"PRODUTOS"."PREC_CUS_PROD"'
    end
    object qrTabPrPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      Origin = '"PRODUTOS"."PREC_TAB_PROD"'
    end
    object qrTabPrAPLICACAO_PROD: TIBStringField
      FieldName = 'APLICACAO_PROD'
      Origin = '"PRODUTOS"."APLICACAO_PROD"'
      Size = 150
    end
    object qrTabPrDATA_ULT_COMPRA: TDateTimeField
      FieldName = 'DATA_ULT_COMPRA'
      Origin = '"PRODUTOS"."DATA_ULT_COMPRA"'
    end
    object qrTabPrMARCA_P: TIBStringField
      FieldName = 'MARCA_P'
      Origin = '"PRODUTOS"."MARCA_P"'
      FixedChar = True
      Size = 10
    end
    object qrTabPrN_MAX_PROD: TFloatField
      FieldName = 'N_MAX_PROD'
      Origin = '"PRODUTOS"."N_MAX_PROD"'
    end
    object qrTabPrN_MIN_PROD: TFloatField
      FieldName = 'N_MIN_PROD'
      Origin = '"PRODUTOS"."N_MIN_PROD"'
    end
    object qrTabPrCLASSE_PROD: TIBStringField
      FieldName = 'CLASSE_PROD'
      Origin = '"PRODUTOS"."CLASSE_PROD"'
      FixedChar = True
      Size = 1
    end
    object qrTabPrCLINV: TIBStringField
      FieldName = 'CLINV'
      Origin = '"PRODUTOS"."CLINV"'
      FixedChar = True
      Size = 1
    end
    object qrTabPrCLPRECO: TIBStringField
      FieldName = 'CLPRECO'
      Origin = '"PRODUTOS"."CLPRECO"'
      FixedChar = True
      Size = 2
    end
    object qrTabPrCLPOP: TIBStringField
      FieldName = 'CLPOP'
      Origin = '"PRODUTOS"."CLPOP"'
      FixedChar = True
      Size = 2
    end
    object qrTabPrCLQTV: TIBStringField
      FieldName = 'CLQTV'
      Origin = '"PRODUTOS"."CLQTV"'
      FixedChar = True
      Size = 2
    end
    object qrTabPrCLFRV: TIBStringField
      FieldName = 'CLFRV'
      Origin = '"PRODUTOS"."CLFRV"'
      FixedChar = True
      Size = 2
    end
    object qrTabPrCLATL: TIBStringField
      FieldName = 'CLATL'
      Origin = '"PRODUTOS"."CLATL"'
      FixedChar = True
      Size = 2
    end
    object qrTabPrGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PRODUTOS"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrTabPrSUB_G_PROD: TIntegerField
      FieldName = 'SUB_G_PROD'
      Origin = '"PRODUTOS"."SUB_G_PROD"'
    end
    object qrTabPrEST_F: TFloatField
      FieldName = 'EST_F'
      Origin = '"PRODUTOS"."EST_F"'
    end
    object qrTabPrUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = '"PRODUTOS"."UNIDADE"'
      Size = 6
    end
    object qrTabPrPREC_30_PROD: TFloatField
      FieldName = 'PREC_30_PROD'
      Origin = '"PRODUTOS"."PREC_30_PROD"'
    end
    object qrTabPrPREC_60_PROD: TFloatField
      FieldName = 'PREC_60_PROD'
      Origin = '"PRODUTOS"."PREC_60_PROD"'
    end
    object qrTabPrPREC_90_PROD: TFloatField
      FieldName = 'PREC_90_PROD'
      Origin = '"PRODUTOS"."PREC_90_PROD"'
    end
    object qrTabPrLOCACAO_PROD: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrTabPrLOCACAO_PROD_1: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object qrTabPrDESCSUB: TIBStringField
      FieldName = 'DESCSUB'
      Origin = '"SUB_GRUPO"."DESCRICAO"'
      Size = 80
    end
  end
  object dsTabPr: TDataSource
    DataSet = qrTabPr
    Left = 791
    Top = 505
  end
  object rdpTabPreco: TRDprint
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
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Preview'
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
    TitulodoRelatorio = 'Tabela de Pre'#231'os'
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
    Left = 482
    Top = 561
  end
  object qrGrTab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGrupos
    SQL.Strings = (
      'SELECT * from grupos'
      '')
    Left = 572
    Top = 234
  end
  object dspGrTab: TDataSetProvider
    DataSet = qrGrTab
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 572
    Top = 285
  end
  object cdsGrTab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 572
    Top = 336
    object cdsGrTabCODIGO_GRUP: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_GRUP'
      Required = True
    end
    object cdsGrTabDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Grupo'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsGrTabSEQPERF: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'SEQPERF'
    end
    object cdsGrTabATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsGrTab: TDataSource
    DataSet = cdsGrTab
    Left = 572
    Top = 388
  end
  object qrSubTab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSubGrupo
    SQL.Strings = (
      'SELECT * from SUB_GRUPO'
      '')
    Left = 625
    Top = 234
  end
  object dspSubTab: TDataSetProvider
    DataSet = qrSubTab
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 625
    Top = 285
  end
  object cdsSubTab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubGrupo'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 625
    Top = 336
    object cdsSubTabCODIGO_SUBGR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_SUBGR'
      Required = True
    end
    object cdsSubTabDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Sub Grupo'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsSubTabCOD_GRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'COD_GRUPO'
    end
    object cdsSubTabATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsSubTabSUBSERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'SUBSERVICO'
      FixedChar = True
      Size = 1
    end
  end
  object dsSubTab: TDataSource
    DataSet = cdsSubTab
    Left = 625
    Top = 388
  end
  object qrRecAss: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transReceAss
    SQL.Strings = (
      
        'select * from REC_ASS where TIPO_UTIL <> '#39'P'#39' OR TIPO_UTIL IS NUL' +
        'L')
    Left = 15
    Top = 457
  end
  object dspRecAss: TDataSetProvider
    DataSet = qrRecAss
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 15
    Top = 508
  end
  object cdsRecAss: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecAss'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 15
    Top = 559
    object cdsRecAssCOD_RECEITA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_RECEITA'
      Required = True
    end
    object cdsRecAssDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o da Receita'
      FieldName = 'DESCRICAO'
      Size = 999
    end
    object cdsRecAssTIPO_UTIL: TStringField
      DisplayLabel = 'Tipo de utiliza'#231#227'o'
      FieldName = 'TIPO_UTIL'
      FixedChar = True
      Size = 1
    end
  end
  object dsRecAss: TDataSource
    AutoEdit = False
    DataSet = cdsRecAss
    Left = 15
    Top = 611
  end
  object qrGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from grade')
    Left = 79
    Top = 457
  end
  object dspGrade: TDataSetProvider
    DataSet = qrGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 79
    Top = 508
  end
  object cdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrade'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 79
    Top = 559
    object cdsGradeSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsGradeCOD_GRADE: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradeDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsGradeDESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsGradeCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGradeATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsGradeTIPO_EC: TStringField
      DisplayLabel = 'Tipo Ecommerce'
      FieldName = 'TIPO_EC'
      Size = 100
    end
    object cdsGradeDESCRICAO_EC: TStringField
      DisplayLabel = 'Descricao Ecommerce'
      FieldName = 'DESCRICAO_EC'
      Size = 100
    end
    object cdsGradeTIPO_EC1: TStringField
      DisplayLabel = 'Tipo Ecommerce 2'
      FieldName = 'TIPO_EC1'
      Size = 100
    end
    object cdsGradeDESCRICAO_EC1: TStringField
      DisplayLabel = 'Descricao Ecommerce 2'
      FieldName = 'DESCRICAO_EC1'
      Size = 100
    end
  end
  object dsGrade: TDataSource
    AutoEdit = False
    DataSet = cdsGrade
    Left = 79
    Top = 611
  end
  object qrGradePr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from COD_GRADE_PROD')
    Left = 151
    Top = 457
  end
  object dspGradePr: TDataSetProvider
    DataSet = qrGradePr
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 151
    Top = 508
  end
  object cdsGradePr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradePr'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 151
    Top = 559
    object cdsGradePrSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsGradePrGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsGradePrCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGradePrCOD_GRADE: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'd Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradePrCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGradePrQTDE: TFloatField
      Tag = 2
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      DisplayFormat = '##0.000'
    end
    object cdsGradePrATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsGradePrDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = cdsGrade
      LookupKeyFields = 'COD_GRADE'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_GRADE'
      Size = 32
      Lookup = True
    end
    object cdsGradePrDESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldKind = fkLookup
      FieldName = 'DESCRICAO1'
      LookupDataSet = cdsGrade
      LookupKeyFields = 'COD_GRADE'
      LookupResultField = 'DESCRICAO1'
      KeyFields = 'COD_GRADE'
      Size = 32
      Lookup = True
    end
    object cdsGradePrDISPONIVEL: TFloatField
      DisplayLabel = 'Dispon'#237'vel'
      FieldKind = fkInternalCalc
      FieldName = 'DISPONIVEL'
      DisplayFormat = '##0.000'
    end
  end
  object dsGradePr: TDataSource
    AutoEdit = False
    DataSet = cdsGradePr
    Left = 151
    Top = 611
  end
  object qrGradeT: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from grade')
    Left = 223
    Top = 457
  end
  object dspGradeT: TDataSetProvider
    DataSet = qrGradeT
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 223
    Top = 508
  end
  object cdsGradeT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeT'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 223
    Top = 559
    object cdsGradeTSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsGradeTCOD_GRADE: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradeTDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 32
    end
    object cdsGradeTDESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      FixedChar = True
      Size = 32
    end
    object cdsGradeTCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGradeTATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsGradeTEST_TEMP: TFloatField
      DisplayLabel = 'Estoque'
      FieldKind = fkInternalCalc
      FieldName = 'EST_TEMP'
    end
  end
  object dsGradeT: TDataSource
    AutoEdit = False
    DataSet = cdsGradeT
    Left = 223
    Top = 611
  end
  object updProd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  GRUPO_PROD,'
      '  COD_PROD,'
      '  COD_EMPRESA,'
      '  CODIGO_NOP,'
      '  SUB_G_PROD,'
      '  EST_F,'
      '  EST_R,'
      '  PREC_CUS_PROD,'
      '  PREC_TAB_PROD,'
      '  LOCACAO_PROD,'
      '  LOCACAO_PROD_1,'
      '  APLICACAO_PROD,'
      '  DATA_ULT_COMPRA,'
      '  VL_ULT_COMPRA,'
      '  N_CRI_PROD,'
      '  N_MIN_PROD,'
      '  N_MAX_PROD,'
      '  PREC_REP_PROD,'
      '  CLASSE_PROD,'
      '  QUANT_PED_PROD,'
      '  QUANT_TR_PROD,'
      '  DESCR_PROD,'
      '  IPI_PROD,'
      '  NUM_NF_REC,'
      '  QUANT_RET_PROD,'
      '  ICM_PROD,'
      '  QREQ_PROD,'
      '  QCONF_PROD,'
      '  PERC_TB_PROD,'
      '  NUM_FAB_PROD,'
      '  PREC_30_PROD,'
      '  PREC_60_PROD,'
      '  PREC_90_PROD,'
      '  MARCA_P,'
      '  ALT_COD_CUPOM,'
      '  PERC_RED_PROD,'
      '  COD_CUST_PROD,'
      '  COMISSAO_PROD,'
      '  ISENTO_PROD,'
      '  N_INCIDENCIA_PROD,'
      '  QUANT_PROD_BL,'
      '  LOCACAO1_BL,'
      '  LOCACAO2_BL,'
      '  UNIDADE,'
      '  PERC_TB_PROD3,'
      '  PERC_TB_PROD6,'
      '  PERC_TB_PROD9,'
      '  ALT_DESC_CUPOM,'
      '  CST_PROD,'
      '  CLINV,'
      '  CLPRECO,'
      '  CLPOP,'
      '  CLQTV,'
      '  CLFRV,'
      '  CLATL,'
      '  DT_ULT_VND,'
      '  DT_ULT_VNDA,'
      '  PREC_PUBLICO,'
      '  COD_PPS,'
      '  DAT_CAD_PROD,'
      '  DAT_MOD_PROD,'
      '  PREC_CUSR_PROD,'
      '  COD_DSGS,'
      '  ISENTO_PIS,'
      '  ESTC,'
      '  ESTS,'
      '  ESTM,'
      '  PREC_CUS_MNF,'
      '  EMB_PROD,'
      '  PERC_SUBSTTR,'
      '  QTDEMB,'
      '  BALANCA_PROD,'
      '  VALIDADE_PROD,'
      '  PREC_CUSR_MNF,'
      '  PREC_CUSM_PROD,'
      '  PERC_FRETE_PROD,'
      '  PREC_CUSMR_PROD,'
      '  ESTSUBSTR,'
      '  COMISSAO_PROD_GER,'
      '  CUSTO_HONDA,'
      '  ALIQ_RED_PROD,'
      '  TIP_PROD_IND,'
      '  PERC_TB_ATAC,'
      '  PERC_TB_VARE,'
      '  ICMANT_SUB,'
      '  NEC_ACOMP,'
      '  DIAS_ACOMP,'
      '  NBM,'
      '  PERC_AD_30,'
      '  PERC_AD_60,'
      '  PERC_AD_90,'
      '  DATA_MOD_PR,'
      '  ATIVO,'
      '  PESO_LIQ_PROD,'
      '  PESO_BRUT_PROD,'
      '  LOC_DEP,'
      '  COD_MARCA,'
      '  TOT_ALIQ,'
      '  DATA_ULT_AJUSTE,'
      '  PRECO_AJUSTE,'
      '  ALIQ_INTERNA_NFENT,'
      '  COD_RECEITA,'
      '  PERMITIR_DESCONTO,'
      '  ARREDONDAR_TRUNCAR,'
      '  EM_PROMOCAO,'
      '  PRECO_PROMOCAO,'
      '  TIPO_FAB,'
      '  CSDECQTDE,'
      '  CSDECVLUNT,'
      '  DESCR_PROD_RED,'
      '  CONSUMO,'
      '  BASEICMANT_SUB'
      'from PRODUTOS '
      'where'
      '  COD_EMPRESA = :COD_EMPRESA and'
      '  COD_PROD = :COD_PROD and'
      '  GRUPO_PROD = :GRUPO_PROD')
    ModifySQL.Strings = (
      'update PRODUTOS'
      'set'
      '  ALIQ_INTERNA_NFENT = :ALIQ_INTERNA_NFENT,'
      '  ALIQ_RED_PROD = :ALIQ_RED_PROD,'
      '  ALT_COD_CUPOM = :ALT_COD_CUPOM,'
      '  ALT_DESC_CUPOM = :ALT_DESC_CUPOM,'
      '  APLICACAO_PROD = :APLICACAO_PROD,'
      '  ARREDONDAR_TRUNCAR = :ARREDONDAR_TRUNCAR,'
      '  ATIVO = :ATIVO,'
      '  BALANCA_PROD = :BALANCA_PROD,'
      '  BASEICMANT_SUB = :BASEICMANT_SUB,'
      '  CLASSE_PROD = :CLASSE_PROD,'
      '  CLATL = :CLATL,'
      '  CLFRV = :CLFRV,'
      '  CLINV = :CLINV,'
      '  CLPOP = :CLPOP,'
      '  CLPRECO = :CLPRECO,'
      '  CLQTV = :CLQTV,'
      '  COD_CUST_PROD = :COD_CUST_PROD,'
      '  COD_DSGS = :COD_DSGS,'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  COD_MARCA = :COD_MARCA,'
      '  COD_PPS = :COD_PPS,'
      '  COD_PROD = :COD_PROD,'
      '  COD_RECEITA = :COD_RECEITA,'
      '  CODIGO_NOP = :CODIGO_NOP,'
      '  COMISSAO_PROD = :COMISSAO_PROD,'
      '  COMISSAO_PROD_GER = :COMISSAO_PROD_GER,'
      '  CONSUMO = :CONSUMO,'
      '  CSDECQTDE = :CSDECQTDE,'
      '  CSDECVLUNT = :CSDECVLUNT,'
      '  CST_PROD = :CST_PROD,'
      '  CUSTO_HONDA = :CUSTO_HONDA,'
      '  DAT_CAD_PROD = :DAT_CAD_PROD,'
      '  DAT_MOD_PROD = :DAT_MOD_PROD,'
      '  DATA_MOD_PR = :DATA_MOD_PR,'
      '  DATA_ULT_AJUSTE = :DATA_ULT_AJUSTE,'
      '  DATA_ULT_COMPRA = :DATA_ULT_COMPRA,'
      '  DESCR_PROD = :DESCR_PROD,'
      '  DESCR_PROD_RED = :DESCR_PROD_RED,'
      '  DIAS_ACOMP = :DIAS_ACOMP,'
      '  DT_ULT_VND = :DT_ULT_VND,'
      '  DT_ULT_VNDA = :DT_ULT_VNDA,'
      '  EM_PROMOCAO = :EM_PROMOCAO,'
      '  EMB_PROD = :EMB_PROD,'
      '  EST_F = :EST_F,'
      '  EST_R = :EST_R,'
      '  ESTC = :ESTC,'
      '  ESTM = :ESTM,'
      '  ESTS = :ESTS,'
      '  ESTSUBSTR = :ESTSUBSTR,'
      '  GRUPO_PROD = :GRUPO_PROD,'
      '  ICM_PROD = :ICM_PROD,'
      '  ICMANT_SUB = :ICMANT_SUB,'
      '  IPI_PROD = :IPI_PROD,'
      '  ISENTO_PIS = :ISENTO_PIS,'
      '  ISENTO_PROD = :ISENTO_PROD,'
      '  LOC_DEP = :LOC_DEP,'
      '  LOCACAO_PROD = :LOCACAO_PROD,'
      '  LOCACAO_PROD_1 = :LOCACAO_PROD_1,'
      '  LOCACAO1_BL = :LOCACAO1_BL,'
      '  LOCACAO2_BL = :LOCACAO2_BL,'
      '  MARCA_P = :MARCA_P,'
      '  N_CRI_PROD = :N_CRI_PROD,'
      '  N_INCIDENCIA_PROD = :N_INCIDENCIA_PROD,'
      '  N_MAX_PROD = :N_MAX_PROD,'
      '  N_MIN_PROD = :N_MIN_PROD,'
      '  NBM = :NBM,'
      '  NEC_ACOMP = :NEC_ACOMP,'
      '  NUM_FAB_PROD = :NUM_FAB_PROD,'
      '  NUM_NF_REC = :NUM_NF_REC,'
      '  PERC_AD_30 = :PERC_AD_30,'
      '  PERC_AD_60 = :PERC_AD_60,'
      '  PERC_AD_90 = :PERC_AD_90,'
      '  PERC_FRETE_PROD = :PERC_FRETE_PROD,'
      '  PERC_RED_PROD = :PERC_RED_PROD,'
      '  PERC_SUBSTTR = :PERC_SUBSTTR,'
      '  PERC_TB_ATAC = :PERC_TB_ATAC,'
      '  PERC_TB_PROD = :PERC_TB_PROD,'
      '  PERC_TB_PROD3 = :PERC_TB_PROD3,'
      '  PERC_TB_PROD6 = :PERC_TB_PROD6,'
      '  PERC_TB_PROD9 = :PERC_TB_PROD9,'
      '  PERC_TB_VARE = :PERC_TB_VARE,'
      '  PERMITIR_DESCONTO = :PERMITIR_DESCONTO,'
      '  PESO_BRUT_PROD = :PESO_BRUT_PROD,'
      '  PESO_LIQ_PROD = :PESO_LIQ_PROD,'
      '  PREC_30_PROD = :PREC_30_PROD,'
      '  PREC_60_PROD = :PREC_60_PROD,'
      '  PREC_90_PROD = :PREC_90_PROD,'
      '  PREC_CUS_MNF = :PREC_CUS_MNF,'
      '  PREC_CUS_PROD = :PREC_CUS_PROD,'
      '  PREC_CUSM_PROD = :PREC_CUSM_PROD,'
      '  PREC_CUSMR_PROD = :PREC_CUSMR_PROD,'
      '  PREC_CUSR_MNF = :PREC_CUSR_MNF,'
      '  PREC_CUSR_PROD = :PREC_CUSR_PROD,'
      '  PREC_PUBLICO = :PREC_PUBLICO,'
      '  PREC_REP_PROD = :PREC_REP_PROD,'
      '  PREC_TAB_PROD = :PREC_TAB_PROD,'
      '  PRECO_AJUSTE = :PRECO_AJUSTE,'
      '  PRECO_PROMOCAO = :PRECO_PROMOCAO,'
      '  QCONF_PROD = :QCONF_PROD,'
      '  QREQ_PROD = :QREQ_PROD,'
      '  QTDEMB = :QTDEMB,'
      '  QUANT_PED_PROD = :QUANT_PED_PROD,'
      '  QUANT_PROD_BL = :QUANT_PROD_BL,'
      '  QUANT_RET_PROD = :QUANT_RET_PROD,'
      '  QUANT_TR_PROD = :QUANT_TR_PROD,'
      '  SUB_G_PROD = :SUB_G_PROD,'
      '  TIP_PROD_IND = :TIP_PROD_IND,'
      '  TIPO_FAB = :TIPO_FAB,'
      '  TOT_ALIQ = :TOT_ALIQ,'
      '  UNIDADE = :UNIDADE,'
      '  VALIDADE_PROD = :VALIDADE_PROD,'
      '  VL_ULT_COMPRA = :VL_ULT_COMPRA'
      'where'
      '  COD_EMPRESA = :OLD_COD_EMPRESA and'
      '  COD_PROD = :OLD_COD_PROD and'
      '  GRUPO_PROD = :OLD_GRUPO_PROD')
    InsertSQL.Strings = (
      'insert into PRODUTOS'
      
        '  (ALIQ_INTERNA_NFENT, ALIQ_RED_PROD, ALT_COD_CUPOM, ALT_DESC_CU' +
        'POM, APLICACAO_PROD, '
      
        '   ARREDONDAR_TRUNCAR, ATIVO, BALANCA_PROD, BASEICMANT_SUB, CLAS' +
        'SE_PROD, '
      
        '   CLATL, CLFRV, CLINV, CLPOP, CLPRECO, CLQTV, COD_CUST_PROD, CO' +
        'D_DSGS, '
      
        '   COD_EMPRESA, COD_MARCA, COD_PPS, COD_PROD, COD_RECEITA, CODIG' +
        'O_NOP, '
      
        '   COMISSAO_PROD, COMISSAO_PROD_GER, CONSUMO, CSDECQTDE, CSDECVL' +
        'UNT, CST_PROD, '
      
        '   CUSTO_HONDA, DAT_CAD_PROD, DAT_MOD_PROD, DATA_MOD_PR, DATA_UL' +
        'T_AJUSTE, '
      
        '   DATA_ULT_COMPRA, DESCR_PROD, DESCR_PROD_RED, DIAS_ACOMP, DT_U' +
        'LT_VND, '
      
        '   DT_ULT_VNDA, EM_PROMOCAO, EMB_PROD, EST_F, EST_R, ESTC, ESTM,' +
        ' ESTS, '
      
        '   ESTSUBSTR, GRUPO_PROD, ICM_PROD, ICMANT_SUB, IPI_PROD, ISENTO' +
        '_PIS, ISENTO_PROD, '
      
        '   LOC_DEP, LOCACAO_PROD, LOCACAO_PROD_1, LOCACAO1_BL, LOCACAO2_' +
        'BL, MARCA_P, '
      
        '   N_CRI_PROD, N_INCIDENCIA_PROD, N_MAX_PROD, N_MIN_PROD, NBM, N' +
        'EC_ACOMP, '
      
        '   NUM_FAB_PROD, NUM_NF_REC, PERC_AD_30, PERC_AD_60, PERC_AD_90,' +
        ' PERC_FRETE_PROD, '
      '   PERC_RED_PROD, PERC_SUBSTTR, PERC_TB_ATAC, PERC_TB_PROD, '
      
        '   PERC_TB_PROD3, PERC_TB_PROD6, PERC_TB_PROD9, PERC_TB_VARE, PE' +
        'RMITIR_DESCONTO, '
      
        '   PESO_BRUT_PROD, PESO_LIQ_PROD, PREC_30_PROD, PREC_60_PROD, PR' +
        'EC_90_PROD, '
      
        '   PREC_CUS_MNF, PREC_CUS_PROD, PREC_CUSM_PROD, PREC_CUSMR_PROD,' +
        ' PREC_CUSR_MNF, '
      
        '   PREC_CUSR_PROD, PREC_PUBLICO, PREC_REP_PROD, PREC_TAB_PROD, P' +
        'RECO_AJUSTE, '
      
        '   PRECO_PROMOCAO, QCONF_PROD, QREQ_PROD, QTDEMB, QUANT_PED_PROD' +
        ', QUANT_PROD_BL, '
      
        '   QUANT_RET_PROD, QUANT_TR_PROD, SUB_G_PROD, TIP_PROD_IND, TIPO' +
        '_FAB, TOT_ALIQ, '
      '   UNIDADE, VALIDADE_PROD, VL_ULT_COMPRA)'
      'values'
      
        '  (:ALIQ_INTERNA_NFENT, :ALIQ_RED_PROD, :ALT_COD_CUPOM, :ALT_DES' +
        'C_CUPOM, '
      
        '   :APLICACAO_PROD, :ARREDONDAR_TRUNCAR, :ATIVO, :BALANCA_PROD, ' +
        ':BASEICMANT_SUB, '
      
        '   :CLASSE_PROD, :CLATL, :CLFRV, :CLINV, :CLPOP, :CLPRECO, :CLQT' +
        'V, :COD_CUST_PROD, '
      
        '   :COD_DSGS, :COD_EMPRESA, :COD_MARCA, :COD_PPS, :COD_PROD, :CO' +
        'D_RECEITA, '
      
        '   :CODIGO_NOP, :COMISSAO_PROD, :COMISSAO_PROD_GER, :CONSUMO, :C' +
        'SDECQTDE, '
      
        '   :CSDECVLUNT, :CST_PROD, :CUSTO_HONDA, :DAT_CAD_PROD, :DAT_MOD' +
        '_PROD, '
      
        '   :DATA_MOD_PR, :DATA_ULT_AJUSTE, :DATA_ULT_COMPRA, :DESCR_PROD' +
        ', :DESCR_PROD_RED, '
      
        '   :DIAS_ACOMP, :DT_ULT_VND, :DT_ULT_VNDA, :EM_PROMOCAO, :EMB_PR' +
        'OD, :EST_F, '
      
        '   :EST_R, :ESTC, :ESTM, :ESTS, :ESTSUBSTR, :GRUPO_PROD, :ICM_PR' +
        'OD, :ICMANT_SUB, '
      
        '   :IPI_PROD, :ISENTO_PIS, :ISENTO_PROD, :LOC_DEP, :LOCACAO_PROD' +
        ', :LOCACAO_PROD_1, '
      
        '   :LOCACAO1_BL, :LOCACAO2_BL, :MARCA_P, :N_CRI_PROD, :N_INCIDEN' +
        'CIA_PROD, '
      
        '   :N_MAX_PROD, :N_MIN_PROD, :NBM, :NEC_ACOMP, :NUM_FAB_PROD, :N' +
        'UM_NF_REC, '
      
        '   :PERC_AD_30, :PERC_AD_60, :PERC_AD_90, :PERC_FRETE_PROD, :PER' +
        'C_RED_PROD, '
      '   :PERC_SUBSTTR, :PERC_TB_ATAC, :PERC_TB_PROD, :PERC_TB_PROD3, '
      
        '   :PERC_TB_PROD6, :PERC_TB_PROD9, :PERC_TB_VARE, :PERMITIR_DESC' +
        'ONTO, :PESO_BRUT_PROD, '
      
        '   :PESO_LIQ_PROD, :PREC_30_PROD, :PREC_60_PROD, :PREC_90_PROD, ' +
        ':PREC_CUS_MNF, '
      
        '   :PREC_CUS_PROD, :PREC_CUSM_PROD, :PREC_CUSMR_PROD, :PREC_CUSR' +
        '_MNF, :PREC_CUSR_PROD, '
      
        '   :PREC_PUBLICO, :PREC_REP_PROD, :PREC_TAB_PROD, :PRECO_AJUSTE,' +
        ' :PRECO_PROMOCAO, '
      
        '   :QCONF_PROD, :QREQ_PROD, :QTDEMB, :QUANT_PED_PROD, :QUANT_PRO' +
        'D_BL, :QUANT_RET_PROD, '
      
        '   :QUANT_TR_PROD, :SUB_G_PROD, :TIP_PROD_IND, :TIPO_FAB, :TOT_A' +
        'LIQ, :UNIDADE, '
      '   :VALIDADE_PROD, :VL_ULT_COMPRA)')
    DeleteSQL.Strings = (
      'delete from PRODUTOS'
      'where'
      '  COD_EMPRESA = :OLD_COD_EMPRESA and'
      '  COD_PROD = :OLD_COD_PROD and'
      '  GRUPO_PROD = :OLD_GRUPO_PROD')
    Left = 880
    Top = 61
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    CachedUpdates = True
    SQL.Strings = (
      'select *  from PRODUTOS')
    UpdateObject = updProd
    Left = 884
    Top = 17
  end
  object qrLocSG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSubGrupo
    SQL.Strings = (
      'SELECT * from SUB_GRUPO'
      '')
    Left = 737
    Top = 238
  end
  object dspLocSG: TDataSetProvider
    DataSet = qrLocSG
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 737
    Top = 286
  end
  object cdsLocSG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocSG'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 737
    Top = 335
    object cdsLocSGCODIGO_SUBGR: TIntegerField
      FieldName = 'CODIGO_SUBGR'
      Required = True
    end
    object cdsLocSGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dsLocSG: TDataSource
    DataSet = cdsLocSG
    Left = 737
    Top = 384
  end
  object qrLocG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGrupos
    SQL.Strings = (
      'SELECT * from grupos'
      '')
    Left = 783
    Top = 238
  end
  object dspLocG: TDataSetProvider
    DataSet = qrLocG
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 783
    Top = 286
  end
  object cdsLocG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocG'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 783
    Top = 335
    object cdsLocGCODIGO_GRUP: TIntegerField
      FieldName = 'CODIGO_GRUP'
      Required = True
    end
    object cdsLocGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dsLocG: TDataSource
    DataSet = cdsLocG
    Left = 783
    Top = 384
  end
  object transReceAss: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 225
    Top = 45
  end
  object spIncCodREcASS: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transReceAss
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 31
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VTABELA'
        ParamType = ptInput
      end>
  end
  object qrRed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from REDUCAO')
    Left = 824
    Top = 238
  end
  object dspRed: TDataSetProvider
    DataSet = qrRed
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 824
    Top = 286
  end
  object cdsRed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRed'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 824
    Top = 335
    object cdsRedCOD_REDUCAO: TIntegerField
      DisplayLabel = 'C'#243'd Redu'#231#227'o'
      FieldName = 'COD_REDUCAO'
      Required = True
    end
    object cdsRedCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRedGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsRedCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsRedDENTRO_EST: TIntegerField
      DisplayLabel = 'Dentro Estado'
      FieldName = 'DENTRO_EST'
    end
    object cdsRedISENTO: TIntegerField
      DisplayLabel = 'Isento'
      FieldName = 'ISENTO'
    end
    object cdsRedALIQUOTA: TFloatField
      DisplayLabel = 'Al'#237'quota'
      FieldName = 'ALIQUOTA'
    end
    object cdsRedPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL'
    end
    object cdsRedATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsRed: TDataSource
    DataSet = cdsRed
    Left = 824
    Top = 384
  end
  object QrprodUpdate: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTrProdUpdate
    Left = 943
    Top = 59
  end
  object qrKits: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    SQL.Strings = (
      'SELECT KITS_PROD.*, '
      'KITS_PROD_TOT.REGRA_PESO_DIM,'
      
        'KITS_PROD_TOT.QUANT_PROD_KIT, KITS_PROD_TOT.PREC_CUS_PROD, KITS_' +
        'PROD_TOT.PREC_CUSM_PROD, '
      'KITS_PROD_TOT.PREC_TAB_PROD, KITS_PROD_TOT.PREC_PUBLICO, '
      
        'KITS_PROD_TOT.PREC_30_PROD, KITS_PROD_TOT.PREC_60_PROD, KITS_PRO' +
        'D_TOT.PREC_90_PROD, '
      'KITS_PROD_TOT.PESO_BRUT_PROD, KITS_PROD_TOT.COMPRIMENTO_PROD, '
      'KITS_PROD_TOT.LARGURA_PROD, KITS_PROD_TOT.ALTURA_PROD, '
      'KITS_PROD_TOT.EST_F, KITS_PROD_TOT.VALOR_TAB_PROKIT,'
      
        'KITS_PROD_TOT.DESCONTO_VALOR, KITS_PROD_TOT.DESCONTO_PERC, KITS_' +
        'PROD_TOT.VALOR_DESC_TAB_PROKIT'
      ' FROM KITS_PROD '
      
        'LEFT JOIN KITS_PROD_TOT ON KITS_PROD_TOT.CODIGO_KIT = KITS_PROD.' +
        'CODIGO_KIT AND KITS_PROD_TOT.COD_EMPRESA = KITS_PROD.COD_EMPRESA' +
        ' '
      'WHERE 1 = 0')
    Left = 868
    Top = 238
  end
  object dspKits: TDataSetProvider
    DataSet = qrKits
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 868
    Top = 286
  end
  object cdsKits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKits'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 868
    Top = 335
    object cdsKitsSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsKitsCODIGO_KIT: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo do Kit'
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object cdsKitsCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsKitsDESCRICAO_KIT: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do Kit'
      FieldName = 'DESCRICAO_KIT'
      FixedChar = True
      Size = 75
    end
    object cdsKitsKIT_TODO: TStringField
      DisplayLabel = 'Kit Completo'
      FieldName = 'KIT_TODO'
      FixedChar = True
      Size = 1
    end
    object cdsKitsID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object cdsKitsATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsKitsALTEROU_IMAGEM: TStringField
      Tag = 1
      DisplayLabel = 'Alterou Imagens'
      FieldName = 'ALTEROU_IMAGEM'
      FixedChar = True
      Size = 1
    end
    object cdsKitsLISTA_IMAGENS: TMemoField
      Tag = 1
      DisplayLabel = 'Lista Imagens'
      FieldName = 'LISTA_IMAGENS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsKitsURL_IMAGENS: TMemoField
      Tag = 1
      DisplayLabel = 'Url Imagens'
      FieldName = 'URL_IMAGENS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsKitsREGRA_PESO_DIM: TStringField
      Tag = 1
      DisplayLabel = 'Regra peso e dimensao'
      FieldName = 'REGRA_PESO_DIM'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsKitsQUANT_PROD_KIT: TFloatField
      DisplayLabel = 'Total Quantidade'
      FieldName = 'QUANT_PROD_KIT'
      ReadOnly = True
      DisplayFormat = '##0.000'
    end
    object cdsKitsPREC_CUS_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Total Preco Custo'
      FieldName = 'PREC_CUS_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsPREC_CUSM_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Total Preco Custo Medio'
      FieldName = 'PREC_CUSM_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Total Preco de Tabela'
      FieldName = 'PREC_TAB_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsPREC_PUBLICO: TFloatField
      DisplayLabel = 'Total Preco de Atacado'
      FieldName = 'PREC_PUBLICO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsPREC_30_PROD: TFloatField
      DisplayLabel = 'Total Preco 30 dias'
      FieldName = 'PREC_30_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsPREC_60_PROD: TFloatField
      DisplayLabel = 'Total Preco 60 dias'
      FieldName = 'PREC_60_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsPREC_90_PROD: TFloatField
      DisplayLabel = 'Total Preco 90 dias'
      FieldName = 'PREC_90_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsPESO_BRUT_PROD: TFloatField
      DisplayLabel = 'Peso Kit'
      FieldName = 'PESO_BRUT_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsKitsVALOR_TAB_PROKIT: TFloatField
      DisplayLabel = 'Preco Ecommerce Bruto'
      FieldName = 'VALOR_TAB_PROKIT'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsDESCONTO_VALOR: TFloatField
      DisplayLabel = 'Desconto Ecommerce R$'
      FieldName = 'DESCONTO_VALOR'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsDESCONTO_PERC: TFloatField
      DisplayLabel = 'Desconto Ecommerce %'
      FieldName = 'DESCONTO_PERC'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.000'
    end
    object cdsKitsVALOR_DESC_TAB_PROKIT: TFloatField
      DisplayLabel = 'Preco Ecommerce Liq'
      FieldName = 'VALOR_DESC_TAB_PROKIT'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsKitsCOMPRIMENTO_PROD: TFloatField
      DisplayLabel = 'Comprimento Kit'
      FieldName = 'COMPRIMENTO_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsKitsLARGURA_PROD: TFloatField
      DisplayLabel = 'Largura Kit'
      FieldName = 'LARGURA_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsKitsALTURA_PROD: TFloatField
      DisplayLabel = 'Altura Kit'
      FieldName = 'ALTURA_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsKitsEST_F: TFloatField
      DisplayLabel = 'Total Estoque Fisico'
      FieldName = 'EST_F'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      DisplayFormat = '##0.000'
    end
  end
  object dsKits: TDataSource
    DataSet = cdsKits
    Left = 868
    Top = 384
  end
  object IBTransKits: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 734
    Top = 12
  end
  object qrBuscasKits: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    Left = 512
    Top = 126
  end
  object SpIncCodKits: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 110
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VTABELA'
        ParamType = ptInput
      end>
  end
  object dsItKit: TDataSource
    DataSet = cdsItKit
    Left = 908
    Top = 384
  end
  object qrBuscasItKit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    Left = 584
    Top = 126
  end
  object qrLocPerfilProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'SELECT * FROM Perfil_Produtos where 1=0')
    Left = 173
    Top = 124
    object qrLocPerfilProdCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      Origin = '"PERFIL_PRODUTOS"."COD_PERFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocPerfilProdDESCR_PERFIL: TIBStringField
      FieldName = 'DESCR_PERFIL'
      Origin = '"PERFIL_PRODUTOS"."DESCR_PERFIL"'
      FixedChar = True
      Size = 30
    end
    object qrLocPerfilProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PERFIL_PRODUTOS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocPerfilProdCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
      Origin = '"PERFIL_PRODUTOS"."CODIGO_NOP"'
    end
    object qrLocPerfilProdSUB_G_PROD: TIntegerField
      FieldName = 'SUB_G_PROD'
      Origin = '"PERFIL_PRODUTOS"."SUB_G_PROD"'
    end
    object qrLocPerfilProdLOCACAO_PROD: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PERFIL_PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrLocPerfilProdLOCACAO_PROD_1: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PERFIL_PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object qrLocPerfilProdDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PERFIL_PRODUTOS"."DESCR_PROD"'
      FixedChar = True
      Size = 75
    end
    object qrLocPerfilProdIPI_PROD: TFloatField
      FieldName = 'IPI_PROD'
      Origin = '"PERFIL_PRODUTOS"."IPI_PROD"'
    end
    object qrLocPerfilProdICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
      Origin = '"PERFIL_PRODUTOS"."ICM_PROD"'
    end
    object qrLocPerfilProdPERC_TB_PROD: TFloatField
      FieldName = 'PERC_TB_PROD'
      Origin = '"PERFIL_PRODUTOS"."PERC_TB_PROD"'
    end
    object qrLocPerfilProdMARCA_P: TIBStringField
      FieldName = 'MARCA_P'
      Origin = '"PERFIL_PRODUTOS"."MARCA_P"'
      FixedChar = True
      Size = 30
    end
    object qrLocPerfilProdALT_COD_CUPOM: TIBStringField
      FieldName = 'ALT_COD_CUPOM'
      Origin = '"PERFIL_PRODUTOS"."ALT_COD_CUPOM"'
      FixedChar = True
      Size = 1
    end
    object qrLocPerfilProdPERC_RED_PROD: TFloatField
      FieldName = 'PERC_RED_PROD'
      Origin = '"PERFIL_PRODUTOS"."PERC_RED_PROD"'
    end
    object qrLocPerfilProdCOMISSAO_PROD: TFloatField
      FieldName = 'COMISSAO_PROD'
      Origin = '"PERFIL_PRODUTOS"."COMISSAO_PROD"'
    end
    object qrLocPerfilProdISENTO_PROD: TIBStringField
      FieldName = 'ISENTO_PROD'
      Origin = '"PERFIL_PRODUTOS"."ISENTO_PROD"'
      FixedChar = True
      Size = 1
    end
    object qrLocPerfilProdN_INCIDENCIA_PROD: TIBStringField
      FieldName = 'N_INCIDENCIA_PROD'
      Origin = '"PERFIL_PRODUTOS"."N_INCIDENCIA_PROD"'
      FixedChar = True
      Size = 1
    end
    object qrLocPerfilProdUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = '"PERFIL_PRODUTOS"."UNIDADE"'
      Size = 3
    end
    object qrLocPerfilProdPERC_TB_PROD3: TFloatField
      FieldName = 'PERC_TB_PROD3'
      Origin = '"PERFIL_PRODUTOS"."PERC_TB_PROD3"'
    end
    object qrLocPerfilProdPERC_TB_PROD6: TFloatField
      FieldName = 'PERC_TB_PROD6'
      Origin = '"PERFIL_PRODUTOS"."PERC_TB_PROD6"'
    end
    object qrLocPerfilProdPERC_TB_PROD9: TFloatField
      FieldName = 'PERC_TB_PROD9'
      Origin = '"PERFIL_PRODUTOS"."PERC_TB_PROD9"'
    end
    object qrLocPerfilProdALT_DESC_CUPOM: TIBStringField
      FieldName = 'ALT_DESC_CUPOM'
      Origin = '"PERFIL_PRODUTOS"."ALT_DESC_CUPOM"'
      FixedChar = True
      Size = 1
    end
    object qrLocPerfilProdCST_PROD: TIBStringField
      FieldName = 'CST_PROD'
      Origin = '"PERFIL_PRODUTOS"."CST_PROD"'
      FixedChar = True
      Size = 3
    end
    object qrLocPerfilProdCOD_PPS: TIBStringField
      FieldName = 'COD_PPS'
      Origin = '"PERFIL_PRODUTOS"."COD_PPS"'
      FixedChar = True
      Size = 2
    end
    object qrLocPerfilProdCOD_DSGS: TIBStringField
      FieldName = 'COD_DSGS'
      Origin = '"PERFIL_PRODUTOS"."COD_DSGS"'
      FixedChar = True
      Size = 6
    end
    object qrLocPerfilProdISENTO_PIS: TIBStringField
      FieldName = 'ISENTO_PIS'
      Origin = '"PERFIL_PRODUTOS"."ISENTO_PIS"'
      FixedChar = True
      Size = 1
    end
    object qrLocPerfilProdEMB_PROD: TIBStringField
      FieldName = 'EMB_PROD'
      Origin = '"PERFIL_PRODUTOS"."EMB_PROD"'
      FixedChar = True
      Size = 10
    end
    object qrLocPerfilProdPERC_SUBSTTR: TFloatField
      FieldName = 'PERC_SUBSTTR'
      Origin = '"PERFIL_PRODUTOS"."PERC_SUBSTTR"'
    end
    object qrLocPerfilProdQTDEMB: TFloatField
      FieldName = 'QTDEMB'
      Origin = '"PERFIL_PRODUTOS"."QTDEMB"'
    end
    object qrLocPerfilProdBALANCA_PROD: TIBStringField
      FieldName = 'BALANCA_PROD'
      Origin = '"PERFIL_PRODUTOS"."BALANCA_PROD"'
      FixedChar = True
      Size = 1
    end
    object qrLocPerfilProdVALIDADE_PROD: TIBStringField
      FieldName = 'VALIDADE_PROD'
      Origin = '"PERFIL_PRODUTOS"."VALIDADE_PROD"'
      FixedChar = True
      Size = 2
    end
    object qrLocPerfilProdESTSUBSTR: TIBStringField
      FieldName = 'ESTSUBSTR'
      Origin = '"PERFIL_PRODUTOS"."ESTSUBSTR"'
      FixedChar = True
      Size = 80
    end
    object qrLocPerfilProdCOMISSAO_PROD_GER: TFloatField
      FieldName = 'COMISSAO_PROD_GER'
      Origin = '"PERFIL_PRODUTOS"."COMISSAO_PROD_GER"'
    end
    object qrLocPerfilProdALIQ_RED_PROD: TFloatField
      FieldName = 'ALIQ_RED_PROD'
      Origin = '"PERFIL_PRODUTOS"."ALIQ_RED_PROD"'
    end
    object qrLocPerfilProdTIP_PROD_IND: TIBStringField
      FieldName = 'TIP_PROD_IND'
      Origin = '"PERFIL_PRODUTOS"."TIP_PROD_IND"'
      FixedChar = True
      Size = 5
    end
    object qrLocPerfilProdPERC_TB_ATAC: TFloatField
      FieldName = 'PERC_TB_ATAC'
      Origin = '"PERFIL_PRODUTOS"."PERC_TB_ATAC"'
    end
    object qrLocPerfilProdPERC_TB_VARE: TFloatField
      FieldName = 'PERC_TB_VARE'
      Origin = '"PERFIL_PRODUTOS"."PERC_TB_VARE"'
    end
    object qrLocPerfilProdNEC_ACOMP: TIBStringField
      FieldName = 'NEC_ACOMP'
      Origin = '"PERFIL_PRODUTOS"."NEC_ACOMP"'
      FixedChar = True
      Size = 1
    end
    object qrLocPerfilProdDIAS_ACOMP: TIntegerField
      FieldName = 'DIAS_ACOMP'
      Origin = '"PERFIL_PRODUTOS"."DIAS_ACOMP"'
    end
    object qrLocPerfilProdNBM: TIBStringField
      FieldName = 'NBM'
      Origin = '"PERFIL_PRODUTOS"."NBM"'
      FixedChar = True
      Size = 8
    end
    object qrLocPerfilProdPERC_AD_30: TFloatField
      FieldName = 'PERC_AD_30'
      Origin = '"PERFIL_PRODUTOS"."PERC_AD_30"'
    end
    object qrLocPerfilProdPERC_AD_60: TFloatField
      FieldName = 'PERC_AD_60'
      Origin = '"PERFIL_PRODUTOS"."PERC_AD_60"'
    end
    object qrLocPerfilProdPERC_AD_90: TFloatField
      FieldName = 'PERC_AD_90'
      Origin = '"PERFIL_PRODUTOS"."PERC_AD_90"'
    end
    object qrLocPerfilProdATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"PERFIL_PRODUTOS"."ATIVO"'
    end
    object qrLocPerfilProdCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Origin = '"PERFIL_PRODUTOS"."COD_MARCA"'
    end
    object qrLocPerfilProdCFOP_INTER_N_CONT: TFloatField
      FieldName = 'CFOP_INTER_N_CONT'
      Origin = '"PERFIL_PRODUTOS"."CFOP_INTER_N_CONT"'
    end
    object qrLocPerfilProdMAX_DESC_ITEM: TFloatField
      FieldName = 'MAX_DESC_ITEM'
      Origin = '"PERFIL_PRODUTOS"."MAX_DESC_ITEM"'
    end
    object qrLocPerfilProdTOT_ALIQ: TIBStringField
      FieldName = 'TOT_ALIQ'
      Origin = '"PERFIL_PRODUTOS"."TOT_ALIQ"'
      FixedChar = True
      Size = 4
    end
  end
  object dsLocPerfilProd: TDataSource
    DataSet = qrLocPerfilProd
    Left = 174
    Top = 172
  end
  object qrLocPPSPerfilProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'Select * from pps_produtos where 1=0'
      '')
    Left = 261
    Top = 125
    object qrLocPPSPerfilProdCOD_PPS: TIBStringField
      FieldName = 'COD_PPS'
      Origin = '"PPS_PRODUTOS"."COD_PPS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsLocPPSPerfilProd: TDataSource
    DataSet = qrLocPPSPerfilProd
    Left = 262
    Top = 173
  end
  object qrLocSGrupoPerfil: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from sub_grupo where 1=0'
      '')
    Left = 360
    Top = 125
    object qrLocSGrupoPerfilCODIGO_SUBGR: TIntegerField
      FieldName = 'CODIGO_SUBGR'
      Origin = '"SUB_GRUPO"."CODIGO_SUBGR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocSGrupoPerfilDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"SUB_GRUPO"."DESCRICAO"'
      Size = 80
    end
  end
  object dsLocSGrupoPerfil: TDataSource
    DataSet = qrLocSGrupoPerfil
    Left = 358
    Top = 173
  end
  object spIncCodPerfil: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPerfilProd
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 182
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VTABELA'
        ParamType = ptInput
      end>
  end
  object IBTransPSimilar: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 800
    Top = 12
  end
  object qrProdSimiliar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select ps.*, pr.num_fab_prod, pr.descr_prod, prs.num_fab_prod as' +
        ' num_fab_prod_sim from prod_similares ps'
      
        'left join produtos pr on ps.grupo_prod = pr.grupo_prod and ps.co' +
        'd_prod = pr.cod_prod and ps.cod_empresa = pr.cod_empresa'
      
        'left join produtos prs on ps.grupo_ps = prs.grupo_prod and ps.co' +
        'd_ps = prs.cod_prod and ps.cod_empresa = prs.cod_empresa'
      'where 1 = 0')
    Left = 964
    Top = 238
  end
  object dspProdSimiliar: TDataSetProvider
    DataSet = qrProdSimiliar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 964
    Top = 286
  end
  object cdsProdSimiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdSimiliar'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 964
    Top = 335
    object cdsProdSimiliarSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsProdSimiliarGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdSimiliarCOD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdSimiliarNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabricacao Produto'
      FieldName = 'NUM_FAB_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsProdSimiliarDESCR_PROD: TStringField
      DisplayLabel = 'Descricao Produto'
      FieldName = 'DESCR_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 75
    end
    object cdsProdSimiliarGRUPO_PS: TIntegerField
      DisplayLabel = 'Grupo Produto Similar'
      FieldName = 'GRUPO_PS'
      Required = True
    end
    object cdsProdSimiliarCOD_PS: TStringField
      DisplayLabel = 'Cod Produto Similar'
      FieldName = 'COD_PS'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdSimiliarNUM_FAB_PROD_SIM: TStringField
      DisplayLabel = 'Numero Fabricacao Produto Similar'
      FieldName = 'NUM_FAB_PROD_SIM'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsProdSimiliarDESCPSIM: TStringField
      DisplayLabel = 'Descricao Produto Similar'
      FieldName = 'DESCPSIM'
      FixedChar = True
      Size = 75
    end
    object cdsProdSimiliarCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdSimiliarATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsProdSimiliar: TDataSource
    DataSet = cdsProdSimiliar
    Left = 964
    Top = 384
  end
  object qrBuscaPSimilar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    Left = 659
    Top = 126
  end
  object qrConsultasGE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGE
    SQL.Strings = (
      '')
    Left = 958
    Top = 123
  end
  object IBTransGE: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 273
    Top = 70
  end
  object qrInventario: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGE
    SQL.Strings = (
      '')
    Left = 966
    Top = 168
  end
  object qrBuscaInvet: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      '')
    Left = 894
    Top = 169
  end
  object RDprintGeral: TRDprint
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
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Preview'
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
    TitulodoRelatorio = 'Relat'#243'rio'
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
    Left = 538
    Top = 561
  end
  object qrTipoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoServ
    SQL.Strings = (
      'SELECT * FROM TIPO_SERVICO '
      'where ativo=1')
    Left = 683
    Top = 239
  end
  object dspTipoServ: TDataSetProvider
    DataSet = qrTipoServ
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 683
    Top = 286
  end
  object cdsTipoServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoServ'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 683
    Top = 335
    object cdsTipoServSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsTipoServCOD_SERVICO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsTipoServDESC_SERVICO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsTipoServVALOR_SERVICO: TFloatField
      DisplayLabel = 'Valor do Servi'#231'o'
      FieldName = 'VALOR_SERVICO'
      currency = True
    end
    object cdsTipoServSHONDA: TStringField
      DisplayLabel = 'M'#227'o de obra Honda'
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServALTCOD: TStringField
      DisplayLabel = 'Altera Desc. ou valor no Cupom'
      FieldName = 'ALTCOD'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServDATA_CAD_TIPO: TDateTimeField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CAD_TIPO'
    end
    object cdsTipoServDATA_MOD_TIPO: TDateTimeField
      DisplayLabel = 'Data de altera'#231#227'o'
      FieldName = 'DATA_MOD_TIPO'
    end
    object cdsTipoServSTIPO: TStringField
      DisplayLabel = 'Origem servi'#231'o'
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServTMO: TFloatField
      FieldName = 'TMO'
    end
    object cdsTipoServALIQ_ISS: TFloatField
      DisplayLabel = 'Al'#237'quota de ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsTipoServATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTipoServCOD_ESPE_SEG: TIntegerField
      DisplayLabel = 'Cod Esp'#233'cie Segmenta'#231#227'o Serv'
      FieldName = 'COD_ESPE_SEG'
    end
    object cdsTipoServCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsTipoServTMOSERVSIMULT: TStringField
      DisplayLabel = 'TMO Simult'#226'neo'
      FieldName = 'TMOSERVSIMULT'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServALT_DESC: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o'
      FieldName = 'ALT_DESC'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServSERV_PROP_TERC: TStringField
      DisplayLabel = 'Servi'#231'o ou Produto de Terceiro'
      FieldName = 'SERV_PROP_TERC'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServISENTO_SERV: TStringField
      DisplayLabel = 'Servi'#231'o Isento'
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServN_INCIDENCIA_SERV: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia no Servi'#231'o'
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServARREDONDAR_TRUNCAR: TStringField
      DisplayLabel = 'Arredondar ou Truncar'
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServCLASSE_SERV: TStringField
      DisplayLabel = 'Classe do Servi'#231'o'
      FieldName = 'CLASSE_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServCLASSE_QTD: TStringField
      DisplayLabel = 'Volume da demanda'
      FieldName = 'CLASSE_QTD'
      FixedChar = True
      Size = 2
    end
    object cdsTipoServCLASSE_POP: TStringField
      DisplayLabel = 'Popularidade'
      FieldName = 'CLASSE_POP'
      FixedChar = True
      Size = 2
    end
    object cdsTipoServCLASSE_ATL: TStringField
      DisplayLabel = 'Atualidade'
      FieldName = 'CLASSE_ATL'
      FixedChar = True
      Size = 2
    end
    object cdsTipoServDMD: TFloatField
      DisplayLabel = 'Demanda M'#233'dia Di'#225'ria'
      FieldName = 'DMD'
      DisplayFormat = '##0.0000'
    end
    object cdsTipoServCOD_SERV_LEICOMPLEMENTAR_166: TStringField
      DisplayLabel = 'Cod Serv Lei Complementar 166(Sped)'
      FieldName = 'COD_SERV_LEICOMPLEMENTAR_166'
      Size = 4
    end
    object cdsTipoServISENTO_PIS: TStringField
      DisplayLabel = 'Isento PIS'
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServCODIGO_TRIBUTACAO: TStringField
      DisplayLabel = 'Cod Tributa'#231#227'o'
      FieldName = 'CODIGO_TRIBUTACAO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsTipoServNFS_SERVICO: TStringField
      DisplayLabel = 'LC 116/03'
      FieldName = 'NFS_SERVICO'
      FixedChar = True
      Size = 5
    end
    object cdsTipoServCNAE_SERV: TIntegerField
      DisplayLabel = 'CNAE NFSe'
      FieldName = 'CNAE_SERV'
    end
    object cdsTipoServISS_RETIDO: TIntegerField
      DisplayLabel = 'ISS Retido NFSe'
      FieldName = 'ISS_RETIDO'
    end
    object cdsTipoServCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Size = 2
    end
    object cdsTipoServCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object cdsTipoServCST_PIS_ENT: TStringField
      DisplayLabel = 'CST PIS Entrada'
      FieldName = 'CST_PIS_ENT'
      Size = 2
    end
    object cdsTipoServCST_COFINS_ENT: TStringField
      DisplayLabel = 'CST COFINS Entrada'
      FieldName = 'CST_COFINS_ENT'
      Size = 2
    end
    object cdsTipoServNAT_REC: TStringField
      DisplayLabel = 'Nat Rec'
      FieldName = 'NAT_REC'
      Size = 3
    end
    object cdsTipoServIRRF_SERVICO: TFloatField
      DisplayLabel = 'Imposto de Renda retido na fonte'
      FieldName = 'IRRF_SERVICO'
    end
    object cdsTipoServVL_TETO_IRRF: TFloatField
      DisplayLabel = 'Valor Teto Imposto de Renda'
      FieldName = 'VL_TETO_IRRF'
      currency = True
    end
    object cdsTipoServSEQ_REVISAO: TIntegerField
      DisplayLabel = 'Seq. Revis'#227'o Gratuita'
      FieldName = 'SEQ_REVISAO'
    end
    object cdsTipoServCTISS: TStringField
      FieldName = 'CTISS'
      Size = 9
    end
    object cdsTipoServCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsTipoServENV_COMERCIO_ABERTO: TStringField
      Tag = 1
      DisplayLabel = 'Env Comercio Aberto'
      FieldName = 'ENV_COMERCIO_ABERTO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServID_COMERCIO_ABERTO: TIntegerField
      DisplayLabel = 'Id Comercio Aberto'
      FieldName = 'ID_COMERCIO_ABERTO'
    end
    object cdsTipoServDESC_SERV_RES: TStringField
      Tag = 1
      DisplayLabel = 'Descr Serv Resumida'
      FieldName = 'DESC_SERV_RES'
      Size = 131
    end
    object cdsTipoServDESC_SERV_COMPL: TMemoField
      Tag = 1
      DisplayLabel = 'Descr Serv Completa'
      FieldName = 'DESC_SERV_COMPL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsTipoServPRECO_A_COMBINAR_CA: TStringField
      Tag = 1
      DisplayLabel = 'Preco Combinar'
      FieldName = 'PRECO_A_COMBINAR_CA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServCTRIBNAC: TStringField
      DisplayLabel = 'Codigo Tributacao Nacional'
      FieldName = 'CTRIBNAC'
      EditMask = '!99.99.99;0;_'
      Size = 6
    end
    object cdsTipoServCTRIBMUN: TStringField
      DisplayLabel = 'Codigo Tributacao Municipal'
      FieldName = 'CTRIBMUN'
      EditMask = '999;0;_'
      Size = 3
    end
    object cdsTipoServCNBS: TStringField
      DisplayLabel = 'Codigo NBS'
      FieldName = 'CNBS'
      EditMask = '9.9999.99.99;0;_'
      Size = 9
    end
    object cdsTipoServCINDOP: TStringField
      DisplayLabel = 'NFSe - Cod Ind Operacao'
      FieldName = 'CINDOP'
      Size = 6
    end
    object cdsTipoServSINC_HW_CLOUD: TStringField
      DisplayLabel = 'Venda Online'
      FieldName = 'SINC_HW_CLOUD'
      Size = 1
    end
  end
  object dsTipoServ: TDataSource
    DataSet = cdsTipoServ
    Left = 683
    Top = 384
  end
  object qrEspecieSeg: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoServ
    SQL.Strings = (
      'SELECT * FROM ESPECIE_VEICULO')
    Left = 902
    Top = 457
    object qrEspecieSegCODIGO_ESP: TIntegerField
      FieldName = 'CODIGO_ESP'
      Origin = '"ESPECIE_VEICULO"."CODIGO_ESP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrEspecieSegDESCRICAO_ESP: TIBStringField
      FieldName = 'DESCRICAO_ESP'
      Origin = '"ESPECIE_VEICULO"."DESCRICAO_ESP"'
      FixedChar = True
      Size = 30
    end
  end
  object dsEspecieSeg: TDataSource
    DataSet = qrEspecieSeg
    Left = 903
    Top = 505
  end
  object IBTransTipoServ: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 817
    Top = 62
  end
  object qrCFOP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoServ
    SQL.Strings = (
      'select * from nat_op where ativo=1')
    Left = 1057
    Top = 460
    object qrCFOPCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
      Origin = '"NAT_OP"."CODIGO_NOP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrCFOPDESCRICAO_NOP: TIBStringField
      FieldName = 'DESCRICAO_NOP'
      Origin = '"NAT_OP"."DESCRICAO_NOP"'
      Size = 100
    end
  end
  object dsCFOP: TDataSource
    DataSet = qrCFOP
    Left = 1059
    Top = 505
  end
  object qrBuscasTipoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoServ
    Left = 814
    Top = 122
  end
  object dsPendenciaPedido: TDataSource
    Left = 528
    Top = 170
  end
  object qrFichaInv: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      '')
    Left = 680
    Top = 170
  end
  object qrRelFichaInv: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGE
    SQL.Strings = (
      '')
    Left = 615
    Top = 171
  end
  object qrFichaInvBal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select PR.GRUPO_PROD,PR.COD_PROD,PR.EST_R,PR.EST_F,'
      
        'PR.DESCR_PROD,PR.LOCACAO_PROD,PR.LOCACAO_PROD_1,PR.NUM_FAB_PROD,' +
        ' pr.UNIDADE,0 AS COD_GRADE  from produtos pr where 1=0')
    Left = 731
    Top = 126
    object qrFichaInvBalGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PRODUTOS"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrFichaInvBalCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"PRODUTOS"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrFichaInvBalEST_R: TFloatField
      FieldName = 'EST_R'
      Origin = '"PRODUTOS"."EST_R"'
    end
    object qrFichaInvBalEST_F: TFloatField
      FieldName = 'EST_F'
      Origin = '"PRODUTOS"."EST_F"'
    end
    object qrFichaInvBalDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      FixedChar = True
      Size = 75
    end
    object qrFichaInvBalLOCACAO_PROD: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrFichaInvBalLOCACAO_PROD_1: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object qrFichaInvBalNUM_FAB_PROD: TIBStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PRODUTOS"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrFichaInvBalUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = '"PRODUTOS"."UNIDADE"'
      Size = 3
    end
    object qrFichaInvBalCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      ProviderFlags = []
    end
  end
  object qrReqMerc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select gr.descricao,sg.descricao descSub,p.num_fab_prod,p.cod_pr' +
        'od,p.descr_prod,'
      
        'p.prec_cus_prod,p.prec_tab_prod,p.aplicacao_prod,p.data_ult_comp' +
        'ra,'
      
        'p.marca_p,p.n_max_prod,p.n_min_prod,p.classe_prod,p.clinv,p.clpr' +
        'eco,'
      
        'p.clpop,p.clqtv,p.clfrv,p.clatl,p.grupo_prod,p.sub_g_prod,p.est_' +
        'f,p.unidade,'
      
        'p.prec_30_prod,p.prec_60_prod,p.prec_90_prod,p.locacao_prod,p.lo' +
        'cacao_prod_1'
      
        'from produtos p inner join grupos gr on p.grupo_prod = gr.codigo' +
        '_grup'
      
        'inner join cod_barra cb on cb.cod_prod = p.cod_prod and cb.grupo' +
        '_prod = p.grupo_prod'
      'and cb.cod_empresa = p.cod_empresa'
      'left join sub_grupo sg on sg.codigo_subgr = p.sub_g_prod'
      
        'where  p.cod_empresa = 1 and p.ativo=1 and gr.codigo_grup in (10' +
        '1,1101,1102) order by gr.descricao')
    Left = 1111
    Top = 459
  end
  object cdsPromocao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPromocao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1033
    Top = 335
    object cdsPromocaoEM_PROMOCAO: TStringField
      DisplayLabel = 'Em Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsPromocaoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsPromocaoCOD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPromocaoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsPromocaoDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsPromocaoPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o de Tabela'
      FieldName = 'PREC_TAB_PROD'
    end
    object cdsPromocaoPRECO_PROMOCAO: TFloatField
      DisplayLabel = 'Pre'#231'o de Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
    end
    object cdsPromocaoAPLICACAO_PROD: TStringField
      DisplayLabel = 'Aplica'#231#227'o do produto'
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
    object cdsPromocaoNUM_BANCA: TIntegerField
      DisplayLabel = 'Banca'
      FieldName = 'NUM_BANCA'
    end
  end
  object qrPromocao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select *  from PRODUTOS where 1=0')
    Left = 1034
    Top = 238
  end
  object dspPromocao: TDataSetProvider
    DataSet = qrPromocao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1034
    Top = 285
  end
  object dsPromocao: TDataSource
    DataSet = cdsPromocao
    Left = 1034
    Top = 384
  end
  object cdsPromocao5: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 928
    Top = 608
    object cdsPromocao5EM_PROMOCAO: TStringField
      DisplayLabel = 'Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      Size = 1
    end
    object cdsPromocao5GRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsPromocao5COD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object StringField3NUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object FloatField1PREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o de Tabela'
      FieldName = 'PREC_TAB_PROD'
    end
    object FloatField2PRECO_PROMOCAO: TFloatField
      DisplayLabel = 'Pre'#231'o de Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
    end
    object StringField4DESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object StringField5APLICACAO_PROD: TStringField
      DisplayLabel = 'Aplica'#231#227'o do produto'
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
  end
  object qrBanca: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select *  from PRODUTOS where 1=0')
    Left = 1113
    Top = 506
    object qrBancaNUM_BANCA: TIntegerField
      FieldName = 'NUM_BANCA'
      Origin = '"PRODUTOS"."NUM_BANCA"'
    end
  end
  object dsBanca: TDataSource
    DataSet = qrBanca
    Left = 1121
    Top = 556
  end
  object qrEtiquetaTem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 739
    Top = 173
  end
  object IbTrProdUpdate: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 472
    Top = 456
  end
  object IbCodServicoLC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoServ
    SQL.Strings = (
      'select * from TIPOSERVICONFSE where ativo = 1')
    Left = 600
    Top = 560
  end
  object DspCodServicoLC: TDataSetProvider
    DataSet = IbCodServicoLC
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 784
    Top = 560
  end
  object CdsCodServicoLC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCodServicoLC'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 688
    Top = 560
    object CdsCodServicoLCCOD_TPSERVICO: TStringField
      FieldName = 'COD_TPSERVICO'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CdsCodServicoLCDESC_TPSERVICO: TStringField
      FieldName = 'DESC_TPSERVICO'
      Size = 200
    end
  end
  object DtTipoServicoLC: TDataSource
    DataSet = CdsCodServicoLC
    Left = 928
    Top = 560
  end
  object cdsProdTemp: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 681
    Top = 616
  end
  object dsProdTemp: TDataSource
    DataSet = cdsProdTemp
    Left = 746
    Top = 615
  end
  object cdsAltPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1232
    Top = 458
    object cdsAltPrecoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsAltPrecoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsAltPrecoDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsAltPrecoPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
    end
    object cdsAltPrecoPREC_30_PROD: TFloatField
      FieldName = 'PREC_30_PROD'
    end
    object cdsAltPrecoPREC_60_PROD: TFloatField
      FieldName = 'PREC_60_PROD'
    end
    object cdsAltPrecoPREC_90_PROD: TFloatField
      FieldName = 'PREC_90_PROD'
    end
    object cdsAltPrecoPREC_PUBLICO: TFloatField
      FieldName = 'PREC_PUBLICO'
    end
    object cdsAltPrecoPERC_AD_30: TFloatField
      FieldName = 'PERC_AD_30'
    end
    object cdsAltPrecoPERC_AD_60: TFloatField
      FieldName = 'PERC_AD_60'
    end
    object cdsAltPrecoPERC_AD_90: TFloatField
      FieldName = 'PERC_AD_90'
    end
    object cdsAltPrecoMAX_DESC_ITEM: TFloatField
      FieldName = 'MAX_DESC_ITEM'
    end
    object cdsAltPrecoPERC_TB_ATAC: TFloatField
      FieldName = 'PERC_TB_ATAC'
    end
    object cdsAltPrecoPERC_TB_PRODA: TFloatField
      FieldName = 'PERC_TB_PRODA'
    end
    object cdsAltPrecoPERC_TB_PROD: TFloatField
      FieldName = 'PERC_TB_PROD'
    end
    object cdsAltPrecoPERC_TB_PROD3: TFloatField
      FieldName = 'PERC_TB_PROD3'
    end
    object cdsAltPrecoPERC_TB_PROD6: TFloatField
      FieldName = 'PERC_TB_PROD6'
    end
    object cdsAltPrecoPERC_TB_PROD9: TFloatField
      FieldName = 'PERC_TB_PROD9'
    end
    object cdsAltPrecoPERC_TB_VARE: TFloatField
      FieldName = 'PERC_TB_VARE'
    end
    object cdsAltPrecoVALOR_PROMOCAO: TFloatField
      FieldName = 'VALOR_PROMOCAO'
    end
    object cdsAltPrecoPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object cdsAltPrecoCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
    end
    object cdsAltPrecoCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsAltPrecoCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
    end
    object cdsAltPrecoCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object cdsAltPrecoMAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
    end
    object cdsAltPrecoLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
    end
    object cdsAltPrecoSETOR: TStringField
      FieldName = 'SETOR'
    end
    object cdsAltPrecoNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
    end
    object cdsAltPrecoDESCR_PROMOCAO: TStringField
      FieldName = 'DESCR_PROMOCAO'
    end
    object cdsAltPrecoTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsAltPrecoDESCR_TIPO: TStringField
      FieldName = 'DESCR_TIPO'
    end
  end
  object dsAltPreco: TDataSource
    DataSet = cdsAltPreco
    Left = 1232
    Top = 504
  end
  object vProdTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1024
    Top = 72
  end
  object vBarraTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1024
    Top = 120
  end
  object cdsEtiqueta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1168
    Top = 459
    object cdsEtiquetaGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsEtiquetaCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsEtiquetaDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsEtiquetaDESCRGRADE: TStringField
      DisplayLabel = 'Grade'
      FieldName = 'DESCRGRADE'
      Size = 32
    end
    object cdsEtiquetaDESCRGRADE1: TStringField
      FieldName = 'DESCRGRADE1'
      Size = 32
    end
    object cdsEtiquetaQTDE: TIntegerField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
    end
    object cdsEtiquetaAPLICACAO_PROD: TStringField
      DisplayLabel = 'Referencia'
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
    object cdsEtiquetaPREC_TAB_PROD: TCurrencyField
      DisplayLabel = 'Pre'#231'o Tabela'
      FieldName = 'PREC_TAB_PROD'
    end
    object cdsEtiquetaPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o P'#250'blico'
      FieldName = 'PREC_PUBLICO'
      currency = True
    end
    object cdsEtiquetaPREC_30_PROD: TCurrencyField
      DisplayLabel = 'Pre'#231'o a prazo'
      FieldName = 'PREC_30_PROD'
    end
    object cdsEtiquetaCODBARRA: TStringField
      DisplayLabel = 'Cod Barra'
      FieldName = 'CODBARRA'
    end
    object cdsEtiquetaCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsEtiquetaSEL: TStringField
      FieldName = 'SEL'
      Size = 1
    end
  end
  object qrGradEt2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPerfilProd
    SQL.Strings = (
      'select * from GRADE')
    Left = 1096
    Top = 238
  end
  object dspGradEt2: TDataSetProvider
    DataSet = qrGradEt2
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1096
    Top = 285
  end
  object cdsGradEt2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradEt2'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1096
    Top = 336
    object cdsGradEt2COD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'd Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradEt2COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGradEt2DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o 1'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsGradEt2DESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsGradEt2ATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsGradEt2QTDE: TIntegerField
      DisplayLabel = 'Qtde'
      FieldKind = fkInternalCalc
      FieldName = 'QTDE'
    end
  end
  object dsGradEt2: TDataSource
    DataSet = cdsGradEt2
    Left = 1096
    Top = 383
  end
  object dsEtiqueta: TDataSource
    DataSet = cdsEtiqueta
    Left = 1168
    Top = 506
  end
  object qrVisGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select p.cod_prod,p.grupo_prod,  g.cod_grade,g.descricao,g.descr' +
        'icao1,p.qtde from COD_GRADE_PROD as p,GRADE as g WHERE COD_PROD ' +
        '= -3')
    Left = 1159
    Top = 237
  end
  object dspVisGrade: TDataSetProvider
    DataSet = qrVisGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1159
    Top = 285
  end
  object cdsVisGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVisGrade'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1159
    Top = 335
    object cdsVisGradeCOD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'd. grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsVisGradeQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsVisGradeDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsVisGradeDESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsVisGradeCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsVisGradeGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
  end
  object dsVisGrade: TDataSource
    DataSet = cdsVisGrade
    Left = 1164
    Top = 381
  end
  object qrProdGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 1091
    Top = 166
  end
  object qrEstIniGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 1027
    Top = 14
  end
  object qrModEitTer: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from modeloetitermica et where et.cod_empresa=-1')
    Left = 1217
    Top = 237
  end
  object dspModEitTer: TDataSetProvider
    DataSet = qrModEitTer
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1217
    Top = 285
  end
  object cdsModEitTer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModEitTer'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1217
    Top = 335
    object cdsModEitTerCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Modelo'
      FieldName = 'CODIGO'
      Origin = '"MODELOETITERMICA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsModEitTerCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"MODELOETITERMICA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsModEitTerDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o Modelo'
      DisplayWidth = 32
      FieldName = 'DESCRICAO'
      Origin = '"MODELOETITERMICA"."DESCRICAO"'
      Size = 32
    end
    object cdsModEitTerLSCRIPT: TStringField
      DisplayLabel = 'Linguagem Script'
      FieldName = 'LSCRIPT'
      Origin = '"MODELOETITERMICA"."LSCRIPT"'
      Size = 6
    end
    object cdsModEitTerMODELOIMP: TStringField
      Tag = 2
      DisplayLabel = 'Modelo da Impressora'
      DisplayWidth = 32
      FieldName = 'MODELOIMP'
      Origin = '"MODELOETITERMICA"."MODELOIMP"'
      Size = 32
    end
    object cdsModEitTerCONFIGMODELOETI: TMemoField
      Tag = 2
      DisplayLabel = 'Config. Modelo Etiqueta'
      FieldName = 'CONFIGMODELOETI'
      Origin = '"MODELOETITERMICA"."CONFIGMODELOETI"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsModEitTerNUMCOLUNAS: TSmallintField
      DisplayLabel = 'Num. Colunas'
      FieldName = 'NUMCOLUNAS'
    end
    object cdsModEitTerATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsModEitTer: TDataSource
    DataSet = cdsModEitTer
    Left = 1222
    Top = 381
  end
  object qrItModEitT: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from itmodeloetitermica iet where iet.cod_empresa=-1')
    Left = 1365
    Top = 458
  end
  object dspItModEitT: TDataSetProvider
    DataSet = qrItModEitT
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1365
    Top = 506
  end
  object cdsItModEitT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItModEitT'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1365
    Top = 556
    object cdsItModEitTCODIGO: TIntegerField
      DisplayLabel = 'Cod Modelo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsItModEitTCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItModEitTNITEM: TIntegerField
      DisplayLabel = 'Num. Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItModEitTINDICECOLUNA: TSmallintField
      DisplayLabel = 'Coluna'
      FieldName = 'INDICECOLUNA'
    end
    object cdsItModEitTPARAMETROS_IMP: TStringField
      DisplayLabel = 'Par'#226'metros Impress'#227'o'
      FieldName = 'PARAMETROS_IMP'
      Required = True
      Size = 100
    end
    object cdsItModEitTTIPOTEXTOIMPRESSO: TStringField
      DisplayLabel = 'Tipo Texto Impresso'
      FieldName = 'TIPOTEXTOIMPRESSO'
      Size = 16
    end
    object cdsItModEitTTEXTO: TStringField
      DisplayLabel = 'Texto Impresso'
      FieldName = 'TEXTO'
      Size = 64
    end
    object cdsItModEitTNUMCARACTERES: TSmallintField
      DisplayLabel = 'Num. Caracteres'
      FieldName = 'NUMCARACTERES'
    end
    object cdsItModEitTCAMPOCURRENCY: TStringField
      DisplayLabel = 'Valor Monet'#225'rio'
      FieldName = 'CAMPOCURRENCY'
      FixedChar = True
      Size = 1
    end
    object cdsItModEitTCAMPOIMAGEM: TBlobField
      DisplayLabel = 'Imagem do Campo'
      FieldName = 'CAMPOIMAGEM'
      Size = 8
    end
    object cdsItModEitTATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsItModEitTMASCARARPRECO: TStringField
      FieldName = 'MASCARARPRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsItModEitT: TDataSource
    DataSet = cdsItModEitT
    Left = 1364
    Top = 602
  end
  object qrBModEitTer: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from modeloetitermica et where et.cod_empresa=-1')
    Left = 1137
    Top = 189
  end
  object cdsEtiquetaTer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1192
    Top = 555
  end
  object dsEtiquetaTer: TDataSource
    DataSet = cdsEtiquetaTer
    Left = 1192
    Top = 610
  end
  object qrRecProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRecProd
    SQL.Strings = (
      'select * from REC_ASS')
    Left = 23
    Top = 673
  end
  object dspRecProd: TDataSetProvider
    DataSet = qrRecProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 23
    Top = 724
  end
  object cdsRecProd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRecProd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 23
    Top = 775
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_RECEITA'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Descri'#231#227'o da Receita'
      FieldName = 'DESCRICAO'
      Size = 999
    end
    object cdsRecProdTITULO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 30
    end
    object cdsRecProdPROCESSO_PRODUCAO: TMemoField
      DisplayLabel = 'Receita'
      FieldName = 'PROCESSO_PRODUCAO'
      OnGetText = cdsRecProdPROCESSO_PRODUCAOGetText
      BlobType = ftMemo
      Size = 100
    end
    object cdsRecProdDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsRecProdTIPO_UTIL: TStringField
      FieldName = 'TIPO_UTIL'
      FixedChar = True
      Size = 1
    end
    object cdsRecProdCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object cdsRecProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsRecProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
  end
  object dsRecProd: TDataSource
    AutoEdit = False
    DataSet = cdsRecProd
    Left = 23
    Top = 827
  end
  object IBTransIndiceTec: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 104
    Top = 672
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 104
    Top = 720
  end
  object dspIndiceTec: TDataSetProvider
    DataSet = qrIndiceTec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 408
    Top = 760
  end
  object qrIndiceTec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select it.*, pp.descr_prod'
      'from INDICE_TECNICO IT'
      
        'inner join produtos pp on pp.grupo_prod = it.grupo_prod_mprima a' +
        'nd'
      
        'pp.cod_prod = it.cod_prod_mprima and pp.cod_empresa = it.cod_emp' +
        'resa where pp.cod_prod = -3')
    Left = 200
    Top = 680
    object qrIndiceTecGRUPO_PROD_ACABADO: TIntegerField
      FieldName = 'GRUPO_PROD_ACABADO'
      Origin = '"INDICE_TECNICO"."GRUPO_PROD_ACABADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndiceTecCOD_PROD_ACABADO: TIBStringField
      FieldName = 'COD_PROD_ACABADO'
      Origin = '"INDICE_TECNICO"."COD_PROD_ACABADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrIndiceTecGRUPO_PROD_MPRIMA: TIntegerField
      FieldName = 'GRUPO_PROD_MPRIMA'
      Origin = '"INDICE_TECNICO"."GRUPO_PROD_MPRIMA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndiceTecCOD_PROD_MPRIMA: TIBStringField
      FieldName = 'COD_PROD_MPRIMA'
      Origin = '"INDICE_TECNICO"."COD_PROD_MPRIMA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrIndiceTecCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"INDICE_TECNICO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndiceTecQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"INDICE_TECNICO"."QUANT"'
    end
    object qrIndiceTecDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      ProviderFlags = []
      FixedChar = True
      Size = 75
    end
    object qrIndiceTecNUM_FAB_MPRIMA: TIBStringField
      FieldName = 'NUM_FAB_MPRIMA'
      Origin = '"INDICE_TECNICO"."NUM_FAB_MPRIMA"'
      FixedChar = True
    end
  end
  object dsIndiceTec: TDataSource
    DataSet = cdsIndiceTec
    Left = 200
    Top = 824
  end
  object cdsIndiceTec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIndiceTec'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 200
    Top = 776
    object cdsIndiceTecSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsIndiceTecGRUPO_PROD_ACABADO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD_ACABADO'
      Required = True
    end
    object cdsIndiceTecCOD_PROD_ACABADO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD_ACABADO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsIndiceTecGRUPO_PROD_MPRIMA: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD_MPRIMA'
      Required = True
    end
    object cdsIndiceTecCOD_PROD_MPRIMA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD_MPRIMA'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsIndiceTecDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 75
    end
    object cdsIndiceTecQUANT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT'
      DisplayFormat = '##0.0000'
    end
    object cdsIndiceTecCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsIndiceTecNUM_FAB_MPRIMA: TStringField
      FieldName = 'NUM_FAB_MPRIMA'
      FixedChar = True
    end
  end
  object qrProduto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select * from PRODUTOS')
    Left = 280
    Top = 680
  end
  object dspProduto: TDataSetProvider
    DataSet = qrProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 280
    Top = 728
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    BeforeInsert = CdsProdutosBeforeOpen
    Left = 280
    Top = 776
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 280
    Top = 825
  end
  object qrBuscas02: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 104
    Top = 776
  end
  object TransRecProd: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 185
    Top = 5
  end
  object rdpIndice: TRDprint
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
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 132
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 128
    Top = 16
  end
  object qrIndiceRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select cod_prod,grupo_prod,UNIDADE,num_fab_prod, est_f, descr_pr' +
        'od from produtos where tipo_item = '#39'04'#39)
    Left = 1128
    Top = 32
  end
  object qrIndicesDetalhesRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select it.*, p.descr_prod,p.unidade,p.est_f,p.locacao_prod,p.loc' +
        'acao_prod_1, p.prec_cus_prod, p.prec_cusm_prod,'
      '(100/it.quant) as perc'
      'from indice_tecnico it, produtos p where'
      'p.cod_empresa = it.cod_empresa and'
      'p.cod_prod = it.cod_prod_mprima'
      'and  p.grupo_prod=it.grupo_prod_mprima and'
      'it.cod_prod_acabado = :cod_prod and'
      'it.grupo_prod_acabado =:grupo_prod')
    Left = 1130
    Top = 80
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
      end>
    object qrIndicesDetalhesRelGRUPO_PROD_ACABADO: TIntegerField
      FieldName = 'GRUPO_PROD_ACABADO'
      Origin = '"INDICE_TECNICO"."GRUPO_PROD_ACABADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndicesDetalhesRelCOD_PROD_ACABADO: TIBStringField
      FieldName = 'COD_PROD_ACABADO'
      Origin = '"INDICE_TECNICO"."COD_PROD_ACABADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrIndicesDetalhesRelGRUPO_PROD_MPRIMA: TIntegerField
      FieldName = 'GRUPO_PROD_MPRIMA'
      Origin = '"INDICE_TECNICO"."GRUPO_PROD_MPRIMA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndicesDetalhesRelCOD_PROD_MPRIMA: TIBStringField
      FieldName = 'COD_PROD_MPRIMA'
      Origin = '"INDICE_TECNICO"."COD_PROD_MPRIMA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrIndicesDetalhesRelQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"INDICE_TECNICO"."QUANT"'
      DisplayFormat = '##,###,##0.00'
    end
    object qrIndicesDetalhesRelCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"INDICE_TECNICO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndicesDetalhesRelNUM_FAB_MPRIMA: TIBStringField
      FieldName = 'NUM_FAB_MPRIMA'
      Origin = '"INDICE_TECNICO"."NUM_FAB_MPRIMA"'
      FixedChar = True
    end
    object qrIndicesDetalhesRelDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      FixedChar = True
      Size = 75
    end
    object qrIndicesDetalhesRelUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = '"PRODUTOS"."UNIDADE"'
      Size = 3
    end
    object qrIndicesDetalhesRelEST_F: TFloatField
      FieldName = 'EST_F'
      Origin = '"PRODUTOS"."EST_F"'
      DisplayFormat = '##,###,##0.00'
    end
    object qrIndicesDetalhesRelPERC: TFloatField
      FieldName = 'PERC'
      ProviderFlags = []
      DisplayFormat = '##,###,##0.00'
    end
    object qrIndicesDetalhesRelLOCACAO_PROD: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrIndicesDetalhesRelLOCACAO_PROD_1: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object qrIndicesDetalhesRelPREC_CUS_PROD: TFloatField
      FieldName = 'PREC_CUS_PROD'
      Origin = '"PRODUTOS"."PREC_CUS_PROD"'
      DisplayFormat = '#,##0.000'
    end
    object qrIndicesDetalhesRelPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
      Origin = '"PRODUTOS"."PREC_CUSM_PROD"'
      DisplayFormat = '#,##0.000'
    end
  end
  object qrIndiceRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select ra.PROCESSO_PRODUCAO  from produtos as p,rec_ass as ra wh' +
        'ere p.cod_recprod = ra.COD_RECEITA and '
      
        'p.cod_empresa = ra.cod_empresa and p.cod_prod=:cod_prod and p.gr' +
        'upo_prod=:grupo_prod')
    Left = 1136
    Top = 128
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
      end>
  end
  object qrIndReqOs: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select coalesce(sum(ipv.quant_ped_item),0) as qt from pedvenda p' +
        'v inner join pedvenda_prod ipv on ipv.nped = pv.nped')
    Left = 1194
    Top = 24
  end
  object cdsProdNFTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1508
    Top = 216
    object cdsProdNFTempNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
      Required = True
    end
    object cdsProdNFTempQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '##,###,##0.00'
    end
    object cdsProdNFTempDATA_VALIDADE: TDateTimeField
      FieldName = 'DATA_VALIDADE'
    end
    object cdsProdNFTempREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 3
    end
    object cdsProdNFTempNUM_FAB_FORNECEDOR: TStringField
      FieldName = 'NUM_FAB_FORNECEDOR'
    end
    object cdsProdNFTempNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsProdNFTempRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsProdNFTempCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsProdNFTempGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
  end
  object qrProdNFEnt: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select nf.num_nf, nfi.cod_prod,nfi.grupo_prod,nfi.quantidade,nfi' +
        '.data_validade,nfi.referencia,nfi.num_fab_fornecedor,cli.nome_cl' +
        'iente,cli.razao from notafiscal_item nfi inner join notafiscal n' +
        'f  on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empres' +
        'a inner join clientes cli on cli.cod_cliente = nf.cod_cliente  w' +
        'here tipo_item = '#39'P'#39' and NATUREZA_NF = '#39'E'#39' and nfi.cod_prod=:cod' +
        '_prod and nfi.grupo_prod =:grupo_prod')
    Left = 1218
    Top = 96
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
      end>
  end
  object cdsProdVal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DATAVALIDADE'
    Params = <>
    Left = 1508
    Top = 272
    object cdsProdValGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdValCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdValCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdValEST_F: TFloatField
      FieldName = 'EST_F'
    end
    object cdsProdValDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
    end
    object cdsProdValDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdValNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdValUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProdValLOCACAO_PROD: TStringField
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsProdValLOCACAO_PROD_1: TStringField
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
  end
  object spIcoCodRecProd: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = TransRecProd
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 63
    Top = 87
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VTABELA'
        ParamType = ptInput
      end>
  end
  object dsBusca1: TDataSource
    AutoEdit = False
    Left = 392
    Top = 681
  end
  object dsBusca2: TDataSource
    AutoEdit = False
    Left = 392
    Top = 729
  end
  object qrPromocaoP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPromocao
    SQL.Strings = (
      ' select p.*, t.descr_tipo, t.tipo from promocao p '
      'inner join tipo_preco t'
      
        'on t.cod_tppreco = p.cod_tppreco and t.cod_empresa = p.cod_empre' +
        'sa')
    Left = 1289
    Top = 237
  end
  object dspPromocaoP: TDataSetProvider
    DataSet = qrPromocaoP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1289
    Top = 285
  end
  object cdsPromocaoP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPromocaoP'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1289
    Top = 335
    object cdsPromocaoPSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsPromocaoPCOD_PROMOCAO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsPromocaoPORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
    end
    object cdsPromocaoPCOD_TPPRECO: TIntegerField
      DisplayLabel = 'Cod Tipo'
      FieldName = 'COD_TPPRECO'
      Required = True
    end
    object cdsPromocaoPCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPromocaoPDESCR_PROMOCAO: TStringField
      DisplayLabel = 'Promocao'
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object cdsPromocaoPATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPromocaoPDATA_INI: TDateTimeField
      DisplayLabel = 'Data Ini'
      FieldName = 'DATA_INI'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPromocaoPHORA_INI: TStringField
      DisplayLabel = 'Hora Ini'
      FieldName = 'HORA_INI'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsPromocaoPDATA_FIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      FieldName = 'DATA_FIM'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPromocaoPHORA_FIM: TStringField
      DisplayLabel = 'Hora Fim'
      FieldName = 'HORA_FIM'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsPromocaoPDESCR_TIPO: TStringField
      Tag = 1
      DisplayLabel = 'Descricao Tipo'
      FieldName = 'DESCR_TIPO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsPromocaoPTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsPromocaoPUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      FixedChar = True
      Size = 1
    end
    object cdsPromocaoPRECALC_PRECO: TStringField
      DisplayLabel = 'Recalcular pre'#231'o'
      FieldName = 'RECALC_PRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsPromocaoP: TDataSource
    DataSet = cdsPromocaoP
    Left = 1289
    Top = 381
  end
  object qrTipoPreco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select t.* from tipo_preco as t')
    Left = 1430
    Top = 245
  end
  object dspTipoPreco: TDataSetProvider
    DataSet = qrTipoPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1431
    Top = 293
  end
  object cdsTipoPrecoP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoPreco'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1439
    Top = 335
    object cdsTipoPrecoPCOD_TPPRECO: TIntegerField
      Tag = 2
      FieldName = 'COD_TPPRECO'
      Required = True
    end
    object cdsTipoPrecoPCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTipoPrecoPTIPO: TStringField
      Tag = 2
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoPrecoPDESCR_TIPO: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'DESCR_TIPO'
    end
    object cdsTipoPrecoPUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      FixedChar = True
      Size = 1
    end
    object cdsTipoPrecoPRECALC_PRECO: TStringField
      DisplayLabel = 'Recalcular pre'#231'o'
      FieldName = 'RECALC_PRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoPrecoP: TDataSource
    DataSet = cdsTipoPrecoP
    Left = 1439
    Top = 381
  end
  object IBTransPromocao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 817
    Top = 173
  end
  object SpIncCodPromocao: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPromocao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 80
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VTABELA'
        ParamType = ptInput
      end>
  end
  object qrBuscas03: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPromocao
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 104
    Top = 832
  end
  object cdsTipoPrecoT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoPreco'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1519
    Top = 335
    object cdsTipoPrecoTCOD_TPPRECO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TPPRECO'
      Required = True
    end
    object cdsTipoPrecoTCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTipoPrecoTTIPO: TStringField
      Tag = 2
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoPrecoTDESCR_TIPO: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'DESCR_TIPO'
    end
    object cdsTipoPrecoTUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
    object cdsTipoPrecoTRECALC_PRECO: TStringField
      DisplayLabel = 'Recalcular pre'#231'o'
      FieldName = 'RECALC_PRECO'
      Size = 1
    end
  end
  object dsTipoPrecoT: TDataSource
    DataSet = cdsTipoPrecoT
    Left = 1519
    Top = 381
  end
  object dsRegiao: TDataSource
    DataSet = cdsRegiao
    Left = 1738
    Top = 382
  end
  object cdsRegiao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegiao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1738
    Top = 336
    object cdsRegiaoSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsRegiaoTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsRegiaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsRegiaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 64
    end
  end
  object dspRegiao: TDataSetProvider
    DataSet = qrRegiao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1738
    Top = 286
  end
  object qrRegiao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    Left = 1738
    Top = 238
  end
  object SpIncCodPromocaoProduto: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPromocaoProduto
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 152
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VTABELA'
        ParamType = ptInput
      end>
  end
  object IBTransPromocaoProduto: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 897
    Top = 213
  end
  object cdsPromocaoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsPromocaoProdutoBeforeOpen
    Left = 1606
    Top = 286
    object cdsPromocaoProdutoCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
    end
    object cdsPromocaoProdutoDESCR_TIPO: TStringField
      FieldName = 'DESCR_TIPO'
      Size = 64
    end
    object cdsPromocaoProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsPromocaoProdutoVALOR_PROMOCAO: TFloatField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_PROMOCAO'
      DisplayFormat = '##0.00'
    end
    object cdsPromocaoProdutoCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsPromocaoProdutoCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
    end
    object cdsPromocaoProdutoCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object cdsPromocaoProdutoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsPromocaoProdutoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsPromocaoProdutoCOD_TPPRECO: TIntegerField
      FieldName = 'COD_TPPRECO'
    end
    object cdsPromocaoProdutoDESCR_PROMOCAO: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object cdsPromocaoProdutoPORCENTAGEM: TFloatField
      DisplayLabel = 'Perc (%)'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '##0.00%'
    end
    object cdsPromocaoProdutoDATA_INI: TDateTimeField
      FieldName = 'DATA_INI'
      EditMask = '!99/99/0000 99:99;1;_'
    end
    object cdsPromocaoProdutoHORA_INI: TStringField
      FieldName = 'HORA_INI'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsPromocaoProdutoDATA_FIM: TDateTimeField
      FieldName = 'DATA_FIM'
      EditMask = '!99/99/0000 99:99;1;_'
    end
    object cdsPromocaoProdutoHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsPromocaoProdutoPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPromocaoProdutoPREC_PUBLICO: TDateField
      FieldName = 'PREC_PUBLICO'
      DisplayFormat = '##0.00'
    end
    object cdsPromocaoProdutoNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsPromocaoProdutoDESCR_PROD: TStringField
      DisplayWidth = 75
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsPromocaoProdutoSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 1
    end
    object cdsPromocaoProdutoMAX_DESC: TFloatField
      DisplayLabel = 'Max Desc (%)'
      FieldName = 'MAX_DESC'
      DisplayFormat = '##0.00%'
    end
    object cdsPromocaoProdutoTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsPromocaoProdutoVALOR_PROMOCAO_TEMP: TFloatField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_PROMOCAO_TEMP'
      DisplayFormat = '##0.00'
    end
    object cdsPromocaoProdutoPORCENTAGEM_TEMP: TFloatField
      DisplayLabel = 'Perc (%)'
      FieldName = 'PORCENTAGEM_TEMP'
      DisplayFormat = '##0.00%'
    end
    object cdsPromocaoProdutoPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsPromocaoProdutoMARKUP: TFloatField
      DisplayLabel = 'Markup'
      FieldName = 'MARKUP'
    end
    object cdsPromocaoProdutoMARGEM: TFloatField
      DisplayLabel = 'Margem'
      FieldName = 'MARGEM'
    end
    object cdsPromocaoProdutoUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
    end
    object cdsPromocaoProdutoSEL: TStringField
      DisplayLabel = 'Sel'
      FieldName = 'SEL'
      Size = 1
    end
  end
  object dsPromocaoProduto: TDataSource
    DataSet = cdsPromocaoProduto
    Left = 1606
    Top = 334
  end
  object qrPromocaoProduto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPromocaoProduto
    Left = 1606
    Top = 238
  end
  object cdsPromocaoP1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPromocaoP'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1291
    Top = 143
    object IntegerField2: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'COD_TPPRECO'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object IntegerField5: TIntegerField
      FieldName = 'ORDEM'
    end
    object IntegerField6: TIntegerField
      FieldName = 'ATIVO'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATA_INI'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField3: TStringField
      FieldName = 'HORA_INI'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATA_FIM'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField4: TStringField
      FieldName = 'HORA_FIM'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsPromocaoP1DESCR_TIPO: TStringField
      Tag = 1
      FieldName = 'DESCR_TIPO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsPromocaoP1TIPO: TStringField
      Tag = 1
      FieldName = 'TIPO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 0
    end
    object cdsPromocaoP1RECALC_PRECO: TStringField
      DisplayLabel = 'Recalcular pre'#231'o'
      FieldName = 'RECALC_PRECO'
      Size = 1
    end
  end
  object dsPromocaoP1: TDataSource
    DataSet = cdsPromocaoP1
    Left = 1291
    Top = 189
  end
  object cdsPromocaoProduto1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsPromocaoProduto1BeforeOpen
    Left = 1664
    Top = 286
    object IntegerField7: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROMOCAO'
    end
    object StringField5: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DESCR_TIPO'
      Size = 64
    end
    object StringField6: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_PROMOCAO'
      DisplayFormat = '##0.00'
    end
    object IntegerField8: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
    object IntegerField9: TIntegerField
      FieldName = 'COD_SETOR'
    end
    object IntegerField10: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object IntegerField11: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object StringField7: TStringField
      FieldName = 'COD_PROD'
      Size = 6
    end
    object IntegerField12: TIntegerField
      FieldName = 'COD_TPPRECO'
    end
    object StringField8: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Desc(%)'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '##0.00%'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Ini'
      FieldName = 'DATA_INI'
      EditMask = '!99/99/0000 99:99;1;_'
    end
    object StringField9: TStringField
      DisplayLabel = 'Hora Fim'
      FieldName = 'HORA_INI'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data Fim'
      FieldName = 'DATA_FIM'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField10: TStringField
      DisplayLabel = 'Hora fim'
      FieldName = 'HORA_FIM'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsPromocaoProduto1PREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPromocaoProduto1PREC_PUBLICO: TFloatField
      FieldName = 'PREC_PUBLICO'
      DisplayFormat = '##0.00'
    end
    object cdsPromocaoProduto1NUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsPromocaoProduto1DESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsPromocaoProduto1SIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 1
    end
    object cdsPromocaoProduto1MAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
      DisplayFormat = '##0.00%'
    end
    object cdsPromocaoProduto1TIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsPromocaoProduto1VALOR_PROMOCAO_TEMP: TFloatField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_PROMOCAO_TEMP'
      DisplayFormat = '##0.00'
    end
    object cdsPromocaoProduto1PORCENTAGEM_TEMP: TFloatField
      DisplayLabel = 'Perc (%)'
      FieldName = 'PORCENTAGEM_TEMP'
      DisplayFormat = '##0.00%'
    end
    object cdsPromocaoProduto1PREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsPromocaoProduto1MARKUP: TFloatField
      DisplayLabel = 'Markup'
      FieldName = 'MARKUP'
    end
    object cdsPromocaoProduto1MARGEM: TFloatField
      DisplayLabel = 'Margem'
      FieldName = 'MARGEM'
    end
    object cdsPromocaoProduto1USAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
    end
    object cdsPromocaoProduto1SEL: TStringField
      DisplayLabel = 'Sel'
      FieldName = 'SEL'
      Size = 1
    end
  end
  object dsPromocaoProduto1: TDataSource
    DataSet = cdsPromocaoProduto1
    Left = 1670
    Top = 334
  end
  object qrTipoVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        ' select t.cod_tipo, t.sigla,t.descricao from tipo_vendas t  wher' +
        'e t.tipo ='#39'REQ'#39)
    Left = 1798
    Top = 229
  end
  object dspTipoVenda: TDataSetProvider
    DataSet = qrTipoVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1799
    Top = 277
  end
  object cdsTipoVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoVenda'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1799
    Top = 332
    object cdsTipoVendaSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendaCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Required = True
    end
    object cdsTipoVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
  object dsTipoVenda: TDataSource
    DataSet = cdsTipoVenda
    Left = 1799
    Top = 381
  end
  object qrMecanico: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    Left = 1430
    Top = 461
  end
  object dsServMecanico: TDataSource
    DataSet = cdsServMecanico
    Left = 1882
    Top = 382
  end
  object cdsServMecanico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServMecanico'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1882
    Top = 328
    object cdsServMecanicoCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsServMecanicoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsServMecanicoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsServMecanicoUSUARIO_AUTORIZOU: TStringField
      FieldName = 'USUARIO_AUTORIZOU'
      FixedChar = True
      Size = 10
    end
    object cdsServMecanicoDATA_EXECAO: TDateTimeField
      FieldName = 'DATA_EXECAO'
    end
  end
  object dspServMecanico: TDataSetProvider
    DataSet = qrServMecanico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1882
    Top = 278
  end
  object qrServMecanico: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from TIPO_SERVICO_MECANICO')
    Left = 1882
    Top = 230
  end
  object qrUsuario: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    Left = 616
    Top = 712
    object qrUsuarioCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"COLABORADOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrUsuarioNOME_VENDEDOR: TIBStringField
      DisplayLabel = 'Nome do Usu'#225'rio'
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsUsuario: TDataSource
    DataSet = qrUsuario
    Left = 616
    Top = 768
  end
  object qrMecanicoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select tm.*, col.nome_vendedor from TIPO_SERVICO_MECANICO tm'
      
        'inner join colaborador col on col.cod_vendedor = tm.cod_vendedor' +
        ' and col.cod_empresa = tm.cod_empresa'
      'where tm.COD_SERVICO = 0 AND tm.COD_EMPRESA = 0'
      'order by col.nome_vendedor'
      '')
    Left = 688
    Top = 712
    object qrMecanicoServCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Origin = '"TIPO_SERVICO_MECANICO"."COD_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMecanicoServCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"TIPO_SERVICO_MECANICO"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMecanicoServCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"TIPO_SERVICO_MECANICO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMecanicoServUSUARIO_AUTORIZOU: TIBStringField
      FieldName = 'USUARIO_AUTORIZOU'
      Origin = '"TIPO_SERVICO_MECANICO"."USUARIO_AUTORIZOU"'
      FixedChar = True
      Size = 10
    end
    object qrMecanicoServDATA_EXECAO: TDateTimeField
      FieldName = 'DATA_EXECAO'
      Origin = '"TIPO_SERVICO_MECANICO"."DATA_EXECAO"'
    end
    object qrMecanicoServNOME_VENDEDOR: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsMecanicoServ: TDataSource
    DataSet = qrMecanicoServ
    Left = 688
    Top = 768
  end
  object dsProdutosConversao: TDataSource
    DataSet = cdsProdutosConversao
    Left = 2049
    Top = 382
  end
  object cdsProdutosConversao: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProdutosConversao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2049
    Top = 336
    object cdsProdutosConversaoGRUPO_PROD: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosConversaoCOD_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      Size = 6
    end
    object cdsProdutosConversaoCODIGO_EAN: TStringField
      Tag = 2
      DisplayLabel = 'Cod EAN'
      FieldName = 'CODIGO_EAN'
      Required = True
    end
    object cdsProdutosConversaoUNIDADE: TStringField
      Tag = 2
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Required = True
      Size = 3
    end
    object cdsProdutosConversaoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosConversaoQUANTIDADE: TFloatField
      Tag = 2
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
  end
  object dspProdutosConversao: TDataSetProvider
    DataSet = qrProdutosConversao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2049
    Top = 286
  end
  object qrProdutosConversao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from PRODUTOS_CONVERSAO')
    Left = 2049
    Top = 238
  end
  object IBTranDesmembramento: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 1009
    Top = 213
  end
  object dspIndiceTecProd: TDataSetProvider
    DataSet = qrIndiceTecProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 480
    Top = 728
  end
  object qrIndiceTecProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select it.*, pp.descr_prod'
      'from INDICE_TECNICO IT'
      
        'inner join produtos pp on pp.grupo_prod = it.grupo_prod_mprima a' +
        'nd'
      
        'pp.cod_prod = it.cod_prod_mprima and pp.cod_empresa = it.cod_emp' +
        'resa where pp.cod_prod = -3')
    Left = 480
    Top = 680
    object qrIndiceTecProdGRUPO_PROD_ACABADO: TIntegerField
      FieldName = 'GRUPO_PROD_ACABADO'
      Origin = '"INDICE_TECNICO"."GRUPO_PROD_ACABADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndiceTecProdCOD_PROD_ACABADO: TIBStringField
      FieldName = 'COD_PROD_ACABADO'
      Origin = '"INDICE_TECNICO"."COD_PROD_ACABADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrIndiceTecProdGRUPO_PROD_MPRIMA: TIntegerField
      FieldName = 'GRUPO_PROD_MPRIMA'
      Origin = '"INDICE_TECNICO"."GRUPO_PROD_MPRIMA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndiceTecProdCOD_PROD_MPRIMA: TIBStringField
      FieldName = 'COD_PROD_MPRIMA'
      Origin = '"INDICE_TECNICO"."COD_PROD_MPRIMA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrIndiceTecProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"INDICE_TECNICO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrIndiceTecProdQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"INDICE_TECNICO"."QUANT"'
    end
    object qrIndiceTecProdDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      ProviderFlags = []
      FixedChar = True
      Size = 75
    end
    object qrIndiceTecProdNUM_FAB_MPRIMA: TIBStringField
      FieldName = 'NUM_FAB_MPRIMA'
      Origin = '"INDICE_TECNICO"."NUM_FAB_MPRIMA"'
      FixedChar = True
    end
  end
  object dsIndiceTecProd: TDataSource
    DataSet = cdsIndiceTecProd
    Left = 480
    Top = 824
  end
  object cdsIndiceTecProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIndiceTecProd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 480
    Top = 776
    object cdsIndiceTecProdSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsIndiceTecProdGRUPO_PROD_ACABADO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD_ACABADO'
      Required = True
    end
    object cdsIndiceTecProdCOD_PROD_ACABADO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD_ACABADO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsIndiceTecProdGRUPO_PROD_MPRIMA: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD_MPRIMA'
      Required = True
    end
    object cdsIndiceTecProdCOD_PROD_MPRIMA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD_MPRIMA'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsIndiceTecProdDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 75
    end
    object cdsIndiceTecProdQUANT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT'
      DisplayFormat = '##0.0000'
    end
    object cdsIndiceTecProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsIndiceTecProdNUM_FAB_MPRIMA: TStringField
      DisplayLabel = 'Numero Fabricante'
      FieldName = 'NUM_FAB_MPRIMA'
      FixedChar = True
    end
  end
  object dspProdutosDesmembramento: TDataSetProvider
    DataSet = qrProdutosDesmembramento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2336
    Top = 288
  end
  object qrProdutosDesmembramento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select d.*, pp.descr_prod'
      ' from PRODUTOS_DESMEMBRAMENTO d'
      
        'inner join produtos pp on pp.grupo_prod = d.grupo_prod_mprima an' +
        'd'
      
        'pp.cod_prod = d.cod_prod_mprima and pp.cod_empresa = d.cod_empre' +
        'sa'
      'where d.grupo_prod_acabado = 0 and d.cod_prod_acabado = '#39#39' and'
      'd.grupo_prod_mprima = 0 and d.cod_prod_mprima = '#39#39)
    Left = 2336
    Top = 240
    object qrProdutosDesmembramentoGRUPO_PROD_ACABADO: TIntegerField
      FieldName = 'GRUPO_PROD_ACABADO'
      Origin = '"PRODUTOS_DESMEMBRAMENTO"."GRUPO_PROD_ACABADO"'
      Required = True
    end
    object qrProdutosDesmembramentoCOD_PROD_ACABADO: TIBStringField
      FieldName = 'COD_PROD_ACABADO'
      Origin = '"PRODUTOS_DESMEMBRAMENTO"."COD_PROD_ACABADO"'
      Required = True
      Size = 6
    end
    object qrProdutosDesmembramentoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PRODUTOS_DESMEMBRAMENTO"."COD_EMPRESA"'
      Required = True
    end
    object qrProdutosDesmembramentoGRUPO_PROD_MPRIMA: TIntegerField
      FieldName = 'GRUPO_PROD_MPRIMA'
      Origin = '"PRODUTOS_DESMEMBRAMENTO"."GRUPO_PROD_MPRIMA"'
      Required = True
    end
    object qrProdutosDesmembramentoCOD_PROD_MPRIMA: TIBStringField
      FieldName = 'COD_PROD_MPRIMA'
      Origin = '"PRODUTOS_DESMEMBRAMENTO"."COD_PROD_MPRIMA"'
      Required = True
      Size = 6
    end
    object qrProdutosDesmembramentoQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"PRODUTOS_DESMEMBRAMENTO"."QUANT"'
    end
    object qrProdutosDesmembramentoDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      ProviderFlags = []
      FixedChar = True
      Size = 75
    end
  end
  object dsProdutosDesmembramento: TDataSource
    DataSet = cdsProdutosDesmembramento
    Left = 2336
    Top = 384
  end
  object cdsProdutosDesmembramento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosDesmembramento'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2336
    Top = 336
    object cdsProdutosDesmembramentoGRUPO_PROD_ACABADO: TIntegerField
      FieldName = 'GRUPO_PROD_ACABADO'
      Required = True
    end
    object cdsProdutosDesmembramentoCOD_PROD_ACABADO: TStringField
      FieldName = 'COD_PROD_ACABADO'
      Required = True
      Size = 6
    end
    object cdsProdutosDesmembramentoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosDesmembramentoGRUPO_PROD_MPRIMA: TIntegerField
      FieldName = 'GRUPO_PROD_MPRIMA'
      Required = True
    end
    object cdsProdutosDesmembramentoCOD_PROD_MPRIMA: TStringField
      FieldName = 'COD_PROD_MPRIMA'
      Required = True
      Size = 6
    end
    object cdsProdutosDesmembramentoQUANT: TFloatField
      FieldName = 'QUANT'
    end
    object cdsProdutosDesmembramentoDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 75
    end
  end
  object qrBox: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    Left = 760
    Top = 712
  end
  object dsBox: TDataSource
    DataSet = qrBox
    Left = 760
    Top = 768
  end
  object qrBoxServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select tb.*, b.descr_box from TIPO_SERVICO_BOX tb'
      
        'inner join box b on b.cod_box = tb.cod_box and b.cod_empresa = t' +
        'b.cod_empresa'
      'where tb.cod_box = 0 AND tb.COD_EMPRESA = 0'
      'order by b.cod_box')
    Left = 832
    Top = 712
    object qrBoxServCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Origin = '"TIPO_SERVICO_BOX"."COD_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBoxServCOD_BOX: TIntegerField
      FieldName = 'COD_BOX'
      Origin = '"TIPO_SERVICO_BOX"."COD_BOX"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBoxServCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"TIPO_SERVICO_BOX"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBoxServUSUARIO_AUTORIZOU: TIBStringField
      FieldName = 'USUARIO_AUTORIZOU'
      Origin = '"TIPO_SERVICO_BOX"."USUARIO_AUTORIZOU"'
      FixedChar = True
      Size = 10
    end
    object qrBoxServDATA_EXECAO: TDateTimeField
      FieldName = 'DATA_EXECAO'
      Origin = '"TIPO_SERVICO_BOX"."DATA_EXECAO"'
    end
    object qrBoxServDESCR_BOX: TIBStringField
      FieldName = 'DESCR_BOX'
      Origin = '"BOX"."DESCR_BOX"'
      Size = 30
    end
  end
  object dsBoxServ: TDataSource
    DataSet = qrBoxServ
    Left = 832
    Top = 768
  end
  object qrServBox: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from TIPO_SERVICO_BOX')
    Left = 1952
    Top = 232
  end
  object dsServBox: TDataSource
    DataSet = cdsServBox
    Left = 1952
    Top = 384
  end
  object cdsServBox: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServBox'
    Left = 1952
    Top = 328
  end
  object dspServBox: TDataSetProvider
    DataSet = qrServBox
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1952
    Top = 280
  end
  object qrProdutosRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'SELECT 0 ORDEM, PRODUTOS.num_fab_prod, NULL TIPO, PRODUTOS.*, NU' +
        'LL TP, 0 COD_PROMOCAO,    NULL DESCR_TIPO, NULL VALOR_PROMOCAO, ' +
        'NULL PORCENTAGEM,'
      
        'NULL MAX_DESC,  NULL QUANT, NULL VALOR_VENDA,  GRUPOS.DESCRICAO,' +
        ' SUB_GRUPO.DESCRICAO DESCSUB FROM PRODUTOS'
      
        'LEFT JOIN GRUPOS ON PRODUTOS.GRUPO_PROD = GRUPOS.CODIGO_GRUP  LE' +
        'FT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = COALESCE(PRODUTOS.' +
        'SUB_G_PROD,0)'
      
        'LEFT JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PRO' +
        'D AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_E' +
        'MPRESA = PRODUTOS.COD_EMPRESA'
      
        'WHERE  PRODUTOS.DESCR_PROD LIKE '#39'OLEO TESTE%'#39' AND PRODUTOS.COD_E' +
        'MPRESA = 1 AND PRODUTOS.ATIVO=1'
      'UNION'
      
        'SELECT CASE WHEN (TP.TIPO = '#39'P'#39') THEN 1 ELSE 2 END ORDEM, PRODUT' +
        'OS.num_fab_prod,'
      
        'CASE WHEN (TP.TIPO = '#39'P'#39') THEN '#39'PROMOCAO'#39' ELSE TP.DESCR_TIPO END' +
        ' TIPO,'
      'PRODUTOS.*, TP.TIPO TP, P.COD_PROMOCAO,'
      'CASE WHEN COALESCE(L.COD_LOCALIDADE, 0) > 0 THEN L.LOCALIDADE'
      'WHEN COALESCE(ST.COD_SETOR, 0) > 0 THEN ST.SETOR'
      
        'WHEN COALESCE(CD.COD_CIDADE, 0) > 0 THEN CD.NOME_CIDADE  ELSE P.' +
        'DESCR_PROMOCAO END DESCR_TIPO,'
      
        'CASE WHEN PP.PORCENTAGEM <= 0 THEN PP.VALOR_PROMOCAO ELSE (PRODU' +
        'TOS.PREC_TAB_PROD - (PRODUTOS.PREC_TAB_PROD / 100) * PP.PORCENTA' +
        'GEM) END VALOR_PROMOCAO,'
      'PP.PORCENTAGEM, PP.MAX_DESC,'
      
        '(SELECT COUNT(*) FROM PRODUTOS WHERE COD_EMPRESA = 1 AND ATIVO =' +
        ' 1) QUANT,'
      'CASE WHEN (P.COD_PROMOCAO IS NULL) THEN PRODUTOS.PREC_TAB_PROD'
      
        'WHEN ((P.COD_PROMOCAO IS NOT NULL) AND (PP.VALOR_PROMOCAO > 0)) ' +
        'THEN PP.VALOR_PROMOCAO'
      
        'WHEN ((P.COD_PROMOCAO IS NOT NULL) AND (PP.PORCENTAGEM > 0)) THE' +
        'N  (PRODUTOS.PREC_TAB_PROD - (PRODUTOS.PREC_TAB_PROD / 100) * PP' +
        '.PORCENTAGEM)  END VALOR_VENDA,'
      'GRUPOS.DESCRICAO, SUB_GRUPO.DESCRICAO DESCSUB  FROM PRODUTOS'
      
        'LEFT JOIN PROMOCAO_PRODUTO PP ON PP.GRUPO_PROD = PRODUTOS.GRUPO_' +
        'PROD AND PP.COD_PROD = PRODUTOS.COD_PROD AND PP.COD_EMPRESA = PR' +
        'ODUTOS.COD_EMPRESA'
      
        'LEFT JOIN TIPO_PRECO TP ON TP.COD_TPPRECO = PP.COD_TPPRECO AND T' +
        'P.COD_EMPRESA = PP.COD_EMPRESA'
      
        'LEFT JOIN LOCALIDADE L ON L.COD_LOCALIDADE = PP.COD_LOCALIDADE A' +
        'ND L.COD_EMPRESA = PP.COD_EMPRESA'
      
        'LEFT JOIN SETOR ST ON ST.COD_SETOR = PP.COD_SETOR AND ST.COD_EMP' +
        'RESA = PP.COD_EMPRESA'
      'LEFT JOIN CIDADES CD ON CD.COD_CIDADE = PP.COD_CIDADE'
      
        'LEFT JOIN PROMOCAO P ON P.COD_PROMOCAO = PP.COD_PROMOCAO AND P.C' +
        'OD_TPPRECO = PP.COD_TPPRECO AND P.COD_EMPRESA = PP.COD_EMPRESA'
      'LEFT JOIN GRUPOS ON PRODUTOS.GRUPO_PROD = GRUPOS.CODIGO_GRUP'
      
        'LEFT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = COALESCE(PRODUTO' +
        'S.SUB_G_PROD,0)'
      
        'LEFT JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PRO' +
        'D AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_E' +
        'MPRESA = PRODUTOS.COD_EMPRESA'
      
        'WHERE (pp.cod_promocao is not null) AND  PRODUTOS.DESCR_PROD LIK' +
        'E '#39'OLEO TESTE%'#39' AND PRODUTOS.COD_EMPRESA = 1 AND PRODUTOS.ATIVO=' +
        '1'
      'UNION'
      
        'SELECT 3 ORDEM, PRODUTOS.num_fab_prod, '#39'QUANTIDADE'#39'  TIPO, PRODU' +
        'TOS.*, '#39'Q'#39' TP, 0 COD_PROMOCAO,'
      
        '('#39'QUANTIDADE MAIOR OU IGUAL '#39'||  REPLACE(CAST(PQ.QUANT AS NUMERI' +
        'C(8,3)), '#39'.'#39', '#39','#39') ) DESCR_TIPO,'
      
        'PQ.PRECO_VENDA VALOR_PROMOCAO, CAST(0 AS FLOAT)  PORCENTAGEM, CA' +
        'ST(0 AS FLOAT)  MAX_DESC, 0 QUANT,  PQ.PRECO_VENDA VALOR_VENDA, ' +
        'GRUPOS.DESCRICAO,'
      'SUB_GRUPO.DESCRICAO DESCSUB FROM PRODUTOS'
      'LEFT JOIN GRUPOS ON PRODUTOS.GRUPO_PROD = GRUPOS.CODIGO_GRUP'
      
        'LEFT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = COALESCE(PRODUTO' +
        'S.SUB_G_PROD,0)'
      
        'LEFT JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PRO' +
        'D AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_E' +
        'MPRESA = PRODUTOS.COD_EMPRESA'
      
        'LEFT JOIN PRECO_PRODUTOS_QTDE PQ ON PQ.GRUPO_PROD = PRODUTOS.GRU' +
        'PO_PROD AND PQ.COD_PROD = PRODUTOS.COD_PROD AND PQ.COD_EMPRESA =' +
        ' PRODUTOS.COD_EMPRESA'
      
        'WHERE  PRODUTOS.DESCR_PROD LIKE '#39'OLEO TESTE%'#39' AND PRODUTOS.COD_E' +
        'MPRESA = 1 AND PRODUTOS.ATIVO=1'
      'ORDER BY 30, 1')
    Left = 81
    Top = 234
  end
  object dspProdutosRel: TDataSetProvider
    DataSet = qrProdutosRel
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 81
    Top = 285
  end
  object cdsProdutosRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosRel'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 81
    Top = 336
    object StringField11: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object IntegerField13: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField14: TIntegerField
      Tag = 2
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object StringField12: TStringField
      Tag = 2
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object StringField13: TStringField
      Tag = 2
      DisplayLabel = 'Numero Fabrica'#231#227'o Produto'
      FieldName = 'NUM_FAB_PROD'
    end
    object StringField14: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object StringField15: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o Reduzida Produto'
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object FloatField3: TFloatField
      Tag = 2
      DisplayLabel = 'Pre'#231'o de Tabela do Produto'
      FieldName = 'PREC_TAB_PROD'
      currency = True
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
    end
    object StringField16: TStringField
      DisplayLabel = 'Marca do Produto'
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 10
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Cod Natureza Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object StringField17: TStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object StringField18: TStringField
      DisplayLabel = 'CST Produto'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object StringField19: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object StringField20: TStringField
      DisplayLabel = 'Loca'#231#227'o do Produto'
      FieldName = 'LOCACAO_PROD'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object StringField21: TStringField
      DisplayLabel = 'Aplica'#231#227'o do Produto'
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
    object FloatField6: TFloatField
      Tag = 2
      DisplayLabel = 'ICMS do Produto'
      FieldName = 'ICM_PROD'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'IPI do Produto'
      FieldName = 'IPI_PROD'
    end
    object StringField22: TStringField
      DisplayLabel = 'Produto Isento'
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object StringField23: TStringField
      DisplayLabel = 'ISENTO PIS/CONFINS'
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object StringField24: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia Produto'
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object StringField25: TStringField
      DisplayLabel = 'Alterar Valor Cupom'
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object StringField26: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o Cupom'
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object StringField27: TStringField
      DisplayLabel = 'Tipo de Fabrica'#231#227'o'
      FieldName = 'TIPO_FAB'
      Size = 1
    end
    object StringField28: TStringField
      DisplayLabel = 'N'#186' de Casas Decimais para Quantidade'
      FieldName = 'CSDECQTDE'
      Size = 1
    end
    object StringField29: TStringField
      DisplayLabel = 'N'#186' de Casas Decimais para Valor Unit'#225'rio'
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object StringField30: TStringField
      DisplayLabel = 'Arredondar/Truncar'
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object StringField31: TStringField
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object StringField32: TStringField
      DisplayLabel = 'Em Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Pre'#231'o de Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
      currency = True
    end
    object StringField33: TStringField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Peso L'#237'quido Produto'
      FieldName = 'PESO_LIQ_PROD'
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Peso Bruto Produto'
      FieldName = 'PESO_BRUT_PROD'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Percentual Tabela Produto'
      FieldName = 'PERC_TB_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
      currency = True
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
      currency = True
    end
    object FloatField14: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
      currency = True
    end
    object FloatField15: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 30 dias'
      FieldName = 'PERC_TB_PROD3'
      DisplayFormat = '##0.00'
    end
    object FloatField16: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 60 dias'
      FieldName = 'PERC_TB_PROD6'
      DisplayFormat = '##0.00'
    end
    object FloatField17: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 90 dias'
      FieldName = 'PERC_TB_PROD9'
      DisplayFormat = '##0.00'
    end
    object FloatField18: TFloatField
      DisplayLabel = 'Percentual Redu'#231#227'o Produto'
      FieldName = 'PERC_RED_PROD'
    end
    object StringField34: TStringField
      DisplayLabel = 'Loca'#231#227'o do Produto 1'
      FieldName = 'LOCACAO_PROD_1'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object IntegerField15: TIntegerField
      DisplayLabel = 'Cod Sub Grupo Produto'
      FieldName = 'SUB_G_PROD'
    end
    object FloatField19: TFloatField
      DisplayLabel = 'Estoque do Dep'#243'sito'
      FieldName = 'EST_R'
    end
    object FloatField20: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o de Custo do Produto'
      FieldName = 'PREC_CUS_PROD'
      currency = True
    end
    object FloatField21: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo Real do Produto'
      FieldName = 'PREC_CUSR_PROD'
      currency = True
    end
    object FloatField22: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo da MNF'
      FieldName = 'PREC_CUS_MNF'
      currency = True
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      EditMask = '!99/99/9999;1;_'
    end
    object FloatField23: TFloatField
      DisplayLabel = 'Valor '#218'ltima Compra'
      FieldName = 'VL_ULT_COMPRA'
      currency = True
    end
    object FloatField24: TFloatField
      DisplayLabel = 'Pre'#231'o Reposi'#231#227'o do Produto'
      FieldName = 'PREC_REP_PROD'
      currency = True
    end
    object IntegerField16: TIntegerField
      DisplayLabel = 'Numero Nota Fiscal Recebimento'
      FieldName = 'NUM_NF_REC'
    end
    object FloatField25: TFloatField
      DisplayLabel = 'Quantidade Requisi'#231#227'o Produto'
      FieldName = 'QREQ_PROD'
    end
    object FloatField26: TFloatField
      DisplayLabel = 'Quantidade Confirmada Produto'
      FieldName = 'QCONF_PROD'
    end
    object StringField35: TStringField
      DisplayLabel = 'Cod Custo Produto'
      FieldName = 'COD_CUST_PROD'
      FixedChar = True
      Size = 6
    end
    object FloatField27: TFloatField
      DisplayLabel = 'Comiss'#227'o Produto'
      FieldName = 'COMISSAO_PROD'
    end
    object FloatField28: TFloatField
      DisplayLabel = 'Quantidade Produto Embalagem'
      FieldName = 'QUANT_PROD_BL'
    end
    object StringField36: TStringField
      DisplayLabel = 'Loca'#231#227'o 1 Embalagem'
      FieldName = 'LOCACAO1_BL'
      FixedChar = True
      Size = 8
    end
    object StringField37: TStringField
      DisplayLabel = 'Loca'#231#227'o 2 Embalagem'
      FieldName = 'LOCACAO2_BL'
      FixedChar = True
      Size = 8
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Venda'
      FieldName = 'DT_ULT_VND'
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Venda Antes'
      FieldName = 'DT_ULT_VNDA'
    end
    object FloatField29: TFloatField
      DisplayLabel = 'Pre'#231'o P'#250'blico'
      FieldName = 'PREC_PUBLICO'
      currency = True
    end
    object StringField38: TStringField
      DisplayLabel = 'Codigo PPS'
      FieldName = 'COD_PPS'
      FixedChar = True
      Size = 2
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = 'Data Cadastro Produto'
      FieldName = 'DAT_CAD_PROD'
    end
    object DateTimeField9: TDateTimeField
      DisplayLabel = 'Data Modificac'#227'o Produto'
      FieldName = 'DAT_MOD_PROD'
    end
    object StringField39: TStringField
      DisplayLabel = 'Embalagem Produto'
      FieldName = 'EMB_PROD'
      FixedChar = True
      Size = 10
    end
    object FloatField30: TFloatField
      DisplayLabel = 'Percentual Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'PERC_SUBSTTR'
    end
    object FloatField31: TFloatField
      DisplayLabel = 'Quantidade Embalagem'
      FieldName = 'QTDEMB'
    end
    object StringField40: TStringField
      DisplayLabel = 'Balan'#231'a Produto'
      FieldName = 'BALANCA_PROD'
      FixedChar = True
      Size = 1
    end
    object StringField41: TStringField
      DisplayLabel = 'Validade Produto'
      FieldName = 'VALIDADE_PROD'
      FixedChar = True
      Size = 2
    end
    object FloatField32: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo Real Meia Nota'
      FieldName = 'PREC_CUSR_MNF'
      currency = True
    end
    object FloatField33: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio Produto'
      FieldName = 'PREC_CUSM_PROD'
      currency = True
    end
    object FloatField34: TFloatField
      DisplayLabel = 'Percentual Frete Produto'
      FieldName = 'PERC_FRETE_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField35: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio Real do Produto'
      FieldName = 'PREC_CUSMR_PROD'
      currency = True
    end
    object StringField42: TStringField
      DisplayLabel = 'Estados Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ESTSUBSTR'
      FixedChar = True
      Size = 80
    end
    object FloatField36: TFloatField
      DisplayLabel = 'Comiss'#227'o Produto Gerente'
      FieldName = 'COMISSAO_PROD_GER'
      DisplayFormat = '##0.00'
    end
    object FloatField37: TFloatField
      DisplayLabel = 'Custo Honda'
      FieldName = 'CUSTO_HONDA'
      currency = True
    end
    object FloatField38: TFloatField
      DisplayLabel = 'Al'#237'quota Redu'#231#227'o Produto'
      FieldName = 'ALIQ_RED_PROD'
    end
    object StringField43: TStringField
      DisplayLabel = 'Tipo Produto Indicado'
      FieldName = 'TIP_PROD_IND'
      FixedChar = True
      Size = 5
    end
    object FloatField40: TFloatField
      DisplayLabel = 'Percentual Tabela Atacado'
      FieldName = 'PERC_TB_ATAC'
      DisplayFormat = '##0.00'
    end
    object FloatField41: TFloatField
      DisplayLabel = 'Percentual Tabela Varejo'
      FieldName = 'PERC_TB_VARE'
      DisplayFormat = '##0.00'
    end
    object FloatField42: TFloatField
      DisplayLabel = 'ICMS Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ICMANT_SUB'
      DisplayFormat = '#0.000'
    end
    object StringField44: TStringField
      DisplayLabel = 'Necessita de Acompanhamento'
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'Dias de Acompanhamento'
      FieldName = 'DIAS_ACOMP'
    end
    object FloatField43: TFloatField
      DisplayLabel = 'Percentual Aumento 30 dias'
      FieldName = 'PERC_AD_30'
      DisplayFormat = '##0.00000'
    end
    object FloatField44: TFloatField
      DisplayLabel = 'Percentual Aumento 60 dias'
      FieldName = 'PERC_AD_60'
      DisplayFormat = '##0.00000'
    end
    object FloatField45: TFloatField
      DisplayLabel = 'Percentual Aumento 90 dias'
      FieldName = 'PERC_AD_90'
      DisplayFormat = '##0.00000'
    end
    object DateTimeField10: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o Produto'
      FieldName = 'DATA_MOD_PR'
    end
    object IntegerField18: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object StringField45: TStringField
      DisplayLabel = 'Loca'#231#227'o do Dep'#243'sito'
      FieldName = 'LOC_DEP'
      FixedChar = True
      Size = 8
    end
    object IntegerField19: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
    end
    object StringField46: TStringField
      DisplayLabel = 'Totalizador redu'#231#227'o no ECF'
      FieldName = 'TOT_ALIQ'
      FixedChar = True
      Size = 4
    end
    object DateTimeField11: TDateTimeField
      DisplayLabel = 'Data '#218'ltimo Pre'#231'o de Ajusto'
      FieldName = 'DATA_ULT_AJUSTE'
    end
    object FloatField46: TFloatField
      DisplayLabel = 'Pre'#231'o de Ajuste'
      FieldName = 'PRECO_AJUSTE'
      currency = True
    end
    object FloatField47: TFloatField
      DisplayLabel = 'Al'#237'quota Interna NF Entrada'
      FieldName = 'ALIQ_INTERNA_NFENT'
    end
    object IntegerField20: TIntegerField
      DisplayLabel = 'Cod Receita'
      FieldName = 'COD_RECEITA'
    end
    object StringField47: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SELEC'
      ProviderFlags = []
      Size = 1
    end
    object FloatField48: TFloatField
      DisplayLabel = 'Percentual Atacado produto'
      FieldName = 'PERC_TB_PRODA'
      DisplayFormat = '##0.00'
    end
    object StringField48: TStringField
      DisplayLabel = 'Tipo Item(Sped)'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object StringField49: TStringField
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 2
    end
    object FloatField49: TFloatField
      DisplayLabel = 'CFOP Inter N Contrib'
      FieldName = 'CFOP_INTER_N_CONT'
    end
    object StringField50: TStringField
      DisplayLabel = 'CST PIS Venda'
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object StringField51: TStringField
      DisplayLabel = 'CST COFINS Venda'
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object StringField52: TStringField
      DisplayLabel = 'CST PIS Entrada'
      FieldName = 'CST_PIS_ENT'
      FixedChar = True
      Size = 2
    end
    object StringField53: TStringField
      DisplayLabel = 'CST COFINS Entrada'
      FieldName = 'CST_COFINS_ENT'
      FixedChar = True
      Size = 2
    end
    object StringField54: TStringField
      DisplayLabel = 'Natureza Receita PIS/COFINS'
      FieldName = 'NAT_REC'
      Size = 3
    end
    object FloatField50: TFloatField
      DisplayLabel = 'Aliquota de PIS Diferenciada Venda'
      FieldName = 'ALIQ_PIS_DIFERENCIADA'
      DisplayFormat = '#0.0000'
    end
    object FloatField51: TFloatField
      DisplayLabel = 'Aliquota de COFINS Diferenciada Venda'
      FieldName = 'ALIQ_COFINS_DIFERENCIADA'
      DisplayFormat = '#0.0000'
    end
    object FloatField52: TFloatField
      DisplayLabel = 'Aliquota de Cr'#233'dito do PIS'
      FieldName = 'ALIQ_CRED_PIS'
      DisplayFormat = '#0.0000'
    end
    object FloatField53: TFloatField
      DisplayLabel = 'Aliquota de Cr'#233'dito do COFINS'
      FieldName = 'ALIQ_CRED_COFINS'
      DisplayFormat = '#0.0000'
    end
    object StringField55: TStringField
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object FloatField54: TFloatField
      DisplayLabel = 'Percentual Max. Desconto'
      FieldName = 'MAX_DESC_ITEM'
    end
    object FloatField55: TFloatField
      DisplayLabel = 'N'#237'vel Cr'#237'tico do Produto'
      FieldName = 'N_CRI_PROD'
      Precision = 4
    end
    object FloatField56: TFloatField
      DisplayLabel = 'N'#237'vel M'#237'nimo do Produto'
      FieldName = 'N_MIN_PROD'
      Precision = 4
    end
    object FloatField57: TFloatField
      DisplayLabel = 'N'#237'vel M'#225'ximo do Produto'
      FieldName = 'N_MAX_PROD'
      Precision = 4
    end
    object StringField56: TStringField
      DisplayLabel = 'Classe do Produto'
      FieldName = 'CLASSE_PROD'
      FixedChar = True
      Size = 1
    end
    object StringField57: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Valor'
      FieldName = 'CLINV'
      FixedChar = True
      Size = 1
    end
    object StringField58: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Pre'#231'o'
      FieldName = 'CLPRECO'
      FixedChar = True
      Size = 2
    end
    object StringField59: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Popularidade'
      FieldName = 'CLPOP'
      FixedChar = True
      Size = 2
    end
    object StringField60: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Volume Venda'
      FieldName = 'CLQTV'
      FixedChar = True
      Size = 2
    end
    object StringField61: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Frequ'#234'ncia Venda'
      FieldName = 'CLFRV'
      FixedChar = True
      Size = 2
    end
    object StringField62: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Atualidade Venda'
      FieldName = 'CLATL'
      FixedChar = True
      Size = 2
    end
    object IntegerField21: TIntegerField
      DisplayLabel = 'Estoque de Seguran'#231'a'
      FieldName = 'EST_SEGURANCA'
    end
    object IntegerField22: TIntegerField
      DisplayLabel = 'Tempo de Entrega Sug.'
      FieldName = 'TEMPO_ENTREGASUG'
    end
    object FloatField58: TFloatField
      DisplayLabel = 'Giro de Estoque'
      FieldName = 'VALORGE'
      Precision = 4
    end
    object FloatField59: TFloatField
      DisplayLabel = 'Prazo M'#233'dio de Estoque'
      FieldName = 'VALORPME'
      Precision = 4
    end
    object FloatField60: TFloatField
      DisplayLabel = 'Qtde Excesso'
      FieldName = 'QTDPROD_EXCESSO'
      Precision = 4
    end
    object FloatField61: TFloatField
      DisplayLabel = 'Dias de Excesso'
      FieldName = 'QTDDIAS_EXCESSO'
      Precision = 4
    end
    object FloatField62: TFloatField
      DisplayLabel = 'Demanda M'#233'dia Di'#225'ria'
      FieldName = 'DMD'
      Precision = 4
    end
    object IntegerField23: TIntegerField
      DisplayLabel = 'Frequencia Pedido'
      FieldName = 'FREQ_PEDIDO'
    end
    object IntegerField24: TIntegerField
      DisplayLabel = 'Codigo Informacao Complementar'
      FieldName = 'COD_INF'
    end
    object IntegerField25: TIntegerField
      DisplayLabel = 'Cod Rec Producao'
      FieldName = 'COD_RECPROD'
    end
    object FloatField63: TFloatField
      DisplayLabel = 'BC ICMS Ant Trib'
      FieldName = 'BASEICMANT_SUB'
      DisplayFormat = '#0.000'
    end
    object IntegerField26: TIntegerField
      Tag = 1
      FieldName = 'SEQID'
    end
    object StringField63: TStringField
      Tag = 1
      FieldName = 'COMB_CPRODANP'
      Size = 9
    end
    object StringField64: TStringField
      Tag = 1
      FieldName = 'COMB_CODIF'
      Size = 21
    end
    object cdsProdutosRelORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsProdutosRelTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsProdutosRelDESCR_TIPO: TStringField
      FieldName = 'DESCR_TIPO'
      Size = 128
    end
    object cdsProdutosRelVALOR_PROMOCAO: TFloatField
      FieldName = 'VALOR_PROMOCAO'
    end
    object cdsProdutosRelPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
    object cdsProdutosRelQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object cdsProdutosRelMAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
    end
    object cdsProdutosRelVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
    end
    object cdsProdutosRelCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsProdutosRelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsProdutosRelDESCSUB: TStringField
      FieldName = 'DESCSUB'
      Size = 80
    end
    object cdsProdutosRelTP: TStringField
      FieldName = 'TP'
      FixedChar = True
      Size = 1
    end
  end
  object dsProdutosRel: TDataSource
    DataSet = cdsProdutosRel
    Left = 81
    Top = 388
  end
  object qrTabPr2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select p.cod_promocao, p.ordem,'
      
        'case when (p.cod_promocao > 0) then '#39'PROMOCAO'#39' else tp.descr_tip' +
        'o end tipo,'
      'case when coalesce(l.cod_localidade, 0) > 0 then l.localidade'
      'when coalesce(st.cod_setor, 0) > 0 then st.setor'
      'when coalesce(cd.cod_cidade, 0) > 0 then cd.nome_cidade'
      'else p.descr_promocao end descr_tipo,'
      
        'case when pp.porcentagem <= 0 then pp.valor_promocao else (produ' +
        'tos.prec_tab_prod - (produtos.prec_tab_prod / 100) * pp.porcenta' +
        'gem) end valor_promocao, pp.porcentagem, pp.max_desc,'
      
        '(select count(*) from produtos where cod_empresa = 1 and ativo =' +
        ' 1) quant,'
      'case when (p.cod_promocao is null) then'
      'produtos.prec_tab_prod '
      
        'when ((p.cod_promocao is not null) and (pp.valor_promocao > 0)) ' +
        'then'
      'pp.valor_promocao'
      
        'when ((p.cod_promocao is not null) and (pp.porcentagem > 0)) the' +
        'n'
      
        '(produtos.prec_tab_prod - (produtos.prec_tab_prod / 100) * pp.po' +
        'rcentagem)'
      'end valor_venda, grupos.descricao, sub_grupo.descricao descSub'
      'from produtos'
      
        'left join promocao_produto pp on pp.grupo_prod = produtos.grupo_' +
        'prod and pp.cod_prod = produtos.cod_prod and pp.cod_empresa = pr' +
        'odutos.cod_empresa'
      
        'left join tipo_preco tp on tp.cod_tppreco = pp.cod_tppreco and t' +
        'p.cod_empresa = pp.cod_empresa'
      
        'left join localidade l on l.cod_localidade = pp.cod_localidade a' +
        'nd l.cod_empresa = pp.cod_empresa'
      
        'left join setor st on st.cod_setor = pp.cod_setor and st.cod_emp' +
        'resa = pp.cod_empresa'
      'left join cidades cd on cd.cod_cidade = pp.cod_cidade'
      
        'left join promocao p on p.cod_promocao = pp.cod_promocao and p.c' +
        'od_tppreco = pp.cod_tppreco and p.cod_empresa = pp.cod_empresa '
      'inner join grupos on produtos.grupo_prod = grupos.codigo_grup'
      
        'left join sub_grupo on sub_grupo.codigo_subgr = produtos.sub_g_p' +
        'rod'
      'where '
      
        'produtos.cod_empresa = 1 and produtos.ativo=1 and grupos.codigo_' +
        'grup in (101,1101,1102) order by grupos.descricao')
    Left = 847
    Top = 459
    object IBStringField1: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPOS"."DESCRICAO"'
      Size = 80
    end
    object IBStringField2: TIBStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PRODUTOS"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"PRODUTOS"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object IBStringField4: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      FixedChar = True
      Size = 75
    end
    object FloatField64: TFloatField
      FieldName = 'PREC_CUS_PROD'
      Origin = '"PRODUTOS"."PREC_CUS_PROD"'
    end
    object FloatField65: TFloatField
      FieldName = 'PREC_TAB_PROD'
      Origin = '"PRODUTOS"."PREC_TAB_PROD"'
    end
    object IBStringField5: TIBStringField
      FieldName = 'APLICACAO_PROD'
      Origin = '"PRODUTOS"."APLICACAO_PROD"'
      Size = 150
    end
    object DateTimeField12: TDateTimeField
      FieldName = 'DATA_ULT_COMPRA'
      Origin = '"PRODUTOS"."DATA_ULT_COMPRA"'
    end
    object IBStringField6: TIBStringField
      FieldName = 'MARCA_P'
      Origin = '"PRODUTOS"."MARCA_P"'
      FixedChar = True
      Size = 10
    end
    object FloatField66: TFloatField
      FieldName = 'N_MAX_PROD'
      Origin = '"PRODUTOS"."N_MAX_PROD"'
    end
    object FloatField67: TFloatField
      FieldName = 'N_MIN_PROD'
      Origin = '"PRODUTOS"."N_MIN_PROD"'
    end
    object IBStringField7: TIBStringField
      FieldName = 'CLASSE_PROD'
      Origin = '"PRODUTOS"."CLASSE_PROD"'
      FixedChar = True
      Size = 1
    end
    object IBStringField8: TIBStringField
      FieldName = 'CLINV'
      Origin = '"PRODUTOS"."CLINV"'
      FixedChar = True
      Size = 1
    end
    object IBStringField9: TIBStringField
      FieldName = 'CLPRECO'
      Origin = '"PRODUTOS"."CLPRECO"'
      FixedChar = True
      Size = 2
    end
    object IBStringField10: TIBStringField
      FieldName = 'CLPOP'
      Origin = '"PRODUTOS"."CLPOP"'
      FixedChar = True
      Size = 2
    end
    object IBStringField11: TIBStringField
      FieldName = 'CLQTV'
      Origin = '"PRODUTOS"."CLQTV"'
      FixedChar = True
      Size = 2
    end
    object IBStringField12: TIBStringField
      FieldName = 'CLFRV'
      Origin = '"PRODUTOS"."CLFRV"'
      FixedChar = True
      Size = 2
    end
    object IBStringField13: TIBStringField
      FieldName = 'CLATL'
      Origin = '"PRODUTOS"."CLATL"'
      FixedChar = True
      Size = 2
    end
    object IntegerField27: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PRODUTOS"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField28: TIntegerField
      FieldName = 'SUB_G_PROD'
      Origin = '"PRODUTOS"."SUB_G_PROD"'
    end
    object FloatField68: TFloatField
      FieldName = 'EST_F'
      Origin = '"PRODUTOS"."EST_F"'
    end
    object IBStringField14: TIBStringField
      FieldName = 'UNIDADE'
      Origin = '"PRODUTOS"."UNIDADE"'
      Size = 6
    end
    object FloatField69: TFloatField
      FieldName = 'PREC_30_PROD'
      Origin = '"PRODUTOS"."PREC_30_PROD"'
    end
    object FloatField70: TFloatField
      FieldName = 'PREC_60_PROD'
      Origin = '"PRODUTOS"."PREC_60_PROD"'
    end
    object FloatField71: TFloatField
      FieldName = 'PREC_90_PROD'
      Origin = '"PRODUTOS"."PREC_90_PROD"'
    end
    object IBStringField15: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object IBStringField16: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object IBStringField17: TIBStringField
      FieldName = 'DESCSUB'
      Origin = '"SUB_GRUPO"."DESCRICAO"'
      Size = 80
    end
    object qrTabPr2COD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Origin = '"PROMOCAO"."COD_PROMOCAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrTabPr2ORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"PROMOCAO"."ORDEM"'
    end
    object qrTabPr2TIPO: TIBStringField
      FieldName = 'TIPO'
      ProviderFlags = []
    end
    object qrTabPr2DESCR_TIPO: TIBStringField
      FieldName = 'DESCR_TIPO'
      ProviderFlags = []
      Size = 128
    end
    object qrTabPr2VALOR_PROMOCAO: TFloatField
      FieldName = 'VALOR_PROMOCAO'
      ProviderFlags = []
    end
    object qrTabPr2PORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
      Origin = '"PROMOCAO_PRODUTO"."PORCENTAGEM"'
    end
    object qrTabPr2MAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
      Origin = '"PROMOCAO_PRODUTO"."MAX_DESC"'
    end
    object qrTabPr2QUANT: TIntegerField
      FieldName = 'QUANT'
      ProviderFlags = []
    end
    object qrTabPr2VALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
      ProviderFlags = []
    end
  end
  object dsTabPr2: TDataSource
    DataSet = qrTabPr2
    Left = 847
    Top = 505
  end
  object cdsAltPreco2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1300
    Top = 458
    object IntegerField29: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object StringField65: TStringField
      FieldName = 'COD_PROD'
      Size = 6
    end
    object StringField66: TStringField
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object FloatField72: TFloatField
      FieldName = 'PREC_TAB_PROD'
    end
    object FloatField73: TFloatField
      FieldName = 'PREC_30_PROD'
    end
    object FloatField74: TFloatField
      FieldName = 'PREC_60_PROD'
    end
    object FloatField75: TFloatField
      FieldName = 'PREC_90_PROD'
    end
    object FloatField76: TFloatField
      FieldName = 'PERC_AD_30'
    end
    object FloatField77: TFloatField
      FieldName = 'PERC_AD_60'
    end
    object FloatField78: TFloatField
      FieldName = 'PERC_AD_90'
    end
    object cdsAltPreco2VALOR_PROMOCAO: TFloatField
      FieldName = 'VALOR_PROMOCAO'
    end
    object cdsAltPreco2PORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
    end
  end
  object dsAltPreco2: TDataSource
    DataSet = cdsAltPreco2
    Left = 1300
    Top = 504
  end
  object dspTribAd: TDataSetProvider
    DataSet = qrTribAd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2048
    Top = 40
  end
  object qrTribAd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 2048
    Top = 65528
  end
  object dsTribAd: TDataSource
    DataSet = cdsTribAd
    Left = 2048
    Top = 136
  end
  object qrNBS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNBS
    SQL.Strings = (
      'select * from nbs')
    Left = 2433
    Top = 239
  end
  object dspNBS: TDataSetProvider
    DataSet = qrNBS
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2430
    Top = 288
  end
  object cdsNBS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNBS'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2430
    Top = 337
    object cdsNBSCOD_NBS: TStringField
      Tag = 2
      DisplayLabel = 'Cod NBS'
      FieldName = 'COD_NBS'
      Required = True
      Size = 8
    end
    object cdsNBSDESCRICAO_NBS: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o NBS'
      FieldName = 'DESCRICAO_NBS'
      Required = True
      Size = 256
    end
    object cdsNBSALIQNAC: TFloatField
      Tag = 2
      DisplayLabel = 'Aliq NAC'
      FieldName = 'ALIQNAC'
    end
    object cdsNBSALIQIMP: TFloatField
      Tag = 2
      DisplayLabel = 'Aliq Imp'
      FieldName = 'ALIQIMP'
    end
  end
  object dsNBS: TDataSource
    DataSet = cdsNBS
    Left = 2428
    Top = 386
  end
  object IBTransNBS: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 481
    Top = 65525
  end
  object qrTipoServicoNFSE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoServicoNFSE
    SQL.Strings = (
      'select tp.*, n.descricao_nbs from tiposerviconfse tp'
      'left join nbs n on tp.cod_nbs = n.cod_nbs'
      'where tp.cod_tpservico = 0')
    Left = 2513
    Top = 239
  end
  object dspTipoServicoNFSE: TDataSetProvider
    DataSet = qrTipoServicoNFSE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2510
    Top = 288
  end
  object cdsTipoServicoNFSE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoServicoNFSE'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2510
    Top = 337
    object cdsTipoServicoNFSECOD_TPSERVICO: TStringField
      Tag = 2
      DisplayLabel = 'Cod TpServico'
      FieldName = 'COD_TPSERVICO'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsTipoServicoNFSEDESC_TPSERVICO: TStringField
      Tag = 2
      DisplayLabel = 'Descr TpServico'
      FieldName = 'DESC_TPSERVICO'
      Size = 200
    end
    object cdsTipoServicoNFSEATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTipoServicoNFSECOD_NBS: TStringField
      DisplayLabel = 'Cod NBS'
      FieldName = 'COD_NBS'
      Size = 8
    end
    object cdsTipoServicoNFSEALIQNAC: TFloatField
      DisplayLabel = 'Aliq NAC'
      FieldName = 'ALIQNAC'
    end
    object cdsTipoServicoNFSEALIQIMP: TFloatField
      DisplayLabel = 'Aliq Imp'
      FieldName = 'ALIQIMP'
    end
    object cdsTipoServicoNFSEDESCRICAO_NBS: TStringField
      DisplayLabel = 'Descricao NBS'
      FieldName = 'DESCRICAO_NBS'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      Size = 256
    end
    object cdsTipoServicoNFSEVL_TETO_IRRF: TFloatField
      DisplayLabel = 'Teto retencao IR'
      FieldName = 'VL_TETO_IRRF'
      DisplayFormat = '##0.00'
    end
    object cdsTipoServicoNFSEIRRF_SERVICO: TFloatField
      DisplayLabel = 'Aliq retencao IR'
      FieldName = 'IRRF_SERVICO'
      DisplayFormat = '##0.000'
    end
    object cdsTipoServicoNFSEVL_TETO_CONTRIB: TFloatField
      DisplayLabel = 'Teto retencao Contribuicao'
      FieldName = 'VL_TETO_CONTRIB'
      DisplayFormat = '##0.00'
    end
    object cdsTipoServicoNFSEALIQ_PIS_RET: TFloatField
      DisplayLabel = 'Aliq PIS retencao'
      FieldName = 'ALIQ_PIS_RET'
      DisplayFormat = '##0.000'
    end
    object cdsTipoServicoNFSEALIQ_COFINS_RET: TFloatField
      DisplayLabel = 'Aliq COFINS retencao'
      FieldName = 'ALIQ_COFINS_RET'
      DisplayFormat = '##0.000'
    end
    object cdsTipoServicoNFSEALIQ_CSSL_RET: TFloatField
      DisplayLabel = 'Aliq CSSL retencao'
      FieldName = 'ALIQ_CSSL_RET'
      DisplayFormat = '##0.000'
    end
  end
  object dsTipoServicoNFSE: TDataSource
    DataSet = cdsTipoServicoNFSE
    Left = 2508
    Top = 386
  end
  object qrConsNBS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNBS
    SQL.Strings = (
      'select * from nbs')
    Left = 2598
    Top = 240
  end
  object dspConsNBS: TDataSetProvider
    DataSet = qrConsNBS
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2595
    Top = 289
  end
  object cdsConsNBS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsNBS'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2595
    Top = 338
    object StringField69: TStringField
      DisplayLabel = 'C'#243'digo NBS'
      FieldName = 'COD_NBS'
      Required = True
      Size = 8
    end
    object StringField70: TStringField
      DisplayLabel = 'Descri'#231#227'o NBS'
      FieldName = 'DESCRICAO_NBS'
      Required = True
      Size = 256
    end
    object FloatField81: TFloatField
      DisplayLabel = 'Aliq NAC'
      FieldName = 'ALIQNAC'
    end
    object FloatField82: TFloatField
      DisplayLabel = 'Aliq Imp'
      FieldName = 'ALIQIMP'
    end
  end
  object dsConsNBS: TDataSource
    DataSet = cdsConsNBS
    Left = 2593
    Top = 387
  end
  object IBTransTipoServicoNFSE: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 633
    Top = 5
  end
  object dsDevolucao: TDataSource
    AutoEdit = False
    DataSet = qrDevolucao
    Left = 336
    Top = 728
  end
  object qrDevolucao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select dev.sequencia "N'#186' Devolu'#231#227'o", dev.tipo_venda "Tipo Venda"' +
        ', dev.cod_venda "Num Venda",'
      
        'dev.grupo_prod "Grupo Produto", dev.cod_prod "C'#243'd. Produto", dev' +
        '.num_fab_prod "Num. Fab. Prod.",'
      
        'dev.descricao "Descri'#231#227'o do Produto", dev.data "Data Entrada", d' +
        'ev.quant "QUANTIDADE",'
      
        'dev.pcust_mc "Custo Unit'#225'rio", dev.valor "Pre'#231'o Venda", coalesce' +
        '(gra.descricao,'#39'SEM GRADE'#39') "Descri'#231#227'o Grade", coalesce(gra.cod_' +
        'grade,0) "Cod. Grade",'
      
        'cl.cod_cliente "Cod Cliente", cl.nome_cliente "Nome Cliente", de' +
        'v.tipo "Tipo Devolu'#231#227'o"'
      'from devolucao dev'
      
        'left join grade gra on gra.cod_grade = dev.cod_grade and gra.cod' +
        '_empresa = dev.cod_empresa'
      
        'inner join clientes cl on cl.cod_cliente = dev.cod_cliente and c' +
        'l.cod_empresa = dev.cod_empresa'
      
        'where dev.data >= :dataIni and dev.data <= :dataFim and dev.cod_' +
        'empresa = 1 and dev.grupo_prod = 12'
      'and dev.cod_prod = '#39'00022 '#39' order by dev.data')
    Left = 335
    Top = 680
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end>
    object qrDevolucaoNDevoluo: TIntegerField
      FieldName = 'N'#186' Devolu'#231#227'o'
      Origin = '"DEVOLUCAO"."SEQUENCIA"'
      Required = True
    end
    object qrDevolucaoNumVenda: TIntegerField
      FieldName = 'Num Venda'
      Origin = '"DEVOLUCAO"."COD_VENDA"'
    end
    object qrDevolucaoTipoVenda: TIBStringField
      FieldName = 'Tipo Venda'
      Origin = '"DEVOLUCAO"."TIPO_VENDA"'
      Size = 3
    end
    object qrDevolucaoGrupoProduto: TIntegerField
      FieldName = 'Grupo Produto'
      Origin = '"DEVOLUCAO"."GRUPO_PROD"'
      Required = True
    end
    object qrDevolucaoCdProduto: TIBStringField
      FieldName = 'C'#243'd. Produto'
      Origin = '"DEVOLUCAO"."COD_PROD"'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrDevolucaoNumFabProd: TIBStringField
      FieldName = 'Num. Fab. Prod.'
      Origin = '"DEVOLUCAO"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrDevolucaoDescriodoProduto: TIBStringField
      FieldName = 'Descri'#231#227'o do Produto'
      Origin = '"DEVOLUCAO"."DESCRICAO"'
      FixedChar = True
      Size = 75
    end
    object qrDevolucaoDataEntrada: TDateTimeField
      FieldName = 'Data Entrada'
      Origin = '"DEVOLUCAO"."DATA"'
    end
    object qrDevolucaoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = '"DEVOLUCAO"."QUANT"'
    end
    object qrDevolucaoCustoUnitrio: TFloatField
      FieldName = 'Custo Unit'#225'rio'
      Origin = '"DEVOLUCAO"."PCUST_MC"'
      currency = True
    end
    object qrDevolucaoPreoVenda: TFloatField
      FieldName = 'Pre'#231'o Venda'
      Origin = '"DEVOLUCAO"."VALOR"'
      currency = True
    end
    object qrDevolucaoDescrioGrade: TIBStringField
      FieldName = 'Descri'#231#227'o Grade'
      ProviderFlags = []
      FixedChar = True
      Size = 32
    end
    object qrDevolucaoCodGrade: TIntegerField
      FieldName = 'Cod Grade'
      ProviderFlags = []
    end
    object qrDevolucaoCodCliente: TIntegerField
      FieldName = 'Cod Cliente'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      Required = True
    end
    object qrDevolucaoNomeCliente: TIBStringField
      FieldName = 'Nome Cliente'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      FixedChar = True
      Size = 35
    end
    object qrDevolucaoTipoDevoluo: TIBStringField
      FieldName = 'Tipo Devolu'#231#227'o'
      Origin = '"DEVOLUCAO"."TIPO"'
      FixedChar = True
      Size = 1
    end
  end
  object qrPFTribAd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from PRODUTOS_TRIB_PF'
      'where COD_TRIB_PF = 0 and COD_EMPRESA = 0')
    Left = 927
    Top = 681
  end
  object dspPFTribAd: TDataSetProvider
    DataSet = qrPFTribAd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 927
    Top = 732
  end
  object cdsPFTribAd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPFTribAd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 927
    Top = 783
    object cdsPFTribAdCOD_TRIB_PF: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TRIB_PF'
      Required = True
    end
    object cdsPFTribAdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPFTribAdDESCRICAO_PF: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_PF'
      Size = 32
    end
    object cdsPFTribAdSIGLA_UF: TStringField
      DisplayLabel = 'Siglas Estados'
      FieldName = 'SIGLA_UF'
      Required = True
      Size = 128
    end
    object cdsPFTribAdCONTRIBUINTE: TStringField
      DisplayLabel = 'Contribuinte'
      FieldName = 'CONTRIBUINTE'
      Required = True
      Size = 8
    end
    object cdsPFTribAdCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 8
    end
    object cdsPFTribAdPESSOA: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'PESSOA'
      Required = True
      Size = 8
    end
    object cdsPFTribAdCST_ICMS: TStringField
      DisplayLabel = 'CST ICMS'
      FieldName = 'CST_ICMS'
      FixedChar = True
      Size = 2
    end
    object cdsPFTribAdCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsPFTribAdALIQ_INTER: TFloatField
      DisplayLabel = 'Aliq ICMS Interestadual'
      FieldName = 'ALIQ_INTER'
      DisplayFormat = '##0.00'
    end
    object cdsPFTribAdPERC_RED_PROD: TFloatField
      DisplayLabel = 'Perc. Redu'#231#227'o'
      FieldName = 'PERC_RED_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPFTribAdREDUCAO_CAD_PRODUTO: TStringField
      DisplayLabel = 'Usar redu'#231#227'o do Cadastro do Produto'
      FieldName = 'REDUCAO_CAD_PRODUTO'
      Size = 1
    end
    object cdsPFTribAdALIQ_INTRA: TFloatField
      DisplayLabel = 'Aliq Intraestadual'
      FieldName = 'ALIQ_INTRA'
      DisplayFormat = '##0.00'
    end
    object cdsPFTribAdMVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '#00.000'
    end
    object cdsPFTribAdATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPFTribAdFCP_ALIQ: TFloatField
      DisplayLabel = 'Aliq FCP'
      FieldName = 'FCP_ALIQ'
      DisplayFormat = '#0.00'
    end
    object cdsPFTribAdFINALIDADEID: TIntegerField
      DisplayLabel = 'Finalidade Espec'#237'fica ID'
      FieldName = 'FINALIDADEID'
    end
    object cdsPFTribAdIND_DESONERACAO: TIntegerField
      DisplayLabel = 'Ind Motivo Desonera'#231#227'o'
      FieldName = 'IND_DESONERACAO'
    end
    object cdsPFTribAdUSAR_MVA_ANEXOXV: TStringField
      DisplayLabel = 'Usar MVA do Anexo XV(CEST)'
      FieldName = 'USAR_MVA_ANEXOXV'
      Size = 1
    end
  end
  object dsPFTribAd: TDataSource
    AutoEdit = False
    DataSet = cdsPFTribAd
    Left = 927
    Top = 835
  end
  object qrConsPFTribAd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from PRODUTOS_CONVENIO_UF_PERFIL'
      'where COD_PERF_CONVUF = 0 and COD_EMPRESA = 0')
    Left = 1015
    Top = 681
  end
  object dspConsPFTribAd: TDataSetProvider
    DataSet = qrConsPFTribAd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1015
    Top = 732
  end
  object dsConsPFTribAd: TDataSource
    AutoEdit = False
    DataSet = cdsConsPFTribAd
    Left = 1015
    Top = 835
  end
  object cdsTribAd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTribAd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2047
    Top = 90
    object cdsTribAdCOD_TRIB_PF: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TRIB_PF'
      Required = True
    end
    object cdsTribAdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsTribAdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 6
    end
    object cdsTribAdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTribAdDESCRICAO_PF: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_PF'
      Size = 32
    end
    object cdsTribAdSIGLA_UF: TStringField
      DisplayLabel = 'Siglas Estados'
      FieldName = 'SIGLA_UF'
      Size = 128
    end
    object cdsTribAdCONTRIBUINTE: TStringField
      DisplayLabel = 'Contribuinte'
      FieldName = 'CONTRIBUINTE'
      Size = 8
    end
    object cdsTribAdPESSOA: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'PESSOA'
      Size = 8
    end
    object cdsTribAdCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 8
    end
    object cdsTribAdCST_ICMS: TStringField
      DisplayLabel = 'CST ICMS'
      FieldName = 'CST_ICMS'
      FixedChar = True
      Size = 2
    end
    object cdsTribAdCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsTribAdALIQ_INTER: TFloatField
      DisplayLabel = 'Aliq Interestadual'
      FieldName = 'ALIQ_INTER'
      DisplayFormat = '##0.00'
    end
    object cdsTribAdPERC_RED_PROD: TFloatField
      DisplayLabel = 'Perc. Redu'#231#227'o'
      FieldName = 'PERC_RED_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsTribAdREDUCAO_CAD_PRODUTO: TStringField
      DisplayLabel = 'Usar redu'#231#227'o do Cadastro do Produto'
      FieldName = 'REDUCAO_CAD_PRODUTO'
      Size = 1
    end
    object cdsTribAdALIQ_INTRA: TFloatField
      DisplayLabel = 'Aliq Intraestadual'
      FieldName = 'ALIQ_INTRA'
      DisplayFormat = '##0.00'
    end
    object cdsTribAdMVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '#00.000'
    end
    object cdsTribAdATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTribAdFCP_ALIQ: TFloatField
      DisplayLabel = 'Aliq FCP'
      FieldName = 'FCP_ALIQ'
      DisplayFormat = '##0.00'
    end
    object cdsTribAdFINALIDADEID: TIntegerField
      DisplayLabel = 'Finalidade ID'
      FieldName = 'FINALIDADEID'
    end
    object cdsTribAdDESCRICAO: TStringField
      DisplayLabel = 'Finalidade'
      FieldName = 'DESCRICAO'
      Size = 64
    end
  end
  object cdsConsPFTribAd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPFTribAd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1015
    Top = 783
    object cdsConsPFTribAdCOD_TRIB_PF: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TRIB_PF'
      Required = True
    end
    object cdsConsPFTribAdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConsPFTribAdDESCRICAO_PF: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_PF'
      Size = 32
    end
    object cdsConsPFTribAdSIGLA_UF: TStringField
      DisplayLabel = 'Siglas Estados'
      FieldName = 'SIGLA_UF'
      Required = True
      Size = 128
    end
    object cdsConsPFTribAdCONTRIBUINTE: TStringField
      DisplayLabel = 'Contribuinte'
      FieldName = 'CONTRIBUINTE'
      Required = True
      Size = 8
    end
    object cdsConsPFTribAdPESSOA: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'PESSOA'
      Required = True
      Size = 8
    end
    object cdsConsPFTribAdCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 8
    end
    object cdsConsPFTribAdCST_ICMS: TStringField
      DisplayLabel = 'CST ICMS'
      FieldName = 'CST_ICMS'
      FixedChar = True
      Size = 2
    end
    object cdsConsPFTribAdCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsConsPFTribAdALIQ_INTER: TFloatField
      DisplayLabel = 'Aliq Interestadual'
      FieldName = 'ALIQ_INTER'
      DisplayFormat = '##0.00'
    end
    object cdsConsPFTribAdPERC_RED_PROD: TFloatField
      DisplayLabel = 'Perc. Redu'#231#227'o'
      FieldName = 'PERC_RED_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsConsPFTribAdREDUCAO_CAD_PRODUTO: TStringField
      DisplayLabel = 'Usar redu'#231#227'o do Cadastro do Produto'
      FieldName = 'REDUCAO_CAD_PRODUTO'
      Size = 1
    end
    object cdsConsPFTribAdALIQ_INTRA: TFloatField
      DisplayLabel = 'Aliq Intraestadual'
      FieldName = 'ALIQ_INTRA'
      DisplayFormat = '##0.00'
    end
    object cdsConsPFTribAdMVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '#00.000'
    end
    object cdsConsPFTribAdATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object SpMovEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    StoredProcName = 'MOVIMENTA_ESTOQUE'
    Left = 980
    Top = 1
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 552
    Top = 776
    object cdsEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaIDENTIFICACAO_EMP: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 552
    Top = 728
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select e.cod_empresa, e.identificacao_emp from empresa e')
    Left = 552
    Top = 680
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 552
    Top = 824
  end
  object dspFich: TDataSetProvider
    DataSet = qrFich
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1320
    Top = 64
  end
  object qrFich: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 1320
    Top = 16
  end
  object dsFichasCompras: TDataSource
    AutoEdit = False
    DataSet = cdsFichCompras
    Left = 1421
    Top = 144
  end
  object cdsFichCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichCompras'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1420
    Top = 98
  end
  object dsFichEProducao: TDataSource
    AutoEdit = False
    DataSet = cdsFichEProducao
    Left = 1517
    Top = 144
  end
  object cdsFichEProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichEProducao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1517
    Top = 98
  end
  object dsFichDevolucao: TDataSource
    AutoEdit = False
    DataSet = cdsFichDevolucao
    Left = 1613
    Top = 144
  end
  object cdsFichDevolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichDevolucao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1612
    Top = 98
  end
  object dsFichVendas: TDataSource
    AutoEdit = False
    DataSet = cdsFichVendas
    Left = 1704
    Top = 144
  end
  object cdsFichVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichVendas'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1703
    Top = 98
  end
  object dsFichSProducao: TDataSource
    AutoEdit = False
    DataSet = cdsFichSProducao
    Left = 1792
    Top = 144
  end
  object cdsFichSProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichSProducao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1791
    Top = 98
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = IBQuery1
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1272
    Top = 56
  end
  object IBQuery1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 1256
  end
  object dsEstoqueDiario: TDataSource
    DataSet = cdsEstoqueDiario
    Left = 1880
    Top = 144
  end
  object cdsEstoqueDiario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueDiario'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1879
    Top = 98
    object cdsEstoqueDiarioData: TDateTimeField
      DisplayWidth = 12
      FieldName = 'Data'
      Required = True
    end
    object cdsEstoqueDiarioEstoque: TFloatField
      FieldName = 'Estoque'
    end
    object cdsEstoqueDiarioCustoMedio: TFloatField
      FieldName = 'CustoMedio'
      DisplayFormat = '##0.000'
    end
  end
  object qrEstoqueDiario: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        ' select distinct est.dia "Data", est.estoque "Estoque", est.cust' +
        'o_medio "CustoMedio" from estoque_diario est'
      ' where est.tipo = '#39'P'#39' and est.grupo_prod = 6 and'
      ' est.cod_prod = '#39'00002'#39' and est.cod_empresa = 1'
      ' and est.dia >= :dataInicio'
      ' and est.dia <= :dataFim  order by est.dia asc')
    Left = 1880
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end>
  end
  object dspEstoqueDiario: TDataSetProvider
    DataSet = qrEstoqueDiario
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1880
    Top = 52
  end
  object dspFichCompras: TDataSetProvider
    DataSet = qrFichCompras
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1416
    Top = 55
  end
  object qrFichCompras: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 1416
    Top = 8
  end
  object dspFichEProducao: TDataSetProvider
    DataSet = qrFichEProducao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1516
    Top = 55
  end
  object qrFichEProducao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 1516
    Top = 8
  end
  object dspFichDevolucao: TDataSetProvider
    DataSet = qrFichDevolucao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1612
    Top = 55
  end
  object qrFichDevolucao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 1612
    Top = 8
  end
  object dspFichVendas: TDataSetProvider
    DataSet = qrFichVendas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1700
    Top = 55
  end
  object qrFichVendas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 1700
    Top = 8
  end
  object dspFichSProducao: TDataSetProvider
    DataSet = qrFichSProducao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1788
    Top = 55
  end
  object qrFichSProducao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select pf.* from produtos_trib_ad ad'
      
        'inner join produtos_trib_pf pf on ad.cod_trib_pf = pf.cod_trib_p' +
        'f and ad.cod_empresa = pf.cod_empresa'
      
        'where ad.grupo_prod = 0 and ad.cod_prod = '#39#39' and ad.cod_empresa ' +
        '= 0')
    Left = 1788
    Top = 8
  end
  object dsFIcha: TDataSource
    AutoEdit = False
    DataSet = cdsFicha
    Left = 1976
    Top = 136
  end
  object cdsFicha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFicha'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1975
    Top = 90
  end
  object dspFicha: TDataSetProvider
    DataSet = qrFicha
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1972
    Top = 47
  end
  object qrFicha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from FICHAPRODUTOSDETALHADA')
    Left = 1972
  end
  object dsListaFabrica: TDataSource
    AutoEdit = False
    DataSet = cdsListaFabrica
    Left = 1119
    Top = 835
  end
  object cdsListaFabrica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaFabrica'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1119
    Top = 783
    object cdsListaFabricaCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Required = True
    end
    object cdsListaFabricaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 48
    end
    object cdsListaFabricaSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
    object cdsListaFabricaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrListaFabrica: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'SELECT COD_TIPO, (TRIM(SIGLA)||'#39' - '#39'||TRIM(DESCRICAO)) DESCRICAO' +
        ', SIGLA, ATIVO FROM TIPO_LISTA_FABRICA'
      'WHERE ATIVO = 1')
    Left = 1119
    Top = 681
  end
  object dspListaFabrica: TDataSetProvider
    DataSet = qrListaFabrica
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1119
    Top = 732
  end
  object dsPendenciaReserva: TDataSource
    Left = 544
    Top = 106
  end
  object qrCEST: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNBM
    SQL.Strings = (
      'select * from cest where cest = '#39#39' and ncm = '#39#39)
    Left = 1509
    Top = 458
  end
  object dspCEST: TDataSetProvider
    DataSet = qrCEST
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1509
    Top = 506
  end
  object cdsCEST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCEST'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1509
    Top = 556
    object cdsCESTCEST: TStringField
      FieldName = 'CEST'
      Required = True
      EditMask = '99.999.99;0;_'
      Size = 7
    end
    object cdsCESTNCM: TStringField
      FieldName = 'NCM'
      Required = True
      Size = 8
    end
    object cdsCESTDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object dsCEST: TDataSource
    DataSet = cdsCEST
    Left = 1508
    Top = 602
  end
  object dsTipoP: TDataSource
    DataSet = cdsTipoP
    Left = 1554
    Top = 606
  end
  object cdsTipoP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoP'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1554
    Top = 560
    object cdsTipoPSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
    object cdsTipoPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 48
    end
  end
  object dspTipoP: TDataSetProvider
    DataSet = qrTipoP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1554
    Top = 510
  end
  object qrTipoP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'SELECT SIGLA, (SIGLA||'#39' - '#39'||DESCRICAO) DESCRICAO FROM TIPO_LIST' +
        'A_FABRICA'
      'WHERE ATIVO = 1')
    Left = 1554
    Top = 462
  end
  object dspProdutosPrecoQtde: TDataSetProvider
    DataSet = qrProdutosPrecoQtde
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2160
    Top = 40
  end
  object qrProdutosPrecoQtde: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPromocaoProduto
    SQL.Strings = (
      
        'select p.*, pr.prec_tab_prod, pr.prec_cusm_prod from preco_produ' +
        'tos_qtde p'
      'inner join produtos pr on pr.grupo_prod = p.cod_prod'
      'and pr.cod_prod = p.cod_prod'
      'and pr.cod_empresa = p.cod_empresa'
      
        'where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and ' +
        'p.cod_empresa = :cod_empresa')
    Left = 2160
    Top = 65528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dsProdutosPrecoQtde: TDataSource
    DataSet = cdsProdutosPrecoQtde
    Left = 2160
    Top = 136
  end
  object cdsProdutosPrecoQtde: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosPrecoQtde'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2160
    Top = 88
    object cdsProdutosPrecoQtdeSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsProdutosPrecoQtdeGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosPrecoQtdeCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosPrecoQtdeCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosPrecoQtdeQUANT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT'
      Required = True
      DisplayFormat = '##0.00'
    end
    object cdsProdutosPrecoQtdeSIGLA: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'SIGLA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPrecoQtdePRECO_VENDA: TFloatField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsProdutosPrecoQtdePORCENTAGEM: TFloatField
      DisplayLabel = 'Perc (%)'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '##0.00%'
    end
    object cdsProdutosPrecoQtdeMAX_DESC: TFloatField
      DisplayLabel = 'Max Desc (%)'
      FieldName = 'MAX_DESC'
      DisplayFormat = '##0.00%'
    end
    object cdsProdutosPrecoQtdeUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsProdutosPrecoQtdeDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
    end
    object cdsProdutosPrecoQtdeHORA_CAD: TStringField
      DisplayLabel = 'Hora Cad'
      FieldName = 'HORA_CAD'
      FixedChar = True
      Size = 8
    end
    object cdsProdutosPrecoQtdeUS_MOD: TIntegerField
      DisplayLabel = 'Us Mod'
      FieldName = 'US_MOD'
    end
    object cdsProdutosPrecoQtdeDATA_MOD: TDateTimeField
      DisplayLabel = 'Data Mod'
      FieldName = 'DATA_MOD'
    end
    object cdsProdutosPrecoQtdeHORA_MOD: TStringField
      DisplayLabel = 'Hora Mod'
      FieldName = 'HORA_MOD'
      FixedChar = True
      Size = 8
    end
    object cdsProdutosPrecoQtdePRECO_VENDA_TEMP: TFloatField
      DisplayLabel = 'Valor (R$)'
      FieldKind = fkInternalCalc
      FieldName = 'PRECO_VENDA_TEMP'
      DisplayFormat = '##0.00'
    end
    object cdsProdutosPrecoQtdePORCENTAGEM_TEMP: TFloatField
      DisplayLabel = 'Perc (%)'
      FieldKind = fkInternalCalc
      FieldName = 'PORCENTAGEM_TEMP'
      DisplayFormat = '##0.00%'
    end
    object cdsProdutosPrecoQtdePROPORCAO_TABELA: TFloatField
      FieldName = 'PROPORCAO_TABELA'
    end
    object cdsProdutosPrecoQtdePREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      ProviderFlags = [pfInWhere]
    end
    object cdsProdutosPrecoQtdePREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
      ProviderFlags = [pfInWhere]
    end
    object cdsProdutosPrecoQtdeMARKUP: TFloatField
      DisplayLabel = 'Markup'
      FieldName = 'MARKUP'
    end
    object cdsProdutosPrecoQtdeMARGEM: TFloatField
      DisplayLabel = 'Margem'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM'
    end
    object cdsProdutosPrecoQtdeUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
  end
  object qrProdutosTemp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select *  from PRODUTOS')
    Left = 2265
    Top = 65522
  end
  object dspProdutosTemp: TDataSetProvider
    DataSet = qrProdutosTemp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2265
    Top = 37
  end
  object cdsProdutosTemp: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProdutosTemp'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2265
    Top = 88
  end
  object dsProdutosTemp: TDataSource
    DataSet = cdsProdutosTemp
    Left = 2265
    Top = 140
  end
  object dsEstoqueDiarioC: TDataSource
    DataSet = cdsEstoqueDiarioC
    Left = 2368
    Top = 136
  end
  object cdsEstoqueDiarioC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueDiarioC'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2367
    Top = 90
    object DateTimeField13: TDateTimeField
      DisplayWidth = 12
      FieldName = 'Data'
      Required = True
    end
    object FloatField39: TFloatField
      FieldName = 'Estoque'
    end
    object FloatField79: TFloatField
      FieldName = 'CustoMedio'
      DisplayFormat = '##0.000'
    end
  end
  object qrEstoqueDiarioC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        ' select distinct est.dia "Data", est.estoque "Estoque", est.cust' +
        'o_medio "CustoMedio" from estoque_diario est'
      ' where est.tipo = '#39'P'#39' and est.grupo_prod = 6 and'
      ' est.cod_prod = '#39'00002'#39' and est.cod_empresa = 1'
      ' and est.dia >= :dataInicio'
      ' and est.dia <= :dataFim  order by est.dia asc')
    Left = 2368
    Top = 65528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end>
  end
  object dspEstoqueDiarioC: TDataSetProvider
    DataSet = qrEstoqueDiarioC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2368
    Top = 44
  end
  object dsFichaC: TDataSource
    AutoEdit = False
    DataSet = cdsFichaC
    Left = 2464
    Top = 136
  end
  object cdsFichaC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichaC'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2463
    Top = 90
  end
  object dspFichaC: TDataSetProvider
    DataSet = qrFichaC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2460
    Top = 47
  end
  object qrFichaC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    ObjectView = True
    SQL.Strings = (
      'select * from FICHAPRODUTOSDETALHADA')
    Left = 2460
  end
  object qrCategoria: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from produtos_categoria'
      'where grupo_prod = :grupo_prod'
      'and cod_prod = :cod_prod'
      'and cod_empresa = :cod_empresa')
    Left = 2670
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspCategoria: TDataSetProvider
    DataSet = qrCategoria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2667
    Top = 289
  end
  object cdsCategoria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCategoria'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2667
    Top = 338
    object cdsCategoriaGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCategoriaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCategoriaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCategoriaCOD_CATEGORIA: TIntegerField
      FieldName = 'COD_CATEGORIA'
      Required = True
    end
  end
  object dsCategoria: TDataSource
    DataSet = cdsCategoria
    Left = 2665
    Top = 387
  end
  object qrConsCategoria: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select (c.cod_categoria) ordem, c.cod_categoria, c.descricao, '
      
        '(c.cod_categoria || '#39' - '#39' || trim(coalesce(c.descricao, '#39#39#39#39'))) ' +
        'descricao2,'
      'c.cod_empresa from categoria c '
      'where coalesce(c.cod_categoria_pai, 0) = 0 and c.cod_empresa = 1'
      'union '
      
        'select (case when (coalesce(c2.cod_categoria_pai, 0) = 0) then '#39 +
        #39
      '             else (coalesce(c2.cod_categoria_pai, 0) || '#39'-'#39') end'
      '|| c2.cod_categoria || '
      
        '              case when (coalesce(c2.cod_categoria_pai, 0) = 0) ' +
        'then '#39'-'#39
      '             else '#39'.'#39' end'
      '|| c.cod_categoria) ordem, c.cod_categoria, c.descricao, '
      
        '        (case when (coalesce(c2.cod_categoria_pai, 0) = 0) then ' +
        '('#39'    >  '#39' ||c.cod_categoria)'
      '              else ('#39'         >  '#39'||c.cod_categoria) end'
      
        '||'#39' - '#39' || trim(coalesce(c.descricao, '#39#39'))) descricao2, c.cod_em' +
        'presa'
      ' from categoria c '
      
        'inner join categoria c2 on c.cod_categoria_pai = c2.cod_categori' +
        'a and c.cod_empresa = c2.cod_empresa '
      'where c.cod_categoria_pai is not null and c.cod_empresa =  1'
      'order by 1 asc')
    Left = 2774
    Top = 240
  end
  object dspConsCategoria: TDataSetProvider
    DataSet = qrConsCategoria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2771
    Top = 289
  end
  object cdsConsCategoria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsCategoria'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2771
    Top = 338
    object cdsConsCategoriaCOD_CATEGORIA: TIntegerField
      FieldName = 'COD_CATEGORIA'
      Required = True
    end
    object cdsConsCategoriaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConsCategoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsConsCategoriaORDEM: TStringField
      FieldName = 'ORDEM'
      Size = 35
    end
    object cdsConsCategoriaDESCRICAO2: TStringField
      FieldName = 'DESCRICAO2'
      Size = 76
    end
  end
  object dsConsCategoria: TDataSource
    DataSet = cdsConsCategoria
    Left = 2769
    Top = 387
  end
  object qrProdutosEC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from produtos_ec'
      'where grupo_prod = :grupo_prod'
      'and cod_prod = :cod_prod'
      'and cod_empresa = :cod_empresa')
    Left = 2534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspProdutosEC: TDataSetProvider
    DataSet = qrProdutosEC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2531
    Top = 41
  end
  object cdsProdutosEC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosEC'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2531
    Top = 90
    object cdsProdutosECGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosECCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosECCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosECDESCR_PROD_RES: TStringField
      DisplayLabel = 'Descricao Resumida E-Commerce'
      FieldName = 'DESCR_PROD_RES'
      Size = 131
    end
    object cdsProdutosECDESCR_PROD_COMPL: TMemoField
      DisplayLabel = 'Descricao Completa E-Commerce'
      FieldName = 'DESCR_PROD_COMPL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsProdutosECSINC_ECOMMERCE: TStringField
      DisplayLabel = 'Sinc E-commerce'
      FieldName = 'SINC_ECOMMERCE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECDISPONIVEL: TStringField
      DisplayLabel = 'Disponivel'
      FieldName = 'DISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECPROMOCIONAL: TStringField
      DisplayLabel = 'Promocional'
      FieldName = 'PROMOCIONAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECFRETE_GRATIS: TStringField
      DisplayLabel = 'Frete Gratis'
      FieldName = 'FRETE_GRATIS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECLANCAMENTO: TStringField
      DisplayLabel = 'Lancamento'
      FieldName = 'LANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECDESTAQUE: TStringField
      DisplayLabel = 'Destaque'
      FieldName = 'DESTAQUE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECVARIACAO: TStringField
      DisplayLabel = 'Termos Aceite'
      FieldName = 'VARIACAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECTERMOS_ACEITE: TStringField
      DisplayLabel = 'Termos Aceite'
      FieldName = 'TERMOS_ACEITE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECCOMPREJUNTO: TStringField
      DisplayLabel = 'Compre Junto'
      FieldName = 'COMPREJUNTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECVIRTUAL: TStringField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECCOD_CATEGORIA: TIntegerField
      DisplayLabel = 'Cod Categoria'
      FieldName = 'COD_CATEGORIA'
    end
    object cdsProdutosECESTOQUE_EC: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE_EC'
    end
    object cdsProdutosECESTOQUE_MIN_EC: TFloatField
      DisplayLabel = 'Estoque Minimo'
      FieldName = 'ESTOQUE_MIN_EC'
    end
    object cdsProdutosECENV_COMERCIO_ABERTO: TStringField
      DisplayLabel = 'Env Comercio Aberto'
      FieldName = 'ENV_COMERCIO_ABERTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object cdsProdutosECID_COMERCIO_ABERTO: TIntegerField
      DisplayLabel = 'Id Comercio Aberto'
      FieldName = 'ID_COMERCIO_ABERTO'
    end
    object cdsProdutosECPRECO_A_COMBINAR_EC: TStringField
      DisplayLabel = 'Preco Combinar'
      FieldName = 'PRECO_A_COMBINAR_EC'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECPRECO_A_COMBINAR_CA: TStringField
      DisplayLabel = 'Preco Combinar'
      FieldName = 'PRECO_A_COMBINAR_CA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECTITULO_PAGINA: TStringField
      DisplayLabel = 'Titulo Pagina'
      FieldName = 'TITULO_PAGINA'
      Size = 131
    end
    object cdsProdutosECPALAVRAS_CHAVES: TStringField
      DisplayLabel = 'Palavras Chaves'
      FieldName = 'PALAVRAS_CHAVES'
      Size = 131
    end
    object cdsProdutosECURL_ACESSO: TStringField
      DisplayLabel = 'Url Acesso'
      FieldName = 'URL_ACESSO'
      Size = 131
    end
  end
  object dsProdutosEC: TDataSource
    DataSet = cdsProdutosEC
    Left = 2529
    Top = 139
  end
  object qrProdutosImagens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select i.* from produtos_imagens i'
      
        'inner join grade g on g.cod_grade = i.cod_grade and g.cod_empres' +
        'a = i.cod_empresa and g.ativo = 1'
      'where i.grupo_prod = 1'
      'and i.cod_prod = '#39'01126'#39
      'and i.cod_empresa = 1')
    Left = 2630
  end
  object dspProdutosImagens: TDataSetProvider
    DataSet = qrProdutosImagens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2627
    Top = 41
  end
  object cdsProdutosImagens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosImagens'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2627
    Top = 90
    object cdsProdutosImagensGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosImagensCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosImagensCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsProdutosImagensCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosImagensLISTA_IMAGENS: TMemoField
      FieldName = 'LISTA_IMAGENS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsProdutosImagensURL_IMAGENS: TMemoField
      FieldName = 'URL_IMAGENS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsProdutosImagensUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsProdutosImagensDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
    end
    object cdsProdutosImagensUS_ALT: TIntegerField
      FieldName = 'US_ALT'
    end
    object cdsProdutosImagensDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
    end
  end
  object dsProdutosImagens: TDataSource
    DataSet = cdsProdutosImagens
    Left = 2625
    Top = 139
  end
  object qrProdutosECgrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select produtos_ec_grade.*, grade.descricao from produtos_ec_gra' +
        'de'
      
        'inner join grade on grade.cod_grade = produtos_ec_grade.cod_grad' +
        'e '
      'and grade.cod_empresa = produtos_ec_grade.cod_empresa'
      'where produtos_ec_grade.grupo_prod = :grupo_prod'
      'and produtos_ec_grade.cod_prod = :cod_prod'
      'and produtos_ec_grade.cod_empresa = :cod_empresa')
    Left = 2742
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspProdutosECgrade: TDataSetProvider
    DataSet = qrProdutosECgrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2739
    Top = 41
  end
  object cdsProdutosECgrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosECgrade'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2739
    Top = 90
    object cdsProdutosECgradeGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosECgradeCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosECgradeCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsProdutosECgradeCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosECgradeESTOQUE_EC: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE_EC'
    end
    object cdsProdutosECgradeESTOQUE_MIN_EC: TFloatField
      DisplayLabel = 'Estoque Min'
      FieldName = 'ESTOQUE_MIN_EC'
    end
    object cdsProdutosECgradeDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldKind = fkInternalCalc
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsProdutosECgradeID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object cdsProdutosECgradeID_COMERCIO_ABERTO: TIntegerField
      DisplayLabel = 'Id Comercio Aberto'
      FieldName = 'ID_COMERCIO_ABERTO'
    end
    object cdsProdutosECgradeSINC_ECOMMERCE: TStringField
      DisplayLabel = 'Sinc Ecommerce'
      FieldName = 'SINC_ECOMMERCE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosECgradeENV_COMERCIO_ABERTO: TStringField
      DisplayLabel = 'Env Comercio Aberto'
      FieldName = 'ENV_COMERCIO_ABERTO'
      FixedChar = True
      Size = 1
    end
  end
  object dsProdutosECgrade: TDataSource
    DataSet = cdsProdutosECgrade
    Left = 2737
    Top = 139
  end
  object qrConsGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from grade'
      'where cod_empresa = :cod_empresa')
    Left = 2862
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspConsGrade: TDataSetProvider
    DataSet = qrConsGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2859
    Top = 41
  end
  object cdsConsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsGrade'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2859
    Top = 90
    object cdsConsGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsConsGradeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConsGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsConsGradeDESCRICAO1: TStringField
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsConsGradeATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsConsGrade: TDataSource
    DataSet = cdsConsGrade
    Left = 2857
    Top = 139
  end
  object qrGradesImagens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select 0 cod_grade, '#39'PRINCIPAL'#39' descricao, '#39#39' lista_imagens, '#39'se' +
        'm url'#39' url_imagens from rdb$database'
      'union'
      
        'select gr.cod_grade, gr.descricao, p.lista_imagens, p.url_imagen' +
        's from grade gr'
      'left join produtos_imagens p on'
      
        '    p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.' +
        'cod_grade = gr.cod_grade'
      
        'where gr.cod_empresa = :cod_empresa and gr.cod_grade > 0 and gr.' +
        'ativo = 1'
      'and (select count(*) from cod_grade_prod cg'
      
        '    where cg.grupo_prod = :grupo_prod and cg.cod_prod = :cod_pro' +
        'd and cg.cod_empresa = :cod_empresa) <> 0')
    Left = 2894
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspGradesImagens: TDataSetProvider
    DataSet = qrGradesImagens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2891
    Top = 289
  end
  object cdsGradesImagens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradesImagens'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2891
    Top = 338
    object cdsGradesImagensCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsGradesImagensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsGradesImagensLISTA_IMAGENS: TMemoField
      FieldName = 'LISTA_IMAGENS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsGradesImagensURL_IMAGENS: TMemoField
      FieldName = 'URL_IMAGENS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsGradesImagens: TDataSource
    DataSet = cdsGradesImagens
    Left = 2889
    Top = 387
  end
  object dsCadCategorias: TDataSource
    DataSet = cdsCadCategorias
    Left = 1634
    Top = 606
  end
  object cdsCadCategorias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadCategorias'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1634
    Top = 560
    object cdsCadCategoriasSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      ProviderFlags = [pfInWhere]
      Size = 1
    end
    object cdsCadCategoriasCOD_CATEGORIA: TIntegerField
      DisplayLabel = 'Cod Categoria'
      FieldName = 'COD_CATEGORIA'
      Required = True
    end
    object cdsCadCategoriasCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCadCategoriasDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsCadCategoriasCOD_CATEGORIA_PAI: TIntegerField
      DisplayLabel = 'Cod Nivel Categoria'
      FieldName = 'COD_CATEGORIA_PAI'
    end
    object cdsCadCategoriasID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object cdsCadCategoriasATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dspCadCategorias: TDataSetProvider
    DataSet = qrCadCategorias
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1634
    Top = 510
  end
  object qrCadCategorias: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from categoria ')
    Left = 1634
    Top = 462
  end
  object dsCategoriaPai: TDataSource
    DataSet = cdsCategoriaPai
    Left = 1722
    Top = 606
  end
  object cdsCategoriaPai: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCategoriaPai'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1722
    Top = 560
    object IntegerField30: TIntegerField
      DisplayLabel = 'Cod Categoria'
      FieldName = 'COD_CATEGORIA'
      Required = True
    end
    object IntegerField31: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField67: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsCategoriaPaiORDEM: TStringField
      FieldName = 'ORDEM'
      FixedChar = True
      Size = 1
    end
    object cdsCategoriaPaiNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
  end
  object dspCategoriaPai: TDataSetProvider
    DataSet = qrCategoriaPai
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1722
    Top = 510
  end
  object qrCategoriaPai: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select '#39'0'#39' ordem, cod_categoria, cod_empresa, descricao, 0 nivel' +
        ' from categoria')
    Left = 1722
    Top = 462
  end
  object qrGrupoProdSimilares: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from prod_similares_grupos')
    Left = 2982
  end
  object dspGrupoProdSimilares: TDataSetProvider
    DataSet = qrGrupoProdSimilares
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2979
    Top = 49
  end
  object cdsGrupoProdSimilares: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupoProdSimilares'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2979
    Top = 90
    object cdsGrupoProdSimilaresSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsGrupoProdSimilaresCOD_GRUPO_SIM: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_GRUPO_SIM'
      Required = True
    end
    object cdsGrupoProdSimilaresCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGrupoProdSimilaresDESCR_GRUPO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_GRUPO'
      Size = 75
    end
    object cdsGrupoProdSimilaresATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsGrupoProdSimilares: TDataSource
    DataSet = cdsGrupoProdSimilares
    Left = 2977
    Top = 139
  end
  object qrGrupoProdSimilaresItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select ps.*, pr.num_fab_prod, pr.descr_prod from prod_similares_' +
        'grupos_itens ps'
      
        'inner join produtos pr on ps.grupo_prod = pr.grupo_prod and ps.c' +
        'od_prod = pr.cod_prod and ps.cod_empresa = pr.cod_empresa'
      
        'where ps.cod_grupo_sim = :codigo and ps.cod_empresa = :cod_empre' +
        'sa')
    Left = 3110
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspGrupoProdSimilaresItens: TDataSetProvider
    DataSet = qrGrupoProdSimilaresItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3107
    Top = 49
  end
  object cdsGrupoProdSimilaresItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupoProdSimilaresItens'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3107
    Top = 90
    object cdsGrupoProdSimilaresItensCOD_GRUPO_SIM: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'COD_GRUPO_SIM'
      Required = True
      Visible = False
    end
    object cdsGrupoProdSimilaresItensCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsGrupoProdSimilaresItensGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsGrupoProdSimilaresItensCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGrupoProdSimilaresItensNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
    end
    object cdsGrupoProdSimilaresItensDESCR_PROD: TStringField
      DisplayLabel = 'Descr Prod'
      FieldName = 'DESCR_PROD'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
      Size = 75
    end
    object cdsGrupoProdSimilaresItensPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      FixedChar = True
      Size = 1
    end
  end
  object dsGrupoProdSimilaresItens: TDataSource
    DataSet = cdsGrupoProdSimilaresItens
    Left = 3105
    Top = 139
  end
  object qrGradeProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select 0 cod_grade, 1 cod_empresa, '#39'PRINCIPAL'#39' descricao from rd' +
        'b$database'
      'union'
      'select cod_grade, cod_empresa, descricao from grade'
      'where cod_empresa = 1'
      'and cod_grade > 0'
      'and ativo = 1'
      'order by 1')
    Left = 3238
  end
  object dspGradeProd: TDataSetProvider
    DataSet = qrGradeProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3235
    Top = 49
  end
  object cdsGradeProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeProd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3235
    Top = 90
    object cdsGradeProdCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsGradeProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsGradeProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 32
    end
  end
  object dsGradeProd: TDataSource
    DataSet = cdsGradeProd
    Left = 3233
    Top = 139
  end
  object dsMarcaProduto: TDataSource
    DataSet = cdsMarcaProduto
    Left = 1810
    Top = 606
  end
  object cdsMarcaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarcaProduto'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1810
    Top = 560
    object cdsMarcaProdutoCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Required = True
    end
    object cdsMarcaProdutoDESCRICAO_MARCA: TStringField
      FieldName = 'DESCRICAO_MARCA'
      FixedChar = True
      Size = 30
    end
  end
  object dspMarcaProduto: TDataSetProvider
    DataSet = qrMarcaProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1810
    Top = 510
  end
  object qrMarcaProduto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'SELECT * FROM MARCA_PROD '
      'WHERE ATIVO = 1')
    Left = 1810
    Top = 462
  end
  object dsProdutosECCons: TDataSource
    DataSet = cdsProdutosECCons
    Left = 1906
    Top = 606
  end
  object cdsProdutosECCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosECCons'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1906
    Top = 560
  end
  object dspProdutosECCons: TDataSetProvider
    DataSet = qrProdutosECCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1906
    Top = 510
  end
  object qrProdutosECCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'SELECT * FROM MARCA_PROD '
      'WHERE ATIVO = 1')
    Left = 1906
    Top = 462
  end
  object IBQuery2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    SQL.Strings = (
      'select kits_prod.*, '
      '0 QUANT_PROD_KIT,'
      '0 PREC_CUS_PROD,'
      '0 PREC_CUSM_PROD,'
      '0 PREC_TAB_PROD,'
      '0 PREC_PUBLICO,'
      '0 PREC_30_PROD,'
      '0 PREC_60_PROD,'
      '0 PREC_90_PROD,'
      '0 EST_F  from kits_prod where 1=0')
    Left = 1508
    Top = 742
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = IBQuery2
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1508
    Top = 686
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKits'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1420
    Top = 703
    object IntegerField32: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo do Kit'
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object IntegerField33: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField68: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do Kit'
      FieldName = 'DESCRICAO_KIT'
      FixedChar = True
      Size = 40
    end
    object StringField71: TStringField
      DisplayLabel = 'Kit Completo'
      FieldName = 'KIT_TODO'
      FixedChar = True
      Size = 1
    end
    object FloatField80: TFloatField
      DisplayLabel = 'Total Quantidade'
      FieldName = 'QUANT_PROD_KIT'
      DisplayFormat = '##0.000'
    end
    object FloatField83: TFloatField
      Tag = 3
      DisplayLabel = 'Total Preco Custo'
      FieldName = 'PREC_CUS_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField84: TFloatField
      Tag = 3
      DisplayLabel = 'Total Preco Custo Medio'
      FieldName = 'PREC_CUSM_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField85: TFloatField
      DisplayLabel = 'Total Preco de Tabela'
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField86: TFloatField
      DisplayLabel = 'Total Preco de Atacado'
      FieldName = 'PREC_PUBLICO'
      DisplayFormat = '##0.00'
    end
    object FloatField87: TFloatField
      DisplayLabel = 'Total Preco 30 dias'
      FieldName = 'PREC_30_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField88: TFloatField
      DisplayLabel = 'Total Preco 60 dias'
      FieldName = 'PREC_60_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField89: TFloatField
      DisplayLabel = 'Total Preco 90 dias'
      FieldName = 'PREC_90_PROD'
      DisplayFormat = '##0.00'
    end
    object FloatField90: TFloatField
      DisplayLabel = 'Total Estoque Fisico'
      FieldName = 'EST_F'
      DisplayFormat = '##0.000'
    end
    object IntegerField34: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 1428
    Top = 752
  end
  object qrKitsEC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    SQL.Strings = (
      'select kits_prod_ec.* from kits_prod_ec where 1=0')
    Left = 2996
    Top = 238
  end
  object dspKitsEC: TDataSetProvider
    DataSet = qrKitsEC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2996
    Top = 286
  end
  object cdsKitsEC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKitsEC'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2996
    Top = 335
    object cdsKitsECCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object cdsKitsECCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsKitsECDESCR_KIT_RES: TStringField
      FieldName = 'DESCR_KIT_RES'
      Size = 131
    end
    object cdsKitsECDESCR_KIT_COMPL: TMemoField
      FieldName = 'DESCR_KIT_COMPL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsKitsECSINC_ECOMMERCE: TStringField
      FieldName = 'SINC_ECOMMERCE'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECDISPONIVEL: TStringField
      FieldName = 'DISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECPROMOCIONAL: TStringField
      FieldName = 'PROMOCIONAL'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECFRETE_GRATIS: TStringField
      FieldName = 'FRETE_GRATIS'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECDESTAQUE: TStringField
      FieldName = 'DESTAQUE'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECVARIACAO: TStringField
      FieldName = 'VARIACAO'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECTERMOS_ACEITE: TStringField
      FieldName = 'TERMOS_ACEITE'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECCOMPREJUNTO: TStringField
      FieldName = 'COMPREJUNTO'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECVIRTUAL: TStringField
      FieldName = 'VIRTUAL'
      FixedChar = True
      Size = 1
    end
    object cdsKitsECCOD_CATEGORIA: TIntegerField
      FieldName = 'COD_CATEGORIA'
    end
    object cdsKitsECID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object cdsKitsECREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsKitsECCOD_EAN: TStringField
      FieldName = 'COD_EAN'
    end
    object cdsKitsECREGRA_PESO_DIM: TStringField
      FieldName = 'REGRA_PESO_DIM'
    end
    object cdsKitsECPESO_BRUT_KIT: TFloatField
      FieldName = 'PESO_BRUT_KIT'
    end
    object cdsKitsECALTURA_KIT: TFloatField
      FieldName = 'ALTURA_KIT'
    end
    object cdsKitsECLARGURA_KIT: TFloatField
      FieldName = 'LARGURA_KIT'
    end
    object cdsKitsECCOMPRIMENTO_KIT: TFloatField
      FieldName = 'COMPRIMENTO_KIT'
    end
    object cdsKitsECDESCONTO_VALOR: TFloatField
      FieldName = 'DESCONTO_VALOR'
      DisplayFormat = '##0.00'
    end
    object cdsKitsECDESCONTO_PERC: TFloatField
      FieldName = 'DESCONTO_PERC'
      DisplayFormat = '##0.000'
    end
    object cdsKitsECTITULO_PAGINA: TStringField
      DisplayLabel = 'Titulo Pagina'
      FieldName = 'TITULO_PAGINA'
      Size = 131
    end
    object cdsKitsECPALAVRAS_CHAVES: TStringField
      DisplayLabel = 'Palavras Chaves'
      FieldName = 'PALAVRAS_CHAVES'
      Size = 131
    end
    object cdsKitsECURL_ACESSO: TStringField
      DisplayLabel = 'URL Acesso'
      FieldName = 'URL_ACESSO'
      Size = 131
    end
    object cdsKitsECPRECO_A_COMBINAR_EC: TStringField
      DisplayLabel = 'Preco Combinar'
      FieldName = 'PRECO_A_COMBINAR_EC'
      FixedChar = True
      Size = 1
    end
  end
  object dsKitsEC: TDataSource
    DataSet = cdsKitsEC
    Left = 2996
    Top = 384
  end
  object qrConsCategoriaKit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select (c.cod_categoria) ordem, c.cod_categoria, c.descricao, '
      
        '(c.cod_categoria || '#39' - '#39' || trim(coalesce(c.descricao, '#39#39#39#39'))) ' +
        'descricao2,'
      'c.cod_empresa from categoria c '
      'where coalesce(c.cod_categoria_pai, 0) = 0 and c.cod_empresa = 1'
      'union '
      
        'select (case when (coalesce(c2.cod_categoria_pai, 0) = 0) then '#39 +
        #39
      '             else (coalesce(c2.cod_categoria_pai, 0) || '#39'-'#39') end'
      '|| c2.cod_categoria || '
      
        '              case when (coalesce(c2.cod_categoria_pai, 0) = 0) ' +
        'then '#39'-'#39
      '             else '#39'.'#39' end'
      '|| c.cod_categoria) ordem, c.cod_categoria, c.descricao, '
      
        '        (case when (coalesce(c2.cod_categoria_pai, 0) = 0) then ' +
        '('#39'    >  '#39' ||c.cod_categoria)'
      '              else ('#39'         >  '#39'||c.cod_categoria) end'
      
        '||'#39' - '#39' || trim(coalesce(c.descricao, '#39#39'))) descricao2, c.cod_em' +
        'presa'
      ' from categoria c '
      
        'inner join categoria c2 on c.cod_categoria_pai = c2.cod_categori' +
        'a and c.cod_empresa = c2.cod_empresa '
      'where c.cod_categoria_pai is not null and c.cod_empresa =  1'
      'order by 1 asc')
    Left = 3206
    Top = 240
  end
  object dspConsCategoriaKit: TDataSetProvider
    DataSet = qrConsCategoriaKit
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3203
    Top = 289
  end
  object cdsConsCategoriaKit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsCategoriaKit'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3203
    Top = 338
    object IntegerField35: TIntegerField
      FieldName = 'COD_CATEGORIA'
      Required = True
    end
    object IntegerField36: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField72: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object StringField73: TStringField
      FieldName = 'ORDEM'
      Size = 35
    end
    object StringField74: TStringField
      FieldName = 'DESCRICAO2'
      Size = 76
    end
  end
  object dsConsCategoriaKit: TDataSource
    DataSet = cdsConsCategoriaKit
    Left = 3201
    Top = 387
  end
  object qrCategoriaKit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    SQL.Strings = (
      'select * from kits_prod_categoria'
      'where codigo_kit = :codigo_kit'
      'and cod_empresa = :cod_empresa')
    Left = 3102
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_kit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspCategoriaKit: TDataSetProvider
    DataSet = qrCategoriaKit
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3099
    Top = 289
  end
  object cdsCategoriaKit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCategoriaKit'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3099
    Top = 338
    object IntegerField37: TIntegerField
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object IntegerField38: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField39: TIntegerField
      FieldName = 'COD_CATEGORIA'
      Required = True
    end
  end
  object dsCategoriaKit: TDataSource
    DataSet = cdsCategoriaKit
    Left = 3097
    Top = 387
  end
  object qrKitsTot: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    SQL.Strings = (
      'SELECT'
      'KITS_PROD_KITS.CODIGO_KIT,'
      'KITS_PROD_KITS.COD_EMPRESA,'
      'KITS_PROD_KITS.SINC_ECOMMERCE,'
      
        'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
        'CE(PRODUTOS.PESO_BRUT_PROD, 0)), 0) PESO_BRUT_PROD,'
      
        'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
        'CE(PRODUTOS.COMPRIMENTO_PROD, 0)), 0) COMPRIMENTO_PROD,'
      
        'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
        'CE(PRODUTOS.LARGURA_PROD, 0)), 0) LARGURA_PROD,'
      
        'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
        'CE(PRODUTOS.ALTURA_PROD, 0)), 0) ALTURA_PROD FROM KITS_PROD_KITS'
      
        'INNER JOIN PRODUTOS ON PRODUTOS.GRUPO_PROD = KITS_PROD_KITS.GRUP' +
        'O_PROD AND PRODUTOS.COD_PROD = KITS_PROD_KITS.COD_PROD AND PRODU' +
        'TOS.COD_EMPRESA = KITS_PROD_KITS.COD_EMPRESA'
      'WHERE KITS_PROD_KITS.CODIGO_KIT = 1'
      'AND KITS_PROD_KITS.COD_EMPRESA = 1'
      'GROUP BY 1, 2, 3')
    Left = 3324
    Top = 246
  end
  object dspKitsTot: TDataSetProvider
    DataSet = qrKitsTot
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3324
    Top = 294
  end
  object cdsKitsTot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKitsTot'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3324
    Top = 343
    object cdsKitsTotCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object cdsKitsTotCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsKitsTotSINC_ECOMMERCE: TStringField
      FieldName = 'SINC_ECOMMERCE'
      FixedChar = True
      Size = 1
    end
    object cdsKitsTotPESO_BRUT_PROD: TFloatField
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsKitsTotCOMPRIMENTO_PROD: TFloatField
      FieldName = 'COMPRIMENTO_PROD'
    end
    object cdsKitsTotLARGURA_PROD: TFloatField
      FieldName = 'LARGURA_PROD'
    end
    object cdsKitsTotALTURA_PROD: TFloatField
      FieldName = 'ALTURA_PROD'
    end
  end
  object dsKitsTot: TDataSource
    DataSet = cdsKitsTot
    Left = 3324
    Top = 392
  end
  object qrItKit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKits
    SQL.Strings = (
      'select ik.*, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.prec_cus_prod, 0))' +
        ' prec_cus_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.prec_cusm_prod, 0)' +
        ') prec_cusm_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.prec_tab_prod, 0))' +
        ' prec_tab_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.prec_publico, 0)) ' +
        'prec_publico, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.prec_30_prod, 0)) ' +
        'prec_30_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.prec_60_prod, 0)) ' +
        'prec_60_prod,'
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.prec_90_prod, 0)) ' +
        'prec_90_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.peso_brut_prod, 0)' +
        ') peso_brut_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.comprimento_prod, ' +
        '0)) comprimento_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.largura_prod, 0)) ' +
        'largura_prod, '
      
        '(coalesce(ik.quant_prod_kit, 0) * coalesce(pr.altura_prod, 0)) a' +
        'ltura_prod, '
      '(coalesce(pr.est_f, 0)) est_f, '
      '(coalesce(pe.id_commerce, 0)) id_commerce_prod, '
      
        '(select valor_tab_pro FROM retorna_ec_vltb_prom(ik.grupo_prod, i' +
        'k.cod_prod, ik.cod_empresa)) preco_un_ecommerce, '
      
        '(coalesce(ik.quant_prod_kit, 0) * (select valor_tab_pro FROM ret' +
        'orna_ec_vltb_prom(ik.grupo_prod, ik.cod_prod, ik.cod_empresa))) ' +
        'preco_ecommerce, '
      
        '(select desc_tabela from retorna_ec_vltb_prom(ik.grupo_prod, ik.' +
        'cod_prod, ik.cod_empresa)) tab_preco_ecommerce, '
      
        '((coalesce(ik.quant_prod_kit, 0) * (select valor_tab_pro FROM re' +
        'torna_ec_vltb_prom(ik.grupo_prod, ik.cod_prod, ik.cod_empresa)))' +
        ' - coalesce(ik.rateio_desc, 0)) preco_desc_ecommerce '
      'from kits_prod_kits ik '
      
        'left join produtos pr on pr.grupo_prod = ik.grupo_prod and pr.co' +
        'd_prod = ik.cod_prod and pr.cod_empresa = ik.cod_empresa '
      
        'left join produtos_ec pe on pe.grupo_prod = ik.grupo_prod and pe' +
        '.cod_prod = ik.cod_prod and pe.cod_empresa = ik.cod_empresa '
      'where ik.codigo_kit =  0'
      'and ik.cod_empresa =  0'
      'and ik.ativo =1')
    Left = 907
    Top = 238
  end
  object cdsItKit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItKit'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 907
    Top = 334
    object cdsItKitCODIGO_KIT: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod  Kit'
      FieldName = 'CODIGO_KIT'
      Required = True
      Visible = False
    end
    object cdsItKitGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsItKitCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItKitCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsItKitNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsItKitDESCR_PROD_KIT: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DESCR_PROD_KIT'
      FixedChar = True
      Size = 40
    end
    object cdsItKitQUANT_PROD_KIT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_PROD_KIT'
      DisplayFormat = '##0.000'
    end
    object cdsItKitATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsItKitSINC_ECOMMERCE: TStringField
      DisplayLabel = 'Sinc Ecommerce'
      FieldName = 'SINC_ECOMMERCE'
      FixedChar = True
      Size = 1
    end
    object cdsItKitEST_F: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.000'
    end
    object cdsItKitPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Varejo'
      FieldName = 'PREC_TAB_PROD'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o Atacado'
      FieldName = 'PREC_PUBLICO'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPREC_CUS_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PREC_CUS_PROD'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio Desconto'
      FieldName = 'RATEIO_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsItKitPESO_BRUT_PROD: TFloatField
      DisplayLabel = 'Peso (Kg)'
      FieldName = 'PESO_BRUT_PROD'
      ProviderFlags = [pfInWhere]
    end
    object cdsItKitCOMPRIMENTO_PROD: TFloatField
      DisplayLabel = 'Comprimento (cm)'
      FieldName = 'COMPRIMENTO_PROD'
      ProviderFlags = [pfInWhere]
    end
    object cdsItKitLARGURA_PROD: TFloatField
      DisplayLabel = 'Largura (cm)'
      FieldName = 'LARGURA_PROD'
      ProviderFlags = [pfInWhere]
    end
    object cdsItKitALTURA_PROD: TFloatField
      DisplayLabel = 'Altura (cm)'
      FieldName = 'ALTURA_PROD'
      ProviderFlags = [pfInWhere]
    end
    object cdsItKitID_COMMERCE_PROD: TLargeintField
      DisplayLabel = 'Id Ecommerce Prod'
      FieldName = 'ID_COMMERCE_PROD'
    end
    object cdsItKitPRECO_DESC_ECOMMERCE: TFloatField
      DisplayLabel = 'Preco Ecommerce Liquido'
      FieldName = 'PRECO_DESC_ECOMMERCE'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPRECO_UN_ECOMMERCE: TFloatField
      DisplayLabel = 'Preco Produto Ecommerce'
      FieldName = 'PRECO_UN_ECOMMERCE'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitPRECO_ECOMMERCE: TFloatField
      DisplayLabel = 'Preco Ecommerce Bruto'
      FieldName = 'PRECO_ECOMMERCE'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.00'
    end
    object cdsItKitTAB_PRECO_ECOMMERCE: TStringField
      DisplayLabel = 'Tab Preco Ecommerce'
      FieldName = 'TAB_PRECO_ECOMMERCE'
      ProviderFlags = [pfInWhere]
      Size = 128
    end
  end
  object dspItKit: TDataSetProvider
    DataSet = qrItKit
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 907
    Top = 286
  end
  object qrPrecosPorEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select p.ordem, tp.tipo, tp.descr_tipo, '
      'case when coalesce(l.cod_localidade, 0) > 0 then l.localidade '
      ' when coalesce(st.cod_setor, 0) > 0 then st.setor '
      '  when coalesce(cd.cod_cidade, 0) > 0 then cd.nome_cidade '
      '  else p.descr_promocao '
      
        'end descricao, pp.valor_promocao, pp.porcentagem, pp.max_desc, p' +
        'r.cod_empresa '
      'from promocao_produto pp '
      
        'inner join tipo_preco tp on tp.cod_tppreco = pp.cod_tppreco and ' +
        'tp.cod_empresa = pp.cod_empresa '
      
        'inner join produtos pr on pr.grupo_prod = pp.grupo_prod and pr.c' +
        'od_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa '
      
        'left join localidade l on l.cod_localidade = pp.cod_localidade a' +
        'nd l.cod_empresa = pp.cod_empresa '
      
        'left join setor st on st.cod_setor = pp.cod_setor and st.cod_emp' +
        'resa = pp.cod_empresa '
      'left join cidades cd on cd.cod_cidade = pp.cod_cidade '
      
        'inner join promocao p on p.cod_promocao = pp.cod_promocao and p.' +
        'cod_tppreco = pp.cod_tppreco and p.cod_empresa = pp.cod_empresa '
      'where pr.ativo = 1 and pp.cod_empresa = :cod_empresa'
      'and pr.grupo_prod = :grupo_prod'
      'and pr.cod_prod = :cod_prod'
      
        'and (((tp.tipo = '#39'P'#39') and (pp.data_ini <= current_timestamp and ' +
        'pp.data_fim >= current_timestamp)) or (tp.tipo = '#39'T'#39')) '
      'union '
      'select 1 ordem, '#39'Z'#39' tipo, '#39'QUANTIDADE'#39' descr_tipo, '
      
        '('#39'QUANTIDADE MAIOR OU IGUAL '#39'||  replace(cast(pq.quant as numeri' +
        'c(8,3)), '#39'.'#39', '#39','#39') ) descricao, '
      
        'pq.preco_venda valor_promocao, 0 porcentagem, 0 max_desc, pr.cod' +
        '_empresa  from preco_produtos_qtde pq '
      
        'inner join produtos pr on pr.grupo_prod = pq.grupo_prod and pr.c' +
        'od_prod = pq.cod_prod and pr.cod_empresa = pq.cod_empresa '
      'where pr.ativo = 1 '
      'and pr.cod_empresa = :cod_empresa'
      'and pr.grupo_prod = :grupo_prod'
      'and pr.cod_prod = :cod_prod'
      'order by 2, 1 ')
    Left = 48
    Top = 880
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end>
  end
  object cdsPrecosPorEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrecosPorEmpresa'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 48
    Top = 984
    object cdsPrecosPorEmpresaCOD_EMPRESA: TIntegerField
      Tag = 2
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPrecosPorEmpresaDESCR_TIPO: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'DESCR_TIPO'
    end
    object cdsPrecosPorEmpresaDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 128
    end
    object cdsPrecosPorEmpresaVALOR_PROMOCAO: TFloatField
      Tag = 2
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_PROMOCAO'
      DisplayFormat = '##0.00'
    end
    object cdsPrecosPorEmpresaPORCENTAGEM: TFloatField
      Tag = 2
      DisplayLabel = 'Acresc/Desc (%)'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '##0.00'
    end
    object cdsPrecosPorEmpresaMAX_DESC: TFloatField
      Tag = 2
      DisplayLabel = 'Desc Max (%)'
      FieldName = 'MAX_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsPrecosPorEmpresaTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo 1'
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsPrecosPorEmpresaORDEM: TIntegerField
      Tag = 1
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
      Visible = False
    end
    object cdsPrecosPorEmpresaMARKUP: TFloatField
      DisplayLabel = 'Markup'
      FieldName = 'MARKUP'
    end
    object cdsPrecosPorEmpresaMARGEM: TFloatField
      DisplayLabel = 'Margem'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM'
    end
  end
  object dsPrecosPorEmpresa: TDataSource
    DataSet = cdsPrecosPorEmpresa
    Left = 48
    Top = 1032
  end
  object dspPrecosPorEmpresa: TDataSetProvider
    DataSet = qrPrecosPorEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 48
    Top = 931
  end
  object qrEstoquePorEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select '
      'pr.grupo_prod,'
      'pr.cod_prod,'
      'pr.cod_empresa, '
      'emp.identificacao_emp, '
      'est.estoque disponivel, '
      '(est.est_f - est.estoque) pendencias,'
      'pr.prec_tab_prod,'
      'pr.prec_publico,'
      'pr.prec_30_prod,'
      'pr.prec_60_prod,'
      'pr.prec_90_prod from empresa emp'
      'inner join produtos pr on emp.cod_empresa = pr.cod_empresa '
      
        'left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr' +
        '.cod_empresa, 0, '#39' '#39', 0, 0) est on 1 = 1'
      
        'where pr.grupo_prod = 1 and pr.cod_prod = '#39'00001 '#39' and pr.cod_em' +
        'presa = 1 and pr.ativo = 1')
    Left = 176
    Top = 880
  end
  object cdsEstoquePorEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoquePorEmpresa'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 176
    Top = 984
    object cdsEstoquePorEmpresaCOD_EMPRESA: TIntegerField
      Tag = 2
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEstoquePorEmpresaDISPONIVEL: TFloatField
      Tag = 2
      DisplayLabel = 'Disponivel'
      FieldName = 'DISPONIVEL'
      DisplayFormat = '##0.0000'
    end
    object cdsEstoquePorEmpresaPENDENCIAS: TFloatField
      Tag = 2
      DisplayLabel = 'Pendencias'
      FieldName = 'PENDENCIAS'
      DisplayFormat = '##0.0000'
    end
    object cdsEstoquePorEmpresaPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Tabela'
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsEstoquePorEmpresaPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o P'#250'blico'
      FieldName = 'PREC_PUBLICO'
      DisplayFormat = '##0.00'
    end
    object cdsEstoquePorEmpresaPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsEstoquePorEmpresaPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsEstoquePorEmpresaPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsEstoquePorEmpresaIDENTIFICACAO_EMP: TStringField
      Tag = 1
      DisplayLabel = 'Nome Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Visible = False
      Size = 64
    end
    object cdsEstoquePorEmpresaCOD_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      Visible = False
      FixedChar = True
      Size = 6
    end
    object cdsEstoquePorEmpresaGRUPO_PROD: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
      Visible = False
    end
  end
  object dsEstoquePorEmpresa: TDataSource
    DataSet = cdsEstoquePorEmpresa
    Left = 176
    Top = 1032
  end
  object dspEstoquePorEmpresa: TDataSetProvider
    DataSet = qrEstoquePorEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 176
    Top = 931
  end
  object dsComissaoFaixaDesconto: TDataSource
    AutoEdit = False
    DataSet = cdsComissaoFaixaDesconto
    Left = 1231
    Top = 835
  end
  object cdsComissaoFaixaDesconto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoFaixaDesconto'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1231
    Top = 783
  end
  object qrComissaoFaixaDesconto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select codigo, descricao from comissao_faixa_desconto')
    Left = 1231
    Top = 681
  end
  object dspComissaoFaixaDesconto: TDataSetProvider
    DataSet = qrComissaoFaixaDesconto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1231
    Top = 732
  end
  object dsEmpresaTipoServ: TDataSource
    DataSet = cdsEmpresaTipoServ
    Left = 2010
    Top = 606
  end
  object cdsEmpresaTipoServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresaTipoServ'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2010
    Top = 560
    object cdsEmpresaTipoServSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEmpresaTipoServCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaTipoServIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 85
    end
  end
  object dspEmpresaTipoServ: TDataSetProvider
    DataSet = qrEmpresaTipoServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2010
    Top = 510
  end
  object qrEmpresaTipoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select cod_empresa, (coalesce(identificacao_emp, nome_emp) ||'#39' -' +
        ' '#39'|| cgc_emp) identificacao_emp from empresa')
    Left = 2010
    Top = 462
  end
  object qrTipoTipoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoServ
    SQL.Strings = (
      'SELECT COD_TIPO_SERVICO, SIGLA, DESCRICAO,'
      
        '(COALESCE(SIGLA, '#39#39') || '#39' - '#39' || COALESCE(DESCRICAO, '#39#39')) SIGLA_' +
        'DESCRICAO  FROM TIPO_TIPO_SERVICO')
    Left = 982
    Top = 457
    object qrTipoTipoServCOD_TIPO_SERVICO: TIntegerField
      FieldName = 'COD_TIPO_SERVICO'
      Origin = '"TIPO_TIPO_SERVICO"."COD_TIPO_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrTipoTipoServSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"TIPO_TIPO_SERVICO"."SIGLA"'
      FixedChar = True
      Size = 1
    end
    object qrTipoTipoServDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 84
    end
    object qrTipoTipoServSIGLA_DESCRICAO: TIBStringField
      FieldName = 'SIGLA_DESCRICAO'
      ProviderFlags = []
      Size = 84
    end
  end
  object dsTipoTipoServ: TDataSource
    DataSet = qrTipoTipoServ
    Left = 983
    Top = 505
  end
  object qrProdutoAcabado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select ac.* from produtos_pdc_var ac '
      'where ac.grupo_prod = 0'
      'and ac.cod_prod = '#39'00000'#39
      'and ac.cod_empresa = 0')
    Left = 304
    Top = 880
  end
  object cdsProdutoAcabado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutoAcabado'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 304
    Top = 984
    object cdsProdutoAcabadoID_IND: TIntegerField
      FieldName = 'ID_IND'
      Required = True
    end
    object cdsProdutoAcabadoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutoAcabadoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutoAcabadoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutoAcabadoCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsProdutoAcabadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 75
    end
  end
  object dsProdutoAcabado: TDataSource
    DataSet = cdsProdutoAcabado
    Left = 304
    Top = 1032
  end
  object dspProdutoAcabado: TDataSetProvider
    DataSet = qrProdutoAcabado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 304
    Top = 931
  end
  object qrProdutoMatPrima: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select it.* from produtos_pdc_var ac '
      'inner join produtos_pdc_var_it it on  '
      '   it.id_ind = ac.id_ind  '
      '   and it.cod_empresa = ac.cod_empresa'
      'where ac.grupo_prod = 0'
      'and ac.cod_prod = '#39'00000'#39' and ac.cod_empresa = 0')
    Left = 424
    Top = 880
  end
  object cdsProdutoMatPrima: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutoMatPrima'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 424
    Top = 984
    object cdsProdutoMatPrimaID_IND: TIntegerField
      FieldName = 'ID_IND'
      Required = True
    end
    object cdsProdutoMatPrimaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutoMatPrimaID_IND_IT: TIntegerField
      FieldName = 'ID_IND_IT'
      Required = True
    end
    object cdsProdutoMatPrimaGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutoMatPrimaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutoMatPrimaCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsProdutoMatPrimaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 75
    end
    object cdsProdutoMatPrimaQUANT: TFloatField
      FieldName = 'QUANT'
      DisplayFormat = '##0.000'
    end
  end
  object dsProdutoMatPrima: TDataSource
    DataSet = cdsProdutoMatPrima
    Left = 424
    Top = 1032
  end
  object dspProdutoMatPrima: TDataSetProvider
    DataSet = qrProdutoMatPrima
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 424
    Top = 931
  end
  object qrProdutoAcabadoGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select cod_grade, cod_empresa, descricao, descricao1,'
      'descricao as descr_grade, descricao1 as descr_grade1 from grade')
    Left = 552
    Top = 880
  end
  object cdsProdutoAcabadoGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutoAcabadoGrade'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 552
    Top = 984
    object cdsProdutoAcabadoGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsProdutoAcabadoGradeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutoAcabadoGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsProdutoAcabadoGradeDESCRICAO1: TStringField
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsProdutoAcabadoGradeDESCR_GRADE: TStringField
      FieldName = 'DESCR_GRADE'
      Size = 32
    end
    object cdsProdutoAcabadoGradeDESCR_GRADE1: TStringField
      FieldName = 'DESCR_GRADE1'
      Size = 32
    end
  end
  object dsProdutoAcabadoGrade: TDataSource
    DataSet = cdsProdutoAcabadoGrade
    Left = 552
    Top = 1032
  end
  object dspProdutoAcabadoGrade: TDataSetProvider
    DataSet = qrProdutoAcabadoGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 552
    Top = 931
  end
  object qrProdutoMatPrimaGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select cod_grade, cod_empresa, descricao, descricao1, descricao ' +
        'as descr_grade, descricao1 as descr_grade1 from grade'
      '')
    Left = 696
    Top = 880
  end
  object cdsProdutoMatPrimaGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutoMatPrimaGrade'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 696
    Top = 984
    object cdsProdutoMatPrimaGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsProdutoMatPrimaGradeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutoMatPrimaGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsProdutoMatPrimaGradeDESCRICAO1: TStringField
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsProdutoMatPrimaGradeDESCR_GRADE: TStringField
      FieldName = 'DESCR_GRADE'
      Size = 32
    end
    object cdsProdutoMatPrimaGradeDESCR_GRADE1: TStringField
      FieldName = 'DESCR_GRADE1'
      Size = 32
    end
    object cdsProdutoMatPrimaGradeQUANT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANT'
      DisplayFormat = '##0.000'
    end
  end
  object dsProdutoMatPrimaGrade: TDataSource
    DataSet = cdsProdutoMatPrimaGrade
    Left = 696
    Top = 1032
  end
  object dspProdutoMatPrimaGrade: TDataSetProvider
    DataSet = qrProdutoMatPrimaGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 696
    Top = 931
  end
  object cdsEtiquetaComum: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1280
    Top = 555
  end
  object dsEtiquetaComum: TDataSource
    DataSet = cdsEtiquetaComum
    Left = 1280
    Top = 610
  end
  object qrGradEt3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPerfilProd
    SQL.Strings = (
      'select * from GRADE')
    Left = 1656
    Top = 678
  end
  object dspGradEt3: TDataSetProvider
    DataSet = qrGradEt3
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1656
    Top = 725
  end
  object cdsGradEt3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradEt3'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1656
    Top = 776
    object IntegerField40: TIntegerField
      DisplayLabel = 'C'#243'd Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object IntegerField41: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField75: TStringField
      DisplayLabel = 'Descri'#231#227'o 1'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object StringField76: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object IntegerField42: TIntegerField
      FieldName = 'ATIVO'
    end
    object IntegerField43: TIntegerField
      DisplayLabel = 'Qtde'
      FieldKind = fkInternalCalc
      FieldName = 'QTDE'
    end
  end
  object dsGradEt3: TDataSource
    DataSet = cdsGradEt3
    Left = 1656
    Top = 823
  end
  object qrConsProdutoAcabado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select produtos.grupo_prod, produtos.cod_prod, produtos.cod_empr' +
        'esa,'
      'produtos.num_fab_prod, produtos.descr_prod,'
      'coalesce(cod_grade_prod.cod_grade, 0) cod_grade,  '
      
        'iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.de' +
        'scricao, '#39'SEM GRADE'#39'), '#39'SEM GRADE'#39') grade,'
      'coalesce(grade.descricao1, '#39'SEM GRADE'#39'), '#39'SEM GRADE'#39') grade1,'
      
        'coalesce((select first 1 produtos_pdc_var.id_ind from produtos_p' +
        'dc_var'
      
        '          where produtos_pdc_var.grupo_prod = produtos.grupo_pro' +
        'd'
      '          and produtos_pdc_var.cod_prod = produtos.cod_prod'
      
        '          and produtos_pdc_var.cod_empresa = produtos.cod_empres' +
        'a'
      
        '                    and produtos_pdc_var.cod_grade = coalesce(co' +
        'd_grade_prod.cod_grade, 0)), 0) id_ind from produtos'
      'left join cod_grade_prod on'
      '    cod_grade_prod.grupo_prod = produtos.grupo_prod'
      '    and cod_grade_prod.cod_prod = produtos.cod_prod'
      '    and cod_grade_prod.cod_empresa = produtos.cod_empresa'
      'left join grade on '
      '    grade.cod_grade = cod_grade_prod.cod_grade '
      '    and grade.cod_empresa = cod_grade_prod.cod_empresa '
      'where produtos.grupo_prod = :pgrupo_prod'
      'and produtos.cod_prod = :pcod_prod'
      'and produtos.cod_empresa = :pcod_empresa')
    Left = 3363
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pgrupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pcod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pcod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspConsProdutoAcabado: TDataSetProvider
    DataSet = qrConsProdutoAcabado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3363
    Top = 48
  end
  object cdsConsProdutoAcabado: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConsProdutoAcabado'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3363
    Top = 96
    object cdsConsProdutoAcabadoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsConsProdutoAcabadoCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsConsProdutoAcabadoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConsProdutoAcabadoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsConsProdutoAcabadoDESCR_PROD: TStringField
      DisplayLabel = 'Descr Prod'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsConsProdutoAcabadoCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsConsProdutoAcabadoGRADE: TStringField
      DisplayLabel = 'Grade'
      FieldName = 'GRADE'
      Size = 32
    end
    object cdsConsProdutoAcabadoGRADE1: TStringField
      FieldName = 'GRADE1'
      Size = 32
    end
    object cdsConsProdutoAcabadoID_IND: TIntegerField
      FieldName = 'ID_IND'
    end
  end
  object dsConsProdutoAcabado: TDataSource
    DataSet = cdsConsProdutoAcabado
    Left = 3360
    Top = 143
  end
  object qrConsMateriasPrimasAcabado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'select produtos.grupo_prod, produtos.cod_prod, produtos.cod_empr' +
        'esa,'
      'produtos.num_fab_prod, produtos.descr_prod,'
      'coalesce(indice_tecnico.quant, 0) quant, '
      
        'iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(cod_gra' +
        'de_prod.cod_grade,  0), 0) cod_grade,'
      
        'iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(grade.d' +
        'escricao, '#39'SEM GRADE'#39'), '#39#39') grade, '
      'coalesce(grade.descricao1, '#39'SEM GRADE'#39'), '#39#39') grade1, '
      '0 id_ind, 0 id_ind_it'
      ' from indice_tecnico'
      'inner join produtos on'
      '    produtos.grupo_prod = indice_tecnico.grupo_prod_mprima'
      '    and produtos.cod_prod = indice_tecnico.cod_prod_mprima'
      '    and produtos.cod_empresa = indice_tecnico.cod_empresa'
      'left join cod_grade_prod on'
      '    cod_grade_prod.grupo_prod = produtos.grupo_prod'
      '    and cod_grade_prod.cod_prod = produtos.cod_prod'
      '    and cod_grade_prod.cod_empresa = produtos.cod_empresa'
      'left join grade on'
      '    grade.cod_grade = cod_grade_prod.cod_grade'
      '    and grade.cod_empresa = cod_grade_prod.cod_empresa'
      'where indice_tecnico.grupo_prod_acabado = 1'
      'and indice_tecnico.cod_prod_acabado = '#39'00124'#39
      'and indice_tecnico.cod_empresa = 1')
    Left = 3511
  end
  object dspConsMateriasPrimasAcabado: TDataSetProvider
    DataSet = qrConsMateriasPrimasAcabado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3511
    Top = 48
  end
  object cdsConsMateriasPrimasAcabado: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConsMateriasPrimasAcabado'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3511
    Top = 96
    object cdsConsMateriasPrimasAcabadoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsConsMateriasPrimasAcabadoCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsConsMateriasPrimasAcabadoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConsMateriasPrimasAcabadoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsConsMateriasPrimasAcabadoDESCR_PROD: TStringField
      DisplayLabel = 'Descr Prod'
      DisplayWidth = 75
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsConsMateriasPrimasAcabadoQUANT: TFloatField
      DisplayLabel = 'Qtde Prima/Em/Emb'
      FieldName = 'QUANT'
      DisplayFormat = '##0.000'
    end
    object cdsConsMateriasPrimasAcabadoCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsConsMateriasPrimasAcabadoGRADE: TStringField
      DisplayLabel = 'Grade'
      FieldName = 'GRADE'
      Size = 32
    end
    object cdsConsMateriasPrimasAcabadoGRADE1: TStringField
      FieldName = 'GRADE1'
      Size = 32
    end
    object cdsConsMateriasPrimasAcabadoID_IND: TIntegerField
      FieldName = 'ID_IND'
    end
    object cdsConsMateriasPrimasAcabadoID_IND_IT: TIntegerField
      FieldName = 'ID_IND_IT'
    end
  end
  object dsConsMateriasPrimasAcabado: TDataSource
    DataSet = cdsConsMateriasPrimasAcabado
    Left = 3508
    Top = 144
  end
  object dsEstoqueDiarioGrade: TDataSource
    DataSet = cdsEstoqueDiarioGrade
    Left = 2312
    Top = 608
  end
  object cdsEstoqueDiarioGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueDiarioGrade'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2311
    Top = 562
  end
  object qrEstoqueDiarioGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        ' select distinct est.dia "Data", est.estoque "Estoque", est.cust' +
        'o_medio "CustoMedio" from estoque_diario est'
      ' where est.tipo = '#39'P'#39' and est.grupo_prod = 6 and'
      ' est.cod_prod = '#39'00002'#39' and est.cod_empresa = 1'
      ' and est.dia >= :dataInicio'
      ' and est.dia <= :dataFim  order by est.dia asc')
    Left = 2312
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end>
  end
  object dspEstoqueDiarioGrade: TDataSetProvider
    DataSet = qrEstoqueDiarioGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2312
    Top = 516
  end
  object dsProdutosAcabados: TDataSource
    DataSet = cdsProdutosAcabados
    Left = 2424
    Top = 608
  end
  object cdsProdutosAcabados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosAcabados'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2423
    Top = 562
    object cdsProdutosAcabadosGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosAcabadosCOD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosAcabadosNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdutosAcabadosQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutosAcabadosPREC_CUSMR_PROD: TFloatField
      DisplayLabel = 'Custo Un'
      FieldName = 'PREC_CUSMR_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutosAcabadosCUSTO: TFloatField
      DisplayLabel = 'Custo Tot'
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutosAcabadosPREC_CUS_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PREC_CUS_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutosAcabadosDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
  end
  object qrProdutosAcabados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select'
      'pi.grupo_prod, pi.cod_prod, pi.num_fab_prod, '
      'coalesce(pi.quantidade, 0) quantidade,'
      
        '(coalesce(pi.quantidade, 0) * coalesce(pi.prec_cusm_prod, 0)) cu' +
        'sto,'
      'coalesce(pi.prec_cus_prod, 0) prec_cus_prod, '
      'coalesce(pi.prec_cusm_prod, 0) prec_cusmr_prod, '
      'pi.descr_prod from producao p '
      'inner join producao_item pi on '
      '  p.cod_producao = pi.cod_producao '
      '  and p.cod_empresa = pi.cod_empresa '
      'inner join produtos pr on '
      '  pr.grupo_prod = pi.grupo_prod '
      '  and pr.cod_prod = pi.cod_prod '
      '  and pr.cod_empresa = pi.cod_empresa '
      'where pi.cod_producao = :cod_producao '
      'and pi.nitem = :nitem '
      'and pi.cod_empresa = :cod_empresa '
      'and p.status = '#39'FECHADO'#39)
    Left = 2424
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_producao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nitem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspProdutosAcabados: TDataSetProvider
    DataSet = qrProdutosAcabados
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2424
    Top = 516
  end
  object dsEstoqueDiarioAcabados: TDataSource
    DataSet = cdsEstoqueDiarioAcabados
    Left = 2545
    Top = 608
  end
  object cdsEstoqueDiarioAcabados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueDiarioAcabados'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2544
    Top = 562
    object DateTimeField14: TDateTimeField
      DisplayWidth = 12
      FieldName = 'Data'
      Required = True
    end
    object FloatField91: TFloatField
      FieldName = 'Estoque'
    end
    object FloatField92: TFloatField
      FieldName = 'CustoMedio'
      DisplayFormat = '##0.000'
    end
    object cdsEstoqueDiarioAcabadosGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsEstoqueDiarioAcabadosCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
  end
  object qrEstoqueDiarioAcabados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        ' select distinct est.grupo_prod, est.cod_prod, est.dia "Data", e' +
        'st.estoque "Estoque", est.custo_medio "CustoMedio" from estoque_' +
        'diario est'
      ' where est.tipo = '#39'P'#39' and est.grupo_prod = 6 and'
      ' est.cod_prod = '#39'00002'#39' and est.cod_empresa = 1'
      ' and est.dia >= :dataInicio'
      ' and est.dia <= :dataFim  order by est.dia asc')
    Left = 2545
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end>
  end
  object dspEstoqueDiarioAcabados: TDataSetProvider
    DataSet = qrEstoqueDiarioAcabados
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2545
    Top = 516
  end
  object dsProdutosMatInsumo: TDataSource
    DataSet = cdsProdutosMatInsumo
    Left = 2856
    Top = 600
  end
  object cdsProdutosMatInsumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosMatInsumo'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2855
    Top = 554
    object IntegerField44: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object StringField77: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object StringField78: TStringField
      DisplayLabel = 'Numero Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdutosMatInsumoQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0.000'
    end
    object FloatField94: TFloatField
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio'
      FieldName = 'PREC_CUSMR_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutosMatInsumoCUSTO: TFloatField
      DisplayLabel = 'Custo Tot'
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.000'
    end
    object StringField79: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object FloatField93: TFloatField
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PREC_CUS_PROD'
      DisplayFormat = '#,##0.000'
    end
  end
  object qrProdutosMatInsumo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select'
      'pii.grupo_prod, pii.cod_prod, pii.num_fab_prod, '
      'coalesce(pii.quantidade_utilizada, 0) quantidade,'
      
        '(coalesce(pii.quantidade_utilizada, 0) * coalesce(pii.prec_cusm_' +
        'prod, 0)) custo,'
      'coalesce(pii.prec_cusm_prod, 0) prec_cus_prod, '
      'coalesce(pii.prec_cusm_prod, 0) prec_cusmr_prod, '
      'pii.descr_prod from producao p '
      'inner join producao_item_indice pii on '
      '  p.cod_producao = pii.cod_producao '
      '  and p.cod_empresa = pii.cod_empresa '
      'inner join produtos pr on '
      '  pr.grupo_prod = pii.grupo_prod '
      '  and pr.cod_prod = pii.cod_prod '
      '  and pr.cod_empresa = pii.cod_empresa '
      'where pii.cod_producao = :cod_producao '
      'and pii.nitem = :nitem '
      'and pii.cod_empresa = :cod_empresa '
      'and p.status = '#39'FECHADO'#39)
    Left = 2856
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_producao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nitem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspProdutosMatInsumo: TDataSetProvider
    DataSet = qrProdutosMatInsumo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2856
    Top = 508
  end
  object dsEstoqueDiarioMatInsumo: TDataSource
    DataSet = cdsEstoqueDiarioMatInsumo
    Left = 2993
    Top = 600
  end
  object cdsEstoqueDiarioMatInsumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueDiarioMatInsumo'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2992
    Top = 554
    object DateTimeField15: TDateTimeField
      DisplayWidth = 12
      FieldName = 'Data'
      Required = True
    end
    object FloatField95: TFloatField
      FieldName = 'Estoque'
    end
    object FloatField96: TFloatField
      FieldName = 'CustoMedio'
      DisplayFormat = '##0.000'
    end
    object cdsEstoqueDiarioMatInsumoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsEstoqueDiarioMatInsumoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
  end
  object qrEstoqueDiarioMatInsumo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        ' select distinct est.grupo_prod, est.cod_prod, est.dia "Data", e' +
        'st.estoque "Estoque", est.custo_medio "CustoMedio" from estoque_' +
        'diario est'
      ' where est.tipo = '#39'P'#39' and est.grupo_prod = 6 and'
      ' est.cod_prod = '#39'00002'#39' and est.cod_empresa = 1'
      ' and est.dia >= :dataInicio'
      ' and est.dia <= :dataFim  order by est.dia asc')
    Left = 2993
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end>
  end
  object dspEstoqueDiarioMatInsumo: TDataSetProvider
    DataSet = qrEstoqueDiarioMatInsumo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2993
    Top = 508
  end
  object dsProdutosAcabadosProducao: TDataSource
    DataSet = cdsProdutosAcabadosProducao
    Left = 2688
    Top = 608
  end
  object cdsProdutosAcabadosProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosAcabadosProducao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2687
    Top = 562
    object cdsProdutosAcabadosProducaoTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 6
    end
    object cdsProdutosAcabadosProducaoNatureza: TStringField
      FieldName = 'Natureza'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsProdutosAcabadosProducaoNumero: TIntegerField
      FieldName = 'Numero'
      ReadOnly = True
    end
    object cdsProdutosAcabadosProducaoNItemId: TIntegerField
      FieldName = 'N Item/Id'
      ReadOnly = True
    end
    object cdsProdutosAcabadosProducaoData: TDateTimeField
      FieldName = 'Data'
      ReadOnly = True
    end
    object cdsProdutosAcabadosProducaoDataConfirmao: TDateTimeField
      FieldName = 'Data Confirma'#231#227'o'
      ReadOnly = True
    end
    object cdsProdutosAcabadosProducaoQtdeDifBal: TFloatField
      FieldName = 'Qtde/Dif. Bal'
    end
    object cdsProdutosAcabadosProducaoValorUnit: TFloatField
      FieldName = 'Valor Unit'
      ReadOnly = True
    end
    object cdsProdutosAcabadosProducaoValorTotal: TFloatField
      FieldName = 'Valor Total'
      ReadOnly = True
    end
    object cdsProdutosAcabadosProducaoCustoMed: TFloatField
      FieldName = 'Custo Med'
      ReadOnly = True
      DisplayFormat = '#,##0.000'
    end
    object cdsProdutosAcabadosProducaoCodNf: TIntegerField
      FieldName = 'Cod Nf'
      ReadOnly = True
    end
  end
  object qrProdutosAcabadosProducao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select '
      'f.tipo "Tipo", f.natureza "Natureza", '
      'f.numdoc "Numero", f.nitem_id "N Item/Id",'
      'f.data "Data", f.data_estoque "Data Confirma'#231#227'o",'
      'coalesce(f.qtde, 0) "Qtde/Dif. Bal", '
      'f.valor_unit "Valor Unit", f.valor_total "Valor Total", '
      'f.custo_medio "Custo Med", '
      'f.cod_nf "Cod Nf" from fichaprodutosdetalhada f '
      'where f.grupo_prod = 0'
      'and f.cod_prod =  '#39'00000'#39
      'and f.cod_empresa =  1'
      
        'order by f.data, f.natureza, f.ordem, f.tipo, f.cod_nf, f.numdoc' +
        ', f.nitem_id, f.altera_custo')
    Left = 2688
    Top = 464
  end
  object dspProdutosAcabadosProducao: TDataSetProvider
    DataSet = qrProdutosAcabadosProducao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2688
    Top = 516
  end
  object dsProdutosMatInsumoProducao: TDataSource
    DataSet = cdsProdutosMatInsumoProducao
    Left = 3150
    Top = 600
  end
  object cdsProdutosMatInsumoProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosMatInsumoProducao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3149
    Top = 554
    object StringField80: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 6
    end
    object StringField81: TStringField
      FieldName = 'Natureza'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object IntegerField45: TIntegerField
      FieldName = 'Numero'
      ReadOnly = True
    end
    object IntegerField46: TIntegerField
      FieldName = 'N Item/Id'
      ReadOnly = True
    end
    object DateTimeField16: TDateTimeField
      FieldName = 'Data'
      ReadOnly = True
    end
    object DateTimeField17: TDateTimeField
      FieldName = 'Data Confirma'#231#227'o'
      ReadOnly = True
    end
    object FloatField97: TFloatField
      FieldName = 'Qtde/Dif. Bal'
    end
    object FloatField98: TFloatField
      FieldName = 'Valor Unit'
      ReadOnly = True
    end
    object FloatField99: TFloatField
      FieldName = 'Valor Total'
      ReadOnly = True
    end
    object FloatField100: TFloatField
      FieldName = 'Custo Med'
      ReadOnly = True
      DisplayFormat = '#,##0.000'
    end
    object IntegerField47: TIntegerField
      FieldName = 'Cod Nf'
      ReadOnly = True
    end
  end
  object qrProdutosMatInsumoProducao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select '
      'f.tipo "Tipo", f.natureza "Natureza", '
      'f.numdoc "Numero", f.nitem_id "N Item/Id",'
      'f.data "Data", f.data_estoque "Data Confirma'#231#227'o",'
      'coalesce(f.qtde, 0) "Qtde/Dif. Bal", '
      'f.valor_unit "Valor Unit", f.valor_total "Valor Total", '
      'f.custo_medio "Custo Med", '
      'f.cod_nf "Cod Nf" from fichaprodutosdetalhada f '
      'where f.grupo_prod = 0'
      'and f.cod_prod =  '#39'00000'#39
      'and f.cod_empresa =  1'
      
        'order by f.data, f.natureza, f.ordem, f.tipo, f.cod_nf, f.numdoc' +
        ', f.nitem_id, f.altera_custo')
    Left = 3150
    Top = 456
  end
  object dspProdutosMatInsumoProducao: TDataSetProvider
    DataSet = qrProdutosMatInsumoProducao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3150
    Top = 508
  end
  object qrImagensProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select imagens_doc.*, '
      
        'produtos_grade_imagens.grupo_prod, produtos_grade_imagens.cod_pr' +
        'od,'
      
        'produtos_grade_imagens.cod_grade, '#39'PRINCIPAL'#39' descr_grade from p' +
        'rodutos_grade_imagens '
      'inner join imagens_doc on '
      '           imagens_doc.cod_img = produtos_grade_imagens.cod_img '
      
        '    and imagens_doc.cod_empresa = produtos_grade_imagens.cod_emp' +
        'resa'
      'where produtos_grade_imagens.grupo_prod = 0'
      'and produtos_grade_imagens.cod_prod =  '#39'00000'#39
      'and produtos_grade_imagens.cod_empresa =  0'
      'order by produtos_grade_imagens.cod_grade, imagens_doc.cod_img ')
    Left = 3316
    Top = 454
  end
  object dspImagensProd: TDataSetProvider
    DataSet = qrImagensProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3316
    Top = 502
  end
  object cdsImagensProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImagensProd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3316
    Top = 551
    object cdsImagensProdCOD_IMG: TIntegerField
      FieldName = 'COD_IMG'
      Required = True
    end
    object cdsImagensProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsImagensProdIMAGEM: TMemoField
      FieldName = 'IMAGEM'
      BlobType = ftMemo
      Size = 8
    end
    object cdsImagensProdURL: TMemoField
      FieldName = 'URL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsImagensProdERRO: TStringField
      FieldName = 'ERRO'
      Size = 132
    end
    object cdsImagensProdMD5: TStringField
      FieldName = 'MD5'
      Size = 32
    end
    object cdsImagensProdUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsImagensProdDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
    end
    object cdsImagensProdCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsImagensProdDESCR_GRADE: TStringField
      FieldName = 'DESCR_GRADE'
      FixedChar = True
      Size = 9
    end
    object cdsImagensProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsImagensProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsImagensProdDATA_HORA_FALHA: TDateTimeField
      FieldName = 'DATA_HORA_FALHA'
    end
  end
  object dsImagensProd: TDataSource
    DataSet = cdsImagensProd
    Left = 3316
    Top = 600
  end
  object qrImagensKitsProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select imagens_doc.*, '
      'kits_prod_imagens.codigo_kit,'
      '0 cod_grade, '#39'PRINCIPAL'#39' descr_grade from kits_prod_imagens'
      'inner join imagens_doc on'
      '    imagens_doc.cod_img = kits_prod_imagens.cod_img'
      '    and imagens_doc.cod_empresa = kits_prod_imagens.cod_empresa'
      'where kits_prod_imagens.codigo_kit =  0'
      'and kits_prod_imagens.cod_empresa =  0'
      'order by imagens_doc.cod_img')
    Left = 3412
    Top = 454
  end
  object dspImagensKitsProd: TDataSetProvider
    DataSet = qrImagensKitsProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 3412
    Top = 502
  end
  object cdsImagensKitsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImagensKitsProd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 3412
    Top = 551
    object cdsImagensKitsProdCOD_IMG: TIntegerField
      FieldName = 'COD_IMG'
      Required = True
    end
    object cdsImagensKitsProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsImagensKitsProdIMAGEM: TMemoField
      FieldName = 'IMAGEM'
      BlobType = ftMemo
      Size = 8
    end
    object cdsImagensKitsProdURL: TMemoField
      FieldName = 'URL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsImagensKitsProdERRO: TStringField
      FieldName = 'ERRO'
      Size = 132
    end
    object cdsImagensKitsProdMD5: TStringField
      FieldName = 'MD5'
      Size = 32
    end
    object cdsImagensKitsProdUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsImagensKitsProdDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
    end
    object cdsImagensKitsProdCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object cdsImagensKitsProdCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsImagensKitsProdDESCR_GRADE: TStringField
      FieldName = 'DESCR_GRADE'
      FixedChar = True
      Size = 9
    end
    object cdsImagensKitsProdDATA_HORA_FALHA: TDateTimeField
      FieldName = 'DATA_HORA_FALHA'
    end
  end
  object dsImagensKitsProd: TDataSource
    DataSet = cdsImagensKitsProd
    Left = 3412
    Top = 600
  end
  object dsProdutosConversaoSaida: TDataSource
    DataSet = cdsProdutosConversaoSaida
    Left = 2185
    Top = 382
  end
  object cdsProdutosConversaoSaida: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProdutosConversaoSaida'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2185
    Top = 336
    object cdsProdutosConversaoSaidaGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosConversaoSaidaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 6
    end
    object cdsProdutosConversaoSaidaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosConversaoSaidaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Required = True
      Size = 6
    end
    object cdsProdutosConversaoSaidaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsProdutosConversaoSaidaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosConversaoSaidaDISPONIVEL_VENDA: TStringField
      FieldName = 'DISPONIVEL_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosConversaoSaidaPADRAO_VENDA: TStringField
      FieldName = 'PADRAO_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosConversaoSaidaUNID_PREF: TStringField
      FieldName = 'UNID_PREF'
      Size = 6
    end
    object cdsProdutosConversaoSaidaCODIGO_EAN: TStringField
      DisplayLabel = 'Cod EAN'
      FieldName = 'CODIGO_EAN'
    end
    object cdsProdutosConversaoSaidaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object dspProdutosConversaoSaida: TDataSetProvider
    DataSet = qrProdutosConversaoSaida
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2185
    Top = 286
  end
  object qrProdutosConversaoSaida: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from PRODUTOS_CONVERSAO_SAIDA')
    Left = 2185
    Top = 238
  end
  object dsConsProdutosConversao: TDataSource
    DataSet = cdsConsProdutosConversao
    Left = 2153
    Top = 614
  end
  object cdsConsProdutosConversao: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConsProdutosConversao'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 2153
    Top = 568
    object cdsConsProdutosConversaoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      ReadOnly = True
    end
    object cdsConsProdutosConversaoCOD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      ReadOnly = True
      Size = 6
    end
    object cdsConsProdutosConversaoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      ReadOnly = True
    end
    object cdsConsProdutosConversaoCODIGO_EAN: TStringField
      DisplayLabel = 'Cod EAN'
      FieldName = 'CODIGO_EAN'
      ReadOnly = True
    end
    object cdsConsProdutosConversaoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 6
      FieldName = 'UNIDADE'
      ReadOnly = True
      Size = 6
    end
    object cdsConsProdutosConversaoQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ReadOnly = True
      DisplayFormat = '##0.000'
    end
    object cdsConsProdutosConversaoTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object cdsConsProdutosConversaoOPERACAO: TStringField
      DisplayLabel = 'Operacao'
      FieldName = 'OPERACAO'
      ReadOnly = True
      FixedChar = True
      Size = 13
    end
    object cdsConsProdutosConversaoDISPONIVEL_VENDA: TStringField
      DisplayLabel = 'Disponivel Venda'
      FieldName = 'DISPONIVEL_VENDA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsConsProdutosConversaoPADRAO_VENDA: TStringField
      DisplayLabel = 'Padrao Venda'
      FieldName = 'PADRAO_VENDA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsConsProdutosConversaoFATOR_CONV: TStringField
      DisplayLabel = 'Fator'
      FieldKind = fkInternalCalc
      FieldName = 'FATOR_CONV_TEMP'
      Size = 50
    end
  end
  object dspConsProdutosConversao: TDataSetProvider
    DataSet = qrConsProdutosConversao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2153
    Top = 518
  end
  object qrConsProdutosConversao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      'select * from VW_PRODUTOS_CONVERSAO')
    Left = 2153
    Top = 470
  end
  object qrTipoPpro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPromocao
    SQL.Strings = (
      'select * from tipo_preco')
    Left = 1361
    Top = 237
  end
  object dspTipoPpro: TDataSetProvider
    DataSet = qrTipoPpro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1361
    Top = 285
  end
  object cdsTipoPpro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoPpro'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1361
    Top = 335
    object cdsTipoPproCOD_TPPRECO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TPPRECO'
      Required = True
    end
    object cdsTipoPproCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsTipoPproTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoPproDESCR_TIPO: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'DESCR_TIPO'
    end
    object cdsTipoPproUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      FixedChar = True
      Size = 1
    end
    object cdsTipoPproRECALC_PRECO: TStringField
      DisplayLabel = 'Recalcular pre'#231'o'
      FieldName = 'RECALC_PRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoPpro: TDataSource
    DataSet = cdsTipoPpro
    Left = 1361
    Top = 381
  end
  object qrKitsProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPerfilProd
    SQL.Strings = (
      'select k.codigo_kit,'
      'ki.grupo_prod,'
      'ki.cod_prod,'
      'ki.cod_empresa,'
      'ki.num_fab_prod,'
      'ki.quant_prod_kit,'
      'ki.descr_prod_kit,'
      'ki.ativo,'
      'k.descricao_kit,'
      
        'coalesce((select sum(coalesce(ik.quant_prod_kit, 0)) from kits_p' +
        'rod_kits ik'
      '          where ik.codigo_kit = k.codigo_kit'
      '          and ik.grupo_prod = :grupo_prod'
      '          and ik.cod_prod = :cod_prod'
      '          and ik.cod_empresa = :cod_empresa), 0) quant_prod'
      'from kits_prod k'
      'left join kits_prod_kits ki on'
      '    ki.codigo_kit = k.codigo_kit'
      '    and ki.grupo_prod = :grupo_prod'
      '    and ki.cod_prod = :cod_prod'
      '    and ki.cod_empresa = :cod_empresa'
      'where k.cod_empresa = 1'
      'and k.ativo = 1'
      'order by k.descricao_kit')
    Left = 1744
    Top = 678
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspKitsProd: TDataSetProvider
    DataSet = qrKitsProd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1744
    Top = 725
  end
  object cdsKitsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKitsProd'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 1744
    Top = 776
    object cdsKitsProdCODIGO_KIT: TIntegerField
      DisplayLabel = 'Cod Kit'
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object cdsKitsProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsKitsProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsKitsProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsKitsProdNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsKitsProdQUANT_PROD_KIT: TFloatField
      FieldName = 'QUANT_PROD_KIT'
    end
    object cdsKitsProdDESCR_PROD_KIT: TStringField
      FieldName = 'DESCR_PROD_KIT'
      FixedChar = True
      Size = 40
    end
    object cdsKitsProdATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsKitsProdDESCRICAO_KIT: TStringField
      DisplayLabel = 'Descricao Kit'
      FieldName = 'DESCRICAO_KIT'
      ProviderFlags = [pfInWhere]
      Size = 75
    end
    object cdsKitsProdQUANT_PROD: TFloatField
      DisplayLabel = 'Qtde Prod'
      FieldName = 'QUANT_PROD'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.000'
    end
  end
  object dsKitsProd: TDataSource
    DataSet = cdsKitsProd
    Left = 1744
    Top = 823
  end
  object qrProdutosRastro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProdutos
    SQL.Strings = (
      
        'SELECT PRODUTOS_RASTRO.GRUPO_PROD, PRODUTOS_RASTRO.COD_PROD, PRO' +
        'DUTOS_RASTRO.COD_GRADE, PRODUTOS_RASTRO.COD_EMPRESA,'
      
        'PRODUTOS_RASTRO.NLOTE, PRODUTOS_RASTRO.QLOTE, PRODUTOS_RASTRO.DF' +
        'AB, PRODUTOS_RASTRO.DVAL, '
      'PRODUTOS_RASTRO.COD_CLIENTE, '
      'PRODUTOS_RASTRO.QTDE_COMPRA, '
      
        'CASE WHEN (PRODUTOS_RASTRO.COD_NF > 0) THEN SP_PRODUTOS_RASTRO_N' +
        'F.QTDE_COMPRA ELSE PRODUTOS_RASTRO.QTDE_COMPRA END QTDE_COMPRA2,' +
        ' '
      'PRODUTOS_RASTRO.COD_NF, '
      'CASE WHEN (COD_GRADE_PROD.COD_GRADE > 0) THEN '
      '       COALESCE(COD_GRADE_PROD.QTDE, 0) '
      '     ELSE '
      '       COALESCE(PRODUTOS.EST_F, 0) '
      'END ESTOQUE, '
      'PRODUTOS.NUM_FAB_PROD, PRODUTOS.DESCR_PROD,'
      'GRADE.DESCRICAO GRADE, '
      'GRUPOS.DESCRICAO GRUPO, '
      'SUB_GRUPO.DESCRICAO SUBGRUPO, '
      'MARCA_PROD.DESCRICAO_MARCA MARCA, '
      
        'CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO RAZAO_CLIENTE, CLIENTES.CP' +
        'FCGC CPFCGC_CLIENTE, '
      
        'NOTAFISCAL.NUM_NF, NOTAFISCAL.SERIE, NOTAFISCAL.DATA_LANC, NOTAF' +
        'ISCAL.VALOR_TOTAL FROM PRODUTOS_RASTRO'
      'INNER JOIN PRODUTOS ON '
      
        '       PRODUTOS_RASTRO.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND PROD' +
        'UTOS_RASTRO.COD_PROD = PRODUTOS.COD_PROD AND PRODUTOS_RASTRO.COD' +
        '_EMPRESA = PRODUTOS.COD_EMPRESA '
      '    LEFT JOIN COD_GRADE_PROD ON '
      
        '       COD_GRADE_PROD.GRUPO_PROD = PRODUTOS_RASTRO.GRUPO_PROD AN' +
        'D COD_GRADE_PROD.COD_PROD = PRODUTOS_RASTRO.COD_PROD AND COD_GRA' +
        'DE_PROD.COD_GRADE = PRODUTOS_RASTRO.COD_GRADE AND COD_GRADE_PROD' +
        '.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA '
      'LEFT JOIN GRADE ON '
      
        '       GRADE.COD_GRADE = PRODUTOS_RASTRO.COD_GRADE AND GRADE.COD' +
        '_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA '
      'LEFT JOIN NOTAFISCAL ON '
      
        '       NOTAFISCAL.COD_NF = PRODUTOS_RASTRO.COD_NF AND NOTAFISCAL' +
        '.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA '
      'LEFT JOIN CLIENTES ON '
      
        '       CLIENTES.COD_CLIENTE = CASE WHEN (PRODUTOS_RASTRO.COD_NF ' +
        '> 0) THEN NOTAFISCAL.COD_CLIENTE ELSE PRODUTOS_RASTRO.COD_CLIENT' +
        'E END AND CLIENTES.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA '
      'LEFT JOIN SP_PRODUTOS_RASTRO_NF '
      
        '       (PRODUTOS_RASTRO.GRUPO_PROD, PRODUTOS_RASTRO.COD_PROD, PR' +
        'ODUTOS_RASTRO.COD_GRADE, PRODUTOS_RASTRO.COD_EMPRESA, PRODUTOS_R' +
        'ASTRO.COD_NF) ON 1 = 1 '
      '    LEFT JOIN GRUPOS ON '
      '       GRUPOS.CODIGO_GRUP = PRODUTOS.GRUPO_PROD '
      'LEFT JOIN SUB_GRUPO ON '
      '       SUB_GRUPO.CODIGO_SUBGR = PRODUTOS.SUB_G_PROD '
      'LEFT JOIN MARCA_PROD ON '
      '       MARCA_PROD.COD_MARCA = PRODUTOS.COD_MARCA')
    Left = 849
    Top = 882
  end
  object dspProdutosRastro: TDataSetProvider
    DataSet = qrProdutosRastro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 849
    Top = 933
  end
  object cdsProdutosRastro: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProdutosRastro'
    BeforeOpen = CdsProdutosBeforeOpen
    Left = 849
    Top = 984
    object cdsProdutosRastroSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsProdutosRastroGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosRastroCOD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosRastroNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsProdutosRastroCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsProdutosRastroCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosRastroCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsProdutosRastroNLOTE: TStringField
      DisplayLabel = 'Num Lote'
      FieldName = 'NLOTE'
      Required = True
    end
    object cdsProdutosRastroQLOTE: TFloatField
      DisplayLabel = 'Qtde Lote'
      FieldName = 'QLOTE'
      DisplayFormat = '##0.000'
    end
    object cdsProdutosRastroDFAB: TDateTimeField
      DisplayLabel = 'Data Fabricante'
      FieldName = 'DFAB'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsProdutosRastroDVAL: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DVAL'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsProdutosRastroCOD_NF: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
    end
    object cdsProdutosRastroESTOQUE: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.000'
    end
    object cdsProdutosRastroQTDE_COMPRA: TFloatField
      Tag = 1
      DisplayLabel = 'Qtde Compra Temp'
      FieldName = 'QTDE_COMPRA'
      DisplayFormat = '##0.000'
    end
    object cdsProdutosRastroQTDE_COMPRA2: TFloatField
      DisplayLabel = 'Qtde Compra'
      FieldName = 'QTDE_COMPRA2'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '##0.000'
    end
    object cdsProdutosRastroDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 75
    end
    object cdsProdutosRastroGRADE: TStringField
      Tag = 1
      DisplayLabel = 'Grade'
      FieldName = 'GRADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 32
    end
    object cdsProdutosRastroGRUPO: TStringField
      DisplayLabel = 'Descricao Grupo'
      FieldName = 'GRUPO'
      ProviderFlags = [pfInWhere]
      Size = 80
    end
    object cdsProdutosRastroSUBGRUPO: TStringField
      DisplayLabel = 'Descricao SubGrupo'
      FieldName = 'SUBGRUPO'
      ProviderFlags = [pfInWhere]
      Size = 80
    end
    object cdsProdutosRastroMARCA: TStringField
      DisplayLabel = 'Descricao Marca'
      FieldName = 'MARCA'
      ProviderFlags = [pfInWhere]
      Size = 30
    end
    object cdsProdutosRastroNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia Fornecedor'
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 35
    end
    object cdsProdutosRastroRAZAO_CLIENTE: TStringField
      DisplayLabel = 'Razao Social Fornecedor'
      FieldName = 'RAZAO_CLIENTE'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsProdutosRastroCPFCGC_CLIENTE: TStringField
      DisplayLabel = 'CPF/CNPJ Fornecedor'
      FieldName = 'CPFCGC_CLIENTE'
      ProviderFlags = [pfInWhere]
      Size = 18
    end
    object cdsProdutosRastroNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      ProviderFlags = [pfInWhere]
    end
    object cdsProdutosRastroSERIE: TStringField
      DisplayLabel = 'Serie NF'
      FieldName = 'SERIE'
      ProviderFlags = [pfInWhere]
      Size = 5
    end
    object cdsProdutosRastroDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lanc NF'
      FieldName = 'DATA_LANC'
      ProviderFlags = [pfInWhere]
    end
    object cdsProdutosRastroVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total NF'
      FieldName = 'VALOR_TOTAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#,##0.00'
    end
    object cdsProdutosRastroNUM_FAB_PROD_CALC: TStringField
      Tag = 1
      DisplayLabel = 'Numero Fabrica'#231#227'o2'
      FieldKind = fkInternalCalc
      FieldName = 'NUM_FAB_PROD_CALC'
    end
    object cdsProdutosRastroDESCR_PROD_CALC: TStringField
      Tag = 1
      DisplayLabel = 'Descricao 2'
      FieldKind = fkInternalCalc
      FieldName = 'DESCR_PROD_CALC'
      Size = 75
    end
    object cdsProdutosRastroGRADE_CALC: TStringField
      Tag = 1
      DisplayLabel = 'Grade 2'
      FieldKind = fkInternalCalc
      FieldName = 'GRADE_CALC'
      Size = 32
    end
    object cdsProdutosRastroNOME_CLIENTE_CALC: TStringField
      Tag = 1
      DisplayLabel = 'Nome Fantasia Fornecedor 2'
      FieldKind = fkInternalCalc
      FieldName = 'NOME_CLIENTE_CALC'
      Size = 35
    end
    object cdsProdutosRastroRAZAO_CLIENTE_CALC: TStringField
      Tag = 1
      DisplayLabel = 'Razao Social Fornecedor 2'
      FieldKind = fkInternalCalc
      FieldName = 'RAZAO_CLIENTE_CALC'
      Size = 60
    end
    object cdsProdutosRastroCPFCGC_CLIENTE_CALC: TStringField
      Tag = 1
      DisplayLabel = 'CPF/CNPJ Fornecedor'
      FieldKind = fkInternalCalc
      FieldName = 'CPFCGC_CLIENTE_CALC'
      Size = 18
    end
  end
  object dsProdutosRastro: TDataSource
    DataSet = cdsProdutosRastro
    Left = 849
    Top = 1036
  end
end
