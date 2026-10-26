object dtmOrdemCarregamento: TdtmOrdemCarregamento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 718
  Width = 1032
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
  object qrSetor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select setor.*, c.nome_vendedor from setor'
      
        'left join colaborador c on c.cod_vendedor = setor.cod_vendedor a' +
        'nd c.cod_empresa = setor.cod_empresa where setor.cod_setor = 0 a' +
        'nd setor.cod_empresa = 0')
    Left = 33
    Top = 64
  end
  object dspSetor: TDataSetProvider
    DataSet = qrSetor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 33
    Top = 112
  end
  object cdsSetor: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSetor'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 33
    Top = 160
    object cdsSetorCOD_SETOR: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsSetorSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsSetorNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsSetorCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsSetorCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSetorATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsSetor: TDataSource
    AutoEdit = False
    DataSet = cdsSetor
    Left = 33
    Top = 208
  end
  object qrLocalidade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select localidade.*, s.setor, c.nome_vendedor, i.nome_cidade, e.' +
        'sigla_uf from localidade'
      
        'inner join setor s on s.cod_setor = localidade.cod_setor and s.c' +
        'od_empresa = localidade.cod_empresa'
      
        'left join colaborador c on c.cod_vendedor = s.cod_vendedor and c' +
        '.cod_empresa = s.cod_empresa'
      'left join cidades i on i.cod_cidade = localidade.cod_cidade'
      'left join estados e on e.codigo_uf = localidade.cod_estado'
      
        'where localidade.cod_localidade = 0 and localidade.cod_empresa =' +
        ' 0')
    Left = 115
    Top = 64
  end
  object dspLocalidade: TDataSetProvider
    DataSet = qrLocalidade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 115
    Top = 112
  end
  object cdsLocalidade: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLocalidade'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 115
    Top = 160
    object cdsLocalidadeCOD_LOCALIDADE: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_LOCALIDADE'
      Required = True
    end
    object cdsLocalidadeLOCALIDADE: TStringField
      Tag = 2
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsLocalidadeSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsLocalidadeNOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor do Setor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsLocalidadeNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsLocalidadeSIGLA_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsLocalidadeCOD_SETOR: TIntegerField
      DisplayLabel = 'Codigo Setor'
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsLocalidadeCOD_CIDADE: TIntegerField
      DisplayLabel = 'Codigo Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsLocalidadeCOD_ESTADO: TIntegerField
      DisplayLabel = 'Codigo Estado'
      FieldName = 'COD_ESTADO'
    end
    object cdsLocalidadeCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLocalidadeATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsLocalidade: TDataSource
    AutoEdit = False
    DataSet = cdsLocalidade
    Left = 115
    Top = 208
  end
  object qrColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cod_vendedor, nome_vendedor from colaborador'
      'where cod_vendedor = 0 and cod_empresa = 0')
    Left = 33
    Top = 264
  end
  object dspColab: TDataSetProvider
    DataSet = qrColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 33
    Top = 312
  end
  object cdsColab: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspColab'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 33
    Top = 360
    object cdsColabCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColabNOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsColab: TDataSource
    AutoEdit = False
    DataSet = cdsColab
    Left = 33
    Top = 408
  end
  object qrSetorCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select setor.*, c.nome_vendedor from setor'
      
        'left join colaborador c on c.cod_vendedor = setor.cod_vendedor a' +
        'nd c.cod_empresa = setor.cod_empresa where setor.cod_setor = 0 a' +
        'nd setor.cod_empresa = 0')
    Left = 113
    Top = 264
  end
  object dspSetorCons: TDataSetProvider
    DataSet = qrSetorCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 113
    Top = 312
  end
  object cdsSetorCons: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSetorCons'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 113
    Top = 360
    object cdsSetorConsCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsSetorConsSETOR: TStringField
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsSetorConsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSetorConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsSetorConsATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsSetorConsNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsSetorCons: TDataSource
    AutoEdit = False
    DataSet = cdsSetorCons
    Left = 113
    Top = 408
  end
  object qrCid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cod_cidade, nome_cidade from cidades where cod_cidade = 0')
    Left = 198
    Top = 264
  end
  object dspCid: TDataSetProvider
    DataSet = qrCid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 198
    Top = 312
  end
  object cdsCid: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCid'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 198
    Top = 360
    object cdsCidCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object cdsCidNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
  end
  object dsCid: TDataSource
    AutoEdit = False
    DataSet = cdsCid
    Left = 198
    Top = 408
  end
  object qrEst: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select codigo_uf, sigla_uf from estados where codigo_uf = 0')
    Left = 289
    Top = 264
  end
  object dspEst: TDataSetProvider
    DataSet = qrEst
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 289
    Top = 312
  end
  object cdsEst: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEst'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 289
    Top = 360
    object cdsEstCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsEstSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
  end
  object dsEst: TDataSource
    AutoEdit = False
    DataSet = cdsEst
    Left = 289
    Top = 408
  end
  object qrVeicTr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select veiculos_transporte.*, c.nome_vendedor from veiculos_tran' +
        'sporte'
      
        'left join colaborador c on c.cod_vendedor = veiculos_transporte.' +
        'cod_vendedor and c.cod_empresa = veiculos_transporte.cod_empresa'
      
        'where veiculos_transporte.cod_veic = 0 and veiculos_transporte.c' +
        'od_empresa = 0')
    Left = 198
    Top = 64
  end
  object dspVeicTr: TDataSetProvider
    DataSet = qrVeicTr
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 198
    Top = 112
  end
  object cdsVeicTr: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVeicTr'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 198
    Top = 160
    object cdsVeicTrCOD_VEIC: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_VEIC'
      Required = True
    end
    object cdsVeicTrPLACA: TStringField
      Tag = 2
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 7
    end
    object cdsVeicTrMODELO: TStringField
      Tag = 2
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 64
    end
    object cdsVeicTrPESO_MAXIMO: TFloatField
      Tag = 2
      DisplayLabel = 'Peso M'#225'ximo'
      FieldName = 'PESO_MAXIMO'
      DisplayFormat = '#0.00'
    end
    object cdsVeicTrNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsVeicTrCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsVeicTrATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsVeicTrCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsVeicTrTARA: TFloatField
      DisplayLabel = 'Tara'
      FieldName = 'TARA'
      DisplayFormat = '#0.00'
    end
    object cdsVeicTrCAPM3: TFloatField
      DisplayLabel = 'Capacidade M'#225'x em Metros C'#250'bicos'
      FieldName = 'CAPM3'
      DisplayFormat = '#0.00'
    end
    object cdsVeicTrREBOQUE: TStringField
      DisplayLabel = 'Ve'#237'culo de Reboque'
      FieldName = 'REBOQUE'
      Size = 1
    end
    object cdsVeicTrTERCEIRO: TStringField
      DisplayLabel = 'Veiculo de Terceiro?'
      FieldName = 'TERCEIRO'
      Size = 1
    end
    object cdsVeicTrRNTRC_TERCEIRO: TIntegerField
      DisplayLabel = 'RNTRC do Terceiro'
      FieldName = 'RNTRC_TERCEIRO'
    end
    object cdsVeicTrCOD_PROP_TERCEIRO: TIntegerField
      DisplayLabel = 'C'#243'digo do Terceiro'
      FieldName = 'COD_PROP_TERCEIRO'
    end
    object cdsVeicTrTPPROP_TERCEIRO: TSmallintField
      DisplayLabel = 'Tipo Proprietario'
      FieldName = 'TPPROP_TERCEIRO'
    end
    object cdsVeicTrTPROD: TSmallintField
      DisplayLabel = 'Tipo de Rodado'
      FieldName = 'TPROD'
    end
    object cdsVeicTrTPCAR: TSmallintField
      DisplayLabel = 'Tipo de Carroceria'
      FieldName = 'TPCAR'
    end
    object cdsVeicTrUF_LICENCIADO: TStringField
      DisplayLabel = 'UF em que veiculo esta licenciado'
      FieldName = 'UF_LICENCIADO'
      Size = 2
    end
  end
  object dsVeicTr: TDataSource
    AutoEdit = False
    DataSet = cdsVeicTr
    Left = 198
    Top = 208
  end
  object qrCarga: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'Select c.*, setor.setor, veiculos_transporte.modelo, m.nome_vend' +
        'edor, f.nome_vendedor nome_vendedor_f, e.nome_vendedor nome_vend' +
        'edor_e from carga c'
      
        'left join setor on setor.cod_setor = c.cod_setor and setor.cod_e' +
        'mpresa = c.cod_setor'
      
        'left join veiculos_transporte on veiculos_transporte.cod_veic = ' +
        'c.cod_veic and veiculos_transporte.cod_empresa = c.cod_empresa'
      
        'left join colaborador m on m.cod_vendedor = c.cod_motorista and ' +
        'm.cod_empresa = c.cod_empresa'
      
        'left join colaborador f on f.cod_vendedor = c.cod_faturista and ' +
        'f.cod_empresa = c.cod_empresa'
      
        'left join colaborador e on e.cod_vendedor = c.cod_conferente and' +
        ' e.cod_empresa = c.cod_empresa'
      'where c.cod_carga = 0 and c.cod_empresa = 0')
    Left = 289
    Top = 64
  end
  object dspCarga: TDataSetProvider
    DataSet = qrCarga
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 289
    Top = 112
  end
  object cdsCarga: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCarga'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 289
    Top = 160
    object cdsCargaCOD_CARGA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CARGA'
      Required = True
    end
    object cdsCargaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsCargaSTATUS: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object cdsCargaAJUDANTES: TMemoField
      DisplayLabel = 'Ajudantes'
      FieldName = 'AJUDANTES'
      OnGetText = cdsCargaAJUDANTESGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsCargaDATA_CADASTRO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCargaDATA_CARREGAMENTO: TDateTimeField
      DisplayLabel = 'Data Carregamento'
      FieldName = 'DATA_CARREGAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCargaDATA_FECHAMENTO: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECHAMENTO'
    end
    object cdsCargaPESO_MAX: TFloatField
      DisplayLabel = 'Peso M'#225'ximo'
      FieldName = 'PESO_MAX'
    end
    object cdsCargaPESO_CARGA: TFloatField
      DisplayLabel = 'Peso da Carga'
      FieldName = 'PESO_CARGA'
    end
    object cdsCargaTIPO_ENTREGA: TStringField
      DisplayLabel = 'Tipo Entrega'
      FieldName = 'TIPO_ENTREGA'
    end
    object cdsCargaSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsCargaMODELO: TStringField
      DisplayLabel = 'Ve'#237'culo Transporte'
      FieldName = 'MODELO'
      Size = 64
    end
    object cdsCargaNOME_VENDEDOR: TStringField
      DisplayLabel = 'Motorista'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsCargaNOME_VENDEDOR_F: TStringField
      DisplayLabel = 'Faturista'
      FieldName = 'NOME_VENDEDOR_F'
      Size = 35
    end
    object cdsCargaNOME_VENDEDOR_E: TStringField
      DisplayLabel = 'Conferente'
      FieldName = 'NOME_VENDEDOR_E'
      Size = 35
    end
    object cdsCargaCOD_SETOR: TIntegerField
      DisplayLabel = 'Codigo Setor'
      FieldName = 'COD_SETOR'
    end
    object cdsCargaCOD_VEIC: TIntegerField
      DisplayLabel = 'Codigo Ve'#237'culo'
      DisplayWidth = 10
      FieldName = 'COD_VEIC'
    end
    object cdsCargaCOD_MOTORISTA: TIntegerField
      DisplayLabel = 'Codigo Motorista'
      FieldName = 'COD_MOTORISTA'
    end
    object cdsCargaCOD_FATURISTA: TIntegerField
      DisplayLabel = 'Codigo Faturista'
      FieldName = 'COD_FATURISTA'
    end
    object cdsCargaCOD_CONFERENTE: TIntegerField
      DisplayLabel = 'Codigo Conferente'
      FieldName = 'COD_CONFERENTE'
    end
    object cdsCargaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargaPESO_ENTREGUE: TFloatField
      DisplayLabel = 'Peso Entregue'
      FieldName = 'PESO_ENTREGUE'
    end
    object cdsCargaPESO_PENDENTE: TFloatField
      DisplayLabel = 'Peso Pendente'
      FieldName = 'PESO_PENDENTE'
    end
    object cdsCargaCONFERIR: TStringField
      DisplayLabel = 'Conferir'
      FieldName = 'CONFERIR'
      FixedChar = True
      Size = 1
    end
    object cdsCargaTIPO_CARGA: TStringField
      DisplayLabel = 'S/D'
      FieldName = 'TIPO_CARGA'
      FixedChar = True
      Size = 1
    end
    object cdsCargaSTATUS_FIN: TStringField
      DisplayLabel = 'Status Financeiro'
      FieldName = 'STATUS_FIN'
    end
    object cdsCargaDATA_SAIDA: TDateTimeField
      DisplayLabel = 'Data Da'#237'da'
      FieldName = 'DATA_SAIDA'
      DisplayFormat = '##0.00'
    end
    object cdsCargaCOD_ROTA: TIntegerField
      DisplayLabel = 'Cod Rota'
      FieldName = 'COD_ROTA'
    end
  end
  object dsCarga: TDataSource
    AutoEdit = False
    DataSet = cdsCarga
    Left = 289
    Top = 208
  end
  object qrCargaIt: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cg.*,'
      '0 prec_cus_prod,'
      '0 prec_cusm_prod,'
      '0 prec_tab_prod,'
      '0 prec_publico,'
      '0 prec_30_prod,'
      '0 prec_60_prod,'
      '0 prec_90_prod,'
      '0 est_f from carga_item cg '
      'where cg.cod_carga = 0  and cg.cod_empresa = 0 and cg.nitem = 0')
    Left = 385
    Top = 64
  end
  object dspCargaIt: TDataSetProvider
    DataSet = qrCargaIt
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 385
    Top = 112
  end
  object cdsCargaIt: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCargaIt'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 385
    Top = 160
    object cdsCargaItCOD_CARGA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CARGA'
      Required = True
    end
    object cdsCargaItCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargaItNITEM: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsCargaItNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Mercadoria'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsCargaItDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsCargaItQUANTIDADE_VENDA: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE_VENDA'
      DisplayFormat = '#0.000000'
    end
    object cdsCargaItPESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_TOTAL'
      EditFormat = '#0.000'
    end
    object cdsCargaItNUM_VENDA: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NUM_VENDA'
      Required = True
    end
    object cdsCargaItGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCargaItCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCargaItCOD_VENDA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Venda'
      FieldName = 'COD_VENDA'
      Required = True
    end
    object cdsCargaItNITEM_VENDA: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#186' Item Venda'
      FieldName = 'NITEM_VENDA'
    end
    object cdsCargaItTIPO_VENDA: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA'
      Required = True
      Size = 3
    end
    object cdsCargaItPESO_UN: TFloatField
      Tag = 1
      DisplayLabel = 'Peso Unit'#225'rio'
      FieldName = 'PESO_UN'
      EditFormat = '#0.000'
    end
    object cdsCargaItENTREGUE: TStringField
      Tag = 1
      DisplayLabel = 'Entregue'
      FieldName = 'ENTREGUE'
      FixedChar = True
      Size = 1
    end
    object cdsCargaItSEL: TStringField
      Tag = 1
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCargaItPEND: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'PEND'
      Size = 1
    end
    object cdsCargaItPREC_CUS_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PREC_CUS_PROD'
    end
    object cdsCargaItPREC_CUSM_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsCargaItPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o de Tabela'
      FieldName = 'PREC_TAB_PROD'
    end
    object cdsCargaItPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o de Atacado'
      FieldName = 'PREC_PUBLICO'
    end
    object cdsCargaItPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
    end
    object cdsCargaItPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
    end
    object cdsCargaItPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
    end
    object cdsCargaItEST_F: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
    end
  end
  object dsCargaIt: TDataSource
    AutoEdit = False
    DataSet = cdsCargaIt
    Left = 385
    Top = 208
  end
  object qrCargaItH: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from carga_item_historico where cod_carga = 0  and cod_' +
        'empresa = 0 and nitem = 0 and nitem_h = 0')
    Left = 489
    Top = 64
  end
  object dspCargaItH: TDataSetProvider
    DataSet = qrCargaItH
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 489
    Top = 112
  end
  object cdsCargaItH: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCargaItH'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 489
    Top = 160
    object cdsCargaItHCOD_CARGA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CARGA'
      Required = True
    end
    object cdsCargaItHCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargaItHNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsCargaItHNITEM_H: TIntegerField
      DisplayLabel = 'N'#186' Item Hist'
      FieldName = 'NITEM_H'
      Required = True
    end
    object cdsCargaItHQUANTIDADE_ENTREGUE: TFloatField
      DisplayLabel = 'Qtde Entregue'
      FieldName = 'QUANTIDADE_ENTREGUE'
      DisplayFormat = '#0.000000'
    end
    object cdsCargaItHTIPO_ENTREGA: TStringField
      DisplayLabel = 'Tipo Entrega'
      FieldName = 'TIPO_ENTREGA'
      FixedChar = True
      Size = 1
    end
    object cdsCargaItHDATA_ENTREGA: TDateTimeField
      DisplayLabel = 'Data Entrega'
      FieldName = 'DATA_ENTREGA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCargaItHDATA_CARREGAMENTO: TDateTimeField
      DisplayLabel = 'Data de carregamento'
      FieldName = 'DATA_CARREGAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCargaItHDATA_HORA_CARREGAMENTO: TDateTimeField
      DisplayLabel = 'Hora de carregamento'
      FieldName = 'DATA_HORA_CARREGAMENTO'
      OnGetText = cdsCargaItHDATA_HORA_CARREGAMENTOGetText
      EditMask = '!90:00:00;1;_'
    end
    object cdsCargaItHCOD_ENTREGA: TIntegerField
      DisplayLabel = 'Num Entrega'
      FieldName = 'COD_ENTREGA'
    end
  end
  object dsCargaItH: TDataSource
    AutoEdit = False
    DataSet = cdsCargaItH
    Left = 489
    Top = 208
  end
  object qrSetorCons2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select setor.*, c.nome_vendedor from setor'
      
        'left join colaborador c on c.cod_vendedor = setor.cod_vendedor a' +
        'nd c.cod_empresa = setor.cod_empresa where setor.cod_setor = 0 a' +
        'nd setor.cod_empresa = 0')
    Left = 385
    Top = 264
  end
  object dspSetorCons2: TDataSetProvider
    DataSet = qrSetorCons2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 385
    Top = 312
  end
  object dsSetorCons2: TDataSource
    AutoEdit = False
    DataSet = cdsSetorCons2
    Left = 385
    Top = 408
  end
  object qrLocalCons2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select localidade.*, s.setor, c.nome_vendedor, i.nome_cidade, e.' +
        'sigla_uf from localidade'
      
        'inner join setor s on s.cod_setor = localidade.cod_setor and s.c' +
        'od_empresa = localidade.cod_empresa'
      
        'left join colaborador c on c.cod_vendedor = s.cod_vendedor and c' +
        '.cod_empresa = s.cod_empresa'
      'left join cidades i on i.cod_cidade = localidade.cod_cidade'
      'left join estados e on e.codigo_uf = localidade.cod_estado'
      
        'where localidade.cod_localidade = 0 and localidade.cod_empresa =' +
        ' 0')
    Left = 491
    Top = 264
  end
  object dspLocalCons2: TDataSetProvider
    DataSet = qrLocalCons2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 491
    Top = 312
  end
  object dsLocalCons2: TDataSource
    AutoEdit = False
    DataSet = cdsLocalCons2
    Left = 491
    Top = 408
  end
  object cdsLocalCons2: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLocalCons2'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 491
    Top = 360
    object cdsLocalCons2COD_LOCALIDADE: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_LOCALIDADE'
      Required = True
    end
    object cdsLocalCons2LOCALIDADE: TStringField
      Tag = 2
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsLocalCons2SETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsLocalCons2NOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor do Setor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsLocalCons2NOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsLocalCons2SIGLA_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsLocalCons2COD_SETOR: TIntegerField
      DisplayLabel = 'Codigo Setor'
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsLocalCons2COD_CIDADE: TIntegerField
      DisplayLabel = 'Codigo Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsLocalCons2COD_ESTADO: TIntegerField
      DisplayLabel = 'Codigo Estado'
      FieldName = 'COD_ESTADO'
    end
    object cdsLocalCons2COD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLocalCons2ATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsLocalCons2SEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
  object cdsSetorCons2: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSetorCons2'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 385
    Top = 360
    object cdsSetorCons2COD_SETOR: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsSetorCons2SETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsSetorCons2NOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsSetorCons2COD_VENDEDOR: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsSetorCons2COD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSetorCons2ATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsSetorCons2SEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
  object qrVeicTrCons2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select veiculos_transporte.*, c.nome_vendedor from veiculos_tran' +
        'sporte'
      
        'left join colaborador c on c.cod_vendedor = veiculos_transporte.' +
        'cod_vendedor and c.cod_empresa = veiculos_transporte.cod_empresa'
      
        'where veiculos_transporte.cod_veic = 0 and veiculos_transporte.c' +
        'od_empresa = 0')
    Left = 598
    Top = 264
  end
  object dspVeicTrCons2: TDataSetProvider
    DataSet = qrVeicTrCons2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 598
    Top = 312
  end
  object cdsVeicTrCons2: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVeicTrCons2'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 598
    Top = 360
    object cdsVeicTrCons2COD_VEIC: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_VEIC'
      Required = True
    end
    object cdsVeicTrCons2PLACA: TStringField
      Tag = 2
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 7
    end
    object cdsVeicTrCons2MODELO: TStringField
      Tag = 2
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 64
    end
    object cdsVeicTrCons2PESO_MAXIMO: TFloatField
      Tag = 2
      DisplayLabel = 'Peso M'#225'ximo'
      FieldName = 'PESO_MAXIMO'
      DisplayFormat = '#0.00'
    end
    object cdsVeicTrCons2NOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsVeicTrCons2COD_VENDEDOR: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsVeicTrCons2ATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsVeicTrCons2COD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object dsVeicTrCons2: TDataSource
    AutoEdit = False
    DataSet = cdsVeicTrCons2
    Left = 598
    Top = 408
  end
  object qrColabCons2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cod_vendedor, nome_vendedor from colaborador'
      'where cod_vendedor = 0 and cod_empresa = 0')
    Left = 697
    Top = 264
  end
  object dspColabCons2: TDataSetProvider
    DataSet = qrColabCons2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 697
    Top = 312
  end
  object cdsColabCons2: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspColabCons2'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 697
    Top = 360
    object cdsColabCons2COD_VENDEDOR: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColabCons2NOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsColabCons2: TDataSource
    AutoEdit = False
    DataSet = cdsColabCons2
    Left = 697
    Top = 408
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
  object qrEntr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select distinct ch.cod_entrega, ch.data_entrega, ch.data_carrega' +
        'mento from carga_item_historico ch'
      'where ch.cod_carga = 0 and ch.cod_empresa = 0')
    Left = 785
    Top = 264
  end
  object dspEntr: TDataSetProvider
    DataSet = qrEntr
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 785
    Top = 312
  end
  object cdsEntr: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEntr'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 785
    Top = 360
    object cdsEntrSEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEntrCOD_ENTREGA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_ENTREGA'
    end
    object cdsEntrDATA_ENTREGA: TDateTimeField
      DisplayLabel = 'Data Entrega'
      FieldName = 'DATA_ENTREGA'
    end
    object cdsEntrDATA_CARREGAMENTO: TDateTimeField
      DisplayLabel = 'Data Carregamento'
      FieldName = 'DATA_CARREGAMENTO'
    end
  end
  object dsEntr: TDataSource
    AutoEdit = False
    DataSet = cdsEntr
    Left = 785
    Top = 408
  end
  object qrCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.cod_cliente, c.nome_cliente, c.razao, c.cpfcgc, c.cod_l' +
        'ocalidade from clientes c where cod_empresa = 0')
    Left = 865
    Top = 264
  end
  object dspCl: TDataSetProvider
    DataSet = qrCl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 865
    Top = 312
  end
  object cdsCl: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCl'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 865
    Top = 360
    object cdsClSEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsClNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClRAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsClCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
  end
  object dsCl: TDataSource
    AutoEdit = False
    DataSet = cdsCl
    Left = 865
    Top = 408
  end
  object cdsClTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 8
    object cdsClTempCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLIENTE'
    end
    object cdsClTempNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsClTempRAZAO: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO'
      Visible = False
      Size = 60
    end
    object cdsClTempCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dsClTemp: TDataSource
    DataSet = cdsClTemp
    Left = 552
    Top = 8
  end
  object qrVendasCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select nf.num_nf num_venda, nf.cod_cliente, cl.nome_cliente, cl.' +
        'razao, nf.data_lanc data_venda, nf.valor_total, nf.cod_nf cod_ve' +
        'nda, '#39'NF'#39' TIPO'
      'from notafiscal nf'
      
        'inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl' +
        '.cod_empresa = nf.cod_empresa'
      'where nf.cod_nf = 0 and nf.cod_empresa = 0')
    Left = 945
    Top = 264
  end
  object dspVendasCons: TDataSetProvider
    DataSet = qrVendasCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 945
    Top = 312
  end
  object cdsVendasCons: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVendasCons'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 945
    Top = 360
    object cdsVendasConsSEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsVendasConsNUM_VENDA: TIntegerField
      DisplayLabel = 'N'#176' Venda'
      FieldName = 'NUM_VENDA'
      Required = True
    end
    object cdsVendasConsNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsVendasConsRAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsVendasConsDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
    end
    object cdsVendasConsVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valot Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '##0.00'
    end
    object cdsVendasConsCOD_VENDA: TIntegerField
      DisplayLabel = 'Cod Venda'
      FieldName = 'COD_VENDA'
      Required = True
    end
    object cdsVendasConsTIPO: TStringField
      DisplayLabel = 'Tipo Venda'
      DisplayWidth = 3
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object cdsVendasConsCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
  end
  object dsVendasCons: TDataSource
    AutoEdit = False
    DataSet = cdsVendasCons
    Left = 945
    Top = 408
  end
  object cdsVndTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 8
    object cdsVndTempNUM_VENDA: TIntegerField
      DisplayLabel = 'N'#176' Venda'
      FieldName = 'NUM_VENDA'
    end
    object cdsVndTempNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsVndTempRAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsVndTempDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
    end
    object cdsVndTempVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valot Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '##0.00'
    end
    object cdsVndTempCOD_VENDA: TIntegerField
      DisplayLabel = 'Cod Venda'
      FieldName = 'COD_VENDA'
    end
    object cdsVndTempTIPO: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsVndTempCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
  end
  object dsVndTemp: TDataSource
    AutoEdit = False
    DataSet = cdsVndTemp
    Left = 712
    Top = 8
  end
  object dsCargaItTemp: TDataSource
    AutoEdit = False
    DataSet = cdsCargaItTemp
    Left = 849
    Top = 8
  end
  object cdsCargaItTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 801
    Top = 8
    object cdsCargaItTempCOD_CARGA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CARGA'
      Required = True
    end
    object cdsCargaItTempCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargaItTempNITEM: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsCargaItTempGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCargaItTempCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCargaItTempNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Mercadoria'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsCargaItTempDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsCargaItTempCOD_VENDA: TIntegerField
      DisplayLabel = 'Codigo Venda'
      FieldName = 'COD_VENDA'
      Required = True
    end
    object cdsCargaItTempNUM_VENDA: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NUM_VENDA'
      Required = True
    end
    object cdsCargaItTempNITEM_VENDA: TIntegerField
      DisplayLabel = 'N'#186' Item Venda'
      FieldName = 'NITEM_VENDA'
    end
    object cdsCargaItTempTIPO_VENDA: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA'
      Required = True
      Size = 3
    end
    object cdsCargaItTempQUANTIDADE_VENDA: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE_VENDA'
      DisplayFormat = '#0.000000'
    end
    object cdsCargaItTempPESO_UN: TFloatField
      DisplayLabel = 'Peso Unit'#225'rio'
      FieldName = 'PESO_UN'
      EditFormat = '#0.000'
    end
    object cdsCargaItTempPESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_TOTAL'
      EditFormat = '#0.000'
    end
    object cdsCargaItTempENTREGUE: TStringField
      DisplayLabel = 'Entregue'
      FieldName = 'ENTREGUE'
      FixedChar = True
      Size = 1
    end
  end
  object qrCargabkp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'Select c.*, setor.setor, veiculos_transporte.modelo, m.nome_vend' +
        'edor, f.nome_vendedor nome_vendedor_f, e.nome_vendedor nome_vend' +
        'edor_e from carga c'
      
        'left join setor on setor.cod_setor = c.cod_setor and setor.cod_e' +
        'mpresa = c.cod_setor'
      
        'left join veiculos_transporte on veiculos_transporte.cod_veic = ' +
        'c.cod_veic and veiculos_transporte.cod_empresa = c.cod_empresa'
      
        'left join colaborador m on m.cod_vendedor = c.cod_motorista and ' +
        'm.cod_empresa = c.cod_empresa'
      
        'left join colaborador f on f.cod_vendedor = c.cod_faturista and ' +
        'f.cod_empresa = c.cod_empresa'
      
        'left join colaborador e on e.cod_vendedor = c.cod_conferente and' +
        ' e.cod_empresa = c.cod_empresa'
      'where c.cod_carga = 0 and c.cod_empresa = 0')
    Left = 577
    Top = 64
  end
  object dspCargabkp: TDataSetProvider
    DataSet = qrCargabkp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 577
    Top = 112
  end
  object cdsCargabkp: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCargabkp'
    Left = 577
    Top = 160
    object cdsCargabkpCOD_CARGA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CARGA'
      Required = True
    end
    object cdsCargabkpDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsCargabkpSTATUS: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object cdsCargabkpAJUDANTES: TMemoField
      DisplayLabel = 'Ajudantes'
      FieldName = 'AJUDANTES'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCargabkpDATA_CADASTRO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
    end
    object cdsCargabkpDATA_CARREGAMENTO: TDateTimeField
      DisplayLabel = 'Data Carregamento'
      FieldName = 'DATA_CARREGAMENTO'
    end
    object cdsCargabkpDATA_FECHAMENTO: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECHAMENTO'
    end
    object cdsCargabkpPESO_MAX: TFloatField
      DisplayLabel = 'Peso M'#225'ximo'
      FieldName = 'PESO_MAX'
    end
    object cdsCargabkpPESO_CARGA: TFloatField
      DisplayLabel = 'Peso da Carga'
      FieldName = 'PESO_CARGA'
    end
    object cdsCargabkpTIPO_ENTREGA: TStringField
      DisplayLabel = 'Tipo Entrega'
      FieldName = 'TIPO_ENTREGA'
    end
    object cdsCargabkpSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsCargabkpMODELO: TStringField
      DisplayLabel = 'Ve'#237'culo Transporte'
      FieldName = 'MODELO'
      Size = 64
    end
    object cdsCargabkpNOME_VENDEDOR: TStringField
      DisplayLabel = 'Motorista'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsCargabkpNOME_VENDEDOR_F: TStringField
      DisplayLabel = 'Faturista'
      FieldName = 'NOME_VENDEDOR_F'
      Size = 35
    end
    object cdsCargabkpNOME_VENDEDOR_E: TStringField
      DisplayLabel = 'Conferente'
      FieldName = 'NOME_VENDEDOR_E'
      Size = 35
    end
    object cdsCargabkpCOD_SETOR: TIntegerField
      DisplayLabel = 'Codigo Setor'
      FieldName = 'COD_SETOR'
    end
    object cdsCargabkpCOD_VEIC: TIntegerField
      DisplayLabel = 'Codigo Ve'#237'culo'
      DisplayWidth = 10
      FieldName = 'COD_VEIC'
    end
    object cdsCargabkpCOD_MOTORISTA: TIntegerField
      DisplayLabel = 'Codigo Motorista'
      FieldName = 'COD_MOTORISTA'
    end
    object cdsCargabkpCOD_FATURISTA: TIntegerField
      DisplayLabel = 'Codigo Faturista'
      FieldName = 'COD_FATURISTA'
    end
    object cdsCargabkpCOD_CONFERENTE: TIntegerField
      DisplayLabel = 'Codigo Conferente'
      FieldName = 'COD_CONFERENTE'
    end
    object cdsCargabkpCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargabkpPESO_ENTREGUE: TFloatField
      DisplayLabel = 'Peso Entregue'
      FieldName = 'PESO_ENTREGUE'
    end
    object cdsCargabkpPESO_PENDENTE: TFloatField
      DisplayLabel = 'Peso Pendente'
      FieldName = 'PESO_PENDENTE'
    end
    object cdsCargabkpCONFERIR: TStringField
      DisplayLabel = 'Conferir'
      FieldName = 'CONFERIR'
      FixedChar = True
      Size = 1
    end
    object cdsCargabkpTIPO_CARGA: TStringField
      DisplayLabel = 'S/D'
      FieldName = 'TIPO_CARGA'
      FixedChar = True
      Size = 1
    end
  end
  object qrCargaItbkp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from carga_item where cod_carga = 0  and cod_empresa = ' +
        '0 and nitem = 0')
    Left = 673
    Top = 64
  end
  object dspCargaItbkp: TDataSetProvider
    DataSet = qrCargaItbkp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 673
    Top = 112
  end
  object cdsCargaItbkp: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCargaIt'
    Left = 673
    Top = 160
    object cdsCargaItbkpCOD_CARGA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CARGA'
      Required = True
    end
    object cdsCargaItbkpCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargaItbkpNITEM: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsCargaItbkpGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCargaItbkpCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCargaItbkpNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Mercadoria'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsCargaItbkpDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsCargaItbkpCOD_VENDA: TIntegerField
      DisplayLabel = 'Codigo Venda'
      FieldName = 'COD_VENDA'
      Required = True
    end
    object cdsCargaItbkpNUM_VENDA: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NUM_VENDA'
      Required = True
    end
    object cdsCargaItbkpNITEM_VENDA: TIntegerField
      DisplayLabel = 'N'#186' Item Venda'
      FieldName = 'NITEM_VENDA'
    end
    object cdsCargaItbkpTIPO_VENDA: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA'
      Required = True
      Size = 3
    end
    object cdsCargaItbkpQUANTIDADE_VENDA: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE_VENDA'
      DisplayFormat = '#0.000000'
    end
    object cdsCargaItbkpPESO_UN: TFloatField
      DisplayLabel = 'Peso Unit'#225'rio'
      FieldName = 'PESO_UN'
      EditFormat = '#0.000'
    end
    object cdsCargaItbkpPESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_TOTAL'
      EditFormat = '#0.000'
    end
    object cdsCargaItbkpENTREGUE: TStringField
      DisplayLabel = 'Entregue'
      FieldName = 'ENTREGUE'
      FixedChar = True
      Size = 1
    end
    object cdsCargaItbkpSEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCargaItbkpPEND: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PEND'
      Size = 1
    end
  end
  object qrCargaItHbkp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from carga_item_historico where cod_carga = 0  and cod_' +
        'empresa = 0 and nitem = 0 and nitem_h = 0')
    Left = 777
    Top = 64
  end
  object dspCargaItHbkp: TDataSetProvider
    DataSet = qrCargaItHbkp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 777
    Top = 112
  end
  object cdsCargaItHbkp: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCargaItH'
    Left = 777
    Top = 160
    object cdsCargaItHbkpCOD_CARGA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CARGA'
      Required = True
    end
    object cdsCargaItHbkpCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargaItHbkpNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsCargaItHbkpNITEM_H: TIntegerField
      DisplayLabel = 'N'#186' Item Hist'
      FieldName = 'NITEM_H'
      Required = True
    end
    object cdsCargaItHbkpQUANTIDADE_ENTREGUE: TFloatField
      DisplayLabel = 'Qtde Entregue'
      FieldName = 'QUANTIDADE_ENTREGUE'
      DisplayFormat = '#0.000000'
    end
    object cdsCargaItHbkpTIPO_ENTREGA: TStringField
      DisplayLabel = 'Tipo Entrega'
      FieldName = 'TIPO_ENTREGA'
      FixedChar = True
      Size = 1
    end
    object cdsCargaItHbkpDATA_ENTREGA: TDateTimeField
      DisplayLabel = 'Data Entrega'
      FieldName = 'DATA_ENTREGA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCargaItHbkpDATA_CARREGAMENTO: TDateTimeField
      DisplayLabel = 'Data de carregamento'
      FieldName = 'DATA_CARREGAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCargaItHbkpDATA_HORA_CARREGAMENTO: TDateTimeField
      DisplayLabel = 'Hora de carregamento'
      FieldName = 'DATA_HORA_CARREGAMENTO'
      EditMask = '!90:00:00;1;_'
    end
    object cdsCargaItHbkpCOD_ENTREGA: TIntegerField
      DisplayLabel = 'Num Entrega'
      FieldName = 'COD_ENTREGA'
    end
  end
  object cdsTempSoma: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 952
    Top = 8
    object cdsTempSomaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsTempSomaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsTempSomaVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object qrTerc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.cod_cliente, c.nome_cliente, c.razao, c.cpfcgc from cli' +
        'entes c where cod_empresa = 0 and cod_cliente = 0')
    Left = 881
    Top = 64
  end
  object dspTerc: TDataSetProvider
    DataSet = qrTerc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 881
    Top = 112
  end
  object cdsTerc: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTerc'
    BeforeOpen = cdsSetorBeforeOpen
    Left = 881
    Top = 160
    object cdsTercNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsTercRAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsTercCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsTercCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dsTerc: TDataSource
    AutoEdit = False
    DataSet = cdsTerc
    Left = 881
    Top = 208
  end
  object rdpOrdem: TRDprint
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
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
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
      'GENERIC=EPSON'
      'TEXT=EPSON'
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
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 576
    Top = 216
  end
end
