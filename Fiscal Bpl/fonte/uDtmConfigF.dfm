object DtmConfigF: TDtmConfigF
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 319
  Width = 834
  object cdsConfImp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfImp'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 30
    Top = 172
    object cdsConfImpNUM_SERIE_ECF: TStringField
      FieldName = 'NUM_SERIE_ECF'
    end
    object cdsConfImpMODELO_IMPRESSORA: TStringField
      FieldName = 'MODELO_IMPRESSORA'
    end
    object cdsConfImpPORTA_IMPRESSORA: TSmallintField
      FieldName = 'PORTA_IMPRESSORA'
    end
    object cdsConfImpNUM_EQUIP: TStringField
      FieldName = 'NUM_EQUIP'
      FixedChar = True
      Size = 3
    end
    object cdsConfImpCOD_TERMINAL: TSmallintField
      FieldName = 'COD_TERMINAL'
    end
    object cdsConfImpQTDE_DIG_DAV: TSmallintField
      FieldName = 'QTDE_DIG_DAV'
    end
    object cdsConfImpPORTA_LEITOR: TSmallintField
      FieldName = 'PORTA_LEITOR'
    end
    object cdsConfImpQT_VIAS_NAOFISCAIS: TSmallintField
      FieldName = 'QT_VIAS_NAOFISCAIS'
    end
    object cdsConfImpOBSERVACAO_CUPOM: TStringField
      FieldName = 'OBSERVACAO_CUPOM'
      Size = 50
    end
    object cdsConfImpMODELO_BALANCA: TStringField
      FieldName = 'MODELO_BALANCA'
    end
    object cdsConfImpCONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object cdsConfImpALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
    end
    object cdsConfImpMAX_DESC_ITEM: TFloatField
      FieldName = 'MAX_DESC_ITEM'
    end
    object cdsConfImpMODELO_DOCF: TStringField
      FieldName = 'MODELO_DOCF'
      FixedChar = True
      Size = 2
    end
    object cdsConfImpARREDONDAR_TRUNCAR: TStringField
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpTECLADO_PDV: TStringField
      FieldName = 'TECLADO_PDV'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpUSAR_TEF: TStringField
      FieldName = 'USAR_TEF'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpLEITURA_SUP: TStringField
      FieldName = 'LEITURA_SUP'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpVALOR_UNIT_3DIG: TStringField
      FieldName = 'VALOR_UNIT_3DIG'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpLEITURA_MEM_FISCAL: TStringField
      FieldName = 'LEITURA_MEM_FISCAL'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpABRIR_GAVETA: TStringField
      FieldName = 'ABRIR_GAVETA'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpUSAR_CODBARRA: TStringField
      FieldName = 'USAR_CODBARRA'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpCONFERIR_ESTOQUE: TStringField
      FieldName = 'CONFERIR_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpLEITOR_SERIAL: TStringField
      FieldName = 'LEITOR_SERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpVERIFICAR_PAPEL: TStringField
      FieldName = 'VERIFICAR_PAPEL'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digoEmpresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsConfImpDIAABERTO: TDateTimeField
      FieldName = 'DIAABERTO'
    end
    object cdsConfImpDIAFECHADO: TDateTimeField
      FieldName = 'DIAFECHADO'
    end
    object cdsConfImpUSPOLPREC: TStringField
      FieldName = 'USPOLPREC'
      FixedChar = True
      Size = 1
    end
    object cdsConfImpVALOR_GT: TStringField
      FieldName = 'VALOR_GT'
    end
    object cdsConfImpENDERECO_HWF: TStringField
      FieldName = 'ENDERECO_HWF'
      Size = 100
    end
    object cdsConfImpDATA_HWF: TDateTimeField
      FieldName = 'DATA_HWF'
    end
    object cdsConfImpUSAR_MOV_OP: TStringField
      FieldName = 'USAR_MOV_OP'
      Size = 1
    end
    object cdsConfImpIMPRIMIR_DAV_ECF: TStringField
      FieldName = 'IMPRIMIR_DAV_ECF'
      Size = 1
    end
    object cdsConfImpTAB_PRECO_AD: TStringField
      FieldName = 'TAB_PRECO_AD'
      Size = 32
    end
  end
  object cdsFinaliz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFinaliz'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 103
    Top = 172
    object cdsFinalizCOD_FINALIZADOR: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_FINALIZADOR'
    end
    object cdsFinalizDESCRICAO: TStringField
      DisplayLabel = 'Finalizador'
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsFinalizVERIFICAR_DEBITO: TStringField
      DisplayLabel = 'Verificar D'#233'bito'
      FieldName = 'VERIFICAR_DEBITO'
      FixedChar = True
      Size = 10
    end
    object cdsFinalizVERIFICAR_CREDITO: TStringField
      DisplayLabel = 'Verificar Cr'#233'dito'
      FieldName = 'VERIFICAR_CREDITO'
      FixedChar = True
      Size = 10
    end
    object cdsFinalizTIPO_FINALIZADOR: TSmallintField
      DisplayLabel = 'Tipo de Finalizador'
      FieldName = 'TIPO_FINALIZADOR'
    end
    object cdsFinalizTECLA_PDV: TSmallintField
      DisplayLabel = 'Tecla PDV'
      FieldName = 'TECLA_PDV'
    end
    object cdsFinalizCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsFinalizCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Required = True
      Visible = False
    end
    object cdsFinalizNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
      Visible = False
    end
    object cdsFinalizPRAZO: TStringField
      DisplayLabel = 'Abrir Prazo?'
      FieldName = 'PRAZO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsProcessos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcesso'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 249
    Top = 172
    object cdsProcessosCOD_PROCESSO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROCESSO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsProcessosCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProcessosNOME_PROCESSO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME_PROCESSO'
      Size = 50
    end
    object cdsProcessosNIVEL_PROCESSO: TIntegerField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL_PROCESSO'
      Required = True
    end
    object cdsProcessosFORM: TStringField
      DisplayLabel = 'Formul'#225'rio'
      FieldName = 'FORM'
      Size = 30
    end
    object cdsProcessosSENHA_GERENTE: TStringField
      DisplayLabel = 'Exigir senha Gerente'
      FieldName = 'SENHA_GERENTE'
      FixedChar = True
      Size = 1
    end
  end
  object cdsTeclado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTeclado'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 176
    Top = 172
    object cdsTecladoTECLA: TIntegerField
      DisplayLabel = 'Tecla'
      FieldName = 'TECLA'
    end
    object cdsTecladoPROCESSO: TIntegerField
      DisplayLabel = 'Processo'
      FieldName = 'PROCESSO'
    end
    object cdsTecladoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object qrProcesso: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from TABELA_PROCESSOS')
    Left = 249
    Top = 64
  end
  object qrTeclado: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from TECLADO')
    Left = 176
    Top = 64
  end
  object qrFinaliz: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from FINALIZADORES')
    Left = 103
    Top = 64
  end
  object qrConfImp: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from CONFIMP')
    Left = 30
    Top = 64
  end
  object dspProcesso: TDataSetProvider
    DataSet = qrProcesso
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 249
    Top = 117
  end
  object dsProcesso: TDataSource
    AutoEdit = False
    DataSet = cdsProcessos
    Left = 249
    Top = 223
  end
  object dspTeclado: TDataSetProvider
    DataSet = qrTeclado
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 117
  end
  object dsTeclado: TDataSource
    AutoEdit = False
    DataSet = cdsTeclado
    Left = 176
    Top = 223
  end
  object dspFinaliz: TDataSetProvider
    DataSet = qrFinaliz
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 103
    Top = 117
  end
  object dsFinaliz: TDataSource
    AutoEdit = False
    DataSet = cdsFinaliz
    Left = 103
    Top = 223
  end
  object dspConfImp: TDataSetProvider
    DataSet = qrConfImp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 30
    Top = 117
  end
  object dsConfImp: TDataSource
    AutoEdit = False
    DataSet = cdsConfImp
    Left = 30
    Top = 223
  end
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
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 232
    Top = 8
  end
  object cdsAliquota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAliquota'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 322
    Top = 172
    object cdsAliquotaSEQUENCIA: TStringField
      FieldName = 'SEQUENCIA'
      Required = True
      FixedChar = True
      Size = 4
    end
    object cdsAliquotaALIQ: TFloatField
      FieldName = 'ALIQ'
    end
    object cdsAliquotaCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsAliquotaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAliquotaSERVICO: TStringField
      FieldName = 'SERVICO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAliquotaNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
    end
    object cdsAliquotaINDICE: TIntegerField
      FieldName = 'INDICE'
    end
  end
  object qrAliquota: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from ALIQ')
    Left = 323
    Top = 64
  end
  object dspAliquota: TDataSetProvider
    DataSet = qrAliquota
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 323
    Top = 117
  end
  object dsAliquota: TDataSource
    AutoEdit = False
    DataSet = cdsAliquota
    Left = 323
    Top = 223
  end
end
