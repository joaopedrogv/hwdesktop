object dtmAtivo: TdtmAtivo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 346
  Width = 566
  object bancoHw: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object bancoHwF: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 120
    Top = 16
  end
  object bancoFiscal: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 208
    Top = 16
  end
  object BancoCCIA: TIBDatabase
    Left = 288
    Top = 16
  end
  object DspConfigColunas: TDataSetProvider
    DataSet = IbConfigColunas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 134
    Top = 81
  end
  object CdsConfigColunas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConfigColunas'
    BeforeOpen = CdsConfigColunasBeforeOpen
    Left = 231
    Top = 81
    object CdsConfigColunasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
    end
    object CdsConfigColunasCOMPONENTE: TStringField
      FieldName = 'COMPONENTE'
      Required = True
      Size = 64
    end
    object CdsConfigColunasCAMPOS: TStringField
      FieldName = 'CAMPOS'
      Required = True
      Size = 64
    end
    object CdsConfigColunasVISIVEL: TIntegerField
      FieldName = 'VISIVEL'
    end
    object CdsConfigColunasORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object CdsConfigColunasLARGURA_EXIBICAO: TIntegerField
      FieldName = 'LARGURA_EXIBICAO'
    end
  end
  object IbConfigColunas: TIBQuery
    Database = bancoHw
    Transaction = IbTransCol
    SQL.Strings = (
      'select * from CONFIG_COLUNAS')
    Left = 40
    Top = 80
  end
  object IbTransCol: TIBTransaction
    DefaultDatabase = bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 64
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 218
    Top = 234
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 106
    Top = 162
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    FontHandling = fhSubstitute
    Left = 168
    Top = 216
  end
  object QRHTMLFilter1: TQRHTMLFilter
    MultiPage = False
    PageLinks = False
    FinalPage = 0
    FirstLastLinks = False
    Concat = False
    ConcatCount = 1
    LinkFontSize = 12
    LinkFontName = 'Arial'
    Left = 168
    Top = 168
  end
  object QRTextFilter1: TQRTextFilter
    Left = 104
    Top = 208
  end
  object QRXMLSFilter1: TQRXMLSFilter
    Left = 216
    Top = 184
  end
  object BancoHWCX: TIBDatabase
    DatabaseName = '127.0.0.1:c:\Caixag.gdb'
    Left = 40
    Top = 144
  end
  object ApplicationEventos: TApplicationEvents
    OnException = ApplicationEventosException
    Left = 288
    Top = 136
  end
  object IbBuscas: TIBQuery
    Database = bancoHw
    Transaction = IbTransCol
    SQL.Strings = (
      'select * from CONFIG_COLUNAS')
    Left = 24
    Top = 240
  end
  object BancoAuditoria: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 376
    Top = 16
  end
  object transacaoQueryHwauto: TIBTransaction
    DefaultDatabase = bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 448
    Top = 128
  end
  object queryHwauto: TIBQuery
    Database = bancoHw
    Transaction = transacaoQueryHwauto
    Left = 448
    Top = 176
  end
  object queryFuso: TIBQuery
    Database = bancoHw
    Transaction = transacaoQueryHwauto
    Left = 448
    Top = 224
  end
  object qrAudit: TIBQuery
    Database = bancoHw
    Transaction = transacaoAudit
    Left = 464
    Top = 8
  end
  object transacaoAudit: TIBTransaction
    DefaultDatabase = bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 512
    Top = 8
  end
end
