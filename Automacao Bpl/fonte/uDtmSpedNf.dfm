object dtmSpedNf: TdtmSpedNf
  OldCreateOrder = False
  Height = 594
  Width = 1031
  object qrInfCompl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from SPED_INFORMACAO_COMPLEMENTAR')
    Left = 24
    Top = 72
  end
  object dspInfCompl: TDataSetProvider
    DataSet = qrInfCompl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 120
  end
  object cdsInfCompl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInfCompl'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 24
    Top = 168
    object cdsInfComplCOD_INF: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsInfComplCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsInfComplTXT: TStringField
      DisplayLabel = 'Texto'
      FieldName = 'TXT'
      Size = 510
    end
    object cdsInfComplTXT_COMPL: TStringField
      DisplayLabel = 'Texto Complementar'
      FieldName = 'TXT_COMPL'
      Size = 510
    end
    object cdsInfComplTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsInfComplATIVO_EM_NFE: TStringField
      FieldName = 'ATIVO_EM_NFE'
      Size = 1
    end
    object cdsInfComplATIVO_EM_NFCE: TStringField
      FieldName = 'ATIVO_EM_NFCE'
      Size = 1
    end
  end
  object dsInfCompl: TDataSource
    AutoEdit = False
    DataSet = cdsInfCompl
    Left = 24
    Top = 216
  end
  object qrC110: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C110')
    Left = 288
    Top = 72
  end
  object dspC110: TDataSetProvider
    DataSet = qrC110
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 288
    Top = 120
  end
  object cdsC110: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC110'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 288
    Top = 168
    object cdsC110COD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsC110COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsC110COD_INF: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsC110TXT_COMPL: TStringField
      DisplayLabel = 'Texto Complementar'
      FieldName = 'TXT_COMPL'
      Size = 510
    end
    object cdsC110TXT: TStringField
      DisplayLabel = 'Texto'
      FieldKind = fkLookup
      FieldName = 'TXT'
      LookupDataSet = cdsInfCompl
      LookupKeyFields = 'COD_INF'
      LookupResultField = 'TXT'
      KeyFields = 'COD_INF'
      Size = 510
      Lookup = True
    end
    object cdsC110TIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object dsC110: TDataSource
    AutoEdit = False
    DataSet = cdsC110
    Left = 288
    Top = 216
  end
  object qrC111: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C111')
    Left = 360
    Top = 72
  end
  object dspC111: TDataSetProvider
    DataSet = qrC111
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 360
    Top = 120
  end
  object cdsC111: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC111'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 360
    Top = 168
    object cdsC111COD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsC111COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsC111COD_INF: TIntegerField
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsC111NUM_PROC: TStringField
      DisplayLabel = 'Identifica'#231#227'o do processo ou ato concess'#243'rio.'
      FieldName = 'NUM_PROC'
      Size = 15
    end
    object cdsC111IND_PROC: TStringField
      DisplayLabel = 'Indicador da origem'
      FieldName = 'IND_PROC'
      FixedChar = True
      Size = 1
    end
    object cdsC111COD_ACAO_JUDICIAL: TIntegerField
      DisplayLabel = 'C'#243'digo da A'#231#227'o Judicial no Cadastro'
      FieldName = 'COD_ACAO_JUDICIAL'
    end
    object cdsC111COD_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo do Processo Administrativo no Cadastro'
      FieldName = 'COD_ADM'
    end
  end
  object dsC111: TDataSource
    AutoEdit = False
    DataSet = cdsC111
    Left = 360
    Top = 216
  end
  object qrC112: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C112')
    Left = 424
    Top = 72
  end
  object dspC112: TDataSetProvider
    DataSet = qrC112
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 424
    Top = 120
  end
  object cdsC112: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC112'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 424
    Top = 168
    object cdsC112COD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsC112COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsC112COD_INF: TIntegerField
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsC112NITEM: TIntegerField
      DisplayLabel = 'N'#186
      FieldName = 'NITEM'
      Required = True
    end
    object cdsC112COD_DA: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'COD_DA'
      FixedChar = True
      Size = 1
    end
    object cdsC112UF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsC112NUM_DA: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'NUM_DA'
    end
    object cdsC112COD_AUT: TStringField
      DisplayLabel = 'Autentica'#231#227'o'
      FieldName = 'COD_AUT'
      Size = 64
    end
    object cdsC112VL_DA: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_DA'
    end
    object cdsC112DT_VCTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DT_VCTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsC112DT_PGTO: TDateTimeField
      DisplayLabel = 'Pagamento'
      FieldName = 'DT_PGTO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dsC112: TDataSource
    AutoEdit = False
    DataSet = cdsC112
    Left = 424
    Top = 216
  end
  object qrC113: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C113')
    Left = 480
    Top = 72
  end
  object dspC113: TDataSetProvider
    DataSet = qrC113
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 480
    Top = 120
  end
  object cdsC113: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC113'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 480
    Top = 168
    object cdsC113COD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsC113COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsC113COD_INF: TIntegerField
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsC113COD_NF_REF: TIntegerField
      DisplayLabel = 'Cod Nf'
      FieldName = 'COD_NF_REF'
      Required = True
    end
    object cdsC113CHAVE_NFE_REF: TStringField
      DisplayLabel = 'Chave NFe'
      FieldName = 'CHAVE_NFE_REF'
      Size = 44
    end
  end
  object dsC113: TDataSource
    AutoEdit = False
    DataSet = cdsC113
    Left = 480
    Top = 216
  end
  object qrNFSped: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      
        'select nf.cod_nf, nf.natureza_nf, nf.tipo_nf, nf.num_nf, nf.seri' +
        'e, nf.modelo_nf,'
      'cl.cod_cliente, cl.nome_cliente'
      'from notafiscal nf'
      
        'inner join clientes cl on cl.cod_cliente =  nf.cod_cliente and c' +
        'l.cod_empresa ='
      'nf.cod_empresa'
      'union'
      
        'select null, null, null, null, null, null, null, null, nf3.chave' +
        '_nfe_ref'
      'from notafiscal_sped_c113 nf3'
      
        'where nf3.cod_nf = nf.cod_nf and cod_empresa = nf3.cod_empresa =' +
        ' nf.cod_empresa')
    Left = 104
    Top = 72
  end
  object dspNFSped: TDataSetProvider
    DataSet = qrNFSped
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 104
    Top = 120
  end
  object cdsNFSped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFSped'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 104
    Top = 168
    object cdsNFSpedCOD_NF: TIntegerField
      DisplayLabel = 'Cod Nf'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNFSpedNATUREZA_NF: TStringField
      DisplayLabel = 'Natureza E/S'
      FieldName = 'NATUREZA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNFSpedTIPO_NF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNFSpedNUM_NF: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUM_NF'
      Required = True
    end
    object cdsNFSpedSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 11
      FieldName = 'SERIE'
      Size = 11
    end
    object cdsNFSpedMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 11
      FieldName = 'MODELO_NF'
      Size = 11
    end
    object cdsNFSpedCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Dest/Rem'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsNFSpedNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Dest/Rem'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsNFSpedCHAVE_NFE_REF: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHAVE_NFE_REF'
      Size = 44
    end
  end
  object qrC114: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C114')
    Left = 536
    Top = 72
  end
  object dspC114: TDataSetProvider
    DataSet = qrC114
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 536
    Top = 120
  end
  object cdsC114: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC114'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 536
    Top = 168
    object IntegerField1: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsC114ECF_FAB: TStringField
      DisplayLabel = 'Num Fab ECF'
      FieldName = 'ECF_FAB'
      Required = True
    end
    object cdsC114NUM_DOC: TIntegerField
      DisplayLabel = 'Numero Doc'
      FieldName = 'NUM_DOC'
      Required = True
    end
    object cdsC114DT_DOC: TDateTimeField
      DisplayLabel = 'Data Doc'
      FieldName = 'DT_DOC'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsC114ECF_CX: TIntegerField
      DisplayLabel = 'N'#250'mero do Caixa'
      FieldName = 'ECF_CX'
    end
    object cdsC114COD_MOD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'COD_MOD'
      FixedChar = True
      Size = 2
    end
  end
  object dsC114: TDataSource
    AutoEdit = False
    DataSet = cdsC114
    Left = 536
    Top = 216
  end
  object qrC120: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C120')
    Left = 704
    Top = 64
  end
  object dspC120: TDataSetProvider
    DataSet = qrC120
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 704
    Top = 113
  end
  object cdsC120: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC120'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 704
    Top = 160
    object cdsC120COD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsC120COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsC120NUM_DOC_IMP: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'NUM_DOC_IMP'
      Required = True
      Size = 10
    end
    object cdsC120NUM_ACDRAW: TStringField
      DisplayLabel = 'Num Draw'
      FieldName = 'NUM_ACDRAW'
    end
    object cdsC120COD_DOC_IMP: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'COD_DOC_IMP'
      FixedChar = True
      Size = 1
    end
    object cdsC120PIS_IMP: TFloatField
      DisplayLabel = 'PIS'
      FieldName = 'PIS_IMP'
    end
    object cdsC120COFINS_IMP: TFloatField
      DisplayLabel = 'COFINS'
      FieldName = 'COFINS_IMP'
    end
  end
  object dsC120: TDataSource
    AutoEdit = False
    DataSet = cdsC120
    Left = 704
    Top = 208
  end
  object qrC115: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    AfterCancel = cdsInfComplBeforeOpen
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C115')
    Left = 600
    Top = 72
  end
  object dspC115: TDataSetProvider
    DataSet = qrC115
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 600
    Top = 120
  end
  object cdsC115: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC115'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 600
    Top = 168
    object IntegerField4: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsC115NITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsC115IND_CARGA: TSmallintField
      DisplayLabel = 'Ind Tipo Transporte'
      FieldName = 'IND_CARGA'
    end
    object cdsC115CNPJ_COL: TStringField
      DisplayLabel = 'CNPJ Col'
      FieldName = 'CNPJ_COL'
      Size = 18
    end
    object cdsC115IE_COL: TStringField
      DisplayLabel = 'Insc Est Col'
      FieldName = 'IE_COL'
      Size = 18
    end
    object cdsC115CPF_COL: TStringField
      DisplayLabel = 'CPF Col'
      FieldName = 'CPF_COL'
      Size = 18
    end
    object cdsC115COD_MUN_COL: TIntegerField
      DisplayLabel = 'Cod Mun. Col'
      FieldName = 'COD_MUN_COL'
    end
    object cdsC115UF_COL: TStringField
      DisplayLabel = 'UF Col'
      FieldName = 'UF_COL'
      FixedChar = True
      Size = 2
    end
    object cdsC115NFE_XLGR_COL: TStringField
      DisplayLabel = 'Logradouro Col'
      FieldName = 'NFE_XLGR_COL'
      Size = 60
    end
    object cdsC115NFE_NRO_COL: TStringField
      DisplayLabel = 'Numero Col'
      FieldName = 'NFE_NRO_COL'
      Size = 60
    end
    object cdsC115NFE_XCPL_COL: TStringField
      DisplayLabel = 'Complemento Col'
      FieldName = 'NFE_XCPL_COL'
      Size = 60
    end
    object cdsC115NFE_XBAIRRO_COL: TStringField
      DisplayLabel = 'Bairro Col'
      FieldName = 'NFE_XBAIRRO_COL'
      Size = 60
    end
    object cdsC115NFE_XMUN_COL: TStringField
      DisplayLabel = 'Municipio Col'
      FieldName = 'NFE_XMUN_COL'
      Size = 60
    end
    object cdsC115CNPJ_ENTG: TStringField
      DisplayLabel = 'Cnpj Ent'
      FieldName = 'CNPJ_ENTG'
      Size = 18
    end
    object cdsC115IE_ENTG: TStringField
      DisplayLabel = 'Insc Est Ent'
      FieldName = 'IE_ENTG'
      Size = 18
    end
    object cdsC115CPF_ENTG: TStringField
      DisplayLabel = 'CPF Ent'
      FieldName = 'CPF_ENTG'
      Size = 18
    end
    object cdsC115COD_MUN_ENTG: TIntegerField
      DisplayLabel = 'Cod Mun. Ent'
      FieldName = 'COD_MUN_ENTG'
    end
    object cdsC115UF_ENTG: TStringField
      DisplayLabel = 'UF Ent'
      FieldName = 'UF_ENTG'
      FixedChar = True
      Size = 2
    end
    object cdsC115NFE_XLGR_ENTG: TStringField
      DisplayLabel = 'Logradouro Ent'
      FieldName = 'NFE_XLGR_ENTG'
      Size = 60
    end
    object cdsC115NFE_NRO_ENTG: TStringField
      DisplayLabel = 'Numero Ent'
      FieldName = 'NFE_NRO_ENTG'
      Size = 60
    end
    object cdsC115NFE_XCPL_ENTG: TStringField
      DisplayLabel = 'Complemento Ent'
      FieldName = 'NFE_XCPL_ENTG'
      Size = 60
    end
    object cdsC115NFE_XBAIRRO_ENTG: TStringField
      DisplayLabel = 'Bairro Ent'
      FieldName = 'NFE_XBAIRRO_ENTG'
      Size = 60
    end
    object cdsC115NFE_XMUN_ENTG: TStringField
      DisplayLabel = 'Municipio Ent'
      FieldName = 'NFE_XMUN_ENTG'
      Size = 60
    end
  end
  object dsC115: TDataSource
    AutoEdit = False
    DataSet = cdsC115
    Left = 600
    Top = 216
  end
  object qrCidCol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    AfterCancel = cdsInfComplBeforeOpen
    SQL.Strings = (
      'select * from cidades_ibge ci where ci.codigo_uf_ibge = 31'
      'order by ci.nome_municipio')
    Left = 288
    Top = 280
  end
  object dspCidCol: TDataSetProvider
    DataSet = qrCidCol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 288
    Top = 328
  end
  object cdsCidCol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidCol'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 288
    Top = 376
    object cdsCidColCODIGO_UF_IBGE: TIntegerField
      FieldName = 'CODIGO_UF_IBGE'
      Required = True
    end
    object cdsCidColNOME_UF: TStringField
      FieldName = 'NOME_UF'
      Size = 50
    end
    object cdsCidColCODIGO_MUN_IBGE: TIntegerField
      FieldName = 'CODIGO_MUN_IBGE'
      Required = True
    end
    object cdsCidColNOME_MUNICIPIO: TStringField
      FieldName = 'NOME_MUNICIPIO'
      Size = 50
    end
  end
  object dsCidCol: TDataSource
    AutoEdit = False
    DataSet = cdsCidCol
    Left = 288
    Top = 424
  end
  object qrCidEnt: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    AfterCancel = cdsInfComplBeforeOpen
    SQL.Strings = (
      'select * from cidades_ibge ci where ci.codigo_uf_ibge = 31'
      'order by ci.nome_municipio')
    Left = 392
    Top = 288
  end
  object dspCidEnt: TDataSetProvider
    DataSet = qrCidEnt
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 392
    Top = 336
  end
  object cdsCidEnt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidEnt'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 392
    Top = 384
  end
  object dsCidEnt: TDataSource
    AutoEdit = False
    DataSet = cdsCidEnt
    Left = 392
    Top = 432
  end
  object qrC197: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from NOTAFISCAL_SPED_C195_C197')
    Left = 856
    Top = 64
  end
  object dspC197: TDataSetProvider
    DataSet = qrC197
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 856
    Top = 113
  end
  object cdsC197: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspC197'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 856
    Top = 160
    object cdsC197COD_NF: TIntegerField
      DisplayLabel = 'Cod Nf'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsC197COD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsC197COD_OBS: TIntegerField
      DisplayLabel = 'Cod Obs'
      FieldName = 'COD_OBS'
      Required = True
    end
    object cdsC197NITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'NITEM'
    end
    object cdsC197COD_AJ: TStringField
      DisplayLabel = 'Ajuste'
      FieldName = 'COD_AJ'
      Required = True
      Size = 10
    end
    object cdsC197DESCR_COMPL_AJ: TStringField
      DisplayLabel = 'Descri'#231#227'o Complementar'
      FieldName = 'DESCR_COMPL_AJ'
      Size = 128
    end
    object cdsC197VL_BC_ICMS: TFloatField
      DisplayLabel = 'Base ICM ou ST'
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '##0.00'
    end
    object cdsC197ALIQ_ICMS: TFloatField
      DisplayLabel = 'Aliq ICM'
      FieldName = 'ALIQ_ICMS'
      DisplayFormat = '##0.00'
    end
    object cdsC197VL_ICMS: TFloatField
      DisplayLabel = 'Valor ICM ou ST'
      FieldName = 'VL_ICMS'
      DisplayFormat = '##0.00'
    end
    object cdsC197VL_OUTROS: TFloatField
      DisplayLabel = 'Valor Outros'
      FieldName = 'VL_OUTROS'
      DisplayFormat = '##0.00'
    end
    object cdsC197TXT_OBS: TStringField
      DisplayLabel = 'Txt'
      FieldKind = fkLookup
      FieldName = 'TXT_OBS'
      LookupDataSet = cdsLancF
      LookupKeyFields = 'COD_OBS'
      LookupResultField = 'TXT'
      KeyFields = 'COD_OBS'
      Size = 255
      Lookup = True
    end
  end
  object dsC197: TDataSource
    AutoEdit = False
    DataSet = cdsC197
    Left = 856
    Top = 208
  end
  object qrLancF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmNF.transacaoNF
    SQL.Strings = (
      'select * from SPED_LANCAMENTO_FISCAL')
    Left = 24
    Top = 272
  end
  object dspLancF: TDataSetProvider
    DataSet = qrLancF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 320
  end
  object cdsLancF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLancF'
    BeforeOpen = cdsInfComplBeforeOpen
    Left = 24
    Top = 368
    object cdsLancFCOD_OBS: TIntegerField
      DisplayLabel = 'Cod Obs'
      FieldName = 'COD_OBS'
      Required = True
    end
    object cdsLancFCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLancFTXT: TStringField
      DisplayLabel = 'Texto'
      FieldName = 'TXT'
      Size = 255
    end
    object cdsLancFCOD_PADRAO_AJUSTE: TStringField
      DisplayLabel = 'Codigo Padrao Ajustes'
      FieldName = 'COD_PADRAO_AJUSTE'
      Size = 10
    end
  end
  object dsLancF: TDataSource
    AutoEdit = False
    DataSet = cdsLancF
    Left = 24
    Top = 416
  end
  object dsNFC113View: TDataSource
    AutoEdit = False
    DataSet = cdsNFSped
    Left = 104
    Top = 216
  end
end
