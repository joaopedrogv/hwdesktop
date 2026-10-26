object DtmFiscal: TDtmFiscal
  OldCreateOrder = False
  Height = 533
  Width = 902
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
  end
  object cdsFinaliz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFinaliz'
    Left = 103
    Top = 172
    object cdsFinalizCOD_FINALIZADOR: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_FINALIZADOR'
      Origin = '"FINALIZADORES"."COD_FINALIZADOR"'
    end
    object cdsFinalizDESCRICAO: TStringField
      DisplayLabel = 'Finalizador'
      FieldName = 'DESCRICAO'
      Origin = '"FINALIZADORES"."DESCRICAO"'
      Size = 30
    end
    object cdsFinalizVERIFICAR_DEBITO: TStringField
      DisplayLabel = 'Verificar D'#233'bito'
      FieldName = 'VERIFICAR_DEBITO'
      Origin = '"FINALIZADORES"."VERIFICAR_DEBITO"'
      FixedChar = True
      Size = 10
    end
    object cdsFinalizVERIFICAR_CREDITO: TStringField
      DisplayLabel = 'Verificar Cr'#233'dito'
      FieldName = 'VERIFICAR_CREDITO'
      Origin = '"FINALIZADORES"."VERIFICAR_CREDITO"'
      FixedChar = True
      Size = 10
    end
    object cdsFinalizTIPO_FINALIZADOR: TSmallintField
      DisplayLabel = 'Tipo de Finalizador'
      FieldName = 'TIPO_FINALIZADOR'
      Origin = '"FINALIZADORES"."TIPO_FINALIZADOR"'
    end
    object cdsFinalizTECLA_PDV: TSmallintField
      DisplayLabel = 'Tecla PDV'
      FieldName = 'TECLA_PDV'
      Origin = '"FINALIZADORES"."TECLA_PDV"'
    end
    object cdsFinalizCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"FINALIZADORES"."COD_EMPRESA"'
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
    object cdsAliquotaNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
      FixedChar = True
    end
    object cdsAliquotaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
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
  object qrCupom: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from CUPOM')
    Left = 396
    Top = 64
  end
  object qrResumoD: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from RESUMOD')
    Left = 542
    Top = 64
  end
  object dspCupom: TDataSetProvider
    DataSet = qrCupom
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 396
    Top = 117
  end
  object dspResumoD: TDataSetProvider
    DataSet = qrResumoD
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 542
    Top = 117
  end
  object cdsCupom: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCupom'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 395
    Top = 172
    object cdsCupomCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsCupomNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsCupomREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object cdsCupomCUPOM: TIntegerField
      FieldName = 'CUPOM'
    end
    object cdsCupomDATA: TDateTimeField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomFORMAPAG: TStringField
      FieldName = 'FORMAPAG'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomTOTAL: TFloatField
      FieldName = 'TOTAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomCONDPGTO: TStringField
      FieldName = 'CONDPGTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomCOLABORADOR: TIntegerField
      FieldName = 'COLABORADOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomSTATUS_CP: TStringField
      FieldName = 'STATUS_CP'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsCupomHORAABERTURA: TTimeField
      FieldName = 'HORAABERTURA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomHORAFECHAMENTO: TTimeField
      FieldName = 'HORAFECHAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomHORASUBTOTAL: TTimeField
      FieldName = 'HORASUBTOTAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomVALORCUPOM: TFloatField
      FieldName = 'VALORCUPOM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomPREVENDA: TIntegerField
      FieldName = 'PREVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomENVIADO_RET: TStringField
      FieldName = 'ENVIADO_RET'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCupomCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsCupomVALOR_DESC: TFloatField
      FieldName = 'VALOR_DESC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomVALOR_ACRES: TFloatField
      FieldName = 'VALOR_ACRES'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomPED: TIntegerField
      FieldName = 'PED'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCupomCCF: TIntegerField
      FieldName = 'CCF'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCupomACRES_DESC: TStringField
      FieldName = 'ACRES_DESC'
      FixedChar = True
      Size = 1
    end
    object cdsCupomVALORACRES_DESC: TFloatField
      FieldName = 'VALORACRES_DESC'
    end
    object cdsCupomPAF_NUM_PREVENDA: TIntegerField
      FieldName = 'PAF_NUM_PREVENDA'
    end
    object cdsCupomCER_CONTA_CLIENTE: TIntegerField
      FieldName = 'CER_CONTA_CLIENTE'
    end
    object cdsCupomCOO_CONTA_CLIENTE: TIntegerField
      FieldName = 'COO_CONTA_CLIENTE'
    end
    object cdsCupomVTOTTRIB: TFloatField
      FieldName = 'VTOTTRIB'
    end
    object cdsCupomCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsCupomENVIADO_RET2: TStringField
      FieldName = 'ENVIADO_RET2'
      Size = 1
    end
    object cdsCupomCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 14
    end
    object cdsCupomNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 40
    end
    object cdsCupomVALOR_ICM: TFloatField
      FieldName = 'VALOR_ICM'
    end
    object cdsCupomVALOR_ISS: TFloatField
      FieldName = 'VALOR_ISS'
    end
    object cdsCupomNMOV: TIntegerField
      FieldName = 'NMOV'
    end
    object cdsCupomNPED_ORC: TIntegerField
      FieldName = 'NPED_ORC'
    end
  end
  object cdsResumoD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspResumoD'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 541
    Top = 172
    object cdsResumoDCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsResumoDNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsResumoDDATA_MOV: TDateTimeField
      FieldName = 'DATA_MOV'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsResumoDSEQINI: TIntegerField
      FieldName = 'SEQINI'
    end
    object cdsResumoDSEQFIM: TIntegerField
      FieldName = 'SEQFIM'
    end
    object cdsResumoDVLVENDAB: TFloatField
      FieldName = 'VLVENDAB'
    end
    object cdsResumoDVLTOTGERAL: TFloatField
      FieldName = 'VLTOTGERAL'
    end
    object cdsResumoDCRO_MOV: TIntegerField
      FieldName = 'CRO_MOV'
    end
    object cdsResumoDNREDUCOES: TIntegerField
      FieldName = 'NREDUCOES'
    end
    object cdsResumoDCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsResumoDENVIADO_RET: TStringField
      FieldName = 'ENVIADO_RET'
      FixedChar = True
      Size = 1
    end
    object cdsResumoDCOORED: TIntegerField
      FieldName = 'COORED'
      Required = True
    end
    object cdsResumoDVLCANCEL: TFloatField
      FieldName = 'VLCANCEL'
    end
    object cdsResumoDVLACRESCIMO: TFloatField
      FieldName = 'VLACRESCIMO'
    end
    object cdsResumoDVLDESCONTOS: TFloatField
      FieldName = 'VLDESCONTOS'
    end
    object cdsResumoDVLISS: TFloatField
      FieldName = 'VLISS'
    end
    object cdsResumoDVLISENTOS: TFloatField
      FieldName = 'VLISENTOS'
    end
    object cdsResumoDVLNINCIDENCIA: TFloatField
      FieldName = 'VLNINCIDENCIA'
    end
    object cdsResumoDVLSUBST: TFloatField
      FieldName = 'VLSUBST'
    end
    object cdsResumoDDATA_EMISSAO_Z: TDateTimeField
      FieldName = 'DATA_EMISSAO_Z'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsResumoDHORA_EMISSAO_Z: TStringField
      FieldName = 'HORA_EMISSAO_Z'
      Required = True
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsResumoDVLTOTLIQ: TFloatField
      FieldName = 'VLTOTLIQ'
    end
  end
  object dsCupom: TDataSource
    DataSet = cdsCupom
    Left = 396
    Top = 223
  end
  object dsResumoD: TDataSource
    DataSet = cdsResumoD
    Left = 542
    Top = 223
  end
  object qrSangSup: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from SANGSUP')
    Left = 616
    Top = 64
  end
  object dspSangSup: TDataSetProvider
    DataSet = qrSangSup
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 616
    Top = 117
  end
  object cdsSangSup: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSangSup'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 614
    Top = 172
    object cdsSangSupCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsSangSupNREG: TIntegerField
      DisplayLabel = 'Sequencia'
      FieldName = 'NREG'
    end
    object cdsSangSupVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsSangSupDATALANC: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATALANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsSangSupSANGSUPRIMENTO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'SANGSUPRIMENTO'
      Size = 10
    end
    object cdsSangSupNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsSangSupFINALIZADOR: TIntegerField
      FieldName = 'FINALIZADOR'
    end
    object cdsSangSupCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSangSupCOONAOFISCAL: TIntegerField
      DisplayLabel = 'COO'
      FieldName = 'COONAOFISCAL'
    end
    object cdsSangSupVALOR_ORIGINAL: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIGINAL'
    end
    object cdsSangSupSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object cdsSangSupCOOCANCELAMENTO: TIntegerField
      DisplayLabel = 'COO Cancelamento'
      FieldName = 'COOCANCELAMENTO'
    end
    object cdsSangSupENVIADO_RET: TStringField
      FieldName = 'ENVIADO_RET'
      FixedChar = True
      Size = 1
    end
  end
  object dsSangSup: TDataSource
    AutoEdit = False
    DataSet = cdsSangSup
    Left = 616
    Top = 223
  end
  object bancoTeste: TIBDatabase
    DatabaseName = '127.0.0.1:c:\basesauto\hw.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 320
    Top = 8
  end
  object qrFinCP: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from FINCUPOM')
    Left = 680
    Top = 64
  end
  object dspFinCp: TDataSetProvider
    DataSet = qrFinCP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 680
    Top = 117
  end
  object dsFinCp: TDataSource
    AutoEdit = False
    DataSet = cdsFinCP
    Left = 680
    Top = 223
  end
  object cdsFinCP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFinCp'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 678
    Top = 172
    object cdsFinCPCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsFinCPNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsFinCPCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsFinCPREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object cdsFinCPORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsFinCPCUPOM: TIntegerField
      FieldName = 'CUPOM'
    end
    object cdsFinCPFINALIZADOR: TIntegerField
      FieldName = 'FINALIZADOR'
    end
    object cdsFinCPVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsFinCPGNF_ECF: TIntegerField
      FieldName = 'GNF_ECF'
    end
    object cdsFinCPCCF_ECF: TIntegerField
      FieldName = 'CCF_ECF'
    end
    object cdsFinCPTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      FixedChar = True
      Size = 3
    end
    object cdsFinCPCOD_TOTALIZADOR: TIntegerField
      FieldName = 'COD_TOTALIZADOR'
    end
    object cdsFinCPDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsFinCPVALOR_REL: TFloatField
      FieldName = 'VALOR_REL'
    end
    object cdsFinCPOPERADOR: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
    end
    object cdsFinCPVALORSAQUE: TFloatField
      FieldName = 'VALORSAQUE'
    end
    object cdsFinCPPARCELAS_TEF: TIntegerField
      FieldName = 'PARCELAS_TEF'
    end
    object cdsFinCPVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
    end
    object cdsFinCPN_AUT_CART: TStringField
      FieldName = 'N_AUT_CART'
    end
    object cdsFinCPN_DOCNSU_ADM: TStringField
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsFinCPENVIADO_RET: TStringField
      FieldName = 'ENVIADO_RET'
      Size = 1
    end
    object cdsFinCPNMOV: TIntegerField
      FieldName = 'NMOV'
    end
  end
  object qrComImp: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select ci.codfunfiscal,fi.descricaofuncao,ci.comando'
      'from comandosimp ci'
      
        'inner join funcoesfiscal fi on fi.codfuncfiscal = ci.codfunfisca' +
        'l'
      
        'inner join terminal_impressoras ti on ti.ident_cniee = ci.cod_cn' +
        'iee'
      
        'inner join confimp c on c.num_serie_ecf = ti.num_serie_ecf and c' +
        '.cod_terminal = ti.cod_terminal'
      'and c.cod_empresa = ti.cod_empresa')
    Left = 752
    Top = 64
  end
  object dspComImp: TDataSetProvider
    DataSet = qrComImp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 752
    Top = 117
  end
  object dsComImp: TDataSource
    AutoEdit = False
    DataSet = cdsComImp
    Left = 752
    Top = 223
  end
  object cdsComImp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComImp'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 750
    Top = 172
    object cdsComImpCODFUNFISCAL: TIntegerField
      FieldName = 'CODFUNFISCAL'
      Required = True
    end
    object cdsComImpDESCRICAOFUNCAO: TStringField
      FieldName = 'DESCRICAOFUNCAO'
      Required = True
      Size = 50
    end
    object cdsComImpCOMANDO: TStringField
      FieldName = 'COMANDO'
      FixedChar = True
      Size = 1
    end
  end
  object qrFormPg: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select NDOC, DATA_VENC, VALORDOC from FORMPAGAMENTO')
    Left = 832
    Top = 64
  end
  object dspFormPg: TDataSetProvider
    DataSet = qrFormPg
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 832
    Top = 117
  end
  object dsFormPg: TDataSource
    AutoEdit = False
    DataSet = cdsFormPg
    Left = 832
    Top = 223
  end
  object cdsFormPg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormPg'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 830
    Top = 172
    object cdsFormPgNDOC: TStringField
      FieldName = 'NDOC'
    end
    object cdsFormPgDATA_VENC: TDateTimeField
      FieldName = 'DATA_VENC'
    end
    object cdsFormPgVALORDOC: TFloatField
      FieldName = 'VALORDOC'
    end
  end
  object qrCupom2: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from cupom2')
    Left = 469
    Top = 64
  end
  object dspCupom2: TDataSetProvider
    DataSet = qrCupom2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 468
    Top = 117
  end
  object cdsCupom2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCupom2'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 468
    Top = 172
    object cdsCupom2COD_TERMINAL: TIntegerField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsCupom2NSERIEECF: TStringField
      DisplayLabel = 'Num S'#233'rie Ecf'
      FieldName = 'NSERIEECF'
      Required = True
    end
    object cdsCupom2COD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCupom2REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
      Required = True
    end
    object cdsCupom2NITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      DisplayWidth = 10
      FieldName = 'NITEM'
      Required = True
    end
    object cdsCupom2CUPOM: TIntegerField
      DisplayLabel = 'Cupom'
      FieldName = 'CUPOM'
      Required = True
    end
    object cdsCupom2ORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
      Required = True
    end
    object cdsCupom2GRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsCupom2COD_PROD: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsCupom2CODBARRA: TStringField
      DisplayLabel = 'Codigo de Barras'
      FieldName = 'CODBARRA'
    end
    object cdsCupom2QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object cdsCupom2PRECO: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      currency = True
    end
    object cdsCupom2ALIQUOTA_IT: TStringField
      DisplayLabel = 'Aliq'
      FieldName = 'ALIQUOTA_IT'
      FixedChar = True
      Size = 4
    end
    object cdsCupom2STATUS_IT: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_IT'
      Size = 10
    end
    object cdsCupom2TOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      currency = True
    end
    object cdsCupom2DESCR_IT: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_IT'
      Size = 29
    end
    object cdsCupom2PERC_DESC: TFloatField
      FieldName = 'PERC_DESC'
    end
    object cdsCupom2PERC_ACRESC: TFloatField
      FieldName = 'PERC_ACRESC'
    end
    object cdsCupom2RAT_ACRES: TFloatField
      FieldName = 'RAT_ACRES'
    end
    object cdsCupom2RAT_DESC: TFloatField
      FieldName = 'RAT_DESC'
    end
    object cdsCupom2DESCALIQ: TStringField
      FieldName = 'DESCALIQ'
      Required = True
      Size = 7
    end
    object cdsCupom2CSDECQTDE: TStringField
      FieldName = 'CSDECQTDE'
      Required = True
      Size = 1
    end
    object cdsCupom2CSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Required = True
      Size = 1
    end
    object cdsCupom2RAT_DG: TFloatField
      FieldName = 'RAT_DG'
    end
    object cdsCupom2PROD_SERV: TStringField
      FieldName = 'PROD_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsCupom2ENVIADO_RET: TStringField
      FieldName = 'ENVIADO_RET'
      Size = 1
    end
    object cdsCupom2TIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object cdsCupom2UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsCupom2CCF: TIntegerField
      FieldName = 'CCF'
    end
    object cdsCupom2CST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsCupom2CODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsCupom2DATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsCupom2ALIQTRIB: TFloatField
      FieldName = 'ALIQTRIB'
    end
    object cdsCupom2VTOTTRIB: TFloatField
      FieldName = 'VTOTTRIB'
    end
    object cdsCupom2NCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object cdsCupom2COD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsCupom2ENVIADO_RET2: TStringField
      FieldName = 'ENVIADO_RET2'
      Size = 1
    end
    object cdsCupom2CST_PIS: TStringField
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsCupom2CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsCupom2ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object cdsCupom2ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object cdsCupom2BASE_PIS: TFloatField
      FieldName = 'BASE_PIS'
    end
    object cdsCupom2BASE_COFINS: TFloatField
      FieldName = 'BASE_COFINS'
    end
    object cdsCupom2VALOR_PIS: TFloatField
      FieldName = 'VALOR_PIS'
    end
    object cdsCupom2VALOR_COFINS: TFloatField
      FieldName = 'VALOR_COFINS'
    end
    object cdsCupom2PREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsCupom2IAT: TStringField
      FieldName = 'IAT'
      Size = 1
    end
    object cdsCupom2IPPT: TStringField
      FieldName = 'IPPT'
      Size = 1
    end
    object cdsCupom2ALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
    end
    object cdsCupom2VALOR_IMPOSTO: TFloatField
      FieldName = 'VALOR_IMPOSTO'
    end
    object cdsCupom2COD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsCupom2NITEM_ORC: TIntegerField
      FieldName = 'NITEM_ORC'
    end
  end
  object dsCupom2: TDataSource
    DataSet = cdsCupom2
    Left = 470
    Top = 224
  end
  object qrTempOp: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from TEMPOOP')
    Left = 32
    Top = 280
  end
  object dspTempOp: TDataSetProvider
    DataSet = qrTempOp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 32
    Top = 333
  end
  object dsTempOp: TDataSource
    AutoEdit = False
    DataSet = cdsTempOp
    Left = 32
    Top = 439
  end
  object cdsTempOp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTempOp'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 30
    Top = 388
    object cdsTempOpOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Required = True
    end
    object cdsTempOpDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object cdsTempOpHORAENTRADA: TTimeField
      FieldName = 'HORAENTRADA'
      Required = True
    end
    object cdsTempOpHORASAIDA: TTimeField
      FieldName = 'HORASAIDA'
    end
    object cdsTempOpSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
  end
  object qrTotVend: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      
        'select it.grupo_prod,it.cod_prod,sum(it.quantidade) soma from cu' +
        'pom2 it,cupom cp'
      
        'where it.ordem = cp.registro and it.cupom = cp.cupom and cp.data' +
        ' >= :vdat1'
      'and cp.data <= :vdat2 and status_cp <> '#39'CANCELADO'#39'  '
      'group by it.grupo_prod,it.cod_prod')
    Left = 112
    Top = 280
    ParamData = <
      item
        DataType = ftDate
        Name = 'vdat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'vdat2'
        ParamType = ptUnknown
      end>
  end
  object dspTotVend: TDataSetProvider
    DataSet = qrTotVend
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 112
    Top = 341
  end
  object dsTotVend: TDataSource
    AutoEdit = False
    DataSet = cdsTotalVenda
    Left = 112
    Top = 439
  end
  object cdsTotalVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotVend'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 110
    Top = 388
    object cdsTotalVendaGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsTotalVendaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsTotalVendaSOMA: TFloatField
      FieldName = 'SOMA'
    end
  end
  object qrEmpDes: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from EMPDESVOLV')
    Left = 184
    Top = 280
  end
  object dspEmpDes: TDataSetProvider
    DataSet = qrEmpDes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 184
    Top = 341
  end
  object dsEmpDes: TDataSource
    AutoEdit = False
    DataSet = cdsEmpDes
    Left = 184
    Top = 439
  end
  object cdsEmpDes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpDes'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 182
    Top = 388
    object cdsEmpDesCOD_EMPDES: TIntegerField
      FieldName = 'COD_EMPDES'
      Required = True
    end
    object cdsEmpDesNOME_EMPDES: TStringField
      FieldName = 'NOME_EMPDES'
      Required = True
      Size = 40
    end
    object cdsEmpDesCNPJ_EMPDES: TStringField
      FieldName = 'CNPJ_EMPDES'
      Required = True
      Size = 14
    end
    object cdsEmpDesCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsEmpDesIE_EMPDES: TStringField
      FieldName = 'IE_EMPDES'
      Required = True
      Size = 14
    end
    object cdsEmpDesIM_EMPDES: TStringField
      FieldName = 'IM_EMPDES'
      Required = True
      Size = 14
    end
    object cdsEmpDesDATA_CAD_EMPDES: TDateTimeField
      FieldName = 'DATA_CAD_EMPDES'
    end
    object cdsEmpDesDATA_MOD_EMPDES: TDateTimeField
      FieldName = 'DATA_MOD_EMPDES'
    end
    object cdsEmpDesATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrTotNaoF: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from TOTALIZADOR_NAOF')
    Left = 256
    Top = 280
  end
  object dspTotNaoF: TDataSetProvider
    DataSet = qrTotNaoF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 256
    Top = 341
  end
  object dsTotNaoF: TDataSource
    AutoEdit = False
    DataSet = cdsTotNaoF
    Left = 256
    Top = 439
  end
  object cdsTotNaoF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotNaoF'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 254
    Top = 388
    object cdsTotNaoFSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = '"TOTALIZADOR_NAOF"."SEQUENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTotNaoFCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Origin = '"TOTALIZADOR_NAOF"."COD_TERMINAL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTotNaoFNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Origin = '"TOTALIZADOR_NAOF"."NSERIEECF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTotNaoFCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"TOTALIZADOR_NAOF"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTotNaoFDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"TOTALIZADOR_NAOF"."DESCRICAO"'
      Required = True
      Size = 21
    end
  end
  object qrPrest: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      
        'select ss.valor, ss.datalanc, tn.sequencia, tn.descricao from sa' +
        'ngsup ss'
      
        'inner join fincupom fc on fc.cod_terminal = ss.cod_terminal and ' +
        'fc.nserieecf = ss.nserieecf'
      'and fc.cupom = ss.nreg and fc.cod_empresa = :cod_empresa'
      
        'inner join totalizador_naof tn on tn.sequencia = fc.cod_totaliza' +
        'dor and tn.cod_terminal = fc.cod_terminal and'
      'tn.nserieecf = fc.nserieecf and tn.cod_empresa = fc.cod_empresa'
      'where ss.sangsuprimento = '#39'REC PREST'#39)
    Left = 336
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspPrest: TDataSetProvider
    DataSet = qrPrest
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 336
    Top = 341
  end
  object dsPrest: TDataSource
    AutoEdit = False
    DataSet = cdsPrest
    Left = 336
    Top = 439
  end
  object cdsPrest: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrest'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 334
    Top = 388
    object cdsPrestVALOR: TFloatField
      DisplayLabel = 'Valor Recebido'
      FieldName = 'VALOR'
      Origin = '"SANGSUP"."VALOR"'
      currency = True
    end
    object cdsPrestDATALANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATALANC'
      Origin = '"SANGSUP"."DATALANC"'
    end
    object cdsPrestSEQUENCIA: TIntegerField
      DisplayLabel = 'Cod Totalizador'
      FieldName = 'SEQUENCIA'
      Origin = '"TOTALIZADOR_NAOF"."SEQUENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPrestDESCRICAO: TStringField
      DisplayLabel = 'Totalizador Impressora'
      FieldName = 'DESCRICAO'
      Origin = '"TOTALIZADOR_NAOF"."DESCRICAO"'
      Required = True
      Size = 21
    end
  end
  object qrMeioPag: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select F.cod_finalizador,f.descricao desc_final,'
      '    case f.tipo_finalizador'
      '        when 0 then '#39'N'#227'o '#233' TEF'#39
      '        when 1 then '#39'D'#233'bito'#39
      '        when 2 then '#39'Cr'#233'dito'#39
      '        when 3 then '#39'Tecban'#39
      '        when 4 then '#39'Outros'#39
      '    end tipo_final, tn.descricao,fc.tipo_doc,'
      'sum(fc.valor_rel) soma,fc.data from fincupom fc'
      
        'inner join finalizadores f on fc.finalizador = f.cod_finalizador' +
        ' and'
      'fc.cod_empresa = f.cod_empresa'
      
        'left join totalizador_naof  tn on tn.cod_terminal = fc.cod_termi' +
        'nal and'
      
        'tn.cod_empresa = fc.cod_empresa and tn.nserieecf = fc.nserieecf ' +
        'and'
      'tn.sequencia = fc.cod_totalizador'
      'WHERE FC.tipo_doc <> '#39'SAN'#39' AND FC.tipo_doc <> '#39'SUP'#39' and'
      'fc.data >= :data1 and fc.data <= :data2'
      
        'group by F.cod_finalizador ,F.descricao, f.tipo_finalizador,tn.d' +
        'escricao,fc.tipo_doc,'
      'fc.data')
    Left = 408
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data2'
        ParamType = ptUnknown
      end>
  end
  object dspMeioPag: TDataSetProvider
    DataSet = qrMeioPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 408
    Top = 341
  end
  object dsMeiosPag: TDataSource
    AutoEdit = False
    DataSet = cdsMeiosPag
    Left = 408
    Top = 439
  end
  object cdsMeiosPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMeioPag'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 406
    Top = 388
    object cdsMeiosPagCOD_FINALIZADOR: TSmallintField
      FieldName = 'COD_FINALIZADOR'
    end
    object cdsMeiosPagDESC_FINAL: TStringField
      FieldName = 'DESC_FINAL'
      Size = 30
    end
    object cdsMeiosPagTIPO_FINAL: TStringField
      FieldName = 'TIPO_FINAL'
      FixedChar = True
      Size = 9
    end
    object cdsMeiosPagDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 21
    end
    object cdsMeiosPagTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      FixedChar = True
      Size = 3
    end
    object cdsMeiosPagSOMA: TFloatField
      FieldName = 'SOMA'
    end
    object cdsMeiosPagDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object qrDocNaF: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from DOC_NAOFISCAL_TERMINAL')
    Left = 469
    Top = 280
  end
  object dspDocNaF: TDataSetProvider
    DataSet = qrDocNaF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 468
    Top = 333
  end
  object cdsDocNaF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocNaF'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 468
    Top = 388
    object cdsDocNaFCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsDocNaFCOO_ECF: TIntegerField
      FieldName = 'COO_ECF'
      Required = True
    end
    object cdsDocNaFCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDocNaFGNF_ECF: TIntegerField
      FieldName = 'GNF_ECF'
    end
    object cdsDocNaFGRG_ECF: TIntegerField
      FieldName = 'GRG_ECF'
    end
    object cdsDocNaFCDC_ECF: TIntegerField
      FieldName = 'CDC_ECF'
    end
    object cdsDocNaFTIPO_DOC_ECF: TStringField
      FieldName = 'TIPO_DOC_ECF'
      Required = True
      Size = 2
    end
    object cdsDocNaFDATA_F_EMISSAO: TDateTimeField
      FieldName = 'DATA_F_EMISSAO'
      Required = True
    end
    object cdsDocNaFHORA_F_EMISSAO: TStringField
      FieldName = 'HORA_F_EMISSAO'
      Required = True
      Size = 8
    end
    object cdsDocNaFNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
    end
    object cdsDocNaFENVIADO_RET: TStringField
      FieldName = 'ENVIADO_RET'
      Size = 1
    end
  end
  object dsDocNaF: TDataSource
    DataSet = cdsDocNaF
    Left = 470
    Top = 440
  end
  object qrMapaRes: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from MAPA_RESUMO_ALIQ')
    Left = 541
    Top = 280
  end
  object dspMapaRes: TDataSetProvider
    DataSet = qrMapaRes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 540
    Top = 333
  end
  object cdsMapaRes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMapaRes'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 540
    Top = 388
    object cdsMapaResCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsMapaResNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
    end
    object cdsMapaResCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMapaResCOORED: TIntegerField
      FieldName = 'COORED'
      Required = True
    end
    object cdsMapaResALIQ_SEQ: TStringField
      DisplayLabel = 'Seq'
      FieldName = 'ALIQ_SEQ'
      Required = True
      Size = 4
    end
    object cdsMapaResDESCALIQ: TStringField
      DisplayLabel = 'Totalizador'
      FieldName = 'DESCALIQ'
      Size = 7
    end
    object cdsMapaResVALORALIQ: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALORALIQ'
    end
    object cdsMapaResENVIADO_RET: TStringField
      FieldName = 'ENVIADO_RET'
      Size = 1
    end
  end
  object dsMapaRes: TDataSource
    AutoEdit = False
    DataSet = cdsMapaRes
    Left = 542
    Top = 440
  end
  object qrIdFis: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select'
      
        'fv.n_laudo_fiscal, ed.nome_empdes, ed.cnpj_empdes, ed.endereco_e' +
        'mpdes,'
      
        'ed.bairro_empdes,  ed.cidade_empdes ,ed.fone_empdes, ed.contato_' +
        'empdes,'
      'fv.nome_paf, '#39'Fiscal 4.0'#39' NOME_COMERCIAL, fv.versao_paf,'
      
        'fv.principal_exec, fv.md5_paf,af.nome_arquivo,af.md5_arquivo,ed.' +
        'uf_empdes,'
      'fv.ER_PAF_ECF'
      'from empdesvolv ed'
      'inner join fiscal_versoes fv on fv.cod_empdes = ed.cod_empdes'
      'left join arquivos_fiscal af on af.cod_fiscal = fv.cod_fiscal')
    Left = 613
    Top = 280
  end
  object dspIdFis: TDataSetProvider
    DataSet = qrIdFis
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 612
    Top = 333
  end
  object cdsIdentFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIdFis'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 612
    Top = 388
    object cdsIdentFiscalN_LAUDO_FISCAL: TStringField
      FieldName = 'N_LAUDO_FISCAL'
      Required = True
      Size = 15
    end
    object cdsIdentFiscalNOME_EMPDES: TStringField
      FieldName = 'NOME_EMPDES'
      Required = True
      Size = 40
    end
    object cdsIdentFiscalCNPJ_EMPDES: TStringField
      FieldName = 'CNPJ_EMPDES'
      Required = True
      Size = 14
    end
    object cdsIdentFiscalENDERECO_EMPDES: TStringField
      FieldName = 'ENDERECO_EMPDES'
      Required = True
      Size = 50
    end
    object cdsIdentFiscalBAIRRO_EMPDES: TStringField
      FieldName = 'BAIRRO_EMPDES'
      Required = True
      Size = 30
    end
    object cdsIdentFiscalCIDADE_EMPDES: TStringField
      FieldName = 'CIDADE_EMPDES'
      Required = True
      Size = 30
    end
    object cdsIdentFiscalFONE_EMPDES: TStringField
      FieldName = 'FONE_EMPDES'
      Required = True
      Size = 13
    end
    object cdsIdentFiscalCONTATO_EMPDES: TStringField
      FieldName = 'CONTATO_EMPDES'
      Required = True
      Size = 30
    end
    object cdsIdentFiscalNOME_PAF: TStringField
      FieldName = 'NOME_PAF'
      Required = True
      Size = 40
    end
    object cdsIdentFiscalNOME_COMERCIAL: TStringField
      FieldName = 'NOME_COMERCIAL'
      FixedChar = True
      Size = 10
    end
    object cdsIdentFiscalVERSAO_PAF: TStringField
      FieldName = 'VERSAO_PAF'
      Required = True
      Size = 10
    end
    object cdsIdentFiscalPRINCIPAL_EXEC: TStringField
      FieldName = 'PRINCIPAL_EXEC'
      Required = True
      Size = 25
    end
    object cdsIdentFiscalMD5_PAF: TStringField
      FieldName = 'MD5_PAF'
      Required = True
      Size = 32
    end
    object cdsIdentFiscalNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 30
    end
    object cdsIdentFiscalMD5_ARQUIVO: TStringField
      FieldName = 'MD5_ARQUIVO'
      Size = 32
    end
    object cdsIdentFiscalUF_EMPDES: TStringField
      FieldName = 'UF_EMPDES'
      FixedChar = True
      Size = 2
    end
    object cdsIdentFiscalER_PAF_ECF: TStringField
      FieldName = 'ER_PAF_ECF'
      Size = 4
    end
  end
  object qrTermImp: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'SELECT ti.ident_cniee,ti.num_serie_ecf, tf.end_terminal'
      ' FROM terminal_impressoras ti'
      
        ' INNER JOIN terminalf tf ON tf.cod_terminal = ti.cod_terminal AN' +
        'D tf.cod_empresa = ti.cod_empresa')
    Left = 685
    Top = 280
  end
  object dspTermImp: TDataSetProvider
    DataSet = qrTermImp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 684
    Top = 333
  end
  object cdsTermImp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTermImp'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 684
    Top = 388
    object cdsTermImpIDENT_CNIEE: TStringField
      FieldName = 'IDENT_CNIEE'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsTermImpNUM_SERIE_ECF: TStringField
      FieldName = 'NUM_SERIE_ECF'
      Required = True
    end
    object cdsTermImpEND_TERMINAL: TStringField
      FieldName = 'END_TERMINAL'
      FixedChar = True
      Size = 40
    end
  end
  object cdsFp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 8
    Data = {
      760000009619E0BD0100000018000000030000000000030000007600046E646F
      63010049000000010005574944544802000200140009646174615F76656E6301
      00490000000100055749445448020002000A000876616C6F72646F6308000400
      0000010007535542545950450200490006004D6F6E6579000000}
    object cdsFpndoc: TStringField
      FieldName = 'ndoc'
    end
    object cdsFpdata_venc: TStringField
      FieldName = 'data_venc'
      Size = 10
    end
    object cdsFpvalordoc: TCurrencyField
      FieldName = 'valordoc'
    end
  end
  object qrPrestCx: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    SQL.Strings = (
      'select * from PRESTACOES_FISCAL')
    Left = 757
    Top = 280
  end
  object dsPPrestCx: TDataSetProvider
    DataSet = qrPrestCx
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 756
    Top = 333
  end
  object cdsPrestCx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsPPrestCx'
    BeforeOpen = cdsConfImpBeforeOpen
    Left = 756
    Top = 388
    object cdsPrestCxCOD_CRED: TIntegerField
      DisplayLabel = 'C'#243'd Cred'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsPrestCxCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPrestCxVALOR_PRESTACAO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_PRESTACAO'
      DisplayFormat = '##0.00'
    end
    object cdsPrestCxN_DOC_C: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_DOC_C'
    end
    object cdsPrestCxDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrestCxTP_DOC_V: TStringField
      DisplayLabel = 'Tp Venda'
      FieldName = 'TP_DOC_V'
      Size = 6
    end
    object cdsPrestCxN_DOC_V: TIntegerField
      DisplayLabel = 'Numero Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsPrestCxCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Terminal'
      FieldName = 'COD_TERMINAL'
    end
    object cdsPrestCxNSERIEECF: TStringField
      DisplayLabel = 'Num S'#233'rie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsPrestCxSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
    end
    object cdsPrestCxTOTALIZADOR: TSmallintField
      DisplayLabel = 'Totalizador'
      FieldName = 'TOTALIZADOR'
    end
    object cdsPrestCxFINALIZADOR: TSmallintField
      DisplayLabel = 'Finalizador'
      FieldName = 'FINALIZADOR'
    end
    object cdsPrestCxCOO_DOCUMENTO: TIntegerField
      FieldName = 'COO_DOCUMENTO'
    end
  end
  object dsPrestCx: TDataSource
    AutoEdit = False
    DataSet = cdsPrestCx
    Left = 758
    Top = 440
  end
  object IBScript1: TIBScript
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    Terminator = ';'
    Left = 464
    Top = 8
  end
  object cdsRZ: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 8
    object cdsRZDATA_MOV: TDateTimeField
      FieldName = 'DATA_MOV'
    end
    object cdsRZSEQINI: TIntegerField
      FieldName = 'SEQINI'
    end
    object cdsRZSEQFIM: TIntegerField
      FieldName = 'SEQFIM'
    end
    object cdsRZVLVENDAB: TFloatField
      FieldName = 'VLVENDAB'
    end
    object cdsRZVLTOTGERAL: TFloatField
      FieldName = 'VLTOTGERAL'
    end
    object cdsRZCRO_MOV: TIntegerField
      FieldName = 'CRO_MOV'
    end
    object cdsRZNREDUCOES: TIntegerField
      FieldName = 'NREDUCOES'
    end
    object cdsRZDATA_EMISSAO_Z: TDateTimeField
      FieldName = 'DATA_EMISSAO_Z'
    end
    object cdsRZHORA_EMISSAO_Z: TStringField
      FieldName = 'HORA_EMISSAO_Z'
      Size = 8
    end
    object cdsRZCOORED: TIntegerField
      FieldName = 'COORED'
    end
  end
  object cdsMR: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 8
    object cdsMRDESCALIQ: TStringField
      FieldName = 'DESCALIQ'
      Size = 7
    end
    object cdsMRVALORALIQ: TFloatField
      FieldName = 'VALORALIQ'
    end
    object cdsMRCOORED: TIntegerField
      FieldName = 'COORED'
    end
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    Left = 680
    Top = 7
  end
  object cdsMP: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 752
    Top = 8
    object cdsMPDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsMPFINALIZADOR: TStringField
      FieldName = 'FINALIZADOR'
      Size = 64
    end
    object cdsMPTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      Size = 32
    end
    object cdsMPVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
  end
end
