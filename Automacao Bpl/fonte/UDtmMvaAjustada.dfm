object dtmMvaAjustada: TdtmMvaAjustada
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 346
  Width = 596
  object cdsMvaAjustada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMvaAjustada'
    BeforeOpen = cdsMvaAjustadaBeforeOpen
    Left = 64
    Top = 192
    object cdsMvaAjustadaCODIGO_UF: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsMvaAjustadaCOD_NCM: TStringField
      DisplayLabel = 'C'#243'digo NCM'
      FieldName = 'COD_NCM'
      Required = True
      Size = 8
    end
    object cdsMvaAjustadaALIQ_INTER: TFloatField
      DisplayLabel = 'Aliquota Inter.'
      FieldName = 'ALIQ_INTER'
    end
    object cdsMvaAjustadaALIQ_INTRA: TFloatField
      DisplayLabel = 'Aliquota Intra.'
      FieldName = 'ALIQ_INTRA'
    end
    object cdsMvaAjustadaMVA_ST_ORIGINAL: TFloatField
      DisplayLabel = 'MVA-ST Original'
      FieldName = 'MVA_ST_ORIGINAL'
    end
    object cdsMvaAjustadaMVA_AJUSTADA: TFloatField
      DisplayLabel = 'MVA Ajustada'
      FieldName = 'MVA_AJUSTADA'
    end
  end
  object dspMvaAjustada: TDataSetProvider
    DataSet = qrMvaAjustada
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 64
    Top = 136
  end
  object dsMvaAjustada: TDataSource
    DataSet = cdsMvaAjustada
    Left = 64
    Top = 248
  end
  object qrMvaAjustada: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransMvaAjustada
    SQL.Strings = (
      'Select * from MVA_AJUSTADA_NCM')
    Left = 64
    Top = 72
  end
  object IBTransMvaAjustada: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 64
    Top = 16
  end
  object dsUF: TDataSource
    DataSet = qrUF
    Left = 176
    Top = 248
  end
  object qrUF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransMvaAjustada
    SQL.Strings = (
      'Select * from ESTADOS')
    Left = 176
    Top = 200
    object qrUFCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = '"ESTADOS"."CODIGO_UF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrUFNOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"ESTADOS"."NOME_UF"'
      Size = 30
    end
    object qrUFSIGLA_UF: TIBStringField
      FieldName = 'SIGLA_UF'
      Origin = '"ESTADOS"."SIGLA_UF"'
      FixedChar = True
      Size = 2
    end
    object qrUFATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"ESTADOS"."ATIVO"'
    end
    object qrUFIBGE_CODIGO_UF: TIntegerField
      FieldName = 'IBGE_CODIGO_UF'
      Origin = '"ESTADOS"."IBGE_CODIGO_UF"'
    end
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransMvaAjustada
    SQL.Strings = (
      '')
    Left = 176
    Top = 16
  end
end
