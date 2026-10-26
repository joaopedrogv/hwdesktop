object dtmAlmoxarifado: TdtmAlmoxarifado
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 506
  Width = 749
  object dspAlmox: TDataSetProvider
    DataSet = qrAlmox
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 28
    Top = 113
  end
  object cdsAlmox: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAlmox'
    BeforeOpen = cdsAlmoxBeforeOpen
    Left = 28
    Top = 170
    object cdsAlmoxNPED: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsAlmoxTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsAlmoxNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsAlmoxDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCR_PROD_PED'
      Size = 60
    end
    object cdsAlmoxLOCACAO_PROD: TStringField
      DisplayLabel = 'Loca'#231#227'o 1'
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsAlmoxLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Loca'#231#227'o 2'
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
    object cdsAlmoxSIT_ATD: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SIT_ATD'
      FixedChar = True
      Size = 2
    end
    object cdsAlmoxDATA_ATD: TDateTimeField
      DisplayLabel = 'Data Atend'
      FieldName = 'DATA_ATD'
    end
    object cdsAlmoxHORA_ATD: TStringField
      DisplayLabel = 'Hora Atend'
      FieldName = 'HORA_ATD'
      FixedChar = True
      Size = 8
    end
    object cdsAlmoxQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Qtde Venda'
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsAlmoxGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsAlmoxCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsAlmoxSTATUS_PED: TStringField
      DisplayLabel = 'Status Venda'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object cdsAlmoxEST_F: TFloatField
      FieldName = 'EST_F'
    end
    object cdsAlmoxSTAT_REQ: TStringField
      DisplayLabel = 'Stat Req'
      FieldName = 'STAT_REQ'
      FixedChar = True
      Size = 1
    end
    object cdsAlmoxNITEM: TIntegerField
      FieldName = 'NITEM'
    end
  end
  object qrAlmox: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select ped.nped, ped.tipo, pedprod.num_fab_prod, pedprod.descr_p' +
        'rod_ped, prod.locacao_prod,'
      
        'prod.locacao_prod_1, pedprod.sit_atd, pedprod.data_atd, pedprod.' +
        'hora_atd,'
      
        'pedprod.quant_ped_item, prod.grupo_prod, prod.cod_prod, ped.stat' +
        'us_ped,prod.est_f, ped.stat_req,pedprod.nitem'
      'from pedvenda ped'
      
        'inner join pedvenda_prod pedprod on pedprod.nped = ped.nped and ' +
        'pedprod.tipo = ped.tipo'
      'and pedprod.cod_empresa = ped.cod_empresa'
      'inner join produtos prod on prod.grupo_prod = pedprod.grupo_prod'
      
        'and prod.cod_prod = pedprod.cod_prod and prod.cod_empresa = pedp' +
        'rod.cod_empresa'
      'where ped.tipv <> '#39'C'#39' and ped.tipv <> '#39'E'#39' and ped.tipv <> '#39'O'#39)
    Left = 28
    Top = 54
  end
  object transacao: TIBTransaction
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
    Transaction = transacao
    Left = 185
    Top = 1
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
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
        'aFim and ped.cod_empresa = :cod_empresa'
      ' order by 2')
    Left = 216
    Top = 136
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
    Left = 224
    Top = 200
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
  object dsAlmox: TDataSource
    AutoEdit = False
    DataSet = cdsAlmox
    Left = 24
    Top = 224
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 241
    Top = 1
  end
end
