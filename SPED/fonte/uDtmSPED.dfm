object dtmSPED: TdtmSPED
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 485
  Width = 851
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 33
    Top = 9
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
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 112
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 184
    Top = 8
  end
  object dsBuscas: TDataSource
    Left = 248
    Top = 8
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 304
    Top = 8
  end
  object qrInfCompl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_INFORMACAO_COMPLEMENTAR'
      'where cod_inf = 0 and cod_empresa = 0')
    Left = 29
    Top = 64
  end
  object dspInfCompl: TDataSetProvider
    DataSet = qrInfCompl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsInfCompl: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspInfCompl'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 29
    Top = 160
    object cdsInfComplCOD_INF: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsInfComplTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object cdsInfComplTXT: TStringField
      Tag = 2
      DisplayLabel = 'Texto'
      FieldName = 'TXT'
      Size = 510
    end
    object cdsInfComplTXT_COMPL: TStringField
      DisplayLabel = 'Texto Complementar'
      FieldName = 'TXT_COMPL'
      Size = 510
    end
    object cdsInfComplATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsInfComplCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsInfComplATIVO_EM_NFE: TStringField
      DisplayLabel = 'Ativa em NFe'
      FieldName = 'ATIVO_EM_NFE'
      Size = 1
    end
    object cdsInfComplATIVO_EM_NFCE: TStringField
      DisplayLabel = 'Ativa em NFCe'
      FieldName = 'ATIVO_EM_NFCE'
      Size = 1
    end
  end
  object dsInfCompl: TDataSource
    AutoEdit = False
    DataSet = cdsInfCompl
    Left = 29
    Top = 208
  end
  object qrAcaoJud: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_PROC_REF_ACAO_JUDICIAL'
      'where cod_acao_judicial = 0')
    Left = 117
    Top = 64
  end
  object dspAcaoJud: TDataSetProvider
    DataSet = qrAcaoJud
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 117
    Top = 112
  end
  object cdsAcaoJud: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAcaoJud'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 117
    Top = 160
    object cdsAcaoJudCOD_ACAO_JUDICIAL: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_ACAO_JUDICIAL'
      Required = True
    end
    object cdsAcaoJudNUM_PROC: TStringField
      Tag = 2
      DisplayLabel = 'N'#250'mero Processo'
      FieldName = 'NUM_PROC'
      Required = True
    end
    object cdsAcaoJudID_SEC_JUD: TStringField
      Tag = 2
      DisplayLabel = 'Se'#231#227'o Judici'#225'ria'
      FieldName = 'ID_SEC_JUD'
      Required = True
      Size = 128
    end
    object cdsAcaoJudID_VARA: TStringField
      Tag = 2
      DisplayLabel = 'Identifica'#231#227'o da Vara'
      FieldName = 'ID_VARA'
      Required = True
      Size = 2
    end
    object cdsAcaoJudIND_NAT_ACAO: TStringField
      Tag = 2
      DisplayLabel = 'Natureza da A'#231#227'o Judicial'
      FieldName = 'IND_NAT_ACAO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsAcaoJudDESC_DEC_JUD: TStringField
      DisplayLabel = 'Descri'#231#227'o Resumida dos Efeitos Tribut'#225'rios'
      FieldName = 'DESC_DEC_JUD'
      Size = 100
    end
    object cdsAcaoJudDT_SENT_JUD: TDateTimeField
      DisplayLabel = 'Data Sente'#231'a/Decis'#227'o Judicial'
      FieldName = 'DT_SENT_JUD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAcaoJudDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
    end
  end
  object dsAcaoJud: TDataSource
    AutoEdit = False
    DataSet = cdsAcaoJud
    Left = 117
    Top = 208
  end
  object qrProcAdm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_PROC_REF_ADMINISTRATIVO'
      'where cod_adm = 0')
    Left = 205
    Top = 64
  end
  object dspProcAdm: TDataSetProvider
    DataSet = qrProcAdm
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 205
    Top = 112
  end
  object cdsProcAdm: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProcAdm'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 205
    Top = 160
    object cdsProcAdmCOD_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_ADM'
      Required = True
    end
    object cdsProcAdmNUM_PROC: TStringField
      DisplayLabel = 'N'#250'mero Processo'
      FieldName = 'NUM_PROC'
      Required = True
    end
    object cdsProcAdmIND_NAT_ACAO: TStringField
      DisplayLabel = 'Natureza do Processo Administrativo'
      FieldName = 'IND_NAT_ACAO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsProcAdmDT_DEC_ADM: TDateTimeField
      DisplayLabel = 'Data do Despacho/Decis'#227'o Administrativa'
      FieldName = 'DT_DEC_ADM'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsProcAdmDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dsProcAdm: TDataSource
    AutoEdit = False
    DataSet = cdsProcAdm
    Left = 205
    Top = 208
  end
  object qrOutRecCred: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from sped_outras_receitas_creditos so'
      'where cod_rec_cred = 0 and cod_empresa = 0')
    Left = 285
    Top = 64
  end
  object dspOutRecCred: TDataSetProvider
    DataSet = qrOutRecCred
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 285
    Top = 112
  end
  object cdsOutRecCred: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspOutRecCred'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 285
    Top = 160
    object cdsOutRecCredCOD_REC_CRED: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_REC_CRED'
      Required = True
    end
    object cdsOutRecCredIND_OPER: TIntegerField
      Tag = 2
      DisplayLabel = 'Indicador Tipo Opera'#231#227'o'
      FieldName = 'IND_OPER'
      Required = True
    end
    object cdsOutRecCredCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Participante'
      FieldName = 'COD_CLIENTE'
    end
    object cdsOutRecCredCOD_ITEM: TStringField
      DisplayLabel = 'Cod Item'
      FieldName = 'COD_ITEM'
    end
    object cdsOutRecCredDESCR_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o Item'
      FieldName = 'DESCR_ITEM'
      Size = 128
    end
    object cdsOutRecCredDT_OPER: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Opera'#231#227'o'
      FieldName = 'DT_OPER'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOutRecCredDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOutRecCredVL_OPER: TFloatField
      Tag = 2
      DisplayLabel = 'Valor da Opera'#231#227'o'
      FieldName = 'VL_OPER'
      DisplayFormat = '##0.00'
    end
    object cdsOutRecCredCST_PIS: TStringField
      Tag = 2
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsOutRecCredVL_BC_PIS: TFloatField
      DisplayLabel = 'Base PIS'
      FieldName = 'VL_BC_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsOutRecCredALIQ_PIS: TFloatField
      DisplayLabel = 'Aliq PIS'
      FieldName = 'ALIQ_PIS'
      DisplayFormat = '##0.0000'
    end
    object cdsOutRecCredVL_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VL_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsOutRecCredCST_COFINS: TStringField
      Tag = 2
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsOutRecCredVL_BC_COFINS: TFloatField
      DisplayLabel = 'Base COFINS'
      FieldName = 'VL_BC_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsOutRecCredALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
      DisplayFormat = '##0.0000'
    end
    object cdsOutRecCredVL_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VL_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsOutRecCredNAT_BC_CRED: TStringField
      DisplayLabel = 'Natureza Base C'#225'lculo Cr'#233'dito'
      FieldName = 'NAT_BC_CRED'
      FixedChar = True
      Size = 2
    end
    object cdsOutRecCredIND_ORIG_CRED: TStringField
      DisplayLabel = 'Indicador de Origem do Cr'#233'dito'
      FieldName = 'IND_ORIG_CRED'
      FixedChar = True
      Size = 1
    end
    object cdsOutRecCredCOD_CTA: TStringField
      DisplayLabel = 'C'#243'digo da Conta Anal'#237'tica Cont'#225'nbil'
      FieldName = 'COD_CTA'
      Size = 60
    end
    object cdsOutRecCredCOD_CCUS: TStringField
      DisplayLabel = 'C'#243'digo Centro de Custos'
      FieldName = 'COD_CCUS'
      Size = 60
    end
    object cdsOutRecCredPROCESSOS_REF: TMemoField
      DisplayLabel = 'Processos referenciados'
      FieldName = 'PROCESSOS_REF'
      OnGetText = cdsOutRecCredPROCESSOS_REFGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsOutRecCredDESC_DOC_OPER: TMemoField
      DisplayLabel = 'Descri'#231#227'o do Documento/Opera'#231#227'o'
      FieldName = 'DESC_DOC_OPER'
      OnGetText = cdsOutRecCredPROCESSOS_REFGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsOutRecCredCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsOutRecCredATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsOutRecCred: TDataSource
    AutoEdit = False
    DataSet = cdsOutRecCred
    Left = 285
    Top = 208
  end
  object qrCredDepr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_DEPREC_AMORT_BENS'
      'where COD_DEPREC = 0 and cod_empresa = 0')
    Left = 381
    Top = 64
  end
  object dspCredDepr: TDataSetProvider
    DataSet = qrCredDepr
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 381
    Top = 112
  end
  object cdsCredDepr: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCredDepr'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 381
    Top = 160
    object cdsCredDeprCOD_DEPREC: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_DEPREC'
      Required = True
    end
    object cdsCredDeprNAT_BC_CRED: TStringField
      Tag = 2
      DisplayLabel = 'Natureza Base C'#225'lculo Cr'#233'dito'
      FieldName = 'NAT_BC_CRED'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsCredDeprIDENT_BEM_IMOB: TStringField
      Tag = 2
      DisplayLabel = 'Identifica'#231#227'o do Bem'
      FieldName = 'IDENT_BEM_IMOB'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsCredDeprIND_ORIG_CRED: TSmallintField
      DisplayLabel = 'Indicador de Origem do Cr'#233'dito'
      FieldName = 'IND_ORIG_CRED'
    end
    object cdsCredDeprIND_UTIL_BEM_IMOB: TSmallintField
      Tag = 2
      DisplayLabel = 'Indicador da Utiliza'#231#227'o do Bem'
      FieldName = 'IND_UTIL_BEM_IMOB'
      Required = True
    end
    object cdsCredDeprVL_OPER_DEP: TFloatField
      DisplayLabel = 'Valor do Encargo de Deprecia'#231#227'o/Amortiza'#231#227'o incorrido no Per'#237'odo'
      FieldName = 'VL_OPER_DEP'
      DisplayFormat = '##0.00'
    end
    object cdsCredDeprPARC_OPER_NAO_BC_CRED: TFloatField
      DisplayLabel = 'Parcela em valor a excluir da base de c'#225'lculo'
      FieldName = 'PARC_OPER_NAO_BC_CRED'
      DisplayFormat = '##0.00'
    end
    object cdsCredDeprDATA_OPERACAO: TDateTimeField
      DisplayLabel = 'Data da opera'#231#227'o'
      FieldName = 'DATA_OPERACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCredDeprDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCredDeprCST_PIS: TStringField
      Tag = 2
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsCredDeprVL_BC_PIS: TFloatField
      DisplayLabel = 'Base PIS'
      FieldName = 'VL_BC_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsCredDeprALIQ_PIS: TFloatField
      DisplayLabel = 'Aliq PIS'
      FieldName = 'ALIQ_PIS'
      DisplayFormat = '#0.0000'
    end
    object cdsCredDeprVL_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VL_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsCredDeprCST_COFINS: TStringField
      Tag = 2
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsCredDeprVL_BC_COFINS: TFloatField
      DisplayLabel = 'Base COFINS'
      FieldName = 'VL_BC_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsCredDeprALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
      DisplayFormat = '#0.0000'
    end
    object cdsCredDeprVL_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VL_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsCredDeprCOD_CTA: TStringField
      DisplayLabel = 'C'#243'digo Conta Cont'#225'bil'
      FieldName = 'COD_CTA'
      Size = 60
    end
    object cdsCredDeprCOD_CCUS: TStringField
      DisplayLabel = 'C'#243'digo Centro de Custos'
      FieldName = 'COD_CCUS'
      Size = 60
    end
    object cdsCredDeprDESC_BEM_IMOB: TMemoField
      DisplayLabel = 'Descri'#231#227'o complementar do bem ou grupo de bens'
      FieldName = 'DESC_BEM_IMOB'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCredDeprPROCESSOS_REF: TMemoField
      DisplayLabel = 'Processos referenciados'
      FieldName = 'PROCESSOS_REF'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCredDeprCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCredDeprATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsCredDepr: TDataSource
    AutoEdit = False
    DataSet = cdsCredDepr
    Left = 381
    Top = 208
  end
  object qrAqBem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_AQUISICAO_BENS'
      'where COD_AQUISICAO = 0 and cod_empresa = 0')
    Left = 461
    Top = 64
  end
  object dspAqBem: TDataSetProvider
    DataSet = qrAqBem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 461
    Top = 112
  end
  object cdsAqBem: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAqBem'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 461
    Top = 160
    object cdsAqBemCOD_AQUISICAO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_AQUISICAO'
      Required = True
    end
    object cdsAqBemNAT_BC_CRED: TStringField
      Tag = 2
      DisplayLabel = 'Natureza Base C'#225'lculo Cr'#233'dito'
      FieldName = 'NAT_BC_CRED'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsAqBemIDENT_BEM_IMOB: TStringField
      Tag = 2
      DisplayLabel = 'Identifica'#231#227'o do Bem'
      FieldName = 'IDENT_BEM_IMOB'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsAqBemIND_ORIG_CRED: TSmallintField
      DisplayLabel = 'Indicador de Origem do Cr'#233'dito'
      FieldName = 'IND_ORIG_CRED'
    end
    object cdsAqBemIND_UTIL_BEM_IMOB: TSmallintField
      Tag = 2
      DisplayLabel = 'Indicador da Utiliza'#231#227'o do Bem'
      FieldName = 'IND_UTIL_BEM_IMOB'
      Required = True
    end
    object cdsAqBemMES_OPER_AQUIS: TDateTimeField
      DisplayLabel = 'M'#234's de Aquisi'#231#227'o'
      FieldName = 'MES_OPER_AQUIS'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAqBemVL_OPER_AQUIS: TFloatField
      Tag = 2
      DisplayLabel = 'Valor de Aquisi'#231#227'o do Bem'
      FieldName = 'VL_OPER_AQUIS'
      DisplayFormat = '#0.00'
    end
    object cdsAqBemPARC_OPER_NAO_BC_CRED: TFloatField
      DisplayLabel = 'Parcela em valor a excluir da base de c'#225'lculo'
      FieldName = 'PARC_OPER_NAO_BC_CRED'
      DisplayFormat = '#0.00'
    end
    object cdsAqBemVL_BC_CRED: TFloatField
      Tag = 2
      DisplayLabel = 'Valor da Base de C'#225'lculo do Cr'#233'dito sobre o Bem'
      FieldName = 'VL_BC_CRED'
      DisplayFormat = '#0.00'
    end
    object cdsAqBemIND_NR_PARC: TSmallintField
      DisplayLabel = 'Indicador do N'#250'mero de Parcelas'
      FieldName = 'IND_NR_PARC'
    end
    object cdsAqBemQTDE_PARCELAS: TSmallintField
      DisplayLabel = 'Qtde de Parcelas'
      FieldName = 'QTDE_PARCELAS'
    end
    object cdsAqBemDATA_INICIAL: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data inicial da apropria'#231#227'o'
      FieldName = 'DATA_INICIAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAqBemDATA_FINAL: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data final da apropria'#231#227'o'
      FieldName = 'DATA_FINAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAqBemDATA_LANC: TDateTimeField
      DisplayLabel = 'Data de Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAqBemCST_PIS: TStringField
      Tag = 2
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsAqBemVL_BC_PIS: TFloatField
      DisplayLabel = 'Base PIS'
      FieldName = 'VL_BC_PIS'
      DisplayFormat = '#0.00'
    end
    object cdsAqBemALIQ_PIS: TFloatField
      DisplayLabel = 'Aliquota PIS'
      FieldName = 'ALIQ_PIS'
    end
    object cdsAqBemVL_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VL_PIS'
      DisplayFormat = '#0.00'
    end
    object cdsAqBemCST_COFINS: TStringField
      Tag = 2
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsAqBemVL_BC_COFINS: TFloatField
      DisplayLabel = 'Base COFINS'
      FieldName = 'VL_BC_COFINS'
      DisplayFormat = '#0.00'
    end
    object cdsAqBemALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
    end
    object cdsAqBemVL_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VL_COFINS'
      DisplayFormat = '#0.00'
    end
    object cdsAqBemCOD_CTA: TStringField
      DisplayLabel = 'C'#243'digo Conta Cont'#225'bil'
      FieldName = 'COD_CTA'
      Size = 60
    end
    object cdsAqBemCOD_CCUS: TStringField
      DisplayLabel = 'C'#243'digo Centro de Custos'
      FieldName = 'COD_CCUS'
      Size = 60
    end
    object cdsAqBemDESC_BEM_IMOB: TMemoField
      DisplayLabel = 'Descri'#231#227'o complementar do bem ou grupo de bens'
      FieldName = 'DESC_BEM_IMOB'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAqBemPROCESSOS_REF: TMemoField
      DisplayLabel = 'Processos referenciados'
      FieldName = 'PROCESSOS_REF'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAqBemCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAqBemATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsAqBem: TDataSource
    AutoEdit = False
    DataSet = cdsAqBem
    Left = 461
    Top = 208
  end
  object qrEstAb: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_ESTOQUE_ABERTURA'
      'where cod_estoque = 0 and cod_empresa = 0')
    Left = 541
    Top = 64
  end
  object dspEstAb: TDataSetProvider
    DataSet = qrEstAb
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 541
    Top = 112
  end
  object dsEstAb: TDataSource
    AutoEdit = False
    DataSet = cdsEstAb
    Left = 541
    Top = 208
  end
  object cdsEstAb: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEstAb'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 541
    Top = 160
    object cdsEstAbCOD_ESTOQUE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_ESTOQUE'
      Required = True
    end
    object cdsEstAbDESC_EST: TStringField
      DisplayLabel = 'Descri'#231#227'o do estoque'
      FieldName = 'DESC_EST'
      Size = 100
    end
    object cdsEstAbVL_TOT_EST: TFloatField
      DisplayLabel = 'Valor Total Estoque Abertura'
      FieldName = 'VL_TOT_EST'
      DisplayFormat = '#0.00'
    end
    object cdsEstAbEST_IMP: TFloatField
      DisplayLabel = 'Parcela sem direito a Cr'#233'dito'
      FieldName = 'EST_IMP'
      DisplayFormat = '#0.00'
    end
    object cdsEstAbVL_BC_EST: TFloatField
      DisplayLabel = 'Valor da Base de C'#225'lculo do Cr'#233'ditol'#237'quida'
      FieldName = 'VL_BC_EST'
      DisplayFormat = '#0.00'
    end
    object cdsEstAbVL_BC_MEN_EST: TFloatField
      DisplayLabel = 'Valor da Base de C'#225'lculo Mensal'
      FieldName = 'VL_BC_MEN_EST'
      DisplayFormat = '#0.00'
    end
    object cdsEstAbDATA_INICIAL: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data inicial da apropria'#231#227'o'
      FieldName = 'DATA_INICIAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEstAbDATA_FINAL: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data final da apropria'#231#227'o'
      FieldName = 'DATA_FINAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEstAbDATA_LANC: TDateTimeField
      DisplayLabel = 'Data de Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEstAbCST_PIS: TStringField
      Tag = 2
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsEstAbALIQ_PIS: TFloatField
      DisplayLabel = 'Aliquota PIS'
      FieldName = 'ALIQ_PIS'
    end
    object cdsEstAbVL_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VL_PIS'
      DisplayFormat = '#0.00'
    end
    object cdsEstAbCST_COFINS: TStringField
      Tag = 2
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsEstAbALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
    end
    object cdsEstAbVL_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VL_COFINS'
      DisplayFormat = '#0.00'
    end
    object cdsEstAbCOD_CTA: TStringField
      DisplayLabel = 'C'#243'digo Conta Cont'#225'bil'
      FieldName = 'COD_CTA'
      Size = 60
    end
    object cdsEstAbCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEstAbNAT_BC_CRED: TStringField
      Tag = 2
      DisplayLabel = 'Natureza Base C'#225'lculo Cr'#233'dito'
      FieldName = 'NAT_BC_CRED'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsEstAbATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrLancF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_LANCAMENTO_FISCAL'
      'where cod_obs = 0')
    Left = 621
    Top = 64
  end
  object dspLancF: TDataSetProvider
    DataSet = qrLancF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 621
    Top = 112
  end
  object dsLancF: TDataSource
    AutoEdit = False
    DataSet = cdsLancF
    Left = 621
    Top = 208
  end
  object cdsLancF: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLancF'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 621
    Top = 160
    object cdsLancFCOD_OBS: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_OBS'
      Required = True
    end
    object cdsLancFCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLancFTXT: TStringField
      Tag = 2
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'TXT'
      Size = 255
    end
    object cdsLancFCOD_PADRAO_AJUSTE: TStringField
      DisplayLabel = 'C'#243'digo Padr'#227'o de Ajustes'
      FieldName = 'COD_PADRAO_AJUSTE'
      Size = 10
    end
  end
  object qrICMInterAJ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_F_ICMINTER_AJ'
      'where seqid = 0 and cod_empresa = 0')
    Left = 29
    Top = 280
  end
  object dspICMInterAJ: TDataSetProvider
    DataSet = qrICMInterAJ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 328
  end
  object dsICMInterAJ: TDataSource
    AutoEdit = False
    DataSet = cdsICMInterAJ
    Left = 29
    Top = 424
  end
  object cdsICMInterAJ: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspICMInterAJ'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 29
    Top = 376
    object cdsICMInterAJSEQID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsICMInterAJCOD_AJ_APUR: TStringField
      DisplayLabel = 'Codigo Ajuste'
      FieldName = 'COD_AJ_APUR'
      Size = 8
    end
    object cdsICMInterAJUF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'UF'
      Size = 2
    end
    object cdsICMInterAJVL_AJ_APUR: TFloatField
      DisplayLabel = 'Valor do ajuste'
      FieldName = 'VL_AJ_APUR'
      DisplayFormat = '##0.00'
    end
    object cdsICMInterAJDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Apuracao'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsICMInterAJDATA_CAD: TDateTimeField
      DisplayLabel = 'Data cadastro'
      FieldName = 'DATA_CAD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsICMInterAJDESCR_COMPL_AJ: TStringField
      DisplayLabel = 'Descricao complementar do ajuste'
      FieldName = 'DESCR_COMPL_AJ'
      Size = 256
    end
    object cdsICMInterAJCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object qrICMInterAJ_Inf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_F_ICMINTER_AJ_INF_AD'
      'where seqid = 0 and cod_empresa = 0 and seqid_aj = 0')
    Left = 125
    Top = 280
  end
  object dspICMInterAJ_Inf: TDataSetProvider
    DataSet = qrICMInterAJ_Inf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 125
    Top = 328
  end
  object dsICMInterAJ_Inf: TDataSource
    AutoEdit = False
    DataSet = cdsICMInterAJ_Inf
    Left = 125
    Top = 424
  end
  object cdsICMInterAJ_Inf: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspICMInterAJ_Inf'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 125
    Top = 376
    object cdsICMInterAJ_InfSEQID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsICMInterAJ_InfCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsICMInterAJ_InfSEQID_AJ: TIntegerField
      Tag = 2
      DisplayLabel = 'ID AJ'
      FieldName = 'SEQID_AJ'
      Required = True
    end
    object cdsICMInterAJ_InfNUM_DA: TStringField
      DisplayLabel = 'Num Doc Arreacadacao'
      FieldName = 'NUM_DA'
      Size = 128
    end
    object cdsICMInterAJ_InfNUM_PROC: TStringField
      DisplayLabel = 'Num Processo'
      FieldName = 'NUM_PROC'
      Size = 15
    end
    object cdsICMInterAJ_InfIND_PROC: TSmallintField
      DisplayLabel = 'Ind Origem Processo'
      FieldName = 'IND_PROC'
    end
    object cdsICMInterAJ_InfPROC: TMemoField
      DisplayLabel = 'Descricao resumida do processo'
      FieldName = 'PROC'
      BlobType = ftMemo
      Size = 8
    end
    object cdsICMInterAJ_InfTXT_COMPL: TMemoField
      DisplayLabel = 'Descricao complementar'
      FieldName = 'TXT_COMPL'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsICMInterAJ_DocV: TDataSource
    AutoEdit = False
    DataSet = cdsICMInterAJ_DocV
    Left = 229
    Top = 424
  end
  object cdsICMInterAJ_DocV: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    Left = 229
    Top = 376
    object cdsICMInterAJ_DocVNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsICMInterAJ_DocVVL_AJ_ITEM: TFloatField
      DisplayLabel = 'Valor Ajuste'
      FieldName = 'VL_AJ_ITEM'
      DisplayFormat = '##0.00'
    end
    object cdsICMInterAJ_DocVDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Doc'
      FieldName = 'DATA_LANC'
    end
    object cdsICMInterAJ_DocVNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsICMInterAJ_DocVRAZAO: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsICMInterAJ_DocVMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsICMInterAJ_DocVSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsICMInterAJ_DocVSUBSERIE: TStringField
      DisplayLabel = 'Subserie'
      FieldName = 'SUBSERIE'
      Size = 5
    end
    object cdsICMInterAJ_DocVCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsICMInterAJ_DocVCHAVE_NFE: TStringField
      DisplayLabel = 'Chave'
      FieldName = 'CHAVE_NFE'
      Size = 60
    end
    object cdsICMInterAJ_DocVNITEM_NF: TIntegerField
      DisplayLabel = 'N Item'
      FieldName = 'NITEM_NF'
      LookupDataSet = cdsAcaoJud
    end
    object cdsICMInterAJ_DocVTIPO_ITEM: TStringField
      DisplayLabel = 'Tp It'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsICMInterAJ_DocVNUM_FAB_PROD: TStringField
      DisplayLabel = 'Codigo Item'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsICMInterAJ_DocVDESCRICAO_ITEM: TStringField
      DisplayLabel = 'Descricao Item'
      FieldName = 'DESCRICAO_ITEM'
      Size = 75
    end
    object cdsICMInterAJ_DocVCOD_NF: TIntegerField
      DisplayLabel = 'CodNf'
      FieldName = 'COD_NF'
    end
    object cdsICMInterAJ_DocVSEQID: TIntegerField
      FieldName = 'SEQID'
    end
  end
  object qrICMInterAJ_Doc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_F_ICMINTER_AJ_INF_DOC'
      'where seqid = 0 and cod_empresa = 0 and seqid_aj = 0')
    Left = 333
    Top = 280
  end
  object dspICMInterAJ_Doc: TDataSetProvider
    DataSet = qrICMInterAJ_Doc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 333
    Top = 328
  end
  object dsICMInterAJ_Doc: TDataSource
    AutoEdit = False
    DataSet = cdsICMInterAJ_Doc
    Left = 333
    Top = 424
  end
  object cdsICMInterAJ_Doc: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspICMInterAJ_Doc'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 333
    Top = 376
    object cdsICMInterAJ_DocSEQID: TIntegerField
      FieldName = 'SEQID'
      Required = True
    end
    object cdsICMInterAJ_DocCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsICMInterAJ_DocSEQID_AJ: TIntegerField
      FieldName = 'SEQID_AJ'
      Required = True
    end
    object cdsICMInterAJ_DocCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object cdsICMInterAJ_DocNITEM_NF: TIntegerField
      FieldName = 'NITEM_NF'
    end
    object cdsICMInterAJ_DocVL_AJ_ITEM: TFloatField
      FieldName = 'VL_AJ_ITEM'
    end
  end
  object qrICMInterOb: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_F_ICMINTER_OB_DIFAL'
      'where seqid = 0 and cod_empresa = 0')
    Left = 429
    Top = 280
  end
  object dspICMInterOb: TDataSetProvider
    DataSet = qrICMInterOb
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 429
    Top = 328
  end
  object dsICMInterOb: TDataSource
    AutoEdit = False
    DataSet = cdsICMInterOb
    Left = 429
    Top = 424
  end
  object cdsICMInterOb: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspICMInterOb'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 429
    Top = 376
    object cdsICMInterObSEQID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsICMInterObUF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'UF'
      Size = 2
    end
    object cdsICMInterObCOD_OR: TStringField
      DisplayLabel = 'Codigo da obrigacao'
      FieldName = 'COD_OR'
      Size = 3
    end
    object cdsICMInterObVL_OR: TFloatField
      DisplayLabel = 'Valor da obrigacao'
      FieldName = 'VL_OR'
      DisplayFormat = '##0.00'
    end
    object cdsICMInterObDT_VCTO: TDateTimeField
      DisplayLabel = 'Data vencimento'
      FieldName = 'DT_VCTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsICMInterObCOD_REC: TStringField
      DisplayLabel = 'Codigo da receita'
      FieldName = 'COD_REC'
      Size = 128
    end
    object cdsICMInterObNUM_PROC: TStringField
      DisplayLabel = 'Num Processo'
      FieldName = 'NUM_PROC'
      Size = 15
    end
    object cdsICMInterObIND_PROC: TSmallintField
      DisplayLabel = 'Ind Origem Processo'
      FieldName = 'IND_PROC'
    end
    object cdsICMInterObPROC: TMemoField
      DisplayLabel = 'Descricao resumida do processo'
      FieldName = 'PROC'
      BlobType = ftMemo
      Size = 8
    end
    object cdsICMInterObTXT_COMPL: TMemoField
      DisplayLabel = 'Descricao complementar'
      FieldName = 'TXT_COMPL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsICMInterObANO_REF: TSmallintField
      DisplayLabel = 'Ano referencia'
      FieldName = 'ANO_REF'
    end
    object cdsICMInterObMES_REF: TSmallintField
      DisplayLabel = 'Mes referencia'
      FieldName = 'MES_REF'
    end
    object cdsICMInterObDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Apuracao'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsICMInterObDATA_CAD: TDateTimeField
      DisplayLabel = 'Data cadastro'
      FieldName = 'DATA_CAD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsICMInterObCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsICMInterObCOD_NF: TIntegerField
      DisplayLabel = 'Cod Nf'
      FieldName = 'COD_NF'
    end
    object cdsICMInterObTPOB: TStringField
      DisplayLabel = 'DIFAL/FCP'
      FieldName = 'TPOB'
      Size = 5
    end
  end
  object qrManutInv: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select i7.data_inv, i7.cod_empresa, i7.grupo_prod, i7.cod_prod, ' +
        'pr.num_fab_prod, pr.nbm ncm,'
      
        'pr.descr_prod, i7.quantidade, i7.valor_prod, (i7.quantidade * i7' +
        '.valor_prod) custo_total,'
      ' i7s.tp_arq_fiscal, i7s.h020_cst,'
      'i7s.h020_bc_icms, i7s.h020_vl_icms from inv_tipo74 i7'
      
        'inner join produtos pr on pr.grupo_prod = i7.grupo_prod and pr.c' +
        'od_prod = i7.cod_prod and pr.cod_empresa = i7.cod_empresa'
      
        'left join inv_tipo74_sped_sint i7s on i7s.data_inv = i7.data_inv' +
        ' and i7s.cod_empresa = i7.cod_empresa and i7s.grupo_prod = i7.gr' +
        'upo_prod and i7s.cod_prod = i7.cod_prod'
      
        'where i7.data_inv = 0 and i7.cod_empresa = 0 and i7.grupo_prod =' +
        ' 0 and i7.cod_prod = '#39#39)
    Left = 509
    Top = 280
  end
  object dspManutInv: TDataSetProvider
    DataSet = qrManutInv
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 509
    Top = 328
  end
  object dsManutInv: TDataSource
    AutoEdit = False
    DataSet = cdsManutInv
    Left = 509
    Top = 424
  end
  object cdsManutInv: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspManutInv'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 509
    Top = 376
    object cdsManutInvDATA_INV: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_INV'
      Required = True
    end
    object cdsManutInvCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsManutInvGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsManutInvCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 14
    end
    object cdsManutInvNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsManutInvDESCR_PROD: TStringField
      DisplayLabel = 'Descricao mercadoria'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsManutInvQUANTIDADE: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,##0.0000'
    end
    object cdsManutInvVALOR_PROD: TFloatField
      DisplayLabel = 'Custo Unit'
      FieldName = 'VALOR_PROD'
      DisplayFormat = '###,###,##0.0000'
    end
    object cdsManutInvCUSTO_TOTAL: TFloatField
      DisplayLabel = 'Custo Total'
      FieldName = 'CUSTO_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsManutInvTP_ARQ_FISCAL: TStringField
      DisplayLabel = 'Tipos Arquivos'
      FieldName = 'TP_ARQ_FISCAL'
      Size = 32
    end
    object cdsManutInvNCM: TStringField
      FieldName = 'NCM'
      FixedChar = True
      Size = 8
    end
    object cdsManutInvH020_CST: TStringField
      DisplayLabel = 'CST ICMS'
      FieldName = 'H020_CST'
      FixedChar = True
      Size = 3
    end
    object cdsManutInvH020_BC_ICMS: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'H020_BC_ICMS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsManutInvH020_VL_ICMS: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'H020_VL_ICMS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsManutInvSEL: TStringField
      DisplayLabel = '..'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
end
