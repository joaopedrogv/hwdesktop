object dtmProducao: TdtmProducao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 505
  Width = 1046
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
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
  object transacao: TIBTransaction
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 105
    Top = 6
  end
  object qrProducao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select p.*,c.nome_cliente,c.razao from producao as p left join c' +
        'lientes as c on p.cod_cliente=c.cod_cliente')
    Left = 23
    Top = 73
  end
  object dspProducao: TDataSetProvider
    DataSet = qrProducao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 23
    Top = 124
  end
  object cdsProducao: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProducao'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 23
    Top = 173
    object cdsProducaoCOD_PRODUCAO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PRODUCAO'
      Required = True
    end
    object cdsProducaoNLOTE: TStringField
      DisplayLabel = 'Numero Lote'
      FieldName = 'NLOTE'
    end
    object cdsProducaoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsProducaoDATA: TDateTimeField
      DisplayLabel = 'Data Abertura'
      FieldName = 'DATA'
    end
    object cdsProducaoDATA_INICIO: TDateTimeField
      DisplayLabel = 'Data Inicio'
      FieldName = 'DATA_INICIO'
    end
    object cdsProducaoHORA_INICIO: TDateTimeField
      DisplayLabel = 'Hora Inicio'
      FieldName = 'HORA_INICIO'
    end
    object cdsProducaoDATA_FECHAMENTO: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECHAMENTO'
    end
    object cdsProducaoHORA_FECHAMENTO: TDateTimeField
      DisplayLabel = 'Hora Fechamento'
      FieldName = 'HORA_FECHAMENTO'
    end
    object cdsProducaoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object cdsProducaoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProducaoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsProducaoNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsProducaoRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsProducaoQUANTIDADEPREVISTA: TFloatField
      DisplayLabel = 'Quantidade Prevista'
      FieldName = 'QUANTIDADEPREVISTA'
      DisplayFormat = '##0.000'
    end
    object cdsProducaoQUANTIDADEPRODUCAO: TFloatField
      DisplayLabel = 'Quantidade Produ'#231#227'o'
      FieldName = 'QUANTIDADEPRODUCAO'
      DisplayFormat = '##0.000'
    end
    object cdsProducaoQUANTIDADEPRODUZIDA: TFloatField
      DisplayLabel = 'Quantidade Produzida'
      FieldName = 'QUANTIDADEPRODUZIDA'
      DisplayFormat = '##0.000'
    end
    object cdsProducaoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProducaoCOD_FORMULA: TIntegerField
      Tag = 1
      DisplayLabel = 'Formula'
      FieldName = 'COD_FORMULA'
    end
    object cdsProducaoCOD_EMP_FORM: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMP_FORM'
    end
    object cdsProducaoTIPO_CONVERSAO: TStringField
      DisplayLabel = 'Tipo Convers'#227'o'
      FieldName = 'TIPO_CONVERSAO'
      Size = 1
    end
    object cdsProducaoGERACAO_AUT: TStringField
      DisplayLabel = 'Gerada automaticamente'
      FieldName = 'GERACAO_AUT'
      FixedChar = True
      Size = 1
    end
  end
  object dsProducao: TDataSource
    DataSet = cdsProducao
    Left = 23
    Top = 227
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 192
    Top = 8
  end
  object qrClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select COD_CLIENTE, NOME_CLIENTE, RAZAO from clientes where cod_' +
        'cliente = 0')
    Left = 172
    Top = 296
  end
  object dspClientes: TDataSetProvider
    DataSet = qrClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 172
    Top = 347
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 172
    Top = 396
    object cdsClientesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 172
    Top = 446
  end
  object dsItemAcab: TDataSource
    DataSet = cdsItemAcab
    Left = 96
    Top = 226
  end
  object cdsItemAcab: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItemAcab'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 96
    Top = 170
    object cdsItemAcabCOD_PRODUCAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUCAO'
      Required = True
    end
    object cdsItemAcabCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItemAcabSEQ: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
    end
    object cdsItemAcabGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsItemAcabCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItemAcabNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsItemAcabDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsItemAcabQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#0.000000'
    end
    object cdsItemAcabUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsItemAcabPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      DisplayFormat = '#0.0000'
    end
    object cdsItemAcabPREC_CUS_PROD: TFloatField
      DisplayLabel = 'Custo na Produ'#231#227'o'
      FieldName = 'PREC_CUS_PROD'
      DisplayFormat = '#0.0000'
    end
    object cdsItemAcabPESO_UN: TFloatField
      DisplayLabel = 'Peso Unit'#225'rio'
      FieldName = 'PESO_UN'
      DisplayFormat = '#0.000'
    end
    object cdsItemAcabPESO_UTIL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_UTIL'
      DisplayFormat = '#0.000'
    end
    object cdsItemAcabCUSTO_INDICE: TFloatField
      FieldName = 'CUSTO_INDICE'
    end
    object cdsItemAcabCUSTO_RATEIO: TFloatField
      FieldName = 'CUSTO_RATEIO'
    end
    object cdsItemAcabNITEM: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItemAcabCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsItemAcabNPED: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NPED'
    end
    object cdsItemAcabTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
  end
  object dspItemAcab: TDataSetProvider
    DataSet = qrItemAcab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 96
    Top = 122
  end
  object qrItemAcab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from producao_item where cod_producao = 0 and cod_empre' +
        'sa = 0 and nitem = 0')
    Left = 96
    Top = 74
  end
  object dsItemInd: TDataSource
    DataSet = cdsItemInd
    Left = 168
    Top = 224
  end
  object cdsItemInd: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItemInd'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 168
    Top = 168
    object cdsItemIndCOD_PRODUCAO: TIntegerField
      DisplayLabel = 'C'#243'digo Producao'
      FieldName = 'COD_PRODUCAO'
      Required = True
    end
    object cdsItemIndCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItemIndGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsItemIndSEQ: TIntegerField
      DisplayLabel = 'Seq Item acabado'
      FieldName = 'SEQ'
    end
    object cdsItemIndSEQN: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'SEQN'
    end
    object cdsItemIndCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItemIndNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsItemIndDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsItemIndUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsItemIndTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo Item'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 2
    end
    object cdsItemIndQUANTIDADE_RECEITA: TFloatField
      DisplayLabel = 'Qtde Receita'
      FieldName = 'QUANTIDADE_RECEITA'
      DisplayFormat = '#0.000000'
    end
    object cdsItemIndQUANTIDADE_UTILIZADA: TFloatField
      DisplayLabel = 'Qtde Pratica'
      FieldName = 'QUANTIDADE_UTILIZADA'
      DisplayFormat = '#0.000000'
    end
    object cdsItemIndQUANTIDADE_PERDA: TFloatField
      DisplayLabel = 'Qtde Perda'
      FieldName = 'QUANTIDADE_PERDA'
      DisplayFormat = '#0.000000'
    end
    object cdsItemIndQUANTIDADE_TEORICA: TFloatField
      DisplayLabel = 'Qtde Te'#243'rica'
      FieldName = 'QUANTIDADE_TEORICA'
      DisplayFormat = '#0.000000'
    end
    object cdsItemIndPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      DisplayFormat = '#0.00'
    end
    object cdsItemIndTIPO_ITEM_DESC: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkInternalCalc
      FieldName = 'TIPO_ITEM_DESC'
      Size = 25
    end
    object cdsItemIndCOD_FORMULA: TIntegerField
      DisplayLabel = 'Formula'
      FieldName = 'COD_FORMULA'
    end
    object cdsItemIndPESO_UN: TFloatField
      DisplayLabel = 'Peso Unit'#225'rio'
      FieldName = 'PESO_UN'
      DisplayFormat = '#0.000'
    end
    object cdsItemIndPESO_UTIL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_UTIL'
      DisplayFormat = '#0.000'
    end
    object cdsItemIndPESO_FORMULA: TFloatField
      DisplayLabel = 'Peso F'#243'rmula'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_FORMULA'
      DisplayFormat = '#0.000'
    end
    object cdsItemIndPESO_PERDA: TFloatField
      DisplayLabel = 'Peso Perda'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_PERDA'
      DisplayFormat = '#0.000'
    end
    object cdsItemIndPESO_TEORICO: TFloatField
      DisplayLabel = 'Peso Te'#243'rico'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_TEORICO'
      DisplayFormat = '#0.000'
    end
    object cdsItemIndSOLVENTE: TStringField
      DisplayLabel = 'Solvente'
      FieldName = 'SOLVENTE'
      Size = 1
    end
    object cdsItemIndSEM_ESTOQUE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEM_ESTOQUE'
      Size = 1
    end
    object cdsItemIndNITEM: TIntegerField
      DisplayLabel = 'ID Item Acabado'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItemIndNITEM_IND: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'NITEM_IND'
      Required = True
    end
    object cdsItemIndCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsItemIndNPED: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NPED'
    end
    object cdsItemIndTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
  end
  object dspItemInd: TDataSetProvider
    DataSet = qrItemInd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 168
    Top = 120
  end
  object qrItemInd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from PRODUCAO_ITEM_INDICE where cod_producao = 0 and co' +
        'd_empresa = 0 and nitem = 0 and nitem_ind = 0')
    Left = 168
    Top = 72
  end
  object dsProd: TDataSource
    DataSet = cdsProd
    Left = 24
    Top = 446
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 24
    Top = 390
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 342
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from produtos where grupo_prod = 0 and cod_prod = 0 and' +
        ' cod_empresa = 0')
    Left = 24
    Top = 296
  end
  object dsCodBarra: TDataSource
    DataSet = cdsCodBarra
    Left = 96
    Top = 446
  end
  object cdsCodBarra: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCodBarra'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 96
    Top = 390
  end
  object dspCodBarra: TDataSetProvider
    DataSet = qrCodBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 96
    Top = 342
  end
  object qrCodBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from cod_barra where grupo_prod = 0 and cod_prod = 0 an' +
        'd cod_empresa = 0')
    Left = 96
    Top = 296
  end
  object dsFormula: TDataSource
    DataSet = cdsFormula
    Left = 576
    Top = 208
  end
  object cdsFormula: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFormula'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 576
    Top = 152
    object cdsFormulaCOD_FORMULA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_FORMULA'
      Required = True
    end
    object cdsFormulaPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      Size = 75
    end
    object cdsFormulaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsFormulaPROCESSO: TMemoField
      DisplayLabel = 'Processo'
      FieldName = 'PROCESSO'
      OnGetText = cdsFormulaPROCESSOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsFormulaUSAR_SOLVENTE: TStringField
      DisplayLabel = 'Tem Solvente'
      FieldName = 'USAR_SOLVENTE'
      FixedChar = True
      Size = 1
    end
    object cdsFormulaNUM_FAB_PROD: TStringField
      DisplayLabel = 'Codigo Solvente'
      FieldName = 'NUM_FAB_PROD'
      ProviderFlags = [pfInWhere]
    end
    object cdsFormulaPROD_SOLVENTE: TStringField
      DisplayLabel = 'Solvente'
      FieldName = 'PROD_SOLVENTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 75
    end
    object cdsFormulaGRUPO_PROD_SOLV: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo Solvente'
      FieldName = 'GRUPO_PROD_SOLV'
    end
    object cdsFormulaCOD_PROD_SOLV: TStringField
      Tag = 1
      DisplayLabel = 'Cod Prod Solvente'
      FieldName = 'COD_PROD_SOLV'
      FixedChar = True
      Size = 6
    end
    object cdsFormulaCOD_EMP_SOLV: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Solvente'
      FieldName = 'COD_EMP_SOLV'
    end
    object cdsFormulaGRUPO_PROD_SIMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD_SIMP'
    end
    object cdsFormulaCOD_PROD_SIMP: TStringField
      Tag = 1
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD_SIMP'
      FixedChar = True
      Size = 6
    end
    object cdsFormulaCOD_EMP_SIMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMP_SIMP'
    end
    object cdsFormulaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFormulaATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsFormulaPROD_FORMULA: TStringField
      Tag = 1
      DisplayLabel = 'Prod Formula'
      FieldName = 'PROD_FORMULA'
      FixedChar = True
      Size = 75
    end
    object cdsFormulaPROD_SOLVENTE_C: TStringField
      Tag = 1
      DisplayLabel = 'Solvente'
      FieldKind = fkInternalCalc
      FieldName = 'PROD_SOLVENTE_C'
      Size = 75
    end
    object cdsFormulaNUM_FAB_PROD_S: TStringField
      Tag = 1
      DisplayLabel = 'Codigo Solvente'
      FieldKind = fkInternalCalc
      FieldName = 'NUM_FAB_PROD_S'
    end
    object cdsFormulaTEXTO_IMPRESSAO1: TMemoField
      DisplayLabel = 'Texto 1 Produ'#231#227'o'
      FieldName = 'TEXTO_IMPRESSAO1'
      OnGetText = cdsFormulaPROCESSOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsFormulaTEXTO_IMPRESSAO2: TMemoField
      DisplayLabel = 'Texto 2 Produ'#231#227'o'
      FieldName = 'TEXTO_IMPRESSAO2'
      OnGetText = cdsFormulaPROCESSOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsFormulaUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsFormulaTIPO_CONVERSAO: TStringField
      DisplayLabel = 'Tipo Convers'#227'o'
      FieldName = 'TIPO_CONVERSAO'
      Size = 1
    end
  end
  object dspFormula: TDataSetProvider
    DataSet = qrFormula
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 576
    Top = 104
  end
  object qrFormula: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select formula_producao.*, pl.descr_prod prod_solvente, ps.descr' +
        '_prod prod_formula from formula_producao'
      
        'left join produtos pl on pl.grupo_prod = formula_producao.grupo_' +
        'prod_solv and pl.cod_prod = formula_producao.cod_prod_solv'
      'and pl.cod_empresa = formula_producao.cod_emp_solv'
      
        'left join produtos ps on ps.grupo_prod = formula_producao.grupo_' +
        'prod_solv and ps.cod_prod = formula_producao.cod_prod_solv'
      'and ps.cod_empresa = formula_producao.cod_emp_solv'
      
        'where formula_producao.cod_formula = 0 and formula_producao.cod_' +
        'empresa = 0')
    Left = 576
    Top = 56
  end
  object dsFrmlProd: TDataSource
    DataSet = cdsFrmlProd
    Left = 648
    Top = 208
  end
  object cdsFrmlProd: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFrmlProd'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 648
    Top = 152
    object cdsFrmlProdCOD_FORMULA: TIntegerField
      DisplayLabel = 'Formula'
      FieldName = 'COD_FORMULA'
      Required = True
    end
    object cdsFrmlProdNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsFrmlProdDESCR_PROD: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsFrmlProdUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsFrmlProdCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFrmlProdGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsFrmlProdCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsFrmlProdQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#0.000000'
    end
    object cdsFrmlProdSOLVENTE: TStringField
      DisplayLabel = 'Solvente'
      FieldName = 'SOLVENTE'
      FixedChar = True
      Size = 1
    end
  end
  object dspFrmlProd: TDataSetProvider
    DataSet = qrFrmlProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 648
    Top = 104
  end
  object qrFrmlProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select fpp.* from FORMULA_PRODUCAO_PRODUTOS fpp'
      
        'where fpp.cod_formula = 0 and fpp.cod_empresa = 0 and fpp.grupo_' +
        'prod = 0 and fpp.cod_prod = '#39#39)
    Left = 648
    Top = 56
  end
  object dsRec: TDataSource
    DataSet = cdsRec
    Left = 240
    Top = 448
  end
  object cdsRec: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRec'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 240
    Top = 392
    object cdsRecCOD_RECEITA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_RECEITA'
      Required = True
    end
    object cdsRecTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 30
    end
    object cdsRecPROCESSO_PRODUCAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o do Processo'
      FieldName = 'PROCESSO_PRODUCAO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dspRec: TDataSetProvider
    DataSet = qrRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 240
    Top = 344
  end
  object qrRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from rec_ass'
      'where cod_receita = 0 and cod_empresa = 0')
    Left = 240
    Top = 296
  end
  object dsFormCons: TDataSource
    DataSet = cdsFormCons
    Left = 304
    Top = 448
  end
  object cdsFormCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFormCons'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 304
    Top = 392
  end
  object dspFormCons: TDataSetProvider
    DataSet = qrFormCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 304
    Top = 344
  end
  object qrFormCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select fp.cod_formula, fp.produto, fp.processo, fp.usar_solvente' +
        ', fpp.grupo_prod, fpp.cod_prod,'
      
        'fpp.quantidade, fpp.solvente, p.num_fab_prod, p.unidade, p.peso_' +
        'brut_prod from formula_producao fp'
      
        'inner join formula_producao_produtos fpp on fpp.cod_formula = fp' +
        '.cod_formula and fpp.cod_empresa = fp.cod_empresa'
      
        'inner join produtos p on p.grupo_prod = fpp.grupo_prod and p.cod' +
        '_prod = fpp.cod_prod'
      'and p.cod_empresa = fpp.cod_empresa'
      'where fp.cod_formula = 0 and fp.cod_empresa = 0')
    Left = 304
    Top = 296
  end
  object dsPC: TDataSource
    DataSet = cdsPC
    Left = 376
    Top = 448
  end
  object cdsPC: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPC'
    BeforeOpen = cdsProducaoBeforeOpen
    Left = 376
    Top = 392
    object cdsPCNUM_PED: TIntegerField
      DisplayLabel = 'N'#176' Pedido'
      FieldName = 'NUM_PED'
      Required = True
    end
    object cdsPCGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsPCCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPCNUM_FAB_PROD: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsPCDESCR_PROD: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'DESCR_PROD'
      Size = 60
    end
    object cdsPCQUANT_IT_PROD: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_IT_PROD'
      DisplayFormat = '#0.000000'
    end
    object cdsPCVAL_UNT_IT: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VAL_UNT_IT'
      DisplayFormat = '#0.000'
    end
    object cdsPCVAL_TOT_IT: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VAL_TOT_IT'
      DisplayFormat = '#0.00'
    end
    object cdsPCCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPCCODIGO_F: TIntegerField
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'CODIGO_F'
      Required = True
    end
    object cdsPCRAZAO: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsPCCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsPCDATA_ENV_PED: TDateTimeField
      DisplayLabel = 'Data Pedido'
      FieldName = 'DATA_ENV_PED'
    end
    object cdsPCVAL_TOT_PED: TFloatField
      DisplayLabel = 'Total Pedido'
      FieldName = 'VAL_TOT_PED'
      DisplayFormat = '#0.00'
    end
    object cdsPCNOME_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object cdsPCCGC_EMP: TStringField
      DisplayLabel = 'CNPJ Empresa'
      FieldName = 'CGC_EMP'
      Size = 18
    end
    object cdsPCSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsPCNITEM: TIntegerField
      DisplayLabel = 'N'#176' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsPCCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
  end
  object dspPC: TDataSetProvider
    DataSet = qrPC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 376
    Top = 344
  end
  object qrPC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select pe.num_ped, ip.nitem, ip.grupo_prod, ip.cod_prod, p.num_f' +
        'ab_prod, ip.descr_prod, ip.quant_it_prod, ip.val_unt_it,'
      
        'ip.val_tot_it, pe.cod_empresa, pe.codigo_f, c.cpfcgc, c.razao, p' +
        'e.data_env_ped, pe.val_tot_ped, e.nome_emp, e.cgc_emp'
      'from pedido pe'
      
        'inner join item_pedido ip on ip.num_ped = pe.num_ped and ip.cod_' +
        'empresa = pe.cod_empresa'
      
        'inner join produtos p on p.grupo_prod = ip.grupo_prod and p.cod_' +
        'prod = ip.cod_prod and p.cod_empresa = ip.cod_empresa'
      'inner join empresa e on e.cod_empresa = pe.cod_empresa'
      
        'left join clientes c on c.cod_cliente = pe.codigo_f and c.cod_em' +
        'presa = pe.cod_empresa')
    Left = 376
    Top = 296
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 8
    object cdsTempGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsTempCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsTempNUM_FAB_PROD: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsTempNUM_FAB_FORNECEDOR: TStringField
      DisplayLabel = 'Codigo no Pedido'
      FieldName = 'NUM_FAB_FORNECEDOR'
    end
    object cdsTempDESCR_PROD: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'DESCR_PROD'
      Size = 60
    end
    object cdsTempQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#0.000000'
    end
    object cdsTempNUM_PED: TIntegerField
      FieldName = 'NUM_PED'
    end
    object cdsTempCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsTempNOME_EMP: TStringField
      DisplayLabel = 'Nome Empresa'
      FieldName = 'NOME_EMP'
      Size = 60
    end
    object cdsTempCGC_EMP: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGC_EMP'
      Size = 18
    end
    object cdsTempCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
  end
  object dsTemp: TDataSource
    DataSet = cdsTemp
    Left = 392
    Top = 8
  end
end
