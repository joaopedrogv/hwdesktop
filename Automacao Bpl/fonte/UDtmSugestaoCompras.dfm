object dtmSugestaoCompras: TdtmSugestaoCompras
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 563
  Width = 1078
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 32
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
  object IBTransSugestao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 189
    Top = 14
  end
  object qrPedidoCompra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      
        'SELECT PEDIDO.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES' +
        '.ENDERECO, CLIENTES.FONE_CLIENTE, CLIENTES.EMAIL, '
      
        'CIDADES.NOME_CIDADE, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM PED' +
        'IDO '
      
        'LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = PEDIDO.CODIGO_F AND' +
        ' CLIENTES.COD_EMPRESA = PEDIDO.COD_EMPRESA '
      'LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE '
      
        'LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD' +
        '_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '
      
        'LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SE' +
        'TOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA where 1=0')
    Left = 41
    Top = 66
  end
  object dspPedidoCompra: TDataSetProvider
    DataSet = qrPedidoCompra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 41
    Top = 117
  end
  object CdsPedidoCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidoCompra'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 41
    Top = 168
    object CdsPedidoCompraNUM_PED: TIntegerField
      DisplayLabel = 'Num Pedido'
      FieldName = 'NUM_PED'
      Required = True
    end
    object CdsPedidoCompraCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object CdsPedidoCompraCODIGO_F: TIntegerField
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'CODIGO_F'
      Required = True
    end
    object CdsPedidoCompraCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object CdsPedidoCompraDATA_PED: TDateTimeField
      DisplayLabel = 'Data Pedido'
      FieldName = 'DATA_PED'
      EditMask = '!99/99/0000;1;_'
    end
    object CdsPedidoCompraDATA_ENV_PED: TDateTimeField
      DisplayLabel = 'Data Envio Pedido'
      FieldName = 'DATA_ENV_PED'
      EditMask = '!99/99/0000;1;_'
    end
    object CdsPedidoCompraTIPO_PED: TStringField
      DisplayLabel = 'Tipo Pedido'
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 7
    end
    object CdsPedidoCompraSTATUS_PED: TStringField
      DisplayLabel = 'Status do Pedido'
      FieldName = 'STATUS_PED'
      FixedChar = True
      Size = 10
    end
    object CdsPedidoCompraDATA_CHG_PED: TDateTimeField
      DisplayLabel = 'Data Chegada Pedido'
      FieldName = 'DATA_CHG_PED'
      EditMask = '!99/99/0000;1;_'
    end
    object CdsPedidoCompraVAL_TOT_PED: TFloatField
      DisplayLabel = 'Valor Total Pedido'
      FieldName = 'VAL_TOT_PED'
      DisplayFormat = 'R$.00'
    end
    object CdsPedidoCompraATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object CdsPedidoCompraADD_PRODUCAO: TStringField
      DisplayLabel = 'A Produzir'
      FieldName = 'ADD_PRODUCAO'
      Size = 1
    end
    object CdsPedidoCompraSTATUS_PRODUCAO: TStringField
      DisplayLabel = 'Status Produ'#231#227'o'
      FieldName = 'STATUS_PRODUCAO'
      Size = 10
    end
    object CdsPedidoCompraNUM_PRODUCAO: TIntegerField
      DisplayLabel = 'Numero Producao'
      FieldName = 'NUM_PRODUCAO'
    end
    object CdsPedidoCompraCOD_EMPRESA_PRODUCAO: TIntegerField
      DisplayLabel = 'Empresa a Produzir'
      FieldName = 'COD_EMPRESA_PRODUCAO'
    end
    object CdsPedidoCompraCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object CdsPedidoCompraFORMPAG: TBlobField
      Tag = 1
      FieldName = 'FORMPAG'
      Visible = False
      Size = 8
    end
    object CdsPedidoCompraVLFORMPAG: TBlobField
      Tag = 1
      FieldName = 'VLFORMPAG'
      Visible = False
      Size = 8
    end
    object CdsPedidoCompraFRETE_BASE_IPI: TStringField
      Tag = 1
      FieldName = 'FRETE_BASE_IPI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsPedidoCompraIPI_BASE_ICM: TStringField
      Tag = 1
      FieldName = 'IPI_BASE_ICM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsPedidoCompraNUM_COTACAO: TIntegerField
      DisplayLabel = 'Num Cotacao'
      FieldName = 'NUM_COTACAO'
    end
    object CdsPedidoCompraOBS: TMemoField
      DisplayLabel = 'Observacao'
      FieldName = 'OBS'
      OnGetText = CdsPedidoCompraOBSGetText
      BlobType = ftMemo
      Size = 8
    end
    object CdsPedidoCompraRAZAO: TStringField
      DisplayLabel = 'Nome Fornecedor (Razao Social)'
      FieldName = 'RAZAO'
      Size = 60
    end
    object CdsPedidoCompraNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fornecedor (Nome Fantasia)'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object CdsPedidoCompraENDERECO: TStringField
      DisplayLabel = 'Endereco Fornecedor'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsPedidoCompraFONE_CLIENTE: TStringField
      DisplayLabel = 'Telefone Fornecedor'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object CdsPedidoCompraEMAIL: TStringField
      DisplayLabel = 'Email Fornecedor'
      FieldName = 'EMAIL'
      Size = 256
    end
    object CdsPedidoCompraNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object CdsPedidoCompraLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object CdsPedidoCompraSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
  end
  object dsPedidoCompra: TDataSource
    DataSet = CdsPedidoCompra
    Left = 41
    Top = 220
  end
  object IBTransPedido: TIBTransaction
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 105
    Top = 14
  end
  object qrItensPedido: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      'select ip.*, p.num_fab_prod,  p.vl_ult_compra, '
      
        '(coalesce(ip.quant_it_prod, 0) * coalesce(p.peso_liq_prod,  0)) ' +
        'peso_liq_prod,'
      
        '(coalesce(ip.quant_it_prod, 0) * coalesce(p.peso_brut_prod,  0))' +
        ' peso_brut_prod,'
      'p.locacao_prod, p.locacao_prod_1,'
      
        'g.descricao from item_pedido ip left join produtos p on ip.grupo' +
        '_prod=p.grupo_prod'
      'and ip.cod_prod=p.cod_prod and ip.cod_empresa=p.cod_empresa'
      
        'left join grade g on ip.cod_grade=g.cod_grade and ip.cod_empresa' +
        '=g.cod_empresa'
      'where ip.cod_empresa=-1')
    Left = 142
    Top = 66
    object qrItensPedidoNUM_PED: TIntegerField
      FieldName = 'NUM_PED'
      Origin = '"ITEM_PEDIDO"."NUM_PED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrItensPedidoNITEM: TIntegerField
      FieldName = 'NITEM'
      Origin = '"ITEM_PEDIDO"."NITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrItensPedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"ITEM_PEDIDO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrItensPedidoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"ITEM_PEDIDO"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrItensPedidoCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"ITEM_PEDIDO"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrItensPedidoCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = '"ITEM_PEDIDO"."COD_GRADE"'
    end
    object qrItensPedidoDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"ITEM_PEDIDO"."DESCR_PROD"'
      Size = 60
    end
    object qrItensPedidoQUANT_IT_PROD: TFloatField
      FieldName = 'QUANT_IT_PROD'
      Origin = '"ITEM_PEDIDO"."QUANT_IT_PROD"'
    end
    object qrItensPedidoQUANT_PEN_IT: TFloatField
      FieldName = 'QUANT_PEN_IT'
      Origin = '"ITEM_PEDIDO"."QUANT_PEN_IT"'
    end
    object qrItensPedidoQUANT_MIN_IT: TFloatField
      FieldName = 'QUANT_MIN_IT'
      Origin = '"ITEM_PEDIDO"."QUANT_MIN_IT"'
    end
    object qrItensPedidoVAL_UNT_IT: TFloatField
      FieldName = 'VAL_UNT_IT'
      Origin = '"ITEM_PEDIDO"."VAL_UNT_IT"'
    end
    object qrItensPedidoVAL_TOT_IT: TFloatField
      FieldName = 'VAL_TOT_IT'
      Origin = '"ITEM_PEDIDO"."VAL_TOT_IT"'
    end
    object qrItensPedidoVL_V_EMP: TFloatField
      FieldName = 'VL_V_EMP'
      Origin = '"ITEM_PEDIDO"."VL_V_EMP"'
    end
    object qrItensPedidoVL_V_HONDA: TFloatField
      FieldName = 'VL_V_HONDA'
      Origin = '"ITEM_PEDIDO"."VL_V_HONDA"'
    end
    object qrItensPedidoATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"ITEM_PEDIDO"."ATIVO"'
    end
    object qrItensPedidoMVA: TFloatField
      FieldName = 'MVA'
      Origin = '"ITEM_PEDIDO"."MVA"'
    end
    object qrItensPedidoIPI: TFloatField
      FieldName = 'IPI'
      Origin = '"ITEM_PEDIDO"."IPI"'
    end
    object qrItensPedidoFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = '"ITEM_PEDIDO"."FRETE"'
    end
    object qrItensPedidoVALOR_ICMSUB: TFloatField
      FieldName = 'VALOR_ICMSUB'
      Origin = '"ITEM_PEDIDO"."VALOR_ICMSUB"'
    end
    object qrItensPedidoPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
      Origin = '"ITEM_PEDIDO"."PERC_IPI"'
    end
    object qrItensPedidoPERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
      Origin = '"ITEM_PEDIDO"."PERC_FRETE"'
    end
    object qrItensPedidoNUM_COTACAO: TIntegerField
      FieldName = 'NUM_COTACAO'
      Origin = '"ITEM_PEDIDO"."NUM_COTACAO"'
    end
    object qrItensPedidoCOD_SUGESTAO: TIntegerField
      FieldName = 'COD_SUGESTAO'
      Origin = '"ITEM_PEDIDO"."COD_SUGESTAO"'
    end
    object qrItensPedidoCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
      Origin = '"ITEM_PEDIDO"."COD_EMP_MULT"'
    end
    object qrItensPedidoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRADE"."DESCRICAO"'
      ProviderFlags = []
      Size = 32
    end
    object qrItensPedidoVL_ULT_COMPRA: TFloatField
      FieldName = 'VL_ULT_COMPRA'
      Origin = '"PRODUTOS"."VL_ULT_COMPRA"'
      ProviderFlags = []
    end
    object qrItensPedidoNUM_FAB_PROD: TIBStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PRODUTOS"."NUM_FAB_PROD"'
      ProviderFlags = []
      FixedChar = True
    end
    object qrItensPedidoPESO_LIQ_PROD: TFloatField
      FieldName = 'PESO_LIQ_PROD'
      ProviderFlags = []
    end
    object qrItensPedidoPESO_BRUT_PROD: TFloatField
      FieldName = 'PESO_BRUT_PROD'
      ProviderFlags = []
    end
    object qrItensPedidoLOCACAO_PROD: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrItensPedidoLOCACAO_PROD_1: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
  end
  object dspItensPedido: TDataSetProvider
    DataSet = qrItensPedido
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 142
    Top = 117
  end
  object CdsItensPedido: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItensPedido'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 142
    Top = 168
    object CdsItensPedidoNUM_PED: TIntegerField
      DisplayLabel = 'Num. Pedido'
      FieldName = 'NUM_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsItensPedidoNITEM: TIntegerField
      DisplayLabel = 'Num. Item'
      FieldName = 'NITEM'
      Required = True
    end
    object CdsItensPedidoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsItensPedidoCOD_PROD: TStringField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'COD_PROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object CdsItensPedidoCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod. Grade'
      FieldName = 'COD_GRADE'
    end
    object CdsItensPedidoDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o do produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 60
    end
    object CdsItensPedidoQUANT_IT_PROD: TFloatField
      DisplayLabel = 'Quantidade Item'
      FieldName = 'QUANT_IT_PROD'
      DisplayFormat = '#0.0000'
    end
    object CdsItensPedidoQUANT_PEN_IT: TFloatField
      DisplayLabel = 'Quantidade Pendente Item'
      FieldName = 'QUANT_PEN_IT'
      DisplayFormat = '#0.0000'
    end
    object CdsItensPedidoQUANT_MIN_IT: TFloatField
      DisplayLabel = 'Quantidade M'#237'nima do Item'
      FieldName = 'QUANT_MIN_IT'
      DisplayFormat = '#0.0000'
    end
    object CdsItensPedidoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsItensPedidoVAL_UNT_IT: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio do Item'
      FieldName = 'VAL_UNT_IT'
      DisplayFormat = '#0.000'
    end
    object CdsItensPedidoVAL_TOT_IT: TFloatField
      DisplayLabel = 'Valor Total do Item'
      FieldName = 'VAL_TOT_IT'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoVL_V_EMP: TFloatField
      DisplayLabel = 'Valor de Venda do Item'
      FieldName = 'VL_V_EMP'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoVL_V_HONDA: TFloatField
      DisplayLabel = 'Valor de Venda Honda'
      FieldName = 'VL_V_HONDA'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object CdsItensPedidoMVA: TFloatField
      FieldName = 'MVA'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoPERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoIPI: TFloatField
      FieldName = 'IPI'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoFRETE: TFloatField
      FieldName = 'FRETE'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoVALOR_ICMSUB: TFloatField
      FieldName = 'VALOR_ICMSUB'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoNUM_COTACAO: TIntegerField
      DisplayLabel = 'Num Cotacao'
      FieldName = 'NUM_COTACAO'
    end
    object CdsItensPedidoCOD_SUGESTAO: TIntegerField
      DisplayLabel = 'Cod Sugestao'
      FieldName = 'COD_SUGESTAO'
    end
    object CdsItensPedidoCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Emp'
      FieldName = 'COD_EMP_MULT'
    end
    object CdsItensPedidoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Grade'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 32
    end
    object CdsItensPedidoVL_ULT_COMPRA: TFloatField
      DisplayLabel = 'Vl Ult Compra'
      FieldName = 'VL_ULT_COMPRA'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object CdsItensPedidoPESO_LIQ_PROD: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESO_LIQ_PROD'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoPESO_BRUT_PROD: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUT_PROD'
      DisplayFormat = '#0.00'
    end
    object CdsItensPedidoLOCACAO_PROD: TStringField
      DisplayLabel = 'Loca'#231#227'o'
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object CdsItensPedidoLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Loca'#231#227'o 1'
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
  end
  object dsItensPedido: TDataSource
    DataSet = CdsItensPedido
    Left = 142
    Top = 220
  end
  object dsLocVendedor: TDataSource
    DataSet = qrLocVendedor
    Left = 38
    Top = 364
  end
  object qrLocVendedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      'SELECT * FROM COLABORADOR where 1=0')
    Left = 38
    Top = 314
    object qrLocVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"COLABORADOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocVendedorNOME_VENDEDOR: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsLocFornecedor: TDataSource
    DataSet = qrLocFornecedor
    Left = 129
    Top = 364
  end
  object qrLocFornecedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      'SELECT * FROM CLIENTES where 1=0')
    Left = 129
    Top = 314
    object qrLocFornecedorCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocFornecedorNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
  end
  object qrBuscasPedido: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      '')
    Left = 225
    Top = 314
  end
  object qrBuscasItemPedido: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      '')
    Left = 225
    Top = 362
  end
  object qrBuscasClasses2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransGravaClasse
    SQL.Strings = (
      '')
    Left = 616
    Top = 317
  end
  object IBTransGravaClasse: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 513
    Top = 14
  end
  object qrBuscasClasses1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBuscaClasse
    SQL.Strings = (
      '')
    Left = 520
    Top = 314
  end
  object IBTransBuscaClasse: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 401
    Top = 14
  end
  object qrBuscasSugestao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      '')
    Left = 318
    Top = 308
  end
  object qrLocItensPedido: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      'SELECT ip.NUM_PED,ip.GRUPO_PROD,'
      'ip.COD_PROD,ip.QUANT_IT_PROD,'
      'ip.QUANT_PEN_IT,ip.QUANT_MIN_IT,'
      'ip.VAL_UNT_IT,ip.VAL_TOT_IT,'
      'p.DESCR_PROD,p.NUM_FAB_PROD,'
      'ip.VL_V_EMP,ip.VL_V_HONDA, ip.COD_EMPRESA'
      'FROM ITEM_PEDIDO ip,PRODUTOS p'
      'WHERE 1=0')
    Left = 705
    Top = 314
    object qrLocItensPedidoNUM_PED: TIntegerField
      FieldName = 'NUM_PED'
      Origin = '"ITEM_PEDIDO"."NUM_PED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocItensPedidoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"ITEM_PEDIDO"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocItensPedidoCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"ITEM_PEDIDO"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrLocItensPedidoQUANT_IT_PROD: TFloatField
      FieldName = 'QUANT_IT_PROD'
      Origin = '"ITEM_PEDIDO"."QUANT_IT_PROD"'
    end
    object qrLocItensPedidoQUANT_PEN_IT: TFloatField
      FieldName = 'QUANT_PEN_IT'
      Origin = '"ITEM_PEDIDO"."QUANT_PEN_IT"'
    end
    object qrLocItensPedidoQUANT_MIN_IT: TFloatField
      FieldName = 'QUANT_MIN_IT'
      Origin = '"ITEM_PEDIDO"."QUANT_MIN_IT"'
    end
    object qrLocItensPedidoVAL_UNT_IT: TFloatField
      FieldName = 'VAL_UNT_IT'
      Origin = '"ITEM_PEDIDO"."VAL_UNT_IT"'
    end
    object qrLocItensPedidoVAL_TOT_IT: TFloatField
      FieldName = 'VAL_TOT_IT'
      Origin = '"ITEM_PEDIDO"."VAL_TOT_IT"'
    end
    object qrLocItensPedidoDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      FixedChar = True
      Size = 75
    end
    object qrLocItensPedidoNUM_FAB_PROD: TIBStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PRODUTOS"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrLocItensPedidoVL_V_EMP: TFloatField
      FieldName = 'VL_V_EMP'
      Origin = '"ITEM_PEDIDO"."VL_V_EMP"'
    end
    object qrLocItensPedidoVL_V_HONDA: TFloatField
      FieldName = 'VL_V_HONDA'
      Origin = '"ITEM_PEDIDO"."VL_V_HONDA"'
    end
    object qrLocItensPedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"ITEM_PEDIDO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsLocItensPedido: TDataSource
    DataSet = qrLocItensPedido
    Left = 705
    Top = 364
  end
  object qrSugestao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM SUGESTAOCOMPRA where 1=0')
    Left = 265
    Top = 66
  end
  object dspSugestao: TDataSetProvider
    DataSet = qrSugestao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 265
    Top = 117
  end
  object cdsSugestao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSugestao'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 265
    Top = 168
    object cdsSugestaoCOD_SUGESTAO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_SUGESTAO'
      Required = True
    end
    object cdsSugestaoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSugestaoDT_SUGESTAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_SUGESTAO'
    end
    object cdsSugestaoHS_SUGESTAO: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'HS_SUGESTAO'
    end
    object cdsSugestaoUSODEGRADE: TStringField
      DisplayLabel = 'Usar Grade'
      FieldName = 'USODEGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsSugestaoEXIBIR_TRANSF: TStringField
      DisplayLabel = 'Exibir Transf'
      FieldName = 'EXIBIR_TRANSF'
      FixedChar = True
      Size = 1
    end
    object cdsSugestaoQTDMESSUG: TSmallintField
      DisplayLabel = 'Qtd Meses'
      FieldName = 'QTDMESSUG'
    end
    object cdsSugestaoTP_SUG: TIntegerField
      DisplayLabel = 'Tempo Processamento'
      FieldName = 'TP_SUG'
    end
    object cdsSugestaoTE_SUG: TIntegerField
      DisplayLabel = 'Tempo Entrega'
      FieldName = 'TE_SUG'
    end
    object cdsSugestaoTA_SUG: TIntegerField
      DisplayLabel = 'Tempo Alocacao'
      FieldName = 'TA_SUG'
    end
    object cdsSugestaoFP_SUG: TIntegerField
      DisplayLabel = 'Frequencia Pedido'
      FieldName = 'FP_SUG'
    end
    object cdsSugestaoES_SUG: TIntegerField
      DisplayLabel = 'Estoque Seguranca'
      FieldName = 'ES_SUG'
    end
    object cdsSugestaoATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsSugestao: TDataSource
    DataSet = cdsSugestao
    Left = 265
    Top = 220
  end
  object dsLocGradeIni: TDataSource
    DataSet = qrLocGradeIni
    Left = 41
    Top = 468
  end
  object qrLocGradeIni: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM grade where 1=0')
    Left = 41
    Top = 418
    object qrLocGradeIniCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = '"GRADE"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocGradeIniDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRADE"."DESCRICAO"'
      FixedChar = True
      Size = 32
    end
    object qrLocGradeIniDESCRICAO1: TIBStringField
      FieldName = 'DESCRICAO1'
      Origin = '"GRADE"."DESCRICAO1"'
      FixedChar = True
      Size = 32
    end
  end
  object dsLocGradeFim: TDataSource
    DataSet = qrLocGradeFim
    Left = 117
    Top = 468
  end
  object qrLocGradeFim: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM grade where 1=0')
    Left = 117
    Top = 418
    object IntegerField1: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = '"GRADE"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRADE"."DESCRICAO"'
      FixedChar = True
      Size = 32
    end
    object IBStringField2: TIBStringField
      FieldName = 'DESCRICAO1'
      Origin = '"GRADE"."DESCRICAO1"'
      FixedChar = True
      Size = 32
    end
  end
  object dsLocGrupoIni: TDataSource
    DataSet = qrLocGrupoIni
    Left = 184
    Top = 468
  end
  object qrLocGrupoIni: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM grupos where 1=0')
    Left = 184
    Top = 418
    object qrLocGrupoIniCODIGO_GRUP: TIntegerField
      FieldName = 'CODIGO_GRUP'
      Origin = '"GRUPOS"."CODIGO_GRUP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocGrupoIniDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPOS"."DESCRICAO"'
      Size = 80
    end
  end
  object dsLocSubGIni: TDataSource
    DataSet = qrLocSubGIni
    Left = 340
    Top = 468
  end
  object qrLocSubGIni: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM sub_grupo where 1=0')
    Left = 340
    Top = 418
    object qrLocSubGIniCODIGO_SUBGR: TIntegerField
      FieldName = 'CODIGO_SUBGR'
      Origin = '"SUB_GRUPO"."CODIGO_SUBGR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocSubGIniDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"SUB_GRUPO"."DESCRICAO"'
      Size = 80
    end
  end
  object dsLocMarcas: TDataSource
    DataSet = qrLocMarcas
    Left = 510
    Top = 468
  end
  object qrLocMarcas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM marca_prod where 1=0')
    Left = 510
    Top = 418
    object qrLocMarcasCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Origin = '"MARCA_PROD"."COD_MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocMarcasDESCRICAO_MARCA: TIBStringField
      FieldName = 'DESCRICAO_MARCA'
      Origin = '"MARCA_PROD"."DESCRICAO_MARCA"'
      FixedChar = True
      Size = 30
    end
  end
  object dsLocSubGFim: TDataSource
    DataSet = qrLocSubGFim
    Left = 420
    Top = 468
  end
  object qrLocSubGFim: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM sub_grupo where 1=0')
    Left = 420
    Top = 418
    object IntegerField2: TIntegerField
      FieldName = 'CODIGO_SUBGR'
      Origin = '"SUB_GRUPO"."CODIGO_SUBGR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"SUB_GRUPO"."DESCRICAO"'
      Size = 80
    end
  end
  object dsLocGrupoFim: TDataSource
    DataSet = qrLocGrupoFim
    Left = 269
    Top = 468
  end
  object qrLocGrupoFim: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'SELECT * FROM grupos where 1=0')
    Left = 269
    Top = 418
    object IntegerField3: TIntegerField
      FieldName = 'CODIGO_GRUP'
      Origin = '"GRUPOS"."CODIGO_GRUP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField4: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPOS"."DESCRICAO"'
      Size = 80
    end
  end
  object IBTransDefClasse: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 285
    Top = 14
  end
  object qrBuscasDefClasse: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransDefClasse
    SQL.Strings = (
      '')
    Left = 322
    Top = 360
  end
  object qrSugestaoItem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      
        'select si.*,p.descr_prod,g.descricao,g.descricao1 from sugestaoc' +
        'omprait si inner join produtos p on si.grupo_prod=p.grupo_prod a' +
        'nd'
      
        'si.cod_prod=p.cod_prod and si.cod_empresa=p.cod_empresa left joi' +
        'n cod_grade_prod cg on cg.grupo_prod= p.grupo_prod'
      'and cg.cod_prod=p.cod_prod and cg.cod_empresa=p.cod_empresa'
      
        'left join grade g on cg.cod_empresa=g.cod_empresa and cg.cod_gra' +
        'de=g.cod_grade where 1=0')
    Left = 347
    Top = 66
    object qrSugestaoItemCOD_SUGESTAO: TIntegerField
      FieldName = 'COD_SUGESTAO'
      Origin = '"SUGESTAOCOMPRAIT"."COD_SUGESTAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrSugestaoItemCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"SUGESTAOCOMPRAIT"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrSugestaoItemGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"SUGESTAOCOMPRAIT"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrSugestaoItemCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"SUGESTAOCOMPRAIT"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrSugestaoItemCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = '"SUGESTAOCOMPRAIT"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrSugestaoItemSUGESTAOCOMPRA: TFloatField
      FieldName = 'SUGESTAOCOMPRA'
      Origin = '"SUGESTAOCOMPRAIT"."SUGESTAOCOMPRA"'
    end
    object qrSugestaoItemESTOQUE_ATUAL: TFloatField
      FieldName = 'ESTOQUE_ATUAL'
      Origin = '"SUGESTAOCOMPRAIT"."ESTOQUE_ATUAL"'
    end
    object qrSugestaoItemQTD_PEND: TFloatField
      FieldName = 'QTD_PEND'
      Origin = '"SUGESTAOCOMPRAIT"."QTD_PEND"'
    end
    object qrSugestaoItemCLASSESPROD: TIBStringField
      FieldName = 'CLASSESPROD'
      Origin = '"SUGESTAOCOMPRAIT"."CLASSESPROD"'
      Size = 32
    end
    object qrSugestaoItemMEDIAMES: TFloatField
      FieldName = 'MEDIAMES'
      Origin = '"SUGESTAOCOMPRAIT"."MEDIAMES"'
    end
    object qrSugestaoItemATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = '"SUGESTAOCOMPRAIT"."ATIVO"'
    end
    object qrSugestaoItemDESCR_PROD: TIBStringField
      FieldName = 'DESCR_PROD'
      Origin = '"PRODUTOS"."DESCR_PROD"'
      ProviderFlags = []
      FixedChar = True
      Size = 75
    end
    object qrSugestaoItemDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRADE"."DESCRICAO"'
      ProviderFlags = []
      FixedChar = True
      Size = 32
    end
    object qrSugestaoItemDESCRICAO1: TIBStringField
      FieldName = 'DESCRICAO1'
      Origin = '"GRADE"."DESCRICAO1"'
      ProviderFlags = []
      FixedChar = True
      Size = 32
    end
  end
  object dspSugestaoItem: TDataSetProvider
    DataSet = qrSugestaoItem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 347
    Top = 117
  end
  object cdsSugestaoItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSugestaoItem'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 347
    Top = 168
    object cdsSugestaoItemCOD_SUGESTAO: TIntegerField
      DisplayLabel = 'Cod. Sugest'#227'o'
      FieldName = 'COD_SUGESTAO'
      Required = True
    end
    object cdsSugestaoItemCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSugestaoItemGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsSugestaoItemCOD_PROD: TStringField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsSugestaoItemCOD_GRADE: TIntegerField
      DisplayLabel = 'Grade Produto'
      FieldName = 'COD_GRADE'
    end
    object cdsSugestaoItemSUGESTAOCOMPRA: TFloatField
      DisplayLabel = 'Sugest'#227'o Compra'
      FieldName = 'SUGESTAOCOMPRA'
    end
    object cdsSugestaoItemESTOQUE_ATUAL: TFloatField
      DisplayLabel = 'Estoque Atual'
      FieldName = 'ESTOQUE_ATUAL'
    end
    object cdsSugestaoItemQTD_PEND: TFloatField
      DisplayLabel = 'Quantidade Pendente'
      FieldName = 'QTD_PEND'
    end
    object cdsSugestaoItemCLASSESPROD: TStringField
      DisplayLabel = 'Classes do Produto'
      FieldName = 'CLASSESPROD'
      Size = 32
    end
    object cdsSugestaoItemMEDIAMES: TFloatField
      DisplayLabel = 'M'#233'dia Mensal'
      FieldName = 'MEDIAMES'
    end
    object cdsSugestaoItemATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsSugestaoItemDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsSugestaoItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 32
    end
    object cdsSugestaoItemDESCRICAO1: TStringField
      FieldName = 'DESCRICAO1'
      FixedChar = True
      Size = 32
    end
  end
  object dsSugestaoItem: TDataSource
    DataSet = cdsSugestaoItem
    Left = 347
    Top = 220
  end
  object qrBuscasSugestao1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      '')
    Left = 414
    Top = 308
  end
  object RDprintSugestao: TRDprint
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
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 132
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 608
    Top = 13
  end
  object dsBuscasSugestao1: TDataSource
    DataSet = qrBuscasSugestao1
    Left = 425
    Top = 356
  end
  object dsBuscasClasses1: TDataSource
    DataSet = qrBuscasClasses1
    Left = 521
    Top = 359
  end
  object qrCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      'SELECT * FROM COND_PAG where ativo=1')
    Left = 437
    Top = 66
  end
  object dspCondPag: TDataSetProvider
    DataSet = qrCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 437
    Top = 117
  end
  object cdsCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPag'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 439
    Top = 168
    object cdsCondPagCOD_COND_PAG: TIntegerField
      DisplayLabel = 'C'#243'digo Condi'#231#227'o'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagDESC_COND_PAG: TStringField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsCondPagSEQPRECO: TStringField
      DisplayLabel = 'Sequ'#234'ncia de Pre'#231'o'
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagMAX_DESC: TFloatField
      DisplayLabel = 'M'#225'ximo de Desconto'
      FieldName = 'MAX_DESC'
    end
    object cdsCondPagATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsCondPagFINALIZADOR_CUPOM: TIntegerField
      DisplayLabel = 'Finalizador Cupom'
      FieldName = 'FINALIZADOR_CUPOM'
    end
  end
  object dsCondPag: TDataSource
    DataSet = cdsCondPag
    Left = 440
    Top = 220
  end
  object qrPendPed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedido
    SQL.Strings = (
      'SELECT * FROM COND_PAG where ativo=1')
    Left = 533
    Top = 66
  end
  object dspPendPed: TDataSetProvider
    DataSet = qrPendPed
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 533
    Top = 117
  end
  object cdsPendPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPendPed'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 535
    Top = 168
  end
  object dsPendPed: TDataSource
    DataSet = cdsPendPed
    Left = 536
    Top = 220
  end
  object qrSugestaoEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      
        'select emp.cod_empresa, (coalesce(emp.identificacao_emp, emp.nom' +
        'e_emp) ||'#39' - '#39'|| emp.cgc_emp) identificacao_emp,'
      
        'case when (coalesce(empf.cod_empresa, 0) > 0) then 1 else 0 end ' +
        'emp_fis from empresa emp'
      
        'left join empresa_fisica empf on emp.cod_empresa = empf.cod_empr' +
        'esa')
    Left = 633
    Top = 66
  end
  object dspSugestaoEmpresa: TDataSetProvider
    DataSet = qrSugestaoEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 633
    Top = 117
  end
  object cdsSugestaoEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSugestaoEmpresa'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 633
    Top = 168
    object cdsSugestaoEmpresaSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsSugestaoEmpresaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSugestaoEmpresaIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 85
    end
    object cdsSugestaoEmpresaEMP_FIS: TIntegerField
      Tag = 1
      DisplayLabel = 'Empresa Fisica'
      FieldName = 'EMP_FIS'
      Visible = False
    end
  end
  object dsSugestaoEmpresa: TDataSource
    DataSet = cdsSugestaoEmpresa
    Left = 633
    Top = 220
  end
  object qrCustosProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'select custos.grupo_prod, custos.cod_prod, custos.cod_empresa,'
      
        'custos.cod_nf, custos.num_nota_nfe, custos.serie, custos.fornec,' +
        ' custos.data,'
      'custos.prec_cus_med, custos.pr_cusc_prod, custos.valor,'
      'cl.nome_cliente, cl.razao, cl.cpfcgc from custos'
      
        'left join clientes cl on cl.cod_cliente = custos.fornec and cl.c' +
        'od_empresa = custos.cod_empresa'
      'where custos.grupo_prod = :grupo_prod'
      'and custos.cod_prod = :cod_prod'
      'and custos.cod_empresa = :cod_empresa'
      'order by custos.data desc, custos.cod_nf desc')
    Left = 745
    Top = 66
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
  end
  object dspCustosProd: TDataSetProvider
    DataSet = qrCustosProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 745
    Top = 117
  end
  object cdsCustosProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCustosProd'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 745
    Top = 168
    object cdsCustosProdGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCustosProdCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCustosProdCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCustosProdCOD_NF: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
    end
    object cdsCustosProdNUM_NOTA_NFE: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NOTA_NFE'
    end
    object cdsCustosProdSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsCustosProdFORNEC: TIntegerField
      DisplayLabel = 'Cod Fornec'
      FieldName = 'FORNEC'
    end
    object cdsCustosProdDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsCustosProdPREC_CUS_MED: TFloatField
      DisplayLabel = 'Prec Custo Medio'
      FieldName = 'PREC_CUS_MED'
      DisplayFormat = '#0.00'
    end
    object cdsCustosProdPR_CUSC_PROD: TFloatField
      DisplayLabel = 'Preco Custo'
      FieldName = 'PR_CUSC_PROD'
      DisplayFormat = '#0.00'
    end
    object cdsCustosProdVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#0.00'
    end
    object cdsCustosProdNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia (Fornecedor)'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsCustosProdRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social (Fornecedor)'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsCustosProdCPFCGC: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dsCustosProd: TDataSource
    DataSet = cdsCustosProd
    Left = 745
    Top = 220
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      
        'select emp.cod_empresa, coalesce(emp.identificacao_emp, emp.nome' +
        '_emp) identificacao_emp from empresa emp')
    Left = 841
    Top = 66
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 841
    Top = 117
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 841
    Top = 168
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
    DataSet = cdsEmpresa
    Left = 841
    Top = 220
  end
  object qrFornec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'select cl.cod_cliente, '
      'cl.cod_empresa,'
      'coalesce(cl.nome_cliente, cl.razao) nome_cliente,'
      'cl.tipo from clientes cl'
      'where cl.cod_cliente = :cod_cliente'
      'and cl.cod_empresa = :cod_empresa')
    Left = 921
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspFornec: TDataSetProvider
    DataSet = qrFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 921
    Top = 117
  end
  object cdsFornec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornec'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 921
    Top = 168
    object cdsFornecCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsFornecCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFornecNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsFornecTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dsFornec: TDataSource
    DataSet = cdsFornec
    Left = 921
    Top = 220
  end
  object qrVendedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'select col.cod_vendedor,'
      'col.cod_empresa,'
      'col.nome_vendedor from colaborador col'
      'where col.cod_vendedor = :cod_vendedor'
      'and col.cod_empresa = :cod_empresa')
    Left = 809
    Top = 314
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspVendedor: TDataSetProvider
    DataSet = qrVendedor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 809
    Top = 365
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 809
    Top = 416
    object cdsVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsVendedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsVendedorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 809
    Top = 468
  end
  object qrCondPagPed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'select cd.cod_cond_pag, cd.desc_cond_pag from cond_pag cd'
      'where cd.ativo = 1'
      'order by cd.desc_cond_pag')
    Left = 1009
    Top = 306
  end
  object dspCondPagPed: TDataSetProvider
    DataSet = qrCondPagPed
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1009
    Top = 357
  end
  object cdsCondPagPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPagPed'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 1009
    Top = 408
    object cdsCondPagPedCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagPedDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
  end
  object dsCondPagPed: TDataSource
    DataSet = cdsCondPagPed
    Left = 1009
    Top = 460
  end
  object qrCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'select cl.cod_cliente, '
      'cl.cod_empresa,'
      'coalesce(cl.nome_cliente, cl.razao) nome_cliente,'
      'cl.tipo from clientes cl'
      'where cl.cod_cliente = :cod_cliente'
      'and cl.cod_empresa = :cod_empresa')
    Left = 1001
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspCliente: TDataSetProvider
    DataSet = qrCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1001
    Top = 117
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 1001
    Top = 168
    object IntegerField4: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 1001
    Top = 220
  end
  object qrVendedor2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSugestao
    SQL.Strings = (
      'select col.cod_vendedor,'
      'col.cod_empresa,'
      'col.nome_vendedor from colaborador col'
      'where col.cod_vendedor = :cod_vendedor'
      'and col.cod_empresa = :cod_empresa')
    Left = 897
    Top = 314
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspVendedor2: TDataSetProvider
    DataSet = qrVendedor2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 897
    Top = 365
  end
  object cdsVendedor2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor2'
    BeforeOpen = CdsPedidoCompraBeforeOpen
    Left = 897
    Top = 416
    object IntegerField6: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsVendedor2: TDataSource
    DataSet = cdsVendedor2
    Left = 897
    Top = 468
  end
end
