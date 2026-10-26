object dtmMDFe: TdtmMDFe
  OldCreateOrder = False
  Height = 475
  Width = 712
  object qrMDFe: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from MDFE where COD_MDFE = 0 and COD_EMPRESA = 0')
    Left = 24
    Top = 72
  end
  object dspMDFe: TDataSetProvider
    DataSet = qrMDFe
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 120
  end
  object cdsMDFe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMDFe'
    BeforeOpen = cdsMDFeBeforeOpen
    Left = 24
    Top = 168
    object cdsMDFeSEL: TStringField
      Tag = 2
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsMDFeCOD_MDFE: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_MDFE'
      Required = True
    end
    object cdsMDFeNMDF: TIntegerField
      Tag = 2
      DisplayLabel = 'Num MDFe'
      FieldName = 'NMDF'
    end
    object cdsMDFeSERIE: TSmallintField
      Tag = 2
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
    end
    object cdsMDFeMODELO: TSmallintField
      Tag = 2
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
    end
    object cdsMDFeDHEMI: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Emissao'
      FieldName = 'DHEMI'
    end
    object cdsMDFeSITUACAO_MDFE: TStringField
      Tag = 2
      DisplayLabel = 'Situacao MDF-e'
      FieldName = 'SITUACAO_MDFE'
      Size = 40
    end
    object cdsMDFeSITUACAO_EVENTO: TStringField
      Tag = 2
      DisplayLabel = 'Situacao Evento MDF-e'
      FieldName = 'SITUACAO_EVENTO'
    end
    object cdsMDFeDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
    end
    object cdsMDFeUFINI: TStringField
      Tag = 2
      DisplayLabel = 'UF de Carregamento'
      FieldName = 'UFINI'
      FixedChar = True
      Size = 2
    end
    object cdsMDFeUFFIM: TStringField
      Tag = 2
      DisplayLabel = 'UF de Descarregamento'
      FieldName = 'UFFIM'
      FixedChar = True
      Size = 2
    end
    object cdsMDFeXNOME_CONDUTOR: TStringField
      DisplayLabel = 'Condutor'
      FieldName = 'XNOME_CONDUTOR'
      Size = 60
    end
    object cdsMDFeQNFE: TSmallintField
      DisplayLabel = 'Qtde NFe'
      FieldName = 'QNFE'
    end
    object cdsMDFeVCARGA: TFloatField
      DisplayLabel = 'Valor Total Carga'
      FieldName = 'VCARGA'
      DisplayFormat = '##0.00'
    end
    object cdsMDFeCUNID: TSmallintField
      DisplayLabel = 'Unidade'
      FieldName = 'CUNID'
    end
    object cdsMDFeQCARGA: TFloatField
      DisplayLabel = 'Peso Bruto Total'
      FieldName = 'QCARGA'
      DisplayFormat = '##0.00'
    end
    object cdsMDFeCOD_CARGA: TIntegerField
      DisplayLabel = 'Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsMDFeCPF_CONDUTOR: TStringField
      DisplayLabel = 'CPF Condutor'
      FieldName = 'CPF_CONDUTOR'
      Size = 11
    end
    object cdsMDFeCOD_VEIC: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Veiculo'
      FieldName = 'COD_VEIC'
    end
    object cdsMDFeCOD_VEIC_REBOQUE_1: TIntegerField
      DisplayLabel = 'Cod Reboque 1'
      FieldName = 'COD_VEIC_REBOQUE_1'
    end
    object cdsMDFeCOD_VEIC_REBOQUE_2: TIntegerField
      DisplayLabel = 'Cod Reboque 2'
      FieldName = 'COD_VEIC_REBOQUE_2'
    end
    object cdsMDFeCOD_VEIC_REBOQUE_3: TIntegerField
      DisplayLabel = 'Cod Reboque 3'
      FieldName = 'COD_VEIC_REBOQUE_3'
    end
    object cdsMDFeINFCPL: TMemoField
      DisplayLabel = 'Inf Complementar'
      FieldName = 'INFCPL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsMDFeINFADFISCO: TMemoField
      DisplayLabel = 'If Adicional Fisco'
      DisplayWidth = 10
      FieldName = 'INFADFISCO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsMDFeRNTRC: TIntegerField
      FieldName = 'RNTRC'
    end
    object cdsMDFeCIOT: TIntegerField
      FieldName = 'CIOT'
    end
    object cdsMDFeTERCEIRO_CONDUTOR: TStringField
      DisplayLabel = 'Condutor Terceiro?'
      FieldName = 'TERCEIRO_CONDUTOR'
      FixedChar = True
      Size = 1
    end
    object cdsMDFeTPAMB: TSmallintField
      DisplayLabel = 'Tipo Ambiente'
      FieldName = 'TPAMB'
    end
    object cdsMDFeTPEMIT: TSmallintField
      DisplayLabel = 'Tipo Emitente'
      FieldName = 'TPEMIT'
    end
    object cdsMDFeMODAL: TSmallintField
      DisplayLabel = 'Modal'
      FieldName = 'MODAL'
    end
    object cdsMDFeTPEMIS: TSmallintField
      DisplayLabel = 'Tipo Emissao'
      FieldName = 'TPEMIS'
    end
    object cdsMDFeDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autorizacao'
      FieldName = 'DATA_AUTORIZACAO'
    end
    object cdsMDFeDIGEST: TStringField
      DisplayLabel = 'Digest'
      FieldName = 'DIGEST'
      Size = 40
    end
    object cdsMDFePROTOCOLO: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      Size = 40
    end
    object cdsMDFeCODIGOERRO: TStringField
      DisplayLabel = 'Cod Retorno'
      FieldName = 'CODIGOERRO'
      Size = 10
    end
    object cdsMDFeDESCRICAOERRO: TStringField
      DisplayLabel = 'Descricao Retorno'
      FieldName = 'DESCRICAOERRO'
      Size = 50
    end
    object cdsMDFeTEMPORESPOSTA: TSmallintField
      DisplayLabel = 'Tempo Resposta'
      FieldName = 'TEMPORESPOSTA'
    end
    object cdsMDFeHORA_ENVIO: TStringField
      DisplayLabel = 'Hora Envio'
      FieldName = 'HORA_ENVIO'
      Size = 8
    end
    object cdsMDFeDATAHORA_ENVIO: TDateTimeField
      DisplayLabel = 'Data Hora Envio'
      FieldName = 'DATAHORA_ENVIO'
    end
    object cdsMDFeCHAVE_MDFE: TStringField
      DisplayLabel = 'Chave MDFe'
      FieldName = 'CHAVE_MDFE'
      Size = 60
    end
    object cdsMDFeNFE_DHCONT: TDateTimeField
      DisplayLabel = 'Data Hora Contingencia'
      FieldName = 'NFE_DHCONT'
    end
    object cdsMDFeNFE_RECIBO: TStringField
      DisplayLabel = 'Recibo'
      FieldName = 'NFE_RECIBO'
    end
    object cdsMDFeLOTE_MDFE: TIntegerField
      DisplayLabel = 'Lote Envio'
      FieldName = 'LOTE_MDFE'
    end
    object cdsMDFeTIPOMDFE: TStringField
      DisplayLabel = 'Tipo MDFe'
      FieldName = 'TIPOMDFE'
      Size = 40
    end
    object cdsMDFeLOTEMDFE_CONSULTA: TIntegerField
      DisplayLabel = 'Lote Consulta'
      FieldName = 'LOTEMDFE_CONSULTA'
    end
    object cdsMDFeCSTAT_EVENTO: TStringField
      DisplayLabel = 'Stat Evento'
      FieldName = 'CSTAT_EVENTO'
      Size = 4
    end
    object cdsMDFeXMOTIVO_EVENTO: TStringField
      DisplayLabel = 'Motivo Evento'
      FieldName = 'XMOTIVO_EVENTO'
      Size = 255
    end
    object cdsMDFeNPROT_EVENTO: TStringField
      DisplayLabel = 'Protocolo Evento'
      FieldName = 'NPROT_EVENTO'
      Size = 17
    end
    object cdsMDFeDH_EVENTO: TDateTimeField
      DisplayLabel = 'Data Hora Evento'
      FieldName = 'DH_EVENTO'
    end
    object cdsMDFeTIPO_EVENTO: TStringField
      DisplayLabel = 'Tipo Evento'
      FieldName = 'TIPO_EVENTO'
      FixedChar = True
      Size = 3
    end
    object cdsMDFeJUSTIFICATIVA: TStringField
      DisplayLabel = 'Justificativa Cancelamento'
      FieldName = 'JUSTIFICATIVA'
      Size = 1000
    end
    object cdsMDFeRESULTADO_ENVIO: TStringField
      DisplayLabel = 'Resultado Envio'
      FieldName = 'RESULTADO_ENVIO'
      Size = 30
    end
    object cdsMDFeMDFE_CMSG: TSmallintField
      Tag = 1
      DisplayLabel = 'CMSG'
      FieldName = 'MDFE_CMSG'
    end
    object cdsMDFeMDFE_XMSG: TStringField
      Tag = 1
      DisplayLabel = 'XMSG'
      FieldName = 'MDFE_XMSG'
      Size = 200
    end
    object cdsMDFeATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsMDFeCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMDFeUFPER: TStringField
      DisplayLabel = 'UF(s) Percurso'
      FieldName = 'UFPER'
      Size = 64
    end
    object cdsMDFeVERSAO: TSmallintField
      DisplayLabel = 'Ver'
      FieldName = 'VERSAO'
    end
  end
  object dsMDFe: TDataSource
    AutoEdit = False
    DataSet = cdsMDFe
    Left = 24
    Top = 216
  end
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
    Left = 115
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 198
    Top = 8
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 286
    Top = 8
  end
  object qrBuscas3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 382
    Top = 8
  end
  object qrMDFeDes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from MDFE_DESCARGA'
      'where COD_MDFE = 0 and COD_EMPRESA = 0 and CMUNDESCARGA = 0')
    Left = 288
    Top = 72
  end
  object dspMDFeDes: TDataSetProvider
    DataSet = qrMDFeDes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 288
    Top = 120
  end
  object cdsMDFeDes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMDFeDes'
    BeforeOpen = cdsMDFeBeforeOpen
    Left = 288
    Top = 168
    object cdsMDFeDesCOD_MDFE: TIntegerField
      DisplayLabel = 'Cod MDFe'
      FieldName = 'COD_MDFE'
      Required = True
    end
    object cdsMDFeDesCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMDFeDesCMUNDESCARGA: TIntegerField
      DisplayLabel = 'Cod IBGE'
      FieldName = 'CMUNDESCARGA'
      Required = True
    end
    object cdsMDFeDesXMUNDESCARGA: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'XMUNDESCARGA'
      Size = 64
    end
  end
  object dsMDFeDes: TDataSource
    AutoEdit = False
    DataSet = cdsMDFeDes
    Left = 288
    Top = 216
  end
  object dsMDFeDesNFe: TDataSource
    AutoEdit = False
    DataSet = cdsMDFeDesNFe
    Left = 392
    Top = 216
  end
  object qrMDFeCar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from MDFE_CARREGA where COD_MDFE = 0 and COD_EMPRESA = ' +
        '0')
    Left = 200
    Top = 72
  end
  object dspMDFeCar: TDataSetProvider
    DataSet = qrMDFeCar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 200
    Top = 120
  end
  object cdsMDFeCar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMDFeCar'
    BeforeOpen = cdsMDFeBeforeOpen
    Left = 200
    Top = 168
    object cdsMDFeCarCOD_MDFE: TIntegerField
      DisplayLabel = 'Cod MDFe'
      FieldName = 'COD_MDFE'
      Required = True
    end
    object cdsMDFeCarCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMDFeCarCMUNCARREGA: TIntegerField
      DisplayLabel = 'Cod IBGE'
      FieldName = 'CMUNCARREGA'
      Required = True
    end
    object cdsMDFeCarXMUNCARREGA: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'XMUNCARREGA'
      Size = 60
    end
  end
  object dsMDFeCar: TDataSource
    AutoEdit = False
    DataSet = cdsMDFeCar
    Left = 200
    Top = 216
  end
  object qrVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select vt.cod_veic, vt.cod_empresa, vt.placa, vt.modelo, vt.rebo' +
        'que from veiculos_transporte vt where vt.cod_empresa = 1')
    Left = 488
    Top = 72
  end
  object dspVeic: TDataSetProvider
    DataSet = qrVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 488
    Top = 120
  end
  object cdsVeic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVeic'
    BeforeOpen = cdsMDFeBeforeOpen
    Left = 488
    Top = 168
    object cdsVeicCOD_VEIC: TIntegerField
      FieldName = 'COD_VEIC'
      Required = True
    end
    object cdsVeicCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsVeicPLACA: TStringField
      FieldName = 'PLACA'
      Size = 7
    end
    object cdsVeicMODELO: TStringField
      FieldName = 'MODELO'
      Size = 64
    end
    object cdsVeicREBOQUE: TStringField
      FieldName = 'REBOQUE'
      FixedChar = True
      Size = 1
    end
  end
  object dsVeic: TDataSource
    AutoEdit = False
    DataSet = cdsVeic
    Left = 488
    Top = 216
  end
  object qrMDFeCond: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from MDFE_CONDUTOR where COD_MDFE = 0 and COD_EMPRESA =' +
        ' 0 and CPF = '#39#39)
    Left = 112
    Top = 72
  end
  object dspMDFeCond: TDataSetProvider
    DataSet = qrMDFeCond
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 112
    Top = 120
  end
  object cdsMDFeCond: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMDFeCond'
    BeforeOpen = cdsMDFeBeforeOpen
    Left = 112
    Top = 168
    object cdsMDFeCondCOD_MDFE: TIntegerField
      DisplayLabel = 'Cod MDFe'
      FieldName = 'COD_MDFE'
      Required = True
    end
    object cdsMDFeCondCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMDFeCondCPF: TStringField
      FieldName = 'CPF'
      Required = True
      FixedChar = True
      Size = 11
    end
    object cdsMDFeCondXNOME: TStringField
      DisplayLabel = 'Condutor'
      FieldName = 'XNOME'
      Size = 60
    end
    object cdsMDFeCondTERCEIRO: TStringField
      DisplayLabel = 'Terceiro'
      FieldName = 'TERCEIRO'
      FixedChar = True
      Size = 1
    end
  end
  object dsMDFeCond: TDataSource
    AutoEdit = False
    DataSet = cdsMDFeCond
    Left = 112
    Top = 216
  end
  object qrMDFeDesNFe: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select mn.*, nf.data_lanc, nf.num_nf, cl.cod_cliente, cl.razao, ' +
        'cl.cpfcgc, ci.nome_municipio from MDFE_DESCARGA_NFE mn'
      
        'left join notafiscal nf on nf.cod_nf = mn.cod_nf and nf.cod_empr' +
        'esa = mn.cod_empresa'
      
        'left join CLIENTES cl on cl.cod_cliente = nf.cod_cliente and cl.' +
        'cod_empresa = nf.cod_empresa'
      
        'left join CIDADES_IBGE ci on ci.codigo_mun_ibge = mn.cmundescarg' +
        'a'
      
        'where mn.COD_MDFE = 0 and mn.COD_EMPRESA = 0 and mn.CMUNDESCARGA' +
        ' = 0 and mn.COD_NF = 0')
    Left = 392
    Top = 72
    object qrMDFeDesNFeCOD_MDFE: TIntegerField
      FieldName = 'COD_MDFE'
      Origin = '"MDFE_DESCARGA_NFE"."COD_MDFE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMDFeDesNFeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"MDFE_DESCARGA_NFE"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMDFeDesNFeCMUNDESCARGA: TIntegerField
      FieldName = 'CMUNDESCARGA'
      Origin = '"MDFE_DESCARGA_NFE"."CMUNDESCARGA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMDFeDesNFeCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"MDFE_DESCARGA_NFE"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMDFeDesNFeCHNFE: TIBStringField
      FieldName = 'CHNFE'
      Origin = '"MDFE_DESCARGA_NFE"."CHNFE"'
      Required = True
      Size = 44
    end
    object qrMDFeDesNFeSEGCODBARRA: TIBStringField
      FieldName = 'SEGCODBARRA'
      Origin = '"MDFE_DESCARGA_NFE"."SEGCODBARRA"'
      Size = 128
    end
    object qrMDFeDesNFePESO_BRUTO_NF: TFloatField
      FieldName = 'PESO_BRUTO_NF'
      Origin = '"MDFE_DESCARGA_NFE"."PESO_BRUTO_NF"'
    end
    object qrMDFeDesNFeVALOR_TOTAL_NF: TFloatField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = '"MDFE_DESCARGA_NFE"."VALOR_TOTAL_NF"'
    end
    object qrMDFeDesNFeINDREENTREGA: TSmallintField
      FieldName = 'INDREENTREGA'
      Origin = '"MDFE_DESCARGA_NFE"."INDREENTREGA"'
    end
    object qrMDFeDesNFeDATA_LANC: TDateTimeField
      FieldName = 'DATA_LANC'
      Origin = '"NOTAFISCAL"."DATA_LANC"'
      ProviderFlags = []
    end
    object qrMDFeDesNFeNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
      Origin = '"NOTAFISCAL"."NUM_NF"'
      ProviderFlags = []
    end
    object qrMDFeDesNFeCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = []
    end
    object qrMDFeDesNFeRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      ProviderFlags = []
      Size = 60
    end
    object qrMDFeDesNFeCPFCGC: TIBStringField
      FieldName = 'CPFCGC'
      Origin = '"CLIENTES"."CPFCGC"'
      ProviderFlags = []
      Size = 18
    end
    object qrMDFeDesNFeNOME_MUNICIPIO: TIBStringField
      FieldName = 'NOME_MUNICIPIO'
      Origin = '"CIDADES_IBGE"."NOME_MUNICIPIO"'
      ProviderFlags = []
      Size = 50
    end
    object qrMDFeDesNFeID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dspMDFeDesNFe: TDataSetProvider
    DataSet = qrMDFeDesNFe
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 392
    Top = 120
  end
  object cdsMDFeDesNFe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMDFeDesNFe'
    BeforeOpen = cdsMDFeBeforeOpen
    Left = 392
    Top = 168
    object cdsMDFeDesNFeCOD_MDFE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_MDFE'
      Required = True
    end
    object cdsMDFeDesNFeCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMDFeDesNFeCMUNDESCARGA: TIntegerField
      DisplayLabel = 'Cod IBGE Cidade'
      FieldName = 'CMUNDESCARGA'
      Required = True
    end
    object cdsMDFeDesNFeCOD_NF: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsMDFeDesNFeCHNFE: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHNFE'
      Required = True
      Size = 44
    end
    object cdsMDFeDesNFeSEGCODBARRA: TStringField
      DisplayLabel = 'Seg Cod Barra'
      FieldName = 'SEGCODBARRA'
      Size = 128
    end
    object cdsMDFeDesNFePESO_BRUTO_NF: TFloatField
      DisplayLabel = 'Peso Bruto NF-e'
      FieldName = 'PESO_BRUTO_NF'
      DisplayFormat = '##0.00'
    end
    object cdsMDFeDesNFeVALOR_TOTAL_NF: TFloatField
      DisplayLabel = 'Valor Total NF-e'
      FieldName = 'VALOR_TOTAL_NF'
      DisplayFormat = '##0.00'
    end
    object cdsMDFeDesNFeINDREENTREGA: TSmallintField
      DisplayLabel = 'Indicador de Reentrega'
      FieldName = 'INDREENTREGA'
    end
    object cdsMDFeDesNFeDATA_LANC: TDateTimeField
      DisplayLabel = 'Data NF-e'
      FieldName = 'DATA_LANC'
      ProviderFlags = []
    end
    object cdsMDFeDesNFeNUM_NF: TIntegerField
      DisplayLabel = 'Num NF-e'
      FieldName = 'NUM_NF'
      ProviderFlags = []
    end
    object cdsMDFeDesNFeCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      ProviderFlags = []
    end
    object cdsMDFeDesNFeRAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      ProviderFlags = []
      Size = 60
    end
    object cdsMDFeDesNFeCPFCGC: TStringField
      DisplayLabel = 'CFP/CNPJ'
      FieldName = 'CPFCGC'
      ProviderFlags = []
      Size = 18
    end
    object cdsMDFeDesNFeNOME_MUNICIPIO: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_MUNICIPIO'
      ProviderFlags = []
      Size = 50
    end
    object cdsMDFeDesNFeID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
  end
end
