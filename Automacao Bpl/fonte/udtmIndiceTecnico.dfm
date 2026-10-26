object dtmIndice: TdtmIndice
  OldCreateOrder = False
  Left = 187
  Top = 2
  Height = 444
  Width = 746
  object IBTransIndiceTec: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 64
    Top = 16
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 64
    Top = 64
  end
  object dspIndiceTec: TDataSetProvider
    DataSet = qrIndiceTec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 160
    Top = 72
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
        'resa')
    Left = 160
    Top = 24
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
  end
  object dsIndiceTec: TDataSource
    DataSet = cdsIndiceTec
    Left = 160
    Top = 168
  end
  object cdsIndiceTec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIndiceTec'
    BeforeOpen = cdsIndiceTecBeforeOpen
    Left = 160
    Top = 120
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
  end
  object qrProduto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select * from PRODUTOS')
    Left = 240
    Top = 24
  end
  object dspProduto: TDataSetProvider
    DataSet = qrProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 240
    Top = 72
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 240
    Top = 120
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 240
    Top = 169
  end
  object qrBuscas02: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransIndiceTec
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 64
    Top = 120
  end
end
