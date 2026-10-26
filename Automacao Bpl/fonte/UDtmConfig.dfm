object dtmConfig: TdtmConfig
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 787
  Width = 2241
  object ibTransConfig: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 1
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    Left = 185
    Top = 1
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
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
  object qrMenus: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from MENUS_AUTO')
    Left = 32
    Top = 56
  end
  object dspMenus: TDataSetProvider
    DataSet = qrMenus
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 32
    Top = 104
  end
  object cdsMenus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMenus'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 32
    Top = 152
    object cdsMenusCOD_MENU: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo do Menu'
      FieldName = 'COD_MENU'
      Required = True
    end
    object cdsMenusCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsMenusDEPART_MENU: TStringField
      Tag = 2
      DisplayLabel = 'Departamento'
      FieldName = 'DEPART_MENU'
      Required = True
      Size = 40
    end
    object cdsMenusNOME_MENU: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME_MENU'
      Size = 50
    end
    object cdsMenusSTATUS_MENU: TStringField
      DisplayLabel = 'Vis'#237'vel/Invis'#237'vel'
      DisplayWidth = 1
      FieldName = 'STATUS_MENU'
      FixedChar = True
      Size = 1
    end
    object cdsMenusENABLE_MENU: TStringField
      DisplayLabel = 'Habilitado/Desabilitado'
      FieldName = 'ENABLE_MENU'
      FixedChar = True
      Size = 1
    end
    object cdsMenusDESC_MENU: TStringField
      DisplayLabel = 'Descri'#231#227'o do Menu'
      FieldName = 'DESC_MENU'
      Size = 100
    end
    object cdsMenusATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsMenusSEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
  object dsMenus: TDataSource
    DataSet = cdsMenus
    Left = 32
    Top = 200
  end
  object qrLayout: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    Left = 120
    Top = 56
  end
  object dspLayout: TDataSetProvider
    DataSet = qrLayout
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 120
    Top = 104
  end
  object cdsLayout: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLayout'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 120
    Top = 152
  end
  object dsLayout: TDataSource
    DataSet = cdsLayout
    Left = 120
    Top = 200
  end
  object qrTermConf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from TERMINALF')
    Left = 200
    Top = 56
  end
  object dspTermConf: TDataSetProvider
    DataSet = qrTermConf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 200
    Top = 104
  end
  object cdsTerminalConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTermConf'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 200
    Top = 152
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
    Left = 200
    Top = 200
  end
  object qrErP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from ERP')
    Left = 296
    Top = 64
  end
  object dspERP: TDataSetProvider
    DataSet = qrErP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 296
    Top = 112
  end
  object cdsERP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspERP'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 296
    Top = 160
    object cdsERPCOD_APLICATIVO: TIntegerField
      DisplayLabel = 'C'#243'digo Aplicativo'
      FieldName = 'COD_APLICATIVO'
      Required = True
    end
    object cdsERPNOME_APLICATIVO: TStringField
      DisplayLabel = 'Sistema'
      FieldName = 'NOME_APLICATIVO'
      Size = 64
    end
    object cdsERPCOD_SOFTWARE: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'COD_SOFTWARE'
    end
  end
  object dsERP: TDataSource
    DataSet = cdsERP
    Left = 296
    Top = 208
  end
  object qrMnSis: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from MENUS_AUTO_SISTEMA')
    Left = 376
    Top = 64
  end
  object dspMnSis: TDataSetProvider
    DataSet = qrMnSis
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 376
    Top = 112
  end
  object cdsMnSis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMnSis'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 376
    Top = 160
    object cdsMnSisCOD_APLICATIVO: TIntegerField
      DisplayLabel = 'Cod Aplicativo'
      FieldName = 'COD_APLICATIVO'
      Required = True
    end
    object cdsMnSisSTATUS_MENU: TStringField
      DisplayLabel = 'V/I'
      FieldName = 'STATUS_MENU'
      FixedChar = True
      Size = 1
    end
    object cdsMnSisENABLE_MENU: TStringField
      DisplayLabel = 'H/D'
      FieldName = 'ENABLE_MENU'
      FixedChar = True
      Size = 1
    end
    object cdsMnSisDESC_MENU: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_MENU'
      Size = 100
    end
    object cdsMnSisNOME_MENU: TStringField
      DisplayLabel = 'Componente'
      FieldName = 'NOME_MENU'
      Size = 50
    end
    object cdsMnSisATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsMnSisNIVEL_MENU: TSmallintField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL_MENU'
    end
  end
  object dsMnSis: TDataSource
    DataSet = cdsMnSis
    Left = 376
    Top = 208
  end
  object cdsMenusAtuais: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsMenusBeforeOpen
    Left = 448
    Top = 160
    object cdsMenusAtuaisnome_menu: TStringField
      DisplayLabel = 'Componente'
      DisplayWidth = 44
      FieldName = 'nome_menu'
      Size = 50
    end
    object cdsMenusAtuaisdesc_menu: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 120
      FieldName = 'desc_menu'
      Size = 100
    end
    object cdsMenusAtuaiscod_aplicativo: TIntegerField
      FieldName = 'cod_aplicativo'
    end
    object cdsMenusAtuaisaplicativos: TStringField
      FieldName = 'aplicativos'
      Size = 10
    end
  end
  object dsMenusAtuais: TDataSource
    AutoEdit = False
    DataSet = cdsMenusAtuais
    Left = 448
    Top = 208
  end
  object dsProcessos: TDataSource
    DataSet = cdsProcessos
    Left = 200
    Top = 504
  end
  object cdsProcessos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcessos'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 200
    Top = 448
    object cdsProcessosSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsProcessosCOD_PROCESSO: TStringField
      Tag = 2
      DisplayLabel = 'Cod Processo'
      FieldName = 'COD_PROCESSO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsProcessosCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProcessosNOME_PROCESSO: TStringField
      DisplayLabel = 'Nome Processo'
      FieldName = 'NOME_PROCESSO'
      Size = 50
    end
    object cdsProcessosNIVEL_PROCESSO: TIntegerField
      DisplayLabel = 'Nivel Processo'
      FieldName = 'NIVEL_PROCESSO'
      Required = True
    end
    object cdsProcessosSENHA_GERENTE: TStringField
      DisplayLabel = 'Senha Gerente'
      FieldName = 'SENHA_GERENTE'
      FixedChar = True
      Size = 1
    end
    object cdsProcessosFORM: TStringField
      DisplayLabel = 'Formulario'
      FieldName = 'FORM'
      Size = 30
    end
    object cdsProcessosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dspProcessos: TDataSetProvider
    DataSet = qrProcessos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 200
    Top = 400
  end
  object qrProcessos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProcessos
    SQL.Strings = (
      'select *  from TABELA_PROCESSOS')
    Left = 200
    Top = 344
  end
  object IBTransProcessos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 96
    Top = 272
  end
  object dsExececao: TDataSource
    DataSet = cdsExecao
    Left = 272
    Top = 504
  end
  object dspExcecao: TDataSetProvider
    DataSet = qrExcecao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 272
    Top = 400
  end
  object qrExcecao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProcessos
    SQL.Strings = (
      'select *  from TABELA_PROCESSOS_USUARIOS')
    Left = 272
    Top = 344
  end
  object cdsExecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExcecao'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 272
    Top = 448
    object cdsExecaoCOD_PROCESSO: TStringField
      DisplayLabel = 'C'#243'digo do Processo'
      FieldName = 'COD_PROCESSO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsExecaoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsExecaoUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsExecaoUSUARIO_AUTORIZOU: TStringField
      DisplayLabel = 'Usu'#225'rio que Autorizou'
      FieldName = 'USUARIO_AUTORIZOU'
      FixedChar = True
      Size = 10
    end
    object cdsExecaoDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autoriza'#231#227'o'
      FieldName = 'DATA_AUTORIZACAO'
    end
  end
  object qrUsuario: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProcessos
    SQL.Strings = (
      'select s.usuario,col.nome_vendedor from senhas s'
      
        'inner join colaborador col on col.cod_vendedor = s.codigo and co' +
        'l.cod_empresa = s.cod_empresa')
    Left = 336
    Top = 344
    object qrUsuarioUSUARIO: TIBStringField
      DisplayLabel = 'Usu'#225'rio\Login'
      FieldName = 'USUARIO'
      Origin = '"SENHAS"."USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object qrUsuarioNOME_VENDEDOR: TIBStringField
      DisplayLabel = 'Nome do Usu'#225'rio'
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsUsuario: TDataSource
    DataSet = qrUsuario
    Left = 336
    Top = 400
  end
  object qrBuscasP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProcessos
    Left = 185
    Top = 281
  end
  object IbBairrosCidades: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    Left = 448
    Top = 288
  end
  object CdsBairrosCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBairrosCidades'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 448
    Top = 392
  end
  object DspBairrosCidades: TDataSetProvider
    DataSet = IbBairrosCidades
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 448
    Top = 336
  end
  object qrBuscasGenerator: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    Left = 297
    Top = 1
  end
  object qrwsEmpresas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT EMP.COD_EMPRESA, EMP.IDENTIFICACAO_EMP,'
      
        '1 COD_SCHEMA, 1 CODSCHEMA, '#39'M'#39' SCHEMA_REPLICACAO  FROM EMPRESA E' +
        'MP WHERE EMP.ATIVO = 1'
      'ORDER BY EMP.COD_EMPRESA')
    Left = 880
    Top = 312
  end
  object dspwsEmpresas: TDataSetProvider
    DataSet = qrwsEmpresas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 880
    Top = 360
  end
  object cdswsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsEmpresas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 880
    Top = 408
    object cdswsEmpresasSEL: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Visible = False
      Size = 1
    end
    object cdswsEmpresasCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdswsEmpresasIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Identificacao'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdswsEmpresasCOD_SCHEMA: TIntegerField
      FieldName = 'COD_SCHEMA'
    end
    object cdswsEmpresasCODSCHEMA: TIntegerField
      FieldName = 'CODSCHEMA'
    end
    object cdswsEmpresasSCHEMA_REPLICACAO: TStringField
      FieldName = 'SCHEMA_REPLICACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dswsEmpresas: TDataSource
    AutoEdit = False
    DataSet = cdswsEmpresas
    Left = 880
    Top = 456
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT COD_EMPRESA, IDENTIFICACAO_EMP FROM EMPRESA WHERE COD_EMP' +
        'RESA = 0')
    Left = 536
    Top = 360
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 536
    Top = 408
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 536
    Top = 456
    object cdsEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaIDENTIFICACAO_EMP: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dsEmpresa: TDataSource
    AutoEdit = False
    DataSet = cdsEmpresa
    Left = 536
    Top = 504
  end
  object qrwsTabelas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT COD_EMPRESA, NOME_TAB, RECEBER, ENVIAR, INSERIR, ALTERAR,' +
        ' DELETAR, BUFFER, COD_SCHEMA, S_EMP_FIS, '#39'N'#39' RESTRICAO FROM WSR_' +
        'TABELAS'
      'WHERE ATIVO = 0')
    Left = 976
    Top = 312
  end
  object dspwsTabelas: TDataSetProvider
    DataSet = qrwsTabelas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 976
    Top = 360
  end
  object cdswsTabelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsTabelas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 976
    Top = 408
    object cdswsTabelasSEL: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Visible = False
      Size = 1
    end
    object cdswsTabelasCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdswsTabelasNOME_TAB: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'NOME_TAB'
      Required = True
      Size = 31
    end
    object cdswsTabelasRECEBER: TStringField
      DisplayLabel = 'Receber'
      FieldName = 'RECEBER'
      FixedChar = True
      Size = 1
    end
    object cdswsTabelasENVIAR: TStringField
      DisplayLabel = 'Enviar'
      FieldName = 'ENVIAR'
      FixedChar = True
      Size = 1
    end
    object cdswsTabelasINSERIR: TStringField
      DisplayLabel = 'Inserir'
      FieldName = 'INSERIR'
      FixedChar = True
      Size = 1
    end
    object cdswsTabelasALTERAR: TStringField
      DisplayLabel = 'Alterar'
      FieldName = 'ALTERAR'
      FixedChar = True
      Size = 1
    end
    object cdswsTabelasDELETAR: TStringField
      DisplayLabel = 'Deletar'
      FieldName = 'DELETAR'
      FixedChar = True
      Size = 1
    end
    object cdswsTabelasBUFFER: TIntegerField
      DisplayLabel = 'Buffer'
      FieldName = 'BUFFER'
    end
    object cdswsTabelasCOD_SCHEMA: TIntegerField
      Tag = 1
      FieldName = 'COD_SCHEMA'
      Visible = False
    end
    object cdswsTabelasS_EMP_FIS: TStringField
      DisplayLabel = 'Emp Fis'
      FieldName = 'S_EMP_FIS'
      FixedChar = True
      Size = 1
    end
    object cdswsTabelasRESTRICAO: TStringField
      FieldName = 'RESTRICAO'
      FixedChar = True
      Size = 1
    end
  end
  object dswsTabelas: TDataSource
    AutoEdit = False
    DataSet = cdswsTabelas
    Left = 976
    Top = 456
  end
  object IBDatabaseLog: TIBDatabase
    DatabaseName = '192.168.254.45:C:\inetpub\wwwroot\replicador\bin\LOG.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = ibTransLog
    Left = 1268
    Top = 3
  end
  object qrBuscasUnificada: TIBQuery
    Transaction = IBTransactionUnificada
    SQL.Strings = (
      
        'select distinct cf.natop_v CFOP, nat.descricao_nop DESCRICAO, na' +
        't.tipv_veiculo TIPV, '#39'CFT'#39' TIPO from com_fat cf  inner join nat_' +
        'op nat on nat.codigo_nop = cf.natop_v  where cf.cod_empresa = 1 ' +
        'union  select distinct nfi.codigo_nop CFOP, nat.descricao_nop DE' +
        'SCRICAO, nat.tipv_veiculo TIPV, '#39'NF'#39' TIPO from notafiscal_item n' +
        'fi  inner join nat_op nat on nat.codigo_nop = nfi.codigo_nop  wh' +
        'ere nfi.tipo_item = '#39'V'#39' and nfi.cod_empresa = 1 order by 1, 4')
    Left = 1376
    Top = 99
    object qrBuscasUnificadaCFOP: TFloatField
      FieldName = 'CFOP'
      Origin = '"COM_FAT"."NATOP_V"'
    end
    object qrBuscasUnificadaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"NAT_OP"."DESCRICAO_NOP"'
      Size = 100
    end
    object qrBuscasUnificadaTIPV: TIBStringField
      FieldName = 'TIPV'
      Origin = '"NAT_OP"."TIPV_VEICULO"'
      FixedChar = True
      Size = 1
    end
    object qrBuscasUnificadaTIPO: TIBStringField
      FieldName = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
  end
  object IBTransactionUnificada: TIBTransaction
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 1376
    Top = 163
  end
  object qrLog: TIBQuery
    Database = IBDatabaseLog
    Transaction = ibTransLog
    SQL.Strings = (
      'select * from Log')
    Left = 1288
    Top = 56
  end
  object ibTransLog: TIBTransaction
    DefaultDatabase = IBDatabaseLog
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 1288
    Top = 216
  end
  object dspLog: TDataSetProvider
    DataSet = qrLog
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1288
    Top = 112
  end
  object cdsLog: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLog'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1288
    Top = 160
    object cdsLogID: TLargeintField
      FieldName = 'ID'
      Required = True
    end
    object cdsLogLOG: TStringField
      FieldName = 'LOG'
      Size = 800
    end
    object cdsLogDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsLogATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrwsSchema: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT * FROM WSR_SCHEMAS WHERE COD_EMPRESA = 0')
    Left = 792
    Top = 312
  end
  object dspwsSchema: TDataSetProvider
    DataSet = qrwsSchema
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 792
    Top = 360
  end
  object cdswsSchema: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsSchema'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 792
    Top = 408
    object cdswsSchemaCOD_SCHEMA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_SCHEMA'
      Required = True
    end
    object cdswsSchemaIDENTIFICACAO: TStringField
      DisplayLabel = 'Identifica'#231#227'o'
      FieldName = 'IDENTIFICACAO'
      Size = 30
    end
    object cdswsSchemaTOKEN: TStringField
      DisplayLabel = 'Token'
      FieldName = 'TOKEN'
      Size = 128
    end
    object cdswsSchemaSCHEMA_REPLICACAO: TStringField
      DisplayLabel = 'Schema'
      FieldName = 'SCHEMA_REPLICACAO'
      FixedChar = True
      Size = 1
    end
    object cdswsSchemaATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdswsSchemaCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdswsSchemaCOD_SCHEMA_ESP: TIntegerField
      DisplayLabel = 'Cod Schema Base'
      FieldName = 'COD_SCHEMA_ESP'
    end
    object cdswsSchemaMATRIZ_FILIAL: TStringField
      DisplayLabel = 'Matriz e Filial'
      FieldName = 'MATRIZ_FILIAL'
      FixedChar = True
      Size = 1
    end
  end
  object dswsSchema: TDataSource
    AutoEdit = False
    DataSet = cdswsSchema
    Left = 792
    Top = 456
  end
  object qrwsCampos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT RRF.RDB$RELATION_NAME NOME_TAB, (RRF.RDB$FIELD_NAME) AS C' +
        'AMPO, TRIM(RT.RDB$TYPE_NAME) TIPO,'
      '1 COD_EMPRESA, 1 COD_SCHEMA,'
      'CASE WHEN (WC.ATIVO IS NULL) THEN 0 ELSE 1 END ATIVO,'
      
        '(SELECT DISTINCT CASE WHEN (RDB$RELATION_CONSTRAINTS.RDB$CONSTRA' +
        'INT_TYPE = '#39'PRIMARY KEY'#39') THEN '#39'S'#39' ELSE '#39'N'#39' END PK  FROM RDB$IND' +
        'ICES'
      
        'INNER JOIN RDB$RELATION_CONSTRAINTS ON RDB$RELATION_CONSTRAINTS.' +
        'RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$INDEX_SEGMENTS ON RDB$INDEX_SEGMENTS.RDB$INDEX_NA' +
        'ME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$RELATION_FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_' +
        'NAME = RDB$INDEX_SEGMENTS.RDB$FIELD_NAME'
      
        'WHERE (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = '#39'PRIMARY K' +
        'EY'#39')'
      'AND RDB$INDICES.RDB$RELATION_NAME = RRF.RDB$RELATION_NAME'
      
        'AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = TRIM(RRF.RDB$FIELD_NAME' +
        ')),'
      ''
      
        '(SELECT DISTINCT CASE WHEN (RDB$RELATION_CONSTRAINTS.RDB$CONSTRA' +
        'INT_TYPE = '#39'FOREIGN KEY'#39') THEN '#39'S'#39' ELSE '#39'N'#39' END FK  FROM RDB$IND' +
        'ICES'
      
        'INNER JOIN RDB$RELATION_CONSTRAINTS ON RDB$RELATION_CONSTRAINTS.' +
        'RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$INDEX_SEGMENTS ON RDB$INDEX_SEGMENTS.RDB$INDEX_NA' +
        'ME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$RELATION_FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_' +
        'NAME = RDB$INDEX_SEGMENTS.RDB$FIELD_NAME'
      
        'WHERE (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = '#39'FOREIGN K' +
        'EY'#39')'
      'AND RDB$INDICES.RDB$RELATION_NAME = RRF.RDB$RELATION_NAME'
      
        'AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = TRIM(RRF.RDB$FIELD_NAME' +
        '))'
      ''
      'FROM RDB$RELATION_FIELDS RRF'
      
        'INNER JOIN RDB$FIELDS RF ON RF.RDB$FIELD_NAME = RRF.RDB$FIELD_SO' +
        'URCE'
      
        'INNER JOIN RDB$TYPES RT ON RT.RDB$TYPE = RF.RDB$FIELD_TYPE AND R' +
        'T.RDB$FIELD_NAME = '#39'RDB$FIELD_TYPE'#39
      
        'LEFT JOIN WSR_CAMPOS WC ON WC.NOME_TAB = RRF.RDB$RELATION_NAME A' +
        'ND WC.CAMPO = (RRF.RDB$FIELD_NAME)  AND WC.COD_SCHEMA = 1 AND WC' +
        '.COD_EMPRESA = 1 AND ATIVO = 0'
      'WHERE TRIM(RRF.RDB$RELATION_NAME) = '#39'SETOR'#39
      'AND NOT(RT.RDB$TYPE_NAME = '#39'BLOB'#39' AND RF.RDB$FIELD_SUB_TYPE = 2)'
      
        'AND TRIM(RRF.RDB$FIELD_NAME) <> '#39'SEQID_WS'#39' AND TRIM(RRF.RDB$FIEL' +
        'D_NAME) <> '#39'DATA_HORA_ALT_WS'#39
      'AND TRIM(RRF.RDB$FIELD_NAME) <> '#39'EMP_ALT_WS'#39
      'ORDER BY RRF.RDB$FIELD_POSITION'
      '')
    Left = 1064
    Top = 312
  end
  object dspwsCampos: TDataSetProvider
    DataSet = qrwsCampos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1064
    Top = 360
  end
  object cdswsCampos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsCampos'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1064
    Top = 408
    object cdswsCamposSEL: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Visible = False
      Size = 1
    end
    object cdswsCamposCAMPO: TStringField
      FieldName = 'CAMPO'
      Required = True
      Size = 31
    end
    object cdswsCamposPK: TStringField
      FieldName = 'PK'
      FixedChar = True
      Size = 1
    end
    object cdswsCamposTIPO: TStringField
      FieldName = 'TIPO'
      Size = 93
    end
    object cdswsCamposFK: TStringField
      FieldName = 'FK'
      FixedChar = True
      Size = 1
    end
    object cdswsCamposNOME_TAB: TStringField
      Tag = 1
      FieldName = 'NOME_TAB'
      Required = True
      Visible = False
      Size = 31
    end
    object cdswsCamposCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdswsCamposCOD_SCHEMA: TIntegerField
      Tag = 1
      FieldName = 'COD_SCHEMA'
      Required = True
      Visible = False
    end
    object cdswsCamposATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dswsCampos: TDataSource
    AutoEdit = False
    DataSet = cdswsCampos
    Left = 1064
    Top = 456
  end
  object qrTabelas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT NOME_TAB, COD_SCHEMA, COD_EMPRESA, ATIVO FROM WSREPLICACA' +
        'O_TABELAS'
      'WHERE COD_SCHEMA = 0 AND COD_EMPRESA = 0 AND ATIVO = 0')
    Left = 920
    Top = 56
  end
  object dspTabelas: TDataSetProvider
    DataSet = qrTabelas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 920
    Top = 104
  end
  object cdsTabelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabelas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 920
    Top = 152
    object cdsTabelasNOME_TAB: TStringField
      FieldName = 'NOME_TAB'
      Required = True
      Size = 31
    end
    object cdsTabelasCOD_SCHEMA: TIntegerField
      FieldName = 'COD_SCHEMA'
      Required = True
    end
    object cdsTabelasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTabelasATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsTabelas: TDataSource
    AutoEdit = False
    DataSet = cdsTabelas
    Left = 920
    Top = 208
  end
  object qrwsCadastrosBas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT * FROM WSREPLICACAO_CADASTROSBASICOS')
    Left = 1016
    Top = 56
  end
  object dspwsCadastrosBas: TDataSetProvider
    DataSet = qrwsCadastrosBas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1016
    Top = 112
  end
  object cdswsCadastrosBas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsCadastrosBas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1016
    Top = 160
    object cdswsCadastrosBasTABELA: TStringField
      FieldName = 'TABELA'
      Required = True
      FixedChar = True
      Size = 31
    end
    object cdswsCadastrosBasCAMPOS_CHAVE: TStringField
      FieldName = 'CAMPOS_CHAVE'
      Required = True
      Size = 256
    end
    object cdswsCadastrosBasCAMPOS_PESQUISA: TStringField
      FieldName = 'CAMPOS_PESQUISA'
      Required = True
      Size = 256
    end
    object cdswsCadastrosBasATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dswsCadastrosBas: TDataSource
    AutoEdit = False
    DataSet = cdswsCadastrosBas
    Left = 1016
    Top = 208
  end
  object qrswsDependencia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT * FROM WSREPLICACAO_DEPENDENCIAS')
    Left = 1120
    Top = 56
  end
  object dspwsDependencia: TDataSetProvider
    DataSet = qrswsDependencia
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1120
    Top = 112
  end
  object cdswsDependencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsDependencia'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1120
    Top = 160
    object cdswsDependenciaTABELA: TStringField
      FieldName = 'TABELA'
      Required = True
      FixedChar = True
      Size = 31
    end
    object cdswsDependenciaTABELA2: TStringField
      FieldName = 'TABELA2'
      Required = True
      FixedChar = True
      Size = 31
    end
    object cdswsDependenciaCAMPO_CODIGO: TStringField
      FieldName = 'CAMPO_CODIGO'
      Required = True
      FixedChar = True
      Size = 31
    end
    object cdswsDependenciaCAMPO_CODIGO2: TStringField
      FieldName = 'CAMPO_CODIGO2'
      Required = True
      FixedChar = True
      Size = 31
    end
    object cdswsDependenciaCAMPO_DESCRICAO: TStringField
      FieldName = 'CAMPO_DESCRICAO'
      Required = True
      FixedChar = True
      Size = 31
    end
    object cdswsDependenciaCAMPO_DESCRICAO2: TStringField
      FieldName = 'CAMPO_DESCRICAO2'
      Required = True
      FixedChar = True
      Size = 31
    end
    object cdswsDependenciaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dswsDependencia: TDataSource
    AutoEdit = False
    DataSet = cdswsDependencia
    Left = 1120
    Top = 208
  end
  object qrwsConsultas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT  WSR_CONSULTAS.*, EMPRESA.IDENTIFICACAO_EMP, WSR_SCHEMAS.' +
        'IDENTIFICACAO, WSR_SCHEMAS.TOKEN FROM WSR_CONSULTAS'
      
        'LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = WSR_CONSULTAS.COD_EMP' +
        'RESA '
      
        'LEFT JOIN WSR_SCHEMAS ON WSR_SCHEMAS.COD_SCHEMA = WSR_CONSULTAS.' +
        'COD_SCHEMA'
      'WHERE WSR_CONSULTAS.ATIVO = 0')
    Left = 1216
    Top = 56
  end
  object dspwsConsultas: TDataSetProvider
    DataSet = qrwsConsultas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1216
    Top = 112
  end
  object cdswsConsultas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsConsultas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1216
    Top = 160
    object cdswsConsultasENVREC: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'ENVREC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdswsConsultasTABELA: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      Required = True
      Size = 31
    end
    object cdswsConsultasIDENTIFICACAO: TStringField
      DisplayLabel = 'Schema'
      FieldName = 'IDENTIFICACAO'
      Size = 30
    end
    object cdswsConsultasCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdswsConsultasDATA_HORA_CONSULTA: TDateTimeField
      DisplayLabel = 'Consulta'
      FieldName = 'DATA_HORA_CONSULTA'
    end
    object cdswsConsultasDATA_HORA_SUCESSO: TDateTimeField
      DisplayLabel = 'Sucesso'
      FieldName = 'DATA_HORA_SUCESSO'
    end
    object cdswsConsultasDATA_HORA_FALHA: TDateTimeField
      DisplayLabel = 'Falha'
      FieldName = 'DATA_HORA_FALHA'
    end
    object cdswsConsultasQTDE_PEND: TIntegerField
      DisplayLabel = 'Pendentes'
      FieldName = 'QTDE_PEND'
    end
    object cdswsConsultasQTDE_ENVREC: TIntegerField
      DisplayLabel = 'Enviados'
      FieldName = 'QTDE_ENVREC'
    end
    object cdswsConsultasSTATUS_FALHA: TStringField
      DisplayLabel = 'Status Falha'
      FieldName = 'STATUS_FALHA'
      Size = 255
    end
    object cdswsConsultasBUFFER: TIntegerField
      DisplayLabel = 'Buffer'
      FieldName = 'BUFFER'
    end
    object cdswsConsultasSEQID: TLargeintField
      Tag = 1
      FieldName = 'SEQID'
      Visible = False
    end
    object cdswsConsultasCOD_SCHEMA: TIntegerField
      DisplayLabel = 'Cod Schema'
      FieldName = 'COD_SCHEMA'
      Required = True
    end
    object cdswsConsultasIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdswsConsultasTOKEN: TStringField
      DisplayLabel = 'Token'
      FieldName = 'TOKEN'
      Size = 128
    end
    object cdswsConsultasORDEM: TIntegerField
      Tag = 1
      FieldName = 'ORDEM'
      Visible = False
    end
    object cdswsConsultasATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dswsConsultas: TDataSource
    AutoEdit = False
    DataSet = cdswsConsultas
    Left = 1216
    Top = 208
  end
  object qrwsReplicacoes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT RRF.RDB$RELATION_NAME NOME_TAB, (RRF.RDB$FIELD_NAME) AS C' +
        'AMPO, TRIM(RT.RDB$TYPE_NAME) TIPO,'
      '1 COD_EMPRESA, 1 COD_SCHEMA,'
      'CASE WHEN (WC.ATIVO IS NULL) THEN 0 ELSE 1 END ATIVO,'
      
        '(SELECT DISTINCT CASE WHEN (RDB$RELATION_CONSTRAINTS.RDB$CONSTRA' +
        'INT_TYPE = '#39'PRIMARY KEY'#39') THEN '#39'S'#39' ELSE '#39'N'#39' END PK  FROM RDB$IND' +
        'ICES'
      
        'INNER JOIN RDB$RELATION_CONSTRAINTS ON RDB$RELATION_CONSTRAINTS.' +
        'RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$INDEX_SEGMENTS ON RDB$INDEX_SEGMENTS.RDB$INDEX_NA' +
        'ME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$RELATION_FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_' +
        'NAME = RDB$INDEX_SEGMENTS.RDB$FIELD_NAME'
      
        'WHERE (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = '#39'PRIMARY K' +
        'EY'#39')'
      'AND RDB$INDICES.RDB$RELATION_NAME = RRF.RDB$RELATION_NAME'
      
        'AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = TRIM(RRF.RDB$FIELD_NAME' +
        ')),'
      ''
      
        '(SELECT DISTINCT CASE WHEN (RDB$RELATION_CONSTRAINTS.RDB$CONSTRA' +
        'INT_TYPE = '#39'FOREIGN KEY'#39') THEN '#39'S'#39' ELSE '#39'N'#39' END FK  FROM RDB$IND' +
        'ICES'
      
        'INNER JOIN RDB$RELATION_CONSTRAINTS ON RDB$RELATION_CONSTRAINTS.' +
        'RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$INDEX_SEGMENTS ON RDB$INDEX_SEGMENTS.RDB$INDEX_NA' +
        'ME = RDB$INDICES.RDB$INDEX_NAME'
      
        'INNER JOIN RDB$RELATION_FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_' +
        'NAME = RDB$INDEX_SEGMENTS.RDB$FIELD_NAME'
      
        'WHERE (RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = '#39'FOREIGN K' +
        'EY'#39')'
      'AND RDB$INDICES.RDB$RELATION_NAME = RRF.RDB$RELATION_NAME'
      
        'AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = TRIM(RRF.RDB$FIELD_NAME' +
        '))'
      ''
      'FROM RDB$RELATION_FIELDS RRF'
      
        'INNER JOIN RDB$FIELDS RF ON RF.RDB$FIELD_NAME = RRF.RDB$FIELD_SO' +
        'URCE'
      
        'INNER JOIN RDB$TYPES RT ON RT.RDB$TYPE = RF.RDB$FIELD_TYPE AND R' +
        'T.RDB$FIELD_NAME = '#39'RDB$FIELD_TYPE'#39
      
        'LEFT JOIN WSR_CAMPOS WC ON WC.NOME_TAB = RRF.RDB$RELATION_NAME A' +
        'ND WC.CAMPO = (RRF.RDB$FIELD_NAME)  AND WC.COD_SCHEMA = 1 AND WC' +
        '.COD_EMPRESA = 1 AND ATIVO = 0'
      'WHERE TRIM(RRF.RDB$RELATION_NAME) = '#39'SETOR'#39
      'AND NOT(RT.RDB$TYPE_NAME = '#39'BLOB'#39' AND RF.RDB$FIELD_SUB_TYPE = 2)'
      
        'AND TRIM(RRF.RDB$FIELD_NAME) <> '#39'SEQID_WS'#39' AND TRIM(RRF.RDB$FIEL' +
        'D_NAME) <> '#39'DATA_HORA_ALT_WS'#39
      'AND TRIM(RRF.RDB$FIELD_NAME) <> '#39'EMP_ALT_WS'#39
      'ORDER BY RRF.RDB$FIELD_POSITION'
      '')
    Left = 1176
    Top = 312
  end
  object dspwsReplicacoes: TDataSetProvider
    DataSet = qrwsReplicacoes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1176
    Top = 360
  end
  object cdswsReplicacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsReplicacoes'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1176
    Top = 408
    object StringField1: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Visible = False
      Size = 1
    end
    object StringField2: TStringField
      FieldName = 'CAMPO'
      Required = True
      Size = 31
    end
    object StringField3: TStringField
      FieldName = 'PK'
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'TIPO'
      Size = 93
    end
    object StringField5: TStringField
      FieldName = 'FK'
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      Tag = 1
      FieldName = 'NOME_TAB'
      Required = True
      Visible = False
      Size = 31
    end
    object IntegerField1: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object IntegerField2: TIntegerField
      Tag = 1
      FieldName = 'COD_SCHEMA'
      Required = True
      Visible = False
    end
    object IntegerField3: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dswsReplicacoes: TDataSource
    AutoEdit = False
    DataSet = cdswsReplicacoes
    Left = 1176
    Top = 456
  end
  object qrwsScript: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT * FROM WSR_SCRIPTS')
    Left = 1268
    Top = 304
  end
  object dspwsScript: TDataSetProvider
    DataSet = qrwsScript
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1268
    Top = 352
  end
  object cdswsScript: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspwsScript'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1268
    Top = 400
    object cdswsScriptCOD_SCRIPT: TIntegerField
      DisplayLabel = 'Cod Script'
      FieldName = 'COD_SCRIPT'
      Required = True
    end
    object cdswsScriptTIPO: TStringField
      Tag = 1
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdswsScriptTOKEN: TStringField
      DisplayLabel = 'Destino'
      FieldName = 'TOKEN'
      Required = True
      Size = 128
    end
    object cdswsScriptUSER_BANCO: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'USER_BANCO'
      Required = True
      Size = 6
    end
    object cdswsScriptTABELA: TStringField
      Tag = 1
      FieldName = 'TABELA'
      Visible = False
      Size = 31
    end
    object cdswsScriptSQL: TMemoField
      FieldName = 'SQL'
      OnGetText = cdswsScriptSQLGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdswsScriptSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object cdswsScriptATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdswsScriptENVREC: TStringField
      FieldName = 'ENVREC'
      FixedChar = True
      Size = 1
    end
    object cdswsScriptCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdswsScriptCOD_EMP_FIS: TIntegerField
      FieldName = 'COD_EMP_FIS'
    end
    object cdswsScriptSEQID_WS: TLargeintField
      FieldName = 'SEQID_WS'
    end
    object cdswsScriptERRO: TMemoField
      FieldName = 'ERRO'
      OnGetText = cdswsScriptERROGetText
      BlobType = ftMemo
      Size = 8
    end
  end
  object dswsScript: TDataSource
    AutoEdit = False
    DataSet = cdswsScript
    Left = 1268
    Top = 448
  end
  object IBDatabaseScript: TIBDatabase
    DatabaseName = '192.168.254.9:D:\BasesAuto\replws\ang\jk\hwautoMatriz.fdb'
    Params.Strings = (
      'user_name=repl'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransactionScript
    Left = 1508
    Top = 11
  end
  object IBTransactionScript: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 1504
    Top = 57
  end
  object IBQueryScript: TIBQuery
    Database = IBDatabaseLog
    Transaction = IBTransactionScript
    SQL.Strings = (
      'select * from Log')
    Left = 1504
    Top = 104
  end
  object qrConsultaSchemas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT * FROM WSR_SCHEMAS'
      'WHERE COD_SCHEMA > 0 AND ATIVO = 1')
    Left = 1368
    Top = 304
  end
  object dspConsultaSchemas: TDataSetProvider
    DataSet = qrConsultaSchemas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1368
    Top = 352
  end
  object cdsConsultaSchemas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaSchemas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1368
    Top = 480
    object cdsConsultaSchemasCOD_SCHEMA: TIntegerField
      FieldName = 'COD_SCHEMA'
      Required = True
    end
    object cdsConsultaSchemasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConsultaSchemasIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Size = 30
    end
    object cdsConsultaSchemasTOKEN: TStringField
      FieldName = 'TOKEN'
      Size = 128
    end
    object cdsConsultaSchemasSCHEMA_REPLICACAO: TStringField
      FieldName = 'SCHEMA_REPLICACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaSchemasCOD_SCHEMA_ESP: TIntegerField
      FieldName = 'COD_SCHEMA_ESP'
    end
    object cdsConsultaSchemasATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsConsultaSchemas: TDataSource
    AutoEdit = False
    DataSet = cdsConsultaSchemas
    Left = 1368
    Top = 424
  end
  object qrSchemasScript: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT * FROM WSR_SCHEMAS'
      'WHERE COD_SCHEMA > 0 AND ATIVO = 1')
    Left = 1496
    Top = 304
  end
  object dspSchemasScript: TDataSetProvider
    DataSet = qrSchemasScript
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1496
    Top = 352
  end
  object cdsSchemasScript: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSchemasScript'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1496
    Top = 400
    object IntegerField4: TIntegerField
      FieldName = 'COD_SCHEMA'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField7: TStringField
      FieldName = 'IDENTIFICACAO'
      Size = 30
    end
    object StringField8: TStringField
      FieldName = 'TOKEN'
      Size = 128
    end
    object StringField9: TStringField
      FieldName = 'SCHEMA_REPLICACAO'
      FixedChar = True
      Size = 1
    end
    object IntegerField6: TIntegerField
      FieldName = 'COD_SCHEMA_ESP'
    end
    object IntegerField7: TIntegerField
      FieldName = 'ATIVO'
    end
    object IntegerField8: TIntegerField
      FieldName = 'COD_CENT_DIS'
    end
    object IntegerField9: TIntegerField
      FieldName = 'COD_EMPRESA_FISICA'
    end
    object StringField10: TStringField
      FieldName = 'COD_EMPRESAS_FISICA'
      Size = 16
    end
    object StringField11: TStringField
      FieldName = 'RECEBER'
      FixedChar = True
      Size = 1
    end
    object cdsSchemasScriptEND_BANCO: TMemoField
      Tag = 1
      FieldName = 'END_BANCO'
      Visible = False
      BlobType = ftMemo
      Size = 8
    end
    object cdsSchemasScriptCONSULTA: TMemoField
      Tag = 1
      FieldName = 'CONSULTA'
      Visible = False
      BlobType = ftMemo
      Size = 8
    end
    object cdsSchemasScriptSCRIPT: TMemoField
      Tag = 1
      FieldName = 'SCRIPT'
      Visible = False
      BlobType = ftMemo
      Size = 8
    end
    object cdsSchemasScriptUSER_BANCO: TStringField
      Tag = 1
      FieldName = 'USER_BANCO'
      Visible = False
      Size = 6
    end
  end
  object dsSchemasScript: TDataSource
    AutoEdit = False
    DataSet = cdsSchemasScript
    Left = 1496
    Top = 456
  end
  object dsLiberacaoProcesso: TDataSource
    DataSet = cdsLiberacaoProcesso
    Left = 88
    Top = 504
  end
  object cdsLiberacaoProcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLiberacaoProcesso'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 88
    Top = 448
    object cdsLiberacaoProcessoPROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'PROCESSO'
      Size = 10
    end
    object cdsLiberacaoProcessoMENSAGEM: TStringField
      DisplayLabel = 'Mensagem'
      FieldName = 'MENSAGEM'
      Size = 128
    end
    object cdsLiberacaoProcessoUSUARIO_SOLICITANTE: TStringField
      DisplayLabel = 'Usu'#225'rio Solicitante'
      FieldName = 'USUARIO_SOLICITANTE'
      Required = True
    end
    object cdsLiberacaoProcessoDATA_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data Solicitacao'
      FieldName = 'DATA_SOLICITACAO'
      Required = True
    end
    object cdsLiberacaoProcessoCOD_SOLICITACAO: TIntegerField
      DisplayLabel = 'Cod Lib'
      FieldName = 'COD_SOLICITACAO'
      Required = True
    end
    object cdsLiberacaoProcessoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsLiberacaoProcessoUSUARIO_GERENTE: TStringField
      Tag = 1
      DisplayLabel = 'Usuario Gerente'
      FieldName = 'USUARIO_GERENTE'
      Visible = False
    end
    object cdsLiberacaoProcessoORDEM: TIntegerField
      Tag = 1
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
  end
  object dspLiberacaoProcesso: TDataSetProvider
    DataSet = qrLiberacaoProcesso
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 88
    Top = 400
  end
  object qrLiberacaoProcesso: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransProcessos
    SQL.Strings = (
      
        '    select CASE WHEN(USUARIO_GERENTE IS NULL) THEN 1 ELSE 2 END ' +
        'ORDEM, S.* from solicitacoes_acesso S'
      '    where S.cod_empresa = 0')
    Left = 88
    Top = 344
  end
  object qrRegrasProgramasFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from regras_prog_fidelidade '
      'where cod_empresa = 1')
    Left = 552
    Top = 64
  end
  object dspRegrasProgramasFid: TDataSetProvider
    DataSet = qrRegrasProgramasFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 552
    Top = 112
  end
  object cdsRegrasProgramasFid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegrasProgramasFid'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 552
    Top = 160
    object cdsRegrasProgramasFidCOD_TP_REGRA: TIntegerField
      DisplayLabel = 'Classe'
      FieldName = 'COD_TP_REGRA'
      Required = True
    end
    object cdsRegrasProgramasFidCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsRegrasProgramasFidDESCRICAO_REGRA: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_REGRA'
      Size = 60
    end
    object cdsRegrasProgramasFidSITUACAO: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'SITUACAO'
      Size = 10
    end
    object cdsRegrasProgramasFidAPLICAR: TStringField
      Tag = 1
      DisplayLabel = 'Atuar'
      FieldName = 'ATUAR'
      Visible = False
    end
  end
  object dsRegrasProgramasFid: TDataSource
    DataSet = cdsRegrasProgramasFid
    Left = 552
    Top = 208
  end
  object qrConfigRegrasFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from config_regras_prog_fidelidade'
      'where cod_empresa = 1')
    Left = 680
    Top = 64
  end
  object dspConfigRegrasFid: TDataSetProvider
    DataSet = qrConfigRegrasFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 680
    Top = 112
  end
  object cdsConfigRegrasFid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigRegrasFid'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 680
    Top = 160
    object cdsConfigRegrasFidCODIGO: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
      Visible = False
    end
    object cdsConfigRegrasFidCOD_TP_REGRA: TIntegerField
      Tag = 1
      DisplayLabel = 'Classe'
      FieldName = 'COD_TP_REGRA'
      Required = True
      Visible = False
    end
    object cdsConfigRegrasFidCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsConfigRegrasFidDESCRICAO_CONFIG: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_CONFIG'
      Size = 100
    end
    object cdsConfigRegrasFidPERC_DIA_REAL: TFloatField
      Tag = 2
      DisplayLabel = 'Perc/Dia/Real'
      FieldName = 'PERC_DIA_REAL'
    end
    object cdsConfigRegrasFidPONTOS: TFloatField
      Tag = 2
      DisplayLabel = 'Pontos'
      FieldName = 'PONTOS'
      Required = True
    end
    object cdsConfigRegrasFidCONDICAO_INI: TStringField
      Tag = 1
      DisplayLabel = 'Condi'#231#227'o Inicial'
      FieldName = 'CONDICAO_INI'
      Visible = False
    end
    object cdsConfigRegrasFidCONDICAO_FIM: TStringField
      Tag = 1
      DisplayLabel = 'Condicao Final'
      FieldName = 'CONDICAO_FIM'
      Visible = False
    end
    object cdsConfigRegrasFidVALOR_F_INI: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Inicial'
      FieldName = 'VALOR_F_INI'
      Visible = False
    end
    object cdsConfigRegrasFidVALOR_F_FIM: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Final'
      FieldName = 'VALOR_F_FIM'
      Visible = False
    end
    object cdsConfigRegrasFidVALOR_VC: TStringField
      Tag = 1
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_VC'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsConfigRegrasFidGRUPO_PROD: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Visible = False
    end
    object cdsConfigRegrasFidCOD_PROD: TStringField
      Tag = 1
      FieldName = 'COD_PROD'
      Visible = False
      FixedChar = True
      Size = 6
    end
  end
  object dsConfigRegrasFid: TDataSource
    DataSet = cdsConfigRegrasFid
    Left = 680
    Top = 208
  end
  object qrTaxaProgramasFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'select first 1 tx.*, col.nome_vendedor from taxa_conv_prog_fidel' +
        'idade tx'
      
        'inner join colaborador col on col.cod_vendedor = tx.cod_usuario ' +
        'and col.cod_empresa = tx.cod_empresa'
      'where tx.cod_empresa = 1'
      'order by tx.codigo desc')
    Left = 640
    Top = 304
  end
  object dspTaxaProgramasFid: TDataSetProvider
    DataSet = qrTaxaProgramasFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 640
    Top = 352
  end
  object cdsTaxaProgramasFid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTaxaProgramasFid'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 640
    Top = 400
    object cdsTaxaProgramasFidCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsTaxaProgramasFidCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTaxaProgramasFidVALOR_PROG_FID: TFloatField
      FieldName = 'VALOR_PROG_FID'
    end
    object cdsTaxaProgramasFidPERC_PRG_FID: TFloatField
      FieldName = 'PERC_PROG_FID'
    end
    object cdsTaxaProgramasFidDATA_VENC: TDateTimeField
      FieldName = 'DATA_VENC'
    end
    object cdsTaxaProgramasFidCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object cdsTaxaProgramasFidDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
    end
    object cdsTaxaProgramasFidNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsTaxaProgramasFidTOT_PONTOS_SIM: TFloatField
      FieldName = 'TOT_PONTOS_SIM'
    end
    object cdsTaxaProgramasFidTOT_FAT_SIM: TFloatField
      FieldName = 'TOT_FAT_SIM'
    end
    object cdsTaxaProgramasFidQTDE_VENDAS_SIM: TIntegerField
      FieldName = 'QTDE_VENDAS_SIM'
    end
    object cdsTaxaProgramasFidQTDE_DEV_SIM: TIntegerField
      FieldName = 'QTDE_DEV_SIM'
    end
    object cdsTaxaProgramasFidTOT_VENDAS_SIM: TFloatField
      FieldName = 'TOT_VENDAS_SIM'
    end
    object cdsTaxaProgramasFidTOT_DEV_SIM: TFloatField
      FieldName = 'TOT_DEV_SIM'
    end
    object cdsTaxaProgramasFidQTDE_DEV_AV_SIM: TIntegerField
      FieldName = 'QTDE_DEV_AV_SIM'
    end
    object cdsTaxaProgramasFidTOT_DEV_AV_SIM: TFloatField
      FieldName = 'TOT_DEV_AV_SIM'
    end
    object cdsTaxaProgramasFidQTDE_VALES_SIM: TIntegerField
      FieldName = 'QTDE_VALES_SIM'
    end
    object cdsTaxaProgramasFidTOT_VALES_SIM: TFloatField
      FieldName = 'TOT_VALES_SIM'
    end
    object cdsTaxaProgramasFidDATA_INI: TDateTimeField
      FieldName = 'DATA_INI'
    end
    object cdsTaxaProgramasFidDATA_FIM: TDateTimeField
      FieldName = 'DATA_FIM'
    end
    object cdsTaxaProgramasFidPERIODO_VENC_PONTOS: TIntegerField
      FieldName = 'PERIODO_VENC_PONTOS'
    end
  end
  object dsTaxaProgramasFid: TDataSource
    DataSet = cdsTaxaProgramasFid
    Left = 640
    Top = 448
  end
  object qrRegrasValeTrocaProgFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from regras_vale_troca_prog_fid'
      'where cod_empresa = 1')
    Left = 808
    Top = 64
  end
  object dspRegrasValeTrocaProgFid: TDataSetProvider
    DataSet = qrRegrasValeTrocaProgFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 808
    Top = 112
  end
  object cdsRegrasValeTrocaProgFid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegrasValeTrocaProgFid'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 808
    Top = 160
    object cdsRegrasValeTrocaProgFidCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsRegrasValeTrocaProgFidCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRegrasValeTrocaProgFidTIPO: TStringField
      DisplayLabel = 'Tipo Vale'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 10
    end
    object cdsRegrasValeTrocaProgFidPONTOS: TFloatField
      DisplayLabel = 'Pontos'
      FieldName = 'PONTOS'
    end
    object cdsRegrasValeTrocaProgFidVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsRegrasValeTrocaProgFidNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsRegrasValeTrocaProgFidCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsRegrasValeTrocaProgFidDESCR_PROD: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsRegrasValeTrocaProgFidGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
    end
    object cdsRegrasValeTrocaProgFidCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsRegrasValeTrocaProgFidUS_CAD: TIntegerField
      DisplayLabel = 'Usuario Cadastro'
      FieldName = 'US_CAD'
    end
    object cdsRegrasValeTrocaProgFidDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD'
    end
    object cdsRegrasValeTrocaProgFidUS_MOD: TIntegerField
      DisplayLabel = 'Usuario Alter'
      FieldName = 'US_MOD'
    end
    object cdsRegrasValeTrocaProgFidDATA_MOD: TDateTimeField
      DisplayLabel = 'Data Alter'
      FieldName = 'DATA_MOD'
    end
    object cdsRegrasValeTrocaProgFidATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsRegrasValeTrocaProgFid: TDataSource
    DataSet = cdsRegrasValeTrocaProgFid
    Left = 808
    Top = 208
  end
  object qrConfigAPI: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT CONFIG_API.*, 0 ORDEM, CONFIG_API.API AS API_DESCR FROM C' +
        'ONFIG_API')
    Left = 1624
    Top = 304
  end
  object dspConfigAPI: TDataSetProvider
    DataSet = qrConfigAPI
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1624
    Top = 352
  end
  object cdsConfigAPI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigAPI'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1624
    Top = 400
    object cdsConfigAPICOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsConfigAPIAPI_DESCR: TStringField
      Tag = 2
      DisplayLabel = 'API'
      DisplayWidth = 200
      FieldName = 'API_DESCR'
      Size = 200
    end
    object cdsConfigAPIAPI: TStringField
      Tag = 1
      DisplayLabel = 'API.'
      FieldName = 'API'
      Required = True
      Visible = False
    end
    object cdsConfigAPIURL_API: TStringField
      Tag = 1
      DisplayLabel = 'Url'
      FieldName = 'URL_API'
      Visible = False
      Size = 100
    end
    object cdsConfigAPICONSUMER_KEY: TStringField
      Tag = 1
      DisplayLabel = 'Consumer key'
      FieldName = 'CONSUMER_KEY'
      Visible = False
      Size = 100
    end
    object cdsConfigAPICONSUMER_SECRET: TStringField
      Tag = 1
      DisplayLabel = 'Consumer secret'
      FieldName = 'CONSUMER_SECRET'
      Visible = False
      Size = 100
    end
    object cdsConfigAPICODE_AUTORIZATION: TStringField
      Tag = 1
      DisplayLabel = 'code autorization'
      FieldName = 'CODE_AUTORIZATION'
      Visible = False
      Size = 100
    end
    object cdsConfigAPICOD_TIP_CLIENTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod tipo cliente'
      FieldName = 'COD_TIP_CLIENTE'
      Visible = False
    end
    object cdsConfigAPITIPO_VENDA: TStringField
      Tag = 1
      DisplayLabel = 'Tipo venda padrao'
      FieldName = 'TIPO_VENDA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsConfigAPICOD_VENDEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Visible = False
    end
    object cdsConfigAPICOD_TAB_PRECO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tab Preco'
      FieldName = 'COD_TAB_PRECO'
      Visible = False
    end
    object cdsConfigAPIATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsConfigAPITOKEN_API: TStringField
      Tag = 1
      DisplayLabel = 'Token'
      FieldName = 'TOKEN_API'
      Visible = False
      Size = 100
    end
    object cdsConfigAPISENHA_API: TStringField
      Tag = 1
      DisplayLabel = 'Senha'
      FieldName = 'SENHA_API'
      Visible = False
    end
    object cdsConfigAPISENHA: TStringField
      Tag = 1
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Visible = False
      Size = 100
    end
    object cdsConfigAPICHAVE_ASSIGN: TStringField
      Tag = 1
      DisplayLabel = 'Chave Assign'
      FieldName = 'CHAVE_ASSIGN'
      Visible = False
      Size = 255
    end
    object cdsConfigAPIDATA_EXPIRACAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Expiracao'
      FieldName = 'DATA_EXPIRACAO'
      Visible = False
    end
    object cdsConfigAPINOMEFANTASIA: TStringField
      Tag = 1
      DisplayLabel = 'Nome Empresa'
      FieldName = 'NOMEFANTASIA'
      Size = 60
    end
    object cdsConfigAPITELEFONE: TStringField
      Tag = 1
      DisplayLabel = 'Telefone Principal'
      FieldName = 'TELEFONE'
      EditMask = '!\(00\)0000-0009;0;_'
      Size = 12
    end
    object cdsConfigAPICELULAR: TStringField
      Tag = 1
      DisplayLabel = 'Celular(Whatsapp)'
      FieldName = 'CELULAR'
      EditMask = '!\(00\)00000-0009;0;_'
      Size = 12
    end
    object cdsConfigAPIWEBSITE: TStringField
      Tag = 1
      DisplayLabel = 'Site'
      FieldName = 'WEBSITE'
      Size = 60
    end
    object cdsConfigAPIEMAILCONTATO: TStringField
      Tag = 1
      DisplayLabel = 'Email contato'
      FieldName = 'EMAILCONTATO'
      Size = 60
    end
    object cdsConfigAPIARQUIVOLOGO: TStringField
      Tag = 1
      DisplayLabel = 'Endereco logo'
      FieldName = 'ARQUIVOLOGO'
      Size = 128
    end
    object cdsConfigAPICOD_INTEGRADOR: TStringField
      Tag = 1
      DisplayLabel = 'Cod Integrador'
      FieldName = 'COD_INTEGRADOR'
      Size = 60
    end
    object cdsConfigAPITOKEN_INTEGRADOR: TStringField
      Tag = 1
      DisplayLabel = 'Token Integrador'
      FieldName = 'TOKEN_INTEGRADOR'
      Size = 255
    end
    object cdsConfigAPICOD_CLIENTE_CONFERE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cliente Confere'
      FieldName = 'COD_CLIENTE_CONFERE'
    end
    object cdsConfigAPICOD_ESTABEL_CONFERE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Estabelecimento Confere'
      FieldName = 'COD_ESTABEL_CONFERE'
    end
    object cdsConfigAPIACESS_TOKEN: TStringField
      Tag = 1
      DisplayLabel = 'Acess Token'
      FieldName = 'ACESS_TOKEN'
      Size = 500
    end
    object cdsConfigAPIUSER_ID: TLargeintField
      Tag = 1
      DisplayLabel = 'User Id'
      FieldName = 'USER_ID'
    end
    object cdsConfigAPIPESO_POPULARIDADE: TIntegerField
      Tag = 1
      DisplayLabel = 'Peso Popularidade'
      FieldName = 'PESO_POPULARIDADE'
    end
    object cdsConfigAPIPESO_NIVEL_GIRO_MEDIO: TIntegerField
      Tag = 1
      DisplayLabel = 'Peso Nivel Giro Medio'
      FieldName = 'PESO_NIVEL_GIRO_MEDIO'
    end
    object cdsConfigAPIPESO_DEMANDA: TIntegerField
      Tag = 1
      DisplayLabel = 'Peso Demanda'
      FieldName = 'PESO_DEMANDA'
    end
    object cdsConfigAPIPESO_FREQUENCIA: TIntegerField
      Tag = 1
      DisplayLabel = 'Peso Frequencia'
      FieldName = 'PESO_FREQUENCIA'
    end
    object cdsConfigAPIPESO_PRECO: TIntegerField
      Tag = 1
      DisplayLabel = 'Peso Preco'
      FieldName = 'PESO_PRECO'
    end
    object cdsConfigAPIGIRO_PADRAO_BAIXO_INI: TFloatField
      Tag = 1
      DisplayLabel = 'Giro Baixo Ini'
      FieldName = 'GIRO_PADRAO_BAIXO_INI'
    end
    object cdsConfigAPIGIRO_PADRAO_BAIXO_FIM: TFloatField
      Tag = 1
      DisplayLabel = 'Giro Baixo Final'
      FieldName = 'GIRO_PADRAO_BAIXO_FIM'
    end
    object cdsConfigAPIGIRO_PADRAO_MEDIO_INI: TFloatField
      Tag = 1
      DisplayLabel = 'Giro Medio Ini'
      FieldName = 'GIRO_PADRAO_MEDIO_INI'
    end
    object cdsConfigAPIGIRO_PADRAO_MEDIO_FIM: TFloatField
      Tag = 1
      DisplayLabel = 'Giro Medio Fim'
      FieldName = 'GIRO_PADRAO_MEDIO_FIM'
    end
    object cdsConfigAPIGIRO_PADRAO_ALTO_INI: TFloatField
      Tag = 1
      DisplayLabel = 'Giro Alto Ini'
      FieldName = 'GIRO_PADRAO_ALTO_INI'
    end
    object cdsConfigAPIGIRO_PADRAO_ALTO_FIM: TFloatField
      Tag = 1
      DisplayLabel = 'Giro Alto Fim'
      FieldName = 'GIRO_PADRAO_ALTO_FIM'
    end
    object cdsConfigAPIUTIL_RECOMENDACAO: TStringField
      Tag = 1
      DisplayLabel = 'Utilizar recomendacao'
      FieldName = 'UTIL_RECOMENDACAO'
      Size = 1
    end
    object cdsConfigAPIINTERV_TREINO_RECOMENDA: TIntegerField
      Tag = 1
      DisplayLabel = 'Intervalo Treino Recomendacao'
      FieldName = 'INTERV_TREINO_RECOMENDA'
    end
    object cdsConfigAPIDIAS_VND_RECOMENDA: TIntegerField
      Tag = 1
      DisplayLabel = 'Dias Recomendacao Venda'
      FieldName = 'DIAS_VND_RECOMENDA'
    end
    object cdsConfigAPICOD_COND_PAG: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsConfigAPIINFO_CONTATO: TMemoField
      Tag = 1
      DisplayLabel = 'Info Contato'
      FieldName = 'INFO_CONTATO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsConfigAPIDATA_CAD: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
    end
    object cdsConfigAPIDATA_MOD: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Mod'
      FieldName = 'DATA_MOD'
    end
    object cdsConfigAPIHORARIO_SEMANA_INI: TStringField
      Tag = 1
      DisplayLabel = 'Hor'#225'rio Semana Inicial'
      FieldName = 'HORARIO_SEMANA_INI'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object cdsConfigAPIHORARIO_SEMANA_FIM: TStringField
      Tag = 1
      DisplayLabel = 'Hor'#225'rio Semana Final'
      FieldName = 'HORARIO_SEMANA_FIM'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object cdsConfigAPIHORARIO_SABADO_INI: TStringField
      Tag = 1
      DisplayLabel = 'Hor'#225'rio S'#225'bado Inicial'
      FieldName = 'HORARIO_SABADO_INI'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object cdsConfigAPIHORARIO_SABADO_FIM: TStringField
      Tag = 1
      DisplayLabel = 'Hor'#225'rio S'#225'bado Final'
      FieldName = 'HORARIO_SABADO_FIM'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object cdsConfigAPIUSAR_API_COG: TStringField
      Tag = 1
      DisplayLabel = 'Usar API Cog'
      FieldName = 'USAR_API_COG'
      FixedChar = True
      Size = 1
    end
    object cdsConfigAPINOME_BOT: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Bot'
      FieldName = 'NOME_BOT'
      Size = 30
    end
    object cdsConfigAPIAMBIENTE_API: TStringField
      Tag = 1
      DisplayLabel = 'Ambiente'
      FieldName = 'AMBIENTE_API'
      Size = 18
    end
    object cdsConfigAPITIPO_OS: TStringField
      Tag = 1
      DisplayLabel = 'Tipo OS'
      FieldName = 'TIPO_OS'
      Size = 40
    end
    object cdsConfigAPICAMINHO_LOGO_EMP: TStringField
      Tag = 1
      DisplayLabel = 'Caminho Logo Empresa'
      FieldName = 'CAMINHO_LOGO_EMP'
      Size = 256
    end
    object cdsConfigAPICAMINHO_FAVICON_EMP: TStringField
      Tag = 1
      DisplayLabel = 'Caminho Favicon Empresa'
      FieldName = 'CAMINHO_FAVICON_EMP'
      Size = 256
    end
    object cdsConfigAPICAMINHO_LOGO_EMP_BASE64: TMemoField
      Tag = 1
      DisplayLabel = 'Caminho Logo Empresa Base 64'
      FieldName = 'CAMINHO_LOGO_EMP_BASE64'
      BlobType = ftMemo
      Size = 8
    end
    object cdsConfigAPICAMINHO_FAVICON_EMP_BASE64: TMemoField
      Tag = 1
      DisplayLabel = 'Caminho Favicon Empresa Base 64'
      FieldName = 'CAMINHO_FAVICON_EMP_BASE64'
      BlobType = ftMemo
      Size = 8
    end
    object cdsConfigAPICOR_PRIMARY: TStringField
      Tag = 1
      FieldName = 'COR_PRIMARY'
      Size = 7
    end
    object cdsConfigAPICOR_PRIMARY_CONTAINER: TStringField
      Tag = 1
      FieldName = 'COR_PRIMARY_CONTAINER'
      Size = 7
    end
    object cdsConfigAPICOR_PRIMARY_FIXED: TStringField
      Tag = 1
      FieldName = 'COR_PRIMARY_FIXED'
      Size = 7
    end
    object cdsConfigAPICOR_ON_PRIMARY: TStringField
      Tag = 1
      FieldName = 'COR_ON_PRIMARY'
      Size = 7
    end
    object cdsConfigAPICOR_SECONDARY: TStringField
      Tag = 1
      FieldName = 'COR_SECONDARY'
      Size = 7
    end
    object cdsConfigAPICOR_SECONDARY_CONTAINER: TStringField
      Tag = 1
      FieldName = 'COR_SECONDARY_CONTAINER'
      Size = 7
    end
    object cdsConfigAPICOR_TERTIARY: TStringField
      Tag = 1
      FieldName = 'COR_TERTIARY'
      Size = 7
    end
    object cdsConfigAPICOR_ERROR: TStringField
      Tag = 1
      FieldName = 'COR_ERROR'
      Size = 7
    end
    object cdsConfigAPICOR_BACKGROUND: TStringField
      Tag = 1
      FieldName = 'COR_BACKGROUND'
      Size = 7
    end
    object cdsConfigAPICOR_SURFACE_LOWEST: TStringField
      Tag = 1
      FieldName = 'COR_SURFACE_LOWEST'
      Size = 7
    end
    object cdsConfigAPICOR_SURFACE_LOW: TStringField
      Tag = 1
      FieldName = 'COR_SURFACE_LOW'
      Size = 7
    end
    object cdsConfigAPIMODELO_PADRAO: TIntegerField
      Tag = 1
      DisplayLabel = 'Modelo Padrao'
      FieldName = 'MODELO_PADRAO'
    end
    object cdsConfigAPIDIA_MES_INI_FAT_META: TIntegerField
      Tag = 1
      DisplayLabel = 'Dia Mes Ini Faturamento Meta'
      FieldName = 'DIA_MES_INI_FAT_META'
    end
    object cdsConfigAPILIMITE_GASTOS_META: TFloatField
      Tag = 1
      DisplayLabel = 'Limite Gastos Meta'
      FieldName = 'LIMITE_GASTOS_META'
      DisplayFormat = '#,##0.00'
    end
    object cdsConfigAPIDRIVE_TYPE: TStringField
      Tag = 1
      DisplayLabel = 'drive_type'
      FieldName = 'DRIVE_TYPE'
      Size = 50
    end
    object cdsConfigAPIDRIVE_CHECK_MODIF: TStringField
      Tag = 1
      DisplayLabel = 'drive_check_modif'
      FieldName = 'DRIVE_CHECK_MODIF'
      FixedChar = True
      Size = 1
    end
    object cdsConfigAPIUTIL_AGENTIC_RAG: TStringField
      Tag = 1
      DisplayLabel = 'util_agentic_rag'
      FieldName = 'UTIL_AGENTIC_RAG'
      FixedChar = True
      Size = 1
    end
    object cdsConfigAPIPASTA_PADRAO_DRIVE: TStringField
      Tag = 1
      DisplayLabel = 'pasta_padrao_drive'
      FieldName = 'PASTA_PADRAO_DRIVE'
      FixedChar = True
      Size = 50
    end
    object cdsConfigAPIDRIVE_CREDENTIALS: TMemoField
      Tag = 1
      DisplayLabel = 'drive_credentials'
      FieldName = 'DRIVE_CREDENTIALS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsConfigAPI: TDataSource
    AutoEdit = False
    DataSet = cdsConfigAPI
    Left = 1624
    Top = 448
  end
  object qrConfigAPIpromocao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.DESCR_PROMOCAO FROM PROMO' +
        'CAO '
      
        'LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_TP' +
        'PRECO AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA '
      
        'WHERE PROMOCAO.COD_PROMOCAO = :COD_PROMOCAO AND PROMOCAO.COD_EMP' +
        'RESA = :COD_EMPRESA '
      'AND PROMOCAO.COD_PROMOCAO > 0 AND TIPO_PRECO.TIPO = '#39'P'#39)
    Left = 1624
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_PROMOCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspConfigAPIpromocao: TDataSetProvider
    DataSet = qrConfigAPIpromocao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1624
    Top = 152
  end
  object cdsConfigAPIpromocao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigAPIpromocao'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1624
    Top = 200
    object cdsConfigAPIpromocaoCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsConfigAPIpromocaoDESCR_PROMOCAO: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
  end
  object dsConfigAPIpromocao: TDataSource
    AutoEdit = False
    DataSet = cdsConfigAPIpromocao
    Left = 1624
    Top = 248
  end
  object qrConfigAPItabela: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.DESCR_PROMOCAO FROM PROMO' +
        'CAO '
      
        'LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_TP' +
        'PRECO AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA '
      
        'WHERE PROMOCAO.COD_PROMOCAO = :COD_PROMOCAO AND PROMOCAO.COD_EMP' +
        'RESA = :COD_EMPRESA '
      'AND PROMOCAO.COD_PROMOCAO > 0 AND TIPO_PRECO.TIPO = '#39'T'#39)
    Left = 1736
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_PROMOCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspConfigAPItabela: TDataSetProvider
    DataSet = qrConfigAPItabela
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1736
    Top = 152
  end
  object cdsConfigAPItabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigAPItabela'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1736
    Top = 200
    object cdsConfigAPItabelaCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsConfigAPItabelaDESCR_PROMOCAO: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
  end
  object dsConfigAPItabela: TDataSource
    AutoEdit = False
    DataSet = cdsConfigAPItabela
    Left = 1736
    Top = 248
  end
  object qrConfigAPItipocliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT TIPOS_CLIENTES.CODIGO_TIPO, TIPOS_CLIENTES.DESCRICAO_TIPO' +
        ' FROM TIPOS_CLIENTES '
      'WHERE TIPOS_CLIENTES.CODIGO_TIPO = :CODIGO_TIPO')
    Left = 1848
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO_TIPO'
        ParamType = ptUnknown
      end>
  end
  object dspConfigAPItipocliente: TDataSetProvider
    DataSet = qrConfigAPItipocliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1848
    Top = 152
  end
  object cdsConfigAPItipocliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigAPItipocliente'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1848
    Top = 200
    object cdsConfigAPItipoclienteCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
      Required = True
    end
    object cdsConfigAPItipoclienteDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      FixedChar = True
      Size = 30
    end
  end
  object dsConfigAPItipocliente: TDataSource
    AutoEdit = False
    DataSet = cdsConfigAPItipocliente
    Left = 1848
    Top = 248
  end
  object qrConfigAPIvendedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT COD_VENDEDOR, NOME_VENDEDOR FROM COLABORADOR')
    Left = 1968
    Top = 104
  end
  object dspConfigAPIvendedor: TDataSetProvider
    DataSet = qrConfigAPIvendedor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1968
    Top = 152
  end
  object cdsConfigAPIvendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigAPIvendedor'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1968
    Top = 200
    object cdsConfigAPIvendedorCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsConfigAPIvendedorNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsConfigAPIvendedor: TDataSource
    AutoEdit = False
    DataSet = cdsConfigAPIvendedor
    Left = 1968
    Top = 248
  end
  object qrPromocaoOrdemEC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT PROMOCAO_ORDEM_EC.*,'
      'PROMOCAO.DESCR_PROMOCAO, '
      'PROMOCAO.DATA_INI,'
      'PROMOCAO.DATA_FIM,'
      'NULL TAB_CE, NULL TAB_CI,'
      
        '(select current_d from sp_current_ts(1)) DATAATUAL FROM PROMOCAO' +
        '_ORDEM_EC'
      
        'LEFT JOIN PROMOCAO ON PROMOCAO.COD_PROMOCAO = PROMOCAO_ORDEM_EC.' +
        'COD_PROMOCAO AND PROMOCAO.COD_EMPRESA = PROMOCAO_ORDEM_EC.COD_EM' +
        'PRESA')
    Left = 1728
    Top = 312
  end
  object dspPromocaoOrdemEC: TDataSetProvider
    DataSet = qrPromocaoOrdemEC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1728
    Top = 360
  end
  object cdsPromocaoOrdemEC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPromocaoOrdemEC'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1728
    Top = 408
    object cdsPromocaoOrdemECCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsPromocaoOrdemECCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPromocaoOrdemECORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsPromocaoOrdemECDESCR_PROMOCAO: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object cdsPromocaoOrdemECDATA_INI: TDateTimeField
      FieldName = 'DATA_INI'
    end
    object cdsPromocaoOrdemECDATA_FIM: TDateTimeField
      FieldName = 'DATA_FIM'
    end
    object cdsPromocaoOrdemECTAB_CE: TStringField
      FieldName = 'TAB_CE'
      ProviderFlags = [pfInWhere]
      Size = 1
    end
    object cdsPromocaoOrdemECTAB_CI: TStringField
      FieldName = 'TAB_CI'
      ProviderFlags = [pfInWhere]
      Size = 1
    end
    object cdsPromocaoOrdemECATUAL: TDateTimeField
      FieldName = 'DATAATUAL'
    end
  end
  object dsPromocaoOrdemEC: TDataSource
    AutoEdit = False
    DataSet = cdsPromocaoOrdemEC
    Left = 1728
    Top = 456
  end
  object qrConfigEmail: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from plataforma_msg ')
    Left = 72
    Top = 560
  end
  object dspConfigEmail: TDataSetProvider
    DataSet = qrConfigEmail
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 72
    Top = 608
  end
  object cdsConfigEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigEmail'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 72
    Top = 656
    object cdsConfigEmailCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsConfigEmailTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsConfigEmailDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dsConfigEmail: TDataSource
    AutoEdit = False
    DataSet = cdsConfigEmail
    Left = 72
    Top = 704
  end
  object qrConfigWhatsApp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from plataforma_msg ')
    Left = 192
    Top = 560
  end
  object dspConfigWhatsApp: TDataSetProvider
    DataSet = qrConfigWhatsApp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 192
    Top = 608
  end
  object cdsConfigWhatsApp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigWhatsApp'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 192
    Top = 656
    object cdsConfigWhatsAppCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsConfigWhatsAppDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dsConfigWhatsApp: TDataSource
    AutoEdit = False
    DataSet = cdsConfigWhatsApp
    Left = 192
    Top = 704
  end
  object qrConfigTelegram: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select * from plataforma_msg ')
    Left = 320
    Top = 560
  end
  object dspConfigTelegram: TDataSetProvider
    DataSet = qrConfigTelegram
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 320
    Top = 608
  end
  object cdsConfigTelegram: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigTelegram'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 320
    Top = 656
    object cdsConfigTelegramCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsConfigTelegramDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dsConfigTelegram: TDataSource
    AutoEdit = False
    DataSet = cdsConfigTelegram
    Left = 320
    Top = 704
  end
  object qrMsgPlataforma: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select'
      'msg_plataforma.id, '
      'msg_plataforma.cod_empresa,'
      'msg_plataforma.id_msg_aplicativo,'
      'msg_aplicativo.aplicativo,'
      'msg_plataforma.plataforma,'
      'msg_plataforma.identificador_bot from msg_plataforma'
      
        'left join msg_aplicativo on msg_aplicativo.id = msg_plataforma.i' +
        'd_msg_aplicativo'
      'where msg_plataforma.cod_empresa = 1'
      '')
    Left = 456
    Top = 560
  end
  object dspMsgPlataforma: TDataSetProvider
    DataSet = qrMsgPlataforma
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 456
    Top = 608
  end
  object cdsMsgPlataforma: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMsgPlataforma'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 456
    Top = 656
    object cdsMsgPlataformaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsMsgPlataformaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMsgPlataformaCOD_APLICATIVO: TIntegerField
      FieldName = 'ID_MSG_APLICATIVO'
      Required = True
    end
    object cdsMsgPlataformaAPLICATIVO: TStringField
      DisplayLabel = 'Aplicativo'
      FieldName = 'APLICATIVO'
      FixedChar = True
      Size = 50
    end
    object cdsMsgPlataformaDESCRICAO: TStringField
      DisplayLabel = 'Plataforma'
      FieldName = 'PLATAFORMA'
      Required = True
      Size = 50
    end
    object cdsMsgPlataformaIDENTIFICADOR_BOT: TStringField
      DisplayLabel = 'Identificacao Bot'
      FieldName = 'IDENTIFICADOR_BOT'
      Size = 60
    end
  end
  object dsMsgPlataforma: TDataSource
    AutoEdit = False
    DataSet = cdsMsgPlataforma
    Left = 456
    Top = 704
  end
  object qrMsgTipoContatoOrigem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select msg_tipo_contato_origem.*,'
      'msg_origem.descricaor,'
      'tipo_contato.tipo from msg_tipo_contato_origem'
      'left join tipo_contato on'
      '    tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato'
      
        '    and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_e' +
        'mpresa'
      'left join msg_origem on'
      '    msg_origem.id = msg_tipo_contato_origem.id_msg_origem'
      'where msg_tipo_contato_origem.cod_empresa = 1')
    Left = 616
    Top = 560
  end
  object dspMsgTipoContatoOrigem: TDataSetProvider
    DataSet = qrMsgTipoContatoOrigem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 616
    Top = 608
  end
  object cdsMsgTipoContatoOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMsgTipoContatoOrigem'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 616
    Top = 656
    object cdsMsgTipoContatoOrigemSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsMsgTipoContatoOrigemID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsMsgTipoContatoOrigemCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMsgTipoContatoOrigemTIPO: TStringField
      DisplayLabel = 'Tipo Contato'
      FieldName = 'TIPO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object cdsMsgTipoContatoOrigemORIGEM_DESCR: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsMsgTipoContatoOrigemID_TIPO_CONTATO: TIntegerField
      DisplayLabel = 'Id Tipo Contato'
      FieldName = 'ID_TIPO_CONTATO'
      Required = True
    end
    object cdsMsgTipoContatoOrigemORIGEM: TIntegerField
      DisplayLabel = 'Id Origem'
      FieldName = 'ID_MSG_ORIGEM'
    end
  end
  object dsMsgTipoContatoOrigem: TDataSource
    AutoEdit = False
    DataSet = cdsMsgTipoContatoOrigem
    Left = 616
    Top = 704
  end
  object qrTipoContato: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select '
      'tipo_contato.id, '
      'tipo_contato.cod_empresa,'
      'tipo_contato.tipo, '
      
        '(coalesce(tipo_contato.id, 0) || '#39' | '#39' || trim(coalesce(tipo_con' +
        'tato.tipo, '#39#39'))) tipo_contato '
      ' from tipo_contato')
    Left = 792
    Top = 560
  end
  object dspTipoContato: TDataSetProvider
    DataSet = qrTipoContato
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 792
    Top = 608
  end
  object cdsTipoContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoContato'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 792
    Top = 656
    object IntegerField10: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object IntegerField11: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField14: TStringField
      DisplayLabel = 'Tipo Contato'
      FieldName = 'TIPO'
      Size = 32
    end
    object cdsTipoContatoTIPO_CONTATO: TStringField
      FieldName = 'TIPO_CONTATO'
      Size = 46
    end
  end
  object dsTipoContato: TDataSource
    AutoEdit = False
    DataSet = cdsTipoContato
    Left = 792
    Top = 704
  end
  object qrMsgOrigem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'select msg_origem.id, msg_origem.descricao, (coalesce(msg_origem' +
        '.id, 0) || '#39' | '#39' || trim(coalesce(msg_origem.descricao, '#39#39'))) or' +
        'igem from msg_origem ')
    Left = 912
    Top = 560
  end
  object dspMsgOrigem: TDataSetProvider
    DataSet = qrMsgOrigem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 912
    Top = 608
  end
  object cdsMsgOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMsgOrigem'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 912
    Top = 656
    object IntegerField12: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object StringField12: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsMsgOrigemORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 64
    end
  end
  object dsMsgOrigem: TDataSource
    AutoEdit = False
    DataSet = cdsMsgOrigem
    Left = 912
    Top = 704
  end
  object qrMsgTipoContatoOrigemPlataforma: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select msg_tipo_contato_origem_plat.*,'
      'msg_aplicativo.aplicativo,'
      'msg_plataforma.plataforma,'
      'tipo_contato.tipo,'
      'msg_origem.descricao from msg_tipo_contato_origem_plat'
      'left join msg_plataforma on'
      
        '    msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plat' +
        'aforma'
      
        '    and msg_plataforma.cod_empresa = msg_tipo_contato_origem_pla' +
        't.cod_empresa'
      
        'left join msg_aplicativo on msg_aplicativo.id = msg_plataforma.i' +
        'd_msg_aplicativo'
      'left join msg_tipo_contato_origem on'
      
        '    msg_tipo_contato_origem.id = msg_tipo_contato_origem_plat.id' +
        '_msg_tipo_contato_origem'
      
        '    and msg_tipo_contato_origem.cod_empresa = msg_tipo_contato_o' +
        'rigem_plat.cod_empresa'
      'left join msg_origem on'
      '    msg_origem.id = msg_tipo_contato_origem.id_msg_origem'
      'left join tipo_contato on'
      '    tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato'
      
        '    and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_e' +
        'mpresa'
      'where msg_tipo_contato_origem_plat.cod_empresa = 1')
    Left = 1064
    Top = 560
  end
  object dspMsgTipoContatoOrigemPlataforma: TDataSetProvider
    DataSet = qrMsgTipoContatoOrigemPlataforma
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1064
    Top = 608
  end
  object cdsMsgTipoContatoOrigemPlataforma: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMsgTipoContatoOrigemPlataforma'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1064
    Top = 656
    object cdsMsgTipoContatoOrigemPlataformaSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsMsgTipoContatoOrigemPlataformaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMsgTipoContatoOrigemPlataformaAPLICATIVO: TStringField
      DisplayLabel = 'Aplicativo'
      FieldName = 'APLICATIVO'
      FixedChar = True
      Size = 50
    end
    object cdsMsgTipoContatoOrigemPlataformaPLATAFORMA: TStringField
      DisplayLabel = 'Plataforma'
      DisplayWidth = 50
      FieldName = 'PLATAFORMA'
      Size = 50
    end
    object cdsMsgTipoContatoOrigemPlataformaIDENTIFICADOR_BOT: TStringField
      DisplayLabel = 'Identificador Bot'
      FieldName = 'IDENTIFICADOR_BOT'
      Size = 60
    end
    object cdsMsgTipoContatoOrigemPlataformaTIPO: TStringField
      DisplayLabel = 'Tipo Contato'
      FieldName = 'TIPO'
      Size = 32
    end
    object cdsMsgTipoContatoOrigemPlataformaDESCRICAO: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsMsgTipoContatoOrigemPlataformaID_MSG_PLATAFORMA: TIntegerField
      DisplayLabel = 'Id Plataforma'
      FieldName = 'ID_MSG_PLATAFORMA'
      Required = True
    end
    object cdsMsgTipoContatoOrigemPlataformaID_MSG_TIPO_CONTATO_ORIGEM: TIntegerField
      DisplayLabel = 'Id Origem Tipo Contato'
      FieldName = 'ID_MSG_TIPO_CONTATO_ORIGEM'
      Required = True
    end
  end
  object dsMsgTipoContatoOrigemPlataforma: TDataSource
    AutoEdit = False
    DataSet = cdsMsgTipoContatoOrigemPlataforma
    Left = 1064
    Top = 704
  end
  object qrAbreMsgPlataforma: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select msg_plataforma.id, '
      'msg_plataforma.cod_empresa, '
      
        '(coalesce(msg_plataforma.id, 0) || '#39' | '#39' || trim(coalesce(msg_ap' +
        'licativo.aplicativo, '#39#39')) || '#39' | '#39' || trim(coalesce(msg_platafor' +
        'ma.plataforma, '#39#39'))) plataforma from msg_plataforma'
      'inner join msg_aplicativo on '
      '       msg_aplicativo.id = msg_plataforma.id_msg_aplicativo '
      'where msg_plataforma.cod_empresa =  1'
      'and msg_plataforma.id > 0 '
      'order by msg_plataforma.id_msg_aplicativo, msg_plataforma.id')
    Left = 1264
    Top = 560
  end
  object dspAbreMsgPlataforma: TDataSetProvider
    DataSet = qrAbreMsgPlataforma
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1264
    Top = 608
  end
  object cdsAbreMsgPlataforma: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAbreMsgPlataforma'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1264
    Top = 656
    object cdsAbreMsgPlataformaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAbreMsgPlataformaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAbreMsgPlataformaDESCRICAO: TStringField
      FieldName = 'PLATAFORMA'
      Required = True
      Size = 50
    end
  end
  object dsAbreMsgPlataforma: TDataSource
    AutoEdit = False
    DataSet = cdsAbreMsgPlataforma
    Left = 1264
    Top = 704
  end
  object qrAbreMsgTipoContatoOrigem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select msg_tipo_contato_origem.id,'
      
        '(coalesce(msg_tipo_contato_origem.id, 0) || '#39' | '#39' || trim(coales' +
        'ce(tipo_contato.tipo, '#39#39#39#39')) || '#39' | '#39' || trim(coalesce(msg_orige' +
        'm.descricao, '#39#39')))tipo_contato_origem from msg_tipo_contato_orig' +
        'em'
      'inner join msg_origem on'
      '    msg_origem.id = msg_tipo_contato_origem.id_msg_origem'
      'inner join tipo_contato on'
      '    tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato'
      
        '    and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_e' +
        'mpresa'
      'where msg_tipo_contato_origem.cod_empresa = 1')
    Left = 1448
    Top = 560
  end
  object dspAbreMsgTipoContatoOrigem: TDataSetProvider
    DataSet = qrAbreMsgTipoContatoOrigem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1448
    Top = 608
  end
  object cdsAbreMsgTipoContatoOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAbreMsgTipoContatoOrigem'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1448
    Top = 656
    object cdsAbreMsgTipoContatoOrigemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAbreMsgTipoContatoOrigemTIPO_CONTATO_ORIGEM: TStringField
      FieldName = 'TIPO_CONTATO_ORIGEM'
      Size = 85
    end
  end
  object dsAbreMsgTipoContatoOrigem: TDataSource
    AutoEdit = False
    DataSet = cdsAbreMsgTipoContatoOrigem
    Left = 1448
    Top = 704
  end
  object qrModcartas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select '
      'modcartas.cod_carta, '
      'modcartas.descricao, '
      
        '(modcartas.cod_carta || '#39' | '#39' ||  modcartas.descricao || '#39' | '#39' |' +
        '|  msg_aplicativo.aplicativo) modcartas from modcartas '
      
        'left join msg_aplicativo on  msg_aplicativo.id = modcartas.id_ms' +
        'g_aplicativo'
      'where modcartas.cod_empresa = 1'
      'and modcartas.tipo = '#39'NOT'#39
      'and modcartas.ativo = 1')
    Left = 1608
    Top = 560
  end
  object dspModcartas: TDataSetProvider
    DataSet = qrModcartas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1608
    Top = 608
  end
  object cdsModcartas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModcartas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1608
    Top = 656
    object cdsModcartasCOD_CARTA: TIntegerField
      FieldName = 'COD_CARTA'
    end
    object cdsModcartasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsModcartasMODCARTAS: TStringField
      FieldName = 'MODCARTAS'
      Size = 131
    end
  end
  object dsModcartas: TDataSource
    AutoEdit = False
    DataSet = cdsModcartas
    Left = 1608
    Top = 704
  end
  object qrMsgOrigemModCartas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'select msg_origem_modcartas.*,'
      'msg_origem.descricao,'
      'modcartas.descricao as modcarta,'
      'msg_aplicativo.aplicativo from msg_origem_modcartas'
      'left join modcartas on'
      '    modcartas.cod_carta = msg_origem_modcartas.cod_carta'
      '    and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa'
      'left join msg_aplicativo on'
      '    msg_aplicativo.id = modcartas.id_msg_aplicativo'
      'left join msg_origem on'
      '    msg_origem.id = msg_origem_modcartas.id_msg_origem'
      'where msg_origem_modcartas.id_msg_origem = 0'
      'and msg_origem_modcartas.cod_carta = 0'
      'and msg_origem_modcartas.cod_empresa = 0')
    Left = 1736
    Top = 560
  end
  object dspMsgOrigemModCartas: TDataSetProvider
    DataSet = qrMsgOrigemModCartas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1736
    Top = 608
  end
  object cdsMsgOrigemModCartas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMsgOrigemModCartas'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1736
    Top = 656
    object cdsMsgOrigemModCartasSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsMsgOrigemModCartasCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMsgOrigemModCartasORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsMsgOrigemModCartasAPLICATIVO: TStringField
      DisplayLabel = 'Aplicativo'
      FieldName = 'APLICATIVO'
      Size = 50
    end
    object cdsMsgOrigemModCartasMODCARTA: TStringField
      DisplayLabel = 'Carta'
      FieldName = 'MODCARTA'
      Size = 64
    end
    object cdsMsgOrigemModCartasID_MSG_ORIGEM: TIntegerField
      DisplayLabel = 'Id Origem'
      FieldName = 'ID_MSG_ORIGEM'
      Required = True
    end
    object cdsMsgOrigemModCartasCOD_CARTA: TIntegerField
      DisplayLabel = 'Cod Carta'
      FieldName = 'COD_CARTA'
      Required = True
    end
  end
  object dsMsgOrigemModCartas: TDataSource
    AutoEdit = False
    DataSet = cdsMsgOrigemModCartas
    Left = 1736
    Top = 704
  end
  object qrConfigAPIcondpag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      'SELECT COD_COND_PAG, DESC_COND_PAG FROM COND_PAG')
    Left = 2088
    Top = 104
  end
  object dspConfigAPIcondpag: TDataSetProvider
    DataSet = qrConfigAPIcondpag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2088
    Top = 152
  end
  object cdsConfigAPIcondpag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigAPIcondpag'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 2088
    Top = 200
    object cdsConfigAPIcondpagCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsConfigAPIcondpagDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
  end
  object dsConfigAPIcondpag: TDataSource
    AutoEdit = False
    DataSet = cdsConfigAPIcondpag
    Left = 2088
    Top = 248
  end
  object qrCollectionsRag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransConfig
    SQL.Strings = (
      
        'SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.DESCR_PROMOCAO FROM PROMO' +
        'CAO '
      
        'LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_TP' +
        'PRECO AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA '
      
        'WHERE PROMOCAO.COD_PROMOCAO = :COD_PROMOCAO AND PROMOCAO.COD_EMP' +
        'RESA = :COD_EMPRESA '
      'AND PROMOCAO.COD_PROMOCAO > 0 AND TIPO_PRECO.TIPO = '#39'P'#39)
    Left = 1856
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_PROMOCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspCollectionsRag: TDataSetProvider
    DataSet = qrCollectionsRag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1856
    Top = 360
  end
  object cdsCollectionsRag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCollectionsRag'
    BeforeOpen = cdsMenusBeforeOpen
    Left = 1856
    Top = 408
    object IntegerField13: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField13: TStringField
      DisplayLabel = 'Collection'
      FieldName = 'COLLECTION_RAG'
      Size = 50
    end
  end
  object dsCollectionsRag: TDataSource
    AutoEdit = False
    DataSet = cdsCollectionsRag
    Left = 1856
    Top = 456
  end
end
