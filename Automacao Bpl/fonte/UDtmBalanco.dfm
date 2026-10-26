object dtmBalanco: TdtmBalanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 607
  Width = 611
  object qrBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, '
      
        'pr.num_fab_prod, pr.descr_prod, pr.descr_prod_red, pr.prec_cusm_' +
        'prod, pr.prec_tab_prod, pr.prec_publico, pr.nbm, '
      
        'pr.cst_prod, pr.icm_prod, pr.codigo_nop, pr.marca_p, pr.unidade,' +
        ' pr.em_promocao, '
      
        'pr.preco_promocao, pr.prec_30_prod, pr.prec_60_prod, pr.prec_90_' +
        'prod,'
      'pr.est_f, pr.locacao_prod, pr.locacao_prod_1,'
      'cast(0 as float) estoque_disponivel, '
      'cast(0 as float) estoque_produzir from PRODUTOS pr')
    Left = 33
    Top = 5
  end
  object dspBalanco: TDataSetProvider
    DataSet = qrBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 33
    Top = 56
  end
  object cdsBalanco: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBalanco'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 33
    Top = 115
    object IntegerField2: TIntegerField
      Tag = 2
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object StringField1: TStringField
      Tag = 2
      DisplayLabel = 'Cod. Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object IntegerField1: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsBalancoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsBalancoPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
    end
    object StringField9: TStringField
      DisplayLabel = 'Loca'#231#227'o do Produto'
      FieldName = 'LOCACAO_PROD'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object StringField23: TStringField
      DisplayLabel = 'Loca'#231#227'o do Produto 1'
      FieldName = 'LOCACAO_PROD_1'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsBalancoDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsBalancoDESCR_PROD_RED: TStringField
      DisplayLabel = 'Descri'#231#227'o Reduzida'
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsBalancoPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Tabela'
      FieldName = 'PREC_TAB_PROD'
    end
    object cdsBalancoPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o P'#250'blico'
      FieldName = 'PREC_PUBLICO'
    end
    object cdsBalancoNBM: TStringField
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsBalancoCST_PROD: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsBalancoICM_PROD: TFloatField
      DisplayLabel = 'ICMS'
      FieldName = 'ICM_PROD'
    end
    object cdsBalancoCODIGO_NOP: TFloatField
      DisplayLabel = 'Cod Natureza Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object cdsBalancoMARCA_P: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_P'
      Size = 30
    end
    object cdsBalancoUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsBalancoEM_PROMOCAO: TStringField
      DisplayLabel = 'Em Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsBalancoPRECO_PROMOCAO: TFloatField
      DisplayLabel = 'Pre'#231'o de Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
    end
    object cdsBalancoPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
    end
    object cdsBalancoPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
    end
    object cdsBalancoPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
    end
    object cdsBalancoESTOQUE_DISPONIVEL: TFloatField
      DisplayLabel = 'Estoque Dispon'#237'vel'
      FieldName = 'ESTOQUE_DISPONIVEL'
    end
    object cdsBalancoESTOQUE_PRODUZIR: TFloatField
      DisplayLabel = 'Qtde Produzir'
      FieldName = 'ESTOQUE_PRODUZIR'
    end
  end
  object qrContadoBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select * from balanco_produtos where cod_prod = -3')
    Left = 170
    Top = 234
  end
  object dspContadoBalanco: TDataSetProvider
    DataSet = qrContadoBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 170
    Top = 285
  end
  object cdsContadoBalanco: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContadoBalanco'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 506
    Top = 187
    object cdsContadoBalancoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsContadoBalancoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsContadoBalancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContadoBalancoCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      FixedChar = True
    end
    object cdsContadoBalancoQTDE_PROD: TFloatField
      FieldName = 'QTDE_PROD'
    end
    object cdsContadoBalancoLOCACAO1_PROD: TStringField
      FieldName = 'LOCACAO1_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsContadoBalancoLOCACAO2_PROD: TStringField
      FieldName = 'LOCACAO2_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsContadoBalancoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsContadoBalancoDATA_HORA_LEITURA: TDateTimeField
      FieldName = 'DATA_HORA_LEITURA'
    end
    object cdsContadoBalancoPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsContadoBalancoQTD_DIF_BAL: TFloatField
      FieldName = 'QTD_DIF_BAL'
    end
    object cdsContadoBalancoCODUSUARIO: TIntegerField
      FieldName = 'CODUSUARIO'
    end
  end
  object qrEstoqueINI: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select * from ESTOQUE_INI WHERE COD_PROD = -3')
    Left = 151
    Top = 12
  end
  object dspEstoqueINI: TDataSetProvider
    DataSet = qrEstoqueINI
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 151
    Top = 63
  end
  object cdsEstoqueINI: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEstoqueINI'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 151
    Top = 122
    object cdsEstoqueINIGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsEstoqueINICOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsEstoqueINIDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsEstoqueINICOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEstoqueININUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsEstoqueINILOCACAO_PROD: TStringField
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsEstoqueINILOCACAO_PROD_1: TStringField
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
    object cdsEstoqueINIQUANT_EST: TFloatField
      FieldName = 'QUANT_EST'
    end
    object cdsEstoqueINIQUANT_TRANS: TFloatField
      FieldName = 'QUANT_TRANS'
    end
    object cdsEstoqueINIQUANT_REQ: TFloatField
      FieldName = 'QUANT_REQ'
    end
    object cdsEstoqueINIDATA_CONFIRM: TDateTimeField
      FieldName = 'DATA_CONFIRM'
    end
    object cdsEstoqueINITIP_BAL: TStringField
      FieldName = 'TIP_BAL'
      FixedChar = True
      Size = 1
    end
    object cdsEstoqueINIQTD_DIF_BAL: TFloatField
      FieldName = 'QTD_DIF_BAL'
    end
    object cdsEstoqueINIATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsEstoqueINIPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
    end
    object cdsEstoqueINIQUANT_PRODUCAO: TFloatField
      FieldName = 'QUANT_PRODUCAO'
    end
  end
  object qrGradeBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select * from COD_GRADE_PROD WHERE COD_PROD = -3')
    Left = 271
    Top = 12
  end
  object dspGradeBalanco: TDataSetProvider
    DataSet = qrGradeBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 271
    Top = 63
  end
  object cdsGradeBalanco: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGradeBalanco'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 271
    Top = 122
    object cdsGradeBalancoGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsGradeBalancoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGradeBalancoCOD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'digo da grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradeBalancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGradeBalancoQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object cdsGradeBalancoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsGradeBalancoQTD_ETIQUETAS: TIntegerField
      FieldName = 'QTD_ETIQUETAS'
    end
  end
  object qrGradeContBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select * from cod_grade_balanco WHERE COD_PROD = -3')
    Left = 287
    Top = 212
  end
  object dspGradeContBalanco: TDataSetProvider
    DataSet = qrGradeContBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 287
    Top = 271
  end
  object cdsGradeContBalanco: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGradeContBalanco'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 287
    Top = 322
  end
  object qrEstoqueINIGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select * from ESTOQUE_INI_GRADE WHERE COD_PROD = -3')
    Left = 39
    Top = 204
  end
  object dspEstoqueINIGrade: TDataSetProvider
    DataSet = qrEstoqueINIGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 39
    Top = 263
  end
  object cdsEstoqueINIGrade: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEstoqueINIGrade'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 47
    Top = 322
    object cdsEstoqueINIGradeGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsEstoqueINIGradeCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsEstoqueINIGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsEstoqueINIGradeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEstoqueINIGradeNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsEstoqueINIGradeLOCACAO_PROD: TStringField
      FieldName = 'LOCACAO_PROD'
      FixedChar = True
      Size = 8
    end
    object cdsEstoqueINIGradeLOCACAO_PROD_1: TStringField
      FieldName = 'LOCACAO_PROD_1'
      FixedChar = True
      Size = 8
    end
    object cdsEstoqueINIGradeQUANT_EST: TFloatField
      FieldName = 'QUANT_EST'
    end
    object cdsEstoqueINIGradeQUANT_TRANS: TFloatField
      FieldName = 'QUANT_TRANS'
    end
    object cdsEstoqueINIGradeQUANT_REQ: TFloatField
      FieldName = 'QUANT_REQ'
    end
    object cdsEstoqueINIGradeDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsEstoqueINIGradeDATA_CONFIRM: TDateTimeField
      FieldName = 'DATA_CONFIRM'
      Required = True
    end
    object cdsEstoqueINIGradeATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrVisGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      
        'select p.cod_prod,p.grupo_prod,  g.cod_grade,g.descricao,g.descr' +
        'icao1,p.qtde from COD_GRADE_PROD as p,GRADE as g WHERE COD_PROD ' +
        '= -3')
    Left = 359
    Top = 4
  end
  object dspVisGrade: TDataSetProvider
    DataSet = qrVisGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 359
    Top = 55
  end
  object cdsVisGrade: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVisGrade'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 359
    Top = 114
    object cdsVisGradeCOD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'd. grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsVisGradeQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsVisGradeDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsVisGradeDESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsVisGradeCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsVisGradeGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
  end
  object dsVisGrade: TDataSource
    DataSet = cdsVisGrade
    Left = 364
    Top = 167
  end
  object IBTransBalanco: TIBTransaction
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 433
    Top = 9
  end
  object qrProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select p.*,'
      'coalesce(est.estoque, 0) estoque_disponivel, '
      'coalesce(est.est_prima, 0) estoque_produzir from produtos p'
      
        'left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.co' +
        'd_empresa, 0, '#39#39', 0, 0) est on 1 = 1 ')
    Left = 489
    Top = 250
  end
  object qrZerados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    Left = 488
    Top = 304
  end
  object rdZerados: TRDprint
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
    OnNewPage = rdZeradosNewPage
    Left = 432
    Top = 115
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    Left = 488
    Top = 352
  end
  object qrDiferenca: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    Left = 416
    Top = 352
  end
  object qrTranfArqBal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select * from pcbal.dbf')
    Left = 416
    Top = 304
  end
  object qrProdutosRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select *  from PRODUTOS')
    Left = 417
    Top = 242
  end
  object qrContRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    Left = 168
    Top = 176
  end
  object rdRelCont: TRDprint
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
    OnNewPage = rdRelContNewPage
    Left = 432
    Top = 59
  end
  object qrSomasProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    Left = 505
    Top = 133
  end
  object SpMovEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    StoredProcName = 'MOVIMENTA_ESTOQUE'
    Left = 532
    Top = 9
  end
  object qrBalancoDia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      'select distinct'
      
        '  ((select result from strzero(extract(day from data_hora_leitur' +
        'a), 2)) ||'#39'/'#39'||'
      
        '   (select result from strzero(extract(month from data_hora_leit' +
        'ura), 2)) ||'#39'/'#39'||'
      
        '    (select result from strzero(extract(year from data_hora_leit' +
        'ura), 4))) data,'
      '  ((extract(year from data_hora_leitura) * 365) +'
      '   (extract(month from data_hora_leitura) * 12) +'
      '   (extract(day from data_hora_leitura))) data_hora_leitura,'
      ' cod_empresa'
      ' from balanco_produtos'
      ' where cod_empresa  = 1'
      ' order by 2')
    Left = 49
    Top = 381
  end
  object dspBalancoDia: TDataSetProvider
    DataSet = qrBalancoDia
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 49
    Top = 432
  end
  object cdsBalancoDia: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBalancoDia'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 49
    Top = 491
    object cdsBalancoDiaDATA: TStringField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Size = 152
    end
    object cdsBalancoDiaDATA_HORA_LEITURA: TLargeintField
      DisplayLabel = 'Data Hora Leitura'
      FieldName = 'DATA_HORA_LEITURA'
    end
    object cdsBalancoDiaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object dsBalancoDia: TDataSource
    DataSet = cdsBalancoDia
    Left = 48
    Top = 544
  end
  object qrBalancoRegistro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBalanco
    SQL.Strings = (
      
        'select b.data_hora_leitura, b.grupo_prod, b.cod_prod, b.cod_empr' +
        'esa, b.cod_barra,'
      'coalesce(codgra.cod_grade, 0) cod_grade, '
      'coalesce(gr.descricao, '#39'SEM GRADE'#39') descricao,'
      'coalesce(gr.descricao1, '#39'SEM GRADE'#39') descricao1,'
      'case when (codgra.cod_grade > 0) then'
      '       codgra.qtde'
      '     else'
      '       b.qtde_prod'
      'end qtde_cont, '
      'pr.descr_prod from balanco_produtos b'
      'inner join produtos pr on '
      '    pr.grupo_prod = b.grupo_prod'
      '    and pr.cod_prod = b.cod_prod'
      '    and pr.cod_empresa = b.cod_empresa'
      'left join cod_grade_balanco codgra on'
      '    codgra.grupo_prod = b.grupo_prod'
      '    and codgra.cod_prod = b.cod_prod'
      '    and codgra.cod_empresa = b.cod_empresa'
      'left join grade gr on'
      '    gr.cod_grade = codgra.cod_grade'
      '    and gr.cod_empresa = codgra.cod_empresa'
      'where b.cod_empresa = 1')
    Left = 161
    Top = 381
  end
  object dspBalancoRegistro: TDataSetProvider
    DataSet = qrBalancoRegistro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 161
    Top = 432
  end
  object cdsBalancoRegistro: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBalancoRegistro'
    BeforeOpen = cdsBalancoBeforeOpen
    Left = 161
    Top = 491
    object cdsBalancoRegistroCOD_BARRA: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'COD_BARRA'
      FixedChar = True
    end
    object cdsBalancoRegistroDATA_HORA_LEITURA: TDateTimeField
      DisplayLabel = 'Data e Hora'
      FieldName = 'DATA_HORA_LEITURA'
    end
    object cdsBalancoRegistroQTDE_CONT: TFloatField
      DisplayLabel = 'Qtd Contada'
      FieldName = 'QTDE_CONT'
    end
    object cdsBalancoRegistroGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsBalancoRegistroCOD_PROD: TStringField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsBalancoRegistroCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod. Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsBalancoRegistroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o 1 Grade'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 32
    end
    object cdsBalancoRegistroDESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2 Grade'
      FieldName = 'DESCRICAO1'
      FixedChar = True
      Size = 32
    end
    object cdsBalancoRegistroCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsBalancoRegistroDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
  end
  object dsBalancoRegistro: TDataSource
    DataSet = cdsBalancoRegistro
    Left = 160
    Top = 544
  end
end
