object dtmExemplo: TdtmExemplo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 297
  Top = 86
  Height = 389
  Width = 458
  object dspFornec: TDataSetProvider
    DataSet = qrFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 88
    Top = 104
  end
  object cdsFornec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornec'
    BeforeOpen = cdsFornecBeforeOpen
    Left = 88
    Top = 160
    object cdsFornecCODIGO_F: TIntegerField
      Tag = 2
      FieldName = 'CODIGO_F'
      Required = True
    end
    object cdsFornecCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFornecCODIGO_T_F: TIntegerField
      FieldName = 'CODIGO_T_F'
      Required = True
    end
    object cdsFornecCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsFornecGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsFornecCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsFornecCPF_CGC_F: TStringField
      FieldName = 'CPF_CGC_F'
      FixedChar = True
      Size = 18
    end
    object cdsFornecNOME: TStringField
      FieldName = 'NOME'
      Size = 35
    end
    object cdsFornecIE_F: TStringField
      FieldName = 'IE_F'
      FixedChar = True
      Size = 18
    end
    object cdsFornecEND_F: TStringField
      FieldName = 'END_F'
      Size = 35
    end
    object cdsFornecBAIRF: TStringField
      FieldName = 'BAIRF'
      Size = 35
    end
    object cdsFornecCIDA_F: TStringField
      FieldName = 'CIDA_F'
      Size = 35
    end
    object cdsFornecCEP_F: TStringField
      FieldName = 'CEP_F'
      FixedChar = True
      Size = 9
    end
    object cdsFornecFONE_F: TStringField
      FieldName = 'FONE_F'
      FixedChar = True
      Size = 14
    end
    object cdsFornecRAMAL_F: TStringField
      FieldName = 'RAMAL_F'
      FixedChar = True
      Size = 5
    end
    object cdsFornecCONTATO_F: TStringField
      FieldName = 'CONTATO_F'
      Size = 10
    end
    object cdsFornecTEL_RES_CF: TStringField
      FieldName = 'TEL_RES_CF'
      FixedChar = True
      Size = 14
    end
    object cdsFornecOBS_F: TMemoField
      FieldName = 'OBS_F'
      BlobType = ftMemo
      Size = 8
    end
    object cdsFornecINSC_SUB_F: TStringField
      FieldName = 'INSC_SUB_F'
      FixedChar = True
      Size = 18
    end
    object cdsFornecEMAIL_F: TStringField
      FieldName = 'EMAIL_F'
      FixedChar = True
      Size = 30
    end
    object cdsFornecFAX_F: TStringField
      FieldName = 'FAX_F'
      FixedChar = True
      Size = 14
    end
    object cdsFornecDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsFornecCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsFornecCOD_BAIRRO: TSmallintField
      FieldName = 'COD_BAIRRO'
    end
    object cdsFornecCDMICROEPP: TStringField
      FieldName = 'CDMICROEPP'
      FixedChar = True
      Size = 1
    end
    object cdsFornecATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsFornec: TDataSource
    DataSet = cdsFornec
    Left = 88
    Top = 224
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = IBQuery2
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 88
  end
  object cdsColunas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    BeforeOpen = cdsFornecBeforeOpen
    Left = 280
    Top = 144
    object cdsColunasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
    end
    object cdsColunasCOMPONENTE: TStringField
      FieldName = 'COMPONENTE'
      Required = True
      Size = 64
    end
    object cdsColunasCAMPOS: TStringField
      FieldName = 'CAMPOS'
      Required = True
      Size = 64
    end
    object cdsColunasVISIVEL: TIntegerField
      FieldName = 'VISIVEL'
    end
    object cdsColunasORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object qrFornec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from FORNECEDOR')
    Left = 88
    Top = 48
  end
  object IBQuery2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransaction2
    SQL.Strings = (
      'select * from CONFIG_COLUNAS')
    Left = 280
    Top = 40
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 184
    Top = 8
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 312
    Top = 8
  end
end
