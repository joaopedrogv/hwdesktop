object dtmFollowUpPosAtendimento: TdtmFollowUpPosAtendimento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 722
  Width = 1394
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
  object qrFlwGrupo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_grupo where codgrupo = 0 and cod_empresa = 0')
    Left = 33
    Top = 64
  end
  object dspFlwGrupo: TDataSetProvider
    DataSet = qrFlwGrupo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 33
    Top = 112
  end
  object cdsFlwGrupo: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFlwGrupo'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 33
    Top = 160
    object cdsFlwGrupoCODGRUPO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODGRUPO'
      Required = True
    end
    object cdsFlwGrupoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFlwGrupoDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsFlwGrupoCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 32
    end
    object cdsFlwGrupoATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsFlwGrupo: TDataSource
    AutoEdit = False
    DataSet = cdsFlwGrupo
    Left = 33
    Top = 208
  end
  object qrPergunta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select p.*, g.descricao, g.categoria from flw_pergunta p'
      
        'inner join flw_grupo g on g.codgrupo = p.codgrupo and g.cod_empr' +
        'esa = p.cod_empresa'
      'where p.codpergunta = 0 and p.cod_empresa = 0')
    Left = 191
    Top = 64
  end
  object dspPergunta: TDataSetProvider
    DataSet = qrPergunta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 191
    Top = 112
  end
  object cdsPergunta: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPergunta'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 191
    Top = 160
    object cdsPerguntaCODPERGUNTA: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPERGUNTA'
      Required = True
    end
    object cdsPerguntaPERGUNTA: TStringField
      Tag = 2
      DisplayLabel = 'Pergunta'
      FieldName = 'PERGUNTA'
      Size = 256
    end
    object cdsPerguntaDESCRICAO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsPerguntaCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 32
    end
    object cdsPerguntaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerguntaSIMNAONIVEL: TStringField
      DisplayLabel = 'Tipo de Resposta'
      DisplayWidth = 20
      FieldName = 'SIMNAONIVEL'
    end
    object cdsPerguntaCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 256
    end
    object cdsPerguntaCODGRUPO: TIntegerField
      DisplayLabel = 'Cod Grupo'
      FieldName = 'CODGRUPO'
    end
    object cdsPerguntaATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsPergunta: TDataSource
    AutoEdit = False
    DataSet = cdsPergunta
    Left = 191
    Top = 208
  end
  object qrPergCompl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_perguntacomplemento'
      'where codpergcompl = 0 and cod_empresa = 0 and codpergunta = 0')
    Left = 271
    Top = 64
  end
  object dspPergCompl: TDataSetProvider
    DataSet = qrPergCompl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 271
    Top = 112
  end
  object cdsPergCompl: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPergCompl'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 271
    Top = 160
    object cdsPergComplCODPERGCOMPL: TIntegerField
      FieldName = 'CODPERGCOMPL'
      Required = True
    end
    object cdsPergComplCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPergComplCODPERGUNTA: TIntegerField
      FieldName = 'CODPERGUNTA'
      Required = True
    end
    object cdsPergComplALTERNATIVA: TStringField
      FieldName = 'ALTERNATIVA'
      Size = 128
    end
    object cdsPergComplORDEM: TSmallintField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
    end
  end
  object dsPergCompl: TDataSource
    AutoEdit = False
    DataSet = cdsPergCompl
    Left = 271
    Top = 208
  end
  object qrPefilPerg: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_perfilpergunta'
      'where codperfil = 0 and cod_empresa = 0')
    Left = 350
    Top = 64
  end
  object dspPerfilPerg: TDataSetProvider
    DataSet = qrPefilPerg
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 350
    Top = 112
  end
  object cdsPerfilPerg: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPerfilPerg'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 350
    Top = 160
    object cdsPerfilPergCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsPerfilPergCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerfilPergCODPERGUNTA: TIntegerField
      FieldName = 'CODPERGUNTA'
      Required = True
    end
    object cdsPerfilPergORDEM: TSmallintField
      FieldName = 'ORDEM'
    end
  end
  object dsPerfilPerg: TDataSource
    AutoEdit = False
    DataSet = cdsPerfilPerg
    Left = 350
    Top = 208
  end
  object qrAtend: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select flw_atendimento.*, c.nome_vendedor from flw_atendimento'
      
        'inner join colaborador c on c.cod_vendedor = flw_atendimento.cod' +
        '_vendedor and c.cod_empresa = flw_atendimento.cod_empresa'
      
        'where flw_atendimento.codatendimento = 0 and flw_atendimento.cod' +
        '_empresa = 0')
    Left = 429
    Top = 64
  end
  object dspAtend: TDataSetProvider
    DataSet = qrAtend
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 429
    Top = 112
  end
  object cdsAtend: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAtend'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 429
    Top = 160
    object cdsAtendCODATENDIMENTO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODATENDIMENTO'
      Required = True
    end
    object cdsAtendNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsAtendNOME_VENDEDOR: TStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsAtendATENDIMENTO: TMemoField
      Tag = 2
      DisplayLabel = 'Atendimento'
      FieldName = 'ATENDIMENTO'
      OnGetText = cdsAtendATENDIMENTOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtendDATA_ATEND: TDateTimeField
      DisplayLabel = 'Data Atendimento'
      FieldName = 'DATA_ATEND'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAtendCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 32
      FieldName = 'CATEGORIA'
      Size = 32
    end
    object cdsAtendCODATENDIMENTOHWAUTO: TIntegerField
      DisplayLabel = 'Cod Atend Hw'
      FieldName = 'CODATENDIMENTOHWAUTO'
    end
    object cdsAtendCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsAtendCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsAtendCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAtendATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsAtend: TDataSource
    AutoEdit = False
    DataSet = cdsAtend
    Left = 429
    Top = 208
  end
  object qrPesquisa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_pesquisa'
      'where codpesquisa = 0 and cod_empresa = 0')
    Left = 509
    Top = 64
  end
  object dspPesquisa: TDataSetProvider
    DataSet = qrPesquisa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 509
    Top = 112
  end
  object cdsPesquisa: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesquisa'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 509
    Top = 160
    object cdsPesquisaCODPESQUISA: TIntegerField
      FieldName = 'CODPESQUISA'
      Required = True
    end
    object cdsPesquisaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPesquisaCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsPesquisaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsPesquisaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsPesquisaCODPESQUISADOR: TIntegerField
      FieldName = 'CODPESQUISADOR'
    end
    object cdsPesquisaDATAPESQUISA: TDateTimeField
      FieldName = 'DATAPESQUISA'
    end
    object cdsPesquisaHORAPESQUISA: TStringField
      FieldName = 'HORAPESQUISA'
      Size = 5
    end
    object cdsPesquisaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPesquisaCODATENDIMENTO: TIntegerField
      FieldName = 'CODATENDIMENTO'
    end
    object cdsPesquisaNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsPesquisaTIPO_PED: TStringField
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsPesquisaDATAFECHAMENTO: TDateTimeField
      FieldName = 'DATAFECHAMENTO'
    end
    object cdsPesquisaHORAFECHAMENTO: TStringField
      FieldName = 'HORAFECHAMENTO'
      Size = 5
    end
    object cdsPesquisaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsPesquisaCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 32
    end
    object cdsPesquisaSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object cdsPesquisaDADOS: TMemoField
      FieldName = 'DADOS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPesquisaATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = cdsPesquisa
    Left = 509
    Top = 208
  end
  object qrResposta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select setor.*, c.nome_vendedor from setor'
      
        'left join colaborador c on c.cod_vendedor = setor.cod_vendedor a' +
        'nd c.cod_empresa = setor.cod_empresa where setor.cod_setor = 0 a' +
        'nd setor.cod_empresa = 0')
    Left = 588
    Top = 64
  end
  object dspResposta: TDataSetProvider
    DataSet = qrResposta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 588
    Top = 112
  end
  object cdsResposta: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspResposta'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 588
    Top = 160
  end
  object dsResposta: TDataSource
    AutoEdit = False
    DataSet = cdsResposta
    Left = 588
    Top = 208
  end
  object qrRespCompl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select setor.*, c.nome_vendedor from setor'
      
        'left join colaborador c on c.cod_vendedor = setor.cod_vendedor a' +
        'nd c.cod_empresa = setor.cod_empresa where setor.cod_setor = 0 a' +
        'nd setor.cod_empresa = 0')
    Left = 668
    Top = 64
  end
  object dspRespCompl: TDataSetProvider
    DataSet = qrRespCompl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 668
    Top = 112
  end
  object cdsRespCompl: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRespCompl'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 668
    Top = 160
  end
  object dsRespCompl: TDataSource
    AutoEdit = False
    DataSet = cdsRespCompl
    Left = 668
    Top = 208
  end
  object qrColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select setor.*, c.nome_vendedor from setor'
      
        'left join colaborador c on c.cod_vendedor = setor.cod_vendedor a' +
        'nd c.cod_empresa = setor.cod_empresa where setor.cod_setor = 0 a' +
        'nd setor.cod_empresa = 0')
    Left = 737
    Top = 280
  end
  object dspColab: TDataSetProvider
    DataSet = qrColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 737
    Top = 328
  end
  object cdsColab: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspColab'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 737
    Top = 376
  end
  object dsColab: TDataSource
    AutoEdit = False
    DataSet = cdsColab
    Left = 737
    Top = 424
  end
  object qrFlwGrCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_grupo where codgrupo =0  and cod_empresa = 0')
    Left = 112
    Top = 280
  end
  object dspFlwGrCons: TDataSetProvider
    DataSet = qrFlwGrCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 112
    Top = 328
  end
  object cdsFlwGrCons: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFlwGrCons'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 112
    Top = 376
    object cdsFlwGrConsCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Required = True
    end
    object cdsFlwGrConsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFlwGrConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsFlwGrConsCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 32
    end
    object cdsFlwGrConsATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object dsFlwGrCons: TDataSource
    AutoEdit = False
    DataSet = cdsFlwGrCons
    Left = 112
    Top = 424
  end
  object qrPergCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select p.*, g.descricao, g.categoria from flw_pergunta p'
      
        'inner join flw_grupo g on g.codgrupo = p.codgrupo and g.cod_empr' +
        'esa = p.cod_empresa'
      'where p.codpergunta = 0 and p.cod_empresa = 0')
    Left = 191
    Top = 280
  end
  object dspPergCons: TDataSetProvider
    DataSet = qrPergCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 191
    Top = 328
  end
  object cdsPergCons: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPergunta'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 191
    Top = 376
    object cdsPergConsCODPERGUNTA: TIntegerField
      FieldName = 'CODPERGUNTA'
      Required = True
    end
    object cdsPergConsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPergConsCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object cdsPergConsPERGUNTA: TStringField
      FieldName = 'PERGUNTA'
      Size = 256
    end
    object cdsPergConsSIMNAONIVEL: TStringField
      DisplayWidth = 20
      FieldName = 'SIMNAONIVEL'
    end
    object cdsPergConsCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 256
    end
    object cdsPergConsATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsPergConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsPergConsCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 32
    end
  end
  object dsPergCons: TDataSource
    AutoEdit = False
    DataSet = cdsPergCons
    Left = 191
    Top = 424
  end
  object cdsPerfilPergMem: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPerfilPerg'
    Left = 350
    Top = 8
    object cdsPerfilPergMemCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsPerfilPergMemCODPERGUNTA: TIntegerField
      FieldName = 'CODPERGUNTA'
      Required = True
    end
    object cdsPerfilPergMemPERGUNTA: TStringField
      FieldName = 'PERGUNTA'
      Size = 256
    end
    object cdsPerfilPergMemCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 256
    end
    object cdsPerfilPergMemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsPerfilPergMemCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 32
    end
    object cdsPerfilPergMemORDEM: TSmallintField
      FieldName = 'ORDEM'
    end
  end
  object dsPerfilPergMem: TDataSource
    AutoEdit = False
    DataSet = cdsPerfilPergMem
    Left = 435
    Top = 8
  end
  object qrCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.cod_cliente,  c.nome_cliente, c.razao, c.fone_cliente, ' +
        'c.ramal, c.tel_res_cf, c.fax, c.contato, c.email from clientes c'
      'where c.cod_cliente = 0 and c.cod_empresa = 0')
    Left = 801
    Top = 280
  end
  object dspCli: TDataSetProvider
    DataSet = qrCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 801
    Top = 328
  end
  object cdsCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCli'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 801
    Top = 376
    object cdsCliCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsCliNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsCliRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsCliFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsCliRAMAL: TStringField
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 5
    end
    object cdsCliTEL_RES_CF: TStringField
      FieldName = 'TEL_RES_CF'
      FixedChar = True
      Size = 14
    end
    object cdsCliFAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object cdsCliCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 10
    end
    object cdsCliEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object dsCli: TDataSource
    AutoEdit = False
    DataSet = cdsCli
    Left = 801
    Top = 424
  end
  object qrPergPesq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select p.*, g.descricao, g.categoria from flw_pergunta p'
      
        'inner join flw_grupo g on g.codgrupo = p.codgrupo and g.cod_empr' +
        'esa = p.cod_empresa'
      'where p.codpergunta = 0 and p.cod_empresa = 0')
    Left = 271
    Top = 280
  end
  object dspPergPesq: TDataSetProvider
    DataSet = qrPergPesq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 271
    Top = 328
  end
  object dsPergPesq: TDataSource
    AutoEdit = False
    Left = 271
    Top = 424
  end
  object cdsPergPesq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPergPesq'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 271
    Top = 376
    object cdsPergPesqCODPERGUNTA: TIntegerField
      FieldName = 'CODPERGUNTA'
      Required = True
    end
    object cdsPergPesqCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPergPesqCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object cdsPergPesqPERGUNTA: TStringField
      FieldName = 'PERGUNTA'
      Size = 256
    end
    object cdsPergPesqSIMNAONIVEL: TStringField
      DisplayWidth = 20
      FieldName = 'SIMNAONIVEL'
    end
    object cdsPergPesqCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 256
    end
    object cdsPergPesqATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsPergPesqDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsPergPesqCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 32
    end
  end
  object qrPergComplPesq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_perguntacomplemento'
      'where codpergcompl = 0 and cod_empresa = 0 and codpergunta = 0')
    Left = 359
    Top = 280
  end
  object dspPergComplPesq: TDataSetProvider
    DataSet = qrPergComplPesq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 359
    Top = 328
  end
  object dsPergComplPesq: TDataSource
    AutoEdit = False
    Left = 359
    Top = 424
  end
  object cdsPergComplPesq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPergCompl'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 359
    Top = 376
    object cdsPergComplPesqCODPERGCOMPL: TIntegerField
      FieldName = 'CODPERGCOMPL'
      Required = True
    end
    object cdsPergComplPesqCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPergComplPesqCODPERGUNTA: TIntegerField
      FieldName = 'CODPERGUNTA'
      Required = True
    end
    object cdsPergComplPesqALTERNATIVA: TStringField
      FieldName = 'ALTERNATIVA'
      Size = 128
    end
    object cdsPergComplPesqORDEM: TSmallintField
      FieldName = 'ORDEM'
    end
  end
  object qrGrupoPesq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_grupo where codgrupo = 0 and cod_empresa = 0')
    Left = 441
    Top = 280
  end
  object dspGrupoPesq: TDataSetProvider
    DataSet = qrGrupoPesq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 441
    Top = 328
  end
  object dsGrupoPesq: TDataSource
    AutoEdit = False
    Left = 441
    Top = 424
  end
  object cdsGrupoPesq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGrupoPesq'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 441
    Top = 376
    object cdsGrupoPesqCODGRUPO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODGRUPO'
      Required = True
    end
    object cdsGrupoPesqCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGrupoPesqDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsGrupoPesqCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 32
    end
    object cdsGrupoPesqATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesquisaCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select p.*, c1.nome_vendedor, c2.nome_vendedor nome_pesquisador,' +
        ' flw_perfil.descricao from flw_pesquisa p'
      
        'inner join flw_perfil on flw_perfil.codperfil = p.codperfil and ' +
        'flw_perfil.cod_empresa = p.cod_empresa'
      
        'left join colaborador c1 on c1.cod_vendedor = p.cod_vendedor and' +
        ' c1.cod_empresa = p.cod_empresa'
      
        'left join colaborador c2 on c2.cod_vendedor = p.codpesquisador a' +
        'nd c2.cod_empresa = p.cod_empresa'
      'where p.codpesquisa = 0 and p.cod_empresa = 0')
    Left = 797
    Top = 64
  end
  object dspPesquisaCons: TDataSetProvider
    DataSet = qrPesquisaCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 797
    Top = 112
  end
  object dsPesquisaCons: TDataSource
    AutoEdit = False
    DataSet = cdsPesquisaCons
    Left = 797
    Top = 208
  end
  object cdsPesquisaCons: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesquisaCons'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 797
    Top = 160
    object cdsPesquisaConsCODPESQUISA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODPESQUISA'
      Required = True
    end
    object cdsPesquisaConsCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPesquisaConsCODPERFIL: TIntegerField
      DisplayLabel = 'Cod Perfil'
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsPesquisaConsDESCRICAO: TStringField
      DisplayLabel = 'Perfil'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsPesquisaConsCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsPesquisaConsNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsPesquisaConsCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsPesquisaConsNOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsPesquisaConsCODPESQUISADOR: TIntegerField
      DisplayLabel = 'Cod Pesquisador'
      FieldName = 'CODPESQUISADOR'
    end
    object cdsPesquisaConsNOME_PESQUISADOR: TStringField
      DisplayLabel = 'Pesquisador'
      FieldName = 'NOME_PESQUISADOR'
      Size = 35
    end
    object cdsPesquisaConsDATAPESQUISA: TDateTimeField
      DisplayLabel = 'Data Pesquisa'
      FieldName = 'DATAPESQUISA'
    end
    object cdsPesquisaConsHORAPESQUISA: TStringField
      DisplayLabel = 'Hora Pesquisa'
      FieldName = 'HORAPESQUISA'
      Size = 5
    end
    object cdsPesquisaConsCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 32
    end
    object cdsPesquisaConsTIPO: TStringField
      DisplayLabel = 'Tipo (P/F)'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPesquisaConsCODATENDIMENTO: TIntegerField
      DisplayLabel = 'Cod Atendimento'
      FieldName = 'CODATENDIMENTO'
    end
    object cdsPesquisaConsNPED: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'NPED'
    end
    object cdsPesquisaConsTIPO_PED: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsPesquisaConsDATAFECHAMENTO: TDateTimeField
      DisplayLabel = 'Data Conclus'#227'o'
      FieldName = 'DATAFECHAMENTO'
    end
    object cdsPesquisaConsHORAFECHAMENTO: TStringField
      DisplayLabel = 'Hora Conclus'#227'o'
      FieldName = 'HORAFECHAMENTO'
      Size = 5
    end
    object cdsPesquisaConsSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object cdsPesquisaConsDADOS: TMemoField
      DisplayLabel = 'Informa'#231#245'es'
      FieldName = 'DADOS'
      OnGetText = cdsPesquisaConsDADOSGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPesquisaConsATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object qrFlwPerfil: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_perfil'
      'where codperfil = 0 and cod_empresa = 0')
    Left = 112
    Top = 64
  end
  object dspFlwPerfil: TDataSetProvider
    DataSet = qrFlwPerfil
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 112
    Top = 112
  end
  object cdsFlwPerfil: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFlwPerfil'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 112
    Top = 160
    object cdsFlwPerfilCODPERFIL: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsFlwPerfilCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFlwPerfilDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do Perfil'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsFlwPerfilTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsFlwPerfilATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsFlwPerfil: TDataSource
    AutoEdit = False
    DataSet = cdsFlwPerfil
    Left = 112
    Top = 208
  end
  object qrPerfPesq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from flw_perfil'
      'where codperfil = 0 and cod_empresa = 0')
    Left = 512
    Top = 280
  end
  object dspPerfPesq: TDataSetProvider
    DataSet = qrPerfPesq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 512
    Top = 328
  end
  object dsPerfPesq: TDataSource
    AutoEdit = False
    DataSet = cdsPerfPesq
    Left = 512
    Top = 424
  end
  object cdsPerfPesq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPerfPesq'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 512
    Top = 376
    object cdsPerfPesqCODPERFIL: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsPerfPesqCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerfPesqDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do Perfil'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsPerfPesqTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPerfPesqATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrImpPesq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 893
    Top = 64
  end
  object dspImpPesq: TDataSetProvider
    DataSet = qrImpPesq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 893
    Top = 112
  end
  object cdsImpPesq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspImpPesq'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 893
    Top = 160
    object cdsImpPesqTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsImpPesqCODIGO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsImpPesqCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Colab'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsImpPesqNOME_VENDEDOR: TStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsImpPesqCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsImpPesqNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsImpPesqDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsImpPesqCATEGORIA: TStringField
      DisplayLabel = 'Tipo OS/Tipo Vnd/Categ'
      FieldName = 'CATEGORIA'
      Size = 32
    end
    object cdsImpPesqOBS: TMemoField
      DisplayLabel = 'Atendimento / Obs'
      FieldName = 'OBS'
      OnGetText = cdsImpPesqOBSGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsImpPesqSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsImpPesqCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 32
    end
  end
  object qrItImpPesq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select 0 id, '#39'SERVICOS'#39' TIPO, ps.nitem nitem,  ps.desc_serv_ped ' +
        'descricao, ps.quant_serv_ped quantidade, ps.status,'
      
        '(select nome_vendedor from colaborador c1 where c1.cod_vendedor ' +
        '= ps.cod_vendedor and c1.cod_empresa = ps.cod_empresa) nome_vend' +
        'edor1,'
      
        '(select nome_vendedor from colaborador c2 where c2.cod_vendedor ' +
        '= ps.cod_vendedor1 and c2.cod_empresa = ps.cod_empresa) nome_ven' +
        'dedor2'
      'from pedvenda_serv ps'
      'where ps.nped =  0'
      'and ps.tipo =  '#39#39' and ps.cod_empresa =  0'
      'union'
      'select 1, '#39'SERV TERCEIROS'#39', 0,  pt.descr_servt, 1, '#39#39','
      #39'TERCEIROS'#39' nome_vendedor1,'
      #39'TERCEIROS'#39' nome_vendedor2'
      'from pedvenda_serv_terc pt'
      'where pt.nped =  0'
      'and pt.tipo =  '#39#39
      'and pt.cod_empresa = 0'
      'union'
      
        'select 2, '#39'PRODUTOS'#39', pp.nitem,  pp.descr_prod_ped, pp.quant_ped' +
        '_item, pp.status,'
      
        '(select nome_vendedor from colaborador c1 where c1.cod_vendedor ' +
        '= pp.cod_vendedor and c1.cod_empresa = pp.cod_empresa) nome_vend' +
        'edor1,'
      
        '(select nome_vendedor from colaborador c2 where c2.cod_vendedor ' +
        '= pp.col_cod_vendedor and c2.cod_empresa = pp.cod_empresa) nome_' +
        'vendedor2'
      'from pedvenda_prod pp'
      'where pp.nped = 0'
      'and pp.tipo = '#39#39' and pp.cod_empresa = 0'
      'order by 1,2')
    Left = 973
    Top = 64
  end
  object dspItImpPesq: TDataSetProvider
    DataSet = qrItImpPesq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 973
    Top = 112
  end
  object dsItImpPesq: TDataSource
    AutoEdit = False
    DataSet = cdsItImpPesq
    Left = 973
    Top = 208
  end
  object cdsItImpPesq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItImpPesq'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 973
    Top = 160
    object cdsItImpPesqID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object cdsItImpPesqTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 14
    end
    object cdsItImpPesqNITEM: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM'
    end
    object cdsItImpPesqDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsItImpPesqQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
    end
    object cdsItImpPesqSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItImpPesqNOME_VENDEDOR1: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR1'
      Size = 35
    end
    object cdsItImpPesqNOME_VENDEDOR2: TStringField
      DisplayLabel = 'Vendedor 2'
      FieldName = 'NOME_VENDEDOR2'
      Size = 35
    end
  end
  object qrAtdmHw: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select fa.*, a.codatendimentohwauto from anotacoes fa'
      
        'left join flw_atendimento a on a.codatendimentohwauto = fa.codig' +
        'o and a.cod_empresa = fa.cod_empresa'
      
        'where fa.cod_empresa = 1 and a.codatendimentohwauto is null and ' +
        'fa.codigo = 0')
    Left = 1053
    Top = 64
  end
  object dspAtdmHw: TDataSetProvider
    DataSet = qrAtdmHw
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1053
    Top = 112
  end
  object dsAtdmHw: TDataSource
    AutoEdit = False
    DataSet = cdsAtdmHw
    Left = 1053
    Top = 208
  end
  object cdsAtdmHw: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAtdmHw'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 1053
    Top = 160
    object cdsAtdmHwCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsAtdmHwTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 13
    end
    object cdsAtdmHwNOME_VENDEDOR: TStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsAtdmHwNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsAtdmHwASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      FieldName = 'ASSUNTO'
      Size = 60
    end
    object cdsAtdmHwCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 40
    end
    object cdsAtdmHwEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 30
    end
    object cdsAtdmHwFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      FixedChar = True
      Size = 13
    end
    object cdsAtdmHwDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsAtdmHwHORA: TStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      FixedChar = True
      Size = 8
    end
    object cdsAtdmHwOBSERVACAO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtdmHwSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 12
    end
    object cdsAtdmHwUS_STATUS: TIntegerField
      DisplayLabel = 'User Status'
      FieldName = 'US_STATUS'
    end
    object cdsAtdmHwTP_ATEND: TStringField
      DisplayLabel = 'Tipo Atend.'
      FieldName = 'TP_ATEND'
      FixedChar = True
      Size = 1
    end
    object cdsAtdmHwTP_CONTR: TStringField
      DisplayLabel = 'Com Contrato/Sem Contrato'
      FieldName = 'TP_CONTR'
      FixedChar = True
      Size = 1
    end
    object cdsAtdmHwHORA_INICIAL: TStringField
      DisplayLabel = 'Hora Inicial'
      FieldName = 'HORA_INICIAL'
      FixedChar = True
      Size = 8
    end
    object cdsAtdmHwHORA_FINAL: TStringField
      DisplayLabel = 'Hora Final'
      FieldName = 'HORA_FINAL'
      FixedChar = True
      Size = 8
    end
    object cdsAtdmHwDESCRICAO_TIPOANOT: TStringField
      DisplayLabel = 'Tipo Anot.'
      FieldName = 'DESCRICAO_TIPOANOT'
      Size = 60
    end
    object cdsAtdmHwCOD_TIPOANOT: TIntegerField
      DisplayLabel = 'Cod Tipo Anot'
      FieldName = 'COD_TIPOANOT'
    end
    object cdsAtdmHwCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsAtdmHwCODATENDIMENTOHWAUTO: TIntegerField
      FieldName = 'CODATENDIMENTOHWAUTO'
    end
    object cdsAtdmHwCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Colab'
      FieldName = 'COD_USUARIO'
    end
    object cdsAtdmHwCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsAtdmHwATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsAtdmHwSEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
  object qrGraficos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select g.codgrupo,p.codpergunta,p.simnaonivel,r.nivelresposta,'
      'count(r.codpesquisa) as QTDE from flw_resposta r'
      'inner join flw_pergunta p on p.codpergunta = r.codpergunta'
      'inner join flw_grupo g on g.codgrupo = p.codgrupo'
      
        'inner join flw_pesquisa pq on pq.codpesquisa = r.codpesquisa and' +
        ' pq.cod_empresa = r.cod_empresa'
      
        'where r.cod_empresa = :codempresa and pq.datafechamento >= :data' +
        'Ini and pq.datafechamento <= :dataFim'
      'group by g.codgrupo,p.codpergunta,p.simnaonivel,r.nivelresposta')
    Left = 960
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codempresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
        ParamType = ptUnknown
      end>
  end
  object dspGraficos: TDataSetProvider
    DataSet = qrGraficos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 960
    Top = 328
  end
  object cdsGraficos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGraficos'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 960
    Top = 376
  end
  object dsGraficos: TDataSource
    AutoEdit = False
    DataSet = cdsGraficos
    Left = 960
    Top = 424
  end
  object qrUtil: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      '')
    Left = 1048
    Top = 280
  end
  object dspUtil: TDataSetProvider
    DataSet = qrUtil
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1048
    Top = 328
  end
  object cdsUtil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUtil'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 1048
    Top = 376
  end
  object dsUtil: TDataSource
    AutoEdit = False
    DataSet = cdsUtil
    Left = 1048
    Top = 424
  end
  object IBQuery1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select setor.*, c.nome_vendedor from setor'
      
        'left join colaborador c on c.cod_vendedor = setor.cod_vendedor a' +
        'nd c.cod_empresa = setor.cod_empresa where setor.cod_setor = 0 a' +
        'nd setor.cod_empresa = 0')
    Left = 628
    Top = 256
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = IBQuery1
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 628
    Top = 304
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'DataSetProvider1'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 628
    Top = 352
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ClientDataSet1
    Left = 628
    Top = 400
  end
  object qrAnotacoes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select anotacoes.*, clientes.nome_cliente, clientes.razao, clien' +
        'tes.cpfcgc, col1.nome_vendedor colab_atend, col2.nome_vendedor c' +
        'olab_status from anotacoes'
      
        'left join clientes on clientes.cod_cliente = anotacoes.cod_clien' +
        'te and clientes.cod_empresa = anotacoes.cod_empresa'
      
        'left join colaborador col1 on col1.cod_vendedor = anotacoes.cod_' +
        'usuario and col1.cod_empresa = anotacoes.cod_empresa'
      
        'left join colaborador col2 on col2.cod_vendedor = anotacoes.us_s' +
        'tatus and col2.cod_empresa = anotacoes.cod_empresa'
      'where anotacoes.codigo = 0 and anotacoes.cod_empresa = 0')
    Left = 1133
    Top = 64
  end
  object dspAnotacoes: TDataSetProvider
    DataSet = qrAnotacoes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1133
    Top = 112
  end
  object dsAnotacoes: TDataSource
    AutoEdit = False
    DataSet = cdsAnotacoes
    Left = 1133
    Top = 208
  end
  object cdsAnotacoes: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAnotacoes'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 1133
    Top = 160
    object cdsAnotacoesCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsAnotacoesTIPO: TStringField
      DisplayLabel = 'Tipo Anotacao'
      FieldName = 'TIPO'
      Size = 13
    end
    object cdsAnotacoesDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsAnotacoesASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      FieldName = 'ASSUNTO'
      Size = 60
    end
    object cdsAnotacoesNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia Cliente'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object cdsAnotacoesCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 40
    end
    object cdsAnotacoesCOLAB_ATEND: TStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'COLAB_ATEND'
      Size = 35
    end
    object cdsAnotacoesSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 12
    end
    object cdsAnotacoesNOME_SOFT: TStringField
      DisplayLabel = 'Software'
      FieldName = 'NOME_SOFT'
      Size = 32
    end
    object cdsAnotacoesCOLAB_STATUS: TStringField
      DisplayLabel = 'Usuario Status'
      FieldName = 'COLAB_STATUS'
      Size = 35
    end
    object cdsAnotacoesHORA_INICIAL: TStringField
      DisplayLabel = 'Hora Inicial'
      FieldName = 'HORA_INICIAL'
      EditMask = '00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object cdsAnotacoesHORA_FINAL: TStringField
      DisplayLabel = 'Hora Final'
      FieldName = 'HORA_FINAL'
      EditMask = '00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object cdsAnotacoesRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsAnotacoesCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ Cliente'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsAnotacoesCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsAnotacoesCOD_USUARIO: TIntegerField
      DisplayLabel = 'Colaborador'
      FieldName = 'COD_USUARIO'
    end
    object cdsAnotacoesUS_STATUS: TIntegerField
      DisplayLabel = 'Cod Usuario Status'
      FieldName = 'US_STATUS'
    end
    object cdsAnotacoesCOD_TIPOANOT: TIntegerField
      DisplayLabel = 'Cod Tipo Anotacao'
      FieldName = 'COD_TIPOANOT'
    end
    object cdsAnotacoesEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 30
    end
    object cdsAnotacoesFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsAnotacoesHORA: TStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      FixedChar = True
      Size = 8
    end
    object cdsAnotacoesOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      OnGetText = cdsAnotacoesOBSERVACAOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsAnotacoesTP_ATEND: TStringField
      DisplayLabel = 'Atendimento'
      FieldName = 'TP_ATEND'
      FixedChar = True
      Size = 1
    end
    object cdsAnotacoesTP_CONTR: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'TP_CONTR'
      FixedChar = True
      Size = 1
    end
    object cdsAnotacoesTP_CONTR_D: TStringField
      Tag = 1
      DisplayLabel = 'Contrato'
      FieldKind = fkInternalCalc
      FieldName = 'TP_CONTR_D'
    end
    object cdsAnotacoesTP_ATEND_D: TStringField
      Tag = 1
      DisplayLabel = 'Atendimento'
      FieldKind = fkInternalCalc
      FieldName = 'TP_ATEND_D'
    end
    object cdsAnotacoesNOME_CL: TStringField
      Tag = 1
      DisplayLabel = 'Nome Cli'
      FieldKind = fkInternalCalc
      FieldName = 'NOME_CL'
      Size = 60
    end
    object cdsAnotacoesCODPESQUISA: TIntegerField
      DisplayLabel = 'Cod Pesquisa'
      FieldName = 'CODPESQUISA'
    end
    object cdsAnotacoesCOD_SOFT: TIntegerField
      DisplayLabel = 'Codigo Software'
      FieldName = 'COD_SOFT'
    end
    object cdsAnotacoesCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsAnotacoesATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrTipoAnot: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from TIPO_ANOTACOES_WEB'
      'where COD_TIPOANOT = 0')
    Left = 1221
    Top = 64
  end
  object dspTipoAnot: TDataSetProvider
    DataSet = qrTipoAnot
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1221
    Top = 112
  end
  object dstipoAnot: TDataSource
    AutoEdit = False
    DataSet = cdsTipoAnot
    Left = 1221
    Top = 208
  end
  object cdsTipoAnot: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTipoAnot'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 1221
    Top = 160
    object cdsTipoAnotCOD_TIPOANOT: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TIPOANOT'
      Required = True
    end
    object cdsTipoAnotDESCRICAO_TIPOANOT: TStringField
      DisplayLabel = 'Assunto'
      FieldName = 'DESCRICAO_TIPOANOT'
      Size = 60
    end
  end
  object qrTVReq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select tv.tipo tipo_vendas,  case when tv.tipo = '#39'REQ'#39' then tv.s' +
        'igla else tv.tipo_os end tipo,'
      'tv.descricao'
      'from tipo_vendas tv'
      'where ((tv.tipo = '#39'REQ'#39') or (tv.tipo = '#39'OS'#39'))'
      'order by 1,2,3')
    Left = 1285
    Top = 64
  end
  object dspTVReq: TDataSetProvider
    DataSet = qrTVReq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1285
    Top = 112
  end
  object dsTVReq: TDataSource
    AutoEdit = False
    DataSet = cdsTVReq
    Left = 1285
    Top = 208
  end
  object cdsTVReq: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTVReq'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 1285
    Top = 160
    object cdsTVReqTIPO_VENDAS: TStringField
      FieldName = 'TIPO_VENDAS'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsTVReqTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object cdsTVReqDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
  object qrTVOS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select tv.tipo tipo_vendas,  case when tv.tipo = '#39'REQ'#39' then tv.s' +
        'igla else tv.tipo_os end tipo,'
      'tv.descricao'
      'from tipo_vendas tv'
      'where ((tv.tipo = '#39'REQ'#39') or (tv.tipo = '#39'OS'#39'))'
      'order by 1,2,3')
    Left = 1349
    Top = 64
  end
  object dspTVOS: TDataSetProvider
    DataSet = qrTVOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1349
    Top = 112
  end
  object dsTVOS: TDataSource
    AutoEdit = False
    DataSet = cdsTVOS
    Left = 1349
    Top = 208
  end
  object cdsTVOS: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTVOS'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 1349
    Top = 160
    object cdsTVOSTIPO_VENDAS: TStringField
      FieldName = 'TIPO_VENDAS'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsTVOSTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object cdsTVOSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
  object qrSoft: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SOFTWARES_SUPORTE'
      'where COD_SOFT = 0 AND COD_EMPRESA = 0')
    Left = 1221
    Top = 272
  end
  object dspSoft: TDataSetProvider
    DataSet = qrSoft
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1221
    Top = 320
  end
  object dsSoft: TDataSource
    AutoEdit = False
    DataSet = cdsSoft
    Left = 1221
    Top = 416
  end
  object cdsSoft: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSoft'
    BeforeOpen = cdsFlwGrupoBeforeOpen
    Left = 1221
    Top = 368
    object cdsSoftCOD_SOFT: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_SOFT'
      Required = True
    end
    object cdsSoftCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSoftNOME_SOFT: TStringField
      DisplayLabel = 'Software'
      FieldName = 'NOME_SOFT'
      Size = 32
    end
  end
end
