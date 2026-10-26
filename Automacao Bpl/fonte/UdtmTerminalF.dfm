object dtmTerminaisF: TdtmTerminaisF
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 597
  Width = 855
  object TsTerminalF: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 24
    Top = 8
  end
  object IbTerminalF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from TERMINALF')
    Left = 16
    Top = 88
  end
  object DspTerminalF: TDataSetProvider
    DataSet = IbTerminalF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 16
    Top = 138
  end
  object CdsTerminalF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTerminalF'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 16
    Top = 189
    object CdsTerminalFCOD_TERMINAL: TIntegerField
      DisplayLabel = 'C'#243'digo Terminal'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object CdsTerminalFCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsTerminalFNOME_TERMINAL: TStringField
      DisplayLabel = 'Nome do Terminal'
      FieldName = 'NOME_TERMINAL'
      Required = True
      Size = 30
    end
    object CdsTerminalFEND_TERMINAL: TStringField
      DisplayLabel = 'Endere'#231'o do Terminal'
      DisplayWidth = 100
      FieldName = 'END_TERMINAL'
      Size = 100
    end
    object CdsTerminalFCOD_FISCAL: TIntegerField
      DisplayLabel = 'C'#243'digo Fiscal'
      FieldName = 'COD_FISCAL'
      Required = True
    end
    object CdsTerminalFENDREDEHWF_FDB: TStringField
      DisplayLabel = 'Endere'#231'o HWF.FDB'
      FieldName = 'ENDREDEHWF_FDB'
      Required = True
      Size = 80
    end
    object CdsTerminalFATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object DtTerminalF: TDataSource
    DataSet = CdsTerminalF
    Left = 16
    Top = 240
  end
  object QrBuscasFin: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    Left = 201
    Top = 8
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 112
    Top = 8
  end
  object IbSoftFiscal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select f.*,f.NOME_PAF||'#39'-'#39'||d.NOME_EMPDES as NOMEAPRES from '
      'FISCAL_VERSOES f, EMPDESVOLV d where '
      'f.COD_EMPDES = d.COD_EMPDES')
    Left = 206
    Top = 88
    object IbSoftFiscalCOD_FISCAL: TIntegerField
      FieldName = 'COD_FISCAL'
      Origin = '"FISCAL_VERSOES"."COD_FISCAL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbSoftFiscalCOD_EMPDES: TIntegerField
      FieldName = 'COD_EMPDES'
      Origin = '"FISCAL_VERSOES"."COD_EMPDES"'
      Required = True
    end
    object IbSoftFiscalNOME_PAF: TIBStringField
      FieldName = 'NOME_PAF'
      Origin = '"FISCAL_VERSOES"."NOME_PAF"'
      Required = True
      Size = 40
    end
    object IbSoftFiscalVERSAO_PAF: TIBStringField
      FieldName = 'VERSAO_PAF'
      Origin = '"FISCAL_VERSOES"."VERSAO_PAF"'
      Required = True
      Size = 10
    end
    object IbSoftFiscalMD5_PAF: TIBStringField
      FieldName = 'MD5_PAF'
      Origin = '"FISCAL_VERSOES"."MD5_PAF"'
      Required = True
      Size = 32
    end
    object IbSoftFiscalDATA_CAD_FISCAL: TDateTimeField
      FieldName = 'DATA_CAD_FISCAL'
      Origin = '"FISCAL_VERSOES"."DATA_CAD_FISCAL"'
    end
    object IbSoftFiscalDATA_MOD_FISCAL: TDateTimeField
      FieldName = 'DATA_MOD_FISCAL'
      Origin = '"FISCAL_VERSOES"."DATA_MOD_FISCAL"'
    end
    object IbSoftFiscalATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"FISCAL_VERSOES"."ATIVO"'
    end
    object IbSoftFiscalER_PAF_ECF: TIBStringField
      FieldName = 'ER_PAF_ECF'
      Origin = '"FISCAL_VERSOES"."ER_PAF_ECF"'
      Size = 4
    end
    object IbSoftFiscalNOMEAPRES: TIBStringField
      FieldName = 'NOMEAPRES'
      ProviderFlags = []
      Size = 81
    end
    object IbSoftFiscalPRINCIPAL_EXEC: TIBStringField
      FieldName = 'PRINCIPAL_EXEC'
      Origin = '"FISCAL_VERSOES"."PRINCIPAL_EXEC"'
      Required = True
      Size = 25
    end
    object IbSoftFiscalN_LAUDO_FISCAL: TIBStringField
      FieldName = 'N_LAUDO_FISCAL'
      Origin = '"FISCAL_VERSOES"."N_LAUDO_FISCAL"'
      Required = True
      Size = 15
    end
  end
  object CdsSoftFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSoftFiscal'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 206
    Top = 189
    object CdsSoftFiscalCOD_FISCAL: TIntegerField
      DisplayLabel = 'C'#243'd. Fiscal'
      FieldName = 'COD_FISCAL'
      Required = True
    end
    object CdsSoftFiscalNOME_PAF: TStringField
      DisplayLabel = 'Nome PAF'
      FieldName = 'NOME_PAF'
      Required = True
      Size = 40
    end
    object CdsSoftFiscalVERSAO_PAF: TStringField
      DisplayLabel = 'Vers'#227'o PAF'
      FieldName = 'VERSAO_PAF'
      Required = True
      Size = 10
    end
    object CdsSoftFiscalMD5_PAF: TStringField
      DisplayLabel = 'MD5 PAF'
      FieldName = 'MD5_PAF'
      Required = True
      Size = 32
    end
    object CdsSoftFiscalDATA_CAD_FISCAL: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_FISCAL'
    end
    object CdsSoftFiscalDATA_MOD_FISCAL: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Altera'#231#227'o'
      FieldName = 'DATA_MOD_FISCAL'
    end
    object CdsSoftFiscalER_PAF_ECF: TStringField
      DisplayLabel = 'ER PAF ECF'
      FieldName = 'ER_PAF_ECF'
      Size = 4
    end
    object CdsSoftFiscalNOMEAPRES: TStringField
      DisplayLabel = 'Nome da Empresa Desenvolv'
      FieldName = 'NOMEAPRES'
      ProviderFlags = []
      Size = 81
    end
    object CdsSoftFiscalCOD_EMPDES: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa Desenvolvedora'
      FieldName = 'COD_EMPDES'
      Required = True
    end
    object CdsSoftFiscalATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsSoftFiscalPRINCIPAL_EXEC: TStringField
      FieldName = 'PRINCIPAL_EXEC'
      Required = True
      Size = 25
    end
    object CdsSoftFiscalN_LAUDO_FISCAL: TStringField
      FieldName = 'N_LAUDO_FISCAL'
      Required = True
      Size = 15
    end
  end
  object DspSoftFiscal: TDataSetProvider
    DataSet = IbSoftFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 206
    Top = 138
  end
  object DtSoftFiscal: TDataSource
    DataSet = CdsSoftFiscal
    Left = 206
    Top = 240
  end
  object IbResumoD: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from RESUMOD')
    Left = 301
    Top = 88
  end
  object DspResumoD: TDataSetProvider
    DataSet = IbResumoD
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 301
    Top = 138
  end
  object CdsResumoD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspResumoD'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 301
    Top = 189
    object CdsResumoDCOD_TERMINAL: TIntegerField
      DisplayLabel = 'C'#243'digo Terminal'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object CdsResumoDCOORED: TIntegerField
      DisplayLabel = 'COO Redu'#231#227'o'
      FieldName = 'COORED'
      Required = True
    end
    object CdsResumoDCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsResumoDNSERIEECF: TStringField
      DisplayLabel = 'N'#250'mero S'#233'rie ECF'
      FieldName = 'NSERIEECF'
    end
    object CdsResumoDDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object CdsResumoDSEQINI: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia Inicial'
      FieldName = 'SEQINI'
    end
    object CdsResumoDSEQFIM: TIntegerField
      DisplayLabel = 'Sequencia Final'
      FieldName = 'SEQFIM'
    end
    object CdsResumoDVLVENDAB: TFloatField
      DisplayLabel = 'Valor Venda Bruta'
      FieldName = 'VLVENDAB'
    end
    object CdsResumoDVLTOTGERAL: TFloatField
      DisplayLabel = 'Valor Totalizador Geral'
      FieldName = 'VLTOTGERAL'
    end
    object CdsResumoDCRO_MOV: TIntegerField
      DisplayLabel = 'CRO Movimento'
      FieldName = 'CRO_MOV'
    end
    object CdsResumoDNREDUCOES: TIntegerField
      DisplayLabel = 'N'#250'mero Redu'#231#227'o'
      FieldName = 'NREDUCOES'
    end
    object CdsResumoDVLTOTLIQ: TFloatField
      DisplayLabel = 'Valor Venda Liquida'
      FieldName = 'VLTOTLIQ'
    end
    object CdsResumoDVLCANCEL: TFloatField
      DisplayLabel = 'Valor Cancelamento'
      FieldName = 'VLCANCEL'
    end
    object CdsResumoDVLACRESCIMO: TFloatField
      DisplayLabel = 'Valor Acr'#233'scimos'
      FieldName = 'VLACRESCIMO'
    end
    object CdsResumoDVLDESCONTOS: TFloatField
      DisplayLabel = 'Valor Descontos'
      FieldName = 'VLDESCONTOS'
    end
    object CdsResumoDVLISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VLISS'
    end
    object CdsResumoDVLISENTOS: TFloatField
      DisplayLabel = 'Valor Isentos'
      FieldName = 'VLISENTOS'
    end
    object CdsResumoDVLNINCIDENCIA: TFloatField
      DisplayLabel = 'Valor N'#227'o Incid'#234'ncias'
      FieldName = 'VLNINCIDENCIA'
    end
    object CdsResumoDVLSUBST: TFloatField
      DisplayLabel = 'Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'VLSUBST'
    end
    object CdsResumoDDATA_EMISSAO_Z: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o Z'
      FieldName = 'DATA_EMISSAO_Z'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object CdsResumoDHORA_EMISSAO_Z: TStringField
      DisplayLabel = 'Hora Emiss'#227'o Z'
      FieldName = 'HORA_EMISSAO_Z'
      Required = True
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
  end
  object DtResumoD: TDataSource
    DataSet = CdsResumoD
    Left = 301
    Top = 240
  end
  object IbEmpDesenvolv: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from EMPDESVOLV')
    Left = 396
    Top = 88
  end
  object DspEmpDesenvolv: TDataSetProvider
    DataSet = IbEmpDesenvolv
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 396
    Top = 138
  end
  object CdsEmpDesenvolv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpDesenvolv'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 396
    Top = 189
    object CdsEmpDesenvolvCOD_EMPDES: TIntegerField
      FieldName = 'COD_EMPDES'
      Required = True
    end
    object CdsEmpDesenvolvNOME_EMPDES: TStringField
      FieldName = 'NOME_EMPDES'
      Required = True
      Size = 40
    end
    object CdsEmpDesenvolvCNPJ_EMPDES: TStringField
      FieldName = 'CNPJ_EMPDES'
      Required = True
      Size = 14
    end
    object CdsEmpDesenvolvCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object CdsEmpDesenvolvIE_EMPDES: TStringField
      FieldName = 'IE_EMPDES'
      Required = True
      Size = 14
    end
    object CdsEmpDesenvolvIM_EMPDES: TStringField
      FieldName = 'IM_EMPDES'
      Required = True
      Size = 14
    end
    object CdsEmpDesenvolvDATA_CAD_EMPDES: TDateTimeField
      FieldName = 'DATA_CAD_EMPDES'
    end
    object CdsEmpDesenvolvDATA_MOD_EMPDES: TDateTimeField
      FieldName = 'DATA_MOD_EMPDES'
    end
    object CdsEmpDesenvolvATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsEmpDesenvolvENDERECO_EMPDES: TStringField
      FieldName = 'ENDERECO_EMPDES'
      Required = True
      Size = 50
    end
    object CdsEmpDesenvolvBAIRRO_EMPDES: TStringField
      FieldName = 'BAIRRO_EMPDES'
      Required = True
      Size = 30
    end
    object CdsEmpDesenvolvCIDADE_EMPDES: TStringField
      FieldName = 'CIDADE_EMPDES'
      Required = True
      Size = 30
    end
    object CdsEmpDesenvolvFONE_EMPDES: TStringField
      FieldName = 'FONE_EMPDES'
      Required = True
      Size = 13
    end
    object CdsEmpDesenvolvCONTATO_EMPDES: TStringField
      FieldName = 'CONTATO_EMPDES'
      Required = True
      Size = 30
    end
  end
  object DtEmpDes: TDataSource
    DataSet = CdsEmpDesenvolv
    Left = 396
    Top = 240
  end
  object IbDocNaoFiscal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from DOC_NAOFISCAL_TERMINAL')
    Left = 111
    Top = 88
  end
  object DspDocNaoFiscal: TDataSetProvider
    DataSet = IbDocNaoFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 111
    Top = 138
  end
  object CdsDocNaoFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDocNaoFiscal'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 111
    Top = 189
    object CdsDocNaoFiscalCOD_TERMINAL: TIntegerField
      DisplayLabel = 'C'#243'd. Terminal'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object CdsDocNaoFiscalCOO_ECF: TIntegerField
      DisplayLabel = 'COO ECF'
      FieldName = 'COO_ECF'
      Required = True
    end
    object CdsDocNaoFiscalGNF_ECF: TIntegerField
      DisplayLabel = 'GNF ECF'
      FieldName = 'GNF_ECF'
      Required = True
    end
    object CdsDocNaoFiscalGRG_ECF: TIntegerField
      DisplayLabel = 'GRG ECF'
      FieldName = 'GRG_ECF'
      Required = True
    end
    object CdsDocNaoFiscalCDC_ECF: TIntegerField
      DisplayLabel = 'CDC ECF'
      FieldName = 'CDC_ECF'
      Required = True
    end
    object CdsDocNaoFiscalTIPO_DOC_ECF: TStringField
      DisplayLabel = 'Tipo Documento ECF'
      FieldName = 'TIPO_DOC_ECF'
      Required = True
      Size = 2
    end
    object CdsDocNaoFiscalDATA_F_EMISSAO: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o do Documento'
      FieldName = 'DATA_F_EMISSAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object CdsDocNaoFiscalHORA_F_EMISSAO: TStringField
      DisplayLabel = 'Hora de Emiss'#227'o do Documento'
      FieldName = 'HORA_F_EMISSAO'
      Required = True
      EditMask = '!90:00;1;_'
      Size = 8
    end
    object CdsDocNaoFiscalCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object DtDocNaoFiscal: TDataSource
    DataSet = CdsDocNaoFiscal
    Left = 111
    Top = 240
  end
  object IbimpCNIEE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from IMPRESSORAS_CNIEE')
    Left = 586
    Top = 88
  end
  object DspImpCNIEE: TDataSetProvider
    DataSet = IbimpCNIEE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 586
    Top = 138
  end
  object CdsImpCNIEE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspImpCNIEE'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 586
    Top = 189
    object CdsImpCNIEEIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CdsImpCNIEETIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
    end
    object CdsImpCNIEEMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object CdsImpCNIEEMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object CdsImpCNIEEVERSAOSB: TStringField
      FieldName = 'VERSAOSB'
    end
    object CdsImpCNIEEQTDELACRESEXTSL: TIntegerField
      FieldName = 'QTDELACRESEXTSL'
    end
    object CdsImpCNIEEQTDELACRESEXTFAB: TIntegerField
      FieldName = 'QTDELACRESEXTFAB'
    end
    object CdsImpCNIEETEMFD: TStringField
      FieldName = 'TEMFD'
      FixedChar = True
      Size = 1
    end
    object CdsImpCNIEELACREMFD: TStringField
      FieldName = 'LACREMFD'
      FixedChar = True
      Size = 1
    end
    object CdsImpCNIEEATO_APROVACAO: TStringField
      FieldName = 'ATO_APROVACAO'
      Size = 30
    end
  end
  object DtImpCNIEE: TDataSource
    DataSet = CdsImpCNIEE
    Left = 586
    Top = 240
  end
  object IbImprTerminal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from TERMINAL_IMPRESSORAS')
    Left = 681
    Top = 88
  end
  object DspImprTerminal: TDataSetProvider
    DataSet = IbImprTerminal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 681
    Top = 138
  end
  object CdsImprTerminal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspImprTerminal'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 681
    Top = 189
    object CdsImprTerminalIDENT_CNIEE: TStringField
      DisplayLabel = 'CNIEE ECF'
      FieldName = 'IDENT_CNIEE'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CdsImprTerminalCOD_TERMINAL: TIntegerField
      DisplayLabel = 'C'#243'd. Terminal'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object CdsImprTerminalNUM_SERIE_ECF: TStringField
      DisplayLabel = 'N'#250'mero S'#233'rie'
      FieldName = 'NUM_SERIE_ECF'
      Required = True
    end
    object CdsImprTerminalMF_ADICIONAL: TStringField
      DisplayLabel = 'MF. Adicional'
      FieldName = 'MF_ADICIONAL'
      Size = 1
    end
    object CdsImprTerminalCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsImprTerminalDATA_CAD_TERM: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_TERM'
    end
    object CdsImprTerminalDATA_MOD_TERM: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o'
      FieldName = 'DATA_MOD_TERM'
    end
    object CdsImprTerminalDATA_SB: TDateTimeField
      DisplayLabel = 'Data Software B'#225'sico'
      FieldName = 'DATA_SB'
      EditMask = '!99/99/0000;1;_'
    end
    object CdsImprTerminalHORA_SB: TStringField
      DisplayLabel = 'Hora Software B'#225'sico'
      FieldName = 'HORA_SB'
      EditMask = '!90:00;1;_'
      Size = 6
    end
    object CdsImprTerminalISSQNDESC: TStringField
      DisplayLabel = 'Desconto em ISS?'
      FieldName = 'ISSQNDESC'
      Size = 1
    end
    object CdsImprTerminalATUAL: TStringField
      DisplayLabel = 'Impressora Atualmente em uso'
      FieldName = 'ATUAL'
      Required = True
      Size = 1
    end
    object CdsImprTerminalCOD_PROPRIETARIO: TIntegerField
      DisplayLabel = 'C'#243'd. Propriet'#225'rio'
      FieldName = 'COD_PROPRIETARIO'
    end
  end
  object DtImprTerminal: TDataSource
    DataSet = CdsImprTerminal
    Left = 681
    Top = 240
  end
  object IbDetalheResumoD: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from MAPA_RESUMO_ALIQ')
    Left = 491
    Top = 88
  end
  object DspDetalhesMpD: TDataSetProvider
    DataSet = IbDetalheResumoD
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 491
    Top = 138
  end
  object CdsDetallhesResumoD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDetalhesMpD'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 491
    Top = 189
    object CdsDetallhesResumoDCOD_TERMINAL: TIntegerField
      DisplayLabel = 'C'#243'd. Terminal'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object CdsDetallhesResumoDCOORED: TIntegerField
      DisplayLabel = 'COO Redu'#231#227'o'
      FieldName = 'COORED'
      Required = True
    end
    object CdsDetallhesResumoDCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsDetallhesResumoDALIQ_SEQ: TStringField
      DisplayLabel = 'Sequ'#234'ncia Aliquota'
      FieldName = 'ALIQ_SEQ'
      Required = True
      Size = 4
    end
    object CdsDetallhesResumoDDESCALIQ: TStringField
      DisplayLabel = 'Descri'#231#227'o da Aliquota'
      FieldName = 'DESCALIQ'
      Size = 7
    end
    object CdsDetallhesResumoDVALORALIQ: TFloatField
      DisplayLabel = 'Valor Aliquota'
      FieldName = 'VALORALIQ'
    end
  end
  object DtDetalhesResumoD: TDataSource
    DataSet = CdsDetallhesResumoD
    Left = 491
    Top = 240
  end
  object IbBuscaTerminal: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = IbTransTerminalInLoco
    Left = 16
    Top = 344
  end
  object IbTerminalRetag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    Left = 213
    Top = 344
  end
  object IbTerminalinloco: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = IbTransTerminalInLoco
    Left = 557
    Top = 8
  end
  object IbTransTerminalInLoco: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoFiscal
    Left = 734
    Top = 8
  end
  object CdsBuscaTerminal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTerminalFiscal'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 16
    Top = 445
  end
  object DspTerminalFiscal: TDataSetProvider
    DataSet = IbBuscaTerminal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 16
    Top = 394
  end
  object CdsTerminalRet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTerminalRet'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 213
    Top = 445
  end
  object DspTerminalRet: TDataSetProvider
    DataSet = IbTerminalRetag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 213
    Top = 394
  end
  object IbArquivosFiscal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from ARQUIVOS_FISCAL')
    Left = 776
    Top = 88
  end
  object DspArquivosFiscal: TDataSetProvider
    DataSet = IbArquivosFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 776
    Top = 138
  end
  object CdsArquivosFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspArquivosFiscal'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 776
    Top = 189
    object CdsArquivosFiscalCOD_ARQUIVO: TIntegerField
      FieldName = 'COD_ARQUIVO'
      Required = True
    end
    object CdsArquivosFiscalCOD_FISCAL: TIntegerField
      FieldName = 'COD_FISCAL'
      Required = True
    end
    object CdsArquivosFiscalNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Required = True
      Size = 30
    end
    object CdsArquivosFiscalMD5_ARQUIVO: TStringField
      FieldName = 'MD5_ARQUIVO'
      Required = True
      Size = 32
    end
  end
  object DtArquivosFiscal: TDataSource
    DataSet = CdsArquivosFiscal
    Left = 776
    Top = 240
  end
  object DtbHwFFDB: TIBDatabase
    DatabaseName = '127.0.0.1:c:\basesauto\HwF.Fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 290
    Top = 8
  end
  object IbDestinoHwF: TIBQuery
    Database = DtbHwFFDB
    Transaction = IbTransHwFFdb
    Left = 114
    Top = 344
  end
  object DspDestinoHwF: TDataSetProvider
    DataSet = IbDestinoHwF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 114
    Top = 394
  end
  object CdsDestinoHWFFDB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDestinoHwF'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 114
    Top = 445
  end
  object IbapagarHwfdb: TIBQuery
    Database = DtbHwFFDB
    Transaction = IbTransHwFFdb
    Left = 468
    Top = 8
  end
  object IbTransHwFFdb: TIBTransaction
    DefaultDatabase = DtbHwFFDB
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 379
    Top = 8
  end
  object qrTermConf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select * from TERMINALF')
    Left = 312
    Top = 344
  end
  object dspTermConf: TDataSetProvider
    DataSet = qrTermConf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 312
    Top = 394
  end
  object cdsTerminalConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTermConf'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 312
    Top = 445
    object cdsTerminalConfigCOD_TERMINAL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsTerminalConfigCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsTerminalConfigNOME_TERMINAL: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'NOME_TERMINAL'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsTerminalConfigEND_TERMINAL: TStringField
      DisplayLabel = 'Endere'#231'o do Banco'
      FieldName = 'END_TERMINAL'
      Size = 100
    end
    object cdsTerminalConfigMECANICO: TIntegerField
      FieldName = 'MECANICO'
      Visible = False
    end
    object cdsTerminalConfigATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsTerminalConfigCOD_FISCAL: TIntegerField
      FieldName = 'COD_FISCAL'
      Required = True
      Visible = False
    end
    object cdsTerminalConfigENDREDEHWF_FDB: TStringField
      FieldName = 'ENDREDEHWF_FDB'
      Required = True
      Visible = False
      Size = 80
    end
  end
  object dsTerminalConfig: TDataSource
    AutoEdit = False
    DataSet = cdsTerminalConfig
    Left = 312
    Top = 496
  end
  object qrLayout: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    Left = 392
    Top = 344
  end
  object dspLayout: TDataSetProvider
    DataSet = qrLayout
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 392
    Top = 393
  end
  object cdsLayout: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLayout'
    BeforeOpen = CdsPendBalcaoBeforeOpen
    Left = 392
    Top = 445
  end
  object dsLayout: TDataSource
    DataSet = cdsLayout
    Left = 392
    Top = 496
  end
  object dsVendTerminais: TDataSource
    AutoEdit = False
    DataSet = cdsVendTerminais
    Left = 544
    Top = 408
  end
  object cdsDetVendT: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 360
    Data = {
      5A0000009619E0BD0100000018000000020000000000030000005A0009646573
      63726963616F01004900000001000557494454480200020032000576616C6F72
      080004000000010007535542545950450200490006004D6F6E6579000000}
    object cdsDetVendTdescricao: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'descricao'
      Size = 50
    end
    object cdsDetVendTvalor: TCurrencyField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
  end
  object dsDetVendT: TDataSource
    AutoEdit = False
    DataSet = cdsDetVendT
    Left = 608
    Top = 408
  end
  object cdsVendTerminais: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 360
    Data = {
      FD0000009619E0BD010000001800000007000000000003000000FD0008546572
      6D696E616C0100490000000100055749445448020002003C000D446174614D6F
      76696D656E746F04000600000000000A56656E64614272757461080004000000
      010007535542545950450200490006004D6F6E65790008446573636F6E746F08
      0004000000010007535542545950450200490006004D6F6E6579000C56656E64
      614C697175696461080004000000010007535542545950450200490006004D6F
      6E65790009416372657363696D6F080004000000010007535542545950450200
      490006004D6F6E6579000C636F645F7465726D696E616C040001000000000000
      00}
    object cdsVendTerminaisTerminal: TStringField
      FieldName = 'Terminal'
      Size = 60
    end
    object cdsVendTerminaisDataMovimento: TDateField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DataMovimento'
    end
    object cdsVendTerminaisVendaBruta: TCurrencyField
      DisplayLabel = 'Venda Bruta'
      FieldName = 'VendaBruta'
    end
    object cdsVendTerminaisDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object cdsVendTerminaisVendaLiquida: TCurrencyField
      DisplayLabel = 'Venda L'#237'quida'
      FieldName = 'VendaLiquida'
    end
    object cdsVendTerminaisAcrescimo: TCurrencyField
      FieldName = 'Acrescimo'
    end
    object cdsVendTerminaiscod_terminal: TIntegerField
      FieldName = 'cod_terminal'
    end
  end
  object rdpRel: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Pr'#233'-Visualiza'#231#227'o de Relat'#243'rios'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'LESTE INFORMATICA LTDA - ME'
    RegistroUsuario.SerieProduto = 'SINGLE-0113/01448'
    RegistroUsuario.AutorizacaoKey = 'VUYG-1QQX-P85V-AWCD-RR5K'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Relat'#243'rio de Vendas'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 132
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S20cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 752
    Top = 336
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    Left = 753
    Top = 400
  end
  object qrBuscas3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    Left = 753
    Top = 456
  end
  object qrBuscas4: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    Left = 753
    Top = 504
  end
  object qrOlap: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TsTerminalF
    SQL.Strings = (
      'select'
      'co.cod_vendedor,'
      'co.nome_vendedor,'
      'pv.horaabertura,'
      'pv.horafechamento,'
      'pv.minabertura, '
      'pv.minfechamento,'
      'pp.grupo_prod,'
      'pp.cod_prod,'
      'p.descr_prod,'
      'g.descricao nomegrupo,'
      'sg.descricao nomesubgrupo,'
      'pv.nped,'
      'pv.ncupom,'
      'pv.operador,'
      'case extract(weekday from pv.data_fech)'
      '    when 0 then '#39'Domingo'#39
      '     when 1 then '#39'Segunda-feira'#39
      '     when 2 then '#39'Ter'#231'a-feira'#39
      '     when 3 then '#39'Quarta-feira'#39
      '     when 4 then '#39'Quinta-feira'#39
      '     when 5 then '#39'Sexta-feira'#39
      '     when 6 then '#39'S'#225'bado'#39
      '   end diasemana,'
      'sum(pp.vltot_ped_item) vendaBruta,'
      '(sum(pp.rateio_desc) + sum(pp.desc_item) ) desconto,'
      '(sum(pp.rateio_acresc) + sum(pp.acresc_item) ) acrescimo,'
      
        '(sum(pp.vltot_ped_item) - (sum(pp.rateio_desc) + sum(pp.desc_ite' +
        'm)) + (sum(pp.rateio_acresc) + sum(pp.acresc_item) ) ) vendaliqu' +
        'ida,'
      'count(pp.nitem) qtdeitensdavenda,'
      'sum(pp.quant_ped_item) qtdeprodutosvendidos'
      'from pedvenda pv'
      
        'inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = p' +
        'v.tipo and pp.cod_empresa = pv.cod_empresa'
      
        'inner join colaborador co on co.cod_vendedor = pv.cod_vendedor a' +
        'nd co.cod_empresa = pv.cod_empresa'
      
        'inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_' +
        'prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa'
      'inner join grupos g on g.codigo_grup = p.grupo_prod'
      'left join sub_grupo sg on sg.codigo_subgr = p.sub_g_prod'
      'where pv.data_fech >= :data1'
      'and pv.data_fech <= :data2'
      'and pv.cod_empresa = :cod_empresa'
      'and pv.operador in (:operador)'
      'and pv.ativo = 1'
      'and not pv.ncupom is null'
      'and not pv.minabertura is null'
      'and not pv.minfechamento is null'
      'and not pv.horaabertura is null'
      'and not pv.horafechamento is null'
      'and pp.status is null'
      'group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15')
    Left = 673
    Top = 480
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
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'operador'
        ParamType = ptUnknown
      end>
    object qrOlapCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Operador'
      FieldName = 'COD_VENDEDOR'
      Origin = '"COLABORADOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrOlapNOME_VENDEDOR: TIBStringField
      DisplayLabel = 'Operador'
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
    object qrOlapHORAABERTURA: TIntegerField
      DisplayLabel = 'Hora Abert'
      FieldName = 'HORAABERTURA'
      Origin = '"PEDVENDA"."HORAABERTURA"'
    end
    object qrOlapHORAFECHAMENTO: TIntegerField
      DisplayLabel = 'Hora Fech'
      FieldName = 'HORAFECHAMENTO'
      Origin = '"PEDVENDA"."HORAFECHAMENTO"'
    end
    object qrOlapMINABERTURA: TIntegerField
      DisplayLabel = 'Minut Abert'
      FieldName = 'MINABERTURA'
      Origin = '"PEDVENDA"."MINABERTURA"'
    end
    object qrOlapMINFECHAMENTO: TIntegerField
      DisplayLabel = 'Minut Fech'
      FieldName = 'MINFECHAMENTO'
      Origin = '"PEDVENDA"."MINFECHAMENTO"'
    end
    object qrOlapGRUPO_PROD: TIntegerField
      DisplayLabel = 'Cod Grupo'
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrOlapCOD_PROD: TIBStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA_PROD"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrOlapDESCR_PROD: TIBStringField
      DisplayLabel = 'Descricao Produto'
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      FixedChar = True
      Size = 75
    end
    object qrOlapNOMEGRUPO: TIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'NOMEGRUPO'
      ProviderFlags = []
      Size = 80
    end
    object qrOlapNOMESUBGRUPO: TIBStringField
      DisplayLabel = 'Sub Grupo'
      FieldName = 'NOMESUBGRUPO'
      ProviderFlags = []
      Size = 80
    end
    object qrOlapNPED: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrOlapNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
      ProviderFlags = []
    end
    object qrOlapDIASEMANA: TIBStringField
      DisplayLabel = 'Dia da Semana'
      FieldName = 'DIASEMANA'
      ProviderFlags = []
      FixedChar = True
      Size = 13
    end
    object qrOlapVENDABRUTA: TFloatField
      DisplayLabel = 'Venda Bruta'
      FieldName = 'VENDABRUTA'
      ProviderFlags = []
      currency = True
    end
    object qrOlapDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = []
      currency = True
    end
    object qrOlapACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      ProviderFlags = []
      currency = True
    end
    object qrOlapVENDALIQUIDA: TFloatField
      DisplayLabel = 'Venda L'#237'quida'
      FieldName = 'VENDALIQUIDA'
      ProviderFlags = []
    end
    object qrOlapQTDEITENSDAVENDA: TIntegerField
      DisplayLabel = 'Qtde Itens da Venda'
      FieldName = 'QTDEITENSDAVENDA'
      ProviderFlags = []
    end
    object qrOlapQTDEPRODUTOSVENDIDOS: TFloatField
      DisplayLabel = 'Qtde Prod Vendidos'
      FieldName = 'QTDEPRODUTOSVENDIDOS'
      ProviderFlags = []
    end
    object qrOlapOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      ProviderFlags = []
    end
  end
  object qrHwf: TIBQuery
    Database = DtbHwFFDB
    Transaction = IbTransHwFFdb
    Left = 636
    Top = 8
  end
end
