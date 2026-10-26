object DtmConsGeral: TDtmConsGeral
  OldCreateOrder = False
  Height = 387
  Width = 630
  object IbDtbConsGeral: TIBDatabase
    DatabaseName = '127.0.0.1:d:\clientes\motomol\Hwauto.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IbTransConsGeral
    Left = 32
    Top = 16
  end
  object IbTransConsGeral: TIBTransaction
    DefaultDatabase = IbDtbConsGeral
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 16
  end
  object IbQueryGeral: TIBQuery
    Database = IbDtbConsGeral
    Transaction = IbTransConsGeral
    Left = 32
    Top = 72
  end
  object DspConsGeral: TDataSetProvider
    DataSet = IbQueryGeral
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 72
  end
  object CdsConsGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConsGeral'
    BeforeOpen = CdsConsGeralBeforeOpen
    Left = 32
    Top = 144
  end
  object IbCadConsGeral: TIBQuery
    Database = IbDtbConsGeral
    Transaction = IbTransConsGeral
    Left = 208
    Top = 16
  end
  object QrBuscas: TIBQuery
    Database = IbDtbConsGeral
    Transaction = IbTransConsGeral
    Left = 208
    Top = 72
  end
  object DspcadconsGeral: TDataSetProvider
    DataSet = IbCadConsGeral
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 312
    Top = 16
  end
  object CdsCadConsGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspcadconsGeral'
    Left = 304
    Top = 72
  end
  object IbSenhas: TIBQuery
    Database = IbDtbConsGeral
    Transaction = IbTransConsGeral
    Left = 120
    Top = 144
  end
  object Dtsenhas: TDataSource
    DataSet = IbSenhas
    Left = 200
    Top = 136
  end
  object IbSenhaVinc: TIBQuery
    Database = IbDtbConsGeral
    Transaction = IbTransConsGeral
    SQL.Strings = (
      
        'select v.cod_consulta,v.usuario,v.cod_usuario,v.cod_empresa from' +
        ' user_consultasdiv v,sqlconsultasdiv sq where v.cod_consulta = s' +
        'q.cod_consulta and v.cod_empresa = sq.cod_empresa')
    Left = 120
    Top = 200
  end
  object CdsSenhasVinc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSenhasvinc'
    BeforeOpen = CdsSenhasVincBeforeOpen
    Left = 192
    Top = 200
    object CdsSenhasVincCOD_CONSULTA: TIntegerField
      FieldName = 'COD_CONSULTA'
      Required = True
    end
    object CdsSenhasVincUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 10
    end
    object CdsSenhasVincCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object CdsSenhasVincCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object DspSenhasvinc: TDataSetProvider
    DataSet = IbSenhaVinc
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 32
    Top = 200
  end
  object DtSenhavinc: TDataSource
    DataSet = CdsSenhasVinc
    Left = 280
    Top = 200
  end
  object Qrbuscas1: TIBQuery
    Database = IbDtbConsGeral
    Transaction = IbTransConsGeral
    Left = 280
    Top = 136
  end
  object CdsConsultaus: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 256
    object CdsConsultausNOME_CAMPO: TStringField
      FieldName = 'NOME_CAMPO'
      Size = 30
    end
    object CdsConsultausSEQINT: TIntegerField
      FieldName = 'SEQINT'
    end
    object CdsConsultausTIPO_CAMPO: TStringField
      FieldName = 'TIPO_CAMPO'
      Size = 1
    end
  end
end
