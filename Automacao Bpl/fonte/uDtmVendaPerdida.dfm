object dtmVendaPerdida: TdtmVendaPerdida
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 348
  Width = 631
  object transacao: TIBTransaction
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 8
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 180
    Top = 8
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
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 106
    Top = 8
  end
  object dspVendaP: TDataSetProvider
    DataSet = qrVendaP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 136
  end
  object cdsVendaP: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'GRUPO_PROD'
        DataType = ftInteger
      end
      item
        Name = 'COD_PROD'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CODIGO_VP'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA_VNP'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'COD_EMPRESA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_VENDEDOR'
        DataType = ftInteger
      end
      item
        Name = 'QUANT_PROD_VP'
        DataType = ftFloat
      end
      item
        Name = 'ATIVO'
        DataType = ftInteger
      end
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'SEQVP'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_SERVICO'
        DataType = ftInteger
      end
      item
        Name = 'TIPOVP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_CLIENTE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspVendaP'
    StoreDefs = True
    BeforeOpen = cdsVendaPBeforeOpen
    Left = 24
    Top = 192
    object cdsVendaPSEQVP: TIntegerField
      DisplayLabel = 'Cod.Venda P.'
      FieldName = 'SEQVP'
      Required = True
    end
    object cdsVendaPTIPOVP: TStringField
      DisplayLabel = 'Tipo VP'
      FieldName = 'TIPOVP'
      FixedChar = True
      Size = 1
    end
    object cdsVendaPGRUPO_PROD: TIntegerField
      Tag = 2
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsVendaPCOD_PROD: TStringField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsVendaPCODIGO_VP: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod. Tipo Venda P.'
      FieldName = 'CODIGO_VP'
      Required = True
    end
    object cdsVendaPDATA_VNP: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data'
      FieldName = 'DATA_VNP'
      Required = True
    end
    object cdsVendaPCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsVendaPCOD_VENDEDOR: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsVendaPQUANT_PROD_VP: TFloatField
      Tag = 2
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_PROD_VP'
    end
    object cdsVendaPATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsVendaPCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsVendaPNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      FixedChar = True
      Size = 35
    end
    object cdsVendaPCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod. Servi'#231'o'
      FieldName = 'COD_SERVICO'
    end
  end
  object dsVendaP: TDataSource
    DataSet = cdsVendaP
    Left = 24
    Top = 248
  end
  object qrVendaP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select VENDA_PERDIDA.*,clientes.nome_cliente '
      'from VENDA_PERDIDA'
      'left join clientes'
      'on VENDA_PERDIDA.cod_empresa=clientes.cod_empresa'
      'and VENDA_PERDIDA.cod_cliente=clientes.cod_cliente'
      'where VENDA_PERDIDA.cod_empresa=-1')
    Left = 24
    Top = 80
  end
  object dspTipVP: TDataSetProvider
    DataSet = qrTipVp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 97
    Top = 136
  end
  object cdsTipVP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipVP'
    BeforeOpen = cdsVendaPBeforeOpen
    Left = 97
    Top = 192
    object cdsTipVPCODIGO_VP: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_VP'
      Required = True
    end
    object cdsTipVPCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTipVPDESCRICAO_VP: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_VP'
      FixedChar = True
      Size = 25
    end
    object cdsTipVPENT_SUG_VP: TStringField
      DisplayLabel = 'Entr. Sug.'
      FieldName = 'ENT_SUG_VP'
      FixedChar = True
      Size = 1
    end
    object cdsTipVPBX_ENTR_NFE: TStringField
      DisplayLabel = 'Bx Entr NFE'
      FieldName = 'BX_ENTR_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsTipVPATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsTipVP: TDataSource
    DataSet = cdsTipVP
    Left = 97
    Top = 248
  end
  object qrTipVp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from TIPOVP')
    Left = 97
    Top = 80
  end
  object qrColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select nome_vendedor,cod_vendedor from colaborador')
    Left = 171
    Top = 80
  end
  object dspColaborador: TDataSetProvider
    DataSet = qrColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 171
    Top = 136
  end
  object cdsColaborador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColaborador'
    BeforeOpen = cdsVendaPBeforeOpen
    Left = 171
    Top = 192
    object cdsColaboradorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColaboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
  end
  object dsColaborador: TDataSource
    DataSet = cdsColaborador
    Left = 171
    Top = 248
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 245
    Top = 136
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select p.*,'
      'coalesce(est.estoque, 0) estoque_disponivel, '
      'coalesce(est.est_prima, 0) estoque_produzir from PRODUTOS p'
      
        'left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.co' +
        'd_empresa, 0, '#39#39', 0, 0) est on 1 = 1')
    Left = 245
    Top = 80
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsVendaPBeforeOpen
    Left = 245
    Top = 192
    object cdsProdNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      currency = True
    end
    object cdsProdPREC_PUBLICO: TFloatField
      FieldName = 'PREC_PUBLICO'
      currency = True
    end
    object cdsProdNBM: TStringField
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsProdCST_PROD: TStringField
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsProdICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
    end
    object cdsProdCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdMARCA_P: TStringField
      FieldName = 'MARCA_P'
      Size = 30
    end
    object cdsProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProdEM_PROMOCAO: TStringField
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
      currency = True
    end
    object cdsProdPREC_30_PROD: TFloatField
      FieldName = 'PREC_30_PROD'
      currency = True
    end
    object cdsProdPREC_60_PROD: TFloatField
      FieldName = 'PREC_60_PROD'
      currency = True
    end
    object cdsProdPREC_90_PROD: TFloatField
      FieldName = 'PREC_90_PROD'
      currency = True
    end
    object cdsProdDESCR_PROD_RED: TStringField
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProdESTOQUE_DISPONIVEL: TFloatField
      FieldName = 'ESTOQUE_DISPONIVEL'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdESTOQUE_PRODUZIR: TFloatField
      FieldName = 'ESTOQUE_PRODUZIR'
      DisplayFormat = '#,##0.000'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsProd
    Left = 245
    Top = 248
  end
  object dspBarra: TDataSetProvider
    DataSet = qrBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 319
    Top = 136
  end
  object qrBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select grupo_prod,cod_prod from COD_BARRA')
    Left = 319
    Top = 80
  end
  object cdsBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBarra'
    BeforeOpen = cdsVendaPBeforeOpen
    Left = 319
    Top = 192
    object cdsBarraGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsBarraCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsBarra
    Left = 319
    Top = 248
  end
  object dspLocTpVp: TDataSetProvider
    DataSet = qrLocTpVP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 393
    Top = 136
  end
  object cdsLocTpVp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTpVp'
    BeforeOpen = cdsVendaPBeforeOpen
    Left = 393
    Top = 192
    object cdsLocTpVpCODIGO_VP: TIntegerField
      FieldName = 'CODIGO_VP'
      Required = True
    end
    object cdsLocTpVpDESCRICAO_VP: TStringField
      FieldName = 'DESCRICAO_VP'
      FixedChar = True
      Size = 25
    end
  end
  object dsLocTpVp: TDataSource
    DataSet = cdsLocTpVp
    Left = 393
    Top = 248
  end
  object qrLocTpVP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from TIPOVP')
    Left = 393
    Top = 80
  end
  object transacao2: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 8
  end
  object qrCliVP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from clientes where cod_cliente=-1 and cod_empresa=-1')
    Left = 483
    Top = 80
  end
  object dspCliVP: TDataSetProvider
    DataSet = qrCliVP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 483
    Top = 136
  end
  object cdsCliVP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliVP'
    BeforeOpen = cdsVendaPBeforeOpen
    Left = 483
    Top = 192
    object cdsCliVPCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsCliVPNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
  end
  object dsCliVP: TDataSource
    DataSet = cdsCliVP
    Left = 483
    Top = 248
  end
end
