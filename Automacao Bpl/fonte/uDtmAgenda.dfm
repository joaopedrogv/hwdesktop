object DtmAgenda: TDtmAgenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 308
  Width = 1051
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 24
    Top = 12
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
    Left = 105
    Top = 14
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from TIPO_SERVICO')
    Left = 192
    Top = 16
  end
  object qrAgenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from agenda')
    Left = 23
    Top = 73
  end
  object dspAgenda: TDataSetProvider
    DataSet = qrAgenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 23
    Top = 124
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgenda'
    BeforeOpen = cdsAgendaBeforeOpen
    Left = 23
    Top = 173
    object cdsAgendaCOD_AGENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_AGENDA'
      Required = True
    end
    object cdsAgendaCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsAgendaNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsAgendaFONE_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsAgendaDATA_AGENDA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data'
      FieldName = 'DATA_AGENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgendaHORA_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Hora'
      FieldName = 'HORA_AGENDA'
      EditMask = '!90;1;_'
      Size = 2
    end
    object cdsAgendaMINUTO_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Minuto'
      FieldName = 'MINUTO_AGENDA'
      EditMask = '!90;1;_'
      Size = 2
    end
    object cdsAgendaDESCR_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Descr Agenda'
      FieldName = 'DESCR_AGENDA'
      Visible = False
      Size = 30
    end
    object cdsAgendaOBSERVACAO: TMemoField
      Tag = 2
      DisplayLabel = 'Observacao'
      FieldName = 'OBSERVACAO'
      OnGetText = cdsAgendaOBSERVACAOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsAgendaSTATUS_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS_AGENDA'
      Size = 10
    end
    object cdsAgendaTMO_SERVICO: TFloatField
      Tag = 2
      DisplayLabel = 'Tmo Servi'#231'o'
      FieldName = 'TMO_SERVICO'
    end
    object cdsAgendaNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'N OS'
      FieldName = 'NPED'
    end
    object cdsAgendaCOD_EQUIP: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Equipamento'
      FieldName = 'COD_EQUIP'
    end
    object cdsAgendaCOD_VEICULO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Ve'#237'culo'
      FieldName = 'COD_VEICULO'
    end
    object cdsAgendaPLACA: TStringField
      Tag = 2
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsAgendaCHASSI: TStringField
      Tag = 2
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsAgendaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
  end
  object dsAgenda: TDataSource
    DataSet = cdsAgenda
    Left = 23
    Top = 227
  end
  object cdsServicoCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspServicoCons'
    BeforeOpen = cdsServicoConsBeforeOpen
    Left = 287
    Top = 173
    object cdsServicoConsCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsServicoConsDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsServicoConsTMO: TFloatField
      FieldName = 'TMO'
    end
    object cdsServicoConsATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrServicoCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cod_servico, desc_servico, tmo, ativo  from tipo_servico'
      'where ativo =1')
    Left = 287
    Top = 73
  end
  object dsServicoCons: TDataSource
    DataSet = cdsServicoCons
    Left = 287
    Top = 227
  end
  object dspServicoCons: TDataSetProvider
    DataSet = qrServicoCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 287
    Top = 124
  end
  object cdsClienteCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspClienteCons'
    BeforeOpen = cdsClienteConsBeforeOpen
    Left = 375
    Top = 173
    object cdsClienteConsCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClienteConsNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsClienteConsFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsClienteConsATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrClienteCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cod_cliente, nome_cliente, ativo, fone_cliente  from clie' +
        'ntes')
    Left = 375
    Top = 73
  end
  object dsClienteCons: TDataSource
    DataSet = cdsClienteCons
    Left = 375
    Top = 227
  end
  object dspClienteCons: TDataSetProvider
    DataSet = qrClienteCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 375
    Top = 124
  end
  object cdsMecanicoCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMecanicoCons'
    BeforeOpen = cdsMecanicoConsBeforeOpen
    Left = 463
    Top = 173
    object cdsMecanicoConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsMecanicoConsNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsMecanicoConsDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
  end
  object qrMecanicoCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      ' select distinct c.cod_vendedor, c.nome_vendedor, f.desc_funcao'
      
        ' from colaborador c  inner join funcoes f on f.cod_funcao = c.co' +
        'd_funcao'
      ' left join tmo_serv_os t on t.cod_vendedor = c.cod_vendedor'
      ' where  c.cod_empresa = 1 and c.ativo = 1 and'
      
        ' ((f.desc_funcao like '#39'%MECANICO%'#39') or (f.desc_funcao like '#39'%MEC' +
        #194'NICO%'#39'))'
      
        ' and (t.tipo_op ='#39'S'#39' or t.tipo_op ='#39'P'#39' or t.tipo_op is null)  or' +
        'der by t.dia asc, t.hora_inicio asc'
      '   '
      ' ')
    Left = 463
    Top = 73
  end
  object dsMecanicoCons: TDataSource
    DataSet = cdsMecanicoCons
    Left = 463
    Top = 227
  end
  object dspMecanicoCons: TDataSetProvider
    DataSet = qrMecanicoCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 463
    Top = 124
  end
  object cdsBoxCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBoxCons'
    BeforeOpen = cdsBoxConsBeforeOpen
    Left = 551
    Top = 173
    object cdsBoxConsCOD_BOX: TIntegerField
      FieldName = 'COD_BOX'
      Required = True
    end
    object cdsBoxConsDESCR_BOX: TStringField
      FieldName = 'DESCR_BOX'
      Size = 30
    end
    object cdsBoxConsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object qrBoxCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cod_box, descr_box, cod_empresa from box'
      'where cod_empresa= 1 and ativo = 1')
    Left = 551
    Top = 73
  end
  object dsBoxCons: TDataSource
    DataSet = cdsBoxCons
    Left = 551
    Top = 227
  end
  object dspBoxCons: TDataSetProvider
    DataSet = qrBoxCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 551
    Top = 124
  end
  object qrAgendaItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select ai.*, c.nome_vendedor, b.descr_box from agenda a'
      
        'inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and a' +
        'i.cod_empresa = a.cod_empresa'
      
        'left join colaborador c on c.cod_vendedor = ai.cod_vendedor and ' +
        'c.cod_empresa = ai.cod_empresa'
      
        'left join box b on b.cod_box = ai.cod_box and b.cod_empresa = ai' +
        '.cod_empresa'
      'where ai.cod_agenda = 0 and ai.cod_empresa = 0')
    Left = 103
    Top = 73
  end
  object dspAgendaItens: TDataSetProvider
    DataSet = qrAgendaItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 103
    Top = 124
  end
  object cdsAgendaItens: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgendaItens'
    BeforeOpen = cdsAgendaItensBeforeOpen
    Left = 103
    Top = 173
    object cdsAgendaItensSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      ProviderFlags = [pfInWhere]
      Size = 1
    end
    object cdsAgendaItensCOD_AGENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo Agenda'
      FieldName = 'COD_AGENDA'
      Required = True
    end
    object cdsAgendaItensCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAgendaItensNITEM: TIntegerField
      Tag = 2
      DisplayLabel = 'Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsAgendaItensCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsAgendaItensDESC_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsAgendaItensTMO_SERVICO: TFloatField
      DisplayLabel = 'Tmo'
      FieldName = 'TMO_SERVICO'
    end
    object cdsAgendaItensCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsAgendaItensVALOR_SERVICO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_SERVICO'
    end
    object cdsAgendaItensCOD_BOX: TIntegerField
      DisplayLabel = 'Cod Box'
      FieldName = 'COD_BOX'
    end
    object cdsAgendaItensCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsAgendaItensNPED: TIntegerField
      DisplayLabel = 'OS'
      FieldName = 'NPED'
    end
    object cdsAgendaItensNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 35
    end
    object cdsAgendaItensDESCR_BOX: TStringField
      FieldName = 'DESCR_BOX'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 30
    end
    object cdsAgendaItensCODBOX: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODBOX'
      ProviderFlags = [pfInWhere, pfHidden]
    end
    object cdsAgendaItensCODNOMEVENDEDOR: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODNOMEVENDEDOR'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 40
    end
  end
  object dsAgendaItens: TDataSource
    DataSet = cdsAgendaItens
    Left = 103
    Top = 227
  end
  object qrLembreteAgenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from lembrete_agenda'
      'where cod_empresa = 0 and nped is null')
    Left = 199
    Top = 73
  end
  object dspLembreteAgenda: TDataSetProvider
    DataSet = qrLembreteAgenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 199
    Top = 124
  end
  object cdsLembreteAgenda: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLembreteAgenda'
    BeforeOpen = cdsAgendaItensBeforeOpen
    Left = 199
    Top = 173
    object cdsLembreteAgendaNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsLembreteAgendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLembreteAgendaSTATUS_OS: TStringField
      FieldName = 'STATUS_OS'
      Required = True
      Size = 10
    end
    object cdsLembreteAgendaDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object cdsLembreteAgendaHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object cdsLembreteAgendaLEMBRETE: TStringField
      FieldName = 'LEMBRETE'
      Size = 60
    end
    object cdsLembreteAgendaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsLembreteAgenda: TDataSource
    DataSet = cdsLembreteAgenda
    Left = 199
    Top = 227
  end
  object cdsAgendaItensTemp: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    BeforeOpen = cdsAgendaItensBeforeOpen
    Left = 559
    Top = 5
    object cdsAgendaItensTempCOD_AGENDA: TIntegerField
      FieldName = 'COD_AGENDA'
    end
    object cdsAgendaItensTempCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object cdsAgendaItensTempNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsAgendaItensTempTMO_SERVICO: TFloatField
      FieldName = 'TMO_SERVICO'
    end
  end
  object cdsAgendaMecanico: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgendaMecanico'
    BeforeOpen = cdsAgendaMecanicoBeforeOpen
    Left = 647
    Top = 173
    object cdsAgendaMecanicoCOD_AGENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Agenda'
      FieldName = 'COD_AGENDA'
      Required = True
    end
    object cdsAgendaMecanicoDATA_AGENDA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Agenda'
      FieldName = 'DATA_AGENDA'
    end
    object cdsAgendaMecanicoHORA_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Hora Agenda'
      FieldName = 'HORA_AGENDA'
      Size = 2
    end
    object cdsAgendaMecanicoMINUTO_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Minuto Agenda'
      FieldName = 'MINUTO_AGENDA'
      Size = 2
    end
    object cdsAgendaMecanicoNITEM: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsAgendaMecanicoCOD_SERVICO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsAgendaMecanicoDESC_SERVICO: TStringField
      Tag = 2
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsAgendaMecanicoTMO_SERVICO: TFloatField
      Tag = 2
      DisplayLabel = 'Tmo'
      FieldName = 'TMO_SERVICO'
    end
    object cdsAgendaMecanicoCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsAgendaMecanicoVALOR_SERVICO: TFloatField
      Tag = 2
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_SERVICO'
    end
    object cdsAgendaMecanicoCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsAgendaMecanicoNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsAgendaMecanicoCOD_VENDEDOR: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsAgendaMecanicoNOME_VENDEDOR: TStringField
      Tag = 2
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsAgendaMecanicoCOD_BOX: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Box'
      FieldName = 'COD_BOX'
    end
    object cdsAgendaMecanicoDESCR_BOX: TStringField
      Tag = 2
      DisplayLabel = 'Box'
      FieldName = 'DESCR_BOX'
      Size = 30
    end
    object cdsAgendaMecanicoNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' OS'
      FieldName = 'NPED'
    end
    object cdsAgendaMecanicoSTATUS_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS_AGENDA'
      Size = 10
    end
    object cdsAgendaMecanicoCOD_VEICULO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Ve'#237'culo'
      FieldName = 'COD_VEICULO'
    end
    object cdsAgendaMecanicoPLACA: TStringField
      Tag = 2
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsAgendaMecanicoCHASSI: TStringField
      Tag = 2
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsAgendaMecanicoCOD_EQUIP: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
    end
    object cdsAgendaMecanicoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object qrAgendaMecanico: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select ai.*, a.cod_cliente, a.nome_cliente, c.nome_vendedor, a.d' +
        'ata_agenda, a.hora_agenda, a.minuto_agenda, a.status_agenda, b.d' +
        'escr_box,'
      'a.cod_veiculo, a.placa, a.chassi, a.cod_equip from agenda a'
      
        'inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and a' +
        'i.cod_empresa = a.cod_empresa'
      
        'left join colaborador c on c.cod_vendedor = ai.cod_vendedor and ' +
        'c.cod_empresa = ai.cod_empresa'
      
        'left join box b on b.cod_box = ai.cod_box and b.cod_empresa = ai' +
        '.cod_empresa'
      'where ai.cod_agenda = 0 and ai.cod_empresa = 0')
    Left = 647
    Top = 73
  end
  object dsAgendaMecanico: TDataSource
    DataSet = cdsAgendaMecanico
    Left = 647
    Top = 227
  end
  object dspAgendaMecanico: TDataSetProvider
    DataSet = qrAgendaMecanico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 647
    Top = 124
  end
  object qrApar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from EQUIPAMENTO')
    Left = 730
    Top = 77
  end
  object dspApar: TDataSetProvider
    DataSet = qrApar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 730
    Top = 124
  end
  object cdsApar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspApar'
    BeforeOpen = cdsAparBeforeOpen
    Left = 730
    Top = 176
    object cdsAparCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsAparCOD_PROP: TIntegerField
      FieldName = 'COD_PROP'
    end
    object cdsAparNOM_EQUIP: TStringField
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsAparN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsAparMARCA: TStringField
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsAparMODELO: TStringField
      FieldName = 'MODELO'
      Size = 32
    end
    object cdsAparCOR: TStringField
      FieldName = 'COR'
      Size = 16
    end
    object cdsAparTIP_EQUIP: TStringField
      FieldName = 'TIP_EQUIP'
      FixedChar = True
      Size = 1
    end
    object cdsAparTIPOOSVINC: TStringField
      FieldName = 'TIPOOSVINC'
      Size = 10
    end
    object cdsAparCOMCONTRATO: TStringField
      FieldName = 'COMCONTRATO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsveic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVeic'
    BeforeOpen = cdsveicBeforeOpen
    Left = 789
    Top = 176
    object cdsveicPLACA: TStringField
      FieldName = 'PLACA'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsveicCHASSI: TStringField
      FieldName = 'CHASSI'
      Required = True
      FixedChar = True
      Size = 17
    end
    object cdsveicCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsveicESPECIE: TStringField
      FieldName = 'ESPECIE'
      FixedChar = True
      Size = 15
    end
    object cdsveicMARCA_V: TStringField
      FieldName = 'MARCA_V'
      FixedChar = True
      Size = 15
    end
    object cdsveicMODELO: TIntegerField
      FieldName = 'MODELO'
    end
    object cdsveicANOFAB: TIntegerField
      FieldName = 'ANOFAB'
    end
    object cdsveicANOMOD: TIntegerField
      FieldName = 'ANOMOD'
    end
    object cdsveicDESCMODELO: TStringField
      FieldName = 'DESCMODELO'
      FixedChar = True
      Size = 30
    end
    object cdsveicCOR: TStringField
      FieldName = 'COR'
      FixedChar = True
      Size = 10
    end
    object cdsveicOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 45
    end
    object cdsveicCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsveicCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsveicRENAVAM: TStringField
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 9
    end
  end
  object dspVeic: TDataSetProvider
    DataSet = qrVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 789
    Top = 124
  end
  object qrVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from VEICULOS')
    Left = 789
    Top = 77
  end
  object dsApar: TDataSource
    DataSet = cdsApar
    Left = 730
    Top = 227
  end
  object dsveic: TDataSource
    DataSet = cdsveic
    Left = 786
    Top = 227
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    BeforeOpen = cdsAgendaItensBeforeOpen
    Left = 679
    Top = 5
    object cdsTempCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsTempNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
    end
    object cdsTempDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
    end
    object cdsTempDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsTempTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object dsTemp: TDataSource
    DataSet = cdsTemp
    Left = 730
    Top = 5
  end
end
