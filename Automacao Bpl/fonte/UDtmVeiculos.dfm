object DtmVeiculos: TDtmVeiculos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 454
  Width = 1140
  object IBTransVeiculos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 29
    Top = 8
  end
  object qrVeiculos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransVeiculos
    SQL.Strings = (
      
        'SELECT VEICULOS.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENT' +
        'ES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, CLIENTES.FO' +
        'NE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ESTADOS.SIGLA' +
        '_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALI' +
        'DADE, SETOR.SETOR FROM VEICULOS'
      
        'LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENT' +
        'E AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA '
      'LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF '
      'LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE'
      'LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO'
      
        'LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD' +
        '_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA'
      
        'LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SE' +
        'TOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA'
      'where VEICULOS.cod_empresa = -1 and VEICULOS.ativo = 1')
    Left = 230
    Top = 57
  end
  object qrBuscasV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransVeiculos
    Left = 227
    Top = 8
  end
  object dspVeiculos: TDataSetProvider
    DataSet = qrVeiculos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 231
    Top = 105
  end
  object CdsVeiculos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVeiculos'
    BeforeOpen = CdsVeiculosBeforeOpen
    Left = 229
    Top = 153
    object CdsVeiculosSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object CdsVeiculosPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Required = True
      FixedChar = True
      Size = 10
    end
    object CdsVeiculosCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Required = True
      FixedChar = True
      Size = 17
    end
    object CdsVeiculosCODIGO: TIntegerField
      DisplayLabel = 'Cod Veiculo'
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsVeiculosCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsVeiculosCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object CdsVeiculosESPECIE: TStringField
      DisplayLabel = 'Especie'
      FieldName = 'ESPECIE'
      FixedChar = True
      Size = 15
    end
    object CdsVeiculosMARCA_V: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_V'
      FixedChar = True
      Size = 15
    end
    object CdsVeiculosMODELO: TIntegerField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
    end
    object CdsVeiculosDESCMODELO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Ve'#237'culo'
      FieldName = 'DESCMODELO'
      FixedChar = True
      Size = 30
    end
    object CdsVeiculosMOTOR: TStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
      FixedChar = True
      Size = 15
    end
    object CdsVeiculosCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      FixedChar = True
      Size = 10
    end
    object CdsVeiculosANOFAB: TIntegerField
      DisplayLabel = 'Ano Fabrica'#231#227'o'
      FieldName = 'ANOFAB'
    end
    object CdsVeiculosANOMOD: TIntegerField
      DisplayLabel = 'Ano Modelo'
      FieldName = 'ANOMOD'
    end
    object CdsVeiculosCILINDROS: TIntegerField
      DisplayLabel = 'Cilindros'
      FieldName = 'CILINDROS'
    end
    object CdsVeiculosCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'COMBUSTIVEL'
      FixedChar = True
      Size = 8
    end
    object CdsVeiculosCILINDRADA: TFloatField
      DisplayLabel = 'Cilindradas'
      FieldName = 'CILINDRADA'
    end
    object CdsVeiculosLOTACAO: TStringField
      DisplayLabel = 'Lota'#231#227'o'
      FieldName = 'LOTACAO'
      FixedChar = True
      Size = 10
    end
    object CdsVeiculosRENAVAM: TStringField
      DisplayLabel = 'Renavam'
      DisplayWidth = 6
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 6
    end
    object CdsVeiculosDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data da venda'
      FieldName = 'DATA_VENDA'
    end
    object CdsVeiculosOBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      FixedChar = True
      Size = 45
    end
    object CdsVeiculosDATA_CAD: TDateTimeField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CAD'
    end
    object CdsVeiculosUS_CAD: TIntegerField
      DisplayLabel = 'Usu'#225'rio que cadastrou'
      FieldName = 'US_CAD'
    end
    object CdsVeiculosHP: TFloatField
      FieldName = 'HP'
    end
    object CdsVeiculosATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object CdsVeiculosCOD_ESPE_SEG: TIntegerField
      DisplayLabel = 'Cod  Esp'#233'cie para Segmenta'#231#227'oi'
      FieldName = 'COD_ESPE_SEG'
    end
    object CdsVeiculosTIPO_OS: TStringField
      DisplayLabel = 'Tipo de O.S. Vinculada'
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object CdsVeiculosKM_V: TIntegerField
      DisplayLabel = 'Km'
      FieldName = 'KM_V'
    end
    object CdsVeiculosNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente (Nome Fantasia)'
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object CdsVeiculosRAZAO: TStringField
      DisplayLabel = 'Nome Cliente (Razao Social)'
      FieldName = 'RAZAO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object CdsVeiculosCEP: TStringField
      DisplayLabel = 'Cep Cliente'
      FieldName = 'CEP'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 9
    end
    object CdsVeiculosENDERECO: TStringField
      DisplayLabel = 'Endereco Cliente'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object CdsVeiculosNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Num Endereco Cliente'
      FieldName = 'NUM_END_CLIENTE'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object CdsVeiculosFONE_CLIENTE: TStringField
      DisplayLabel = 'Telefone Cliente'
      FieldName = 'FONE_CLIENTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 13
    end
    object CdsVeiculosFONE_CELULAR: TStringField
      DisplayLabel = 'Celular Cliente'
      FieldName = 'FONE_CELULAR'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 13
    end
    object CdsVeiculosEMAIL: TStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInWhere]
      Size = 256
    end
    object CdsVeiculosSIGLA_UF: TStringField
      DisplayLabel = 'Estado Cliente'
      FieldName = 'SIGLA_UF'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 2
    end
    object CdsVeiculosNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade Cliente'
      FieldName = 'NOME_CIDADE'
      ProviderFlags = [pfInWhere]
      Size = 30
    end
    object CdsVeiculosNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro Cliente'
      FieldName = 'NOME_BAIRRO'
      ProviderFlags = [pfInWhere]
      Size = 30
    end
    object CdsVeiculosLOCALIDADE: TStringField
      DisplayLabel = 'Localidade Cliente'
      FieldName = 'LOCALIDADE'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object CdsVeiculosSETOR: TStringField
      DisplayLabel = 'Setor Cliente'
      FieldName = 'SETOR'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
  end
  object dsVeiculos: TDataSource
    DataSet = CdsVeiculos
    Left = 233
    Top = 203
  end
  object RdpCadastros: TRDprint
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
    Left = 112
    Top = 272
  end
  object SpIncCodigoV: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransVeiculos
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 20
    Top = 273
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
  object qrModVeiculos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModVeiculos
    SQL.Strings = (
      'SELECT * FROM TIPMODELO where '
      'cod_empresa = -1 and ativo = 1')
    Left = 150
    Top = 60
  end
  object qrBuscasMV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModVeiculos
    Left = 147
    Top = 9
  end
  object dspModVeiculos: TDataSetProvider
    DataSet = qrModVeiculos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 152
    Top = 104
  end
  object cdsModVeiculos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModVeiculos'
    BeforeOpen = CdsVeiculosBeforeOpen
    Left = 152
    Top = 153
    object cdsModVeiculosSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsModVeiculosCODIGO: TIntegerField
      DisplayLabel = 'Cod Modelo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsModVeiculosCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsModVeiculosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do modelo'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsModVeiculosDESFAB: TStringField
      DisplayLabel = 'Descri'#231'ao da F'#225'brica'
      FieldName = 'DESFAB'
      Size = 200
    end
    object cdsModVeiculosCILINDRADA: TIntegerField
      DisplayLabel = 'Cilindradas'
      FieldName = 'CILINDRADA'
    end
    object cdsModVeiculosCODIGOFAB: TStringField
      DisplayLabel = 'Cod da f'#225'brica'
      FieldName = 'CODIGOFAB'
      FixedChar = True
      Size = 100
    end
    object cdsModVeiculosCILINDROS: TIntegerField
      DisplayLabel = 'Cilindros'
      FieldName = 'CILINDROS'
    end
    object cdsModVeiculosCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'COMBUSTIVEL'
      FixedChar = True
      Size = 50
    end
    object cdsModVeiculosHP: TFloatField
      FieldName = 'HP'
    end
    object cdsModVeiculosLOTACAO: TStringField
      DisplayLabel = 'Lota'#231#227'o'
      FieldName = 'LOTACAO'
      FixedChar = True
      Size = 10
    end
    object cdsModVeiculosTIPO: TStringField
      DisplayLabel = 'Tipo do modelo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 30
    end
    object cdsModVeiculosRENAVAM: TStringField
      DisplayLabel = 'Renavam'
      DisplayWidth = 6
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 6
    end
    object cdsModVeiculosAFATURAR: TIntegerField
      DisplayLabel = 'A Faturar'
      FieldName = 'AFATURAR'
    end
    object cdsModVeiculosVNDESTOQUE: TStringField
      DisplayLabel = 'Venda/Estoque Honda'
      FieldName = 'VNDESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsModVeiculosVALTAB: TFloatField
      DisplayLabel = 'Valor de venda'
      FieldName = 'VALTAB'
    end
    object cdsModVeiculosVLBICMSUB: TFloatField
      DisplayLabel = 'Base ICM Sub'
      FieldName = 'VLBICMSUB'
    end
    object cdsModVeiculosVLICMSUB: TFloatField
      DisplayLabel = 'Valor ICM Sub'
      FieldName = 'VLICMSUB'
    end
    object cdsModVeiculosANO1: TIntegerField
      DisplayLabel = 'Ano 1'
      FieldName = 'ANO1'
    end
    object cdsModVeiculosMODELO1: TIntegerField
      DisplayLabel = 'Modelo 1'
      FieldName = 'MODELO1'
    end
    object cdsModVeiculosINICHASSI1: TStringField
      DisplayLabel = 'Chassi 1'
      FieldName = 'INICHASSI1'
      Size = 11
    end
    object cdsModVeiculosANO2: TIntegerField
      DisplayLabel = 'Ano 2'
      FieldName = 'ANO2'
    end
    object cdsModVeiculosMODELO2: TIntegerField
      DisplayLabel = 'Modelo 2'
      FieldName = 'MODELO2'
    end
    object cdsModVeiculosINICHASSI2: TStringField
      DisplayLabel = 'Chassi 2'
      FieldName = 'INICHASSI2'
      Size = 11
    end
    object cdsModVeiculosORDTIPO: TIntegerField
      DisplayLabel = 'Ord. Impress'#227'o'
      FieldName = 'ORDTIPO'
    end
    object cdsModVeiculosPISCOFINS: TFloatField
      DisplayLabel = 'Pis/Confins'
      FieldName = 'PISCOFINS'
    end
    object cdsModVeiculosCOD_FIPE: TStringField
      DisplayLabel = 'Tabela Fipe'
      FieldName = 'COD_FIPE'
      FixedChar = True
      Size = 8
    end
    object cdsModVeiculosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsModVeiculosNOME_PLAN: TStringField
      Tag = 1
      DisplayLabel = 'Nome Plan'
      FieldName = 'NOME_PLAN'
      FixedChar = True
      Size = 30
    end
    object cdsModVeiculosTIP_VEICULO: TStringField
      DisplayLabel = 'Mod Renavam'
      FieldName = 'TIP_VEICULO'
      Size = 2
    end
    object cdsModVeiculosCMKG: TStringField
      FieldName = 'CMKG'
      Size = 9
    end
    object cdsModVeiculosDISTANCIAEIXO: TStringField
      DisplayLabel = 'Dist'#226'ncia entre Eixo'
      FieldName = 'DISTANCIAEIXO'
      Size = 4
    end
    object cdsModVeiculosPESOL: TIntegerField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESOL'
    end
    object cdsModVeiculosPESOB: TIntegerField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESOB'
    end
    object cdsModVeiculosVL_UNITARIO_NF: TFloatField
      DisplayLabel = 'Valor Unit NF'
      FieldName = 'VL_UNITARIO_NF'
    end
    object cdsModVeiculosESPRENAVAM: TStringField
      DisplayLabel = 'Esp Renavam'
      FieldName = 'ESPRENAVAM'
      Size = 2
    end
    object cdsModVeiculosNCMSH: TStringField
      DisplayLabel = 'NCM SH'
      FieldName = 'NCMSH'
      Size = 8
    end
    object cdsModVeiculosTPCOMB: TStringField
      DisplayLabel = 'TP Combust'#237'vel'
      FieldName = 'TPCOMB'
      FixedChar = True
      Size = 2
    end
    object cdsModVeiculosVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
    end
    object cdsModVeiculosVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
    end
    object cdsModVeiculosURL_HONDA: TStringField
      DisplayLabel = 'Url HONDA'
      FieldName = 'URL_HONDA'
      Size = 128
    end
    object cdsModVeiculosSITE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'SITE'
      FixedChar = True
      Size = 1
    end
    object cdsModVeiculosMES_RET_SERV1: TIntegerField
      DisplayLabel = 'Mes Primeira Revis'#227'o'
      FieldName = 'MES_RET_SERV1'
    end
    object cdsModVeiculosKM_RET_SERV1: TIntegerField
      DisplayLabel = 'KM Primeira Revis'#227'o'
      FieldName = 'KM_RET_SERV1'
    end
    object cdsModVeiculosMES_RET_SERV3: TIntegerField
      DisplayLabel = 'Mes Segunda Revis'#227'o'
      FieldName = 'MES_RET_SERV3'
    end
    object cdsModVeiculosKM_RET_SERV3: TIntegerField
      DisplayLabel = 'KM Segunda Revis'#227'o'
      FieldName = 'KM_RET_SERV3'
    end
    object cdsModVeiculosINTERV_KM_SERV: TIntegerField
      DisplayLabel = 'Intervalo KM entre Revis'#227'o'
      FieldName = 'INTERV_KM_SERV'
    end
    object cdsModVeiculosMARCA_DESC: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_DESC'
      Size = 10
    end
    object cdsModVeiculosCOD_CTA_EST_VEIC: TStringField
      DisplayLabel = 'Conta Anal'#237'tica Cont'#225'bil Ve'#237'culos Novos'
      FieldName = 'COD_CTA_EST_VEIC'
      Size = 60
    end
    object cdsModVeiculosCOD_CTA_EST_SEMI: TStringField
      DisplayLabel = 'Conta Anal'#237'tica Cont'#225'bil Ve'#237'culos Usados'
      FieldName = 'COD_CTA_EST_SEMI'
      Size = 60
    end
  end
  object dsModVeiculos: TDataSource
    DataSet = cdsModVeiculos
    Left = 153
    Top = 202
  end
  object IBTransModVeiculos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 29
    Top = 59
  end
  object qrTabelaFipe: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModVeiculos
    SQL.Strings = (
      'select * from tab_fipe '
      'where ativo=1'
      'order by desc_mod')
    Left = 314
    Top = 6
    object qrTabelaFipeCOD_FIPE: TIBStringField
      FieldName = 'COD_FIPE'
      Origin = '"TAB_FIPE"."COD_FIPE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 8
    end
    object qrTabelaFipeMARCA_MOD: TIBStringField
      FieldName = 'MARCA_MOD'
      Origin = '"TAB_FIPE"."MARCA_MOD"'
      FixedChar = True
      Size = 17
    end
    object qrTabelaFipeDESC_MOD: TIBStringField
      FieldName = 'DESC_MOD'
      Origin = '"TAB_FIPE"."DESC_MOD"'
      FixedChar = True
      Size = 41
    end
    object qrTabelaFipeATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"TAB_FIPE"."ATIVO"'
    end
  end
  object dsTabelaFipe: TDataSource
    DataSet = qrTabelaFipe
    Left = 317
    Top = 52
  end
  object SpIncCodigoMV: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModVeiculos
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 23
    Top = 322
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
  object qrLocClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransVeiculos
    SQL.Strings = (
      'SELECT * FROM CLIENTES WHERE ativo = 1 and COD_EMPRESA =-1')
    Left = 394
    Top = 2
    object qrLocClientesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocClientesNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
  end
  object dsLocClientes: TDataSource
    DataSet = qrLocClientes
    Left = 397
    Top = 56
  end
  object qrEspecieVeiculo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransVeiculos
    SQL.Strings = (
      'SELECT * FROM ESPECIE_VEICULO')
    Left = 474
    Top = 2
    object qrEspecieVeiculoCODIGO_ESP: TIntegerField
      FieldName = 'CODIGO_ESP'
      Origin = '"ESPECIE_VEICULO"."CODIGO_ESP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrEspecieVeiculoDESCRICAO_ESP: TIBStringField
      FieldName = 'DESCRICAO_ESP'
      Origin = '"ESPECIE_VEICULO"."DESCRICAO_ESP"'
      FixedChar = True
      Size = 30
    end
    object qrEspecieVeiculoOBSERVACAO_ESP: TIBStringField
      FieldName = 'OBSERVACAO_ESP'
      Origin = '"ESPECIE_VEICULO"."OBSERVACAO_ESP"'
      FixedChar = True
      Size = 40
    end
  end
  object dsEspecieVeiculo: TDataSource
    DataSet = qrEspecieVeiculo
    Left = 477
    Top = 56
  end
  object qrLocColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransVeiculos
    SQL.Strings = (
      'SELECT * FROM COLABORADOR WHERE ativo = 1 '
      'and COD_EMPRESA = -1')
    Left = 570
    Top = 4
    object qrLocColaboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"COLABORADOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocColaboradorNOME_VENDEDOR: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsLocColaborador: TDataSource
    DataSet = qrLocColaborador
    Left = 573
    Top = 53
  end
  object qrLocModV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModVeiculos
    SQL.Strings = (
      'SELECT * FROM TIPMODELO where '
      'cod_empresa = -1 and ativo = 1')
    Left = 746
    Top = 4
  end
  object dspLocModV: TDataSetProvider
    DataSet = qrLocModV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 743
    Top = 56
  end
  object cdsLocModVeiculos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocModV'
    BeforeOpen = CdsVeiculosBeforeOpen
    Left = 745
    Top = 113
    object cdsLocModVeiculosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsLocModVeiculosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsLocModV: TDataSource
    DataSet = cdsLocModVeiculos
    Left = 749
    Top = 162
  end
  object qrAbreTPComb: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM TP_COMB_RENAVAM where 1=0')
    Left = 666
    Top = 4
    object qrAbreTPCombCODIGO_TPCOMB: TIntegerField
      FieldName = 'CODIGO_TPCOMB'
      Origin = '"TP_COMB_RENAVAM"."CODIGO_TPCOMB"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreTPCombDESCR_COMB: TIBStringField
      FieldName = 'DESCR_COMB'
      Origin = '"TP_COMB_RENAVAM"."DESCR_COMB"'
      Size = 50
    end
  end
  object IBTransPesquisa: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 29
    Top = 115
  end
  object dsLocTPComb: TDataSource
    DataSet = qrAbreTPComb
    Left = 669
    Top = 50
  end
  object qrTabPrecoVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransVeiculos
    SQL.Strings = (
      'SELECT * FROM TABPRECO_VEICULO where '
      'cod_empresa = -1 and ativo = 1')
    Left = 831
    Top = 1
  end
  object dspTabPrecoVeic: TDataSetProvider
    DataSet = qrTabPrecoVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 833
    Top = 50
  end
  object cdsTabPrecoVeic: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTabPrecoVeic'
    BeforeOpen = CdsVeiculosBeforeOpen
    Left = 835
    Top = 110
    object cdsTabPrecoVeicCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
      Required = True
    end
    object cdsTabPrecoVeicANO_FAB: TIntegerField
      FieldName = 'ANO_FAB'
      Required = True
    end
    object cdsTabPrecoVeicANO_MOD: TIntegerField
      FieldName = 'ANO_MOD'
      Required = True
    end
    object cdsTabPrecoVeicCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTabPrecoVeicPREC_TAB: TFloatField
      FieldName = 'PREC_TAB'
      currency = True
    end
    object cdsTabPrecoVeicPREC_MIN: TFloatField
      FieldName = 'PREC_MIN'
      currency = True
    end
    object cdsTabPrecoVeicATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsTabPrecoVeic: TDataSource
    DataSet = cdsTabPrecoVeic
    Left = 834
    Top = 169
  end
  object qrModVCorF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModVeiculos
    SQL.Strings = (
      
        'select * from TIPMODELO_CODIGOFAB where codigo = 0 and cod_empre' +
        'sa = 0')
    Left = 935
    Top = 1
  end
  object dspModVCorF: TDataSetProvider
    DataSet = qrModVCorF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 937
    Top = 50
  end
  object cdsModVCorF: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspModVCorF'
    BeforeOpen = CdsVeiculosBeforeOpen
    Left = 939
    Top = 110
    object cdsModVCorFCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsModVCorFCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Emp'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsModVCorFCODIGO_FAB: TStringField
      DisplayLabel = 'Codigo Fabricante'
      FieldName = 'CODIGO_FAB'
      Required = True
      Size = 60
    end
    object cdsModVCorFDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD'
    end
  end
  object dsModVCorF: TDataSource
    DataSet = cdsModVCorF
    Left = 938
    Top = 169
  end
  object qrServicosSugeridos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select regras_sug.codigo, regras_sug.descricao,'
      
        'regras_sug.mes_ret_serv1, regras_sug.mes_ret_serv2, regras_sug.i' +
        'nterv_mes_serv,'
      
        'regras_sug.km_ret_serv1, regras_sug.km_ret_serv2, regras_sug.int' +
        'erv_km_serv'
      ' from regras_sug'
      
        'where regras_sug.tipo = '#39'V'#39' and regras_sug.cod_empresa = 1 and r' +
        'egras_sug.ativo = 1')
    Left = 1041
    Top = 5
  end
  object dspServicosSugeridos: TDataSetProvider
    DataSet = qrServicosSugeridos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1041
    Top = 60
  end
  object cdsServicosSugeridos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServicosSugeridos'
    BeforeOpen = CdsVeiculosBeforeOpen
    Left = 1041
    Top = 109
    object StringField143: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsServicosSugeridosCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsServicosSugeridosDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsServicosSugeridosMES_RET_SERV1: TIntegerField
      DisplayLabel = 'Mes prim rev'
      FieldName = 'MES_RET_SERV1'
    end
    object cdsServicosSugeridosMES_RET_SERV2: TIntegerField
      DisplayLabel = 'Mes seg rev'
      FieldName = 'MES_RET_SERV2'
    end
    object cdsServicosSugeridosINTERV_MES_SERV: TIntegerField
      DisplayLabel = 'Interv meses rev'
      FieldName = 'INTERV_MES_SERV'
    end
    object cdsServicosSugeridosKM_RET_SERV1: TIntegerField
      DisplayLabel = 'Km Prim rev'
      FieldName = 'KM_RET_SERV1'
    end
    object cdsServicosSugeridosKM_RET_SERV2: TIntegerField
      DisplayLabel = 'Km seg rev'
      FieldName = 'KM_RET_SERV2'
    end
    object cdsServicosSugeridosINTERV_KM_SERV: TIntegerField
      DisplayLabel = 'Interv km rev'
      FieldName = 'INTERV_KM_SERV'
    end
  end
  object dsServicosSugeridos: TDataSource
    DataSet = cdsServicosSugeridos
    Left = 1041
    Top = 166
  end
end
