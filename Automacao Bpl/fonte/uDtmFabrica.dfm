object dtmFabrica: TdtmFabrica
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 236
  Width = 572
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 24
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
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 105
    Top = 14
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 240
    Top = 16
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
    Left = 176
    Top = 16
  end
  object qrBuscas1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from INDICE_TECNICO')
    Left = 304
    Top = 16
  end
  object DspcomunicaAssohonda: TDataSetProvider
    DataSet = QrComunicaAssohonda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 388
    Top = 68
  end
  object CdsComunicaAssohonda: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'DspcomunicaAssohonda'
    BeforeOpen = CdsComunicaAssohondaBeforeOpen
    Left = 386
    Top = 125
    object CdsComunicaAssohondaTP_INCLUSAO: TStringField
      DisplayLabel = 'TpIncl'
      FieldName = 'TP_INCLUSAO'
      Size = 1
    end
    object CdsComunicaAssohondaDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Gera'#231#227'o'
      FieldName = 'DATA_ARQUIVO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object CdsComunicaAssohondaCOD_COR: TIntegerField
      DisplayLabel = 'C'#243'd.Cor'
      FieldName = 'COD_COR'
      Required = True
    end
    object CdsComunicaAssohondaDESC_MODELO: TStringField
      DisplayLabel = 'Descri'#231#227'o Modelo'
      FieldName = 'DESC_MODELO'
      Size = 60
    end
    object CdsComunicaAssohondaDESC_COR: TStringField
      DisplayLabel = 'Descri'#231#227'o da Cor'
      FieldName = 'DESC_COR'
      Size = 30
    end
    object CdsComunicaAssohondaESTOQUEFISICO: TIntegerField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'ESTOQUEFISICO'
    end
    object CdsComunicaAssohondaTRANSITO: TIntegerField
      DisplayLabel = 'Tr'#226'nsito'
      FieldName = 'TRANSITO'
    end
    object CdsComunicaAssohondaCANCELAMENTO: TIntegerField
      DisplayLabel = 'Cancelados'
      FieldName = 'CANCELAMENTO'
    end
    object CdsComunicaAssohondaVENDASDIA: TIntegerField
      DisplayLabel = 'Vnd Dia'
      FieldName = 'VENDASDIA'
    end
    object CdsComunicaAssohondaVENDASACUMULADA: TIntegerField
      DisplayLabel = 'Vnd.Acum.M'#234's'
      FieldName = 'VENDASACUMULADA'
    end
    object CdsComunicaAssohondaSALDOFATURAR: TIntegerField
      DisplayLabel = 'Saldo a Faturar'
      FieldName = 'SALDOFATURAR'
    end
    object CdsComunicaAssohondaPEDIDOFIRME: TIntegerField
      DisplayLabel = 'Pedido Firme'
      FieldName = 'PEDIDOFIRME'
    end
    object CdsComunicaAssohondaCONFIRMADOHONDA: TIntegerField
      DisplayLabel = 'Confirmado Honda'
      FieldName = 'CONFIRMADOHONDA'
    end
    object CdsComunicaAssohondaPEDIDOADICIONAL: TIntegerField
      DisplayLabel = 'Pedido Adicional'
      FieldName = 'PEDIDOADICIONAL'
    end
    object CdsComunicaAssohondaSTATUS_RETORNO: TStringField
      DisplayLabel = 'Status WebService Assohonda'
      FieldName = 'STATUS_RETORNO'
      Size = 80
    end
    object CdsComunicaAssohondaCOD_STATUS_RET: TIntegerField
      DisplayLabel = 'C'#243'digo Retorno Webservice Assohonda'
      FieldName = 'COD_STATUS_RET'
    end
    object CdsComunicaAssohondaCOD_STATUS_RETV: TIntegerField
      DisplayLabel = 'C'#243'digo Status Envio Venda Webservice'
      FieldName = 'COD_STATUS_RETV'
    end
    object CdsComunicaAssohondaSTATUS_RETORNOV: TStringField
      DisplayLabel = 'Status retorno Envio Venda Webservice'
      FieldName = 'STATUS_RETORNOV'
      Size = 80
    end
    object CdsComunicaAssohondaORDTIPO: TIntegerField
      DisplayLabel = 'Ordem interna dos modelos'
      FieldName = 'ORDTIPO'
      Required = True
    end
    object CdsComunicaAssohondaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsComunicaAssohondaCOD_MODELO: TIntegerField
      DisplayLabel = 'C'#243'd.Modelo'
      FieldName = 'COD_MODELO'
      Required = True
    end
  end
  object QrComunicaAssohonda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from INTEGRA_ASSOHONDA where ativo = 1')
    Left = 390
    Top = 17
  end
  object DtcomunicaAssoHonda: TDataSource
    DataSet = CdsComunicaAssohonda
    Left = 488
    Top = 20
  end
  object QrTipoModelo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from tipmodelo where vndestoque = '#39'S'#39)
    Left = 288
    Top = 72
    object QrTipoModeloCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"TIPMODELO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QrTipoModeloDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TIPMODELO"."DESCRICAO"'
      Size = 60
    end
    object QrTipoModeloORDTIPO: TIntegerField
      FieldName = 'ORDTIPO'
      Origin = '"TIPMODELO"."ORDTIPO"'
    end
  end
  object Ibcodigocorfab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select *  from CODIGO_CORFAB')
    Left = 280
    Top = 125
    object IbcodigocorfabCOD_COR: TIntegerField
      FieldName = 'COD_COR'
      Origin = '"CODIGO_CORFAB"."COD_COR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbcodigocorfabDESCRICAO_COR: TIBStringField
      FieldName = 'DESCRICAO_COR'
      Origin = '"CODIGO_CORFAB"."DESCRICAO_COR"'
      Size = 30
    end
  end
  object DtTipoModelo: TDataSource
    DataSet = QrTipoModelo
    Left = 200
    Top = 72
  end
  object DtCodigoCorFab: TDataSource
    DataSet = Ibcodigocorfab
    Left = 192
    Top = 128
  end
end
