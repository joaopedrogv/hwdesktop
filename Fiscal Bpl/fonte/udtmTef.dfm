object dtmTef: TdtmTef
  OldCreateOrder = False
  Height = 344
  Width = 617
  object transacaoFiscal: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 96
    Top = 8
  end
  object qrTransTef: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from TRANSTEF')
    Left = 28
    Top = 56
  end
  object dspTransTef: TDataSetProvider
    DataSet = qrTransTef
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 28
    Top = 109
  end
  object cdsTransTef: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransTef'
    BeforeOpen = cdsTransTefBeforeOpen
    Left = 27
    Top = 164
    object cdsTransTefDATATRANS: TStringField
      FieldName = 'DATATRANS'
      Required = True
      Size = 8
    end
    object cdsTransTefNSUTRANS: TStringField
      DisplayWidth = 32
      FieldName = 'NSUTRANS'
      Required = True
      Size = 32
    end
    object cdsTransTefVALOR: TStringField
      FieldName = 'VALOR'
      Size = 32
    end
    object cdsTransTefHORA: TStringField
      FieldName = 'HORA'
      Size = 6
    end
    object cdsTransTefREDETRANS: TStringField
      FieldName = 'REDETRANS'
      Size = 32
    end
    object cdsTransTefFINALIZACAO: TStringField
      FieldName = 'FINALIZACAO'
      Size = 30
    end
    object cdsTransTefDOCVINCULADO: TIntegerField
      FieldName = 'DOCVINCULADO'
    end
    object cdsTransTefTEFNAOCONFIRMADO: TStringField
      FieldName = 'TEFNAOCONFIRMADO'
      Size = 1
    end
    object cdsTransTefTIPOCONFIRMACAO: TStringField
      FieldName = 'TIPOCONFIRMACAO'
      Size = 3
    end
  end
  object dsTransTef: TDataSource
    DataSet = cdsTransTef
    Left = 28
    Top = 215
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoFiscal
    Left = 168
    Top = 7
  end
  object qrTransacoes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from transacoes_tef'
      
        'where transacoes_tef.data_transacao = :data and transacoes_tef.c' +
        'od_empresa = 1'
      'order by seqid')
    Left = 116
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
  end
  object dspTransacoes: TDataSetProvider
    DataSet = qrTransacoes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 116
    Top = 109
  end
  object cdsTransacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransacoes'
    BeforeOpen = cdsTransTefBeforeOpen
    Left = 115
    Top = 164
    object cdsTransacoesSEQID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsTransacoesCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsTransacoesNUM_DOC: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'NUM_DOC'
      Size = 32
    end
    object cdsTransacoesVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      EditFormat = '#,##0.00'
    end
    object cdsTransacoesMOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 1
    end
    object cdsTransacoesSTATUS_TRANSACAO: TStringField
      DisplayLabel = 'Status Transa'#231#227'o'
      FieldName = 'STATUS_TRANSACAO'
      Size = 3
    end
    object cdsTransacoesNOME_REDE: TStringField
      DisplayLabel = 'Rede'
      FieldName = 'NOME_REDE'
      Size = 32
    end
    object cdsTransacoesTIPO_TRANSACAO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_TRANSACAO'
      FixedChar = True
      Size = 2
    end
    object cdsTransacoesNSU: TStringField
      FieldName = 'NSU'
      Size = 32
    end
    object cdsTransacoesNUM_AUT: TStringField
      DisplayLabel = 'Numero Autoriza'#231#227'o'
      FieldName = 'NUM_AUT'
      Size = 32
    end
    object cdsTransacoesDATA_HORA_HOST_TR: TDateTimeField
      DisplayLabel = 'Data Hora Host'
      FieldName = 'DATA_HORA_HOST_TR'
    end
    object cdsTransacoesDATA_HORA_LOCAL_TR: TDateTimeField
      DisplayLabel = 'Data Hora Local'
      FieldName = 'DATA_HORA_LOCAL_TR'
    end
    object cdsTransacoesQTDE_PARCELAS: TSmallintField
      DisplayLabel = 'Parcelas'
      FieldName = 'QTDE_PARCELAS'
    end
    object cdsTransacoesDATA_TRANSACAO: TDateTimeField
      DisplayLabel = 'Data Transa'#231#227'o'
      FieldName = 'DATA_TRANSACAO'
    end
    object cdsTransacoesHORA_TRANSACAO: TStringField
      DisplayLabel = 'Hora Transa'#231#227'o'
      FieldName = 'HORA_TRANSACAO'
      Size = 8
    end
    object cdsTransacoesNUMERO_CONTROLE: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NUMERO_CONTROLE'
      Size = 32
    end
    object cdsTransacoesBANDEIRA_CARTAO: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BANDEIRA_CARTAO'
      Size = 32
    end
  end
  object dsTransacoes: TDataSource
    DataSet = cdsTransacoes
    Left = 116
    Top = 215
  end
end
