object dtmNF: TdtmNF
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 589
  Width = 2092
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 1
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 116
    Top = 1
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
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 185
    Top = 1
  end
  object qrServTransporte: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SERVICO_TRANSPORTE')
    Left = 40
    Top = 272
  end
  object dspServTransporte: TDataSetProvider
    DataSet = qrServTransporte
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 40
    Top = 320
  end
  object cdsServTransporte: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspServTransporte'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 40
    Top = 368
    object cdsServTransporteTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServTransportenome_tr: TStringField
      DisplayLabel = 'Transportador'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'nome_tr'
      LookupDataSet = cdsTransp
      LookupKeyFields = 'CODIGO_TR'
      LookupResultField = 'NOME_TR'
      KeyFields = 'COD_TRANSPORTADOR'
      Size = 60
      Lookup = True
    end
    object cdsServTransporteNUM_DOCUMENTO: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#250'mero Documento'
      FieldName = 'NUM_DOCUMENTO'
    end
    object cdsServTransporteCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object cdsServTransporteVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsServTransporteSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      FixedChar = True
      Size = 4
    end
    object cdsServTransporteSUB_SERIE: TStringField
      DisplayLabel = 'Sub S'#233'rie'
      FieldName = 'SUB_SERIE'
      FixedChar = True
      Size = 3
    end
    object cdsServTransporteMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsServTransporteDATA_EMISSAO: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsServTransporteSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsServTransporteCOD_SERV_TRANSP: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_SERV_TRANSP'
      Required = True
    end
    object cdsServTransporteCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsServTransporteCOD_FORNECEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Fornecedor'
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsServTransporteNUM_NOTA_NFE: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#250'mero Nota Fiscal Entrada'
      FieldName = 'NUM_NOTA_NFE'
    end
    object cdsServTransporteBASE_CALC_ICMS: TFloatField
      DisplayLabel = 'Base C'#225'culo ICMS'
      FieldName = 'BASE_CALC_ICMS'
    end
    object cdsServTransporteVALOR_ICMS: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICMS'
    end
    object cdsServTransporteCIF_FOB_OUTROS: TIntegerField
      DisplayLabel = 'CIF FOB Outros'
      FieldName = 'CIF_FOB_OUTROS'
    end
    object cdsServTransporteOUTRAS: TFloatField
      DisplayLabel = 'Outras'
      FieldName = 'OUTRAS'
    end
    object cdsServTransporteCODIGO_UF: TIntegerField
      DisplayLabel = 'C'#243'digo UF'
      FieldName = 'CODIGO_UF'
    end
    object cdsServTransporteATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsServTransporteCOD_TRANSPORTADOR: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo Transportador'
      FieldName = 'COD_TRANSPORTADOR'
    end
    object cdsServTransporteNOTAS_FISCAIS: TMemoField
      Tag = 1
      DisplayLabel = 'Notas Fiscais'
      FieldName = 'NOTAS_FISCAIS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsServTransporteISENTA_N_TRIBUT: TFloatField
      DisplayLabel = 'Isenta / N'#227'o Tributado'
      FieldName = 'ISENTA_N_TRIBUT'
    end
    object cdsServTransporteCST_ICMS: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_ICMS'
      FixedChar = True
      Size = 3
    end
    object cdsServTransporteALIQ_ICM: TFloatField
      DisplayLabel = 'Aliq ICMS'
      FieldName = 'ALIQ_ICM'
    end
    object cdsServTransporteDATA_LANCAMENTO: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANCAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsServTransporteIND_NAT_FRT: TIntegerField
      DisplayLabel = 'Natureza'
      FieldName = 'IND_NAT_FRT'
    end
    object cdsServTransporteNAT_BC_CRED: TStringField
      DisplayLabel = 'Natureza Base de C'#225'lculo'
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object cdsServTransporteCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Size = 2
    end
    object cdsServTransporteCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object cdsServTransporteALIQ_PIS: TFloatField
      DisplayLabel = 'Aliq PIS'
      FieldName = 'ALIQ_PIS'
      DisplayFormat = '#0.0000'
    end
    object cdsServTransporteALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
      DisplayFormat = '#0.0000'
    end
    object cdsServTransporteBASE_PIS: TFloatField
      DisplayLabel = 'Base PIS'
      FieldName = 'BASE_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsServTransporteBASE_COFINS: TFloatField
      DisplayLabel = 'Base COFINS'
      FieldName = 'BASE_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsServTransporteVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsServTransporteVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsServTransporteCHV_CTE: TStringField
      DisplayLabel = 'Chave CT-e'
      FieldName = 'CHV_CTE'
      Size = 44
    end
    object cdsServTransporteCOD_MUN_ORIG: TIntegerField
      DisplayLabel = 'Cod Cidedade IBGE Origem'
      FieldName = 'COD_MUN_ORIG'
    end
    object cdsServTransporteCOD_MUN_DEST: TIntegerField
      DisplayLabel = 'Cod Cidedade IBGE Destino'
      FieldName = 'COD_MUN_DEST'
    end
    object cdsServTransporteTP_CT_E: TSmallintField
      DisplayLabel = 'Tipo CT-e'
      FieldName = 'TP_CT_E'
    end
    object cdsServTransporteSERVTR_ID: TStringField
      Tag = 1
      FieldName = 'SERVTR_ID'
      Size = 36
    end
  end
  object dsServTransporte: TDataSource
    DataSet = cdsServTransporte
    Left = 40
    Top = 416
  end
  object qrTransp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from TRANSPORTADOR')
    Left = 104
    Top = 272
  end
  object dspTransp: TDataSetProvider
    DataSet = qrTransp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 104
    Top = 320
  end
  object cdsTransp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransp'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 104
    Top = 368
    object cdsTranspCODIGO_TR: TIntegerField
      FieldName = 'CODIGO_TR'
      Required = True
    end
    object cdsTranspNOME_TR: TStringField
      FieldName = 'NOME_TR'
      FixedChar = True
      Size = 60
    end
    object cdsTranspCNPJ_TR: TStringField
      FieldName = 'CNPJ_TR'
      FixedChar = True
      Size = 14
    end
    object cdsTranspEND_TR: TStringField
      FieldName = 'END_TR'
      FixedChar = True
      Size = 40
    end
    object cdsTranspMUNICIPIO_TR: TStringField
      FieldName = 'MUNICIPIO_TR'
      FixedChar = True
      Size = 25
    end
    object cdsTranspUF_TR: TIntegerField
      FieldName = 'UF_TR'
    end
    object cdsTranspIE_TR: TStringField
      FieldName = 'IE_TR'
      FixedChar = True
      Size = 14
    end
  end
  object dsTransp: TDataSource
    DataSet = cdsTransp
    Left = 104
    Top = 416
  end
  object qrNatOP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from NAT_OP')
    Left = 176
    Top = 272
  end
  object dspNatOP: TDataSetProvider
    DataSet = qrNatOP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 176
    Top = 320
  end
  object cdsNatOp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatOP'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 176
    Top = 368
    object cdsNatOpCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsNatOpDESCRICAO_NOP: TStringField
      FieldName = 'DESCRICAO_NOP'
      Size = 100
    end
    object cdsNatOpPRECC: TStringField
      FieldName = 'PRECC'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpCOMIMP: TStringField
      FieldName = 'COMIMP'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpSEM_IMPOSTO: TStringField
      FieldName = 'SEM_IMPOSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpCALC_CUSTO: TStringField
      FieldName = 'CALC_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpALIQ_INT_SAID: TFloatField
      FieldName = 'ALIQ_INT_SAID'
    end
    object cdsNatOpALT_EST: TStringField
      FieldName = 'ALT_EST'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpMOSTRAR_REL_COMPRAS: TStringField
      FieldName = 'MOSTRAR_REL_COMPRAS'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpTIPV_VEICULO: TStringField
      FieldName = 'TIPV_VEICULO'
      FixedChar = True
      Size = 1
    end
  end
  object dsNatOp: TDataSource
    DataSet = cdsNatOp
    Left = 176
    Top = 416
  end
  object qrCNIEE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from IMPRESSORAS_CNIEE')
    Left = 272
    Top = 72
  end
  object dspCNIEE: TDataSetProvider
    DataSet = qrCNIEE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 272
    Top = 120
  end
  object cdsCNIEE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCNIEE'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 272
    Top = 168
    object cdsCNIEEIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCNIEETIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
    end
    object cdsCNIEEMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object cdsCNIEEMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsCNIEEVERSAOSB: TStringField
      FieldName = 'VERSAOSB'
    end
    object cdsCNIEEQTDELACRESEXTSL: TIntegerField
      FieldName = 'QTDELACRESEXTSL'
    end
    object cdsCNIEEQTDELACRESEXTFAB: TIntegerField
      FieldName = 'QTDELACRESEXTFAB'
    end
    object cdsCNIEETEMFD: TStringField
      FieldName = 'TEMFD'
      FixedChar = True
      Size = 1
    end
    object cdsCNIEELACREMFD: TStringField
      FieldName = 'LACREMFD'
      FixedChar = True
      Size = 1
    end
    object cdsCNIEEATO_APROVACAO: TStringField
      FieldName = 'ATO_APROVACAO'
      Size = 30
    end
    object cdsCNIEEATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsCNIEE: TDataSource
    DataSet = cdsCNIEE
    Left = 272
    Top = 216
  end
  object qrNatOpNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      
        'select CODIGO_NOP, DESCRICAO_NOP, PRECC, COMIMP, SEM_IMPOSTO, CA' +
        'LC_CUSTO, ALT_EST, TIPV_VEICULO from NAT_OP')
    Left = 408
    Top = 72
  end
  object dspNatOpNf: TDataSetProvider
    DataSet = qrNatOpNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 408
    Top = 120
  end
  object cdsNatOpNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatOpNf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 408
    Top = 168
    object cdsNatOpNfCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsNatOpNfDESCRICAO_NOP: TStringField
      FieldName = 'DESCRICAO_NOP'
      Size = 100
    end
    object cdsNatOpNfPRECC: TStringField
      FieldName = 'PRECC'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpNfCOMIMP: TStringField
      FieldName = 'COMIMP'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpNfSEM_IMPOSTO: TStringField
      FieldName = 'SEM_IMPOSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpNfCALC_CUSTO: TStringField
      FieldName = 'CALC_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpNfALT_EST: TStringField
      FieldName = 'ALT_EST'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpNfTIPV_VEICULO: TStringField
      FieldName = 'TIPV_VEICULO'
      FixedChar = True
      Size = 1
    end
  end
  object dsNatOpNf: TDataSource
    DataSet = cdsNatOpNf
    Left = 408
    Top = 216
  end
  object qrNcmE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from NCM_ESTADO')
    Left = 472
    Top = 72
  end
  object dspNcmE: TDataSetProvider
    DataSet = qrNcmE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 472
    Top = 120
  end
  object cdsNcmE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNcmE'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 472
    Top = 168
    object cdsNcmECOD_NBM: TStringField
      FieldName = 'COD_NBM'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsNcmECODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsNcmEALIQ_INTER: TFloatField
      FieldName = 'ALIQ_INTER'
    end
    object cdsNcmEALIQ_INTRA: TFloatField
      FieldName = 'ALIQ_INTRA'
    end
    object cdsNcmEMVA_ST_ORIGINAL: TFloatField
      FieldName = 'MVA_ST_ORIGINAL'
    end
    object cdsNcmEMVA_AJUSTADA: TFloatField
      FieldName = 'MVA_AJUSTADA'
    end
  end
  object dsNcmE: TDataSource
    DataSet = cdsNcmE
    Left = 472
    Top = 216
  end
  object qrCodBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from COD_BARRA')
    Left = 536
    Top = 72
  end
  object dspCodBarra: TDataSetProvider
    DataSet = qrCodBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 536
    Top = 120
  end
  object cdsCodBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCodBarra'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 536
    Top = 168
    object cdsCodBarraCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsCodBarraGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCodBarraCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCodBarraCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
  end
  object dsCodBarra: TDataSource
    DataSet = cdsCodBarra
    Left = 536
    Top = 216
  end
  object qrServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'SELECT '
      'COD_SERVICO,'
      'DESC_SERVICO,'
      'VALOR_SERVICO,'
      'SHONDA,'
      'STIPO,'
      'ALIQ_ISS,'
      'CODIGO_NOP,'
      'ISENTO_SERV,'
      'ISENTO_PIS,'
      'N_INCIDENCIA_SERV,'
      'UNIDADE,'
      'CST_PIS,'
      'CST_COFINS,'
      'CST_PIS_ENT,'
      'CST_COFINS_ENT'
      'FROM TIPO_SERVICO')
    Left = 600
    Top = 72
  end
  object dspServ: TDataSetProvider
    DataSet = qrServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 600
    Top = 120
  end
  object cdsServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServ'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 600
    Top = 168
    object cdsServCOD_SERVICO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsServDESC_SERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Servi'#231'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsServVALOR_SERVICO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_SERVICO'
      DisplayFormat = '##0.00'
    end
    object cdsServSHONDA: TStringField
      DisplayLabel = 'M'#227'o de obra Honda'
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object cdsServSTIPO: TStringField
      DisplayLabel = 'Tipo de servi'#231'o'
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object cdsServALIQ_ISS: TFloatField
      DisplayLabel = 'Aliq ISS'
      FieldName = 'ALIQ_ISS'
      DisplayFormat = '##0.00'
    end
    object cdsServCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsServISENTO_SERV: TStringField
      DisplayLabel = 'Isento'
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsServN_INCIDENCIA_SERV: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia'
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsServISENTO_PIS: TStringField
      DisplayLabel = 'Isento PIS/COFINS'
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsServUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsServCST_PIS: TStringField
      DisplayLabel = 'CST PIS Saida'
      FieldName = 'CST_PIS'
      Size = 2
    end
    object cdsServCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS Saida'
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object cdsServCST_PIS_ENT: TStringField
      DisplayLabel = 'CST PIS Entrada'
      FieldName = 'CST_PIS_ENT'
      Size = 2
    end
    object cdsServCST_COFINS_ENT: TStringField
      DisplayLabel = 'CST COFINS Entrada'
      FieldName = 'CST_COFINS_ENT'
      Size = 2
    end
    object cdsServCNBS: TStringField
      DisplayLabel = 'NBS'
      FieldName = 'CNBS'
      Size = 9
    end
  end
  object dsServ: TDataSource
    DataSet = cdsServ
    Left = 600
    Top = 216
  end
  object qrCol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select '
      'COD_VENDEDOR, '
      'NOME_VENDEDOR '
      'from COLABORADOR')
    Left = 656
    Top = 72
  end
  object dspCol: TDataSetProvider
    DataSet = qrCol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 656
    Top = 120
  end
  object cdsCol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCol'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 656
    Top = 168
    object cdsColCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsCol: TDataSource
    DataSet = cdsCol
    Left = 656
    Top = 216
  end
  object qrTranspNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select'
      'tt.codigo_tr,'
      'tt.nome_tr,'
      'tt.cnpj_tr,'
      'tt.ie_tr,'
      'tt.end_tr,'
      'tt.municipio_tr,'
      'tt.codigoantt,'
      'e.sigla_uf,'
      'e.ibge_codigo_uf,'
      'e.nome_uf'
      
        'from transportador tt inner join estados e on e.codigo_uf = tt.u' +
        'f_tr')
    Left = 712
    Top = 72
  end
  object dspTranspNF: TDataSetProvider
    DataSet = qrTranspNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 712
    Top = 120
  end
  object cdsTranspNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTranspNF'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 712
    Top = 168
    object cdsTranspNfCODIGO_TR: TIntegerField
      FieldName = 'CODIGO_TR'
      Required = True
    end
    object cdsTranspNfNOME_TR: TStringField
      FieldName = 'NOME_TR'
      FixedChar = True
      Size = 60
    end
    object cdsTranspNfCNPJ_TR: TStringField
      FieldName = 'CNPJ_TR'
      FixedChar = True
      Size = 14
    end
    object cdsTranspNfIE_TR: TStringField
      FieldName = 'IE_TR'
      FixedChar = True
      Size = 14
    end
    object cdsTranspNfEND_TR: TStringField
      FieldName = 'END_TR'
      FixedChar = True
      Size = 40
    end
    object cdsTranspNfMUNICIPIO_TR: TStringField
      FieldName = 'MUNICIPIO_TR'
      FixedChar = True
      Size = 25
    end
    object cdsTranspNfSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsTranspNfNOME_UF: TStringField
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsTranspNfCODIGOANTT: TStringField
      FieldName = 'CODIGOANTT'
      Size = 21
    end
    object cdsTranspNfIBGE_CODIGO_UF: TIntegerField
      FieldName = 'IBGE_CODIGO_UF'
    end
  end
  object dsTranspNf: TDataSource
    DataSet = cdsTranspNf
    Left = 712
    Top = 216
  end
  object qrCPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      
        'select COD_COND_PAG, DESC_COND_PAG, MAX_DESC, SEQPRECO from COND' +
        '_PAG')
    Left = 776
    Top = 72
  end
  object dspCPag: TDataSetProvider
    DataSet = qrCPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 776
    Top = 120
  end
  object cdsCPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCPag'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 776
    Top = 168
    object cdsCPagCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCPagDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsCPagMAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
    end
    object cdsCPagSEQPRECO: TStringField
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsCPag: TDataSource
    DataSet = cdsCPag
    Left = 776
    Top = 216
  end
  object qrClF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select'
      'cc.cod_cliente,'
      'cc.nome_cliente,'
      'cc.codigo_uf,'
      'cc.razao,'
      'cc.cpfcgc,'
      'cc.insc_est,'
      'cc.endereco,'
      'cc.num_end_cliente,'
      'cc.complemento,'
      'cc.cep,'
      'cc.fone_cliente,'
      'cc.cod_cond_pag,'
      'cc.regime,'
      'cc.insc_municipal,'
      'e.sigla_uf,'
      'e.nome_uf,'
      'e.ibge_codigo_uf,'
      'e.aliq_intra,'
      'em.im_emp,'
      'em.cnae_fiscal,'
      'es.inscricao,'
      'ci.cod_cidade,     '
      'ci.nome_cidade,'
      'ci.ibge_cod_cidade,'
      'cm.natop_ext_c,'
      'cm.icm_ext_c,'
      'cm.NATOP_EXT_NC,'
      'cm.ICM_EXT_NC,'
      'cm.NATOP_INT_NC,'
      'ba.cod_bairro,'
      'ba.nome_bairro,'
      'cc.calcular_st_nf_saida'
      
        'from clientes cc inner join estados e on e.codigo_uf = cc.codigo' +
        '_uf'
      'left join cidades ci on ci.cod_cidade = cc.cod_cidade'
      'left join bairros ba on ba.cod_bairro = cc.cod_bairro'
      'inner join empresa em on em.cod_empresa = cc.cod_empresa'
      
        'left join cfop_mud cm on cm.codigo_uf = em.uf_emp and cm.uf_dest' +
        'ino = cc.codigo_uf'
      
        'left join empresa_substituto es on es.cod_empresa = cc.cod_empre' +
        'sa and e.sigla_uf = es.sigla_uf')
    Left = 840
    Top = 72
  end
  object dspClF: TDataSetProvider
    DataSet = qrClF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 840
    Top = 120
  end
  object cdsClF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClF'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 840
    Top = 168
    object cdsClFCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClFNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClFCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod Estado'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsClFRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsClFCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClFINSC_EST: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsClFENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsClFNUM_END_CLIENTE: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsClFCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsClFCEP: TStringField
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsClFFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsClFSIGLA_UF: TStringField
      DisplayLabel = 'Sigla UF'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsClFNOME_UF: TStringField
      DisplayLabel = 'Nome Estado'
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsClFIBGE_CODIGO_UF: TIntegerField
      DisplayLabel = 'Codigo IBGE UF'
      FieldName = 'IBGE_CODIGO_UF'
    end
    object cdsClFCOD_CIDADE: TIntegerField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsClFNOME_CIDADE: TStringField
      DisplayLabel = 'Nome Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsClFIBGE_COD_CIDADE: TIntegerField
      DisplayLabel = 'Codigo IBGE Cidade'
      FieldName = 'IBGE_COD_CIDADE'
    end
    object cdsClFCOD_BAIRRO: TIntegerField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsClFNOME_BAIRRO: TStringField
      DisplayLabel = 'Nome Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsClFALIQ_INTRA: TFloatField
      DisplayLabel = 'Aliq IntraEstadual'
      FieldName = 'ALIQ_INTRA'
    end
    object cdsClFNATOP_EXT_C: TFloatField
      DisplayLabel = 'Nat OP Externo Contribuinte'
      FieldName = 'NATOP_EXT_C'
    end
    object cdsClFICM_EXT_C: TFloatField
      DisplayLabel = 'Aliq ICMS Ext C'
      FieldName = 'ICM_EXT_C'
    end
    object cdsClFCOD_COND_PAG: TIntegerField
      DisplayLabel = 'C'#243'digo Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsClFREGIME: TStringField
      DisplayLabel = 'Regime Federal'
      FieldName = 'REGIME'
    end
    object cdsClFINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 18
    end
    object cdsClFNATOP_EXT_NC: TFloatField
      FieldName = 'NATOP_EXT_NC'
    end
    object cdsClFICM_EXT_NC: TFloatField
      FieldName = 'ICM_EXT_NC'
    end
    object cdsClFNATOP_INT_NC: TFloatField
      FieldName = 'NATOP_INT_NC'
    end
    object cdsClFIM_EMP: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal da Empresa'
      FieldName = 'IM_EMP'
      Size = 18
    end
    object cdsClFCNAE_FISCAL: TStringField
      DisplayLabel = 'CNAE Fiscal'
      FieldName = 'CNAE_FISCAL'
      Size = 7
    end
    object cdsClFCALCULAR_ST_NF_SAIDA: TStringField
      DisplayLabel = 'Calcular ST Saida'
      FieldName = 'CALCULAR_ST_NF_SAIDA'
      FixedChar = True
      Size = 1
    end
    object cdsClFINSC_MUNICIPAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'INSC_MUNICIPAL'
      Size = 15
    end
    object cdsClFCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object cdsClFNFE_IDESTRANGEIRO: TStringField
      FieldName = 'NFE_IDESTRANGEIRO'
    end
    object cdsClFNFE_INDIEDEST: TSmallintField
      FieldName = 'NFE_INDIEDEST'
    end
    object cdsClFPFCP: TFloatField
      FieldName = 'PFCP'
    end
    object cdsClFFINALIDADEID: TIntegerField
      FieldName = 'FINALIDADEID'
    end
    object cdsClFRET_FED: TSmallintField
      FieldName = 'RET_FED'
    end
  end
  object dsClF: TDataSource
    DataSet = cdsClF
    Left = 840
    Top = 216
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select '
      'GRUPO_PROD, '
      'COD_PROD, '
      'CODIGO_NOP, '
      'PREC_CUS_PROD, '
      'PREC_TAB_PROD, '
      'DESCR_PROD, '
      'IPI_PROD, '
      'ICM_PROD, '
      'PERC_TB_PROD, '
      'PERC_TB_PRODA, '
      'NUM_FAB_PROD, '
      'PREC_30_PROD, '
      'PREC_60_PROD, '
      'PREC_90_PROD, '
      'EST_F, '
      'EST_R,'
      'MARCA_P, '
      'PERC_RED_PROD, '
      'ISENTO_PROD, '
      'N_INCIDENCIA_PROD, '
      'UNIDADE, '
      'CST_PROD, '
      'PREC_PUBLICO, '
      'PREC_CUSR_PROD, '
      'ISENTO_PIS, '
      'PREC_CUS_MNF, '
      'EMB_PROD, '
      'PERC_SUBSTTR, '
      'QTDEMB, '
      'BALANCA_PROD, '
      'VALIDADE_PROD, '
      'PREC_CUSR_MNF, '
      'PREC_CUSM_PROD, '
      'PERC_FRETE_PROD, '
      'PREC_CUSMR_PROD, '
      'PERC_TB_ATAC, '
      'PERC_TB_VARE, '
      'ICMANT_SUB, '
      'NBM, '
      'PESO_LIQ_PROD, '
      'PESO_BRUT_PROD, '
      'PERMITIR_DESCONTO, '
      'EM_PROMOCAO, '
      'PRECO_PROMOCAO, '
      'DESCR_PROD_RED, '
      'CONSUMO,'
      'BASEICMANT_SUB,'
      'MARGMINCCUSTOV, '
      'MARGMINCCUSTOA,'
      'ECF,'
      'APLICACAO_PROD,'
      'DAT_CAD_PROD,'
      'CST_IPI,'
      'CFOP_INTER_N_CONT,'
      'CST_PIS, CST_COFINS,'
      'CST_PIS_ENT,'
      'CST_COFINS_ENT,'
      'ALIQ_PIS_DIFERENCIADA,'
      'ALIQ_COFINS_DIFERENCIADA,'
      'PERC_AD_30,'
      'PERC_AD_60,'
      'PERC_AD_90,'
      'MAX_DESC_ITEM,'
      'ALIQ_CRED_PIS, '
      'ALIQ_CRED_COFINS'
      'from PRODUTOS')
    Left = 272
    Top = 272
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 272
    Top = 320
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 272
    Top = 368
    object cdsProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdPREC_CUS_PROD: TFloatField
      FieldName = 'PREC_CUS_PROD'
    end
    object cdsProdPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
    end
    object cdsProdDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdIPI_PROD: TFloatField
      FieldName = 'IPI_PROD'
    end
    object cdsProdICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
    end
    object cdsProdPERC_TB_PROD: TFloatField
      FieldName = 'PERC_TB_PROD'
    end
    object cdsProdNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdPREC_30_PROD: TFloatField
      FieldName = 'PREC_30_PROD'
    end
    object cdsProdPREC_60_PROD: TFloatField
      FieldName = 'PREC_60_PROD'
    end
    object cdsProdPREC_90_PROD: TFloatField
      FieldName = 'PREC_90_PROD'
    end
    object cdsProdMARCA_P: TStringField
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 10
    end
    object cdsProdPERC_RED_PROD: TFloatField
      FieldName = 'PERC_RED_PROD'
    end
    object cdsProdISENTO_PROD: TStringField
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdN_INCIDENCIA_PROD: TStringField
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProdCST_PROD: TStringField
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsProdPREC_PUBLICO: TFloatField
      FieldName = 'PREC_PUBLICO'
    end
    object cdsProdPREC_CUSR_PROD: TFloatField
      FieldName = 'PREC_CUSR_PROD'
    end
    object cdsProdISENTO_PIS: TStringField
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsProdPREC_CUS_MNF: TFloatField
      FieldName = 'PREC_CUS_MNF'
    end
    object cdsProdEMB_PROD: TStringField
      FieldName = 'EMB_PROD'
      FixedChar = True
      Size = 10
    end
    object cdsProdPERC_SUBSTTR: TFloatField
      FieldName = 'PERC_SUBSTTR'
    end
    object cdsProdQTDEMB: TFloatField
      FieldName = 'QTDEMB'
    end
    object cdsProdBALANCA_PROD: TStringField
      FieldName = 'BALANCA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdVALIDADE_PROD: TStringField
      FieldName = 'VALIDADE_PROD'
      FixedChar = True
      Size = 2
    end
    object cdsProdPREC_CUSR_MNF: TFloatField
      FieldName = 'PREC_CUSR_MNF'
    end
    object cdsProdPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsProdPERC_FRETE_PROD: TFloatField
      FieldName = 'PERC_FRETE_PROD'
    end
    object cdsProdPREC_CUSMR_PROD: TFloatField
      FieldName = 'PREC_CUSMR_PROD'
    end
    object cdsProdPERC_TB_ATAC: TFloatField
      FieldName = 'PERC_TB_ATAC'
    end
    object cdsProdPERC_TB_VARE: TFloatField
      FieldName = 'PERC_TB_VARE'
    end
    object cdsProdICMANT_SUB: TFloatField
      FieldName = 'ICMANT_SUB'
    end
    object cdsProdNBM: TStringField
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsProdPESO_LIQ_PROD: TFloatField
      FieldName = 'PESO_LIQ_PROD'
    end
    object cdsProdPESO_BRUT_PROD: TFloatField
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsProdPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdEM_PROMOCAO: TStringField
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object cdsProdDESCR_PROD_RED: TStringField
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsProdCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProdBASEICMANT_SUB: TFloatField
      FieldName = 'BASEICMANT_SUB'
    end
    object cdsProdPERC_TB_PRODA: TFloatField
      FieldName = 'PERC_TB_PRODA'
    end
    object cdsProdEST_F: TFloatField
      FieldName = 'EST_F'
    end
    object cdsProdEST_R: TFloatField
      FieldName = 'EST_R'
    end
    object cdsProdMARGMINCCUSTOV: TFloatField
      FieldName = 'MARGMINCCUSTOV'
    end
    object cdsProdMARGMINCCUSTOA: TFloatField
      FieldName = 'MARGMINCCUSTOA'
    end
    object cdsProdECF: TStringField
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsProdAPLICACAO_PROD: TStringField
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
    object cdsProdDAT_CAD_PROD: TDateTimeField
      FieldName = 'DAT_CAD_PROD'
    end
    object cdsProdCST_IPI: TStringField
      DisplayLabel = 'CST IPI'
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 2
    end
    object cdsProdCFOP_INTER_N_CONT: TFloatField
      FieldName = 'CFOP_INTER_N_CONT'
    end
    object cdsProdCST_PIS: TStringField
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsProdCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsProdCST_PIS_ENT: TStringField
      FieldName = 'CST_PIS_ENT'
      FixedChar = True
      Size = 2
    end
    object cdsProdCST_COFINS_ENT: TStringField
      FieldName = 'CST_COFINS_ENT'
      FixedChar = True
      Size = 2
    end
    object cdsProdALIQ_PIS_DIFERENCIADA: TFloatField
      FieldName = 'ALIQ_PIS_DIFERENCIADA'
    end
    object cdsProdALIQ_COFINS_DIFERENCIADA: TFloatField
      FieldName = 'ALIQ_COFINS_DIFERENCIADA'
    end
    object cdsProdPERC_AD_30: TFloatField
      FieldName = 'PERC_AD_30'
    end
    object cdsProdPERC_AD_60: TFloatField
      FieldName = 'PERC_AD_60'
    end
    object cdsProdPERC_AD_90: TFloatField
      FieldName = 'PERC_AD_90'
    end
    object cdsProdPDESC_PR30_VAREJO: TFloatField
      FieldName = 'PDESC_PR30_VAREJO'
    end
    object cdsProdMAX_DESC_ITEM: TFloatField
      FieldName = 'MAX_DESC_ITEM'
    end
    object cdsProdPERC_TB_PROD3: TFloatField
      FieldName = 'PERC_TB_PROD3'
    end
    object cdsProdPERC_TB_PROD6: TFloatField
      FieldName = 'PERC_TB_PROD6'
    end
    object cdsProdPERC_TB_PROD9: TFloatField
      FieldName = 'PERC_TB_PROD9'
    end
    object cdsProdALIQ_CRED_PIS: TFloatField
      FieldName = 'ALIQ_CRED_PIS'
    end
    object cdsProdALIQ_CRED_COFINS: TFloatField
      FieldName = 'ALIQ_CRED_COFINS'
    end
    object cdsProdCOMB_CPRODANP: TStringField
      FieldName = 'COMB_CPRODANP'
      Size = 9
    end
    object cdsProdCOMB_CODIF: TStringField
      FieldName = 'COMB_CODIF'
      Size = 21
    end
    object cdsProdNFCI: TStringField
      FieldName = 'NFCI'
      Size = 36
    end
    object cdsProdNFE_NRECOPI: TStringField
      FieldName = 'NFE_NRECOPI'
    end
    object cdsProdCOMB_PMIXGN: TFloatField
      FieldName = 'COMB_PMIXGN'
    end
    object cdsProdCENQ_IPI_NFE: TStringField
      FieldName = 'CENQ_IPI_NFE'
      Size = 3
    end
    object cdsProdCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object cdsProdCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsProdDESCRICAO: TStringField
      DisplayLabel = 'Grade'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsProdDESCRICAO1: TStringField
      DisplayLabel = 'Grade'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsProdCOMB_DESCANP: TStringField
      FieldName = 'COMB_DESCANP'
      Size = 95
    end
    object cdsProdCOMB_PGLP: TFloatField
      FieldName = 'COMB_PGLP'
    end
    object cdsProdCOMB_PGNN: TFloatField
      FieldName = 'COMB_PGNN'
    end
    object cdsProdCOMB_PGNI: TFloatField
      FieldName = 'COMB_PGNI'
    end
    object cdsProdCOMB_VPART: TFloatField
      FieldName = 'COMB_VPART'
    end
    object cdsProdFCP_ALIQ: TFloatField
      FieldName = 'FCP_ALIQ'
    end
    object cdsProdFCP_VBCFCPSTRET: TFloatField
      FieldName = 'FCP_VBCFCPSTRET'
    end
    object cdsProdFCP_PFCPSTRET: TFloatField
      FieldName = 'FCP_PFCPSTRET'
    end
    object cdsProdFCP_VFCPSTRET: TFloatField
      FieldName = 'FCP_VFCPSTRET'
    end
    object cdsProdNFE_INDESCALA: TStringField
      FieldName = 'NFE_INDESCALA'
      Size = 1
    end
    object cdsProdNFE_CNPJFAB: TStringField
      FieldName = 'NFE_CNPJFAB'
      Size = 14
    end
    object cdsProdNFE_UTRIB: TStringField
      DisplayLabel = 'Unid trib(NFe)'
      FieldName = 'NFE_UTRIB'
      Size = 6
    end
    object cdsProdNFE_QTRIB: TFloatField
      DisplayLabel = 'Qtde trib(NFe)'
      FieldName = 'NFE_QTRIB'
    end
    object cdsProdANT_PST: TFloatField
      FieldName = 'ANT_PST'
    end
    object cdsProdANT_VICMSSUBSTITUTO: TFloatField
      FieldName = 'ANT_VICMSSUBSTITUTO'
    end
    object cdsProdCEST_VARIANTE_ID: TIntegerField
      FieldName = 'CEST_VARIANTE_ID'
    end
    object cdsProdCFOP_NFCE: TSmallintField
      DisplayLabel = 'CFOP Consumo Final'
      FieldName = 'CFOP_NFCE'
    end
  end
  object dsProd: TDataSource
    DataSet = cdsProd
    Left = 272
    Top = 416
  end
  object qrSelectProd: TIBQuery
    SQL.Strings = (
      'select '
      'GRUPO_PROD, '
      'COD_PROD, '
      'COD_EMPRESA, '
      'CODIGO_NOP, '
      'SUB_G_PROD, '
      'EST_F, '
      'EST_R, '
      'PREC_CUS_PROD, '
      'PREC_TAB_PROD, '
      'LOCACAO_PROD, '
      'LOCACAO_PROD_1, '
      'APLICACAO_PROD, '
      'DATA_ULT_COMPRA, '
      'VL_ULT_COMPRA, '
      'N_CRI_PROD, '
      'N_MIN_PROD, '
      'N_MAX_PROD, '
      'PREC_REP_PROD, '
      'CLASSE_PROD, '
      'QUANT_PED_PROD, '
      'QUANT_TR_PROD, '
      'DESCR_PROD, '
      'IPI_PROD, '
      'NUM_NF_REC, '
      'QUANT_RET_PROD, '
      'ICM_PROD, '
      'QREQ_PROD, '
      'QCONF_PROD, '
      'PERC_TB_PROD, '
      'NUM_FAB_PROD, '
      'PREC_30_PROD, '
      'PREC_60_PROD, '
      'PREC_90_PROD, '
      'MARCA_P, '
      'ALT_COD_CUPOM, '
      'PERC_RED_PROD, '
      'COD_CUST_PROD, '
      'COMISSAO_PROD, '
      'ISENTO_PROD, '
      'N_INCIDENCIA_PROD, '
      'QUANT_PROD_BL, '
      'LOCACAO1_BL, '
      'LOCACAO2_BL, '
      'UNIDADE, '
      'PERC_TB_PROD3, '
      'PERC_TB_PROD6, '
      'PERC_TB_PROD9, '
      'ALT_DESC_CUPOM, '
      'CST_PROD, '
      'CLINV, '
      'CLPRECO, '
      'CLPOP, '
      'CLQTV, '
      'CLFRV, '
      'CLATL, '
      'DT_ULT_VND, '
      'DT_ULT_VNDA, '
      'PREC_PUBLICO, '
      'COD_PPS, '
      'DAT_CAD_PROD, '
      'DAT_MOD_PROD, '
      'PREC_CUSR_PROD, '
      'COD_DSGS, '
      'ISENTO_PIS, '
      'ESTC, '
      'ESTS, '
      'ESTM, '
      'PREC_CUS_MNF, '
      'EMB_PROD, '
      'PERC_SUBSTTR, '
      'QTDEMB, '
      'BALANCA_PROD, '
      'VALIDADE_PROD, '
      'PREC_CUSR_MNF, '
      'PREC_CUSM_PROD, '
      'PERC_FRETE_PROD, '
      'PREC_CUSMR_PROD, '
      'ESTSUBSTR, '
      'COMISSAO_PROD_GER, '
      'CUSTO_HONDA, '
      'ALIQ_RED_PROD, '
      'TIP_PROD_IND, '
      'PERC_TB_ATAC, '
      'PERC_TB_VARE, '
      'ICMANT_SUB, '
      'NEC_ACOMP, '
      'DIAS_ACOMP, '
      'NBM, '
      'PERC_AD_30, '
      'PERC_AD_60, '
      'PERC_AD_90, '
      'DATA_MOD_PR, '
      'ATIVO, '
      'PESO_LIQ_PROD, '
      'PESO_BRUT_PROD, '
      'LOC_DEP, '
      'COD_MARCA, '
      'TOT_ALIQ, '
      'DATA_ULT_AJUSTE, '
      'PRECO_AJUSTE, '
      'ALIQ_INTERNA_NFENT, '
      'COD_RECEITA, '
      'PERMITIR_DESCONTO, '
      'ARREDONDAR_TRUNCAR, '
      'EM_PROMOCAO, '
      'PRECO_PROMOCAO, '
      'TIPO_FAB, '
      'CSDECQTDE, '
      'CSDECVLUNT, '
      'DESCR_PROD_RED, '
      'CONSUMO, '
      'BASEICMANT_SUB, '
      'VALORGE, '
      'VALORPME, '
      'QTDPROD_EXCESSO, '
      'QTDDIAS_EXCESSO, '
      'EST_SEGURANCA, '
      'FREQ_PEDIDO, '
      'DMD, '
      'TCUTILIZADO, '
      'MARKUP_PROD'
      'from PRODUTOS')
    Left = 224
    Top = 464
  end
  object qrNcm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from NBM')
    Left = 336
    Top = 272
  end
  object dspNcm: TDataSetProvider
    DataSet = qrNcm
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 336
    Top = 320
  end
  object cdsNcm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNcm'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 336
    Top = 368
    object cdsNcmCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 8
    end
    object cdsNcmNOME_NCM: TStringField
      FieldName = 'NOME_NCM'
      Size = 60
    end
    object cdsNcmUSAR_MVA_AJUSTADO: TStringField
      FieldName = 'USAR_MVA_AJUSTADO'
      FixedChar = True
      Size = 1
    end
    object cdsNcmREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 4
    end
  end
  object dsNcm: TDataSource
    DataSet = cdsNcm
    Left = 336
    Top = 416
  end
  object qrNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL')
    Left = 24
    Top = 72
  end
  object dspNf: TDataSetProvider
    DataSet = qrNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 120
  end
  object cdsNf: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 24
    Top = 168
    object cdsNfCOD_NF: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNfNUM_NF: TIntegerField
      Tag = 2
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      Required = True
    end
    object cdsNfNATUREZA_NF: TStringField
      Tag = 2
      DisplayLabel = 'E/S'
      FieldName = 'NATUREZA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNfTIPO_NF: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNfDATA_LANC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfVALOR_TOTAL: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Total NF'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsNfEMISSAO_PROPRIA: TStringField
      DisplayLabel = 'Emissao Propria'
      FieldName = 'EMISSAO_PROPRIA'
      FixedChar = True
      Size = 1
    end
    object cdsNfSTATUS: TStringField
      DisplayLabel = 'Status NF'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsNfSITUACAO_NFE: TStringField
      DisplayLabel = 'Situacao NF-e'
      FieldName = 'SITUACAO_NFE'
      Size = 40
    end
    object cdsNfMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsNfSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsNfCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsNfCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsNfDESC_NATOP: TStringField
      DisplayLabel = 'Descricao CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Size = 60
    end
    object cdsNfCOD_COND_PAG: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsNfCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsNfDATA_CONTABIL: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_CONTABIL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATA_ENT_SAIDA: TDateTimeField
      DisplayLabel = 'Data Entrada/Saida'
      FieldName = 'DATA_ENT_SAIDA'
      EditMask = '!00/00/9999;1;_'
    end
    object cdsNfVALOR_PROD: TFloatField
      DisplayLabel = 'Valor Produtos'
      FieldName = 'VALOR_PROD'
    end
    object cdsNfVALOR_SERV: TFloatField
      DisplayLabel = 'Valor Servi'#231'os'
      FieldName = 'VALOR_SERV'
    end
    object cdsNfALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
    end
    object cdsNfBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
    end
    object cdsNfVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
    end
    object cdsNfVALOR_DESC: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VALOR_DESC'
    end
    object cdsNfVALOR_DESC_P: TFloatField
      DisplayLabel = 'Desc Produtos'
      FieldName = 'VALOR_DESC_P'
    end
    object cdsNfVALOR_DESC_S: TFloatField
      DisplayLabel = 'Desc Servi'#231'os'
      FieldName = 'VALOR_DESC_S'
    end
    object cdsNfALIQ_IRRF: TFloatField
      DisplayLabel = 'IRRF'
      FieldName = 'ALIQ_IRRF'
    end
    object cdsNfALIQ_ISS: TFloatField
      DisplayLabel = '% ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsNfBASE_ISS: TFloatField
      DisplayLabel = 'Base ISS'
      FieldName = 'BASE_ISS'
    end
    object cdsNfVALOR_ISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VALOR_ISS'
    end
    object cdsNfBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
    end
    object cdsNfVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Sub'
      FieldName = 'VALOR_ICMSUB'
    end
    object cdsNfVALOR_FRETE: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALOR_FRETE'
    end
    object cdsNfVALOR_SEGURO: TFloatField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALOR_SEGURO'
    end
    object cdsNfVALOR_OUT_DESP: TFloatField
      DisplayLabel = 'Valor Outras Desp'
      FieldName = 'VALOR_OUT_DESP'
    end
    object cdsNfVALOR_DESP_PF: TFloatField
      DisplayLabel = 'Valor Desp PF'
      FieldName = 'VALOR_DESP_PF'
    end
    object cdsNfBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
    end
    object cdsNfCRT: TStringField
      FieldName = 'CRT'
      FixedChar = True
      Size = 1
    end
    object cdsNfVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
    end
    object cdsNfVALOR_ACRES_FIN: TFloatField
      DisplayLabel = 'Acresc. Finan.'
      FieldName = 'VALOR_ACRES_FIN'
    end
    object cdsNfCODIGO_TR: TIntegerField
      Tag = 1
      DisplayLabel = 'Transportador'
      FieldName = 'CODIGO_TR'
    end
    object cdsNfOBS: TMemoField
      Tag = 3
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfFRETE_BASE_IPI: TStringField
      DisplayLabel = 'Frente Base IPI'
      FieldName = 'FRETE_BASE_IPI'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETE_F_NFE: TStringField
      DisplayLabel = 'Frete Fora NF'
      FieldName = 'FRETE_F_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETE_BASE_ICM: TStringField
      DisplayLabel = 'Frete Base ICMS'
      FieldName = 'FRETE_BASE_ICM'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETECONTA_TR: TStringField
      DisplayLabel = 'Frete p/ Conta'
      FieldName = 'FRETECONTA_TR'
      FixedChar = True
      Size = 1
    end
    object cdsNfPLACA_TR: TStringField
      DisplayLabel = 'Placa Transp'
      FieldName = 'PLACA_TR'
      Size = 7
    end
    object cdsNfUF_PLACA_TR: TStringField
      DisplayLabel = 'UF Placa'
      FieldName = 'UF_PLACA_TR'
      FixedChar = True
      Size = 2
    end
    object cdsNfQTDE_VOLUMES_TR: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'QTDE_VOLUMES_TR'
    end
    object cdsNfESPECIE_TR: TStringField
      DisplayLabel = 'Especie'
      FieldName = 'ESPECIE_TR'
      Size = 15
    end
    object cdsNfMARCA_TR: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_TR'
      Size = 15
    end
    object cdsNfNUMERO_TR: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO_TR'
      Size = 15
    end
    object cdsNfNUM_PED: TIntegerField
      DisplayLabel = 'Num Pedido'
      FieldName = 'NUM_PED'
    end
    object cdsNfANTEC_TRIB: TStringField
      DisplayLabel = 'Antecipacao Tributaria'
      FieldName = 'ANTEC_TRIB'
      FixedChar = True
      Size = 1
    end
    object cdsNfDEVOLUCAO: TStringField
      DisplayLabel = 'Nf de Devolu'#231#227'o'
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 3
    end
    object cdsNfBENEF_FISCAL: TStringField
      DisplayLabel = 'Benef Fiscal'
      FieldName = 'BENEF_FISCAL'
      FixedChar = True
      Size = 1
    end
    object cdsNfCONF_ENT: TStringField
      DisplayLabel = 'Conf Ent'
      FieldName = 'CONF_ENT'
      FixedChar = True
      Size = 1
    end
    object cdsNfTP_NF: TStringField
      Tag = 1
      DisplayLabel = 'Tp NF'
      FieldName = 'TP_NF'
      FixedChar = True
      Size = 1
    end
    object cdsNfDA: TStringField
      FieldName = 'DA'
      FixedChar = True
      Size = 1
    end
    object cdsNfMNF: TStringField
      Tag = 1
      FieldName = 'MNF'
      FixedChar = True
      Size = 1
    end
    object cdsNfNUM_NFEM: TIntegerField
      DisplayLabel = 'Num Nf Emiss'#227'o Pr'#243'pria'
      FieldName = 'NUM_NFEM'
    end
    object cdsNfATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsNfCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_USUARIO'
    end
    object cdsNfNUM_NF_EMT: TIntegerField
      DisplayLabel = 'Num NF Emt'
      FieldName = 'NUM_NF_EMT'
    end
    object cdsNfSERIE_EMT: TStringField
      DisplayLabel = 'Serie Emt'
      FieldName = 'SERIE_EMT'
      Size = 5
    end
    object cdsNfTIPO_DESCONTO: TStringField
      DisplayLabel = 'Desconto Item/Rateio'
      FieldName = 'TIPO_DESCONTO'
      Size = 1
    end
    object cdsNfPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
    end
    object cdsNfPESO_L: TFloatField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESO_L'
    end
    object cdsNfVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
    end
    object cdsNfVALOR_PIS_ST: TFloatField
      DisplayLabel = 'Valor PIS ST'
      FieldName = 'VALOR_PIS_ST'
    end
    object cdsNfVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
    end
    object cdsNfVALOR_COFINS_ST: TFloatField
      DisplayLabel = 'Valor COFINS ST'
      FieldName = 'VALOR_COFINS_ST'
    end
    object cdsNfSUBSERIE: TStringField
      DisplayLabel = 'SubSerie'
      FieldName = 'SUBSERIE'
      Size = 5
    end
    object cdsNfEXTEMPORANEO: TStringField
      DisplayLabel = 'Extemporaneo'
      FieldName = 'EXTEMPORANEO'
      FixedChar = True
      Size = 1
    end
    object cdsNfDADOS_INTERESSE_FISCO: TMemoField
      Tag = 3
      DisplayLabel = 'Dados Adicionais (Apenas de Interesse ao Fisco)'
      FieldName = 'DADOS_INTERESSE_FISCO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfDADOS_LANCAMENTO_FISCAL: TMemoField
      Tag = 3
      DisplayLabel = 'Lancamento Fiscal'
      FieldName = 'DADOS_LANCAMENTO_FISCAL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfTIPO_EMISSAO: TStringField
      DisplayLabel = 'Tipo Emissao NF-e'
      FieldName = 'TIPO_EMISSAO'
      FixedChar = True
      Size = 1
    end
    object cdsNfNFE_CMSG: TSmallintField
      DisplayLabel = 'Cod Msg'
      FieldName = 'NFE_CMSG'
    end
    object cdsNfNFE_XMSG: TStringField
      DisplayLabel = 'Mensag. SEFAZ'
      FieldName = 'NFE_XMSG'
      Size = 200
    end
    object cdsNfCOD_NF_REF: TIntegerField
      DisplayLabel = 'Cod NF Ref'
      FieldName = 'COD_NF_REF'
    end
    object cdsNfNUM_NF_COMPL: TIntegerField
      DisplayLabel = 'Num NF Ref'
      FieldName = 'NUM_NF_COMPL'
    end
    object cdsNfSERIE_COMPL: TStringField
      DisplayLabel = 'Serie NF Ref'
      FieldName = 'SERIE_COMPL'
      Size = 5
    end
    object cdsNfHORA_ENT_SAIDA: TTimeField
      DisplayLabel = 'Hora Entrada/Saida'
      FieldName = 'HORA_ENT_SAIDA'
      EditMask = '!90:00:00;1;_'
    end
    object cdsNfNFE_DPEC_CSTAT: TSmallintField
      DisplayLabel = 'NF-e. DPEC. C'#243'digo do status da resposta'
      FieldName = 'NFE_DPEC_CSTAT'
    end
    object cdsNfNFE_DPEC_XMOTIVO: TStringField
      DisplayLabel = 'NF-e. Descri'#231#227'o literal do status da resposta'
      FieldName = 'NFE_DPEC_XMOTIVO'
      Size = 256
    end
    object cdsNfNFE_DPEC_NREGDPEC: TStringField
      DisplayLabel = 'NF-e. Num DPEC'
      FieldName = 'NFE_DPEC_NREGDPEC'
      Size = 17
    end
    object cdsNfNFE_DHCONT: TDateTimeField
      DisplayLabel = 'NF-e. Data e Hora da entrada em contingencia'
      FieldName = 'NFE_DHCONT'
      EditMask = '!99/99/0000 00:00:00;1;_'
    end
    object cdsNfNFE_XJUST: TStringField
      DisplayLabel = 'NF-e. Justificativa da entrada em contingencia'
      FieldName = 'NFE_XJUST'
      Size = 256
    end
    object cdsNfN_COMANDO: TIntegerField
      DisplayLabel = 'Num Comando'
      FieldName = 'N_COMANDO'
    end
    object cdsNfALIQ_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Aliq Simples'
      FieldName = 'ALIQ_ICM_SIMPLES'
    end
    object cdsNfBASE_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Base ICM Simples'
      FieldName = 'BASE_ICM_SIMPLES'
    end
    object cdsNfVALOR_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Valor ICM Simples'
      FieldName = 'VALOR_ICM_SIMPLES'
    end
    object cdsNfINSCRICAO_SUBSTITUTO: TStringField
      DisplayLabel = 'Insc Substituto'
      FieldName = 'INSCRICAO_SUBSTITUTO'
      Size = 18
    end
    object cdsNfCNAE_FISCAL: TStringField
      DisplayLabel = 'CNAE Fiscal'
      FieldName = 'CNAE_FISCAL'
      Size = 7
    end
    object cdsNfIM_EMP: TStringField
      DisplayLabel = 'Insc Municipal'
      FieldName = 'IM_EMP'
      Size = 18
    end
    object cdsNfNUM_GERADO: TStringField
      DisplayLabel = 'Num Ger'
      FieldName = 'NUM_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsNfN_CAIXA: TIntegerField
      DisplayLabel = 'Num Caixa'
      FieldName = 'N_CAIXA'
    end
    object cdsNfCOD_CONS: TStringField
      DisplayLabel = 'Classe Consumo Energia Eletrica'
      FieldName = 'COD_CONS'
      FixedChar = True
      Size = 2
    end
    object cdsNfVL_FORN: TFloatField
      DisplayLabel = 'Valor Fornecido'
      FieldName = 'VL_FORN'
    end
    object cdsNfVL_SERV_NT: TFloatField
      DisplayLabel = 'Valor Serv Nao Trib ICM'
      FieldName = 'VL_SERV_NT'
    end
    object cdsNfVL_TERC: TFloatField
      DisplayLabel = 'Valor Terceiros'
      FieldName = 'VL_TERC'
    end
    object cdsNfLOTE_NFE: TIntegerField
      DisplayLabel = 'Lote NF-e'
      FieldName = 'LOTE_NFE'
    end
    object cdsNfIPI_BASE_ICM: TStringField
      DisplayLabel = 'IPI na Base ICM'
      FieldName = 'IPI_BASE_ICM'
      FixedChar = True
      Size = 1
    end
    object cdsNfCONF_PISCOFINS: TStringField
      DisplayLabel = 'Conf PISCOFINS'
      FieldName = 'CONF_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object cdsNfCOMPLEMENTAR_ENT: TStringField
      DisplayLabel = 'Entrada Complementar'
      FieldName = 'COMPLEMENTAR_ENT'
      FixedChar = True
      Size = 1
    end
    object cdsNfCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNfRESULTADO_ENVIO: TStringField
      DisplayLabel = 'Resultado Envio NF-e'
      FieldName = 'RESULTADO_ENVIO'
      Size = 30
    end
    object cdsNfDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autorizacao NF-e'
      FieldName = 'DATA_AUTORIZACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATAHORA_ENVIO: TDateTimeField
      DisplayLabel = 'Data/Hora Envio NF-e'
      FieldName = 'DATAHORA_ENVIO'
      EditMask = '!99/99/0000 90:00:00;1;_'
    end
    object cdsNfHORA_ENVIO: TStringField
      DisplayLabel = 'Hora Envio NF-e'
      FieldName = 'HORA_ENVIO'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsNfDIGEST: TStringField
      DisplayLabel = 'Digest NF-e'
      FieldName = 'DIGEST'
      Size = 40
    end
    object cdsNfPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo NF-e'
      FieldName = 'PROTOCOLO'
      Size = 40
    end
    object cdsNfCODIGOERRO: TStringField
      DisplayLabel = 'Cod Erro NF-e'
      FieldName = 'CODIGOERRO'
      Size = 10
    end
    object cdsNfDESCRICAOERRO: TStringField
      DisplayLabel = 'Descricao Erro NF-e'
      FieldName = 'DESCRICAOERRO'
      Size = 50
    end
    object cdsNfTEMPORESPOSTA: TSmallintField
      DisplayLabel = 'Tempo Resposta NF-e'
      FieldName = 'TEMPORESPOSTA'
    end
    object cdsNfTIPONFE: TStringField
      DisplayLabel = 'Tipo NF-e'
      FieldName = 'TIPONFE'
      Size = 40
    end
    object cdsNfDANFEIMPRESSO: TStringField
      DisplayLabel = 'Danfe Impresso NF-e'
      FieldName = 'DANFEIMPRESSO'
      Size = 5
    end
    object cdsNfCHAVE_NFE: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHAVE_NFE'
      Size = 60
    end
    object cdsNfSEL_NFE: TIntegerField
      Tag = 1
      FieldName = 'SEL_NFE'
    end
    object cdsNfN_FORM_SEGURANCA: TIntegerField
      DisplayLabel = 'Num Form Seg'
      FieldName = 'N_FORM_SEGURANCA'
    end
    object cdsNfNUM_NF_VNDANT: TIntegerField
      DisplayLabel = 'Num Nf Ant'
      FieldName = 'NUM_NF_VNDANT'
    end
    object cdsNfSUB_SERIEANT: TIntegerField
      DisplayLabel = 'Sub Serie Ant'
      FieldName = 'SUB_SERIEANT'
    end
    object cdsNfJUST_CANCELAMENTO: TStringField
      DisplayLabel = 'Justificativa Cancelamento NF-e'
      FieldName = 'JUST_CANCELAMENTO'
      Size = 60
    end
    object cdsNfCOM_PROD: TStringField
      DisplayLabel = 'Com Produtos'
      FieldName = 'COM_PROD'
      Size = 1
    end
    object cdsNfCOM_SERV: TStringField
      DisplayLabel = 'Com Servicos'
      FieldName = 'COM_SERV'
      Size = 1
    end
    object cdsNfINUTILNFANT: TStringField
      DisplayLabel = 'Inutilizar NF-e Ant.'
      FieldName = 'INUTILNFANT'
      Size = 1
    end
    object cdsNfVALOR_II: TFloatField
      DisplayLabel = 'Valor Total de Imposto sobre Importa'#231#227'o'
      FieldName = 'VALOR_II'
      DisplayFormat = '#0.00'
    end
    object cdsNfTEM_PISCOFINS_ST: TStringField
      DisplayLabel = 'Tem PIS COFINS ST'
      FieldName = 'TEM_PISCOFINS_ST'
      Size = 1
    end
    object cdsNfADD_PISCOFINS_ST_TOTALNF: TStringField
      DisplayLabel = 'Adicionar PIS COFINS ST Total NF'
      FieldName = 'ADD_PISCOFINS_ST_TOTALNF'
      Size = 1
    end
    object cdsNfPATH_XML_IMPORT: TStringField
      DisplayLabel = 'XML Entrada'
      FieldName = 'PATH_XML_IMPORT'
      Size = 256
    end
    object cdsNfCOD_CARGA: TIntegerField
      DisplayLabel = 'Cod Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsNfCOD_DEVOLUCAO: TIntegerField
      DisplayLabel = 'C'#243'digo Devolu'#231#227'o'
      FieldName = 'COD_DEVOLUCAO'
    end
    object cdsNfCOD_NF_REM_VFE: TIntegerField
      DisplayLabel = 'Codigo NF Remessa VFE'
      FieldName = 'COD_NF_REM_VFE'
    end
    object cdsNfUFEMBARQ: TStringField
      DisplayLabel = 'UF Embarque Exporta'#231#227'o'
      FieldName = 'UFEMBARQ'
      Size = 2
    end
    object cdsNfXLOCEMBARQ: TStringField
      DisplayLabel = 'Local Embarque Exporta'#231#227'o'
      FieldName = 'XLOCEMBARQ'
      Size = 60
    end
    object cdsNfXLOCDESPACHO: TStringField
      DisplayLabel = 'Local de despacho Exportacao'
      FieldName = 'XLOCDESPACHO'
      Size = 60
    end
    object cdsNfSEM_SERIE: TStringField
      DisplayLabel = 'Sem s'#233'rie'
      FieldName = 'SEM_SERIE'
      Size = 1
    end
    object cdsNfNPED: TIntegerField
      DisplayLabel = 'Num Pedido Venda'
      FieldName = 'NPED'
    end
    object cdsNfTIPO_PED: TStringField
      DisplayLabel = 'Tipo Pedido Venda'
      FieldName = 'TIPO_PED'
      Size = 3
    end
    object cdsNfCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object cdsNfVERIFICAR_MUD_CFOP: TStringField
      DisplayLabel = 'Verificar Mudan'#231'a CFOP'
      FieldName = 'VERIFICAR_MUD_CFOP'
      Size = 1
    end
    object cdsNfVTOTTRIB: TFloatField
      DisplayLabel = 'Valor Tributos(De Olho no Imposto)'
      FieldName = 'VTOTTRIB'
    end
    object cdsNfCOD_NF_TRANSF: TIntegerField
      DisplayLabel = 'Cod NF Transf Pre Nota'
      FieldName = 'COD_NF_TRANSF'
    end
    object cdsNfCOD_EMP_TRANSF: TIntegerField
      DisplayLabel = 'Cod Emp Transf Pre Nota'
      FieldName = 'COD_EMP_TRANSF'
    end
    object cdsNfDUP_XML_ENTRADA: TMemoField
      DisplayLabel = 'Duplicatas XML'
      FieldName = 'DUP_XML_ENTRADA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfSOMENSERV: TStringField
      Tag = 1
      DisplayLabel = 'Somente Servi'#231'o'
      FieldName = 'SOMENSERV'
      Size = 1
    end
    object cdsNfMOD_DES_BH: TStringField
      DisplayLabel = 'Modelo DES BH'
      FieldName = 'MOD_DES_BH'
      Size = 2
    end
    object cdsNfCHAVE_NFSE: TStringField
      DisplayLabel = 'Chave/Codigo Ver NFS-e'
      FieldName = 'CHAVE_NFSE'
      Size = 60
    end
    object cdsNfCOD_PRODUCAO_MP: TIntegerField
      DisplayLabel = 'Produ'#231#227'o'
      FieldName = 'COD_PRODUCAO_MP'
    end
    object cdsNfLOCAL_INCIDENCIA: TIntegerField
      DisplayLabel = 'Local da Incidencia'
      FieldName = 'LOCAL_INCIDENCIA'
    end
    object cdsNfTIPO_REC_ISSQN: TStringField
      DisplayLabel = 'Tipo de Recolhimento do ISSQN'
      FieldName = 'TIPO_REC_ISSQN'
      Size = 1
    end
    object cdsNfMOTIVO_NAO_RETENCAO: TStringField
      DisplayLabel = 'Motivo nao retencao'
      FieldName = 'MOTIVO_NAO_RETENCAO'
      Size = 2
    end
    object cdsNfLOTE_CONFERENCIA: TIntegerField
      DisplayLabel = 'Lote Confer'#234'ncia Cega'
      FieldName = 'LOTE_CONFERENCIA'
    end
    object cdsNfHORA_EMISSAO: TStringField
      DisplayLabel = 'Hora Emissao'
      FieldName = 'HORA_EMISSAO'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsNfNFE_INDPRES: TStringField
      DisplayLabel = 'Indicador de Presen'#231'a'
      FieldName = 'NFE_INDPRES'
      Size = 1
    end
    object cdsNfNFE_IDDEST: TStringField
      DisplayLabel = 'Indicador de Destino'
      FieldName = 'NFE_IDDEST'
      Size = 1
    end
    object cdsNfVFCPUFDEST: TFloatField
      DisplayLabel = 'Valor Total ICMS  FCP'
      FieldName = 'VFCPUFDEST'
    end
    object cdsNfVICMSUFDEST: TFloatField
      DisplayLabel = 'Valor ICMS Interestadual UF Destino'
      FieldName = 'VICMSUFDEST'
    end
    object cdsNfVICMSUFREMET: TFloatField
      DisplayLabel = 'Valor ICMS Interestadual UF Remetente'
      FieldName = 'VICMSUFREMET'
    end
    object cdsNfNFE_INDIEDEST: TSmallintField
      DisplayLabel = 'Indicador de Inscricao Estadual(Dest)'
      FieldName = 'NFE_INDIEDEST'
    end
    object cdsNfCNFE: TIntegerField
      DisplayLabel = 'Cod. Aleat NF-e'
      FieldName = 'CNFE'
    end
    object cdsNfFCP_VFCP: TFloatField
      DisplayLabel = 'Valor FCP'
      FieldName = 'FCP_VFCP'
      DisplayFormat = '#0.00'
    end
    object cdsNfFCP_VFCPST: TFloatField
      DisplayLabel = 'Valor FCP ST'
      FieldName = 'FCP_VFCPST'
      DisplayFormat = '#0.00'
    end
    object cdsNfFCP_VFCPSTRET: TFloatField
      DisplayLabel = 'Valor FCP ST Retido'
      FieldName = 'FCP_VFCPSTRET'
      DisplayFormat = '#0.00'
    end
    object cdsNfIPI_VIPIDEVOL: TFloatField
      DisplayLabel = 'Valor IPI Devolvido'
      DisplayWidth = 10
      FieldName = 'IPI_VIPIDEVOL'
      DisplayFormat = '#0.00'
    end
    object cdsNfDEST_SEQID: TIntegerField
      DisplayLabel = 'SeqID(Dest)'
      FieldName = 'DEST_SEQID'
    end
    object cdsNfNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente(Dest)'
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsNfRAZAO: TStringField
      DisplayLabel = 'Razao Social(Dest)'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsNfCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ(Dest)'
      FieldName = 'CPFCGC'
      Size = 14
    end
    object cdsNfINSC_EST: TStringField
      DisplayLabel = 'Insc Estadual(Dest)'
      FieldName = 'INSC_EST'
      Size = 14
    end
    object cdsNfDEST_IDESTRANGEIRO: TStringField
      DisplayLabel = 'Id Estrangeiro(Dest)'
      FieldName = 'DEST_IDESTRANGEIRO'
    end
    object cdsNfDEST_ISUF: TStringField
      DisplayLabel = 'Insc Suframa(Dest)'
      FieldName = 'DEST_ISUF'
      Size = 9
    end
    object cdsNfDEST_IM: TStringField
      DisplayLabel = 'Insc Municipal(Dest)'
      FieldName = 'DEST_IM'
      Size = 15
    end
    object cdsNfDEST_EMAIL: TStringField
      DisplayLabel = 'Email(Dest)'
      FieldName = 'DEST_EMAIL'
      Size = 60
    end
    object cdsNfDEST_XLGR: TStringField
      DisplayLabel = 'Logradouro(Dest)'
      FieldName = 'DEST_XLGR'
      Size = 60
    end
    object cdsNfDEST_NRO: TStringField
      DisplayLabel = 'Numero(Dest)'
      FieldName = 'DEST_NRO'
      Size = 60
    end
    object cdsNfDEST_XCPL: TStringField
      DisplayLabel = 'Complemento(Endereco)'
      FieldName = 'DEST_XCPL'
      Size = 60
    end
    object cdsNfDEST_XBAIRRO: TStringField
      DisplayLabel = 'Bairro(Dest)'
      FieldName = 'DEST_XBAIRRO'
      Size = 60
    end
    object cdsNfDEST_CMUN: TIntegerField
      DisplayLabel = 'Cod IBGE Cidade(Dest)'
      FieldName = 'DEST_CMUN'
    end
    object cdsNfDEST_XMUN: TStringField
      DisplayLabel = 'Cidade(Dest)'
      FieldName = 'DEST_XMUN'
      Size = 60
    end
    object cdsNfDEST_UF: TStringField
      DisplayLabel = 'UF(Dest)'
      FieldName = 'DEST_UF'
      Size = 2
    end
    object cdsNfDEST_CEP: TStringField
      DisplayLabel = 'CEP(Dest)'
      FieldName = 'DEST_CEP'
      Size = 8
    end
    object cdsNfDEST_CPAIS: TSmallintField
      DisplayLabel = 'Cod Pa'#237's(Dest)'
      FieldName = 'DEST_CPAIS'
    end
    object cdsNfDEST_XPAIS: TStringField
      DisplayLabel = 'Pa'#237's(Dest)'
      FieldName = 'DEST_XPAIS'
      Size = 60
    end
    object cdsNfDEST_FONE: TStringField
      DisplayLabel = 'Fone(Dest)'
      FieldName = 'DEST_FONE'
      Size = 14
    end
    object cdsNfPAG_VTROCO: TFloatField
      DisplayLabel = 'Troco(pag)'
      FieldName = 'PAG_VTROCO'
    end
    object cdsNfFAT_NFAT: TStringField
      DisplayLabel = 'Numero Fatura'
      FieldName = 'FAT_NFAT'
      Size = 60
    end
    object cdsNfFAT_VORIG: TFloatField
      DisplayLabel = 'Valor Fatura'
      FieldName = 'FAT_VORIG'
    end
    object cdsNfFAT_VDESC: TFloatField
      DisplayLabel = 'Desconto Fatura'
      FieldName = 'FAT_VDESC'
    end
    object cdsNfFAT_VLIQ: TFloatField
      DisplayLabel = 'Valor Liq Fatura'
      FieldName = 'FAT_VLIQ'
    end
    object cdsNfNFE_VERSAO: TStringField
      DisplayLabel = 'NFe Versao'
      FieldName = 'NFE_VERSAO'
      Size = 8
    end
    object cdsNfNFE_TPEMIS: TStringField
      DisplayLabel = 'NFe Forma'
      FieldName = 'NFE_TPEMIS'
      Size = 1
    end
    object cdsNfNFE_TPAMB: TStringField
      DisplayLabel = 'NFe Amb'
      FieldName = 'NFE_TPAMB'
      Size = 1
    end
    object cdsNfTR_RNTC: TStringField
      DisplayLabel = 'RNTC'
      FieldName = 'TR_RNTC'
    end
    object cdsNfNFE_CSTAT: TIntegerField
      DisplayLabel = 'NFe cStat'
      FieldName = 'NFE_CSTAT'
    end
    object cdsNfSEL: TStringField
      Tag = 2
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsNfOBS_BOL1: TStringField
      Tag = 1
      DisplayLabel = 'Obs Ad Bol'
      FieldName = 'OBS_BOL1'
      Size = 45
    end
    object cdsNfID_AJUSTE: TIntegerField
      DisplayLabel = 'Id Ajuste'
      FieldName = 'ID_AJUSTE'
    end
    object cdsNfVICMDESON: TFloatField
      DisplayLabel = 'Valor ICMS Desonerado'
      FieldName = 'VICMDESON'
      DisplayFormat = '#0.00'
    end
    object cdsNfFINALIDADEID: TIntegerField
      DisplayLabel = 'Id Finalidade'
      FieldName = 'FINALIDADEID'
    end
    object cdsNfTIPO_SEGURO: TStringField
      DisplayLabel = 'Tipo Valor Seguro'
      FieldName = 'TIPO_SEGURO'
      Size = 1
    end
    object cdsNfTIPO_OUTDESP: TStringField
      DisplayLabel = 'Tipo Valor Out Desp'
      FieldName = 'TIPO_OUTDESP'
      Size = 1
    end
    object cdsNfTIPO_FRETE: TStringField
      DisplayLabel = 'Tipo Valor Frete'
      FieldName = 'TIPO_FRETE'
      Size = 1
    end
    object cdsNfTIPO_DESPPF: TStringField
      DisplayLabel = 'Tipo Out Desp PF'
      FieldName = 'TIPO_DESPPF'
      Size = 1
    end
    object cdsNfTOTAIS_COM_DESON: TStringField
      DisplayLabel = 'Totais com Desonera'#231#227'o'
      FieldName = 'TOTAIS_COM_DESON'
      Size = 1
    end
    object cdsNfINDINTERMED: TStringField
      DisplayLabel = 'Intermediador/Marketplace?'
      FieldName = 'INDINTERMED'
      Size = 1
    end
    object cdsNfINFINTERMED_CNPJ: TStringField
      DisplayLabel = 'Interme/Market CNPJ'
      FieldName = 'INFINTERMED_CNPJ'
      Size = 14
    end
    object cdsNfINFINTERMED_IDCADINTTRAN: TStringField
      DisplayLabel = 'Interme/Market Identifica'#231#227'o'
      FieldName = 'INFINTERMED_IDCADINTTRAN'
      Size = 60
    end
    object cdsNfCONF_BC: TMemoField
      Tag = 1
      DisplayLabel = 'Configura'#231#227'o BC'
      FieldName = 'CONF_BC'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfIMPORT_XML: TStringField
      DisplayLabel = 'Vers'#227'o dados'
      FieldName = 'IMPORT_XML'
      Size = 16
    end
    object cdsNfVPISDESON: TFloatField
      DisplayLabel = 'Valor PIS Desonerado'
      FieldName = 'VPISDESON'
      DisplayFormat = '#0.00'
    end
    object cdsNfVCOFINSDESON: TFloatField
      DisplayLabel = 'Valor COFINS Desonerado'
      FieldName = 'VCOFINSDESON'
      DisplayFormat = '#0.00'
    end
    object cdsNfCONF_ISUF: TStringField
      DisplayLabel = 'Confer'#234'ncia Insc Suframa'
      FieldName = 'CONF_ISUF'
      Size = 1
    end
    object cdsNfCOMPRA_XNEMP: TStringField
      DisplayLabel = 'Nota de Empenho (Compra)'
      FieldName = 'COMPRA_XNEMP'
      Size = 22
    end
    object cdsNfCOMPRA_XPED: TStringField
      DisplayLabel = 'Pedido (Compra)'
      FieldName = 'COMPRA_XPED'
      Size = 60
    end
    object cdsNfCOMPRA_XCONT: TStringField
      DisplayLabel = 'Contrato (Compra)'
      FieldName = 'COMPRA_XCONT'
      Size = 60
    end
    object cdsNfVRETPIS: TFloatField
      DisplayLabel = 'Valor retido de PIS'
      FieldName = 'VRETPIS'
    end
    object cdsNfVRETCOFINS: TFloatField
      DisplayLabel = 'Valor retido de COFINS'
      FieldName = 'VRETCOFINS'
    end
    object cdsNfVRETCSLL: TFloatField
      DisplayLabel = 'Valor retido de CSLL'
      FieldName = 'VRETCSLL'
    end
    object cdsNfBASE_IRRF: TFloatField
      DisplayLabel = 'Base IRRF'
      FieldName = 'BASE_IRRF'
    end
    object cdsNfVALOR_IRRF: TFloatField
      DisplayLabel = 'Valor retido de IRRF'
      FieldName = 'VALOR_IRRF'
    end
    object cdsNfVBCRETPREV: TFloatField
      DisplayLabel = 'Base Ret Prev Social'
      FieldName = 'VBCRETPREV'
    end
    object cdsNfVRETPREV: TFloatField
      DisplayLabel = 'Valor retido de Prev Social'
      FieldName = 'VRETPREV'
    end
    object cdsNfQBCMONO: TFloatField
      DisplayLabel = 'Qtde Base ICMS Monofasico'
      FieldName = 'QBCMONO'
    end
    object cdsNfVICMSMONO: TFloatField
      DisplayLabel = 'Valor ICMS Monofasico'
      FieldName = 'VICMSMONO'
    end
    object cdsNfQBCMONORETEN: TFloatField
      DisplayLabel = 'Qtde Base ICMS Monofasico suj. a Reten'#231#227'o'
      FieldName = 'QBCMONORETEN'
    end
    object cdsNfVICMSMONORETEN: TFloatField
      DisplayLabel = 'Valor ICMS Monofasico suj. a Reten'#231#227'o'
      FieldName = 'VICMSMONORETEN'
    end
    object cdsNfQBCMONORET: TFloatField
      DisplayLabel = 'Qtde Base ICMS Monofasico cobrado em op Anterior'
      FieldName = 'QBCMONORET'
    end
    object cdsNfVICMSMONORET: TFloatField
      DisplayLabel = 'Valor ICMS Monofasico cobrado em op Anterior'
      FieldName = 'VICMSMONORET'
    end
    object cdsNfRET_FED: TSmallintField
      FieldName = 'RET_FED'
    end
    object cdsNfCOD_CLI_PED: TIntegerField
      DisplayLabel = 'Cod Cliente Pedido Emissao Difere'
      FieldName = 'COD_CLI_PED'
    end
    object cdsNfDPREVENTREGA: TDateTimeField
      DisplayLabel = 'Data prevista entrega'
      FieldName = 'DPREVENTREGA'
      EditMask = '!99/99/0000;0;_'
    end
    object cdsNfCMUNFG: TIntegerField
      DisplayLabel = 'Codigo Municipio fato gerador do ICMS'
      FieldName = 'CMUNFG'
    end
    object cdsNfCMUNFGIBS: TIntegerField
      DisplayLabel = 'Codigo Municipio consumo, fato gerador do IBSCBS'
      FieldName = 'CMUNFGIBS'
    end
    object cdsNfTPNFDEBITO: TSmallintField
      DisplayLabel = 'Tipo de nota de d'#233'bito'
      FieldName = 'TPNFDEBITO'
    end
    object cdsNfTPNFCREDITO: TSmallintField
      DisplayLabel = 'Tipo de nota de cr'#233'dito'
      FieldName = 'TPNFCREDITO'
    end
    object cdsNfVNFTOT: TBCDField
      DisplayLabel = 'Valor total NF com IBS CBS IS'
      FieldName = 'VNFTOT'
      Precision = 18
      Size = 2
    end
    object cdsNfVBCIBSCBS: TBCDField
      DisplayLabel = 'Base IBSCBS'
      FieldName = 'VBCIBSCBS'
      Precision = 18
      Size = 2
    end
    object cdsNfIBSUF_VDIF: TBCDField
      DisplayLabel = 'Valor diferimento IBS UF'
      FieldName = 'IBSUF_VDIF'
      Precision = 18
      Size = 2
    end
    object cdsNfIBSUF_VDEVTRIB: TBCDField
      DisplayLabel = 'Valor devolucao  tributos IBS UF'
      FieldName = 'IBSUF_VDEVTRIB'
      Precision = 18
      Size = 2
    end
    object cdsNfVIBSUF: TBCDField
      DisplayLabel = 'Valor IBS UF'
      FieldName = 'VIBSUF'
      Precision = 18
      Size = 2
    end
    object cdsNfIBSMUN_VDIF: TBCDField
      DisplayLabel = 'Valor diferimento IBS Municipio'
      FieldName = 'IBSMUN_VDIF'
      Precision = 18
      Size = 2
    end
    object cdsNfIBSMUN_VDEVTRIB: TBCDField
      DisplayLabel = 'Valor devolucao  tributos IBS Municipio'
      FieldName = 'IBSMUN_VDEVTRIB'
      Precision = 18
      Size = 2
    end
    object cdsNfVIBSMUN: TBCDField
      DisplayLabel = 'Valor IBS Municipio'
      FieldName = 'VIBSMUN'
      Precision = 18
      Size = 2
    end
    object cdsNfVIBS: TBCDField
      DisplayLabel = 'Valor IBS total'
      FieldName = 'VIBS'
      Precision = 18
      Size = 2
    end
    object cdsNfIBS_VCREDPRES: TBCDField
      DisplayLabel = 'Valor credito presumido IBS'
      FieldName = 'IBS_VCREDPRES'
      Precision = 18
      Size = 2
    end
    object cdsNfIBS_VCREDPRESCONDSUS: TBCDField
      DisplayLabel = 'Valor credito presumido IBS com condicao suspensiva'
      FieldName = 'IBS_VCREDPRESCONDSUS'
      Precision = 18
      Size = 2
    end
    object cdsNfCBS_VDIF: TBCDField
      DisplayLabel = 'Valor diferimento CBS'
      FieldName = 'CBS_VDIF'
      Precision = 18
      Size = 2
    end
    object cdsNfCBS_VDEVTRIB: TBCDField
      DisplayLabel = 'Valor devolucao  tributos CBS'
      FieldName = 'CBS_VDEVTRIB'
      Precision = 18
      Size = 2
    end
    object cdsNfVCBS: TBCDField
      DisplayLabel = 'Valor CBS'
      FieldName = 'VCBS'
      Precision = 18
      Size = 2
    end
    object cdsNfCBS_VCREDPRES: TBCDField
      DisplayLabel = 'Valor credito presumido CBS'
      FieldName = 'CBS_VCREDPRES'
      Precision = 18
      Size = 2
    end
    object cdsNfCBS_VCREDPRESCONDSUS: TBCDField
      DisplayLabel = 'Valor credito presumido CBS com condicao suspensiva'
      FieldName = 'CBS_VCREDPRESCONDSUS'
      Precision = 18
      Size = 2
    end
    object cdsNfVIBSMONO: TBCDField
      DisplayLabel = 'Valor IBS monofasico'
      FieldName = 'VIBSMONO'
      Precision = 18
      Size = 2
    end
    object cdsNfVCBSMONO: TBCDField
      DisplayLabel = 'Valor CBS Monofasica'
      FieldName = 'VCBSMONO'
      Precision = 18
      Size = 2
    end
    object cdsNfVIBSMONORETEN: TBCDField
      DisplayLabel = 'Valor IBS monofasico sujeito a retencao'
      FieldName = 'VIBSMONORETEN'
      Precision = 18
      Size = 2
    end
    object cdsNfVCBSMONORETEN: TBCDField
      DisplayLabel = 'Valor CBS monofasica sujeita a retencao'
      FieldName = 'VCBSMONORETEN'
      Precision = 18
      Size = 2
    end
    object cdsNfVIBSMONORET: TBCDField
      DisplayLabel = 'Valor IBS retido anteriormente'
      FieldName = 'VIBSMONORET'
      Precision = 18
      Size = 2
    end
    object cdsNfVCBSMONORET: TBCDField
      DisplayLabel = 'Valor CBS retida anteriormente'
      FieldName = 'VCBSMONORET'
      Precision = 18
      Size = 2
    end
    object cdsNfVIBSESTCRED: TBCDField
      DisplayLabel = 'Valor do IBS estornado'
      FieldName = 'VIBSESTCRED'
      Precision = 18
      Size = 2
    end
    object cdsNfVCBSESTCRED: TBCDField
      DisplayLabel = 'Valor da CBS estornada'
      FieldName = 'VCBSESTCRED'
      Precision = 18
      Size = 2
    end
    object cdsNfVIS: TBCDField
      DisplayLabel = 'Valor Imposto Seletivo'
      FieldName = 'VIS'
      Precision = 18
      Size = 2
    end
    object cdsNfOP_INTERNA_ID: TStringField
      Tag = 1
      DisplayLabel = 'Op Interna Id'
      FieldName = 'OP_INTERNA_ID'
      Size = 36
    end
    object cdsNfDFE_TRIB_IGNORAR: TSmallintField
      DisplayLabel = 'Ignorar Tributos RTC'
      FieldName = 'DFE_TRIB_IGNORAR'
    end
    object cdsNfTPIMP: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Formato Impress'#227'o DANFe'
      FieldName = 'TPIMP'
    end
    object cdsNfCINDOP: TStringField
      DisplayLabel = 'Codigo Indicador do Local da Opera'#231#227'o'
      FieldName = 'CINDOP'
      EditMask = '!999999;0;_'
      Size = 6
    end
  end
  object dsNf: TDataSource
    AutoEdit = False
    DataSet = cdsNf
    Left = 24
    Top = 216
  end
  object qrINf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_ITEM')
    Left = 72
    Top = 72
  end
  object dspINf: TDataSetProvider
    DataSet = qrINf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 72
    Top = 120
  end
  object cdsINf: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspINf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 72
    Top = 168
    object cdsINfCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsINfNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsINfGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsINfCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsINfCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Serv'
      FieldName = 'COD_SERVICO'
    end
    object cdsINfCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      FixedChar = True
      Size = 17
    end
    object cdsINfCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsINfDESC_NATOP: TStringField
      DisplayLabel = 'Descr. CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Size = 128
    end
    object cdsINfCST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsINfCSOSN: TStringField
      FieldName = 'CSOSN'
      FixedChar = True
      Size = 3
    end
    object cdsINfREFERENCIA: TStringField
      DisplayLabel = 'Ref'
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 6
    end
    object cdsINfNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsINfDESCRICAO_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ITEM'
      Size = 75
    end
    object cdsINfNCM: TStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NCM'
      Size = 8
    end
    object cdsINfDATA_VALIDADE: TDateTimeField
      DisplayLabel = 'Data Validade'
      FieldName = 'DATA_VALIDADE'
    end
    object cdsINfQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
    end
    object cdsINfVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsINfVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Tot'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsINfALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
    end
    object cdsINfBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
    end
    object cdsINfVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
    end
    object cdsINfALIQ_ICMSUB: TFloatField
      DisplayLabel = '% ICMS Sub'
      FieldName = 'ALIQ_ICMSUB'
    end
    object cdsINfBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
    end
    object cdsINfVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Sub'
      FieldName = 'VALOR_ICMSUB'
    end
    object cdsINfPERC_RED_PROD_SUB: TFloatField
      DisplayLabel = '% Red ICMS ST'
      FieldName = 'PERC_RED_PROD_SUB'
    end
    object cdsINfBASE_ICMANT_SUB: TFloatField
      DisplayLabel = 'Base ICMS Ant'
      FieldName = 'BASE_ICMANT_SUB'
    end
    object cdsINfVALOR_ICMANT_SUB: TFloatField
      DisplayLabel = 'Valor ICMS Ant'
      FieldName = 'VALOR_ICMANT_SUB'
    end
    object cdsINfALIQ_IPI: TFloatField
      DisplayLabel = '% IPI'
      FieldName = 'ALIQ_IPI'
    end
    object cdsINfVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
    end
    object cdsINfPERC_RED_PROD: TFloatField
      DisplayLabel = '% Red Base'
      FieldName = 'PERC_RED_PROD'
    end
    object cdsINfPERC_DESCONTO: TFloatField
      DisplayLabel = 'Desconto %'
      FieldName = 'PERC_DESCONTO'
    end
    object cdsINfVALOR_DESCONTO_PERC: TFloatField
      Tag = 1
      DisplayLabel = 'Desconto $'
      FieldName = 'VALOR_DESCONTO_PERC'
      Visible = False
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_DESCONTO: TFloatField
      DisplayLabel = 'Desconto $'
      FieldName = 'RATEIO_DESCONTO'
      DisplayFormat = '##0.00'
    end
    object cdsINfMVA: TFloatField
      FieldName = 'MVA'
    end
    object cdsINfRATEIO_SEGURO: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'RATEIO_SEGURO'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_OUTDESP: TFloatField
      DisplayLabel = 'Out Despesas'
      FieldName = 'RATEIO_OUTDESP'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_FRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'RATEIO_FRETE'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_ACRES_FIN: TFloatField
      DisplayLabel = 'Acresc Finan'
      FieldName = 'RATEIO_ACRES_FIN'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_DESP_PF: TFloatField
      DisplayLabel = 'Desp PF'
      FieldName = 'RATEIO_DESP_PF'
      DisplayFormat = '##0.0000'
    end
    object cdsINfPERC_FRETE: TFloatField
      DisplayLabel = '% Frete'
      FieldName = 'PERC_FRETE'
    end
    object cdsINfPRCTB_ITEM: TFloatField
      DisplayLabel = 'MarkUp'
      FieldName = 'PRCTB_ITEM'
    end
    object cdsINfPRCTB_ITEMA: TFloatField
      DisplayLabel = 'MarkUp Atacado'
      FieldName = 'PRCTB_ITEMA'
    end
    object cdsINfPREC_CUS_CNT: TFloatField
      DisplayLabel = 'Custo $'
      FieldName = 'PREC_CUS_CNT'
    end
    object cdsINfPREC_VND_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Varejo'
      FieldName = 'PREC_VND_PROD'
    end
    object cdsINfPREC_VND_PRODA: TFloatField
      DisplayLabel = 'Pre'#231'o Atacado'
      FieldName = 'PREC_VND_PRODA'
    end
    object cdsINfPREC_CUS_REP: TFloatField
      DisplayLabel = 'Custo Reposi'#231#227'o $'
      FieldName = 'PREC_CUS_REP'
    end
    object cdsINfPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio $'
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsINfPMARGFIM: TFloatField
      DisplayLabel = '% Margem'
      FieldName = 'PMARGFIM'
      Visible = False
      DisplayFormat = '##0.0000'
    end
    object cdsINfQTDEMB: TFloatField
      DisplayLabel = 'Qtde Itens p/ Emb'
      FieldName = 'QTDEMB'
    end
    object cdsINfQTDEMBREC: TFloatField
      DisplayLabel = 'Qtde de Emb'
      FieldName = 'QTDEMBREC'
    end
    object cdsINfVLREMBNF: TFloatField
      DisplayLabel = 'Valor da Emb'
      FieldName = 'VLREMBNF'
    end
    object cdsINfVLBRUREAL: TFloatField
      FieldName = 'VLBRUREAL'
    end
    object cdsINfPDESC_R: TFloatField
      FieldName = 'PDESC_R'
    end
    object cdsINfVLREMBNFR: TFloatField
      FieldName = 'VLREMBNFR'
    end
    object cdsINfVLUN_B_NFE: TFloatField
      FieldName = 'VLUN_B_NFE'
    end
    object cdsINfVLISENTO: TFloatField
      DisplayLabel = 'Isento $'
      FieldName = 'VLISENTO'
    end
    object cdsINfVLOUTRAS: TFloatField
      DisplayLabel = 'Outras $'
      FieldName = 'VLOUTRAS'
    end
    object cdsINfVLN_TRIB: TFloatField
      DisplayLabel = 'N'#227'o Trib $'
      FieldName = 'VLN_TRIB'
    end
    object cdsINfCAMP_ENTEST: TStringField
      DisplayLabel = 'Ent Estoque'
      FieldName = 'CAMP_ENTEST'
      FixedChar = True
      Size = 1
    end
    object cdsINfSEQ_DEVOLUCAO: TIntegerField
      FieldName = 'SEQ_DEVOLUCAO'
    end
    object cdsINfMNF: TStringField
      FieldName = 'MNF'
      FixedChar = True
      Size = 1
    end
    object cdsINfALTERA_ESTOQUE_CFOP: TStringField
      DisplayLabel = 'Alterou Estoque'
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsINfNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
    end
    object cdsINfTIPO_PED: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsINfTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsINfNITEM_PED: TIntegerField
      DisplayLabel = 'N'#186' Item Venda'
      FieldName = 'NITEM_PED'
    end
    object cdsINfCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsINfBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
    end
    object cdsINfPERC_RED_IPI: TFloatField
      DisplayLabel = '% Red IPI'
      FieldName = 'PERC_RED_IPI'
    end
    object cdsINfPERMITIR_DESCONTO: TStringField
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsINfALIQ_ICM_SIMPLES: TFloatField
      DisplayLabel = '% Cred SN'
      FieldName = 'ALIQ_ICM_SIMPLES'
      Visible = False
    end
    object cdsINfBASE_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Base ICMS SN'
      FieldName = 'BASE_ICM_SIMPLES'
      Visible = False
    end
    object cdsINfVALOR_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Valor Cred ICMS SN'
      FieldName = 'VALOR_ICM_SIMPLES'
      Visible = False
    end
    object cdsINfALIQ_ISS: TFloatField
      DisplayLabel = 'Aliq ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsINfBASE_ISS: TFloatField
      DisplayLabel = 'Base ISS'
      FieldName = 'BASE_ISS'
    end
    object cdsINfVALOR_ISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VALOR_ISS'
    end
    object cdsINfTERMINAL: TIntegerField
      DisplayLabel = 'Terminal ECF'
      FieldName = 'TERMINAL'
    end
    object cdsINfNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
    end
    object cdsINfNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsINfALTERA_CUSTO_CFOP: TStringField
      DisplayLabel = 'Altera Custo'
      FieldName = 'ALTERA_CUSTO_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsINfDESCRICAO_ITEM_OUTRAS: TMemoField
      FieldName = 'DESCRICAO_ITEM_OUTRAS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsINfECF: TStringField
      DisplayLabel = 'ECF?'
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsINfPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
    end
    object cdsINfPESO_L: TFloatField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESO_L'
    end
    object cdsINfDATA_CUPOM: TDateTimeField
      DisplayLabel = 'Data Cupom'
      FieldName = 'DATA_CUPOM'
    end
    object cdsINfVALOR_DIF: TFloatField
      DisplayLabel = 'Dif ICMS/Compl ST'
      FieldName = 'VALOR_DIF'
    end
    object cdsINfINDTOT: TSmallintField
      FieldName = 'INDTOT'
    end
    object cdsINfMODBCST: TIntegerField
      FieldName = 'MODBCST'
    end
    object cdsINfMODBC: TIntegerField
      FieldName = 'MODBC'
    end
    object cdsINfVALOR_ICM_STDES: TFloatField
      FieldName = 'VALOR_ICM_STDES'
    end
    object cdsINfVL_MULTP: TFloatField
      FieldName = 'VL_MULTP'
    end
    object cdsINfPR_CUSC_PROD: TFloatField
      FieldName = 'PR_CUSC_PROD'
    end
    object cdsINfPREC_CUS_R: TFloatField
      FieldName = 'PREC_CUS_R'
    end
    object cdsINfCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsINfALIQ_PIS: TFloatField
      DisplayLabel = 'Aliq PIS'
      FieldName = 'ALIQ_PIS'
      DisplayFormat = '#0.0000'
    end
    object cdsINfVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
    end
    object cdsINfCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsINfALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
      DisplayFormat = '#0.0000'
    end
    object cdsINfVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
    end
    object cdsINfNUM_FAB_FORNECEDOR: TStringField
      DisplayLabel = 'Num Fab Fornecedor'
      FieldName = 'NUM_FAB_FORNECEDOR'
      Size = 60
    end
    object cdsINfCONSUMO: TStringField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsINfPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
    end
    object cdsINfCST_IPI: TStringField
      DisplayLabel = 'CST IPI'
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 2
    end
    object cdsINfBASE_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Base ICM Ant'
      FieldName = 'BASE_ICMSUB_ANT'
    end
    object cdsINfVALOR_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Valor ICM Ant'
      FieldName = 'VALOR_ICMSUB_ANT'
    end
    object cdsINfIMPORT_XML: TStringField
      DisplayLabel = 'Import Xml'
      FieldName = 'IMPORT_XML'
      FixedChar = True
      Size = 1
    end
    object cdsINfBASE_PIS: TFloatField
      DisplayLabel = 'Base PIS'
      FieldName = 'BASE_PIS'
    end
    object cdsINfBASE_COFINS: TFloatField
      DisplayLabel = 'Base COFINS'
      FieldName = 'BASE_COFINS'
    end
    object cdsINfQUANT_BC_PIS: TFloatField
      DisplayLabel = 'Qtde Base PIS'
      FieldName = 'QUANT_BC_PIS'
    end
    object cdsINfALIQ_PIS_QUANT: TFloatField
      DisplayLabel = 'Aliq PIS Qtde'
      FieldName = 'ALIQ_PIS_QUANT'
      DisplayFormat = '#0.00'
    end
    object cdsINfQUANT_BC_COFINS: TFloatField
      DisplayLabel = 'Qtde Base COFINS'
      FieldName = 'QUANT_BC_COFINS'
    end
    object cdsINfALIQ_COFINS_QUANT: TFloatField
      DisplayLabel = 'Aliq COFINS Qtde'
      FieldName = 'ALIQ_COFINS_QUANT'
      DisplayFormat = '#0.00'
    end
    object cdsINfANTEC_TRIB: TStringField
      FieldName = 'ANTEC_TRIB'
      FixedChar = True
      Size = 1
    end
    object cdsINfPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 Dias'
      FieldName = 'PREC_30_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsINfPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 Dias'
      FieldName = 'PREC_60_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsINfPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 Dias'
      FieldName = 'PREC_90_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsINfSELG: TStringField
      DisplayLabel = 'Sel G'
      FieldKind = fkInternalCalc
      FieldName = 'SELG'
      Size = 1
    end
    object cdsINfNAT_REC: TStringField
      DisplayLabel = 'Natureza Receita PIS/COFINS'
      FieldName = 'NAT_REC'
      Size = 3
    end
    object cdsINfCOD_NF_DEV: TIntegerField
      DisplayLabel = 'C'#243'digo da NF Devolvida'
      FieldName = 'COD_NF_DEV'
    end
    object cdsINfNITEM_DEV: TSmallintField
      DisplayLabel = 'N'#186' Item na NF devolvida'
      FieldName = 'NITEM_DEV'
    end
    object cdsINfBASE_II: TFloatField
      DisplayLabel = 'Base do II'
      FieldName = 'BASE_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfVALOR_DESPADU_II: TFloatField
      DisplayLabel = 'Valor Despesas Aduaneiras II'
      FieldName = 'VALOR_DESPADU_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfVALOR_II: TFloatField
      DisplayLabel = 'Valor do II'
      FieldName = 'VALOR_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfVALOR_IOF_II: TFloatField
      DisplayLabel = 'IOF sobre II'
      FieldName = 'VALOR_IOF_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfALIQ_PIS_ST: TFloatField
      FieldName = 'ALIQ_PIS_ST'
    end
    object cdsINfALIQ_COFINS_ST: TFloatField
      FieldName = 'ALIQ_COFINS_ST'
    end
    object cdsINfBASE_PIS_ST: TFloatField
      FieldName = 'BASE_PIS_ST'
    end
    object cdsINfBASE_COFINS_ST: TFloatField
      FieldName = 'BASE_COFINS_ST'
    end
    object cdsINfVALOR_PIS_ST: TFloatField
      FieldName = 'VALOR_PIS_ST'
    end
    object cdsINfVALOR_COFINS_ST: TFloatField
      FieldName = 'VALOR_COFINS_ST'
    end
    object cdsINfSEQID_DEVOLUCAO: TIntegerField
      FieldName = 'SEQID_DEVOLUCAO'
    end
    object cdsINfNITEM_REM_VFE: TIntegerField
      FieldName = 'NITEM_REM_VFE'
    end
    object cdsINfCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsINfCOMB_CPRODANP: TStringField
      FieldName = 'COMB_CPRODANP'
      Size = 9
    end
    object cdsINfCOMB_CODIF: TStringField
      FieldName = 'COMB_CODIF'
      Size = 21
    end
    object cdsINfCOMB_QTEMP: TFloatField
      FieldName = 'COMB_QTEMP'
      LookupDataSet = cdsADI
    end
    object cdsINfCOMB_UFCONS: TStringField
      FieldName = 'COMB_UFCONS'
      Size = 2
    end
    object cdsINfCOMB_CIDE_QBCPROD: TFloatField
      FieldName = 'COMB_CIDE_QBCPROD'
    end
    object cdsINfCOMB_CIDE_VALIQPROD: TFloatField
      FieldName = 'COMB_CIDE_VALIQPROD'
    end
    object cdsINfCOMB_CIDE_VCIDE: TFloatField
      FieldName = 'COMB_CIDE_VCIDE'
    end
    object cdsINfVTOTTRIB: TFloatField
      DisplayLabel = 'Tributos(De Olho no Imposto)'
      FieldName = 'VTOTTRIB'
    end
    object cdsINfXPED_COMPRA: TStringField
      DisplayLabel = 'N'#176' Pedido de Compra do Cliente'
      FieldName = 'XPED_COMPRA'
      Size = 15
    end
    object cdsINfNITEMPED_COMPRA: TIntegerField
      DisplayLabel = 'N'#176' Item no Pedido de Compra do Cliente'
      FieldName = 'NITEMPED_COMPRA'
    end
    object cdsINfUNIDADE_NF: TStringField
      DisplayLabel = 'Unid Venda'
      FieldName = 'UNIDADE_NF'
      FixedChar = True
      Size = 6
    end
    object cdsINfEAN13: TStringField
      FieldName = 'EAN13'
      FixedChar = True
      Size = 13
    end
    object cdsINfTIPV_VEICULO: TStringField
      Tag = 1
      FieldName = 'TIPV_VEICULO'
      FixedChar = True
      Size = 1
    end
    object cdsINfCOD_ESTMOTO: TIntegerField
      Tag = 1
      FieldName = 'COD_ESTMOTO'
    end
    object cdsINfNFCI: TStringField
      FieldName = 'NFCI'
      Size = 36
    end
    object cdsINfNFE_PDEVOL: TFloatField
      DisplayLabel = 'Perc. Mercad. devolvida'
      FieldName = 'NFE_PDEVOL'
      DisplayFormat = '##0.00'
    end
    object cdsINfNFE_VIPIDEVOL: TFloatField
      DisplayLabel = 'Valor IPI Devolv.'
      FieldName = 'NFE_VIPIDEVOL'
      DisplayFormat = '##0.00'
    end
    object cdsINfNFE_NRECOPI: TStringField
      DisplayLabel = 'Num RECOPI'
      FieldName = 'NFE_NRECOPI'
    end
    object cdsINfCOMB_PMIXGN: TFloatField
      DisplayLabel = 'Perc. Gas Natural p/ GLP'
      FieldName = 'COMB_PMIXGN'
    end
    object cdsINfNVE: TStringField
      FieldName = 'NVE'
      Size = 64
    end
    object cdsINfCENQ_IPI_NFE: TStringField
      FieldName = 'CENQ_IPI_NFE'
      Size = 3
    end
    object cdsINfCEST: TStringField
      FieldName = 'CEST'
      EditMask = '99.999.99;0;_'
      Size = 7
    end
    object cdsINfVBCUFDEST: TFloatField
      FieldName = 'VBCUFDEST'
    end
    object cdsINfPFCPUFDEST: TFloatField
      FieldName = 'PFCPUFDEST'
    end
    object cdsINfPICMSUFDEST: TFloatField
      FieldName = 'PICMSUFDEST'
    end
    object cdsINfPICMSINTER: TFloatField
      FieldName = 'PICMSINTER'
    end
    object cdsINfPICMSINTERPART: TFloatField
      FieldName = 'PICMSINTERPART'
    end
    object cdsINfVFCPUFDEST: TFloatField
      FieldName = 'VFCPUFDEST'
    end
    object cdsINfVICMSUFDEST: TFloatField
      FieldName = 'VICMSUFDEST'
    end
    object cdsINfVICMSUFREMET: TFloatField
      FieldName = 'VICMSUFREMET'
    end
    object cdsINfANT_CALC: TStringField
      FieldName = 'ANT_CALC'
      Size = 1
    end
    object cdsINfALIQ_ICM_XML: TFloatField
      DisplayLabel = 'Aliq ICMS Ent XML'
      FieldName = 'ALIQ_ICM_XML'
    end
    object cdsINfVALOR_ICM_XML: TFloatField
      DisplayLabel = 'Valor ICM Ent XML'
      FieldName = 'VALOR_ICM_XML'
    end
    object cdsINfESPELHO_CALC_ST: TStringField
      DisplayLabel = 'Espelho Calc'
      FieldName = 'ESPELHO_CALC_ST'
      Size = 512
    end
    object cdsINfSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsINfICMS_RECOMPOSICAO: TFloatField
      DisplayLabel = 'ICMS Recomposi'#231#227'o'
      FieldName = 'ICMS_RECOMPOSICAO'
    end
    object cdsINfCOD_NFCE: TIntegerField
      FieldName = 'COD_NFCE'
    end
    object cdsINfCOMB_DESCANP: TStringField
      FieldName = 'COMB_DESCANP'
      Size = 95
    end
    object cdsINfCOMB_PGLP: TFloatField
      FieldName = 'COMB_PGLP'
    end
    object cdsINfCOMB_PGNN: TFloatField
      FieldName = 'COMB_PGNN'
    end
    object cdsINfCOMB_PGNI: TFloatField
      FieldName = 'COMB_PGNI'
    end
    object cdsINfCOMB_VPART: TFloatField
      FieldName = 'COMB_VPART'
    end
    object cdsINfFCP_PFCP: TFloatField
      FieldName = 'FCP_PFCP'
    end
    object cdsINfFCP_VFCP: TFloatField
      FieldName = 'FCP_VFCP'
    end
    object cdsINfFCP_VBCFCP: TFloatField
      FieldName = 'FCP_VBCFCP'
    end
    object cdsINfFCP_VBCFCPST: TFloatField
      FieldName = 'FCP_VBCFCPST'
    end
    object cdsINfFCP_PFCPST: TFloatField
      FieldName = 'FCP_PFCPST'
    end
    object cdsINfFCP_VFCPST: TFloatField
      FieldName = 'FCP_VFCPST'
    end
    object cdsINfFCP_VBCFCPUFDEST: TFloatField
      FieldName = 'FCP_VBCFCPUFDEST'
    end
    object cdsINfFCP_VBCFCPSTRET: TFloatField
      FieldName = 'FCP_VBCFCPSTRET'
    end
    object cdsINfFCP_PFCPSTRET: TFloatField
      FieldName = 'FCP_PFCPSTRET'
    end
    object cdsINfFCP_VFCPSTRET: TFloatField
      FieldName = 'FCP_VFCPSTRET'
    end
    object cdsINfNFE_INDESCALA: TStringField
      DisplayLabel = 'Indicador de escala relevante'
      FieldName = 'NFE_INDESCALA'
      Size = 1
    end
    object cdsINfNFE_CNPJFAB: TStringField
      DisplayLabel = 'CNPJ do Fabricante'
      FieldName = 'NFE_CNPJFAB'
      Size = 14
    end
    object cdsINfNFE_CBENEF: TStringField
      DisplayLabel = 'Codigo de Beneficio Fiscal'
      FieldName = 'NFE_CBENEF'
      Size = 10
    end
    object cdsINfIPI_CNPJPROD: TStringField
      DisplayLabel = 'CNPJ do Produtor'
      FieldName = 'IPI_CNPJPROD'
      Size = 14
    end
    object cdsINfIPI_CSELO: TStringField
      DisplayLabel = 'Codigo do selo de controle IPI'
      FieldName = 'IPI_CSELO'
      Size = 60
    end
    object cdsINfIPI_QSELO: TIntegerField
      FieldName = 'IPI_QSELO'
    end
    object cdsINfCEAN: TStringField
      FieldName = 'CEAN'
      Size = 14
    end
    object cdsINfPREDBCEFET: TFloatField
      FieldName = 'PREDBCEFET'
    end
    object cdsINfVBCEFET: TFloatField
      FieldName = 'VBCEFET'
    end
    object cdsINfPICMSEFET: TFloatField
      FieldName = 'PICMSEFET'
    end
    object cdsINfVICMSEFET: TFloatField
      FieldName = 'VICMSEFET'
    end
    object cdsINfUTRIB: TStringField
      DisplayLabel = 'Unid trib'
      FieldName = 'UTRIB'
      Size = 6
    end
    object cdsINfQTRIB: TFloatField
      DisplayLabel = 'Qtde trib'
      FieldName = 'QTRIB'
    end
    object cdsINfICM_ORIG: TStringField
      FieldName = 'ICM_ORIG'
      FixedChar = True
      Size = 1
    end
    object cdsINfICM_CST: TStringField
      FieldName = 'ICM_CST'
      Size = 2
    end
    object cdsINfICM_CSOSN: TStringField
      FieldName = 'ICM_CSOSN'
      Size = 3
    end
    object cdsINfICM_PRED: TFloatField
      FieldName = 'ICM_PRED'
    end
    object cdsINfICM_VBC: TFloatField
      FieldName = 'ICM_VBC'
    end
    object cdsINfICM_PICM: TFloatField
      FieldName = 'ICM_PICM'
    end
    object cdsINfICM_VICM: TFloatField
      FieldName = 'ICM_VICM'
    end
    object cdsINfICM_VBCFCP: TFloatField
      FieldName = 'ICM_VBCFCP'
    end
    object cdsINfICM_PFCP: TFloatField
      FieldName = 'ICM_PFCP'
    end
    object cdsINfICM_VFCP: TFloatField
      FieldName = 'ICM_VFCP'
    end
    object cdsINfICM_MODBCST: TStringField
      FieldName = 'ICM_MODBCST'
      FixedChar = True
      Size = 1
    end
    object cdsINfICM_PMVAST: TFloatField
      FieldName = 'ICM_PMVAST'
    end
    object cdsINfICM_PREDBCST: TFloatField
      FieldName = 'ICM_PREDBCST'
    end
    object cdsINfICM_VBCST: TFloatField
      FieldName = 'ICM_VBCST'
    end
    object cdsINfICM_PICMST: TFloatField
      FieldName = 'ICM_PICMST'
    end
    object cdsINfICM_VICMST: TFloatField
      FieldName = 'ICM_VICMST'
    end
    object cdsINfICM_VBCFCPST: TFloatField
      FieldName = 'ICM_VBCFCPST'
    end
    object cdsINfICM_PFCPST: TFloatField
      FieldName = 'ICM_PFCPST'
    end
    object cdsINfICM_VFCPST: TFloatField
      FieldName = 'ICM_VFCPST'
    end
    object cdsINfICM_VICMDESON: TFloatField
      FieldName = 'ICM_VICMDESON'
    end
    object cdsINfICM_VBCSTRET: TFloatField
      FieldName = 'ICM_VBCSTRET'
    end
    object cdsINfICM_PST: TFloatField
      FieldName = 'ICM_PST'
    end
    object cdsINfICM_VICMSSUBSTITUTO: TFloatField
      FieldName = 'ICM_VICMSSUBSTITUTO'
    end
    object cdsINfICM_VICMSSTRET: TFloatField
      FieldName = 'ICM_VICMSSTRET'
    end
    object cdsINfICM_VBCFCPSTRET: TFloatField
      FieldName = 'ICM_VBCFCPSTRET'
    end
    object cdsINfICM_PFCPSTRET: TFloatField
      FieldName = 'ICM_PFCPSTRET'
    end
    object cdsINfICM_VFCPSTRET: TFloatField
      FieldName = 'ICM_VFCPSTRET'
    end
    object cdsINfANT_PST: TFloatField
      FieldName = 'ANT_PST'
    end
    object cdsINfANT_VICMSSUBSTITUTO: TFloatField
      FieldName = 'ANT_VICMSSUBSTITUTO'
    end
    object cdsINfIND_DESONERACAO: TIntegerField
      DisplayLabel = 'Motivo Desonera'#231#227'o ICMS'
      FieldName = 'IND_DESONERACAO'
    end
    object cdsINfVICMDESON: TFloatField
      DisplayLabel = 'ICMS Deson'
      FieldName = 'VICMDESON'
    end
    object cdsINfTIPO_CALC: TSmallintField
      DisplayLabel = 'Tipo de C'#225'lculo'
      FieldName = 'TIPO_CALC'
    end
    object cdsINfTIPO_CALC_PC: TSmallintField
      DisplayLabel = 'Tipo de C'#225'lculo PisCofins'
      FieldName = 'TIPO_CALC_PC'
    end
    object cdsINfPDIF: TFloatField
      DisplayLabel = '% ICMS Diferido'
      FieldName = 'PDIF'
    end
    object cdsINfVICMSOP_DIF: TFloatField
      DisplayLabel = 'Dif. ICMS Op'
      FieldName = 'VICMSOP_DIF'
    end
    object cdsINfVICMSDIF: TFloatField
      DisplayLabel = 'Valor ICMS Diferido'
      FieldName = 'VICMSDIF'
    end
    object cdsINfPFCPDIF: TFloatField
      DisplayLabel = '% FCP Diferido'
      FieldName = 'PFCPDIF'
    end
    object cdsINfVFCPEFET_DIF: TFloatField
      FieldName = 'VFCPEFET_DIF'
    end
    object cdsINfVFCPDIF: TFloatField
      FieldName = 'VFCPDIF'
    end
    object cdsINfMOTDES_PC: TSmallintField
      FieldName = 'MOTDES_PC'
    end
    object cdsINfVPISDESON: TFloatField
      DisplayLabel = 'Valor PIS Desonerado'
      FieldName = 'VPISDESON'
    end
    object cdsINfVCOFINSDESON: TFloatField
      DisplayLabel = 'Valor COFINS Desonerado'
      FieldName = 'VCOFINSDESON'
    end
    object cdsINfOPF_ICMS_ID: TIntegerField
      DisplayLabel = 'Op ICMS Id'
      FieldName = 'OPF_ICMS_ID'
    end
    object cdsINfOPF_PC_ID: TIntegerField
      DisplayLabel = 'Op PISCOFINS Id'
      FieldName = 'OPF_PC_ID'
    end
    object cdsINfPPISDESON: TFloatField
      FieldName = 'PPISDESON'
    end
    object cdsINfPCOFINSDESON: TFloatField
      FieldName = 'PCOFINSDESON'
    end
    object cdsINfICM_PDIF: TFloatField
      FieldName = 'ICM_PDIF'
    end
    object cdsINfICM_VICMSDIF: TFloatField
      FieldName = 'ICM_VICMSDIF'
    end
    object cdsINfICM_PFCPDIF: TFloatField
      FieldName = 'ICM_PFCPDIF'
    end
    object cdsINfICM_VFCPDIF: TFloatField
      FieldName = 'ICM_VFCPDIF'
    end
    object cdsINfICM_VICMSOP_DIF: TFloatField
      FieldName = 'ICM_VICMSOP_DIF'
    end
    object cdsINfICM_VFCPEFET_DIF: TFloatField
      FieldName = 'ICM_VFCPEFET_DIF'
    end
    object cdsINfALIQ_ANT_ST: TFloatField
      FieldName = 'ALIQ_ANT_ST'
    end
    object cdsINfESPELHO_CALC: TMemoField
      DisplayLabel = 'Espelho Calc ICMS'
      FieldName = 'ESPELHO_CALC'
      BlobType = ftMemo
    end
    object cdsINfPRCTB_ITEM3: TFloatField
      DisplayLabel = 'Markup 30'
      FieldName = 'PRCTB_ITEM3'
    end
    object cdsINfPRCTB_ITEM6: TFloatField
      DisplayLabel = 'Markup 60'
      FieldName = 'PRCTB_ITEM6'
    end
    object cdsINfPRCTB_ITEM9: TFloatField
      DisplayLabel = 'Markup 90'
      FieldName = 'PRCTB_ITEM9'
    end
    object cdsINfMARGEM_V_CALC: TFloatField
      DisplayLabel = 'Margem Varejo'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_V_CALC'
    end
    object cdsINfMARGEM_A_CALC: TFloatField
      DisplayLabel = 'Margem Atacado'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_A_CALC'
    end
    object cdsINfMARGEM_30_CALC: TFloatField
      DisplayLabel = 'Margem 30'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_30_CALC'
    end
    object cdsINfMARGEM_60_CALC: TFloatField
      DisplayLabel = 'Margem 60'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_60_CALC'
    end
    object cdsINfMARGEM_90_CALC: TFloatField
      DisplayLabel = 'Margem 90'
      FieldKind = fkInternalCalc
      FieldName = 'MARGEM_90_CALC'
    end
    object cdsINfPRECO_CALC_V: TFloatField
      DisplayLabel = 'Preco Varejo'
      FieldKind = fkInternalCalc
      FieldName = 'PRECO_CALC_V'
    end
    object cdsINfPRECO_CALC_A: TFloatField
      DisplayLabel = 'Preco Atacado'
      FieldKind = fkInternalCalc
      FieldName = 'PRECO_CALC_A'
    end
    object cdsINfPRECO_CALC_3: TFloatField
      DisplayLabel = 'Preco 30'
      FieldKind = fkInternalCalc
      FieldName = 'PRECO_CALC_3'
    end
    object cdsINfPRECO_CALC_6: TFloatField
      DisplayLabel = 'Preco 60'
      FieldKind = fkInternalCalc
      FieldName = 'PRECO_CALC_6'
    end
    object cdsINfPRECO_CALC_9: TFloatField
      DisplayLabel = 'Preco 90'
      FieldKind = fkInternalCalc
      FieldName = 'PRECO_CALC_9'
    end
    object cdsINfPERCENT_CALC_V: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERCENT_CALC_V'
    end
    object cdsINfPERCENT_CALC_A: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERCENT_CALC_A'
    end
    object cdsINfPERCENT_CALC_3: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERCENT_CALC_3'
    end
    object cdsINfPERCENT_CALC_6: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERCENT_CALC_6'
    end
    object cdsINfPERCENT_CALC_9: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PERCENT_CALC_9'
    end
    object cdsINfCBARRA: TStringField
      DisplayLabel = 'Codigo de Barras'
      FieldName = 'CBARRA'
      Size = 30
    end
    object cdsINfINDSOMAPISST: TSmallintField
      DisplayLabel = 'Ind Soma PIS ST'
      FieldName = 'INDSOMAPISST'
    end
    object cdsINfINDSOMACOFINSST: TSmallintField
      DisplayLabel = 'Ind Soma COFINS ST'
      FieldName = 'INDSOMACOFINSST'
    end
    object cdsINfUCOM: TStringField
      DisplayLabel = 'Unidade comercial NF'
      FieldName = 'UCOM'
      Size = 6
    end
    object cdsINfQCOM: TFloatField
      DisplayLabel = 'Qtde Comercial'
      FieldName = 'QCOM'
    end
    object cdsINfBCAJUSTE: TFloatField
      DisplayLabel = 'BC Ajuste'
      FieldName = 'BCAJUSTE'
    end
    object cdsINfVAJUSTE: TFloatField
      DisplayLabel = 'Valor ajuste'
      FieldName = 'VAJUSTE'
    end
    object cdsINfPAJUSTE: TFloatField
      DisplayLabel = 'Aliq Ajuste'
      FieldName = 'PAJUSTE'
    end
    object cdsINfTRIB_SEFAZ_ID: TStringField
      DisplayLabel = 'Tributacao Sefaz ID'
      FieldName = 'TRIB_SEFAZ_ID'
      Size = 16
    end
    object cdsINfMED_CPRODANVISA: TStringField
      FieldName = 'MED_CPRODANVISA'
      Size = 13
    end
    object cdsINfMED_VPMC: TFloatField
      FieldName = 'MED_VPMC'
    end
    object cdsINfRASTRO_NLOTE: TStringField
      FieldName = 'RASTRO_NLOTE'
    end
    object cdsINfRASTRO_QLOTE: TFloatField
      FieldName = 'RASTRO_QLOTE'
    end
    object cdsINfRASTRO_DFAB: TDateTimeField
      FieldName = 'RASTRO_DFAB'
    end
    object cdsINfRASTRO_DVAL: TDateTimeField
      FieldName = 'RASTRO_DVAL'
    end
    object cdsINfQBCMONO: TFloatField
      DisplayLabel = 'Qtde Base ICMS Monofasico'
      FieldName = 'QBCMONO'
    end
    object cdsINfADREMICMS: TFloatField
      DisplayLabel = 'Aliq ad rem ICMS Monofasico'
      FieldName = 'ADREMICMS'
    end
    object cdsINfVICMSMONO: TFloatField
      DisplayLabel = 'Valor ICMS Monofasico'
      FieldName = 'VICMSMONO'
    end
    object cdsINfQBCMONORETEN: TFloatField
      DisplayLabel = 'Qtde Base ICMS Monofasico suj. a Reten'#231#227'o'
      FieldName = 'QBCMONORETEN'
    end
    object cdsINfADREMICMSRETEN: TFloatField
      DisplayLabel = 'Aliq ad rem ICMS Monofasico Suj/ a Reten'#231#227'o'
      FieldName = 'ADREMICMSRETEN'
    end
    object cdsINfVICMSMONORETEN: TFloatField
      DisplayLabel = 'Valor ICMS Monofasico suj. a Reten'#231#227'o'
      FieldName = 'VICMSMONORETEN'
    end
    object cdsINfQBCMONORET: TFloatField
      DisplayLabel = 'Qtde Base ICMS Monofasico cobrado em op Anterior'
      FieldName = 'QBCMONORET'
    end
    object cdsINfADREMICMSRET: TFloatField
      DisplayLabel = 'Aliq ad rem ICMS Monofasico cobrado em op Anterior'
      FieldName = 'ADREMICMSRET'
    end
    object cdsINfVICMSMONORET: TFloatField
      DisplayLabel = 'Valor ICMS Monofasico cobrado em op Anterior'
      FieldName = 'VICMSMONORET'
    end
    object cdsINfICM_QBCMONO: TFloatField
      FieldName = 'ICM_QBCMONO'
    end
    object cdsINfICM_ADREMICMS: TFloatField
      FieldName = 'ICM_ADREMICMS'
    end
    object cdsINfICM_VICMSMONO: TFloatField
      FieldName = 'ICM_VICMSMONO'
    end
    object cdsINfICM_QBCMONORETEN: TFloatField
      FieldName = 'ICM_QBCMONORETEN'
    end
    object cdsINfICM_ADREMICMSRETEN: TFloatField
      FieldName = 'ICM_ADREMICMSRETEN'
    end
    object cdsINfICM_VICMSMONORETEN: TFloatField
      FieldName = 'ICM_VICMSMONORETEN'
    end
    object cdsINfICM_QBCMONORET: TFloatField
      FieldName = 'ICM_QBCMONORET'
    end
    object cdsINfICM_ADREMICMSRET: TFloatField
      FieldName = 'ICM_ADREMICMSRET'
    end
    object cdsINfICM_VICMSMONORET: TFloatField
      FieldName = 'ICM_VICMSMONORET'
    end
    object cdsINfVUNCOM: TFloatField
      FieldName = 'VUNCOM'
    end
    object cdsINfUVND: TStringField
      DisplayLabel = 'Und'
      FieldKind = fkInternalCalc
      FieldName = 'UVND'
      Size = 6
    end
    object cdsINfQVND: TFloatField
      DisplayLabel = 'Quantidade'
      FieldKind = fkInternalCalc
      FieldName = 'QVND'
    end
    object cdsINfVVND: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldKind = fkInternalCalc
      FieldName = 'VVND'
    end
    object cdsINfPARIDADE: TStringField
      DisplayLabel = 'Fator Unidade'
      FieldKind = fkInternalCalc
      FieldName = 'PARIDADE'
      Size = 64
    end
    object cdsINfTIPO_CALC_RETFED: TSmallintField
      DisplayLabel = 'Tipo Calc Ret Fed'
      FieldName = 'TIPO_CALC_RETFED'
    end
    object cdsINfVBCRETFED: TFloatField
      DisplayLabel = 'Base Calc Ret Federal'
      FieldName = 'VBCRETFED'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfPRETIR: TFloatField
      DisplayLabel = 'Aliq Ret IR'
      FieldName = 'PRETIR'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfPRETCSLL: TFloatField
      DisplayLabel = 'Aliq Ret CSLL'
      FieldName = 'PRETCSLL'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfPRETPIS: TFloatField
      DisplayLabel = 'Aliq Ret PIS'
      FieldName = 'PRETPIS'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfPRETCOFINS: TFloatField
      DisplayLabel = 'Aliq Ret COFINS'
      FieldName = 'PRETCOFINS'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfVRETIR: TFloatField
      DisplayLabel = 'Valor Ret IR'
      FieldName = 'VRETIR'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfVRETCSLL: TFloatField
      DisplayLabel = 'Valor Ret CSLL'
      FieldName = 'VRETCSLL'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfVRETPIS: TFloatField
      DisplayLabel = 'Valor Ret PIS'
      FieldName = 'VRETPIS'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfVRETCOFINS: TFloatField
      DisplayLabel = 'Valor Ret COFINS'
      FieldName = 'VRETCOFINS'
      DisplayFormat = '#,##0.00'
    end
    object cdsINfOPF_RET_ID: TIntegerField
      FieldName = 'OPF_RET_ID'
    end
    object cdsINfPESO_B_TOTAL: TFloatField
      DisplayLabel = 'Peso Bruto Total'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_B_TOTAL'
    end
    object cdsINfNITEM_XML: TIntegerField
      DisplayLabel = 'N'#186' Item XML'
      FieldName = 'NITEM_XML'
    end
    object cdsINfCHAVE_NFE_REF: TStringField
      DisplayLabel = 'Chave NFe referenciada'
      FieldName = 'CHAVE_NFE_REF'
      Size = 44
    end
    object cdsINfNITEM_NFE_REF: TIntegerField
      DisplayLabel = 'N'#186' Item NFe referenciada'
      FieldName = 'NITEM_NFE_REF'
    end
    object cdsINfVITEM: TBCDField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'VITEM'
      Size = 2
    end
    object cdsINfDFE_TRIB_ID: TStringField
      Tag = 1
      DisplayLabel = 'Tributos DFe Id'
      FieldName = 'DFE_TRIB_ID'
      Visible = False
      Size = 36
    end
    object cdsINfDFE_TRIB_ID_XML: TStringField
      Tag = 1
      DisplayLabel = 'Tributos DFe Id Entrada'
      FieldName = 'DFE_TRIB_ID_XML'
      Visible = False
      Size = 36
    end
    object cdsINfNBS: TStringField
      FieldName = 'NBS'
      Size = 9
    end
  end
  object dsINf: TDataSource
    AutoEdit = False
    DataSet = cdsINf
    Left = 72
    Top = 216
  end
  object qrDVNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_ITEM_VEICULO')
    Left = 120
    Top = 72
  end
  object dspDVNf: TDataSetProvider
    DataSet = qrDVNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 120
    Top = 120
  end
  object cdsDVNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVNf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 120
    Top = 168
    object cdsDVNfCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsDVNfCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDVNfNITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsDVNfCHASSI: TStringField
      FieldName = 'CHASSI'
      Required = True
      FixedChar = True
      Size = 17
    end
    object cdsDVNfMARCA: TStringField
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsDVNfVERSAO: TIntegerField
      FieldName = 'VERSAO'
    end
    object cdsDVNfDESCRICAO_VERSAO: TStringField
      FieldName = 'DESCRICAO_VERSAO'
      Size = 60
    end
    object cdsDVNfANO_FAB: TIntegerField
      FieldName = 'ANO_FAB'
    end
    object cdsDVNfANO_MOD: TIntegerField
      FieldName = 'ANO_MOD'
    end
    object cdsDVNfCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object cdsDVNfCILINDROS: TIntegerField
      FieldName = 'CILINDROS'
    end
    object cdsDVNfCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      FixedChar = True
      Size = 50
    end
    object cdsDVNfCILINDRADA: TFloatField
      FieldName = 'CILINDRADA'
    end
    object cdsDVNfHP: TFloatField
      FieldName = 'HP'
    end
    object cdsDVNfLOTACAO: TStringField
      FieldName = 'LOTACAO'
      FixedChar = True
      Size = 10
    end
    object cdsDVNfTIPO: TStringField
      FieldName = 'TIPO'
      Size = 30
    end
    object cdsDVNfRENAVAM: TStringField
      DisplayWidth = 6
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 6
    end
    object cdsDVNfPRECO_TAB: TFloatField
      FieldName = 'PRECO_TAB'
      DisplayFormat = '##0.00'
    end
    object cdsDVNfFRETE_AQUISICAO: TFloatField
      FieldName = 'FRETE_AQUISICAO'
      DisplayFormat = '##0.00'
    end
    object cdsDVNfFRETE_VENDA: TFloatField
      FieldName = 'FRETE_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsDVNfOBS_ITEM: TStringField
      FieldName = 'OBS_ITEM'
      Size = 30
    end
    object cdsDVNfMOTOR: TStringField
      FieldName = 'MOTOR'
      Size = 21
    end
    object cdsDVNfPLACA: TStringField
      FieldName = 'PLACA'
      FixedChar = True
      Size = 10
    end
    object cdsDVNfCERTIFICADO: TStringField
      FieldName = 'CERTIFICADO'
      FixedChar = True
      Size = 9
    end
    object cdsDVNfDATA_CERTIFICADO: TDateTimeField
      FieldName = 'DATA_CERTIFICADO'
    end
    object cdsDVNfCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 10
    end
    object cdsDVNfNF_AQ: TIntegerField
      FieldName = 'NF_AQ'
    end
    object cdsDVNfSERIE_AQ: TStringField
      FieldName = 'SERIE_AQ'
      Size = 5
    end
    object cdsDVNfCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsDVNfDAT_CADM: TDateTimeField
      FieldName = 'DAT_CADM'
    end
    object cdsDVNfPRECOCOMPRA: TFloatField
      FieldName = 'PRECOCOMPRA'
      DisplayFormat = '##0.00'
    end
    object cdsDVNfPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
      DisplayFormat = '##0.00'
    end
    object cdsDVNfTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsDVNfESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsDVNfNSERIE: TStringField
      FieldName = 'NSERIE'
      Size = 9
    end
    object cdsDVNfTIP_PINTURA: TStringField
      FieldName = 'TIP_PINTURA'
      FixedChar = True
      Size = 1
    end
    object cdsDVNfCOD_COR: TIntegerField
      FieldName = 'COD_COR'
    end
    object cdsDVNfCOM_ENT: TIntegerField
      FieldName = 'COM_ENT'
    end
    object cdsDVNfSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 15
    end
    object cdsDVNfRED_LUCRO: TStringField
      FieldName = 'RED_LUCRO'
      FixedChar = True
      Size = 1
    end
    object cdsDVNfDADOS_V: TMemoField
      FieldName = 'DADOS_V'
      BlobType = ftMemo
      Size = 8
    end
    object cdsDVNfTIPO_COMANDO: TStringField
      FieldName = 'TIPO_COMANDO'
      Size = 4
    end
    object cdsDVNfN_COMANDO: TIntegerField
      FieldName = 'N_COMANDO'
    end
    object cdsDVNfATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsDVNfPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
      DisplayFormat = '##0.00'
    end
    object cdsDVNfTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object cdsDVNfTPCOMB: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'TPCOMB'
      FixedChar = True
      Size = 2
    end
    object cdsDVNfTPREST: TStringField
      DisplayLabel = 'Restri'#231#227'o'
      FieldName = 'TPREST'
      FixedChar = True
      Size = 1
    end
    object cdsDVNfCOD_FORN_AQ: TIntegerField
      FieldName = 'COD_FORN_AQ'
    end
    object cdsDVNfDATA_AQ: TDateTimeField
      FieldName = 'DATA_AQ'
    end
    object cdsDVNfPRECO_CUSTO: TFloatField
      Tag = 1
      FieldName = 'PRECO_CUSTO'
    end
    object cdsDVNfCOD_MARCA: TIntegerField
      Tag = 1
      FieldName = 'COD_MARCA'
    end
    object cdsDVNfCOD_COMBUSTIVEL: TIntegerField
      Tag = 1
      FieldName = 'COD_COMBUSTIVEL'
    end
    object cdsDVNfCOD_TIPO_ESP: TIntegerField
      Tag = 1
      FieldName = 'COD_TIPO_ESP'
    end
    object cdsDVNfTIPV_VEICULO: TStringField
      Tag = 1
      FieldName = 'TIPV_VEICULO'
      FixedChar = True
      Size = 1
    end
    object cdsDVNfCOD_ESTMOTO: TIntegerField
      Tag = 1
      FieldName = 'COD_ESTMOTO'
    end
  end
  object dsDVNf: TDataSource
    AutoEdit = False
    DataSet = cdsDVNf
    Left = 120
    Top = 216
  end
  object qrDENf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_ITEM_ECF')
    Left = 168
    Top = 72
  end
  object dspDENf: TDataSetProvider
    DataSet = qrDENf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 168
    Top = 120
  end
  object cdsDENf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDENf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 168
    Top = 168
    object cdsDENfCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsDENfCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDENfNITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsDENfN_SERIE_FAB: TStringField
      FieldName = 'N_SERIE_FAB'
      Required = True
    end
    object cdsDENfCNIEE: TStringField
      FieldName = 'CNIEE'
      FixedChar = True
      Size = 6
    end
    object cdsDENfTIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
    end
    object cdsDENfMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object cdsDENfMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsDENfVERSAOSB: TStringField
      FieldName = 'VERSAOSB'
    end
    object cdsDENfN_MEMORIA_FISCAL: TStringField
      FieldName = 'N_MEMORIA_FISCAL'
    end
    object cdsDENfLACRE_EXTERNO1: TStringField
      FieldName = 'LACRE_EXTERNO1'
      Size = 12
    end
    object cdsDENfLACRE_EXTERNO2: TStringField
      FieldName = 'LACRE_EXTERNO2'
      Size = 12
    end
    object cdsDENfLACRE_EXTERNO3: TStringField
      FieldName = 'LACRE_EXTERNO3'
      Size = 12
    end
    object cdsDENfLACRE_EXTERNO4: TStringField
      FieldName = 'LACRE_EXTERNO4'
      Size = 12
    end
    object cdsDENfNNF_ENTRADA: TIntegerField
      FieldName = 'NNF_ENTRADA'
    end
    object cdsDENfSERIE_ENTRADA: TStringField
      FieldName = 'SERIE_ENTRADA'
      Size = 5
    end
    object cdsDENfGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsDENfCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsDENfATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsDENfTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsDENfCOD_NSERIE: TIntegerField
      FieldName = 'COD_NSERIE'
    end
  end
  object dsDENf: TDataSource
    AutoEdit = False
    DataSet = cdsDENf
    Left = 168
    Top = 216
  end
  object transacaoNF: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 1
  end
  object qrBuscasNF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    Left = 321
    Top = 1
  end
  object qrRedProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from REDUCAO')
    Left = 408
    Top = 272
  end
  object dspRedProd: TDataSetProvider
    DataSet = qrRedProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 408
    Top = 320
  end
  object cdsRedProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRedProd'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 408
    Top = 368
    object cdsRedProdCOD_REDUCAO: TIntegerField
      FieldName = 'COD_REDUCAO'
      Required = True
    end
    object cdsRedProdCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRedProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsRedProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsRedProdDENTRO_EST: TIntegerField
      FieldName = 'DENTRO_EST'
    end
    object cdsRedProdISENTO: TIntegerField
      FieldName = 'ISENTO'
    end
    object cdsRedProdALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
    end
    object cdsRedProdPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object cdsRedProdATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsRedProd: TDataSource
    DataSet = cdsRedProd
    Left = 408
    Top = 416
  end
  object qrNatOpD: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from NAT_OP_DESCRICAO')
    Left = 480
    Top = 272
  end
  object dspNatOpD: TDataSetProvider
    DataSet = qrNatOpD
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 480
    Top = 320
  end
  object cdsNatOpD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatOpD'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 480
    Top = 368
    object cdsNatOpDCODIGO_NOP: TFloatField
      DisplayLabel = 'Cfop'
      FieldName = 'CODIGO_NOP'
    end
    object cdsNatOpDDESCRICAO_NOP: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_NOP'
      Required = True
      Size = 100
    end
  end
  object dsNatOpD: TDataSource
    DataSet = cdsNatOpD
    Left = 480
    Top = 416
  end
  object qrNatOpItNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      
        'select CODIGO_NOP, DESCRICAO_NOP, PRECC, COMIMP, SEM_IMPOSTO, CA' +
        'LC_CUSTO, ALT_EST, TIPV_VEICULO from NAT_OP')
    Left = 552
    Top = 272
  end
  object dspNatOpItNf: TDataSetProvider
    DataSet = qrNatOpItNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 552
    Top = 320
  end
  object cdsNatOpItNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatOpItNf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 552
    Top = 368
    object cdsNatOpItNfCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsNatOpItNfDESCRICAO_NOP: TStringField
      FieldName = 'DESCRICAO_NOP'
      Size = 100
    end
    object cdsNatOpItNfPRECC: TStringField
      FieldName = 'PRECC'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpItNfCOMIMP: TStringField
      FieldName = 'COMIMP'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpItNfSEM_IMPOSTO: TStringField
      FieldName = 'SEM_IMPOSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpItNfCALC_CUSTO: TStringField
      FieldName = 'CALC_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpItNfALT_EST: TStringField
      FieldName = 'ALT_EST'
      FixedChar = True
      Size = 1
    end
    object cdsNatOpItNfTIPV_VEICULO: TStringField
      FieldName = 'TIPV_VEICULO'
      FixedChar = True
      Size = 1
    end
  end
  object dsNatOpItNf: TDataSource
    DataSet = cdsNatOpItNf
    Left = 552
    Top = 416
  end
  object qrPedNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select'
      'pv.nped,'
      'pv.tipo,'
      'pv.valor_total,'
      'pv.cod_cliente,'
      'c.nome_cliente,'
      'pv.data_ped,'
      'pv.data_fech,'
      'pv.operador,'
      'pv.ncupom,'
      'pv.nserieecf,'
      'pv.data_cupom,'
      'pv.num_nf,'
      'pv.OBS_OS,'
      'pv.OBS_TPVENDA,'
      'pv.cod_cond_pag,'
      'pv.cod_vendedor,'
      'pv.num_nfeext,'
      'pv.cod_carga'
      'from pedvenda pv'
      
        'inner join clientes c on c.cod_cliente = pv.cod_cliente and c.co' +
        'd_empresa = pv.cod_empresa')
    Left = 624
    Top = 272
  end
  object dspPedNf: TDataSetProvider
    DataSet = qrPedNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 624
    Top = 320
  end
  object cdsPedNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedNf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 624
    Top = 368
    object cdsPedNfNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsPedNfTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPedNfVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '##0.00'
    end
    object cdsPedNfCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPedNfNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsPedNfDATA_PED: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_PED'
    end
    object cdsPedNfDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
    end
    object cdsPedNfOPERADOR: TIntegerField
      DisplayLabel = 'Terminal ECF'
      FieldName = 'OPERADOR'
    end
    object cdsPedNfNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
    end
    object cdsPedNfNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsPedNfDATA_CUPOM: TDateTimeField
      DisplayLabel = 'Data Cupom'
      FieldName = 'DATA_CUPOM'
    end
    object cdsPedNfNUM_NF: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NUM_NF'
    end
    object cdsPedNfOBS_OS: TMemoField
      FieldName = 'OBS_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedNfCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
    end
    object cdsPedNfCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsPedNfCOD_CARGA: TIntegerField
      DisplayLabel = 'Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsPedNfNUM_NFEEXT: TLargeintField
      FieldName = 'NUM_NFEEXT'
    end
    object cdsPedNfSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsPedNfDADOS_NFCE: TStringField
      DisplayLabel = 'NFC-e'
      FieldName = 'DADOS_NFCE'
      Size = 35
    end
    object cdsPedNfCOD_NFCE: TIntegerField
      FieldName = 'COD_NFCE'
    end
    object cdsPedNfDEST_SEQID: TIntegerField
      FieldName = 'DEST_SEQID'
    end
    object cdsPedNfNF_AC_CALCTRIB: TStringField
      DisplayLabel = 'Calc NF'
      FieldName = 'NF_AC_CALCTRIB'
      Size = 1
    end
    object cdsPedNfNF_AC_SEGURO: TFloatField
      DisplayLabel = 'Seg'
      FieldName = 'NF_AC_SEGURO'
    end
    object cdsPedNfNF_AC_OUTRAS: TFloatField
      DisplayLabel = 'Outras'
      FieldName = 'NF_AC_OUTRAS'
    end
    object cdsPedNfNF_AC_FRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'NF_AC_FRETE'
    end
    object cdsPedNfNF_FRETECONTA: TStringField
      DisplayLabel = 'Frete conta'
      FieldName = 'NF_FRETECONTA'
      Size = 1
    end
    object cdsPedNfTOT_PROD: TFloatField
      DisplayLabel = 'Total Prod'
      FieldName = 'TOT_PROD'
    end
    object cdsPedNfFINALIDADEID: TIntegerField
      DisplayLabel = 'Finalidade Id'
      FieldName = 'FINALIDADEID'
    end
    object cdsPedNfOBS_TPVENDA: TMemoField
      FieldName = 'OBS_TPVENDA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedNfCOD_CLI_FAT: TIntegerField
      FieldName = 'COD_CLI_FAT'
    end
  end
  object dsPedNf: TDataSource
    AutoEdit = False
    DataSet = cdsPedNf
    Left = 624
    Top = 416
  end
  object qrItPedNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select'
      #39'P'#39' tipo_item,'
      'pvp.nped,'
      'pvp.tipo,'
      'pvp.nitem,'
      'pvp.num_fab_prod,'
      'pvp.descr_prod_ped,'
      'pvp.quant_ped_item,'
      'pvp.vltot_ped_item,'
      'pvp.vltot_ped_nf,'
      '(pvp.acresc_item + pvp.rateio_acresc) acrescimo,'
      '(pvp.desc_item + pvp.rateio_desc) desconto,'
      'pvp.codigo_nop,'
      'pvp.grupo_prod,'
      'pvp.cod_prod,'
      'pvp.n_nf,'
      'pvp.serie'
      'from pedvenda_prod pvp'
      'where pvp.nped = :nped'
      'and pvp.tipo = :tipo'
      'union'
      'select'
      #39'S'#39' ,'
      'pvs.nped,'
      'pvs.tipo,'
      'pvs.nitem,'
      'pvs.cod_servico,'
      'pvs.desc_serv_ped,'
      'pvs.quant_serv_ped,'
      'pvs.valor_tot_serv,'
      'pvs.valor_tot_serv,'
      '(pvs.acresc_item + pvs.rateio_acresc) acrescimo,'
      '(pvs.desc_item + pvs.rateio_desc) desconto,'
      'pvs.codigo_nop,'
      'null,'
      'null,'
      'pvs.n_nf,'
      'pvs.serie'
      'from pedvenda_serv pvs'
      'where pvs.nped = :nped'
      'and pvs.tipo = :tipo'
      'union'
      'select'
      #39'T'#39','
      'pvt.nped,'
      'pvt.tipo,'
      '0,'
      '0,'
      'pvt.descr_servt,'
      '1,'
      'pvt.vl_servt,'
      'pvt.vl_servt,'
      '0 acrescimo,'
      '0 desconto,'
      'e.cfop_pad_serv,'
      'null,'
      'null,'
      'null,'
      'null'
      'from pedvenda_serv_terc pvt'
      'inner join empresa e on e.cod_empresa = pvt.cod_empresa'
      'where pvt.nped = :nped'
      'and pvt.tipo = :tipo')
    Left = 680
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object dspItPedNf: TDataSetProvider
    DataSet = qrItPedNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 680
    Top = 320
  end
  object cdsItPedNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItPedNf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 680
    Top = 368
    object cdsItPedNfTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsItPedNfNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
      Visible = False
    end
    object cdsItPedNfTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsItPedNfNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object cdsItPedNfNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo / Chave'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsItPedNfDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o do Item'
      FieldName = 'DESCR_PROD_PED'
      Size = 75
    end
    object cdsItPedNfUVND: TStringField
      DisplayLabel = 'Und'
      FieldName = 'UVND'
      Size = 6
    end
    object cdsItPedNfQVND: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QVND'
    end
    object cdsItPedNfQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANT_PED_ITEM'
      DisplayFormat = '##0.000'
    end
    object cdsItPedNfVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Valor Venda'
      FieldName = 'VLTOT_PED_ITEM'
      DisplayFormat = '##0.00'
    end
    object cdsItPedNfVLTOT_PED_NF: TFloatField
      DisplayLabel = 'Valor NF'
      FieldName = 'VLTOT_PED_NF'
      DisplayFormat = '##0.00'
    end
    object cdsItPedNfACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      DisplayFormat = '##0.00'
    end
    object cdsItPedNfDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      DisplayFormat = '##0.00'
    end
    object cdsItPedNfCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsItPedNfGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      DisplayFormat = '00000'
    end
    object cdsItPedNfCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsItPedNfN_NF: TLargeintField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'N_NF'
    end
    object cdsItPedNfSERIE: TStringField
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsItPedNfXPED_COMPRA: TStringField
      DisplayLabel = 'N'#176' Pedido Compra Cliente'
      FieldName = 'XPED_COMPRA'
      Size = 15
    end
    object cdsItPedNfNITEMPED_COMPRA: TIntegerField
      DisplayLabel = 'N'#176' Item no Pedido Compra Cliente'
      FieldName = 'NITEMPED_COMPRA'
    end
    object cdsItPedNfPCUST_MC: TFloatField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'PCUST_MC'
      DisplayFormat = '#0.00'
    end
    object cdsItPedNfVL_DESP_NF: TFloatField
      DisplayLabel = 'Desp NF'
      FieldName = 'VL_DESP_NF'
    end
    object cdsItPedNfACRESC_ITEM: TFloatField
      DisplayLabel = 'Acres It'
      FieldName = 'ACRESC_ITEM'
    end
    object cdsItPedNfNF_AC_DES_EMB: TFloatField
      FieldName = 'NF_AC_DES_EMB'
    end
    object cdsItPedNfNF_DC_DESPNF: TFloatField
      FieldName = 'NF_DC_DESPNF'
    end
    object cdsItPedNfCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsItPedNfUVND_FATOR: TFloatField
      FieldName = 'UVND_FATOR'
    end
  end
  object dsItPedNf: TDataSource
    AutoEdit = False
    DataSet = cdsItPedNf
    Left = 680
    Top = 416
  end
  object SpIncCodNF: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 380
    Top = 1
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
  object qrPedC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select'
      'pv.num_ped,'
      'pv.tipo_ped,'
      'pv.val_tot_ped,'
      'pv.codigo_f,'
      'c.nome_cliente,'
      'pv.data_env_ped,'
      'pv.data_chg_ped,'
      'pv.cod_vendedor,'
      'col.nome_vendedor,'
      'pv.status_ped'
      'from pedido pv'
      
        'inner join clientes c on c.cod_cliente = pv.codigo_f and c.cod_e' +
        'mpresa = pv.cod_empresa'
      
        'left join colaborador col on col.cod_vendedor = pv.cod_vendedor ' +
        'and col.cod_empresa = pv.cod_empresa')
    Left = 752
    Top = 272
  end
  object dspPedC: TDataSetProvider
    DataSet = qrPedC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 752
    Top = 320
  end
  object cdsPedC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedC'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 752
    Top = 368
    object cdsPedCNUM_PED: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NUM_PED'
      Required = True
    end
    object cdsPedCVAL_TOT_PED: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VAL_TOT_PED'
      DisplayFormat = '##0.00'
    end
    object cdsPedCCODIGO_F: TIntegerField
      DisplayLabel = 'C'#243'd F'
      FieldName = 'CODIGO_F'
      Required = True
    end
    object cdsPedCNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsPedCDATA_ENV_PED: TDateTimeField
      DisplayLabel = 'Data Envio'
      FieldName = 'DATA_ENV_PED'
    end
    object cdsPedCTIPO_PED: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 7
    end
    object cdsPedCCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Resp'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsPedCNOME_VENDEDOR: TStringField
      DisplayLabel = 'Respons'#225'vel pelo Pedido'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsPedCDATA_CHG_PED: TDateTimeField
      DisplayLabel = 'Data Recebimento'
      FieldName = 'DATA_CHG_PED'
    end
    object cdsPedCSTATUS_PED: TStringField
      DisplayLabel = 'Status Pedido'
      FieldName = 'STATUS_PED'
      FixedChar = True
      Size = 10
    end
  end
  object dsPedC: TDataSource
    AutoEdit = False
    DataSet = cdsPedC
    Left = 752
    Top = 416
  end
  object qrIPedC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select'
      #39'P'#39' tipo_item,'
      'pvp.num_ped,'
      'p.descr_prod,'
      'p.num_fab_prod,'
      'pvp.grupo_prod,'
      'pvp.cod_prod,'
      'pvp.quant_it_prod,'
      'pvp.quant_pen_it,'
      'pvp.quant_min_it,'
      'pvp.val_unt_it,'
      'pvp.val_tot_it'
      'from item_pedido pvp'
      
        'inner join produtos p on p.grupo_prod = pvp.grupo_prod and p.cod' +
        '_prod = pvp.cod_prod and'
      'p.cod_empresa = pvp.cod_empresa'
      'where pvp.num_ped = :nped')
    Left = 808
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end>
  end
  object dspIPedC: TDataSetProvider
    DataSet = qrIPedC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 808
    Top = 320
  end
  object cdsIPedC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIPedC'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 808
    Top = 368
    object cdsIPedCTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsIPedCNUM_PED: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NUM_PED'
      Required = True
    end
    object cdsIPedCQUANT_IT_PROD: TFloatField
      DisplayLabel = 'Qtde Pedida'
      FieldName = 'QUANT_IT_PROD'
      DisplayFormat = '##0.000'
    end
    object cdsIPedCVAL_UNT_IT: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VAL_UNT_IT'
      DisplayFormat = '##0.00'
    end
    object cdsIPedCVAL_TOT_IT: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VAL_TOT_IT'
      DisplayFormat = '##0.00'
    end
    object cdsIPedCDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsIPedCNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsIPedCGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsIPedCCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsIPedCQUANT_PEN_IT: TFloatField
      DisplayLabel = 'Qtde Pendente'
      FieldName = 'QUANT_PEN_IT'
      DisplayFormat = '##0.000'
    end
    object cdsIPedCQUANT_MIN_IT: TFloatField
      DisplayLabel = 'Qtde M'#237'nima'
      FieldName = 'QUANT_MIN_IT'
      DisplayFormat = '##0.000'
    end
  end
  object dsIPedC: TDataSource
    AutoEdit = False
    DataSet = cdsIPedC
    Left = 808
    Top = 416
  end
  object qrGrProdC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select cp.grupo_prod, cp.cod_prod, cp.cod_grade, cp.cod_empresa,'
      'cp.qtde estoque, g.descricao, g.descricao1'
      ' from cod_grade_prod cp'
      'inner join grade g on g.cod_grade = cp.cod_grade'
      'and g.cod_empresa = cp.cod_empresa')
    Left = 872
    Top = 272
  end
  object dspGrProdC: TDataSetProvider
    DataSet = qrGrProdC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 872
    Top = 320
  end
  object cdsGrProdC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeC'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 872
    Top = 368
    object cdsGrProdCGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsGrProdCCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGrProdCCOD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'd Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGrProdCCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGrProdCESTOQUE: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE'
    end
    object cdsGrProdCDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 32
    end
    object cdsGrProdCDESCRICAO1: TStringField
      DisplayLabel = 'Segunda Descri'#231#227'o'
      FieldName = 'DESCRICAO1'
      FixedChar = True
      Size = 32
    end
  end
  object dsGrProdC: TDataSource
    AutoEdit = False
    DataSet = cdsGrProdC
    Left = 872
    Top = 416
  end
  object RDprint1: TRDprint
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
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
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
    TitulodoRelatorio = 'Gerado por RDprint'
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
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 440
  end
  object QrGradeC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from cod_grade_prod_compra')
    Left = 928
    Top = 272
  end
  object dspGradeC: TDataSetProvider
    DataSet = QrGradeC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 928
    Top = 320
  end
  object cdsGradeC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeC'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 928
    Top = 368
    object cdsGradeCNUM_NOTA_NFE: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NUM_NOTA_NFE'
      Required = True
    end
    object cdsGradeCCOD_FORN_NFE: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'COD_FORN_NFE'
      Required = True
    end
    object cdsGradeCGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsGradeCCOD_PROD: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGradeCCOD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'd Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradeCCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGradeCQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsGradeCATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsGradeCDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = cdsGrProdC
      LookupKeyFields = 'COD_GRADE'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_GRADE'
      Size = 32
      Lookup = True
    end
    object cdsGradeCDESCRICAO1: TStringField
      DisplayLabel = 'Segunda Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'DESCRICAO1'
      LookupDataSet = cdsGrProdC
      LookupKeyFields = 'COD_GRADE'
      LookupResultField = 'DESCRICAO1'
      KeyFields = 'COD_GRADE'
      Size = 32
      Lookup = True
    end
  end
  object dsGradeC: TDataSource
    AutoEdit = False
    DataSet = cdsGradeC
    Left = 928
    Top = 416
  end
  object qrUltimasCompras: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      
        'select first 5 n.num_nf, c.nome_cliente, n.data_lanc, cn.desc_co' +
        'nd_pag,'
      
        'ni.quantidade, ni.valor_unitario,  ni.prec_cus_cnt, ni.prec_cusm' +
        '_prod,'
      
        'ni.prec_vnd_prod, ni.prec_vnd_proda, ni.valor_desconto_perc, ni.' +
        'rateio_desconto,'
      
        'ni.pmargfim,  ni.pmargfim_a, ni.aliq_icm,  ni.aliq_ipi, ni.perc_' +
        'frete, ni.nitem,'
      'ni.grupo_prod, ni.cod_prod, ni.codigo_nop'
      'from notafiscal n'
      
        'inner join notafiscal_item ni on n.cod_nf = ni.cod_nf and n.cod_' +
        'empresa = ni.cod_empresa'
      
        'inner join clientes c on c.cod_cliente = n.cod_cliente and c.cod' +
        '_empresa = n.cod_empresa'
      'inner join cond_pag cn on cn.cod_cond_pag = n.cod_cond_pag'
      'where n.natureza_nf = '#39'E'#39' and n.tipo_nf = '#39'P'#39
      
        'and ni.grupo_prod = :grupo_prod and ni.cod_prod = :cod_prod and ' +
        'n.cod_empresa = :cod_empresa'
      'group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21'
      'order by n.data_lanc desc')
    Left = 513
    Top = 1
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrUltimasComprasNUM_NF: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NUM_NF'
      Origin = '"NOTAFISCAL"."NUM_NF"'
      Required = True
    end
    object qrUltimasComprasNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object qrUltimasComprasDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lancamento'
      FieldName = 'DATA_LANC'
      Origin = '"NOTAFISCAL"."DATA_LANC"'
    end
    object qrUltimasComprasDESC_COND_PAG: TIBStringField
      DisplayLabel = 'Cond Pag'
      FieldName = 'DESC_COND_PAG'
      Origin = '"COND_PAG"."DESC_COND_PAG"'
      Size = 30
    end
    object qrUltimasComprasQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
      Origin = '"NOTAFISCAL_ITEM"."QUANTIDADE"'
      DisplayFormat = '##0.0000'
    end
    object qrUltimasComprasVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_UNITARIO"'
    end
    object qrUltimasComprasPREC_CUS_CNT: TFloatField
      DisplayLabel = '$ Custo'
      FieldName = 'PREC_CUS_CNT'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUS_CNT"'
    end
    object qrUltimasComprasPREC_CUSM_PROD: TFloatField
      DisplayLabel = '$ Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUSM_PROD"'
    end
    object qrUltimasComprasPREC_VND_PROD: TFloatField
      DisplayLabel = '$ Venda'
      FieldName = 'PREC_VND_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_VND_PROD"'
    end
    object qrUltimasComprasPREC_VND_PRODA: TFloatField
      DisplayLabel = '$Venda Atac'
      FieldName = 'PREC_VND_PRODA'
      Origin = '"NOTAFISCAL_ITEM"."PREC_VND_PRODA"'
    end
    object qrUltimasComprasVALOR_DESCONTO_PERC: TFloatField
      DisplayLabel = '$ Desconto'
      FieldName = 'VALOR_DESCONTO_PERC'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_DESCONTO_PERC"'
      DisplayFormat = '##0.000'
    end
    object qrUltimasComprasRATEIO_DESCONTO: TFloatField
      DisplayLabel = '$ Rateio Desconto'
      FieldName = 'RATEIO_DESCONTO'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_DESCONTO"'
      DisplayFormat = '##0.000'
    end
    object qrUltimasComprasPMARGFIM: TFloatField
      DisplayLabel = '%Margem Min'
      FieldName = 'PMARGFIM'
      Origin = '"NOTAFISCAL_ITEM"."PMARGFIM"'
    end
    object qrUltimasComprasPMARGFIM_A: TFloatField
      DisplayLabel = '% Margem Min Atac'
      FieldName = 'PMARGFIM_A'
      Origin = '"NOTAFISCAL_ITEM"."PMARGFIM_A"'
    end
    object qrUltimasComprasALIQ_ICM: TFloatField
      DisplayLabel = '% ICM'
      FieldName = 'ALIQ_ICM'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICM"'
    end
    object qrUltimasComprasALIQ_IPI: TFloatField
      DisplayLabel = '% IPI'
      FieldName = 'ALIQ_IPI'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_IPI"'
    end
    object qrUltimasComprasPERC_FRETE: TFloatField
      DisplayLabel = '% Frete'
      FieldName = 'PERC_FRETE'
      Origin = '"NOTAFISCAL_ITEM"."PERC_FRETE"'
    end
    object qrUltimasComprasNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item na NF'
      FieldName = 'NITEM'
      Origin = '"NOTAFISCAL_ITEM"."NITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrUltimasComprasGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"NOTAFISCAL_ITEM"."GRUPO_PROD"'
    end
    object qrUltimasComprasCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"NOTAFISCAL_ITEM"."COD_PROD"'
      FixedChar = True
      Size = 6
    end
    object qrUltimasComprasCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      Origin = '"NOTAFISCAL_ITEM"."CODIGO_NOP"'
    end
  end
  object dsUltComp: TDataSource
    AutoEdit = False
    DataSet = qrUltimasCompras
    Left = 592
    Top = 8
  end
  object qrComFat: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select'
      'cf.n_comando,'
      'cf.sub_serie,'
      'cf.num_nota_v,'
      'cf.chassiv,'
      'cf.nome_receb,'
      'cf.tipo_venda_v,'
      'cf.clientes_v,'
      'c.nome_cliente,'
      'cf.covend_v,'
      'cf.condpag_v,'
      'cf.natop_v,'
      'cf.codfisc_v,'
      'cf.prven_v,'
      'cf.frete_v,'
      'cf.seguro_v,'
      'cf.outdesp_v,'
      'cf.alicm_v,'
      'cf.redb_v,'
      'cf.desconto_v,'
      'cf.inscsub_v,'
      'cf.valtot_v,'
      'cf.status_v,'
      'cf.tipo_v,'
      'cf.bicmsub_v,'
      'cf.vlicmsub_v,'
      'cf.PERC_RED_V,'
      'cf.cst_v,'
      'cf.serie,'
      'cf.tprest,'
      'cf.obs_v,'
      'cf.dt_ent_said,'
      'cf.natureza,'
      'cf.valor_real,'
      'cf.valor_a_rec, '
      'cf.cod_estmoto, '
      'cf.tipv_veiculo,'
      'cf.tipo,'
      'cf.modelo,'
      'cf.altera_estoque_cfop '
      'from com_fat cf'
      
        'inner join clientes c on c.cod_cliente = cf.clientes_v and c.cod' +
        '_empresa = cf.cod_empresa')
    Left = 984
    Top = 272
  end
  object dspComFat: TDataSetProvider
    DataSet = qrComFat
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 984
    Top = 320
  end
  object cdsComFat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComFat'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 984
    Top = 368
    object cdsComFatN_COMANDO: TIntegerField
      DisplayLabel = 'N'#186' Comando'
      FieldName = 'N_COMANDO'
      Required = True
    end
    object cdsComFatNUM_NOTA_V: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NUM_NOTA_V'
    end
    object cdsComFatSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsComFatCHASSIV: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSIV'
      FixedChar = True
      Size = 17
    end
    object cdsComFatNOME_RECEB: TStringField
      DisplayLabel = 'Nome Recebedor'
      FieldName = 'NOME_RECEB'
      FixedChar = True
      Size = 30
    end
    object cdsComFatTIPO_VENDA_V: TStringField
      DisplayLabel = 'Novo/USado'
      FieldName = 'TIPO_VENDA_V'
      FixedChar = True
      Size = 1
    end
    object cdsComFatCLIENTES_V: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'CLIENTES_V'
    end
    object cdsComFatNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsComFatCOVEND_V: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COVEND_V'
    end
    object cdsComFatCONDPAG_V: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'CONDPAG_V'
    end
    object cdsComFatNATOP_V: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'NATOP_V'
    end
    object cdsComFatCODFISC_V: TStringField
      DisplayLabel = 'C'#243'd Fiscal'
      FieldName = 'CODFISC_V'
      FixedChar = True
      Size = 10
    end
    object cdsComFatPRVEN_V: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'PRVEN_V'
    end
    object cdsComFatFRETE_V: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETE_V'
    end
    object cdsComFatSEGURO_V: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'SEGURO_V'
    end
    object cdsComFatOUTDESP_V: TFloatField
      DisplayLabel = 'Outras Despesas'
      FieldName = 'OUTDESP_V'
    end
    object cdsComFatALICM_V: TFloatField
      DisplayLabel = 'Aliq ICM'
      FieldName = 'ALICM_V'
    end
    object cdsComFatREDB_V: TStringField
      DisplayLabel = 'Red Base?'
      FieldName = 'REDB_V'
      FixedChar = True
      Size = 1
    end
    object cdsComFatDESCONTO_V: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO_V'
    end
    object cdsComFatINSCSUB_V: TStringField
      DisplayLabel = 'Insc Sub'
      FieldName = 'INSCSUB_V'
      FixedChar = True
      Size = 18
    end
    object cdsComFatVALTOT_V: TFloatField
      DisplayLabel = 'Valor total'
      FieldName = 'VALTOT_V'
    end
    object cdsComFatSTATUS_V: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_V'
      FixedChar = True
      Size = 10
    end
    object cdsComFatTIPO_V: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_V'
      FixedChar = True
      Size = 4
    end
    object cdsComFatBICMSUB_V: TFloatField
      DisplayLabel = 'Base ICM Sub'
      FieldName = 'BICMSUB_V'
    end
    object cdsComFatVLICMSUB_V: TFloatField
      DisplayLabel = 'Valor ICM Sub'
      FieldName = 'VLICMSUB_V'
    end
    object cdsComFatPERC_RED_V: TFloatField
      DisplayLabel = '% Redu'#231#227'o'
      FieldName = 'PERC_RED_V'
    end
    object cdsComFatCST_V: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_V'
      FixedChar = True
      Size = 3
    end
    object cdsComFatSUB_SERIE: TIntegerField
      DisplayLabel = 'SubSerie'
      FieldName = 'SUB_SERIE'
    end
    object cdsComFatTPREST: TStringField
      DisplayLabel = 'Restri'#231#227'o'
      FieldName = 'TPREST'
      FixedChar = True
      Size = 1
    end
    object cdsComFatOBS_V: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_V'
      BlobType = ftMemo
      Size = 8
    end
    object cdsComFatDT_ENT_SAID: TDateTimeField
      DisplayLabel = 'Data Entrada/Sa'#237'da'
      FieldName = 'DT_ENT_SAID'
    end
    object cdsComFatNATUREZA: TStringField
      Tag = 1
      FieldName = 'NATUREZA'
      FixedChar = True
      Size = 1
    end
    object cdsComFatVALOR_REAL: TFloatField
      Tag = 1
      FieldName = 'VALOR_REAL'
    end
    object cdsComFatVALOR_A_REC: TFloatField
      Tag = 1
      FieldName = 'VALOR_A_REC'
    end
    object cdsComFatCOD_ESTMOTO: TIntegerField
      Tag = 1
      FieldName = 'COD_ESTMOTO'
    end
    object cdsComFatTIPV_VEICULO: TStringField
      Tag = 1
      FieldName = 'TIPV_VEICULO'
      FixedChar = True
      Size = 1
    end
    object cdsComFatALTERA_ESTOQUE_CFOP: TStringField
      Tag = 1
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsComFatTIPO: TStringField
      Tag = 1
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object cdsComFatMODELO: TStringField
      Tag = 1
      FieldName = 'MODELO'
      Size = 10
    end
  end
  object dsComFat: TDataSource
    AutoEdit = False
    DataSet = cdsComFat
    Left = 984
    Top = 416
  end
  object qrMotVen: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select'
      #39'N'#39' TIPO,'
      'em.tipoest,'
      'em.chassi_c,'
      'em.cod_empresa,'
      'em.num_nota NF_AQ,'
      'em.serie,'
      'em.marcaest,'
      'em.versaoest,'
      'em.descricao_versaoest,'
      'em.ano_fabest,'
      'em.ano_modest,'
      'em.corest,'
      'em.cilindrosest,'
      'em.combustivelest,'
      'em.cilindradaest,'
      'em.hpest,'
      'em.lotacaoest,'
      'em.renavamest,'
      'em.preco_tabest precovenda,'
      'em.preco_custo_desp precocompra,'
      'em.frete_aquisicaoest,'
      'em.frete_vendaest,'
      'em.obs_itemest,'
      'em.motorest,'
      'em.placaest,'
      'em.certificadoest,'
      'em.data_certificadoest,'
      'em.categoriaest,'
      'em.codigo,'
      'em.data_ch_nota,'
      'em.tipo_venda,'
      'em.nserie,'
      'em.tip_pintura,'
      'em.cod_cor,'
      'em.situacao,'
      'em.base_calc_icm_subest base_calc_icm_subv,'
      'em.valor_icm_subest valor_icm_subv,'
      'em.com_ent,'
      'em.red_lucro,'
      'em.cod_fornecedor,'
      #39'ESTOQUE'#39' tab,'
      'em.PRECO_CUSTO'
      'from est_moto em'
      'where em.chassi_c = :chassi and em.cod_empresa = :cod_empresa'
      'union'
      'select'
      #39'U'#39' TIPO,'
      'mu.tipo_us,'
      'mu.chassi_us,'
      'mu.cod_empresa,'
      'mu.nfaq_us NF_AQ,'
      'mu.subserienfaq,'
      'mu.marca_us,'
      'mu.versao_us,'
      'tm.descricao,'
      'mu.anofab_us,'
      'mu.anomod_us,'
      'mu.cor_us,'
      'mu.cilind_us,'
      'mu.combust_us,'
      'mu.cilindrada_us,'
      'mu.hp_us,'
      'mu.lotacao_us,'
      'mu.renavam_us,'
      'mu.valor_ven_us precovenda,'
      'mu.vl_compra_us precocompra,'
      '0,'
      '0,'
      'mu.obs_us,'
      'mu.motor_us,'
      'mu.placa_us,'
      'mu.certif_us,'
      'mu.data_cert_us,'
      'mu.categoria_us,'
      'mu.codigo_us,'
      'mu.data_ch_nota,'
      #39#39','
      'mu.nserie,'
      'mu.tip_pintura,'
      'mu.cod_cor,'
      #39#39',            '
      '0,'
      '0,'
      'mu.com_ent,'
      'mu.red_lucro,'
      '0,'
      #39'USADO'#39' tab,'
      'mu.PRECO_CUSTO'
      'from mtusadas mu'
      
        'inner join TIPMODELO tm on tm.codigo = mu.versao_us and tm.cod_e' +
        'mpresa = mu.cod_empresa'
      'where mu.chassi_us = :chassi and mu.cod_empresa = :cod_empresa'
      'union'
      'select'
      #39'U'#39' TIPO,'
      'mv.tipov,'
      'mv.chassiv,'
      'mv.cod_empresa,'
      'mv.nf_aq,'
      'mv.serie_aq,'
      'mv.marcav,'
      'mv.versaov,'
      'mv.descricao_versaov,'
      'mv.ano_fabv,'
      'mv.ano_modv,'
      'mv.corv,'
      'mv.cilindrosv,'
      'mv.combustivelv,'
      'mv.cilindradav,'
      'mv.hpv,'
      'mv.lotacaov,'
      'mv.renavamv,'
      'mv.preco_tabv precovenda,'
      'mv.vl_compra_us precocompra,'
      'mv.frete_aquisicaov,'
      'mv.frete_vendav,'
      'mv.obs_itemv ,'
      'mv.motorv,'
      'mv.placav,'
      'mv.certificadov,'
      'mv.data_certificadov,'
      'mv.categoriav,'
      '0,'
      'mv.data_ch_nota,'
      'mv.tipo_venda,'
      'mv.nserie,'
      'mv.tip_pintura,'
      'mv.cod_cor,'
      #39#39',       '
      'mv.base_calc_icm_subv,'
      'mv.valor_icm_subv,'
      'mv.com_ent,'
      'mv.red_lucro,'
      'mv.cod_fornecedor,'
      #39'VENDA'#39' tab,'
      'mv.PRECO_CUSTO'
      'from mot_ven mv'
      'where mV.chassiv = :chassi and mv.cod_empresa = :cod_empresa'
      'and mv.n_comando = :comando')
    Left = 1040
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'chassi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chassi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chassi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comando'
        ParamType = ptUnknown
      end>
  end
  object dspMotVen: TDataSetProvider
    DataSet = qrMotVen
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1040
    Top = 320
  end
  object cdsMotVen: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMotVen'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1040
    Top = 368
    object cdsMotVenTIPO: TStringField
      DisplayLabel = 'Novo/Usado'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsMotVenTIPOEST: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPOEST'
      FixedChar = True
      Size = 30
    end
    object cdsMotVenCHASSI_C: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI_C'
      Required = True
      FixedChar = True
      Size = 17
    end
    object cdsMotVenCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMotVenNF_AQ: TIntegerField
      DisplayLabel = 'NF Aq'
      FieldName = 'NF_AQ'
    end
    object cdsMotVenSERIE: TStringField
      DisplayLabel = 'S'#233'rie Aq'
      FieldName = 'SERIE'
      Size = 11
    end
    object cdsMotVenMARCAEST: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCAEST'
      FixedChar = True
      Size = 32
    end
    object cdsMotVenVERSAOEST: TIntegerField
      DisplayLabel = 'Ver'#227'o'
      FieldName = 'VERSAOEST'
    end
    object cdsMotVenDESCRICAO_VERSAOEST: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_VERSAOEST'
      Size = 60
    end
    object cdsMotVenANO_FABEST: TIntegerField
      DisplayLabel = 'Ano Fab'
      FieldName = 'ANO_FABEST'
    end
    object cdsMotVenANO_MODEST: TIntegerField
      DisplayLabel = 'Ano Mod'
      FieldName = 'ANO_MODEST'
    end
    object cdsMotVenCOREST: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COREST'
      FixedChar = True
      Size = 30
    end
    object cdsMotVenCILINDROSEST: TIntegerField
      DisplayLabel = 'Cilindros'
      FieldName = 'CILINDROSEST'
    end
    object cdsMotVenCOMBUSTIVELEST: TStringField
      DisplayLabel = 'Combustivel'
      FieldName = 'COMBUSTIVELEST'
      FixedChar = True
      Size = 50
    end
    object cdsMotVenCILINDRADAEST: TFloatField
      DisplayLabel = 'Cilindradas'
      FieldName = 'CILINDRADAEST'
    end
    object cdsMotVenHPEST: TFloatField
      DisplayLabel = 'HP'
      FieldName = 'HPEST'
    end
    object cdsMotVenLOTACAOEST: TStringField
      DisplayLabel = 'Lota'#231#227'o'
      FieldName = 'LOTACAOEST'
      FixedChar = True
      Size = 10
    end
    object cdsMotVenRENAVAMEST: TStringField
      DisplayLabel = 'Renavam'
      DisplayWidth = 6
      FieldName = 'RENAVAMEST'
      FixedChar = True
      Size = 6
    end
    object cdsMotVenPRECOVENDA: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'PRECOVENDA'
    end
    object cdsMotVenPRECOCOMPRA: TFloatField
      DisplayLabel = 'Pre'#231'o Compra'
      FieldName = 'PRECOCOMPRA'
    end
    object cdsMotVenFRETE_AQUISICAOEST: TFloatField
      DisplayLabel = 'Frete Aq'
      FieldName = 'FRETE_AQUISICAOEST'
    end
    object cdsMotVenFRETE_VENDAEST: TFloatField
      DisplayLabel = 'Frete Venda'
      FieldName = 'FRETE_VENDAEST'
    end
    object cdsMotVenOBS_ITEMEST: TStringField
      DisplayLabel = 'Obs.'
      FieldName = 'OBS_ITEMEST'
      FixedChar = True
      Size = 30
    end
    object cdsMotVenMOTOREST: TStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOREST'
      FixedChar = True
      Size = 21
    end
    object cdsMotVenPLACAEST: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACAEST'
      FixedChar = True
      Size = 10
    end
    object cdsMotVenCERTIFICADOEST: TStringField
      DisplayLabel = 'Certificado'
      FieldName = 'CERTIFICADOEST'
      FixedChar = True
      Size = 10
    end
    object cdsMotVenDATA_CERTIFICADOEST: TDateTimeField
      DisplayLabel = 'Data Certificado'
      FieldName = 'DATA_CERTIFICADOEST'
    end
    object cdsMotVenCATEGORIAEST: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIAEST'
      FixedChar = True
      Size = 10
    end
    object cdsMotVenCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object cdsMotVenDATA_CH_NOTA: TDateTimeField
      DisplayLabel = 'Data Cheg Nota'
      FieldName = 'DATA_CH_NOTA'
    end
    object cdsMotVenTIPO_VENDA: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA'
      FixedChar = True
      Size = 10
    end
    object cdsMotVenNSERIE: TStringField
      DisplayLabel = 'Num S'#233'rie'
      FieldName = 'NSERIE'
      Size = 9
    end
    object cdsMotVenTIP_PINTURA: TStringField
      DisplayLabel = 'Tipo Pintura'
      FieldName = 'TIP_PINTURA'
      FixedChar = True
      Size = 1
    end
    object cdsMotVenCOD_COR: TIntegerField
      DisplayLabel = 'Codigo Cor'
      FieldName = 'COD_COR'
    end
    object cdsMotVenSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 15
    end
    object cdsMotVenCOM_ENT: TIntegerField
      DisplayLabel = 'Comando Entrada'
      FieldName = 'COM_ENT'
    end
    object cdsMotVenRED_LUCRO: TStringField
      FieldName = 'RED_LUCRO'
      Size = 1
    end
    object cdsMotVenTAB: TStringField
      DisplayLabel = 'Local'
      FieldName = 'TAB'
      FixedChar = True
      Size = 7
    end
    object cdsMotVenBASE_CALC_ICM_SUBV: TFloatField
      FieldName = 'BASE_CALC_ICM_SUBV'
    end
    object cdsMotVenVALOR_ICM_SUBV: TFloatField
      FieldName = 'VALOR_ICM_SUBV'
    end
    object cdsMotVenCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'Cod Fornec'
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsMotVenPRECO_CUSTO: TFloatField
      DisplayLabel = 'Custo'
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = '##0.00'
    end
    object cdsMotVenNCMSH: TStringField
      FieldName = 'NCMSH'
      Size = 8
    end
  end
  object dsMotVen: TDataSource
    AutoEdit = False
    DataSet = cdsMotVen
    Left = 1040
    Top = 416
  end
  object qrCorFab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from CODIGO_CORFAB')
    Left = 896
    Top = 72
  end
  object dspCorFab: TDataSetProvider
    DataSet = qrCorFab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 896
    Top = 120
  end
  object cdsCorFab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCorFab'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 896
    Top = 168
    object cdsCorFabCOD_COR: TIntegerField
      FieldName = 'COD_COR'
      Required = True
    end
    object cdsCorFabDESCRICAO_COR: TStringField
      FieldName = 'DESCRICAO_COR'
      FixedChar = True
      Size = 30
    end
    object cdsCorFabTIPO_PINTURA: TStringField
      FieldName = 'TIPO_PINTURA'
      FixedChar = True
      Size = 1
    end
    object cdsCorFabATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsCorFab: TDataSource
    DataSet = cdsCorFab
    Left = 896
    Top = 216
  end
  object qrTrans: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select'
      'nt.NUM_NOTAT,'
      'nt.COD_EMPRESA, '
      'nt.SERIET, '
      'nt.DATA_EMISSAOT, '
      'nt.DATA_VENCT, '
      'nt.VALORNOTAT, '
      'nt.CODFATT, '
      'nt.TPFATT, '
      'nt.FRETET, '
      'nt.SEGUROT, '
      'nt.ICMSSUBT, '
      'nt.STATUST, '
      'nt.DT_REC_NF,'
      'nt.N_CAIXA'
      'from NF_TRANSITO nt'
      
        'left join transito_motos tm on tm.num_notat = nt.num_notat and n' +
        't.n_caixa = tm.n_caixa'
      'and tm.cod_empresa = nt.cod_empresa')
    Left = 968
    Top = 72
  end
  object dspTrans: TDataSetProvider
    DataSet = qrTrans
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 968
    Top = 120
  end
  object cdsTrans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTrans'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 968
    Top = 168
    object cdsTransNUM_NOTAT: TIntegerField
      DisplayLabel = 'N'#186' Nf Tr'#226'nsito'
      FieldName = 'NUM_NOTAT'
      Required = True
    end
    object cdsTransCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsTransSERIET: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIET'
      FixedChar = True
      Size = 3
    end
    object cdsTransDATA_EMISSAOT: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_EMISSAOT'
    end
    object cdsTransDATA_VENCT: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATA_VENCT'
    end
    object cdsTransVALORNOTAT: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALORNOTAT'
    end
    object cdsTransCODFATT: TIntegerField
      FieldName = 'CODFATT'
      Visible = False
    end
    object cdsTransTPFATT: TStringField
      FieldName = 'TPFATT'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsTransFRETET: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'FRETET'
    end
    object cdsTransSEGUROT: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'SEGUROT'
    end
    object cdsTransICMSSUBT: TFloatField
      DisplayLabel = 'ICM Sub'
      FieldName = 'ICMSSUBT'
    end
    object cdsTransSTATUST: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUST'
      Size = 10
    end
    object cdsTransDT_REC_NF: TDateTimeField
      DisplayLabel = 'Data NF'
      FieldName = 'DT_REC_NF'
    end
    object cdsTransN_CAIXA: TIntegerField
      DisplayLabel = 'N'#186' Caixa'
      FieldName = 'N_CAIXA'
      Required = True
    end
  end
  object dsTrans: TDataSource
    AutoEdit = False
    DataSet = cdsTrans
    Left = 968
    Top = 216
  end
  object qrItTrans: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select '
      'CHASSIT, '
      'NUM_NOTAT, '
      'COD_EMPRESA, '
      'VERSAOT, '
      'ANO_FABT, '
      'ANO_MODT, '
      'CORT, '
      'MOTORT, '
      'DESCRICAO_VERSAOT, '
      'CILINDROST, '
      'COMBUSTIVELT, '
      'CILINDRADAT, '
      'HPT, '
      'LOTACAOT, '
      'TIPOT, '
      'RENAVAMT, '
      'PRECO_TABT, '
      'FRETE_AQUISICAOT, '
      'FRETE_VENDAT, '
      'BASE_CALC_ICM_SUBT, '
      'VALOR_ICM_SUBT, '
      'OBS_ITEMT, '
      'PLACAT, '
      'CERTIFICADOT, '
      'DATA_CERTIFICADOT, '
      'CATEGORIAT, '
      'CAIXA_N, '
      'TIPO_RES, '
      'DATA_RES, '
      'VENDEDOR_RES, '
      'TIPO_VENDA, '
      'COD_CLIENTE, '
      'STATUS_RES, '
      'NOME_RES, '
      'SIT_RES, '
      'SITUACAO, '
      'ATIVO, '
      'MARCAT, '
      'N_CAIXA'
      'from transito_motos'
      'where num_notat = :num_nf'
      'and n_caixa = :n_caixa'
      'and cod_empresa = :cod_empresa')
    Left = 1024
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'num_nf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'n_caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspItTrans: TDataSetProvider
    DataSet = qrItTrans
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1024
    Top = 120
  end
  object cdsItTrans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItTrans'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1024
    Top = 168
    object cdsItTransCHASSIT: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSIT'
      Required = True
      FixedChar = True
      Size = 17
    end
    object cdsItTransNUM_NOTAT: TIntegerField
      FieldName = 'NUM_NOTAT'
      Required = True
      Visible = False
    end
    object cdsItTransCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsItTransVERSAOT: TIntegerField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'VERSAOT'
    end
    object cdsItTransDESCRICAO_VERSAOT: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_VERSAOT'
      FixedChar = True
      Size = 60
    end
    object cdsItTransANO_FABT: TIntegerField
      DisplayLabel = 'Ano Fab'
      FieldName = 'ANO_FABT'
    end
    object cdsItTransANO_MODT: TIntegerField
      DisplayLabel = 'Ano Mod'
      FieldName = 'ANO_MODT'
    end
    object cdsItTransCORT: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'CORT'
      FixedChar = True
      Size = 30
    end
    object cdsItTransMOTORT: TStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTORT'
      FixedChar = True
      Size = 21
    end
    object cdsItTransMARCAT: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCAT'
      FixedChar = True
      Size = 5
    end
    object cdsItTransCILINDROST: TIntegerField
      DisplayLabel = 'Cilindros'
      FieldName = 'CILINDROST'
    end
    object cdsItTransCOMBUSTIVELT: TStringField
      DisplayLabel = 'Combustivel'
      FieldName = 'COMBUSTIVELT'
      FixedChar = True
      Size = 50
    end
    object cdsItTransCILINDRADAT: TFloatField
      DisplayLabel = 'Cilindradas'
      FieldName = 'CILINDRADAT'
    end
    object cdsItTransHPT: TFloatField
      DisplayLabel = 'HP'
      FieldName = 'HPT'
    end
    object cdsItTransLOTACAOT: TStringField
      DisplayLabel = 'Lota'#231#227'o'
      FieldName = 'LOTACAOT'
      FixedChar = True
      Size = 10
    end
    object cdsItTransTIPOT: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPOT'
      FixedChar = True
      Size = 30
    end
    object cdsItTransRENAVAMT: TStringField
      DisplayLabel = 'Renavam'
      DisplayWidth = 6
      FieldName = 'RENAVAMT'
      FixedChar = True
      Size = 6
    end
    object cdsItTransPRECO_TABT: TFloatField
      DisplayLabel = 'preco_tabt'
      FieldName = 'PRECO_TABT'
    end
    object cdsItTransFRETE_AQUISICAOT: TFloatField
      FieldName = 'FRETE_AQUISICAOT'
    end
    object cdsItTransFRETE_VENDAT: TFloatField
      FieldName = 'FRETE_VENDAT'
    end
    object cdsItTransBASE_CALC_ICM_SUBT: TFloatField
      FieldName = 'BASE_CALC_ICM_SUBT'
    end
    object cdsItTransVALOR_ICM_SUBT: TFloatField
      FieldName = 'VALOR_ICM_SUBT'
    end
    object cdsItTransOBS_ITEMT: TStringField
      FieldName = 'OBS_ITEMT'
      FixedChar = True
      Size = 30
    end
    object cdsItTransPLACAT: TStringField
      FieldName = 'PLACAT'
      FixedChar = True
      Size = 10
    end
    object cdsItTransCERTIFICADOT: TStringField
      FieldName = 'CERTIFICADOT'
      FixedChar = True
      Size = 9
    end
    object cdsItTransDATA_CERTIFICADOT: TDateTimeField
      FieldName = 'DATA_CERTIFICADOT'
    end
    object cdsItTransCATEGORIAT: TStringField
      FieldName = 'CATEGORIAT'
      FixedChar = True
      Size = 10
    end
    object cdsItTransCAIXA_N: TIntegerField
      FieldName = 'CAIXA_N'
    end
    object cdsItTransTIPO_RES: TStringField
      FieldName = 'TIPO_RES'
      FixedChar = True
      Size = 1
    end
    object cdsItTransDATA_RES: TDateTimeField
      FieldName = 'DATA_RES'
    end
    object cdsItTransVENDEDOR_RES: TIntegerField
      FieldName = 'VENDEDOR_RES'
    end
    object cdsItTransTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      FixedChar = True
      Size = 10
    end
    object cdsItTransCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsItTransSTATUS_RES: TStringField
      FieldName = 'STATUS_RES'
      FixedChar = True
      Size = 10
    end
    object cdsItTransNOME_RES: TStringField
      FieldName = 'NOME_RES'
      FixedChar = True
      Size = 35
    end
    object cdsItTransSIT_RES: TStringField
      FieldName = 'SIT_RES'
      FixedChar = True
      Size = 1
    end
    object cdsItTransSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 15
    end
    object cdsItTransATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsItTransN_CAIXA: TIntegerField
      FieldName = 'N_CAIXA'
      Required = True
    end
  end
  object dsItTrans: TDataSource
    AutoEdit = False
    DataSet = cdsItTrans
    Left = 1024
    Top = 216
  end
  object qrParam: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoAux
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from PARAMETROS_DADOSADICIONAIS')
    Left = 1096
    Top = 72
  end
  object dspParam: TDataSetProvider
    DataSet = qrParam
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1096
    Top = 120
  end
  object cdsParam: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParam'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1096
    Top = 168
    object cdsParamCOD_PARAMETRO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PARAMETRO'
      Required = True
    end
    object cdsParamTITULO_SIMPLIFICADO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_SIMPLIFICADO'
      Size = 32
    end
    object cdsParamDADOS_PARAMETRO: TMemoField
      DisplayLabel = 'Dados Parametro'
      FieldName = 'DADOS_PARAMETRO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsParamCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
  end
  object dsParam: TDataSource
    AutoEdit = False
    DataSet = cdsParam
    Left = 1096
    Top = 216
  end
  object transacaoAux: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 704
    Top = 1
  end
  object spIncCodigoAux: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoAux
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 764
    Top = 1
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
  object qrEstEcf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from ecf')
    Left = 1104
    Top = 272
  end
  object dspEstEcf: TDataSetProvider
    DataSet = qrEstEcf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1104
    Top = 320
  end
  object cdsEstEcf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstEcf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1104
    Top = 368
    object cdsEstEcfN_SERIE_FAB: TStringField
      DisplayLabel = 'N'#186' S'#233'rie'
      FieldName = 'N_SERIE_FAB'
      Required = True
    end
    object cdsEstEcfCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEstEcfIDENTIFICACAO: TStringField
      DisplayLabel = 'CNIEE'
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 6
    end
    object cdsEstEcfTIPO_ECF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ECF'
    end
    object cdsEstEcfMARCA_ECF: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_ECF'
    end
    object cdsEstEcfMODELO_ECF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsEstEcfVERSAOSB: TStringField
      DisplayLabel = 'Vers'#227'o do SB'
      FieldName = 'VERSAOSB'
    end
    object cdsEstEcfN_MEMORIA_FISCAL: TStringField
      DisplayLabel = 'N'#186' Memoria Fiscal'
      FieldName = 'N_MEMORIA_FISCAL'
    end
    object cdsEstEcfLACRE_EXTERNO1: TStringField
      DisplayLabel = 'Lacres Externo 1'
      FieldName = 'LACRE_EXTERNO1'
      Size = 12
    end
    object cdsEstEcfLACRE_EXTERNO2: TStringField
      DisplayLabel = 'Lacre Externo 2'
      FieldName = 'LACRE_EXTERNO2'
      Size = 12
    end
    object cdsEstEcfLACRE_EXTERNO3: TStringField
      DisplayLabel = 'Lacre Externo 3'
      FieldName = 'LACRE_EXTERNO3'
      Size = 12
    end
    object cdsEstEcfLACRE_EXTERNO4: TStringField
      DisplayLabel = 'Lacre Externo 4'
      FieldName = 'LACRE_EXTERNO4'
      Size = 12
    end
    object cdsEstEcfSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 12
    end
    object cdsEstEcfNREQ: TIntegerField
      FieldName = 'NREQ'
    end
    object cdsEstEcfNNF: TIntegerField
      FieldName = 'NNF'
    end
    object cdsEstEcfSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsEstEcfNNF_ENTRADA: TIntegerField
      DisplayLabel = 'Nf Entrada'
      FieldName = 'NNF_ENTRADA'
    end
    object cdsEstEcfSERIE_ENTRADA: TStringField
      DisplayLabel = 'S'#233'rie Entrada'
      FieldName = 'SERIE_ENTRADA'
      Size = 5
    end
    object cdsEstEcfCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsEstEcfCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsEstEcfGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsEstEcfATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsEstEcfCOD_NSERIE: TIntegerField
      FieldName = 'COD_NSERIE'
    end
  end
  object dsEstEcf: TDataSource
    AutoEdit = False
    DataSet = cdsEstEcf
    Left = 1104
    Top = 416
  end
  object qrImp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from PARAMETROS_DADOSADICIONAIS')
    Left = 888
    Top = 8
  end
  object dspImp: TDataSetProvider
    DataSet = qrImp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 944
    Top = 8
  end
  object cdsImp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImp'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1000
    Top = 8
  end
  object qrBolNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select c1.nome_ctrl, cb.descricao, b.* from boletas b'
      
        'left join controles c1 on c1.codigo_ctrl = b.cod_controle_cx and' +
        ' c1.codigo_emp = b.cod_empresa'
      
        'left join cobrebem cb on cb.cod_cobrebem = b.cod_cobrebem and cb' +
        '.cod_empresa = b.cod_empresa'
      'where b.n_seq_bol = 0 and b.cod_empresa = 0')
    Left = 1168
    Top = 72
  end
  object dspBolNf: TDataSetProvider
    DataSet = qrBolNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1168
    Top = 120
  end
  object cdsBolNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBolNf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1168
    Top = 168
    object cdsBolNfNUM_NF_VND: TIntegerField
      DisplayLabel = 'Num Nf'
      FieldName = 'NUM_NF_VND'
    end
    object cdsBolNfSUB_SERIE: TIntegerField
      DisplayLabel = 'S'#233'rie da NF'
      FieldName = 'SUB_SERIE'
    end
    object cdsBolNfDATA_EM_BOL: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_EM_BOL'
    end
    object cdsBolNfDATA_VEN_BOL: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VEN_BOL'
    end
    object cdsBolNfN_DOC_BOL: TStringField
      DisplayLabel = 'Numero do Documento'
      FieldName = 'N_DOC_BOL'
      Size = 10
    end
    object cdsBolNfVL_DOC_BOL: TFloatField
      DisplayLabel = 'Valor do Documento'
      FieldName = 'VL_DOC_BOL'
    end
    object cdsBolNfNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsBolNfDESCRICAO: TStringField
      DisplayLabel = 'Boleto'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsBolNfNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsBolNfREMESSA_ENVIADA: TStringField
      FieldName = 'REMESSA_ENVIADA'
      FixedChar = True
      Size = 1
    end
  end
  object dsBolNf: TDataSource
    AutoEdit = False
    DataSet = cdsBolNf
    Left = 1168
    Top = 216
  end
  object rdNF: TRDprint
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
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
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
    TitulodoRelatorio = 'Gerado por RDprint'
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
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 640
  end
  object qrIt2Nf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from notafiscal_item')
    Left = 1168
    Top = 272
  end
  object dspIt2Nf: TDataSetProvider
    DataSet = qrIt2Nf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1168
    Top = 320
  end
  object dsIt2Nf: TDataSource
    AutoEdit = False
    DataSet = cdsIt2Nf
    Left = 1168
    Top = 416
  end
  object cdsIt2Nf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIt2Nf'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1168
    Top = 368
    object cdsIt2NfCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsIt2NfNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsIt2NfGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsIt2NfCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsIt2NfCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Serv'
      FieldName = 'COD_SERVICO'
    end
    object cdsIt2NfCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      FixedChar = True
      Size = 17
    end
    object cdsIt2NfCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsIt2NfDESC_NATOP: TStringField
      DisplayLabel = 'Descr. CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Size = 128
    end
    object cdsIt2NfCST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsIt2NfCSOSN: TStringField
      FieldName = 'CSOSN'
      FixedChar = True
      Size = 3
    end
    object cdsIt2NfREFERENCIA: TStringField
      DisplayLabel = 'Ref'
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 3
    end
    object cdsIt2NfNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsIt2NfDESCRICAO_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ITEM'
      Size = 75
    end
    object cdsIt2NfNCM: TStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NCM'
      Size = 8
    end
    object cdsIt2NfDATA_VALIDADE: TDateTimeField
      DisplayLabel = 'Data Validade'
      FieldName = 'DATA_VALIDADE'
    end
    object cdsIt2NfQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
    end
    object cdsIt2NfVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsIt2NfVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valot Tot'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsIt2NfALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
    end
    object cdsIt2NfBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
    end
    object cdsIt2NfVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
    end
    object cdsIt2NfALIQ_ICMSUB: TFloatField
      DisplayLabel = '% ICMS Sub'
      FieldName = 'ALIQ_ICMSUB'
    end
    object cdsIt2NfBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
    end
    object cdsIt2NfVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Sub'
      FieldName = 'VALOR_ICMSUB'
    end
    object cdsIt2NfPERC_RED_PROD_SUB: TFloatField
      DisplayLabel = '% Red ICMS ST'
      FieldName = 'PERC_RED_PROD_SUB'
    end
    object cdsIt2NfBASE_ICMANT_SUB: TFloatField
      DisplayLabel = 'Base ICMS Ant'
      FieldName = 'BASE_ICMANT_SUB'
    end
    object cdsIt2NfVALOR_ICMANT_SUB: TFloatField
      DisplayLabel = 'Valor ICMS Ant'
      FieldName = 'VALOR_ICMANT_SUB'
    end
    object cdsIt2NfALIQ_IPI: TFloatField
      DisplayLabel = '% IPI'
      FieldName = 'ALIQ_IPI'
    end
    object cdsIt2NfVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
    end
    object cdsIt2NfPERC_RED_PROD: TFloatField
      DisplayLabel = '% Red Base'
      FieldName = 'PERC_RED_PROD'
    end
    object cdsIt2NfPERC_DESCONTO: TFloatField
      DisplayLabel = 'Desconto %'
      FieldName = 'PERC_DESCONTO'
    end
    object cdsIt2NfVALOR_DESCONTO_PERC: TFloatField
      DisplayLabel = 'Desconto $'
      FieldName = 'VALOR_DESCONTO_PERC'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfRATEIO_DESCONTO: TFloatField
      DisplayLabel = 'Rateio Desc $'
      FieldName = 'RATEIO_DESCONTO'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfMVA: TFloatField
      FieldName = 'MVA'
    end
    object cdsIt2NfRATEIO_SEGURO: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'RATEIO_SEGURO'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfRATEIO_OUTDESP: TFloatField
      DisplayLabel = 'Out Despesas'
      FieldName = 'RATEIO_OUTDESP'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfRATEIO_FRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'RATEIO_FRETE'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfRATEIO_ACRES_FIN: TFloatField
      DisplayLabel = 'Acresc Finan'
      FieldName = 'RATEIO_ACRES_FIN'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfRATEIO_DESP_PF: TFloatField
      DisplayLabel = 'Desp PF'
      FieldName = 'RATEIO_DESP_PF'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfPERC_FRETE: TFloatField
      DisplayLabel = '% Frete'
      FieldName = 'PERC_FRETE'
    end
    object cdsIt2NfPRCTB_ITEM: TFloatField
      DisplayLabel = 'MarkUp'
      FieldName = 'PRCTB_ITEM'
    end
    object cdsIt2NfPRCTB_ITEMA: TFloatField
      DisplayLabel = 'MarkUp Atacado'
      FieldName = 'PRCTB_ITEMA'
    end
    object cdsIt2NfPREC_CUS_CNT: TFloatField
      DisplayLabel = 'Custo $'
      FieldName = 'PREC_CUS_CNT'
    end
    object cdsIt2NfPREC_VND_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'PREC_VND_PROD'
    end
    object cdsIt2NfPREC_VND_PRODA: TFloatField
      DisplayLabel = 'Pre'#231'o Venda Atacado'
      FieldName = 'PREC_VND_PRODA'
    end
    object cdsIt2NfPREC_CUS_REP: TFloatField
      DisplayLabel = 'Custo Reposi'#231#227'o $'
      FieldName = 'PREC_CUS_REP'
    end
    object cdsIt2NfPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio $'
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsIt2NfPMARGFIM: TFloatField
      DisplayLabel = '% Margem'
      FieldName = 'PMARGFIM'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfPMARGFIM_A: TFloatField
      DisplayLabel = '% Margem Atacado'
      FieldName = 'PMARGFIM_A'
      DisplayFormat = '##0.0000'
    end
    object cdsIt2NfQTDEMB: TFloatField
      DisplayLabel = 'Qtde Itens p/ Emb'
      FieldName = 'QTDEMB'
    end
    object cdsIt2NfQTDEMBREC: TFloatField
      DisplayLabel = 'Qtde de Emb'
      FieldName = 'QTDEMBREC'
    end
    object cdsIt2NfVLREMBNF: TFloatField
      DisplayLabel = 'Valor da Emb'
      FieldName = 'VLREMBNF'
    end
    object cdsIt2NfVLBRUREAL: TFloatField
      FieldName = 'VLBRUREAL'
    end
    object cdsIt2NfPDESC_R: TFloatField
      FieldName = 'PDESC_R'
    end
    object cdsIt2NfVLREMBNFR: TFloatField
      FieldName = 'VLREMBNFR'
    end
    object cdsIt2NfVLUN_B_NFE: TFloatField
      FieldName = 'VLUN_B_NFE'
    end
    object cdsIt2NfVLISENTO: TFloatField
      DisplayLabel = 'Isento $'
      FieldName = 'VLISENTO'
    end
    object cdsIt2NfVLOUTRAS: TFloatField
      DisplayLabel = 'Outras $'
      FieldName = 'VLOUTRAS'
    end
    object cdsIt2NfVLN_TRIB: TFloatField
      DisplayLabel = 'N'#227'o Trib $'
      FieldName = 'VLN_TRIB'
    end
    object cdsIt2NfCAMP_ENTEST: TStringField
      DisplayLabel = 'Ent Estoque'
      FieldName = 'CAMP_ENTEST'
      FixedChar = True
      Size = 1
    end
    object cdsIt2NfSEQ_DEVOLUCAO: TIntegerField
      FieldName = 'SEQ_DEVOLUCAO'
    end
    object cdsIt2NfMNF: TStringField
      FieldName = 'MNF'
      FixedChar = True
      Size = 1
    end
    object cdsIt2NfALTERA_ESTOQUE_CFOP: TStringField
      DisplayLabel = 'Alterou Estoque'
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsIt2NfNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
    end
    object cdsIt2NfTIPO_PED: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsIt2NfTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsIt2NfNITEM_PED: TIntegerField
      DisplayLabel = 'N'#186' Item Venda'
      FieldName = 'NITEM_PED'
    end
    object cdsIt2NfCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsIt2NfBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
    end
    object cdsIt2NfPERC_RED_IPI: TFloatField
      DisplayLabel = '% Red IPI'
      FieldName = 'PERC_RED_IPI'
    end
    object cdsIt2NfPERMITIR_DESCONTO: TStringField
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsIt2NfALIQ_ICM_SIMPLES: TFloatField
      DisplayLabel = '%ICMS Simples'
      FieldName = 'ALIQ_ICM_SIMPLES'
      Visible = False
    end
    object cdsIt2NfBASE_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Base ICM Simples'
      FieldName = 'BASE_ICM_SIMPLES'
      Visible = False
    end
    object cdsIt2NfVALOR_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Valor ICM Simples'
      FieldName = 'VALOR_ICM_SIMPLES'
      Visible = False
    end
    object cdsIt2NfALIQ_ISS: TFloatField
      DisplayLabel = 'Aliq ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsIt2NfBASE_ISS: TFloatField
      DisplayLabel = 'Base ISS'
      FieldName = 'BASE_ISS'
    end
    object cdsIt2NfVALOR_ISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VALOR_ISS'
    end
    object cdsIt2NfTERMINAL: TIntegerField
      DisplayLabel = 'Terminal ECF'
      FieldName = 'TERMINAL'
    end
    object cdsIt2NfNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
    end
    object cdsIt2NfNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsIt2NfALTERA_CUSTO_CFOP: TStringField
      DisplayLabel = 'Altera Custo'
      FieldName = 'ALTERA_CUSTO_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsIt2NfDESCRICAO_ITEM_OUTRAS: TMemoField
      FieldName = 'DESCRICAO_ITEM_OUTRAS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsIt2NfECF: TStringField
      DisplayLabel = 'ECF?'
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsIt2NfPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
    end
    object cdsIt2NfPESO_L: TFloatField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESO_L'
    end
    object cdsIt2NfDATA_CUPOM: TDateTimeField
      DisplayLabel = 'Data Cupom'
      FieldName = 'DATA_CUPOM'
    end
    object cdsIt2NfVALOR_DIF: TFloatField
      DisplayLabel = 'Dif ICMS/Compl ST'
      FieldName = 'VALOR_DIF'
    end
    object cdsIt2NfINDTOT: TSmallintField
      FieldName = 'INDTOT'
    end
    object cdsIt2NfMODBCST: TIntegerField
      FieldName = 'MODBCST'
    end
    object cdsIt2NfMODBC: TIntegerField
      FieldName = 'MODBC'
    end
    object cdsIt2NfVALOR_ICM_STDES: TFloatField
      FieldName = 'VALOR_ICM_STDES'
    end
    object cdsIt2NfINDSOMAPISST: TIntegerField
      FieldName = 'INDSOMAPISST'
    end
    object cdsIt2NfINDSOMACOFINSST: TIntegerField
      FieldName = 'INDSOMACOFINSST'
    end
  end
  object dsTemp: TDataSource
    AutoEdit = False
    Left = 1112
    Top = 8
  end
  object qrBuscasNf2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    Left = 313
    Top = 41
  end
  object qrProdForn: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      
        'select cf.grupo_prod, cf.cod_prod, cf.num_fab_fornecedor, cf.cod' +
        '_grade, '
      
        'p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from c' +
        'odigo_fornecedor cf'
      
        'inner join produtos p on p.grupo_prod = cf.grupo_prod and p.cod_' +
        'prod = cf.cod_prod and'
      'p.cod_empresa = cf.cod_empresa')
    Left = 1232
    Top = 72
  end
  object dspProdForn: TDataSetProvider
    DataSet = qrProdForn
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1232
    Top = 120
  end
  object cdsProdForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdForn'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1232
    Top = 168
    object cdsProdFornGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdFornCOD_PROD: TStringField
      DisplayLabel = 'Cod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdFornNUM_FAB_FORNECEDOR: TStringField
      DisplayLabel = 'Codigo do Fornecedor'
      FieldName = 'NUM_FAB_FORNECEDOR'
      Required = True
      Size = 60
    end
    object cdsProdFornNUM_FAB_PROD: TStringField
      DisplayLabel = 'Nosso Codigo'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdFornDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdFornUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProdFornCONSUMO: TStringField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProdFornECF: TStringField
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsProdFornCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
  end
  object dsProdForn: TDataSource
    DataSet = cdsProdForn
    Left = 1232
    Top = 216
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from controles')
    Left = 1296
    Top = 72
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1296
    Top = 120
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1296
    Top = 168
    object cdsCtrlCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsCtrl: TDataSource
    AutoEdit = False
    DataSet = cdsCtrl
    Left = 1296
    Top = 216
  end
  object qrPlC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      
        'select pc.n_conta_plc, pc.desc_plc, gc.desc_gr, dc.desc_dep from' +
        ' p_contas pc'
      'left join grupos_ct gc on pc.grup_ct = gc.grup_ct'
      'left join depart_ct dc on gc.cod_dep = dc.cod_dep'
      'where pc.ativo = 1 and ((pc.sthab is null) or (pc.sthab <> '#39'N'#39'))'
      'order by pc.desc_plc')
    Left = 1232
    Top = 272
  end
  object dspPlC: TDataSetProvider
    DataSet = qrPlC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1232
    Top = 320
  end
  object dsPlC: TDataSource
    AutoEdit = False
    DataSet = cdsPlC
    Left = 1232
    Top = 416
  end
  object cdsPlC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlC'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1232
    Top = 368
    object cdsPlCN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPlCDESC_PLC: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPlCDESC_GR: TStringField
      FieldName = 'DESC_GR'
      FixedChar = True
      Size = 35
    end
    object cdsPlCDESC_DEP: TStringField
      FieldName = 'DESC_DEP'
      Size = 35
    end
  end
  object cdsStAnt: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 224
    Top = 168
    object cdsStAntNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object cdsStAntGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsStAntCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsStAntNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab prod'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsStAntDESCRICAO_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ITEM'
      Size = 60
    end
    object cdsStAntCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object cdsStAntVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valot Tot'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsStAntBASE_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Base ICMS Ant'
      FieldName = 'BASE_ICMSUB_ANT'
    end
    object cdsStAntVALOR_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Valor ICMS Ant'
      FieldName = 'VALOR_ICMSUB_ANT'
    end
    object cdsStAntBCAJUSTE: TFloatField
      DisplayLabel = 'Base ajuste'
      FieldName = 'BCAJUSTE'
    end
    object cdsStAntVAJUSTE: TFloatField
      DisplayLabel = 'Valor ajuste'
      FieldName = 'VAJUSTE'
    end
  end
  object dsStAnt: TDataSource
    AutoEdit = False
    DataSet = cdsStAnt
    Left = 224
    Top = 216
  end
  object qrADI: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      
        'select * from notafiscal_item_adi where cod_nf = 0 and nitem = 0' +
        ' and nitem_di = 0 and nitem_adi = 0')
    Left = 1368
    Top = 72
  end
  object dspADI: TDataSetProvider
    DataSet = qrADI
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1368
    Top = 120
  end
  object cdsADI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspADI'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1368
    Top = 168
    object cdsADICOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsADICOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsADINITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsADINITEM_DI: TIntegerField
      FieldName = 'NITEM_DI'
      Required = True
    end
    object cdsADINITEM_ADI: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM_ADI'
      Required = True
    end
    object cdsADINADICAO: TIntegerField
      DisplayLabel = 'Numero da adi'#231#227'o'
      FieldName = 'NADICAO'
    end
    object cdsADINSEQADIC: TIntegerField
      DisplayLabel = 'N'#176' Sequencial do item dentro da adi'#231#227'o'
      FieldName = 'NSEQADIC'
    end
    object cdsADICFABRICANTE: TStringField
      DisplayLabel = 'C'#243'digo do fabricante estrangeiro'
      FieldName = 'CFABRICANTE'
      Size = 60
    end
    object cdsADIVDESCDI: TFloatField
      DisplayLabel = 'Valor do desconto do item da DI '#8211' adi'#231#227'o'
      FieldName = 'VDESCDI'
      DisplayFormat = '#0.00'
    end
    object cdsADINDRAW: TStringField
      DisplayLabel = 'N'#250'mero do ato concess'#243'rio de Drawback'
      FieldName = 'NDRAW'
      Size = 11
    end
  end
  object dsADI: TDataSource
    AutoEdit = False
    DataSet = cdsADI
    Left = 1368
    Top = 216
  end
  object qrDI: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      
        'select * from notafiscal_item_di where cod_nf = 0 and nitem = 0 ' +
        'and nitem_di = 0')
    Left = 1440
    Top = 72
  end
  object dspDI: TDataSetProvider
    DataSet = qrDI
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1440
    Top = 120
  end
  object cdsDI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDI'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1440
    Top = 168
    object cdsDICOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsDICOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDINITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsDINITEM_DI: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM_DI'
      Required = True
    end
    object cdsDINDI: TStringField
      DisplayLabel = 'N'#250'mero da DI/DSI/DA'
      FieldName = 'NDI'
      Size = 10
    end
    object cdsDIDDI: TDateTimeField
      DisplayLabel = 'Data Registro DI/DSI/DA'
      FieldName = 'DDI'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsDIXLOCDESEMB: TStringField
      DisplayLabel = 'Local de desembara'#231'o'
      FieldName = 'XLOCDESEMB'
      Size = 60
    end
    object cdsDIUFDESEMB: TStringField
      DisplayLabel = 'UF Desembara'#231'o'
      FieldName = 'UFDESEMB'
      FixedChar = True
      Size = 2
    end
    object cdsDIDDESEMB: TDateTimeField
      DisplayLabel = 'Data Desembara'#231'o'
      FieldName = 'DDESEMB'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsDICEXPORTADOR: TStringField
      DisplayLabel = 'C'#243'digo do exportador'
      FieldName = 'CEXPORTADOR'
      Size = 60
    end
    object cdsDITPVIATRANSP: TSmallintField
      DisplayLabel = 'Tipo de via de transporte internaciona'
      FieldName = 'TPVIATRANSP'
    end
    object cdsDIVAFRMM: TFloatField
      DisplayLabel = 'Valor da AFRMM'
      FieldName = 'VAFRMM'
      DisplayFormat = '##0.00'
    end
    object cdsDITPINTERMEDIO: TSmallintField
      DisplayLabel = 'Forma de importa'#231#227'o quanto a intermedia'#231#227'o'
      FieldName = 'TPINTERMEDIO'
    end
    object cdsDICNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsDIUFTERCEIRO: TStringField
      DisplayLabel = 'UF adquirente ou encomendante'
      FieldName = 'UFTERCEIRO'
      Size = 2
    end
  end
  object dsDI: TDataSource
    AutoEdit = False
    DataSet = cdsDI
    Left = 1440
    Top = 216
  end
  object SpBxEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'BAIXA_ESTOQUE'
    Left = 404
    Top = 481
  end
  object transacaoPED: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 224
    Top = 49
  end
  object SpVoltaEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoPED
    StoredProcName = 'AUMENTA_ESTOQUE'
    Left = 340
    Top = 481
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VCOD_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object spIncCodPED: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoPED
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 476
    Top = 481
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
  object qrItVFE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      
        'select nitem, num_fab_prod, descricao_item, valor_unitario, valo' +
        'r_total, quantidade,'
      
        '(select sum(ne.quantidade_nf_vfe) from notafiscal_item_vfe ne wh' +
        'ere ne.cod_nf = ni.cod_nf and ne.cod_empresa = ni.cod_empresa an' +
        'd ne.nitem = ni.nitem)'
      'qtde_util'
      'from notafiscal_item ni'
      'where ni.cod_nf = -1 and ni.cod_empresa = -1')
    Left = 1536
    Top = 72
  end
  object dspItVFE: TDataSetProvider
    DataSet = qrItVFE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1536
    Top = 120
  end
  object cdsItVFE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItVFE'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1536
    Top = 168
    object cdsItVFENITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItVFENUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsItVFEDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 60
    end
    object cdsItVFEVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsItVFEVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsItVFEQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsItVFEQTDE_UTIL: TFloatField
      FieldName = 'QTDE_UTIL'
    end
    object cdsItVFEQTDE_NF: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QTDE_NF'
    end
  end
  object dsItVFE: TDataSource
    AutoEdit = False
    DataSet = cdsItVFE
    Left = 1536
    Top = 216
  end
  object cdsTempITVFE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1535
    Top = 8
    object cdsTempITVFENITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsTempITVFENUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsTempITVFEDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 60
    end
    object cdsTempITVFEQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsTempITVFEVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsTempITVFEVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
  end
  object dsTempITVFE: TDataSource
    AutoEdit = False
    DataSet = cdsTempITVFE
    Left = 1616
    Top = 8
  end
  object dsTemp2: TDataSource
    AutoEdit = False
    Left = 1192
    Top = 8
  end
  object qrCCe: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from notafiscal_carta_correcao'
      'where cod_nf = 0 and cod_empresa = 0 order by nseqevento desc')
    Left = 1608
    Top = 72
  end
  object dspCCe: TDataSetProvider
    DataSet = qrCCe
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1608
    Top = 120
  end
  object cdsCCe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCCe'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1608
    Top = 168
    object cdsCCeCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo NF'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsCCeCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Emp'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCCeIDLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'IDLOTE'
      Required = True
    end
    object cdsCCeNSEQEVENTO: TSmallintField
      DisplayLabel = 'N'#186' Sequencia Evento'
      FieldName = 'NSEQEVENTO'
      Required = True
    end
    object cdsCCeSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
    end
    object cdsCCeXCORRECAO: TMemoField
      DisplayLabel = 'Corre'#231#227'o'
      FieldName = 'XCORRECAO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCCeCSTAT: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CSTAT'
      Size = 4
    end
    object cdsCCeXMOTIVO: TStringField
      DisplayLabel = 'Motivo'
      FieldName = 'XMOTIVO'
      Size = 255
    end
    object cdsCCeNPROT: TStringField
      DisplayLabel = 'N'#176' Protocolo'
      FieldName = 'NPROT'
      Size = 17
    end
    object cdsCCeDHEVENTO: TDateTimeField
      DisplayLabel = 'Data Hora Evento'
      FieldName = 'DHEVENTO'
    end
    object cdsCCeCSTAT_PROC: TIntegerField
      DisplayLabel = 'Codigo Status Resposta'
      FieldName = 'CSTAT_PROC'
    end
    object cdsCCeXMOTIVO_PROC: TStringField
      DisplayLabel = 'Descri'#231#227'o do status da resposta'
      FieldName = 'XMOTIVO_PROC'
      Size = 255
    end
    object cdsCCeTIPO_EVENTO: TStringField
      DisplayLabel = 'Tipo Evento'
      FieldName = 'TIPO_EVENTO'
      Size = 3
    end
  end
  object dsCCe: TDataSource
    AutoEdit = False
    DataSet = cdsCCe
    Left = 1608
    Top = 216
  end
  object cdsTempINf: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 480
  end
  object dsTempINf: TDataSource
    AutoEdit = False
    DataSet = cdsTempINf
    Left = 120
    Top = 480
  end
  object SpMovEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    StoredProcName = 'MOVIMENTA_ESTOQUE'
    Left = 828
    Top = 9
  end
  object qrManDest: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select nfd.*, nf.status as status_nf from NF_DESTINADAS nfd'
      'left join notafiscal nf on'
      '    nf.num_nf = nfd.num_nf'
      '    and nf.serie = nfd.serie_nf'
      '    and nf.cod_empresa = nfd.cod_empresa'
      'where nfd.chave_nfe = '#39#39
      'and nfd.cod_empresa = 0')
    Left = 1696
    Top = 72
  end
  object dspManDest: TDataSetProvider
    DataSet = qrManDest
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1696
    Top = 120
  end
  object cdsManDest: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManDest'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1696
    Top = 168
    object cdsManDestXNOME: TStringField
      DisplayLabel = 'Emitente'
      FieldName = 'XNOME'
      Size = 60
    end
    object cdsManDestCNPJCPF: TStringField
      DisplayLabel = 'CNPJ ou CPF Emitente'
      FieldName = 'CNPJCPF'
      Size = 14
    end
    object cdsManDestIE: TStringField
      DisplayLabel = 'Insc Est'
      FieldName = 'IE'
      Size = 14
    end
    object cdsManDestCHAVE_NFE: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHAVE_NFE'
      Required = True
      Size = 60
    end
    object cdsManDestNUM_NF: TIntegerField
      Tag = 2
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsManDestSERIE_NF: TIntegerField
      Tag = 2
      DisplayLabel = 'Serie NF'
      FieldName = 'SERIE_NF'
    end
    object cdsManDestDATA_EMISSAO: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManDestTPNF: TStringField
      DisplayLabel = 'E/S'
      FieldName = 'TPNF'
      OnGetText = cdsManDestTPNFGetText
      Size = 7
    end
    object cdsManDestVNF: TFloatField
      DisplayLabel = 'Valor NF'
      FieldName = 'VNF'
      DisplayFormat = '##0.00'
    end
    object cdsManDestCSITNFE: TIntegerField
      DisplayLabel = 'Situa'#231#227'o NF-e'
      FieldName = 'CSITNFE'
      OnGetText = cdsManDestCSITNFEGetText
    end
    object cdsManDestDATA_CANC: TDateTimeField
      DisplayLabel = 'Data Cancelamento'
      FieldName = 'DATA_CANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManDestCSITCONF: TIntegerField
      DisplayLabel = 'Codigo Manifesta'#231#227'o Destinat'#225'rio'
      FieldName = 'CSITCONF'
    end
    object cdsManDestMANIFESTACAO: TStringField
      DisplayLabel = 'Manifesta'#231#227'o'
      FieldName = 'MANIFESTACAO'
      Size = 40
    end
    object cdsManDestCCE_TEXTO: TStringField
      DisplayLabel = 'Texto Carta de Corre'#231#227'o Eletronica (CC-e)'
      FieldName = 'CCE_TEXTO'
      Size = 1000
    end
    object cdsManDestDATA_CCE: TDateTimeField
      DisplayLabel = 'Data CC-e'
      FieldName = 'DATA_CCE'
    end
    object cdsManDestIDLOTE: TIntegerField
      DisplayLabel = 'IdLote'
      FieldName = 'IDLOTE'
    end
    object cdsManDestDATA_CIENCIA: TDateTimeField
      DisplayLabel = 'Data Ci'#234'ncia da opera'#231#227'o'
      FieldName = 'DATA_CIENCIA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManDestDATA_CONFIRM: TDateTimeField
      DisplayLabel = 'Data Confirma'#231#227'o da opera'#231#227'o'
      FieldName = 'DATA_CONFIRM'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManDestDATA_DESCONH: TDateTimeField
      DisplayLabel = 'Data desconhecimento da opera'#231#227'o'
      FieldName = 'DATA_DESCONH'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManDestDATA_OPNAOREAL: TDateTimeField
      DisplayLabel = 'Data Opera'#231#227'o n'#227'o Realizada'
      FieldName = 'DATA_OPNAOREAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManDestCULTSTATUSMAN: TIntegerField
      DisplayLabel = 'Codigo Status '#250'ltima manifesta'#231#227'o'
      FieldName = 'CULTSTATUSMAN'
    end
    object cdsManDestULTIMOMOTIVOMAN: TStringField
      DisplayLabel = 'Mensagem de retorno da '#250'ltima manifesta'#231#227'o'
      FieldName = 'ULTIMOMOTIVOMAN'
      Size = 255
    end
    object cdsManDestCSITCONFPEDIDO: TIntegerField
      DisplayLabel = 'Cst Conf Pedido'
      FieldName = 'CSITCONFPEDIDO'
    end
    object cdsManDestPASTA_DOWNLOAD: TStringField
      DisplayLabel = 'Diret'#243'rio XML'
      FieldName = 'PASTA_DOWNLOAD'
      Size = 500
    end
    object cdsManDestBAIXADA: TStringField
      DisplayLabel = 'Baixada'
      FieldName = 'BAIXADA'
      Size = 1
    end
    object cdsManDestSTATUS_NFE: TStringField
      DisplayLabel = 'Status NFE'
      FieldName = 'STATUS_NFE'
      Size = 10
    end
    object cdsManDestCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsManDestSTATUS: TStringField
      Tag = 1
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsManDestNSUDFE: TLargeintField
      DisplayLabel = 'NSU DF-e'
      FieldName = 'NSUDFE'
    end
    object cdsManDestXJUST: TStringField
      DisplayLabel = 'Justificativa Opera'#231#227'o n'#227'o realizada'
      FieldName = 'XJUST'
      Size = 255
    end
    object cdsManDestSTATUS_NF: TStringField
      DisplayLabel = 'Status NF'
      FieldName = 'STATUS_NF'
      ProviderFlags = [pfInWhere]
      Size = 10
    end
  end
  object dsManDest: TDataSource
    AutoEdit = False
    DataSet = cdsManDest
    Left = 1696
    Top = 216
  end
  object qrTmp1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    Left = 1376
    Top = 280
  end
  object dspTmp1: TDataSetProvider
    DataSet = qrTmp1
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1376
    Top = 328
  end
  object cdsTmp1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp1'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1376
    Top = 376
  end
  object qrTmp2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from nf_destinadas'
      'where chave_nfe = '#39#39' and cod_empresa = 0')
    Left = 1424
    Top = 280
  end
  object dspTmp2: TDataSetProvider
    DataSet = qrTmp2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1424
    Top = 328
  end
  object cdsTmp2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp2'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1424
    Top = 376
  end
  object qrTmp3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      'select * from nf_destinadas'
      'where chave_nfe = '#39#39' and cod_empresa = 0')
    Left = 1472
    Top = 280
  end
  object dspTmp3: TDataSetProvider
    DataSet = qrTmp3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1472
    Top = 328
  end
  object cdsTmp3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp3'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1472
    Top = 376
  end
  object cdsItemPedBaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 488
    object cdsItemPedBaixaGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsItemPedBaixaCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsItemPedBaixaDESCR_PROD: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'DESCR_PROD'
      Size = 60
    end
    object cdsItemPedBaixaNUM_PED: TIntegerField
      DisplayLabel = 'Num Ped'
      FieldName = 'NUM_PED'
    end
    object cdsItemPedBaixaNITEM: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM'
    end
    object cdsItemPedBaixaQUANT_IT_PROD: TFloatField
      DisplayLabel = 'Qtde Pedido'
      FieldName = 'QUANT_IT_PROD'
    end
    object cdsItemPedBaixaQTDE_RECEBIDA: TFloatField
      DisplayLabel = 'Qtde Recebida'
      FieldName = 'QTDE_RECEBIDA'
    end
    object cdsItemPedBaixaQTDE_NF: TFloatField
      DisplayLabel = 'Qtde NF'
      FieldName = 'QTDE_NF'
    end
    object cdsItemPedBaixaQTDE_PENDENTE: TFloatField
      DisplayLabel = 'Qtde Pendente'
      FieldName = 'QTDE_PENDENTE'
    end
    object cdsItemPedBaixaQTDE_PENDENTE_ATUAL: TFloatField
      DisplayLabel = 'Qtde Pendente Atual'
      FieldName = 'QTDE_PENDENTE_ATUAL'
    end
    object cdsItemPedBaixaSEL: TStringField
      DisplayLabel = '...'
      FieldName = 'SEL'
      Size = 1
    end
    object cdsItemPedBaixaCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object cdsItemPedBaixaNITEM_NF: TIntegerField
      FieldName = 'NITEM_NF'
    end
  end
  object dsItemPedBaixa: TDataSource
    AutoEdit = False
    DataSet = cdsItemPedBaixa
    Left = 632
    Top = 488
  end
  object cdsItemPedBaixaNF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 848
    Top = 488
    object IntegerField1: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object StringField1: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Size = 6
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Num Ped'
      FieldName = 'NUM_PED'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM'
    end
    object cdsItemPedBaixaNFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object cdsItemPedBaixaNFNITEM_NF: TIntegerField
      FieldName = 'NITEM_NF'
    end
    object cdsItemPedBaixaNFQTDE_BAIXA: TFloatField
      FieldName = 'QTDE_BAIXA'
    end
  end
  object qrDetExp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      
        'select * from NOTAFISCAL_ITEM_DETEXPORT where cod_nf = 0 and nit' +
        'em = 0 and NITEM_DET = 0')
    Left = 1776
    Top = 72
  end
  object dspDetExp: TDataSetProvider
    DataSet = qrDetExp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1776
    Top = 120
  end
  object cdsDetExp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetExp'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1776
    Top = 168
    object cdsDetExpCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object cdsDetExpCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsDetExpNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsDetExpNITEM_DET: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM_DET'
    end
    object cdsDetExpNDRAW: TStringField
      DisplayLabel = 'N'#250'mero do ato concess'#243'rio de Drawback'
      FieldName = 'NDRAW'
      Size = 11
    end
  end
  object dsDetExp: TDataSource
    AutoEdit = False
    DataSet = cdsDetExp
    Left = 1776
    Top = 216
  end
  object qrDetExpInd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    AfterCancel = cdsServTransporteBeforeOpen
    SQL.Strings = (
      
        'select * from NOTAFISCAL_ITEM_DETEXPORT where cod_nf = 0 and nit' +
        'em = 0 and NITEM_DET = 0')
    Left = 1848
    Top = 72
  end
  object dspDetExpInd: TDataSetProvider
    DataSet = qrDetExpInd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1848
    Top = 120
  end
  object cdsDetExpInd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetExpInd'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1848
    Top = 168
    object cdsDetExpIndCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object cdsDetExpIndCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsDetExpIndNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsDetExpIndNITEM_DET: TIntegerField
      FieldName = 'NITEM_DET'
    end
    object cdsDetExpIndNITEM_EXIND: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM_EXIND'
    end
    object cdsDetExpIndNRE: TStringField
      DisplayLabel = 'N'#250'mero do Registro de Exporta'#231#227'o '
      FieldName = 'NRE'
      Size = 12
    end
    object cdsDetExpIndCHNFE: TStringField
      DisplayLabel = 'Chave de Acesso da NF-e recebida para exporta'#231#227'o'
      FieldName = 'CHNFE'
      Size = 44
    end
    object cdsDetExpIndQEXPORT: TFloatField
      DisplayLabel = 'Quantidade do item realmente exportado'
      FieldName = 'QEXPORT'
      DisplayFormat = '##0.0000'
    end
  end
  object dsDetExpInd: TDataSource
    AutoEdit = False
    DataSet = cdsDetExpInd
    Left = 1848
    Top = 216
  end
  object qrBuscasNf3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    Left = 369
    Top = 41
  end
  object qrCombustivelFab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from tp_comb_renavam where ativo = 1')
    Left = 1552
    Top = 280
  end
  object dspCombustivelFab: TDataSetProvider
    DataSet = qrCombustivelFab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1552
    Top = 328
  end
  object cdsCombustivelFab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCombustivelFab'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1552
    Top = 376
    object cdsCombustivelFabCODIGO_TPCOMB: TIntegerField
      FieldName = 'CODIGO_TPCOMB'
      Required = True
    end
    object cdsCombustivelFabDESCR_COMB: TStringField
      FieldName = 'DESCR_COMB'
      Size = 50
    end
    object cdsCombustivelFabATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsCombustivelFab: TDataSource
    DataSet = cdsCombustivelFab
    Left = 1552
    Top = 424
  end
  object qrMarcaFab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from marca_prod where tipo_marca = '#39'V'#39' and ativo = 1')
    Left = 1656
    Top = 280
  end
  object dspMarcaFab: TDataSetProvider
    DataSet = qrMarcaFab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1656
    Top = 328
  end
  object cdsMarcaFab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarcaFab'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1656
    Top = 376
    object cdsMarcaFabCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Required = True
    end
    object cdsMarcaFabDESCRICAO_MARCA: TStringField
      FieldName = 'DESCRICAO_MARCA'
      FixedChar = True
      Size = 30
    end
    object cdsMarcaFabCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object cdsMarcaFabCOD_USUARIO_ALT: TIntegerField
      FieldName = 'COD_USUARIO_ALT'
    end
    object cdsMarcaFabATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsMarcaFabTIPO_MARCA: TStringField
      FieldName = 'TIPO_MARCA'
      FixedChar = True
      Size = 1
    end
  end
  object dsMarcaFab: TDataSource
    DataSet = cdsMarcaFab
    Left = 1656
    Top = 424
  end
  object qrModV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from TIPMODELO')
    Left = 344
    Top = 80
  end
  object dspModV: TDataSetProvider
    DataSet = qrModV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 344
    Top = 128
  end
  object cdsModV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModV'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 344
    Top = 176
    object cdsModVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsModVCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsModVDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsModVCILINDRADA: TIntegerField
      FieldName = 'CILINDRADA'
    end
    object cdsModVDESFAB: TStringField
      FieldName = 'DESFAB'
      Size = 200
    end
    object cdsModVCODIGOFAB: TStringField
      FieldName = 'CODIGOFAB'
      Size = 100
    end
    object cdsModVCILINDROS: TIntegerField
      FieldName = 'CILINDROS'
    end
    object cdsModVCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      Size = 50
    end
    object cdsModVHP: TFloatField
      FieldName = 'HP'
    end
    object cdsModVLOTACAO: TStringField
      FieldName = 'LOTACAO'
      FixedChar = True
      Size = 10
    end
    object cdsModVTIPO: TStringField
      FieldName = 'TIPO'
      Size = 30
    end
    object cdsModVRENAVAM: TStringField
      DisplayWidth = 6
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 6
    end
    object cdsModVAFATURAR: TIntegerField
      FieldName = 'AFATURAR'
    end
    object cdsModVVNDESTOQUE: TStringField
      FieldName = 'VNDESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsModVVALTAB: TFloatField
      FieldName = 'VALTAB'
    end
    object cdsModVVLBICMSUB: TFloatField
      FieldName = 'VLBICMSUB'
    end
    object cdsModVVLICMSUB: TFloatField
      FieldName = 'VLICMSUB'
    end
    object cdsModVANO1: TIntegerField
      FieldName = 'ANO1'
    end
    object cdsModVMODELO1: TIntegerField
      FieldName = 'MODELO1'
    end
    object cdsModVINICHASSI1: TStringField
      FieldName = 'INICHASSI1'
      Size = 11
    end
    object cdsModVANO2: TIntegerField
      FieldName = 'ANO2'
    end
    object cdsModVMODELO2: TIntegerField
      FieldName = 'MODELO2'
    end
    object cdsModVINICHASSI2: TStringField
      FieldName = 'INICHASSI2'
      Size = 11
    end
    object cdsModVORDTIPO: TIntegerField
      FieldName = 'ORDTIPO'
    end
    object cdsModVPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
    end
    object cdsModVCOD_FIPE: TStringField
      FieldName = 'COD_FIPE'
      FixedChar = True
      Size = 8
    end
    object cdsModVATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsModVNOME_PLAN: TStringField
      FieldName = 'NOME_PLAN'
      FixedChar = True
      Size = 30
    end
    object cdsModVURL_HONDA: TStringField
      FieldName = 'URL_HONDA'
      Size = 128
    end
    object cdsModVSITE: TStringField
      FieldName = 'SITE'
      FixedChar = True
      Size = 1
    end
    object cdsModVMES_RET_SERV1: TIntegerField
      FieldName = 'MES_RET_SERV1'
    end
    object cdsModVKM_RET_SERV1: TIntegerField
      FieldName = 'KM_RET_SERV1'
    end
    object cdsModVMES_RET_SERV3: TIntegerField
      FieldName = 'MES_RET_SERV3'
    end
    object cdsModVKM_RET_SERV3: TIntegerField
      FieldName = 'KM_RET_SERV3'
    end
    object cdsModVINTERV_KM_SERV: TIntegerField
      FieldName = 'INTERV_KM_SERV'
    end
    object cdsModVTIP_VEICULO: TStringField
      FieldName = 'TIP_VEICULO'
      Size = 2
    end
    object cdsModVCMKG: TStringField
      FieldName = 'CMKG'
      Size = 9
    end
    object cdsModVDISTANCIAEIXO: TStringField
      FieldName = 'DISTANCIAEIXO'
      Size = 4
    end
    object cdsModVPESOL: TIntegerField
      FieldName = 'PESOL'
    end
    object cdsModVPESOB: TIntegerField
      FieldName = 'PESOB'
    end
    object cdsModVVL_UNITARIO_NF: TFloatField
      FieldName = 'VL_UNITARIO_NF'
    end
    object cdsModVESPRENAVAM: TStringField
      FieldName = 'ESPRENAVAM'
      Size = 2
    end
    object cdsModVNCMSH: TStringField
      FieldName = 'NCMSH'
      Size = 8
    end
    object cdsModVTPCOMB: TStringField
      FieldName = 'TPCOMB'
      FixedChar = True
      Size = 2
    end
    object cdsModVVALOR_PIS: TFloatField
      FieldName = 'VALOR_PIS'
    end
    object cdsModVVALOR_COFINS: TFloatField
      FieldName = 'VALOR_COFINS'
    end
    object cdsModVMARCA_DESC: TStringField
      FieldName = 'MARCA_DESC'
      Size = 32
    end
    object cdsModVCOD_CTA_EST_VEIC: TStringField
      FieldName = 'COD_CTA_EST_VEIC'
      Size = 60
    end
    object cdsModVCOD_CTA_EST_SEMI: TStringField
      FieldName = 'COD_CTA_EST_SEMI'
      Size = 60
    end
    object cdsModVCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object cdsModVCOD_COMBUSTIVEL: TIntegerField
      FieldName = 'COD_COMBUSTIVEL'
    end
    object cdsModVCOD_TIPO_ESP: TIntegerField
      FieldName = 'COD_TIPO_ESP'
    end
    object cdsModVORD_MOD: TIntegerField
      FieldName = 'ORD_MOD'
    end
    object cdsModVPERC_RED: TFloatField
      FieldName = 'PERC_RED'
    end
    object cdsModVRED_LUCRO: TStringField
      FieldName = 'RED_LUCRO'
      Size = 1
    end
    object cdsModVCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
  end
  object dsModV: TDataSource
    DataSet = cdsModV
    Left = 344
    Top = 224
  end
  object qrNFPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select'
      
        'notafiscal_pag.cod_nf, notafiscal_pag.cod_empresa, notafiscal_pa' +
        'g.seqid,'
      
        'notafiscal_pag.tpag, notafiscal_pag.vpag, notafiscal_pag.cnpj, n' +
        'otafiscal_pag.tband,'
      
        'notafiscal_pag.caut, notafiscal_pag.cod_controle, notafiscal_pag' +
        '.tpintegra, controles.nome_ctrl'
      'from notafiscal_pag'
      
        'left join controles on controles.codigo_ctrl = notafiscal_pag.co' +
        'd_controle and'
      'controles.codigo_emp = notafiscal_pag.cod_empresa'
      
        'where notafiscal_pag.cod_nf = 0 and notafiscal_pag.cod_empresa =' +
        ' 0 and notafiscal_pag.seqid = 0')
    Left = 1736
    Top = 288
  end
  object dspNFPag: TDataSetProvider
    DataSet = qrNFPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1736
    Top = 336
  end
  object cdsNFPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFPag'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1736
    Top = 384
    object cdsNFPagCOD_NF: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNFPagCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFPagSEQID: TIntegerField
      DisplayLabel = 'SeqID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsNFPagTPAG: TSmallintField
      DisplayLabel = 'TPag'
      FieldName = 'TPAG'
    end
    object cdsNFPagVPAG: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VPAG'
      DisplayFormat = '##0.00'
    end
    object cdsNFPagCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsNFPagTBAND: TSmallintField
      DisplayLabel = 'Bandeira'
      FieldName = 'TBAND'
    end
    object cdsNFPagCAUT: TStringField
      DisplayLabel = 'Autorizacao'
      FieldName = 'CAUT'
    end
    object cdsNFPagCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsNFPagTPINTEGRA: TStringField
      DisplayLabel = 'Integra'
      FieldName = 'TPINTEGRA'
      FixedChar = True
      Size = 1
    end
    object cdsNFPagORIGEM_PED: TStringField
      FieldName = 'ORIGEM_PED'
      Size = 1
    end
    object cdsNFPagINDPAG: TStringField
      DisplayLabel = 'Ind Pag'
      FieldName = 'INDPAG'
      Size = 1
    end
    object cdsNFPagXPAG: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'XPAG'
      Size = 60
    end
  end
  object dsNFPag: TDataSource
    AutoEdit = False
    DataSet = cdsNFPag
    Left = 1736
    Top = 432
  end
  object qrCtrlFormPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      
        'select '#39'C'#39'||controles.codigo_ctrl ID, controles.codigo_ctrl, con' +
        'troles.nome_ctrl, controles.nfce_tpag, clientes.cpfcgc,'
      'controles.cartao_sped, controles.qseqperf, controles.nat_ctrl'
      'from controles'
      
        'inner join clientes on clientes.cod_cliente = controles.cartao_s' +
        'ped_part and clientes.cod_empresa = controles.codigo_emp'
      
        'where controles.cxent = '#39'S'#39' and controles.codigo_emp = 1 and con' +
        'troles.nfce_tpag > 0'
      'and controles.cartao_sped in (1, 2)'
      'union'
      
        'select '#39'C'#39'||controles.codigo_ctrl ID, controles.codigo_ctrl, con' +
        'troles.nome_ctrl, controles.nfce_tpag, '#39' '#39' cpfcgc,'
      'controles.cartao_sped, controles.qseqperf, controles.nat_ctrl'
      'from controles'
      
        'where controles.cxent = '#39'S'#39' and controles.codigo_emp = 1 and con' +
        'troles.nfce_tpag > 0'
      'and coalesce(controles.cartao_sped,0) not in (1, 2)'
      'union'
      
        'select '#39'N01'#39', 0, '#39'01 - Dinheiro'#39'         ,  1, '#39' '#39', 0, 901, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N02'#39', 0, '#39'02 - Cheque'#39'           ,  2, '#39' '#39', 0, 902, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N03'#39', 0, '#39'03 - Cart'#227'o de Cr'#233'dito'#39',  3, '#39' '#39', 0, 903, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N04'#39', 0, '#39'04 - Cart'#227'o de D'#233'bito'#39' ,  4, '#39' '#39', 0, 904, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N05'#39', 0, '#39'05 - Cr'#233'dito Loja'#39'     ,  5, '#39' '#39', 0, 905, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N10'#39', 0, '#39'10 - Vale Alimenta'#231#227'o'#39' , 10, '#39' '#39', 0, 910, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N11'#39', 0, '#39'11 - Vale Refei'#231#227'o'#39'    , 11, '#39' '#39', 0, 911, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N12'#39', 0, '#39'12 - Vale Presente'#39'    , 12, '#39' '#39', 0, 912, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N13'#39', 0, '#39'13 - Vale Combust'#237'vel'#39' , 13, '#39' '#39', 0, 913, '#39' '#39' ' +
        'from rdb$database union'
      
        'select '#39'N99'#39', 0, '#39'99 - Outros'#39'           , 99, '#39' '#39', 0, 999, '#39' '#39' ' +
        'from rdb$database'
      'order by 7')
    Left = 1811
    Top = 288
  end
  object dspCtrlFormPag: TDataSetProvider
    DataSet = qrCtrlFormPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1811
    Top = 336
  end
  object cdsCtrlFormPag: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlFormPag'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1811
    Top = 384
    object cdsCtrlFormPagID: TStringField
      FieldName = 'ID'
      Size = 12
    end
    object cdsCtrlFormPagCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlFormPagNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlFormPagNFCE_TPAG: TIntegerField
      FieldName = 'NFCE_TPAG'
    end
    object cdsCtrlFormPagCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsCtrlFormPagCARTAO_SPED: TIntegerField
      FieldName = 'CARTAO_SPED'
    end
    object cdsCtrlFormPagQSEQPERF: TIntegerField
      FieldName = 'QSEQPERF'
    end
    object cdsCtrlFormPagNAT_CTRL: TStringField
      FieldName = 'NAT_CTRL'
      Size = 1
    end
  end
  object dsCtrlFormPag: TDataSource
    AutoEdit = False
    DataSet = cdsCtrlFormPag
    Left = 1811
    Top = 432
  end
  object qrNFDup: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from notafiscal_dup'
      
        'where notafiscal_dup.cod_nf = 0 and notafiscal_dup.cod_empresa =' +
        ' 0 and notafiscal_dup.seqid = 0')
    Left = 1896
    Top = 288
  end
  object dspNFDup: TDataSetProvider
    DataSet = qrNFDup
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1896
    Top = 336
  end
  object cdsNFDup: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFDup'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1896
    Top = 384
    object cdsNFDupCOD_NF: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNFDupCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFDupSEQID: TIntegerField
      DisplayLabel = 'Seq ID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsNFDupNDOC: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
      Size = 10
    end
    object cdsNFDupNDUP: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NDUP'
      Size = 60
    end
    object cdsNFDupDVENC: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DVENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNFDupVDUP: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VDUP'
      DisplayFormat = '##0.00'
    end
    object cdsNFDupCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsNFDupSEQFORM: TIntegerField
      DisplayLabel = 'Seq FP'
      FieldName = 'SEQFORM'
    end
    object cdsNFDupN_SEQ_BOL: TIntegerField
      FieldName = 'N_SEQ_BOL'
    end
  end
  object dsNFDup: TDataSource
    AutoEdit = False
    DataSet = cdsNFDup
    Left = 1896
    Top = 432
  end
  object qrNFeInut: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      
        'select * from notafiscal_inut where seqid = 0 and cod_empresa = ' +
        '0')
    Left = 1936
    Top = 80
  end
  object dspNFeInut: TDataSetProvider
    DataSet = qrNFeInut
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1936
    Top = 128
  end
  object cdsNFeInut: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFeInut'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1936
    Top = 176
    object cdsNFeInutSEL: TStringField
      DisplayLabel = '..'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsNFeInutSEQID: TIntegerField
      Tag = 2
      DisplayLabel = 'SeqID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsNFeInutTPAMB: TStringField
      DisplayLabel = 'Ambiente'
      FieldName = 'TPAMB'
      FixedChar = True
      Size = 1
    end
    object cdsNFeInutANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      DisplayFormat = '00'
    end
    object cdsNFeInutCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsNFeInutMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsNFeInutSERIE: TSmallintField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
    end
    object cdsNFeInutNNFINI: TIntegerField
      DisplayLabel = 'Num Faixa Inicial'
      FieldName = 'NNFINI'
    end
    object cdsNFeInutNNFFIN: TIntegerField
      DisplayLabel = 'Num Faixa Final'
      FieldName = 'NNFFIN'
    end
    object cdsNFeInutXJUST: TStringField
      DisplayLabel = 'Justificativa'
      FieldName = 'XJUST'
      Size = 255
    end
    object cdsNFeInutCSTAT: TSmallintField
      DisplayLabel = 'Codigo Resposta'
      FieldName = 'CSTAT'
    end
    object cdsNFeInutXMOTIVO: TStringField
      DisplayLabel = 'Mensagem'
      FieldName = 'XMOTIVO'
      Size = 255
    end
    object cdsNFeInutDHRECBTO: TDateTimeField
      DisplayLabel = 'Data recbto'
      FieldName = 'DHRECBTO'
    end
    object cdsNFeInutNPROT: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'NPROT'
      Size = 17
    end
    object cdsNFeInutID_DFE: TStringField
      DisplayLabel = 'ID Inut'
      FieldName = 'ID_DFE'
      Size = 41
    end
    object cdsNFeInutXML_INUT: TMemoField
      Tag = 1
      DisplayLabel = 'XML Inut'
      FieldName = 'XML_INUT'
      Visible = False
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFeInutCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
  end
  object dsNFeInut: TDataSource
    AutoEdit = False
    DataSet = cdsNFeInut
    Left = 1936
    Top = 224
  end
  object qrNfInteg: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoNF
    SQL.Strings = (
      'select * from vw_notafiscal_integ'
      'where cod_nf = 0'
      'and cod_empresa = 0')
    Left = 1976
    Top = 288
  end
  object dspNfInteg: TDataSetProvider
    DataSet = qrNfInteg
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1976
    Top = 336
  end
  object cdsNfInteg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNfInteg'
    BeforeOpen = cdsServTransporteBeforeOpen
    Left = 1976
    Top = 384
    object cdsNfIntegSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsNfIntegCOD_NF: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_NF'
      ReadOnly = True
    end
    object cdsNfIntegCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      ReadOnly = True
    end
    object cdsNfIntegNATUREZA_NF: TStringField
      DisplayLabel = 'E/S'
      FieldName = 'NATUREZA_NF'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsNfIntegTIPO_NF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_NF'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsNfIntegNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      ReadOnly = True
    end
    object cdsNfIntegSERIE_NF: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_NF'
      ReadOnly = True
      Size = 5
    end
    object cdsNfIntegMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      ReadOnly = True
      Size = 3
    end
    object cdsNfIntegSTATUS_NF: TStringField
      DisplayLabel = 'Status NF-e'
      FieldName = 'STATUS_NF'
      ReadOnly = True
      Size = 10
    end
    object cdsNfIntegSITUACAO_NF: TStringField
      DisplayLabel = 'Situacao NF-e'
      FieldName = 'SITUACAO_NF'
      ReadOnly = True
      Size = 40
    end
    object cdsNfIntegDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      ReadOnly = True
    end
    object cdsNfIntegDATA_CONTABIL: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_CONTABIL'
      ReadOnly = True
    end
    object cdsNfIntegDATA_ENT_SAIDA: TDateTimeField
      DisplayLabel = 'Data Entrada/Saida'
      FieldName = 'DATA_ENT_SAIDA'
      ReadOnly = True
    end
    object cdsNfIntegVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total NF'
      FieldName = 'VALOR_TOTAL'
      currency = True
    end
    object cdsNfIntegVALOR_PROD: TFloatField
      DisplayLabel = 'Valor Produtos'
      FieldName = 'VALOR_PROD'
      currency = True
    end
    object cdsNfIntegVALOR_SERV: TFloatField
      DisplayLabel = 'Valor Servi'#231'os'
      FieldName = 'VALOR_SERV'
      currency = True
    end
    object cdsNfIntegNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      ReadOnly = True
    end
    object cdsNfIntegTIPO_VENDA: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object cdsNfIntegCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      ReadOnly = True
      FixedChar = True
      Size = 17
    end
    object cdsNfIntegPLACA: TStringField
      Tag = 1
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object cdsNfIntegCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
      ReadOnly = True
    end
    object cdsNfIntegMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      ReadOnly = True
      Size = 32
    end
    object cdsNfIntegCOD_VERSAO: TIntegerField
      DisplayLabel = 'Cod Versao'
      FieldName = 'COD_VERSAO'
      ReadOnly = True
    end
    object cdsNfIntegVERSAO: TStringField
      DisplayLabel = 'Versao'
      FieldName = 'VERSAO'
      ReadOnly = True
      Size = 60
    end
    object cdsNfIntegCOD_ESPECIE: TIntegerField
      DisplayLabel = 'Cod Especie'
      FieldName = 'COD_ESPECIE'
      ReadOnly = True
    end
    object cdsNfIntegESPECIE: TStringField
      DisplayLabel = 'Especie'
      FieldName = 'ESPECIE'
      ReadOnly = True
      Size = 30
    end
    object cdsNfIntegCOD_COMBUSTIVEL: TIntegerField
      DisplayLabel = 'Cod Combustivel'
      FieldName = 'COD_COMBUSTIVEL'
      ReadOnly = True
    end
    object cdsNfIntegCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combustivel'
      FieldName = 'COMBUSTIVEL'
      ReadOnly = True
      Size = 50
    end
    object cdsNfIntegCOD_COR: TIntegerField
      DisplayLabel = 'Cod Cor'
      FieldName = 'COD_COR'
      ReadOnly = True
    end
    object cdsNfIntegCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      ReadOnly = True
      Size = 30
    end
    object cdsNfIntegANO_FAB: TIntegerField
      DisplayLabel = 'Ano Fab'
      FieldName = 'ANO_FAB'
      ReadOnly = True
    end
    object cdsNfIntegANO_MOD: TIntegerField
      DisplayLabel = 'Ano Mod'
      FieldName = 'ANO_MOD'
      ReadOnly = True
    end
    object cdsNfIntegXML: TMemoField
      Tag = 1
      DisplayLabel = 'Xml'
      FieldName = 'XML'
      ReadOnly = True
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfIntegID_PROTOCOLO: TIntegerField
      DisplayLabel = 'Id Protocolo'
      FieldName = 'ID_PROTOCOLO'
      ReadOnly = True
    end
    object cdsNfIntegID_PROCESSO: TIntegerField
      DisplayLabel = 'Id Processo'
      FieldName = 'ID_PROCESSO'
      ReadOnly = True
    end
  end
  object dsNfInteg: TDataSource
    AutoEdit = False
    DataSet = cdsNfInteg
    Left = 1976
    Top = 432
  end
end
