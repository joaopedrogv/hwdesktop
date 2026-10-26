object dtmAssistente: TdtmAssistente
  OldCreateOrder = False
  Left = 423
  Top = 190
  Height = 391
  Width = 464
  object qrF: TIBQuery
    Database = bdF
    Transaction = transF
    SQL.Strings = (
      'select * from MENUS_AUTO')
    Left = 32
    Top = 56
  end
  object dspF: TDataSetProvider
    DataSet = qrF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 32
    Top = 104
  end
  object cdsF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspF'
    BeforeOpen = cdsFBeforeOpen
    Left = 32
    Top = 152
  end
  object dsF: TDataSource
    DataSet = cdsF
    Left = 32
    Top = 200
  end
  object transHw: TIBTransaction
    DefaultDatabase = bdHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 368
    Top = 57
  end
  object SpIncCodigo: TIBStoredProc
    Database = bdHw
    Transaction = transHw
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 116
    Top = 1
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
  object qrBuscas: TIBQuery
    Database = bdHw
    Transaction = transHw
    Left = 185
    Top = 1
  end
  object bdF: TIBDatabase
    DatabaseName = 'c:\basesauto\Fiscal.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = transF
    Left = 280
    Top = 8
  end
  object bdHw: TIBDatabase
    Connected = True
    DatabaseName = 'c:\basesauto\Hw.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = transHw
    Left = 368
    Top = 8
  end
  object transF: TIBTransaction
    DefaultDatabase = bdF
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 280
    Top = 57
  end
  object qrHw: TIBQuery
    Database = bdHw
    Transaction = transHw
    SQL.Strings = (
      'select * from MENUS_AUTO')
    Left = 128
    Top = 64
  end
  object dspHw: TDataSetProvider
    DataSet = qrHw
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 128
    Top = 112
  end
  object cdsHw: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHw'
    BeforeOpen = cdsFBeforeOpen
    Left = 128
    Top = 160
  end
  object dsHw: TDataSource
    DataSet = cdsHw
    Left = 128
    Top = 208
  end
  object qrCNIEE: TIBQuery
    Database = bdF
    Transaction = transF
    SQL.Strings = (
      'select * from IMPRESSORAS_CNIEE')
    Left = 241
    Top = 1
    object qrCNIEEIDENTIFICACAO: TIBStringField
      FieldName = 'IDENTIFICACAO'
      Origin = '"IMPRESSORAS_CNIEE"."IDENTIFICACAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrCNIEETIPO_ECF: TIBStringField
      FieldName = 'TIPO_ECF'
      Origin = '"IMPRESSORAS_CNIEE"."TIPO_ECF"'
    end
    object qrCNIEEMARCA_ECF: TIBStringField
      FieldName = 'MARCA_ECF'
      Origin = '"IMPRESSORAS_CNIEE"."MARCA_ECF"'
    end
    object qrCNIEEMODELO_ECF: TIBStringField
      FieldName = 'MODELO_ECF'
      Origin = '"IMPRESSORAS_CNIEE"."MODELO_ECF"'
      Size = 35
    end
    object qrCNIEEVERSAOSB: TIBStringField
      FieldName = 'VERSAOSB'
      Origin = '"IMPRESSORAS_CNIEE"."VERSAOSB"'
    end
    object qrCNIEEQTDELACRESEXTSL: TIntegerField
      FieldName = 'QTDELACRESEXTSL'
      Origin = '"IMPRESSORAS_CNIEE"."QTDELACRESEXTSL"'
    end
    object qrCNIEEQTDELACRESEXTFAB: TIntegerField
      FieldName = 'QTDELACRESEXTFAB'
      Origin = '"IMPRESSORAS_CNIEE"."QTDELACRESEXTFAB"'
    end
    object qrCNIEETEMFD: TIBStringField
      FieldName = 'TEMFD'
      Origin = '"IMPRESSORAS_CNIEE"."TEMFD"'
      FixedChar = True
      Size = 1
    end
    object qrCNIEELACREMFD: TIBStringField
      FieldName = 'LACREMFD'
      Origin = '"IMPRESSORAS_CNIEE"."LACREMFD"'
      FixedChar = True
      Size = 1
    end
    object qrCNIEEATO_APROVACAO: TIBStringField
      FieldName = 'ATO_APROVACAO'
      Origin = '"IMPRESSORAS_CNIEE"."ATO_APROVACAO"'
      Size = 30
    end
    object qrCNIEEATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"IMPRESSORAS_CNIEE"."ATIVO"'
    end
  end
  object dsCNIEE: TDataSource
    AutoEdit = False
    DataSet = qrCNIEE
    Left = 244
    Top = 49
  end
end
