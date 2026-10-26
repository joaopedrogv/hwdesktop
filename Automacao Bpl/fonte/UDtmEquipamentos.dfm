object DtmEquipamentos: TDtmEquipamentos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 529
  Width = 1079
  object IBTransEquipamentos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 43
    Top = 8
  end
  object qrEquipamentos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      'SELECT EQUIPAMENTO.*, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '    CLIENTES.NOME_CLIENTE '
      'ELSE '
      '    COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '    CLIENTES.RAZAO '
      'ELSE '
      '    COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '     CLIENTES.CEP '
      'ELSE '
      '    COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '     CLIENTES.ENDERECO '
      'ELSE '
      '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '     CLIENTES.NUM_END_CLIENTE '
      'ELSE '
      '     '#39#39' END NUM_END_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '    CLIENTES.FONE_CLIENTE '
      'ELSE '
      '    COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '    CLIENTES.FONE_CELULAR '
      'ELSE '
      '    '#39#39' END CELULAR_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '    CLIENTES.EMAIL '
      'ELSE '
      '    COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '   ESTADOS.SIGLA_UF '
      'ELSE '
      '   EST.SIGLA_UF END SIGLA_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '   CIDADES.NOME_CIDADE '
      'ELSE '
      '   CID.NOME_CIDADE END CIDADE_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '   BAIRROS.NOME_BAIRRO'
      'ELSE '
      '   BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO,'
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '      LOCALIDADE.LOCALIDADE '
      'ELSE '
      '    '#39#39' END LOCALIDADE_PROPRIETARIO, '
      'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = '#39'E'#39') THEN '
      '    SETOR.SETOR '
      'ELSE '
      '    '#39#39' END SETOR_PROPRIETARIO'
      ' FROM EQUIPAMENTO '
      
        'LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PRO' +
        'P AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA '
      'LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF '
      'LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE '
      'LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO'
      
        'LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD' +
        '_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '
      
        'LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SE' +
        'TOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA '
      
        'LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.' +
        'COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA '
      'LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF '
      
        'LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE' +
        ' '
      'LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO'
      'WHERE  EQUIPAMENTO.COD_EMPRESA = 1')
    Left = 52
    Top = 89
  end
  object qrBuscasEquip: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    Left = 135
    Top = 8
  end
  object dspEquipamentos: TDataSetProvider
    DataSet = qrEquipamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 51
    Top = 135
  end
  object cdsEquipamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEquipamentos'
    BeforeOpen = cdsEquipamentosBeforeOpen
    Left = 52
    Top = 180
    object cdsEquipamentosSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEquipamentosCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod Equipamento'
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsEquipamentosCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEquipamentosUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsEquipamentosDAT_CAD_EQUI: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DAT_CAD_EQUI'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEquipamentosESTADO_EQUI: TMemoField
      DisplayLabel = 'Conserva'#231#227'o'
      FieldName = 'ESTADO_EQUI'
      OnGetText = cdsEquipamentosESTADO_EQUIGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsEquipamentosTIP_EQUIP: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIP_EQUIP'
      FixedChar = True
      Size = 1
    end
    object cdsEquipamentosVLR_EQUI: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_EQUI'
      currency = True
    end
    object cdsEquipamentosIND_DEPREC: TFloatField
      DisplayLabel = #205'ndice de Deprecia'#231#227'o'
      FieldName = 'IND_DEPREC'
    end
    object cdsEquipamentosCOD_DEPART: TIntegerField
      DisplayLabel = 'Cod Departamento'
      FieldName = 'COD_DEPART'
    end
    object cdsEquipamentosCOD_PROP: TIntegerField
      DisplayLabel = 'Cod Proprietario'
      FieldName = 'COD_PROP'
    end
    object cdsEquipamentosNOM_EQUIP: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsEquipamentosN_SERIE: TStringField
      DisplayLabel = 'N'#250'mero de S'#233'rie'
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsEquipamentosMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsEquipamentosMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 32
    end
    object cdsEquipamentosCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      Size = 16
    end
    object cdsEquipamentosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsEquipamentosCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
      Required = True
    end
    object cdsEquipamentosIDENTIFICACAO: TStringField
      DisplayLabel = 'Identificacao'
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 6
    end
    object cdsEquipamentosN_SERIE_FAB: TStringField
      DisplayLabel = 'N'#186' de Serie do Fabricante ECF'
      FieldName = 'N_SERIE_FAB'
    end
    object cdsEquipamentosN_MEMORIA_FISCAL: TStringField
      DisplayLabel = 'N'#186' Memoria Fiscal ECF'
      FieldName = 'N_MEMORIA_FISCAL'
    end
    object cdsEquipamentosCODSEQ_BALANCO: TIntegerField
      DisplayLabel = 'Cod Seq Balanco'
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsEquipamentosTIPEQUIP: TStringField
      DisplayLabel = 'Tipo Imob'
      FieldName = 'TIPEQUIP'
      Size = 1
    end
    object cdsEquipamentosIDENT_MERC: TStringField
      DisplayLabel = '1: Bem-2:Componente'
      FieldName = 'IDENT_MERC'
      FixedChar = True
      Size = 1
    end
    object cdsEquipamentosCOD_PRNC: TIntegerField
      DisplayLabel = 'Codigo Bem Principal'
      FieldName = 'COD_PRNC'
    end
    object cdsEquipamentosCOD_CTA_EQ: TStringField
      DisplayLabel = 'Conta Contabil'
      FieldName = 'COD_CTA_EQ'
      Size = 60
    end
    object cdsEquipamentosNR_PARC: TSmallintField
      DisplayLabel = 'N Parcelas Aprop'
      FieldName = 'NR_PARC'
    end
    object cdsEquipamentosCOD_CCUS: TSmallintField
      DisplayLabel = 'Centro Custos'
      FieldName = 'COD_CCUS'
    end
    object cdsEquipamentosFUNC: TMemoField
      DisplayLabel = 'Funcao'
      FieldName = 'FUNC'
      OnGetText = cdsEquipamentosFUNCGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsEquipamentosVIDA_UTIL: TSmallintField
      DisplayLabel = 'Vida Util'
      FieldName = 'VIDA_UTIL'
    end
    object cdsEquipamentosSPED: TStringField
      DisplayLabel = 'Sped Fiscal'
      FieldName = 'SPED'
      FixedChar = True
      Size = 1
    end
    object cdsEquipamentosTIPOOSVINC: TStringField
      DisplayLabel = 'Tipo OS Vinculada'
      FieldName = 'TIPOOSVINC'
      Size = 10
    end
    object cdsEquipamentosCOMCONTRATO: TStringField
      DisplayLabel = 'Contrato de Manutencao'
      FieldName = 'COMCONTRATO'
      FixedChar = True
      Size = 1
    end
    object cdsEquipamentosSTATUS_V: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_V'
      FixedChar = True
      Size = 1
    end
    object cdsEquipamentosDATA_VEN: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VEN'
    end
    object cdsEquipamentosCOD_ESTMOTO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Veiculo'
      FieldName = 'COD_ESTMOTO'
    end
    object cdsEquipamentosCOD_NF_ENT: TIntegerField
      DisplayLabel = 'Cod NF Ent'
      FieldName = 'COD_NF_ENT'
    end
    object cdsEquipamentosNITEM_ENT: TIntegerField
      DisplayLabel = 'Num It NF Ent'
      FieldName = 'NITEM_ENT'
    end
    object cdsEquipamentosCOD_NF_SAI: TIntegerField
      DisplayLabel = 'Cod NF Saida'
      FieldName = 'COD_NF_SAI'
    end
    object cdsEquipamentosNITEM_SAI: TIntegerField
      DisplayLabel = 'Num Item NF Saida'
      FieldName = 'NITEM_SAI'
    end
    object cdsEquipamentosPORTARIA_MODELO: TStringField
      DisplayLabel = 'Portaria de aprovacao'
      FieldName = 'PORTARIA_MODELO'
      Size = 64
    end
    object cdsEquipamentosNOME_PROPRIETARIO: TStringField
      DisplayLabel = 'Nome Proprietario (Nome Fantasia)'
      FieldName = 'NOME_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 35
    end
    object cdsEquipamentosRAZAO_PROPRIETARIO: TStringField
      DisplayLabel = 'Nome Proprietario (Razao Social)'
      FieldName = 'RAZAO_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsEquipamentosCEP_PROPRIETARIO: TStringField
      DisplayLabel = 'Cep Proprietario'
      FieldName = 'CEP_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 9
    end
    object cdsEquipamentosENDERECO_PROPRIETARIO: TStringField
      DisplayLabel = 'Endereco Proprietario'
      FieldName = 'ENDERECO_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsEquipamentosNUM_END_PROPRIETARIO: TStringField
      DisplayLabel = 'Num Endereco Proprietario'
      FieldName = 'NUM_END_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsEquipamentosFONE_PROPRIETARIO: TStringField
      DisplayLabel = 'Telefone Proprietario'
      FieldName = 'FONE_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 14
    end
    object cdsEquipamentosCELULAR_PROPRIETARIO: TStringField
      DisplayLabel = 'Celular Proprietario'
      FieldName = 'CELULAR_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 13
    end
    object cdsEquipamentosEMAIL_PROPRIETARIO: TStringField
      DisplayLabel = 'Email Proprietario'
      FieldName = 'EMAIL_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 256
    end
    object cdsEquipamentosSIGLA_PROPRIETARIO: TStringField
      DisplayLabel = 'Estado Proprietario'
      FieldName = 'SIGLA_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 2
    end
    object cdsEquipamentosCIDADE_PROPRIETARIO: TStringField
      DisplayLabel = 'Cidade Proprietario'
      FieldName = 'CIDADE_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 30
    end
    object cdsEquipamentosBAIRRO_PROPRIETARIO: TStringField
      DisplayLabel = 'Bairro Proprietario'
      FieldName = 'BAIRRO_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 30
    end
    object cdsEquipamentosLOCALIDADE_PROPRIETARIO: TStringField
      DisplayLabel = 'Localidade Proprietario'
      FieldName = 'LOCALIDADE_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object cdsEquipamentosSETOR_PROPRIETARIO: TStringField
      DisplayLabel = 'Setor Proprietario'
      FieldName = 'SETOR_PROPRIETARIO'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
  end
  object dsEquipamentos: TDataSource
    DataSet = cdsEquipamentos
    Left = 53
    Top = 230
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 212
    Top = 7
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
  object RdpCadEquip: TRDprint
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
    Left = 296
    Top = 6
  end
  object qrLocProprietario: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      '')
    Left = 167
    Top = 90
  end
  object qrLocDepartamento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      'SELECT * FROM DEPTO where ativo = 1')
    Left = 263
    Top = 85
    object qrLocDepartamentoCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Origin = '"DEPTO"."COD_DEPTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLocDepartamentoNOME_DEPTO: TIBStringField
      FieldName = 'NOME_DEPTO'
      Origin = '"DEPTO"."NOME_DEPTO"'
      Size = 30
    end
  end
  object dsLocProprietario: TDataSource
    DataSet = qrLocProprietario
    Left = 165
    Top = 135
  end
  object dsLocDepartamento: TDataSource
    DataSet = qrLocDepartamento
    Left = 265
    Top = 135
  end
  object dspDepreciacao: TDataSetProvider
    DataSet = qrDepreciacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 355
    Top = 135
  end
  object qrDepreciacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      'select * from DEPRECIACAO')
    Left = 355
    Top = 84
  end
  object cdsDepreciacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepreciacao'
    BeforeOpen = cdsEquipamentosBeforeOpen
    Left = 355
    Top = 186
    object cdsDepreciacaoCOD_EQUIP: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'd Equip'
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsDepreciacaoMES: TIntegerField
      DisplayLabel = 'M'#234's'
      FieldName = 'MES'
      Required = True
    end
    object cdsDepreciacaoANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Required = True
    end
    object cdsDepreciacaoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDepreciacaoVALOR_DEPRECI: TFloatField
      DisplayLabel = 'Valor Deprecia'#231#227'o'
      FieldName = 'VALOR_DEPRECI'
      currency = True
    end
    object cdsDepreciacaoDATA_DEPRECI: TDateTimeField
      DisplayLabel = 'Data Deprecia'#231#227'o'
      FieldName = 'DATA_DEPRECI'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsDepreciacaoATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsDepreciacao: TDataSource
    DataSet = cdsDepreciacao
    Left = 355
    Top = 237
  end
  object dspManuEquip: TDataSetProvider
    DataSet = qrManuEquip
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 451
    Top = 135
  end
  object qrManuEquip: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      'select * from MANUTENCAO')
    Left = 451
    Top = 84
  end
  object cdsManuEquip: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManuEquip'
    BeforeOpen = cdsEquipamentosBeforeOpen
    Left = 451
    Top = 186
    object cdsManuEquipCOD_MANUTENCAO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'd Manuten'#231#227'o'
      FieldName = 'COD_MANUTENCAO'
      Required = True
    end
    object cdsManuEquipCOD_EQUIP: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'd Equipamento'
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsManuEquipDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Hist'#243'rico da Manuten'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 128
    end
    object cdsManuEquipCUSTO_MANUTEN: TFloatField
      Tag = 2
      DisplayLabel = 'Valor do Custo'
      FieldName = 'CUSTO_MANUTEN'
      currency = True
    end
    object cdsManuEquipDAT_ENTRADA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Entrada'
      FieldName = 'DAT_ENTRADA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManuEquipDAT_PREV_SAIDA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Prev Saida'
      FieldName = 'DAT_PREV_SAIDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManuEquipCODIGO_F: TIntegerField
      DisplayLabel = 'C'#243'd Fornecedor'
      FieldName = 'CODIGO_F'
    end
    object cdsManuEquipNOME_FORNECEDOR: TStringField
      DisplayLabel = 'Nome do Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      Size = 32
    end
    object cdsManuEquipNUM_DOC_DESP: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'NUM_DOC_DESP'
    end
    object cdsManuEquipDATA_LANCAMENTO: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANCAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManuEquipDATA_ENVIO_CAIXA: TDateTimeField
      DisplayLabel = 'Data Envio Caixa'
      FieldName = 'DATA_ENVIO_CAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsManuEquipCOD_CONTRP: TIntegerField
      Tag = 1
      DisplayLabel = 'Contas a Pagar'
      FieldName = 'COD_CONTRP'
    end
    object cdsManuEquipCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsManuEquipATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsManuEquip: TDataSource
    DataSet = cdsManuEquip
    Left = 451
    Top = 237
  end
  object dspCPManutEq: TDataSetProvider
    DataSet = qrCPManutEq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 555
    Top = 135
  end
  object qrCPManutEq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    AfterCancel = cdsEquipamentosBeforeOpen
    SQL.Strings = (
      'select * from CONTAS_A_PAGAR')
    Left = 555
    Top = 84
  end
  object cdsCPManutEq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCPManutEq'
    BeforeOpen = cdsEquipamentosBeforeOpen
    Left = 555
    Top = 186
    object cdsCPManutEqCOD_CONTRP: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONTRP'
      Required = True
    end
    object cdsCPManutEqNUM_NOTA_NFE: TIntegerField
      FieldName = 'NUM_NOTA_NFE'
    end
    object cdsCPManutEqCOD_FORN_NFE: TIntegerField
      DisplayLabel = 'C'#243'd Fornecedor'
      FieldName = 'COD_FORN_NFE'
    end
    object cdsCPManutEqCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCPManutEqN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num Plano Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsCPManutEqNOME_FOR_CTP: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NOME_FOR_CTP'
      Size = 35
    end
    object cdsCPManutEqDATA_ENT_CTP: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DATA_ENT_CTP'
    end
    object cdsCPManutEqN_DOC_CTP: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_DOC_CTP'
    end
    object cdsCPManutEqVALOR_CTP: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_CTP'
    end
    object cdsCPManutEqSTATUS_CTP: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CTP'
      FixedChar = True
      Size = 10
    end
    object cdsCPManutEqDATQ_CTP: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CTP'
    end
    object cdsCPManutEqNATL_CTP: TStringField
      FieldName = 'NATL_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsCPManutEqDATA_VENC_CTP: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_CTP'
    end
    object cdsCPManutEqTIPO_CTP: TStringField
      FieldName = 'TIPO_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsCPManutEqLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsCPManutEqSUBT_FOR_DUP: TStringField
      FieldName = 'SUBT_FOR_DUP'
      FixedChar = True
      Size = 2
    end
    object cdsCPManutEqTIPO_FOR_DUP: TStringField
      FieldName = 'TIPO_FOR_DUP'
      FixedChar = True
      Size = 2
    end
    object cdsCPManutEqSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsCPManutEqHISTORICO_CTP: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_CTP'
      Size = 100
    end
    object cdsCPManutEqDATA_CXL: TDateTimeField
      FieldName = 'DATA_CXL'
    end
    object cdsCPManutEqTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsCPManutEqN_CHEQ_CTP: TStringField
      FieldName = 'N_CHEQ_CTP'
      FixedChar = True
      Size = 10
    end
    object cdsCPManutEqNOMINAL_CTP: TStringField
      FieldName = 'NOMINAL_CTP'
      Size = 35
    end
    object cdsCPManutEqDT_COMPENS: TDateTimeField
      FieldName = 'DT_COMPENS'
    end
    object cdsCPManutEqCHASSI_CONC: TStringField
      FieldName = 'CHASSI_CONC'
      FixedChar = True
      Size = 17
    end
    object cdsCPManutEqDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object cdsCPManutEqVALOR_PAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VALOR_PAGO'
      currency = True
    end
    object cdsCPManutEqACEITE_CTP: TStringField
      FieldName = 'ACEITE_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsCPManutEqVL_CONTABIL: TFloatField
      FieldName = 'VL_CONTABIL'
    end
    object cdsCPManutEqCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsCPManutEqCPF_CGC_F: TStringField
      FieldName = 'CPF_CGC_F'
      FixedChar = True
      Size = 18
    end
    object cdsCPManutEqCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCPManutEqNOME_BANCO_DUPL: TStringField
      FieldName = 'NOME_BANCO_DUPL'
      Size = 10
    end
    object cdsCPManutEqSTATUS_HONDA: TStringField
      FieldName = 'STATUS_HONDA'
      FixedChar = True
      Size = 10
    end
  end
  object dsCPManutEq: TDataSource
    DataSet = cdsCPManutEq
    Left = 555
    Top = 237
  end
  object qrLocEquip: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      'SELECT * FROM EQUIPAMENTO where ativo = 1')
    Left = 639
    Top = 84
  end
  object dspLocEquip: TDataSetProvider
    DataSet = qrLocEquip
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 635
    Top = 139
  end
  object cdsLocEquip: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocEquip'
    BeforeOpen = cdsEquipamentosBeforeOpen
    Left = 637
    Top = 188
    object cdsLocEquipCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsLocEquipNOM_EQUIP: TStringField
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsLocEquipN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsLocEquipMARCA: TStringField
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsLocEquipMODELO: TStringField
      FieldName = 'MODELO'
      Size = 32
    end
  end
  object dsLocEquip: TDataSource
    DataSet = cdsLocEquip
    Left = 673
    Top = 285
  end
  object qrDadosBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      'SELECT * FROM DADOS_BALANCO WHERE 1=0'
      '')
    Left = 167
    Top = 192
    object qrDadosBalancoCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
      Origin = '"DADOS_BALANCO"."CODSEQ_BALANCO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrDadosBalancoTIPO_BALANCO: TIBStringField
      FieldName = 'TIPO_BALANCO'
      Origin = '"DADOS_BALANCO"."TIPO_BALANCO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object qrDadosBalancoCODIGO_INT_BAL: TIBStringField
      FieldName = 'CODIGO_INT_BAL'
      Origin = '"DADOS_BALANCO"."CODIGO_INT_BAL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object qrDadosBalancoDESC_BALANCO: TIBStringField
      FieldName = 'DESC_BALANCO'
      Origin = '"DADOS_BALANCO"."DESC_BALANCO"'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qrDadosBalancoATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"DADOS_BALANCO"."ATIVO"'
    end
    object qrDadosBalancoSUBTIPO: TIBStringField
      FieldName = 'SUBTIPO'
      Origin = '"DADOS_BALANCO"."SUBTIPO"'
    end
    object qrDadosBalancoSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"DADOS_BALANCO"."SINAL"'
      Size = 1
    end
    object qrDadosBalancoPRAZOINICIAL: TIntegerField
      FieldName = 'PRAZOINICIAL'
      Origin = '"DADOS_BALANCO"."PRAZOINICIAL"'
    end
    object qrDadosBalancoPRAZOFINAL: TIntegerField
      FieldName = 'PRAZOFINAL'
      Origin = '"DADOS_BALANCO"."PRAZOFINAL"'
    end
  end
  object DtDadosDRE: TDataSource
    DataSet = qrDadosBalanco
    Left = 165
    Top = 237
  end
  object qrServicosSugeridos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEquipamentos
    SQL.Strings = (
      
        'select regras_sug.codigo, regras_sug.descricao, regras_sug.INTER' +
        'V_MES_SERV from regras_sug'
      
        'where regras_sug.tipo = '#39'V'#39' and regras_sug.cod_empresa = 1 and r' +
        'egras_sug.ativo = 1')
    Left = 737
    Top = 85
  end
  object dspServicosSugeridos: TDataSetProvider
    DataSet = qrServicosSugeridos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 737
    Top = 132
  end
  object cdsServicosSugeridos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServicosSugeridos'
    BeforeOpen = cdsEquipamentosBeforeOpen
    Left = 737
    Top = 181
    object StringField12: TStringField
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
    object cdsServicosSugeridosINTERV_MES_SERV: TIntegerField
      DisplayLabel = 'Interv Meses'
      FieldName = 'INTERV_MES_SERV'
    end
  end
  object dsServicosSugeridos: TDataSource
    DataSet = cdsServicosSugeridos
    Left = 737
    Top = 230
  end
end
