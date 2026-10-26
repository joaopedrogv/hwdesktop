object dtmMobile: TdtmMobile
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 304
  Width = 644
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
      'select * from INDICE_TECNICO')
    Left = 192
    Top = 16
  end
  object qrMobile: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select m.* from mobile as m')
    Left = 23
    Top = 73
  end
  object dspMobile: TDataSetProvider
    DataSet = qrMobile
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 23
    Top = 124
  end
  object cdsMobile: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMobile'
    BeforeOpen = cdsMobileBeforeOpen
    Left = 23
    Top = 173
    object cdsMobileIDMOBILE: TIntegerField
      Tag = 2
      DisplayLabel = 'Id Mobile'
      FieldName = 'IDMOBILE'
      Required = True
    end
    object cdsMobileDESCRICAO_MOB: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_MOB'
      Size = 30
    end
    object cdsMobileSTATUS_MOB: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS_MOB'
      Size = 10
    end
    object cdsMobileATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsMobileCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object dsMobile: TDataSource
    DataSet = cdsMobile
    Left = 23
    Top = 227
  end
  object qrMensMobile: TIBQuery
    Tag = 2
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select mb.*, '
      'm.descricao_mob, '
      'c.nome_vendedor as usuario_leu, '
      'f.nome_vendedor as usuario_envio, '
      'a.aplicativo, '
      'p.plataforma, '
      'r.nome_vendedor as prof_resp, '
      'ar.aplicativo as aplicativo_resp, '
      'pr.plataforma as plataforma_resp'
      'from mensagem_mob mb '
      
        'left join mobile m on m.idmobile = mb.idmobile and m.cod_empresa' +
        ' = mb.cod_empresa '
      
        'left join colaborador c on c.cod_vendedor = mb.cod_us_leu and c.' +
        'cod_empresa = mb.cod_empresa '
      
        'left join colaborador f on f.cod_vendedor = mb.us_envio and f.co' +
        'd_empresa = mb.cod_empresa '
      
        'left join colaborador r on r.cod_vendedor = mb.cod_prof_resp and' +
        ' r.cod_empresa = mb.cod_empresa'
      'left join msg_aplicativo a on a.id = mb.id_msg_aplicativo'
      
        'left join msg_plataforma p on p.id = mb.id_msg_plataforma and p.' +
        'cod_empresa = mb.cod_empresa '
      'left join msg_aplicativo ar on ar.id = mb.id_msg_aplicativo_resp'
      
        'left join msg_plataforma pr on pr.id = mb.id_msg_plataforma_resp' +
        ' and pr.cod_empresa = mb.id_msg_plataforma_resp'
      
        'where mb.idseqm = 0 and mb.cod_empresa = 0 and m.ativo = 0 and c' +
        '.ativo = 0')
    Left = 103
    Top = 73
  end
  object dspMensMobile: TDataSetProvider
    DataSet = qrMensMobile
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 103
    Top = 124
  end
  object cdsMensMobile: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMensMobile'
    BeforeOpen = cdsMobileBeforeOpen
    Left = 103
    Top = 173
    object cdsMensMobileSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsMensMobileIDSEQM: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'IDSEQM'
      Required = True
    end
    object cdsMensMobileTIPO: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsMensMobileNATUREZA_MENS: TStringField
      Tag = 2
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA_MENS'
      FixedChar = True
      Size = 1
    end
    object cdsMensMobileASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      FieldName = 'ASSUNTO'
      Size = 64
    end
    object cdsMensMobileHTML: TMemoField
      Tag = 2
      DisplayLabel = 'Mensagem'
      FieldName = 'HTML'
      OnGetText = cdsMensMobileHTMLGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsMensMobileMENSAGEM: TStringField
      Tag = 1
      DisplayLabel = '.'
      FieldName = 'MENSAGEM'
      Size = 400
    end
    object cdsMensMobileUS_ENVIO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Usuario Envio'
      FieldName = 'US_ENVIO'
    end
    object cdsMensMobileUSUARIO_ENVIO: TStringField
      Tag = 2
      DisplayLabel = 'Usuario Envio'
      FieldName = 'USUARIO_ENVIO'
      Size = 35
    end
    object cdsMensMobileDATA_ENVIO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Envio'
      FieldName = 'DATA_ENVIO'
    end
    object cdsMensMobileHORA_ENVIO: TStringField
      Tag = 2
      DisplayLabel = 'Hora Envio'
      FieldName = 'HORA_ENVIO'
      FixedChar = True
      Size = 8
    end
    object cdsMensMobileCOD_US_LEU: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Usuario Receptor'
      FieldName = 'COD_US_LEU'
    end
    object cdsMensMobileUSUARIO_LEU: TStringField
      Tag = 2
      DisplayLabel = 'Usuario Receptor'
      FieldName = 'USUARIO_LEU'
      Size = 35
    end
    object cdsMensMobileDATA_RECEPCAO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Recepcao'
      FieldName = 'DATA_RECEPCAO'
      EditMask = '!99/99/0000;0;_'
    end
    object cdsMensMobileHORA_RECEPCAO: TStringField
      Tag = 2
      DisplayLabel = 'Hora Recepcao'
      FieldName = 'HORA_RECEPCAO'
      FixedChar = True
      Size = 8
    end
    object cdsMensMobileCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsMensMobileIDMOBILE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Mobile'
      FieldName = 'IDMOBILE'
      Required = True
    end
    object cdsMensMobileATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsMensMobileSTATUS_MENS: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS_MENS'
      FixedChar = True
      Size = 1
    end
    object cdsMensMobileUS_DEST: TStringField
      Tag = 2
      DisplayLabel = 'Para'
      DisplayWidth = 60
      FieldName = 'US_DEST'
      FixedChar = True
      Size = 60
    end
    object cdsMensMobileDESCRICAO_MOB: TStringField
      Tag = 2
      DisplayLabel = 'Mobile'
      FieldName = 'DESCRICAO_MOB'
      Size = 30
    end
    object cdsMensMobileORIG_MENS: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIG_MENS'
      FixedChar = True
      Size = 1
    end
    object cdsMensMobileAPLICATIVO: TStringField
      DisplayLabel = 'Aplicativo'
      FieldName = 'APLICATIVO'
      Size = 50
    end
    object cdsMensMobilePLATAFORMA: TStringField
      DisplayLabel = 'Plataforma'
      FieldName = 'PLATAFORMA'
      Size = 50
    end
    object cdsMensMobileSTATUS_ENV: TStringField
      DisplayLabel = 'Status Env'
      FieldName = 'STATUS_ENV'
      Size = 2
    end
    object cdsMensMobileOBS_ENV: TMemoField
      DisplayLabel = 'Obs Env'
      FieldName = 'OBS_ENV'
      OnGetText = cdsMensMobileOBS_ENVGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsMensMobileUUID: TStringField
      DisplayLabel = 'Guid'
      FieldName = 'UUID'
      Size = 50
    end
    object cdsMensMobileID_MSG_APLICATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Aplicativo'
      FieldName = 'ID_MSG_APLICATIVO'
      Required = True
    end
    object cdsMensMobileID_MSG_PLATAFORMA: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Plataforma'
      FieldName = 'ID_MSG_PLATAFORMA'
      Required = True
    end
    object cdsMensMobileCOD_CARTA: TIntegerField
      DisplayLabel = 'Cod Carta'
      FieldName = 'COD_CARTA'
    end
    object cdsMensMobileORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      Size = 3
    end
    object cdsMensMobileDESTINO: TStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 3
    end
    object cdsMensMobileCOD_TAREFA: TIntegerField
      DisplayLabel = 'Cod Tarefa'
      FieldName = 'COD_TAREFA'
    end
    object cdsMensMobileEXEC_AUTO: TStringField
      DisplayLabel = 'Exec Auto'
      FieldName = 'EXEC_AUTO'
      Size = 1
    end
    object cdsMensMobileCOD_PROF_RESP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Prof Resp'
      FieldName = 'COD_PROF_RESP'
    end
    object cdsMensMobileID_MSG_APLICATIVO_RESP: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Aplicativo Resp'
      FieldName = 'ID_MSG_APLICATIVO_RESP'
    end
    object cdsMensMobileID_MSG_PLATAFORMA_RESP: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Plataforma Resp'
      FieldName = 'ID_MSG_PLATAFORMA_RESP'
    end
    object cdsMensMobilePROF_RESP: TStringField
      DisplayLabel = 'Prof Resp'
      FieldName = 'PROF_RESP'
      Size = 35
    end
    object cdsMensMobileAPLICATIVO_RESP: TStringField
      DisplayLabel = 'Aplicativo Resp'
      FieldName = 'APLICATIVO_RESP'
      Size = 50
    end
    object cdsMensMobilePLATAFORMA_RESP: TStringField
      DisplayLabel = 'Plataforma Resp'
      FieldName = 'PLATAFORMA_RESP'
      Size = 50
    end
    object cdsMensMobileIDENTIFICADOR_RESP: TStringField
      DisplayLabel = 'Identificador Resp'
      FieldName = 'IDENTIFICADOR_RESP'
      Size = 60
    end
  end
  object dsMensMobile: TDataSource
    DataSet = cdsMensMobile
    Left = 103
    Top = 227
  end
  object cdsMobileCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMobileCons'
    BeforeOpen = cdsMobileBeforeOpen
    Left = 191
    Top = 173
    object cdsMobileConsSEL: TStringField
      Tag = 2
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsMobileConsIDMOBILE: TIntegerField
      Tag = 2
      FieldName = 'IDMOBILE'
      Required = True
    end
    object cdsMobileConsDESCRICAO_MOB: TStringField
      Tag = 2
      FieldName = 'DESCRICAO_MOB'
      Size = 30
    end
  end
  object qrMobileCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select idmobile, descricao_mob  from mobile')
    Left = 191
    Top = 73
  end
  object dsMobileCons: TDataSource
    DataSet = cdsMobileCons
    Left = 191
    Top = 227
  end
  object dspMobileCons: TDataSetProvider
    DataSet = qrMobileCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 191
    Top = 124
  end
  object qrUsuarioMensMobile: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cod_vendedor, nome_vendedor from colaborador'
      '')
    Left = 287
    Top = 73
  end
  object dspUsuarioMensMobile: TDataSetProvider
    DataSet = qrUsuarioMensMobile
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 287
    Top = 124
  end
  object cdsUsuarioMensMobile: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspUsuarioMensMobile'
    BeforeOpen = cdsMobileBeforeOpen
    Left = 287
    Top = 173
    object cdsUsuarioMensMobileCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsUsuarioMensMobileNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsUsuarioMensMobile: TDataSource
    DataSet = cdsUsuarioMensMobile
    Left = 287
    Top = 227
  end
  object qrSenhasCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select codigo, usuario from senhas'
      'where cod_empresa = 1 and ativo = 1'
      'order by usuario')
    Left = 399
    Top = 73
  end
  object dspSenhasCons: TDataSetProvider
    DataSet = qrSenhasCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 399
    Top = 124
  end
  object cdsSenhasCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSenhasCons'
    BeforeOpen = cdsMobileBeforeOpen
    Left = 399
    Top = 173
    object cdsSenhasConsSEL: TStringField
      Tag = 2
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsSenhasConsCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsSenhasConsUSUARIO: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 10
    end
  end
  object dsSenhasCons: TDataSource
    DataSet = cdsSenhasCons
    Left = 399
    Top = 227
  end
  object qrDocEletronicoMensMobile: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select doc_eletronico.seqid, doc_eletronico.doc, doc_eletronico.' +
        'data from doc_eletronico')
    Left = 519
    Top = 73
  end
  object dspDocEletronicoMensMobile: TDataSetProvider
    DataSet = qrDocEletronicoMensMobile
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 519
    Top = 124
  end
  object cdsDocEletronicoMensMobile: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDocEletronicoMensMobile'
    BeforeOpen = cdsMobileBeforeOpen
    Left = 519
    Top = 173
    object cdsDocEletronicoMensMobileSEQID: TLargeintField
      DisplayLabel = 'Id'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsDocEletronicoMensMobileDOC: TMemoField
      DisplayLabel = 'Doc'
      FieldName = 'DOC'
      BlobType = ftMemo
      Size = 8
    end
    object cdsDocEletronicoMensMobileDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
  end
  object dsDocEletronicoMensMobile: TDataSource
    DataSet = cdsDocEletronicoMensMobile
    Left = 519
    Top = 227
  end
end
