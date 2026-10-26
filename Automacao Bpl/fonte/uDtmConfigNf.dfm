object dtmConfigNf: TdtmConfigNf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 579
  Width = 960
  object dsCabecalhonf: TDataSource
    AutoEdit = False
    DataSet = cdsCabecalhonf
    Left = 48
    Top = 400
  end
  object cdsCabecalhonf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCabecalhonf'
    BeforeOpen = cdsCabecalhonfBeforeOpen
    Left = 48
    Top = 344
    object cdsCabecalhonfCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object cdsCabecalhonfNOME_NF: TStringField
      Tag = 2
      DisplayLabel = 'Nome Nota Fiscal'
      FieldName = 'NOME_NF'
      Size = 40
    end
    object cdsCabecalhonfPORTA_IMPRESSAO: TStringField
      DisplayLabel = 'Porta Impress'#227'o'
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object cdsCabecalhonfTIPO_NOTA: TStringField
      DisplayLabel = 'Tipo da Nota Fiscal'
      FieldName = 'TIPO_NOTA'
      FixedChar = True
      Size = 4
    end
    object cdsCabecalhonfQTDELINHA: TIntegerField
      DisplayLabel = 'Qtde Linha'
      FieldName = 'QTDELINHA'
    end
    object cdsCabecalhonfTAMANHOFONTE: TStringField
      DisplayLabel = ' Tamanho da Fonte'
      FieldName = 'TAMANHOFONTE'
      FixedChar = True
      Size = 10
    end
    object cdsCabecalhonfENTRELINHAMENTO: TStringField
      DisplayLabel = 'Entrelinhamento'
      FieldName = 'ENTRELINHAMENTO'
    end
    object cdsCabecalhonfATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dspCabecalhonf: TDataSetProvider
    DataSet = qrCabecalhonf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 48
    Top = 296
  end
  object qrCabecalhonf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from CABECALHO_NF')
    Left = 48
    Top = 248
  end
  object dsItensConfignf: TDataSource
    AutoEdit = False
    DataSet = cdsItensConfignf
    Left = 136
    Top = 400
  end
  object cdsItensConfignf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItensConfignf'
    BeforeOpen = cdsCabecalhonfBeforeOpen
    Left = 136
    Top = 344
    object cdsItensConfignfCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object cdsItensConfignfDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsItensConfignfATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsItensConfignfIMP: TIntegerField
      FieldName = 'IMP'
    end
  end
  object dspItensConfignf: TDataSetProvider
    DataSet = qrItensConfignf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 296
  end
  object qrItensConfignf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select icn.*,(select count(codigo) from camposnf  where nordem_c' +
        'amp = icn.ordem and tipo_nota = 10) IMP'
      'from Itens_Config_nf icn'
      'where ativo = 1 order by ordem')
    Left = 136
    Top = 248
    object qrItensConfignfCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ITENS_CONFIG_NF"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrItensConfignfDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITENS_CONFIG_NF"."DESCRICAO"'
      Size = 60
    end
    object qrItensConfignfORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_CONFIG_NF"."ORDEM"'
    end
    object qrItensConfignfATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"ITENS_CONFIG_NF"."ATIVO"'
    end
    object qrItensConfignfIMP: TIntegerField
      FieldName = 'IMP'
      ProviderFlags = []
    end
  end
  object qrConfignf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from CONFIG_NF')
    Left = 224
    Top = 248
  end
  object dsConfignf: TDataSource
    AutoEdit = False
    DataSet = cdsConfignf
    Left = 224
    Top = 400
  end
  object cdsConfignf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfignf'
    BeforeOpen = cdsCabecalhonfBeforeOpen
    Left = 224
    Top = 344
    object cdsConfignfCOD_NOTAFISCAL: TIntegerField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'COD_NOTAFISCAL'
    end
    object cdsConfignfCOD_ITEM: TIntegerField
      DisplayLabel = 'Campo'
      FieldName = 'COD_ITEM'
    end
    object cdsConfignfORDEM_CFG: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM_CFG'
      Required = True
    end
    object cdsConfignfLINHA_CFG: TIntegerField
      DisplayLabel = 'Linha'
      FieldName = 'LINHA_CFG'
    end
    object cdsConfignfCOLUNA_CFG: TIntegerField
      DisplayLabel = 'Coluna'
      FieldName = 'COLUNA_CFG'
    end
    object cdsConfignfCONDENSADO: TIntegerField
      DisplayLabel = 'Condensado'
      FieldName = 'CONDENSADO'
    end
    object cdsConfignfNEGRITO: TIntegerField
      DisplayLabel = 'Negrito'
      FieldName = 'NEGRITO'
    end
    object cdsConfignfMAXLINHAS: TIntegerField
      DisplayLabel = 'Max. Linhas'
      FieldName = 'MAXLINHAS'
    end
    object cdsConfignfSEQCFGNOTA: TIntegerField
      Tag = 1
      DisplayLabel = 'Seq Nota'
      FieldName = 'SEQCFGNOTA'
      Required = True
    end
    object cdsConfignfATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsConfignfTAMANHO_CAMPO: TIntegerField
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO_CAMPO'
    end
  end
  object dspConfignf: TDataSetProvider
    DataSet = qrConfignf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 224
    Top = 296
  end
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 48
    Top = 24
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 47
    Top = 72
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 45
    Top = 121
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
  object qrImpressao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 48
    Top = 176
  end
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
    OpcoesPreview.Remalina = False
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
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'Leste Informatica'
    RegistroUsuario.SerieProduto = 'SINGLE-0207/01448'
    RegistroUsuario.AutorizacaoKey = 'LORJ-4339-FPTL-2679-YIUK'
    About = 'RDprint 4.0d - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Impress'#227'o de R'#233'gua'
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
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 128
    Top = 176
  end
  object qrCamposNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select'
      'cbf.porta_impressao, cbf.entrelinhamento,'
      'cn.nordem_camp, cn.tabela, cn.descricao_camp,'
      
        'cnf.linha_cfg,  cnf.coluna_cfg, cnf.condensado, cnf.maxlinhas, c' +
        'nf.negrito, cnf.tamanho_campo, cnf.ordem_cfg'
      'from camposnf cn'
      'inner join itens_config_nf itn on itn.ordem = cn.nordem_camp'
      'inner join config_nf cnf on cnf.cod_item = itn.codigo'
      'inner join cabecalho_nf cbf on cbf.codigo = cnf.cod_notafiscal'
      'where cbf.codigo = :codigo'
      'and cn.tipo_nota = 10')
    Left = 296
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object dsCamposNf: TDataSource
    AutoEdit = False
    DataSet = cdsCamposNf
    Left = 296
    Top = 400
  end
  object cdsCamposNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCamposNf'
    BeforeOpen = cdsCabecalhonfBeforeOpen
    Left = 296
    Top = 344
    object cdsCamposNfPORTA_IMPRESSAO: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object cdsCamposNfENTRELINHAMENTO: TStringField
      FieldName = 'ENTRELINHAMENTO'
    end
    object cdsCamposNfNORDEM_CAMP: TIntegerField
      FieldName = 'NORDEM_CAMP'
    end
    object cdsCamposNfTABELA: TStringField
      FieldName = 'TABELA'
      Size = 30
    end
    object cdsCamposNfDESCRICAO_CAMP: TStringField
      FieldName = 'DESCRICAO_CAMP'
      Size = 50
    end
    object cdsCamposNfLINHA_CFG: TIntegerField
      FieldName = 'LINHA_CFG'
    end
    object cdsCamposNfCOLUNA_CFG: TIntegerField
      FieldName = 'COLUNA_CFG'
    end
    object cdsCamposNfCONDENSADO: TIntegerField
      FieldName = 'CONDENSADO'
    end
    object cdsCamposNfMAXLINHAS: TIntegerField
      FieldName = 'MAXLINHAS'
    end
    object cdsCamposNfNEGRITO: TIntegerField
      FieldName = 'NEGRITO'
    end
    object cdsCamposNfTAMANHO_CAMPO: TIntegerField
      FieldName = 'TAMANHO_CAMPO'
    end
    object cdsCamposNfORDEM_CFG: TIntegerField
      FieldName = 'ORDEM_CFG'
      Required = True
    end
  end
  object dspCamposNf: TDataSetProvider
    DataSet = qrCamposNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 296
    Top = 296
  end
end
