object dtmEstoqueFechado: TdtmEstoqueFechado
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 552
  Width = 1194
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 52
    Top = 1
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 216
    Top = 1
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 139
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
  object dspEstoqueFechado: TDataSetProvider
    DataSet = qrEstoqueFechado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 51
    Top = 113
  end
  object cdsEstoqueFechado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueFechado'
    BeforeOpen = cdsEstoqueFechadoBeforeOpen
    Left = 51
    Top = 170
    object cdsEstoqueFechadoSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEstoqueFechadoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabr Prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsEstoqueFechadoCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsEstoqueFechadoDESCR_PROD: TStringField
      DisplayLabel = 'Descr Prod'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsEstoqueFechadoQUANT: TFloatField
      DisplayLabel = 'Quant'
      FieldName = 'QUANT'
    end
    object cdsEstoqueFechadoVLUN: TFloatField
      DisplayLabel = 'Vl Un'
      FieldName = 'VLUN'
      currency = True
    end
    object cdsEstoqueFechadoVLTOT: TFloatField
      DisplayLabel = 'Vl Tot'
      FieldName = 'VLTOT'
      currency = True
    end
    object cdsEstoqueFechadoTIPV: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPV'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueFechadoDESC_COND_PAG: TStringField
      DisplayLabel = 'Cond Pag'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsEstoqueFechadoCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsEstoqueFechadoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
    end
    object cdsEstoqueFechadoCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsEstoqueFechadoDATA_PEDIDO: TDateTimeField
      DisplayLabel = 'Data Pedido'
      FieldName = 'DATA_PEDIDO'
    end
    object cdsEstoqueFechadoHORA_PEDIDO: TTimeField
      DisplayLabel = 'Hora Pedido'
      FieldName = 'HORA_PEDIDO'
    end
    object cdsEstoqueFechadoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsEstoqueFechadoNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object cdsEstoqueFechadoSIT_ATD: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'SIT_ATD'
      FixedChar = True
      Size = 2
    end
    object cdsEstoqueFechadoCOD_VENDEDOR1: TIntegerField
      DisplayLabel = 'Cod Almoxarifado'
      FieldName = 'COD_VENDEDOR1'
    end
    object cdsEstoqueFechadoDATA_ATD: TDateTimeField
      DisplayLabel = 'Data Atd'
      FieldName = 'DATA_ATD'
    end
    object cdsEstoqueFechadoHORA_ATD: TTimeField
      DisplayLabel = 'Hora Atd'
      FieldName = 'HORA_ATD'
    end
    object cdsEstoqueFechadoFILTRO: TStringField
      DisplayLabel = 'Filtro'
      FieldName = 'FILTRO'
      Size = 35
    end
    object cdsEstoqueFechadoLOCACAO_PROD: TStringField
      DisplayLabel = 'Loca'#231#227'o Prod 1'
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsEstoqueFechadoLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Loca'#231#227'o Pro 2'
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
    object cdsEstoqueFechadoCOD_PEDIDO: TIntegerField
      DisplayLabel = 'Cod Pedido'
      FieldName = 'COD_PEDIDO'
      Required = True
    end
    object cdsEstoqueFechadoNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsEstoqueFechadoNDOC: TIntegerField
      DisplayLabel = 'N'#186' Doc'
      FieldName = 'NDOC'
    end
    object cdsEstoqueFechadoTPDOC: TStringField
      DisplayLabel = 'Tp Doc'
      FieldName = 'TPDOC'
      FixedChar = True
      Size = 6
    end
    object cdsEstoqueFechadoCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsEstoqueFechadoCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsEstoqueFechadoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsEstoqueFechadoLIBTRAVA: TStringField
      DisplayLabel = 'Liberar Trava Venda'
      FieldName = 'LIBTRAVA'
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueFechadoDATA_LIBTRAVA: TDateTimeField
      DisplayLabel = 'Data Libera'#231#227'o Trava'
      FieldName = 'DATA_LIBTRAVA'
    end
    object cdsEstoqueFechadoQTDE_LIBTRAVA: TIntegerField
      DisplayLabel = 'Qtde Libera'#231#227'o Trava'
      FieldName = 'QTDE_LIBTRAVA'
    end
    object cdsEstoqueFechadoCOD_RESERVA: TIntegerField
      Tag = 1
      FieldName = 'COD_RESERVA'
      Visible = False
    end
    object cdsEstoqueFechadoVALOR_DESCACRES: TFloatField
      Tag = 1
      FieldName = 'VALOR_DESCACRES'
      Visible = False
      currency = True
    end
    object cdsEstoqueFechadoDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESC_ITEM'
      currency = True
    end
    object cdsEstoqueFechadoTABPRATICADA: TStringField
      DisplayLabel = 'Pre'#231'o P/T/N'
      FieldName = 'TABPRATICADA'
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueFechadoPRECOPORQTDE: TStringField
      FieldName = 'PRECOPORQTDE'
      FixedChar = True
      Size = 1
    end
  end
  object qrEstoqueFechado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.*, cl.nome_cliente,pr.locacao_prod, pr.locacao_prod_1,c' +
        'p.desc_cond_pag from controle_almoxarifado c'
      'left join cond_pag cp on cp.cod_cond_pag = c.cod_cond_pag'
      
        'left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.c' +
        'od_empresa = c.cod_empresa'
      
        'left join produtos pr on pr.grupo_prod = c.grupo_prod and pr.cod' +
        '_prod = c.cod_prod and pr.cod_empresa = c.cod_empresa'
      
        'where c.cod_vendedor = :cod_vendedor and c.sit_atd ='#39'NT'#39' and c.c' +
        'od_empresa = 1 and cp.ativo =1')
    Left = 51
    Top = 54
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_vendedor'
        ParamType = ptUnknown
      end>
  end
  object dsEstoqueFechado: TDataSource
    AutoEdit = False
    DataSet = cdsEstoqueFechado
    Left = 47
    Top = 224
  end
  object qrUsuario: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.cod_vendedor, c.nome_vendedor, f.desc_funcao from colab' +
        'orador c'
      'inner join funcoes f on f.cod_funcao = c.cod_funcao'
      
        'where c.cod_empresa = 1 and c.ativo = 1 and f.desc_funcao like '#39 +
        '%VENDEDOR%'#39
      '')
    Left = 143
    Top = 54
  end
  object dspUsuario: TDataSetProvider
    DataSet = qrUsuario
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 143
    Top = 113
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspUsuario'
    BeforeOpen = cdsUsuarioBeforeOpen
    Left = 144
    Top = 170
    object cdsUsuarioCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsUsuarioNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsUsuarioDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 143
    Top = 225
  end
  object qrCondPagamento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select c.cod_cond_pag, c.desc_cond_pag, seqpreco from cond_pag c'
      'where c.ativo = 1')
    Left = 321
    Top = 54
  end
  object dspCondPagamento: TDataSetProvider
    DataSet = qrCondPagamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 321
    Top = 113
  end
  object cdsCondPagamento: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCondPagamento'
    BeforeOpen = cdsCondPagamentoBeforeOpen
    Left = 322
    Top = 170
    object cdsCondPagamentoCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagamentoDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsCondPagamentoSEQPRECO: TStringField
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsCondPagamento: TDataSource
    DataSet = cdsCondPagamento
    Left = 321
    Top = 225
  end
  object qrTipoVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select v.cod_tipo, v.sigla, v.descricao from tipo_vendas v'
      'where v.tipo ='#39'REQ'#39'  and v.venda ='#39'S'#39)
    Left = 417
    Top = 54
  end
  object dspTipoVenda: TDataSetProvider
    DataSet = qrTipoVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 417
    Top = 113
  end
  object cdsTipoVenda: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTipoVenda'
    BeforeOpen = cdsTipoVendaBeforeOpen
    Left = 418
    Top = 170
    object cdsTipoVendaCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Required = True
    end
    object cdsTipoVendaSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
  object dsTipoVenda: TDataSource
    DataSet = cdsTipoVenda
    Left = 417
    Top = 225
  end
  object qrPedVendaTemp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 513
    Top = 54
  end
  object dspPedVendaTemp: TDataSetProvider
    DataSet = qrPedVendaTemp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 513
    Top = 113
  end
  object cdsPedVendaTemp: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedVendaTemp'
    BeforeOpen = cdsPedVendaTempBeforeOpen
    Left = 514
    Top = 170
  end
  object dsPedVendaTemp: TDataSource
    DataSet = cdsPedVendaTemp
    Left = 513
    Top = 225
  end
  object qrPedProdTemp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 607
    Top = 54
  end
  object dspPedProdTemp: TDataSetProvider
    DataSet = qrPedProdTemp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 607
    Top = 113
  end
  object cdsPedProdTemp: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedProdTemp'
    BeforeOpen = cdsPedProdTempBeforeOpen
    Left = 608
    Top = 170
  end
  object dsPedProdTemp: TDataSource
    DataSet = cdsPedProdTemp
    Left = 607
    Top = 225
  end
  object qrPedColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 791
    Top = 54
  end
  object dspPedColaborador: TDataSetProvider
    DataSet = qrPedColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 791
    Top = 113
  end
  object cdsPedColaborador: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedColaborador'
    BeforeOpen = cdsPedColaboradorBeforeOpen
    Left = 792
    Top = 170
  end
  object dsPedColaborador: TDataSource
    DataSet = cdsPedColaborador
    Left = 791
    Top = 225
  end
  object qrRelRelaAten: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select p1.tipo, p2.num_fab_prod,p2.descr_prod_ped,p2.grupo_prod,' +
        ' p2.cod_prod,'
      
        'p2.quant_ped_item, p2.sit_atd, p2.data_atd, p2.hora_atd, p2.nped' +
        ','
      'c1.nome_vendedor, p3.locacao_prod, p3.locacao_prod_1'
      'from pedvenda_prod p2'
      'inner join pedvenda p1 on p1.nped = p2.nped and'
      'p1.tipo = p2.tipo and p1.cod_empresa = p2.cod_empresa'
      'inner join produtos p3 on p3.grupo_prod = p2.grupo_prod and'
      'p3.cod_prod = p2.cod_prod and p3.cod_empresa = p2.cod_empresa'
      
        'left join colaborador c1 on c1.cod_vendedor = p2.cod_vendedor an' +
        'd'
      'c1.cod_empresa = p1.cod_empresa'
      
        'where p1.ativo = 1 and p1.data_ped >= :dataini and p1.data_ped <' +
        '= :datafim and p2.sit_atd = :sit_atd'
      'and p1.cod_empresa = :cod_empresa')
    Left = 1040
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sit_atd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrRelRelaAtenTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrRelRelaAtenNUM_FAB_PROD: TIBStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrRelRelaAtenDESCR_PROD_PED: TIBStringField
      FieldName = 'DESCR_PROD_PED'
      Origin = '"PEDVENDA_PROD"."DESCR_PROD_PED"'
      Size = 60
    end
    object qrRelRelaAtenGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrRelRelaAtenCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA_PROD"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrRelRelaAtenQUANT_PED_ITEM: TFloatField
      FieldName = 'QUANT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."QUANT_PED_ITEM"'
    end
    object qrRelRelaAtenSIT_ATD: TIBStringField
      FieldName = 'SIT_ATD'
      Origin = '"PEDVENDA_PROD"."SIT_ATD"'
      FixedChar = True
      Size = 2
    end
    object qrRelRelaAtenDATA_ATD: TDateTimeField
      FieldName = 'DATA_ATD'
      Origin = '"PEDVENDA_PROD"."DATA_ATD"'
    end
    object qrRelRelaAtenHORA_ATD: TIBStringField
      FieldName = 'HORA_ATD'
      Origin = '"PEDVENDA_PROD"."HORA_ATD"'
      FixedChar = True
      Size = 8
    end
    object qrRelRelaAtenNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"PEDVENDA_PROD"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrRelRelaAtenNOME_VENDEDOR: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
    object qrRelRelaAtenLOCACAO_PROD: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrRelRelaAtenLOCACAO_PROD_1: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
  end
  object qrRelMovProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select distinct(pedprod.grupo_prod||pedprod.cod_prod) as GRUP_CO' +
        'D,pedprod.num_fab_prod, pedprod.descr_prod_ped, prod.locacao_pro' +
        'd,'
      'prod.locacao_prod_1, prod.grupo_prod, prod.cod_prod,'
      '(select sum(p2.quant_ped_item) from pedvenda_prod p2'
      'inner join pedvenda p1 on p1.nped = p2.nped and'
      'p1.tipo = p2.tipo and p1.cod_empresa = p2.cod_empresa'
      'where'
      
        'p2.grupo_prod = pedprod.grupo_prod and p2.cod_prod = pedprod.cod' +
        '_prod and'
      
        'p2.data_transf  >= :dataIni and p2.data_transf <= :dataFim and p' +
        '2.sit_atd = '#39'AT'#39' and'
      'p1.cod_empresa = ped.cod_empresa) as ATEND,'
      '(select sum(p2.quant_ped_item) from pedvenda_prod p2'
      'inner join pedvenda p1 on p1.nped = p2.nped and'
      'p1.tipo = p2.tipo and p1.cod_empresa = p2.cod_empresa'
      'where'
      
        'p2.grupo_prod = pedprod.grupo_prod and p2.cod_prod = pedprod.cod' +
        '_prod and'
      
        'p2.data_transf >= :dataIni and p2.data_transf <= :dataFim and p2' +
        '.sit_atd = '#39'NT'#39' and'
      'p1.cod_empresa = ped.cod_empresa) as NAOATEND,'
      '(select sum(cm.vqt) from comprasmeses cm where'
      
        'cm.grupo_prod = pedprod.grupo_prod and cm.cod_prod = pedprod.cod' +
        '_prod and'
      'cm.data_compra >= :dataIni and cm.data_compra <= :dataFim'
      'and cm.cod_empresa = ped.cod_empresa) as COMPRAS,'
      'prod.est_f , prod.est_r ,'
      '(Select sum(vi.quant_ped_item)'
      'from pedvenda v'
      
        'inner join pedvenda_prod vi on v.nped = vi.nped and v.tipo = vi.' +
        'tipo'
      'and v.cod_empresa = vi.cod_empresa'
      
        'where vi.grupo_prod = pedprod.grupo_prod and vi.cod_prod = pedpr' +
        'od.cod_prod and'
      
        'v.tipo <> '#39'ORC'#39' and (v.data_fech is null or v.data_fech < '#39'01/01' +
        '/1899'#39') and'
      'v.COD_EMPRESA = ped.cod_empresa and v.ativo = ped.ativo) as pend'
      'from pedvenda ped'
      
        'inner join pedvenda_prod pedprod on pedprod.nped = ped.nped and ' +
        'pedprod.tipo = ped.tipo'
      'and pedprod.cod_empresa = ped.cod_empresa'
      'inner join produtos prod on prod.grupo_prod = pedprod.grupo_prod'
      
        'and prod.cod_prod = pedprod.cod_prod and prod.cod_empresa = pedp' +
        'rod.cod_empresa'
      'where'
      
        'pedprod.data_transf  >= :dataIni and pedprod.data_transf <= :dat' +
        'aFim and ped.cod_empresa = :cod_empresa')
    Left = 1112
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataFim'
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
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrRelMovProdGRUP_COD: TIBStringField
      FieldName = 'GRUP_COD'
      ProviderFlags = []
      Size = 17
    end
    object qrRelMovProdNUM_FAB_PROD: TIBStringField
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrRelMovProdDESCR_PROD_PED: TIBStringField
      FieldName = 'DESCR_PROD_PED'
      Origin = '"PEDVENDA_PROD"."DESCR_PROD_PED"'
      Size = 60
    end
    object qrRelMovProdLOCACAO_PROD: TIBStringField
      FieldName = 'LOCACAO_PROD'
      Origin = '"PRODUTOS"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrRelMovProdLOCACAO_PROD_1: TIBStringField
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"PRODUTOS"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object qrRelMovProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PRODUTOS"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrRelMovProdCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"PRODUTOS"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrRelMovProdATEND: TFloatField
      FieldName = 'ATEND'
      ProviderFlags = []
    end
    object qrRelMovProdNAOATEND: TFloatField
      FieldName = 'NAOATEND'
      ProviderFlags = []
    end
    object qrRelMovProdCOMPRAS: TFloatField
      FieldName = 'COMPRAS'
      ProviderFlags = []
    end
    object qrRelMovProdEST_F: TFloatField
      FieldName = 'EST_F'
      Origin = '"PRODUTOS"."EST_F"'
    end
    object qrRelMovProdEST_R: TFloatField
      FieldName = 'EST_R'
      Origin = '"PRODUTOS"."EST_R"'
    end
    object qrRelMovProdPEND: TFloatField
      FieldName = 'PEND'
      ProviderFlags = []
    end
  end
  object rdPedido: TRDprint
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
    OpcoesPreview.CaptionPreview = 'Impress'#227'o Vendas'
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
    TamanhoQteLinhas = 33
    TamanhoQteColunas = 133
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 321
    Top = 65535
  end
  object qrMecanico: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C'
      'INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao'
      '   WHERE C.cod_empresa =1 AND C.ativo = 1'
      
        '    and ((f.desc_funcao like '#39'%MECANICO%'#39') or (f.desc_funcao lik' +
        'e '#39'%MEC'#194'NICO%'#39'))')
    Left = 216
    Top = 54
  end
  object dspMecanico: TDataSetProvider
    DataSet = qrMecanico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 216
    Top = 113
  end
  object cdsMecanico: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspUsuario'
    BeforeOpen = cdsUsuarioBeforeOpen
    Left = 217
    Top = 170
    object IntegerField1: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object StringField2: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
  end
  object dsMecanico: TDataSource
    DataSet = cdsMecanico
    Left = 216
    Top = 225
  end
  object qrProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 879
    Top = 54
  end
  object dspProdutos: TDataSetProvider
    DataSet = qrProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 879
    Top = 113
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedColaborador'
    BeforeOpen = cdsPedColaboradorBeforeOpen
    Left = 880
    Top = 170
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 879
    Top = 225
  end
  object qrPedCond: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'SELECT * FROM COND_PAG where ativo=1')
    Left = 699
    Top = 54
  end
  object dspPedCond: TDataSetProvider
    DataSet = qrPedCond
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 699
    Top = 113
  end
  object cdsPedCond: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCondPagamento'
    BeforeOpen = cdsPedProdTempBeforeOpen
    Left = 700
    Top = 170
    object cdsPedCondCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsPedCondDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsPedCondSEQPRECO: TStringField
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsPedCond: TDataSource
    DataSet = cdsPedCond
    Left = 699
    Top = 225
  end
  object dsProd: TDataSource
    DataSet = cdsProd
    Left = 48
    Top = 430
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsEstoqueFechadoBeforeOpen
    Left = 48
    Top = 374
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 48
    Top = 326
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select p.*,'
      'coalesce(est.estoque, 0) estoque_disponivel,'
      'coalesce(est.est_prima, 0) estoque_produzir from produtos p '
      
        'left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.co' +
        'd_empresa, 0, '#39#39', 0, 0) est on 1 = 1'
      'where p.grupo_prod = 0 '
      'and p.cod_prod = 0 '
      'and p.cod_empresa = 0')
    Left = 48
    Top = 280
  end
  object dsCodBarra: TDataSource
    DataSet = cdsCodBarra
    Left = 136
    Top = 430
  end
  object cdsCodBarra: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCodBarra'
    BeforeOpen = cdsEstoqueFechadoBeforeOpen
    Left = 136
    Top = 374
  end
  object dspCodBarra: TDataSetProvider
    DataSet = qrCodBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 136
    Top = 326
  end
  object qrCodBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from cod_barra where grupo_prod = 0 and cod_prod = 0 an' +
        'd cod_empresa = 0')
    Left = 136
    Top = 280
  end
  object qrCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.cod_cliente, c.nome_cliente, c.tipvcliente, COD_LOCALID' +
        'ADE, COD_CIDADE, CAMP_PR_VENDA from clientes c'
      ''
      '')
    Left = 223
    Top = 280
  end
  object dspCliente: TDataSetProvider
    DataSet = qrCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 222
    Top = 327
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCliente'
    BeforeOpen = cdsUsuarioBeforeOpen
    Left = 221
    Top = 374
    object cdsClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsClienteTIPVCLIENTE: TStringField
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsClienteCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsClienteCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsClienteCAMP_PR_VENDA: TStringField
      FieldName = 'CAMP_PR_VENDA'
    end
    object cdsClienteCOD_TAB_PRECO: TIntegerField
      FieldName = 'COD_TAB_PRECO'
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 219
    Top = 430
  end
  object qrPedCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'SELECT COD_CLIENTE, NOME_CLIENTE, TIPVCLIENTE, COD_LOCALIDADE, C' +
        'OD_CIDADE, CAMP_PR_VENDA FROM CLIENTES')
    Left = 955
    Top = 54
  end
  object dspPedCliente: TDataSetProvider
    DataSet = qrPedCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 955
    Top = 113
  end
  object cdsPedCliente: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedCliente'
    BeforeOpen = cdsPedProdTempBeforeOpen
    Left = 956
    Top = 170
    object cdsPedClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPedClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsPedClienteTIPVCLIENTE: TStringField
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsPedClienteCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsPedClienteCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsPedClienteCAMP_PR_VENDA: TStringField
      FieldName = 'CAMP_PR_VENDA'
    end
    object cdsPedClienteCOD_TAB_PRECO: TIntegerField
      FieldName = 'COD_TAB_PRECO'
    end
  end
  object dsPedCliente: TDataSource
    DataSet = cdsPedCliente
    Left = 955
    Top = 225
  end
  object dspReserva: TDataSetProvider
    DataSet = qrReserva
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 299
    Top = 329
  end
  object cdsReserva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReserva'
    BeforeOpen = cdsEstoqueFechadoBeforeOpen
    Left = 299
    Top = 378
    object cdsReservaCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsReservaCOD_VENDEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
      Visible = False
    end
    object cdsReservaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsReservaDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsReservaDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsReservaHORA: TStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      FixedChar = True
      Size = 8
    end
    object cdsReservaATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object qrReserva: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from reserva_almoxarifado')
    Left = 299
    Top = 278
  end
  object dsReserva: TDataSource
    AutoEdit = False
    DataSet = cdsReserva
    Left = 295
    Top = 432
  end
  object dspReservaItens: TDataSetProvider
    DataSet = qrReservaItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 395
    Top = 329
  end
  object cdsReservaItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReservaItens'
    BeforeOpen = cdsEstoqueFechadoBeforeOpen
    Left = 395
    Top = 378
    object cdsReservaItensCODIGO: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
      Visible = False
    end
    object cdsReservaItensNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsReservaItensCOD_VENDEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
      Visible = False
    end
    object cdsReservaItensCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsReservaItensGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsReservaItensCOD_PROD: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsReservaItensNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabr'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsReservaItensDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsReservaItensCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsReservaItensQUANT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT'
    end
    object cdsReservaItensDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsReservaItensHORA: TStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      FixedChar = True
      Size = 8
    end
    object cdsReservaItensORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
    end
    object cdsReservaItensTIPV: TStringField
      Tag = 1
      FieldName = 'TIPV'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qrReservaItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from reserva_almoxarifado_itens')
    Left = 395
    Top = 278
  end
  object dsReservaItens: TDataSource
    AutoEdit = False
    DataSet = cdsReservaItens
    Left = 391
    Top = 432
  end
end
