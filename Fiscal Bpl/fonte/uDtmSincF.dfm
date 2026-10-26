object dtmSincF: TdtmSincF
  OldCreateOrder = False
  Height = 381
  Width = 467
  object transacaoFiscal: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoFiscal
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 96
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    Left = 168
    Top = 7
  end
  object cdsSincF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSincF'
    BeforeOpen = cdsSincFBeforeOpen
    Left = 22
    Top = 172
  end
  object qrSincF: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    Left = 22
    Top = 64
  end
  object dspSincF: TDataSetProvider
    DataSet = qrSincF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 22
    Top = 117
  end
  object dsSincF: TDataSource
    AutoEdit = False
    DataSet = cdsSincF
    Left = 22
    Top = 223
  end
  object cdsSinc2F: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSinc2F'
    BeforeOpen = cdsSincFBeforeOpen
    Left = 102
    Top = 172
  end
  object qrSinc2F: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoBancoHw
    Left = 102
    Top = 64
  end
  object dspSinc2F: TDataSetProvider
    DataSet = qrSinc2F
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 102
    Top = 117
  end
  object dsSinc2F: TDataSource
    AutoEdit = False
    DataSet = cdsSinc2F
    Left = 102
    Top = 223
  end
  object transacaoBancoHw: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 256
    Top = 8
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoBancoHw
    Left = 358
    Top = 8
  end
  object ibqrExec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoBancoHw
    Left = 358
    Top = 64
  end
  object ibqrTemp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoBancoHw
    Left = 358
    Top = 128
  end
  object ibqrTemp2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoBancoHw
    Left = 358
    Top = 184
  end
  object ibqrTemp3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoBancoHw
    Left = 358
    Top = 232
  end
end
