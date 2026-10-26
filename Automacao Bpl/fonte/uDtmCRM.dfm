object dtmCRM: TdtmCRM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 758
  Width = 927
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
  object qrAgenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select a.*, c.nome_cliente, c.razao, co.nome_vendedor, c.clqtdco' +
        'mpra, c.clsomacompra, c.clultimacompra, c.cllucrocliente, c.clat' +
        'rasocompra, c.clqtdveiculo,  c.clsomaveiculo,  c.clultimoveiculo' +
        ', c.cllucroveiculo from agendamento A'
      
        'left join clientes c on c.cod_cliente = a.cod_cliente and c.cod_' +
        'empresa = a.cod_empresa'
      
        'left join colaborador co on co.cod_vendedor = a.cod_vendedor and' +
        ' co.cod_empresa = a.cod_empresa'
      
        'left join tipo_agendamento tac on tac.cod_tipo_agendamento = a.c' +
        'od_contato and tac.cod_empresa = a.cod_empresa'
      
        'left join tipo_agendamento taf on taf.cod_tipo_agendamento = a.c' +
        'od_finalizacao and taf.cod_empresa = a.cod_empresa'
      'where a.cod_agendamento = 0 and a.cod_empresa = 0')
    Left = 33
    Top = 136
  end
  object dspAgenda: TDataSetProvider
    DataSet = qrAgenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 33
    Top = 184
  end
  object cdsAgenda: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgenda'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 33
    Top = 232
    object cdsAgendaCOD_AGENDA: TIntegerField
      FieldName = 'COD_AGENDAMENTO'
      Required = True
    end
    object cdsAgendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAgendaCOD_AGENDA_PROX: TIntegerField
      FieldName = 'COD_AGENDAMENTO_PROX'
    end
    object cdsAgendaCOD_AGENDA_ANT: TIntegerField
      FieldName = 'COD_AGENDAMENTO_ANT'
    end
    object cdsAgendaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsAgendaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsAgendaCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object cdsAgendaCOD_FINALIZACAO: TIntegerField
      FieldName = 'COD_FINALIZACAO'
    end
    object cdsAgendaDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAgendaNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsAgendaTIPO_PED: TStringField
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsAgendaDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgendaDATA_AGENDADA: TDateTimeField
      DisplayLabel = 'Data Agendada'
      FieldName = 'DATA_AGENDADA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgendaDATA_FINALIZACAO: TDateTimeField
      DisplayLabel = 'Data Finaliza'#231#227'o'
      FieldName = 'DATA_FINALIZACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgendaSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 32
    end
    object cdsAgendaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsAgendaNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsAgendaRAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsAgendaNOME_VENDEDOR: TStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsAgendaAUTOMATICO: TStringField
      DisplayLabel = 'Automatico'
      FieldName = 'AUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object cdsAgendaCOD_USUARIO: TIntegerField
      DisplayLabel = 'User Cadastro'
      FieldName = 'COD_USUARIO'
    end
    object cdsAgendaCLQTDCOMPRA: TStringField
      DisplayLabel = 'Classe Qtd Compra'
      FieldName = 'CLQTDCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLSOMACOMPRA: TStringField
      DisplayLabel = 'Classe Soma Compra'
      FieldName = 'CLSOMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLULTIMACOMPRA: TStringField
      DisplayLabel = 'Classe '#218'ltima Compra'
      FieldName = 'CLULTIMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLLUCROCLIENTE: TStringField
      DisplayLabel = 'Classe Lucro Cliente'
      FieldName = 'CLLUCROCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLATRASOCOMPRA: TStringField
      DisplayLabel = 'Classe Atraso Compra'
      FieldName = 'CLATRASOCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLQTDVEICULO: TStringField
      DisplayLabel = 'Classe Qtde Ve'#237'culo'
      FieldName = 'CLQTDVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLSOMAVEICULO: TStringField
      DisplayLabel = 'Classe Soma Ve'#237'culo'
      FieldName = 'CLSOMAVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLULTIMOVEICULO: TStringField
      DisplayLabel = 'Classe '#218'ltimo Ve'#237'culo'
      FieldName = 'CLULTIMOVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsAgendaCLLUCROVEICULO: TStringField
      DisplayLabel = 'Classe Lucro Ve'#237'culo'
      FieldName = 'CLLUCROVEICULO'
      FixedChar = True
      Size = 2
    end
  end
  object dsAgenda: TDataSource
    AutoEdit = False
    DataSet = cdsAgenda
    Left = 33
    Top = 280
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
  object qrClA: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'SELECT C.COD_CLIENTE, C.NOME_CLIENTE, C.RAZAO, C.CPFCGC, C.FONE_' +
        'CLIENTE, C.RAMAL,'
      'TC.DESCRICAO_TIPO, TF.DESC_FAT, TF.STATUS_F, C.ENDERECO||'
      
        'CASE WHEN COALESCE(RTRIM(C.NUM_END_CLIENTE),'#39#39') = '#39#39' THEN '#39#39' ELS' +
        'E '#39' ,'#39'||RTRIM(C.NUM_END_CLIENTE) END||'
      
        'CASE WHEN COALESCE(RTRIM(C.COMPLEMENTO),'#39#39') = '#39#39' THEN '#39#39' ELSE '#39' ' +
        ','#39'||RTRIM(C.COMPLEMENTO) END||'
      
        #39' - '#39'||RTRIM(C.BAIRRO)||'#39' ,'#39'||RTRIM(C.CIDADE)||'#39' - '#39'||RTRIM(E.SI' +
        'GLA_UF) ENDERECO,'
      
        'C.EMAIL, CP.DESC_COND_PAG, C.TIPVCLIENTE, C.CONTATO, C.TEL_RES_C' +
        'F, C.FAX, C.DIAS_ACOMP,'
      
        'C.CLQTDCOMPRA, C.CLSOMACOMPRA, C.CLULTIMACOMPRA, C.CLLUCROCLIENT' +
        'E, C.CLATRASOCOMPRA, '
      
        'C.CLQTDVEICULO, C.CLSOMAVEICULO, C.CLULTIMOVEICULO, C.CLLUCROVEI' +
        'CULO, C.DATA_ULTIMO_CONTATO,'
      
        'C.ACEITA_CONTATO_TLV, C.DIAS_CONTATO_TLV, C.MEDIAFREQUENCIA, C.C' +
        'OD_VENDEDOR'
      'FROM CLIENTES C'
      'LEFT JOIN TIPOS_CLIENTES TC ON TC.CODIGO_TIPO = C.CODIGO_TIPO'
      
        'LEFT JOIN TIPO_FATURAMENTO TF ON TF.CODIGO_FATURAMENTO = C.CODIG' +
        'O_FATURAMENTO'
      'LEFT JOIN ESTADOS E ON E.CODIGO_UF = C.CODIGO_UF'
      'LEFT JOIN COND_PAG CP ON CP.COD_COND_PAG = C.COD_COND_PAG'
      'WHERE C.COD_CLIENTE = 0 AND C.COD_EMPRESA = 0')
    Left = 113
    Top = 136
  end
  object dspCla: TDataSetProvider
    DataSet = qrClA
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 113
    Top = 184
  end
  object cdsClA: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCla'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 113
    Top = 232
    object cdsClACOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClANOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClARAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsClACPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClAFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsClARAMAL: TStringField
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 5
    end
    object cdsClADESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      FixedChar = True
      Size = 30
    end
    object cdsClAENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 462
    end
    object cdsClAEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsClADESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsClATIPVCLIENTE: TStringField
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsClACONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 10
    end
    object cdsClATEL_RES_CF: TStringField
      FieldName = 'TEL_RES_CF'
      FixedChar = True
      Size = 14
    end
    object cdsClAFAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object cdsClADIAS_ACOMP: TIntegerField
      FieldName = 'DIAS_ACOMP'
    end
    object cdsClADESC_FAT: TStringField
      FieldName = 'DESC_FAT'
      FixedChar = True
      Size = 30
    end
    object cdsClASTATUS_F: TStringField
      FieldName = 'STATUS_F'
      FixedChar = True
      Size = 10
    end
    object cdsClACLQTDCOMPRA: TStringField
      FieldName = 'CLQTDCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClACLSOMACOMPRA: TStringField
      FieldName = 'CLSOMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClACLULTIMACOMPRA: TStringField
      FieldName = 'CLULTIMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClACLLUCROCLIENTE: TStringField
      FieldName = 'CLLUCROCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsClACLATRASOCOMPRA: TStringField
      FieldName = 'CLATRASOCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClACLQTDVEICULO: TStringField
      FieldName = 'CLQTDVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClACLSOMAVEICULO: TStringField
      FieldName = 'CLSOMAVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClACLULTIMOVEICULO: TStringField
      FieldName = 'CLULTIMOVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClACLLUCROVEICULO: TStringField
      FieldName = 'CLLUCROVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClADATA_ULTIMO_CONTATO: TDateTimeField
      DisplayLabel = 'Data Ultimo Contato'
      FieldName = 'DATA_ULTIMO_CONTATO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClAACEITA_CONTATO_TLV: TStringField
      FieldName = 'ACEITA_CONTATO_TLV'
      Size = 1
    end
    object cdsClADIAS_CONTATO_TLV: TSmallintField
      FieldName = 'DIAS_CONTATO_TLV'
    end
    object cdsClAMEDIAFREQUENCIA: TFloatField
      DisplayLabel = 'Freq Compras (M'#233'dia)'
      FieldName = 'MEDIAFREQUENCIA'
    end
    object cdsClACOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
  end
  object dsClA: TDataSource
    AutoEdit = False
    DataSet = cdsClA
    Left = 113
    Top = 280
  end
  object qrTpA_C: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select ta.* from tipo_agendamento ta'
      'where ta.tipo = '#39'0'#39' and ta.cod_empresa = 0 and ativo = 1')
    Left = 193
    Top = 136
  end
  object dspTpA_C: TDataSetProvider
    DataSet = qrTpA_C
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 193
    Top = 184
  end
  object cdsTpA_C: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTpA_C'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 193
    Top = 232
    object cdsTpA_CCOD_TIPO_AGENDA: TIntegerField
      FieldName = 'COD_TIPO_AGENDAMENTO'
      Required = True
    end
    object cdsTpA_CTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTpA_CDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object dsTpA_C: TDataSource
    AutoEdit = False
    DataSet = cdsTpA_C
    Left = 193
    Top = 280
  end
  object qrTpA_F: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select ta.* from tipo_agendamento ta'
      'where ta.tipo = '#39'0'#39' and ta.cod_empresa = 0 and ativo = 1')
    Left = 281
    Top = 136
  end
  object dspTpA_F: TDataSetProvider
    DataSet = qrTpA_F
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 281
    Top = 184
  end
  object cdsTpA_F: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTpA_F'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 281
    Top = 232
    object cdsTpA_FCOD_TIPO_AGENDA: TIntegerField
      FieldName = 'COD_TIPO_AGENDAMENTO'
      Required = True
    end
    object cdsTpA_FTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTpA_FDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object dsTpA_F: TDataSource
    AutoEdit = False
    DataSet = cdsTpA_F
    Left = 281
    Top = 280
  end
  object qrCol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.cod_vendedor, c.nome_vendedor, c.VENDEDOR_TLV from cola' +
        'borador c'
      'where c.cod_vendedor = 0 and c.cod_empresa = 0')
    Left = 369
    Top = 136
  end
  object dspCol: TDataSetProvider
    DataSet = qrCol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 369
    Top = 184
  end
  object cdsCol: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCol'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 369
    Top = 232
    object cdsColCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColVENDEDOR_TLV: TStringField
      FieldName = 'VENDEDOR_TLV'
      Size = 1
    end
  end
  object dsCol: TDataSource
    AutoEdit = False
    DataSet = cdsCol
    Left = 369
    Top = 280
  end
  object spIncCodigoAux: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoAuxiliar
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 465
    Top = 17
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
  object transacaoAuxiliar: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 555
    Top = 16
  end
  object qrAux: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoAuxiliar
    Left = 632
    Top = 16
  end
  object qrTpA_CF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select ta.* from tipo_agendamento ta'
      'where ta.tipo = '#39'0'#39' and ta.cod_empresa = 0 and ativo = 1')
    Left = 457
    Top = 136
  end
  object dspTpA_CF: TDataSetProvider
    DataSet = qrTpA_CF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 457
    Top = 184
  end
  object cdsTpA_CF: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTpA_CF'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 457
    Top = 232
    object cdsTpA_CFCOD_TIPO_AGENDA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TIPO_AGENDAMENTO'
      Required = True
    end
    object cdsTpA_CFTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTpA_CFDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object dsTpA_CF: TDataSource
    AutoEdit = False
    DataSet = cdsTpA_CF
    Left = 457
    Top = 280
  end
  object qrDev: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from devolucao where'
      'cod_empresa = -1 and ativo = 1')
    Left = 33
    Top = 336
  end
  object dspDev: TDataSetProvider
    DataSet = qrDev
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 33
    Top = 384
  end
  object cdsDev: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDev'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 33
    Top = 432
    object cdsDevSEQUENCIA: TIntegerField
      DisplayLabel = 'Cod Devolu'#231#227'o'
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object cdsDevDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsDevGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsDevCOD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDevCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsDevNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsDevDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 75
    end
    object cdsDevVALOR: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsDevQUANT_C: TFloatField
      FieldName = 'QUANT_C'
      Visible = False
    end
    object cdsDevQUANT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT'
    end
    object cdsDevVALOR_TOT: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOT'
      currency = True
    end
    object cdsDevCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Visible = False
    end
    object cdsDevNUM_NOTA_NFE: TIntegerField
      FieldName = 'NUM_NOTA_NFE'
      Visible = False
    end
    object cdsDevCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Visible = False
    end
    object cdsDevCOD_VENDA: TIntegerField
      DisplayLabel = 'Venda'
      FieldName = 'COD_VENDA'
    end
    object cdsDevTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsDevATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsDevCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsDevPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
      Visible = False
    end
    object cdsDevNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsDevENDERECO: TStringField
      FieldName = 'ENDERECO'
      Visible = False
      Size = 50
    end
    object cdsDevTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Visible = False
      FixedChar = True
      Size = 14
    end
    object cdsDevCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsDevTIPO_VENDA: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_VENDA'
      Size = 3
    end
    object cdsDevSEQID: TIntegerField
      FieldName = 'SEQID'
      Required = True
      Visible = False
    end
    object cdsDevCOMISS_PROD: TFloatField
      FieldName = 'COMISS_PROD'
      Visible = False
    end
    object cdsDevCOMISS_PROD_GER: TFloatField
      FieldName = 'COMISS_PROD_GER'
      Visible = False
    end
    object cdsDevCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Visible = False
    end
    object cdsDevNITEM_NF: TIntegerField
      FieldName = 'NITEM_NF'
      Visible = False
    end
    object cdsDevNF_GEROU: TStringField
      FieldName = 'NF_GEROU'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsDevTIPV: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
  end
  object dsDev: TDataSource
    AutoEdit = False
    DataSet = cdsDev
    Left = 33
    Top = 480
  end
  object qrDevReq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select c.nome_cliente,v.data_fech, vp.* '
      'from clientes c inner join pedvenda v '
      
        '  on v.cod_cliente=c.cod_cliente and v.cod_empresa= c.cod_empres' +
        'a'
      '   inner join pedvenda_prod vp  on v.nped=vp.nped '
      '   and v.cod_empresa=vp.cod_empresa and v.tipo=vp.tipo'
      
        'where v.data_fech>=:dti and  v.data_fech<=:dtf and v.cod_empresa' +
        '=1'
      
        'and v.ativo=1 and ((v.tipo = '#39'OS'#39' and (select retorno from sp_re' +
        'torno_tipo_venda(v.tipo, v.tipo_os)) = '#39'S'#39') or'
      
        '(v.tipo = '#39'REQ'#39' and (select retorno from sp_retorno_tipo_venda(v' +
        '.tipo, v.tipv)) = '#39'S'#39'))'
      'and coalesce(vp.tipv,'#39#39')<>'#39#39)
    Left = 113
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dti'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtf'
        ParamType = ptUnknown
      end>
  end
  object dspDevReq: TDataSetProvider
    DataSet = qrDevReq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 113
    Top = 384
  end
  object cdsDevReq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDevReq'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 113
    Top = 432
    object cdsDevReqNPED: TIntegerField
      DisplayLabel = 'Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsDevReqTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsDevReqDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fech'
      FieldName = 'DATA_FECH'
    end
    object cdsDevReqGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsDevReqCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDevReqNITEM: TIntegerField
      DisplayLabel = 'NItem'
      FieldName = 'NITEM'
    end
    object cdsDevReqDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD_PED'
      Size = 60
    end
    object cdsDevReqQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsDevReqQUANT_ITEM_DEV: TFloatField
      DisplayLabel = 'Quant Devolvida'
      FieldName = 'QUANT_ITEM_DEV'
    end
    object cdsDevReqCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod. Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsDevReqCODIGO_NOP: TFloatField
      DisplayLabel = 'Cod. NOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsDevReqNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsDevReqVLUN_PED_ITEM: TFloatField
      DisplayLabel = 'VL Unit'#225'rio'
      FieldName = 'VLUN_PED_ITEM'
      currency = True
    end
    object cdsDevReqVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'VL Total'
      FieldName = 'VLTOT_PED_ITEM'
      currency = True
    end
    object cdsDevReqVLUN_ORIG: TFloatField
      DisplayLabel = 'VL UN Original'
      FieldName = 'VLUN_ORIG'
      currency = True
    end
    object cdsDevReqVLUN_PED_NF: TFloatField
      DisplayLabel = 'VL UN NF'
      FieldName = 'VLUN_PED_NF'
      currency = True
    end
    object cdsDevReqVLTOT_PED_NF: TFloatField
      DisplayLabel = 'VL Total NF'
      FieldName = 'VLTOT_PED_NF'
      currency = True
    end
    object cdsDevReqRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio Desc'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsDevReqRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio Acresc'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsDevReqN_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'N_NF'
    end
    object cdsDevReqALIQUOTA_CP: TStringField
      FieldName = 'ALIQUOTA_CP'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object cdsDevReqRATDSAS: TFloatField
      FieldName = 'RATDSAS'
      Visible = False
    end
    object cdsDevReqCOMISS_PROD: TFloatField
      FieldName = 'COMISS_PROD'
      Visible = False
    end
    object cdsDevReqCOMISS_PROD_GER: TFloatField
      FieldName = 'COMISS_PROD_GER'
      Visible = False
    end
    object cdsDevReqANO_FAB_PROD: TIntegerField
      FieldName = 'ANO_FAB_PROD'
      Visible = False
    end
    object cdsDevReqN_SERIE_PROD: TStringField
      FieldName = 'N_SERIE_PROD'
      Visible = False
      Size = 15
    end
    object cdsDevReqMODELO: TStringField
      FieldName = 'MODELO'
      Visible = False
      Size = 15
    end
    object cdsDevReqCOR: TStringField
      FieldName = 'COR'
      Visible = False
      Size = 10
    end
    object cdsDevReqPCUST_C: TFloatField
      FieldName = 'PCUST_C'
      Visible = False
      currency = True
    end
    object cdsDevReqPCUST_R: TFloatField
      FieldName = 'PCUST_R'
      Visible = False
      currency = True
    end
    object cdsDevReqPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
      Visible = False
      currency = True
    end
    object cdsDevReqPCUST_MR: TFloatField
      FieldName = 'PCUST_MR'
      Visible = False
      currency = True
    end
    object cdsDevReqTP_NF_PED: TStringField
      FieldName = 'TP_NF_PED'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsDevReqSIT_ATD: TStringField
      FieldName = 'SIT_ATD'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsDevReqSEL: TStringField
      FieldName = 'SEL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsDevReqDATA_ATD: TDateTimeField
      FieldName = 'DATA_ATD'
      Visible = False
    end
    object cdsDevReqHORA_ATD: TStringField
      FieldName = 'HORA_ATD'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsDevReqCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
      Visible = False
    end
    object cdsDevReqICMANT_SUB: TFloatField
      FieldName = 'ICMANT_SUB'
      Visible = False
    end
    object cdsDevReqCOD_SEG_SERV: TIntegerField
      FieldName = 'COD_SEG_SERV'
      Visible = False
    end
    object cdsDevReqATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsDevReqCOL_COD_VENDEDOR: TIntegerField
      FieldName = 'COL_COD_VENDEDOR'
      Visible = False
    end
    object cdsDevReqDESC_ITEM: TFloatField
      FieldName = 'DESC_ITEM'
      Visible = False
      currency = True
    end
    object cdsDevReqACRESC_ITEM: TFloatField
      FieldName = 'ACRESC_ITEM'
      Visible = False
      currency = True
    end
    object cdsDevReqCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Visible = False
    end
    object cdsDevReqDATA_TRANSF: TDateTimeField
      FieldName = 'DATA_TRANSF'
      Visible = False
    end
    object cdsDevReqDATA_DEV: TDateTimeField
      FieldName = 'DATA_DEV'
      Visible = False
    end
    object cdsDevReqNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Visible = False
      Size = 35
    end
    object cdsDevReqNOME_VEND1: TStringField
      FieldName = 'NOME_VEND1'
      Visible = False
      Size = 35
    end
    object cdsDevReqQT_DEV: TFloatField
      FieldName = 'QT_DEV'
      Visible = False
    end
    object cdsDevReqSERIE: TStringField
      FieldName = 'SERIE'
      Visible = False
      Size = 5
    end
    object cdsDevReqVLO_UNITARIO: TFloatField
      FieldName = 'VLO_UNITARIO'
      Visible = False
      currency = True
    end
    object cdsDevReqDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
      Visible = False
    end
    object cdsDevReqSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object cdsDevReqDAV_ORIGEM: TIntegerField
      FieldName = 'DAV_ORIGEM'
      Visible = False
    end
    object cdsDevReqTP_DESCACRES: TStringField
      FieldName = 'TP_DESCACRES'
      Visible = False
      Size = 10
    end
    object cdsDevReqNAT_DESCACRES: TStringField
      FieldName = 'NAT_DESCACRES'
      Visible = False
      Size = 10
    end
    object cdsDevReqVALOR_DESCACRES: TFloatField
      FieldName = 'VALOR_DESCACRES'
      Visible = False
      currency = True
    end
    object cdsDevReqCOD_NSERIE: TIntegerField
      FieldName = 'COD_NSERIE'
      Visible = False
    end
    object cdsDevReqCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Visible = False
    end
    object cdsDevReqNITEM_NF: TIntegerField
      FieldName = 'NITEM_NF'
      Visible = False
    end
    object cdsDevReqTABPRATICADA: TStringField
      FieldName = 'TABPRATICADA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsDevReqTIPV: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsDevReqNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsDevReqCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object dsDevReq: TDataSource
    AutoEdit = False
    DataSet = cdsDevReq
    Left = 113
    Top = 480
  end
  object qrColR: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.cod_vendedor, c.nome_vendedor, c.VENDEDOR_TLV from cola' +
        'borador c'
      'where c.cod_vendedor = 0 and c.cod_empresa = 0')
    Left = 545
    Top = 136
  end
  object dspColR: TDataSetProvider
    DataSet = qrColR
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 545
    Top = 184
  end
  object cdsColR: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCol'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 545
    Top = 232
    object cdsColRCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsColRNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColRVENDEDOR_TLV: TStringField
      FieldName = 'VENDEDOR_TLV'
      Size = 1
    end
  end
  object dsColdR: TDataSource
    AutoEdit = False
    DataSet = cdsColR
    Left = 545
    Top = 280
  end
  object cdsAgenda2: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgenda'
    Left = 705
    object cdsAgenda2COD_AGENDA: TIntegerField
      FieldName = 'COD_AGENDAMENTO'
      Required = True
    end
    object cdsAgenda2COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAgenda2COD_AGENDA_PROX: TIntegerField
      FieldName = 'COD_AGENDAMENTO_PROX'
    end
    object cdsAgenda2COD_AGENDA_ANT: TIntegerField
      FieldName = 'COD_AGENDAMENTO_ANT'
    end
    object cdsAgenda2COD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsAgenda2COD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsAgenda2COD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object cdsAgenda2COD_FINALIZACAO: TIntegerField
      FieldName = 'COD_FINALIZACAO'
    end
    object cdsAgenda2DESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAgenda2NPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsAgenda2TIPO_PED: TStringField
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsAgenda2DATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgenda2DATA_AGENDADA: TDateTimeField
      DisplayLabel = 'Data Agendada'
      FieldName = 'DATA_AGENDADA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgenda2DATA_FINALIZACAO: TDateTimeField
      DisplayLabel = 'Data Finaliza'#231#227'o'
      FieldName = 'DATA_FINALIZACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgenda2STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 32
    end
    object cdsAgenda2ATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsAgenda2NOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsAgenda2RAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsAgenda2NOME_VENDEDOR: TStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsAgenda2AUTOMATICO: TStringField
      DisplayLabel = 'Automatico'
      FieldName = 'AUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object cdsAgenda2COD_USUARIO: TIntegerField
      DisplayLabel = 'User Cadastro'
      FieldName = 'COD_USUARIO'
    end
    object cdsAgenda2CLQTDCOMPRA: TStringField
      DisplayLabel = 'Classe Qtd Compra'
      FieldName = 'CLQTDCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLSOMACOMPRA: TStringField
      DisplayLabel = 'Classe Soma Compra'
      FieldName = 'CLSOMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLULTIMACOMPRA: TStringField
      DisplayLabel = 'Classe '#218'ltima Compra'
      FieldName = 'CLULTIMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLLUCROCLIENTE: TStringField
      DisplayLabel = 'Classe Lucro Cliente'
      FieldName = 'CLLUCROCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLATRASOCOMPRA: TStringField
      DisplayLabel = 'Classe Atraso Compra'
      FieldName = 'CLATRASOCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLQTDVEICULO: TStringField
      DisplayLabel = 'Classe Qtde Ve'#237'culo'
      FieldName = 'CLQTDVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLSOMAVEICULO: TStringField
      DisplayLabel = 'Classe Soma Ve'#237'culo'
      FieldName = 'CLSOMAVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLULTIMOVEICULO: TStringField
      DisplayLabel = 'Classe '#218'ltimo Ve'#237'culo'
      FieldName = 'CLULTIMOVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsAgenda2CLLUCROVEICULO: TStringField
      DisplayLabel = 'Classe Lucro Ve'#237'culo'
      FieldName = 'CLLUCROVEICULO'
      FixedChar = True
      Size = 2
    end
  end
  object dsAgenda2: TDataSource
    AutoEdit = False
    DataSet = cdsAgenda2
    Left = 768
  end
  object qrProm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select  pr.grupo_prod, pr.cod_prod, pr.num_fab_prod, pr.descr_pr' +
        'od,'
      'case when tp.tipo = '#39'P'#39' then '#39'PROMOCAO '#39'||P.descr_promocao'
      '  else '#39'PRECO DIFERENCIADO PARA '#39'||tp.descr_tipo||'#39' '#39'||'
      '  case when coalesce(l.cod_localidade, 0) > 0 then l.localidade'
      '    when coalesce(st.cod_setor, 0) > 0 then st.setor'
      '    when coalesce(cd.cod_cidade, 0) > 0 then cd.nome_cidade'
      '    else p.descr_promocao'
      '  end'
      'end descricao,'
      'pr.prec_tab_prod,pr.prec_publico,'
      
        'case when pp.porcentagem > 0 then (pr.prec_tab_prod * ((100 - pp' +
        '.porcentagem) / 100)) else pp.valor_promocao end valor_promocao,' +
        ' pp.porcentagem,'
      
        'tp.tipo, p.ordem, count(c.cod_cliente) quantidade, sum(pvp.quant' +
        '_ped_item) soma'
      'from clientes c'
      
        'inner join pedvenda pv on pv.cod_cliente = c.cod_cliente and pv.' +
        'cod_empresa = c.cod_empresa'
      
        'inner join pedvenda_prod pvp on pvp.nped = pv.nped and pvp.tipo ' +
        '= pv.tipo and pvp.cod_empresa = pv.cod_empresa'
      
        'inner join produtos pr on pr.grupo_prod = pvp.grupo_prod and pr.' +
        'cod_prod = pvp.cod_prod and pr.cod_empresa = pvp.cod_empresa'
      
        'inner join promocao_produto pp on pr.grupo_prod = pp.grupo_prod ' +
        'and pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empres' +
        'a'
      
        'inner join tipo_preco tp on tp.cod_tppreco = pp.cod_tppreco and ' +
        'tp.cod_empresa = pp.cod_empresa'
      
        'left join localidade l on l.cod_localidade = pp.cod_localidade a' +
        'nd l.cod_empresa = pp.cod_empresa'
      
        'left join setor st on st.cod_setor = pp.cod_setor and st.cod_emp' +
        'resa = pp.cod_empresa '
      'left join cidades cd on cd.cod_cidade = pp.cod_cidade '
      
        'inner join promocao p on p.cod_promocao = pp.cod_promocao and p.' +
        'cod_tppreco = pp.cod_tppreco and p.cod_empresa = pp.cod_empresa '
      
        'where c.cod_cliente = 14 and c.cod_empresa = 1 and pv.status_ped' +
        ' = '#39'FECHADA'#39' and coalesce(pvp.status,'#39#39') <> '#39'CANCELADO'#39
      'and pr.ativo = 1 and'
      '( '
      '  (tp.tipo = '#39'T'#39' and'
      
        '    ((tp.descr_tipo = '#39'SETOR'#39' AND PP.cod_setor =  st.cod_setor )' +
        ' or'
      
        '      (TP.descr_tipo = '#39'LOCALIDADE'#39' AND PP.cod_localidade =  l.c' +
        'od_localidade ) or'
      
        '      (TP.descr_tipo = '#39'CIDADE'#39' AND PP.cod_cidade =  cd.cod_cida' +
        'de)'
      '    )'
      '  )'
      '  or'
      
        '  ((tp.tipo = '#39'P'#39') and (pp.data_ini <= current_timestamp and pp.' +
        'data_fim >= current_timestamp)'
      '  )'
      ') '
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      'order by 12 desc, tp.tipo, p.ordem')
    Left = 193
    Top = 336
  end
  object dspProm: TDataSetProvider
    DataSet = qrProm
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 193
    Top = 384
  end
  object cdsProm: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProm'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 193
    Top = 432
    object cdsPromGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsPromCOD_PROD: TStringField
      DisplayLabel = 'CodProd'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPromNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsPromDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsPromDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Pre'#231'o'
      FieldName = 'DESCRICAO'
      Size = 173
    end
    object cdsPromPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Varejo'
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '#0.00'
      currency = True
    end
    object cdsPromPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o Atacado'
      FieldName = 'PREC_PUBLICO'
      DisplayFormat = '#0.00'
      currency = True
    end
    object cdsPromVALOR_PROMOCAO: TFloatField
      DisplayLabel = 'Pre'#231'o Diferenciado'
      FieldName = 'VALOR_PROMOCAO'
      DisplayFormat = '#0.00'
      currency = True
    end
    object cdsPromPORCENTAGEM: TFloatField
      DisplayLabel = '% Promocional'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '#0.00'
    end
    object cdsPromTIPO: TStringField
      DisplayLabel = 'P/T'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPromORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
    end
    object cdsPromQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object cdsPromSOMA: TFloatField
      DisplayLabel = 'Soma'
      FieldName = 'SOMA'
      DisplayFormat = '#0.000'
    end
    object cdsPromVENDER: TFloatField
      DisplayLabel = 'Usar'
      FieldKind = fkInternalCalc
      FieldName = 'VENDER'
      DisplayFormat = '#0.000'
    end
  end
  object dsProm: TDataSource
    DataSet = cdsProm
    Left = 193
    Top = 480
  end
  object cdsPromTmp: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgenda'
    Left = 841
    object cdsPromTmpTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsPromTmpVENDER: TFloatField
      FieldName = 'VENDER'
    end
    object cdsPromTmpGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsPromTmpCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsPromTmpNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
    end
  end
  object qrBuscasEst: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 32
    Top = 56
  end
  object dsBuscasEst: TDataSource
    AutoEdit = False
    DataSet = qrBuscasEst
    Left = 112
    Top = 56
  end
  object qrFichaCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select fps.nome_emp,fps.tipo,fps.nped,pd.valor_total, fps.data_f' +
        'ech, fps.cpfcnpj,fps.nome_cliente,fps.cod_empresa,flwp.codpesqui' +
        'sa,flwp.status from fichavendaprod_serv fps'
      
        'left join pedvenda pd on pd.nped = fps.nped and pd.tipo = fps.ti' +
        'po and pd.cod_empresa = fps.cod_empresa'
      'left join flw_pesquisa flwp'
      
        'on fps.tipo= flwp.tipo_ped and fps.cod_empresa=flwp.cod_empresa ' +
        'and fps.nped=flwp.nped'
      'where fps.cod_empresa=-1')
    Left = 17
    Top = 544
  end
  object dspFichaCli: TDataSetProvider
    DataSet = qrFichaCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 17
    Top = 592
  end
  object cdsFichaCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFichaCli'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 17
    Top = 640
    object cdsFichaCliCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod.Empresa'
      FieldName = 'COD_EMPRESA'
      ReadOnly = True
    end
    object cdsFichaCliTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ReadOnly = True
      Size = 3
    end
    object cdsFichaCliNPED: TIntegerField
      DisplayLabel = 'Num.Pedido'
      FieldName = 'NPED'
      ReadOnly = True
    end
    object cdsFichaCliVALOR_TOTAL: TFloatField
      DisplayLabel = 'VL Total'
      FieldName = 'VALOR_TOTAL'
      currency = True
    end
    object cdsFichaCliDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
      ReadOnly = True
    end
    object cdsFichaCliCPFCNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCNPJ'
      ReadOnly = True
      Size = 18
    end
    object cdsFichaCliNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      ReadOnly = True
      FixedChar = True
      Size = 35
    end
    object cdsFichaCliCODPESQUISA: TIntegerField
      DisplayLabel = 'Cod. Pesquisa FollowUp'
      FieldName = 'CODPESQUISA'
    end
    object cdsFichaCliSTATUS: TStringField
      DisplayLabel = 'Status da Pesquisa'
      FieldName = 'STATUS'
    end
    object cdsFichaCliNOME_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NOME_EMP'
      ReadOnly = True
      Size = 50
    end
  end
  object dsFichaCli: TDataSource
    AutoEdit = False
    DataSet = cdsFichaCli
    Left = 17
    Top = 688
  end
  object qrItensFicha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from fichavendaprod_serv where tipo=:tipo and nped=:npe' +
        'd ')
    Left = 257
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end>
  end
  object dspItensFicha: TDataSetProvider
    DataSet = qrItensFicha
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 257
    Top = 384
  end
  object cdsItensFicha: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItensFicha'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 257
    Top = 432
    object cdsItensFichaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsItensFichaNPED: TIntegerField
      DisplayLabel = 'Num.Pedido'
      FieldName = 'NPED'
      ReadOnly = True
    end
    object cdsItensFichaNITEM: TIntegerField
      DisplayLabel = 'Num.Item'
      FieldName = 'NITEM'
      ReadOnly = True
    end
    object cdsItensFichaGRPROD_CODSERV: TIntegerField
      DisplayLabel = 'Grupo/Cod.Serv'
      FieldName = 'GRPROD_CODSERV'
      ReadOnly = True
    end
    object cdsItensFichaCOD_PROD: TStringField
      DisplayLabel = 'Cod.Produto'
      FieldName = 'COD_PROD'
      ReadOnly = True
      FixedChar = True
      Size = 17
    end
    object cdsItensFichaDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o Iem'
      DisplayWidth = 50
      FieldName = 'DESCR_PROD_PED'
      ReadOnly = True
      Size = 75
    end
    object cdsItensFichaNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num.Fabrica'#231#227'o Prod'
      FieldName = 'NUM_FAB_PROD'
      ReadOnly = True
      FixedChar = True
    end
    object cdsItensFichaCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod.Grade'
      FieldName = 'COD_GRADE'
      ReadOnly = True
    end
    object cdsItensFichaDESCRICAO_GRADE: TStringField
      DisplayLabel = 'Descri'#231#227'o Grade'
      FieldName = 'DESCRICAO_GRADE'
      ReadOnly = True
      FixedChar = True
      Size = 32
    end
    object cdsItensFichaQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_PED_ITEM'
      ReadOnly = True
    end
    object cdsItensFichaVLUN_PED_ITEM: TFloatField
      DisplayLabel = 'VL Unit'#225'rio'
      FieldName = 'VLUN_PED_ITEM'
      ReadOnly = True
      currency = True
    end
    object cdsItensFichaVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'VL Total'
      FieldName = 'VLTOT_PED_ITEM'
      ReadOnly = True
      currency = True
    end
    object cdsItensFichaN_NF: TLargeintField
      DisplayLabel = 'Num.NF'
      FieldName = 'N_NF'
      ReadOnly = True
    end
    object cdsItensFichaRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio Desconto'
      FieldName = 'RATEIO_DESC'
      ReadOnly = True
      currency = True
    end
    object cdsItensFichaRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
      ReadOnly = True
      currency = True
    end
    object cdsItensFichaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod.Cliente'
      FieldName = 'COD_CLIENTE'
      ReadOnly = True
    end
    object cdsItensFichaNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      ReadOnly = True
      FixedChar = True
      Size = 35
    end
    object cdsItensFichaCPFCNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCNPJ'
      ReadOnly = True
      Visible = False
      Size = 18
    end
    object cdsItensFichaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod.Empresa'
      FieldName = 'COD_EMPRESA'
      ReadOnly = True
      Visible = False
    end
    object cdsItensFichaNOME_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NOME_EMP'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object cdsItensFichaDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
      ReadOnly = True
    end
  end
  object dsItensFicha: TDataSource
    AutoEdit = False
    DataSet = cdsItensFicha
    Left = 257
    Top = 480
  end
  object qrCRM: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 198
    Top = 56
  end
  object qrVP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select vp.*,tvp.descricao_vp from VENDA_PERDIDA vp inner join ti' +
        'povp tvp '
      
        'on vp.codigo_vp = tvp.codigo_vp and vp.cod_empresa=tvp.cod_empre' +
        'sa  '
      'where vp.cod_empresa = -1 and vp.ativo = 1')
    Left = 337
    Top = 336
  end
  object dspVP: TDataSetProvider
    DataSet = qrVP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 337
    Top = 384
  end
  object cdsVP: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVP'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 337
    Top = 432
    object cdsVPSEQVP: TIntegerField
      DisplayLabel = 'Cod.Venda P.'
      FieldName = 'SEQVP'
      Required = True
    end
    object cdsVPDATA_VNP: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_VNP'
      Required = True
    end
    object cdsVPTIPOVP: TStringField
      DisplayLabel = 'Prod/Serv'
      FieldName = 'TIPOVP'
      FixedChar = True
      Size = 1
    end
    object cdsVPGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsVPCOD_PROD: TStringField
      DisplayLabel = 'Cod.Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsVPCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod.Servi'#231'o'
      FieldName = 'COD_SERVICO'
    end
    object cdsVPDESCRICAO_VP: TStringField
      DisplayLabel = 'Motivo de Perda da Venda'
      FieldName = 'DESCRICAO_VP'
      FixedChar = True
      Size = 25
    end
    object cdsVPCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod.Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsVPQUANT_PROD_VP: TFloatField
      DisplayLabel = 'Qtd. Prod. Venda P.'
      FieldName = 'QUANT_PROD_VP'
    end
    object cdsVPATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsVPCODIGO_VP: TIntegerField
      DisplayLabel = 'Cod.Tipo Venda P.'
      FieldName = 'CODIGO_VP'
      Required = True
    end
    object cdsVPCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod.Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsVPCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod.Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
  end
  object dsVP: TDataSource
    AutoEdit = False
    DataSet = cdsVP
    Left = 337
    Top = 480
  end
  object qrRankCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from clientes   '
      'where cod_empresa = -1 and ativo = 1')
    Left = 433
    Top = 336
  end
  object dspRankCli: TDataSetProvider
    DataSet = qrRankCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 433
    Top = 384
  end
  object dsRankCli: TDataSource
    AutoEdit = False
    DataSet = cdsRankCli
    Left = 433
    Top = 480
  end
  object cdsRankCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRankCli'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 432
    Top = 433
    object cdsRankCliCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRankCliNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object cdsRankCliCODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod. Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
      Origin = '"CLIENTES"."CODIGO_FATURAMENTO"'
    end
    object cdsRankCliTIPOCLIENTE: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'TIPOCLIENTE'
      Origin = '"CLIENTES"."TIPOCLIENTE"'
      FixedChar = True
      Size = 6
    end
    object cdsRankCliCLQTDCOMPRA: TStringField
      DisplayLabel = 'Classe Qtd Compra'
      FieldName = 'CLQTDCOMPRA'
      Origin = '"CLIENTES"."CLQTDCOMPRA"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliCLSOMACOMPRA: TStringField
      DisplayLabel = 'Classe Soma Compras'
      FieldName = 'CLSOMACOMPRA'
      Origin = '"CLIENTES"."CLSOMACOMPRA"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliCLULTIMACOMPRA: TStringField
      DisplayLabel = 'Classe '#218'ltima Compra'
      FieldName = 'CLULTIMACOMPRA'
      Origin = '"CLIENTES"."CLULTIMACOMPRA"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliCLATRASOCOMPRA: TStringField
      DisplayLabel = 'Classe Atraso Compra'
      FieldName = 'CLATRASOCOMPRA'
      Origin = '"CLIENTES"."CLATRASOCOMPRA"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliCLLUCROCLIENTE: TStringField
      DisplayLabel = 'Classe Lucro Cliente'
      FieldName = 'CLLUCROCLIENTE'
      Origin = '"CLIENTES"."CLLUCROCLIENTE"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliLUCROCLIENTE: TFloatField
      DisplayLabel = 'Lucro Cliente'
      FieldName = 'LUCROCLIENTE'
      Origin = '"CLIENTES"."LUCROCLIENTE"'
    end
    object cdsRankCliMEDIAFREQUENCIA: TFloatField
      DisplayLabel = 'Media Frequ'#234'ncia Compra'
      FieldName = 'MEDIAFREQUENCIA'
      Origin = '"CLIENTES"."MEDIAFREQUENCIA"'
    end
    object cdsRankCliV_Q_COMPRA: TFloatField
      DisplayLabel = 'Qtd Compras'
      FieldName = 'V_Q_COMPRA'
      Origin = '"CLIENTES"."V_Q_COMPRA"'
    end
    object cdsRankCliM_Q_COMPRA: TFloatField
      DisplayLabel = 'Media Qtd Compras'
      FieldName = 'M_Q_COMPRA'
      Origin = '"CLIENTES"."M_Q_COMPRA"'
    end
    object cdsRankCliV_T_COMPRA: TFloatField
      DisplayLabel = 'Valor Total Compras'
      FieldName = 'V_T_COMPRA'
      Origin = '"CLIENTES"."V_T_COMPRA"'
    end
    object cdsRankCliM_T_COMPRA: TFloatField
      DisplayLabel = 'Media Valor Compras'
      FieldName = 'M_T_COMPRA'
      Origin = '"CLIENTES"."M_T_COMPRA"'
    end
    object cdsRankCliV_L_COMPRA: TFloatField
      DisplayLabel = 'Lucro Compras'
      FieldName = 'V_L_COMPRA'
      Origin = '"CLIENTES"."V_L_COMPRA"'
    end
    object cdsRankCliM_L_COMPRA: TFloatField
      DisplayLabel = 'Media Lucro Compras'
      FieldName = 'M_L_COMPRA'
      Origin = '"CLIENTES"."M_L_COMPRA"'
    end
    object cdsRankCliV_A_COMPRA: TFloatField
      DisplayLabel = 'Qtd Dias Atraso'
      FieldName = 'V_A_COMPRA'
      Origin = '"CLIENTES"."V_A_COMPRA"'
    end
    object cdsRankCliM_A_COMPRA: TFloatField
      DisplayLabel = 'Media Dias Atraso'
      FieldName = 'M_A_COMPRA'
      Origin = '"CLIENTES"."M_A_COMPRA"'
    end
    object cdsRankCliDATA_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      Origin = '"CLIENTES"."DATA_ULT_COMPRA"'
    end
    object cdsRankCliCLQTDVEICULO: TStringField
      DisplayLabel = 'Classe Qtd Ve'#237'culo'
      FieldName = 'CLQTDVEICULO'
      Origin = '"CLIENTES"."CLQTDVEICULO"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliCLSOMAVEICULO: TStringField
      DisplayLabel = 'Classe Soma Ve'#237'culo'
      FieldName = 'CLSOMAVEICULO'
      Origin = '"CLIENTES"."CLSOMAVEICULO"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliCLULTIMOVEICULO: TStringField
      DisplayLabel = 'Classe '#218'ltimo Ve'#237'culo'
      FieldName = 'CLULTIMOVEICULO'
      Origin = '"CLIENTES"."CLULTIMOVEICULO"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliCLLUCROVEICULO: TStringField
      DisplayLabel = 'Classe Lucro Ve'#237'culo'
      FieldName = 'CLLUCROVEICULO'
      Origin = '"CLIENTES"."CLLUCROVEICULO"'
      FixedChar = True
      Size = 2
    end
    object cdsRankCliLUCROCLIENTE_V: TFloatField
      DisplayLabel = 'Lucro Cliente Ve'#237'culo'
      FieldName = 'LUCROCLIENTE_V'
      Origin = '"CLIENTES"."LUCROCLIENTE_V"'
    end
    object cdsRankCliV_Q_VEICULO: TFloatField
      DisplayLabel = 'Qtd Ve'#237'culos'
      FieldName = 'V_Q_VEICULO'
      Origin = '"CLIENTES"."V_Q_VEICULO"'
    end
    object cdsRankCliM_Q_VEICULO: TFloatField
      DisplayLabel = 'Media Qtd Ve'#237'culos'
      FieldName = 'M_Q_VEICULO'
      Origin = '"CLIENTES"."M_Q_VEICULO"'
    end
    object cdsRankCliV_T_VEICULO: TFloatField
      DisplayLabel = 'Valor total Ve'#237'culos'
      FieldName = 'V_T_VEICULO'
      Origin = '"CLIENTES"."V_T_VEICULO"'
    end
    object cdsRankCliM_T_VEICULO: TFloatField
      DisplayLabel = 'Media Valor Ve'#237'culos'
      FieldName = 'M_T_VEICULO'
      Origin = '"CLIENTES"."M_T_VEICULO"'
    end
    object cdsRankCliV_L_VEICULO: TFloatField
      DisplayLabel = 'Lucro Ve'#237'culos'
      FieldName = 'V_L_VEICULO'
      Origin = '"CLIENTES"."V_L_VEICULO"'
    end
    object cdsRankCliM_L_VEICULO: TFloatField
      DisplayLabel = 'Media Lucro Ve'#237'culos'
      FieldName = 'M_L_VEICULO'
      Origin = '"CLIENTES"."M_L_VEICULO"'
    end
    object cdsRankCliDATA_ULT_VENDA_V: TDateTimeField
      DisplayLabel = 'Dt. '#218'ltima Venda Ve'#237'culo'
      FieldName = 'DATA_ULT_VENDA_V'
      Origin = '"CLIENTES"."DATA_ULT_VENDA_V"'
    end
    object cdsRankCliMEDIA_FREQUENCIA_V: TFloatField
      DisplayLabel = 'Media Frequ'#234'ncia Compra V.'
      FieldName = 'MEDIA_FREQUENCIA_V'
      Origin = '"CLIENTES"."MEDIA_FREQUENCIA_V"'
    end
    object cdsRankCliRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      Required = True
      Size = 60
    end
    object cdsRankCliCPFCGC: TStringField
      Tag = 2
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Origin = '"CLIENTES"."CPFCGC"'
      Size = 18
    end
    object cdsRankCliINSC_EST: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSC_EST'
      Origin = '"CLIENTES"."INSC_EST"'
      Size = 18
    end
    object cdsRankCliRG: TStringField
      FieldName = 'RG'
      Origin = '"CLIENTES"."RG"'
      FixedChar = True
      Size = 10
    end
    object cdsRankCliCODIGO_TIPO: TIntegerField
      DisplayLabel = 'Cod. Tipo Cliente'
      FieldName = 'CODIGO_TIPO'
      Origin = '"CLIENTES"."CODIGO_TIPO"'
      Required = True
    end
    object cdsRankCliEST_CODIGO_UF: TIntegerField
      DisplayLabel = 'Cod. UF Cobran'#231'a '
      FieldName = 'EST_CODIGO_UF'
      Origin = '"CLIENTES"."EST_CODIGO_UF"'
      Required = True
    end
    object cdsRankCliCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = '"CLIENTES"."CIDADE"'
      Required = True
      Size = 30
    end
    object cdsRankCliBAIRRO: TStringField
      DisplayLabel = 'Bairro Cliente'
      FieldName = 'BAIRRO'
      Origin = '"CLIENTES"."BAIRRO"'
      Required = True
      Size = 35
    end
    object cdsRankCliCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod. UF'
      FieldName = 'CODIGO_UF'
      Origin = '"CLIENTES"."CODIGO_UF"'
      Required = True
    end
    object cdsRankCliENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o Cliente'
      FieldName = 'ENDERECO'
      Origin = '"CLIENTES"."ENDERECO"'
      Required = True
      Size = 50
    end
    object cdsRankCliNUM_END_CLIENTE: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsRankCliCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsRankCliCEP: TStringField
      FieldName = 'CEP'
      Origin = '"CLIENTES"."CEP"'
      Required = True
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object cdsRankCliFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      Origin = '"CLIENTES"."FONE_CLIENTE"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsRankCliFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = '"CLIENTES"."FAX"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsRankCliEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = '"CLIENTES"."EMAIL"'
      Size = 50
    end
    object cdsRankCliCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Origin = '"CLIENTES"."CONTATO"'
      Size = 10
    end
    object cdsRankCliLIMITE_CREDITO: TFloatField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'LIMITE_CREDITO'
      Origin = '"CLIENTES"."LIMITE_CREDITO"'
      currency = True
    end
    object cdsRankCliOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Origin = '"CLIENTES"."OBSERVACAO"'
      Size = 200
    end
    object cdsRankCliCIDA_COBRANCA: TStringField
      DisplayLabel = 'Cidade de Cobran'#231'a'
      FieldName = 'CIDA_COBRANCA'
      Origin = '"CLIENTES"."CIDA_COBRANCA"'
      Size = 30
    end
    object cdsRankCliCEP_COBRANCA: TStringField
      DisplayLabel = 'CEP de Cobran'#231'a'
      FieldName = 'CEP_COBRANCA'
      Origin = '"CLIENTES"."CEP_COBRANCA"'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object cdsRankCliDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = '"CLIENTES"."DATA_CADASTRO"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliDATA_MOD_CAD: TDateTimeField
      DisplayLabel = 'Altera'#231#227'o Cadastro'
      FieldName = 'DATA_MOD_CAD'
      Origin = '"CLIENTES"."DATA_MOD_CAD"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliDATA_NASC: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATA_NASC'
      Origin = '"CLIENTES"."DATA_NASC"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliNATURALID: TStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'NATURALID'
      Origin = '"CLIENTES"."NATURALID"'
    end
    object cdsRankCliCONJUGE: TStringField
      DisplayLabel = 'C'#244'njuge'
      FieldName = 'CONJUGE'
      Origin = '"CLIENTES"."CONJUGE"'
      Size = 35
    end
    object cdsRankCliLOC_TRAB: TStringField
      DisplayLabel = 'Local de Trabalho'
      FieldName = 'LOC_TRAB'
      Origin = '"CLIENTES"."LOC_TRAB"'
      Size = 30
    end
    object cdsRankCliEND_TRAB: TStringField
      DisplayLabel = 'Endere'#231'o de Trabalho'
      FieldName = 'END_TRAB'
      Origin = '"CLIENTES"."END_TRAB"'
      Size = 35
    end
    object cdsRankCliFONE_TRAB: TStringField
      DisplayLabel = 'Fone do Trabalho'
      FieldName = 'FONE_TRAB'
      Origin = '"CLIENTES"."FONE_TRAB"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsRankCliCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Origin = '"CLIENTES"."CARGO"'
      Size = 15
    end
    object cdsRankCliEXPEDIC: TDateTimeField
      DisplayLabel = 'Data Expedi'#231#227'o RG'
      FieldName = 'EXPEDIC'
      Origin = '"CLIENTES"."EXPEDIC"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliORG_EXPEDIC: TStringField
      DisplayLabel = #211'rg'#227'o Expedi'#231#227'o RG'
      FieldName = 'ORG_EXPEDIC'
      Origin = '"CLIENTES"."ORG_EXPEDIC"'
    end
    object cdsRankCliCTPS: TStringField
      DisplayLabel = 'Num. Cartareira Trabalho'
      FieldName = 'CTPS'
      Origin = '"CLIENTES"."CTPS"'
      FixedChar = True
      Size = 10
    end
    object cdsRankCliREF_BANC1: TStringField
      DisplayLabel = 'Refer'#234'ncia Banc'#225'ria 1'
      FieldName = 'REF_BANC1'
      Origin = '"CLIENTES"."REF_BANC1"'
      Size = 30
    end
    object cdsRankCliFONE_BANC1: TStringField
      DisplayLabel = 'Fone Ref. Banco 1'
      FieldName = 'FONE_BANC1'
      Origin = '"CLIENTES"."FONE_BANC1"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsRankCliCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"CLIENTES"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRankCliREF_BANC2: TStringField
      DisplayLabel = 'Refer'#234'ncia Banc'#225'ria 2'
      FieldName = 'REF_BANC2'
      Origin = '"CLIENTES"."REF_BANC2"'
      Size = 30
    end
    object cdsRankCliFONE_BANC2: TStringField
      DisplayLabel = 'Fone Ref. Banco 2'
      FieldName = 'FONE_BANC2'
      Origin = '"CLIENTES"."FONE_BANC2"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsRankCliREF_COM1: TStringField
      DisplayLabel = 'Refer'#234'ncia Comercial 1'
      FieldName = 'REF_COM1'
      Origin = '"CLIENTES"."REF_COM1"'
      Size = 30
    end
    object cdsRankCliEND_COM1: TStringField
      DisplayLabel = 'Endere'#231'o Ref. Comercial 1'
      FieldName = 'END_COM1'
      Origin = '"CLIENTES"."END_COM1"'
      Size = 30
    end
    object cdsRankCliFONE_COM1: TStringField
      DisplayLabel = 'Fone Ref. Comercial 1'
      FieldName = 'FONE_COM1'
      Origin = '"CLIENTES"."FONE_COM1"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsRankCliINFORM: TStringField
      DisplayLabel = 'Informa'#231#227'o Ref. Com. 1'
      FieldName = 'INFORM'
      Origin = '"CLIENTES"."INFORM"'
      Size = 30
    end
    object cdsRankCliPRI_COMPR: TDateTimeField
      DisplayLabel = 'Dt. 1'#170' Compra Ref. Com. 1'
      FieldName = 'PRI_COMPR'
      Origin = '"CLIENTES"."PRI_COMPR"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliULT_COMPR: TDateTimeField
      DisplayLabel = 'Dt. '#218'ltima Compra Ref. Com. 1'
      FieldName = 'ULT_COMPR'
      Origin = '"CLIENTES"."ULT_COMPR"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliCONCEITO: TStringField
      DisplayLabel = 'Conceito Cli. Ref. Com. 1'
      FieldName = 'CONCEITO'
      Origin = '"CLIENTES"."CONCEITO"'
      Size = 15
    end
    object cdsRankCliREF_COM2: TStringField
      DisplayLabel = 'Refer'#234'ncia Comercial 2'
      FieldName = 'REF_COM2'
      Origin = '"CLIENTES"."REF_COM2"'
      Size = 30
    end
    object cdsRankCliEND_COM2: TStringField
      DisplayLabel = 'Endere'#231'o Ref. Comercial 2'
      FieldName = 'END_COM2'
      Origin = '"CLIENTES"."END_COM2"'
      Size = 30
    end
    object cdsRankCliFONE_COM2: TStringField
      DisplayLabel = 'Fone Ref. Comercial 2'
      FieldName = 'FONE_COM2'
      Origin = '"CLIENTES"."FONE_COM2"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsRankCliINFORM2: TStringField
      DisplayLabel = 'Informa'#231#227'o Ref. Com. 2'
      FieldName = 'INFORM2'
      Origin = '"CLIENTES"."INFORM2"'
      Size = 30
    end
    object cdsRankCliPRI_COMPR2: TDateTimeField
      DisplayLabel = 'Dt. 1'#170' Compra Ref. Com. 2'
      FieldName = 'PRI_COMPR2'
      Origin = '"CLIENTES"."PRI_COMPR2"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliULT_COMPR2: TDateTimeField
      DisplayLabel = 'Dt. '#218'ltima Compra Ref. Com. 2'
      FieldName = 'ULT_COMPR2'
      Origin = '"CLIENTES"."ULT_COMPR2"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliCONCEITO2: TStringField
      DisplayLabel = 'Conceito Cli. Ref. Com. 2'
      FieldName = 'CONCEITO2'
      Origin = '"CLIENTES"."CONCEITO2"'
      Size = 15
    end
    object cdsRankCliSPCL: TDateTimeField
      DisplayLabel = 'Dt. nada consta SPC Local'
      FieldName = 'SPCL'
      Origin = '"CLIENTES"."SPCL"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliSPCEST: TDateTimeField
      DisplayLabel = 'Dt. nada consta SPC Estadual'
      FieldName = 'SPCEST'
      Origin = '"CLIENTES"."SPCEST"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliREGSPC: TDateTimeField
      DisplayLabel = 'Dt. Registro no SPC'
      FieldName = 'REGSPC'
      Origin = '"CLIENTES"."REGSPC"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliREGSPCCH: TDateTimeField
      DisplayLabel = 'Dt. Registro SPC Cheque'
      FieldName = 'REGSPCCH'
      Origin = '"CLIENTES"."REGSPCCH"'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsRankCliUS_CAD_CLI: TIntegerField
      DisplayLabel = 'Usu'#225'rio que cadastrou'
      FieldName = 'US_CAD_CLI'
      Origin = '"CLIENTES"."US_CAD_CLI"'
    end
    object cdsRankCliEND_COBRANCA: TStringField
      DisplayLabel = 'Endere'#231'o Cobran'#231'a'
      FieldName = 'END_COBRANCA'
      Origin = '"CLIENTES"."END_COBRANCA"'
      Size = 50
    end
    object cdsRankCliBAIRRO_COBRANCA: TStringField
      DisplayLabel = 'Bairro Cobran'#231'a'
      FieldName = 'BAIRRO_COBRANCA'
      Origin = '"CLIENTES"."BAIRRO_COBRANCA"'
      Size = 35
    end
    object cdsRankCliOBS_DIV: TMemoField
      DisplayLabel = 'Obs. Diversas'
      FieldName = 'OBS_DIV'
      Origin = '"CLIENTES"."OBS_DIV"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsRankCliPAI: TStringField
      DisplayLabel = 'Pai'
      FieldName = 'PAI'
      Origin = '"CLIENTES"."PAI"'
      Size = 35
    end
    object cdsRankCliMAE: TStringField
      DisplayLabel = 'M'#227'e'
      FieldName = 'MAE'
      Origin = '"CLIENTES"."MAE"'
      Size = 35
    end
    object cdsRankCliCOD_CONVENIO: TIntegerField
      DisplayLabel = 'Cod. Conv'#234'nio'
      FieldName = 'COD_CONVENIO'
      Origin = '"CLIENTES"."COD_CONVENIO"'
    end
    object cdsRankCliCONVENIADO: TStringField
      DisplayLabel = 'Conveniado'
      FieldName = 'CONVENIADO'
      Origin = '"CLIENTES"."CONVENIADO"'
      FixedChar = True
      Size = 1
    end
    object cdsRankCliDIA_VENC: TIntegerField
      DisplayLabel = 'Dia Vencimento'
      FieldName = 'DIA_VENC'
      Origin = '"CLIENTES"."DIA_VENC"'
    end
    object cdsRankCliCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Origin = '"CLIENTES"."CATEGORIA"'
      FixedChar = True
      Size = 8
    end
    object cdsRankCliNEC_ACOMP: TStringField
      DisplayLabel = 'Acompanhamento'
      FieldName = 'NEC_ACOMP'
      Origin = '"CLIENTES"."NEC_ACOMP"'
      FixedChar = True
      Size = 1
    end
    object cdsRankCliDIAS_ACOMP: TIntegerField
      DisplayLabel = 'Dias Acompanhamento'
      FieldName = 'DIAS_ACOMP'
      Origin = '"CLIENTES"."DIAS_ACOMP"'
    end
    object cdsRankCliSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      Origin = '"CLIENTES"."SEXO"'
      FixedChar = True
      Size = 1
    end
    object cdsRankCliRAMO_ATIVIDADE: TStringField
      DisplayLabel = 'Ramo de Atividade'
      FieldName = 'RAMO_ATIVIDADE'
      Origin = '"CLIENTES"."RAMO_ATIVIDADE"'
      Size = 60
    end
    object cdsRankCliCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod. Cidade'
      FieldName = 'COD_CIDADE'
      Origin = '"CLIENTES"."COD_CIDADE"'
    end
    object cdsRankCliCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod. Bairro'
      FieldName = 'COD_BAIRRO'
      Origin = '"CLIENTES"."COD_BAIRRO"'
    end
    object cdsRankCliCOD_CIDADE_COBRANCA: TSmallintField
      DisplayLabel = 'Cod. Cidade Cobran'#231'a'
      FieldName = 'COD_CIDADE_COBRANCA'
      Origin = '"CLIENTES"."COD_CIDADE_COBRANCA"'
    end
    object cdsRankCliCOD_BAIRRO_COBRANCA: TSmallintField
      DisplayLabel = 'Cod. Bairro Cobran'#231'a'
      FieldName = 'COD_BAIRRO_COBRANCA'
      Origin = '"CLIENTES"."COD_BAIRRO_COBRANCA"'
    end
    object cdsRankCliESTADO_CIVIL: TStringField
      DisplayLabel = 'Estado Civ'#237'l '
      FieldName = 'ESTADO_CIVIL'
      Origin = '"CLIENTES"."ESTADO_CIVIL"'
      Size = 32
    end
    object cdsRankCliTIPVCLIENTE: TStringField
      DisplayLabel = 'Tipo Venda ao Cliente'
      DisplayWidth = 1
      FieldName = 'TIPVCLIENTE'
      Origin = '"CLIENTES"."TIPVCLIENTE"'
      Size = 1
    end
    object cdsRankCliCAMP_PR_VENDA: TStringField
      DisplayLabel = 'Pre'#231'o Venda ao Cliente'
      FieldName = 'CAMP_PR_VENDA'
      Origin = '"CLIENTES"."CAMP_PR_VENDA"'
    end
    object cdsRankCliPERC_DESC: TFloatField
      DisplayLabel = 'Maximo Desconto (%)'
      FieldName = 'PERC_DESC'
      Origin = '"CLIENTES"."PERC_DESC"'
    end
    object cdsRankCliATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"CLIENTES"."ATIVO"'
    end
    object cdsRankCliCOD_CONTADOR: TIntegerField
      DisplayLabel = 'Cod. Contador'
      FieldName = 'COD_CONTADOR'
      Origin = '"CLIENTES"."COD_CONTADOR"'
    end
    object cdsRankCliTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"CLIENTES"."TIPO"'
      FixedChar = True
      Size = 1
    end
    object cdsRankCliINSC_SUB_F: TStringField
      DisplayLabel = 'Insc. Sub. Tribut'#225'rio'
      FieldName = 'INSC_SUB_F'
      Origin = '"CLIENTES"."INSC_SUB_F"'
      FixedChar = True
      Size = 18
    end
    object cdsRankCliCDMICROEPP: TStringField
      DisplayLabel = 'Situa'#231#227'o Fornec. junto '#224' AF '
      FieldName = 'CDMICROEPP'
      Origin = '"CLIENTES"."CDMICROEPP"'
      FixedChar = True
      Size = 1
    end
    object cdsRankCliTEL_RES_CF: TStringField
      DisplayLabel = 'Telefone residencial Fornec.'
      FieldName = 'TEL_RES_CF'
      Origin = '"CLIENTES"."TEL_RES_CF"'
      FixedChar = True
      Size = 14
    end
    object cdsRankCliRAMAL: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 5
    end
    object cdsRankCliCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Carteira'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsRankCliREGIME: TStringField
      DisplayLabel = 'Regime de Impostos Federais'
      FieldName = 'REGIME'
    end
    object cdsRankCliCOD_COND_PAG: TIntegerField
      DisplayLabel = 'C'#243'd Condi'#231#227'o Pagamento'
      FieldName = 'COD_COND_PAG'
    end
    object cdsRankCliINSC_MUNICIPAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'INSC_MUNICIPAL'
      Size = 15
    end
    object cdsRankCliCALCULAR_ST_NF_SAIDA: TStringField
      DisplayLabel = 'Calcular ST Nf Saida'
      FieldName = 'CALCULAR_ST_NF_SAIDA'
      FixedChar = True
      Size = 1
    end
    object cdsRankCliCODIGO_SWHW: TIntegerField
      FieldName = 'CODIGO_SWHW'
    end
    object cdsRankCliCOD_PAIS: TIntegerField
      DisplayLabel = 'Cod Pais'
      FieldName = 'COD_PAIS'
    end
    object cdsRankCliCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object cdsRankCliCOD_LOCALIDADE: TIntegerField
      DisplayLabel = 'Cod. Localidade'
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsRankCliDATA_AGENDADA: TDateTimeField
      DisplayLabel = 'Data Agendada (Televenda)'
      FieldName = 'DATA_AGENDADA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsRankCliACEITA_CONTATO_TLV: TStringField
      DisplayLabel = 'Televenda - Aceita contato'
      FieldName = 'ACEITA_CONTATO_TLV'
      Size = 1
    end
    object cdsRankCliDIAS_CONTATO_TLV: TSmallintField
      DisplayLabel = 'Televenda - Intervalo dias contato'
      FieldName = 'DIAS_CONTATO_TLV'
    end
    object cdsRankCliDIASPROTESTO: TSmallintField
      DisplayLabel = 'Dias Protesto'
      FieldName = 'DIASPROTESTO'
    end
    object cdsRankCliCONTROLES_FP: TStringField
      DisplayLabel = 'Controles Forma de Pagamento'
      FieldName = 'CONTROLES_FP'
      Size = 128
    end
  end
  object qrOrcCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from pedvenda   '
      'where cod_empresa = -1 and tipo = '#39'ORC'#39' and ativo = 1')
    Left = 513
    Top = 336
  end
  object dspOrcCli: TDataSetProvider
    DataSet = qrOrcCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 513
    Top = 384
  end
  object dsOrcCli: TDataSource
    AutoEdit = False
    DataSet = cdsOrcCli
    Left = 513
    Top = 480
  end
  object cdsOrcCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspOrcCli'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 504
    Top = 433
    object cdsOrcCliNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'Num do Pedido'
      FieldName = 'NPED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrcCliNPREVENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Num DAV'
      FieldName = 'NPREVENDA'
    end
    object cdsOrcCliTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsOrcCliDATA_PED: TDateTimeField
      DisplayLabel = 'Data pedido'
      FieldName = 'DATA_PED'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOrcCliDATA_FECH: TDateTimeField
      DisplayLabel = 'Data fechamento'
      FieldName = 'DATA_FECH'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOrcCliVALOR_TOTAL: TFloatField
      DisplayLabel = 'VL Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      currency = True
    end
    object cdsOrcCliSTATUS_PED: TStringField
      Tag = 2
      DisplayLabel = 'Status Pedido'
      FieldName = 'STATUS_PED'
      Origin = '"PEDVENDA"."STATUS_PED"'
      Size = 10
    end
    object cdsOrcCliDESC_P_PROD: TFloatField
      DisplayLabel = '% Desc. nos Produtos'
      FieldName = 'DESC_P_PROD'
      EditFormat = '0.00'
    end
    object cdsOrcCliDESC_P_SERV: TFloatField
      DisplayLabel = '% Desc. nos Servi'#231'os'
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object cdsOrcCliACRESC_P_PROD: TFloatField
      DisplayLabel = '% Acresc. nos Produtos'
      FieldName = 'ACRESC_P_PROD'
      Origin = '"PEDVENDA"."ACRESC_P_PROD"'
    end
    object cdsOrcCliACRESC_P_SERV: TFloatField
      DisplayLabel = '% Acresc. nos Servi'#231'os'
      FieldName = 'ACRESC_P_SERV'
    end
    object cdsOrcCliTOT_PROD: TFloatField
      DisplayLabel = 'Total Produtos OS'
      FieldName = 'TOT_PROD'
      Origin = '"PEDVENDA"."TOT_PROD"'
      currency = True
    end
    object cdsOrcCliTOT_SERV: TFloatField
      DisplayLabel = 'Total Servi'#231'os OS'
      FieldName = 'TOT_SERV'
      Origin = '"PEDVENDA"."TOT_SERV"'
      currency = True
    end
    object cdsOrcCliOPERADOR: TIntegerField
      DisplayLabel = 'PDV'
      FieldName = 'OPERADOR'
    end
    object cdsOrcCliDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO'
      currency = True
    end
    object cdsOrcCliPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsOrcCliCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Origin = '"PEDVENDA"."CHASSI"'
      Size = 17
    end
    object cdsOrcCliTIPV: TStringField
      DisplayLabel = 'Tipo de Venda'
      FieldName = 'TIPV'
      Origin = '"PEDVENDA"."TIPV"'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliTIPO_OS: TStringField
      DisplayLabel = 'Tipo da OS'
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object cdsOrcCliCOD_EQUIP: TIntegerField
      DisplayLabel = 'C'#243'digo do Equipamento'
      FieldName = 'COD_EQUIP'
    end
    object cdsOrcCliCOD_VEICULO: TIntegerField
      DisplayLabel = 'Cod Ve'#237'culo'
      FieldName = 'COD_VEICULO'
    end
    object cdsOrcCliAPARELHO_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o do Aparelho'
      FieldName = 'APARELHO_PED'
      Size = 128
    end
    object cdsOrcCliN_MOV_CXL: TIntegerField
      DisplayLabel = 'Num Movimento CXL'
      FieldName = 'N_MOV_CXL'
      Origin = '"PEDVENDA"."N_MOV_CXL"'
    end
    object cdsOrcCliDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Movimento CXL'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOrcCliDATVENC: TDateTimeField
      DisplayLabel = '1'#186' Vencimento da Venda'
      FieldName = 'DATVENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOrcCliOBS_PED: TStringField
      DisplayLabel = 'Obs. Pedido'
      FieldName = 'OBS_PED'
      Size = 50
    end
    object cdsOrcCliOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs. do Vendedor'
      FieldName = 'OBS_CXL_RQ'
      Size = 50
    end
    object cdsOrcCliSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Recebida pelo CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliVL_PAGO_CXL: TFloatField
      DisplayLabel = 'Valor Rec. no CXL'
      FieldName = 'VL_PAGO_CXL'
      currency = True
    end
    object cdsOrcCliSELEC: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELEC'
      Origin = '"PEDVENDA"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliTIPOR: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'TIPOR'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliHORAABERTURA: TIntegerField
      DisplayLabel = 'Hs Abertura Pedido'
      FieldName = 'HORAABERTURA'
    end
    object cdsOrcCliMINABERTURA: TIntegerField
      DisplayLabel = 'Min Abertura Pedido'
      FieldName = 'MINABERTURA'
    end
    object cdsOrcCliHORAFECHAMENTO: TIntegerField
      DisplayLabel = 'Hs Fechamento Pedido'
      FieldName = 'HORAFECHAMENTO'
    end
    object cdsOrcCliMINFECHAMENTO: TIntegerField
      DisplayLabel = 'Min Fechamento Pedido'
      FieldName = 'MINFECHAMENTO'
    end
    object cdsOrcCliHORASUBTOTAL: TIntegerField
      DisplayLabel = 'Hora Subtotal'
      FieldName = 'HORASUBTOTAL'
    end
    object cdsOrcCliMINSUBTOTAL: TIntegerField
      DisplayLabel = 'Min Subtotal'
      FieldName = 'MINSUBTOTAL'
    end
    object cdsOrcCliDA: TStringField
      FieldName = 'DA'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliNOME_RECEB: TStringField
      DisplayLabel = 'Recebedor'
      FieldName = 'NOME_RECEB'
      Size = 40
    end
    object cdsOrcCliEND_RECEB: TStringField
      DisplayLabel = 'End. Recebedor'
      FieldName = 'END_RECEB'
      Origin = '"PEDVENDA"."END_RECEB"'
      Size = 35
    end
    object cdsOrcCliBAIRRO_RECEB: TStringField
      DisplayLabel = 'Bairro Recebedor'
      FieldName = 'BAIRRO_RECEB'
    end
    object cdsOrcCliCIDA_RECEB: TStringField
      DisplayLabel = 'Cidade Recebedor'
      FieldName = 'CIDA_RECEB'
      Origin = '"PEDVENDA"."CIDA_RECEB"'
      Size = 15
    end
    object cdsOrcCliCEP_RECEB: TStringField
      DisplayLabel = 'CEP Recebedor'
      FieldName = 'CEP_RECEB'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 8
    end
    object cdsOrcCliFONE_RECEB: TStringField
      DisplayLabel = 'Fone Recebedor'
      FieldName = 'FONE_RECEB'
      EditMask = '(99) 9999-9999;0;_'
      Size = 14
    end
    object cdsOrcCliOBS_MINUTA: TMemoField
      DisplayLabel = 'Obs. Minuta'
      FieldName = 'OBS_MINUTA'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOrcCliGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo do Produto'
      FieldName = 'GRUPO_PROD'
    end
    object cdsOrcCliCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsOrcCliOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object cdsOrcCliCPFCGC: TStringField
      DisplayLabel = 'CPF ou CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsOrcCliCOD_CIDADE_RECEB: TSmallintField
      DisplayLabel = 'Cod. Cidade Recebedor'
      FieldName = 'COD_CIDADE_RECEB'
    end
    object cdsOrcCliCOD_BAIRRO_RECEB: TSmallintField
      DisplayLabel = 'Cod. Bairro Recebedor'
      FieldName = 'COD_BAIRRO_RECEB'
    end
    object cdsOrcCliVL_ENTRADA: TFloatField
      DisplayLabel = 'Valor da Entrada'
      FieldName = 'VL_ENTRADA'
      currency = True
    end
    object cdsOrcCliCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod. Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object cdsOrcCliSTAT_REQ: TStringField
      DisplayLabel = 'Status Almox '
      FieldName = 'STAT_REQ'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliACRESCIMO: TFloatField
      DisplayLabel = 'Valor do Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      currency = True
    end
    object cdsOrcCliKM_V: TIntegerField
      DisplayLabel = 'Quilometragem'
      FieldName = 'KM_V'
    end
    object cdsOrcCliORC_PROD: TIntegerField
      Tag = 1
      FieldName = 'ORC_PROD'
    end
    object cdsOrcCliDT_PROMETIDA: TDateTimeField
      DisplayLabel = 'Data Prometida'
      FieldName = 'DT_PROMETIDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOrcCliOBS_OS: TMemoField
      DisplayLabel = 'Obs. da OS'
      FieldName = 'OBS_OS'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOrcCliGUARDA_VOL: TStringField
      DisplayLabel = 'Guarda Volume'
      FieldName = 'GUARDA_VOL'
      Size = 10
    end
    object cdsOrcCliCOMBUST_VEIC: TStringField
      DisplayLabel = 'Qtd Combust'#237'vel'
      FieldName = 'COMBUST_VEIC'
      FixedChar = True
      Size = 3
    end
    object cdsOrcCliDEFEITO: TMemoField
      DisplayLabel = 'Defeito'
      FieldName = 'DEFEITO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOrcCliESTADO_VEIC: TMemoField
      DisplayLabel = 'Estado do Ve'#237'culo'
      FieldName = 'ESTADO_VEIC'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOrcCliACESSORIOS: TMemoField
      DisplayLabel = 'Acess'#243'rios'
      FieldName = 'ACESSORIOS'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOrcCliH_ENT: TDateTimeField
      DisplayLabel = 'Hs da Entrada'
      FieldName = 'H_ENT'
      EditMask = '!90:00;1;_'
    end
    object cdsOrcCliH_PROMETIDA: TDateTimeField
      DisplayLabel = 'Hs Prometida'
      FieldName = 'H_PROMETIDA'
      EditMask = '!90:00;1;_'
    end
    object cdsOrcCliDATA_NF: TDateTimeField
      DisplayLabel = 'Data da NF'
      FieldName = 'DATA_NF'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOrcCliDT_NFGARANTIA: TDateTimeField
      DisplayLabel = 'Fim da Garantia'
      FieldName = 'DT_NFGARANTIA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsOrcCliTP_ABORD: TStringField
      DisplayLabel = 'Abordagem ao Cliente'
      FieldName = 'TP_ABORD'
      FixedChar = True
      Size = 3
    end
    object cdsOrcCliFR_PAGBOSCH: TStringField
      DisplayLabel = 'Pag. Linha Bosch'
      FieldName = 'FR_PAGBOSCH'
      FixedChar = True
      Size = 3
    end
    object cdsOrcCliSEQ_FECH: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia de Fechamento'
      FieldName = 'SEQ_FECH'
    end
    object cdsOrcCliEM_NF: TStringField
      DisplayLabel = 'Marca OS Livro'
      FieldName = 'EM_NF'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliN_SERIE: TStringField
      DisplayLabel = 'Num. S'#233'rie'
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsOrcCliNUM_NF: TIntegerField
      DisplayLabel = 'N'#186' da NF para OS'
      FieldName = 'NUM_NF'
    end
    object cdsOrcCliOBS_LIVRO_REG: TStringField
      DisplayLabel = 'Obs. Livro de Registro'
      FieldName = 'OBS_LIVRO_REG'
      Size = 32
    end
    object cdsOrcCliVALOR_NF: TFloatField
      DisplayLabel = 'Valor da NF'
      FieldName = 'VALOR_NF'
      currency = True
    end
    object cdsOrcCliNF_PGARANTIA: TIntegerField
      DisplayLabel = 'NF Para Garantia'
      FieldName = 'NF_PGARANTIA'
    end
    object cdsOrcCliNOME_NF_GARANTIA: TStringField
      DisplayLabel = 'Nome do Cliente na NF'
      FieldName = 'NOME_NF_GARANTIA'
      Size = 60
    end
    object cdsOrcCliHORA_FECH: TStringField
      DisplayLabel = 'Hora Fechamento'
      FieldName = 'HORA_FECH'
      FixedChar = True
      Size = 8
    end
    object cdsOrcCliST_TERM_SERV: TStringField
      DisplayLabel = 'Status TMO'
      FieldName = 'ST_TERM_SERV'
      FixedChar = True
      Size = 10
    end
    object cdsOrcCliREGISTRO_DE_ENTREGA: TStringField
      DisplayLabel = 'Registro de Entrega'
      FieldName = 'REGISTRO_DE_ENTREGA'
      Size = 100
    end
    object cdsOrcCliTIPO_ORC: TStringField
      DisplayLabel = 'Tipo de Or'#231'amento'
      FieldName = 'TIPO_ORC'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliSTATUS_CUPOM: TStringField
      DisplayLabel = 'Status Cupom'
      FieldName = 'STATUS_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsOrcCliNOME_CLI_ORC: TStringField
      DisplayLabel = 'Cliente Or'#231'amento'
      FieldName = 'NOME_CLI_ORC'
      Size = 35
    end
    object cdsOrcCliCOD_ORCAMENTO: TIntegerField
      DisplayLabel = 'N'#186' Or'#231'amento Origem'
      FieldName = 'COD_ORCAMENTO'
    end
    object cdsOrcCliOBS_RED_OS: TStringField
      DisplayLabel = 'Obs Red OS'
      FieldName = 'OBS_RED_OS'
      Size = 50
    end
    object cdsOrcCliDAV_IMPRESSO: TStringField
      DisplayLabel = 'DAV j'#225' impresso'
      FieldName = 'DAV_IMPRESSO'
    end
    object cdsOrcCliCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cond. Pagamento'
      FieldName = 'COD_COND_PAG'
    end
    object cdsOrcCliCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsOrcCliCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsOrcCliCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrcCliCOD_CARGA: TIntegerField
      DisplayLabel = 'Cod Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsOrcCliAPROVADA_GERENTE: TStringField
      DisplayLabel = 'Gerente Aprovou?'
      FieldName = 'APROVADA_GERENTE'
      Size = 1
    end
    object cdsOrcCliDATA_LIBTRAVA: TDateTimeField
      DisplayLabel = 'Data Libera'#231#227'o Trava'
      FieldName = 'DATA_LIBTRAVA'
    end
    object cdsOrcCliNPEDMOB: TIntegerField
      DisplayLabel = 'N. Pedido Mobile'
      FieldName = 'NPEDMOB'
    end
    object cdsOrcCliIDMOBILE: TIntegerField
      DisplayLabel = 'Id. Mobile'
      FieldName = 'IDMOBILE'
    end
    object cdsOrcCliCOD_AGENDAMENTO: TIntegerField
      DisplayLabel = 'Agendamento'
      FieldName = 'COD_AGENDAMENTO'
    end
    object cdsOrcCliPAF_NUM_PREVENDA: TIntegerField
      DisplayLabel = 'Num Pre-Venda'
      FieldName = 'PAF_NUM_PREVENDA'
    end
    object cdsOrcCliPAF_STATUS_PREVENDA: TStringField
      DisplayLabel = 'Status Pre-Venda'
      FieldName = 'PAF_STATUS_PREVENDA'
      Size = 10
    end
    object cdsOrcCliCOD_AGENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Agenda'
      FieldName = 'COD_AGENDA'
    end
    object cdsOrcCliSTATUS_CONTA_CLIENTE: TStringField
      DisplayLabel = 'Status Conta Cliente'
      FieldName = 'STATUS_CONTA_CLIENTE'
      Size = 32
    end
    object cdsOrcCliCOO_CONTA_CLIENTE: TIntegerField
      DisplayLabel = 'COO Conta Cliente'
      FieldName = 'COO_CONTA_CLIENTE'
    end
    object cdsOrcCliCER_CONTA_CLIENTE: TIntegerField
      DisplayLabel = 'CER Conta Cliente'
      FieldName = 'CER_CONTA_CLIENTE'
    end
    object cdsOrcCliSTATUS_CONTRATO: TStringField
      DisplayLabel = 'Status Contrato'
      FieldName = 'STATUS_CONTRATO'
      FixedChar = True
      Size = 1
    end
  end
  object qrItOrcCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select mps.* from movimentosprodserv mps '
      'where mps.cod_empresa = -1 ')
    Left = 601
    Top = 336
  end
  object dspItOrcCli: TDataSetProvider
    DataSet = qrItOrcCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 601
    Top = 384
  end
  object dsItOrcCli: TDataSource
    AutoEdit = False
    DataSet = cdsItOrcCli
    Left = 601
    Top = 480
  end
  object cdsItOrcCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItOrcCli'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 600
    Top = 433
    object cdsItOrcCliTIPOPS: TStringField
      DisplayLabel = 'P/S'
      FieldName = 'TIPOPS'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsItOrcCliTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsItOrcCliNPED: TIntegerField
      DisplayLabel = 'Num.Pedido'
      FieldName = 'NPED'
      ReadOnly = True
    end
    object cdsItOrcCliNITEM: TIntegerField
      DisplayLabel = 'Num.Item'
      FieldName = 'NITEM'
    end
    object cdsItOrcCliGRUPOOUSEDRV: TIntegerField
      DisplayLabel = 'Grupo/Cod.Serv'
      FieldName = 'GRUPOOUSEDRV'
      ReadOnly = True
    end
    object cdsItOrcCliCOD_PROD: TStringField
      DisplayLabel = 'Cod.Produto'
      FieldName = 'COD_PROD'
      ReadOnly = True
      Size = 11
    end
    object cdsItOrcCliDESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o Iem'
      FieldName = 'DESCR'
      ReadOnly = True
      Size = 60
    end
    object cdsItOrcCliNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o Prod.'
      FieldName = 'NUM_FAB_PROD'
      ReadOnly = True
    end
    object cdsItOrcCliCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod.Grade'
      FieldName = 'COD_GRADE'
      ReadOnly = True
    end
    object cdsItOrcCliDESCRICAO_GRADE: TStringField
      DisplayLabel = 'Descri'#231#227'o Grade'
      FieldName = 'DESCRICAO_GRADE'
      ReadOnly = True
      FixedChar = True
      Size = 32
    end
    object cdsItOrcCliQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      ReadOnly = True
    end
    object cdsItOrcCliVL_UNIT: TFloatField
      DisplayLabel = 'VL Unit'#225'rio'
      FieldName = 'VL_UNIT'
      ReadOnly = True
      currency = True
    end
    object cdsItOrcCliVL_TOT: TFloatField
      DisplayLabel = 'VL Total'
      FieldName = 'VL_TOT'
      ReadOnly = True
      currency = True
    end
    object cdsItOrcCliVALOR_TOTAL: TFloatField
      DisplayLabel = 'VL Total'
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      Visible = False
      currency = True
    end
    object cdsItOrcCliSTATUS_ITEM: TStringField
      DisplayLabel = 'Status Item'
      FieldName = 'STATUS_ITEM'
      ReadOnly = True
      Size = 10
    end
    object cdsItOrcCliCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod.Cliente'
      FieldName = 'COD_CLIENTE'
      ReadOnly = True
    end
    object cdsItOrcCliSTATUS_PED: TStringField
      DisplayLabel = 'Status Pedido'
      FieldName = 'STATUS_PED'
      ReadOnly = True
      Size = 10
    end
    object cdsItOrcCliNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      ReadOnly = True
      FixedChar = True
      Size = 35
    end
    object cdsItOrcCliCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ReadOnly = True
      Visible = False
    end
    object cdsItOrcCliDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto no Item'
      FieldName = 'DESC_ITEM'
      ReadOnly = True
      currency = True
    end
    object cdsItOrcCliRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio Desconto'
      FieldName = 'RATEIO_DESC'
      ReadOnly = True
      currency = True
    end
    object cdsItOrcCliACRESC_ITEM: TFloatField
      DisplayLabel = 'Acr'#233'scimo no Item'
      FieldName = 'ACRESC_ITEM'
      ReadOnly = True
      currency = True
    end
    object cdsItOrcCliRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
      ReadOnly = True
      currency = True
    end
    object cdsItOrcCliDAV_ORIGEM: TIntegerField
      DisplayLabel = 'DAV Origem'
      FieldName = 'DAV_ORIGEM'
      ReadOnly = True
    end
    object cdsItOrcCliNPED_ORIGEM: TIntegerField
      DisplayLabel = 'Num. Pedido Origem'
      FieldName = 'NPED_ORIGEM'
      ReadOnly = True
    end
    object cdsItOrcCliTIPO_ORIGEM: TStringField
      DisplayLabel = 'Tipo Pedido Origem'
      FieldName = 'TIPO_ORIGEM'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsItOrcCliDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
      ReadOnly = True
    end
    object cdsItOrcCliDATA_PED: TDateTimeField
      DisplayLabel = 'Data Pedidp'
      FieldName = 'DATA_PED'
      ReadOnly = True
    end
  end
  object qrSugServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        ' select c.cod_cliente,c.DIAS_ACOMP,c.nome_cliente,c.fone_cliente' +
        ',c.email,c.CLQTDCOMPRA, c.clsomacompra,c.clultimacompra, c.clatr' +
        'asocompra,c.cllucrocliente,c.lucrocliente,c.v_q_compra, c.m_q_co' +
        'mpra,c.v_t_compra,c.m_t_compra,c.v_l_compra,c.m_l_compra,c.m_a_c' +
        'ompra,c.endereco,  c.bairro,c.cidade,c.cep,c.codigo_uf, c.cod_em' +
        'presa, (select max(data) from valorcmpclientes4'
      
        '     v where v.cliente = c.cod_cliente and v.cod_empresa = c.cod' +
        '_empresa) as ult_vnd_data'
      
        '  from clientes c where c.cod_empresa=-1 and c.ativo = 1 and c.c' +
        'od_cliente=-1')
    Left = 681
    Top = 336
  end
  object dspSugServ: TDataSetProvider
    DataSet = qrSugServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 681
    Top = 384
  end
  object dsSugServ: TDataSource
    AutoEdit = False
    DataSet = cdsSugServ
    Left = 681
    Top = 480
  end
  object cdsSugServ: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSugServ'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 680
    Top = 433
    object cdsSugServCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsSugServDIAS_ACOMP: TIntegerField
      FieldName = 'DIAS_ACOMP'
    end
    object cdsSugServNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsSugServFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsSugServEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsSugServCLQTDCOMPRA: TStringField
      FieldName = 'CLQTDCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsSugServCLSOMACOMPRA: TStringField
      FieldName = 'CLSOMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsSugServCLULTIMACOMPRA: TStringField
      FieldName = 'CLULTIMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsSugServCLATRASOCOMPRA: TStringField
      FieldName = 'CLATRASOCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsSugServCLLUCROCLIENTE: TStringField
      FieldName = 'CLLUCROCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsSugServLUCROCLIENTE: TFloatField
      FieldName = 'LUCROCLIENTE'
    end
    object cdsSugServV_Q_COMPRA: TFloatField
      FieldName = 'V_Q_COMPRA'
    end
    object cdsSugServM_Q_COMPRA: TFloatField
      FieldName = 'M_Q_COMPRA'
    end
    object cdsSugServV_T_COMPRA: TFloatField
      FieldName = 'V_T_COMPRA'
    end
    object cdsSugServM_T_COMPRA: TFloatField
      FieldName = 'M_T_COMPRA'
    end
    object cdsSugServV_L_COMPRA: TFloatField
      FieldName = 'V_L_COMPRA'
    end
    object cdsSugServM_L_COMPRA: TFloatField
      FieldName = 'M_L_COMPRA'
    end
    object cdsSugServM_A_COMPRA: TFloatField
      FieldName = 'M_A_COMPRA'
    end
    object cdsSugServENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsSugServBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
    end
    object cdsSugServCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsSugServCEP: TStringField
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsSugServCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsSugServCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSugServULT_VND_DATA: TDateTimeField
      FieldName = 'ULT_VND_DATA'
    end
  end
  object qrFichaCred: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select ctrl.nome_ctrl,c.N_DOC_C,c.DATA_REC_C,'
      
        'c.DATA_VENC_C,c.VALOR_C,c.DATQ_C,c.DATA_BAIXA,c.TIP_BAIXA,c.CODI' +
        'GO_EMP,c.HISTORICO_C,c.COD_CRED,case when coalesce(c.data_baixa,' +
        'current_timestamp)-c.data_venc_c > 0 then coalesce(c.data_baixa,' +
        'current_timestamp)-c.data_venc_c else 0 end  as dias_atraso, c.N' +
        '_DOC_V as NPED  from controle_creditos c inner join controles ct' +
        'rl  on c.codigo_ctrl = ctrl.codigo_ctrl and c.codigo_emp = ctrl.' +
        'codigo_emp where c.cod_cliente=-1')
    Left = 80
    Top = 544
  end
  object dspFichaCred: TDataSetProvider
    DataSet = qrFichaCred
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 80
    Top = 592
  end
  object cdsFichaCred: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFichaCred'
    ReadOnly = True
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 80
    Top = 640
    object cdsFichaCredNOME_CTRL: TStringField
      DisplayLabel = 'Nome Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsFichaCredN_DOC_C: TStringField
      DisplayLabel = 'Num. Documento Cr'#233'dito'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsFichaCredDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object cdsFichaCredDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data de Venc'
      FieldName = 'DATA_VENC_C'
    end
    object cdsFichaCredVALOR_C: TFloatField
      DisplayLabel = 'Valor do Cr'#233'dito'
      FieldName = 'VALOR_C'
      currency = True
    end
    object cdsFichaCredDATQ_C: TDateTimeField
      DisplayLabel = 'Data de quita'#231#227'o'
      FieldName = 'DATQ_C'
    end
    object cdsFichaCredDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data real da baixa'
      FieldName = 'DATA_BAIXA'
    end
    object cdsFichaCredTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsFichaCredCODIGO_EMP: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsFichaCredHISTORICO_C: TStringField
      DisplayLabel = 'Hist'#243'rico do Cr'#233'dito'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsFichaCredCOD_CRED: TIntegerField
      DisplayLabel = 'Cod. Cr'#233'dito'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsFichaCredDIAS_ATRASO: TFMTBCDField
      DisplayLabel = 'Dias Atraso'
      FieldName = 'DIAS_ATRASO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 9
    end
    object cdsFichaCredNPED: TIntegerField
      DisplayLabel = 'Num.Pedido'
      FieldName = 'NPED'
    end
  end
  object dsFichaCred: TDataSource
    AutoEdit = False
    DataSet = cdsFichaCred
    Left = 80
    Top = 688
  end
  object qrFichaCh: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'Select ctrl.nome_ctrl,ch.N_CH,ch.DATA_REC,ch.DATA_VENC,ch.VALOR_' +
        'CH,ch.DATQ_CH,'
      
        'ch.TIP_BAIXA,ch.CODIGO_EMP,case when coalesce(ch.datq_ch,current' +
        '_timestamp)-ch.data_venc > 0 then '
      
        '   coalesce(ch.datq_ch,current_timestamp)-ch.data_venc else 0 en' +
        'd as dias_atraso from '
      
        '   controle_cheque ch inner join controles ctrl on ch.codigo_ctr' +
        'l = ctrl.codigo_ctrl '
      '   and ch.codigo_emp = ctrl.codigo_emp'
      '   where ch.cod_cliente in (-1)')
    Left = 145
    Top = 545
  end
  object dspFichaCh: TDataSetProvider
    DataSet = qrFichaCh
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 145
    Top = 593
  end
  object cdsFichaCh: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFichaCh'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 145
    Top = 641
    object cdsFichaChNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsFichaChN_CH: TStringField
      DisplayLabel = 'Num.Cheque'
      FieldName = 'N_CH'
      FixedChar = True
    end
    object cdsFichaChDATA_REC: TDateTimeField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_REC'
    end
    object cdsFichaChDATA_VENC: TDateTimeField
      DisplayLabel = 'Data de Venc'
      FieldName = 'DATA_VENC'
    end
    object cdsFichaChVALOR_CH: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_CH'
      currency = True
    end
    object cdsFichaChDATQ_CH: TDateTimeField
      DisplayLabel = 'Data quita'#231#227'o'
      FieldName = 'DATQ_CH'
    end
    object cdsFichaChTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo de Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsFichaChCODIGO_EMP: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsFichaChDIAS_ATRASO: TFMTBCDField
      DisplayLabel = 'Dias Atraso'
      FieldName = 'DIAS_ATRASO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 9
    end
  end
  object dsFichaCh: TDataSource
    AutoEdit = False
    DataSet = cdsFichaCh
    Left = 145
    Top = 689
  end
  object qrFichaRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'Select * from recibos where cod_benef in (-1)  and RECANT = '#39'S'#39)
    Left = 207
    Top = 545
  end
  object dspFichaRec: TDataSetProvider
    DataSet = qrFichaRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 207
    Top = 593
  end
  object cdsFichaRec: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFichaRec'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 207
    Top = 641
    object cdsFichaRecNRECIBO: TIntegerField
      DisplayLabel = 'Num. Recibo'
      FieldName = 'NRECIBO'
      Required = True
    end
    object cdsFichaRecCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFichaRecVALOR: TFloatField
      DisplayLabel = 'Valor do Recibo'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsFichaRecSTATUS_REC: TStringField
      DisplayLabel = 'Status do Recibo'
      FieldName = 'STATUS_REC'
      FixedChar = True
      Size = 10
    end
    object cdsFichaRecREFERENCIA1: TStringField
      DisplayLabel = 'Refer'#234'ncia 1 do recibo'
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object cdsFichaRecREFERENCIA2: TStringField
      DisplayLabel = 'Refer'#234'ncia 2 do recibo'
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object cdsFichaRecREFERENCIA3: TStringField
      DisplayLabel = 'Refer'#234'ncia 3 do recibo'
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object cdsFichaRecREFERENCIA4: TStringField
      DisplayLabel = 'Refer'#234'ncia 4 do recibo'
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object cdsFichaRecBENEF_CLIENT: TStringField
      DisplayLabel = 'Nome do beneficiado'
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object cdsFichaRecNOME_DEV: TStringField
      DisplayLabel = 'Pessoa que est'#225' pagando'
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object cdsFichaRecDATA_REC: TDateTimeField
      DisplayLabel = 'Data de Recebimento'
      FieldName = 'DATA_REC'
    end
    object cdsFichaRecLOCALDATA: TStringField
      DisplayLabel = 'Local e Data'
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object cdsFichaRecRECANT: TStringField
      DisplayLabel = 'Recibo antecipado?'
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object cdsFichaRecCOD_BENEF: TIntegerField
      DisplayLabel = 'Cliente benefici'#225'rio'
      FieldName = 'COD_BENEF'
    end
    object cdsFichaRecDEPREC: TStringField
      FieldName = 'DEPREC'
      FixedChar = True
      Size = 1
    end
    object cdsFichaRecNDOCANT: TIntegerField
      DisplayLabel = 'Num.Doc.Baixa'
      FieldName = 'NDOCANT'
    end
    object cdsFichaRecDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
    end
    object cdsFichaRecN_MOV_CXL: TIntegerField
      DisplayLabel = 'Num Mov CXL'
      FieldName = 'N_MOV_CXL'
    end
    object cdsFichaRecOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs. CXL'
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object cdsFichaRecSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status no CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsFichaRecVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Vl Recebido CXL'
      FieldName = 'VL_RQ_PG_CXL'
      currency = True
    end
    object cdsFichaRecDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DATA_BAIXA'
    end
    object cdsFichaRecHISTORICO_REC: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object cdsFichaRecCOD_PREP: TIntegerField
      DisplayLabel = 'Cod.Preposto'
      FieldName = 'COD_PREP'
    end
    object cdsFichaRecSELEC: TStringField
      DisplayLabel = 'Selec'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsFichaRecOP_CXL: TIntegerField
      DisplayLabel = 'Op. CXL'
      FieldName = 'OP_CXL'
    end
    object cdsFichaRecCOD_US: TIntegerField
      DisplayLabel = 'Cod.Usu'#225'rio'
      FieldName = 'COD_US'
    end
    object cdsFichaRecCOD_DEVEDOR: TIntegerField
      DisplayLabel = 'Cod.Vendedor'
      FieldName = 'COD_DEVEDOR'
    end
    object cdsFichaRecVALOR_ORIG: TFloatField
      DisplayLabel = 'Valor Orig.'
      FieldName = 'VALOR_ORIG'
      currency = True
    end
    object cdsFichaRecNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsFichaRecSERIE_NF: TStringField
      DisplayLabel = 'S'#233'rie NF'
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object cdsFichaRecDEVOLUCAO: TStringField
      DisplayLabel = 'Devolu'#231#227'o'
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsFichaRecATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsFichaRec: TDataSource
    AutoEdit = False
    DataSet = cdsFichaRec
    Left = 207
    Top = 689
  end
  object qrSugServVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from temp_sug_serv order by nome_cliente')
    Left = 761
    Top = 336
  end
  object dspSugServVeic: TDataSetProvider
    DataSet = qrSugServVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 761
    Top = 384
  end
  object dsSugServVeic: TDataSource
    AutoEdit = False
    DataSet = cdsSugServVeic
    Left = 761
    Top = 480
  end
  object cdsSugServVeic: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSugServVeic'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 760
    Top = 433
    object cdsSugServVeicN_SUG_SERV: TIntegerField
      DisplayLabel = 'Cod Sugest'#227'o'
      FieldName = 'N_SUG_SERV'
      Required = True
    end
    object cdsSugServVeicCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSugServVeicCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsSugServVeicNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object cdsSugServVeicDESC_VEICULO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_VEICULO'
      FixedChar = True
      Size = 60
    end
    object cdsSugServVeicANO_MOD_V: TIntegerField
      DisplayLabel = 'Ano Modelo'
      FieldName = 'ANO_MOD_V'
    end
    object cdsSugServVeicANO_FAB_V: TIntegerField
      DisplayLabel = 'Ano Fabrica'#231#227'o'
      FieldName = 'ANO_FAB_V'
    end
    object cdsSugServVeicCOR_V: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR_V'
      FixedChar = True
      Size = 10
    end
    object cdsSugServVeicDATA_COMPRA: TDateTimeField
      DisplayLabel = 'Data Compra'
      FieldName = 'DATA_COMPRA'
    end
    object cdsSugServVeicDATA_ULT_SERV: TDateTimeField
      DisplayLabel = 'Data '#218'ltimo Serv.'
      FieldName = 'DATA_ULT_SERV'
    end
    object cdsSugServVeicKM_SUG_V: TIntegerField
      DisplayLabel = 'KM Previsto Servi'#231'o'
      FieldName = 'KM_SUG_V'
    end
    object cdsSugServVeicFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object cdsSugServVeicEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 50
    end
    object cdsSugServVeicENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 50
    end
    object cdsSugServVeicBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      FixedChar = True
      Size = 35
    end
    object cdsSugServVeicCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 30
    end
    object cdsSugServVeicCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsSugServVeicCODIGO_UF: TIntegerField
      DisplayLabel = 'C'#243'digo UF'
      FieldName = 'CODIGO_UF'
    end
    object cdsSugServVeicDATA_ULT_CONTATO: TDateTimeField
      DisplayLabel = 'Data '#218'ltimo Contato'
      FieldName = 'DATA_ULT_CONTATO'
    end
    object cdsSugServVeicCOD_VEICULO: TIntegerField
      DisplayLabel = 'Cod Ve'#237'culo'
      FieldName = 'COD_VEICULO'
    end
    object cdsSugServVeicCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsSugServVeicCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
  end
  object qrSugServCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select distinct sugestaoservico.cod_empresa, sugestaoservico.cod' +
        '_equip, sugestaoservico.cod_veic, '
      
        'sugestaoservico.chassi, sugestaoservico.placa, sugestaoservico.d' +
        'ata, sugestaoservico.cod_cliente, '
      
        'case when (sugestaoservico.cod_equip > 0) then equipamento.nom_e' +
        'quip else veiculos.descmodelo end descricao_tp, '
      
        'clientes.nome_cliente, clientes.razao, clientes.fone_cliente, cl' +
        'ientes.email, '
      
        'sugestaoservico.ult_atd, colaborador.nome_vendedor, sugestaoserv' +
        'ico.ativo, '
      
        'sugestaoservico.cod_agenda, sugestaoservico.status, sugestaoserv' +
        'ico.ndoc, sugestaoservico.tpdoc, '
      
        'sugestaoservico.us_cad, sugestaoservico.data_cad, sugestaoservic' +
        'o.hora_cad from sugestaoservico '
      
        'left join equipamento on equipamento.cod_equip = sugestaoservico' +
        '.cod_equip and equipamento.cod_empresa = sugestaoservico.cod_emp' +
        'resa '
      
        'left join veiculos on veiculos.codigo = sugestaoservico.cod_veic' +
        ' and veiculos.chassi = sugestaoservico.chassi and veiculos.placa' +
        ' = sugestaoservico.placa '
      
        'left join clientes on clientes.cod_cliente = sugestaoservico.cod' +
        '_cliente AND clientes.cod_empresa = sugestaoservico.cod_empresa '
      
        'left join colaborador on colaborador.cod_vendedor = sugestaoserv' +
        'ico.ult_atd and colaborador.cod_empresa = sugestaoservico.cod_em' +
        'presa '
      
        'where sugestaoservico.cod_empresa = :codEmpresa and sugestaoserv' +
        'ico.cod_cliente =:CodCli and sugestaoservico.ativo = 1')
    Left = 865
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodCli'
        ParamType = ptUnknown
      end>
  end
  object dspSugServCli: TDataSetProvider
    DataSet = qrSugServCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 865
    Top = 384
  end
  object dsSugServCli: TDataSource
    AutoEdit = False
    DataSet = cdsSugServCli
    Left = 865
    Top = 480
  end
  object cdsSugServCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSugServCli'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 864
    Top = 433
    object cdsSugServCliCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsSugServCliNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object cdsSugServCliRAZAO: TStringField
      DisplayLabel = 'Razao'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsSugServCliDESCRICAO_TP: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_TP'
      Size = 60
    end
    object cdsSugServCliCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
    end
    object cdsSugServCliCOD_VEIC: TIntegerField
      DisplayLabel = 'Cod Veic'
      FieldName = 'COD_VEIC'
    end
    object cdsSugServCliCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsSugServCliPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsSugServCliDATA: TDateTimeField
      DisplayLabel = 'Data Sug'
      FieldName = 'DATA'
    end
    object cdsSugServCliULT_ATD: TIntegerField
      DisplayLabel = 'Cod Ult Atd'
      FieldName = 'ULT_ATD'
    end
    object cdsSugServCliNOME_VENDEDOR: TStringField
      DisplayLabel = 'Ult Atendente'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsSugServCliFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsSugServCliEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsSugServCliCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsSugServCliCOD_AGENDA: TIntegerField
      DisplayLabel = 'Cod Agenda'
      FieldName = 'COD_AGENDA'
    end
    object cdsSugServCliSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsSugServCliUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsSugServCliNDOC: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
    end
    object cdsSugServCliTPDOC: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TPDOC'
      FixedChar = True
      Size = 3
    end
    object cdsSugServCliDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
    end
    object cdsSugServCliHORA_CAD: TStringField
      DisplayLabel = 'Hora Cad'
      FieldName = 'HORA_CAD'
      FixedChar = True
      Size = 8
    end
    object cdsSugServCliATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
end
