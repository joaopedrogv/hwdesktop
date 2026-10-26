object DtmGestorHw: TDtmGestorHw
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 728
  Width = 1030
  object IbTransHwGestor: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 16
  end
  object IbEmpresas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select * from EMPRESA')
    Left = 32
    Top = 80
  end
  object CdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 112
    Top = 80
  end
  object DspEmpresas: TDataSetProvider
    DataSet = IbEmpresas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 32
    Top = 136
  end
  object QrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 120
    Top = 16
  end
  object IbDepto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select * from DEPART_CT')
    Left = 176
    Top = 16
  end
  object DspDepto: TDataSetProvider
    DataSet = IbDepto
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 104
  end
  object CdsDpto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDepto'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 304
    Top = 64
    object CdsDptoCOD_DEP: TIntegerField
      DisplayLabel = 'Cod Dep'
      FieldName = 'COD_DEP'
      Required = True
    end
    object CdsDptoDESC_DEP: TStringField
      DisplayLabel = 'Descricao Dep'
      FieldName = 'DESC_DEP'
      Size = 35
    end
    object CdsDptoPERC_DEP: TFloatField
      DisplayLabel = 'Perc (%)'
      FieldName = 'PERC_DEP'
      DisplayFormat = '##0.00'
    end
    object CdsDptoTP_DEP: TStringField
      DisplayLabel = 'Tipo Dep'
      FieldName = 'TP_DEP'
      FixedChar = True
      Size = 1
    end
    object CdsDptoTIPOFAT: TStringField
      DisplayLabel = 'Tipo Fat'
      FieldName = 'TIPOFAT'
      FixedChar = True
      Size = 40
    end
    object CdsDptoTIPDEVDEP: TStringField
      DisplayLabel = 'Tipo Dev Dep'
      FieldName = 'TIPDEVDEP'
      Size = 15
    end
    object CdsDptoTIPOFATCNT: TStringField
      DisplayLabel = 'Tipo Fat CNT'
      FieldName = 'TIPOFATCNT'
      Size = 40
    end
    object CdsDptoTIPDEVDEPCNT: TStringField
      DisplayLabel = 'Tipo Dev Dep CNT'
      FieldName = 'TIPDEVDEPCNT'
      Size = 15
    end
  end
  object DtDepto: TDataSource
    DataSet = CdsDpto
    Left = 240
    Top = 24
  end
  object IbVendasGestor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 128
    Top = 152
  end
  object DspVendasGestor: TDataSetProvider
    DataSet = IbVendasGestor
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 152
  end
  object CdsVendasGestor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendasGestor'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 304
    Top = 120
  end
  object IbCubeGeral: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 312
    Top = 16
  end
  object DtCubeGeral: TDataSource
    Left = 392
    Top = 64
  end
  object IbMapaFinan: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 400
    Top = 128
  end
  object DspMapaFinan: TDataSetProvider
    DataSet = IbMapaFinan
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 464
    Top = 88
  end
  object CdsMapaFinan: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMapaFinan'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 472
    Top = 136
  end
  object IbControles: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 488
    Top = 32
  end
  object DspControles: TDataSetProvider
    DataSet = IbControles
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 584
    Top = 120
  end
  object CdsControles: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspControles'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 584
    Top = 64
  end
  object IbCreditos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 48
    Top = 216
  end
  object DspCreditos: TDataSetProvider
    DataSet = IbCreditos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 216
  end
  object CdsCreditos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCreditos'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 224
    Top = 208
  end
  object CdsIndicadoresDRE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 208
    object CdsIndicadoresDREMES: TIntegerField
      FieldName = 'MES'
    end
    object CdsIndicadoresDREANO: TIntegerField
      FieldName = 'ANO'
    end
    object CdsIndicadoresDREVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsIndicadoresDRETIPOINDICADORES: TStringField
      FieldName = 'TIPOINDICADORES'
      Size = 30
    end
    object CdsIndicadoresDRESequencia: TIntegerField
      FieldName = 'Sequencia'
    end
  end
  object DsIndicadores: TDataSource
    DataSet = CdsIndicadoresDRE
    Left = 400
    Top = 208
  end
  object IbTiposRateio: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      
        'select (select d.desc_dep from depart_ct d where d.cod_dep = c.c' +
        'od_dep) as departor,(select d1.desc_dep from depart_ct d1 where ' +
        'd1.cod_dep = c.cod_deprat) as departdest,c.tprat,c.medqtdratfat,' +
        'c.ratem,c.cod_dep,c.cod_deprat,c.tpratcnt,c.ratemcnt'
      'from rel_depto c where c.ativo = 1')
    Left = 480
    Top = 208
    object IbTiposRateioDEPARTOR: TIBStringField
      DisplayLabel = 'Depart Origem'
      FieldName = 'DEPARTOR'
      ProviderFlags = []
      Size = 35
    end
    object IbTiposRateioDEPARTDEST: TIBStringField
      DisplayLabel = 'Depart Destino'
      FieldName = 'DEPARTDEST'
      ProviderFlags = []
      Size = 35
    end
    object IbTiposRateioTPRAT: TIBStringField
      DisplayLabel = 'Origem Tipo de Venda'
      FieldName = 'TPRAT'
      Origin = '"REL_DEPTO"."TPRAT"'
      Required = True
      Size = 40
    end
    object IbTiposRateioMEDQTDRATFAT: TIntegerField
      DisplayLabel = 'Qtde de M'#234'ses para Rateio'
      FieldName = 'MEDQTDRATFAT'
      Origin = '"REL_DEPTO"."MEDQTDRATFAT"'
      Required = True
    end
    object IbTiposRateioRATEM: TIBStringField
      DisplayLabel = 'Tipos de Venda Destino do Rateio'
      FieldName = 'RATEM'
      Origin = '"REL_DEPTO"."RATEM"'
      Required = True
      Size = 40
    end
    object IbTiposRateioCOD_DEP: TIntegerField
      DisplayLabel = 'Cod Dep'
      FieldName = 'COD_DEP'
      Origin = '"REL_DEPTO"."COD_DEP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbTiposRateioCOD_DEPRAT: TIntegerField
      DisplayLabel = 'Cod Depart Destino para Rateio'
      FieldName = 'COD_DEPRAT'
      Origin = '"REL_DEPTO"."COD_DEPRAT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbTiposRateioTPRATCNT: TIBStringField
      DisplayLabel = 'Tipo Rat CNT'
      FieldName = 'TPRATCNT'
      Origin = '"REL_DEPTO"."TPRATCNT"'
      Size = 40
    end
    object IbTiposRateioRATEMCNT: TIBStringField
      DisplayLabel = 'Tipos de Venda Destino do Rateio CNT'
      FieldName = 'RATEMCNT'
      Origin = '"REL_DEPTO"."RATEMCNT"'
      Size = 128
    end
  end
  object DtTiposRateio: TDataSource
    DataSet = IbTiposRateio
    Left = 560
    Top = 208
  end
  object CdsRateioMes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ANO;MES;DEPARTOR;DEPARTDEST'
    Params = <>
    Left = 72
    Top = 280
    object CdsRateioMesDEPARTOR: TStringField
      DisplayLabel = 'Depart Origem'
      DisplayWidth = 35
      FieldName = 'DEPARTOR'
      Size = 35
    end
    object CdsRateioMesDEPARTDEST: TStringField
      DisplayLabel = 'Depart Destino'
      DisplayWidth = 35
      FieldName = 'DEPARTDEST'
      Size = 35
    end
    object CdsRateioMesTIPRAT: TStringField
      DisplayLabel = 'Origem Tipo de Venda'
      FieldName = 'TIPRAT'
      Size = 40
    end
    object CdsRateioMesMEDQTDRATFAT: TIntegerField
      DisplayLabel = 'Qtde de M'#234'ses para Rateio'
      FieldName = 'MEDQTDRATFAT'
    end
    object CdsRateioMesRATEM: TStringField
      DisplayLabel = 'Tipos de Venda Destino do Rateio'
      FieldName = 'RATEM'
      Size = 40
    end
    object CdsRateioMesMES: TIntegerField
      DisplayLabel = 'Mes'
      FieldName = 'MES'
    end
    object CdsRateioMesANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
    end
    object CdsRateioMesVALOROR: TCurrencyField
      DisplayLabel = 'Valor Depart Origem'
      DisplayWidth = 20
      FieldName = 'VALOROR'
    end
    object CdsRateioMesVALORDEST: TCurrencyField
      DisplayLabel = 'Valor Depart Destino'
      DisplayWidth = 20
      FieldName = 'VALORDEST'
    end
    object CdsRateioMesPERCRAT: TFloatField
      DisplayLabel = 'Perc Rat'
      FieldName = 'PERCRAT'
      Precision = 4
    end
    object CdsRateioMesCOD_DEP: TIntegerField
      DisplayLabel = 'Cod Dep'
      FieldName = 'COD_DEP'
    end
    object CdsRateioMesCOD_DEPRAT: TIntegerField
      DisplayLabel = 'Cod Depart Destino para Rateio'
      FieldName = 'COD_DEPRAT'
    end
    object CdsRateioMesValorDespDep: TCurrencyField
      DisplayLabel = 'Valor Desp Depart'
      DisplayWidth = 20
      FieldName = 'ValorDespDep'
    end
    object CdsRateioMesVALORRATEADO: TCurrencyField
      DisplayLabel = 'Valor Rateio'
      DisplayWidth = 20
      FieldName = 'VALORRATEADO'
    end
    object CdsRateioMesCODDRE: TIntegerField
      DisplayLabel = 'Cod DRE'
      FieldName = 'CODDRE'
    end
  end
  object DtRateioMes: TDataSource
    DataSet = CdsRateioMes
    Left = 168
    Top = 280
  end
  object IbApuracaoDep: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select * from APURACAO_DEPTO where ativo = 1')
    Left = 248
    Top = 280
  end
  object DspApuracaoDep: TDataSetProvider
    DataSet = IbApuracaoDep
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 336
    Top = 280
  end
  object CdsApuracaoDep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspApuracaoDep'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 424
    Top = 280
    object CdsApuracaoDepANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object CdsApuracaoDepMES: TIntegerField
      FieldName = 'MES'
      Required = True
    end
    object CdsApuracaoDepCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
      Required = True
    end
    object CdsApuracaoDepTPDESP: TStringField
      FieldName = 'TPDESP'
      Required = True
      FixedChar = True
      Size = 4
    end
    object CdsApuracaoDepCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsApuracaoDepVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepPE: TFloatField
      FieldName = 'PE'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepDNADEP: TStringField
      FieldName = 'DNADEP'
      FixedChar = True
      Size = 50
    end
    object CdsApuracaoDepATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsApuracaoDepDATACAD_AP: TDateTimeField
      FieldName = 'DATACAD_AP'
    end
    object CdsApuracaoDepPERC_VALOR: TFloatField
      FieldName = 'PERC_VALOR'
    end
    object CdsApuracaoDepVALOR_DINHEIRO: TFloatField
      FieldName = 'VALOR_DINHEIRO'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepVALOR_FATURADO: TFloatField
      FieldName = 'VALOR_FATURADO'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepMARGMIN: TFloatField
      FieldName = 'MARGMIN'
    end
    object CdsApuracaoDepMARKUPMIN: TFloatField
      FieldName = 'MARKUPMIN'
    end
    object CdsApuracaoDepAPURACAO_CONTABIL: TStringField
      FieldName = 'APURACAO_CONTABIL'
      Size = 1
    end
    object CdsApuracaoDepAPURACAO_MEDIA: TStringField
      FieldName = 'APURACAO_MEDIA'
      Size = 1
    end
    object CdsApuracaoDepAPURACAO_MEDIA_MESES: TSmallintField
      FieldName = 'APURACAO_MEDIA_MESES'
    end
  end
  object CdsDadosBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDadosBalanco'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 248
    Top = 344
    object CdsDadosBalancoCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
      Required = True
    end
    object CdsDadosBalancoTIPO_BALANCO: TStringField
      FieldName = 'TIPO_BALANCO'
      Required = True
      Size = 7
    end
    object CdsDadosBalancoCODIGO_INT_BAL: TStringField
      FieldName = 'CODIGO_INT_BAL'
      Required = True
      Size = 10
    end
    object CdsDadosBalancoDESC_BALANCO: TStringField
      FieldName = 'DESC_BALANCO'
      Required = True
      FixedChar = True
      Size = 30
    end
    object CdsDadosBalancoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsDadosBalancoSUBTIPO: TStringField
      FieldName = 'SUBTIPO'
    end
    object CdsDadosBalancoSINAL: TStringField
      FieldName = 'SINAL'
      Size = 1
    end
    object CdsDadosBalancoPRAZOINICIAL: TIntegerField
      FieldName = 'PRAZOINICIAL'
    end
    object CdsDadosBalancoPRAZOFINAL: TIntegerField
      FieldName = 'PRAZOFINAL'
    end
  end
  object DspDadosBalanco: TDataSetProvider
    DataSet = IbDadosBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 344
  end
  object IbDadosBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select * from dados_balanco')
    Left = 64
    Top = 344
  end
  object IbBuscasBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 352
    Top = 344
  end
  object CdsEstoques: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'DspEstoques'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 504
    Top = 344
  end
  object DspEstoques: TDataSetProvider
    DataSet = IbEstoques
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 592
    Top = 344
  end
  object IbEstoques: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 424
    Top = 344
  end
  object CdsIndicesBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspIndicesBalanco'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 520
    Top = 280
    object CdsIndicesBalancoNOME_INDICE: TStringField
      DisplayLabel = 'Indice'
      FieldName = 'NOME_INDICE'
      Required = True
      Size = 50
    end
    object CdsIndicesBalancoMES: TIntegerField
      DisplayLabel = 'Mes'
      FieldName = 'MES'
      Required = True
    end
    object CdsIndicesBalancoANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Required = True
    end
    object CdsIndicesBalancoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object CdsIndicesBalancoVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object CdsIndicesBalancoSEQ_INDICE: TIntegerField
      DisplayLabel = 'Sequencia'
      FieldName = 'SEQ_INDICE'
    end
  end
  object IbIndicesBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select *  from INDICES_BALANCO where ativo = 1')
    Left = 584
    Top = 264
  end
  object DspIndicesBalanco: TDataSetProvider
    DataSet = IbIndicesBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 640
    Top = 280
  end
  object DtIndicesBalanco: TDataSource
    DataSet = CdsIndicesBalanco
    Left = 640
    Top = 216
  end
  object CdsApuracaoBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspApuracaoBalanco'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 264
    Top = 400
  end
  object DspApuracaoBalanco: TDataSetProvider
    DataSet = IBApuracaoBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 400
  end
  object IBApuracaoBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 72
    Top = 400
  end
  object CdsEstoqueHW: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'DspEstoqueHW'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 544
    Top = 408
  end
  object DspEstoqueHW: TDataSetProvider
    DataSet = IbEstoqueHw
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 448
    Top = 408
  end
  object IbEstoqueHw: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 360
    Top = 408
  end
  object CdsCotacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dspcotacao'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 272
    Top = 456
    object CdsCotacaoCOD_COTACAO: TIntegerField
      DisplayLabel = 'C'#243'd. Cota'#231#227'o'
      FieldName = 'COD_COTACAO'
      Required = True
    end
    object CdsCotacaoTIPOOP: TStringField
      DisplayLabel = 'Tipo Cota'#231'ao'
      FieldName = 'TIPOOP'
      Required = True
      Size = 15
    end
    object CdsCotacaoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsCotacaoDATA_COTACAO: TDateTimeField
      DisplayLabel = 'Data Cota'#231#227'o'
      FieldName = 'DATA_COTACAO'
    end
    object CdsCotacaoCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object CdsCotacaoHORA: TTimeField
      DisplayLabel = 'Hora Cota'#231#227'o'
      FieldName = 'HORA'
    end
    object CdsCotacaoFATURAMENTO: TFloatField
      DisplayLabel = 'Faturamento DNA'
      FieldName = 'FATURAMENTO'
    end
    object CdsCotacaoCF: TFloatField
      DisplayLabel = 'Custo Fixo DNA'
      FieldName = 'CF'
    end
    object CdsCotacaoCMV: TFloatField
      DisplayLabel = 'CMV DNA'
      FieldName = 'CMV'
    end
    object CdsCotacaoOCV: TFloatField
      DisplayLabel = 'Outras Despesas Vari'#225'veis DNA'
      FieldName = 'OCV'
    end
    object CdsCotacaoLUCRO: TFloatField
      DisplayLabel = 'Lucro DNA'
      FieldName = 'LUCRO'
    end
    object CdsCotacaoAUMENTO_FAT: TFloatField
      DisplayLabel = 'Aumento Faturamento'
      FieldName = 'AUMENTO_FAT'
    end
    object CdsCotacaoVARIACAO_LUCRO: TFloatField
      DisplayLabel = 'Varia'#231#227'o nos Lucros'
      FieldName = 'VARIACAO_LUCRO'
    end
    object CdsCotacaoMESAPURACAO: TIntegerField
      DisplayLabel = 'Mes Apura'#231#227'o DNA'
      FieldName = 'MESAPURACAO'
    end
    object CdsCotacaoANOAPURACAO: TIntegerField
      DisplayLabel = 'Ano Apura'#231#227'o DNA'
      FieldName = 'ANOAPURACAO'
    end
    object CdsCotacaoPE: TFloatField
      DisplayLabel = 'Ponto de Equil'#237'brio DNA'
      FieldName = 'PE'
    end
    object CdsCotacaoQTDE_DIAS_DISP: TIntegerField
      DisplayLabel = 'Qtde Dias Dispon'#237'veis no M'#234's'
      FieldName = 'QTDE_DIAS_DISP'
    end
    object CdsCotacaoTIPODEP: TStringField
      FieldName = 'TIPODEP'
    end
    object CdsCotacaoDATA_ALT_COTACAO: TDateTimeField
      FieldName = 'DATA_ALT_COTACAO'
    end
    object CdsCotacaoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsCotacaoCOD_LISTA: TIntegerField
      FieldName = 'COD_LISTA'
    end
  end
  object Dspcotacao: TDataSetProvider
    DataSet = IBCotacao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 456
  end
  object IBCotacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'SELECT * FROM COTACAO WHERE ATIVO = 1')
    Left = 72
    Top = 456
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 60
    Top = 513
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
  object IbcotacaoItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select cotacao_itens. from cotacao_itens '
      'where cotacao_itens.ativo = 1')
    Left = 152
    Top = 512
  end
  object DspcotacaoItens: TDataSetProvider
    DataSet = IbcotacaoItens
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 512
  end
  object CdscotacaoItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspcotacaoItens'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 344
    Top = 512
    object CdscotacaoItensCOD_COTACAO: TIntegerField
      DisplayLabel = 'C'#243'd. Cota'#231#227'o'
      FieldName = 'COD_COTACAO'
      Required = True
    end
    object CdscotacaoItensTIPOOP: TStringField
      DisplayLabel = 'Tipo de Opera'#231#227'o'
      FieldName = 'TIPOOP'
      Required = True
      Size = 15
    end
    object CdscotacaoItensCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object CdscotacaoItensCODSEQ_ITEM: TIntegerField
      DisplayLabel = 'C'#243'd. Seq. Item'
      FieldName = 'CODSEQ_ITEM'
      Required = True
    end
    object CdscotacaoItensGRUPO: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO'
      Required = True
    end
    object CdscotacaoItensCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNECEDOR'
    end
    object CdscotacaoItensCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PROD'
      Required = True
    end
    object CdscotacaoItensCOD_COND_PAG: TIntegerField
      Tag = 1
      FieldName = 'COD_COND_PAG'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      Visible = False
    end
    object CdscotacaoItensNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fab. Produto'
      FieldName = 'NUM_FAB_PROD'
      Required = True
    end
    object CdscotacaoItensDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object CdscotacaoItensCURVA: TStringField
      DisplayLabel = 'Curva ABC'
      FieldName = 'CURVA'
      Size = 2
    end
    object CdscotacaoItensQTDE_VENDIDA: TFloatField
      DisplayLabel = 'Qtde Vendida'
      FieldName = 'QTDE_VENDIDA'
    end
    object CdscotacaoItensQTDE_SIMULADA: TFloatField
      DisplayLabel = 'Qtde Simulada'
      FieldName = 'QTDE_SIMULADA'
    end
    object CdscotacaoItensVALOR_MEDIO_VENDA: TFloatField
      DisplayLabel = 'Valor M'#233'dio de Venda'
      FieldName = 'VALOR_MEDIO_VENDA'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensVALOR_VENDA_SIM: TFloatField
      DisplayLabel = 'Valor de Venda Simulado'
      FieldName = 'VALOR_VENDA_SIM'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensQTDE_EQUILIBRIO: TFloatField
      DisplayLabel = 'Ponto de equil'#237'brio em Qtde'
      FieldName = 'QTDE_EQUILIBRIO'
      DisplayFormat = '#0.000'
    end
    object CdscotacaoItensVALOR_EQUILIBRIO: TFloatField
      DisplayLabel = 'Valor Ponto de Equil'#237'brio'
      FieldName = 'VALOR_EQUILIBRIO'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensCMV_PRODUTO: TFloatField
      DisplayLabel = 'CMV Produto'
      FieldName = 'CMV_PRODUTO'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensCUSTO_FIXO_PROP: TFloatField
      DisplayLabel = 'Custo Fixo Proporcional'
      FieldName = 'CUSTO_FIXO_PROP'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensCUSTO_VARIAVEL: TFloatField
      DisplayLabel = 'Custo Vari'#225'vel'
      FieldName = 'CUSTO_VARIAVEL'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensPERC_DESC: TFloatField
      DisplayLabel = 'Perc. Desconto'
      FieldName = 'PERC_DESC'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensDESCONTO_VALOR: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO_VALOR'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensLUCRO_APURADO: TFloatField
      DisplayLabel = 'Lucro Apurado'
      FieldName = 'LUCRO_APURADO'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensMARKUP_PRATICADO: TFloatField
      DisplayLabel = 'Markup Praticado'
      FieldName = 'MARKUP_PRATICADO'
      DisplayFormat = '#0.0000'
    end
    object CdscotacaoItensMARKUP_SIMULADO: TFloatField
      DisplayLabel = 'Markup Simulado'
      FieldName = 'MARKUP_SIMULADO'
      DisplayFormat = '#0.0000'
    end
    object CdscotacaoItensMARGEM_PRATICADA: TFloatField
      DisplayLabel = 'Margem Praticada'
      FieldName = 'MARGEM_PRATICADA'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensMARGEM_SIMULADA: TFloatField
      DisplayLabel = 'Margem Simulada'
      FieldName = 'MARGEM_SIMULADA'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensQTDE_VENDA_DIARIA: TFloatField
      DisplayLabel = 'Qtde Venda Di'#225'ria'
      FieldName = 'QTDE_VENDA_DIARIA'
      DisplayFormat = '#0.000'
    end
    object CdscotacaoItensVALOR_VENDA_DIARIA: TFloatField
      DisplayLabel = 'Valor de Venda Di'#225'ria'
      FieldName = 'VALOR_VENDA_DIARIA'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensCLASS_FREQ: TStringField
      DisplayLabel = 'Curva de Frequ'#234'ncia'
      FieldName = 'CLASS_FREQ'
      Size = 2
    end
    object CdscotacaoItensCLASS_AT: TStringField
      DisplayLabel = 'Curva de Atualidade'
      FieldName = 'CLASS_AT'
      Size = 2
    end
    object CdscotacaoItensPME: TFloatField
      DisplayLabel = 'Prazo M'#233'dio de Estoque'
      FieldName = 'PME'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensQTDE_VENDA_PMEMES: TFloatField
      DisplayLabel = 'Qtde venda PME M'#234's'
      FieldName = 'QTDE_VENDA_PMEMES'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensVALOR_VENDA_PMEMES: TFloatField
      DisplayLabel = 'Valor Venda PME M'#234's'
      FieldName = 'VALOR_VENDA_PMEMES'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensESTOQUE: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE'
      DisplayFormat = '#0.000'
    end
    object CdscotacaoItensESTOQUE_DISP: TFloatField
      DisplayLabel = 'Estoque Dispon'#237'vel'
      FieldName = 'ESTOQUE_DISP'
      DisplayFormat = '#0.000'
    end
    object CdscotacaoItensTIPVENDA: TStringField
      DisplayLabel = 'Tipo de Venda'
      FieldName = 'TIPVENDA'
      Size = 7
    end
    object CdscotacaoItensCMV_VENDIDA: TFloatField
      DisplayLabel = 'CMV Vendida'
      FieldName = 'CMV_VENDIDA'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensTIPODEP: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'TIPODEP'
      Required = True
      Size = 1
    end
    object CdscotacaoItensCUSTO_UN_SIM: TFloatField
      DisplayLabel = 'Custo Unit'#225'rio Simulado'
      FieldName = 'CUSTO_UN_SIM'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensCUSTO_UN_VENDA: TFloatField
      DisplayLabel = 'Custo Unit'#225'rio de Venda'
      FieldName = 'CUSTO_UN_VENDA'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensFRETE_SIM: TFloatField
      DisplayLabel = 'Frete Fornecedor'
      FieldName = 'FRETE_SIM'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensIPI_SIM: TFloatField
      DisplayLabel = 'Ipi Fornecedor'
      FieldName = 'IPI_SIM'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensMVA_SIM: TFloatField
      DisplayLabel = 'MVA Fornecedor'
      FieldName = 'MVA_SIM'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensICM_ENTRADA: TFloatField
      DisplayLabel = 'ICMS Entrada'
      FieldName = 'ICM_ENTRADA'
    end
    object CdscotacaoItensICM_SAIDA: TFloatField
      DisplayLabel = 'ICMS Sa'#237'da'
      FieldName = 'ICM_SAIDA'
    end
    object CdscotacaoItensOUTRAS_DESP_SIM: TFloatField
      DisplayLabel = 'Outras Despesas Fornecedor'
      FieldName = 'OUTRAS_DESP_SIM'
    end
    object CdscotacaoItensVALOR_SIM_FORN: TFloatField
      DisplayLabel = 'Valor Simulado Fornecedor'
      FieldName = 'VALOR_SIM_FORN'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensVALOR_UN_VENDA_SIM: TFloatField
      DisplayLabel = 'Valor Unitario Venda'
      FieldName = 'VALOR_UN_VENDA_SIM'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensCOD_LISTA: TIntegerField
      DisplayLabel = 'Cod Lista'
      FieldName = 'COD_LISTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
    end
    object CdscotacaoItensPRAZO_MEDIO_ENT: TFloatField
      DisplayLabel = 'Prazo Med Ent'
      FieldName = 'PRAZO_MEDIO_ENT'
    end
    object CdscotacaoItensPRAZO_MEDIO_PAG: TFloatField
      DisplayLabel = 'Prazo Med Pag'
      FieldName = 'PRAZO_MEDIO_PAG'
    end
    object CdscotacaoItensIRRF: TFloatField
      FieldName = 'IRRF'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensADIRRF: TFloatField
      DisplayLabel = 'Adicional IRRF'
      FieldName = 'ADIRRF'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensCSLL: TFloatField
      FieldName = 'CSLL'
      DisplayFormat = '#0.00'
    end
    object CdscotacaoItensLUCRORETIDO: TFloatField
      DisplayLabel = 'Lucro Retido'
      FieldName = 'LUCRORETIDO'
      DisplayFormat = '#0.00'
    end
  end
  object IbProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 352
    Top = 464
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'DspProdutos'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 560
    Top = 464
  end
  object DspProdutos: TDataSetProvider
    DataSet = IbProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 440
    Top = 464
  end
  object DtCotacao: TDataSource
    DataSet = CdsCotacao
    Left = 456
    Top = 512
  end
  object DtcotacaoItens: TDataSource
    DataSet = CdscotacaoItens
    Left = 560
    Top = 512
  end
  object Ibcolaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select NOME_VENDEDOR, COD_VENDEDOR from COLABORADOR')
    Left = 752
    Top = 32
  end
  object CdsColaborador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspColaborador'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 756
    Top = 146
    object CdsColaboradorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object CdsColaboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
  end
  object DspColaborador: TDataSetProvider
    DataSet = Ibcolaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 752
    Top = 88
  end
  object Dtcolaborador: TDataSource
    DataSet = CdsColaborador
    Left = 755
    Top = 208
  end
  object IbFornecedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      
        'select COD_CLIENTE, NOME_CLIENTE, COD_COND_PAG, prazo_medio_ent,' +
        ' prazo_medio_pag from CLIENTES WHERE ATIVO = 1')
    Left = 876
    Top = 24
  end
  object CdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFornecedor'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 872
    Top = 144
    object CdsFornecedorCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object CdsFornecedorNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object CdsFornecedorCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
    end
    object CdsFornecedorPRAZO_MEDIO_ENT: TFloatField
      FieldName = 'PRAZO_MEDIO_ENT'
    end
    object CdsFornecedorPRAZO_MEDIO_PAG: TFloatField
      FieldName = 'PRAZO_MEDIO_PAG'
    end
  end
  object DspFornecedor: TDataSetProvider
    DataSet = IbFornecedor
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 872
    Top = 83
  end
  object DtFornecedor: TDataSource
    DataSet = CdsFornecedor
    Left = 872
    Top = 208
  end
  object DtApuracaoDep: TDataSource
    DataSet = CdsApuracaoDep
    Left = 632
    Top = 408
  end
  object QrVinculacaoDPTO: TQuery
    Left = 736
    Top = 408
  end
  object qrListaCotacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      ' SELECT * FROM LISTA_COTACAO'
      'WHERE COD_LISTA = 1'
      'AND COD_EMPRESA = 1')
    Left = 160
    Top = 576
  end
  object dspListaCotacao: TDataSetProvider
    DataSet = qrListaCotacao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 272
    Top = 576
  end
  object cdsListaCotacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaCotacao'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 408
    Top = 576
    object cdsListaCotacaoCOD_LISTA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_LISTA'
      Required = True
    end
    object cdsListaCotacaoCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsListaCotacaoDESCRICAO_LISTA: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_LISTA'
      Size = 75
    end
    object cdsListaCotacaoOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      OnGetText = cdsListaCotacaoOBSGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsListaCotacaoNUM_PED: TIntegerField
      DisplayLabel = 'Num Ped'
      FieldName = 'NUM_PED'
    end
    object cdsListaCotacaoCOD_COTACAO: TIntegerField
      DisplayLabel = 'Cod Cotacao'
      FieldName = 'COD_COTACAO'
    end
    object cdsListaCotacaoATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsListaCotacaoDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
  end
  object dsListaCotacao: TDataSource
    DataSet = cdsListaCotacao
    Left = 536
    Top = 576
  end
  object qrListaCotacaoItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'SELECT LISTA_COTACAO_ITENS2.COD_LISTA,'
      
        'LISTA_COTACAO_ITENS2.GRUPO_PROD, LISTA_COTACAO_ITENS2.COD_PROD, ' +
        'LISTA_COTACAO_ITENS2.COD_GRADE,'
      
        'LISTA_COTACAO_ITENS2.COD_EMP_MULT, LISTA_COTACAO_ITENS2.COD_EMPR' +
        'ESA,'
      
        'LISTA_COTACAO_ITENS2.NUM_FAB_PROD, LISTA_COTACAO_ITENS2.DESCR_PR' +
        'OD, LISTA_COTACAO_ITENS2.QUANT_PROD,'
      'LISTA_COTACAO_ITENS2.NUM_PED, LISTA_COTACAO_ITENS2.COD_COTACAO,'
      'case when (PRODUTOS.PESO_LIQ_PROD is null) then'
      '        null'
      '     else'
      
        '        (coalesce(LISTA_COTACAO_ITENS2.QUANT_PROD, 0) * coalesce' +
        '(PRODUTOS.PESO_LIQ_PROD,  0))'
      'end PESO_LIQ_PROD,'
      'case when (PRODUTOS.PESO_BRUT_PROD is null) then'
      '        null'
      '     else'
      
        '        (coalesce(LISTA_COTACAO_ITENS2.QUANT_PROD, 0) * coalesce' +
        '(PRODUTOS.PESO_BRUT_PROD,  0))'
      'end PESO_BRUT_PROD,'
      
        'PRODUTOS.LOCACAO_PROD, PRODUTOS.LOCACAO_PROD_1 FROM LISTA_COTACA' +
        'O_ITENS2'
      
        'LEFT JOIN PRODUTOS on PRODUTOS.GRUPO_PROD = LISTA_COTACAO_ITENS2' +
        '.GRUPO_PROD and PRODUTOS.COD_PROD = LISTA_COTACAO_ITENS2.COD_PRO' +
        'D and PRODUTOS.COD_EMPRESA = LISTA_COTACAO_ITENS2.COD_EMP_MULT '
      'WHERE LISTA_COTACAO_ITENS2.COD_LISTA = 1'
      'AND LISTA_COTACAO_ITENS2.COD_EMPRESA = 1'
      'ORDER BY 1, 2, 3, 4, 5 ')
    Left = 160
    Top = 648
  end
  object dspListaCotacaoItens: TDataSetProvider
    DataSet = qrListaCotacaoItens
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 272
    Top = 648
  end
  object cdsListaCotacaoItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaCotacaoItens'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 408
    Top = 648
    object cdsListaCotacaoItensCOD_LISTA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_LISTA'
      Required = True
    end
    object cdsListaCotacaoItensGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsListaCotacaoItensCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsListaCotacaoItensCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsListaCotacaoItensCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsListaCotacaoItensNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabr'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsListaCotacaoItensDESCR_PROD: TStringField
      DisplayLabel = 'Descr Prod'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsListaCotacaoItensQUANT_PROD: TFloatField
      DisplayLabel = 'Quant'
      FieldName = 'QUANT_PROD'
      DisplayFormat = '#0.000'
    end
    object cdsListaCotacaoItensNUM_PED: TIntegerField
      DisplayLabel = 'Num Ped'
      FieldName = 'NUM_PED'
    end
    object cdsListaCotacaoItensCOD_COTACAO: TIntegerField
      DisplayLabel = 'Cod Cotacao'
      FieldName = 'COD_COTACAO'
    end
    object cdsListaCotacaoItensCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Emp'
      FieldName = 'COD_EMP_MULT'
      Required = True
    end
    object cdsListaCotacaoItensPESO_LIQ_PROD: TFloatField
      DisplayLabel = 'Peso Liq'
      FieldName = 'PESO_LIQ_PROD'
    end
    object cdsListaCotacaoItensPESO_BRUT_PROD: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsListaCotacaoItensLOCACAO_PROD: TStringField
      DisplayLabel = 'Locacao'
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsListaCotacaoItensLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Locacao 1'
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
  end
  object dsListaCotacaoItens: TDataSource
    DataSet = cdsListaCotacaoItens
    Left = 536
    Top = 648
  end
  object QrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    Left = 400
    Top = 16
  end
  object IbCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'SELECT * FROM COND_PAG')
    Left = 968
    Top = 24
  end
  object DtCondPag: TDataSource
    DataSet = CdsCondPag
    Left = 971
    Top = 207
  end
  object CdsCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCondPag'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 968
    Top = 144
    object CdsCondPagCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object CdsCondPagDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object CdsCondPagSEQPRECO: TStringField
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object CdsCondPagMAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
    end
    object CdsCondPagATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsCondPagFINALIZADOR_CUPOM: TIntegerField
      FieldName = 'FINALIZADOR_CUPOM'
    end
    object CdsCondPagNATUREZA_CP: TStringField
      FieldName = 'NATUREZA_CP'
      FixedChar = True
      Size = 1
    end
  end
  object DspCondPag: TDataSetProvider
    DataSet = IbCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 968
    Top = 80
  end
  object qrAtributos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransHwGestor
    SQL.Strings = (
      'select * from atributos where ativo = 1')
    Left = 160
    Top = 720
  end
  object dspAtributos: TDataSetProvider
    DataSet = qrAtributos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 272
    Top = 720
  end
  object cdsAtributos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtributos'
    BeforeOpen = CdsEmpresasBeforeOpen
    Left = 408
    Top = 720
    object cdsAtributosCOD_ATRIBUTO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_ATRIBUTO'
      Required = True
    end
    object cdsAtributosCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAtributosDESCRICAO_ATRIBUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ATRIBUTO'
      Size = 30
    end
    object cdsAtributosDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsAtributosATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsAtributos: TDataSource
    DataSet = cdsAtributos
    Left = 536
    Top = 720
  end
  object RDprintGestor: TRDprint
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
    Left = 584
    Top = 13
  end
end
