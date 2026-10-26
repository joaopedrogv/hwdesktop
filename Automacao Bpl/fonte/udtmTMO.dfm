object dtmTMO: TdtmTMO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 513
  Width = 978
  object IBTransTMO: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 48
    Top = 32
  end
  object cdsTMO2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTMO2'
    BeforeOpen = cdsTMOBeforeOpen
    Left = 624
    Top = 184
    object IntegerField1: TIntegerField
      FieldName = 'N_OS'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DIA'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'HORA_INICIO'
      Required = True
      FixedChar = True
      Size = 8
    end
    object StringField2: TStringField
      FieldName = 'TIPO_OP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IntegerField3: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'HORA_FIM'
      FixedChar = True
      Size = 8
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DIA_FECHADO'
    end
    object IntegerField5: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dspTMO2: TDataSetProvider
    DataSet = qrTMO2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 624
    Top = 128
  end
  object dsTMO2: TDataSource
    DataSet = cdsTMO2
    Left = 624
    Top = 240
  end
  object qrTMO2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTMO
    SQL.Strings = (
      'select  *  from TMO_SERV_OS')
    Left = 624
    Top = 72
  end
  object cdsColab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColab'
    BeforeOpen = cdsTMOBeforeOpen
    Left = 712
    Top = 184
    object cdsColabCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColabNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dspColab: TDataSetProvider
    DataSet = qrColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 712
    Top = 128
  end
  object dsColab: TDataSource
    DataSet = cdsColab
    Left = 712
    Top = 240
  end
  object qrColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTMO
    SQL.Strings = (
      'select c.cod_vendedor, c.nome_vendedor from colaborador c'
      'order by c.nome_vendedor')
    Left = 712
    Top = 72
  end
  object cdsServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServ'
    BeforeOpen = cdsTMOBeforeOpen
    Left = 808
    Top = 184
    object cdsServCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsServDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsServTMO: TFloatField
      FieldName = 'TMO'
    end
  end
  object dspServ: TDataSetProvider
    DataSet = qrServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 808
    Top = 128
  end
  object dsServ: TDataSource
    DataSet = cdsServ
    Left = 808
    Top = 240
  end
  object qrServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTMO
    SQL.Strings = (
      
        'select ts.cod_servico,ts.desc_servico, ts.tmo from tipo_servico ' +
        'ts'
      'order by ts.desc_servico')
    Left = 808
    Top = 72
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTMO
    Left = 704
    Top = 8
  end
end
