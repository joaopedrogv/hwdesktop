object dtmRelatorios: TdtmRelatorios
  OldCreateOrder = False
  Height = 1388
  Width = 1299
  object RDprint1: TRDprint
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
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 132
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 184
    Top = 24
  end
  object TransRelatorios: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 40
    Top = 24
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 120
    Top = 24
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 48
    Top = 88
  end
  object qrbuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 176
    Top = 88
  end
  object qrbuscas3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 248
    Top = 88
  end
  object qrbuscas4: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 316
    Top = 88
  end
  object qrbuscas5: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 376
    Top = 88
  end
  object qrbuscas6: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 48
    Top = 136
  end
  object qrbuscas7: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 104
    Top = 136
  end
  object qrLocG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT * from grupos'
      '')
    Left = 15
    Top = 198
  end
  object dspLocG: TDataSetProvider
    DataSet = qrLocG
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 15
    Top = 246
  end
  object cdsLocG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocG'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 15
    Top = 295
    object cdsLocGCODIGO_GRUP: TIntegerField
      FieldName = 'CODIGO_GRUP'
      Required = True
    end
    object cdsLocGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dsLocG: TDataSource
    DataSet = cdsLocG
    Left = 15
    Top = 344
  end
  object cdsLocColab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocColab'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 98
    Top = 298
    object cdsLocColabCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsLocColabNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome do Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsLocColab: TDataSource
    DataSet = cdsLocColab
    Left = 98
    Top = 346
  end
  object dspLocColab: TDataSetProvider
    DataSet = qrLocColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 98
    Top = 249
  end
  object qrLocColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C'
      'INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao'
      'WHERE C.cod_empresa = 1 AND C.ativo = 1')
    Left = 98
    Top = 198
  end
  object cdsLocTipVnd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipVnd'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 178
    Top = 298
    object cdsLocTipVndDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object cdsLocTipVndTIPO_OS: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object cdsLocTipVndSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipVnd: TDataSource
    DataSet = cdsLocTipVnd
    Left = 178
    Top = 346
  end
  object dspLocTipVnd: TDataSetProvider
    DataSet = qrLocTipVnd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 178
    Top = 249
  end
  object qrLocTipVnd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 178
    Top = 198
  end
  object qrBuscas1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 104
    Top = 88
  end
  object cdsLocTipoOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipoOS'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 265
    Top = 298
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipoOS: TDataSource
    DataSet = cdsLocTipoOS
    Left = 265
    Top = 346
  end
  object dspLocTipoOS: TDataSetProvider
    DataSet = qrLocTipoOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 265
    Top = 249
  end
  object qrLocTipoOS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 265
    Top = 198
  end
  object qrBuscasGerais: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 320
    Top = 136
  end
  object cdsListaFuncoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaFuncoes'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 527
    Top = 298
    object cdsListaFuncoesCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
      Required = True
    end
    object cdsListaFuncoesDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
  end
  object dsListaFuncoes: TDataSource
    DataSet = cdsListaFuncoes
    Left = 527
    Top = 346
  end
  object dspListaFuncoes: TDataSetProvider
    DataSet = qrListaFuncoes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 527
    Top = 249
  end
  object qrListaFuncoes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT * FROM FUNCOES'
      'where ativo=1')
    Left = 527
    Top = 198
  end
  object cdsListaCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaCFOP'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 602
    Top = 298
    object cdsListaCFOPCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsListaCFOPDESCRICAO_NOP: TStringField
      FieldName = 'DESCRICAO_NOP'
      Size = 192
    end
  end
  object dsListaCFOP: TDataSource
    DataSet = cdsListaCFOP
    Left = 602
    Top = 346
  end
  object dspListaCFOP: TDataSetProvider
    DataSet = qrListaCFOP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 602
    Top = 249
  end
  object qrListaCFOP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT * FROM NAT_OP'
      'where ativo=1')
    Left = 602
    Top = 198
  end
  object cdsListaCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaCondPag'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 682
    Top = 298
    object cdsListaCondPagCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsListaCondPagDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
  end
  object dsListaCondPag: TDataSource
    DataSet = cdsListaCondPag
    Left = 682
    Top = 346
  end
  object dspListaCondPag: TDataSetProvider
    DataSet = qrListaCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 682
    Top = 249
  end
  object qrListaCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT COD_COND_PAG,DESC_COND_PAG  FROM cond_pag'
      'where ativo=1')
    Left = 682
    Top = 198
  end
  object cdsListaCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaCliente'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 765
    Top = 306
    object cdsListaClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsListaClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
  end
  object dsListaCliente: TDataSource
    DataSet = cdsListaCliente
    Left = 765
    Top = 354
  end
  object dspListaCliente: TDataSetProvider
    DataSet = qrListaCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 765
    Top = 257
  end
  object qrListaCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT COD_CLIENTE, NOME_CLIENTE  FROM CLIENTES'
      'where ativo=1')
    Left = 765
    Top = 206
  end
  object cdsListaEquip: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaEquip'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 845
    Top = 306
    object cdsListaEquipCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsListaEquipNOM_EQUIP: TStringField
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
  end
  object dsListaEquip: TDataSource
    DataSet = cdsListaEquip
    Left = 845
    Top = 354
  end
  object dspListaEquip: TDataSetProvider
    DataSet = qrListaEquip
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 845
    Top = 257
  end
  object qrListaEquip: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT COD_EQUIP, NOM_EQUIP  FROM EQUIPAMENTO'
      'where ativo=1')
    Left = 845
    Top = 206
  end
  object cdsApuracaoICMSTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsLocGBeforeOpen
    Left = 707
    Top = 31
    object cdsApuracaoICMSTempTIPO: TStringField
      FieldName = 'TIPO'
    end
    object cdsApuracaoICMSTempNUMDOC: TStringField
      FieldName = 'NUMDOC'
    end
    object cdsApuracaoICMSTempNATUREZA: TStringField
      FieldName = 'NATUREZA'
    end
    object cdsApuracaoICMSTempCODFISCAL: TStringField
      FieldName = 'CODFISCAL'
    end
    object cdsApuracaoICMSTempVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsApuracaoICMSTempVALOR_LIQUIDO: TFloatField
      FieldName = 'VALOR_LIQUIDO'
    end
    object cdsApuracaoICMSTempOUTRAS_DES: TFloatField
      FieldName = 'OUTRAS_DES'
    end
    object cdsApuracaoICMSTempVALOR_ISENTO: TFloatField
      FieldName = 'VALOR_ISENTO'
    end
    object cdsApuracaoICMSTempCFOP: TStringField
      FieldName = 'CFOP'
    end
    object cdsApuracaoICMSTempUF: TStringField
      FieldName = 'UF'
    end
    object cdsApuracaoICMSTempDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsApuracaoICMSTempSERIE: TStringField
      FieldName = 'SERIE'
    end
    object cdsApuracaoICMSTempMODELO: TStringField
      FieldName = 'MODELO'
    end
    object cdsApuracaoICMSTempCOD_CLI: TStringField
      FieldName = 'COD_CLI'
      Size = 40
    end
    object cdsApuracaoICMSTempDATA_EMISSAO: TDateTimeField
      FieldName = 'DATA_EMISSAO'
    end
    object cdsApuracaoICMSTempCOD: TStringField
      FieldName = 'COD'
    end
    object cdsApuracaoICMSTempALIQ_ICM: TStringField
      FieldName = 'ALIQ_ICM'
    end
    object cdsApuracaoICMSTempBASE_ICM: TFloatField
      FieldName = 'BASE_ICM'
    end
    object cdsApuracaoICMSTempVALOR_ICM: TFloatField
      FieldName = 'VALOR_ICM'
    end
    object cdsApuracaoICMSTempALIQ_ICMSUB: TFloatField
      FieldName = 'ALIQ_ICMSUB'
    end
    object cdsApuracaoICMSTempBASE_ICMSUB: TFloatField
      FieldName = 'BASE_ICMSUB'
    end
    object cdsApuracaoICMSTempVALOR_ICMSUB: TFloatField
      FieldName = 'VALOR_ICMSUB'
    end
    object cdsApuracaoICMSTempALIQ_IPI: TFloatField
      FieldName = 'ALIQ_IPI'
    end
    object cdsApuracaoICMSTempBASE_IPI: TFloatField
      FieldName = 'BASE_IPI'
    end
    object cdsApuracaoICMSTempVALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
    end
    object cdsApuracaoICMSTempDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object cdsApuracaoICMSTempOBS: TStringField
      FieldName = 'OBS'
    end
    object cdsApuracaoICMSTempCONTRIBUINTE: TStringField
      FieldName = 'CONTRIBUINTE'
    end
  end
  object dsApuracaoICMSTemp: TDataSource
    DataSet = cdsApuracaoICMSTemp
    Left = 707
    Top = 79
  end
  object cdsApuracaoICMSTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsLocGBeforeOpen
    Left = 836
    Top = 31
    object cdsApuracaoICMSTemp2CFOP: TStringField
      FieldName = 'CFOP'
    end
    object cdsApuracaoICMSTemp2VALOR_LIQUIDO: TFloatField
      FieldName = 'VALOR_LIQUIDO'
    end
    object cdsApuracaoICMSTemp2BASE_ICM: TFloatField
      FieldName = 'BASE_ICM'
    end
    object cdsApuracaoICMSTemp2VALOR_ICM: TFloatField
      FieldName = 'VALOR_ICM'
    end
    object cdsApuracaoICMSTemp2DESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object cdsApuracaoICMSTemp2VALOR_ISENTO: TFloatField
      FieldName = 'VALOR_ISENTO'
    end
    object cdsApuracaoICMSTemp2OUTRAS_DES: TFloatField
      FieldName = 'OUTRAS_DES'
    end
    object cdsApuracaoICMSTemp2BASE_IPI: TFloatField
      FieldName = 'BASE_IPI'
    end
    object cdsApuracaoICMSTemp2VALOR_IPI: TFloatField
      FieldName = 'VALOR_IPI'
    end
  end
  object dsApuracaoICMSTemp2: TDataSource
    DataSet = cdsApuracaoICMSTemp2
    Left = 836
    Top = 79
  end
  object IBUpdateSQL99: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  COD_EMPRESA,'
      '  DESCRICAO,'
      '  CILINDRADA,'
      '  DESFAB,'
      '  CODIGOFAB,'
      '  CILINDROS,'
      '  COMBUSTIVEL,'
      '  HP,'
      '  LOTACAO,'
      '  TIPO,'
      '  RENAVAM,'
      '  AFATURAR,'
      '  VNDESTOQUE,'
      '  VALTAB,'
      '  VLBICMSUB,'
      '  VLICMSUB,'
      '  ANO1,'
      '  MODELO1,'
      '  INICHASSI1,'
      '  ANO2,'
      '  MODELO2,'
      '  INICHASSI2,'
      '  ORDTIPO,'
      '  PISCOFINS,'
      '  COD_FIPE,'
      '  ATIVO,'
      '  NOME_PLAN,'
      '  URL_HONDA,'
      '  SITE,'
      '  MES_RET_SERV1,'
      '  KM_RET_SERV1,'
      '  MES_RET_SERV3,'
      '  KM_RET_SERV3,'
      '  INTERV_KM_SERV,'
      '  TIP_VEICULO,'
      '  CMKG,'
      '  DISTANCIAEIXO,'
      '  PESOL,'
      '  PESOB,'
      '  VL_UNITARIO_NF,'
      '  ESPRENAVAM,'
      '  NCMSH,'
      '  TPCOMB,'
      '  VALOR_PIS,'
      '  VALOR_COFINS,'
      '  MARCA_DESC,'
      '  COD_CTA_EST_VEIC,'
      '  COD_CTA_EST_SEMI,'
      '  COD_MARCA,'
      '  COD_COMBUSTIVEL,'
      '  COD_TIPO_ESP,'
      '  ORD_MOD,'
      '  PERC_RED,'
      '  RED_LUCRO'
      'from tipmodelo '
      'where'
      '  AFATURAR = :AFATURAR and'
      '  ANO1 = :ANO1 and'
      '  ANO2 = :ANO2 and'
      '  ATIVO = :ATIVO and'
      '  CILINDRADA = :CILINDRADA and'
      '  CILINDROS = :CILINDROS and'
      '  CMKG = :CMKG and'
      '  COD_COMBUSTIVEL = :COD_COMBUSTIVEL and'
      '  COD_CTA_EST_SEMI = :COD_CTA_EST_SEMI and'
      '  COD_CTA_EST_VEIC = :COD_CTA_EST_VEIC and'
      '  COD_EMPRESA = :COD_EMPRESA and'
      '  COD_FIPE = :COD_FIPE and'
      '  COD_MARCA = :COD_MARCA and'
      '  COD_TIPO_ESP = :COD_TIPO_ESP and'
      '  CODIGO = :CODIGO and'
      '  CODIGOFAB = :CODIGOFAB and'
      '  COMBUSTIVEL = :COMBUSTIVEL and'
      '  DESCRICAO = :DESCRICAO and'
      '  DESFAB = :DESFAB and'
      '  DISTANCIAEIXO = :DISTANCIAEIXO and'
      '  ESPRENAVAM = :ESPRENAVAM and'
      '  HP = :HP and'
      '  INICHASSI1 = :INICHASSI1 and'
      '  INICHASSI2 = :INICHASSI2 and'
      '  INTERV_KM_SERV = :INTERV_KM_SERV and'
      '  KM_RET_SERV1 = :KM_RET_SERV1 and'
      '  KM_RET_SERV3 = :KM_RET_SERV3 and'
      '  LOTACAO = :LOTACAO and'
      '  MARCA_DESC = :MARCA_DESC and'
      '  MES_RET_SERV1 = :MES_RET_SERV1 and'
      '  MES_RET_SERV3 = :MES_RET_SERV3 and'
      '  MODELO1 = :MODELO1 and'
      '  MODELO2 = :MODELO2 and'
      '  NCMSH = :NCMSH and'
      '  NOME_PLAN = :NOME_PLAN and'
      '  ORD_MOD = :ORD_MOD and'
      '  ORDTIPO = :ORDTIPO and'
      '  PERC_RED = :PERC_RED and'
      '  PESOB = :PESOB and'
      '  PESOL = :PESOL and'
      '  PISCOFINS = :PISCOFINS and'
      '  RED_LUCRO = :RED_LUCRO and'
      '  RENAVAM = :RENAVAM and'
      '  SITE = :SITE and'
      '  TIP_VEICULO = :TIP_VEICULO and'
      '  TIPO = :TIPO and'
      '  TPCOMB = :TPCOMB and'
      '  URL_HONDA = :URL_HONDA and'
      '  VALOR_COFINS = :VALOR_COFINS and'
      '  VALOR_PIS = :VALOR_PIS and'
      '  VALTAB = :VALTAB and'
      '  VL_UNITARIO_NF = :VL_UNITARIO_NF and'
      '  VLBICMSUB = :VLBICMSUB and'
      '  VLICMSUB = :VLICMSUB and'
      '  VNDESTOQUE = :VNDESTOQUE')
    ModifySQL.Strings = (
      'update tipmodelo'
      'set'
      '  AFATURAR = :AFATURAR,'
      '  ANO1 = :ANO1,'
      '  ANO2 = :ANO2,'
      '  ATIVO = :ATIVO,'
      '  CILINDRADA = :CILINDRADA,'
      '  CILINDROS = :CILINDROS,'
      '  CMKG = :CMKG,'
      '  COD_COMBUSTIVEL = :COD_COMBUSTIVEL,'
      '  COD_CTA_EST_SEMI = :COD_CTA_EST_SEMI,'
      '  COD_CTA_EST_VEIC = :COD_CTA_EST_VEIC,'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  COD_FIPE = :COD_FIPE,'
      '  COD_MARCA = :COD_MARCA,'
      '  COD_TIPO_ESP = :COD_TIPO_ESP,'
      '  CODIGO = :CODIGO,'
      '  CODIGOFAB = :CODIGOFAB,'
      '  COMBUSTIVEL = :COMBUSTIVEL,'
      '  DESCRICAO = :DESCRICAO,'
      '  DESFAB = :DESFAB,'
      '  DISTANCIAEIXO = :DISTANCIAEIXO,'
      '  ESPRENAVAM = :ESPRENAVAM,'
      '  HP = :HP,'
      '  INICHASSI1 = :INICHASSI1,'
      '  INICHASSI2 = :INICHASSI2,'
      '  INTERV_KM_SERV = :INTERV_KM_SERV,'
      '  KM_RET_SERV1 = :KM_RET_SERV1,'
      '  KM_RET_SERV3 = :KM_RET_SERV3,'
      '  LOTACAO = :LOTACAO,'
      '  MARCA_DESC = :MARCA_DESC,'
      '  MES_RET_SERV1 = :MES_RET_SERV1,'
      '  MES_RET_SERV3 = :MES_RET_SERV3,'
      '  MODELO1 = :MODELO1,'
      '  MODELO2 = :MODELO2,'
      '  NCMSH = :NCMSH,'
      '  NOME_PLAN = :NOME_PLAN,'
      '  ORD_MOD = :ORD_MOD,'
      '  ORDTIPO = :ORDTIPO,'
      '  PERC_RED = :PERC_RED,'
      '  PESOB = :PESOB,'
      '  PESOL = :PESOL,'
      '  PISCOFINS = :PISCOFINS,'
      '  RED_LUCRO = :RED_LUCRO,'
      '  RENAVAM = :RENAVAM,'
      '  SITE = :SITE,'
      '  TIP_VEICULO = :TIP_VEICULO,'
      '  TIPO = :TIPO,'
      '  TPCOMB = :TPCOMB,'
      '  URL_HONDA = :URL_HONDA,'
      '  VALOR_COFINS = :VALOR_COFINS,'
      '  VALOR_PIS = :VALOR_PIS,'
      '  VALTAB = :VALTAB,'
      '  VL_UNITARIO_NF = :VL_UNITARIO_NF,'
      '  VLBICMSUB = :VLBICMSUB,'
      '  VLICMSUB = :VLICMSUB,'
      '  VNDESTOQUE = :VNDESTOQUE'
      'where'
      '  AFATURAR = :OLD_AFATURAR and'
      '  ANO1 = :OLD_ANO1 and'
      '  ANO2 = :OLD_ANO2 and'
      '  ATIVO = :OLD_ATIVO and'
      '  CILINDRADA = :OLD_CILINDRADA and'
      '  CILINDROS = :OLD_CILINDROS and'
      '  CMKG = :OLD_CMKG and'
      '  COD_COMBUSTIVEL = :OLD_COD_COMBUSTIVEL and'
      '  COD_CTA_EST_SEMI = :OLD_COD_CTA_EST_SEMI and'
      '  COD_CTA_EST_VEIC = :OLD_COD_CTA_EST_VEIC and'
      '  COD_EMPRESA = :OLD_COD_EMPRESA and'
      '  COD_FIPE = :OLD_COD_FIPE and'
      '  COD_MARCA = :OLD_COD_MARCA and'
      '  COD_TIPO_ESP = :OLD_COD_TIPO_ESP and'
      '  CODIGO = :OLD_CODIGO and'
      '  CODIGOFAB = :OLD_CODIGOFAB and'
      '  COMBUSTIVEL = :OLD_COMBUSTIVEL and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  DESFAB = :OLD_DESFAB and'
      '  DISTANCIAEIXO = :OLD_DISTANCIAEIXO and'
      '  ESPRENAVAM = :OLD_ESPRENAVAM and'
      '  HP = :OLD_HP and'
      '  INICHASSI1 = :OLD_INICHASSI1 and'
      '  INICHASSI2 = :OLD_INICHASSI2 and'
      '  INTERV_KM_SERV = :OLD_INTERV_KM_SERV and'
      '  KM_RET_SERV1 = :OLD_KM_RET_SERV1 and'
      '  KM_RET_SERV3 = :OLD_KM_RET_SERV3 and'
      '  LOTACAO = :OLD_LOTACAO and'
      '  MARCA_DESC = :OLD_MARCA_DESC and'
      '  MES_RET_SERV1 = :OLD_MES_RET_SERV1 and'
      '  MES_RET_SERV3 = :OLD_MES_RET_SERV3 and'
      '  MODELO1 = :OLD_MODELO1 and'
      '  MODELO2 = :OLD_MODELO2 and'
      '  NCMSH = :OLD_NCMSH and'
      '  NOME_PLAN = :OLD_NOME_PLAN and'
      '  ORD_MOD = :OLD_ORD_MOD and'
      '  ORDTIPO = :OLD_ORDTIPO and'
      '  PERC_RED = :OLD_PERC_RED and'
      '  PESOB = :OLD_PESOB and'
      '  PESOL = :OLD_PESOL and'
      '  PISCOFINS = :OLD_PISCOFINS and'
      '  RED_LUCRO = :OLD_RED_LUCRO and'
      '  RENAVAM = :OLD_RENAVAM and'
      '  SITE = :OLD_SITE and'
      '  TIP_VEICULO = :OLD_TIP_VEICULO and'
      '  TIPO = :OLD_TIPO and'
      '  TPCOMB = :OLD_TPCOMB and'
      '  URL_HONDA = :OLD_URL_HONDA and'
      '  VALOR_COFINS = :OLD_VALOR_COFINS and'
      '  VALOR_PIS = :OLD_VALOR_PIS and'
      '  VALTAB = :OLD_VALTAB and'
      '  VL_UNITARIO_NF = :OLD_VL_UNITARIO_NF and'
      '  VLBICMSUB = :OLD_VLBICMSUB and'
      '  VLICMSUB = :OLD_VLICMSUB and'
      '  VNDESTOQUE = :OLD_VNDESTOQUE')
    InsertSQL.Strings = (
      'insert into tipmodelo'
      
        '  (AFATURAR, ANO1, ANO2, ATIVO, CILINDRADA, CILINDROS, CMKG, COD' +
        '_COMBUSTIVEL, '
      
        '   COD_CTA_EST_SEMI, COD_CTA_EST_VEIC, COD_EMPRESA, COD_FIPE, CO' +
        'D_MARCA, '
      
        '   COD_TIPO_ESP, CODIGO, CODIGOFAB, COMBUSTIVEL, DESCRICAO, DESF' +
        'AB, DISTANCIAEIXO, '
      
        '   ESPRENAVAM, HP, INICHASSI1, INICHASSI2, INTERV_KM_SERV, KM_RE' +
        'T_SERV1, '
      
        '   KM_RET_SERV3, LOTACAO, MARCA_DESC, MES_RET_SERV1, MES_RET_SER' +
        'V3, MODELO1, '
      
        '   MODELO2, NCMSH, NOME_PLAN, ORD_MOD, ORDTIPO, PERC_RED, PESOB,' +
        ' PESOL, '
      
        '   PISCOFINS, RED_LUCRO, RENAVAM, SITE, TIP_VEICULO, TIPO, TPCOM' +
        'B, URL_HONDA, '
      
        '   VALOR_COFINS, VALOR_PIS, VALTAB, VL_UNITARIO_NF, VLBICMSUB, V' +
        'LICMSUB, '
      '   VNDESTOQUE)'
      'values'
      
        '  (:AFATURAR, :ANO1, :ANO2, :ATIVO, :CILINDRADA, :CILINDROS, :CM' +
        'KG, :COD_COMBUSTIVEL, '
      
        '   :COD_CTA_EST_SEMI, :COD_CTA_EST_VEIC, :COD_EMPRESA, :COD_FIPE' +
        ', :COD_MARCA, '
      
        '   :COD_TIPO_ESP, :CODIGO, :CODIGOFAB, :COMBUSTIVEL, :DESCRICAO,' +
        ' :DESFAB, '
      
        '   :DISTANCIAEIXO, :ESPRENAVAM, :HP, :INICHASSI1, :INICHASSI2, :' +
        'INTERV_KM_SERV, '
      
        '   :KM_RET_SERV1, :KM_RET_SERV3, :LOTACAO, :MARCA_DESC, :MES_RET' +
        '_SERV1, '
      
        '   :MES_RET_SERV3, :MODELO1, :MODELO2, :NCMSH, :NOME_PLAN, :ORD_' +
        'MOD, :ORDTIPO, '
      
        '   :PERC_RED, :PESOB, :PESOL, :PISCOFINS, :RED_LUCRO, :RENAVAM, ' +
        ':SITE, '
      
        '   :TIP_VEICULO, :TIPO, :TPCOMB, :URL_HONDA, :VALOR_COFINS, :VAL' +
        'OR_PIS, '
      '   :VALTAB, :VL_UNITARIO_NF, :VLBICMSUB, :VLICMSUB, :VNDESTOQUE)')
    DeleteSQL.Strings = (
      'delete from tipmodelo'
      'where'
      '  AFATURAR = :OLD_AFATURAR and'
      '  ANO1 = :OLD_ANO1 and'
      '  ANO2 = :OLD_ANO2 and'
      '  ATIVO = :OLD_ATIVO and'
      '  CILINDRADA = :OLD_CILINDRADA and'
      '  CILINDROS = :OLD_CILINDROS and'
      '  CMKG = :OLD_CMKG and'
      '  COD_COMBUSTIVEL = :OLD_COD_COMBUSTIVEL and'
      '  COD_CTA_EST_SEMI = :OLD_COD_CTA_EST_SEMI and'
      '  COD_CTA_EST_VEIC = :OLD_COD_CTA_EST_VEIC and'
      '  COD_EMPRESA = :OLD_COD_EMPRESA and'
      '  COD_FIPE = :OLD_COD_FIPE and'
      '  COD_MARCA = :OLD_COD_MARCA and'
      '  COD_TIPO_ESP = :OLD_COD_TIPO_ESP and'
      '  CODIGO = :OLD_CODIGO and'
      '  CODIGOFAB = :OLD_CODIGOFAB and'
      '  COMBUSTIVEL = :OLD_COMBUSTIVEL and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  DESFAB = :OLD_DESFAB and'
      '  DISTANCIAEIXO = :OLD_DISTANCIAEIXO and'
      '  ESPRENAVAM = :OLD_ESPRENAVAM and'
      '  HP = :OLD_HP and'
      '  INICHASSI1 = :OLD_INICHASSI1 and'
      '  INICHASSI2 = :OLD_INICHASSI2 and'
      '  INTERV_KM_SERV = :OLD_INTERV_KM_SERV and'
      '  KM_RET_SERV1 = :OLD_KM_RET_SERV1 and'
      '  KM_RET_SERV3 = :OLD_KM_RET_SERV3 and'
      '  LOTACAO = :OLD_LOTACAO and'
      '  MARCA_DESC = :OLD_MARCA_DESC and'
      '  MES_RET_SERV1 = :OLD_MES_RET_SERV1 and'
      '  MES_RET_SERV3 = :OLD_MES_RET_SERV3 and'
      '  MODELO1 = :OLD_MODELO1 and'
      '  MODELO2 = :OLD_MODELO2 and'
      '  NCMSH = :OLD_NCMSH and'
      '  NOME_PLAN = :OLD_NOME_PLAN and'
      '  ORD_MOD = :OLD_ORD_MOD and'
      '  ORDTIPO = :OLD_ORDTIPO and'
      '  PERC_RED = :OLD_PERC_RED and'
      '  PESOB = :OLD_PESOB and'
      '  PESOL = :OLD_PESOL and'
      '  PISCOFINS = :OLD_PISCOFINS and'
      '  RED_LUCRO = :OLD_RED_LUCRO and'
      '  RENAVAM = :OLD_RENAVAM and'
      '  SITE = :OLD_SITE and'
      '  TIP_VEICULO = :OLD_TIP_VEICULO and'
      '  TIPO = :OLD_TIPO and'
      '  TPCOMB = :OLD_TPCOMB and'
      '  URL_HONDA = :OLD_URL_HONDA and'
      '  VALOR_COFINS = :OLD_VALOR_COFINS and'
      '  VALOR_PIS = :OLD_VALOR_PIS and'
      '  VALTAB = :OLD_VALTAB and'
      '  VL_UNITARIO_NF = :OLD_VL_UNITARIO_NF and'
      '  VLBICMSUB = :OLD_VLBICMSUB and'
      '  VLICMSUB = :OLD_VLICMSUB and'
      '  VNDESTOQUE = :OLD_VNDESTOQUE')
    Left = 504
    Top = 149
  end
  object qr99: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select codigo, descricao, desfab, afaturar from tipmodelo')
    Left = 1103
    Top = 201
  end
  object dsp99: TDataSetProvider
    DataSet = qr99
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1103
    Top = 252
  end
  object cds99: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dsp99'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 1103
    Top = 301
    object cds99CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cds99DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cds99DESFAB: TStringField
      FieldName = 'DESFAB'
    end
    object cds99AFATURAR: TIntegerField
      FieldName = 'AFATURAR'
    end
  end
  object Dt99: TDataSource
    DataSet = cds99
    Left = 1103
    Top = 355
  end
  object Crpe1: TCrpe
    About = 'Version and Credits...'
    DesignControls = 'Design-Time Window Controls'
    Version.Crpe.Major = 0
    Version.Crpe.Minor = 0
    Version.Crpe.Release = 0
    Version.Crpe.Build = 0
    Version.Report.Major = 0
    Version.Report.Minor = 0
    Version.Report.Letter = #0
    Version.Windows.Platform = 'NT'
    Version.Windows.Major = 5
    Version.Windows.Minor = 1
    Version.Windows.Build = '2600'
    TempPath = 'C:\Users\ADMINI~2\AppData\Local\Temp\'
    PrintDate.Day = 0
    PrintDate.Month = 0
    PrintDate.Year = 0
    Subreports.Number = 0
    Subreports.Item.Top = -1
    Subreports.Item.Left = -1
    Subreports.Item.Width = -1
    Subreports.Item.Height = -1
    Subreports.Item.Border.Left = lsNone
    Subreports.Item.Border.Right = lsNone
    Subreports.Item.Border.Top = lsNone
    Subreports.Item.Border.Bottom = lsNone
    Subreports.Item.Border.TightHorizontal = False
    Subreports.Item.Border.DropShadow = False
    Subreports.Item.Border.ForeColor = clNone
    Subreports.Item.Border.BackgroundColor = clNone
    Subreports.Item.NLinks = 0
    GroupSortFields.Number = -1
    Groups.Number = -1
    Groups.Item.CustomizeGroupName = False
    ParamFields.AllowDialog = True
    ParamFields.Item.Top = -1
    ParamFields.Item.Left = -1
    ParamFields.Item.Width = -1
    ParamFields.Item.Height = -1
    ParamFields.Item.Border.Left = lsNone
    ParamFields.Item.Border.Right = lsNone
    ParamFields.Item.Border.Top = lsNone
    ParamFields.Item.Border.Bottom = lsNone
    ParamFields.Item.Border.TightHorizontal = False
    ParamFields.Item.Border.DropShadow = False
    ParamFields.Item.Border.ForeColor = clNone
    ParamFields.Item.Border.BackgroundColor = clNone
    ParamFields.Item.Format.Alignment = haDefault
    ParamFields.Item.Format.SuppressIfDuplicated = False
    ParamFields.Item.Format.CanGrow = False
    ParamFields.Item.Format.MaxNLines = 0
    ParamFields.Item.Format.Field.Number.CurrencySymbol = '$'
    ParamFields.Item.Format.Field.Number.ThousandSymbol = ','
    ParamFields.Item.Format.Field.Number.DecimalSymbol = '.'
    ParamFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    ParamFields.Item.Format.Field.Date.FirstSeparator = '/'
    ParamFields.Item.Format.Field.Date.SecondSeparator = '/'
    ParamFields.Item.Format.Field.Time.AMString = 'AM'
    ParamFields.Item.Format.Field.Time.PMString = 'PM'
    ParamFields.Item.Format.Field.Time.HourMinSeparator = ':'
    ParamFields.Item.Format.Field.Time.MinSecSeparator = ':'
    ParamFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    ParamFields.Item.Font.Charset = DEFAULT_CHARSET
    ParamFields.Item.Font.Color = clWindowText
    ParamFields.Item.Font.Height = -11
    ParamFields.Item.Font.Name = 'Tahoma'
    ParamFields.Item.Font.Style = []
    ParamFields.Item.HiliteConditions.Item.FontColor = clNone
    ParamFields.Item.HiliteConditions.Item.Background = clNone
    ParamFields.Item.ParamType = pfNoValue
    ParamFields.Item.ParamSource = psReport
    ParamFields.Item.Info.AllowNull = True
    ParamFields.Item.Info.AllowEditing = True
    ParamFields.Item.Info.AllowMultipleValues = False
    ParamFields.Item.Info.ValueType = vtDiscrete
    ParamFields.Item.Info.PartOfGroup = False
    ParamFields.Item.Info.MutuallyExclusiveGroup = True
    ParamFields.Item.Info.GroupNum = -1
    ParamFields.Item.ValueLimit = False
    ParamFields.Item.Ranges.Item.Bounds = IncludeStartAndEnd
    ParamFields.Item.NeedsCurrentValue = False
    ParamFields.Item.IsLinked = False
    Formulas.Item.Top = -1
    Formulas.Item.Left = -1
    Formulas.Item.Width = -1
    Formulas.Item.Height = -1
    Formulas.Item.Border.Left = lsNone
    Formulas.Item.Border.Right = lsNone
    Formulas.Item.Border.Top = lsNone
    Formulas.Item.Border.Bottom = lsNone
    Formulas.Item.Border.TightHorizontal = False
    Formulas.Item.Border.DropShadow = False
    Formulas.Item.Border.ForeColor = clNone
    Formulas.Item.Border.BackgroundColor = clNone
    Formulas.Item.Format.Alignment = haDefault
    Formulas.Item.Format.SuppressIfDuplicated = False
    Formulas.Item.Format.CanGrow = False
    Formulas.Item.Format.MaxNLines = 0
    Formulas.Item.Format.Field.Number.CurrencySymbol = '$'
    Formulas.Item.Format.Field.Number.ThousandSymbol = ','
    Formulas.Item.Format.Field.Number.DecimalSymbol = '.'
    Formulas.Item.Format.Field.Number.ShowZeroValueAs = '0'
    Formulas.Item.Format.Field.Date.FirstSeparator = '/'
    Formulas.Item.Format.Field.Date.SecondSeparator = '/'
    Formulas.Item.Format.Field.Time.AMString = 'AM'
    Formulas.Item.Format.Field.Time.PMString = 'PM'
    Formulas.Item.Format.Field.Time.HourMinSeparator = ':'
    Formulas.Item.Format.Field.Time.MinSecSeparator = ':'
    Formulas.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    Formulas.Item.Font.Charset = DEFAULT_CHARSET
    Formulas.Item.Font.Color = clWindowText
    Formulas.Item.Font.Height = -11
    Formulas.Item.Font.Name = 'Tahoma'
    Formulas.Item.Font.Style = []
    Formulas.Item.HiliteConditions.Item.FontColor = clNone
    Formulas.Item.HiliteConditions.Item.Background = clNone
    AreaFormat.Item.NSections = 0
    SectionSize.Item.Height = -1
    SectionSize.Item.Width = -1
    SQLExpressions.Item.Top = -1
    SQLExpressions.Item.Left = -1
    SQLExpressions.Item.Width = -1
    SQLExpressions.Item.Height = -1
    SQLExpressions.Item.Border.Left = lsNone
    SQLExpressions.Item.Border.Right = lsNone
    SQLExpressions.Item.Border.Top = lsNone
    SQLExpressions.Item.Border.Bottom = lsNone
    SQLExpressions.Item.Border.TightHorizontal = False
    SQLExpressions.Item.Border.DropShadow = False
    SQLExpressions.Item.Border.ForeColor = clNone
    SQLExpressions.Item.Border.BackgroundColor = clNone
    SQLExpressions.Item.Format.Alignment = haDefault
    SQLExpressions.Item.Format.SuppressIfDuplicated = False
    SQLExpressions.Item.Format.CanGrow = False
    SQLExpressions.Item.Format.MaxNLines = 0
    SQLExpressions.Item.Format.Field.Number.CurrencySymbol = '$'
    SQLExpressions.Item.Format.Field.Number.ThousandSymbol = ','
    SQLExpressions.Item.Format.Field.Number.DecimalSymbol = '.'
    SQLExpressions.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SQLExpressions.Item.Format.Field.Date.FirstSeparator = '/'
    SQLExpressions.Item.Format.Field.Date.SecondSeparator = '/'
    SQLExpressions.Item.Format.Field.Time.AMString = 'AM'
    SQLExpressions.Item.Format.Field.Time.PMString = 'PM'
    SQLExpressions.Item.Format.Field.Time.HourMinSeparator = ':'
    SQLExpressions.Item.Format.Field.Time.MinSecSeparator = ':'
    SQLExpressions.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SQLExpressions.Item.Font.Charset = DEFAULT_CHARSET
    SQLExpressions.Item.Font.Color = clWindowText
    SQLExpressions.Item.Font.Height = -11
    SQLExpressions.Item.Font.Name = 'Tahoma'
    SQLExpressions.Item.Font.Style = []
    SQLExpressions.Item.HiliteConditions.Item.FontColor = clNone
    SQLExpressions.Item.HiliteConditions.Item.Background = clNone
    LogOnInfo.Item.Table = -1
    SessionInfo.Table = -1
    SessionInfo.Item.Propagate = True
    ExportOptions.Excel.Constant = 36.000000000000000000
    ExportOptions.Excel.WorksheetFunctions = False
    ExportOptions.Excel.FirstPage = 1
    ExportOptions.Excel.LastPage = 1
    ExportOptions.HTML.PageNavigator = True
    ExportOptions.HTML.SeparatePages = True
    ExportOptions.HTML.FirstPage = 1
    ExportOptions.HTML.LastPage = 1
    ExportOptions.RTF.FirstPage = 1
    ExportOptions.RTF.LastPage = 1
    ExportOptions.Word.FirstPage = 1
    ExportOptions.Word.LastPage = 1
    ExportOptions.PDF.FirstPage = 1
    ExportOptions.PDF.LastPage = 1
    ExportOptions.Text.StringDelimiter = '"'
    ExportOptions.Text.FieldSeparator = ','
    Lines.Item.LineStyle = lsNone
    Lines.Item.Left = -1
    Lines.Item.Right = -1
    Lines.Item.Width = -1
    Lines.Item.Top = -1
    Lines.Item.Bottom = -1
    Lines.Item.Color = clNone
    Lines.Item.Extend = False
    Lines.Item.Suppress = False
    Boxes.Number = -1
    Pictures.Item.Top = -1
    Pictures.Item.Left = -1
    Pictures.Item.Width = -1
    Pictures.Item.Height = -1
    Pictures.Item.Border.Left = lsNone
    Pictures.Item.Border.Right = lsNone
    Pictures.Item.Border.Top = lsNone
    Pictures.Item.Border.Bottom = lsNone
    Pictures.Item.Border.TightHorizontal = False
    Pictures.Item.Border.DropShadow = False
    Pictures.Item.Border.ForeColor = clNone
    Pictures.Item.Border.BackgroundColor = clNone
    Pictures.Item.CropLeft = -1
    Pictures.Item.CropRight = -1
    Pictures.Item.CropTop = -1
    Pictures.Item.CropBottom = -1
    TextObjects.Item.Top = -1
    TextObjects.Item.Left = -1
    TextObjects.Item.Width = -1
    TextObjects.Item.Height = -1
    TextObjects.Item.Border.Left = lsNone
    TextObjects.Item.Border.Right = lsNone
    TextObjects.Item.Border.Top = lsNone
    TextObjects.Item.Border.Bottom = lsNone
    TextObjects.Item.Border.TightHorizontal = False
    TextObjects.Item.Border.DropShadow = False
    TextObjects.Item.Border.ForeColor = clNone
    TextObjects.Item.Border.BackgroundColor = clNone
    TextObjects.Item.Format.Alignment = haDefault
    TextObjects.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.Format.CanGrow = False
    TextObjects.Item.Format.MaxNLines = 0
    TextObjects.Item.Format.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.Font.Charset = DEFAULT_CHARSET
    TextObjects.Item.Font.Color = clWindowText
    TextObjects.Item.Font.Height = -11
    TextObjects.Item.Font.Name = 'Tahoma'
    TextObjects.Item.Font.Style = []
    TextObjects.Item.Paragraphs.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.IndentFirstLine = 0
    TextObjects.Item.Paragraphs.Item.IndentLeft = 0
    TextObjects.Item.Paragraphs.Item.IndentRight = 0
    TextObjects.Item.Paragraphs.Item.TextStart = 0
    TextObjects.Item.Paragraphs.Item.TextEnd = 0
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Offset = -1
    TextObjects.Item.EmbeddedFields.Item.FieldObjectType = oftNone
    TextObjects.Item.EmbeddedFields.Item.FieldType = fvUnknown
    TextObjects.Item.EmbeddedFields.Item.TextStart = 0
    TextObjects.Item.EmbeddedFields.Item.TextEnd = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Alignment = haDefault
    TextObjects.Item.EmbeddedFields.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.EmbeddedFields.Item.Format.CanGrow = False
    TextObjects.Item.EmbeddedFields.Item.Format.MaxNLines = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.CurrencySymbol = '$'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ThousandSymbol = ','
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.DecimalSymbol = '.'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.FirstSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.SecondSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.AMString = 'AM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.PMString = 'PM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.HourMinSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.MinSecSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.EmbeddedFields.Item.Border.Left = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Right = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Top = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Bottom = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.TightHorizontal = False
    TextObjects.Item.EmbeddedFields.Item.Border.DropShadow = False
    TextObjects.Item.EmbeddedFields.Item.Border.ForeColor = clNone
    TextObjects.Item.EmbeddedFields.Item.Border.BackgroundColor = clNone
    TextObjects.Item.TextSize = -1
    TextObjects.Item.TextHeight = -1
    OleObjects.Item.Top = -1
    OleObjects.Item.Left = -1
    OleObjects.Item.Width = -1
    OleObjects.Item.Height = -1
    OleObjects.Item.Border.Left = lsNone
    OleObjects.Item.Border.Right = lsNone
    OleObjects.Item.Border.Top = lsNone
    OleObjects.Item.Border.Bottom = lsNone
    OleObjects.Item.Border.TightHorizontal = False
    OleObjects.Item.Border.DropShadow = False
    OleObjects.Item.Border.ForeColor = clNone
    OleObjects.Item.Border.BackgroundColor = clNone
    CrossTabs.Item.Top = -1
    CrossTabs.Item.Left = -1
    CrossTabs.Item.Width = -1
    CrossTabs.Item.Height = -1
    CrossTabs.Item.Border.Left = lsNone
    CrossTabs.Item.Border.Right = lsNone
    CrossTabs.Item.Border.Top = lsNone
    CrossTabs.Item.Border.Bottom = lsNone
    CrossTabs.Item.Border.TightHorizontal = False
    CrossTabs.Item.Border.DropShadow = False
    CrossTabs.Item.Border.ForeColor = clNone
    CrossTabs.Item.Border.BackgroundColor = clNone
    Maps.Item.Top = -1
    Maps.Item.Left = -1
    Maps.Item.Width = -1
    Maps.Item.Height = -1
    Maps.Item.Border.Left = lsNone
    Maps.Item.Border.Right = lsNone
    Maps.Item.Border.Top = lsNone
    Maps.Item.Border.Bottom = lsNone
    Maps.Item.Border.TightHorizontal = False
    Maps.Item.Border.DropShadow = False
    Maps.Item.Border.ForeColor = clNone
    Maps.Item.Border.BackgroundColor = clNone
    OLAPCubes.Item.Top = -1
    OLAPCubes.Item.Left = -1
    OLAPCubes.Item.Width = -1
    OLAPCubes.Item.Height = -1
    OLAPCubes.Item.Border.Left = lsNone
    OLAPCubes.Item.Border.Right = lsNone
    OLAPCubes.Item.Border.Top = lsNone
    OLAPCubes.Item.Border.Bottom = lsNone
    OLAPCubes.Item.Border.TightHorizontal = False
    OLAPCubes.Item.Border.DropShadow = False
    OLAPCubes.Item.Border.ForeColor = clNone
    OLAPCubes.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Top = -1
    DatabaseFields.Item.Left = -1
    DatabaseFields.Item.Width = -1
    DatabaseFields.Item.Height = -1
    DatabaseFields.Item.Border.Left = lsNone
    DatabaseFields.Item.Border.Right = lsNone
    DatabaseFields.Item.Border.Top = lsNone
    DatabaseFields.Item.Border.Bottom = lsNone
    DatabaseFields.Item.Border.TightHorizontal = False
    DatabaseFields.Item.Border.DropShadow = False
    DatabaseFields.Item.Border.ForeColor = clNone
    DatabaseFields.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Format.Alignment = haDefault
    DatabaseFields.Item.Format.SuppressIfDuplicated = False
    DatabaseFields.Item.Format.CanGrow = False
    DatabaseFields.Item.Format.MaxNLines = 0
    DatabaseFields.Item.Format.Field.Number.CurrencySymbol = '$'
    DatabaseFields.Item.Format.Field.Number.ThousandSymbol = ','
    DatabaseFields.Item.Format.Field.Number.DecimalSymbol = '.'
    DatabaseFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    DatabaseFields.Item.Format.Field.Date.FirstSeparator = '/'
    DatabaseFields.Item.Format.Field.Date.SecondSeparator = '/'
    DatabaseFields.Item.Format.Field.Time.AMString = 'AM'
    DatabaseFields.Item.Format.Field.Time.PMString = 'PM'
    DatabaseFields.Item.Format.Field.Time.HourMinSeparator = ':'
    DatabaseFields.Item.Format.Field.Time.MinSecSeparator = ':'
    DatabaseFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    DatabaseFields.Item.Font.Charset = DEFAULT_CHARSET
    DatabaseFields.Item.Font.Color = clWindowText
    DatabaseFields.Item.Font.Height = -11
    DatabaseFields.Item.Font.Name = 'Tahoma'
    DatabaseFields.Item.Font.Style = []
    DatabaseFields.Item.HiliteConditions.Item.FontColor = clNone
    DatabaseFields.Item.HiliteConditions.Item.Background = clNone
    SummaryFields.Item.Top = -1
    SummaryFields.Item.Left = -1
    SummaryFields.Item.Width = -1
    SummaryFields.Item.Height = -1
    SummaryFields.Item.Border.Left = lsNone
    SummaryFields.Item.Border.Right = lsNone
    SummaryFields.Item.Border.Top = lsNone
    SummaryFields.Item.Border.Bottom = lsNone
    SummaryFields.Item.Border.TightHorizontal = False
    SummaryFields.Item.Border.DropShadow = False
    SummaryFields.Item.Border.ForeColor = clNone
    SummaryFields.Item.Border.BackgroundColor = clNone
    SummaryFields.Item.Format.Alignment = haDefault
    SummaryFields.Item.Format.SuppressIfDuplicated = False
    SummaryFields.Item.Format.CanGrow = False
    SummaryFields.Item.Format.MaxNLines = 0
    SummaryFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SummaryFields.Item.Format.Field.Number.ThousandSymbol = ','
    SummaryFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SummaryFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SummaryFields.Item.Format.Field.Date.FirstSeparator = '/'
    SummaryFields.Item.Format.Field.Date.SecondSeparator = '/'
    SummaryFields.Item.Format.Field.Time.AMString = 'AM'
    SummaryFields.Item.Format.Field.Time.PMString = 'PM'
    SummaryFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SummaryFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SummaryFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SummaryFields.Item.Font.Charset = DEFAULT_CHARSET
    SummaryFields.Item.Font.Color = clWindowText
    SummaryFields.Item.Font.Height = -11
    SummaryFields.Item.Font.Name = 'Tahoma'
    SummaryFields.Item.Font.Style = []
    SummaryFields.Item.HiliteConditions.Item.FontColor = clNone
    SummaryFields.Item.HiliteConditions.Item.Background = clNone
    SpecialFields.Number = -1
    SpecialFields.Item.Top = -1
    SpecialFields.Item.Left = -1
    SpecialFields.Item.Width = -1
    SpecialFields.Item.Height = -1
    SpecialFields.Item.Border.Left = lsNone
    SpecialFields.Item.Border.Right = lsNone
    SpecialFields.Item.Border.Top = lsNone
    SpecialFields.Item.Border.Bottom = lsNone
    SpecialFields.Item.Border.TightHorizontal = False
    SpecialFields.Item.Border.DropShadow = False
    SpecialFields.Item.Border.ForeColor = clNone
    SpecialFields.Item.Border.BackgroundColor = clNone
    SpecialFields.Item.Format.Alignment = haDefault
    SpecialFields.Item.Format.SuppressIfDuplicated = False
    SpecialFields.Item.Format.CanGrow = False
    SpecialFields.Item.Format.MaxNLines = 0
    SpecialFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SpecialFields.Item.Format.Field.Number.ThousandSymbol = ','
    SpecialFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SpecialFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SpecialFields.Item.Format.Field.Date.FirstSeparator = '/'
    SpecialFields.Item.Format.Field.Date.SecondSeparator = '/'
    SpecialFields.Item.Format.Field.Time.AMString = 'AM'
    SpecialFields.Item.Format.Field.Time.PMString = 'PM'
    SpecialFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SpecialFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SpecialFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SpecialFields.Item.Font.Charset = DEFAULT_CHARSET
    SpecialFields.Item.Font.Color = clWindowText
    SpecialFields.Item.Font.Height = -11
    SpecialFields.Item.Font.Name = 'Tahoma'
    SpecialFields.Item.Font.Style = []
    SpecialFields.Item.HiliteConditions.Item.FontColor = clNone
    SpecialFields.Item.HiliteConditions.Item.Background = clNone
    GroupNameFields.Number = -1
    GroupNameFields.Item.Top = -1
    GroupNameFields.Item.Left = -1
    GroupNameFields.Item.Width = -1
    GroupNameFields.Item.Height = -1
    GroupNameFields.Item.Border.Left = lsNone
    GroupNameFields.Item.Border.Right = lsNone
    GroupNameFields.Item.Border.Top = lsNone
    GroupNameFields.Item.Border.Bottom = lsNone
    GroupNameFields.Item.Border.TightHorizontal = False
    GroupNameFields.Item.Border.DropShadow = False
    GroupNameFields.Item.Border.ForeColor = clNone
    GroupNameFields.Item.Border.BackgroundColor = clNone
    GroupNameFields.Item.Format.Alignment = haDefault
    GroupNameFields.Item.Format.SuppressIfDuplicated = False
    GroupNameFields.Item.Format.CanGrow = False
    GroupNameFields.Item.Format.MaxNLines = 0
    GroupNameFields.Item.Format.Field.Number.CurrencySymbol = '$'
    GroupNameFields.Item.Format.Field.Number.ThousandSymbol = ','
    GroupNameFields.Item.Format.Field.Number.DecimalSymbol = '.'
    GroupNameFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    GroupNameFields.Item.Format.Field.Date.FirstSeparator = '/'
    GroupNameFields.Item.Format.Field.Date.SecondSeparator = '/'
    GroupNameFields.Item.Format.Field.Time.AMString = 'AM'
    GroupNameFields.Item.Format.Field.Time.PMString = 'PM'
    GroupNameFields.Item.Format.Field.Time.HourMinSeparator = ':'
    GroupNameFields.Item.Format.Field.Time.MinSecSeparator = ':'
    GroupNameFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    GroupNameFields.Item.Font.Charset = DEFAULT_CHARSET
    GroupNameFields.Item.Font.Color = clWindowText
    GroupNameFields.Item.Font.Height = -11
    GroupNameFields.Item.Font.Name = 'Tahoma'
    GroupNameFields.Item.Font.Style = []
    GroupNameFields.Item.HiliteConditions.Item.FontColor = clNone
    GroupNameFields.Item.HiliteConditions.Item.Background = clNone
    RunningTotals.Number = -1
    RunningTotals.Item.Top = -1
    RunningTotals.Item.Left = -1
    RunningTotals.Item.Width = -1
    RunningTotals.Item.Height = -1
    RunningTotals.Item.Border.Left = lsNone
    RunningTotals.Item.Border.Right = lsNone
    RunningTotals.Item.Border.Top = lsNone
    RunningTotals.Item.Border.Bottom = lsNone
    RunningTotals.Item.Border.TightHorizontal = False
    RunningTotals.Item.Border.DropShadow = False
    RunningTotals.Item.Border.ForeColor = clNone
    RunningTotals.Item.Border.BackgroundColor = clNone
    RunningTotals.Item.Format.Alignment = haDefault
    RunningTotals.Item.Format.SuppressIfDuplicated = False
    RunningTotals.Item.Format.CanGrow = False
    RunningTotals.Item.Format.MaxNLines = 0
    RunningTotals.Item.Format.Field.Number.CurrencySymbol = '$'
    RunningTotals.Item.Format.Field.Number.ThousandSymbol = ','
    RunningTotals.Item.Format.Field.Number.DecimalSymbol = '.'
    RunningTotals.Item.Format.Field.Number.ShowZeroValueAs = '0'
    RunningTotals.Item.Format.Field.Date.FirstSeparator = '/'
    RunningTotals.Item.Format.Field.Date.SecondSeparator = '/'
    RunningTotals.Item.Format.Field.Time.AMString = 'AM'
    RunningTotals.Item.Format.Field.Time.PMString = 'PM'
    RunningTotals.Item.Format.Field.Time.HourMinSeparator = ':'
    RunningTotals.Item.Format.Field.Time.MinSecSeparator = ':'
    RunningTotals.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    RunningTotals.Item.Font.Charset = DEFAULT_CHARSET
    RunningTotals.Item.Font.Color = clWindowText
    RunningTotals.Item.Font.Height = -11
    RunningTotals.Item.Font.Name = 'Tahoma'
    RunningTotals.Item.Font.Style = []
    RunningTotals.Item.HiliteConditions.Item.FontColor = clNone
    RunningTotals.Item.HiliteConditions.Item.Background = clNone
    WindowZoom.Preview = pwDefault
    WindowZoom.Magnification = -1
    WindowCursor.GroupArea = wcDefault
    WindowCursor.GroupAreaField = wcDefault
    WindowCursor.DetailArea = wcDefault
    WindowCursor.DetailAreaField = wcDefault
    WindowCursor.Graph = wcDefault
    WindowCursor.OnDemandSubreport = wcMagnify
    WindowCursor.HyperLink = wcDefault
    Graphs.Number = -1
    Graphs.Item.Top = -1
    Graphs.Item.Left = -1
    Graphs.Item.Width = -1
    Graphs.Item.Height = -1
    Graphs.Item.Border.Left = lsNone
    Graphs.Item.Border.Right = lsNone
    Graphs.Item.Border.Top = lsNone
    Graphs.Item.Border.Bottom = lsNone
    Graphs.Item.Border.TightHorizontal = False
    Graphs.Item.Border.DropShadow = False
    Graphs.Item.Border.ForeColor = clNone
    Graphs.Item.Border.BackgroundColor = clNone
    Graphs.Item.Style = unknownGraphType
    Graphs.Item.Text.TitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.TitleFont.Color = clWindowText
    Graphs.Item.Text.TitleFont.Height = -11
    Graphs.Item.Text.TitleFont.Name = 'Tahoma'
    Graphs.Item.Text.TitleFont.Style = []
    Graphs.Item.Text.SubTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.SubTitleFont.Color = clWindowText
    Graphs.Item.Text.SubTitleFont.Height = -11
    Graphs.Item.Text.SubTitleFont.Name = 'Tahoma'
    Graphs.Item.Text.SubTitleFont.Style = []
    Graphs.Item.Text.FootNoteFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.FootNoteFont.Color = clWindowText
    Graphs.Item.Text.FootNoteFont.Height = -11
    Graphs.Item.Text.FootNoteFont.Name = 'Tahoma'
    Graphs.Item.Text.FootNoteFont.Style = []
    Graphs.Item.Text.GroupsTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupsTitleFont.Color = clWindowText
    Graphs.Item.Text.GroupsTitleFont.Height = -11
    Graphs.Item.Text.GroupsTitleFont.Name = 'Tahoma'
    Graphs.Item.Text.GroupsTitleFont.Style = []
    Graphs.Item.Text.DataTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataTitleFont.Color = clWindowText
    Graphs.Item.Text.DataTitleFont.Height = -11
    Graphs.Item.Text.DataTitleFont.Name = 'Tahoma'
    Graphs.Item.Text.DataTitleFont.Style = []
    Graphs.Item.Text.LegendFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.LegendFont.Color = clWindowText
    Graphs.Item.Text.LegendFont.Height = -11
    Graphs.Item.Text.LegendFont.Name = 'Tahoma'
    Graphs.Item.Text.LegendFont.Style = []
    Graphs.Item.Text.GroupLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupLabelsFont.Color = clWindowText
    Graphs.Item.Text.GroupLabelsFont.Height = -11
    Graphs.Item.Text.GroupLabelsFont.Name = 'Tahoma'
    Graphs.Item.Text.GroupLabelsFont.Style = []
    Graphs.Item.Text.DataLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataLabelsFont.Color = clWindowText
    Graphs.Item.Text.DataLabelsFont.Height = -11
    Graphs.Item.Text.DataLabelsFont.Name = 'Tahoma'
    Graphs.Item.Text.DataLabelsFont.Style = []
    Graphs.Item.Axis.GridLineX = gglNone
    Graphs.Item.Axis.GridLineY = gglMajor
    Graphs.Item.Axis.GridLineY2 = gglNone
    Graphs.Item.Axis.GridLineZ = gglNone
    Graphs.Item.Axis.DataValuesY = gdvAutomatic
    Graphs.Item.Axis.DataValuesY2 = gdvAutomatic
    Graphs.Item.Axis.DataValuesZ = gdvAutomatic
    Graphs.Item.Axis.MinY = -1.000000000000000000
    Graphs.Item.Axis.MaxY = -1.000000000000000000
    Graphs.Item.Axis.MinY2 = -1.000000000000000000
    Graphs.Item.Axis.MaxY2 = -1.000000000000000000
    Graphs.Item.Axis.MinZ = -1.000000000000000000
    Graphs.Item.Axis.MaxZ = -1.000000000000000000
    Graphs.Item.Axis.NumberFormatY = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatY2 = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatZ = gnfNoDecimal
    Graphs.Item.Axis.DivisionTypeY = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeY2 = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeZ = gdvAutomatic
    Graphs.Item.Axis.DivisionsY = -1
    Graphs.Item.Axis.DivisionsY2 = -1
    Graphs.Item.Axis.DivisionsZ = -1
    SummaryInfo.SavePreviewPicture = False
    Left = 240
    Top = 24
  end
  object cdsLocAreaExec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocAreaExec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 425
    Top = 298
    object cdsLocAreaExecAREA_EXEC: TStringField
      FieldName = 'AREA_EXEC'
      Size = 30
    end
    object cdsLocAreaExecTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dsLocAreaExec: TDataSource
    DataSet = cdsLocAreaExec
    Left = 425
    Top = 346
  end
  object dspLocAreaExec: TDataSetProvider
    DataSet = qrLocAreaExec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 425
    Top = 249
  end
  object qrLocAreaExec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        ' SELECT TRIM(COALESCE(AREA_EXEC, '#39#39')) AREA_EXEC, TIPO FROM TIPO_' +
        'VENDAS   WHERE TRIM(COALESCE(AREA_EXEC, '#39#39')) <> '#39#39)
    Left = 425
    Top = 198
  end
  object cdsLocPart: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocPart'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 930
    Top = 306
    object cdsLocPartCOD_PARTICIPANTE: TIntegerField
      FieldName = 'COD_PARTICIPANTE'
      Required = True
    end
    object cdsLocPartNOME_PARTICIPANTE: TStringField
      FieldName = 'NOME_PARTICIPANTE'
      Size = 35
    end
  end
  object dsLocPart: TDataSource
    DataSet = cdsLocPart
    Left = 930
    Top = 354
  end
  object dspLocPart: TDataSetProvider
    DataSet = qrLocPart
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 930
    Top = 257
  end
  object qrLocPart: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT cod_participante, nome_participante FROM PARTICIPANTE WHE' +
        'RE cod_empresa =1 AND ativo = 1')
    Left = 930
    Top = 206
  end
  object cdsLocTipoVeic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipoVeic'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 345
    Top = 298
    object StringField4: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField5: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField6: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipoVeic: TDataSource
    DataSet = cdsLocTipoVeic
    Left = 345
    Top = 346
  end
  object dspLocTipoVeic: TDataSetProvider
    DataSet = qrLocTipoVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 345
    Top = 249
  end
  object qrLocTipoVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 345
    Top = 198
  end
  object cdsLocControles: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocControles'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 1021
    Top = 306
    object cdsLocControlesCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object cdsLocControlesNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocControles: TDataSource
    DataSet = cdsLocControles
    Left = 1021
    Top = 354
  end
  object dspLocControles: TDataSetProvider
    DataSet = qrLocControles
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1021
    Top = 257
  end
  object qrLocControles: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 1021
    Top = 206
  end
  object cdsListaRota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaRota'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 950
    Top = 98
    object cdsListaRotaCOD_ROTA: TIntegerField
      FieldName = 'COD_ROTA'
      Required = True
    end
    object cdsListaRotaROTA: TStringField
      FieldName = 'ROTA'
      Size = 37
    end
  end
  object dsListaRota: TDataSource
    DataSet = cdsListaRota
    Left = 950
    Top = 146
  end
  object dspListaRota: TDataSetProvider
    DataSet = qrListaRota
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 950
    Top = 49
  end
  object qrListaRota: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select re.cod_rota, '
      'case when (trim(re.rota) <> '#39#39') then'
      '    (trim(re.descricao) || '#39' - '#39' || trim(re.rota))'
      'else'
      '    trim(re.descricao) end rota from rotas_entr re'
      ''
      '')
    Left = 950
    Top = 65534
  end
  object cdsCtrlTitRot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrlTitRot'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 1038
    Top = 98
    object cdsCtrlTitRotSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCtrlTitRotCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlTitRotNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlTitRotTP_PLANO: TStringField
      FieldName = 'TP_PLANO'
      FixedChar = True
      Size = 1
    end
  end
  object dsCtrlTitRot: TDataSource
    DataSet = cdsCtrlTitRot
    Left = 1038
    Top = 146
  end
  object dspCtrlTitRot: TDataSetProvider
    DataSet = qrCtrlTitRot
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1038
    Top = 49
  end
  object qrCtrlTitRot: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'select ctr.codigo_ctrl, ctr.nome_ctrl, ctr.tp_plano from control' +
        'es ctr'
      'where ctr.docs = '#39'S2'#39' '
      '')
    Left = 1038
    Top = 65534
  end
  object cdsLocOrigControlesPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocOrigControlesPag'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 157
    Top = 522
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField7: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocOrigControlesPag: TDataSource
    DataSet = cdsLocOrigControlesPag
    Left = 157
    Top = 578
  end
  object dspLocOrigControlesPag: TDataSetProvider
    DataSet = qrLocOrigControlesPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 157
    Top = 473
  end
  object qrLocOrigControlesPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 157
    Top = 422
  end
  object cdsLocClientesPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocClientesPag'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 45
    Top = 522
    object IntegerField2: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object StringField8: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
  end
  object dsLocClientesPag: TDataSource
    DataSet = cdsLocClientesPag
    Left = 45
    Top = 578
  end
  object dspLocClientesPag: TDataSetProvider
    DataSet = qrLocClientesPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 45
    Top = 473
  end
  object qrLocClientesPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT COD_CLIENTE, NOME_CLIENTE  FROM CLIENTES'
      'where ativo=1')
    Left = 45
    Top = 422
  end
  object cdsLocControlesPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocControles'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 269
    Top = 522
    object IntegerField3: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField9: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocControlesPag: TDataSource
    DataSet = cdsLocControlesPag
    Left = 269
    Top = 578
  end
  object dspLocControlesPag: TDataSetProvider
    DataSet = qrLocControlesPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 269
    Top = 473
  end
  object qrLocControlesPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 269
    Top = 422
  end
  object cdsLocOrigControlesRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocOrigControlesRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 157
    Top = 746
    object IntegerField4: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField10: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocOrigControlesRec: TDataSource
    DataSet = cdsLocOrigControlesRec
    Left = 157
    Top = 802
  end
  object dspLocOrigControlesRec: TDataSetProvider
    DataSet = qrLocOrigControlesRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 157
    Top = 697
  end
  object qrLocOrigControlesRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 157
    Top = 646
  end
  object cdsLocClientesRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocClientesRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 45
    Top = 746
    object IntegerField5: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object StringField11: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
  end
  object dsLocClientesRec: TDataSource
    DataSet = cdsLocClientesRec
    Left = 45
    Top = 802
  end
  object dspLocClientesRec: TDataSetProvider
    DataSet = qrLocClientesRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 45
    Top = 697
  end
  object qrLocClientesRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT COD_CLIENTE, NOME_CLIENTE  FROM CLIENTES'
      'where ativo=1')
    Left = 45
    Top = 646
  end
  object cdsLocControlesRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocControlesRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 269
    Top = 746
    object IntegerField6: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField12: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocControlesRec: TDataSource
    DataSet = cdsLocControlesRec
    Left = 269
    Top = 802
  end
  object dspLocControlesRec: TDataSetProvider
    DataSet = qrLocControlesRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 269
    Top = 697
  end
  object qrLocControlesRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 269
    Top = 646
  end
  object cdsLocTipVndRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipVndRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 370
    Top = 746
    object StringField13: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField14: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField15: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipVndRec: TDataSource
    DataSet = cdsLocTipVndRec
    Left = 370
    Top = 802
  end
  object dspLocTipVndRec: TDataSetProvider
    DataSet = qrLocTipVndRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 370
    Top = 697
  end
  object qrLocTipVndRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 370
    Top = 646
  end
  object cdsLocTipoOSRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipoOSRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 465
    Top = 746
    object StringField16: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField17: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField18: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipoOSRec: TDataSource
    DataSet = cdsLocTipoOSRec
    Left = 465
    Top = 802
  end
  object dspLocTipoOSRec: TDataSetProvider
    DataSet = qrLocTipoOSRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 465
    Top = 697
  end
  object qrLocTipoOSRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 465
    Top = 646
  end
  object cdsLocTipoVeicRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipoVeicRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 577
    Top = 746
    object StringField19: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField20: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField21: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipoVeicRec: TDataSource
    DataSet = cdsLocTipoVeicRec
    Left = 577
    Top = 802
  end
  object dspLocTipoVeicRec: TDataSetProvider
    DataSet = qrLocTipoVeicRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 577
    Top = 697
  end
  object qrLocTipoVeicRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 577
    Top = 646
  end
  object cdsLocClientesPagRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocClientesPagRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 45
    Top = 970
    object IntegerField7: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object StringField22: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
  end
  object dsLocClientesPagRec: TDataSource
    DataSet = cdsLocClientesPagRec
    Left = 45
    Top = 1026
  end
  object dspLocClientesPagRec: TDataSetProvider
    DataSet = qrLocClientesPagRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 45
    Top = 921
  end
  object qrLocClientesPagRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT COD_CLIENTE, NOME_CLIENTE  FROM CLIENTES'
      'where ativo=1')
    Left = 45
    Top = 870
  end
  object cdsLocOrigControlesPagRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocOrigControlesPagRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 189
    Top = 970
    object IntegerField8: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField23: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocOrigControlesPagRec: TDataSource
    DataSet = cdsLocOrigControlesPagRec
    Left = 189
    Top = 1026
  end
  object dspLocOrigControlesPagRec: TDataSetProvider
    DataSet = qrLocOrigControlesPagRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 189
    Top = 921
  end
  object qrLocOrigControlesPagRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 189
    Top = 870
  end
  object cdsLocControlesPagRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocControlesPagRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 341
    Top = 970
    object IntegerField9: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField24: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocControlesPagRec: TDataSource
    DataSet = cdsLocControlesPagRec
    Left = 341
    Top = 1026
  end
  object dspLocControlesPagRec: TDataSetProvider
    DataSet = qrLocControlesPagRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 341
    Top = 921
  end
  object qrLocControlesPagRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 341
    Top = 870
  end
  object cdsLocTipVndPagRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipVndPagRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 482
    Top = 970
    object StringField25: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField26: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField27: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipVndPagRec: TDataSource
    DataSet = cdsLocTipVndPagRec
    Left = 482
    Top = 1026
  end
  object dspLocTipVndPagRec: TDataSetProvider
    DataSet = qrLocTipVndPagRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 482
    Top = 921
  end
  object qrLocTipVndPagRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 482
    Top = 870
  end
  object cdsLocTipoOSPagRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipoOSPagRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 617
    Top = 970
    object StringField28: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField29: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField30: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipoOSPagRec: TDataSource
    DataSet = cdsLocTipoOSPagRec
    Left = 617
    Top = 1026
  end
  object dspLocTipoOSPagRec: TDataSetProvider
    DataSet = qrLocTipoOSPagRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 617
    Top = 921
  end
  object qrLocTipoOSPagRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 617
    Top = 870
  end
  object cdsLocTipoVeicPagRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocTipoVeicPagRec'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 745
    Top = 970
    object StringField31: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object StringField32: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object StringField33: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocTipoVeicPagRec: TDataSource
    DataSet = cdsLocTipoVeicPagRec
    Left = 745
    Top = 1026
  end
  object dspLocTipoVeicPagRec: TDataSetProvider
    DataSet = qrLocTipoVeicPagRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 745
    Top = 921
  end
  object qrLocTipoVeicPagRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'select * from tipo_vendas tp where tp.ativo=1')
    Left = 745
    Top = 870
  end
  object cdsLocOrigControlesRecCXL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocOrigControlesRecCXL'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 180
    Top = 1202
    object IntegerField10: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField34: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocOrigControlesRecCXL: TDataSource
    DataSet = cdsLocOrigControlesRecCXL
    Left = 180
    Top = 1258
  end
  object dspLocOrigControlesRecCXL: TDataSetProvider
    DataSet = qrLocOrigControlesRecCXL
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 180
    Top = 1153
  end
  object qrLocOrigControlesRecCXL: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 180
    Top = 1102
  end
  object cdsLocClientesRecCXL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocClientesRecCXL'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 45
    Top = 1202
    object IntegerField11: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object StringField35: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
  end
  object dsLocClientesRecCXL: TDataSource
    DataSet = cdsLocClientesRecCXL
    Left = 45
    Top = 1258
  end
  object dspLocClientesRecCXL: TDataSetProvider
    DataSet = qrLocClientesRecCXL
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 45
    Top = 1153
  end
  object qrLocClientesRecCXL: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      'SELECT COD_CLIENTE, NOME_CLIENTE  FROM CLIENTES'
      'where ativo=1')
    Left = 45
    Top = 1102
  end
  object cdsLocControlesRecCXL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocControlesRecCXL'
    BeforeOpen = cdsLocGBeforeOpen
    Left = 324
    Top = 1202
    object IntegerField12: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object StringField36: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsLocControlesRecCXL: TDataSource
    DataSet = cdsLocControlesRecCXL
    Left = 324
    Top = 1258
  end
  object dspLocControlesRecCXL: TDataSetProvider
    DataSet = qrLocControlesRecCXL
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 324
    Top = 1153
  end
  object qrLocControlesRecCXL: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    SQL.Strings = (
      
        'SELECT FIRST 1 0 CODIGO_CTRL, '#39'SEM FORMA'#39' NOME_CTRL FROM CONTROL' +
        'ES'
      'UNION'
      'SELECT CODIGO_CTRL, NOME_CTRL  FROM CONTROLES'
      'where ativo=1')
    Left = 324
    Top = 1102
  end
  object qrbuscas9: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 248
    Top = 136
  end
  object qrbuscas8: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = TransRelatorios
    Left = 176
    Top = 136
  end
end
